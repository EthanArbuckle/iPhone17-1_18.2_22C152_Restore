@interface DTAssetResponseService
+ (void)registerCapabilities:(id)a3;
- (id)canContinueServingRequestWithIdentifier:(id)a3;
- (void)messageReceived:(id)a3;
@end

@implementation DTAssetResponseService

+ (void)registerCapabilities:(id)a3
{
}

- (void)messageReceived:(id)a3
{
  id v3 = a3;
  id v4 = +[DTAssetResponseBroker sharedBroker];
  [v4 forwardMessage:v3];
}

- (id)canContinueServingRequestWithIdentifier:(id)a3
{
  id v3 = NSNumber;
  id v4 = a3;
  v5 = +[DTAssetResponseBroker sharedBroker];
  uint64_t v6 = [v5 canContinueServingRequestWithIdentifier:v4];

  v7 = [v3 numberWithBool:v6];

  return v7;
}

@end