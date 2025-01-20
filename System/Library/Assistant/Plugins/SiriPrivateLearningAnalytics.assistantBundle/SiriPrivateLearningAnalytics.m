uint64_t sub_20A8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v25 = a1;
  v5 = sub_3640();
  v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_3770();
  v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_8268 != -1) {
    swift_once();
  }
  v13 = sub_3820();
  sub_2E0C(v13, (uint64_t)qword_8270);
  v14 = sub_3800();
  v15 = sub_3840();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v24 = v10;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "Running SiriPrivateLearningAnalytics maintenance plugin", v16, 2u);
    v10 = v24;
    swift_slowDealloc();
  }

  if (qword_8248 != -1) {
    swift_once();
  }
  v17 = sub_37A0();
  v18 = sub_2E0C(v17, (uint64_t)qword_8250);
  sub_3760();
  v19 = sub_2E44(v18, "runMaintenance", 14, 2, (uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for PrivateLearningPluginRunContext.maintenance(_:), v5);
  v20 = (void *)swift_allocObject();
  v21 = v25;
  v20[2] = v19;
  v20[3] = v21;
  v20[4] = a2;
  v20[5] = v3;
  swift_retain();
  sub_31DC(v21);
  v22 = v3;
  sub_3650();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2414(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v60 = a2;
  uint64_t v58 = sub_37B0();
  uint64_t v61 = *(void *)(v58 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v57 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3770();
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v59 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v62 = (char *)&v51 - v11;
  uint64_t v73 = sub_3630();
  uint64_t v12 = *(void *)(v73 - 8);
  uint64_t v13 = __chkstk_darwin(v73);
  v72 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v71 = (char *)&v51 - v15;
  uint64_t v16 = sub_3690();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(char **)(a1 + 16);
  if (v20)
  {
    uint64_t v54 = v8;
    uint64_t v55 = a4;
    v56 = a3;
    v22 = *(void (**)(char *, uint64_t (*)(void), uint64_t))(v17 + 16);
    uint64_t v21 = v17 + 16;
    v70 = v22;
    a3 = (uint64_t (*)(void))(a1
                                        + ((*(unsigned __int8 *)(v21 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 64)));
    uint64_t v65 = *(void *)(v21 + 56);
    unsigned int v69 = enum case for PrivateLearningPluginResult.success(_:);
    v67 = (void (**)(uint64_t, uint64_t))(v12 + 8);
    v68 = (void (**)(uint64_t, void, uint64_t))(v12 + 104);
    v64 = (void (**)(char *, uint64_t))(v21 - 8);
    uint64_t v53 = a1;
    swift_bridgeObjectRetain();
    v23 = 0;
    v52 = v20;
    v24 = v20;
    uint64_t v66 = v21;
    v20 = v71;
    uint64_t v8 = (uint64_t)v72;
    while (1)
    {
      v70(v19, a3, v16);
      v25 = v19;
      sub_3680();
      uint64_t v26 = v16;
      uint64_t v27 = v73;
      (*v68)(v8, v69, v73);
      int v74 = sub_3620();
      v28 = *v67;
      (*v67)(v8, v27);
      v28((uint64_t)v20, v27);
      uint64_t v29 = (v74 & 1) == 0;
      BOOL v30 = __OFADD__(v23, v29);
      v23 += v29;
      if (v30) {
        break;
      }
      (*v64)(v19, v26);
      a3 = (uint64_t (*)(void))((char *)a3 + v65);
      --v24;
      uint64_t v16 = v26;
      if (!v24)
      {
        swift_bridgeObjectRelease();
        a3 = v56;
        uint64_t v8 = v54;
        v20 = v52;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_23:
    swift_once();
    goto LABEL_8;
  }
  v23 = 0;
LABEL_7:
  v25 = v62;
  if (qword_8268 != -1) {
    goto LABEL_23;
  }
LABEL_8:
  uint64_t v31 = sub_3820();
  sub_2E0C(v31, (uint64_t)qword_8270);
  swift_bridgeObjectRetain();
  v32 = sub_3800();
  os_log_type_t v33 = sub_3840();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 134218240;
    v75 = v20;
    sub_3890();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2048;
    v75 = v23;
    sub_3890();
    _os_log_impl(&dword_0, v32, v33, "SiriPrivateLearningAnalytics maintenance plugin run %ld plugin(s) with %ld failure(s)", (uint8_t *)v34, 0x16u);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v35 = v61;
  sub_31EC();
  if (qword_8248 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_37A0();
  sub_2E0C(v36, (uint64_t)qword_8250);
  v37 = sub_3790();
  sub_37C0();
  os_signpost_type_t v38 = sub_3860();
  if ((sub_3880() & 1) == 0)
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v25, v8);
    if (!a3) {
      return result;
    }
    return a3(result);
  }
  swift_retain();
  v39 = v57;
  sub_37F0();
  v40 = v39;
  swift_release();
  v41 = v39;
  uint64_t v42 = v58;
  if ((*(unsigned int (**)(char *, uint64_t))(v35 + 88))(v41, v58) == enum case for OSSignpostError.doubleEnd(_:))
  {
    v43 = "[Error] Interval already ended";
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v40, v42);
    v43 = "";
  }
  uint64_t v45 = v63;
  v46 = v59;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v59, v25, v8);
  uint64_t v47 = v8;
  v48 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v48 = 0;
  os_signpost_id_t v49 = sub_3750();
  _os_signpost_emit_with_name_impl(&dword_0, v37, v38, v49, "runMaintenance", v43, v48, 2u);
  swift_slowDealloc();

  v50 = *(void (**)(char *, uint64_t))(v45 + 8);
  v50(v25, v47);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v50)(v46, v47);
  if (a3) {
    return a3(result);
  }
  return result;
}

id sub_2BE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsServiceMaintenance();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnalyticsServiceMaintenance()
{
  return self;
}

uint64_t sub_2C50()
{
  uint64_t v0 = sub_3820();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_37A0();
  sub_3564(v4, qword_8250);
  sub_2E0C(v4, (uint64_t)qword_8250);
  if (qword_8268 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2E0C(v0, (uint64_t)qword_8270);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_3780();
}

uint64_t sub_2D8C()
{
  uint64_t v0 = sub_3820();
  sub_3564(v0, qword_8270);
  sub_2E0C(v0, (uint64_t)qword_8270);
  return sub_3810();
}

uint64_t sub_2E0C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2E44(uint64_t a1, const char *a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v8 = sub_3770();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [self standardUserDefaults];
  NSString v13 = sub_3830();
  unsigned int v14 = [v12 BOOLForKey:v13];

  uint64_t v15 = sub_3790();
  int v16 = sub_3870();
  uint64_t result = sub_3880();
  if (v14)
  {
    if (result)
    {
      int v25 = v16;
      if (a4)
      {
        if (!((unint64_t)a2 >> 32))
        {
          if (a2 >> 11 == 27)
          {
LABEL_29:
            __break(1u);
            goto LABEL_30;
          }
          if (a2 >> 16 <= 0x10)
          {
            uint64_t v18 = a5;
            a2 = &v26;
            goto LABEL_15;
          }
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      if (a2)
      {
        uint64_t v18 = a5;
LABEL_15:
        v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
        v19(v11, v18, v8);
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        os_signpost_id_t v21 = sub_3750();
        os_signpost_type_t v22 = v25;
        v23 = "";
LABEL_21:
        _os_signpost_emit_with_name_impl(&dword_0, v15, v22, v21, a2, v23, v20, 2u);
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        v19(v11, v18, v8);
        goto LABEL_22;
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
LABEL_10:

    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a5, v8);
LABEL_22:
    sub_37E0();
    swift_allocObject();
    return sub_37D0();
  }
  if ((result & 1) == 0) {
    goto LABEL_10;
  }
  int v25 = v16;
  if ((a4 & 1) == 0)
  {
    if (!a2) {
      goto LABEL_24;
    }
    uint64_t v18 = a5;
LABEL_20:
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v19(v11, v18, v8);
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    os_signpost_id_t v21 = sub_3750();
    os_signpost_type_t v22 = v25;
    v23 = "enableTelemetry=YES";
    goto LABEL_21;
  }
  if ((unint64_t)a2 >> 32)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a2 >> 11 != 27)
  {
    if (a2 >> 16 > 0x10)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    uint64_t v18 = a5;
    a2 = &v27;
    goto LABEL_20;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_3180()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_31D0(uint64_t a1)
{
  return sub_2414(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_31DC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_31EC()
{
  sub_3720();
  swift_allocObject();
  sub_3710();
  sub_36E0();
  uint64_t v0 = sub_36B0();
  swift_allocObject();
  uint64_t v1 = sub_36C0();
  if (v1)
  {
    uint64_t v17 = v0;
    uint64_t v18 = &protocol witness table for InferredGroundTruthStoreCoreData;
    v16[0] = v1;
    swift_retain();
    sub_3700();
    sub_3514((uint64_t)v16);
    sub_36A0();
    swift_release();
  }
  else
  {
    if (qword_8268 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_3820();
    sub_2E0C(v2, (uint64_t)qword_8270);
    v3 = sub_3800();
    os_log_type_t v4 = sub_3850();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v3, v4, "SiriPrivateLearningAnalytics maintenance couldn't check ground truth store size", v5, 2u);
      swift_slowDealloc();
    }

    v6 = sub_3800();
    os_log_type_t v7 = sub_3850();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, v7, "SiriPrivateLearningAnalytics maintenance could not load ground truth store to evaluate contact references", v8, 2u);
      swift_slowDealloc();
    }
  }
  sub_36D0();
  uint64_t v9 = sub_3730();
  swift_allocObject();
  uint64_t v10 = sub_3740();
  if (v10)
  {
    uint64_t v17 = v9;
    uint64_t v18 = &protocol witness table for PICSStoreCoreData;
    v16[0] = v10;
    swift_retain();
    sub_36F0();
    swift_release();
    swift_release();
    return sub_3514((uint64_t)v16);
  }
  else
  {
    if (qword_8268 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_3820();
    sub_2E0C(v12, (uint64_t)qword_8270);
    NSString v13 = sub_3800();
    os_log_type_t v14 = sub_3850();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "SiriPrivateLearningAnalytics maintenance could not load pics store to evaluate contact references", v15, 2u);
      swift_slowDealloc();
    }

    return swift_release();
  }
}

uint64_t sub_3514(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_3564(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_35C8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_35D8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_3610()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_3620()
{
  return static PrivateLearningPluginResult.== infix(_:_:)();
}

uint64_t sub_3630()
{
  return type metadata accessor for PrivateLearningPluginResult();
}

uint64_t sub_3640()
{
  return type metadata accessor for PrivateLearningPluginRunContext();
}

uint64_t sub_3650()
{
  return dispatch thunk of PluginScheduler.runAllNow(context:completion:)();
}

uint64_t sub_3660()
{
  return PluginScheduler.__allocating_init()();
}

uint64_t sub_3670()
{
  return type metadata accessor for PluginScheduler();
}

uint64_t sub_3680()
{
  return PluginSchedulerRunResult.pluginResult.getter();
}

uint64_t sub_3690()
{
  return type metadata accessor for PluginSchedulerRunResult();
}

uint64_t sub_36A0()
{
  return dispatch thunk of InferredGroundTruthStoreCoreData.deleteOldestRecordsIfNeeded()();
}

uint64_t sub_36B0()
{
  return type metadata accessor for InferredGroundTruthStoreCoreData();
}

uint64_t sub_36C0()
{
  return InferredGroundTruthStoreCoreData.init(_:)();
}

uint64_t sub_36D0()
{
  return static Config.PICSDBLocation.getter();
}

uint64_t sub_36E0()
{
  return static Config.groundTruthDBLocation.getter();
}

uint64_t sub_36F0()
{
  return dispatch thunk of InferenceDataCompliance.deleteExpiredContactSuggestions(in:)();
}

uint64_t sub_3700()
{
  return dispatch thunk of InferenceDataCompliance.deleteExpiredContactGroundTruthReferences(in:)();
}

uint64_t sub_3710()
{
  return InferenceDataCompliance.init()();
}

uint64_t sub_3720()
{
  return type metadata accessor for InferenceDataCompliance();
}

uint64_t sub_3730()
{
  return type metadata accessor for PICSStoreCoreDataWithMigrations();
}

uint64_t sub_3740()
{
  return PICSStoreCoreDataWithMigrations.init(_:)();
}

uint64_t sub_3750()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_3760()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_3770()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_3780()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_3790()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_37A0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_37B0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_37C0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_37D0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_37E0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_37F0()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_3800()
{
  return Logger.logObject.getter();
}

uint64_t sub_3810()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_3820()
{
  return type metadata accessor for Logger();
}

NSString sub_3830()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_3840()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_3850()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_3860()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_3870()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_3880()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_3890()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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