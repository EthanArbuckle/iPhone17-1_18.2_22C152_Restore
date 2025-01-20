@interface XRMobileAgentInlineStop
- (int)agentStopDiagnosticsTypeCode;
- (void)receiveMobileAgent:(id)a3;
@end

@implementation XRMobileAgentInlineStop

- (int)agentStopDiagnosticsTypeCode
{
  return 21;
}

- (void)receiveMobileAgent:(id)a3
{
  id v11 = a3;
  [v11 hello:v3 v4:v5 v6:v6];
  [v11 goodbye:v7 with:v8 and:v9 and:v10];
}

@end