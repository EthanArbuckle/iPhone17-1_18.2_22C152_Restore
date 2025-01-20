@interface AXCallAudioRoutingController
- (AXCallAudioRoutingController)init;
- (id)_localizedSummaryForDelay:(double)a3;
- (id)autoAnswerDelaySummary:(id)a3;
- (id)specifiers;
- (int)_callAudioRoutingFromSpecifierKey:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation AXCallAudioRoutingController

- (AXCallAudioRoutingController)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXCallAudioRoutingController;
  v2 = [(AXCallAudioRoutingController *)&v11 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __36__AXCallAudioRoutingController_init__block_invoke;
    v8[3] = &unk_208798;
    objc_copyWeak(&v9, &location);
    [v3 registerUpdateBlock:v8 forRetrieveSelector:"callAudioRoutingAutoAnswerDelay" withListener:v2];

    objc_destroyWeak(&v9);
    v4 = +[AXSettings sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __36__AXCallAudioRoutingController_init__block_invoke_2;
    v6[3] = &unk_208798;
    objc_copyWeak(&v7, &location);
    [v4 registerUpdateBlock:v6 forRetrieveSelector:"callAudioRoutingAutoAnswerEnabled" withListener:v2];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__AXCallAudioRoutingController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"callAudioRoutingAutoAnswer"];
}

void __36__AXCallAudioRoutingController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifierID:@"callAudioRoutingAutoAnswer"];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AXCallAudioRoutingController *)self loadSpecifiersFromPlistName:@"CallAudioRoutingSettings" target:self];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)autoAnswerDelaySummary:(id)a3
{
  v4 = +[AXSettings sharedInstance];
  if ([v4 callAudioRoutingAutoAnswerEnabled])
  {
    [v4 callAudioRoutingAutoAnswerDelay];
    -[AXCallAudioRoutingController _localizedSummaryForDelay:](self, "_localizedSummaryForDelay:");
  }
  else
  {
    AXParameterizedLocalizedString();
  uint64_t v5 = };

  return v5;
}

- (id)_localizedSummaryForDelay:(double)a3
{
  return (id)AXLocalizedTimeSummary();
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a4;
  v6 = [v12 specifier];
  id v7 = [v6 propertyForKey:@"type"];
  unsigned int v8 = [v7 isEqualToString:@"DefaultRouteForCall"];

  if (v8)
  {
    id v9 = [v12 specifier];
    v10 = [v9 propertyForKey:PSKeyNameKey];
    unsigned int v11 = [(AXCallAudioRoutingController *)self _callAudioRoutingFromSpecifierKey:v10];

    [v12 setChecked:v11 == _AXSDefaultRouteForCall()];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AXCallAudioRoutingController;
  [(AXCallAudioRoutingController *)&v32 tableView:v6 didSelectRowAtIndexPath:v7];
  v31.receiver = self;
  v31.super_class = (Class)AXCallAudioRoutingController;
  unsigned int v8 = [(AXCallAudioRoutingController *)&v31 tableView:v6 cellForRowAtIndexPath:v7];
  id v9 = [v8 specifier];
  v10 = [v9 propertyForKey:@"type"];
  unsigned int v11 = [v10 isEqualToString:@"DefaultRouteForCall"];

  if (v11)
  {
    id v12 = [v8 specifier];
    v13 = [v12 propertyForKey:PSKeyNameKey];
    unsigned int v14 = [(AXCallAudioRoutingController *)self _callAudioRoutingFromSpecifierKey:v13];

    if (v14 != _AXSDefaultRouteForCall())
    {
      v24 = v8;
      id v25 = v7;
      _AXSSetDefaultRouteForCall();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v26 = v6;
      v15 = [v6 visibleCells];
      id v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v21 = [v20 specifier];
            v22 = [v21 propertyForKey:@"type"];
            unsigned int v23 = [v22 isEqualToString:@"DefaultRouteForCall"];

            if (v23) {
              [v20 setChecked:0];
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v17);
      }

      unsigned int v8 = v24;
      [v24 setChecked:1];
      id v7 = v25;
      id v6 = v26;
    }
  }
}

- (int)_callAudioRoutingFromSpecifierKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"callAudioRoutingAutomatic"]) {
    goto LABEL_7;
  }
  if (([v3 isEqualToString:@"callAudioRoutingHeadset"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"callAudioRoutingSpeaker"])
    {
      int v4 = 2;
      goto LABEL_8;
    }
    _AXAssert();
LABEL_7:
    int v4 = 0;
    goto LABEL_8;
  }
  int v4 = 1;
LABEL_8:

  return v4;
}

@end