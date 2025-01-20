@interface SANPMoveOutputGroupToDevicesResponse
- (int64_t)resultCallbackCode;
@end

@implementation SANPMoveOutputGroupToDevicesResponse

- (int64_t)resultCallbackCode
{
  v2 = [(SANPMoveOutputGroupToDevicesResponse *)self routeResponse];
  int64_t v3 = [v2 isEqualToString:SAMPRemoteCommandOutcomeSUCCESSValue] - 1;

  return v3;
}

@end