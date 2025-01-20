@interface SASessionHandoffPayload
- (void)_ad_setPayloadOnRequestInfo:(id)a3;
@end

@implementation SASessionHandoffPayload

- (void)_ad_setPayloadOnRequestInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SASessionHandoffPayload *)self sessionHandoffData];
  [v4 setHandoffRequestData:v5];
}

@end