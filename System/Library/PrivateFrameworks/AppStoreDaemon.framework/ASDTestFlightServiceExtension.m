@interface ASDTestFlightServiceExtension
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)didReachTerminalPhaseWithBetaBundleID:(id)a3 terminalPhase:(int64_t)a4 error:(id)a5 reply:(id)a6;
- (void)didReceivePushMessages:(id)a3 reply:(id)a4;
- (void)didReceivePushToken:(id)a3 reply:(id)a4;
- (void)invokeCommand:(id)a3 withArguments:(id)a4 reply:(id)a5;
- (void)reloadAppsFromServerWithReply:(id)a3;
@end

@implementation ASDTestFlightServiceExtension

- (void)didReceivePushToken:(id)a3 reply:(id)a4
{
}

- (void)didReceivePushMessages:(id)a3 reply:(id)a4
{
}

- (void)didReachTerminalPhaseWithBetaBundleID:(id)a3 terminalPhase:(int64_t)a4 error:(id)a5 reply:(id)a6
{
}

- (void)reloadAppsFromServerWithReply:(id)a3
{
}

- (void)invokeCommand:(id)a3 withArguments:(id)a4 reply:(id)a5
{
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v7 && (isKindOfClass & 1) != 0)
  {
    id v5 = v7;
    [v5 setExtensionInstance:self];
  }
  else
  {
    [NSString stringWithFormat:@"context is not an instance of ASDTestFlightServiceExtensionRemoteContext: context='%@'", v7];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = ASDErrorWithUnderlyingErrorAndDescription(0, @"ASDTestFlightServiceErrorDomain", 901, v5);
    [v7 cancelRequestWithError:v6];
  }
}

@end