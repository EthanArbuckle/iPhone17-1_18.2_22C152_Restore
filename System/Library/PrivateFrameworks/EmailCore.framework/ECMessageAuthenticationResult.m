@interface ECMessageAuthenticationResult
- (BOOL)dkimAttemptedBodyVerification;
- (BOOL)dkimAttemptedHeaderVerification;
- (BOOL)dkimBodyVerified;
- (BOOL)dkimHasServerResult;
- (BOOL)dkimHeadersVerified;
- (BOOL)dkimServerVerified;
- (ECDKIMMessageHeader)bestDKIMSignatureHeader;
- (NSError)dkimError;
- (NSString)dkimServerResultSelector;
- (NSString)dkimServerSigningDomain;
- (int64_t)dmarcIdentifierAlignment;
- (int64_t)dmarcReceiverPolicy;
- (int64_t)dmarcServerStatus;
- (int64_t)dmarcStatus;
- (void)setBestDKIMSignatureHeader:(id)a3;
- (void)setDkimAttemptedBodyVerification:(BOOL)a3;
- (void)setDkimAttemptedHeaderVerification:(BOOL)a3;
- (void)setDkimBodyVerified:(BOOL)a3;
- (void)setDkimError:(id)a3;
- (void)setDkimHasServerResult:(BOOL)a3;
- (void)setDkimHeadersVerified:(BOOL)a3;
- (void)setDkimServerResultSelector:(id)a3;
- (void)setDkimServerSigningDomain:(id)a3;
- (void)setDkimServerVerified:(BOOL)a3;
- (void)setDmarcIdentifierAlignment:(int64_t)a3;
- (void)setDmarcReceiverPolicy:(int64_t)a3;
- (void)setDmarcServerStatus:(int64_t)a3;
- (void)setDmarcStatus:(int64_t)a3;
@end

@implementation ECMessageAuthenticationResult

- (BOOL)dkimAttemptedHeaderVerification
{
  return self->_dkimAttemptedHeaderVerification;
}

- (void)setDkimAttemptedHeaderVerification:(BOOL)a3
{
  self->_dkimAttemptedHeaderVerification = a3;
}

- (BOOL)dkimHeadersVerified
{
  return self->_dkimHeadersVerified;
}

- (void)setDkimHeadersVerified:(BOOL)a3
{
  self->_dkimHeadersVerified = a3;
}

- (BOOL)dkimAttemptedBodyVerification
{
  return self->_dkimAttemptedBodyVerification;
}

- (void)setDkimAttemptedBodyVerification:(BOOL)a3
{
  self->_dkimAttemptedBodyVerification = a3;
}

- (BOOL)dkimBodyVerified
{
  return self->_dkimBodyVerified;
}

- (void)setDkimBodyVerified:(BOOL)a3
{
  self->_dkimBodyVerified = a3;
}

- (ECDKIMMessageHeader)bestDKIMSignatureHeader
{
  return self->_bestDKIMSignatureHeader;
}

- (void)setBestDKIMSignatureHeader:(id)a3
{
}

- (NSError)dkimError
{
  return self->_dkimError;
}

- (void)setDkimError:(id)a3
{
}

- (BOOL)dkimHasServerResult
{
  return self->_dkimHasServerResult;
}

- (void)setDkimHasServerResult:(BOOL)a3
{
  self->_dkimHasServerResult = a3;
}

- (BOOL)dkimServerVerified
{
  return self->_dkimServerVerified;
}

- (void)setDkimServerVerified:(BOOL)a3
{
  self->_dkimServerVerified = a3;
}

- (NSString)dkimServerSigningDomain
{
  return self->_dkimServerSigningDomain;
}

- (void)setDkimServerSigningDomain:(id)a3
{
}

- (NSString)dkimServerResultSelector
{
  return self->_dkimServerResultSelector;
}

- (void)setDkimServerResultSelector:(id)a3
{
}

- (int64_t)dmarcStatus
{
  return self->_dmarcStatus;
}

- (void)setDmarcStatus:(int64_t)a3
{
  self->_dmarcStatus = a3;
}

- (int64_t)dmarcReceiverPolicy
{
  return self->_dmarcReceiverPolicy;
}

- (void)setDmarcReceiverPolicy:(int64_t)a3
{
  self->_dmarcReceiverPolicy = a3;
}

- (int64_t)dmarcIdentifierAlignment
{
  return self->_dmarcIdentifierAlignment;
}

- (void)setDmarcIdentifierAlignment:(int64_t)a3
{
  self->_dmarcIdentifierAlignment = a3;
}

- (int64_t)dmarcServerStatus
{
  return self->_dmarcServerStatus;
}

- (void)setDmarcServerStatus:(int64_t)a3
{
  self->_dmarcServerStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkimServerResultSelector, 0);
  objc_storeStrong((id *)&self->_dkimServerSigningDomain, 0);
  objc_storeStrong((id *)&self->_dkimError, 0);
  objc_storeStrong((id *)&self->_bestDKIMSignatureHeader, 0);
}

@end