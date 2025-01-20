@interface NSObject(AXAssertionHelpers)
- (uint64_t)_accessibilityIsSpeakThisTemporarilyDisabled;
- (uint64_t)_accessibilitySetSpeakThisTemporarilyDisabled:()AXAssertionHelpers;
@end

@implementation NSObject(AXAssertionHelpers)

- (uint64_t)_accessibilityIsSpeakThisTemporarilyDisabled
{
  return MEMORY[0x1F4106398](a1, &__NSObject___accessibilityIsSpeakThisTemporarilyDisabled);
}

- (uint64_t)_accessibilitySetSpeakThisTemporarilyDisabled:()AXAssertionHelpers
{
  return MEMORY[0x1F41063D0](a1, &__NSObject___accessibilityIsSpeakThisTemporarilyDisabled);
}

@end