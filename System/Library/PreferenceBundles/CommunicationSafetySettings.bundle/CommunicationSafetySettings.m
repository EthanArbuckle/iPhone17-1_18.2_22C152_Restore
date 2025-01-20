Swift::Void __swiftcall CommunicationSafetySettings.viewDidLoad()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  void *v16;
  void *v17;
  NSString v18;
  NSString v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;

  v1 = v0;
  v2 = sub_3BE0();
  v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_373C(&qword_8118) - 8;
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v30 - v10;
  v30.receiver = v0;
  v30.super_class = (Class)CommunicationSafetySettings;
  objc_msgSendSuper2(&v30, "viewDidLoad");
  sub_3BD0();
  sub_3BC0();
  v12 = sub_3BB0();
  sub_3780();
  v13 = sub_3BF0();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v11, v5, v2);
  v14 = (uint64_t *)&v11[*(int *)(v6 + 44)];
  *v14 = v13;
  v14[1] = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_37D8((uint64_t)v11, (uint64_t)v9);
  v15 = objc_allocWithZone((Class)sub_373C(&qword_8128));
  v16 = (void *)sub_3C00();
  sub_3B74(0, &qword_8130);
  v17 = (void *)sub_3C30();
  v18 = sub_3C10();
  v19 = [v17 localizedStringForKey:v18 value:0 table:0];

  if (!v19)
  {
    sub_3C20();
    v19 = sub_3C10();
    swift_bridgeObjectRelease();
  }
  [v1 setTitle:v19];

  v20 = [v16 view];
  if (v20)
  {
    v21 = v20;
    v22 = [v1 view];
    if (v22)
    {
      v23 = v22;
      [v22 addSubview:v21];

      v24 = [v1 view];
      if (v24)
      {
        v25 = v24;
        [v24 bounds];
        v27 = v26;
        v29 = v28;

        objc_msgSend(v21, "setFrame:", 0.0, 0.0, v27, v29);
        [v21 setAutoresizingMask:18];
        [v1 addChildViewController:v16];
        [v16 didMoveToParentViewController:v1];

        sub_3840((uint64_t)v11);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    sub_3840((uint64_t)v11);
  }
}

uint64_t sub_373C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_3780()
{
  unint64_t result = qword_8120;
  if (!qword_8120)
  {
    sub_3BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8120);
  }
  return result;
}

uint64_t sub_37D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_373C(&qword_8118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3840(uint64_t a1)
{
  uint64_t v2 = sub_373C(&qword_8118);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void __swiftcall CommunicationSafetySettings.init(nibName:bundle:)(CommunicationSafetySettings *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    NSString v4 = sub_3C10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:v4 bundle:isa];
}

id CommunicationSafetySettings.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_3C10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)CommunicationSafetySettings;
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void __swiftcall CommunicationSafetySettings.init(coder:)(CommunicationSafetySettings_optional *__return_ptr retstr, NSCoder coder)
{
}

id CommunicationSafetySettings.init(coder:)(void *a1)
{
  v4.super_class = (Class)CommunicationSafetySettings;
  id v2 = objc_msgSendSuper2(&v4, "initWithCoder:", a1);

  return v2;
}

uint64_t type metadata accessor for CommunicationSafetySettings(uint64_t a1)
{
  return sub_3B74(a1, &qword_8160);
}

uint64_t sub_3B74(uint64_t a1, unint64_t *a2)
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

uint64_t sub_3BB0()
{
  return static NudityDetectionRootModel.shared.getter();
}

uint64_t sub_3BC0()
{
  return type metadata accessor for NudityDetectionRootModel();
}

uint64_t sub_3BD0()
{
  return NudityDetectionAppsRootView.init()();
}

uint64_t sub_3BE0()
{
  return type metadata accessor for NudityDetectionAppsRootView();
}

uint64_t sub_3BF0()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_3C00()
{
  return UIHostingController.init(rootView:)();
}

NSString sub_3C10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_3C20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3C30()
{
  return static NSBundle.communicationSafetySettingsUI.getter();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}