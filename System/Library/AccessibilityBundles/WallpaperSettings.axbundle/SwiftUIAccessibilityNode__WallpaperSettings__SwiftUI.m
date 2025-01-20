@interface SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axWallpaperDescription;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axWallpaperDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)self accessibilityIdentifier];
  if (([v3 hasPrefix:@"WALLPAPER_"] & 1) != 0
    || ([v3 hasPrefix:@"WALLPAPER_HOME_SCREEN_"] & 1) != 0
    || [v3 hasPrefix:@"WALLPAPER_LOCK_SCREEN_"])
  {
    v4 = [v3 stringByReplacingOccurrencesOfString:@"WALLPAPER_HOME_SCREEN_" withString:&stru_26F839440];
    v5 = [v4 stringByReplacingOccurrencesOfString:@"WALLPAPER_LOCK_SCREEN_" withString:&stru_26F839440];

    v6 = [v5 stringByReplacingOccurrencesOfString:@"WALLPAPER_" withString:&stru_26F839440];

    v7 = AXWallpaperLabel(v6);
    if ([v7 isEqualToString:v6])
    {
      v15.receiver = self;
      v15.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
      v8 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)&v15 accessibilityLabel];
      int v9 = [v8 isEqualToString:@"Dynamic"];

      if (v9)
      {
        uint64_t v10 = AXWallpaperLabel(v3);
      }
      else
      {
        v14.receiver = self;
        v14.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
        v11 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)&v14 accessibilityLabel];
        uint64_t v10 = AXWallpaperLabel(v11);

        v7 = v11;
      }

      v7 = (void *)v10;
    }
    v12 = AXLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_242729000, v12, OS_LOG_TYPE_INFO, "Wallpaper: %@/%@", buf, 0x16u);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
  unint64_t v3 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)&v8 accessibilityTraits];
  v4 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)self _axWallpaperDescription];
  uint64_t v5 = [v4 length];

  uint64_t v6 = *MEMORY[0x263F1CF00];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  unint64_t v3 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)self _axWallpaperDescription];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
  return [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)&v6 _accessibilityMediaAnalysisOptions];
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  if (a3 == 2701)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI _accessibilityMediaAnalysisOptions](self, "_accessibilityMediaAnalysisOptions"));
    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 != 2001
    || ([(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)self accessibilityLabel],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
    uint64_t v5 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)&v7 _iosAccessibilityAttributeValue:a3];
  }
LABEL_7:

  return v5;
}

- (id)accessibilityLabel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"Dynamic"])
  {
    uint64_t v4 = @"dynamic.wallpapers";
LABEL_5:
    accessibilityLocalizedString(v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"Still"])
  {
    uint64_t v4 = @"still.wallpapers";
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI;
  objc_super v6 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)&v12 accessibilityLabel];
  uint64_t v7 = [(SwiftUIAccessibilityNode__WallpaperSettings__SwiftUI *)self _axWallpaperDescription];
  objc_super v8 = (void *)v7;
  if (v7) {
    int v9 = (void *)v7;
  }
  else {
    int v9 = v6;
  }
  id v5 = v9;
  uint64_t v10 = AXLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_242729000, v10, OS_LOG_TYPE_INFO, "%@ Wallpaper swift UI label: %@", buf, 0x16u);
  }

LABEL_12:

  return v5;
}

@end