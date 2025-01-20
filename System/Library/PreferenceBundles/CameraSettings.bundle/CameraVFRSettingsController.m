@interface CameraVFRSettingsController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CameraVFRSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"vfrGroupSpecifier"];
    v7 = sub_7D30(@"CAM_AUTO_FPS_VFR_RADIO_FOOTER");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v6 setProperty:@"vfrGroupSpecifier" forKey:PSIDKey];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v8 = sub_7D30(@"CAM_AUTO_FPS_VFR_OFF");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v10 = sub_7D30(@"CAM_AUTO_FPS_VFR_30");
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v12 = sub_7D30(@"CAM_AUTO_FPS_VFR_30&60");
    v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceVFRMode", @"com.apple.camera", 0);
    v15 = v9;
    if (AppIntegerValue)
    {
      if (AppIntegerValue == 2)
      {
        v15 = v13;
      }
      else
      {
        id v16 = 0;
        v15 = v11;
        if (AppIntegerValue != 1) {
          goto LABEL_8;
        }
      }
    }
    id v16 = v15;
LABEL_8:
    [v6 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];
    [v5 addObject:v6];
    [v5 addObject:v9];
    [v5 addObject:v11];
    [v5 addObject:v13];
    +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v5];
    id v17 = [v5 copy];
    v18 = *(void **)&self->super.PSListController_opaque[v3];
    *(void *)&self->super.PSListController_opaque[v3] = v17;

    v4 = *(void **)&self->super.PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CameraVFRSettingsController;
  [(CameraVFRSettingsController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(CameraVFRSettingsController *)self specifierForID:@"vfrGroupSpecifier"];
  if (v7)
  {
    v8 = [(CameraVFRSettingsController *)self indexPathForSpecifier:v7];
    uint64_t v9 = (uint64_t)[v8 section];
  }
  else
  {
    uint64_t v9 = -1;
  }
  if ([v6 section] == (id)v9)
  {
    v10 = (char *)[v6 row];
    if (v10 == (unsigned char *)&dword_0 + 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v10 == (unsigned char *)&dword_0 + 1;
    }
    CFPreferencesSetAppValue(@"CAMUserPreferenceVFRMode", +[NSNumber numberWithInteger:v11], @"com.apple.camera");
    CFPreferencesAppSynchronize(@"com.apple.camera");
  }
}

@end