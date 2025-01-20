uint64_t sub_21F0()
{
  uint64_t v0;

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindLegalAndRegulatorySettingsClass()
{
  return self;
}

id sub_2224()
{
  type metadata accessor for FindLegalAndRegulatorySettingsClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_8358 = (uint64_t)result;
  return result;
}

uint64_t sub_227C()
{
  uint64_t v1 = OBJC_IVAR____TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot____lazy_storage___legalAndRegulatorySettingsListState;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot____lazy_storage___legalAndRegulatorySettingsListState))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot____lazy_storage___legalAndRegulatorySettingsListState);
  }
  else
  {
    sub_35A8();
    uint64_t v2 = sub_3598();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

void sub_22EC()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_3578();
  __chkstk_darwin();
  v18.receiver = v1;
  v18.super_class = ObjectType;
  objc_msgSendSuper2(&v18, "viewDidLoad");
  sub_227C();
  sub_3568();
  id v3 = objc_allocWithZone((Class)sub_2AFC(&qword_8350));
  v4 = (void *)sub_35B8();
  if (qword_8238 != -1) {
    swift_once();
  }
  v5 = (void *)qword_8358;
  NSString v6 = sub_35D8();
  NSString v7 = [v5 localizedStringForKey:v6 value:0 table:0];

  if (!v7)
  {
    sub_35E8();
    NSString v7 = sub_35D8();
    swift_bridgeObjectRelease();
  }
  [v1 setTitle:v7];

  id v8 = [v4 view];
  if (!v8)
  {
    v9 = v4;
    goto LABEL_10;
  }
  v9 = v8;
  id v10 = [v1 view];
  if (v10)
  {
    v11 = v10;
    [v10 addSubview:v9];

    id v12 = [v1 view];
    if (v12)
    {
      v13 = v12;
      [v12 bounds];
      double v15 = v14;
      double v17 = v16;

      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v15, v17);
      [v9 setAutoresizingMask:18];
      [v1 addChildViewController:v4];
      [v4 didMoveToParentViewController:v1];

LABEL_10:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_3618();
  v3[6] = sub_3608();
  uint64_t v5 = sub_35F8();
  return _swift_task_switch(sub_27D8, v5, v4);
}

uint64_t sub_27D8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 56) = _Block_copy(v2);
  if (v1) {
    uint64_t v3 = sub_35C8();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 64) = v3;
  id v4 = *(id *)(v0 + 32);
  *(void *)(v0 + 72) = sub_3608();
  uint64_t v6 = sub_35F8();
  return _swift_task_switch(sub_28B4, v6, v5);
}

uint64_t sub_28B4()
{
  uint64_t v1 = v0[8];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (void *)v0[8];
    uint64_t v3 = (void *)v0[4];
    sub_227C();
    v4._rawValue = v2;
    sub_3588(v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = (void *)v0[4];
  }

  uint64_t v5 = (void (**)(void))v0[7];
  if (v5)
  {
    v5[2](v0[7]);
    _Block_release(v5);
  }
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

id sub_2A90()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LegalAndRegulatorySettingsRoot()
{
  return self;
}

uint64_t sub_2AFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2B40()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2B88()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2C3C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_8310 + dword_8310);
  return v6(v2, v3, v4);
}

uint64_t sub_2C3C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2D30(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_3564;
  return v6();
}

uint64_t sub_2E00()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_3564;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_8320 + dword_8320);
  return v6(v2, v3, v4);
}

uint64_t sub_2EC0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_3564;
  return v7();
}

uint64_t sub_2F90()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_2FD0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_3564;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_8330 + dword_8330);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_309C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3638();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_3628();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_3240(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_35F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_3240(uint64_t a1)
{
  uint64_t v2 = sub_2AFC(&qword_8308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_32A0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_337C;
  return v6(a1);
}

uint64_t sub_337C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_3474()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_34AC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2C3C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_8340 + dword_8340);
  return v6(a1, v4);
}

uint64_t sub_3568()
{
  return LegalAndRegulatorySettingsList.init(legalAndRegulatorySettingsListState:)();
}

uint64_t sub_3578()
{
  return type metadata accessor for LegalAndRegulatorySettingsList();
}

void sub_3588(Swift::OpaquePointer a1)
{
}

uint64_t sub_3598()
{
  return LegalAndRegulatorySettingsListState.__allocating_init()();
}

uint64_t sub_35A8()
{
  return type metadata accessor for LegalAndRegulatorySettingsListState();
}

uint64_t sub_35B8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_35C8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_35D8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_35E8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_35F8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_3608()
{
  return static MainActor.shared.getter();
}

uint64_t sub_3618()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_3628()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_3638()
{
  return type metadata accessor for TaskPriority();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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