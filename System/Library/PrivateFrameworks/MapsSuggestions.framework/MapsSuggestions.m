uint64_t variable initialization expression of MapsSuggestionsWeatherFeeler._weatherConditionsDataProvider()
{
  return 0;
}

uint64_t sub_10000494C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id MapsSuggestionsWeatherFeeler.__allocating_init(delegate:locationUpdater:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return MapsSuggestionsWeatherFeeler.init(delegate:locationUpdater:)(a1, a2);
}

id MapsSuggestionsWeatherFeeler.init(delegate:locationUpdater:)(uint64_t a1, uint64_t a2)
{
  p_superclass = MapsSuggestionsGeoServicesFeeler.superclass;
  *(void *)&v2[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack] = 0;
  id v5 = MapsSuggestionsGeoServicesFeeler.superclass;
  *(void *)&v2[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherConditionsDataProvider] = 0;
  v6 = &v2[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherDataModel];
  uint64_t v7 = sub_10000494C(&qword_100080F50);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)&v2[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__locationUpdater] = 0;
  *(void *)&v2[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation] = 0;
  v2[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active] = 1;
  id v8 = objc_allocWithZone((Class)MapsSuggestionsQueue);
  v9 = v2;
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v8 initSerialQueueWithName:v10];

  *(void *)&v9[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue] = v11;
  GEOConfigGetDouble();
  *(void *)&v9[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__distanceThreshold] = v12;
  GEOConfigGetDouble();
  v13 = &v9[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__expireTimeDefault];
  *(void *)v13 = v14;
  v13[8] = 0;
  *(void *)&v9[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__triggers] = &_swiftEmptyArrayStorage;

  v15 = (objc_class *)type metadata accessor for MapsSuggestionsWeatherFeeler(0);
  NSString v16 = [(id)swift_getObjCClassFromMetadata() description];
  if (!v16)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  v38.receiver = v9;
  v38.super_class = v15;
  id v17 = objc_msgSendSuper2(&v38, "initWithDelegate:name:", a1, v16);
  v18 = (char *)v17;

  if (v18)
  {

    v19 = &v18[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__triggers];
    swift_beginAccess();
    if (*(void *)v19 >> 62) {
      goto LABEL_17;
    }
    v20 = MapsSuggestionsGeoServicesFeeler.superclass;
    p_superclass = MapsSuggestionsGeoServicesFeeler.superclass;
    uint64_t v21 = *(void *)((*(void *)v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    for (i = v18; v21; p_superclass = v5)
    {
      unint64_t v23 = 0;
      while (1)
      {
        swift_beginAccess();
        uint64_t v24 = *(void *)v19;
        if ((*(void *)v19 & 0xC000000000000001) != 0)
        {
          id v5 = (__objc2_class **)specialized _ArrayBuffer._getElementSlowPath(_:)();
          goto LABEL_11;
        }
        if ((v23 & 0x8000000000000000) != 0) {
          break;
        }
        if (v23 >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_16;
        }
        id v5 = *(__objc2_class ***)(v24 + 8 * v23 + 32);
        swift_unknownObjectRetain();
LABEL_11:
        ++v23;
        swift_endAccess();
        [v5 registerObserver:v18];
        swift_unknownObjectRelease();
        if (v21 == v23) {
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      v25 = v18;
      swift_bridgeObjectRetain();
      uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v21 < 0) {
        __break(1u);
      }
      v20 = p_superclass;
    }
LABEL_20:
    if (a2)
    {
      *(void *)&v18[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__locationUpdater] = a2;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
    }
    v26 = (__objc2_class *)[objc_allocWithZone((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:7];
    v27 = v20[491];
    v28 = *(__objc2_class **)((char *)&v27->isa + (void)v18);
    *(__objc2_class **)((char *)&v27->isa + (void)v18) = v26;

    v29 = *(void **)&v18[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue];
    double v30 = *(double *)&v18[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__distanceThreshold];
    id v31 = objc_allocWithZone((Class)type metadata accessor for MapsSuggestionsWeatherConditionsProvider(0));
    id v32 = v29;
    v33 = (__objc2_class *)sub_10000D064(v32, v30);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    v34 = p_superclass[492];
    v35 = *(__objc2_class **)((char *)&v34->isa + (void)v18);
    *(__objc2_class **)((char *)&v34->isa + (void)v18) = v33;
  }
  else
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0;
  }
  return v17;
}

uint64_t type metadata accessor for MapsSuggestionsWeatherFeeler(uint64_t a1)
{
  return sub_100004E68(a1, (uint64_t *)&unk_100081DE0);
}

id MapsSuggestionsWeatherConditionsProvider.__allocating_init(queue:locationRange:)(void *a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_10000D064(a1, a2);

  return v6;
}

uint64_t type metadata accessor for MapsSuggestionsWeatherConditionsProvider(uint64_t a1)
{
  return sub_100004E68(a1, (uint64_t *)&unk_100081E00);
}

uint64_t sub_100004E68(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100004EF0(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherConditionsDataProvider] = 0;
  v3 = &v1[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherDataModel];
  uint64_t v4 = sub_10000494C(&qword_100080F50);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)&v1[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__locationUpdater] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation] = 0;
  id v5 = objc_allocWithZone((Class)MapsSuggestionsQueue);
  id v6 = v1;
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v5 initSerialQueueWithName:v7];

  *(void *)&v6[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue] = v8;
  v6[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active] = 1;
  GEOConfigGetDouble();
  *(void *)&v6[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__distanceThreshold] = v9;
  GEOConfigGetDouble();
  NSString v10 = &v6[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__expireTimeDefault];
  *(void *)NSString v10 = v11;
  v10[8] = 0;
  *(void *)&v6[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__triggers] = &_swiftEmptyArrayStorage;

  uint64_t v12 = (objc_class *)type metadata accessor for MapsSuggestionsWeatherFeeler(0);
  NSString v13 = [(id)swift_getObjCClassFromMetadata() description];
  if (!v13)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  v17.receiver = v6;
  v17.super_class = v12;
  id v14 = objc_msgSendSuper2(&v17, "initWithDelegate:name:", a1, v13);
  swift_unknownObjectRelease();
  id v15 = v14;

  if (v15) {
  return v15;
  }
}

uint64_t static MapsSuggestionsWeatherFeeler.isEnabled()()
{
  return GEOConfigGetBOOL();
}

uint64_t MapsSuggestionsWeatherFeeler.canProduce(_:)(unint64_t a1)
{
  return (a1 < 0x1C) & (0xE0003C0u >> a1);
}

uint64_t MapsSuggestionsWeatherFeeler.disposition()()
{
  return 2;
}

Swift::Void __swiftcall MapsSuggestionsWeatherFeeler.didUpdate(_:)(CLLocation_optional a1)
{
  Class isa = a1.value.super.isa;
  if (![(id)type metadata accessor for MapsSuggestionsWeatherFeeler(0) isEnabled])
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000D1B8(v8, (uint64_t)qword_100081F58);
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(oslog, v9)) {
      goto LABEL_13;
    }
    NSString v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v10 = 0;
    uint64_t v11 = "WeatherFeeler is not enabled";
    goto LABEL_12;
  }
  if (isa)
  {
    v3 = *(void **)(v1 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    *(void *)(v5 + 24) = isa;
    aBlock[4] = sub_10000D268;
    aBlock[5] = v5;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000544C;
    aBlock[3] = &unk_100071098;
    id v6 = _Block_copy(aBlock);
    NSString v7 = isa;
    swift_release();
    [v3 asyncBlock:v6];
    _Block_release(v6);

    return;
  }
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_10000D1B8(v12, (uint64_t)qword_100081F58);
  oslog = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v9))
  {
    NSString v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v10 = 0;
    uint64_t v11 = "We have no valid location";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, v11, v10, 2u);
    swift_slowDealloc();
  }
LABEL_13:
}

uint64_t sub_10000544C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall MapsSuggestionsWeatherFeeler.didLoseLocationPermission()()
{
  uint64_t v1 = v0;
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000D1B8(v2, (uint64_t)qword_100081F58);
  v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Lost Location Permission", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = *(void **)(v1 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = sub_10000D964;
  v9[5] = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10000544C;
  v9[3] = &unk_1000710C0;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  [v6 asyncBlock:v8];
  _Block_release(v8);
}

Swift::Bool __swiftcall MapsSuggestionsWeatherFeeler.updateSignals()()
{
  return sub_100005B2C((uint64_t)sub_10000D9C4, (uint64_t)&unk_1000710E8);
}

void sub_100005700()
{
  swift_beginAccess();
  Strong = (unsigned __int8 *)swift_unknownObjectWeakLoadStrong();
  if (Strong
    && (int v1 = Strong[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active], Strong, v1 == 1))
  {
    swift_beginAccess();
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    if (!v2) {
      return;
    }
    v3 = v2;
    os_log_type_t v4 = *(void **)(v2 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10[4] = sub_100010380;
    v10[5] = v5;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_10000544C;
    v10[3] = &unk_100071440;
    id v6 = _Block_copy(v10);
    swift_release();
    [v4 asyncBlock:v6];
    _Block_release(v6);
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_10000D1B8(v7, (uint64_t)qword_100081F58);
    v3 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v8, "Not continuing updateSignals. NOT active.", v9, 2u);
      swift_slowDealloc();
    }
  }
}

Swift::Bool __swiftcall MapsSuggestionsWeatherFeeler.startUpdatingSignals()()
{
  unsigned int v1 = [(id)type metadata accessor for MapsSuggestionsWeatherFeeler(0) isEnabled];
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10[4] = sub_10000D9CC;
    v10[5] = v3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_10000544C;
    v10[3] = &unk_100071110;
    os_log_type_t v4 = _Block_copy(v10);
    swift_release();
    [v2 asyncBlock:v4];
    _Block_release(v4);
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    sub_10000D1B8(v5, (uint64_t)qword_100081F58);
    id v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "MapsSuggestionsWeatherFeeler is not enabled", v8, 2u);
      swift_slowDealloc();
    }
  }
  return v1;
}

Swift::Bool __swiftcall MapsSuggestionsWeatherFeeler.stopUpdatingSignals()()
{
  return sub_100005B2C((uint64_t)sub_10000DCF0, (uint64_t)&unk_100071138);
}

uint64_t sub_100005B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = a1;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10000544C;
  v9[3] = a2;
  os_log_type_t v7 = _Block_copy(v9);
  swift_release();
  [v5 asyncBlock:v7];
  _Block_release(v7);
  return 1;
}

void sub_100005C0C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unsigned int v1 = Strong;
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_10000D1B8(v2, (uint64_t)qword_100081F58);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "stopUpdatingSignals", v5, 2u);
      swift_slowDealloc();
    }

    *((unsigned char *)&v1->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active) = 0;
    uint64_t v6 = *(Class *)((char *)&v1->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__locationUpdater);
    if (v6) {
      [v6 stopLocationUpdatesForDelegate:v1];
    }
    os_log_type_t v7 = *(char **)((char *)&v1->isa
                  + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherConditionsDataProvider);
    if (v7)
    {
      os_log_type_t v8 = *(void **)&v7[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers];
      os_log_type_t v9 = v7;
      [v8 unregisterObserver:v1 handler:0];
    }
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_10000D1B8(v10, (uint64_t)qword_100081F58);
    unsigned int v1 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v11, "strongSelf could not be initialized", v12, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100005E50(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v7 = *(void **)&a1[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue];
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12[4] = a3;
  v12[5] = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000544C;
  v12[3] = a4;
  os_log_type_t v9 = _Block_copy(v12);
  uint64_t v10 = a1;
  swift_release();
  [v7 asyncBlock:v9];
  _Block_release(v9);

  return 1;
}

void MapsSuggestionsWeatherFeeler.triggerFired(_:)()
{
  unsigned int v1 = *(void **)(v0 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4[4] = sub_10000DCF8;
  v4[5] = v2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_10000544C;
  v4[3] = &unk_100071160;
  uint64_t v3 = _Block_copy(v4);
  swift_release();
  [v1 asyncBlock:v3];
  _Block_release(v3);
}

void sub_100006028()
{
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000D1B8(v0, (uint64_t)qword_100081F58);
  unsigned int v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "TriggerFired, start updating", v3, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    [Strong startUpdatingSignals];
  }
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_10000494C(&qword_100081268);
    uint64_t v9 = String.init<A>(describing:)();
    sub_10000C9CC(v9, v10, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "hasStarted: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
}

uint64_t sub_100006378()
{
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000D1B8(v1, (uint64_t)qword_100081F58);
  os_log_type_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Checking if the feeler is allowed to update", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 1;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v5;
  v15[4] = sub_10000F830;
  v15[5] = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000544C;
  v15[3] = &unk_100071288;
  uint64_t v9 = _Block_copy(v15);
  swift_retain();
  swift_release();
  [v6 syncBlock:v9];
  _Block_release(v9);
  swift_beginAccess();
  if (*(unsigned char *)(v5 + 16) == 1)
  {
    unint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Ok to update", v12, 2u);
      swift_slowDealloc();
    }

    uint64_t v13 = *(unsigned __int8 *)(v5 + 16);
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_release();
  return v13;
}

void sub_100006608(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v133 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v129 = (char *)v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for WeatherMetadata();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v131 = v5;
  uint64_t v132 = v6;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000494C(&qword_1000811C0);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v130 = (uint64_t)v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v128 = (char *)v106 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)v106 - v14;
  __chkstk_darwin(v13);
  objc_super v17 = (char *)v106 - v16;
  uint64_t v18 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v18 - 8);
  v20 = (char *)v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (int *)sub_10000494C(&qword_100080F50);
  uint64_t v22 = *((void *)v21 - 1);
  uint64_t v23 = __chkstk_darwin(v21);
  v25 = (char *)v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v134 = (uint64_t)v106 - v26;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v28 = Strong;
    id v29 = (id)MapsSuggestionsCurrentBestLocation();
    if (!v29)
    {

      return;
    }
    v125 = v17;
    uint64_t v126 = v3;
    double v30 = (unsigned char *)(a2 + 16);
    id v31 = v29;
    GEOConfigGetDouble();
    double v33 = v32;
    id v127 = v31;
    [v31 speed];
    if (v33 < v34)
    {
      if (qword_100081D90 != -1) {
        swift_once();
      }
      uint64_t v35 = type metadata accessor for Logger();
      sub_10000D1B8(v35, (uint64_t)qword_100081F58);
      v36 = v127;
      v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = v30;
        uint64_t v40 = swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 134218240;
        [v36 speed];
        double v135 = v41;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        *(_WORD *)(v40 + 12) = 2048;
        double v135 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "speed thresholds crossed:%f. Our limit is: %f. Not requesting new weather update", (uint8_t *)v40, 0x16u);
        double v30 = v39;
        swift_slowDealloc();
        v42 = v36;
      }
      else
      {

        v42 = v28;
        v37 = v36;
        v28 = v36;
      }

LABEL_20:
      swift_beginAccess();
      *double v30 = 0;
      return;
    }
    v47 = *(Class *)((char *)&v28->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation);
    if (!v47)
    {

      return;
    }
    v123 = v30;
    uint64_t v48 = (uint64_t)v28 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherDataModel;
    swift_beginAccess();
    sub_1000103E4(v48, (uint64_t)v20, &qword_100080F70);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v22 + 48))(v20, 1, v21) == 1)
    {

      v49 = &qword_100080F70;
      uint64_t v50 = (uint64_t)v20;
      goto LABEL_17;
    }
    uint64_t v51 = v21[12];
    uint64_t v52 = v134;
    uint64_t v53 = v134 + v51;
    uint64_t v54 = v21[16];
    uint64_t v55 = v134 + v54;
    uint64_t v56 = v21[20];
    uint64_t v124 = v134 + v56;
    v119 = &v20[v51];
    v121 = &v20[v54];
    v120 = &v20[v56];
    uint64_t v57 = type metadata accessor for CurrentWeather();
    uint64_t v122 = *(void *)(v57 - 8);
    v58 = *(void (**)(uint64_t, char *))(v122 + 32);
    uint64_t v118 = v57;
    v58(v52, v20);
    uint64_t v117 = v53;
    sub_10000F838((uint64_t)v119, v53, &qword_1000811C8);
    uint64_t v59 = sub_10000494C(&qword_100080F80);
    uint64_t v60 = *(void *)(v59 - 8);
    v61 = *(void (**)(uint64_t, char *))(v60 + 32);
    v119 = (char *)v55;
    v62 = v121;
    v121 = (char *)v59;
    v61(v55, v62);
    sub_10000F838((uint64_t)v120, v124, &qword_1000811D0);
    id v63 = v47;
    id v64 = v127;
    [v127 distanceFromLocation:v63];
    if (v65 >= *(double *)((char *)&v28->isa
                          + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__distanceThreshold))
    {
      sub_100010388(v52, &qword_100080F50);

      return;
    }
    id v113 = v63;
    v120 = &v25[v21[12]];
    v66 = v120;
    uint64_t v67 = v21[16];
    uint64_t v116 = v60;
    v68 = &v25[v67];
    v115 = &v25[v67];
    v114 = &v25[v21[20]];
    uint64_t v69 = v122;
    v70 = *(void (**)(char *, uint64_t, uint64_t))(v122 + 16);
    uint64_t v71 = v52;
    uint64_t v72 = v118;
    uint64_t v112 = v122 + 16;
    v111 = v70;
    v70(v25, v71, v118);
    sub_1000103E4(v117, (uint64_t)v66, &qword_1000811C8);
    v73 = *(void (**)(char *, char *, char *))(v60 + 16);
    uint64_t v110 = v60 + 16;
    v109 = v73;
    v73(v68, v119, v121);
    uint64_t v74 = (uint64_t)v114;
    sub_1000103E4(v124, (uint64_t)v114, &qword_1000811D0);
    CurrentWeather.metadata.getter();
    v75 = *(void (**)(char *, uint64_t))(v69 + 8);
    uint64_t v122 = v69 + 8;
    v108 = v75;
    v75(v25, v72);
    uint64_t v76 = (uint64_t)v125;
    WeatherMetadata.expirationDate.getter();
    v77 = *(void (**)(char *, uint64_t))(v132 + 8);
    v132 += 8;
    v107 = v77;
    v77(v8, v131);
    uint64_t v78 = v133;
    v79 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v133 + 56);
    uint64_t v80 = v126;
    v106[1] = v133 + 56;
    v106[0] = v79;
    v79(v76, 0, 1, v126);
    sub_100010388(v74, &qword_1000811D0);
    v81 = *(char **)(v116 + 8);
    v82 = v115;
    v116 += 8;
    v115 = v81;
    ((void (*)(char *, char *))v81)(v82, v121);
    sub_100010388((uint64_t)v120, &qword_1000811C8);
    sub_1000103E4(v76, (uint64_t)v15, &qword_1000811C0);
    uint64_t v83 = v78;
    uint64_t v84 = v80;
    uint64_t v85 = v83 + 48;
    v120 = *(char **)(v83 + 48);
    LODWORD(v74) = ((uint64_t (*)(char *, uint64_t, uint64_t))v120)(v15, 1, v84);
    sub_100010388((uint64_t)v15, &qword_1000811C0);
    if (v74 == 1)
    {
      if (qword_100081D90 != -1) {
        swift_once();
      }
      v114 = (char *)v85;
      uint64_t v86 = type metadata accessor for Logger();
      sub_10000D1B8(v86, (uint64_t)qword_100081F58);
      v87 = Logger.logObject.getter();
      os_log_type_t v88 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v89 = 0;
        _os_log_impl((void *)&_mh_execute_header, v87, v88, "metadata.expirationDate is nil. Checking conditions time to form our own expiration time", v89, 2u);
        swift_slowDealloc();
      }

      uint64_t v90 = (uint64_t)&v25[v21[12]];
      v91 = &v25[v21[16]];
      uint64_t v92 = (uint64_t)&v25[v21[20]];
      uint64_t v93 = v118;
      v111(v25, v134, v118);
      sub_1000103E4(v117, v90, &qword_1000811C8);
      v94 = v121;
      v109(v91, v119, v121);
      sub_1000103E4(v124, v92, &qword_1000811D0);
      CurrentWeather.metadata.getter();
      v108(v25, v93);
      v95 = v129;
      WeatherMetadata.date.getter();
      v107(v8, v131);
      sub_100010388(v92, &qword_1000811D0);
      ((void (*)(char *, char *))v115)(v91, v94);
      sub_100010388(v90, &qword_1000811C8);
      if (*((unsigned char *)&v28[1].isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__expireTimeDefault))
      {
LABEL_40:
        __break(1u);
        return;
      }
      uint64_t v96 = (uint64_t)v128;
      Date.addingTimeInterval(_:)();
      (*(void (**)(char *, uint64_t))(v133 + 8))(v95, v84);
      uint64_t v76 = (uint64_t)v125;
      sub_100010388((uint64_t)v125, &qword_1000811C0);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v106[0])(v96, 0, 1, v126);
      uint64_t v84 = v126;
      sub_10000F838(v96, v76, &qword_1000811C0);
    }
    uint64_t v97 = v130;
    sub_1000103E4(v76, v130, &qword_1000811C0);
    int v98 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v120)(v97, 1, v84);
    double v30 = v123;
    if (v98 != 1)
    {
      uint64_t v99 = v84;
      Class isa = Date._bridgeToObjectiveC()().super.isa;
      (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v97, v99);
      int v101 = MapsSuggestionsIsInTheFuture();

      if (v101)
      {
        if (qword_100081D90 != -1) {
          swift_once();
        }
        uint64_t v102 = type metadata accessor for Logger();
        sub_10000D1B8(v102, (uint64_t)qword_100081F58);
        v103 = Logger.logObject.getter();
        os_log_type_t v104 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v103, v104))
        {
          v105 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v105 = 0;
          _os_log_impl((void *)&_mh_execute_header, v103, v104, "No update: we still have valid weather", v105, 2u);
          swift_slowDealloc();
        }

        sub_100010388(v76, &qword_1000811C0);
        sub_100010388(v134, &qword_100080F50);
        goto LABEL_20;
      }

      sub_100010388(v76, &qword_1000811C0);
      v49 = &qword_100080F50;
      uint64_t v50 = v134;
LABEL_17:
      sub_100010388(v50, v49);
      return;
    }
    __break(1u);
    goto LABEL_40;
  }
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v43 = type metadata accessor for Logger();
  sub_10000D1B8(v43, (uint64_t)qword_100081F58);
  v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v46 = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "unable to instantiate strongSelf", v46, 2u);
    swift_slowDealloc();
  }
}

id sub_100007468(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack;
  id result = *(id *)(v1 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
  if (result)
  {
    LODWORD(a1) = 2143289344;
    [result writeSignalValue:38 forType:a1];
    id result = *(id *)(v1 + v2);
    if (result)
    {
      LODWORD(v4) = 2143289344;
      [result writeSignalValue:8 forType:v4];
      id result = *(id *)(v1 + v2);
      if (result)
      {
        LODWORD(v5) = 2143289344;
        [result writeSignalValue:9 forType:v5];
        id result = *(id *)(v1 + v2);
        if (result)
        {
          LODWORD(v6) = 2143289344;
          [result writeSignalValue:7 forType:v6];
          id result = *(id *)(v1 + v2);
          if (result)
          {
            LODWORD(v7) = 2143289344;
            [result writeSignalValue:6 forType:v7];
            id result = *(id *)(v1 + v2);
            if (result)
            {
              LODWORD(v8) = 2143289344;
              [result writeSignalValue:26 forType:v8];
              id result = *(id *)(v1 + v2);
              if (result)
              {
                LODWORD(v9) = 2143289344;
                [result writeSignalValue:25 forType:v9];
                id result = *(id *)(v1 + v2);
                if (result)
                {
                  LODWORD(v10) = 2143289344;
                  return [result writeSignalValue:27 forType:v10];
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100007594(uint64_t a1)
{
  uint64_t v2 = sub_10000494C(&qword_100081278);
  uint64_t v211 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  v209 = (char *)&v196 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v210 = (char *)&v196 - v5;
  uint64_t v6 = type metadata accessor for DayWeather();
  uint64_t v207 = *(void *)(v6 - 8);
  v208 = (char *)v6;
  __chkstk_darwin(v6);
  v206 = (char *)&v196 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000494C(&qword_1000811D0);
  __chkstk_darwin(v8 - 8);
  v205 = (char *)&v196 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000494C(&qword_100080F70);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  v217 = (char *)&v196 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v196 - v13;
  id v15 = (int *)sub_10000494C(&qword_100080F50);
  uint64_t v16 = *((void *)v15 - 1);
  uint64_t v17 = __chkstk_darwin(v15);
  v218 = (char *)&v196 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v196 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v196 - v22;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v25 = (void *)Strong;
    uint64_t v223 = v16;
    uint64_t v26 = Strong + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherDataModel;
    swift_beginAccess();
    sub_1000103E4(v26, (uint64_t)v14, &qword_100080F70);

    if ((*(unsigned int (**)(char *, uint64_t, int *))(v223 + 48))(v14, 1, v15) != 1)
    {
      uint64_t v198 = v2;
      uint64_t v199 = a1;
      uint64_t v202 = a1 + 16;
      uint64_t v27 = v15[12];
      uint64_t v28 = (uint64_t)&v23[v27];
      uint64_t v29 = v15[16];
      v219 = &v23[v27];
      v220 = &v23[v29];
      uint64_t v30 = v15[20];
      uint64_t v31 = (uint64_t)&v23[v30];
      v221 = &v23[v30];
      v222 = v23;
      uint64_t v32 = (uint64_t)&v14[v27];
      double v33 = &v14[v29];
      v216 = (int *)&v14[v30];
      uint64_t v204 = type metadata accessor for CurrentWeather();
      uint64_t v34 = *(void *)(v204 - 8);
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v23, v14, v204);
      sub_10000F838(v32, v28, &qword_1000811C8);
      uint64_t v35 = sub_10000494C(&qword_100080F80);
      uint64_t v36 = *(void *)(v35 - 8);
      v37 = v220;
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v220, v33, v35);
      sub_10000F838((uint64_t)v216, v31, &qword_1000811D0);
      os_log_type_t v38 = &v21[v15[12]];
      v39 = &v21[v15[16]];
      v216 = v15;
      uint64_t v40 = (uint64_t)&v21[v15[20]];
      uint64_t v200 = v34;
      double v41 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
      v197 = (void (*)(void, void))v21;
      uint64_t v42 = v204;
      v214 = v41;
      uint64_t v203 = v34 + 16;
      v41(v21, (uint64_t)v222, v204);
      uint64_t v43 = (uint64_t)v38;
      uint64_t v44 = (uint64_t)v38;
      os_log_type_t v45 = v39;
      sub_1000103E4((uint64_t)v219, v44, &qword_1000811C8);
      v212 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
      uint64_t v213 = v36 + 16;
      v212(v39, v37, v35);
      sub_1000103E4((uint64_t)v221, v40, &qword_1000811D0);
      uint64_t v46 = (uint64_t)v205;
      sub_10000F838(v40, (uint64_t)v205, &qword_1000811D0);
      uint64_t v47 = type metadata accessor for AirQuality();
      uint64_t v48 = *(void *)(v47 - 8);
      int v49 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47);
      uint64_t v215 = v35;
      uint64_t v196 = v36;
      if (v49 == 1)
      {
        v201 = *(void (**)(char *, uint64_t))(v36 + 8);
        v201(v45, v35);
        sub_100010388(v43, &qword_1000811C8);
        uint64_t v50 = v197;
        v197 = *(void (**)(void, void))(v200 + 8);
        v197(v50, v42);
        sub_100010388(v46, &qword_1000811D0);
        uint64_t v51 = (uint64_t)v222;
        uint64_t v52 = v42;
      }
      else
      {
        uint64_t v68 = AirQuality.index.getter();
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
        v201 = *(void (**)(char *, uint64_t))(v36 + 8);
        v201(v45, v35);
        sub_100010388(v43, &qword_1000811C8);
        uint64_t v69 = v197;
        v197 = *(void (**)(void, void))(v200 + 8);
        v197(v69, v42);
        swift_beginAccess();
        uint64_t v70 = swift_unknownObjectWeakLoadStrong();
        uint64_t v52 = v42;
        if (v70)
        {
          uint64_t v71 = (void *)v70;
          uint64_t v72 = v68;
          v73 = *(void **)(v70 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
          id v74 = v73;

          uint64_t v51 = (uint64_t)v222;
          if (v73)
          {
            *(float *)&double v75 = (float)v72;
            [v74 writeSignalValue:38 forType:v75];
          }
        }
        else
        {
          uint64_t v51 = (uint64_t)v222;
        }
      }
      swift_beginAccess();
      uint64_t v76 = swift_unknownObjectWeakLoadStrong();
      if (v76)
      {
        v77 = (void *)v76;
        uint64_t v78 = *(void **)(v76 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v79 = v78;

        if (v78)
        {
          swift_beginAccess();
          uint64_t v80 = swift_unknownObjectWeakLoadStrong();
          if (v80)
          {
            v82 = (void *)v80;
            uint64_t v84 = v216;
            uint64_t v83 = (uint64_t)v217;
            uint64_t v85 = (uint64_t)&v217[v216[12]];
            uint64_t v86 = &v217[v216[16]];
            v205 = &v217[v216[20]];
            v214(v217, v51, v204);
            sub_1000103E4((uint64_t)v219, v85, &qword_1000811C8);
            v212(v86, v220, v215);
            sub_1000103E4((uint64_t)v221, (uint64_t)v205, &qword_1000811D0);
            (*(void (**)(uint64_t, void, uint64_t, int *))(v223 + 56))(v83, 0, 1, v84);
            sub_10000E838(v83, sub_10000DFF0);
            float v88 = v87;

            uint64_t v52 = v204;
            sub_100010388(v83, &qword_100080F70);
          }
          else
          {
            float v88 = NAN;
          }
          *(float *)&double v81 = v88 * 100.0;
          objc_msgSend(v79, "writeSignalValue:forType:", 8, v81, v196);
        }
      }
      swift_beginAccess();
      uint64_t v89 = swift_unknownObjectWeakLoadStrong();
      if (v89)
      {
        uint64_t v90 = (void *)v89;
        v91 = *(void **)(v89 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v92 = v91;

        if (v91)
        {
          swift_beginAccess();
          uint64_t v93 = swift_unknownObjectWeakLoadStrong();
          if (v93)
          {
            v95 = (void *)v93;
            uint64_t v97 = v216;
            uint64_t v96 = (uint64_t)v217;
            uint64_t v98 = (uint64_t)&v217[v216[12]];
            uint64_t v99 = &v217[v216[16]];
            v205 = &v217[v216[20]];
            v214(v217, v51, v204);
            sub_1000103E4((uint64_t)v219, v98, &qword_1000811C8);
            v212(v99, v220, v215);
            sub_1000103E4((uint64_t)v221, (uint64_t)v205, &qword_1000811D0);
            (*(void (**)(uint64_t, void, uint64_t, int *))(v223 + 56))(v96, 0, 1, v97);
            sub_10000E838(v96, sub_10000E450);
            float v101 = v100;

            uint64_t v52 = v204;
            sub_100010388(v96, &qword_100080F70);
          }
          else
          {
            float v101 = NAN;
          }
          *(float *)&double v94 = v101 * 100.0;
          objc_msgSend(v92, "writeSignalValue:forType:", 9, v94, v196);
        }
      }
      uint64_t v102 = v218;
      uint64_t v103 = (uint64_t)&v218[v216[12]];
      os_log_type_t v104 = &v218[v216[16]];
      uint64_t v105 = (uint64_t)&v218[v216[20]];
      v214(v218, v51, v52);
      sub_1000103E4((uint64_t)v219, v103, &qword_1000811C8);
      uint64_t v106 = v215;
      v212(v104, v220, v215);
      sub_1000103E4((uint64_t)v221, v105, &qword_1000811D0);
      v107 = v206;
      Forecast.subscript.getter();
      v205 = (char *)(v196 + 8);
      v201(v104, v106);
      DayWeather.precipitationChance.getter();
      double v109 = v108;
      (*(void (**)(char *, char *))(v207 + 8))(v107, v208);
      sub_100010388(v105, &qword_1000811D0);
      sub_100010388(v103, &qword_1000811C8);
      uint64_t v110 = (void (*)(char *, uint64_t))v197;
      v197(v102, v52);
      swift_beginAccess();
      uint64_t v111 = swift_unknownObjectWeakLoadStrong();
      if (v111)
      {
        uint64_t v112 = (void *)v111;
        id v113 = *(void **)(v111 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v114 = v113;

        if (v113)
        {
          *(float *)&double v115 = v109;
          *(float *)&double v115 = *(float *)&v115 * 100.0;
          [v114 writeSignalValue:7 forType:v115];
        }
      }
      uint64_t v116 = v218;
      v208 = &v218[v216[12]];
      uint64_t v117 = (uint64_t)v208;
      uint64_t v118 = &v218[v216[16]];
      uint64_t v119 = (uint64_t)&v218[v216[20]];
      v214(v218, (uint64_t)v222, v52);
      sub_1000103E4((uint64_t)v219, v117, &qword_1000811C8);
      uint64_t v120 = v215;
      v212(v118, v220, v215);
      sub_1000103E4((uint64_t)v221, v119, &qword_1000811D0);
      v121 = v209;
      CurrentWeather.temperature.getter();
      v110(v116, v52);
      id v122 = [self kelvin];
      v123 = v210;
      uint64_t v124 = v198;
      Measurement<>.converted(to:)();

      v125 = *(void (**)(char *, uint64_t))(v211 + 8);
      v125(v121, v124);
      sub_100010388(v119, &qword_1000811D0);
      v201(v118, v120);
      sub_100010388((uint64_t)v208, &qword_1000811C8);
      Measurement.value.getter();
      double v127 = v126;
      v125(v123, v124);
      swift_beginAccess();
      uint64_t v128 = swift_unknownObjectWeakLoadStrong();
      if (v128)
      {
        v129 = (void *)v128;
        uint64_t v130 = *(void **)(v128 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v131 = v130;

        if (v130)
        {
          *(float *)&double v132 = v127;
          [v131 writeSignalValue:6 forType:v132];
        }
      }
      swift_beginAccess();
      uint64_t v133 = swift_unknownObjectWeakLoadStrong();
      uint64_t v134 = v223;
      if (v133)
      {
        double v135 = (void *)v133;
        v136 = *(void **)(v133 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v137 = v136;

        if (v136)
        {
          swift_beginAccess();
          uint64_t v138 = swift_unknownObjectWeakLoadStrong();
          if (v138)
          {
            v140 = (void *)v138;
            v142 = v216;
            uint64_t v141 = (uint64_t)v217;
            uint64_t v143 = (uint64_t)&v217[v216[12]];
            v144 = &v217[v216[16]];
            uint64_t v145 = (uint64_t)&v217[v216[20]];
            v214(v217, (uint64_t)v222, v204);
            sub_1000103E4((uint64_t)v219, v143, &qword_1000811C8);
            v212(v144, v220, v215);
            sub_1000103E4((uint64_t)v221, v145, &qword_1000811D0);
            (*(void (**)(uint64_t, void, uint64_t, int *))(v223 + 56))(v141, 0, 1, v142);
            float v146 = sub_10000DFF0(v141);

            uint64_t v147 = v141;
            uint64_t v134 = v223;
            sub_100010388(v147, &qword_100080F70);
          }
          else
          {
            float v146 = NAN;
          }
          *(float *)&double v139 = v146;
          objc_msgSend(v137, "writeSignalValue:forType:", 26, v139, v196);
        }
      }
      swift_beginAccess();
      uint64_t v148 = swift_unknownObjectWeakLoadStrong();
      if (v148)
      {
        v149 = (void *)v148;
        v150 = *(void **)(v148 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v151 = v150;

        if (v150)
        {
          swift_beginAccess();
          uint64_t v152 = swift_unknownObjectWeakLoadStrong();
          if (v152)
          {
            v154 = (void *)v152;
            v156 = v216;
            uint64_t v155 = (uint64_t)v217;
            uint64_t v157 = (uint64_t)&v217[v216[12]];
            v158 = &v217[v216[16]];
            uint64_t v159 = (uint64_t)&v217[v216[20]];
            v214(v217, (uint64_t)v222, v204);
            sub_1000103E4((uint64_t)v219, v157, &qword_1000811C8);
            v212(v158, v220, v215);
            sub_1000103E4((uint64_t)v221, v159, &qword_1000811D0);
            (*(void (**)(uint64_t, void, uint64_t, int *))(v223 + 56))(v155, 0, 1, v156);
            float v160 = sub_10000E450(v155);

            uint64_t v161 = v155;
            uint64_t v134 = v223;
            sub_100010388(v161, &qword_100080F70);
          }
          else
          {
            float v160 = NAN;
          }
          *(float *)&double v153 = v160;
          objc_msgSend(v151, "writeSignalValue:forType:", 25, v153, v196);
        }
      }
      swift_beginAccess();
      uint64_t v162 = swift_unknownObjectWeakLoadStrong();
      if (v162)
      {
        v163 = (void *)v162;
        v165 = v216;
        uint64_t v164 = (uint64_t)v217;
        uint64_t v166 = (uint64_t)&v217[v216[12]];
        v167 = &v217[v216[16]];
        uint64_t v168 = (uint64_t)&v217[v216[20]];
        v214(v217, (uint64_t)v222, v204);
        sub_1000103E4((uint64_t)v219, v166, &qword_1000811C8);
        v212(v167, v220, v215);
        sub_1000103E4((uint64_t)v221, v168, &qword_1000811D0);
        (*(void (**)(uint64_t, void, uint64_t, int *))(v134 + 56))(v164, 0, 1, v165);
        LODWORD(v166) = sub_10000EAD8(v164);

        sub_100010388(v164, &qword_100080F70);
        float v169 = (float)(int)v166;
      }
      else
      {
        float v169 = 0.0;
      }
      swift_beginAccess();
      uint64_t v170 = swift_unknownObjectWeakLoadStrong();
      if (v170)
      {
        v171 = (void *)v170;
        v172 = *(void **)(v170 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
        id v173 = v172;

        if (v172)
        {
          *(float *)&double v174 = v169;
          [v173 writeSignalValue:27 forType:v174];
        }
      }
      if (qword_100081D90 != -1) {
        swift_once();
      }
      uint64_t v175 = type metadata accessor for Logger();
      sub_10000D1B8(v175, (uint64_t)qword_100081F58);
      swift_retain_n();
      v176 = Logger.logObject.getter();
      os_log_type_t v177 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v176, v177))
      {
        v178 = (uint8_t *)swift_slowAlloc();
        v224[0] = swift_slowAlloc();
        *(_DWORD *)v178 = 136315138;
        swift_beginAccess();
        uint64_t v179 = swift_unknownObjectWeakLoadStrong();
        v180 = (void *)v179;
        if (v179)
        {
          v181 = *(void **)(v179 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
          id v182 = v181;

          if (v181)
          {
            id v183 = [v182 description];

            uint64_t v184 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v180 = v185;
          }
          else
          {
            uint64_t v184 = 0;
            v180 = 0;
          }
        }
        else
        {
          uint64_t v184 = 0;
        }
        uint64_t v225 = v184;
        v226 = v180;
        sub_10000494C(&qword_100081270);
        uint64_t v186 = String.init<A>(describing:)();
        uint64_t v225 = sub_10000C9CC(v186, v187, v224);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v176, v177, "Sending Signals from WeatherFeeler: %s", v178, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      v188 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v188) {
        goto LABEL_76;
      }
      v189 = v188;
      id v190 = [v188 delegate];

      if (v190)
      {
        swift_beginAccess();
        v191 = (void *)swift_unknownObjectWeakLoadStrong();
        swift_beginAccess();
        uint64_t v192 = swift_unknownObjectWeakLoadStrong();
        id v193 = (id)v192;
        if (v192)
        {
          v194 = *(void **)(v192 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
          id v195 = v194;

          if (v194)
          {
            id v193 = [v195 copy];
          }
          else
          {
            id v193 = 0;
          }
        }
        objc_msgSend(v190, "feeler:sendsSignalPack:", v191, v193, v196);
        swift_unknownObjectRelease();

LABEL_76:
        sub_100010388((uint64_t)v222, &qword_100080F50);
        return;
      }
LABEL_79:
      __break(1u);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, int *))(v16 + 56))(v14, 1, 1, v15);
  }
  sub_100010388((uint64_t)v14, &qword_100080F70);
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v53 = type metadata accessor for Logger();
  sub_10000D1B8(v53, (uint64_t)qword_100081F58);
  uint64_t v54 = Logger.logObject.getter();
  os_log_type_t v55 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v56 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "_weatherDataModel is nil. Clearing Signals", v56, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v57 = swift_unknownObjectWeakLoadStrong();
  if (v57)
  {
    uint64_t v59 = (void *)v57;
    sub_100007468(v58);
  }
  swift_beginAccess();
  uint64_t v60 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v60)
  {
    v61 = v60;
    id v62 = [v60 delegate];

    if (!v62)
    {
      __break(1u);
      goto LABEL_79;
    }
    swift_beginAccess();
    id v63 = (void *)swift_unknownObjectWeakLoadStrong();
    swift_beginAccess();
    uint64_t v64 = swift_unknownObjectWeakLoadStrong();
    id v65 = (id)v64;
    if (v64)
    {
      v66 = *(void **)(v64 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__signalPack);
      id v67 = v66;

      if (v66)
      {
        id v65 = [v67 copy];
      }
      else
      {
        id v65 = 0;
      }
    }
    [v62 feeler:v63 sendsSignalPack:v65];
    swift_unknownObjectRelease();
  }
}

void sub_100008BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (unsigned char *)swift_unknownObjectWeakLoadStrong();
  if (Strong
    && (char v7 = Strong[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active],
        Strong,
        (v7 & 1) == 0))
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_10000D1B8(v18, (uint64_t)qword_100081F58);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Returning from MapsSuggestionsWeatherFeeler.didUpdate(weatherConditions:) because _active == NO", v21, 2u);
LABEL_18:
      swift_slowDealloc();
    }
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000D1B8(v8, (uint64_t)qword_100081F58);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "weatherConditionsDataProviderDidChangeWeatherConditions triggered", v11, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t v12 = swift_unknownObjectWeakLoadStrong();
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      sub_1000103E4(a2, (uint64_t)v5, &qword_100080F70);
      uint64_t v14 = (uint64_t)v13 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherDataModel;
      swift_beginAccess();
      sub_100010024((uint64_t)v5, v14);
      swift_endAccess();
    }
    swift_beginAccess();
    id v15 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v15)
    {
      uint64_t v16 = v15;
      unsigned __int8 v17 = [v15 updateSignals];
    }
    else
    {
      unsigned __int8 v17 = 2;
    }
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      LOBYTE(v27) = v17;
      sub_10000494C(&qword_100081268);
      uint64_t v24 = String.init<A>(describing:)();
      uint64_t v27 = sub_10000C9CC(v24, v25, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v22, "updateSignals on the weatherFeeler: %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_18;
    }
  }
}

id MapsSuggestionsWeatherFeeler.__allocating_init(delegate:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithDelegate:a1 name:v6];

  swift_unknownObjectRelease();
  return v7;
}

void MapsSuggestionsWeatherFeeler.init(delegate:name:)()
{
}

id MapsSuggestionsWeatherFeeler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void MapsSuggestionsWeatherFeeler.init()()
{
}

id MapsSuggestionsWeatherFeeler.__deallocating_deinit()
{
  return sub_10000C6DC(type metadata accessor for MapsSuggestionsWeatherFeeler);
}

uint64_t _s12destinationd40MapsSuggestionsWeatherConditionsProviderC17_weatherDataModel0D3Kit07CurrentD0V07currentD0_AE8ForecastVyAE04HourD0VGSg06hourlyM0AJyAE03DayD0VG05dailyM0AE10AirQualityVSg03airS0tSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000494C(&qword_100080F50);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

id MapsSuggestionsWeatherConditionsProvider.init(queue:locationRange:)(void *a1, double a2)
{
  id v3 = sub_10000D064(a1, a2);

  return v3;
}

id MapsSuggestionsWeatherConditionsProvider.startProviding(forObserver:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_10000D024(a1, v1);
}

id MapsSuggestionsWeatherConditionsProvider.stopProviding(forObserver:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_10000D044(a1, v1);
}

void sub_100009374(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, id, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  swift_unknownObjectRetain();
  id v8 = a1;
  a4(a3, v8, ObjectType);
  swift_unknownObjectRelease();
}

Swift::Void __swiftcall MapsSuggestionsWeatherConditionsProvider.didUpdateLocation()()
{
  if ([*(id *)(v0 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers) count])
  {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__queue);
    uint64_t v2 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v5[4] = sub_10000DD00;
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10000544C;
    v5[3] = &unk_1000711B0;
    id v3 = _Block_copy(v5);
    id v4 = v1;
    swift_release();
    [v4 asyncBlock:v3];
    _Block_release(v3);
  }
}

void sub_100009550(uint64_t a1)
{
  uint64_t v148 = type metadata accessor for Date();
  uint64_t v149 = *(void *)(v148 - 8);
  uint64_t v2 = __chkstk_darwin(v148);
  id v4 = (char *)&v125 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  float v146 = (char *)&v125 - v5;
  uint64_t v6 = sub_10000494C(&qword_1000811C0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v147 = (char *)&v125 - v10;
  uint64_t v11 = type metadata accessor for WeatherMetadata();
  uint64_t v150 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v125 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000494C(&qword_100080F70);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  unsigned __int8 v17 = (char *)&v125 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v125 - v18;
  os_log_type_t v20 = (int *)sub_10000494C(&qword_100080F50);
  uint64_t v152 = *((void *)v20 - 1);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v125 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v151 = (uint64_t)&v125 - v24;
  uint64_t v153 = a1;
  swift_beginAccess();
  uint64_t Strong = (unsigned char *)swift_unknownObjectWeakLoadStrong();
  if (!Strong
    || (char v26 = Strong[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__isRequesting],
        Strong,
        (v26 & 1) != 0))
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_10000D1B8(v27, (uint64_t)qword_100081F58);
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Already getting an update, returning.", v30, 2u);
      swift_slowDealloc();
    }

    return;
  }
  id v31 = (id)MapsSuggestionsCurrentBestLocation();
  if (v31)
  {
    id v145 = v31;
    swift_beginAccess();
    uint64_t v32 = swift_unknownObjectWeakLoadStrong();
    if (v32)
    {
      double v33 = (void *)v32;
      *(unsigned char *)(v32 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__isRequesting) = 1;
      swift_retain();
    }
    else
    {
      swift_retain();
    }
    swift_beginAccess();
    uint64_t v40 = swift_unknownObjectWeakLoadStrong();
    if (v40)
    {
      double v41 = (void *)v40;
      sub_1000103E4(v40 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__weatherDataModel, (uint64_t)v19, &qword_100080F70);

      if ((*(unsigned int (**)(char *, uint64_t, int *))(v152 + 48))(v19, 1, v20) != 1)
      {
        uint64_t v128 = v4;
        double v127 = v17;
        uint64_t v42 = v20[12];
        uint64_t v43 = v151;
        uint64_t v44 = v151 + v42;
        uint64_t v141 = v151 + v42;
        uint64_t v45 = v20[16];
        uint64_t v143 = v151 + v45;
        uint64_t v46 = v20[20];
        uint64_t v144 = v151 + v46;
        v142 = &v19[v42];
        uint64_t v138 = &v19[v45];
        double v139 = &v19[v46];
        uint64_t v140 = type metadata accessor for CurrentWeather();
        uint64_t v47 = *(void *)(v140 - 8);
        (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v43, v19, v140);
        sub_10000F838((uint64_t)v142, v44, &qword_1000811C8);
        v142 = (char *)sub_10000494C(&qword_100080F80);
        uint64_t v48 = *((void *)v142 - 1);
        (*(void (**)(uint64_t, char *, char *))(v48 + 32))(v143, v138, v142);
        sub_10000F838((uint64_t)v139, v144, &qword_1000811D0);
        double v139 = &v23[v20[12]];
        uint64_t v49 = (uint64_t)v139;
        uint64_t v50 = v20;
        uint64_t v51 = &v23[v20[16]];
        uint64_t v138 = v51;
        double v132 = v50;
        id v137 = &v23[v50[20]];
        uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 16);
        uint64_t v53 = v43;
        uint64_t v54 = v140;
        uint64_t v136 = v47 + 16;
        double v135 = v52;
        v52(v23, v53, v140);
        sub_1000103E4(v141, v49, &qword_1000811C8);
        os_log_type_t v55 = *(void (**)(char *, uint64_t, char *))(v48 + 16);
        uint64_t v134 = v48 + 16;
        uint64_t v133 = v55;
        v55(v51, v143, v142);
        uint64_t v56 = v137;
        sub_1000103E4(v144, (uint64_t)v137, &qword_1000811D0);
        CurrentWeather.metadata.getter();
        uint64_t v57 = *(void (**)(char *, uint64_t))(v47 + 8);
        uint64_t v131 = v47 + 8;
        uint64_t v130 = v57;
        v57(v23, v54);
        double v58 = (void *)WeatherMetadata.location.getter();
        uint64_t v59 = v150 + 8;
        v129 = *(void (**)(char *, uint64_t))(v150 + 8);
        v129(v13, v11);
        sub_100010388((uint64_t)v56, &qword_1000811D0);
        uint64_t v60 = *(char **)(v48 + 8);
        v61 = v138;
        uint64_t v138 = (char *)(v48 + 8);
        id v137 = v60;
        ((void (*)(char *, char *))v60)(v61, v142);
        sub_100010388((uint64_t)v139, &qword_1000811C8);
        [v58 distanceFromLocation:v145];
        double v63 = v62;
        swift_beginAccess();
        uint64_t v64 = (char *)swift_unknownObjectWeakLoadStrong();
        if (!v64)
        {
          __break(1u);
          return;
        }
        double v65 = *(double *)&v64[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__locationRange];

        if (v65 < v63)
        {
          v66 = v58;
          if (qword_100081D90 != -1) {
            swift_once();
          }
          uint64_t v67 = type metadata accessor for Logger();
          sub_10000D1B8(v67, (uint64_t)qword_100081F58);
          uint64_t v68 = Logger.logObject.getter();
          os_log_type_t v69 = static os_log_type_t.debug.getter();
          BOOL v70 = os_log_type_enabled(v68, v69);
          uint64_t v71 = v153;
          id v72 = v145;
          if (v70)
          {
            v73 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v73 = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, v69, "Updating current weather because location changed significantly", v73, 2u);
            swift_slowDealloc();
          }

          swift_beginAccess();
          uint64_t v74 = swift_unknownObjectWeakLoadStrong();
          if (v74)
          {
            double v75 = (void *)v74;
            id v76 = v72;
            swift_retain();
            _s12destinationd40MapsSuggestionsWeatherConditionsProviderC07requestD010atLocation10completionySo10CLLocationCSg_y0D3Kit07CurrentD0V07currentD0_AJ8ForecastVyAJ04HourD0VGSg06hourlyO0AOyAJ03DayD0VG05dailyO0AJ10AirQualityVSg03airU0tSg_s5Error_pSgtcSgtF_0(v72, (uint64_t)sub_10001008C, v71);

            swift_release();
          }
          else
          {
          }
          swift_release();

          goto LABEL_60;
        }
        id v126 = v58;
        double v139 = &v23[v132[12]];
        uint64_t v87 = (uint64_t)v139;
        float v88 = &v23[v132[16]];
        uint64_t v89 = (uint64_t)&v23[v132[20]];
        uint64_t v90 = v140;
        v135(v23, v151, v140);
        sub_1000103E4(v141, v87, &qword_1000811C8);
        uint64_t v150 = v59;
        uint64_t v91 = (uint64_t)v142;
        v133(v88, v143, v142);
        sub_1000103E4(v144, v89, &qword_1000811D0);
        CurrentWeather.metadata.getter();
        v130(v23, v90);
        uint64_t v92 = (uint64_t)v147;
        WeatherMetadata.expirationDate.getter();
        v129(v13, v11);
        uint64_t v93 = v149;
        uint64_t v94 = v148;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v149 + 56))(v92, 0, 1, v148);
        sub_100010388(v89, &qword_1000811D0);
        ((void (*)(char *, uint64_t))v137)(v88, v91);
        sub_100010388((uint64_t)v139, &qword_1000811C8);
        sub_1000103E4(v92, (uint64_t)v9, &qword_1000811C0);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v93 + 48))(v9, 1, v94) == 1)
        {
          sub_100010388((uint64_t)v9, &qword_1000811C0);
        }
        else
        {
          v95 = v146;
          (*(void (**)(char *, char *, uint64_t))(v93 + 32))(v146, v9, v94);
          id v96 = (id)MapsSuggestionsNow();
          uint64_t v97 = v128;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          LOBYTE(v96) = static Date.< infix(_:_:)();
          float v100 = *(void (**)(char *, uint64_t))(v93 + 8);
          uint64_t v98 = v93 + 8;
          uint64_t v99 = v100;
          v100(v97, v94);
          if (v96)
          {
            if (qword_100081D90 != -1) {
              swift_once();
            }
            uint64_t v101 = type metadata accessor for Logger();
            sub_10000D1B8(v101, (uint64_t)qword_100081F58);
            uint64_t v102 = Logger.logObject.getter();
            os_log_type_t v103 = static os_log_type_t.debug.getter();
            BOOL v104 = os_log_type_enabled(v102, v103);
            uint64_t v105 = (uint64_t)v127;
            if (v104)
            {
              uint64_t v106 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v106 = 0;
              _os_log_impl((void *)&_mh_execute_header, v102, v103, "Current weather condition still valid, no need to update", v106, 2u);
              swift_slowDealloc();
            }

            swift_beginAccess();
            v107 = (unsigned char *)swift_unknownObjectWeakLoadStrong();
            if (v107)
            {
              v107[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__isRequesting] = 0;
            }
            swift_beginAccess();
            uint64_t v108 = swift_unknownObjectWeakLoadStrong();
            if (v108)
            {
              double v109 = (void *)v108;
              uint64_t v110 = v132;
              uint64_t v111 = v105 + v132[12];
              uint64_t v112 = v132[16];
              uint64_t v149 = v98;
              id v113 = (char *)(v105 + v112);
              uint64_t v114 = v105 + v132[20];
              uint64_t v115 = v151;
              v135((char *)v105, v151, v140);
              sub_1000103E4(v141, v111, &qword_1000811C8);
              v133(v113, v143, v142);
              sub_1000103E4(v144, v114, &qword_1000811D0);
              (*(void (**)(uint64_t, void, uint64_t, int *))(v152 + 56))(v105, 0, 1, v110);
              MapsSuggestionsWeatherConditionsProvider.didUpdate(weatherConditions:)(v105);

              swift_release();
              sub_100010388(v105, &qword_100080F70);
              v99(v95, v148);
              sub_100010388(v92, &qword_1000811C0);
              sub_100010388(v115, &qword_100080F50);
              return;
            }

            swift_release();
            v99(v95, v148);
            goto LABEL_59;
          }
          v99(v95, v94);
        }
        uint64_t v116 = v153;
        id v117 = v145;
        if (qword_100081D90 != -1) {
          swift_once();
        }
        uint64_t v118 = type metadata accessor for Logger();
        sub_10000D1B8(v118, (uint64_t)qword_100081F58);
        uint64_t v119 = Logger.logObject.getter();
        os_log_type_t v120 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v119, v120))
        {
          v121 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v121 = 0;
          _os_log_impl((void *)&_mh_execute_header, v119, v120, "Current weather conditions expired, lets get new one", v121, 2u);
          swift_slowDealloc();
        }

        swift_beginAccess();
        uint64_t v122 = swift_unknownObjectWeakLoadStrong();
        if (v122)
        {
          v123 = (void *)v122;
          id v124 = v117;
          swift_retain();
          _s12destinationd40MapsSuggestionsWeatherConditionsProviderC07requestD010atLocation10completionySo10CLLocationCSg_y0D3Kit07CurrentD0V07currentD0_AJ8ForecastVyAJ04HourD0VGSg06hourlyO0AOyAJ03DayD0VG05dailyO0AJ10AirQualityVSg03airU0tSg_s5Error_pSgtcSgtF_0(v117, (uint64_t)sub_10001008C, v116);

          swift_release();
        }
        else
        {
        }
        swift_release();

LABEL_59:
        sub_100010388(v92, &qword_1000811C0);
LABEL_60:
        sub_100010388(v151, &qword_100080F50);
        return;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, int *))(v152 + 56))(v19, 1, 1, v20);
    }
    sub_100010388((uint64_t)v19, &qword_100080F70);
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v77 = type metadata accessor for Logger();
    sub_10000D1B8(v77, (uint64_t)qword_100081F58);
    uint64_t v78 = Logger.logObject.getter();
    os_log_type_t v79 = static os_log_type_t.debug.getter();
    BOOL v80 = os_log_type_enabled(v78, v79);
    uint64_t v81 = v153;
    id v82 = v145;
    if (v80)
    {
      uint64_t v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v83 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "weatherDataModel is uninitialized, so fetching weather for the first time", v83, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t v84 = swift_unknownObjectWeakLoadStrong();
    if (v84)
    {
      uint64_t v85 = (void *)v84;
      id v86 = v82;
      swift_retain();
      _s12destinationd40MapsSuggestionsWeatherConditionsProviderC07requestD010atLocation10completionySo10CLLocationCSg_y0D3Kit07CurrentD0V07currentD0_AJ8ForecastVyAJ04HourD0VGSg06hourlyO0AOyAJ03DayD0VG05dailyO0AJ10AirQualityVSg03airU0tSg_s5Error_pSgtcSgtF_0(v82, (uint64_t)sub_10001008C, v81);

      swift_release_n();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v34 = type metadata accessor for Logger();
    sub_10000D1B8(v34, (uint64_t)qword_100081F58);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "No location when trying to request weather. Calling back with nil.", v37, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t v38 = swift_unknownObjectWeakLoadStrong();
    if (v38)
    {
      v39 = (void *)v38;
      (*(void (**)(char *, uint64_t, uint64_t, int *))(v152 + 56))(v17, 1, 1, v20);
      MapsSuggestionsWeatherConditionsProvider.didUpdate(weatherConditions:)((uint64_t)v17);

      sub_100010388((uint64_t)v17, &qword_100080F70);
    }
  }
}

void sub_10000A7F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000494C(&qword_100080F70);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = (void *)Strong;
    id v11 = *(id *)(Strong + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__queue);

    sub_1000103E4(a1, (uint64_t)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100080F70);
    unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a3;
    *(void *)(v13 + 24) = a2;
    sub_10000F838((uint64_t)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, &qword_100080F70);
    aBlock[4] = sub_100010318;
    aBlock[5] = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000544C;
    aBlock[3] = &unk_100071418;
    uint64_t v14 = _Block_copy(aBlock);
    swift_retain();
    swift_errorRetain();
    swift_release();
    [v11 asyncBlock:v14];
    _Block_release(v14);
  }
}

void sub_10000A9E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (unsigned char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    Strong[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__isRequesting] = 0;
  }
  if (a2)
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000D1B8(v9, (uint64_t)qword_100081F58);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)unint64_t v12 = 136315138;
      swift_getErrorValue();
      uint64_t v23 = Error.localizedDescription.getter();
      uint64_t v24 = v13;
      sub_10000494C(&qword_100081270);
      uint64_t v14 = String.init<A>(describing:)();
      uint64_t v23 = sub_10000C9CC(v14, v15, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error %s while retrieving WeatherForecast", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    swift_beginAccess();
    uint64_t v18 = swift_unknownObjectWeakLoadStrong();
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = sub_10000494C(&qword_100080F50);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
      MapsSuggestionsWeatherConditionsProvider.didUpdate(weatherConditions:)((uint64_t)v7);

      sub_100010388((uint64_t)v7, &qword_100080F70);
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v16 = swift_unknownObjectWeakLoadStrong();
    if (v16)
    {
      unsigned __int8 v17 = (void *)v16;
      MapsSuggestionsWeatherConditionsProvider.didUpdate(weatherConditions:)(a3);
    }
  }
}

void MapsSuggestionsWeatherConditionsProvider.didUpdate(weatherConditions:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000494C(&qword_100080F70);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10000D1B8(v7, (uint64_t)qword_100081F58);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Current WeatherConditions are Updated. Inform observers", v10, 2u);
    swift_slowDealloc();
  }

  os_log_type_t v11 = *(void **)(v2 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers);
  sub_1000103E4(a1, (uint64_t)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100080F70);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  sub_10000F838((uint64_t)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, &qword_100080F70);
  aBlock[4] = sub_10000DF7C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B168;
  aBlock[3] = &unk_100071200;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v11;
  swift_release();
  [v15 callBlock:v14];
  _Block_release(v14);
}

uint64_t sub_10000AF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000494C(&qword_100080F70);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  swift_getObjectType();
  uint64_t result = swift_conformsToProtocol2();
  if (result) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8)
  {
    os_log_type_t v9 = *(void **)(v8 + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__queue);
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1000103E4(a2, (uint64_t)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100080F70);
    unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v10;
    sub_10000F838((uint64_t)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, &qword_100080F70);
    aBlock[4] = sub_10000FFBC;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000544C;
    aBlock[3] = &unk_1000713C8;
    uint64_t v13 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_release();
    [v9 asyncBlock:v13];
    _Block_release(v13);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000B168(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_10000B1CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  uint64_t v8 = sub_10000494C(&qword_100081208);
  v7[7] = v8;
  v7[8] = *(void *)(v8 - 8);
  v7[9] = swift_task_alloc();
  uint64_t v9 = sub_10000494C(&qword_100081210);
  v7[10] = v9;
  v7[11] = *(void *)(v9 - 8);
  v7[12] = swift_task_alloc();
  uint64_t v10 = sub_10000494C(&qword_100081218);
  v7[13] = v10;
  v7[14] = *(void *)(v10 - 8);
  v7[15] = swift_task_alloc();
  uint64_t v11 = sub_10000494C(&qword_100081220);
  v7[16] = v11;
  v7[17] = *(void *)(v11 - 8);
  v7[18] = swift_task_alloc();
  v7[19] = type metadata accessor for WeatherServiceCaching.Options();
  v7[20] = swift_task_alloc();
  sub_10000494C(&qword_100081228);
  v7[21] = swift_task_alloc();
  sub_10000494C(&qword_100081230);
  v7[22] = swift_task_alloc();
  sub_10000494C(&qword_100081238);
  v7[23] = swift_task_alloc();
  uint64_t Options = type metadata accessor for WeatherServiceFetchOptions();
  v7[24] = Options;
  v7[25] = *(void *)(Options - 8);
  v7[26] = swift_task_alloc();
  return _swift_task_switch(sub_10000B4D0, 0, 0);
}

uint64_t sub_10000B4D0()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  uint64_t v24 = v0[3];
  id v4 = (id)MapsSuggestionsTimeZone();
  static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v5 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 0, 1, v5);
  uint64_t v6 = type metadata accessor for WeatherServiceLocationOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
  uint64_t v7 = type metadata accessor for WeatherNetworkActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  v0[2] = &_swiftEmptyArrayStorage;
  sub_10000FC44();
  sub_10000494C(&qword_100081248);
  sub_10000FC9C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  WeatherServiceFetchOptions.init(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:networkActivity:needsMarineData:needsTwilightData:)();
  if (v24)
  {
    uint64_t v16 = v0[18];
    uint64_t v23 = v0[17];
    uint64_t v25 = v0[16];
    uint64_t v15 = v0[15];
    uint64_t v21 = v0[14];
    uint64_t v8 = v0[12];
    uint64_t v22 = v0[13];
    uint64_t v9 = v0[9];
    uint64_t v19 = v0[11];
    uint64_t v20 = v0[10];
    uint64_t v10 = v0[6];
    uint64_t v18 = v0[7];
    uint64_t v11 = v0[5];
    uint64_t v17 = v0[8];
    type metadata accessor for CurrentWeather();
    static WeatherQuery.current.getter();
    sub_10000494C(&qword_100080F78);
    static WeatherQuery.hourly.getter();
    sub_10000494C(&qword_100080F80);
    static WeatherQuery.daily.getter();
    sub_10000494C(&qword_1000811D0);
    static WeatherQuery.airQuality.getter();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = v10;
    sub_10000FA94(v11);
    WeatherService.fetchWeather<A, B, C, D>(for:including:_:_:_:options:completion:)();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v9, v18);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v8, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v15, v22);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v16, v25);
  }
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

void sub_10000B8C0(uint64_t a1, void (*a2)(char *, void), uint64_t a3)
{
  uint64_t v123 = a3;
  uint64_t v5 = sub_10000494C(&qword_100080F70);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v90 - v9;
  uint64_t v11 = (int *)sub_10000494C(&qword_100081258);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v114 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  os_log_type_t v120 = (char *)&v90 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v121 = (char *)&v90 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v90 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v90 - v21;
  uint64_t v23 = sub_10000494C(&qword_100081260);
  __chkstk_darwin(v23);
  uint64_t v25 = (uint64_t *)((char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000103E4(a1, (uint64_t)v25, &qword_100081260);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    BOOL v104 = a2;
    uint64_t v34 = v11[12];
    uint64_t v35 = &v22[v34];
    uint64_t v116 = &v22[v34];
    uint64_t v36 = v11[16];
    id v124 = &v22[v36];
    uint64_t v37 = v11[20];
    uint64_t v38 = (uint64_t)&v22[v37];
    v39 = (char *)v25 + v34;
    uint64_t v111 = (void (*)(char *, char *, uint64_t))((char *)v25 + v36);
    uint64_t v112 = (void (*)(void))((char *)v25 + v37);
    uint64_t v40 = type metadata accessor for CurrentWeather();
    uint64_t v41 = *(void *)(v40 - 8);
    uint64_t v100 = v41;
    uint64_t v42 = *(char **)(v41 + 32);
    uint64_t v94 = (char *)(v41 + 32);
    uint64_t v97 = v42;
    uint64_t v43 = v40;
    ((void (*)(char *, uint64_t *))v42)(v22, v25);
    uint64_t v44 = sub_10000494C(&qword_100080F78);
    uint64_t v45 = *(void *)(v44 - 8);
    uint64_t v117 = v44;
    uint64_t v118 = v45;
    uint64_t v46 = *(char **)(v45 + 32);
    uint64_t v91 = (char *)(v45 + 32);
    uint64_t v92 = v46;
    ((void (*)(char *, char *, uint64_t))v46)(v35, v39, v44);
    uint64_t v115 = sub_10000494C(&qword_100080F80);
    id v113 = *(void **)(v115 - 8);
    uint64_t v47 = (char *)v113[4];
    v95 = v113 + 4;
    id v96 = v47;
    ((void (*)(char *, void, uint64_t))v47)(v124, v111, v115);
    uint64_t v108 = v38;
    sub_10000F838((uint64_t)v112, v38, &qword_1000811D0);
    uint64_t v99 = (int *)sub_10000494C(&qword_100080F50);
    uint64_t v48 = v99[12];
    uint64_t v119 = v10;
    uint64_t v90 = &v10[v48];
    uint64_t v93 = &v10[v99[16]];
    uint64_t v98 = &v10[v99[20]];
    uint64_t v122 = v22;
    os_log_type_t v103 = &v20[v11[12]];
    uint64_t v49 = v103;
    uint64_t v102 = &v20[v11[16]];
    uint64_t v50 = v102;
    uint64_t v101 = &v20[v11[20]];
    uint64_t v51 = (uint64_t)v101;
    uint64_t v52 = *(void (**)(void))(v41 + 16);
    uint64_t v107 = v41 + 16;
    uint64_t v112 = v52;
    uint64_t v109 = v43;
    ((void (*)(char *, char *, uint64_t))v52)(v20, v22, v43);
    uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v118 + 16);
    uint64_t v106 = v118 + 16;
    uint64_t v53 = v116;
    v105(v49, v116, v117);
    uint64_t v54 = (void (*)(char *, char *, uint64_t))v113[2];
    uint64_t v110 = v113 + 2;
    uint64_t v111 = v54;
    uint64_t v55 = v115;
    v54(v50, v124, v115);
    sub_1000103E4(v38, v51, &qword_1000811D0);
    ((void (*)(char *, char *, uint64_t))v97)(v119, v20, v43);
    uint64_t v56 = &v121[v11[12]];
    uint64_t v97 = &v121[v11[16]];
    uint64_t v57 = v97;
    uint64_t v94 = &v121[v11[20]];
    uint64_t v58 = (uint64_t)v94;
    v112();
    uint64_t v59 = v117;
    uint64_t v60 = v105;
    v105(v56, v53, v117);
    v111(v57, v124, v55);
    sub_1000103E4(v108, v58, &qword_1000811D0);
    v61 = v90;
    ((void (*)(char *, char *, uint64_t))v92)(v90, v56, v59);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v118 + 56))(v61, 0, 1, v59);
    uint64_t v92 = &v120[v11[12]];
    double v62 = v92;
    double v63 = &v120[v11[16]];
    uint64_t v91 = &v120[v11[20]];
    uint64_t v64 = (uint64_t)v91;
    uint64_t v65 = v109;
    v66 = v112;
    v112();
    v60(v62, v116, v59);
    uint64_t v67 = v124;
    uint64_t v68 = v115;
    os_log_type_t v69 = v111;
    v111(v63, v124, v115);
    uint64_t v70 = v108;
    sub_1000103E4(v108, v64, &qword_1000811D0);
    ((void (*)(char *, char *, uint64_t))v96)(v93, v63, v68);
    uint64_t v71 = v114;
    id v96 = &v114[v11[12]];
    id v72 = v96;
    v73 = &v114[v11[16]];
    uint64_t v74 = (uint64_t)&v114[v11[20]];
    ((void (*)(char *, char *, uint64_t))v66)(v114, v122, v65);
    uint64_t v75 = v117;
    v105(v72, v116, v117);
    id v76 = v67;
    uint64_t v77 = v115;
    v69(v73, v76, v115);
    sub_1000103E4(v70, v74, &qword_1000811D0);
    sub_10000F838(v74, (uint64_t)v98, &qword_1000811D0);
    (*(void (**)(char *, void, uint64_t))(*((void *)v99 - 1) + 56))(v119, 0, 1);
    uint64_t v78 = (void (*)(char *, uint64_t))v113[1];
    v78(v73, v77);
    os_log_type_t v79 = *(void (**)(char *, uint64_t))(v118 + 8);
    v79(v96, v75);
    BOOL v80 = *(void (**)(char *, uint64_t))(v100 + 8);
    uint64_t v81 = v109;
    v80(v71, v109);
    sub_100010388((uint64_t)v91, &qword_1000811D0);
    v79(v92, v75);
    v80(v120, v81);
    sub_100010388((uint64_t)v94, &qword_1000811D0);
    v78(v97, v77);
    v80(v121, v81);
    sub_100010388((uint64_t)v101, &qword_1000811D0);
    v78(v102, v77);
    v79(v103, v75);
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v82 = type metadata accessor for Logger();
    sub_10000D1B8(v82, (uint64_t)qword_100081F58);
    uint64_t v83 = Logger.logObject.getter();
    os_log_type_t v84 = static os_log_type_t.debug.getter();
    BOOL v85 = os_log_type_enabled(v83, v84);
    id v86 = v104;
    if (v85)
    {
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v87 = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Got a response from WeatherKit", v87, 2u);
      swift_slowDealloc();
    }

    uint64_t v88 = (uint64_t)v122;
    uint64_t v89 = (uint64_t)v119;
    if (v86)
    {
      v86(v119, 0);
      sub_100010388(v89, &qword_100080F70);
      sub_100010388(v88, &qword_100081258);
      return;
    }
    goto LABEL_15;
  }
  if (!a2)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v26 = *v25;
  uint64_t v27 = sub_10000494C(&qword_100080F50);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
  swift_errorRetain();
  a2(v8, v26);
  swift_errorRelease();
  sub_100010388((uint64_t)v8, &qword_100080F70);
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v28 = type metadata accessor for Logger();
  sub_10000D1B8(v28, (uint64_t)qword_100081F58);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    id v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v126 = swift_slowAlloc();
    *(_DWORD *)id v31 = 136315138;
    swift_getErrorValue();
    uint64_t v32 = Error.localizedDescription.getter();
    uint64_t v125 = sub_10000C9CC(v32, v33, &v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Error: %s", v31, 0xCu);
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

uint64_t sub_10000C4B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100010388(a1, &qword_1000811D8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void MapsSuggestionsWeatherConditionsProvider.init()()
{
}

id MapsSuggestionsWeatherConditionsProvider.__deallocating_deinit()
{
  return sub_10000C6DC(type metadata accessor for MapsSuggestionsWeatherConditionsProvider);
}

id sub_10000C6DC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_10000C780()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100010448(v0, qword_100081F58);
  sub_10000D1B8(v0, (uint64_t)qword_100081F58);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000C7F8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *id v4 = v2;
  v4[1] = sub_10000C8D4;
  return v6(a1);
}

uint64_t sub_10000C8D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C9CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000CAA0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000FAF4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000FAF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000FAA4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000CAA0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000CC5C(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10000CC5C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000CCF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000CED4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000CED4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000CCF4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000CE6C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000CE6C(uint64_t a1, uint64_t a2)
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
  sub_10000494C(&qword_1000811F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000CED4(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000494C(&qword_1000811F0);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_10000D024(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers) registerObserver:a1 handler:0];
}

id sub_10000D044(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers) unregisterObserver:a1 handler:0];
}

id sub_10000D064(void *a1, double a2)
{
  size_t v5 = &v2[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__weatherDataModel];
  uint64_t v6 = sub_10000494C(&qword_100080F50);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v2[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__isRequesting] = 0;
  *(void *)&v2[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__queue] = a1;
  *(double *)&v2[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__locationRange] = a2;
  int64_t v7 = v2;
  id v8 = [a1 innerQueue];
  id v9 = objc_allocWithZone((Class)MapsSuggestionsObservers);
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 initWithCallbackQueue:v8 name:v10];

  *(void *)&v7[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers] = v11;
  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for MapsSuggestionsWeatherConditionsProvider(0);
  return objc_msgSendSuper2(&v13, "init");
}

uint64_t sub_10000D1B8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000D1F0()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D228()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000D268()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v3 = Strong;
    if (MapsSuggestionsLoggingIsVerbose())
    {
      if (qword_100081D90 != -1) {
        swift_once();
      }
      uint64_t v4 = type metadata accessor for Logger();
      sub_10000D1B8(v4, (uint64_t)qword_100081F58);
      id v5 = v1;
      uint64_t v6 = v3;
      int64_t v7 = v5;
      id v8 = v6;
      id v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v38 = v1;
        uint64_t v11 = swift_slowAlloc();
        uint64_t v12 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 138412546;
        aBlock[0] = v7;
        objc_super v13 = v7;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v12 = v7;

        *(_WORD *)(v11 + 12) = 2112;
        uint64_t v14 = *(Class *)((char *)&v8->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation);
        if (v14)
        {
          aBlock[0] = *((char *)v8
                                  + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation);
          id v15 = v14;
        }
        else
        {
          aBlock[0] = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v12[1] = v14;

        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Location updated, Location: %@, lastLocation: %@", (uint8_t *)v11, 0x16u);
        sub_10000494C(&qword_100081288);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        uint64_t v1 = v38;
      }
      else
      {

        id v9 = v7;
      }
    }
    if (*((unsigned char *)&v3->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active) == 1)
    {
      uint64_t v19 = OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation;
      if (*(Class *)((char *)&v3->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation)
        && (objc_msgSend(v1, "distanceFromLocation:"),
            v20 < *(double *)((char *)&v3->isa
                            + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__distanceThreshold)))
      {
        if (qword_100081D90 != -1) {
          swift_once();
        }
        uint64_t v21 = type metadata accessor for Logger();
        sub_10000D1B8(v21, (uint64_t)qword_100081F58);
        uint64_t v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          uint64_t v25 = "_distanceThreshold not met";
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v22, v23, v25, v24, 2u);
          swift_slowDealloc();

          goto LABEL_42;
        }
      }
      else if (sub_100006378())
      {
        uint64_t v27 = *(Class *)((char *)&v3->isa + v19);
        *(Class *)((char *)&v3->isa + v19) = (Class)v1;
        id v28 = v1;

        os_log_type_t v29 = *(char **)((char *)&v3->isa
                       + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherConditionsDataProvider);
        if (v29)
        {
          os_log_type_t v30 = *(void **)&v29[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers];
          id v31 = v29;
          if ([v30 count])
          {
            uint64_t v32 = *(void **)&v31[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__queue];
            uint64_t v33 = swift_allocObject();
            swift_unknownObjectWeakInit();
            aBlock[4] = sub_10000DD00;
            aBlock[5] = v33;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_10000544C;
            aBlock[3] = &unk_100071468;
            uint64_t v34 = _Block_copy(aBlock);
            id v35 = v32;
            swift_release();
            [v35 asyncBlock:v34];
            _Block_release(v34);
          }
        }
        if (qword_100081D90 != -1) {
          swift_once();
        }
        uint64_t v36 = type metadata accessor for Logger();
        sub_10000D1B8(v36, (uint64_t)qword_100081F58);
        uint64_t v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          uint64_t v25 = "updated location";
          goto LABEL_40;
        }
      }
      else
      {
        if (qword_100081D90 != -1) {
          swift_once();
        }
        uint64_t v37 = type metadata accessor for Logger();
        sub_10000D1B8(v37, (uint64_t)qword_100081F58);
        uint64_t v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          uint64_t v25 = "New location but not allowed to update";
          goto LABEL_40;
        }
      }
    }
    else
    {
      if (qword_100081D90 != -1) {
        swift_once();
      }
      uint64_t v26 = type metadata accessor for Logger();
      sub_10000D1B8(v26, (uint64_t)qword_100081F58);
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        uint64_t v25 = "Not reacting to CLLocation update. _active == false";
        goto LABEL_40;
      }
    }

    unint64_t v3 = v22;
    goto LABEL_42;
  }
  if (qword_100081D90 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_10000D1B8(v16, (uint64_t)qword_100081F58);
  unint64_t v3 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v17, "strongSelf could not be initialized", v18, 2u);
    swift_slowDealloc();
  }
LABEL_42:
}

uint64_t sub_10000D94C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D95C()
{
  return swift_release();
}

void sub_10000D964()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)&Strong[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation];
    *(void *)&Strong[OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__lastLocation] = 0;
  }
}

void sub_10000D9C4()
{
}

void sub_10000D9CC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (sub_100006378())
    {
      if (qword_100081D90 != -1) {
        swift_once();
      }
      uint64_t v2 = type metadata accessor for Logger();
      sub_10000D1B8(v2, (uint64_t)qword_100081F58);
      unint64_t v3 = Logger.logObject.getter();
      os_log_type_t v4 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v3, v4))
      {
        id v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "startUpdatingSignals", v5, 2u);
        swift_slowDealloc();
      }

      *((unsigned char *)&v1->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__active) = 1;
      uint64_t v6 = *(Class *)((char *)&v1->isa + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__locationUpdater);
      if (v6)
      {
        swift_unknownObjectRetain();
        int64_t v7 = v1;

        swift_unknownObjectRelease();
      }
      id v8 = *(char **)((char *)&v1->isa
                    + OBJC_IVAR____TtC12destinationd28MapsSuggestionsWeatherFeeler__weatherConditionsDataProvider);
      if (v8)
      {
        id v9 = *(void **)&v8[OBJC_IVAR____TtC12destinationd40MapsSuggestionsWeatherConditionsProvider__observers];
        os_log_type_t v10 = v8;
        [v9 registerObserver:v1 handler:0];

        uint64_t v1 = v10;
      }
    }
    else
    {
      if (qword_100081D90 != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      sub_10000D1B8(v14, (uint64_t)qword_100081F58);
      id v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "_isAllowedToUpdate() == false. Not allowed to update", v17, 2u);
        swift_slowDealloc();
      }
      else
      {

        uint64_t v1 = v15;
      }
    }
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_10000D1B8(v11, (uint64_t)qword_100081F58);
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v12))
    {
      objc_super v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v12, "strongSelf could not be initialized", v13, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000DCF0()
{
}

void sub_10000DCF8()
{
}

void sub_10000DD00()
{
  sub_100009550(v0);
}

uint64_t sub_10000DD08()
{
  uint64_t v1 = *(void *)(sub_10000494C(&qword_100080F70) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = (int *)sub_10000494C(&qword_100080F50);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v6 - 1) + 48))(v0 + v3, 1, v6))
  {
    uint64_t v7 = type metadata accessor for CurrentWeather();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v3, v7);
    uint64_t v8 = v5 + v6[12];
    uint64_t v9 = sub_10000494C(&qword_100080F78);
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    uint64_t v11 = v5 + v6[16];
    uint64_t v12 = sub_10000494C(&qword_100080F80);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
    uint64_t v13 = v5 + v6[20];
    uint64_t v14 = type metadata accessor for AirQuality();
    uint64_t v15 = *(void *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
  }
  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000DF7C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10000494C(&qword_100080F70) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_10000AF68(a1, v4);
}

float sub_10000DFF0(uint64_t a1)
{
  uint64_t v2 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000494C(&qword_100081280);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  sub_1000103E4(a1, (uint64_t)v4, &qword_100080F70);
  uint64_t v11 = (int *)sub_10000494C(&qword_100080F50);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v11 - 1) + 48))(v4, 1, v11) == 1)
  {
    sub_100010388((uint64_t)v4, &qword_100080F70);
    uint64_t v12 = type metadata accessor for WeatherCondition();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
LABEL_19:
    float v20 = 0.0;
    goto LABEL_20;
  }
  uint64_t v13 = (uint64_t)&v4[v11[12]];
  uint64_t v14 = &v4[v11[16]];
  uint64_t v15 = (uint64_t)&v4[v11[20]];
  CurrentWeather.condition.getter();
  uint64_t v16 = type metadata accessor for CurrentWeather();
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v4, v16);
  uint64_t v17 = type metadata accessor for WeatherCondition();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  sub_100010388(v15, &qword_1000811D0);
  uint64_t v19 = sub_10000494C(&qword_100080F80);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v14, v19);
  sub_100010388(v13, &qword_1000811C8);
  float v20 = 0.0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) != 1)
  {
    sub_1000103E4((uint64_t)v10, (uint64_t)v8, &qword_100081280);
    int v21 = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v8, v17);
    float v20 = 1.0;
    if (v21 != enum case for WeatherCondition.drizzle(_:)
      && v21 != enum case for WeatherCondition.freezingRain(_:)
      && v21 != enum case for WeatherCondition.hail(_:)
      && v21 != enum case for WeatherCondition.heavyRain(_:)
      && v21 != enum case for WeatherCondition.hurricane(_:)
      && v21 != enum case for WeatherCondition.isolatedThunderstorms(_:)
      && v21 != enum case for WeatherCondition.rain(_:)
      && v21 != enum case for WeatherCondition.scatteredThunderstorms(_:)
      && v21 != enum case for WeatherCondition.sleet(_:)
      && v21 != enum case for WeatherCondition.strongStorms(_:)
      && v21 != enum case for WeatherCondition.sunShowers(_:)
      && v21 != enum case for WeatherCondition.thunderstorms(_:)
      && v21 != enum case for WeatherCondition.tropicalStorm(_:)
      && v21 != enum case for WeatherCondition.wintryMix(_:))
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v17);
      goto LABEL_19;
    }
  }
LABEL_20:
  sub_100010388((uint64_t)v10, &qword_100081280);
  return v20;
}

float sub_10000E450(uint64_t a1)
{
  uint64_t v2 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000494C(&qword_100081280);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  sub_1000103E4(a1, (uint64_t)v4, &qword_100080F70);
  uint64_t v11 = (int *)sub_10000494C(&qword_100080F50);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v11 - 1) + 48))(v4, 1, v11) == 1)
  {
    sub_100010388((uint64_t)v4, &qword_100080F70);
    uint64_t v12 = type metadata accessor for WeatherCondition();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
LABEL_13:
    float v20 = 0.0;
    goto LABEL_14;
  }
  uint64_t v13 = (uint64_t)&v4[v11[12]];
  uint64_t v14 = &v4[v11[16]];
  uint64_t v15 = (uint64_t)&v4[v11[20]];
  CurrentWeather.condition.getter();
  uint64_t v16 = type metadata accessor for CurrentWeather();
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v4, v16);
  uint64_t v17 = type metadata accessor for WeatherCondition();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  sub_100010388(v15, &qword_1000811D0);
  uint64_t v19 = sub_10000494C(&qword_100080F80);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v14, v19);
  sub_100010388(v13, &qword_1000811C8);
  float v20 = 0.0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) != 1)
  {
    sub_1000103E4((uint64_t)v10, (uint64_t)v8, &qword_100081280);
    int v21 = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v8, v17);
    float v20 = 1.0;
    if (v21 != enum case for WeatherCondition.blizzard(_:)
      && v21 != enum case for WeatherCondition.blowingSnow(_:)
      && v21 != enum case for WeatherCondition.flurries(_:)
      && v21 != enum case for WeatherCondition.freezingDrizzle(_:)
      && v21 != enum case for WeatherCondition.heavySnow(_:)
      && v21 != enum case for WeatherCondition.snow(_:)
      && v21 != enum case for WeatherCondition.sunFlurries(_:)
      && v21 != enum case for WeatherCondition.wintryMix(_:))
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v17);
      goto LABEL_13;
    }
  }
LABEL_14:
  sub_100010388((uint64_t)v10, &qword_100081280);
  return v20;
}

void sub_10000E838(uint64_t a1, float (*a2)(void))
{
  uint64_t v4 = type metadata accessor for DayWeather();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000103E4(a1, (uint64_t)v10, &qword_100080F70);
  uint64_t v11 = (int *)sub_10000494C(&qword_100080F50);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v11 - 1) + 48))(v10, 1, v11) == 1)
  {
    sub_100010388((uint64_t)v10, &qword_100080F70);
  }
  else
  {
    uint64_t v12 = v11[12];
    float v20 = a2;
    uint64_t v13 = &v10[v12];
    uint64_t v14 = &v10[v11[16]];
    uint64_t v15 = (uint64_t)&v10[v11[20]];
    uint64_t v16 = sub_10000494C(&qword_100080F80);
    Forecast.subscript.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v14, v16);
    DayWeather.precipitationChance.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_100010388(v15, &qword_1000811D0);
    uint64_t v17 = (uint64_t)v13;
    a2 = v20;
    sub_100010388(v17, &qword_1000811C8);
    uint64_t v18 = type metadata accessor for CurrentWeather();
    (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v10, v18);
  }
  a2(a1);
}

uint64_t sub_10000EAD8(uint64_t a1)
{
  uint64_t v2 = sub_10000494C(&qword_100080F70);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000494C(&qword_100081280);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  sub_1000103E4(a1, (uint64_t)v4, &qword_100080F70);
  uint64_t v11 = (int *)sub_10000494C(&qword_100080F50);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v11 - 1) + 48))(v4, 1, v11) == 1)
  {
    sub_100010388((uint64_t)v4, &qword_100080F70);
    uint64_t v12 = type metadata accessor for WeatherCondition();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  else
  {
    uint64_t v14 = (uint64_t)&v4[v11[12]];
    uint64_t v15 = &v4[v11[16]];
    uint64_t v16 = (uint64_t)&v4[v11[20]];
    CurrentWeather.condition.getter();
    uint64_t v17 = type metadata accessor for CurrentWeather();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v4, v17);
    uint64_t v18 = type metadata accessor for WeatherCondition();
    uint64_t v19 = *(void *)(v18 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
    sub_100010388(v16, &qword_1000811D0);
    uint64_t v20 = sub_10000494C(&qword_100080F80);
    (*(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8))(v15, v20);
    sub_100010388(v14, &qword_1000811C8);
    uint64_t v13 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v10, 1, v18) == 1) {
      goto LABEL_71;
    }
    sub_1000103E4((uint64_t)v10, (uint64_t)v8, &qword_100081280);
    int v21 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v8, v18);
    if (v21 == enum case for WeatherCondition.blizzard(_:))
    {
      uint64_t v13 = 44;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.blowingDust(_:))
    {
      uint64_t v13 = 20;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.blowingSnow(_:))
    {
      uint64_t v13 = 16;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.breezy(_:)) {
      goto LABEL_12;
    }
    if (v21 == enum case for WeatherCondition.clear(_:))
    {
      uint64_t v13 = 33;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.cloudy(_:))
    {
      uint64_t v13 = 27;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.drizzle(_:))
    {
      uint64_t v13 = 10;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.flurries(_:)) {
      goto LABEL_20;
    }
    if (v21 == enum case for WeatherCondition.foggy(_:))
    {
      uint64_t v13 = 21;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.freezingDrizzle(_:))
    {
      uint64_t v13 = 9;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.freezingRain(_:))
    {
      uint64_t v13 = 11;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.frigid(_:))
    {
      uint64_t v13 = 26;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.hail(_:))
    {
      uint64_t v13 = 18;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.haze(_:))
    {
      uint64_t v13 = 22;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.heavyRain(_:))
    {
      uint64_t v13 = 41;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.heavySnow(_:))
    {
      uint64_t v13 = 43;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.hot(_:))
    {
      uint64_t v13 = 37;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.hurricane(_:))
    {
      uint64_t v13 = 3;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.isolatedThunderstorms(_:))
    {
      uint64_t v13 = 38;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.mostlyClear(_:))
    {
      uint64_t v13 = 35;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.mostlyCloudy(_:))
    {
      uint64_t v13 = 29;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.partlyCloudy(_:))
    {
      uint64_t v13 = 31;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.rain(_:))
    {
      uint64_t v13 = 13;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.scatteredThunderstorms(_:))
    {
      uint64_t v13 = 39;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.sleet(_:))
    {
      uint64_t v13 = 19;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.smoky(_:))
    {
      uint64_t v13 = 23;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.snow(_:))
    {
      uint64_t v13 = 17;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.strongStorms(_:))
    {
      uint64_t v13 = 4;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.sunFlurries(_:))
    {
LABEL_20:
      uint64_t v13 = 14;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.sunShowers(_:))
    {
      uint64_t v13 = 12;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.thunderstorms(_:))
    {
      uint64_t v13 = 5;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.tropicalStorm(_:))
    {
      uint64_t v13 = 2;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.windy(_:))
    {
LABEL_12:
      uint64_t v13 = 25;
      goto LABEL_71;
    }
    if (v21 == enum case for WeatherCondition.wintryMix(_:))
    {
      uint64_t v13 = 7;
      goto LABEL_71;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v18);
  }
  uint64_t v13 = 0;
LABEL_71:
  sub_100010388((uint64_t)v10, &qword_100081280);
  return v13;
}

void _s12destinationd40MapsSuggestionsWeatherConditionsProviderC07requestD010atLocation10completionySo10CLLocationCSg_y0D3Kit07CurrentD0V07currentD0_AJ8ForecastVyAJ04HourD0VGSg06hourlyO0AOyAJ03DayD0VG05dailyO0AJ10AirQualityVSg03airU0tSg_s5Error_pSgtcSgtF_0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000494C(&qword_1000811D8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v9 = qword_100081D90;
    id v10 = a1;
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_10000D1B8(v11, (uint64_t)qword_100081F58);
    id v12 = v10;
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      os_log_t v33 = (os_log_t)swift_slowAlloc();
      os_log_t v35 = v33;
      *(_DWORD *)uint64_t v15 = 136315138;
      v31[1] = v15 + 4;
      uint64_t v32 = v15;
      id v16 = [v12 description];
      uint64_t v17 = v8;
      uint64_t v18 = a2;
      uint64_t v19 = a3;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v22 = v21;

      uint64_t v23 = v20;
      a3 = v19;
      a2 = v18;
      uint64_t v8 = v17;
      uint64_t v34 = sub_10000C9CC(v23, v22, (uint64_t *)&v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "requestForecastWeather with location %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    type metadata accessor for WeatherService();
    uint64_t v28 = static WeatherService.shared.getter();
    uint64_t v29 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v8, 1, 1, v29);
    os_log_type_t v30 = (void *)swift_allocObject();
    v30[2] = 0;
    v30[3] = 0;
    v30[4] = v28;
    v30[5] = v12;
    v30[6] = a2;
    v30[7] = a3;
    sub_10000FA94(a2);
    sub_10000C4B8((uint64_t)v8, (uint64_t)&unk_1000811E8, (uint64_t)v30);
    swift_release();
  }
  else
  {
    if (qword_100081D90 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_10000D1B8(v24, (uint64_t)qword_100081F58);
    os_log_t v33 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v25, "location can't be nil!", v26, 2u);
      swift_slowDealloc();
    }
    os_log_t v27 = v33;
  }
}

uint64_t sub_10000F598()
{
  return type metadata accessor for MapsSuggestionsWeatherFeeler(0);
}

void sub_10000F5A0()
{
  sub_10000F67C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000F67C()
{
  if (!qword_1000810D0)
  {
    sub_10000F6D8(&qword_100080F50);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000810D0);
    }
  }
}

uint64_t sub_10000F6D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000F720()
{
  return type metadata accessor for MapsSuggestionsWeatherConditionsProvider(0);
}

void sub_10000F728()
{
  sub_10000F67C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10000F7E0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000F7F0()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000F830()
{
  sub_100006608(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10000F838(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000494C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F89C()
{
  swift_unknownObjectRelease();
  swift_release();

  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10000F8F4()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_10000F9A0;
  return sub_10000B1CC((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_10000F9A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000FA94(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000FAA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000FAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000FB54()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000FB8C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000F9A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000811F8 + dword_1000811F8);
  return v6(a1, v4);
}

unint64_t sub_10000FC44()
{
  unint64_t result = qword_100081240;
  if (!qword_100081240)
  {
    type metadata accessor for WeatherServiceCaching.Options();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081240);
  }
  return result;
}

unint64_t sub_10000FC9C()
{
  unint64_t result = qword_100081250;
  if (!qword_100081250)
  {
    sub_10000F6D8(&qword_100081248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100081250);
  }
  return result;
}

uint64_t sub_10000FCF8()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000FD38(uint64_t a1)
{
  sub_10000B8C0(a1, *(void (**)(char *, void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000FD40()
{
  uint64_t v1 = *(void *)(sub_10000494C(&qword_100080F70) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = (int *)sub_10000494C(&qword_100080F50);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v6 - 1) + 48))(v0 + v3, 1, v6))
  {
    uint64_t v7 = type metadata accessor for CurrentWeather();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v3, v7);
    uint64_t v8 = v5 + v6[12];
    uint64_t v9 = sub_10000494C(&qword_100080F78);
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    uint64_t v11 = v5 + v6[16];
    uint64_t v12 = sub_10000494C(&qword_100080F80);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
    uint64_t v13 = v5 + v6[20];
    uint64_t v14 = type metadata accessor for AirQuality();
    uint64_t v15 = *(void *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
  }
  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_10000FFBC()
{
  uint64_t v1 = *(void *)(sub_10000494C(&qword_100080F70) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_100008BC8(v2, v3);
}

uint64_t sub_100010024(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000494C(&qword_100080F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10001008C(uint64_t a1, uint64_t a2)
{
  sub_10000A7F4(a1, a2, v2);
}

uint64_t sub_100010094()
{
  uint64_t v1 = *(void *)(sub_10000494C(&qword_100080F70) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_release();
  swift_errorRelease();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = (int *)sub_10000494C(&qword_100080F50);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v6 - 1) + 48))(v0 + v3, 1, v6))
  {
    uint64_t v7 = type metadata accessor for CurrentWeather();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v3, v7);
    uint64_t v8 = v5 + v6[12];
    uint64_t v9 = sub_10000494C(&qword_100080F78);
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    uint64_t v11 = v5 + v6[16];
    uint64_t v12 = sub_10000494C(&qword_100080F80);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
    uint64_t v13 = v5 + v6[20];
    uint64_t v14 = type metadata accessor for AirQuality();
    uint64_t v15 = *(void *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
  }
  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_100010318()
{
  uint64_t v1 = *(void *)(sub_10000494C(&qword_100080F70) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  sub_10000A9E0(v2, v3, v4);
}

void sub_100010380()
{
  sub_100007594(v0);
}

uint64_t sub_100010388(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000494C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000103E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000494C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100010448(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_10001061C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000107D8(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = (MapsSuggestionsDestination *)WeakRetained[1];
    id v5 = [(MapsSuggestionsDestination *)v4 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v25 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v8, "addContainedEntry:", *(void *)(a1 + 32), (void)v24))
          {
            GEOFindOrCreateLog();
            unint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v22 = [*(id *)(a1 + 32) uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v39 = v22;
              __int16 v40 = 2112;
              *(void *)uint64_t v41 = v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Added Entry '%@' to %@", buf, 0x16u);
            }
            goto LABEL_34;
          }
        }
        id v5 = [(MapsSuggestionsDestination *)v4 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    GEOFindOrCreateLog();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [*(id *)(a1 + 32) uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Creating new Destination for Entry '%@'", buf, 0xCu);
    }
    uint64_t v4 = [[MapsSuggestionsDestination alloc] initWithEntry:*(void *)(a1 + 32)];
    if (v4)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = v3[1];
      id v12 = [v11 countByEnumeratingWithState:&v32 objects:buf count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v33;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = [[MapsSuggestionsDestinationLink alloc] initFromDestination:*(void *)(*((void *)&v32 + 1) + 8 * (void)j) toDestination:v4];
            [v3[2] addObject:v15];
          }
          id v12 = [v11 countByEnumeratingWithState:&v32 objects:buf count:16];
        }
        while (v12);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v16 = v3[1];
      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v29;
        do
        {
          for (k = 0; k != v17; k = (char *)k + 1)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v16);
            }
            id v20 = [[MapsSuggestionsDestinationLink alloc] initFromDestination:v4 toDestination:*(void *)(*((void *)&v28 + 1) + 8 * (void)k)];
            [v3[2] addObject:v20];
          }
          id v17 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v17);
      }

      [v3[1] addObject:v4];
    }
    else
    {
      uint64_t v23 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
        __int16 v40 = 1024;
        *(_DWORD *)uint64_t v41 = 47;
        *(_WORD *)&v41[4] = 2082;
        *(void *)&v41[6] = "-[MapsSuggestionsDestinationGraph _addDestination:]";
        __int16 v42 = 2082;
        uint64_t v43 = "nil == (destination)";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an destination", buf, 0x26u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    unint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v39 = "MapsSuggestionsDestinationGraph.mm";
      __int16 v40 = 1026;
      *(_DWORD *)uint64_t v41 = 78;
      *(_WORD *)&v41[4] = 2082;
      *(void *)&v41[6] = "-[MapsSuggestionsDestinationGraph addEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    uint64_t v4 = (MapsSuggestionsDestination *)v21;
LABEL_34:
  }
}

void sub_100010CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100010F2C(NSObject **a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100014258;
  id v15 = sub_100014268;
  id v16 = 0;
  uint64_t v4 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014270;
  v8[3] = &unk_100071690;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

id sub_100011038(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "couldContainEntry:", *(void *)(a1 + 40), (void)v10);
        if (v7 > MapsSuggestionsConfidenceDontKnow())
        {
          id v8 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

void sub_100011178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001130C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000114D4(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "couldContainLocation:", *(void *)(a1 + 40), (void)v10);
        if (v7 > MapsSuggestionsConfidenceDontKnow())
        {
          id v8 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

void sub_100011614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000117D0(NSObject **a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_100014258;
  id v15 = sub_100014268;
  id v16 = 0;
  uint64_t v4 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000142C4;
  v8[3] = &unk_100071690;
  id v9 = v3;
  long long v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

id sub_1000118DC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "couldContainTime:", *(void *)(a1 + 40), (void)v11);
        if (v8 > MapsSuggestionsConfidenceDontKnow()) {
          [v2 addObject:v7];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  id v9 = [v2 copy];
  return v9;
}

void sub_100011A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100011C00(uint64_t a1)
{
  sub_100011E6C(*(void *)(a1 + 32));
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "firstEntryDuringPeriod:", *(void *)(a1 + 40), (void)v18);
        double v8 = v7;
        if (v7)
        {
          id v9 = [v7 originatingSourceName];
          long long v10 = [v2 objectForKeyedSubscript:v9];
          BOOL v11 = v10 == 0;

          if (v11)
          {
            id v12 = objc_alloc_init((Class)NSMutableArray);
            long long v13 = [v8 originatingSourceName];
            [v2 setObject:v12 forKeyedSubscript:v13];
          }
          long long v14 = [v8 originatingSourceName];
          id v15 = [v2 objectForKeyedSubscript:v14];
          [v15 addObject:v8];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  id v16 = [v2 copy];
  return v16;
}

void sub_100011DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100011E6C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v2 = *(void **)(a1 + 8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012FD4;
    v10[3] = &unk_100071560;
    v10[4] = &v11;
    uint64_t v3 = objc_msgSend(v2, "MSg_mutableCopyIf:", v10);
    id v4 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = v3;

    uint64_t v5 = *(void **)(v1 + 16);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001321C;
    v9[3] = &unk_100071588;
    v9[4] = v1;
    v9[5] = &v11;
    uint64_t v6 = objc_msgSend(v5, "MSg_mutableCopyIf:", v9);
    double v7 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = v6;

    uint64_t v1 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  return v1;
}

void sub_100011F98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100012230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012250(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = WeakRetained[2];
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = *(void **)(a1 + 32);
          long long v10 = objc_msgSend(v8, "to", (void)v14);
          LOBYTE(v9) = [v9 isEqualToDestination:v10];

          if (v9)
          {
            uint64_t v11 = [*(id *)(a1 + 40) location];
            [v8 containsLocation:v11];
            BOOL v13 = v12 > MapsSuggestionsConfidenceDontKnow();

            if (v13) {
              [v8 addETA:*(void *)(a1 + 40)];
            }
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v20 = "MapsSuggestionsDestinationGraph.mm";
      __int16 v21 = 1026;
      int v22 = 194;
      __int16 v23 = 2082;
      long long v24 = "-[MapsSuggestionsDestinationGraph addETA:to:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100012470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000127FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012824(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = WeakRetained[2];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v14;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v9 = *(void **)(a1 + 32);
          long long v10 = objc_msgSend(v8, "to", (void)v13);
          LOBYTE(v9) = [v9 isEqualToDestination:v10];

          if (v9)
          {
            uint64_t v11 = *(void **)(a1 + 40);
            double v12 = [v8 from];
            LOBYTE(v11) = [v11 isEqualToDestination:v12];

            if (v11) {
              [v8 addETA:*(void *)(a1 + 48)];
            }
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v19 = "MapsSuggestionsDestinationGraph.mm";
      __int16 v20 = 1026;
      int v21 = 219;
      __int16 v22 = 2082;
      __int16 v23 = "-[MapsSuggestionsDestinationGraph addETA:from:to:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100012A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012C24(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  long long v16 = WeakRetained;
  if (WeakRetained)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v3 = WeakRetained[1];
    id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v3);
          }
          double v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v7 addContainedBreadcrumb:*(void *)(a1 + 32)])
          {
            long long v14 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              long long v15 = *(char **)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              long long v28 = v15;
              __int16 v29 = 2112;
              *(void *)long long v30 = v7;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
            }
            goto LABEL_27;
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v3 = v16[2];
    id v8 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (j = 0; j != v8; j = (char *)j + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
          if ([v11 addBreadCrumbIfWithin:*(void *)(a1 + 32)])
          {
            double v12 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              long long v13 = *(char **)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              long long v28 = v13;
              __int16 v29 = 2112;
              *(void *)long long v30 = v11;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
            }
          }
        }
        id v8 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    long long v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v28 = "MapsSuggestionsDestinationGraph.mm";
      __int16 v29 = 1026;
      *(_DWORD *)long long v30 = 240;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "-[MapsSuggestionsDestinationGraph addBreadcrumb:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    uint64_t v3 = v14;
LABEL_27:
  }
}

void sub_100012F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100012FD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 removeExpiredEntries])
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ELIMINATE %@ (Contains only expired entries)", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_16;
  }
  if ([v3 hasBeenVisited]
    && ([v3 hasEntriesInTheFuture] & 1) == 0)
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ELIMINATE %@ (We've been here, and not coming back)", (uint8_t *)&v9, 0xCu);
    }
LABEL_16:

    uint64_t v6 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_17;
  }
  id v4 = [v3 latestKnownTime];
  if (v4 && MapsSuggestionsIsInThePast())
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ELIMINATE %@ (We should've left by now)", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

LABEL_17:
  return v6;
}

void sub_1000131E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001321C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 from];
  uint64_t v5 = [v3 to];
  if (!v5 || ([*(id *)(*(void *)(a1 + 32) + 8) containsObject:v5] & 1) == 0)
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ELIMINATE %@ (Its Arrival has been eliminated)", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_12;
  }
  if ((!v4 || ([*(id *)(*(void *)(a1 + 32) + 8) containsObject:v4] & 1) == 0)
    && ([v3 hasLinkOptions] & 1) == 0)
  {
    [v3 confidenceOfHavingBeenOnDestinationLink];
    if (v6 < MapsSuggestionsConfidenceDontKnow())
    {
      double v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        id v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ELIMINATE %@ (We've left, but have no evidence of using this Link)", (uint8_t *)&v15, 0xCu);
      }
LABEL_12:

      uint64_t v8 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_21;
    }
  }
  int v9 = [v4 latestKnownTime];
  uint64_t v10 = [v5 earliestKnownTime];
  uint64_t v11 = (void *)v10;
  uint64_t v8 = 1;
  if (v9 && v10)
  {
    double v12 = [v9 earlierDate:v10];

    if (v12 == v11)
    {
      long long v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        id v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "ELIMINATE %@ (We'd need a time machine)", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v8 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v8 = 1;
    }
  }

LABEL_21:
  return v8;
}

void sub_1000134D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000135D0(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = 0;
    do
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        ++v3;
        *(_DWORD *)buf = 67109120;
        LODWORD(v10) = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Rebalancing pass %d", buf, 8u);
      }
    }
    while ((sub_100011E6C((uint64_t)WeakRetained) & 1) != 0);
    if (MapsSuggestionsLoggingIsVerbose())
    {
      uint64_t v5 = dispatch_get_global_queue(21, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013820;
      block[3] = &unk_1000715B0;
      objc_copyWeak(&v8, v1);
      dispatch_async(v5, block);

      objc_destroyWeak(&v8);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    double v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v10 = "MapsSuggestionsDestinationGraph.mm";
      __int16 v11 = 1026;
      int v12 = 351;
      __int16 v13 = 2082;
      long long v14 = "-[MapsSuggestionsDestinationGraph rebalance]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000137FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013820(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = [WeakRetained jsonWithFormatting:0];
    id v4 = dispatch_get_global_queue(21, 0);
    *(void *)double v7 = _NSConcreteStackBlock;
    *(void *)&v7[8] = 3221225472;
    *(void *)&v7[16] = sub_1000140EC;
    *(void *)&v7[24] = &unk_100071668;
    id v8 = v3;
    int v9 = @"destinationGraph.txt";
    id v5 = v3;
    dispatch_async(v4, v7);
  }
  else
  {
    GEOFindOrCreateLog();
    double v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v7 = 136446722;
      *(void *)&v7[4] = "MapsSuggestionsDestinationGraph.mm";
      *(_WORD *)&v7[12] = 1026;
      *(_DWORD *)&v7[14] = 360;
      *(_WORD *)&v7[18] = 2082;
      *(void *)&v7[20] = "-[MapsSuggestionsDestinationGraph rebalance]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: loggingSelf went away in %{public}s", v7, 0x1Cu);
    }
  }
}

void sub_1000139D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100013B58(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  id v4 = (char *)[v3 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = MSg::jsonFor();
        [v2 addObject:v7];
      }
      id v4 = (char *)[v3 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v4);
  }

  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v10 = (char *)[v9 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = MSg::jsonFor();
        objc_msgSend(v8, "addObject:", v13, v16);
      }
      uint64_t v10 = (char *)[v9 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v10);
  }

  v24[0] = @"destinations";
  v24[1] = @"links";
  v25[0] = v2;
  v25[1] = v8;
  long long v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v14;
}

void sub_100013DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100013EB0(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return v1;
}

id sub_100013F68(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return v1;
}

uint64_t MapsSuggestionsIsDestinationGraphEnabled()
{
  if (qword_100081E18 != -1) {
    dispatch_once(&qword_100081E18, &stru_100071640);
  }
  return byte_100081E10;
}

void sub_100014038(id a1)
{
  byte_100081E10 = GEOConfigGetBOOL();
}

dispatch_queue_t *sub_100014064(dispatch_queue_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = a3;
  *a1 = 0;
  double v7 = [v5 copy];
  a1[1] = v7;
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v6);
  dispatch_queue_t v9 = *a1;
  *a1 = v8;

  return a1;
}

void sub_1000140D8(void *a1)
{
}

void sub_1000140EC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = MapsSuggestionsDefaultCacheDirectory();
  id v4 = [v3 stringByAppendingPathComponent:*(void *)(a1 + 40)];
  id v10 = 0;
  unsigned __int8 v5 = [v2 writeToFile:v4 atomically:1 encoding:4 error:&v10];
  id v6 = v10;

  if (v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v5;
  }
  if ((v7 & 1) == 0)
  {
    dispatch_queue_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error writing to temp file '%@': %@", buf, 0x16u);
    }
  }
}

void sub_100014228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100014258(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014268(uint64_t a1)
{
}

uint64_t sub_100014270(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

uint64_t sub_1000142C4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

uint64_t sub_100014318(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

void sub_100014460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_100014524(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000149A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100014B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000152CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001537C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1000153E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1000157CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001590C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100016008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MapsSuggestionsSignalPipeline;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100016094(uint64_t a1)
{
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(a1 + 48);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v10;
      do
      {
        unsigned __int8 v5 = 0;
        do
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v2);
          }
          id v6 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v5);
          if (objc_msgSend((id)objc_opt_class(), "isEnabled", (void)v9)) {
            [v6 stopUpdatingSignals];
          }
          unsigned __int8 v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v3);
    }

    unsigned __int8 v7 = *(NSObject **)(a1 + 56);
    if (v7)
    {
      dispatch_source_set_timer(v7, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
      dispatch_queue_t v8 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
  }
}

void sub_1000161D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100016378(NSObject **a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000198E4;
  v8[3] = &unk_100071690;
  id v9 = v3;
  long long v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t sub_100016440(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  id v3 = v2;
  if (v1)
  {
    if (v2)
    {
      id v4 = [v2 disposition];
      if (!v4)
      {
LABEL_15:
        uint64_t v1 = 0;
        goto LABEL_16;
      }
      if (v4 == (id)1)
      {
        uint64_t v5 = 40;
        goto LABEL_10;
      }
      if (v4 == (id)2)
      {
        uint64_t v5 = 48;
LABEL_10:
        [*(id *)(v1 + v5) addObject:v3];
        uint64_t v1 = 1;
        goto LABEL_16;
      }
      uint64_t v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136446978;
        long long v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
        __int16 v11 = 1024;
        int v12 = 286;
        __int16 v13 = 2082;
        char v14 = "-[MapsSuggestionsSignalPipeline _addFeeler:]";
        __int16 v15 = 2082;
        long long v16 = "YES";
        unsigned __int8 v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsFeelerDisposition!";
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v9 = 136446978;
        long long v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
        __int16 v11 = 1024;
        int v12 = 266;
        __int16 v13 = 2082;
        char v14 = "-[MapsSuggestionsSignalPipeline _addFeeler:]";
        __int16 v15 = 2082;
        long long v16 = "nil == (feeler)";
        unsigned __int8 v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feeler";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v9, 0x26u);
      }
    }

    goto LABEL_15;
  }
LABEL_16:

  return v1;
}

void sub_100016618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000167C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  id v3 = v2;
  if (v1)
  {
    if (v2)
    {
      [*(id *)(v1 + 40) removeObject:v2];
      [*(id *)(v1 + 48) removeObject:v3];
      uint64_t v1 = 1;
    }
    else
    {
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        int v6 = 136446978;
        unsigned __int8 v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
        __int16 v8 = 1024;
        int v9 = 291;
        __int16 v10 = 2082;
        __int16 v11 = "-[MapsSuggestionsSignalPipeline _removeFeeler:]";
        __int16 v12 = 2082;
        __int16 v13 = "nil == (feeler)";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feeler", (uint8_t *)&v6, 0x26u);
      }

      uint64_t v1 = 0;
    }
  }

  return v1;
}

void sub_1000168F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100016A94(uint64_t a1)
{
  return 1;
}

void sub_100016B60(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = WeakRetained[6];
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:buf count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          unsigned __int8 v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (objc_msgSend((id)objc_opt_class(), "isEnabled", (void)v9)) {
            [v7 startUpdatingSignals];
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v9 objects:buf count:16];
      }
      while (v4);
    }

    sub_100018AE4((uint64_t)v2, 1);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      char v14 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v15 = 1026;
      int v16 = 135;
      __int16 v17 = 2082;
      long long v18 = "-[MapsSuggestionsSignalPipeline start]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100016D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016DFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_100016094((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v6 = 1026;
      int v7 = 146;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsSignalPipeline stop]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100016F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016FC4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] removeAll];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v6 = 1026;
      int v7 = 157;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsSignalPipeline resetData]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_1000170CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100017170(NSObject **a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = sub_100019920;
  __int16 v15 = sub_100019930;
  id v16 = 0;
  int v4 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019938;
  v8[3] = &unk_100071690;
  id v9 = v3;
  long long v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

id sub_10001727C(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  return v1;
}

id *sub_10001745C(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  if (v1)
  {
    id v5 = +[MapsSuggestionsSignalPack extractFromDestinationEntry:originCoordinate:](MapsSuggestionsSignalPack, "extractFromDestinationEntry:originCoordinate:", v4, v2, v3);
    [v1[3] mergeIntoSignalPack:v5];
    id v1 = (id *)[v5 copy];
  }
  return v1;
}

void sub_1000174F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_1000176BC(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  if (v1)
  {
    id v5 = +[MapsSuggestionsSignalPack extractFromDestinationMapItem:originCoordinate:](MapsSuggestionsSignalPack, "extractFromDestinationMapItem:originCoordinate:", v4, v2, v3);
    [v1[3] mergeIntoSignalPack:v5];
    id v1 = (id *)[v5 copy];
  }
  return v1;
}

void sub_100017750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100017AA8(NSObject **a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v4 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001998C;
  v8[3] = &unk_100071690;
  id v9 = v3;
  long long v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  uint64_t v6 = *((char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

id sub_100017B70(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  if (!v1)
  {
    id v12 = 0;
    goto LABEL_17;
  }
  if (!v1[4])
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 495;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationMapItem:originCoordinate:handler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (_algorithm)";
    uint64_t v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal algorithm to be set";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v13, buf, 0x26u);
    goto LABEL_15;
  }
  if (!v6)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 496;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationMapItem:originCoordinate:handler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (handler)";
    uint64_t v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
    goto LABEL_14;
  }
  if (v5)
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = [v1[4] uniqueName];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "GUESS TransportMode using %@", buf, 0xCu);
    }
    id v9 = +[MapsSuggestionsSignalPack extractFromDestinationMapItem:originCoordinate:](MapsSuggestionsSignalPack, "extractFromDestinationMapItem:originCoordinate:", v5, v2, v3);
    [v1[3] mergeIntoSignalPack:v9];
    objc_initWeak(&location, v1);
    id v10 = v1[4];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000195D4;
    *(void *)&buf[24] = &unk_100071758;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    uint64_t v11 = v9;
    *(void *)&buf[32] = v11;
    id v12 = [v10 transportModesForSignalPack:v11 handler:buf];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  uint64_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 497;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationMapItem:originCoordinate:handler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (mapItem)";
    uint64_t v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item";
    goto LABEL_14;
  }
LABEL_15:
  id v12 = 0;
LABEL_16:

LABEL_17:
  return v12;
}

void sub_100017F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1000182A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000182C8(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  double v2 = *(double *)(a1 + 56);
  double v3 = *(double *)(a1 + 64);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = v4;
  if (!v1)
  {
    id v12 = 0;
    goto LABEL_17;
  }
  if (!v1[4])
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 471;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationEntry:originCoordinate:handler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (_algorithm)";
    uint64_t v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal algorithm to be set";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v13, buf, 0x26u);
    goto LABEL_15;
  }
  if (!v6)
  {
    uint64_t v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 472;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationEntry:originCoordinate:handler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (handler)";
    uint64_t v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler";
    goto LABEL_14;
  }
  if (v5)
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = [v1[4] uniqueName];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "GUESS TransportMode using %@", buf, 0xCu);
    }
    id v9 = +[MapsSuggestionsSignalPack extractFromDestinationEntry:originCoordinate:](MapsSuggestionsSignalPack, "extractFromDestinationEntry:originCoordinate:", v5, v2, v3);
    [v1[3] mergeIntoSignalPack:v9];
    objc_initWeak(&location, v1);
    id v10 = v1[4];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000193B0;
    *(void *)&buf[24] = &unk_100071758;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    uint64_t v11 = v9;
    *(void *)&buf[32] = v11;
    id v12 = [v10 transportModesForSignalPack:v11 handler:buf];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  uint64_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 473;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationEntry:originCoordinate:handler:]";
    *(_WORD *)&buf[28] = 2082;
    *(void *)&buf[30] = "nil == (entry)";
    uint64_t v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
    goto LABEL_14;
  }
LABEL_15:
  id v12 = 0;
LABEL_16:

LABEL_17:
  return v12;
}

void sub_100018674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_1000188B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000188C8(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v7 = 1026;
      int v8 = 244;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsSignalPipeline feeler:sendsSignalPack:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
    double v3 = v4;
    goto LABEL_11;
  }
  [a1[4] mergeIntoSignalPack:WeakRetained[3]];
  double v3 = [a1[5] updaterDelegate];
  if (!v3)
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v7 = 1026;
      int v8 = 247;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsSignalPipeline feeler:sendsSignalPack:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongUpdaterDelegate went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

    double v3 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 signalPipelineUpdated:WeakRetained[3]];
  }
LABEL_12:
}

void sub_100018AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018AE4(uint64_t a1, char a2)
{
  double v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Polling Feelers...", buf, 2u);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v44;
    *(void *)&long long v5 = 136446978;
    long long v40 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([(id)objc_opt_class() isEnabled])
        {
          if (a2) {
            goto LABEL_16;
          }
          id v9 = v8;
          id v10 = v9;
          if (v9)
          {
            uint64_t v11 = *(void **)(a1 + 64);
            id v12 = [v9 uniqueName];
            uint64_t v13 = [v11 objectForKeyedSubscript:v12];

            if (v13 && !MapsSuggestionsIsInThePast())
            {
              GEOFindOrCreateLog();
              long long v19 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                long long v20 = [v10 uniqueName];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v20;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "FEELER{%@} skip: too early", buf, 0xCu);
              }
            }
            else
            {
              GEOFindOrCreateLog();
              char v14 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                __int16 v15 = [v10 uniqueName];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "FEELER{%@} is ready to poll", buf, 0xCu);
              }
LABEL_16:
              GEOFindOrCreateLog();
              id v16 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                id v17 = [v8 uniqueName];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v17;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "POLLING FEELER{%@}.", buf, 0xCu);
              }
              [v8 updateSignals];
              id v10 = MapsSuggestionsNowWithOffset();
              id v18 = *(void **)(a1 + 64);
              uint64_t v13 = [v8 uniqueName];
              [v18 setObject:v10 forKeyedSubscript:v13];
            }
          }
          else
          {
            uint64_t v13 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v40;
              *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 410;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsSignalPipeline _shouldPollFeeler:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "nil == (feeler)";
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a polling feeler", buf, 0x26u);
            }
            id v10 = 0;
          }

          continue;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v4);
  }

  long long v21 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Polling Feelers done.", buf, 2u);
  }

  uint64_t v22 = a1;
  if (!*(void *)(a1 + 56))
  {
    long long v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Re-initializing the _pollTimer", buf, 2u);
    }

    objc_initWeak(location, (id)a1);
    long long v24 = *(id *)(a1 + 8);
    dispatch_source_t v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v24);
    long long v26 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v25;

    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    long long v27 = *(NSObject **)(a1 + 56);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100019288;
    *(void *)&buf[24] = &unk_1000715B0;
    objc_copyWeak((id *)&buf[32], location);
    dispatch_source_set_event_handler(v27, buf);
    dispatch_resume(*(dispatch_object_t *)(a1 + 56));
    objc_destroyWeak((id *)&buf[32]);
    objc_destroyWeak(location);
    uint64_t v22 = a1;
  }
  *(_OWORD *)id location = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v28 = objc_msgSend(*(id *)(v22 + 64), "allValues", v40);
  id v29 = 0;
  long long v30 = (char *)[v28 countByEnumeratingWithState:location objects:buf count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v48;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = (void *)*((void *)location[1] + (void)j);
        if (v29)
        {
          uint64_t v34 = [v29 earlierDate:v33];

          id v29 = (id)v34;
        }
        else
        {
          id v29 = v33;
        }
      }
      long long v30 = (char *)[v28 countByEnumeratingWithState:location objects:buf count:16];
    }
    while (v30);
  }

  long long v35 = MapsSuggestionsNow();
  [v29 timeIntervalSinceDate:v35];
  double v37 = v36;

  uint64_t v38 = *(NSObject **)(a1 + 56);
  dispatch_time_t v39 = dispatch_time(0, (uint64_t)(v37 * 1000000000.0));
  dispatch_source_set_timer(v38, v39, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_1000191B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019288(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_100018AE4(WeakRetained, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      long long v5 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v6 = 1026;
      int v7 = 351;
      __int16 v8 = 2082;
      id v9 = "-[MapsSuggestionsSignalPipeline _initPollTimerIfNecessary]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100019394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000193B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [WeakRetained[4] uniqueName];
      int v12 = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v6;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Algorithm %@ error=%@ responded: %@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, NSObject *, id))(v10 + 16))(v10, v5, v11, v6);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      uint64_t v13 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v14 = 1026;
      *(_DWORD *)__int16 v15 = 485;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&void v15[6] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationEntry:originCoordinate:hand"
                           "ler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

void sub_100019590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000195D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [WeakRetained[4] uniqueName];
      int v12 = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      *(void *)__int16 v15 = v6;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Algorithm %@ error=%@ responded: %@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, NSObject *, id))(v10 + 16))(v10, v5, v11, v6);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      uint64_t v13 = "MapsSuggestionsSignalPipeline.mm";
      __int16 v14 = 1026;
      *(_DWORD *)__int16 v15 = 509;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&void v15[6] = "-[MapsSuggestionsSignalPipeline _guessTransportModesForDestinationMapItem:originCoordinate:ha"
                           "ndler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

void sub_1000197B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000198E4(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_100019920(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100019930(uint64_t a1)
{
}

uint64_t sub_100019938(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

uint64_t sub_10001998C(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

double MapsSuggestionsDistanceToRouteConfidenceFactor()
{
  if (qword_100081E40 != -1) {
    dispatch_once(&qword_100081E40, &stru_100071778);
  }
  return *(double *)&qword_100081E20;
}

double MapsSuggestionsConfidenceDefinitelyTrue()
{
  if (qword_100081E40 != -1) {
    dispatch_once(&qword_100081E40, &stru_100071778);
  }
  return *(double *)&qword_100081E28;
}

double MapsSuggestionsConfidenceDefinitelyFalse()
{
  if (qword_100081E40 != -1) {
    dispatch_once(&qword_100081E40, &stru_100071778);
  }
  return *(double *)&qword_100081E30;
}

double MapsSuggestionsConfidenceDontKnow()
{
  if (qword_100081E40 != -1) {
    dispatch_once(&qword_100081E40, &stru_100071778);
  }
  return *(double *)&qword_100081E38;
}

double MapsSuggestionsBestConfidence(double a1, double a2)
{
  if (qword_100081E40 != -1) {
    dispatch_once(&qword_100081E40, &stru_100071778);
  }
  if (*(double *)&qword_100081E38 != a1)
  {
    if (*(double *)&qword_100081E38 == a2)
    {
      return a1;
    }
    else if (a1 > a2)
    {
      return a1;
    }
  }
  return a2;
}

void MapsSuggestionsConfidenceLevelFromPrecent(double a1)
{
  if (a1 <= 0.0)
  {
    if (qword_100081E40 == -1) {
      return;
    }
    goto LABEL_5;
  }
  if (qword_100081E40 != -1) {
LABEL_5:
  }
    dispatch_once(&qword_100081E40, &stru_100071778);
}

void sub_10001A204(id a1)
{
  GEOConfigGetDouble();
  qword_100081E28 = v1;
  GEOConfigGetDouble();
  qword_100081E30 = v2;
  GEOConfigGetDouble();
  GEOConfigGetDouble();
  GEOConfigGetDouble();
  qword_100081E38 = v3;
  GEOConfigGetDouble();
  GEOConfigGetDouble();
  qword_100081E20 = v4;
}

void sub_10001A3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_10001A86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_10001A8B0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    if (+[MapsSuggestionsSiri isEnabled])
    {
      if (a2 == 1)
      {
        id v6 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "fetchLocationsOfInterestOfType:Work", (uint8_t *)buf, 2u);
        }
        uint64_t v7 = 17;
      }
      else
      {
        if (a2)
        {
          uint64_t v7 = 16;
          goto LABEL_16;
        }
        id v6 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "fetchLocationsOfInterestOfType:Home", (uint8_t *)buf, 2u);
        }
        uint64_t v7 = 16;
      }

LABEL_16:
      objc_initWeak(buf, a1);
      dispatch_group_enter(v5);
      id v9 = +[RTRoutineManager defaultManager];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10001AC8C;
      v10[3] = &unk_1000717F0;
      objc_copyWeak(v12, buf);
      uint64_t v11 = v5;
      v12[1] = (id)v7;
      [v9 fetchLocationsOfInterestOfType:a2 withHandler:v10];

      objc_destroyWeak(v12);
      objc_destroyWeak(buf);
      goto LABEL_17;
    }
    __int16 v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps", (uint8_t *)buf, 2u);
    }
  }
LABEL_17:
}

void sub_10001AAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AB0C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = GEOFindOrCreateLog();
  uint64_t v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_sendCurrentSignalPack", (uint8_t *)&v6, 2u);
    }

    uint64_t v4 = [WeakRetained delegate];
    id v5 = [WeakRetained[3] copy];
    [v4 feeler:WeakRetained sendsSignalPack:v5];
  }
  else
  {
    id v5 = v2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      uint64_t v7 = "MapsSuggestionsRoutineFeeler.m";
      __int16 v8 = 1026;
      int v9 = 141;
      __int16 v10 = 2082;
      uint64_t v11 = "-[MapsSuggestionsRoutineFeeler _sendCurrentSignalPackWithGroup:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
    uint64_t v4 = v5;
  }
}

void sub_10001AC8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      __int16 v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not get PLOIs from CoreRoutine: %@", buf, 0xCu);
      }

LABEL_6:
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      goto LABEL_14;
    }
    id v10 = [v5 count];
    uint64_t v11 = GEOFindOrCreateLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (!v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CoreRoutine returned no entries", buf, 2u);
      }

      goto LABEL_6;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      long long v21 = (char *)[v5 count];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CoreRoutine returned %lu entries", buf, 0xCu);
    }

    uint64_t v13 = WeakRetained[5];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001AF8C;
    v16[3] = &unk_1000717C8;
    objc_copyWeak(v19, (id *)(a1 + 40));
    id v14 = v5;
    __int16 v15 = *(void **)(a1 + 48);
    id v17 = v14;
    v19[1] = v15;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v13, v16);

    objc_destroyWeak(v19);
  }
  else
  {
    GEOFindOrCreateLog();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v21 = "MapsSuggestionsRoutineFeeler.m";
      __int16 v22 = 1026;
      int v23 = 171;
      __int16 v24 = 2082;
      dispatch_source_t v25 = "-[MapsSuggestionsRoutineFeeler _fetchLocationsOfInterestOfType:group:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_14:
}

void sub_10001AF8C(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = *(id *)(v1 + 32);
    id v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v21 = v1;
      uint64_t v6 = *(void *)v23;
      float v7 = NAN;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          int v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v10 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            double v28 = *(double *)&v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Locations of Interest %@", buf, 0xCu);
          }

          uint64_t v11 = [v9 location];
          [v11 latitude];
          double v13 = v12;
          id v14 = [v9 location];
          [v14 longitude];
          float v16 = sub_10001B32C(v13, v15);

          if (v7 >= v16)
          {
            id v17 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              double v28 = v7;
              __int16 v29 = 2048;
              *(double *)long long v30 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Found a closer LOI. PrevDistance is %f . Distance is %f", buf, 0x16u);
            }

            float v7 = v16;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);

      uint64_t v1 = v21;
      id v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v28 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Writing Signal Value %f", buf, 0xCu);
      }

      *(float *)&double v19 = v7;
      [WeakRetained[3] writeSignalValue:*(void *)(v21 + 56) forType:v19];
    }
    else
    {
    }
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    long long v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v28 = COERCE_DOUBLE("MapsSuggestionsRoutineFeeler.m");
      __int16 v29 = 1026;
      *(_DWORD *)long long v30 = 184;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "-[MapsSuggestionsRoutineFeeler _fetchLocationsOfInterestOfType:group:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

double sub_10001B32C(double a1, double a2)
{
  id v4 = MapsSuggestionsCurrentBestLocation();
  if (v4)
  {
    id v5 = [objc_alloc((Class)CLLocation) initWithLatitude:a1 longitude:a2];
    [v4 distanceFromLocation:v5];
    double v7 = v6;
  }
  else
  {
    __int16 v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Current Location is nil. Cannot calculate distance from CurrentLocation", v10, 2u);
    }

    double v7 = NAN;
  }

  return v7;
}

void sub_10001B40C(uint64_t a1, char *a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v7 = GEOFindOrCreateLog();
    __int16 v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not fetch Routine Mode for Tourist Info from CR %{public}@", buf, 0xCu);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v15 = a2;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CoreRoutine's tourist mode is: %ld", buf, 0xCu);
      }

      id v10 = WeakRetained[5];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001B678;
      block[3] = &unk_100071818;
      objc_copyWeak(v13, (id *)(a1 + 40));
      v13[1] = a2;
      id v12 = *(id *)(a1 + 32);
      dispatch_async(v10, block);

      objc_destroyWeak(v13);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v15 = "MapsSuggestionsRoutineFeeler.m";
      __int16 v16 = 1026;
      int v17 = 243;
      __int16 v18 = 2082;
      double v19 = "-[MapsSuggestionsRoutineFeeler _updateTouristInfoWithGroup:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001B678(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v4 = *(void *)(a1 + 48);
    if (v4 >= 3)
    {
      double v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v7 = 136446978;
        __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRoutineFeeler.m";
        __int16 v9 = 1024;
        int v10 = 223;
        __int16 v11 = 2082;
        id v12 = "MapsSuggestionsSignalValue _signalValueFromRoutineMode(RTRoutineMode)";
        __int16 v13 = 2082;
        id v14 = "YES";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported RTRoutineMode!", (uint8_t *)&v7, 0x26u);
      }

      LODWORD(v3) = 2143289344;
    }
    else
    {
      LODWORD(v3) = dword_100056500[v4];
    }
    [WeakRetained[3] writeSignalValue:12 forType:v3];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "MapsSuggestionsRoutineFeeler.m";
      __int16 v9 = 1026;
      int v10 = 251;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsRoutineFeeler _updateTouristInfoWithGroup:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10001B864(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      __int16 v8 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      long long v20 = v6;
      __int16 v9 = "Could not get ParkedCar from CoreRoutine: %@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
    }
    else
    {
      if ([v5 count])
      {
        id v14 = WeakRetained[5];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001BB0C;
        block[3] = &unk_100071868;
        objc_copyWeak(&v18, (id *)(a1 + 40));
        id v16 = v5;
        id v17 = *(id *)(a1 + 32);
        dispatch_async(v14, block);

        objc_destroyWeak(&v18);
        goto LABEL_12;
      }
      __int16 v8 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_6;
      }
      *(_WORD *)buf = 0;
      __int16 v9 = "Routine returned no parked car entries";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      uint32_t v12 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    goto LABEL_6;
  }
  GEOFindOrCreateLog();
  __int16 v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    long long v20 = "MapsSuggestionsRoutineFeeler.m";
    __int16 v21 = 1026;
    int v22 = 266;
    __int16 v23 = 2082;
    long long v24 = "-[MapsSuggestionsRoutineFeeler _updateParkedCarWithGroup:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_12:
}

void sub_10001BB0C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = *(id *)(a1 + 32);
    id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v20;
      float v7 = NAN;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          __int16 v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v10 = objc_msgSend(v9, "location", (void)v19);
          [v10 latitude];
          double v12 = v11;
          __int16 v13 = [v9 location];
          [v13 longitude];
          float v15 = sub_10001B32C(v12, v14);

          if (v7 >= v15) {
            float v7 = v15;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);

      id v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Writing Signal Value for Parked Car %f", buf, 0xCu);
      }

      *(float *)&double v17 = v7;
      [WeakRetained[3] writeSignalValue:18 forType:v17];
    }
    else
    {
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v25 = COERCE_DOUBLE("MapsSuggestionsRoutineFeeler.m");
      __int16 v26 = 1026;
      int v27 = 279;
      __int16 v28 = 2082;
      __int16 v29 = "-[MapsSuggestionsRoutineFeeler _updateParkedCarWithGroup:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001BF8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C024(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10001C398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_10001C3F8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error loading Transit Pass from Wallet: %@", buf, 0xCu);
    }
  }
  else
  {
    float v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = "no";
      if (a2) {
        __int16 v8 = "yes";
      }
      *(_DWORD *)buf = 136315138;
      __int16 v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Found Transit Pass = %s", buf, 0xCu);
    }

    __int16 v9 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001C764;
    v10[3] = &unk_1000718B0;
    char v11 = a2;
    sub_10001C5B8((NSObject **)(a1 + 40), v9, v10);
  }
}

void sub_10001C598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C5B8(NSObject **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    float v7 = v5;
    __int16 v8 = *a1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001CE18;
    v10[3] = &unk_100071910;
    char v11 = v7;
    id v12 = v6;
    dispatch_async(v8, v10);

    __int16 v9 = v11;
  }
  else
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      double v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      __int16 v15 = 1024;
      int v16 = 208;
      __int16 v17 = 2082;
      id v18 = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsWalletFeeler]";
      __int16 v19 = 2082;
      long long v20 = "nil == (callerSelf)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
    }
  }
}

void sub_10001C74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C764(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 32)) {
    *(float *)&double v3 = 1.0;
  }
  [v4[6] writeSignalValue:28 forType:v3];
  sub_10001C7EC(v4);
}

void sub_10001C7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C7EC(id *a1)
{
  if (a1)
  {
    id v3 = [a1 delegate];
    id v2 = [a1[6] copy];
    [v3 feeler:a1 sendsSignalPack:v2];
  }
}

void sub_10001C870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10001C890(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 48) = result;
  return result;
}

void sub_10001C8CC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
}

void sub_10001C908(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error loading Express Payment Card from Wallet: %@", buf, 0xCu);
    }
  }
  else
  {
    float v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = "no";
      if (a2) {
        __int16 v8 = "yes";
      }
      *(_DWORD *)buf = 136315138;
      __int16 v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Found Express Payment Card = %s", buf, 0xCu);
    }

    __int16 v9 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001CAC8;
    v10[3] = &unk_1000718B0;
    char v11 = a2;
    sub_10001C5B8((NSObject **)(a1 + 40), v9, v10);
  }
}

void sub_10001CAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CAC8(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 32)) {
    *(float *)&double v3 = 1.0;
  }
  [v4[6] writeSignalValue:34 forType:v3];
  sub_10001C7EC(v4);
}

void sub_10001CB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001CB50(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error loading Payment Card from Wallet: %@", buf, 0xCu);
    }
  }
  else
  {
    float v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = "no";
      if (a2) {
        __int16 v8 = "yes";
      }
      *(_DWORD *)buf = 136315138;
      __int16 v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Found Payment Card = %s", buf, 0xCu);
    }

    __int16 v9 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001CD10;
    v10[3] = &unk_1000718B0;
    char v11 = a2;
    sub_10001C5B8((NSObject **)(a1 + 40), v9, v10);
  }
}

void sub_10001CCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CD10(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 32)) {
    *(float *)&double v3 = 1.0;
  }
  [v4[6] writeSignalValue:35 forType:v3];
  sub_10001C7EC(v4);
}

void sub_10001CD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001CE18(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "self went away in MSg::Queue::async()", v4, 2u);
    }
  }
}

void sub_10001CEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D6F0(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = GEOFindOrCreateLog();
  id v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [WeakRetained uniqueName];
      float v7 = NSStringFromMapsSuggestionsCurrentBestLocation();
      *(_DWORD *)buf = 138412802;
      __int16 v17 = v6;
      __int16 v18 = 2112;
      *(void *)__int16 v19 = @"ALL";
      *(_WORD *)&v19[8] = 2112;
      *(void *)&v19[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
    }
    __int16 v8 = (void *)WeakRetained[1];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = WeakRetained[2];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    id v13[2] = sub_10001D964;
    v13[3] = &unk_100071938;
    objc_copyWeak(&v15, v2);
    char v11 = *(void **)(a1 + 48);
    v13[4] = *(void *)(a1 + 40);
    id v14 = v11;
    [v8 fetchLocationEntriesForTray:1 currentLocation:v9 queue:v10 handler:v13];

    objc_destroyWeak(&v15);
  }
  else
  {
    id v12 = v4;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v17 = "MapsSuggestionsPortraitSource.m";
      __int16 v18 = 1026;
      *(_DWORD *)__int16 v19 = 97;
      *(_WORD *)&v19[4] = 2082;
      *(void *)&v19[6] = "-[MapsSuggestionsPortraitSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001D948(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001D964(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      __int16 v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v6 localizedDescription];
        int v19 = 138412290;
        long long v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received an error inside _fetchEntries: %@", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        char v11 = [*(id *)(a1 + 32) uniqueName];
        int v19 = 138412546;
        long long v20 = v11;
        __int16 v21 = 2080;
        v22[0] = "updateSuggestionEntriesWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v19, 0x16u);
      }
      id v12 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v12))
      {
        LOWORD(v19) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v19, 2u);
      }
    }
    if (v5) {
      __int16 v13 = v5;
    }
    else {
      __int16 v13 = &__NSArray0__struct;
    }
    [WeakRetained addOrUpdateMySuggestionEntries:v13];
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [WeakRetained uniqueName];
      int v19 = 138412546;
      long long v20 = v15;
      __int16 v21 = 2080;
      v22[0] = "updateSuggestionEntriesWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v19, 0x16u);
    }
    int v16 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v16))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v19, 2u);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446722;
      long long v20 = "MapsSuggestionsPortraitSource.m";
      __int16 v21 = 1026;
      LODWORD(v22[0]) = 104;
      WORD2(v22[0]) = 2082;
      *(void *)((char *)v22 + 6) = "-[MapsSuggestionsPortraitSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v19, 0x1Cu);
    }
  }
}

void sub_10001E494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_10001E53C(void *a1, unsigned int a2)
{
  if (a1)
  {
    double v3 = a1;
    objc_sync_enter(v3);
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[MapsSuggestionsCarPlayFeeler _updateAndSendSignalPackWithValue:]";
      __int16 v10 = 1024;
      unsigned int v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s: %d", (uint8_t *)&v8, 0x12u);
    }

    *(float *)&double v5 = (float)a2;
    [v3[3] writeSignalValue:20 forType:v5];
    id v6 = [v3 delegate];
    id v7 = [v3[3] copy];
    [v6 feeler:v3 sendsSignalPack:v7];

    objc_sync_exit(v3);
  }
}

void sub_10001E67C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class sub_10001E888(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100081E50)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10001E9DC;
    v4[4] = &unk_1000719C0;
    v4[5] = v4;
    long long v5 = off_1000719A8;
    uint64_t v6 = 0;
    qword_100081E50 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_100081E50)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CARSessionStatus");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_100081E48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001E9DC()
{
  uint64_t result = _sl_dlopen();
  qword_100081E50 = result;
  return result;
}

void sub_10001EAA4(id a1)
{
  id v3 = [objc_alloc((Class)NSMutableSet) initWithCapacity:30];
  MapsSuggestionsSignalTypeEnumerate();
  id v1 = [v3 copy];
  id v2 = (void *)qword_100081E58;
  qword_100081E58 = (uint64_t)v1;
}

void sub_10001EB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001EB74(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = NSStringFromMapsSuggestionsSignalType();
  [v1 addObject:v2];

  return 1;
}

void sub_10001EBB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ECF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001F268(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    long long v5 = (void *)v3[3];
    if (!v5)
    {
      GEOFindOrCreateLog();
      uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [v4 uniqueName];
        *(_DWORD *)buf = 138412546;
        long long v46 = v7;
        __int16 v47 = 2080;
        *(void *)long long v48 = "Loading ML model";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
      }
      int v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Loading ML model", "", buf, 2u);
      }

      uint64_t v9 = objc_alloc_init(MapsSuggestionsTransportModePrediction);
      __int16 v10 = (void *)v4[3];
      v4[3] = v9;

      GEOFindOrCreateLog();
      unsigned int v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = [v4 uniqueName];
        *(_DWORD *)buf = 138412546;
        long long v46 = v12;
        __int16 v47 = 2080;
        *(void *)long long v48 = "Loading ML model";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      __int16 v13 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Loading ML model", "", buf, 2u);
      }

      long long v5 = (void *)v4[3];
    }
    id v14 = v5;
  }
  else
  {
    id v14 = 0;
  }
  __int16 v42 = v14;
  id v15 = [*(id *)(a1 + 32) encodedFeatureDictionary];
  id v43 = 0;
  int v16 = [[_FeatureProvider alloc] initWithDictionary:v15 error:&v43];
  id v17 = v43;
  if (v16)
  {
    uint64_t v41 = v16;
    __int16 v18 = objc_msgSend(v14, "predictionFromFeatures:error:");
    id v19 = v17;

    GEOFindOrCreateLog();
    long long v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = [v18 actualTransportMode];
      long long v22 = [v18 actualTransportModeProbability];
      *(_DWORD *)buf = 138412802;
      long long v46 = v21;
      __int16 v47 = 2112;
      *(void *)long long v48 = v22;
      *(_WORD *)&v48[8] = 2112;
      *(void *)&v48[10] = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Result: %@, %@, error: %@", buf, 0x20u);
    }
    GEOFindOrCreateLog();
    __int16 v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = [v4 uniqueName];
      *(_DWORD *)buf = 138412546;
      long long v46 = v24;
      __int16 v47 = 2080;
      *(void *)long long v48 = "transportModesForSignalPack_ML";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    double v25 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transportModesForSignalPack_ML", "", buf, 2u);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    if (!v26) {
      goto LABEL_46;
    }
    id v27 = [v18 actualTransportMode];
    __int16 v28 = v27;
    if (v27)
    {
      if ([v27 isEqualToString:@"DRIVING_MODE"])
      {
        uint64_t v29 = 0;
LABEL_45:

        dispatch_time_t v39 = +[NSNumber numberWithInt:v29];
        long long v44 = v39;
        long long v40 = +[NSArray arrayWithObjects:&v44 count:1];
        (*(void (**)(uint64_t, void *, void))(v26 + 16))(v26, v40, 0);

LABEL_46:
        goto LABEL_47;
      }
      if ([v28 isEqualToString:@"TRANSIT_MODE"])
      {
        uint64_t v29 = 1;
        goto LABEL_45;
      }
      if ([v28 isEqualToString:@"CYCLING_MODE"])
      {
        uint64_t v29 = 3;
        goto LABEL_45;
      }
      if ([v28 isEqualToString:@"WALKING_MODE"])
      {
        uint64_t v29 = 2;
        goto LABEL_45;
      }
      if ([v28 isEqualToString:@"RIDESHARE_MODE"])
      {
        uint64_t v29 = 6;
        goto LABEL_45;
      }
      long long v35 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v46 = (const char *)v28;
        double v36 = "Unknown Transport Type String: %@";
        double v37 = v35;
        uint32_t v38 = 12;
        goto LABEL_35;
      }
    }
    else
    {
      long long v35 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        long long v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMLSignalAlgorithm.mm";
        __int16 v47 = 1024;
        *(_DWORD *)long long v48 = 91;
        *(_WORD *)&v48[4] = 2082;
        *(void *)&v48[6] = "GEOTransportType _convert(NSString *__strong)";
        *(_WORD *)&v48[14] = 2082;
        *(void *)&v48[16] = "nil == (transportTypeString)";
        double v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a transport type string";
        double v37 = v35;
        uint32_t v38 = 38;
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, v36, buf, v38);
      }
    }

    uint64_t v29 = 4;
    goto LABEL_45;
  }
  long long v30 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v46 = (const char *)v17;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "Could not create featureProvider: %@", buf, 0xCu);
  }

  GEOFindOrCreateLog();
  uint64_t v31 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    long long v32 = [v4 uniqueName];
    *(_DWORD *)buf = 138412546;
    long long v46 = v32;
    __int16 v47 = 2080;
    *(void *)long long v48 = "transportModesForSignalPack_ML";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
  }
  long long v33 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transportModesForSignalPack_ML", "", buf, 2u);
  }

  uint64_t v34 = *(void *)(a1 + 40);
  if (v34) {
    (*(void (**)(uint64_t, void, id))(v34 + 16))(v34, 0, v17);
  }
  id v19 = v17;
LABEL_47:
}

void sub_10001FAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10001FC40(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "self went away in MSg::Queue::async()", v4, 2u);
    }
  }
}

void sub_10001FCEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020078(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    id v4 = *(id *)(a1 + 24);
    objc_sync_enter(v4);
    id v5 = [v7 mutableCopy];
    uint64_t v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v5;

    objc_sync_exit(v4);
    id v3 = v7;
  }
}

void sub_1000200F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_100020110(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    id v5 = [v7 mutableCopy];
    uint64_t v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    objc_sync_exit(v4);
    id v3 = v7;
  }
}

void sub_100020188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10002046C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000204D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    [*(id *)(a1 + 32) addObject:v5];
    objc_sync_exit(v4);

    id v3 = v5;
  }
}

void sub_100020540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

id *sub_1000205BC(id *a1)
{
  id v1 = a1;
  if (a1)
  {
    id v2 = a1[3];
    objc_sync_enter(v2);
    id v1 = (id *)[v1[3] count];
    objc_sync_exit(v2);
  }
  return v1;
}

void sub_10002060C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id *sub_100020680(id *a1)
{
  id v1 = a1;
  if (a1)
  {
    id v2 = a1[4];
    objc_sync_enter(v2);
    id v1 = (id *)[v1[4] count];
    objc_sync_exit(v2);
  }
  return v1;
}

void sub_1000206D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100020D9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

void sub_1000211F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000212F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002159C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002174C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002207C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000222E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000228C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000229E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023010(_Unwind_Exception *a1)
{
  int v8 = v7;

  _Unwind_Resume(a1);
}

void sub_100023120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000231E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000236F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000238CC(id a1)
{
  GEOConfigGetDouble();
  qword_100081E70 = v1;
  GEOConfigGetDouble();
  qword_100081E68 = v2;
}

void sub_100023A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MapsSuggestionsPredictionsXPCPeer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100023CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023F24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (char *)*((void *)WeakRetained + 2);
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "PredictionsXPCPeer{%@} received predictedTransportModeForDestinationEntryData:originCoordinateData:handler", buf, 0xCu);
    }

    id v5 = +[MapsSuggestionsEntry entryWithData:*(void *)(a1 + 32)];
    CLLocationCoordinateFromNSData();
    double v8 = v6;
    double v9 = v7;
    if (v5 && CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v6))
    {
      __int16 v10 = objc_loadWeakRetained((id *)WeakRetained + 3);
      unsigned int v11 = v10;
      if (v10)
      {
        id v12 = [v10 signalPipeline];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100024388;
        v17[3] = &unk_100071A78;
        __int16 v18 = *(id *)(a1 + 48);
        objc_msgSend(v12, "guessTransportModesForDestinationEntry:originCoordinate:handler:", v5, v17, v8, v9);

        __int16 v13 = v18;
LABEL_20:

        goto LABEL_21;
      }
      GEOFindOrCreateLog();
      __int16 v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        __int16 v21 = "MapsSuggestionsPredictionsServer.mm";
        __int16 v22 = 1026;
        *(_DWORD *)__int16 v23 = 91;
        *(_WORD *)&v23[4] = 2082;
        *(void *)&v23[6] = "-[MapsSuggestionsPredictionsXPCPeer predictedTransportModeForDestinationEntryData:originCoo"
                             "rdinateData:handler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v19 = 0;
      __int16 v13 = MapsSuggestionsTransportModesToNSData();
      unsigned int v11 = 0;
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        __int16 v21 = *(char **)&v8;
        __int16 v22 = 2048;
        *(double *)__int16 v23 = v9;
        *(_WORD *)&v23[8] = 2112;
        *(void *)&v23[10] = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Either Coordinate is not valid or the Entry is nil. Coordinate: %g, %g, MSgEntry: %@", buf, 0x20u);
      }

      uint64_t v15 = *(void *)(a1 + 48);
      if (v11)
      {
        (*(void (**)(uint64_t, void, void, NSObject *))(v15 + 16))(v15, 0, 0, v11);
        goto LABEL_20;
      }
      int v16 = +[NSError GEOErrorWithCode:-12 reason:@"Could not decode the MapsSuggestionsEntry and/or Location data!"];
      (*(void (**)(uint64_t, NSObject *, void, void *))(v15 + 16))(v15, v13, 0, v16);
    }
    unsigned int v11 = 0;
    goto LABEL_20;
  }
  GEOFindOrCreateLog();
  unsigned int v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v21 = "MapsSuggestionsPredictionsServer.mm";
    __int16 v22 = 1026;
    *(_DWORD *)__int16 v23 = 69;
    *(_WORD *)&v23[4] = 2082;
    *(void *)&v23[6] = "-[MapsSuggestionsPredictionsXPCPeer predictedTransportModeForDestinationEntryData:originCoordin"
                         "ateData:handler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }
  id v5 = v11;
LABEL_21:
}

void sub_100024314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024388(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    __int16 v10 = MapsSuggestionsTransportModesToNSData();
    id v11 = 0;
    uint64_t v12 = *(void *)(a1 + 32);
    if (v11)
    {
      (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v11);
    }
    else
    {
      __int16 v13 = [v8 data];
      (*(void (**)(uint64_t, void *, void *, void))(v12 + 16))(v12, v10, v13, 0);
    }
  }
}

void sub_10002449C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000246C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000246E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (char *)*((void *)WeakRetained + 2);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "PredictionsXPCPeer{%@} received predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:", buf, 0xCu);
    }

    id v5 = [objc_alloc((Class)GEOMapItemStorage) initWithData:*(void *)(a1 + 32)];
    CLLocationCoordinateFromNSData();
    double v7 = v6;
    double v9 = v8;
    __int16 v10 = [objc_alloc((Class)CLLocation) initWithLatitude:v6 longitude:v8];
    id v11 = v10;
    if (v5 && v10)
    {
      id v12 = objc_loadWeakRetained((id *)WeakRetained + 3);
      id v13 = v12;
      if (v12)
      {
        id v14 = [v12 signalPipeline];
        __int16 v22 = _NSConcreteStackBlock;
        uint64_t v23 = 3221225472;
        long long v24 = sub_100024C24;
        double v25 = &unk_100071A78;
        uint64_t v26 = *(id *)(a1 + 48);
        unsigned int v15 = objc_msgSend(v14, "guessTransportModesForDestinationMapItem:originCoordinate:handler:", v5, &v22, v7, v9);

        if (!v15)
        {
          int v16 = +[NSError GEOErrorWithCode:-301, @"SignalPipeline refused to call back.", v22, v23, v24, v25 reason];
          id v17 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "SignalPipeline refused to call back", buf, 2u);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        __int16 v18 = v26;
        goto LABEL_24;
      }
      GEOFindOrCreateLog();
      __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v29 = "MapsSuggestionsPredictionsServer.mm";
        __int16 v30 = 1026;
        *(_DWORD *)uint64_t v31 = 141;
        *(_WORD *)&v31[4] = 2082;
        *(void *)&v31[6] = "-[MapsSuggestionsPredictionsXPCPeer predictedTransportModeForDestinationMapItemData:originC"
                             "oordinateData:handler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", buf, 0x1Cu);
      }
    }
    else
    {
      uint64_t v27 = 0;
      __int16 v18 = MapsSuggestionsTransportModesToNSData();
      id v13 = 0;
      uint64_t v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v29 = *(char **)&v7;
        __int16 v30 = 2048;
        *(double *)uint64_t v31 = v9;
        *(_WORD *)&v31[8] = 2112;
        *(void *)&v31[10] = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Either Coordinate is not valid or the MapItem is nil. Coordinate: %g, %g, MapItemData: %@", buf, 0x20u);
      }

      uint64_t v20 = *(void *)(a1 + 48);
      if (v13)
      {
        (*(void (**)(uint64_t, void, void, id))(v20 + 16))(v20, 0, 0, v13);
LABEL_24:

        goto LABEL_25;
      }
      __int16 v21 = +[NSError GEOErrorWithCode:-12 reason:@"Could not decode the MapItem and/or Location data!"];
      (*(void (**)(uint64_t, NSObject *, void, void *))(v20 + 16))(v20, v18, 0, v21);
    }
    id v13 = 0;
    goto LABEL_24;
  }
  GEOFindOrCreateLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v29 = "MapsSuggestionsPredictionsServer.mm";
    __int16 v30 = 1026;
    *(_DWORD *)uint64_t v31 = 118;
    *(_WORD *)&v31[4] = 2082;
    *(void *)&v31[6] = "-[MapsSuggestionsPredictionsXPCPeer predictedTransportModeForDestinationMapItemData:originCoord"
                         "inateData:handler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }
  id v5 = v11;
LABEL_25:
}

void sub_100024B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100024C24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    __int16 v10 = MapsSuggestionsTransportModesToNSData();
    id v11 = 0;
    uint64_t v12 = *(void *)(a1 + 32);
    if (v11)
    {
      (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v11);
    }
    else
    {
      id v13 = [v8 data];
      (*(void (**)(uint64_t, void *, void *, void))(v12 + 16))(v12, v10, v13, 0);
    }
  }
}

void sub_100024D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000256B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  _Unwind_Resume(a1);
}

id sub_1000257E0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void sub_1000257EC(id *a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    if (v3)
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v5 = [v3 connection];
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPC connection %@ became invalid", buf, 0xCu);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100025AE8;
      block[3] = &unk_100071AC8;
      id v9 = a1[4];
      double v6 = v3;
      __int16 v10 = v6;
      id v11 = WeakRetained;
      dispatch_sync(WeakRetained[3], block);
      [(dispatch_queue_t *)WeakRetained _debugPrintOverviewOfConnections];

      id v7 = v9;
    }
    else
    {
      GEOFindOrCreateLog();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v13 = "MapsSuggestionsPredictionsServer.mm";
        __int16 v14 = 1026;
        int v15 = 226;
        __int16 v16 = 2082;
        id v17 = "-[MapsSuggestionsPredictionsServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      double v6 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v13 = "MapsSuggestionsPredictionsServer.mm";
      __int16 v14 = 1026;
      int v15 = 225;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsPredictionsServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    double v6 = v7;
  }
}

void sub_100025A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025AE8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 48) + 8);
    [v5 removeObject:v4];
  }
}

void sub_100025B54(id *a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    if (v3)
    {
      GEOFindOrCreateLog();
      uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v5 = [v3 connection];
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPC connection %@ was interrupted", buf, 0xCu);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100025E50;
      block[3] = &unk_100071AC8;
      id v9 = a1[4];
      double v6 = v3;
      __int16 v10 = v6;
      id v11 = WeakRetained;
      dispatch_sync(WeakRetained[3], block);
      [(dispatch_queue_t *)WeakRetained _debugPrintOverviewOfConnections];

      id v7 = v9;
    }
    else
    {
      GEOFindOrCreateLog();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v13 = "MapsSuggestionsPredictionsServer.mm";
        __int16 v14 = 1026;
        int v15 = 238;
        __int16 v16 = 2082;
        id v17 = "-[MapsSuggestionsPredictionsServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      double v6 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v13 = "MapsSuggestionsPredictionsServer.mm";
      __int16 v14 = 1026;
      int v15 = 237;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsPredictionsServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    double v6 = v7;
  }
}

void sub_100025E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100025E50(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 48) + 8);
    [v5 removeObject:v4];
  }
}

void sub_100025FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000263AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002642C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000265F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000267F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000269F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100026B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MapsSuggestionsFeelerXPCPeer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100026C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026F84(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [objc_alloc((Class)GEOMapItemStorage) initWithData:*(void *)(a1 + 32)];
    CLLocationCoordinateFromNSData();
    if (v3 && (v6 = v4, double v7 = v5, CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v4)))
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 4);
      id v9 = [v8 signalPipeline];
      __int16 v10 = objc_msgSend(v9, "mergedSignalPackForDestinationMapItem:originCoordinate:", v3, v6, v7);

      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = [v10 data];
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      __int16 v10 = +[NSError GEOErrorWithCode:-12 reason:@"Could not decode the MapItem data and/or coordinates!"];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v10);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      __int16 v16 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v17 = 1026;
      int v18 = 76;
      __int16 v19 = 2082;
      uint64_t v20 = "-[MapsSuggestionsFeelerXPCPeer signalPackForDestinationMapItemData:originCoordinateData:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

void sub_100027184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000274C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000274F0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = +[MapsSuggestionsEntry entryWithData:*(void *)(a1 + 32)];
    CLLocationCoordinateFromNSData();
    if (v3 && (v6 = v4, double v7 = v5, CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v4)))
    {
      id v8 = objc_loadWeakRetained(WeakRetained + 4);
      id v9 = [v8 signalPipeline];
      __int16 v10 = objc_msgSend(v9, "mergedSignalPackForDestinationEntry:originCoordinate:", v3, v6, v7);

      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = [v10 data];
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      __int16 v10 = +[NSError GEOErrorWithCode:-12 reason:@"Could not decode the Entry data and/or coordinates!"];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v10);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      __int16 v16 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v17 = 1026;
      int v18 = 102;
      __int16 v19 = 2082;
      uint64_t v20 = "-[MapsSuggestionsFeelerXPCPeer signalPackForDestinationEntryData:originCoordinateData:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

void sub_1000276F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027960(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 4);
    double v5 = [v4 signalPipeline];
    double v6 = [v5 mergedCommonSignalPack];

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v6 data];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      uint64_t v11 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v12 = 1026;
      int v13 = 125;
      __int16 v14 = 2082;
      int v15 = "-[MapsSuggestionsFeelerXPCPeer signalPackForLocation:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void sub_100027AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100027E84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeConnection:*(void *)(a1 + 40)];
}

void sub_100028034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  _Unwind_Resume(a1);
}

id sub_100028B8C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void sub_100028B98(id *a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    if (v3)
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        double v5 = [v3 connection];
        *(_DWORD *)buf = 138412290;
        int v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPC connection %@ became invalid", buf, 0xCu);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100028E94;
      block[3] = &unk_100071AC8;
      id v9 = a1[4];
      double v6 = v3;
      int v10 = v6;
      uint64_t v11 = WeakRetained;
      dispatch_sync(WeakRetained[4], block);
      [(dispatch_queue_t *)WeakRetained _debugPrintOverviewOfConnections];

      uint64_t v7 = v9;
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        int v13 = "MapsSuggestionsSignalPipelineServer.mm";
        __int16 v14 = 1026;
        int v15 = 261;
        __int16 v16 = 2082;
        __int16 v17 = "-[MapsSuggestionsSignalPipelineServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      double v6 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v13 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v14 = 1026;
      int v15 = 260;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsSignalPipelineServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    double v6 = v7;
  }
}

void sub_100028E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028E94(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 48);
    double v5 = [*(id *)(a1 + 40) connection];
    [v4 _removeConnection:v5];

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 48) + 8);
    [v7 removeObject:v6];
  }
}

void sub_100028F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028F30(id *a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    if (v3)
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        double v5 = [v3 connection];
        *(_DWORD *)buf = 138412290;
        int v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPC connection %@ was interrupted", buf, 0xCu);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002922C;
      block[3] = &unk_100071AC8;
      id v9 = a1[4];
      uint64_t v6 = v3;
      int v10 = v6;
      uint64_t v11 = WeakRetained;
      dispatch_sync(WeakRetained[4], block);
      [(dispatch_queue_t *)WeakRetained _debugPrintOverviewOfConnections];

      uint64_t v7 = v9;
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        int v13 = "MapsSuggestionsSignalPipelineServer.mm";
        __int16 v14 = 1026;
        int v15 = 274;
        __int16 v16 = 2082;
        __int16 v17 = "-[MapsSuggestionsSignalPipelineServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      uint64_t v6 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v13 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v14 = 1026;
      int v15 = 273;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsSignalPipelineServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    uint64_t v6 = v7;
  }
}

void sub_1000291DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002922C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 48);
    double v5 = [*(id *)(a1 + 40) connection];
    [v4 _removeConnection:v5];

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 48) + 8);
    [v7 removeObject:v6];
  }
}

void sub_1000292B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000292C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _addConnection:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      uint64_t v6 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v7 = 1026;
      int v8 = 288;
      __int16 v9 = 2082;
      int v10 = "-[MapsSuggestionsSignalPipelineServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_1000293D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1000294A8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    int v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "XPC Error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100029568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002974C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    int v4 = WeakRetained[2];
    id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "_sendSignalPack:toConnection:", *(void *)(a1 + 32), *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        }
        id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v14 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v15 = 1026;
      int v16 = 334;
      __int16 v17 = 2082;
      int v18 = "-[MapsSuggestionsSignalPipelineServer signalPipelineUpdated:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000298FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_100029FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v28 - 104));
  _Unwind_Resume(a1);
}

void sub_10002A008(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateForConnectionState:1];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsVehicleBluetoothFeeler.m";
      __int16 v6 = 1026;
      int v7 = 63;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsVehicleBluetoothFeeler initWithDelegate:name:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10002A114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateForConnectionState:2];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsVehicleBluetoothFeeler.m";
      __int16 v6 = 1026;
      int v7 = 68;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsVehicleBluetoothFeeler initWithDelegate:name:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10002A220(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateForConnectionState:2];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsVehicleBluetoothFeeler.m";
      __int16 v6 = 1026;
      int v7 = 74;
      __int16 v8 = 2082;
      long long v9 = "-[MapsSuggestionsVehicleBluetoothFeeler initWithDelegate:name:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10002A48C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10002A4A8(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = v1[15];
  objc_sync_exit(v1);

  return v2;
}

void sub_10002A734(id a1)
{
  qword_100081E80 = [[WeatherSettingsManager alloc] initSharedManager];
  _objc_release_x1();
}

void sub_10002AB88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002ACD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002AEA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    if ([WeakRetained isRepeating])
    {
      uint64_t v3 = +[NSDate dateWithTimeIntervalSinceNow:*(double *)(a1 + 48)];
      int v4 = (void *)v5[3];
      v5[3] = v3;
    }
    else
    {
      [v5 invalidate];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void sub_10002B3D0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = sub_10002C070();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      __int16 v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      __int16 v19 = v5;
      __int16 v20 = 2112;
      __int16 v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ %@, weather id location = %@", buf, 0x20u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = objc_msgSend(WeakRetained[1], "copy", 0);
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        __int16 v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) weatherLocationDataProvider:WeakRetained didChangeLocation:*(void *)(a1 + 40)];
          __int16 v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

void sub_10002B870(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), off_1000819B8);
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

  objc_setAssociatedObject(*(id *)(a1 + 32), off_1000819B8, 0, (void *)1);
  objc_setAssociatedObject(*(id *)(a1 + 32), off_1000819B0, 0, (void *)3);
}

id sub_10002BF04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10002BF10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v10[0] = a2;
  id v7 = a2;
  long long v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4);
  v10[1] = v8;
  long long v9 = +[NSArray arrayWithObjects:v10 count:2];
  [v6 addObject:v9];
}

id sub_10002C058(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_10002C064(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_10002C070()
{
  if (qword_100081F80 != -1) {
    dispatch_once(&qword_100081F80, &stru_100071D40);
  }
  uint64_t v0 = (void *)qword_100081F78;
  return v0;
}

void sub_10002C0C4(id a1)
{
  qword_100081F78 = (uint64_t)os_log_create("com.apple.Maps", "Weather");
  _objc_release_x1();
}

void sub_10002C7E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_10002CCAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = (char *)*((void *)WeakRetained + 2);
      int v11 = 138412290;
      __int16 v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "DonationsXPCPeer{%@} to remove an entry.", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v6 = +[MapsSuggestionsETA ETAWithData:*(void *)(a1 + 32)];
    id v7 = objc_loadWeakRetained((id *)WeakRetained + 3);
    if (v7)
    {
      long long v8 = v7;
      [v7 setETA:v6 destinationKey:*(void *)(a1 + 40)];
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        (*(void (**)(void))(v9 + 16))();
      }
    }
    else
    {
      GEOFindOrCreateLog();
      long long v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446722;
        __int16 v12 = "MapsSuggestionsDonationsServer.m";
        __int16 v13 = 1026;
        int v14 = 80;
        __int16 v15 = 2082;
        long long v16 = "-[MapsSuggestionsDonationsXPCPeer donateETAData:destinationKey:handler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
      }

      long long v8 = 0;
    }
  }
  else
  {
    long long v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      __int16 v12 = "MapsSuggestionsDonationsServer.m";
      __int16 v13 = 1026;
      int v14 = 77;
      __int16 v15 = 2082;
      long long v16 = "-[MapsSuggestionsDonationsXPCPeer donateETAData:destinationKey:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
    uint64_t v6 = v8;
  }
}

void sub_10002D0B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = (char *)*((void *)WeakRetained + 2);
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      __int16 v13 = v5;
      __int16 v14 = 2112;
      v15[0] = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "DonationsXPCPeer{%@} Received signalPackData{%@}", (uint8_t *)&v12, 0x16u);
    }

    id v7 = objc_loadWeakRetained((id *)WeakRetained + 3);
    if (v7)
    {
      long long v8 = v7;
      uint64_t v9 = +[MapsSuggestionsSignalPack signalPackFromData:*(void *)(a1 + 32)];
      long long v10 = [v8 mapsAppFeeler];
      [v10 sendSignalPack:v9];

      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(void))(v11 + 16))();
      }
    }
    else
    {
      GEOFindOrCreateLog();
      uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136446722;
        __int16 v13 = "MapsSuggestionsDonationsServer.m";
        __int16 v14 = 1026;
        LODWORD(v15[0]) = 97;
        WORD2(v15[0]) = 2082;
        *(void *)((char *)v15 + 6) = "-[MapsSuggestionsDonationsXPCPeer donateSignalPackData:handler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
      }

      long long v8 = 0;
    }
  }
  else
  {
    uint64_t v9 = v3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      __int16 v13 = "MapsSuggestionsDonationsServer.m";
      __int16 v14 = 1026;
      LODWORD(v15[0]) = 95;
      WORD2(v15[0]) = 2082;
      *(void *)((char *)v15 + 6) = "-[MapsSuggestionsDonationsXPCPeer donateSignalPackData:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
    }
    long long v8 = v9;
  }
}

void sub_10002D960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v28 - 160));
  _Unwind_Resume(a1);
}

id sub_10002D9B4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void sub_10002D9C0(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v3 connection];
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPC connection %@ became invalid", buf, 0xCu);
    }
    uint64_t v6 = WeakRetained[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002DBDC;
    block[3] = &unk_100071DB8;
    long long v10 = a1[4];
    id v11 = v3;
    int v12 = WeakRetained;
    id v7 = v3;
    dispatch_sync(v6, block);
    [WeakRetained _debugPrintOverviewOfConnections];

    long long v8 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    long long v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v14 = "MapsSuggestionsDonationsServer.m";
      __int16 v15 = 1026;
      int v16 = 165;
      __int16 v17 = 2082;
      int v18 = "-[MapsSuggestionsDonationsServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v7 = v8;
  }
}

void sub_10002DBDC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 48) + 8);
    [v5 removeObject:v4];
  }
}

void sub_10002DC48(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    uint64_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v3 connection];
      *(_DWORD *)buf = 138412290;
      __int16 v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPC connection %@ was interrupted", buf, 0xCu);
    }
    uint64_t v6 = WeakRetained[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002DE64;
    block[3] = &unk_100071DB8;
    long long v10 = a1[4];
    id v11 = v3;
    int v12 = WeakRetained;
    id v7 = v3;
    dispatch_sync(v6, block);
    [WeakRetained _debugPrintOverviewOfConnections];

    long long v8 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    long long v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v14 = "MapsSuggestionsDonationsServer.m";
      __int16 v15 = 1026;
      int v16 = 177;
      __int16 v17 = 2082;
      int v18 = "-[MapsSuggestionsDonationsServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v7 = v8;
  }
}

void sub_10002DE64(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 48) + 8);
    [v5 removeObject:v4];
  }
}

void sub_10002E6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_10002E7E8(id *a1)
{
  return a1;
}

BOOL sub_10002E8A8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) count] != 0;
}

id sub_10002EA24(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
}

id sub_10002EBA4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = v1;
  if (!v1) {
    uint64_t v1 = &__NSArray0__struct;
  }
  id v3 = v1;

  return v3;
}

void sub_10002EE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002EE6C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) copy];
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];

  return 1;
}

void sub_10002EEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002F124(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v5);
        id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "objectForKeyedSubscript:", *(void *)(a1 + 48), (void)v9);
        [v7 removeObject:v6];

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  return 1;
}

void sub_10002F23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002F444(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 32);
  id v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  char v3 = 0;
  if (v2)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      id v15 = v2;
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        id v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v6 = v5;
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v17;
          do
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v17 != v8) {
                objc_enumerationMutation(v6);
              }
              long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
              long long v11 = MapsSuggestionsDestinationKey();
              if ([*(id *)(a1 + 40) isEqualToString:v11])
              {
                [v10 setETA:*(void *)(a1 + 48) forKey:@"MapsSuggestionsETAKey"];
                char v3 = 1;
              }
            }
            id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v7);
        }
      }
      id v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v2);
  }

  return v3 & 1;
}

void sub_10002F640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_10002F8F0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_10002FAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FB0C(id a1, MapsSuggestionsDaemonMemory *a2)
{
}

void sub_10002FB90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002FC0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id sub_10002FC9C(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
}

uint64_t sub_10002FD70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002FD80(uint64_t a1)
{
}

uint64_t sub_10002FD88(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

uint64_t sub_10002FDDC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

uint64_t sub_10002FE30(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return _objc_release_x1();
}

void sub_10002FE84(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "self went away in MSg::Queue::async()", v4, 2u);
    }
  }
}

void sub_10002FF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000301E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003045C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030484(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "considerMyAllowanceAsLimited:", objc_msgSend(a1[4], "_limitsPrecision"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    char v3 = a1[5];
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v11;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(char **)(*((void *)&v10 + 1) + 8 * i);
          if (MapsSuggestionsLoggingIsVerbose())
          {
            uint64_t v8 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v16 = v7;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Considering new location: %@", buf, 0xCu);
            }
          }
          if (MapsSuggestionsIsValidLocation())
          {
            [WeakRetained considerMyNewLocation:v7];
          }
          else
          {
            long long v9 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v16 = v7;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Dropping invalid location: %@", buf, 0xCu);
            }
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    char v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v16 = "MapsSuggestionsLeechingLocationUpdater.mm";
      __int16 v17 = 1026;
      int v18 = 101;
      __int16 v19 = 2082;
      long long v20 = "-[MapsSuggestionsLeechingLocationUpdater locationManager:didUpdateLocations:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100030738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003089C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000309C0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v3 - 40));

  _Unwind_Resume(a1);
}

void sub_1000309DC(uint64_t a1)
{
  if (MapsSuggestionsIsValidVisit())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      -[NSObject considerMyAllowanceAsLimited:](WeakRetained, "considerMyAllowanceAsLimited:", [*(id *)(a1 + 40) _limitsPrecision]);
      [WeakRetained considerMyNewVisit:*(void *)(a1 + 32)];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        id v6 = "MapsSuggestionsLeechingLocationUpdater.mm";
        __int16 v7 = 1026;
        int v8 = 144;
        __int16 v9 = 2082;
        long long v10 = "-[MapsSuggestionsLeechingLocationUpdater locationManager:didVisit:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }

      id WeakRetained = 0;
    }
  }
  else
  {
    id WeakRetained = GEOFindOrCreateLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(char **)(a1 + 32);
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Dropping invalid visit: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_100030B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100030F9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_retainBlock(*(id *)(a1 + 32));
    id v4 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = v3;

    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (char *)*((void *)WeakRetained + 5);
      int v9 = 138412290;
      long long v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} starting...", (uint8_t *)&v9, 0xCu);
    }

    [*((id *)WeakRetained + 1) addMonitoredXPCConnection:*((void *)WeakRetained + 5)];
    __int16 v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = (char *)*((void *)WeakRetained + 5);
      int v9 = 138412290;
      long long v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} started.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      long long v10 = "MapsSuggestionsSourcesServer.m";
      __int16 v11 = 1026;
      int v12 = 133;
      __int16 v13 = 2082;
      uint64_t v14 = "-[MapsSuggestionsSourcesXPCPeer startMonitoringWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

id sub_100031344(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 _stopMonitoring];
}

void sub_100031584(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (char *)*((void *)WeakRetained + 5);
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} got forced updated.", (uint8_t *)&v7, 0xCu);
    }

    [*((id *)WeakRetained + 1) forceEarlyUpdateForType:*(void *)(a1 + 48) forXPCConnection:*((void *)WeakRetained + 5) handler:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsSourcesServer.m";
      __int16 v9 = 1026;
      int v10 = 163;
      __int16 v11 = 2082;
      int v12 = "-[MapsSuggestionsSourcesXPCPeer forceEarlyUpdateForType:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10003190C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (char *)*((void *)WeakRetained + 5);
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPCPeer{%@} got removeEntryData.", (uint8_t *)&v7, 0xCu);
    }

    [*((id *)WeakRetained + 1) removeEntryData:*(void *)(a1 + 32) behavior:*(void *)(a1 + 56) forXPCConnection:*((void *)WeakRetained + 5) handler:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsSourcesServer.m";
      __int16 v9 = 1026;
      int v10 = 179;
      __int16 v11 = 2082;
      int v12 = "-[MapsSuggestionsSourcesXPCPeer removeEntryData:behavior:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100031BE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (char *)*((void *)WeakRetained + 5);
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPCPeer{%@} got feedbackForEntryData.", (uint8_t *)&v7, 0xCu);
    }

    [*((id *)WeakRetained + 1) feedbackForEntryData:*(void *)(a1 + 32) action:*(void *)(a1 + 48) forXPCConnection:*((void *)WeakRetained + 5)];
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsSourcesServer.m";
      __int16 v9 = 1026;
      int v10 = 195;
      __int16 v11 = 2082;
      int v12 = "-[MapsSuggestionsSourcesXPCPeer feedbackForEntryData:action:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100031EC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (char *)*((void *)WeakRetained + 5);
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPCPeer{%@} got feedbackForMapItem.", (uint8_t *)&v7, 0xCu);
    }

    [*((id *)WeakRetained + 1) feedbackForMapItem:*(void *)(a1 + 32) action:*(void *)(a1 + 48) forXPCConnection:*((void *)WeakRetained + 5)];
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsSourcesServer.m";
      __int16 v9 = 1026;
      int v10 = 210;
      __int16 v11 = 2082;
      int v12 = "-[MapsSuggestionsSourcesXPCPeer feedbackForMapItem:action:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_1000321A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = (char *)*((void *)WeakRetained + 5);
      int v7 = 138412290;
      int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "XPCPeer{%@} got feedbackForContact.", (uint8_t *)&v7, 0xCu);
    }

    [*((id *)WeakRetained + 1) feedbackForContact:*(void *)(a1 + 32) action:*(void *)(a1 + 48) forXPCConnection:*((void *)WeakRetained + 5)];
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsSourcesServer.m";
      __int16 v9 = 1026;
      int v10 = 225;
      __int16 v11 = 2082;
      int v12 = "-[MapsSuggestionsSourcesXPCPeer feedbackForContact:action:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100032670(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = GEOFindOrCreateLog();
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (char *)*((void *)WeakRetained + 5);
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "XPCPeer{%@} got updateGraph.", buf, 0xCu);
    }

    uint64_t v31 = *(void *)(a1 + 32);
    int v5 = (void *)*((void *)WeakRetained + 2);
    id v6 = [*((id *)WeakRetained + 1) source];
    id v7 = v5;
    int v8 = v6;
    __int16 v9 = v8;
    long long v32 = v7;
    if (v7)
    {
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v29 = v9;
          __int16 v30 = MapsSuggestionsCurrentBestLocation();
          if (v30)
          {
            int v10 = -[MapsSuggestionsDestinationGraphUpdater initWithDestinationGraph:]([MapsSuggestionsDestinationGraphUpdater alloc], "initWithDestinationGraph:", v7, context);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            __int16 v11 = [v29 children];
            id v12 = [v11 countByEnumeratingWithState:&v44 objects:buf count:16];
            if (v12)
            {
              char v13 = 0;
              uint64_t v14 = *(void *)v45;
              do
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(void *)v45 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  long long v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                  if ([v16 conformsToProtocol:&OBJC_PROTOCOL___MapsSuggestionsPreloadableSource])
                  {
                    [(MapsSuggestionsDestinationGraphUpdater *)v10 addPreloadableSource:v16];
                    char v13 = 1;
                  }
                }
                id v12 = [v11 countByEnumeratingWithState:&v44 objects:buf count:16];
              }
              while (v12);

              if (v13)
              {
                uint64_t v40 = 0;
                uint64_t v41 = &v40;
                uint64_t v42 = 0x2020000000;
                char v43 = 0;
                id v17 = objc_alloc((Class)NSDateInterval);
                int v18 = MapsSuggestionsNow();
                GEOConfigGetDouble();
                id v19 = objc_msgSend(v17, "initWithStartDate:duration:", v18);

                *(void *)uint64_t v34 = _NSConcreteStackBlock;
                uint64_t v35 = 3221225472;
                double v36 = sub_100034890;
                double v37 = &unk_100071FF8;
                dispatch_time_t v39 = &v40;
                long long v20 = dispatch_semaphore_create(0);
                uint32_t v38 = v20;
                if ([(MapsSuggestionsDestinationGraphUpdater *)v10 rebuildForPeriod:v19 location:v30 handler:v34])
                {
                  GEOConfigGetDouble();
                  dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
                  if (!dispatch_semaphore_wait(v20, v22))
                  {
                    BOOL v26 = *((unsigned char *)v41 + 24) != 0;
                    goto LABEL_47;
                  }
                  long long v23 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long v48 = 136315138;
                    long long v49 = "_rebuildGraph";
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Timeout on %s", v48, 0xCu);
                  }
                }
                else
                {
                  long long v23 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long v48 = 136315138;
                    long long v49 = "_rebuildGraph";
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "DestinationGraphUpdater did not like our input in %s", v48, 0xCu);
                  }
                }

                BOOL v26 = 0;
LABEL_47:

                _Block_object_dispose(&v40, 8);
                goto LABEL_43;
              }
            }
            else
            {
            }
            uint64_t v27 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uint64_t v34 = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Our DestinationGraphUpdater doesn't have any Sources to preload", v34, 2u);
            }
          }
          else
          {
            GEOFindOrCreateLog();
            int v10 = (MapsSuggestionsDestinationGraphUpdater *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v51 = "_rebuildGraph";
              _os_log_impl((void *)&_mh_execute_header, &v10->super, OS_LOG_TYPE_ERROR, "Got no current location to work with in %s", buf, 0xCu);
            }
          }
          BOOL v26 = 0;
LABEL_43:

          long long v24 = v29;
          goto LABEL_34;
        }
        long long v24 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136446978;
          uint64_t v51 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
          __int16 v52 = 1024;
          int v53 = 34;
          __int16 v54 = 2082;
          uint64_t v55 = "BOOL _rebuildGraph(MapsSuggestionsDestinationGraph *__strong, __strong id<MapsSuggestionsSource>)";
          __int16 v56 = 2082;
          uint64_t v57 = "! [source isKindOfClass:[MapsSuggestionsCompositeSource class]]";
          double v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Only supports CompositeSource at the moment";
          goto LABEL_32;
        }
LABEL_33:
        BOOL v26 = 0;
LABEL_34:

        (*(void (**)(uint64_t, BOOL))(v31 + 16))(v31, v26);
        goto LABEL_35;
      }
      long long v24 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136446978;
      uint64_t v51 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v52 = 1024;
      int v53 = 33;
      __int16 v54 = 2082;
      uint64_t v55 = "BOOL _rebuildGraph(MapsSuggestionsDestinationGraph *__strong, __strong id<MapsSuggestionsSource>)";
      __int16 v56 = 2082;
      uint64_t v57 = "nil == (source)";
      double v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source";
    }
    else
    {
      long long v24 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136446978;
      uint64_t v51 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v52 = 1024;
      int v53 = 32;
      __int16 v54 = 2082;
      uint64_t v55 = "BOOL _rebuildGraph(MapsSuggestionsDestinationGraph *__strong, __strong id<MapsSuggestionsSource>)";
      __int16 v56 = 2082;
      uint64_t v57 = "nil == (graph)";
      double v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination graph";
    }
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, v25, buf, 0x26u);
    goto LABEL_33;
  }
  __int16 v9 = v2;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v51 = "MapsSuggestionsSourcesServer.m";
    __int16 v52 = 1026;
    int v53 = 263;
    __int16 v54 = 2082;
    uint64_t v55 = "-[MapsSuggestionsSourcesXPCPeer updateGraphWithHandler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_35:
}

void sub_100032E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_100034040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v30 - 160));
  _Unwind_Resume(a1);
}

id sub_100034094(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

void sub_1000340A0(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    id v4 = GEOFindOrCreateLog();
    int v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [v3 connection];
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "XPC connection %@ became invalid", buf, 0xCu);
      }
      id v7 = WeakRetained[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100034344;
      block[3] = &unk_100071DB8;
      __int16 v11 = a1[4];
      int v8 = v3;
      id v12 = v8;
      char v13 = WeakRetained;
      dispatch_sync(v7, block);
      [WeakRetained _debugPrintOverviewOfConnections];

      __int16 v9 = v11;
    }
    else
    {
      __int16 v9 = v4;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v15 = "MapsSuggestionsSourcesServer.m";
        __int16 v16 = 1026;
        int v17 = 390;
        __int16 v18 = 2082;
        id v19 = "-[MapsSuggestionsSourcesServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      int v8 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "MapsSuggestionsSourcesServer.m";
      __int16 v16 = 1026;
      int v17 = 389;
      __int16 v18 = 2082;
      id v19 = "-[MapsSuggestionsSourcesServer listener:shouldAcceptNewConnection:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    int v8 = v9;
  }
}

void sub_100034344(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    [*(id *)(*(void *)(a1 + 48) + 16) removeObject:*(void *)(a1 + 40)];
    id v4 = *(void **)(a1 + 40);
    _[v4 stopMonitoringWithHandler:&stru_100071FD0];
  }
}

void sub_1000343C0(id a1)
{
  uint64_t v1 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Force stopMonitoring", v2, 2u);
  }
}

void sub_10003443C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    id v4 = GEOFindOrCreateLog();
    int v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [v3 connection];
        *(_DWORD *)buf = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "XPC connection %@ was interrupted", buf, 0xCu);
      }
      id v7 = WeakRetained[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000346E0;
      block[3] = &unk_100071DB8;
      __int16 v11 = a1[4];
      int v8 = v3;
      id v12 = v8;
      char v13 = WeakRetained;
      dispatch_sync(v7, block);
      [WeakRetained _debugPrintOverviewOfConnections];

      __int16 v9 = v11;
    }
    else
    {
      __int16 v9 = v4;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v15 = "MapsSuggestionsSourcesServer.m";
        __int16 v16 = 1026;
        int v17 = 405;
        __int16 v18 = 2082;
        id v19 = "-[MapsSuggestionsSourcesServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      int v8 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "MapsSuggestionsSourcesServer.m";
      __int16 v16 = 1026;
      int v17 = 404;
      __int16 v18 = 2082;
      id v19 = "-[MapsSuggestionsSourcesServer listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    int v8 = v9;
  }
}

void sub_1000346E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(void **)(*(void *)(a1 + 48) + 16);
    [v5 removeObject:v4];
  }
}

intptr_t sub_100034890(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_1000348A4(int a1)
{
  id v2 = objc_opt_new();
  id v3 = v2;
  if (a1)
  {
    [v2 addObject:@"gasoline"];
    if ((a1 & 0x100) == 0)
    {
LABEL_3:
      if ((a1 & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a1 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"diesel"];
  if ((a1 & 0x10000) == 0)
  {
LABEL_4:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 addObject:@"electric"];
  if ((a1 & 0x1000000) != 0) {
LABEL_5:
  }
    [v3 addObject:@"cng"];
LABEL_6:
  return v3;
}

id sub_100034948(int a1)
{
  uint64_t v1 = sub_1000348A4(a1);
  id v2 = [v1 componentsJoinedByString:@", "];

  return v2;
}

id sub_1000349A0(void *a1)
{
  uint64_t v1 = qword_100081EA0;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_100081EA0, &stru_100072020);
  }
  id v3 = [(id)qword_100081E98 objectForKeyedSubscript:v2];

  id v4 = [v3 longLongValue];
  return v4;
}

void sub_100034A1C(id a1)
{
  v3[0] = @"gasoline";
  v3[1] = @"diesel";
  v4[0] = &off_100074DE0;
  v4[1] = &off_100074DF8;
  v3[2] = @"electric";
  v3[3] = @"cng";
  v4[2] = &off_100074E10;
  v4[3] = &off_100074E28;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_100081E98;
  qword_100081E98 = v1;
}

void sub_100034BE8(id a1)
{
  v7[0] = &off_100074DE0;
  v7[1] = &off_100074DF8;
  v8[0] = EAVehicleInfoRangeGasolineKey;
  v8[1] = EAVehicleInfoRangeDieselKey;
  v7[2] = &off_100074E10;
  v7[3] = &off_100074E28;
  v8[2] = EAVehicleInfoRangeElectricKey;
  v8[3] = EAVehicleInfoRangeCNGKey;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  id v2 = (void *)qword_100081EA8;
  qword_100081EA8 = v1;

  v5[0] = &off_100074DE0;
  v5[1] = &off_100074DF8;
  v6[0] = EAVehicleInfoHasLowDistanceRangeGasolineKey;
  v6[1] = EAVehicleInfoHasLowDistanceRangeDieselKey;
  v5[2] = &off_100074E10;
  v5[3] = &off_100074E28;
  v6[2] = EAVehicleInfoHasLowDistanceRangeElectricKey;
  v6[3] = EAVehicleInfoHasLowDistanceRangeCNGKey;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  id v4 = (void *)qword_100081EB0;
  qword_100081EB0 = v3;
}

void sub_1000353EC(id a1)
{
  uint64_t v1 = (void *)qword_100081EB8;
  qword_100081EB8 = (uint64_t)&off_100075010;
}

uint64_t sub_1000357BC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  GEOConfigGetPropertiesForKey();

  return 1;
}

void sub_100035858(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3 && _GEOConfigHasValue())
  {
    id v4 = +[NSNumber numberWithInteger:GEOConfigGetInteger()];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  }
}

id sub_100035A34()
{
  if (qword_100081F00 != -1) {
    dispatch_once(&qword_100081F00, &stru_100072158);
  }
  uint64_t v0 = (void *)qword_100081EF8;
  return v0;
}

void sub_1000361F8(id a1)
{
  qword_100081EC8 = objc_alloc_init(MapsExternalAccessory);
  _objc_release_x1();
}

void sub_100036750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v16 - 128));
  _Unwind_Resume(a1);
}

void sub_1000367E0(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidConnect:v3];
}

void sub_10003683C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidUpdateVehicle:v3];
}

void sub_100036898(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidUpdate:v3];
}

void sub_1000368F4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidDisconnect:v3];
}

void sub_100036CF0(id a1)
{
  uint64_t v1 = objc_opt_new();
  char v13 = sub_1000348A4(16843009);
  v25[0] = @"com.apple.maps.FakeExternalAccessory.engine.type";
  v25[1] = @"com.apple.maps.FakeExternalAccessory.engine.low";
  void v25[2] = @"com.apple.maps.FakeExternalAccessory.engine.full";
  +[NSArray arrayWithObjects:v25 count:3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      id v2 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v2);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v4 = v13;
        id v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v16;
          do
          {
            int v8 = 0;
            do
            {
              if (*(void *)v16 != v7) {
                objc_enumerationMutation(v4);
              }
              __int16 v9 = +[NSString stringWithFormat:@"%@.%@", v3, *(void *)(*((void *)&v15 + 1) + 8 * (void)v8)];
              [v1 addObject:v9];

              int v8 = (char *)v8 + 1;
            }
            while (v6 != v8);
            id v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v6);
        }

        id v2 = (char *)v2 + 1;
      }
      while (v2 != v14);
      id v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  int v10 = (void *)qword_100081ED8;
  qword_100081ED8 = (uint64_t)v1;
}

id sub_100036F24(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "_handleFake:");
}

void sub_100037310(id a1)
{
  qword_100081EF0 = objc_opt_new();
  _objc_release_x1();
}

void sub_100038124(id a1)
{
  qword_100081EF8 = (uint64_t)os_log_create("com.apple.Maps", "CarExternalAccessory");
  _objc_release_x1();
}

void sub_1000382DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038374(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100038600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_100038644(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error loading current trip from Portrait: %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [v5 count];
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = "no";
      if (v8) {
        int v10 = "yes";
      }
      *(_DWORD *)buf = 136315138;
      long long v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did we find a current trip in the PortraitFeeler? %s", buf, 0xCu);
    }

    __int16 v11 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    id v12[2] = sub_1000389E8;
    uint64_t v12[3] = &unk_100072178;
    BOOL v13 = v8 != 0;
    sub_10003883C((NSObject **)(a1 + 40), v11, v12);
  }
}

void sub_100038818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003883C(NSObject **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = *a1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_100038E14;
    v10[3] = &unk_100071910;
    __int16 v11 = v7;
    id v12 = v6;
    dispatch_async(v8, v10);

    __int16 v9 = v11;
  }
  else
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      __int16 v15 = 1024;
      int v16 = 208;
      __int16 v17 = 2082;
      long long v18 = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsPortraitFeeler]";
      __int16 v19 = 2082;
      long long v20 = "nil == (callerSelf)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
    }
  }
}

void sub_1000389D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000389E8(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 32)) {
    *(float *)&double v3 = 1.0;
  }
  [v4[6] writeSignalValue:37 forType:v3];
  sub_100038A70(v4);
}

void sub_100038A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038A70(id *a1)
{
  if (a1)
  {
    id v3 = [a1 delegate];
    id v2 = [a1[6] copy];
    [v3 feeler:a1 sendsSignalPack:v2];
  }
}

void sub_100038AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038B14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error loading future trip from Portrait: %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [v5 count];
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = "no";
      if (v8) {
        int v10 = "yes";
      }
      *(_DWORD *)buf = 136315138;
      __int16 v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did we find a future trip in the PortraitFeeler? %s", buf, 0xCu);
    }

    __int16 v11 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    id v12[2] = sub_100038D0C;
    uint64_t v12[3] = &unk_100072178;
    BOOL v13 = v8 != 0;
    sub_10003883C((NSObject **)(a1 + 40), v11, v12);
  }
}

void sub_100038CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038D0C(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 32)) {
    *(float *)&double v3 = 1.0;
  }
  [v4[6] writeSignalValue:36 forType:v3];
  sub_100038A70(v4);
}

void sub_100038D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038E14(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "self went away in MSg::Queue::async()", v4, 2u);
    }
  }
}

void sub_100038EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039458(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_100039950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_100039B68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100039D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_100039D90(void *a1)
{
  if (a1)
  {
    id v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "-[MapsSuggestionsMapsSyncFeeler _updateFavoriteTransitLineSignal]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1);
    double v3 = (void *)a1[4];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100039F00;
    v4[3] = &unk_100072228;
    objc_copyWeak(&v5, (id *)buf);
    [v3 userHasFavoriteTransitLinesWithHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)buf);
  }
}

void sub_100039EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100039F00(uint64_t a1, char a2)
{
  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003A0AC;
    v8[3] = &unk_100072200;
    objc_copyWeak(&v9, v3);
    char v10 = a2;
    [v6 asyncBlock:v8];
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v12 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v13 = 1026;
      int v14 = 55;
      __int16 v15 = 2082;
      int v16 = "-[MapsSuggestionsMapsSyncFeeler _updateFavoriteTransitLineSignal]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: queueStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10003A090(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003A0AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 3);
    double v5 = 0.0;
    if (*(unsigned char *)(a1 + 40)) {
      *(float *)&double v5 = 1.0;
    }
    [v4 writeSignalValue:30 forType:v5];
    sub_10003A1E0(v3);
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v9 = 1026;
      int v10 = 57;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsMapsSyncFeeler _updateFavoriteTransitLineSignal]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10003A1E0(id val)
{
  objc_initWeak(&location, val);
  id v2 = (void *)*((void *)val + 5);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003B2D8;
  v3[3] = &unk_1000717A0;
  objc_copyWeak(&v4, &location);
  [v2 asyncBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_10003A290(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10003A2AC(void *a1)
{
  if (a1)
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "-[MapsSuggestionsMapsSyncFeeler _updateFavoriteTransitPOISignal]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1);
    double v3 = (void *)a1[4];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003A41C;
    v4[3] = &unk_100072228;
    objc_copyWeak(&v5, (id *)buf);
    [v3 userHasFavoriteTransitPOIsWithHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)buf);
  }
}

void sub_10003A3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A41C(uint64_t a1, char a2)
{
  double v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003A5C8;
    v8[3] = &unk_100072200;
    objc_copyWeak(&v9, v3);
    char v10 = a2;
    [v6 asyncBlock:v8];
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v12 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v13 = 1026;
      int v14 = 72;
      __int16 v15 = 2082;
      int v16 = "-[MapsSuggestionsMapsSyncFeeler _updateFavoriteTransitPOISignal]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: queueStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10003A5AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003A5C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)*((void *)WeakRetained + 3);
    double v5 = 0.0;
    if (*(unsigned char *)(a1 + 40)) {
      *(float *)&double v5 = 1.0;
    }
    [v4 writeSignalValue:29 forType:v5];
    sub_10003A1E0(v3);
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v9 = 1026;
      int v10 = 74;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsMapsSyncFeeler _updateFavoriteTransitPOISignal]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10003A6FC(void *a1)
{
  if (a1)
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v7 = "-[MapsSuggestionsMapsSyncFeeler _updateTimeSinceLastTransitRouteSignal]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1);
    double v3 = (void *)a1[4];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003A86C;
    v4[3] = &unk_100072250;
    objc_copyWeak(&v5, (id *)buf);
    [v3 durationSinceLastTransitHistoryRoute:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak((id *)buf);
  }
}

void sub_10003A848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A86C(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v9 = (void *)*((void *)WeakRetained + 5);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003AA40;
    v11[3] = &unk_100071818;
    objc_copyWeak(v13, v6);
    id v12 = v5;
    v13[1] = *(id *)&a3;
    [v9 asyncBlock:v11];

    objc_destroyWeak(v13);
  }
  else
  {
    GEOFindOrCreateLog();
    int v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v15 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v16 = 1026;
      int v17 = 89;
      __int16 v18 = 2082;
      __int16 v19 = "-[MapsSuggestionsMapsSyncFeeler _updateTimeSinceLastTransitRouteSignal]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: queueStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10003AA24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003AA40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 3);
    if (*(void *)(a1 + 32))
    {
      LODWORD(v3) = 2143289344;
    }
    else
    {
      double v3 = *(double *)(a1 + 48);
      *(float *)&double v3 = v3;
    }
    [v5 writeSignalValue:32 forType:v3];
    sub_10003A1E0(v4);
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v9 = 1026;
      int v10 = 91;
      __int16 v11 = 2082;
      id v12 = "-[MapsSuggestionsMapsSyncFeeler _updateTimeSinceLastTransitRouteSignal]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10003AC48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10003AC64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    switch(*(void *)(a1 + 40))
    {
      case 0:
        id v4 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          int v5 = 136446978;
          id v6 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncFeeler.m";
          __int16 v7 = 1024;
          int v8 = 126;
          __int16 v9 = 2082;
          int v10 = "-[MapsSuggestionsMapsSyncFeeler mapsSync:didChangeForContentType:]_block_invoke";
          __int16 v11 = 2082;
          id v12 = "YES";
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense here", (uint8_t *)&v5, 0x26u);
        }
        goto LABEL_8;
      case 1:
        sub_10003A6FC(WeakRetained);
        break;
      case 2:
        sub_100039D90(WeakRetained);
        break;
      case 3:
        sub_10003A2AC(WeakRetained);
        break;
      default:
        break;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v7 = 1026;
      int v8 = 111;
      __int16 v9 = 2082;
      int v10 = "-[MapsSuggestionsMapsSyncFeeler mapsSync:didChangeForContentType:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }

LABEL_8:
  }
}

void sub_10003AF3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10003AF58(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[4] addMapsSyncObserver:WeakRetained forContentType:1];
    [v2[4] addMapsSyncObserver:v2 forContentType:3];
    [v2[4] addMapsSyncObserver:v2 forContentType:2];
    [v2 updateSignals];
  }
  else
  {
    GEOFindOrCreateLog();
    double v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v6 = 1026;
      int v7 = 153;
      __int16 v8 = 2082;
      __int16 v9 = "-[MapsSuggestionsMapsSyncFeeler startUpdatingSignals]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10003B14C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10003B168(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[4] removeMapsSyncObserver:WeakRetained forContentType:1];
    [v2[4] removeMapsSyncObserver:v2 forContentType:3];
    [v2[4] removeMapsSyncObserver:v2 forContentType:2];
  }
  else
  {
    GEOFindOrCreateLog();
    double v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v6 = 1026;
      int v7 = 171;
      __int16 v8 = 2082;
      __int16 v9 = "-[MapsSuggestionsMapsSyncFeeler stopUpdatingSignals]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10003B2D8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = GEOFindOrCreateLog();
  double v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v4 = objc_opt_class();
      id v5 = WeakRetained[3];
      id v6 = v4;
      int v7 = [v5 description];
      int v11 = 138412546;
      id v12 = (char *)v4;
      __int16 v13 = 2112;
      v14[0] = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ is streaming signal pack: %@ ", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v8 = [WeakRetained delegate];
    if (v8)
    {
      __int16 v9 = (void *)v8;
      int v10 = [WeakRetained[3] copy];
      [v9 feeler:WeakRetained sendsSignalPack:v10];
    }
    else
    {
      GEOFindOrCreateLog();
      int v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446722;
        id v12 = "MapsSuggestionsMapsSyncFeeler.m";
        __int16 v13 = 1026;
        LODWORD(v14[0]) = 198;
        WORD2(v14[0]) = 2082;
        *(void *)((char *)v14 + 6) = "-[MapsSuggestionsMapsSyncFeeler _informFeelerDelegate]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
      }

      __int16 v9 = 0;
    }
  }
  else
  {
    int v10 = v2;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      id v12 = "MapsSuggestionsMapsSyncFeeler.m";
      __int16 v13 = 1026;
      LODWORD(v14[0]) = 196;
      WORD2(v14[0]) = 2082;
      *(void *)((char *)v14 + 6) = "-[MapsSuggestionsMapsSyncFeeler _informFeelerDelegate]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
    __int16 v9 = v10;
  }
}

void sub_10003B6CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v2 - 24));

  _Unwind_Resume(a1);
}

void sub_10003B8B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = *(void **)(a1 + 32);
    id v5 = (void *)*((void *)WeakRetained + 4);
    id v6 = [v4 uniqueName];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      __int16 v9 = "MapsSuggestionsDestinationGraphUpdater.mm";
      __int16 v10 = 1026;
      int v11 = 85;
      __int16 v12 = 2082;
      __int16 v13 = "-[MapsSuggestionsDestinationGraphUpdater addPreloadableSource:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void sub_10003B9F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BA1C(char *a1, void *a2, void *a3)
{
  id v59 = a2;
  id v5 = a3;
  id v6 = v5;
  val = a1;
  if (a1)
  {
    if (v5)
    {
      if (v59)
      {
        int v53 = v5;
        objc_initWeak((id *)location, a1);
        group = dispatch_group_create();
        dispatch_group_enter(group);
        int v7 = a1;
        int v8 = &off_100056000;
        if (!*((void *)a1 + 15))
        {
          id v57 = 0;
          id v58 = 0;
LABEL_97:
          dispatch_group_leave(group);
          long long v50 = (void *)*((void *)v7 + 2);
          block[0] = _NSConcreteStackBlock;
          block[1] = *((void *)v8 + 150);
          block[2] = sub_10003CCE8;
          block[3] = &unk_1000722C8;
          uint64_t v51 = v50;
          objc_copyWeak(&v64, (id *)location);
          id v63 = v53;
          void block[4] = val;
          id v62 = v59;
          dispatch_group_notify(group, v51, block);

          objc_destroyWeak(&v64);
          objc_destroyWeak((id *)location);
          id v6 = v53;
          goto LABEL_98;
        }
        unint64_t v9 = *(void *)(*((void *)a1 + 11) + 8 * (*((void *)a1 + 14) / 0xAAuLL))
           + 24 * (*((void *)a1 + 14) % 0xAAuLL);
        id v54 = *(id *)v9;
        id v10 = *(id *)(v9 + 8);
        unint64_t v11 = *(void *)(v9 + 16);
        unint64_t v12 = *(void *)(*((void *)val + 11) + 8 * (*((void *)val + 14) / 0xAAuLL))
            + 24 * (*((void *)val + 14) % 0xAAuLL);

        int64x2_t v13 = vaddq_s64(*((int64x2_t *)val + 7), (int64x2_t)xmmword_100056560);
        *((int64x2_t *)val + 7) = v13;
        int v14 = val;
        if (v13.i64[0] >= 0x154uLL)
        {
          operator delete(**((void ***)val + 11));
          *((void *)val + 11) += 8;
          *((void *)val + 14) -= 170;
        }
        id v57 = v10;
        id v15 = objc_alloc((Class)NSDateInterval);
        GEOConfigGetDouble();
        id v58 = objc_msgSend(v15, "initWithStartDate:duration:", v54);
        unint64_t v16 = *((void *)val + 6);
        if (v16)
        {
          uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
          v17.i16[0] = vaddlv_u8(v17);
          unint64_t v18 = v17.u32[0];
          if (v17.u32[0] > 1uLL)
          {
            unint64_t v12 = v11;
            if (v11 >= v16) {
              unint64_t v12 = v11 % v16;
            }
          }
          else
          {
            unint64_t v12 = (v16 - 1) & v11;
          }
          long long v20 = *(void **)(*((void *)val + 5) + 8 * v12);
          if (v20)
          {
            long long v21 = (void *)*v20;
            if (*v20)
            {
              do
              {
                unint64_t v22 = v21[1];
                if (v22 == v11)
                {
                  if (id)v21[2] == v54 && (MapsSuggestionsAlmostSameLocation()) {
                    goto LABEL_89;
                  }
                }
                else
                {
                  if (v18 > 1)
                  {
                    if (v22 >= v16) {
                      v22 %= v16;
                    }
                  }
                  else
                  {
                    v22 &= v16 - 1;
                  }
                  if (v22 != v12) {
                    break;
                  }
                }
                long long v21 = (void *)*v21;
              }
              while (v21);
            }
          }
          int v14 = val;
        }
        long long v23 = operator new(0x28uLL);
        *long long v23 = 0;
        v23[1] = v11;
        v23[2] = v54;
        v23[3] = v57;
        v23[4] = v11;
        float v24 = (float)(unint64_t)(*((void *)v14 + 8) + 1);
        float v25 = *((float *)v14 + 18);
        if (v16 && (float)(v25 * (float)v16) >= v24)
        {
LABEL_79:
          uint64_t v42 = *((void *)v14 + 5);
          char v43 = *(void **)(v42 + 8 * v12);
          if (v43)
          {
            *long long v23 = *v43;
          }
          else
          {
            *long long v23 = *((void *)v14 + 7);
            *((void *)v14 + 7) = v23;
            *(void *)(v42 + 8 * v12) = v14 + 56;
            if (!*v23) {
              goto LABEL_88;
            }
            unint64_t v44 = *(void *)(*v23 + 8);
            if ((v16 & (v16 - 1)) != 0)
            {
              if (v44 >= v16) {
                v44 %= v16;
              }
            }
            else
            {
              v44 &= v16 - 1;
            }
            char v43 = (void *)(*((void *)v14 + 5) + 8 * v44);
          }
          *char v43 = v23;
LABEL_88:
          ++*((void *)v14 + 8);
LABEL_89:
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          objc_msgSend(*((id *)val + 4), "allValues", v53);
          id obj = (id)objc_claimAutoreleasedReturnValue();
          id v45 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v70;
            do
            {
              for (i = 0; i != v45; i = (char *)i + 1)
              {
                if (*(void *)v70 != v46) {
                  objc_enumerationMutation(obj);
                }
                long long v48 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                dispatch_group_enter(group);
                v65[0] = _NSConcreteStackBlock;
                v65[1] = 3221225472;
                v65[2] = sub_10003C410;
                v65[3] = &unk_1000722A0;
                v65[4] = v48;
                v66 = group;
                objc_copyWeak(&v68, (id *)location);
                id v67 = v59;
                [v48 suggestionsEntriesAtLocation:v57 period:v58 handler:v65];

                objc_destroyWeak(&v68);
              }
              id v45 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
            }
            while (v45);
          }

          int v7 = val;
          int v8 = &off_100056000;
          goto LABEL_97;
        }
        BOOL v26 = 1;
        if (v16 >= 3) {
          BOOL v26 = (v16 & (v16 - 1)) != 0;
        }
        unint64_t v27 = v26 | (2 * v16);
        unint64_t v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28) {
          int8x8_t prime = (int8x8_t)v28;
        }
        else {
          int8x8_t prime = (int8x8_t)v27;
        }
        if (*(void *)&prime == 1)
        {
          int8x8_t prime = (int8x8_t)2;
        }
        else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }
        unint64_t v16 = *((void *)v14 + 6);
        if (*(void *)&prime > v16) {
          goto LABEL_45;
        }
        if (*(void *)&prime < v16)
        {
          unint64_t v36 = vcvtps_u32_f32((float)*((unint64_t *)v14 + 8) / *((float *)v14 + 18));
          if (v16 < 3 || (uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
          {
            unint64_t v36 = std::__next_prime(v36);
          }
          else
          {
            uint64_t v38 = 1 << -(char)__clz(v36 - 1);
            if (v36 >= 2) {
              unint64_t v36 = v38;
            }
          }
          if (*(void *)&prime <= v36) {
            int8x8_t prime = (int8x8_t)v36;
          }
          if (*(void *)&prime >= v16)
          {
            unint64_t v16 = *((void *)v14 + 6);
          }
          else
          {
            if (prime)
            {
LABEL_45:
              if (*(void *)&prime >> 61) {
                sub_10003DA40();
              }
              uint64_t v30 = operator new(8 * *(void *)&prime);
              uint64_t v31 = (void *)*((void *)v14 + 5);
              *((void *)v14 + 5) = v30;
              if (v31) {
                operator delete(v31);
              }
              uint64_t v32 = 0;
              *((int8x8_t *)v14 + 6) = prime;
              do
                *(void *)(*((void *)v14 + 5) + 8 * v32++) = 0;
              while (*(void *)&prime != v32);
              long long v33 = (void *)*((void *)v14 + 7);
              if (v33)
              {
                unint64_t v34 = v33[1];
                uint8x8_t v35 = (uint8x8_t)vcnt_s8(prime);
                v35.i16[0] = vaddlv_u8(v35);
                if (v35.u32[0] > 1uLL)
                {
                  if (v34 >= *(void *)&prime) {
                    v34 %= *(void *)&prime;
                  }
                }
                else
                {
                  v34 &= *(void *)&prime - 1;
                }
                *(void *)(*((void *)v14 + 5) + 8 * v34) = v14 + 56;
                dispatch_time_t v39 = (void *)*v33;
                if (*v33)
                {
                  do
                  {
                    unint64_t v40 = v39[1];
                    if (v35.u32[0] > 1uLL)
                    {
                      if (v40 >= *(void *)&prime) {
                        v40 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v40 &= *(void *)&prime - 1;
                    }
                    if (v40 != v34)
                    {
                      uint64_t v41 = *((void *)v14 + 5);
                      if (!*(void *)(v41 + 8 * v40))
                      {
                        *(void *)(v41 + 8 * v40) = v33;
                        goto LABEL_70;
                      }
                      void *v33 = *v39;
                      void *v39 = **(void **)(*((void *)v14 + 5) + 8 * v40);
                      **(void **)(*((void *)v14 + 5) + 8 * v40) = v39;
                      dispatch_time_t v39 = v33;
                    }
                    unint64_t v40 = v34;
LABEL_70:
                    long long v33 = v39;
                    dispatch_time_t v39 = (void *)*v39;
                    unint64_t v34 = v40;
                  }
                  while (v39);
                }
              }
              unint64_t v16 = (unint64_t)prime;
              goto LABEL_74;
            }
            __int16 v52 = (void *)*((void *)v14 + 5);
            *((void *)v14 + 5) = 0;
            if (v52) {
              operator delete(v52);
            }
            unint64_t v16 = 0;
            *((void *)v14 + 6) = 0;
          }
        }
LABEL_74:
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v11 >= v16) {
            unint64_t v12 = v11 % v16;
          }
          else {
            unint64_t v12 = v11;
          }
        }
        else
        {
          unint64_t v12 = (v16 - 1) & v11;
        }
        goto LABEL_79;
      }
      __int16 v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)id location = 136446978;
        *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
        __int16 v75 = 1024;
        int v76 = 119;
        __int16 v77 = 2082;
        uint64_t v78 = "-[MapsSuggestionsDestinationGraphUpdater _walkAllQueuedMomentsUntil:handler:]";
        __int16 v79 = 2082;
        BOOL v80 = "nil == (until)";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an end time", location, 0x26u);
      }
    }
    else
    {
      __int16 v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)id location = 136446978;
        *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
        __int16 v75 = 1024;
        int v76 = 118;
        __int16 v77 = 2082;
        uint64_t v78 = "-[MapsSuggestionsDestinationGraphUpdater _walkAllQueuedMomentsUntil:handler:]";
        __int16 v79 = 2082;
        BOOL v80 = "nil == (handler)";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", location, 0x26u);
      }
    }
  }
LABEL_98:
}

void sub_10003C358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  sub_10003DA74(1, v31);

  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_10003C410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [*(id *)(a1 + 32) uniqueName];
      *(_DWORD *)buf = 138412546;
      uint8x8_t v17 = v8;
      __int16 v18 = 2112;
      v19[0] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error while reading from %@: %@", buf, 0x16u);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10003C6C4;
      v11[3] = &unk_100071538;
      objc_copyWeak(&v15, (id *)(a1 + 56));
      id v12 = v5;
      id v13 = *(id *)(a1 + 48);
      id v14 = *(id *)(a1 + 40);
      dispatch_async(WeakRetained[2], v11);

      objc_destroyWeak(&v15);
    }
    else
    {
      GEOFindOrCreateLog();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint8x8_t v17 = "MapsSuggestionsDestinationGraphUpdater.mm";
        __int16 v18 = 1026;
        LODWORD(v19[0]) = 151;
        WORD2(v19[0]) = 2082;
        *(void *)((char *)v19 + 6) = "-[MapsSuggestionsDestinationGraphUpdater _walkAllQueuedMomentsUntil:handler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
}

void sub_10003C694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C6C4(uint64_t a1)
{
  id WeakRetained = (int8x8_t *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v38 objects:v42 count:16];
    uint64_t v35 = a1;
    if (!v3) {
      goto LABEL_43;
    }
    uint64_t v37 = *(void *)v39;
    id v34 = v2;
    while (1)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v39 != v37) {
          objc_enumerationMutation(v2);
        }
        id v5 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v7 = objc_loadWeakRetained((id *)&WeakRetained[1]);
        [v7 addEntry:v5];

        id v8 = v5;
        unint64_t v9 = [v8 geoMapItem];
        LODWORD(v5) = v9 == 0;

        if (v5)
        {
          long long v21 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 94;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "CLLocation *_locationFromMapsSuggestionsEntry(MapsSuggestionsEntry *__strong)";
            __int16 v44 = 2082;
            id v45 = "nil == (entry.geoMapItem)";
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. All preloadable sources should return entries with mapItems", buf, 0x26u);
          }
          goto LABEL_40;
        }
        id v10 = objc_alloc((Class)CLLocation);
        unint64_t v11 = [v8 geoMapItem];
        [v11 coordinate];
        double v13 = v12;
        id v14 = [v8 geoMapItem];
        [v14 coordinate];
        id v15 = objc_msgSend(v10, "initWithLatitude:longitude:", v13);

        if (!v15) {
          goto LABEL_41;
        }
        id v16 = v8;
        uint8x8_t v17 = v16;
        if (v16)
        {
          unsigned __int8 v18 = [v16 containsKey:@"MapsSuggestionsLatestTimeKey"];
          CFStringRef v19 = @"MapsSuggestionsLatestTimeKey";
          if ((v18 & 1) != 0
            || (unsigned int v20 = [v17 containsKey:@"MapsSuggestionsScheduledEndTimeKey"],
                CFStringRef v19 = @"MapsSuggestionsScheduledEndTimeKey",
                v20))
          {
            long long v21 = [v17 dateForKey:v19];

            if (v21)
            {
              unint64_t v22 = [v21 laterDate:*(void *)(v35 + 40)];
              BOOL v23 = v22 == v21;

              if (!v23)
              {
                sub_10003D7E4(buf, v21, v15);
                int8x8_t v24 = WeakRetained[6];
                if (v24)
                {
                  uint64_t v25 = *(void *)&buf[16];
                  uint8x8_t v26 = (uint8x8_t)vcnt_s8(v24);
                  v26.i16[0] = vaddlv_u8(v26);
                  unint64_t v27 = v26.u32[0];
                  if (v26.u32[0] > 1uLL)
                  {
                    uint64_t v28 = *(void *)&buf[16];
                    if (*(void *)&buf[16] >= *(void *)&v24) {
                      uint64_t v28 = *(void *)&buf[16] % *(void *)&v24;
                    }
                  }
                  else
                  {
                    uint64_t v28 = (*(void *)&v24 - 1) & *(void *)&buf[16];
                  }
                  uint64_t v30 = *(void **)(*(void *)&WeakRetained[5] + 8 * v28);
                  if (v30)
                  {
                    uint64_t v31 = (void *)*v30;
                    if (*v30)
                    {
                      do
                      {
                        unint64_t v32 = v31[1];
                        if (v25 == v32)
                        {
                          if (v31[2] == *(void *)buf && (MapsSuggestionsAlmostSameLocation() & 1) != 0) {
                            goto LABEL_38;
                          }
                        }
                        else
                        {
                          if (v27 > 1)
                          {
                            if (v32 >= *(void *)&v24) {
                              v32 %= *(void *)&v24;
                            }
                          }
                          else
                          {
                            v32 &= *(void *)&v24 - 1;
                          }
                          if (v32 != v28) {
                            break;
                          }
                        }
                        uint64_t v31 = (void *)*v31;
                      }
                      while (v31);
                    }
                  }
                }
                sub_10003DAC0(&WeakRetained[10], (uint64_t)buf);
LABEL_38:

                id v2 = v34;
              }
            }
            goto LABEL_39;
          }
        }
        else
        {
          uint64_t v29 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 102;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "NSDate *_fuzzyEndTimeFromMapsSuggestionsEntry(MapsSuggestionsEntry *__strong)";
            __int16 v44 = 2082;
            id v45 = "nil == (entry)";
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
          }
        }
        long long v21 = 0;
LABEL_39:
        id v8 = v15;
LABEL_40:

LABEL_41:
      }
      id v3 = [v2 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v3)
      {
LABEL_43:

        dispatch_group_leave(*(dispatch_group_t *)(v35 + 48));
        goto LABEL_47;
      }
    }
  }
  GEOFindOrCreateLog();
  long long v33 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "MapsSuggestionsDestinationGraphUpdater.mm";
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = 154;
    *(_WORD *)&buf[18] = 2082;
    *(void *)&buf[20] = "-[MapsSuggestionsDestinationGraphUpdater _walkAllQueuedMomentsUntil:handler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_47:
}

void sub_10003CC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003CCE8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[15])
    {
      sub_10003BA1C(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
    else
    {
      sub_10003E02C((uint64_t)(WeakRetained + 5));
      id v5 = objc_loadWeakRetained(v3 + 1);
      [v5 rebalance];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsDestinationGraphUpdater.mm";
      __int16 v8 = 1026;
      int v9 = 185;
      __int16 v10 = 2082;
      unint64_t v11 = "-[MapsSuggestionsDestinationGraphUpdater _walkAllQueuedMomentsUntil:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003CE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D340(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v4 = WeakRetained[5];
    long long v5 = WeakRetained[6];
    long long v6 = WeakRetained[7];
    WeakRetained[5] = 0u;
    WeakRetained[6] = 0u;
    *(_OWORD *)buf = v4;
    *(_OWORD *)&buf[16] = v5;
    WeakRetained[7] = 0u;
    long long v12 = v6;
    sub_10003E02C((uint64_t)WeakRetained + 40);
    sub_10003DAC0((void *)v3 + 10, (uint64_t)(a1 + 7));
    id v7 = [a1[4] endDate];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003D544;
    v9[3] = &unk_1000722F0;
    v9[4] = v3;
    id v10 = a1[5];
    sub_10003BA1C((char *)v3, v7, v9);

    sub_10003D8D0((uint64_t)buf);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsDestinationGraphUpdater.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 216;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsDestinationGraphUpdater rebuildForPeriod:location:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10003D508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003D544(uint64_t a1)
{
  GEOFindOrCreateLog();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) uniqueName];
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2080;
    int v9 = "rebuildForPeriod";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v6, 0x16u);
  }
  long long v4 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "rebuildForPeriod", "", (uint8_t *)&v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10003D6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003D6D4(void *a1, uint64_t a2)
{
  a1[7] = *(id *)(a2 + 56);
  id result = *(id *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 72);
  a1[8] = result;
  a1[9] = v5;
  return result;
}

void sub_10003D714(uint64_t a1)
{
  id v2 = *(void **)(a1 + 56);
}

void *sub_10003D7E4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  *a1 = v7;
  id v8 = v6;
  a1[1] = v8;
  [v7 timeIntervalSince1970];
  double v10 = v9;
  [v8 coordinate];
  double v12 = v11;
  [v8 coordinate];
  uint64_t v14 = 2 * *(void *)&v12;
  uint64_t v15 = 4 * *(void *)&v10;
  if (v10 == 0.0) {
    uint64_t v15 = 0;
  }
  if (v12 == 0.0) {
    uint64_t v14 = 0;
  }
  uint64_t v16 = v14 ^ v15;
  double v17 = v13;
  if (v13 == 0.0) {
    double v17 = 0.0;
  }
  a1[2] = v16 ^ *(void *)&v17;

  return a1;
}

void sub_10003D8A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003D8D0(uint64_t a1)
{
  id v2 = *(void ***)(a1 + 8);
  id v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    long long v4 = (void *)(a1 + 40);
    id v3 = *(void ***)(a1 + 8);
  }
  else
  {
    long long v4 = (void *)(a1 + 40);
    unint64_t v5 = *(void *)(a1 + 32);
    id v6 = &v2[v5 / 0xAA];
    unint64_t v7 = (unint64_t)*v6 + 24 * (v5 % 0xAA);
    unint64_t v8 = (unint64_t)v2[(*(void *)(a1 + 40) + v5) / 0xAA] + 24 * ((*(void *)(a1 + 40) + v5) % 0xAA);
    if (v7 != v8)
    {
      do
      {

        double v9 = *(void **)v7;
        v7 += 24;

        if (v7 - (void)*v6 == 4080)
        {
          unint64_t v10 = (unint64_t)v6[1];
          ++v6;
          unint64_t v7 = v10;
        }
      }
      while (v7 != v8);
      id v2 = *(void ***)(a1 + 8);
      id v3 = *(void ***)(a1 + 16);
    }
  }
  *long long v4 = 0;
  unint64_t v11 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      id v3 = *(void ***)(a1 + 16);
      id v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v11 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v12 = v11 >> 3;
  if (v12 == 1)
  {
    uint64_t v13 = 85;
    goto LABEL_14;
  }
  if (v12 == 2)
  {
    uint64_t v13 = 170;
LABEL_14:
    *(void *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      uint64_t v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    uint64_t v16 = *(void *)(a1 + 8);
    uint64_t v15 = *(void *)(a1 + 16);
    if (v15 != v16) {
      *(void *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10003DA40()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10003DA74(char a1, id *__p)
{
  if (a1)
  {
  }
  operator delete(__p);
}

id sub_10003DAC0(void *a1, uint64_t a2)
{
  long long v4 = (char *)a1[1];
  unint64_t v5 = (char *)a1[2];
  unint64_t v6 = (v5 - v4) >> 3;
  if (v5 == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 170 * v6 - 1;
  }
  unint64_t v8 = a1[4];
  if (v7 != a1[5] + v8) {
    goto LABEL_38;
  }
  BOOL v9 = v8 >= 0xAA;
  unint64_t v10 = v8 - 170;
  if (v9)
  {
    a1[4] = v10;
    uint64_t v13 = *(void *)v4;
    unint64_t v11 = v4 + 8;
    uint64_t v12 = v13;
    a1[1] = v11;
    if (v5 == (char *)a1[3])
    {
      uint64_t v14 = (uint64_t)&v11[-*a1];
      if ((unint64_t)v11 <= *a1)
      {
        if (v5 == (char *)*a1) {
          unint64_t v40 = 1;
        }
        else {
          unint64_t v40 = (uint64_t)&v5[-*a1] >> 2;
        }
        long long v41 = (char *)sub_10003DFF4(v40);
        char v43 = &v41[8 * (v40 >> 2)];
        __int16 v44 = (uint64_t *)a1[1];
        unint64_t v5 = v43;
        uint64_t v45 = a1[2] - (void)v44;
        if (v45)
        {
          unint64_t v5 = &v43[v45 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v46 = 8 * (v45 >> 3);
          long long v47 = &v41[8 * (v40 >> 2)];
          do
          {
            uint64_t v48 = *v44++;
            *(void *)long long v47 = v48;
            v47 += 8;
            v46 -= 8;
          }
          while (v46);
        }
        long long v49 = (char *)*a1;
        *a1 = v41;
        a1[1] = v43;
        a1[2] = v5;
        a1[3] = &v41[8 * v42];
        if (v49)
        {
          operator delete(v49);
          unint64_t v5 = (char *)a1[2];
        }
      }
      else
      {
        uint64_t v15 = v14 >> 3;
        BOOL v16 = v14 >> 3 < -1;
        uint64_t v17 = (v14 >> 3) + 2;
        if (v16) {
          uint64_t v18 = v17;
        }
        else {
          uint64_t v18 = v15 + 1;
        }
        uint64_t v19 = -(v18 >> 1);
        uint64_t v20 = v18 >> 1;
        long long v21 = &v11[-8 * v20];
        int64_t v22 = v5 - v11;
        if (v5 != v11)
        {
          memmove(&v11[-8 * v20], v11, v5 - v11);
          unint64_t v5 = (char *)a1[1];
        }
        BOOL v23 = &v5[8 * v19];
        unint64_t v5 = &v21[v22];
        a1[1] = v23;
        a1[2] = &v21[v22];
      }
    }
    *(void *)unint64_t v5 = v12;
  }
  else
  {
    int8x8_t v24 = (char *)a1[3];
    uint64_t v25 = (char *)*a1;
    uint64_t v26 = (uint64_t)&v24[-*a1];
    if (v6 >= v26 >> 3)
    {
      uint64_t v29 = v26 >> 2;
      if (v24 == v25) {
        unint64_t v30 = 1;
      }
      else {
        unint64_t v30 = v29;
      }
      uint64_t v31 = (char *)sub_10003DFF4(v30);
      uint64_t v33 = v32;
      id v34 = operator new(0xFF0uLL);
      uint64_t v35 = &v31[8 * v6];
      unint64_t v36 = &v31[8 * v33];
      if (v6 == v33)
      {
        uint64_t v37 = 8 * v6;
        if (v5 - v4 < 1)
        {
          int v76 = v34;
          uint64_t v77 = v37 >> 2;
          if (v5 == v4) {
            unint64_t v78 = 1;
          }
          else {
            unint64_t v78 = v77;
          }
          __int16 v79 = (char *)sub_10003DFF4(v78);
          uint64_t v35 = &v79[8 * (v78 >> 2)];
          unint64_t v36 = &v79[8 * v80];
          if (v31) {
            operator delete(v31);
          }
          uint64_t v31 = v79;
          id v34 = v76;
        }
        else
        {
          uint64_t v38 = v37 >> 3;
          if (v38 >= -1) {
            unint64_t v39 = v38 + 1;
          }
          else {
            unint64_t v39 = v38 + 2;
          }
          v35 -= 8 * (v39 >> 1);
        }
      }
      *(void *)uint64_t v35 = v34;
      unint64_t v5 = v35 + 8;
      for (uint64_t i = a1[2]; i != a1[1]; i -= 8)
      {
        if (v35 == v31)
        {
          if (v5 >= v36)
          {
            if (v36 == v31) {
              unint64_t v86 = 1;
            }
            else {
              unint64_t v86 = (v36 - v31) >> 2;
            }
            uint64_t v87 = (char *)sub_10003DFF4(v86);
            uint64_t v89 = v87;
            uint64_t v35 = &v87[(2 * v86 + 6) & 0xFFFFFFFFFFFFFFF8];
            uint64_t v91 = v5 - v31;
            BOOL v90 = v5 == v31;
            unint64_t v5 = v35;
            if (!v90)
            {
              unint64_t v5 = &v35[v91 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v92 = 8 * (v91 >> 3);
              uint64_t v93 = v35;
              uint64_t v94 = v31;
              do
              {
                uint64_t v95 = *(void *)v94;
                v94 += 8;
                *(void *)uint64_t v93 = v95;
                v93 += 8;
                v92 -= 8;
              }
              while (v92);
            }
            unint64_t v36 = &v87[8 * v88];
            if (v31) {
              operator delete(v31);
            }
            uint64_t v31 = v89;
          }
          else
          {
            uint64_t v82 = (v36 - v5) >> 3;
            if (v82 >= -1) {
              uint64_t v83 = v82 + 1;
            }
            else {
              uint64_t v83 = v82 + 2;
            }
            uint64_t v84 = v83 >> 1;
            uint64_t v35 = &v31[8 * (v83 >> 1)];
            BOOL v85 = v31;
            if (v5 != v31)
            {
              memmove(v35, v31, v5 - v31);
              BOOL v85 = v5;
            }
            unint64_t v5 = &v85[8 * v84];
          }
        }
        uint64_t v96 = *(void *)(i - 8);
        *((void *)v35 - 1) = v96;
        v35 -= 8;
      }
      uint64_t v97 = (char *)*a1;
      *a1 = v31;
      a1[1] = v35;
      a1[2] = v5;
      a1[3] = v36;
      if (v97)
      {
        operator delete(v97);
        unint64_t v5 = (char *)a1[2];
      }
      goto LABEL_37;
    }
    unint64_t v27 = operator new(0xFF0uLL);
    uint64_t v28 = v27;
    if (v24 == v5)
    {
      if (v4 == v25)
      {
        if (v5 == v4) {
          unint64_t v54 = 1;
        }
        else {
          unint64_t v54 = (v24 - v4) >> 2;
        }
        uint64_t v55 = 2 * v54;
        __int16 v56 = (char *)sub_10003DFF4(v54);
        long long v4 = &v56[(v55 + 6) & 0xFFFFFFFFFFFFFFF8];
        id v58 = (uint64_t *)a1[1];
        id v59 = v4;
        uint64_t v60 = a1[2] - (void)v58;
        if (v60)
        {
          id v59 = &v4[v60 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v61 = 8 * (v60 >> 3);
          id v62 = &v56[(v55 + 6) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            uint64_t v63 = *v58++;
            *(void *)id v62 = v63;
            v62 += 8;
            v61 -= 8;
          }
          while (v61);
        }
        id v64 = (char *)*a1;
        *a1 = v56;
        a1[1] = v4;
        a1[2] = v59;
        a1[3] = &v56[8 * v57];
        if (v64)
        {
          operator delete(v64);
          long long v4 = (char *)a1[1];
        }
      }
      *((void *)v4 - 1) = v28;
      uint64_t v65 = (char *)a1[1];
      v66 = (char *)a1[2];
      a1[1] = v65 - 8;
      uint64_t v67 = *((void *)v65 - 1);
      a1[1] = v65;
      if (v66 == (char *)a1[3])
      {
        uint64_t v68 = (uint64_t)&v65[-*a1];
        if ((unint64_t)v65 <= *a1)
        {
          if (v66 == (char *)*a1) {
            unint64_t v98 = 1;
          }
          else {
            unint64_t v98 = (uint64_t)&v66[-*a1] >> 2;
          }
          uint64_t v99 = (char *)sub_10003DFF4(v98);
          uint64_t v101 = &v99[8 * (v98 >> 2)];
          uint64_t v102 = (uint64_t *)a1[1];
          v66 = v101;
          uint64_t v103 = a1[2] - (void)v102;
          if (v103)
          {
            v66 = &v101[v103 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v104 = 8 * (v103 >> 3);
            uint64_t v105 = &v99[8 * (v98 >> 2)];
            do
            {
              uint64_t v106 = *v102++;
              *(void *)uint64_t v105 = v106;
              v105 += 8;
              v104 -= 8;
            }
            while (v104);
          }
          uint64_t v107 = (char *)*a1;
          *a1 = v99;
          a1[1] = v101;
          a1[2] = v66;
          a1[3] = &v99[8 * v100];
          if (v107)
          {
            operator delete(v107);
            v66 = (char *)a1[2];
          }
        }
        else
        {
          uint64_t v69 = v68 >> 3;
          BOOL v16 = v68 >> 3 < -1;
          uint64_t v70 = (v68 >> 3) + 2;
          if (v16) {
            uint64_t v71 = v70;
          }
          else {
            uint64_t v71 = v69 + 1;
          }
          uint64_t v72 = -(v71 >> 1);
          uint64_t v73 = v71 >> 1;
          uint64_t v74 = &v65[-8 * v73];
          int64_t v75 = v66 - v65;
          if (v66 != v65)
          {
            memmove(&v65[-8 * v73], v65, v66 - v65);
            uint64_t v65 = (char *)a1[1];
          }
          v66 = &v74[v75];
          a1[1] = &v65[8 * v72];
          a1[2] = &v74[v75];
        }
      }
      *(void *)v66 = v67;
    }
    else
    {
      *(void *)unint64_t v5 = v27;
    }
  }
  unint64_t v5 = (char *)(a1[2] + 8);
  a1[2] = v5;
LABEL_37:
  long long v4 = (char *)a1[1];
LABEL_38:
  if (v5 == v4)
  {
    uint64_t v51 = 0;
  }
  else
  {
    unint64_t v50 = a1[5] + a1[4];
    uint64_t v51 = (void *)(*(void *)&v4[8 * (v50 / 0xAA)] + 24 * (v50 % 0xAA));
  }
  *uint64_t v51 = *(id *)a2;
  id result = *(id *)(a2 + 8);
  uint64_t v53 = *(void *)(a2 + 16);
  v51[1] = result;
  v51[2] = v53;
  ++a1[5];
  return result;
}

void sub_10003DFC8(_Unwind_Exception *a1)
{
  operator delete(v2);
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void *sub_10003DFF4(unint64_t a1)
{
  if (a1 >> 61) {
    sub_10003DA40();
  }
  return operator new(8 * a1);
}

void sub_10003E02C(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_10003E084(*(id **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_10003E084(id *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = (id *)*v1;

      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

void sub_10003E488(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_100081F08;
  qword_100081F08 = v1;

  id v3 = (void *)qword_100081F08;
  [v3 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss"];
}

void sub_10003E638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E944(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10003EA58(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10003EB6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10003EC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EE80(id a1)
{
  qword_100081F18 = objc_alloc_init(DestinationDaemon);
  _objc_release_x1();
}

uint64_t start()
{
  uint64_t v1 = +[NSRunLoop currentRunLoop];
  [v1 performBlock:&stru_1000723C0];

  uint64_t v2 = +[NSRunLoop currentRunLoop];
  [v2 run];

  return 0;
}

void sub_10003EF30(id a1)
{
  if (qword_100081F20 != -1) {
    dispatch_once(&qword_100081F20, &stru_1000723A0);
  }
  id v1 = (id)qword_100081F18;
  [v1 start];
}

void sub_10003F22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 120));

  _Unwind_Resume(a1);
}

void sub_10003FD40(NSObject **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = v5;
    unint64_t v8 = *a1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_1000409D4;
    v10[3] = &unk_100071910;
    unint64_t v11 = v7;
    id v12 = v6;
    dispatch_async(v8, v10);

    BOOL v9 = v11;
  }
  else
  {
    BOOL v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      __int16 v15 = 1024;
      int v16 = 208;
      __int16 v17 = 2082;
      uint64_t v18 = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsWalletSource]";
      __int16 v19 = 2082;
      uint64_t v20 = "nil == (callerSelf)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
    }
  }
}

void sub_10003FED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FEEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addOrUpdateMySuggestionEntries:&__NSArray0__struct];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  GEOFindOrCreateLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 uniqueName];
    int v8 = 138412546;
    BOOL v9 = v6;
    __int16 v10 = 2080;
    unint64_t v11 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v8, 2u);
  }
}

void sub_10004006C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004009C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addOrUpdateMySuggestionEntries:&__NSArray0__struct];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  GEOFindOrCreateLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 uniqueName];
    int v8 = 138412546;
    BOOL v9 = v6;
    __int16 v10 = 2080;
    unint64_t v11 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v8, 2u);
  }
}

void sub_10004021C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004024C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addOrUpdateMySuggestionEntries:&__NSArray0__struct];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  GEOFindOrCreateLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 uniqueName];
    int v8 = 138412546;
    BOOL v9 = v6;
    __int16 v10 = 2080;
    unint64_t v11 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v8, 2u);
  }
}

void sub_1000403CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000403FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v18 = "MapsSuggestionsWalletSource.mm";
      __int16 v19 = 1026;
      LODWORD(v20[0]) = 130;
      WORD2(v20[0]) = 2082;
      *(void *)((char *)v20 + 6) = "-[MapsSuggestionsWalletSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfRequest went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_8;
  }
  if (v5 && !v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100040790;
    void v14[3] = &unk_100072410;
    __int16 v15 = v5;
    id v16 = *(id *)(a1 + 32);
    sub_10003FD40(WeakRetained + 1, WeakRetained, v14);

    int v8 = v15;
LABEL_8:

    goto LABEL_17;
  }
  BOOL v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error while reading suggestions from Wallet: %@", buf, 0xCu);
  }

  [WeakRetained addOrUpdateMySuggestionEntries:&__NSArray0__struct];
  GEOFindOrCreateLog();
  __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v11 = [WeakRetained uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v11;
    __int16 v19 = 2080;
    v20[0] = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
  }
  id v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
LABEL_17:
}

void sub_100040738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040790(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addOrUpdateMySuggestionEntries:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  GEOFindOrCreateLog();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 uniqueName];
    int v8 = 138412546;
    BOOL v9 = v6;
    __int16 v10 = 2080;
    unint64_t v11 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", (uint8_t *)&v8, 2u);
  }
}

void sub_10004090C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000409D4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "self went away in MSg::Queue::async()", v4, 2u);
    }
  }
}

void sub_100040A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040AB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addOrUpdateMySuggestionEntries:&__NSArray0__struct];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [v3 uniqueName];
      int v8 = 138412546;
      BOOL v9 = v6;
      __int16 v10 = 2080;
      v11[0] = "_getAllUserCurrentBookingsWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_getAllUserCurrentBookingsWithHandler", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      BOOL v9 = "MapsSuggestionsReservationsSource.m";
      __int16 v10 = 1026;
      LODWORD(v11[0]) = 104;
      WORD2(v11[0]) = 2082;
      *(void *)((char *)v11 + 6) = "-[MapsSuggestionsReservationsSource _getAllUserCurrentBookingsWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void sub_100040CD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (([WeakRetained isSuspended] & 1) == 0)
      {
        [v5 addOrUpdateMySuggestionEntries:v3];
        uint64_t v6 = *(void *)(a1 + 32);
        if (v6) {
          (*(void (**)(void))(v6 + 16))();
        }
      }
    }
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [v5 uniqueName];
      int v10 = 138412546;
      unint64_t v11 = v8;
      __int16 v12 = 2080;
      v13[0] = "_getAllUserCurrentBookingsWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
    }
    BOOL v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_getAllUserCurrentBookingsWithHandler", "", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    BOOL v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      unint64_t v11 = "MapsSuggestionsReservationsSource.m";
      __int16 v12 = 1026;
      LODWORD(v13[0]) = 116;
      WORD2(v13[0]) = 2082;
      *(void *)((char *)v13 + 6) = "-[MapsSuggestionsReservationsSource _getAllUserCurrentBookingsWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void sub_100040F0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041024;
  void v11[3] = &unk_1000724B0;
  objc_copyWeak(v16, (id *)(a1 + 48));
  int v8 = *(void **)(a1 + 56);
  id v12 = v6;
  v16[1] = v8;
  id v15 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);

  objc_destroyWeak(v16);
}

void sub_100041024(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 72));
        id v5 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        BOOL v85 = v5;
        __int16 v86 = 2112;
        *(void *)uint64_t v87 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@ received error: %@", buf, 0x16u);
      }
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = [v3 uniqueName];
        *(_DWORD *)buf = 138412546;
        BOOL v85 = v8;
        __int16 v86 = 2080;
        *(void *)uint64_t v87 = "managerWithExtensionLookupPolicy";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v9 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "managerWithExtensionLookupPolicy", "", buf, 2u);
      }
LABEL_9:

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_47;
    }
    if ([WeakRetained isSuspended])
    {
      unint64_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = [v3 uniqueName];
        *(_DWORD *)buf = 138412546;
        BOOL v85 = v12;
        __int16 v86 = 2080;
        *(void *)uint64_t v87 = "managerWithExtensionLookupPolicy";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      id v9 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "managerWithExtensionLookupPolicy", "", buf, 2u);
      }
      goto LABEL_9;
    }
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100041D78;
    v52[3] = &unk_100072488;
    id v13 = *(void **)(a1 + 40);
    id v53 = *(id *)(a1 + 48);
    unint64_t v54 = v3;
    id v55 = *(id *)(a1 + 56);
    id v14 = v13;
    char v43 = v52;
    __int16 v44 = objc_opt_new();
    group = dispatch_group_create();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v14;
    id v48 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
    if (!v48)
    {
LABEL_46:

      unint64_t v40 = v3[1];
      uint64_t v63 = _NSConcreteStackBlock;
      uint64_t v64 = 3221225472;
      uint64_t v65 = sub_100041F7C;
      v66 = &unk_100071F88;
      long long v41 = v43;
      id v67 = v44;
      id v68 = v41;
      id v42 = v44;
      dispatch_group_notify(group, v40, &v63);

      goto LABEL_47;
    }
    uint64_t v47 = *(void *)v60;
LABEL_21:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v60 != v47) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
      if ([v3 isSuspended]) {
        goto LABEL_46;
      }
      if ([v16 optedIn]) {
        break;
      }
LABEL_44:
      if (v48 == (id)++v15)
      {
        id v48 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
        if (v48) {
          goto LABEL_21;
        }
        goto LABEL_46;
      }
    }
    dispatch_group_enter(group);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100041EEC;
    v56[3] = &unk_100072500;
    id v57 = v44;
    id v58 = group;
    id v51 = v16;
    unint64_t v50 = v56;
    objc_initWeak(&location, v3);
    id v49 = v3[1];
    id v17 = objc_alloc_init((Class)INGetUserCurrentRestaurantReservationBookingsIntent);
    GEOConfigGetDouble();
    uint64_t v18 = MapsSuggestionsNowWithOffset();
    [v17 setEarliestBookingDateForResults:v18];

    GEOFindOrCreateLog();
    __int16 v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = [v3 uniqueName];
      *(_DWORD *)uint64_t v88 = 138412546;
      *(void *)&v88[4] = v20;
      *(_WORD *)&v88[12] = 2080;
      *(void *)&v88[14] = "expectResponseClass";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", v88, 0x16u);
    }
    long long v21 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)uint64_t v88 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "expectResponseClass", "", v88, 2u);
    }

    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x2020000000;
    char v80 = 0;
    int64_t v22 = [v51 _plugIn];
    if (v22)
    {
      id v23 = objc_alloc((Class)LSApplicationExtensionRecord);
      int8x8_t v24 = [v22 valueForKey:@"uuid"];
      id v25 = [v23 initWithUUID:v24 error:0];

      uint64_t v26 = [v25 containingBundleRecord];
      unint64_t v27 = [v26 bundleIdentifier];
    }
    else
    {
      unint64_t v27 = 0;
    }

    uint64_t v28 = [v27 stringByReplacingOccurrencesOfString:@"com." withString:&stru_100074040];
    if (v27)
    {
      [v3[2] registerBundleID:v27 withSource:v3];
      if ([v3[2] isBundleIDLocked:v27 forSource:v3])
      {
        uint64_t v29 = v3[1];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100041FD4;
        block[3] = &unk_100071F60;
        objc_copyWeak(&v78, &location);
        uint64_t v77 = v50;
        dispatch_async(v29, block);

        objc_destroyWeak(&v78);
LABEL_43:

        _Block_object_dispose(v79, 8);
        objc_destroyWeak(&location);

        goto LABEL_44;
      }
      if ((+[MapsSuggestionsSiri canLearnFromBundleID:v27] & 1) == 0)
      {
        unint64_t v39 = v3[1];
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_1000421D8;
        v73[3] = &unk_100071F60;
        objc_copyWeak(&v75, &location);
        uint64_t v74 = v50;
        dispatch_async(v39, v73);

        objc_destroyWeak(&v75);
        goto LABEL_43;
      }
    }
    uint64_t v63 = _NSConcreteStackBlock;
    uint64_t v64 = 3221225472;
    uint64_t v65 = sub_1000423DC;
    v66 = &unk_100072550;
    id v67 = v49;
    uint64_t v71 = v79;
    objc_copyWeak(&v72, &location);
    uint64_t v70 = v50;
    id v68 = v28;
    id v69 = v27;
    id v30 = v17;
    id v31 = v51;
    uint64_t v32 = &v63;
    objc_initWeak(&v83, v31);
    objc_initWeak(&from, v3);
    GEOFindOrCreateLog();
    uint64_t v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      id v34 = [v3 uniqueName];
      *(_DWORD *)uint64_t v95 = 138412546;
      uint64_t v96 = v34;
      __int16 v97 = 2080;
      unint64_t v98 = "restaurantReservationIntentRequest";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", v95, 0x16u);
    }
    uint64_t v35 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)uint64_t v95 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "restaurantReservationIntentRequest", "", v95, 2u);
    }

    *(void *)uint64_t v88 = _NSConcreteStackBlock;
    *(void *)&v88[8] = 3221225472;
    *(void *)&v88[16] = sub_100043670;
    uint64_t v89 = &unk_1000725F0;
    objc_copyWeak(&v93, &from);
    objc_copyWeak(v94, &v83);
    unint64_t v36 = v32;
    uint64_t v92 = v36;
    id v37 = v31;
    id v90 = v37;
    id v38 = v30;
    id v91 = v38;
    [v37 beginExtensionRequestWithInputItems:0 completion:v88];

    objc_destroyWeak(v94);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v83);

    objc_destroyWeak(&v72);
    goto LABEL_43;
  }
  GEOFindOrCreateLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v85 = "MapsSuggestionsReservationsSource.m";
    __int16 v86 = 1026;
    *(_DWORD *)uint64_t v87 = 139;
    *(_WORD *)&v87[4] = 2082;
    *(void *)&v87[6] = "-[MapsSuggestionsReservationsSource _entriesForIntent:completion:]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_47:
}

void sub_100041CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *a20,id *a21)
{
}

void sub_100041D78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [*(id *)(a1 + 40) uniqueName];
    int v7 = 138412546;
    int v8 = v5;
    __int16 v9 = 2080;
    id v10 = "managerWithExtensionLookupPolicy";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "managerWithExtensionLookupPolicy", "", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100041EEC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100041F68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100041F7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100041FD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [WeakRetained uniqueName];
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2080;
      v12[0] = "expectResponseClass";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expectResponseClass", "", (uint8_t *)&v9, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else
  {
    int v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "MapsSuggestionsReservationsSource.m";
      __int16 v11 = 1026;
      LODWORD(v12[0]) = 245;
      WORD2(v12[0]) = 2082;
      *(void *)((char *)v12 + 6) = "-[MapsSuggestionsReservationsSource _entriesForExtension:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_1000421D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [WeakRetained uniqueName];
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2080;
      v12[0] = "expectResponseClass";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expectResponseClass", "", (uint8_t *)&v9, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else
  {
    int v8 = v3;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "MapsSuggestionsReservationsSource.m";
      __int16 v11 = 1026;
      LODWORD(v12[0]) = 249;
      WORD2(v12[0]) = 2082;
      *(void *)((char *)v12 + 6) = "-[MapsSuggestionsReservationsSource _entriesForExtension:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_1000423DC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  int v9 = *(NSObject **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  id v12[2] = sub_100042518;
  void v12[3] = &unk_100072528;
  uint64_t v19 = *(void *)(a1 + 64);
  objc_copyWeak(&v20, (id *)(a1 + 72));
  id v18 = *(id *)(a1 + 56);
  id v13 = v7;
  id v14 = v8;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 32);
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v20);
}

void sub_100042518(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 80) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    id v4 = WeakRetained;
    if (!WeakRetained)
    {
      GEOFindOrCreateLog();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v110 = "MapsSuggestionsReservationsSource.m";
        __int16 v111 = 1026;
        *(_DWORD *)uint64_t v112 = 262;
        *(_WORD *)&v112[4] = 2082;
        *(void *)&v112[6] = "-[MapsSuggestionsReservationsSource _entriesForExtension:completion:]_block_invoke_2";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      goto LABEL_21;
    }
    if ([WeakRetained isSuspended])
    {
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = [v4 uniqueName];
        *(_DWORD *)buf = 138412546;
        uint64_t v110 = v6;
        __int16 v111 = 2080;
        *(void *)uint64_t v112 = "expectResponseClass";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      id v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expectResponseClass", "", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_21;
    }
    id v9 = *(id *)(a1 + 32);
    objc_opt_class();
    uint64_t v87 = v9;
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v9 || *(void *)(a1 + 40))
    {
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [v4 uniqueName];
        *(_DWORD *)buf = 138412546;
        uint64_t v110 = v11;
        __int16 v111 = 2080;
        *(void *)uint64_t v112 = "expectResponseClass";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v12 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expectResponseClass", "", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_20;
    }
    id v13 = *(void **)(a1 + 48);
    id v14 = *(void **)(a1 + 56);
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_1000434FC;
    v91[3] = &unk_100072488;
    id v92 = *(id *)(a1 + 64);
    id v93 = v4;
    id v94 = *(id *)(a1 + 72);
    id v77 = v13;
    id v78 = v14;
    id v72 = v91;
    id v15 = [v9 userCurrentBookings];
    __int16 v79 = objc_opt_new();
    group = dispatch_group_create();
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = v15;
    id v90 = [obj countByEnumeratingWithState:&v98 objects:buf count:16];
    if (!v90)
    {
LABEL_65:

      id v67 = v4[1];
      *(void *)block = _NSConcreteStackBlock;
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = sub_10004426C;
      *(void *)&block[24] = &unk_100071F88;
      id v68 = v72;
      *(void *)&block[32] = v79;
      id v114 = v68;
      id v69 = v79;
      dispatch_group_notify(group, v67, block);

LABEL_20:
LABEL_21:

      return;
    }
    uint64_t v89 = *(void *)v99;
LABEL_25:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v99 != v89) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v98 + 1) + 8 * v16);
      if ([v4 isSuspended]) {
        goto LABEL_65;
      }
      id v18 = objc_alloc((Class)NSString);
      uint64_t v19 = [v17 restaurant];
      id v20 = [v19 name];
      long long v21 = [v17 bookingDate];
      id v22 = [v18 initWithFormat:@"%@ at %@", v20, v21];

      id v23 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)block = 138412290;
        *(void *)&void block[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Treating reservation %@", block, 0xCu);
      }

      int8x8_t v24 = [v17 bookingDate];
      id v25 = v17;
      if (!v25) {
        break;
      }
      uint64_t v26 = v25;
      BOOL v27 = [v25 status] == (id)2;

      if (v27) {
        goto LABEL_49;
      }
      id v28 = v24;
      if (!v28)
      {
        id v58 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)block = 136446978;
          *(void *)&void block[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationsSource.m";
          *(_WORD *)&block[12] = 1024;
          *(_DWORD *)&block[14] = 205;
          *(_WORD *)&block[18] = 2082;
          *(void *)&block[20] = "BOOL _isOlderThanEarliestBookingDate(NSDate *__strong)";
          *(_WORD *)&block[28] = 2082;
          *(void *)&block[30] = "nil == (date)";
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a data", block, 0x26u);
        }

LABEL_54:
        unint64_t v54 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)block = 0;
          id v55 = v54;
          os_log_type_t v56 = OS_LOG_TYPE_ERROR;
          id v57 = "Is before the earliest booking date! Skipping.";
LABEL_56:
          _os_log_impl((void *)&_mh_execute_header, v55, v56, v57, block, 2u);
        }
        goto LABEL_57;
      }
      uint64_t v29 = v28;
      GEOConfigGetDouble();
      id v30 = MapsSuggestionsNowWithOffset();
      id v31 = [v30 earlierDate:v29];
      BOOL v32 = v31 == v29;

      if (v32) {
        goto LABEL_54;
      }
      uint64_t v33 = [v26 bookingDate];
      MapsSuggestionsSecondsTo();
      BOOL v35 = v34 > 43200.0;

      if (!v35)
      {
        dispatch_group_enter(group);
        v95[0] = _NSConcreteStackBlock;
        v95[1] = 3221225472;
        v95[2] = sub_1000441E0;
        v95[3] = &unk_100072618;
        uint64_t v96 = v79;
        __int16 v97 = group;
        id v85 = v26;
        id v74 = v77;
        id v83 = v78;
        char v80 = v95;
        objc_initWeak(&location, v4);
        id v36 = v4[1];
        GEOFindOrCreateLog();
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          id v38 = [v4 uniqueName];
          *(_DWORD *)uint64_t v118 = 138412546;
          id v119 = v38;
          __int16 v120 = 2080;
          v121 = "ticketForExternalBusinessID";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", v118, 0x16u);
        }
        unint64_t v39 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v39))
        {
          *(_WORD *)uint64_t v118 = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ticketForExternalBusinessID", "", v118, 2u);
        }

        GEOFindOrCreateLog();
        unint64_t v40 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          long long v41 = [v85 restaurant];
          id v42 = [v41 restaurantIdentifier];
          char v43 = [v85 restaurant];
          __int16 v44 = [v43 vendorIdentifier];
          *(_DWORD *)uint64_t v118 = 138478083;
          id v119 = v42;
          __int16 v120 = 2113;
          v121 = v44;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Looking for business '%{private}@' as known to '%{private}@'", v118, 0x16u);
        }
        *(void *)block = _NSConcreteStackBlock;
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = sub_1000442C4;
        *(void *)&block[24] = &unk_100072668;
        objc_copyWeak(v117, &location);
        id v75 = v80;
        id v116 = v75;
        id v86 = v85;
        *(void *)&block[32] = v86;
        id v73 = v83;
        id v114 = v73;
        id v76 = v36;
        id v115 = v76;
        uint64_t v81 = objc_retainBlock(block);
        uint64_t v45 = [v86 restaurant];
        uint64_t v46 = [v45 restaurantIdentifier];
        uint64_t v47 = [v86 restaurant];
        id v48 = [v47 vendorIdentifier];
        id v49 = v46;
        id v50 = v48;
        id v84 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%@", v49, v50];

        id v51 = [v4[3] objectForKeyedSubscript:v84];
        if (v51)
        {
          __int16 v52 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint64_t v118 = 138412290;
            id v119 = v84;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Found %@ in our cache!", v118, 0xCu);
          }

          (*((void (**)(unsigned char *, void *))v81 + 2))(v81, v51);
        }
        else
        {
          long long v59 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint64_t v118 = 138412290;
            id v119 = v84;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Didn't find %@ in our cache. Asking GeoServices...", v118, 0xCu);
          }

          long long v60 = +[GEOMapService sharedService];
          uint64_t v71 = [v60 defaultTraits];

          long long v61 = +[GEOMapService sharedService];
          long long v62 = [v86 restaurant];
          uint64_t v63 = [v62 restaurantIdentifier];
          uint64_t v64 = [v86 restaurant];
          uint64_t v65 = [v64 vendorIdentifier];
          uint64_t v70 = [v61 ticketForExternalBusinessID:v63 contentProvider:v65 traits:v71];

          v102[0] = _NSConcreteStackBlock;
          v102[1] = 3221225472;
          v102[2] = sub_100044EA0;
          v102[3] = &unk_1000726B8;
          id v103 = v76;
          objc_copyWeak(&v107, &location);
          uint64_t v105 = v75;
          id v104 = v84;
          uint64_t v106 = v81;
          [v70 submitWithHandler:v102 networkActivity:0];

          objc_destroyWeak(&v107);
        }

        objc_destroyWeak(v117);
        objc_destroyWeak(&location);

        unint64_t v54 = v96;
        goto LABEL_57;
      }
LABEL_58:

      if (v90 == (id)++v16)
      {
        id v66 = [obj countByEnumeratingWithState:&v98 objects:buf count:16];
        id v90 = v66;
        if (v66) {
          goto LABEL_25;
        }
        goto LABEL_65;
      }
    }
    id v53 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)block = 136446978;
      *(void *)&void block[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationsSource.m";
      *(_WORD *)&block[12] = 1024;
      *(_DWORD *)&block[14] = 338;
      *(_WORD *)&block[18] = 2082;
      *(void *)&block[20] = "BOOL _isDenied(INRestaurantReservationUserBooking *__strong)";
      *(_WORD *)&block[28] = 2082;
      *(void *)&block[30] = "nil == (booking)";
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a booking", block, 0x26u);
    }

LABEL_49:
    unint64_t v54 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)block = 0;
      id v55 = v54;
      os_log_type_t v56 = OS_LOG_TYPE_DEBUG;
      id v57 = "This one was actually denied! Skipping.";
      goto LABEL_56;
    }
LABEL_57:

    goto LABEL_58;
  }
}

void sub_10004349C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id *a28)
{
}

void sub_1000434FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [*(id *)(a1 + 40) uniqueName];
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2080;
    id v10 = "expectResponseClass";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expectResponseClass", "", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100043670(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(a1 + 8);
    if (!v5 || v6)
    {
      (*((void (**)(void))a1[6] + 2))();
      if (v5 && v8) {
        [v8 cancelExtensionRequestWithIdentifier:v5];
      }
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed because requestIdentifier == nil || error is %@", buf, 0xCu);
      }

      id v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        id v31 = v16;
        __int16 v32 = 2080;
        *(void *)uint64_t v33 = "restaurantReservationIntentRequest";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      __int16 v9 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "restaurantReservationIntentRequest", "", buf, 2u);
      }
    }
    else
    {
      __int16 v9 = [a1[4] _extensionContextForUUID:v5];
      id v17 = [v9 _auxiliaryConnection];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      void v24[2] = sub_100043B40;
      v24[3] = &unk_100072578;
      objc_copyWeak(&v29, a1 + 7);
      id v28 = a1[6];
      id v8 = v8;
      id v25 = v8;
      id v26 = v5;
      id v27 = 0;
      id v10 = [v17 remoteObjectProxyWithErrorHandler:v24];
      id v11 = [a1[5] identifier];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100043DE0;
      v18[3] = &unk_1000725C8;
      id v12 = v10;
      id v19 = v12;
      id v20 = a1[5];
      objc_copyWeak(&v23, a1 + 7);
      uint64_t v6 = 0;
      id v22 = a1[6];
      id v13 = v11;
      id v21 = v13;
      [v12 beginTransactionWithIntentIdentifier:v13 completion:v18];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v29);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v31 = "MapsSuggestionsReservationsSource.m";
      __int16 v32 = 1026;
      *(_DWORD *)uint64_t v33 = 296;
      *(_WORD *)&v33[4] = 2082;
      *(void *)&v33[6] = "-[MapsSuggestionsReservationsSource _handleIntent:withExtension:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v8 = v9;
  }
}

void sub_100043B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_100043B40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      id v12 = "MapsSuggestionsReservationsSource.m";
      __int16 v13 = 1026;
      LODWORD(v14[0]) = 312;
      WORD2(v14[0]) = 2082;
      *(void *)((char *)v14 + 6) = "-[MapsSuggestionsReservationsSource _handleIntent:withExtension:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }

    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v5 = *(void **)(a1 + 32);
  if (v5 && *(void *)(a1 + 40))
  {
    objc_msgSend(v5, "cancelExtensionRequestWithIdentifier:");
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *(char **)(a1 + 48);
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "failed because error {%@} occured on the connection", (uint8_t *)&v11, 0xCu);
    }

    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __int16 v9 = [WeakRetained uniqueName];
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2080;
      v14[0] = "restaurantReservationIntentRequest";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v11, 0x16u);
    }
    id v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "restaurantReservationIntentRequest", "", (uint8_t *)&v11, 2u);
    }
LABEL_13:
  }
}

void sub_100043DE0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100043ED0;
  v4[3] = &unk_1000725A0;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v2 handleIntent:v3 withCompletion:v4];

  objc_destroyWeak(&v8);
}

void sub_100043EBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100043ED0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100044094;
    v17[3] = &unk_100071C28;
    void v17[4] = WeakRetained;
    [v14 completeTransactionWithIntentIdentifier:v15 completion:v17];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v19 = "MapsSuggestionsReservationsSource.m";
      __int16 v20 = 1026;
      int v21 = 325;
      __int16 v22 = 2082;
      id v23 = "-[MapsSuggestionsReservationsSource _handleIntent:withExtension:completion:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100044094(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uniqueName];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2080;
    id v8 = "restaurantReservationIntentRequest";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v5, 0x16u);
  }
  id v4 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v5) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "restaurantReservationIntentRequest", "", (uint8_t *)&v5, 2u);
  }
}

void sub_1000441E0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) addObject:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100044258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004426C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000442C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  int v5 = WeakRetained;
  if (!WeakRetained || [WeakRetained isSuspended])
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Suspended", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __int16 v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v5 uniqueName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "ticketForExternalBusinessID";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    id v9 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
LABEL_9:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ticketForExternalBusinessID", "", buf, 2u);
      goto LABEL_37;
    }
    goto LABEL_37;
  }
  if (v3)
  {
    id v11 = *(void **)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100044C80;
    v53[3] = &unk_100072640;
    unint64_t v54 = *(id *)(a1 + 48);
    objc_copyWeak(&v56, (id *)(a1 + 64));
    id v55 = *(id *)(a1 + 56);
    id v12 = v3;
    id v13 = v11;
    id v52 = v10;
    id v49 = v53;
    id v50 = v5[1];
    GEOConfigGetDouble();
    double v15 = v14;
    uint64_t v16 = [v13 bookingDate];
    GEOConfigGetDouble();
    id v51 = objc_msgSend(v16, "dateByAddingTimeInterval:");

    id v17 = [v13 restaurant];
    id v18 = [v17 name];
    if (v18)
    {
      id v19 = [v13 restaurant];
      __int16 v20 = [v19 name];
      BOOL v21 = [v20 length] == 0;

      if (!v21)
      {
        __int16 v22 = [v13 restaurant];
        id v23 = [v22 name];
        int8x8_t v24 = +[MapsSuggestionsEntry entryWithType:8 title:v23 subtitle:0 weight:v51 expires:0 sourceSpecificInfo:v15];

        unint64_t v25 = (unint64_t)[v13 status];
        if (v25 > 2) {
          uint64_t v26 = 0;
        }
        else {
          uint64_t v26 = qword_100056580[v25];
        }
        [v24 setInteger:v26 forKey:@"MapsSuggestionsReservationsStatusKey"];
        id v30 = [v12 timezone];
        id v31 = [v30 name];
        [v24 setString:v31 forKey:@"MapsSuggestionsEventTimeZoneKey"];

        [v24 setNumber:&off_100074E70 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];
        [v24 setGeoMapItem:v12];
        uint64_t v32 = [v13 bookingDate];
        [v24 setDate:v32 forKey:@"MapsSuggestionsScheduledTimeKey"];

        uint64_t v33 = [v13 bookingIdentifier];
        LOBYTE(v32) = v33 == 0;

        if ((v32 & 1) == 0)
        {
          double v34 = [v13 bookingIdentifier];
          [v24 setString:v34 forKey:@"MapsSuggestionsReservationsBookingIDKey"];

          [v24 setString:@"MapsSuggestionsReservationsBookingIDKey" forKey:@"MapsSuggestionsPrimaryKey"];
          BOOL v35 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 partySize]);
          [v24 setNumber:v35 forKey:@"MapsSuggestionsReservationsPartySizeKey"];

          id v36 = [v13 restaurant];
          id v37 = [v36 restaurantIdentifier];
          if (v37)
          {
            [v24 setString:v37 forKey:@"MapsSuggestionsReservationsRestaurantIDKey"];
          }
          else
          {
            id v38 = +[NSUUID UUID];
            unint64_t v39 = [v38 UUIDString];
            [v24 setString:v39 forKey:@"MapsSuggestionsReservationsRestaurantIDKey"];
          }
          [v24 setString:v52 forKey:@"MapsSuggestionsOriginBundleIDKey"];
          if (v52)
          {
            id v40 = objc_alloc((Class)NSSet);
            id v64 = v52;
            long long v41 = +[NSArray arrayWithObjects:&v64 count:1];
            id v42 = [v40 initWithArray:v41];

            [v24 setSet:v42 forKey:@"MapsSuggestionsAssociatedBundleIDsKey"];
          }
          id v48 = objc_msgSend(v13, "_maps_schemaOrgRepresentationWithGEOMapItem:", v12);
          char v43 = +[SGSuggestionsService serviceForEvents];
          __int16 v44 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v45 = [v5 uniqueName];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v45;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "keysForSchemas";
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
          }
          uint64_t v46 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v46))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "keysForSchemas", "", buf, 2u);
          }

          uint64_t v63 = v48;
          uint64_t v47 = +[NSArray arrayWithObjects:&v63 count:1];
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100045454;
          id v58 = &unk_100072708;
          int8x8_t v24 = v24;
          long long v59 = v24;
          long long v60 = v5;
          id v61 = v50;
          long long v62 = v49;
          [v43 keysForSchemas:v47 completion:buf];
        }
LABEL_36:

        objc_destroyWeak(&v56);
        id v9 = v54;
        goto LABEL_37;
      }
    }
    else
    {
    }
    int8x8_t v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not create an entry for restaurant reservation %@ because the name of the restaurant is nil", buf, 0xCu);
    }
    goto LABEL_36;
  }
  id v27 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not get a MapItem", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v28 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v29 = [v5 uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "ticketForExternalBusinessID";
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
  }
  id v9 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    goto LABEL_9;
  }
LABEL_37:
}

void sub_100044C64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100044C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [WeakRetained uniqueName];
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2080;
      v11[0] = "ticketForExternalBusinessID";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    __int16 v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v_Block_object_dispose(&STACK[0x218], 8) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ticketForExternalBusinessID", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsReservationsSource.m";
      __int16 v10 = 1026;
      LODWORD(v11[0]) = 435;
      WORD2(v11[0]) = 2082;
      *(void *)((char *)v11 + 6) = "-[MapsSuggestionsReservationsSource _createEntryForBooking:vendorID:bundleID:comple"
                                     "tion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void sub_100044EA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(NSObject **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100044FC0;
  v10[3] = &unk_100072690;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  id v11 = v5;
  id v12 = v6;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void sub_100044FC0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) count] && !*(void *)(a1 + 40))
    {
      if ([WeakRetained isSuspended])
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        id v8 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          id v9 = [WeakRetained uniqueName];
          int v12 = 138412546;
          id v13 = v9;
          __int16 v14 = 2080;
          *(void *)id v15 = "ticketForExternalBusinessID";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v12, 0x16u);
        }
        __int16 v7 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v7))
        {
          LOWORD(v12) = 0;
          goto LABEL_10;
        }
      }
      else
      {
        __int16 v10 = [*(id *)(a1 + 32) firstObject];
        __int16 v7 = MapsSuggestionsMapItemConvertIfNeeded();

        if (v7)
        {
          [WeakRetained[3] setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        }
        else
        {
          id v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            int v12 = 136446978;
            id v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationsSource.m";
            __int16 v14 = 1024;
            *(_DWORD *)id v15 = 473;
            *(_WORD *)&v15[4] = 2082;
            *(void *)&void v15[6] = "-[MapsSuggestionsReservationsSource _createEntryForBooking:vendorID:bundleID:completion:]_block_invoke";
            __int16 v16 = 2082;
            id v17 = "nil == (mapItem)";
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Could not convert MapItem", (uint8_t *)&v12, 0x26u);
          }

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          __int16 v7 = 0;
        }
      }
    }
    else
    {
      id v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        int v12 = 136315394;
        id v13 = "-[MapsSuggestionsReservationsSource _createEntryForBooking:vendorID:bundleID:completion:]_block_invoke";
        __int16 v14 = 2112;
        *(void *)id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s could not get MapItem: %@", (uint8_t *)&v12, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [WeakRetained uniqueName];
        int v12 = 138412546;
        id v13 = v6;
        __int16 v14 = 2080;
        *(void *)id v15 = "ticketForExternalBusinessID";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v12, 0x16u);
      }
      __int16 v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v12) = 0;
LABEL_10:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ticketForExternalBusinessID", "", (uint8_t *)&v12, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      id v13 = "MapsSuggestionsReservationsSource.m";
      __int16 v14 = 1026;
      *(_DWORD *)id v15 = 457;
      *(_WORD *)&v15[4] = 2082;
      *(void *)&void v15[6] = "-[MapsSuggestionsReservationsSource _createEntryForBooking:vendorID:bundleID:completion:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

void sub_100045454(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "keysForSchemas received error: %@", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if ([v5 count])
  {
    __int16 v7 = [v5 firstObject];
    [*(id *)(a1 + 32) setString:v7 forKey:@"MapsSuggestionsCoreSuggestionsOpaqueKey"];
LABEL_6:
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  id v8 = *(NSObject **)(a1 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045618;
  block[3] = &unk_1000726E0;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 32);
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void sub_100045618(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = GEOFindOrCreateLog();
  uint64_t v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [WeakRetained uniqueName];
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2080;
      v11[0] = "keysForSchemas";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v_Block_object_dispose(&STACK[0x218], 8) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "keysForSchemas", "", (uint8_t *)&v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    __int16 v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "MapsSuggestionsReservationsSource.m";
      __int16 v10 = 1026;
      LODWORD(v11[0]) = 543;
      WORD2(v11[0]) = 2082;
      *(void *)((char *)v11 + 6) = "-[MapsSuggestionsReservationsSource _handleTicketResponseWithMapItem:booking:bundle"
                                     "ID:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

id sub_100045B70(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setSuspended:0];
}

id sub_100045C14(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setSuspended:1];
}

void sub_100045D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100045D34(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  uint64_t v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [WeakRetained uniqueName];
      id v6 = NSStringFromMapsSuggestionsCurrentBestLocation();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"ALL";
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
    }
    if ([WeakRetained isSuspended])
    {
      __int16 v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Source was suspended.", buf, 2u);
      }

      [WeakRetained addOrUpdateMySuggestionEntries:&__NSArray0__struct];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
    }
    else
    {
      id v10 = *(id *)(a1 + 32);
      id v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = [WeakRetained uniqueName];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "_getAllUserCurrentBookingsWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
      }
      id v13 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_getAllUserCurrentBookingsWithHandler", "", buf, 2u);
      }

      objc_initWeak(&location, WeakRetained);
      if (+[MapsSuggestionsSiri isEnabled])
      {
        id v14 = objc_alloc_init((Class)INGetUserCurrentRestaurantReservationBookingsIntent);
        GEOConfigGetDouble();
        __int16 v16 = +[NSDate dateWithTimeIntervalSinceNow:-v15];
        [v14 setEarliestBookingDateForResults:v16];

        id v31 = _NSConcreteStackBlock;
        uint64_t v32 = 3221225472;
        uint64_t v33 = sub_100040CD0;
        double v34 = &unk_100072460;
        objc_copyWeak(&v36, &location);
        id v35 = v10;
        id v17 = v14;
        id v18 = &v31;
        objc_initWeak(&from, WeakRetained);
        id v19 = WeakRetained[1];
        GEOFindOrCreateLog();
        __int16 v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          BOOL v21 = objc_msgSend(WeakRetained, "uniqueName", v31, v32, v33, v34, v35);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "managerWithExtensionLookupPolicy";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
        }
        __int16 v22 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "managerWithExtensionLookupPolicy", "", buf, 2u);
        }

        id v23 = (objc_class *)objc_opt_class();
        int8x8_t v24 = NSStringFromClass(v23);
        char v43 = v24;
        unint64_t v25 = +[NSArray arrayWithObjects:&v43 count:1];
        uint64_t v26 = +[NSExtension _intents_extensionMatchingAttributesForIntents:v25];

        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100040F0C;
        *(void *)&unsigned char buf[24] = &unk_1000724D8;
        id v27 = v19;
        id v40 = v27;
        objc_copyWeak(v42, &from);
        v42[1] = "_entriesForIntent:completion:";
        id v28 = v18;
        long long v41 = v28;
        +[NSExtension extensionsWithMatchingAttributes:v26 completion:buf];

        objc_destroyWeak(v42);
        objc_destroyWeak(&from);

        objc_destroyWeak(&v36);
      }
      else
      {
        id v29 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", buf, 2u);
        }

        id v30 = WeakRetained[1];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100040AB4;
        *(void *)&unsigned char buf[24] = &unk_100071F60;
        objc_copyWeak((id *)&v41, &location);
        id v40 = v10;
        dispatch_async(v30, buf);

        objc_destroyWeak((id *)&v41);
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v9 = v3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsReservationsSource.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 631;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsReservationsSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100046454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15, id location)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak(&a15);
  _Unwind_Resume(a1);
}

void sub_100047A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location, id a12)
{
  id v17 = v16;

  objc_destroyWeak(&location);
  objc_destroyWeak(&a12);
  _Unwind_Resume(a1);
}

void sub_100047BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)MapsSuggestionsSourceWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100047C74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v33 = v3;
  if (v3)
  {
    if ([*(id *)(a1 + 8) containsObject:v3])
    {
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "WARNING: already had connection %@", buf, 0xCu);
      }
    }
    uint64_t v32 = MapsSuggestionsIPCPeerIdentifier();
    uint64_t v5 = MapsSuggestionsIPCPayloadForNSString();
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v42 = 2048;
      *(void *)char v43 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Incoming connection comes from %@ (%llu)", buf, 0x16u);
    }

    [*(id *)(a1 + 8) addObject:v33];
    id v7 = [*(id *)(a1 + 8) count];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      if (v7 == (id)1)
      {
        uint64_t v8 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "This is the first connection", buf, 2u);
        }

        id v9 = objc_loadWeakRetained((id *)(a1 + 32));
        id obj = [v9 startLocationUpdatesForDelegate:a1];

        uint64_t v10 = MapsSuggestionsBestLocation();
        id v11 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v10;

        [*(id *)(a1 + 48) start];
        if ([(id)objc_opt_class() disposition] == (id)1) {
          [*(id *)(a1 + 48) updateSuggestionEntriesWithHandler:0];
        }
        id v12 = objc_msgSend(WeakRetained, "signalPipeline", v32);
        [v12 start];

        id v13 = (char *)operator new(0x28uLL);
        strcpy(v13, "com.apple.maps.destinationd.launched");
        sub_10004B214(buf, v13, 0x24uLL);
        *(_DWORD *)&v43[10] = 0;
        if (v43[9] >= 0) {
          id v14 = buf;
        }
        else {
          id v14 = *(const char **)buf;
        }
        uint32_t v15 = notify_register_check(v14, (int *)&v43[10]);
        if (v15)
        {
          __int16 v16 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = buf;
            if (v43[9] < 0) {
              id v17 = *(unsigned char **)buf;
            }
            *(_DWORD *)uint64_t v46 = 136315394;
            uint64_t v47 = v17;
            __int16 v48 = 1024;
            uint32_t v49 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not register %s: status %d", v46, 0x12u);
          }
        }
        notify_set_state(*(int *)&v43[10], 0);
        id v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v19 = buf;
          if (v43[9] < 0) {
            id v19 = *(unsigned char **)buf;
          }
          *(_DWORD *)uint64_t v46 = 136315650;
          uint64_t v47 = v19;
          __int16 v48 = 1024;
          uint32_t v49 = *(_DWORD *)&v43[10];
          __int16 v50 = 2048;
          uint64_t v51 = v5;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Sending Darwin notification '%s' (token %d, state %llu)", v46, 0x1Cu);
        }

        notify_set_state(*(int *)&v43[10], v5);
        if (v43[9] >= 0) {
          __int16 v20 = buf;
        }
        else {
          __int16 v20 = *(const char **)buf;
        }
        notify_post(v20);
        if ((v43[9] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        operator delete(v13);
      }
      else
      {
        id v23 = [v33 remoteObjectProxy];
        char v24 = objc_opt_respondsToSelector();

        if ((v24 & 1) == 0)
        {
          id v31 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "For some weird reason, our connection is not right: %@", buf, 0xCu);
          }

          sub_1000484D8((id *)a1, v33);
          [v33 invalidate];
          goto LABEL_39;
        }
        if (![WeakRetained hasSourceData])
        {
LABEL_39:

          goto LABEL_40;
        }
        [WeakRetained sourceNames];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v25 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v37 != v26) {
                objc_enumerationMutation(obj);
              }
              id v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              id v29 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v28;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Already sending what we have on %@", buf, 0xCu);
              }

              id v30 = [WeakRetained entriesForSourceName:v28];
              sub_10004868C(a1, v30, v28);
            }
            id v25 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v25);
        }
      }
    }
    else
    {
      GEOFindOrCreateLog();
      __int16 v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "MapsSuggestionsSourceWrapper.mm";
        __int16 v42 = 1026;
        *(_DWORD *)char v43 = 102;
        *(_WORD *)&v43[4] = 2082;
        *(void *)&v43[6] = "-[MapsSuggestionsSourceWrapper _addMonitoredXPCConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", buf, 0x1Cu);
      }
      id obj = v22;
    }
    goto LABEL_39;
  }
  BOOL v21 = GEOFindOrCreateLog();
  uint64_t v32 = v21;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSourceWrapper.mm";
    __int16 v42 = 1024;
    *(_DWORD *)char v43 = 86;
    *(_WORD *)&v43[4] = 2082;
    *(void *)&v43[6] = "-[MapsSuggestionsSourceWrapper _addMonitoredXPCConnection:]";
    __int16 v44 = 2082;
    uint64_t v45 = "nil == (connection)";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Needs a connection", buf, 0x26u);
  }
LABEL_40:
}

void sub_1000483FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000484D8(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    if (WeakRetained)
    {
      [a1[1] removeObject:v3];
      objc_storeWeak(a1 + 3, 0);
      if (![a1[1] count])
      {
        [a1[6] stop];
        id v5 = objc_loadWeakRetained(a1 + 4);
        [v5 stopLocationUpdatesForDelegate:a1];

        id v6 = [WeakRetained signalPipeline];
        [v6 stop];
      }
    }
    else
    {
      GEOFindOrCreateLog();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136446722;
        id v9 = "MapsSuggestionsSourceWrapper.mm";
        __int16 v10 = 1026;
        int v11 = 152;
        __int16 v12 = 2082;
        id v13 = "-[MapsSuggestionsSourceWrapper _removeMonitoredXPCConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void sub_100048650(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10004868C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v22 = a3;
  if ([v22 length])
  {
    if (v4)
    {
      unsigned int v21 = [v4 count];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      char v24 = [WeakRetained destinationGraph];
      id v5 = [v4 copy];

      id v6 = (char *)[v5 count];
      if (v6)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          int v8 = [v5 objectAtIndexedSubscript:i];
          if ([v8 BOOLeanForKey:@"MapsSuggestionsIsNotADestinationKey" is:1])
          {
            id v9 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Entry not a destination, skipping Graph and ETA", buf, 2u);
            }
          }
          else
          {
            [v24 addEntry:v8];
            id v9 = MapsSuggestionsDestinationKey();
            __int16 v10 = [WeakRetained getETAForDestinationKey:v9];
            if (v10)
            {
              [v8 setETA:v10 forKey:@"MapsSuggestionsETAKey"];
              int v11 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v34 = (const char *)v9;
                _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Re-applied cached ETA for Entry with destination key '%@'", buf, 0xCu);
              }
            }
          }
        }
      }
      __int16 v12 = NSDataFromMapsSuggestionsEntries();
      id v13 = [v22 dataUsingEncoding:4];
      objc_initWeak((id *)buf, (id)a1);
      id v14 = *(NSObject **)(a1 + 16);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004A0E0;
      block[3] = &unk_1000727E8;
      objc_copyWeak(&v31, (id *)buf);
      unsigned int v32 = v21;
      id v15 = v12;
      id v29 = v15;
      id v16 = v13;
      id v30 = v16;
      dispatch_async(v14, block);
      id v17 = *(NSObject **)(a1 + 16);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10004A468;
      v26[3] = &unk_100071F10;
      id v18 = v24;
      id v27 = v18;
      dispatch_async(v17, v26);
      [v5 count];

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);

      id v4 = v5;
    }
    else
    {
      __int16 v20 = GEOFindOrCreateLog();
      id WeakRetained = v20;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        double v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSourceWrapper.mm";
        __int16 v35 = 1024;
        int v36 = 292;
        __int16 v37 = 2082;
        long long v38 = "-[MapsSuggestionsSourceWrapper _addOrUpdateSuggestionEntries:source:]";
        __int16 v39 = 2082;
        id v40 = "nil == (entries)";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires MapsSuggestionsEntries", buf, 0x26u);
      }
      id v4 = 0;
    }
  }
  else
  {
    id v19 = GEOFindOrCreateLog();
    id WeakRetained = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      double v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSourceWrapper.mm";
      __int16 v35 = 1024;
      int v36 = 291;
      __int16 v37 = 2082;
      long long v38 = "-[MapsSuggestionsSourceWrapper _addOrUpdateSuggestionEntries:source:]";
      __int16 v39 = 2082;
      id v40 = "0u == sourceName.length";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Source name", buf, 0x26u);
    }
  }
}

void sub_100048B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_100048E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048E74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    sub_100047C74((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v7 = 1026;
      int v8 = 144;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsSourceWrapper addMonitoredXPCConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_100048F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000490D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000490EC(uint64_t a1)
{
}

void sub_100049298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000492B4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained[1] containsObject:*(void *)(a1 + 32)] & 1) == 0) {
      sub_100047C74((uint64_t)v3, *(void **)(a1 + 32));
    }
    [v3[6] updateSuggestionEntriesOfType:*(void *)(a1 + 56) handler:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v7 = 1026;
      int v8 = 185;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsSourceWrapper forceEarlyUpdateForType:forXPCConnection:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_1000493E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000495C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000495E4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained[1] containsObject:*(void *)(a1 + 32)] & 1) == 0) {
      sub_100047C74((uint64_t)v3, *(void **)(a1 + 32));
    }
    id v4 = +[MapsSuggestionsEntry entryWithData:*(void *)(a1 + 40)];
    if (![v3[6] removeEntry:v4 behavior:*(void *)(a1 + 64) handler:*(void *)(a1 + 48)])(*(void (**)(void))(*(void *)(a1 + 48) + 16))(); {
  }
    }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v8 = 1026;
      int v9 = 207;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsSourceWrapper removeEntryData:behavior:forXPCConnection:handler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100049750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049940(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained[1] containsObject:*(void *)(a1 + 32)] & 1) == 0) {
      sub_100047C74((uint64_t)v3, *(void **)(a1 + 32));
    }
    id v4 = +[MapsSuggestionsEntry entryWithData:*(void *)(a1 + 40)];
    [v3[6] feedbackForEntry:v4 action:*(void *)(a1 + 56)];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v8 = 1026;
      int v9 = 233;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsSourceWrapper feedbackForEntryData:action:forXPCConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100049A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049C84(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained[1] containsObject:*(void *)(a1 + 32)] & 1) == 0) {
      sub_100047C74((uint64_t)v3, *(void **)(a1 + 32));
    }
    [v3[6] feedbackForMapItem:*(void *)(a1 + 40) action:*(void *)(a1 + 56)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v7 = 1026;
      int v8 = 254;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsSourceWrapper feedbackForMapItem:action:forXPCConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_100049DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049F94(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained[1] containsObject:*(void *)(a1 + 32)] & 1) == 0) {
      sub_100047C74((uint64_t)v3, *(void **)(a1 + 32));
    }
    [v3[6] feedbackForContact:*(void *)(a1 + 40) action:*(void *)(a1 + 56)];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v7 = 1026;
      int v8 = 274;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsSourceWrapper feedbackForContact:action:forXPCConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_10004A0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A0E0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  int v11 = WeakRetained;
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = WeakRetained[1];
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          __int16 v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          int v8 = [v7 remoteObjectProxyWithErrorHandler:&stru_1000727A0];
          __int16 v9 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            int v10 = *(_DWORD *)(a1 + 56);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)id v18 = v10;
            *(_WORD *)&void v18[4] = 2112;
            *(void *)&v18[6] = v7;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Sending %u entries over to %@", buf, 0x12u);
          }

          [v8 addOrUpdateSuggestionEntriesData:*(void *)(a1 + 32) sourceNameData:*(void *)(a1 + 40) handler:&stru_1000727C0];
        }
        id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)id v18 = "MapsSuggestionsSourceWrapper.mm";
      *(_WORD *)&v18[8] = 1026;
      *(_DWORD *)&v18[10] = 332;
      __int16 v19 = 2082;
      __int16 v20 = "-[MapsSuggestionsSourceWrapper _addOrUpdateSuggestionEntries:source:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10004A348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10004A38C(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "XPC Error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10004A44C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004A468(uint64_t a1)
{
  return [*(id *)(a1 + 32) rebalance];
}

void sub_10004A5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_10004A610(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v8 = 1026;
      int v9 = 363;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsSourceWrapper addOrUpdateSuggestionEntries:source:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
    int v4 = v5;
    goto LABEL_10;
  }
  id v3 = objc_loadWeakRetained(a1 + 7);
  int v4 = v3;
  if (!v3)
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      __int16 v7 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v8 = 1026;
      int v9 = 364;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsSourceWrapper addOrUpdateSuggestionEntries:source:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    int v4 = 0;
LABEL_10:

    goto LABEL_11;
  }
  [v3 replaceEntries:a1[4] sourceName:a1[5]];
  sub_10004868C((uint64_t)WeakRetained, a1[4], a1[5]);
LABEL_11:
}

void sub_10004A7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A994(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 48);
  id v2 = (id *)(v1 + 48);
  if (v3)
  {
    int v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136446978;
      int v6 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSourceWrapper.mm";
      __int16 v7 = 1024;
      int v8 = 382;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsSourceWrapper attachSource:]_block_invoke";
      __int16 v11 = 2082;
      long long v12 = "nil != self->_source";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. There is already a Source attached", (uint8_t *)&v5, 0x26u);
    }
  }
  else
  {
    objc_storeStrong(v2, *(id *)(a1 + 40));
  }
}

void sub_10004AB3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 48))
  {
    *(void *)(v1 + 4_Block_object_dispose(&STACK[0x218], 8) = 0;
    _objc_release_x1();
  }
  else
  {
    id v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = 136446978;
      int v4 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSourceWrapper.mm";
      __int16 v5 = 1024;
      int v6 = 392;
      __int16 v7 = 2082;
      int v8 = "-[MapsSuggestionsSourceWrapper detachSource:]_block_invoke";
      __int16 v9 = 2082;
      __int16 v10 = "source != self->_source";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. The Source you want to detach is not attached", (uint8_t *)&v3, 0x26u);
    }
  }
}

void sub_10004AD48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (MapsSuggestionsLoggingIsVerbose())
    {
      int v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v4 = *(char **)(a1 + 32);
        int v7 = 138412290;
        int v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Setting location: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    MapsSuggestionsSetMostRecentLocation();
    uint64_t v5 = MapsSuggestionsBestLocation();
    int v6 = WeakRetained[5];
    WeakRetained[5] = v5;
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v9 = 1026;
      int v10 = 406;
      __int16 v11 = 2082;
      long long v12 = "-[MapsSuggestionsSourceWrapper didUpdateLocation:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10004AEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004AFAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MapsSuggestionsLoggingIsVerbose())
    {
      id v2 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v5) = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Lost Location Permission", (uint8_t *)&v5, 2u);
      }
    }
    int v3 = (void *)*((void *)WeakRetained + 5);
    *((void *)WeakRetained + 5) = 0;

    MapsSuggestionsResetCurrentLocation();
    int v4 = objc_loadWeakRetained((id *)WeakRetained + 7);
    [v4 clearETAs];
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "MapsSuggestionsSourceWrapper.mm";
      __int16 v7 = 1026;
      int v8 = 417;
      __int16 v9 = 2082;
      int v10 = "-[MapsSuggestionsSourceWrapper didLoseLocationPermission]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_10004B134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_10004B214(unsigned char *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_10004B2B0();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int v5 = v8;
    int v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_10004B2B0()
{
}

void sub_10004B2C0()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10004B314(exception);
}

void sub_10004B300(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10004B314(std::logic_error *a1)
{
  id result = std::logic_error::logic_error(a1, "basic_string");
  return result;
}

void sub_10004B67C(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_100081F28;
  qword_100081F28 = v1;

  [(id)qword_100081F28 setDateStyle:0];
  int v3 = (void *)qword_100081F28;
  [v3 setTimeStyle:1];
}

void sub_10004BBF0(id a1)
{
  qword_100081F38 = objc_opt_new();
  _objc_release_x1();
}

void sub_10004BC2C()
{
  if (!qword_100081F48)
  {
    uint64_t v0 = +[NSBundle bundleWithIdentifier:@"com.apple.MapsSuggestions"];
    uint64_t v1 = (void *)qword_100081F48;
    qword_100081F48 = v0;

    if (!qword_100081F48)
    {
      id v2 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        int v3 = 136446978;
        int v4 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDefines.h";
        __int16 v5 = 1024;
        int v6 = 324;
        __int16 v7 = 2082;
        int v8 = "NSBundle * _Nonnull _MapsSuggestionsBundle(const char * _Nonnull)_block_invoke";
        __int16 v9 = 2082;
        int v10 = "nil == s_bundleWithMapsSuggestionsIdentifier";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires bundleWithIdentifier:@\"com.apple.MapsSuggestions\"", (uint8_t *)&v3, 0x26u);
      }
    }
  }
}

id sub_10004BF7C(id a1)
{
  return &off_100074EB8;
}

id sub_10004BF8C(id a1)
{
  return &off_100074EB8;
}

id sub_10004BF98(id a1)
{
  return &off_100074EB8;
}

id sub_10004BFA4(id a1)
{
  return &off_100074EB8;
}

id sub_10004BFB0(id a1)
{
  return &off_100074EB8;
}

id sub_10004BFBC(id a1)
{
  return &off_100074EB8;
}

id sub_10004BFC8(id a1)
{
  return &off_100074EB8;
}

id sub_10004BFD4(id a1)
{
  return &off_100074EB8;
}

id sub_10004BFE0(id a1)
{
  return &__kCFBooleanFalse;
}

void sub_10004C92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004C950(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = GEOFindOrCreateLog();
  __int16 v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = [WeakRetained uniqueName];
      __int16 v7 = NSStringFromMapsSuggestionsCurrentBestLocation();
      *(_DWORD *)buf = 138412802;
      long long v14 = v6;
      __int16 v15 = 2112;
      *(void *)id v16 = @"ALL";
      *(_WORD *)&v16[8] = 2112;
      *(void *)&v16[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} UPDATING SOURCE{%@} for TYPE{%@} at LATLONG{%@}", buf, 0x20u);
    }
    int v8 = (void *)WeakRetained[1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_10004CBA0;
    v10[3] = &unk_100072B90;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 32);
    [v8 fetchConnectionEntriesWithHandler:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    __int16 v9 = v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v14 = "MapsSuggestionsAppConnectionSource.m";
      __int16 v15 = 1026;
      *(_DWORD *)id v16 = 121;
      *(_WORD *)&void v16[4] = 2082;
      *(void *)&v16[6] = "-[MapsSuggestionsAppConnectionSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10004CB84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10004CBA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v25 = a1;
    if (v6)
    {
      int v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = [v6 localizedDescription];
        *(_DWORD *)buf = 138412290;
        __int16 v39 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received an error inside getRecentAppConnection: %@", buf, 0xCu);
      }
    }
    id v27 = v6;
    id v10 = v5;
    id v29 = [v10 mutableCopy];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:buf count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        __int16 v15 = 0;
        id v28 = v13;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v15);
          id v17 = objc_msgSend(v16, "stringForKey:", @"MapsSuggestionsOriginBundleIDKey", v25);
          if ([v17 length])
          {
            [WeakRetained[3] registerBundleID:v17 withSource:WeakRetained];
            if ([WeakRetained[3] isBundleIDLocked:v17 forSource:WeakRetained])
            {
              id v18 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                __int16 v19 = [v16 title];
                *(_DWORD *)double v34 = 138412546;
                __int16 v35 = v19;
                __int16 v36 = 2112;
                __int16 v37 = v17;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Entry \"%@\" dropped because %@ is locked", v34, 0x16u);

                id v13 = v28;
              }
            }
            else
            {
              if (+[MapsSuggestionsSiri canLearnFromBundleID:v17])goto LABEL_19; {
              id v18 = GEOFindOrCreateLog();
              }
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)double v34 = 0;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "App prevents us from Learning. Returning.", v34, 2u);
              }
            }

            [v29 removeObjectIdenticalTo:v16];
          }
LABEL_19:

          __int16 v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:buf count:16];
      }
      while (v13);
    }

    id v5 = [v29 copy];
    if (v5) {
      __int16 v20 = v5;
    }
    else {
      __int16 v20 = &__NSArray0__struct;
    }
    objc_msgSend(WeakRetained, "addOrUpdateMySuggestionEntries:", v20, v25);
    uint64_t v21 = *(void *)(v26 + 32);
    if (v21) {
      (*(void (**)(void))(v21 + 16))();
    }
    id v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [WeakRetained uniqueName];
      *(_DWORD *)buf = 138412546;
      __int16 v39 = v23;
      __int16 v40 = 2080;
      v41[0] = "updateSuggestionEntriesWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    char v24 = GEOFindOrCreateLog();
    id v6 = v27;
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    char v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v39 = "MapsSuggestionsAppConnectionSource.m";
      __int16 v40 = 1026;
      LODWORD(v41[0]) = 124;
      WORD2(v41[0]) = 2082;
      *(void *)((char *)v41 + 6) = "-[MapsSuggestionsAppConnectionSource updateSuggestionEntriesWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10004D95C(MapsSuggestionsTransportModePredictionInput *self, SEL a2, double a3)
{
  self->_distanceFromOriginToDestination = a3;
}

void sub_10004E040(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    int v3 = [[MapsSuggestionsTransportModePrediction alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10004E340(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    id v6 = [MapsSuggestionsTransportModePredictionOutput alloc];
    __int16 v7 = [v14 featureValueForName:@"actualTransportMode"];
    int v8 = [v7 stringValue];
    __int16 v9 = [v14 featureValueForName:@"actualTransportModeProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(MapsSuggestionsTransportModePredictionOutput *)v6 initWithActualTransportMode:v8 actualTransportModeProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void (**)(uint64_t, void, MapsSuggestionsTransportModePredictionOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10004E550(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    id v6 = [MapsSuggestionsTransportModePredictionOutput alloc];
    __int16 v7 = [v14 featureValueForName:@"actualTransportMode"];
    int v8 = [v7 stringValue];
    __int16 v9 = [v14 featureValueForName:@"actualTransportModeProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(MapsSuggestionsTransportModePredictionOutput *)v6 initWithActualTransportMode:v8 actualTransportModeProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void (**)(uint64_t, void, MapsSuggestionsTransportModePredictionOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t DayWeather.precipitationChance.getter()
{
  return DayWeather.precipitationChance.getter();
}

uint64_t type metadata accessor for DayWeather()
{
  return type metadata accessor for DayWeather();
}

uint64_t CurrentWeather.temperature.getter()
{
  return CurrentWeather.temperature.getter();
}

uint64_t CurrentWeather.metadata.getter()
{
  return CurrentWeather.metadata.getter();
}

uint64_t CurrentWeather.condition.getter()
{
  return CurrentWeather.condition.getter();
}

uint64_t type metadata accessor for CurrentWeather()
{
  return type metadata accessor for CurrentWeather();
}

uint64_t type metadata accessor for WeatherServiceCaching.Options()
{
  return type metadata accessor for WeatherServiceCaching.Options();
}

uint64_t type metadata accessor for WeatherNetworkActivity()
{
  return type metadata accessor for WeatherNetworkActivity();
}

uint64_t WeatherServiceFetchOptions.init(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:networkActivity:needsMarineData:needsTwilightData:)()
{
  return WeatherServiceFetchOptions.init(countryCode:timeZone:locationOptions:cachingOptions:treatmentIdentifiers:networkActivity:needsMarineData:needsTwilightData:)();
}

uint64_t type metadata accessor for WeatherServiceFetchOptions()
{
  return type metadata accessor for WeatherServiceFetchOptions();
}

uint64_t type metadata accessor for WeatherServiceLocationOptions()
{
  return type metadata accessor for WeatherServiceLocationOptions();
}

uint64_t static WeatherQuery.airQuality.getter()
{
  return static WeatherQuery.airQuality.getter();
}

uint64_t static WeatherQuery.daily.getter()
{
  return static WeatherQuery.daily.getter();
}

uint64_t static WeatherQuery.hourly.getter()
{
  return static WeatherQuery.hourly.getter();
}

uint64_t static WeatherQuery.current.getter()
{
  return static WeatherQuery.current.getter();
}

uint64_t WeatherService.fetchWeather<A, B, C, D>(for:including:_:_:_:options:completion:)()
{
  return WeatherService.fetchWeather<A, B, C, D>(for:including:_:_:_:options:completion:)();
}

uint64_t static WeatherService.shared.getter()
{
  return static WeatherService.shared.getter();
}

uint64_t type metadata accessor for WeatherService()
{
  return type metadata accessor for WeatherService();
}

uint64_t WeatherMetadata.expirationDate.getter()
{
  return WeatherMetadata.expirationDate.getter();
}

uint64_t WeatherMetadata.date.getter()
{
  return WeatherMetadata.date.getter();
}

uint64_t WeatherMetadata.location.getter()
{
  return WeatherMetadata.location.getter();
}

uint64_t type metadata accessor for WeatherMetadata()
{
  return type metadata accessor for WeatherMetadata();
}

uint64_t type metadata accessor for WeatherCondition()
{
  return type metadata accessor for WeatherCondition();
}

uint64_t AirQuality.index.getter()
{
  return AirQuality.index.getter();
}

uint64_t type metadata accessor for AirQuality()
{
  return type metadata accessor for AirQuality();
}

uint64_t Forecast.subscript.getter()
{
  return Forecast.subscript.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

uint64_t CLLocationCoordinateFromNSData()
{
  return _CLLocationCoordinateFromNSData();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

uint64_t GEOConfigGetDouble()
{
  return _GEOConfigGetDouble();
}

uint64_t GEOConfigGetInteger()
{
  return _GEOConfigGetInteger();
}

uint64_t GEOConfigGetPropertiesForKey()
{
  return _GEOConfigGetPropertiesForKey();
}

uint64_t GEOConfigSetBOOL()
{
  return _GEOConfigSetBOOL();
}

uint64_t GEOFindOrCreateLog()
{
  return _GEOFindOrCreateLog();
}

uint64_t GEOGetUserTransportTypePreference()
{
  return _GEOGetUserTransportTypePreference();
}

uint64_t MapsSuggestionsAlmostSameLocation()
{
  return _MapsSuggestionsAlmostSameLocation();
}

uint64_t MapsSuggestionsBestLocation()
{
  return _MapsSuggestionsBestLocation();
}

uint64_t MapsSuggestionsCoordinateFromEntry()
{
  return _MapsSuggestionsCoordinateFromEntry();
}

uint64_t MapsSuggestionsCurrentBestLocation()
{
  return _MapsSuggestionsCurrentBestLocation();
}

uint64_t MapsSuggestionsDefaultCacheDirectory()
{
  return _MapsSuggestionsDefaultCacheDirectory();
}

uint64_t MapsSuggestionsDestinationKey()
{
  return _MapsSuggestionsDestinationKey();
}

uint64_t MapsSuggestionsIPCPayloadForNSString()
{
  return _MapsSuggestionsIPCPayloadForNSString();
}

uint64_t MapsSuggestionsIPCPeerIdentifier()
{
  return _MapsSuggestionsIPCPeerIdentifier();
}

uint64_t MapsSuggestionsIsInTheFuture()
{
  return _MapsSuggestionsIsInTheFuture();
}

uint64_t MapsSuggestionsIsInThePast()
{
  return _MapsSuggestionsIsInThePast();
}

uint64_t MapsSuggestionsIsValidLocation()
{
  return _MapsSuggestionsIsValidLocation();
}

uint64_t MapsSuggestionsIsValidVisit()
{
  return _MapsSuggestionsIsValidVisit();
}

uint64_t MapsSuggestionsLocalizedCarPlayLowEVString()
{
  return _MapsSuggestionsLocalizedCarPlayLowEVString();
}

uint64_t MapsSuggestionsLocalizedCarPlayLowFuelAndEVBatteryString()
{
  return _MapsSuggestionsLocalizedCarPlayLowFuelAndEVBatteryString();
}

uint64_t MapsSuggestionsLocalizedCarPlayLowFuelString()
{
  return _MapsSuggestionsLocalizedCarPlayLowFuelString();
}

uint64_t MapsSuggestionsLocalizedFindEVChargerString()
{
  return _MapsSuggestionsLocalizedFindEVChargerString();
}

uint64_t MapsSuggestionsLocalizedFindStationForDieselCNGHybridString()
{
  return _MapsSuggestionsLocalizedFindStationForDieselCNGHybridString();
}

uint64_t MapsSuggestionsLocalizedFindStationString()
{
  return _MapsSuggestionsLocalizedFindStationString();
}

uint64_t MapsSuggestionsLoggingIsVerbose()
{
  return _MapsSuggestionsLoggingIsVerbose();
}

uint64_t MapsSuggestionsMapItemConvertIfNeeded()
{
  return _MapsSuggestionsMapItemConvertIfNeeded();
}

uint64_t MapsSuggestionsNonNilString()
{
  return _MapsSuggestionsNonNilString();
}

uint64_t MapsSuggestionsNow()
{
  return _MapsSuggestionsNow();
}

uint64_t MapsSuggestionsNowWithOffset()
{
  return _MapsSuggestionsNowWithOffset();
}

uint64_t MapsSuggestionsPeriodFromEntry()
{
  return _MapsSuggestionsPeriodFromEntry();
}

uint64_t MapsSuggestionsResetCurrentLocation()
{
  return _MapsSuggestionsResetCurrentLocation();
}

uint64_t MapsSuggestionsSecondsTo()
{
  return _MapsSuggestionsSecondsTo();
}

uint64_t MapsSuggestionsSetMostRecentLocation()
{
  return _MapsSuggestionsSetMostRecentLocation();
}

uint64_t MapsSuggestionsSignalTypeEnumerate()
{
  return _MapsSuggestionsSignalTypeEnumerate();
}

uint64_t MapsSuggestionsTimeSinceMidnightOfDate()
{
  return _MapsSuggestionsTimeSinceMidnightOfDate();
}

uint64_t MapsSuggestionsTimeZone()
{
  return _MapsSuggestionsTimeZone();
}

uint64_t MapsSuggestionsTransportModesToNSData()
{
  return _MapsSuggestionsTransportModesToNSData();
}

uint64_t NSDataFromMapsSuggestionsEntries()
{
  return _NSDataFromMapsSuggestionsEntries();
}

uint64_t NSDataFromMapsSuggestionsSignalPack()
{
  return _NSDataFromMapsSuggestionsSignalPack();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromMapsSuggestionsCurrentBestLocation()
{
  return _NSStringFromMapsSuggestionsCurrentBestLocation();
}

uint64_t NSStringFromMapsSuggestionsEntryType()
{
  return _NSStringFromMapsSuggestionsEntryType();
}

uint64_t NSStringFromMapsSuggestionsSignalType()
{
  return _NSStringFromMapsSuggestionsSignalType();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _GEOConfigHasValue()
{
  return __GEOConfigHasValue();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MSg::jsonFor(MSg *this, CLLocation *a2)
{
  return MSg::jsonFor(this, a2);
}

uint64_t MSg::jsonFor(MSg *this, NSDate *a2)
{
  return MSg::jsonFor(this, a2);
}

uint64_t MSg::jsonFor()
{
  return MSg::jsonFor();
}

{
  return MSg::jsonFor();
}

uint64_t MSg::jsonFor(MSg *this, double a2)
{
  return MSg::jsonFor(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
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

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t financeSourceFromResourceDepot()
{
  return _financeSourceFromResourceDepot();
}

void free(void *a1)
{
}

uint64_t isFinanceSourceEnabled()
{
  return _isFinanceSourceEnabled();
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

id objc_msgSend_ChanceOfPrecipitation(void *a1, const char *a2, ...)
{
  return _[a1 ChanceOfPrecipitation];
}

id objc_msgSend_DayOfWeek(void *a1, const char *a2, ...)
{
  return _[a1 DayOfWeek];
}

id objc_msgSend_DistanceFromHereToHome(void *a1, const char *a2, ...)
{
  return _[a1 DistanceFromHereToHome];
}

id objc_msgSend_DistanceFromHereToOrigin(void *a1, const char *a2, ...)
{
  return _[a1 DistanceFromHereToOrigin];
}

id objc_msgSend_DistanceFromHereToParkedCar(void *a1, const char *a2, ...)
{
  return _[a1 DistanceFromHereToParkedCar];
}

id objc_msgSend_DistanceFromHereToWork(void *a1, const char *a2, ...)
{
  return _[a1 DistanceFromHereToWork];
}

id objc_msgSend_DistanceFromOriginToDestination(void *a1, const char *a2, ...)
{
  return _[a1 DistanceFromOriginToDestination];
}

id objc_msgSend_ETAWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ETAWithData:");
}

id objc_msgSend_GEOErrorWithCode_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GEOErrorWithCode:reason:");
}

id objc_msgSend_MSg_mutableCopyIf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MSg_mutableCopyIf:");
}

id objc_msgSend_MapType_0(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MapType_0");
}

id objc_msgSend_MapType_1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MapType_1");
}

id objc_msgSend_MapType_2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MapType_2");
}

id objc_msgSend_MapType_3(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MapType_3");
}

id objc_msgSend_MapType_4(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MapType_4");
}

id objc_msgSend_Temperature(void *a1, const char *a2, ...)
{
  return _[a1 Temperature];
}

id objc_msgSend_TimeOfDay(void *a1, const char *a2, ...)
{
  return _[a1 TimeOfDay];
}

id objc_msgSend_TouristBit(void *a1, const char *a2, ...)
{
  return _[a1 TouristBit];
}

id objc_msgSend_URLOfModelInThisBundle(void *a1, const char *a2, ...)
{
  return _[a1 URLOfModelInThisBundle];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_UserPreferenceForTransportType_1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UserPreferenceForTransportType_1");
}

id objc_msgSend_UserPreferenceForTransportType_2(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UserPreferenceForTransportType_2");
}

id objc_msgSend_UserPreferenceForTransportType_3(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UserPreferenceForTransportType_3");
}

id objc_msgSend__accessoryDidConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDidConnect:");
}

id objc_msgSend__accessoryDidDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDidDisconnect:");
}

id objc_msgSend__accessoryDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDidUpdate:");
}

id objc_msgSend__accessoryDidUpdateVehicle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryDidUpdateVehicle:");
}

id objc_msgSend__addConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addConnection:");
}

id objc_msgSend__augmentMutableVehicleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentMutableVehicleInfo:");
}

id objc_msgSend__augmentVehicleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentVehicleInfo:");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return _[a1 _auxiliaryConnection];
}

id objc_msgSend__debugPrintOverviewOfConnections(void *a1, const char *a2, ...)
{
  return _[a1 _debugPrintOverviewOfConnections];
}

id objc_msgSend__disconnectFromVehicle(void *a1, const char *a2, ...)
{
  return _[a1 _disconnectFromVehicle];
}

id objc_msgSend__extensionContextForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extensionContextForUUID:");
}

id objc_msgSend__intents_extensionMatchingAttributesForIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intents_extensionMatchingAttributesForIntents:");
}

id objc_msgSend__isCurrentStateEqualLastPostedState(void *a1, const char *a2, ...)
{
  return _[a1 _isCurrentStateEqualLastPostedState];
}

id objc_msgSend__isValue_equalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValue:equalTo:");
}

id objc_msgSend__limitsPrecision(void *a1, const char *a2, ...)
{
  return _[a1 _limitsPrecision];
}

id objc_msgSend__maps_dayDescriptionStringShortDescription_timeZone_bookingDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maps_dayDescriptionStringShortDescription:timeZone:bookingDate:");
}

id objc_msgSend__maps_schemaOrgRepresentationWithGEOMapItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maps_schemaOrgRepresentationWithGEOMapItem:");
}

id objc_msgSend__migrate(void *a1, const char *a2, ...)
{
  return _[a1 _migrate];
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return _[a1 _plugIn];
}

id objc_msgSend__postNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _postNotificationIfNeeded];
}

id objc_msgSend__removeConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeConnection:");
}

id objc_msgSend__removeConnectionSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeConnectionSynchronously:");
}

id objc_msgSend__sendSignalPack_toConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendSignalPack:toConnection:");
}

id objc_msgSend__shouldNotifyObservers(void *a1, const char *a2, ...)
{
  return _[a1 _shouldNotifyObservers];
}

id objc_msgSend__startListenForDebugTestNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _startListenForDebugTestNotifications];
}

id objc_msgSend__stopListenForDebugTestNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopListenForDebugTestNotifications];
}

id objc_msgSend__stopMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 _stopMonitoring];
}

id objc_msgSend__updateForConnectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForConnectionState:");
}

id objc_msgSend__updateFromNotificationName_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFromNotificationName:userInfo:");
}

id objc_msgSend__updateLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocation:");
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return _[a1 accessory];
}

id objc_msgSend_actualTransportMode(void *a1, const char *a2, ...)
{
  return _[a1 actualTransportMode];
}

id objc_msgSend_actualTransportModeProbability(void *a1, const char *a2, ...)
{
  return _[a1 actualTransportModeProbability];
}

id objc_msgSend_addBreadCrumbIfWithin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBreadCrumbIfWithin:");
}

id objc_msgSend_addChildSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildSource:");
}

id objc_msgSend_addContainedBreadcrumb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContainedBreadcrumb:");
}

id objc_msgSend_addContainedEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContainedEntry:");
}

id objc_msgSend_addETA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addETA:");
}

id objc_msgSend_addEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntry:");
}

id objc_msgSend_addFeeler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFeeler:");
}

id objc_msgSend_addLinkOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLinkOption:");
}

id objc_msgSend_addMapsSyncObserver_forContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMapsSyncObserver:forContentType:");
}

id objc_msgSend_addMonitoredXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMonitoredXPCConnection:");
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

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOrUpdateMySuggestionEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateMySuggestionEntries:");
}

id objc_msgSend_addOrUpdateSuggestionEntriesData_sourceNameData_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateSuggestionEntriesData:sourceNameData:handler:");
}

id objc_msgSend_addPreloadableSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPreloadableSource:");
}

id objc_msgSend_addSessionObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSessionObserver:");
}

id objc_msgSend_addressDictionary(void *a1, const char *a2, ...)
{
  return _[a1 addressDictionary];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asyncBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncBlock:");
}

id objc_msgSend_beginExtensionRequestWithInputItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginExtensionRequestWithInputItems:completion:");
}

id objc_msgSend_beginTransactionWithIntentIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionWithIntentIdentifier:completion:");
}

id objc_msgSend_bookingDate(void *a1, const char *a2, ...)
{
  return _[a1 bookingDate];
}

id objc_msgSend_bookingIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bookingIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_BOOLeanForKey_is_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLeanForKey:is:");
}

id objc_msgSend_breadcrumbs(void *a1, const char *a2, ...)
{
  return _[a1 breadcrumbs];
}

id objc_msgSend_buildCompositeSourceFromResourceDepot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildCompositeSourceFromResourceDepot:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_canLearnFromBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canLearnFromBundleID:");
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelExtensionRequestWithIdentifier:");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_clearETAs(void *a1, const char *a2, ...)
{
  return _[a1 clearETAs];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_completeTransactionWithIntentIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithIntentIdentifier:completion:");
}

id objc_msgSend_componentsInTimeZone_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsInTimeZone:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_confidenceOfHavingBeenOnDestinationLink(void *a1, const char *a2, ...)
{
  return _[a1 confidenceOfHavingBeenOnDestinationLink];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return _[a1 connectedAccessories];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return _[a1 connectionID];
}

id objc_msgSend_considerMyAllowanceAsLimited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "considerMyAllowanceAsLimited:");
}

id objc_msgSend_considerMyNewLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "considerMyNewLocation:");
}

id objc_msgSend_considerMyNewVisit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "considerMyNewVisit:");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsDate:");
}

id objc_msgSend_containsEntryWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsEntryWithIdentifier:");
}

id objc_msgSend_containsKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsKey:");
}

id objc_msgSend_containsLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsLocation:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsTime:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_couldContainEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "couldContainEntry:");
}

id objc_msgSend_couldContainLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "couldContainLocation:");
}

id objc_msgSend_couldContainTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "couldContainTime:");
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

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentTripsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTripsWithHandler:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateForKey:");
}

id objc_msgSend_dateFormatFromTemplate_options_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatFromTemplate:options:locale:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return _[a1 defaultTraits];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForKey:");
}

id objc_msgSend_destinationAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationAtLocation:");
}

id objc_msgSend_destinationGraph(void *a1, const char *a2, ...)
{
  return _[a1 destinationGraph];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryValue];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_disposition(void *a1, const char *a2, ...)
{
  return _[a1 disposition];
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_distanceFromOriginToDestination(void *a1, const char *a2, ...)
{
  return _[a1 distanceFromOriginToDestination];
}

id objc_msgSend_distanceToRouteFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceToRouteFrom:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_durationSinceLastTransitHistoryRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationSinceLastTransitHistoryRoute:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earliestKnownTime(void *a1, const char *a2, ...)
{
  return _[a1 earliestKnownTime];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedFeatureDictionary(void *a1, const char *a2, ...)
{
  return _[a1 encodedFeatureDictionary];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_engineStateCNG(void *a1, const char *a2, ...)
{
  return _[a1 engineStateCNG];
}

id objc_msgSend_engineStateDiesel(void *a1, const char *a2, ...)
{
  return _[a1 engineStateDiesel];
}

id objc_msgSend_engineStateElectric(void *a1, const char *a2, ...)
{
  return _[a1 engineStateElectric];
}

id objc_msgSend_engineStateGasoline(void *a1, const char *a2, ...)
{
  return _[a1 engineStateGasoline];
}

id objc_msgSend_engineStates(void *a1, const char *a2, ...)
{
  return _[a1 engineStates];
}

id objc_msgSend_engineType(void *a1, const char *a2, ...)
{
  return _[a1 engineType];
}

id objc_msgSend_engineTypes(void *a1, const char *a2, ...)
{
  return _[a1 engineTypes];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return _[a1 entries];
}

id objc_msgSend_entriesForSourceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesForSourceName:");
}

id objc_msgSend_entriesFromPassesBefore_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesFromPassesBefore:handler:");
}

id objc_msgSend_entryWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryWithData:");
}

id objc_msgSend_entryWithType_title_subtitle_weight_expires_sourceSpecificInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryWithType:title:subtitle:weight:expires:sourceSpecificInfo:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_eta(void *a1, const char *a2, ...)
{
  return _[a1 eta];
}

id objc_msgSend_expires(void *a1, const char *a2, ...)
{
  return _[a1 expires];
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_extractFromDestinationEntry_originCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractFromDestinationEntry:originCoordinate:");
}

id objc_msgSend_extractFromDestinationMapItem_originCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractFromDestinationMapItem:originCoordinate:");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featureValueWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueWithDictionary:error:");
}

id objc_msgSend_featureValueWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueWithDouble:");
}

id objc_msgSend_featureValueWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueWithString:");
}

id objc_msgSend_featuresAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresAtIndex:");
}

id objc_msgSend_feedbackForContact_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackForContact:action:");
}

id objc_msgSend_feedbackForContact_action_forXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackForContact:action:forXPCConnection:");
}

id objc_msgSend_feedbackForEntry_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackForEntry:action:");
}

id objc_msgSend_feedbackForEntryData_action_forXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackForEntryData:action:forXPCConnection:");
}

id objc_msgSend_feedbackForMapItem_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackForMapItem:action:");
}

id objc_msgSend_feedbackForMapItem_action_forXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackForMapItem:action:forXPCConnection:");
}

id objc_msgSend_feeler_sendsSignalPack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feeler:sendsSignalPack:");
}

id objc_msgSend_fetchConnectionEntriesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConnectionEntriesWithHandler:");
}

id objc_msgSend_fetchLastVehicleEventsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLastVehicleEventsWithHandler:");
}

id objc_msgSend_fetchLocationEntriesForTray_currentLocation_queue_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationEntriesForTray:currentLocation:queue:handler:");
}

id objc_msgSend_fetchLocationsOfInterestOfType_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationsOfInterestOfType:withHandler:");
}

id objc_msgSend_fetchRoutineModeFromLocation_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRoutineModeFromLocation:withHandler:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fireDate(void *a1, const char *a2, ...)
{
  return _[a1 fireDate];
}

id objc_msgSend_firstEntryDuringPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstEntryDuringPeriod:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_forceEarlyUpdateForType_forXPCConnection_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceEarlyUpdateForType:forXPCConnection:handler:");
}

id objc_msgSend_from(void *a1, const char *a2, ...)
{
  return _[a1 from];
}

id objc_msgSend_futureTripsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureTripsWithHandler:");
}

id objc_msgSend_geoMapItem(void *a1, const char *a2, ...)
{
  return _[a1 geoMapItem];
}

id objc_msgSend_getETAForDestinationKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getETAForDestinationKey:");
}

id objc_msgSend_getVehicleInfoData(void *a1, const char *a2, ...)
{
  return _[a1 getVehicleInfoData];
}

id objc_msgSend_guessTransportModesForDestinationEntry_originCoordinate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guessTransportModesForDestinationEntry:originCoordinate:handler:");
}

id objc_msgSend_guessTransportModesForDestinationMapItem_originCoordinate_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guessTransportModesForDestinationMapItem:originCoordinate:handler:");
}

id objc_msgSend_handleIntent_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIntent:withCompletion:");
}

id objc_msgSend_hasBeenVisited(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenVisited];
}

id objc_msgSend_hasCarPlayInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasCarPlayInfo];
}

id objc_msgSend_hasDistanceFromHereToDestinationInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasDistanceFromHereToDestinationInfo];
}

id objc_msgSend_hasEntriesInTheFuture(void *a1, const char *a2, ...)
{
  return _[a1 hasEntriesInTheFuture];
}

id objc_msgSend_hasExpired(void *a1, const char *a2, ...)
{
  return _[a1 hasExpired];
}

id objc_msgSend_hasExpressPaymentCardWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExpressPaymentCardWithHandler:");
}

id objc_msgSend_hasLinkOptions(void *a1, const char *a2, ...)
{
  return _[a1 hasLinkOptions];
}

id objc_msgSend_hasMapTypeInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasMapTypeInfo];
}

id objc_msgSend_hasPaymentCardWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPaymentCardWithHandler:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRidesharingInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasRidesharingInfo];
}

id objc_msgSend_hasSourceData(void *a1, const char *a2, ...)
{
  return _[a1 hasSourceData];
}

id objc_msgSend_hasTransitInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasTransitInfo];
}

id objc_msgSend_hasTransitPassWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTransitPassWithHandler:");
}

id objc_msgSend_hasUserTransportTypePreferenceInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasUserTransportTypePreferenceInfo];
}

id objc_msgSend_hasWeatherInfo(void *a1, const char *a2, ...)
{
  return _[a1 hasWeatherInfo];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashForKey:");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAccuracy];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initFromDestination_toDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFromDestination:toDestination:");
}

id objc_msgSend_initFromResourceDepot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFromResourceDepot:");
}

id objc_msgSend_initSerialQueueWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSerialQueueWithName:");
}

id objc_msgSend_initSharedManager(void *a1, const char *a2, ...)
{
  return _[a1 initSharedManager];
}

id objc_msgSend_initWithAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccessory:");
}

id objc_msgSend_initWithActualTransportMode_actualTransportModeProbability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActualTransportMode:actualTransportModeProbability:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:configuration:error:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_locationUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:locationUpdater:");
}

id objc_msgSend_initWithDelegate_mapsSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:mapsSync:");
}

id objc_msgSend_initWithDelegate_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:name:");
}

id objc_msgSend_initWithDelegate_portrait_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:portrait:name:");
}

id objc_msgSend_initWithDelegate_wallet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:wallet:");
}

id objc_msgSend_initWithDelegate_wallet_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:wallet:name:");
}

id objc_msgSend_initWithDestinationGraph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestinationGraph:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithETA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithETA:");
}

id objc_msgSend_initWithEffectiveBundlePath_limitingBundleIdentifier_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundlePath:limitingBundleIdentifier:delegate:onQueue:");
}

id objc_msgSend_initWithEngineType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEngineType:");
}

id objc_msgSend_initWithEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntry:");
}

id objc_msgSend_initWithFeatureProviderArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureProviderArray:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocation:");
}

id objc_msgSend_initWithLocation_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocation:label:");
}

id objc_msgSend_initWithLocation_transportMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocation:transportMode:");
}

id objc_msgSend_initWithMLModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMLModel:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMaximumCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaximumCapacity:");
}

id objc_msgSend_initWithMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMemory:");
}

id objc_msgSend_initWithMemory_locationUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMemory:locationUpdater:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithNetworkRequester_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNetworkRequester:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPortrait_delegate_guardian_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPortrait:delegate:guardian:name:");
}

id objc_msgSend_initWithPortrait_delegate_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPortrait:delegate:name:");
}

id objc_msgSend_initWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRoute:");
}

id objc_msgSend_initWithRoute_auditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRoute:auditToken:");
}

id objc_msgSend_initWithSignalPack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSignalPack:");
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:duration:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithTemperature_ChanceOfPrecipitation_TimeOfDay_DayOfWeek_TouristBit_DistanceFromOriginToDestination_DistanceFromHereToOrigin_distanceFromOriginToDestination_DistanceFromHereToHome_DistanceFromHereToWork_DistanceFromHereToParkedCar_UserPreferenceForTransportType_1_UserPreferenceForTransportType_3_UserPreferenceForTransportType_2_MapType_3_MapType_0_MapType_2_MapType_1_MapType_4_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTemperature:ChanceOfPrecipitation:TimeOfDay:DayOfWeek:TouristBit:DistanceFromOriginToDestination:DistanceFromHereToOrigin:distanceFromOriginToDestination:DistanceFromHereToHome:DistanceFromHereToWork:DistanceFromHereToParkedCar:UserPreferenceForTransportType_1:UserPreferenceForTransportType_3:UserPreferenceForTransportType_2:MapType_3:MapType_0:MapType_2:MapType_1:MapType_4:");
}

id objc_msgSend_initWithTimeInterval_queue_repeating_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeInterval:queue:repeating:block:");
}

id objc_msgSend_initWithUUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUID:error:");
}

id objc_msgSend_initWithWallet_delegate_guardian_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWallet:delegate:guardian:name:");
}

id objc_msgSend_initWithXPCConnection_memory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:memory:");
}

id objc_msgSend_initWithXPCConnection_sourceWrapper_graph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:sourceWrapper:graph:");
}

id objc_msgSend_instanceMethodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceMethodSignatureForSelector:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectsDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsDateInterval:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isBadWeather(void *a1, const char *a2, ...)
{
  return _[a1 isBadWeather];
}

id objc_msgSend_isBundleIDLocked_forSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundleIDLocked:forSource:");
}

id objc_msgSend_isCarPlayConnected(void *a1, const char *a2, ...)
{
  return _[a1 isCarPlayConnected];
}

id objc_msgSend_isEasilyWalkable(void *a1, const char *a2, ...)
{
  return _[a1 isEasilyWalkable];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToBreadcrumb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToBreadcrumb:");
}

id objc_msgSend_isEqualToDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDestination:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToEngineState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToEngineState:");
}

id objc_msgSend_isEqualToMapItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToMapItem:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToState:");
}

id objc_msgSend_isEqualToState_changedKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToState:changedKeys:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMapTypeTransit(void *a1, const char *a2, ...)
{
  return _[a1 isMapTypeTransit];
}

id objc_msgSend_isRepeating(void *a1, const char *a2, ...)
{
  return _[a1 isRepeating];
}

id objc_msgSend_isRideSharingAppsInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isRideSharingAppsInstalled];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isTransitCurrentlyPossible(void *a1, const char *a2, ...)
{
  return _[a1 isTransitCurrentlyPossible];
}

id objc_msgSend_isUserPreferenceDriving(void *a1, const char *a2, ...)
{
  return _[a1 isUserPreferenceDriving];
}

id objc_msgSend_isUserPreferenceRidesharing(void *a1, const char *a2, ...)
{
  return _[a1 isUserPreferenceRidesharing];
}

id objc_msgSend_isUserPreferenceTransit(void *a1, const char *a2, ...)
{
  return _[a1 isUserPreferenceTransit];
}

id objc_msgSend_isUserPreferenceWalking(void *a1, const char *a2, ...)
{
  return _[a1 isUserPreferenceWalking];
}

id objc_msgSend_isWalkable(void *a1, const char *a2, ...)
{
  return _[a1 isWalkable];
}

id objc_msgSend_jsonWithFormatting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonWithFormatting:");
}

id objc_msgSend_keysForSchemas_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysForSchemas:completion:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPostedState(void *a1, const char *a2, ...)
{
  return _[a1 lastPostedState];
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_latestKnownTime(void *a1, const char *a2, ...)
{
  return _[a1 latestKnownTime];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_likelyTransportMode(void *a1, const char *a2, ...)
{
  return _[a1 likelyTransportMode];
}

id objc_msgSend_loadContentsOfURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStandardRangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardRangeOfString:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationUpdater(void *a1, const char *a2, ...)
{
  return _[a1 locationUpdater];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_lowRangeWarning(void *a1, const char *a2, ...)
{
  return _[a1 lowRangeWarning];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _[a1 macAddress];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return _[a1 manufacturer];
}

id objc_msgSend_mapsAppFeeler(void *a1, const char *a2, ...)
{
  return _[a1 mapsAppFeeler];
}

id objc_msgSend_memory(void *a1, const char *a2, ...)
{
  return _[a1 memory];
}

id objc_msgSend_mergeIntoSignalPack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeIntoSignalPack:");
}

id objc_msgSend_mergedCommonSignalPack(void *a1, const char *a2, ...)
{
  return _[a1 mergedCommonSignalPack];
}

id objc_msgSend_mergedSignalPackForDestinationEntry_originCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergedSignalPackForDestinationEntry:originCoordinate:");
}

id objc_msgSend_mergedSignalPackForDestinationMapItem_originCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergedSignalPackForDestinationMapItem:originCoordinate:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _[a1 modelNumber];
}

id objc_msgSend_modelWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:configuration:error:");
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _[a1 month];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_needsFuel(void *a1, const char *a2, ...)
{
  return _[a1 needsFuel];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
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

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oneAppGuardian(void *a1, const char *a2, ...)
{
  return _[a1 oneAppGuardian];
}

id objc_msgSend_oneMapsSync(void *a1, const char *a2, ...)
{
  return _[a1 oneMapsSync];
}

id objc_msgSend_oneNetworkRequester(void *a1, const char *a2, ...)
{
  return _[a1 oneNetworkRequester];
}

id objc_msgSend_onePortrait(void *a1, const char *a2, ...)
{
  return _[a1 onePortrait];
}

id objc_msgSend_oneSourceDelegate(void *a1, const char *a2, ...)
{
  return _[a1 oneSourceDelegate];
}

id objc_msgSend_optedIn(void *a1, const char *a2, ...)
{
  return _[a1 optedIn];
}

id objc_msgSend_originatingSourceName(void *a1, const char *a2, ...)
{
  return _[a1 originatingSourceName];
}

id objc_msgSend_partySize(void *a1, const char *a2, ...)
{
  return _[a1 partySize];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_pointOfInterestHandoffEnabled(void *a1, const char *a2, ...)
{
  return _[a1 pointOfInterestHandoffEnabled];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predictionFromFeatures_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:completionHandler:");
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_predictionFromFeatures_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:options:completionHandler:");
}

id objc_msgSend_predictionFromFeatures_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:options:error:");
}

id objc_msgSend_predictionsFromBatch_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionsFromBatch:options:error:");
}

id objc_msgSend_prepareForUse(void *a1, const char *a2, ...)
{
  return _[a1 prepareForUse];
}

id objc_msgSend_primaryEngineType(void *a1, const char *a2, ...)
{
  return _[a1 primaryEngineType];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _[a1 range];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _[a1 rangeValue];
}

id objc_msgSend_rebalance(void *a1, const char *a2, ...)
{
  return _[a1 rebalance];
}

id objc_msgSend_rebuildForPeriod_location_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rebuildForPeriod:location:handler:");
}

id objc_msgSend_registerBundleID_withSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBundleID:withSource:");
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForLocalNotifications];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAll(void *a1, const char *a2, ...)
{
  return _[a1 removeAll];
}

id objc_msgSend_removeEntry_behavior_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEntry:behavior:handler:");
}

id objc_msgSend_removeEntryData_behavior_forXPCConnection_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEntryData:behavior:forXPCConnection:handler:");
}

id objc_msgSend_removeExpiredEntries(void *a1, const char *a2, ...)
{
  return _[a1 removeExpiredEntries];
}

id objc_msgSend_removeMapsSyncObserver_forContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMapsSyncObserver:forContentType:");
}

id objc_msgSend_removeMonitoredXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMonitoredXPCConnection:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceEntries_sourceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceEntries:sourceName:");
}

id objc_msgSend_resourceDepot(void *a1, const char *a2, ...)
{
  return _[a1 resourceDepot];
}

id objc_msgSend_restaurant(void *a1, const char *a2, ...)
{
  return _[a1 restaurant];
}

id objc_msgSend_restaurantIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 restaurantIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return _[a1 seconds];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return _[a1 selector];
}

id objc_msgSend_sendDestinationInformation_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDestinationInformation:identifier:");
}

id objc_msgSend_sendFeedbackforClientID_storeType_explicitlyEngagedStrings_explicitlyRejectedStrings_implicitlyEngagedStrings_implicitlyRejectedStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFeedbackforClientID:storeType:explicitlyEngagedStrings:explicitlyRejectedStrings:implicitlyEngagedStrings:implicitlyRejectedStrings:");
}

id objc_msgSend_sendSignalPack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSignalPack:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serviceForEvents(void *a1, const char *a2, ...)
{
  return _[a1 serviceForEvents];
}

id objc_msgSend_setAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessory:");
}

id objc_msgSend_setAlgorithm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlgorithm:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCurrentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentState:");
}

id objc_msgSend_setDate_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:forKey:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceFilter:");
}

id objc_msgSend_setETA_destinationKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setETA:destinationKey:");
}

id objc_msgSend_setETA_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setETA:forKey:");
}

id objc_msgSend_setEarliestBookingDateForResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestBookingDateForResults:");
}

id objc_msgSend_setEngineStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngineStates:");
}

id objc_msgSend_setEngineType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngineType:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFireDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFireDate:");
}

id objc_msgSend_setGeoMapItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeoMapItem:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastPostedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPostedState:");
}

id objc_msgSend_setLowRangeWarning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowRangeWarning:");
}

id objc_msgSend_setMapsDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapsDisplayName:");
}

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObserveExternalAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserveExternalAccessory:");
}

id objc_msgSend_setOneSourceDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOneSourceDelegate:");
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRange:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSet_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSet:forKey:");
}

id objc_msgSend_setString_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:forKey:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setUpdaterDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdaterDelegate:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYear:");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_shortAddress(void *a1, const char *a2, ...)
{
  return _[a1 shortAddress];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shouldShowAirQualityConditions(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowAirQualityConditions];
}

id objc_msgSend_shouldShowWeatherConditions(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowWeatherConditions];
}

id objc_msgSend_signalPackFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalPackFromData:");
}

id objc_msgSend_signalPackUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalPackUpdated:");
}

id objc_msgSend_signalPipeline(void *a1, const char *a2, ...)
{
  return _[a1 signalPipeline];
}

id objc_msgSend_signalPipelineUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalPipelineUpdated:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceNames(void *a1, const char *a2, ...)
{
  return _[a1 sourceNames];
}

id objc_msgSend_sourceWrapper(void *a1, const char *a2, ...)
{
  return _[a1 sourceWrapper];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startLocationUpdatesForDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLocationUpdatesForDelegate:");
}

id objc_msgSend_startMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoringSignificantLocationChanges];
}

id objc_msgSend_startMonitoringVisits(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoringVisits];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingLocation];
}

id objc_msgSend_startUpdatingSignals(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingSignals];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopLocationUpdatesForDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopLocationUpdatesForDelegate:");
}

id objc_msgSend_stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringSignificantLocationChanges];
}

id objc_msgSend_stopMonitoringVisits(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringVisits];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingLocation];
}

id objc_msgSend_stopUpdatingSignals(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingSignals];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submitWithHandler_networkActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithHandler:networkActivity:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_suggestionsEntriesAtLocation_period_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionsEntriesAtLocation:period:handler:");
}

id objc_msgSend_supportsCarPlay(void *a1, const char *a2, ...)
{
  return _[a1 supportsCarPlay];
}

id objc_msgSend_ticketForExternalBusinessID_contentProvider_traits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ticketForExternalBusinessID:contentProvider:traits:");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return _[a1 timezone];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return _[a1 to];
}

id objc_msgSend_transportModesForSignalPack_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transportModesForSignalPack:handler:");
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return _[a1 transportType];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_undecoratedSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 undecoratedSubtitle];
}

id objc_msgSend_undecoratedTitle(void *a1, const char *a2, ...)
{
  return _[a1 undecoratedTitle];
}

id objc_msgSend_undefinedFeatureValueWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undefinedFeatureValueWithType:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_uniqueName(void *a1, const char *a2, ...)
{
  return _[a1 uniqueName];
}

id objc_msgSend_unregisterAllBundleIDsForSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterAllBundleIDsForSource:");
}

id objc_msgSend_unregisterBundleID_withSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterBundleID:withSource:");
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateETA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateETA:");
}

id objc_msgSend_updateSignals(void *a1, const char *a2, ...)
{
  return _[a1 updateSignals];
}

id objc_msgSend_updateSuggestionEntriesOfType_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSuggestionEntriesOfType:handler:");
}

id objc_msgSend_updateSuggestionEntriesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSuggestionEntriesWithHandler:");
}

id objc_msgSend_updateWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithInfo:");
}

id objc_msgSend_updateWithVehicleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithVehicleInfo:");
}

id objc_msgSend_updaterDelegate(void *a1, const char *a2, ...)
{
  return _[a1 updaterDelegate];
}

id objc_msgSend_userCurrentBookings(void *a1, const char *a2, ...)
{
  return _[a1 userCurrentBookings];
}

id objc_msgSend_userHasFavoriteTransitLinesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userHasFavoriteTransitLinesWithHandler:");
}

id objc_msgSend_userHasFavoriteTransitPOIsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userHasFavoriteTransitPOIsWithHandler:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithRange:");
}

id objc_msgSend_vehicleInfoInitialData(void *a1, const char *a2, ...)
{
  return _[a1 vehicleInfoInitialData];
}

id objc_msgSend_vendorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vendorIdentifier];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weatherLocationDataProvider_didChangeLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weatherLocationDataProvider:didChangeLocation:");
}

id objc_msgSend_weekOfYear(void *a1, const char *a2, ...)
{
  return _[a1 weekOfYear];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return _[a1 weekday];
}

id objc_msgSend_writeSignalValue_forType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeSignalValue:forType:");
}

id objc_msgSend_writeSignalValue_forType_gathered_expires_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeSignalValue:forType:gathered:expires:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _[a1 year];
}