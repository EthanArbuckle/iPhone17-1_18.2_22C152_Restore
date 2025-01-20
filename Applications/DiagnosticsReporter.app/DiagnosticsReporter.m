uint64_t sub_100004578()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t sub_100004584()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  if (result)
  {
    return __os_feature_enabled_impl("OSAnalytics", "forceSeedFeedbackPrompting");
  }
  return result;
}

void *variable initialization expression of DiagnosticsReporterLaunchOptions.files_to_attach()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of DiagnosticsReporterLaunchOptions.log_path()
{
  return 0;
}

void sub_1000045E8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000045F0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000045FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v37 = a3;
  uint64_t v35 = a2;
  uint64_t v36 = type metadata accessor for FBKFeedbackForm.Question();
  uint64_t v6 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Locale();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v10 - 8);
  swift_unknownObjectUnownedInit();
  sub_100004E5C((uint64_t)a1, v3 + 24);
  uint64_t v12 = a1[3];
  uint64_t v11 = a1[4];
  sub_100004EC0(a1, v12);
  (*(void (**)(uint64_t, uint64_t))(v11 + 24))(v12, v11);
  Swift::String v13 = String.lowercased()();
  swift_bridgeObjectRelease();
  v38[0] = 0;
  v38[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease();
  strcpy((char *)v38, "ios-framework-");
  HIBYTE(v38[1]) = -18;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  id v14 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackForm());
  v15 = (void *)FBKFeedbackForm.init(identifier:)();
  uint64_t v17 = a1[3];
  uint64_t v16 = a1[4];
  sub_100004EC0(a1, v17);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v17, v16) == 0x63696E6150
    && v18 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
LABEL_9:
      uint64_t v21 = a1[3];
      uint64_t v22 = a1[4];
      sub_100004EC0(a1, v21);
      (*(void (**)(uint64_t, uint64_t))(v22 + 32))(v21, v22);
      dispatch thunk of FBKFeedbackForm.attachments.setter();
      uint64_t v23 = v36;
      (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for FBKFeedbackForm.Question.title(_:), v36);
      dispatch thunk of FBKFeedbackForm.prefill(question:answer:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v23);
      id v24 = objc_allocWithZone((Class)type metadata accessor for FBKFeedbackDraftViewController());
      id v25 = v15;
      v26 = (void *)FBKFeedbackDraftViewController.init(feedbackForm:)();
      *(void *)(v3 + 16) = v26;
      id v27 = v26;
      swift_retain();
      dispatch thunk of FBKFeedbackDraftViewController.delegate.setter();

      sub_100004F04((uint64_t)a1);
      return v4;
    }
  }
  String.LocalizationValue.init(_:)();
  static Locale.current.getter();
  if ((String.init(localized:defaultValue:table:bundle:locale:comment:)() != 0x7865546C6167654CLL
     || v20 != 0xEE00726F72724574)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.setter();
    goto LABEL_9;
  }
  v38[0] = 0;
  v38[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease();
  v38[0] = 0xD000000000000029;
  v38[1] = 0x80000001000135E0;
  NSString v29 = String._bridgeToObjectiveC()();
  v30 = (void *)MGGetStringAnswer();

  if (!v30) {
    __break(1u);
  }
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v33 = v32;

  v34._countAndFlagsBits = v31;
  v34._object = v33;
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100004DF0()
{
  sub_100004F04(v0 + 24);
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for FeedbackController()
{
  return self;
}

uint64_t sub_100004E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100004EC0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004F04(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100004F54(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100005ABC(v6, (uint64_t)qword_10001EB28);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_bridgeObjectRetain();
    sub_10000CBB0(a1, a2, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Controller complete with ID: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_100004E5C(v3 + 24, (uint64_t)v13);
  unint64_t v10 = sub_1000070C0((uint64_t)&_swiftEmptyArrayStorage);
  sub_100008AAC(0, (uint64_t)v13, v10);
  swift_bridgeObjectRelease();
  sub_100005AF4((uint64_t)v13);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    [Strong dismissViewControllerAnimated:0 completion:0];
  }
}

void sub_10000516C()
{
  uint64_t v1 = v0;
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005ABC(v2, (uint64_t)qword_10001EB28);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)v5 = 136446210;
    uint64_t v6 = FBKDraftError.description.getter();
    sub_10000CBB0(v6, v7, v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Controller failed to start, error: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100004E5C(v1 + 24, (uint64_t)v13);
  sub_100005B54(&qword_10001DE38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014820;
  *(void *)(inited + 32) = 0x726F727265;
  *(void *)(inited + 40) = 0xE500000000000000;
  FBKDraftError.description.getter();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v9;
  unint64_t v10 = sub_1000070C0(inited);
  sub_100008AAC(1, (uint64_t)v13, v10);
  swift_bridgeObjectRelease();
  sub_100005AF4((uint64_t)v13);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    uint64_t v12 = Strong;
    [Strong dismissViewControllerAnimated:0 completion:0];
  }
}

uint64_t sub_1000053AC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100005ABC(v8, (uint64_t)qword_10001EB28);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  NSString v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v25[0] = v22;
    *(_DWORD *)uint64_t v11 = 136380931;
    sub_100005B98((unint64_t *)&qword_10001DE40, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v14 = sub_10000CBB0(v12, v13, v25);
    uint64_t v23 = v2;
    uint64_t v24 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_WORD *)(v11 + 12) = 2082;
    uint64_t v15 = FBKAttachmentError.description.getter();
    uint64_t v24 = sub_10000CBB0(v15, v16, v25);
    uint64_t v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Controller failed to attach, url: %{private}s error  %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_100004E5C(v2 + 24, (uint64_t)v25);
  sub_100005B54(&qword_10001DE38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014820;
  *(void *)(inited + 32) = 0x726F727265;
  *(void *)(inited + 40) = 0xE500000000000000;
  FBKAttachmentError.description.getter();
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v18;
  unint64_t v19 = sub_1000070C0(inited);
  sub_100008AAC(2, (uint64_t)v25, v19);
  swift_bridgeObjectRelease();
  return sub_100005AF4((uint64_t)v25);
}

void sub_100005718()
{
  uint64_t v1 = v0;
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005ABC(v2, (uint64_t)qword_10001EB28);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Controller cancelled.", v5, 2u);
    swift_slowDealloc();
  }

  sub_100004E5C(v1 + 24, (uint64_t)v9);
  unint64_t v6 = sub_1000070C0((uint64_t)&_swiftEmptyArrayStorage);
  sub_100008AAC(6, (uint64_t)v9, v6);
  swift_bridgeObjectRelease();
  sub_100005AF4((uint64_t)v9);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    [Strong dismissViewControllerAnimated:0 completion:0];
  }
}

void sub_100005860(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005ABC(v4, (uint64_t)qword_10001EB28);
  id v5 = a1;
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v14[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    type metadata accessor for FBKSubmissionError();
    sub_100005B98(&qword_10001DE30, (void (*)(uint64_t))&type metadata accessor for FBKSubmissionError);
    uint64_t v9 = Error.localizedDescription.getter();
    sub_10000CBB0(v9, v10, v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to submit feedback.%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100004E5C(v2 + 24, (uint64_t)v14);
  unint64_t v11 = sub_1000070C0((uint64_t)&_swiftEmptyArrayStorage);
  sub_100008AAC(1, (uint64_t)v14, v11);
  swift_bridgeObjectRelease();
  sub_100005AF4((uint64_t)v14);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  if (Strong)
  {
    unint64_t v13 = Strong;
    [Strong dismissViewControllerAnimated:0 completion:0];
  }
}

uint64_t sub_100005ABC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005AF4(uint64_t a1)
{
  uint64_t v2 = sub_100005B54(&qword_10001DE28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005B54(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005B98(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100005BE0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_100005B54(&qword_10001DE58);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v38 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v38 - v14;
  id v41 = [self defaultManager];
  Swift::Bool v16 = URL.checkResourceIsReachable()();
  if (!v17)
  {
    if (v16)
    {
      URL.resolvingSymlinksInPath()();
      URL.path.getter();
      NSString v18 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v19 = v41;
      unsigned __int8 v20 = [v41 fileExistsAtPath:v18];

      if (v20)
      {
        URL.path.getter();
        NSString v21 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        unsigned __int8 v22 = [v19 isReadableFileAtPath:v21];

        if (v22)
        {

          (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a2, v15, v7);
LABEL_16:
          uint64_t v36 = 0;
          return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v36, 1, v7);
        }
        uint64_t v42 = 0;
        unint64_t v43 = 0xE000000000000000;
        _StringGuts.grow(_:)(26);
        swift_bridgeObjectRelease();
        unint64_t v23 = 0xD000000000000018;
        uint64_t v24 = "File is not readable at ";
      }
      else
      {
        uint64_t v42 = 0;
        unint64_t v43 = 0xE000000000000000;
        _StringGuts.grow(_:)(24);
        swift_bridgeObjectRelease();
        unint64_t v23 = 0xD000000000000016;
        uint64_t v24 = "File doesn't exist at ";
      }
      uint64_t v42 = v23;
      unint64_t v43 = (unint64_t)(v24 - 32) | 0x8000000000000000;
      v25._countAndFlagsBits = URL.path.getter();
      String.append(_:)(v25);
      swift_bridgeObjectRelease();
      sub_100006E70(v42, v43);
      swift_bridgeObjectRelease();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
    }
    else
    {
      sub_100006E70(0xD000000000000018, 0x8000000100013890);
      swift_willThrow();
    }
  }
  sub_100006AB0((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {

    swift_errorRelease();
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v35(v13, v6, v7);
    v35(a2, v13, v7);
    goto LABEL_16;
  }
  sub_100006D54((uint64_t)v6, &qword_10001DE58);
  if (qword_10001DC70 != -1) {
    swift_once();
  }
  uint64_t v26 = type metadata accessor for Logger();
  sub_100005ABC(v26, (uint64_t)qword_10001EB10);
  id v27 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v40, a1, v7);
  swift_errorRetain();
  swift_errorRetain();
  v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v42 = v38;
    *(_DWORD *)uint64_t v30 = 136446466;
    sub_100006E18();
    uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v44 = sub_10000CBB0(v31, v32, &v42);
    v39 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v27, v7);
    *(_WORD *)(v30 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v33 = Error.localizedDescription.getter();
    uint64_t v44 = sub_10000CBB0(v33, v34, &v42);
    a2 = v39;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Error accessing %{public}s. %{public}s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v27, v7);
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v36 = 1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v36, 1, v7);
}

void sub_10000621C(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v65 = a3;
  uint64_t v4 = sub_100005B54(&qword_10001DE48);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v62 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v61 = (char *)&v60 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v60 - v10;
  __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v60 - v12;
  uint64_t v14 = sub_100005B54(&qword_10001DE50);
  __chkstk_darwin(v14 - 8);
  Swift::Bool v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005B54(&qword_10001DE58);
  __chkstk_darwin(v17 - 8);
  id v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v64 = (char *)&v60 - v25;
  uint64_t v26 = &a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess();
  if (!*((void *)v26 + 1))
  {
LABEL_4:
    if (qword_10001DC78 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_100005ABC(v28, (uint64_t)qword_10001EB28);
    os_log_type_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Invalid log_path.", v31, 2u);
      swift_slowDealloc();
    }

LABEL_9:
    unint64_t v32 = (_OWORD *)v65;
    *(void *)(v65 + 32) = 0;
    _OWORD *v32 = 0u;
    v32[1] = 0u;
    return;
  }
  swift_bridgeObjectRetain();
  URL.init(fileURLWithPath:)();
  swift_bridgeObjectRelease();
  sub_100005BE0((uint64_t)v24, v19);
  id v27 = *(void (**)(char *, uint64_t))(v21 + 8);
  v27(v24, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_100006D54((uint64_t)v19, &qword_10001DE58);
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v64, v19, v20);
  uint64_t v33 = v63;
  switch(v63)
  {
    case 0:
      sub_10000E0AC(0, a2, (uint64_t)v16);
      uint64_t v34 = type metadata accessor for PanicLog();
      int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 48))(v16, 1, v34);
      uint64_t v36 = v64;
      if (v35 == 1)
      {
        v27(v64, v20);
        uint64_t v37 = &qword_10001DE50;
        uint64_t v38 = (uint64_t)v16;
        goto LABEL_26;
      }
      v55 = (uint64_t *)v65;
      *(void *)(v65 + 24) = v34;
      v55[4] = (uint64_t)&off_100018D68;
      v56 = sub_100006CF0(v55);
      sub_100006DB0((uint64_t)v16, (uint64_t)v56, (uint64_t (*)(void))type metadata accessor for PanicLog);
      v57 = v36;
      goto LABEL_32;
    case 1:
      uint64_t v44 = v64;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v64, v20);
      sub_100008EAC(3u, (uint64_t)v24, (uint64_t)v11);
      uint64_t v45 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 48))(v11, 1, v45) == 1)
      {
        v27(v44, v20);
        uint64_t v37 = &qword_10001DE48;
        uint64_t v38 = (uint64_t)v11;
        goto LABEL_26;
      }
      v58 = (uint64_t *)v65;
      *(void *)(v65 + 24) = v45;
      v58[4] = (uint64_t)&off_100018AF0;
      v53 = sub_100006CF0(v58);
      uint64_t v54 = (uint64_t)v11;
      goto LABEL_31;
    case 2:
      uint64_t v44 = v64;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v64, v20);
      sub_100008EAC(0, (uint64_t)v24, (uint64_t)v13);
      uint64_t v46 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v13, 1, v46) == 1)
      {
        v27(v44, v20);
        uint64_t v37 = &qword_10001DE48;
        uint64_t v38 = (uint64_t)v13;
        goto LABEL_26;
      }
      v59 = (uint64_t *)v65;
      *(void *)(v65 + 24) = v46;
      v59[4] = (uint64_t)&off_100018AF0;
      v53 = sub_100006CF0(v59);
      uint64_t v54 = (uint64_t)v13;
      goto LABEL_31;
    case 3:
      uint64_t v44 = v64;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v64, v20);
      v47 = v61;
      uint64_t v48 = (uint64_t)v61;
      unsigned __int8 v49 = 1;
      goto LABEL_24;
    case 4:
      uint64_t v44 = v64;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v64, v20);
      v47 = v62;
      uint64_t v48 = (uint64_t)v62;
      unsigned __int8 v49 = 2;
LABEL_24:
      sub_100008EAC(v49, (uint64_t)v24, v48);
      uint64_t v50 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 48))(v47, 1, v50) == 1)
      {
        v27(v44, v20);
        uint64_t v37 = &qword_10001DE48;
        uint64_t v38 = (uint64_t)v47;
LABEL_26:
        sub_100006D54(v38, v37);
        uint64_t v51 = v65;
        *(_OWORD *)uint64_t v65 = 0u;
        *(_OWORD *)(v51 + 16) = 0u;
        *(void *)(v51 + 32) = 0;
      }
      else
      {
        v52 = (uint64_t *)v65;
        *(void *)(v65 + 24) = v50;
        v52[4] = (uint64_t)&off_100018AF0;
        v53 = sub_100006CF0(v52);
        uint64_t v54 = (uint64_t)v47;
LABEL_31:
        sub_100006DB0(v54, (uint64_t)v53, (uint64_t (*)(void))type metadata accessor for CrashLog);
        v57 = v44;
LABEL_32:
        v27(v57, v20);
      }
      break;
    default:
      if (qword_10001DC78 != -1) {
        swift_once();
      }
      uint64_t v39 = type metadata accessor for Logger();
      sub_100005ABC(v39, (uint64_t)qword_10001EB28);
      v40 = Logger.logObject.getter();
      os_log_type_t v41 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = v20;
        unint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v43 = 134217984;
        uint64_t v66 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Invalid Log Type %ld", v43, 0xCu);
        uint64_t v20 = v42;
        swift_slowDealloc();
      }

      v27(v64, v20);
      goto LABEL_9;
  }
}

uint64_t sub_100006AB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v18 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v18 - v10;
  URL.deletingLastPathComponent()();
  URL.appendingPathComponent(_:isDirectory:)();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  URL.lastPathComponent.getter();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  v12(v9, v2);
  id v13 = [self defaultManager];
  URL.path.getter();
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned int v15 = [v13 fileExistsAtPath:v14];

  if (v15)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v11, v2);
    uint64_t v16 = 0;
  }
  else
  {
    v12(v11, v2);
    uint64_t v16 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, v16, 1, v2);
}

uint64_t *sub_100006CF0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100006D54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005B54(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006DB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100006E18()
{
  unint64_t result = qword_10001DE40;
  if (!qword_10001DE40)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE40);
  }
  return result;
}

id sub_100006E70(uint64_t a1, uint64_t a2)
{
  sub_100005B54(&qword_10001DE60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014820;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  sub_100006F88(inited);
  id v6 = objc_allocWithZone((Class)NSError);
  NSString v7 = String._bridgeToObjectiveC()();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v6 initWithDomain:v7 code:1 userInfo:isa];

  return v9;
}

unint64_t sub_100006F88(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B54(&qword_10001DE78);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100008004(v6, (uint64_t)&v15, &qword_10001DE80);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100007BD4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100008068(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000070C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005B54(&qword_10001DE88);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100007BD4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

uint64_t sub_1000071DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = 0;
  memset(v40, 0, sizeof(v40));
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v4 = sub_100007C4C((uint64_t)&v35), (v5 & 1) != 0))
  {
    sub_100007FA8(*(void *)(a1 + 56) + 32 * v4, (uint64_t)&v38);
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_100007C90((uint64_t)&v35);
  if (!*((void *)&v39 + 1))
  {
    sub_100006D54((uint64_t)&v38, &qword_10001DE68);
LABEL_11:
    if (qword_10001DC78 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100005ABC(v8, (uint64_t)qword_10001EB28);
    swift_bridgeObjectRetain_n();
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v35 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v12 = a2;
      uint64_t v13 = Dictionary.description.getter();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      uint64_t v16 = v13;
      a2 = v12;
      *(void *)&long long v38 = sub_10000CBB0(v16, v15, (uint64_t *)&v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Missing or malformed \"options\" in launch parameters: %s", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v6 = sub_100007C4C((uint64_t)&v35), (v7 & 1) != 0))
  {
    sub_100007FA8(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v38);
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
  }
  sub_100007C90((uint64_t)&v35);
  if (*((void *)&v39 + 1))
  {
    if (swift_dynamicCast())
    {
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      JSONDecoder.init()();
      type metadata accessor for DiagnosticsReporterLaunchOptions();
      sub_100007EE8();
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      swift_release();
      uint64_t v26 = (void *)v35;
      unint64_t v27 = sub_10000BFE4(0x65707974uLL);
      if ((v28 & 1) == 0)
      {
        uint64_t v29 = v27;
        os_log_type_t v30 = v26;
        sub_10000621C(v29, v30, (uint64_t)&v35);
        sub_100007E90(0x736E6F6974706FLL, 0xE700000000000000);

        sub_100006D54((uint64_t)v40, &qword_10001DE28);
        sub_100007F40((uint64_t)&v35, (uint64_t)v40);
        sub_100008004((uint64_t)v40, a2, &qword_10001DE28);
        sub_100008004((uint64_t)v40, (uint64_t)&v35, &qword_10001DE28);
        uint64_t v31 = *((void *)&v36 + 1);
        sub_100006D54((uint64_t)&v35, &qword_10001DE28);
        if (v31) {
          return sub_100006D54((uint64_t)v40, &qword_10001DE28);
        }
        goto LABEL_28;
      }
      if (qword_10001DC78 != -1) {
        swift_once();
      }
      uint64_t v32 = type metadata accessor for Logger();
      sub_100005ABC(v32, (uint64_t)qword_10001EB28);
      id v9 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v9, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 134217984;
        *(void *)&long long v35 = 1701869940;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v9, v33, "Log type value does not match a know type: %ld", v34, 0xCu);
        swift_slowDealloc();
      }

      goto LABEL_24;
    }
  }
  else
  {
    sub_100006D54((uint64_t)&v38, &qword_10001DE68);
  }
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  sub_100005ABC(v17, (uint64_t)qword_10001EB28);
  swift_bridgeObjectRetain_n();
  id v9 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v18))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v35 = swift_slowAlloc();
    *(_DWORD *)id v19 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v20 = Dictionary.description.getter();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&long long v38 = sub_10000CBB0(v20, v22, (uint64_t *)&v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v18, "Missing or malformed \"type\" in launch parameters: %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
LABEL_24:
    sub_100007E90(0x736E6F6974706FLL, 0xE700000000000000);

    goto LABEL_27;
  }
  sub_100007E90(0x736E6F6974706FLL, 0xE700000000000000);
LABEL_26:

  swift_bridgeObjectRelease_n();
LABEL_27:
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  sub_100008004((uint64_t)v40, (uint64_t)&v35, &qword_10001DE28);
  uint64_t v23 = *((void *)&v36 + 1);
  sub_100006D54((uint64_t)&v35, &qword_10001DE28);
  if (!v23)
  {
LABEL_28:
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v24 = sub_1000070C0((uint64_t)&_swiftEmptyArrayStorage);
    sub_100008AAC(3, (uint64_t)&v35, v24);
    swift_bridgeObjectRelease();
    sub_100006D54((uint64_t)&v35, &qword_10001DE28);
  }
  return sub_100006D54((uint64_t)v40, &qword_10001DE28);
}

void *sub_100007B00(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_100007BA4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_100007BD4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100007CE4(a1, a2, v4);
}

unint64_t sub_100007C4C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100007DC8(a1, v4);
}

uint64_t sub_100007C90(uint64_t a1)
{
  return a1;
}

unint64_t sub_100007CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    os_log_type_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100007DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100008078(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100007C90((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007E90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_100007EE8()
{
  unint64_t result = qword_10001DE70;
  if (!qword_10001DE70)
  {
    type metadata accessor for DiagnosticsReporterLaunchOptions();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DE70);
  }
  return result;
}

uint64_t sub_100007F40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B54(&qword_10001DE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008004(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005B54(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100008068(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008078(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for DefaultPolicy()
{
  return &type metadata for DefaultPolicy;
}

ValueMetadata *type metadata accessor for AnalyticsLogger()
{
  return &type metadata for AnalyticsLogger;
}

unint64_t sub_1000080F4(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6572756C696166;
      break;
    case 2:
      unint64_t result = 0x2D6572756C696166;
      break;
    case 3:
    case 4:
      return result;
    case 5:
      unint64_t result = 0x2D64656C706D6173;
      break;
    case 6:
      unint64_t result = 0x662D6C65636E6163;
      break;
    case 7:
      unint64_t result = 0x642D6C65636E6163;
      break;
    default:
      unint64_t result = 0x73736563637573;
      break;
  }
  return result;
}

uint64_t sub_100008214(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  swift_bridgeObjectRetain();
  id v8 = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *a4;
  *a4 = 0x8000000000000000;
  sub_1000085D0((uint64_t)v8, a1, a2, isUniquelyReferenced_nonNull_native);
  *a4 = v11;
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000082C0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005B54(&qword_10001DE88);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  long long v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    os_log_type_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *os_log_type_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_1000085D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100007BD4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100008740();
LABEL_7:
    os_log_type_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1000082C0(v15, a4 & 1);
  unint64_t v20 = sub_100007BD4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  os_log_type_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_100008740()
{
  uint64_t v1 = v0;
  sub_100005B54(&qword_10001DE88);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000088F4(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v20 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v20 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v20 + 8 * v9);
        if (!v18)
        {
          int64_t v9 = v17 + 3;
          if (v17 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v20 + 8 * v9);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    unint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    unint64_t v15 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v16 = v15;
    a2(v13, v14, v16);

    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v7) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v20 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_100008AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100005B54(&qword_10001DE38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014820;
  *(void *)(inited + 32) = 0x737574617473;
  *(void *)(inited + 40) = 0xE600000000000000;
  uint64_t v6 = inited;
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  *(void *)(v6 + 48) = v7;
  unint64_t v16 = sub_1000070C0(v6);
  if (*(void *)(a2 + 24))
  {
    sub_100008E40(a2, (uint64_t)v13);
    uint64_t v8 = v14;
    if (!v14)
    {
      __break(1u);
      JUMPOUT(0x100008DC4);
    }
    uint64_t v9 = v15;
    sub_100004EC0(v13, v14);
    (*(void (**)(uint64_t, uint64_t))(v9 + 56))(v8, v9);
    uint64_t v10 = __chkstk_darwin();
    sub_1000088F4(v10, (void (*)(uint64_t, uint64_t, id))sub_100008EA8);
    swift_bridgeObjectRelease();
    sub_100004F04((uint64_t)v13);
  }
  __chkstk_darwin();
  sub_1000088F4(a3, (void (*)(uint64_t, uint64_t, id))sub_100008DE4);
  NSString v11 = String._bridgeToObjectiveC()();
  sub_100008E00();
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
  swift_bridgeObjectRelease();
}

uint64_t sub_100008DE4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100008214(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

unint64_t sub_100008E00()
{
  unint64_t result = qword_10001DE90;
  if (!qword_10001DE90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001DE90);
  }
  return result;
}

uint64_t sub_100008E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B54(&qword_10001DE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008EAC@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = a1;
  uint64_t v46 = a3;
  int v5 = a1;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v41 = &v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = (int *)type metadata accessor for CrashLog();
  uint64_t v45 = *((void *)v9 - 1);
  uint64_t v10 = (int *)__chkstk_darwin(v9);
  unint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = &v12[v10[6]];
  *(void *)uint64_t v13 = 0x6873617243;
  *((void *)v13 + 1) = 0xE500000000000000;
  uint64_t v14 = &v12[v10[10]];
  if (v5 == 4) {
    char v4 = 3;
  }
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  v40 = v14;
  *unint64_t v12 = v4;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v15(&v12[v10[5]], a2, v6);
  sub_100005B54(&qword_10001DE98);
  uint64_t v42 = v7;
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100014820;
  uint64_t v44 = v6;
  v15((char *)(v17 + v16), a2, v6);
  *(void *)&v12[v9[7]] = v17;
  unint64_t v18 = sub_100006F88((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v19 = v9[8];
  *(void *)&v12[v19] = v18;
  uint64_t v20 = &type metadata for DefaultPolicy;
  if ((v4 & 0xFE) != 0)
  {
    char v21 = &off_100018AB8;
  }
  else
  {
    uint64_t v20 = &type metadata for CriticalPolicy;
    char v21 = &off_100018F18;
  }
  *((void *)&v50 + 1) = v20;
  uint64_t v51 = v21;
  unint64_t v43 = v9;
  sub_100009610(&v49, (uint64_t)&v12[v9[9]]);
  int64_t v22 = sub_10000D998(a2);
  unint64_t v23 = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v12[v19] = v22;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t v27 = __DataStorage.init(capacity:)();
  long long v49 = 0uLL;
  uint64_t v28 = __chkstk_darwin(v27);
  *(void *)&v39[-48] = a2;
  *(void *)&v39[-40] = v24;
  *(void *)&v39[-32] = v26;
  *(void *)&v39[-24] = 128;
  *(void *)&v39[-16] = v29;
  uint64_t v47 = 0;
  uint64_t v48 = v28;
  sub_10000AE24((void (*)(uint64_t, uint64_t))sub_100009A48);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v30 = *((void *)&v49 + 1);
  if (!*((void *)&v49 + 1))
  {
    uint64_t v33 = v44;
    uint64_t v32 = v23;
    if (v22[2] && (unint64_t v34 = sub_100007BD4(1701667182, 0xE400000000000000), (v35 & 1) != 0))
    {
      sub_100007FA8(v22[7] + 32 * v34, (uint64_t)&v49);
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
    }
    uint64_t v36 = v42;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(a2, v33);
    if (*((void *)&v50 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v31 = v47;
        uint64_t v30 = v48;
        goto LABEL_17;
      }
    }
    else
    {
      sub_100009A6C((uint64_t)&v49);
    }
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    goto LABEL_17;
  }
  uint64_t v31 = v49;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(a2, v44);
  uint64_t v47 = v31;
  uint64_t v48 = v30;
  uint64_t v32 = v23;
LABEL_17:
  swift_bridgeObjectRelease();
  *(void *)uint64_t v32 = v31;
  *((void *)v32 + 1) = v30;
  uint64_t v37 = v46;
  sub_100009ACC((uint64_t)v12, v46);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v45 + 56))(v37, 0, 1, v43);
  return sub_1000099EC((uint64_t)v12);
}

uint64_t type metadata accessor for CrashLog()
{
  uint64_t result = qword_10001DEF8;
  if (!qword_10001DEF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009610(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

BOOL sub_100009628(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000963C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100009684()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000096B0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_1000096F4()
{
  uint64_t v1 = v0;
  sub_100005B54(&qword_10001DE38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014910;
  *(void *)(inited + 32) = 0x737365636F7270;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v3 = *(int *)(type metadata accessor for CrashLog() + 32);
  uint64_t v4 = *(void *)(v0 + v3);
  if (*(void *)(v4 + 16)
    && (unint64_t v5 = sub_100007BD4(1701667182, 0xE400000000000000), (v6 & 1) != 0)
    && (sub_100007FA8(*(void *)(v4 + 56) + 32 * v5, (uint64_t)v14), sub_10000A688(), swift_dynamicCast()))
  {
    uint64_t v7 = v13;
  }
  else
  {
    sub_10000A688();
    uint64_t v7 = NSString.init(stringLiteral:)();
  }
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = 0x746E656469636E69;
  *(void *)(inited + 64) = 0xEB0000000064695FLL;
  uint64_t v8 = *(void *)(v1 + v3);
  if (*(void *)(v8 + 16)
    && (unint64_t v9 = sub_100007BD4(0x746E656469636E69, 0xEB0000000064695FLL), (v10 & 1) != 0)
    && (sub_100007FA8(*(void *)(v8 + 56) + 32 * v9, (uint64_t)v14), sub_10000A688(), swift_dynamicCast()))
  {
    uint64_t v11 = v13;
  }
  else
  {
    sub_10000A688();
    uint64_t v11 = NSString.init(stringLiteral:)();
  }
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = 1701869940;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = String._bridgeToObjectiveC()();
  return sub_1000070C0(inited);
}

unint64_t sub_1000098E4()
{
  int v1 = *v0;
  uint64_t v2 = 0x61576D6574737953;
  uint64_t v3 = 0x647261646E617453;
  if (!*v0) {
    uint64_t v3 = 4541505;
  }
  if (v1 != 1) {
    uint64_t v2 = v3;
  }
  if (v1 == 2) {
    return 0xD000000000000014;
  }
  else {
    return v2;
  }
}

uint64_t sub_100009968(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1000099A0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000099B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 40));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1000099EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CrashLog();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009A48(uint64_t a1)
{
  return sub_10000A9E4(a1);
}

uint64_t sub_100009A6C(uint64_t a1)
{
  uint64_t v2 = sub_100005B54(&qword_10001DE68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CrashLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100009B30(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    unint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    uint64_t v13 = (uint64_t *)((char *)v4 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    uint64_t v16 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v17 = (char *)v4 + v16;
    unint64_t v18 = (char *)a2 + v16;
    long long v19 = *(_OWORD *)((char *)a2 + v16 + 24);
    *(_OWORD *)((char *)v4 + v16 + 24) = v19;
    uint64_t v20 = v19;
    char v21 = **(void (***)(char *, char *, uint64_t))(v19 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v17, v18, v20);
    uint64_t v22 = a3[10];
    unint64_t v23 = (uint64_t *)((char *)v4 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *unint64_t v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_100009CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100004F04(a1 + *(int *)(a2 + 36));

  return swift_bridgeObjectRelease();
}

unsigned char *sub_100009D88(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(void *)&a1[v11] = *(void *)&a2[v11];
  uint64_t v15 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  long long v18 = *(_OWORD *)&a2[v15 + 24];
  *(_OWORD *)&a1[v15 + 24] = v18;
  uint64_t v19 = v18;
  uint64_t v20 = **(void (***)(unsigned char *, unsigned char *, uint64_t))(v18 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v16, v17, v19);
  uint64_t v21 = a3[10];
  uint64_t v22 = &a1[v21];
  unint64_t v23 = &a2[v21];
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_100009ED4(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_10000A000((uint64_t *)&a1[a3[9]], (uint64_t *)&a2[a3[9]]);
  uint64_t v13 = a3[10];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *sub_10000A000(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

unsigned char *sub_10000A230(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  uint64_t v11 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  return a1;
}

unsigned char *sub_10000A300(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[9];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  sub_100004F04((uint64_t)&a1[v15]);
  long long v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((void *)v16 + 4) = *((void *)v17 + 4);
  uint64_t v19 = a3[10];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = (uint64_t *)&a2[v19];
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000A410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A424);
}

uint64_t sub_10000A424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_10000A4EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A500);
}

uint64_t sub_10000A500(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10000A5C4()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10000A688()
{
  unint64_t result = qword_10001DF48;
  if (!qword_10001DF48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001DF48);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for CrashLog.Type(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CrashLog.Type(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CrashLog.Type(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000A834);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_10000A85C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A868(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrashLog.Type()
{
  return &type metadata for CrashLog.Type;
}

unint64_t sub_10000A884()
{
  unint64_t result = qword_10001DF50;
  if (!qword_10001DF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DF50);
  }
  return result;
}

Swift::String_optional __swiftcall URL.extendedAttribute(_:)(Swift::String a1)
{
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(capacity:)();
  sub_10000AE24((void (*)(uint64_t, uint64_t))sub_100009A48);
  swift_release();
  uint64_t v1 = 0;
  int v2 = 0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.setExtendedAttribute(name:value:)()
{
  return URL.withUnsafeFileSystemRepresentation<A>(_:)();
}

uint64_t sub_10000A9E4(uint64_t result)
{
  if (result)
  {
    __chkstk_darwin();
    return URL.withUnsafeFileSystemRepresentation<A>(_:)();
  }
  return result;
}

uint64_t sub_10000AA68(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, uint64_t *a6)
{
  uint64_t v10 = String.utf8CString.getter();
  ssize_t v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  uint64_t result = swift_release();
  if (v11 >= 1)
  {
    *a6 = String.init(validatingUTF8:)();
    a6[1] = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000AB04(const char *a1, uint64_t a2, unint64_t a3)
{
  switch(a3 >> 62)
  {
    case 1uLL:
      if ((int)a2 > a2 >> 32)
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      sub_10000AFB8(a2, a3);
      uint64_t v9 = (char *)__DataStorage._bytes.getter();
      if (v9)
      {
        uint64_t v10 = __DataStorage._offset.getter();
        if (__OFSUB__((int)a2, v10))
        {
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
        }
        v9 += (int)a2 - v10;
      }
      __DataStorage._length.getter();
      if (__OFSUB__(HIDWORD(a2), a2))
      {
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
      uint64_t v11 = String.utf8CString.getter();
      int v7 = setxattr(a1, (const char *)(v11 + 32), v9, HIDWORD(a2) - (int)a2, 0, 0);
      swift_release();
      uint64_t result = sub_100007E90(a2, a3);
      if (v7 < 0)
      {
LABEL_18:
        sub_10000AF64();
        swift_allocError();
        *uint64_t v20 = v7;
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a2 + 16);
      swift_retain();
      swift_retain();
      uint64_t v13 = (char *)__DataStorage._bytes.getter();
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v14 = __DataStorage._offset.getter();
      if (__OFSUB__(v12, v14)) {
        goto LABEL_24;
      }
      v13 += v12 - v14;
LABEL_14:
      __DataStorage._length.getter();
      uint64_t v16 = *(void *)(a2 + 16);
      uint64_t v15 = *(void *)(a2 + 24);
      size_t v17 = v15 - v16;
      if (__OFSUB__(v15, v16)) {
        goto LABEL_21;
      }
      uint64_t v18 = String.utf8CString.getter();
      int v7 = setxattr(a1, (const char *)(v18 + 32), v13, v17, 0, 0);
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      if (v7 < 0) {
        goto LABEL_18;
      }
      return result;
    case 3uLL:
      memset(value, 0, 14);
      uint64_t v19 = String.utf8CString.getter();
      int v7 = setxattr(a1, (const char *)(v19 + 32), value, 0, 0, 0);
      uint64_t result = swift_release();
      if (v7 < 0) {
        goto LABEL_18;
      }
      return result;
    default:
      value[0] = a2;
      LOWORD(value[1]) = a3;
      BYTE2(value[1]) = BYTE2(a3);
      BYTE3(value[1]) = BYTE3(a3);
      BYTE4(value[1]) = BYTE4(a3);
      BYTE5(value[1]) = BYTE5(a3);
      uint64_t v6 = String.utf8CString.getter();
      int v7 = setxattr(a1, (const char *)(v6 + 32), value, BYTE6(a3), 0, 0);
      uint64_t result = swift_release();
      if (v7 < 0) {
        goto LABEL_18;
      }
      return result;
  }
}

void sub_10000AE24(void (*a1)(uint64_t, uint64_t))
{
  Data.InlineSlice.ensureUniqueReference()();
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  if ((int)v4 < (int)v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = __DataStorage._bytes.getter();
  if (!v5)
  {
LABEL_10:
    __break(1u);
    return;
  }
  uint64_t v6 = v5;
  uint64_t v7 = __DataStorage._offset.getter();
  uint64_t v8 = v3 - v7;
  if (__OFSUB__(v3, v7))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v9 = v4 - v3;
  uint64_t v10 = __DataStorage._length.getter();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  a1(v6 + v8, v6 + v8 + v11);
}

uint64_t sub_10000AED4(const char *a1)
{
  return sub_10000AB04(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void *_s22ExtendedAttributeErrorOwCP(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t _s22ExtendedAttributeErrorOwet(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t _s22ExtendedAttributeErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t sub_10000AF4C()
{
  return 0;
}

ValueMetadata *type metadata accessor for URL.ExtendedAttributeError()
{
  return &type metadata for URL.ExtendedAttributeError;
}

unint64_t sub_10000AF64()
{
  unint64_t result = qword_10001DF58;
  if (!qword_10001DF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DF58);
  }
  return result;
}

uint64_t sub_10000AFB8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000B010(const char *a1)
{
  return sub_10000AA68(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(uint64_t **)(v1 + 48));
}

id sub_10000B074()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t type metadata accessor for RootViewController()
{
  return self;
}

id sub_10000B374()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog;
  id result = (id)sub_100008E40((uint64_t)v0 + OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_diagnosticLog, (uint64_t)v13);
  if (!v14)
  {
    __break(1u);
    goto LABEL_7;
  }
  id result = (id)sub_100008E40(v1, (uint64_t)v12);
  if (!v12[3])
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_10000B7DC(v12);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_100004F04((uint64_t)v12);
  sub_100004E5C((uint64_t)v13, (uint64_t)v12);
  type metadata accessor for FeedbackController();
  swift_allocObject();
  uint64_t v7 = v0;
  uint64_t v8 = sub_1000045FC(v12, v4, v6);
  sub_100004F04((uint64_t)v13);
  swift_unknownObjectUnownedAssign();

  uint64_t v9 = OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController;
  *(void *)&v7[OBJC_IVAR____TtC19DiagnosticsReporter18RootViewController_feedbackController] = v8;
  id result = (id)swift_release();
  uint64_t v10 = *(void *)&v7[v9];
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id result = [*(id *)(v10 + 16) setModalInPresentation:1];
  uint64_t v11 = *(void *)&v7[v9];
  if (v11) {
    return [v7 presentViewController:*(void *)(v11 + 16) animated:1 completion:0];
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t Array.appendIfNotNil(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  uint64_t v10 = __chkstk_darwin(v6);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v8, v3);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v3);
  Array.append(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v3);
}

uint64_t sub_10000B6CC(uint64_t a1)
{
  return sub_10000B700(a1, qword_10001EB10);
}

uint64_t sub_10000B6E4(uint64_t a1)
{
  return sub_10000B700(a1, qword_10001EB28);
}

uint64_t sub_10000B700(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000B778(v3, a2);
  sub_100005ABC(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_10000B778(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_10000B7DC(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  sub_100004EC0(a1, v2);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 0x63696E6150 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_21:
    NSString v24 = String._bridgeToObjectiveC()();
    id v25 = [self bundleWithIdentifier:v24];

    if (v25)
    {
      v53._countAndFlagsBits = 0xD00000000000001BLL;
      v53._object = (void *)0x8000000100013B50;
      v26._countAndFlagsBits = 0x6E6150656C746954;
      v26._object = (void *)0xED0000534F696369;
      v27._countAndFlagsBits = 0;
      v27._object = (void *)0xE000000000000000;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v53);

      sub_100005B54(&qword_10001E088);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_100014820;
      NSString v29 = String._bridgeToObjectiveC()();
      uint64_t v30 = (void *)MGGetStringAnswer();

      if (v30)
      {
        uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v33 = v32;

        *(void *)(v28 + 56) = &type metadata for String;
        *(void *)(v28 + 64) = sub_10000BE68();
        *(void *)(v28 + 32) = v31;
        *(void *)(v28 + 40) = v33;
        static String.localizedStringWithFormat(_:_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100004EC0(a1, v7);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8) == 0x6873617243 && v9 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    sub_100004E5C((uint64_t)a1, (uint64_t)v49);
  }
  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    sub_100004E5C((uint64_t)a1, (uint64_t)v49);
    if ((v11 & 1) == 0)
    {
      sub_100004F04((uint64_t)v49);
      goto LABEL_12;
    }
  }
  uint64_t v34 = v50;
  uint64_t v35 = v51;
  sub_100004EC0(v49, v50);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 64))(v34, v35) == 4541505 && v36 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    sub_100004E5C((uint64_t)v49, (uint64_t)v46);
LABEL_32:
    sub_100004F04((uint64_t)v46);
    sub_100004F04((uint64_t)v49);
    goto LABEL_33;
  }
  char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  sub_100004E5C((uint64_t)v49, (uint64_t)v46);
  if (v37) {
    goto LABEL_32;
  }
  uint64_t v38 = v47;
  uint64_t v39 = v48;
  sub_100004EC0(v46, v47);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v39 + 64))(v38, v39) == 0x61576D6574737953
    && v40 == 0xEE00676F64686374)
  {
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  char v45 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  sub_100004F04((uint64_t)v46);
  sub_100004F04((uint64_t)v49);
  if ((v45 & 1) == 0)
  {
LABEL_12:
    uint64_t v12 = a1[3];
    uint64_t v13 = a1[4];
    sub_100004EC0(a1, v12);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 72))(v12, v13);
    unint64_t v16 = v15;
    NSString v17 = String._bridgeToObjectiveC()();
    id v18 = [self bundleWithIdentifier:v17];

    if (v18)
    {
      if (v16) {
        unint64_t v19 = v16;
      }
      else {
        unint64_t v19 = 0xE700000000000000;
      }
      if (v16) {
        uint64_t v20 = v14;
      }
      else {
        uint64_t v20 = 0x6E776F6E6B6E55;
      }
      v52._countAndFlagsBits = 0xD00000000000001BLL;
      v21._object = (void *)0xED0000534F696873;
      v52._object = (void *)0x8000000100013B50;
      v21._countAndFlagsBits = 0x617243656C746954;
      v22._countAndFlagsBits = 0;
      v22._object = (void *)0xE000000000000000;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v18, v22, v52);

      sub_100005B54(&qword_10001E088);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_100014820;
      *(void *)(v23 + 56) = &type metadata for String;
      *(void *)(v23 + 64) = sub_10000BE68();
      *(void *)(v23 + 32) = v20;
      *(void *)(v23 + 40) = v19;
      static String.localizedStringWithFormat(_:_:)();
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
LABEL_42:
    __break(1u);
    return;
  }
LABEL_33:
  NSString v41 = String._bridgeToObjectiveC()();
  id v42 = [self bundleWithIdentifier:v41];

  if (!v42)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v43._countAndFlagsBits = 0xD000000000000010;
  v54._countAndFlagsBits = 0xD000000000000028;
  v54._object = (void *)0x8000000100013B90;
  v43._object = (void *)0x8000000100013B70;
  v44._countAndFlagsBits = 0;
  v44._object = (void *)0xE000000000000000;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v43, (Swift::String_optional)0, (NSBundle)v42, v44, v54);

  static String.localizedStringWithFormat(_:_:)();
LABEL_35:
  swift_bridgeObjectRelease();
}

unint64_t sub_10000BE68()
{
  unint64_t result = qword_10001E090;
  if (!qword_10001E090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E090);
  }
  return result;
}

unint64_t DiagnosticLogType.init(rawValue:)(unint64_t a1)
{
  return sub_10000BFE4(a1);
}

BOOL sub_10000BED8(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000BEEC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000BF34()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000BF60()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_10000BFA4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_10000BFE4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_10000BFD8(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_10000BFE4(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

unint64_t sub_10000BFF8()
{
  unint64_t result = qword_10001E098;
  if (!qword_10001E098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E098);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticLogType()
{
  return &type metadata for DiagnosticLogType;
}

uint64_t sub_10000C05C()
{
  if ([v0 _remoteViewControllerProxy])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_10000CA5C((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_100005B54(&qword_10001E0D8);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_100006D54((uint64_t)v4, &qword_10001DE68);
    return 0;
  }
}

void sub_10000C28C(void *a1, void (*a2)(uint64_t))
{
  uint64_t v3 = v2;
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100005ABC(v5, (uint64_t)qword_10001EB28);
  char v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_10000CBB0(0xD00000000000001BLL, 0x8000000100013EE0, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v2;
    swift_slowDealloc();
  }

  if (a1)
  {
    id v9 = [a1 userInfo];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1000071DC(v11, (uint64_t)v27);
      swift_bridgeObjectRelease();
      uint64_t v12 = (uint64_t)v3 + OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog;
      swift_beginAccess();
      sub_10000D924((uint64_t)v27, v12);
      swift_endAccess();
    }
    else
    {
      id v13 = a1;
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v14, v15))
      {
        id v25 = v3;
        unint64_t v16 = (uint8_t *)swift_slowAlloc();
        NSString v17 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v16 = 138412290;
        v27[0] = (uint64_t)v13;
        id v18 = v13;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *NSString v17 = a1;

        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Context is missing user info dictionary: %@.", v16, 0xCu);
        sub_100005B54(&qword_10001E0E8);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v3 = v25;
        swift_slowDealloc();
      }
      else
      {
      }
    }
    uint64_t v19 = (uint64_t)v3 + OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog;
    swift_beginAccess();
    sub_100008E40(v19, (uint64_t)v27);
    uint64_t v20 = v27[3];
    uint64_t v21 = sub_100006D54((uint64_t)v27, &qword_10001DE28);
    if (v20)
    {
      if (a2) {
        a2(v21);
      }
    }
    else
    {
      Swift::String v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v22, v23))
      {
        NSString v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unable to decode diagnostic log from launch parameters.", v24, 2u);
        swift_slowDealloc();
      }

      [v3 dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10000C9B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteViewController()
{
  return self;
}

uint64_t sub_10000CA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B54(&qword_10001DE68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CAC4(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000CAD4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10000CB10(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000CB38(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10000CBB0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10000CBB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000CC84(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007FA8((uint64_t)v12, *a3);
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
      sub_100007FA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004F04((uint64_t)v12);
  return v7;
}

uint64_t sub_10000CC84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000CE40(a5, a6);
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

uint64_t sub_10000CE40(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000CED8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000D134(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000D134(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000CED8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000D050(v2, 0);
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

void *sub_10000D050(uint64_t a1, uint64_t a2)
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
  sub_100005B54(&qword_10001E0E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000D0B8(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10000D134(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005B54(&qword_10001E0E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **sub_10000D284(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

id sub_10000D294()
{
  uint64_t v1 = (uint64_t)v0 + OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_diagnosticsLog;
  swift_beginAccess();
  id result = (id)sub_100008E40(v1, (uint64_t)v13);
  if (!v14)
  {
    __break(1u);
    goto LABEL_7;
  }
  id result = (id)sub_100008E40(v1, (uint64_t)v12);
  if (!v12[3])
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_10000B7DC(v12);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_100004F04((uint64_t)v12);
  sub_100004E5C((uint64_t)v13, (uint64_t)v12);
  type metadata accessor for FeedbackController();
  swift_allocObject();
  int64_t v7 = v0;
  uint64_t v8 = sub_1000045FC(v12, v4, v6);
  sub_100004F04((uint64_t)v13);
  swift_unknownObjectUnownedAssign();

  uint64_t v9 = OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController;
  *(void *)&v7[OBJC_IVAR____TtC19DiagnosticsReporter20RemoteViewController_feedbackController] = v8;
  id result = (id)swift_release();
  uint64_t v10 = *(void *)&v7[v9];
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id result = [*(id *)(v10 + 16) setModalInPresentation:1];
  uint64_t v11 = *(void *)&v7[v9];
  if (v11) {
    return [v7 presentViewController:*(void *)(v11 + 16) animated:1 completion:0];
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_10000D3E8(uint64_t a1, unint64_t a2)
{
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005ABC(v4, (uint64_t)qword_10001EB28);
  oslog = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    sub_10000CBB0(a1, a2, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10000D590(void (*a1)(uint64_t))
{
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100005ABC(v2, (uint64_t)qword_10001EB28);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 136315138;
    sub_10000CBB0(0xD000000000000026, 0x8000000100013F00, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (a1) {
    a1(v6);
  }
}

void *sub_10000D724()
{
  if (qword_10001DC78 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100005ABC(v0, (uint64_t)qword_10001EB28);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    sub_10000CBB0(0xD00000000000001DLL, 0x8000000100013C80, &v5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id result = (void *)sub_10000C05C();
  if (result)
  {
    [result invalidate];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10000D8C8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000D8D8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D910()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000D924(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005B54(&qword_10001DE28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_10000D998(uint64_t a1)
{
  return sub_10000D9F8(a1, sub_100010D08);
}

id sub_10000D9F8(uint64_t a1, uint64_t (*a2)(void *))
{
  uint64_t v5 = String.init(contentsOf:)();
  if (!v2)
  {
    uint64_t v7 = v5;
    unint64_t v8 = v6;
    v24[0] = 10;
    v24[1] = 0xE100000000000000;
    __chkstk_darwin(v5);
    v22[2] = v24;
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)sub_10000F1C4(0x7FFFFFFFFFFFFFFFLL, 1, a2, (uint64_t)v22, v7, v8);
    swift_bridgeObjectRelease();
    if (!v9[2]) {
      __break(1u);
    }
    uint64_t v10 = v9[4];
    unint64_t v11 = v9[5];
    unint64_t v12 = v9[6];
    unint64_t v13 = v9[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_10000DC30(v10, v11, v12, v13);
    unint64_t v16 = v15;
    NSString v17 = self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    v23[0] = 0;
    id v3 = [v17 JSONObjectWithData:isa options:0 error:v23];

    id v19 = v23[0];
    if (v3)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100007FA8((uint64_t)v24, (uint64_t)v23);
      sub_100005B54(&qword_10001E0F0);
      if (swift_dynamicCast()) {
        id v3 = (id)v22[4];
      }
      else {
        id v3 = (id)sub_100006F88((uint64_t)&_swiftEmptyArrayStorage);
      }
      sub_100007E90(v14, v16);
      sub_100004F04((uint64_t)v24);
    }
    else
    {
      uint64_t v20 = v19;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      sub_100007E90(v14, v16);
    }
  }
  return v3;
}

uint64_t sub_10000DC30(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  *(void *)&long long v37 = a1;
  *((void *)&v37 + 1) = a2;
  unint64_t v38 = a3;
  unint64_t v39 = a4;
  swift_bridgeObjectRetain();
  sub_100005B54(&qword_10001E0F8);
  if (swift_dynamicCast())
  {
    sub_100009610(v35, (uint64_t)&v30);
    sub_100004EC0(&v30, v32);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v35[0] = v37;
    sub_100004F04((uint64_t)&v30);
    return *(void *)&v35[0];
  }
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  sub_100006D54((uint64_t)v35, &qword_10001E100);
  sub_1000104F0(a1, a2, a3, a4, &v30);
  unint64_t v4 = *((void *)&v30 + 1);
  uint64_t v5 = v30;
  if (*((void *)&v30 + 1) >> 60 != 15)
  {
    swift_bridgeObjectRelease();
    v35[0] = __PAIR128__(v4, v5);
    return *(void *)&v35[0];
  }
  uint64_t v6 = sub_1000101C0(a1, a2, a3, a4);
  *(void *)&v35[0] = sub_100010A10(v6);
  *((void *)&v35[0] + 1) = v7;
  __chkstk_darwin(*(void *)&v35[0]);
  sub_10000FCC8((void *(*)(long long *__return_ptr, char *, char *))sub_100010D24, (uint64_t)&v30);
  unint64_t v8 = *((void *)&v30 + 1);
  uint64_t v10 = v31;
  uint64_t v9 = v32;
  unint64_t v11 = v33;
  uint64_t v12 = *((void *)&v35[0] + 1) >> 62;
  switch(*((void *)&v35[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v13) = DWORD1(v35[0]) - LODWORD(v35[0]);
      if (__OFSUB__(DWORD1(v35[0]), v35[0])) {
        goto LABEL_44;
      }
      uint64_t v13 = (int)v13;
LABEL_10:
      if (v34 == v13)
      {
LABEL_16:
        uint64_t v18 = *((void *)&v30 + 1) >> 14;
        *(void *)((char *)&v30 + 7) = 0;
        *(void *)&long long v30 = 0;
        if (v8 >> 14 == v33 >> 14) {
          goto LABEL_37;
        }
        unint64_t v24 = v4;
        LOBYTE(v4) = 0;
        uint64_t v19 = (v31 >> 59) & 1;
        if ((v32 & 0x1000000000000000) == 0) {
          LOBYTE(v19) = 1;
        }
        uint64_t v20 = 4 << v19;
        unint64_t v21 = HIBYTE(v32) & 0xF;
        if ((v32 & 0x2000000000000000) == 0) {
          unint64_t v21 = v31 & 0xFFFFFFFFFFFFLL;
        }
        unint64_t v25 = v21;
        while (1)
        {
          char v22 = Substring.UTF8View.subscript.getter();
          if ((v11 & 0xC) == v20)
          {
            unint64_t v11 = sub_10000D0B8(v11, v10, v9);
            if ((v9 & 0x1000000000000000) != 0)
            {
LABEL_27:
              if (v25 <= v11 >> 16) {
                goto LABEL_42;
              }
              unint64_t v11 = String.UTF8View._foreignIndex(after:)();
              goto LABEL_29;
            }
          }
          else if ((v9 & 0x1000000000000000) != 0)
          {
            goto LABEL_27;
          }
          unint64_t v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_29:
          *((unsigned char *)&v30 + v4) = v22;
          LOWORD(v4) = v4 + 1;
          if ((v4 & 0x100) != 0)
          {
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
          }
          if (v4 == 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            Data._Representation.append(contentsOf:)();
            LOBYTE(v4) = 0;
            if (v18 == v11 >> 14)
            {
              swift_bridgeObjectRelease();
              sub_100010D40(v5, v24);
              goto LABEL_38;
            }
          }
          else if (v18 == v11 >> 14)
          {
            *(void *)&long long v37 = v30;
            DWORD2(v37) = DWORD2(v30);
            WORD6(v37) = WORD6(v30);
            Data._Representation.append(contentsOf:)();
            sub_100010D40(v5, v24);
            goto LABEL_37;
          }
        }
      }
      if (v12)
      {
        if (v12 == 1) {
          uint64_t v17 = *(uint64_t *)&v35[0] >> 32;
        }
        else {
          uint64_t v17 = *(void *)(*(void *)&v35[0] + 24);
        }
      }
      else
      {
        uint64_t v17 = BYTE14(v35[0]);
      }
LABEL_35:
      if (v17 < v34) {
        goto LABEL_43;
      }
      Data._Representation.replaceSubrange(_:with:count:)();
LABEL_37:
      swift_bridgeObjectRelease();
LABEL_38:
      swift_bridgeObjectRelease();
      return *(void *)&v35[0];
    case 2:
      uint64_t v15 = *(void *)(*(void *)&v35[0] + 16);
      uint64_t v14 = *(void *)(*(void *)&v35[0] + 24);
      BOOL v16 = __OFSUB__(v14, v15);
      uint64_t v13 = v14 - v15;
      if (!v16) {
        goto LABEL_10;
      }
      goto LABEL_45;
    case 3:
      if (!v34) {
        goto LABEL_16;
      }
      uint64_t v17 = 0;
      goto LABEL_35;
    default:
      uint64_t v13 = BYTE14(v35[0]);
      goto LABEL_10;
  }
}

void sub_10000E0AC(char a1@<W0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v93 = a3;
  uint64_t v92 = type metadata accessor for Logger();
  uint64_t v87 = *(void *)(v92 - 8);
  uint64_t v5 = __chkstk_darwin(v92);
  v86 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v96 = (char *)&v82 - v7;
  uint64_t v8 = sub_100005B54(&qword_10001DE58);
  __chkstk_darwin(v8 - 8);
  v99 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v101 = *(void *)(v10 - 8);
  uint64_t v102 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  v97 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v103 = (char *)&v82 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v95 = (char *)&v82 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v82 - v17;
  uint64_t v19 = type metadata accessor for PanicLog();
  uint64_t v91 = *(void *)(v19 - 8);
  uint64_t v20 = (int *)__chkstk_darwin(v19);
  char v22 = (char *)&v82 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v21) = a1 & 1;
  os_log_type_t v23 = &v22[v20[6]];
  *(void *)os_log_type_t v23 = 0x63696E6150;
  *((void *)v23 + 1) = 0xE500000000000000;
  uint64_t v24 = (uint64_t)&v22[v20[9]];
  *(void *)(v24 + 24) = &type metadata for CriticalPolicy;
  *(void *)(v24 + 32) = &off_100018F18;
  unint64_t v25 = &v22[v20[10]];
  *(void *)unint64_t v25 = 0;
  *((void *)v25 + 1) = 0;
  *char v22 = v21;
  unint64_t v26 = sub_100006F88((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v27 = *(int *)(v19 + 32);
  *(void *)&v22[v27] = v26;
  uint64_t v28 = (char *)v19;
  uint64_t v100 = *(int *)(v19 + 28);
  *(void *)&v22[v100] = &_swiftEmptyArrayStorage;
  v94 = a2;
  NSString v29 = (uint64_t *)&a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess();
  uint64_t v30 = v29[1];
  uint64_t v90 = v27;
  v88 = v23;
  if (!v30)
  {
    if (qword_10001DC78 != -1) {
      swift_once();
    }
    sub_100005ABC(v92, (uint64_t)qword_10001EB28);
    unint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v36 = v93;
    long long v37 = v28;
    uint64_t v42 = v91;
    if (v41)
    {
      Swift::String v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Invalid log path", v43, 2u);
      swift_slowDealloc();
    }

    goto LABEL_41;
  }
  v84 = v25;
  uint64_t v85 = v24;
  v98 = v29;
  swift_bridgeObjectRetain();
  v89 = v18;
  URL.init(fileURLWithPath:)();
  swift_bridgeObjectRelease();
  unint64_t v31 = self;
  id v32 = [v31 defaultManager];
  if (!v98[1])
  {
    __break(1u);
    swift_errorRelease();

    __break(1u);
    goto LABEL_43;
  }
  unint64_t v33 = v32;
  swift_bridgeObjectRetain();
  NSString v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned int v35 = [v33 fileExistsAtPath:v34];

  uint64_t v36 = v93;
  long long v37 = v28;
  if (!v35)
  {
    Swift::String v44 = v99;
    sub_100006AB0((uint64_t)v99);
    uint64_t v38 = v101;
    uint64_t v45 = v102;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v44, 1, v102) != 1)
    {
      v58 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
      v59 = v95;
      v58(v95, v44, v45);
      v96 = v28;
      v58(&v22[*((int *)v28 + 5)], v59, v45);
      goto LABEL_17;
    }
    sub_100006D54((uint64_t)v44, &qword_10001DE58);
    if (qword_10001DC78 != -1) {
      swift_once();
    }
    uint64_t v46 = v92;
    uint64_t v47 = sub_100005ABC(v92, (uint64_t)qword_10001EB28);
    uint64_t v48 = v87;
    long long v49 = v96;
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v96, v47, v46);
    uint64_t v50 = v94;
    uint64_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v51, v52))
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v46);
      (*(void (**)(char *, uint64_t))(v101 + 8))(v89, v102);
      uint64_t v24 = v85;
      uint64_t v42 = v91;
      goto LABEL_41;
    }
    v99 = v50;
    v103 = v22;
    uint64_t v53 = v91;
    Swift::String v54 = (uint8_t *)swift_slowAlloc();
    v104[0] = swift_slowAlloc();
    *(_DWORD *)Swift::String v54 = 136446210;
    unint64_t v55 = v98[1];
    if (v55)
    {
      uint64_t v56 = *v98;
      swift_bridgeObjectRetain();
      v104[3] = sub_10000CBB0(v56, v55, v104);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v57 = v99;

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed reading from URL: %{public}s and retired path.", v54, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v87 + 8))(v96, v92);
      (*(void (**)(char *, uint64_t))(v101 + 8))(v89, v102);
      uint64_t v42 = v53;
      uint64_t v24 = v85;
LABEL_41:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100004F04(v24);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t, char *))(v42 + 56))(v36, 1, 1, v37);
      return;
    }
LABEL_43:

    __break(1u);
    return;
  }
  v96 = v28;
  uint64_t v38 = v101;
  (*(void (**)(char *, char *, uint64_t))(v101 + 16))(&v22[*((int *)v28 + 5)], v89, v102);
LABEL_17:
  uint64_t v60 = &v94[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  swift_beginAccess();
  uint64_t v61 = *(void *)(*(void *)v60 + 16);
  if (!v61) {
    goto LABEL_39;
  }
  v95 = (char *)(v38 + 16);
  v99 = (char *)(v38 + 32);
  uint64_t v83 = swift_bridgeObjectRetain();
  v62 = (uint64_t *)(v83 + 40);
  uint64_t v63 = &_swiftEmptyArrayStorage;
  do
  {
    v64 = v22;
    uint64_t v66 = *(v62 - 1);
    uint64_t v65 = *v62;
    swift_bridgeObjectRetain();
    id v67 = [v31 defaultManager];
    NSString v68 = String._bridgeToObjectiveC()();
    unsigned __int8 v69 = [v67 fileExistsAtPath:v68];

    if (v69)
    {
      URL.init(fileURLWithPath:)();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v63 = (void *)sub_10000F8D4(0, v63[2] + 1, 1, (unint64_t)v63);
      }
      char v22 = v64;
      unint64_t v71 = v63[2];
      unint64_t v70 = v63[3];
      uint64_t v72 = v102;
      if (v71 >= v70 >> 1) {
        uint64_t v63 = (void *)sub_10000F8D4(v70 > 1, v71 + 1, 1, (unint64_t)v63);
      }
      v63[2] = v71 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v101 + 32))((unint64_t)v63+ ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))+ *(void *)(v101 + 72) * v71, v103, v72);
      goto LABEL_20;
    }
    uint64_t v73 = v98[1];
    if (v73)
    {
      char v22 = v64;
      if (v66 == *v98 && v73 == v65)
      {
        swift_bridgeObjectRelease();
        uint64_t v74 = v102;
LABEL_33:
        (*(void (**)(char *, char *, uint64_t))v95)(v97, &v22[*((int *)v96 + 5)], v74);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v63 = (void *)sub_10000F8D4(0, v63[2] + 1, 1, (unint64_t)v63);
        }
        unint64_t v77 = v63[2];
        unint64_t v76 = v63[3];
        if (v77 >= v76 >> 1) {
          uint64_t v63 = (void *)sub_10000F8D4(v76 > 1, v77 + 1, 1, (unint64_t)v63);
        }
        v63[2] = v77 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v101 + 32))((unint64_t)v63+ ((*(unsigned __int8 *)(v101 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))+ *(void *)(v101 + 72) * v77, v97, v74);
LABEL_20:
        *(void *)&v22[v100] = v63;
        goto LABEL_21;
      }
      char v75 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t v74 = v102;
      if (v75) {
        goto LABEL_33;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      char v22 = v64;
    }
LABEL_21:
    v62 += 2;
    --v61;
  }
  while (v61);
  swift_bridgeObjectRelease();
  uint64_t v38 = v101;
LABEL_39:
  v78 = v96;
  id v79 = sub_10000D9F8((uint64_t)&v22[*((int *)v96 + 5)], sub_100010D08);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v89, v102);
  uint64_t v80 = v90;
  swift_bridgeObjectRelease();
  *(void *)&v22[v80] = v79;
  uint64_t v81 = v93;
  sub_10000FB3C((uint64_t)v22, v93);
  (*(void (**)(uint64_t, void, uint64_t, char *))(v91 + 56))(v81, 0, 1, v78);
  sub_10000FBA0((uint64_t)v22);
}

BOOL sub_10000EFDC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_10000EFF4()
{
  sub_100005B54(&qword_10001DE38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014C40;
  *(void *)(inited + 32) = 0x746E656469636E69;
  *(void *)(inited + 40) = 0xEB0000000064695FLL;
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for PanicLog() + 32));
  if (*(void *)(v2 + 16)
    && (unint64_t v3 = sub_100007BD4(0x746E656469636E69, 0xEB0000000064695FLL), (v4 & 1) != 0)
    && (sub_100007FA8(*(void *)(v2 + 56) + 32 * v3, (uint64_t)v8), sub_10000A688(), swift_dynamicCast()))
  {
    uint64_t v5 = v7;
  }
  else
  {
    sub_10000A688();
    uint64_t v5 = NSString.init(stringLiteral:)();
  }
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = 1701869940;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(void *)(inited + 72) = String._bridgeToObjectiveC()();
  return sub_1000070C0(inited);
}

uint64_t sub_10000F13C()
{
  if (*v0) {
    return 0x79616C70736944;
  }
  else {
    return 1953722184;
  }
}

uint64_t type metadata accessor for PanicLog()
{
  uint64_t result = qword_10001E168;
  if (!qword_10001E168) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F1C4(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_10000F668(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = String.subscript.getter();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = String.index(after:)();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = String.index(after:)();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = String.subscript.getter();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_10000F7C4(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v27 = *((void *)v13 + 2);
  unint64_t v26 = *((void *)v13 + 3);
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_10000F7C4((char *)(v26 > 1), v27 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v27 + 1;
  uint64_t v28 = &v13[32 * v27];
  *((void *)v28 + 4) = v45;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = String.index(after:)();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (*((void *)v13 + 2) != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = String.subscript.getter();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_10000F7C4(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v39 = *((void *)v13 + 2);
    unint64_t v38 = *((void *)v13 + 3);
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_10000F7C4((char *)(v38 > 1), v39 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v39 + 1;
    os_log_type_t v40 = &v13[32 * v39];
    *((void *)v40 + 4) = v31;
    *((void *)v40 + 5) = v33;
    *((void *)v40 + 6) = v35;
    *((void *)v40 + 7) = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_42:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000F668(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = String.subscript.getter();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(char **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_10000F7C4(0, *((void *)v14 + 2) + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = *((void *)v14 + 2);
    unint64_t v16 = *((void *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_10000F7C4((char *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    *((void *)v14 + 2) = v17 + 1;
    char v18 = &v14[32 * v17];
    *((void *)v18 + 4) = v7;
    *((void *)v18 + 5) = v9;
    *((void *)v18 + 6) = v11;
    *((void *)v18 + 7) = v13;
    return v5 ^ 1u;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10000F7C4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005B54(&qword_10001E108);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100010858(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F8D4(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_100005B54(&qword_10001DE98);
  uint64_t v10 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  void v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for URL() - 8);
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
    sub_100010BB0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10000FB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PanicLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000FBA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PanicLog();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FBFC@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (!__src) {
    goto LABEL_7;
  }
  if (!a2)
  {
    __src = 0;
LABEL_7:
    unint64_t v6 = 0xC000000000000000;
    goto LABEL_10;
  }
  if (a2 <= 14)
  {
    __src = sub_10001094C((unsigned char *)__src, (unsigned char *)(__src + a2));
    unint64_t v6 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    type metadata accessor for __DataStorage();
    swift_allocObject();
    uint64_t v5 = __DataStorage.init(bytes:length:)();
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      type metadata accessor for Data.RangeReference();
      __src = swift_allocObject();
      *(void *)(__src + 16) = 0;
      *(void *)(__src + 24) = a2;
      unint64_t v6 = v5 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      unint64_t v6 = v5 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v6;
  return __src;
}

char *sub_10000FCC8@<X0>(void *(*a1)(long long *__return_ptr, char *, char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  unint64_t v5 = v2[1];
  switch(v5 >> 62)
  {
    case 1uLL:
      uint64_t v20 = a2;
      uint64_t v10 = v5 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v2 = xmmword_100014C50;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = v6 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_15;
      }
      if (v12 < (int)v6) {
        goto LABEL_20;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v6, __DataStorage._offset.getter())) {
        goto LABEL_21;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v19 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v10 = v19;
      uint64_t v12 = v6 >> 32;
LABEL_15:
      if (v12 < (int)v6)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
      uint64_t result = sub_1000100F4((int)v6, v12, a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      *uint64_t v2 = v6;
      v2[1] = v10 | 0x4000000000000000;
      a2 = v20;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 2uLL:
      *(void *)&long long v25 = *v2;
      *((void *)&v25 + 1) = v5 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      long long v13 = v25;
      uint64_t result = sub_1000100F4(*(void *)(v25 + 16), *(void *)(v25 + 24), a1, (uint64_t)&v21);
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      *uint64_t v2 = v13;
      v2[1] = *((void *)&v13 + 1) | 0x8000000000000000;
      if (!v3) {
        goto LABEL_17;
      }
      return result;
    case 3uLL:
      *(void *)((char *)&v25 + 7) = 0;
      *(void *)&long long v25 = 0;
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25);
      if (v3) {
        return result;
      }
      long long v14 = v21;
      uint64_t v15 = v22;
      uint64_t v16 = v23;
      long long v17 = v24;
      goto LABEL_17;
    default:
      *(void *)&long long v25 = *v2;
      WORD4(v25) = v5;
      BYTE10(v25) = BYTE2(v5);
      BYTE11(v25) = BYTE3(v5);
      BYTE12(v25) = BYTE4(v5);
      BYTE13(v25) = BYTE5(v5);
      BYTE14(v25) = BYTE6(v5);
      uint64_t result = (char *)a1(&v21, (char *)&v25, (char *)&v25 + BYTE6(v5));
      if (v3)
      {
        unint64_t v9 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        *uint64_t v2 = v25;
        v2[1] = v9;
      }
      else
      {
        long long v14 = v21;
        uint64_t v15 = v22;
        uint64_t v16 = v23;
        long long v17 = v24;
        unint64_t v18 = DWORD2(v25) | ((unint64_t)BYTE12(v25) << 32) | ((unint64_t)BYTE13(v25) << 40) | ((unint64_t)BYTE14(v25) << 48);
        *uint64_t v2 = v25;
        v2[1] = v18;
LABEL_17:
        *(_OWORD *)a2 = v14;
        *(void *)(a2 + 16) = v15;
        *(void *)(a2 + 24) = v16;
        *(_OWORD *)(a2 + 32) = v17;
      }
      return result;
  }
}

unsigned char *sub_10000FFF8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_10001094C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_100010AB0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_100010B2C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

double sub_100010070@<D0>(void (*a1)(long long *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4) {
      return result;
    }
LABEL_5:
    uint64_t v7 = v11;
    uint64_t v8 = v12;
    double result = *(double *)&v10;
    long long v9 = v13;
    *(_OWORD *)a4 = v10;
    *(void *)(a4 + 16) = v7;
    *(void *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4) {
    goto LABEL_5;
  }
  return result;
}

char *sub_1000100F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *(*a3)(long long *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  double result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  long long v10 = result;
  double result = (char *)__DataStorage._offset.getter();
  uint64_t v11 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v14 = __DataStorage._length.getter();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  double result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    uint64_t v16 = v20;
    uint64_t v17 = v21;
    long long v18 = v22;
    *(_OWORD *)a4 = v19;
    *(void *)(a4 + 16) = v16;
    *(void *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

uint64_t sub_1000101C0(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    double result = sub_10000D0B8(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    double result = sub_10000D0B8(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return String.UTF8View._foreignDistance(from:to:)();
}

unint64_t sub_1000102C0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  if (!a2)
  {
    uint64_t v13 = 0;
    unint64_t v15 = a4;
LABEL_34:
    *(void *)double result = a4;
    *(void *)(result + 8) = a5;
    *(void *)(result + 16) = a6;
    *(void *)(result + 24) = a7;
    *(void *)(result + 32) = v15;
    return v13;
  }
  if (!a3)
  {
    unint64_t v15 = a4;
    uint64_t v13 = 0;
    goto LABEL_34;
  }
  uint64_t v10 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v10) = 1;
  }
  uint64_t v11 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v11 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v27 = v11;
  if (a3 < 0) {
    goto LABEL_37;
  }
  unint64_t v23 = result;
  unint64_t v24 = a5;
  uint64_t v13 = 0;
  unint64_t v14 = a5 >> 14;
  unint64_t v15 = a4;
  uint64_t v16 = 4 << v10;
  unint64_t v17 = a4 >> 14;
  uint64_t v25 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v26 = a7 & 0xFFFFFFFFFFFFFFLL;
  unint64_t v22 = a4;
  unint64_t v28 = a4 >> 14;
  while (1)
  {
    unint64_t v18 = v15 >> 14;
    if (v15 >> 14 == v14) {
      goto LABEL_33;
    }
    unint64_t v19 = v15 & 0xC;
    unint64_t v20 = v15;
    if (v19 == v16) {
      break;
    }
    if (v18 < v17) {
      goto LABEL_35;
    }
LABEL_14:
    if (v18 >= v14) {
      goto LABEL_35;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      double result = String.UTF8View._foreignSubscript(position:)();
      unint64_t v17 = v28;
      char v21 = result;
      if (v19 != v16) {
        goto LABEL_22;
      }
    }
    else if ((a7 & 0x2000000000000000) != 0)
    {
      v29[0] = a6;
      v29[1] = v26;
      char v21 = *((unsigned char *)v29 + (v20 >> 16));
      if (v19 != v16) {
        goto LABEL_22;
      }
    }
    else
    {
      double result = v25;
      if ((a6 & 0x1000000000000000) == 0)
      {
        double result = _StringObject.sharedUTF8.getter();
        unint64_t v17 = v28;
      }
      char v21 = *(unsigned char *)(result + (v20 >> 16));
      if (v19 != v16)
      {
LABEL_22:
        if ((a7 & 0x1000000000000000) != 0) {
          goto LABEL_23;
        }
        goto LABEL_9;
      }
    }
    double result = sub_10000D0B8(v15, a6, a7);
    unint64_t v17 = v28;
    unint64_t v15 = result;
    if ((a7 & 0x1000000000000000) != 0)
    {
LABEL_23:
      if (v27 <= v15 >> 16) {
        goto LABEL_36;
      }
      double result = String.UTF8View._foreignIndex(after:)();
      unint64_t v17 = v28;
      unint64_t v15 = result;
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v15 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_10:
    *(unsigned char *)(a2 + v13++) = v21;
    if (a3 == v13)
    {
      uint64_t v13 = a3;
LABEL_33:
      double result = v23;
      a5 = v24;
      a4 = v22;
      goto LABEL_34;
    }
  }
  double result = sub_10000D0B8(v15, a6, a7);
  unint64_t v17 = v28;
  unint64_t v20 = result;
  unint64_t v18 = result >> 14;
  if (result >> 14 >= v28) {
    goto LABEL_14;
  }
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000104F0@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_100014C60;
  }
  else
  {
    unint64_t v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      uint64_t v10 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v10 = (void *)_StringObject.sharedUTF8.getter();
    }
    return sub_1000105AC((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_1000105AC@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, void *a6@<X8>)
{
  unint64_t v9 = a2;
  uint64_t v10 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  unint64_t v15 = a2;
  if (v14 == 4 << v12)
  {
    double result = sub_10000D0B8(a2, a4, a5);
    unint64_t v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v16 = v15 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v17 = HIBYTE(a5) & 0xF;
  }
  if (v17 < v15 >> 16) {
    goto LABEL_31;
  }
  double result = String.UTF8View._foreignDistance(from:to:)();
  int64_t v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    double result = sub_10000D0B8(v9, a4, a5);
    unint64_t v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    double result = sub_10000D0B8(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    double result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  unint64_t v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v18 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v18 < v9 >> 16) {
    goto LABEL_29;
  }
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  double result = String.UTF8View._foreignDistance(from:to:)();
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10) {
    uint64_t v20 = v10 + v16;
  }
  else {
    uint64_t v20 = 0;
  }
  return sub_10000FBFC(v20, v19, a6);
}

double sub_100010760@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *((void *)a3 + 2);
  uint64_t v6 = *((void *)a3 + 3);
  long long v15 = *a3;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_100010070((void (*)(long long *__return_ptr, uint64_t, uint64_t))sub_100010D54, a1, a2, (uint64_t)&v11);
  uint64_t v7 = v12;
  uint64_t v8 = v13;
  double result = *(double *)&v11;
  long long v10 = v14;
  *(_OWORD *)a4 = v11;
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_1000107E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = sub_1000102C0((unint64_t)v9, a1, a2, *a3, a3[1], a3[2], a3[3]);
  uint64_t v6 = v10;
  long long v7 = v9[1];
  *(_OWORD *)a4 = v9[0];
  *(_OWORD *)(a4 + 16) = v7;
  *(void *)(a4 + 32) = v6;
  *(void *)(a4 + 40) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100010858(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001094C(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_100010A10(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_100010AB0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_100010B2C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_100010BB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for URL() - 8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100010D08(void *a1)
{
  return sub_100010DBC(a1) & 1;
}

double sub_100010D24@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100010760(a1, a2, *(long long **)(v3 + 16), a3);
}

uint64_t sub_100010D40(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100007E90(a1, a2);
  }
  return a1;
}

uint64_t sub_100010D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1000107E8(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

uint64_t sub_100010D74()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010DAC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010DBC(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
  }
}

uint64_t sub_100010E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010E28);
}

uint64_t sub_100010E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_100010EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010F04);
}

uint64_t sub_100010F04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for URL();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100010FC8()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PanicLog.Type(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PanicLog.Type(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000111E8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100011210(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PanicLog.Type()
{
  return &type metadata for PanicLog.Type;
}

unint64_t sub_100011230()
{
  unint64_t result = qword_10001E1B8;
  if (!qword_10001E1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E1B8);
  }
  return result;
}

id DiagnosticsReporterLaunchOptions.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t DiagnosticsReporterLaunchOptions.files_to_attach.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DiagnosticsReporterLaunchOptions.files_to_attach.setter(uint64_t a1)
{
  int v3 = (void *)(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *int v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*DiagnosticsReporterLaunchOptions.files_to_attach.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t DiagnosticsReporterLaunchOptions.log_path.getter()
{
  return sub_1000115C4(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t DiagnosticsReporterLaunchOptions.log_path.setter(uint64_t a1, uint64_t a2)
{
  return sub_1000116AC(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t (*DiagnosticsReporterLaunchOptions.log_path.modify())()
{
  return j_j__swift_endAccess;
}

id sub_100011530(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

uint64_t DiagnosticsReporterLaunchOptions.panic_string.getter()
{
  return sub_1000115C4(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_1000115C4(void *a1)
{
  int v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_100011624(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *uint64_t v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t DiagnosticsReporterLaunchOptions.panic_string.setter(uint64_t a1, uint64_t a2)
{
  return sub_1000116AC(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_1000116AC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*DiagnosticsReporterLaunchOptions.panic_string.modify())()
{
  return j__swift_endAccess;
}

id DiagnosticsReporterLaunchOptions.init()()
{
  *(void *)&v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = &_swiftEmptyArrayStorage;
  uint64_t v1 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  int v2 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  uint64_t v3 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *(void *)int v2 = 0;
  *((void *)v2 + 1) = 0;
  v5.receiver = v0;
  v5.super_class = v3;
  return [super init];
}

uint64_t type metadata accessor for DiagnosticsReporterLaunchOptions()
{
  return self;
}

uint64_t sub_100011870(char a1)
{
  return qword_100014F28[a1];
}

uint64_t sub_100011890()
{
  return sub_100011870(*v0);
}

uint64_t sub_100011898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001245C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000118C0()
{
  return 0;
}

void sub_1000118CC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000118D8(uint64_t a1)
{
  unint64_t v2 = sub_100011C84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100011914(uint64_t a1)
{
  unint64_t v2 = sub_100011C84();

  return CodingKey.debugDescription.getter(a1, v2);
}

id DiagnosticsReporterLaunchOptions.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporterLaunchOptions();
  [super dealloc];
}

uint64_t DiagnosticsReporterLaunchOptions.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005B54(&qword_10001E1D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004EC0(a1, a1[3]);
  sub_100011C84();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v9 = (uint64_t *)(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  uint64_t v13 = *v9;
  char v12 = 0;
  sub_100005B54(&qword_10001E1E8);
  sub_1000120E4(&qword_10001E1F0);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (v2) {
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_beginAccess();
  char v12 = 1;
  swift_bridgeObjectRetain();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v11[7] = 2;
  swift_bridgeObjectRetain();
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_bridgeObjectRelease();
}

unint64_t sub_100011C84()
{
  unint64_t result = qword_10001E1E0;
  if (!qword_10001E1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E1E0);
  }
  return result;
}

uint64_t sub_100011CD8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id DiagnosticsReporterLaunchOptions.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DiagnosticsReporterLaunchOptions.init(from:)(a1);
}

id DiagnosticsReporterLaunchOptions.init(from:)(void *a1)
{
  uint64_t v4 = sub_100005B54(&qword_10001E1F8);
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  uint64_t v30 = a1;
  *(void *)&v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = &_swiftEmptyArrayStorage;
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v36 = (uint64_t *)v8;
  id v9 = (id)a1[3];
  sub_100004EC0(a1, (uint64_t)v9);
  sub_100011C84();
  uint64_t v31 = v1;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    uint64_t v13 = v31;
    sub_100004F04((uint64_t)v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for DiagnosticsReporterLaunchOptions();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v27;
    sub_100005B54(&qword_10001E1E8);
    char v35 = 0;
    sub_1000120E4(&qword_10001E200);
    uint64_t v11 = v28;
    char v12 = v6;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v15 = v34;
    uint64_t v16 = v29;
    swift_beginAccess();
    *(void *)uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    LOBYTE(v34) = 1;
    uint64_t v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v19 = v18;
    swift_beginAccess();
    *uint64_t v7 = v17;
    v7[1] = v19;
    swift_bridgeObjectRelease();
    char v33 = 2;
    uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    char v21 = v36;
    uint64_t v22 = v20;
    uint64_t v24 = v23;
    swift_beginAccess();
    *char v21 = v22;
    v21[1] = v24;
    uint64_t v25 = v31;

    swift_bridgeObjectRelease();
    uint64_t v26 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
    v32.receiver = v25;
    v32.super_class = v26;
    [super init];
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v11);
    sub_100004F04((uint64_t)v30);
  }
  return v9;
}

uint64_t sub_1000120E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100011CD8(&qword_10001E1E8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100012148@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for DiagnosticsReporterLaunchOptions());
  id result = DiagnosticsReporterLaunchOptions.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10001219C(void *a1)
{
  return DiagnosticsReporterLaunchOptions.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *id result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001231CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticsReporterLaunchOptions.CodingKeys()
{
  return &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys;
}

unint64_t sub_100012358()
{
  unint64_t result = qword_10001E230;
  if (!qword_10001E230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E230);
  }
  return result;
}

unint64_t sub_1000123B0()
{
  unint64_t result = qword_10001E238;
  if (!qword_10001E238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E238);
  }
  return result;
}

unint64_t sub_100012408()
{
  unint64_t result = qword_10001E240;
  if (!qword_10001E240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E240);
  }
  return result;
}

uint64_t sub_10001245C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F745F73656C6966 && a2 == 0xEF6863617474615FLL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x687461705F676F6CLL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74735F63696E6170 && a2 == 0xEC000000676E6972)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

ValueMetadata *type metadata accessor for CriticalPolicy()
{
  return &type metadata for CriticalPolicy;
}

uint64_t sub_1000125E0()
{
  sub_100004F04(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for DetailsController()
{
  return self;
}

uint64_t sub_10001263C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t __DataStorage.init(capacity:)()
{
  return __DataStorage.init(capacity:)();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.resolvingSymlinksInPath()()
{
  return URL.resolvingSymlinksInPath()();
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> URL.checkResourceIsReachable()()
{
  return URL.checkResourceIsReachable()();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t URL.withUnsafeFileSystemRepresentation<A>(_:)()
{
  return URL.withUnsafeFileSystemRepresentation<A>(_:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
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

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t FBKDraftError.description.getter()
{
  return FBKDraftError.description.getter();
}

uint64_t FBKFeedbackForm.init(identifier:)()
{
  return FBKFeedbackForm.init(identifier:)();
}

uint64_t dispatch thunk of FBKFeedbackForm.attachments.setter()
{
  return dispatch thunk of FBKFeedbackForm.attachments.setter();
}

uint64_t dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.setter()
{
  return dispatch thunk of FBKFeedbackForm.localizedAttachmentLegalText.setter();
}

uint64_t dispatch thunk of FBKFeedbackForm.prefill(question:answer:)()
{
  return dispatch thunk of FBKFeedbackForm.prefill(question:answer:)();
}

uint64_t type metadata accessor for FBKFeedbackForm.Question()
{
  return type metadata accessor for FBKFeedbackForm.Question();
}

uint64_t type metadata accessor for FBKFeedbackForm()
{
  return type metadata accessor for FBKFeedbackForm();
}

uint64_t FBKAttachmentError.description.getter()
{
  return FBKAttachmentError.description.getter();
}

uint64_t type metadata accessor for FBKSubmissionError()
{
  return type metadata accessor for FBKSubmissionError();
}

uint64_t FBKFeedbackDraftViewController.init(feedbackForm:)()
{
  return FBKFeedbackDraftViewController.init(feedbackForm:)();
}

uint64_t dispatch thunk of FBKFeedbackDraftViewController.delegate.setter()
{
  return dispatch thunk of FBKFeedbackDraftViewController.delegate.setter();
}

uint64_t type metadata accessor for FBKFeedbackDraftViewController()
{
  return type metadata accessor for FBKFeedbackDraftViewController();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t String.init(contentsOf:)()
{
  return String.init(contentsOf:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return String.LocalizationValue.init(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(localized:defaultValue:table:bundle:locale:comment:)()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.init(validatingUTF8:)()
{
  return String.init(validatingUTF8:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return Substring.UTF8View.subscript.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
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
  return [super a2];
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectUnownedAssign()
{
  return _swift_unknownObjectUnownedAssign();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}