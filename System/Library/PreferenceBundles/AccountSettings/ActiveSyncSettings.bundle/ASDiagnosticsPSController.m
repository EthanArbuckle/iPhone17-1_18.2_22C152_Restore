@interface ASDiagnosticsPSController
- (id)currentPingIntervalForSpecifier:(id)a3;
- (id)specifiers;
@end

@implementation ASDiagnosticsPSController

- (id)specifiers
{
  v14.receiver = self;
  v14.super_class = (Class)ASDiagnosticsPSController;
  v3 = [(ESDiagnosticsPSController *)&v14 specifiers];
  id v4 = [v3 mutableCopy];

  v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"PING_INTERVAL" value:&stru_30C50 table:@"Diagnostic"];
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"currentPingIntervalForSpecifier:" detail:0 cell:4 edit:0];

  [v4 addObject:v5];
  [v4 addObject:v8];
  uint64_t v9 = OBJC_IVAR___PSListController__specifiers;
  v10 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v4;
  id v11 = v4;

  id v12 = *(id *)&self->super.PSListController_opaque[v9];
  return v12;
}

- (id)currentPingIntervalForSpecifier:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue(@"LastGoodPingHeartBeat", @"com.apple.dataaccess.dataaccessd");
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v3 intValue]);

  return v4;
}

@end