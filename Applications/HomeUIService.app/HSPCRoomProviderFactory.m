@interface HSPCRoomProviderFactory
+ (id)providerForCoordinator:(id)a3 config:(id)a4;
@end

@implementation HSPCRoomProviderFactory

+ (id)providerForCoordinator:(id)a3 config:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = [v5 isSetupInitiatedByOtherMatterEcosystem];
  v8 = off_1000A88C8;
  if (!v7) {
    v8 = off_1000A88D8;
  }
  id v9 = [objc_alloc(*v8) initWithCoordinator:v6 configuration:v5];

  return v9;
}

@end