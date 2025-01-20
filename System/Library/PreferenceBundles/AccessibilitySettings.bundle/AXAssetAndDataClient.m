@interface AXAssetAndDataClient
@end

@implementation AXAssetAndDataClient

void __AXAssetAndDataClient_block_invoke(id a1)
{
  id v1 = objc_alloc((Class)AXUIClient);
  id v5 = +[NSNumber numberWithInt:getpid()];
  v2 = +[NSString stringWithFormat:@"AXAssetClient-voice-assets-%@", v5];
  id v3 = [v1 initWithIdentifier:v2 serviceBundleName:@"AXAssetAndDataServer"];
  v4 = (void *)AXAssetAndDataClient_Client;
  AXAssetAndDataClient_Client = (uint64_t)v3;
}

@end