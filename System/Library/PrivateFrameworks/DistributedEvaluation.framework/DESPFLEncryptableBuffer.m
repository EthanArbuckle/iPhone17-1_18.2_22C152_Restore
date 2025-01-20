@interface DESPFLEncryptableBuffer
- (DESPFLEncryptableBuffer)initWithEncryptor:(id)a3 count:(unint64_t)a4;
- (float)mutableDataNumbers;
- (id)encryptedDataWithPublicKey:(id)a3 error:(id *)a4;
- (unint64_t)count;
@end

@implementation DESPFLEncryptableBuffer

- (DESPFLEncryptableBuffer)initWithEncryptor:(id)a3 count:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DESPFLEncryptableBuffer;
  return [(DESPFLEncryptableBuffer *)&v5 init];
}

- (float)mutableDataNumbers
{
  return 0;
}

- (id)encryptedDataWithPublicKey:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)count
{
  return self->_count;
}

@end