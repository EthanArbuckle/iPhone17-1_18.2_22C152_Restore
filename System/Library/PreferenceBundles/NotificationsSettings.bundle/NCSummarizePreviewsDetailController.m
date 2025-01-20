@interface NCSummarizePreviewsDetailController
- (NCSummarizePreviewsDetailControllerDelegate)delegate;
- (id)_updatesForSpecifiers:(id)a3 withGlobalSummarizationSetting:(int64_t)a4 animated:(BOOL)a5;
- (id)allowSummarization:(id)a3;
- (id)specifiers;
- (id)summarizationSetting:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSummarization:(id)a3 specifier:(id)a4;
- (void)setSummarizationSetting:(id)a3 specifier:(id)a4;
@end

@implementation NCSummarizePreviewsDetailController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"SUMMARIZE_NOTIFICATIONS_GROUP_ID"];
    v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v17 = [v7 localizedStringForKey:@"SUMMARIZATION_EXPLANATION_LONG" value:&stru_419A0 table:@"NotificationsSettings"];

    [v6 setProperty:v17 forKey:PSFooterTextGroupKey];
    [v5 addObject:v6];
    v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v9 = [v8 localizedStringForKey:@"SUMMARIZE_NOTIFICATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setSummarization:specifier:" get:"allowSummarization:" detail:0 cell:6 edit:0];

    [v10 setIdentifier:@"SUMMARIZE_NOTIFICATIONS_ID"];
    [v5 addObject:v10];
    v11 = +[NCSettingsGatewayController sharedInstance];
    id v12 = [v11 effectiveGlobalSummarizationSetting];

    v13 = [(NCSummarizePreviewsDetailController *)self _updatesForSpecifiers:v5 withGlobalSummarizationSetting:v12 animated:0];
    v14 = [v13 currentSpecifiers];
    [v5 setArray:v14];

    v15 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)allowSummarization:(id)a3
{
  uint64_t v3 = +[NCSettingsGatewayController sharedInstance];
  if ([v3 effectiveGlobalSummarizationSetting] == (char *)&dword_0 + 2) {
    v4 = &__kCFBooleanTrue;
  }
  else {
    v4 = &__kCFBooleanFalse;
  }
  id v5 = v4;

  return v5;
}

- (void)setSummarization:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  v6 = +[NCSettingsGatewayController sharedInstance];
  [v6 setEffectiveGlobalSummarizationSetting:v5];

  id v8 = [(NCSummarizePreviewsDetailController *)self _updatesForSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] withGlobalSummarizationSetting:v5 animated:1];
  [(NCSummarizePreviewsDetailController *)self performSpecifierUpdates:v8];
  v7 = [(NCSummarizePreviewsDetailController *)self delegate];
  [v7 summarizePreviewsDetailController:self didChangeGlobalSummarizePreviewsSetting:v5];
}

- (id)_updatesForSpecifiers:(id)a3 withGlobalSummarizationSetting:(int64_t)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  id v7 = a3;
  id v8 = +[PSSpecifierUpdates updatesWithSpecifiers:v7];
  if (a4 == 2)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = [v7 specifierForID:@"SUMMARIZATION_APP_LIST_GROUP_ID"];
    if (!v10)
    {
      v32 = v8;
      id v33 = v7;
      unsigned int v34 = v5;
      v11 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v12 = [v11 localizedStringForKey:@"SUMMARIZATION_APP_LIST_GROUP" value:&stru_419A0 table:@"NotificationsSettings"];
      uint64_t v13 = +[PSSpecifier groupSpecifierWithID:@"SUMMARIZATION_APP_LIST_GROUP_ID" name:v12];

      v31 = (void *)v13;
      [v9 addObject:v13];
      v14 = +[NCSettingsGatewayController sharedInstance];
      v15 = [v14 activeSectionInfo];

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_CDD8;
      v42[3] = &unk_41060;
      v42[4] = self;
      v30 = objc_msgSend(v15, "bs_filter:", v42);
      [v30 sortedArrayUsingComparator:&stru_41080];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v16 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v36 = *(void *)v39;
        uint64_t v18 = PSLazyIconLoading;
        uint64_t v19 = PSLazyIconAppID;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            v21 = v9;
            if (*(void *)v39 != v36) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v23 = BBSettingsDisplayNameForBBSection(v22);
            v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:"setSummarizationSetting:specifier:" get:"summarizationSetting:" detail:0 cell:6 edit:0];

            v25 = [v22 sectionID];
            [v24 setIdentifier:v25];

            [v24 setProperty:v22 forKey:@"BBSECTION_INFO_KEY"];
            [v24 setProperty:&__kCFBooleanTrue forKey:v18];
            v26 = [v22 sectionID];
            [v24 setProperty:v26 forKey:v19];

            id v9 = v21;
            objc_msgSend(v21, "bs_safeAddObject:", v24);
          }
          id v17 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v17);
      }

      uint64_t v5 = v34;
      id v8 = v32;
      id v7 = v33;
      v10 = v31;
    }
    objc_msgSend(v8, "insertContiguousSpecifiers:atIndex:", v9, objc_msgSend(v7, "count"));
  }
  else
  {
    v27 = [v7 indexOfSpecifierWithID:@"SUMMARIZATION_APP_LIST_GROUP_ID"];
    if (v27 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v8, "removeSpecifiersInRange:", v27, (unsigned char *)objc_msgSend(v7, "count") - v27);
    }
  }
  v28 = [v8 context];
  [v28 setAnimated:v5];

  return v8;
}

- (void)setSummarizationSetting:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v9 = [a4 propertyForKey:@"BBSECTION_INFO_KEY"];
  LODWORD(a4) = [v5 BOOLValue];

  if (a4) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v9 setSummarizationSetting:v6];
  id v7 = +[NCSettingsGatewayController sharedInstance];
  id v8 = [v9 sectionID];
  [v7 setSectionInfo:v9 forSectionID:v8];
}

- (id)summarizationSetting:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 summarizationSetting] == (char *)&dword_0 + 2);

  return v4;
}

- (NCSummarizePreviewsDetailControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSummarizePreviewsDetailControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end