@interface NSString(Camera)
+ (id)cam_localizedTitleForMode:()Camera wantsCompactTitle:;
- (id)cam_capitalizedStringWithPreferredLocale;
- (id)cam_uppercaseStringWithPreferredLocale;
@end

@implementation NSString(Camera)

- (id)cam_uppercaseStringWithPreferredLocale
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 preferredLocalizations];
  v4 = [v3 firstObject];
  v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  v6 = [a1 uppercaseStringWithLocale:v5];

  return v6;
}

- (id)cam_capitalizedStringWithPreferredLocale
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 preferredLocalizations];
  v4 = [v3 firstObject];
  v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  v6 = [a1 capitalizedStringWithLocale:v5];

  return v6;
}

+ (id)cam_localizedTitleForMode:()Camera wantsCompactTitle:
{
  switch(a3)
  {
    case 0:
      v5 = @"PHOTO";
      v6 = @"Title in Camera's mode switch for still photo mode.";
      goto LABEL_19;
    case 1:
      v5 = @"VIDEO";
      v6 = @"Title in Camera's mode switcher for video mode.";
      goto LABEL_19;
    case 2:
      v5 = @"SLALOM";
      v6 = @"Title in Camera's mode switcher for high frame rate video mode.";
      goto LABEL_19;
    case 3:
      v5 = @"PANO";
      v6 = @"Title in Camera's mode switcher for panorama mode.";
      goto LABEL_19;
    case 4:
      v5 = @"SQUARE";
      v6 = @"Title in Camera's mode switcher for square still photo mode.";
      goto LABEL_19;
    case 5:
      if (a4) {
        v5 = @"TIMELAPSE_IPAD";
      }
      else {
        v5 = @"TIMELAPSE";
      }
      v6 = @"Title in Camera's mode switcher for time-lapse mode.";
      goto LABEL_19;
    case 6:
      v5 = @"PORTRAIT";
      v6 = @"Title in Camera's mode switch for portrait mode.";
      goto LABEL_19;
    case 7:
      v5 = @"CINEMATIC";
      goto LABEL_18;
    case 8:
      v5 = @"SPATIAL_VIDEO_MODE_TITLE";
      goto LABEL_18;
    case 9:
      v5 = @"SPATIAL_PHOTO_MODE_TITLE";
LABEL_18:
      v6 = 0;
LABEL_19:
      v7 = CAMLocalizedFrameworkString(v5, v6);
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

@end