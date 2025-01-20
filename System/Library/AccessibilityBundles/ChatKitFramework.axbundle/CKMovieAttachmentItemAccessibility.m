@interface CKMovieAttachmentItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CKMovieAttachmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMovieAttachmentItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMovieAttachmentItem" isKindOfClass:@"CKAttachmentItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentItem", @"fileURL", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = accessibilityLocalizedString(@"video.attachment");
  v4 = [(CKMovieAttachmentItemAccessibility *)self safeValueForKey:@"fileURL"];
  v5 = __UIAccessibilitySafeClass();

  v8 = UIAccessibilityMetadataDescriptionForVideo();
  v6 = __UIAXStringForVariables();

  return v6;
}

@end