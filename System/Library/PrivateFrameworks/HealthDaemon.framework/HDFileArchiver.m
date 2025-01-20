@interface HDFileArchiver
- (BOOL)compressFileAtURL:(id)a3 to:(id)a4 strippingPathPrefix:(id)a5 error:(id *)a6;
- (BOOL)decompressArchiveAt:(id)a3 to:(id)a4 error:(id *)a5;
- (HDFileArchiver)init;
- (id).cxx_construct;
- (id)_errorFromReaderWithContext:(uint64_t)a1;
- (uint64_t)_reset;
- (void)dealloc;
@end

@implementation HDFileArchiver

- (void)dealloc
{
  -[HDFileArchiver _reset]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HDFileArchiver;
  [(HDFileArchiver *)&v3 dealloc];
}

- (uint64_t)_reset
{
  if (result)
  {
    v1 = (void *)result;
    v2 = *(void **)(result + 8);
    *(void *)(result + 8) = 0;

    objc_super v3 = (void *)v1[2];
    v1[2] = 0;

    v4 = (void *)v1[3];
    v1[3] = 0;

    if (v1[4])
    {
      archive_read_free();
      v1[4] = 0;
    }
    result = v1[5];
    if (result)
    {
      result = archive_write_free();
      v1[5] = 0;
    }
  }
  return result;
}

- (HDFileArchiver)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDFileArchiver;
  v2 = [(HDFileArchiver *)&v7 init];
  if (v2)
  {
    std::vector<unsigned char>::vector(&v5, 0x10000uLL);
    begin = v2->_nullBuffer.__begin_;
    if (begin)
    {
      v2->_nullBuffer.__end_ = begin;
      operator delete(begin);
      v2->_nullBuffer.__begin_ = 0;
      v2->_nullBuffer.__end_ = 0;
      v2->_nullBuffer.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v2->_nullBuffer.__begin_ = v5;
    v2->_nullBuffer.__end_cap_.__value_ = v6;
  }
  return v2;
}

- (id)_errorFromReaderWithContext:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = archive_errno();
    if ((int)v4 < 1)
    {
      v10 = [NSString stringWithFormat:@"%@: Internal libarchive error %s", v3, archive_error_string()];
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, v10);
    }
    else
    {
      long long v5 = [NSString stringWithFormat:@"%@: %s (errno = %d)", v3, archive_error_string(), v4];
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      objc_super v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13 = v5;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v9 = [v7 errorWithDomain:*MEMORY[0x1E4F28798] code:v4 userInfo:v8];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)compressFileAtURL:(id)a3 to:(id)a4 strippingPathPrefix:(id)a5 error:(id *)a6
{
  *(void *)((char *)&v48[2] + 2) = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v11 = a4;
  id v43 = a5;
  -[HDFileArchiver _reset]((uint64_t)self);
  objc_storeStrong((id *)&self->_sourceURL, a3);
  p_prefixURL = &self->_prefixURL;
  objc_storeStrong((id *)&self->_prefixURL, a5);
  self->_reader = (archive *)archive_read_disk_new();
  archive_read_disk_set_metadata_filter_callback();
  [(NSURL *)self->_sourceURL fileSystemRepresentation];
  if (archive_read_disk_open())
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"Failed to open source: %s", archive_error_string());
    -[HDFileArchiver _reset]((uint64_t)self);
    BOOL v13 = 0;
  }
  else
  {
    self->_writer = (archive *)archive_write_new();
    archive_write_add_filter_gzip();
    archive_write_set_format_pax_restricted();
    [v11 fileSystemRepresentation];
    archive_write_open_filename();
    while (1)
    {
      archive_entry_new();
      int next_header2 = archive_read_next_header2();
      int v15 = next_header2;
      if (next_header2)
      {
        if (next_header2 == 1)
        {
          BOOL v13 = 1;
          goto LABEL_56;
        }
        _HKInitializeLogging();
        uint64_t v16 = HKLogInfrastructure();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v35 = archive_errno();
          uint64_t v36 = archive_error_string();
          *(_DWORD *)buf = 138543874;
          v46 = self;
          __int16 v47 = 1024;
          LODWORD(v48[0]) = v35;
          WORD2(v48[0]) = 2080;
          *(void *)((char *)v48 + 6) = v36;
          _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read next file from disk during compression: %d: %s", buf, 0x1Cu);
        }

        if (v15 == -25 || v15 == -30)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 100, @"Failed to read next file from disk during compression: %s", archive_error_string());
          goto LABEL_55;
        }
        if (v15 <= -21)
        {
          _HKInitializeLogging();
          v17 = HKLogInfrastructure();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "Skipping bad entry", buf, 2u);
          }

          goto LABEL_47;
        }
      }
      if (*p_prefixURL)
      {
        v18 = (const char *)archive_entry_pathname();
        if (!v18) {
          goto LABEL_47;
        }
        v19 = [(NSURL *)*p_prefixURL fileSystemRepresentation];
        _HKInitializeLogging();
        v20 = HKLogInfrastructure();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v46 = (HDFileArchiver *)v19;
          __int16 v47 = 2080;
          v48[0] = v18;
          _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Stripping %s from %s", buf, 0x16u);
        }

        if (v19)
        {
          size_t v21 = strlen(v19);
          if (!strncmp(v18, v19, v21))
          {
            size_t v22 = strlen(v19);
            if (v18[v22] == 47) {
              v18 += v22 + 1;
            }
            else {
              v18 += v22;
            }
          }
        }
        if (!*v18) {
          goto LABEL_47;
        }
        archive_entry_copy_pathname();
      }
      _HKInitializeLogging();
      v23 = HKLogInfrastructure();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = archive_entry_pathname();
        *(_DWORD *)buf = 136315138;
        v46 = (HDFileArchiver *)v24;
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "Writing entry %s", buf, 0xCu);
      }

      if ((int)archive_write_header() < -20) {
        break;
      }
      if (archive_entry_size() < 1) {
        goto LABEL_47;
      }
      for (uint64_t i = 0; ; i += v32)
      {
        int data_block = archive_read_data_block();
        if (data_block)
        {
          if (data_block >= -20) {
            goto LABEL_47;
          }
          v37 = @"Failed to read data block for entry %s: %s";
          goto LABEL_51;
        }
        uint64_t v27 = -i;
        BOOL v28 = i >= 0 || v27 < 1;
        if (!v28) {
          break;
        }
LABEL_42:
        uint64_t v32 = archive_write_data();
        if (v32 < 0)
        {
          v37 = @"Failed to write data block for entry %s: %s";
LABEL_51:
          v38 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v39 = archive_entry_pathname();
          objc_msgSend(v38, "hk_assignError:code:format:", a6, 100, v37, v39, archive_error_string());
          goto LABEL_55;
        }
      }
      while (1)
      {
        begin = self->_nullBuffer.__begin_;
        if (self->_nullBuffer.__end_ - begin >= v27) {
          v30 = (char *)v27;
        }
        else {
          v30 = (char *)(self->_nullBuffer.__end_ - begin);
        }
        uint64_t v31 = archive_write_data();
        if (v31 < 0)
        {
          v37 = @"Failed to write sparse block for entry %s: %s";
          goto LABEL_51;
        }
        if (v31 < (unint64_t)v30) {
          break;
        }
        i += v31;
        BOOL v28 = v27 <= v31;
        v27 -= v31;
        if (v28) {
          goto LABEL_42;
        }
      }
      _HKInitializeLogging();
      v33 = HKLogInfrastructure();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = archive_entry_pathname();
        *(_DWORD *)buf = 138543618;
        v46 = self;
        __int16 v47 = 2080;
        v48[0] = v34;
        _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Truncated write for %s; file may have grown while being archived.",
          buf,
          0x16u);
      }

LABEL_47:
      archive_entry_free();
    }
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = archive_entry_pathname();
    objc_msgSend(v40, "hk_assignError:code:format:", a6, 100, @"Failed to write entry header for %s: %s", v41, archive_error_string());
LABEL_55:
    BOOL v13 = 0;
LABEL_56:
    archive_entry_free();
    -[HDFileArchiver _reset]((uint64_t)self);
  }

  return v13;
}

- (BOOL)decompressArchiveAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[HDFileArchiver _reset]((uint64_t)self);
  objc_storeStrong((id *)&self->_destinationDirectoryURL, a4);
  self->_reader = (archive *)archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  id v10 = v8;
  [v10 fileSystemRepresentation];
  if (archive_read_open_filename())
  {
    -[HDFileArchiver _errorFromReaderWithContext:]((uint64_t)self, @"Failed to open source during decompression");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (v11)
    {
      if (a5) {
        *a5 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    -[HDFileArchiver _reset]((uint64_t)self);
    BOOL v21 = 0;
    goto LABEL_29;
  }
  self->_writer = (archive *)archive_write_disk_new();
  archive_write_disk_set_options();
  while (1)
  {
    int next_header = archive_read_next_header();
    if (next_header != -10) {
      break;
    }
    int v20 = 2;
LABEL_17:
    if (v20 == 1)
    {
      BOOL v21 = 0;
      goto LABEL_28;
    }
  }
  if (!next_header)
  {
    destinationDirectoryURL = self->_destinationDirectoryURL;
    int v15 = [NSString stringWithUTF8String:archive_entry_pathname()];
    uint64_t v16 = [(NSURL *)destinationDirectoryURL URLByAppendingPathComponent:v15];

    id v17 = v16;
    [v17 fileSystemRepresentation];
    archive_entry_copy_pathname();
    if (archive_read_extract2())
    {
      -[HDFileArchiver _errorFromReaderWithContext:]((uint64_t)self, @"Failed to extract next entry in archive");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        if (a5) {
          *a5 = v18;
        }
        else {
          _HKLogDroppedError();
        }
      }

      int v20 = 1;
    }
    else
    {
      int v20 = 0;
    }

    goto LABEL_17;
  }
  if (next_header == 1)
  {
    BOOL v21 = 1;
  }
  else
  {
    -[HDFileArchiver _errorFromReaderWithContext:]((uint64_t)self, @"Failed to read next header entry in archive");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if (a5) {
        *a5 = v22;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v21 = 0;
  }
LABEL_28:
  -[HDFileArchiver _reset]((uint64_t)self);
LABEL_29:

  return v21;
}

- (void).cxx_destruct
{
  begin = self->_nullBuffer.__begin_;
  if (begin)
  {
    self->_nullBuffer.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_destinationDirectoryURL, 0);
  objc_storeStrong((id *)&self->_prefixURL, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end