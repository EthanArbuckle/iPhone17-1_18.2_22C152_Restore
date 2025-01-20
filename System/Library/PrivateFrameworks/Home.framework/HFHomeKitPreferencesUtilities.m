@interface HFHomeKitPreferencesUtilities
- (BOOL)areAnyAccessoriesConfigured;
- (BOOL)areHomesConfigured;
@end

@implementation HFHomeKitPreferencesUtilities

- (BOOL)areHomesConfigured
{
  return MEMORY[0x270EF3DE8](self, a2);
}

- (BOOL)areAnyAccessoriesConfigured
{
  return MEMORY[0x270EF3BF0](self, a2);
}

@end