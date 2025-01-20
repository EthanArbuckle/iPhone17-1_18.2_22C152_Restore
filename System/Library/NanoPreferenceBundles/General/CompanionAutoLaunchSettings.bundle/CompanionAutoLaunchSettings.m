void sub_4118(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t vars8;

  v2 = [objc_alloc((Class)NSArray) initWithArray:*(void *)(a1 + 40)];
  v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

void sub_44B4(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

uint64_t sub_44D8(uint64_t a1, void *a2, void *a3, void *a4)
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
    if (*(unsigned char *)(a1 + 72))
    {
      v12 = *(void **)(a1 + 48);
      v13 = [v7 bundleIdentifier];
      LOBYTE(v12) = [v12 containsObject:v13];

      if ((v12 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      v16 = [v7 backgroundModes];
      unsigned int v17 = [v16 containsObject:@"underwater-depth"];

      if (!v17) {
        goto LABEL_19;
      }
    }
    v18 = cslprf_app_library_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v7 bundleIdentifier];
      *(_DWORD *)buf = 138412802;
      id v27 = v9;
      __int16 v28 = 2112;
      v29 = v19;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "[%@] adding %@; %@", buf, 0x20u);
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_476C;
    v22[3] = &unk_354D0;
    v20 = *(void **)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    id v24 = v7;
    [v20 _withLock:v22];
  }
  else
  {
    v14 = cslprf_app_library_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v9;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "[%@] done enumerating", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
LABEL_19:
  os_activity_scope_leave(&state);

  return v11;
}

void sub_4744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_476C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_4778(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_4790(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_47A8(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = +[NSMutableDictionary dictionary];
  v3 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4948;
  v8[3] = &unk_35570;
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

void sub_4924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_4948(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

id sub_4C24(uint64_t a1, void *a2)
{
  return _[a2 setPrivacyDuringAlwaysOnForLiveActivities:*(unsigned char *)(a1 + 32) == 0];
}

void sub_5390(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSArray) initWithArray:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

void sub_56BC(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

uint64_t sub_56D8(uint64_t a1, void *a2, void *a3, void *a4)
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
    v18[2] = sub_590C;
    v18[3] = &unk_354D0;
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

void sub_58E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_590C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_5918(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_5930(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5948(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = *(void **)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5AE8;
  v8[3] = &unk_35570;
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

void sub_5AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_5AE8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

id sub_5E24()
{
  return [*(id *)(v0+ OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel) privacyDuringAlwaysOnForLiveActivities];
}

char *sub_5E50()
{
  uint64_t v1 = OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel;
  id v2 = objc_allocWithZone((Class)CSLPRFLiveActivitiesBacklightPrivacySettingsDataSource);
  id v3 = v0;
  *(void *)&v0[v1] = [v2 init];

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for BacklightSettingsSwiftModel();
  id v4 = (char *)objc_msgSendSuper2(&v10, "init");
  uint64_t v5 = OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel;
  v6 = *(void **)&v4[OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel];
  id v7 = v4;
  [v6 setDelegate:v7];
  id v8 = *(id *)&v4[v5];
  [v8 start];

  return v7;
}

id sub_5F40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BacklightSettingsSwiftModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_5F84@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BacklightSettingsSwiftModel();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t sub_5FC0()
{
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_602C();

  return sub_27B00();
}

uint64_t type metadata accessor for BacklightSettingsSwiftModel()
{
  return self;
}

unint64_t sub_602C()
{
  unint64_t result = qword_3C9C0[0];
  if (!qword_3C9C0[0])
  {
    type metadata accessor for BacklightSettingsSwiftModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3C9C0);
  }
  return result;
}

id sub_6080()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for BacklightSettingsSwiftModel());

  return [v0 init];
}

uint64_t sub_60B4()
{
  return sub_27CF0();
}

uint64_t sub_616C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3B8C8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  sub_6344(&qword_3B990);
  uint64_t v8 = sub_6388(&qword_3B8D8);
  uint64_t v9 = sub_6E4C((unint64_t *)&unk_3B8E0, &qword_3B8D8);
  uint64_t v15 = v8;
  uint64_t v16 = v9;
  swift_getOpaqueTypeConformance2();
  sub_27F30();
  uint64_t v15 = sub_14E1C(0xD000000000000020, (void *)0x800000000002CAB0);
  uint64_t v16 = v10;
  sub_63D0();
  sub_64B0();
  sub_27DB0();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_633C()
{
  return sub_616C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_6344(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6388(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_63D0()
{
  unint64_t result = qword_3B8D0;
  if (!qword_3B8D0)
  {
    sub_6388(&qword_3B8C8);
    sub_6388(&qword_3B8D8);
    sub_6E4C((unint64_t *)&unk_3B8E0, &qword_3B8D8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3B8D0);
  }
  return result;
}

unint64_t sub_64B0()
{
  unint64_t result = qword_3C2B0;
  if (!qword_3C2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C2B0);
  }
  return result;
}

uint64_t sub_6504(uint64_t a1)
{
  uint64_t v2 = sub_27CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6344(&qword_3B8D8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_27C10();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_6344(&qword_3B998);
  sub_66B0(a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_27CB0();
  sub_6E4C((unint64_t *)&unk_3B8E0, &qword_3B8D8);
  sub_27DC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_6DEC((uint64_t)v8);
}

uint64_t sub_66B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v32[3] = a1;
  v32[0] = a2;
  uint64_t v2 = sub_6344(&qword_3B9A0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  uint64_t v38 = v3;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6344(&qword_3B9A8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v39 = (char *)v32 - v11;
  uint64_t v40 = sub_14E1C(0xD000000000000020, (void *)0x800000000002CAB0);
  uint64_t v41 = v12;
  sub_64B0();
  uint64_t v13 = sub_27D40();
  uint64_t v34 = v14;
  uint64_t v35 = v13;
  uint64_t v36 = v15;
  int v33 = v16 & 1;
  uint64_t v17 = sub_27C60();
  v32[1] = v18;
  v32[2] = v17;
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_602C();
  id v19 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();

  sub_27EA0();
  sub_6E4C((unint64_t *)&qword_3B9B0, &qword_3B9A0);
  uint64_t v20 = v37;
  sub_27D80();
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
  v29 = (char *)(v28 + *(int *)(sub_6344(&qword_3B9B8) + 64));
  v25(v29, v10, v24);
  sub_6E90(v26, v27, v6);
  __int16 v30 = *(void (**)(char *, uint64_t))(v21 + 8);
  swift_bridgeObjectRetain();
  v30(v39, v24);
  v30(v10, v24);
  sub_6EA0(v26, v27, v6);
  return swift_bridgeObjectRelease();
}

id sub_6A3C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*(id *)(*a1+ OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel) privacyDuringAlwaysOnForLiveActivities];
  *a2 = (_BYTE)result;
  return result;
}

id sub_6A7C(unsigned __int8 *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  type metadata accessor for BacklightSettingsSwiftModel();
  sub_602C();
  sub_279C0();
  sub_279D0();
  swift_release();
  uint64_t v4 = *(void **)(v3
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettingsP33_C19C8A1FA0FCF6B3EDADF7E23A9A836927BacklightSettingsSwiftModel_backlightSettingsModel);

  return [v4 setPrivacyDuringAlwaysOnForLiveActivities:v2];
}

uint64_t sub_6AFC()
{
  [objc_allocWithZone((Class)type metadata accessor for BacklightSettingsSwiftModel()) init];
  sub_602C();

  return sub_27B00();
}

uint64_t sub_6B54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_6B78()
{
  return sub_27D90();
}

uint64_t sub_6B94()
{
  return sub_27CF0();
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

uint64_t sub_6D9C()
{
  return sub_6E4C(&qword_3B980, &qword_3B988);
}

void *sub_6DD8()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_6DE4()
{
  return sub_6504(*(void *)(v0 + 16));
}

uint64_t sub_6DEC(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3B8D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_6E4C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6388(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6E90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_6EA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_6EB8()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_6ED4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_6F04()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_6F20()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_6F50()
{
  return 0xD000000000000018;
}

uint64_t sub_6F6C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_6F9C(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x800000000002CAE0;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x800000000002CB00;
  a1[4] = 0xD000000000000018;
  a1[5] = 0x800000000002CB20;
}

void sub_6FEC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_7018()
{
  return sub_773C(*(void *)(v0 + 24));
}

uint64_t sub_7040(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_7084(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_7094()
{
  return swift_release();
}

void sub_70C4(uint64_t a1, uint64_t a2)
{
}

void sub_70EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  *(void *)(v9 + 24) = a2;
  v12[4] = a4;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_7040;
  v12[3] = a5;
  uint64_t v10 = _Block_copy(v12);
  id v11 = v5;
  swift_bridgeObjectRetain();
  swift_release();
  BSDispatchMain();
  _Block_release(v10);
}

uint64_t sub_71D8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_6344(&qword_3BE10);
  uint64_t v11 = sub_28050();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = v11;
  v17[4] = a6;
  v17[5] = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_7040;
  v17[3] = a7;
  uint64_t v13 = _Block_copy(v17);
  id v14 = a1;
  id v15 = a3;
  swift_bridgeObjectRetain();
  swift_release();
  BSDispatchMain();
  _Block_release(v13);

  return swift_bridgeObjectRelease();
}

void sub_72E8()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  v4[4] = sub_DABC;
  v4[5] = v1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_7040;
  v4[3] = &unk_35848;
  uint64_t v2 = _Block_copy(v4);
  id v3 = v0;
  swift_release();
  BSDispatchMain();
  _Block_release(v2);
}

void sub_7498()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  v4[4] = sub_761C;
  v4[5] = v1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_7040;
  v4[3] = &unk_35898;
  uint64_t v2 = _Block_copy(v4);
  id v3 = v0;
  swift_release();
  BSDispatchMain();
  _Block_release(v2);
}

uint64_t sub_7560()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_D120((unint64_t *)&qword_3BAD0, v0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  sub_279C0();
  sub_279D0();

  return swift_release();
}

uint64_t sub_75E4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_761C()
{
  return sub_7560();
}

uint64_t sub_773C(unint64_t a1)
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
    v42 = (char *)(v1 + 32);
    uint64_t v43 = v1 & 0xFFFFFFFFFFFFFF8;
    id v5 = &stru_3A000;
    uint64_t v45 = v2;
    v46 = (void (*)(void))v1;
    unint64_t v44 = v1 & 0xC000000000000001;
    while (v4)
    {
      uint64_t v7 = (void *)sub_28230();
      BOOL v8 = __OFADD__(v3++, 1);
      if (v8) {
        goto LABEL_52;
      }
LABEL_11:
      if (objc_msgSend(v7, v5[100].name, v42))
      {
        type metadata accessor for LiveActivitiesAutoLaunchModel();
        sub_D120((unint64_t *)&qword_3BAD0, v6, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
        sub_279C0();
        sub_279D0();
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
          uint64_t v11 = sub_282E0();
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
                uint64_t v13 = sub_28230();
              }
              else
              {
                uint64_t v13 = *(void *)(v10 + 8 * v12 + 32);
                swift_retain();
              }
              uint64_t v15 = *(void *)(v13
                              + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
              unint64_t v14 = *(void *)(v13
                              + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                              + 8);
              swift_bridgeObjectRetain();
              id v16 = [v7 identifier];
              uint64_t v17 = sub_28010();
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
                  sub_D120((unint64_t *)&qword_3BE08, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
                  sub_279C0();
                  sub_279D0();
                  swift_unknownObjectRelease();
                  swift_release();
                }
              }
              else
              {
                char v20 = sub_28330();
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
          uint64_t v26 = sub_282E0();
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
                uint64_t v29 = sub_28230();
              }
              else
              {
                uint64_t v29 = *(void *)(v25 + 8 * v27 + 32);
                swift_retain();
              }
              uint64_t v31 = *(void *)(v29
                              + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
              uint64_t v30 = *(void *)(v29
                              + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                              + 8);
              swift_bridgeObjectRetain();
              id v32 = [v7 identifier];
              uint64_t v33 = sub_28010();
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
                  sub_D120((unint64_t *)&qword_3BE08, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
                  sub_279C0();
                  sub_279D0();
                  swift_unknownObjectRelease();
                  swift_release();
                }
              }
              else
              {
                char v37 = sub_28330();
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
        id v5 = &stru_3A000;
        if (v47 == v45) {
          goto LABEL_49;
        }
      }
    }
    if (v3 >= *(void *)(v43 + 16)) {
      goto LABEL_53;
    }
    uint64_t v7 = *(void **)&v42[8 * v3];
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
    uint64_t v2 = sub_282E0();
  }
LABEL_49:

  return swift_bridgeObjectRelease();
}

uint64_t variable initialization expression of DepthUnitPreferenceStore.notificationSubscription()
{
  return 0;
}

void *variable initialization expression of RemoteInstalledDepthAppsDataSource._installedDepthApps()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_7D50()
{
  return sub_7E44();
}

uint64_t sub_7D5C(uint64_t a1)
{
  return sub_7E98(a1, &OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_filteredAppLibrary);
}

uint64_t (*sub_7D68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_7DC4()
{
  return sub_7E44();
}

uint64_t sub_7DD0(uint64_t a1)
{
  return sub_7E98(a1, &OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_liveActivitiesWatchLocalApps);
}

uint64_t (*sub_7DDC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_7E38()
{
  return sub_7E44();
}

uint64_t sub_7E44()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_7E8C(uint64_t a1)
{
  return sub_7E98(a1, &OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_liveActivitiesCompanionLocalApps);
}

uint64_t sub_7E98(uint64_t a1, void *a2)
{
  unint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *unint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_7EE8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_7F44()
{
  return swift_retain();
}

uint64_t sub_7F90(uint64_t a1)
{
  unint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_liveActivitiesAllAudioAppsFakeApp);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_7FE4())()
{
  return j_j__swift_endAccess;
}

id sub_8040()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_8098(void *a1)
{
  unint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings);
  swift_beginAccess();
  unint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_80EC())()
{
  return j__swift_endAccess;
}

uint64_t sub_814C()
{
  return 0;
}

uint64_t sub_8154()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_nowPlayingIsInstalled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_819C(char a1)
{
  unint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_nowPlayingIsInstalled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_81E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_8244()
{
  return sub_27900();
}

void sub_8258(void *a1)
{
  id v3 = *(id *)(v1
             + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings);
  *(void *)(v1
            + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) = a1;
  id v2 = a1;
}

uint64_t sub_82A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char a7, char a8, char a9)
{
  swift_allocObject();
  uint64_t v17 = sub_C8E8(a1, a2, a3, a4, a5, a6, a7, a8, a9);

  return v17;
}

uint64_t sub_8350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char a7, char a8, char a9)
{
  uint64_t v10 = sub_C8E8(a1, a2, a3, a4, a5, a6, a7, a8, a9);

  return v10;
}

uint64_t sub_8394()
{
  return sub_279F0();
}

uint64_t sub_83C4()
{
  return sub_27A40();
}

uint64_t sub_8434()
{
  return sub_27FB0();
}

uint64_t sub_84BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v4 = sub_27920();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_8530()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_856C()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_85A8()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_installedOnWatch);
}

uint64_t sub_85B8()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp);
}

uint64_t sub_85C8()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_supportsAppOption);
}

uint64_t sub_85D8()
{
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  uint64_t v2 = *(void *)(v0
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                 + 8);
  if (v1 == 0xD00000000000001CLL && v2 == 0x800000000002CB00
    || (sub_28330() & 1) != 0
    || v1 == 0xD00000000000001ALL && v2 == 0x800000000002CAE0
    || (sub_28330() & 1) != 0)
  {
    return sub_28010();
  }
  swift_bridgeObjectRetain();
  return v1;
}

id sub_86D0()
{
  return [*(id *)(v0+ OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) allowLiveActivitiesForApp];
}

void sub_86FC(char a1)
{
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings);
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  v7[4] = sub_CB24;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_8894;
  v7[3] = &unk_358E8;
  id v5 = _Block_copy(v7);
  id v6 = v3;
  swift_retain();
  swift_release();
  [v6 updateSettingsWithBlock:v5];
  _Block_release(v5);
}

uint64_t sub_87F4(void *a1, char a2)
{
  [a1 setAllowLiveActivitiesForApp:a2 & 1];
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_D120((unint64_t *)&qword_3BE08, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_279C0();
  sub_279D0();

  return swift_release();
}

uint64_t sub_8894(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void (*sub_88F4(void *a1))(void ****a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings;
  v3[6] = v1;
  v3[7] = v4;
  *((unsigned char *)v3 + 64) = [*(id *)(v1 + v4) allowLiveActivitiesForApp];
  return sub_8968;
}

void sub_8968(void ****a1, char a2)
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
    v2[4] = (void **)sub_DAF8;
    v2[5] = (void **)v6;
    void *v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_8894;
    v2[3] = (void **)&unk_35938;
    uint64_t v7 = _Block_copy(v2);
    swift_retain();
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(unsigned char *)(v9 + 16) = v4;
    *(void *)(v9 + 24) = v3;
    v2[4] = (void **)sub_DAF8;
    v2[5] = (void **)v9;
    void *v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_8894;
    v2[3] = (void **)&unk_35988;
    uint64_t v7 = _Block_copy(v2);
    id v10 = v5;
    swift_retain();
  }
  swift_release();
  [v5 updateSettingsWithBlock:v7];
  _Block_release(v7);

  free(v2);
}

id sub_8AFC()
{
  return [*(id *)(v0+ OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) autoLaunchBehaviorForApp];
}

void sub_8B14(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1
                + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  v7[4] = sub_CB30;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_8894;
  v7[3] = &unk_359D8;
  id v5 = _Block_copy(v7);
  id v6 = v3;
  swift_retain();
  swift_release();
  [v6 updateSettingsWithBlock:v5];
  _Block_release(v5);
}

uint64_t sub_8C08(void *a1, uint64_t a2)
{
  [a1 setAutoLaunchBehaviorForApp:a2];
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_D120((unint64_t *)&qword_3BE08, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_279C0();
  sub_279D0();

  return swift_release();
}

void (*sub_8CA4(void *a1))(void ****a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings;
  v3[7] = v1;
  v3[8] = v4;
  v3[6] = [*(id *)(v1 + v4) autoLaunchBehaviorForApp];
  return sub_8D18;
}

void sub_8D18(void ****a1, char a2)
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
    v2[4] = (void **)sub_DAFC;
    v2[5] = (void **)v6;
    void *v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_8894;
    v2[3] = (void **)&unk_35A28;
    uint64_t v7 = _Block_copy(v2);
    swift_retain();
    id v8 = v5;
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    v2[4] = (void **)sub_DAFC;
    v2[5] = (void **)v9;
    void *v2 = _NSConcreteStackBlock;
    v2[1] = (void **)1107296256;
    v2[2] = (void **)sub_8894;
    v2[3] = (void **)&unk_35A78;
    uint64_t v7 = _Block_copy(v2);
    id v10 = v5;
    swift_retain();
  }
  swift_release();
  [v5 updateSettingsWithBlock:v7];
  _Block_release(v7);

  free(v2);
}

uint64_t sub_8EA8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_27A30();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_8F1C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_8F6C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 256))(*a1);
}

void (*sub_8FBC(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_27A20();
  return sub_9048;
}

void sub_9048(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_90B0()
{
  return swift_endAccess();
}

uint64_t sub_9114(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3BAC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  sub_6344(&qword_3BAB8);
  sub_27A10();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_9240(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_6344(&qword_3BAC0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp__globalAllowLiveActivitiesSetting;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_6344(&qword_3BAB8);
  sub_27A00();
  swift_endAccess();
  return sub_9350;
}

void sub_9350(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_27A10();
    swift_endAccess();
    id v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_27A10();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_94C0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v2 = sub_27920();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings));
  uint64_t v3 = v0
     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp__globalAllowLiveActivitiesSetting;
  uint64_t v4 = sub_6344(&qword_3BAB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_95A4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v2 = sub_27920();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings));
  uint64_t v3 = v0
     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp__globalAllowLiveActivitiesSetting;
  uint64_t v4 = sub_6344(&qword_3BAB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

Swift::Int sub_96C4()
{
  sub_28380();
  (*(void (**)(unsigned char *))(*(void *)v0 + 160))(v2);
  return sub_283A0();
}

uint64_t sub_9724@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
  uint64_t v4 = sub_27920();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_979C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 296))();
}

uint64_t sub_97E8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 160))();
}

Swift::Int sub_982C()
{
  sub_28380();
  (*(void (**)(unsigned char *))(**(void **)v0 + 160))(v2);
  return sub_283A0();
}

uint64_t sub_988C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t sub_98CC()
{
  return sub_27900();
}

uint64_t sub_98E8()
{
  return sub_9BBC((SEL *)&selRef_globalAllowLiveActivities);
}

uint64_t sub_98F4(char a1)
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
    aBlock[4] = sub_CB70;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_8894;
    aBlock[3] = &unk_35AC8;
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
    uint64_t result = sub_282D0();
    __break(1u);
  }
  return result;
}

uint64_t (*sub_9AB4(uint64_t a1))(uint64_t a1)
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
  return sub_9B88;
}

uint64_t sub_9B88(uint64_t a1)
{
  return sub_98F4(*(unsigned char *)(a1 + 8));
}

uint64_t sub_9BB0()
{
  return sub_9BBC((SEL *)&selRef_globalAutoLaunchLiveActivities);
}

uint64_t sub_9BBC(SEL *a1)
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

uint64_t sub_9C68(char a1)
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
    aBlock[4] = sub_CB7C;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_8894;
    aBlock[3] = &unk_35B18;
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
    uint64_t result = sub_282D0();
    __break(1u);
  }
  return result;
}

uint64_t (*sub_9E28(uint64_t a1))(uint64_t a1)
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
  return sub_9EFC;
}

uint64_t sub_9EFC(uint64_t a1)
{
  return sub_9C68(*(unsigned char *)(a1 + 8));
}

id RemoteInstalledDepthAppsDataSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

char *sub_9F58()
{
  *(void *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_filteredAppLibrary] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_liveActivitiesWatchLocalApps] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_liveActivitiesCompanionLocalApps] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_liveActivitiesAllAudioAppsFakeApp] = 0;
  v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_nowPlayingIsInstalled] = 0;
  id v1 = self;
  uint64_t v2 = v0;
  id v3 = [v1 sharedSettingsModel];
  *(void *)&v2[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_appSpecificSettings] = v3;
  id v4 = v3;

  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for LiveActivitiesAutoLaunchModel();
  id v5 = objc_msgSendSuper2(&v14, "init");
  id v6 = objc_allocWithZone((Class)CSLPRFInstalledLiveActivityApplicationsDataSource);
  uint64_t v7 = (char *)v5;
  id v8 = [v6 init];
  uint64_t v9 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource;
  id v10 = *(void **)&v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource];
  *(void *)&v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource] = v8;

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

id sub_A0E4()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource];
  if (v1) {
    [v1 invalidate];
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for LiveActivitiesAutoLaunchModel();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_A22C(uint64_t a1)
{
  uint64_t v2 = v1;
  v118 = (char *)_swiftEmptyArrayStorage;
  id v107 = [objc_allocWithZone((Class)CSLPRFLocalApplicationLibrary) init];
  char v117 = 0;
  objc_super v3 = *(void **)((char *)v1
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel_remoteInstalledAppDataSource);
  v115 = v1;
  if (v3)
  {
    id v4 = v3;
    id v5 = [v4 apps];
    sub_D9A0();
    unint64_t v6 = sub_28050();

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_282E0();
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
            id v11 = v111 ? (id)sub_28230() : *(id *)(v6 + 8 * v8 + 32);
            uint64_t v12 = v11;
            id v13 = [v11 bundleIdentifier];
            uint64_t v14 = sub_28010();
            uint64_t v16 = v15;

            if (v14 == 0xD000000000000018 && v16 == 0x800000000002CB20) {
              break;
            }
            char v17 = sub_28330();
            swift_bridgeObjectRelease();
            if (v17) {
              goto LABEL_13;
            }
LABEL_14:
            id v18 = [v12 bundleIdentifier];
            uint64_t v19 = sub_28010();
            uint64_t v21 = v20;

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v9 = sub_B9A0(0, *((void *)v9 + 2) + 1, 1, v9);
            }
            unint64_t v23 = *((void *)v9 + 2);
            unint64_t v22 = *((void *)v9 + 3);
            if (v23 >= v22 >> 1) {
              uint64_t v9 = sub_B9A0((char *)(v22 > 1), v23 + 1, 1, v9);
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
  sub_6344(&qword_3BE18);
  unint64_t v26 = sub_28050();

  v116[0] = (uint64_t)_swiftEmptyArrayStorage;
  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_282E0();
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
      uint64_t v29 = (void *)sub_28230();
    }
    else
    {
      uint64_t v29 = *(void **)(v26 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    if ([v29 supportsSmartStack])
    {
      sub_28260();
      sub_28290();
      sub_282A0();
      sub_28270();
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
  unint64_t v32 = sub_28050();

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
          uint64_t v36 = (void *)sub_28230();
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
      uint64_t v39 = sub_28010();
      uint64_t v41 = v40;

      v42 = (void *)*((void *)v9 + 2);
      if (!v42) {
        break;
      }
      if (*((void *)v9 + 4) == v39 && *((void *)v9 + 5) == v41 || (sub_28330() & 1) != 0)
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
      if (*((void *)v9 + 6) == v39 && *((void *)v9 + 7) == v41 || (sub_28330() & 1) != 0) {
        goto LABEL_41;
      }
      if (v42 == (void *)((char *)&dword_0 + 2)) {
        break;
      }
      v54 = v104;
      uint64_t v55 = 2;
      while (1)
      {
        uint64_t v2 = (void *)(v55 + 1);
        if (__OFADD__(v55, 1)) {
          break;
        }
        BOOL v56 = *((void *)v54 - 1) == v39 && *(void *)v54 == v41;
        if (v56 || (sub_28330() & 1) != 0)
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
      uint64_t v33 = sub_282E0();
      swift_bridgeObjectRelease();
      if (!v33) {
        goto LABEL_83;
      }
    }
    swift_bridgeObjectRelease();
LABEL_57:
    swift_bridgeObjectRelease();
    id v43 = [v36 bundleIdentifier];
    uint64_t v44 = sub_28010();
    uint64_t v46 = v45;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v110 = sub_B9A0(0, *((void *)v110 + 2) + 1, 1, v110);
    }
    unint64_t v48 = *((void *)v110 + 2);
    unint64_t v47 = *((void *)v110 + 3);
    if (v48 >= v47 >> 1) {
      v110 = sub_B9A0((char *)(v47 > 1), v48 + 1, 1, v110);
    }
    *((void *)v110 + 2) = v48 + 1;
    unint64_t v49 = &v110[16 * v48];
    *((void *)v49 + 4) = v44;
    *((void *)v49 + 5) = v46;
    v118 = v110;
    v50 = *(uint64_t (**)(uint64_t *))&stru_B8.segname[(swift_isaMask & *v2) + 16];
    swift_unknownObjectRetain();
    v51 = (void (*)(uint64_t *, void))v50(v116);
    v53 = v52;
    sub_28040();
    if (*(void *)((char *)&dword_10 + (*v53 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (*v53 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_28080();
    sub_280A0();
    sub_28070();
    v51(v116, 0);
    unint64_t v35 = v112 & 0xC000000000000001;
    goto LABEL_43;
  }
LABEL_83:
  swift_bridgeObjectRelease();
  id v113 = [objc_allocWithZone((Class)CSLPRFReturnToAppSettingsModel) init];
  v57 = self;
  NSString v58 = sub_28000();
  id v59 = [v57 fakeApplicationWithIdentifier:v58];

  v60 = *(uint64_t (**)(uint64_t *))&stru_B8.segname[(swift_isaMask & *v2) + 16];
  v61 = (void (*)(uint64_t *, void))v60(v116);
  v63 = v62;
  sub_28040();
  if (*(void *)((char *)&dword_10 + (*v63 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                  + (*v63 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_28080();
  sub_280A0();
  sub_28070();
  v61(v116, 0);
  NSString v64 = sub_28000();
  id v65 = [v57 fakeApplicationWithIdentifier:v64];

  v66 = (uint64_t (*)(uint64_t *, void))v60(v116);
  v68 = v67;
  sub_28040();
  if (*(void *)((char *)&dword_10 + (*v68 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                  + (*v68 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_28080();
  sub_280A0();
  sub_28070();
  uint64_t v69 = v66(v116, 0);
  unint64_t v70 = (*(uint64_t (**)(uint64_t))&stru_B8.segname[swift_isaMask & *v2])(v69);
  v71 = v2;
  swift_unknownObjectRetain();
  id v72 = v113;
  unint64_t v73 = (unint64_t)sub_D1B0(v70, v71, (void **)&v118, a1, v72, &v117);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  if ((v73 & 0x8000000000000000) != 0 || (v73 & 0x4000000000000000) != 0)
  {
    unint64_t v101 = swift_bridgeObjectRetain();
    uint64_t v74 = (uint64_t)sub_B7B0(v101);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v74 = v73 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v116[0] = v74;
  sub_B8A8(v116);
  swift_bridgeObjectRelease();
  v75 = *(uint64_t (**)(uint64_t))((char *)&stru_B8.offset + (swift_isaMask & *v71));
  uint64_t v76 = v75(v116[0]);
  uint64_t v77 = (*(uint64_t (**)(uint64_t))&stru_108.segname[(swift_isaMask & *v71) - 8])(v76);
  if (v77)
  {
    uint64_t v78 = v77;
    unint64_t v79 = (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v71)))();
    unint64_t v80 = sub_B2A4(v78, v79);
    char v82 = v81;
    swift_bridgeObjectRelease();
    if ((v82 & 1) == 0)
    {
      v83 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff
                                                                                         + (swift_isaMask & *v71)))(v116);
      sub_B448(v80);
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
    uint64_t v87 = sub_282E0();
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
      uint64_t v89 = sub_28230();
    }
    else
    {
      uint64_t v89 = *(void *)(v86 + 8 * j + 32);
      swift_retain();
    }
    if (*(unsigned char *)(v89
                  + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) == 1)
    {
      v90 = *(uint64_t (**)(uint64_t *))&stru_108.sectname[swift_isaMask & *v71];
      swift_retain();
      v91 = (void (*)(uint64_t *, void))v90(v116);
      v93 = v92;
      sub_28040();
      if (*(void *)((char *)&dword_10 + (*v93 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (*v93 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_28080();
      sub_280A0();
      sub_28070();
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
    sub_D120((unint64_t *)&qword_3BAD0, v102, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
    sub_279C0();
    sub_279D0();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    return swift_release();
  }
  uint64_t v97 = sub_282E0();
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
        uint64_t v99 = sub_28230();
      }
      else
      {
        uint64_t v99 = *(void *)(v96 + 8 * k + 32);
        swift_retain();
      }
      if ((*(unsigned char *)(v99
                     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) & 1) != 0)
      {
        swift_release();
      }
      else
      {
        sub_28260();
        sub_28290();
        sub_282A0();
        sub_28270();
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

uint64_t sub_B1DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_28330();
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
    if (v12 || (sub_28330() & 1) != 0) {
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

uint64_t sub_B2A4(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  if (a2 >> 62) {
    goto LABEL_21;
  }
  for (i = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)); i; uint64_t result = swift_bridgeObjectRelease())
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      sub_28230();
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
    v3 += OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_id;
    char v5 = sub_27900();
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
        sub_28230();
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
      char v8 = sub_27900();
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
    uint64_t i = sub_282E0();
  }
  return 0;
}

uint64_t sub_B448(unint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v3;
  if (!result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_B924(v3);
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
    sub_28070();
    return v9;
  }
  return result;
}

uint64_t sub_B4E0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t sub_B51C()
{
  id v1 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v0) + 16])();
  id v2 = [v1 globalSettings];

  sub_A22C((uint64_t)v2);

  return swift_unknownObjectRelease();
}

uint64_t sub_B678()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_D120((unint64_t *)&qword_3BAD0, v0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  sub_279C0();
  sub_279D0();

  return swift_release();
}

void *sub_B7B0(unint64_t a1)
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
      sub_6344(&qword_3BE30);
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
    sub_C734((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_282E0();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_B8A8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_C8D4(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_BAA4(v6);
  return sub_28270();
}

uint64_t sub_B924(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_282E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

char *sub_B9A0(char *result, int64_t a2, char a3, char *a4)
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
    sub_6344(&qword_3BE28);
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

uint64_t sub_BAA4(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  uint64_t result = sub_28310(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_152;
    }
    if (v4) {
      return sub_C1B0(0, v4, 1, a1);
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
          uint64_t result = sub_C288((char *)(v99 + 8 * v102), (char *)(v99 + 8 * *(void *)(result + 32 + 16 * (v13 - 1))), v99 + 8 * v103, v112);
          if (v2) {
            break;
          }
          if (v103 < v102) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_C5E8(v101);
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
      sub_28070();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    uint64_t result = sub_28090();
    *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)) = v8;
    unint64_t v112 = (char *)((result & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v113 = result;
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = v11 - 8;
  uint64_t v108 = v7;
  uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v12 = &unk_3E000;
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
      uint64_t v15 = v12[250];
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
            uint64_t result = sub_28330();
            if ((v20 ^ result)) {
              goto LABEL_34;
            }
            uint64_t v15 = v12[250];
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
        uint64_t result = sub_28330();
        int v20 = result;
        Swift::Int v21 = v14;
        Swift::Int v22 = v14 + 2;
        if (v22 < v4)
        {
          uint64_t v15 = v12[250];
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
          uint64_t v39 = v12[250];
          uint64_t v40 = (uint64_t *)(v36 + v39);
          uint64_t result = *v40;
          uint64_t v41 = v40[1];
          v42 = (void *)(*v38 + v39);
          if (result == *v42 && v41 == v42[1]) {
            break;
          }
          uint64_t result = sub_28330();
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
      uint64_t result = (uint64_t)sub_C4EC(0, *((void *)v9 + 2) + 1, 1, v9);
      uint64_t v9 = (char *)result;
    }
    unint64_t v46 = *((void *)v9 + 2);
    unint64_t v45 = *((void *)v9 + 3);
    unint64_t v13 = v46 + 1;
    if (v46 >= v45 >> 1)
    {
      uint64_t result = (uint64_t)sub_C4EC((char *)(v45 > 1), v46 + 1, 1, v9);
      uint64_t v9 = (char *)result;
    }
    *((void *)v9 + 2) = v13;
    unint64_t v47 = v9 + 32;
    unint64_t v48 = (Swift::Int *)&v9[16 * v46 + 32];
    Swift::Int *v48 = v34;
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
          v54 = &v47[16 * v13];
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
          v62 = &v47[16 * v13 - 32];
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
        v67 = &v47[16 * v13 - 32];
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
        uint64_t result = sub_C288((char *)(v91 + 8 * *(void *)v92), (char *)(v91 + 8 * *(void *)v96), v91 + 8 * v97, v112);
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

uint64_t sub_C1B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
                      + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      uint64_t result = *v12;
      uint64_t v13 = v12[1];
      Swift::Int v14 = (void *)(*v11
                     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      BOOL v15 = result == *v14 && v13 == v14[1];
      if (v15 || (uint64_t result = sub_28330(), (result & 1) == 0))
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

uint64_t sub_C288(char *__dst, char *__src, unint64_t a3, char *a4)
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
                      + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      uint64_t v25 = *v24;
      uint64_t v26 = v24[1];
      uint64_t v27 = (void *)(*((void *)v6 - 1)
                     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      BOOL v28 = v25 == *v27 && v26 == v27[1];
      if (v28 || (sub_28330() & 1) == 0)
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
                      + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      uint64_t v16 = *v15;
      uint64_t v17 = v15[1];
      id v18 = (void *)(*(void *)v4
                     + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
      BOOL v19 = v16 == *v18 && v17 == v18[1];
      if (v19 || (sub_28330() & 1) == 0) {
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

char *sub_C4EC(char *result, int64_t a2, char a3, char *a4)
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
    sub_6344(&qword_3BE48);
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

char *sub_C5E8(uint64_t a1)
{
  return sub_C4EC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_C5FC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_C6AC(v6, a2, a3);
  return sub_C664;
}

void sub_C664(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_C6AC(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_28230();
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
    uint64_t *v3 = v4;
    return sub_C72C;
  }
  __break(1u);
  return result;
}

uint64_t sub_C72C()
{
  return swift_release();
}

uint64_t sub_C734(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_282E0();
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
      uint64_t v8 = sub_282E0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_D9E4();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_6344(&qword_3BE38);
            uint64_t v10 = sub_C5FC(v13, i, a3);
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

uint64_t sub_C8D4(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_C8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, char a7, char a8, char a9)
{
  sub_27910();
  uint64_t v16 = (void *)(v9
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  void *v16 = a1;
  v16[1] = a2;
  if (a1 == 0xD00000000000001CLL && a2 == 0x800000000002CB00 || (sub_28330() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = 0xD000000000000028;
    id v18 = "LIVE_ACTIVITIES_ALLWORKOUTAPPS_APP_TITLE";
  }
  else
  {
    if ((a1 != 0xD00000000000001ALL || a2 != 0x800000000002CAE0) && (sub_28330() & 1) == 0)
    {
      uint64_t v21 = v9
          + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName;
      *(void *)(v9
                + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName) = a3;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = 0xD000000000000026;
    id v18 = "LIVE_ACTIVITIES_ALLMUSICAPPS_APP_TITLE";
  }
  uint64_t v19 = sub_14E1C(v17, (void *)((unint64_t)(v18 - 32) | 0x8000000000000000));
  a4 = v20;
  uint64_t v21 = v9
      + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName;
  *(void *)(v9
            + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName) = v19;
LABEL_6:
  *(void *)(v21 + 8) = a4;
  *(void *)(v9
            + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_perAppSettings) = a5;
  swift_beginAccess();
  id v22 = a5;
  sub_279F0();
  swift_endAccess();
  *(unsigned char *)(v9
           + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_installedOnWatch) = a7 & 1;
  *(unsigned char *)(v9
           + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) = a8 & 1;
  *(unsigned char *)(v9
           + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_supportsAppOption) = a9 & 1;
  return v9;
}

uint64_t sub_CAEC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_CB24(void *a1)
{
  return sub_87F4(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_CB30(void *a1)
{
  return sub_8C08(a1, *(void *)(v1 + 16));
}

uint64_t sub_CB38()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_CB70(void *a1)
{
  return sub_CB88(a1, (SEL *)&selRef_setGlobalAllowLiveActivities_);
}

uint64_t sub_CB7C(void *a1)
{
  return sub_CB88(a1, (SEL *)&selRef_setGlobalAutoLaunchLiveActivities_);
}

uint64_t sub_CB88(void *a1, SEL *a2)
{
  objc_msgSend(a1, *a2, *(unsigned __int8 *)(v2 + 16));
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_D120((unint64_t *)&qword_3BAD0, v3, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  sub_279C0();
  sub_279D0();

  return swift_release();
}

uint64_t type metadata accessor for LiveActivitiesAutoLaunchModel()
{
  return self;
}

uint64_t sub_CC3C()
{
  return sub_D120(&qword_3BAB0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_CC88()
{
  return sub_D120(&qword_3BAD8, 255, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
}

uint64_t type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp()
{
  uint64_t result = qword_3CD80;
  if (!qword_3CD80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LiveActivitiesAppBundleIds(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_CF90()
{
  return type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
}

void sub_CF98()
{
  sub_27920();
  if (v0 <= 0x3F)
  {
    sub_D0D4(319, (unint64_t *)&unk_3BBF0, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting(uint64_t a1)
{
}

void sub_D0D4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_D120(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_D170()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void *sub_D1B0(unint64_t a1, void *a2, void **a3, uint64_t a4, void *a5, unsigned char *a6)
{
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_282E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t result = _swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t result = (void *)sub_28280();
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
          int64_t v11 = (void *)sub_28230();
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
        uint64_t v16 = sub_28010();
        uint64_t v18 = v17;

        char v19 = sub_B1DC(v16, v18, v14);
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
          sub_28010();
          NSString v21 = sub_28000();
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
        uint64_t v25 = sub_28010();
        uint64_t v27 = v26;

        if (v25 != sub_28010() || v27 != v28)
        {
          char v29 = sub_28330();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v29) {
            goto LABEL_22;
          }
          id v39 = [v11 bundleIdentifier];
          uint64_t v40 = sub_28010();
          uint64_t v42 = v41;

          if (v40 != sub_28010() || v42 != v43)
          {
            char v44 = sub_28330();
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
        NSString v31 = sub_28000();
        unsigned __int8 v32 = [v30 containsObject:v31];

        id v33 = [v11 bundleIdentifier];
        uint64_t v34 = sub_28010();
        uint64_t v36 = v35;

        if (v34 != 0xD00000000000001ALL || v36 != 0x800000000002CAE0)
        {
          char v38 = sub_28330();
          swift_bridgeObjectRelease();
          if (v38)
          {
            char v37 = 1;
            goto LABEL_35;
          }
          id v45 = [v11 bundleIdentifier];
          uint64_t v46 = sub_28010();
          uint64_t v48 = v47;

          if (v46 != 0xD00000000000001CLL || v48 != 0x800000000002CB00)
          {
            char v49 = v23 & ~v32;
            char v50 = sub_28330();
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
        uint64_t v77 = sub_28010();
        uint64_t v53 = v52;

        id v54 = [v11 localizedName];
        uint64_t v55 = sub_28010();
        uint64_t v57 = v56;

        LOBYTE(v54) = (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & *a2) + 8])();
        char v58 = *a6 | ~v78;
        self;
        uint64_t v59 = (void *)swift_dynamicCastObjCClassUnconditional();
        type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
        swift_allocObject();
        swift_unknownObjectRetain();
        sub_C8E8(v77, v53, v55, v57, v59, v54 & 1, v58 & 1, v78 & 1, v76 & 1);
        swift_unknownObjectRelease();
        id v60 = [v11 bundleIdentifier];
        uint64_t v61 = sub_28010();
        uint64_t v63 = v62;

        if (v61 == 0xD00000000000001ALL && v63 == 0x800000000002CAE0)
        {
          swift_bridgeObjectRelease();
          a2 = v69;
        }
        else
        {
          char v64 = sub_28330();
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
        sub_28260();
        sub_28290();
        sub_282A0();
        sub_28270();
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

unint64_t sub_D9A0()
{
  unint64_t result = qword_3BE20;
  if (!qword_3BE20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3BE20);
  }
  return result;
}

unint64_t sub_D9E4()
{
  unint64_t result = qword_3BE40;
  if (!qword_3BE40)
  {
    sub_6388(&qword_3BE38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BE40);
  }
  return result;
}

void sub_DA40()
{
}

void sub_DB0C(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*sub_DB38())()
{
  return CSLPRFDepthAutoLaunchBehavior.id.getter;
}

uint64_t sub_DB5C()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_E974((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_27B10();
}

uint64_t sub_DBE8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v55 = a3;
  uint64_t v54 = sub_6344(&qword_3BE50);
  uint64_t v52 = *(void *)(v54 - 8);
  uint64_t v5 = __chkstk_darwin(v54);
  uint64_t v53 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v57 = (char *)&v44 - v7;
  uint64_t v47 = sub_6344(&qword_3BE58);
  uint64_t v49 = *(void *)(v47 - 8);
  uint64_t v8 = __chkstk_darwin(v47);
  id v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  int64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = sub_6344(&qword_3BE60);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v56 = (uint64_t)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = *(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *a2) - 8];
  uint64_t v18 = a2;
  uint64_t v19 = v17();

  if (v19)
  {
    __chkstk_darwin(v20);
    *(&v44 - 4) = v19;
    *(&v44 - 3) = a1;
    *(&v44 - 2) = (uint64_t)v18;
    sub_E43C();
    sub_27F30();
    swift_release();
    uint64_t v21 = sub_6344(&qword_3BE68);
    uint64_t v22 = (uint64_t)v16;
    uint64_t v23 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 0, 1, v21);
  }
  else
  {
    uint64_t v24 = sub_6344(&qword_3BE68);
    uint64_t v22 = (uint64_t)v16;
    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v16, 1, 1, v24);
  }
  __chkstk_darwin(v23);
  *(&v44 - 2) = a1;
  *(&v44 - 1) = (uint64_t)v18;
  sub_6344(&qword_3BE70);
  sub_E3C8();
  uint64_t v48 = v11;
  uint64_t v25 = sub_27F30();
  __chkstk_darwin(v25);
  *(&v44 - 2) = a1;
  *(&v44 - 1) = (uint64_t)v18;
  uint64_t v58 = sub_14E1C(0xD00000000000002CLL, (void *)0x800000000002CF50);
  uint64_t v59 = v26;
  sub_64B0();
  uint64_t v58 = sub_27D40();
  uint64_t v59 = v27;
  char v60 = v28 & 1;
  uint64_t v61 = v29;
  id v30 = v57;
  sub_27F10();
  uint64_t v50 = v22;
  uint64_t v31 = v56;
  sub_E600(v22, v56);
  uint64_t v32 = v49;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  id v33 = v51;
  uint64_t v34 = v47;
  v46(v51, v11, v47);
  uint64_t v36 = v52;
  uint64_t v35 = v53;
  id v45 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  char v37 = v30;
  uint64_t v38 = v54;
  v45(v53, v37, v54);
  uint64_t v39 = v55;
  sub_E600(v31, v55);
  uint64_t v40 = sub_6344(&qword_3BE88);
  v46((char *)(v39 + *(int *)(v40 + 48)), v33, v34);
  v45((char *)(v39 + *(int *)(v40 + 64)), v35, v38);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v36 + 8);
  v41(v57, v38);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v32 + 8);
  v42(v48, v34);
  sub_E668(v50);
  v41(v35, v38);
  v42(v33, v34);
  return sub_E668(v56);
}

uint64_t sub_E190@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & **a1) + 8])();
  *a2 = result & 1;
  return result;
}

uint64_t sub_E1F8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & **a2) + 16])(*a1);
}

uint64_t sub_E258()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  long long v3 = *(void (**)(void))((char *)&stru_B8.size + (swift_isaMask & *v1));
  uint64_t v4 = v1;
  v3();

  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = v4;
  sub_6344(&qword_3BE38);
  sub_6E4C(&qword_3BEA0, &qword_3BE38);
  sub_E974(&qword_3BEA8, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_E43C();
  return sub_27EF0();
}

unint64_t sub_E3C8()
{
  unint64_t result = qword_3BE78;
  if (!qword_3BE78)
  {
    sub_6388(&qword_3BE70);
    sub_E43C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BE78);
  }
  return result;
}

unint64_t sub_E43C()
{
  unint64_t result = qword_3BE80;
  if (!qword_3BE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BE80);
  }
  return result;
}

uint64_t sub_E490()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  long long v3 = *(void (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v1));
  uint64_t v4 = v1;
  v3();

  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = v4;
  sub_6344(&qword_3BE38);
  sub_6E4C(&qword_3BEA0, &qword_3BE38);
  sub_E974(&qword_3BEA8, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_E43C();
  return sub_27EF0();
}

uint64_t sub_E600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3BE60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_E668(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3BE60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_E6C8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 32);
  uint64_t v5 = *(void (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v4));
  swift_retain();
  uint64_t v6 = v4;
  v5();

  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_E974((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  uint64_t v7 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();

  swift_release();
  sub_226CC((uint64_t)sub_E91C, v3, v10, v11, v12, (uint64_t)v13);
  long long v8 = v13[1];
  *a1 = v13[0];
  a1[1] = v8;
  a1[2] = v14[0];
  double result = *(double *)((char *)v14 + 9);
  *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)v14 + 9);
  return result;
}

uint64_t sub_E830()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_E974((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_27B00();
}

uint64_t sub_E8AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E8C8@<X0>(uint64_t a1@<X8>)
{
  return sub_DBE8(*(void *)v1, *(void **)(v1 + 8), a1);
}

ValueMetadata *type metadata accessor for LiveActivitiesAppSettingsSection()
{
  return &type metadata for LiveActivitiesAppSettingsSection;
}

uint64_t sub_E8E0()
{
  return sub_6E4C(&qword_3BE90, &qword_3BE98);
}

uint64_t sub_E91C()
{
  return swift_retain();
}

uint64_t sub_E924()
{
  return _swift_deallocObject(v0, 32, 7);
}

double sub_E95C@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_E9BC(a1, (uint64_t)sub_E91C, a2);
}

uint64_t sub_E974(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_E9BC@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = *(void **)(v3 + 24);
  uint64_t v7 = *a1;
  long long v8 = *(void (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v6));
  swift_retain();
  uint64_t v9 = v6;
  v8();

  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_E974((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  uint64_t v10 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();

  swift_release();
  sub_226CC(a2, v7, v13, v14, v15, (uint64_t)v16);
  long long v11 = v16[1];
  *a3 = v16[0];
  a3[1] = v11;
  a3[2] = v17[0];
  double result = *(double *)((char *)v17 + 9);
  *(_OWORD *)((char *)a3 + 41) = *(_OWORD *)((char *)v17 + 9);
  return result;
}

id MediaAutoLaunchModel.mediaAutoLaunchEnabled.getter()
{
  id result = [*(id *)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel_mediaAutoLaunchSetting) value];
  if (result)
  {
    sub_281F0();
    swift_unknownObjectRelease();
    sub_EBB0(&v3, &v4);
    swift_dynamicCast();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_OWORD *sub_EBB0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void MediaAutoLaunchModel.mediaAutoLaunchEnabled.setter(char a1)
{
  long long v3 = *(void **)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel_mediaAutoLaunchSetting);
  if ([v3 value])
  {
    sub_281F0();
    swift_unknownObjectRelease();
    sub_EBB0(&v6, &v7);
    swift_dynamicCast();
    if (v5 != (a1 & 1))
    {
      type metadata accessor for MediaAutoLaunchModel();
      sub_ECE0();
      sub_279C0();
      sub_279D0();
      swift_release();
      Class isa = sub_280B0().super.super.isa;
      [v3 setValue:isa];
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for MediaAutoLaunchModel()
{
  return self;
}

unint64_t sub_ECE0()
{
  unint64_t result = qword_3BEB8;
  if (!qword_3BEB8)
  {
    type metadata accessor for MediaAutoLaunchModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BEB8);
  }
  return result;
}

void (*MediaAutoLaunchModel.mediaAutoLaunchEnabled.modify(void *a1))(uint64_t a1)
{
  long long v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[8] = v1;
  unint64_t result = (void (*)(uint64_t))[*(id *)(v1+ OBJC_IVAR____TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel_mediaAutoLaunchSetting) value];
  if (result)
  {
    sub_281F0();
    swift_unknownObjectRelease();
    sub_EBB0((_OWORD *)v3 + 2, v3);
    swift_dynamicCast();
    *((unsigned char *)v3 + 72) = *((unsigned char *)v3 + 73);
    return sub_EE14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_EE14(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  MediaAutoLaunchModel.mediaAutoLaunchEnabled.setter(*(unsigned char *)(*(void *)a1 + 72));

  free(v1);
}

char *MediaAutoLaunchModel.init()()
{
  sub_EF88();
  v10[3] = &type metadata for Bool;
  LOBYTE(v10[0]) = 1;
  id v1 = objc_allocWithZone((Class)NSString);
  long long v2 = v0;
  NSString v3 = sub_28000();
  id v4 = [v1 initWithString:v3];

  id v5 = [v4 UTF8String];
  id v6 = v4;
  *(void *)&v2[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel_mediaAutoLaunchSetting] = sub_EFC8(0x747541616964656DLL, 0xEF68636E75614C6FLL, v10, (uint64_t)v5);

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for MediaAutoLaunchModel();
  long long v7 = (char *)objc_msgSendSuper2(&v9, "init");
  [*(id *)&v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20MediaAutoLaunchModel_mediaAutoLaunchSetting] setDelegate:v7];
  return v7;
}

unint64_t sub_EF88()
{
  unint64_t result = qword_3BEC0;
  if (!qword_3BEC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3BEC0);
  }
  return result;
}

id sub_EFC8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  NSString v6 = sub_28000();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[3];
  if (v7)
  {
    long long v8 = sub_F2BC(a3, a3[3]);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8);
    long long v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_28320();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_F300((uint64_t)a3);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithKey:v6 defaultValue:v12 notification:a4];

  swift_unknownObjectRelease();
  return v13;
}

id MediaAutoLaunchModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaAutoLaunchModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_F1A8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MediaAutoLaunchModel();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t MediaAutoLaunchModel.twoWaySyncSettingDidUpdate(_:)()
{
  type metadata accessor for MediaAutoLaunchModel();
  sub_ECE0();
  sub_279C0();
  sub_279D0();

  return swift_release();
}

void *sub_F2BC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_F300(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_F350()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_F89C((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_27B00();
}

uint64_t sub_F3CC()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_F89C((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);

  return sub_27B10();
}

id sub_F458()
{
  id v0 = objc_allocWithZone((Class)CSLPRFIconFetcher);

  return [v0 init];
}

uint64_t sub_F494(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_6344(&qword_3BEF0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_6344(&qword_3BEF8);
  __chkstk_darwin(v10);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  sub_6344(&qword_3BF00);
  sub_6E4C(&qword_3BF08, &qword_3BF00);
  sub_27CF0();
  sub_F85C();
  sub_F89C((unint64_t *)&qword_3BF10, (void (*)(uint64_t))sub_F85C);
  uint64_t v13 = sub_279B0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v12, v9, v6);
  uint64_t v14 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  uint64_t *v14 = v13;
  v14[1] = (uint64_t)a3;
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  id v16 = a3;
  v15(v9, v6);
  uint64_t v23 = sub_14E1C(0xD000000000000015, (void *)0x800000000002D030);
  uint64_t v24 = v17;
  sub_F8E4();
  sub_64B0();
  sub_27DB0();
  swift_bridgeObjectRelease();
  return sub_F9A8((uint64_t)v12);
}

void sub_F718(uint64_t *a1@<X8>)
{
  NSString v3 = *(id *)(v1 + 24);
  uint64_t v4 = sub_142FC();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & *v3];
  uint64_t v8 = v3;
  char v9 = v7();

  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = sub_142FC();
    uint64_t v13 = v12;
    CSLPRFDepthAutoLaunchBehavior.id.getter();
    uint64_t v14 = v10;
    uint64_t v15 = sub_DB04();
    uint64_t v17 = v16;
    CSLPRFDepthAutoLaunchBehavior.id.getter();
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
  sub_FD08(v11, v13, v15, v17);
  sub_FD48(v11, v13, v15, v17);
}

unint64_t sub_F85C()
{
  unint64_t result = qword_3C110;
  if (!qword_3C110)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3C110);
  }
  return result;
}

uint64_t sub_F89C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_F8E4()
{
  unint64_t result = qword_3BF18;
  if (!qword_3BF18)
  {
    sub_6388(&qword_3BEF8);
    sub_6E4C(&qword_3BF20, &qword_3BEF0);
    sub_6E4C(&qword_3BF28, &qword_3BF30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF18);
  }
  return result;
}

uint64_t sub_F9A8(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3BEF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_FA08()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_F89C((unint64_t *)&qword_3BAD0, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel);
  uint64_t v0 = sub_27B00();
  [objc_allocWithZone((Class)CSLPRFIconFetcher) init];
  return v0;
}

uint64_t sub_FAA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_FAC0()
{
  return sub_F494(*(void *)v0, *(void *)(v0 + 8), *(void **)(v0 + 16));
}

void *initializeBufferWithCopyOfBuffer for LiveActivitiesSettingsView(void *a1, void *a2)
{
  NSString v3 = (void *)a2[1];
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

__n128 initializeWithTake for LiveActivitiesSettingsView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
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

uint64_t sub_FC98()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_FD08(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    id v4 = a2;
    id v5 = a4;
  }
}

void sub_FD48(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a2)
  {
  }
}

uint64_t sub_FD8C()
{
  return sub_27F40();
}

uint64_t sub_FE4C()
{
  return sub_27AF0();
}

unint64_t sub_FEC0()
{
  unint64_t result = qword_3BF40;
  if (!qword_3BF40)
  {
    sub_6388(&qword_3BF38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF40);
  }
  return result;
}

uint64_t sub_FF1C@<X0>(uint64_t a1@<X8>)
{
  sub_14E1C(0xD000000000000027, (void *)0x800000000002D080);
  sub_64B0();
  uint64_t result = sub_27D40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_FF8C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for LiveActivitiesAODPrivacySection()
{
  return &type metadata for LiveActivitiesAODPrivacySection;
}

unint64_t sub_FFBC()
{
  unint64_t result = qword_3BF48;
  if (!qword_3BF48)
  {
    sub_6388(&qword_3BF50);
    sub_FEC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF48);
  }
  return result;
}

unint64_t sub_10044()
{
  unint64_t result = qword_3BF58;
  if (!qword_3BF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF58);
  }
  return result;
}

uint64_t sub_10098()
{
  return 0;
}

uint64_t sub_100AC(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t sub_100F4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_10188(*v4, v4[1]);
  *char v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t sub_10188(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*sub_101CC())()
{
  return CSLPRFDepthAutoLaunchBehavior.id.getter;
}

double sub_101EC@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_102FC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(void *)&long long v5 = sub_14E1C(0xD000000000000010, (void *)0x800000000002D0B0);
    *((void *)&v5 + 1) = v3;
    sub_64B0();
    sub_27D40();
    sub_102FC();
  }
  sub_27CA0();
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  return result;
}

unint64_t sub_102FC()
{
  unint64_t result = qword_3CFA0[0];
  if (!qword_3CFA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3CFA0);
  }
  return result;
}

uint64_t sub_10350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v48 = sub_6344(&qword_3BF88);
  uint64_t v46 = *(void *)(v48 - 8);
  uint64_t v10 = v46;
  uint64_t v11 = __chkstk_darwin(v48);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v38 - v14;
  swift_bridgeObjectRetain();
  char v16 = sub_814C();
  sub_15DF0(a1, a2, v16 & 1, (uint64_t)v55);
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  sub_64B0();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_27D40();
  uint64_t v51 = v18;
  uint64_t v52 = v17;
  uint64_t v43 = v19;
  int v42 = v20 & 1;
  uint64_t v47 = v15;
  sub_27AF0();
  uint64_t v21 = v55[0];
  uint64_t v22 = v55[1];
  char v23 = v56;
  uint64_t v49 = v57;
  uint64_t v39 = v58;
  unint64_t v24 = v60;
  uint64_t v50 = v59;
  unint64_t v41 = v60;
  uint64_t v26 = v61;
  uint64_t v25 = v62;
  id v44 = v62;
  uint64_t v38 = v63;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  uint64_t v27 = v15;
  uint64_t v28 = v48;
  v40(v13, v27, v48);
  *(void *)a5 = v21;
  *(void *)(a5 + 8) = v22;
  uint64_t v45 = v22;
  *(unsigned char *)(a5 + 16) = v23 & 1;
  uint64_t v29 = v50;
  uint64_t v30 = v39;
  *(void *)(a5 + 24) = v49;
  *(void *)(a5 + 32) = v30;
  *(void *)(a5 + 40) = v29;
  *(void *)(a5 + 48) = v24;
  *(void *)(a5 + 56) = v26;
  *(void *)(a5 + 64) = v25;
  uint64_t v31 = v52;
  *(void *)(a5 + 72) = v38;
  *(void *)(a5 + 80) = v31;
  *(void *)(a5 + 88) = v51;
  LOBYTE(v24) = v42;
  *(unsigned char *)(a5 + 96) = v42;
  *(void *)(a5 + 104) = v43;
  uint64_t v32 = sub_6344(&qword_3BF90);
  v40((char *)(a5 + *(int *)(v32 + 64)), v13, v28);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  unint64_t v33 = v41;
  sub_10E54(v41);
  id v44 = v44;
  swift_retain();
  uint64_t v35 = v51;
  uint64_t v34 = v52;
  sub_6E90(v52, v51, v24);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v46 + 8);
  swift_bridgeObjectRetain();
  v36(v47, v28);
  v36(v13, v28);
  sub_6EA0(v34, v35, v24);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10E74(v33);

  return swift_release();
}

uint64_t sub_106AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_6344(&qword_3BF70);
  __chkstk_darwin(v3 - 8);
  long long v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v9 = v1[2];
  uint64_t v8 = v1[3];
  *(void *)long long v5 = sub_27C10();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v10 = sub_6344(&qword_3BF78);
  sub_10350(v6, v7, v9, v8, (uint64_t)&v5[*(int *)(v10 + 44)]);
  uint64_t v11 = sub_27DD0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_10D8C((uint64_t)v5, a1);
  uint64_t v13 = (uint64_t *)(a1 + *(int *)(sub_6344(&qword_3BF80) + 36));
  uint64_t *v13 = KeyPath;
  v13[1] = v11;
  return sub_10DF4((uint64_t)v5);
}

uint64_t sub_107AC()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_107C8@<D0>(uint64_t a1@<X8>)
{
  return sub_101EC(*(void *)(v1 + 8), a1);
}

uint64_t destroy for SelectedDepthAppButton(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for SelectedDepthAppButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  if (v3)
  {
    *a1 = *a2;
    a1[1] = v3;
    uint64_t v4 = a2[3];
    a1[2] = a2[2];
    a1[3] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
  }
  return a1;
}

void *assignWithCopy for SelectedDepthAppButton(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10944((uint64_t)a1);
      long long v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v5;
    }
  }
  else if (v4)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v6;
  }
  return a1;
}

uint64_t sub_10944(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for DepthApp(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for SelectedDepthAppButton(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 8)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4)
  {
    sub_10944(a1);
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SelectedDepthAppButton(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for SelectedDepthAppButton(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelectedDepthAppButton()
{
  return &type metadata for SelectedDepthAppButton;
}

unint64_t sub_10AD0()
{
  unint64_t result = qword_3BF60;
  if (!qword_3BF60)
  {
    sub_6388(&qword_3BF68);
    sub_102FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF60);
  }
  return result;
}

uint64_t destroy for DepthApp()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DepthApp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DepthApp(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for DepthApp(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthApp(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthApp(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SelectedDepthAppButton.AppContent_Phone()
{
  return &type metadata for SelectedDepthAppButton.AppContent_Phone;
}

uint64_t sub_10D18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_27B90();
  *a1 = result;
  return result;
}

uint64_t sub_10D60()
{
  return sub_27BA0();
}

uint64_t sub_10D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3BF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10DF4(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3BF70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10E54(unint64_t result)
{
  if (result >> 62 == 1) {
    return swift_errorRetain();
  }
  if (!(result >> 62)) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_10E74(unint64_t result)
{
  if (result >> 62 == 1) {
    return _swift_errorRelease(result & 0x3FFFFFFFFFFFFFFFLL);
  }
  if (!(result >> 62)) {
    return swift_release();
  }
  return result;
}

unint64_t sub_10E98()
{
  unint64_t result = qword_3BF98;
  if (!qword_3BF98)
  {
    sub_6388(&qword_3BF80);
    sub_6E4C(&qword_3BFA0, &qword_3BF70);
    sub_6E4C(&qword_3BFA8, &qword_3BFB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF98);
  }
  return result;
}

uint64_t sub_10F64()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);

  return sub_27B00();
}

uint64_t sub_10FE0()
{
  return swift_retain();
}

uint64_t sub_10FE8(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t sub_11014()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);

  return sub_27B10();
}

uint64_t sub_1109C()
{
  sub_27E20();
  return v1;
}

uint64_t sub_110D8()
{
  sub_6344(&qword_3BFB8);
  sub_27E30();
  return v1;
}

uint64_t sub_11120()
{
  return sub_27E40();
}

void (*sub_1116C(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 16);
  sub_1126C((uint64_t)v3 + 24, (uint64_t)(v3 + 2));
  _OWORD *v3 = v3[1];
  sub_112D4((uint64_t)(v3 + 2));
  *((void *)v3 + 5) = sub_6344(&qword_3BFB8);
  sub_27E30();
  return sub_11210;
}

void sub_11210(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  uint64_t v2 = (_OWORD *)(*(void *)a1 + 16);
  char v3 = *(unsigned char *)(*(void *)a1 + 49);
  *(_OWORD *)uint64_t v1 = *v2;
  v1[48] = v3;
  sub_27E40();
  sub_11300((uint64_t)v2);

  free(v1);
}

uint64_t sub_1126C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3BFC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_112D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_11300(uint64_t a1)
{
  return a1;
}

uint64_t sub_1132C()
{
  sub_6344(&qword_3BFB8);
  sub_27E50();
  return v1;
}

uint64_t sub_11378()
{
  sub_6344(&qword_3BFC8);
  sub_27EB0();
  return v1;
}

uint64_t sub_113C8()
{
  return sub_27EC0();
}

void (*sub_1141C(void *a1))(uint64_t a1)
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
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_112D4((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_6344(&qword_3BFC8);
  sub_27EB0();
  return sub_114C0;
}

void sub_114C0(uint64_t a1)
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
  sub_27EC0();
  sub_11534(v2);
  swift_release();

  free(v1);
}

uint64_t sub_11534(uint64_t a1)
{
  return a1;
}

uint64_t sub_11560()
{
  sub_6344(&qword_3BFC8);
  sub_27ED0();
  return v1;
}

_UNKNOWN **sub_115B4()
{
  return &off_35F98;
}

uint64_t sub_115C0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_115C8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, char a3@<W4>, uint64_t a4@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  swift_retain();
  uint64_t v8 = sub_27B00();
  uint64_t v10 = v9;
  sub_27E20();
  uint64_t result = swift_release();
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v10;
  *(unsigned char *)(a4 + 16) = v12;
  *(void *)(a4 + 24) = v13;
  *(void *)(a4 + 32) = a1;
  *(void *)(a4 + 40) = a2;
  *(unsigned char *)(a4 + 48) = a3;
  *(void *)(a4 + 56) = &off_35FD0;
  return result;
}

uint64_t sub_116C4()
{
  uint64_t v1 = sub_27C50();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_6344(&qword_3BFD0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v0;
  sub_6344(&qword_3BFD8);
  sub_6E4C(&qword_3BFE0, &qword_3BFD8);
  sub_27CE0();
  sub_27C40();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  sub_27C30(v12);
  char v6 = (uint64_t *)(*(void *)(v0 + 8)
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_localizedName);
  uint64_t v7 = *v6;
  uint64_t v8 = (void *)v6[1];
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v7;
  v13._object = v8;
  sub_27C20(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  sub_27C30(v14);
  sub_27C70();
  sub_6E4C(&qword_3BFE8, &qword_3BFD0);
  sub_27DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1191C@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  unint64_t v33 = a2;
  uint64_t v3 = sub_6344(&qword_3BFF8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v34 = (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - v6;
  uint64_t v8 = sub_6344(&qword_3C000);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  Swift::String v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v33 - v13;
  uint64_t v35 = a1;
  sub_6344(&qword_3C008);
  uint64_t v15 = sub_6388(&qword_3C010);
  uint64_t v16 = sub_6E4C(&qword_3C018, &qword_3C010);
  *(void *)&long long v36 = v15;
  *((void *)&v36 + 1) = v16;
  swift_getOpaqueTypeConformance2();
  sub_27F30();
  long long v39 = *a1;
  uint64_t v17 = *((void *)&v39 + 1);
  uint64_t v18 = *(uint64_t (**)(uint64_t))(**((void **)&v39 + 1) + 248);
  uint64_t v19 = swift_retain();
  char v20 = v18(v19);
  sub_11300((uint64_t)&v39);
  if ((v20 & 1) == 0) {
    goto LABEL_5;
  }
  long long v36 = a1[2];
  char v37 = *((unsigned char *)a1 + 48);
  sub_6344(&qword_3BFC8);
  sub_27EB0();
  if (v38 != 1) {
    goto LABEL_5;
  }
  uint64_t v21 = *(uint64_t (**)(uint64_t))(*(void *)v17 + 176);
  uint64_t v22 = swift_retain();
  char v23 = v21(v22);
  uint64_t v24 = sub_11300((uint64_t)&v39);
  if (v23)
  {
    __chkstk_darwin(v24);
    *(&v33 - 2) = (char *)a1;
    sub_6344(&qword_3C030);
    sub_13F0C();
    sub_27CF0();
    uint64_t v25 = sub_6344(&qword_3C020);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 0, 1, v25);
  }
  else
  {
LABEL_5:
    uint64_t v26 = sub_6344(&qword_3C020);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
  }
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v27(v12, v14, v8);
  uint64_t v28 = v34;
  sub_141C4((uint64_t)v7, v34, &qword_3BFF8);
  uint64_t v29 = v33;
  v27(v33, v12, v8);
  uint64_t v30 = sub_6344(&qword_3C028);
  sub_141C4(v28, (uint64_t)&v29[*(int *)(v30 + 48)], &qword_3BFF8);
  sub_14228((uint64_t)v7, &qword_3BFF8);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
  v31(v14, v8);
  sub_14228(v28, &qword_3BFF8);
  return ((uint64_t (*)(char *, uint64_t))v31)(v12, v8);
}

uint64_t sub_11D68@<X0>(char *a1@<X8>)
{
  return sub_1191C(*(long long **)(v1 + 16), a1);
}

uint64_t sub_11D70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_11D8C(uint64_t a1)
{
  uint64_t v2 = sub_27CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6344(&qword_3C010);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_27C10();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_6344(&qword_3C0B8);
  sub_11F2C(a1, (uint64_t *)&v8[*(int *)(v9 + 44)]);
  sub_27CB0();
  sub_6E4C(&qword_3C018, &qword_3C010);
  sub_27DC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_14228((uint64_t)v8, &qword_3C010);
}

uint64_t sub_11F2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_6344(&qword_3B9A0);
  uint64_t v38 = *(void *)(v3 - 8);
  long long v39 = (void (*)(void, void, void))v3;
  __chkstk_darwin(v3);
  char v37 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_6344(&qword_3B9A8);
  uint64_t v33 = *(void *)(v40 - 8);
  uint64_t v5 = __chkstk_darwin(v40);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v41 = (char *)&v31 - v8;
  if (*(unsigned char *)(*(void *)(a1 + 8)
                + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp) == 1)
  {
    uint64_t v47 = sub_14E1C(0xD00000000000001ELL, (void *)0x800000000002D1A0);
    uint64_t v48 = v9;
    sub_64B0();
    uint64_t v42 = sub_27D40();
    uint64_t v43 = v10;
    uint64_t v44 = v11 & 1;
    uint64_t v45 = v12;
    char v46 = 0;
  }
  else
  {
    uint64_t v47 = sub_14E1C(0xD000000000000017, (void *)0x800000000002D180);
    uint64_t v48 = v13;
    sub_64B0();
    uint64_t v42 = sub_27D40();
    uint64_t v43 = v15;
    uint64_t v44 = v14 & 1;
    uint64_t v45 = v16;
    char v46 = 1;
  }
  sub_27CA0();
  uint64_t v35 = v48;
  uint64_t v36 = v47;
  uint64_t v17 = v50;
  uint64_t v34 = v49;
  int v32 = v51;
  sub_27C60();
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
  sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();
  swift_release();
  uint64_t v18 = v37;
  sub_27EA0();
  sub_6E4C((unint64_t *)&qword_3B9B0, &qword_3B9A0);
  uint64_t v19 = v7;
  char v20 = v39;
  sub_27D80();
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
  *uint64_t v31 = v36;
  v26[1] = v25;
  char v27 = v34;
  v26[2] = v34;
  v26[3] = v17;
  *((unsigned char *)v26 + 32) = v32;
  v26[5] = 0;
  *((unsigned char *)v26 + 48) = 1;
  uint64_t v28 = sub_6344(&qword_3C0C0);
  v39((char *)v26 + *(int *)(v28 + 64), v19, v23);
  sub_14284(v24, v25, v27);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v21 + 8);
  v29(v41, v23);
  v29(v19, v23);
  return sub_142C0(v24, v25, v27);
}

uint64_t sub_123B8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 176))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_12408(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 184))(*a1);
}

uint64_t sub_12450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v59 = sub_6344(&qword_3C060);
  uint64_t v54 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_6344(&qword_3C070);
  uint64_t v55 = *(void *)(v60 - 8);
  uint64_t v5 = __chkstk_darwin(v60);
  uint64_t v52 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v53 = (char *)&v51 - v7;
  uint64_t v66 = sub_6344(&qword_3C078);
  __chkstk_darwin(v66);
  uint64_t v68 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_6344(&qword_3C080);
  __chkstk_darwin(v56);
  uint64_t v57 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_6344(&qword_3C048);
  __chkstk_darwin(v67);
  uint64_t v58 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_27C00();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_6344(&qword_3C050);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  char v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_6344(&qword_3C088);
  uint64_t v15 = *(void *)(v65 - 8);
  uint64_t v16 = __chkstk_darwin(v65);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v70 = (char *)&v51 - v19;
  uint64_t v20 = *(void *)(a1 + 8);
  unint64_t v21 = *(void *)(v20
                  + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  unint64_t v22 = *(void *)(v20
                  + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                  + 8);
  swift_bridgeObjectRetain();
  sub_6F9C(v78);
  long long v80 = v78[1];
  long long v81 = v78[0];
  sub_14150((uint64_t)&v80);
  long long v79 = v78[2];
  sub_14150((uint64_t)&v79);
  if (__PAIR128__(v22, v21) == v81)
  {
    sub_14150((uint64_t)&v81);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v23 = sub_28330();
    sub_14150((uint64_t)&v81);
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0) {
      goto LABEL_5;
    }
  }
  long long v71 = *(_OWORD *)(a1 + 16);
  sub_6344(&qword_3BFB8);
  sub_27E30();
  if ((v74 & 1) == 0)
  {
    uint64_t v76 = sub_14E1C(0xD000000000000011, (void *)0x800000000002D0D0);
    uint64_t v77 = v43;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
    sub_27B10();
    swift_getKeyPath();
    sub_27B20();
    swift_release();
    swift_release();
    long long v74 = v71;
    uint64_t v75 = v72;
    type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting(0);
    sub_6344(&qword_3C090);
    sub_1417C(&qword_3C098, type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
    sub_6E4C(&qword_3C0A0, &qword_3C090);
    sub_64B0();
    sub_27E80();
    sub_27BF0();
    uint64_t v44 = sub_6E4C(&qword_3C058, &qword_3C050);
    uint64_t v45 = v62;
    uint64_t v46 = v64;
    sub_27D70();
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
    unint64_t v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v49 = sub_6E4C(&qword_3C068, &qword_3C060);
    *(void *)&long long v71 = v59;
    *((void *)&v71 + 1) = v46;
    uint64_t v72 = v49;
    unint64_t v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v50 = (uint64_t)v58;
    sub_27CA0();
    sub_141C4(v50, v68, &qword_3C048);
    swift_storeEnumTagMultiPayload();
    sub_14008();
    sub_27CA0();
    sub_14228(v50, &qword_3C048);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v70, v48);
  }
LABEL_5:
  if (*(unsigned char *)(v20
                + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_installedOnWatch) == 1
    && *(unsigned char *)(v20
                + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_supportsAppOption) == 1)
  {
    uint64_t v76 = sub_14E1C(0xD000000000000011, (void *)0x800000000002D0D0);
    uint64_t v77 = v24;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
    sub_27B10();
    swift_getKeyPath();
    sub_27B20();
    swift_release();
    swift_release();
    long long v74 = v71;
    uint64_t v75 = v72;
    type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting(0);
    sub_6344(&qword_3C0A8);
    sub_1417C(&qword_3C098, type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
    sub_6E4C(&qword_3C0B0, &qword_3C0A8);
    sub_64B0();
    sub_27E80();
    sub_27BF0();
    uint64_t v25 = sub_6E4C(&qword_3C068, &qword_3C060);
    uint64_t v26 = v52;
    uint64_t v27 = v59;
    uint64_t v28 = v64;
    sub_27D70();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v28);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v4, v27);
    uint64_t v29 = v55;
    uint64_t v30 = v53;
    uint64_t v31 = v60;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v53, v26, v60);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v57, v30, v31);
    swift_storeEnumTagMultiPayload();
    uint64_t v32 = sub_6E4C(&qword_3C058, &qword_3C050);
    *(void *)&long long v71 = v62;
    *((void *)&v71 + 1) = v28;
    uint64_t v72 = v32;
    unint64_t v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    *(void *)&long long v71 = v27;
    *((void *)&v71 + 1) = v28;
    uint64_t v72 = v25;
    unint64_t v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    uint64_t v33 = (uint64_t)v58;
    sub_27CA0();
    sub_141C4(v33, v68, &qword_3C048);
    swift_storeEnumTagMultiPayload();
    sub_14008();
    sub_27CA0();
    sub_14228(v33, &qword_3C048);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  }
  else
  {
    uint64_t v76 = sub_14E1C(0xD000000000000011, (void *)0x800000000002D0D0);
    uint64_t v77 = v35;
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    sub_1417C((unint64_t *)&qword_3BE08, (void (*)(uint64_t))type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp);
    sub_27B10();
    swift_getKeyPath();
    sub_27B20();
    swift_release();
    swift_release();
    long long v74 = v71;
    uint64_t v75 = v72;
    type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting(0);
    sub_6344(&qword_3C090);
    sub_1417C(&qword_3C098, type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
    sub_6E4C(&qword_3C0A0, &qword_3C090);
    sub_64B0();
    sub_27E80();
    sub_27BF0();
    uint64_t v36 = sub_6E4C(&qword_3C058, &qword_3C050);
    uint64_t v37 = v62;
    uint64_t v38 = v64;
    sub_27D70();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v38);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v14, v37);
    uint64_t v39 = v15;
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    unint64_t v41 = v70;
    uint64_t v42 = v65;
    v40(v70, v18, v65);
    (*(void (**)(uint64_t, char *, uint64_t))(v39 + 16))(v68, v41, v42);
    swift_storeEnumTagMultiPayload();
    sub_14008();
    *(void *)&long long v71 = v37;
    *((void *)&v71 + 1) = v38;
    uint64_t v72 = v36;
    unint64_t v73 = &protocol witness table for InlinePickerStyle;
    swift_getOpaqueTypeConformance2();
    sub_27CA0();
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v41, v42);
  }
}

uint64_t sub_13464@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t sub_134B0(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 208))(*a1);
}

uint64_t sub_134F8@<X0>(uint64_t a1@<X8>)
{
  sub_14E1C(0xD000000000000026, (void *)0x800000000002D0F0);
  sub_64B0();
  uint64_t v2 = sub_27D40();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_14E1C(0xD000000000000026, (void *)0x800000000002D120);
  uint64_t v9 = sub_27D40();
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
  sub_6E90(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_6E90(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_6EA0(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_6EA0(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_13680@<X0>(uint64_t a1@<X8>)
{
  sub_14E1C(0xD000000000000026, (void *)0x800000000002D0F0);
  sub_64B0();
  uint64_t v2 = sub_27D40();
  uint64_t v22 = v4;
  uint64_t v23 = v3;
  char v6 = v5 & 1;
  sub_14E1C(0xD00000000000002DLL, (void *)0x800000000002D150);
  uint64_t v7 = sub_27D40();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_14E1C(0xD000000000000026, (void *)0x800000000002D120);
  uint64_t v14 = sub_27D40();
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
  sub_6E90(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_6E90(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_6E90(v14, v19, v16);
  swift_bridgeObjectRetain();
  sub_6EA0(v14, v19, v16);
  swift_bridgeObjectRelease();
  sub_6EA0(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_6EA0(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_138AC@<X0>(uint64_t a1@<X8>)
{
  sub_14E1C(0xD000000000000026, (void *)0x800000000002D0F0);
  sub_64B0();
  uint64_t v2 = sub_27D40();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_14E1C(0xD00000000000002DLL, (void *)0x800000000002D150);
  uint64_t v9 = sub_27D40();
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
  sub_6E90(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_6E90(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_6EA0(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_6EA0(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_13A38()
{
  return sub_116C4();
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

uint64_t sub_13D4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_13DCC()
{
  return sub_1417C(&qword_3BFF0, type metadata accessor for CSLPRFLiveActivitiesAutoLaunchAppSetting);
}

Swift::Int sub_13E14()
{
  Swift::UInt v1 = *v0;
  sub_28380();
  sub_28390(v1);
  return sub_283A0();
}

void sub_13E5C()
{
  sub_28390(*v0);
}

Swift::Int sub_13E88()
{
  Swift::UInt v1 = *v0;
  sub_28380();
  sub_28390(v1);
  return sub_283A0();
}

BOOL sub_13ECC(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_13EE0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_13EF0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_13EFC()
{
  return sub_11D8C(*(void *)(v0 + 16));
}

uint64_t sub_13F04@<X0>(uint64_t a1@<X8>)
{
  return sub_12450(*(void *)(v1 + 16), a1);
}

unint64_t sub_13F0C()
{
  unint64_t result = qword_3C038;
  if (!qword_3C038)
  {
    sub_6388(&qword_3C030);
    sub_14008();
    sub_6388(&qword_3C050);
    sub_27C00();
    sub_6E4C(&qword_3C058, &qword_3C050);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C038);
  }
  return result;
}

unint64_t sub_14008()
{
  unint64_t result = qword_3C040;
  if (!qword_3C040)
  {
    sub_6388(&qword_3C048);
    sub_6388(&qword_3C050);
    sub_27C00();
    sub_6E4C(&qword_3C058, &qword_3C050);
    swift_getOpaqueTypeConformance2();
    sub_6388(&qword_3C060);
    sub_6E4C(&qword_3C068, &qword_3C060);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C040);
  }
  return result;
}

uint64_t sub_14150(uint64_t a1)
{
  return a1;
}

uint64_t sub_1417C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_141C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6344(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_14228(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6344(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_14284(uint64_t a1, uint64_t a2, char a3)
{
  sub_6E90(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_142C0(uint64_t a1, uint64_t a2, char a3)
{
  sub_6EA0(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

unint64_t sub_14300()
{
  unint64_t result = qword_3BAD0;
  if (!qword_3BAD0)
  {
    type metadata accessor for LiveActivitiesAutoLaunchModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BAD0);
  }
  return result;
}

uint64_t sub_14358()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_14300();

  return sub_27B10();
}

uint64_t sub_143B4()
{
  return sub_27F20();
}

uint64_t sub_1452C(void *a1, void *a2)
{
  uint64_t v4 = sub_27CC0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6344(&qword_3C0D0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v10 = sub_27C10();
  *((void *)v10 + 1) = 0;
  unsigned char v10[16] = 1;
  uint64_t v11 = sub_6344(&qword_3C0F0);
  sub_146E4(a1, a2, (uint64_t)&v10[*(int *)(v11 + 44)]);
  sub_27CB0();
  sub_6E4C(&qword_3C0D8, &qword_3C0D0);
  sub_27DC0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_14228((uint64_t)v10, &qword_3C0D0);
}

uint64_t sub_146DC()
{
  return sub_1452C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_146E4@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v34[0] = a2;
  v34[1] = a1;
  uint64_t v4 = sub_6344(&qword_3B9A0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  uint64_t v41 = v5;
  __chkstk_darwin(v4);
  char v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6344(&qword_3B9A8);
  uint64_t v44 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  __chkstk_darwin(v8);
  uint64_t v35 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_6344(&qword_3C0F8) - 8;
  uint64_t v10 = __chkstk_darwin(v42);
  char v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v43 = (uint64_t)v34 - v13;
  uint64_t v46 = sub_14E1C(0xD000000000000021, (void *)0x800000000002D220);
  uint64_t v47 = v14;
  sub_64B0();
  uint64_t v15 = sub_27D40();
  uint64_t v37 = v16;
  uint64_t v38 = v15;
  uint64_t v39 = v17;
  int v36 = v18 & 1;
  sub_27C60();
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_14300();
  uint64_t v19 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();

  sub_27EA0();
  sub_6E4C((unint64_t *)&qword_3B9B0, &qword_3B9A0);
  uint64_t v20 = v35;
  uint64_t v21 = v40;
  sub_27D80();
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
  v28[1] = (uint64_t)sub_14D34;
  v28[2] = v25;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v26);
  uint64_t v29 = v43;
  sub_14D4C((uint64_t)v12, v43);
  sub_14DB4(v29, (uint64_t)v12);
  uint64_t v31 = v37;
  uint64_t v30 = v38;
  *(void *)a3 = v38;
  *(void *)(a3 + 8) = v31;
  LOBYTE(v20) = v36;
  *(unsigned char *)(a3 + 16) = v36;
  *(void *)(a3 + 24) = v39;
  *(void *)(a3 + 32) = 0;
  *(unsigned char *)(a3 + 40) = 1;
  uint64_t v32 = sub_6344((uint64_t *)&unk_3C100);
  sub_14DB4((uint64_t)v12, a3 + *(int *)(v32 + 64));
  sub_6E90(v30, v31, (char)v20);
  swift_bridgeObjectRetain();
  sub_14228(v29, &qword_3C0F8);
  sub_14228((uint64_t)v12, &qword_3C0F8);
  sub_6EA0(v30, v31, (char)v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_14B68()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_14300();

  return sub_27B00();
}

uint64_t sub_14BB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_14BD0()
{
  return sub_143B4();
}

ValueMetadata *type metadata accessor for LiveActivitiesAutoLaunchSection()
{
  return &type metadata for LiveActivitiesAutoLaunchSection;
}

unint64_t sub_14BEC()
{
  unint64_t result = qword_3C0E0;
  if (!qword_3C0E0)
  {
    sub_6388(&qword_3C0E8);
    sub_6388(&qword_3C0D0);
    sub_6E4C(&qword_3C0D8, &qword_3C0D0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C0E0);
  }
  return result;
}

uint64_t sub_14CCC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_27B70();
  *a1 = result & 1;
  return result;
}

uint64_t sub_14CFC()
{
  return sub_27B80();
}

uint64_t sub_14D24()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_14D34(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_14D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3C0F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_14DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3C0F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_14E1C(uint64_t a1, void *a2)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v5 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11.value._object = (void *)0x800000000002D250;
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  v11.value._countAndFlagsBits = 0xD00000000000001BLL;
  v6.super.Class isa = v5;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  uint64_t v7 = sub_27820(v10, v11, v6, v12, v9);

  return v7;
}

unint64_t sub_14ED8()
{
  return 0xD00000000000001BLL;
}

id sub_14EF4()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];

  return v1;
}

uint64_t sub_14F50()
{
  return 0;
}

uint64_t sub_14F5C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t sub_14F94()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_14F9C(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*sub_14FA4())()
{
  return CSLPRFDepthAutoLaunchBehavior.id.getter;
}

double sub_14FC4@<D0>(uint64_t a1@<X8>)
{
  sub_27E20();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_15018()
{
  return 0;
}

uint64_t sub_1502C()
{
  sub_F85C();
  sub_15070();

  return sub_27B40();
}

unint64_t sub_15070()
{
  unint64_t result = qword_3BF10;
  if (!qword_3BF10)
  {
    sub_F85C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BF10);
  }
  return result;
}

uint64_t sub_150C8(unint64_t a1, unint64_t a2)
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
  sub_6344(&qword_3C120);
  sub_27E30();
  swift_unknownObjectRelease();
  uint64_t result = sub_10E74(*(unint64_t *)&v36[24]);
  if (*(void *)&v36[16])
  {
    if (a2)
    {
      if (*(_OWORD *)&v36[8] == __PAIR128__(a2, a1)) {
        return swift_bridgeObjectRelease();
      }
      char v9 = sub_28330();
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
  sub_27E30();
  swift_bridgeObjectRelease();
  sub_10E74(*(unint64_t *)&v36[24]);
  if (*(void *)v36)
  {
    objc_msgSend(*(id *)v36, "invalidate", v24, v25, v26);
    swift_unknownObjectRelease();
  }
  *(_OWORD *)int v36 = v32;
  *(_OWORD *)&v36[16] = v33;
  sub_16AEC((uint64_t)v36, (uint64_t)v39, &qword_3C1C8);
  sub_16AEC((uint64_t)&v36[8], (uint64_t)v38, &qword_3C1D0);
  sub_16ADC(&v36[24], &v37);
  sub_16AEC((uint64_t)&v34, (uint64_t)v35, &qword_3C1D8);
  if (a2)
  {
    Swift::String v10 = *(void **)(v2 + 64);
    if (!v10)
    {
      sub_F85C();
      sub_15070();
      swift_bridgeObjectRetain();
      uint64_t result = sub_27B30();
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    id v11 = [v10 iconCache];
    NSString v12 = sub_28000();
    id v13 = [v11 iconForName:v12 fallBackToPersistentStoreIfNecessary:0];

    if (v13)
    {
      sub_16B50((uint64_t)v39);
      sub_16B7C((uint64_t)v38);
      sub_16BA8(&v37);
      sub_112D4((uint64_t)v35);
      sub_27E30();
      swift_bridgeObjectRelease();
      sub_27E40();
      sub_16BD4((uint64_t)v39);
      sub_14150((uint64_t)v38);
      sub_16C00(&v37);
      sub_11534((uint64_t)v35);
      sub_16B50((uint64_t)v39);
      sub_16B7C((uint64_t)v38);
      sub_16BA8(&v37);
      sub_112D4((uint64_t)v35);
      sub_27E30();
      swift_unknownObjectRelease();
      sub_27E40();
      sub_16BD4((uint64_t)v39);
      sub_14150((uint64_t)v38);
      sub_16C00(&v37);
      sub_11534((uint64_t)v35);
      id v14 = v13;
      uint64_t v15 = sub_27DE0();
      sub_16B50((uint64_t)v39);
      sub_16B7C((uint64_t)v38);
      sub_16BA8(&v37);
      sub_112D4((uint64_t)v35);
      sub_27E30();
      sub_10E74(v31);
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v30;
      *(void *)&v28[16] = *(void *)&v30[16];
      unint64_t v29 = v15;
      sub_27E40();
    }
    else
    {
      id v16 = v10;
      NSString v17 = sub_28000();
      uint64_t v18 = *(unsigned __int8 *)(v3 + 16);
      uint64_t v19 = (_OWORD *)swift_allocObject();
      long long v20 = *(_OWORD *)(v3 + 48);
      v19[3] = *(_OWORD *)(v3 + 32);
      v19[4] = v20;
      v19[5] = *(_OWORD *)(v3 + 64);
      long long v21 = *(_OWORD *)(v3 + 16);
      v19[1] = *(_OWORD *)v3;
      v19[2] = v21;
      uint64_t v26 = sub_16C90;
      uint64_t v27 = v19;
      *(void *)&long long v24 = _NSConcreteStackBlock;
      *((void *)&v24 + 1) = 1107296256;
      *(void *)&long long v25 = sub_158D4;
      *((void *)&v25 + 1) = &unk_363F8;
      uint64_t v22 = _Block_copy(&v24);
      sub_15C00(v3);
      swift_release();
      id v23 = [v16 iconFetchTaskForBundleIdentifier:v17 isPhoneApp:v18 completion:v22];
      _Block_release(v22);

      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      sub_16B50((uint64_t)v39);
      sub_16B7C((uint64_t)v38);
      sub_16BA8(&v37);
      sub_112D4((uint64_t)v35);
      swift_unknownObjectRetain();
      sub_27E30();
      swift_unknownObjectRelease();
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      *(void *)uint64_t v28 = v23;
      *(_OWORD *)&v28[8] = *(_OWORD *)&v30[8];
      unint64_t v29 = v31;
      sub_27E40();
      sub_16BD4((uint64_t)v39);
      sub_14150((uint64_t)v38);
      sub_16C00(&v37);
      sub_11534((uint64_t)v35);
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      sub_16B50((uint64_t)v39);
      sub_16B7C((uint64_t)v38);
      sub_16BA8(&v37);
      sub_112D4((uint64_t)v35);
      sub_27E30();
      swift_bridgeObjectRelease();
      long long v24 = v32;
      long long v25 = v33;
      uint64_t v26 = v34;
      *(void *)uint64_t v28 = *(void *)v30;
      *(void *)&v28[8] = a1;
      *(void *)&v28[16] = a2;
      unint64_t v29 = v31;
      sub_27E40();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_16B50((uint64_t)v39);
    sub_16B7C((uint64_t)v38);
    sub_16BA8(&v37);
    sub_112D4((uint64_t)v35);
    sub_27E30();
    swift_unknownObjectRelease();
    sub_27E40();
    sub_16BD4((uint64_t)v39);
    sub_14150((uint64_t)v38);
    sub_16C00(&v37);
    sub_11534((uint64_t)v35);
    sub_16B50((uint64_t)v39);
    sub_16B7C((uint64_t)v38);
    sub_16BA8(&v37);
    sub_112D4((uint64_t)v35);
    sub_27E30();
    swift_bridgeObjectRelease();
    sub_27E40();
    sub_16BD4((uint64_t)v39);
    sub_14150((uint64_t)v38);
    sub_16C00(&v37);
    sub_11534((uint64_t)v35);
    sub_16B50((uint64_t)v39);
    sub_16B7C((uint64_t)v38);
    sub_16BA8(&v37);
    sub_112D4((uint64_t)v35);
    sub_27E30();
    sub_10E74(v31);
    long long v24 = v32;
    long long v25 = v33;
    uint64_t v26 = v34;
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v30;
    *(void *)&v28[16] = *(void *)&v30[16];
    unint64_t v29 = 0x8000000000000000;
    sub_27E40();
  }
  sub_16BD4((uint64_t)v39);
  sub_14150((uint64_t)v38);
  sub_16C00(&v37);
  return sub_11534((uint64_t)v35);
}

void sub_158D4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_15960@<X0>(uint64_t *a1@<X8>)
{
  sub_6344(&qword_3C120);
  sub_27E30();
  sub_10E54(v19);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_10E74(v19);
  sub_F85C();
  sub_15070();
  uint64_t v3 = sub_27B40();
  uint64_t v5 = v4;
  id v6 = (_OWORD *)swift_allocObject();
  long long v7 = *(_OWORD *)(v1 + 48);
  v6[3] = *(_OWORD *)(v1 + 32);
  v6[4] = v7;
  v6[5] = *(_OWORD *)(v1 + 64);
  long long v8 = *(_OWORD *)(v1 + 16);
  v6[1] = *(_OWORD *)v1;
  uint64_t v6[2] = v8;
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
  a1[5] = (uint64_t)sub_15B28;
  a1[6] = (uint64_t)v6;
  a1[7] = (uint64_t)sub_15BAC;
  a1[8] = (uint64_t)v9;
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = v14;
  a1[12] = v13;
  a1[13] = (uint64_t)sub_15BD4;
  a1[14] = (uint64_t)v15;
  sub_15C00(v1);
  sub_15C00(v1);
  sub_15C00(v1);
  return swift_bridgeObjectRetain();
}

unint64_t sub_15B28()
{
  long long v2 = *(_OWORD *)(v0 + 40);
  long long v3 = *(_OWORD *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 72);
  sub_6344(&qword_3C120);
  sub_27E30();
  swift_bridgeObjectRelease();
  unint64_t result = sub_10E74(v6);
  if (v5)
  {
    objc_msgSend(v5, "invalidate", v2, v3, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_15BAC()
{
  return sub_150C8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_15BD4(unint64_t *a1)
{
  return sub_150C8(*a1, a1[1]);
}

uint64_t sub_15C00(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  long long v3 = *(void **)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_10E54(v2);
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t sub_15C70@<X0>(void *a1@<X0>, unint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (!(a2 >> 62))
  {
    swift_retain();
LABEL_5:
    uint64_t result = sub_27CA0();
    *(void *)a3 = v6;
    *(unsigned char *)(a3 + 8) = v7;
    return result;
  }
  if (a1)
  {
    id v4 = [a1 genericIcon];
    sub_27DE0();
    goto LABEL_5;
  }
  sub_F85C();
  sub_15070();
  uint64_t result = sub_27B30();
  __break(1u);
  return result;
}

uint64_t sub_15D38@<X0>(uint64_t a1@<X8>)
{
  return sub_15C70(*(void **)v1, *(void *)(v1 + 16), a1);
}

__n128 sub_15D54@<Q0>(uint64_t a1@<X8>)
{
  sub_27E20();
  sub_F85C();
  sub_15070();
  uint64_t v2 = sub_27B40();
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

__n128 sub_15DF0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  sub_27E20();
  sub_F85C();
  sub_15070();
  uint64_t v8 = sub_27B40();
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

uint64_t sub_15EA0@<X0>(uint64_t *a1@<X8>)
{
  return sub_15960(a1);
}

uint64_t sub_15EE4(unint64_t a1)
{
  if (a1 >> 62) {
    return 0;
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_15F10(unint64_t a1)
{
  if (a1 >> 62 != 1) {
    return 0;
  }
  uint64_t v1 = a1 & 0x3FFFFFFFFFFFFFFFLL;
  swift_errorRetain();
  return v1;
}

uint64_t sub_15F50()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for AsyncIcon(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_10E74(*(void *)(a1 + 48));
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
  sub_10E54(v6);
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
  sub_10E54(v4);
  unint64_t v5 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v4;
  sub_10E74(v5);
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
  sub_10E74(v6);
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
  sub_10E54(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for AsyncIconPhase(unint64_t *a1)
{
  return sub_10E74(*a1);
}

unint64_t *assignWithCopy for AsyncIconPhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10E54(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_10E74(v4);
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
  sub_10E74(v3);
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

uint64_t sub_16414(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_16430(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_16440(unint64_t *result, uint64_t a2)
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

unint64_t sub_16480()
{
  unint64_t result = qword_3C128;
  if (!qword_3C128)
  {
    sub_6388(&qword_3C130);
    sub_164FC();
    sub_16648();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C128);
  }
  return result;
}

unint64_t sub_164FC()
{
  unint64_t result = qword_3C138;
  if (!qword_3C138)
  {
    sub_6388(&qword_3C140);
    sub_16578();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C138);
  }
  return result;
}

unint64_t sub_16578()
{
  unint64_t result = qword_3C148;
  if (!qword_3C148)
  {
    sub_6388(&qword_3C150);
    sub_165F4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C148);
  }
  return result;
}

unint64_t sub_165F4()
{
  unint64_t result = qword_3D3E0[0];
  if (!qword_3D3E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3D3E0);
  }
  return result;
}

unint64_t sub_16648()
{
  unint64_t result = qword_3C158;
  if (!qword_3C158)
  {
    sub_6388(&qword_3C160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C158);
  }
  return result;
}

unint64_t destroy for AsyncIcon.Inner(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);

  return sub_10E74(v2);
}

void *_s27CompanionAutoLaunchSettings9AsyncIconV5InnerVwCP_0(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  unint64_t v5 = *(void *)(a2 + 16);
  id v6 = v3;
  sub_10E54(v5);
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
  sub_10E54(v7);
  unint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  sub_10E74(v8);
  return a1;
}

uint64_t assignWithTake for AsyncIcon.Inner(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_10E74(v5);
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
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon.Inner()
{
  return &type metadata for AsyncIcon.Inner;
}

unint64_t destroy for AsyncIcon.LoadingState(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 24);

  return sub_10E74(v2);
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
  sub_10E54(v4);
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
  sub_10E54(v4);
  unint64_t v5 = a1[3];
  a1[3] = v4;
  sub_10E74(v5);
  return a1;
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
  sub_10E74(v5);
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
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon.LoadingState()
{
  return &type metadata for AsyncIcon.LoadingState;
}

uint64_t sub_16AC0()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_16ADC(void *a1, void *a2)
{
  *a2 = *a1;
  return a2;
}

uint64_t sub_16AEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6344(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_16B50(uint64_t a1)
{
  return a1;
}

uint64_t sub_16B7C(uint64_t a1)
{
  return a1;
}

unint64_t *sub_16BA8(unint64_t *a1)
{
  return a1;
}

uint64_t sub_16BD4(uint64_t a1)
{
  return a1;
}

unint64_t *sub_16C00(unint64_t *a1)
{
  return a1;
}

uint64_t sub_16C30()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_10E74(*(void *)(v0 + 64));
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_16C90(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = a1;
    sub_27DE0();
    long long v6 = *(_OWORD *)(v2 + 40);
    long long v8 = *(_OWORD *)(v2 + 56);
    uint64_t v10 = *(void *)(v2 + 72);
    long long v12 = v6;
    long long v13 = v8;
    sub_16AEC((uint64_t)&v12, (uint64_t)v16, &qword_3C1C8);
    sub_16AEC((uint64_t)&v12 + 8, (uint64_t)v15, &qword_3C1D0);
    sub_16ADC((void *)&v13 + 1, &v14);
    sub_16AEC((uint64_t)&v10, (uint64_t)v11, &qword_3C1D8);
    sub_16B50((uint64_t)v16);
    sub_16B7C((uint64_t)v15);
    sub_16BA8(&v14);
    sub_112D4((uint64_t)v11);
    sub_6344(&qword_3C120);
    sub_27E30();
    sub_10E74(v5);
    sub_27E40();
  }
  else
  {
    if (!a2)
    {
      sub_16F30();
      swift_allocError();
    }
    long long v7 = *(_OWORD *)(v2 + 40);
    long long v9 = *(_OWORD *)(v2 + 56);
    uint64_t v10 = *(void *)(v2 + 72);
    long long v12 = v7;
    long long v13 = v9;
    sub_16AEC((uint64_t)&v12, (uint64_t)v16, &qword_3C1C8);
    sub_16AEC((uint64_t)&v12 + 8, (uint64_t)v15, &qword_3C1D0);
    sub_16ADC((void *)&v13 + 1, &v14);
    sub_16AEC((uint64_t)&v10, (uint64_t)v11, &qword_3C1D8);
    swift_errorRetain();
    sub_16B50((uint64_t)v16);
    sub_16B7C((uint64_t)v15);
    sub_16BA8(&v14);
    sub_112D4((uint64_t)v11);
    sub_6344(&qword_3C120);
    sub_27E30();
    sub_10E74(v5);
    sub_27E40();
  }
  sub_16BD4((uint64_t)v16);
  sub_14150((uint64_t)v15);
  sub_16C00(&v14);
  return sub_11534((uint64_t)v11);
}

uint64_t sub_16F18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_16F28()
{
  return swift_release();
}

unint64_t sub_16F30()
{
  unint64_t result = qword_3D470[0];
  if (!qword_3D470[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3D470);
  }
  return result;
}

ValueMetadata *type metadata accessor for AsyncIcon.LoadingError()
{
  return &type metadata for AsyncIcon.LoadingError;
}

unint64_t sub_16F98()
{
  unint64_t result = qword_3C1E0;
  if (!qword_3C1E0)
  {
    sub_6388(&qword_3C1E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C1E0);
  }
  return result;
}

uint64_t sub_17008@<X0>(uint64_t *a1@<X8>)
{
  sub_F85C();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t sub_17048()
{
  return sub_27F30();
}

uint64_t sub_17110(uint64_t a1)
{
  uint64_t v2 = sub_27CC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6344(&qword_3B8D8);
  __chkstk_darwin(v6);
  long long v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v8 = sub_27C10();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = sub_6344(&qword_3B998);
  sub_172C4(a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_27CB0();
  sub_6E4C((unint64_t *)&unk_3B8E0, &qword_3B8D8);
  sub_27DC0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_6DEC((uint64_t)v8);
}

uint64_t sub_172BC()
{
  return sub_17110(*(void *)(v0 + 16));
}

uint64_t sub_172C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v32[3] = a1;
  v32[0] = a2;
  uint64_t v2 = sub_6344(&qword_3B9A0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  uint64_t v38 = v3;
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6344(&qword_3B9A8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v39 = (char *)v32 - v11;
  uint64_t v40 = sub_14E1C(0xD000000000000017, (void *)0x800000000002D180);
  uint64_t v41 = v12;
  sub_64B0();
  uint64_t v13 = sub_27D40();
  uint64_t v34 = v14;
  uint64_t v35 = v13;
  uint64_t v36 = v15;
  int v33 = v16 & 1;
  uint64_t v17 = sub_27C60();
  v32[1] = v18;
  v32[2] = v17;
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  sub_14300();
  unint64_t v19 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();

  sub_27EA0();
  sub_6E4C((unint64_t *)&qword_3B9B0, &qword_3B9A0);
  uint64_t v20 = v37;
  sub_27D80();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v20);
  uint64_t v21 = v7;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  id v23 = v39;
  uint64_t v24 = v6;
  v22(v39, v10, v6);
  long long v25 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
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
  unint64_t v29 = (char *)(v28 + *(int *)(sub_6344(&qword_3B9B8) + 64));
  v25(v29, v10, v24);
  sub_6E90(v26, v27, v6);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v21 + 8);
  swift_bridgeObjectRetain();
  v30(v39, v24);
  v30(v10, v24);
  sub_6EA0(v26, v27, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_17654@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & **a1])();
  *a2 = result & 1;
  return result;
}

uint64_t sub_176BC(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & **a2) - 8])(*a1);
}

uint64_t sub_1771C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_17738()
{
  return sub_27F30();
}

ValueMetadata *type metadata accessor for LiveActivitiesEnabledSection()
{
  return &type metadata for LiveActivitiesEnabledSection;
}

uint64_t property wrapper backing initializer of RemoteInstalledDepthAppsDataSource.installedDepthApps()
{
  return sub_279F0();
}

uint64_t sub_17864()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_27A30();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_178D8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & **a1) - 8])();
  *a2 = result;
  return result;
}

uint64_t sub_17934(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))&stru_68.segname[swift_isaMask & **a2];
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_17998()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_27A40();
}

void (*sub_17A04(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_27A20();
  return sub_9048;
}

uint64_t sub_17A90()
{
  return swift_endAccess();
}

uint64_t sub_17AF4(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3C200);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  sub_6344(&qword_3C1F8);
  sub_27A10();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_17C20(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_6344(&qword_3C200);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource__installedDepthApps;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_6344(&qword_3C1F8);
  sub_27A00();
  swift_endAccess();
  return sub_9350;
}

id variable initialization expression of RemoteInstalledDepthAppsDataSource.logger()
{
  id result = (id)cslprf_app_library_log();
  if (result)
  {
    return (id)sub_27990();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_17D78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v1) + 16];
  a1[3] = sub_6344(&qword_3C200);
  a1[4] = sub_17DF8();
  sub_17E54(a1);
  return v3();
}

unint64_t sub_17DF8()
{
  unint64_t result = qword_3C208;
  if (!qword_3C208)
  {
    sub_6388(&qword_3C200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C208);
  }
  return result;
}

uint64_t *sub_17E54(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id variable initialization expression of RemoteInstalledDepthAppsDataSource.stingSettingsModel()
{
  id v0 = objc_allocWithZone((Class)CSLPRFStingSettingsModel);

  return [v0 init];
}

id sub_17EF0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_stingSettingsModel));
}

id sub_17F00()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource));
}

char *RemoteInstalledDepthAppsDataSource.init()()
{
  uint64_t v1 = sub_6344(&qword_3C1F8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = &v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource__installedDepthApps];
  unint64_t v19 = _swiftEmptyArrayStorage;
  size_t v6 = v0;
  sub_6344(&qword_3C1F0);
  sub_279F0();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  unint64_t result = (char *)(id)cslprf_app_library_log();
  if (result)
  {
    sub_27990();
    uint64_t v8 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_stingSettingsModel;
    id v9 = [objc_allocWithZone((Class)CSLPRFStingSettingsModel) init];
    *(void *)&v6[v8] = v9;
    id v10 = [objc_allocWithZone((Class)CSLPRFInstalledDepthApplicationsDataSource) initWithStingModel:v9];
    *(void *)&v6[OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource] = v10;

    uint64_t v11 = (objc_class *)type metadata accessor for RemoteInstalledDepthAppsDataSource();
    v18.receiver = v6;
    v18.super_class = v11;
    uint64_t v12 = (char *)objc_msgSendSuper2(&v18, "init");
    uint64_t v13 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource;
    uint64_t v14 = *(void **)&v12[OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource];
    uint64_t v15 = v12;
    [v14 setDelegate:v15];
    id v16 = [self defaultCenter];
    [v16 addObserver:v15 selector:"updateInstalledDepthApps" name:CSLPRFStingSettingsModelDidChangeNotification object:*(void *)&v15[OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_stingSettingsModel]];

    [*(id *)&v12[v13] start];
    _s27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSourceC04dataJ9DidUpdateyySo015CSLPRFInstalledg12ApplicationsiJ0CF_0();

    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for RemoteInstalledDepthAppsDataSource()
{
  uint64_t result = qword_3D628;
  if (!qword_3D628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id RemoteInstalledDepthAppsDataSource.__deallocating_deinit()
{
  [*(id *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource] invalidate];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteInstalledDepthAppsDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void _s27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSourceC04dataJ9DidUpdateyySo015CSLPRFInstalledg12ApplicationsiJ0CF_0()
{
  uint64_t v1 = v0;
  id v2 = [*(id *)((char *)v0+ OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_stingSettingsModel) bundleIDsForActionType:20];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_28050();
  }
  os_log_type_t v4 = sub_28110();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_27960();
  if (os_log_type_enabled(v5, v4))
  {
    size_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = (void *)swift_slowAlloc();
    *(_DWORD *)size_t v6 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_28060();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_18B6C(v7, v9, (uint64_t *)&v45);
    sub_281C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v5, v4, "updateInstalledDepthApps with %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v10 = [*(id *)((char *)v1+ OBJC_IVAR____TtC27CompanionAutoLaunchSettings34RemoteInstalledDepthAppsDataSource_dataSource) apps];
  sub_D9A0();
  unint64_t v11 = sub_28050();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_282E0();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_8;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v14 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
  if (!v12) {
    goto LABEL_18;
  }
LABEL_8:
  uint64_t v45 = _swiftEmptyArrayStorage;
  sub_19E2C(0, v12 & ~(v12 >> 63), 0);
  if (v12 < 0)
  {
    __break(1u);
    swift_release();
    __break(1u);
    return;
  }
  uint64_t v43 = v1;
  uint64_t v13 = 0;
  uint64_t v14 = v45;
  unint64_t v44 = v11 & 0xC000000000000001;
  unint64_t v15 = v11;
  do
  {
    if (v44) {
      id v16 = (id)sub_28230();
    }
    else {
      id v16 = *(id *)(v11 + 8 * v13 + 32);
    }
    uint64_t v17 = v16;
    id v18 = objc_msgSend(v16, "bundleIdentifier", v43);
    uint64_t v19 = sub_28010();
    uint64_t v21 = v20;

    id v22 = objc_msgSend(v17, "cslprf_displayName");
    uint64_t v23 = sub_28010();
    uint64_t v25 = v24;

    uint64_t v26 = CSLPRFDepthAutoLaunchBehavior.id.getter(v19, v21, v23, v25);
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;

    uint64_t v45 = v14;
    unint64_t v34 = v14[2];
    unint64_t v33 = v14[3];
    if (v34 >= v33 >> 1)
    {
      sub_19E2C(v33 > 1, v34 + 1, 1);
      uint64_t v14 = v45;
    }
    ++v13;
    _OWORD v14[2] = v34 + 1;
    uint64_t v35 = &v14[4 * v34];
    v35[4] = v26;
    v35[5] = v28;
    v35[6] = v30;
    v35[7] = v32;
    unint64_t v11 = v15;
  }
  while (v12 != v13);
  swift_bridgeObjectRelease();
  uint64_t v1 = v43;
LABEL_19:
  uint64_t v45 = v14;
  swift_bridgeObjectRetain();
  sub_191C4((uint64_t *)&v45);
  swift_bridgeObjectRelease();
  (*(void (**)(void *))&stru_68.segname[swift_isaMask & *v1])(v45);
  os_log_type_t v36 = sub_28110();
  uint64_t v37 = v1;
  uint64_t v38 = sub_27960();
  if (os_log_type_enabled(v38, v36))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 136315138;
    (*(void (**)(void))&stru_68.segname[(swift_isaMask & *v37) - 8])();
    uint64_t v40 = sub_28060();
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    sub_18B6C(v40, v42, (uint64_t *)&v45);
    sub_281C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v38, v36, "installedDepthApps = %s", v39, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_18984()
{
  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & **v0) - 8])();
}

uint64_t sub_189D8()
{
  return (*(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & **v0)))();
}

uint64_t sub_18A2C()
{
  return type metadata accessor for RemoteInstalledDepthAppsDataSource();
}

void sub_18A34()
{
  sub_18B10();
  if (v0 <= 0x3F)
  {
    sub_27980();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_18B10()
{
  if (!qword_3C298)
  {
    sub_6388(&qword_3C1F0);
    unint64_t v0 = sub_27A50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3C298);
    }
  }
}

uint64_t sub_18B6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_18C40(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19E4C((uint64_t)v12, *a3);
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
      sub_19E4C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_F300((uint64_t)v12);
  return v7;
}

uint64_t sub_18C40(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_281D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_18DFC(a5, a6);
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
  uint64_t v8 = sub_28250();
  if (!v8)
  {
    sub_282C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_282F0();
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

uint64_t sub_18DFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_18E94(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_19074(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_19074(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_18E94(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1900C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_28220();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_282C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_28030();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_282F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_282C0();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1900C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_6344(&qword_3C2A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19074(char a1, int64_t a2, char a3, char *a4)
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
    sub_6344(&qword_3C2A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_282F0();
  __break(1u);
  return result;
}

Swift::Int sub_191C4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A014(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_19230(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_19230(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int result = sub_28310(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_135;
    }
    if (v4) {
      return sub_19984(0, v4, 1, a1);
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
    goto LABEL_143;
  }
  Swift::Int v99 = result;
  unint64_t v96 = a1;
  if (v4 < 2)
  {
    int64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v102 = (char *)&_swiftEmptyArrayStorage[4];
    unint64_t v98 = _swiftEmptyArrayStorage;
    if (v4 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      if (v12 < 2)
      {
LABEL_112:
        swift_bridgeObjectRelease();
        v98[2] = 0;
        return swift_bridgeObjectRelease();
      }
LABEL_100:
      uint64_t v89 = *v96;
      while (1)
      {
        unint64_t v90 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_130;
        }
        if (!v89) {
          goto LABEL_142;
        }
        uint64_t v91 = *(void *)&v9[16 * v90 + 32];
        uint64_t v92 = *(void *)&v9[16 * v12 + 24];
        sub_19A90((char *)(v89 + 32 * v91), (char *)(v89 + 32 * *(void *)&v9[16 * v12 + 16]), v89 + 32 * v92, v102);
        if (v2) {
          goto LABEL_112;
        }
        if (v92 < v91) {
          goto LABEL_131;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v9 = sub_C5E8((uint64_t)v9);
        }
        if (v90 >= *((void *)v9 + 2)) {
          goto LABEL_132;
        }
        uint64_t v93 = &v9[16 * v90 + 32];
        *(void *)uint64_t v93 = v91;
        *((void *)v93 + 1) = v92;
        unint64_t v94 = *((void *)v9 + 2);
        if (v12 > v94) {
          goto LABEL_133;
        }
        memmove(&v9[16 * v12 + 16], &v9[16 * v12 + 32], 16 * (v94 - v12));
        *((void *)v9 + 2) = v94 - 1;
        unint64_t v12 = v94 - 1;
        if (v94 <= 2) {
          goto LABEL_112;
        }
      }
    }
    uint64_t v105 = v1;
  }
  else
  {
    uint64_t v105 = v1;
    uint64_t v7 = v6 >> 1;
    uint64_t v8 = sub_28090();
    *(void *)(v8 + 16) = v7;
    unint64_t v98 = (void *)v8;
    uint64_t v102 = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v97 = *a1 + 40;
  uint64_t v95 = *a1 + 24;
  int64_t v9 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v101 = v4;
LABEL_16:
  Swift::Int v13 = v10++;
  if (v10 >= v4) {
    goto LABEL_33;
  }
  sub_64B0();
  uint64_t v14 = sub_281E0();
  Swift::Int v10 = v13 + 2;
  if (v13 + 2 >= v4) {
    goto LABEL_22;
  }
  uint64_t v15 = v97 + 32 * v13;
  do
  {
    v15 += 32;
    if ((v14 == -1) == (sub_281E0() != -1))
    {
      Swift::Int v4 = v101;
      if (v14 == -1) {
        goto LABEL_25;
      }
LABEL_33:
      if (v10 < v4)
      {
        if (__OFSUB__(v10, v13)) {
          goto LABEL_134;
        }
        if (v10 - v13 < v99)
        {
          if (__OFADD__(v13, v99)) {
            goto LABEL_136;
          }
          if (v13 + v99 >= v4) {
            Swift::Int v26 = v4;
          }
          else {
            Swift::Int v26 = v13 + v99;
          }
          if (v26 < v13)
          {
LABEL_137:
            __break(1u);
            goto LABEL_138;
          }
          if (v10 != v26)
          {
            Swift::Int v103 = v13;
            sub_64B0();
            uint64_t v27 = (void *)(v95 + 32 * v10);
            Swift::Int v100 = v26;
            do
            {
              Swift::Int v28 = v103;
              uint64_t v29 = v27;
              do
              {
                uint64_t v30 = (long long *)(v29 - 7);
                if (sub_281E0() != -1) {
                  break;
                }
                if (!v11) {
                  goto LABEL_139;
                }
                long long v32 = *v30;
                long long v31 = *(_OWORD *)(v29 - 5);
                *(v29 - 4) = *v29;
                v29 -= 4;
                uint64_t v33 = v29[1];
                uint64_t v34 = v29[2];
                uint64_t v35 = v29[3];
                v30[2] = v32;
                v30[3] = v31;
                *(v29 - 3) = v33;
                *(v29 - 2) = v34;
                *(v29 - 1) = v35;
                ++v28;
              }
              while (v10 != v28);
              ++v10;
              v27 += 4;
            }
            while (v10 != v100);
            Swift::Int v10 = v100;
            Swift::Int v13 = v103;
          }
        }
      }
      if (v10 < v13) {
        goto LABEL_129;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v9 = sub_C4EC(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v37 = *((void *)v9 + 2);
      unint64_t v36 = *((void *)v9 + 3);
      unint64_t v12 = v37 + 1;
      if (v37 >= v36 >> 1) {
        int64_t v9 = sub_C4EC((char *)(v36 > 1), v37 + 1, 1, v9);
      }
      *((void *)v9 + 2) = v12;
      v104 = v9 + 32;
      uint64_t v38 = &v9[16 * v37 + 32];
      *(void *)uint64_t v38 = v13;
      *((void *)v38 + 1) = v10;
      if (v37)
      {
        uint64_t v39 = v9 + 32;
        while (1)
        {
          unint64_t v40 = v12 - 1;
          if (v12 >= 4)
          {
            uint64_t v45 = &v39[16 * v12];
            uint64_t v46 = *((void *)v45 - 8);
            uint64_t v47 = *((void *)v45 - 7);
            BOOL v51 = __OFSUB__(v47, v46);
            uint64_t v48 = v47 - v46;
            if (v51) {
              goto LABEL_118;
            }
            uint64_t v50 = *((void *)v45 - 6);
            uint64_t v49 = *((void *)v45 - 5);
            BOOL v51 = __OFSUB__(v49, v50);
            uint64_t v43 = v49 - v50;
            char v44 = v51;
            if (v51) {
              goto LABEL_119;
            }
            unint64_t v52 = v12 - 2;
            uint64_t v53 = &v39[16 * v12 - 32];
            uint64_t v55 = *(void *)v53;
            uint64_t v54 = *((void *)v53 + 1);
            BOOL v51 = __OFSUB__(v54, v55);
            uint64_t v56 = v54 - v55;
            if (v51) {
              goto LABEL_121;
            }
            BOOL v51 = __OFADD__(v43, v56);
            uint64_t v57 = v43 + v56;
            if (v51) {
              goto LABEL_124;
            }
            if (v57 >= v48)
            {
              uint64_t v75 = &v39[16 * v40];
              uint64_t v77 = *(void *)v75;
              uint64_t v76 = *((void *)v75 + 1);
              BOOL v51 = __OFSUB__(v76, v77);
              uint64_t v78 = v76 - v77;
              if (v51) {
                goto LABEL_128;
              }
              BOOL v68 = v43 < v78;
              goto LABEL_88;
            }
          }
          else
          {
            if (v12 != 3)
            {
              uint64_t v69 = *((void *)v9 + 4);
              uint64_t v70 = *((void *)v9 + 5);
              BOOL v51 = __OFSUB__(v70, v69);
              uint64_t v62 = v70 - v69;
              char v63 = v51;
              goto LABEL_82;
            }
            uint64_t v42 = *((void *)v9 + 4);
            uint64_t v41 = *((void *)v9 + 5);
            BOOL v51 = __OFSUB__(v41, v42);
            uint64_t v43 = v41 - v42;
            char v44 = v51;
          }
          if (v44) {
            goto LABEL_120;
          }
          unint64_t v52 = v12 - 2;
          uint64_t v58 = &v39[16 * v12 - 32];
          uint64_t v60 = *(void *)v58;
          uint64_t v59 = *((void *)v58 + 1);
          BOOL v61 = __OFSUB__(v59, v60);
          uint64_t v62 = v59 - v60;
          char v63 = v61;
          if (v61) {
            goto LABEL_123;
          }
          uint64_t v64 = &v39[16 * v40];
          uint64_t v66 = *(void *)v64;
          uint64_t v65 = *((void *)v64 + 1);
          BOOL v51 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          if (v51) {
            goto LABEL_126;
          }
          if (__OFADD__(v62, v67)) {
            goto LABEL_127;
          }
          if (v62 + v67 >= v43)
          {
            BOOL v68 = v43 < v67;
LABEL_88:
            if (v68) {
              unint64_t v40 = v52;
            }
            goto LABEL_90;
          }
LABEL_82:
          if (v63) {
            goto LABEL_122;
          }
          long long v71 = &v39[16 * v40];
          uint64_t v73 = *(void *)v71;
          uint64_t v72 = *((void *)v71 + 1);
          BOOL v51 = __OFSUB__(v72, v73);
          uint64_t v74 = v72 - v73;
          if (v51) {
            goto LABEL_125;
          }
          if (v74 < v62) {
            goto LABEL_15;
          }
LABEL_90:
          unint64_t v79 = v40 - 1;
          if (v40 - 1 >= v12)
          {
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
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
            goto LABEL_137;
          }
          uint64_t v80 = v11;
          if (!v11) {
            goto LABEL_140;
          }
          long long v81 = v9;
          uint64_t v82 = &v39[16 * v79];
          uint64_t v83 = v39;
          uint64_t v84 = *(void *)v82;
          uint64_t v85 = &v83[16 * v40];
          uint64_t v86 = *((void *)v85 + 1);
          uint64_t v87 = v80;
          sub_19A90((char *)(v80 + 32 * *(void *)v82), (char *)(v80 + 32 * *(void *)v85), v80 + 32 * v86, v102);
          if (v105) {
            goto LABEL_112;
          }
          if (v86 < v84) {
            goto LABEL_115;
          }
          if (v40 > *((void *)v81 + 2)) {
            goto LABEL_116;
          }
          *(void *)uint64_t v82 = v84;
          uint64_t v39 = v104;
          *(void *)&v104[16 * v79 + 8] = v86;
          unint64_t v88 = *((void *)v81 + 2);
          if (v40 >= v88) {
            goto LABEL_117;
          }
          int64_t v9 = v81;
          unint64_t v12 = v88 - 1;
          memmove(v85, v85 + 16, 16 * (v88 - 1 - v40));
          *((void *)v81 + 2) = v88 - 1;
          uint64_t v11 = v87;
          if (v88 <= 2) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v12 = 1;
LABEL_15:
      Swift::Int v4 = v101;
      if (v10 >= v101)
      {
        uint64_t v2 = v105;
        if (v12 < 2) {
          goto LABEL_112;
        }
        goto LABEL_100;
      }
      goto LABEL_16;
    }
    ++v10;
    Swift::Int v4 = v101;
  }
  while (v101 != v10);
  Swift::Int v10 = v101;
LABEL_22:
  if (v14 != -1) {
    goto LABEL_33;
  }
LABEL_25:
  if (v10 >= v13)
  {
    if (v13 < v10)
    {
      uint64_t v16 = 32 * v10;
      uint64_t v17 = 32 * v13;
      Swift::Int v18 = v10;
      Swift::Int v19 = v13;
      while (1)
      {
        if (v19 != --v18)
        {
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v20 = (_OWORD *)(v11 + v17);
          uint64_t v21 = v11 + v16;
          long long v22 = *(_OWORD *)(v11 + v17);
          uint64_t v23 = *(void *)(v11 + v17 + 16);
          uint64_t v24 = *(void *)(v11 + v17 + 24);
          long long v25 = *(_OWORD *)(v11 + v16 - 16);
          _OWORD *v20 = *(_OWORD *)(v11 + v16 - 32);
          v20[1] = v25;
          *(_OWORD *)(v21 - 32) = v22;
          *(void *)(v21 - 16) = v23;
          *(void *)(v21 - 8) = v24;
        }
        ++v19;
        v16 -= 32;
        v17 += 32;
        if (v19 >= v18) {
          goto LABEL_33;
        }
      }
    }
    goto LABEL_33;
  }
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
  Swift::Int result = sub_282C0();
  __break(1u);
  return result;
}

uint64_t sub_19984(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v16 = result;
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    sub_64B0();
    uint64_t v6 = v5 + 32 * v4 + 24;
LABEL_5:
    uint64_t v7 = v16;
    uint64_t v8 = (void *)v6;
    while (1)
    {
      int64_t v9 = (long long *)(v8 - 7);
      Swift::Int result = sub_281E0();
      if (result != -1)
      {
LABEL_4:
        ++v4;
        v6 += 32;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      long long v11 = *v9;
      long long v10 = *(_OWORD *)(v8 - 5);
      *(v8 - 4) = *v8;
      v8 -= 4;
      uint64_t v12 = v8[1];
      uint64_t v13 = v8[2];
      uint64_t v14 = v8[3];
      v9[2] = v11;
      v9[3] = v10;
      *(v8 - 3) = v12;
      *(v8 - 2) = v13;
      *(v8 - 1) = v14;
      if (v4 == ++v7) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_19A90(char *__src, char *a2, unint64_t a3, char *a4)
{
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = a2 - __src;
  int64_t v8 = a2 - __src + 31;
  if (a2 - __src >= 0) {
    int64_t v8 = a2 - __src;
  }
  uint64_t v9 = v8 >> 5;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 31;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 5;
  uint64_t v27 = __src;
  Swift::Int v26 = a4;
  if (v9 >= v11 >> 5)
  {
    if (v10 >= -31)
    {
      if (a4 != a2 || &a2[32 * v12] <= a4) {
        memmove(a4, a2, 32 * v12);
      }
      uint64_t v17 = &a4[32 * v12];
      long long v25 = v17;
      uint64_t v27 = v5;
      if (v6 < v5 && v10 >= 32)
      {
        sub_64B0();
        Swift::Int v18 = (char *)(a3 - 32);
        Swift::Int v19 = v5;
        do
        {
          uint64_t v20 = v18 + 32;
          v19 -= 32;
          if (sub_281E0() == -1)
          {
            if (v20 != v5 || v18 >= v5)
            {
              long long v22 = *((_OWORD *)v19 + 1);
              *(_OWORD *)Swift::Int v18 = *(_OWORD *)v19;
              *((_OWORD *)v18 + 1) = v22;
            }
            uint64_t v27 = v19;
          }
          else
          {
            long long v25 = v17 - 32;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
            {
              long long v21 = *((_OWORD *)v17 - 1);
              *(_OWORD *)Swift::Int v18 = *((_OWORD *)v17 - 2);
              *((_OWORD *)v18 + 1) = v21;
            }
            Swift::Int v19 = v5;
            v17 -= 32;
          }
          if (v19 <= v6) {
            break;
          }
          v18 -= 32;
          uint64_t v5 = v19;
        }
        while (v17 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -31)
  {
    uint64_t v13 = a4;
    if (a4 != __src || &__src[32 * v9] <= a4) {
      memmove(a4, __src, 32 * v9);
    }
    long long v25 = &a4[32 * v9];
    if ((unint64_t)v5 < a3 && v7 >= 32)
    {
      sub_64B0();
      do
      {
        if (sub_281E0() == -1)
        {
          uint64_t v15 = v5 + 32;
          if (v6 < v5 || v6 >= v15 || v6 != v5)
          {
            long long v16 = *((_OWORD *)v5 + 1);
            *(_OWORD *)uint64_t v6 = *(_OWORD *)v5;
            *((_OWORD *)v6 + 1) = v16;
          }
        }
        else
        {
          if (v6 != v13)
          {
            long long v14 = *((_OWORD *)v13 + 1);
            *(_OWORD *)uint64_t v6 = *(_OWORD *)v13;
            *((_OWORD *)v6 + 1) = v14;
          }
          v13 += 32;
          Swift::Int v26 = v13;
          uint64_t v15 = v5;
        }
        v6 += 32;
        if (v13 >= &a4[32 * v9]) {
          break;
        }
        uint64_t v5 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v27 = v6;
    }
LABEL_43:
    sub_19D70((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_282F0();
  __break(1u);
  return result;
}

char *sub_19D70(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 31;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -32)
  {
    uint64_t result = (char *)sub_282F0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7])
    {
      return (char *)memmove(result, v3, 32 * v7);
    }
  }
  return result;
}

uint64_t sub_19E2C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19EA8(a1, a2, a3, *v3);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_19E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19EA8(char a1, int64_t a2, char a3, char *a4)
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
    sub_6344((uint64_t *)&unk_3C2C0);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  long long v14 = a4 + 32;
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
  uint64_t result = sub_282F0();
  __break(1u);
  return result;
}

uint64_t sub_1A014(uint64_t a1)
{
  return sub_19EA8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1A030(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1A060(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))&StateObject.wrappedValue.getter);
}

uint64_t sub_1A048(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1A060(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))&StateObject.projectedValue.getter);
}

uint64_t sub_1A060(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v6 = a3 & 1;
  uint64_t v7 = type metadata accessor for LiveActivitiesAutoLaunchModel();
  unint64_t v8 = sub_14300();

  return a4(a1, a2, v6, v7, v8);
}

uint64_t sub_1A0D8()
{
  return sub_27CF0();
}

uint64_t sub_1A174()
{
  return sub_27AF0();
}

uint64_t sub_1A230()
{
  return sub_1A174();
}

uint64_t sub_1A23C@<X0>(uint64_t a1@<X8>)
{
  sub_14E1C(0xD00000000000003ALL, (void *)0x800000000002D5F0);
  sub_64B0();
  uint64_t result = sub_27D40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1A2AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A2C8()
{
  return sub_27CF0();
}

id sub_1A36C(uint64_t a1, void *a2, char a3)
{
  if (a3) {
    return a2;
  }
  else {
    return (id)swift_retain();
  }
}

void destroy for LiveActivitiesAutoLaunchSettingsRootView(uint64_t a1)
{
}

void sub_1A38C(uint64_t a1, void *a2, char a3)
{
  if (a3) {

  }
  else {
    swift_release();
  }
}

uint64_t _s27CompanionAutoLaunchSettings40LiveActivitiesAutoLaunchSettingsRootViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1A36C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LiveActivitiesAutoLaunchSettingsRootView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1A36C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1A38C(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for LiveActivitiesAutoLaunchSettingsRootView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LiveActivitiesAutoLaunchSettingsRootView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  char v5 = *(void **)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1A38C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitiesAutoLaunchSettingsRootView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitiesAutoLaunchSettingsRootView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitiesAutoLaunchSettingsRootView()
{
  return &type metadata for LiveActivitiesAutoLaunchSettingsRootView;
}

uint64_t sub_1A538()
{
  return sub_6E4C(&qword_3C2E0, &qword_3C2E8);
}

unint64_t sub_1A574()
{
  unint64_t result = qword_3C2F0;
  if (!qword_3C2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C2F0);
  }
  return result;
}

uint64_t sub_1A5D4()
{
  type metadata accessor for MediaAutoLaunchModel();
  sub_ECE0();

  return sub_27B10();
}

uint64_t sub_1A630()
{
  return sub_27F20();
}

uint64_t sub_1A750()
{
  type metadata accessor for MediaAutoLaunchModel();
  sub_ECE0();
  unint64_t v0 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();

  swift_release();
  return sub_27E90();
}

unint64_t sub_1A81C()
{
  unint64_t result = qword_3B9B0;
  if (!qword_3B9B0)
  {
    sub_6388(&qword_3B9A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3B9B0);
  }
  return result;
}

uint64_t sub_1A878@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & **a1)))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1A8D8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((char *)&stru_20.nsects + (swift_isaMask & **a2)))(*a1);
}

uint64_t sub_1A930@<X0>(uint64_t a1@<X8>)
{
  sub_14E1C(0xD000000000000017, (void *)0x800000000002D680);
  sub_64B0();
  uint64_t result = sub_27D40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1A9A0()
{
  type metadata accessor for MediaAutoLaunchModel();
  sub_ECE0();

  return sub_27B00();
}

uint64_t sub_1A9EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AA08()
{
  return sub_1A630();
}

ValueMetadata *type metadata accessor for MediaAutoLaunchSection()
{
  return &type metadata for MediaAutoLaunchSection;
}

unint64_t sub_1AA24()
{
  unint64_t result = qword_3C2F8;
  if (!qword_3C2F8)
  {
    sub_6388(&qword_3C300);
    sub_1A81C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C2F8);
  }
  return result;
}

void *sub_1AAA4(void *a1)
{
  id v2 = a1;
  return a1;
}

void *sub_1AACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  return a2;
}

void *sub_1AAF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  return a3;
}

void *initializeBufferWithCopyOfBuffer for AutoLaunchSettingsModel(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

void destroy for AutoLaunchSettingsModel(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
}

uint64_t assignWithCopy for AutoLaunchSettingsModel(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  id v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  uint64_t v10 = *(void **)(a1 + 16);
  int64_t v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  return a1;
}

uint64_t assignWithTake for AutoLaunchSettingsModel(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

ValueMetadata *type metadata accessor for AutoLaunchSettingsModel()
{
  return &type metadata for AutoLaunchSettingsModel;
}

void *sub_1AC78(void *a1, void *a2, void *a3)
{
  id v6 = a1;
  id v7 = a2;
  id v8 = a3;
  return a1;
}

void sub_1ACC0(void *a1, void *a2, void *a3)
{
  id *v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
}

uint64_t sub_1AD10()
{
  return sub_27CE0();
}

void sub_1ADA8(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if ([self activePairedWatchSupportsLiveActivities])
  {
    if (a3)
    {
      *(void *)(swift_allocObject() + 16) = a3;
      id v8 = a3;
      sub_1A5CC();
    }
  }
  else if (a1)
  {
    id v9 = a1;
    sub_1A5D0();
  }
  sub_6344(&qword_3C328);
  sub_6344(&qword_3C330);
  sub_1B0E4(&qword_3C338, &qword_3C328, (void (*)(void))sub_1B090);
  sub_1B0E4(&qword_3C348, &qword_3C330, (void (*)(void))sub_1B15C);
  sub_27CA0();
  if (a2)
  {
    uint64_t v10 = sub_1C508(a2);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  *(void *)a4 = v12;
  *(void *)(a4 + 8) = v13;
  *(unsigned char *)(a4 + 16) = v14;
  *(unsigned char *)(a4 + 17) = v15;
  *(void *)(a4 + 24) = v10;
  *(void *)(a4 + 32) = v11;
  sub_1B1B0(v12, v13, v14, v15);
  sub_1B1D4((uint64_t)v12, v13, v14, v15);
}

void sub_1AF7C(uint64_t a1@<X8>)
{
  sub_1ADA8(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1AF88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AFA4()
{
  return sub_27CE0();
}

ValueMetadata *type metadata accessor for AutoLaunchSettingsRootView()
{
  return &type metadata for AutoLaunchSettingsRootView;
}

uint64_t sub_1B054()
{
  return sub_6E4C(&qword_3C318, &qword_3C320);
}

unint64_t sub_1B090()
{
  unint64_t result = qword_3C340;
  if (!qword_3C340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C340);
  }
  return result;
}

uint64_t sub_1B0E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6388(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B15C()
{
  unint64_t result = qword_3C350;
  if (!qword_3C350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C350);
  }
  return result;
}

id sub_1B1B0(void *a1, void *a2, unsigned __int8 a3, char a4)
{
  if (a4) {
    return a2;
  }
  else {
    return sub_1B1BC(a1, a2, a3);
  }
}

id sub_1B1BC(id result, void *a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_1A36C((uint64_t)result, a2, a3 & 1);
  }
  return result;
}

void sub_1B1D4(uint64_t a1, void *a2, unsigned __int8 a3, char a4)
{
  if (a4) {

  }
  else {
    sub_1B1E0(a1, a2, a3);
  }
}

void sub_1B1E0(uint64_t a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    sub_1A38C(a1, a2, a3 & 1);
  }
}

uint64_t sub_1B1F8()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1B230()
{
  return *(id *)(v0 + 16);
}

id sub_1B23C()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher));
}

void *sub_1B24C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model);
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model + 8);
  id v4 = *(void **)(v1 + 16);
  id v5 = v2;
  id v6 = v3;
  id v7 = v4;
  return v2;
}

id sub_1B29C(void *a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher;
  id v5 = objc_allocWithZone((Class)CSLPRFIconFetcher);
  id v6 = v3;
  *(void *)&v3[v4] = [v5 init];
  id v7 = a1;
  uint64_t v8 = sub_1B41C(v7);
  id v9 = (uint64_t *)&v6[OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model];
  *id v9 = v8;
  v9[1] = v10;
  v9[2] = v11;

  v14.receiver = v6;
  v14.super_class = v1;
  id v12 = objc_msgSendSuper2(&v14, "initWithNibName:bundle:", 0, 0);

  return v12;
}

id sub_1B360(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher;
  id v4 = objc_allocWithZone((Class)CSLPRFIconFetcher);
  id v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  id v6 = a1;
  uint64_t v7 = sub_1B41C(v6);
  uint64_t v8 = (uint64_t *)&v5[OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model];
  *uint64_t v8 = v7;
  v8[1] = v9;
  v8[2] = v10;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for CompanionAutoLaunchSettingsViewController();
  id v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", 0, 0);

  return v11;
}

uint64_t sub_1B41C(void *a1)
{
  type metadata accessor for MediaAutoLaunchModel();
  id v2 = RemoteInstalledDepthAppsDataSource.__allocating_init()();
  type metadata accessor for LiveActivitiesAutoLaunchModel();
  id v3 = RemoteInstalledDepthAppsDataSource.__allocating_init()();
  id v4 = 0;
  if ((*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *a1) + 8])())
  {
    type metadata accessor for DepthAutoLaunchModel();
    id v5 = [objc_allocWithZone((Class)CSLPRFDepthAutoLaunchAppSetting) initWithVersion:(*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *a1)))()];
    id v4 = sub_201CC(2, v5);
  }
  id v6 = v2;
  id v7 = v3;
  uint64_t v9 = CSLPRFDepthAutoLaunchBehavior.id.getter(v2, v4, v3, v8);

  return v9;
}

uint64_t type metadata accessor for CompanionAutoLaunchSettingsViewController()
{
  return self;
}

id sub_1B654(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_1B698()
{
  uint64_t v1 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)CSLPRFIconFetcher) init];

  sub_282D0();
  __break(1u);
}

void sub_1B7C0()
{
  id v19 = (id)sub_1BB10();
  objc_msgSend(v0, "addChildViewController:");
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v2 = v1;
  id v3 = [v19 view];
  if (!v3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v4 = v3;
  [v2 addSubview:v3];

  id v5 = [v19 view];
  if (!v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v6 = v5;
  id v7 = [v0 view];
  if (!v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  [v7 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v6, "setFrame:", v10, v12, v14, v16);
  id v17 = [v19 view];
  if (!v17)
  {
LABEL_13:
    __break(1u);
    return;
  }
  Swift::Int v18 = v17;
  [v17 setAutoresizingMask:18];

  [v19 didMoveToParentViewController:v0];
}

void sub_1B9A0(void *a1)
{
  id v2 = v1;
  uint64_t v3 = sub_20B40(a1);
  id v5 = v4;
  id v6 = *(void **)&v1[OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher];
  sub_F85C();
  sub_15070();
  uint64_t v15 = v3;
  uint64_t v16 = sub_279B0();
  id v17 = v6;
  id v7 = objc_allocWithZone((Class)sub_6344(&qword_3C3D8));
  id v8 = v6;
  id v9 = v5;
  swift_retain();
  double v10 = (void *)sub_27C90();
  id v11 = objc_msgSend(v10, "navigationItem", v15, v5, v16, v17);
  sub_14E1C(0x50415F4854504544, (void *)0xE900000000000050);
  NSString v12 = sub_28000();
  swift_bridgeObjectRelease();
  [v11 setTitle:v12];

  id v13 = [v2 navigationController];
  if (v13)
  {
    double v14 = v13;
    [v13 pushViewController:v10 animated:1];
  }
  swift_release();
}

uint64_t sub_1BB10()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model);
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model + 8);
  uint64_t v3 = *(void **)(v0
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model
                + 16);
  id v4 = v3;
  id v5 = v1;
  id v6 = v2;
  CSLPRFDepthAutoLaunchBehavior.id.getter(v1, v2, v3, v7);
  swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  CSLPRFDepthAutoLaunchBehavior.id.getter(sub_1C460, v8, v9, v10);
  id v11 = *(void **)(v0
                 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher);
  sub_F85C();
  sub_15070();
  sub_279B0();
  id v12 = objc_allocWithZone((Class)sub_6344(&qword_3C3E0));
  id v13 = v11;
  return sub_27C90();
}

uint64_t sub_1BC38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DAAC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BC64()
{
  return sub_1DB3C();
}

id sub_1BCA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    NSString v6 = sub_28000();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void sub_1BD1C()
{
}

id sub_1BD80()
{
  return sub_1C374(type metadata accessor for CompanionAutoLaunchSettingsViewController);
}

uint64_t sub_1BE4C()
{
  id v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_isTinker);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1BEE0(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_isTinker);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1BF2C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BFD0()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_supportsDepth);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1C064(char a1)
{
  uint64_t v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_supportsDepth);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_1C0B0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1C10C()
{
  return 1;
}

uint64_t sub_1C15C()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_depthAutoLaunchVersion;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1C1F0(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_depthAutoLaunchVersion);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_1C23C())()
{
  return j__swift_endAccess;
}

id sub_1C298()
{
  v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_isTinker] = 0;
  v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_supportsDepth] = 0;
  *(void *)&v0[OBJC_IVAR____TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration_depthAutoLaunchVersion] = 1;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompanionAutoLaunchSettingsConfiguration();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1C35C()
{
  return sub_1C374(type metadata accessor for CompanionAutoLaunchSettingsConfiguration);
}

id sub_1C374(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for CompanionAutoLaunchSettingsConfiguration()
{
  return self;
}

void type metadata accessor for CSLPRFDepthAutoLaunchVersion()
{
  if (!qword_3C3D0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_3C3D0);
    }
  }
}

uint64_t sub_1C428()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1C460()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    objc_super v2 = *(void **)(Strong
                  + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model
                  + 8);
    id v3 = v2;

    if (v2)
    {
      swift_beginAccess();
      uint64_t v4 = swift_unknownObjectWeakLoadStrong();
      if (v4)
      {
        id v5 = (void *)v4;
        sub_1B9A0(v3);
      }
    }
  }
}

uint64_t sub_1C50C()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_1EC80((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);

  return sub_27B10();
}

__n128 sub_1C598@<Q0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  sub_1C600(a1, (uint64_t)v10);
  uint64_t v3 = v10[1];
  char v4 = v11;
  uint64_t v5 = v14;
  char v6 = v15;
  __n128 result = v12;
  long long v8 = v13;
  long long v9 = v16;
  *(void *)a2 = v10[0];
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = v4;
  *(__n128 *)(a2 + 24) = result;
  *(_OWORD *)(a2 + 40) = v8;
  *(void *)(a2 + 56) = v5;
  *(unsigned char *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 72) = v9;
  return result;
}

void sub_1C600(void *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_1EC80((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  char v4 = a1;
  uint64_t v22 = sub_27B00();
  uint64_t v23 = v5;
  sub_27E20();
  char v6 = *(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & *v4));
  id v7 = v4;
  uint64_t v8 = v6();

  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t KeyPath = 0;
  if (v8 == 1)
  {
    uint64_t KeyPath = swift_getKeyPath();
    __n128 v12 = v7;
    uint64_t v9 = sub_27B00();
    uint64_t v10 = v13;
  }
  uint64_t v14 = v7;
  uint64_t v15 = v6();

  if (v15
    && (long long v16 = *(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v14)),
        id v17 = v14,
        uint64_t v18 = v16(),
        v17,
        v18 == 1))
  {
    uint64_t v19 = sub_22F34(v17);
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  *(void *)a2 = v22;
  *(void *)(a2 + 8) = v23;
  *(unsigned char *)(a2 + 16) = v24;
  *(void *)(a2 + 24) = v25;
  *(void *)(a2 + 32) = v9;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = KeyPath;
  *(void *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = v19;
  *(void *)(a2 + 80) = v20;
  swift_retain();
  id v21 = v23;
  sub_1ED50(v9, v10);
  sub_1EDA8(v9, v10);
  swift_release();
}

uint64_t sub_1C848@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v42 = a4;
  int v43 = a3;
  uint64_t v49 = a5;
  uint64_t v7 = sub_6344(&qword_3C488);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v50 = (uint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v48 = (char *)&v41 - v10;
  uint64_t v11 = sub_27C00();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v46 = v11;
  uint64_t v47 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_6344(&qword_3C490);
  uint64_t v45 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  long long v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_6344(&qword_3C498);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  id v21 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v41 = (char *)&v41 - v22;
  uint64_t v59 = sub_14E1C(0xD00000000000001ELL, (void *)0x800000000002D980);
  uint64_t v60 = v23;
  type metadata accessor for DepthAutoLaunchModel();
  sub_1EC80((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  char v24 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();

  long long v55 = v57;
  uint64_t v56 = v58;
  uint64_t v51 = a1;
  unint64_t v52 = a2;
  char v53 = v43;
  uint64_t v54 = v42;
  type metadata accessor for CSLPRFDepthAutoLaunchBehavior();
  sub_6344(&qword_3C4A0);
  sub_1EC80(&qword_3C540, (void (*)(uint64_t))type metadata accessor for CSLPRFDepthAutoLaunchBehavior);
  sub_6E4C(&qword_3C4A8, &qword_3C4A0);
  sub_64B0();
  sub_27E80();
  sub_27BF0();
  sub_6E4C(&qword_3C4B0, &qword_3C490);
  uint64_t v25 = v44;
  uint64_t v26 = v46;
  sub_27D70();
  uint64_t v27 = v14;
  Swift::Int v28 = v41;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v26);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v25);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v28, v21, v17);
  uint64_t v29 = *(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & *a2));
  uint64_t v30 = a2;
  uint64_t v31 = v29();

  if (v31 == 2)
  {
    uint64_t v32 = (uint64_t)v48;
    sub_27F30();
    uint64_t v33 = sub_6344(&qword_3C4B8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 0, 1, v33);
  }
  else
  {
    uint64_t v34 = sub_6344(&qword_3C4B8);
    uint64_t v32 = (uint64_t)v48;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v48, 1, 1, v34);
  }
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v35(v21, v28, v17);
  uint64_t v36 = v50;
  sub_141C4(v32, v50, &qword_3C488);
  unint64_t v37 = v49;
  v35(v49, v21, v17);
  uint64_t v38 = sub_6344(&qword_3C4C0);
  sub_141C4(v36, (uint64_t)&v37[*(int *)(v38 + 48)], &qword_3C488);
  sub_14228(v32, &qword_3C488);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v18 + 8);
  v39(v28, v17);
  sub_14228(v36, &qword_3C488);
  return ((uint64_t (*)(char *, uint64_t))v39)(v21, v17);
}

uint64_t sub_1CEC4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & **a1)))();
  *a2 = result;
  return result;
}

uint64_t sub_1CF20(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((char *)&stru_68.reserved2 + (swift_isaMask & **a2)))(*a1);
}

uint64_t sub_1CF78()
{
  return sub_27CF0();
}

uint64_t sub_1D020@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_6344(&qword_3C428);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v8 = a1[1];
  long long v24 = *a1;
  uint64_t v9 = (void *)*((void *)&v24 + 1);
  long long v22 = v8;
  char v23 = *((unsigned char *)a1 + 32);
  uint64_t v10 = swift_allocObject();
  long long v11 = a1[1];
  *(_OWORD *)(v10 + 16) = *a1;
  *(_OWORD *)(v10 + 32) = v11;
  *(unsigned char *)(v10 + 48) = *((unsigned char *)a1 + 32);
  id v21 = a1;
  sub_1E65C((uint64_t)&v24);
  sub_1E688((uint64_t)&v22);
  sub_1E6BC();
  sub_27E60();
  uint64_t v12 = *(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v9));
  uint64_t v13 = v9;
  uint64_t v14 = v12();
  sub_1E440((uint64_t)&v24);
  uint64_t v15 = *(void *)(v14 + 16);
  swift_bridgeObjectRelease();
  LOBYTE(v9) = v15 == 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = (_BYTE)v9;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 16))(a2, v7, v4);
  uint64_t v18 = (uint64_t *)(a2 + *(int *)(sub_6344(&qword_3C410) + 36));
  uint64_t *v18 = KeyPath;
  v18[1] = (uint64_t)sub_14D34;
  v18[2] = v17;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1D268(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1D290@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_6344(&qword_3C468);
  __chkstk_darwin(v4);
  uint64_t v36 = (uint64_t)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_6344(&qword_3C460);
  __chkstk_darwin(v33);
  uint64_t v7 = (void *)((char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v34 = sub_27AD0();
  uint64_t v8 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_6344(&qword_3C450);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v35 = (uint64_t)v31 - v15;
  long long v37 = *a1;
  long long v16 = *(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & **((void **)&v37 + 1)));
  id v17 = *((id *)&v37 + 1);
  uint64_t v18 = v16();
  sub_1E440((uint64_t)&v37);
  uint64_t v19 = *(void *)(v18 + 16);
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_storeEnumTagMultiPayload();
    sub_1E3A0();
    return sub_27CA0();
  }
  else
  {
    sub_27C60();
    uint64_t v32 = v11;
    sub_14ED8();
    v31[0] = v4;
    v31[1] = a2;
    sub_14EF4();
    uint64_t v21 = sub_27D20();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    char v27 = v26 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    sub_27AC0();
    uint64_t v29 = v34;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v7 + *(int *)(v33 + 28), v10, v34);
    *uint64_t v7 = KeyPath;
    sub_141C4((uint64_t)v7, (uint64_t)&v14[*(int *)(v32 + 36)], &qword_3C460);
    *(void *)uint64_t v14 = v21;
    *((void *)v14 + 1) = v23;
    v14[16] = v27;
    *((void *)v14 + 3) = v25;
    sub_6E90(v21, v23, v27);
    swift_bridgeObjectRetain();
    sub_14228((uint64_t)v7, &qword_3C460);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v29);
    sub_6EA0(v21, v23, v27);
    swift_bridgeObjectRelease();
    uint64_t v30 = v35;
    sub_1E46C((uint64_t)v14, v35);
    sub_141C4(v30, v36, &qword_3C450);
    swift_storeEnumTagMultiPayload();
    sub_1E3A0();
    sub_27CA0();
    return sub_14228(v30, &qword_3C450);
  }
}

uint64_t sub_1D6E4()
{
  return sub_27B50();
}

uint64_t sub_1D708(uint64_t a1)
{
  uint64_t v2 = sub_27AD0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_27B60();
}

uint64_t sub_1D7D0()
{
  id v0 = [self defaultWorkspace];
  if (v0)
  {
    uint64_t v1 = v0;
    NSString v2 = sub_28000();
    [v1 openApplicationWithBundleIdentifier:v2 configuration:0 completionHandler:0];
  }
  else
  {
    __break(1u);
  }
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_1D87C()
{
  uint64_t v1 = sub_6344(&qword_3C408);
  __chkstk_darwin(v1);
  long long v3 = *(_OWORD *)(v0 + 16);
  v7[0] = *(_OWORD *)v0;
  v7[1] = v3;
  char v8 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = v7;
  sub_1D290((long long *)v0, (uint64_t)&v5[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  sub_6344(&qword_3C410);
  sub_1E260();
  sub_1E324();
  return sub_27F40();
}

uint64_t sub_1D978()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_1EC80((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);

  return sub_27B00();
}

__n128 sub_1D9F4@<Q0>(uint64_t a1@<X8>)
{
  sub_1C600(*(void **)(v1 + 8), (uint64_t)v10);
  uint64_t v3 = v10[1];
  char v4 = v11;
  uint64_t v5 = v14;
  char v6 = v15;
  __n128 result = v12;
  long long v8 = v13;
  long long v9 = v16;
  *(void *)a1 = v10[0];
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v8;
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 72) = v9;
  return result;
}

void sub_1DA5C(void *a1@<X8>)
{
  *a1 = CSLPRFDepthAutoLaunchBehavior.id.getter;
  a1[1] = 0;
}

uint64_t sub_1DA78(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DAAC()
{
  sub_1DAE8();
  sub_27BD0();
  return v1;
}

unint64_t sub_1DAE8()
{
  unint64_t result = qword_3D7E0[0];
  if (!qword_3D7E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3D7E0);
  }
  return result;
}

uint64_t sub_1DB3C()
{
  return sub_27BE0();
}

void (*sub_1DB78(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_1DAE8();
  sub_27BD0();
  *(_OWORD *)uint64_t v3 = *((_OWORD *)v3 + 1);
  return sub_1DBFC;
}

void sub_1DBFC(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  v2[2] = v4;
  v2[3] = v3;
  if (a2)
  {
    swift_retain();
    sub_27BE0();
    swift_release();
  }
  else
  {
    sub_27BE0();
  }

  free(v2);
}

uint64_t sub_1DC90()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for DepthAutoLaunchSettingsRootView()
{
  return &type metadata for DepthAutoLaunchSettingsRootView;
}

void *initializeBufferWithCopyOfBuffer for DepthAutoLaunchPickerAction(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for DepthAutoLaunchPickerAction()
{
  return swift_release();
}

void *assignWithCopy for DepthAutoLaunchPickerAction(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for DepthAutoLaunchPickerAction(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthAutoLaunchPickerAction(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthAutoLaunchPickerAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthAutoLaunchPickerAction()
{
  return &type metadata for DepthAutoLaunchPickerAction;
}

unint64_t sub_1DDFC()
{
  unint64_t result = qword_3C3E8;
  if (!qword_3C3E8)
  {
    sub_6388(&qword_3C3F0);
    sub_6E4C(&qword_3C3F8, &qword_3C400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C3E8);
  }
  return result;
}

uint64_t sub_1DE94()
{
  return swift_retain();
}

uint64_t destroy for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t a1)
{
  return sub_1DEE0();
}

uint64_t sub_1DEE0()
{
  return swift_release();
}

uint64_t initializeWithCopy for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  id v7 = v3;
  sub_1DE94();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  uint64_t v4 = (void *)a2[1];
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  uint64_t v7 = v2[2];
  uint64_t v8 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_1DE94();
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_1DEE0();
  return a1;
}

__n128 initializeWithTake for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  char v6 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v6;
  sub_1DEE0();
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker()
{
  return &type metadata for DepthAutoLaunchSettingsRootView.AutoLaunchAppPicker;
}

uint64_t destroy for DepthAutoLaunchSettingsRootView.AutoLaunchBehaviorPicker(uint64_t a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for DepthAutoLaunchSettingsRootView.AutoLaunchBehaviorPicker(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DepthAutoLaunchSettingsRootView.AutoLaunchBehaviorPicker(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for DepthAutoLaunchSettingsRootView.AutoLaunchBehaviorPicker(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for DepthAutoLaunchSettingsRootView.AutoLaunchBehaviorPicker()
{
  return &type metadata for DepthAutoLaunchSettingsRootView.AutoLaunchBehaviorPicker;
}

ValueMetadata *type metadata accessor for DepthAutoLaunchPickerEnvironmentKey()
{
  return &type metadata for DepthAutoLaunchPickerEnvironmentKey;
}

uint64_t sub_1E220()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E23C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1E258@<X0>(uint64_t a1@<X8>)
{
  return sub_1D020(*(long long **)(v1 + 16), a1);
}

unint64_t sub_1E260()
{
  unint64_t result = qword_3C418;
  if (!qword_3C418)
  {
    sub_6388(&qword_3C410);
    sub_6E4C(&qword_3C420, &qword_3C428);
    sub_6E4C(&qword_3C430, &qword_3C438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C418);
  }
  return result;
}

unint64_t sub_1E324()
{
  unint64_t result = qword_3C440;
  if (!qword_3C440)
  {
    sub_6388(&qword_3C408);
    sub_1E3A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C440);
  }
  return result;
}

unint64_t sub_1E3A0()
{
  unint64_t result = qword_3C448;
  if (!qword_3C448)
  {
    sub_6388(&qword_3C450);
    sub_6E4C(&qword_3C458, &qword_3C460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C448);
  }
  return result;
}

uint64_t sub_1E440(uint64_t a1)
{
  return a1;
}

uint64_t sub_1E46C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3C450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E4D4()
{
  sub_1DEE0();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_1E518()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  char v3 = *(unsigned char *)(v0 + 48);
  sub_1DE94();
  uint64_t v4 = (void (*)(uint64_t))sub_1E710(v1, v2, v3);
  uint64_t v5 = sub_1DEE0();
  v4(v5);

  return swift_release();
}

uint64_t sub_1E5A4@<X0>(uint64_t *a1@<X8>)
{
  long long v14 = *(_OWORD *)*(void *)(v1 + 16);
  uint64_t v3 = (*(uint64_t (**)(id))&stru_B8.segname[(swift_isaMask & **((void **)&v14 + 1)) - 8])(*((id *)&v14 + 1));
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_1E440((uint64_t)&v14);
  uint64_t result = CSLPRFDepthAutoLaunchBehavior.id.getter(v3, v5, v7, v9);
  *a1 = result;
  a1[1] = v11;
  a1[2] = v12;
  a1[3] = v13;
  return result;
}

uint64_t sub_1E65C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_1E688(uint64_t a1)
{
  return a1;
}

unint64_t sub_1E6BC()
{
  unint64_t result = qword_3C470;
  if (!qword_3C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C470);
  }
  return result;
}

uint64_t sub_1E710(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = sub_27BC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v9 = sub_28130();
    uint64_t v10 = sub_27CD0();
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      *(void *)(v11 + 4) = sub_18B6C(0xD00000000000001BLL, 0x800000000002A8C0, &v13);
      _os_log_impl(&dword_0, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_27BB0();
    swift_getAtKeyPath();
    sub_1DEE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return v13;
  }
  return a1;
}

uint64_t sub_1E910()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1E920@<X0>(char *a1@<X8>)
{
  return sub_1C848(*(void *)(v1 + 16), *(void **)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_1E930@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 24);
  sub_14E1C(0xD00000000000001ALL, (void *)0x800000000002D9A0);
  sub_64B0();
  uint64_t v4 = sub_27D40();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v28 = v9;
  sub_14E1C(0xD00000000000001ALL, (void *)0x800000000002D9C0);
  uint64_t v10 = sub_27D40();
  uint64_t v26 = v11;
  uint64_t v27 = v12;
  char v25 = v13;
  long long v14 = *(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v3));
  char v15 = v3;
  uint64_t v16 = v14();

  uint64_t v17 = v16;
  uint64_t v18 = v16;
  uint64_t v19 = v16;
  uint64_t v20 = v16;
  if (!v16) {
    goto LABEL_4;
  }
  if (v16 == 1)
  {
    sub_14E1C(0xD00000000000001CLL, (void *)0x800000000002DA50);
    uint64_t v16 = sub_27D40();
    uint64_t v19 = v21;
    uint64_t v18 = v22 & 1;
    uint64_t v20 = 2;
LABEL_4:
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    *(unsigned char *)(a1 + 16) = v8 & 1;
    *(void *)(a1 + 24) = v28;
    *(void *)(a1 + 32) = 0;
    *(unsigned char *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
    *(_WORD *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = v10;
    *(void *)(a1 + 72) = v26;
    *(unsigned char *)(a1 + 80) = v25 & 1;
    *(void *)(a1 + 88) = v27;
    *(void *)(a1 + 96) = 1;
    *(unsigned char *)(a1 + 104) = 0;
    *(void *)(a1 + 112) = 1;
    *(_WORD *)(a1 + 120) = 0;
    *(void *)(a1 + 128) = v16;
    *(void *)(a1 + 136) = v17;
    *(void *)(a1 + 144) = v18;
    *(void *)(a1 + 152) = v19;
    *(void *)(a1 + 160) = v20;
    *(void *)(a1 + 168) = 0;
    *(void *)(a1 + 176) = v20;
    *(_WORD *)(a1 + 184) = 0;
    uint64_t v23 = v17;
    sub_6E90(v4, v6, v8 & 1);
    swift_bridgeObjectRetain();
    sub_6E90(v10, v26, v25 & 1);
    swift_bridgeObjectRetain();
    sub_1ECC8(v16, v23, v18, v19);
    sub_1ED0C(v16, v23, v18, v19);
    sub_6EA0(v10, v26, v25 & 1);
    swift_bridgeObjectRelease();
    sub_6EA0(v4, v6, v8 & 1);
    return swift_bridgeObjectRelease();
  }
  uint64_t result = sub_282D0();
  __break(1u);
  return result;
}

void type metadata accessor for CSLPRFDepthAutoLaunchBehavior()
{
  if (!qword_3C5E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_3C5E0);
    }
  }
}

uint64_t sub_1EC80(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1ECC8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_6E90(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1ED0C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_6EA0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1ED50(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    return sub_1DE94();
  }
  return result;
}

uint64_t sub_1EDA8(uint64_t a1, void *a2)
{
  if (a2)
  {

    return sub_1DEE0();
  }
  return result;
}

unint64_t sub_1EE04()
{
  unint64_t result = qword_3C4C8;
  if (!qword_3C4C8)
  {
    sub_6388(&qword_3C4D0);
    sub_1E260();
    sub_1E324();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C4C8);
  }
  return result;
}

uint64_t sub_1EE8C()
{
  return sub_6E4C(&qword_3C4D8, (uint64_t *)&unk_3C4E0);
}

uint64_t DepthApp.bundleID.getter(uint64_t a1)
{
  return a1;
}

uint64_t DepthApp.displayName.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t static DepthApp.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == a5 && a2 == a6 || (v12 = sub_28330(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
    {
      return 1;
    }
    else
    {
      return sub_28330();
    }
  }
  return result;
}

uint64_t DepthApp.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_28020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_28020();

  return swift_bridgeObjectRelease();
}

Swift::Int DepthApp.hashValue.getter()
{
  return sub_283A0();
}

uint64_t sub_1F0F8(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_28330(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_28330();
    }
  }
  return result;
}

uint64_t sub_1F19C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int sub_1F1A8()
{
  return sub_283A0();
}

uint64_t sub_1F230()
{
  swift_bridgeObjectRetain();
  sub_28020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_28020();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1F2B4()
{
  return sub_283A0();
}

void *sub_1F338()
{
  return &_swiftEmptySetSingleton;
}

uint64_t sub_1F344()
{
  type metadata accessor for DepthUnitPreferenceStore();
  id v0 = sub_25A7C();
  return DepthUnitPreferenceStore.__allocating_init(userDefaults:)(v0);
}

id sub_1F374()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings) version];
}

uint64_t sub_1F38C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource + 32);
  sub_F2BC((void *)(v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

id sub_1F3E8()
{
  return sub_1FE18((SEL *)&selRef_autoLaunchBehavior);
}

uint64_t sub_1F3F4(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for DepthAutoLaunchModel();
  sub_20658((unint64_t *)&qword_3C500, v4, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  sub_279C0();
  sub_279D0();
  swift_release();
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1F610;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_1F62C;
  v11[5] = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1F654;
  v11[3] = &unk_36A30;
  char v8 = _Block_copy(v11);
  id v9 = v2;
  swift_retain();
  swift_release();
  [v5 updateSettingsWithBlock:v8];
  _Block_release(v8);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DepthAutoLaunchModel()
{
  return self;
}

uint64_t sub_1F5D8()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_1F610(void *a1)
{
  return sub_2003C(a1, (SEL *)&selRef_setAutoLaunchBehavior_);
}

uint64_t sub_1F61C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1F62C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1F654(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_1F6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1F6B0()
{
  return swift_release();
}

uint64_t (*sub_1F6B8(void *a1))(uint64_t *a1)
{
  a1[1] = v1;
  id v3 = [*(id *)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings) settings];
  id v4 = [v3 autoLaunchBehavior];

  *a1 = v4;
  return sub_1F73C;
}

uint64_t sub_1F73C(uint64_t *a1)
{
  return sub_1F3F4(*a1);
}

id sub_1F760()
{
  id v1 = [*(id *)((char *)v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings) settings];
  id v2 = [v1 bundleID];

  if (v2)
  {
    uint64_t v3 = sub_28010();
    uint64_t v5 = v4;

    uint64_t v6 = (*(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v0)))();
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      uint64_t v8 = v6 + 56;
      while (1)
      {
        id v2 = *(id *)(v8 - 24);
        if (v2 == (id)v3 && *(void *)(v8 - 16) == v5) {
          break;
        }
        if (sub_28330()) {
          goto LABEL_13;
        }
        v8 += 32;
        if (!--v7) {
          goto LABEL_10;
        }
      }
      id v2 = (id)v3;
LABEL_13:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_10:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v2;
}

uint64_t sub_1F8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  type metadata accessor for DepthAutoLaunchModel();
  sub_20658((unint64_t *)&qword_3C500, v10, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  sub_279C0();
  sub_279D0();
  swift_release();
  uint64_t v11 = *(void **)&v4[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings];
  char v12 = (void *)swift_allocObject();
  v12[2] = v5;
  uint64_t v12[3] = a1;
  v12[4] = a2;
  v12[5] = a3;
  void v12[6] = a4;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1FAF8;
  *(void *)(v13 + 24) = v12;
  v17[4] = sub_20B3C;
  v17[5] = v13;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  _OWORD v17[2] = sub_1F654;
  v17[3] = &unk_36AA8;
  long long v14 = _Block_copy(v17);
  id v15 = v5;
  swift_retain();
  swift_release();
  [v11 updateSettingsWithBlock:v14];
  _Block_release(v14);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v5) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1FAAC()
{
  if (*(void *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1FAF8(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  [a1 setChangeSource:*(void *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_changeSource)];
  if (v3) {
    NSString v4 = sub_28000();
  }
  else {
    NSString v4 = 0;
  }
  id v5 = v4;
  objc_msgSend(a1, "setBundleID:");
}

uint64_t sub_1FB8C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void (*sub_1FB9C(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  id v4 = [*(id *)((char *)v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings) settings];
  id v5 = [v4 bundleID];

  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = sub_28010();
  uint64_t v8 = v7;

  uint64_t v9 = (*(uint64_t (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v1)))();
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  uint64_t v11 = (uint64_t *)(v9 + 56);
  while (1)
  {
    uint64_t v12 = *(v11 - 3);
    uint64_t v13 = *(v11 - 2);
    uint64_t v15 = *(v11 - 1);
    uint64_t v14 = *v11;
    if (v12 == v6 && v13 == v8) {
      break;
    }
    if (sub_28330()) {
      goto LABEL_14;
    }
    v11 += 4;
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v12 = v6;
  uint64_t v13 = v8;
LABEL_14:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_15:
  void *v3 = v12;
  v3[1] = v13;
  v3[2] = v15;
  v3[3] = v14;
  return sub_1FD6C;
}

void sub_1FD6C(uint64_t **a1, char a2)
{
  id v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  uint64_t v5 = (*a1)[2];
  uint64_t v6 = (*a1)[3];
  if (a2)
  {
    sub_100F4(**a1, v3);
    sub_1F8D0(v4, v3, v5, v6);
    sub_10188(*v2, v2[1]);
  }
  else
  {
    sub_1F8D0(**a1, v3, v5, v6);
  }

  free(v2);
}

id sub_1FE0C()
{
  return sub_1FE18((SEL *)&selRef_threshold);
}

id sub_1FE18(SEL *a1)
{
  id v3 = [*(id *)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings) settings];
  id v4 = [v3 *a1];

  return v4;
}

uint64_t sub_1FE70(uint64_t a1)
{
  id v2 = v1;
  type metadata accessor for DepthAutoLaunchModel();
  sub_20658((unint64_t *)&qword_3C500, v4, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  sub_279C0();
  sub_279D0();
  swift_release();
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_20030;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_20B3C;
  v11[5] = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1F654;
  v11[3] = &unk_36B20;
  uint64_t v8 = _Block_copy(v11);
  id v9 = v2;
  swift_retain();
  swift_release();
  [v5 updateSettingsWithBlock:v8];
  _Block_release(v8);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

id sub_20030(void *a1)
{
  return sub_2003C(a1, (SEL *)&selRef_setThreshold_);
}

id sub_2003C(void *a1, SEL *a2)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  objc_msgSend(a1, *a2, v4);
  uint64_t v6 = *(void *)(v5 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_changeSource);

  return [a1 setChangeSource:v6];
}

uint64_t sub_20090()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t (*sub_200A0(void *a1))(uint64_t *a1)
{
  a1[1] = v1;
  id v3 = [*(id *)(v1 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings) settings];
  id v4 = [v3 threshold];

  *a1 = v4;
  return sub_20124;
}

uint64_t sub_20124(uint64_t *a1)
{
  return sub_1FE70(*a1);
}

uint64_t sub_20148()
{
  return (*(uint64_t (**)(void))(**(void **)(v0
                                            + OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_depthUnitPreferenceStore)
                              + 136))();
}

id sub_20194()
{
  id v0 = objc_allocWithZone((Class)CSLPRFDepthAutoLaunchAppSetting);

  return [v0 init];
}

char *sub_201CC(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_20210(a1, a2);
}

char *sub_20210(uint64_t a1, void *a2)
{
  void (*v16)(void *__return_ptr, uint64_t, uint64_t);
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  id v22;
  id v24;
  void v25[4];
  objc_super v26;

  uint64_t v5 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_stingSettingsModel;
  id v6 = objc_allocWithZone((Class)CSLPRFStingSettingsModel);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = [v6 init];
  *(void *)&v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_subscriptions] = &_swiftEmptySetSingleton;
  uint64_t v8 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_depthUnitPreferenceStore;
  type metadata accessor for DepthUnitPreferenceStore();
  id v9 = sub_25A7C();
  *(void *)&v7[v8] = DepthUnitPreferenceStore.__allocating_init(userDefaults:)(v9);
  uint64_t v10 = type metadata accessor for RemoteInstalledDepthAppsDataSource();
  id v11 = RemoteInstalledDepthAppsDataSource.__allocating_init()();
  uint64_t v12 = &v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource];
  *((void *)v12 + 3) = v10;
  *((void *)v12 + 4) = &off_364C0;
  *(void *)uint64_t v12 = v11;
  *(void *)&v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_changeSource] = a1;
  *(void *)&v7[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings] = a2;
  uint64_t v24 = a2;

  v26.receiver = v7;
  v26.super_class = (Class)type metadata accessor for DepthAutoLaunchModel();
  uint64_t v13 = (char *)objc_msgSendSuper2(&v26, "init");
  uint64_t v14 = *(void *)&v13[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource + 24];
  uint64_t v15 = *(void *)&v13[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource + 32];
  sub_F2BC(&v13[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_installedAppsDataSource], v14);
  uint64_t v16 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v15 + 16);
  uint64_t v17 = v13;
  v16(v25, v14, v15);
  sub_F2BC(v25, v25[3]);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_27A70();
  swift_release();
  swift_beginAccess();
  sub_279A0();
  swift_endAccess();
  swift_release();
  sub_F300((uint64_t)v25);
  sub_20658(&qword_3C528, 255, (void (*)(uint64_t))type metadata accessor for DepthUnitPreferenceStore);
  v25[0] = sub_279C0();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_205AC;
  *(void *)(v19 + 24) = v18;
  sub_279E0();
  sub_27A70();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_279A0();
  swift_endAccess();
  swift_release();
  uint64_t v20 = *(void **)&v17[OBJC_IVAR____TtC27CompanionAutoLaunchSettings20DepthAutoLaunchModel_autoLaunchSettings];
  uint64_t v21 = v17;
  char v22 = v20;
  [v22 setDelegate:v21];

  return v21;
}

uint64_t sub_20574()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_205AC()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    type metadata accessor for DepthAutoLaunchModel();
    sub_20658((unint64_t *)&qword_3C500, v2, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
    sub_279C0();

    sub_279D0();
    return swift_release();
  }
  return result;
}

uint64_t sub_20658(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_206A0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_206D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_20700()
{
}

id sub_20760()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthAutoLaunchModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_20810@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DepthAutoLaunchModel();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t sub_2084C()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_20658((unint64_t *)&qword_3C500, v0, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  sub_279C0();
  sub_279D0();

  return swift_release();
}

void CSLPRFDepthAutoLaunchBehavior.hash(into:)(uint64_t a1, Swift::UInt a2)
{
}

void *sub_209AC()
{
  return &protocol witness table for String;
}

unint64_t sub_209BC()
{
  unint64_t result = qword_3C530;
  if (!qword_3C530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C530);
  }
  return result;
}

uint64_t sub_20A10()
{
  return sub_20658(&qword_3C538, 255, (void (*)(uint64_t))type metadata accessor for CSLPRFDepthAutoLaunchBehavior);
}

uint64_t sub_20A5C()
{
  return sub_20658(&qword_3C540, 255, (void (*)(uint64_t))type metadata accessor for CSLPRFDepthAutoLaunchBehavior);
}

ValueMetadata *type metadata accessor for DepthApp()
{
  return &type metadata for DepthApp;
}

void type metadata accessor for CSLAutoLaunchAppSettingChangeSource(uint64_t a1)
{
}

void type metadata accessor for CSLPRFDepthAutoLaunchThreshold(uint64_t a1)
{
}

void sub_20AE0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_20B44()
{
  unint64_t result = qword_3C500;
  if (!qword_3C500)
  {
    type metadata accessor for DepthAutoLaunchModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C500);
  }
  return result;
}

uint64_t sub_20B9C()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_20B44();

  return sub_27B10();
}

uint64_t sub_20BF8()
{
  return sub_27CE0();
}

uint64_t sub_20CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v23 = a3;
  uint64_t v21 = sub_27C00();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_6344(&qword_3C5F8);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DepthAutoLaunchModel();
  sub_20B44();
  uint64_t v7 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();

  uint64_t v8 = v34;
  uint64_t v9 = v35;
  uint64_t v26 = v32;
  uint64_t v27 = v33;
  uint64_t v28 = v34;
  uint64_t v29 = v35;
  uint64_t v30 = v36;
  uint64_t v31 = v37;
  sub_27F60();
  sub_6344(&qword_3C618);
  sub_27EE0();
  swift_release();
  swift_release();
  swift_release();
  sub_10188(v8, v9);
  uint64_t v10 = v40;
  uint64_t v11 = v41;
  uint64_t v24 = a1;
  uint64_t v25 = v17;
  uint64_t v32 = v38;
  uint64_t v33 = v39;
  uint64_t v34 = v40;
  uint64_t v35 = v41;
  uint64_t v36 = v42;
  uint64_t v37 = v43;
  swift_retain();
  swift_retain();
  sub_100F4(v10, v11);
  sub_6344(&qword_3C620);
  sub_6344(&qword_3C628);
  sub_2171C();
  sub_217E4();
  sub_27E70();
  swift_release();
  swift_release();
  sub_10188(v10, v11);
  uint64_t v12 = v18;
  sub_27BF0();
  sub_6E4C(&qword_3C600, &qword_3C5F8);
  uint64_t v13 = v19;
  uint64_t v14 = v21;
  sub_27D70();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v6, v13);
}

uint64_t sub_21098@<X0>(uint64_t a1@<X8>)
{
  return sub_20CE0(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_210A0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & **a1) - 8])();
  *a2 = result;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  return result;
}

uint64_t sub_21100(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&stru_B8.segname[swift_isaMask & **a2];
  sub_100F4(*a1, v3);
  return v6(v2, v3, v4, v5);
}

uint64_t sub_21198@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_211E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_bridgeObjectRetain();
  char v6 = sub_814C();
  sub_15DF0(a1, a2, v6 & 1, (uint64_t)v21);
  sub_64B0();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_27D40();
  uint64_t v9 = v8;
  uint64_t v10 = v21[1];
  char v12 = v11 & 1;
  uint64_t v14 = v24;
  unint64_t v13 = v25;
  uint64_t v15 = v26;
  char v16 = v22 & 1;
  *(void *)a3 = v21[0];
  *(void *)(a3 + 8) = v10;
  *(unsigned char *)(a3 + 16) = v16;
  *(_OWORD *)(a3 + 24) = v23;
  *(void *)(a3 + 40) = v14;
  *(void *)(a3 + 48) = v13;
  *(void *)(a3 + 56) = v15;
  uint64_t v20 = (void *)v27;
  *(_OWORD *)(a3 + 64) = v27;
  *(void *)(a3 + 80) = v7;
  *(void *)(a3 + 88) = v8;
  *(unsigned char *)(a3 + 96) = v11 & 1;
  *(void *)(a3 + 104) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_10E54(v13);
  id v18 = v20;
  swift_retain();
  sub_6E90(v7, v9, v12);
  swift_bridgeObjectRetain();
  sub_6EA0(v7, v9, v12);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10E74(v13);

  return swift_release();
}

uint64_t sub_2136C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = sub_27C10();
  sub_211E0(v3, v4, (uint64_t)&v18);
  char v8 = v19;
  uint64_t v9 = v24;
  char v10 = v25;
  uint64_t v11 = v26;
  long long v12 = v18;
  long long v13 = v20;
  long long v14 = v21;
  long long v15 = v22;
  long long v16 = v23;
  LOBYTE(v18) = 1;
  char v27 = v25;
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 48) = v13;
  *(_OWORD *)(a1 + 64) = v14;
  *(_OWORD *)(a1 + 80) = v15;
  *(_OWORD *)(a1 + 96) = v16;
  *(void *)(a1 + 112) = v9;
  *(unsigned char *)(a1 + 120) = v10;
  *(void *)(a1 + 128) = v11;
  *(void *)(a1 + 136) = v3;
  *(void *)(a1 + 144) = v4;
  *(void *)(a1 + 152) = v6;
  *(void *)(a1 + 160) = v5;
  *(void *)(a1 + 168) = v3;
  *(void *)(a1 + 176) = v4;
  *(void *)(a1 + 184) = v6;
  *(void *)(a1 + 192) = v5;
  swift_bridgeObjectRetain_n();
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_21448()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_20B44();

  return sub_27B00();
}

uint64_t sub_21494()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_214B0()
{
  return sub_27CE0();
}

ValueMetadata *type metadata accessor for DepthAutoLaunchPicker()
{
  return &type metadata for DepthAutoLaunchPicker;
}

uint64_t sub_215AC()
{
  return sub_6E4C(&qword_3C608, &qword_3C610);
}

ValueMetadata *type metadata accessor for DepthAutoLaunchPicker.AppCell()
{
  return &type metadata for DepthAutoLaunchPicker.AppCell;
}

uint64_t sub_215F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21614()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v1));
  uint64_t v3 = v1;
  v2();

  sub_6344(&qword_3C1F0);
  sub_6E4C(&qword_3C648, &qword_3C1F0);
  sub_21858();
  sub_218AC();
  return sub_27F00();
}

unint64_t sub_2171C()
{
  unint64_t result = qword_3C630;
  if (!qword_3C630)
  {
    sub_6388(&qword_3C620);
    sub_21790();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C630);
  }
  return result;
}

unint64_t sub_21790()
{
  unint64_t result = qword_3C638;
  if (!qword_3C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C638);
  }
  return result;
}

unint64_t sub_217E4()
{
  unint64_t result = qword_3C640;
  if (!qword_3C640)
  {
    sub_6388(&qword_3C628);
    sub_21858();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C640);
  }
  return result;
}

unint64_t sub_21858()
{
  unint64_t result = qword_3E018[0];
  if (!qword_3E018[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_3E018);
  }
  return result;
}

unint64_t sub_218AC()
{
  unint64_t result = qword_3C650;
  if (!qword_3C650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C650);
  }
  return result;
}

unint64_t sub_21904()
{
  unint64_t result = qword_3C658;
  if (!qword_3C658)
  {
    sub_6388(&qword_3C660);
    sub_219A4();
    sub_6E4C(&qword_3C698, &qword_3C6A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C658);
  }
  return result;
}

unint64_t sub_219A4()
{
  unint64_t result = qword_3C668;
  if (!qword_3C668)
  {
    sub_6388(&qword_3C670);
    sub_6E4C(&qword_3C678, &qword_3C680);
    sub_6E4C(&qword_3C688, &qword_3C690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C668);
  }
  return result;
}

uint64_t sub_21A6C()
{
  return sub_21AF4((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))&StateObject.wrappedValue.getter);
}

unint64_t sub_21A84()
{
  unint64_t result = qword_3BE08;
  if (!qword_3BE08)
  {
    type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3BE08);
  }
  return result;
}

uint64_t sub_21ADC()
{
  return sub_21AF4((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))&StateObject.projectedValue.getter);
}

uint64_t sub_21AF4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((unsigned __int8 *)v1 + 16);
  uint64_t v5 = type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  unint64_t v6 = sub_21A84();

  return a1(v2, v3, v4, v5, v6);
}

uint64_t sub_21B68()
{
  sub_6344(&qword_3BFB8);
  sub_27E30();
  return v1;
}

uint64_t sub_21BB0()
{
  return sub_27E40();
}

void (*sub_21BFC(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[1] = *(_OWORD *)(v1 + 24);
  sub_1126C((uint64_t)v3 + 24, (uint64_t)(v3 + 2));
  _OWORD *v3 = v3[1];
  sub_112D4((uint64_t)(v3 + 2));
  *((void *)v3 + 5) = sub_6344(&qword_3BFB8);
  sub_27E30();
  return sub_11210;
}

uint64_t sub_21CA0()
{
  sub_6344(&qword_3BFB8);
  sub_27E50();
  return v1;
}

uint64_t sub_21CEC()
{
  sub_6344(&qword_3BFC8);
  sub_27EB0();
  return v1;
}

uint64_t sub_21D3C()
{
  return sub_27EC0();
}

void (*sub_21D90(void *a1))(uint64_t a1)
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
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_112D4((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_6344(&qword_3BFC8);
  sub_27EB0();
  return sub_114C0;
}

uint64_t sub_21E34()
{
  sub_6344(&qword_3BFC8);
  sub_27ED0();
  return v1;
}

uint64_t sub_21E88()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_21A84();
  uint64_t v0 = sub_27A90();
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 200))(v0);
  swift_release();
  if (v1 == 1)
  {
    uint64_t v2 = 0xD00000000000002DLL;
    uint64_t v3 = (void *)0x800000000002D150;
  }
  else
  {
    uint64_t v4 = sub_27A90();
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

  return sub_14E1C(v2, v3);
}

uint64_t sub_21FD4()
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_21A84();
  sub_27A90();
  long long v2 = *(_OWORD *)(v0 + 24);
  sub_6344(&qword_3BFB8);
  sub_27E30();
  long long v4 = *(_OWORD *)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 56);
  sub_6344(&qword_3BFC8);
  sub_27ED0();
  sub_115C8(v2, *((uint64_t *)&v2 + 1), v3, (uint64_t)&v2);
  sub_6344(&qword_3C6A8);
  sub_6E4C(&qword_3C6B0, &qword_3C6A8);
  sub_227E4();
  return sub_27AF0();
}

void sub_22128(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v57 = a2;
  uint64_t v3 = sub_6344(&qword_3C6D8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v61 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v59 = (uint64_t *)((char *)&v47 - v6);
  uint64_t v62 = sub_27E00();
  uint64_t v60 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  char v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = a1;
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_21A84();
  uint64_t v9 = sub_27A90();
  uint64_t v10 = *(void *)(v9
                  + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID);
  uint64_t v11 = *(void *)(v9
                  + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_bundleID
                  + 8);
  swift_bridgeObjectRetain();
  swift_release();
  sub_6F9C(v81);
  long long v88 = v81[1];
  v89[0] = v81[0];
  sub_14150((uint64_t)&v88);
  long long v87 = v81[2];
  sub_14150((uint64_t)&v87);
  if (v10 == *(void *)&v89[0] && v11 == *((void *)&v89[0] + 1))
  {
    sub_14150((uint64_t)v89);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v13 = sub_28330();
  sub_14150((uint64_t)v89);
  swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_8:
    sub_27DF0();
    uint64_t v19 = v60;
    uint64_t v20 = v62;
    (*(void (**)(char *, void, uint64_t))(v60 + 104))(v8, enum case for Image.ResizingMode.stretch(_:), v62);
    uint64_t v21 = sub_27E10();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    sub_27F50();
    sub_27AA0();
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
  uint64_t v14 = sub_27A90();
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 168))(v14);
  uint64_t v17 = v16;
  swift_release();
  char v18 = *(unsigned char *)(sub_27A90()
                 + OBJC_IVAR____TtCC27CompanionAutoLaunchSettings29LiveActivitiesAutoLaunchModel17LiveActivitiesApp_isPhoneApp);
  swift_release();
  sub_15DF0(v15, v17, v18, (uint64_t)&v82);
  long long v63 = v82;
  uint64_t v64 = v83;
  long long v65 = *(_OWORD *)v84;
  long long v66 = *(_OWORD *)&v84[16];
  long long v67 = v85;
  uint64_t v68 = v86;
  char v69 = 1;
LABEL_9:
  sub_6344(&qword_3C6E0);
  sub_22B80();
  sub_22BF4();
  sub_27CA0();
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
  uint64_t v28 = sub_27C80();
  uint64_t v29 = (uint64_t)v59;
  *uint64_t v59 = v28;
  *(void *)(v29 + 8) = 0;
  *(unsigned char *)(v29 + 16) = 1;
  uint64_t v30 = sub_6344(&qword_3C6F8);
  __chkstk_darwin(v30);
  sub_27A80();
  uint64_t v31 = v61;
  sub_22D08(v29, v61);
  uint64_t v32 = v22;
  uint64_t v52 = v25;
  uint64_t v53 = v22;
  uint64_t v33 = v57;
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
  uint64_t v38 = sub_6344(&qword_3C700);
  sub_22D08(v31, (uint64_t)v33 + *(int *)(v38 + 48));
  uint64_t v39 = v53;
  uint64_t v40 = v23;
  uint64_t v42 = v51;
  uint64_t v41 = v52;
  uint64_t v43 = v34;
  uint64_t v44 = v26;
  unint64_t v45 = v50;
  uint64_t v46 = v60;
  sub_22D70(v53, v40, v52, v51, v43, v44, v50, v60, v36, v37, v25);
  sub_22DF0(v29);
  sub_22DF0(v61);
  sub_22E50(v39, v49, v41, v42, v62, v48, v45, v46, v36, v37, v25);
}

uint64_t sub_226CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, char a5@<W5>, uint64_t a6@<X8>)
{
  uint64_t result = sub_27E20();
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

uint64_t sub_22750()
{
  return sub_21FD4();
}

void sub_22794(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)a1 = sub_27C10();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = sub_6344(&qword_3C6D0);
  sub_22128(v3, (uint64_t *)(a1 + *(int *)(v4 + 44)));
}

unint64_t sub_227E4()
{
  unint64_t result = qword_3C6B8;
  if (!qword_3C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C6B8);
  }
  return result;
}

uint64_t sub_22838()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22854()
{
  return swift_retain();
}

uint64_t destroy for LiveActivitiesAppButton()
{
  sub_228B0();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_228B0()
{
  return swift_release();
}

uint64_t initializeWithCopy for LiveActivitiesAppButton(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_22854();
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
  sub_22854();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_228B0();
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
  sub_228B0();
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

uint64_t sub_22B44()
{
  return sub_6E4C(&qword_3C6C0, &qword_3C6C8);
}

unint64_t sub_22B80()
{
  unint64_t result = qword_3C6E8;
  if (!qword_3C6E8)
  {
    sub_6388(&qword_3C6E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C6E8);
  }
  return result;
}

unint64_t sub_22BF4()
{
  unint64_t result = qword_3C6F0;
  if (!qword_3C6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C6F0);
  }
  return result;
}

uint64_t sub_22C48@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LiveActivitiesAutoLaunchModel.LiveActivitiesApp();
  sub_21A84();
  sub_27A90();
  swift_bridgeObjectRetain();
  swift_release();
  sub_64B0();
  uint64_t result = sub_27D40();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3C6D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, void *a9, uint64_t a10, char a11)
{
  if (a11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_10E54(a7);
    id v12 = a9;
  }

  return swift_retain();
}

uint64_t sub_22DF0(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3C6D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_22E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, void *a9, uint64_t a10, char a11)
{
  if (a11)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_10E74(a7);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_22EFC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for LiveActivitiesCompanionSection()
{
  return &type metadata for LiveActivitiesCompanionSection;
}

void *sub_22F28()
{
  return &protocol witness table for EmptyView;
}

uint64_t sub_22F38()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_24CD8((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);

  return sub_27B10();
}

uint64_t sub_22FC4()
{
  return sub_27CF0();
}

uint64_t sub_230AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v15[1] = a3;
  uint64_t v5 = sub_27C00();
  v15[0] = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6344(&qword_3C710);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_14E1C(0xD00000000000001DLL, (void *)0x800000000002DBC0);
  uint64_t v21 = v12;
  type metadata accessor for DepthAutoLaunchModel();
  sub_24CD8((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);
  char v13 = (void *)sub_27B10();
  swift_getKeyPath();
  sub_27B20();
  swift_release();

  long long v16 = v18;
  uint64_t v17 = v19;
  v15[4] = a1;
  v15[5] = a2;
  type metadata accessor for CSLPRFDepthAutoLaunchThreshold(0);
  sub_6344(&qword_3C738);
  sub_24CD8(&qword_3C740, type metadata accessor for CSLPRFDepthAutoLaunchThreshold);
  sub_6E4C(&qword_3C748, &qword_3C738);
  sub_64B0();
  sub_27E80();
  sub_27BF0();
  sub_6E4C(&qword_3C718, &qword_3C710);
  sub_27D70();
  (*(void (**)(char *, uint64_t))(v15[0] + 8))(v7, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_23400@<X0>(uint64_t a1@<X8>)
{
  return sub_230AC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_23408@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))&stru_B8.segname[(swift_isaMask & **a1) + 16])();
  *a2 = result;
  return result;
}

uint64_t sub_23464(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((char *)&stru_B8.size + (swift_isaMask & **a2)))(*a1);
}

uint64_t sub_234BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = sub_27950();
  uint64_t v4 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_27800();
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (void (**)(char *, void, uint64_t, uint64_t))((char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = sub_14E1C(0xD000000000000023, (void *)0x800000000002DBE0);
  uint64_t v33 = v10;
  sub_64B0();
  uint64_t v11 = sub_27D40();
  uint64_t v13 = v12;
  uint64_t v29 = v14;
  char v16 = v15 & 1;
  uint64_t v17 = *(void (**)(void))((char *)&stru_B8.reloff + (swift_isaMask & *a1));
  long long v18 = a1;
  v17();

  sub_237A0((uint64_t)v6, v9);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v30);
  uint64_t v19 = sub_27D30();
  uint64_t v21 = v20;
  char v31 = v16;
  char v44 = v16;
  LOBYTE(v9) = v22 & 1;
  char v43 = 0;
  char v41 = 0;
  char v38 = v22 & 1;
  char v36 = 0;
  char v34 = 0;
  *(_DWORD *)(a2 + 17) = v32;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v32 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v42;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v42[3];
  int v23 = v39;
  *(_WORD *)(a2 + 62) = v40;
  *(_DWORD *)(a2 + 58) = v23;
  int v24 = *(_DWORD *)v37;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a2 + 81) = v24;
  int v25 = *(_DWORD *)v35;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a2 + 105) = v25;
  LOBYTE(v25) = v34;
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v13;
  *(unsigned char *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = v29;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(_WORD *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = v19;
  *(void *)(a2 + 72) = v20;
  *(unsigned char *)(a2 + 80) = v22 & 1;
  *(void *)(a2 + 88) = v26;
  *(void *)(a2 + 96) = 1;
  *(unsigned char *)(a2 + 104) = 0;
  *(void *)(a2 + 112) = 1;
  *(unsigned char *)(a2 + 120) = 0;
  *(unsigned char *)(a2 + 121) = v25;
  sub_6E90(v11, v13, v16);
  swift_bridgeObjectRetain();
  sub_6E90(v19, v21, (char)v9);
  swift_bridgeObjectRetain();
  sub_6EA0(v19, v21, (char)v9);
  swift_bridgeObjectRelease();
  sub_6EA0(v11, v13, v31);
  return swift_bridgeObjectRelease();
}

uint64_t sub_237A0@<X0>(uint64_t a1@<X0>, void (**a2)(char *, void, uint64_t, uint64_t)@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v37 = a2;
  uint64_t v38 = sub_27800();
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v35 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = sub_27940();
  __chkstk_darwin(v3 - 8);
  uint64_t v33 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_27890();
  uint64_t v5 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v7 = (uint64_t *)((char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v34 = sub_278A0();
  uint64_t v31 = *(void *)(v34 - 8);
  uint64_t v8 = __chkstk_darwin(v34);
  uint64_t v32 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = sub_27950();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  char v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_27FF0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  char v22 = (char *)&v28 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v29, v12);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (v23 == enum case for DepthUnit.feet(_:) || v23 == enum case for DepthUnit.meters(_:))
  {
    sub_27FE0();
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
    sub_14ED8();
    *uint64_t v7 = type metadata accessor for DepthAutoLaunchModel();
    (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v30);
    sub_27930();
    sub_278B0();
    uint64_t v24 = v31;
    uint64_t v25 = v34;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v32, v11, v34);
    swift_getKeyPath();
    _s25DepthAutoLaunchAttributesVMa();
    sub_2528C((unint64_t *)&unk_3E330);
    uint64_t v26 = v35;
    sub_277F0();
    sub_23D64(v26, v37);
    (*(void (**)(void (**)(char *, uint64_t, uint64_t, uint64_t), uint64_t))(v36 + 8))(v26, v38);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v16);
  }
  else
  {
    uint64_t result = sub_282D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_23D38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s25DepthAutoLaunchAttributesVMa();
  *a1 = result;
  return result;
}

uint64_t sub_23D64@<X0>(void (**a1)(char *, uint64_t, uint64_t, uint64_t)@<X0>, void (**a2)(char *, void, uint64_t, uint64_t)@<X8>)
{
  uint64_t v70 = a1;
  uint64_t v3 = sub_6344(&qword_3C750);
  __chkstk_darwin(v3 - 8);
  uint64_t v55 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_6344(&qword_3C758);
  __chkstk_darwin(v54);
  uint64_t v53 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_277B0();
  uint64_t v58 = *(void (***)(char *, uint64_t))(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v75 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6344(&qword_3C760);
  __chkstk_darwin(v7 - 8);
  uint64_t v71 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_277C0();
  uint64_t v74 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  long long v67 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v72 = (char *)&v52 - v12;
  uint64_t v52 = sub_277D0();
  uint64_t v73 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_27800();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_6344(&qword_3C768) - 8;
  uint64_t v19 = __chkstk_darwin(v69);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  int v23 = (char *)&v52 - v22;
  uint64_t v24 = *(void (**)(uint64_t, void (**)(char *, uint64_t, uint64_t, uint64_t), uint64_t))(v16 + 16);
  v24((uint64_t)a2, v70, v15);
  uint64_t v56 = a2;
  v24((uint64_t)v18, a2, v15);
  uint64_t v25 = (uint64_t)v23;
  sub_277E0();
  uint64_t v26 = v15;
  uint64_t v27 = v52;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v26);
  uint64_t v28 = v73;
  uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  uint64_t v65 = v73 + 16;
  v64(v21, v14, v27);
  uint64_t v29 = sub_24CD8(&qword_3C770, (void (*)(uint64_t))&type metadata accessor for AttributedString.Runs);
  uint64_t v30 = v72;
  sub_280D0();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  long long v66 = v14;
  uint64_t v73 = v28 + 8;
  long long v63 = v31;
  v31(v14, v27);
  uint64_t v32 = v69;
  uint64_t v33 = v74;
  (*(void (**)(char *, char *, uint64_t))(v74 + 32))(&v21[*(int *)(v69 + 44)], v30, v9);
  sub_24C70((uint64_t)v21, v25);
  uint64_t v34 = v25 + *(int *)(v32 + 44);
  uint64_t v35 = *(void *)(v33 + 16);
  uint64_t v74 = v33 + 16;
  uint64_t v68 = (void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v69 = v35;
  uint64_t v70 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 7);
  uint64_t v61 = (unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 6);
  uint64_t v62 = (void (**)(char *))(v58 + 2);
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v58 + 4);
  ++v58;
  uint64_t v60 = v25;
  while (1)
  {
    uint64_t v36 = v72;
    ((void (*)(char *, uint64_t, uint64_t))v69)(v72, v34, v9);
    uint64_t v37 = v67;
    sub_280E0();
    sub_24CD8(&qword_3C778, (void (*)(uint64_t))&type metadata accessor for AttributedString.Runs.Index);
    char v38 = sub_27FD0();
    uint64_t v39 = v29;
    __int16 v40 = *v68;
    (*v68)(v37, v9);
    v40(v36, v9);
    if (v38) {
      break;
    }
    char v41 = (void (*)(unsigned char *, void))sub_28100();
    uint64_t v42 = v71;
    uint64_t v43 = v76;
    (*v62)(v71);
    v41(v77, 0);
    char v44 = v66;
    v64(v66, (char *)v25, v27);
    sub_280F0();
    v63(v44, v27);
    (*v70)(v42, 0, 1, v43);
    if ((*v61)(v42, 1, v43) == 1) {
      return sub_14228(v25, &qword_3C768);
    }
    (*v59)(v75, v42, v76);
    uint64_t KeyPath = swift_getKeyPath();
    *(&v52 - 2) = __chkstk_darwin(KeyPath);
    swift_getKeyPath();
    sub_24D4C();
    sub_27790();
    swift_release();
    if (v77[0] != 2)
    {
      uint64_t v46 = (uint64_t)v53;
      sub_277A0();
      uint64_t v47 = swift_getKeyPath();
      *(&v52 - 2) = __chkstk_darwin(v47);
      uint64_t v57 = swift_getKeyPath();
      uint64_t v48 = v55;
      sub_27D00();
      uint64_t v49 = sub_27D10();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
      sub_6E4C(&qword_3C788, &qword_3C758);
      unint64_t v50 = (void (*)(unsigned char *, void))sub_27810();
      sub_24DA4();
      sub_27860();
      v50(v77, 0);
      sub_14228(v46, &qword_3C758);
    }
    (*v58)(v75, v76);
    uint64_t v25 = v60;
    uint64_t v29 = v39;
  }
  (*v70)(v71, 1, 1, v76);
  return sub_14228(v25, &qword_3C768);
}

uint64_t sub_246B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24758(a1, a2, a3, &qword_3C798);
}

uint64_t sub_246C4(uint64_t a1, uint64_t a2)
{
  return sub_247BC(a1, a2, &qword_3C798);
}

uint64_t sub_246D0(void *a1, uint64_t a2)
{
  return AttributeDynamicLookup.subscript.getter(*(void *)(class metadata base offset for KeyPath + *a1 + 8), *(void *)(class metadata base offset for KeyPath + *a1 + 8), a2);
}

uint64_t sub_24714()
{
  unint64_t v0 = sub_24D4C();

  return AttributeDynamicLookup.subscript.getter(&type metadata for DepthUnitAttribute, &type metadata for DepthUnitAttribute, v0);
}

uint64_t sub_2474C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24758(a1, a2, a3, &qword_3C790);
}

uint64_t sub_24758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_27FD0() & 1;
}

uint64_t sub_247B0(uint64_t a1, uint64_t a2)
{
  return sub_247BC(a1, a2, &qword_3C790);
}

uint64_t sub_247BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_27FC0();
}

void sub_24800()
{
}

void sub_24828()
{
}

uint64_t sub_24844()
{
  type metadata accessor for DepthAutoLaunchModel();
  sub_24CD8((unint64_t *)&qword_3C500, (void (*)(uint64_t))type metadata accessor for DepthAutoLaunchModel);

  return sub_27B00();
}

uint64_t sub_248C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248DC()
{
  return sub_27CF0();
}

ValueMetadata *type metadata accessor for DepthAutoLaunchThresholdPicker()
{
  return &type metadata for DepthAutoLaunchThresholdPicker;
}

uint64_t sub_249D8()
{
  return sub_6E4C(&qword_3C720, &qword_3C728);
}

uint64_t sub_24A14()
{
  return sub_24CD8(&qword_3C730, type metadata accessor for CSLPRFDepthAutoLaunchThreshold);
}

uint64_t sub_24A5C()
{
  return sub_278C0();
}

uint64_t sub_24A7C()
{
  return sub_278D0();
}

uint64_t sub_24A9C()
{
  return sub_278E0();
}

uint64_t sub_24B00()
{
  return 0x696E556874706564;
}

uint64_t sub_24B4C()
{
  sub_2528C((unint64_t *)&unk_3E330);

  return sub_27750();
}

uint64_t sub_24BB4()
{
  sub_2528C((unint64_t *)&unk_3E330);

  return sub_27760();
}

uint64_t sub_24C1C@<X0>(uint64_t a1@<X8>)
{
  return sub_234BC(*(void **)(v1 + 24), a1);
}

uint64_t _s25DepthAutoLaunchAttributesVMa()
{
  uint64_t result = qword_3E350;
  if (!qword_3E350) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6344(&qword_3C768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D20()
{
  return 8;
}

uint64_t sub_24D2C()
{
  return swift_release();
}

uint64_t sub_24D34(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24D40(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_24D4C()
{
  unint64_t result = qword_3E340;
  if (!qword_3E340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E340);
  }
  return result;
}

unint64_t sub_24DA4()
{
  unint64_t result = qword_3C780;
  if (!qword_3C780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3C780);
  }
  return result;
}

uint64_t sub_24DF8()
{
  return 8;
}

ValueMetadata *type metadata accessor for DepthUnitAttribute()
{
  return &type metadata for DepthUnitAttribute;
}

uint64_t sub_24E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_24E80(uint64_t a1)
{
  uint64_t v2 = sub_27780();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_24EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_25010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_25074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_25088);
}

uint64_t sub_25088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_250F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_25108);
}

uint64_t sub_25108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27780();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_25178()
{
  uint64_t result = sub_27780();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_25218()
{
  return &protocol witness table for Bool;
}

uint64_t sub_25224()
{
  return sub_2528C(&qword_3E660);
}

uint64_t sub_25258()
{
  return sub_2528C(qword_3E668);
}

uint64_t sub_2528C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s25DepthAutoLaunchAttributesVMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252D0()
{
  unint64_t result = qword_3E6F0;
  if (!qword_3E6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E6F0);
  }
  return result;
}

HKQuantityType sub_25334()
{
  sub_2765C(0, &qword_3C978);
  result.super.super.super.Class isa = sub_28140(HKQuantityTypeIdentifierUnderwaterDepth).super.super.super.isa;
  qword_3E708 = (uint64_t)result.super.super.super.isa;
  return result;
}

uint64_t property wrapper backing initializer of DepthUnitPreferenceStore.preferredUnit(uint64_t a1)
{
  uint64_t v2 = sub_27950();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_279F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t DepthUnitPreferenceStore.preferredUnit.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_27A30();
  swift_release();

  return swift_release();
}

uint64_t sub_254F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 136))();
}

uint64_t sub_2553C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27950();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 144))(v6);
}

uint64_t DepthUnitPreferenceStore.preferredUnit.setter(uint64_t a1)
{
  uint64_t v2 = sub_27950();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  swift_retain();
  sub_27A40();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*DepthUnitPreferenceStore.preferredUnit.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_27A20();
  return sub_9048;
}

uint64_t DepthUnitPreferenceStore.$preferredUnit.getter()
{
  return swift_endAccess();
}

uint64_t DepthUnitPreferenceStore.$preferredUnit.setter(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3C828);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  sub_6344(&qword_3C820);
  sub_27A10();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*DepthUnitPreferenceStore.$preferredUnit.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_6344(&qword_3C828);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings24DepthUnitPreferenceStore__preferredUnit;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_6344(&qword_3C820);
  sub_27A00();
  swift_endAccess();
  return sub_9350;
}

id sub_25A7C()
{
  id v0 = [self standardUserDefaults];

  return v0;
}

uint64_t DepthUnitPreferenceStore.__allocating_init(userDefaults:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  DepthUnitPreferenceStore.init(userDefaults:)(a1);
  return v2;
}

id DepthUnitPreferenceStore.init(userDefaults:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_6344(&qword_3C830);
  __chkstk_darwin(v4 - 8);
  size_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_28180();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v36 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_6344(&qword_3C838);
  uint64_t v38 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v37 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_27950();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v33 - v17;
  *(void *)(v2 + 32) = 0;
  id v19 = [objc_allocWithZone((Class)HKHealthStore) init];
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v19;
  id v20 = a1;
  NSString v21 = sub_28000();
  id v34 = v20;
  id v22 = [v20 stringForKey:v21];

  uint64_t v39 = v10;
  if (v22)
  {
    sub_28010();

    NSString v23 = sub_28000();
    swift_bridgeObjectRelease();
    id v24 = [self unitFromString:v23];

LABEL_6:
    sub_260F4((uint64_t)v18);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    sub_279F0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    swift_endAccess();
    id v26 = [self defaultCenter];
    id v27 = *(id *)(v2 + 24);
    sub_28190();

    sub_2765C(0, &qword_3C840);
    id v40 = (id)sub_28160();
    uint64_t v28 = sub_28150();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 1, 1, v28);
    sub_27700(&qword_3C848, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
    sub_26480(&qword_3C850, &qword_3C840);
    uint64_t v29 = v36;
    uint64_t v30 = v37;
    sub_27A60();
    sub_264C4((uint64_t)v6);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v29);
    swift_allocObject();
    swift_weakInit();
    sub_6E4C(&qword_3C858, &qword_3C838);
    uint64_t v31 = v39;
    uint64_t v32 = sub_27A70();
    swift_release();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v30, v31);
    *(void *)(v2 + 32) = v32;
    swift_release();
    sub_265B4();

    return (id)v2;
  }
  if (qword_3E700 != -1) {
    swift_once();
  }
  id result = (id)_HKGenerateDefaultUnitForQuantityType();
  id v24 = result;
  if (result) {
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_260F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_27980();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  id v9 = [v8 footUnit];
  sub_2765C(0, &qword_3C988);
  char v10 = sub_281B0();

  if (v10)
  {
    uint64_t v11 = (unsigned int *)&enum case for DepthUnit.feet(_:);
LABEL_5:
    uint64_t v14 = *v11;
    uint64_t v15 = sub_27950();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104);
    return v16(a1, v14, v15);
  }
  id v12 = [v8 meterUnit];
  char v13 = sub_281B0();

  if (v13)
  {
    uint64_t v11 = (unsigned int *)&enum case for DepthUnit.meters(_:);
    goto LABEL_5;
  }
  sub_27970();
  uint64_t v18 = v2;
  id v19 = sub_27960();
  os_log_type_t v20 = sub_28120();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v27 = v5;
    NSString v21 = (uint8_t *)swift_slowAlloc();
    id v22 = (void *)swift_slowAlloc();
    uint64_t v28 = a1;
    uint64_t v29 = v18;
    id v26 = v21;
    *(_DWORD *)NSString v21 = 138543362;
    NSString v23 = v18;
    uint64_t v5 = v27;
    a1 = v28;
    sub_281C0();
    *id v22 = v18;

    _os_log_impl(&dword_0, v19, v20, "Unknown depth unit %{public}@, defaulting to .meters", v26, 0xCu);
    sub_6344((uint64_t *)&unk_3C9B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v19 = v18;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v24 = enum case for DepthUnit.meters(_:);
  uint64_t v25 = sub_27950();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(a1, v24, v25);
}

uint64_t sub_26480(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2765C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_264C4(uint64_t a1)
{
  uint64_t v2 = sub_6344(&qword_3C830);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_26524()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2655C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_265B4();
    return swift_release();
  }
  return result;
}

void sub_265B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)v0[3];
  sub_6344(&qword_3BE30);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2B4B0;
  if (qword_3E700 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_3E708;
  *(void *)(inited + 32) = qword_3E708;
  aBlock[0] = inited;
  sub_28070();
  if (inited >> 62)
  {
    id v8 = v5;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_282E0();
    swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (aBlock[0] & 0xFFFFFFFFFFFFFF8));
  id v7 = v5;
  if (v6) {
LABEL_5:
  }
    sub_272A8(inited);
LABEL_7:
  swift_bridgeObjectRelease();
  sub_2765C(0, &qword_3C978);
  sub_26480(&qword_3C980, &qword_3C978);
  Class isa = sub_280C0().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = v2;
  aBlock[4] = sub_2763C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_26C38;
  aBlock[3] = &unk_36F30;
  id v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v3 preferredUnitsForQuantityTypes:isa completion:v12];
  _Block_release(v12);
}

void sub_26814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_27F70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_27F90();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_3E700 != -1) {
    swift_once();
  }
  id v12 = (id)qword_3E708;
  char v13 = sub_26B60(v12, a1);

  if (v13)
  {
    sub_2765C(0, &qword_3C840);
    uint64_t v20 = sub_28160();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a2;
    *(void *)(v14 + 24) = v13;
    aBlock[4] = sub_276D8;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_7040;
    aBlock[3] = &unk_36F80;
    uint64_t v15 = _Block_copy(aBlock);
    uint64_t v19 = v8;
    uint64_t v16 = v15;
    swift_retain();
    id v17 = v13;
    swift_release();
    sub_27F80();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_27700(&qword_3C990, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_6344(&qword_3C998);
    sub_6E4C(&qword_3C9A0, &qword_3C998);
    sub_28200();
    uint64_t v18 = (void *)v20;
    sub_28170();
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  }
}

void *sub_26B60(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_27148((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_282B0();

  if (!v4) {
    return 0;
  }
  sub_2765C(0, &qword_3C988);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

void sub_26C38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_2765C(0, &qword_3C978);
  sub_2765C(0, &qword_3C988);
  sub_26480(&qword_3C980, &qword_3C978);
  uint64_t v5 = sub_27FA0();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_26D48(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_27950();
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = (void *)v2[2];
  NSString v8 = [a1 unitString];
  if (!v8)
  {
    sub_28010();
    NSString v8 = sub_28000();
    swift_bridgeObjectRelease();
  }
  NSString v9 = sub_28000();
  [v7 setObject:v8 forKey:v9];

  sub_260F4((uint64_t)v6);
  return (*(uint64_t (**)(char *))(*v2 + 144))(v6);
}

uint64_t DepthUnitPreferenceStore.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings24DepthUnitPreferenceStore__preferredUnit;
  uint64_t v2 = sub_6344(&qword_3C820);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DepthUnitPreferenceStore.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC27CompanionAutoLaunchSettings24DepthUnitPreferenceStore__preferredUnit;
  uint64_t v2 = sub_6344(&qword_3C820);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_26FB0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for DepthUnitPreferenceStore();
  uint64_t result = sub_279C0();
  *a1 = result;
  return result;
}

uint64_t sub_26FF0()
{
  return type metadata accessor for DepthUnitPreferenceStore();
}

uint64_t type metadata accessor for DepthUnitPreferenceStore()
{
  uint64_t result = qword_3E7B0;
  if (!qword_3E7B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_27044()
{
  sub_270F0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_270F0()
{
  if (!qword_3C888)
  {
    sub_27950();
    unint64_t v0 = sub_27A50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3C888);
    }
  }
}

unint64_t sub_27148(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_281A0(*(void *)(v2 + 40));

  return sub_2718C(a1, v4);
}

unint64_t sub_2718C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_2765C(0, &qword_3C978);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_281B0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_281B0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

void sub_272A8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_282E0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_6344(&qword_3C9A8);
      uint64_t v3 = (void *)sub_28210();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_282E0();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  char v7 = (char *)(v3 + 7);
  uint64_t v43 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = sub_28230();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = sub_281A0(v3[5]);
        uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)&v7[8 * v15] = v17 | v16;
        *(void *)(v3[6] + 8 * v14) = v11;
        uint64_t v23 = v3[2];
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        v3[2] = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_2765C(0, &qword_3C978);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = sub_281B0();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = sub_281B0();

          if (v22) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v41 = a1 + 32;
  uint64_t v42 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (v25 != v42)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(v41 + 8 * v25);
    Swift::Int v28 = sub_281A0(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_2765C(0, &qword_3C978);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_281B0();

      if (v35)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = ~v29;
      while (1)
      {
        unint64_t v30 = (v30 + 1) & v36;
        unint64_t v31 = v30 >> 6;
        uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
        uint64_t v33 = 1 << v30;
        if ((v32 & (1 << v30)) == 0) {
          break;
        }
        id v37 = *(id *)(v3[6] + 8 * v30);
        char v38 = sub_281B0();

        if (v38) {
          goto LABEL_24;
        }
      }
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_27604()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_2763C(uint64_t a1)
{
  sub_26814(a1, *(void *)(v1 + 16));
}

uint64_t sub_27644(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_27654()
{
  return swift_release();
}

uint64_t sub_2765C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_27698()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_276D8()
{
  return sub_26D48(*(void **)(v0 + 24));
}

uint64_t sub_27700(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_27750()
{
  return static AttributeScope.decodingConfiguration.getter();
}

uint64_t sub_27760()
{
  return static AttributeScope.encodingConfiguration.getter();
}

uint64_t sub_27770()
{
  return AttributeScopes.SwiftUIAttributes.textScale.getter();
}

uint64_t sub_27780()
{
  return type metadata accessor for AttributeScopes.SwiftUIAttributes();
}

uint64_t sub_27790()
{
  return AttributedString.Runs.Run.subscript.getter();
}

uint64_t sub_277A0()
{
  return AttributedString.Runs.Run.range.getter();
}

uint64_t sub_277B0()
{
  return type metadata accessor for AttributedString.Runs.Run();
}

uint64_t sub_277C0()
{
  return type metadata accessor for AttributedString.Runs.Index();
}

uint64_t sub_277D0()
{
  return type metadata accessor for AttributedString.Runs();
}

uint64_t sub_277E0()
{
  return AttributedString.runs.getter();
}

uint64_t sub_277F0()
{
  return AttributedString.init<A>(localized:including:)();
}

uint64_t sub_27800()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_27810()
{
  return AttributedString.subscript.modify();
}

uint64_t sub_27820(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_27830()
{
  return static AttributedStringKey.runBoundaries.getter();
}

uint64_t sub_27840()
{
  return static AttributedStringKey.inheritedByAddedText.getter();
}

uint64_t sub_27850()
{
  return static AttributedStringKey.invalidationConditions.getter();
}

uint64_t sub_27860()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t sub_27870()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_27890()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_278A0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_278B0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_278C0()
{
  return static DecodableAttributedStringKey<>.decode(from:)();
}

uint64_t sub_278D0()
{
  return static EncodableAttributedStringKey<>.encode(_:to:)();
}

uint64_t sub_278E0()
{
  return static MarkdownDecodableAttributedStringKey<>.decodeMarkdown(from:)();
}

uint64_t sub_278F0()
{
  return static MarkdownDecodableAttributedStringKey.markdownName.getter();
}

uint64_t sub_27900()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_27910()
{
  return UUID.init()();
}

uint64_t sub_27920()
{
  return type metadata accessor for UUID();
}

uint64_t sub_27930()
{
  return static Locale.current.getter();
}

uint64_t sub_27940()
{
  return type metadata accessor for Locale();
}

uint64_t sub_27950()
{
  return type metadata accessor for DepthUnit();
}

uint64_t sub_27960()
{
  return Logger.logObject.getter();
}

uint64_t sub_27970()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_27980()
{
  return type metadata accessor for Logger();
}

uint64_t sub_27990()
{
  return Logger.init(_:)();
}

uint64_t sub_279A0()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_279B0()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_279C0()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_279D0()
{
}

uint64_t sub_279E0()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t sub_279F0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_27A00()
{
  return Published.projectedValue.getter();
}

uint64_t sub_27A10()
{
  return Published.projectedValue.setter();
}

uint64_t sub_27A20()
{
  return static Published.subscript.modify();
}

uint64_t sub_27A30()
{
  return static Published.subscript.getter();
}

uint64_t sub_27A40()
{
  return static Published.subscript.setter();
}

uint64_t sub_27A50()
{
  return type metadata accessor for Published();
}

uint64_t sub_27A60()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_27A70()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_27A80()
{
  return LabelGroup.init(content:)();
}

uint64_t sub_27A90()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_27AA0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_27AC0()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_27AD0()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_27AE0()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_27AF0()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_27B00()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_27B10()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_27B20()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_27B30()
{
  return EnvironmentObject.error()();
}

uint64_t sub_27B40()
{
  return EnvironmentObject.init()();
}

uint64_t sub_27B50()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_27B60()
{
  return EnvironmentValues.openURL.setter();
}

uint64_t sub_27B70()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_27B80()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_27B90()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_27BA0()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_27BB0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_27BC0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_27BD0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_27BE0()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_27BF0()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_27C00()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_27C10()
{
  return static VerticalAlignment.center.getter();
}

void sub_27C20(Swift::String a1)
{
}

void sub_27C30(Swift::String a1)
{
}

uint64_t sub_27C40()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_27C50()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_27C60()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_27C70()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_27C80()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_27C90()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_27CA0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_27CB0()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_27CC0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_27CD0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_27CE0()
{
  return Form.init(content:)();
}

uint64_t sub_27CF0()
{
  return List<>.init(content:)();
}

uint64_t sub_27D00()
{
  return static Text.Scale.secondary.getter();
}

uint64_t sub_27D10()
{
  return type metadata accessor for Text.Scale();
}

uint64_t sub_27D20()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_27D30()
{
  return Text.init(_:)();
}

uint64_t sub_27D40()
{
  return Text.init<A>(_:)();
}

uint64_t sub_27D50()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_27D60()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_27D70()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_27D80()
{
  return View.labelsHidden()();
}

uint64_t sub_27D90()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_27DA0()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_27DB0()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_27DC0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_27DD0()
{
  return static Color.primary.getter();
}

uint64_t sub_27DE0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_27DF0()
{
  return Image.init(systemName:)();
}

uint64_t sub_27E00()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_27E10()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_27E20()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_27E30()
{
  return State.wrappedValue.getter();
}

uint64_t sub_27E40()
{
  return State.wrappedValue.setter();
}

uint64_t sub_27E50()
{
  return State.projectedValue.getter();
}

uint64_t sub_27E60()
{
  return Button.init(action:label:)();
}

uint64_t sub_27E70()
{
  return Picker.init(selection:label:content:)();
}

uint64_t sub_27E80()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_27E90()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_27EA0()
{
  return Toggle<>.init(_:isOn:)();
}

uint64_t sub_27EB0()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_27EC0()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_27ED0()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_27EE0()
{
  return Binding.animation(_:)();
}

uint64_t sub_27EF0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_27F00()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_27F10()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_27F20()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_27F30()
{
  return Section<>.init(content:)();
}

uint64_t sub_27F40()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_27F50()
{
  return static Alignment.center.getter();
}

uint64_t sub_27F60()
{
  return static Animation.default.getter();
}

uint64_t sub_27F70()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_27F80()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_27F90()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_27FA0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_27FB0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_27FC0()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_27FD0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_27FE0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_27FF0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_28000()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_28010()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_28020()
{
  return String.hash(into:)();
}

Swift::Int sub_28030()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_28040()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_28050()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_28060()
{
  return Array.description.getter();
}

uint64_t sub_28070()
{
  return specialized Array._endMutation()();
}

uint64_t sub_28080()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_28090()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_280A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_280B0()
{
  return Bool._bridgeToObjectiveC()();
}

NSSet sub_280C0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_280D0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_280E0()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_280F0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_28100()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_28110()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_28120()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_28130()
{
  return static os_log_type_t.fault.getter();
}

HKQuantityType sub_28140(HKQuantityTypeIdentifier a1)
{
  return HKQuantityType.init(_:)(a1);
}

uint64_t sub_28150()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_28160()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_28170()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_28180()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_28190()
{
  return NSNotificationCenter.publisher(for:object:)();
}

Swift::Int sub_281A0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_281B0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_281C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_281D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_281E0()
{
  return StringProtocol.localizedCompare<A>(_:)();
}

uint64_t sub_281F0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_28200()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_28210()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_28220()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_28230()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_28250()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_28260()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_28270()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_28280()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_28290()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_282A0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_282B0()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_282C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_282D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_282E0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_282F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_28310(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_28320()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_28330()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_28340()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_28350()
{
  return Error._code.getter();
}

uint64_t sub_28360()
{
  return Error._domain.getter();
}

uint64_t sub_28370()
{
  return Error._userInfo.getter();
}

uint64_t sub_28380()
{
  return Hasher.init(_seed:)();
}

void sub_28390(Swift::UInt a1)
{
}

Swift::Int sub_283A0()
{
  return Hasher._finalize()();
}

uint64_t BPSGetActiveSetupCompletedDevice()
{
  return _BPSGetActiveSetupCompletedDevice();
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

uint64_t _HKGenerateDefaultUnitForQuantityType()
{
  return __HKGenerateDefaultUnitForQuantityType();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

id objc_msgSend__setApplications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setApplications:");
}

id objc_msgSend__withLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withLock:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
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

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIDsForActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIDsForActionType:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 createConfiguration];
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

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
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

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_preferredVersion(void *a1, const char *a2, ...)
{
  return _[a1 preferredVersion];
}

id objc_msgSend_privacyDuringAlwaysOnForLiveActivities(void *a1, const char *a2, ...)
{
  return _[a1 privacyDuringAlwaysOnForLiveActivities];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setDepthAutoLaunchVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDepthAutoLaunchVersion:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setIsTinker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTinker:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSupportsDepth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsDepth:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
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

id objc_msgSend_stingSettingsModel(void *a1, const char *a2, ...)
{
  return _[a1 stingSettingsModel];
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_updateSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsWithBlock:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}