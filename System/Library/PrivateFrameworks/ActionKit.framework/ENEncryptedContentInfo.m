@interface ENEncryptedContentInfo
- (ENEncryptedContentInfo)init;
- (NSMutableString)cipherText;
- (NSString)cipher;
- (NSString)hint;
- (int64_t)keyLength;
- (void)setCipher:(id)a3;
- (void)setCipherText:(id)a3;
- (void)setHint:(id)a3;
- (void)setKeyLength:(int64_t)a3;
@end

@implementation ENEncryptedContentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cipherText, 0);
  objc_storeStrong((id *)&self->_cipher, 0);
  objc_storeStrong((id *)&self->_hint, 0);
}

- (void)setCipherText:(id)a3
{
}

- (NSMutableString)cipherText
{
  return self->_cipherText;
}

- (void)setKeyLength:(int64_t)a3
{
  self->_keyLength = a3;
}

- (int64_t)keyLength
{
  return self->_keyLength;
}

- (void)setCipher:(id)a3
{
}

- (NSString)cipher
{
  return self->_cipher;
}

- (void)setHint:(id)a3
{
}

- (NSString)hint
{
  return self->_hint;
}

- (ENEncryptedContentInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)ENEncryptedContentInfo;
  v2 = [(ENEncryptedContentInfo *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(ENEncryptedContentInfo *)v2 setCipher:@"RC2"];
    [(ENEncryptedContentInfo *)v3 setKeyLength:64];
  }
  return v3;
}

@end