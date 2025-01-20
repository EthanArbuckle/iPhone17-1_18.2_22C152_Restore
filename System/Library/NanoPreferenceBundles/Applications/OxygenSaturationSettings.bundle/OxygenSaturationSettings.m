uint64_t sub_22F0()
{
  uint64_t v0;

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for OxygenSaturationSettings()
{
  return self;
}

id sub_2324()
{
  uint64_t v1 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___healthStore;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___healthStore);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___healthStore);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)HKHealthStore) init];
    v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2398()
{
  uint64_t v1 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___featureAvailabilityStore;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___featureAvailabilityStore);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___featureAvailabilityStore);
  }
  else
  {
    id v4 = HKFeatureIdentifierOxygenSaturationRecording;
    id v5 = sub_2324();
    id v6 = [objc_allocWithZone((Class)HKFeatureAvailabilityStore) initWithFeatureIdentifier:v4 healthStore:v5];

    v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    v2 = 0;
  }
  id v8 = v2;
  return v3;
}

BOOL sub_2444()
{
  ObjectType = (void *)swift_getObjectType();
  id v1 = sub_2398();
  id v20 = 0;
  id v2 = [v1 onboardedCountryCodeSupportedStateWithError:&v20];

  if (v2)
  {
    id v3 = v20;
    id v4 = (char *)[v2 integerValue];
    if (v4 != (unsigned char *)&dword_0 + 1)
    {
      v11 = (int *)v4;

      return v11 == &dword_4;
    }
    id v5 = sub_2398();
    id v20 = 0;
    id v6 = [v5 onboardingEligibilityForCountryCode:0 error:&v20];

    if (v6)
    {
      id v7 = v20;
      unint64_t v8 = (unint64_t)[v6 ineligibilityReasons];

      return (v8 >> 6) & 1;
    }
    id v12 = v20;
    sub_6060();

    swift_willThrow();
  }
  else
  {
    id v10 = v20;
    sub_6060();

    swift_willThrow();
  }
  sub_6200();
  if (qword_CB00 != -1) {
    swift_once();
  }
  sub_5930();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_6E30;
  id v20 = ObjectType;
  swift_getMetatypeMetadata();
  uint64_t v14 = sub_6160();
  uint64_t v16 = v15;
  *(void *)(v13 + 56) = &type metadata for String;
  unint64_t v17 = sub_59D0();
  *(void *)(v13 + 64) = v17;
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  swift_getErrorValue();
  uint64_t v18 = sub_62A0();
  *(void *)(v13 + 96) = &type metadata for String;
  *(void *)(v13 + 104) = v17;
  *(void *)(v13 + 72) = v18;
  *(void *)(v13 + 80) = v19;
  sub_60F0();
  swift_errorRelease();
  swift_bridgeObjectRelease();
  return 0;
}

id sub_27A8()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for SettingsViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_29C0()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_onboardingManager];
  if ([v1 onboardingShouldAppear]
    && ([v1 bloodOxygenRemoteDisabled] & 1) == 0)
  {
    if (*(void *)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController])
    {
      id v2 = [v0 tabBarController];
      if (v2)
      {
        objc_super v3 = v2;
        uint64_t v4 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden;
        [v2 hideBarWithTransition:0];

        v0[v4] = 1;
      }
    }
    else
    {
      id v5 = [self onboardingViewControllerWithStyle:1 settings:*(void *)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings] onboardingManager:v1 onboardingDelegate:v0];
      sub_2DB8(v5);
    }
  }
  else
  {
    sub_53A4();
    sub_5050();
  }
}

id sub_2B58(char a1)
{
  id v2 = v1;
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SettingsViewController();
  objc_msgSendSuper2(&v8, "viewWillAppear:", a1 & 1);
  sub_29C0();
  uint64_t v4 = *(void **)&v2[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings];
  NSString v5 = [v4 bloodOxygenLocalizedPaneTitle];
  if (!v5)
  {
    sub_6140();
    NSString v5 = sub_6120();
    swift_bridgeObjectRelease();
  }
  [v2 setTitle:v5];

  sub_5FB8(0, (unint64_t *)&unk_CD10);
  id v6 = (void *)sub_6210();
  [v4 addObserver:v2 queue:v6];

  return [v2 reloadSpecifiers];
}

id sub_2CB0(char a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for SettingsViewController();
  objc_msgSendSuper2(&v7, "viewWillDisappear:", a1 & 1);
  uint64_t v3 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden;
  if (v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden] == 1)
  {
    id v4 = [v1 tabBarController];
    if (v4)
    {
      NSString v5 = v4;
      [v4 showBarWithTransition:3];

      v1[v3] = 0;
    }
  }
  return [*(id *)&v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings] removeObserver:v1];
}

void sub_2DB8(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden;
  if ((v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden] & 1) == 0)
  {
    id v4 = [v1 tabBarController];
    if (v4)
    {
      NSString v5 = v4;
      [v4 hideBarWithTransition:7];

      v1[v3] = 1;
    }
  }
  [v1 addChildViewController:a1];
  id v6 = [v1 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_10;
  }
  objc_super v7 = v6;
  id v8 = [a1 view];
  if (!v8)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v9 = v8;
  [v7 addSubview:v8];

  [a1 didMoveToParentViewController:v1];
  id v11 = *(id *)&v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController];
  *(void *)&v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController] = a1;
  id v10 = a1;
}

void sub_2EE8(int a1)
{
  sub_60B0();
  __chkstk_darwin();
  sub_6110();
  __chkstk_darwin();
  uint64_t v3 = self;
  NSString v4 = sub_6120();
  id v5 = [v3 groupSpecifierWithID:v4];

  if (v5)
  {
    LODWORD(v30) = a1;
    sub_60E0();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    objc_super v7 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v7)
    {
      sub_6140();
      objc_super v7 = (NSString *)sub_6120();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v5, "setProperty:forKey:", v7, PSHeaderCellClassGroupKey, v30);

    type metadata accessor for OxygenSaturationSettings();
    uint64_t v8 = swift_getObjCClassFromMetadata();
    v9 = self;
    id v10 = [v9 bundleForClass:v8];
    NSString v11 = sub_6120();
    id v12 = [self imageNamed:v11 inBundle:v10];

    [v5 setProperty:v12 forKey:PSIconImageKey];
    uint64_t v13 = v1;
    uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings);
    NSString v15 = [v14 bloodOxygenSectionTitle];
    if (!v15)
    {
      sub_6140();
      NSString v15 = sub_6120();
      uint64_t v13 = v1;
      swift_bridgeObjectRelease();
    }
    [v5 setProperty:v15 forKey:PSTitleKey];

    sub_6100();
    id v16 = [v9 bundleForClass:v8];
    sub_60A0();
    sub_6150();
    NSString v17 = sub_6120();
    swift_bridgeObjectRelease();
    uint64_t v18 = PSStaticHeaderTextKey;
    [v5 setProperty:v17 forKey:PSStaticHeaderTextKey];

    if (![*(id *)(v13+ OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_onboardingManager) ageIsAppropriate])
    {
      NSString v21 = sub_6120();
      id v22 = (id)HKRPLocalizedString();

      sub_6140();
      sub_5930();
      uint64_t v23 = swift_allocObject();
      uint64_t v31 = 1;
      *(_OWORD *)(v23 + 16) = xmmword_6E40;
      uint64_t v24 = kHKOxygenSaturationRecordingAgeGatingAge;
      *(void *)(v23 + 56) = &type metadata for Int;
      *(void *)(v23 + 64) = &protocol witness table for Int;
      *(void *)(v23 + 32) = v24;
      uint64_t v25 = sub_6130();
      uint64_t v27 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v28 = [v14 backgroundRecordingsWithAgeGatingEnabledHeader];
      sub_6140();

      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_6E40;
      *(void *)(v29 + 56) = &type metadata for String;
      *(void *)(v29 + 64) = sub_59D0();
      *(void *)(v29 + 32) = v25;
      *(void *)(v29 + 40) = v27;
      sub_6130();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      NSString v20 = sub_6120();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    if ((*(unsigned char *)(v13 + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_isRegionSupported) & 1) != 0
      || (v31 & 1) != 0)
    {
      NSString v20 = [v14 backgroundRecordingsHeader];
      if (!v20)
      {
LABEL_13:
        sub_6140();
        goto LABEL_14;
      }
    }
    else
    {
      NSString v19 = sub_6120();
      NSString v20 = (id)HKRPLocalizedString();

      if (!v20) {
        goto LABEL_13;
      }
    }
LABEL_15:
    objc_msgSend(v5, "setProperty:forKey:", v20, v18, v31);

    return;
  }
  __break(1u);
}

void sub_3468()
{
  uint64_t v1 = v0;
  BOOL v2 = sub_2444();
  id v3 = [self standardSettings];
  sub_2EE8(v2);
  id v5 = v4;
  sub_6170();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_61A0();
  }
  sub_61B0();
  sub_6190();
  if (![*(id *)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_onboardingManager] settingsShouldAppear])goto LABEL_62; {
  if (v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_isRegionSupported])
  }
  {
    if (!v2)
    {
      id v94 = v5;
      NSString v6 = sub_6120();
      id v7 = (id)HKRPLocalizedString();

      uint64_t v8 = sub_6140();
      uint64_t v10 = v9;

      id v11 = [*(id *)&v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings] aboutBloodOxygenFooterWithLearnMore];
      goto LABEL_9;
    }
  }
  else if (!v2)
  {
LABEL_62:
    unint64_t v78 = swift_bridgeObjectRetain();
    sub_4388(v78);
    swift_bridgeObjectRelease();
    Class isa = sub_6180().super.isa;
    swift_bridgeObjectRelease();
    [v1 setSpecifiers:isa];

    sub_4388((unint64_t)&_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();

    return;
  }
  id v94 = v5;
  NSString v12 = sub_6120();
  id v13 = (id)HKRPLocalizedString();

  uint64_t v8 = sub_6140();
  uint64_t v10 = v14;

  NSString v15 = sub_6120();
  id v11 = (id)HKRPLocalizedString();

LABEL_9:
  sub_6140();

  sub_5930();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_6E40;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = sub_59D0();
  *(void *)(v16 + 32) = v8;
  *(void *)(v16 + 40) = v10;
  swift_bridgeObjectRetain();
  sub_6130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v17 = sub_6120();
  swift_bridgeObjectRelease();
  NSString v18 = sub_6120();
  swift_bridgeObjectRelease();
  id v19 = [v17 rangeOfString:v18];
  NSUInteger v21 = v20;

  v96.location = (NSUInteger)v19;
  v96.length = v21;
  id v22 = NSStringFromRange(v96);
  if (!v22)
  {
    sub_6140();
    id v22 = (NSString *)sub_6120();
    swift_bridgeObjectRelease();
  }
  uint64_t v23 = self;
  NSString v24 = sub_6120();
  v95 = v23;
  id v25 = [v23 groupSpecifierWithID:v24];

  if (!v25)
  {

    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  sub_5FB8(0, &qword_CCF8);
  aClass = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v26 = NSStringFromClass(aClass);
  if (!v26)
  {
    sub_6140();
    uint64_t v26 = (NSString *)sub_6120();
    swift_bridgeObjectRelease();
  }
  uint64_t v87 = PSFooterCellClassGroupKey;
  objc_msgSend(v25, "setProperty:forKey:", v26);

  uint64_t v86 = PSFooterHyperlinkViewTitleKey;
  objc_msgSend(v25, "setProperty:forKey:", v17);
  uint64_t v91 = PSFooterHyperlinkViewLinkRangeKey;
  objc_msgSend(v25, "setProperty:forKey:", v22);

  id v90 = self;
  id v27 = [v90 valueWithNonretainedObject:v1];
  uint64_t v89 = PSFooterHyperlinkViewTargetKey;
  objc_msgSend(v25, "setProperty:forKey:", v27);

  id v28 = NSStringFromSelector("openArticle");
  if (!v28)
  {
    sub_6140();
    id v28 = (NSString *)sub_6120();
    swift_bridgeObjectRelease();
  }
  uint64_t v88 = PSFooterHyperlinkViewActionKey;
  objc_msgSend(v25, "setProperty:forKey:", v28);

  NSString v29 = [v3 bloodOxygenRecordingsTitle];
  if (!v29)
  {
    sub_6140();
    NSString v29 = sub_6120();
    swift_bridgeObjectRelease();
  }
  id v30 = [v95 preferenceSpecifierNamed:v29 target:v1 set:"setWithRecordingsEnabledValue:specifier:" get:"recordingsEnabledValueWithSpecifier:" detail:0 cell:6 edit:0];

  if (!v30) {
    goto LABEL_68;
  }
  Class v31 = sub_61C0().super.super.isa;
  uint64_t v92 = PSAllowMultilineTitleKey;
  objc_msgSend(v30, "setProperty:forKey:", v31);

  Class v32 = sub_61C0().super.super.isa;
  uint64_t v93 = PSEnabledKey;
  objc_msgSend(v30, "setProperty:forKey:", v32);

  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
    id v80 = v25;
    id v81 = v30;
    swift_bridgeObjectRetain();
    uint64_t v82 = sub_6280();
    swift_bridgeObjectRelease();
    uint64_t v36 = v82 + 2;
    if (!__OFADD__(v82, 2))
    {
LABEL_21:
      sub_5CD4(v36);
      sub_6190();
      id v25 = v25;
      sub_6170();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) < *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_22;
      }
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v33 = *(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
    id v34 = v25;
    id v35 = v30;
    uint64_t v36 = v33 + 2;
    if (!__OFADD__(v33, 2)) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_66:
  sub_61A0();
LABEL_22:
  sub_61B0();
  sub_6190();
  id v37 = v30;
  sub_6170();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_61A0();
  }
  sub_61B0();
  sub_6190();

  if (v2 | (([v3 backgroundRecordingsEnabled] & 1) == 0)) {
    goto LABEL_61;
  }
  NSString v38 = sub_6120();
  id v39 = [v95 groupSpecifierWithID:v38];

  if (!v39) {
    goto LABEL_69;
  }
  id v83 = v25;
  NSString v84 = v17;
  NSString v40 = sub_6120();
  NSString v41 = (id)HKRPLocalizedString();

  if (!v41)
  {
    sub_6140();
    NSString v41 = sub_6120();
    swift_bridgeObjectRelease();
  }
  v42 = (NSString *)[v3 backgroundRecordingsDetailOptionsFooter];
  v43 = v42;
  NSString v44 = v42;
  if (!v42)
  {
    sub_6140();
    NSString v44 = sub_6120();
    swift_bridgeObjectRelease();
    sub_6140();
    v43 = (NSString *)sub_6120();
    swift_bridgeObjectRelease();
  }
  sub_6140();
  id v45 = objc_allocWithZone((Class)NSString);
  v46 = v42;
  NSString v47 = sub_6120();
  swift_bridgeObjectRelease();
  id v48 = [v45 initWithString:v47];

  id v49 = [v48 localizedStandardRangeOfString:v41];
  int64_t v51 = v50;

  NSString v52 = [v3 backgroundRecordingsDetailOptionsTitle];
  if (!v52)
  {
    sub_6140();
    NSString v52 = sub_6120();
    swift_bridgeObjectRelease();
  }
  [v39 setName:v52];

  if (v51 < 1)
  {

    [v39 setProperty:v43 forKey:PSFooterTextGroupKey];
  }
  else
  {

    v53 = NSStringFromClass(aClass);
    if (!v53)
    {
      sub_6140();
      v53 = (NSString *)sub_6120();
      swift_bridgeObjectRelease();
    }
    [v39 setProperty:v53 forKey:v87];

    [v39 setProperty:v44 forKey:v86];
    v97.location = (NSUInteger)v49;
    v97.length = v51;
    v54 = NSStringFromRange(v97);
    if (!v54)
    {
      sub_6140();
      v54 = (NSString *)sub_6120();
      swift_bridgeObjectRelease();
    }
    [v39 setProperty:v54 forKey:v91];

    id v55 = [v90 valueWithNonretainedObject:v1];
    [v39 setProperty:v55 forKey:v89];

    v43 = NSStringFromSelector("openPasscodeSettings");
    if (!v43)
    {
      sub_6140();
      v43 = (NSString *)sub_6120();
      swift_bridgeObjectRelease();
    }
    [v39 setProperty:v43 forKey:v88];
  }

  id v56 = v39;
  sub_6170();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_61A0();
  }
  sub_61B0();
  sub_6190();
  unsigned int v57 = [self isWristDetectEnabled];
  id v58 = [v3 backgroundRecordingsDetailSleepTitle];
  NSString v59 = v58;
  if (v57)
  {
    if (!v58)
    {
      sub_6140();
      NSString v59 = sub_6120();
      swift_bridgeObjectRelease();
    }
    id v60 = [v95 preferenceSpecifierNamed:v59 target:v1 set:"setWithDuringSleepEnabledValue:specifier:" get:"backgroundRecordingsDuringSleepValueWithSpecifier:" detail:0 cell:6 edit:0];

    if (v60)
    {
      sub_5FB8(0, &qword_CCF0);
      Class v61 = sub_6220(1).super.super.isa;
      [v60 setProperty:v61 forKey:v93];

      Class v62 = sub_61C0().super.super.isa;
      uint64_t v63 = v92;
      [v60 setProperty:v62 forKey:v92];

      id v64 = v60;
      sub_6170();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_61A0();
      }
      sub_61B0();
      sub_6190();
      NSString v65 = [v3 backgroundRecordingsDetailTheaterTitle];
      if (!v65)
      {
        sub_6140();
        NSString v65 = sub_6120();
        uint64_t v63 = v92;
        swift_bridgeObjectRelease();
      }
      id v66 = [v95 preferenceSpecifierNamed:v65 target:v1 set:"setWithDuringTheaterModeValue:specifier:" get:"backgroundRecordingsDuringTheaterModeWithSpecifier:" detail:0 cell:6 edit:0];

      if (v66)
      {
        Class v67 = sub_6220(1).super.super.isa;
        [v66 setProperty:v67 forKey:v93];

        Class v68 = sub_61C0().super.super.isa;
        [v66 setProperty:v68 forKey:v63];

        id v69 = v66;
LABEL_58:
        v77 = v69;
        sub_6170();
        if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
          sub_61A0();
        }
        sub_61B0();
        NSString v17 = v84;
        sub_6190();

        id v25 = v83;
LABEL_61:

        id v5 = v94;
        goto LABEL_62;
      }
      goto LABEL_71;
    }
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  sub_6140();

  NSString v70 = sub_6120();
  id v71 = [v95 preferenceSpecifierNamed:v70 target:v1 set:0 get:"backgroundRecordingDisabledTextWithSpecifier:" detail:0 cell:4 edit:0];

  if (!v71)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  sub_5FB8(0, &qword_CCF0);
  Class v72 = sub_6220(0).super.super.isa;
  [v71 setProperty:v72 forKey:v93];
  swift_bridgeObjectRelease();

  id v64 = v71;
  sub_6170();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_61A0();
  }
  sub_61B0();
  sub_6190();
  id v73 = [v3 backgroundRecordingsDetailTheaterTitle];
  sub_6140();

  NSString v74 = sub_6120();
  id v75 = [v95 preferenceSpecifierNamed:v74 target:v1 set:0 get:"backgroundRecordingDisabledTextWithSpecifier:" detail:0 cell:4 edit:0];

  if (v75)
  {
    Class v76 = sub_6220(0).super.super.isa;
    [v75 setProperty:v76 forKey:v93];
    swift_bridgeObjectRelease();

    id v69 = v75;
    goto LABEL_58;
  }
LABEL_73:
  __break(1u);
}

char *sub_4388(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_6280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  id v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  id v13 = &_swiftEmptyArrayStorage;
  result = sub_5BB0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_6240();
        sub_5FB8(0, &qword_CD00);
        swift_dynamicCast();
        id v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_5BB0(0, v3[2] + 1, 1);
          id v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_5BB0((char *)(v6 > 1), v7 + 1, 1);
          id v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_5F48(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_5FB8(0, &qword_CD00);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        id v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_5BB0(0, v3[2] + 1, 1);
          id v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_5BB0((char *)(v10 > 1), v11 + 1, 1);
          id v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_5F48(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

void sub_473C(void *a1, uint64_t a2, void *a3, void *a4)
{
}

Class sub_47FC(char *a1, uint64_t a2, void *a3, SEL *a4)
{
  unint64_t v6 = *(void **)&a1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings];
  id v7 = a3;
  uint64_t v8 = a1;
  [v6 *a4];
  v9.super.super.Class isa = sub_61C0().super.super.isa;

  return v9.super.super.isa;
}

uint64_t sub_49B0()
{
  sub_5AFC();
  __chkstk_darwin();
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_6090();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2444())
  {
    NSString v7 = sub_6120();
    id v8 = (id)HKRPLocalizedString();
  }
  else
  {
    id v8 = [*(id *)(v0 + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings) learnMoreAboutBloodOxygenURL];
  }
  sub_6140();

  sub_6080();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_5B54((uint64_t)v2);
  }
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  if (UIApp)
  {
    id v10 = UIApp;
    sub_6070(v11);
    id v13 = v12;
    [v10 openURL:v12 withCompletionHandler:0];

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_4C30(char a1)
{
  if (a1)
  {
    v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_isRegionSupported] = 1;
    [v1 reloadSpecifiers];
    uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController];
    if (v2)
    {
      id v3 = [v2 view];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = self;
        uint64_t v6 = swift_allocObject();
        *(void *)(v6 + 16) = v4;
        uint64_t v16 = sub_5AAC;
        uint64_t v17 = v6;
        NSString v12 = _NSConcreteStackBlock;
        uint64_t v13 = 1107296256;
        uint64_t v14 = sub_4E24;
        NSString v15 = &unk_85E0;
        NSString v7 = _Block_copy(&v12);
        id v8 = v4;
        swift_release();
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v1;
        uint64_t v16 = sub_5AD8;
        uint64_t v17 = v9;
        NSString v12 = _NSConcreteStackBlock;
        uint64_t v13 = 1107296256;
        uint64_t v14 = sub_4E68;
        NSString v15 = &unk_8630;
        id v10 = _Block_copy(&v12);
        unint64_t v11 = v1;
        swift_release();

        _Block_release(v10);
        _Block_release(v7);
      }
    }
  }
}

uint64_t sub_4E24(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_4E68(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_5050()
{
  uint64_t v1 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden;
  if (v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden] == 1)
  {
    id v2 = [v0 tabBarController];
    if (v2)
    {
      id v3 = v2;
      [v2 showBarWithTransition:3];

      v0[v1] = 0;
    }
  }
  uint64_t v4 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController;
  uint64_t v5 = *(void **)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController];
  if (v5)
  {
    [v5 willMoveToParentViewController:0];
    uint64_t v5 = *(void **)&v0[v4];
    if (v5)
    {
      id result = [v5 view];
      if (!result)
      {
        __break(1u);
        return result;
      }
      NSString v7 = result;
      [result removeFromSuperview];

      uint64_t v5 = *(void **)&v0[v4];
    }
  }
  [v5 removeFromParentViewController];
  id v8 = *(void **)&v0[v4];
  *(void *)&v0[v4] = 0;

  return [v0 reloadSpecifiers];
}

uint64_t type metadata accessor for SettingsViewController()
{
  return self;
}

void sub_53A4()
{
  id v1 = sub_2398();
  id ObjectType = 0;
  id v2 = [v1 onboardedCountryCodeSupportedStateWithError:&ObjectType];

  if (v2)
  {
    id v3 = ObjectType;
    switch((unint64_t)[v2 integerValue])
    {
      case 1uLL:
        sub_6200();
        if (qword_CB00 != -1) {
          goto LABEL_18;
        }
        goto LABEL_14;
      case 2uLL:

        char v12 = 1;
        goto LABEL_17;
      case 3uLL:
        goto LABEL_15;
      case 4uLL:
        sub_6200();
        if (qword_CB00 == -1) {
          goto LABEL_14;
        }
        goto LABEL_18;
      case 5uLL:
        sub_6200();
        if (qword_CB00 == -1) {
          goto LABEL_14;
        }
        goto LABEL_18;
      default:
        sub_61F0();
        if (qword_CB00 == -1) {
          goto LABEL_14;
        }
LABEL_18:
        swift_once();
LABEL_14:
        sub_5930();
        uint64_t v13 = swift_allocObject();
        *(_OWORD *)(v13 + 16) = xmmword_6E40;
        id ObjectType = (id)swift_getObjectType();
        sub_5998();
        uint64_t v14 = sub_6160();
        uint64_t v16 = v15;
        *(void *)(v13 + 56) = &type metadata for String;
        *(void *)(v13 + 64) = sub_59D0();
        *(void *)(v13 + 32) = v14;
        *(void *)(v13 + 40) = v16;
        sub_60F0();
        swift_bridgeObjectRelease();
LABEL_15:

        break;
    }
  }
  else
  {
    id v4 = ObjectType;
    sub_6060();

    swift_willThrow();
    sub_61F0();
    if (qword_CB00 != -1) {
      swift_once();
    }
    sub_5930();
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_6E30;
    id ObjectType = (id)swift_getObjectType();
    sub_5998();
    uint64_t v6 = sub_6160();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    unint64_t v9 = sub_59D0();
    *(void *)(v5 + 64) = v9;
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    id ObjectType = 0;
    unint64_t v18 = 0xE000000000000000;
    sub_5A24(0, &qword_CCE0);
    sub_6260();
    id v10 = ObjectType;
    unint64_t v11 = v18;
    *(void *)(v5 + 96) = &type metadata for String;
    *(void *)(v5 + 104) = v9;
    *(void *)(v5 + 72) = v10;
    *(void *)(v5 + 80) = v11;
    sub_60F0();
    swift_errorRelease();
    swift_bridgeObjectRelease();
  }
  char v12 = 0;
LABEL_17:
  *(unsigned char *)(v0 + OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_isRegionSupported) = v12;
}

void sub_5930()
{
  if (!qword_CCC0)
  {
    sub_5A24(255, &qword_CCC8);
    unint64_t v0 = sub_6290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_CCC0);
    }
  }
}

unint64_t sub_5998()
{
  unint64_t result = qword_CCD0;
  if (!qword_CCD0)
  {
    type metadata accessor for SettingsViewController();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_CCD0);
  }
  return result;
}

unint64_t sub_59D0()
{
  unint64_t result = qword_CCD8;
  if (!qword_CCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_CCD8);
  }
  return result;
}

uint64_t sub_5A24(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_5A74()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_5AAC()
{
  return [*(id *)(v0 + 16) setAlpha:0.0];
}

uint64_t sub_5AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_5AD0()
{
  return swift_release();
}

id sub_5AD8()
{
  return sub_5050();
}

void sub_5AFC()
{
  if (!qword_CCE8)
  {
    sub_6090();
    unint64_t v0 = sub_6230();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_CCE8);
    }
  }
}

uint64_t sub_5B54(uint64_t a1)
{
  sub_5AFC();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_5BB0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_5BD0(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
}

char *sub_5BD0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_5F58();
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_5CD4(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((char *)&dword_18 + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_6280();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_6250();
    *uint64_t v1 = result;
  }
  return result;
}

id sub_5D94()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController;
  *(void *)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_startingController] = 0;
  v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_tabBarHidden] = 0;
  *(void *)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___healthStore] = 0;
  *(void *)&v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController____lazy_storage___featureAvailabilityStore] = 0;
  v0[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_isRegionSupported] = 0;
  uint64_t v2 = self;
  unint64_t v3 = v0;
  id v4 = [v2 standardSettings];
  *(void *)&v3[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_settings] = v4;
  id v5 = [objc_allocWithZone((Class)HKRPOxygenSaturationOnboardingManager) init];
  *(void *)&v3[OBJC_IVAR____TtC24OxygenSaturationSettings22SettingsViewController_onboardingManager] = v5;
  unint64_t v6 = *(void **)&v0[v1];
  *(void *)&v0[v1] = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SettingsViewController();
  return objc_msgSendSuper2(&v8, "initWithNibName:bundle:", 0, 0);
}

uint64_t sub_5E94()
{
  uint64_t result = sub_61D0();
  __break(1u);
  __break(1u);
  return result;
}

_OWORD *sub_5F48(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_5F58()
{
  if (!qword_CD08)
  {
    unint64_t v0 = sub_6290();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_CD08);
    }
  }
}

uint64_t sub_5FB8(uint64_t a1, unint64_t *a2)
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

id sub_6000()
{
  _HKInitializeLogging();
  unint64_t v0 = (void *)HKLogRespiratory;
  qword_CE18 = HKLogRespiratory;

  return v0;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_6060()
{
  return _convertNSErrorToError(_:)();
}

void sub_6070(NSURL *retstr@<X8>)
{
}

uint64_t sub_6080()
{
  return URL.init(string:)();
}

uint64_t sub_6090()
{
  return type metadata accessor for URL();
}

uint64_t sub_60A0()
{
  return static Locale.current.getter();
}

uint64_t sub_60B0()
{
  return type metadata accessor for Locale();
}

void sub_60C0()
{
}

uint64_t sub_60D0()
{
  return type metadata accessor for ExternalDeepLink();
}

uint64_t sub_60E0()
{
  return type metadata accessor for BridgePreferencesHeaderView();
}

uint64_t sub_60F0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_6100()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_6110()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_6120()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6130()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_6140()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6150()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_6160()
{
  return String.init<A>(describing:)();
}

uint64_t sub_6170()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_6180()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_6190()
{
  return specialized Array._endMutation()();
}

uint64_t sub_61A0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_61B0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_61C0()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_61D0()
{
  return static Bool._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_61E0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_61F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_6200()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6210()
{
  return static OS_dispatch_queue.main.getter();
}

NSNumber sub_6220(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_6230()
{
  return type metadata accessor for Optional();
}

uint64_t sub_6240()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_6250()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_6260()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_6270()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_6280()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_6290()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_62A0()
{
  return Error.localizedDescription.getter();
}

uint64_t HKRPLocalizedString()
{
  return _HKRPLocalizedString();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}