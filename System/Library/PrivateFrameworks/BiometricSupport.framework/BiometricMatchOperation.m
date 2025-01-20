@interface BiometricMatchOperation
- ($8DE116C3FB21CCD6F79AB3F71F0D566B)noBioLockoutAuthData;
- (BOOL)forCredentialSet;
- (BOOL)forPreArm;
- (BOOL)forUnlock;
- (BOOL)noBioLockout;
- (BOOL)stopOnSuccess;
- (BiometricMatchOperation)init;
- (NSData)acmContext;
- (NSData)selectedIdentitiesBlob;
- (int)type;
- (int)useCase;
- (unsigned)cancelledMessage;
- (unsigned)noBioLockoutUserID;
- (unsigned)processedFlags;
- (unsigned)userID;
- (void)setAcmContext:(id)a3;
- (void)setForCredentialSet:(BOOL)a3;
- (void)setForPreArm:(BOOL)a3;
- (void)setForUnlock:(BOOL)a3;
- (void)setNoBioLockout:(BOOL)a3;
- (void)setNoBioLockoutUserID:(unsigned int)a3;
- (void)setProcessedFlags:(unsigned int)a3;
- (void)setSelectedIdentitiesBlob:(id)a3;
- (void)setStopOnSuccess:(BOOL)a3;
- (void)setUseCase:(int)a3;
- (void)setUserID:(unsigned int)a3;
@end

@implementation BiometricMatchOperation

- (BiometricMatchOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)BiometricMatchOperation;
  result = [(BiometricOperation *)&v3 init];
  if (result)
  {
    result->_userID = -1;
    result->_noBioLockoutUserID = -1;
  }
  return result;
}

- (int)type
{
  return 2;
}

- ($8DE116C3FB21CCD6F79AB3F71F0D566B)noBioLockoutAuthData
{
  return ($8DE116C3FB21CCD6F79AB3F71F0D566B *)&self->_noBioLockoutAuthData;
}

- (unsigned)cancelledMessage
{
  return 80;
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (NSData)selectedIdentitiesBlob
{
  return self->_selectedIdentitiesBlob;
}

- (void)setSelectedIdentitiesBlob:(id)a3
{
}

- (BOOL)forUnlock
{
  return self->_forUnlock;
}

- (void)setForUnlock:(BOOL)a3
{
  self->_forUnlock = a3;
}

- (BOOL)forCredentialSet
{
  return self->_forCredentialSet;
}

- (void)setForCredentialSet:(BOOL)a3
{
  self->_forCredentialSet = a3;
}

- (BOOL)forPreArm
{
  return self->_forPreArm;
}

- (void)setForPreArm:(BOOL)a3
{
  self->_forPreArm = a3;
}

- (BOOL)stopOnSuccess
{
  return self->_stopOnSuccess;
}

- (void)setStopOnSuccess:(BOOL)a3
{
  self->_stopOnSuccess = a3;
}

- (BOOL)noBioLockout
{
  return self->_noBioLockout;
}

- (void)setNoBioLockout:(BOOL)a3
{
  self->_noBioLockout = a3;
}

- (NSData)acmContext
{
  return self->_acmContext;
}

- (void)setAcmContext:(id)a3
{
}

- (int)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(int)a3
{
  self->_useCase = a3;
}

- (unsigned)noBioLockoutUserID
{
  return self->_noBioLockoutUserID;
}

- (void)setNoBioLockoutUserID:(unsigned int)a3
{
  self->_noBioLockoutUserID = a3;
}

- (unsigned)processedFlags
{
  return self->_processedFlags;
}

- (void)setProcessedFlags:(unsigned int)a3
{
  self->_processedFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acmContext, 0);
  objc_storeStrong((id *)&self->_selectedIdentitiesBlob, 0);
}

@end