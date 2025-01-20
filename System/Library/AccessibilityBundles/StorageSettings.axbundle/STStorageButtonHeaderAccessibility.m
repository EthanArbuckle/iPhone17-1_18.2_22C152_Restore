@interface STStorageButtonHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation STStorageButtonHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageButtonHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageButtonHeaderAccessibility;
  v2 = [(STStorageButtonHeaderAccessibility *)&v6 accessibilityLabel];
  if (AXRequestingClient() == 3)
  {
    id v3 = [v2 lowercaseString];
  }
  else
  {
    id v3 = v2;
  }
  v4 = v3;

  return v4;
}

@end