@interface CKMediaObjectBackedAssetAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (int64_t)_accessibilityMediaType;
- (unint64_t)accessibilityTraits;
@end

@implementation CKMediaObjectBackedAssetAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMediaObjectBackedAsset";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObjectBackedAsset", @"acknowledgmentChatItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMediaObjectBackedAsset", @"mediaType", "q", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKMediaObjectBackedAssetAccessibility *)self accessibilityUserDefinedLabel];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    goto LABEL_10;
  }
  int64_t v6 = [(CKMediaObjectBackedAssetAccessibility *)self _accessibilityMediaType];
  if (v6 == 1)
  {
    v7 = @"photo.attachment";
  }
  else
  {
    if (v6 != 2)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v7 = @"video.attachment";
  }
  v8 = accessibilityLocalizedString(v7);
LABEL_9:
  v10 = [(CKMediaObjectBackedAssetAccessibility *)self safeValueForKey:@"acknowledgmentChatItem"];
  __UIAXStringForVariables();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF00];
}

- (int64_t)_accessibilityMediaType
{
  return [(CKMediaObjectBackedAssetAccessibility *)self safeIntegerForKey:@"mediaType"];
}

@end