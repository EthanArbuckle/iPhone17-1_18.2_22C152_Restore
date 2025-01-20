BOOL TTRComplicationModuleAcceptsFamilyForDevice(uint64_t a1)
{
  return +[TTRComplicationPresenter templateGeneratorClassForComplicationFamily:a1] != 0;
}

NSBundle *TTRComplicationBundleGet()
{
  uint64_t v0 = objc_opt_class();

  return +[NSBundle bundleForClass:v0];
}

id TTRBundleGet()
{
  if (qword_17800 != -1) {
    dispatch_once(&qword_17800, &stru_10540);
  }
  uint64_t v0 = (void *)qword_177F8;

  return v0;
}

void sub_7304(id a1)
{
  qword_177F8 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id TTRComplicationCalendarCreate()
{
  return +[NSCalendar currentCalendar];
}

id TTRIComplicationSwitcherTimelineModelSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id TTRIComplicationSwitcherTimelineModelSource.init()()
{
  swift_unknownObjectWeakInit();
  id v1 = objc_allocWithZone((Class)type metadata accessor for TTRComplicationSwitcherTimelineModel());
  v2 = v0;
  id v3 = [v1 init];
  *(void *)&v2[OBJC_IVAR____TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource_model] = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for TTRIComplicationSwitcherTimelineModelSource();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t type metadata accessor for TTRComplicationSwitcherTimelineModel()
{
  return self;
}

uint64_t type metadata accessor for TTRIComplicationSwitcherTimelineModelSource()
{
  return self;
}

uint64_t variable initialization expression of TTRIComplicationSwitcherTimelineModelSource.delegate()
{
  return 0;
}

uint64_t TTRIComplicationSwitcherTimelineModelSource.model.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t TTRIComplicationSwitcherTimelineModelSource.model.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource_model);
  swift_beginAccess();
  *id v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*TTRIComplicationSwitcherTimelineModelSource.model.modify())()
{
  return j__swift_endAccess;
}

uint64_t TTRIComplicationSwitcherTimelineModelSource.delegate.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t TTRIComplicationSwitcherTimelineModelSource.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*TTRIComplicationSwitcherTimelineModelSource.delegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource_delegate;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_unknownObjectWeakLoadStrong();
  return sub_9B04;
}

void sub_9B04(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

id TTRIComplicationSwitcherTimelineModelSource.__deallocating_deinit(uint64_t a1)
{
  return sub_9D74(a1, type metadata accessor for TTRIComplicationSwitcherTimelineModelSource);
}

id sub_9D58()
{
  return sub_9D74(0, type metadata accessor for TTRComplicationSwitcherTimelineModel);
}

id sub_9D74(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

unint64_t sub_9DAC()
{
  unint64_t result = qword_17660;
  if (!qword_17660)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_17660);
  }
  return result;
}

uint64_t sub_9DEC()
{
  uint64_t v0 = sub_B350();
  uint64_t v71 = *(void *)(v0 - 8);
  uint64_t v72 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v70 = (char *)v62 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_B240();
  uint64_t v75 = *(void *)(v2 - 8);
  uint64_t v76 = v2;
  ((void (*)(void))__chkstk_darwin)();
  v66 = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_B2D0();
  uint64_t v67 = *(void *)(v69 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v68 = (char *)v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_B2E0();
  uint64_t v5 = *(void *)(v79 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_B2C0();
  uint64_t v9 = *(void *)(v8 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v11 = (char *)v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A758(&qword_17668);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v81 = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)v62 - v14;
  uint64_t v82 = sub_B2B0();
  uint64_t v16 = *(void *)(v82 - 8);
  uint64_t v17 = __chkstk_darwin(v82);
  v19 = (char *)v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v78 = (char *)v62 - v20;
  uint64_t v21 = sub_B320();
  uint64_t v73 = *(void *)(v21 - 8);
  uint64_t v74 = v21;
  __chkstk_darwin(v21);
  v23 = (char *)v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v24 = TTRComplicationCalendarCreate();
  v80 = v23;
  sub_B300();

  id v25 = [self unmodifiedDate];
  if (!v25)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v81, 1, 1, v82);
    goto LABEL_10;
  }
  v26 = v25;
  sub_B290();

  v27 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  v29 = v81;
  uint64_t v28 = v82;
  v77 = v19;
  v62[1] = v16 + 32;
  v62[0] = v27;
  v27(v81, v19, v82);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v29, 0, 1, v28);
  uint64_t v83 = v16;
  v64 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t v65 = v16 + 48;
  uint64_t result = v64(v29, 1, v28);
  if (result == 1)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v31 = *(void (**)(char *, void, uint64_t))(v9 + 104);
  uint64_t v63 = v8;
  v31(v11, enum case for Calendar.MatchingPolicy.nextTime(_:), v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Calendar.RepeatedTimePolicy.first(_:), v79);
  uint64_t v33 = v67;
  v32 = v68;
  uint64_t v34 = v69;
  (*(void (**)(char *, void, uint64_t))(v67 + 104))(v68, enum case for Calendar.SearchDirection.forward(_:), v69);
  v35 = v81;
  sub_B310();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v34);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v79);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v63);
  uint64_t v36 = v82;
  v37 = *(void (**)(char *, uint64_t))(v83 + 8);
  v83 += 8;
  v37(v35, v82);
  if (v64(v15, 1, v36) == 1)
  {
    sub_B2A0();
    sub_A79C((uint64_t)v15);
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v62[0])(v78, v15, v36);
  }
  v38 = v66;
  v39 = self;
  Class isa = sub_B280().super.isa;
  v41 = v70;
  sub_B340();
  Class v42 = sub_B330().super.isa;
  (*(void (**)(char *, uint64_t))(v71 + 8))(v41, v72);
  id v43 = objc_msgSend(v39, "rem_dateComponentsWithDate:timeZone:isAllDay:", isa, v42, 0);

  sub_B230();
  id v44 = objc_allocWithZone((Class)TTRComplicationReminderDueDate);
  Class v45 = sub_B220().super.isa;
  v46 = v80;
  Class v47 = sub_B2F0().super.isa;
  id v48 = [v44 initWithDateComponents:v45 inCalendar:v47];

  if (!v48)
  {
    v49 = v77;
    sub_B2A0();
    id v50 = objc_allocWithZone((Class)TTRComplicationReminderDueDate);
    Class v51 = sub_B280().super.isa;
    id v48 = [v50 initWithDate:v51 precision:0];

    v37(v49, v36);
  }
  v85._object = (void *)0x800000000000F910;
  v84._countAndFlagsBits = 0x6D6163206B6F6F42;
  v84._object = (void *)0xEE00657469732070;
  v85._countAndFlagsBits = 0xD000000000000049;
  sub_B360(v84, v85);
  v52 = v77;
  sub_B2A0();
  id v53 = objc_allocWithZone((Class)TTRComplicationReminder);
  id v54 = v48;
  Class v55 = sub_B280().super.isa;
  NSString v56 = sub_B3C0();
  swift_bridgeObjectRelease();
  id v57 = [v53 initWithCreationDate:v55 dueDate:v54 title:v56];

  v37(v52, v36);
  sub_B270();
  id v58 = objc_allocWithZone((Class)TTRComplicationTimelineModelEntry);
  id v59 = v57;
  Class v60 = sub_B280().super.isa;
  id v61 = [v58 initWithStartDate:v60 overdueCount:0 remainingDueTodayCount:1 representativeReminder:v59];

  v37(v52, v36);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v38, v76);
  v37(v78, v36);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v46, v74);
  return (uint64_t)v61;
}

uint64_t sub_A758(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A79C(uint64_t a1)
{
  uint64_t v2 = sub_A758(&qword_17668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_A7FC(uint64_t a1)
{
  return a1;
}

id TTRComplicationRouter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRComplicationRouter();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for TTRComplicationRouter()
{
  return self;
}

id TTRComplicationRouter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRComplicationRouter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t TTRComplicationRouter.launchURLForTimeline(withEntryCount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_A758(&qword_176D0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v40 = (char *)&v40 - v7;
  uint64_t v8 = sub_B3B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  v15 = (char *)&v40 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v40 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v40 - v19;
  uint64_t v21 = (void (**)(char *, void, uint64_t))(v9 + 104);
  uint64_t v22 = (void (**)(char *, char *, uint64_t))(v9 + 16);
  if (a1)
  {
    uint64_t v23 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
    uint64_t v24 = sub_B370();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v15, v23, v24);
    (*v21)(v15, enum case for REMNavigationSpecifier.today(_:), v8);
    sub_B390();
    (*v22)(v12, v15, v8);
    uint64_t v25 = sub_B260();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v6, 1, v25) == 1)
    {
      sub_B3A0();
      v27 = *(void (**)(char *, uint64_t))(v9 + 8);
      v27(v12, v8);
      v27(v15, v8);
      uint64_t v28 = (uint64_t)v6;
      return sub_AD84(v28);
    }
    v38 = *(void (**)(char *, uint64_t))(v9 + 8);
    v38(v12, v8);
    v38(v15, v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v41, v6, v25);
  }
  else
  {
    uint64_t v29 = enum case for REMNavigationSpecifier.RootPathSpecifier.none(_:);
    uint64_t v30 = sub_B380();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v20, v29, v30);
    (*v21)(v20, enum case for REMNavigationSpecifier.root(_:), v8);
    v31 = v40;
    sub_B390();
    (*v22)(v18, v20, v8);
    uint64_t v32 = sub_B260();
    uint64_t v33 = *(void *)(v32 - 8);
    int v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32);
    uint64_t v35 = v41;
    if (v34 == 1)
    {
      sub_B3A0();
      uint64_t v36 = *(void (**)(char *, uint64_t))(v9 + 8);
      v36(v18, v8);
      v36(v20, v8);
      uint64_t v28 = (uint64_t)v31;
      return sub_AD84(v28);
    }
    v39 = *(void (**)(char *, uint64_t))(v9 + 8);
    v39(v18, v8);
    v39(v20, v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v31, v32);
  }
}

uint64_t sub_AD84(uint64_t a1)
{
  uint64_t v2 = sub_A758(&qword_176D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_AEE4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_AF18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Utilitarian Small complication image; returning template without image.",
    v1,
    2u);
}

void sub_AF5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Circular Small complication image; returning template without image.",
    v1,
    2u);
}

void sub_AFA0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithInteger:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "No template generator available for complication family; using empty template generator. {family: %@}",
    (uint8_t *)&v4,
    0xCu);
}

void sub_B044(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to determine date for components; returning nil {dateComponents: %@, timeZone: %@}",
    (uint8_t *)&v3,
    0x16u);
}

void sub_B0CC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Graphic Extra Large complication image; returning template without image.",
    v1,
    2u);
}

void sub_B110(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Modular Small complication image; returning template without image.",
    v1,
    2u);
}

void sub_B154(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Graphic Corner complication image; returning template without image.",
    v1,
    2u);
}

void sub_B198(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Extra Large complication image; returning template without image.",
    v1,
    2u);
}

void sub_B1DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unable to load Graphic Circular complication image; returning template without image.",
    v1,
    2u);
}

NSDateComponents sub_B220()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_B230()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B240()
{
  return type metadata accessor for DateComponents();
}

void sub_B250(NSURL *retstr@<X8>)
{
}

uint64_t sub_B260()
{
  return type metadata accessor for URL();
}

uint64_t sub_B270()
{
  return static Date.distantPast.getter();
}

NSDate sub_B280()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_B290()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B2A0()
{
  return Date.init()();
}

uint64_t sub_B2B0()
{
  return type metadata accessor for Date();
}

uint64_t sub_B2C0()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_B2D0()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_B2E0()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

NSCalendar sub_B2F0()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_B300()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_B310()
{
  return Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_B320()
{
  return type metadata accessor for Calendar();
}

NSTimeZone sub_B330()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_B340()
{
  return static TimeZone.current.getter();
}

uint64_t sub_B350()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_B360(Swift::String _, Swift::String comment)
{
  return TTRLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_B370()
{
  return type metadata accessor for REMNavigationSpecifier.SmartListPathSpecifier();
}

uint64_t sub_B380()
{
  return type metadata accessor for REMNavigationSpecifier.RootPathSpecifier();
}

uint64_t sub_B390()
{
  return REMNavigationSpecifier.watchKitApplicationLaunchURL.getter();
}

uint64_t sub_B3A0()
{
  return REMNavigationSpecifier.url.getter();
}

uint64_t sub_B3B0()
{
  return type metadata accessor for REMNavigationSpecifier();
}

NSString sub_B3C0()
{
  return String._bridgeToObjectiveC()();
}

NSArray sub_B3D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t RemindersUICoreBundleGet()
{
  return _RemindersUICoreBundleGet();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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

id objc_msgSend__headerTextProviderForReminder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_headerTextProviderForReminder:");
}

id objc_msgSend__imageNameForFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageNameForFamily:");
}

id objc_msgSend__makeModelSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeModelSource:");
}

id objc_msgSend__templateForOverdueCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateForOverdueCount:");
}

id objc_msgSend__templateForRemainingDueTodayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateForRemainingDueTodayCount:");
}

id objc_msgSend__templateForReminder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateForReminder:");
}

id objc_msgSend__templateWithBody1TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateWithBody1TextProvider:");
}

id objc_msgSend__templateWithHeaderTextProvider_body1TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateWithHeaderTextProvider:body1TextProvider:");
}

id objc_msgSend__templateWithInnerTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateWithInnerTextProvider:");
}

id objc_msgSend__templateWithTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_templateWithTextProvider:");
}

id objc_msgSend__textProviderForOverdueCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textProviderForOverdueCount:");
}

id objc_msgSend__textProviderForRemainingDueTodayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textProviderForRemainingDueTodayCount:");
}

id objc_msgSend__textProviderForReminder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textProviderForReminder:");
}

id objc_msgSend__textProviderForTimelineModelEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textProviderForTimelineModelEntry:");
}

id objc_msgSend__timelineEntriesForModelEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timelineEntriesForModelEntries:");
}

id objc_msgSend__timelineEntryForModelEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timelineEntryForModelEntry:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_assembleModuleForComplicationFamily_isRunningInClockFace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assembleModuleForComplicationFamily:isRunningInClockFace:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_complicationPresenterDidUpdateViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "complicationPresenterDidUpdateViewModel:");
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return _[a1 complicationTemplate];
}

id objc_msgSend_complicationTimelineModelSourceModelDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "complicationTimelineModelSourceModelDidChange:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
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

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_currentEntry(void *a1, const char *a2, ...)
{
  return _[a1 currentEntry];
}

id objc_msgSend_currentTimelineEntry(void *a1, const char *a2, ...)
{
  return _[a1 currentTimelineEntry];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dueDate(void *a1, const char *a2, ...)
{
  return _[a1 dueDate];
}

id objc_msgSend_entriesAfterDate_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesAfterDate:limit:");
}

id objc_msgSend_entriesInSameDayAsDate_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesInSameDayAsDate:limit:");
}

id objc_msgSend_entryWithDate_complicationTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryWithDate:complicationTemplate:");
}

id objc_msgSend_graphicCircularTemplateGenerator(void *a1, const char *a2, ...)
{
  return _[a1 graphicCircularTemplateGenerator];
}

id objc_msgSend_headerTextProvider(void *a1, const char *a2, ...)
{
  return _[a1 headerTextProvider];
}

id objc_msgSend_imageForFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForFamily:");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageProviderWithOnePieceImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageProviderWithOnePieceImage:");
}

id objc_msgSend_initWithCircularTemplate_textProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCircularTemplate:textProvider:");
}

id objc_msgSend_initWithDate_precision_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDate:precision:");
}

id objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intent:");
}

id objc_msgSend_initWithHeaderImageProvider_headerTextProvider_body1TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeaderImageProvider:headerTextProvider:body1TextProvider:");
}

id objc_msgSend_initWithImageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImageProvider:");
}

id objc_msgSend_initWithInnerTextProvider_outerTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInnerTextProvider:outerTextProvider:");
}

id objc_msgSend_initWithModelSource_router_complicationFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModelSource:router:complicationFamily:");
}

id objc_msgSend_initWithTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTextProvider:");
}

id objc_msgSend_initWithTextProvider_imageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTextProvider:imageProvider:");
}

id objc_msgSend_initWithTimelineModel_templateGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimelineModel:templateGenerator:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_innerTextProvider(void *a1, const char *a2, ...)
{
  return _[a1 innerTextProvider];
}

id objc_msgSend_invalidateEntries(void *a1, const char *a2, ...)
{
  return _[a1 invalidateEntries];
}

id objc_msgSend_isDate_inSameDayAsDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDate:inSameDayAsDate:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToDueDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDueDate:");
}

id objc_msgSend_isInSameDayAsDueDate_inCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInSameDayAsDueDate:inCalendar:");
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return _[a1 isRunningGraceOrLater];
}

id objc_msgSend_launchURLForTimelineEntries(void *a1, const char *a2, ...)
{
  return _[a1 launchURLForTimelineEntries];
}

id objc_msgSend_launchURLForTimelineWithEntryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchURLForTimelineWithEntryCount:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lockedTemplate(void *a1, const char *a2, ...)
{
  return _[a1 lockedTemplate];
}

id objc_msgSend_makeDueTimeTextProviderUsingCalendar_dropMinutesForRoundHours_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeDueTimeTextProviderUsingCalendar:dropMinutesForRoundHours:");
}

id objc_msgSend_makeTitleAndExactDueDateTextProviderUsingCalendar_dropMinutesForRoundHours_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeTitleAndExactDueDateTextProviderUsingCalendar:dropMinutesForRoundHours:");
}

id objc_msgSend_makeTitleTextProvider(void *a1, const char *a2, ...)
{
  return _[a1 makeTitleTextProvider];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelSource(void *a1, const char *a2, ...)
{
  return _[a1 modelSource];
}

id objc_msgSend_module(void *a1, const char *a2, ...)
{
  return _[a1 module];
}

id objc_msgSend_nanosecond(void *a1, const char *a2, ...)
{
  return _[a1 nanosecond];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_overdueCount(void *a1, const char *a2, ...)
{
  return _[a1 overdueCount];
}

id objc_msgSend_pauseUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pauseUpdates];
}

id objc_msgSend_pauseViewModelUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pauseViewModelUpdates];
}

id objc_msgSend_precision(void *a1, const char *a2, ...)
{
  return _[a1 precision];
}

id objc_msgSend_presenter(void *a1, const char *a2, ...)
{
  return _[a1 presenter];
}

id objc_msgSend_privacyTemplate(void *a1, const char *a2, ...)
{
  return _[a1 privacyTemplate];
}

id objc_msgSend_providerWithFullColorImage_monochromeFilterType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithFullColorImage:monochromeFilterType:");
}

id objc_msgSend_rem_dateWithDateComponents_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rem_dateWithDateComponents:timeZone:");
}

id objc_msgSend_rem_isAllDayDateComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rem_isAllDayDateComponents");
}

id objc_msgSend_remainingDueTodayCount(void *a1, const char *a2, ...)
{
  return _[a1 remainingDueTodayCount];
}

id objc_msgSend_representativeReminder(void *a1, const char *a2, ...)
{
  return _[a1 representativeReminder];
}

id objc_msgSend_resumeUpdates(void *a1, const char *a2, ...)
{
  return _[a1 resumeUpdates];
}

id objc_msgSend_resumeViewModelUpdates(void *a1, const char *a2, ...)
{
  return _[a1 resumeViewModelUpdates];
}

id objc_msgSend_router(void *a1, const char *a2, ...)
{
  return _[a1 router];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisallowBothMinutesAndDesignator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisallowBothMinutesAndDesignator:");
}

id objc_msgSend_setForegroundAccentImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundAccentImage:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setPrefersDesignatorToMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersDesignatorToMinutes:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewModel:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_templateForNoScheduledReminders(void *a1, const char *a2, ...)
{
  return _[a1 templateForNoScheduledReminders];
}

id objc_msgSend_templateForTimelineModelEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateForTimelineModelEntry:");
}

id objc_msgSend_templateGenerator(void *a1, const char *a2, ...)
{
  return _[a1 templateGenerator];
}

id objc_msgSend_templateGeneratorClassForComplicationFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateGeneratorClassForComplicationFamily:");
}

id objc_msgSend_templateGeneratorForComplicationFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateGeneratorForComplicationFamily:");
}

id objc_msgSend_textProviderWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithDate:");
}

id objc_msgSend_textProviderWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithFormat:");
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithText:");
}

id objc_msgSend_textProviderWithText_shortText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithText:shortText:");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _[a1 timeZone];
}

id objc_msgSend_timelineModel(void *a1, const char *a2, ...)
{
  return _[a1 timelineModel];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_ttr_isDateAtARoundHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ttr_isDateAtARoundHour:");
}

id objc_msgSend_ttr_placeholderForInvalidImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ttr_placeholderForInvalidImage");
}

id objc_msgSend_ttr_remindersAppNameTextProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ttr_remindersAppNameTextProvider");
}

id objc_msgSend_ttr_remindersTodayTextProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ttr_remindersTodayTextProvider");
}

id objc_msgSend_ui(void *a1, const char *a2, ...)
{
  return _[a1 ui];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _[a1 viewModel];
}