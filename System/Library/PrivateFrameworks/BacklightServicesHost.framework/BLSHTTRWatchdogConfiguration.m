@interface BLSHTTRWatchdogConfiguration
- (BOOL)enabledByDefault;
- (NSString)identifier;
- (NSString)timerIdentifier;
- (double)leeway;
- (double)timeout;
- (void)setEnabledByDefault:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLeeway:(double)a3;
- (void)setTimeout:(double)a3;
- (void)setTimerIdentifier:(id)a3;
@end

@implementation BLSHTTRWatchdogConfiguration

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  id v7 = a3;
  v5 = [NSString stringWithFormat:@"%@%@", @"blsh_ttr_watchdog_", v7];
  timerIdentifier = self->_timerIdentifier;
  self->_timerIdentifier = v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)leeway
{
  return self->_leeway;
}

- (void)setLeeway:(double)a3
{
  self->_leeway = a3;
}

- (BOOL)enabledByDefault
{
  return self->_enabledByDefault;
}

- (void)setEnabledByDefault:(BOOL)a3
{
  self->_enabledByDefault = a3;
}

- (NSString)timerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end