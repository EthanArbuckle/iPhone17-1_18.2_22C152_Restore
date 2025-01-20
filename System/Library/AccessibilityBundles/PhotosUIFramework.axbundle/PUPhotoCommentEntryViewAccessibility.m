@interface PUPhotoCommentEntryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PUPhotoCommentEntryViewAccessibility)initWithFrame:(CGRect)a3;
@end

@implementation PUPhotoCommentEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoCommentEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoCommentEntryView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoCommentEntryView", @"placeholderLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoCommentEntryView", @"postButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoCommentEntryView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (PUPhotoCommentEntryViewAccessibility)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoCommentEntryViewAccessibility;
  id v3 = -[PUPhotoCommentEntryViewAccessibility initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_opt_class();
  v4 = [(PUPhotoCommentEntryViewAccessibility *)v3 safeValueForKey:@"placeholderLabel"];
  v5 = [v4 safeValueForKey:@"text"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(PUPhotoCommentEntryViewAccessibility *)v3 safeValueForKey:@"textView"];
  [v7 setAccessibilityIdentifier:@"AddCommentTextView"];

  v8 = [(PUPhotoCommentEntryViewAccessibility *)v3 safeValueForKey:@"textView"];
  [v8 setAccessibilityLabel:v6];

  v9 = [(PUPhotoCommentEntryViewAccessibility *)v3 safeValueForKey:@"placeholderLabel"];
  [v9 setIsAccessibilityElement:0];

  return v3;
}

@end