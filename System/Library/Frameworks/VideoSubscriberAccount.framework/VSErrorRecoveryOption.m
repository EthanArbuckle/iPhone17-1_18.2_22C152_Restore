@interface VSErrorRecoveryOption
- (BOOL)isDestructive;
- (NSString)localizedAlertButtonTitle;
- (id)attemptHandler;
- (void)setAttemptHandler:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setLocalizedAlertButtonTitle:(id)a3;
@end

@implementation VSErrorRecoveryOption

- (NSString)localizedAlertButtonTitle
{
  return self->_localizedAlertButtonTitle;
}

- (void)setLocalizedAlertButtonTitle:(id)a3
{
}

- (id)attemptHandler
{
  return self->_attemptHandler;
}

- (void)setAttemptHandler:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attemptHandler, 0);

  objc_storeStrong((id *)&self->_localizedAlertButtonTitle, 0);
}

@end