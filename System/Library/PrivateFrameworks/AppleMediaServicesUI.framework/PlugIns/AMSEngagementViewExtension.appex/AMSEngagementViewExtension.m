id sub_1000044F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id result;
  uint64_t *v16;
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t MetatypeMetadata;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void v30[4];
  void v31[3];
  objc_class *v32;
  objc_super v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;

  sub_100009A18();
  __chkstk_darwin();
  objc_allocWithZone((Class)_UIContentUnavailableView);
  v7 = v3;
  v8 = sub_100005534();
  result = sub_1000052D0(v11, v12, v13, v14, v8, v9, v10);
  if (result)
  {
    *(void *)&v7[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView] = result;
    *(void *)&v7[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_error] = a1;
    v16 = (uint64_t *)&v7[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_retryAction];
    *v16 = a2;
    v16[1] = a3;
    swift_errorRetain();
    sub_10000536C(a2);

    v17 = (objc_class *)type metadata accessor for ErrorViewController();
    v33.receiver = v7;
    v33.super_class = v17;
    v18 = objc_msgSendSuper2(&v33, "initWithNibName:bundle:", 0, 0);
    sub_10000537C((uint64_t *)&unk_100011070);
    sub_100009A58();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A1E0;
    v32 = v17;
    v31[0] = v18;
    v19 = v18;
    v20 = (id)AMSLogKey();
    if (v20)
    {
      v21 = v20;
      v22 = sub_100009B78();
      v24 = v23;

      sub_100009A08();
      v34._countAndFlagsBits = 0;
      v34._object = (void *)0xE000000000000000;
      sub_1000099F8(v34);
      sub_100005574();
      MetatypeMetadata = swift_getMetatypeMetadata();
      sub_100005554(MetatypeMetadata);
      sub_100005404((uint64_t)v30);
      v35._countAndFlagsBits = 5972026;
      v35._object = (void *)0xE300000000000000;
      sub_1000099F8(v35);
      v30[3] = &type metadata for String;
      v30[0] = v22;
      v30[1] = v24;
      sub_1000099E8();
      sub_100005404((uint64_t)v30);
      v26._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v36._countAndFlagsBits = 0;
      v36._object = (void *)0xE000000000000000;
      sub_1000099F8(v36);
      sub_100005574();
      v27 = swift_getMetatypeMetadata();
      sub_100005554(v27);
      sub_100005404((uint64_t)v30);
      v26._countAndFlagsBits = 58;
    }
    v26._object = (void *)0xE100000000000000;
    sub_1000099F8(v26);
    sub_100009A28();
    type metadata accessor for Log();
    sub_100005464((uint64_t)v31);
    sub_1000099C8();
    swift_getErrorValue();
    v28 = sub_100009BF8();
    v32 = (objc_class *)&type metadata for String;
    v31[0] = v28;
    v31[1] = v29;
    sub_100009A38();
    sub_100005404((uint64_t)v31);
    sub_100005678();
    sub_1000054B4(a2);
    swift_errorRelease();
    swift_bridgeObjectRelease();

    return v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100004870()
{
  id v1 = objc_allocWithZone((Class)_UIContentUnavailableView);
  uint64_t v2 = sub_100005534();
  id v9 = sub_1000052D0(v5, v6, v7, v8, v2, v3, v4);
  if (!v9) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView] = v9;

  sub_100009BD8();
  __break(1u);
}

id sub_10000496C()
{
  id v1 = [v0 parentViewController];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 navigationItem];

    return v3;
  }
  else
  {
    v6.receiver = v0;
    v6.super_class = (Class)type metadata accessor for ErrorViewController();
    id v5 = objc_msgSendSuper2(&v6, "navigationItem");
    return v5;
  }
}

void sub_100004A0C()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ErrorViewController();
  objc_msgSendSuper2(&v3, "loadView");
  id v1 = [v0 view];
  id v2 = objc_msgSend(self, "ams_primaryBackground");
  sub_10000551C((uint64_t)v2, "setBackgroundColor:");
}

void sub_100004AE4()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for ErrorViewController();
  objc_msgSendSuper2(&v1, "viewDidLoad");
  sub_100004C60();
}

id sub_100004B64()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for ErrorViewController();
  objc_msgSendSuper2(&v12, "viewWillLayoutSubviews");
  objc_super v1 = *(void **)&v0[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView];
  id v2 = [v0 view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  return objc_msgSend(v1, "setFrame:", v4, v6, v8, v10);
}

void sub_100004C60()
{
  id v1 = [v0 navigationItem];
  objc_msgSend(v1, "ams_configureWithTransparentBackground");

  sub_100004CB8();
}

void sub_100004CB8()
{
  type metadata accessor for Localizations();
  uint64_t v1 = sub_1000055AC(0xD000000000000015, (void *)0x800000010000A6F0);
  uint64_t v3 = v2;
  uint64_t v4 = sub_1000055AC(0xD000000000000014, (void *)0x800000010000A710);
  sub_100004DBC(v1, v3, 0, 0, v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v6 = [v0 view];
  [v6 addSubview:*(void *)&v0[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView]];
}

void sub_100004DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_super v12 = *(void **)(v6 + OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView);
  id v13 = [v12 buttonTitle];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = sub_100009B78();
    uint64_t v17 = v16;

    if (!a6)
    {
LABEL_31:
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    if (v15 == a5 && v17 == a6)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = sub_100009BE8();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0) {
        goto LABEL_32;
      }
    }
  }
  else if (a6)
  {
    goto LABEL_32;
  }
  id v20 = [v12 message];
  if (!v20)
  {
    if (!a4) {
      goto LABEL_23;
    }
LABEL_32:
    uint64_t v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1000054FC;
    aBlock[5] = v34;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100007054;
    aBlock[3] = &unk_10000C648;
    v35 = _Block_copy(aBlock);
    uint64_t v36 = swift_release();
    sub_10000551C(v36, "setButtonAction:");
    _Block_release(v35);
    if (a6)
    {
      NSString v37 = sub_100009B68();
      v38 = v37;
    }
    else
    {
      v38 = 0;
    }
    sub_10000551C((uint64_t)v37, "setButtonTitle:");

    if (a4)
    {
      NSString v39 = sub_100009B68();
      v40 = v39;
    }
    else
    {
      v40 = 0;
    }
    sub_10000551C((uint64_t)v39, "setMessage:");

    if (a2)
    {
      NSString v41 = sub_100009B68();
      v42 = v41;
    }
    else
    {
      v42 = 0;
    }
    sub_10000551C((uint64_t)v41, "setTitle:");

    return;
  }
  v21 = v20;
  uint64_t v22 = sub_100009B78();
  uint64_t v24 = v23;

  if (!a4) {
    goto LABEL_31;
  }
  if (v22 == a3 && v24 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v26 = sub_100009BE8();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      goto LABEL_32;
    }
  }
LABEL_23:
  id v27 = [v12 title];
  if (!v27)
  {
    if (!a2) {
      return;
    }
    goto LABEL_32;
  }
  v28 = v27;
  uint64_t v29 = sub_100009B78();
  uint64_t v31 = v30;

  if (!a2) {
    goto LABEL_31;
  }
  if (v29 != a1 || v31 != a2)
  {
    char v33 = sub_100009BE8();
    swift_bridgeObjectRelease();
    if (v33) {
      return;
    }
    goto LABEL_32;
  }
  swift_bridgeObjectRelease();
}

void sub_1000050F4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void (**)(void))(Strong + OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_retryAction);
    sub_10000536C((uint64_t)v2);

    if (v2)
    {
      v2();
      sub_1000054B4((uint64_t)v2);
    }
  }
}

void sub_100005180()
{
}

void sub_1000051C0()
{
}

id sub_100005218()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ErrorViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ErrorViewController()
{
  return self;
}

id sub_1000052D0(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a6)
  {
    NSString v13 = sub_100009B68();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  id v14 = objc_msgSend(v7, "initWithFrame:title:style:", v13, a7, a1, a2, a3, a4);

  return v14;
}

uint64_t sub_10000536C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000537C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_1000053C0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100005404(uint64_t a1)
{
  uint64_t v2 = sub_10000537C((uint64_t *)&unk_100010D30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005464(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000054B4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000054C4()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000054FC()
{
}

uint64_t sub_100005504(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005514()
{
  return swift_release();
}

id sub_10000551C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_100005534()
{
  return 0;
}

uint64_t sub_100005554(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return sub_1000099E8();
}

uint64_t sub_100005574()
{
  sub_1000053C0((void *)(v0 - 128), *(void *)(v0 - 104));
  return swift_getDynamicType();
}

uint64_t sub_1000055AC(uint64_t a1, void *a2)
{
  uint64_t v4 = (objc_class *)[self mainBundle];
  v8._countAndFlagsBits = 0xE000000000000000;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  v10.value._countAndFlagsBits = 0;
  v10.value._object = 0;
  v5.super.isa = v4;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  uint64_t v6 = sub_100009978(v9, v10, v5, v11, v8);

  return v6;
}

uint64_t sub_100005644()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Localizations()
{
  return self;
}

uint64_t sub_100005678()
{
  os_log_type_t v0 = sub_100009B88();
  return sub_100005710(v0);
}

uint64_t sub_1000056B0()
{
  sub_1000058E4();
  uint64_t result = sub_100009BB8();
  qword_100010E38 = result;
  return result;
}

uint64_t sub_100005710(os_log_type_t a1)
{
  if (qword_100010CE0 != -1) {
    swift_once();
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_100010E38, a1);
  if (result)
  {
    sub_1000099D8();
    uint64_t v3 = sub_100009A48();
    uint64_t v5 = v4;
    sub_10000537C(&qword_100010ED8);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10000A250;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_100005898();
    *(void *)(v6 + 32) = v3;
    *(void *)(v6 + 40) = v5;
    sub_1000099B8();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000583C()
{
  os_log_type_t v0 = sub_100009B98();
  return sub_100005710(v0);
}

uint64_t type metadata accessor for Log()
{
  return self;
}

unint64_t sub_100005898()
{
  unint64_t result = qword_100010EE0;
  if (!qword_100010EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010EE0);
  }
  return result;
}

unint64_t sub_1000058E4()
{
  unint64_t result = qword_100010EE8;
  if (!qword_100010EE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010EE8);
  }
  return result;
}

uint64_t sub_100005924()
{
  return 1;
}

Swift::Int sub_10000592C()
{
  return sub_100005984();
}

void sub_10000595C()
{
}

Swift::Int sub_100005984()
{
  return sub_100009C68();
}

Swift::Int sub_1000059C8()
{
  return sub_100009C68();
}

uint64_t sub_100005A08(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  sub_100009A18();
  __chkstk_darwin();
  if (a3 >> 60 == 15
    || (sub_100006D0C(0, &qword_1000110A0), sub_100006D48(a2, a3), (id v10 = sub_100005E1C(a2, a3)) == 0))
  {
    id v10 = [self createBagForSubProfile];
  }
  sub_10000537C((uint64_t *)&unk_100011070);
  uint64_t v11 = sub_100009A58();
  sub_100006FDC(v11);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A280;
  *((void *)&v31 + 1) = type metadata accessor for RemoteEngagementPresenter();
  *(void *)&long long v30 = v5;
  swift_retain();
  id v12 = (id)AMSLogKey();
  if (v12)
  {
    NSString v13 = v12;
    v28 = a1;
    id v14 = a4;
    uint64_t v15 = sub_100009B78();
    uint64_t v17 = v16;

    sub_100009A08();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_1000099F8(v32);
    sub_100007014();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100006FF4(MetatypeMetadata);
    sub_100005404((uint64_t)v29);
    v33._countAndFlagsBits = 5972026;
    v33._object = (void *)0xE300000000000000;
    sub_1000099F8(v33);
    v29[3] = &type metadata for String;
    v29[0] = v15;
    v29[1] = v17;
    a4 = v14;
    a1 = v28;
    sub_1000099E8();
    sub_100005404((uint64_t)v29);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_100009A08();
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_1000099F8(v34);
    sub_100007014();
    uint64_t v20 = swift_getMetatypeMetadata();
    sub_100006FF4(v20);
    sub_100005404((uint64_t)v29);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_1000099F8(v19);
  sub_100009A28();
  sub_100005464((uint64_t)&v30);
  sub_1000099C8();
  *((void *)&v31 + 1) = sub_100006D0C(0, &qword_100011090);
  *(void *)&long long v30 = a1;
  id v21 = a1;
  sub_100009A38();
  sub_100005404((uint64_t)&v30);
  sub_1000099C8();
  if (v10)
  {
    *((void *)&v31 + 1) = swift_getObjectType();
    *(void *)&long long v30 = v10;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_unknownObjectRetain();
  sub_100009A38();
  sub_100005404((uint64_t)&v30);
  sub_1000099C8();
  if (a4)
  {
    *((void *)&v31 + 1) = sub_100006D0C(0, &qword_100011098);
    *(void *)&long long v30 = a4;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  type metadata accessor for Log();
  id v22 = a4;
  sub_100009A38();
  sub_100005404((uint64_t)&v30);
  sub_10000583C();
  swift_bridgeObjectRelease();
  v5[3] = v10;
  swift_unknownObjectRelease();
  uint64_t v23 = (void *)v5[4];
  v5[4] = a4;
  id v24 = v22;

  v25 = (void *)v5[5];
  v5[5] = v21;
  id v26 = v21;

  return 0;
}

id sub_100005E1C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_100009998().super.isa;
  id v6 = [v4 initWithData:isa];
  sub_100006DA0(a1, a2);

  return v6;
}

void sub_100005E94()
{
  sub_100009A18();
  __chkstk_darwin();
  uint64_t v1 = (uint64_t (*)())v0[3];
  if (v1 && (uint64_t v2 = (void *)v0[5]) != 0)
  {
    uint64_t v3 = (void *)v0[4];
    uint64_t v4 = swift_allocObject();
    swift_weakInit();
    v18 = v2;
    Swift::String v19 = v1;
    uint64_t v20 = (uint64_t)v3;
    uint64_t v21 = (uint64_t)sub_100006CA0;
    uint64_t v22 = v4;
    char v23 = 1;
    id v5 = v3;
    swift_retain();
    swift_unknownObjectRetain();
    id v6 = v2;
    sub_100009B48();
    swift_release_n();

    swift_unknownObjectRelease();
  }
  else
  {
    sub_10000537C((uint64_t *)&unk_100011070);
    uint64_t v7 = sub_100009A58();
    sub_100006FDC(v7);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A290;
    uint64_t v21 = type metadata accessor for RemoteEngagementPresenter();
    v18 = v0;
    swift_retain();
    id v8 = (id)AMSLogKey();
    if (v8)
    {
      Swift::String v9 = v8;
      uint64_t v10 = sub_100009B78();
      uint64_t v12 = v11;

      sub_100009A08();
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      sub_1000099F8(v26);
      sub_1000053C0(&v18, v21);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v24[0] = DynamicType;
      sub_1000099E8();
      sub_100005404((uint64_t)v24);
      v27._countAndFlagsBits = 5972026;
      v27._object = (void *)0xE300000000000000;
      sub_1000099F8(v27);
      uint64_t MetatypeMetadata = &type metadata for String;
      v24[0] = v10;
      v24[1] = v12;
      sub_1000099E8();
      sub_100005404((uint64_t)v24);
      v14._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v28._countAndFlagsBits = 0;
      v28._object = (void *)0xE000000000000000;
      sub_1000099F8(v28);
      sub_1000053C0(&v18, v21);
      uint64_t v15 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v24[0] = v15;
      sub_1000099E8();
      sub_100005404((uint64_t)v24);
      v14._countAndFlagsBits = 58;
    }
    v14._object = (void *)0xE100000000000000;
    sub_1000099F8(v14);
    sub_100009A28();
    type metadata accessor for Log();
    sub_100005464((uint64_t)&v18);
    sub_1000099C8();
    sub_100005678();
    swift_bridgeObjectRelease();
    sub_100006C14();
    uint64_t v16 = swift_allocError();
    uint64_t v17 = swift_allocObject();
    swift_weakInit();
    v18 = (void *)v16;
    Swift::String v19 = sub_100006C98;
    uint64_t v20 = v17;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    char v23 = 2;
    swift_retain();
    sub_100009B48();
    swift_errorRelease();
    swift_release_n();
  }
}

uint64_t sub_100006230()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100006C14();
    swift_allocError();
    sub_100009B48();
    swift_errorRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000062D0(void *a1, uint64_t a2)
{
  sub_100009A18();
  __chkstk_darwin();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    sub_10000537C((uint64_t *)&unk_100011070);
    sub_100009A58();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A2A0;
    *((void *)&v19 + 1) = type metadata accessor for RemoteEngagementPresenter();
    *(void *)&long long v18 = v5;
    swift_retain();
    id v6 = (id)AMSLogKey();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100009B78();
      uint64_t v10 = v9;

      sub_100009A08();
      v24._countAndFlagsBits = 0;
      v24._object = (void *)0xE000000000000000;
      sub_1000099F8(v24);
      sub_1000053C0(&v18, *((uint64_t *)&v19 + 1));
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v22[0] = DynamicType;
      sub_1000099E8();
      sub_100005404((uint64_t)v22);
      v25._countAndFlagsBits = 5972026;
      v25._object = (void *)0xE300000000000000;
      sub_1000099F8(v25);
      uint64_t MetatypeMetadata = &type metadata for String;
      v22[0] = v8;
      v22[1] = v10;
      sub_1000099E8();
      sub_100005404((uint64_t)v22);
      v12._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      sub_1000099F8(v26);
      sub_1000053C0(&v18, *((uint64_t *)&v19 + 1));
      uint64_t v13 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v22[0] = v13;
      sub_1000099E8();
      sub_100005404((uint64_t)v22);
      v12._countAndFlagsBits = 58;
    }
    v12._object = (void *)0xE100000000000000;
    sub_1000099F8(v12);
    sub_100009A28();
    sub_100005464((uint64_t)&v18);
    sub_1000099C8();
    if (a1)
    {
      *((void *)&v19 + 1) = sub_100006D0C(0, &qword_100011088);
      *(void *)&long long v18 = a1;
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    id v14 = a1;
    sub_100009A38();
    sub_100005404((uint64_t)&v18);
    sub_1000099C8();
    if (a2)
    {
      swift_getErrorValue();
      *((void *)&v19 + 1) = v17;
      uint64_t v15 = sub_100006CA8((uint64_t *)&v18);
      (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v15);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    type metadata accessor for Log();
    sub_100009A38();
    sub_100005404((uint64_t)&v18);
    sub_10000583C();
    swift_bridgeObjectRelease();
    *(void *)&long long v18 = a1;
    *((void *)&v18 + 1) = a2;
    uint64_t v20 = 0;
    long long v19 = 0uLL;
    char v21 = 0;
    id v16 = v14;
    swift_errorRetain();
    sub_100009B48();

    swift_errorRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000066B8()
{
  swift_release();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_1000066F0()
{
  sub_1000066B8();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for RemoteEngagementPresenter()
{
  return self;
}

uint64_t sub_100006748(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *sub_10000677C(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = result;
  switch(a6)
  {
    case 2:
      swift_errorRetain();
      return (void *)sub_10000536C(a2);
    case 1:
      id v9 = a3;
      swift_retain();
      id v10 = v7;
      return (void *)swift_unknownObjectRetain();
    case 0:
      id v8 = result;
      return (void *)swift_errorRetain();
  }
  return result;
}

void sub_100006854(uint64_t a1)
{
}

void sub_10000686C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 2:
      swift_errorRelease();
      sub_1000054B4(a2);
      break;
    case 1:

      swift_unknownObjectRelease();
      swift_release();

      break;
    case 0:

      swift_errorRelease();
      break;
  }
}

uint64_t sub_100006944(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_10000677C(*(void **)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t sub_1000069BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_10000677C(*(void **)a2, v4, v5, v6, v7, v8);
  id v9 = *(void **)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_10000686C(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 sub_100006A48(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100006A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_10000686C(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_100006AB0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100006AF0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100006B40(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_100006B4C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.State()
{
}

unint64_t sub_100006B64()
{
  unint64_t result = qword_100011060;
  if (!qword_100011060)
  {
    type metadata accessor for RemoteEngagementPresenter();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011060);
  }
  return result;
}

void *sub_100006BB0()
{
  sub_10000537C(&qword_1000111E0);
  swift_allocObject();
  v0[2] = sub_100009B58();
  v0[3] = 0;
  v0[4] = 0;
  v0[5] = 0;
  return v0;
}

unint64_t sub_100006C14()
{
  unint64_t result = qword_100011080;
  if (!qword_100011080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011080);
  }
  return result;
}

uint64_t sub_100006C60()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006C98()
{
  return sub_100006230();
}

uint64_t sub_100006CA0(void *a1, uint64_t a2)
{
  return sub_1000062D0(a1, a2);
}

uint64_t *sub_100006CA8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100006D0C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006D48(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006DA0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006E08()
{
  return 0;
}

void type metadata accessor for RemoteEngagementPresenter.CompletionError()
{
}

uint64_t getEnumTagSinglePayload for RemoteEngagementViewController.RemoteViewControllerProxyError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *sub_100006E6C(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100006F08);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ConfigurationError()
{
}

unint64_t sub_100006F40()
{
  unint64_t result = qword_1000110A8;
  if (!qword_1000110A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110A8);
  }
  return result;
}

unint64_t sub_100006F90()
{
  unint64_t result = qword_1000110B0;
  if (!qword_1000110B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000110B0);
  }
  return result;
}

uint64_t sub_100006FDC(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100006FF4(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000099E8();
}

uint64_t sub_100007014()
{
  sub_1000053C0((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_100007054(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1000070A0()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v1, "viewDidLoad");
  sub_100007568();
  type metadata accessor for RemoteEngagementPresenter();
  sub_10000975C();
  sub_100009A88();
}

void sub_1000071C0(char a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v3, "viewDidAppear:", a1 & 1);
  sub_100007710();
  type metadata accessor for RemoteEngagementPresenter();
  sub_10000975C();
  sub_100009A98();
}

uint64_t sub_100007284(char a1)
{
  sub_100009AF8();
  sub_1000098E0();
  uint64_t v5 = v4;
  __chkstk_darwin();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (objc_class *)type metadata accessor for RemoteEngagementViewController();
  v10.receiver = v2;
  v10.super_class = v8;
  objc_msgSendSuper2(&v10, "viewWillDisappear:", a1 & 1);
  sub_100009AE8();
  type metadata accessor for RemoteEngagementPresenter();
  sub_10000975C();
  sub_100009AC8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v1);
}

uint64_t sub_1000073CC(char a1, SEL *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v10, *a2, a1 & 1);
  uint64_t v7 = type metadata accessor for RemoteEngagementPresenter();
  unint64_t v8 = sub_10000975C();
  return a3(v7, v8);
}

id sub_1000074E8(void *a1)
{
  id v1 = [self interfaceWithProtocol:*a1];
  return v1;
}

uint64_t sub_100007568()
{
  sub_10000537C(&qword_1000111D8);
  sub_1000098E0();
  uint64_t v2 = v1;
  __chkstk_darwin();
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_100009948();
  sub_100009918();
  sub_10000537C(&qword_1000111E0);
  sub_1000096C0();
  swift_retain();
  sub_100009A68();
  sub_100009A78();
  swift_release();
  swift_release();
  sub_100005464((uint64_t)v7);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v0);
}

void sub_1000076AC(uint64_t a1)
{
  sub_10000940C(a1, (uint64_t)v3);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    sub_100008764((uint64_t)v3);
  }
}

void sub_100007710()
{
  sub_100009A18();
  __chkstk_darwin();
  sub_100009900();
  id v1 = [v0 view];
  id v2 = [v1 window];

  if (v2)
  {
    uint64_t v3 = self;
    id v4 = v2;
    id v5 = [v3 systemBlueColor];
    [v4 setTintColor:v5];

    id v6 = [v4 _rootSheetPresentationController];
    if (v6)
    {
      uint64_t v17 = v6;
      [v6 _setShouldScaleDownBehindDescendantSheets:0];
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_10000537C((uint64_t *)&unk_100011070);
    uint64_t v7 = sub_100009A58();
    sub_100006FDC(v7);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A290;
    uint64_t v21 = type metadata accessor for RemoteEngagementViewController();
    v20[0] = v0;
    id v8 = v0;
    id v9 = (id)AMSLogKey();
    if (v9)
    {
      objc_super v10 = v9;
      uint64_t v11 = sub_100009B78();
      uint64_t v13 = v12;

      sub_100009A08();
      sub_100009960();
      sub_1000053C0(v20, v21);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v18[0] = DynamicType;
      sub_1000099E8();
      sub_100005404((uint64_t)v18);
      v23._countAndFlagsBits = 5972026;
      v23._object = (void *)0xE300000000000000;
      sub_1000099F8(v23);
      uint64_t MetatypeMetadata = &type metadata for String;
      v18[0] = v11;
      v18[1] = v13;
      sub_1000099E8();
      sub_100005404((uint64_t)v18);
      v15._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      sub_100009960();
      sub_1000053C0(v20, v21);
      uint64_t v16 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v18[0] = v16;
      sub_1000099E8();
      sub_100005404((uint64_t)v18);
      v15._countAndFlagsBits = 58;
    }
    v15._object = (void *)0xE100000000000000;
    sub_1000099F8(v15);
    sub_100009A28();
    type metadata accessor for Log();
    sub_100005464((uint64_t)v20);
    sub_1000099C8();
    sub_100005678();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100007A44()
{
  id v1 = v0;
  sub_10000537C(&qword_1000111C0);
  uint64_t v2 = sub_100009B38();
  if ([v1 _remoteViewControllerProxy])
  {
    sub_100009BC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_100009604((uint64_t)v5, (uint64_t)v6);
  if (!v6[3])
  {
    sub_100005404((uint64_t)v6);
    goto LABEL_8;
  }
  sub_10000537C(&qword_1000111D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    sub_10000966C();
    swift_allocError();
    sub_100009B18();
    swift_errorRelease();
    return v2;
  }
  v6[0] = v4;
  sub_100009B28();
  swift_unknownObjectRelease();
  return v2;
}

void sub_100007B58(char a1, void *a2, uint64_t a3)
{
  id v7 = [v3 presentedViewController];
  if (v7)
  {
    id v8 = v7;
    if (a2)
    {
      v9[4] = a2;
      v9[5] = a3;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256;
      v9[2] = sub_100007054;
      v9[3] = &unk_10000C960;
      a2 = _Block_copy(v9);
      swift_retain();
      swift_release();
    }
    [v8 dismissViewControllerAnimated:a1 & 1 completion:a2];
    _Block_release(a2);
  }
  else if (a2)
  {
    ((void (*)(void))a2)();
  }
}

uint64_t sub_100007C5C(void *a1, uint64_t a2)
{
  sub_100007A44();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  sub_100009948();
  sub_100009918();
  uint64_t v5 = sub_100006D0C(0, &qword_100011158);
  id v6 = a1;
  swift_errorRetain();
  swift_retain();
  v8[3] = v5;
  v8[4] = &protocol witness table for OS_dispatch_queue;
  v8[0] = sub_100009BA8();
  sub_100009B08();
  swift_release();
  swift_release();
  swift_release();
  sub_100005464((uint64_t)v8);
  return swift_release();
}

void sub_100007D78(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  if (a3) {
    uint64_t v5 = (void *)sub_100009988();
  }
  else {
    uint64_t v5 = 0;
  }
  v7[4] = nullsub_1;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100007054;
  v7[3] = &unk_10000C938;
  id v6 = _Block_copy(v7);
  [v4 engagementTaskDidFinishWithResult:a2 error:v5 completion:v6];
  _Block_release(v6);
}

uint64_t sub_100007E50()
{
  sub_100009A18();
  __chkstk_darwin();
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    id v1 = (void *)result;
    sub_10000537C((uint64_t *)&unk_100011070);
    sub_100009A58();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A1E0;
    uint64_t v25 = type metadata accessor for RemoteEngagementViewController();
    v24[0] = (uint64_t)v1;
    id v2 = v1;
    id v3 = (id)AMSLogKey();
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_100009B78();
      uint64_t v7 = v6;

      sub_100009A08();
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      sub_1000099F8(v26);
      sub_1000053C0(v24, v25);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v21 = DynamicType;
      sub_1000099E8();
      sub_100005404((uint64_t)&v21);
      v27._countAndFlagsBits = 5972026;
      v27._object = (void *)0xE300000000000000;
      sub_1000099F8(v27);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v21 = v5;
      uint64_t v22 = v7;
      sub_1000099E8();
      sub_100005404((uint64_t)&v21);
      v9._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v28._countAndFlagsBits = 0;
      v28._object = (void *)0xE000000000000000;
      sub_1000099F8(v28);
      sub_1000053C0(v24, v25);
      uint64_t v10 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v21 = v10;
      sub_1000099E8();
      sub_100005404((uint64_t)&v21);
      v9._countAndFlagsBits = 58;
    }
    v9._object = (void *)0xE100000000000000;
    sub_1000099F8(v9);
    sub_100009A28();
    sub_100005464((uint64_t)v24);
    sub_1000099C8();
    swift_getErrorValue();
    uint64_t v25 = v20;
    uint64_t v11 = sub_100006CA8(v24);
    (*(void (**)(uint64_t *))(*(void *)(v20 - 8) + 16))(v11);
    id v12 = (id)AMSLogKey();
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_100009B78();
      uint64_t v16 = v15;

      sub_100009A08();
      v29._countAndFlagsBits = 0;
      v29._object = (void *)0xE000000000000000;
      sub_1000099F8(v29);
      sub_1000053C0(v24, v25);
      uint64_t v17 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v21 = v17;
      sub_1000099E8();
      sub_100005404((uint64_t)&v21);
      v30._countAndFlagsBits = 5972026;
      v30._object = (void *)0xE300000000000000;
      sub_1000099F8(v30);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v21 = v14;
      uint64_t v22 = v16;
      sub_1000099E8();
      sub_100005404((uint64_t)&v21);
      v18._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v31._countAndFlagsBits = 0;
      v31._object = (void *)0xE000000000000000;
      sub_1000099F8(v31);
      sub_1000053C0(v24, v25);
      uint64_t v19 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v21 = v19;
      sub_1000099E8();
      sub_100005404((uint64_t)&v21);
      v18._countAndFlagsBits = 58;
    }
    v18._object = (void *)0xE100000000000000;
    sub_1000099F8(v18);
    sub_100009A28();
    type metadata accessor for Log();
    sub_100005464((uint64_t)v24);
    sub_100005678();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000828C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009948();
  sub_100009918();
  uint64_t v7 = (void *)sub_100009930();
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  swift_retain();
  swift_errorRetain();
  sub_10000536C(a2);
  sub_100007B58(1, sub_1000095A8, (uint64_t)v7);
  swift_release();
  return swift_release();
}

void sub_100008348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = (void *)Strong;
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_errorRetain();
    sub_10000536C(a3);
    id v9 = sub_1000044F8(a2, a3, a4);
    [v8 presentViewController:v9 animated:1 completion:0];
  }
}

uint64_t sub_100008410(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100009948();
  sub_100009918();
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a1;
  v11[4] = a2;
  v11[5] = a3;
  v11[6] = a4;
  v11[7] = a5;
  id v12 = a3;
  swift_retain();
  swift_retain();
  id v13 = a1;
  swift_unknownObjectRetain();
  sub_100007B58(1, sub_100009530, (uint64_t)v11);
  swift_release();
  return swift_release();
}

void sub_1000084EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v12 = (void *)Strong;
    sub_100006D0C(0, &qword_100011150);
    id v13 = a2;
    swift_unknownObjectRetain();
    id v14 = v12;
    id v15 = sub_10000866C(v13, a3, v14);
    [v15 setClientInfo:a4];
    id v16 = [v15 presentEngagement];
    aBlock[4] = a5;
    aBlock[5] = a6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000086D8;
    aBlock[3] = &unk_10000C8C0;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v16 addFinishBlock:v17];
    _Block_release(v17);
  }
}

id sub_10000866C(void *a1, uint64_t a2, void *a3)
{
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithRequest:a1 bag:a2 presentingViewController:a3];

  swift_unknownObjectRelease();
  return v5;
}

void sub_1000086D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100008764(uint64_t a1)
{
  sub_100009A18();
  __chkstk_darwin();
  sub_100009900();
  sub_10000537C((uint64_t *)&unk_100011070);
  uint64_t v3 = sub_100009A58();
  sub_100006FDC(v3);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A1E0;
  Swift::String v30 = (void *)type metadata accessor for RemoteEngagementViewController();
  id v27 = v1;
  v1;
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_100009B78();
    uint64_t v8 = v7;

    sub_100009A08();
    sub_100009960();
    sub_1000053C0(&v27, (uint64_t)v30);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v25[0] = DynamicType;
    sub_1000099E8();
    sub_100005404((uint64_t)v25);
    v33._countAndFlagsBits = 5972026;
    v33._object = (void *)0xE300000000000000;
    sub_1000099F8(v33);
    uint64_t MetatypeMetadata = &type metadata for String;
    v25[0] = v6;
    v25[1] = v8;
    sub_1000099E8();
    sub_100005404((uint64_t)v25);
    v10._countAndFlagsBits = 93;
  }
  else
  {
    sub_100009A08();
    sub_100009960();
    sub_1000053C0(&v27, (uint64_t)v30);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v25[0] = v11;
    sub_1000099E8();
    sub_100005404((uint64_t)v25);
    v10._countAndFlagsBits = 58;
  }
  v10._object = (void *)0xE100000000000000;
  sub_1000099F8(v10);
  sub_100009A28();
  type metadata accessor for Log();
  sub_100005464((uint64_t)&v27);
  sub_1000099C8();
  Swift::String v30 = &unk_10000C6F0;
  id v27 = (id)swift_allocObject();
  sub_10000940C(a1, (uint64_t)v27 + 16);
  sub_100009468(a1);
  sub_100009A38();
  sub_100005404((uint64_t)&v27);
  sub_10000583C();
  swift_bridgeObjectRelease();
  sub_10000940C(a1, (uint64_t)&v27);
  if (v32)
  {
    if (v32 == 1)
    {
      id v13 = v27;
      uint64_t v12 = v28;
      id v14 = v29;
      uint64_t v15 = (uint64_t)v30;
      uint64_t v16 = v31;
      id v17 = v29;
      swift_retain();
      id v18 = v13;
      swift_unknownObjectRetain();
      sub_100008410(v18, v12, v14, v15, v16);

      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      uint64_t v22 = (uint64_t)v27;
      uint64_t v23 = v28;
      uint64_t v24 = (uint64_t)v29;
      swift_errorRetain();
      sub_10000536C(v23);
      sub_10000828C(v22, v23, v24);
      sub_1000054B4(v23);
      swift_errorRelease();
    }
  }
  else
  {
    id v19 = v27;
    uint64_t v20 = v28;
    id v21 = v27;
    swift_errorRetain();
    sub_100007C5C(v19, v20);
    swift_errorRelease();
  }
}

id sub_100008B08()
{
  uint64_t v1 = OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter;
  type metadata accessor for RemoteEngagementPresenter();
  sub_100009930();
  id v2 = v0;
  *(void *)&v0[v1] = sub_100006BB0();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return objc_msgSendSuper2(&v4, "init");
}

id sub_100008BA0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter;
  type metadata accessor for RemoteEngagementPresenter();
  sub_100009930();
  uint64_t v7 = v3;
  *(void *)&v3[v6] = sub_100006BB0();

  if (a2)
  {
    NSString v8 = sub_100009B68();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  id v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v8, a3);

  return v9;
}

id sub_100008CCC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC26AMSEngagementViewExtension30RemoteEngagementViewController_presenter;
  type metadata accessor for RemoteEngagementPresenter();
  sub_100009930();
  objc_super v4 = v1;
  *(void *)&v1[v3] = sub_100006BB0();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  id v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

id sub_100008D84()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteEngagementViewController()
{
  return self;
}

void sub_100008DEC(void *a1, uint64_t a2, unint64_t a3, void *a4, void *a5, void (**a6)(void, void))
{
  sub_100009A18();
  __chkstk_darwin();
  LOBYTE(a3) = sub_100005A08(a1, a2, a3, a4);
  sub_10000537C((uint64_t *)&unk_100011070);
  sub_100009A58();
  if (a3)
  {
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A1E0;
    Swift::String v34 = (void *)type metadata accessor for RemoteEngagementViewController();
    v33[0] = a5;
    id v20 = a5;
    id v21 = (id)AMSLogKey();
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = sub_100009B78();
      uint64_t v25 = v24;

      sub_100009A08();
      v37._countAndFlagsBits = 0;
      v37._object = (void *)0xE000000000000000;
      sub_1000099F8(v37);
      sub_1000053C0(v33, (uint64_t)v34);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v30 = DynamicType;
      sub_1000099E8();
      sub_100005404((uint64_t)&v30);
      v38._countAndFlagsBits = 5972026;
      v38._object = (void *)0xE300000000000000;
      sub_1000099F8(v38);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v30 = v23;
      uint64_t v31 = v25;
      sub_1000099E8();
      sub_100005404((uint64_t)&v30);
      v27._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v40._countAndFlagsBits = 0;
      v40._object = (void *)0xE000000000000000;
      sub_1000099F8(v40);
      sub_1000053C0(v33, (uint64_t)v34);
      uint64_t v29 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v30 = v29;
      sub_1000099E8();
      sub_100005404((uint64_t)&v30);
      v27._countAndFlagsBits = 58;
    }
    v27._object = (void *)0xE100000000000000;
    sub_1000099F8(v27);
    sub_100009A28();
    type metadata accessor for Log();
    sub_100005464((uint64_t)v33);
    sub_1000099C8();
    Swift::String v34 = &unk_10000C838;
    sub_100009A38();
    sub_100005404((uint64_t)v33);
    sub_100005678();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000A290;
    Swift::String v34 = (void *)type metadata accessor for RemoteEngagementViewController();
    v33[0] = a5;
    id v12 = a5;
    id v13 = (id)AMSLogKey();
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = sub_100009B78();
      uint64_t v17 = v16;

      sub_100009A08();
      v35._countAndFlagsBits = 0;
      v35._object = (void *)0xE000000000000000;
      sub_1000099F8(v35);
      sub_1000053C0(v33, (uint64_t)v34);
      uint64_t v18 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v30 = v18;
      sub_1000099E8();
      sub_100005404((uint64_t)&v30);
      v36._countAndFlagsBits = 5972026;
      v36._object = (void *)0xE300000000000000;
      sub_1000099F8(v36);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v30 = v15;
      uint64_t v31 = v17;
      sub_1000099E8();
      sub_100005404((uint64_t)&v30);
      v19._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009A08();
      v39._countAndFlagsBits = 0;
      v39._object = (void *)0xE000000000000000;
      sub_1000099F8(v39);
      sub_1000053C0(v33, (uint64_t)v34);
      uint64_t v28 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v30 = v28;
      sub_1000099E8();
      sub_100005404((uint64_t)&v30);
      v19._countAndFlagsBits = 58;
    }
    v19._object = (void *)0xE100000000000000;
    sub_1000099F8(v19);
    sub_100009A28();
    type metadata accessor for Log();
    sub_100005464((uint64_t)v33);
    sub_1000099C8();
    sub_10000583C();
    swift_bridgeObjectRelease();
    sub_100005E94();
  }
  a6[2](a6, 0);
  _Block_release(a6);
}

uint64_t sub_1000093B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100006DA0(a1, a2);
  }
  return a1;
}

uint64_t sub_1000093C8()
{
  sub_10000686C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  return _swift_deallocObject(v0, 57, 7);
}

uint64_t sub_10000940C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009468(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000094A0()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000094D8()
{
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

void sub_100009530()
{
  sub_1000084EC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_100009540(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009550()
{
  return swift_release();
}

uint64_t sub_100009558()
{
  swift_release();
  swift_errorRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000095A8()
{
  sub_100008348(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1000095B4()
{
  swift_errorRelease();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000095F4(void **a1)
{
  sub_100007D78(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000095FC()
{
  return sub_100007E50();
}

uint64_t sub_100009604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000537C((uint64_t *)&unk_100010D30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000966C()
{
  unint64_t result = qword_1000111C8;
  if (!qword_1000111C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000111C8);
  }
  return result;
}

void sub_1000096B8(uint64_t a1)
{
}

unint64_t sub_1000096C0()
{
  unint64_t result = qword_1000111E8;
  if (!qword_1000111E8)
  {
    sub_100009714(&qword_1000111E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000111E8);
  }
  return result;
}

uint64_t sub_100009714(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000975C()
{
  unint64_t result = qword_1000111F0;
  if (!qword_1000111F0)
  {
    type metadata accessor for RemoteEngagementPresenter();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000111F0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RemoteEngagementViewController.RemoteViewControllerProxyError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100009848);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteEngagementViewController.RemoteViewControllerProxyError()
{
  return &type metadata for RemoteEngagementViewController.RemoteViewControllerProxyError;
}

unint64_t sub_100009884()
{
  unint64_t result = qword_1000111F8;
  if (!qword_1000111F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000111F8);
  }
  return result;
}

uint64_t sub_100009918()
{
  return swift_unknownObjectWeakInit();
}

uint64_t sub_100009930()
{
  return swift_allocObject();
}

uint64_t sub_100009948()
{
  return swift_allocObject();
}

void sub_100009960()
{
  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  sub_1000099F8(v1);
}

uint64_t sub_100009978(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100009988()
{
  return _convertErrorToNSError(_:)();
}

NSData sub_100009998()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000099A8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000099B8()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000099C8()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_1000099D8()
{
  return static LogMessage.isRedactionEnabled.getter();
}

uint64_t sub_1000099E8()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

void sub_1000099F8(Swift::String a1)
{
}

uint64_t sub_100009A08()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009A18()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_100009A28()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_100009A38()
{
  return static LogMessage.safe(_:)();
}

uint64_t sub_100009A48()
{
  return static LogMessage.describe(contentsOf:withRedaction:separator:)();
}

uint64_t sub_100009A58()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_100009A68()
{
  return dispatch thunk of static EventEmitter.defaultScheduler.getter();
}

uint64_t sub_100009A78()
{
  return EventEmitter.addObserver(on:singleUse:_:)();
}

void sub_100009A88()
{
}

void sub_100009A98()
{
}

void sub_100009AA8()
{
}

void sub_100009AB8()
{
}

uint64_t sub_100009AC8()
{
  return ViewControllerPresenter.viewWillDisappear(forReason:)();
}

void sub_100009AD8()
{
}

uint64_t sub_100009AE8()
{
  return static ViewWillDisappearReason.inferred(for:)();
}

uint64_t sub_100009AF8()
{
  return type metadata accessor for ViewWillDisappearReason();
}

uint64_t sub_100009B08()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_100009B18()
{
  return Promise.reject(_:)();
}

uint64_t sub_100009B28()
{
  return Promise.resolve(_:)();
}

uint64_t sub_100009B38()
{
  return Promise.__allocating_init()();
}

uint64_t sub_100009B48()
{
  return SyncEvent.post(_:)();
}

uint64_t sub_100009B58()
{
  return SyncEvent.init()();
}

NSString sub_100009B68()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009B78()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009B88()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009B98()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009BA8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100009BB8()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100009BC8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100009BD8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009BE8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009BF8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100009C08()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100009C18()
{
  return Error._code.getter();
}

uint64_t sub_100009C28()
{
  return Error._domain.getter();
}

uint64_t sub_100009C38()
{
  return Error._userInfo.getter();
}

uint64_t sub_100009C48()
{
  return Hasher.init(_seed:)();
}

void sub_100009C58(Swift::UInt a1)
{
}

Swift::Int sub_100009C68()
{
  return Hasher._finalize()();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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