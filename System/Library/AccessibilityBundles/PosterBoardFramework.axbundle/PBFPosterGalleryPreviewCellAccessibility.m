@interface PBFPosterGalleryPreviewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation PBFPosterGalleryPreviewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFPosterGalleryPreviewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBFPosterGalleryPreviewCell" conformsToProtocol:@"PBFPosterGalleryCollectionViewCell"];
  [v3 validateClass:@"PBFPosterGalleryPreviewCell" hasProperty:@"posterTitle" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFPosterGalleryPreviewCell", @"posterPreviewView", "@", 0);
  [v3 validateClass:@"PBFPosterGalleryPreviewView" hasInstanceVariable:@"_posterPreviewContentView" withType:"PBFPosterGalleryPreviewContentView"];
  [v3 validateClass:@"PBFPosterGalleryPreviewContentView" hasInstanceVariable:@"_index" withType:"NSUInteger"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PBFPosterGalleryPreviewCellAccessibility *)self safeUIViewForKey:@"posterPreviewView"];
  v4 = AXMappedLabelOrValueForPosterPreview(v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    goto LABEL_11;
  }
  v7 = AXPreviewIdentifier(v3);
  if ([v7 containsString:@"Gradient"])
  {
    uint64_t v8 = accessibilityLocalizedString(@"color.poster.label");
  }
  else
  {
    v9 = [(PBFPosterGalleryPreviewCellAccessibility *)self safeStringForKey:@"posterTitle"];
    if (v9)
    {
    }
    else
    {
      v10 = [(PBFPosterGalleryPreviewCellAccessibility *)self accessibilityValue];

      if (!v10)
      {
        v12 = [v3 safeUIViewForKey:@"_posterPreviewContentView"];
        v13 = accessibilityLocalizedString(@"poster.gallery.preview.cell.default.label");
        [v12 safeUnsignedIntegerForKey:@"_index"];
        AXCFormattedString();
        id v6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    uint64_t v8 = [(PBFPosterGalleryPreviewCellAccessibility *)self safeStringForKey:@"posterTitle"];
  }
  id v6 = (id)v8;
LABEL_10:

LABEL_11:

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(PBFPosterGalleryPreviewCellAccessibility *)self safeUIViewForKey:@"posterPreviewView"];
  v4 = AXMappedLabelOrValueForPosterPreview(v3);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PBFPosterGalleryPreviewCellAccessibility;
    id v6 = [(PBFPosterGalleryPreviewCellAccessibility *)&v9 accessibilityValue];
  }
  v7 = v6;

  return v7;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"poster.gallery.preview.cell.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end