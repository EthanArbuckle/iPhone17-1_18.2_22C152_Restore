@interface _KSFileFile
+ (BOOL)supportsSecureCoding;
+ (int)protectionFromURL:(id)a3;
- (_KSFileFile)initWithCoder:(id)a3;
- (_KSFileFile)initWithURL:(id)a3;
- (id)URL;
- (id)contents;
- (id)description;
- (id)lastModified;
- (unint64_t)size;
- (void)consistencyCheck;
- (void)encodeWithCoder:(id)a3;
- (void)loadAttributesFromURL:(id)a3;
- (void)restoreToPath:(id)a3;
- (void)saveAttributesToURL:(id)a3;
- (void)saveTo:(id)a3;
@end

@implementation _KSFileFile

+ (int)protectionFromURL:(id)a3
{
  int v3 = open_dprotected_np((const char *)[a3 fileSystemRepresentation], 256, 0, 1);
  if (v3 < 0) {
    return -1;
  }
  int v4 = v3;
  int v5 = fcntl(v3, 63);
  close(v4);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_KSFileFile)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_KSFileFile;
  int v5 = [(_KSFileEntry *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_offset = (int)[v4 decodeIntForKey:@"offset"];
    v5->_size = (int)[v4 decodeIntForKey:@"size"];
    v5->_protectionClass = [v4 decodeIntForKey:@"class"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastmodified"];
    lastModified = v5->_lastModified;
    v5->_lastModified = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_KSFileFile;
  id v4 = a3;
  [(_KSFileEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", -[_KSFileEntry addBlobToFile:](self, "addBlobToFile:", self, v5.receiver, v5.super_class), @"offset");
  [v4 encodeInt:LODWORD(self->_size) forKey:@"size"];
  [v4 encodeInt:self->_protectionClass forKey:@"class"];
  [v4 encodeObject:self->_lastModified forKey:@"lastmodified"];
}

- (_KSFileFile)initWithURL:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 lastPathComponent];
  v11.receiver = self;
  v11.super_class = (Class)_KSFileFile;
  v7 = [(_KSFileEntry *)&v11 initWithName:v6];

  if (v7)
  {
    p_url = &v7->_url;
    objc_storeStrong((id *)&v7->_url, a3);
    memset(&v10, 0, sizeof(v10));
    if (stat([(NSURL *)v7->_url fileSystemRepresentation], &v10) == -1) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263F08038], @"Can't stat %@", *p_url format];
    }
    v7->_size = v10.st_size;
    [(_KSFileFile *)v7 loadAttributesFromURL:*p_url];
  }

  return v7;
}

- (void)loadAttributesFromURL:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_KSFileFile;
  id v4 = a3;
  [(_KSFileEntry *)&v9 loadAttributesFromURL:v4];
  self->_protectionClass = [(id)objc_opt_class() protectionFromURL:self->_url];
  id v8 = 0;
  int v5 = [v4 getResourceValue:&v8 forKey:*MEMORY[0x263EFF5F8] error:0];

  id v6 = v8;
  id v7 = v8;
  if (v5) {
    objc_storeStrong((id *)&self->_lastModified, v6);
  }
}

- (void)saveAttributesToURL:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_KSFileFile;
  id v4 = a3;
  [(_KSFileEntry *)&v5 saveAttributesToURL:v4];
  objc_msgSend(v4, "setResourceValue:forKey:error:", self->_lastModified, *MEMORY[0x263EFF5F8], 0, v5.receiver, v5.super_class);
}

- (void)saveTo:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_KSFileFile *)self contents];
  if (v5)
  {
    id v6 = v4;
    int v7 = open_dprotected_np((const char *)[v6 fileSystemRepresentation], 1573, self->_protectionClass, 0, 384);
    if (v7 < 0)
    {
      objc_super v11 = KSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_KSFileFile saveTo:]();
      }
    }
    else
    {
      int v8 = v7;
      id v9 = v5;
      write(v8, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
      close(v8);
      [(_KSFileFile *)self saveAttributesToURL:v6];
    }
  }
  else
  {
    stat v10 = KSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_KSFileFile saveTo:]();
    }
  }
}

- (id)contents
{
  url = self->_url;
  if (url)
  {
    int v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:url options:1 error:0];
  }
  else if (self->super._fileBlob)
  {
    int v3 = -[NSData subdataWithRange:](self->super._fileBlob, "subdataWithRange:", self->_offset, self->_size);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@: Don't have URL or Data", self format];
    int v3 = 0;
  }
  return v3;
}

- (unint64_t)size
{
  return self->_size;
}

- (id)lastModified
{
  return self->_lastModified;
}

- (id)URL
{
  url = self->_url;
  if (url)
  {
    int v3 = url;
    goto LABEL_7;
  }
  if (self->super._fileBlob)
  {
    int v3 = [(_KSFileEntry *)self temporaryFileNameForType:@"UserWordStore"];
    objc_super v5 = -[NSData subdataWithRange:](self->super._fileBlob, "subdataWithRange:", self->_offset, self->_size);
    char v6 = [v5 writeToURL:v3 atomically:1];

    if (v6) {
      goto LABEL_7;
    }
  }
  int v3 = 0;
LABEL_7:
  return v3;
}

- (id)description
{
  int v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_KSFileFile;
  id v4 = [(_KSFileEntry *)&v11 description];
  unint64_t v5 = [(_KSFileFile *)self size];
  unint64_t v6 = v5;
  url = self->_url;
  if (url)
  {
    int v8 = [v3 stringWithFormat:@"<%@; %i bytes; %@>", v4, v5, url];
  }
  else
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"serialised (offset %i)", self->_offset);
    int v8 = [v3 stringWithFormat:@"<%@; %i bytes; %@>", v4, v6, v9];
  }
  return v8;
}

- (void)consistencyCheck
{
  v13.receiver = self;
  v13.super_class = (Class)_KSFileFile;
  [(_KSFileEntry *)&v13 consistencyCheck];
  url = self->_url;
  if (url)
  {
    if (![(NSURL *)url checkResourceIsReachableAndReturnError:0]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ refers to URL %@ but it is inaccessible", self, self->_url format];
    }
  }
  else
  {
    fileBlob = self->super._fileBlob;
    if (fileBlob)
    {
      unint64_t v5 = [(NSData *)fileBlob length];
      unint64_t offset = self->_offset;
      unint64_t size = self->_size;
      if (v5 < size + offset)
      {
        int v8 = (void *)MEMORY[0x263EFF940];
        uint64_t v9 = *MEMORY[0x263EFF498];
        stat v10 = (objc_class *)objc_opt_class();
        objc_super v11 = NSStringFromClass(v10);
        objc_msgSend(v8, "raise:format:", v9, @"%@ contains invalid offset %lu size %lu into <%@; %lu bytes>",
          self,
          offset,
          size,
          v11,
          [(NSData *)self->super._fileBlob length]);
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ contains no content provider", self, v12 format];
    }
  }
}

- (void)restoreToPath:(id)a3
{
  id v4 = a3;
  id v6 = [(_KSFileEntry *)self name];
  unint64_t v5 = [v4 URLByAppendingPathComponent:v6];

  [(_KSFileFile *)self saveTo:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)saveTo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Unable to find contents of %@", v2, v3, v4, v5, 2u);
}

- (void)saveTo:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Unable to create file at %@", v2, v3, v4, v5, 2u);
}

@end