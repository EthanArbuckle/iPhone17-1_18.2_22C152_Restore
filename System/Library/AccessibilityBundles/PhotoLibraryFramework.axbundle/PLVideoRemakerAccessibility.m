@interface PLVideoRemakerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_didEndRemakingWithTemporaryPath:(id)a3;
- (void)cancel;
@end

@implementation PLVideoRemakerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLVideoRemaker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)PLVideoRemakerAccessibility;
  [(PLVideoRemakerAccessibility *)&v2 cancel];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_didEndRemakingWithTemporaryPath:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PLVideoRemakerAccessibility;
  [(PLVideoRemakerAccessibility *)&v3 _didEndRemakingWithTemporaryPath:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end