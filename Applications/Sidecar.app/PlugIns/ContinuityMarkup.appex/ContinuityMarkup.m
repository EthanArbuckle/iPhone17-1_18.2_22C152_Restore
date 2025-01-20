uint64_t sub_100005110()
{
  uint64_t v0;

  v0 = sub_10000A1A0();
  sub_100009230(v0, qword_100010AD8);
  sub_100008F60(v0, (uint64_t)qword_100010AD8);
  return sub_10000A190();
}

uint64_t sub_100005184(uint64_t a1)
{
  return sub_10000935C(a1, OBJC_IVAR___AnnotationViewController_doneButton);
}

id sub_100005190()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_10000A200();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithTitle:v1];

  return v2;
}

uint64_t sub_10000520C(uint64_t a1)
{
  return sub_10000935C(a1, OBJC_IVAR___AnnotationViewController_akStream);
}

uint64_t sub_100005218(uint64_t a1)
{
  return sub_10000935C(a1, OBJC_IVAR___AnnotationViewController_markupStream);
}

id sub_100005268()
{
  return *(id *)(v0 + OBJC_IVAR___AnnotationViewController__navigationItem);
}

id sub_100005278()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AnnotationViewController();
  return [super dealloc];
}

void sub_1000053A0()
{
  id v1 = (objc_class *)type metadata accessor for AnnotationViewController();
  v41.receiver = v0;
  v41.super_class = v1;
  [super viewDidLoad];
  id v2 = [v0 view];
  if (v2)
  {
    objc_super v3 = v2;
    v4 = *(void **)&v0[OBJC_IVAR___AnnotationViewController__navigationItem];
    sub_100008D90(v0);
    if (v5)
    {
      NSString v6 = sub_10000A200();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v6 = 0;
    }
    [v4 setTitle:v6];

    *((void *)&v40 + 1) = v1;
    *(void *)&long long v39 = v0;
    id v7 = objc_allocWithZone((Class)UIBarButtonItem);
    v8 = v0;
    id v9 = sub_100008184(0, &v39, (uint64_t)"done:");
    id v10 = v9;
    sub_100005184((uint64_t)v9);
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = objc_allocWithZone((Class)UIBarButtonItem);
    id v12 = sub_100008184(6, &v39, 0);
    [v12 setWidth:40.0];
    sub_100007FF8(&qword_100010C08);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10000A930;
    *(void *)(v13 + 32) = v10;
    *(void *)(v13 + 40) = v12;
    *(void *)&long long v39 = v13;
    sub_10000A250();
    uint64_t v14 = v39;
    id v38 = v10;
    id v37 = v12;
    sub_100008DF4(v14, v4);
    v15 = *(void **)&v8[OBJC_IVAR___AnnotationViewController_markupViewController];
    id v16 = [v15 view];
    if (v16)
    {
      v17 = v16;
      v18 = self;
      id v19 = [v18 systemBackgroundColor];
      [v3 setBackgroundColor:v19];

      id v20 = [v18 systemBackgroundColor];
      [v15 setBackgroundColor:v20];

      [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v8 addChildViewController:v15];
      [v3 addSubview:v17];
      id v21 = [v3 topAnchor];
      id v35 = [v3 leftAnchor];
      id v33 = [v3 bottomAnchor];
      v36 = v8;
      id v22 = [v3 rightAnchor];
      id v34 = self;
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_10000A940;
      id v24 = [v17 leftAnchor];
      id v25 = [v24 constraintEqualToAnchor:v35];

      *(void *)(v23 + 32) = v25;
      id v26 = [v17 topAnchor];
      id v27 = [v26 constraintEqualToAnchor:v21];

      *(void *)(v23 + 40) = v27;
      id v28 = [v17 rightAnchor];
      id v29 = [v22 constraintEqualToAnchor:v28];

      *(void *)(v23 + 48) = v29;
      id v30 = [v17 bottomAnchor];
      id v31 = [v33 constraintEqualToAnchor:v30];

      *(void *)(v23 + 56) = v31;
      *(void *)&long long v39 = v23;
      sub_10000A250();
      sub_100009294(0, &qword_100010C30);
      Class isa = sub_10000A230().super.isa;
      swift_bridgeObjectRelease();
      [v34 activateConstraints:isa];

      [v3 layoutIfNeeded];
      [v17 becomeFirstResponder];
      [v15 didMoveToParentViewController:v36];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1000058D8(void *a1)
{
  id v2 = v1;
  if (qword_100010AD0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000A1A0();
  sub_100008F60(v4, (uint64_t)qword_100010AD8);
  uint64_t v5 = sub_10000A180();
  os_log_type_t v6 = sub_10000A260();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)id v7 = 136446210;
    sub_100008470(0xD000000000000013, 0x800000010000B270, &aBlock);
    sub_100009404();
    sub_10000A2A0();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  NSString v8 = sub_10000A200();
  uint64_t v9 = sub_1000093A8();
  *(void *)(v9 + 16) = v2;
  id v20 = sub_100008F98;
  uint64_t v21 = v9;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  v18 = sub_100006158;
  id v19 = &unk_10000C690;
  id v10 = _Block_copy(&aBlock);
  id v11 = v2;
  swift_release();
  [a1 openStreamForType:2 identifier:v8 completion:v10];
  _Block_release(v10);

  NSString v12 = sub_10000A200();
  uint64_t v13 = sub_1000093A8();
  *(void *)(v13 + 16) = v11;
  id v20 = sub_100008FA0;
  uint64_t v21 = v13;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  v18 = sub_100006158;
  id v19 = &unk_10000C6E0;
  uint64_t v14 = _Block_copy(&aBlock);
  id v15 = v11;
  swift_release();
  [a1 openStreamForType:2 identifier:v12 completion:v14];
  _Block_release(v14);
}

void sub_100005BEC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10000A1A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v30 = sub_100009134;
    uint64_t v31 = v11;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    id v28 = sub_100006050;
    id v29 = &unk_10000C7F8;
    NSString v12 = _Block_copy(&aBlock);
    id v13 = a1;
    swift_release();
    [v13 setHandler:v12];
    _Block_release(v12);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    id v30 = sub_100009174;
    uint64_t v31 = v14;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    id v28 = sub_1000060EC;
    id v29 = &unk_10000C848;
    id v15 = _Block_copy(&aBlock);
    id v16 = a3;
    swift_release();
    [v13 activateWithCompletion:v15];
    _Block_release(v15);
    id v17 = v13;
    sub_10000520C((uint64_t)a1);
  }
  else if (a2)
  {
    swift_errorRetain();
    if (qword_100010AD0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100008F60(v6, (uint64_t)qword_100010AD8);
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v18, v6);
    __chkstk_darwin(v19, v20);
    *(&v24 - 2) = a2;
    sub_100009438((uint64_t (*)(void))sub_100005FF0, 0, (void (*)(void))sub_10000932C);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_errorRelease();
  }
  else
  {
    if (qword_100010AD0 != -1) {
      swift_once();
    }
    sub_100008F60(v6, (uint64_t)qword_100010AD8);
    os_log_t v25 = (os_log_t)sub_10000A180();
    os_log_type_t v21 = sub_10000A270();
    if (os_log_type_enabled(v25, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v21, "AKSidecarController Stream Failed", v22, 2u);
      swift_slowDealloc();
    }
    os_log_t v23 = v25;
  }
}

unint64_t sub_100005FF0()
{
  return 0xD000000000000021;
}

uint64_t sub_10000600C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100006050(uint64_t a1, uint64_t a2)
{
  objc_super v3 = *(void (**)(long long *))(a1 + 32);
  if (a2)
  {
    *((void *)&v6 + 1) = swift_getObjectType();
    *(void *)&long long v5 = a2;
  }
  else
  {
    long long v5 = 0u;
    long long v6 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v3(&v5);
  swift_release();
  return sub_100008410((uint64_t)&v5);
}

unint64_t sub_1000060D0()
{
  return 0xD00000000000002CLL;
}

void sub_1000060EC(uint64_t a1, void *a2)
{
  objc_super v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100006158(uint64_t a1, void *a2, void *a3)
{
  long long v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1000061E4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10000A1A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v30 = sub_100009010;
    uint64_t v31 = v11;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    id v28 = sub_100006050;
    id v29 = &unk_10000C730;
    NSString v12 = _Block_copy(&aBlock);
    id v13 = a1;
    swift_release();
    [v13 setHandler:v12];
    _Block_release(v12);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    id v30 = sub_100009050;
    uint64_t v31 = v14;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    id v28 = sub_1000060EC;
    id v29 = &unk_10000C780;
    id v15 = _Block_copy(&aBlock);
    id v16 = a3;
    swift_release();
    [v13 activateWithCompletion:v15];
    _Block_release(v15);
    id v17 = v13;
    sub_100005218((uint64_t)a1);
  }
  else if (a2)
  {
    swift_errorRetain();
    if (qword_100010AD0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100008F60(v6, (uint64_t)qword_100010AD8);
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v18, v6);
    __chkstk_darwin(v19, v20);
    *(&v24 - 2) = a2;
    sub_100009438((uint64_t (*)(void))sub_1000065E8, 0, (void (*)(void))sub_100008FAC);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_errorRelease();
  }
  else
  {
    if (qword_100010AD0 != -1) {
      swift_once();
    }
    sub_100008F60(v6, (uint64_t)qword_100010AD8);
    os_log_t v25 = (os_log_t)sub_10000A180();
    os_log_type_t v21 = sub_10000A270();
    if (os_log_type_enabled(v25, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v21, "MarkupController Stream Failed", v22, 2u);
      swift_slowDealloc();
    }
    os_log_t v23 = v25;
  }
}

unint64_t sub_1000065E8()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_100006604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_10000A1B0();
  sub_100009340();
  uint64_t v12 = v11;
  __chkstk_darwin(v13, v14);
  uint64_t v15 = sub_100009380();
  sub_100009340();
  uint64_t v17 = v16;
  __chkstk_darwin(v18, v19);
  sub_100009368();
  sub_100009094(a1, (uint64_t)&aBlock);
  if (!v30) {
    return sub_100008410((uint64_t)&aBlock);
  }
  sub_100008EE0(&aBlock, v34);
  sub_100009294(0, &qword_100010BE8);
  uint64_t v26 = v15;
  uint64_t v20 = (void *)sub_10000A280();
  sub_100008128((uint64_t)v34, (uint64_t)v33);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a2;
  sub_100008EE0(v33, (_OWORD *)(v21 + 24));
  uint64_t v31 = a4;
  uint64_t v32 = v21;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  id v29 = sub_10000600C;
  uint64_t v30 = a5;
  id v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  sub_10000A1C0();
  *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
  sub_100007FA8();
  sub_100007FF8(&qword_100010BF8);
  unint64_t v23 = sub_10000803C();
  sub_1000093C0((uint64_t)&aBlock, v24, v23);
  sub_10000A290();
  _Block_release(v22);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v5, v10);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v6, v26);
  return sub_1000080D8((uint64_t)v34);
}

void sub_100006854(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    a3(a2);
  }
}

void sub_1000068C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(void))
{
  uint64_t v8 = sub_10000A1A0();
  sub_100009340();
  uint64_t v10 = v9;
  __chkstk_darwin(v11, v12);
  sub_100009368();
  if (a1)
  {
    swift_errorRetain();
    if (qword_100010AD0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100008F60(v8, (uint64_t)qword_100010AD8);
    uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v4, v13, v8);
    __chkstk_darwin(v14, v15);
    sub_100009438(a3, 0, a4);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v8);
    swift_errorRelease();
  }
}

unint64_t sub_100006A14()
{
  return 0xD000000000000029;
}

uint64_t sub_100006A30()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    [Strong completeRequest:2];
  }
  sub_10000520C(0);

  return sub_100005218(0);
}

void sub_100006B00(void *a1)
{
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR___AnnotationViewController_markupViewController), "annotationController"));
  if (v3)
  {
    id v6 = v3;
    id v4 = sub_100008F18(v3);
    if (v4)
    {
      uint64_t v5 = v4;
      sub_100008378(a1, a1[3]);
      [v5 handleIncomingOPACKObject:sub_10000A370()];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

void sub_100006BF8(void *a1)
{
  id v3 = self;
  sub_100008378(a1, a1[3]);
  uint64_t v4 = sub_10000A370();
  uint64_t v5 = sub_1000093A8();
  *(void *)(v5 + 16) = v1;
  v15[4] = sub_100008EF0;
  v15[5] = v5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100006DD0;
  v15[3] = &unk_10000C640;
  id v6 = _Block_copy(v15);
  uint64_t v7 = v1;
  swift_release();
  unsigned int v8 = [v3 validateInitialMessage:v4 applicationData:v6];
  _Block_release(v6);
  swift_unknownObjectRelease();
  if (v8
    && (id v9 = [*(id *)&v7[OBJC_IVAR___AnnotationViewController_markupViewController] annotationController]) != 0&& (v10 = v9, v11 = objc_msgSend(v9, "sidecarController"), v10, v11))
  {
    [v11 setDelegate:v7];

    v7[OBJC_IVAR___AnnotationViewController_handledSetupMessage] = 1;
  }
  else
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v13 = Strong;
      id v14 = [Strong request];

      [v14 cancel];
    }
  }
}

uint64_t sub_100006DD0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_10000A1F0();
  swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

void sub_100006E50(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000A350();
    swift_bridgeObjectRelease();
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      return;
    }
  }
  uint64_t v4 = OBJC_IVAR___AnnotationViewController_handledSetupMessage;
  if (v1[OBJC_IVAR___AnnotationViewController_handledSetupMessage] == 1)
  {
    id v5 = [*(id *)&v1[OBJC_IVAR___AnnotationViewController_markupViewController] annotationController];
    if (!v5) {
      return;
    }
    id v6 = v5;
    id v7 = [v5 sidecarController];

    if (!v7) {
      return;
    }
    if (v3 >= 1)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v3; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v9 = (id)sub_10000A320();
        }
        else {
          id v9 = *(id *)(a1 + 8 * i + 32);
        }
        uint64_t v10 = v9;
        if ([v9 objectValue])
        {
          sub_10000A2C0();
          swift_unknownObjectRelease();
          sub_100008EE0(&v30, &v24);
          sub_100008378(&v24, (uint64_t)v26);
          [v7 handleIncomingOPACKObject:sub_10000A370()];

          swift_unknownObjectRelease();
          sub_1000080D8((uint64_t)&v24);
        }
        else
        {
        }
      }

      swift_bridgeObjectRelease();
      return;
    }
LABEL_37:
    __break(1u);
    return;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v11 = (id)sub_10000A320();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_37;
    }
    id v11 = *(id *)(a1 + 32);
  }
  id v12 = [v11 objectValue];

  if (v12)
  {
    sub_10000A2C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v29, 0, sizeof(v29));
  }
  sub_100008E78((uint64_t)v29, (uint64_t)&v24);
  if (v26)
  {
    sub_100008EE0(&v24, &v30);
    uint64_t v13 = self;
    sub_100008378(&v30, v31);
    uint64_t v14 = sub_10000A370();
    uint64_t v15 = sub_1000093A8();
    *(void *)(v15 + 16) = v1;
    uint64_t v27 = sub_1000092D0;
    uint64_t v28 = v15;
    *(void *)&long long v24 = _NSConcreteStackBlock;
    *((void *)&v24 + 1) = 1107296256;
    os_log_t v25 = sub_100006DD0;
    uint64_t v26 = &unk_10000C5F0;
    uint64_t v16 = _Block_copy(&v24);
    uint64_t v17 = v1;
    swift_release();
    LODWORD(v13) = [v13 validateInitialMessage:v14 applicationData:v16];
    _Block_release(v16);
    swift_unknownObjectRelease();
    if (v13)
    {
      id v18 = [*(id *)&v17[OBJC_IVAR___AnnotationViewController_markupViewController] annotationController];
      if (v18)
      {
        uint64_t v19 = v18;
        id v20 = [v18 sidecarController];

        if (v20)
        {
          [v20 setDelegate:v17];

          v1[v4] = 1;
        }
      }
      sub_1000080D8((uint64_t)&v30);
      return;
    }
    sub_1000080D8((uint64_t)&v30);
  }
  else
  {
    sub_100008410((uint64_t)&v24);
  }
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v22 = Strong;
    id v23 = [Strong request];

    [v23 cancel];
  }
}

uint64_t sub_100007278()
{
  Class isa = sub_10000A1E0().super.isa;
  AKSidecarMarkupGetApplicationFromDictionary();

  return 0;
}

double sub_1000074D4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100008C28(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100008128(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_100007538(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR___AnnotationViewController_markupViewController;
  type metadata accessor for _MarkupViewController();
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unsigned int v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  *(void *)&v8[OBJC_IVAR___AnnotationViewController_doneButton] = 0;
  v8[OBJC_IVAR___AnnotationViewController_handledSetupMessage] = 0;
  uint64_t v9 = OBJC_IVAR___AnnotationViewController__navigationItem;
  sub_100009294(0, &qword_100010C28);
  *(void *)&v8[v9] = sub_1000093E4();
  *(void *)&v8[OBJC_IVAR___AnnotationViewController_akStream] = 0;
  *(void *)&v8[OBJC_IVAR___AnnotationViewController_markupStream] = 0;

  if (a2)
  {
    NSString v10 = sub_10000A200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for AnnotationViewController();
  id v11 = [super initWithNibName:v10 bundle:a3];

  return v11;
}

id sub_100007690(void *a1)
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR___AnnotationViewController_markupViewController;
  type metadata accessor for _MarkupViewController();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  *(void *)&v5[OBJC_IVAR___AnnotationViewController_doneButton] = 0;
  v5[OBJC_IVAR___AnnotationViewController_handledSetupMessage] = 0;
  uint64_t v6 = OBJC_IVAR___AnnotationViewController__navigationItem;
  sub_100009294(0, &qword_100010C28);
  *(void *)&v5[v6] = sub_1000093E4();
  *(void *)&v5[OBJC_IVAR___AnnotationViewController_akStream] = 0;
  *(void *)&v5[OBJC_IVAR___AnnotationViewController_markupStream] = 0;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for AnnotationViewController();
  [super initWithCoder:a1];

  return v7;
}

uint64_t type metadata accessor for AnnotationViewController()
{
  return self;
}

void sub_1000077E0(uint64_t a1, uint64_t a2)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = Strong;
    id v5 = [Strong request];

    if (v5)
    {
      sub_100007FF8(&qword_100010C08);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_10000A950;
      sub_100008128(a2, (uint64_t)v9);
      id v7 = objc_allocWithZone((Class)SidecarItem);
      *(void *)(v6 + 32) = sub_1000082DC(v9);
      v9[0] = v6;
      sub_10000A250();
      sub_100009294(0, &qword_100010C10);
      Class isa = sub_10000A230().super.isa;
      swift_bridgeObjectRelease();
      [v5 sendItems:isa complete:0];
    }
  }
}

uint64_t sub_100007978()
{
  uint64_t v3 = sub_10000A1B0();
  sub_100009340();
  uint64_t v5 = v4;
  __chkstk_darwin(v6, v7);
  uint64_t v8 = sub_100009380();
  sub_100009340();
  uint64_t v10 = v9;
  __chkstk_darwin(v11, v12);
  sub_100009368();
  sub_100009294(0, &qword_100010BE8);
  objc_super v13 = (void *)sub_10000A280();
  uint64_t v14 = sub_1000093A8();
  *(void *)(v14 + 16) = v0;
  aBlock[4] = sub_100007F88;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000600C;
  aBlock[3] = &unk_10000C5A0;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v0;
  swift_release();
  sub_10000A1C0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100007FA8();
  sub_100007FF8(&qword_100010BF8);
  unint64_t v17 = sub_10000803C();
  sub_1000093C0((uint64_t)aBlock, v18, v17);
  sub_10000A290();
  _Block_release(v15);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v2, v8);
}

void sub_100007B70()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong request];

    [v2 cancel];
  }
}

double sub_100007C94()
{
  return *(double *)(v0 + OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize);
}

id sub_100007CA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = &v3[OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  if (a2)
  {
    NSString v6 = sub_10000A200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for _MarkupViewController();
  [super initWithNibName:v6 bundle:a3];

  return v7;
}

uint64_t sub_100007D50(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    uint64_t v7 = sub_10000A210();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a4;
  return a5(v7, v9, a4);
}

id sub_100007DC4(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize];
  uint64_t v4 = (objc_class *)type metadata accessor for _MarkupViewController();
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  [super initWithCoder:a1];

  return v5;
}

id sub_100007E54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _MarkupViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for _MarkupViewController()
{
  return self;
}

__n128 sub_100007EAC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100007EBC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007EDC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_100010BE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010BE0);
    }
  }
}

uint64_t sub_100007F50()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007F88()
{
}

uint64_t sub_100007F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007FA0()
{
  return swift_release();
}

unint64_t sub_100007FA8()
{
  unint64_t result = qword_100010BF0;
  if (!qword_100010BF0)
  {
    sub_10000A1B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BF0);
  }
  return result;
}

uint64_t sub_100007FF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000803C()
{
  unint64_t result = qword_100010C00;
  if (!qword_100010C00)
  {
    sub_100008090(&qword_100010BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010C00);
  }
  return result;
}

uint64_t sub_100008090(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000080D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100008184(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[3];
  if (v6)
  {
    uint64_t v8 = sub_100008378(a2, a2[3]);
    uint64_t v9 = *(void *)(v6 - 8);
    __chkstk_darwin(v8, v8);
    uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_10000A370();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    sub_1000080D8((uint64_t)a2);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [v3 initWithBarButtonSystemItem:a1 target:v12 action:a3];
  swift_unknownObjectRelease();
  return v13;
}

id sub_1000082DC(void *a1)
{
  sub_100008378(a1, a1[3]);
  uint64_t v3 = sub_10000A370();
  NSString v4 = sub_10000A200();
  swift_bridgeObjectRelease();
  id v5 = [v1 initWithObject:v3 type:v4];
  swift_unknownObjectRelease();

  sub_1000080D8((uint64_t)a1);
  return v5;
}

void *sub_100008378(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000083BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008410(uint64_t a1)
{
  uint64_t v2 = sub_100007FF8(&qword_100010C18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008470(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008544(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008128((uint64_t)v12, *a3);
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
      sub_100008128((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000080D8((uint64_t)v12);
  return v7;
}

uint64_t sub_100008544(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000869C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_10000A2B0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100008774(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_10000A330();
    if (!v8)
    {
      uint64_t result = sub_10000A340();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_10000869C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10000A360();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100008774(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10000880C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000089E8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000089E8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000880C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_10000A220();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_100008980(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_10000A310();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_10000A360();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_10000A340();
  __break(1u);
  return result;
}

void *sub_100008980(uint64_t a1, uint64_t a2)
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
  sub_100007FF8(&qword_100010C20);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000089E8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100007FF8(&qword_100010C20);
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
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100008B98(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100008AC0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100008AC0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_10000A360();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100008B98(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_10000A360();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_100008C28(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10000A2E0(*(void *)(v2 + 40));

  return sub_100008C6C(a1, v4);
}

unint64_t sub_100008C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100008D34(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10000A2F0();
      sub_1000083BC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100008D34(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100008D90(void *a1)
{
  id v1 = [a1 title];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_10000A210();

  return v3;
}

void sub_100008DF4(uint64_t a1, void *a2)
{
  sub_100009294(0, &qword_100010C38);
  Class isa = sub_10000A230().super.isa;
  swift_bridgeObjectRelease();
  [a2 setRightBarButtonItems:isa];
}

uint64_t sub_100008E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FF8(&qword_100010C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100008EE0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008EF0()
{
  return sub_100007278() & 1;
}

id sub_100008F18(void *a1)
{
  id v1 = a1;
  long long v2 = [v1 sidecarController];

  return v2;
}

uint64_t sub_100008F60(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_100008F98(void *a1, uint64_t a2)
{
  sub_100005BEC(a1, a2, *(void **)(v2 + 16));
}

void sub_100008FA0(void *a1, uint64_t a2)
{
  sub_1000061E4(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100008FAC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_errorRetain();
  return v1;
}

uint64_t sub_100008FD8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009010(uint64_t a1)
{
  return sub_100006604(a1, v1, (uint64_t)&unk_10000C7B8, (uint64_t)sub_100009100, (uint64_t)&unk_10000C7D0);
}

void sub_100009050(uint64_t a1)
{
  sub_1000068C4(a1, *(void *)(v1 + 16), (uint64_t (*)(void))sub_100006A14, (void (*)(void))sub_10000932C);
}

uint64_t sub_100009094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FF8(&qword_100010C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_100009100()
{
  sub_100006854(*(void *)(v0 + 16), v0 + 24, (void (*)(uint64_t))sub_100006BF8);
}

uint64_t sub_100009134(uint64_t a1)
{
  return sub_100006604(a1, v1, (uint64_t)&unk_10000C880, (uint64_t)sub_1000091FC, (uint64_t)&unk_10000C898);
}

void sub_100009174(uint64_t a1)
{
  sub_1000068C4(a1, *(void *)(v1 + 16), (uint64_t (*)(void))sub_1000060D0, (void (*)(void))sub_10000932C);
}

uint64_t sub_1000091BC()
{
  swift_release();
  sub_1000080D8(v0 + 24);

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000091FC()
{
  sub_100006854(*(void *)(v0 + 16), v0 + 24, (void (*)(uint64_t))sub_100006B00);
}

uint64_t *sub_100009230(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009294(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000935C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

uint64_t sub_100009380()
{
  return type metadata accessor for DispatchQoS(0);
}

uint64_t sub_1000093A8()
{
  return swift_allocObject();
}

uint64_t sub_1000093C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of SetAlgebra.init<A>(_:)(a1, v4, a3, v3, v5);
}

id sub_1000093E4()
{
  return sub_100005190();
}

uint64_t sub_100009418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  return _swift_dynamicCast(&a9, &a16, v16 + 8, a4, 6);
}

void sub_100009438(uint64_t (*a1)(void), uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v4 = (void *)sub_10000A170();
  swift_errorRelease();
  id v5 = [v4 localizedDescription];
  uint64_t v6 = sub_10000A210();
  unint64_t v8 = v7;

  uint64_t v9 = a1();
  if (v10)
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    id v27 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v13 = sub_10000A180();
    os_log_type_t v14 = sub_10000A270();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136446979;
      swift_bridgeObjectRetain();
      sub_100008470(v11, v12, &v28);
      sub_10000A2A0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2082;
      id v16 = [v27 domain];
      uint64_t v17 = v6;
      uint64_t v18 = sub_10000A210();
      unint64_t v20 = v19;

      sub_100008470(v18, v20, &v28);
      sub_10000A2A0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2048;
      [v27 code];

      sub_10000A2A0();
      *(_WORD *)(v15 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_100008470(v17, v8, &v28);
      sub_10000A2A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v15, 0x2Au);
      swift_arrayDestroy();
LABEL_6:
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v27 = v4;
    swift_bridgeObjectRetain();
    id v13 = sub_10000A180();
    os_log_type_t v21 = sub_10000A270();
    if (os_log_type_enabled(v13, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446723;
      id v23 = [v27 domain];
      uint64_t v24 = sub_10000A210();
      unint64_t v26 = v25;

      sub_100008470(v24, v26, &v28);
      sub_100009934();

      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2048;
      [v27 code];

      sub_100009934();
      *(_WORD *)(v22 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_100008470(v6, v8, &v28);
      sub_100009934();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v21, "%{public}s (%ld) %{private}s", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t sub_100009934()
{
  return sub_10000A2A0();
}

void sub_100009958()
{
  uint64_t v1 = v0;
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for AnnotationRootController();
  [super viewDidLoad];
  id v2 = [v0 view];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void **)&v0[OBJC_IVAR___AnnotationRootController__navigationController];
    id v5 = [v4 view];
    if (v5)
    {
      uint64_t v6 = v5;
      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v0 addChildViewController:v4];
      [v3 addSubview:v6];
      unint64_t v7 = self;
      sub_100007FF8(&qword_100010C08);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_10000A940;
      id v9 = [v6 leftAnchor];
      id v10 = [v3 leftAnchor];
      id v11 = sub_10000A134();

      *(void *)(v8 + 32) = v11;
      id v12 = [v6 rightAnchor];
      id v13 = [v3 rightAnchor];
      id v14 = sub_10000A134();

      *(void *)(v8 + 40) = v14;
      id v15 = [v6 topAnchor];
      id v16 = [v3 topAnchor];
      id v17 = sub_10000A134();

      *(void *)(v8 + 48) = v17;
      id v18 = [v6 bottomAnchor];
      id v19 = [v3 bottomAnchor];
      id v20 = sub_10000A134();

      *(void *)(v8 + 56) = v20;
      sub_10000A250();
      sub_100009294(0, &qword_100010C30);
      Class isa = sub_10000A230().super.isa;
      swift_bridgeObjectRelease();
      [v7 activateConstraints:isa];

      [v4 didMoveToParentViewController:v1];
      uint64_t v22 = *(void *)&v1[OBJC_IVAR___AnnotationRootController_markupController];
      swift_unknownObjectWeakAssign();
      [v4 pushViewController:v22 animated:0];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100009CB8(void *a1)
{
}

void sub_100009D4C(unint64_t a1)
{
}

id sub_100009DF4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = OBJC_IVAR___AnnotationRootController__navigationController;
  id v8 = objc_allocWithZone((Class)UINavigationController);
  id v9 = v3;
  *(void *)&v3[v7] = sub_10000A150();
  uint64_t v10 = OBJC_IVAR___AnnotationRootController_markupController;
  type metadata accessor for AnnotationViewController();
  *(void *)&v4[v10] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  if (a2)
  {
    NSString v11 = sub_10000A200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for AnnotationRootController();
  [super initWithNibName:v11 bundle:a3];

  return v12;
}

id sub_100009F44(void *a1)
{
  uint64_t v4 = OBJC_IVAR___AnnotationRootController__navigationController;
  id v5 = objc_allocWithZone((Class)UINavigationController);
  uint64_t v6 = v1;
  *(void *)&v1[v4] = sub_10000A150();
  uint64_t v7 = OBJC_IVAR___AnnotationRootController_markupController;
  type metadata accessor for AnnotationViewController();
  *(void *)&v2[v7] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for AnnotationRootController();
  [super initWithCoder:a1];

  return v8;
}

id sub_10000A020()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnnotationRootController();
  return [super dealloc];
}

uint64_t type metadata accessor for AnnotationRootController()
{
  return self;
}

id sub_10000A0C4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_10000A200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [v3 initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_10000A134()
{
  uint64_t v4 = *(const char **)(v0 + 1848);
  return [v1 v4:v2];
}

id sub_10000A150()
{
  return sub_10000A0C4(0, 0, 0);
}

uint64_t sub_10000A170()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000A180()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A190()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A1A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000A1B0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10000A1C0()
{
  return static DispatchQoS.unspecified.getter();
}

NSDictionary sub_10000A1E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A1F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_10000A200()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A210()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_10000A220()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10000A230()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000A240()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A250()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000A260()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000A270()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A280()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10000A290()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10000A2A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A2B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A2C0()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_10000A2E0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10000A2F0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10000A300()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10000A310()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A320()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A330()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A340()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A350()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000A360()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A370()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t AKSidecarMarkupGetApplicationFromDictionary()
{
  return _AKSidecarMarkupGetApplicationFromDictionary();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

id objc_msgSend_sidecarController(void *a1, const char *a2, ...)
{
  return _[a1 sidecarController];
}