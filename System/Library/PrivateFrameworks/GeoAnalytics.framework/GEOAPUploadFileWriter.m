@interface GEOAPUploadFileWriter
- (void)_arpcDataForType:(int)a3 dataBlock:(id)a4;
- (void)dealloc;
@end

@implementation GEOAPUploadFileWriter

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  if (self->_compress)
  {
    compression_stream_destroy((compression_stream *)&self->_cstream);
    free(self->_dstBuf);
  }
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:self->_tempFilePath];

  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    [v6 removeItemAtPath:self->_tempFilePath error:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)GEOAPUploadFileWriter;
  [(GEOAPUploadFileWriter *)&v7 dealloc];
}

- (void)_arpcDataForType:(int)a3 dataBlock:(id)a4
{
  unsigned int v5 = (void (**)(id, void *, BOOL))a4;
  id v7 = objc_alloc_init((Class)GEOLogMessageCollectionRequest);
  [v7 requestTypeCode];
  v6 = GEOProtocolBufferRequestHeader();
  v5[2](v5, v6, a3 != 13);
}

- (void).cxx_destruct
{
}

@end