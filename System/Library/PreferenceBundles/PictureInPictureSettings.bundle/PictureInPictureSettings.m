Swift::Void __swiftcall PictureInPictureSettings.viewDidLoad()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  id v4;
  void *v5;
  id v6;
  NSString v7;
  NSString v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v1 = v0;
  type metadata accessor for PictureInPictureSettingsList();
  __chkstk_darwin();
  v3 = (uint64_t *)((char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19.receiver = v1;
  v19.super_class = (Class)PictureInPictureSettings;
  objc_msgSendSuper2(&v19, "viewDidLoad");
  sub_62C8(v3);
  v4 = objc_allocWithZone((Class)sub_53C8(&qword_C248));
  v5 = (void *)sub_73C8();
  if (qword_C238 != -1) {
    swift_once();
  }
  v6 = (id)qword_C440;
  v7 = sub_74A8();
  v8 = [v6 localizedStringForKey:v7 value:0 table:0];

  if (!v8)
  {
    sub_74B8();
    v8 = sub_74A8();
    swift_bridgeObjectRelease();
  }
  [v1 setTitle:v8];

  v9 = [v5 view];
  if (!v9)
  {
    v10 = v5;
    goto LABEL_10;
  }
  v10 = v9;
  v11 = [v1 view];
  if (v11)
  {
    v12 = v11;
    [v11 addSubview:v10];

    v13 = [v1 view];
    if (v13)
    {
      v14 = v13;
      [v13 bounds];
      v16 = v15;
      v18 = v17;

      objc_msgSend(v10, "setFrame:", 0.0, 0.0, v16, v18);
      [v10 setAutoresizingMask:18];
      [v1 addChildViewController:v5];
      [v5 didMoveToParentViewController:v1];

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

uint64_t sub_53C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void __swiftcall PictureInPictureSettings.init(nibName:bundle:)(PictureInPictureSettings *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    NSString v4 = sub_74A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:v4 bundle:isa];
}

id PictureInPictureSettings.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_74A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)PictureInPictureSettings;
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void __swiftcall PictureInPictureSettings.init(coder:)(PictureInPictureSettings_optional *__return_ptr retstr, NSCoder coder)
{
}

id PictureInPictureSettings.init(coder:)(void *a1)
{
  v4.super_class = (Class)PictureInPictureSettings;
  id v2 = objc_msgSendSuper2(&v4, "initWithCoder:", a1);

  return v2;
}

unint64_t type metadata accessor for PictureInPictureSettings()
{
  unint64_t result = qword_C278;
  if (!qword_C278)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_C278);
  }
  return result;
}

uint64_t *sub_570C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    uint64_t v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    uint64_t v11 = sub_7498();
    v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    v14 = (char *)v7 + v13;
    v15 = (char *)a2 + v13;
    uint64_t v16 = sub_7368();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[7];
    v18 = (char *)v7 + v17;
    v19 = (char *)a2 + v17;
    uint64_t v20 = sub_7388();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return v7;
}

uint64_t sub_5890(uint64_t a1, int *a2)
{
  swift_release();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_7498();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_7368();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_7388();
  v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *sub_5990(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_7498();
  v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_7368();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_7388();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

void *sub_5AC8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_7498();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  uint64_t v13 = sub_7368();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_7388();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

void *sub_5BF4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_7498();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  uint64_t v13 = sub_7368();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_7388();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

void *sub_5D10(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_7498();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  uint64_t v13 = sub_7368();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_7388();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_5E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_5E48);
}

uint64_t sub_5E48(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_7498();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
    return v13(&a1[v11], a2, v9);
  }
  uint64_t v12 = sub_7368();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[6];
    goto LABEL_9;
  }
  uint64_t v14 = sub_7388();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = &a1[a3[7]];

  return v15(v17, a2, v16);
}

uint64_t sub_5FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_5FD4);
}

char *sub_5FD4(char *result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)unint64_t result = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_7498();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_7368();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_7388();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[7]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for PictureInPictureSettingsList()
{
  uint64_t result = qword_C2D8;
  if (!qword_C2D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_6198()
{
  uint64_t result = sub_7498();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_7368();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_7388();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_62AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_62C8@<X0>(uint64_t *a1@<X8>)
{
  sub_53C8(&qword_C388);
  __chkstk_darwin();
  unint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_C240 != -1) {
    swift_once();
  }
  id v4 = (id)qword_C448;
  *a1 = sub_7398();
  uint64_t v5 = type metadata accessor for PictureInPictureSettingsList();
  uint64_t v6 = (uint64_t *)((char *)a1 + *(int *)(v5 + 20));
  *uint64_t v6 = 0xD000000000000029;
  v6[1] = 0x8000000000007CC0;
  uint64_t v7 = enum case for SettingsEventImage.graphicIcon(_:);
  uint64_t v8 = sub_7498();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v6, v7, v8);
  sub_7358();
  sub_7378();
  uint64_t v9 = sub_7388();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v3, 1, v9);
  if (result != 1) {
    return (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))((char *)a1 + *(int *)(v5 + 28), v3, v9);
  }
  __break(1u);
  return result;
}

uint64_t sub_64F0@<X0>(uint64_t a1@<X8>)
{
  if ([self isPictureInPictureSupported])
  {
    __chkstk_darwin();
    sub_73B8();
    if (qword_C238 != -1) {
      swift_once();
    }
    id v2 = (id)qword_C440;
    uint64_t v11 = sub_7408();
    uint64_t v12 = v3;
    char v13 = v4 & 1;
    uint64_t v14 = v5;
    sub_69C4((uint64_t)&v10);
    sub_53C8(&qword_C350);
    sub_53C8(&qword_C378);
    sub_6F80();
    sub_7078();
    sub_7488();
    uint64_t v6 = sub_53C8(&qword_C340);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 0, 1, v6);
  }
  else
  {
    uint64_t v8 = sub_53C8(&qword_C340);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a1, 1, 1, v8);
  }
}

uint64_t sub_6774()
{
  uint64_t v0 = sub_53C8(&qword_C360);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_73A8();
  sub_7478();
  sub_70E4(&qword_C358, &qword_C360);
  sub_7468();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_68E4@<X0>(uint64_t a1@<X8>)
{
  sub_73B8();
  if (qword_C238 != -1) {
    swift_once();
  }
  id v2 = (id)qword_C440;
  uint64_t result = sub_7408();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

id sub_69C4@<X0>(uint64_t a1@<X8>)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v3 = result;
    int homeButtonType = MobileGestalt_get_homeButtonType();

    if (homeButtonType == 2)
    {
      sub_73B8();
      if (qword_C238 == -1) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_73B8();
      if (qword_C238 == -1)
      {
LABEL_6:
        id v5 = (id)qword_C440;
        sub_7408();
        id result = (id)sub_73D8();
        *(_OWORD *)a1 = v6;
        *(_OWORD *)(a1 + 16) = v7;
        *(unsigned char *)(a1 + 32) = v8;
        return result;
      }
    }
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_6BC0()
{
  return sub_7458();
}

uint64_t sub_6BDC@<X0>(uint64_t a1@<X8>)
{
  v12[1] = a1;
  uint64_t v2 = sub_53C8(&qword_C318);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_53C8(&qword_C320);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1;
  sub_53C8(&qword_C328);
  sub_6E3C();
  sub_73F8();
  uint64_t v10 = sub_70E4(&qword_C380, &qword_C318);
  sub_7418();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = v2;
  uint64_t v15 = v10;
  swift_getOpaqueTypeConformance2();
  sub_7428();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_6E34@<X0>(uint64_t a1@<X8>)
{
  return sub_64F0(a1);
}

unint64_t sub_6E3C()
{
  unint64_t result = qword_C330;
  if (!qword_C330)
  {
    sub_6EB0(&qword_C328);
    sub_6EF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C330);
  }
  return result;
}

uint64_t sub_6EB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_6EF8()
{
  unint64_t result = qword_C338;
  if (!qword_C338)
  {
    sub_6EB0(&qword_C340);
    sub_6F80();
    sub_7078();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C338);
  }
  return result;
}

unint64_t sub_6F80()
{
  unint64_t result = qword_C348;
  if (!qword_C348)
  {
    sub_6EB0(&qword_C350);
    sub_70E4(&qword_C358, &qword_C360);
    sub_7020();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C348);
  }
  return result;
}

unint64_t sub_7020()
{
  unint64_t result = qword_C368;
  if (!qword_C368)
  {
    sub_73E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C368);
  }
  return result;
}

unint64_t sub_7078()
{
  unint64_t result = qword_C370;
  if (!qword_C370)
  {
    sub_6EB0(&qword_C378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C370);
  }
  return result;
}

uint64_t sub_70E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_6EB0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_7128()
{
  return sub_6774();
}

uint64_t sub_7130()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_722C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

id sub_7288()
{
  type metadata accessor for FindClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_C440 = (uint64_t)result;
  return result;
}

void sub_72E0()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_74A8();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2)
  {
    qword_C448 = (uint64_t)v2;
  }
  else
  {
    __break(1u);
    sub_7358();
  }
}

uint64_t sub_7358()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_7368()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_7378()
{
  return URL.init(string:)();
}

uint64_t sub_7388()
{
  return type metadata accessor for URL();
}

uint64_t sub_7398()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_73A8()
{
  return AppStorage.projectedValue.getter();
}

uint64_t sub_73B8()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_73C8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_73D8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_73E8()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_73F8()
{
  return List<>.init(content:)();
}

uint64_t sub_7408()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_7418()
{
  return View.settingsListAppearance()();
}

uint64_t sub_7428()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_7438()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_7448()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_7458()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_7468()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_7478()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_7488()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_7498()
{
  return type metadata accessor for SettingsEventImage();
}

NSString sub_74A8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_74B8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_homeButtonType()
{
  return _MobileGestalt_get_homeButtonType();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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