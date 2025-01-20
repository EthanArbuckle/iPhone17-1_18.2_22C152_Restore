unsigned char *sub_5310(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned char *v3;
  void *v5;
  void *v6;
  NSString v7;
  id v8;
  id v9;
  unsigned char *v10;
  NSString v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v5 = &v3[OBJC_IVAR___PMSettingsController_passwordsAppBundleIdentifier];
  *v5 = 0xD000000000000013;
  v5[1] = 0x800000000000EEB0;
  v6 = &v3[OBJC_IVAR___PMSettingsController_passwordsPrivacySplashIdentifier];
  *v6 = 0xD00000000000001ELL;
  v6[1] = 0x800000000000EED0;
  v3[OBJC_IVAR___PMSettingsController_shouldShowNeverSavedSheet] = 0;
  *(void *)&v3[OBJC_IVAR___PMSettingsController_subscriptions] = &_swiftEmptySetSingleton;
  *(void *)&v3[OBJC_IVAR___PMSettingsController_appPolicy] = 0;
  *(void *)&v3[OBJC_IVAR___PMSettingsController__specifiers] = 0;
  if (a2)
  {
    v7 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v21.receiver = v3;
  v21.super_class = (Class)type metadata accessor for PMSettingsController();
  v8 = objc_msgSendSuper2(&v21, "initWithNibName:bundle:", v7, a3);

  v9 = objc_allocWithZone((Class)PSSystemPolicyForApp);
  v10 = v8;
  swift_bridgeObjectRetain();
  v11 = sub_D180();
  swift_bridgeObjectRelease();
  v12 = [v9 initWithBundleIdentifier:v11];

  v13 = *(void **)&v10[OBJC_IVAR___PMSettingsController_appPolicy];
  *(void *)&v10[OBJC_IVAR___PMSettingsController_appPolicy] = v12;

  v14 = [self defaultCenter];
  [v14 addObserver:v10 selector:"accountStoreDidChange" name:WBSSavedAccountStoreDidChangeNotification object:0];

  v15 = [self sharedStore];
  v16 = [v15 savedAccountsWithNeverSaveMarker];

  if (v16)
  {
    sub_A650(0, &qword_14ED8);
    v17 = sub_D1C0();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_D470();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = *(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    v10[OBJC_IVAR___PMSettingsController_shouldShowNeverSavedSheet] = v18 != 0;
    *(void *)&v10[OBJC_IVAR___PMSettingsController__specifiers] = 0;
    swift_bridgeObjectRelease();
    v19 = [v10 specifiers];
  }
  else
  {
    v19 = a3;
    a3 = v10;
  }

  return v10;
}

uint64_t sub_5670(char a1)
{
  sub_A264(&qword_14F70);
  __chkstk_darwin();
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_D000();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for PMSettingsController();
  v13.receiver = v1;
  v13.super_class = v9;
  objc_msgSendSuper2(&v13, "viewDidAppear:", a1 & 1);
  sub_D160();
  sub_D150();
  sub_D190();
  sub_CFF0();
  sub_D030();
  uint64_t v10 = sub_D040();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v4, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_D140();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v4, v10);
  }
  return result;
}

uint64_t sub_5914()
{
  uint64_t v1 = OBJC_IVAR___PMSettingsController__specifiers;
  if (*(void *)&v0[OBJC_IVAR___PMSettingsController__specifiers])
  {
    v2 = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = sub_6558();
    sub_5CC8((unint64_t)v3);
    v4 = sub_9DF0();
    sub_5CC8((unint64_t)v4);
    uint64_t v5 = sub_79F4();
    sub_5CC8((unint64_t)v5);
    uint64_t v6 = sub_67B4();
    sub_5CC8((unint64_t)v6);
    uint64_t v7 = sub_6D84();
    sub_5CC8((unint64_t)v7);
    v8 = sub_7178();
    sub_5CC8((unint64_t)v8);
    v9 = sub_5EF8();
    sub_5CC8((unint64_t)v9);
    unint64_t v10 = swift_bridgeObjectRetain();
    sub_5A64(v10);
    swift_bridgeObjectRelease();
    Class isa = sub_D1B0().super.isa;
    swift_bridgeObjectRelease();
    [v0 setSpecifiers:isa];

    *(void *)&v0[v1] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v2 = &_swiftEmptyArrayStorage;
  }
  uint64_t v12 = sub_5A64((unint64_t)v2);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_5A64(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_D470();
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
  objc_super v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_95A8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_D3F0();
        sub_A650(0, &qword_14F40);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_95A8(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_95A8(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_A2F0(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_A650(0, &qword_14F40);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_95A8(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_95A8(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_A2F0(v12, &v3[4 * v11 + 4]);
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

uint64_t sub_5CC8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_D470();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_D470();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_D400();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_9AD8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_D470();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_D1D0();
}

void *sub_5EF8()
{
  uint64_t v1 = sub_D090();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  NSString v6 = sub_D180();
  id v7 = [v5 groupSpecifierWithID:v6];

  if (v7)
  {
    sub_D080();
    sub_D070();
    uint64_t v8 = *(void (**)(char *, uint64_t))(v2 + 8);
    v8(v4, v1);
    NSString v9 = sub_D180();
    swift_bridgeObjectRelease();
    id v10 = [v5 preferenceSpecifierNamed:v9 target:v0 set:0 get:0 detail:0 cell:13 edit:0];

    if (v10)
    {
      sub_D080();
      sub_D070();
      v8(v4, v1);
      NSString v11 = sub_D180();
      swift_bridgeObjectRelease();
      id v12 = [v5 preferenceSpecifierNamed:v11 target:v0 set:0 get:0 detail:0 cell:13 edit:0];

      if (v12)
      {
        [v10 setButtonAction:"openPasswordsApp"];
        [v12 setButtonAction:"openAutoFillSettings"];
        Class isa = sub_D1E0().super.super.isa;
        [v12 setProperty:isa forKey:PSAllowMultilineTitleKey];

        sub_A264(&qword_14F10);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_DAA0;
        *(void *)(v14 + 32) = v7;
        *(void *)(v14 + 40) = v10;
        *(void *)(v14 + 48) = v12;
        uint64_t v21 = v14;
        sub_D1D0();
        return (void *)v21;
      }
    }
    else
    {
      id v10 = v7;
    }
  }
  if (qword_14E68 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_D0D0();
  sub_A1D8(v16, (uint64_t)qword_154F8);
  v17 = sub_D0C0();
  os_log_type_t v18 = sub_D290();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "Unable to load the open passwords specifiers.", v19, 2u);
    swift_slowDealloc();
  }

  return &_swiftEmptyArrayStorage;
}

unint64_t sub_62D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A264(&qword_14F28);
  uint64_t v2 = sub_D480();
  uint64_t v3 = (void *)v2;
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
    sub_AA20(v6, (uint64_t)v15, &qword_14F30);
    unint64_t result = sub_9738((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_A2F0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_6418(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A264(&qword_14F78);
  uint64_t v2 = sub_D480();
  uint64_t v3 = (void *)v2;
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
    sub_AA20(v6, (uint64_t)&v15, &qword_14F80);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_977C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_A2F0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

void *sub_6558()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___PMSettingsController_appPolicy);
  if (!v1
    || (id v2 = [v1 specifiers]) == 0
    || (uint64_t v3 = v2, v4 = sub_D1C0(), v3, v5 = sub_6698(v4), swift_bridgeObjectRelease(), !v5))
  {
    if (qword_14E68 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_D0D0();
    sub_A1D8(v6, (uint64_t)qword_154F8);
    uint64_t v7 = sub_D0C0();
    os_log_type_t v8 = sub_D290();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "Unable to load the application policy settings.", v9, 2u);
      swift_slowDealloc();
    }

    return &_swiftEmptyArrayStorage;
  }
  return v5;
}

void *sub_6698(uint64_t a1)
{
  uint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_D430();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_A3B0(i, (uint64_t)v5);
    sub_A650(0, &qword_14F40);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_D410();
    sub_D440();
    sub_D450();
    sub_D420();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void *sub_67B4()
{
  uint64_t v1 = sub_D090();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  NSString v6 = sub_D180();
  id v7 = [v5 groupSpecifierWithID:v6];

  if (v7)
  {
    sub_D080();
    sub_D070();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    NSString v8 = sub_D180();
    swift_bridgeObjectRelease();
    id v9 = [v5 preferenceSpecifierNamed:v8 target:v0 set:"setPasswordBreachDetectionState:for:" get:"passwordBreachDetectionState" detail:0 cell:6 edit:0];

    if (v9)
    {
      id v10 = sub_82BC();
      if (v10)
      {
        BOOL v13 = v10;
        v43[0] = v11;
        v43[1] = v12;
        Class isa = sub_D1E0().super.super.isa;
        [v9 setProperty:isa forKey:PSAllowMultilineTitleKey];

        sub_A264(&qword_14EF0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_DAB0;
        uint64_t v44 = sub_D190();
        uint64_t v45 = v16;
        sub_D3E0();
        sub_A650(0, &qword_14F18);
        ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        os_log_type_t v18 = NSStringFromClass(ObjCClassFromMetadata);
        uint64_t v19 = sub_D190();
        uint64_t v21 = v20;

        *(void *)(inited + 96) = &type metadata for String;
        *(void *)(inited + 72) = v19;
        *(void *)(inited + 80) = v21;
        uint64_t v44 = sub_D190();
        uint64_t v45 = v22;
        sub_D3E0();
        *(void *)(inited + 168) = sub_A650(0, &qword_14F38);
        *(void *)(inited + 144) = v13;
        uint64_t v44 = sub_D190();
        uint64_t v45 = v23;
        v24 = v13;
        sub_D3E0();
        swift_bridgeObjectRetain();
        NSString v25 = sub_D180();
        swift_bridgeObjectRelease();
        id v26 = [v24 rangeOfString:v25];
        NSUInteger v28 = v27;

        v46.location = (NSUInteger)v26;
        v46.length = v28;
        v29 = NSStringFromRange(v46);
        uint64_t v30 = sub_D190();
        uint64_t v32 = v31;

        *(void *)(inited + 240) = &type metadata for String;
        *(void *)(inited + 216) = v30;
        *(void *)(inited + 224) = v32;
        uint64_t v44 = sub_D190();
        uint64_t v45 = v33;
        sub_D3E0();
        id v34 = [self valueWithNonretainedObject:v0];
        *(void *)(inited + 312) = sub_A650(0, &qword_14F20);
        *(void *)(inited + 288) = v34;
        uint64_t v44 = sub_D190();
        uint64_t v45 = v35;
        sub_D3E0();
        *(void *)(inited + 384) = &type metadata for String;
        *(void *)(inited + 360) = 0xD000000000000019;
        *(void *)(inited + 368) = 0x800000000000ED30;
        sub_62D4(inited);
        Class v36 = sub_D170().super.isa;
        swift_bridgeObjectRelease();
        [v7 setProperties:v36];

        sub_A264(&qword_14F10);
        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = xmmword_DAC0;
        *(void *)(v37 + 32) = v7;
        *(void *)(v37 + 40) = v9;
        uint64_t v44 = v37;
        sub_D1D0();
        v38 = (void *)v44;
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    else
    {
      id v9 = v7;
    }
  }
  if (qword_14E68 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_D0D0();
  sub_A1D8(v39, (uint64_t)qword_154F8);
  v24 = sub_D0C0();
  os_log_type_t v40 = sub_D290();
  if (os_log_type_enabled(v24, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_0, v24, v40, "Unable to load the password breach detection settings.", v41, 2u);
    swift_slowDealloc();
  }
  v38 = &_swiftEmptyArrayStorage;
LABEL_13:

  return v38;
}

void *sub_6D84()
{
  uint64_t v1 = sub_D090();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  NSString v6 = sub_D180();
  id v7 = [v5 groupSpecifierWithID:v6];

  if (v7)
  {
    sub_D080();
    sub_D070();
    NSString v8 = *(void (**)(char *, uint64_t))(v2 + 8);
    v8(v4, v1);
    NSString v9 = sub_D180();
    swift_bridgeObjectRelease();
    id v10 = [v5 preferenceSpecifierNamed:v9 target:v0 set:"setAutomaticStrongPasswordsEnabled:for:" get:"isAutomaticStrongPasswordsEnabled" detail:0 cell:6 edit:0];

    if (v10)
    {
      Class isa = sub_D1E0().super.super.isa;
      [v10 setProperty:isa forKey:PSAllowMultilineTitleKey];

      sub_A264(&qword_14EF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_DAD0;
      uint64_t v25 = sub_D190();
      uint64_t v26 = v13;
      sub_D3E0();
      sub_D080();
      uint64_t v14 = sub_D070();
      uint64_t v16 = v15;
      v8(v4, v1);
      *(void *)(inited + 96) = &type metadata for String;
      *(void *)(inited + 72) = v14;
      *(void *)(inited + 80) = v16;
      sub_62D4(inited);
      Class v17 = sub_D170().super.isa;
      swift_bridgeObjectRelease();
      [v7 setProperties:v17];

      sub_A264(&qword_14F10);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_DAC0;
      *(void *)(v18 + 32) = v7;
      *(void *)(v18 + 40) = v10;
      uint64_t v25 = v18;
      sub_D1D0();
      return (void *)v25;
    }
  }
  if (qword_14E68 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_D0D0();
  sub_A1D8(v20, (uint64_t)qword_154F8);
  uint64_t v21 = sub_D0C0();
  os_log_type_t v22 = sub_D290();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_0, v21, v22, "Unable to load the suggest strong passwords settings", v23, 2u);
    swift_slowDealloc();
  }

  return &_swiftEmptyArrayStorage;
}

void *sub_7178()
{
  uint64_t v1 = v0;
  sub_A264(&qword_14EE8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_D090();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v8 = self;
  NSString v9 = sub_D180();
  id v10 = [v8 groupSpecifierWithID:v9];

  if (!v10) {
    goto LABEL_7;
  }
  id v72 = v10;
  sub_D080();
  sub_D070();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  NSString v12 = sub_D180();
  swift_bridgeObjectRelease();
  id v13 = [v8 preferenceSpecifierNamed:v12 target:v1 set:"setAllowAutomaticPasskeyUpgrades:for:" get:"allowAutomaticPasskeyUpgrades" detail:0 cell:6 edit:0];

  if (!v13)
  {

LABEL_7:
    if (qword_14E68 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_D0D0();
    sub_A1D8(v61, (uint64_t)qword_154F8);
    v62 = sub_D0C0();
    os_log_type_t v63 = sub_D290();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_0, v62, v63, "Unable to load the automatic passkey upgrades settings.", v64, 2u);
      swift_slowDealloc();
    }

    return &_swiftEmptyArrayStorage;
  }
  uint64_t v66 = v1;
  Class isa = sub_D1E0().super.super.isa;
  id v65 = v13;
  [v13 setProperty:isa forKey:PSAllowMultilineTitleKey];

  sub_D080();
  uint64_t v15 = sub_D070();
  unint64_t v17 = v16;
  v11(v7, v4);
  sub_D080();
  uint64_t v18 = sub_D070();
  unint64_t v70 = v19;
  NSUInteger v71 = v18;
  v11(v7, v4);
  uint64_t v77 = v15;
  unint64_t v78 = v17;
  unint64_t v75 = 0xD000000000000011;
  unint64_t v76 = 0x800000000000EAF0;
  uint64_t v20 = sub_D050();
  uint64_t v21 = *(void *)(v20 - 8);
  os_log_type_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v68 = v21 + 56;
  v69 = v22;
  v22(v3, 1, 1, v20);
  sub_A210();
  sub_D3B0();
  unint64_t v67 = v23;
  char v25 = v24;
  unint64_t result = (void *)sub_A5F4((uint64_t)v3, &qword_14EE8);
  if (v25)
  {
    __break(1u);
  }
  else
  {
    uint64_t v77 = v15;
    unint64_t v78 = v17;
    unint64_t v75 = 0xD000000000000011;
    unint64_t v76 = 0x800000000000EAF0;
    NSUInteger v27 = v71;
    unint64_t v28 = v70;
    NSUInteger v73 = v71;
    unint64_t v74 = v70;
    uint64_t v29 = sub_D3A0();
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    unint64_t v67 = v29;
    uint64_t v77 = v29;
    unint64_t v78 = v31;
    unint64_t v32 = v31;
    unint64_t v75 = v27;
    unint64_t v76 = v28;
    v69(v3, 1, 1, v20);
    uint64_t v33 = sub_D3B0();
    unint64_t v35 = v34;
    LOBYTE(v27) = v36;
    sub_A5F4((uint64_t)v3, &qword_14EE8);
    unint64_t result = (void *)swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      uint64_t v77 = v33;
      unint64_t v78 = v35;
      unint64_t v37 = v67;
      unint64_t v75 = v67;
      unint64_t v76 = v32;
      unint64_t v38 = v32;
      swift_bridgeObjectRetain();
      sub_A264(&qword_14F00);
      sub_AA88(&qword_14F08, &qword_14F00);
      NSUInteger v71 = sub_D370();
      NSUInteger v40 = v39;
      sub_A264(&qword_14EF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_DAB0;
      uint64_t v77 = sub_D190();
      unint64_t v78 = v42;
      sub_D3E0();
      sub_A650(0, &qword_14F18);
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      uint64_t v44 = NSStringFromClass(ObjCClassFromMetadata);
      uint64_t v45 = sub_D190();
      uint64_t v47 = v46;

      *(void *)(inited + 96) = &type metadata for String;
      *(void *)(inited + 72) = v45;
      *(void *)(inited + 80) = v47;
      uint64_t v77 = sub_D190();
      unint64_t v78 = v48;
      sub_D3E0();
      *(void *)(inited + 168) = &type metadata for String;
      *(void *)(inited + 144) = v37;
      *(void *)(inited + 152) = v38;
      uint64_t v77 = sub_D190();
      unint64_t v78 = v49;
      sub_D3E0();
      v79.location = v71;
      v79.length = v40;
      v50 = NSStringFromRange(v79);
      uint64_t v51 = sub_D190();
      uint64_t v53 = v52;

      *(void *)(inited + 240) = &type metadata for String;
      *(void *)(inited + 216) = v51;
      *(void *)(inited + 224) = v53;
      uint64_t v77 = sub_D190();
      unint64_t v78 = v54;
      sub_D3E0();
      id v55 = [self valueWithNonretainedObject:v66];
      *(void *)(inited + 312) = sub_A650(0, &qword_14F20);
      *(void *)(inited + 288) = v55;
      uint64_t v77 = sub_D190();
      unint64_t v78 = v56;
      sub_D3E0();
      *(void *)(inited + 384) = &type metadata for String;
      *(void *)(inited + 360) = 0xD00000000000001CLL;
      *(void *)(inited + 368) = 0x800000000000EBF0;
      sub_62D4(inited);
      Class v57 = sub_D170().super.isa;
      swift_bridgeObjectRelease();
      id v58 = v72;
      [v72 setProperties:v57];

      sub_A264(&qword_14F10);
      uint64_t v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = xmmword_DAC0;
      id v60 = v65;
      *(void *)(v59 + 32) = v58;
      *(void *)(v59 + 40) = v60;
      uint64_t v77 = v59;
      sub_D1D0();
      return (void *)v77;
    }
  }
  __break(1u);
  return result;
}

void *sub_79F4()
{
  sub_A264(&qword_14EE8);
  __chkstk_darwin();
  uint64_t v2 = (char *)v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_D090();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = self;
  NSString v8 = sub_D180();
  id v9 = [v7 groupSpecifierWithID:v8];

  if (v9)
  {
    id v10 = [v7 preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    if (v10)
    {
      id v11 = v10;
      uint64_t v75 = v0;
      id v68 = v9;
      v66[1] = sub_A264(&qword_14EF0);
      NSString v12 = v11;
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_DAD0;
      uint64_t v80 = sub_D190();
      uint64_t v81 = v14;
      sub_D3E0();
      uint64_t v15 = type metadata accessor for PMSavePasswordsPromptPreferenceCellView();
      *(void *)(inited + 96) = sub_A264(&qword_14EF8);
      *(void *)(inited + 72) = v15;
      sub_62D4(inited);
      Class isa = sub_D170().super.isa;
      swift_bridgeObjectRelease();
      unint64_t v67 = v12;
      [v12 setProperties:isa];

      sub_D080();
      uint64_t v17 = sub_D070();
      uint64_t v19 = v18;
      uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
      v20(v6, v3);
      sub_D080();
      uint64_t v72 = sub_D070();
      unint64_t v73 = v21;
      v20(v6, v3);
      uint64_t v74 = v17;
      uint64_t v80 = v17;
      uint64_t v81 = v19;
      unint64_t v78 = 0xD000000000000018;
      unint64_t v79 = 0x800000000000E9B0;
      uint64_t v22 = sub_D050();
      uint64_t v23 = *(void *)(v22 - 8);
      char v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
      uint64_t v70 = v23 + 56;
      NSUInteger v71 = v24;
      v24(v2, 1, 1, v22);
      sub_A210();
      uint64_t v69 = sub_D3B0();
      LOBYTE(v12) = v25;
      unint64_t result = (void *)sub_A5F4((uint64_t)v2, &qword_14EE8);
      if (v12)
      {
        __break(1u);
      }
      else
      {
        uint64_t v80 = v74;
        uint64_t v81 = v19;
        unint64_t v78 = 0xD000000000000018;
        unint64_t v79 = 0x800000000000E9B0;
        unint64_t v27 = v72;
        unint64_t v28 = v73;
        uint64_t v76 = v72;
        unint64_t v77 = v73;
        uint64_t v29 = sub_D3A0();
        uint64_t v31 = v30;
        swift_bridgeObjectRelease();
        uint64_t v74 = v29;
        uint64_t v80 = v29;
        uint64_t v81 = v31;
        uint64_t v69 = v31;
        unint64_t v78 = v27;
        unint64_t v79 = v28;
        v71(v2, 1, 1, v22);
        uint64_t v32 = sub_D3B0();
        uint64_t v34 = v33;
        char v36 = v35;
        sub_A5F4((uint64_t)v2, &qword_14EE8);
        unint64_t result = (void *)swift_bridgeObjectRelease();
        if ((v36 & 1) == 0)
        {
          uint64_t v80 = v32;
          uint64_t v81 = v34;
          uint64_t v37 = v69;
          unint64_t v78 = v74;
          unint64_t v79 = v69;
          swift_bridgeObjectRetain();
          sub_A264(&qword_14F00);
          sub_AA88(&qword_14F08, &qword_14F00);
          uint64_t v38 = sub_D370();
          if (*(unsigned char *)(v75 + OBJC_IVAR___PMSettingsController_shouldShowNeverSavedSheet) == 1)
          {
            NSUInteger v40 = v38;
            NSUInteger v41 = v39;
            uint64_t v42 = swift_initStackObject();
            *(_OWORD *)(v42 + 16) = xmmword_DAB0;
            uint64_t v80 = sub_D190();
            uint64_t v81 = v43;
            sub_D3E0();
            sub_A650(0, &qword_14F18);
            ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
            uint64_t v45 = NSStringFromClass(ObjCClassFromMetadata);
            uint64_t v46 = sub_D190();
            uint64_t v48 = v47;

            *(void *)(v42 + 96) = &type metadata for String;
            *(void *)(v42 + 72) = v46;
            *(void *)(v42 + 80) = v48;
            uint64_t v80 = sub_D190();
            uint64_t v81 = v49;
            sub_D3E0();
            *(void *)(v42 + 168) = &type metadata for String;
            *(void *)(v42 + 144) = v74;
            *(void *)(v42 + 152) = v37;
            uint64_t v80 = sub_D190();
            uint64_t v81 = v50;
            sub_D3E0();
            v82.location = v40;
            v82.length = v41;
            uint64_t v51 = NSStringFromRange(v82);
            uint64_t v52 = sub_D190();
            uint64_t v54 = v53;

            *(void *)(v42 + 240) = &type metadata for String;
            *(void *)(v42 + 216) = v52;
            *(void *)(v42 + 224) = v54;
            uint64_t v80 = sub_D190();
            uint64_t v81 = v55;
            sub_D3E0();
            id v56 = [self valueWithNonretainedObject:v75];
            *(void *)(v42 + 312) = sub_A650(0, &qword_14F20);
            *(void *)(v42 + 288) = v56;
            uint64_t v80 = sub_D190();
            uint64_t v81 = v57;
            sub_D3E0();
            *(void *)(v42 + 384) = &type metadata for String;
            *(void *)(v42 + 360) = 0xD00000000000001ALL;
            *(void *)(v42 + 368) = 0x800000000000EA70;
            sub_62D4(v42);
            Class v58 = sub_D170().super.isa;
            swift_bridgeObjectRelease();
            id v59 = v68;
            [v68 setProperties:v58];
          }
          else
          {
            swift_bridgeObjectRelease();
            id v59 = v68;
          }
          v64 = v67;
          sub_A264(&qword_14F10);
          uint64_t v65 = swift_allocObject();
          *(_OWORD *)(v65 + 16) = xmmword_DAC0;
          *(void *)(v65 + 32) = v59;
          *(void *)(v65 + 40) = v64;
          uint64_t v80 = v65;
          sub_D1D0();
          return (void *)v80;
        }
      }
      __break(1u);
      return result;
    }
  }
  if (qword_14E68 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_D0D0();
  sub_A1D8(v60, (uint64_t)qword_154F8);
  uint64_t v61 = sub_D0C0();
  os_log_type_t v62 = sub_D290();
  if (os_log_type_enabled(v61, v62))
  {
    os_log_type_t v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v63 = 0;
    _os_log_impl(&dword_0, v61, v62, "Unable to load the show save passwords prompt preference settings.", v63, 2u);
    swift_slowDealloc();
  }

  return &_swiftEmptyArrayStorage;
}

id sub_82BC()
{
  sub_A074();
  swift_bridgeObjectRetain();
  NSString v0 = sub_D180();
  swift_bridgeObjectRelease();
  id v1 = [self bundleWithIdentifier:v0];

  if (!v1) {
    goto LABEL_6;
  }
  id result = [v1 privacyFlow];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = [result localizedButtonTitle];

    if (v4)
    {
      sub_D190();

      sub_A210();
      sub_D3A0();
      swift_bridgeObjectRelease();
      NSString v5 = sub_D180();
      swift_bridgeObjectRelease();

      return v5;
    }

LABEL_6:
    swift_bridgeObjectRelease();
    if (qword_14E68 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_D0D0();
    sub_A1D8(v6, (uint64_t)qword_154F8);
    id v7 = sub_D0C0();
    os_log_type_t v8 = sub_D290();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "Unable to load construct the password breach detection footer.", v9, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  __break(1u);
  return result;
}

void sub_85AC(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, SEL *a6)
{
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = a1;
  objc_msgSend(v10, *a6, objc_msgSend(v11, "BOOLValue"));
}

Class sub_8664(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v6 = self;
  id v7 = a1;
  [v6 *a4];
  v8.super.super.Class isa = sub_D1E0().super.super.isa;

  return v8.super.super.isa;
}

uint64_t sub_87B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_D0B0();
  v4[3] = swift_task_alloc();
  uint64_t v5 = sub_D090();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  sub_D210();
  v4[7] = sub_D200();
  uint64_t v7 = sub_D1F0();
  v4[8] = v7;
  v4[9] = v6;
  return _swift_task_switch(sub_88D4, v7, v6);
}

uint64_t sub_88D4()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  sub_A650(0, &qword_14F60);
  sub_D080();
  uint64_t v4 = sub_D070();
  uint64_t v6 = v5;
  v0[10] = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[11] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_89F8;
  return static LAContext.pm_authenticate(reason:)(v4, v6);
}

uint64_t sub_89F8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_8BDC;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_8B14;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_8B14()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  sub_D0A0();
  id v2 = objc_allocWithZone((Class)sub_A264(&qword_14F68));
  uint64_t v3 = (void *)sub_D130();
  [v1 presentViewController:v3 animated:1 completion:0];

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_8BDC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_8C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_D230();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_D220();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_A5F4(a1, &qword_14F48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_D1F0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_8F1C()
{
  id v1 = [self sharedStore];
  id v2 = [v1 savedAccountsWithNeverSaveMarker];

  if (v2)
  {
    sub_A650(0, &qword_14ED8);
    unint64_t v3 = sub_D1C0();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_D470();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    v0[OBJC_IVAR___PMSettingsController_shouldShowNeverSavedSheet] = v4 != 0;
    *(void *)&v0[OBJC_IVAR___PMSettingsController__specifiers] = 0;
    swift_bridgeObjectRelease();
    id v5 = [v0 specifiers];
  }
}

void sub_909C()
{
  id v1 = v0;
  id v2 = [objc_allocWithZone((Class)_ASPasskeysLearnMoreContentViewController) init];
  id v3 = [v2 navigationItem];
  sub_A650(0, &qword_14EC8);
  sub_A650(0, &qword_14ED0);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  id v5 = v2;
  v9.value.super.super.Class isa = (Class)sub_D2E0();
  v9.is_nil = 0;
  Class isa = sub_D2A0(UIBarButtonSystemItemDone, v9, v10).super.super.isa;
  objc_msgSend(v3, "setRightBarButtonItem:", isa, 0, 0, 0, sub_9394, v4);

  id v7 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v5];
  [v1 presentViewController:v7 animated:1 completion:0];
}

id sub_9280()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PMSettingsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PMSettingsController()
{
  return self;
}

uint64_t sub_935C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_9394()
{
  return [*(id *)(v0 + 16) dismissViewControllerAnimated:1 completion:0];
}

NSNumber sub_93AC()
{
  return Float._bridgeToObjectiveC()();
}

uint64_t sub_93B4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_D250();
  *(_DWORD *)a2 = 0;
  *(unsigned char *)(a2 + 4) = 1;
  return result;
}

uint64_t sub_9408(uint64_t a1, uint64_t a2)
{
  char v3 = sub_D260();
  *(_DWORD *)a2 = 0;
  *(unsigned char *)(a2 + 4) = 1;
  return v3 & 1;
}

uint64_t sub_9460@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = sub_D270();
  *a1 = v3;
  return result;
}

_DWORD *sub_9488@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

float sub_9498@<S0>(_DWORD *a1@<X8>)
{
  float result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_94A4()
{
  return sub_D4A0();
}

uint64_t sub_9544()
{
  return Float.hashValue.getter(*v0);
}

void sub_954C()
{
  if ((*v0 & 0x7FFFFFFF) != 0) {
    Swift::UInt32 v1 = *v0;
  }
  else {
    Swift::UInt32 v1 = 0;
  }
  sub_D4E0(v1);
}

uint64_t sub_9580(uint64_t a1)
{
  if ((*v1 & 0x7FFFFFFF) != 0) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  return static Hasher._hash(seed:bytes:count:)(a1, v2, 4);
}

BOOL sub_9594(float *a1, float *a2)
{
  return *a1 == *a2;
}

uint64_t sub_95A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_95C8(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_95C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_A264(&qword_14F88);
    UIMenu_optional v10 = (char *)swift_allocObject();
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
    UIMenu_optional v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_D490();
  __break(1u);
  return result;
}

unint64_t sub_9738(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_D3C0(*(void *)(v2 + 40));

  return sub_97F4(a1, v4);
}

unint64_t sub_977C(uint64_t a1, uint64_t a2)
{
  sub_D4D0();
  sub_D1A0();
  Swift::Int v4 = sub_D4F0();

  return sub_98BC(a1, a2, v4);
}

unint64_t sub_97F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_A300(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_D3D0();
      sub_A35C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_98BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    UIMenu_optional v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_D4B0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_D4B0() & 1) == 0);
    }
  }
  return v6;
}

void (*sub_99A0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_9A50(v6, a2, a3);
  return sub_9A08;
}

void sub_9A08(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_9A50(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_D3F0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_9AD0;
  }
  __break(1u);
  return result;
}

void sub_9AD0(id *a1)
{
}

uint64_t sub_9AD8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_D470();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_D470();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_AA88(&qword_14FA0, &qword_14F98);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_A264(&qword_14F98);
          uint64_t v12 = sub_99A0(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_A650(0, &qword_14F40);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_D490();
  __break(1u);
  return result;
}

void sub_9D0C()
{
  uint64_t v1 = &v0[OBJC_IVAR___PMSettingsController_passwordsAppBundleIdentifier];
  void *v1 = 0xD000000000000013;
  v1[1] = 0x800000000000EEB0;
  uint64_t v2 = &v0[OBJC_IVAR___PMSettingsController_passwordsPrivacySplashIdentifier];
  void *v2 = 0xD00000000000001ELL;
  v2[1] = 0x800000000000EED0;
  v0[OBJC_IVAR___PMSettingsController_shouldShowNeverSavedSheet] = 0;
  *(void *)&v0[OBJC_IVAR___PMSettingsController_subscriptions] = &_swiftEmptySetSingleton;
  *(void *)&v0[OBJC_IVAR___PMSettingsController_appPolicy] = 0;
  *(void *)&v0[OBJC_IVAR___PMSettingsController__specifiers] = 0;

  sub_D460();
  __break(1u);
}

void *sub_9DF0()
{
  uint64_t v0 = self;
  NSString v1 = sub_D180();
  id v2 = [v0 groupSpecifierWithID:v1];

  if (v2)
  {
    id v3 = [v0 preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:4 edit:0];
    if (v3)
    {
      id v4 = v3;
      sub_A264(&qword_14EF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_DAD0;
      sub_D190();
      sub_D3E0();
      uint64_t v6 = type metadata accessor for PMServiceNamesCellView();
      *(void *)(inited + 96) = sub_A264(&qword_14F90);
      *(void *)(inited + 72) = v6;
      sub_62D4(inited);
      Class isa = sub_D170().super.isa;
      swift_bridgeObjectRelease();
      [v4 setProperties:isa];

      sub_A264(&qword_14F10);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_DAC0;
      *(void *)(v8 + 32) = v2;
      *(void *)(v8 + 40) = v4;
      uint64_t v14 = v8;
      sub_D1D0();
      return (void *)v14;
    }
  }
  if (qword_14E68 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_D0D0();
  sub_A1D8(v10, (uint64_t)qword_154F8);
  BOOL v11 = sub_D0C0();
  os_log_type_t v12 = sub_D290();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "Unable to load the show service names settings.", v13, 2u);
    swift_slowDealloc();
  }

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_A074()
{
  uint64_t v0 = sub_D090();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self currentDevice];
  [v4 deviceClass];

  sub_D080();
  uint64_t v5 = sub_D070();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_A1D8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_A210()
{
  unint64_t result = qword_14EE0;
  if (!qword_14EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14EE0);
  }
  return result;
}

uint64_t sub_A264(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A2A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

_OWORD *sub_A2F0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_A300(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_A35C(uint64_t a1)
{
  return a1;
}

uint64_t sub_A3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_A40C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_A44C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_A500;
  return sub_87B4(a1, v4, v5, v6);
}

uint64_t sub_A500()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_A5F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_A264(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_A650(uint64_t a1, unint64_t *a2)
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

uint64_t sub_AA20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A264(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_AA88(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_A2A8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for UILayoutPriority()
{
  if (!qword_14FA8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_14FA8);
    }
  }
}

uint64_t sub_AB24()
{
  return sub_ABC0(&qword_14FB0);
}

uint64_t sub_AB58()
{
  return sub_ABC0(&qword_14FB8);
}

uint64_t sub_AB8C()
{
  return sub_ABC0(&qword_14FC0);
}

uint64_t sub_ABC0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UILayoutPriority();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_AC04()
{
  uint64_t v0 = sub_D090();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D080();
  uint64_t v4 = sub_D070();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

UIMenu sub_AD04(void *a1)
{
  uint64_t v3 = sub_D090();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v25 - v8;
  v25[1] = sub_A650(0, &qword_14ED0);
  sub_D080();
  sub_D070();
  uint64_t v26 = v10;
  BOOL v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v9, v3);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v1;
  *(void *)(v12 + 24) = a1;
  id v13 = v1;
  id v14 = a1;
  uint64_t v26 = sub_D2E0();
  sub_D080();
  sub_D080();
  sub_D060();
  v11(v7, v3);
  v11(v9, v3);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = v14;
  unint64_t v16 = v13;
  id v17 = v14;
  uint64_t v18 = (void *)sub_D2E0();
  uint64_t v19 = v18;
  uint64_t v20 = v26;
  if (v16[OBJC_IVAR____TtC17PasswordsSettings22PMServiceNamesCellView_cachedShouldShowServiceNamesForPasswordAndPasskeyItems]) {
    uint64_t v18 = (void *)v26;
  }
  [v18 setState:1];
  sub_A650(0, &qword_150D0);
  sub_A264(&qword_14F10);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_DAC0;
  *(void *)(v21 + 32) = v20;
  *(void *)(v21 + 40) = v19;
  UIMenuElementSize v27 = v21;
  sub_D1D0();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v30.value._countAndFlagsBits = 0;
  v30.value._object = 0;
  v28.value.super.Class isa = 0;
  v28.is_nil = 0;
  v22.value = 0;
  return sub_D2C0(v29, v30, v28, v22, 0xFFFFFFFFFFFFFFFFLL, v27, v24);
}

id sub_B064(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  a2[OBJC_IVAR____TtC17PasswordsSettings22PMServiceNamesCellView_cachedShouldShowServiceNamesForPasswordAndPasskeyItems] = 1;
  id v5 = [self sharedStore];
  [v5 setShouldShowServiceNamesForPasswordAndPasskeyItems:1];

  return [a2 reloadWithSpecifier:a3 animated:1];
}

id sub_B0FC(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  a2[OBJC_IVAR____TtC17PasswordsSettings22PMServiceNamesCellView_cachedShouldShowServiceNamesForPasswordAndPasskeyItems] = 0;
  id v5 = [self sharedStore];
  [v5 setShouldShowServiceNamesForPasswordAndPasskeyItems:0];

  return [a2 reloadWithSpecifier:a3 animated:1];
}

id sub_B190(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = OBJC_IVAR____TtC17PasswordsSettings22PMServiceNamesCellView_cachedShouldShowServiceNamesForPasswordAndPasskeyItems;
  uint64_t v9 = self;
  id v10 = v4;
  id v11 = [v9 sharedStore];
  unsigned __int8 v12 = [v11 shouldShowServiceNamesForPasswordAndPasskeyItems];

  *((unsigned char *)v4 + v8) = v12;
  if (a3)
  {
    NSString v13 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v17.receiver = v10;
  v17.super_class = (Class)type metadata accessor for PMServiceNamesCellView();
  id v14 = objc_msgSendSuper2(&v17, "initWithStyle:reuseIdentifier:specifier:", a1, v13, a4);

  id v15 = v14;
  if (v15) {

  }
  return v15;
}

id sub_B314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OBJC_IVAR____TtC17PasswordsSettings22PMServiceNamesCellView_cachedShouldShowServiceNamesForPasswordAndPasskeyItems;
  uint64_t v7 = self;
  id v8 = v3;
  id v9 = [v7 sharedStore];
  unsigned __int8 v10 = [v9 shouldShowServiceNamesForPasswordAndPasskeyItems];

  *((unsigned char *)v3 + v6) = v10;
  if (a3)
  {
    NSString v11 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v8;
  v14.super_class = (Class)type metadata accessor for PMServiceNamesCellView();
  id v12 = objc_msgSendSuper2(&v14, "initWithStyle:reuseIdentifier:", a1, v11);

  return v12;
}

id sub_B450(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC17PasswordsSettings22PMServiceNamesCellView_cachedShouldShowServiceNamesForPasswordAndPasskeyItems;
  uint64_t v4 = self;
  id v5 = v1;
  id v6 = [v4 sharedStore];
  unsigned __int8 v7 = [v6 shouldShowServiceNamesForPasswordAndPasskeyItems];

  *((unsigned char *)v1 + v3) = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for PMServiceNamesCellView();
  id v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

id sub_B530()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PMServiceNamesCellView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PMServiceNamesCellView()
{
  return self;
}

uint64_t sub_B588()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_B5C8(uint64_t a1)
{
  return sub_B064(a1, *(unsigned char **)(v1 + 16), *(void *)(v1 + 24));
}

id sub_B5D0(uint64_t a1)
{
  return sub_B0FC(a1, *(unsigned char **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_B5DC()
{
  uint64_t v0 = sub_D090();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D080();
  uint64_t v4 = sub_D070();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

Class sub_B6E4(void *a1)
{
  uint64_t v3 = sub_D090();
  uint64_t v26 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, "pm_defaults");
  sub_A650(0, &qword_14ED0);
  sub_D080();
  sub_D070();
  id v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  v8(v6, v3);
  id v9 = (void *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v1;
  v9[4] = a1;
  id v10 = v7;
  id v11 = v1;
  id v12 = a1;
  uint64_t v13 = sub_D2E0();
  sub_D080();
  sub_D070();
  v8(v6, v26);
  objc_super v14 = (void *)swift_allocObject();
  v14[2] = v10;
  v14[3] = v11;
  v14[4] = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  uint64_t v18 = sub_D2E0();
  uint64_t v19 = (char *)[v15 integerForKey:WBSPasswordSavingBehaviorKey];
  uint64_t v20 = (void *)v13;
  if (!v19) {
    goto LABEL_4;
  }
  if (v19 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v20 = (void *)v18;
LABEL_4:
    objc_msgSend(v20, "setState:", 1, v26);
  }
  sub_A650(0, &qword_150D0);
  sub_A264(&qword_14F10);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_DAC0;
  *(void *)(v21 + 32) = v13;
  *(void *)(v21 + 40) = v18;
  UIMenuElementSize v27 = v21;
  sub_D1D0();
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v30.value._countAndFlagsBits = 0;
  v30.value._object = 0;
  v28.value.super.Class isa = 0;
  v28.is_nil = 0;
  v22.value = 0;
  Class isa = sub_D2C0(v29, v30, v28, v22, 0xFFFFFFFFFFFFFFFFLL, v27, v25).super.super.isa;

  return isa;
}

id sub_BA58(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    NSString v7 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for PMSavePasswordsPromptPreferenceCellView();
  id v8 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:specifier:", a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_BC40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PMSavePasswordsPromptPreferenceCellView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PMSavePasswordsPromptPreferenceCellView()
{
  return self;
}

id sub_BC9C(uint64_t a1)
{
  return sub_BCF8(a1, 0);
}

uint64_t sub_BCA8()
{
  return _swift_deallocObject(v0, 40, 7);
}

id sub_BCF0(uint64_t a1)
{
  return sub_BCF8(a1, 1);
}

id sub_BCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)v2[2];
  uint64_t v4 = (void *)v2[3];
  uint64_t v5 = v2[4];
  [v3 setInteger:a2 forKey:WBSPasswordSavingBehaviorKey];

  return [v4 reloadWithSpecifier:v5 animated:1];
}

void sub_BD5C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView];
  if (v1)
  {
    id v6 = v1;
    id v2 = [v0 traitCollection];
    id v3 = [v2 preferredContentSizeCategory];

    LOBYTE(v2) = sub_D2B0();
    uint64_t v4 = v2 & 1;
    if (v2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 3;
    }
    [v6 setAxis:v4];
    [v6 setAlignment:v5];
    [v6 setDistribution:v4];
    [v0 setNeedsLayout];
  }
}

void sub_BE6C(uint64_t a1)
{
  id v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_D300();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  NSString v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_A264(&qword_151A0);
  __chkstk_darwin(v8 - 8);
  id v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_D350();
  uint64_t v65 = *(void *)(v11 - 8);
  uint64_t v66 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  objc_super v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v16 = (char *)&v61 - v15;
  id v17 = (objc_class *)type metadata accessor for PMPopUpMenuCellView();
  v70.receiver = v1;
  v70.super_class = v17;
  uint64_t v64 = a1;
  objc_msgSendSuper2(&v70, "refreshCellContentsWithSpecifier:", a1);
  uint64_t v18 = OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_traitChangeRegistration;
  if (!*(void *)((char *)v1 + OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_traitChangeRegistration))
  {
    sub_A264((uint64_t *)&unk_151D0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_DAD0;
    *(void *)(v19 + 32) = sub_D120();
    *(void *)(v19 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
    uint64_t v20 = sub_D2D0();
    swift_bridgeObjectRelease();
    *(void *)((char *)v2 + v18) = v20;
    swift_unknownObjectRelease();
  }
  uint64_t v21 = OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_popUpButton;
  UIMenuIdentifier_optional v22 = *(void **)((char *)v2 + OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_popUpButton);
  if (v22)
  {
    id v23 = v22;
    id v24 = [v23 superview];

    if (v24)
    {
      if (v64)
      {
        Swift::OpaquePointer v25 = (void *)(*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v2) - 8])();
        [v23 setMenu:v25];

        return;
      }
      goto LABEL_12;
    }
  }
  sub_D340();
  sub_D100();
  uint64_t v26 = sub_D110();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 0, 1, v26);
  sub_D330();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for UIButton.Configuration.TitleAlignment.trailing(_:), v4);
  sub_D310();
  id v27 = [self secondaryLabelColor];
  sub_D320();
  sub_D2F0();
  sub_A650(0, &qword_151A8);
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v14, v16, v66);
  UIImage_optional v28 = (void *)sub_D360();
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 setShowsMenuAsPrimaryAction:1];
  [v28 setChangesSelectionAsPrimaryAction:1];
  [v28 setContentHorizontalAlignment:5];
  Swift::String v29 = *(void **)((char *)v2 + v21);
  *(void *)((char *)v2 + v21) = v28;
  id v30 = v28;

  id v31 = [objc_allocWithZone((Class)UILabel) init];
  (*(void (**)(void))&stru_B8.sectname[swift_isaMask & *v2])();
  NSString v32 = sub_D180();
  swift_bridgeObjectRelease();
  [v31 setText:v32];

  id v33 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  [v31 setFont:v33];

  [v31 setNumberOfLines:0];
  [v31 setLineBreakMode:0];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  type metadata accessor for UILayoutPriority();
  int v69 = 1144750080;
  int v68 = 1130430464;
  sub_CCE4();
  sub_D0F0();
  LODWORD(v34) = v67;
  [v31 setContentHuggingPriority:0 forAxis:v34];
  LODWORD(v35) = 1132068864;
  [v31 setContentCompressionResistancePriority:0 forAxis:v35];
  sub_A264(&qword_14F10);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_DAC0;
  *(void *)(v36 + 32) = v31;
  *(void *)(v36 + 40) = v30;
  uint64_t v67 = v36;
  sub_D1D0();
  id v37 = objc_allocWithZone((Class)UIStackView);
  sub_A650(0, &qword_151C0);
  id v38 = v30;
  id v62 = v31;
  Class isa = sub_D1B0().super.isa;
  swift_bridgeObjectRelease();
  id v40 = [v37 initWithArrangedSubviews:isa];

  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v40 setAxis:0];
  [v40 setAlignment:3];
  [v40 setSpacing:4.0];
  id v41 = [v2 contentView];
  [v41 addSubview:v40];

  uint64_t v42 = *(void **)((char *)v2 + OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView);
  *(void *)((char *)v2 + OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView) = v40;
  id v43 = v40;

  id v44 = [v2 contentView];
  id v45 = [v44 layoutMarginsGuide];

  id v63 = self;
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_DCF0;
  id v47 = [v43 topAnchor];
  id v48 = [v45 topAnchor];
  id v49 = [v47 constraintEqualToAnchor:v48];

  *(void *)(v46 + 32) = v49;
  id v50 = [v43 rightAnchor];
  id v51 = [v45 rightAnchor];
  id v52 = [v50 constraintEqualToAnchor:v51];

  *(void *)(v46 + 40) = v52;
  id v53 = [v43 bottomAnchor];
  id v54 = [v45 bottomAnchor];
  id v55 = [v53 constraintEqualToAnchor:v54];

  *(void *)(v46 + 48) = v55;
  id v56 = [v43 leftAnchor];
  id v57 = [v45 leftAnchor];
  id v58 = [v56 constraintEqualToAnchor:v57];

  *(void *)(v46 + 56) = v58;
  uint64_t v67 = v46;
  sub_D1D0();
  sub_A650(0, &qword_151C8);
  Class v59 = sub_D1B0().super.isa;
  swift_bridgeObjectRelease();
  [v63 activateConstraints:v59];

  if (!v64)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v60 = (void *)(*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & *v2) - 8])();
  [v38 setMenu:v60];

  [v2 _setPopupMenuButton:v38];
  sub_BD5C();
  [v2 setNeedsLayout];

  (*(void (**)(char *, uint64_t))(v65 + 8))(v16, v66);
}

void sub_C8DC()
{
}

void sub_C938()
{
}

id sub_C994(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_traitChangeRegistration] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_popUpButton] = 0;
  if (a3)
  {
    NSString v7 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for PMPopUpMenuCellView();
  id v8 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:specifier:", a1, v7, a4);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id sub_CAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_traitChangeRegistration] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_popUpButton] = 0;
  if (a3)
  {
    NSString v5 = sub_D180();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for PMPopUpMenuCellView();
  id v6 = objc_msgSendSuper2(&v8, "initWithStyle:reuseIdentifier:", a1, v5);

  return v6;
}

id sub_CC30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PMPopUpMenuCellView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PMPopUpMenuCellView()
{
  return self;
}

unint64_t sub_CCE4()
{
  unint64_t result = qword_151B0;
  if (!qword_151B0)
  {
    type metadata accessor for UILayoutPriority();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_151B0);
  }
  return result;
}

void sub_CD40(char *a1)
{
  uint64_t v1 = *(void **)&a1[OBJC_IVAR____TtC17PasswordsSettings19PMPopUpMenuCellView_stackView];
  if (v1)
  {
    id v7 = v1;
    id v3 = [a1 traitCollection];
    id v4 = [v3 preferredContentSizeCategory];

    LOBYTE(v3) = sub_D2B0();
    uint64_t v5 = v3 & 1;
    if (v3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 3;
    }
    [v7 setAxis:v5];
    [v7 setAlignment:v6];
    [v7 setDistribution:v5];
    [a1 setNeedsLayout];
  }
}

uint64_t sub_CE54()
{
  sub_CFB0();
  uint64_t result = sub_D390();
  qword_154F0 = result;
  return result;
}

uint64_t sub_CEC0()
{
  uint64_t v0 = sub_D0D0();
  sub_CF4C(v0, qword_154F8);
  sub_A1D8(v0, (uint64_t)qword_154F8);
  if (qword_14E60 != -1) {
    swift_once();
  }
  id v1 = (id)qword_154F0;
  return sub_D0E0();
}

uint64_t *sub_CF4C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_CFB0()
{
  unint64_t result = qword_151E0;
  if (!qword_151E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_151E0);
  }
  return result;
}

uint64_t sub_CFF0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_D000()
{
  return type metadata accessor for LocalizedStringResource();
}

void sub_D010(NSURL *retstr@<X8>)
{
}

uint64_t sub_D020()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D030()
{
  return URL.init(string:)();
}

uint64_t sub_D040()
{
  return type metadata accessor for URL();
}

uint64_t sub_D050()
{
  return type metadata accessor for Locale();
}

uint64_t sub_D060()
{
  return WBSLookUpLocalizedString(_:key:dsohandle:)();
}

uint64_t sub_D070()
{
  return WBSLookUpLocalizedString(_:dsohandle:)();
}

uint64_t sub_D080()
{
  return WBSLocalizedStringLiteral.init(stringLiteral:)();
}

uint64_t sub_D090()
{
  return type metadata accessor for WBSLocalizedStringLiteral();
}

uint64_t sub_D0A0()
{
  return PMNeverSavedPasswordsView.init()();
}

uint64_t sub_D0B0()
{
  return type metadata accessor for PMNeverSavedPasswordsView();
}

uint64_t sub_D0C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_D0D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_D0E0()
{
  return Logger.init(_:)();
}

uint64_t sub_D0F0()
{
  return static _UIKitNumericRawRepresentable.+ infix(_:_:)();
}

uint64_t sub_D100()
{
  return static UIConfigurationColorTransformer.grayscale.getter();
}

uint64_t sub_D110()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_D120()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_D130()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_D140()
{
  return SettingsEventCenter.emitNavigationEventForApplicationSetting(associatedApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_D150()
{
  return static SettingsEventCenter.default.getter();
}

uint64_t sub_D160()
{
  return type metadata accessor for SettingsEventCenter();
}

NSDictionary sub_D170()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_D180()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_D190()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D1A0()
{
  return String.hash(into:)();
}

NSArray sub_D1B0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_D1C0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D1D0()
{
  return specialized Array._endMutation()();
}

NSNumber sub_D1E0()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_D1F0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_D200()
{
  return static MainActor.shared.getter();
}

uint64_t sub_D210()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_D220()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_D230()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_D250()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_D260()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_D270()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D290()
{
  return static os_log_type_t.error.getter();
}

UIBarButtonItem sub_D2A0(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

uint64_t sub_D2B0()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

UIMenu sub_D2C0(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_D2D0()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_D2E0()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_D2F0()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t sub_D300()
{
  return type metadata accessor for UIButton.Configuration.TitleAlignment();
}

uint64_t sub_D310()
{
  return UIButton.Configuration.titleAlignment.setter();
}

uint64_t sub_D320()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_D330()
{
  return UIButton.Configuration.indicatorColorTransformer.setter();
}

uint64_t sub_D340()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_D350()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_D360()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_D370()
{
  return _NSRange.init<A, B>(_:in:)();
}

uint64_t sub_D390()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_D3A0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_D3B0()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

Swift::Int sub_D3C0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_D3D0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_D3E0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_D3F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_D400()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_D410()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_D420()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_D430()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_D440()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_D450()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_D460()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_D470()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_D480()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_D490()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_D4A0()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_D4B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_D4D0()
{
  return Hasher.init(_seed:)();
}

void sub_D4E0(Swift::UInt32 a1)
{
}

Swift::Int sub_D4F0()
{
  return Hasher._finalize()();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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