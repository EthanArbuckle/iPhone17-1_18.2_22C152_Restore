@interface DVTFileStream
- (BOOL)hasData;
- (BOOL)supportsPeek;
- (DVTFileStream)initWithURL:(id)a3;
- (NSFileHandle)file;
- (NSURL)fileURL;
- (id)peek:(unint64_t)a3 error:(id *)a4;
- (id)read:(unint64_t)a3 error:(id *)a4;
- (id)readToEnd:(id *)a3;
- (void)_updateFileSize;
@end

@implementation DVTFileStream

- (DVTFileStream)initWithURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DVTFileStream;
  v5 = [(DVTFileStream *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F08840];
    v7 = NSString;
    id v8 = v4;
    v9 = [v7 stringWithUTF8String:[v8 fileSystemRepresentation]];
    uint64_t v10 = [v6 fileHandleForReadingAtPath:v9];
    fileHandle = v5->_fileHandle;
    v5->_fileHandle = (NSFileHandle *)v10;

    objc_storeStrong((id *)&v5->_fileURL, v8);
    v5->_currentRead = 0;
    [(DVTFileStream *)v5 _updateFileSize];
  }

  return v5;
}

- (BOOL)supportsPeek
{
  return 0;
}

- (void)_updateFileSize
{
  off_t v3 = lseek([(NSFileHandle *)self->_fileHandle fileDescriptor], 0, 1);
  self->_fileSize = lseek([(NSFileHandle *)self->_fileHandle fileDescriptor], 0, 2);
  if (lseek([(NSFileHandle *)self->_fileHandle fileDescriptor], v3, 0) != v3) {
    sub_23093C810();
  }
}

- (BOOL)hasData
{
  return self->_currentRead < self->_fileSize;
}

- (id)peek:(unint64_t)a3 error:(id *)a4
{
}

- (id)read:(unint64_t)a3 error:(id *)a4
{
  unint64_t fileSize = self->_fileSize;
  unint64_t currentRead = self->_currentRead;
  unint64_t v7 = currentRead + a3;
  fileHandle = self->_fileHandle;
  size_t v9 = fileSize - currentRead;
  if (v7 <= fileSize) {
    size_t v10 = a3;
  }
  else {
    size_t v10 = v9;
  }
  v11 = [[NSData alloc] initWithBytesNoCopy:mmap(0, v10, 1, 2, -[NSFileHandle fileDescriptor](fileHandle, "fileDescriptor"), self->_currentRead), v10, &unk_26E515468];
  self->_currentRead += [v11 length];
  return v11;
}

- (id)readToEnd:(id *)a3
{
  return [(DVTFileStream *)self read:self->_fileSize - self->_currentRead error:a3];
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end