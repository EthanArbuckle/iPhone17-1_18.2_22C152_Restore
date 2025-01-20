SAAlarmObject *__cdecl sub_3A1C(id a1, SAAlarmObject *a2)
{
  SAAlarmObject *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v2 = a2;
  v3 = objc_alloc((Class)SAAlarmObject);
  v4 = [(SAAlarmObject *)v2 dictionary];

  v5 = [v3 initWithDictionary:v4];

  return (SAAlarmObject *)v5;
}

void sub_43F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v46 - 224), 8);
  _Block_object_dispose((const void *)(v46 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4470(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4480(uint64_t a1)
{
}

void sub_4488(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = WeakRetained;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep alarm fetch returned: %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v9 = MTNilify();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_45C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543874;
    id v16 = WeakRetained;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

intptr_t sub_46FC(uint64_t a1)
{
  v2 = MTLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm search completed", buf, 0xCu);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (MTShouldHandleForEucalyptus())
    {
      uint64_t v4 = *(void *)(a1 + 72);
      if (*(void *)(*(void *)(v4 + 8) + 40))
      {
        id v5 = *(void **)(a1 + 40);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_4894;
        v9[3] = &unk_104D8;
        v9[4] = v4;
        id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

        if (v6) {
          [*(id *)(a1 + 32) setSleepAlarm:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        }
      }
    }
    v7 = [*(id *)(a1 + 32) snippetAlarmsFromSourceAlarms:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) assistantAlarms:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setAlarms:v7];

    [*(id *)(a1 + 32) setupSections];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

id sub_4894(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) alarmURL];
  id v5 = [v3 isEqual:v4];

  return v5;
}

id sub_49B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4A64;
  v8[3] = &unk_10528;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  return v6;
}

id sub_4A64(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  id v5 = [v3 alarmURL];

  id v6 = [v4 isEqual:v5];
  return v6;
}

id sub_4E10(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmID];
  uint64_t v4 = [*(id *)(a1 + 32) alarmID];
  id v5 = [v3 isEqual:v4];

  return v5;
}

void sub_5444(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5504;
  v7[3] = &unk_10578;
  v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 siriViewController:v5 openURL:v6 completion:v7];
}

void sub_5504(uint64_t a1, char a2)
{
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_971C(a1, a2, v4);
  }
}

void sub_6278(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6334;
    block[3] = &unk_105D0;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

char *sub_6334(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == (char *)&dword_0 + 1)
  {
    v2 = *(void **)(a1 + 40);
    return (char *)[v2 handleMarkStaleNotification:0];
  }
  else
  {
    result = (char *)[*(id *)(a1 + 32) state];
    if (result == (unsigned char *)&dword_0 + 2)
    {
      uint64_t v4 = *(void **)(a1 + 48);
      return (char *)objc_msgSend(v4, "handleTimerStateChanged", v3);
    }
  }
  return result;
}

void sub_65A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6668;
  v7[3] = &unk_10578;
  v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v4 siriViewController:v5 openURL:v6 completion:v7];
}

void sub_6668(uint64_t a1, char a2)
{
  uint64_t v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_971C(a1, a2, v4);
  }
}

void sub_6C98(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 siriViewController:*(void *)(a1 + 32) openURL:v4 completion:&stru_10638];
}

uint64_t MTAlarmRepeatDayFromSAAlarmDayOfWeek(unsigned int a1)
{
  if (a1 > 8) {
    return 1;
  }
  else {
    return qword_BF88[a1];
  }
}

id SAAlarmFrequencyFromRepeatSchedule(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = v2;
  if (a1)
  {
    id v6 = v2;
    MTAlarmRepeatScheduleEnumerateDays();
  }
  else
  {
    id v4 = stringForSAAlarmDayOfWeek();
    [v3 addObject:v4];
  }

  return v3;
}

void sub_6E74(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 1:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 2:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 3:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 4:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 5:
      id v3 = *(void **)(a1 + 32);
      goto LABEL_9;
    case 6:
      id v3 = *(void **)(a1 + 32);
LABEL_9:
      stringForSAAlarmDayOfWeek();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:");

      break;
    default:
      return;
  }
}

uint64_t MTValidateAlarmRelativeOffsetMinutes(unint64_t a1, void *a2)
{
  if (a1 < 0x2D1) {
    return 1;
  }
  id v4 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v5 = +[NSTimeZone defaultTimeZone];
  [v4 setTimeZone:v5];

  id v6 = +[NSDate date];
  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setDay:1];
  id v8 = [v4 dateByAddingComponents:v7 toDate:v6 options:0];
  id v9 = objc_alloc_init((Class)NSDateComponents);
  [v9 setMinute:a1];
  uint64_t v10 = [v4 dateByAddingComponents:v9 toDate:v6 options:0];
  id v11 = [v8 laterDate:v10];

  BOOL v12 = v11 == v10;
  BOOL v13 = v11 != v10;
  if (v12)
  {
    +[NSString stringWithFormat:@"Relative offset must not be more than one day. Offset: %lu", a1];
    v18 = id v14 = a2;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    id v20 = v18;
    int v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v16 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:1 userInfo:v15];

    if (v14) {
      *id v14 = v16;
    }
  }
  return v13;
}

BOOL MTValidateAlarmHour(unint64_t a1, void *a2)
{
  if (a1 >= 0x18)
  {
    id v4 = +[NSString stringWithFormat:@"Hour must be between 0 and 23, inclusive. Hour = %lu", a1];
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:2 userInfo:v5];

    if (a2) {
      *a2 = v6;
    }
  }
  return a1 < 0x18;
}

BOOL MTValidateAlarmMinute(unint64_t a1, void *a2)
{
  if (a1 >= 0x3C)
  {
    id v4 = +[NSString stringWithFormat:@"Minute must be between 0 and 59, inclusive. Minute = %lu", a1];
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:3 userInfo:v5];

    if (a2) {
      *a2 = v6;
    }
  }
  return a1 < 0x3C;
}

uint64_t MTValidateAlarmFrequency(void *a1, void *a2)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a1;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (SAAlarmDayOfWeekForString() == 1)
        {
          if ([v3 count] != (char *)&dword_0 + 1)
          {
            id v14 = +[NSString stringWithFormat:@"SAClockAlarmDayNever must be specified alone. Frequency: %@", v3];
            NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
            v28 = v14;
            int v15 = &v28;
            id v16 = &v27;
LABEL_22:
            __int16 v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:1];
            BOOL v12 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:4 userInfo:v17];

            uint64_t v13 = 0;
            goto LABEL_23;
          }
        }
        else
        {
          if (SAAlarmDayOfWeekForString() < 2 || SAAlarmDayOfWeekForString() >= 9)
          {
            id v14 = +[NSString stringWithFormat:@"Frequency contains invalid day: %@. Frequency: %@", v9, v3, (void)v19];
            NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
            v26 = v14;
            int v15 = &v26;
            id v16 = &v25;
            goto LABEL_22;
          }
          unsigned int v10 = SAAlarmDayOfWeekForString();
          if (v10 > 8) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = qword_BF88[v10];
          }
          if ((v11 & v6) != 0)
          {
            id v14 = +[NSString stringWithFormat:@"Frequency contains %@ multiple times. Frequency: %@", v9, v3, (void)v19];
            NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
            v24 = v14;
            int v15 = &v24;
            id v16 = &v23;
            goto LABEL_22;
          }
          v6 |= v11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
      BOOL v12 = 0;
      uint64_t v13 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
    uint64_t v13 = 1;
  }
LABEL_23:

  if (a2) {
    *a2 = v12;
  }

  return v13;
}

BOOL MTValidateAlarmLabel(void *a1, void *a2)
{
  id v3 = [a1 length];
  if (!v3)
  {
    id v4 = +[NSString stringWithFormat:@"A zero-length label is not allowed"];
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    uint64_t v9 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.mobiletimer.assistant" code:5 userInfo:v5];

    if (a2) {
      *a2 = v6;
    }
  }
  return v3 != 0;
}

void sub_8C24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8CD4;
    v7[3] = &unk_106A0;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_8CD4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v2 = (char *)[*(id *)(a1 + 40) state];
  if (v2 == (unsigned char *)&dword_0 + 3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = [*(id *)(a1 + 40) fireDate];
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;

    [*(id *)(*(void *)(a1 + 32) + 32) setFireTime:v8 withTime:Current];
    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
    uint64_t v9 = +[CADisplayLink displayLinkWithTarget:*(void *)(a1 + 32) selector:"updateDisplay"];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = v9;

    [*(id *)(*(void *)(a1 + 32) + 16) setFrameInterval:15];
    BOOL v12 = *(void **)(*(void *)(a1 + 32) + 16);
    id v15 = +[NSRunLoop mainRunLoop];
    [v12 addToRunLoop:v15 forMode:NSRunLoopCommonModes];
  }
  else
  {
    if (v2 == (unsigned char *)&dword_0 + 2)
    {
      uint64_t v13 = *(void **)(a1 + 40);
      id v3 = *(void **)(*(void *)(a1 + 32) + 32);
      [v13 remainingTime];
      double v4 = round(v14);
      if (v4 < 1.0) {
        double v4 = 1.0;
      }
    }
    else
    {
      if (v2 != (unsigned char *)&dword_0 + 1) {
        return;
      }
      id v3 = *(void **)(*(void *)(a1 + 32) + 32);
      +[MTTimerManager defaultDuration];
    }
    [v3 setRemainingTime:v4];
  }
}

void sub_9694(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%{public}@ initializing with snippet: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_971C(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%{public}@ opened URL %{public}@ successfully: %d", (uint8_t *)&v5, 0x1Cu);
}

void sub_97B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "SAUISnippet class not handled: %@", (uint8_t *)&v2, 0xCu);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t DateMaskToString()
{
  return _DateMaskToString();
}

uint64_t FormatTime()
{
  return _FormatTime();
}

uint64_t MTAlarmRepeatScheduleEnumerateDays()
{
  return _MTAlarmRepeatScheduleEnumerateDays();
}

uint64_t MTAlarmStandardSort()
{
  return _MTAlarmStandardSort();
}

uint64_t MTLogForCategory()
{
  return _MTLogForCategory();
}

uint64_t MTNilify()
{
  return _MTNilify();
}

uint64_t MTShouldHandleForEucalyptus()
{
  return _MTShouldHandleForEucalyptus();
}

uint64_t SAAlarmDayOfWeekForString()
{
  return _SAAlarmDayOfWeekForString();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t stringForSAAlarmDayOfWeek()
{
  return _stringForSAAlarmDayOfWeek();
}

id objc_msgSend__cellHeight(void *a1, const char *a2, ...)
{
  return [a1 _cellHeight];
}

id objc_msgSend_alarm(void *a1, const char *a2, ...)
{
  return [a1 alarm];
}

id objc_msgSend_alarmComponents(void *a1, const char *a2, ...)
{
  return [a1 alarmComponents];
}

id objc_msgSend_alarmID(void *a1, const char *a2, ...)
{
  return [a1 alarmID];
}

id objc_msgSend_alarmManager(void *a1, const char *a2, ...)
{
  return [a1 alarmManager];
}

id objc_msgSend_alarmURL(void *a1, const char *a2, ...)
{
  return [a1 alarmURL];
}

id objc_msgSend_alarmView(void *a1, const char *a2, ...)
{
  return [a1 alarmView];
}

id objc_msgSend_alarms(void *a1, const char *a2, ...)
{
  return [a1 alarms];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_cityName(void *a1, const char *a2, ...)
{
  return [a1 cityName];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clocks(void *a1, const char *a2, ...)
{
  return [a1 clocks];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 collectionViewLayout];
}

id objc_msgSend_combinedLabel(void *a1, const char *a2, ...)
{
  return [a1 combinedLabel];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentTimer(void *a1, const char *a2, ...)
{
  return [a1 currentTimer];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultDuration];
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return [a1 defaultHeight];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailedDescription(void *a1, const char *a2, ...)
{
  return [a1 detailedDescription];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digitalClock(void *a1, const char *a2, ...)
{
  return [a1 digitalClock];
}

id objc_msgSend_displayTitle(void *a1, const char *a2, ...)
{
  return [a1 displayTitle];
}

id objc_msgSend_displaysTime(void *a1, const char *a2, ...)
{
  return [a1 displaysTime];
}

id objc_msgSend_enabledSwitch(void *a1, const char *a2, ...)
{
  return [a1 enabledSwitch];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fireDate(void *a1, const char *a2, ...)
{
  return [a1 fireDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_headerFont(void *a1, const char *a2, ...)
{
  return [a1 headerFont];
}

id objc_msgSend_headerHeight(void *a1, const char *a2, ...)
{
  return [a1 headerHeight];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAX(void *a1, const char *a2, ...)
{
  return [a1 isAX];
}

id objc_msgSend_isDeviceTimer(void *a1, const char *a2, ...)
{
  return [a1 isDeviceTimer];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return [a1 isOn];
}

id objc_msgSend_isSleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 isSleepAlarm];
}

id objc_msgSend_isStale(void *a1, const char *a2, ...)
{
  return [a1 isStale];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localSetup(void *a1, const char *a2, ...)
{
  return [a1 localSetup];
}

id objc_msgSend_mainDescription(void *a1, const char *a2, ...)
{
  return [a1 mainDescription];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_markStale(void *a1, const char *a2, ...)
{
  return [a1 markStale];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mtMainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mtMainThreadScheduler];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameLabel(void *a1, const char *a2, ...)
{
  return [a1 nameLabel];
}

id objc_msgSend_nextSleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 nextSleepAlarm];
}

id objc_msgSend_otherAlarmsHeaderString(void *a1, const char *a2, ...)
{
  return [a1 otherAlarmsHeaderString];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_reloadTimerState(void *a1, const char *a2, ...)
{
  return [a1 reloadTimerState];
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return [a1 remainingTime];
}

id objc_msgSend_repeatSchedule(void *a1, const char *a2, ...)
{
  return [a1 repeatSchedule];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupConstraints(void *a1, const char *a2, ...)
{
  return [a1 setupConstraints];
}

id objc_msgSend_setupSections(void *a1, const char *a2, ...)
{
  return [a1 setupSections];
}

id objc_msgSend_setupSleep(void *a1, const char *a2, ...)
{
  return [a1 setupSleep];
}

id objc_msgSend_setupTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 setupTitleLabel];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 sleepAlarm];
}

id objc_msgSend_sleepHeaderString(void *a1, const char *a2, ...)
{
  return [a1 sleepHeaderString];
}

id objc_msgSend_sleepMetaData(void *a1, const char *a2, ...)
{
  return [a1 sleepMetaData];
}

id objc_msgSend_sleepMetadata(void *a1, const char *a2, ...)
{
  return [a1 sleepMetadata];
}

id objc_msgSend_sleepStore(void *a1, const char *a2, ...)
{
  return [a1 sleepStore];
}

id objc_msgSend_snippetCell(void *a1, const char *a2, ...)
{
  return [a1 snippetCell];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_textAndAccessoryInsets(void *a1, const char *a2, ...)
{
  return [a1 textAndAccessoryInsets];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return [a1 timeLabel];
}

id objc_msgSend_timerManager(void *a1, const char *a2, ...)
{
  return [a1 timerManager];
}

id objc_msgSend_timerValue(void *a1, const char *a2, ...)
{
  return [a1 timerValue];
}

id objc_msgSend_timers(void *a1, const char *a2, ...)
{
  return [a1 timers];
}

id objc_msgSend_timezoneId(void *a1, const char *a2, ...)
{
  return [a1 timezoneId];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}