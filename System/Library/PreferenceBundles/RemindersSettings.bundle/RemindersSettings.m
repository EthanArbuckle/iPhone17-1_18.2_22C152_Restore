id sub_55F4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v2 = *(void *)(a1 + 32);
  v3 = +[REMUserDefaults daemonUserDefaults];
  [v3 setPreferredDefaultListID:v2];

  v4 = *(void **)(a1 + 40);

  return [v4 reloadSpecifiers];
}

id REMSettingsBundleGet()
{
  if (qword_21F98[0] != -1) {
    dispatch_once(qword_21F98, &stru_1CCD8);
  }
  v0 = (void *)qword_21F90;

  return v0;
}

void sub_62CC(id a1)
{
  qword_21F90 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_68E0(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 defaultListSpecifier];
  [v1 reloadSpecifier:v2];
}

id sub_6938(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setUnsavedTodayNotificationFireTime:a2];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 todayNotificationEnabledSwitch];
  [v3 reloadSpecifier:v4];

  v5 = *(void **)(a1 + 32);

  return [v5 reloadTodayNotificationSpecifiers:0];
}

void sub_69A8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 includeRemindersDueTodayInBadgeCount];
  [v1 reloadSpecifier:v2];
}

void sub_6A00(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 showAsOverdue];
  [v1 reloadSpecifier:v2];
}

void sub_6A58(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 disableAssignmentNotifications];
  [v1 reloadSpecifier:v2];
}

void sub_6AB0(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 enableAutoCompleteReminders];
  [v1 reloadSpecifier:v2];
}

id sub_8004(uint64_t a1)
{
  [*(id *)(a1 + 32) setUnsavedTodayNotificationFireTime:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadTodayNotificationSpecifiers:1];
}

void sub_8A74(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) daemonUserDefaults];
  [v2 setEnableAssignmentNotifications:v1];
}

id sub_8CCC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) performClearAction];
}

void sub_8D24(id a1, NSError *a2)
{
  id v2 = a2;
  v3 = +[REMLog utility];
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_13D30((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Successfully clear local categorization.", v5, 2u);
  }
}

void sub_8FF4(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) daemonUserDefaults];
  [v2 setShowRemindersAsOverdue:v1];
}

void sub_927C(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) daemonUserDefaults];
  [v2 setEnableAutoCompleteReminders:v1];
}

void sub_954C(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) daemonUserDefaults];
  [v2 setShouldIncludeRemindersDueTodayInBadgeCount:v1];
}

BOOL sub_9728(id a1, REMAccount *a2, id a3)
{
  v3 = [(REMAccount *)a2 capabilities];
  unsigned __int8 v4 = [v3 supportsGroceriesList];

  return v4;
}

uint64_t sub_9E40()
{
  uint64_t v0 = sub_13FD0();
  sub_D7A4(v0, qword_21C28);
  sub_D76C(v0, (uint64_t)qword_21C28);
  id v1 = [self utility];
  return sub_13FE0();
}

uint64_t sub_9F88()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_D808(&qword_21CD8);
  ((void (*)(void))__chkstk_darwin)();
  v49 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_13EC0();
  uint64_t v48 = *(void *)(v53 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v44 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_13E70();
  uint64_t v5 = *(void *)(v47 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (objc_class **)((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_13F10();
  ((void (*)(void))__chkstk_darwin)();
  sub_141F0();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v52 = sub_13E80();
  uint64_t v50 = *(void *)(v52 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v54 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v55 = (char *)&v43 - v11;
  __chkstk_darwin(v10);
  v13 = (char *)&v43 - v12;
  v58.receiver = v0;
  v58.super_class = ObjectType;
  objc_msgSendSuper2(&v58, "viewDidLoad");
  v14 = (objc_class *)REMSettingsBundleGet();
  v42._countAndFlagsBits = 0x800000000001A4E0;
  v59._countAndFlagsBits = 0x676E614C20646441;
  v59._object = (void *)0xEC00000065676175;
  v62.value._countAndFlagsBits = 0;
  v62.value._object = 0;
  v15.super.isa = v14;
  v63._countAndFlagsBits = 0;
  v63._object = (void *)0xE000000000000000;
  sub_13E50(v59, v62, v15, v63, v42);

  v45 = v1;
  id v16 = [v1 navigationItem];
  NSString v17 = sub_14200();
  swift_bridgeObjectRelease();
  [v16 setTitle:v17];

  uint64_t v56 = sub_14230();
  uint64_t v57 = v18;
  v60._countAndFlagsBits = 47;
  v60._object = (void *)0xE100000000000000;
  sub_14260(v60);
  v61._countAndFlagsBits = sub_14230();
  sub_14260(v61);
  swift_bridgeObjectRelease();
  uint64_t v46 = v56;
  sub_141E0();
  sub_13F00();
  v19 = ObjectType;
  *v7 = ObjectType;
  uint64_t v20 = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
  v21 = *(void (**)(objc_class **, uint64_t, uint64_t))(v5 + 104);
  uint64_t v22 = v47;
  v21(v7, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v47);
  v51 = v13;
  sub_13E90();
  sub_141E0();
  sub_13F00();
  *v7 = v19;
  v21(v7, v20, v22);
  sub_13E90();
  sub_141E0();
  sub_13F00();
  *v7 = v19;
  uint64_t v23 = v53;
  v21(v7, v20, v22);
  uint64_t v24 = v48;
  sub_13E90();
  v25 = v49;
  sub_13EB0();
  uint64_t v26 = (uint64_t)v25;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v25, 1, v23) == 1)
  {
    v27 = *(void (**)(char *, uint64_t))(v50 + 8);
    uint64_t v28 = v52;
    v27(v54, v52);
    v27(v55, v28);
    v27(v51, v28);
    return sub_E078(v26, &qword_21CD8);
  }
  else
  {
    v30 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v44, v26, v23);
    v49 = (char *)sub_14230();
    uint64_t v47 = v31;
    sub_D808(&qword_21D10);
    uint64_t v32 = v50;
    uint64_t v33 = *(void *)(v50 + 72);
    unint64_t v34 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_16B40;
    unint64_t v36 = v35 + v34;
    v37 = *(void (**)(unint64_t, char *, uint64_t))(v32 + 16);
    uint64_t v38 = v52;
    v37(v36, v55, v52);
    v39 = v54;
    v37(v36 + v33, v54, v38);
    v40 = v51;
    sub_14360();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v30, v53);
    v41 = *(void (**)(char *, uint64_t))(v32 + 8);
    v41(v39, v38);
    v41(v55, v38);
    return ((uint64_t (*)(char *, uint64_t))v41)(v40, v38);
  }
}

uint64_t sub_A720()
{
  id v1 = v0;
  uint64_t v2 = sub_D808(&qword_21CD8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_13EC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v9 = sub_14200();
  id v10 = [v0 valueForKey:v9];

  if (v10)
  {
    sub_143C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v101, 0, sizeof(v101));
  }
  sub_DFD8((uint64_t)v101, (uint64_t)&v102, &qword_21CE0);
  v99 = v1;
  if (!v104)
  {
    v94 = v8;
    v95 = v4;
    uint64_t v96 = v6;
    uint64_t v97 = v5;
    sub_E078((uint64_t)&v102, &qword_21CE0);
    goto LABEL_9;
  }
  sub_D808(&qword_21D00);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v94 = v8;
    v95 = v4;
    uint64_t v96 = v6;
    uint64_t v97 = v5;
LABEL_9:
    *(void *)&v101[0] = &_swiftEmptyArrayStorage;
    uint64_t v12 = (objc_class *)REMSettingsBundleGet();
    v105._countAndFlagsBits = 0xD000000000000016;
    v90._countAndFlagsBits = 0x8000000000019F40;
    v105._object = (void *)0x8000000000019F20;
    v110.value._countAndFlagsBits = 0;
    v110.value._object = 0;
    v13.super.Class isa = v12;
    v114._countAndFlagsBits = 0;
    v114._object = (void *)0xE000000000000000;
    id v98 = (id)sub_13E50(v105, v110, v13, v114, v90);

    char v14 = [self authorizationStatusForBundleIdentifier:REMAppBundleIdentifier]- 3 < 2;
    uint64_t v15 = sub_DCA0(v14);
    uint64_t v17 = v16;
    uint64_t v18 = (objc_class *)REMSettingsBundleGet();
    v106._countAndFlagsBits = 0xD000000000000013;
    v91._countAndFlagsBits = 0x8000000000019F80;
    v106._object = (void *)0x8000000000019F60;
    v111.value._countAndFlagsBits = 0;
    v111.value._object = 0;
    v19.super.Class isa = v18;
    v115._countAndFlagsBits = 0x6DA0C26E7261654CLL;
    v115._object = (void *)0xAE00A680E265726FLL;
    sub_13E50(v106, v111, v19, v115, v91);

    NSString v20 = sub_14200();
    NSString v21 = sub_14200();
    id v22 = [v20 rangeOfString:v21];
    uint64_t v24 = v23;

    if (v22 != (id)sub_13E40())
    {
      NSString v25 = sub_14200();
      swift_bridgeObjectRelease();
      NSString v26 = sub_14200();
      id v27 = objc_msgSend(v25, "stringByReplacingCharactersInRange:withString:", v22, v24, v26);

      uint64_t v15 = sub_14230();
      uint64_t v17 = v28;
    }
    v29 = v99;
    NSUInteger v30 = sub_14280();
    swift_bridgeObjectRelease();
    uint64_t v31 = self;
    NSString v32 = sub_14200();
    swift_bridgeObjectRelease();
    id v33 = [v31 groupSpecifierWithName:v32];

    if (v33)
    {
      sub_D808(&qword_21CF0);
      uint64_t inited = swift_initStackObject();
      id v98 = v22;
      uint64_t v35 = (void *)inited;
      *(_OWORD *)(inited + 16) = xmmword_16B50;
      uint64_t v102 = sub_14230();
      uint64_t v103 = v36;
      sub_14410();
      sub_E03C(0, &qword_21CF8);
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      uint64_t v38 = NSStringFromClass(ObjCClassFromMetadata);
      uint64_t v39 = sub_14230();
      uint64_t v41 = v40;

      v35[12] = &type metadata for String;
      v35[9] = v39;
      v35[10] = v41;
      uint64_t v102 = sub_14230();
      uint64_t v103 = v42;
      sub_14410();
      v35[21] = &type metadata for String;
      v35[18] = v15;
      v35[19] = v17;
      uint64_t v102 = sub_14230();
      uint64_t v103 = v43;
      sub_14410();
      v107.location = (NSUInteger)v98;
      v107.length = v30;
      v44 = NSStringFromRange(v107);
      uint64_t v45 = sub_14230();
      uint64_t v47 = v46;

      v35[30] = &type metadata for String;
      v35[27] = v45;
      v35[28] = v47;
      sub_11F6C((uint64_t)v35);
      Class isa = sub_141B0().super.isa;
      swift_bridgeObjectRelease();
      [v33 setProperties:isa];

      uint64_t v49 = (uint64_t)v95;
      sub_13EB0();
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v96 + 48))(v49, 1, v97) == 1)
      {
        sub_E078(v49, &qword_21CD8);
      }
      else
      {
        uint64_t v52 = v94;
        (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v94, v49, v50);
        sub_13EA0(v53);
        v55 = v54;
        [v33 setProperty:v54 forKey:PSFooterHyperlinkViewURLKey];

        (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v50);
      }
      id v56 = v33;
      sub_14290();
      v29 = v99;
      if (*(void *)((char *)&dword_10 + (*(void *)&v101[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)&v101[0] & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_142D0();
      }
      sub_142E0();
      sub_142C0();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v57 = (objc_class *)REMSettingsBundleGet();
    v92._countAndFlagsBits = 0x800000000001A070;
    v108._object = (void *)0x800000000001A050;
    v108._countAndFlagsBits = 0xD000000000000011;
    v112.value._countAndFlagsBits = 0;
    v112.value._object = 0;
    v58.super.Class isa = v57;
    v116._countAndFlagsBits = 0;
    v116._object = (void *)0xE000000000000000;
    sub_13E50(v108, v112, v58, v116, v92);

    NSString v59 = sub_14200();
    swift_bridgeObjectRelease();
    Swift::String v60 = NSStringFromSelector("automaticSecondaryGroceryLocale");
    if (!v60)
    {
      sub_14230();
      Swift::String v60 = (NSString *)sub_14200();
      swift_bridgeObjectRelease();
    }
    Swift::String v61 = self;
    id v62 = [v61 standardPreferenceSpecifierNamed:v59 target:v29 cell:6 detail:0 keyName:v60 defaultValue:0 scope:0 set:"setAutomaticSecondaryGroceryLocale:" get:"automaticSecondaryGroceryLocale"];

    id v63 = v62;
    sub_14290();
    if (*(void *)((char *)&dword_10 + (*(void *)&v101[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)&v101[0] & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_142D0();
    }
    id v98 = v63;
    sub_142E0();
    sub_142C0();
    v64 = (objc_class *)REMSettingsBundleGet();
    v93._countAndFlagsBits = 0x800000000001A0C0;
    v109._countAndFlagsBits = 0x65676175676E614CLL;
    v109._object = (void *)0xE900000000000073;
    v113.value._countAndFlagsBits = 0;
    v113.value._object = 0;
    v65.super.Class isa = v64;
    v117._countAndFlagsBits = 0;
    v117._object = (void *)0xE000000000000000;
    sub_13E50(v109, v113, v65, v117, v93);

    type metadata accessor for TTRIGroceryLanguagesController();
    NSString v66 = sub_14200();
    v67 = NSStringFromSelector("secondaryGroceryLanguageDisplayName");
    if (!v67)
    {
      sub_14230();
      v67 = (NSString *)sub_14200();
      swift_bridgeObjectRelease();
    }
    uint64_t v68 = swift_getObjCClassFromMetadata();
    v69 = v99;
    id v70 = [v61 standardPreferenceSpecifierNamed:v66 target:v99 cell:2 detail:v68 keyName:v67 defaultValue:0 scope:0 set:0 get:"secondaryGroceryLanguageDisplayName"];

    uint64_t v71 = OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier;
    v72 = *(void **)&v69[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier];
    *(void *)&v69[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier] = v70;
    id v73 = v70;

    v74 = *(void **)&v69[v71];
    if (v74)
    {
      v75 = (void *)REMSettingsGroceryLanguageListIdentifier;
      id v76 = v74;
      id v77 = v75;
      [v76 setIdentifier:v77];

      v69 = v99;
    }

    NSString v78 = sub_14200();
    swift_bridgeObjectRelease();
    v79 = NSStringFromSelector("secondaryGroceryLanguageDisplayName");
    if (!v79)
    {
      sub_14230();
      v79 = (NSString *)sub_14200();
      swift_bridgeObjectRelease();
    }
    id v80 = [v61 standardPreferenceSpecifierNamed:v78 target:v69 cell:4 detail:0 keyName:v79 defaultValue:0 scope:0 set:0 get:"secondaryGroceryLanguageDisplayName"];

    uint64_t v81 = OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_fixLanguageSpecifier;
    v82 = *(void **)&v69[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_fixLanguageSpecifier];
    *(void *)&v69[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_fixLanguageSpecifier] = v80;

    v83 = sub_B2FC(1);
    v84 = v83;
    if (v83 && ([v83 isAutomatic] & 1) == 0)
    {
      v85 = *(void **)&v69[v71];
      if (!v85)
      {
LABEL_37:
        sub_E03C(0, &qword_21CE8);
        swift_bridgeObjectRetain();
        Class v87 = sub_142A0().super.isa;
        swift_bridgeObjectRelease();
        NSString v88 = sub_14200();
        [v69 setValue:v87 forKey:v88];

        uint64_t v11 = sub_B570(*(unint64_t *)&v101[0]);
        swift_bridgeObjectRelease();

        return v11;
      }
    }
    else
    {
      v85 = *(void **)&v69[v81];
      if (!v85) {
        goto LABEL_37;
      }
    }
    id v86 = v85;
    sub_14290();
    if (*(void *)((char *)&dword_10 + (*(void *)&v101[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)&v101[0] & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_142D0();
    }
    sub_142E0();
    sub_142C0();

    goto LABEL_37;
  }
  return v100;
}

void *sub_B2FC(char a1)
{
  uint64_t v2 = v1;
  if ((a1 & 1) != 0
    && (*(unsigned char *)(v1
                 + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_hasSecondaryGroceryLocaleCache) & 1) != 0)
  {
    uint64_t v3 = *(void **)(v1
                  + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale);
    id v4 = v3;
  }
  else
  {
    sub_13F30();
    id v5 = *(id *)(v1 + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_store);
    uint64_t v3 = (void *)sub_13F20();

    *(unsigned char *)(v2 + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_hasSecondaryGroceryLocaleCache) = 1;
    uint64_t v6 = *(void **)(v2
                  + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale);
    *(void *)(v2 + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale) = v3;
    id v7 = v3;
  }
  return v3;
}

uint64_t sub_B570(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_144C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  NSBundle v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_DA48(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_14440();
        sub_E03C(0, &qword_21CE8);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_DA48(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_DA48(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_E0D4(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_E03C(0, &qword_21CE8);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_DA48(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_DA48(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_E0D4(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_B844()
{
  v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_hasSecondaryGroceryLocaleCache] = 0;
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale];
  *(void *)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale] = 0;

  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier];
  if (v2)
  {
    id v8 = v2;
    id v3 = objc_msgSend(v0, "cachedCellForSpecifier:");
    if (v3)
    {
      id v4 = v3;
      id v5 = [v3 detailTextLabel];
      if (v5)
      {
        unint64_t v6 = v5;
        sub_13F50();
        NSString v7 = sub_14200();
        swift_bridgeObjectRelease();
        [v6 setText:v7];
      }
    }
  }
}

uint64_t sub_B950()
{
  uint64_t v0 = sub_D808(&qword_21CA8);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  id v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  id v5 = (char *)&v13 - v4;
  unint64_t v6 = sub_B2FC(1);
  if (v6)
  {
    NSString v7 = v6;
    id v8 = [v6 locale];

    if (v8)
    {
      sub_13EF0();

      uint64_t v9 = sub_13F10();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 0, 1, v9);
    }
    else
    {
      uint64_t v9 = sub_13F10();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 1, 1, v9);
    }
    sub_DFD8((uint64_t)v3, (uint64_t)v5, &qword_21CA8);
    sub_13F10();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
    {
      sub_13EE0();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
      sub_13F90();
      sub_13F40();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    sub_E078((uint64_t)v5, &qword_21CA8);
  }
  sub_13F90();
  sub_13F70();
LABEL_9:
  uint64_t v11 = sub_13F50();
  swift_release();
  return v11;
}

uint64_t sub_BC94(void *a1)
{
  uint64_t v3 = sub_D808(&qword_21CA0);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_D808(&qword_21CA8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t v12 = sub_13F10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  unsigned __int8 v19 = [a1 BOOLValue];
  NSString v20 = 0;
  if ((v19 & 1) == 0)
  {
    NSString v21 = sub_B2FC(1);
    if (!v21)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
LABEL_8:
      sub_E078((uint64_t)v11, &qword_21CA8);
      NSString v20 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_12;
    }
    id v22 = v21;
    id v23 = [v21 locale];

    if (v23)
    {
      sub_13EF0();

      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v9, 1, 1, v12);
    }
    sub_DFD8((uint64_t)v9, (uint64_t)v11, &qword_21CA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1) {
      goto LABEL_8;
    }
    NSString v32 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v32(v18, v11, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    NSString v20 = (char *)sub_D504(0, 1, 1, (unint64_t)&_swiftEmptyArrayStorage);
    unint64_t v25 = *((void *)v20 + 2);
    unint64_t v24 = *((void *)v20 + 3);
    if (v25 >= v24 >> 1) {
      NSString v20 = (char *)sub_D504(v24 > 1, v25 + 1, 1, (unint64_t)v20);
    }
    *((void *)v20 + 2) = v25 + 1;
    v32(&v20[((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v25], v16, v12);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  }
LABEL_12:
  uint64_t v26 = sub_14330();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v5, 1, 1, v26);
  sub_14310();
  id v27 = v1;
  uint64_t v28 = sub_14300();
  v29 = (void *)swift_allocObject();
  v29[2] = v28;
  v29[3] = &protocol witness table for MainActor;
  v29[4] = v27;
  v29[5] = v20;
  sub_CC44((uint64_t)v5, (uint64_t)&unk_21CB8, (uint64_t)v29);
  return swift_release();
}

uint64_t sub_C0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  sub_14310();
  v5[9] = sub_14300();
  uint64_t v7 = sub_142F0();
  v5[10] = v7;
  v5[11] = v6;
  return _swift_task_switch(sub_C14C, v7, v6);
}

uint64_t sub_C14C()
{
  uint64_t v1 = *(void **)(v0[7] + OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_store);
  v0[12] = v1;
  v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[13] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_C208;
  uint64_t v3 = v0[8];
  return REMStore.setOverridingGroceryCategorizationSecondaryGroceryLocales(_:)(v3);
}

uint64_t sub_C208()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[10];
    uint64_t v4 = v2[11];
    uint64_t v5 = sub_C3A8;
  }
  else
  {
    uint64_t v6 = (void *)v2[12];
    swift_bridgeObjectRelease();

    uint64_t v3 = v2[10];
    uint64_t v4 = v2[11];
    uint64_t v5 = sub_C338;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_C338()
{
  swift_release();
  sub_C5E8();
  sub_C5E8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_C3A8()
{
  uint64_t v11 = v0;
  uint64_t v1 = (void *)v0[12];
  swift_release();

  if (qword_21C20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_13FD0();
  sub_D76C(v2, (uint64_t)qword_21C28);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_13FC0();
  os_log_type_t v4 = sub_14340();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getErrorValue();
    uint64_t v6 = sub_14510();
    v0[6] = sub_131A8(v6, v7, &v10);
    sub_143A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "TTRIGroceryAddLanguageController.setAutomaticSecondaryGroceryLocale: Failed to set overriding secondary grocery locale {error: %s}", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_C5E8();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

void sub_C5E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_D808(&qword_21CA8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v39 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = *(void **)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier];
  if (v14)
  {
    uint64_t v15 = *(void **)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_fixLanguageSpecifier];
    if (v15)
    {
      id v16 = v14;
      id v40 = v15;
      uint64_t v17 = sub_B2FC(0);
      if (v17)
      {
        uint64_t v18 = v17;
        if ([v17 isAutomatic])
        {
          if (([v1 containsSpecifier:v40] & 1) == 0)
          {
            [v1 insertSpecifier:v40 afterSpecifier:v16];
            id v19 = [v1 cachedCellForSpecifier:v40];
            if (v19)
            {
              NSString v20 = v19;
              id v21 = [v18 locale];
              if (v21)
              {
                id v22 = v21;
                sub_13EF0();

                uint64_t v23 = sub_13F10();
                (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 0, 1, v23);
              }
              else
              {
                uint64_t v23 = sub_13F10();
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 1, 1, v23);
              }
              sub_DFD8((uint64_t)v5, (uint64_t)v8, &qword_21CA8);
              sub_13F10();
              uint64_t v30 = *(void *)(v23 - 8);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v8, 1, v23) == 1)
              {
                sub_E078((uint64_t)v8, &qword_21CA8);
              }
              else
              {
                sub_13EE0();
                (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v23);
              }
              sub_13F90();
              sub_13F40();
              swift_bridgeObjectRelease();
              id v31 = [v20 detailTextLabel];
              if (v31)
              {
                NSString v32 = v31;
                sub_13F50();
                NSString v33 = sub_14200();
                swift_bridgeObjectRelease();
                [v32 setText:v33];
              }
              swift_release();
            }
          }
          if ([v1 containsSpecifier:v16])
          {
            [v1 removeSpecifier:v16];

            return;
          }
        }
        else
        {
          if (([v1 containsSpecifier:v16] & 1) == 0)
          {
            [v1 insertSpecifier:v16 afterSpecifier:v40];
            id v25 = [v1 cachedCellForSpecifier:v16];
            if (v25)
            {
              uint64_t v26 = v25;
              id v27 = [v18 locale];
              if (v27)
              {
                uint64_t v28 = v27;
                sub_13EF0();

                uint64_t v29 = sub_13F10();
                (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v11, 0, 1, v29);
              }
              else
              {
                uint64_t v29 = sub_13F10();
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v11, 1, 1, v29);
              }
              sub_DFD8((uint64_t)v11, (uint64_t)v13, &qword_21CA8);
              sub_13F10();
              uint64_t v34 = *(void *)(v29 - 8);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v13, 1, v29) == 1)
              {
                sub_E078((uint64_t)v13, &qword_21CA8);
              }
              else
              {
                sub_13EE0();
                (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v29);
              }
              sub_13F90();
              sub_13F40();
              swift_bridgeObjectRelease();
              id v35 = [v26 detailTextLabel];
              if (v35)
              {
                uint64_t v36 = v35;
                sub_13F50();
                NSString v37 = sub_14200();
                swift_bridgeObjectRelease();
                [v36 setText:v37];
              }
              swift_release();
            }
          }
          if ([v1 containsSpecifier:v40])
          {
            id v38 = v40;
            [v1 removeSpecifier:v38];

LABEL_35:
            return;
          }
        }

        goto LABEL_35;
      }

      id v24 = v40;
    }
  }
}

uint64_t sub_CC44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_14330();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_14320();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_E078(a1, &qword_21CA0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_142F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_CE58()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRIGroceryAddLanguageController()
{
  return self;
}

uint64_t sub_CF20(uint64_t a1, uint64_t a2)
{
  return sub_D08C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_CF38(uint64_t a1, id *a2)
{
  uint64_t result = sub_14210();
  *a2 = 0;
  return result;
}

uint64_t sub_CFB0(uint64_t a1, id *a2)
{
  char v3 = sub_14220();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_D030@<X0>(void *a1@<X8>)
{
  sub_14230();
  NSString v2 = sub_14200();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_D074(uint64_t a1, uint64_t a2)
{
  return sub_D08C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_D08C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_14230();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_D0D0()
{
  sub_14230();
  sub_14250();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_D124()
{
  sub_14230();
  sub_14520();
  sub_14250();
  Swift::Int v0 = sub_14530();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_D198()
{
  uint64_t v0 = sub_14230();
  uint64_t v2 = v1;
  if (v0 == sub_14230() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_14500();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_D224@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_14200();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_D26C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_14230();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_D298(uint64_t a1)
{
  uint64_t v2 = sub_E1D8(&qword_21D38);
  uint64_t v3 = sub_E1D8(&qword_21D40);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_D330(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_D40C;
  return v6(a1);
}

uint64_t sub_D40C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_D504(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_D808(&qword_21CC0);
  uint64_t v10 = *(void *)(sub_13F10() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_144A0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_13F10() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_DD8C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_D76C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_D7A4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_D808(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_D84C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_D894(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_D954;
  return sub_C0B4(a1, v4, v5, v7, v6);
}

uint64_t sub_D954()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_DA48(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_DA68(a1, a2, a3, *v3);
  NSObject *v3 = (char *)result;
  return result;
}

uint64_t sub_DA68(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    sub_D808(&qword_21D08);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_144E0();
  __break(1u);
  return result;
}

id sub_DBD8()
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_bridgeObjectRelease();
  *(void *)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_languageListSpecifier] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_fixLanguageSpecifier] = 0;
  v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_hasSecondaryGroceryLocaleCache] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_cachedSecondaryGroceryLocale] = 0;
  id v2 = objc_allocWithZone((Class)REMStore);
  uint64_t v3 = v0;
  id v4 = [v2 init];
  *(void *)&v3[OBJC_IVAR____TtC17RemindersSettings32TTRIGroceryAddLanguageController_store] = v4;

  v6.receiver = v3;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "initWithNibName:bundle:", 0, 0);
}

uint64_t sub_DCA0(char a1)
{
  id v2 = (objc_class *)REMSettingsBundleGet();
  if (a1)
  {
    v3._countAndFlagsBits = 0xD000000000000108;
    v7._countAndFlagsBits = 0x800000000001A400;
    v3._object = (void *)0x800000000001A2F0;
  }
  else
  {
    v3._countAndFlagsBits = 0xD0000000000000EDLL;
    v7._countAndFlagsBits = 0x800000000001A240;
    v3._object = (void *)0x800000000001A150;
  }
  v8.value._countAndFlagsBits = 0;
  v8.value._object = 0;
  v4.super.Class isa = v2;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  uint64_t v5 = sub_13E50(v3, v8, v4, v9, v7);

  return v5;
}

uint64_t sub_DD8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_13F10() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_144E0();
  __break(1u);
  return result;
}

uint64_t sub_DEE8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DF20(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_D954;
  objc_super v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_21CC8 + dword_21CC8);
  return v6(a1, v4);
}

uint64_t sub_DFD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_D808(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_E03C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_E078(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_D808(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_E0D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key()
{
  if (!qword_21D18)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_21D18);
    }
  }
}

uint64_t sub_E13C()
{
  return sub_E1D8(&qword_21D20);
}

uint64_t sub_E170()
{
  return sub_E1D8(&qword_21D28);
}

uint64_t sub_E1A4()
{
  return sub_E1D8(&qword_21D30);
}

uint64_t sub_E1D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_E21C()
{
  uint64_t v0 = sub_13FD0();
  sub_D7A4(v0, qword_21D48);
  sub_D76C(v0, (uint64_t)qword_21D48);
  id v1 = [self utility];
  return sub_13FE0();
}

id sub_E330()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_D808(&qword_21CD8);
  __chkstk_darwin(v2 - 8);
  id v77 = (char *)v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_13EC0();
  uint64_t v75 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  v79 = (char *)v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_13E70();
  uint64_t v5 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  Swift::String v7 = (void *)((char *)v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_13F10();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_141F0();
  __chkstk_darwin(v9 - 8);
  uint64_t v78 = sub_13E80();
  uint64_t v82 = *(void *)(v78 - 8);
  uint64_t v10 = __chkstk_darwin(v78);
  v85 = (char *)v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  v84 = (char *)v73 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v83 = (char *)v73 - v15;
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)v73 - v16;
  v89.receiver = v0;
  v89.super_class = ObjectType;
  objc_msgSendSuper2(&v89, "viewDidLoad");
  unint64_t v18 = (objc_class *)REMSettingsBundleGet();
  v72._countAndFlagsBits = 0x800000000001A5D0;
  v90._countAndFlagsBits = 0x65676175676E614CLL;
  v90._object = (void *)0xE900000000000073;
  v95.value._countAndFlagsBits = 0;
  v95.value._object = 0;
  v19.super.Class isa = v18;
  v96._countAndFlagsBits = 0;
  v96._object = (void *)0xE000000000000000;
  sub_13E50(v90, v95, v19, v96, v72);

  id v80 = v0;
  id v20 = [v0 navigationItem];
  NSString v21 = sub_14200();
  swift_bridgeObjectRelease();
  [v20 setTitle:v21];

  uint64_t v86 = sub_14230();
  uint64_t v87 = v22;
  v91._countAndFlagsBits = 47;
  v91._object = (void *)0xE100000000000000;
  sub_14260(v91);
  v92._countAndFlagsBits = sub_14230();
  sub_14260(v92);
  swift_bridgeObjectRelease();
  v93._countAndFlagsBits = 47;
  v93._object = (void *)0xE100000000000000;
  sub_14260(v93);
  v94._countAndFlagsBits = sub_14230();
  sub_14260(v94);
  swift_bridgeObjectRelease();
  v73[2] = v86;
  sub_141E0();
  sub_13F00();
  uint64_t v23 = ObjectType;
  *Swift::String v7 = ObjectType;
  uint64_t v24 = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
  id v25 = *(void (**)(void *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v26 = v74;
  v25(v7, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v74);
  id v76 = v17;
  sub_13E90();
  sub_141E0();
  sub_13F00();
  uint64_t v27 = type metadata accessor for TTRIGroceryAddLanguageController();
  *Swift::String v7 = v27;
  v25(v7, v24, v26);
  sub_13E90();
  sub_141E0();
  sub_13F00();
  *Swift::String v7 = v23;
  v25(v7, v24, v26);
  sub_13E90();
  sub_141E0();
  sub_13F00();
  *Swift::String v7 = v23;
  v25(v7, v24, v26);
  sub_13E90();
  uint64_t v28 = (uint64_t)v77;
  sub_13EB0();
  swift_bridgeObjectRelease();
  uint64_t v29 = v75;
  uint64_t v30 = v81;
  int v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v75 + 48))(v28, 1);
  v73[1] = v27;
  if (v31 == 1)
  {
    NSString v32 = v83;
    sub_E078(v28, &qword_21CD8);
    NSString v33 = v80;
    uint64_t v34 = v78;
    id v35 = v84;
    uint64_t v36 = v76;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 32))(v79, v28, v30);
    id v77 = (char *)sub_14230();
    sub_D808(&qword_21D10);
    uint64_t v37 = v82;
    uint64_t v38 = *(void *)(v82 + 72);
    unint64_t v39 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
    uint64_t v40 = 2 * v38;
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_16B50;
    unint64_t v42 = v41 + v39;
    uint64_t v43 = *(void (**)(unint64_t))(v37 + 16);
    NSString v32 = v83;
    uint64_t v44 = v78;
    v43(v42);
    uint64_t v45 = v42 + v38;
    uint64_t v46 = v84;
    ((void (*)(uint64_t, char *, uint64_t))v43)(v45, v84, v44);
    ((void (*)(unint64_t, char *, uint64_t))v43)(v42 + v40, v85, v44);
    uint64_t v36 = v76;
    uint64_t v48 = v79;
    uint64_t v47 = v80;
    sub_14360();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v48, v81);
    NSString v33 = v47;
    uint64_t v34 = v44;
    id v35 = v46;
  }
  id v49 = [v33 parentController];
  uint64_t v50 = v32;
  uint64_t v51 = v82;
  if (!v49) {
    goto LABEL_13;
  }
  uint64_t v52 = v49;
  uint64_t v53 = swift_dynamicCastClass();
  if (!v53)
  {
LABEL_12:

LABEL_13:
    uint64_t v71 = *(void (**)(char *, uint64_t))(v51 + 8);
    v71(v85, v34);
    v71(v35, v34);
    v71(v50, v34);
    return (id)((uint64_t (*)(char *, uint64_t))v71)(v36, v34);
  }
  uint64_t v54 = v53;
  id v55 = v52;
  uint64_t v86 = sub_ED7C();
  uint64_t v87 = 0;
  uint64_t v88 = v54;
  id v56 = objc_allocWithZone((Class)sub_D808(&qword_21D88));
  uint64_t v52 = (void *)sub_14050();
  id v57 = [v52 view];
  if (!v57)
  {
LABEL_11:

    goto LABEL_12;
  }
  NSBundle v58 = v57;
  id result = [v33 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  Swift::String v60 = result;
  id result = [v52 view];
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  Swift::String v61 = result;
  [v60 addSubview:result];

  id result = [v33 view];
  if (result)
  {
    id v62 = result;
    [result bounds];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;

    objc_msgSend(v58, "setFrame:", v64, v66, v68, v70);
    [v58 setAutoresizingMask:18];
    [v33 addChildViewController:v52];
    [v52 didMoveToParentViewController:v33];

    id v55 = v52;
    uint64_t v52 = v58;
    uint64_t v50 = v83;
    id v35 = v84;
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TTRIGroceryLanguagesController()
{
  return self;
}

uint64_t sub_ED7C()
{
  uint64_t v0 = sub_D808(&qword_21CA8);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v15 - v4;
  uint64_t v6 = sub_13F10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_B2FC(1);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = [v10 locale];

    if (v12)
    {
      sub_13EF0();

      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v3, 0, 1, v6);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v3, 1, 1, v6);
    }
    sub_106E4((uint64_t)v3, (uint64_t)v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      sub_13F90();
      sub_13EE0();
      uint64_t v13 = sub_13F40();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return v13;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_E078((uint64_t)v5, &qword_21CA8);
  sub_13F90();
  return sub_13F70();
}

uint64_t sub_EFF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v7 = sub_D808(&qword_21D90);
  __chkstk_darwin(v7 - 8);
  uint64_t v43 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_D808(&qword_21D98);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v47 = (uint64_t)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_14040();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_D808(&qword_21DA0);
  uint64_t v16 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  unint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_D808(&qword_21DA8);
  __chkstk_darwin(v40);
  unint64_t v39 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v50 = a3;
  sub_D808(&qword_21DB0);
  sub_11BEC(&qword_21DB8, &qword_21DB0);
  uint64_t v37 = v18;
  sub_14090();
  sub_14030();
  uint64_t v20 = v47;
  uint64_t v21 = v47 + *(int *)(v10 + 44);
  uint64_t v38 = v13;
  uint64_t v22 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 16);
  v22(v21, v15, v12);
  uint64_t v23 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56);
  v23(v21, 0, 1, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v20, v18, v46);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = (uint64_t)v43;
  v22((uint64_t)v43, v15, v12);
  v23(v25, 0, 1, v12);
  uint64_t v26 = (uint64_t)v39;
  uint64_t v27 = (uint64_t *)&v39[*(int *)(v40 + 36)];
  uint64_t v28 = sub_D808(&qword_21DC0);
  sub_10A7C(v25, (uint64_t)v27 + *(int *)(v28 + 28), &qword_21D90);
  *uint64_t v27 = KeyPath;
  uint64_t v29 = v47;
  sub_10A7C(v47, v26, &qword_21D98);
  sub_E078(v25, &qword_21D90);
  sub_E078(v29, &qword_21D98);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v37, v46);
  uint64_t v31 = v41;
  uint64_t v30 = v42;
  uint64_t v51 = v41;
  uint64_t v52 = v42;
  sub_D808(&qword_21DC8);
  sub_14110();
  NSString v32 = (void *)swift_allocObject();
  v32[2] = v31;
  v32[3] = v30;
  NSString v33 = v44;
  v32[4] = v44;
  sub_13F90();
  sub_10B34();
  sub_11B3C(&qword_21E00);
  swift_retain();
  swift_retain();
  id v34 = v33;
  sub_14100();
  swift_release();
  swift_release();
  return sub_E078(v26, &qword_21DA8);
}

uint64_t sub_F4F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v42 = a4;
  uint64_t v38 = sub_D808(&qword_21E20);
  __chkstk_darwin(v38);
  uint64_t v7 = sub_D808(&qword_21E28);
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v39 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v44 = (char *)&v35 - v10;
  uint64_t v37 = sub_D808(&qword_21E30);
  uint64_t v36 = *(void *)(v37 - 8);
  uint64_t v11 = v36;
  uint64_t v12 = __chkstk_darwin(v37);
  uint64_t v43 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v16 = a2;
  uint64_t v50 = a3;
  sub_D808(&qword_21E38);
  uint64_t v17 = sub_10978(&qword_21E40);
  uint64_t v18 = sub_14020();
  uint64_t v19 = sub_11BEC(&qword_21E48, &qword_21E40);
  uint64_t v51 = (void *)v17;
  uint64_t v52 = (void *)v18;
  uint64_t v53 = v19;
  uint64_t v54 = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v15;
  id v35 = v15;
  sub_14150();
  uint64_t v45 = a1;
  uint64_t v46 = v16;
  uint64_t v47 = a3;
  sub_101F0();
  uint64_t v51 = &type metadata for Text;
  uint64_t v52 = &protocol witness table for Text;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = v44;
  sub_14160();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v23 = v43;
  uint64_t v24 = v37;
  v22(v43, v20, v37);
  uint64_t v25 = v39;
  uint64_t v26 = v40;
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  uint64_t v28 = v21;
  uint64_t v29 = v41;
  v27(v39, v28, v41);
  uint64_t v30 = v42;
  v22(v42, v23, v24);
  uint64_t v31 = sub_D808(&qword_21E50);
  v27(&v30[*(int *)(v31 + 48)], v25, v29);
  NSString v32 = *(void (**)(char *, uint64_t))(v26 + 8);
  v32(v44, v29);
  NSString v33 = *(void (**)(char *, uint64_t))(v36 + 8);
  v33(v35, v24);
  v32(v25, v29);
  return ((uint64_t (*)(char *, uint64_t))v33)(v43, v24);
}

uint64_t sub_F928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v17 = a3;
  uint64_t v5 = sub_14020();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v15 = v5;
  uint64_t v16 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_D808(&qword_21E40);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  sub_D808(&qword_21DC8);
  sub_14120();
  sub_13F90();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_D808(&qword_21E60);
  sub_11B3C(&qword_21E68);
  sub_11B80();
  sub_14130();
  swift_release();
  swift_release();
  swift_release();
  sub_14010();
  sub_11BEC(&qword_21E48, &qword_21E40);
  uint64_t v13 = v15;
  sub_140D0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_FBD8()
{
  sub_D808(&qword_21E78);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_16D50;
  sub_13F90();
  *(void *)(v0 + 32) = sub_13F70();
  sub_142C0();
  swift_getKeyPath();
  sub_D808(&qword_21E80);
  sub_11BEC(&qword_21E88, &qword_21E80);
  sub_11B3C(&qword_21E68);
  return sub_14140();
}

uint64_t sub_FD10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v7 = sub_14020();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_D808(&qword_21E40);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  sub_D808(&qword_21DC8);
  sub_14120();
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  sub_13F90();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_D808(&qword_21E60);
  sub_11B3C(&qword_21E68);
  sub_11B80();
  sub_14130();
  swift_release();
  swift_release();
  swift_release();
  sub_14010();
  sub_11BEC(&qword_21E48, &qword_21E40);
  uint64_t v15 = v18;
  sub_140D0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_FFCC()
{
  sub_D808(&qword_21E78);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_16D60;
  sub_13F90();
  *(void *)(inited + 32) = sub_13F70();
  *(void *)(inited + 40) = sub_10DC4();
  sub_142C0();
  unint64_t v1 = inited;
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_144C0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = &_swiftEmptySetSingleton;
    goto LABEL_6;
  }
  if (!*(void *)((char *)&dword_10 + (inited & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v2 = (void *)sub_10FA4(v1);
LABEL_6:
  swift_bridgeObjectRelease();
  unint64_t v4 = sub_13F60();
  sub_11230(v4, (uint64_t)v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_D808(&qword_21E80);
  sub_11BEC(&qword_21E88, &qword_21E80);
  sub_11B3C(&qword_21E68);
  return sub_14140();
}

uint64_t sub_10194@<X0>(uint64_t a1@<X8>)
{
  sub_13F50();
  sub_11ACC();
  uint64_t result = sub_140A0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_101F0()
{
  uint64_t v0 = (objc_class *)REMSettingsBundleGet();
  v9._countAndFlagsBits = 0xD000000000000036;
  v8._countAndFlagsBits = 0x800000000001A680;
  v9._object = (void *)0x800000000001A640;
  v10.value._countAndFlagsBits = 0;
  v10.value._object = 0;
  v1.super.Class isa = v0;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_13E50(v9, v10, v1, v11, v8);

  sub_11ACC();
  uint64_t v2 = sub_140A0();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_140E0();
  sub_11B20(v2, v4, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10304(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = sub_D808(&qword_21CA0);
  __chkstk_darwin(v9 - 8);
  Swift::String v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a2;
  uint64_t v13 = sub_14330();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  sub_14310();
  swift_retain();
  id v14 = a5;
  swift_retain();
  swift_retain();
  uint64_t v15 = sub_14300();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v14;
  v16[7] = v12;
  sub_CC44((uint64_t)v11, (uint64_t)&unk_21E10, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_1045C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = sub_14310();
  v7[3] = sub_14300();
  uint64_t v10 = (void *)swift_task_alloc();
  v7[4] = v10;
  *uint64_t v10 = v7;
  v10[1] = sub_10518;
  return sub_114B4(a7, a6);
}

uint64_t sub_10518()
{
  swift_task_dealloc();
  uint64_t v1 = sub_142F0();
  return _swift_task_switch(sub_10654, v1, v0);
}

uint64_t sub_10654()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_106BC()
{
  return sub_140F0();
}

uint64_t sub_106D8@<X0>(uint64_t a1@<X8>)
{
  return sub_EFF8(*(void *)v1, *(void *)(v1 + 8), *(void **)(v1 + 16), a1);
}

uint64_t sub_106E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_D808(&qword_21CA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void destroy for TTRIGroceryLanguagePickerList(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s17RemindersSettings29TTRIGroceryLanguagePickerListVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for TTRIGroceryLanguagePickerList(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for TTRIGroceryLanguagePickerList(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTRIGroceryLanguagePickerList(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIGroceryLanguagePickerList(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIGroceryLanguagePickerList(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRIGroceryLanguagePickerList()
{
  return &type metadata for TTRIGroceryLanguagePickerList;
}

uint64_t sub_10950()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1096C@<X0>(char *a1@<X8>)
{
  return sub_F4F0(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_10978(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_109C0()
{
  return sub_13FF0();
}

uint64_t sub_109E4(uint64_t a1)
{
  uint64_t v2 = sub_D808(&qword_21D90);
  __chkstk_darwin(v2 - 8);
  sub_10A7C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_21D90);
  return sub_14000();
}

uint64_t sub_10A7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_D808(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10AE0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10B28(uint64_t a1, uint64_t *a2)
{
  return sub_10304(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

unint64_t sub_10B34()
{
  unint64_t result = qword_21DD0;
  if (!qword_21DD0)
  {
    sub_10978(&qword_21DA8);
    sub_10BD4();
    sub_11BEC(&qword_21DF8, &qword_21DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21DD0);
  }
  return result;
}

unint64_t sub_10BD4()
{
  unint64_t result = qword_21DD8;
  if (!qword_21DD8)
  {
    sub_10978(&qword_21D98);
    sub_11BEC(&qword_21DE0, &qword_21DA0);
    sub_11BEC(&qword_21DE8, &qword_21DF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21DD8);
  }
  return result;
}

uint64_t sub_10C98()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10CF0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_D954;
  return sub_1045C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_10DC4()
{
  uint64_t v0 = sub_13F10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self daemonUserDefaults];
  id v5 = [v4 preferredLocalizations];

  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = sub_142B0();

  if (!*(void *)(v6 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_13F00();
    sub_13EE0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_6:
  sub_13FB0();
  sub_13FA0();
  swift_bridgeObjectRelease();
  sub_13F90();
  uint64_t v7 = sub_13F40();
  swift_bridgeObjectRelease();
  return v7;
}

unint64_t sub_10FA4(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_144C0();
    unint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_D808(&qword_21E90);
      unint64_t result = sub_14420();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_144C0();
      unint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  uint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    unint64_t result = sub_14440();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    sub_13F90();
    sub_11B3C(&qword_21E68);
    unint64_t result = sub_141C0();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_11B3C(&qword_21E00);
      while (1)
      {
        unint64_t result = sub_141D0();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      unint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  unint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_11230(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v19 = &_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_25:
    uint64_t v4 = sub_144C0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (v4)
    {
LABEL_3:
      unint64_t v5 = 0;
      unint64_t v6 = v3 & 0xC000000000000001;
      uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v18 = v3 & 0xC000000000000001;
      uint64_t v8 = a2 + 56;
      uint64_t v16 = v4;
      uint64_t v17 = v3 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if (v6)
        {
          sub_14440();
          BOOL v9 = __OFADD__(v5++, 1);
          if (v9)
          {
LABEL_22:
            __break(1u);
            return v19;
          }
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16))
          {
            __break(1u);
            goto LABEL_25;
          }
          swift_retain();
          BOOL v9 = __OFADD__(v5++, 1);
          if (v9) {
            goto LABEL_22;
          }
        }
        if ((a2 & 0xC000000000000001) != 0)
        {
          swift_retain();
          uint64_t v3 = sub_143E0();
          swift_release();
          if (v3)
          {
            swift_release();
            goto LABEL_6;
          }
        }
        else if (*(void *)(a2 + 16))
        {
          uint64_t v10 = sub_13F90();
          sub_11B3C(&qword_21E68);
          uint64_t v11 = sub_141C0();
          uint64_t v12 = -1 << *(unsigned char *)(a2 + 32);
          unint64_t v13 = v11 & ~v12;
          if ((*(void *)(v8 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
          {
            uint64_t v14 = ~v12;
            sub_11B3C(&qword_21E00);
            while (1)
            {
              uint64_t v3 = v10;
              if (sub_141D0()) {
                break;
              }
              unint64_t v13 = (v13 + 1) & v14;
              if (((*(void *)(v8 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
              {
                uint64_t v4 = v16;
                goto LABEL_4;
              }
            }
            swift_release();
            uint64_t v4 = v16;
            uint64_t v7 = v17;
            unint64_t v6 = v18;
            goto LABEL_6;
          }
LABEL_4:
          uint64_t v7 = v17;
          unint64_t v6 = v18;
        }
        uint64_t v3 = (uint64_t)&v19;
        sub_14460();
        sub_14480();
        sub_14490();
        sub_14470();
LABEL_6:
        if (v5 == v4) {
          return v19;
        }
      }
    }
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_114B4(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  sub_14310();
  v2[9] = sub_14300();
  uint64_t v4 = sub_142F0();
  v2[10] = v4;
  v2[11] = v3;
  return _swift_task_switch(sub_1154C, v4, v3);
}

uint64_t sub_1154C()
{
  sub_13F80();
  if (v1)
  {
    sub_D808(&qword_21CC0);
    sub_13F10();
    unint64_t v2 = (_OWORD *)swift_allocObject();
    v2[1] = xmmword_16D70;
    sub_13ED0();
  }
  else
  {
    unint64_t v2 = &_swiftEmptyArrayStorage;
  }
  v0[12] = v2;
  v0[13] = [objc_allocWithZone((Class)REMStore) init];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  void *v3 = v0;
  v3[1] = sub_116C4;
  return REMStore.setOverridingGroceryCategorizationSecondaryGroceryLocales(_:)(v2);
}

uint64_t sub_116C4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_11868;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_117F8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_117F8()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 104);
  sub_B844();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_11868()
{
  uint64_t v11 = v0;
  swift_release();
  swift_bridgeObjectRelease();
  if (qword_21C40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_13FD0();
  sub_D76C(v1, (uint64_t)qword_21D48);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_13FC0();
  os_log_type_t v3 = sub_14340();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_14510();
    v0[6] = sub_131A8(v5, v6, &v10);
    sub_143A0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "TTRIGroceryLanguagePickerList.setSecondaryGroceryLanguage: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = (void *)v0[13];
  sub_B844();

  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_11AB4@<X0>(uint64_t a1@<X8>)
{
  return sub_F928(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_11AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_FD10(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_11ACC()
{
  unint64_t result = qword_21E58;
  if (!qword_21E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21E58);
  }
  return result;
}

uint64_t sub_11B20(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_11B30()
{
  return sub_FFCC();
}

uint64_t sub_11B3C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_13F90();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_11B80()
{
  unint64_t result = qword_21E70;
  if (!qword_21E70)
  {
    sub_10978(&qword_21E60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21E70);
  }
  return result;
}

uint64_t sub_11BEC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10978(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_11C30()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_11D48(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    NSString v10 = sub_14200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, "initWithStyle:reuseIdentifier:specifier:", a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

uint64_t type metadata accessor for TTRIClearCategorizationHistoryCell()
{
  return self;
}

unint64_t sub_11F6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_D808(&qword_21F78);
  uint64_t v2 = sub_144D0();
  os_log_type_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10A7C(v6, (uint64_t)v15, (uint64_t *)&unk_21F80);
    unint64_t result = sub_13968((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_E0D4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_120B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_D808(&qword_21F68);
  uint64_t v2 = sub_144D0();
  os_log_type_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10A7C(v6, (uint64_t)&v13, &qword_21F70);
    uint64_t v7 = v13;
    unint64_t result = sub_139AC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_E0D4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_121E0()
{
  uint64_t v0 = sub_13FD0();
  sub_D7A4(v0, qword_21EC0);
  sub_D76C(v0, (uint64_t)qword_21EC0);
  id v1 = [self utility];
  return sub_13FE0();
}

uint64_t sub_12250(void *a1)
{
  uint64_t v2 = (objc_class *)REMSettingsBundleGet();
  v16._countAndFlagsBits = 0x800000000001A770;
  v18._countAndFlagsBits = 0x7265646E696D6552;
  v18._object = (void *)0xE900000000000073;
  v20.value._countAndFlagsBits = 0;
  v20.value._object = 0;
  v3.super.Class isa = v2;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  uint64_t v4 = sub_13E50(v18, v20, v3, v22, v16);
  uint64_t v6 = v5;

  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a1;
  v7[3] = v4;
  v7[4] = v6;
  id v8 = a1;
  swift_bridgeObjectRetain();
  char v9 = (objc_class *)REMSettingsBundleGet();
  v17._countAndFlagsBits = 0x800000000001A850;
  v19._object = (void *)0x800000000001A7A0;
  v23._object = (void *)0x800000000001A7D0;
  v19._countAndFlagsBits = 0xD000000000000021;
  v21.value._countAndFlagsBits = 0;
  v21.value._object = 0;
  v10.super.Class isa = v9;
  v23._countAndFlagsBits = 0x100000000000007DLL;
  sub_13E50(v19, v21, v10, v23, v17);

  sub_D808(&qword_21F20);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_16D70;
  id v12 = [self currentDevice];
  uint64_t v13 = (char *)[v12 userInterfaceIdiom];

  if (v13 == (unsigned char *)&dword_0 + 1) {
    unint64_t v14 = 0x800000000001A900;
  }
  else {
    unint64_t v14 = 0x800000000001A8D0;
  }
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = sub_13154();
  *(void *)(v11 + 32) = 0xD000000000000021;
  *(void *)(v11 + 40) = v14;
  sub_14240();
  swift_bridgeObjectRelease();
  sub_14230();
  return sub_141A0();
}

id sub_124C4(void *a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_14170();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_14190();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [a1 specifier];
  if (result)
  {
    uint64_t v15 = result;
    id v16 = [result target];

    uint64_t v40 = v10;
    uint64_t v41 = v7;
    uint64_t v38 = a2;
    uint64_t v39 = v11;
    if (v16)
    {
      self;
      Swift::String v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        id v37 = v17;
        id v16 = [v17 navigationItem];
LABEL_7:
        id v18 = [objc_allocWithZone((Class)UILabel) init];
        Swift::String v19 = self;
        NSString v20 = sub_14200();
        id v21 = [v19 preferredFontForTextStyle:v20];

        [v18 setFont:v21];
        sub_D808(&qword_21F38);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_16D70;
        *(void *)(inited + 32) = NSForegroundColorAttributeName;
        Swift::String v23 = self;
        swift_bridgeObjectRetain();
        uint64_t v24 = NSForegroundColorAttributeName;
        id v25 = [v23 labelColor];
        id v26 = [v25 colorWithAlphaComponent:a3];

        *(void *)(inited + 64) = sub_E03C(0, &qword_21F40);
        *(void *)(inited + 40) = v26;
        sub_120B0(inited);
        id v27 = objc_allocWithZone((Class)NSAttributedString);
        NSString v28 = sub_14200();
        swift_bridgeObjectRelease();
        type metadata accessor for Key();
        sub_13920(&qword_21D38, (void (*)(uint64_t))type metadata accessor for Key);
        Class isa = sub_141B0().super.isa;
        swift_bridgeObjectRelease();
        id v30 = [v27 initWithString:v28 attributes:isa];

        [v18 setAttributedText:v30];
        sub_E03C(0, &qword_21F48);
        uint64_t v31 = (void *)sub_14370();
        uint64_t v32 = swift_allocObject();
        *(void *)(v32 + 16) = v16;
        *(void *)(v32 + 24) = v18;
        aBlock[4] = sub_138EC;
        aBlock[5] = v32;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_12A88;
        aBlock[3] = &unk_1D150;
        NSString v33 = _Block_copy(aBlock);
        id v34 = v16;
        id v35 = v18;
        swift_release();
        sub_14180();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_13920(&qword_21F50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_D808(&qword_21F58);
        sub_11BEC(&qword_21F60, &qword_21F58);
        sub_143D0();
        sub_14380();
        _Block_release(v33);

        (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v13, v40);
      }
      swift_unknownObjectRelease();
      id v16 = 0;
    }
    id v37 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_12A88(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_12ACC()
{
  id v0 = [self defaultWorkspace];
  if (!v0) {
    __break(1u);
  }
  uint64_t v2 = v0;
  sub_13EA0(v1);
  uint64_t v4 = v3;
  id v14 = 0;
  id v5 = [v2 openURL:v3 configuration:0 error:&v14];

  if (v5)
  {
    id v6 = v14;
  }
  else
  {
    id v7 = v14;
    sub_13E60();

    swift_willThrow();
    if (qword_21C48 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_13FD0();
    sub_D76C(v8, (uint64_t)qword_21EC0);
    swift_errorRetain();
    swift_errorRetain();
    char v9 = sub_13FC0();
    os_log_type_t v10 = sub_14340();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      id v14 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_getErrorValue();
      uint64_t v12 = sub_14510();
      sub_131A8(v12, v13, (uint64_t *)&v14);
      sub_143A0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v9, v10, "RemindersSettingsPlacardCell: Failed to open url {error: %s}", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t type metadata accessor for RemindersSettingsPlacardCell()
{
  return self;
}

uint64_t sub_1309C()
{
  return sub_12250(*(void **)(v0 + 16));
}

uint64_t *sub_130A4(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_13108()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_13148(double a1)
{
  return sub_124C4(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_13154()
{
  unint64_t result = qword_21F28;
  if (!qword_21F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21F28);
  }
  return result;
}

uint64_t sub_131A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1327C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_13850((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_13850((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_13800((uint64_t)v12);
  return v7;
}

uint64_t sub_1327C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_143B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_13438(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_14450();
  if (!v8)
  {
    sub_144A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_144E0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_13438(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_134D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_136B0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_136B0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_134D0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_13648(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_14430();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_144A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_14270();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_144E0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_144A0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_13648(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_D808(&qword_21F30);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_136B0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_D808(&qword_21F30);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_144E0();
  __break(1u);
  return result;
}

uint64_t sub_13800(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_13850(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_138AC()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_138EC()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return [result setTitleView:*(void *)(v0 + 24)];
  }
  return result;
}

uint64_t sub_13908(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_13918()
{
  return swift_release();
}

uint64_t sub_13920(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_13968(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_143F0(*(void *)(v2 + 40));

  return sub_13A40(a1, v4);
}

unint64_t sub_139AC(uint64_t a1)
{
  sub_14230();
  sub_14520();
  sub_14250();
  Swift::Int v2 = sub_14530();
  swift_bridgeObjectRelease();

  return sub_13B08(a1, v2);
}

unint64_t sub_13A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_13C80(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_14400();
      sub_13CDC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_13B08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_14230();
    uint64_t v8 = v7;
    if (v6 == sub_14230() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_14500();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_14230();
          uint64_t v15 = v14;
          if (v13 == sub_14230() && v15 == v16) {
            break;
          }
          char v18 = sub_14500();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_13C80(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_13CDC(uint64_t a1)
{
  return a1;
}

void sub_13D30(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error upon attempt to clear grocery local corrections. {error: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_13DA8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to fetch Accounts in REMSettingsController: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_13E40()
{
  return NSNotFound.getter();
}

uint64_t sub_13E50(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_13E60()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_13E70()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_13E80()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_13E90()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

void sub_13EA0(NSURL *retstr@<X8>)
{
}

uint64_t sub_13EB0()
{
  return URL.init(string:)();
}

uint64_t sub_13EC0()
{
  return type metadata accessor for URL();
}

uint64_t sub_13ED0()
{
  return Locale.init(identifier:)();
}

uint64_t sub_13EE0()
{
  return Locale.identifier.getter();
}

uint64_t sub_13EF0()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_13F00()
{
  return static Locale.current.getter();
}

uint64_t sub_13F10()
{
  return type metadata accessor for Locale();
}

uint64_t sub_13F20()
{
  return static REMGroceryDataView.fetchSecondaryGroceryLocale(store:modelBaseLocaleConversion:)();
}

uint64_t sub_13F30()
{
  return type metadata accessor for REMGroceryDataView();
}

uint64_t sub_13F40()
{
  return static REMGroceryLanguage.groceryLanguage(fromModelBaseLocaleID:)();
}

uint64_t sub_13F50()
{
  return dispatch thunk of REMGroceryLanguage.displayName.getter();
}

uint64_t sub_13F60()
{
  return static REMGroceryLanguage.allLanguages()();
}

uint64_t sub_13F70()
{
  return static REMGroceryLanguage.None.getter();
}

uint64_t sub_13F80()
{
  return REMGroceryLanguage.uiLocale.getter();
}

uint64_t sub_13F90()
{
  return type metadata accessor for REMGroceryLanguage();
}

uint64_t sub_13FA0()
{
  return static REMGroceryDummyModel.modelBaseLocale(for:)();
}

uint64_t sub_13FB0()
{
  return type metadata accessor for REMGroceryDummyModel();
}

uint64_t sub_13FC0()
{
  return Logger.logObject.getter();
}

uint64_t sub_13FD0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_13FE0()
{
  return Logger.init(_:)();
}

uint64_t sub_13FF0()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t sub_14000()
{
  return EnvironmentValues.listSectionSpacing.setter();
}

uint64_t sub_14010()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_14020()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_14030()
{
  return static ListSectionSpacing.compact.getter();
}

uint64_t sub_14040()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t sub_14050()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_14060()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_14070()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_14080()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_14090()
{
  return List<>.init(content:)();
}

uint64_t sub_140A0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_140B0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_140C0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_140D0()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_140E0()
{
  return View.avoidsOrphans(_:)();
}

uint64_t sub_140F0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_14100()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_14110()
{
  return State.wrappedValue.getter();
}

uint64_t sub_14120()
{
  return State.projectedValue.getter();
}

uint64_t sub_14130()
{
  return Picker.init(selection:label:content:)();
}

uint64_t sub_14140()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_14150()
{
  return Section<>.init(content:)();
}

uint64_t sub_14160()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_14170()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_14180()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_14190()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_141A0()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:applicationBundleIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

NSDictionary sub_141B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_141C0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_141D0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_141E0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_141F0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_14200()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_14210()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14220()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14230()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14240()
{
  return String.init(format:_:)();
}

uint64_t sub_14250()
{
  return String.hash(into:)();
}

void sub_14260(Swift::String a1)
{
}

Swift::Int sub_14270()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_14280()
{
  return String.UTF16View.count.getter();
}

uint64_t sub_14290()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_142A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_142B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_142C0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_142D0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_142E0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_142F0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_14300()
{
  return static MainActor.shared.getter();
}

uint64_t sub_14310()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_14320()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_14330()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_14340()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_14350()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_14360()
{
  return PSViewController.emitNavigationEventForApplicationSetting(applicationBundleIdentifier:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_14370()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_14380()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_143A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_143B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_143C0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_143D0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_143E0()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int sub_143F0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_14400()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_14410()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_14420()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_14430()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_14440()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_14450()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_14460()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_14470()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_14480()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_14490()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_144A0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_144B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_144C0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_144D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_144E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_14500()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_14510()
{
  return Error.rem_errorDescription.getter();
}

uint64_t sub_14520()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_14530()
{
  return Hasher._finalize()();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
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

uint64_t REMCheckedDynamicCast()
{
  return _REMCheckedDynamicCast();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t rem_feature_enabled()
{
  return _rem_feature_enabled();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__accountSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _accountSpecifiers];
}

id objc_msgSend__appPolicySpecifiersShouldIncludeAccountSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appPolicySpecifiersShouldIncludeAccountSpecifier:");
}

id objc_msgSend__applyKey_scope_toSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyKey:scope:toSpecifier:");
}

id objc_msgSend__heroPlacardSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _heroPlacardSpecifiers];
}

id objc_msgSend__setRoundsToMinuteInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRoundsToMinuteInterval:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return _[a1 appPolicy];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_cachedCellForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedCellForSpecifier:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_clearCategorizationDetailText(void *a1, const char *a2, ...)
{
  return _[a1 clearCategorizationDetailText];
}

id objc_msgSend_clearGroceryLocalCorrectionsOfListsOwnedByCurrentUserWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearGroceryLocalCorrectionsOfListsOwnedByCurrentUserWithCompletionHandler:");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_containsSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsSpecifier:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_daemonUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 daemonUserDefaults];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateBySettingHour_minute_second_ofDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decreaseMinuteIntervalIfNeededForDatePicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decreaseMinuteIntervalIfNeededForDatePicker:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultListSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 defaultListSpecifier];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_disableAssignmentNotifications(void *a1, const char *a2, ...)
{
  return _[a1 disableAssignmentNotifications];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_enableAssignmentNotifications(void *a1, const char *a2, ...)
{
  return _[a1 enableAssignmentNotifications];
}

id objc_msgSend_enableAutoCompleteReminders(void *a1, const char *a2, ...)
{
  return _[a1 enableAutoCompleteReminders];
}

id objc_msgSend_fetchAccountsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAccountsWithError:");
}

id objc_msgSend_fetchDefaultListWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDefaultListWithError:");
}

id objc_msgSend_fetchEligibleDefaultListsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEligibleDefaultListsWithError:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_generateViewModel(void *a1, const char *a2, ...)
{
  return _[a1 generateViewModel];
}

id objc_msgSend_getGroupSpecifierForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGroupSpecifierForSpecifier:");
}

id objc_msgSend_groupSpecifierWithHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithHeader:");
}

id objc_msgSend_groupSpecifierWithHeader_footer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithHeader:footer:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_includeRemindersDueTodayInBadgeCount(void *a1, const char *a2, ...)
{
  return _[a1 includeRemindersDueTodayInBadgeCount];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithList:");
}

id objc_msgSend_initialShouldIncludeRemindersDueTodayInBadgeCount(void *a1, const char *a2, ...)
{
  return _[a1 initialShouldIncludeRemindersDueTodayInBadgeCount];
}

id objc_msgSend_insertSpecifier_afterSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:afterSpecifier:animated:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isGrocerySupportedForLocaleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGrocerySupportedForLocaleWithIdentifier:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkListPreferenceSpecifierNamed_target_keyName_detail_scope_get_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkListPreferenceSpecifierNamed:target:keyName:detail:scope:get:");
}

id objc_msgSend_listID(void *a1, const char *a2, ...)
{
  return _[a1 listID];
}

id objc_msgSend_lists(void *a1, const char *a2, ...)
{
  return _[a1 lists];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_minuteInterval(void *a1, const char *a2, ...)
{
  return _[a1 minuteInterval];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _[a1 objectID];
}

id objc_msgSend_observeEnableAssignmentNotificationsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeEnableAssignmentNotificationsWithBlock:");
}

id objc_msgSend_observeEnableAutoCompleteRemindersWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeEnableAutoCompleteRemindersWithBlock:");
}

id objc_msgSend_observePreferredDefaultListIDWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observePreferredDefaultListIDWithBlock:");
}

id objc_msgSend_observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock:");
}

id objc_msgSend_observeShowRemindersAsOverdueWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeShowRemindersAsOverdueWithBlock:");
}

id objc_msgSend_observeTodayNotificationFireTimeWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeTodayNotificationFireTimeWithBlock:");
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_pe_registerUndoActionName_associatedDeepLink_undoAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_registerUndoActionName:associatedDeepLink:undoAction:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredDefaultListID(void *a1, const char *a2, ...)
{
  return _[a1 preferredDefaultListID];
}

id objc_msgSend_preferredHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredHeight];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return _[a1 preferredLocalizations];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_radioGroupSpecifierWithHeader_footer_keyName_scope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radioGroupSpecifierWithHeader:footer:keyName:scope:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reloadTodayNotificationSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadTodayNotificationSpecifiers:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_saveAndWakeDaemon(void *a1, const char *a2, ...)
{
  return _[a1 saveAndWakeDaemon];
}

id objc_msgSend_saveAppBadgeCountCriteriaIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 saveAppBadgeCountCriteriaIfNeeded];
}

id objc_msgSend_saveTodayNotificationFireTimeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 saveTodayNotificationFireTimeIfNeeded];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_selectedListID(void *a1, const char *a2, ...)
{
  return _[a1 selectedListID];
}

id objc_msgSend_setAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccounts:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setDaemonUserDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaults:");
}

id objc_msgSend_setDaemonUserDefaultsDefaultListObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaultsDefaultListObserver:");
}

id objc_msgSend_setDaemonUserDefaultsIncludeDueTodayObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaultsIncludeDueTodayObserver:");
}

id objc_msgSend_setDaemonUserDefaultsMuteNotificationsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaultsMuteNotificationsObserver:");
}

id objc_msgSend_setDaemonUserDefaultsShowReminderAsOverdueObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaultsShowReminderAsOverdueObserver:");
}

id objc_msgSend_setDaemonUserDefaultsShowSuggestionsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaultsShowSuggestionsObserver:");
}

id objc_msgSend_setDaemonUserDefaultsTodayNotificationObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonUserDefaultsTodayNotificationObserver:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDatePickerMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatePickerMode:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDefaultListSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultListSpecifier:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableAssignmentNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableAssignmentNotifications:");
}

id objc_msgSend_setEnableAssignmentNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableAssignmentNotifications:");
}

id objc_msgSend_setEnableAutoCompleteReminders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableAutoCompleteReminders:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIncludeRemindersDueTodayInBadgeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeRemindersDueTodayInBadgeCount:");
}

id objc_msgSend_setInitialShouldIncludeRemindersDueTodayInBadgeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialShouldIncludeRemindersDueTodayInBadgeCount:");
}

id objc_msgSend_setListID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListID:");
}

id objc_msgSend_setLists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLists:");
}

id objc_msgSend_setMinuteInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinuteInterval:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPreferenceValue_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferenceValue:specifier:");
}

id objc_msgSend_setPreferredDatePickerStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredDatePickerStyle:");
}

id objc_msgSend_setPreferredDefaultListID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredDefaultListID:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setSelectedListID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedListID:");
}

id objc_msgSend_setShouldIncludeRemindersDueTodayInBadgeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIncludeRemindersDueTodayInBadgeCount:");
}

id objc_msgSend_setShowAsOverdue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowAsOverdue:");
}

id objc_msgSend_setShowRemindersAsOverdue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowRemindersAsOverdue:");
}

id objc_msgSend_setStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStore:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
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

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTodayNotificationEnabledSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayNotificationEnabledSwitch:");
}

id objc_msgSend_setTodayNotificationFireTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayNotificationFireTime:");
}

id objc_msgSend_setTodayNotificationGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayNotificationGroup:");
}

id objc_msgSend_setTodayNotificationTimeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayNotificationTimeButton:");
}

id objc_msgSend_setTodayNotificationTimePicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayNotificationTimePicker:");
}

id objc_msgSend_setTodayNotificationTimePickerVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayNotificationTimePickerVisible:");
}

id objc_msgSend_setUnsavedTodayNotificationFireTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnsavedTodayNotificationFireTime:");
}

id objc_msgSend_setValues_titles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:");
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewModel:");
}

id objc_msgSend_sharingStatusText(void *a1, const char *a2, ...)
{
  return _[a1 sharingStatusText];
}

id objc_msgSend_shouldHideGrocerySectionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 shouldHideGrocerySectionIfNeeded];
}

id objc_msgSend_shouldIncludeRemindersDueTodayInBadgeCount(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeRemindersDueTodayInBadgeCount];
}

id objc_msgSend_showAsOverdue(void *a1, const char *a2, ...)
{
  return _[a1 showAsOverdue];
}

id objc_msgSend_showRemindersAsOverdue(void *a1, const char *a2, ...)
{
  return _[a1 showRemindersAsOverdue];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierWithViewModel_target_cell_detail_keyName_defaultValue_scope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierWithViewModel:target:cell:detail:keyName:defaultValue:scope:");
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}

id objc_msgSend_standardButtonSpecifierNamed_target_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardButtonSpecifierNamed:target:selector:");
}

id objc_msgSend_standardPreferenceSpecifierNamed_target_cell_detail_keyName_defaultValue_scope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPreferenceSpecifierNamed:target:cell:detail:keyName:defaultValue:scope:");
}

id objc_msgSend_standardPreferenceSpecifierNamed_target_cell_detail_keyName_defaultValue_scope_set_get_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardPreferenceSpecifierNamed:target:cell:detail:keyName:defaultValue:scope:set:get:");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_supportsGroceriesList(void *a1, const char *a2, ...)
{
  return _[a1 supportsGroceriesList];
}

id objc_msgSend_tableCellBlueTextColor(void *a1, const char *a2, ...)
{
  return _[a1 tableCellBlueTextColor];
}

id objc_msgSend_todayNotificationEnabledSwitch(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationEnabledSwitch];
}

id objc_msgSend_todayNotificationFireTime(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationFireTime];
}

id objc_msgSend_todayNotificationFireTimeFromStorageNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "todayNotificationFireTimeFromStorageNumber:");
}

id objc_msgSend_todayNotificationFooterText(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationFooterText];
}

id objc_msgSend_todayNotificationGroup(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationGroup];
}

id objc_msgSend_todayNotificationTimeButton(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationTimeButton];
}

id objc_msgSend_todayNotificationTimePicker(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationTimePicker];
}

id objc_msgSend_todayNotificationTimePickerVisible(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationTimePickerVisible];
}

id objc_msgSend_todayNotificationTimeString(void *a1, const char *a2, ...)
{
  return _[a1 todayNotificationTimeString];
}

id objc_msgSend_unsavedTodayNotificationFireTime(void *a1, const char *a2, ...)
{
  return _[a1 unsavedTodayNotificationFireTime];
}

id objc_msgSend_utility(void *a1, const char *a2, ...)
{
  return _[a1 utility];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return _[a1 valueLabel];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _[a1 viewModel];
}