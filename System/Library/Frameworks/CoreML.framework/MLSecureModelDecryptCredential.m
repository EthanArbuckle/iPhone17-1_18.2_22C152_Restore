@interface MLSecureModelDecryptCredential
+ (BOOL)supportsSecureCoding;
- (MLSecureModelDecryptCredential)initWithCoder:(id)a3;
- (int64_t)cryptoKey;
- (void)encodeWithCoder:(id)a3;
- (void)setCryptoKey:(int64_t)a3;
@end

@implementation MLSecureModelDecryptCredential

- (void)setCryptoKey:(int64_t)a3
{
  self->_cryptoKey = a3;
}

- (int64_t)cryptoKey
{
  return self->_cryptoKey;
}

- (MLSecureModelDecryptCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MLSecureModelDecryptCredential;
  v5 = [(MLSecureModelDecryptCredential *)&v7 init];
  if (v5) {
    v5->_cryptoKey = [v4 decodeIntegerForKey:@"cryptoKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLSecureModelDecryptCredential cryptoKey](self, "cryptoKey"), @"cryptoKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end