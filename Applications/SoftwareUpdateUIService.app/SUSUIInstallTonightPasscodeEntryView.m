@interface SUSUIInstallTonightPasscodeEntryView
- (SUSUIInstallTonightPasscodeEntryView)initWithFrame:(CGRect)a3;
- (id)_bodyTextToModelSpecificLocalizedKey:(id)a3;
- (id)createPasscodeView;
- (void)setDescriptor:(id)a3;
- (void)setInstallTonightForecast:(id)a3;
- (void)updateStatusText;
@end

@implementation SUSUIInstallTonightPasscodeEntryView

- (SUSUIInstallTonightPasscodeEntryView)initWithFrame:(CGRect)a3
{
  CGRect v9 = a3;
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIInstallTonightPasscodeEntryView;
  v5 = -[SUSUIPasscodeEntryView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5) {
    [(SUSUIInstallTonightPasscodeEntryView *)v8 updateStatusText];
  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v4;
}

- (void)setInstallTonightForecast:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (*(id *)(&v4->super._dismissing + 1) != location[0])
  {
    objc_storeStrong((id *)(&v4->super._dismissing + 1), location[0]);
    [(SUSUIInstallTonightPasscodeEntryView *)v4 updateStatusText];
  }
  objc_storeStrong(location, 0);
}

- (void)setDescriptor:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (*(id *)((char *)&v4->_forecast + 1) != location[0])
  {
    objc_storeStrong((id *)((char *)&v4->_forecast + 1), location[0]);
    [(SUSUIInstallTonightPasscodeEntryView *)v4 updateStatusText];
  }
  objc_storeStrong(location, 0);
}

- (id)createPasscodeView
{
  return +[SBUIPasscodeLockViewFactory installTonightPasscodeLockViewForUsersCurrentStyle];
}

- (void)updateStatusText
{
  v33 = self;
  SEL v32 = a2;
  char v31 = 0;
  char v31 = [*(id *)((char *)&self->_forecast + 1) isSplatOnly] & 1;
  id v30 = *(id *)(&v33->super._dismissing + 1);
  char v27 = 0;
  char v25 = 0;
  char v23 = 0;
  char v21 = 0;
  char v19 = 0;
  char v17 = 0;
  if (v31)
  {
    id v28 = [v30 _susui_cardinalityForRoundedStartTime];
    char v27 = 1;
    id v26 = [v30 _susui_cardinalityForRoundedEndTime];
    char v25 = 1;
    v24 = +[NSString stringWithFormat:@"RSR_PASSCODE_SUBTITLE_%@_TO_%@", v28, v26];
    char v23 = 1;
    v2 = v24;
  }
  else
  {
    id v22 = [v30 _susui_cardinalityForRoundedStartTime];
    char v21 = 1;
    id v20 = [v30 _susui_cardinalityForRoundedEndTime];
    char v19 = 1;
    v18 = +[NSString stringWithFormat:@"SOFTWARE_UPDATE_PASSCODE_SUBTITLE_%@_TO_%@", v22, v20];
    char v17 = 1;
    v2 = v18;
  }
  id v29 = v2;
  if (v17) {

  }
  if (v19) {
  if (v21)
  }

  if (v23) {
  if (v25)
  }

  if (v27) {
  id v6 = [(SUSUIInstallTonightPasscodeEntryView *)v33 _bodyTextToModelSpecificLocalizedKey:v29];
  }
  id v5 = [v30 _susui_formattedRoundedStartTimeString];
  id v4 = [v30 _susui_formattedRoundedEndTimeString];
  id location = +[NSString stringWithValidatedFormat:v6, @"%@ %@", 0, v5, v4 validFormatSpecifiers error];

  SEL v7 = [(SUSUIPasscodeEntryView *)v33 passcodeLockView];
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  if (v31)
  {
    v15 = +[NSBundle mainBundle];
    char v14 = 1;
    v13 = [(NSBundle *)v15 localizedStringForKey:@"RSR_PASSCODE_TITLE" value:&stru_100019720 table:@"SoftwareUpdateUIService"];
    char v12 = 1;
    v3 = v13;
  }
  else
  {
    v11 = +[NSBundle mainBundle];
    char v10 = 1;
    CGRect v9 = [(NSBundle *)v11 localizedStringForKey:@"SOFTWARE_UPDATE_PASSCODE_TITLE" value:&stru_100019720 table:@"SoftwareUpdateUIService"];
    char v8 = 1;
    v3 = v9;
  }
  [(SBUIPasscodeLockView *)v7 updateStatusText:v3 subtitle:location animated:0];
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  if (v14) {
  objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
}

- (id)_bodyTextToModelSpecificLocalizedKey:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v7 = +[NSBundle mainBundle];
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:location[0]];
  char v8 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:");

  if (!v8)
  {
    id v5 = +[NSBundle mainBundle];
    char v8 = [(NSBundle *)v5 localizedStringForKey:location[0] value:&stru_100019720 table:@"SoftwareUpdateUIService"];
  }
  id v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (void).cxx_destruct
{
}

@end