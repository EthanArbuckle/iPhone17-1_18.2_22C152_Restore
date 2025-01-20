@interface FPDSubtreeChangeDetector
- (BOOL)maintainDirstatWithError:(id *)a3;
- (id)description;
- (id)initAtPath:(id)a3 error:(id *)a4;
- (id)verifyTreeIdentityWithError:(id *)a3;
- (unint64_t)retrieveDirstatGenCountWithError:(id *)a3;
- (unint64_t)retrieveFileIDWithError:(id *)a3;
- (void)dealloc;
@end

@implementation FPDSubtreeChangeDetector

- (unint64_t)retrieveFileIDWithError:(id *)a3
{
  memset(&v6, 0, sizeof(v6));
  if ((fstat(self->_fd, &v6) & 0x80000000) == 0) {
    return v6.st_ino;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[FPDSubtreeChangeDetector retrieveFileIDWithError:]();
  }

  return 0;
}

- (BOOL)maintainDirstatWithError:(id *)a3
{
  uint64_t v7 = 0;
  int v4 = ffsctl(self->_fd, 0x80084A02uLL, &v7, 0);
  if (v4 < 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FPDSubtreeChangeDetector maintainDirstatWithError:]();
    }
  }
  return v4 >= 0;
}

- (unint64_t)retrieveDirstatGenCountWithError:(id *)a3
{
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v6 = 1;
  if ((ffsctl(self->_fd, 0xC0284A20uLL, &v6, 0) & 0x80000000) == 0) {
    return *((void *)&v8 + 1);
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[FPDSubtreeChangeDetector retrieveDirstatGenCountWithError:]();
  }

  return 0;
}

- (id)initAtPath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FPDSubtreeChangeDetector;
  long long v8 = [(FPDSubtreeChangeDetector *)&v17 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v8->_path, a3);
  [v7 fileSystemRepresentation];
  int v10 = fpfs_lp_openat();
  v9->_fd = v10;
  if (v10 < 0)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FPDSubtreeChangeDetector initAtPath:error:]();
    }

    if (a4) {
      *a4 = v14;
    }

    goto LABEL_13;
  }
  uint64_t v11 = [(FPDSubtreeChangeDetector *)v9 retrieveFileIDWithError:a4];
  v9->_fileID = v11;
  if (!v11
    || ![(FPDSubtreeChangeDetector *)v9 maintainDirstatWithError:a4]
    || (uint64_t v12 = [(FPDSubtreeChangeDetector *)v9 retrieveDirstatGenCountWithError:a4],
        (v9->_genCount = v12) == 0))
  {
    close(v9->_fd);
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
LABEL_6:
  v13 = v9;
LABEL_14:

  return v13;
}

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)FPDSubtreeChangeDetector;
  [(FPDSubtreeChangeDetector *)&v4 dealloc];
}

- (id)verifyTreeIdentityWithError:(id *)a3
{
  v5 = -[FPDSubtreeChangeDetector retrieveFileIDWithError:](self, "retrieveFileIDWithError:");
  if (v5)
  {
    uint64_t v6 = v5;
    v5 = [(FPDSubtreeChangeDetector *)self retrieveDirstatGenCountWithError:a3];
    if (v5)
    {
      if (v6 == (void *)self->_fileID && v5 == (void *)self->_genCount)
      {
        v5 = [NSNumber numberWithUnsignedLongLong:v5];
      }
      else if (a3)
      {
        FPSubtreeChangedError();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        *a3 = v7;
      }
      else
      {
        v5 = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p - '%@' %llu@%llu>", objc_opt_class(), self, self->_path, self->_fileID, self->_genCount];
}

- (void).cxx_destruct
{
}

- (void)retrieveFileIDWithError:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] Unable to stat directory at '%@': %s", v3, v4, v5, v6, v7);
}

- (void)maintainDirstatWithError:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] Unable to maintain dirstats at '%@': %s", v3, v4, v5, v6, v7);
}

- (void)retrieveDirstatGenCountWithError:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] Unable to retrieve dirstats at '%@': %s", v3, v4, v5, v6, v7);
}

- (void)initAtPath:error:.cold.1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_0(&dword_1D744C000, v1, v2, "[ERROR] Unable to open directory at '%@': %s", v3, v4, v5, v6, v7);
}

@end