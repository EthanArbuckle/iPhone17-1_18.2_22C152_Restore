@interface APNetworksControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityIdentifier;
@end

@implementation APNetworksControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"APNetworksController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (id)accessibilityIdentifier
{
  return @"APNetworks";
}

@end