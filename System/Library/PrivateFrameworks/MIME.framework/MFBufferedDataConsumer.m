@interface MFBufferedDataConsumer
- (MFBufferedDataConsumer)init;
- (id)data;
- (int64_t)appendData:(id)a3;
- (void)dealloc;
- (void)done;
@end

@implementation MFBufferedDataConsumer

- (MFBufferedDataConsumer)init
{
  v4.receiver = self;
  v4.super_class = (Class)MFBufferedDataConsumer;
  v2 = [(MFBufferedDataConsumer *)&v4 init];
  if (v2)
  {
    v2->_unwritten = (NSMutableData *)objc_alloc_init(MFMutableData);
    v2->_fd = -1;
  }
  return v2;
}

- (void)dealloc
{
  int fd = self->_fd;
  if (fd != -1) {
    close(fd);
  }
  path = self->_path;
  if (path)
  {
    MFRemoveItemAtPath(path);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFBufferedDataConsumer;
  [(MFBufferedDataConsumer *)&v5 dealloc];
}

- (id)data
{
  complete = self->_complete;
  if (complete)
  {
    v3 = complete;
LABEL_3:
    return v3;
  }
  int fd = self->_fd;
  unwritten = self->_unwritten;
  if (fd == -1)
  {
    v3 = (NSData *)[(NSMutableData *)unwritten copy];
    goto LABEL_3;
  }
  size_t v8 = [(NSMutableData *)unwritten length];
  if (v8)
  {
    if (write(self->_fd, (const void *)[(NSMutableData *)self->_unwritten bytes], v8) == -1) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in write while returning data: (%d)", *__error());
    }
    [(NSMutableData *)self->_unwritten setLength:0];
  }
  id result = (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:self->_path options:8 error:0];
  if (!result)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to read incomplete data from disk."];
    return 0;
  }
  return result;
}

- (int64_t)appendData:(id)a3
{
  if (self->_complete) {
    return -1;
  }
  unint64_t v3 = [a3 length];
  NSUInteger v6 = [(NSMutableData *)self->_unwritten length];
  if (v6 + v3 < sDefaultThreshold) {
    goto LABEL_13;
  }
  size_t v7 = v6;
  if (!self->_path)
  {
    pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
    size_t v8 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    v9 = (NSString *)(id)objc_msgSend(v8, "mf_makeUniqueFileInDirectory:", sMFDataPath);
    self->_path = v9;
    if (!v9)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to create temporary cache file path for append."];
      if (v7) {
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    int fd = open([(NSString *)v9 fileSystemRepresentation], 1538, 438);
    self->_int fd = fd;
    if (fd == -1)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Could not create cache file for append at %@ (%d).", sMFDataPath, *__error() format];
      int fd = self->_fd;
    }
    MFProtectFileDescriptor(fd, 3);
  }
  if (v7)
  {
LABEL_10:
    if (write(self->_fd, (const void *)[(NSMutableData *)self->_unwritten bytes], v7) == -1) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in write while appending data: (%d)", *__error());
    }
    [(NSMutableData *)self->_unwritten setLength:0];
  }
LABEL_13:
  if (v3 < sDefaultThreshold)
  {
    [(NSMutableData *)self->_unwritten appendData:a3];
    return v3;
  }
  unint64_t v3 = write(self->_fd, (const void *)[a3 bytes], v3);
  if (v3 != -1) {
    return v3;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in write while appending data: (%d)", *__error());
  return -1;
}

- (void)done
{
  if (!self->_complete)
  {
    int fd = self->_fd;
    unwritten = self->_unwritten;
    if (fd == -1)
    {
      self->_complete = (NSData *)[(NSMutableData *)unwritten copy];

      self->_unwritten = 0;
    }
    else
    {
      size_t v5 = [(NSMutableData *)unwritten length];
      if (v5 && write(self->_fd, (const void *)[(NSMutableData *)self->_unwritten bytes], v5) == -1) {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Error occured in write while completing: (%d)", *__error());
      }

      self->_unwritten = 0;
      id v7 = 0;
      NSUInteger v6 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:self->_path options:8 error:&v7];
      self->_complete = v6;
      if (!v6) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Failed to read complete data from disk: %@", objc_msgSend(v7, "ef_publicDescription") format];
      }
      close(self->_fd);
      self->_int fd = -1;

      self->_path = 0;
    }
  }
}

@end