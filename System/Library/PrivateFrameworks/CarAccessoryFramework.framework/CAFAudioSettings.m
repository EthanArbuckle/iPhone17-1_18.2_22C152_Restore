@interface CAFAudioSettings
+ (id)accessoryIdentifier;
+ (id)observerProtocol;
+ (void)load;
- (CAFSoundDistribution)soundDistributionService;
- (NSArray)equalizerServices;
- (NSArray)equalizers;
- (NSArray)volumeServices;
- (NSArray)volumes;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFAudioSettings

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFAudioSettings;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFAudioSettings;
  [(CAFAccessory *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDA8670]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFAudioSettings;
  [(CAFAccessory *)&v6 unregisterObserver:v5];
}

- (NSArray)volumeServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000013000002"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000013000002"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (NSArray)equalizerServices
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000013000003"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000013000003"];
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return (NSArray *)v9;
}

- (CAFSoundDistribution)soundDistributionService
{
  v3 = [(CAFAccessory *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(id)objc_opt_class() accessoryIdentifier];
  [v6 validateRegisteredForAccessory:v7 service:@"0x0000000013000005"];

  objc_opt_class();
  id v8 = [(CAFAccessory *)self servicesForType:@"0x0000000013000005"];
  id v9 = [v8 firstObject];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (CAFSoundDistribution *)v10;
}

- (NSArray)volumes
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFAudioSettings *)self volumeServices];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:1 selector:sel_typeCompare_];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSArray)equalizers
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v2 = [(CAFAudioSettings *)self equalizerServices];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortOrder" ascending:1];
  v7[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

+ (id)accessoryIdentifier
{
  return @"0x0000000002000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB2640;
}

@end