@interface CDPCARecoveryKeyCreationReporter
- (CDPCARecoveryKeyCreationReporter)init;
@end

@implementation CDPCARecoveryKeyCreationReporter

- (CDPCARecoveryKeyCreationReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPCARecoveryKeyCreationReporter;
  return [(CDPCAReporter *)&v3 initWithEvent:@"com.apple.CoreCDP.recoveryKeyCreation"];
}

@end