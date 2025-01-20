@interface CKDAcceptShareMetadata
- (BOOL)acceptedInProcess;
- (CKRecordID)shareRecordID;
- (NSData)pppcsProtectionInfo;
- (NSData)publicKey;
- (NSData)publicPCSData;
- (NSString)anonymousCKUserID;
- (NSString)etag;
- (NSString)participantID;
- (NSString)publicPCSEtag;
- (NSURL)shareURL;
- (_PCSIdentityData)signingPCSIdentity;
- (unint64_t)publicKeyVersion;
- (void)dealloc;
- (void)setAcceptedInProcess:(BOOL)a3;
- (void)setAnonymousCKUserID:(id)a3;
- (void)setEtag:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setPppcsProtectionInfo:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyVersion:(unint64_t)a3;
- (void)setPublicPCSData:(id)a3;
- (void)setPublicPCSEtag:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setSigningPCSIdentity:(_PCSIdentityData *)a3;
@end

@implementation CKDAcceptShareMetadata

- (void)setSigningPCSIdentity:(_PCSIdentityData *)a3
{
  signingPCSIdentity = self->_signingPCSIdentity;
  if (signingPCSIdentity != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      signingPCSIdentity = self->_signingPCSIdentity;
    }
    self->_signingPCSIdentity = a3;
    if (signingPCSIdentity)
    {
      CFRelease(signingPCSIdentity);
    }
  }
}

- (void)dealloc
{
  signingPCSIdentity = self->_signingPCSIdentity;
  if (signingPCSIdentity)
  {
    CFRelease(signingPCSIdentity);
    self->_signingPCSIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDAcceptShareMetadata;
  [(CKDAcceptShareMetadata *)&v4 dealloc];
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSData)publicPCSData
{
  return self->_publicPCSData;
}

- (void)setPublicPCSData:(id)a3
{
}

- (NSString)publicPCSEtag
{
  return self->_publicPCSEtag;
}

- (void)setPublicPCSEtag:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (unint64_t)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (void)setPublicKeyVersion:(unint64_t)a3
{
  self->_publicKeyVersion = a3;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSData)pppcsProtectionInfo
{
  return self->_pppcsProtectionInfo;
}

- (void)setPppcsProtectionInfo:(id)a3
{
}

- (NSString)anonymousCKUserID
{
  return self->_anonymousCKUserID;
}

- (void)setAnonymousCKUserID:(id)a3
{
}

- (_PCSIdentityData)signingPCSIdentity
{
  return self->_signingPCSIdentity;
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  self->_acceptedInProcess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousCKUserID, 0);
  objc_storeStrong((id *)&self->_pppcsProtectionInfo, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_publicPCSEtag, 0);
  objc_storeStrong((id *)&self->_publicPCSData, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end