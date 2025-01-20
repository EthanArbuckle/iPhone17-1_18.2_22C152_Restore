@interface VCPDataCompressor
+ (id)compressor;
- (VCPDataCompressor)init;
- (id)compressData:(id)a3;
@end

@implementation VCPDataCompressor

- (VCPDataCompressor)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPDataCompressor;
  v2 = [(VCPDataCompressor *)&v9 init];
  if (v2)
  {
    size_t v3 = compression_encode_scratch_buffer_size(COMPRESSION_ZLIB);
    if (v3)
    {
      uint64_t v4 = +[NSMutableData dataWithLength:v3];
      scratchData = v2->_scratchData;
      v2->_scratchData = (NSMutableData *)v4;
    }
    uint64_t v6 = +[NSMutableData dataWithLength:0x200000];
    resultData = v2->_resultData;
    v2->_resultData = (NSMutableData *)v6;
  }
  return v2;
}

+ (id)compressor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)compressData:(id)a3
{
  resultData = self->_resultData;
  id v5 = a3;
  uint64_t v6 = [(NSMutableData *)resultData mutableBytes];
  size_t v7 = [(NSMutableData *)self->_resultData length];
  id v8 = v5;
  objc_super v9 = (const uint8_t *)[v8 bytes];
  id v10 = [v8 length];

  v11 = (void *)compression_encode_buffer(v6, v7, v9, (size_t)v10, [(NSMutableData *)self->_scratchData mutableBytes], COMPRESSION_ZLIB);
  if (v11)
  {
    v11 = +[NSData dataWithBytesNoCopy:[(NSMutableData *)self->_resultData mutableBytes] length:v11 freeWhenDone:0];
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultData, 0);
  objc_storeStrong((id *)&self->_scratchData, 0);
}

@end