@interface HMMTRReaderConfig
- (NSData)groupResolvingKey;
- (NSData)readerGroupIdentifier;
- (NSData)readerPrivateKey;
- (NSData)readerPublicKeyExternalRepresentation;
- (void)setGroupResolvingKey:(id)a3;
- (void)setReaderGroupIdentifier:(id)a3;
- (void)setReaderPrivateKey:(id)a3;
- (void)setReaderPublicKeyExternalRepresentation:(id)a3;
@end

@implementation HMMTRReaderConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupResolvingKey, 0);
  objc_storeStrong((id *)&self->_readerGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_readerPublicKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_readerPrivateKey, 0);
}

- (void)setGroupResolvingKey:(id)a3
{
}

- (NSData)groupResolvingKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReaderGroupIdentifier:(id)a3
{
}

- (NSData)readerGroupIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReaderPublicKeyExternalRepresentation:(id)a3
{
}

- (NSData)readerPublicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReaderPrivateKey:(id)a3
{
}

- (NSData)readerPrivateKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

@end