@interface _CKNanoMediaImagePresenterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation _CKNanoMediaImagePresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CKNanoMediaImagePresenter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CKNanoMediaImagePresenter", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"_CKNanoMediaImagePresenter" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoMediaPresenter", @"mediaObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObject", @"fileURL", "@", 0);
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)_CKNanoMediaImagePresenterAccessibility;
  [(_CKNanoMediaImagePresenterAccessibility *)&v17 viewDidLoad];
  id v3 = [(_CKNanoMediaImagePresenterAccessibility *)self safeValueForKey:@"_imageView"];
  [v3 setIsAccessibilityElement:1];
  v4 = [v3 accessibilityLabel];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    v6 = [(_CKNanoMediaImagePresenterAccessibility *)self safeValueForKey:@"mediaObject"];
    v7 = [v6 safeValueForKey:@"fileURL"];
    v8 = UIAccessibilityMetadataDescriptionForImage();
    v9 = UIAccessibilityEmojiDescription();
    if (!v8)
    {
      v10 = UIAccessibilityPhotoCreationDate();
      v11 = accessibilityLocalizedString(@"photo.attachment");
      v14 = v10;
      v16 = @"__AXStringForVariablesSentinel";
      v8 = __UIAXStringForVariables();
    }
    if (objc_msgSend(v9, "length", v14, v16))
    {
      v12 = accessibilityUIKitLocalizedString();
      v15 = v9;
    }
    else
    {
      if (UIAccessibilityIsImageScreenshot())
      {
        v12 = accessibilityUIKitLocalizedString();
      }
      else
      {
        v12 = 0;
      }
      v15 = v8;
    }
    v13 = __UIAXStringForVariables();
    objc_msgSend(v3, "setAccessibilityLabel:", v13, v15, @"__AXStringForVariablesSentinel");
  }
}

@end