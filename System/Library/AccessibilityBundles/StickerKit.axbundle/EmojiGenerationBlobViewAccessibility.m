@interface EmojiGenerationBlobViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation EmojiGenerationBlobViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"StickerKit.EmojiGenerationBlobView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"StickerKit.EmojiGenerationBlobView" hasSwiftField:@"queryInfo" withSwiftType:"Optional<EmojiQueryInfo>"];
  [v3 validateClass:@"StickerKit.EmojiQueryInfo" hasSwiftField:@"searchString" withSwiftType:"String"];
}

- (id)accessibilityLabel
{
  v2 = [(EmojiGenerationBlobViewAccessibility *)self safeSwiftValueForKey:@"queryInfo"];
  id v3 = [v2 safeSwiftValueForKey:@"searchString"];

  return v3;
}

@end