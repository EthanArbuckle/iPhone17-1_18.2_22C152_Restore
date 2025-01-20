@interface GTBulkDataTransferOptions
+ (BOOL)supportsSecureCoding;
- (GTBulkDataTransferOptions)init;
- (GTBulkDataTransferOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compressionAlgorithm;
- (unint64_t)chunkSize;
- (void)encodeWithCoder:(id)a3;
- (void)setChunkSize:(unint64_t)a3;
- (void)setCompressionAlgorithm:(int64_t)a3;
@end

@implementation GTBulkDataTransferOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTBulkDataTransferOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)GTBulkDataTransferOptions;
  result = [(GTBulkDataTransferOptions *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_chunkSize = xmmword_23C0810B0;
  }
  return result;
}

- (GTBulkDataTransferOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GTBulkDataTransferOptions;
  v5 = [(GTBulkDataTransferOptions *)&v7 init];
  if (v5)
  {
    v5->_chunkSize = [v4 decodeInt64ForKey:@"chunkSize"];
    v5->_compressionAlgorithm = [v4 decodeIntegerForKey:@"compressionAlgorithm"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t chunkSize = self->_chunkSize;
  id v5 = a3;
  [v5 encodeInt64:chunkSize forKey:@"chunkSize"];
  [v5 encodeInteger:self->_compressionAlgorithm forKey:@"compressionAlgorithm"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setChunkSize:self->_chunkSize];
  [v4 setCompressionAlgorithm:self->_compressionAlgorithm];
  return v4;
}

- (unint64_t)chunkSize
{
  return self->_chunkSize;
}

- (void)setChunkSize:(unint64_t)a3
{
  self->_unint64_t chunkSize = a3;
}

- (int64_t)compressionAlgorithm
{
  return self->_compressionAlgorithm;
}

- (void)setCompressionAlgorithm:(int64_t)a3
{
  self->_compressionAlgorithm = a3;
}

@end