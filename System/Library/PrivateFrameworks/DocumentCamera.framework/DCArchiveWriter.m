@interface DCArchiveWriter
- (BOOL)finish:(id *)a3;
- (BOOL)flatten;
- (BOOL)open:(id *)a3;
- (BOOL)usesCompression;
- (BOOL)writeURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5;
- (BOOL)writeURLs:(id)a3 error:(id *)a4;
- (DCArchiveWriter)initWithDestinationURL:(id)a3 baseURL:(id)a4;
- (NSString)basePath;
- (NSString)flattenFolderName;
- (NSURL)destinationURL;
- (void)dealloc;
- (void)setBasePath:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setFlatten:(BOOL)a3;
- (void)setFlattenFolderName:(id)a3;
- (void)setUsesCompression:(BOOL)a3;
@end

@implementation DCArchiveWriter

- (DCArchiveWriter)initWithDestinationURL:(id)a3 baseURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DCArchiveWriter;
  v9 = [(DCArchiveWriter *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationURL, a3);
    v11 = [v8 path];
    uint64_t v12 = [v11 stringByStandardizingPath];
    basePath = v10->_basePath;
    v10->_basePath = (NSString *)v12;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_archive) {
    [(DCArchiveWriter *)self finish:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)DCArchiveWriter;
  [(DCArchiveWriter *)&v3 dealloc];
}

- (BOOL)writeURLs:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (self->_archive || [(DCArchiveWriter *)self open:a4])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v27;
      uint64_t v9 = *MEMORY[0x263EFF6A8];
      id v22 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v25 = 0;
          int v12 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v25, v9, a4, v22);
          id v13 = v25;
          if (!v12) {
            goto LABEL_24;
          }
          v14 = [v11 path];
          objc_super v15 = [v14 stringByStandardizingPath];

          if (![v13 BOOLValue]
            || ([(DCArchiveWriter *)self basePath],
                v16 = objc_claimAutoreleasedReturnValue(),
                char v17 = [v15 isEqualToString:v16],
                v16,
                (v17 & 1) == 0))
          {
            if (!-[DCArchiveWriter writeURL:isDirectory:error:](self, "writeURL:isDirectory:error:", v11, [v13 BOOLValue], a4))
            {

LABEL_24:
LABEL_25:
              BOOL v20 = 0;
              id v6 = v22;
              goto LABEL_26;
            }
          }
          if ([v13 BOOLValue])
          {
            v18 = [MEMORY[0x263F08850] defaultManager];
            v19 = [v18 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:0 error:a4];

            LODWORD(v18) = [(DCArchiveWriter *)self writeURLs:v19 error:a4];
            if (!v18) {
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        BOOL v20 = 1;
        id v6 = v22;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v20 = 1;
    }
LABEL_26:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)finish:(id *)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  int v5 = archive_write_finish();
  int v6 = v5;
  if (a3 && v5)
  {
    uint64_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v14[0] = @"Unable to create archive";
    uint64_t v9 = *MEMORY[0x263F08338];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", archive_error_string(), v8, v9, @"Unable to create archive");
    v14[1] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:2];
    *a3 = [v7 errorWithDomain:@"com.apple.documentcamera" code:v6 userInfo:v11];
  }
  self->_archive = 0;
  return v6 == 0;
}

- (BOOL)open:(id *)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  self->_archive = (archive *)archive_write_new();
  if ([(DCArchiveWriter *)self usesCompression]) {
    int v5 = archive_write_set_compression_bzip2();
  }
  else {
    int v5 = archive_write_set_compression_none();
  }
  int v6 = v5;
  if (!v5)
  {
    int v7 = [(DCArchiveWriter *)self usesCompression]
       ? archive_write_set_format_pax()
       : archive_write_set_format_zip();
    int v6 = v7;
    if (!v7)
    {
      uint64_t v8 = [(DCArchiveWriter *)self destinationURL];
      id v9 = [v8 path];
      [v9 fileSystemRepresentation];
      int v6 = archive_write_open_filename();
    }
  }
  if (a3 && v6)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v17[0] = @"Unable to create archive";
    uint64_t v12 = *MEMORY[0x263F08338];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", archive_error_string(), v11, v12, @"Unable to create archive");
    v17[1] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:2];
    *a3 = [v10 errorWithDomain:@"com.apple.documentcamera" code:v6 userInfo:v14];
  }
  return v6 == 0;
}

- (BOOL)writeURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v43 = 0;
  [v7 getResourceValue:&v43 forKey:*MEMORY[0x263EFF700] error:a5];
  id v8 = v43;
  int v9 = [v8 BOOLValue];
  id v42 = 0;
  [v7 getResourceValue:&v42 forKey:*MEMORY[0x263EFF6A8] error:a5];
  id v10 = v42;
  if (!-[DCArchiveWriter flatten](self, "flatten") || ([v10 BOOLValue] & 1) == 0)
  {
    uint64_t v12 = [v7 path];
    uint64_t v13 = [v12 stringByStandardizingPath];

    memset(&v41, 0, sizeof(v41));
    id v14 = v13;
    if (lstat((const char *)[v14 fileSystemRepresentation], &v41))
    {
      if (a5)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
        BOOL v11 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

        goto LABEL_30;
      }
LABEL_23:
      BOOL v11 = 0;
      goto LABEL_29;
    }
    if ([v14 hasPrefix:@"/private/var/folders/"])
    {
      objc_super v15 = [v14 substringFromIndex:objc_msgSend(@"/private/var/folders/", "length")];
      uint64_t v16 = [@"/var/folders/" stringByAppendingString:v15];

      id v14 = (id)v16;
    }
    if ([(DCArchiveWriter *)self flatten])
    {
      char v17 = [(DCArchiveWriter *)self flattenFolderName];
      uint64_t v18 = [(__CFString *)v17 length];
      v19 = @"archive";
      if (v18) {
        v19 = v17;
      }
      id v39 = v8;
      id v20 = v10;
      int v21 = v9;
      id v22 = v19;
      uint64_t v23 = [v14 lastPathComponent];
      uint64_t v24 = [(__CFString *)v22 stringByAppendingPathComponent:v23];

      int v9 = v21;
      id v10 = v20;
      id v8 = v39;

      id v14 = (id)v23;
    }
    else
    {
      id v25 = [(DCArchiveWriter *)self basePath];
      int v26 = [v14 hasPrefix:v25];

      if (!v26)
      {
LABEL_16:
        id v14 = v14;
        [v14 fileSystemRepresentation];
        archive_entry_new();
        archive_entry_copy_stat();
        if (v9)
        {
          char v40 = v9;
          id v27 = [v7 path];
          ssize_t v28 = readlink((const char *)[v27 fileSystemRepresentation], v46, 0x3FFuLL);

          if (v28 != -1)
          {
            v46[v28] = 0;
            archive_entry_set_symlink();
          }
          LOBYTE(v9) = v40;
        }
        archive_entry_set_pathname();
        int v29 = archive_write_header();
        if (!v29)
        {
          if ((v9 & 1) == 0)
          {
            id v36 = [v7 path];
            int v37 = open((const char *)[v36 fileSystemRepresentation], 0);

            if (read(v37, v46, 0x2000uLL) >= 1)
            {
              do
                archive_write_data();
              while (read(v37, v46, 0x2000uLL) > 0);
            }
            close(v37);
          }
          archive_entry_free();
          BOOL v11 = 1;
          goto LABEL_29;
        }
        if (a5)
        {
          v30 = (void *)MEMORY[0x263F087E8];
          uint64_t v31 = v29;
          uint64_t v32 = *MEMORY[0x263F08320];
          v45[0] = @"Unable to write archive header";
          uint64_t v33 = *MEMORY[0x263F08338];
          v44[0] = v32;
          v44[1] = v33;
          v34 = objc_msgSend(NSString, "stringWithFormat:", @"%s", archive_error_string());
          v45[1] = v34;
          v35 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
          *a5 = [v30 errorWithDomain:@"com.apple.documentcamera" code:v31 userInfo:v35];
        }
        goto LABEL_23;
      }
      char v17 = [(DCArchiveWriter *)self basePath];
      uint64_t v24 = objc_msgSend(v14, "substringFromIndex:", -[__CFString length](v17, "length"));
    }

    id v14 = (id)v24;
    goto LABEL_16;
  }
  BOOL v11 = 1;
LABEL_30:

  return v11;
}

- (BOOL)usesCompression
{
  return self->_usesCompression;
}

- (void)setUsesCompression:(BOOL)a3
{
  self->_usesCompression = a3;
}

- (BOOL)flatten
{
  return self->_flatten;
}

- (void)setFlatten:(BOOL)a3
{
  self->_flatten = a3;
}

- (NSString)flattenFolderName
{
  return self->_flattenFolderName;
}

- (void)setFlattenFolderName:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSString)basePath
{
  return self->_basePath;
}

- (void)setBasePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);

  objc_storeStrong((id *)&self->_flattenFolderName, 0);
}

@end