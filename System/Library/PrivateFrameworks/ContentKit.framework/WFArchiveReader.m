@interface WFArchiveReader
- (WFArchiveReader)initWithArchiveFile:(id)a3 error:(id *)a4;
- (archive)archive;
- (id)extractArchiveToDestinationURL:(id)a3 error:(id *)a4;
@end

@implementation WFArchiveReader

- (archive)archive
{
  return self->_archive;
}

- (id)extractArchiveToDestinationURL:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27 = objc_opt_new();
  uint64_t v25 = *MEMORY[0x263F07F70];
  uint64_t v24 = *MEMORY[0x263F08320];
  while (1)
  {
    int next_header = archive_read_next_header();
    if (next_header) {
      break;
    }
    v6 = WFPathFromArchiveEntry();
    v7 = [v6 lastPathComponent];
    if (([v7 hasPrefix:@"__MACOSX"] & 1) != 0
      || ([v7 lastPathComponent],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@".DS_Store"],
          v8,
          v9))
    {
      archive_read_data_skip();
      goto LABEL_23;
    }
    v10 = getWFLibArchiveLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFArchiveReader extractArchiveToDestinationURL:error:]";
      __int16 v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_DEFAULT, "%s Reading archive entry for %@", buf, 0x16u);
    }

    if (!v6)
    {
      v12 = 0;
LABEL_31:
      if (a4)
      {
        v20 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = v24;
        v21 = [NSString stringWithFormat:@"The item couldn't be extracted because the file path \"%@\" is invalid.", v6];
        v29 = v21;
        v22 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        *a4 = [v20 errorWithDomain:v25 code:514 userInfo:v22];
      }
LABEL_35:
      v18 = v27;

      id v19 = 0;
      goto LABEL_36;
    }
    v11 = [v4 URLByAppendingPathComponent:v6];
    v12 = v11;
    if (!v11 || (objc_msgSend(v11, "wf_proposedFileIsContainedByDirectoryAtURL:", v4) & 1) == 0) {
      goto LABEL_31;
    }
    id v13 = [v12 path];
    [v13 fileSystemRepresentation];
    archive_entry_set_pathname();

    if (archive_read_extract())
    {
      if (a4)
      {
        WFLastArchiveError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_35;
    }
    v14 = [v6 pathComponents];
    v15 = [v14 firstObject];
    if ([v15 isEqualToString:@"/"])
    {
      if ((unint64_t)[v14 count] < 2)
      {

        v15 = 0;
        goto LABEL_21;
      }
      uint64_t v16 = [v14 objectAtIndex:1];

      v15 = (void *)v16;
    }
    if (v15)
    {
      v17 = [v4 URLByAppendingPathComponent:v15];
      if (v17)
      {
        if (([v27 containsObject:v17] & 1) == 0) {
          [v27 addObject:v17];
        }
      }
      goto LABEL_22;
    }
LABEL_21:
    v17 = 0;
LABEL_22:

LABEL_23:
  }
  if (next_header == 1)
  {
    v18 = v27;
    id v19 = v27;
  }
  else
  {
    if (a4)
    {
      WFLastArchiveError();
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
    v18 = v27;
  }
LABEL_36:

  return v19;
}

- (WFArchiveReader)initWithArchiveFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFArchiveReader;
  v7 = [(WFArchiveReader *)&v23 init];
  if (v7)
  {
    v7->_archive = (archive *)archive_read_new();
    MEMORY[0x2166CF220]();
    v8 = [v6 filename];
    int v9 = [v8 pathExtension];
    if (([v9 isEqualToString:@"gz"] & 1) == 0
      && ![v9 isEqualToString:@"xz"])
    {
      goto LABEL_6;
    }
    v10 = [v8 stringByDeletingPathExtension];
    v11 = [v10 pathExtension];
    if ([v11 length])
    {
      v12 = (void *)MEMORY[0x263F852B8];
      id v13 = [v8 stringByDeletingPathExtension];
      v14 = [v12 typeFromFilename:v13];
      char v15 = [v14 conformsToUTType:*MEMORY[0x263F1D9A8]];

      if (v15)
      {
LABEL_6:
        archive_read_support_format_all();
        goto LABEL_10;
      }
    }
    else
    {
    }
    archive_read_support_format_raw();
LABEL_10:
    uint64_t v17 = [v6 representationType];
    if (v17 == 1)
    {
      id v19 = [v6 fileURL];
      id v20 = [v19 path];
      [v20 fileSystemRepresentation];
      int open_filename = archive_read_open_filename();

      if (open_filename)
      {
        if (a4)
        {
          WFLastArchiveError();
          uint64_t v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

          goto LABEL_23;
        }
LABEL_19:
        uint64_t v16 = 0;
        goto LABEL_22;
      }
    }
    else if (!v17)
    {
      id v18 = [v6 data];
      [v18 bytes];
      [v18 length];
      if (archive_read_open_memory())
      {
        if (a4)
        {
          WFLastArchiveError();
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_19;
      }
    }
    uint64_t v16 = v7;
    goto LABEL_22;
  }
  uint64_t v16 = 0;
LABEL_23:

  return v16;
}

@end