@interface WFArchiveWriter
- (BOOL)finishWithError:(id *)a3;
- (BOOL)writeArchiveEntry:(id)a3 error:(id *)a4;
- (WFArchiveWriter)initWithDestinationURL:(id)a3 format:(id)a4 error:(id *)a5;
- (archive)archive;
- (void)dealloc;
@end

@implementation WFArchiveWriter

- (archive)archive
{
  return self->_archive;
}

- (void)dealloc
{
  archive_write_finish();
  v3.receiver = self;
  v3.super_class = (Class)WFArchiveWriter;
  [(WFArchiveWriter *)&v3 dealloc];
}

- (BOOL)finishWithError:(id *)a3
{
  int v4 = archive_write_close();
  int v5 = v4;
  if (a3 && v4)
  {
    WFLastArchiveError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 == 0;
}

- (BOOL)writeArchiveEntry:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [v5 entry];
  archive_write_header();
  v6 = [v5 dataProvider];
  if (v6)
  {
    v7 = getWFLibArchiveLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = WFPathFromArchiveEntry();
      int v19 = 136315394;
      v20 = "-[WFArchiveWriter writeArchiveEntry:error:]";
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_DEFAULT, "%s Writing archive entry for %@", (uint8_t *)&v19, 0x16u);
    }
    v9 = v6[2](v6);
    if (v9)
    {
      unint64_t v10 = archive_entry_size();
      unint64_t v11 = v10;
      if (v10 >= 0x4000) {
        size_t v12 = 0x4000;
      }
      else {
        size_t v12 = v10;
      }
      v13 = malloc_type_malloc(v12, 0x8477470uLL);
      [v9 open];
      unint64_t v14 = 0;
      while (v14 < v11)
      {
        uint64_t v15 = [v9 read:v13 maxLength:v12];
        if (v15 < 1) {
          break;
        }
        v14 += v15;
        if (archive_write_data() == -1)
        {
          if (a4)
          {
            WFLastArchiveError();
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          free(v13);
          goto LABEL_20;
        }
      }
      free(v13);
      v17 = [v9 streamError];

      if (!v17)
      {
        [v9 close];
        BOOL v16 = 1;
        goto LABEL_21;
      }
      if (a4)
      {
        *a4 = [v9 streamError];
      }
      [v9 close];
    }
LABEL_20:
    BOOL v16 = 0;
LABEL_21:
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (WFArchiveWriter)initWithDestinationURL:(id)a3 format:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    __int16 v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFLibArchive.m", 208, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFArchiveWriter;
  unint64_t v11 = [(WFArchiveWriter *)&v22 init];
  if (!v11) {
    goto LABEL_23;
  }
  v11->_archive = (archive *)archive_write_new();
  id v12 = v10;
  if (([v12 isEqualToString:@"gz"] & 1) != 0
    || [v12 isEqualToString:@"tar.gz"])
  {
    int v13 = archive_write_set_compression_gzip();
  }
  else if (([v12 isEqualToString:@"xz"] & 1) != 0 {
         || [v12 isEqualToString:@"tar.xz"])
  }
  {
    int v13 = archive_write_set_compression_xz();
  }
  else
  {
    if (([v12 isEqualToString:@"tar.bz2"] & 1) == 0)
    {

      goto LABEL_15;
    }
    int v13 = archive_write_set_compression_bzip2();
  }
  int v14 = v13;

  if (v14)
  {

    goto LABEL_21;
  }
LABEL_15:
  id v15 = v12;
  if (([v15 isEqualToString:@"tar"] & 1) == 0
    && ([v15 isEqualToString:@"tar.gz"] & 1) == 0
    && ([v15 isEqualToString:@"tar.bz2"] & 1) == 0
    && ([v15 isEqualToString:@"tar.xz"] & 1) == 0
    && ([v15 isEqualToString:@"zip"] & 1) == 0
    && ([v15 isEqualToString:@"cpio"] & 1) == 0)
  {
    [v15 isEqualToString:@"iso"];
  }

  int v16 = archive_write_set_format();
  if (!v16)
  {
    id v17 = [v9 path];
    [v17 fileSystemRepresentation];
    int v18 = archive_write_open_filename();

    if (!v18)
    {
      int v19 = v11;
      goto LABEL_24;
    }
  }
LABEL_21:
  if (!a5)
  {
LABEL_23:
    int v19 = 0;
    goto LABEL_24;
  }
  WFLastArchiveError();
  int v19 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v19;
}

@end