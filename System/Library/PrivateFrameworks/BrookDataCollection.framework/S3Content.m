@interface S3Content
- (BOOL)gzip;
- (NSData)content;
- (NSData)gzipContent;
- (NSString)bucket;
- (NSString)filename;
- (NSString)mimeType;
- (S3Content)initWithContent:(id)a3 filename:(id)a4 bucket:(id)a5 gzip:(BOOL)a6;
- (id)_gzipCompressData:(id)a3;
- (void)gzipContent;
- (void)setBucket:(id)a3;
- (void)setContent:(id)a3;
- (void)setFilename:(id)a3;
- (void)setGzip:(BOOL)a3;
@end

@implementation S3Content

- (S3Content)initWithContent:(id)a3 filename:(id)a4 bucket:(id)a5 gzip:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)S3Content;
  v14 = [(S3Content *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_content, a3);
    objc_storeStrong((id *)&v15->_filename, a4);
    objc_storeStrong((id *)&v15->_bucket, a5);
    v15->_gzip = a6;
  }

  return v15;
}

- (NSString)mimeType
{
  if (self->_gzip) {
    return (NSString *)@"application/zlib";
  }
  else {
    return (NSString *)@"text/plain";
  }
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
  id v6 = a3;
  gzipContentCache = self->_gzipContentCache;
  self->_gzipContentCache = 0;
}

- (NSData)gzipContent
{
  BOOL gzip = self->_gzip;
  gzipContentCache = self->_gzipContentCache;
  if (gzip && gzipContentCache == 0)
  {
    id v6 = [(S3Content *)self _gzipCompressData:self->_content];
    v7 = self->_gzipContentCache;
    self->_gzipContentCache = v6;

    gzipContentCache = self->_gzipContentCache;
    if (!gzipContentCache) {
      -[S3Content gzipContent]();
    }
  }
  return gzipContentCache;
}

- (id)_gzipCompressData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
  memset(&v9, 0, sizeof(v9));
  if (deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    id v5 = 0;
  }
  else
  {
    v9.avail_in = [v3 length];
    v9.next_in = (Bytef *)[v3 bytes];
    do
    {
      v9.avail_out = 0x4000;
      v9.next_out = v10;
      int v6 = deflate(&v9, 4);
      if (v6 == -2) {
        -[S3Content _gzipCompressData:]();
      }
      int v7 = v6;
      objc_msgSend(v4, "appendBytes:length:", v10, 0x4000 - v9.avail_out, v9.next_in);
    }
    while (!v9.avail_out);
    if (v9.avail_in) {
      -[S3Content _gzipCompressData:]();
    }
    if (v7 != 1) {
      -[S3Content _gzipCompressData:]();
    }
    deflateEnd(&v9);
    id v5 = v4;
  }

  return v5;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)bucket
{
  return self->_bucket;
}

- (void)setBucket:(id)a3
{
}

- (NSData)content
{
  return self->_content;
}

- (BOOL)gzip
{
  return self->_gzip;
}

- (void)setGzip:(BOOL)a3
{
  self->_BOOL gzip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_gzipContentCache, 0);
}

- (void)gzipContent
{
  __assert_rtn("-[S3Content gzipContent]", "NSMutableURLRequest+S3.m", 172, "_gzipContentCache != nil");
}

- (void)_gzipCompressData:.cold.1()
{
  __assert_rtn("-[S3Content _gzipCompressData:]", "NSMutableURLRequest+S3.m", 205, "ret != Z_STREAM_ERROR");
}

- (void)_gzipCompressData:.cold.2()
{
  __assert_rtn("-[S3Content _gzipCompressData:]", "NSMutableURLRequest+S3.m", 211, "ret == Z_STREAM_END");
}

- (void)_gzipCompressData:.cold.3()
{
  __assert_rtn("-[S3Content _gzipCompressData:]", "NSMutableURLRequest+S3.m", 210, "strm.avail_in == 0");
}

@end