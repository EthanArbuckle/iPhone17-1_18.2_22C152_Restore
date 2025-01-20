@interface CUIKCalendarModel
+ (id)sortedEnabledDelegateSourcesFromStore:(id)a3;
+ (unint64_t)errorForSource:(id)a3;
+ (unint64_t)errorForSubscribedCalendarChildrenOfSource:(id)a3;
+ (void)temporarilyIgnoreInsecureConnectionErrorsForCalendars:(id)a3;
+ (void)temporarilyIgnoreInvalidCredentialsErrorForSource:(id)a3;
- (BOOL)_eventBelongsToCurrentIdentity:(id)a3;
- (BOOL)_selectOccurrence:(id)a3 notify:(BOOL)a4;
- (BOOL)_setSelectedCalendars:(id)a3;
- (BOOL)_shouldShowNotification:(id)a3;
- (BOOL)allowEventLocationPrediction;
- (BOOL)autoStartNotificationMonitor;
- (BOOL)cachedOccurrencesAreLoaded;
- (BOOL)containsDelegateSources;
- (BOOL)countSourcesWithErrors;
- (BOOL)currentlyLocked;
- (BOOL)disableFocusFiltering;
- (BOOL)invitationBearingStoresExistForEvents;
- (BOOL)isCalendarVisibleWithID:(id)a3;
- (BOOL)removeEvent:(id)a3 withSpan:(int64_t)a4 error:(id *)a5;
- (BOOL)searchingOccurrences;
- (BOOL)selectedOccurrenceIsSearchMatch;
- (BOOL)showDayAsList;
- (BOOL)showMonthAsDivided;
- (CUIKCalendarModel)initWithDataPath:(id)a3 pasteboardManager:(id)a4;
- (CUIKCalendarModel)initWithEventStore:(id)a3 pasteboardManager:(id)a4;
- (CUIKCalendarModel)initWithPasteboardManager:(id)a3;
- (CUIKIPendingReminderTracker)pendingReminderTracker;
- (CUIKPasteboardManager)pasteboardManager;
- (CUIKUndoManager)undoManager;
- (EKCalendarDate)selectedDate;
- (EKCalendarDate)selectedDay;
- (EKEvent)selectedOccurrence;
- (EKEventStore)eventStore;
- (EKSource)sourceForSelectedIdentity;
- (NSArray)selectedOccurrences;
- (NSArray)sortedEnabledDelegates;
- (NSCalendar)calendar;
- (NSSet)collapsedSectionIdentifiers;
- (NSSet)selectedCalendars;
- (NSSet)selectedCalendarsIgnoringFocus;
- (NSSet)unselectedCalendarsForFocusMode;
- (NSSet)unselectedCalendarsIgnoringFocus;
- (NSString)sceneIdentifier;
- (NSString)searchString;
- (double)_tomorrow;
- (id)_calendarsEnabledInFocus:(id)a3;
- (id)_calendarsExcludingLockedReminder:(id)a3;
- (id)_calendarsForCurrentIdentityFromCalendars:(id)a3 lock:(BOOL)a4;
- (id)_dataSourceUsingFilter:(BOOL)a3;
- (id)_eventNotificationsForCurrentIdentityIgnoringFilter:(BOOL)a3;
- (id)_notificationMonitor;
- (id)_reminderCalendar;
- (id)_unselectedCalendarsForFocusMode;
- (id)allCalendarsForCurrentIdentity;
- (id)allEventNotificationReferences;
- (id)cachedOccurrenceAtIndexPath:(id)a3;
- (id)cachedOccurrenceAtIndexPath:(id)a3 usingFilter:(BOOL)a4;
- (id)cachedOccurrencesForSection:(int64_t)a3;
- (id)cachedSpecialDayDataForSection:(int64_t)a3;
- (id)calendarsForCurrentIdentityFromCalendars:(id)a3;
- (id)closestOccurrenceToTomorrowForEventObjectID:(id)a3;
- (id)dateForCachedOccurrencesInSection:(int64_t)a3;
- (id)dateForCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4;
- (id)dateForCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4 holdingCachedFakeTodayIndexLock:(BOOL)a5;
- (id)defaultCalendarForNewEvents;
- (id)eventNotificationReferencesForCurrentIdentity;
- (id)eventNotificationReferencesForCurrentIdentityIgnoringFilter;
- (id)eventNotificationReferencesForIdentity:(id)a3;
- (id)eventNotificationReferencesForIdentity:(id)a3 ignoringFilter:(BOOL)a4;
- (id)indexPathsForOccurrence:(id)a3 usingFilter:(BOOL)a4;
- (id)occurrencesForDay:(id)a3 waitForLoad:(BOOL)a4;
- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6;
- (id)occurrencesForStartDay:(id)a3 endDay:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6;
- (id)persistedSceneState;
- (id)refreshAccountListIfNeeded:(BOOL)a3;
- (id)refreshCalendarDataIfNeeded:(BOOL)a3;
- (id)reminderCalendar;
- (id)selectedDateOccurrences:(BOOL)a3 loadIsComplete:(BOOL *)a4;
- (int64_t)_cachedFakeTodayIndexLocked;
- (int64_t)_sectionForCachedOccurrencesOnDate:(id)a3 sectionExistsForDay:(BOOL *)a4 usingFilter:(BOOL)a5;
- (int64_t)accountsInInitialSyncCount;
- (int64_t)countAccountsInInitialSync;
- (int64_t)displayableAccountErrorsForSource:(id)a3;
- (int64_t)numDaysToShow;
- (int64_t)numberOfCachedOccurrencesInSection:(int64_t)a3;
- (int64_t)numberOfCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4;
- (int64_t)numberOfDaysWithCachedOccurrences;
- (int64_t)numberOfDaysWithCachedOccurrencesUsingFilter:(BOOL)a3;
- (int64_t)readWriteCalendarCount;
- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3;
- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3 sectionExistsForDay:(BOOL *)a4;
- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3 usingFilter:(BOOL)a4;
- (unint64_t)_eventNotificationCountForCurrentIdentityIgnoringFilter:(BOOL)a3;
- (unint64_t)allEventNotificationsCount;
- (unint64_t)eventNotificationsForCurrentIdentityCount;
- (unint64_t)eventNotificationsForCurrentIdentityIgnoringFilterCount;
- (unint64_t)firstVisibleSecond;
- (unint64_t)focusFilterMode;
- (void)_checkSources;
- (void)_createOccurrenceCacheDataSources;
- (void)_deselectOccurrence:(id)a3 notify:(BOOL)a4;
- (void)_deselectOccurrences:(id)a3 notify:(BOOL)a4;
- (void)_eventStoreChanged:(id)a3;
- (void)_executeBlockWithOccurrenceCacheDataSources:(id)a3;
- (void)_finishedFirstLoad;
- (void)_focusModeConfigurationChanged:(id)a3;
- (void)_ignoredErrorsChanged;
- (void)_invalidateCachedOccurrences;
- (void)_invalidateOccurrenceCacheDataSources;
- (void)_loadVisibleCalendarsIfNeeded;
- (void)_localeChanged:(id)a3;
- (void)_notificationBlacklisted;
- (void)_notificationsExpired:(id)a3;
- (void)_notificationsLoaded:(id)a3;
- (void)_occurrenceCacheChanged;
- (void)_occurrenceCacheChangedNotificationHandler;
- (void)_performCommonInitializationWithPasteboardManager:(id)a3;
- (void)_processReloadForCacheOnly:(BOOL)a3 includingCalendars:(BOOL)a4 checkCalendarsValid:(BOOL)a5 checkSources:(BOOL)a6;
- (void)_recreateOccurrenceCacheDataSources;
- (void)_reloadEventsIfTodayChanged;
- (void)_sceneEnteredBackground:(id)a3;
- (void)_sceneEnteredForeground:(id)a3;
- (void)_searchResultsAvailable:(id)a3;
- (void)_setFocusFilterMode:(unint64_t)a3 force:(BOOL)a4;
- (void)_setupUndoManager;
- (void)_significantTimeChange;
- (void)_systemWake;
- (void)_timeZoneChanged:(id)a3;
- (void)_tzSupportTodayRolledOver;
- (void)addOccurrenceAwaitingDeletion:(id)a3;
- (void)addOccurrenceAwaitingRefresh:(id)a3;
- (void)addRespondedNotificationObjectID:(id)a3;
- (void)calendarEventLoader:(id)a3 occurrencesDidUpdateBetweenStart:(double)a4 end:(double)a5 generation:(int)a6 wasEmptyLoad:(BOOL)a7;
- (void)checkLocationAuthorizationAndAllowEventLocationPrediction;
- (void)dealloc;
- (void)deselectOccurrence:(id)a3;
- (void)deselectOccurrences:(id)a3;
- (void)ensureCalendarVisibleWithId:(id)a3;
- (void)fetchCachedDaysInBackgroundStartingFromSection:(int64_t)a3 usingFilter:(BOOL)a4;
- (void)fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4;
- (void)locationPrecisionDeterminedNotification:(id)a3;
- (void)postSelectedCalendarsChanged;
- (void)prepareForAppSuspend;
- (void)selectOccurrence:(id)a3;
- (void)selectOccurrences:(id)a3;
- (void)setAllowEventLocationPrediction:(BOOL)a3;
- (void)setAutoStartNotificationMonitor:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setCollapsedSectionIdentifiers:(id)a3;
- (void)setComponentForExpandingPadding:(unint64_t)a3;
- (void)setDesiredPaddingDays:(unsigned int)a3;
- (void)setDisableFocusFiltering:(BOOL)a3;
- (void)setFirstVisibleSecond:(unint64_t)a3;
- (void)setFocusFilterMode:(unint64_t)a3;
- (void)setFocusFilterMode:(unint64_t)a3 force:(BOOL)a4;
- (void)setMaxCachedDays:(unsigned int)a3;
- (void)setNumDaysToShow:(int64_t)a3;
- (void)setPendingReminderTracker:(id)a3;
- (void)setPreferredReloadStartDate:(id)a3 endDate:(id)a4;
- (void)setSceneIdentifier:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSelectedCalendars:(id)a3;
- (void)setSelectedCalendarsAndRequestPreferenceSave:(id)a3 reason:(id)a4;
- (void)setSelectedDate:(id)a3;
- (void)setSelectedDateChangesDelayedUntilAfterTransition:(BOOL)a3;
- (void)setSelectedOccurrence:(id)a3;
- (void)setSelectedOccurrence:(id)a3 forceChange:(BOOL)a4;
- (void)setSelectedOccurrences:(id)a3;
- (void)setSelectedOccurrences:(id)a3 forceChange:(BOOL)a4;
- (void)setShowDayAsList:(BOOL)a3;
- (void)setShowMonthAsDivided:(BOOL)a3;
- (void)setSortedEnabledDelegates:(id)a3;
- (void)setSourceForSelectedIdentity:(id)a3;
- (void)setUnselectedCalendars:(id)a3;
- (void)simulateFirstLoadFinished;
- (void)startNotificationMonitor;
- (void)updateAfterAppResume;
- (void)updateSelectedDateTimeZone;
- (void)updateSourceForSelectedIdentity:(id)a3 selectedCalendars:(id)a4;
@end

@implementation CUIKCalendarModel

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3 sectionExistsForDay:(BOOL *)a4
{
  return [(CUIKCalendarModel *)self _sectionForCachedOccurrencesOnDate:a3 sectionExistsForDay:a4 usingFilter:0];
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setPreferredReloadStartDate:(id)a3 endDate:(id)a4
{
}

- (unint64_t)eventNotificationsForCurrentIdentityCount
{
  return [(CUIKCalendarModel *)self _eventNotificationCountForCurrentIdentityIgnoringFilter:0];
}

- (void)fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4
{
  id v6 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:0];
  [v6 fetchDaysStartingFromSection:a3 sectionsToLoadInBothDirections:a4];
}

- (void)_sceneEnteredForeground:(id)a3
{
  id v8 = [a3 object];
  v4 = [v8 _sceneIdentifier];
  v5 = [(CUIKCalendarModel *)self sceneIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    self->_modelLocked = 0;
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"CalendarModelDidUnlockNotification" object:self];
  }
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, a3);
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v6 postNotificationName:@"CalendarModelCollapsedSectionIdentifiersPreferenceRequiresSavingNotification" object:self userInfo:0];
}

- (void)locationPrecisionDeterminedNotification:(id)a3
{
  if ([MEMORY[0x1E4F57748] locationPrecisionForBundleIdentifier:*MEMORY[0x1E4F57868]])
  {
    v4 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_INFO, "Location precision determined; allowing event location prediction",
        buf,
        2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__CUIKCalendarModel_locationPrecisionDeterminedNotification___block_invoke;
    block[3] = &unk_1E6369C50;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4F57618] object:0];
  }
}

- (void)checkLocationAuthorizationAndAllowEventLocationPrediction
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F57618];
  [v3 addObserver:self selector:sel_locationPrecisionDeterminedNotification_ name:*MEMORY[0x1E4F57618] object:0];

  uint64_t v5 = *MEMORY[0x1E4F57868];
  if ([MEMORY[0x1E4F57748] locationPrecisionForBundleIdentifier:*MEMORY[0x1E4F57868]])
  {
    id v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDF08000, v6, OS_LOG_TYPE_INFO, "Location precision already known; allowing event location prediction",
        buf,
        2u);
    }

    [(CUIKCalendarModel *)self setAllowEventLocationPrediction:1];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:v4 object:0];
  }
  else
  {
    [MEMORY[0x1E4F57748] authorizationStatusForBundleIdentifier:v5 completion:&__block_literal_global_6];
    v7 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1BDF08000, v7, OS_LOG_TYPE_INFO, "Waiting for precision to allow event location prediction", v8, 2u);
    }
  }
}

- (void)_notificationsLoaded:(id)a3
{
  if ([(_EKNotificationMonitor *)self->_notificationMonitor notificationCount])
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"CalendarModelNotificationCountsChangedNotification" object:self];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"CalendarModelNotificationsChangedNotification" object:self];
  }
}

- (void)calendarEventLoader:(id)a3 occurrencesDidUpdateBetweenStart:(double)a4 end:(double)a5 generation:(int)a6 wasEmptyLoad:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v11 = [(CUIKCalendarModel *)self selectedOccurrences];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  unint64_t v13 = 0x1E4F28000;
  if (!v12) {
    goto LABEL_25;
  }
  uint64_t v14 = v12;
  char v15 = 0;
  uint64_t v16 = *(void *)v39;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v39 != v16) {
        objc_enumerationMutation(v11);
      }
      v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
      v19 = [v18 startDate];
      [v19 timeIntervalSinceReferenceDate];
      double v21 = v20;

      v22 = [v18 endDateUnadjustedForLegacyClients];
      [v22 timeIntervalSinceReferenceDate];
      double v24 = v23;

      if ([v18 isBirthday])
      {
        [v18 isNew];
      }
      else
      {
        if (v21 < a4 || v21 > a5) {
          BOOL v26 = v24 <= a5 && v24 >= a4;
        }
        else {
          BOOL v26 = 1;
        }
        if (([v18 isNew] & 1) == 0 && v26)
        {
          v27 = (void *)[v18 copy];
          char v28 = [v27 refreshIfRefreshableAndNotify:0];

          if ((v28 & 1) == 0)
          {
            [(CUIKCalendarModel *)self _deselectOccurrence:v18 notify:0];
            char v15 = 1;
          }
        }
      }
      ++v17;
    }
    while (v14 != v17);
    uint64_t v29 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    uint64_t v14 = v29;
  }
  while (v29);

  unint64_t v13 = 0x1E4F28000uLL;
  if (v15)
  {
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"CalendarModelSelectedOccurrencesChangedNotification" object:self];
LABEL_25:
  }
  v30 = (void *)MEMORY[0x1E4F1C9E8];
  v31 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a5];
  v33 = [NSNumber numberWithBool:v7];
  v34 = [NSNumber numberWithInt:a6];
  v35 = objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, @"CalendarModelDisplayedOccurrencesChangedRangeStartKey", v32, @"CalendarModelDisplayedOccurrencesChangedRangeEndKey", v33, @"CalendarModelDisplayedOccurrencesChangedFilteredAllKey", v34, @"CalendarModelDisplayedOccurrencesChangedGenerationKey", 0);

  [(CUIKCalendarModel *)self _finishedFirstLoad];
  v36 = [*(id *)(v13 + 3768) defaultCenter];
  [v36 postNotificationName:@"CalendarModelDisplayedOccurrencesChangedNotification" object:self userInfo:v35];

  if (!v7 && self->_autoStartNotificationMonitor) {
    [(CUIKCalendarModel *)self startNotificationMonitor];
  }
}

- (NSArray)selectedOccurrences
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_selectedOccurrences];
}

- (void)_finishedFirstLoad
{
  if ((_finishedFirstLoad___finishedFirstLoad & 1) == 0)
  {
    _finishedFirstLoad___finishedFirstLoad = 1;
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"CalendarModelDisplayedOccurrencesChangedForTheFirstTimeNotification" object:self];
  }
}

- (void)postSelectedCalendarsChanged
{
  id v3 = [(CUIKCalendarModel *)self selectedCalendars];
  uint64_t v4 = [(CUIKCalendarModel *)self selectedOccurrence];
  id v5 = [v4 calendar];
  char v6 = [v3 containsObject:v5];

  if ((v6 & 1) == 0) {
    [(CUIKCalendarModel *)self setSelectedOccurrence:0];
  }
  [(CUIKCalendarModel *)self _recreateOccurrenceCacheDataSources];
  [(CUIKCalendarModel *)self _processReloadForCacheOnly:0 includingCalendars:1 checkCalendarsValid:0 checkSources:0];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CalendarModelFilterChangedNotification" object:self];
}

- (EKEvent)selectedOccurrence
{
  if ([(NSMutableArray *)self->_selectedOccurrences count] == 1)
  {
    id v3 = [(NSMutableArray *)self->_selectedOccurrences firstObject];
  }
  else
  {
    id v3 = 0;
  }

  return (EKEvent *)v3;
}

- (void)setSelectedOccurrence:(id)a3 forceChange:(BOOL)a4
{
  BOOL v4 = a4;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v9[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(CUIKCalendarModel *)self setSelectedOccurrences:v8 forceChange:v4];
  }
  else
  {
    [(CUIKCalendarModel *)self setSelectedOccurrences:MEMORY[0x1E4F1CBF0] forceChange:v4];
  }
}

- (void)setSelectedOccurrences:(id)a3 forceChange:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!self->_modelLocked)
  {
    id v19 = v6;
    uint64_t v8 = [v6 count];
    id v7 = v19;
    if (v8 || (v9 = [(NSMutableArray *)self->_selectedOccurrences count], id v7 = v19, v9))
    {
      if (a4 || (v10 = [v7 isEqualToArray:self->_selectedOccurrences], id v7 = v19, (v10 & 1) == 0))
      {
        v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:v7];
        selectedOccurrences = self->_selectedOccurrences;
        self->_selectedOccurrences = v11;

        if ([(NSMutableArray *)self->_selectedOccurrences count] == 1)
        {
          unint64_t v13 = [(NSMutableArray *)self->_selectedOccurrences firstObject];
          uint64_t v14 = [v13 calendar];

          if (v14)
          {
            char v15 = [(NSMutableArray *)self->_selectedOccurrences firstObject];
            if (([v15 isNew] & 1) == 0)
            {
              pasteboardManager = self->_pasteboardManager;
              uint64_t v17 = [v15 calendar];
              [(CUIKPasteboardManager *)pasteboardManager setCalendarForPaste:v17];
            }
          }
        }
        v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v18 postNotificationName:@"CalendarModelSelectedOccurrencesChangedNotification" object:self];

        id v7 = v19;
      }
    }
  }
}

- (void)setSelectedOccurrence:(id)a3
{
}

- (void)_recreateOccurrenceCacheDataSources
{
  [(CUIKCalendarModel *)self _invalidateOccurrenceCacheDataSources];

  [(CUIKCalendarModel *)self _createOccurrenceCacheDataSources];
}

- (void)_processReloadForCacheOnly:(BOOL)a3 includingCalendars:(BOOL)a4 checkCalendarsValid:(BOOL)a5 checkSources:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  char v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [(CUIKCalendarModel *)self _invalidateCachedOccurrences];
  [v10 postNotificationName:@"CalendarModelCachedOccurrencesChangedNotification" object:self];
  if (v8)
  {
    self->_readWriteCalendarCount = 0x7FFFFFFFFFFFFFFFLL;
    self->_invitationBearingStoresExist = 0x7FFFFFFFFFFFFFFFLL;
    if (v7)
    {
      [(NSLock *)self->_filterLock lock];
      visibleCalendars = self->_visibleCalendars;
      if (visibleCalendars)
      {
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_visibleCalendars];
        visibleCalendars = self->_visibleCalendars;
      }
      else
      {
        uint64_t v12 = 0;
      }
      self->_visibleCalendars = 0;

      [(CUIKCalendarModel *)self _loadVisibleCalendarsIfNeeded];
      unint64_t v13 = objc_opt_new();
      selectedCalendars = self->_selectedCalendars;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke;
      v24[3] = &unk_1E636A2A8;
      id v15 = v13;
      id v25 = v15;
      [(NSSet *)selectedCalendars enumerateObjectsUsingBlock:v24];
      if (v12)
      {
        uint64_t v16 = self->_visibleCalendars;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke_2;
        v21[3] = &unk_1E636A2D0;
        id v22 = v12;
        id v23 = v15;
        [(NSArray *)v16 enumerateObjectsUsingBlock:v21];
      }
      uint64_t v17 = self->_sourceForSelectedIdentity;
      v18 = [(EKSource *)v17 eventStore];

      if (!v18)
      {
        sourceForSelectedIdentity = self->_sourceForSelectedIdentity;
        self->_sourceForSelectedIdentity = 0;
      }
      [(NSLock *)self->_filterLock unlock];
      if (([v15 isEqualToSet:self->_selectedCalendars] & 1) == 0)
      {
        double v20 = [NSString stringWithFormat:@"processing reloads in calendar model, old selected count %lu", -[NSSet count](self->_selectedCalendars, "count")];
        [(CUIKCalendarModel *)self setSelectedCalendarsAndRequestPreferenceSave:v15 reason:v20];
      }
    }
    [v10 postNotificationName:@"CalendarModelCalendarsChangedNotification" object:self];
  }
  if (v6) {
    [(CUIKCalendarModel *)self _checkSources];
  }
}

- (void)setSelectedDate:(id)a3
{
  id v5 = a3;
  if (!self->_modelLocked)
  {
    if (self->_suspendSelectedDateChanges)
    {
      objc_storeStrong((id *)&self->_suspendedSelectedDate, a3);
    }
    else
    {
      os_unfair_lock_lock(&self->_selectedDateLock);
      if ([v5 isEqual:self->_selectedDate])
      {
        os_unfair_lock_unlock(&self->_selectedDateLock);
      }
      else
      {
        BOOL v6 = (void *)[v5 copy];
        BOOL v7 = [v6 timeZone];
        BOOL v8 = [(NSCalendar *)self->_calendar timeZone];
        char v9 = [v7 isEqualToTimeZone:v8];

        if ((v9 & 1) == 0)
        {
          char v10 = (void *)MEMORY[0x1E4F57838];
          v11 = [v6 date];
          uint64_t v12 = [(NSCalendar *)self->_calendar timeZone];
          uint64_t v13 = [v10 calendarDateWithDate:v11 timeZone:v12];

          BOOL v6 = (void *)v13;
        }
        uint64_t v14 = (EKCalendarDate *)[v6 copy];
        selectedDate = self->_selectedDate;
        self->_selectedDate = v14;

        pasteboardManager = self->_pasteboardManager;
        uint64_t v17 = [(EKCalendarDate *)self->_selectedDate date];
        [(CUIKPasteboardManager *)pasteboardManager setDateForPaste:v17];

        v18 = +[CUIKLogSubsystem defaultCategory];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[CUIKCalendarModel setSelectedDate:]((uint64_t *)&self->_selectedDate, v18);
        }

        os_unfair_lock_unlock(&self->_selectedDateLock);
        id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v19 postNotificationName:@"CalendarModelSelectedDateChangedNotification" object:self];
      }
    }
  }
}

- (void)setMaxCachedDays:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CUIKCalendarModel setMaxCachedDays:](v3, v5);
  }

  [(CUIKEventLoader *)self->_eventLoader setCacheLimit:v3];
}

void __45__CUIKCalendarModel_startNotificationMonitor__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F25680]) initWithOptions:72 eventStore:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  [*(id *)(*(void *)(a1 + 32) + 104) start];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__notificationsExpired_ name:*MEMORY[0x1E4F25688] object:*(void *)(*(void *)(a1 + 32) + 104)];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel__notificationsLoaded_ name:*MEMORY[0x1E4F25690] object:*(void *)(*(void *)(a1 + 32) + 104)];
}

- (void)_performCommonInitializationWithPasteboardManager:(id)a3
{
  BOOL v4 = (CUIKPasteboardManager *)a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v6 = (NSCalendar *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  calendar = self->_calendar;
  self->_calendar = v6;

  BOOL v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(NSCalendar *)self->_calendar setLocale:v8];

  char v9 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  [(NSCalendar *)self->_calendar setTimeZone:v9];

  self->_selectedDateLock._os_unfair_lock_opaque = 0;
  char v10 = (void *)MEMORY[0x1E4F57838];
  v11 = CUIKNowDate();
  uint64_t v12 = [(NSCalendar *)self->_calendar timeZone];
  uint64_t v13 = [v10 calendarDateWithDate:v11 timeZone:v12];
  selectedDate = self->_selectedDate;
  self->_selectedDate = v13;

  id v15 = [[CUIKEventLoader alloc] initWithEventStore:self->_eventStore];
  eventLoader = self->_eventLoader;
  self->_eventLoader = v15;

  [(CUIKEventLoader *)self->_eventLoader setDelegate:self];
  self->_invitationBearingStoresExist = 0x7FFFFFFFFFFFFFFFLL;
  self->_cachedFakeTodayIndexLock._os_unfair_lock_opaque = 0;
  os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
  self->_cachedFakeTodayIndex = -2;
  os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
  uint64_t v17 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  filterLock = self->_filterLock;
  self->_filterLock = v17;

  self->_readWriteCalendarCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_initialAccountSyncCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_autoStartNotificationMonitor = 1;
  id v19 = +[CUIKCalendarModel sortedEnabledDelegateSourcesFromStore:self->_eventStore];
  delegateSources = self->_delegateSources;
  self->_delegateSources = v19;

  self->_dataSourceLock._os_unfair_lock_opaque = 0;
  [(CUIKCalendarModel *)self _createOccurrenceCacheDataSources];
  double v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v21 addObserver:self selector:sel__eventStoreChanged_ name:*MEMORY[0x1E4F25460] object:self->_eventStore];
  [v21 addObserver:self selector:sel__notificationBlacklisted name:@"CalendarModelBlacklistedNotification" object:0];
  [v21 addObserver:self selector:sel__tzSupportTodayRolledOver name:@"CalTodayChangedNotification" object:0];
  [v21 addObserver:self selector:sel__timeZoneChanged_ name:*MEMORY[0x1E4F578C0] object:0];
  [v21 addObserver:self selector:sel__localeChanged_ name:*MEMORY[0x1E4F1C370] object:0];
  [v21 addObserver:self selector:sel__searchResultsAvailable_ name:@"CalendarDataSourceSearchResultsAvailable" object:0];
  [v21 addObserver:self selector:sel__ignoredErrorsChanged name:@"CalendarModelIgnoredErrorsChangedNotification" object:0];
  [v21 addObserver:self selector:sel__focusModeConfigurationChanged_ name:*MEMORY[0x1E4F25478] object:0];
  [v21 addObserver:self selector:sel__sceneEnteredBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
  [v21 addObserver:self selector:sel__sceneEnteredForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];
  [MEMORY[0x1E4F576F8] addObserver:self selector:sel__significantTimeChange name:*MEMORY[0x1E4F578B0]];
  [MEMORY[0x1E4F576F8] addObserver:self selector:sel__occurrenceCacheChangedNotificationHandler name:*MEMORY[0x1E4F57508]];
  [MEMORY[0x1E4F576F8] addObserver:self selector:sel__systemWake name:@"SBWake"];
  id v22 = (const char *)*MEMORY[0x1E4F4B7A8];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke;
  handler[3] = &unk_1E636A178;
  handler[4] = self;
  id v23 = MEMORY[0x1E4F14428];
  notify_register_dispatch(v22, &self->_apHiddenNotificationToken, MEMORY[0x1E4F14428], handler);
  double v24 = (const char *)*MEMORY[0x1E4F4B7B8];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke_2;
  v30[3] = &unk_1E636A178;
  v30[4] = self;
  notify_register_dispatch(v24, &self->_apLockedNotificationToken, v23, v30);

  if (!v4)
  {
    id v25 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    BOOL v4 = [[CUIKPasteboardManager alloc] initWithEventStoreProvider:self pasteboard:v25 calendarProvider:self];
  }
  pasteboardManager = self->_pasteboardManager;
  self->_pasteboardManager = v4;
  v27 = v4;

  [(CUIKCalendarModel *)self _setupUndoManager];
  CUIKTodayDate();
  char v28 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastKnownToday = self->_lastKnownToday;
  self->_lastKnownToday = v28;
}

- (void)_setupUndoManager
{
  uint64_t v3 = [[CUIKEditingManager alloc] initWithEventStore:self->_eventStore];
  BOOL v4 = objc_alloc_init(CUIKUndoManager);
  undoManager = self->_undoManager;
  self->_undoManager = v4;

  [(CUIKUndoManager *)self->_undoManager setDisableUndoForOrganizerScheduling:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __38__CUIKCalendarModel__setupUndoManager__block_invoke;
  v9[3] = &unk_1E636A1A0;
  char v10 = v3;
  id v6 = self->_undoManager;
  BOOL v7 = v3;
  [(CUIKUndoManager *)v6 setEditingManagerProvider:v9];
  BOOL v8 = [[CUIKUndoableEditor alloc] initWithEditingManager:v7];
  [(CUIKUndoableEditor *)v8 setUndoDelegate:self->_undoManager];
  [(CUIKUndoManager *)self->_undoManager setUndoableEditor:v8];
}

- (void)_invalidateOccurrenceCacheDataSources
{
}

- (void)_invalidateCachedOccurrences
{
  [(CUIKCalendarModel *)self _executeBlockWithOccurrenceCacheDataSources:&__block_literal_global_278];
  os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
  self->_cachedFakeTodayIndex = -2;

  os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
}

+ (id)sortedEnabledDelegateSourcesFromStore:(id)a3
{
  uint64_t v3 = [a3 delegateSources];
  BOOL v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_289];
  id v5 = [v3 filteredArrayUsingPredicate:v4];
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_292];

  return v6;
}

- (unint64_t)_eventNotificationCountForCurrentIdentityIgnoringFilter:(BOOL)a3
{
  uint64_t v3 = [(CUIKCalendarModel *)self _eventNotificationsForCurrentIdentityIgnoringFilter:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)eventNotificationReferencesForIdentity:(id)a3 ignoringFilter:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(CUIKCalendarModel *)self allEventNotificationReferences];
  BOOL v8 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__CUIKCalendarModel_eventNotificationReferencesForIdentity_ignoringFilter___block_invoke;
  v13[3] = &unk_1E636A338;
  BOOL v15 = a4;
  v13[4] = self;
  id v14 = v6;
  id v9 = v6;
  char v10 = [v8 predicateWithBlock:v13];
  v11 = [v7 filteredArrayUsingPredicate:v10];

  return v11;
}

- (id)allEventNotificationReferences
{
  uint64_t v2 = [(CUIKCalendarModel *)self _notificationMonitor];
  uint64_t v3 = [v2 notificationReferences];

  return v3;
}

- (id)_notificationMonitor
{
  return self->_notificationMonitor;
}

- (id)_eventNotificationsForCurrentIdentityIgnoringFilter:(BOOL)a3
{
  return [(CUIKCalendarModel *)self eventNotificationReferencesForIdentity:self->_sourceForSelectedIdentity ignoringFilter:a3];
}

- (BOOL)cachedOccurrencesAreLoaded
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CUIKCalendarModel_cachedOccurrencesAreLoaded__block_invoke;
  v4[3] = &unk_1E636A238;
  v4[4] = &v5;
  [(CUIKCalendarModel *)self _executeBlockWithOccurrenceCacheDataSources:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)numberOfDaysWithCachedOccurrencesUsingFilter:(BOOL)a3
{
  unint64_t v4 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:a3];
  int64_t v5 = [v4 cachedDayCount];
  if ([v4 supportsFakeTodaySection])
  {
    os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
    int64_t cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
    if (cachedFakeTodayIndex == -2)
    {
      if (!v5)
      {
        self->_int64_t cachedFakeTodayIndex = -1;
LABEL_13:
        os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
        goto LABEL_14;
      }
      uint64_t v7 = CUIKTodayDate();
      int64_t v8 = [v4 sectionForCachedOccurrencesOnDate:v7];
      id v9 = [(CUIKCalendarModel *)self dateForCachedOccurrencesInSection:v8 usingFilter:0 holdingCachedFakeTodayIndexLock:1];
      if ([v9 isEqualToDate:v7])
      {
        int64_t v8 = -1;
      }
      else if (v8 == v5 - 1 && [v7 compare:v9] != -1)
      {
        int64_t v8 = v5;
      }
      self->_int64_t cachedFakeTodayIndex = v8;

      int64_t cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
    }
    if (cachedFakeTodayIndex != -1) {
      ++v5;
    }
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (int64_t)_sectionForCachedOccurrencesOnDate:(id)a3 sectionExistsForDay:(BOOL *)a4 usingFilter:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:v5];
  char v10 = CUIKTodayDate();
  int64_t v11 = [(CUIKCalendarModel *)self _cachedFakeTodayIndexLocked];
  if (v11 < 0)
  {
    [v10 compare:v8];
    goto LABEL_13;
  }
  uint64_t v12 = [v9 cachedDayCount];
  uint64_t v13 = [v10 compare:v8];
  if (v5
    || ((uint64_t v14 = v13, v15 = [v10 isEqualToDate:v8], v12 <= v11) ? (v16 = v14 == -1) : (v16 = 0),
        v16 ? (int v17 = 0) : (int v17 = 1),
        !v15 && v17))
  {
LABEL_13:
    uint64_t v18 = [v9 sectionForCachedOccurrencesOnDate:v8];
    if (v11 < 0 || v18 < v11) {
      int64_t v20 = v18;
    }
    else {
      int64_t v20 = v18 + 1;
    }
    if (a4)
    {
      if (v20 == v11)
      {
        *a4 = 0;
        goto LABEL_24;
      }
      double v21 = [(CUIKCalendarModel *)self dateForCachedOccurrencesInSection:v20];
      *a4 = [v21 isEqualToDate:v8];
    }
    int64_t v11 = v20;
  }
LABEL_24:

  return v11;
}

- (id)dateForCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4 holdingCachedFakeTodayIndexLock:(BOOL)a5
{
  id v8 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:a4];
  p_cachedFakeTodayIndexLock = &self->_cachedFakeTodayIndexLock;
  if (a5)
  {
    os_unfair_lock_assert_owner(p_cachedFakeTodayIndexLock);
    int64_t cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
  }
  else
  {
    os_unfair_lock_assert_not_owner(p_cachedFakeTodayIndexLock);
    int64_t cachedFakeTodayIndex = [(CUIKCalendarModel *)self _cachedFakeTodayIndexLocked];
  }
  if (cachedFakeTodayIndex == a3)
  {
    uint64_t v11 = CUIKTodayDate();
  }
  else
  {
    BOOL v13 = cachedFakeTodayIndex >= 0 && cachedFakeTodayIndex < a3;
    uint64_t v11 = [v8 dateAtDayIndex:a3 - v13];
  }
  uint64_t v14 = (void *)v11;

  return v14;
}

- (id)dateForCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4
{
  return [(CUIKCalendarModel *)self dateForCachedOccurrencesInSection:a3 usingFilter:a4 holdingCachedFakeTodayIndexLock:0];
}

- (id)dateForCachedOccurrencesInSection:(int64_t)a3
{
  return [(CUIKCalendarModel *)self dateForCachedOccurrencesInSection:a3 usingFilter:0];
}

- (id)cachedSpecialDayDataForSection:(int64_t)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl()
    && (uint64_t v5 = [(CUIKCalendarModel *)self numberOfCachedOccurrencesInSection:a3 usingFilter:0], v5 >= 1))
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      v17[0] = a3;
      v17[1] = v7;
      id v8 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v17 length:2];
      id v9 = [(CUIKCalendarModel *)self cachedOccurrenceAtIndexPath:v8 usingFilter:0];
      uint64_t v10 = [v9 specialDayType];
      if ((v10 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_6;
      }
    }
    uint64_t v13 = v10;
    uint64_t v11 = objc_alloc_init(CUIKCalendarSpecialDayData);
    [(CUIKCalendarSpecialDayData *)v11 setDayType:v13];
    uint64_t v14 = [v9 calendar];
    -[CUIKCalendarSpecialDayData setCgColor:](v11, "setCgColor:", [v14 CGColor]);

    int v15 = [v9 calendar];
    BOOL v16 = [v15 locale];
    [(CUIKCalendarSpecialDayData *)v11 setLocale:v16];
  }
  else
  {
LABEL_6:
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)cachedOccurrenceAtIndexPath:(id)a3 usingFilter:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 length] != 2)
  {
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CUIKCalendarModel.m", 1173, @"Invalid index path passed to -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:]: %@", v7 object file lineNumber description];
  }
  uint64_t v8 = [v7 indexAtPosition:0];
  uint64_t v9 = [v7 indexAtPosition:1];
  int64_t v10 = [(CUIKCalendarModel *)self _cachedFakeTodayIndexLocked];
  uint64_t v11 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:v4];
  if (v7)
  {
    if ((v10 & 0x8000000000000000) == 0 && v8 > v10)
    {
      v16[0] = v8 - 1;
      v16[1] = v9;
      uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v16 length:2];

      id v7 = (id)v12;
    }
    uint64_t v13 = [v11 cachedOccurrenceAtIndexPath:v7];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_dataSourceUsingFilter:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int64_t v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CUIKCalendarModel__dataSourceUsingFilter___block_invoke;
  v5[3] = &unk_1E636A260;
  v5[4] = &v7;
  BOOL v6 = a3;
  [(CUIKCalendarModel *)self _executeBlockWithOccurrenceCacheDataSources:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)_executeBlockWithOccurrenceCacheDataSources:(id)a3
{
  p_dataSourceLock = &self->_dataSourceLock;
  uint64_t v5 = (void (**)(id, id, CUIKOccurrenceCacheDataSourceProtocol *))a3;
  os_unfair_lock_lock(p_dataSourceLock);
  occurrenceCacheDataSource = self->_occurrenceCacheDataSource;
  uint64_t v7 = self->_occurrenceCacheFilteredDataSource;
  uint64_t v8 = occurrenceCacheDataSource;
  os_unfair_lock_unlock(p_dataSourceLock);
  v5[2](v5, v8, v7);
}

void __44__CUIKCalendarModel__dataSourceUsingFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    a2 = a3;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)_cachedFakeTodayIndexLocked
{
  p_cachedFakeTodayIndexLock = &self->_cachedFakeTodayIndexLock;
  os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
  int64_t cachedFakeTodayIndex = self->_cachedFakeTodayIndex;
  os_unfair_lock_unlock(p_cachedFakeTodayIndexLock);
  return cachedFakeTodayIndex;
}

void __47__CUIKCalendarModel_cachedOccurrencesAreLoaded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if ([a2 cachedOccurrencesAreLoaded]) {
    char v5 = 1;
  }
  else {
    char v5 = [v6 cachedOccurrencesAreLoaded];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
}

- (int64_t)numberOfCachedOccurrencesInSection:(int64_t)a3 usingFilter:(BOOL)a4
{
  id v6 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:a4];
  int64_t v7 = [(CUIKCalendarModel *)self _cachedFakeTodayIndexLocked];
  int64_t v8 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v7 != a3)
  {
    BOOL v10 = v7 >= 0 && v7 < a3;
    int64_t v8 = [v6 countOfOccurrencesAtDayIndex:a3 - v10];
  }

  return v8;
}

void __58__CUIKCalendarModel__invalidateOccurrenceCacheDataSources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 invalidate];
  [v4 invalidate];
}

uint64_t __49__CUIKCalendarModel__invalidateCachedOccurrences__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidateCachedOccurrences];
}

- (CUIKUndoManager)undoManager
{
  return self->_undoManager;
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6
{
  return [(CUIKEventLoader *)self->_eventLoader occurrencesForStartDate:a3 endDate:a4 preSorted:a5 waitForLoad:a6 isComplete:0];
}

- (void)setShowDayAsList:(BOOL)a3
{
  BOOL v3 = a3;
  if (CUIKShouldSaveStateInPreferences())
  {
    id v8 = +[CUIKPreferences sharedPreferences];
    [v8 setShowListView:v3];
  }
  else
  {
    char v5 = [(CUIKCalendarModel *)self persistedSceneState];
    int v6 = [v5 showDayAsList];

    if (v6 == v3) {
      return;
    }
    int64_t v7 = [(CUIKCalendarModel *)self persistedSceneState];
    [v7 setShowDayAsList:v3];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"CalendarModelDayListDisplaySettingChangedNotification" object:self];
  }
}

- (void)setNumDaysToShow:(int64_t)a3
{
  if (CUIKShouldSaveStateInPreferences())
  {
    id v8 = +[CUIKPreferences sharedPreferences];
    [v8 setNumDaysToShow:a3];
  }
  else
  {
    char v5 = [(CUIKCalendarModel *)self persistedSceneState];
    uint64_t v6 = [v5 numDaysToShow];

    if (v6 == a3) {
      return;
    }
    int64_t v7 = [(CUIKCalendarModel *)self persistedSceneState];
    [v7 setNumDaysToShow:a3];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"CalendarModelTwoDayDisplaySettingChangedNotification" object:self];
  }
}

- (id)persistedSceneState
{
  if (CUIKShouldSaveStateInPreferences())
  {
    BOOL v3 = 0;
  }
  else
  {
    persistedSceneState = self->_persistedSceneState;
    if (!persistedSceneState)
    {
      char v5 = objc_alloc_init(CUIKCalendarModelSceneState);
      uint64_t v6 = self->_persistedSceneState;
      self->_persistedSceneState = v5;

      persistedSceneState = self->_persistedSceneState;
    }
    BOOL v3 = persistedSceneState;
  }

  return v3;
}

- (BOOL)showMonthAsDivided
{
  if (CUIKShouldSaveStateInPreferences())
  {
    BOOL v3 = +[CUIKPreferences sharedPreferences];
    char v4 = [v3 showMonthDividedListView];
  }
  else
  {
    BOOL v3 = [(CUIKCalendarModel *)self persistedSceneState];
    char v4 = [v3 showMonthAsDivided];
  }
  BOOL v5 = v4;

  return v5;
}

- (int64_t)numDaysToShow
{
  if (CUIKShouldSaveStateInPreferences()) {
    +[CUIKPreferences sharedPreferences];
  }
  else {
  BOOL v3 = [(CUIKCalendarModel *)self persistedSceneState];
  }
  int64_t v4 = [v3 numDaysToShow];

  return v4;
}

- (BOOL)showDayAsList
{
  if (CUIKShouldSaveStateInPreferences())
  {
    BOOL v3 = +[CUIKPreferences sharedPreferences];
    char v4 = [v3 showListView];
  }
  else
  {
    BOOL v3 = [(CUIKCalendarModel *)self persistedSceneState];
    char v4 = [v3 showDayAsList];
  }
  BOOL v5 = v4;

  return v5;
}

- (CUIKCalendarModel)initWithDataPath:(id)a3 pasteboardManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CUIKCalendarModel;
  id v8 = [(CUIKCalendarModel *)&v15 init];
  if (v8)
  {
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()) {
      uint64_t v9 = 8256;
    }
    else {
      uint64_t v9 = 64;
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:v9 path:v6 changeTrackingClientId:0 enablePropertyModificationLogging:1 allowDelegateSources:1];
    eventStore = v8->_eventStore;
    v8->_eventStore = (EKEventStore *)v10;

    id v12 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
    [(EKEventStore *)v8->_eventStore setTimeZone:v12];

    if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp])
    {
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
      [MEMORY[0x1E4F1CAF0] setDefaultTimeZone:v13];
    }
    [(CUIKCalendarModel *)v8 _performCommonInitializationWithPasteboardManager:v7];
  }

  return v8;
}

- (BOOL)containsDelegateSources
{
  return [(NSArray *)self->_delegateSources count] != 0;
}

- (EKCalendarDate)selectedDate
{
  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  char v4 = (void *)[(EKCalendarDate *)self->_selectedDate copy];
  os_unfair_lock_unlock(p_selectedDateLock);

  return (EKCalendarDate *)v4;
}

- (void)_setFocusFilterMode:(unint64_t)a3 force:(BOOL)a4
{
  [(NSLock *)self->_filterLock lock];
  if (a4 || self->_focusFilterMode != a3)
  {
    self->_focusFilterMode = a3;
    BOOL v8 = [(CUIKCalendarModel *)self _setSelectedCalendars:self->_selectedCalendars];
    [(NSLock *)self->_filterLock unlock];
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"CalendarModelFocusModeConfigurationChangedNotification" object:self];

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"CalendarModelNotificationCountsChangedNotification" object:self];

    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"CalendarModelNotificationsChangedNotification" object:self];

    if (v8)
    {
      [(CUIKCalendarModel *)self postSelectedCalendarsChanged];
    }
  }
  else
  {
    filterLock = self->_filterLock;
    [(NSLock *)filterLock unlock];
  }
}

- (void)setFocusFilterMode:(unint64_t)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  if (_os_feature_enabled_impl()
    && ![(CUIKCalendarModel *)self disableFocusFiltering])
  {
    [(CUIKCalendarModel *)self _setFocusFilterMode:a3 force:v4];
  }
}

- (EKCalendarDate)selectedDay
{
  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  BOOL v4 = [(EKCalendarDate *)self->_selectedDate calendarDateForDay];
  os_unfair_lock_unlock(p_selectedDateLock);

  return (EKCalendarDate *)v4;
}

- (BOOL)_setSelectedCalendars:(id)a3
{
  id v4 = a3;
  if (![(NSSet *)self->_selectedCalendars isEqualToSet:v4])
  {
    BOOL v5 = (NSSet *)[v4 copy];
    selectedCalendars = self->_selectedCalendars;
    self->_selectedCalendars = v5;
  }
  id v7 = v4;
  BOOL v8 = v7;
  if (self->_focusFilterMode == 1)
  {
    BOOL v8 = [(CUIKCalendarModel *)self _calendarsEnabledInFocus:v7];
  }
  eventLoader = self->_eventLoader;
  uint64_t v10 = [(CUIKCalendarModel *)self _calendarsForCurrentIdentityFromCalendars:v8 lock:0];
  LOBYTE(eventLoader) = [(CUIKEventLoader *)eventLoader setSelectedCalendars:v10];

  [(CUIKCalendarModel *)self _loadVisibleCalendarsIfNeeded];
  return (char)eventLoader;
}

- (void)setUnselectedCalendars:(id)a3
{
  filterLock = self->_filterLock;
  id v5 = a3;
  [(NSLock *)filterLock lock];
  [(CUIKCalendarModel *)self _loadVisibleCalendarsIfNeeded];
  id v6 = [MEMORY[0x1E4F1CA80] setWithArray:self->_visibleCalendars];
  [v6 minusSet:v5];

  LODWORD(filterLock) = [(CUIKCalendarModel *)self _setSelectedCalendars:v6];
  [(NSLock *)self->_filterLock unlock];
  if (filterLock) {
    [(CUIKCalendarModel *)self postSelectedCalendarsChanged];
  }
}

- (void)_loadVisibleCalendarsIfNeeded
{
  if (!self->_visibleCalendars)
  {
    id v5 = [(EKEventStore *)self->_eventStore calendarsForEntityType:0];
    BOOL v3 = (NSArray *)[v5 copy];
    visibleCalendars = self->_visibleCalendars;
    self->_visibleCalendars = v3;
  }
}

uint64_t __75__CUIKCalendarModel_eventNotificationReferencesForIdentity_ignoringFilter___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 notification];
  if (*(unsigned char *)(a1 + 48) || [*(id *)(a1 + 32) _shouldShowNotification:v3])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [v3 source];
    id v6 = v5;
    if (v4)
    {
      id v7 = [v5 externalID];
      BOOL v8 = [*(id *)(a1 + 40) externalID];
      uint64_t v9 = [v7 isEqualToString:v8];
    }
    else
    {
      uint64_t v9 = [v5 isDelegate] ^ 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldShowNotification:(id)a3
{
  id v4 = a3;
  if ([(CUIKCalendarModel *)self focusFilterMode] == 1)
  {
    id v5 = [(CUIKCalendarModel *)self unselectedCalendarsForFocusMode];
    char v6 = objc_msgSend(v4, "cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:", v5);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)_createOccurrenceCacheDataSources
{
  BOOL v3 = [(CUIKCalendarModel *)self selectedCalendars];
  id v10 = [(CUIKCalendarModel *)self calendarsForCurrentIdentityFromCalendars:v3];

  os_unfair_lock_lock(&self->_dataSourceLock);
  id v4 = [[CUIKOccurrenceCacheDataSource alloc] initWithEventStore:self->_eventStore calendars:v10];
  occurrenceCacheDataSource = self->_occurrenceCacheDataSource;
  self->_occurrenceCacheDataSource = (CUIKOccurrenceCacheDataSourceProtocol *)v4;

  char v6 = [[CUIKOccurrenceCacheSearchDataSource alloc] initWithEventStore:self->_eventStore calendars:v10];
  occurrenceCacheFilteredDataSource = self->_occurrenceCacheFilteredDataSource;
  self->_occurrenceCacheFilteredDataSource = (CUIKOccurrenceCacheDataSourceProtocol *)v6;

  BOOL v8 = self->_occurrenceCacheFilteredDataSource;
  os_unfair_lock_unlock(&self->_dataSourceLock);
  if ([(CUIKCalendarModel *)self searchingOccurrences])
  {
    uint64_t v9 = [(CUIKCalendarModel *)self searchString];
    [(CUIKOccurrenceCacheDataSourceProtocol *)v8 searchWithTerm:v9];
  }
}

- (BOOL)searchingOccurrences
{
  char v2 = [(CUIKCalendarModel *)self searchString];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)searchString
{
  [(NSLock *)self->_filterLock lock];
  BOOL v3 = (void *)[(NSString *)self->_searchString copy];
  [(NSLock *)self->_filterLock unlock];

  return (NSString *)v3;
}

- (id)defaultCalendarForNewEvents
{
  BOOL v3 = [(CUIKCalendarModel *)self selectedCalendars];
  id v4 = [(CUIKCalendarModel *)self calendarsForCurrentIdentityFromCalendars:v3];

  if ([v4 count] == 1)
  {
    id v5 = [v4 anyObject];
    if ([v5 allowsContentModifications])
    {
      if (v5) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  eventStore = self->_eventStore;
  id v7 = [(CUIKCalendarModel *)self sourceForSelectedIdentity];
  id v5 = [(EKEventStore *)eventStore defaultCalendarForNewEventsInDelegateSource:v7];

LABEL_7:

  return v5;
}

- (EKSource)sourceForSelectedIdentity
{
  return self->_sourceForSelectedIdentity;
}

- (id)_calendarsForCurrentIdentityFromCalendars:(id)a3 lock:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v4) {
    [(NSLock *)self->_filterLock lock];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
        sourceForSelectedIdentity = self->_sourceForSelectedIdentity;
        objc_super v15 = objc_msgSend(v13, "source", (void)v22);
        BOOL v16 = v15;
        if (sourceForSelectedIdentity)
        {
          char v17 = [(EKSource *)sourceForSelectedIdentity isEqual:v15];

          if ((v17 & 1) == 0) {
            goto LABEL_11;
          }
LABEL_10:
          [v7 addObject:v13];
          goto LABEL_11;
        }
        uint64_t v18 = [v15 isDelegate];

        if ((v18 & 1) == 0) {
          goto LABEL_10;
        }
LABEL_11:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v10 = v19;
    }
    while (v19);
  }

  if (v4) {
    [(NSLock *)self->_filterLock unlock];
  }
  int64_t v20 = -[CUIKCalendarModel _calendarsExcludingLockedReminder:](self, "_calendarsExcludingLockedReminder:", v7, (void)v22);

  return v20;
}

- (id)_calendarsExcludingLockedReminder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F25490] isReminderAppLocked])
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "type", (void)v12) == 6) {
            [v4 removeObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (NSSet)selectedCalendars
{
  [(NSLock *)self->_filterLock lock];
  id v3 = self->_selectedCalendars;
  id v4 = [(CUIKCalendarModel *)self _calendarsEnabledInFocus:v3];
  id v5 = [(CUIKCalendarModel *)self _calendarsExcludingLockedReminder:v4];
  [(NSLock *)self->_filterLock unlock];

  return (NSSet *)v5;
}

- (unint64_t)focusFilterMode
{
  if (!_os_feature_enabled_impl()
    || [(CUIKCalendarModel *)self disableFocusFiltering])
  {
    return 0;
  }
  [(NSLock *)self->_filterLock lock];
  unint64_t focusFilterMode = self->_focusFilterMode;
  [(NSLock *)self->_filterLock unlock];
  return focusFilterMode;
}

- (BOOL)disableFocusFiltering
{
  return self->_disableFocusFiltering;
}

- (id)_calendarsEnabledInFocus:(id)a3
{
  id v4 = a3;
  if ([v4 count] && self->_focusFilterMode == 1)
  {
    id v5 = [(CUIKCalendarModel *)self _unselectedCalendarsForFocusMode];
    if ([v5 count])
    {
      uint64_t v6 = (void *)[v4 mutableCopy];
      [v6 minusSet:v5];
      id v7 = (id)[v6 copy];
    }
    else
    {
      id v7 = v4;
    }
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)calendarsForCurrentIdentityFromCalendars:(id)a3
{
  return [(CUIKCalendarModel *)self _calendarsForCurrentIdentityFromCalendars:a3 lock:1];
}

- (void)setAllowEventLocationPrediction:(BOOL)a3
{
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void)setFocusFilterMode:(unint64_t)a3
{
}

- (void)setDesiredPaddingDays:(unsigned int)a3
{
}

- (void)setComponentForExpandingPadding:(unint64_t)a3
{
}

- (void)setAutoStartNotificationMonitor:(BOOL)a3
{
  self->_autoStartNotificationMonitor = a3;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3
{
  return [(CUIKCalendarModel *)self sectionForCachedOccurrencesOnDate:a3 sectionExistsForDay:0];
}

- (int64_t)numberOfDaysWithCachedOccurrences
{
  return [(CUIKCalendarModel *)self numberOfDaysWithCachedOccurrencesUsingFilter:0];
}

- (NSSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (int64_t)displayableAccountErrorsForSource:(id)a3
{
  id v4 = a3;
  if (!self->_displayableAccountErrorCounts) {
    [(CUIKCalendarModel *)self countSourcesWithErrors];
  }
  uint64_t v5 = [v4 sourceIdentifier];
  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  else {
    uint64_t v6 = &stru_1F187C430;
  }
  id v7 = [(NSMutableDictionary *)self->_displayableAccountErrorCounts objectForKeyedSubscript:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

- (BOOL)countSourcesWithErrors
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  char v28 = (NSMutableDictionary *)objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  BOOL v26 = self;
  id v3 = [(EKEventStore *)self->_eventStore eventSources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    unint64_t v7 = 0x1E6368000uLL;
    unint64_t v8 = 0x1E4F57000uLL;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(v8 + 1616), "severityForError:", objc_msgSend(*(id *)(v7 + 3184), "errorForSource:", v10)) == 2)
        {
          if ([v10 sourceType] == 4)
          {
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            uint64_t v11 = [v10 allCalendars];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v12)
            {
              unint64_t v13 = v8;
              long long v14 = v3;
              unint64_t v15 = v7;
              uint64_t v16 = *(void *)v30;
              while (2)
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v30 != v16) {
                    objc_enumerationMutation(v11);
                  }
                  if (![*(id *)(*((void *)&v29 + 1) + 8 * j) isSubscribedHolidayCalendar])
                  {
                    LODWORD(v12) = 1;
                    goto LABEL_19;
                  }
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
LABEL_19:
              unint64_t v7 = v15;
              id v3 = v14;
              unint64_t v8 = v13;
              uint64_t v6 = v27;
            }
          }
          else
          {
            LODWORD(v12) = 1;
          }
          uint64_t v18 = [v10 externalID];
          if (v18)
          {
          }
          else if ([v10 sourceType] == 5)
          {
            LODWORD(v12) = 0;
          }
          if ([v10 isEnabled] && v12)
          {
            uint64_t v19 = &stru_1F187C430;
            if ([v10 isDelegate])
            {
              uint64_t v19 = [v10 sourceIdentifier];
            }
            int64_t v20 = [(NSMutableDictionary *)v28 objectForKeyedSubscript:v19];
            uint64_t v21 = [v20 integerValue];

            long long v22 = [NSNumber numberWithInteger:v21 + 1];
            [(NSMutableDictionary *)v28 setObject:v22 forKeyedSubscript:v19];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v5);
  }

  char v23 = [(NSMutableDictionary *)v26->_displayableAccountErrorCounts isEqualToDictionary:v28];
  displayableAccountErrorCounts = v26->_displayableAccountErrorCounts;
  v26->_displayableAccountErrorCounts = v28;

  return v23 ^ 1;
}

+ (unint64_t)errorForSource:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 lastSyncError];
  os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
  if (_objectsWithIgnoredErrors)
  {
    uint64_t v6 = [v4 objectID];
    if (v6)
    {
      unint64_t v7 = [(id)_objectsWithIgnoredErrors objectForKeyedSubscript:v6];
    }
    else
    {
      unint64_t v7 = 0;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
    if (v7)
    {
      unint64_t v8 = [v4 lastSyncEndDate];
      if (v8 && [v7 isEqualToDate:v8] && objc_msgSend(v4, "lastSyncError") == 2) {
        unint64_t v5 = 0;
      }
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
  }
  if (!v5) {
    unint64_t v5 = [a1 errorForSubscribedCalendarChildrenOfSource:v4];
  }

  return v5;
}

+ (unint64_t)errorForSubscribedCalendarChildrenOfSource:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 sourceType];
  if (v4 != 4 && v4 != 2)
  {
    unint64_t v16 = 0;
    goto LABEL_28;
  }
  [v3 calendarsForEntityType:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_8:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      if (!_objectsWithIgnoredErrors) {
        break;
      }
      uint64_t v12 = objc_msgSend(v11, "objectID", (void)v18);
      if (v12)
      {
        unint64_t v13 = [(id)_objectsWithIgnoredErrors objectForKeyedSubscript:v12];
      }
      else
      {
        unint64_t v13 = 0;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      if (!v13) {
        goto LABEL_21;
      }
      long long v14 = [v11 lastSyncEndDate];
      if (!v14 || ([v13 isEqualToDate:v14] & 1) == 0)
      {

        goto LABEL_21;
      }

LABEL_23:
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_8;
        }
        goto LABEL_25;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
    unint64_t v13 = 0;
LABEL_21:
    if (objc_msgSend(v11, "lastSyncError", (void)v18) == 7)
    {
      unint64_t v15 = [v11 lastSyncStartDate];

      if (v15)
      {

        unint64_t v16 = 7;
        goto LABEL_27;
      }
    }
    goto LABEL_23;
  }
LABEL_25:
  unint64_t v16 = 0;
LABEL_27:

LABEL_28:
  return v16;
}

- (int64_t)accountsInInitialSyncCount
{
  int64_t result = self->_initialAccountSyncCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t result = [(CUIKCalendarModel *)self countAccountsInInitialSync];
    self->_initialAccountSyncCount = result;
  }
  return result;
}

- (int64_t)countAccountsInInitialSync
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v2 = [(EKEventStore *)self->_eventStore sources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isSyncing])
        {
          uint64_t v9 = [v8 lastSyncEndDate];

          if (!v9) {
            ++v5;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

uint64_t __61__CUIKCalendarModel_locationPrecisionDeterminedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowEventLocationPrediction:1];
}

- (void)setPendingReminderTracker:(id)a3
{
}

- (CUIKCalendarModel)initWithPasteboardManager:(id)a3
{
  return [(CUIKCalendarModel *)self initWithDataPath:0 pasteboardManager:a3];
}

- (void)startNotificationMonitor
{
  if (!self->_notificationMonitorSetUp)
  {
    self->_notificationMonitorSetUp = 1;
    uint64_t v3 = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__CUIKCalendarModel_startNotificationMonitor__block_invoke;
    block[3] = &unk_1E6369C50;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (CUIKCalendarModel)initWithEventStore:(id)a3 pasteboardManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKCalendarModel;
  uint64_t v9 = [(CUIKCalendarModel *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    [(CUIKCalendarModel *)v10 _performCommonInitializationWithPasteboardManager:v8];
  }

  return v10;
}

void __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"CalendarModelDisplayedOccurrencesChangedNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __71__CUIKCalendarModel__performCommonInitializationWithPasteboardManager___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 selectedCalendarsIgnoringFocus];
  [v1 setSelectedCalendars:v2];
}

id __38__CUIKCalendarModel__setupUndoManager__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dealloc
{
  [(_EKNotificationMonitor *)self->_notificationMonitor stop];
  [(CUIKCalendarModel *)self _invalidateOccurrenceCacheDataSources];
  notify_cancel(self->_apHiddenNotificationToken);
  self->_apHiddenNotificationToken = -1;
  notify_cancel(self->_apLockedNotificationToken);
  self->_apLockedNotificationToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)CUIKCalendarModel;
  [(CUIKCalendarModel *)&v3 dealloc];
}

- (NSSet)selectedCalendarsIgnoringFocus
{
  [(NSLock *)self->_filterLock lock];
  objc_super v3 = self->_selectedCalendars;
  [(NSLock *)self->_filterLock unlock];

  return v3;
}

- (id)allCalendarsForCurrentIdentity
{
  objc_super v3 = [(CUIKCalendarModel *)self sourceForSelectedIdentity];
  if (v3)
  {
    uint64_t v4 = [(CUIKCalendarModel *)self sourceForSelectedIdentity];
    int64_t v5 = [v4 calendarsForEntityType:0];
  }
  else
  {
    [(NSLock *)self->_filterLock lock];
    [(CUIKCalendarModel *)self _loadVisibleCalendarsIfNeeded];
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_visibleCalendars];
    int64_t v5 = [(CUIKCalendarModel *)self _calendarsForCurrentIdentityFromCalendars:v4 lock:0];
    [(NSLock *)self->_filterLock unlock];
  }

  return v5;
}

- (id)_reminderCalendar
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self->_visibleCalendars;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v11) == 6)
        {
          id v9 = v8;

          int64_t v5 = v9;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSSet)unselectedCalendarsIgnoringFocus
{
  [(NSLock *)self->_filterLock lock];
  [(CUIKCalendarModel *)self _loadVisibleCalendarsIfNeeded];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] setWithArray:self->_visibleCalendars];
  [v3 minusSet:self->_selectedCalendars];
  [(NSLock *)self->_filterLock unlock];

  return (NSSet *)v3;
}

- (void)setDisableFocusFiltering:(BOOL)a3
{
  if (self->_disableFocusFiltering != a3)
  {
    self->_disableFocusFiltering = a3;
    if (a3) {
      [(CUIKCalendarModel *)self _setFocusFilterMode:0 force:0];
    }
  }
}

- (void)setSelectedCalendars:(id)a3
{
  filterLock = self->_filterLock;
  id v5 = a3;
  [(NSLock *)filterLock lock];
  LODWORD(filterLock) = [(CUIKCalendarModel *)self _setSelectedCalendars:v5];

  [(NSLock *)self->_filterLock unlock];
  if (filterLock)
  {
    [(CUIKCalendarModel *)self postSelectedCalendarsChanged];
  }
}

- (void)_focusModeConfigurationChanged:(id)a3
{
  [(NSLock *)self->_filterLock lock];
  self->_hasLoadedUnselectedCalendarsForFocusMode = 0;
  unselectedCalendarsForFocusMode = self->_unselectedCalendarsForFocusMode;
  self->_unselectedCalendarsForFocusMode = 0;

  id v5 = [(CUIKCalendarModel *)self _unselectedCalendarsForFocusMode];
  BOOL v6 = v5 != 0;

  [(NSLock *)self->_filterLock unlock];

  [(CUIKCalendarModel *)self setFocusFilterMode:v6 force:1];
}

- (void)setSelectedCalendarsAndRequestPreferenceSave:(id)a3 reason:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(CUIKCalendarModel *)self setSelectedCalendars:a3];
  id v9 = @"CalendarModelVisibleCalendarPreferenceRequiresSavingNotificationReasonKey";
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v8 postNotificationName:@"CalendarModelVisibleCalendarPreferenceRequiresSavingNotification" object:self userInfo:v7];
}

- (BOOL)_eventBelongsToCurrentIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(CUIKCalendarModel *)self sourceForSelectedIdentity];
  id v6 = [v4 calendar];

  id v7 = [v6 source];
  id v8 = v7;
  if (v5)
  {
    id v9 = [v7 sourceIdentifier];
    uint64_t v10 = [v5 sourceIdentifier];
    LOBYTE(v11) = [v9 isEqualToString:v10];
  }
  else
  {
    int v11 = [v7 isDelegate] ^ 1;
  }

  return v11;
}

- (void)updateSourceForSelectedIdentity:(id)a3 selectedCalendars:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isDelegate] & 1) == 0)
  {

    id v6 = 0;
  }
  [(CUIKCalendarModel *)self setSourceForSelectedIdentity:v6];
  id v8 = [(CUIKCalendarModel *)self selectedCalendarsIgnoringFocus];
  if (v7)
  {
    id v9 = (void *)MEMORY[0x1E4F28F60];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__CUIKCalendarModel_updateSourceForSelectedIdentity_selectedCalendars___block_invoke;
    v13[3] = &unk_1E636A1C8;
    id v14 = v6;
    uint64_t v10 = [v9 predicateWithBlock:v13];
    int v11 = [v8 filteredSetUsingPredicate:v10];

    uint64_t v12 = [v7 setByAddingObjectsFromSet:v11];

    id v8 = (void *)v12;
  }
  [(CUIKCalendarModel *)self setSelectedCalendars:v8];
}

uint64_t __71__CUIKCalendarModel_updateSourceForSelectedIdentity_selectedCalendars___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 source];
  id v5 = v4;
  if (*(void *)(a1 + 32))
  {
    id v6 = [v3 source];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)] ^ 1;
  }
  else
  {
    uint64_t v7 = [v4 isDelegate];
  }

  return v7;
}

- (void)setSearchString:(id)a3
{
  id v5 = a3;
  [(NSLock *)self->_filterLock lock];
  if (CalEqualStrings())
  {
    [(NSLock *)self->_filterLock unlock];
  }
  else
  {
    objc_storeStrong((id *)&self->_searchString, a3);
    [(NSLock *)self->_filterLock unlock];
    os_unfair_lock_lock(&self->_cachedFakeTodayIndexLock);
    int64_t v6 = -2;
    if (self->_searchString) {
      int64_t v6 = -1;
    }
    self->_int64_t cachedFakeTodayIndex = v6;
    os_unfair_lock_unlock(&self->_cachedFakeTodayIndexLock);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__CUIKCalendarModel_setSearchString___block_invoke;
    v7[3] = &unk_1E636A1F0;
    id v8 = v5;
    [(CUIKCalendarModel *)self _executeBlockWithOccurrenceCacheDataSources:v7];
  }
}

void __37__CUIKCalendarModel_setSearchString___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  if ([v4 length]) {
    [v5 searchWithTerm:*(void *)(a1 + 32)];
  }
  else {
    [v5 invalidate];
  }
}

- (BOOL)selectedOccurrenceIsSearchMatch
{
  id v2 = [(CUIKCalendarModel *)self searchString];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setSourceForSelectedIdentity:(id)a3
{
  id v9 = (EKSource *)a3;
  [(NSLock *)self->_filterLock lock];
  sourceForSelectedIdentity = self->_sourceForSelectedIdentity;
  if (sourceForSelectedIdentity != v9) {
    objc_storeStrong((id *)&self->_sourceForSelectedIdentity, a3);
  }
  [(NSLock *)self->_filterLock unlock];
  int64_t v6 = [(CUIKCalendarModel *)self selectedOccurrence];
  BOOL v7 = [(CUIKCalendarModel *)self _eventBelongsToCurrentIdentity:v6];

  if (!v7) {
    [(CUIKCalendarModel *)self setSelectedOccurrence:0];
  }
  if (sourceForSelectedIdentity != v9)
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"CalendarModelIdentityChangedNotification" object:self];
  }
}

- (NSArray)sortedEnabledDelegates
{
  return self->_delegateSources;
}

- (BOOL)allowEventLocationPrediction
{
  return [(CUIKEventLoader *)self->_eventLoader allowEventLocationPrediction];
}

- (id)_unselectedCalendarsForFocusMode
{
  if (_os_feature_enabled_impl())
  {
    if (!self->_hasLoadedUnselectedCalendarsForFocusMode)
    {
      BOOL v3 = (void *)MEMORY[0x1E4F254E8];
      id v4 = [(CUIKCalendarModel *)self eventStore];
      id v5 = [v3 unselectedCalendarsForFocusModeInEventStore:v4];
      unselectedCalendarsForFocusMode = self->_unselectedCalendarsForFocusMode;
      self->_unselectedCalendarsForFocusMode = v5;

      self->_hasLoadedUnselectedCalendarsForFocusMode = 1;
    }
    BOOL v7 = self->_unselectedCalendarsForFocusMode;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSSet)unselectedCalendarsForFocusMode
{
  [(NSLock *)self->_filterLock lock];
  BOOL v3 = [(CUIKCalendarModel *)self _unselectedCalendarsForFocusMode];
  [(NSLock *)self->_filterLock unlock];

  return (NSSet *)v3;
}

- (int64_t)readWriteCalendarCount
{
  return (int)[(EKEventStore *)self->_eventStore readWriteCalendarCountForEntityType:0];
}

- (void)ensureCalendarVisibleWithId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EKEventStore *)self->_eventStore calendarWithID:v4];
  if (v5)
  {
    int64_t v6 = [(CUIKCalendarModel *)self selectedCalendars];
    char v7 = [v6 containsObject:v5];

    if ((v7 & 1) == 0)
    {
      id v8 = [NSString stringWithFormat:@"ensuring a certain calendar %@ is visible", v4];
      id v9 = [(NSSet *)self->_selectedCalendars setByAddingObject:v5];
      [(CUIKCalendarModel *)self setSelectedCalendarsAndRequestPreferenceSave:v9 reason:v8];
    }
    uint64_t v10 = [v5 source];
    [(CUIKCalendarModel *)self updateSourceForSelectedIdentity:v10 selectedCalendars:0];

    if ([(CUIKCalendarModel *)self focusFilterMode] == 1)
    {
      int v11 = [(CUIKCalendarModel *)self unselectedCalendarsForFocusMode];
      int v12 = [v11 containsObject:v5];

      if (v12)
      {
        long long v13 = +[CUIKLogSubsystem defaultCategory];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v5 title];
          unint64_t v15 = [v5 calendarIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v17 = v14;
          __int16 v18 = 2114;
          long long v19 = v15;
          _os_log_impl(&dword_1BDF08000, v13, OS_LOG_TYPE_INFO, "Disabling focus filter to ensure that calendar %@ (%{public}@) is visible", buf, 0x16u);
        }
        [(CUIKCalendarModel *)self setFocusFilterMode:2];
      }
    }
  }
}

- (BOOL)isCalendarVisibleWithID:(id)a3
{
  id v4 = [(EKEventStore *)self->_eventStore calendarWithID:a3];
  id v5 = [(CUIKCalendarModel *)self selectedCalendars];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)reminderCalendar
{
  BOOL v3 = [(CUIKCalendarModel *)self sourceForSelectedIdentity];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(EKEventStore *)self->_eventStore reminderIntegrationCalendar];
  }

  return v4;
}

- (id)refreshAccountListIfNeeded:(BOOL)a3
{
  return (id)[(EKEventStore *)self->_eventStore refreshFolderListsIfNecessary:a3];
}

- (id)refreshCalendarDataIfNeeded:(BOOL)a3
{
  return (id)[(EKEventStore *)self->_eventStore refreshSourcesIfNecessary:a3];
}

- (void)setSelectedDateChangesDelayedUntilAfterTransition:(BOOL)a3
{
  if (self->_suspendSelectedDateChanges != a3)
  {
    self->_suspendSelectedDateChanges = a3;
    if (!a3 && self->_suspendedSelectedDate) {
      -[CUIKCalendarModel setSelectedDate:](self, "setSelectedDate:");
    }
    suspendedSelectedDate = self->_suspendedSelectedDate;
    self->_suspendedSelectedDate = 0;
  }
}

- (void)updateSelectedDateTimeZone
{
  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  id v4 = [(NSCalendar *)self->_calendar timeZone];
  id v5 = [(EKCalendarDate *)self->_selectedDate timeZone];
  char v6 = [v4 isEqualToTimeZone:v5];

  if ((v6 & 1) == 0)
  {
    char v7 = (void *)MEMORY[0x1E4F57838];
    id v8 = [(EKCalendarDate *)self->_selectedDate date];
    id v9 = [(NSCalendar *)self->_calendar timeZone];
    uint64_t v10 = [v7 calendarDateWithDate:v8 timeZone:v9];
    selectedDate = self->_selectedDate;
    self->_selectedDate = v10;
  }

  os_unfair_lock_unlock(p_selectedDateLock);
}

- (void)addOccurrenceAwaitingRefresh:(id)a3
{
}

- (void)addOccurrenceAwaitingDeletion:(id)a3
{
}

- (id)selectedDateOccurrences:(BOOL)a3 loadIsComplete:(BOOL *)a4
{
  BOOL v5 = a3;
  p_selectedDateLock = &self->_selectedDateLock;
  os_unfair_lock_lock(&self->_selectedDateLock);
  id v8 = [(EKCalendarDate *)self->_selectedDate dayComponents];
  os_unfair_lock_unlock(p_selectedDateLock);
  id v9 = [v8 CalDateComponentsForDateOnly];

  uint64_t v10 = [v9 CalDateComponentsForEndOfDay];
  int v11 = [(NSCalendar *)self->_calendar dateFromComponents:v9];
  int v12 = [(NSCalendar *)self->_calendar dateFromComponents:v10];
  long long v13 = [(CUIKEventLoader *)self->_eventLoader occurrencesForStartDate:v11 endDate:v12 preSorted:1 waitForLoad:v5 isComplete:a4];
  id v14 = [v13 occurrences];

  return v14;
}

- (id)occurrencesForStartDay:(id)a3 endDay:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  int v11 = [a3 CalDateComponentsForDateOnly];
  int v12 = [v10 CalDateComponentsForEndOfDay];

  long long v13 = [(EKEventStore *)self->_eventStore timeZone];
  id v14 = EKDateComponentsGetDate();

  unint64_t v15 = [(EKEventStore *)self->_eventStore timeZone];
  uint64_t v16 = EKDateComponentsGetDate();

  uint64_t v17 = [(CUIKCalendarModel *)self occurrencesForStartDate:v14 endDate:v16 preSorted:v7 waitForLoad:v6];

  return v17;
}

- (id)occurrencesForDay:(id)a3 waitForLoad:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [a3 CalDateComponentsForDateOnly];
  BOOL v7 = [v6 CalDateComponentsForEndOfDay];
  id v8 = [(NSCalendar *)self->_calendar dateFromComponents:v6];
  id v9 = [(NSCalendar *)self->_calendar dateFromComponents:v7];
  id v10 = [(CUIKCalendarModel *)self occurrencesForStartDate:v8 endDate:v9 preSorted:1 waitForLoad:v4];

  return v10;
}

- (double)_tomorrow
{
  calendar = self->_calendar;
  BOOL v4 = CUIKTodayDate();
  BOOL v5 = [(NSCalendar *)calendar components:30 fromDate:v4];

  BOOL v6 = [(NSCalendar *)self->_calendar dateFromComponents:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v7 setDay:1];
  id v8 = [(NSCalendar *)self->_calendar dateByAddingComponents:v7 toDate:v6 options:0];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  return v10;
}

- (id)closestOccurrenceToTomorrowForEventObjectID:(id)a3
{
  eventStore = self->_eventStore;
  id v5 = a3;
  [(CUIKCalendarModel *)self _tomorrow];
  BOOL v6 = -[EKEventStore closestCachedOccurrenceToDate:forEventObjectID:prefersForwardSearch:](eventStore, "closestCachedOccurrenceToDate:forEventObjectID:prefersForwardSearch:", v5, 1);

  return v6;
}

- (BOOL)currentlyLocked
{
  return self->_modelLocked;
}

- (void)_occurrenceCacheChangedNotificationHandler
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(CUIKCalendarModel *)self _occurrenceCacheChanged];
  }
  else
  {
    [(CUIKCalendarModel *)self performSelectorOnMainThread:sel__occurrenceCacheChanged withObject:0 waitUntilDone:0];
  }
}

- (int64_t)numberOfCachedOccurrencesInSection:(int64_t)a3
{
  return [(CUIKCalendarModel *)self numberOfCachedOccurrencesInSection:a3 usingFilter:0];
}

- (id)cachedOccurrenceAtIndexPath:(id)a3
{
  return [(CUIKCalendarModel *)self cachedOccurrenceAtIndexPath:a3 usingFilter:0];
}

- (id)indexPathsForOccurrence:(id)a3 usingFilter:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v24 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:v4];
  id v7 = [v24 indexPathsForOccurrence:v6];
  uint64_t v8 = [(CUIKCalendarModel *)self _cachedFakeTodayIndexLocked];
  double v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v15 length] != 2)
        {
          long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:a2, self, @"CUIKCalendarModel.m", 1237, @"Invalid index path passed to -[CUIKCalendarModel cachedOccurrenceAtIndexPath:usingFilter:]: %@", v15 object file lineNumber description];
        }
        uint64_t v16 = [v15 indexAtPosition:0];
        uint64_t v17 = [v15 indexAtPosition:1];
        if (v8 < 0 || v16 < v8) {
          uint64_t v19 = v16;
        }
        else {
          uint64_t v19 = v16 + 1;
        }
        v29[0] = v19;
        v29[1] = v17;
        uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v29 length:2];
        [v9 addObject:v20];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
  }

  return v9;
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3 usingFilter:(BOOL)a4
{
  return [(CUIKCalendarModel *)self _sectionForCachedOccurrencesOnDate:a3 sectionExistsForDay:0 usingFilter:a4];
}

- (void)fetchCachedDaysInBackgroundStartingFromSection:(int64_t)a3 usingFilter:(BOOL)a4
{
  id v5 = [(CUIKCalendarModel *)self _dataSourceUsingFilter:a4];
  [v5 fetchDaysInBackgroundStartingFromSection:a3];
}

- (id)cachedOccurrencesForSection:(int64_t)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CUIKCalendarModel *)self numberOfCachedOccurrencesInSection:a3 usingFilter:0];
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v12[0] = a3;
      v12[1] = i;
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v12 length:2];
      double v9 = [(CUIKCalendarModel *)self cachedOccurrenceAtIndexPath:v8 usingFilter:0];
      if (v9) {
        [v6 addObject:v9];
      }
    }
  }
  if ([v6 count]) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)_searchResultsAvailable:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"CalendarModelSearchResultsAvailable" object:self userInfo:v6];
}

void __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BOOL v3 = [v4 eventStore];

  if (v3) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __100__CUIKCalendarModel__processReloadForCacheOnly_includingCalendars_checkCalendarsValid_checkSources___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 eventStore];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = [*(id *)(a1 + 32) containsObject:v10];

    if ((v5 & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F255C8] shared];
      id v7 = [v6 deselectedCalendarIdentifiers];
      uint64_t v8 = [v10 calendarIdentifier];
      char v9 = [v7 containsObject:v8];

      if ((v9 & 1) == 0) {
        [*(id *)(a1 + 40) addObject:v10];
      }
    }
  }
}

- (void)_checkSources
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if ([(CUIKCalendarModel *)self countSourcesWithErrors]) {
    [v5 postNotificationName:@"CalendarModelAccountErrorCountChangedNotification" object:self];
  }
  int64_t v3 = [(CUIKCalendarModel *)self countAccountsInInitialSync];
  if (self->_initialAccountSyncCount != v3)
  {
    self->_initialAccountSyncCount = v3;
    [v5 postNotificationName:@"CalendarModelAccountsInInitialSyncCountChangedNotification" object:self];
  }
  id v4 = [(id)objc_opt_class() sortedEnabledDelegateSourcesFromStore:self->_eventStore];
  if (([v4 isEqualToArray:self->_delegateSources] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_delegateSources, v4);
    [v5 postNotificationName:@"CalendarModelDelegatesChangedNotification" object:self];
  }
}

uint64_t __59__CUIKCalendarModel_sortedEnabledDelegateSourcesFromStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

uint64_t __59__CUIKCalendarModel_sortedEnabledDelegateSourcesFromStore___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = CUIKDisplayedTitleForSource(a2, 1);
  id v6 = CUIKDisplayedTitleForSource(v4, 1);

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (void)simulateFirstLoadFinished
{
  if (![(CUIKEventLoader *)self->_eventLoader firstLoadBegan])
  {
    [(CUIKCalendarModel *)self _finishedFirstLoad];
  }
}

- (void)_notificationBlacklisted
{
  id v2 = [(CUIKCalendarModel *)self _notificationMonitor];
  [v2 attemptReloadSynchronously:1];
}

- (void)_eventStoreChanged:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F25458]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 == 2)
  {
    [(CUIKCalendarModel *)self _checkSources];
  }
  else
  {
    uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F25468]];
    if ([v7 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        char v11 = 0;
        char v12 = 0;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v8);
            }
            uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "entityType", (void)v19);
            if (v15 == 1)
            {
              char v12 = 1;
            }
            else if (v15 == 6)
            {
              char v11 = 1;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }
      else
      {
        char v11 = 0;
        char v12 = 0;
      }

      uint64_t v16 = v11 & 1;
      uint64_t v17 = v12 & 1;
    }
    else
    {
      uint64_t v16 = 1;
      uint64_t v17 = 1;
    }
    -[CUIKCalendarModel _processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:](self, "_processReloadForCacheOnly:includingCalendars:checkCalendarsValid:checkSources:", 0, v17, v17, v16, (void)v19);
    __int16 v18 = [(CUIKCalendarModel *)self _notificationMonitor];
    [v18 attemptReload];
  }
}

- (void)_ignoredErrorsChanged
{
  if ([(CUIKCalendarModel *)self countSourcesWithErrors])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"CalendarModelAccountErrorCountChangedNotification" object:self];
  }
}

- (void)_occurrenceCacheChanged
{
}

- (void)updateAfterAppResume
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithBool:CUIKInvalidateTodayAndDetermineIfChanged()];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = @"CalendarModelSignificantTimeChangeNotificationDayChangedKey";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 postNotificationName:@"CalendarModelSignificantTimeChangeNotification" object:self userInfo:v5];

  [(CUIKEventLoader *)self->_eventLoader loadIfNeeded];
}

- (void)prepareForAppSuspend
{
}

- (void)_tzSupportTodayRolledOver
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = @"CalendarModelSignificantTimeChangeNotificationDayChangedKey";
  v6[0] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 postNotificationName:@"CalendarModelSignificantTimeChangeNotification" object:self userInfo:v4];

  [(CUIKCalendarModel *)self _reloadEventsIfTodayChanged];
}

- (void)_significantTimeChange
{
  CFTimeZoneRef v3 = CFTimeZoneCopySystem();
  CalSetSystemTimeZone();
  CFRelease(v3);
  CUIKInvalidateToday();
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"CalendarModelSignificantTimeChangeNotification" object:self];

  [(CUIKCalendarModel *)self _reloadEventsIfTodayChanged];
}

- (void)_reloadEventsIfTodayChanged
{
  uint64_t v3 = CUIKTodayDate();
  lastKnownToday = self->_lastKnownToday;
  obuint64_t j = (id)v3;
  if (!lastKnownToday || !-[NSDate isEqualToDate:](lastKnownToday, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_lastKnownToday, obj);
    [(CUIKEventLoader *)self->_eventLoader dateChanged];
    [(CUIKCalendarModel *)self _occurrenceCacheChanged];
  }

  MEMORY[0x1F4181820]();
}

- (void)_sceneEnteredBackground:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 _sceneIdentifier];
  id v5 = [(CUIKCalendarModel *)self sceneIdentifier];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    self->_modelLocked = 1;
  }
}

- (void)_localeChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(CUIKCalendarModel *)self calendar];
  [v4 setLocale:v5];
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAF0], "calendarTimeZone", a3);
  [(EKEventStore *)self->_eventStore setTimeZone:v4];

  id v5 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  [(NSCalendar *)self->_calendar setTimeZone:v5];

  if ([MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp])
  {
    int v6 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
    [MEMORY[0x1E4F1CAF0] setDefaultTimeZone:v6];
  }
  [(CUIKEventLoader *)self->_eventLoader timeZoneChanged];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CalendarModelTimeZoneChangedNotification" object:self];

  [(CUIKCalendarModel *)self _processReloadForCacheOnly:0 includingCalendars:0 checkCalendarsValid:0 checkSources:0];
}

- (void)_systemWake
{
}

- (void)setSelectedOccurrences:(id)a3
{
}

- (void)selectOccurrences:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [(CUIKCalendarModel *)self _selectOccurrence:*(void *)(*((void *)&v11 + 1) + 8 * i) notify:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"CalendarModelSelectedOccurrencesChangedNotification" object:self];
    }
  }
}

- (void)selectOccurrence:(id)a3
{
}

- (BOOL)_selectOccurrence:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_modelLocked)
  {
    char v7 = 0;
    goto LABEL_9;
  }
  char v8 = [(NSMutableArray *)self->_selectedOccurrences containsObject:v6];
  if ((v8 & 1) == 0)
  {
    selectedOccurrences = self->_selectedOccurrences;
    if (selectedOccurrences)
    {
      [(NSMutableArray *)selectedOccurrences addObject:v6];
      if (!v4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    uint64_t v16 = self->_selectedOccurrences;
    self->_selectedOccurrences = v15;

    if (v4)
    {
LABEL_6:
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"CalendarModelSelectedOccurrencesChangedNotification" object:self];
    }
  }
LABEL_7:
  char v7 = v8 ^ 1;
  long long v11 = [v6 calendar];

  if (v11)
  {
    pasteboardManager = self->_pasteboardManager;
    long long v13 = [v6 calendar];
    [(CUIKPasteboardManager *)pasteboardManager setCalendarForPaste:v13];
  }
LABEL_9:

  return v7;
}

- (void)deselectOccurrences:(id)a3
{
}

- (void)deselectOccurrence:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CUIKCalendarModel deselectOccurrences:](self, "deselectOccurrences:", v6, v7, v8);
}

- (void)_deselectOccurrence:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v9 count:1];

  -[CUIKCalendarModel _deselectOccurrences:notify:](self, "_deselectOccurrences:notify:", v8, v4, v9, v10);
}

- (void)_deselectOccurrences:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!self->_modelLocked)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ([(NSMutableArray *)self->_selectedOccurrences containsObject:v13])
          {
            [(NSMutableArray *)self->_selectedOccurrences removeObject:v13];
            int v10 = 1;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
      if ((v4 & v10) == 1)
      {
        long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v14 postNotificationName:@"CalendarModelSelectedOccurrencesChangedNotification" object:self];
      }
    }
  }
}

- (void)setShowMonthAsDivided:(BOOL)a3
{
  BOOL v3 = a3;
  if (CUIKShouldSaveStateInPreferences())
  {
    id v8 = +[CUIKPreferences sharedPreferences];
    [v8 setShowMonthDividedListView:v3];
  }
  else
  {
    id v5 = [(CUIKCalendarModel *)self persistedSceneState];
    int v6 = [v5 showMonthAsDivided];

    if (v6 == v3) {
      return;
    }
    id v7 = [(CUIKCalendarModel *)self persistedSceneState];
    [v7 setShowMonthAsDivided:v3];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"CalendarModelMonthDividedDisplaySettingChangedNotification" object:self];
  }
}

- (BOOL)removeEvent:(id)a3 withSpan:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(CUIKUndoManager *)self->_undoManager undoableEditor];
    int v10 = [v9 deleteEvent:v8 span:a4 error:a5];

    if (v10)
    {
      LOBYTE(v10) = 1;
      if (!*a5) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  uint64_t v11 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CUIKCalendarModel removeEvent:withSpan:error:]((uint64_t *)a5, v11);
  }

LABEL_9:
  return v10;
}

- (BOOL)invitationBearingStoresExistForEvents
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int64_t invitationBearingStoresExist = self->_invitationBearingStoresExist;
  if (invitationBearingStoresExist == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_int64_t invitationBearingStoresExist = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    BOOL v4 = [(EKEventStore *)self->_eventStore eventSources];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (!v5) {
      goto LABEL_24;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v9 isEnabled])
        {
          int v10 = [v9 constraints];
          if ([v10 allowsEvents])
          {
            uint64_t v11 = [v9 constraints];
            int v12 = [v11 supportsIncomingInvitations];

            if (!v12) {
              continue;
            }
            long long v21 = 0u;
            long long v22 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            int v10 = objc_msgSend(v9, "calendarsForEntityType:", 0, 0);
            uint64_t v13 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v20;
              while (2)
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v20 != v15) {
                    objc_enumerationMutation(v10);
                  }
                  long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                  if (([v17 allowedEntityTypes] & 1) != 0 && (objc_msgSend(v17, "isHidden") & 1) == 0)
                  {
                    self->_int64_t invitationBearingStoresExist = 1;
                    goto LABEL_21;
                  }
                }
                uint64_t v14 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }
          }
LABEL_21:
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (!v6)
      {
LABEL_24:

        int64_t invitationBearingStoresExist = self->_invitationBearingStoresExist;
        return invitationBearingStoresExist != 0;
      }
    }
  }
  return invitationBearingStoresExist != 0;
}

- (void)_notificationsExpired:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"CalendarModelNotificationsChangedNotification" object:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"CalendarModelNotificationCountsChangedNotification" object:self];
}

- (unint64_t)allEventNotificationsCount
{
  id v2 = [(CUIKCalendarModel *)self _notificationMonitor];
  unint64_t v3 = [v2 notificationCount];

  return v3;
}

- (id)eventNotificationReferencesForCurrentIdentity
{
  return [(CUIKCalendarModel *)self _eventNotificationsForCurrentIdentityIgnoringFilter:0];
}

- (unint64_t)eventNotificationsForCurrentIdentityIgnoringFilterCount
{
  return [(CUIKCalendarModel *)self _eventNotificationCountForCurrentIdentityIgnoringFilter:1];
}

- (id)eventNotificationReferencesForCurrentIdentityIgnoringFilter
{
  return [(CUIKCalendarModel *)self _eventNotificationsForCurrentIdentityIgnoringFilter:1];
}

- (id)eventNotificationReferencesForIdentity:(id)a3
{
  return [(CUIKCalendarModel *)self eventNotificationReferencesForIdentity:a3 ignoringFilter:0];
}

+ (void)temporarilyIgnoreInvalidCredentialsErrorForSource:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 lastSyncError] == 2)
  {
    BOOL v4 = [v3 objectID];
    uint64_t v5 = [v3 lastSyncEndDate];
    uint64_t v6 = (void *)v5;
    if (v4 && v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      uint64_t v7 = (void *)_objectsWithIgnoredErrors;
      if (!_objectsWithIgnoredErrors)
      {
        uint64_t v8 = objc_opt_new();
        uint64_t v9 = (void *)_objectsWithIgnoredErrors;
        _objectsWithIgnoredErrors = v8;

        uint64_t v7 = (void *)_objectsWithIgnoredErrors;
      }
      [v7 setObject:v6 forKeyedSubscript:v4];
      os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"CalendarModelIgnoredErrorsChangedNotification" object:0];
    }
    else
    {
      int v10 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412802;
        id v12 = v3;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        __int16 v15 = 2112;
        long long v16 = v6;
        _os_log_error_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_ERROR, "Can't ignore invalid error for source (%@) because it either has no object ID (%@) or no sync end date (%@)", (uint8_t *)&v11, 0x20u);
      }
    }
  }
}

+ (void)temporarilyIgnoreInsecureConnectionErrorsForCalendars:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v5 = 138412802;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "lastSyncError", v17) == 7)
        {
          int v11 = [v10 objectID];
          uint64_t v12 = [v10 lastSyncEndDate];
          __int16 v13 = (void *)v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
            __int16 v15 = +[CUIKLogSubsystem defaultCategory];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              long long v23 = v10;
              __int16 v24 = 2112;
              long long v25 = v11;
              __int16 v26 = 2112;
              long long v27 = v13;
              _os_log_error_impl(&dword_1BDF08000, v15, OS_LOG_TYPE_ERROR, "Can't ignore error for calendar (%@) because it either has no object ID (%@) or no sync end date (%@)", buf, 0x20u);
            }
          }
          else
          {
            if (!v7) {
              uint64_t v7 = objc_opt_new();
            }
            [v7 setObject:v13 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
    if (v7)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      if (_objectsWithIgnoredErrors) {
        [(id)_objectsWithIgnoredErrors addEntriesFromDictionary:v7];
      }
      else {
        objc_storeStrong((id *)&_objectsWithIgnoredErrors, v7);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_objectsWithIgnoredErrorsLock);
      long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"CalendarModelIgnoredErrorsChangedNotification" object:0];
    }
  }
}

- (void)addRespondedNotificationObjectID:(id)a3
{
  [MEMORY[0x1E4F25680] addBlacklistedNotificationObjectID:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"CalendarModelBlacklistedNotification" object:self];
}

- (void)setCalendar:(id)a3
{
}

- (CUIKPasteboardManager)pasteboardManager
{
  return self->_pasteboardManager;
}

- (unint64_t)firstVisibleSecond
{
  return self->_firstVisibleSecond;
}

- (void)setFirstVisibleSecond:(unint64_t)a3
{
  self->_firstVisibleSecond = a3;
}

- (void)setSortedEnabledDelegates:(id)a3
{
}

- (BOOL)autoStartNotificationMonitor
{
  return self->_autoStartNotificationMonitor;
}

- (CUIKIPendingReminderTracker)pendingReminderTracker
{
  return self->_pendingReminderTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReminderTracker, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sortedEnabledDelegates, 0);
  objc_storeStrong((id *)&self->_sourceForSelectedIdentity, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_pasteboardManager, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_selectedCalendars, 0);
  objc_storeStrong((id *)&self->_cachedHiddenAppsHash, 0);
  objc_storeStrong((id *)&self->_lastKnownToday, 0);
  objc_storeStrong((id *)&self->_selectedOccurrences, 0);
  objc_storeStrong((id *)&self->_persistedSceneState, 0);
  objc_storeStrong((id *)&self->_suspendedSelectedDate, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_displayableAccountErrorCounts, 0);
  objc_storeStrong((id *)&self->_occurrenceCacheFilteredDataSource, 0);
  objc_storeStrong((id *)&self->_occurrenceCacheDataSource, 0);
  objc_storeStrong((id *)&self->_notificationMonitor, 0);
  objc_storeStrong((id *)&self->_delegateSources, 0);
  objc_storeStrong((id *)&self->_unselectedCalendarsForFocusMode, 0);
  objc_storeStrong((id *)&self->_visibleCalendars, 0);
  objc_storeStrong((id *)&self->_filterLock, 0);
  objc_storeStrong((id *)&self->_eventLoader, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)setSelectedDate:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "Set selected date to: [%@]", (uint8_t *)&v3, 0xCu);
}

- (void)setMaxCachedDays:(unsigned int)a1 .cold.1(unsigned int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "Setting max cached days to: [%lu]", (uint8_t *)&v2, 0xCu);
}

- (void)removeEvent:(uint64_t *)a1 withSpan:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Remove failed: %@", (uint8_t *)&v3, 0xCu);
}

@end