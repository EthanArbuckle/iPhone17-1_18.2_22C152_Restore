@interface HearingAidAudioRoutingController
- (id)accessibilityPreferenceForSpecifier:(id)a3;
- (id)specifiers;
- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation HearingAidAudioRoutingController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HearingAidAudioRoutingController;
  [(HearingAidAudioRoutingController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(HearingAidAudioRoutingController *)self loadSpecifiersFromPlistName:@"HearingAidAudioSettings" target:self];
    id v6 = [v5 copy];
    v7 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [a4 properties];
  id v9 = [v6 objectForKey:PSKeyNameKey];

  id v7 = [v5 integerValue];
  if ([v9 isEqualToString:@"DefaultRouteForCall"])
  {
    v8 = +[HUHearingAidSettings sharedInstance];
    [v8 setCallAudioRoute:v7];
  }
  else
  {
    if (![v9 isEqualToString:@"DefaultRouteForMedia"]) {
      goto LABEL_6;
    }
    v8 = +[HUHearingAidSettings sharedInstance];
    [v8 setMediaAudioRoute:v7];
  }

LABEL_6:
}

- (id)accessibilityPreferenceForSpecifier:(id)a3
{
  uint64_t v3 = [a3 properties];
  v4 = [v3 objectForKey:PSKeyNameKey];

  if ([v4 isEqualToString:@"DefaultRouteForCall"])
  {
    id v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 callAudioRoute];
LABEL_5:
    id v7 = +[NSNumber numberWithInteger:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"DefaultRouteForMedia"])
  {
    id v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 mediaAudioRoute];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

@end