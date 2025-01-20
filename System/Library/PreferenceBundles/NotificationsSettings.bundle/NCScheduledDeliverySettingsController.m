@interface NCScheduledDeliverySettingsController
- (BOOL)hasLoadedSortOrderByNumberOfNotifications;
- (BOOL)isGlobalScheduledDeliveryEnabled;
- (BOOL)isOrderedByNumberOfNotifications;
- (BOOL)isPopulatingDigestTimeSpecifiers;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NCScheduledDeliverySettingsController)init;
- (NCScheduledDeliverySettingsControllerDelegate)delegate;
- (NSArray)rankedDigestSetupResponses;
- (NSMapTable)datePickersToSpecifiersMapTable;
- (NSMutableArray)orderedDigestTimeSpecifiers;
- (NSMutableArray)orderedScheduledDeliveryTimes;
- (id)_activeSectionInfos;
- (id)_alphabeticallyOrderedSectionInfos:(id)a3;
- (id)_appListSpecifiersForGroupSpecifier:(id)a3;
- (id)_appSelectionListSpecifiers;
- (id)_digestTimeSpecifierAtIndex:(unint64_t)a3 forScheduleTime:(id)a4;
- (id)_frequencyOrderedSectionInfos:(id)a3 forRankedDigestSetupResponses:(id)a4;
- (id)_globalScheduledDeliveryTimes;
- (id)_orderedGlobalScheduledDeliveryTimes;
- (id)_scheduleDeliveryTimesSpecifiers;
- (id)_scheduleTimeLabelForIndex:(unint64_t)a3;
- (id)_scheduledDeliverySwitchSpecifiers;
- (id)_showNextSummarySwitchSpecifiers;
- (id)_specifierForAddNewScheduledTime;
- (id)_updatesForSpecifiers:(id)a3 withGlobalScheduledDeliverySetting:(int64_t)a4 animated:(BOOL)a5;
- (id)appScheduledDeliveryEnabled:(id)a3;
- (id)datePickerForSpecifier:(id)a3;
- (id)globalScheduledDeliverySetting:(id)a3;
- (id)globalShowNextSummarySetting:(id)a3;
- (id)orderType:(id)a3;
- (id)specifiers;
- (int64_t)_compareScheduleTime:(id)a3 withScheduleTime:(id)a4;
- (int64_t)_globalScheduledDeliverySetting;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (unint64_t)_numberOfNotificationsForSectionIdentifier:(id)a3;
- (unint64_t)_sectionForScheduleTimes;
- (unint64_t)maximumAverageNumberOfNotifications;
- (unint64_t)numberOfDaysForNotificationCount;
- (void)_addDefaultScheduledDeliveryTimes;
- (void)_addNewScheduledTime;
- (void)_loadSortingOrderByNotificationsReceivedIfNecessary;
- (void)_populateDigestTimeSpecifiers;
- (void)_removeScheduledTimeAtIndexPath:(id)a3;
- (void)_replaceScheduleDigestTime:(id)a3 withNewDigestTime:(id)a4;
- (void)_setGlobalScheduledDeliveryEnabled:(BOOL)a3;
- (void)_setGlobalScheduledDeliveryTimes:(id)a3;
- (void)datePickerChanged:(id)a3;
- (void)digestOnboardingNavigationController:(id)a3 didScheduleDigestDeliveryTimes:(id)a4 forAppBundleIdentifiers:(id)a5;
- (void)setAppScheduledDeliveryEnabled:(id)a3 specifier:(id)a4;
- (void)setDatePickersToSpecifiersMapTable:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGlobalScheduledDeliveryEnabled:(BOOL)a3;
- (void)setGlobalScheduledDeliverySetting:(id)a3 specifier:(id)a4;
- (void)setGlobalShowNextSummarySetting:(id)a3 specifier:(id)a4;
- (void)setLoadedSortOrderByNumberOfNotifications:(BOOL)a3;
- (void)setMaximumAverageNumberOfNotifications:(unint64_t)a3;
- (void)setNumberOfDaysForNotificationCount:(unint64_t)a3;
- (void)setOrderType:(id)a3 specifier:(id)a4;
- (void)setOrderedByNumberOfNotifications:(BOOL)a3;
- (void)setOrderedDigestTimeSpecifiers:(id)a3;
- (void)setOrderedScheduledDeliveryTimes:(id)a3;
- (void)setPopulatingDigestTimeSpecifiers:(BOOL)a3;
- (void)setRankedDigestSetupResponses:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation NCScheduledDeliverySettingsController

- (NCScheduledDeliverySettingsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCScheduledDeliverySettingsController;
  v2 = [(NCScheduledDeliverySettingsController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_orderedByNumberOfNotifications = 1;
    v2->_loadedSortOrderByNumberOfNotifications = 0;
    v2->_numberOfDaysForNotificationCount = 1;
    [(NCScheduledDeliverySettingsController *)v2 _loadSortingOrderByNotificationsReceivedIfNecessary];
  }
  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NCScheduledDeliverySettingsController;
  [(NCScheduledDeliverySettingsController *)&v4 viewDidLoad];
  uint64_t v3 = OBJC_IVAR___PSListController__table;
  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] setEditing:1 animated:0];
  [*(id *)&self->PSListController_opaque[v3] setAllowsSelectionDuringEditing:1];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(NCScheduledDeliverySettingsController *)self _orderedGlobalScheduledDeliveryTimes];
    v6 = +[NSMutableArray arrayWithArray:v5];
    orderedScheduledDeliveryTimes = self->_orderedScheduledDeliveryTimes;
    self->_orderedScheduledDeliveryTimes = v6;

    id v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = [(NCScheduledDeliverySettingsController *)self _scheduledDeliverySwitchSpecifiers];
    [v8 addObjectsFromArray:v9];

    int64_t v10 = [(NCScheduledDeliverySettingsController *)self _globalScheduledDeliverySetting];
    self->_globalScheduledDeliveryEnabled = v10 == 2;
    v11 = [(NCScheduledDeliverySettingsController *)self _updatesForSpecifiers:v8 withGlobalScheduledDeliverySetting:v10 animated:0];
    v12 = [v11 currentSpecifiers];
    [v8 setArray:v12];

    v13 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v8;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_updatesForSpecifiers:(id)a3 withGlobalScheduledDeliverySetting:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = +[PSSpecifierUpdates updatesWithSpecifiers:v8];
  if (a4 == 2)
  {
    if (![(NSMutableArray *)self->_orderedScheduledDeliveryTimes count]) {
      [(NCScheduledDeliverySettingsController *)self _addDefaultScheduledDeliveryTimes];
    }
    id v10 = objc_alloc_init((Class)NSMutableArray);
    v11 = [(NCScheduledDeliverySettingsController *)self _scheduleDeliveryTimesSpecifiers];
    [v10 addObjectsFromArray:v11];

    v12 = [(NCScheduledDeliverySettingsController *)self _showNextSummarySwitchSpecifiers];
    [v10 addObjectsFromArray:v12];

    v13 = [(NCScheduledDeliverySettingsController *)self _appSelectionListSpecifiers];
    [v10 addObjectsFromArray:v13];

    objc_msgSend(v9, "insertContiguousSpecifiers:atIndex:", v10, objc_msgSend(v8, "count"));
  }
  else
  {
    v14 = [v8 indexOfSpecifierWithID:@"SCHEDULE_DELIVERY_TIMES_GROUP_ID"];
    if (v14 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v9, "removeSpecifiersInRange:", v14, (unsigned char *)objc_msgSend(v8, "count") - v14);
    }
  }
  v15 = [v9 context];
  [v15 setAnimated:v5];

  return v9;
}

- (id)_scheduledDeliverySwitchSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = +[PSSpecifier groupSpecifierWithID:@"SCHEDULED_DELIVERY_SWITCH_GROUP_ID"];
  [v3 addObject:v4];
  BOOL v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v6 = [v5 localizedStringForKey:@"SCHEDULED_DELIVERY" value:&stru_419A0 table:@"NotificationsSettings"];
  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setGlobalScheduledDeliverySetting:specifier:" get:"globalScheduledDeliverySetting:" detail:0 cell:6 edit:0];

  [v7 setIdentifier:@"SCHEDULED_DELIVERY_SWITCH_ID"];
  [v3 addObject:v7];

  return v3;
}

- (id)_scheduleDeliveryTimesSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  BOOL v5 = [v4 localizedStringForKey:@"SCHEDULED_DELIVERY_SCHEDULE" value:&stru_419A0 table:@"NotificationsSettings"];
  v6 = +[PSSpecifier groupSpecifierWithName:v5];

  [v6 setIdentifier:@"SCHEDULE_DELIVERY_TIMES_GROUP_ID"];
  [v3 addObject:v6];
  v7 = [(NCScheduledDeliverySettingsController *)self orderedDigestTimeSpecifiers];
  if (v7)
  {
    [v3 addObjectsFromArray:v7];
    if ((unint64_t)[v7 count] > 0xB) {
      goto LABEL_6;
    }
    id v8 = [(NCScheduledDeliverySettingsController *)self _specifierForAddNewScheduledTime];
    [v3 addObject:v8];
  }
  else
  {
    id v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    [v8 setIdentifier:@"SCHEDULE_DELIVERY_TIMES_LOAD_SPINNER_ID"];
    [v3 addObject:v8];
    [(NCScheduledDeliverySettingsController *)self _populateDigestTimeSpecifiers];
  }

LABEL_6:

  return v3;
}

- (id)_showNextSummarySwitchSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = +[PSSpecifier groupSpecifierWithID:@"NEXT_SUMMARY_SWITCH_GROUP_ID"];
  BOOL v5 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v6 = [v5 localizedStringForKey:@"SCHEDULED_DELIVERY_SHOW_NEXT_SUMMARY_FOOTER" value:&stru_419A0 table:@"NotificationsSettings"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v8 = [v7 localizedStringForKey:@"SCHEDULED_DELIVERY_SHOW_NEXT_SUMMARY" value:&stru_419A0 table:@"NotificationsSettings"];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setGlobalShowNextSummarySetting:specifier:" get:"globalShowNextSummarySetting:" detail:0 cell:6 edit:0];

  [v9 setIdentifier:@"SHOW_NEXT_SUMMARY_SWITCH_ID"];
  [v3 addObject:v9];

  return v3;
}

- (id)_appSelectionListSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  BOOL v5 = [v4 localizedStringForKey:@"SCHEDULED_DELIVERY_APPS_IN_SUMMARY" value:&stru_419A0 table:@"NotificationsSettings"];
  v6 = +[PSSpecifier groupSpecifierWithName:v5];

  [v3 addObject:v6];
  v7 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setOrderType:specifier:" get:"orderType:" detail:0 cell:9 edit:0];
  id v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v9 = [v8 localizedStringForKey:@"SCHEDULED_DELIVERY_SORT_WEEKLY_AVG" value:&stru_419A0 table:@"NotificationsSettings"];
  v15[0] = v9;
  id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v11 = [v10 localizedStringForKey:@"SCHEDULED_DELIVERY_SORT_ALPHABETICAL" value:&stru_419A0 table:@"NotificationsSettings"];
  v15[1] = v11;
  v12 = +[NSArray arrayWithObjects:v15 count:2];

  [v7 setValues:&off_447D8 titles:v12];
  [v3 addObject:v7];
  v13 = [(NCScheduledDeliverySettingsController *)self _appListSpecifiersForGroupSpecifier:v6];
  [v3 addObjectsFromArray:v13];

  return v3;
}

- (id)_appListSpecifiersForGroupSpecifier:(id)a3
{
  id v4 = a3;
  id v37 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = [(NCScheduledDeliverySettingsController *)self _activeSectionInfos];
  uint64_t v6 = [(NCScheduledDeliverySettingsController *)self rankedDigestSetupResponses];
  v38 = self;
  v32 = (void *)v5;
  v33 = v4;
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(NCScheduledDeliverySettingsController *)self rankedDigestSetupResponses];
    if ([v8 count]) {
      BOOL v9 = [(NCScheduledDeliverySettingsController *)self maximumAverageNumberOfNotifications] != 0;
    }
    else {
      BOOL v9 = 0;
    }

    if ([(NCScheduledDeliverySettingsController *)self isOrderedByNumberOfNotifications])
    {
      if (v9)
      {
        id v10 = [(NCScheduledDeliverySettingsController *)self rankedDigestSetupResponses];
        v11 = [(NCScheduledDeliverySettingsController *)self _frequencyOrderedSectionInfos:v5 forRankedDigestSetupResponses:v10];

        BOOL v9 = 1;
        goto LABEL_15;
      }
      goto LABEL_11;
    }
LABEL_10:
    v11 = [(NCScheduledDeliverySettingsController *)self _alphabeticallyOrderedSectionInfos:v5];
    goto LABEL_15;
  }
  if (![(NCScheduledDeliverySettingsController *)self isOrderedByNumberOfNotifications])
  {
    BOOL v9 = 0;
    goto LABEL_10;
  }
LABEL_11:
  if ([(NCScheduledDeliverySettingsController *)self hasLoadedSortOrderByNumberOfNotifications])
  {
    v12 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v13 = [v12 localizedStringForKey:@"SCHEDULED_DELIVERY_NO_DATA" value:&stru_419A0 table:@"NotificationsSettings"];
    [v4 setProperty:v13 forKey:PSFooterTextGroupKey];

    [v4 setProperty:&off_44598 forKey:PSFooterAlignmentGroupKey];
  }
  else
  {
    v14 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0, v5, v4);
    [v37 addObject:v14];
  }
  BOOL v9 = 0;
  v11 = 0;
LABEL_15:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v40;
    uint64_t v18 = PSLazyIconLoading;
    uint64_t v19 = PSLazyIconAppID;
    uint64_t v20 = PSIconImageKey;
    uint64_t v34 = PSCellClassKey;
    uint64_t v35 = PSIconImageKey;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v23 = BBSettingsDisplayNameForBBSection(v22);
        v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:v38 set:"setAppScheduledDeliveryEnabled:specifier:" get:"appScheduledDeliveryEnabled:" detail:0 cell:6 edit:0];

        [v24 setIdentifier:@"APP_SPECIFIER_ID"];
        [v24 setProperty:v22 forKey:@"BBSECTION_INFO_KEY"];
        [v24 setProperty:&__kCFBooleanTrue forKey:v18];
        v25 = [v22 sectionID];
        [v24 setProperty:v25 forKey:v19];

        v26 = objc_msgSend(v22, "nc_settingsIconImage");
        [v24 setProperty:v26 forKey:v20];

        if (v9)
        {
          [v24 setProperty:objc_opt_class() forKey:v34];
          v27 = [v22 sectionID];
          id v28 = [(NCScheduledDeliverySettingsController *)v38 _numberOfNotificationsForSectionIdentifier:v27];

          v29 = +[NSNumber numberWithUnsignedInteger:v28];
          [v24 setProperty:v29 forKey:@"SCHEDULED_DELIVERY_APP_COUNT_KEY"];

          uint64_t v20 = v35;
          v30 = +[NSNumber numberWithUnsignedInteger:[(NCScheduledDeliverySettingsController *)v38 maximumAverageNumberOfNotifications]];
          [v24 setProperty:v30 forKey:@"SCHEDULED_DELIVERY_MAX_COUNT_KEY"];
        }
        objc_msgSend(v37, "bs_safeAddObject:", v24);
      }
      id v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v16);
  }

  return v37;
}

- (void)_populateDigestTimeSpecifiers
{
  if (![(NCScheduledDeliverySettingsController *)self isPopulatingDigestTimeSpecifiers])
  {
    [(NCScheduledDeliverySettingsController *)self setPopulatingDigestTimeSpecifiers:1];
    if (!self->_queue)
    {
      id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NotificationSettings.NCScheduledDeliverySettingsController", v3);
      queue = self->_queue;
      self->_queue = v4;
    }
    objc_initWeak(&location, self);
    uint64_t v6 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6D98;
    block[3] = &unk_40CE0;
    objc_copyWeak(&v8, &location);
    block[4] = self;
    dispatch_async((dispatch_queue_t)v6, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)_digestTimeSpecifierAtIndex:(unint64_t)a3 forScheduleTime:(id)a4
{
  unint64_t v5 = a3 + 1;
  id v6 = a4;
  v7 = [(NCScheduledDeliverySettingsController *)self _scheduleTimeLabelForIndex:v5];
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v8 setIdentifier:v7];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSDatePickerInlineKey];
  +[PSDateTimePickerCell preferredHeight];
  BOOL v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v8 setProperty:v9 forKey:PSTableCellHeightKey];

  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v8 setProperty:v6 forKey:@"SCHEDULE_TIME_KEY"];

  return v8;
}

- (id)_specifierForAddNewScheduledTime
{
  v2 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v3 = [v2 localizedStringForKey:@"SCHEDULED_DELIVERY_ADD_SUMMARY" value:&stru_419A0 table:@"NotificationsSettings"];

  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  [v4 setIdentifier:@"SCHEDULED_DELIVERY_ADD_SUMMARY_ID"];

  return v4;
}

- (void)datePickerChanged:(id)a3
{
  id v13 = a3;
  id v4 = [v13 calendar];
  unint64_t v5 = [v13 date];
  id v6 = [v4 components:96 fromDate:v5];

  v7 = [(NSMapTable *)self->_datePickersToSpecifiersMapTable objectForKey:v13];
  id v8 = [(NSMutableArray *)self->_orderedDigestTimeSpecifiers indexOfObject:v7];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = v8;
    if (v8 < [(NSMutableArray *)self->_orderedScheduledDeliveryTimes count])
    {
      id v10 = [(NSMutableArray *)self->_orderedScheduledDeliveryTimes objectAtIndex:v9];
      if ([(NSMutableArray *)self->_orderedScheduledDeliveryTimes containsObject:v6])
      {
        [v6 setMinute:1];
        v11 = [v13 calendar];
        v12 = [v11 dateFromComponents:v6];
        [v13 setDate:v12];
      }
      [v7 setProperty:v6 forKey:@"SCHEDULE_TIME_KEY"];
      [(NCScheduledDeliverySettingsController *)self _replaceScheduleDigestTime:v10 withNewDigestTime:v6];
    }
  }
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = a3;
  if (!self->_datePickersToSpecifiersMapTable)
  {
    unint64_t v5 = +[NSMapTable mapTableWithWeakToWeakObjects];
    datePickersToSpecifiersMapTable = self->_datePickersToSpecifiersMapTable;
    self->_datePickersToSpecifiersMapTable = v5;
  }
  id v7 = objc_alloc_init((Class)UIDatePicker);
  [v7 setDatePickerMode:0];
  [v7 setPreferredDatePickerStyle:3];
  id v8 = [v4 propertyForKey:@"SCHEDULE_TIME_KEY"];
  id v9 = [v7 calendar];
  id v10 = [v9 dateFromComponents:v8];
  [v7 setDate:v10];

  [(NSMapTable *)self->_datePickersToSpecifiersMapTable setObject:v4 forKey:v7];

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(NCScheduledDeliverySettingsController *)self isGlobalScheduledDeliveryEnabled])
  {
    id v6 = [v5 section];
    BOOL v7 = v6 == (id)[(NCScheduledDeliverySettingsController *)self _sectionForScheduleTimes];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (v8)
  {
    if (a4 == 1)
    {
      [(NCScheduledDeliverySettingsController *)self _removeScheduledTimeAtIndexPath:v8];
    }
    else if (a4 == 2)
    {
      [(NCScheduledDeliverySettingsController *)self _addNewScheduledTime];
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(NCScheduledDeliverySettingsController *)self isGlobalScheduledDeliveryEnabled])
  {
    id v6 = [(NCScheduledDeliverySettingsController *)self specifierAtIndexPath:v5];
    BOOL v7 = [v6 identifier];
    unsigned __int8 v8 = [v7 isEqualToString:@"SCHEDULED_DELIVERY_ADD_SUMMARY_ID"];

    if (v8)
    {
      int64_t v9 = 2;
    }
    else
    {
      id v10 = [v5 section];
      int64_t v9 = v10 == (id)-[NCScheduledDeliverySettingsController _sectionForScheduleTimes](self, "_sectionForScheduleTimes")&& [v5 row] != 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(a4, "section", a3);
  return v5 != (id)[(NCScheduledDeliverySettingsController *)self _sectionForScheduleTimes];
}

- (void)setGlobalScheduledDeliverySetting:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 BOOLValue];
  if (v7
    && [(NCScheduledDeliverySettingsController *)self _globalScheduledDeliverySetting] == -1)
  {
    unsigned __int8 v8 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    int64_t v9 = [v8 localizedStringForKey:@"SCHEDULED_DELIVERY_ONBOARDING_DEFER_SETUP" value:&stru_419A0 table:@"NotificationsSettings"];
    id v10 = +[NCDigestOnboardingNavigationController navigationControllerWithOnboardingDelegate:self deferButtonText:v9];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_7820;
    v11[3] = &unk_40D08;
    v11[4] = self;
    id v12 = v6;
    [(NCScheduledDeliverySettingsController *)self presentViewController:v10 animated:1 completion:v11];
  }
  else
  {
    [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryEnabled:v7];
  }
}

- (id)globalScheduledDeliverySetting:(id)a3
{
  if ((char *)[(NCScheduledDeliverySettingsController *)self _globalScheduledDeliverySetting] == (char *)&dword_0 + 2)id v3 = &__kCFBooleanTrue; {
  else
  }
    id v3 = &__kCFBooleanFalse;

  return v3;
}

- (int64_t)_globalScheduledDeliverySetting
{
  v2 = +[NCSettingsGatewayController sharedInstance];
  id v3 = [v2 effectiveGlobalScheduledDeliverySetting];

  return (int64_t)v3;
}

- (id)_globalScheduledDeliveryTimes
{
  v2 = +[NCSettingsGatewayController sharedInstance];
  id v3 = [v2 effectiveGlobalScheduledDeliveryTimes];

  return v3;
}

- (void)_setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4 = a3;
  id v5 = +[NCSettingsGatewayController sharedInstance];
  [v5 setEffectiveGlobalScheduledDeliveryTimes:v4];

  id v6 = [(NCScheduledDeliverySettingsController *)self delegate];
  [v6 scheduledDeliverySettingsControllerDidChangeGlobalScheduledDeliverySettings:self];
}

- (void)_setGlobalScheduledDeliveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = +[NCSettingsGatewayController sharedInstance];
  [v6 setEffectiveGlobalScheduledDeliverySetting:v5];

  [(NCScheduledDeliverySettingsController *)self setGlobalScheduledDeliveryEnabled:v3];
  id v8 = [(NCScheduledDeliverySettingsController *)self _updatesForSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] withGlobalScheduledDeliverySetting:v5 animated:1];
  [(NCScheduledDeliverySettingsController *)self performSpecifierUpdates:v8];
  id v7 = [(NCScheduledDeliverySettingsController *)self delegate];
  [v7 scheduledDeliverySettingsControllerDidChangeGlobalScheduledDeliverySettings:self];
}

- (id)appScheduledDeliveryEnabled:(id)a3
{
  BOOL v3 = [a3 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 scheduledDeliverySetting] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setAppScheduledDeliveryEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v12 = [v5 propertyForKey:@"BBSECTION_INFO_KEY"];
  id v7 = [v12 copy];
  unsigned int v8 = [v6 BOOLValue];

  if (v8) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v7 setScheduledDeliverySetting:v9];
  [v5 setProperty:v7 forKey:@"BBSECTION_INFO_KEY"];

  id v10 = +[NCSettingsGatewayController sharedInstance];
  v11 = [v12 sectionID];
  [v10 setSectionInfo:v7 forSectionID:v11];
}

- (void)setGlobalShowNextSummarySetting:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = +[NCSettingsGatewayController sharedInstance];
  [v5 setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:v4];
}

- (id)globalShowNextSummarySetting:(id)a3
{
  BOOL v3 = +[NCSettingsGatewayController sharedInstance];
  uint64_t v4 = (char *)[v3 effectiveGlobalScheduledDeliveryShowNextSummarySetting];

  if (v4 == (unsigned char *)&dword_0 + 2) {
    id v5 = &__kCFBooleanTrue;
  }
  else {
    id v5 = &__kCFBooleanFalse;
  }

  return v5;
}

- (void)_replaceScheduleDigestTime:(id)a3 withNewDigestTime:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 != v6)
  {
    id v7 = -[NSMutableArray indexOfObject:](self->_orderedScheduledDeliveryTimes, "indexOfObject:");
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_orderedScheduledDeliveryTimes removeObject:v9];
    }
    if (([(NSMutableArray *)self->_orderedScheduledDeliveryTimes containsObject:v6] & 1) == 0) {
      [(NSMutableArray *)self->_orderedScheduledDeliveryTimes insertObject:v6 atIndex:v7];
    }
    id v8 = [(NSMutableArray *)self->_orderedScheduledDeliveryTimes copy];
    [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryTimes:v8];
  }
}

- (void)_addDefaultScheduledDeliveryTimes
{
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setHour:8];
  [v5 setMinute:0];
  id v3 = objc_alloc_init((Class)NSDateComponents);
  [v3 setHour:18];
  [v3 setMinute:0];
  [(NSMutableArray *)self->_orderedScheduledDeliveryTimes addObject:v5];
  [(NSMutableArray *)self->_orderedScheduledDeliveryTimes addObject:v3];
  id v4 = [(NSMutableArray *)self->_orderedScheduledDeliveryTimes copy];
  [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryTimes:v4];
}

- (void)_addNewScheduledTime
{
  id v10 = [(NSMutableArray *)self->_orderedScheduledDeliveryTimes lastObject];
  id v3 = objc_alloc_init((Class)NSDateComponents);
  id v4 = (char *)[v10 hour] + 1;
  if ((unint64_t)v4 >= 0x18)
  {
    id v4 = (char *)[v10 hour];
    uint64_t v5 = ((uint64_t)[v10 minute] + 1) % 60;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v3 setHour:v4];
  [v3 setMinute:v5];
  [(NSMutableArray *)self->_orderedScheduledDeliveryTimes addObject:v3];
  id v6 = [(NCScheduledDeliverySettingsController *)self _digestTimeSpecifierAtIndex:[(NSMutableArray *)self->_orderedDigestTimeSpecifiers count] forScheduleTime:v3];
  id v7 = [(NCScheduledDeliverySettingsController *)self orderedDigestTimeSpecifiers];
  [v7 addObject:v6];

  id v8 = [(NCScheduledDeliverySettingsController *)self specifierForID:@"SCHEDULED_DELIVERY_ADD_SUMMARY_ID"];
  [(NCScheduledDeliverySettingsController *)self insertSpecifier:v6 atIndex:[(NCScheduledDeliverySettingsController *)self indexOfSpecifier:v8] animated:1];
  if ((unint64_t)[(NSMutableArray *)self->_orderedScheduledDeliveryTimes count] >= 0xC) {
    [(NCScheduledDeliverySettingsController *)self removeSpecifier:v8 animated:1];
  }
  id v9 = [(NSMutableArray *)self->_orderedScheduledDeliveryTimes copy];
  [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryTimes:v9];
}

- (void)_removeScheduledTimeAtIndexPath:(id)a3
{
  id v13 = a3;
  id v4 = [v13 section];
  if (v4 == (id)[(NCScheduledDeliverySettingsController *)self _sectionForScheduleTimes])
  {
    uint64_t v5 = [(NCScheduledDeliverySettingsController *)self specifierAtIndexPath:v13];
    id v6 = (int *)[(NSMutableArray *)self->_orderedDigestTimeSpecifiers count];
    [(NSMutableArray *)self->_orderedDigestTimeSpecifiers removeObject:v5];
    -[NSMutableArray removeObjectAtIndex:](self->_orderedScheduledDeliveryTimes, "removeObjectAtIndex:", [v13 row]);
    [(NCScheduledDeliverySettingsController *)self removeSpecifier:v5 animated:1];
    if (v6 == &dword_C)
    {
      id v7 = [(NCScheduledDeliverySettingsController *)self _specifierForAddNewScheduledTime];
      [(NCScheduledDeliverySettingsController *)self insertSpecifier:v7 atEndOfGroup:[(NCScheduledDeliverySettingsController *)self _sectionForScheduleTimes] animated:1];
    }
    id v8 = (char *)[v13 row];
    while (v8 < [(NSMutableArray *)self->_orderedScheduledDeliveryTimes count])
    {
      id v9 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, [v13 section]);
      id v10 = [(NCScheduledDeliverySettingsController *)self specifierAtIndexPath:v9];
      ++v8;
      if (v9)
      {
        v11 = [(NCScheduledDeliverySettingsController *)self _scheduleTimeLabelForIndex:v8];
        [v10 setName:v11];

        [(NCScheduledDeliverySettingsController *)self reloadSpecifier:v10 animated:1];
      }
    }
    id v12 = [(NSMutableArray *)self->_orderedScheduledDeliveryTimes copy];
    [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryTimes:v12];
  }

  _objc_release_x1();
}

- (unint64_t)_sectionForScheduleTimes
{
  id v3 = [(NCScheduledDeliverySettingsController *)self specifierForID:@"SCHEDULE_DELIVERY_TIMES_GROUP_ID"];
  id v4 = [(NCScheduledDeliverySettingsController *)self indexPathForSpecifier:v3];
  id v5 = [v4 section];

  return (unint64_t)v5;
}

- (id)orderType:(id)a3
{
  BOOL v3 = [(NCScheduledDeliverySettingsController *)self isOrderedByNumberOfNotifications];

  return +[NSNumber numberWithBool:v3];
}

- (void)setOrderType:(id)a3 specifier:(id)a4
{
  -[NCScheduledDeliverySettingsController setOrderedByNumberOfNotifications:](self, "setOrderedByNumberOfNotifications:", [a3 BOOLValue]);

  [(NCScheduledDeliverySettingsController *)self reloadSpecifiers];
}

- (void)_loadSortingOrderByNotificationsReceivedIfNecessary
{
  if (![(NCScheduledDeliverySettingsController *)self hasLoadedSortOrderByNumberOfNotifications])
  {
    if (!self->_queue)
    {
      BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NotificationSettings.NCScheduledDeliverySettingsController", v3);
      queue = self->_queue;
      self->_queue = v4;
    }
    objc_initWeak(&location, self);
    id v6 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_83A4;
    block[3] = &unk_40CE0;
    objc_copyWeak(&v8, &location);
    block[4] = self;
    dispatch_async((dispatch_queue_t)v6, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)_activeSectionInfos
{
  v2 = +[NCSettingsGatewayController sharedInstance];
  BOOL v3 = [v2 activeSectionInfo];

  id v4 = objc_msgSend(v3, "bs_filter:", &stru_40D98);

  return v4;
}

- (id)_alphabeticallyOrderedSectionInfos:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_40DD8];
}

- (id)_frequencyOrderedSectionInfos:(id)a3 forRankedDigestSetupResponses:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_8824;
  v12[3] = &unk_40E28;
  id v13 = v5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v14 = v7;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (unint64_t)_numberOfNotificationsForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NCScheduledDeliverySettingsController *)self rankedDigestSetupResponses];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8A78;
  v13[3] = &unk_40E50;
  id v6 = v4;
  id v14 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v13];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = 0;
  }
  else
  {
    id v9 = [(NCScheduledDeliverySettingsController *)self rankedDigestSetupResponses];
    id v10 = [v9 objectAtIndex:v7];

    unint64_t v11 = 7 * (void)[v10 numBasicNotifications];
    unint64_t v8 = v11
       / [(NCScheduledDeliverySettingsController *)self numberOfDaysForNotificationCount];
  }
  return v8;
}

- (int64_t)_compareScheduleTime:(id)a3 withScheduleTime:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 hour];
  if ((uint64_t)v7 >= (uint64_t)[v6 hour])
  {
    id v9 = [v5 hour];
    if (v9 == [v6 hour])
    {
      id v10 = [v5 minute];
      if ((uint64_t)v10 < (uint64_t)[v6 minute]) {
        int64_t v8 = -1;
      }
      else {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (id)_orderedGlobalScheduledDeliveryTimes
{
  BOOL v3 = [(NCScheduledDeliverySettingsController *)self _globalScheduledDeliveryTimes];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8C0C;
  v6[3] = &unk_40E78;
  v6[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

- (id)_scheduleTimeLabelForIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_FIRST_SUMMARY";
      goto LABEL_14;
    case 2uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_SECOND_SUMMARY";
      goto LABEL_14;
    case 3uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_THIRD_SUMMARY";
      goto LABEL_14;
    case 4uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_FOURTH_SUMMARY";
      goto LABEL_14;
    case 5uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_FIFTH_SUMMARY";
      goto LABEL_14;
    case 6uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_SIXTH_SUMMARY";
      goto LABEL_14;
    case 7uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_SEVENTH_SUMMARY";
      goto LABEL_14;
    case 8uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_EIGHTH_SUMMARY";
      goto LABEL_14;
    case 9uLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_NINTH_SUMMARY";
      goto LABEL_14;
    case 0xAuLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_TENTH_SUMMARY";
      goto LABEL_14;
    case 0xBuLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_ELEVENTH_SUMMARY";
      goto LABEL_14;
    case 0xCuLL:
      BOOL v3 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      id v4 = v3;
      CFStringRef v5 = @"SCHEDULED_DELIVERY_TWELFTH_SUMMARY";
LABEL_14:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_419A0 table:@"NotificationsSettings"];

      break;
    default:
      id v6 = &stru_419A0;
      break;
  }

  return v6;
}

- (void)digestOnboardingNavigationController:(id)a3 didScheduleDigestDeliveryTimes:(id)a4 forAppBundleIdentifiers:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v7);
        }
        [(NSMutableArray *)self->_orderedScheduledDeliveryTimes addObject:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      id v10 = [v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }
  [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryEnabled:1];
  id v13 = [v7 copy];
  [(NCScheduledDeliverySettingsController *)self _setGlobalScheduledDeliveryTimes:v13];

  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = +[NCSettingsGatewayController sharedInstance];
  id v16 = [v15 activeSectionInfo];

  id v17 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        v22 = [v21 sectionID];
        [v14 setObject:v21 forKey:v22];
      }
      id v18 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v18);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v8;
  id v24 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8 * (void)k);
        v29 = objc_msgSend(v14, "objectForKey:", v28, (void)v32);
        v30 = v29;
        if (v29)
        {
          [v29 setScheduledDeliverySetting:2];
          v31 = +[NCSettingsGatewayController sharedInstance];
          [v31 setSectionInfo:v30 forSectionID:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v25);
  }

  [(NCScheduledDeliverySettingsController *)self reloadSpecifiers];
}

- (NCScheduledDeliverySettingsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCScheduledDeliverySettingsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)orderedScheduledDeliveryTimes
{
  return self->_orderedScheduledDeliveryTimes;
}

- (void)setOrderedScheduledDeliveryTimes:(id)a3
{
}

- (NSMutableArray)orderedDigestTimeSpecifiers
{
  return self->_orderedDigestTimeSpecifiers;
}

- (void)setOrderedDigestTimeSpecifiers:(id)a3
{
}

- (NSMapTable)datePickersToSpecifiersMapTable
{
  return self->_datePickersToSpecifiersMapTable;
}

- (void)setDatePickersToSpecifiersMapTable:(id)a3
{
}

- (BOOL)isGlobalScheduledDeliveryEnabled
{
  return self->_globalScheduledDeliveryEnabled;
}

- (void)setGlobalScheduledDeliveryEnabled:(BOOL)a3
{
  self->_globalScheduledDeliveryEnabled = a3;
}

- (BOOL)isPopulatingDigestTimeSpecifiers
{
  return self->_populatingDigestTimeSpecifiers;
}

- (void)setPopulatingDigestTimeSpecifiers:(BOOL)a3
{
  self->_populatingDigestTimeSpecifiers = a3;
}

- (NSArray)rankedDigestSetupResponses
{
  return self->_rankedDigestSetupResponses;
}

- (void)setRankedDigestSetupResponses:(id)a3
{
}

- (BOOL)hasLoadedSortOrderByNumberOfNotifications
{
  return self->_loadedSortOrderByNumberOfNotifications;
}

- (void)setLoadedSortOrderByNumberOfNotifications:(BOOL)a3
{
  self->_loadedSortOrderByNumberOfNotifications = a3;
}

- (BOOL)isOrderedByNumberOfNotifications
{
  return self->_orderedByNumberOfNotifications;
}

- (void)setOrderedByNumberOfNotifications:(BOOL)a3
{
  self->_orderedByNumberOfNotifications = a3;
}

- (unint64_t)maximumAverageNumberOfNotifications
{
  return self->_maximumAverageNumberOfNotifications;
}

- (void)setMaximumAverageNumberOfNotifications:(unint64_t)a3
{
  self->_maximumAverageNumberOfNotifications = a3;
}

- (unint64_t)numberOfDaysForNotificationCount
{
  return self->_numberOfDaysForNotificationCount;
}

- (void)setNumberOfDaysForNotificationCount:(unint64_t)a3
{
  self->_numberOfDaysForNotificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedDigestSetupResponses, 0);
  objc_storeStrong((id *)&self->_datePickersToSpecifiersMapTable, 0);
  objc_storeStrong((id *)&self->_orderedDigestTimeSpecifiers, 0);
  objc_storeStrong((id *)&self->_orderedScheduledDeliveryTimes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end