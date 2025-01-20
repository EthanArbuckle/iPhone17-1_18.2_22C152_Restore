@interface GTBulkDataUploadDescriptor
+ (BOOL)supportsSecureCoding;
- (GTBulkDataUploadDescriptor)initWithCoder:(id)a3;
- (int64_t)compressionAlgorithm;
- (unint64_t)sizeHint;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressionAlgorithm:(int64_t)a3;
- (void)setSizeHint:(unint64_t)a3;
@end

@implementation GTBulkDataUploadDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTBulkDataUploadDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GTBulkDataUploadDescriptor;
  v5 = [(GTBulkDataUploadDescriptor *)&v7 init];
  if (v5)
  {
    v5->_sizeHint = [v4 decodeInt64ForKey:@"sizeHint"];
    v5->_compressionAlgorithm = [v4 decodeIntegerForKey:@"compressionAlgorithm"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sizeHint = self->_sizeHint;
  id v5 = a3;
  [v5 encodeInt64:sizeHint forKey:@"sizeHint"];
  [v5 encodeInteger:self->_compressionAlgorithm forKey:@"compressionAlgorithm"];
}

- (unint64_t)sizeHint
{
  return self->_sizeHint;
}

- (void)setSizeHint:(unint64_t)a3
{
  self->_unint64_t sizeHint = a3;
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