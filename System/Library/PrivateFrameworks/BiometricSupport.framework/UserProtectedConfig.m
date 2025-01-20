@interface UserProtectedConfig
- (UserProtectedConfig)init;
- (int)applePayEnabled;
- (int)attentionDetectionEnabled;
- (int)identificationEnabled;
- (int)loginEnabled;
- (int)periocularMatchEnabled;
- (int)unlockEnabled;
- (void)setApplePayEnabled:(int)a3;
- (void)setAttentionDetectionEnabled:(int)a3;
- (void)setIdentificationEnabled:(int)a3;
- (void)setLoginEnabled:(int)a3;
- (void)setPeriocularMatchEnabled:(int)a3;
- (void)setUnlockEnabled:(int)a3;
@end

@implementation UserProtectedConfig

- (void)setUnlockEnabled:(int)a3
{
  self->_unlockEnabled = a3;
}

- (void)setPeriocularMatchEnabled:(int)a3
{
  self->_periocularMatchEnabled = a3;
}

- (void)setLoginEnabled:(int)a3
{
  self->_loginEnabled = a3;
}

- (void)setIdentificationEnabled:(int)a3
{
  self->_identificationEnabled = a3;
}

- (void)setAttentionDetectionEnabled:(int)a3
{
  self->_attentionDetectionEnabled = a3;
}

- (void)setApplePayEnabled:(int)a3
{
  self->_applePayEnabled = a3;
}

- (UserProtectedConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)UserProtectedConfig;
  result = [(UserProtectedConfig *)&v3 init];
  if (result)
  {
    *(void *)&result->_loginEnabled = -1;
    *(void *)&result->_attentionDetectionEnabled = -1;
    *(void *)&result->_unlockEnabled = -1;
  }
  return result;
}

- (int)unlockEnabled
{
  return self->_unlockEnabled;
}

- (int)periocularMatchEnabled
{
  return self->_periocularMatchEnabled;
}

- (int)loginEnabled
{
  return self->_loginEnabled;
}

- (int)identificationEnabled
{
  return self->_identificationEnabled;
}

- (int)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (int)applePayEnabled
{
  return self->_applePayEnabled;
}

@end