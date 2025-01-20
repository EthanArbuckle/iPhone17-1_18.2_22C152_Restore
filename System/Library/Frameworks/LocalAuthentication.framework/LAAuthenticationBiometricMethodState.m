@interface LAAuthenticationBiometricMethodState
- (BOOL)isFaceID;
- (BOOL)isTouchID;
- (BOOL)isUserPresent;
- (id)description;
- (unint64_t)lockoutState;
- (void)setIsFaceID:(BOOL)a3;
- (void)setIsTouchID:(BOOL)a3;
- (void)setIsUserPresent:(BOOL)a3;
- (void)setLockoutState:(unint64_t)a3;
@end

@implementation LAAuthenticationBiometricMethodState

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<biometricState:touchID=%d,faceID=%d,lockoutState=%08x>", -[LAAuthenticationBiometricMethodState isTouchID](self, "isTouchID"), -[LAAuthenticationBiometricMethodState isFaceID](self, "isFaceID"), -[LAAuthenticationBiometricMethodState lockoutState](self, "lockoutState"));
}

- (BOOL)isTouchID
{
  return self->_isTouchID;
}

- (void)setIsTouchID:(BOOL)a3
{
  self->_isTouchID = a3;
}

- (BOOL)isFaceID
{
  return self->_isFaceID;
}

- (void)setIsFaceID:(BOOL)a3
{
  self->_isFaceID = a3;
}

- (unint64_t)lockoutState
{
  return self->_lockoutState;
}

- (void)setLockoutState:(unint64_t)a3
{
  self->_lockoutState = a3;
}

- (BOOL)isUserPresent
{
  return self->_isUserPresent;
}

- (void)setIsUserPresent:(BOOL)a3
{
  self->_isUserPresent = a3;
}

@end