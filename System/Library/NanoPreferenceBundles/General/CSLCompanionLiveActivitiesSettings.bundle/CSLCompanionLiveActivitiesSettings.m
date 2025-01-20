id sub_2288(uint64_t a1, void *a2)
{
  return _[a2 setPrivacyDuringAlwaysOnForLiveActivities:*(unsigned char *)(a1 + 32) == 0];
}

void sub_27B4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSArray) initWithArray:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

void sub_2AE0(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

uint64_t sub_2AFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = cslprf_app_library_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v7 bundleIdentifier];
      *(_DWORD *)buf = 138412802;
      id v23 = v9;
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "[%@] adding %@; %@", buf, 0x20u);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_2D30;
    v18[3] = &unk_1CBF0;
    v14 = *(void **)(a1 + 48);
    id v19 = *(id *)(a1 + 56);
    id v20 = v7;
    [v14 _withLock:v18];
  }
  else
  {
    v15 = cslprf_app_library_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "[%@] done enumerating", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  os_activity_scope_leave(&state);

  return v11;
}

void sub_2D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_2D30(uint64_t a1)
{
  return _[*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_2D3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2D54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2D6C(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2F0C;
  v8[3] = &unk_1CC90;
  id v4 = v2;
  id v9 = v4;
  [v3 enumerateObjectsUsingBlock:v8];
  v5 = [v4 allValues];
  v6 = cslprf_app_library_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Completed enumeration with apps: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 48) _setApplications:v5];
  id v7 = [*(id *)(a1 + 48) delegate];
  [v7 dataSourceDidUpdate:*(void *)(a1 + 48)];

  os_activity_scope_leave(&state);
}

void sub_2EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_2F0C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

uint64_t sub_31C0(uint64_t a1, void *a2)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11.value._object = (void *)0x8000000000018010;
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  v11.value._countAndFlagsBits = 0xD00000000000001BLL;
  v6.super.isa = v5;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  uint64_t v7 = sub_15190(v10, v11, v6, v12, v9);

  return v7;
}

unint64_t sub_327C()
{
  return 0xD00000000000001BLL;
}

id sub_3298()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];

  return v1;
}

id sub_337C()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettingsP33_9D89BC2E6FE972A30DACB6DEFECBFF7527BacklightSettingsSwiftModel_backlightSettingsModel) privacyDuringAlwaysOnForLiveActivities];
}

char *sub_33A8()
{
  uint64_t v1 = OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettingsP33_9D89BC2E6FE972A30DACB6DEFECBFF7527BacklightSettingsSwiftModel_backlightSettingsModel;
  id v2 = objc_allocWithZone((Class)CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource);
  id v3 = v0;
  *(void *)&v0[v1] = [v2 init];

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for BacklightSettingsSwiftModel();
  id v4 = (char *)objc_msgSendSuper2(&v10, "init");
  uint64_t v5 = OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettingsP33_9D89BC2E6FE972A30DACB6DEFECBFF7527BacklightSettingsSwiftModel_backlightSettingsModel;
  NSBundle v6 = *(void **)&v4[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettingsP33_9D89BC2E6FE972A30DACB6DEFECBFF7527BacklightSettingsSwiftModel_backlightSettingsModel];
  uint64_t v7 = v4;
  [v6 setDelegate:v7];
  id v8 = *(id *)&v4[v5];
  [v8 start];

  return v7;
}

id sub_3498()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BacklightSettingsSwiftModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_34DC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BacklightSettingsSwiftModel();
  uint64_t result = sub_151E0();
  *a1 = result;
  return result;
}

uint64_t sub_3518()
{
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_3584();

  return sub_152A0();
}

uint64_t type metadata accessor for BacklightSettingsSwiftModel()
{
  return self;
}

unint64_t sub_3584()
{
  unint64_t result = qword_22B60[0];
  if (!qword_22B60[0])
  {
    type metadata accessor for BacklightSettingsSwiftModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_22B60);
  }
  return result;
}

id sub_35D8()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for BacklightSettingsSwiftModel());

  return [v0 init];
}

uint64_t sub_360C()
{
  return sub_15400();
}

uint64_t sub_36C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_389C(&qword_22228);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  sub_389C(&qword_222F0);
  uint64_t v8 = sub_38E0(&qword_22238);
  uint64_t v9 = sub_43A4(&qword_22240, &qword_22238);
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  swift_getOpaqueTypeConformance2();
  sub_155A0();
  uint64_t v15 = sub_31C0(0xD000000000000020, (void *)0x80000000000180D0);
  uint64_t v16 = v10;
  sub_3928();
  sub_3A08();
  sub_15480();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_3894()
{
  return sub_36C4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_389C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_38E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_3928()
{
  unint64_t result = qword_22230;
  if (!qword_22230)
  {
    sub_38E0(&qword_22228);
    sub_38E0(&qword_22238);
    sub_43A4(&qword_22240, &qword_22238);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22230);
  }
  return result;
}

unint64_t sub_3A08()
{
  unint64_t result = qword_22248;
  if (!qword_22248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22248);
  }
  return result;
}

uint64_t sub_3A5C(uint64_t a1)
{
  uint64_t v2 = sub_153E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_389C(&qword_22238);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_15330();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_389C(&qword_222F8);
  sub_3C08(a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_153D0();
  sub_43A4(&qword_22240, &qword_22238);
  sub_15490();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_4344((uint64_t)v8);
}

uint64_t sub_3C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v32[3] = a1;
  v32[0] = a2;
  uint64_t v2 = sub_389C(&qword_22300);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  uint64_t v38 = v3;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_389C(&qword_22308);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v39 = (char *)v32 - v11;
  uint64_t v40 = sub_31C0(0xD000000000000020, (void *)0x80000000000180D0);
  uint64_t v41 = v12;
  sub_3A08();
  uint64_t v13 = sub_15410();
  uint64_t v34 = v14;
  uint64_t v35 = v13;
  uint64_t v36 = v15;
  int v33 = v16 & 1;
  uint64_t v17 = sub_15380();
  v32[1] = v18;
  v32[2] = v17;
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_3584();
  id v19 = (void *)sub_152B0();
  swift_getKeyPath();
  sub_152C0();
  swift_release();

  sub_15530();
  sub_43A4(&qword_22310, &qword_22300);
  uint64_t v20 = v37;
  sub_15450();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v20);
  uint64_t v21 = v7;
  v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  id v23 = v39;
  uint64_t v24 = v6;
  v22(v39, v10, v6);
  v25 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v25(v10, v23, v6);
  uint64_t v27 = v34;
  uint64_t v26 = v35;
  uint64_t v28 = v32[0];
  *(void *)v32[0] = v35;
  *(void *)(v28 + 8) = v27;
  LOBYTE(v6) = v33;
  *(unsigned char *)(v28 + 16) = v33;
  *(void *)(v28 + 24) = v36;
  *(void *)(v28 + 32) = 0;
  *(unsigned char *)(v28 + 40) = 1;
  v29 = (char *)(v28 + *(int *)(sub_389C(&qword_22318) + 64));
  v25(v29, v10, v24);
  sub_43E8(v26, v27, v6);
  v30 = *(void (**)(char *, uint64_t))(v21 + 8);
  swift_bridgeObjectRetain();
  v30(v39, v24);
  v30(v10, v24);
  sub_43F8(v26, v27, v6);
  return swift_bridgeObjectRelease();
}

id sub_3F94@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*(id *)(*a1+ OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettingsP33_9D89BC2E6FE972A30DACB6DEFECBFF7527BacklightSettingsSwiftModel_backlightSettingsModel) privacyDuringAlwaysOnForLiveActivities];
  *a2 = (_BYTE)result;
  return result;
}

id sub_3FD4(unsigned __int8 *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_3584();
  sub_151E0();
  sub_151F0();
  swift_release();
  uint64_t v4 = *(void **)(v3
                + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettingsP33_9D89BC2E6FE972A30DACB6DEFECBFF7527BacklightSettingsSwiftModel_backlightSettingsModel);

  return [v4 setPrivacyDuringAlwaysOnForLiveActivities:v2];
}

uint64_t sub_4054()
{
  [objc_allocWithZone((Class)type metadata accessor for BacklightSettingsSwiftModel()) init];
  sub_3584();

  return sub_152A0();
}

uint64_t sub_40AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_40D0()
{
  return sub_15460();
}

uint64_t sub_40EC()
{
  return sub_15400();
}

void *initializeBufferWithCopyOfBuffer for LiveActivitiesAODPrivacySettingsView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for LiveActivitiesAODPrivacySettingsView(uint64_t a1)
{
}

void *assignWithCopy for LiveActivitiesAODPrivacySettingsView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

__n128 initializeWithTake for LiveActivitiesAODPrivacySettingsView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for LiveActivitiesAODPrivacySettingsView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitiesAODPrivacySettingsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitiesAODPrivacySettingsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitiesAODPrivacySettingsView()
{
  return &type metadata for LiveActivitiesAODPrivacySettingsView;
}

uint64_t sub_42F4()
{
  return sub_43A4(&qword_222E0, &qword_222E8);
}

void *sub_4330()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_433C()
{
  return sub_3A5C(*(void *)(v0 + 16));
}

uint64_t sub_4344(uint64_t a1)
{
  uint64_t v2 = sub_389C(&qword_22238);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_43A4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_38E0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_43E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_43F8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_4410()
{
  return 0;
}

uint64_t sub_441C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_444C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_4484())()
{
  return nullsub_1;
}

uint64_t sub_44A8()
{
  return 0;
}

uint64_t sub_44B0()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_44B8(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*sub_44C0())()
{
  return nullsub_1;
}

double sub_44E0@<D0>(uint64_t a1@<X8>)
{
  sub_154E0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_4534()
{
  return 0;
}

uint64_t sub_4548()
{
  sub_458C();
  sub_45CC();

  return sub_152E0();
}

unint64_t sub_458C()
{
  unint64_t result = qword_22380;
  if (!qword_22380)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_22380);
  }
  return result;
}

unint64_t sub_45CC()
{
  unint64_t result = qword_22388;
  if (!qword_22388)
  {
    sub_458C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22388);
  }
  return result;
}

uint64_t sub_4624(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  long long v6 = *(_OWORD *)(v2 + 40);
  long long v32 = *(_OWORD *)(v2 + 24);
  long long v33 = v6;
  uint64_t v34 = *(uint64_t (**)(void *, uint64_t))(v2 + 56);
  long long v7 = *(_OWORD *)(v2 + 40);
  long long v24 = *(_OWORD *)(v2 + 24);
  long long v25 = v7;
  uint64_t v26 = *(uint64_t (**)(void *, uint64_t))(v2 + 56);
  sub_389C(&qword_22390);
  sub_154F0();
  swift_unknownObjectRelease();
  uint64_t result = sub_50A0(*(unint64_t *)&v36[24]);
  if (*(void *)&v36[16])
  {
    if (a2)
    {
      if (*(_OWORD *)&v36[8] == __PAIR128__(a2, a1)) {
        return swift_bridgeObjectRelease();
      }
      char v9 = sub_15710();
      uint64_t result = swift_bridgeObjectRelease();
      if (v9) {
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else if (!a2)
  {
    return result;
  }
  long long v24 = v32;
  long long v25 = v33;
  uint64_t v26 = v34;
  sub_154F0();
  swift_bridgeObjectRelease();
  sub_50A0(*(unint64_t *)&v36[24]);
  if (*(void *)v36)
  {
    objc_msgSend(*(id *)v36, "invalidate", v24, v25, v26);
    swift_unknownObjectRelease();
  }
  *(_OWORD *)uint64_t v36 = v32;
  *(_OWORD *)&v36[16] = v33;
  sub_60DC((uint64_t)v36, (uint64_t)v39, &qword_22438);
  sub_60DC((uint64_t)&v36[8], (uint64_t)v38, &qword_22440);
  sub_60CC(&v36[24], &v37);
  sub_60DC((uint64_t)&v34, (uint64_t)v35, &qword_22448);
  if (a2)
  {
    uint64_t v10 = *(void **)(v2 + 64);
    if (!v10)
    {
      sub_458C();
      sub_45CC();
      swift_bridgeObjectRetain();
      uint64_t result = sub_152D0();
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    id v11 = [v10 iconCache];
    NSString v12 = sub_155E0();
    id v13 = [v11 iconForName:v12 fallBackToPersistentStoreIfNecessary:0];

    if (v13)
    {
      sub_6140((uint64_t)v39);
      sub_616C((uint64_t)v38);
      sub_6198(&v37);
      sub_61C4((uint64_t)v35);
      sub_154F0();
      swift_bridgeObjectRelease();
      sub_15500();
      sub_61F0((uint64_t)v39);
      sub_621C((uint64_t)v38);
      sub_6248(&v37);
      sub_6274((uint64_t)v35);
      sub_6140((uint64_t)v39);
      sub_616C((uint64_t)v38);
      sub_6198(&v37);
      sub_61C4((uint64_t)v35);
      sub_154F0();
      swift_unknownObjectRelease();
      sub_15500();
      sub_61F0((uint64_t)v39);
      sub_621C((uint64_t)v38);
      sub_6248(&v37);
      sub_6274((uint64_t)v35);
      id v14 = v13;
      uint64_t v15 = sub_154A0();
      sub_6140((uint64_t)v39);
      sub_616C((uint64_t)v38);
      sub_6198(&v37);
      sub_61C4((uint64_t)v35);
      sub_154F0();
      sub_50A0(v31);
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v30;
      *(void *)&v28[16] = *(void *)&v30[16];
      unint64_t v29 = v15;
      sub_15500();
    }
    else
    {
      id v16 = v10;
      NSString v17 = sub_155E0();
      uint64_t v18 = *(unsigned __int8 *)(v3 + 16);
      id v19 = (_OWORD *)swift_allocObject();
      long long v20 = *(_OWORD *)(v3 + 48);
      v19[3] = *(_OWORD *)(v3 + 32);
      v19[4] = v20;
      v19[5] = *(_OWORD *)(v3 + 64);
      long long v21 = *(_OWORD *)(v3 + 16);
      v19[1] = *(_OWORD *)v3;
      v19[2] = v21;
      uint64_t v26 = sub_6304;
      uint64_t v27 = v19;
      *(void *)&long long v24 = _NSConcreteStackBlock;
      *((void *)&v24 + 1) = 1107296256;
      *(void *)&long long v25 = sub_4E30;
      *((void *)&v25 + 1) = &unk_1D118;
      v22 = _Block_copy(&v24);
      sub_519C(v3);
      swift_release();
      id v23 = [v16 iconFetchTaskForBundleIdentifier:v17 isPhoneApp:v18 completion:v22];
      _Block_release(v22);

      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      sub_6140((uint64_t)v39);
      sub_616C((uint64_t)v38);
      sub_6198(&v37);
      sub_61C4((uint64_t)v35);
      swift_unknownObjectRetain();
      sub_154F0();
      swift_unknownObjectRelease();
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      *(void *)uint64_t v28 = v23;
      *(_OWORD *)&v28[8] = *(_OWORD *)&v30[8];
      unint64_t v29 = v31;
      sub_15500();
      sub_61F0((uint64_t)v39);
      sub_621C((uint64_t)v38);
      sub_6248(&v37);
      sub_6274((uint64_t)v35);
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      sub_6140((uint64_t)v39);
      sub_616C((uint64_t)v38);
      sub_6198(&v37);
      sub_61C4((uint64_t)v35);
      sub_154F0();
      swift_bridgeObjectRelease();
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      *(void *)uint64_t v28 = *(void *)v30;
      *(void *)&v28[8] = a1;
      *(void *)&v28[16] = a2;
      unint64_t v29 = v31;
      sub_15500();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_6140((uint64_t)v39);
    sub_616C((uint64_t)v38);
    sub_6198(&v37);
    sub_61C4((uint64_t)v35);
    sub_154F0();
    swift_unknownObjectRelease();
    sub_15500();
    sub_61F0((uint64_t)v39);
    sub_621C((uint64_t)v38);
    sub_6248(&v37);
    sub_6274((uint64_t)v35);
    sub_6140((uint64_t)v39);
    sub_616C((uint64_t)v38);
    sub_6198(&v37);
    sub_61C4((uint64_t)v35);
    sub_154F0();
    swift_bridgeObjectRelease();
    sub_15500();
    sub_61F0((uint64_t)v39);
    sub_621C((uint64_t)v38);
    sub_6248(&v37);
    sub_6274((uint64_t)v35);
    sub_6140((uint64_t)v39);
    sub_616C((uint64_t)v38);
    sub_6198(&v37);
    sub_61C4((uint64_t)v35);
    sub_154F0();
    sub_50A0(v31);
    long long v24 = v32;
    long long v25 = v33;
    uint64_t v26 = v34;
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v30;
    *(void *)&v28[16] = *(void *)&v30[16];
    unint64_t v29 = 0x8000000000000000;
    sub_15500();
  }
  sub_61F0((uint64_t)v39);
  sub_621C((uint64_t)v38);
  sub_6248(&v37);
  return sub_6274((uint64_t)v35);
}

void sub_4E30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_4EBC@<X0>(uint64_t *a1@<X8>)
{
  sub_389C(&qword_22390);
  sub_154F0();
  sub_5080(v19);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_50A0(v19);
  sub_458C();
  sub_45CC();
  uint64_t v3 = sub_152E0();
  uint64_t v5 = v4;
  id v6 = (_OWORD *)swift_allocObject();
  long long v7 = *(_OWORD *)(v1 + 48);
  v6[3] = *(_OWORD *)(v1 + 32);
  v6[4] = v7;
  v6[5] = *(_OWORD *)(v1 + 64);
  long long v8 = *(_OWORD *)(v1 + 16);
  v6[1] = *(_OWORD *)v1;
  v6[2] = v8;
  char v9 = (_OWORD *)swift_allocObject();
  long long v10 = *(_OWORD *)(v1 + 16);
  long long v11 = *(_OWORD *)(v1 + 48);
  long long v12 = *(_OWORD *)(v1 + 64);
  v9[3] = *(_OWORD *)(v1 + 32);
  v9[4] = v11;
  v9[5] = v12;
  v9[1] = *(_OWORD *)v1;
  v9[2] = v10;
  uint64_t v14 = *(void *)v1;
  uint64_t v13 = *(void *)(v1 + 8);
  uint64_t v15 = (_OWORD *)swift_allocObject();
  long long v16 = *(_OWORD *)(v1 + 48);
  v15[3] = *(_OWORD *)(v1 + 32);
  v15[4] = v16;
  v15[5] = *(_OWORD *)(v1 + 64);
  long long v17 = *(_OWORD *)(v1 + 16);
  v15[1] = *(_OWORD *)v1;
  v15[2] = v17;
  *a1 = v3;
  a1[1] = v5;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = v19;
  a1[5] = (uint64_t)sub_50C4;
  a1[6] = (uint64_t)v6;
  a1[7] = (uint64_t)sub_5148;
  a1[8] = (uint64_t)v9;
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = v14;
  a1[12] = v13;
  a1[13] = (uint64_t)sub_5170;
  a1[14] = (uint64_t)v15;
  sub_519C(v1);
  sub_519C(v1);
  sub_519C(v1);
  return swift_bridgeObjectRetain();
}

unint64_t sub_5080(unint64_t result)
{
  if (result >> 62 == 1) {
    return swift_errorRetain();
  }
  if (!(result >> 62)) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_50A0(unint64_t result)
{
  if (result >> 62 == 1) {
    return _swift_errorRelease(result & 0x3FFFFFFFFFFFFFFFLL);
  }
  if (!(result >> 62)) {
    return swift_release();
  }
  return result;
}

unint64_t sub_50C4()
{
  long long v2 = *(_OWORD *)(v0 + 40);
  long long v3 = *(_OWORD *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 72);
  sub_389C(&qword_22390);
  sub_154F0();
  swift_bridgeObjectRelease();
  unint64_t result = sub_50A0(v6);
  if (v5)
  {
    objc_msgSend(v5, "invalidate", v2, v3, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_5148()
{
  return sub_4624(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_5170(unint64_t *a1)
{
  return sub_4624(*a1, a1[1]);
}

uint64_t sub_519C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  long long v3 = *(void **)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_5080(v2);
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t sub_520C@<X0>(void *a1@<X0>, unint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (!(a2 >> 62))
  {
    swift_retain();
LABEL_5:
    uint64_t result = sub_153C0();
    *(void *)a3 = v6;
    *(unsigned char *)(a3 + 8) = v7;
    return result;
  }
  if (a1)
  {
    id v4 = [a1 genericIcon];
    sub_154A0();
    goto LABEL_5;
  }
  sub_458C();
  sub_45CC();
  uint64_t result = sub_152D0();
  __break(1u);
  return result;
}

uint64_t sub_52D4@<X0>(uint64_t a1@<X8>)
{
  return sub_520C(*(void **)v1, *(void *)(v1 + 16), a1);
}

__n128 sub_52F0@<Q0>(uint64_t a1@<X8>)
{
  sub_154E0();
  sub_458C();
  sub_45CC();
  uint64_t v2 = sub_152E0();
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v5;
  __n128 result = v6;
  *(__n128 *)(a1 + 40) = v6;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v2;
  *(void *)(a1 + 72) = v4;
  return result;
}

__n128 sub_538C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  sub_154E0();
  sub_458C();
  sub_45CC();
  uint64_t v8 = sub_152E0();
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = a3;
  *(_OWORD *)(a4 + 24) = v11;
  __n128 result = v12;
  *(__n128 *)(a4 + 40) = v12;
  *(void *)(a4 + 56) = v13;
  *(void *)(a4 + 64) = v8;
  *(void *)(a4 + 72) = v10;
  return result;
}

uint64_t sub_543C@<X0>(uint64_t *a1@<X8>)
{
  return sub_4EBC(a1);
}

uint64_t sub_5480(unint64_t a1)
{
  if (a1 >> 62) {
    return 0;
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_54AC(unint64_t a1)
{
  if (a1 >> 62 != 1) {
    return 0;
  }
  uint64_t v1 = a1 & 0x3FFFFFFFFFFFFFFFLL;
  swift_errorRetain();
  return v1;
}

uint64_t sub_54EC()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for AsyncIcon(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_50A0(*(void *)(a1 + 48));
  swift_release();
  uint64_t v2 = *(void **)(a1 + 64);
}

uint64_t initializeWithCopy for AsyncIcon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  unint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_5080(v6);
  uint64_t v7 = *(void *)(a2 + 56);
  uint64_t v8 = *(void **)(a2 + 64);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  swift_retain();
  id v10 = v8;
  return a1;
}

uint64_t assignWithCopy for AsyncIcon(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void *)(a2 + 48);
  sub_5080(v4);
  unint64_t v5 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v4;
  sub_50A0(v5);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  unint64_t v6 = *(void **)(a1 + 64);
  uint64_t v7 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v7;
  id v8 = v7;

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

__n128 initializeWithTake for AsyncIcon(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for AsyncIcon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_unknownObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  sub_50A0(v6);
  swift_release();
  uint64_t v7 = *(void **)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);

  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncIcon(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AsyncIcon(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon()
{
  return &type metadata for AsyncIcon;
}

unint64_t *initializeBufferWithCopyOfBuffer for AsyncIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_5080(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for AsyncIconPhase(unint64_t *a1)
{
  return sub_50A0(*a1);
}

unint64_t *assignWithCopy for AsyncIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_5080(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_50A0(v4);
  return a1;
}

void *initializeWithTake for AsyncIconPhase(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

unint64_t *assignWithTake for AsyncIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_50A0(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncIconPhase(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AsyncIconPhase(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)__n128 result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_59B0(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_59CC(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_59DC(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *__n128 result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for AsyncIconPhase()
{
  return &type metadata for AsyncIconPhase;
}

unint64_t sub_5A1C()
{
  unint64_t result = qword_22398;
  if (!qword_22398)
  {
    sub_38E0(&qword_223A0);
    sub_5A98();
    sub_5BE4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22398);
  }
  return result;
}

unint64_t sub_5A98()
{
  unint64_t result = qword_223A8;
  if (!qword_223A8)
  {
    sub_38E0(&qword_223B0);
    sub_5B14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_223A8);
  }
  return result;
}

unint64_t sub_5B14()
{
  unint64_t result = qword_223B8;
  if (!qword_223B8)
  {
    sub_38E0(&qword_223C0);
    sub_5B90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_223B8);
  }
  return result;
}

unint64_t sub_5B90()
{
  unint64_t result = qword_22D00[0];
  if (!qword_22D00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_22D00);
  }
  return result;
}

unint64_t sub_5BE4()
{
  unint64_t result = qword_223C8;
  if (!qword_223C8)
  {
    sub_38E0(&qword_223D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_223C8);
  }
  return result;
}

unint64_t destroy for AsyncIcon.Inner(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);

  return sub_50A0(v2);
}

void *_s34CSLCompanionLiveActivitiesSettings9AsyncIconV5InnerVwCP_0(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  unint64_t v5 = *(void *)(a2 + 16);
  id v6 = v3;
  sub_5080(v5);
  a1[2] = v5;
  return a1;
}

uint64_t assignWithCopy for AsyncIcon.Inner(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  unint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  unint64_t v7 = *(void *)(a2 + 16);
  sub_5080(v7);
  unint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  sub_50A0(v8);
  return a1;
}

__n128 initializeWithTake for AsyncIcon.Inner(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AsyncIcon.Inner(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_50A0(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncIcon.Inner(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AsyncIcon.Inner(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon.Inner()
{
  return &type metadata for AsyncIcon.Inner;
}

uint64_t initializeBufferWithCopyOfBuffer for AsyncIcon.LoadingState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

unint64_t destroy for AsyncIcon.LoadingState(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 24);

  return sub_50A0(v2);
}

void *initializeWithCopy for AsyncIcon.LoadingState(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unint64_t v4 = a2[3];
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_5080(v4);
  a1[3] = v4;
  return a1;
}

void *assignWithCopy for AsyncIcon.LoadingState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = a2[3];
  sub_5080(v4);
  unint64_t v5 = a1[3];
  a1[3] = v4;
  sub_50A0(v5);
  return a1;
}

__n128 initializeWithTake for AsyncIcon.LoadingState(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for AsyncIcon.LoadingState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = a1[3];
  a1[3] = a2[3];
  sub_50A0(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncIcon.LoadingState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AsyncIcon.LoadingState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon.LoadingState()
{
  return &type metadata for AsyncIcon.LoadingState;
}

uint64_t sub_60B0()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_60CC(void *a1, void *a2)
{
  *a2 = *a1;
  return a2;
}

uint64_t sub_60DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_389C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_6140(uint64_t a1)
{
  return a1;
}

uint64_t sub_616C(uint64_t a1)
{
  return a1;
}

unint64_t *sub_6198(unint64_t *a1)
{
  return a1;
}

uint64_t sub_61C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_61F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_621C(uint64_t a1)
{
  return a1;
}

unint64_t *sub_6248(unint64_t *a1)
{
  return a1;
}

uint64_t sub_6274(uint64_t a1)
{
  return a1;
}

uint64_t sub_62A4()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_50A0(*(void *)(v0 + 64));
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_6304(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = a1;
    sub_154A0();
    long long v6 = *(_OWORD *)(v2 + 40);
    long long v8 = *(_OWORD *)(v2 + 56);
    uint64_t v10 = *(void *)(v2 + 72);
    long long v12 = v6;
    long long v13 = v8;
    sub_60DC((uint64_t)&v12, (uint64_t)v16, &qword_22438);
    sub_60DC((uint64_t)&v12 + 8, (uint64_t)v15, &qword_22440);
    sub_60CC((void *)&v13 + 1, &v14);
    sub_60DC((uint64_t)&v10, (uint64_t)v11, &qword_22448);
    sub_6140((uint64_t)v16);
    sub_616C((uint64_t)v15);
    sub_6198(&v14);
    sub_61C4((uint64_t)v11);
    sub_389C(&qword_22390);
    sub_154F0();
    sub_50A0(v5);
    sub_15500();
  }
  else
  {
    if (!a2)
    {
      sub_65A4();
      swift_allocError();
    }
    long long v7 = *(_OWORD *)(v2 + 40);
    long long v9 = *(_OWORD *)(v2 + 56);
    uint64_t v10 = *(void *)(v2 + 72);
    long long v12 = v7;
    long long v13 = v9;
    sub_60DC((uint64_t)&v12, (uint64_t)v16, &qword_22438);
    sub_60DC((uint64_t)&v12 + 8, (uint64_t)v15, &qword_22440);
    sub_60CC((void *)&v13 + 1, &v14);
    sub_60DC((uint64_t)&v10, (uint64_t)v11, &qword_22448);
    swift_errorRetain();
    sub_6140((uint64_t)v16);
    sub_616C((uint64_t)v15);
    sub_6198(&v14);
    sub_61C4((uint64_t)v11);
    sub_389C(&qword_22390);
    sub_154F0();
    sub_50A0(v5);
    sub_15500();
  }
  sub_61F0((uint64_t)v16);
  sub_621C((uint64_t)v15);
  sub_6248(&v14);
  return sub_6274((uint64_t)v11);
}

uint64_t sub_658C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_659C()
{
  return swift_release();
}

unint64_t sub_65A4()
{
  unint64_t result = qword_22D90[0];
  if (!qword_22D90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_22D90);
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon.LoadingError()
{
  return &type metadata for AsyncIcon.LoadingError;
}

unint64_t sub_660C()
{
  unint64_t result = qword_22450;
  if (!qword_22450)
  {
    sub_38E0(&qword_22458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22450);
  }
  return result;
}

uint64_t sub_6684()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);

  return sub_152A0();
}

uint64_t sub_6700()
{
  return swift_retain();
}

uint64_t sub_6708(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_6734())()
{
  return nullsub_1;
}

uint64_t sub_6754()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);

  return sub_152B0();
}

uint64_t sub_67DC()
{
  sub_154E0();
  return v1;
}

uint64_t sub_6818()
{
  sub_389C(&qword_22468);
  sub_154F0();
  return v1;
}

uint64_t sub_6860()
{
  return sub_15500();
}

void (*sub_68AC(void *a1))(uint64_t a1)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 16);
  sub_69AC((uint64_t)v3 + 24, (uint64_t)(v3 + 2));
  *id v3 = v3[1];
  sub_61C4((uint64_t)(v3 + 2));
  *((void *)v3 + 5) = sub_389C(&qword_22468);
  sub_154F0();
  return sub_6950;
}

void sub_6950(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  uint64_t v2 = (_OWORD *)(*(void *)a1 + 16);
  char v3 = *(unsigned char *)(*(void *)a1 + 49);
  *(_OWORD *)uint64_t v1 = *v2;
  v1[48] = v3;
  sub_15500();
  sub_6A14((uint64_t)v2);

  free(v1);
}

uint64_t sub_69AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_389C(&qword_22470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_6A14(uint64_t a1)
{
  return a1;
}

uint64_t sub_6A40()
{
  sub_389C(&qword_22468);
  sub_15510();
  return v1;
}

uint64_t sub_6A8C()
{
  sub_389C(&qword_22478);
  sub_15540();
  return v1;
}

uint64_t sub_6ADC()
{
  return sub_15550();
}

void (*sub_6B30(void *a1))(uint64_t a1)
{
  char v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  v3[4] = v4;
  v3[5] = v5;
  char v6 = *(unsigned char *)(v1 + 48);
  *((unsigned char *)v3 + 19) = v6;
  v3[3] = v4;
  *char v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_61C4((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_389C(&qword_22478);
  sub_15540();
  return sub_6BD4;
}

void sub_6BD4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)a1 + 24;
  char v3 = *(unsigned char *)(*(void *)a1 + 18);
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(*(void *)a1 + 19);
  *uint64_t v1 = *(void *)(*(void *)a1 + 32);
  v1[1] = v4;
  *((unsigned char *)v1 + 16) = v5;
  *((unsigned char *)v1 + 17) = v3;
  sub_15550();
  sub_6274(v2);
  swift_release();

  free(v1);
}

uint64_t sub_6C48()
{
  sub_389C(&qword_22478);
  sub_15560();
  return v1;
}

_UNKNOWN **sub_6C9C()
{
  return &off_1D160;
}

uint64_t sub_6CA8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_6CB0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, char a3@<W4>, uint64_t a4@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  swift_retain();
  uint64_t v8 = sub_152A0();
  uint64_t v10 = v9;
  sub_154E0();
  uint64_t result = swift_release();
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v10;
  *(unsigned char *)(a4 + 16) = v12;
  *(void *)(a4 + 24) = v13;
  *(void *)(a4 + 32) = a1;
  *(void *)(a4 + 40) = a2;
  *(unsigned char *)(a4 + 48) = a3;
  *(void *)(a4 + 56) = &off_1D198;
  return result;
}

uint64_t sub_6DAC()
{
  uint64_t v1 = sub_15370();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_389C(&qword_22480);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v0;
  sub_389C(&qword_22488);
  sub_43A4(&qword_22490, &qword_22488);
  sub_153F0();
  sub_15360();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  sub_15350(v12);
  char v6 = (uint64_t *)(*(void *)(v0 + 8)
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
  uint64_t v7 = *v6;
  uint64_t v8 = (void *)v6[1];
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v7;
  v13._object = v8;
  sub_15340(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  sub_15350(v14);
  sub_15390();
  sub_43A4(&qword_22498, &qword_22480);
  sub_15470();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_7004@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  long long v33 = a2;
  uint64_t v3 = sub_389C(&qword_224A8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v34 = (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - v6;
  uint64_t v8 = sub_389C(&qword_224B0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  Swift::String v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v33 - v13;
  uint64_t v35 = a1;
  sub_389C(&qword_224B8);
  uint64_t v15 = sub_38E0(&qword_224C0);
  uint64_t v16 = sub_43A4(&qword_224C8, &qword_224C0);
  *(void *)&long long v36 = v15;
  *((void *)&v36 + 1) = v16;
  swift_getOpaqueTypeConformance2();
  sub_155A0();
  long long v39 = *a1;
  uint64_t v17 = *((void *)&v39 + 1);
  uint64_t v18 = *(uint64_t (**)(uint64_t))(**((void **)&v39 + 1) + 248);
  uint64_t v19 = swift_retain();
  char v20 = v18(v19);
  sub_6A14((uint64_t)&v39);
  if ((v20 & 1) == 0) {
    goto LABEL_5;
  }
  long long v36 = a1[2];
  char v37 = *((unsigned char *)a1 + 48);
  sub_389C(&qword_22478);
  sub_15540();
  if (v38 != 1) {
    goto LABEL_5;
  }
  long long v21 = *(uint64_t (**)(uint64_t))(*(void *)v17 + 176);
  uint64_t v22 = swift_retain();
  char v23 = v21(v22);
  uint64_t v24 = sub_6A14((uint64_t)&v39);
  if (v23)
  {
    __chkstk_darwin(v24);
    *(&v33 - 2) = (char *)a1;
    sub_389C(&qword_224E0);
    sub_964C();
    sub_15400();
    uint64_t v25 = sub_389C(&qword_224D0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 0, 1, v25);
  }
  else
  {
LABEL_5:
    uint64_t v26 = sub_389C(&qword_224D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
  }
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v27(v12, v14, v8);
  uint64_t v28 = v34;
  sub_98D8((uint64_t)v7, v34, &qword_224A8);
  unint64_t v29 = v33;
  v27(v33, v12, v8);
  uint64_t v30 = sub_389C(&qword_224D8);
  sub_98D8(v28, (uint64_t)&v29[*(int *)(v30 + 48)], &qword_224A8);
  sub_993C((uint64_t)v7, &qword_224A8);
  unint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
  v31(v14, v8);
  sub_993C(v28, &qword_224A8);
  return ((uint64_t (*)(char *, uint64_t))v31)(v12, v8);
}

uint64_t sub_7450@<X0>(char *a1@<X8>)
{
  return sub_7004(*(long long **)(v1 + 16), a1);
}

uint64_t sub_7458()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_7474(uint64_t a1)
{
  uint64_t v2 = sub_153E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_389C(&qword_224C0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_15330();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_389C(&qword_22568);
  sub_7614(a1, (uint64_t *)&v8[*(int *)(v9 + 44)]);
  sub_153D0();
  sub_43A4(&qword_224C8, &qword_224C0);
  sub_15490();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_993C((uint64_t)v8, &qword_224C0);
}

uint64_t sub_7614@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v31 = a2;
  uint64_t v3 = sub_389C(&qword_22300);
  uint64_t v38 = *(void *)(v3 - 8);
  long long v39 = (void (*)(void, void, void))v3;
  __chkstk_darwin(v3);
  char v37 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_389C(&qword_22308);
  uint64_t v33 = *(void *)(v40 - 8);
  uint64_t v5 = __chkstk_darwin(v40);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v41 = (char *)&v31 - v8;
  if (*(unsigned char *)(*(void *)(a1 + 8)
                + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) == 1)
  {
    uint64_t v47 = sub_31C0(0xD00000000000001ELL, (void *)0x80000000000181F0);
    uint64_t v48 = v9;
    sub_3A08();
    uint64_t v42 = sub_15410();
    uint64_t v43 = v10;
    uint64_t v44 = v11 & 1;
    uint64_t v45 = v12;
    char v46 = 0;
  }
  else
  {
    uint64_t v47 = sub_31C0(0xD000000000000017, (void *)0x80000000000181D0);
    uint64_t v48 = v13;
    sub_3A08();
    uint64_t v42 = sub_15410();
    uint64_t v43 = v15;
    uint64_t v44 = v14 & 1;
    uint64_t v45 = v16;
    char v46 = 1;
  }
  sub_153C0();
  uint64_t v35 = v48;
  uint64_t v36 = v47;
  uint64_t v17 = v50;
  uint64_t v34 = v49;
  int v32 = v51;
  sub_15380();
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_152B0();
  swift_getKeyPath();
  sub_152C0();
  swift_release();
  swift_release();
  uint64_t v18 = v37;
  sub_15530();
  sub_43A4(&qword_22310, &qword_22300);
  uint64_t v19 = v7;
  char v20 = v39;
  sub_15450();
  (*(void (**)(char *, void (*)(void, void, void)))(v38 + 8))(v18, v20);
  uint64_t v21 = v33;
  uint64_t v23 = v40;
  uint64_t v22 = v41;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v41, v19, v40);
  long long v39 = *(void (**)(void, void, void))(v21 + 16);
  v39(v19, v22, v23);
  uint64_t v25 = v35;
  uint64_t v24 = v36;
  uint64_t v26 = v31;
  *unint64_t v31 = v36;
  v26[1] = v25;
  char v27 = v34;
  v26[2] = v34;
  v26[3] = v17;
  *((unsigned char *)v26 + 32) = v32;
  v26[5] = 0;
  *((unsigned char *)v26 + 48) = 1;
  uint64_t v28 = sub_389C(&qword_22570);
  v39((char *)v26 + *(int *)(v28 + 64), v19, v23);
  sub_9998(v24, v25, v27);
  unint64_t v29 = *(void (**)(char *, uint64_t))(v21 + 8);
  v29(v41, v23);
  v29(v19, v23);
  return sub_99D4(v24, v25, v27);
}

uint64_t sub_7AA0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 176))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_7AF0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 184))(*a1);
}

uint64_t sub_7B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v59 = sub_389C(&qword_22510);
  uint64_t v54 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_389C(&qword_22520);
  uint64_t v55 = *(void *)(v60 - 8);
  uint64_t v5 = __chkstk_darwin(v60);
  v52 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v53 = (char *)&v51 - v7;
  uint64_t v66 = sub_389C(&qword_22528);
  __chkstk_darwin(v66);
  uint64_t v68 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_389C(&qword_22530);
  __chkstk_darwin(v56);
  v57 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_389C(&qword_224F8);
  __chkstk_darwin(v67);
  v58 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_15320();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_389C(&qword_22500);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  char v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_389C(&qword_22538);
  uint64_t v15 = *(void *)(v65 - 8);
  uint64_t v16 = __chkstk_darwin(v65);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v70 = (char *)&v51 - v19;
  uint64_t v20 = *(void *)(a1 + 8);
  unint64_t v21 = *(void *)(v20
                  + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  unint64_t v22 = *(void *)(v20
                  + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                  + 8);
  swift_bridgeObjectRetain();
  sub_B4D8(v78);
  long long v80 = v78[1];
  long long v81 = v78[0];
  sub_621C((uint64_t)&v80);
  long long v79 = v78[2];
  sub_621C((uint64_t)&v79);
  if (__PAIR128__(v22, v21) == v81)
  {
    sub_621C((uint64_t)&v81);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v23 = sub_15710();
    sub_621C((uint64_t)&v81);
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0) {
      goto LABEL_5;
    }
  }
  long long v71 = *(_OWORD *)(a1 + 16);
  sub_389C(&qword_22468);
  sub_154F0();
  if ((v74 & 1) == 0)
  {
    uint64_t v76 = sub_31C0(0xD000000000000011, (void *)0x8000000000018120);
    uint64_t v77 = v43;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
    sub_152B0();
    swift_getKeyPath();
    sub_152C0();
    swift_release();
    swift_release();
    long long v74 = v71;
    uint64_t v75 = v72;
    type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting();
    sub_389C(&qword_22540);
    sub_9890(&qword_22548, (void (*)(uint64_t))type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
    sub_43A4(&qword_22550, &qword_22540);
    sub_3A08();
    sub_15520();
    sub_15310();
    uint64_t v44 = sub_43A4(&qword_22508, &qword_22500);
    uint64_t v45 = v62;
    uint64_t v46 = v64;
    sub_15440();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v46);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v45);
    uint64_t v47 = v70;
    uint64_t v48 = v65;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v70, v18, v65);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v57, v47, v48);
    swift_storeEnumTagMultiPayload();
    *(void *)&long long v71 = v45;
    *((void *)&v71 + 1) = v46;
    uint64_t v72 = v44;
    v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v49 = sub_43A4(&qword_22518, &qword_22510);
    *(void *)&long long v71 = v59;
    *((void *)&v71 + 1) = v46;
    uint64_t v72 = v49;
    v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v50 = (uint64_t)v58;
    sub_153C0();
    sub_98D8(v50, v68, &qword_224F8);
    swift_storeEnumTagMultiPayload();
    sub_9748();
    sub_153C0();
    sub_993C(v50, &qword_224F8);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v70, v48);
  }
LABEL_5:
  if (*(unsigned char *)(v20
                + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_installedOnWatch) == 1
    && *(unsigned char *)(v20
                + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_supportsAppOption) == 1)
  {
    uint64_t v76 = sub_31C0(0xD000000000000011, (void *)0x8000000000018120);
    uint64_t v77 = v24;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
    sub_152B0();
    swift_getKeyPath();
    sub_152C0();
    swift_release();
    swift_release();
    long long v74 = v71;
    uint64_t v75 = v72;
    type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting();
    sub_389C(&qword_22558);
    sub_9890(&qword_22548, (void (*)(uint64_t))type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
    sub_43A4(&qword_22560, &qword_22558);
    sub_3A08();
    sub_15520();
    sub_15310();
    uint64_t v25 = sub_43A4(&qword_22518, &qword_22510);
    uint64_t v26 = v52;
    uint64_t v27 = v59;
    uint64_t v28 = v64;
    sub_15440();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v28);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v4, v27);
    uint64_t v29 = v55;
    uint64_t v30 = v53;
    uint64_t v31 = v60;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v53, v26, v60);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v57, v30, v31);
    swift_storeEnumTagMultiPayload();
    uint64_t v32 = sub_43A4(&qword_22508, &qword_22500);
    *(void *)&long long v71 = v62;
    *((void *)&v71 + 1) = v28;
    uint64_t v72 = v32;
    v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v71 = v27;
    *((void *)&v71 + 1) = v28;
    uint64_t v72 = v25;
    v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v33 = (uint64_t)v58;
    sub_153C0();
    sub_98D8(v33, v68, &qword_224F8);
    swift_storeEnumTagMultiPayload();
    sub_9748();
    sub_153C0();
    sub_993C(v33, &qword_224F8);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  }
  else
  {
    uint64_t v76 = sub_31C0(0xD000000000000011, (void *)0x8000000000018120);
    uint64_t v77 = v35;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    sub_9890((unint64_t *)&qword_22460, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
    sub_152B0();
    swift_getKeyPath();
    sub_152C0();
    swift_release();
    swift_release();
    long long v74 = v71;
    uint64_t v75 = v72;
    type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting();
    sub_389C(&qword_22540);
    sub_9890(&qword_22548, (void (*)(uint64_t))type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
    sub_43A4(&qword_22550, &qword_22540);
    sub_3A08();
    sub_15520();
    sub_15310();
    uint64_t v36 = sub_43A4(&qword_22508, &qword_22500);
    uint64_t v37 = v62;
    uint64_t v38 = v64;
    sub_15440();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v38);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v37);
    uint64_t v39 = v15;
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    uint64_t v41 = v70;
    uint64_t v42 = v65;
    v40(v70, v18, v65);
    (*(void (**)(uint64_t, char *, uint64_t))(v39 + 16))(v68, v41, v42);
    swift_storeEnumTagMultiPayload();
    sub_9748();
    *(void *)&long long v71 = v37;
    *((void *)&v71 + 1) = v38;
    uint64_t v72 = v36;
    v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    sub_153C0();
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v41, v42);
  }
}

uint64_t sub_8B4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t sub_8B98(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 208))(*a1);
}

uint64_t sub_8BE0@<X0>(uint64_t a1@<X8>)
{
  sub_31C0(0xD000000000000026, (void *)0x8000000000018140);
  sub_3A08();
  uint64_t v2 = sub_15410();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_31C0(0xD000000000000026, (void *)0x8000000000018170);
  uint64_t v9 = sub_15410();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(unsigned char *)(a1 + 80) = v12 & 1;
  *(void *)(a1 + 88) = v14;
  *(void *)(a1 + 96) = 2;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 2;
  *(_WORD *)(a1 + 120) = 0;
  sub_43E8(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_43E8(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_43F8(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_43F8(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_8D68@<X0>(uint64_t a1@<X8>)
{
  sub_31C0(0xD000000000000026, (void *)0x8000000000018140);
  sub_3A08();
  uint64_t v2 = sub_15410();
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  char v6 = v5 & 1;
  sub_31C0(0xD00000000000002DLL, (void *)0x80000000000181A0);
  uint64_t v7 = sub_15410();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_31C0(0xD000000000000026, (void *)0x8000000000018170);
  uint64_t v14 = sub_15410();
  char v24 = v6;
  char v16 = v15 & 1;
  char v17 = v6;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v23;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = v18;
  uint64_t v19 = v18;
  *(unsigned char *)(a1 + 144) = v16;
  *(void *)(a1 + 152) = v20;
  *(void *)(a1 + 160) = 2;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 2;
  *(_WORD *)(a1 + 184) = 0;
  sub_43E8(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_43E8(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_43E8(v14, v19, v16);
  swift_bridgeObjectRetain();
  sub_43F8(v14, v19, v16);
  swift_bridgeObjectRelease();
  sub_43F8(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_43F8(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_8F94@<X0>(uint64_t a1@<X8>)
{
  sub_31C0(0xD000000000000026, (void *)0x8000000000018140);
  sub_3A08();
  uint64_t v2 = sub_15410();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_31C0(0xD00000000000002DLL, (void *)0x80000000000181A0);
  uint64_t v9 = sub_15410();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v10;
  *(unsigned char *)(a1 + 80) = v12 & 1;
  *(void *)(a1 + 88) = v14;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  sub_43E8(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_43E8(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_43F8(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_43F8(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_9120()
{
  return sub_6DAC();
}

uint64_t destroy for LiveActivitiesAppSettingsView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LiveActivitiesAppSettingsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LiveActivitiesAppSettingsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LiveActivitiesAppSettingsView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LiveActivitiesAppSettingsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitiesAppSettingsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitiesAppSettingsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitiesAppSettingsView()
{
  return &type metadata for LiveActivitiesAppSettingsView;
}

uint64_t sub_9434()
{
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting()
{
  if (!qword_22A30)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_22A30);
    }
  }
}

uint64_t sub_950C()
{
  return sub_9890(&qword_224A0, (void (*)(uint64_t))type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
}

Swift::Int sub_9554()
{
  Swift::UInt v1 = *v0;
  sub_15760();
  sub_15770(v1);
  return sub_15780();
}

void sub_959C()
{
  sub_15770(*v0);
}

Swift::Int sub_95C8()
{
  Swift::UInt v1 = *v0;
  sub_15760();
  sub_15770(v1);
  return sub_15780();
}

BOOL sub_960C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_9620@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_9630(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_963C()
{
  return sub_7474(*(void *)(v0 + 16));
}

uint64_t sub_9644@<X0>(uint64_t a1@<X8>)
{
  return sub_7B38(*(void *)(v1 + 16), a1);
}

unint64_t sub_964C()
{
  unint64_t result = qword_224E8;
  if (!qword_224E8)
  {
    sub_38E0(&qword_224E0);
    sub_9748();
    sub_38E0(&qword_22500);
    sub_15320();
    sub_43A4(&qword_22508, &qword_22500);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_224E8);
  }
  return result;
}

unint64_t sub_9748()
{
  unint64_t result = qword_224F0;
  if (!qword_224F0)
  {
    sub_38E0(&qword_224F8);
    sub_38E0(&qword_22500);
    sub_15320();
    sub_43A4(&qword_22508, &qword_22500);
    swift_getOpaqueTypeConformance2();
    sub_38E0(&qword_22510);
    sub_43A4(&qword_22518, &qword_22510);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_224F0);
  }
  return result;
}

uint64_t sub_9890(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_98D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_389C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_993C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_389C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_9998(uint64_t a1, uint64_t a2, char a3)
{
  sub_43E8(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_99D4(uint64_t a1, uint64_t a2, char a3)
{
  sub_43F8(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_9A10()
{
  return sub_155B0();
}

uint64_t sub_9AD0()
{
  return sub_15290();
}

unint64_t sub_9B44()
{
  unint64_t result = qword_22580;
  if (!qword_22580)
  {
    sub_38E0(&qword_22578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22580);
  }
  return result;
}

uint64_t sub_9BA0@<X0>(uint64_t a1@<X8>)
{
  sub_31C0(0xD000000000000027, (void *)0x8000000000018240);
  sub_3A08();
  uint64_t result = sub_15410();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_9C10()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for LiveActivitiesAODPrivacySection()
{
  return &type metadata for LiveActivitiesAODPrivacySection;
}

unint64_t sub_9C40()
{
  unint64_t result = qword_22588;
  if (!qword_22588)
  {
    sub_38E0(&qword_22590);
    sub_9B44();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22588);
  }
  return result;
}

unint64_t sub_9CC8()
{
  unint64_t result = qword_22598;
  if (!qword_22598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22598);
  }
  return result;
}

void sub_9D24(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t sub_9D50()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_AB68((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_152B0();
}

uint64_t sub_9DDC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v55 = a3;
  uint64_t v54 = sub_389C(&qword_225A0);
  uint64_t v52 = *(void *)(v54 - 8);
  uint64_t v5 = __chkstk_darwin(v54);
  v53 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v57 = (char *)&v44 - v7;
  uint64_t v47 = sub_389C(&qword_225A8);
  uint64_t v49 = *(void *)(v47 - 8);
  uint64_t v8 = __chkstk_darwin(v47);
  uint64_t v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = sub_389C(&qword_225B0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v56 = (uint64_t)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v16 = (char *)&v44 - v15;
  char v17 = *(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *a2) - 8];
  uint64_t v18 = a2;
  uint64_t v19 = v17();

  if (v19)
  {
    __chkstk_darwin(v20);
    *(&v44 - 4) = v19;
    *(&v44 - 3) = a1;
    *(&v44 - 2) = (uint64_t)v18;
    sub_A630();
    sub_155A0();
    swift_release();
    uint64_t v21 = sub_389C(&qword_225B8);
    uint64_t v22 = (uint64_t)v16;
    uint64_t v23 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 0, 1, v21);
  }
  else
  {
    uint64_t v24 = sub_389C(&qword_225B8);
    uint64_t v22 = (uint64_t)v16;
    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v16, 1, 1, v24);
  }
  __chkstk_darwin(v23);
  *(&v44 - 2) = a1;
  *(&v44 - 1) = (uint64_t)v18;
  sub_389C(&qword_225C0);
  sub_A5BC();
  uint64_t v48 = v11;
  uint64_t v25 = sub_155A0();
  __chkstk_darwin(v25);
  *(&v44 - 2) = a1;
  *(&v44 - 1) = (uint64_t)v18;
  uint64_t v58 = sub_31C0(0xD00000000000002CLL, (void *)0x8000000000018270);
  uint64_t v59 = v26;
  sub_3A08();
  uint64_t v58 = sub_15410();
  uint64_t v59 = v27;
  char v60 = v28 & 1;
  uint64_t v61 = v29;
  uint64_t v30 = v57;
  sub_15580();
  uint64_t v50 = v22;
  uint64_t v31 = v56;
  sub_A7F4(v22, v56);
  uint64_t v32 = v49;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  uint64_t v33 = v51;
  uint64_t v34 = v47;
  v46(v51, v11, v47);
  uint64_t v36 = v52;
  uint64_t v35 = v53;
  uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  uint64_t v37 = v30;
  uint64_t v38 = v54;
  v45(v53, v37, v54);
  uint64_t v39 = v55;
  sub_A7F4(v31, v55);
  uint64_t v40 = sub_389C(&qword_225D8);
  v46((char *)(v39 + *(int *)(v40 + 48)), v33, v34);
  v45((char *)(v39 + *(int *)(v40 + 64)), v35, v38);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v36 + 8);
  v41(v57, v38);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v32 + 8);
  v42(v48, v34);
  sub_A85C(v50);
  v41(v35, v38);
  v42(v33, v34);
  return sub_A85C(v56);
}

uint64_t sub_A384@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & **a1) + 8])();
  *a2 = result & 1;
  return result;
}

uint64_t sub_A3EC(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & **a2) + 16])(*a1);
}

uint64_t sub_A44C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v3 = *(void (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v1));
  char v4 = v1;
  v3();

  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = v4;
  sub_389C(&qword_225F0);
  sub_43A4(&qword_225F8, &qword_225F0);
  sub_AB68(&qword_22600, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_A630();
  return sub_15570();
}

unint64_t sub_A5BC()
{
  unint64_t result = qword_225C8;
  if (!qword_225C8)
  {
    sub_38E0(&qword_225C0);
    sub_A630();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_225C8);
  }
  return result;
}

unint64_t sub_A630()
{
  unint64_t result = qword_225D0;
  if (!qword_225D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_225D0);
  }
  return result;
}

uint64_t sub_A684()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v3 = *(void (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v1));
  char v4 = v1;
  v3();

  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = v4;
  sub_389C(&qword_225F0);
  sub_43A4(&qword_225F8, &qword_225F0);
  sub_AB68(&qword_22600, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_A630();
  return sub_15570();
}

uint64_t sub_A7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_389C(&qword_225B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_A85C(uint64_t a1)
{
  uint64_t v2 = sub_389C(&qword_225B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_A8BC@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 32);
  uint64_t v5 = *(void (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v4));
  swift_retain();
  uint64_t v6 = v4;
  v5();

  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_AB68((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  uint64_t v7 = (void *)sub_152B0();
  swift_getKeyPath();
  sub_152C0();

  swift_release();
  sub_12C44((uint64_t)sub_AB10, v3, v10, v11, v12, (uint64_t)v13);
  long long v8 = v13[1];
  *a1 = v13[0];
  a1[1] = v8;
  a1[2] = v14[0];
  double result = *(double *)((char *)v14 + 9);
  *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)v14 + 9);
  return result;
}

uint64_t sub_AA24()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_AB68((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_152A0();
}

uint64_t sub_AAA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_AABC@<X0>(uint64_t a1@<X8>)
{
  return sub_9DDC(*(void *)v1, *(void **)(v1 + 8), a1);
}

ValueMetadata *type metadata accessor for LiveActivitiesAppSettingsSection()
{
  return &type metadata for LiveActivitiesAppSettingsSection;
}

uint64_t sub_AAD4()
{
  return sub_43A4(&qword_225E0, &qword_225E8);
}

uint64_t sub_AB10()
{
  return swift_retain();
}

uint64_t sub_AB18()
{
  return _swift_deallocObject(v0, 32, 7);
}

double sub_AB50@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_ABB0(a1, (uint64_t)sub_AB10, a2);
}

uint64_t sub_AB68(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_ABB0@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = *(void **)(v3 + 24);
  uint64_t v7 = *a1;
  long long v8 = *(void (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v6));
  swift_retain();
  uint64_t v9 = v6;
  v8();

  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_AB68((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  uint64_t v10 = (void *)sub_152B0();
  swift_getKeyPath();
  sub_152C0();

  swift_release();
  sub_12C44(a2, v7, v13, v14, v15, (uint64_t)v16);
  long long v11 = v16[1];
  *a3 = v16[0];
  a3[1] = v11;
  a3[2] = v17[0];
  double result = *(double *)((char *)v17 + 9);
  *(_OWORD *)((char *)a3 + 41) = *(_OWORD *)((char *)v17 + 9);
  return result;
}

id sub_AD10()
{
  id v0 = objc_allocWithZone((Class)CSLPRFIconFetcher);

  return [v0 init];
}

id sub_AD48()
{
  return *(id *)(v0 + OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_iconFetcher);
}

id sub_AD58()
{
  return *(id *)(v0 + OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_model);
}

id sub_AD68(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_155E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_ADE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_iconFetcher;
  id v7 = objc_allocWithZone((Class)CSLPRFIconFetcher);
  long long v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  *(void *)&v8[OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_model] = sub_E458();

  if (a2)
  {
    NSString v9 = sub_155E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for CSLPRFCompanionLiveActivitiesSettingsViewController();
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

uint64_t type metadata accessor for CSLPRFCompanionLiveActivitiesSettingsViewController()
{
  return self;
}

id sub_AF54(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_AF98(void *a1)
{
  uint64_t v3 = OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_iconFetcher;
  id v4 = objc_allocWithZone((Class)CSLPRFIconFetcher);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  *(void *)&v5[OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_model] = sub_E458();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CSLPRFCompanionLiveActivitiesSettingsViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

void sub_B074()
{
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for CSLPRFCompanionLiveActivitiesSettingsViewController();
  id v1 = objc_msgSendSuper2(&v23, "viewDidLoad");
  uint64_t v2 = (void *)(*(uint64_t (**)(id))((char *)&stru_20.nsects + (swift_isaMask & *v0)))(v1);
  [v0 addChildViewController:v2];
  id v3 = [v0 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v4 = v3;
  id v5 = [v2 view];
  if (!v5)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v6 = v5;
  [v4 addSubview:v5];

  id v7 = [v2 view];
  if (!v7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  objc_super v8 = v7;
  id v9 = [v0 view];
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v10 = v9;
  [v9 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v8, "setFrame:", v12, v14, v16, v18);
  id v19 = [v2 view];
  if (v19)
  {
    uint64_t v20 = v19;
    [v19 setAutoresizingMask:18];

    [v2 didMoveToParentViewController:v0];
    id v21 = [v0 navigationItem];
    sub_31C0(0xD000000000000015, (void *)0x80000000000182A0);
    NSString v22 = sub_155E0();
    swift_bridgeObjectRelease();
    [v21 setTitle:v22];

    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_B2FC()
{
  id v1 = *(id *)(v0 + OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_model);
  sub_13AEC();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_iconFetcher);
  sub_458C();
  sub_45CC();
  sub_151D0();
  id v3 = objc_allocWithZone((Class)sub_389C(&qword_22618));
  id v4 = v2;
  return sub_153B0();
}

id sub_B3A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSLPRFCompanionLiveActivitiesSettingsViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_B424()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_B440()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_B45C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_B48C()
{
  return 0xD000000000000018;
}

uint64_t sub_B4A8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_B4D8(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x80000000000182F0;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x8000000000018310;
  a1[4] = 0xD000000000000018;
  a1[5] = 0x8000000000018330;
}

void sub_B528(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_B554()
{
  return sub_BC78(*(void *)(v0 + 24));
}

uint64_t sub_B57C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_B5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_B5D0()
{
  return swift_release();
}

void sub_B600(uint64_t a1, uint64_t a2)
{
}

void sub_B628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  *(void *)(v9 + 24) = a2;
  v12[4] = a4;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_B57C;
  v12[3] = a5;
  id v10 = _Block_copy(v12);
  id v11 = v5;
  swift_bridgeObjectRetain();
  swift_release();
  BSDispatchMain();
  _Block_release(v10);
}

uint64_t sub_B714(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_389C(&qword_22A40);
  uint64_t v11 = sub_15610();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = v11;
  v17[4] = a6;
  v17[5] = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  _OWORD v17[2] = sub_B57C;
  v17[3] = a7;
  double v13 = _Block_copy(v17);
  id v14 = a1;
  id v15 = a3;
  swift_bridgeObjectRetain();
  swift_release();
  BSDispatchMain();
  _Block_release(v13);

  return swift_bridgeObjectRelease();
}

void sub_B824()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  v4[4] = sub_11F94;
  v4[5] = v1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_B57C;
  v4[3] = &unk_1D430;
  uint64_t v2 = _Block_copy(v4);
  id v3 = v0;
  swift_release();
  BSDispatchMain();
  _Block_release(v2);
}

void sub_B9D4()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  v4[4] = sub_BB58;
  v4[5] = v1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_B57C;
  v4[3] = &unk_1D480;
  uint64_t v2 = _Block_copy(v4);
  id v3 = v0;
  swift_release();
  BSDispatchMain();
  _Block_release(v2);
}

uint64_t sub_BA9C()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_115F8((unint64_t *)&qword_22700, v0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  sub_151E0();
  sub_151F0();

  return swift_release();
}

uint64_t sub_BB20()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_BB58()
{
  return sub_BA9C();
}

uint64_t sub_BC78(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_56;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  while (v2)
  {
    unint64_t v3 = 0;
    unint64_t v4 = v1 & 0xC000000000000001;
    uint64_t v42 = (char *)(v1 + 32);
    uint64_t v43 = v1 & 0xFFFFFFFFFFFFFF8;
    p_type = &stru_20FF0.type;
    uint64_t v45 = v2;
    uint64_t v46 = (void (*)(void))v1;
    unint64_t v44 = v1 & 0xC000000000000001;
    while (v4)
    {
      id v7 = (void *)sub_15660();
      BOOL v8 = __OFADD__(v3++, 1);
      if (v8) {
        goto LABEL_52;
      }
LABEL_11:
      if (objc_msgSend(v7, p_type[399], v42))
      {
        type metadata accessor for LiveActivitiesAutoLaunchModel();
        sub_115F8((unint64_t *)&qword_22700, v6, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
        sub_151E0();
        sub_151F0();
        swift_release();
        swift_unknownObjectRelease();
        if (v3 == v2) {
          goto LABEL_49;
        }
      }
      else
      {
        unint64_t v47 = v3;
        unint64_t v9 = (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v48)))();
        unint64_t v10 = v9;
        if (v9 >> 62)
        {
          uint64_t v11 = sub_156E0();
          if (v11)
          {
LABEL_14:
            if (v11 < 1) {
              goto LABEL_54;
            }
            uint64_t v12 = 0;
            while (2)
            {
              if ((v10 & 0xC000000000000001) != 0)
              {
                uint64_t v13 = sub_15660();
              }
              else
              {
                uint64_t v13 = *(void *)(v10 + 8 * v12 + 32);
                swift_retain();
              }
              uint64_t v15 = *(void *)(v13
                              + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
              unint64_t v14 = *(void *)(v13
                              + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                              + 8);
              swift_bridgeObjectRetain();
              id v16 = [v7 identifier];
              uint64_t v17 = sub_155F0();
              unint64_t v1 = (unint64_t)v18;

              if (v15 == v17 && v14 == v1)
              {
                swift_bridgeObjectRelease_n();
LABEL_27:
                self;
                uint64_t v21 = swift_dynamicCastObjCClass();
                if (v21)
                {
                  uint64_t v22 = v21;
                  unint64_t v1 = *(void *)(*(void *)v13 + 144);
                  swift_unknownObjectRetain();
                  ((void (*)(uint64_t))v1)(v22);
                  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
                  sub_115F8((unint64_t *)&qword_22460, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
                  sub_151E0();
                  sub_151F0();
                  swift_unknownObjectRelease();
                  swift_release();
                }
              }
              else
              {
                char v20 = sub_15710();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v20) {
                  goto LABEL_27;
                }
              }
              ++v12;
              swift_release();
              if (v11 == v12) {
                break;
              }
              continue;
            }
          }
        }
        else
        {
          uint64_t v11 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
          if (v11) {
            goto LABEL_14;
          }
        }
        uint64_t v23 = swift_bridgeObjectRelease();
        unint64_t v24 = (*(uint64_t (**)(uint64_t))((char *)&stru_B8.flags + (swift_isaMask & *v48)))(v23);
        unint64_t v25 = v24;
        if (v24 >> 62)
        {
          uint64_t v26 = sub_156E0();
          if (v26)
          {
LABEL_32:
            if (v26 < 1) {
              goto LABEL_55;
            }
            uint64_t v27 = 0;
            unint64_t v49 = v25 & 0xC000000000000001;
            unint64_t v28 = v25;
            while (2)
            {
              if (v49)
              {
                uint64_t v29 = sub_15660();
              }
              else
              {
                uint64_t v29 = *(void *)(v25 + 8 * v27 + 32);
                swift_retain();
              }
              uint64_t v31 = *(void *)(v29
                              + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
              uint64_t v30 = *(void *)(v29
                              + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                              + 8);
              swift_bridgeObjectRetain();
              id v32 = [v7 identifier];
              uint64_t v33 = sub_155F0();
              uint64_t v35 = v34;

              if (v31 == v33 && v30 == v35)
              {
                swift_bridgeObjectRelease_n();
LABEL_45:
                self;
                uint64_t v38 = swift_dynamicCastObjCClass();
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void (**)(uint64_t))(*(void *)v29 + 144);
                  swift_unknownObjectRetain();
                  v40(v39);
                  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
                  sub_115F8((unint64_t *)&qword_22460, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
                  sub_151E0();
                  sub_151F0();
                  swift_unknownObjectRelease();
                  swift_release();
                }
              }
              else
              {
                char v37 = sub_15710();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v37) {
                  goto LABEL_45;
                }
              }
              ++v27;
              swift_release();
              unint64_t v25 = v28;
              if (v26 == v27) {
                break;
              }
              continue;
            }
          }
        }
        else
        {
          uint64_t v26 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFFF8));
          if (v26) {
            goto LABEL_32;
          }
        }
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v2 = v45;
        unint64_t v1 = (unint64_t)v46;
        unint64_t v3 = v47;
        unint64_t v4 = v44;
        p_type = (char **)(&stru_20FF0 + 16);
        if (v47 == v45) {
          goto LABEL_49;
        }
      }
    }
    if (v3 >= *(void *)(v43 + 16)) {
      goto LABEL_53;
    }
    id v7 = *(void **)&v42[8 * v3];
    swift_unknownObjectRetain();
    BOOL v8 = __OFADD__(v3++, 1);
    if (!v8) {
      goto LABEL_11;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_156E0();
  }
LABEL_49:

  return swift_bridgeObjectRelease();
}

uint64_t sub_C278()
{
  return 0;
}

void *sub_C280()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_C28C()
{
  return sub_C380();
}

uint64_t sub_C298(uint64_t a1)
{
  return sub_C3D4(a1, &OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_filteredAppLibrary);
}

uint64_t (*sub_C2A4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_C300()
{
  return sub_C380();
}

uint64_t sub_C30C(uint64_t a1)
{
  return sub_C3D4(a1, &OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_liveActivitiesWatchLocalApps);
}

uint64_t (*sub_C318())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_C374()
{
  return sub_C380();
}

uint64_t sub_C380()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_C3C8(uint64_t a1)
{
  return sub_C3D4(a1, &OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_liveActivitiesCompanionLocalApps);
}

uint64_t sub_C3D4(uint64_t a1, void *a2)
{
  unint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_C424())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_C480()
{
  return swift_retain();
}

uint64_t sub_C4CC(uint64_t a1)
{
  unint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_liveActivitiesAllAudioAppsFakeApp);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_C520())()
{
  return j_j__swift_endAccess;
}

id sub_C57C()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_C5D4(void *a1)
{
  unint64_t v3 = (void **)(v1
               + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *unint64_t v3 = a1;
}

uint64_t (*sub_C628())()
{
  return j__swift_endAccess;
}

uint64_t sub_C688()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_nowPlayingIsInstalled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_C6D0(char a1)
{
  unint64_t v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_nowPlayingIsInstalled);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = a1;
  return result;
}

uint64_t (*sub_C71C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_C778()
{
  return sub_151A0();
}

void sub_C78C(void *a1)
{
  id v3 = *(id *)(v1
             + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings);
  *(void *)(v1
            + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) = a1;
  id v2 = a1;
}

uint64_t sub_C7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char a7, char a8, char a9)
{
  swift_allocObject();
  uint64_t v17 = sub_10E1C(a1, a2, a3, a4, a5, a6, a7, a8, a9);

  return v17;
}

uint64_t sub_C884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char a7, char a8, char a9)
{
  uint64_t v10 = sub_10E1C(a1, a2, a3, a4, a5, a6, a7, a8, a9);

  return v10;
}

uint64_t sub_C8C8()
{
  return sub_15200();
}

uint64_t sub_C8F8()
{
  return sub_15250();
}

uint64_t sub_C968()
{
  return sub_155D0();
}

uint64_t sub_C9F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v4 = sub_151C0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_CA64()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_CAA0()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_CADC()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_installedOnWatch);
}

uint64_t sub_CAEC()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp);
}

uint64_t sub_CAFC()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_supportsAppOption);
}

uint64_t sub_CB0C()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  uint64_t v2 = *(void *)(v0
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                 + 8);
  if (v1 == 0xD00000000000001CLL && v2 == 0x8000000000018310
    || (sub_15710() & 1) != 0
    || v1 == 0xD00000000000001ALL && v2 == 0x80000000000182F0
    || (sub_15710() & 1) != 0)
  {
    return sub_155F0();
  }
  swift_bridgeObjectRetain();
  return v1;
}

id sub_CC04()
{
  return [*(id *)(v0+ OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) allowLiveActivitiesForApp];
}

void sub_CC30(char a1)
{
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings);
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  v7[4] = sub_11058;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_CDC8;
  v7[3] = &unk_1D4D0;
  id v5 = _Block_copy(v7);
  id v6 = v3;
  swift_retain();
  swift_release();
  [v6 updateSettingsWithBlock:v5];
  _Block_release(v5);
}

uint64_t sub_CD28(void *a1, char a2)
{
  [a1 setAllowLiveActivitiesForApp:a2 & 1];
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_115F8((unint64_t *)&qword_22460, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_151E0();
  sub_151F0();

  return swift_release();
}

uint64_t sub_CDC8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void (*sub_CE28(void *a1))(void ****a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings;
  v3[6] = v1;
  v3[7] = v4;
  *((unsigned char *)v3 + 64) = [*(id *)(v1 + v4) allowLiveActivitiesForApp];
  return sub_CE9C;
}

void sub_CE9C(void ****a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[6];
  char v4 = *((unsigned char *)*a1 + 64);
  id v5 = *(void **)((char *)(*a1)[7] + (void)v3);
  if (a2)
  {
    uint64_t v6 = swift_allocObject();
    *(unsigned char *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v3;
    v2[4] = (void **)sub_11FD0;
    v2[5] = (void **)v6;
    *uint64_t v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_CDC8;
    v2[3] = (void **)&unk_1D520;
    id v7 = _Block_copy(v2);
    swift_retain();
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(unsigned char *)(v9 + 16) = v4;
    *(void *)(v9 + 24) = v3;
    v2[4] = (void **)sub_11FD0;
    v2[5] = (void **)v9;
    *uint64_t v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_CDC8;
    v2[3] = (void **)&unk_1D570;
    id v7 = _Block_copy(v2);
    id v10 = v5;
    swift_retain();
  }
  swift_release();
  [v5 updateSettingsWithBlock:v7];
  _Block_release(v7);

  free(v2);
}

id sub_D030()
{
  return [*(id *)(v0+ OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) autoLaunchBehaviorForApp];
}

void sub_D048(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  v7[4] = sub_11064;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_CDC8;
  v7[3] = &unk_1D5C0;
  id v5 = _Block_copy(v7);
  id v6 = v3;
  swift_retain();
  swift_release();
  [v6 updateSettingsWithBlock:v5];
  _Block_release(v5);
}

uint64_t sub_D13C(void *a1, uint64_t a2)
{
  [a1 setAutoLaunchBehaviorForApp:a2];
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_115F8((unint64_t *)&qword_22460, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_151E0();
  sub_151F0();

  return swift_release();
}

void (*sub_D1D8(void *a1))(void ****a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings;
  v3[7] = v1;
  v3[8] = v4;
  v3[6] = [*(id *)(v1 + v4) autoLaunchBehaviorForApp];
  return sub_D24C;
}

void sub_D24C(void ****a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[6];
  uint64_t v4 = (*a1)[7];
  id v5 = *(void **)((char *)(*a1)[8] + (void)v4);
  if (a2)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v3;
    *(void *)(v6 + 24) = v4;
    v2[4] = (void **)sub_11FD4;
    v2[5] = (void **)v6;
    *uint64_t v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_CDC8;
    v2[3] = (void **)&unk_1D610;
    id v7 = _Block_copy(v2);
    swift_retain();
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    v2[4] = (void **)sub_11FD4;
    v2[5] = (void **)v9;
    *uint64_t v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_CDC8;
    v2[3] = (void **)&unk_1D660;
    id v7 = _Block_copy(v2);
    id v10 = v5;
    swift_retain();
  }
  swift_release();
  [v5 updateSettingsWithBlock:v7];
  _Block_release(v7);

  free(v2);
}

uint64_t sub_D3DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_15240();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_D450@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_D4A0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 256))(*a1);
}

void (*sub_D4F0(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_15230();
  return sub_D57C;
}

void sub_D57C(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_D5E4()
{
  return swift_endAccess();
}

uint64_t sub_D648(uint64_t a1)
{
  uint64_t v2 = sub_389C(&qword_226F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  sub_389C(&qword_226E8);
  sub_15220();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_D774(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_389C(&qword_226F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp__globalAllowLiveActivitiesSetting;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_389C(&qword_226E8);
  sub_15210();
  swift_endAccess();
  return sub_D884;
}

void sub_D884(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  id v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_15220();
    swift_endAccess();
    id v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_15220();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_D9F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v2 = sub_151C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings));
  uint64_t v3 = v0
     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp__globalAllowLiveActivitiesSetting;
  uint64_t v4 = sub_389C(&qword_226E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_DAD8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v2 = sub_151C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings));
  uint64_t v3 = v0
     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp__globalAllowLiveActivitiesSetting;
  uint64_t v4 = sub_389C(&qword_226E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

Swift::Int sub_DBF8()
{
  sub_15760();
  (*(void (**)(unsigned char *))(*(void *)v0 + 160))(v2);
  return sub_15780();
}

uint64_t sub_DC58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v4 = sub_151C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_DCD0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 296))();
}

uint64_t sub_DD1C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 160))();
}

Swift::Int sub_DD60()
{
  sub_15760();
  (*(void (**)(unsigned char *))(**(void **)v0 + 160))(v2);
  return sub_15780();
}

uint64_t sub_DDC0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  uint64_t result = sub_151E0();
  *a1 = result;
  return result;
}

uint64_t sub_DE00()
{
  return sub_151A0();
}

uint64_t sub_DE1C()
{
  return sub_E0F0((SEL *)&selRef_globalAllowLiveActivities);
}

uint64_t sub_DE28(char a1)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v1) + 16])();
  id v4 = [v3 globalSettings];

  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = a1 & 1;
    *(void *)(v7 + 24) = v1;
    aBlock[4] = sub_110A4;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_CDC8;
    aBlock[3] = &unk_1D6B0;
    uint64_t v8 = _Block_copy(aBlock);
    uint64_t v9 = v1;
    swift_release();
    [v6 updateSettingsWithBlock:v8];
    _Block_release(v8);
    return swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t result = sub_156D0();
    __break(1u);
  }
  return result;
}

uint64_t (*sub_DFE8(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v1) + 16])();
  id v4 = [v3 resolvedGlobalSettings];

  if (v4)
  {
    unsigned __int8 v5 = [v4 globalAllowLiveActivities];
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  *(unsigned char *)(a1 + 8) = v5;
  return sub_E0BC;
}

uint64_t sub_E0BC(uint64_t a1)
{
  return sub_DE28(*(unsigned char *)(a1 + 8));
}

uint64_t sub_E0E4()
{
  return sub_E0F0((SEL *)&selRef_globalAutoLaunchLiveActivities);
}

uint64_t sub_E0F0(SEL *a1)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v1) + 16])();
  id v4 = [v3 resolvedGlobalSettings];

  if (!v4) {
    return 1;
  }
  id v5 = [v4 *a1];
  swift_unknownObjectRelease();
  return (uint64_t)v5;
}

uint64_t sub_E19C(char a1)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v1) + 16])();
  id v4 = [v3 globalSettings];

  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = a1 & 1;
    *(void *)(v7 + 24) = v1;
    aBlock[4] = sub_110B0;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_CDC8;
    aBlock[3] = &unk_1D700;
    uint64_t v8 = _Block_copy(aBlock);
    uint64_t v9 = v1;
    swift_release();
    [v6 updateSettingsWithBlock:v8];
    _Block_release(v8);
    return swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t result = sub_156D0();
    __break(1u);
  }
  return result;
}

uint64_t (*sub_E35C(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v1) + 16])();
  id v4 = [v3 resolvedGlobalSettings];

  if (v4)
  {
    unsigned __int8 v5 = [v4 globalAutoLaunchLiveActivities];
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  *(unsigned char *)(a1 + 8) = v5;
  return sub_E430;
}

uint64_t sub_E430(uint64_t a1)
{
  return sub_E19C(*(unsigned char *)(a1 + 8));
}

id sub_E458()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

char *sub_E48C()
{
  *(void *)&v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_filteredAppLibrary] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_liveActivitiesWatchLocalApps] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_liveActivitiesCompanionLocalApps] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_liveActivitiesAllAudioAppsFakeApp] = 0;
  v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_nowPlayingIsInstalled] = 0;
  id v1 = self;
  uint64_t v2 = v0;
  id v3 = [v1 sharedSettingsModel];
  *(void *)&v2[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings] = v3;
  id v4 = v3;

  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for LiveActivitiesAutoLaunchModel();
  id v5 = objc_msgSendSuper2(&v14, "init");
  id v6 = objc_allocWithZone((Class)CSLPRFInstalledLiveActivityApplicationsDataSource);
  uint64_t v7 = (char *)v5;
  id v8 = [v6 init];
  uint64_t v9 = OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource;
  id v10 = *(void **)&v7[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource];
  *(void *)&v7[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource] = v8;

  uint64_t v11 = *(void **)&v7[v9];
  if (v11)
  {
    [v11 setDelegate:v7];
    uint64_t v12 = *(void **)&v7[v9];
    if (v12) {
      [v12 start];
    }
  }
  [v4 addObserver:v7];

  return v7;
}

id sub_E618()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource];
  if (v1) {
    [v1 invalidate];
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for LiveActivitiesAutoLaunchModel();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_E760(uint64_t a1)
{
  uint64_t v2 = v1;
  v118 = (char *)_swiftEmptyArrayStorage;
  id v107 = [objc_allocWithZone((Class)CSLPRFLocalApplicationLibrary) init];
  char v117 = 0;
  objc_super v3 = *(void **)((char *)v1
                + OBJC_IVAR____TtC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource);
  v115 = v1;
  if (v3)
  {
    id v4 = v3;
    id v5 = [v4 apps];
    sub_11E78();
    unint64_t v6 = sub_15610();

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_156E0();
      swift_bridgeObjectRelease();
      v109 = v4;
      if (v7)
      {
LABEL_4:
        if (v7 >= 1)
        {
          uint64_t v8 = 0;
          unint64_t v111 = v6 & 0xC000000000000001;
          uint64_t v9 = (char *)_swiftEmptyArrayStorage;
          unint64_t v10 = v6;
          while (1)
          {
            id v11 = v111 ? (id)sub_15660() : *(id *)(v6 + 8 * v8 + 32);
            uint64_t v12 = v11;
            id v13 = [v11 bundleIdentifier];
            uint64_t v14 = sub_155F0();
            uint64_t v16 = v15;

            if (v14 == 0xD000000000000018 && v16 == 0x8000000000018330) {
              break;
            }
            char v17 = sub_15710();
            swift_bridgeObjectRelease();
            if (v17) {
              goto LABEL_13;
            }
LABEL_14:
            id v18 = [v12 bundleIdentifier];
            uint64_t v19 = sub_155F0();
            uint64_t v21 = v20;

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v9 = sub_FED4(0, *((void *)v9 + 2) + 1, 1, v9);
            }
            unint64_t v23 = *((void *)v9 + 2);
            unint64_t v22 = *((void *)v9 + 3);
            if (v23 >= v22 >> 1) {
              uint64_t v9 = sub_FED4((char *)(v22 > 1), v23 + 1, 1, v9);
            }
            ++v8;
            *((void *)v9 + 2) = v23 + 1;
            unint64_t v24 = &v9[16 * v23];
            *((void *)v24 + 4) = v19;
            *((void *)v24 + 5) = v21;

            unint64_t v6 = v10;
            if (v7 == v8) {
              goto LABEL_23;
            }
          }
          swift_bridgeObjectRelease();
LABEL_13:
          (*(void (**)(uint64_t))((char *)&stru_108.flags + (swift_isaMask & *v115)))(1);
          goto LABEL_14;
        }
        goto LABEL_126;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
      v109 = v4;
      if (v7) {
        goto LABEL_4;
      }
    }
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
LABEL_23:

    swift_bridgeObjectRelease();
    uint64_t v2 = v115;
  }
  else
  {
    uint64_t v9 = (char *)_swiftEmptyArrayStorage;
  }
  id v25 = objc_msgSend(objc_msgSend(self, "sharedLibraryForLocation:", 0), "allApplications");
  sub_389C(&qword_22A48);
  unint64_t v26 = sub_15610();

  v116[0] = (uint64_t)_swiftEmptyArrayStorage;
  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_156E0();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_26;
    }
LABEL_37:
    swift_bridgeObjectRelease();
    uint64_t v30 = _swiftEmptyArrayStorage;
    goto LABEL_38;
  }
  uint64_t v27 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8));
  if (!v27) {
    goto LABEL_37;
  }
LABEL_26:
  if (v27 < 1)
  {
    __break(1u);
    goto LABEL_124;
  }
  for (uint64_t i = 0; i != v27; ++i)
  {
    if ((v26 & 0xC000000000000001) != 0)
    {
      uint64_t v29 = (void *)sub_15660();
    }
    else
    {
      uint64_t v29 = *(void **)(v26 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    if ([v29 supportsSmartStack])
    {
      sub_15680();
      sub_156B0();
      sub_156C0();
      sub_15690();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v30 = (void *)v116[0];
  uint64_t v2 = v115;
LABEL_38:
  (*(void (**)(void *))&stru_B8.segname[(swift_isaMask & *v2) + 8])(v30);
  id v31 = [v107 allApplications];
  unint64_t v32 = sub_15610();

  unint64_t v112 = v32;
  if (v32 >> 62) {
    goto LABEL_82;
  }
  uint64_t v33 = *(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8));
  if (v33)
  {
    while (1)
    {
      unint64_t v34 = 0;
      unint64_t v35 = v112 & 0xC000000000000001;
      v104 = v9 + 72;
      v110 = (char *)_swiftEmptyArrayStorage;
      while (1)
      {
        if (v35)
        {
          uint64_t v36 = (void *)sub_15660();
          BOOL v37 = __OFADD__(v34++, 1);
          if (v37) {
            goto LABEL_79;
          }
        }
        else
        {
          if (v34 >= *(void *)((char *)&dword_10 + (v112 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_80;
          }
          uint64_t v36 = *(void **)(v112 + 32 + 8 * v34);
          swift_unknownObjectRetain();
          BOOL v37 = __OFADD__(v34++, 1);
          if (v37)
          {
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
            goto LABEL_81;
          }
        }
        if (objc_msgSend(v36, "supportsSmartStack", v104)) {
          break;
        }
LABEL_43:
        swift_unknownObjectRelease();
        if (v34 == v33) {
          goto LABEL_83;
        }
      }
      swift_bridgeObjectRetain();
      id v38 = [v36 bundleIdentifier];
      uint64_t v39 = sub_155F0();
      uint64_t v41 = v40;

      uint64_t v42 = (void *)*((void *)v9 + 2);
      if (!v42) {
        break;
      }
      if (*((void *)v9 + 4) == v39 && *((void *)v9 + 5) == v41 || (sub_15710() & 1) != 0)
      {
LABEL_41:
        swift_bridgeObjectRelease();
LABEL_42:
        swift_bridgeObjectRelease();
        goto LABEL_43;
      }
      if (v42 == (void *)((char *)&dword_0 + 1)) {
        break;
      }
      if (*((void *)v9 + 6) == v39 && *((void *)v9 + 7) == v41 || (sub_15710() & 1) != 0) {
        goto LABEL_41;
      }
      if (v42 == (void *)((char *)&dword_0 + 2)) {
        break;
      }
      uint64_t v54 = v104;
      uint64_t v55 = 2;
      while (1)
      {
        uint64_t v2 = (void *)(v55 + 1);
        if (__OFADD__(v55, 1)) {
          break;
        }
        BOOL v56 = *((void *)v54 - 1) == v39 && *(void *)v54 == v41;
        if (v56 || (sub_15710() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v2 = v115;
          unint64_t v35 = v112 & 0xC000000000000001;
          goto LABEL_42;
        }
        v54 += 16;
        ++v55;
        if (v2 == v42)
        {
          swift_bridgeObjectRelease();
          uint64_t v2 = v115;
          goto LABEL_57;
        }
      }
LABEL_81:
      __break(1u);
LABEL_82:
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_156E0();
      swift_bridgeObjectRelease();
      if (!v33) {
        goto LABEL_83;
      }
    }
    swift_bridgeObjectRelease();
LABEL_57:
    swift_bridgeObjectRelease();
    id v43 = [v36 bundleIdentifier];
    uint64_t v44 = sub_155F0();
    uint64_t v46 = v45;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v110 = sub_FED4(0, *((void *)v110 + 2) + 1, 1, v110);
    }
    unint64_t v48 = *((void *)v110 + 2);
    unint64_t v47 = *((void *)v110 + 3);
    if (v48 >= v47 >> 1) {
      v110 = sub_FED4((char *)(v47 > 1), v48 + 1, 1, v110);
    }
    *((void *)v110 + 2) = v48 + 1;
    unint64_t v49 = &v110[16 * v48];
    *((void *)v49 + 4) = v44;
    *((void *)v49 + 5) = v46;
    v118 = v110;
    uint64_t v50 = *(uint64_t (**)(uint64_t *))&stru_B8.segname[(swift_isaMask & *v2) + 16];
    swift_unknownObjectRetain();
    uint64_t v51 = (void (*)(uint64_t *, void))v50(v116);
    v53 = v52;
    sub_15600();
    if (*(void *)((char *)&dword_10 + (*v53 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (*v53 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_15630();
    sub_15650();
    sub_15620();
    v51(v116, 0);
    unint64_t v35 = v112 & 0xC000000000000001;
    goto LABEL_43;
  }
LABEL_83:
  swift_bridgeObjectRelease();
  id v113 = [objc_allocWithZone((Class)CSLPRFReturnToAppSettingsModel) init];
  v57 = self;
  NSString v58 = sub_155E0();
  id v59 = [v57 fakeApplicationWithIdentifier:v58];

  char v60 = *(uint64_t (**)(uint64_t *))&stru_B8.segname[(swift_isaMask & *v2) + 16];
  uint64_t v61 = (void (*)(uint64_t *, void))v60(v116);
  uint64_t v63 = v62;
  sub_15600();
  if (*(void *)((char *)&dword_10 + (*v63 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                  + (*v63 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_15630();
  sub_15650();
  sub_15620();
  v61(v116, 0);
  NSString v64 = sub_155E0();
  id v65 = [v57 fakeApplicationWithIdentifier:v64];

  uint64_t v66 = (uint64_t (*)(uint64_t *, void))v60(v116);
  uint64_t v68 = v67;
  sub_15600();
  if (*(void *)((char *)&dword_10 + (*v68 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                  + (*v68 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_15630();
  sub_15650();
  sub_15620();
  uint64_t v69 = v66(v116, 0);
  unint64_t v70 = (*(uint64_t (**)(uint64_t))&stru_B8.segname[swift_isaMask & *v2])(v69);
  long long v71 = v2;
  swift_unknownObjectRetain();
  id v72 = v113;
  unint64_t v73 = (unint64_t)sub_11688(v70, v71, (void **)&v118, a1, v72, &v117);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  if ((v73 & 0x8000000000000000) != 0 || (v73 & 0x4000000000000000) != 0)
  {
    unint64_t v101 = swift_bridgeObjectRetain();
    uint64_t v74 = (uint64_t)sub_FCE4(v101);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v74 = v73 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v116[0] = v74;
  sub_FDDC(v116);
  swift_bridgeObjectRelease();
  uint64_t v75 = *(uint64_t (**)(uint64_t))((char *)&stru_B8.offset + (swift_isaMask & *v71));
  uint64_t v76 = v75(v116[0]);
  uint64_t v77 = (*(uint64_t (**)(uint64_t))&stru_108.segname[(swift_isaMask & *v71) - 8])(v76);
  if (v77)
  {
    uint64_t v78 = v77;
    unint64_t v79 = (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v71)))();
    unint64_t v80 = sub_F7D8(v78, v79);
    char v82 = v81;
    swift_bridgeObjectRelease();
    if ((v82 & 1) == 0)
    {
      v83 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff
                                                                                         + (swift_isaMask & *v71)))(v116);
      sub_F97C(v80);
      swift_release();
      v83(v116, 0);
    }
    swift_release();
  }
  v84 = *(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v71));
  unint64_t v85 = v84();
  unint64_t v86 = v85;
  v108 = v72;
  v106 = v75;
  v114 = v84;
  if (v85 >> 62)
  {
    uint64_t v87 = sub_156E0();
    if (!v87) {
      goto LABEL_107;
    }
  }
  else
  {
    uint64_t v87 = *(void *)((char *)&dword_10 + (v85 & 0xFFFFFFFFFFFFFF8));
    if (!v87) {
      goto LABEL_107;
    }
  }
  if (v87 < 1)
  {
LABEL_124:
    __break(1u);
    goto LABEL_125;
  }
  for (uint64_t j = 0; j != v87; ++j)
  {
    if ((v86 & 0xC000000000000001) != 0)
    {
      uint64_t v89 = sub_15660();
    }
    else
    {
      uint64_t v89 = *(void *)(v86 + 8 * j + 32);
      swift_retain();
    }
    if (*(unsigned char *)(v89
                  + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) == 1)
    {
      v90 = *(uint64_t (**)(uint64_t *))&stru_108.sectname[swift_isaMask & *v71];
      swift_retain();
      v91 = (void (*)(uint64_t *, void))v90(v116);
      v93 = v92;
      sub_15600();
      if (*(void *)((char *)&dword_10 + (*v93 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (*v93 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_15630();
      sub_15650();
      sub_15620();
      v91(v116, 0);
    }
    swift_release();
  }
LABEL_107:
  uint64_t v94 = swift_bridgeObjectRelease();
  unint64_t v95 = ((uint64_t (*)(uint64_t))v114)(v94);
  unint64_t v96 = v95;
  v116[0] = (uint64_t)_swiftEmptyArrayStorage;
  if (!(v95 >> 62))
  {
    uint64_t v97 = *(void *)((char *)&dword_10 + (v95 & 0xFFFFFFFFFFFFFF8));
    if (v97) {
      goto LABEL_109;
    }
LABEL_121:
    swift_bridgeObjectRelease();
    v100 = _swiftEmptyArrayStorage;
LABEL_122:
    swift_bridgeObjectRelease();
    v106((uint64_t)v100);
    type metadata accessor for LiveActivitiesAutoLaunchModel();
    sub_115F8((unint64_t *)&qword_22700, v102, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
    sub_151E0();
    sub_151F0();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    return swift_release();
  }
  uint64_t v97 = sub_156E0();
  if (!v97) {
    goto LABEL_121;
  }
LABEL_109:
  if (v97 >= 1)
  {
    for (uint64_t k = 0; k != v97; ++k)
    {
      if ((v96 & 0xC000000000000001) != 0)
      {
        uint64_t v99 = sub_15660();
      }
      else
      {
        uint64_t v99 = *(void *)(v96 + 8 * k + 32);
        swift_retain();
      }
      if ((*(unsigned char *)(v99
                     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) & 1) != 0)
      {
        swift_release();
      }
      else
      {
        sub_15680();
        sub_156B0();
        sub_156C0();
        sub_15690();
      }
    }
    swift_bridgeObjectRelease();
    v100 = (void *)v116[0];
    goto LABEL_122;
  }
LABEL_125:
  __break(1u);
LABEL_126:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_F710(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_15710();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_15710() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_F7D8(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  if (a2 >> 62) {
    goto LABEL_21;
  }
  for (i = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)); i; uint64_t result = swift_bridgeObjectRelease())
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      sub_15660();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
      {
        __break(1u);
        return result;
      }
      swift_retain();
    }
    v3 += OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
    char v5 = sub_151A0();
    swift_release();
    if (v5) {
      return 0;
    }
    for (uint64_t j = 0; ; ++j)
    {
      unint64_t v6 = j + 1;
      if (__OFADD__(j, 1)) {
        break;
      }
      if (v6 == i) {
        return 0;
      }
      if ((a2 & 0xC000000000000001) != 0)
      {
        sub_15660();
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_19;
        }
        if (v6 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
          goto LABEL_20;
        }
        swift_retain();
      }
      char v8 = sub_151A0();
      swift_release();
      if (v8) {
        return v6;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t i = sub_156E0();
  }
  return 0;
}

uint64_t sub_F97C(unint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v3;
  if (!result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_FE58(v3);
    unint64_t v3 = result;
    *id v1 = result;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v5 + 8 * a1;
    uint64_t v9 = *(void *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(void *)(v5 + 16) = v7;
    sub_15620();
    return v9;
  }
  return result;
}

uint64_t sub_FA14@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  uint64_t result = sub_151E0();
  *a1 = result;
  return result;
}

uint64_t sub_FA50()
{
  id v1 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v0) + 16])();
  id v2 = [v1 globalSettings];

  sub_E760((uint64_t)v2);

  return swift_unknownObjectRelease();
}

uint64_t sub_FBAC()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_115F8((unint64_t *)&qword_22700, v0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  sub_151E0();
  sub_151F0();

  return swift_release();
}

void *sub_FCE4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      unint64_t v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_389C((uint64_t *)&unk_22A60);
      unint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10C68((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_156E0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_FDDC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10E08(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_FFD8(v6);
  return sub_15690();
}

uint64_t sub_FE58(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_156E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

char *sub_FED4(char *result, int64_t a2, char a3, char *a4)
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
    sub_389C(&qword_22A58);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_FFD8(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  uint64_t result = sub_15700(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_152;
    }
    if (v4) {
      return sub_106E4(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_151;
  }
  uint64_t v7 = result;
  v106 = a1;
  if (v4 <= 1)
  {
    uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v113 = (uint64_t)&_swiftEmptyArrayStorage;
    unint64_t v112 = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v13 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_117:
      uint64_t result = (uint64_t)v9;
      if (v13 >= 2)
      {
        uint64_t v99 = *v106;
        do
        {
          unint64_t v100 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_146;
          }
          if (!v99) {
            goto LABEL_159;
          }
          uint64_t v101 = result;
          uint64_t v102 = *(void *)(result + 32 + 16 * v100);
          uint64_t v103 = *(void *)(result + 32 + 16 * (v13 - 1) + 8);
          uint64_t result = sub_107BC((char *)(v99 + 8 * v102), (char *)(v99 + 8 * *(void *)(result + 32 + 16 * (v13 - 1))), v99 + 8 * v103, v112);
          if (v2) {
            break;
          }
          if (v103 < v102) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_10B1C(v101);
            uint64_t v101 = result;
          }
          if (v100 >= *(void *)(v101 + 16)) {
            goto LABEL_148;
          }
          v104 = (void *)(v101 + 32 + 16 * v100);
          void *v104 = v102;
          v104[1] = v103;
          unint64_t v105 = *(void *)(v101 + 16);
          if (v13 > v105) {
            goto LABEL_149;
          }
          memmove((void *)(v101 + 32 + 16 * (v13 - 1)), (const void *)(v101 + 32 + 16 * v13), 16 * (v105 - v13));
          uint64_t result = v101;
          *(void *)(v101 + 16) = v105 - 1;
          unint64_t v13 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)((char *)&dword_10 + (v113 & 0xFFFFFFFFFFFFFF8)) = 0;
      sub_15620();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    uint64_t result = sub_15640();
    *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)) = v8;
    unint64_t v112 = (char *)((result & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v113 = result;
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = v11 - 8;
  uint64_t v108 = v7;
  uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v12 = &unk_23000;
  Swift::Int v109 = v4;
  uint64_t v111 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 >= v4)
    {
      Swift::Int v21 = v14;
    }
    else
    {
      uint64_t v15 = v12[227];
      uint64_t v16 = (uint64_t *)(*(void *)(v11 + 8 * v10) + v15);
      uint64_t result = *v16;
      uint64_t v17 = v16[1];
      id v18 = (void *)(*(void *)(v11 + 8 * v14) + v15);
      if (result == *v18 && v17 == v18[1])
      {
        Swift::Int v21 = v14;
        Swift::Int v22 = v14 + 2;
        if (v22 >= v4) {
          goto LABEL_42;
        }
        int v20 = 0;
        do
        {
LABEL_27:
          unint64_t v24 = (uint64_t *)(*(void *)(v11 + 8 * v22) + v15);
          uint64_t result = *v24;
          uint64_t v25 = v24[1];
          unint64_t v26 = (void *)(*(void *)(v11 + 8 * v10) + v15);
          if (result == *v26 && v25 == v26[1])
          {
            if (v20) {
              goto LABEL_35;
            }
          }
          else
          {
            uint64_t result = sub_15710();
            if ((v20 ^ result)) {
              goto LABEL_34;
            }
            uint64_t v15 = v12[227];
          }
          Swift::Int v23 = v22 + 1;
          Swift::Int v10 = v22;
          Swift::Int v22 = v23;
        }
        while (v23 < v4);
        Swift::Int v22 = v23;
      }
      else
      {
        uint64_t result = sub_15710();
        int v20 = result;
        Swift::Int v21 = v14;
        Swift::Int v22 = v14 + 2;
        if (v22 < v4)
        {
          uint64_t v15 = v12[227];
          goto LABEL_27;
        }
      }
LABEL_34:
      Swift::Int v10 = v22;
      if (v20)
      {
LABEL_35:
        if (v22 < v21) {
          goto LABEL_155;
        }
        if (v21 < v22)
        {
          unint64_t v28 = (uint64_t *)(v107 + 8 * v22);
          Swift::Int v29 = v22;
          Swift::Int v30 = v21;
          id v31 = (uint64_t *)(v11 + 8 * v21);
          do
          {
            if (v30 != --v29)
            {
              if (!v11) {
                goto LABEL_158;
              }
              uint64_t v32 = *v31;
              *id v31 = *v28;
              *unint64_t v28 = v32;
            }
            ++v30;
            --v28;
            ++v31;
          }
          while (v30 < v29);
        }
LABEL_42:
        Swift::Int v10 = v22;
      }
    }
    if (v10 >= v4) {
      goto LABEL_63;
    }
    if (__OFSUB__(v10, v21)) {
      goto LABEL_150;
    }
    if (v10 - v21 >= v108)
    {
LABEL_63:
      Swift::Int v34 = v21;
      goto LABEL_64;
    }
    if (__OFADD__(v21, v108)) {
      goto LABEL_153;
    }
    Swift::Int v33 = v21 + v108 >= v4 ? v4 : v21 + v108;
    if (v33 < v21) {
      break;
    }
    Swift::Int v34 = v21;
    if (v10 != v33)
    {
      unint64_t v35 = (uint64_t *)(v107 + 8 * v10);
      do
      {
        uint64_t v36 = *(void *)(v11 + 8 * v10);
        Swift::Int v37 = v34;
        id v38 = v35;
        do
        {
          uint64_t v39 = v12[227];
          uint64_t v40 = (uint64_t *)(v36 + v39);
          uint64_t result = *v40;
          uint64_t v41 = v40[1];
          uint64_t v42 = (void *)(*v38 + v39);
          if (result == *v42 && v41 == v42[1]) {
            break;
          }
          uint64_t result = sub_15710();
          if ((result & 1) == 0) {
            break;
          }
          if (!v11) {
            goto LABEL_156;
          }
          uint64_t v44 = *v38;
          uint64_t v36 = v38[1];
          *id v38 = v36;
          v38[1] = v44;
          --v38;
          ++v37;
        }
        while (v10 != v37);
        ++v10;
        ++v35;
      }
      while (v10 != v33);
      Swift::Int v10 = v33;
      if (v33 < v34) {
        goto LABEL_145;
      }
      goto LABEL_65;
    }
LABEL_64:
    if (v10 < v34) {
      goto LABEL_145;
    }
LABEL_65:
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10A20(0, *((void *)v9 + 2) + 1, 1, v9);
      uint64_t v9 = (char *)result;
    }
    unint64_t v46 = *((void *)v9 + 2);
    unint64_t v45 = *((void *)v9 + 3);
    unint64_t v13 = v46 + 1;
    if (v46 >= v45 >> 1)
    {
      uint64_t result = (uint64_t)sub_10A20((char *)(v45 > 1), v46 + 1, 1, v9);
      uint64_t v9 = (char *)result;
    }
    *((void *)v9 + 2) = v13;
    unint64_t v47 = v9 + 32;
    unint64_t v48 = (Swift::Int *)&v9[16 * v46 + 32];
    *unint64_t v48 = v34;
    v48[1] = v10;
    if (v46)
    {
      uint64_t v11 = v111;
      Swift::Int v110 = v10;
      while (1)
      {
        unint64_t v49 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v54 = &v47[16 * v13];
          uint64_t v55 = *((void *)v54 - 8);
          uint64_t v56 = *((void *)v54 - 7);
          BOOL v60 = __OFSUB__(v56, v55);
          uint64_t v57 = v56 - v55;
          if (v60) {
            goto LABEL_134;
          }
          uint64_t v59 = *((void *)v54 - 6);
          uint64_t v58 = *((void *)v54 - 5);
          BOOL v60 = __OFSUB__(v58, v59);
          uint64_t v52 = v58 - v59;
          char v53 = v60;
          if (v60) {
            goto LABEL_135;
          }
          unint64_t v61 = v13 - 2;
          uint64_t v62 = &v47[16 * v13 - 32];
          uint64_t v64 = *(void *)v62;
          uint64_t v63 = *((void *)v62 + 1);
          BOOL v60 = __OFSUB__(v63, v64);
          uint64_t v65 = v63 - v64;
          if (v60) {
            goto LABEL_136;
          }
          BOOL v60 = __OFADD__(v52, v65);
          uint64_t v66 = v52 + v65;
          if (v60) {
            goto LABEL_138;
          }
          if (v66 >= v57)
          {
            v84 = &v47[16 * v49];
            uint64_t v86 = *(void *)v84;
            uint64_t v85 = *((void *)v84 + 1);
            BOOL v60 = __OFSUB__(v85, v86);
            uint64_t v87 = v85 - v86;
            if (v60) {
              goto LABEL_144;
            }
            BOOL v77 = v52 < v87;
            goto LABEL_102;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v78 = *((void *)v9 + 4);
            uint64_t v79 = *((void *)v9 + 5);
            BOOL v60 = __OFSUB__(v79, v78);
            uint64_t v71 = v79 - v78;
            char v72 = v60;
            goto LABEL_96;
          }
          uint64_t v51 = *((void *)v9 + 4);
          uint64_t v50 = *((void *)v9 + 5);
          BOOL v60 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          char v53 = v60;
        }
        if (v53) {
          goto LABEL_137;
        }
        unint64_t v61 = v13 - 2;
        uint64_t v67 = &v47[16 * v13 - 32];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v70 = __OFSUB__(v68, v69);
        uint64_t v71 = v68 - v69;
        char v72 = v70;
        if (v70) {
          goto LABEL_139;
        }
        unint64_t v73 = &v47[16 * v49];
        uint64_t v75 = *(void *)v73;
        uint64_t v74 = *((void *)v73 + 1);
        BOOL v60 = __OFSUB__(v74, v75);
        uint64_t v76 = v74 - v75;
        if (v60) {
          goto LABEL_141;
        }
        if (__OFADD__(v71, v76)) {
          goto LABEL_143;
        }
        if (v71 + v76 >= v52)
        {
          BOOL v77 = v52 < v76;
LABEL_102:
          if (v77) {
            unint64_t v49 = v61;
          }
          goto LABEL_104;
        }
LABEL_96:
        if (v72) {
          goto LABEL_140;
        }
        unint64_t v80 = &v47[16 * v49];
        uint64_t v82 = *(void *)v80;
        uint64_t v81 = *((void *)v80 + 1);
        BOOL v60 = __OFSUB__(v81, v82);
        uint64_t v83 = v81 - v82;
        if (v60) {
          goto LABEL_142;
        }
        if (v83 < v71) {
          goto LABEL_14;
        }
LABEL_104:
        unint64_t v88 = v49 - 1;
        if (v49 - 1 >= v13)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v11) {
          goto LABEL_157;
        }
        uint64_t v89 = v12;
        v90 = (unint64_t *)v9;
        uint64_t v91 = v11;
        v92 = &v47[16 * v88];
        uint64_t v93 = *(void *)v92;
        uint64_t v94 = v47;
        unint64_t v95 = v49;
        unint64_t v96 = &v47[16 * v49];
        uint64_t v97 = *((void *)v96 + 1);
        uint64_t result = sub_107BC((char *)(v91 + 8 * *(void *)v92), (char *)(v91 + 8 * *(void *)v96), v91 + 8 * v97, v112);
        if (v1) {
          goto LABEL_114;
        }
        if (v97 < v93) {
          goto LABEL_131;
        }
        if (v95 > v90[2]) {
          goto LABEL_132;
        }
        *(void *)v92 = v93;
        *(void *)&v94[16 * v88 + 8] = v97;
        unint64_t v98 = v90[2];
        if (v95 >= v98) {
          goto LABEL_133;
        }
        uint64_t v9 = (char *)v90;
        unint64_t v13 = v98 - 1;
        uint64_t result = (uint64_t)memmove(v96, v96 + 16, 16 * (v98 - 1 - v95));
        unint64_t v47 = v94;
        v90[2] = v98 - 1;
        BOOL v77 = v98 > 2;
        uint64_t v12 = v89;
        Swift::Int v10 = v110;
        uint64_t v11 = v111;
        if (!v77) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
    uint64_t v11 = v111;
LABEL_14:
    Swift::Int v4 = v109;
    if (v10 >= v109)
    {
      uint64_t v2 = v1;
      goto LABEL_117;
    }
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_106E4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v9 = *(void *)(v7 + 8 * v4);
    uint64_t v10 = v6;
    uint64_t v11 = (uint64_t *)v8;
    while (1)
    {
      uint64_t v12 = (uint64_t *)(v9
                      + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      uint64_t result = *v12;
      uint64_t v13 = v12[1];
      Swift::Int v14 = (void *)(*v11
                     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      BOOL v15 = result == *v14 && v13 == v14[1];
      if (v15 || (uint64_t result = sub_15710(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 8;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t v16 = *v11;
      uint64_t v9 = v11[1];
      *uint64_t v11 = v9;
      v11[1] = v16;
      --v11;
      if (v4 == ++v10) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_107BC(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    Swift::Int v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_48;
    }
    Swift::Int v21 = (char *)(a3 - 8);
    while (1)
    {
      Swift::Int v22 = v21 + 8;
      Swift::Int v23 = v6 - 8;
      unint64_t v24 = (uint64_t *)(*((void *)v14 - 1)
                      + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      uint64_t v25 = *v24;
      uint64_t v26 = v24[1];
      uint64_t v27 = (void *)(*((void *)v6 - 1)
                     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      BOOL v28 = v25 == *v27 && v26 == v27[1];
      if (v28 || (sub_15710() & 1) == 0)
      {
        Swift::Int v23 = v14 - 8;
        if (v22 != v14)
        {
          v14 -= 8;
LABEL_45:
          *(void *)Swift::Int v21 = *(void *)v23;
          goto LABEL_46;
        }
        BOOL v29 = v21 >= v14;
        v14 -= 8;
        if (v29) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v22 != v6)
        {
          v6 -= 8;
          goto LABEL_45;
        }
        BOOL v29 = v21 >= v6;
        v6 -= 8;
        if (v29) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v21 -= 8;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  Swift::Int v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      BOOL v15 = (uint64_t *)(*(void *)v6
                      + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      uint64_t v16 = *v15;
      uint64_t v17 = v15[1];
      id v18 = (void *)(*(void *)v4
                     + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      BOOL v19 = v16 == *v18 && v17 == v18[1];
      if (v19 || (sub_15710() & 1) == 0) {
        break;
      }
      int v20 = v6;
      BOOL v19 = v7 == v6;
      v6 += 8;
      if (!v19) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    int v20 = v4;
    BOOL v19 = v7 == v4;
    v4 += 8;
    if (v19) {
      goto LABEL_21;
    }
LABEL_20:
    *(void *)uint64_t v7 = *(void *)v20;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * ((v14 - v4) / 8));
  }
  return 1;
}

char *sub_10A20(char *result, int64_t a2, char a3, char *a4)
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
    sub_389C(&qword_22A78);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  Swift::Int v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10B1C(uint64_t a1)
{
  return sub_10A20(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_10B30(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10BE0(v6, a2, a3);
  return sub_10B98;
}

void sub_10B98(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_10BE0(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_15660();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *unint64_t v3 = v4;
    return sub_10C60;
  }
  __break(1u);
  return result;
}

uint64_t sub_10C60()
{
  return swift_release();
}

uint64_t sub_10C68(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_156E0();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_156E0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_11EBC();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_389C(&qword_225F0);
            uint64_t v10 = sub_10B30(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) <= a2)
      {
        type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10E08(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10E1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char a7, char a8, char a9)
{
  sub_151B0();
  uint64_t v16 = (void *)(v9
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  *uint64_t v16 = a1;
  v16[1] = a2;
  if (a1 == 0xD00000000000001CLL && a2 == 0x8000000000018310 || (sub_15710() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = 0xD000000000000028;
    id v18 = "LIVE_ACTIVITIES_ALLWORKOUTAPPS_APP_TITLE";
  }
  else
  {
    if ((a1 != 0xD00000000000001ALL || a2 != 0x80000000000182F0) && (sub_15710() & 1) == 0)
    {
      uint64_t v21 = v9
          + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName;
      *(void *)(v9
                + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName) = a3;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = 0xD000000000000026;
    id v18 = "LIVE_ACTIVITIES_ALLMUSICAPPS_APP_TITLE";
  }
  uint64_t v19 = sub_31C0(v17, (void *)((unint64_t)(v18 - 32) | 0x8000000000000000));
  a4 = v20;
  uint64_t v21 = v9
      + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName;
  *(void *)(v9
            + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName) = v19;
LABEL_6:
  *(void *)(v21 + 8) = a4;
  *(void *)(v9
            + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) = a5;
  swift_beginAccess();
  id v22 = a5;
  sub_15200();
  swift_endAccess();
  *(unsigned char *)(v9
           + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_installedOnWatch) = a7 & 1;
  *(unsigned char *)(v9
           + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) = a8 & 1;
  *(unsigned char *)(v9
           + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_supportsAppOption) = a9 & 1;
  return v9;
}

uint64_t sub_11020()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_11058(void *a1)
{
  return sub_CD28(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_11064(void *a1)
{
  return sub_D13C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1106C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_110A4(void *a1)
{
  return sub_110BC(a1, (SEL *)&selRef_setGlobalAllowLiveActivities_);
}

uint64_t sub_110B0(void *a1)
{
  return sub_110BC(a1, (SEL *)&selRef_setGlobalAutoLaunchLiveActivities_);
}

uint64_t sub_110BC(void *a1, SEL *a2)
{
  objc_msgSend(a1, *a2, *(unsigned __int8 *)(v2 + 16));
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_115F8((unint64_t *)&qword_22700, v3, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  sub_151E0();
  sub_151F0();

  return swift_release();
}

uint64_t type metadata accessor for LiveActivitiesAutoLaunchModel()
{
  return self;
}

uint64_t sub_11170()
{
  return sub_115F8(&qword_226E0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_111BC()
{
  return sub_115F8(&qword_22708, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
}

uint64_t type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp()
{
  uint64_t result = qword_233E0;
  if (!qword_233E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t destroy for LiveActivitiesAppBundleIds()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LiveActivitiesAppBundleIds(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for LiveActivitiesAppBundleIds(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LiveActivitiesAppBundleIds(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for LiveActivitiesAppBundleIds(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitiesAppBundleIds(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitiesAppBundleIds(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitiesAppBundleIds()
{
  return &type metadata for LiveActivitiesAppBundleIds;
}

uint64_t sub_11490()
{
  return type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
}

void sub_11498()
{
  sub_151C0();
  if (v0 <= 0x3F)
  {
    sub_115AC(319, (unint64_t *)&unk_22820, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_115AC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_115F8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_11648()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void *sub_11688(unint64_t a1, void *a2, void **a3, uint64_t a4, void *a5, unsigned char *a6)
{
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_156E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t result = _swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t result = (void *)sub_156A0();
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v10 = 0;
      unint64_t v70 = v7 & 0xC000000000000001;
      uint64_t v67 = v8;
      unint64_t v68 = v7;
      uint64_t v69 = a2;
      while (1)
      {
        if (v8 == v10)
        {
          __break(1u);
          goto LABEL_46;
        }
        uint64_t v75 = v10;
        if (v70)
        {
          int64_t v11 = (void *)sub_15660();
        }
        else
        {
          int64_t v11 = *(void **)(v7 + 8 * v10 + 32);
          swift_unknownObjectRetain();
        }
        uint64_t v12 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *a2) + 16])();
        id v13 = [v12 settingsForApplication:v11];

        Swift::Int v14 = *a3;
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        id v15 = [v11 bundleIdentifier];
        uint64_t v16 = sub_155F0();
        uint64_t v18 = v17;

        char v19 = sub_F710(v16, v18, v14);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        self;
        uint64_t v20 = (void *)swift_dynamicCastObjCClass();
        if (v20)
        {
          [v20 setCategory:(v19 & 1) != 0];
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease_n();
          swift_unknownObjectRetain();
        }
        char v78 = v19;
        NSString v21 = [v11 bundleIdentifier];
        if (!v21)
        {
          sub_155F0();
          NSString v21 = sub_155E0();
          swift_bridgeObjectRelease();
        }
        id v22 = [a5 settingsForBundleID:v21];

        if (v22)
        {
          unsigned __int8 v23 = [v22 sessionCapable];
        }
        else
        {
          unsigned __int8 v23 = 0;
        }
        id v24 = [v11 bundleIdentifier];
        uint64_t v25 = sub_155F0();
        uint64_t v27 = v26;

        if (v25 != sub_155F0() || v27 != v28)
        {
          char v29 = sub_15710();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v29) {
            goto LABEL_22;
          }
          id v39 = [v11 bundleIdentifier];
          uint64_t v40 = sub_155F0();
          uint64_t v42 = v41;

          if (v40 != sub_155F0() || v42 != v43)
          {
            char v44 = sub_15710();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v44 & 1) == 0) {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
        }
        swift_bridgeObjectRelease_n();
LABEL_22:
        unsigned __int8 v23 = 0;
LABEL_23:
        id v30 = [v11 unionedBackgroundModes];
        NSString v31 = sub_155E0();
        unsigned __int8 v32 = [v30 containsObject:v31];

        id v33 = [v11 bundleIdentifier];
        uint64_t v34 = sub_155F0();
        uint64_t v36 = v35;

        if (v34 != 0xD00000000000001ALL || v36 != 0x80000000000182F0)
        {
          char v38 = sub_15710();
          swift_bridgeObjectRelease();
          if (v38)
          {
            char v37 = 1;
            goto LABEL_35;
          }
          id v45 = [v11 bundleIdentifier];
          uint64_t v46 = sub_155F0();
          uint64_t v48 = v47;

          if (v46 != 0xD00000000000001CLL || v48 != 0x8000000000018310)
          {
            char v49 = v23 & ~v32;
            char v50 = sub_15710();
            swift_bridgeObjectRelease();
            char v37 = v50 | v49;
            goto LABEL_35;
          }
        }
        swift_bridgeObjectRelease();
        char v37 = 1;
LABEL_35:
        char v76 = v37;
        id v51 = [v11 bundleIdentifier];
        uint64_t v77 = sub_155F0();
        uint64_t v53 = v52;

        id v54 = [v11 localizedName];
        uint64_t v55 = sub_155F0();
        uint64_t v57 = v56;

        LOBYTE(v54) = (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & *a2) + 8])();
        char v58 = *a6 | ~v78;
        self;
        uint64_t v59 = (void *)swift_dynamicCastObjCClassUnconditional();
        type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
        swift_allocObject();
        swift_unknownObjectRetain();
        sub_10E1C(v77, v53, v55, v57, v59, v54 & 1, v58 & 1, v78 & 1, v76 & 1);
        swift_unknownObjectRelease();
        id v60 = [v11 bundleIdentifier];
        uint64_t v61 = sub_155F0();
        uint64_t v63 = v62;

        if (v61 == 0xD00000000000001ALL && v63 == 0x80000000000182F0)
        {
          swift_bridgeObjectRelease();
          a2 = v69;
        }
        else
        {
          char v64 = sub_15710();
          swift_bridgeObjectRelease();
          a2 = v69;
          if ((v64 & 1) == 0) {
            goto LABEL_40;
          }
        }
        uint64_t v65 = *(void (**)(uint64_t))&stru_108.segname[swift_isaMask & *a2];
        uint64_t v66 = swift_retain();
        v65(v66);
LABEL_40:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (v74) {
          return (void *)swift_release();
        }
        ++v10;
        sub_15680();
        sub_156B0();
        sub_156C0();
        sub_15690();
        uint64_t v8 = v67;
        unint64_t v7 = v68;
        if (v67 == v75 + 1) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_11E78()
{
  unint64_t result = qword_22A50;
  if (!qword_22A50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_22A50);
  }
  return result;
}

unint64_t sub_11EBC()
{
  unint64_t result = qword_22A70;
  if (!qword_22A70)
  {
    sub_38E0(&qword_225F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22A70);
  }
  return result;
}

void sub_11F18()
{
}

uint64_t sub_11FE4()
{
  return sub_1206C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))&StateObject.wrappedValue.getter);
}

unint64_t sub_11FFC()
{
  unint64_t result = qword_22460;
  if (!qword_22460)
  {
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22460);
  }
  return result;
}

uint64_t sub_12054()
{
  return sub_1206C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))&StateObject.projectedValue.getter);
}

uint64_t sub_1206C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((unsigned __int8 *)v1 + 16);
  uint64_t v5 = type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  unint64_t v6 = sub_11FFC();

  return a1(v2, v3, v4, v5, v6);
}

uint64_t sub_120E0()
{
  sub_389C(&qword_22468);
  sub_154F0();
  return v1;
}

uint64_t sub_12128()
{
  return sub_15500();
}

void (*sub_12174(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 24);
  sub_69AC((uint64_t)v3 + 24, (uint64_t)(v3 + 2));
  *uint64_t v3 = v3[1];
  sub_61C4((uint64_t)(v3 + 2));
  *((void *)v3 + 5) = sub_389C(&qword_22468);
  sub_154F0();
  return sub_6950;
}

uint64_t sub_12218()
{
  sub_389C(&qword_22468);
  sub_15510();
  return v1;
}

uint64_t sub_12264()
{
  sub_389C(&qword_22478);
  sub_15540();
  return v1;
}

uint64_t sub_122B4()
{
  return sub_15550();
}

void (*sub_12308(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(v1 + 48);
  v3[4] = v4;
  v3[5] = v5;
  char v6 = *(unsigned char *)(v1 + 56);
  *((unsigned char *)v3 + 19) = v6;
  v3[3] = v4;
  *uint64_t v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_61C4((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_389C(&qword_22478);
  sub_15540();
  return sub_6BD4;
}

uint64_t sub_123AC()
{
  sub_389C(&qword_22478);
  sub_15560();
  return v1;
}

uint64_t sub_12400()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_11FFC();
  uint64_t v0 = sub_15270();
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 200))(v0);
  swift_release();
  if (v1 == 1)
  {
    uint64_t v2 = 0xD00000000000002DLL;
    uint64_t v3 = (void *)0x80000000000181A0;
  }
  else
  {
    uint64_t v4 = sub_15270();
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 200))(v4);
    swift_release();
    if (v5 == 2) {
      char v6 = "LIVE_ACTIVITIES_AUTOLAUNCH_SETTING_APP";
    }
    else {
      char v6 = "LIVE_ACTIVITIES_AUTOLAUNCH_SETTING_OFF";
    }
    uint64_t v3 = (void *)((unint64_t)(v6 - 32) | 0x8000000000000000);
    uint64_t v2 = 0xD000000000000026;
  }

  return sub_31C0(v2, v3);
}

uint64_t sub_1254C()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_11FFC();
  sub_15270();
  long long v2 = *(_OWORD *)(v0 + 24);
  sub_389C(&qword_22468);
  sub_154F0();
  long long v4 = *(_OWORD *)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 56);
  sub_389C(&qword_22478);
  sub_15560();
  sub_6CB0(v2, *((uint64_t *)&v2 + 1), v3, (uint64_t)&v2);
  sub_389C(&qword_22A80);
  sub_43A4(&qword_22A88, &qword_22A80);
  sub_12D5C();
  return sub_15290();
}

void sub_126A0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v3 = sub_389C(&qword_22AB0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v61 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v59 = (uint64_t *)((char *)&v47 - v6);
  uint64_t v62 = sub_154C0();
  uint64_t v60 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = a1;
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_11FFC();
  uint64_t v9 = sub_15270();
  uint64_t v10 = *(void *)(v9
                  + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  uint64_t v11 = *(void *)(v9
                  + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                  + 8);
  swift_bridgeObjectRetain();
  swift_release();
  sub_B4D8(v81);
  long long v88 = v81[1];
  v89[0] = v81[0];
  sub_621C((uint64_t)&v88);
  long long v87 = v81[2];
  sub_621C((uint64_t)&v87);
  if (v10 == *(void *)&v89[0] && v11 == *((void *)&v89[0] + 1))
  {
    sub_621C((uint64_t)v89);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v13 = sub_15710();
  sub_621C((uint64_t)v89);
  swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_8:
    sub_154B0();
    uint64_t v19 = v60;
    uint64_t v20 = v62;
    (*(void (**)(char *, void, uint64_t))(v60 + 104))(v8, enum case for Image.ResizingMode.stretch(_:), v62);
    uint64_t v21 = sub_154D0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    sub_155C0();
    sub_15280();
    *(void *)&long long v63 = v21;
    *((void *)&v63 + 1) = v82;
    uint64_t v64 = BYTE8(v82);
    *(void *)&long long v65 = v83;
    *((void *)&v65 + 1) = v84[0];
    long long v66 = *(_OWORD *)&v84[8];
    uint64_t v68 = 0;
    long long v67 = 0uLL;
    char v69 = 0;
    goto LABEL_9;
  }
  uint64_t v14 = sub_15270();
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 168))(v14);
  uint64_t v17 = v16;
  swift_release();
  char v18 = *(unsigned char *)(sub_15270()
                 + OBJC_IVAR____TtCC34CSLCompanionLiveActivitiesSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp);
  swift_release();
  sub_538C(v15, v17, v18, (uint64_t)&v82);
  long long v63 = v82;
  uint64_t v64 = v83;
  long long v65 = *(_OWORD *)v84;
  long long v66 = *(_OWORD *)&v84[16];
  long long v67 = v85;
  uint64_t v68 = v86;
  char v69 = 1;
LABEL_9:
  sub_389C(&qword_22AB8);
  sub_130F8();
  sub_1316C();
  sub_153C0();
  uint64_t v22 = v70;
  uint64_t v23 = v71;
  uint64_t v25 = v72;
  uint64_t v24 = v73;
  uint64_t v26 = v75;
  uint64_t v62 = v74;
  unint64_t v27 = v76;
  uint64_t v60 = v77;
  uint64_t v55 = v79;
  uint64_t v56 = v78;
  int v54 = v80;
  uint64_t v28 = sub_153A0();
  uint64_t v29 = (uint64_t)v59;
  *uint64_t v59 = v28;
  *(void *)(v29 + 8) = 0;
  *(unsigned char *)(v29 + 16) = 1;
  uint64_t v30 = sub_389C(&qword_22AD0);
  __chkstk_darwin(v30);
  sub_15260();
  uint64_t v31 = v61;
  sub_13280(v29, v61);
  uint64_t v32 = v22;
  uint64_t v52 = v25;
  uint64_t v53 = v22;
  id v33 = v57;
  uint64_t *v57 = v32;
  v33[1] = v23;
  uint64_t v48 = v26;
  uint64_t v49 = v23;
  v33[2] = v25;
  v33[3] = v24;
  unint64_t v50 = v27;
  uint64_t v51 = v24;
  uint64_t v34 = v62;
  v33[4] = v62;
  v33[5] = v26;
  uint64_t v62 = v34;
  uint64_t v35 = v60;
  v33[6] = v27;
  v33[7] = v35;
  uint64_t v37 = v55;
  uint64_t v36 = v56;
  v33[8] = (uint64_t)v56;
  v33[9] = v37;
  LOBYTE(v25) = v54;
  *((unsigned char *)v33 + 80) = v54;
  uint64_t v38 = sub_389C(&qword_22AD8);
  sub_13280(v31, (uint64_t)v33 + *(int *)(v38 + 48));
  uint64_t v39 = v53;
  uint64_t v40 = v23;
  uint64_t v42 = v51;
  uint64_t v41 = v52;
  uint64_t v43 = v34;
  uint64_t v44 = v26;
  unint64_t v45 = v50;
  uint64_t v46 = v60;
  sub_132E8(v53, v40, v52, v51, v43, v44, v50, v60, v36, v37, v25);
  sub_13368(v29);
  sub_13368(v61);
  sub_133C8(v39, v49, v41, v42, v62, v48, v45, v46, v36, v37, v25);
}

uint64_t sub_12C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, char a5@<W5>, uint64_t a6@<X8>)
{
  uint64_t result = sub_154E0();
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = 0;
  *(unsigned char *)(a6 + 24) = v13;
  *(void *)(a6 + 32) = v14;
  *(void *)(a6 + 40) = a3;
  *(void *)(a6 + 48) = a4;
  *(unsigned char *)(a6 + 56) = a5;
  return result;
}

uint64_t sub_12CC8()
{
  return sub_1254C();
}

void sub_12D0C(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)a1 = sub_15330();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = sub_389C(&qword_22AA8);
  sub_126A0(v3, (uint64_t *)(a1 + *(int *)(v4 + 44)));
}

unint64_t sub_12D5C()
{
  unint64_t result = qword_22A90;
  if (!qword_22A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22A90);
  }
  return result;
}

uint64_t sub_12DB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_12DCC()
{
  return swift_retain();
}

uint64_t destroy for LiveActivitiesAppButton()
{
  sub_12E28();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_12E28()
{
  return swift_release();
}

uint64_t initializeWithCopy for LiveActivitiesAppButton(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_12DCC();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  uint64_t v7 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = a2[6];
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for LiveActivitiesAppButton(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_12DCC();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_12E28();
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 32) = a2[4];
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = a2[5];
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = a2[6];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  return a1;
}

__n128 initializeWithTake for LiveActivitiesAppButton(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LiveActivitiesAppButton(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_12E28();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitiesAppButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitiesAppButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitiesAppButton()
{
  return &type metadata for LiveActivitiesAppButton;
}

uint64_t sub_130BC()
{
  return sub_43A4(&qword_22A98, &qword_22AA0);
}

unint64_t sub_130F8()
{
  unint64_t result = qword_22AC0;
  if (!qword_22AC0)
  {
    sub_38E0(&qword_22AB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22AC0);
  }
  return result;
}

unint64_t sub_1316C()
{
  unint64_t result = qword_22AC8;
  if (!qword_22AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22AC8);
  }
  return result;
}

uint64_t sub_131C0@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_11FFC();
  sub_15270();
  swift_bridgeObjectRetain();
  swift_release();
  sub_3A08();
  uint64_t result = sub_15410();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_13280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_389C(&qword_22AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_132E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, void *a9, uint64_t a10, char a11)
{
  if (a11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_5080(a7);
    id v12 = a9;
  }

  return swift_retain();
}

uint64_t sub_13368(uint64_t a1)
{
  uint64_t v2 = sub_389C(&qword_22AB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_133C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, void *a9, uint64_t a10, char a11)
{
  if (a11)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_50A0(a7);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_13474()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for LiveActivitiesCompanionSection()
{
  return &type metadata for LiveActivitiesCompanionSection;
}

void *sub_134A0()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_134AC()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13980((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_152A0();
}

uint64_t sub_13528()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13980((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_152B0();
}

uint64_t sub_135B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_389C(&qword_22AE0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_389C(&qword_22AE8);
  __chkstk_darwin(v10);
  id v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  sub_389C(&qword_22AF0);
  sub_43A4(&qword_22AF8, &qword_22AF0);
  sub_15400();
  sub_458C();
  sub_13980((unint64_t *)&qword_22388, (void (*)(uint64_t))sub_458C);
  uint64_t v13 = sub_151D0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v12, v9, v6);
  uint64_t v14 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  uint64_t *v14 = v13;
  v14[1] = (uint64_t)a3;
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  id v16 = a3;
  v15(v9, v6);
  uint64_t v23 = sub_31C0(0xD000000000000015, (void *)0x80000000000182A0);
  uint64_t v24 = v17;
  sub_139C8();
  sub_3A08();
  sub_15480();
  swift_bridgeObjectRelease();
  return sub_13A8C((uint64_t)v12);
}

void sub_1383C(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(id *)(v1 + 24);
  uint64_t v4 = sub_13E5C();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & *v3];
  uint64_t v8 = v3;
  char v9 = v7();

  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = sub_13E5C();
    uint64_t v13 = v12;
    nullsub_1();
    uint64_t v14 = v10;
    uint64_t v15 = sub_9D1C();
    uint64_t v17 = v16;
    nullsub_1();
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  *a1 = v4;
  a1[1] = (uint64_t)v6;
  a1[2] = v11;
  a1[3] = (uint64_t)v13;
  a1[4] = v15;
  a1[5] = (uint64_t)v17;
  id v18 = v6;
  sub_13DD8(v11, v13, v15, v17);
  sub_13E18(v11, v13, v15, v17);
}

uint64_t sub_13980(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_139C8()
{
  unint64_t result = qword_22B00;
  if (!qword_22B00)
  {
    sub_38E0(&qword_22AE8);
    sub_43A4(&qword_22B08, &qword_22AE0);
    sub_43A4(&qword_22B10, &qword_22B18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22B00);
  }
  return result;
}

uint64_t sub_13A8C(uint64_t a1)
{
  uint64_t v2 = sub_389C(&qword_22AE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_13AEC()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13980((unint64_t *)&qword_22700, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  uint64_t v0 = sub_152A0();
  [objc_allocWithZone((Class)CSLPRFIconFetcher) init];
  return v0;
}

uint64_t sub_13B88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_13BA4()
{
  return sub_135B8(*(void *)v0, *(void *)(v0 + 8), *(void **)(v0 + 16));
}

void *initializeBufferWithCopyOfBuffer for LiveActivitiesSettingsView(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for LiveActivitiesSettingsView(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

void *assignWithCopy for LiveActivitiesSettingsView(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  uint64_t v7 = (void *)a2[2];
  uint64_t v8 = (void *)a1[2];
  a1[2] = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for LiveActivitiesSettingsView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;

  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitiesSettingsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitiesSettingsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitiesSettingsView()
{
  return &type metadata for LiveActivitiesSettingsView;
}

uint64_t sub_13D68()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_13DD8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    id v4 = a2;
    id v5 = a4;
  }
}

void sub_13E18(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a2)
  {
  }
}

unint64_t sub_13E60()
{
  unint64_t result = qword_22700;
  if (!qword_22700)
  {
    type metadata accessor for LiveActivitiesAutoLaunchModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22700);
  }
  return result;
}

uint64_t sub_13EB8()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13E60();

  return sub_152B0();
}

uint64_t sub_13F14()
{
  return sub_15590();
}

uint64_t sub_1408C(void *a1, void *a2)
{
  uint64_t v4 = sub_153E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_389C(&qword_22B28);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v10 = sub_15330();
  *((void *)v10 + 1) = 0;
  unsigned char v10[16] = 1;
  uint64_t v11 = sub_389C(&qword_22B48);
  sub_14244(a1, a2, (uint64_t)&v10[*(int *)(v11 + 44)]);
  sub_153D0();
  sub_43A4(&qword_22B30, &qword_22B28);
  sub_15490();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_993C((uint64_t)v10, &qword_22B28);
}

uint64_t sub_1423C()
{
  return sub_1408C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_14244@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v34[0] = a2;
  v34[1] = a1;
  uint64_t v4 = sub_389C(&qword_22300);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  uint64_t v41 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_389C(&qword_22308);
  uint64_t v44 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  __chkstk_darwin(v8);
  uint64_t v35 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_389C(&qword_22B50) - 8;
  uint64_t v10 = __chkstk_darwin(v42);
  id v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v43 = (uint64_t)v34 - v13;
  uint64_t v46 = sub_31C0(0xD000000000000021, (void *)0x8000000000018830);
  uint64_t v47 = v14;
  sub_3A08();
  uint64_t v15 = sub_15410();
  uint64_t v37 = v16;
  uint64_t v38 = v15;
  uint64_t v39 = v17;
  int v36 = v18 & 1;
  sub_15380();
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13E60();
  uint64_t v19 = (void *)sub_152B0();
  swift_getKeyPath();
  sub_152C0();
  swift_release();

  sub_15530();
  sub_43A4(&qword_22310, &qword_22300);
  uint64_t v20 = v35;
  uint64_t v21 = v40;
  sub_15450();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v21);
  uint64_t v22 = *(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & *(void *)v34[0]];
  id v23 = v34[0];
  LOBYTE(v21) = v22();

  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = swift_allocObject();
  *(unsigned char *)(v25 + 16) = (v21 & 1) == 0;
  uint64_t v27 = v44;
  uint64_t v26 = v45;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v12, v20, v45);
  uint64_t v28 = (uint64_t *)&v12[*(int *)(v42 + 44)];
  *uint64_t v28 = KeyPath;
  v28[1] = (uint64_t)sub_14894;
  v28[2] = v25;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v26);
  uint64_t v29 = v43;
  sub_148AC((uint64_t)v12, v43);
  sub_14914(v29, (uint64_t)v12);
  uint64_t v31 = v37;
  uint64_t v30 = v38;
  *(void *)a3 = v38;
  *(void *)(a3 + 8) = v31;
  LOBYTE(v20) = v36;
  *(unsigned char *)(a3 + 16) = v36;
  *(void *)(a3 + 24) = v39;
  *(void *)(a3 + 32) = 0;
  *(unsigned char *)(a3 + 40) = 1;
  uint64_t v32 = sub_389C(&qword_22B58);
  sub_14914((uint64_t)v12, a3 + *(int *)(v32 + 64));
  sub_43E8(v30, v31, (char)v20);
  swift_bridgeObjectRetain();
  sub_993C(v29, &qword_22B50);
  sub_993C((uint64_t)v12, &qword_22B50);
  sub_43F8(v30, v31, (char)v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_146C8()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13E60();

  return sub_152A0();
}

uint64_t sub_14714()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_14730()
{
  return sub_13F14();
}

ValueMetadata *type metadata accessor for LiveActivitiesAutoLaunchSection()
{
  return &type metadata for LiveActivitiesAutoLaunchSection;
}

unint64_t sub_1474C()
{
  unint64_t result = qword_22B38;
  if (!qword_22B38)
  {
    sub_38E0(&qword_22B40);
    sub_38E0(&qword_22B28);
    sub_43A4(&qword_22B30, &qword_22B28);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_22B38);
  }
  return result;
}

uint64_t sub_1482C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_152F0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1485C()
{
  return sub_15300();
}

uint64_t sub_14884()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_14894(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_148AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_389C(&qword_22B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_14914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_389C(&qword_22B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1497C@<X0>(uint64_t *a1@<X8>)
{
  sub_458C();
  uint64_t result = sub_151E0();
  *a1 = result;
  return result;
}

uint64_t sub_149BC()
{
  return sub_155A0();
}

uint64_t sub_14A84(uint64_t a1)
{
  uint64_t v2 = sub_153E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_389C(&qword_22238);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_15330();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_389C(&qword_222F8);
  sub_14C38(a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_153D0();
  sub_43A4(&qword_22240, &qword_22238);
  sub_15490();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_4344((uint64_t)v8);
}

uint64_t sub_14C30()
{
  return sub_14A84(*(void *)(v0 + 16));
}

uint64_t sub_14C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v32[3] = a1;
  v32[0] = a2;
  uint64_t v2 = sub_389C(&qword_22300);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  uint64_t v38 = v3;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_389C(&qword_22308);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v39 = (char *)v32 - v11;
  uint64_t v40 = sub_31C0(0xD000000000000017, (void *)0x80000000000181D0);
  uint64_t v41 = v12;
  sub_3A08();
  uint64_t v13 = sub_15410();
  uint64_t v34 = v14;
  uint64_t v35 = v13;
  uint64_t v36 = v15;
  int v33 = v16 & 1;
  uint64_t v17 = sub_15380();
  v32[1] = v18;
  v32[2] = v17;
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_13E60();
  uint64_t v19 = (void *)sub_152B0();
  swift_getKeyPath();
  sub_152C0();
  swift_release();

  sub_15530();
  sub_43A4(&qword_22310, &qword_22300);
  uint64_t v20 = v37;
  sub_15450();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v20);
  uint64_t v21 = v7;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  id v23 = v39;
  uint64_t v24 = v6;
  v22(v39, v10, v6);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v25(v10, v23, v6);
  uint64_t v27 = v34;
  uint64_t v26 = v35;
  uint64_t v28 = v32[0];
  *(void *)v32[0] = v35;
  *(void *)(v28 + 8) = v27;
  LOBYTE(v6) = v33;
  *(unsigned char *)(v28 + 16) = v33;
  *(void *)(v28 + 24) = v36;
  *(void *)(v28 + 32) = 0;
  *(unsigned char *)(v28 + 40) = 1;
  uint64_t v29 = (char *)(v28 + *(int *)(sub_389C(&qword_22318) + 64));
  v25(v29, v10, v24);
  sub_43E8(v26, v27, v6);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v21 + 8);
  swift_bridgeObjectRetain();
  v30(v39, v24);
  v30(v10, v24);
  sub_43F8(v26, v27, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_14FC8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & **a1])();
  *a2 = result & 1;
  return result;
}

uint64_t sub_15030(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & **a2) - 8])(*a1);
}

uint64_t sub_15090()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_150AC()
{
  return sub_155A0();
}

ValueMetadata *type metadata accessor for LiveActivitiesEnabledSection()
{
  return &type metadata for LiveActivitiesEnabledSection;
}

uint64_t sub_15190(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_151A0()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_151B0()
{
  return UUID.init()();
}

uint64_t sub_151C0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_151D0()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_151E0()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_151F0()
{
}

uint64_t sub_15200()
{
  return Published.init(initialValue:)();
}

uint64_t sub_15210()
{
  return Published.projectedValue.getter();
}

uint64_t sub_15220()
{
  return Published.projectedValue.setter();
}

uint64_t sub_15230()
{
  return static Published.subscript.modify();
}

uint64_t sub_15240()
{
  return static Published.subscript.getter();
}

uint64_t sub_15250()
{
  return static Published.subscript.setter();
}

uint64_t sub_15260()
{
  return LabelGroup.init(content:)();
}

uint64_t sub_15270()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_15280()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_15290()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_152A0()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_152B0()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_152C0()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_152D0()
{
  return EnvironmentObject.error()();
}

uint64_t sub_152E0()
{
  return EnvironmentObject.init()();
}

uint64_t sub_152F0()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_15300()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_15310()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_15320()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_15330()
{
  return static VerticalAlignment.center.getter();
}

void sub_15340(Swift::String a1)
{
}

void sub_15350(Swift::String a1)
{
}

uint64_t sub_15360()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_15370()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_15380()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_15390()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_153A0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_153B0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_153C0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_153D0()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_153E0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_153F0()
{
  return Form.init(content:)();
}

uint64_t sub_15400()
{
  return List<>.init(content:)();
}

uint64_t sub_15410()
{
  return Text.init<A>(_:)();
}

uint64_t sub_15420()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_15430()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_15440()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_15450()
{
  return View.labelsHidden()();
}

uint64_t sub_15460()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_15470()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_15480()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_15490()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_154A0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_154B0()
{
  return Image.init(systemName:)();
}

uint64_t sub_154C0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_154D0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_154E0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_154F0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_15500()
{
  return State.wrappedValue.setter();
}

uint64_t sub_15510()
{
  return State.projectedValue.getter();
}

uint64_t sub_15520()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_15530()
{
  return Toggle<>.init(_:isOn:)();
}

uint64_t sub_15540()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_15550()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_15560()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_15570()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_15580()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_15590()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_155A0()
{
  return Section<>.init(content:)();
}

uint64_t sub_155B0()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_155C0()
{
  return static Alignment.center.getter();
}

uint64_t sub_155D0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

NSString sub_155E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_155F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15600()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_15610()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15620()
{
  return specialized Array._endMutation()();
}

uint64_t sub_15630()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_15640()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_15650()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_15660()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_15680()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_15690()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_156A0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_156B0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_156C0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_156D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_156E0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

Swift::Int sub_15700(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_15710()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_15720()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_15730()
{
  return Error._code.getter();
}

uint64_t sub_15740()
{
  return Error._domain.getter();
}

uint64_t sub_15750()
{
  return Error._userInfo.getter();
}

uint64_t sub_15760()
{
  return Hasher.init(_seed:)();
}

void sub_15770(Swift::UInt a1)
{
}

Swift::Int sub_15780()
{
  return Hasher._finalize()();
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t cslprf_app_library_log()
{
  return _cslprf_app_library_log();
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend__setApplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setApplications:");
}

id objc_msgSend__withLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withLock:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_backgroundModes(void *a1, const char *a2, ...)
{
  return _[a1 backgroundModes];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataSourceDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceDidUpdate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_enumerateInstalledApplicationsOnPairedDevice_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateInstalledApplicationsOnPairedDevice:withBlock:");
}

id objc_msgSend_enumerateLocallyAvailableApplicationsForPairedDevice_options_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLocallyAvailableApplicationsForPairedDevice:options:withBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_globalSettings(void *a1, const char *a2, ...)
{
  return _[a1 globalSettings];
}

id objc_msgSend_initWithApplicationLibrary_perApplicationSettingsClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithApplicationLibrary:perApplicationSettingsClass:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_privacyDuringAlwaysOnForLiveActivities(void *a1, const char *a2, ...)
{
  return _[a1 privacyDuringAlwaysOnForLiveActivities];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedLibraryForLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLibraryForLocation:");
}

id objc_msgSend_updateSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsWithBlock:");
}