@interface CKPhotoSearchResultCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axContact;
- (id)_axDescription;
- (id)_axImageURL;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetContact:(id)a3;
- (void)_axSetDescription:(id)a3;
- (void)_axSetImageURL:(id)a3;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)prepareForReuse;
@end

@implementation CKPhotoSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPhotoSearchResultCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axContact
{
}

- (void)_axSetContact:(id)a3
{
}

- (id)_axDescription
{
}

- (void)_axSetDescription:(id)a3
{
}

- (id)_axImageURL
{
}

- (void)_axSetImageURL:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKPhotoSearchResultCell" isKindOfClass:@"CKEditableSearchResultCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPhotoSearchResultCell", @"isLivePhoto", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEditableSearchResultCell", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPhotoSearchResultCell", @"isVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPhotoSearchResultCell", @"durationLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPhotoSearchResultCell", @"prepareForReuse", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPhotoSearchResultCell", @"configureWithQueryResult:searchText:mode:", "v", "@", "@", "Q", 0);
  [v3 validateClass:@"CKSpotlightQueryResult"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKSpotlightQueryResult", @"item", "@", 0);
  [v3 validateClass:@"CSSearchableItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSSearchableItem", @"attributeSet", "@", 0);
  [v3 validateClass:@"CSSearchableItemAttributeSet"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSSearchableItemAttributeSet", @"contentURL", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CKPhotoSearchResultCellAccessibility *)self _axContact];
  v4 = AXCKLocalizedFromStringWithContact(v3);

  if ([(CKPhotoSearchResultCellAccessibility *)self safeBoolForKey:@"isVideo"])
  {
    v5 = accessibilityLocalizedString(@"video.attachment");
    v6 = [(CKPhotoSearchResultCellAccessibility *)self safeUIViewForKey:@"durationLabel"];
    v7 = [v6 accessibilityLabel];
    uint64_t v8 = AXLocalizeDurationTime();
  }
  else
  {
    if ([(CKPhotoSearchResultCellAccessibility *)self safeBoolForKey:@"isLivePhoto"])v9 = @"live.photo"; {
    else
    }
      v9 = @"photo.attachment";
    v5 = accessibilityLocalizedString(v9);
    v10 = [(CKPhotoSearchResultCellAccessibility *)self _axDescription];
    v6 = [(CKPhotoSearchResultCellAccessibility *)self _axImageURL];
    if ([v10 length] || !v6) {
      goto LABEL_16;
    }
    v7 = UIAccessibilityPhotoCreationDate();
    v11 = UIAccessibilityEmojiDescription();
    if ([v11 length])
    {
      v12 = accessibilityUIKitLocalizedString();
      v17 = v7;
      v16 = v11;
      uint64_t v8 = __UIAXStringForVariables();
    }
    else
    {
      v12 = UIAccessibilityMetadataDescriptionForImage();
      if (UIAccessibilityIsImageScreenshot())
      {
        uint64_t v13 = accessibilityUIKitLocalizedString();
      }
      else
      {
        uint64_t v13 = 0;
      }
      v17 = v7;
      v16 = v12;
      uint64_t v8 = __UIAXStringForVariables();

      v10 = (void *)v13;
    }

    [(CKPhotoSearchResultCellAccessibility *)self _axSetDescription:v8, v16, v17, @"__AXStringForVariablesSentinel"];
  }

  v10 = (void *)v8;
LABEL_16:

  v14 = __UIAXStringForVariables();

  return v14;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CF00];
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CKPhotoSearchResultCellAccessibility;
  id v8 = a3;
  [(CKPhotoSearchResultCellAccessibility *)&v10 configureWithQueryResult:v8 searchText:a4 mode:a5];
  v9 = objc_msgSend(v8, "safeValueForKeyPath:", @"item.attributeSet.contentURL", v10.receiver, v10.super_class);

  [(CKPhotoSearchResultCellAccessibility *)self _axSetImageURL:v9];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKPhotoSearchResultCellAccessibility;
  [(CKPhotoSearchResultCellAccessibility *)&v3 prepareForReuse];
  [(CKPhotoSearchResultCellAccessibility *)self _axSetDescription:0];
  [(CKPhotoSearchResultCellAccessibility *)self _axSetContact:0];
  [(CKPhotoSearchResultCellAccessibility *)self _axSetImageURL:0];
}

@end