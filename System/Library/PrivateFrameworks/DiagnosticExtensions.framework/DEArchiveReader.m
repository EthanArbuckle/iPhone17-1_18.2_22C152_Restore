@interface DEArchiveReader
- (DEArchiveReader)initWithURL:(id)a3;
- (id)listContainedPaths;
- (void)closeArchive;
@end

@implementation DEArchiveReader

- (DEArchiveReader)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEArchiveReader;
  v5 = [(DEArchiveReader *)&v11 init];
  if (!v5) {
    goto LABEL_6;
  }
  v5->_archive = (archive *)archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  id v6 = [v4 path];
  [v6 UTF8String];
  int open_filename = archive_read_open_filename();

  if (open_filename)
  {
    v8 = +[DELogging fwHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(DEArchiveReader *)(uint64_t)v4 initWithURL:v8];
    }

    v9 = 0;
  }
  else
  {
LABEL_6:
    v9 = v5;
  }

  return v9;
}

- (id)listContainedPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (!archive_read_next_header())
  {
    v3 = [NSString stringWithCString:archive_entry_pathname() encoding:4];
    if (v3) {
      [v2 addObject:v3];
    }
  }
  id v4 = (void *)[v2 copy];

  return v4;
}

- (void)closeArchive
{
  if (self->_archive)
  {
    archive_read_close();
    archive = self->_archive;
    MEMORY[0x1F417E110](archive);
  }
}

- (void)initWithURL:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Error opening archive at path %@ %d", (uint8_t *)&v3, 0x12u);
}

@end