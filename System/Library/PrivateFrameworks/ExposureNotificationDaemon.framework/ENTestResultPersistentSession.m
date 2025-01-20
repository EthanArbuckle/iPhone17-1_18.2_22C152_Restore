@interface ENTestResultPersistentSession
- (NSArray)teks;
- (NSData)HMACKey;
- (NSDictionary)fetchedMetadata;
- (NSError)verificationError;
- (NSString)certificate;
- (NSString)revisionToken;
- (NSString)verificationToken;
- (void)setCertificate:(id)a3;
- (void)setFetchedMetadata:(id)a3;
- (void)setHMACKey:(id)a3;
- (void)setRevisionToken:(id)a3;
- (void)setTeks:(id)a3;
- (void)setVerificationError:(id)a3;
- (void)setVerificationToken:(id)a3;
@end

@implementation ENTestResultPersistentSession

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
}

- (NSDictionary)fetchedMetadata
{
  return self->_fetchedMetadata;
}

- (void)setFetchedMetadata:(id)a3
{
}

- (NSData)HMACKey
{
  return self->_HMACKey;
}

- (void)setHMACKey:(id)a3
{
}

- (NSString)revisionToken
{
  return self->_revisionToken;
}

- (void)setRevisionToken:(id)a3
{
}

- (NSArray)teks
{
  return self->_teks;
}

- (void)setTeks:(id)a3
{
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void)setVerificationError:(id)a3
{
}

- (NSString)verificationToken
{
  return self->_verificationToken;
}

- (void)setVerificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationToken, 0);
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_teks, 0);
  objc_storeStrong((id *)&self->_revisionToken, 0);
  objc_storeStrong((id *)&self->_HMACKey, 0);
  objc_storeStrong((id *)&self->_fetchedMetadata, 0);

  objc_storeStrong((id *)&self->_certificate, 0);
}

@end