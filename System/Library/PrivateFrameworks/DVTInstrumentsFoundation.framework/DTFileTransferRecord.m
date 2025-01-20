@interface DTFileTransferRecord
- (BOOL)isTransferOpen;
- (NSFileHandle)writeHandle;
- (NSURL)destinationDirectoryURLToRemoveOnDealloc;
- (NSURL)destinationURL;
- (void)closeFileTransfer;
- (void)dealloc;
- (void)setDestinationDirectoryURLToRemoveOnDealloc:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setWriteHandle:(id)a3;
@end

@implementation DTFileTransferRecord

- (BOOL)isTransferOpen
{
  return self->_writeHandle != 0;
}

- (void)closeFileTransfer
{
  writeHandle = self->_writeHandle;
  if (writeHandle)
  {
    [(NSFileHandle *)writeHandle closeFile];
    v4 = self->_writeHandle;
    self->_writeHandle = 0;
  }
}

- (void)dealloc
{
  [(DTFileTransferRecord *)self closeFileTransfer];
  v3 = [MEMORY[0x263F08850] defaultManager];
  [v3 removeItemAtURL:self->_destinationDirectoryURLToRemoveOnDealloc error:0];

  v4.receiver = self;
  v4.super_class = (Class)DTFileTransferRecord;
  [(DTFileTransferRecord *)&v4 dealloc];
}

- (NSURL)destinationDirectoryURLToRemoveOnDealloc
{
  return self->_destinationDirectoryURLToRemoveOnDealloc;
}

- (void)setDestinationDirectoryURLToRemoveOnDealloc:(id)a3
{
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
}

- (NSFileHandle)writeHandle
{
  return self->_writeHandle;
}

- (void)setWriteHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeHandle, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_destinationDirectoryURLToRemoveOnDealloc, 0);
}

@end