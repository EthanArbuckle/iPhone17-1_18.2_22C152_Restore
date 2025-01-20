uint64_t sub_5408()
{
  uint64_t v0;
  void *v1;
  uint64_t (__cdecl *v3)();
  uint64_t v4;

  v3 = (uint64_t (__cdecl *)())((char *)&dword_10538 + dword_10538);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_54A8;
  return v3();
}

uint64_t sub_54A8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_5724(int a1, int a2, void *aBlock)
{
  *(void *)(v3 + 16) = _Block_copy(aBlock);
  uint64_t v6 = (uint64_t (__cdecl *)())((char *)&dword_10538 + dword_10538);
  v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  void *v4 = v3;
  v4[1] = sub_57D0;
  return v6();
}

uint64_t sub_57D0(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id sub_58FC(uint64_t a1, void *a2)
{
  return sub_6870(a2);
}

uint64_t sub_597C()
{
  return 0x6C7070612E6D6F63;
}

NSNumber sub_5A14()
{
  return sub_A6B0();
}

uint64_t sub_5A78()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v5._countAndFlagsBits = 0xE000000000000000;
  v6._countAndFlagsBits = 0x454D414E5F505041;
  v6._object = (void *)0xE800000000000000;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v2.super.isa = v1;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v3 = sub_A500(v6, v7, v2, v8, v5);

  return v3;
}

uint64_t sub_5B24()
{
  return sub_5D8C((uint64_t (*)(void))sub_791C);
}

uint64_t sub_5B54()
{
  return sub_5D8C((uint64_t (*)(void))sub_766C);
}

void sub_5B84(void (*a1)(id))
{
  uint64_t v3 = sub_A530();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  Swift::String v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MindTimelineEntryModel();
  Swift::String_optional v7 = sub_791C();
  sub_A520();
  id v8 = [v1 family];
  v9 = (void *)(*(uint64_t (**)(id))&stru_68.segname[(swift_isaMask & *v7) + 8])(v8);
  Class isa = sub_A510().super.isa;
  id v11 = [self entryWithDate:isa complicationTemplate:v9];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  a1(v11);
}

uint64_t sub_5D8C(uint64_t (*a1)(void))
{
  uint64_t v3 = v1;
  type metadata accessor for MindTimelineEntryModel();
  uint64_t v4 = (void *)a1();
  id v5 = [v3 family];
  uint64_t v6 = (*(uint64_t (**)(id))&stru_68.segname[(swift_isaMask & *v4) + 8])(v5);

  return v6;
}

id sub_5E38(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  type metadata accessor for MindTimelineEntryModel();
  id v5 = a1;
  uint64_t v6 = (void *)a3();
  id v7 = [v5 family];
  id v8 = (void *)(*(uint64_t (**)(id))&stru_68.segname[(swift_isaMask & *v6) + 8])(v7);

  return v8;
}

id sub_5EEC(void *a1, uint64_t a2, void *a3)
{
  id v6 = [objc_allocWithZone(v3) initWithComplication:a1 family:a2 forDevice:a3];

  return v6;
}

id sub_5F4C(void *a1, uint64_t a2, void *a3)
{
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for MindComplicationDataSource();
  id v7 = objc_msgSendSuper2(&v9, "initWithComplication:family:forDevice:", a1, a2, a3);

  return v7;
}

id sub_6018()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_604C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindComplicationDataSource();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_60C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindComplicationDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *sub_60F8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_6108(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_6114(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_7394;
  return v6();
}

uint64_t sub_61E0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_7394;
  return v7();
}

uint64_t sub_62AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A680();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_A670();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_71E8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_A660();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_6450(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_652C;
  return v6(a1);
}

uint64_t sub_652C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_6624()
{
  uint64_t v1 = sub_A590();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return _swift_task_switch(sub_66E0, 0, 0);
}

uint64_t sub_66E0()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = Log.default.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5._countAndFlagsBits = 0xD000000000000021;
  v6._countAndFlagsBits = 0xD00000000000006FLL;
  v6._object = (void *)0x800000000000B170;
  v5._object = (void *)0x800000000000B240;
  Logger.trace(file:function:)(v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v7 = objc_allocWithZone((Class)CLKWidgetComplicationDescriptor);
  NSString v8 = sub_A5C0();
  NSString v9 = sub_A5C0();
  NSString v10 = sub_A5C0();
  id v11 = [v7 initWithExtensionBundleIdentifier:v8 containerBundleIdentifier:v9 kind:v10 intent:0];

  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(id))v0[1];
  return v12(v11);
}

id sub_6870(void *a1)
{
  sub_6DD4(&qword_105B0);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A590();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = Log.default.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9._countAndFlagsBits = 0xD00000000000006FLL;
  v9._object = (void *)0x800000000000B170;
  v10._object = (void *)0x800000000000B1E0;
  v10._countAndFlagsBits = 0xD000000000000020;
  Logger.trace(file:function:)(v9, v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_A540();
  uint64_t v11 = sub_A560();
  uint64_t v12 = *(void *)(v11 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1, v11) != 1)
  {
    Class isa = sub_A550().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v11);
  }
  id v14 = [a1 supportsCapability:isa];

  return v14;
}

uint64_t sub_6AA0(unint64_t a1, void *a2)
{
  sub_6DD4(&qword_105B0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A540();
  uint64_t v6 = sub_A560();
  uint64_t v7 = *(void *)(v6 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    Class isa = sub_A550().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  unsigned int v9 = [a2 supportsCapability:isa];

  if (!v9) {
    return 0;
  }
  if (CLKComplicationFamilyCircularMedium == a1) {
    return 1;
  }
  if (a1 <= 0xC) {
    return (0x1795u >> a1) & 1;
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for MindComplicationDataSource()
{
  return self;
}

void sub_6C40(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_A530();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MindTimelineEntryModel();
  uint64_t v8 = sub_791C();
  sub_A520();
  id v9 = [a1 family];
  Swift::String v10 = (void *)(*(uint64_t (**)(id))&stru_68.segname[(swift_isaMask & *v8) + 8])(v9);
  Class isa = sub_A510().super.isa;
  id v12 = [self entryWithDate:isa complicationTemplate:v10];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v12);
}

uint64_t sub_6DD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6E18()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_6E60()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_6F20;
  uint64_t v6 = (uint64_t (*)(int, int, void *))((char *)&dword_10570 + dword_10570);
  return v6(v2, v3, v4);
}

uint64_t sub_6F20()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_7018()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_7394;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10580 + dword_10580);
  return v6(v2, v3, v4);
}

uint64_t sub_70DC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_711C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_7394;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10590 + dword_10590);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_71E8(uint64_t a1)
{
  uint64_t v2 = sub_6DD4(&qword_10568);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_7248()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_7280(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_6F20;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_105A0 + dword_105A0);
  return v6(a1, v4);
}

void type metadata accessor for CLKComplicationFamily()
{
  if (!qword_105B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_105B8);
    }
  }
}

uint64_t sub_7398@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_entryDate;
  uint64_t v4 = sub_A530();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_740C()
{
  return *(void *)(v0 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes);
}

uint64_t sub_741C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_loading);
}

uint64_t sub_742C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked);
}

uint64_t sub_743C()
{
  return 0;
}

BOOL sub_7444(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

void sub_7454(void *a1)
{
  uint64_t v2 = sub_A530();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [a1 _deepBreathingDuration];
  id v7 = [self minuteUnit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v9 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v9 < 1.84467441e19)
  {
    unsigned __int8 v10 = [a1 _isDataLoading];
    sub_A520();
    uint64_t v11 = (objc_class *)type metadata accessor for MindTimelineEntryModel();
    id v12 = objc_allocWithZone(v11);
    (*(void (**)(unsigned char *, char *, uint64_t))(v3 + 16))(&v12[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_entryDate], v5, v2);
    *(void *)&v12[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes] = (unint64_t)v9;
    v12[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_loading] = v10;
    v12[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked] = 0;
    v12[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_privacy] = 0;
    v13.receiver = v12;
    v13.super_class = v11;
    objc_msgSendSuper2(&v13, "init");
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }
LABEL_7:
  __break(1u);
}

id sub_766C()
{
  uint64_t v0 = sub_A530();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A520();
  uint64_t v4 = (objc_class *)type metadata accessor for MindTimelineEntryModel();
  uint64_t v5 = objc_allocWithZone(v4);
  (*(void (**)(unsigned char *, char *, uint64_t))(v1 + 16))(&v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_entryDate], v3, v0);
  *(void *)&v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_loading] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked] = 1;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_privacy] = 0;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, "init");
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

id sub_77C4()
{
  uint64_t v0 = sub_A530();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A520();
  uint64_t v4 = (objc_class *)type metadata accessor for MindTimelineEntryModel();
  uint64_t v5 = objc_allocWithZone(v4);
  (*(void (**)(unsigned char *, char *, uint64_t))(v1 + 16))(&v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_entryDate], v3, v0);
  *(void *)&v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes] = 2;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_loading] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_privacy] = 0;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, "init");
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

id sub_791C()
{
  uint64_t v0 = sub_A530();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A520();
  uint64_t v4 = (objc_class *)type metadata accessor for MindTimelineEntryModel();
  uint64_t v5 = objc_allocWithZone(v4);
  (*(void (**)(unsigned char *, char *, uint64_t))(v1 + 16))(&v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_entryDate], v3, v0);
  *(void *)&v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_loading] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked] = 0;
  v5[OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_privacy] = 0;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, "init");
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

id sub_7A70(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_7AB4()
{
}

void sub_7B6C(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      sub_94E8();
      Class isa = sub_A6A0(23.0).super.super.isa;
      uint64_t v2 = self;
      NSString v3 = sub_A5C0();
      id v4 = [v2 _symbolImageProviderWithSystemName:v3];

      [v4 setOverridePointSize:isa];
      uint64_t v5 = (objc_class *)CLKComplicationTemplateModularSmallSimpleImage;
      goto LABEL_17;
    case 2:
      sub_94E8();
      Class v11 = sub_A6A0(16.0).super.super.isa;
      id v12 = self;
      NSString v13 = sub_A5C0();
      id v4 = [v12 _symbolImageProviderWithSystemName:v13];

      [v4 setOverridePointSize:v11];
      uint64_t v5 = (objc_class *)CLKComplicationTemplateUtilitarianSmallSquare;
      goto LABEL_17;
    case 4:
      sub_94E8();
      Class v22 = sub_A6A0(23.0).super.super.isa;
      v23 = self;
      NSString v24 = sub_A5C0();
      id v9 = [v23 _symbolImageProviderWithSystemName:v24];

      [v9 setOverridePointSize:v22];
      unsigned __int8 v10 = (objc_class *)CLKComplicationTemplateCircularSmallSimpleImage;
      goto LABEL_13;
    case 7:
      sub_94E8();
      Class v28 = sub_A6A0(87.0).super.super.isa;
      v29 = self;
      NSString v30 = sub_A5C0();
      id v4 = [v29 _symbolImageProviderWithSystemName:v30];

      [v4 setOverridePointSize:v28];
      uint64_t v5 = (objc_class *)CLKComplicationTemplateExtraLargeSimpleImage;
LABEL_17:
      id v31 = [objc_allocWithZone(v5) initWithImageProvider:v4];
      uint64_t v32 = qword_10768;
      id v33 = v31;
      if (v32 != -1) {
        swift_once();
      }
      [v33 setTintColor:qword_10798];

      return;
    case 8:
      sub_8714();
      return;
    case 9:
      sub_83A4();
      return;
    case 10:
      sub_94E8();
      Class v14 = sub_A6A0(23.0).super.super.isa;
      v15 = self;
      NSString v16 = sub_A5C0();
      id v17 = [v15 _symbolImageProviderWithSystemName:v16];

      [v17 setOverridePointSize:v14];
      v18 = (objc_class *)CLKComplicationTemplateGraphicCircularImage;
      goto LABEL_11;
    case 12:
      sub_94E8();
      Class v19 = sub_A6A0(87.0).super.super.isa;
      v20 = self;
      NSString v21 = sub_A5C0();
      id v17 = [v20 _symbolImageProviderWithSystemName:v21];

      [v17 setOverridePointSize:v19];
      v18 = (objc_class *)CLKComplicationTemplateGraphicExtraLargeCircularImage;
LABEL_11:
      [objc_allocWithZone(v18) initWithImageProvider:v17];
      sub_824C(1);

      break;
    default:
      if (CLKComplicationFamilyCircularMedium != a1)
      {
        sub_A6F0(45);
        swift_bridgeObjectRelease();
        v35._countAndFlagsBits = sub_A770();
        sub_A620(v35);
        swift_bridgeObjectRelease();
        sub_A730();
        __break(1u);
        JUMPOUT(0x81CCLL);
      }
      sub_94E8();
      Class v6 = sub_A6A0(28.0).super.super.isa;
      id v7 = self;
      NSString v8 = sub_A5C0();
      id v9 = [v7 _symbolImageProviderWithSystemName:v8];

      [v9 setOverridePointSize:v6];
      unsigned __int8 v10 = (objc_class *)CLKComplicationTemplateCircularMediumSimpleImage;
LABEL_13:
      id v25 = [objc_allocWithZone(v10) initWithImageProvider:v9];
      uint64_t v26 = qword_10768;
      id v27 = v25;
      if (v26 != -1) {
        swift_once();
      }
      [v27 setTintColor:qword_10798];

      sub_824C(1);
      break;
  }
}

uint64_t *sub_8200()
{
  if (qword_10768 != -1) {
    swift_once();
  }
  return &qword_10798;
}

void sub_824C(char a1)
{
  uint64_t v3 = sub_A5E0();
  uint64_t v5 = v4;
  id v6 = [objc_allocWithZone((Class)NSNumber) initWithBool:a1 & 1];
  id v7 = [v1 metadata];
  sub_6DD4(&qword_10628);
  uint64_t v8 = sub_A5B0();

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = v8;
  sub_9378((uint64_t)v6, v3, v5, isUniquelyReferenced_nonNull_native, &v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Class isa = sub_A5A0().super.isa;
  swift_bridgeObjectRelease();
  [v1 setMetadata:isa];
}

id sub_83A4()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked) == 1)
  {
    if (qword_10760 != -1) {
      swift_once();
    }
    v1.super.Class isa = (Class)qword_10790;
    v15._countAndFlagsBits = 0xE000000000000000;
    v2._countAndFlagsBits = 0x545F4B434F4C4E55;
    v2._object = (void *)0xEE00574549565F4FLL;
LABEL_12:
    v18.value._countAndFlagsBits = 0;
    v18.value._object = 0;
    v20._countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    sub_A500(v2, v18, v1, v20, v15);
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes);
  if (!v3)
  {
    if (qword_10760 != -1) {
      swift_once();
    }
    v1.super.Class isa = (Class)qword_10790;
    v15._countAndFlagsBits = 0xE000000000000000;
    v2._countAndFlagsBits = 0x454D414E5F505041;
    v2._object = (void *)0xE800000000000000;
    goto LABEL_12;
  }
  if (qword_10760 != -1) {
    swift_once();
  }
  v4.super.Class isa = (Class)qword_10790;
  v16._countAndFlagsBits = 0xD000000000000014;
  v15._countAndFlagsBits = 0xE000000000000000;
  v16._object = (void *)0x800000000000B430;
  v17.value._countAndFlagsBits = 0;
  v17.value._object = 0;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  sub_A500(v16, v17, v4, v19, v15);
  sub_6DD4((uint64_t *)&unk_10660);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_B780;
  *(void *)(v5 + 56) = &type metadata for UInt;
  *(void *)(v5 + 64) = &protocol witness table for UInt;
  *(void *)(v5 + 32) = v3;
  sub_A5D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  NSString v6 = sub_A5C0();
  swift_bridgeObjectRelease();
  id v7 = [self textProviderWithText:v6];

  sub_94E8();
  Class isa = sub_A6A0(23.0).super.super.isa;
  id v9 = self;
  NSString v10 = sub_A5C0();
  id v11 = [v9 _symbolImageProviderWithSystemName:v10];

  [v11 setOverridePointSize:isa];
  id v12 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCircularImage) initWithImageProvider:v11];
  sub_824C(1);

  id v13 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicBezelCircularText) initWithCircularTemplate:v12 textProvider:v7];
  return v13;
}

uint64_t *sub_86C8()
{
  if (qword_10760 != -1) {
    swift_once();
  }
  return &qword_10790;
}

void sub_8714()
{
  uint64_t v1 = v0;
  sub_94E8();
  Class isa = sub_A6A0(18.0).super.super.isa;
  uint64_t v3 = self;
  NSString v4 = sub_A5C0();
  id v5 = [v3 _symbolImageProviderWithSystemName:v4];

  [v5 setOverridePointSize:isa];
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_locked) == 1)
  {
    if (qword_10760 != -1) {
      swift_once();
    }
    v6.super.Class isa = (Class)qword_10790;
    v18._countAndFlagsBits = 0xE000000000000000;
    v19._countAndFlagsBits = 0x545F4B434F4C4E55;
    v19._object = (void *)0xEE00574549565F4FLL;
    v22.value._countAndFlagsBits = 0;
    v22.value._object = 0;
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_A500(v19, v22, v6, v25, v18);
LABEL_9:
    NSString v10 = sub_A5C0();
    char v11 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC31MindComplicationBundleCompanion22MindTimelineEntryModel_minutes);
  if (v7)
  {
    if (qword_10760 != -1) {
      swift_once();
    }
    v8.super.Class isa = (Class)qword_10790;
    v18._countAndFlagsBits = 0xE000000000000000;
    v20._countAndFlagsBits = 0x5F534554554E494DLL;
    v20._object = (void *)0xEE0054414D524F46;
    v23.value._countAndFlagsBits = 0;
    v23.value._object = 0;
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    sub_A500(v20, v23, v8, v26, v18);
    sub_6DD4((uint64_t *)&unk_10660);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_B780;
    *(void *)(v9 + 56) = &type metadata for UInt;
    *(void *)(v9 + 64) = &protocol witness table for UInt;
    *(void *)(v9 + 32) = v7;
    sub_A5D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (qword_10760 != -1) {
    swift_once();
  }
  v17.super.Class isa = (Class)qword_10790;
  v18._countAndFlagsBits = 0xE000000000000000;
  v21._countAndFlagsBits = 0x454D414E5F505041;
  v21._object = (void *)0xE800000000000000;
  v24.value._countAndFlagsBits = 0;
  v24.value._object = 0;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  sub_A500(v21, v24, v17, v27, v18);
  NSString v10 = sub_A5C0();
  char v11 = 1;
LABEL_10:
  swift_bridgeObjectRelease();
  id v12 = [self textProviderWithText:v10];

  id v13 = self;
  id v14 = v12;
  id v15 = objc_msgSend(v13, "fiui_meditationTeal");
  if (v15)
  {
    Swift::String v16 = v15;
    [v14 setTintColor:v15];

    [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCornerTextImage) initWithTextProvider:v14 imageProvider:v5];
    sub_824C(v11);
  }
  else
  {

    __break(1u);
  }
}

void sub_8AB0()
{
}

id sub_8B10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindTimelineEntryModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_8BB4()
{
  type metadata accessor for MindTimelineEntryModel();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10790 = (uint64_t)result;
  return result;
}

id sub_8C0C()
{
  if (qword_10760 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10790;

  return v0;
}

id sub_8C68()
{
  id result = objc_msgSend(self, "fiui_meditationTeal");
  qword_10798 = (uint64_t)result;
  return result;
}

uint64_t sub_8CA4()
{
  if (qword_10768 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_10798;
  id v1 = (id)qword_10798;
  return v0;
}

uint64_t type metadata accessor for MindTimelineEntryModel()
{
  uint64_t result = qword_10770;
  if (!qword_10770) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_8D4C(uint64_t a1, uint64_t a2)
{
  sub_A7B0();
  sub_A600();
  Swift::Int v4 = sub_A7C0();

  return sub_90DC(a1, a2, v4);
}

uint64_t sub_8DC4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_6DD4(&qword_10658);
  char v36 = a2;
  uint64_t v6 = sub_A750();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    Swift::String_optional v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_A7B0();
    sub_A600();
    uint64_t result = sub_A7C0();
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
    Swift::String v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::String_optional v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *Swift::String_optional v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_90DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_A790() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_A790() & 1) == 0);
    }
  }
  return v6;
}

void *sub_91C0()
{
  id v1 = v0;
  sub_6DD4(&qword_10658);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_A740();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
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

uint64_t sub_9378(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_8D4C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_91C0();
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_8DC4(v15, a4 & 1);
  unint64_t v21 = sub_8D4C(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_A7A0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_94E8()
{
  unint64_t result = qword_105C0;
  if (!qword_105C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_105C0);
  }
  return result;
}

uint64_t sub_9528()
{
  return type metadata accessor for MindTimelineEntryModel();
}

uint64_t sub_9530()
{
  uint64_t result = sub_A530();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_95DC()
{
}

uint64_t sub_95F0(uint64_t a1)
{
  return sub_96B4(a1, static Log.default);
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return sub_9750(&qword_10780, (uint64_t)static Log.default);
}

uint64_t sub_9634(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_97C8(&qword_10780, (uint64_t)static Log.default, a1);
}

uint64_t sub_9690(uint64_t a1)
{
  return sub_96B4(a1, static Log.datasource);
}

uint64_t sub_96B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_A590();
  sub_A49C(v3, a2);
  sub_9634(v3, (uint64_t)a2);
  return sub_A580();
}

uint64_t Log.datasource.unsafeMutableAddressor()
{
  return sub_9750(&qword_10788, (uint64_t)static Log.datasource);
}

uint64_t sub_9750(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_A590();

  return sub_9634(v3, a2);
}

uint64_t static Log.datasource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_97C8(&qword_10788, (uint64_t)static Log.datasource, a1);
}

uint64_t sub_97C8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_A590();
  uint64_t v6 = sub_9634(v5, a2);
  unint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

Swift::Void __swiftcall Logger.trace(file:function:)(Swift::String file, Swift::String function)
{
  object = function._object;
  uint64_t countAndFlagsBits = function._countAndFlagsBits;
  uint64_t v4 = file._object;
  uint64_t v5 = file._countAndFlagsBits;
  Swift::String v19 = file;
  sub_9BF8();
  uint64_t v6 = sub_A6E0();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 16 * v7;
    uint64_t v5 = *(void *)(v8 + 16);
    uint64_t v4 = *(void **)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_9C4C(46, 0xE100000000000000, v5, (unint64_t)v4);
  sub_A650();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_A5F0();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_9C4C(40, 0xE100000000000000, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRetain();
  sub_A650();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_A5F0();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_A570();
  os_log_type_t v16 = sub_A690();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v19._uint64_t countAndFlagsBits = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 67109634;
    uint64_t v18 = pthread_self();
    pthread_mach_thread_np(v18);
    sub_A6C0();
    *(_WORD *)(v17 + 8) = 2080;
    swift_bridgeObjectRetain();
    sub_9D84(v9, v11, &v19._countAndFlagsBits);
    sub_A6C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 18) = 2080;
    swift_bridgeObjectRetain();
    sub_9D84(v12, v14, &v19._countAndFlagsBits);
    sub_A6C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v15, v16, "[%u] %s::%s", (uint8_t *)v17, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

unint64_t sub_9BF8()
{
  unint64_t result = qword_106D0;
  if (!qword_106D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_106D0);
  }
  return result;
}

unint64_t sub_9C4C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_A640() != a1 || v9 != a2)
  {
    char v10 = sub_A790();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_A610();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_9D40()
{
  return 0;
}

uint64_t sub_9D84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_9E68(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_A074((uint64_t)v12, *a3);
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
      sub_A074((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_A024((uint64_t)v12);
  return v7;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t sub_9E68(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_A6D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_A0D0(a5, a6);
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
  uint64_t v8 = sub_A710();
  if (!v8)
  {
    sub_A720();
    __break(1u);
LABEL_17:
    uint64_t result = sub_A760();
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

uint64_t sub_A024(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_A074(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_A0D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_A168(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_A348(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_A348(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_A168(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_A2E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_A700();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_A720();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_A630();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_A760();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_A720();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_A2E0(uint64_t a1, uint64_t a2)
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
  sub_6DD4(&qword_106D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_A348(char a1, int64_t a2, char a3, char *a4)
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
    sub_6DD4(&qword_106D8);
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
  uint64_t result = sub_A760();
  __break(1u);
  return result;
}

uint64_t *sub_A49C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_A500(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

NSDate sub_A510()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_A520()
{
  return Date.init()();
}

uint64_t sub_A530()
{
  return type metadata accessor for Date();
}

uint64_t sub_A540()
{
  return UUID.init(uuidString:)();
}

NSUUID sub_A550()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_A560()
{
  return type metadata accessor for UUID();
}

uint64_t sub_A570()
{
  return Logger.logObject.getter();
}

uint64_t sub_A580()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_A590()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_A5A0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_A5B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_A5C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_A5D0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_A5E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_A5F0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_A600()
{
  return String.hash(into:)();
}

uint64_t sub_A610()
{
  return String.index(after:)();
}

void sub_A620(Swift::String a1)
{
}

Swift::Int sub_A630()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_A640()
{
  return String.subscript.getter();
}

uint64_t sub_A650()
{
  return String.subscript.getter();
}

uint64_t sub_A660()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_A670()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_A680()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_A690()
{
  return static os_log_type_t.default.getter();
}

NSNumber sub_A6A0(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber sub_A6B0()
{
  return UInt._bridgeToObjectiveC()();
}

uint64_t sub_A6C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_A6D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_A6E0()
{
  return StringProtocol.components<A>(separatedBy:)();
}

void sub_A6F0(Swift::Int a1)
{
}

uint64_t sub_A700()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_A710()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_A720()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A730()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_A740()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_A750()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_A760()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_A770()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_A780()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_A790()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_A7A0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_A7B0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_A7C0()
{
  return Hasher._finalize()();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}