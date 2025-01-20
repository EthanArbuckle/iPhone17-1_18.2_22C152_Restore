@interface CNPhotoPickerGlyphProviderItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (NSString)_axSymbolName;
@end

@implementation CNPhotoPickerGlyphProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerGlyphProviderItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (NSString)_axSymbolName
{
  v2 = [(CNPhotoPickerGlyphProviderItemAccessibility *)self safeStringForKey:@"symbolImageName"];
  v3 = v2;
  if (v2)
  {
    if ([v2 isEqualToString:@"camera"])
    {
      v4 = @"take.photo.button";
LABEL_12:
      v5 = accessibilityLocalizedString(v4);
      goto LABEL_14;
    }
    if ([v3 isEqualToString:@"photo.on.rectangle"])
    {
      v4 = @"photo.gallery.button";
      goto LABEL_12;
    }
    if ([v3 isEqualToString:@"face.grinning"])
    {
      v4 = @"new.emoji.button";
      goto LABEL_12;
    }
    if ([v3 isEqualToString:@"pencil"])
    {
      v4 = @"edit.monogram.button";
      goto LABEL_12;
    }
    if ([v3 isEqualToString:@"plus"])
    {
      v4 = @"contact.image.add.button.label";
      goto LABEL_12;
    }
  }
  v5 = 0;
LABEL_14:

  return (NSString *)v5;
}

@end