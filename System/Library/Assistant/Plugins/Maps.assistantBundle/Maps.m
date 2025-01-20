void sub_4078(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t vars8;

  v5 = a2;
  v14 = v5;
  if (a3 == 1)
  {
    [*(id *)(a1 + 32) setLocalizedDateFormatFromTemplate:@"Jmm"];
    v5 = v14;
  }
  v6 = [v5 timeSlot];
  v7 = [v6 timeZoneId];
  v8 = +[NSTimeZone timeZoneWithName:v7];

  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    [*(id *)(a1 + 32) setTimeZone:v8];
  }
  else
  {
    v10 = +[NSTimeZone defaultTimeZone];
    [v9 setTimeZone:v10];
  }
  v11 = *(void **)(a1 + 32);
  v12 = [v6 date];
  v13 = [v11 stringFromDate:v12];

  [*(id *)(a1 + 40) addObject:v13];
}

void sub_467C(id a1)
{
  qword_55C90 = +[NSBundle bundleWithIdentifier:@"com.apple.maps.assistant.uiplugin"];

  _objc_release_x1();
}

void sub_4784(id a1)
{
  qword_55CA0 = (uint64_t)objc_alloc_init((Class)NSDateComponentsFormatter);

  _objc_release_x1();
}

void sub_4854(id a1)
{
  qword_55CB0 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);

  _objc_release_x1();
}

void sub_48E4(id a1)
{
  id v3 = +[NSBundle afui_assistantUIFrameworkBundle];
  uint64_t v1 = [v3 assistantUILocale];
  v2 = (void *)qword_55CC0;
  qword_55CC0 = v1;
}

void sub_4A20(id a1)
{
  qword_55CD0 = (uint64_t)objc_alloc_init((Class)NSMeasurementFormatter);

  _objc_release_x1();
}

void sub_4BCC(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = (void *)qword_55CE0;
  qword_55CE0 = (uint64_t)v1;

  id v3 = (void *)qword_55CE0;

  [v3 setMinimumIntegerDigits:1];
}

void sub_578C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_57A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = SBSGetScreenLockStatus();
  BOOL v7 = v6 != 0;
  if (v6) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  v9 = +[NSNumber numberWithBool:a2];
  v16 = +[NSNumber numberWithBool:v7];
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Got do-not-disturb-while-driving exit confirmation response %@ error %@ screen locked %@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_5FA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_5FC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1[7] + 8);
  if (!*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 1;
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Bailed out", a3, a4, a5, a6, a7, a8, v11);
    NSLog(@"MAPS SIRI: We could not get the Maps application to start background nav in a timely fashion.");
    uint64_t v10 = (void *)a1[4];
    id v12 = +[NSURL URLWithString:@"x-maps-reopen:"];
    [v10 _launchMapsWithURL:v12 serviceHelper:a1[5] placeActionDetails:0 completion:a1[6]];
  }
}

void sub_607C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Got response: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_618C;
  block[3] = &unk_308F8;
  uint64_t v21 = *(void *)(a1 + 80);
  uint64_t v11 = *(NSObject **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  id v15 = v3;
  uint64_t v16 = v10;
  id v17 = v12;
  id v20 = *(id *)(a1 + 72);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v13 = v3;
  dispatch_async(v11, block);
}

void sub_618C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v9 + 24))
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: We bailed out before we could get to the start message", a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    *(unsigned char *)(v9 + 24) = 1;
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Preparation done", a3, a4, a5, a6, a7, a8, (uint64_t)v23);
    if ([*(id *)(a1 + 32) navigationState])
    {
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Maps has failed preparing, unlocking.", v11, v12, v13, v14, v15, v16, (uint64_t)v24);
      id v17 = *(void **)(a1 + 40);
      id v25 = +[NSURL URLWithString:@"x-maps-reopen:"];
      [v17 _launchMapsWithURL:v25 serviceHelper:*(void *)(a1 + 48) placeActionDetails:0 completion:*(void *)(a1 + 72)];
    }
    else
    {
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Sending the start message asynchronously and completing successfully", v11, v12, v13, v14, v15, v16, (uint64_t)v24);
      id v18 = *(void **)(a1 + 56);
      id v19 = +[IPCStartNavigationMessage startNavigationMessageWithLoadDirectionsMessage:*(void *)(a1 + 64)];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_633C;
      v26[3] = &unk_308D0;
      id v20 = *(id *)(a1 + 72);
      uint64_t v21 = *(void *)(a1 + 40);
      v22 = *(void **)(a1 + 48);
      id v28 = v20;
      v26[4] = v21;
      id v27 = v22;
      [v18 startPreparedNavigation:v19 completion:v26];
    }
  }
}

void sub_633C(uint64_t a1, void *a2)
{
  if ([a2 success])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = objc_alloc_init((Class)SALocalSearchShowMapPointsCompleted);
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Maps has failed to start prepared navigation, unlocking.", v3, v4, v5, v6, v7, v8, v11);
    uint64_t v10 = *(void **)(a1 + 32);
    id v12 = +[NSURL URLWithString:@"x-maps-reopen:"];
    objc_msgSend(v10, "_launchMapsWithURL:serviceHelper:placeActionDetails:completion:");
  }
}

void sub_73BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_73D4(uint64_t a1, void *a2, int a3)
{
  id v22 = a2;
  uint64_t v5 = +[NSThread callStackSymbols];
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Completion called by %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v18 + 24))
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Bailing out because we have already been called once", v12, v13, v14, v15, v16, v17, v21);
  }
  else
  {
    *(unsigned char *)(v18 + 24) = 1;
    if (a3) {
      [*(id *)(a1 + 32) dismissAssistant];
    }
    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = [v22 dictionary];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
  }
}

void sub_766C(uint64_t a1)
{
  v2 = objc_getAssociatedObject(*(id *)(a1 + 32), off_52710);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(v2, "copy", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) performSelector:NSSelectorFromString(*(NSString **)(*((void *)&v8 + 1) + 8 * (void)v7))];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  objc_setAssociatedObject(*(id *)(a1 + 32), off_52710, 0, (char *)&dword_0 + 1);
  objc_setAssociatedObject(*(id *)(a1 + 32), off_52708, 0, (char *)&dword_0 + 3);
}

id sub_7D00(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_7D0C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v10[0] = a2;
  id v7 = a2;
  long long v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  v10[1] = v8;
  long long v9 = +[NSArray arrayWithObjects:v10 count:2];
  [v6 addObject:v9];
}

id MapsMap(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    id v7 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      long long v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i), &i[v9]);
          if (v12) {
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
        }
        long long v8 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v9 += (uint64_t)i;
      }
      while (v8);
    }

    id v13 = [v5 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

id MapsFlatMap(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v3;
    id obj = v3;
    id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v30;
      p_data = &@"IPCStateProceedToRoute".data;
      do
      {
        long long v11 = 0;
        id v23 = v7;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = v4[2](v4, *(void *)(*((void *)&v29 + 1) + 8 * (void)v11), v8);
          id v13 = v12;
          if (v12)
          {
            if ([v12 conformsToProtocol:p_data[396]])
            {
              uint64_t v14 = v9;
              id v15 = v13;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16)
              {
                id v17 = v16;
                uint64_t v18 = *(void *)v26;
                do
                {
                  for (i = 0; i != v17; i = (char *)i + 1)
                  {
                    if (*(void *)v26 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * i), v22);
                  }
                  id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
                }
                while (v17);
              }

              uint64_t v9 = v14;
              id v7 = v23;
              p_data = (char **)(@"IPCStateProceedToRoute" + 16);
            }
            else
            {
              [v5 addObject:v13];
            }
          }
          ++v8;

          long long v11 = (char *)v11 + 1;
        }
        while (v11 != v7);
        id v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    id v20 = [v5 copy];
    id v3 = v22;
  }
  else
  {
    id v20 = &__NSArray0__struct;
  }

  return v20;
}

id MapsFilter(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        char v15 = 0;
        if (v4[2](v4, v12, v9 + v11, &v15)) {
          [v5 addObject:v12];
        }
        if (v15) {
          break;
        }
        if (v8 == (id)++v11)
        {
          id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          v9 += v11;
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v13 = [v5 copy];
  }
  else
  {
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

id MapsFindFirst(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          char v14 = 0;
          if (v4[2](v4, v11, &i[v8], &v14))
          {
            id v12 = v11;
            goto LABEL_15;
          }
          if (v14) {
            goto LABEL_12;
          }
        }
        id v7 = (char *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        id v12 = 0;
        v8 += (uint64_t)i;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_12:
      id v12 = 0;
    }
LABEL_15:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t MapsAllSatisfies(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          if (!v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), &v10[v8]))
          {
            uint64_t v11 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v7 != v10);
        id v7 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        v8 += (uint64_t)v10;
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id MapsEquals(void *a1, void *a2)
{
  if (a1 == a2) {
    return &dword_0 + 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

__CFString *MapsStringFromBOOL(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void sub_876C(uint64_t a1)
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  id v3 = [*(id *)(a1 + 32) connection];
  id v4 = [v3 remoteObjectProxy];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8858;
  v8[3] = &unk_309C8;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v9 = v2;
  uint64_t v10 = v5;
  id v6 = v2;
  [v4 dismissNavigationSafetyAlertWithReply:v8];

  dispatch_time_t v7 = dispatch_walltime(0, 60000000000);
  dispatch_group_wait(v6, v7);
}

void sub_8858(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_89B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8A60;
  v6[3] = &unk_30A18;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_8A60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_8A74(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8B1C;
  v6[3] = &unk_30AE0;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  void v6[4] = v4;
  id v7 = v5;
  [v2 performWithMapsRunning:v6];
}

void sub_8B1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(IPCLoadDirectionsReply);
    [(IPCLoadDirectionsReply *)v4 setNavigationState:3];
    [(IPCLoadDirectionsReply *)v4 setError:v3];
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Maps failed to launch, returning Failed", v5, v6, v7, v8, v9, v10, v17[0]);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v11 = +[NSBundle mainBundle];
    id v12 = [v11 bundleIdentifier];
    uint64_t v4 = [v12 stringByAppendingString:@".Maps.PrepareNavigation"];

    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = sub_8CF0;
    long long v25 = sub_8D00;
    id v26 = 0;
    id v13 = objc_alloc((Class)BKSProcessAssertion);
    v17[0] = (uint64_t)_NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = (uint64_t)sub_8D08;
    v17[3] = (uint64_t)&unk_30AB8;
    long long v14 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v14;
    id v19 = *(id *)(a1 + 48);
    id v20 = &v21;
    id v15 = [v13 initWithBundleIdentifier:@"com.apple.Maps" flags:43 reason:7 name:v4 withHandler:v17];
    long long v16 = (void *)v22[5];
    v22[5] = (uint64_t)v15;

    _Block_object_dispose(&v21, 8);
  }
}

uint64_t sub_8CF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_8D00(uint64_t a1)
{
}

void sub_8D08(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Prepare navigation assertion acquired", a3, a4, a5, a6, a7, a8, v14);
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_8E60;
    v16[3] = &unk_30A90;
    id v17 = v9;
    id v11 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v11;
    uint64_t v20 = *(void *)(a1 + 56);
    [v10 loadDirectionsWithMessage:v17 completion:v16];
  }
  else
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Failed to acquire assertion, returning Failed", a3, a4, a5, a6, a7, a8, v14);
    id v15 = objc_alloc_init(IPCLoadDirectionsReply);
    [(IPCLoadDirectionsReply *)v15 setNavigationState:3];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_8E60(void *a1, void *a2)
{
  id v3 = a2;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Received reply: %@ for message: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  (*(void (**)(void))(a1[6] + 16))();

  dispatch_time_t v10 = dispatch_time(0, 500000000);
  id v11 = *(NSObject **)(a1[5] + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8F34;
  block[3] = &unk_30A68;
  void block[4] = a1[7];
  dispatch_after(v10, v11, block);
}

void sub_8F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Invalidating prepare navigation assertion", a3, a4, a5, a6, a7, a8, v11);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void sub_90DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9188;
  v6[3] = &unk_30A18;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_9188(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_919C(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9244;
  v6[3] = &unk_30AE0;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  void v6[4] = v4;
  id v7 = v5;
  [v2 performWithMapsRunning:v6];
}

void sub_9244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Maps failed to launch, returning Failed (start prepared)", a3, a4, a5, a6, a7, a8, v23);
    long long v25 = objc_alloc_init(IPCNavigationActionReply);
    [(IPCNavigationActionReply *)v25 setSuccess:0];
    [(IPCNavigationActionReply *)v25 setNavigationActionError:4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface acquiring assertion for prepared directions", a3, a4, a5, a6, a7, a8, v23);
    id v9 = objc_alloc((Class)BKSProcessAssertion);
    dispatch_time_t v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    uint64_t v12 = [v11 stringByAppendingString:@".Maps.StartPreparedNavigation"];
    id v13 = [v9 initWithBundleIdentifier:@"com.apple.Maps" flags:3 reason:4 name:v12];

    if ([v13 acquire])
    {
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Sending start prepared navigation to Maps", v14, v15, v16, v17, v18, v19, v24);
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(NSObject **)(v20 + 8);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_9480;
      block[3] = &unk_30B80;
      void block[4] = v20;
      id v27 = *(id *)(a1 + 40);
      id v28 = v13;
      id v29 = *(id *)(a1 + 48);
      dispatch_async(v21, block);
    }
    else
    {
      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Failed to acquire assertion for prepared directions", v14, v15, v16, v17, v18, v19, v24);
      [v13 invalidate];
      id v22 = objc_alloc_init(IPCNavigationActionReply);
      [(IPCNavigationActionReply *)v22 setSuccess:0];
      [(IPCNavigationActionReply *)v22 setNavigationActionError:5];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_9480(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9550;
  v5[3] = &unk_30B58;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 startPreparedNavigation:v4 reply:v5];
}

void sub_9550(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_967C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_97A8;
  v7[3] = &unk_30BD0;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_98EC;
  v5[3] = &unk_30BF8;
  uint64_t v4 = *(void *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 loadDirections:v4 reply:v5];
}

void sub_97A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Connection error while loading directions: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  dispatch_time_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9878;
  block[3] = &unk_30BA8;
  id v13 = v3;
  id v14 = *(id *)(a1 + 40);
  id v11 = v3;
  dispatch_async(v10, block);
}

void sub_9878(uint64_t a1)
{
  v2 = objc_alloc_init(IPCLoadDirectionsReply);
  [(IPCLoadDirectionsReply *)v2 setNavigationState:3];
  [(IPCLoadDirectionsReply *)v2 setError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_98EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_99A4;
  v7[3] = &unk_30A18;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_99A4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_9B04(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_9B18(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9BD0;
  v4[3] = &unk_30B30;
  id v5 = *(id *)(a1 + 40);
  [v3 endNavigationWithReply:v4];
}

void sub_9BD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9C7C;
  v6[3] = &unk_30A18;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_9C7C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_9CE4(id a1)
{
  uint64_t v1 = [(_MapsIPCInterface *)[MapsSiriIPCInterface alloc] initWithListenerEndpointIdentifier:@"kSiriPluginXPCEndpointIdentifier"];
  v2 = (void *)qword_55CF0;
  qword_55CF0 = (uint64_t)v1;

  id v3 = (void *)qword_55CF0;

  [v3 _startMapsAppStateMonitor];
}

void sub_9E9C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  v2 = [v3 remoteObjectProxy];
  [v2 handleTrafficeReroute:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void sub_9F98(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  v2 = [v3 remoteObjectProxy];
  [v2 endNavigationWithReply:*(void *)(a1 + 40)];
}

void sub_A0C0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  v2 = [v3 remoteObjectProxy];
  [v2 getGuidanceState:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void sub_A1BC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  v2 = [v3 remoteObjectProxy];
  [v2 repeatLastReroutePromptWithReply:*(void *)(a1 + 40)];
}

void sub_A2B8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  v2 = [v3 remoteObjectProxy];
  [v2 repeatLastGuidanceInstructionWithReply:*(void *)(a1 + 40)];
}

void sub_A3E0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];
  [v3 setNavigationMuted:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A4A8;
    block[3] = &unk_30C68;
    id v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_A4A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_A57C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];
  [v3 setNavigationVoiceVolume:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A644;
    block[3] = &unk_30C68;
    id v6 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_A644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void BackgroundStateLog(os_log_type_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = GEOFindOrCreateLog();
  BOOL v12 = os_log_type_enabled(v11, a1);

  if (v12)
  {
    id v13 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:&a9];
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, a1))
    {
      *(_DWORD *)buf = 138477827;
      id v16 = v13;
      _os_log_impl(&dword_0, v14, a1, "%{private}@", buf, 0xCu);
    }
  }
}

id MapsCachedConformsToProtocol(uint64_t a1, Protocol *a2)
{
  uint64_t v3 = objc_opt_class();
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  if (qword_55D10 != -1)
  {
    dispatch_once(&qword_55D10, &stru_30C88);
    if (a2) {
      goto LABEL_4;
    }
    return 0;
  }
  if (!a2) {
    return 0;
  }
LABEL_4:
  unsigned int v5 = atomic_load((unsigned int *)dword_528F8);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_55D00);
  id v6 = [(id)qword_55D08 objectForKey:v4];
  if (!v6)
  {
    id v6 = +[NSMapTable mapTableWithKeyOptions:256 valueOptions:0];
    [(id)qword_55D08 setObject:v6 forKey:v4];
  }
  unsigned int v7 = objc_msgSend(objc_msgSend(v6, "objectForKey:", a2), "unsignedIntegerValue");
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_55D00);
  if (v5 == v7 >> 1) {
    return (id)(v7 & 1);
  }
  id v8 = [v4 conformsToProtocol:a2];
  if (qword_55D20 != -1) {
    dispatch_once(&qword_55D20, &stru_30CA8);
  }
  id v9 = (void *)qword_55D18;
  if (os_log_type_enabled((os_log_t)qword_55D18, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = NSStringFromClass((Class)v4);
    if (v8) {
      BOOL v12 = "conforms to";
    }
    else {
      BOOL v12 = "does not conform to";
    }
    id v13 = NSStringFromProtocol(a2);
    int v16 = 138544130;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    __int16 v22 = 1024;
    unsigned int v23 = v5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%{public}@ %s %{public}@ (gen: %u)", (uint8_t *)&v16, 0x26u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_55D00);
  id v14 = +[NSNumber numberWithUnsignedInt:v8 | (2 * v5)];
  [v6 setObject:v14 forKey:a2];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_55D00);
  return v8;
}

void sub_ACFC(id a1)
{
  objc_addLoadImageFunc((objc_func_loadImage)sub_AD58);
  qword_55D08 = +[NSMapTable mapTableWithKeyOptions:256 valueOptions:0];

  _objc_release_x1();
}

void sub_AD58()
{
}

void sub_AD6C(id a1)
{
  qword_55D18 = (uint64_t)os_log_create("com.apple.Maps", "MapsProtocolConformance");

  _objc_release_x1();
}

void sub_B358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_B370(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    id v9 = v5;
    if (a3) {
      [*(id *)(a1 + 32) dismissAssistant];
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v9 dictionary];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    id v5 = v9;
  }
}

void sub_B54C(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ([v11 success])
  {
    id v3 = objc_alloc_init((Class)SALocalSearchNavigationPromptManeuverCompleted);
    goto LABEL_9;
  }
  id v4 = (char *)[v11 navigationActionError];
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    id v6 = objc_alloc((Class)SACommandFailed);
    CFStringRef v7 = @"Instructions are nil, nothing to say";
  }
  else
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      id v5 = objc_alloc((Class)SACommandFailed);
      id v3 = [v5 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
      goto LABEL_9;
    }
    id v6 = objc_alloc((Class)SACommandFailed);
    CFStringRef v7 = @"Unknown error";
  }
  id v3 = [v6 initWithReason:v7];
LABEL_9:
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_BE14(id a1)
{
  qword_55D30 = objc_opt_new();

  _objc_release_x1();
}

void sub_C060(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

id sub_C07C()
{
  if (qword_55D40 != -1) {
    dispatch_once(&qword_55D40, &stru_30D38);
  }
  v0 = (void *)qword_55D38;

  return v0;
}

void sub_C0D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _populateExternalDevice];
}

id sub_C110(uint64_t a1)
{
  return [*(id *)(a1 + 32) _populateExternalDevice];
}

uint64_t sub_C254(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_C264(uint64_t a1)
{
}

void sub_C26C(uint64_t a1)
{
}

void sub_C410(uint64_t a1)
{
  uint64_t v2 = sub_C07C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Allowing previous value of currentCarPlayExternalDevice to deallocate: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_C4FC(id a1)
{
  qword_55D38 = (uint64_t)os_log_create("com.apple.Maps", "MapsCarPlayExternalDeviceMonitor");

  _objc_release_x1();
}

void sub_C6D4(uint64_t a1)
{
  id v4 = objc_alloc_init((Class)SACommandSucceeded);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [v4 dictionary];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_E508(uint64_t a1)
{
  id v4 = objc_alloc_init((Class)SALocalSearchSetNavigationVoiceVolumeCompleted);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [v4 dictionary];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_EC54(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ([v11 success])
  {
    id v3 = objc_alloc_init((Class)SALocalSearchNavigationPromptManeuverCompleted);
    goto LABEL_9;
  }
  id v4 = (char *)[v11 navigationActionError];
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    id v6 = objc_alloc((Class)SACommandFailed);
    CFStringRef v7 = @"No traffic prompt to repeat";
  }
  else
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      id v5 = objc_alloc((Class)SACommandFailed);
      id v3 = [v5 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
      goto LABEL_9;
    }
    id v6 = objc_alloc((Class)SACommandFailed);
    CFStringRef v7 = @"Unknown error";
  }
  id v3 = [v6 initWithReason:v7];
LABEL_9:
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void *MapsConfig_GetUserDefaultStringKeysForWatchSync()
{
  return &__NSArray0__struct;
}

_UNKNOWN **MapsConfig_GetConfigStoreStringKeysForWatchSync()
{
  return &off_4A920;
}

id sub_ED60(id a1)
{
  return &__kCFBooleanTrue;
}

void sub_ED6C()
{
  if (qword_55D48 != -1) {
    dispatch_once(&qword_55D48, &stru_3B620);
  }
}

void sub_ED94(id a1)
{
  byte_55C20 = 1;
  __GEOConfigRegisterStateCaptureFunctions(sub_EDC4, sub_EDD0);
}

_UNKNOWN **sub_EDC4()
{
  return &off_4A938;
}

_UNKNOWN **sub_EDD0()
{
  return &off_4A950;
}

id sub_EDDC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_EDE8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_EDF4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_EE00(id a1)
{
  return &off_4A128;
}

id sub_EE0C(id a1)
{
  return &off_4A140;
}

id sub_EE18(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_EE24(id a1)
{
  uint64_t v1 = +[GEOPlatform sharedPlatform];
  uint64_t v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 isInternalInstall]);

  return v2;
}

id sub_EE8C(id a1)
{
  return &off_49D78;
}

id sub_EE98(id a1)
{
  return &off_49D88;
}

id sub_EEA4(id a1)
{
  return &off_49D98;
}

id sub_EEB0(id a1)
{
  return &off_49DA8;
}

id sub_EEBC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_EEC8(id a1)
{
  return &off_4A158;
}

id sub_EED4(id a1)
{
  return &off_4A170;
}

id sub_EEE0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_EEEC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_EEF8(id a1)
{
  return &off_4A188;
}

id sub_EF04(id a1)
{
  return &off_4A1A0;
}

id sub_EF10(id a1)
{
  return &off_4A1B8;
}

id sub_EF1C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_EF28(id a1)
{
  return &off_4A968;
}

id sub_EF34(id a1)
{
  return &off_49DB8;
}

id sub_EF40(id a1)
{
  return &off_49DC8;
}

id sub_EF4C(id a1)
{
  return &off_4A188;
}

id sub_EF58(id a1)
{
  return 0;
}

id sub_EF60(id a1)
{
  return &off_49DD8;
}

id sub_EF6C(id a1)
{
  return &off_49DE8;
}

id sub_EF78(id a1)
{
  return &off_49DF8;
}

id sub_EF84(id a1)
{
  return &off_49E08;
}

id sub_EF90(id a1)
{
  return &off_49E18;
}

id sub_EF9C(id a1)
{
  return &off_49DB8;
}

id sub_EFA8(id a1)
{
  return &off_49E28;
}

id sub_EFB4(id a1)
{
  return &off_49E08;
}

id sub_EFC0(id a1)
{
  return &off_4A140;
}

id sub_EFCC(id a1)
{
  return &off_49E38;
}

id sub_EFD8(id a1)
{
  return &off_49E18;
}

id sub_EFE4(id a1)
{
  return &off_49E48;
}

id sub_EFF0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_EFFC(id a1)
{
  return &off_4A1D0;
}

id sub_F008(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F014(id a1)
{
  return &off_4A1E8;
}

id sub_F020(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F02C(id a1)
{
  return &off_4A200;
}

id sub_F038(id a1)
{
  return &off_49DD8;
}

id sub_F044(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F050(id a1)
{
  return 0;
}

id sub_F058(id a1)
{
  return &off_49E58;
}

id sub_F064(id a1)
{
  return &off_4A218;
}

id sub_F070(id a1)
{
  return &off_4A170;
}

id sub_F07C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F088(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F094(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F0A0(id a1)
{
  return &off_4A140;
}

id sub_F0AC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F0B8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F0C4(id a1)
{
  return &off_4A230;
}

id sub_F0D0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F0DC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F0E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F0F4(id a1)
{
  return &off_4A248;
}

id sub_F100(id a1)
{
  return &off_49E08;
}

id sub_F10C(id a1)
{
  return &off_49E68;
}

id sub_F118(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F124(id a1)
{
  return &off_4A260;
}

id sub_F130(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F13C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F148(id a1)
{
  return &off_4A170;
}

id sub_F154(id a1)
{
  return &off_4A140;
}

id sub_F160(id a1)
{
  return &off_4A278;
}

id sub_F16C(id a1)
{
  return &off_4A290;
}

id sub_F178(id a1)
{
  return &off_4A2A8;
}

id sub_F184(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F190(id a1)
{
  return &off_4A2C0;
}

id sub_F19C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F1A8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F1B4(id a1)
{
  return &off_4A2D8;
}

id sub_F1C0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F1CC(id a1)
{
  return &off_49E68;
}

id sub_F1D8(id a1)
{
  return &off_49DD8;
}

id sub_F1E4(id a1)
{
  return &off_4A2F0;
}

id sub_F1F0(id a1)
{
  return &off_4A2C0;
}

id sub_F1FC(id a1)
{
  return &off_4A2F0;
}

id sub_F208(id a1)
{
  return &off_4A308;
}

id sub_F214(id a1)
{
  return &off_4A320;
}

id sub_F220(id a1)
{
  return &off_49E78;
}

id sub_F22C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F238(id a1)
{
  return &off_4A338;
}

id sub_F244(id a1)
{
  return &off_4A140;
}

id sub_F250(id a1)
{
  return &off_4A338;
}

id sub_F25C(id a1)
{
  return &off_4A2C0;
}

id sub_F268(id a1)
{
  return &off_4A140;
}

id sub_F274(id a1)
{
  return &off_4A140;
}

id sub_F280(id a1)
{
  return &off_4A200;
}

id sub_F28C(id a1)
{
  return &off_4A350;
}

id sub_F298(id a1)
{
  return &off_4A368;
}

id sub_F2A4(id a1)
{
  return &off_4A380;
}

id sub_F2B0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F2BC(id a1)
{
  return &off_4A398;
}

id sub_F2C8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F2D4(id a1)
{
  return @"inbox.appleid.apple.com";
}

id sub_F2E0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F2EC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F2F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F304(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F310(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F31C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F328(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F334(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F340(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F34C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F358(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F364(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F370(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F37C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F388(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F394(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F3A0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F3AC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F3B8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F3C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F3D0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F3DC(id a1)
{
  return &off_4A3B0;
}

id sub_F3E8(id a1)
{
  return &off_4A338;
}

id sub_F3F4(id a1)
{
  return &off_49D38;
}

id sub_F400(id a1)
{
  return &off_49D48;
}

id sub_F40C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F418(id a1)
{
  return &off_4A380;
}

id sub_F424(id a1)
{
  return &off_4A380;
}

id sub_F430(id a1)
{
  return &off_4A2C0;
}

id sub_F43C(id a1)
{
  return &off_4A278;
}

id sub_F448(id a1)
{
  return &off_4A380;
}

id sub_F454(id a1)
{
  return &off_4A3C8;
}

id sub_F460(id a1)
{
  return &off_4A1B8;
}

id sub_F46C(id a1)
{
  return &off_4A338;
}

id sub_F478(id a1)
{
  return &off_4A338;
}

id sub_F484(id a1)
{
  return &off_4A338;
}

id sub_F490(id a1)
{
  return &off_4A140;
}

id sub_F49C(id a1)
{
  return &off_4A3E0;
}

id sub_F4A8(id a1)
{
  return &off_4A2F0;
}

id sub_F4B4(id a1)
{
  return 0;
}

id sub_F4BC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F4C8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F4D4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F4E0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F4EC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F4F8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F504(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F510(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F51C(id a1)
{
  return &off_4A3F8;
}

id sub_F528(id a1)
{
  return &off_49E88;
}

id sub_F534(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F540(id a1)
{
  return &off_49E58;
}

id sub_F54C(id a1)
{
  return &off_49E98;
}

id sub_F558(id a1)
{
  return &off_4A410;
}

id sub_F564(id a1)
{
  return &off_4A380;
}

id sub_F570(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F57C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F588(id a1)
{
  return &off_49DA8;
}

id sub_F594(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F5A0(id a1)
{
  return &off_4A398;
}

id sub_F5AC(id a1)
{
  return &off_49EA8;
}

id sub_F5B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F5C4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F5D0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F5DC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F5E8(id a1)
{
  return &off_49EB8;
}

id sub_F5F4(id a1)
{
  return &off_49DE8;
}

id sub_F600(id a1)
{
  return &off_49EC8;
}

id sub_F60C(id a1)
{
  return &off_49ED8;
}

id sub_F618(id a1)
{
  return &off_4A2C0;
}

id sub_F624(id a1)
{
  return &off_49EE8;
}

id sub_F630(id a1)
{
  return &off_49DC8;
}

id sub_F63C(id a1)
{
  return &off_49EF8;
}

id sub_F648(id a1)
{
  return &off_49F08;
}

id sub_F654(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F660(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F66C(id a1)
{
  return &off_49DD8;
}

id sub_F678(id a1)
{
  return &off_49F18;
}

id sub_F684(id a1)
{
  return &off_4A170;
}

id sub_F690(id a1)
{
  return &off_4A368;
}

id sub_F69C(id a1)
{
  return &off_4A2D8;
}

id sub_F6A8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F6B4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F6C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F6CC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F6D8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F6E4(id a1)
{
  return &off_4A140;
}

id sub_F6F0(id a1)
{
  return &off_4A428;
}

id sub_F6FC(id a1)
{
  return &off_49E28;
}

id sub_F708(id a1)
{
  return &off_49F08;
}

id sub_F714(id a1)
{
  return &off_49F28;
}

id sub_F720(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F72C(id a1)
{
  return &off_4A278;
}

id sub_F738(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F744(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F750(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F75C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F768(id a1)
{
  return &off_4A440;
}

id sub_F774(id a1)
{
  return &off_4A170;
}

id sub_F780(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F78C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F798(id a1)
{
  return &off_4A2D8;
}

id sub_F7A4(id a1)
{
  return &off_4A1B8;
}

id sub_F7B0(id a1)
{
  return &off_4A458;
}

id sub_F7BC(id a1)
{
  return &off_4A470;
}

id sub_F7C8(id a1)
{
  return &off_4A470;
}

id sub_F7D4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F7E0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F7EC(id a1)
{
  return &off_4A488;
}

id sub_F7F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F804(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F810(id a1)
{
  return &off_4A3C8;
}

id sub_F81C(id a1)
{
  return &off_4A200;
}

id sub_F828(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F834(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F840(id a1)
{
  return &off_4A278;
}

id sub_F84C(id a1)
{
  return &off_4A4A0;
}

id sub_F858(id a1)
{
  return &off_4A128;
}

id sub_F864(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F870(id a1)
{
  return &off_4A170;
}

id sub_F87C(id a1)
{
  return &off_49F38;
}

id sub_F888(id a1)
{
  return &off_49F48;
}

id sub_F894(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F8A0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F8AC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F8B8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F8C4(id a1)
{
  return &off_4A170;
}

id sub_F8D0(id a1)
{
  return &off_4A170;
}

id sub_F8DC(id a1)
{
  return &off_49DB8;
}

id sub_F8E8(id a1)
{
  return &off_4A200;
}

id sub_F8F4(id a1)
{
  return &off_4A4B8;
}

id sub_F900(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F90C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F918(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F924(id a1)
{
  return &off_49EA8;
}

id sub_F930(id a1)
{
  return &off_4A2C0;
}

id sub_F93C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F948(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F954(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F960(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F96C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F978(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F984(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F990(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F99C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F9A8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_F9B4(id a1)
{
  return &off_49F18;
}

id sub_F9C0(id a1)
{
  return &off_49DD8;
}

id sub_F9CC(id a1)
{
  return &off_49F58;
}

id sub_F9D8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F9E4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_F9F0(id a1)
{
  return &off_4A368;
}

id sub_F9FC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FA08(id a1)
{
  return &off_49DD8;
}

id sub_FA14(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FA20(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FA2C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FA38(id a1)
{
  return &off_4A470;
}

id sub_FA44(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FA50(id a1)
{
  return &off_4A170;
}

id sub_FA5C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FA68(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FA74(id a1)
{
  return &off_4A338;
}

id sub_FA80(id a1)
{
  return &off_4A428;
}

id sub_FA8C(id a1)
{
  return &off_49E38;
}

id sub_FA98(id a1)
{
  return &off_4A200;
}

id sub_FAA4(id a1)
{
  return &off_4A200;
}

id sub_FAB0(id a1)
{
  return &off_4A278;
}

id sub_FABC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FAC8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FAD4(id a1)
{
  return &off_4A380;
}

id sub_FAE0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FAEC(id a1)
{
  return @"https://www.apple.com/legal/internet-services/maps/ratings-photos/";
}

id sub_FAF8(id a1)
{
  return &off_4A140;
}

id sub_FB04(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FB10(id a1)
{
  return &off_4A2C0;
}

id sub_FB1C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FB28(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FB34(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FB40(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FB4C(id a1)
{
  return &off_4A4D0;
}

id sub_FB58(id a1)
{
  return &off_4A4E8;
}

id sub_FB64(id a1)
{
  return &off_4A500;
}

id sub_FB70(id a1)
{
  return &off_4A518;
}

id sub_FB7C(id a1)
{
  return &off_49F68;
}

id sub_FB88(id a1)
{
  return &off_49F78;
}

id sub_FB94(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FBA0(id a1)
{
  return &off_49F88;
}

id sub_FBAC(id a1)
{
  return &off_49F98;
}

id sub_FBB8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FBC4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FBD0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FBDC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FBE8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FBF4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC00(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC0C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC18(id a1)
{
  return &off_4A2F0;
}

id sub_FC24(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC30(id a1)
{
  return &off_4A2C0;
}

id sub_FC3C(id a1)
{
  return &off_4A368;
}

id sub_FC48(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC54(id a1)
{
  return @"https://www.apple.com/ios/feature-availability/#maps-cycling";
}

id sub_FC60(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FC6C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC78(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC84(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FC90(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FC9C(id a1)
{
  return &off_4A170;
}

id sub_FCA8(id a1)
{
  return &off_4A1E8;
}

id sub_FCB4(id a1)
{
  return &off_4A3B0;
}

id sub_FCC0(id a1)
{
  return &off_4A470;
}

id sub_FCCC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FCD8(id a1)
{
  return &off_4A458;
}

id sub_FCE4(id a1)
{
  return &off_4A1B8;
}

id sub_FCF0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FCFC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FD08(id a1)
{
  return &off_4A2C0;
}

id sub_FD14(id a1)
{
  return &off_4A458;
}

id sub_FD20(id a1)
{
  return &off_4A278;
}

id sub_FD2C(id a1)
{
  return &off_4A2D8;
}

id sub_FD38(id a1)
{
  return &off_4A470;
}

id sub_FD44(id a1)
{
  return &off_4A1B8;
}

id sub_FD50(id a1)
{
  return &off_4A980;
}

id sub_FD5C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FD68(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FD74(id a1)
{
  return &off_4A4B8;
}

id sub_FD80(id a1)
{
  return &off_4A4D0;
}

id sub_FD8C(id a1)
{
  return &off_4A440;
}

id sub_FD98(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FDA4(id a1)
{
  return &off_4A548;
}

id sub_FDB0(id a1)
{
  return &off_4A548;
}

id sub_FDBC(id a1)
{
  return &off_4A200;
}

id sub_FDC8(id a1)
{
  return 0;
}

id sub_FDD0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FDDC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FDE8(id a1)
{
  return 0;
}

id sub_FDF0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FDFC(id a1)
{
  return &off_4A170;
}

id sub_FE08(id a1)
{
  return &off_4A170;
}

id sub_FE14(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FE20(id a1)
{
  return &off_4A560;
}

id sub_FE2C(id a1)
{
  return &off_4A278;
}

id sub_FE38(id a1)
{
  return &off_4A1D0;
}

id sub_FE44(id a1)
{
  return &off_4A578;
}

id sub_FE50(id a1)
{
  return @"https://www.apple.com/legal/internet-services/maps/";
}

id sub_FE5C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FE68(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FE74(id a1)
{
  return &off_4A368;
}

id sub_FE80(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FE8C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FE98(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FEA4(id a1)
{
  return &off_4A1B8;
}

id sub_FEB0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_FEBC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FEC8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FED4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FEE0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FEEC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FEF8(id a1)
{
  return &off_49E38;
}

id sub_FF04(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF10(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF1C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF28(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF34(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF40(id a1)
{
  return &off_4A338;
}

id sub_FF4C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF58(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF64(id a1)
{
  return &off_4A2D8;
}

id sub_FF70(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_FF7C(id a1)
{
  return &off_4A338;
}

id sub_FF88(id a1)
{
  return &off_49FA8;
}

id sub_FF94(id a1)
{
  return &off_4A338;
}

id sub_FFA0(id a1)
{
  return &off_4A170;
}

id sub_FFAC(id a1)
{
  return &off_4A140;
}

id sub_FFB8(id a1)
{
  return &off_4A2C0;
}

id sub_FFC4(id a1)
{
  return &off_4A338;
}

id sub_FFD0(id a1)
{
  return &off_4A590;
}

id sub_FFDC(id a1)
{
  return &off_4A170;
}

id sub_FFE8(id a1)
{
  return &off_4A140;
}

id sub_FFF4(id a1)
{
  return &off_4A278;
}

id sub_10000(id a1)
{
  return &off_4A338;
}

id sub_1000C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10018(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10024(id a1)
{
  return &off_4A5A8;
}

id sub_10030(id a1)
{
  return &off_4A1A0;
}

id sub_1003C(id a1)
{
  return &off_4A380;
}

id sub_10048(id a1)
{
  return &off_4A3F8;
}

id sub_10054(id a1)
{
  return &off_4A380;
}

id sub_10060(id a1)
{
  return &off_4A380;
}

id sub_1006C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10078(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10084(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10090(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1009C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_100A8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_100B4(id a1)
{
  return &off_49FB8;
}

id sub_100C0(id a1)
{
  return 0;
}

id sub_100C8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_100D4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_100E0(id a1)
{
  return &off_49E28;
}

id sub_100EC(id a1)
{
  return &off_49FC8;
}

id sub_100F8(id a1)
{
  return &off_4A2C0;
}

id sub_10104(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10110(id a1)
{
  return &off_49EB8;
}

id sub_1011C(id a1)
{
  return &off_4A2F0;
}

id sub_10128(id a1)
{
  return &off_4A128;
}

id sub_10134(id a1)
{
  return &off_4A5C0;
}

id sub_10140(id a1)
{
  return &off_4A5D8;
}

id sub_1014C(id a1)
{
  return &off_49E08;
}

id sub_10158(id a1)
{
  return &off_4A290;
}

id sub_10164(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10170(id a1)
{
  return &off_49E88;
}

id sub_1017C(id a1)
{
  return &off_4A380;
}

id sub_10188(id a1)
{
  return &off_4A170;
}

id sub_10194(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_101A0(id a1)
{
  return &off_4A380;
}

id sub_101AC(id a1)
{
  return &off_4A380;
}

id sub_101B8(id a1)
{
  return &off_49FD8;
}

id sub_101C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_101D0(id a1)
{
  return &off_49FE8;
}

id sub_101DC(id a1)
{
  return &off_4A200;
}

id sub_101E8(id a1)
{
  return &off_4A200;
}

id sub_101F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10200(id a1)
{
  return &off_4A458;
}

id sub_1020C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10218(id a1)
{
  return &off_49EB8;
}

id sub_10224(id a1)
{
  return &off_49E88;
}

id sub_10230(id a1)
{
  return &off_49E08;
}

id sub_1023C(id a1)
{
  return &off_4A590;
}

id sub_10248(id a1)
{
  return &off_4A170;
}

id sub_10254(id a1)
{
  return &off_4A410;
}

id sub_10260(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1026C(id a1)
{
  return &off_49DB8;
}

id sub_10278(id a1)
{
  return &off_49E88;
}

id sub_10284(id a1)
{
  return &off_49FF8;
}

id sub_10290(id a1)
{
  return &off_49E88;
}

id sub_1029C(id a1)
{
  return &off_4A008;
}

id sub_102A8(id a1)
{
  return &off_49E88;
}

id sub_102B4(id a1)
{
  return &off_4A018;
}

id sub_102C0(id a1)
{
  return &off_49E88;
}

id sub_102CC(id a1)
{
  return &off_4A028;
}

id sub_102D8(id a1)
{
  return &off_49E88;
}

id sub_102E4(id a1)
{
  return &off_49FF8;
}

id sub_102F0(id a1)
{
  return &off_49E88;
}

id sub_102FC(id a1)
{
  return &off_49EE8;
}

id sub_10308(id a1)
{
  return &off_49E88;
}

id sub_10314(id a1)
{
  return &off_4A038;
}

id sub_10320(id a1)
{
  return &off_49FF8;
}

id sub_1032C(id a1)
{
  return &off_49E88;
}

id sub_10338(id a1)
{
  return &off_4A008;
}

id sub_10344(id a1)
{
  return &off_49E88;
}

id sub_10350(id a1)
{
  return &off_49EB8;
}

id sub_1035C(id a1)
{
  return &off_49E88;
}

id sub_10368(id a1)
{
  return 0;
}

id sub_10370(id a1)
{
  return 0;
}

id sub_10378(id a1)
{
  return &off_4A5F0;
}

id sub_10384(id a1)
{
  return &off_4A410;
}

id sub_10390(id a1)
{
  return 0;
}

id sub_10398(id a1)
{
  return &off_4A608;
}

id sub_103A4(id a1)
{
  return 0;
}

id sub_103AC(id a1)
{
  return 0;
}

id sub_103B4(id a1)
{
  return &off_4A170;
}

id sub_103C0(id a1)
{
  return &off_4A140;
}

id sub_103CC(id a1)
{
  return &off_4A200;
}

id sub_103D8(id a1)
{
  return &off_4A200;
}

id sub_103E4(id a1)
{
  return &off_4A620;
}

id sub_103F0(id a1)
{
  return &off_4A170;
}

id sub_103FC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10408(id a1)
{
  return &off_4A2C0;
}

id sub_10414(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10420(id a1)
{
  return &off_4A128;
}

id sub_1042C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10438(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10444(id a1)
{
  return &off_4A140;
}

id sub_10450(id a1)
{
  return &off_4A380;
}

id sub_1045C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10468(id a1)
{
  return &off_4A470;
}

id sub_10474(id a1)
{
  return &off_4A1B8;
}

id sub_10480(id a1)
{
  return &off_4A458;
}

id sub_1048C(id a1)
{
  return &off_4A338;
}

id sub_10498(id a1)
{
  return &off_4A128;
}

id sub_104A4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_104B0(id a1)
{
  return &off_4A518;
}

id sub_104BC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_104C8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_104D4(id a1)
{
  return &off_4A200;
}

id sub_104E0(id a1)
{
  return &off_4A2F0;
}

id sub_104EC(id a1)
{
  return &off_4A170;
}

id sub_104F8(id a1)
{
  return &off_4A5A8;
}

id sub_10504(id a1)
{
  return &off_4A9C8;
}

id sub_10510(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1051C(id a1)
{
  return &off_4A2C0;
}

id sub_10528(id a1)
{
  return &off_4A368;
}

id sub_10534(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10540(id a1)
{
  return &off_4A638;
}

id sub_1054C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10558(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10564(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10570(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1057C(id a1)
{
  return &off_4A428;
}

id sub_10588(id a1)
{
  return &off_4A380;
}

id sub_10594(id a1)
{
  return &off_4A230;
}

id sub_105A0(id a1)
{
  return &off_4A9F0;
}

id sub_105AC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_105B8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_105C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_105D0(id a1)
{
  return &off_49FD8;
}

id sub_105DC(id a1)
{
  return &off_4A200;
}

id sub_105E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_105F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10600(id a1)
{
  return &off_4A278;
}

id sub_1060C(id a1)
{
  return &off_4A368;
}

id sub_10618(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10624(id a1)
{
  return &off_4A278;
}

id sub_10630(id a1)
{
  return &off_4A128;
}

id sub_1063C(id a1)
{
  return &off_4A140;
}

id sub_10648(id a1)
{
  return &off_4A140;
}

id sub_10654(id a1)
{
  return &off_4A170;
}

id sub_10660(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1066C(id a1)
{
  return &off_49E38;
}

id sub_10678(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10684(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10690(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1069C(id a1)
{
  return &off_4A320;
}

id sub_106A8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_106B4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_106C0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_106CC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_106D8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_106E4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_106F0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_106FC(id a1)
{
  return &off_49E38;
}

id sub_10708(id a1)
{
  return &off_4A170;
}

id sub_10714(id a1)
{
  return &off_4A170;
}

id sub_10720(id a1)
{
  return &off_4A2C0;
}

id sub_1072C(id a1)
{
  return &off_4A200;
}

id sub_10738(id a1)
{
  return &off_49FD8;
}

id sub_10744(id a1)
{
  return &off_49F88;
}

id sub_10750(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1075C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10768(id a1)
{
  return &off_4A650;
}

id sub_10774(id a1)
{
  return &off_4A650;
}

id sub_10780(id a1)
{
  return &off_4A650;
}

id sub_1078C(id a1)
{
  return &off_4A048;
}

id sub_10798(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_107A4(id a1)
{
  return &off_4A290;
}

id sub_107B0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_107BC(id a1)
{
  return &off_4A1B8;
}

id sub_107C8(id a1)
{
  return &off_4A278;
}

id sub_107D4(id a1)
{
  return &off_49FE8;
}

id sub_107E0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_107EC(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_107F8(id a1)
{
  return &off_4A248;
}

id sub_10804(id a1)
{
  return &off_4A248;
}

id sub_10810(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1081C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10828(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10834(id a1)
{
  return &off_4A170;
}

id sub_10840(id a1)
{
  return &off_4A668;
}

id sub_1084C(id a1)
{
  return &off_49E28;
}

id sub_10858(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10864(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10870(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1087C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10888(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10894(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_108A0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_108AC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_108B8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_108C4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_108D0(id a1)
{
  return &off_4A2C0;
}

id sub_108DC(id a1)
{
  return &off_4A338;
}

id sub_108E8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_108F4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10900(id a1)
{
  return 0;
}

id sub_10908(id a1)
{
  return 0;
}

id sub_10910(id a1)
{
  return &off_4A008;
}

id sub_1091C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10928(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10934(id a1)
{
  return &off_4A680;
}

id sub_10940(id a1)
{
  return &off_4A368;
}

id sub_1094C(id a1)
{
  return &off_49E38;
}

id sub_10958(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10964(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10970(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1097C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10988(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10994(id a1)
{
  return &off_4A058;
}

id sub_109A0(id a1)
{
  return &off_4A068;
}

id sub_109AC(id a1)
{
  return &off_4A3C8;
}

id sub_109B8(id a1)
{
  return &off_4A650;
}

id sub_109C4(id a1)
{
  return &off_4A380;
}

id sub_109D0(id a1)
{
  return &off_4A278;
}

id sub_109DC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_109E8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_109F4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10A00(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10A0C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10A18(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10A24(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10A30(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10A3C(id a1)
{
  return &off_4A2F0;
}

id sub_10A48(id a1)
{
  return &off_4A368;
}

id sub_10A54(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10A60(id a1)
{
  return &off_4A2C0;
}

id sub_10A6C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10A78(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10A84(id a1)
{
  return &off_4A140;
}

id sub_10A90(id a1)
{
  return &off_49E38;
}

id sub_10A9C(id a1)
{
  return &off_4A278;
}

id sub_10AA8(id a1)
{
  return &off_4A338;
}

id sub_10AB4(id a1)
{
  return &off_4A170;
}

id sub_10AC0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10ACC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10AD8(id a1)
{
  return &off_4A338;
}

id sub_10AE4(id a1)
{
  return &off_4A278;
}

id sub_10AF0(id a1)
{
  return &off_49E38;
}

id sub_10AFC(id a1)
{
  return &__NSArray0__struct;
}

id sub_10B08(id a1)
{
  return &off_4A380;
}

id sub_10B14(id a1)
{
  return &off_4A1B8;
}

id sub_10B20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10B2C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10B38(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10B44(id a1)
{
  return &off_4A078;
}

id sub_10B50(id a1)
{
  return &off_4A368;
}

id sub_10B5C(id a1)
{
  return &off_4A200;
}

id sub_10B68(id a1)
{
  return &off_4A500;
}

id sub_10B74(id a1)
{
  return &off_49E88;
}

id sub_10B80(id a1)
{
  return &off_4A088;
}

id sub_10B8C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10B98(id a1)
{
  return &off_4A698;
}

id sub_10BA4(id a1)
{
  return &off_4A6B0;
}

id sub_10BB0(id a1)
{
  return &off_4A578;
}

id sub_10BBC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10BC8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10BD4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10BE0(id a1)
{
  return &off_49E68;
}

id sub_10BEC(id a1)
{
  return &off_4A098;
}

id sub_10BF8(id a1)
{
  return &off_49F88;
}

id sub_10C04(id a1)
{
  return &off_4A0A8;
}

id sub_10C10(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C1C(id a1)
{
  return &off_49FD8;
}

id sub_10C28(id a1)
{
  return &off_4A440;
}

id sub_10C34(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C40(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10C4C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C58(id a1)
{
  return &off_4A278;
}

id sub_10C64(id a1)
{
  return &off_4A2F0;
}

id sub_10C70(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10C7C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10C88(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10C94(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10CA0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10CAC(id a1)
{
  return &off_4A6C8;
}

id sub_10CB8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10CC4(id a1)
{
  return &off_4A1B8;
}

id sub_10CD0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10CDC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10CE8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10CF4(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D00(id a1)
{
  return &off_4A200;
}

id sub_10D0C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10D18(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D24(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10D30(id a1)
{
  return &off_4A2C0;
}

id sub_10D3C(id a1)
{
  return &off_49FD8;
}

id sub_10D48(id a1)
{
  return &off_4A530;
}

id sub_10D54(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D60(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10D6C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D78(id a1)
{
  return &off_49F58;
}

id sub_10D84(id a1)
{
  return &off_4A6E0;
}

id sub_10D90(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10D9C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10DA8(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10DB4(id a1)
{
  return &off_4A2F0;
}

id sub_10DC0(id a1)
{
  return &off_4A2F0;
}

id sub_10DCC(id a1)
{
  return &off_4A2F0;
}

id sub_10DD8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10DE4(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10DF0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10DFC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E08(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10E14(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10E20(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E2C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E38(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E44(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10E50(id a1)
{
  return &off_4A2F0;
}

id sub_10E5C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10E68(id a1)
{
  return &off_4A560;
}

id sub_10E74(id a1)
{
  return &off_4A338;
}

id sub_10E80(id a1)
{
  return &off_4A338;
}

id sub_10E8C(id a1)
{
  return &off_4A140;
}

id sub_10E98(id a1)
{
  return &off_4A338;
}

id sub_10EA4(id a1)
{
  return &off_49FB8;
}

id sub_10EB0(id a1)
{
  return &off_4A6F8;
}

id sub_10EBC(id a1)
{
  return &off_4A710;
}

id sub_10EC8(id a1)
{
  return &off_4A728;
}

id sub_10ED4(id a1)
{
  return &off_4A740;
}

id sub_10EE0(id a1)
{
  return &off_4A758;
}

id sub_10EEC(id a1)
{
  return &off_4A770;
}

id sub_10EF8(id a1)
{
  return &off_4A440;
}

id sub_10F04(id a1)
{
  return &off_4A3E0;
}

id sub_10F10(id a1)
{
  return &off_4A3E0;
}

id sub_10F1C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10F28(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10F34(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10F40(id a1)
{
  return &off_4A3E0;
}

id sub_10F4C(id a1)
{
  return &off_4A0B8;
}

id sub_10F58(id a1)
{
  return &off_4A3E0;
}

id sub_10F64(id a1)
{
  return &off_49FB8;
}

id sub_10F70(id a1)
{
  return &off_4A1D0;
}

id sub_10F7C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10F88(id a1)
{
  return &off_4A3E0;
}

id sub_10F94(id a1)
{
  return &off_4A3E0;
}

id sub_10FA0(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10FAC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10FB8(id a1)
{
  return &off_4A458;
}

id sub_10FC4(id a1)
{
  return &off_4A170;
}

id sub_10FD0(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10FDC(id a1)
{
  return &off_4A278;
}

id sub_10FE8(id a1)
{
  return &off_4A1B8;
}

id sub_10FF4(id a1)
{
  return &off_4A5A8;
}

id sub_11000(id a1)
{
  return &off_4A4E8;
}

id sub_1100C(id a1)
{
  return 0;
}

id sub_11014(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11020(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1102C(id a1)
{
  return &off_4A788;
}

id sub_11038(id a1)
{
  return &off_4A2F0;
}

id sub_11044(id a1)
{
  return &off_4A338;
}

id sub_11050(id a1)
{
  return &off_4A278;
}

id sub_1105C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11068(id a1)
{
  return &off_4A170;
}

id sub_11074(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11080(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1108C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11098(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_110A4(id a1)
{
  return &off_4A7A0;
}

id sub_110B0(id a1)
{
  return &off_4A410;
}

id sub_110BC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_110C8(id a1)
{
  uint64_t v1 = +[GEOCountryConfiguration sharedConfiguration];
  uint64_t v2 = [v1 countryCode];
  id v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 isEqualToString:@"CN"] ^ 1);

  return v3;
}

id sub_11150(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1115C(id a1)
{
  return 0;
}

id sub_11164(id a1)
{
  return 0;
}

id sub_1116C(id a1)
{
  return &off_4A3E0;
}

id sub_11178(id a1)
{
  return &off_4A488;
}

id sub_11184(id a1)
{
  return &off_4A200;
}

id sub_11190(id a1)
{
  return &off_4A380;
}

id sub_1119C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_111A8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_111B4(id a1)
{
  return 0;
}

id sub_111BC(id a1)
{
  return &off_4A7B8;
}

id sub_111C8(id a1)
{
  return &off_4A170;
}

id sub_111D4(id a1)
{
  return &off_4A7D0;
}

id sub_111E0(id a1)
{
  return &off_4A7E8;
}

id sub_111EC(id a1)
{
  return &off_4A800;
}

id sub_111F8(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11204(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11210(id a1)
{
  return &off_4A818;
}

id sub_1121C(id a1)
{
  return &off_4A278;
}

id sub_11228(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11234(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11240(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_1124C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11258(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_11264(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_11270(id a1)
{
  return &__kCFBooleanFalse;
}

void sub_113D8(uint64_t a1, void *a2)
{
  id v16 = a2;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Received response for end navigation command: %@", v3, v4, v5, v6, v7, v8, (uint64_t)v16);
  if ([v16 success])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = objc_alloc_init((Class)SALocalSearchNavigationEndCompleted);
    id v11 = [v10 dictionary];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
  }
  else
  {
    BOOL v12 = (char *)[v16 navigationActionError];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = objc_alloc((Class)SACommandFailed);
    if (v12 == (unsigned char *)&dword_0 + 1) {
      id v15 = [v14 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
    }
    else {
      id v15 = [v14 initWithReason:@"Unknown error"];
    }
    id v10 = v15;
    id v11 = [v15 dictionary];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v11);
  }
}

MKServerFormattedString *__cdecl sub_11B88(id a1, GEOComposedString *a2, unint64_t a3)
{
  uint64_t v3 = a2;
  id v4 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v3];

  return (MKServerFormattedString *)v4;
}

id sub_11BE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v3 parameters:*(void *)(a1 + 32)];

  return v4;
}

MKServerFormattedString *__cdecl sub_11C48(id a1, GEOComposedString *a2, unint64_t a3)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v3];

  return (MKServerFormattedString *)v4;
}

id sub_11CA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v3 parameters:*(void *)(a1 + 32)];

  return v4;
}

id IPCMessageGetServerFormattedInstructionArrayForKey(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = [a1 objectForKeyedSubscript:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = objc_opt_class();
      id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
      uint64_t v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id MapsPerformSelector(void *a1, const char *a2)
{
  return [a1 performSelector:a2];
}

id MapsPerformSelectorWithObject(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 performSelector:a2 withObject:a3];
}

id MapsPerformSelectorWithObjectWithObject(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 performSelector:a2 withObject:a3 withObject:a4];
}

id MapsPerformNonownedReturnSelector(void *a1, const char *a2)
{
  return [a1 performSelector:a2];
}

void sub_13670(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_136A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Maps broker connection invalidated.", a3, a4, a5, a6, a7, a8, v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    BOOL v12 = WeakRetained;

    id WeakRetained = v12;
  }
}

void sub_13708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Maps broker connection interrupted.", a3, a4, a5, a6, a7, a8, v12);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v13 = WeakRetained;
    id v10 = [WeakRetained[2] remoteObjectProxy];
    uint64_t v11 = [v13[3] endpoint];
    [v10 listenerEndpointDidChange:v11 forIdentifier:v13[4]];

    id WeakRetained = v13;
  }
}

void sub_139E4(id a1)
{
  v4[0] = FBSOpenApplicationOptionKeyActivateSuspended;
  v4[1] = FBSOpenApplicationOptionKeyPayloadURL;
  v5[0] = &__kCFBooleanTrue;
  uint64_t v1 = +[NSURL URLWithString:@"x-maps-reopen://?backgroundnavigation"];
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  uint64_t v3 = (void *)qword_55D50;
  qword_55D50 = v2;
}

void sub_13AAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface performWithMapsRunning openApplication completed, error: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_13CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_13D18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_13D28(uint64_t a1)
{
}

void sub_13D30(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[4];
  id v10 = *(void **)(v9 + 48);
  if (v10)
  {
    uint64_t v11 = a1[5];
  }
  else
  {
    uint64_t v12 = *(void *)(v9 + 56);
    if (!v12)
    {
      dispatch_group_t v13 = dispatch_group_create();
      uint64_t v14 = a1[4];
      uint64_t v15 = *(void **)(v14 + 56);
      *(void *)(v14 + 56) = v13;

      BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Created connectionGroup to wait for Maps: %@", v16, v17, v18, v19, v20, v21, *(void *)(a1[4] + 56));
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 56));
      dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 56));
      dispatch_time_t v22 = dispatch_time(0, 20000000000);
      uint64_t v23 = a1[4];
      uint64_t v24 = *(NSObject **)(v23 + 40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_13E64;
      block[3] = &unk_30970;
      void block[4] = v23;
      dispatch_after(v22, v24, block);
      return;
    }
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Using existing dispatchGroup: %@", a3, a4, a5, a6, a7, a8, v12);
    id v10 = *(void **)(a1[4] + 56);
    uint64_t v11 = a1[6];
  }
  objc_storeStrong((id *)(*(void *)(v11 + 8) + 40), v10);
}

void sub_13E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v10)
  {
    dispatch_group_leave(v10);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 56);
    *(void *)(v11 + 56) = 0;

    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Timed out waiting for a connection to be established", v13, v14, v15, v16, v17, v18, a9);
  }
}

void sub_13ECC(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "Used established 'connection' but it was nil!", v3, 2u);
    }
  }
}

void sub_1415C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1417C(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[5];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_14208;
    block[3] = &unk_30970;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

void sub_14208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Invalidating connection: %@", a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a1 + 32) + 48));
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 48);
  *(void *)(v9 + 48) = 0;
}

void sub_14268(id a1)
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Connection interrupted.", v1, v2, v3, v4, v5, v6, v7);
}

void sub_14278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MapsIPCInterface Received new connection: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = (id *)(*(void *)(a1 + 40) + 48);

  objc_storeStrong(v10, v9);
}

void sub_142D0(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
}

NSString *__cdecl sub_16648(id a1, MKServerFormattedString *a2, unint64_t a3)
{
  return (NSString *)[(MKServerFormattedString *)a2 debugDescription];
}

NSString *__cdecl sub_16650(id a1, MKServerFormattedString *a2, unint64_t a3)
{
  return (NSString *)[(MKServerFormattedString *)a2 debugDescription];
}

void sub_17630(uint64_t a1, void *a2)
{
  if ([a2 success])
  {
    id v3 = objc_alloc_init((Class)SACommandSucceeded);
  }
  else
  {
    id v4 = objc_alloc((Class)SACommandFailed);
    id v3 = [v4 initWithErrorCode:SALocalSearchRerouteSuggestionNotAvailableErrorCode];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v6 = [v3 dictionary];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

unsigned char *sub_1847C(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[8])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_18508;
    v3[3] = &unk_41858;
    v3[4] = result;
    result = [result _notifyObserversWithBlock:v3];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  }
  return result;
}

id sub_18508(uint64_t a1, void *a2)
{
  return [a2 maneuverGuidanceInfoDidChange:*(void *)(a1 + 32)];
}

void sub_19514(uint64_t a1, void *a2)
{
  id v24 = a2;
  if (v24 && [v24 isNavigating])
  {
    id v3 = objc_alloc_init((Class)SALocalSearchGetNavigationStatusCompleted);
    id v4 = [*(id *)(a1 + 32) _overallETAForGuidanceState:v24];
    [v3 setOverallEta:v4];

    uint64_t v5 = [*(id *)(a1 + 32) _maneuverETAForGuidanceState:v24];
    [v3 setNextManeuverEta:v5];

    uint64_t v6 = [*(id *)(a1 + 32) _routeForGuidanceState:v24];
    [v3 setRoute:v6];

    id v7 = [*(id *)(a1 + 32) _trafficIncidentAlertTypeForGuidanceState:v24];
    [v3 setTrafficIncidentAlertType:v7];

    uint64_t v8 = [*(id *)(a1 + 32) _navigationVolumeForGuidanceState:v24];
    [v3 setVolume:v8];

    uint64_t v9 = [v3 dictionary];
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Returning successfully with %{private}@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v16 = [v24 shortDescription];
    [v24 isNavigating];
    BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Failed due to lack of guidance state: %{private}@ or isNavigating: %d", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

    uint64_t v23 = *(void *)(a1 + 48);
    id v3 = [*(id *)(a1 + 40) dictionary];
    (*(void (**)(uint64_t, id))(v23 + 16))(v23, v3);
  }
}

uint64_t GEOFindOrCreateLog()
{
  return _GEOFindOrCreateLog();
}

uint64_t MapsFeature_IsEnabled_DrivingMultiWaypointRoutes()
{
  return _MapsFeature_IsEnabled_DrivingMultiWaypointRoutes();
}

uint64_t MapsFeature_IsEnabled_Maps182()
{
  return _MapsFeature_IsEnabled_Maps182();
}

uint64_t MapsFeature_IsEnabled_Maps420()
{
  return _MapsFeature_IsEnabled_Maps420();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _geo_NSErrorDictionaryRepresentationCopy()
{
  return __geo_NSErrorDictionaryRepresentationCopy();
}

uint64_t _geo_NSErrorFromDictionaryRepresentationCopy()
{
  return __geo_NSErrorFromDictionaryRepresentationCopy();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

void objc_addLoadImageFunc(objc_func_loadImage func)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__actionForVolume(void *a1, const char *a2, ...)
{
  return [a1 _actionForVolume];
}

id objc_msgSend__createFakeLanes(void *a1, const char *a2, ...)
{
  return [a1 _createFakeLanes];
}

id objc_msgSend__dataValue(void *a1, const char *a2, ...)
{
  return [a1 _dataValue];
}

id objc_msgSend__detourInfo(void *a1, const char *a2, ...)
{
  return [a1 _detourInfo];
}

id objc_msgSend__isDoNotDisturbWhileDrivingHoldingCoverSheet(void *a1, const char *a2, ...)
{
  return [a1 _isDoNotDisturbWhileDrivingHoldingCoverSheet];
}

id objc_msgSend__navVolumeSettingValue(void *a1, const char *a2, ...)
{
  return [a1 _navVolumeSettingValue];
}

id objc_msgSend__openTableBundleId(void *a1, const char *a2, ...)
{
  return [a1 _openTableBundleId];
}

id objc_msgSend__populateExternalDevice(void *a1, const char *a2, ...)
{
  return [a1 _populateExternalDevice];
}

id objc_msgSend__setNeedsChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _setNeedsChangeNotification];
}

id objc_msgSend__shouldLaunchIntoNav(void *a1, const char *a2, ...)
{
  return [a1 _shouldLaunchIntoNav];
}

id objc_msgSend__unitLength(void *a1, const char *a2, ...)
{
  return [a1 _unitLength];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return [a1 acquire];
}

id objc_msgSend_affectsDimming(void *a1, const char *a2, ...)
{
  return [a1 affectsDimming];
}

id objc_msgSend_alightMessage(void *a1, const char *a2, ...)
{
  return [a1 alightMessage];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrivalDate(void *a1, const char *a2, ...)
{
  return [a1 arrivalDate];
}

id objc_msgSend_arrivalInfo(void *a1, const char *a2, ...)
{
  return [a1 arrivalInfo];
}

id objc_msgSend_arrivalState(void *a1, const char *a2, ...)
{
  return [a1 arrivalState];
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return [a1 artwork];
}

id objc_msgSend_artworkDataSource(void *a1, const char *a2, ...)
{
  return [a1 artworkDataSource];
}

id objc_msgSend_artworkOverride(void *a1, const char *a2, ...)
{
  return [a1 artworkOverride];
}

id objc_msgSend_assistantLanguageIsRTL(void *a1, const char *a2, ...)
{
  return [a1 assistantLanguageIsRTL];
}

id objc_msgSend_assistantUILocale(void *a1, const char *a2, ...)
{
  return [a1 assistantUILocale];
}

id objc_msgSend_attributions(void *a1, const char *a2, ...)
{
  return [a1 attributions];
}

id objc_msgSend_avoidHighways(void *a1, const char *a2, ...)
{
  return [a1 avoidHighways];
}

id objc_msgSend_avoidTolls(void *a1, const char *a2, ...)
{
  return [a1 avoidTolls];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_canReceiveMessages(void *a1, const char *a2, ...)
{
  return [a1 canReceiveMessages];
}

id objc_msgSend_carPlayExternalDevice(void *a1, const char *a2, ...)
{
  return [a1 carPlayExternalDevice];
}

id objc_msgSend_carRouteOptions(void *a1, const char *a2, ...)
{
  return [a1 carRouteOptions];
}

id objc_msgSend_centimeters(void *a1, const char *a2, ...)
{
  return [a1 centimeters];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentCarPlayExternalDevice(void *a1, const char *a2, ...)
{
  return [a1 currentCarPlayExternalDevice];
}

id objc_msgSend_currentCountrySupportsNavigation(void *a1, const char *a2, ...)
{
  return [a1 currentCountrySupportsNavigation];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLegIndex(void *a1, const char *a2, ...)
{
  return [a1 currentLegIndex];
}

id objc_msgSend_currentSpokenEventID(void *a1, const char *a2, ...)
{
  return [a1 currentSpokenEventID];
}

id objc_msgSend_darkVariant(void *a1, const char *a2, ...)
{
  return [a1 darkVariant];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_departureDate(void *a1, const char *a2, ...)
{
  return [a1 departureDate];
}

id objc_msgSend_detail(void *a1, const char *a2, ...)
{
  return [a1 detail];
}

id objc_msgSend_detailType(void *a1, const char *a2, ...)
{
  return [a1 detailType];
}

id objc_msgSend_detourTime(void *a1, const char *a2, ...)
{
  return [a1 detourTime];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_directionsType(void *a1, const char *a2, ...)
{
  return [a1 directionsType];
}

id objc_msgSend_dismissAssistant(void *a1, const char *a2, ...)
{
  return [a1 dismissAssistant];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return [a1 distance];
}

id objc_msgSend_distanceDetailLevel(void *a1, const char *a2, ...)
{
  return [a1 distanceDetailLevel];
}

id objc_msgSend_distanceInMeters(void *a1, const char *a2, ...)
{
  return [a1 distanceInMeters];
}

id objc_msgSend_distanceInMiles(void *a1, const char *a2, ...)
{
  return [a1 distanceInMiles];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainObjects(void *a1, const char *a2, ...)
{
  return [a1 domainObjects];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drivingSide(void *a1, const char *a2, ...)
{
  return [a1 drivingSide];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_etaFilterData(void *a1, const char *a2, ...)
{
  return [a1 etaFilterData];
}

id objc_msgSend_evChargingMetadata(void *a1, const char *a2, ...)
{
  return [a1 evChargingMetadata];
}

id objc_msgSend_extSessionGuid(void *a1, const char *a2, ...)
{
  return [a1 extSessionGuid];
}

id objc_msgSend_extSessionGuidCreatedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 extSessionGuidCreatedTimestamp];
}

id objc_msgSend_feet(void *a1, const char *a2, ...)
{
  return [a1 feet];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getRoute(void *a1, const char *a2, ...)
{
  return [a1 getRoute];
}

id objc_msgSend_guidanceState(void *a1, const char *a2, ...)
{
  return [a1 guidanceState];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_highlightedLaneRange(void *a1, const char *a2, ...)
{
  return [a1 highlightedLaneRange];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incident(void *a1, const char *a2, ...)
{
  return [a1 incident];
}

id objc_msgSend_incidentsOnRouteData(void *a1, const char *a2, ...)
{
  return [a1 incidentsOnRouteData];
}

id objc_msgSend_incidentsOnRouteOffsets(void *a1, const char *a2, ...)
{
  return [a1 incidentsOnRouteOffsets];
}

id objc_msgSend_includeRoute(void *a1, const char *a2, ...)
{
  return [a1 includeRoute];
}

id objc_msgSend_initializeBrokerConnectionIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 initializeBrokerConnectionIfNeeded];
}

id objc_msgSend_instructions(void *a1, const char *a2, ...)
{
  return [a1 instructions];
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

id objc_msgSend_isAlerting(void *a1, const char *a2, ...)
{
  return [a1 isAlerting];
}

id objc_msgSend_isArrived(void *a1, const char *a2, ...)
{
  return [a1 isArrived];
}

id objc_msgSend_isArriving(void *a1, const char *a2, ...)
{
  return [a1 isArriving];
}

id objc_msgSend_isAutomaticDNDAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticDNDAvailable];
}

id objc_msgSend_isCurrentLocation(void *a1, const char *a2, ...)
{
  return [a1 isCurrentLocation];
}

id objc_msgSend_isDeviceLockedWithPasscode(void *a1, const char *a2, ...)
{
  return [a1 isDeviceLockedWithPasscode];
}

id objc_msgSend_isForManeuver(void *a1, const char *a2, ...)
{
  return [a1 isForManeuver];
}

id objc_msgSend_isImperialUnit(void *a1, const char *a2, ...)
{
  return [a1 isImperialUnit];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isLaneForManeuver(void *a1, const char *a2, ...)
{
  return [a1 isLaneForManeuver];
}

id objc_msgSend_isMapsBackgroundTaskSuspended(void *a1, const char *a2, ...)
{
  return [a1 isMapsBackgroundTaskSuspended];
}

id objc_msgSend_isMapsForegroundOnMainScreen(void *a1, const char *a2, ...)
{
  return [a1 isMapsForegroundOnMainScreen];
}

id objc_msgSend_isMetricUnit(void *a1, const char *a2, ...)
{
  return [a1 isMetricUnit];
}

id objc_msgSend_isNavigating(void *a1, const char *a2, ...)
{
  return [a1 isNavigating];
}

id objc_msgSend_isParked(void *a1, const char *a2, ...)
{
  return [a1 isParked];
}

id objc_msgSend_isParking(void *a1, const char *a2, ...)
{
  return [a1 isParking];
}

id objc_msgSend_isPreferredLaneForManeuver(void *a1, const char *a2, ...)
{
  return [a1 isPreferredLaneForManeuver];
}

id objc_msgSend_isRerouting(void *a1, const char *a2, ...)
{
  return [a1 isRerouting];
}

id objc_msgSend_isSticky(void *a1, const char *a2, ...)
{
  return [a1 isSticky];
}

id objc_msgSend_isWithinMaxDistanceToShow(void *a1, const char *a2, ...)
{
  return [a1 isWithinMaxDistanceToShow];
}

id objc_msgSend_itemDestination(void *a1, const char *a2, ...)
{
  return [a1 itemDestination];
}

id objc_msgSend_itemIndex(void *a1, const char *a2, ...)
{
  return [a1 itemIndex];
}

id objc_msgSend_itemSource(void *a1, const char *a2, ...)
{
  return [a1 itemSource];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_junction(void *a1, const char *a2, ...)
{
  return [a1 junction];
}

id objc_msgSend_kilometers(void *a1, const char *a2, ...)
{
  return [a1 kilometers];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_laneGuidanceInfo(void *a1, const char *a2, ...)
{
  return [a1 laneGuidanceInfo];
}

id objc_msgSend_laneInfoId(void *a1, const char *a2, ...)
{
  return [a1 laneInfoId];
}

id objc_msgSend_lanes(void *a1, const char *a2, ...)
{
  return [a1 lanes];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastSceneDeactivationTime(void *a1, const char *a2, ...)
{
  return [a1 lastSceneDeactivationTime];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_legacyRouteData(void *a1, const char *a2, ...)
{
  return [a1 legacyRouteData];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadDirectionsMessage(void *a1, const char *a2, ...)
{
  return [a1 loadDirectionsMessage];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationActivityMetaData(void *a1, const char *a2, ...)
{
  return [a1 locationActivityMetaData];
}

id objc_msgSend_locationName(void *a1, const char *a2, ...)
{
  return [a1 locationName];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_majorTextAlternatives(void *a1, const char *a2, ...)
{
  return [a1 majorTextAlternatives];
}

id objc_msgSend_makeReservationPunchOut(void *a1, const char *a2, ...)
{
  return [a1 makeReservationPunchOut];
}

id objc_msgSend_makeReservationPunchOuts(void *a1, const char *a2, ...)
{
  return [a1 makeReservationPunchOuts];
}

id objc_msgSend_maneuver(void *a1, const char *a2, ...)
{
  return [a1 maneuver];
}

id objc_msgSend_maneuverArtwork(void *a1, const char *a2, ...)
{
  return [a1 maneuverArtwork];
}

id objc_msgSend_maneuverID(void *a1, const char *a2, ...)
{
  return [a1 maneuverID];
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return [a1 mapItem];
}

id objc_msgSend_meters(void *a1, const char *a2, ...)
{
  return [a1 meters];
}

id objc_msgSend_midStepTitles(void *a1, const char *a2, ...)
{
  return [a1 midStepTitles];
}

id objc_msgSend_miles(void *a1, const char *a2, ...)
{
  return [a1 miles];
}

id objc_msgSend_minorTextAlternatives(void *a1, const char *a2, ...)
{
  return [a1 minorTextAlternatives];
}

id objc_msgSend_mkServerFormattedString(void *a1, const char *a2, ...)
{
  return [a1 mkServerFormattedString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_muteNavigation(void *a1, const char *a2, ...)
{
  return [a1 muteNavigation];
}

id objc_msgSend_navSessionData(void *a1, const char *a2, ...)
{
  return [a1 navSessionData];
}

id objc_msgSend_navVolumeSetting(void *a1, const char *a2, ...)
{
  return [a1 navVolumeSetting];
}

id objc_msgSend_navigationActionError(void *a1, const char *a2, ...)
{
  return [a1 navigationActionError];
}

id objc_msgSend_navigationState(void *a1, const char *a2, ...)
{
  return [a1 navigationState];
}

id objc_msgSend_numberOfLegs(void *a1, const char *a2, ...)
{
  return [a1 numberOfLegs];
}

id objc_msgSend_openTableAppPunchOut(void *a1, const char *a2, ...)
{
  return [a1 openTableAppPunchOut];
}

id objc_msgSend_openings(void *a1, const char *a2, ...)
{
  return [a1 openings];
}

id objc_msgSend_originIsWatch(void *a1, const char *a2, ...)
{
  return [a1 originIsWatch];
}

id objc_msgSend_originalWaypointRouteData(void *a1, const char *a2, ...)
{
  return [a1 originalWaypointRouteData];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_place(void *a1, const char *a2, ...)
{
  return [a1 place];
}

id objc_msgSend_placeData2(void *a1, const char *a2, ...)
{
  return [a1 placeData2];
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return [a1 postalCode];
}

id objc_msgSend_primaryInstructions(void *a1, const char *a2, ...)
{
  return [a1 primaryInstructions];
}

id objc_msgSend_primaryStrings(void *a1, const char *a2, ...)
{
  return [a1 primaryStrings];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_regionOfInterestRadiusInMiles(void *a1, const char *a2, ...)
{
  return [a1 regionOfInterestRadiusInMiles];
}

id objc_msgSend_regionType(void *a1, const char *a2, ...)
{
  return [a1 regionType];
}

id objc_msgSend_remainingDistanceOnRoute(void *a1, const char *a2, ...)
{
  return [a1 remainingDistanceOnRoute];
}

id objc_msgSend_remainingMinutesOnRoute(void *a1, const char *a2, ...)
{
  return [a1 remainingMinutesOnRoute];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requestedVolume(void *a1, const char *a2, ...)
{
  return [a1 requestedVolume];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_restaurantInfo(void *a1, const char *a2, ...)
{
  return [a1 restaurantInfo];
}

id objc_msgSend_resultDetourInfoData(void *a1, const char *a2, ...)
{
  return [a1 resultDetourInfoData];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_routeContextData(void *a1, const char *a2, ...)
{
  return [a1 routeContextData];
}

id objc_msgSend_routeID(void *a1, const char *a2, ...)
{
  return [a1 routeID];
}

id objc_msgSend_routeIndex(void *a1, const char *a2, ...)
{
  return [a1 routeIndex];
}

id objc_msgSend_routePersistentData(void *a1, const char *a2, ...)
{
  return [a1 routePersistentData];
}

id objc_msgSend_safetyWarningType(void *a1, const char *a2, ...)
{
  return [a1 safetyWarningType];
}

id objc_msgSend_searchAlongRoute(void *a1, const char *a2, ...)
{
  return [a1 searchAlongRoute];
}

id objc_msgSend_searchItems(void *a1, const char *a2, ...)
{
  return [a1 searchItems];
}

id objc_msgSend_secondaryInstructions(void *a1, const char *a2, ...)
{
  return [a1 secondaryInstructions];
}

id objc_msgSend_secondaryStrings(void *a1, const char *a2, ...)
{
  return [a1 secondaryStrings];
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedIndex];
}

id objc_msgSend_selectedItemIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedItemIndex];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInterface(void *a1, const char *a2, ...)
{
  return [a1 sharedInterface];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shieldID(void *a1, const char *a2, ...)
{
  return [a1 shieldID];
}

id objc_msgSend_shieldInfo(void *a1, const char *a2, ...)
{
  return [a1 shieldInfo];
}

id objc_msgSend_shieldStringID(void *a1, const char *a2, ...)
{
  return [a1 shieldStringID];
}

id objc_msgSend_shieldText(void *a1, const char *a2, ...)
{
  return [a1 shieldText];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return [a1 shortDescription];
}

id objc_msgSend_shouldReroute(void *a1, const char *a2, ...)
{
  return [a1 shouldReroute];
}

id objc_msgSend_showDirections(void *a1, const char *a2, ...)
{
  return [a1 showDirections];
}

id objc_msgSend_showInCarPlay(void *a1, const char *a2, ...)
{
  return [a1 showInCarPlay];
}

id objc_msgSend_showInMainScreen(void *a1, const char *a2, ...)
{
  return [a1 showInMainScreen];
}

id objc_msgSend_showTraffic(void *a1, const char *a2, ...)
{
  return [a1 showTraffic];
}

id objc_msgSend_signID(void *a1, const char *a2, ...)
{
  return [a1 signID];
}

id objc_msgSend_stateCode(void *a1, const char *a2, ...)
{
  return [a1 stateCode];
}

id objc_msgSend_stateOrProvince(void *a1, const char *a2, ...)
{
  return [a1 stateOrProvince];
}

id objc_msgSend_stepIndex(void *a1, const char *a2, ...)
{
  return [a1 stepIndex];
}

id objc_msgSend_stopIndex(void *a1, const char *a2, ...)
{
  return [a1 stopIndex];
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return [a1 street];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_suppressNavigation(void *a1, const char *a2, ...)
{
  return [a1 suppressNavigation];
}

id objc_msgSend_textAlternatives(void *a1, const char *a2, ...)
{
  return [a1 textAlternatives];
}

id objc_msgSend_thoroughfare(void *a1, const char *a2, ...)
{
  return [a1 thoroughfare];
}

id objc_msgSend_timeComponentsForOpenings(void *a1, const char *a2, ...)
{
  return [a1 timeComponentsForOpenings];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeSlot(void *a1, const char *a2, ...)
{
  return [a1 timeSlot];
}

id objc_msgSend_timeToNextManeuver(void *a1, const char *a2, ...)
{
  return [a1 timeToNextManeuver];
}

id objc_msgSend_timeZoneId(void *a1, const char *a2, ...)
{
  return [a1 timeZoneId];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titles(void *a1, const char *a2, ...)
{
  return [a1 titles];
}

id objc_msgSend_trafficIncidentAlert(void *a1, const char *a2, ...)
{
  return [a1 trafficIncidentAlert];
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return [a1 transportType];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return [a1 unit];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_variableOverrides(void *a1, const char *a2, ...)
{
  return [a1 variableOverrides];
}

id objc_msgSend_voiceMuted(void *a1, const char *a2, ...)
{
  return [a1 voiceMuted];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}