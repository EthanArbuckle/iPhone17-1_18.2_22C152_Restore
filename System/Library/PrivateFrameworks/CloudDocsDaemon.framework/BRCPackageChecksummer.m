@interface BRCPackageChecksummer
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BRCPackageChecksummer)init;
- (NSData)signature;
- (void)done;
@end

@implementation BRCPackageChecksummer

- (NSData)signature
{
  return [(BRCChecksummingOutputStream *)self->_stream signature];
}

- (BRCPackageChecksummer)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRCPackageChecksummer;
  v2 = [(BRCPackageChecksummer *)&v6 init];
  if (v2)
  {
    v3 = [[BRCChecksummingOutputStream alloc] initWithTag:27];
    stream = v2->_stream;
    v2->_stream = v3;

    [(BRCChecksummingOutputStream *)v2->_stream open];
    [(BRCChecksummingOutputStream *)v2->_stream write:"version: 1\n" maxLength:11];
  }
  return v2;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 type] == 4)
  {
LABEL_40:
    BOOL v30 = 1;
    goto LABEL_41;
  }
  if (-[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", (char *)&addItem_error__tags + (int)[v6 type], 1) != -1&& -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:", &addItem_error__nul, 1) != -1)
  {
    id v7 = [v6 path];
    v8 = (const char *)[v7 fileSystemRepresentation];

    if (!v8)
    {
      v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BRCPackageChecksummer addItem:error:]();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 22, @"NULL path for item: %@", v6);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16) {
        goto LABEL_17;
      }
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (!os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        goto LABEL_16;
      }
      v34 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v41 = "-[BRCPackageChecksummer addItem:error:]";
      __int16 v42 = 2080;
      if (!a4) {
        v34 = "(ignored by caller)";
      }
      goto LABEL_54;
    }
    if ([(BRCChecksummingOutputStream *)self->_stream write:v8 maxLength:strlen(v8) + 1] != -1)
    {
      v9 = [v6 quarantineInfo];
      int v10 = objc_msgSend(v9, "br_qtnFlags");

      int v39 = v10;
      if (!v10
        || [(BRCChecksummingOutputStream *)self->_stream write:&v39 maxLength:4] != -1
        && [(BRCChecksummingOutputStream *)self->_stream write:&addItem_error__nul maxLength:1] != -1)
      {
        if ([v6 type] == 3)
        {
          id v11 = [v6 symlinkContent];
          v12 = (const char *)[v11 fileSystemRepresentation];

          if (v12)
          {
            int64_t v13 = [(BRCChecksummingOutputStream *)self->_stream write:v12 maxLength:strlen(v12) + 1];
            goto LABEL_30;
          }
          v32 = brc_bread_crumbs();
          v33 = brc_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
            -[BRCPackageChecksummer addItem:error:]();
          }

          objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 22, @"NULL path for item symlink: %@", v6);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
LABEL_17:
            if (a4) {
              *a4 = v16;
            }

            goto LABEL_39;
          }
          v17 = brc_bread_crumbs();
          v18 = brc_default_log();
          if (!os_log_type_enabled(v18, (os_log_type_t)0x90u))
          {
LABEL_16:

            goto LABEL_17;
          }
          v34 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v41 = "-[BRCPackageChecksummer addItem:error:]";
          __int16 v42 = 2080;
          if (!a4) {
            v34 = "(ignored by caller)";
          }
LABEL_54:
          v43 = v34;
          __int16 v44 = 2112;
          id v45 = v16;
          __int16 v46 = 2112;
          v47 = v17;
          _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          goto LABEL_16;
        }
        if ([v6 type] != 2)
        {
LABEL_31:
          [(BRCChecksummingOutputStream *)self->_stream write:&addItem_error__nl maxLength:1];
          goto LABEL_32;
        }
        if ((![v6 isWritable]
           || [(BRCChecksummingOutputStream *)self->_stream write:&addItem_error__w maxLength:1] != -1)
          && (![v6 isExecutable]
           || [(BRCChecksummingOutputStream *)self->_stream write:&addItem_error__x maxLength:1] != -1)
          && [(BRCChecksummingOutputStream *)self->_stream write:&addItem_error__nul maxLength:1] != -1)
        {
          v19 = [v6 signature];
          uint64_t v20 = [v19 length];

          id v21 = [v6 signature];
          v22 = (unsigned __int8 *)[v21 bytes];

          uint64_t v23 = 2 * v20;
          v24 = (char *)&v38 - ((2 * v20 + 16) & 0xFFFFFFFFFFFFFFF0);
          if (v20)
          {
            v25 = v24 + 1;
            do
            {
              unsigned int v26 = *v22++;
              *(v25 - 1) = a0123456789abcd[(unint64_t)v26 >> 4];
              unsigned char *v25 = a0123456789abcd[v26 & 0xF];
              v25 += 2;
              --v20;
            }
            while (v20);
          }
          v24[v23] = 0;
          int64_t v13 = -[BRCChecksummingOutputStream write:maxLength:](self->_stream, "write:maxLength:");
LABEL_30:
          if (v13 == -1) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
      }
    }
  }
LABEL_32:
  stream = self->_stream;
  if (!stream)
  {
    v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[BRCPackageChecksummer addItem:error:]();
    }

    stream = self->_stream;
  }
  if ([(BRCChecksummingOutputStream *)stream streamStatus] != 7) {
    goto LABEL_40;
  }
  id v16 = [(BRCChecksummingOutputStream *)self->_stream streamError];
  if (v16)
  {
    v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      v35 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v41 = "-[BRCPackageChecksummer addItem:error:]";
      __int16 v42 = 2080;
      if (!a4) {
        v35 = "(ignored by caller)";
      }
      v43 = v35;
      __int16 v44 = 2112;
      id v45 = v16;
      __int16 v46 = 2112;
      v47 = v28;
      _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4)
  {
    id v16 = v16;
    *a4 = v16;
  }
LABEL_39:

  BOOL v30 = 0;
LABEL_41:

  return v30;
}

- (void)done
{
}

- (void).cxx_destruct
{
}

- (void)addItem:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _stream%@", v2, v3, v4, v5, v6);
}

- (void)addItem:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: NULL path for item: %@%@");
}

- (void)addItem:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: NULL path for item symlink content: %@%@");
}

@end