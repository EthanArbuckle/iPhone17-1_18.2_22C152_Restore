@interface TVRUICaptionsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation TVRUICaptionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVRUICaptionsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  if ([(TVRUICaptionsButtonAccessibility *)self safeBoolForKey:@"captionsEnabled"])
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRUICaptionsButtonAccessibility;
    return *MEMORY[0x263F1CF38] | [(TVRUICaptionsButtonAccessibility *)&v5 accessibilityTraits];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TVRUICaptionsButtonAccessibility;
    return [(TVRUICaptionsButtonAccessibility *)&v4 accessibilityTraits];
  }
}

@end