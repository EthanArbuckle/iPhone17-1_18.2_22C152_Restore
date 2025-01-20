id SOSServerInterface()
{
  void *v0;
  void *v1;
  uint64_t vars8;

  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SOSInternalServerProtocol];
  v1 = +[NSSet setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:"mostRecentLocationSentWithCompletion:" argumentIndex:0 ofReply:1];

  return v0;
}

id SOSClientInterface()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SOSInternalClientProtocol];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:"didUpdateSOSStatus:" argumentIndex:0 ofReply:0];

  return v0;
}

NSXPCInterface *SOSStatusManagerServerInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SOSStatusManagerServerProtocol];
}

NSXPCInterface *SOSStatusManagerClientInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SOSStatusManagerClientProtocol];
}

void sub_3258(id a1, BOOL a2)
{
  if (a2)
  {
    id v4 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v2 = +[NSURL URLWithString:SOSSettingsURLBaseString];
    [v4 openSensitiveURL:v2 withOptions:0];
  }
  else
  {
    v3 = sub_9DE0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "KappaThirdParty,SOSKappaThirdPartySettingsController,disableKappaThirdPartyAppForSpecifier,failed", buf, 2u);
    }
  }
}

id sub_36B8(uint64_t a1, void *a2)
{
  return _[a2 updateAssets];
}

void sub_37AC(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), a2);
  [*(id *)(a1 + 32) setUpConstraints];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(*(void *)(a1 + 32) + 120));
  }
}

id sub_3910(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) setAlpha:0.0];
}

id sub_3928(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) removeFromSuperview];
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_39B8;
  v4[3] = &unk_18900;
  v4[4] = v2;
  return [v2 loadTriggerImageViewWithCompletion:v4];
}

id sub_39B8(uint64_t a1, void *a2)
{
  [a2 setAlpha:0.0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3A4C;
  v4[3] = &unk_188D8;
  v4[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v4 animations:0.25];
}

id sub_3A4C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) setAlpha:1.0];
}

id sub_481C(uint64_t a1, void *a2)
{
  return [a2 updateLastLocationSent];
}

id sub_48B4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) updateLastLocationSentWithLocation:a2];
}

void sub_497C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if (!*(void *)(v2 + 128)) {
    double v3 = 1.0;
  }
  [*(id *)(v2 + 136) setAlpha:v3];
  [*(id *)(*(void *)(a1 + 32) + 128) coordinate];
  double v5 = v4;
  double v7 = v6;
  id v10 = objc_alloc_init((Class)MKPointAnnotation);
  [*(id *)(*(void *)(a1 + 32) + 128) coordinate];
  objc_msgSend(v10, "setCoordinate:");
  v8 = *(void **)(*(void *)(a1 + 32) + 120);
  v9 = [v8 annotations];
  [v8 removeAnnotations:v9];

  [*(id *)(*(void *)(a1 + 32) + 120) addAnnotation:v10];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "setRegion:animated:", *(void *)(*(void *)(a1 + 32) + 128) != 0, v5, v7, 0.005, 0.005);
}

void sub_4FA0(uint64_t a1, uint64_t a2)
{
  double v3 = sub_9DE0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "SOSSettingsController, handleKappaStateChanged", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9DD8;
  block[3] = &unk_18B00;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_5768(id a1)
{
  uint64_t v1 = sub_9DE0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,showFeedbackAssistant,presented feedback assistant questionnaire", v2, 2u);
  }
}

void sub_5994(id a1)
{
  uint64_t v1 = sub_9DE0();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,showFeedbackAssistant,presented feedback assistant questionnaire", v2, 2u);
  }
}

id sub_5DAC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadStopSharingGroupAnimated:1];
}

id sub_5E2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadEmergencyContactsAnimated:1];
}

void sub_5EAC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 coreTelephonyClient];
  objc_msgSend(v1, "updateAutoCallSpecifierEnabled:", +[SOSUtilities shouldForceDisableAutoCallForClient:](SOSUtilities, "shouldForceDisableAutoCallForClient:", v2) ^ 1);
}

void sub_6C34(uint64_t a1)
{
  double v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v8[0] = v2[32];
  v8[1] = v2[34];
  v8[2] = v2[33];
  double v4 = +[NSArray arrayWithObjects:v8 count:3];
  [v3 removeObjectsInArray:v4];

  double v5 = *(void **)(a1 + 40);
  v7[0] = v5[32];
  v7[1] = v5[34];
  v7[2] = v5[33];
  double v6 = +[NSArray arrayWithObjects:v7 count:3];
  [v5 removeContiguousSpecifiers:v6 animated:0];
}

void sub_6D48(uint64_t a1)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v8[0] = *(void *)(v2 + 224);
  v8[1] = *(void *)(v2 + 232);
  double v4 = +[NSArray arrayWithObjects:v8 count:2];
  [v3 removeObjectsInArray:v4];

  double v5 = *(void **)(a1 + 40);
  v7[0] = v5[28];
  v7[1] = v5[29];
  double v6 = +[NSArray arrayWithObjects:v7 count:2];
  [v5 removeContiguousSpecifiers:v6 animated:0];
}

id sub_6E3C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadStopSharingGroupAnimated:0];
}

void sub_74D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7574;
  block[3] = &unk_18A00;
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  char v7 = *(unsigned char *)(a1 + 40);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_7574(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 200) isEqualToArray:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), *(id *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 208) removeAllObjects];
    id v3 = *(void **)(a1 + 32);
    id v4 = (void *)v3[42];
    if (!v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) specifierForID:@"EMERGENCY_CONTACTS"];
      uint64_t v6 = *(void *)(a1 + 32);
      char v7 = *(void **)(v6 + 336);
      *(void *)(v6 + 336) = v5;

      id v3 = *(void **)(a1 + 32);
      id v4 = (void *)v3[42];
    }
    uint64_t v44 = 0;
    v8 = [v4 identifier];
    [v3 getGroup:&v44 row:0 ofSpecifierID:v8];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v9 = [*(id *)(a1 + 32) specifiersInGroup:v44];
    id v10 = [v9 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v15 = [v14 identifier];
          uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 336) identifier];
          if (v15 == (void *)v16)
          {
          }
          else
          {
            v17 = (void *)v16;
            v18 = [v14 identifier];
            v19 = [*(id *)(*(void *)(a1 + 32) + 344) identifier];

            if (v18 != v19) {
              [*(id *)(a1 + 32) removeSpecifier:v14 animated:*(unsigned __int8 *)(a1 + 48)];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v11);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = *(id *)(a1 + 40);
    id v21 = [v20 countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          v26 = [v25 name];
          uint64_t v27 = [v25 phoneNumber];
          v28 = (void *)v27;
          if (v26) {
            BOOL v29 = v27 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29)
          {
            [*(id *)(*(void *)(a1 + 32) + 208) addObject:v27];
            v30 = *(id **)(a1 + 32);
            v31 = [v30[43] identifier];
            id v32 = [v30 indexOfSpecifierID:v31];

            if (v32 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v33 = sub_9DE0();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 344);
                *(_DWORD *)buf = 138412290;
                uint64_t v46 = v34;
                _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Can't find index of openHealthButton specifier: %@", buf, 0xCu);
              }
            }
            else
            {
              v33 = +[PSSpecifier preferenceSpecifierNamed:v26 target:*(void *)(a1 + 32) set:0 get:"contactNumberForContactSpecifier:" detail:0 cell:4 edit:0];
              [v33 setProperty:v28 forKey:@"kPhoneNumberKey"];
              [*(id *)(a1 + 32) insertSpecifier:v33 atIndex:v32 animated:*(unsigned __int8 *)(a1 + 48)];
            }
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v36 objects:v47 count:16];
      }
      while (v22);
    }

    v35 = +[SOSUtilities emergencyContactsSectionDescription];
    [*(id *)(*(void *)(a1 + 32) + 336) setName:v35];

    [*(id *)(a1 + 32) reloadHealthButtonLabelWithContacts:*(unsigned __int8 *)(a1 + 48)];
    return [*(id *)(a1 + 32) reloadPrivacyFooterWithContacts:*(unsigned __int8 *)(a1 + 48)];
  }
  return result;
}

id sub_8548(uint64_t a1, char a2)
{
  id v3 = *(id **)(a1 + 32);
  if (a2)
  {
    [v3 submitSOSNotificationSettingsChangedMetric:@"sideButtonPress" withValue:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = v3[31];
    uint64_t v5 = +[NSNumber numberWithBool:0];
    [v4 setProperty:v5 forKey:PSValueKey];

    [*(id *)(a1 + 32) reloadSpecifier:v4 animated:1];
  }
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 reloadAlarmSoundAnimated:1];
}

void sub_8FB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_9084;
  void v8[3] = &unk_18A78;
  id v9 = a3;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 40);
  id v6 = v5;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_9084(uint64_t a1)
{
  if (!*(void *)(a1 + 32)
    && [*(id *)(a1 + 40) status]
    && (+[SOSUtilities isStewieVisible] & 1) != 0)
  {
    *(unsigned char *)(*(void *)(a1 + 48) + 368) = 1;
    uint64_t v2 = +[SOSUtilities stewieGroupTitle];
    [*(id *)(*(void *)(a1 + 48) + 376) setName:v2];

    id v15 = +[SOSUtilities stewieFooterLinkTitle];
    id v3 = +[SOSUtilities stewieFooterDescription];
    id v4 = [v3 rangeOfString:v15 options:5];
    NSUInteger v6 = v5;
    [*(id *)(*(void *)(a1 + 48) + 384) setProperty:objc_opt_class() forKey:PSCellClassKey];
    [*(id *)(*(void *)(a1 + 48) + 376) setProperty:v3 forKey:PSFooterHyperlinkViewTitleKey];
    id v7 = *(void **)(*(void *)(a1 + 48) + 376);
    v17.location = (NSUInteger)v4;
    v17.length = v6;
    v8 = NSStringFromRange(v17);
    [v7 setProperty:v8 forKey:PSFooterHyperlinkViewLinkRangeKey];

    id v9 = *(void **)(*(void *)(a1 + 48) + 376);
    id v10 = +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:");
    [v9 setProperty:v10 forKey:PSFooterHyperlinkViewTargetKey];

    uint64_t v11 = *(void **)(*(void *)(a1 + 48) + 376);
    char v12 = NSStringFromSelector("openStewieLearnMore");
    [v11 setProperty:v12 forKey:PSFooterHyperlinkViewActionKey];

    [*(id *)(a1 + 48) reloadSpecifier:*(void *)(*(void *)(a1 + 48) + 376) animated:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 48) reloadSpecifier:*(void *)(*(void *)(a1 + 48) + 384) animated:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 48) refreshStewieAssetSpecifier:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 48) refreshTipSpecifier:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 48) + 368) = 0;
    [*(id *)(a1 + 48) refreshTipSpecifier:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 48) removeSpecifier:*(void *)(*(void *)(a1 + 48) + 376)];
    v13 = *(void **)(a1 + 48);
    uint64_t v14 = v13[48];
    [v13 removeSpecifier:v14];
  }
}

void sub_979C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    unsigned int v4 = [*(id *)(a1 + 32) BOOLValue];
    NSUInteger v5 = *(void **)(*(void *)(a1 + 40) + 400);
    if (v4)
    {
      NSUInteger v6 = +[NSNumber numberWithBool:0];
      [v5 setProperty:v6 forKey:PSValueKey];

      id v7 = sub_9DE0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        v8 = "SOSSettingsController,setCrashDetectionEnabled,failed, animating back to off state";
        id v9 = (uint8_t *)&v13;
LABEL_10:
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      id v10 = +[NSNumber numberWithBool:1];
      [v5 setProperty:v10 forKey:PSValueKey];

      id v7 = sub_9DE0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "SOSSettingsController,setCrashDetectionEnabled,failed, animating back to on state";
        id v9 = buf;
        goto LABEL_10;
      }
    }

    [*(id *)(a1 + 40) reloadSpecifier:*(void *)(*(void *)(a1 + 40) + 400) animated:1];
    return;
  }
  uint64_t v2 = sub_9DE0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "SOSSettingsController,setCrashDetectionEnabled,successful", v11, 2u);
  }
}

id sub_9DD8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadKappaSpecifier];
}

id sub_9DE0()
{
  if (qword_1F348 != -1) {
    dispatch_once(&qword_1F348, &stru_18B20);
  }
  v0 = (void *)qword_1F340;

  return v0;
}

void sub_9E34(id a1)
{
  qword_1F340 = (uint64_t)os_log_create("com.apple.calls.sos", "default");

  _objc_release_x1();
}

uint64_t sub_A010()
{
  _s14SosTipUserInfoCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  qword_1F358 = result;
  return result;
}

uint64_t sub_A040()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_A078(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_F590();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_A138, 0, 0);
}

uint64_t sub_A138()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[9] = Strong;
  if (Strong)
  {
    sub_F620();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[10] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_A238;
    return static TPTipsHelper.shared.getter();
  }
  else
  {
    swift_task_dealloc();
    id v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
}

uint64_t sub_A238(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_A338, 0, 0);
}

uint64_t sub_A338()
{
  sub_F7C0();
  *(void *)(v0 + 96) = sub_F7B0();
  uint64_t v2 = sub_F790();
  return _swift_task_switch(sub_A3CC, v2, v1);
}

uint64_t sub_A3CC()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();
  sub_F5E0();

  return _swift_task_switch(sub_A43C, 0, 0);
}

uint64_t sub_A43C()
{
  uint64_t v1 = (void *)v0[9];
  sub_F580();
  uint64_t v2 = swift_allocObject();
  v0[13] = v2;
  *(void *)(v2 + 16) = v1;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[14] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_A520;
  uint64_t v5 = v0[8];
  return sub_AAC8(v5, (uint64_t)sub_D7CC, v2);
}

uint64_t sub_A520()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 64);
  uint64_t v2 = *(void *)(*(void *)v0 + 56);
  uint64_t v3 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_A694, 0, 0);
}

uint64_t sub_A694()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_A6FC(void *a1)
{
  uint64_t v2 = sub_C9F8(&qword_1F140);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_F7E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_F7C0();
  id v7 = a1;
  uint64_t v8 = sub_F7B0();
  id v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_A91C((uint64_t)v5, (uint64_t)&unk_1F1B0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_A814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_F7C0();
  *(void *)(v4 + 24) = sub_F7B0();
  uint64_t v6 = sub_F790();
  return _swift_task_switch(sub_A8AC, v6, v5);
}

uint64_t sub_A8AC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  [v1 openTrialDialog];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_A91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_F7E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_F7D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_DD28(a1, &qword_1F140);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_F790();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_AAC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  uint64_t v5 = sub_F5B0();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v6 = sub_F5C0();
  v4[14] = v6;
  v4[15] = *(void *)(v6 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v7 = sub_F590();
  v4[17] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[18] = v8;
  v4[19] = *(void *)(v8 + 64);
  v4[20] = swift_task_alloc();
  sub_C9F8(&qword_1F140);
  v4[21] = swift_task_alloc();
  v4[22] = sub_F7C0();
  v4[23] = sub_F7B0();
  uint64_t v10 = sub_F790();
  v4[24] = v10;
  v4[25] = v9;
  return _swift_task_switch(sub_ACB4, v10, v9);
}

uint64_t sub_ACB4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v20 = v0[19];
  uint64_t v21 = v1;
  uint64_t v4 = v0[17];
  uint64_t v19 = v4;
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[8];
  uint64_t v8 = sub_F7E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v1, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[26] = v10;
  v0[27] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v2, v6, v4);
  swift_retain();
  uint64_t v11 = v7;
  sub_D7D4(v7);
  uint64_t v12 = sub_F7B0();
  unint64_t v13 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v14 = (v20 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  *(void *)(v15 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v15 + v13, v2, v19);
  *(void *)(v15 + v14) = v9;
  uint64_t v16 = (uint64_t *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v16 = v11;
  v16[1] = v5;
  swift_release();
  v0[28] = sub_A91C(v21, (uint64_t)&unk_1F150, v15);
  sub_F620();
  NSRange v17 = (void *)swift_task_alloc();
  v0[29] = v17;
  void *v17 = v0;
  v17[1] = sub_AEE4;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_AEE4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 200);
  uint64_t v4 = *(void *)(v2 + 192);
  return _swift_task_switch(sub_B00C, v4, v3);
}

uint64_t sub_B00C()
{
  uint64_t v12 = (void *)v0[30];
  uint64_t v11 = (void (*)(uint64_t *, uint64_t, uint64_t))v0[26];
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[15];
  uint64_t v13 = v0[14];
  uint64_t v5 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[7];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for TPTipsHelper.Entry.Kind.sosSettings(_:), v6);
  v0[5] = v2;
  v0[6] = sub_DAF0();
  uint64_t v8 = sub_DB48(v0 + 2);
  v11(v8, v7, v2);
  swift_retain();
  sub_F5D0();
  sub_F600();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_B22C()
{
  uint64_t v1 = sub_F5B0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_F620();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_B324;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_B324(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_B424, 0, 0);
}

uint64_t sub_B424()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for TPTipsHelper.Entry.Kind.sosSettings(_:), v0[2]);
  v0[7] = sub_F7C0();
  v0[8] = sub_F7B0();
  uint64_t v2 = sub_F790();
  return _swift_task_switch(sub_B4E0, v2, v1);
}

uint64_t sub_B4E0()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v4 = v0[2];
  swift_release();
  sub_F5A0();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_B580, 0, 0);
}

uint64_t sub_B580()
{
  *(void *)(v0 + 72) = sub_F7B0();
  uint64_t v2 = sub_F790();
  return _swift_task_switch(sub_B60C, v2, v1);
}

uint64_t sub_B60C()
{
  swift_release();
  if (qword_1F350 != -1) {
    swift_once();
  }
  _s14SosTipUserInfoCMa();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  qword_1F358 = v1;
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_B754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[21] = a6;
  v7[22] = a7;
  v7[19] = a4;
  v7[20] = a5;
  sub_C9F8(&qword_1F170);
  v7[23] = swift_task_alloc();
  uint64_t v8 = sub_F680();
  v7[24] = v8;
  v7[25] = *(void *)(v8 - 8);
  v7[26] = swift_task_alloc();
  v7[27] = sub_C9F8(&qword_1F178);
  v7[28] = swift_task_alloc();
  v7[29] = sub_C9F8(&qword_1F180);
  v7[30] = swift_task_alloc();
  uint64_t v9 = sub_C9F8(&qword_1F188);
  v7[31] = v9;
  v7[32] = *(void *)(v9 - 8);
  v7[33] = swift_task_alloc();
  uint64_t v10 = sub_C9F8(&qword_1F190);
  v7[34] = v10;
  v7[35] = *(void *)(v10 - 8);
  v7[36] = swift_task_alloc();
  v7[37] = swift_task_alloc();
  v7[38] = sub_F7C0();
  v7[39] = sub_F7B0();
  uint64_t v12 = sub_F790();
  v7[40] = v12;
  v7[41] = v11;
  return _swift_task_switch(sub_B9B8, v12, v11);
}

uint64_t sub_B9B8()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[31];
  v0[42] = sub_F590();
  v0[43] = sub_DAF0();
  sub_F640();
  sub_F810();
  sub_DCE4(&qword_1F198, &qword_1F178);
  sub_F7F0();
  sub_F850();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  sub_F840();
  swift_beginAccess();
  uint64_t v4 = sub_F7B0();
  v0[44] = v4;
  if (v4)
  {
    swift_getObjectType();
    uint64_t v5 = sub_F790();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  v0[45] = v5;
  v0[46] = v7;
  return _swift_task_switch(sub_BB68, v5, v7);
}

uint64_t sub_BB68()
{
  uint64_t v1 = v0[44];
  v0[47] = sub_F820();
  sub_DCE4(&qword_1F1A0, &qword_1F180);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[48] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_BC64;
  uint64_t v3 = v0[23];
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v3, v1, &protocol witness table for MainActor);
}

uint64_t sub_BC64()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 360);
    uint64_t v4 = *(void *)(v2 + 368);
    uint64_t v5 = sub_BF94;
  }
  else
  {
    (*(void (**)(void))(v2 + 376))();
    uint64_t v3 = *(void *)(v2 + 360);
    uint64_t v4 = *(void *)(v2 + 368);
    uint64_t v5 = sub_BD8C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_BD8C()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[23];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_DD28(v3, &qword_1F170);
    swift_release();
    uint64_t v4 = v0[40];
    uint64_t v5 = v0[41];
    return _swift_task_switch(sub_C5D8, v4, v5);
  }
  else
  {
    uint64_t v7 = v0[36];
    uint64_t v6 = v0[37];
    uint64_t v8 = v0[34];
    uint64_t v9 = v0[35];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[26], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = (int *)sub_F830();
    v0[49] = v11;
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v0[50] = v12;
    v0[51] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v12(v7, v8);
    uint64_t v16 = (int *)((char *)v10 + *v10);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[52] = v13;
    void *v13 = v0;
    v13[1] = sub_BFAC;
    uint64_t v14 = v0[26];
    return ((uint64_t (*)(void *, uint64_t))v16)(v0 + 53, v14);
  }
}

uint64_t sub_BF94()
{
  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t sub_BFAC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 208);
  uint64_t v3 = *(void *)(*v0 + 200);
  uint64_t v4 = *(void *)(*v0 + 192);
  swift_task_dealloc();
  swift_release();
  *(unsigned char *)(v1 + 425) = *(unsigned char *)(v1 + 424);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 368);
  uint64_t v6 = *(void *)(v1 + 360);
  return _swift_task_switch(sub_C158, v6, v5);
}

uint64_t sub_C158()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 328);
  return _swift_task_switch(sub_C1BC, v1, v2);
}

uint64_t sub_C1BC()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    (*(void (**)(void, void))(v0 + 400))(*(void *)(v0 + 296), *(void *)(v0 + 272));
    goto LABEL_6;
  }
  uint64_t v2 = (void *)Strong;
  if ((*(unsigned char *)(v0 + 425) & 1) == 0)
  {
    swift_release();
    uint64_t v4 = (void *)sub_C6B0();

    if (v4)
    {
      id v5 = [v2 tipKitEntrySpecifier];
      if (v5)
      {
        uint64_t v6 = v5;
        NSString v7 = sub_F750();
        [v6 removePropertyForKey:v7];
      }
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      uint64_t v9 = *(void *)(v0 + 296);
      uint64_t v10 = *(void *)(v0 + 272);
      [v2 refreshTipSpecifier:0];
    }
    else
    {
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      uint64_t v9 = *(void *)(v0 + 296);
      uint64_t v10 = *(void *)(v0 + 272);
    }

    v8(v9, v10);
    goto LABEL_15;
  }
  uint64_t v3 = (void *)sub_C6B0();

  if (v3)
  {
    (*(void (**)(void, void))(v0 + 400))(*(void *)(v0 + 296), *(void *)(v0 + 272));

LABEL_6:
    swift_release();
LABEL_15:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
  uint64_t v12 = *(void *)(v0 + 336);
  uint64_t v11 = *(void *)(v0 + 344);
  if (*(void *)(v0 + 168))
  {
    uint64_t v13 = *(void *)(v0 + 152);
    *(void *)(v0 + 80) = v12;
    *(void *)(v0 + 88) = v11;
    uint64_t v14 = sub_DB48((uint64_t *)(v0 + 56));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v14, v13, v12);
    objc_allocWithZone((Class)sub_F660());
    swift_retain();
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 152);
    *(void *)(v0 + 40) = v12;
    *(void *)(v0 + 48) = v11;
    v18 = sub_DB48((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v18, v17, v12);
    id v19 = objc_allocWithZone((Class)sub_F660());
  }
  uint64_t v20 = (void *)sub_F670();
  id v21 = [self secondarySystemGroupedBackgroundColor];
  sub_F650();
  id v22 = v20;
  uint64_t v23 = (void *)sub_C6B0();

  if (!v23)
  {
    id v24 = [v2 tipKitEntrySpecifier];
    if (v24)
    {
      v25 = v24;
      NSString v26 = sub_F750();
      [v25 setProperty:v22 forKey:v26];
    }
    [v2 refreshTipSpecifier:0];
  }

  uint64_t v27 = sub_F7B0();
  *(void *)(v0 + 352) = v27;
  if (v27)
  {
    swift_getObjectType();
    uint64_t v28 = sub_F790();
    uint64_t v30 = v29;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v30 = 0;
  }
  *(void *)(v0 + 360) = v28;
  *(void *)(v0 + 368) = v30;
  return _swift_task_switch(sub_BB68, v28, v30);
}

uint64_t sub_C5D8()
{
  (*(void (**)(void, void))(v0[35] + 8))(v0[37], v0[34]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_C6B0()
{
  id v1 = [v0 tipKitEntrySpecifier];
  if (!v1)
  {
    long long v6 = 0u;
    long long v7 = 0u;
LABEL_9:
    sub_DD28((uint64_t)&v6, &qword_1F118);
    return 0;
  }
  uint64_t v2 = v1;
  *(void *)&long long v6 = 0x746E6F4373706954;
  *((void *)&v6 + 1) = 0xEB00000000746E65;
  id v3 = [v1 objectForKeyedSubscript:sub_F870()];
  swift_unknownObjectRelease();

  if (v3)
  {
    sub_F800();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_D65C((uint64_t)v5, (uint64_t)&v6);
  if (!*((void *)&v7 + 1)) {
    goto LABEL_9;
  }
  sub_D6C4(0, &qword_1F130);
  if (swift_dynamicCast()) {
    return *(void *)&v5[0];
  }
  return 0;
}

uint64_t sub_C7F8()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

void sub_C8E4()
{
  id v1 = [objc_allocWithZone((Class)PSSpecifier) initWithName:0 target:v0 set:0 get:0 detail:0 cell:-1 edit:0];
  if (v1)
  {
    uint64_t v2 = v1;
    type metadata accessor for TipCell();
    sub_C9F8(&qword_1F020);
    [v2 setProperty:sub_F870() forKey:PSCellClassKey];
    swift_unknownObjectRelease();
    if (qword_1F350 != -1) {
      swift_once();
    }
    id v3 = *(void **)(qword_1F358 + 16);
    *(void *)(qword_1F358 + 16) = v2;
  }
}

uint64_t type metadata accessor for TipCell()
{
  return self;
}

uint64_t sub_C9F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_CA84(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  sub_D700(a1, a1[3]);
  uint64_t v14 = sub_F860();
  uint64_t v15 = a4[3];
  if (v15)
  {
    uint64_t v16 = sub_D700(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    __chkstk_darwin(v16, v16);
    uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_F860();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    sub_D744((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [(id)swift_getObjCClassFromMetadata() constraintWithItem:v14 attribute:a2 relatedBy:a3 toItem:v21 attribute:a5 multiplier:a6 constant:a7];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_D744((uint64_t)a1);
  return v22;
}

id sub_CD40(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView] = 0;
  if (a3)
  {
    NSString v7 = sub_F750();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for TipCell();
  id v8 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:specifier:", a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_CF58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_CF9C(uint64_t a1, int *a2)
{
  long long v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_D078;
  return v6(a1);
}

uint64_t sub_D078()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_D174()
{
  id v1 = v0;
  id v2 = [v0 specifier];
  v30.receiver = v1;
  v30.super_class = (Class)type metadata accessor for TipCell();
  objc_msgSendSuper2(&v30, "refreshCellContentsWithSpecifier:", v2);

  [v1 setUserInteractionEnabled:1];
  id v3 = [self clearColor];
  [v1 setBackgroundColor:v3];

  id v4 = [v1 specifier];
  if (v4)
  {
    id v5 = v4;
    *(void *)&long long v26 = 0x746E6F4373706954;
    *((void *)&v26 + 1) = 0xEB00000000746E65;
    id v6 = [v4 objectForKeyedSubscript:sub_F870()];
    swift_unknownObjectRelease();

    if (v6)
    {
      sub_F800();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
    }
    sub_D65C((uint64_t)&v26, (uint64_t)v28);
    if (v29)
    {
      uint64_t v7 = sub_F660();
      if (swift_dynamicCast())
      {
        id v8 = v25;
        uint64_t v9 = OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView;
        if (!*(void *)&v1[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView])
        {
          id v10 = [v1 contentView];
          [v10 addSubview:v25];

          sub_C9F8(&qword_1F120);
          uint64_t v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_17060;
          sub_D6C4(0, &qword_1F128);
          id v12 = [v1 contentView];
          uint64_t v13 = sub_D6C4(0, &qword_1F130);
          uint64_t v29 = v13;
          *((void *)&v27 + 1) = v7;
          v28[0] = v12;
          *(void *)&long long v26 = v25;
          id v14 = v25;
          *(void *)(v11 + 32) = sub_CA84(v28, 5, 0, &v26, 5, 1.0, 0.0);
          id v15 = [v1 contentView];
          uint64_t v29 = v13;
          *((void *)&v27 + 1) = v7;
          v28[0] = v15;
          *(void *)&long long v26 = v14;
          id v16 = v14;
          *(void *)(v11 + 40) = sub_CA84(v28, 6, 0, &v26, 6, 1.0, 0.0);
          id v17 = [v1 contentView];
          uint64_t v29 = v13;
          *((void *)&v27 + 1) = v7;
          v28[0] = v17;
          *(void *)&long long v26 = v16;
          id v18 = v16;
          *(void *)(v11 + 48) = sub_CA84(v28, 3, 0, &v26, 3, 1.0, 0.0);
          id v19 = [v1 contentView];
          uint64_t v29 = v13;
          *((void *)&v27 + 1) = v7;
          v28[0] = v19;
          *(void *)&long long v26 = v18;
          id v20 = v18;
          *(void *)(v11 + 56) = sub_CA84(v28, 4, 0, &v26, 4, 1.0, 0.0);
          v28[0] = v11;
          sub_F780();
          uint64_t v21 = self;
          Class isa = sub_F770().super.isa;
          swift_bridgeObjectRelease();
          [v21 activateConstraints:isa];

          id v8 = *(void **)&v1[v9];
          *(void *)&v1[v9] = v20;
        }
LABEL_14:

        return;
      }
    }
    else
    {
      sub_DD28((uint64_t)v28, &qword_1F118);
    }
    uint64_t v23 = OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView;
    uint64_t v24 = *(void **)&v1[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView];
    if (v24)
    {
      [v24 removeFromSuperview];
      id v8 = *(void **)&v1[v23];
    }
    else
    {
      id v8 = 0;
    }
    *(void *)&v1[v23] = 0;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t _s14SosTipUserInfoCMa()
{
  return self;
}

uint64_t sub_D5CC()
{
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *id v2 = v1;
  v2[1] = sub_DE58;
  return sub_A078(v0);
}

uint64_t sub_D65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_C9F8(&qword_1F118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_D6C4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void *sub_D700(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_D744(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_D794()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_D7CC()
{
  return sub_A6FC(*(void **)(v0 + 16));
}

uint64_t sub_D7D4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_D7E4()
{
  uint64_t v1 = sub_F590();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  if (*(void *)(v0 + v5)) {
    swift_release();
  }

  return _swift_deallocObject(v0, v5 + 16, v3 | 7);
}

uint64_t sub_D8E0()
{
  uint64_t v2 = *(void *)(sub_F590() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + v4);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = (uint64_t *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  id v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *id v10 = v1;
  v10[1] = sub_D9FC;
  return sub_B754((uint64_t)v10, v11, v12, v6, v5, v8, v9);
}

uint64_t sub_D9FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_DAF0()
{
  unint64_t result = qword_1F158;
  if (!qword_1F158)
  {
    sub_F590();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1F158);
  }
  return result;
}

uint64_t *sub_DB48(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_DBAC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DBE4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_D9FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1F160 + dword_1F160);
  return v6(a1, v4);
}

uint64_t sub_DC9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_DCE4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_DC9C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_DD28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_C9F8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_DD84()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_DDC4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_DE58;
  return sub_A814((uint64_t)v3, v4, v5, v2);
}

uint64_t variable initialization expression of SOSFeedbackController.delegate()
{
  return 0;
}

char *SOSFeedbackController.__allocating_init(delegate:legalText:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  uint64_t v8 = sub_F118(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

char *SOSFeedbackController.init(delegate:legalText:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_F118(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

UIViewController __swiftcall SOSFeedbackController.getFeedbackViewController()()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(v0
                                                       + OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_feedbackViewController)
                                         + 184);
  uint64_t v2 = swift_retain();
  v3.super.super.Class isa = (Class)v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_E058()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = (void *)result;
    NSString v3 = sub_F750();
    [v2 feedbackController:v0 didCompleteWithFeedbackID:v3];

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_E0EC(uint64_t a1, uint64_t a2)
{
  return sub_E230(a1, a2, (SEL *)&selRef_feedbackController_didFailToStartWithError_);
}

void *sub_E0F8()
{
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    [result feedbackControllerDidCancel:v0];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_E15C()
{
  uint64_t v1 = v0;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = (void *)result;
    sub_F550(v3);
    uint64_t v6 = v5;
    swift_bridgeObjectRetain();
    NSString v7 = sub_F750();
    swift_bridgeObjectRelease();
    [v4 feedbackController:v1 didFailToAttachURL:v6 error:v7];

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_E224(uint64_t a1, uint64_t a2)
{
  return sub_E230(a1, a2, (SEL *)&selRef_feedbackController_didFailToSubmitFeedback_);
}

uint64_t sub_E230(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v6 = (void *)result;
    swift_bridgeObjectRetain();
    NSString v7 = sub_F750();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, *a3, v3, v7);

    return swift_unknownObjectRelease();
  }
  return result;
}

id SOSFeedbackController.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void SOSFeedbackController.init()()
{
}

id SOSFeedbackController.__deallocating_deinit()
{
  return sub_F0E0(type metadata accessor for SOSFeedbackController);
}

uint64_t sub_E3D8()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & *v0)))();
}

uint64_t sub_E40C()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.reserved2 + (swift_isaMask & *v0)))();
}

uint64_t sub_E440()
{
  return (*(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & *v0])();
}

uint64_t sub_E474()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v0) - 8])();
}

uint64_t sub_E4A8()
{
  return (*(uint64_t (**)(void))&stru_B8.segname[swift_isaMask & *v0])();
}

uint64_t sub_E4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = sub_F6B0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v4 + 40) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v4 + 40) = 0;
  swift_unknownObjectWeakAssign();
  id v12 = objc_allocWithZone((Class)sub_F700());
  uint64_t v13 = (void *)sub_F6A0();
  *(void *)(v5 + 16) = v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for FBKFeedbackForm.AuthenticationMethod.none(_:), v7);
  id v14 = v13;
  sub_F6C0();

  if (a4)
  {
    id v15 = *(id *)(v5 + 16);
    sub_F6D0();
  }
  id v16 = *(void **)(v5 + 16);
  id v17 = objc_allocWithZone((Class)sub_F740());
  id v18 = v16;
  id v19 = (void *)sub_F720();
  *(void *)(v5 + 24) = v19;
  id v20 = v19;
  swift_retain();
  sub_F730();

  return v5;
}

id sub_E678()
{
  return *(id *)(v0 + 24);
}

uint64_t sub_E680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v7 = *(void *)(v3 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, a3, ObjectType, v7);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_E818()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = *(void *)(v0 + 40);
    swift_getObjectType();
    uint64_t v3 = sub_F690();
    (*(void (**)(uint64_t))(v2 + 16))(v3);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_E988()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = *(void *)(v0 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 24))(ObjectType, v2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_EAC0(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = sub_F710();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 32))(a2, v7, v8, ObjectType, v5);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_ECEC(uint64_t a1, void *a2)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v2 + 40);
    uint64_t ObjectType = swift_getObjectType();
    id v7 = [a2 description];
    uint64_t v8 = sub_F760();
    uint64_t v10 = v9;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 40))(v8, v10, ObjectType, v5);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_EED0()
{
  sub_F22C(v0 + 32);

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t SOSCrashDetectionFeedbackController.__allocating_init(delegate:legalText:uuid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  uint64_t v12 = sub_F254(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v12;
}

uint64_t SOSCrashDetectionFeedbackController.init(delegate:legalText:uuid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = sub_F254(a1, a2, a3, a4, a5);
  swift_unknownObjectRelease();
  return v5;
}

void SOSCrashDetectionFeedbackController.init(delegate:legalText:)()
{
}

id SOSCrashDetectionFeedbackController.__deallocating_deinit()
{
  return sub_F0E0(type metadata accessor for SOSCrashDetectionFeedbackController);
}

id sub_F0E0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

char *sub_F118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  type metadata accessor for SOSFeedbackViewController();
  uint64_t v6 = swift_allocObject();
  id v7 = v3;
  sub_E4DC(0xD00000000000001ALL, 0x8000000000012EF0, a2, a3);
  *(void *)&v7[OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_feedbackViewController] = v6;

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for SOSFeedbackController();
  uint64_t v8 = (char *)objc_msgSendSuper2(&v10, "init");
  *(void *)(*(void *)&v8[OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_feedbackViewController] + 40) = &off_18D20;
  swift_unknownObjectWeakAssign();
  return v8;
}

uint64_t type metadata accessor for SOSFeedbackController()
{
  return self;
}

uint64_t sub_F22C(uint64_t a1)
{
  return a1;
}

uint64_t sub_F254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  v21[1] = a1;
  uint64_t v10 = sub_F6F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = __chkstk_darwin(v10, v12);
  id v15 = (void *)((char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    type metadata accessor for SOSFeedbackViewController();
    uint64_t v16 = swift_allocObject();
    sub_E4DC(0xD000000000000020, 0x8000000000012EA0, a2, a3);
    if (a5)
    {
      id v17 = *(void **)(v16 + 16);
      void *v15 = 0xD000000000000014;
      v15[1] = 0x8000000000012ED0;
      (*(void (**)(void *, void, uint64_t))(v11 + 104))(v15, enum case for FBKFeedbackForm.Question.custom(_:), v10);
      id v18 = v17;
      sub_F6E0();

      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v11 + 8))(v15, v10);
    }
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    *(void *)&v6[OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_feedbackViewController] = v16;
    id v19 = (objc_class *)type metadata accessor for SOSFeedbackController();
    v22.receiver = v6;
    v22.super_class = v19;
    id v20 = (char *)objc_msgSendSuper2(&v22, "init");
    *(void *)(*(void *)&v20[OBJC_IVAR____TtC11SOSSettings21SOSFeedbackController_feedbackViewController] + 40) = &off_18D20;
    swift_unknownObjectWeakAssign();
    return (uint64_t)v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SOSCrashDetectionFeedbackController()
{
  return self;
}

uint64_t type metadata accessor for SOSFeedbackViewController()
{
  return self;
}

void sub_F4A0()
{
}

void sub_F4CC()
{
}

void sub_F4F8()
{
}

void sub_F524()
{
}

void sub_F550(NSURL *retstr@<X8>)
{
}

uint64_t sub_F560()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_F570()
{
  return type metadata accessor for URL();
}

uint64_t sub_F580()
{
  return SOSMiniTip.init()();
}

uint64_t sub_F590()
{
  return type metadata accessor for SOSMiniTip();
}

uint64_t sub_F5A0()
{
  return dispatch thunk of TPTipsHelper.removeEntries(_:)();
}

uint64_t sub_F5B0()
{
  return type metadata accessor for TPTipsHelper.Entry.Kind();
}

uint64_t sub_F5C0()
{
  return type metadata accessor for TPTipsHelper.Entry();
}

uint64_t sub_F5D0()
{
  return TPTipsHelper.Entry.init(_:tip:observationTask:)();
}

uint64_t sub_F5E0()
{
  return dispatch thunk of TPTipsHelper.setup()();
}

uint64_t sub_F600()
{
  return dispatch thunk of TPTipsHelper.addEntry(_:)();
}

uint64_t sub_F610()
{
  return static TPTipsHelper.taskQueue.getter();
}

uint64_t sub_F620()
{
  return type metadata accessor for TPTipsHelper();
}

uint64_t sub_F630()
{
  return dispatch thunk of TaskQueue.async(_:)();
}

uint64_t sub_F640()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t sub_F650()
{
  return TipUIView.backgroundColor.setter();
}

uint64_t sub_F660()
{
  return type metadata accessor for TipUIView();
}

uint64_t sub_F670()
{
  return TipUIView.init(_:arrowEdge:actionHandler:)();
}

uint64_t sub_F680()
{
  return type metadata accessor for Tips.Status();
}

uint64_t sub_F690()
{
  return FBKDraftError.description.getter();
}

uint64_t sub_F6A0()
{
  return FBKFeedbackForm.init(identifier:)();
}

uint64_t sub_F6B0()
{
  return type metadata accessor for FBKFeedbackForm.AuthenticationMethod();
}

uint64_t sub_F6C0()
{
  return dispatch thunk of FBKFeedbackForm.authenticationMethod.setter();
}

uint64_t sub_F6D0()
{
  return dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.setter();
}

uint64_t sub_F6E0()
{
  return dispatch thunk of FBKFeedbackForm.prefill(question:answer:)();
}

uint64_t sub_F6F0()
{
  return type metadata accessor for FBKFeedbackForm.Question();
}

uint64_t sub_F700()
{
  return type metadata accessor for FBKFeedbackForm();
}

uint64_t sub_F710()
{
  return FBKAttachmentError.description.getter();
}

uint64_t sub_F720()
{
  return FBKFeedbackDraftViewController.init(feedbackForm:)();
}

uint64_t sub_F730()
{
  return dispatch thunk of FBKFeedbackDraftViewController.delegate.setter();
}

uint64_t sub_F740()
{
  return type metadata accessor for FBKFeedbackDraftViewController();
}

NSString sub_F750()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_F760()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

NSArray sub_F770()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_F780()
{
  return specialized Array._endMutation()();
}

uint64_t sub_F790()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_F7B0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_F7C0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_F7D0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_F7E0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_F7F0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_F800()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_F810()
{
  return AsyncMapSequence.base.getter();
}

uint64_t sub_F820()
{
  return AsyncMapSequence.Iterator.baseIterator.modify();
}

uint64_t sub_F830()
{
  return AsyncMapSequence.Iterator.transform.getter();
}

uint64_t sub_F840()
{
  return AsyncMapSequence.Iterator.init(_:transform:)();
}

uint64_t sub_F850()
{
  return AsyncMapSequence.transform.getter();
}

uint64_t sub_F860()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_F870()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CTStewieServiceStatusReasonAsString()
{
  return _CTStewieServiceStatusReasonAsString();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend_SOSContactsWithTimeout_andCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SOSContactsWithTimeout:andCompletion:");
}

id objc_msgSend_SOSSelectableTriggerMechanismCapability(void *a1, const char *a2, ...)
{
  return _[a1 SOSSelectableTriggerMechanismCapability];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__canLaunchDemoFlow(void *a1, const char *a2, ...)
{
  return _[a1 _canLaunchDemoFlow];
}

id objc_msgSend__userSOSDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _userSOSDefaults];
}

id objc_msgSend_accidentalCallFeedbackAssistantLegalText(void *a1, const char *a2, ...)
{
  return _[a1 accidentalCallFeedbackAssistantLegalText];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAnnotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnnotation:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSpecifiersFromArray_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSpecifiersFromArray:animated:");
}

id objc_msgSend_addStewieGroupIfSupportedAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStewieGroupIfSupportedAnimated:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_annotations(void *a1, const char *a2, ...)
{
  return _[a1 annotations];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_callWithHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithHold:");
}

id objc_msgSend_callWithHoldFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 callWithHoldFooterDescription];
}

id objc_msgSend_callWithHoldTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 callWithHoldTitleDescription];
}

id objc_msgSend_callWithPresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callWithPresses:");
}

id objc_msgSend_callWithPressesFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 callWithPressesFooterDescription];
}

id objc_msgSend_callWithPressesTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 callWithPressesTitleDescription];
}

id objc_msgSend_canTriggerSOSWithVolumeLockHold(void *a1, const char *a2, ...)
{
  return _[a1 canTriggerSOSWithVolumeLockHold];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_configureTryOutButton(void *a1, const char *a2, ...)
{
  return _[a1 configureTryOutButton];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsSpecifier:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_coreTelephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyClient];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countdownSoundFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 countdownSoundFooterDescription];
}

id objc_msgSend_countdownSoundTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 countdownSoundTitleDescription];
}

id objc_msgSend_crashDetectionFeedbackAssistantLegalText(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionFeedbackAssistantLegalText];
}

id objc_msgSend_crashDetectionPhoneFooterDesription(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionPhoneFooterDesription];
}

id objc_msgSend_crashDetectionPhoneWatchFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionPhoneWatchFooterDescription];
}

id objc_msgSend_crashDetectionSwitchDescription(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionSwitchDescription];
}

id objc_msgSend_crashDetectionThirdPartyCellTitle(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionThirdPartyCellTitle];
}

id objc_msgSend_crashDetectionThirdPartyFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionThirdPartyFooterDescription];
}

id objc_msgSend_crashDetectionThirdPartyNavigationTitle(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionThirdPartyNavigationTitle];
}

id objc_msgSend_crashDetectionTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 crashDetectionTitleDescription];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentSOSTriggerMechanism(void *a1, const char *a2, ...)
{
  return _[a1 currentSOSTriggerMechanism];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_emergencyContactsEditDescription(void *a1, const char *a2, ...)
{
  return _[a1 emergencyContactsEditDescription];
}

id objc_msgSend_emergencyContactsFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 emergencyContactsFooterDescription];
}

id objc_msgSend_emergencyContactsFooterLinkTitle(void *a1, const char *a2, ...)
{
  return _[a1 emergencyContactsFooterLinkTitle];
}

id objc_msgSend_emergencyContactsSectionDescription(void *a1, const char *a2, ...)
{
  return _[a1 emergencyContactsSectionDescription];
}

id objc_msgSend_emergencySOSSoundEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencySOSSoundEnabled:");
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEvent];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fivePressesSelectionTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 fivePressesSelectionTitleDescription];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_getAssetViewForPhoneWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAssetViewForPhoneWithCompletion:");
}

id objc_msgSend_getCrashDetectionEnabledForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCrashDetectionEnabledForSpecifier:");
}

id objc_msgSend_getFeedbackViewController(void *a1, const char *a2, ...)
{
  return _[a1 getFeedbackViewController];
}

id objc_msgSend_getGroup_row_ofSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGroup:row:ofSpecifierID:");
}

id objc_msgSend_getGroupSpecifierForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGroupSpecifierForSpecifier:");
}

id objc_msgSend_getKappaThirdPartyApp(void *a1, const char *a2, ...)
{
  return _[a1 getKappaThirdPartyApp];
}

id objc_msgSend_getKappaThirdPartyDisplayNameForApp(void *a1, const char *a2, ...)
{
  return _[a1 getKappaThirdPartyDisplayNameForApp];
}

id objc_msgSend_getShortSOSNotificationDisplayTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 getShortSOSNotificationDisplayTimestamp];
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return _[a1 getState];
}

id objc_msgSend_getStewieSupportWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStewieSupportWithCompletion:");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierID:");
}

id objc_msgSend_initSharingLocationSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 initSharingLocationSpecifiers];
}

id objc_msgSend_initWithDelegate_legalText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:legalText:");
}

id objc_msgSend_initWithDelegate_legalText_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:legalText:uuid:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_insertContiguousSpecifiers_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:atIndex:animated:");
}

id objc_msgSend_insertSpecifier_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atIndex:animated:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isCallWithSideButtonPressesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCallWithSideButtonPressesEnabled];
}

id objc_msgSend_isCallWithVolumeLockHoldEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCallWithVolumeLockHoldEnabled];
}

id objc_msgSend_isDemoAllowedForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDemoAllowedForService:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isKappaDetectionSupportedOnActiveWatch(void *a1, const char *a2, ...)
{
  return _[a1 isKappaDetectionSupportedOnActiveWatch];
}

id objc_msgSend_isKappaDetectionSupportedOnPhone(void *a1, const char *a2, ...)
{
  return _[a1 isKappaDetectionSupportedOnPhone];
}

id objc_msgSend_isKappaVisible(void *a1, const char *a2, ...)
{
  return _[a1 isKappaVisible];
}

id objc_msgSend_isSendingLocationUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isSendingLocationUpdate];
}

id objc_msgSend_isStewieVisible(void *a1, const char *a2, ...)
{
  return _[a1 isStewieVisible];
}

id objc_msgSend_kappaTriggersEmergencySOS(void *a1, const char *a2, ...)
{
  return _[a1 kappaTriggersEmergencySOS];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_loadTriggerImageViewWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTriggerImageViewWithCompletion:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeTipSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 makeTipSpecifier];
}

id objc_msgSend_mostRecentLocationSentWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mostRecentLocationSentWithCompletion:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nonretainedObjectValue(void *a1, const char *a2, ...)
{
  return _[a1 nonretainedObjectValue];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withCompletionHandler:");
}

id objc_msgSend_pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_phoneTriggerAnimationFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 phoneTriggerAnimationFooterDescription];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 plainButtonConfiguration];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentConfirmationOnViewController_title_message_cancelTitle_cancelHandler_confirmTitle_confirmHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentConfirmationOnViewController:title:message:cancelTitle:cancelHandler:confirmTitle:confirmHandler:");
}

id objc_msgSend_presentStewieDemoUnavailableAlertOnViewController_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentStewieDemoUnavailableAlertOnViewController:reason:");
}

id objc_msgSend_presentStewieTryOutModeIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 presentStewieTryOutModeIfPossible];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_pressSelectionGroupTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 pressSelectionGroupTitleDescription];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_ps_insertObjectsFromArray_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObjectsFromArray:afterObject:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_refreshStewieAssetSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshStewieAssetSpecifier:");
}

id objc_msgSend_refreshTipSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshTipSpecifier:");
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_reloadAlarmSoundAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAlarmSoundAnimated:");
}

id objc_msgSend_reloadEmergencyContactsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadEmergencyContactsAnimated:");
}

id objc_msgSend_reloadHealthButtonLabelWithContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadHealthButtonLabelWithContacts:");
}

id objc_msgSend_reloadPrivacyFooterWithContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadPrivacyFooterWithContacts:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAnnotations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAnnotations:");
}

id objc_msgSend_removeContiguousSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:animated:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_requestStewieWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestStewieWithContext:completion:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCallWithSideButtonPresses_presentErrorAlertOnViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallWithSideButtonPresses:presentErrorAlertOnViewController:completion:");
}

id objc_msgSend_setCallWithVolumeLockHoldEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallWithVolumeLockHoldEnabled:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfirmationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationAction:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoordinate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setKappaThirdPartyActive_forApp_forPairedDevice_presentConfirmationOnViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKappaThirdPartyActive:forApp:forPairedDevice:presentConfirmationOnViewController:completion:");
}

id objc_msgSend_setKappaTriggersEmergencySOS_confirmationDelegate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKappaTriggersEmergencySOS:confirmationDelegate:completion:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfSideButtonPresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfSideButtonPresses:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPreferenceValue_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferenceValue:specifier:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRegion_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegion:animated:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSettingsResetFollowUpState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsResetFollowUpState:");
}

id objc_msgSend_setShouldPlayAudioDuringCountdown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPlayAudioDuringCountdown:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUpConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setUpConstraints];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithDictionary:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldForceDisableAutoCallForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceDisableAutoCallForClient:");
}

id objc_msgSend_shouldPlayAudioDuringCountdown(void *a1, const char *a2, ...)
{
  return _[a1 shouldPlayAudioDuringCountdown];
}

id objc_msgSend_showConfirmationViewForSpecifier_useAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showConfirmationViewForSpecifier:useAlert:");
}

id objc_msgSend_showCrashDetectionFeedbackAssistantWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showCrashDetectionFeedbackAssistantWithUUID:");
}

id objc_msgSend_showFeedbackAssistant(void *a1, const char *a2, ...)
{
  return _[a1 showFeedbackAssistant];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersArray(void *a1, const char *a2, ...)
{
  return _[a1 specifiersArray];
}

id objc_msgSend_specifiersInGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersInGroup:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusReasonForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusReasonForService:");
}

id objc_msgSend_stewieDemoButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 stewieDemoButtonTitle];
}

id objc_msgSend_stewieDemoCellText(void *a1, const char *a2, ...)
{
  return _[a1 stewieDemoCellText];
}

id objc_msgSend_stewieFooterDescription(void *a1, const char *a2, ...)
{
  return _[a1 stewieFooterDescription];
}

id objc_msgSend_stewieFooterLinkTitle(void *a1, const char *a2, ...)
{
  return _[a1 stewieFooterLinkTitle];
}

id objc_msgSend_stewieGroupAsset(void *a1, const char *a2, ...)
{
  return _[a1 stewieGroupAsset];
}

id objc_msgSend_stewieGroupTitle(void *a1, const char *a2, ...)
{
  return _[a1 stewieGroupTitle];
}

id objc_msgSend_stewieStateMonitor(void *a1, const char *a2, ...)
{
  return _[a1 stewieStateMonitor];
}

id objc_msgSend_stopSendingLocationUpdate(void *a1, const char *a2, ...)
{
  return _[a1 stopSendingLocationUpdate];
}

id objc_msgSend_submitSOSNotificationSettingsChangedMetric_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitSOSNotificationSettingsChangedMetric:withValue:");
}

id objc_msgSend_submitSOSNotificationTapMetric(void *a1, const char *a2, ...)
{
  return _[a1 submitSOSNotificationTapMetric];
}

id objc_msgSend_supportsSOSWithSideButtonSelectableNumberOfClicks(void *a1, const char *a2, ...)
{
  return _[a1 supportsSOSWithSideButtonSelectableNumberOfClicks];
}

id objc_msgSend_targetAudience(void *a1, const char *a2, ...)
{
  return _[a1 targetAudience];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_thirdPartyApp(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyApp];
}

id objc_msgSend_thirdPartySettingsSpecifiersWithTarget_forApp_disableAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thirdPartySettingsSpecifiersWithTarget:forApp:disableAction:");
}

id objc_msgSend_threePressesSelectionTitleDescription(void *a1, const char *a2, ...)
{
  return _[a1 threePressesSelectionTitleDescription];
}

id objc_msgSend_tipEntrySpecifier(void *a1, const char *a2, ...)
{
  return _[a1 tipEntrySpecifier];
}

id objc_msgSend_tipKitStartObservation(void *a1, const char *a2, ...)
{
  return _[a1 tipKitStartObservation];
}

id objc_msgSend_tipKitStopObservation(void *a1, const char *a2, ...)
{
  return _[a1 tipKitStopObservation];
}

id objc_msgSend_tipSpecifierKey(void *a1, const char *a2, ...)
{
  return _[a1 tipSpecifierKey];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_updateAutoCallSpecifierEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAutoCallSpecifierEnabled:");
}

id objc_msgSend_updateLastLocationSent(void *a1, const char *a2, ...)
{
  return _[a1 updateLastLocationSent];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}