@interface CDPDRecoveryOption
- (NSString)localizedRecoveryOption;
- (NSString)telemetryRecoveryOption;
- (id)recoveryHandler;
- (int64_t)recoveryOptionIndex;
- (void)setLocalizedRecoveryOption:(id)a3;
- (void)setRecoveryHandler:(id)a3;
- (void)setRecoveryOptionIndex:(int64_t)a3;
- (void)setTelemetryRecoveryOption:(id)a3;
@end

@implementation CDPDRecoveryOption

- (NSString)localizedRecoveryOption
{
  return self->_localizedRecoveryOption;
}

- (void)setLocalizedRecoveryOption:(id)a3
{
}

- (NSString)telemetryRecoveryOption
{
  return self->_telemetryRecoveryOption;
}

- (void)setTelemetryRecoveryOption:(id)a3
{
}

- (id)recoveryHandler
{
  return self->_recoveryHandler;
}

- (void)setRecoveryHandler:(id)a3
{
}

- (int64_t)recoveryOptionIndex
{
  return self->_recoveryOptionIndex;
}

- (void)setRecoveryOptionIndex:(int64_t)a3
{
  self->_recoveryOptionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recoveryHandler, 0);
  objc_storeStrong((id *)&self->_telemetryRecoveryOption, 0);
  objc_storeStrong((id *)&self->_localizedRecoveryOption, 0);
}

@end