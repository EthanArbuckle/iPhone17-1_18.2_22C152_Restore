@interface HDAttachmentFileHandleReader
- (id)initAdoptingFileHandle:(id)a3;
- (id)readDataUpToLength:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5;
- (void)close;
@end

@implementation HDAttachmentFileHandleReader

- (id)initAdoptingFileHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDAttachmentFileHandleReader;
  v6 = [(HDAttachmentFileHandleReader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileHandle, a3);
  }

  return v7;
}

- (id)readDataUpToLength:(unint64_t)a3 offset:(unint64_t)a4 error:(id *)a5
{
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    if ([(NSFileHandle *)fileHandle seekToOffset:a4 error:a5])
    {
      objc_super v9 = [(NSFileHandle *)self->_fileHandle readDataUpToLength:a3 error:a5];
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 126, @"File handle has already been closed.");
  }
  objc_super v9 = 0;
LABEL_6:

  return v9;
}

- (void)close
{
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    [(NSFileHandle *)fileHandle closeFile];
    v4 = self->_fileHandle;
    self->_fileHandle = 0;
  }
}

- (void).cxx_destruct
{
}

@end