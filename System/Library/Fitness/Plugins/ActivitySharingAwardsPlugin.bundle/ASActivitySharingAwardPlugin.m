@interface ASActivitySharingAwardPlugin
- (NSString)pluginIdentifier;
- (id)templateAssetSource;
@end

@implementation ASActivitySharingAwardPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F23C60];
}

- (id)templateAssetSource
{
  id v2 = objc_alloc_init(MEMORY[0x263F0A410]);
  v3 = [[ASActivitySharingTemplateAssetSource alloc] initWithHealthStore:v2];

  return v3;
}

@end