@interface HMDSKPresenceProvider
- (id)createPresenceWithChannelName:(id)a3 serviceIdentifier:(id)a4;
@end

@implementation HMDSKPresenceProvider

- (id)createPresenceWithChannelName:(id)a3 serviceIdentifier:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F797F0];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithServiceIdentifier:v6];

  v9 = (void *)[objc_alloc(MEMORY[0x263F797E0]) initWithPresenceIdentifier:v7 options:v8];
  return v9;
}

@end