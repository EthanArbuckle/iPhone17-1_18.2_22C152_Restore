@interface IMNicknameEncryptionKey
- (IMNicknameEncryptionKey)initWithData:(id)a3;
- (NSData)data;
- (const)bytes;
- (unint64_t)length;
- (void)setData:(id)a3;
@end

@implementation IMNicknameEncryptionKey

- (IMNicknameEncryptionKey)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMNicknameEncryptionKey;
  v6 = [(IMNicknameEncryptionKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (const)bytes
{
  id v2 = [(IMNicknameEncryptionKey *)self data];
  v3 = (const void *)[v2 bytes];

  return v3;
}

- (unint64_t)length
{
  id v2 = [(IMNicknameEncryptionKey *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end