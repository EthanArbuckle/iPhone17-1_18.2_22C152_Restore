@interface CSPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CSPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)accessibilityIncrement
{
  if ([(CSPageControlAccessibility *)self _accessibilityIsRTL]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }

  [(CSPageControlAccessibility *)self _accessibilityScrollPageInDirection:v3 shouldSendScrollFailed:0];
}

- (void)accessibilityDecrement
{
  if ([(CSPageControlAccessibility *)self _accessibilityIsRTL]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  [(CSPageControlAccessibility *)self _accessibilityScrollPageInDirection:v3 shouldSendScrollFailed:0];
}

@end