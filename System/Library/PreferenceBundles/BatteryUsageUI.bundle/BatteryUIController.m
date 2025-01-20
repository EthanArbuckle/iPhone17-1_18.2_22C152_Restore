@interface BatteryUIController
- (BOOL)appQualifiers:(id)a3 containsQualifier:(int64_t)a4;
- (BOOL)checkOnInitIfServiceBatteryRequired;
- (BOOL)clearGraph;
- (BOOL)inDemoMode;
- (BOOL)isBatterySaverModeEnabled;
- (BOOL)isEduMode;
- (BOOL)isInBUIDemoMode;
- (BOOL)isServiceState;
- (BOOL)isSquished;
- (BOOL)isTapped;
- (BOOL)shouldAutoCycle;
- (BOOL)shouldDisplayBugSignatures;
- (BOOL)shouldEstimateCellHeightFor:(id)a3;
- (BOOL)showRootNodesInInternal;
- (BOOL)showSaveDemoButtonInInternal;
- (BOOL)waitingForResponse;
- (BatteryUIController)init;
- (BatteryUsageRadarComposeViewController)radarController;
- (NSDate)lastBatteryBreakdownQueryTime;
- (NSDictionary)currentLastChargeDictionary;
- (NSDictionary)currentPausedChargingDictionary;
- (NSMutableDictionary)currentDictionary;
- (NSMutableDictionary)currentGraphDictionary;
- (NSMutableDictionary)tableCellHeightEstimated;
- (NSMutableDictionary)tableCellHeights;
- (PLBatteryUIBackendModel)backend;
- (PSSpecifier)suggestionHeaderSpecifier;
- (PowerUISmartChargeClient)chargingClient;
- (UIActivityIndicatorView)activityIndicator;
- (UIViewController)chargingStatusViewController;
- (double)getRequeryTimeThreshold;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_batteryGroupSpecifier;
- (id)_signatureGroupSpecifier;
- (id)_spinnerSpecifier;
- (id)_spinnerSpecifierGroup;
- (id)_suggestionEntries;
- (id)_suggestionGroupSpecifier;
- (id)addSuggestionsToSpecifiers:(id)a3;
- (id)appEnergyValue:(id)a3;
- (id)appFGBGValue:(id)a3;
- (id)appQualifiers:(id)a3;
- (id)backgroundAppUsageInsightToRemove;
- (id)batteryGraphSpecifier;
- (id)batteryUIQueryRange:(id)a3;
- (id)batteryUIQueryRangeKey;
- (id)batteryUsageGraphsSpecifier;
- (id)caSuggestionsAndInsightsEventDictionaryForType:(id)a3 category:(id)a4 action:(id)a5;
- (id)formatUsageStringInMin:(id)a3;
- (id)formatUsageStringInMinOrHr:(id)a3;
- (id)generateBatteryEntrySpecifiers:(id)a3;
- (id)getActiveTime:(id)a3;
- (id)getBackgroundActiveTime:(id)a3;
- (id)getBatteryPercentageMode:(id)a3;
- (id)getBatterySaverMode:(id)a3;
- (id)getBatteryServiceSuggestion;
- (id)getChargeCycles:(id)a3;
- (id)getChargingMode;
- (id)getInitializedSuggestionHeaderCellSpecifier;
- (id)getSuggestionObjectWithType:(int)a3;
- (id)getTappedTimeDurationStringForTappedIndex:(int)a3 isUpperCase:(BOOL)a4 isFooterString:(BOOL)a5;
- (id)getTestValues;
- (id)getUsageTimeToggle;
- (id)screenLock:(id)a3;
- (id)setChargingMode:(id)a3 specifier:(id)a4;
- (id)setUpBatteryGraphSpecifiers;
- (id)setUpBatteryHealthGroup;
- (id)setUpBatteryHealthSpecifier;
- (id)setUpBatterySpecifersWithInsufficientData;
- (id)setUpBatterySpecifiers;
- (id)setUpBatteryUsageHeaderSpecifier;
- (id)setUpChargingSpecifier;
- (id)setUpChargingStatusSpecifier;
- (id)setUpGraphGroupSpecifier;
- (id)setUpGraphLastChargeSpecifier;
- (id)setUpInternalAppSpecifiers;
- (id)setUpInternalSpecifiers;
- (id)setUpSpinnerSpecifiers;
- (id)setUpToggleForUsageTimeSpecifier;
- (id)setUpUsageSpecifiers;
- (id)setUpUsageTimeValuesSpecifier;
- (id)specifierForBatteryEntry:(id)a3;
- (id)specifiers;
- (int)BUI_MODE;
- (int)batteryUIDeviceOrientation;
- (int)batteryUIQueryType;
- (int)batteryUIType;
- (int)getDeviceOrientationFromCurrentDevice;
- (unint64_t)curChargingMode;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)adjustTableBottomInset;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)animateSwitchSpecifier:(id)a3 toState:(BOOL)a4;
- (void)cycleNext:(id)a3;
- (void)dealloc;
- (void)determineBatteryBreakDownHeaderStringLength;
- (void)deviceOrientationDidChange:(id)a3;
- (void)didPushBatteryButton:(id)a3;
- (void)didPushButton:(id)a3;
- (void)didPushScreenOnButton:(id)a3;
- (void)didTapShowAllButton;
- (void)didTappedBar:(id)a3;
- (void)generateSignaturesEntrySpecifiers:(id)a3;
- (void)generateSuggestionsEntryObjects:(id)a3;
- (void)generateSuggestionsWithIssues:(id)a3;
- (void)getDemoName:(id)a3;
- (void)graphOnSelectAt:(id)a3;
- (void)handleApplicationWillEnterForeground;
- (void)handleBiomeDonationForBUIVisit;
- (void)logToPowerlogRbattx;
- (void)logToPowerlogRbattx0;
- (void)logToPowerlogRbattxy;
- (void)logViewDidLoadEvents;
- (void)queryForBatteryBreakdown;
- (void)rebuildList;
- (void)reloadOtherTypeUI:(id)a3;
- (void)reloadSpecifiers;
- (void)reloadUI;
- (void)removeSpinnerSpecifers;
- (void)removeSuggestion:(id)a3;
- (void)reportIssue;
- (void)savePList:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setAggdKeysForNoBreakdownOnTap;
- (void)setAutolockTitlesAndValues:(id)a3;
- (void)setBUI_MODE:(int)a3;
- (void)setBackend:(id)a3;
- (void)setBatterySaverMode:(id)a3 withSpecifier:(id)a4;
- (void)setBatteryUIDeviceOrientation:(int)a3;
- (void)setBatteryUIQueryRange:(id)a3 specifier:(id)a4;
- (void)setBatteryUIQueryType:(int)a3;
- (void)setBatteryUIType:(int)a3;
- (void)setChargingClient:(id)a3;
- (void)setChargingStatusViewController:(id)a3;
- (void)setClearGraph:(BOOL)a3;
- (void)setCurChargingMode:(unint64_t)a3;
- (void)setCurrentDictionary:(id)a3;
- (void)setCurrentGraphDictionary:(id)a3;
- (void)setCurrentLastChargeDictionary:(id)a3;
- (void)setCurrentPausedChargingDictionary:(id)a3;
- (void)setLastBatteryBreakdownQueryTime:(id)a3;
- (void)setRadarController:(id)a3;
- (void)setScreenLock:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)setSuggestionHeaderSpecifier:(id)a3;
- (void)setTableCellHeightEstimated:(id)a3;
- (void)setTableCellHeights:(id)a3;
- (void)setUpBatteryUIDictionary:(id)a3;
- (void)setWaitingForResponse:(BOOL)a3;
- (void)showInternalViewController;
- (void)startRepeatingTimer;
- (void)stopRepeatingTimer;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)update:(id)a3;
- (void)updateSuggestionsSpecifiers;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BatteryUIController

- (id)_suggestionGroupSpecifier
{
  suggestionGroup = self->_suggestionGroup;
  if (!suggestionGroup)
  {
    v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:self set:0 get:0 detail:0 cell:0 edit:0];
    v5 = self->_suggestionGroup;
    self->_suggestionGroup = v4;

    [(PSSpecifier *)self->_suggestionGroup setProperty:@"STORAGE_GROUP_02" forKey:PSIDKey];
    suggestionGroup = self->_suggestionGroup;
  }

  return suggestionGroup;
}

- (id)getInitializedSuggestionHeaderCellSpecifier
{
  v3 = [(BatteryUIController *)self suggestionHeaderSpecifier];

  if (!v3)
  {
    v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(BatteryUIController *)self setSuggestionHeaderSpecifier:v4];

    v5 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];

    v6 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

    v7 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    v8 = BatteryUILocalization(@"INSIGHTS_AND_SUGGESTIONS");
    [v7 setProperty:v8 forKey:@"PLBatteryUISuggestionTitle"];

    v9 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    v10 = BatteryUILocalization(@"SHOW_ALL");
    [v9 setProperty:v10 forKey:@"PLBatteryUISuggestionShowAllText"];

    v11 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    v12 = BatteryUILocalization(@"SHOW_LESS");
    [v11 setProperty:v12 forKey:@"PLBatteryUISuggestionShowLessText"];

    v13 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    v14 = +[NSNumber numberWithBool:self->_showAll];
    [v13 setProperty:v14 forKey:@"PLBatteryUISuggestionShowAll"];

    v15 = [[WeakBatteryUIController alloc] initWithController:self];
    v16 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    [v16 setProperty:v15 forKey:@"PLBatteryUISuggestionHeaderCellDelegateWrapperKey"];

    v17 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    [v17 setIdentifier:@"SUGGESTION_HEADER"];
  }

  return [(BatteryUIController *)self suggestionHeaderSpecifier];
}

- (void)didTapShowAllButton
{
  self->_showAll ^= 1u;
  v3 = [(BatteryUIController *)self tableCellHeights];
  if (v3)
  {
  }
  else
  {
    v4 = [(BatteryUIController *)self tableCellHeightEstimated];

    if (!v4) {
      goto LABEL_5;
    }
  }
  v5 = objc_opt_new();
  [(BatteryUIController *)self setTableCellHeights:v5];

  v6 = objc_opt_new();
  [(BatteryUIController *)self setTableCellHeightEstimated:v6];

LABEL_5:
  v7 = [(BatteryUIController *)self suggestionHeaderSpecifier];
  v8 = +[NSNumber numberWithBool:self->_showAll];
  [v7 setProperty:v8 forKey:@"PLBatteryUISuggestionShowAll"];

  [(BatteryUIController *)self reloadSpecifiers];
}

- (id)_suggestionEntries
{
  return self->_suggestionEntries;
}

- (id)screenLock:(id)a3
{
  v3 = +[MCProfileConnection sharedConnection];
  v4 = [v3 effectiveValueForSetting:MCFeatureAutoLockTime];

  if ([v4 intValue] == 0x7FFFFFFF)
  {
    id v5 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void)setScreenLock:(id)a3 specifier:(id)a4
{
  id v8 = a3;
  unsigned int v4 = [v8 intValue];
  id v5 = +[MCProfileConnection sharedConnection];
  v6 = v5;
  if (v4 == -1)
  {
    v7 = +[NSNumber numberWithInt:0x7FFFFFFFLL];
    [v6 setValue:v7 forSetting:MCFeatureAutoLockTime];
  }
  else
  {
    [v5 setValue:v8 forSetting:MCFeatureAutoLockTime];
  }
}

- (void)generateSuggestionsEntryObjects:(id)a3
{
  id v4 = a3;
  id v5 = PLHighlightableSegmentableSlider;
  v6 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8B640(v6);
  }

  suggestionEntries = self->_suggestionEntries;
  self->_suggestionEntries = 0;

  if (v4)
  {
    location = (id *)&self->_suggestionEntries;
    id v8 = +[NSMutableArray array];
    if ([v4 count])
    {
      unint64_t v9 = 0;
      v34 = self;
      id v35 = v4;
      do
      {
        v10 = [v4 objectAtIndexedSubscript:v9];
        v11 = [v10 objectForKeyedSubscript:@"PLBatteryUISuggestionTypeKey"];
        v12 = v11;
        if (!v11) {
          goto LABEL_44;
        }
        v38 = v11;
        id v13 = [v11 intValue];
        v14 = objc_msgSend(&v5[40], "get_log_handle_bui");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v55 = (int)v13;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Suggestion entry: %d", buf, 8u);
        }

        v12 = v38;
        if ([(BatteryUIController *)self inDemoMode]) {
          goto LABEL_44;
        }
        unint64_t v37 = v9;
        if (v13 > 2)
        {
          if (v13 == 7)
          {
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            v15 = [v10 objectForKeyedSubscript:@"PLBatteryUIPerAppUsageKey"];
            id v22 = [(BatteryUISuggestion *)v15 countByEnumeratingWithState:&v39 objects:v52 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v40;
              do
              {
                for (i = 0; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v40 != v24) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                  v27 = [BatteryUISuggestion alloc];
                  v28 = [v10 objectForKeyedSubscript:@"PLBatteryUIPerAppUsageKey"];
                  v29 = [v28 objectForKeyedSubscript:v26];
                  v30 = [(BatteryUISuggestion *)v27 initWithSuggestionType:7 andData:v29];

                  if (v30) {
                    [v8 addObject:v30];
                  }
                }
                id v23 = [(BatteryUISuggestion *)v15 countByEnumeratingWithState:&v39 objects:v52 count:16];
              }
              while (v23);
              self = v34;
              id v4 = v35;
LABEL_37:
              id v5 = PLHighlightableSegmentableSlider;
LABEL_42:
              v12 = v38;
            }
          }
          else
          {
            if (v13 != 10)
            {
              v15 = [[BatteryUISuggestion alloc] initWithSuggestionType:v13 andData:v10];
              if (v15) {
                [v8 addObject:v15];
              }
              goto LABEL_43;
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            v15 = [v10 objectForKeyedSubscript:@"PLBatteryUIInsightBackgroundAppUsageAppKey"];
            id v17 = [(BatteryUISuggestion *)v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v49;
              do
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v49 != v19) {
                    objc_enumerationMutation(v15);
                  }
                  v21 = [[BatteryUILinkSuggestion alloc] initWithSuggestionType:10 andData:*(void *)(*((void *)&v48 + 1) + 8 * (void)j)];
                  if (v21)
                  {
                    [v8 addObject:v21];
                    self->_backgroundAppUsageInsightShowing = 1;
                    v43 = _NSConcreteStackBlock;
                    uint64_t v44 = 3221225472;
                    v45 = sub_111FC;
                    v46 = &unk_BE5D0;
                    v47 = self;
                    AnalyticsSendEventLazy();
                  }
                }
                id v18 = [(BatteryUISuggestion *)v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
              }
              while (v18);
              goto LABEL_37;
            }
          }
        }
        else
        {
          v15 = [[BatteryUILinkSuggestion alloc] initWithSuggestionType:v13 andData:v10];
          if (v15)
          {
            [v8 addObject:v15];
            if (v13 == 1)
            {
              v31 = [(BatteryUISuggestion *)v15 getSuggestionHeaderSpecifier];
              objc_storeWeak((id *)&v31[OBJC_IVAR___PSSpecifier_target], self);

              v32 = [(BatteryUISuggestion *)v15 getSuggestionHeaderSpecifier];
              *(void *)&v32[OBJC_IVAR___PSSpecifier_setter] = "setScreenLock:specifier:";

              v33 = [(BatteryUISuggestion *)v15 getSuggestionHeaderSpecifier];
              *(void *)&v33[OBJC_IVAR___PSSpecifier_getter] = "screenLock:";

              v16 = [(BatteryUISuggestion *)v15 getSuggestionHeaderSpecifier];
              [(BatteryUIController *)self setAutolockTitlesAndValues:v16];
              goto LABEL_41;
            }
            if (!v13)
            {
              v16 = [(BatteryUISuggestion *)v15 getSuggestionHeaderSpecifier];
              [(BatteryUIController *)self lazyLoadBundle:v16];
LABEL_41:

              goto LABEL_42;
            }
          }
        }
LABEL_43:

        unint64_t v9 = v37;
LABEL_44:

        ++v9;
      }
      while ((unint64_t)[v4 count] > v9);
    }
    if ([v8 count]) {
      objc_storeStrong(location, v8);
    }
  }
}

- (void)setAutolockTitlesAndValues:(id)a3
{
  id v57 = a3;
  id v3 = objc_alloc((Class)NSArray);
  id v4 = +[NSNumber numberWithInt:30];
  id v5 = +[NSNumber numberWithInt:60];
  v6 = +[NSNumber numberWithInt:120];
  v7 = +[NSNumber numberWithInt:180];
  id v8 = +[NSNumber numberWithInt:240];
  unint64_t v9 = +[NSNumber numberWithInt:300];
  v10 = +[NSNumber numberWithInt:600];
  v11 = +[NSNumber numberWithInt:900];
  v12 = +[NSNumber numberWithInt:0xFFFFFFFFLL];
  id v13 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, v12, 0);

  id v52 = objc_alloc((Class)NSArray);
  v60 = BatteryUILocalization(@"30_(%@)_SECONDS");
  v58 = +[NSString localizedStringWithFormat:@"%d", 30];
  v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v60, v58);
  v56 = BatteryUILocalization(@"1_(%@)_MINUTE");
  int v55 = +[NSString localizedStringWithFormat:@"%d", 1];
  v62 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v56, v55);
  v54 = BatteryUILocalization(@"2_(%@)_MINUTES");
  v53 = +[NSString localizedStringWithFormat:@"%d", 2];
  v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v53);
  long long v51 = BatteryUILocalization(@"3_(%@)_MINUTES");
  long long v50 = +[NSString localizedStringWithFormat:@"%d", 3];
  long long v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v50);
  long long v49 = BatteryUILocalization(@"4_(%@)_MINUTES");
  long long v48 = +[NSString localizedStringWithFormat:@"%d", 4];
  uint64_t v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v49, v48);
  v46 = BatteryUILocalization(@"5_(%@)_MINUTES");
  v45 = +[NSString localizedStringWithFormat:@"%d", 5];
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v45);
  v43 = BatteryUILocalization(@"10_(%@)_MINUTES");
  long long v42 = +[NSString localizedStringWithFormat:@"%d", 10];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v43, v42);
  v16 = BatteryUILocalization(@"15_(%@)_MINUTES");
  id v17 = +[NSString localizedStringWithFormat:@"%d", 15];
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17);
  uint64_t v19 = BatteryUILocalization(@"NEVER");
  id v20 = objc_msgSend(v52, "initWithObjects:", v63, v62, v47, v41, v44, v14, v15, v18, v19, 0);

  if (PSIsiPad()) {
    v21 = &off_CA6C8;
  }
  else {
    v21 = &off_CA6E0;
  }
  id v22 = +[NSMutableArray array];
  id v23 = +[NSMutableArray array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v24 = [v21 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v66;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v66 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = (int)[*(id *)(*((void *)&v65 + 1) + 8 * (void)v27) intValue];
        v29 = [v13 objectAtIndexedSubscript:v28];
        [v22 addObject:v29];

        v30 = [v20 objectAtIndexedSubscript:v28];
        [v23 addObject:v30];

        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v21 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v25);
  }
  v31 = (char *)[v22 count];
  id v59 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v31];
  v61 = v31;
  if (v31)
  {
    v32 = 0;
    do
    {
      v33 = [v22 objectAtIndex:v32];
      unsigned int v34 = [v33 intValue];
      if (v34 == -1)
      {
        v36 = +[NSBundle mainBundle];
        unint64_t v37 = [v23 objectAtIndex:v32];
        long long v40 = [v36 localizedStringForKey:v37 value:&stru_C3A18 table:@"General"];
      }
      else
      {
        signed int v35 = v34;
        v36 = +[NSBundle mainBundle];
        unint64_t v37 = [v23 objectAtIndex:v32];
        [v36 localizedStringForKey:v37 value:&stru_C3A18 table:@"General"];
        v38 = v64 = v33;
        long long v39 = +[NSNumber numberWithInt:(v35 / 60)];
        long long v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v39);

        v33 = v64;
      }

      if (v33 && v40) {
        [v59 addObject:v40];
      }

      ++v32;
    }
    while (v61 != v32);
  }
  [v57 setValues:v22 titles:v59];
}

- (void)generateSuggestionsWithIssues:(id)a3
{
  id v4 = a3;
  id v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8B684(v5);
  }

  v6 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [UrsaSuggestion alloc];
        v14 = -[UrsaSuggestion initWithIssue:](v13, "initWithIssue:", v12, (void)v15);
        if (v14) {
          [v6 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    if (self->_suggestionEntries) {
      [(NSMutableArray *)self->_suggestionEntries addObjectsFromArray:v6];
    }
    else {
      objc_storeStrong((id *)&self->_suggestionEntries, v6);
    }
  }
}

- (id)addSuggestionsToSpecifiers:(id)a3
{
  id v4 = a3;
  [(BatteryUIController *)self updateSuggestionsSpecifiers];
  suggestionEntries = self->_suggestionEntries;
  if (suggestionEntries && [(NSMutableArray *)suggestionEntries count])
  {
    v6 = &objc_loadWeakRetained_ptr;
    if ((unint64_t)[(NSMutableArray *)self->_suggestionEntries count] < 3)
    {
      v11 = BatteryUILocalization(@"INSIGHTS_AND_SUGGESTIONS");
      uint64_t v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:0 edit:0];
      [(BatteryUIController *)self setSuggestionHeaderSpecifier:v12];

      id v13 = [(BatteryUIController *)self suggestionHeaderSpecifier];
      [v13 setIdentifier:@"SUGGESTION_HEADER"];

      id v8 = [(BatteryUIController *)self suggestionHeaderSpecifier];
    }
    else
    {
      id v7 = [(BatteryUIController *)self _suggestionGroupSpecifier];
      [v4 addObject:v7];

      id v8 = [(BatteryUIController *)self getInitializedSuggestionHeaderCellSpecifier];
      id v9 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_suggestionEntries count]];
      [v8 setProperty:v9 forKey:@"PLBatteryUISuggestionInsightTotalCountKey"];

      uint64_t v10 = +[NSNumber numberWithBool:self->_showAll];
      [v8 setProperty:v10 forKey:@"PLBatteryUISuggestionShowAll"];
    }
    uint64_t v26 = v8;
    [v4 addObject:v8];
    if ([(NSMutableArray *)self->_suggestionEntries count])
    {
      unint64_t v14 = 0;
      do
      {
        if (!self->_showAll && v14 > 1) {
          break;
        }
        long long v16 = [(NSMutableArray *)self->_suggestionEntries objectAtIndexedSubscript:v14];
        long long v17 = v16;
        if (v14)
        {
          long long v18 = v6[319];
          [v16 getSuggestionIdentifier];
          v20 = uint64_t v19 = v6;
          v21 = [v20 stringByAppendingString:@"_HEADER"];
          id v22 = [v18 groupSpecifierWithID:v21];

          v6 = v19;
          [v4 addObject:v22];
        }
        id v23 = [v17 getSuggestionHeaderSpecifier];
        [v4 addObject:v23];

        id v24 = [v17 getSuggestionInfoSpecifier];
        [v4 addObject:v24];

        ++v14;
      }
      while ((unint64_t)[(NSMutableArray *)self->_suggestionEntries count] > v14);
    }
  }

  return v4;
}

- (void)updateSuggestionsSpecifiers
{
  if (self->_suggestionEntries
    && !+[PLBatteryUIUtilities isInUnitTest])
  {
    unsigned int v3 = +[PSBrightnessSettingsDetail autoBrightnessEnabled];
    if (v3)
    {
      id v4 = [(BatteryUIController *)self getSuggestionObjectWithType:0];
      [(BatteryUIController *)self removeSuggestion:v4];
    }
    id v5 = [(BatteryUIController *)self screenLock:0];
    unsigned int v6 = [v5 intValue];

    if (v6 != -1)
    {
      unsigned int v3 = 1;
      id v7 = [(BatteryUIController *)self getSuggestionObjectWithType:1];
      [(BatteryUIController *)self removeSuggestion:v7];
    }
    if ((+[PLModelingUtilities alsCurveHigherThanDefault] & 1) == 0)
    {
      id v8 = [(BatteryUIController *)self getSuggestionObjectWithType:2];
      [(BatteryUIController *)self removeSuggestion:v8];

      unsigned int v3 = 1;
    }
    if (self->_backgroundAppUsageInsightShowing)
    {
      id v9 = [(BatteryUIController *)self backgroundAppUsageInsightToRemove];
      if (v9)
      {
        [(BatteryUIController *)self removeSuggestion:v9];
        v21 = _NSConcreteStackBlock;
        uint64_t v22 = 3221225472;
        id v23 = sub_121AC;
        id v24 = &unk_BE5D0;
        id v25 = self;
        AnalyticsSendEventLazy();
        unsigned int v3 = 1;
      }
    }
    if ([(NSMutableArray *)self->_suggestionEntries count])
    {
      if (v3)
      {
        uint64_t v10 = [(BatteryUIController *)self suggestionHeaderSpecifier];

        if (v10)
        {
          v11 = [(BatteryUIController *)self suggestionHeaderSpecifier];
          uint64_t v12 = +[NSNumber numberWithBool:self->_showAll];
          [v11 setProperty:v12 forKey:@"PLBatteryUISuggestionShowAll"];

          id v13 = [(BatteryUIController *)self suggestionHeaderSpecifier];
          unint64_t v14 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_suggestionEntries count]];
          [v13 setProperty:v14 forKey:@"PLBatteryUISuggestionInsightTotalCountKey"];

          long long v15 = [(BatteryUIController *)self suggestionHeaderSpecifier];
          long long v16 = [v15 propertyForKey:PSTableCellKey];

          if (v16)
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_121CC;
            block[3] = &unk_BE6B0;
            id v19 = v16;
            id v20 = self;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
    }
    else
    {
      suggestionEntries = self->_suggestionEntries;
      self->_suggestionEntries = 0;

      [(BatteryUIController *)self removeSpecifierID:@"STORAGE_GROUP_02" animated:1];
      [(BatteryUIController *)self removeSpecifierID:@"SUGGESTION_HEADER"];
    }
  }
}

- (void)removeSuggestion:(id)a3
{
  if (a3)
  {
    suggestionEntries = self->_suggestionEntries;
    id v5 = a3;
    [(NSMutableArray *)suggestionEntries removeObject:v5];
    unsigned int v6 = [v5 getSuggestionHeaderSpecifier];
    [(BatteryUIController *)self removeSpecifier:v6 animated:1];

    id v7 = [v5 getSuggestionInfoSpecifier];
    [(BatteryUIController *)self removeSpecifier:v7 animated:1];

    id v9 = [v5 getSuggestionIdentifier];

    id v8 = [v9 stringByAppendingString:@"_HEADER"];
    [(BatteryUIController *)self removeSpecifierID:v8 animated:1];
  }
}

- (id)getSuggestionObjectWithType:(int)a3
{
  suggestionEntries = self->_suggestionEntries;
  if (suggestionEntries && [(NSMutableArray *)suggestionEntries count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unsigned int v6 = self->_suggestionEntries;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "getSuggestionType", (void)v14) == a3)
          {
            id v12 = v11;
            goto LABEL_14;
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_14:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)backgroundAppUsageInsightToRemove
{
  suggestionEntries = self->_suggestionEntries;
  if (suggestionEntries && [(NSMutableArray *)suggestionEntries count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = self->_suggestionEntries;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "getSuggestionIdentifier", (void)v16);
        unsigned __int8 v11 = [v10 isEqualToString:@"BackgroundAppUsageTestApp"];

        if (v11) {
          break;
        }
        if ([v9 getSuggestionType] == 10)
        {
          id v12 = [v9 getSuggestionIdentifier];
          unsigned int v13 = +[CLLocationManager authorizationStatusForBundleIdentifier:v12];

          if (v13 != 3)
          {
            id v14 = v9;
            goto LABEL_14;
          }
        }
        if (v6 == (id)++v8)
        {
          id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v6) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    id v14 = 0;
LABEL_14:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_signatureGroupSpecifier
{
  if (!self->_signatureGroup)
  {
    unsigned int v3 = +[PSSpecifier preferenceSpecifierNamed:@"SIGNATURES" target:0 set:0 get:0 detail:0 cell:0 edit:0];
    signatureGroup = self->_signatureGroup;
    self->_signatureGroup = v3;

    [(PSSpecifier *)self->_signatureGroup setProperty:@"SIGNATURES" forKey:PSIDKey];
  }
  suggestionGroup = self->_suggestionGroup;

  return suggestionGroup;
}

- (void)generateSignaturesEntrySpecifiers:(id)a3
{
  id v4 = a3;
  signatureEntries = self->_signatureEntries;
  self->_signatureEntries = 0;

  if (v4)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    uint64_t v7 = self->_signatureEntries;
    self->_signatureEntries = v6;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v29 = v4;
    id obj = v4;
    id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v32 = *(void *)v36;
      uint64_t v31 = PSCellClassKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v12 = [v11 objectForKeyedSubscript:@"processName"];
          CFStringRef v34 = @"No Name";
          if (([v12 isEqualToString:&stru_C3A18] & 1) == 0)
          {
            CFStringRef v34 = [v11 objectForKeyedSubscript:@"processName"];
          }

          unsigned int v13 = [v11 objectForKeyedSubscript:@"timestamp"];
          id v14 = +[NSDateFormatter localizedStringFromDate:v13 dateStyle:1 timeStyle:1];

          long long v15 = [v11 objectForKeyedSubscript:@"domain"];
          LODWORD(v13) = [v15 isEqualToString:@"Energy"];

          if (v13)
          {
            long long v16 = [v11 objectForKeyedSubscript:@"type"];
            CFStringRef v17 = @"CPU";
            unsigned int v18 = [v16 isEqualToString:@"CPU"];

            if (!v18) {
              CFStringRef v17 = @"BAT";
            }
          }
          else
          {
            long long v19 = [v11 objectForKeyedSubscript:@"domain"];
            unsigned int v20 = [v19 isEqualToString:@"Networking"];

            if (v20) {
              CFStringRef v17 = @"NET";
            }
            else {
              CFStringRef v17 = @"???";
            }
          }
          NSLog(@"signatureString = %@", v17);
          v21 = [v11 objectForKeyedSubscript:@"attachments"];

          if (v21)
          {
            uint64_t v22 = [v11 objectForKeyedSubscript:@"attachments"];
          }
          else
          {
            uint64_t v22 = &stru_C3A18;
          }
          id v23 = [v11 objectForKeyedSubscript:@"type"];

          if (v23)
          {
            v33 = [v11 objectForKeyedSubscript:@"type"];
          }
          else
          {
            v33 = &stru_C3A18;
          }
          id v24 = (__CFString *)v34;
          id v25 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:0 detail:0 cell:4 edit:0];
          [v25 setProperty:v17 forKey:@"PLBatteryUIAppEnergyDisplayPercentKey"];
          id v26 = v14;
          v27 = v26;
          if ((unint64_t)[(__CFString *)v22 length] >= 6)
          {
            uint64_t v28 = +[NSString stringWithFormat:@" - Data:%@", v22];
            v27 = [v26 stringByAppendingString:v28];

            id v24 = (__CFString *)v34;
          }
          [v25 setProperty:v27 forKey:@"cellSubtitleText"];
          [v25 setProperty:objc_opt_class() forKey:v31];
          [v25 setProperty:self forKey:@"PSSubtitleTileValueTableCellTTRKey"];
          [v25 setProperty:v33 forKey:@"PLBatteryUIDisplayTableCellTTRType"];
          [v25 setProperty:v24 forKey:@"PLBatteryUIDisplayTableCellTTRProcess"];
          [v25 setProperty:v17 forKey:@"PLBatteryUIDisplayTableCellTTRDomain"];
          [v25 setProperty:v22 forKey:@"PLBatteryUIDisplayTableCellTTRAttachments"];
          [(NSMutableArray *)self->_signatureEntries addObject:v25];
        }
        id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v9);
    }

    id v4 = v29;
  }
}

- (id)caSuggestionsAndInsightsEventDictionaryForType:(id)a3 category:(id)a4 action:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  [v10 setObject:v9 forKeyedSubscript:@"type"];

  [v10 setObject:v8 forKeyedSubscript:@"category"];
  [v10 setObject:v7 forKeyedSubscript:@"action"];

  return v10;
}

- (BOOL)isTapped
{
  return self->_tappedIndex != -1;
}

- (void)reloadSpecifiers
{
  unsigned int v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Reloading specifiers", buf, 2u);
  }

  id v4 = [(BatteryUIController *)self table];
  [v4 contentOffset];
  self->contentOffsetBUI.x = v5;
  self->contentOffsetBUI.y = v6;

  id v7 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_8D924((uint64_t *)&self->contentOffsetBUI, (uint64_t *)&self->contentOffsetBUI.y, v7);
  }

  id v8 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_8D898(self);
  }

  v10.receiver = self;
  v10.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v10 reloadSpecifiers];
  id v9 = [(BatteryUIController *)self view];
  [v9 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  unsigned int v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8DD1C();
  }

  v14.receiver = self;
  v14.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v14 viewDidLayoutSubviews];
  id v4 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8DC98((uint64_t)self, v4);
  }

  CGFloat v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8DBD8(self, v5);
  }

  CGFloat v6 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8DB4C(self);
  }

  id v7 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_8DA6C(self, v7);
  }

  if (self->contentOffsetBUI.y < 3.40282347e38)
  {
    id v8 = [(BatteryUIController *)self table];
    [v8 contentOffset];
    double v10 = v9;
    double y = self->contentOffsetBUI.y;

    if (v10 < y)
    {
      id v12 = [(BatteryUIController *)self table];
      objc_msgSend(v12, "setContentOffset:animated:", 0, self->contentOffsetBUI.x, self->contentOffsetBUI.y);

      [(BatteryUIController *)self adjustTableBottomInset];
    }
  }
  unsigned int v13 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_8D9AC(self, v13);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8DDC4(self);
  }

  CGFloat v5 = [(BatteryUIController *)self table];
  [v5 contentInset];
  double v7 = v6;
  id v8 = [(BatteryUIController *)self table];
  [v8 contentInset];
  double v10 = v9;

  if (v7 > v10)
  {
    unsigned __int8 v11 = [(BatteryUIController *)self table];
    [v11 contentInset];
    double v13 = v12;
    objc_super v14 = [(BatteryUIController *)self table];
    [v14 contentSize];
    double v16 = v13 + v15;
    CFStringRef v17 = [(BatteryUIController *)self table];
    [v17 contentInset];
    double v19 = v16 + v18;
    unsigned int v20 = [(BatteryUIController *)self view];
    [v20 frame];
    double v22 = v21;

    if (v19 > v22)
    {
      id v23 = [(BatteryUIController *)self contentScrollView];
      [v23 frame];
      double v25 = v24;
      id v26 = [(BatteryUIController *)self table];
      [v26 contentSize];
      double v28 = v27;
      id v29 = [(BatteryUIController *)self table];
      [v29 contentOffset];
      double v31 = v25 - (v28 - v30);

      if (v31 > 0.0)
      {
        uint64_t v32 = [(BatteryUIController *)self table];
        [v32 contentInset];
        double v34 = v33;

        if (v31 < v34)
        {
          long long v35 = [(BatteryUIController *)self table];
          [v35 contentInset];
          double v37 = v36;
          double v39 = v38;
          double v41 = v40;

          long long v42 = +[BatteryUIResourceClass get_log_handle_bui];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            sub_8DD50(v42, v31, v43, v44);
          }

          v45 = [(BatteryUIController *)self table];
          objc_msgSend(v45, "setContentInset:", v37, v39, v31, v41);
        }
      }
    }
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  uint64_t v8 = [(BatteryUIController *)self tableCellHeights];
  if (v8)
  {
    double v9 = (void *)v8;
    double v10 = [(BatteryUIController *)self tableCellHeightEstimated];

    if (v10)
    {
      [v17 frame];
      double v12 = +[NSNumber numberWithDouble:v11];
      double v13 = [(BatteryUIController *)self tableCellHeights];
      [v13 setObject:v12 forKeyedSubscript:v7];

      LODWORD(v12) = [(BatteryUIController *)self shouldEstimateCellHeightFor:v17];
      objc_super v14 = [(BatteryUIController *)self tableCellHeightEstimated];
      double v15 = v14;
      if (v12) {
        double v16 = &__kCFBooleanTrue;
      }
      else {
        double v16 = &__kCFBooleanFalse;
      }
      [v14 setObject:v16 forKeyedSubscript:v7];
    }
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BatteryUIController *)self tableCellHeights];
  if (!v8
    || (double v9 = (void *)v8,
        [(BatteryUIController *)self tableCellHeightEstimated],
        double v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    -[BatteryUIController tableView:estimatedHeightForRowAtIndexPath:](&v24, "tableView:estimatedHeightForRowAtIndexPath:", v6, v7, v23.receiver, v23.super_class, self, BatteryUIController);
LABEL_9:
    double v20 = v21;
    goto LABEL_10;
  }
  double v11 = [(BatteryUIController *)self tableCellHeights];
  uint64_t v12 = [v11 objectForKeyedSubscript:v7];
  if (!v12)
  {

    goto LABEL_8;
  }
  double v13 = (void *)v12;
  objc_super v14 = [(BatteryUIController *)self tableCellHeightEstimated];
  double v15 = [v14 objectForKeyedSubscript:v7];
  unsigned int v16 = [v15 BOOLValue];

  if (!v16)
  {
LABEL_8:
    -[BatteryUIController tableView:estimatedHeightForRowAtIndexPath:](&v23, "tableView:estimatedHeightForRowAtIndexPath:", v6, v7, self, BatteryUIController, v24.receiver, v24.super_class);
    goto LABEL_9;
  }
  id v17 = [(BatteryUIController *)self tableCellHeights];
  double v18 = [v17 objectForKeyedSubscript:v7];
  [v18 doubleValue];
  double v20 = v19;

LABEL_10:
  return v20;
}

- (BOOL)shouldEstimateCellHeightFor:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v4 = 0;
  }
  else
  {
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

- (void)adjustTableBottomInset
{
  id v3 = [(BatteryUIController *)self table];
  [v3 contentSize];
  double v5 = v4;
  id v6 = [(BatteryUIController *)self table];
  [v6 contentOffset];
  double v8 = v5 - v7;

  double v9 = [(BatteryUIController *)self contentScrollView];
  [v9 frame];
  double v11 = v10 - v8;

  uint64_t v12 = [(BatteryUIController *)self table];
  [v12 contentInset];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = [(BatteryUIController *)self table];
  [v19 contentInset];
  double v21 = v20;

  if (v11 < v21)
  {
    double v22 = [(BatteryUIController *)self table];
    [v22 contentInset];
    double v24 = v23;
    double v25 = [(BatteryUIController *)self table];
    [v25 contentInset];
    double v27 = v26;

    if (v24 <= v27) {
      return;
    }
    if (v11 < v14) {
      double v11 = v14;
    }
  }
  id v28 = [(BatteryUIController *)self table];
  objc_msgSend(v28, "setContentInset:", v14, v16, v11, v18);
}

- (id)_batteryGroupSpecifier
{
  if (!self->_batteryGroup)
  {
    id v3 = +[PSSpecifier groupSpecifierWithID:@"BATTERY_GROUP"];
    batteryGroup = self->_batteryGroup;
    self->_batteryGroup = v3;
  }
  double v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8DE50();
  }

  id v6 = self->_batteryGroup;

  return v6;
}

- (id)setUpSpinnerSpecifiers
{
  id v3 = [(BatteryUIController *)self _spinnerSpecifierGroup];
  double v4 = [(BatteryUIController *)self _spinnerSpecifier];
  double v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8DE84();
  }

  v8[0] = v3;
  v8[1] = v4;
  id v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (void)removeSpinnerSpecifers
{
  spinnerGroup = self->_spinnerGroup;
  self->_spinnerGroup = 0;

  spinner = self->_spinner;
  self->_spinner = 0;

  double v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8DEB8();
  }
}

- (id)_spinnerSpecifierGroup
{
  spinnerGroup = self->_spinnerGroup;
  if (!spinnerGroup)
  {
    double v4 = +[PSSpecifier groupSpecifierWithID:@"SpinnerGroupSpecifer"];
    double v5 = self->_spinnerGroup;
    self->_spinnerGroup = v4;

    spinnerGroup = self->_spinnerGroup;
  }

  return spinnerGroup;
}

- (id)_spinnerSpecifier
{
  spinner = self->_spinner;
  if (!spinner)
  {
    double v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    double v5 = self->_spinner;
    self->_spinner = v4;

    [(PSSpecifier *)self->_spinner setIdentifier:@"SpinnerSpecifier"];
    spinner = self->_spinner;
  }

  return spinner;
}

- (UIActivityIndicatorView)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    double v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:2];
    double v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    -[UIActivityIndicatorView setSize:](self->_activityIndicator, "setSize:", 50.0, 50.0);
    id v6 = [(BatteryUIController *)self view];
    [v6 center];
    -[UIActivityIndicatorView setCenter:](self->_activityIndicator, "setCenter:");

    activityIndicator = self->_activityIndicator;
  }

  return activityIndicator;
}

- (void)queryForBatteryBreakdown
{
  if (![(BatteryUIController *)self waitingForResponse])
  {
    id v3 = +[BatteryUsageQueryModule sharedModule];
    if ([(BatteryUIController *)self inDemoMode])
    {
      double v4 = [(BatteryUIController *)self specifier];
      double v5 = [v4 propertyForKey:@"manualFIle"];
      [v3 setManualFileName:v5];
    }
    else
    {
      [v3 setManualFileName:0];
    }
    if ([(BatteryUIController *)self isInBUIDemoMode]) {
      [v3 setManualFileName:@"/var/mobile/Library/Logs/BatteryUIDemos/buidemo"];
    }
    if (self->_isFirstTimeLaunchingInternalUI)
    {
      [(BatteryUIController *)self setBatteryUIQueryType:0];
      objc_msgSend(v3, "setType:", -[BatteryUIController batteryUIQueryType](self, "batteryUIQueryType"));
      self->_isFirstTimeLaunchingInternalUI = 0;
    }
    if ([(BatteryUIController *)self batteryUIType] == 2) {
      uint64_t v6 = [(BatteryUIController *)self BUI_MODE];
    }
    else {
      uint64_t v6 = [(BatteryUIController *)self batteryUIQueryType];
    }
    [v3 setType:v6];
    [(BatteryUIController *)self setCurrentDictionary:0];
    [(BatteryUIController *)self setCurrentGraphDictionary:0];
    if ([(BatteryUIController *)self batteryUIType])
    {
      double v7 = +[BatteryUsageQueryModule sharedModule];
      [v7 setGraphNames:&off_CA710];
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_29770;
      v76[3] = &unk_BE620;
      v76[4] = self;
      [v7 populateBatteryModelsWithCompletion:v76];
    }
    double v8 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Sending xpc for batterybreakdown response", buf, 2u);
    }

    uint64_t v9 = mach_absolute_time();
    [(BatteryUIController *)self setWaitingForResponse:1];
    double v10 = BUILogLoadTimes();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BUILoadTime", "BUI XPC Sent", buf, 2u);
    }

    if (+[PLBatteryUIUtilities isInUnitTest])
    {
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_29830;
      block[3] = &unk_BE810;
      void block[4] = self;
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
LABEL_32:

      return;
    }
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_29A8C;
    v73[3] = &unk_BF330;
    v73[4] = self;
    v73[5] = v9;
    uint64_t v12 = objc_retainBlock(v73);
    if ([(BatteryUIController *)self batteryUIType] || !_os_feature_enabled_impl())
    {
      double v25 = BUILogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "\"bui_backend_iOS\" feature flag is disabled. Using the original backend for UI information...", buf, 2u);
      }

      [v3 populateBatteryUsageWithCompletion:v12];
      goto LABEL_31;
    }
    double v13 = BUILogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "\"bui_backend_iOS\" feature flag is enabled. Using the new backend for UI information...", buf, 2u);
    }

    double v14 = [(BatteryUIController *)self backend];
    [v14 resetQuery];

    double v15 = [(BatteryUIController *)self backend];
    double v16 = [v15 endOfHour];

    double v17 = [(BatteryUIController *)self backend];
    double v18 = [v17 endOfDay];

    int v19 = _os_feature_enabled_impl();
    double v20 = BUILogCommon();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "\"bui_graph_intervals_iOS\" feature flag is enabled. Adding PLBatteryUIResponseType_ChargingStateIntervals...", buf, 2u);
      }

      double v22 = [(BatteryUIController *)self backend];
      double v23 = v22;
      uint64_t v24 = 10;
    }
    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "\"bui_graph_intervals_iOS\" feature flag is disabled. Adding PLBatteryUIResponseType_ChargingIntervals...", buf, 2u);
      }

      double v22 = [(BatteryUIController *)self backend];
      double v23 = v22;
      uint64_t v24 = 0;
    }
    id v26 = [v22 addQueryType:v24 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    double v27 = [(BatteryUIController *)self backend];
    id v28 = [v27 addQueryType:5 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    id v29 = [(BatteryUIController *)self backend];
    id v30 = [v29 addQueryType:7 withEndDate:v16 withRange:86400.0 withBucketSize:900.0];

    double v31 = [(BatteryUIController *)self backend];
    id v32 = [v31 addQueryType:6 withEndDate:v18 withRange:864000.0 withBucketSize:86400.0];

    double v33 = [(BatteryUIController *)self backend];
    id v34 = [v33 addQueryType:1 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    long long v35 = [(BatteryUIController *)self backend];
    id v36 = [v35 addQueryType:1 withEndDate:v16 withRange:86400.0 withBucketSize:3600.0];

    double v37 = [(BatteryUIController *)self backend];
    id v38 = [v37 addQueryType:1 withEndDate:v18 withRange:864000.0 withBucketSize:864000.0];

    double v39 = [(BatteryUIController *)self backend];
    id v40 = [v39 addQueryType:1 withEndDate:v18 withRange:864000.0 withBucketSize:86400.0];

    double v41 = [(BatteryUIController *)self backend];
    id v42 = [v41 addQueryType:8 withEndDate:v16 withRange:86400.0 withBucketSize:3600.0];

    uint64_t v43 = [(BatteryUIController *)self backend];
    id v44 = [v43 addQueryType:8 withEndDate:v18 withRange:864000.0 withBucketSize:86400.0];

    v45 = [(BatteryUIController *)self backend];
    id v46 = [v45 addQueryType:11 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    v47 = [(BatteryUIController *)self backend];
    id v48 = [v47 addQueryType:12 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    long long v49 = [(BatteryUIController *)self backend];
    id v50 = [v49 addQueryType:13 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    long long v51 = [(BatteryUIController *)self backend];
    id v52 = [v51 addQueryType:14 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    v53 = [(BatteryUIController *)self backend];
    id v54 = [v53 addQueryType:15 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];

    if (_os_feature_enabled_impl())
    {
      int v55 = [(BatteryUIController *)self backend];
      id v56 = [v55 addQueryType:17 withEndDate:v18 withRange:1209600.0 withBucketSize:86400.0];

      id v57 = BUILogCommon();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_INFO)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v58 = "bg app insight enabled";
    }
    else
    {
      id v57 = BUILogCommon();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_INFO)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v58 = "bg app insight disabled";
    }
    _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, v58, buf, 2u);
LABEL_43:

    if (_os_feature_enabled_impl())
    {
      id v59 = [(BatteryUIController *)self backend];
      id v60 = [v59 addQueryType:16 withEndDate:v16 withRange:864000.0 withBucketSize:3600.0];

      v61 = BUILogCommon();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v62 = "\"bui_bgcpu_insight\" feature flag is enabled.";
LABEL_48:
        _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, v62, buf, 2u);
      }
    }
    else
    {
      v61 = BUILogCommon();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v62 = "\"bui_bgcpu_insight\" feature flag is disabled.";
        goto LABEL_48;
      }
    }

    int v63 = _os_feature_enabled_impl();
    v64 = +[BatteryUIResourceClass get_log_handle_bui];
    BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);
    if (v63)
    {
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v64, OS_LOG_TYPE_INFO, "\"bui_last_charge_iOS\" feature flag is enabled. Adding Paused Charging State Query", buf, 2u);
      }

      v64 = [(BatteryUIController *)self backend];
      id v66 = [v64 addQueryType:9 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];
    }
    else if (v65)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v64, OS_LOG_TYPE_INFO, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding Paused Charging State query.", buf, 2u);
    }

    +[BatteryUIResourceClass containerPath];
    long long v67 = (void *)_CFPreferencesCopyValueWithContainer();
    if (_os_feature_enabled_impl()
      && +[PLModelingUtilities internalBuild]
      && v67
      && [v67 BOOLValue])
    {
      long long v68 = [(BatteryUIController *)self backend];
      id v69 = [v68 addQueryType:19 withEndDate:v18 withRange:86400.0 withBucketSize:86400.0];
    }
    if (_os_feature_enabled_impl())
    {
      v70 = [(BatteryUIController *)self backend];
      id v71 = [v70 addQueryType:21 withEndDate:v16 withRange:86400.0 withBucketSize:86400.0];
    }
    v72 = [(BatteryUIController *)self backend];
    [v3 queryBackend:v72 withCompletion:v12];

LABEL_31:
    goto LABEL_32;
  }
}

- (void)setUpBatteryUIDictionary:(id)a3
{
  id v4 = [a3 mutableCopy];
  double v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8DFF4();
  }

  if (_os_feature_enabled_impl()
    && +[PLBatteryUIUtilities inDemoMode])
  {
    uint64_t v41 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_ChargingIntervals"];
    uint64_t v6 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_PausedChargingIntervals"];
    if (+[PLModelingUtilities supportsSlowCharging])
    {
      double v7 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_ChargingSpeedIntervals"];
      double v8 = BUILogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Setting chargingSpeedIntervalsFromDefaults=%@\n", buf, 0xCu);
      }

      uint64_t v9 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_PausedSlowChargingIntervals"];
      double v10 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_StoppedSlowChargingIntervals"];
    }
    else
    {
      double v10 = 0;
      uint64_t v9 = 0;
      double v7 = 0;
    }
    uint64_t v11 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUICTL_StoppedChargingIntervals"];
    if (+[PLModelingUtilities supportsSlowCharging])
    {
      if (v7) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = (v41 | v6 | v11) != 0;
      }
      if (!v12) {
        goto LABEL_31;
      }
    }
    else if (!(v41 | v6 | v11))
    {
LABEL_31:

      goto LABEL_32;
    }
    id v40 = v10;
    id v38 = v9;
    double v39 = v7;
    double v37 = objc_opt_new();
    double v13 = [v4 objectForKeyedSubscript:@"Graph"];
    id v14 = [v13 mutableCopy];
    [v4 setObject:v14 forKeyedSubscript:@"Graph"];

    double v15 = [v4 objectForKeyedSubscript:@"Graph"];
    double v16 = [v15 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    id v17 = [v16 mutableCopy];
    double v18 = [v4 objectForKeyedSubscript:@"Graph"];
    [v18 setObject:v17 forKeyedSubscript:@"PLBatteryUIGraph24hrs"];

    if (v41) {
      [v37 setObject:v41 forKeyedSubscript:@"PLBatteryUIChargingIntervalsKey"];
    }
    if (v6) {
      [v37 setObject:v6 forKeyedSubscript:@"PLBatteryUIPausedChargingIntervalsKey"];
    }
    uint64_t v9 = v38;
    double v7 = v39;
    if (v11) {
      [v37 setObject:v11 forKeyedSubscript:@"PLBatteryUIStoppedChargingIntervalsKey"];
    }
    if (+[PLModelingUtilities supportsSlowCharging])
    {
      if (v39) {
        [v37 setObject:v39 forKeyedSubscript:@"PLBatteryUIChargingSpeedIntervalsKey"];
      }
      if (v38) {
        [v37 setObject:v38 forKeyedSubscript:@"PLBatteryUIPausedSlowChargingIntervalsKey"];
      }
      if (v40) {
        [v37 setObject:v40 forKeyedSubscript:@"PLBatteryUIStoppedSlowChargingIntervalsKey"];
      }
    }
    int v19 = [v4 objectForKeyedSubscript:@"Graph"];
    double v20 = [v19 objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    [v20 setObject:v37 forKeyedSubscript:@"PLBatteryUIChargingStateIntervalsDictKey"];

    double v10 = v40;
    goto LABEL_31;
  }
LABEL_32:
  BOOL v21 = [v4 objectForKeyedSubscript:@"endOfDay"];
  [v21 doubleValue];
  double v23 = v22;

  uint64_t v24 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    double v25 = [v4 objectForKeyedSubscript:@"endOfDay"];
    *(_DWORD *)buf = 138412290;
    uint64_t v43 = v25;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "End of day from the breakdown: %@", buf, 0xCu);
  }
  id v26 = +[NSDate dateWithTimeIntervalSince1970:v23];
  objc_storeStrong((id *)&self->_endTime, v26);
  double v27 = [v4 objectForKeyedSubscript:@"Graph"];
  id v28 = [v27 mutableCopy];

  id v29 = [v26 dateByAddingTimeInterval:-86400.0];
  [v28 setObject:v29 forKeyedSubscript:@"PLBatteryUIGraphStartTimeKey"];

  [v28 setObject:v26 forKeyedSubscript:@"PLBatteryUIGraphLastHourKey"];
  id v30 = [v4 objectForKeyedSubscript:@"Breakdown"];
  [(BatteryUIController *)self setCurrentDictionary:v30];

  [(BatteryUIController *)self setCurrentGraphDictionary:v28];
  double v31 = [v4 objectForKeyedSubscript:@"PLBatteryUILastChargeKey"];
  [(BatteryUIController *)self setCurrentLastChargeDictionary:v31];

  int v32 = _os_feature_enabled_impl();
  double v33 = +[BatteryUIResourceClass get_log_handle_bui];
  BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
  if (v32)
  {
    if (v34)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "\"bui_last_charge_iOS\" feature flag is enabled. Adding Paused Charging to BUI dictionary.", buf, 2u);
    }

    double v33 = [v4 objectForKeyedSubscript:@"PLBatteryUIPausedChargingKey"];
    [(BatteryUIController *)self setCurrentPausedChargingDictionary:v33];
  }
  else if (v34)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding Paused Charging to BUI dictionary.", buf, 2u);
  }

  long long v35 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    sub_8DF70(self);
  }

  id v36 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    sub_8DEEC(self);
  }
}

- (id)appEnergyValue:(id)a3
{
  id v4 = a3;
  float batteryTotal = self->_batteryTotal;
  uint64_t v6 = [v4 propertyForKey:@"PLBatteryUIAppEnergyValueKey"];
  [v6 floatValue];
  if (batteryTotal <= 0.0) {
    float v8 = 100.0;
  }
  else {
    float v8 = self->_batteryTotal;
  }
  *(float *)&double v7 = *(float *)&v7 / v8;
  uint64_t v9 = +[NSNumber numberWithFloat:v7];

  [v9 doubleValue];
  if (v10 <= 0.0)
  {
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (BOOL v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      BOOL v12 = BatteryUILocalization(@"EM_DASH");
    }
  }
  else
  {
    uint64_t v11 = +[NSNumberFormatter localizedStringFromNumber:v9 numberStyle:3];
    BOOL v12 = +[NSString stringWithFormat:@"%@", v11];
  }

  return v12;
}

- (id)formatUsageStringInMin:(id)a3
{
  id v3 = a3;
  [v3 floatValue];
  if (v4 >= 60.0 || ([v3 floatValue], v5 <= 1.0))
  {
    [v3 floatValue];
    uint64_t v6 = PSAbbreviatedFormattedTimeString();
    +[NSString stringWithFormat:@"%@", v6];
  }
  else
  {
    [v3 floatValue];
    uint64_t v6 = PSAbbreviatedFormattedTimeString();
    +[NSString stringWithFormat:@"< %@", v6];
  double v7 = };

  return v7;
}

- (id)formatUsageStringInMinOrHr:(id)a3
{
  id v3 = a3;
  [v3 doubleValue];
  if (v4 >= 60.0)
  {
    id v6 = objc_alloc_init((Class)NSDateComponentsFormatter);
    objc_msgSend(v6, "setUnitsStyle:", +[PLBatteryUIUtilities localizedDateComponentsUnitsStyle](PLBatteryUIUtilities, "localizedDateComponentsUnitsStyle"));
    [v6 setIncludesApproximationPhrase:0];
    [v6 setIncludesTimeRemainingPhrase:0];
    [v6 setAllowedUnits:96];
    [v3 doubleValue];
    float v5 = objc_msgSend(v6, "stringFromTimeInterval:");
  }
  else
  {
    float v5 = 0;
  }

  return v5;
}

- (BOOL)isSquished
{
  if (+[PLModelingUtilities isNarrowScreen]) {
    return 1;
  }
  if (+[PLModelingUtilities isiPad]) {
    return 0;
  }
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  double v4 = v3;
  if (v3)
  {
    [v3 pointSize];
    BOOL v2 = v5 > 12.0;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (id)appFGBGValue:(id)a3
{
  id v4 = a3;
  double v5 = [v4 propertyForKey:@"PLBatteryUIAppForegroundRuntimeKey"];
  [v5 floatValue];
  id v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  double v7 = [v4 propertyForKey:@"PLBatteryUIAppBackgroundRuntimeKey"];

  [v7 floatValue];
  float v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  [v6 floatValue];
  if (v9 < 60.0)
  {
    [v8 floatValue];
    if (v10 < 60.0)
    {
      id v11 = 0;
      goto LABEL_16;
    }
  }
  [v6 floatValue];
  if (v12 < 60.0 || ([v8 floatValue], v13 >= 60.0))
  {
    [v6 floatValue];
    if (v17 >= 60.0 || ([v8 floatValue], v18 < 60.0))
    {
      if (self->_isSquishedText)
      {
        int v19 = BatteryUILocalization(@"%@_SCREEN_SHORTENED");
        double v20 = [(BatteryUIController *)self formatUsageStringInMinOrHr:v6];
        BOOL v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20);
        id v14 = +[PLBatteryUIUtilities replaceWithUnBreakableSpace:v21];

        double v22 = @"%@_BACKGROUND_SHORTENED";
      }
      else
      {
        double v23 = BatteryUILocalization(@"%@_SCREEN");
        uint64_t v24 = [(BatteryUIController *)self formatUsageStringInMinOrHr:v6];
        double v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24);
        id v14 = +[PLBatteryUIUtilities replaceWithUnBreakableSpace:v25];

        double v22 = @"%@_BACKGROUND";
      }
      id v26 = BatteryUILocalization(v22);
      double v27 = [(BatteryUIController *)self formatUsageStringInMinOrHr:v8];
      id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v27);
      id v29 = +[PLBatteryUIUtilities replaceWithUnBreakableSpace:v28];

      id v11 = +[NSString stringWithFormat:@"%@ – %@", v14, v29];
      goto LABEL_15;
    }
    id v14 = BatteryUILocalization(@"%@_BACKGROUND");
    double v15 = self;
    double v16 = v8;
  }
  else
  {
    id v14 = BatteryUILocalization(@"%@_SCREEN");
    double v15 = self;
    double v16 = v6;
  }
  id v29 = [(BatteryUIController *)v15 formatUsageStringInMinOrHr:v16];
  id v30 = +[PLBatteryUIUtilities replaceWithUnBreakableSpace:v29];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v30);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
LABEL_16:
  [&off_C9620 floatValue];
  if (v31 >= 60.0)
  {
    int v32 = BatteryUILocalization(@"%@_ALWAYS_ON");
    double v33 = [(BatteryUIController *)self formatUsageStringInMinOrHr:&off_C9620];
    BOOL v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33);
    long long v35 = +[PLBatteryUIUtilities replaceWithUnBreakableSpace:v34];

    if (v11)
    {
      uint64_t v36 = +[NSString stringWithFormat:@"%@ – %@", v11, v35];

      id v11 = (id)v36;
    }
    else
    {
      id v11 = v35;
    }
  }

  return v11;
}

- (id)generateBatteryEntrySpecifiers:(id)a3
{
  id v4 = a3;
  double v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8E0CC();
  }

  if (!v4)
  {
    id v9 = 0;
    goto LABEL_62;
  }
  v78 = +[NSMutableArray array];
  id v6 = [(BatteryUIController *)self batteryUIQueryRangeKey];
  double v7 = [v4 objectForKeyedSubscript:v6];
  float v8 = [v7 objectForKeyedSubscript:@"PLBatteryUIErrorCodeKey"];

  if ([v8 integerValue] == (char *)&dword_0 + 1)
  {
    id v9 = 0;
    goto LABEL_61;
  }
  float v10 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_8E060();
  }

  if (self->_tappedIndex == -1)
  {
    float v12 = [(BatteryUIController *)self batteryUIQueryRangeKey];
    float v13 = [v4 objectForKeyedSubscript:v12];
    uint64_t v18 = [v13 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  }
  else
  {
    if (self->_batteryUIQueryRange) {
      id v11 = @"PLBatteryUIQueryRangeWeekTapKey";
    }
    else {
      id v11 = @"PLBatteryUIQueryRangeDayTapKey";
    }
    float v12 = v11;
    float v13 = [v4 objectForKeyedSubscript:v12];
    unint64_t tappedIndex = self->_tappedIndex;
    if ((unint64_t)[v13 count] > tappedIndex)
    {
      double v15 = [v4 objectForKeyedSubscript:v12];
      double v16 = [v15 objectAtIndexedSubscript:self->_tappedIndex];
      float v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

      if (v17) {
        goto LABEL_18;
      }
    }
    uint64_t v18 = +[NSMutableArray array];
  }
  float v17 = (void *)v18;
LABEL_18:

  if (!v17 || ![v17 count])
  {
    id v9 = 0;
    goto LABEL_60;
  }
  v73 = v8;
  id v74 = v4;
  v75 = v17;
  if ((self->_batteryUIQueryType & 0xFFFFFFFE) == 2)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v84 objects:v89 count:16];
    if (!v20)
    {

      goto LABEL_42;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v85;
    float v23 = 0.0;
    CFStringRef v24 = @"PLBatteryUIAppTypeKey";
    CFStringRef v25 = @"PLBatteryUIAppEnergyValueKey";
    while (1)
    {
      id v26 = 0;
      id v76 = v21;
      do
      {
        if (*(void *)v85 != v22) {
          objc_enumerationMutation(v19);
        }
        double v27 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v26);
        if ([(BatteryUIController *)self batteryUIQueryType] != 3)
        {
          id v28 = [v27 objectForKeyedSubscript:v25];
          [v28 floatValue];
          if ((int)(v29 + 0.5) < 1)
          {
            [v27 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            uint64_t v30 = v22;
            CFStringRef v31 = v25;
            id v32 = v19;
            BOOL v34 = v33 = v24;
            [v34 doubleValue];
            double v36 = v35;
            double v37 = [v27 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
            [v37 doubleValue];
            double v39 = v36 + v38;

            CFStringRef v24 = v33;
            id v19 = v32;
            CFStringRef v25 = v31;
            uint64_t v22 = v30;
            id v21 = v76;

            if (v39 < 60.0) {
              goto LABEL_36;
            }
          }
          else
          {
          }
        }
        if ([(BatteryUIController *)self showRootNodesInInternal]
          && [(BatteryUIController *)self batteryUIType]
          || ([v27 objectForKeyedSubscript:v24],
              id v40 = objc_claimAutoreleasedReturnValue(),
              unsigned int v41 = [v40 intValue],
              v40,
              v41 != 5))
        {
          if ([(BatteryUIController *)self batteryUIType]
            || ([v27 objectForKeyedSubscript:v24],
                id v42 = objc_claimAutoreleasedReturnValue(),
                unsigned int v43 = [v42 intValue],
                v42,
                v43 != 2))
          {
            id v44 = [v27 objectForKeyedSubscript:v25];
            [v44 floatValue];
            float v23 = v23 + v45;
          }
        }
LABEL_36:
        id v26 = (char *)v26 + 1;
      }
      while (v21 != v26);
      id v21 = [v19 countByEnumeratingWithState:&v84 objects:v89 count:16];
      if (!v21)
      {

        float v17 = v75;
        if (v23 > 0.0) {
          self->_float batteryTotal = v23;
        }
        break;
      }
    }
  }
LABEL_42:
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v46 = v17;
  id v47 = [v46 countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (!v47) {
    goto LABEL_59;
  }
  id v48 = v47;
  uint64_t v49 = *(void *)v81;
  CFStringRef v50 = @"PLBatteryUIAppTypeKey";
  CFStringRef v51 = @"PLBatteryUIAppEnergyValueKey";
  v77 = self;
  do
  {
    for (i = 0; i != v48; i = (char *)i + 1)
    {
      if (*(void *)v81 != v49) {
        objc_enumerationMutation(v46);
      }
      v53 = *(void **)(*((void *)&v80 + 1) + 8 * i);
      if ([(BatteryUIController *)self batteryUIQueryType] != 3)
      {
        id v54 = [v53 objectForKeyedSubscript:v51];
        [v54 floatValue];
        if ((int)(v55 + 0.5) < 1)
        {
          id v56 = [v53 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          [v56 doubleValue];
          double v58 = v57;
          [v53 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
          id v59 = v48;
          uint64_t v60 = v49;
          id v61 = v46;
          CFStringRef v62 = v50;
          v64 = CFStringRef v63 = v51;
          [v64 doubleValue];
          double v66 = v58 + v65;

          CFStringRef v51 = v63;
          CFStringRef v50 = v62;
          id v46 = v61;
          uint64_t v49 = v60;
          id v48 = v59;
          self = v77;

          if (v66 < 60.0) {
            continue;
          }
        }
        else
        {
        }
      }
      if (![(BatteryUIController *)self showRootNodesInInternal]
        || ![(BatteryUIController *)self batteryUIType])
      {
        long long v67 = [v53 objectForKeyedSubscript:v50];
        unsigned int v68 = [v67 intValue];

        if (v68 == 5) {
          continue;
        }
      }
      if (![(BatteryUIController *)self batteryUIType])
      {
        id v69 = [v53 objectForKeyedSubscript:v50];
        unsigned int v70 = [v69 intValue];

        if (v70 == 2) {
          continue;
        }
      }
      id v71 = [(BatteryUIController *)self specifierForBatteryEntry:v53];
      [v78 addObject:v71];
    }
    id v48 = [v46 countByEnumeratingWithState:&v80 objects:v88 count:16];
  }
  while (v48);
LABEL_59:

  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_2B740;
  v79[3] = &unk_BE560;
  v79[4] = self;
  [v78 sortUsingComparator:v79];
  id v9 = v78;
  float v8 = v73;
  id v4 = v74;
  float v17 = v75;
LABEL_60:

LABEL_61:
LABEL_62:

  return v9;
}

- (BOOL)appQualifiers:(id)a3 containsQualifier:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count] && objc_msgSend(v6, "count"))
  {
    unint64_t v7 = 0;
    do
    {
      float v8 = [v6 objectAtIndexedSubscript:v7];
      uint64_t v9 = (int)[v8 intValue];

      BOOL v10 = v9 == a4;
      if (v9 == a4) {
        break;
      }
      ++v7;
    }
    while ((unint64_t)[v6 count] > v7);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)appQualifiers:(id)a3
{
  id v3 = a3;
  if (!+[BatteryUIResourceClass inDemoMode]) {
    goto LABEL_7;
  }
  id v4 = +[BatteryUIResourceClass valueForDefaultKey:@"BUIDemoQualifiers"];
  if (!v4)
  {
LABEL_6:

LABEL_7:
    id v4 = [v3 propertyForKey:@"PLBatteryUIAppQualifiersKey"];
    id v6 = BatteryUIPrintQualifierString(v4);
    goto LABEL_8;
  }
  id v5 = [v3 name];
  id v6 = [v4 valueForKey:v5];

  if (!v6 || ![v6 length])
  {

    goto LABEL_6;
  }
LABEL_8:

  return v6;
}

- (id)specifierForBatteryEntry:(id)a3
{
  id v4 = a3;
  if ([(BatteryUIController *)self batteryUIType] == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 4;
  }
  if ([(BatteryUIController *)self batteryUIType] == 2) {
    uint64_t v6 = objc_opt_class();
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:v6 cell:v5 edit:0];
  float v8 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  [v7 setProperty:v8 forKey:@"PLBatteryUIAppEnergyValueKey"];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
  [v7 setProperty:v9 forKey:@"PLBatteryUIAppForegroundRuntimeKey"];

  BOOL v10 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
  [v7 setProperty:v10 forKey:@"PLBatteryUIAppBackgroundRuntimeKey"];

  id v11 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
  [v7 setProperty:v11 forKey:@"PLBatteryUIAppAlwaysOnRuntimeKey"];

  float v12 = [(BatteryUIController *)self appEnergyValue:v7];
  [v7 setProperty:v12 forKey:@"PLBatteryUIAppEnergyDisplayPercentKey"];

  float v13 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  unsigned __int8 v14 = [v13 isEqualToString:@"Flashlight"];

  double v15 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  unsigned __int8 v16 = [v15 isEqualToString:@"PowerOutAccessories"];

  if ((v14 & 1) == 0 && (v16 & 1) == 0)
  {
    float v17 = [(BatteryUIController *)self appFGBGValue:v7];
    [v7 setProperty:v17 forKey:@"PLBatteryUIAppForegroundBackgroundRuntimeValueKey"];
  }
  uint64_t v18 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppQualifiersKey"];
  [v7 setProperty:v18 forKey:@"PLBatteryUIAppQualifiersKey"];

  id v19 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
  [v7 setProperty:v19 forKey:@"PLBatteryUIAppTypeKey"];

  id v20 = +[NSNumber numberWithUnsignedInt:self->_batteryUIType];
  [v7 setProperty:v20 forKey:@"PLBatteryUITypeKey"];

  id v21 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  [v7 setProperty:v21 forKey:PSIDKey];

  uint64_t v22 = +[NSNumber numberWithUnsignedInt:self->_iconDisplayType];
  [v7 setProperty:v22 forKey:@"PLIconDisplayTypeKey"];

  float v23 = +[NSNumber numberWithBool:self->_buttonPressed];
  [v7 setProperty:v23 forKey:@"PLButtonPressedKey"];

  CFStringRef v24 = +[NSNumber numberWithUnsignedInt:[(BatteryUIController *)self batteryUIQueryType]];
  [v7 setProperty:v24 forKey:@"PLBatteryUIQueryTypeKey"];

  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v7 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v7 setProperty:&__kCFBooleanTrue forKey:PSLazyIconDontUnload];
  CFStringRef v25 = BatteryUIGetDisplayName(v4);
  [v7 setName:v25];

  id v26 = [(BatteryUIController *)self appQualifiers:v7];
  [v7 setProperty:v26 forKey:@"cellSubtitleText"];

  double v27 = [[WeakBatteryUIController alloc] initWithController:self];
  [v7 setProperty:v27 forKey:@"PSSubtitleTileValueTableCellDelegateWrapperKey"];
  [v7 setProperty:v4 forKey:@"APP_ENERGY_ENTRY"];
  id v28 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
  unsigned int v29 = [v28 intValue];

  if (v29 == 4)
  {
    id v32 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
    uint64_t v30 = +[UIWebClip webClipWithIdentifier:v32];

    CFStringRef v33 = +[UIScreen mainScreen];
    [v33 scale];
    uint64_t v34 = objc_msgSend(v30, "generateIconImageForFormat:scale:", 0);
LABEL_24:
    unsigned int v41 = (void *)v34;

    goto LABEL_25;
  }
  if (v29 != 1)
  {
    if (!v29)
    {
      uint64_t v30 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      [v7 setObject:v30 forKeyedSubscript:PSLazyIconAppID];
      id v31 = v7;
LABEL_18:

      goto LABEL_28;
    }
    goto LABEL_26;
  }
  uint64_t v30 = [v4 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  uint64_t v35 = +[PLBatteryUIUtilities iconUTTypeIdentifierForNonApp:v30];
  double v36 = (void *)v35;
  if (v35)
  {
    double v37 = &PSIconUTTypeIdentifierKey;
    CFStringRef v38 = (const __CFString *)v35;
LABEL_17:
    [v7 setObject:v38 forKeyedSubscript:*v37];
    id v39 = v7;

    goto LABEL_18;
  }
  if ([v30 isEqualToString:@"ContinuityCamera"])
  {
    CFStringRef v33 = BatteryUIResourceBundle();
    CFStringRef v40 = @"ContinuityCamera";
LABEL_23:
    uint64_t v34 = +[UIImage imageNamed:v40 inBundle:v33];
    goto LABEL_24;
  }
  if ([v30 isEqualToString:@"ScreenContinuityShell"])
  {
    CFStringRef v33 = BatteryUIResourceBundle();
    CFStringRef v40 = @"ScreenContinuity";
    goto LABEL_23;
  }
  if ([v30 isEqualToString:@"Siri"])
  {
    CFStringRef v38 = @"com.apple.siri";
LABEL_35:
    double v37 = &PSLazyIconAppID;
    goto LABEL_17;
  }
  if ([v30 isEqualToString:@"HomeKit"])
  {
    CFStringRef v38 = @"com.apple.Home";
    goto LABEL_35;
  }
  unsigned int v41 = 0;
LABEL_25:

  if (!v41)
  {
LABEL_26:
    unsigned int v41 = PSBlankIconImage();
  }
  [v7 setProperty:v41 forKey:PSIconImageKey];

  id v42 = v7;
LABEL_28:

  return v7;
}

- (id)batteryUIQueryRangeKey
{
  if (self->_batteryUIQueryRange == 1) {
    return @"PLBatteryUIQueryRangeWeekKey";
  }
  else {
    return @"PLBatteryUIQueryRangeDayKey";
  }
}

- (id)batteryUIQueryRange:(id)a3
{
  return +[NSNumber numberWithUnsignedInt:self->_batteryUIQueryRange];
}

- (void)setBatteryUIQueryRange:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if ([v5 intValue] != self->_batteryUIQueryRange)
  {
    self->_batteryUIQueryRange = [v5 integerValue];
    self->_unint64_t tappedIndex = -1;
    ADClientAddValueForScalarKey();
    uint64_t v6 = objc_opt_new();
    unint64_t v7 = v6;
    if (self->_batteryUIQueryRange) {
      CFStringRef v8 = @"xDay";
    }
    else {
      CFStringRef v8 = @"24hr";
    }
    [v6 setObject:v8 forKeyedSubscript:@"duration"];
    id v9 = v7;
    AnalyticsSendEventLazy();
    BOOL v10 = [(BatteryUIController *)self currentDictionary];

    if (v10) {
      [(BatteryUIController *)self rebuildList];
    }
  }
}

- (void)rebuildList
{
  id v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8E100();
  }

  id v4 = [(BatteryUIController *)self currentDictionary];
  id v5 = [(BatteryUIController *)self generateBatteryEntrySpecifiers:v4];
  batteryEntries = self->_batteryEntries;
  self->_batteryEntries = v5;

  [(BatteryUIController *)self reloadSpecifiers];
}

- (void)setSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BatteryUIController;
  id v4 = a3;
  [(BatteryUIController *)&v8 setSpecifier:v4];
  id v5 = objc_msgSend(v4, "propertyForKey:", @"PLBatteryUITypeKey", v8.receiver, v8.super_class);

  -[BatteryUIController setBatteryUIType:](self, "setBatteryUIType:", [v5 intValue]);
  unsigned int v6 = [(BatteryUIController *)self batteryUIType];
  if (v6 - 2 >= 2)
  {
    if (v6 != 1)
    {
      uint64_t v7 = 0;
      goto LABEL_8;
    }
    if (![(BatteryUIController *)self showRootNodesInInternal])
    {
      uint64_t v7 = 2;
      goto LABEL_8;
    }
    [(BatteryUIController *)self setBatteryUIType:2];
  }
  uint64_t v7 = 3;
LABEL_8:
  [(BatteryUIController *)self setBatteryUIQueryType:v7];
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2C548;
  v5[3] = &unk_BE6B0;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)deviceOrientationDidChange:(id)a3
{
  uint64_t v4 = [(BatteryUIController *)self getDeviceOrientationFromCurrentDevice];
  if (v4 != [(BatteryUIController *)self batteryUIDeviceOrientation])
  {
    [(BatteryUIController *)self setClearGraph:1];
    [(BatteryUIController *)self reloadSpecifiers];
    [(BatteryUIController *)self setBatteryUIDeviceOrientation:v4];
  }
}

- (int)getDeviceOrientationFromCurrentDevice
{
  int v2 = [(BatteryUIController *)self batteryUIDeviceOrientation];
  id v3 = +[UIDevice currentDevice];
  uint64_t v4 = (char *)[v3 orientation];

  if ((unint64_t)(v4 - 1) <= 3) {
    return dword_9B5D0[(void)(v4 - 1)];
  }
  return v2;
}

- (BOOL)checkOnInitIfServiceBatteryRequired
{
  +[BatteryUIResourceClass containerPath];
  int v2 = (void *)_CFPreferencesCopyValueWithContainer();
  BOOL v3 = v2 != 0;

  return v3;
}

- (BatteryUIController)init
{
  v15.receiver = self;
  v15.super_class = (Class)BatteryUIController;
  int v2 = [(BatteryUIController *)&v15 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_batteryUIQueryRange = 0;
    v2->_batteryUIQueryType = 0;
    v2->_iconDisplayType = 0;
    if ([(BatteryUIController *)v2 shouldAutoCycle])
    {
      v3->_buttonPressed = 1;
      [(BatteryUIController *)v3 startRepeatingTimer];
    }
    else
    {
      v3->_buttonPressed = 0;
    }
    v3->_isFirstTimeLaunchingInternalUI = 1;
    v3->_isFirstTimeSettingUpBatterySpecifiers = 1;
    v3->_isSquishedText = [(BatteryUIController *)v3 isSquished];
    uint64_t v4 = +[NSMutableDictionary dictionary];
    tips = v3->_tips;
    v3->_tips = (NSMutableDictionary *)v4;

    v3->_unint64_t tappedIndex = -1;
    [(BatteryUIController *)v3 setWaitingForResponse:0];
    [(BatteryUIController *)v3 setReusesCells:1];
    [(BatteryUIController *)v3 setClearGraph:0];
    v3->contentOffsetBUI = (CGPoint)vdupq_n_s64(0x47EFFFFFE0000000uLL);
    [(BatteryUIController *)v3 setBatteryUIDeviceOrientation:2];
    id v6 = objc_alloc_init(_TtC14BatteryUsageUI24PLBUIChartViewController);
    chartViewController = v3->_chartViewController;
    v3->_chartViewController = v6;

    [(BatteryUIController *)v3 addChildViewController:v3->_chartViewController];
    if (_os_feature_enabled_impl())
    {
      uint64_t v8 = +[ChargingStatusViewFactory create];
      chargingStatusViewController = v3->_chargingStatusViewController;
      v3->_chargingStatusViewController = (UIViewController *)v8;

      [(BatteryUIController *)v3 addChildViewController:v3->_chargingStatusViewController];
    }
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = objc_alloc_init(PLBatteryUIBackendModel);
      [(BatteryUIController *)v3 setBackend:v10];
    }
    id v11 = objc_alloc((Class)PowerUISmartChargeClient);
    float v12 = (PowerUISmartChargeClient *)[v11 initWithClientName:PowerUISmartChargeClientSettings];
    chargingClient = v3->_chargingClient;
    v3->_chargingClient = v12;
  }
  return v3;
}

- (void)dealloc
{
  BOOL v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8E1A8();
  }

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.powerlogd.refreshBUI", 0);
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v7.receiver = self;
  v7.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v7 dealloc];
}

- (id)getBatteryServiceSuggestion
{
  int v2 = objc_opt_new();
  if (+[BatteryUIResourceClass isBatteryUnverified])
  {
    ADClientAddValueForScalarKey();
    [v2 setObject:@"batteryNotTrusted" forKeyedSubscript:@"reason"];
    id v17 = v2;
    AnalyticsSendEventLazy();
    id v3 = objc_alloc((Class)NSAttributedString);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (uint64_t v4 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      uint64_t v4 = BatteryUILocalization(@"BATTERY_UNVERIFIED");
    }
    id v5 = [v3 initWithString:v4];

    id v6 = v17;
LABEL_32:
  }
  else if (+[BatteryUIResourceClass batteryDataUnavailable])
  {
LABEL_7:
    id v5 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_C3A18];
  }
  else
  {
    int v7 = +[BatteryUIResourceClass getBatteryHealthServiceState];
    uint64_t v8 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_8E2D4(v7, v8);
    }

    CFStringRef v9 = @"nominalChargeCapacity";
    switch(v7)
    {
      case -1:
      case 0:
      case 7:
      case 9:
      case 10:
        goto LABEL_21;
      case 1:
        goto LABEL_28;
      case 2:
        CFStringRef v9 = @"peakPowerCapacity";
        goto LABEL_28;
      case 3:
        CFStringRef v9 = @"nominalChargeAndPeakPower";
        goto LABEL_28;
      case 4:
        CFStringRef v9 = @"RBATT";
        goto LABEL_28;
      case 5:
        CFStringRef v9 = @"notDeterminable";
        goto LABEL_28;
      case 6:
        CFStringRef v9 = @"BCDC";
        goto LABEL_28;
      case 8:
        BOOL v10 = BUILogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_8E254(v10);
        }
        goto LABEL_20;
      case 11:
        CFStringRef v9 = @"calibrationFailed";
LABEL_28:
        [v2 setObject:v9 forKeyedSubscript:@"reason"];
        ADClientAddValueForScalarKey();
        id v16 = v2;
        AnalyticsSendEventLazy();
        id v13 = objc_alloc((Class)NSAttributedString);
        if (!+[BatteryUIResourceClass inDemoMode](BatteryUIResourceClass, "inDemoMode", _NSConcreteStackBlock, 3221225472, sub_2CF14, &unk_BE5D0)|| (+[BatteryUIResourceClass containerPath], (unsigned __int8 v14 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          unsigned __int8 v14 = BatteryUILocalization(@"BATTERY_SERVICE");
        }
        id v5 = [v13 initWithString:v14];

        id v6 = v16;
        goto LABEL_32;
      default:
        BOOL v10 = BUILogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_8E1DC(v7, v10);
        }
LABEL_20:

LABEL_21:
        if (!+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController", v9)&& !+[PLBatteryUIBackendModel shouldShowModifiedHealthController])
        {
          goto LABEL_7;
        }
        id v11 = objc_alloc((Class)NSAttributedString);
        if (!+[BatteryUIResourceClass inDemoMode]
          || (+[BatteryUIResourceClass containerPath],
              (float v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
        {
          float v12 = BatteryUILocalization(@"NORMAL_STATE");
        }
        id v5 = [v11 initWithString:v12];

        break;
    }
  }

  return v5;
}

- (void)setAggdKeysForNoBreakdownOnTap
{
}

- (id)setUpGraphGroupSpecifier
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"GraphGroupSpecifier"];
  if (self->_batteryBreakDownNotAvailable)
  {
    unsigned int v4 = +[PLBatteryUIUtilities isTappedIntervalCurrentBucket:self->_tappedIndex withQueryRange:self->_batteryUIQueryRange andEndTime:self->_endTime];
    if (self->_tappedIndex != -1 && v4 == 0)
    {
      id v6 = -[BatteryUIController getTappedTimeDurationStringForTappedIndex:isUpperCase:isFooterString:](self, "getTappedTimeDurationStringForTappedIndex:isUpperCase:isFooterString:");
    }
    else if (!+[BatteryUIResourceClass inDemoMode] {
           || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"NOTENOUGHINFO"), +[BatteryUIResourceClass containerPath], (id v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    }
    {
      int v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"NOTENOUGHINFO"];
      id v6 = BatteryUILocalization(v7);
    }
    [(BatteryUIController *)self setAggdKeysForNoBreakdownOnTap];
    uint64_t v8 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_8E34C();
    }
  }
  else if (!+[BatteryUIResourceClass inDemoMode] {
         || (+[BatteryUIResourceClass containerPath],
  }
             (id v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    id v6 = BatteryUILocalization(@"BREAKDOWN_FOOTNOTE_PERCENTAGE");
  }
  [v3 setProperty:v6 forKey:PSFooterTextGroupKey];

  return v3;
}

- (BOOL)isServiceState
{
  unsigned int v2 = +[BatteryUIResourceClass getBatteryHealthServiceState];
  return (v2 < 0xC) & (0x87Eu >> v2);
}

- (id)getTestValues
{
  if (+[BatteryUIResourceClass genuineBatteryStatus] == 2) {
    return &off_C9638;
  }
  if ([(BatteryUIController *)self isServiceState]) {
    return &off_C9650;
  }
  return &off_C9620;
}

- (id)setUpBatteryHealthGroup
{
  id v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8E3B8();
  }

  int v12 = 28030256;
  long long v11 = xmmword_9B5E0;
  int v10 = 1214363620;
  long long v9 = xmmword_9B5F4;
  unsigned int v4 = 0;
  if ((MGIsDeviceOneOfType() & 1) == 0)
  {
    if ((+[PLModelingUtilities isiPhone] & 1) != 0
      || +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
    {
      unsigned int v4 = +[NSMutableArray array];
      id v5 = +[PSSpecifier groupSpecifierWithID:@"BATTERY_HEALTH_ID"];
      [v4 addObject:v5];
      id v6 = [(BatteryUIController *)self setUpBatteryHealthSpecifier];
      [v4 addObject:v6];
      if (+[PLBatteryUIBackendModel shouldShowChargingController])
      {
        int v7 = [(BatteryUIController *)self setUpChargingSpecifier];
        [v4 addObject:v7];
      }
    }
    else
    {
      unsigned int v4 = 0;
    }
  }

  return v4;
}

- (id)setUpBatteryHealthSpecifier
{
  id v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8E3EC();
  }

  if (+[PLBatteryUIBackendModel shouldShowChargingController](PLBatteryUIBackendModel, "shouldShowChargingController")|| +[PLBatteryUIBackendModel shouldShowModifiedHealthController])
  {
    if (+[BatteryUIResourceClass inDemoMode])
    {
      +[BatteryUIResourceClass containerPath];
      unsigned int v4 = @"BATTERY_HEALTH_TITLE";
      goto LABEL_10;
    }
    unsigned int v4 = @"BATTERY_HEALTH_TITLE";
  }
  else
  {
    if (+[BatteryUIResourceClass inDemoMode])
    {
      +[BatteryUIResourceClass containerPath];
      unsigned int v4 = @"BATTERY_HEALTH";
LABEL_10:
      id v5 = (void *)_CFPreferencesCopyValueWithContainer();
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    unsigned int v4 = @"BATTERY_HEALTH";
  }
LABEL_13:
  id v5 = BatteryUILocalization(v4);
LABEL_14:
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v6 setIdentifier:@"BATTERY_HEALTH_TITLE"];
  [v6 setAccessibilityIdentifier:@"BATTERY_HEALTH_TITLE"];
  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v6 setProperty:v5 forKey:@"PLBatteryUISecondaryTextSettableCellPrimaryTextKey"];
  int v7 = [(BatteryUIController *)self getBatteryServiceSuggestion];
  [v6 setProperty:v7 forKey:@"PLBatteryUISecondaryTextSettableCellSecondaryTextKey"];

  return v6;
}

- (id)getChargingMode
{
  id v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8E538();
  }

  if (+[PLBatteryUIBackendModel supportsChargingFixedLimit])
  {
    unsigned int v4 = [(BatteryUIController *)self chargingClient];
    id v16 = 0;
    id v5 = [v4 isMCLCurrentlyEnabled:&v16];
    id v6 = v16;

    int v7 = [(BatteryUIController *)self chargingClient];
    uint64_t v15 = 0;
    uint64_t v8 = (char *)[v7 isSmartChargingCurrentlyEnabled:&v15];

    long long v9 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_8E4BC();
    }

    if (v5)
    {
      int v10 = +[BatteryUIResourceClass get_log_handle_bui];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_8E488();
      }
      uint64_t v11 = 1;
    }
    else
    {
      int v10 = +[BatteryUIResourceClass get_log_handle_bui];
      BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v8 == (unsigned char *)&dword_0 + 1)
      {
        if (v13) {
          sub_8E420();
        }
        uint64_t v11 = 0;
      }
      else
      {
        if (v13) {
          sub_8E454();
        }
        uint64_t v11 = 2;
      }
    }

    int v12 = +[NSNumber numberWithInt:v11];
  }
  else
  {
    id v6 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_8CF28();
    }
    int v12 = 0;
  }

  return v12;
}

- (id)setChargingMode:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8E5A0();
  }

  if (+[PLBatteryUIBackendModel supportsChargingFixedLimit])
  {
    if ([v5 intValue])
    {
      if ([v5 intValue] != 1)
      {
        int v10 = +[BatteryUIResourceClass get_log_handle_bui];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_8E56C();
        }
        goto LABEL_16;
      }
      int v7 = [(BatteryUIController *)self chargingClient];
      id v19 = 0;
      [v7 disableDEoC:&v19];
      id v8 = v19;

      long long v9 = [(BatteryUIController *)self chargingClient];
      id v18 = v8;
      [v9 enableMCL:&v18];
      int v10 = v18;

      [(BatteryUIController *)self setCurChargingMode:1];
      uint64_t v11 = +[BatteryUIResourceClass get_log_handle_bui];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_8CF90(self);
      }
    }
    else
    {
      unsigned __int8 v14 = [(BatteryUIController *)self chargingClient];
      id v21 = 0;
      [v14 enableSmartCharging:&v21];
      id v15 = v21;

      id v16 = [(BatteryUIController *)self chargingClient];
      id v20 = v15;
      [v16 disableMCL:&v20];
      int v10 = v20;

      [(BatteryUIController *)self setCurChargingMode:0];
      uint64_t v11 = +[BatteryUIResourceClass get_log_handle_bui];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_8CF90(self);
      }
    }

LABEL_16:
    BOOL v13 = +[NSNumber numberWithInt:[(BatteryUIController *)self curChargingMode]];
    goto LABEL_17;
  }
  int v12 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_8CF28();
  }

  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (id)setUpChargingSpecifier
{
  id v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_8E60C();
  }

  int v4 = _os_feature_enabled_impl();
  unsigned int v5 = +[BatteryUIResourceClass inDemoMode];
  if (v4)
  {
    if (!v5
      || (+[BatteryUIResourceClass containerPath],
          (id v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v6 = BatteryUILocalization(@"CHARGING_TITLE_CHARGING");
    }
    int v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v7 setIdentifier:@"CHARGING_OPTIONS_IDENTIFIER"];
    [v7 setAccessibilityIdentifier:@"CHARGING_TITLE"];
  }
  else
  {
    if (!v5
      || (+[BatteryUIResourceClass containerPath],
          (id v8 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v8 = BatteryUILocalization(@"CHARGING_TITLE");
    }
    int v7 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setChargingMode:specifier:" get:"getChargingMode" detail:objc_opt_class() cell:2 edit:0];

    long long v9 = +[NSNumber numberWithInt:0];
    v27[0] = v9;
    int v10 = +[NSNumber numberWithInt:1];
    v27[1] = v10;
    uint64_t v11 = +[NSNumber numberWithInt:2];
    v27[2] = v11;
    CFStringRef v24 = +[NSArray arrayWithObjects:v27 count:3];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (int v12 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      int v12 = BatteryUILocalization(@"CHARGING_FIXED_LIMIT");
    }
    BOOL v13 = +[PLBatteryUIUtilities localizedStringWithPercentage:80.0];
    unsigned __int8 v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v15 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v15 = BatteryUILocalization(@"SC_TITLE");
    }
    v26[0] = v15;
    v26[1] = v14;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v16 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v16 = BatteryUILocalization(@"CHARGING_OFF");
    }
    v26[2] = v16;
    id v17 = +[NSArray arrayWithObjects:v26 count:3];

    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v18 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v18 = BatteryUILocalization(@"SHORT_FIXED");
    }
    id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v13);
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v20 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v20 = BatteryUILocalization(@"SHORT_OPTIMIZED");
    }
    v25[0] = v20;
    v25[1] = v19;
    if (!+[BatteryUIResourceClass inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v21 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v21 = BatteryUILocalization(@"CHARGING_OFF");
    }
    v25[2] = v21;
    uint64_t v22 = +[NSArray arrayWithObjects:v25 count:3];

    [v7 setIdentifier:@"CHARGING_OPTIONS_IDENTIFIER"];
    [v7 setAccessibilityIdentifier:@"CHARGING_TITLE"];
    [v7 setValues:v24 titles:v17 shortTitles:v22];
  }

  return v7;
}

- (id)getUsageTimeToggle
{
  return +[NSNumber numberWithUnsignedInt:self->_batteryUIQueryRange];
}

- (id)setUpToggleForUsageTimeSpecifier
{
  id v3 = [(BatteryUIController *)self currentDictionary];
  int v4 = [v3 objectForKeyedSubscript:@"PLBatteryUIDataDurationKey"];
  [v4 doubleValue];
  double v6 = v5;

  int v7 = [(BatteryUIController *)self currentDictionary];
  id v8 = [v7 objectForKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];
  long long v9 = [v8 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];
  [v9 doubleValue];
  double v11 = v10;
  int v12 = [(BatteryUIController *)self currentDictionary];
  BOOL v13 = [v12 objectForKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];
  unsigned __int8 v14 = [v13 objectForKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];
  [v14 doubleValue];
  double v16 = v11 + v15;

  if (v6 < v16) {
    double v6 = v16;
  }
  id v17 = +[NSBundle mainBundle];
  id v18 = BatteryUILocalization(@"LAST_HOURS");
  id v19 = [v17 localizedStringForKey:v18 value:&stru_C3A18 table:0];
  if (v6 >= 172800.0)
  {
    int v23 = vcvtpd_s64_f64(v6 / 86400.0);
    if (v23 >= 10) {
      uint64_t v24 = 10;
    }
    else {
      uint64_t v24 = v23;
    }
    id v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, 24);

    id v17 = +[NSBundle mainBundle];
    id v18 = BatteryUILocalization(@"LAST_DAYS");
    id v19 = [v17 localizedStringForKey:v18 value:&stru_C3A18 table:0];
    uint64_t v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v24);
  }
  else
  {
    LODWORD(v20) = (int)(v6 / 3600.0);
    if ((int)v20 >= 24) {
      LODWORD(v20) = 24;
    }
    if ((int)v20 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v20;
    }
    id v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v20);
    uint64_t v22 = 0;
  }

  CFStringRef v25 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setBatteryUIQueryRange:specifier:" get:"getUsageTimeToggle" detail:0 cell:9 edit:0];
  if (v21 && v22)
  {
    v34[0] = v21;
    v34[1] = v22;
    id v26 = +[NSArray arrayWithObjects:v34 count:2];
    double v27 = &off_CA728;
  }
  else
  {
    CFStringRef v33 = v21;
    id v26 = +[NSArray arrayWithObjects:&v33 count:1];
    double v27 = &off_CA740;
  }
  [v25 setValues:v27 titles:v26];

  [v25 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v28 = +[NSNumber numberWithBool:[(BatteryUIController *)self clearGraph]];
  [v25 setProperty:v28 forKey:@"PLBatteryUIGraphClearGraphKey"];

  unsigned int v29 = [(BatteryUIController *)self view];
  uint64_t v30 = PSShouldInsetListView() ^ 1;

  id v31 = +[NSNumber numberWithBool:v30];
  [v25 setProperty:v31 forKey:@"PLBatteryUIGraphRequiresTopSeparatorKey"];

  return v25;
}

- (id)setUpUsageTimeValuesSpecifier
{
  unsigned int v2 = self;
  id v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  int v4 = &objc_loadWeakRetained_ptr;
  double v5 = +[NSNumber numberWithUnsignedInt:v2->_batteryUIQueryRange];
  [v3 setProperty:v5 forKey:@"PLBatteryUIGraphQueryRangeKey"];

  double v6 = +[NSNumber numberWithBool:v2->_batteryBreakDownNotAvailable];
  [v3 setProperty:v6 forKey:@"PLBatteryUIGraphBatteryBreakdownNotAvailableKey"];

  if (!v2->_batteryUIQueryRange)
  {
    int tappedIndex = v2->_tappedIndex;
    int v23 = [(NSMutableDictionary *)v2->_currentGraphDictionary objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
    CFStringRef v25 = v24;
    if (tappedIndex == -1)
    {
      id v61 = [v24 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];

      CFStringRef v62 = [(NSMutableDictionary *)v2->_currentGraphDictionary objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
      CFStringRef v63 = [v62 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
      v64 = [v63 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];

      [v61 doubleValue];
      double v66 = v65;
      [v64 doubleValue];
      unsigned int v68 = +[PLBatteryUIUtilities scaledScreenOn:v66 screenOff:v67 andMaxTotalTime:86400.0];
      id v69 = [v68 objectAtIndexedSubscript:0];
      [v3 setProperty:v69 forKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];

      unsigned int v70 = [v68 objectAtIndexedSubscript:1];
      [v3 setProperty:v70 forKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];

      int v4 = &objc_loadWeakRetained_ptr;
      goto LABEL_37;
    }
    id v8 = [v24 objectForKeyedSubscript:@"PLBatteryUIGraphHourly"];

    id v26 = [(NSMutableDictionary *)v2->_currentGraphDictionary objectForKeyedSubscript:@"PLBatteryUIGraph24hrs"];
    double v27 = [v26 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
    id v28 = [v27 objectForKeyedSubscript:@"PLBatteryUIGraphHourly"];

    unint64_t v29 = v2->_tappedIndex;
    if ((v29 & 0x80000000) != 0
      || (unint64_t)[v8 count] <= v29
      || (unint64_t v30 = v2->_tappedIndex, (unint64_t)[v28 count] <= v30))
    {
      [v3 setProperty:&off_C9620 forKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];
      [v3 setProperty:&off_C9620 forKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];
    }
    else
    {
      id v31 = [v8 objectAtIndexedSubscript:v2->_tappedIndex];
      [v31 doubleValue];
      double v33 = v32;

      uint64_t v34 = [v28 objectAtIndexedSubscript:v2->_tappedIndex];
      [v34 doubleValue];
      double v36 = v35;

      double v37 = +[PLBatteryUIUtilities scaledScreenOn:v33 screenOff:v36 andMaxTotalTime:3600.0];
      CFStringRef v38 = [v37 objectAtIndexedSubscript:0];
      [v3 setProperty:v38 forKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];

      id v39 = [v37 objectAtIndexedSubscript:1];
      [v3 setProperty:v39 forKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];
    }
    int v4 = &objc_loadWeakRetained_ptr;
    goto LABEL_35;
  }
  int v7 = [(NSMutableDictionary *)v2->_currentGraphDictionary objectForKeyedSubscript:@"PLBatteryUIGraphDays"];
  id v8 = v7;
  unint64_t v9 = v2->_tappedIndex;
  if (v9 == -1)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v40 = [v7 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v40)
    {
      id v41 = v40;
      id v76 = v2;
      v77 = v3;
      uint64_t v42 = *(void *)v79;
      double v43 = 0.0;
      double v44 = 0.0;
      double v45 = 0.0;
      do
      {
        id v46 = v8;
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v79 != v42) {
            objc_enumerationMutation(v46);
          }
          id v48 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v49 = [v48 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
          CFStringRef v50 = [v49 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
          [v50 doubleValue];
          double v52 = v51;

          v53 = [v48 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
          id v54 = [v53 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
          [v54 doubleValue];
          double v56 = v55;

          BOOL v57 = v52 != -1.0;
          BOOL v58 = v56 != -1.0;
          if (v57 && v58) {
            double v43 = v43 + 1.0;
          }
          double v59 = -0.0;
          if (v57 && v58) {
            double v60 = v56;
          }
          else {
            double v60 = -0.0;
          }
          double v44 = v44 + v60;
          if (v57 && v58) {
            double v59 = v52;
          }
          double v45 = v45 + v59;
        }
        id v8 = v46;
        id v41 = [v46 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v41);
      if (v43 > 0.0)
      {
        double v45 = v45 / v43;
        double v44 = v44 / v43;
      }
      unsigned int v2 = v76;
      id v3 = v77;
      int v4 = &objc_loadWeakRetained_ptr;
    }
    else
    {
      double v44 = 0.0;
      double v45 = 0.0;
    }
    double v20 = v45;
    double v21 = v44;
    goto LABEL_34;
  }
  if ((v9 & 0x80000000) == 0 && (unint64_t)[v7 count] > v9)
  {
    double v10 = [v8 objectAtIndexedSubscript:v2->_tappedIndex];
    double v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIScreenOnTimeKey"];
    int v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
    [v12 doubleValue];
    double v14 = v13;

    double v15 = [v8 objectAtIndexedSubscript:v2->_tappedIndex];
    double v16 = [v15 objectForKeyedSubscript:@"PLBatteryUIScreenOffTimeKey"];
    id v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIGraphTotal"];
    [v17 doubleValue];
    double v19 = v18;

    double v20 = v14;
    double v21 = v19;
LABEL_34:
    id v28 = +[PLBatteryUIUtilities scaledScreenOn:v20 screenOff:v21 andMaxTotalTime:86400.0];
    id v71 = [v28 objectAtIndexedSubscript:0];
    [v3 setProperty:v71 forKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];

    v72 = [v28 objectAtIndexedSubscript:1];
    [v3 setProperty:v72 forKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];

LABEL_35:
    goto LABEL_36;
  }
  [v3 setProperty:&off_C9620 forKey:@"PLBatteryUIGraphScreenOnUsageTimeKey"];
  [v3 setProperty:&off_C9620 forKey:@"PLBatteryUIGraphScreenOffUsageTimeKey"];
LABEL_36:

LABEL_37:
  v73 = [[WeakBatteryUIController alloc] initWithController:v2];
  [v3 setProperty:v73 forKey:@"PLBatteryUIGraphTapDelegateWrapperKey"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  id v74 = [v4[299] numberWithInt:v2->_tappedIndex];
  [v3 setProperty:v74 forKey:@"PLBatteryUIGraphTappedIndexKey"];

  return v3;
}

- (id)setUpBatteryUsageHeaderSpecifier
{
  id v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  int v4 = [[WeakBatteryUIController alloc] initWithController:self];
  [v3 setProperty:v4 forKey:@"PLBatteryUITimeUsageCellDelegateWrapperKey"];
  uint64_t tappedIndex = self->_tappedIndex;
  if (tappedIndex != -1)
  {
    double v6 = [(BatteryUIController *)self getTappedTimeDurationStringForTappedIndex:tappedIndex isUpperCase:1 isFooterString:0];
    [v3 setProperty:v6 forKey:@"PLBatteryUIGraphTappedTimeDurationStringKey"];
  }
  int v7 = +[NSNumber numberWithUnsignedInt:self->_iconDisplayType];
  [v3 setProperty:v7 forKey:@"PLIconDisplayTypeKey"];

  id v8 = +[NSNumber numberWithInt:self->_tappedIndex];
  [v3 setProperty:v8 forKey:@"PLBatteryUIGraphTappedIndexKey"];

  [v3 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  unint64_t v9 = +[NSNumber numberWithBool:self->_batteryBreakdownShortString];
  [v3 setProperty:v9 forKey:@"PLBatteryUIGraphBatteryBreakdownShortStringKey"];

  return v3;
}

- (id)setUpGraphLastChargeSpecifier
{
  id v3 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  int v4 = [(BatteryUIController *)self currentLastChargeDictionary];
  [v3 setProperty:v4 forKey:@"PLBatteryUILastChargeKey"];

  [v3 setIdentifier:@"LAST_CHARGE_CELL"];
  if (_os_feature_enabled_impl())
  {
    double v5 = [(BatteryUIController *)self currentPausedChargingDictionary];
    [v3 setProperty:v5 forKey:@"PLBatteryUIPausedChargingKey"];
  }
  else
  {
    double v5 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "\"bui_last_charge_iOS\" feature flag is disabled. Not adding Paused Charging dictionary to Last Charge Specifier.", buf, 2u);
    }
  }

  double v6 = [[WeakBatteryUIController alloc] initWithController:self];
  [v3 setProperty:v6 forKey:@"PLBatteryUIGraphTapDelegateWrapperKey"];
  [v3 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return v3;
}

- (void)graphOnSelectAt:(id)a3
{
  if (a3) {
    uint64_t v4 = (uint64_t)[a3 intValue];
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  id v5 = +[NSNumber numberWithInt:v4];
  [(BatteryUIController *)self didTappedBar:v5];
}

- (id)batteryUsageGraphsSpecifier
{
  [(PLBUIChartViewController *)self->_chartViewController setDelegate:self];
  [(PLBUIChartViewController *)self->_chartViewController beginUpdate];
  [(PLBUIChartViewController *)self->_chartViewController setDataset:self->_currentGraphDictionary endOfDay:self->_endTime];
  chartViewController = self->_chartViewController;
  if (self->_batteryUIQueryRange) {
    +[PLBUIChartViewController chartIdentifier10Days];
  }
  else {
  uint64_t v4 = +[PLBUIChartViewController chartIdentifier24Hrs];
  }
  [(PLBUIChartViewController *)chartViewController setActiveChart:v4];

  id v5 = self->_chartViewController;
  double v6 = +[NSNumber numberWithInt:self->_tappedIndex];
  [(PLBUIChartViewController *)v5 setTappedIndex:v6];

  [(PLBUIChartViewController *)self->_chartViewController setMarginWithTop:16.0 bottom:0.0];
  int v7 = +[PSListController appearance];
  id v8 = [v7 foregroundColor];

  if (v8) {
    [(PLBUIChartViewController *)self->_chartViewController setContainerBackgroundColor:v8];
  }
  [(PLBUIChartViewController *)self->_chartViewController endUpdate];
  unint64_t v9 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v9 setProperty:self->_chartViewController forKey:@"PLBatteryUIGraphViewControllerKey"];
  double v10 = [(BatteryUIController *)self traitCollection];
  +[PLBUIChartViewController graphHeightWithTraitCollection:v10];
  double v12 = v11;

  double v13 = +[NSNumber numberWithDouble:v12 + 16.0];
  [v9 setProperty:v13 forKey:PSTableCellHeightKey];

  [v9 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  double v14 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_8E640();
  }

  return v9;
}

- (id)setUpBatteryGraphSpecifiers
{
  id v3 = +[NSMutableArray array];
  uint64_t v4 = [(BatteryUIController *)self setUpGraphGroupSpecifier];
  [v3 addObject:v4];
  id v5 = [(BatteryUIController *)self setUpToggleForUsageTimeSpecifier];
  if (v5) {
    [v3 addObject:v5];
  }
  if (+[PLModelingUtilities shouldShowBatteryGraphs])
  {
    double v6 = [(BatteryUIController *)self currentLastChargeDictionary];

    if (v6)
    {
      int v7 = [(BatteryUIController *)self setUpGraphLastChargeSpecifier];
      if (v7 && !self->_chargingStatusViewController) {
        [v3 addObject:v7];
      }
    }
    id v8 = [(BatteryUIController *)self batteryUsageGraphsSpecifier];
    [v3 addObject:v8];
  }
  unint64_t v9 = [(BatteryUIController *)self setUpUsageTimeValuesSpecifier];
  if (v9) {
    [v3 addObject:v9];
  }
  if (!self->_batteryBreakDownNotAvailable)
  {
    double v10 = [(BatteryUIController *)self setUpBatteryUsageHeaderSpecifier];
    if (v10) {
      [v3 addObject:v10];
    }
  }

  return v3;
}

- (id)setUpBatterySpecifersWithInsufficientData
{
  id v3 = +[NSMutableArray array];
  uint64_t v4 = [(BatteryUIController *)self _batteryGroupSpecifier];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:&stru_C3A18 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", @"NOTENOUGHINFO"), +[BatteryUIResourceClass containerPath], (double v6 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    int v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"NOTENOUGHINFO"];
    double v6 = BatteryUILocalization(v7);
  }
  [v5 setProperty:v6 forKey:@"PLBatteryUIGraphTextKey"];

  [v3 addObject:v4];
  [v3 addObject:v5];

  return v3;
}

- (id)setUpChargingStatusSpecifier
{
  id v3 = +[PSSpecifier preferenceSpecifierNamed:@"chargingStatusSpecifier" target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 setProperty:self->_chargingStatusViewController forKey:@"PLBatteryUIChargingStatusViewControllerKey"];
  [v3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  [v3 setProperty:&off_C9668 forKey:PSTableCellHeightKey];

  return v3;
}

- (id)setUpBatterySpecifiers
{
  id v3 = +[NSMutableArray array];
  uint64_t v4 = objc_opt_new();
  if ([(BatteryUIController *)self shouldDisplayBugSignatures])
  {
    id v5 = +[PSSpecifier groupSpecifierWithName:@"List of Energy Issues"];
    [v3 addObject:v5];

    if (self->_signatureEntries) {
      objc_msgSend(v3, "addObjectsFromArray:");
    }
  }
  if ([(BatteryUIController *)self batteryUIType] != 2)
  {
    double v6 = [(BatteryUIController *)self _suggestionEntries];

    if (v6)
    {
      uint64_t v7 = [(BatteryUIController *)self addSuggestionsToSpecifiers:v3];

      id v3 = (void *)v7;
    }
  }
  id v8 = [(BatteryUIController *)self setUpBatteryHealthGroup];
  if (v8) {
    [v3 addObjectsFromArray:v8];
  }
  batteryEntries = self->_batteryEntries;
  if (batteryEntries && [(NSMutableArray *)batteryEntries count])
  {
    BOOL v10 = 0;
LABEL_17:
    self->_batteryBreakDownNotAvailable = v10;
    [(BatteryUIController *)self determineBatteryBreakDownHeaderStringLength];
    double v14 = [(BatteryUIController *)self setUpBatteryGraphSpecifiers];
    if (v14) {
      [v3 addObjectsFromArray:v14];
    }
    if ([(BatteryUIController *)self batteryUIType])
    {
      double v15 = [(BatteryUIController *)self setUpInternalSpecifiers];
      [v3 addObjectsFromArray:v15];
    }
    [v3 addObjectsFromArray:self->_batteryEntries];
    if ([(BatteryUIController *)self batteryUIType] == 2
      || [(BatteryUIController *)self batteryUIType] == 1)
    {
      double v16 = [(BatteryUIController *)self setUpInternalAppSpecifiers];
      [v3 addObjectsFromArray:v16];
    }
    if (self->_isFirstTimeSettingUpBatterySpecifiers)
    {
      [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"data"];
      id v22 = v4;
      AnalyticsSendEventLazy();
    }
    self->_isFirstTimeSettingUpBatterySpecifiers = 0;
    goto LABEL_27;
  }
  double v11 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int tappedIndex = self->_tappedIndex;
    int batteryUIQueryRange = self->_batteryUIQueryRange;
    *(_DWORD *)buf = 67109376;
    int v25 = tappedIndex;
    __int16 v26 = 1024;
    int v27 = batteryUIQueryRange;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Battery breakdown not available, tappedIndex: %d, batteryUIQueryType: %d.", buf, 0xEu);
  }

  if (self->_tappedIndex != -1 || self->_batteryUIQueryRange)
  {
LABEL_16:
    BOOL v10 = 1;
    goto LABEL_17;
  }
  double v18 = [(BatteryUIController *)self currentDictionary];
  double v19 = [v18 objectForKeyedSubscript:@"PLBatteryUIQueryRangeWeekKey"];
  double v14 = [v19 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];

  if (v14 && [v14 count])
  {

    goto LABEL_16;
  }
  double v20 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Battery breakdown not available at all.", buf, 2u);
  }

  ADClientAddValueForScalarKey();
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:@"data"];
  id v23 = v4;
  AnalyticsSendEventLazy();
  double v21 = [(BatteryUIController *)self setUpBatterySpecifersWithInsufficientData];
  [v3 addObjectsFromArray:v21];

LABEL_27:

  return v3;
}

- (void)setBatterySaverMode:(id)a3 withSpecifier:(id)a4
{
  id v4 = a3;
  id v6 = +[_PMLowPowerMode sharedInstance];
  unsigned int v5 = [v4 intValue];

  [v6 setPowerMode:v5 != 0 fromSource:kPMLPMSourceSettings withCompletion:&stru_BF350];
}

- (BOOL)isBatterySaverModeEnabled
{
  unsigned int v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (id)getBatterySaverMode:(id)a3
{
  BOOL v3 = [(BatteryUIController *)self isBatterySaverModeEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (id)getBatteryPercentageMode:(id)a3
{
  BOOL v3 = [(BatteryUIController *)self readPreferenceValue:a3];
  id v4 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8E674();
  }

  unsigned int v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 BOOLValue]);

  return v5;
}

- (void)animateSwitchSpecifier:(id)a3 toState:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8E6E0();
  }

  uint64_t v7 = [v5 objectForKeyedSubscript:PSTableCellKey];
  id v8 = [v7 control];
  [v8 setOn:v4 animated:1];
}

- (id)getTappedTimeDurationStringForTappedIndex:(int)a3 isUpperCase:(BOOL)a4 isFooterString:(BOOL)a5
{
  if (a3 == -1)
  {
    double v11 = &stru_C3A18;
    goto LABEL_61;
  }
  BOOL v5 = a5;
  if (!self->_batteryUIQueryRange)
  {
    unint64_t v9 = (NSDate *)objc_alloc_init((Class)NSDateFormatter);
    double v12 = +[NSLocale currentLocale];
    [(NSDate *)v9 setLocale:v12];

    if (+[PLBatteryUIUtilities is24HourClock]) {
      CFStringRef v13 = @"H:mm";
    }
    else {
      CFStringRef v13 = @"ha";
    }
    [(NSDate *)v9 setLocalizedDateFormatFromTemplate:v13];
    double v14 = [(NSDate *)self->_endTime dateByAddingTimeInterval:(double)(23 - a3) * -3600.0];
    double v15 = [v14 dateByAddingTimeInterval:-3600.0];
    double v16 = [(NSDate *)v9 stringFromDate:v15];
    id v17 = [(NSDate *)v9 stringFromDate:v14];
    double v18 = [v16 stringByReplacingOccurrencesOfString:@" " withString:@" "];

    double v19 = [v17 stringByReplacingOccurrencesOfString:@" " withString:@" "];

    unsigned int v20 = +[BatteryUIResourceClass inDemoMode];
    if (v5)
    {
      if (!v20)
      {
        double v21 = @"USAGE_NOT_AVAILABLE_FOR_TIME_INTERVAL";
        goto LABEL_31;
      }
      +[BatteryUIResourceClass containerPath];
      double v21 = @"USAGE_NOT_AVAILABLE_FOR_TIME_INTERVAL";
    }
    else
    {
      if (!v20)
      {
        double v21 = @"DURATION_FORMAT";
        goto LABEL_31;
      }
      +[BatteryUIResourceClass containerPath];
      double v21 = @"DURATION_FORMAT";
    }
    __int16 v26 = (void *)_CFPreferencesCopyValueWithContainer();
    if (v26)
    {
LABEL_32:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v18, v19);
      BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_58;
    }
LABEL_31:
    __int16 v26 = BatteryUILocalization(v21);
    goto LABEL_32;
  }
  BOOL v8 = a4;
  if (a3 != 9)
  {
    int v22 = 9 - a3;
    unint64_t v9 = self->_endTime;
    double v14 = +[NSDate date];
    if (+[PLBatteryUIUtilities isDateMidnight:self->_endTime]
      && !+[PLBatteryUIUtilities isDateMidnight:v14])
    {
      id v23 = v14;

      unint64_t v9 = v23;
    }
    double v15 = [(NSDate *)v9 dateByAddingTimeInterval:(double)v22 * -86400.0];
    if (v5)
    {
      id v24 = +[NSCalendar currentCalendar];
      switch((unint64_t)[v24 component:512 fromDate:v15])
      {
        case 1uLL:
          if (+[BatteryUIResourceClass inDemoMode])
          {
            +[BatteryUIResourceClass containerPath];
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_SUNDAY";
            goto LABEL_46;
          }
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_SUNDAY";
          goto LABEL_55;
        case 2uLL:
          if (+[BatteryUIResourceClass inDemoMode])
          {
            +[BatteryUIResourceClass containerPath];
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_MONDAY";
            goto LABEL_46;
          }
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_MONDAY";
          goto LABEL_55;
        case 3uLL:
          if (+[BatteryUIResourceClass inDemoMode])
          {
            +[BatteryUIResourceClass containerPath];
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_TUESDAY";
            goto LABEL_46;
          }
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_TUESDAY";
          goto LABEL_55;
        case 4uLL:
          if (+[BatteryUIResourceClass inDemoMode])
          {
            +[BatteryUIResourceClass containerPath];
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_WEDNESDAY";
            goto LABEL_46;
          }
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_WEDNESDAY";
          goto LABEL_55;
        case 5uLL:
          if (+[BatteryUIResourceClass inDemoMode])
          {
            +[BatteryUIResourceClass containerPath];
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_THURSDAY";
            goto LABEL_46;
          }
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_THURSDAY";
          goto LABEL_55;
        case 6uLL:
          if (+[BatteryUIResourceClass inDemoMode])
          {
            +[BatteryUIResourceClass containerPath];
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_FRIDAY";
            goto LABEL_46;
          }
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_FRIDAY";
          goto LABEL_55;
        case 7uLL:
          if (!+[BatteryUIResourceClass inDemoMode])
          {
            int v25 = @"USAGE_NOT_AVAILABLE_FOR_SATURDAY";
LABEL_55:
            uint64_t v30 = BatteryUILocalization(v25);
            goto LABEL_56;
          }
          +[BatteryUIResourceClass containerPath];
          int v25 = @"USAGE_NOT_AVAILABLE_FOR_SATURDAY";
LABEL_46:
          uint64_t v30 = _CFPreferencesCopyValueWithContainer();
          if (!v30) {
            goto LABEL_55;
          }
LABEL_56:
          BOOL v10 = (__CFString *)v30;
          break;
        default:
          BOOL v10 = &stru_C3A18;
          break;
      }
    }
    else
    {
      id v24 = objc_alloc_init((Class)NSDateFormatter);
      int v27 = +[NSLocale currentLocale];
      [v24 setLocale:v27];

      [v24 setLocalizedDateFormatFromTemplate:@"EEEE"];
      id v28 = [v24 stringFromDate:v15];
      BOOL v10 = v28;
      if (v8)
      {
        uint64_t v29 = [(__CFString *)v28 localizedUppercaseString];

        BOOL v10 = (__CFString *)v29;
      }
    }

LABEL_58:
    goto LABEL_59;
  }
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (unint64_t v9 = (NSDate *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    BatteryUILocalization(@"TODAY");
    unint64_t v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  if (!v8) {
    goto LABEL_60;
  }
  BOOL v10 = [(NSDate *)v9 localizedUppercaseString];
LABEL_59:

  unint64_t v9 = (NSDate *)v10;
LABEL_60:
  double v11 = v9;
LABEL_61:

  return v11;
}

- (void)determineBatteryBreakDownHeaderStringLength
{
  self->_batteryBreakdownShortString = 0;
  id v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  +[UIFont smallSystemFontSize];
  BOOL v3 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  [v2 setFont:v3];

  [v2 setTextAlignment:1];
  BOOL v4 = +[UIButton buttonWithType:1];
  +[UIFont smallSystemFontSize];
  BOOL v5 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  id v41 = v4;
  id v6 = [v4 titleLabel];
  [v6 setFont:v5];

  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v7 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v7 = BatteryUILocalization(@"SHOW_BATTERY_USAGE");
  }
  id v8 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v45 = NSFontAttributeName;
  +[UIFont smallSystemFontSize];
  unint64_t v9 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  id v46 = v9;
  BOOL v10 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  id v11 = [v8 initWithString:v7 attributes:v10];

  [v41 setAttributedTitle:v11 forState:0];
  [v41 sizeToFit];
  [v41 frame];
  double v13 = v12;
  if (!+[BatteryUIResourceClass inDemoMode]
    || (+[BatteryUIResourceClass containerPath],
        (uint64_t v14 = _CFPreferencesCopyValueWithContainer()) == 0))
  {
    uint64_t v14 = BatteryUILocalization(@"SHOW_USAGE_TIME");
  }

  id v15 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v43 = NSFontAttributeName;
  +[UIFont smallSystemFontSize];
  double v16 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  double v44 = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  id v40 = (void *)v14;
  id v18 = [v15 initWithString:v14 attributes:v17];

  id v39 = v18;
  [v41 setAttributedTitle:v18 forState:0];
  [v41 sizeToFit];
  [v41 frame];
  if (v19 > v13)
  {
    [v41 frame];
    double v13 = v20;
  }
  uint64_t v21 = 0;
  int v22 = self;
  if (self->_batteryUIQueryRange) {
    int v23 = 10;
  }
  else {
    int v23 = 24;
  }
  double v24 = 0.0;
  int v25 = PLHighlightableSegmentableSlider;
  do
  {
    __int16 v26 = [(BatteryUIController *)v22 getTappedTimeDurationStringForTappedIndex:v21 isUpperCase:1 isFooterString:0];
    if (![&v25[40] inDemoMode]
      || ([&v25[40] containerPath], (int v27 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      int v27 = BatteryUILocalization(@"BATTERY_USAGE_BY_APP_WITH_TIME");
    }
    id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v26);

    [v2 setText:v28];
    [v2 sizeToFit];
    [v2 frame];
    if (v29 > v24)
    {
      [v2 frame];
      double v24 = v30;
    }
    if (![&v25[40] inDemoMode]
      || (+[BatteryUIResourceClass containerPath],
          (id v31 = (void *)_CFPreferencesCopyValueWithContainer()) == 0))
    {
      id v31 = BatteryUILocalization(@"USAGE_TIME_BY_APP_WITH_TIME");
    }
    double v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v26);

    [v2 setText:v32];
    [v2 sizeToFit];
    [v2 frame];
    if (v33 > v24)
    {
      [v2 frame];
      double v24 = v34;
    }

    uint64_t v21 = (v21 + 1);
    int v22 = self;
    int v25 = PLHighlightableSegmentableSlider;
  }
  while (v23 != v21);
  double v35 = v13 + v24 + 15.0 + 15.0;
  double v36 = [(BatteryUIController *)self view];
  [v36 frame];
  double v38 = v37;

  if (v35 > v38) {
    self->_batteryBreakdownShortString = 1;
  }
}

- (id)specifiers
{
  BOOL v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Creating the Specifiers for batteryUI", buf, 2u);
  }

  uint64_t v4 = OBJC_IVAR___PSListController__specifiers;
  BOOL v5 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v5)
  {
    id v6 = +[NSMutableArray array];
    if (self->_chargingStatusViewController)
    {
      uint64_t v7 = [(BatteryUIController *)self setUpChargingStatusSpecifier];
      [v6 addObject:v7];
    }
    id v8 = +[UIDevice currentDevice];
    unsigned int v9 = objc_msgSend(v8, "sf_inRetailKioskMode");

    if ((v9 & 1) != 0
      || (+[PLModelingUtilities isPercentageSupported](PLModelingUtilities, "isPercentageSupported") & 1) != 0|| +[PLModelingUtilities isLowPowerModeSupported])
    {
      BOOL v10 = +[PSSpecifier groupSpecifierWithID:0];
      [v6 addObject:v10];
      if ((v9 & 1) != 0
        || +[PLModelingUtilities isPercentageSupported])
      {
        id v11 = BatteryUILocalization(@"BATTERY_PERCENTAGE");
        double v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setPreferenceValue:specifier:" get:"getBatteryPercentageMode:" detail:0 cell:6 edit:0];

        [v12 setProperty:@"BATTERY_PERCENTAGE" forKey:PSIDKey];
        [v12 setIdentifier:@"BATTERY_PERCENTAGE_IDENTIFIER"];
        [v12 setProperty:@"com.apple.springboard" forKey:PSDefaultsKey];
        [v12 setProperty:@"SBShowBatteryPercentage" forKey:PSKeyNameKey];
        [v6 addObject:v12];
      }
      if (((+[PLModelingUtilities isLowPowerModeSupported] ^ 1 | v9) & 1) == 0)
      {
        double v13 = BatteryUILocalization(@"BATTERY_SAVER_MODE");
        uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"setBatterySaverMode:withSpecifier:" get:"getBatterySaverMode:" detail:0 cell:6 edit:0];

        [v14 setIdentifier:@"LOW_POWER_MODE_IDENTIFIER"];
        if (+[PLModelingUtilities isHeySiriAlwaysOn])
        {
          id v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"FOOTNOTE_BATTERYSAVERMODE_HEYSIRI"];
          BatteryUILocalizationHeySiri(v15);
        }
        else
        {
          id v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"FOOTNOTE_BATTERYSAVERMODE"];
          BatteryUILocalization(v15);
        double v16 = };
        [v10 setProperty:v16 forKey:PSFooterTextGroupKey];

        [v6 addObject:v14];
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    if (([(BatteryUIController *)self isEduMode] | v9))
    {
      id v17 = *(void **)&self->PSListController_opaque[v4];
      *(void *)&self->PSListController_opaque[v4] = v6;
      id v18 = v6;

      id v19 = *(id *)&self->PSListController_opaque[v4];
      goto LABEL_33;
    }
    if ([(BatteryUIController *)self batteryUIType] == 2
      || [(BatteryUIController *)self batteryUIType] == 1)
    {
      double v20 = +[PSSpecifier groupSpecifierWithName:@"Battery Level"];
      [v6 addObject:v20];

      uint64_t v21 = [(BatteryUIController *)self batteryGraphSpecifier];
      [v6 addObject:v21];
    }
    uint64_t v22 = [(BatteryUIController *)self currentDictionary];
    if (v22
      && (int v23 = (void *)v22,
          [(BatteryUIController *)self currentGraphDictionary],
          double v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v23,
          v24))
    {
      int v25 = [(BatteryUIController *)self setUpBatterySpecifiers];
      [v6 addObjectsFromArray:v25];
    }
    else
    {
      int v25 = [(BatteryUIController *)self setUpBatteryHealthGroup];
      if (v25) {
        [v6 addObjectsFromArray:v25];
      }
      __int16 v26 = [(BatteryUIController *)self setUpSpinnerSpecifiers];
      [v6 addObjectsFromArray:v26];

      [(BatteryUIController *)self queryForBatteryBreakdown];
    }

    int v27 = *(void **)&self->PSListController_opaque[v4];
    *(void *)&self->PSListController_opaque[v4] = v6;
    id v28 = v6;

    double v29 = +[BatteryUIResourceClass get_log_handle_bui];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v31 = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Specifiers created for batteryUI", v31, 2u);
    }

    BOOL v5 = *(void **)&self->PSListController_opaque[v4];
  }
  id v19 = v5;
LABEL_33:

  return v19;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v8 viewDidLoad];
  if (+[BatteryUsageRadarComposeViewController hasRadarCompose])
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v5 = +[UIImage imageNamed:@"radar.png" inBundle:v4];
    id v6 = [v3 initWithImage:v5 style:0 target:self action:"reportIssue"];
    uint64_t v7 = [(BatteryUIController *)self navigationItem];
    [v7 setRightBarButtonItem:v6];
  }
  [(BatteryUIController *)self logViewDidLoadEvents];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v10 viewDidAppear:a3];
  uint64_t v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Battery"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"BATTERY_TITLE" table:@"BatteryUI" locale:v6 bundleURL:v8];

  [(BatteryUIController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.battery" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v9 viewWillAppear:a3];
  +[PLBUIChartViewController reloadLocale];
  [(BatteryUIController *)self updateSuggestionsSpecifiers];
  if ([(BatteryUIController *)self clearGraph]) {
    [(BatteryUIController *)self setClearGraph:0];
  }
  uint64_t v4 = +[UIDevice currentDevice];
  [v4 beginGeneratingDeviceOrientationNotifications];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"deviceOrientationDidChange:" name:UIDeviceOrientationDidChangeNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_312CC, @"com.apple.powerlogd.refreshBUI", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_lowPowerModeChangedNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];

  objc_super v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"handleApplicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BatteryUIController;
  [(BatteryUIController *)&v6 viewWillDisappear:a3];
  uint64_t v4 = +[UIDevice currentDevice];
  [v4 endGeneratingDeviceOrientationNotifications];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.powerlogd.refreshBUI", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BatteryUIController;
  id v4 = a3;
  [(BatteryUIController *)&v8 traitCollectionDidChange:v4];
  id v5 = [(BatteryUIController *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    [(BatteryUIController *)self setTableCellHeights:0];
    [(BatteryUIController *)self setTableCellHeightEstimated:0];
  }
}

- (void)handleApplicationWillEnterForeground
{
  id v3 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(BatteryUIController *)self lastBatteryBreakdownQueryTime];
    int v16 = 138412290;
    double v17 = *(double *)&v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "lastBatteryBreakdownQueryTime=%@", (uint8_t *)&v16, 0xCu);
  }
  id v5 = [(BatteryUIController *)self lastBatteryBreakdownQueryTime];

  if (v5)
  {
    objc_super v6 = +[NSDate now];
    uint64_t v7 = [(BatteryUIController *)self lastBatteryBreakdownQueryTime];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    [(BatteryUIController *)self getRequeryTimeThreshold];
    double v11 = v10;
    BOOL v12 = v9 >= v10;
    double v13 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      double v17 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "requeryTimeThreshold=%f", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v14 = +[BatteryUIResourceClass get_log_handle_bui];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      double v17 = v9;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "timeIntervalSinceLastQuery=%f", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  id v15 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = 67109120;
    LODWORD(v17) = v12;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "sufficientTimeElapsed=%d", (uint8_t *)&v16, 8u);
  }

  if (v12) {
    [(BatteryUIController *)self reloadUI];
  }
}

- (double)getRequeryTimeThreshold
{
  id v2 = +[PLBatteryUIUtilities getDefaultValueForKey:@"kPLBUIRequeryThresholdKey"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 600.0;
  }

  return v5;
}

- (void)reportIssue
{
  id v3 = [BatteryUsageRadarComposeViewController alloc];
  double v4 = [(BatteryUIController *)self currentDictionary];
  double v5 = [(BatteryUsageRadarComposeViewController *)v3 initWithParentView:self andDictionary:v4];
  [(BatteryUIController *)self setRadarController:v5];

  id v6 = [(BatteryUIController *)self radarController];
  [v6 showRadarComposeAlert];
}

- (id)batteryGraphSpecifier
{
  batteryGraphSpecifier = self->_batteryGraphSpecifier;
  if (!batteryGraphSpecifier)
  {
    double v4 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    double v5 = self->_batteryGraphSpecifier;
    self->_batteryGraphSpecifier = v4;

    [(PSSpecifier *)self->_batteryGraphSpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
    id v6 = self->_batteryGraphSpecifier;
    uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[PSGraphViewTableCell graphHeight]);
    [(PSSpecifier *)v6 setProperty:v7 forKey:PSTableCellHeightKey];

    batteryGraphSpecifier = self->_batteryGraphSpecifier;
  }
  double v8 = [(BatteryUIController *)self batteryUIQueryRangeKey];
  [(PSSpecifier *)batteryGraphSpecifier setProperty:v8 forKey:@"DisplayRange"];

  double v9 = self->_batteryGraphSpecifier;

  return v9;
}

- (void)showInternalViewController
{
  double v4 = objc_alloc_init(BatteryUIGraphsViewController);
  id v3 = [(BatteryUIController *)self navigationController];
  [v3 pushViewController:v4 animated:0];
}

- (id)getChargeCycles:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_batteryUIQueryRange == 0;
  battArradouble y = self->_battArray;
  if (!battArray)
  {
    uint64_t v7 = +[BatteryUsageQueryModule sharedModule];
    [v7 setGraphNames:&off_CA758];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_31C00;
    v37[3] = &unk_BE620;
    v37[4] = self;
    [v7 populateBatteryModelsWithCompletion:v37];

    battArradouble y = self->_battArray;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v8 = battArray;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    double v12 = dbl_9B5C0[v5];
    uint64_t v13 = *(void *)v34;
    float v14 = 0.0;
    float v15 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v8);
        }
        double v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (v11)
        {
          id v18 = [v11 objectAtIndexedSubscript:0];
          id v19 = [v17 objectAtIndexedSubscript:0];
          [v18 timeIntervalSinceDate:v19];
          double v21 = v20;

          if (v21 <= v12)
          {
            uint64_t v22 = [v17 objectAtIndexedSubscript:1];
            [v22 floatValue];
            float v24 = v23 - v14;

            if (v24 <= 0.0) {
              float v25 = -0.0;
            }
            else {
              float v25 = v24;
            }
            float v15 = v15 + v25;
            __int16 v26 = [v17 objectAtIndexedSubscript:1];
            [v26 floatValue];
            float v14 = v27;
          }
        }
        else
        {
          id v28 = [*(id *)(*((void *)&v33 + 1) + 8 * i) objectAtIndexedSubscript:1];
          [v28 floatValue];
          float v14 = v29;

          id v11 = v17;
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);

    if (v15 > 1.0)
    {
      +[NSString stringWithFormat:@"%.00f%% of Battery", v15];
      goto LABEL_21;
    }
  }
  else
  {

    id v11 = 0;
  }
  +[NSString stringWithFormat:@"-- %% of Battery", v32];
  double v30 = LABEL_21:;

  return v30;
}

- (id)getActiveTime:(id)a3
{
  id v4 = [(BatteryUIController *)self currentDictionary];
  BOOL v5 = [(BatteryUIController *)self batteryUIQueryRangeKey];
  id v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIForegroundTimeKey"];

  double v8 = [(BatteryUIController *)self formatUsageStringInMin:v7];

  return v8;
}

- (id)getBackgroundActiveTime:(id)a3
{
  id v4 = [(BatteryUIController *)self currentDictionary];
  BOOL v5 = [(BatteryUIController *)self batteryUIQueryRangeKey];
  id v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"PLBatteryUIBackgroundTimeKey"];

  double v8 = [(BatteryUIController *)self formatUsageStringInMin:v7];

  return v8;
}

- (id)setUpInternalSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:@"Total Drain" target:self set:0 get:"getChargeCycles:" detail:0 cell:4 edit:0];
  [v3 addObject:v4];

  BOOL v5 = +[PSSpecifier preferenceSpecifierNamed:@"Active Usage" target:self set:0 get:"getActiveTime:" detail:0 cell:4 edit:0];
  [v3 addObject:v5];

  id v6 = +[PSSpecifier preferenceSpecifierNamed:@"Background Usage" target:self set:0 get:"getBackgroundActiveTime:" detail:0 cell:4 edit:0];
  [v3 addObject:v6];

  return v3;
}

- (id)setUpUsageSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:@"Screen On Usage" target:self set:0 get:"getActiveTime:" detail:0 cell:4 edit:0];
  [v3 addObject:v4];

  return v3;
}

- (id)setUpInternalAppSpecifiers
{
  id v3 = +[NSMutableArray array];
  unsigned int v4 = [(BatteryUIController *)self showRootNodesInInternal];
  unsigned int v5 = [(BatteryUIController *)self batteryUIQueryType];
  if (v4)
  {
    if (v5 == 2)
    {
      CFStringRef v6 = @"Show Everything";
      goto LABEL_9;
    }
    BOOL v7 = [(BatteryUIController *)self batteryUIQueryType] == 3;
  }
  else
  {
    BOOL v7 = v5 == 2;
  }
  if (v7) {
    CFStringRef v6 = @"Hide Daemons";
  }
  else {
    CFStringRef v6 = @"Show Daemons";
  }
LABEL_9:
  double v8 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v8 setButtonAction:"reloadOtherTypeUI:"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:@"Save For Demo" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v9 setButtonAction:"getDemoName:"];
  id v10 = +[PSSpecifier groupSpecifierWithName:0];
  [v3 addObject:v10];
  [v3 addObject:v8];
  if ([(BatteryUIController *)self showSaveDemoButtonInInternal]) {
    [v3 addObject:v9];
  }

  return v3;
}

- (void)reloadUI
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

  [(BatteryUIController *)self setCurrentDictionary:0];
  [(BatteryUIController *)self setCurrentGraphDictionary:0];
  [(BatteryUIController *)self setCurrentLastChargeDictionary:0];
  [(BatteryUIController *)self setCurrentPausedChargingDictionary:0];
  batteryGraphSpecifier = self->_batteryGraphSpecifier;
  self->_batteryGraphSpecifier = 0;

  [(BatteryUIController *)self reloadSpecifiers];
}

- (void)reloadOtherTypeUI:(id)a3
{
  id v12 = a3;
  unsigned int v4 = [(BatteryUIController *)self showRootNodesInInternal];
  unsigned int v5 = [v12 name];
  unsigned int v6 = [v5 isEqualToString:@"Show Daemons"];

  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = 2;
      goto LABEL_9;
    }
    id v10 = [v12 name];
    unsigned int v11 = [v10 isEqualToString:@"Show Everything"];

    BOOL v8 = v11 == 0;
    unsigned int v9 = 3;
  }
  else
  {
    BOOL v8 = v6 == 0;
    unsigned int v9 = 2;
  }
  if (v8) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v9;
  }
LABEL_9:
  [(BatteryUIController *)self setBatteryUIQueryType:v7];
  [(BatteryUIController *)self setBUI_MODE:[(BatteryUIController *)self batteryUIQueryType]];
  [(BatteryUIController *)self reloadUI];
}

- (void)setBUI_MODE:(int)a3
{
  +[BatteryUIResourceClass containerPath];
  _CFPreferencesSetValueWithContainer();
  id v3 = +[BatteryUIResourceClass containerPath];

  __CFPreferencesAppSynchronizeWithContainer(@"com.apple.powerlogd", v3);
}

- (BOOL)showRootNodesInInternal
{
  if (qword_D7398 != -1) {
    dispatch_once(&qword_D7398, &stru_BF370);
  }
  id v2 = (void *)qword_D73A0;
  if (qword_D73A0)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (BOOL)showSaveDemoButtonInInternal
{
  if (qword_D73A8 != -1) {
    dispatch_once(&qword_D73A8, &stru_BF390);
  }
  id v2 = (void *)qword_D73B0;
  if (qword_D73B0)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (int)BUI_MODE
{
  +[BatteryUIResourceClass containerPath];
  id v3 = (void *)_CFPreferencesCopyValueWithContainer();
  unsigned int v4 = v3;
  if (v3) {
    -[BatteryUIController setBatteryUIQueryType:](self, "setBatteryUIQueryType:", [v3 intValue]);
  }
  int v5 = [(BatteryUIController *)self batteryUIQueryType];

  return v5;
}

- (BOOL)shouldAutoCycle
{
  +[BatteryUIResourceClass containerPath];
  id v2 = (void *)_CFPreferencesCopyValueWithContainer();
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isInBUIDemoMode
{
  if (qword_D73B8 != -1) {
    dispatch_once(&qword_D73B8, &stru_BF3B0);
  }
  return qword_D73C0 != 0;
}

- (BOOL)shouldDisplayBugSignatures
{
  if (qword_D73C8 != -1) {
    dispatch_once(&qword_D73C8, &stru_BF3D0);
  }
  return qword_D73D0 != 0;
}

- (void)cycleNext:(id)a3
{
  self->_iconDisplayType = (self->_iconDisplayType & 1) == 0;
  [(BatteryUIController *)self rebuildList];
}

- (void)didTappedBar:(id)a3
{
  id v4 = [a3 intValue];
  int v5 = +[BatteryUIResourceClass get_log_handle_bui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v31 = (int)v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "=============> Tapped event with i: %d", buf, 8u);
  }

  if (v4 == -1)
  {
    int v7 = 0;
  }
  else
  {
    unsigned int v6 = [(BatteryUIController *)self currentDictionary];
    int v7 = +[PLBatteryUIUtilities getNumOfBreakdownEntriesAtTapIndex:v4 fromBreakdownData:v6 queryRange:self->_batteryUIQueryRange];

    BOOL v8 = [(BatteryUIController *)self currentGraphDictionary];
    unsigned int v9 = +[PLBatteryUIUtilities getScreenOnOffSecsAtTapIndex:v4 fromGraphData:v8 queryRange:self->_batteryUIQueryRange];

    id v10 = [v9 objectAtIndexedSubscript:0];
    [v10 doubleValue];
    double v12 = v11;

    uint64_t v13 = [v9 objectAtIndexedSubscript:1];
    [v13 doubleValue];
    double v15 = v14;

    int v16 = [(BatteryUIController *)self currentGraphDictionary];
    unsigned int v17 = +[PLBatteryUIUtilities hasBatteryLevelDataAtTapIndex:v4 fromGraphData:v16 queryRange:self->_batteryUIQueryRange];

    unsigned int v18 = +[PLBatteryUIUtilities isTappedIntervalCurrentBucket:v4 withQueryRange:self->_batteryUIQueryRange andEndTime:self->_endTime];
    BOOL v20 = v12 > 0.0 || v7 > 0;
    if (v15 > 0.0) {
      BOOL v20 = 1;
    }
    if (!(v20 | v17 | v18)) {
      LODWORD(v4) = -1;
    }
  }
  int tappedIndex = self->_tappedIndex;
  if (tappedIndex != -1 || v4 != -1)
  {
    if (tappedIndex == v4) {
      int v23 = -1;
    }
    else {
      int v23 = (int)v4;
    }
    self->_int tappedIndex = v23;
    ADClientAddValueForScalarKey();
    float v24 = objc_opt_new();
    float v25 = v24;
    if (self->_tappedIndex != -1)
    {
      if (v7 <= 0) {
        __int16 v26 = &__kCFBooleanFalse;
      }
      else {
        __int16 v26 = &__kCFBooleanTrue;
      }
      [v24 setObject:v26 forKeyedSubscript:@"data"];
    }
    if (self->_batteryUIQueryRange) {
      CFStringRef v27 = @"xDay";
    }
    else {
      CFStringRef v27 = @"24hr";
    }
    [v25 setObject:v27 forKeyedSubscript:@"duration"];
    float v29 = v25;
    id v28 = v25;
    AnalyticsSendEventLazy();
    [(BatteryUIController *)self rebuildList];
  }
}

- (void)didPushButton:(id)a3
{
  self->_buttonPressed = 1;
  [(BatteryUIController *)self stopRepeatingTimer];
  self->_iconDisplayType = (self->_iconDisplayType & 1) == 0;
  ADClientAddValueForScalarKey();
  id v4 = objc_opt_new();
  [v4 setObject:@"breakdown" forKeyedSubscript:@"button"];
  unsigned int v6 = v4;
  id v5 = v4;
  AnalyticsSendEventLazy();
  [(BatteryUIController *)self rebuildList];
}

- (void)didPushBatteryButton:(id)a3
{
  self->_iconDisplayType = (self->_iconDisplayType & 1) == 0;
  ADClientAddValueForScalarKey();
  id v4 = objc_opt_new();
  [v4 setObject:@"toggleButton" forKeyedSubscript:@"button"];
  unsigned int v6 = v4;
  id v5 = v4;
  AnalyticsSendEventLazy();
  [(BatteryUIController *)self rebuildList];
}

- (void)didPushScreenOnButton:(id)a3
{
  self->_iconDisplayType = 1;
  [(BatteryUIController *)self rebuildList];
}

- (void)startRepeatingTimer
{
  [(NSTimer *)self->_repeatingTimer invalidate];
  self->_repeatingTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"cycleNext:" selector:0 userInfo:1 repeats:7.0];

  _objc_release_x1();
}

- (void)stopRepeatingTimer
{
  [(NSTimer *)self->_repeatingTimer invalidate];
  repeatingTimer = self->_repeatingTimer;
  self->_repeatingTimer = 0;
}

- (void)update:(id)a3
{
  self->_iconDisplayType = (self->_iconDisplayType & 1) == 0;
  [(BatteryUIController *)self rebuildList];
}

- (BOOL)isEduMode
{
  if (qword_D73E0 != -1) {
    dispatch_once(&qword_D73E0, &stru_BF3F0);
  }
  return byte_D73D8;
}

- (void)logToPowerlogRbattx
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlogd.Rbattx", 0, 0, 4u);
}

- (void)logToPowerlogRbattx0
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlogd.Rbattx0", 0, 0, 4u);
}

- (void)logToPowerlogRbattxy
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.powerlogd.Rbattxy", 0, 0, 4u);
}

- (void)handleBiomeDonationForBUIVisit
{
  id v4 = +[BMStreams discoverabilitySignal];
  id v2 = [v4 source];
  id v3 = [objc_alloc((Class)BMDiscoverabilitySignalEvent) initWithIdentifier:@"com.apple.batteryui.visit" bundleID:@"com.apple.batteryui" context:0];
  [v2 sendEvent:v3];
}

- (void)logViewDidLoadEvents
{
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  notify_post((const char *)[@"com.apple.powerlogd.logBatteryUIVisit" UTF8String]);

  [(BatteryUIController *)self handleBiomeDonationForBUIVisit];
}

- (PSSpecifier)suggestionHeaderSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSuggestionHeaderSpecifier:(id)a3
{
}

- (NSMutableDictionary)currentDictionary
{
  return self->_currentDictionary;
}

- (void)setCurrentDictionary:(id)a3
{
}

- (NSMutableDictionary)currentGraphDictionary
{
  return self->_currentGraphDictionary;
}

- (void)setCurrentGraphDictionary:(id)a3
{
}

- (NSDictionary)currentLastChargeDictionary
{
  return self->_currentLastChargeDictionary;
}

- (void)setCurrentLastChargeDictionary:(id)a3
{
}

- (NSDictionary)currentPausedChargingDictionary
{
  return self->_currentPausedChargingDictionary;
}

- (void)setCurrentPausedChargingDictionary:(id)a3
{
}

- (void)setActivityIndicator:(id)a3
{
}

- (int)batteryUIQueryType
{
  return self->_batteryUIQueryType;
}

- (void)setBatteryUIQueryType:(int)a3
{
  self->_batteryUIQueryType = a3;
}

- (int)batteryUIType
{
  return self->_batteryUIType;
}

- (void)setBatteryUIType:(int)a3
{
  self->_batteryUIType = a3;
}

- (NSMutableDictionary)tableCellHeights
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 440, 1);
}

- (void)setTableCellHeights:(id)a3
{
}

- (NSMutableDictionary)tableCellHeightEstimated
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTableCellHeightEstimated:(id)a3
{
}

- (BatteryUsageRadarComposeViewController)radarController
{
  return self->_radarController;
}

- (void)setRadarController:(id)a3
{
}

- (BOOL)waitingForResponse
{
  return self->_waitingForResponse;
}

- (void)setWaitingForResponse:(BOOL)a3
{
  self->_waitingForResponse = a3;
}

- (BOOL)clearGraph
{
  return self->_clearGraph;
}

- (void)setClearGraph:(BOOL)a3
{
  self->_clearGraph = a3;
}

- (int)batteryUIDeviceOrientation
{
  return self->_batteryUIDeviceOrientation;
}

- (void)setBatteryUIDeviceOrientation:(int)a3
{
  self->_batteryUIDeviceOrientation = a3;
}

- (PLBatteryUIBackendModel)backend
{
  return (PLBatteryUIBackendModel *)objc_getProperty(self, a2, 464, 1);
}

- (void)setBackend:(id)a3
{
}

- (PowerUISmartChargeClient)chargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 472, 1);
}

- (void)setChargingClient:(id)a3
{
}

- (unint64_t)curChargingMode
{
  return self->_curChargingMode;
}

- (void)setCurChargingMode:(unint64_t)a3
{
  self->_curChargingMode = a3;
}

- (UIViewController)chargingStatusViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 488, 1);
}

- (void)setChargingStatusViewController:(id)a3
{
}

- (NSDate)lastBatteryBreakdownQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 496, 1);
}

- (void)setLastBatteryBreakdownQueryTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBatteryBreakdownQueryTime, 0);
  objc_storeStrong((id *)&self->_chargingStatusViewController, 0);
  objc_storeStrong((id *)&self->_chargingClient, 0);
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_radarController, 0);
  objc_storeStrong((id *)&self->_tableCellHeightEstimated, 0);
  objc_storeStrong((id *)&self->_tableCellHeights, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_currentPausedChargingDictionary, 0);
  objc_storeStrong((id *)&self->_currentLastChargeDictionary, 0);
  objc_storeStrong((id *)&self->_currentGraphDictionary, 0);
  objc_storeStrong((id *)&self->_currentDictionary, 0);
  objc_storeStrong((id *)&self->_suggestionHeaderSpecifier, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_battArray, 0);
  objc_storeStrong((id *)&self->_repeatingTimer, 0);
  objc_storeStrong((id *)&self->_batteryGraphSpecifier, 0);
  objc_storeStrong((id *)&self->_batteryEntries, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_spinnerGroup, 0);
  objc_storeStrong((id *)&self->_batteryGroup, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_signatureGroup, 0);
  objc_storeStrong((id *)&self->_suggestionGroup, 0);
  objc_storeStrong((id *)&self->_signatureEntries, 0);

  objc_storeStrong((id *)&self->_suggestionEntries, 0);
}

- (BOOL)inDemoMode
{
  id v2 = [(BatteryUIController *)self specifier];
  id v3 = [v2 propertyForKey:@"manualFIle"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)getDemoName:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)UIAlertView), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", @"Demo File", @"It can take up to a minute to generate a new Demo. Please enter a name for this Demo if you would like to continue:", self, @"Cancel", @"OK", 0);
  [v4 setAlertViewStyle:2];
  id v3 = [v4 textFieldAtIndex:0];
  [v3 setPlaceholder:@"Default"];
  [v4 show];
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  id v9 = a3;
  unsigned int v6 = (char *)[v9 alertViewStyle];
  if (a4 == 1 && v6 == (unsigned char *)&dword_0 + 2)
  {
    int v7 = [v9 textFieldAtIndex:0];
    BOOL v8 = [v7 text];
    [(BatteryUIController *)self savePList:v8];
  }
}

- (void)savePList:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  char v18 = 0;
  if (([v5 fileExistsAtPath:@"Library/Logs/BatteryUIDemos" isDirectory:&v18] & 1) == 0)
  {
    id v17 = 0;
    unsigned __int8 v7 = [v5 createDirectoryAtPath:@"Library/Logs/BatteryUIDemos" withIntermediateDirectories:1 attributes:0 error:&v17];
    id v8 = v17;
    unsigned int v6 = v8;
    if (v7) {
      goto LABEL_5;
    }
    NSLog(@"Can't create Directory %@: %@", @"Library/Logs/BatteryUIDemos", v8);

LABEL_8:
    id v12 = [objc_alloc((Class)UIAlertView) initWithTitle:0 message:@"Failed to create directory..." delegate:0 cancelButtonTitle:@"OK" otherButtonTitles:0];
    [v12 show];
    goto LABEL_9;
  }
  if (!v18)
  {
    NSLog(@"%@ is not a directory", @"Library/Logs/BatteryUIDemos");
    goto LABEL_8;
  }
  unsigned int v6 = 0;
LABEL_5:

  id v9 = [(BatteryUIController *)self view];
  id v10 = [(BatteryUIController *)self activityIndicator];
  [v9 addSubview:v10];

  double v11 = [(BatteryUIController *)self activityIndicator];
  [v11 startAnimating];

  id v12 = +[BatteryUsageQueryModule sharedModule];
  [v12 setType:2];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_3A630;
  v13[3] = &unk_BF690;
  int v16 = 2;
  id v14 = v4;
  double v15 = self;
  [v12 populateBatteryUsageWithCompletion:v13];

LABEL_9:
}

@end