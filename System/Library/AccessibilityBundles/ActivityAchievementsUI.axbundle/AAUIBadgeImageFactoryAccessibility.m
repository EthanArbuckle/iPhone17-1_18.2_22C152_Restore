@interface AAUIBadgeImageFactoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4;
@end

@implementation AAUIBadgeImageFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUIBadgeImageFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUIBadgeImageFactory", @"thumbnailImageForAchievement:size:", "@", "@", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACHAchievement", @"earnedInstances", "@", 0);
}

- (id)thumbnailImageForAchievement:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v13.receiver = self;
  v13.super_class = (Class)AAUIBadgeImageFactoryAccessibility;
  id v6 = a3;
  v7 = -[AAUIBadgeImageFactoryAccessibility thumbnailImageForAchievement:size:](&v13, "thumbnailImageForAchievement:size:", v6, width, height);
  v8 = [v6 safeArrayForKey:@"earnedInstances"];

  id v9 = [v8 count];
  if (v9)
  {
    v10 = accessibilityLocalizedString(@"achievement.earn.count");
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v9);
    [v7 setAccessibilityValue:v11];
  }
  else
  {
    v10 = accessibilityLocalizedString(@"achievement.unearned");
    [v7 setAccessibilityValue:v10];
  }

  return v7;
}

@end