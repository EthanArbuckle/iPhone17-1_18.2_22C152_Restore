@interface CKImageAttachmentItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CKImageAttachmentItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKImageAttachmentItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKAttachmentItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentItem", @"isIrisAsset", "B", 0);
  [v3 validateClass:@"CKImageAttachmentItem" isKindOfClass:@"CKAttachmentItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKImageAttachmentItem", @"imageData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKImageData", @"image", "@", 0);
  [v3 validateClass:@"CKMovieAttachmentItem" isKindOfClass:@"CKAttachmentItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAttachmentItem", @"fileURL", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKImageAttachmentItemAccessibility *)self safeValueForKey:@"isIrisAsset"];
  char v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"live.photo");
    v6 = AXAttributedStringForBetterPronuciation();
  }
  else
  {
    v6 = accessibilityLocalizedString(@"photo.attachment");
  }
  v7 = [(CKImageAttachmentItemAccessibility *)self safeValueForKey:@"fileURL"];
  v8 = __UIAccessibilitySafeClass();

  v9 = UIAccessibilityMetadataDescriptionForImage();
  v12 = UIAccessibilityPhotoCreationDate();
  v10 = __UIAXStringForVariables();

  return v10;
}

@end