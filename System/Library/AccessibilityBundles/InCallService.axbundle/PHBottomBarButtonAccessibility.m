@interface PHBottomBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
@end

@implementation PHBottomBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHBottomBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(PHBottomBarButtonAccessibility *)self safeValueForKey:@"action"];
  uint64_t v4 = [v3 integerValue];

  switch(v4)
  {
    case 1:
      v5 = @"answer.call";
      goto LABEL_12;
    case 2:
    case 4:
    case 5:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 17:
    case 18:
    case 19:
      goto LABEL_6;
    case 3:
      v5 = @"answer.video.call";
      goto LABEL_12;
    case 7:
    case 8:
      v5 = @"decline.call";
      goto LABEL_12;
    case 15:
    case 16:
      v5 = @"end.call";
      goto LABEL_12;
    case 20:
      v5 = @"camera.flip";
      goto LABEL_12;
    case 21:
      v5 = @"mute.button";
      goto LABEL_12;
    case 22:
      v5 = @"audio.route";
      goto LABEL_12;
    default:
      if (v4 == 26)
      {
        v5 = @"call.text";
LABEL_12:
        v6 = accessibilityMobilePhoneLocalizedString(v5);
      }
      else
      {
LABEL_6:
        v8.receiver = self;
        v8.super_class = (Class)PHBottomBarButtonAccessibility;
        v6 = [(PHBottomBarButtonAccessibility *)&v8 accessibilityLabel];
      }
      return v6;
  }
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9.receiver = self;
  v9.super_class = (Class)PHBottomBarButtonAccessibility;
  uint64_t v4 = [(PHBottomBarButtonAccessibility *)&v9 accessibilityUserInputLabels];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(PHBottomBarButtonAccessibility *)self safeValueForKey:@"action"];
  uint64_t v6 = [v5 integerValue];

  if ((v6 | 2) == 3)
  {
    v7 = accessibilityMobilePhoneLocalizedString(@"answer");
    [v3 addObject:v7];
  }

  return v3;
}

@end