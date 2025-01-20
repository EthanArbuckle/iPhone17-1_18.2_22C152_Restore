@interface EKAlarmsViewModel
+ (id)_noneAlertTitle;
+ (id)labelTextForIndex:(unint64_t)a3;
+ (void)subscribeToDarwinNotifications;
+ (void)unsubscribeFromDarwinNotifications;
- (BOOL)_hasUIAlarmChangedFromUIAlarm:(id)a3 toUIAlarm:(id)a4;
- (BOOL)canHaveLeaveNowAlarm;
- (BOOL)hasLeaveNowAlarm;
- (BOOL)isAlarmEffectivelyDisabled:(id)a3;
- (BOOL)locationStatusMakesTTLAlarmDisabled;
- (BOOL)needsUpdate;
- (BOOL)showDefaultAlarm:(id)a3;
- (EKAlarmsViewModel)init;
- (EKAlarmsViewModel)initWithCalendarItem:(id)a3;
- (EKCalendarItem)calendarItem;
- (NSMutableArray)uiAlarms;
- (id)_errorTitleForDisabledTTLAlarm;
- (id)_menuForAlarmAtIndex:(unint64_t)a3 placeholder:(BOOL)a4 actionHandler:(id)a5;
- (id)menuForAlarmAtIndex:(unint64_t)a3 actionHandler:(id)a4;
- (id)placeholderMenuForAlarmAtIndex:(unint64_t)a3;
- (id)presetAlarmsIntervals;
- (unint64_t)locationStatus;
- (void)_updateAlarms;
- (void)_updateLeaveNowFlags;
- (void)dealloc;
- (void)reloadTTLLocationAuthorization:(id)a3;
- (void)setCalendarItem:(id)a3;
- (void)setNeedsUpdate;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setUiAlarms:(id)a3;
- (void)updateIfNeeded;
- (void)updatedUIAlarmFromUIAlarm:(id)a3 toUIAlarm:(id)a4 atIndex:(unint64_t)a5 completion:(id)a6;
@end

@implementation EKAlarmsViewModel

- (EKAlarmsViewModel)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"EKAlarmsViewModel.m" lineNumber:43 description:@"Error: Must use designated initializer when initializing an EKAlarmsViewModel instance. Using init directly is not supported for the EKAlarmsViewModel since it guarantees that the EKAlarmsViewModel will be initialized with a nil calendarItem."];

  return [(EKAlarmsViewModel *)self initWithCalendarItem:0];
}

- (EKAlarmsViewModel)initWithCalendarItem:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKAlarmsViewModel;
  v5 = [(EKAlarmsViewModel *)&v12 init];
  if (v5)
  {
    if (!v4)
    {
      v6 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "EKAlarmsViewModel was initialized with a nil calendarItem.", v11, 2u);
      }
    }
    [(EKAlarmsViewModel *)v5 setCalendarItem:v4];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uiAlarms = v5->_uiAlarms;
    v5->_uiAlarms = (NSMutableArray *)v7;

    +[EKAlarmsViewModel subscribeToDarwinNotifications];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v5 selector:sel_reloadTTLLocationAuthorization_ name:@"EKAlarmsViewModelTTLLocationAuthorizationStatusNeedsReloadNotification" object:0];

    [(EKAlarmsViewModel *)v5 setNeedsUpdate];
  }

  return v5;
}

- (void)dealloc
{
  +[EKAlarmsViewModel unsubscribeFromDarwinNotifications];
  v3.receiver = self;
  v3.super_class = (Class)EKAlarmsViewModel;
  [(EKAlarmsViewModel *)&v3 dealloc];
}

+ (void)subscribeToDarwinNotifications
{
  os_unfair_lock_lock((os_unfair_lock_t)&notificationLock);
  if (!livingModelCount++)
  {
    objc_super v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_INFO, "Subscribing to TTL authorization status change notifications", v5, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)locationAuthorizationsChanged, (CFStringRef)*MEMORY[0x1E4F56930], 0, (CFNotificationSuspensionBehavior)0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&notificationLock);
}

+ (void)unsubscribeFromDarwinNotifications
{
  os_unfair_lock_lock((os_unfair_lock_t)&notificationLock);
  if (!--livingModelCount)
  {
    v2 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1B3F4C000, v2, OS_LOG_TYPE_INFO, "Unsubscribing from TTL authorization status change notifications", v4, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, (CFNotificationName)*MEMORY[0x1E4F56930], 0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&notificationLock);
}

- (void)reloadTTLLocationAuthorization:(id)a3
{
  unint64_t locationStatus = self->_locationStatus;
  [(EKAlarmsViewModel *)self _updateLeaveNowFlags];
  if (locationStatus != self->_locationStatus)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"EKAlarmsViewModelTTLLocationStatusChangedNotification" object:self];
  }
}

- (void)updatedUIAlarmFromUIAlarm:(id)a3 toUIAlarm:(id)a4 atIndex:(unint64_t)a5 completion:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = (void (**)(id, uint64_t, EKUIAlarm *, uint64_t))a6;
  if ([(EKAlarmsViewModel *)self _hasUIAlarmChangedFromUIAlarm:v10 toUIAlarm:v11])
  {
    v13 = [(EKAlarmsViewModel *)self calendarItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    v15 = [(EKAlarmsViewModel *)self uiAlarms];
    v16 = [v13 alarms];
    if ([v15 count] <= a5)
    {
      if (!v11)
      {
LABEL_19:
        uint64_t v22 = 0;
        v23 = 0;
        goto LABEL_47;
      }
      if ([v11 isLeaveNowAlarm])
      {
        uint64_t v22 = 1;
        [v14 setTravelAdvisoryBehavior:1];
        v23 = [[EKUIAlarm alloc] initLeaveNowAlarm];
LABEL_47:
        v12[2](v12, 1, v23, v22);

        goto LABEL_48;
      }
      v24 = [v11 alarm];
      int v25 = [v24 isAbsolute];

      if (v25)
      {
        v26 = (void *)MEMORY[0x1E4F25488];
        v27 = [v11 alarm];
        v28 = v27;
        goto LABEL_22;
      }
      if (![v11 isDefaultAlarm])
      {
        v26 = (void *)MEMORY[0x1E4F25488];
        v27 = [v11 alarm];
        v28 = v27;
LABEL_39:
        [v27 relativeOffset];
        uint64_t v34 = objc_msgSend(v26, "alarmWithRelativeOffset:");
        goto LABEL_40;
      }
    }
    else
    {
      if ([v16 count] > a5)
      {
        v17 = [v13 sortedAlarms];
        v63 = v17;
        if (v10)
        {
          v18 = [v10 alarm];
          v19 = [(EKAlarmsViewModel *)self calendarItem];
          a5 = [v19 indexForAlarm:v18];

          v17 = v63;
        }
        if (a5 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = [v10 alarm];
          v21 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v65 = "-[EKAlarmsViewModel updatedUIAlarmFromUIAlarm:toUIAlarm:atIndex:completion:]";
            __int16 v66 = 2112;
            v67 = v20;
            _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, "Error: [%s] - alarm index could not be determined for the alarm to update: %@", buf, 0x16u);
          }

          uint64_t v22 = 0;
          v23 = 0;
          goto LABEL_46;
        }
        if (!v11
          || ([v11 isLeaveNowAlarm] & 1) != 0
          || [v11 isDefaultAlarm])
        {
          v31 = (void *)[v17 mutableCopy];
          [v31 removeObjectAtIndex:a5];
          if ([v11 isLeaveNowAlarm])
          {
            [v14 setTravelAdvisoryBehavior:1];
            v23 = [[EKUIAlarm alloc] initLeaveNowAlarm];
          }
          else if ([v11 isDefaultAlarm])
          {
            v35 = [v13 defaultAlarms];
            v36 = [v35 anyObject];

            if (v36) {
              [v31 addObject:v36];
            }
            v23 = [[EKUIAlarm alloc] initDefaultAlarm];
          }
          else
          {
            v23 = 0;
          }
          v37 = (void *)[v31 copy];
          [v13 setAlarms:v37];

          uint64_t v22 = 0;
          goto LABEL_45;
        }
        v62 = [v17 objectAtIndexedSubscript:a5];
        if ([v62 isDefaultAlarm])
        {
          v61 = (void *)[v17 mutableCopy];
          v38 = [v11 alarm];
          int v39 = [v38 isAbsolute];

          v40 = (void *)MEMORY[0x1E4F25488];
          v41 = [v11 alarm];
          if (v39)
          {
            uint64_t v42 = objc_msgSend(v41, "absoluteDate", v41);
            v43 = v40;
            v44 = (void *)v42;
            v45 = [v43 alarmWithAbsoluteDate:v42];
          }
          else
          {
            objc_msgSend(v41, "relativeOffset", v41);
            v45 = objc_msgSend(v40, "alarmWithRelativeOffset:");
          }

          [v61 replaceObjectAtIndex:a5 withObject:v45];
          v23 = [[EKUIAlarm alloc] initWithAlarm:v45];
          v54 = (void *)[v61 copy];
          [v13 setAlarms:v54];

          uint64_t v22 = 1;
          v51 = v62;
          goto LABEL_59;
        }
        v46 = [v11 alarm];
        int v47 = [v46 isAbsolute];

        v48 = [v11 alarm];
        v49 = v48;
        if (v47)
        {
          v50 = [v48 absoluteDate];
          [v62 setAbsoluteDate:v50];

          v51 = v62;
          v52 = [EKUIAlarm alloc];
          v53 = v62;
        }
        else
        {
          [v48 relativeOffset];
          double v56 = v55;
          v51 = v62;
          [v62 relativeOffset];
          double v58 = v57;

          if (v56 == v58)
          {
            uint64_t v22 = 0;
            v23 = 0;
            goto LABEL_59;
          }
          v59 = [v11 alarm];
          [v59 relativeOffset];
          objc_msgSend(v62, "setRelativeOffset:");

          v51 = v62;
          v52 = [EKUIAlarm alloc];
          v53 = v62;
        }
        v23 = [(EKUIAlarm *)v52 initWithAlarm:v53];
        uint64_t v22 = 1;
LABEL_59:

LABEL_45:
        v17 = v63;
LABEL_46:

        goto LABEL_47;
      }
      if (!v11)
      {
        [v14 setTravelAdvisoryBehavior:2];
        v23 = 0;
LABEL_42:
        uint64_t v22 = 1;
        goto LABEL_47;
      }
      if ([v11 isLeaveNowAlarm]) {
        goto LABEL_19;
      }
      [v14 setTravelAdvisoryBehavior:2];
      if (![v11 isDefaultAlarm])
      {
        v32 = [v11 alarm];
        int v33 = [v32 isAbsolute];

        v26 = (void *)MEMORY[0x1E4F25488];
        v27 = [v11 alarm];
        v28 = v27;
        if (!v33) {
          goto LABEL_39;
        }
LABEL_22:
        v29 = [v27 absoluteDate];
        v30 = [v26 alarmWithAbsoluteDate:v29];

LABEL_41:
        [v13 addAlarm:v30];
        v23 = [[EKUIAlarm alloc] initWithAlarm:v30];

        goto LABEL_42;
      }
    }
    v28 = [v13 defaultAlarms];
    uint64_t v34 = [v28 anyObject];
LABEL_40:
    v30 = (void *)v34;
    goto LABEL_41;
  }
  v12[2](v12, 0, 0, 0);
LABEL_48:
}

- (BOOL)_hasUIAlarmChangedFromUIAlarm:(id)a3 toUIAlarm:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    id v6 = v5;
    v8 = v7;
  }
  else
  {
    if (!v6)
    {
      LOBYTE(v9) = 0;
      goto LABEL_6;
    }
    v8 = 0;
  }
  int v9 = [v6 isEqualToUIAlarm:v8] ^ 1;
LABEL_6:

  return v9;
}

- (void)setNeedsUpdate
{
}

- (void)updateIfNeeded
{
  if ([(EKAlarmsViewModel *)self needsUpdate])
  {
    [(EKAlarmsViewModel *)self _updateAlarms];
    [(EKAlarmsViewModel *)self _updateLeaveNowFlags];
  }

  [(EKAlarmsViewModel *)self setNeedsUpdate:0];
}

- (void)_updateAlarms
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_uiAlarms removeAllObjects];
  objc_super v3 = [(EKAlarmsViewModel *)self calendarItem];
  id v4 = [v3 sortedAlarms];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uiAlarms = self->_uiAlarms;
        id v10 = [[EKUIAlarm alloc] initWithAlarm:*(void *)(*((void *)&v14 + 1) + 8 * v8)];
        [(NSMutableArray *)uiAlarms addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  if ([MEMORY[0x1E4F25570] isTravelAdvisorySupported])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v3;
      if ([v11 eligibleForTravelAdvisories]
        && [v11 travelAdvisoryBehaviorIsEffectivelyEnabled])
      {
        objc_super v12 = self->_uiAlarms;
        id v13 = [[EKUIAlarm alloc] initLeaveNowAlarm];
        [(NSMutableArray *)v12 addObject:v13];
      }
    }
  }
}

- (void)_updateLeaveNowFlags
{
  *(_WORD *)&self->_canHaveLeaveNowAlarm = 0;
  self->_unint64_t locationStatus = 0;
  id v6 = [(EKAlarmsViewModel *)self calendarItem];
  if ([MEMORY[0x1E4F25570] isTravelAdvisorySupported])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v6;
      int v4 = [v3 eligibleForTravelAdvisories];
      self->_canHaveLeaveNowAlarm = v4;
      if (v4) {
        LOBYTE(v4) = [v3 travelAdvisoryBehaviorIsEffectivelyEnabled];
      }
      self->_hasLeaveNowAlarm = v4;
    }
    uint64_t v5 = [v6 eventStore];
    self->_unint64_t locationStatus = [v5 timeToLeaveLocationAuthorizationStatus];
  }
}

- (BOOL)canHaveLeaveNowAlarm
{
  return self->_canHaveLeaveNowAlarm;
}

- (BOOL)hasLeaveNowAlarm
{
  return self->_hasLeaveNowAlarm;
}

- (unint64_t)locationStatus
{
  return self->_locationStatus;
}

- (NSMutableArray)uiAlarms
{
  [(EKAlarmsViewModel *)self updateIfNeeded];
  id v3 = (void *)[(NSMutableArray *)self->_uiAlarms copy];

  return (NSMutableArray *)v3;
}

- (BOOL)showDefaultAlarm:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_uiAlarms;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "isDefaultAlarm", (void)v12);
        if (v9 != v4 && (v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)presetAlarmsIntervals
{
  v2 = [(EKAlarmsViewModel *)self calendarItem];
  int v3 = [v2 isAllDay];

  if (v3 && !presetAlarmsIntervals_sAllDayIntervals)
  {
    presetAlarmsIntervals_sAllDayIntervals = (uint64_t)&unk_1F0D03C58;
  }
  id v4 = (void *)presetAlarmsIntervals_sTimedIntervals;
  if (presetAlarmsIntervals_sTimedIntervals) {
    char v5 = 1;
  }
  else {
    char v5 = v3;
  }
  if ((v5 & 1) == 0)
  {
    presetAlarmsIntervals_sTimedIntervals = (uint64_t)&unk_1F0D03C70;

    id v4 = &unk_1F0D03C70;
  }
  if (v3) {
    uint64_t v6 = (void *)presetAlarmsIntervals_sAllDayIntervals;
  }
  else {
    uint64_t v6 = v4;
  }

  return v6;
}

- (id)placeholderMenuForAlarmAtIndex:(unint64_t)a3
{
  return [(EKAlarmsViewModel *)self _menuForAlarmAtIndex:a3 placeholder:1 actionHandler:0];
}

- (id)menuForAlarmAtIndex:(unint64_t)a3 actionHandler:(id)a4
{
  return [(EKAlarmsViewModel *)self _menuForAlarmAtIndex:a3 placeholder:0 actionHandler:a4];
}

+ (id)_noneAlertTitle
{
  v2 = EventKitUIBundle();
  int v3 = [v2 localizedStringForKey:@"None alert - calendar event alarm table" value:@"None" table:0];

  return v3;
}

- (id)_menuForAlarmAtIndex:(unint64_t)a3 placeholder:(BOOL)a4 actionHandler:(id)a5
{
  BOOL v95 = a4;
  v126[1] = *MEMORY[0x1E4F143B8];
  id v93 = a5;
  v88 = [MEMORY[0x1E4F57C00] sharedPreferences];
  int v5 = [v88 immediateAlarmCreation];
  objc_initWeak(&location, self);
  uint64_t v6 = self;
  if ([(NSMutableArray *)self->_uiAlarms count] <= a3)
  {
    v90 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    v90 = -[NSMutableArray objectAtIndexedSubscript:](self->_uiAlarms, "objectAtIndexedSubscript:");
    if (v5)
    {
LABEL_3:
      uint64_t v7 = (void *)MEMORY[0x1E4FB13F0];
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke;
      v112[3] = &unk_1E6089BD0;
      objc_copyWeak(v114, &location);
      v114[1] = (id)a3;
      id v113 = v93;
      uint64_t v8 = [v7 actionWithTitle:@"Five seconds from now" image:0 identifier:0 handler:v112];
      id v9 = (void *)MEMORY[0x1E4FB1970];
      v126[0] = v8;
      char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:1];
      id v11 = [v9 menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v10];

      objc_destroyWeak(v114);
      goto LABEL_81;
    }
  }
  v87 = [(EKAlarmsViewModel *)self calendarItem];
  v86 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v91 = [v87 isAllDay];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v87 travelTime];
  }
  long long v12 = [v87 defaultAlarm];
  v84 = v12;
  if (v12 && ([v12 isAbsolute] & 1) == 0)
  {
    [v84 relativeOffset];
    uint64_t v13 = (uint64_t)v14;
  }
  else
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v95 && ![v90 isDefaultAlarm]
    || ((char v15 = EKUICatalyst(), v13 == 0x7FFFFFFFFFFFFFFFLL) ? (v16 = v15) : (v16 = 0),
        (v16 & 1) != 0 || [(EKAlarmsViewModel *)self showDefaultAlarm:v90]))
  {
    int v17 = 0;
  }
  else
  {
    v36 = [v87 defaultAlarms];
    v37 = [v36 anyObject];
    BOOL v38 = v37 == 0;

    if (v38)
    {
      int v17 = 0;
      uint64_t v6 = self;
    }
    else
    {
      int v39 = NSString;
      v40 = [MEMORY[0x1E4F25488] defaultDesignator];
      v41 = CalStringForRelativeOffset(v91, (double)v13);
      uint64_t v42 = [v39 localizedStringWithValidatedFormat:v40, @"%@", 0, v41 validFormatSpecifiers error];

      v43 = (void *)MEMORY[0x1E4FB13F0];
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_2;
      v109[3] = &unk_1E6089BD0;
      objc_copyWeak(v111, &location);
      v111[1] = (id)a3;
      id v110 = v93;
      v44 = [v43 actionWithTitle:v42 image:0 identifier:0 handler:v109];
      int v45 = [v90 isDefaultAlarm];
      if (v45) {
        [v44 setState:1];
      }
      v125 = v44;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
      CalAddInlineMenuItemArrayToArray(v86, v46);

      objc_destroyWeak(v111);
      uint64_t v6 = self;
      int v17 = v45;
    }
  }
  if (v90) {
    char v18 = 1;
  }
  else {
    char v18 = v17;
  }
  if (!v95 || (v18 & 1) == 0)
  {
    uint64_t v19 = [(id)objc_opt_class() _noneAlertTitle];
    v20 = (void *)MEMORY[0x1E4FB13F0];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_3;
    v106[3] = &unk_1E6089BD0;
    objc_copyWeak(v108, &location);
    v108[1] = (id)a3;
    id v107 = v93;
    v21 = [v20 actionWithTitle:v19 image:0 identifier:0 handler:v106];
    uint64_t v22 = v21;
    if (!v90)
    {
      [v21 setState:1];
      int v17 = 1;
    }
    v124 = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
    CalAddInlineMenuItemArrayToArray(v86, v23);

    objc_destroyWeak(v108);
    uint64_t v6 = self;
  }
  int v24 = !v95;
  if (v95 && (v17 & 1) == 0) {
    int v24 = [v90 isLeaveNowAlarm];
  }
  if (v24
    && v6->_canHaveLeaveNowAlarm
    && (!v6->_hasLeaveNowAlarm || [v90 isLeaveNowAlarm]))
  {
    int v25 = EventKitUIBundle();
    v26 = [v25 localizedStringForKey:@"Time to Leave" value:&stru_1F0CC2140 table:0];

    v27 = (void *)MEMORY[0x1E4FB13F0];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_4;
    v103[3] = &unk_1E6089BD0;
    objc_copyWeak(v105, &location);
    v105[1] = (id)a3;
    id v104 = v93;
    v28 = [v27 actionWithTitle:v26 image:0 identifier:0 handler:v103];
    int v29 = v17;
    if ([v90 isLeaveNowAlarm])
    {
      [v28 setState:1];
      int v29 = 1;
    }
    if ([(EKAlarmsViewModel *)self locationStatusMakesTTLAlarmDisabled])
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v122 = *MEMORY[0x1E4FB0700];
      v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v123 = v31;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
      int v33 = (void *)[v30 initWithString:v26 attributes:v32];
      [v28 setAttributedTitle:v33];

      uint64_t v34 = [(EKAlarmsViewModel *)self _errorTitleForDisabledTTLAlarm];
      v121 = v28;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
      CalAddInlineMenuItemArrayToArrayWithTitle(v86, (uint64_t)v35, (uint64_t)v34);
    }
    else
    {
      v120 = v28;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
      CalAddInlineMenuItemArrayToArray(v86, v34);
    }

    objc_destroyWeak(v105);
    uint64_t v6 = self;
    int v17 = v29;
  }
  v85 = [(EKAlarmsViewModel *)v6 presetAlarmsIntervals];
  v92 = [MEMORY[0x1E4F1CA48] array];
  if (v90)
  {
    int v47 = [v90 alarm];
    char v48 = [v47 isAbsolute];

    if (v48)
    {
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v51 = [v90 alarm];
      [v51 relativeOffset];
      double v53 = v52;

      uint64_t v49 = (uint64_t)v53;
    }
    v54 = [NSNumber numberWithInteger:v49];
    int v50 = [v85 containsObject:v54];

    uint64_t v6 = self;
  }
  else
  {
    int v50 = 1;
    uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v95 & v17)
  {
    int v17 = 1;
  }
  else if (([v90 isLeaveNowAlarm] & 1) == 0 {
         && (([v90 isDefaultAlarm] | v50) & 1) == 0)
  }
  {
    double v55 = [v90 localizedDescriptionAllDay:v91];
    double v56 = [MEMORY[0x1E4FB13F0] actionWithTitle:v55 image:0 identifier:0 handler:&__block_literal_global_38];
    [v56 setState:1];
    [v92 addObject:v56];

    int v17 = 1;
    uint64_t v6 = self;
  }
  if (v95 && (v17 & 1) != 0)
  {
    int v17 = 1;
  }
  else
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v57 = v85;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v99 objects:v119 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v100;
      while (2)
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v100 != v59) {
            objc_enumerationMutation(v57);
          }
          uint64_t v61 = [*(id *)(*((void *)&v99 + 1) + 8 * i) integerValue];
          v62 = (void *)v61;
          if (!v95 || v61 == v49)
          {
            v63 = CalStringForRelativeOffset(v91, (double)v61);
            v64 = (void *)MEMORY[0x1E4FB13F0];
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_6;
            v96[3] = &unk_1E6089BF8;
            objc_copyWeak(v98, &location);
            v98[1] = (id)a3;
            v98[2] = v62;
            id v97 = v93;
            v65 = [v64 actionWithTitle:v63 image:0 identifier:0 handler:v96];
            __int16 v66 = v65;
            if (!((v62 != (void *)v49) | v17 & 1))
            {
              int v17 = 1;
              [v65 setState:1];
            }
            [v92 addObject:v66];

            objc_destroyWeak(v98);
            if (v95 & v17)
            {
              int v17 = 1;
              goto LABEL_72;
            }
          }
        }
        uint64_t v58 = [v57 countByEnumeratingWithState:&v99 objects:v119 count:16];
        if (v58) {
          continue;
        }
        break;
      }
    }
LABEL_72:

    uint64_t v6 = self;
  }
  CalAddInlineMenuItemArrayToArray(v86, (const char *)v92);
  if (((!v95 | v17) & 1) == 0)
  {
    v67 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v118 = v90;
      _os_log_impl(&dword_1B3F4C000, v67, OS_LOG_TYPE_FAULT, "No actions while creating placeholder for alarm %@", buf, 0xCu);
    }
    uint64_t v68 = [(id)objc_opt_class() _noneAlertTitle];
    v69 = [MEMORY[0x1E4FB13F0] actionWithTitle:v68 image:0 identifier:0 handler:&__block_literal_global_91];
    [v69 setState:1];
    v116 = v69;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    CalAddInlineMenuItemArrayToArray(v86, v70);

    uint64_t v6 = self;
  }
  v71 = [(EKAlarmsViewModel *)v6 calendarItem];
  v72 = [v71 calendar];
  int v73 = [v72 isIgnoringEventAlerts];

  if (v73)
  {
    v74 = [(EKAlarmsViewModel *)self calendarItem];
    v75 = [v74 calendar];
    v76 = CUIKDisplayedTitleForCalendar();

    v77 = EventKitUIBundle();
    v78 = [v77 localizedStringForKey:@"Event Alerts" value:&stru_1F0CC2140 table:0];

    v79 = NSString;
    v80 = EventKitUIBundle();
    v81 = [v80 localizedStringForKey:@"Alerts for this calendar are disabled.\nTo allow this alert to fire, enable ‘%@’ in the calendar settings for ‘%@’.", &stru_1F0CC2140, 0 value table];
    objc_msgSend(v79, "localizedStringWithFormat:", v81, v78, v76);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = &stru_1F0CC2140;
  }
  id v11 = [MEMORY[0x1E4FB1970] menuWithTitle:v82 image:0 identifier:0 options:1 children:v86];

LABEL_81:
  objc_destroyWeak(&location);

  return v11;
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = *(void *)(a1 + 48);
  char v10 = WeakRetained;
  if (v3 >= [WeakRetained[5] count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v10[5] objectAtIndexedSubscript:*(void *)(a1 + 48)];
  }
  int v5 = [EKUIAlarm alloc];
  uint64_t v6 = (void *)MEMORY[0x1E4F25488];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
  uint64_t v8 = [v6 alarmWithAbsoluteDate:v7];
  id v9 = [(EKUIAlarm *)v5 initWithAlarm:v8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = WeakRetained;
  if (v3 >= [WeakRetained[5] count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v6[5] objectAtIndexedSubscript:*(void *)(a1 + 48)];
  }
  id v5 = [[EKUIAlarm alloc] initDefaultAlarm];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = *(void *)(a1 + 48);
  id v5 = WeakRetained;
  if (v3 >= [WeakRetained[5] count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v5[5] objectAtIndexedSubscript:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = WeakRetained;
  if (v3 >= [WeakRetained[5] count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v6[5] objectAtIndexedSubscript:*(void *)(a1 + 48)];
  }
  id v5 = [[EKUIAlarm alloc] initLeaveNowAlarm];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__EKAlarmsViewModel__menuForAlarmAtIndex_placeholder_actionHandler___block_invoke_6(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = *(void *)(a1 + 48);
  uint64_t v8 = WeakRetained;
  if (v3 >= [WeakRetained[5] count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v8[5] objectAtIndexedSubscript:*(void *)(a1 + 48)];
  }
  id v5 = [EKUIAlarm alloc];
  uint64_t v6 = [MEMORY[0x1E4F25488] alarmWithRelativeOffset:(double)*(uint64_t *)(a1 + 56)];
  uint64_t v7 = [(EKUIAlarm *)v5 initWithAlarm:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)labelTextForIndex:(unint64_t)a3
{
  id v4 = EventKitUIBundle();
  id v5 = v4;
  if (a3) {
    uint64_t v6 = @"Second Alert";
  }
  else {
    uint64_t v6 = @"Alert";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1F0CC2140 table:0];

  return v7;
}

- (BOOL)isAlarmEffectivelyDisabled:(id)a3
{
  id v4 = a3;
  id v5 = [(EKAlarmsViewModel *)self calendarItem];
  uint64_t v6 = [v5 calendar];
  char v7 = [v6 isIgnoringEventAlerts];

  if (v7)
  {
    BOOL v8 = 1;
  }
  else if ([v4 isLeaveNowAlarm])
  {
    BOOL v8 = [(EKAlarmsViewModel *)self locationStatusMakesTTLAlarmDisabled];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)locationStatusMakesTTLAlarmDisabled
{
  return ([(EKAlarmsViewModel *)self locationStatus] & 0xFFFFFFFFFFFFFFFBLL) != 0;
}

- (id)_errorTitleForDisabledTTLAlarm
{
  unint64_t v2 = [(EKAlarmsViewModel *)self locationStatus];
  if (v2 - 1 < 2)
  {
    unint64_t v3 = EventKitUIBundle();
    id v4 = v3;
    id v5 = @"Requires Precise Location";
LABEL_5:
    uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F0CC2140 table:0];

    goto LABEL_7;
  }
  if (v2 == 3)
  {
    unint64_t v3 = EventKitUIBundle();
    id v4 = v3;
    id v5 = @"Requires Alerts & Shortcuts Automations To Be Enabled";
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (EKCalendarItem)calendarItem
{
  return self->_calendarItem;
}

- (void)setCalendarItem:(id)a3
{
}

- (void)setUiAlarms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiAlarms, 0);

  objc_storeStrong((id *)&self->_calendarItem, 0);
}

@end