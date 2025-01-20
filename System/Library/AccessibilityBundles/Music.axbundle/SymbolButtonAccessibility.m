@interface SymbolButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsCircularProgressView;
- (BOOL)accessibilityIsInCell;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelHelper;
- (id)_axCustomView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)accessibilityUpdateSymbolButton;
- (void)setAccessibilityIsInCell:(BOOL)a3;
@end

@implementation SymbolButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicCoreUI.SymbolButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.SymbolButton", @"accessibilityCustomView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.SymbolButton", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.SymbolButton", @"accessibilityImageView", "@", 0);
  [v3 validateClass:@"MusicCoreUI.CircularProgressView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageView", @"image", "@", 0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.SymbolButton", @"accessibilityUpdateSymbolButton", "v", 0);
  [v3 validateClass:@"MusicCoreUI.CoreAnimationPackageView"];
  [v3 validateClass:@"MusicCoreUI.CoreAnimationPackageView" hasSwiftField:@"definition" withSwiftType:"CAPackageDefinition"];
  [v3 validateSwiftStruct:@"MusicCoreUI.CAPackageDefinition"];
  [v3 validateSwiftStruct:@"MusicCoreUI.CAPackageDefinition" hasSwiftField:@"name" withSwiftType:"String"];
  [v3 validateClass:@"MusicCoreUI.SymbolButton" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isSelected", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SymbolButtonAccessibility *)self _accessibilityLabelHelper];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_axCustomView
{
  return (id)[(SymbolButtonAccessibility *)self safeUIViewForKey:@"accessibilityCustomView"];
}

- (BOOL)_axIsCircularProgressView
{
  v2 = [(SymbolButtonAccessibility *)self _axCustomView];
  if (v2 && (MEMORY[0x245658030](@"MusicCoreUI.CircularProgressView"), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 _accessibilityViewIsVisible];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)_accessibilityLabelHelper
{
  char v3 = [(SymbolButtonAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  BOOL v4 = [(SymbolButtonAccessibility *)self safeValueForKey:@"accessibilityImageView"];
  if ([(SymbolButtonAccessibility *)self _axIsCircularProgressView])
  {
    v5 = accessibilityMusicLocalizedString(@"downloading");
  }
  else
  {
    v5 = 0;
  }
  if (![v5 length] && v3 && objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    uint64_t v6 = [v3 accessibilityLabel];

    v5 = (void *)v6;
  }
  if (![v5 length])
  {
    if (!v4) {
      goto LABEL_15;
    }
    v7 = [v4 safeValueForKey:@"image"];
    v8 = [v7 safeValueForKey:@"_imageAsset"];
    v9 = [v8 safeStringForKey:@"assetName"];

    if (([v9 isEqualToString:@"icloud.and.arrow.down"] & 1) != 0
      || [v9 isEqualToString:@"arrow.down"])
    {
      v10 = @"download.button";
    }
    else if ([v9 isEqualToString:@"checkmark"])
    {
      if ([(SymbolButtonAccessibility *)self accessibilityIsInCell]) {
        v10 = @"remove.download";
      }
      else {
        v10 = @"downloaded";
      }
    }
    else if ([v9 isEqualToString:@"exclamationmark.icloud"])
    {
      v10 = @"download.error";
    }
    else if ([v9 isEqualToString:@"classical"])
    {
      v10 = @"classical.app";
    }
    else if ([v9 isEqualToString:@"stop.fill"])
    {
      v10 = @"cancel.download";
    }
    else if ([v9 isEqualToString:@"calendar"])
    {
      v10 = @"schedule.calendar";
    }
    else if ([v9 isEqualToString:@"ellipsis"])
    {
      v10 = @"more.button";
    }
    else if ([v9 isEqualToString:@"songcredits_toolbar_button_lyrics"])
    {
      v10 = @"share.lyrics.button";
    }
    else if ([v9 isEqualToString:@"songcredits_close_nav"])
    {
      v10 = @"close.button";
    }
    else if ([v9 isEqualToString:@"person.2.fill"])
    {
      v10 = @"manage.collaboration.button";
    }
    else if ([v9 isEqualToString:@"person.fill.badge.plus"])
    {
      v10 = @"collaboration.button";
    }
    else
    {
      if (![v9 isEqualToString:@"plus"]
        || ([(SymbolButtonAccessibility *)self accessibilityIdentifier],
            v19 = objc_claimAutoreleasedReturnValue(),
            int v20 = [v19 isEqualToString:@"Music.ContainerDetail.AddButton"],
            v19,
            !v20))
      {
        if ([v9 isEqualToString:@"dolby.audio"])
        {
          v21 = @"dolby.audio";
        }
        else if ([v9 isEqualToString:@"dolby.atmos"])
        {
          v21 = @"dolby.atmos";
        }
        else if ([v9 isEqualToString:@"apple.digital.master"])
        {
          v21 = @"apple.digital.master";
        }
        else if ([v9 isEqualToString:@"dolby"])
        {
          v21 = @"dolby";
        }
        else
        {
          if (![v9 isEqualToString:@"lossless"])
          {
            uint64_t v11 = [v4 accessibilityLabel];
            goto LABEL_14;
          }
          v21 = @"lossless";
        }
        uint64_t v11 = accessibilityOasisMusicLocalizedString(v21);
LABEL_14:
        v12 = (void *)v11;

        v5 = v12;
LABEL_15:
        if (![v5 length])
        {
          v13 = [(SymbolButtonAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_5];
          v14 = v13;
          if (v13)
          {
            v15 = [v13 safeSwiftValueForKey:@"definition"];
            v16 = [v15 safeSwiftStringForKey:@"name"];
            if (([v16 isEqualToString:@"Favorite"] & 1) != 0
              || ([v16 isEqualToString:@"FavoriteDark"] & 1) != 0
              || ([v16 isEqualToString:@"FavoriteHighContrastDark"] & 1) != 0
              || [v16 isEqualToString:@"FavoriteHighContrastLight"])
            {
              uint64_t v17 = accessibilityMusicLocalizedString(@"favorite");

              v5 = (void *)v17;
            }
          }
        }
        goto LABEL_24;
      }
      v10 = @"add.to.library";
    }
    uint64_t v11 = accessibilityMusicLocalizedString(v10);
    goto LABEL_14;
  }
LABEL_24:

  return v5;
}

uint64_t __54__SymbolButtonAccessibility__accessibilityLabelHelper__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245658030](@"MusicCoreUI.CoreAnimationPackageView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)SymbolButtonAccessibility;
  char v3 = [(SymbolButtonAccessibility *)&v6 accessibilityLabel];
  if (![v3 length])
  {
    uint64_t v4 = [(SymbolButtonAccessibility *)self _accessibilityLabelHelper];

    char v3 = (void *)v4;
  }

  return v3;
}

- (id)accessibilityValue
{
  v7.receiver = self;
  v7.super_class = (Class)SymbolButtonAccessibility;
  char v3 = [(SymbolButtonAccessibility *)&v7 accessibilityValue];
  if ([(SymbolButtonAccessibility *)self _axIsCircularProgressView])
  {
    uint64_t v4 = [(SymbolButtonAccessibility *)self _axCustomView];
    id v5 = [v4 accessibilityValue];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SymbolButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(SymbolButtonAccessibility *)&v7 accessibilityTraits];
  if ([(SymbolButtonAccessibility *)self _axIsCircularProgressView])
  {
    uint64_t v4 = [(SymbolButtonAccessibility *)self _axCustomView];
    v3 |= [v4 accessibilityTraits];
  }
  id v5 = [(SymbolButtonAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_449];
  if (v5 && [(SymbolButtonAccessibility *)self safeBoolForKey:@"isSelected"]) {
    v3 |= *MEMORY[0x263F1CF38];
  }

  return v3;
}

uint64_t __48__SymbolButtonAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245658030](@"MusicCoreUI.CoreAnimationPackageView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (void)accessibilityUpdateSymbolButton
{
  v2.receiver = self;
  v2.super_class = (Class)SymbolButtonAccessibility;
  [(SymbolButtonAccessibility *)&v2 accessibilityUpdateSymbolButton];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)accessibilityIsInCell
{
  return self->_accessibilityIsInCell;
}

- (void)setAccessibilityIsInCell:(BOOL)a3
{
  self->_accessibilityIsInCell = a3;
}

@end