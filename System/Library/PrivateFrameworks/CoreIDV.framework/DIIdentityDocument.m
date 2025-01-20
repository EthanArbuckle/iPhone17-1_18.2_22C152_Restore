@interface DIIdentityDocument
- (DIIdentityDocument)initWithEncryptedData:(id)a3;
- (NSData)encryptedData;
@end

@implementation DIIdentityDocument

- (DIIdentityDocument)initWithEncryptedData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIIdentityDocument;
  v6 = [(DIIdentityDocument *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_encryptedData, a3);
  }

  return v7;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void).cxx_destruct
{
}

@end