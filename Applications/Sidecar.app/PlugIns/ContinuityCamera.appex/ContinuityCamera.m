id sub_100002018()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CameraMainViewController();
  [super dealloc];
}

void sub_1000020C4()
{
  id v2 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v1 = [self blackColor];
  [v2 setBackgroundColor:v1];

  [v0 setView:v2];
}

void sub_1000021C8(void *a1)
{
  id v2 = v1;
  id v3 = a1;
  id v4 = *(id *)&v1[OBJC_IVAR___CameraMainViewController_contentViewController];
  if (v4)
  {
    if (!a1)
    {
      id v4 = v4;
      goto LABEL_9;
    }
    sub_100006960(0, &qword_100010F58);
    id v27 = v4;
    id v3 = v3;
    char v5 = sub_100009610();

    if (v5) {
      goto LABEL_12;
    }
  }
  else if (!a1)
  {
    return;
  }
  id v6 = v3;
  [v6 willMoveToParentViewController:0];
  [v6 removeFromParentViewController];
  id v7 = [v6 view];
  [v7 removeFromSuperview];

  if (!v4) {
    return;
  }
LABEL_9:
  id v27 = v4;
  [v2 addChildViewController:];
  id v8 = [v2 view];
  if (!v8)
  {

    __break(1u);
    goto LABEL_16;
  }
  v9 = v8;
  id v10 = [v27 view];
  if (!v10)
  {
LABEL_16:

    __break(1u);
    return;
  }
  v11 = v10;
  [v9 bounds];
  [v11 setFrame:];
  [v9 addSubview:v11];
  v12 = self;
  sub_100005424(&qword_100010EE8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100009E80;
  id v14 = [v11 leftAnchor];
  id v15 = [v9 leftAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];

  *(void *)(v13 + 32) = v16;
  id v17 = [v11 topAnchor];
  id v18 = [v9 topAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];

  *(void *)(v13 + 40) = v19;
  id v20 = [v9 rightAnchor];
  id v21 = [v11 rightAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21];

  *(void *)(v13 + 48) = v22;
  id v23 = [v9 bottomAnchor];
  id v24 = [v11 bottomAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];

  *(void *)(v13 + 56) = v25;
  sub_100009580();
  sub_100006960(0, &qword_100010F50);
  Class isa = sub_100009570().super.isa;
  swift_bridgeObjectRelease();
  [v12 activateConstraints:isa];

  [v27 didMoveToParentViewController:v2];
LABEL_12:
}

void sub_1000025E0(void *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR___CameraMainViewController_contentViewController);
  *(void *)(v1 + OBJC_IVAR___CameraMainViewController_contentViewController) = a1;
  id v3 = a1;
  sub_1000021C8(v2);
}

void sub_10000263C()
{
  uint64_t v2 = sub_100009450();
  sub_100006BB0();
  uint64_t v4 = v3;
  __chkstk_darwin();
  sub_100006CE0();
  id v5 = [v0 view];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 layer];

    if (v7)
    {
      id v8 = NSTemporaryDirectory();
      uint64_t v9 = sub_100009500();
      unint64_t v11 = v10;

      uint64_t v23 = v9;
      unint64_t v24 = v11;
      swift_bridgeObjectRetain();
      sub_100006BE4();
      swift_bridgeObjectRelease();
      uint64_t v13 = v9;
      unint64_t v12 = v24;
      sub_100009440();
      swift_bridgeObjectRetain();
      id v14 = sub_100009430();
      os_log_type_t v15 = sub_1000095E0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v22 = v13;
        id v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)id v16 = 136446210;
        swift_bridgeObjectRetain();
        sub_100005A24(v22, v12, &v23);
        sub_100009620();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Saving layers: %{public}s", v16, 0xCu);
        swift_arrayDestroy();
        sub_100006D1C();
        sub_100006D1C();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
      id v17 = v7;
      id v18 = NSTemporaryDirectory();
      uint64_t v19 = sub_100009500();
      unint64_t v21 = v20;

      uint64_t v23 = v19;
      unint64_t v24 = v21;
      swift_bridgeObjectRetain();
      sub_100006BE4();
      swift_bridgeObjectRelease();
      sub_100009520();
      swift_bridgeObjectRelease();
      CAEncodeLayerTreeToFile();

      swift_release();
    }
  }
  sub_100006C94();
}

uint64_t sub_100002928()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1 == (id)1) {
    return 30;
  }
  else {
    return 26;
  }
}

void sub_1000029E8(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100009460();
  sub_100006BB0();
  uint64_t v6 = v5;
  __chkstk_darwin();
  id v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009480();
  sub_100006BB0();
  __chkstk_darwin();
  if (a1)
  {
    sub_100006960(0, &qword_100010F30);
    uint64_t v9 = (void *)sub_1000095F0();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v2;
    aBlock[4] = sub_1000069D4;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100002CC0;
    aBlock[3] = &unk_10000C938;
    unint64_t v11 = _Block_copy(aBlock);
    id v12 = v2;
    swift_release();
    sub_100009470();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10000687C(&qword_100010F38, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005424(&qword_100010F40);
    sub_1000068C4();
    sub_100009650();
    sub_100009600();
    _Block_release(v11);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    uint64_t v13 = sub_100006D34();
    v14(v13);
  }
  sub_100006C94();
}

char *sub_100002C48(char *result)
{
  if (*(void *)&result[OBJC_IVAR___CameraMainViewController_contentViewController])
  {
    type metadata accessor for CameraViewController();
    result = (char *)swift_dynamicCastClass();
    if (result)
    {
      id v1 = *(void **)&result[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker];
      return (char *)[v1 takePicture];
    }
  }
  return result;
}

uint64_t sub_100002CC0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100002D58(char a1)
{
  return [v1 sidecarServiceVolumeUpButtonPressed:a1 & 1];
}

id sub_100002DC0()
{
  if (*(void *)&v0[OBJC_IVAR___CameraMainViewController_contentViewController]) {
    return [v0 setWantsVolumeButtonEvents:1];
  }
  return result;
}

id sub_100002E30(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___CameraMainViewController_contentViewController] = 0;
  if (a2)
  {
    NSString v5 = sub_1000094D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for CameraMainViewController();
  [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_100002F1C(void *a1)
{
  *(void *)&v1[OBJC_IVAR___CameraMainViewController_contentViewController] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for CameraMainViewController();
  id v3 = [super initWithCoder:a1];

  return v3;
}

uint64_t type metadata accessor for CameraMainViewController()
{
  return self;
}

void sub_100002FC4(void *a1)
{
  sub_100009460();
  sub_100006BB0();
  __chkstk_darwin();
  sub_100006C78();
  uint64_t v4 = sub_100009480();
  sub_100006BB0();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_100006CF8();
  if (sub_10000681C())
  {
    if (!sub_100006828())
    {
      sub_100006960(0, &qword_100010F30);
      unint64_t v20 = (void *)sub_1000095F0();
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = a1;
      *(void *)(v13 + 24) = v1;
      aBlock[4] = sub_100006874;
      aBlock[5] = v13;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100002CC0;
      aBlock[3] = &unk_10000C8E8;
      id v14 = _Block_copy(aBlock);
      id v15 = a1;
      id v16 = v1;
      swift_release();
      sub_100009470();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_10000687C(&qword_100010F38, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005424(&qword_100010F40);
      sub_1000068C4();
      sub_100009650();
      sub_100009600();
      _Block_release(v14);

      uint64_t v17 = sub_100006D34();
      v18(v17);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
      sub_100006C94();
      return;
    }
    sub_100006960(0, &qword_100010EE0);
    sub_100009500();
    sub_100006CAC();
    uint64_t v9 = -104;
  }
  else
  {
    sub_100006960(0, &qword_100010EE0);
    sub_100009500();
    sub_100006CAC();
    uint64_t v9 = -103;
  }
  id v10 = sub_100006D48(v7, v8, v9);
  uint64_t v19 = sub_100009330();

  [a1 setError:v19];
  sub_100006C94();
}

void sub_1000032F4(void *a1)
{
  if (![a1 message])
  {
    __break(1u);
    return;
  }
  id v2 = (id)SidecarMessageGetServiceName();
  swift_unknownObjectRelease();
  if (!v2) {
    goto LABEL_18;
  }
  uint64_t v3 = sub_100009500();
  uint64_t v5 = v4;
  if (v3 == sub_100009500() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  char v8 = sub_100009720();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_20:

    type metadata accessor for CameraViewController();
    v30 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    *(void *)&v30[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate + 8] = &off_10000C858;
LABEL_24:
    swift_unknownObjectWeakAssign();
    v36 = v30;
    sub_1000025E0(v30);
    goto LABEL_25;
  }
  uint64_t v9 = (void *)SidecarServiceNameScanDocument;
  uint64_t v10 = sub_100009500();
  uint64_t v12 = v11;
  if (v10 == sub_100009500() && v12 == v13)
  {
    id v31 = v9;
    id v32 = v2;

    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  char v15 = sub_100009720();
  id v16 = v9;
  id v17 = v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_22:

    goto LABEL_23;
  }
  id v18 = (void *)SidecarServiceNameScanLosslessDocument;
  uint64_t v19 = sub_100009500();
  uint64_t v21 = v20;
  if (v19 == sub_100009500() && v21 == v22)
  {
    id v33 = v18;
    id v34 = v17;

    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
  char v24 = sub_100009720();
  id v25 = v18;
  id v26 = v17;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24)
  {
LABEL_23:
    type metadata accessor for DocumentScannerViewController();
    v30 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    goto LABEL_24;
  }
LABEL_18:
  sub_100006960(0, &qword_100010EE0);
  uint64_t v27 = sub_100009500();
  LOBYTE(v35) = 2;
  id v29 = sub_1000050C4(v27, v28, -103, 0, 0, 0);
  v36 = (char *)sub_100009330();

  [a1 setError:v36, v35, 135];
LABEL_25:
}

void sub_1000036BC(uint64_t a1, void *a2)
{
  uint64_t v6 = sub_100009450();
  sub_100006BB0();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_100006C78();
  uint64_t v10 = sub_100009410();
  sub_100006BB0();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_100006CE0();
  id v14 = [v2 request];
  if (v14)
  {
    char v15 = v14;
    sub_1000093E0();
    sub_1000093D0();
    uint64_t v53 = v3;
    v54 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v54(v3, v10);
    uint64_t v55 = v10;
    if ([v15 message])
    {
      id v16 = (id)SidecarMessageGetDefaults();
      if (v16)
      {
        id v17 = v16;
        v51 = a2;
        uint64_t v18 = sub_1000094A0();

        sub_100009440();
        swift_bridgeObjectRetain_n();
        uint64_t v19 = sub_100009430();
        os_log_type_t v20 = sub_1000095E0();
        v52 = v15;
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc();
          v56[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v21 = 136446210;
          swift_bridgeObjectRetain();
          uint64_t v22 = sub_1000094B0();
          unint64_t v24 = v23;
          swift_bridgeObjectRelease();
          *(void *)&long long v57 = sub_100005A24(v22, v24, v56);
          sub_100009620();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Defaults: %{public}s", v21, 0xCu);
          swift_arrayDestroy();
          sub_100006D1C();
          sub_100006D1C();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, v6);
        uint64_t v40 = v18;
        *(void *)&long long v57 = 0xD00000000000001CLL;
        *((void *)&v57 + 1) = 0x800000010000AC40;
        sub_100009680();
        sub_100007324((uint64_t)v56, v18, &v57);
        sub_1000054C0((uint64_t)v56);
        if (v58) {
          sub_100006C30();
        }
        else {
          sub_1000066CC((uint64_t)&v57, &qword_100011120);
        }
        sub_100009680();
        sub_100007324((uint64_t)v56, v18, &v57);
        sub_1000054C0((uint64_t)v56);
        if (v58)
        {
          if (sub_100006C30())
          {
            uint64_t v41 = sub_100009510();
            uint64_t v43 = v42;
            BOOL v44 = v41 == 0x6C616E696769726FLL && v42 == 0xE800000000000000;
            if (v44 || (uint64_t v45 = v41, (sub_100006C14() & 1) != 0))
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              [v51 size];
            }
            else
            {
              BOOL v46 = v45 == 0x6C6C616D73 && v43 == 0xE500000000000000;
              if (v46
                || (sub_100006C14() & 1) != 0
                || (v45 == 0x6D756964656DLL ? (BOOL v47 = v43 == 0xE600000000000000) : (BOOL v47 = 0),
                    v47 || (sub_100006C14() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else if (v45 == 0x656772616CLL && v43 == 0xE500000000000000)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_100006D10();
              }
              else
              {
                uint64_t v49 = sub_100006C14();
                swift_bridgeObjectRelease();
                if (v49)
                {
                  swift_bridgeObjectRelease();
                  sub_100006D10();
                  uint64_t v40 = v18;
                }
                else
                {
                  sub_1000094D0();
                  sub_100006D68();
                  double width = CGSizeFromString((NSString *)v49).width;

                  if (width <= 0.0) {
                    sub_100006D10();
                  }
                  uint64_t v40 = v18;
                }
              }
            }
            goto LABEL_29;
          }
        }
        else
        {
          sub_1000066CC((uint64_t)&v57, &qword_100011120);
        }
        sub_100006D10();
LABEL_29:
        sub_100009680();
        sub_100007324((uint64_t)v56, v40, &v57);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        sub_1000054C0((uint64_t)v56);
        if (v58)
        {
          char v15 = v52;
          if (sub_100006C30()) {
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          sub_1000066CC((uint64_t)&v57, &qword_100011120);
          char v15 = v52;
        }
        goto LABEL_11;
      }
      swift_unknownObjectRelease();
    }
    sub_100006D10();
LABEL_11:
    NSString v25 = sub_1000094D0();
    uint64_t v26 = sub_100006CBC(v25);
    unint64_t v28 = v27;

    if (v28 >> 60 != 15) {
      goto LABEL_14;
    }
    sub_1000093E0();
    id v29 = (void *)sub_1000093D0();
    v54(v53, v55);
    sub_1000094D0();
    sub_100006D68();
    uint64_t v26 = sub_100006CBC(v29);
    unint64_t v28 = v30;

    if (v28 >> 60 == 15)
    {
      swift_bridgeObjectRelease();
      sub_100006960(0, &qword_100010EE0);
      sub_100009500();
      sub_100006CAC();
      id v33 = sub_100006D48(v31, v32, -1011);
      id v34 = (void *)sub_100009330();

      [v15 setError:v34];
    }
    else
    {
LABEL_14:
      id v35 = objc_allocWithZone((Class)SidecarItem);
      sub_1000053CC(v26, v28);
      id v36 = sub_100005328(v26, v28);
      sub_100005424(&qword_100010EE8);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_100009E90;
      *(void *)(v37 + 32) = v36;
      v56[0] = v37;
      sub_100009580();
      v38 = (void *)sub_100006960(0, (unint64_t *)&unk_100010EF0);
      id v39 = v36;
      sub_100009570();
      sub_100006D68();
      [v15 sendItems:v38];

      sub_100005468(v26, v28);
    }
    return;
  }

  [v2 completeRequest:0];
}

uint64_t sub_100004088(void *a1, uint64_t a2, uint64_t a3, char a4, double a5)
{
  char v9 = a4 & 1;
  id v10 = a1;
  id v11 = v5;
  double v12 = sub_100004B2C(a2, a3, v9, 1.0);
  double v14 = v13;
  id v15 = [objc_allocWithZone((Class)UIGraphicsImageRendererFormat) init];
  [v15 setOpaque:0];
  [v11 scale];
  [v15 setScale:];
  id v16 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:v15 format:v12];
  v19[2] = v11;
  *(double *)&v19[3] = v12;
  *(double *)&v19[4] = v14;
  uint64_t v17 = sub_100004C10(a5, (uint64_t)v10, (uint64_t)sub_100006688, (uint64_t)v19);

  return v17;
}

void sub_1000041CC(uint64_t a1, void *a2)
{
  id v4 = [v2 request];
  if (v4)
  {
    id v20 = v4;
    if ([v4 message])
    {
      id v5 = (id)SidecarMessageGetServiceName();
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = sub_100009500();
        uint64_t v9 = v8;
        if (v7 == sub_100009500() && v9 == v10)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v12 = sub_100006C50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v12 & 1) == 0)
          {
            uint64_t v13 = sub_100009500();
            uint64_t v15 = v14;
            if (v13 == sub_100009500() && v15 == v16)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              char v18 = sub_100006C50();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v18 & 1) == 0)
              {
                [v2 completeRequest:0];
LABEL_23:

                swift_unknownObjectRelease();

                return;
              }
            }
            sub_1000047CC(a2);
LABEL_22:
            sub_100006960(0, (unint64_t *)&unk_100010EF0);
            Class isa = sub_100009570().super.isa;
            swift_bridgeObjectRelease();
            [v20 sendItems:isa];

            goto LABEL_23;
          }
        }
        sub_1000043F4(a2);
        goto LABEL_22;
      }

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }

  [v2 completeRequest:0];
}

unint64_t sub_1000043F4(void *a1)
{
  uint64_t v29 = sub_100009410();
  uint64_t v2 = *(void *)(v29 - 8);
  __chkstk_darwin();
  unint64_t v28 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009360();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v33 = (unint64_t)&_swiftEmptyArrayStorage;
  unint64_t result = (unint64_t)[a1 pageCount];
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v9 = result;
    if (result)
    {
      uint64_t v10 = 0;
      unint64_t v30 = (void (**)(char *, uint64_t))(v5 + 8);
      NSString v25 = (void (**)(char *, uint64_t))(v2 + 8);
      id v11 = &CameraMainViewController__prots;
      uint64_t v31 = (char *)&type metadata for Any + 8;
      uint64_t v26 = v7;
      uint64_t v27 = v4;
      do
      {
        id v12 = [a1 count:v25];
        if (v12)
        {
          uint64_t v13 = v12;
          id v14 = [v12 objectAtIndexedSubscript:v10];

          sub_100009640();
          swift_unknownObjectRelease();
          sub_100006960(0, &qword_100010F28);
          if (swift_dynamicCast())
          {
            uint64_t v15 = v32;
            sub_10000678C(v32);
            if (v16)
            {
              NSString v17 = sub_1000094D0();
              swift_bridgeObjectRelease();
              id v18 = [a1 getImageURL:v17];

              sub_100009350();
              uint64_t v19 = sub_100009370();
              unint64_t v21 = v20;
              sub_1000053CC(v19, v20);
              uint64_t v22 = v28;
              sub_1000093E0();
              sub_1000093D0();
              (*v25)(v22, v29);
              id v23 = objc_allocWithZone((Class)SidecarItem);
              id v24 = sub_100005328(v19, v21);
              sub_100009560();
              if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_100009590();
              }
              sub_1000095A0();
              sub_100009580();

              sub_100005468(v19, v21);
              (*v30)(v26, v27);
              id v11 = &CameraMainViewController__prots;
            }
            else
            {
            }
          }
        }
        ++v10;
      }
      while (v9 != v10);
      return v33;
    }
    else
    {
      return (unint64_t)&_swiftEmptyArrayStorage;
    }
  }
  return result;
}

id sub_1000047CC(void *a1)
{
  uint64_t v2 = sub_100009450();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v20 = 0;
  id v6 = [a1 archivedDataWithError:&v20];
  id v7 = v20;
  if (v6)
  {
    uint64_t v8 = sub_100009390();
    unint64_t v10 = v9;

    id v11 = objc_allocWithZone((Class)SidecarItem);
    sub_1000053CC(v8, v10);
    id v12 = sub_100005328(v8, v10);
    sub_100005424(&qword_100010EE8);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_100009E90;
    *(void *)(v13 + 32) = v12;
    id v20 = (id)v13;
    sub_100009580();
    id v14 = v20;
    sub_100005468(v8, v10);
  }
  else
  {
    uint64_t v15 = v7;
    uint64_t v16 = sub_100009340();

    swift_willThrow();
    uint64_t v17 = sub_100009440();
    __chkstk_darwin(v17);
    *(void *)&v19[-16] = v16;
    sub_100006D80((uint64_t (*)(void))sub_100004A94, 0, (void (*)(void))sub_1000067F0);
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    swift_errorRelease();
    return &_swiftEmptyArrayStorage;
  }
  return v14;
}

unint64_t sub_100004A94()
{
  return 0xD00000000000002CLL;
}

id sub_100004AB0()
{
  return [v0 completeRequest:1];
}

double sub_100004B2C(uint64_t a1, uint64_t a2, char a3, double a4)
{
  [v4 size];
  double v10 = v9;
  double v12 = v11;
  if ((a3 & 1) == 0)
  {
    [v4 scale];
    double v14 = a4 / v13;
    double v15 = v14 * *(double *)&a1;
    double v16 = v14 * *(double *)&a2;
    int v17 = (v12 < v10) ^ (v16 >= v15);
    if (v17) {
      double v18 = v16;
    }
    else {
      double v18 = v15;
    }
    if (v17) {
      double v16 = v15;
    }
    double v19 = v16 / v10;
    double v20 = v18 / v12;
    if (v19 <= 1.0 || v20 <= 1.0)
    {
      if (v20 < v19) {
        double v19 = v18 / v12;
      }
      return floor(v10 * v19);
    }
  }
  return v10;
}

uint64_t sub_100004C10(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = v4;
  uint64_t v10 = sub_100005424(&qword_100010F10);
  __chkstk_darwin(v10 - 8);
  sub_100006CF8();
  uint64_t v11 = sub_100009410();
  sub_100006BB0();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  int v17 = (char *)v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  double v19 = (char *)v43 - v18;
  sub_100009500();
  sub_100009420();
  if (sub_1000066A4(v5, 1, v11) == 1)
  {
    sub_1000066CC(v5, &qword_100010F10);
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v19, v5, v11);
  sub_1000093F0();
  char v20 = sub_100009400();
  unint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v17, v11);
  if ((v20 & 1) == 0)
  {
    v21(v19, v11);
    return 0;
  }
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a3;
  *(void *)(v22 + 24) = a4;
  aBlock[4] = sub_100006738;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005078;
  aBlock[3] = &unk_10000C898;
  id v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v24 = [v6 imageWithActions:v23];
  _Block_release(v23);
  LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v23 & 1) == 0)
  {
    v43[1] = v21;
    id v26 = [objc_allocWithZone((Class)NSMutableData) init];
    sub_100005424(&qword_100010F18);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100009EA0;
    *(void *)(inited + 32) = kCGImageDestinationLossyCompressionQuality;
    *(double *)(inited + 40) = a1;
    type metadata accessor for CFString(0);
    sub_10000687C(&qword_100010F20, type metadata accessor for CFString);
    CFStringRef v28 = (id)kCGImageDestinationLossyCompressionQuality;
    sub_1000094C0();
    v29.super.Class isa = sub_100009490().super.isa;
    swift_bridgeObjectRelease();
    unint64_t v30 = (__CFData *)v26;
    sub_1000093D0();
    uint64_t v31 = (__CFString *)sub_1000094D0();
    swift_bridgeObjectRelease();
    uint64_t v32 = CGImageDestinationCreateWithData(v30, v31, 1uLL, v29.super.isa);

    if (v32)
    {
      unint64_t v33 = (CGImage *)[v24 CGImage];
      if (v33)
      {
        id v34 = v33;
        CGImageDestinationAddImage(v32, v33, v29.super.isa);
        CGImageDestinationFinalize(v32);
        id v35 = v30;
        uint64_t v36 = sub_100009390();

        uint64_t v37 = sub_100006BCC();
        v38(v37);
        return v36;
      }
      uint64_t v41 = sub_100006BCC();
      v42(v41);
    }
    else
    {
      uint64_t v39 = sub_100006BCC();
      v40(v39);
    }
    return 0;
  }
  __break(1u);
  return result;
}

void sub_100005078(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_1000050C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = sub_1000094C0();
  if (a5)
  {
    uint64_t v10 = sub_100009500();
    id v23 = &type metadata for String;
    v22[0] = a4;
    v22[1] = a5;
    sub_100005294((uint64_t)v22, v10, v11);
  }
  if (a6)
  {
    uint64_t v12 = sub_100009500();
    uint64_t v14 = v13;
    swift_getErrorValue();
    id v23 = v21;
    uint64_t v15 = sub_1000062A0(v22);
    (*(void (**)(uint64_t *))(*((void *)v21 - 1) + 16))(v15);
    sub_100005294((uint64_t)v22, v12, v14);
  }
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v17 = sub_1000094D0();
  swift_bridgeObjectRelease();
  Class isa = sub_100009490().super.isa;
  swift_bridgeObjectRelease();
  id v19 = [v16 initWithDomain:v17 code:a3 userInfo:isa];

  swift_errorRelease();
  return v19;
}

uint64_t sub_100005294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000643C((_OWORD *)a1, v6);
    sub_10000644C(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000066CC(a1, &qword_100011120);
    sub_100006304(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1000066CC((uint64_t)v6, &qword_100011120);
  }
}

id sub_100005328(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100009380().super.isa;
    sub_10000628C(a1, a2);
  }
  NSString v6 = sub_1000094D0();
  swift_bridgeObjectRelease();
  id v7 = [v2 initWithData:isa type:v6];

  return v7;
}

uint64_t sub_1000053CC(uint64_t a1, unint64_t a2)
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

uint64_t sub_100005424(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005468(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000054C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005514(uint64_t a1, id *a2)
{
  uint64_t result = sub_1000094E0();
  *a2 = 0;
  return result;
}

uint64_t sub_10000558C(uint64_t a1, id *a2)
{
  char v3 = sub_1000094F0();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_10000560C()
{
  sub_100009500();
  NSString v0 = sub_1000094D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005644()
{
  return sub_1000093C0();
}

uint64_t sub_100005690()
{
  return sub_1000093B0();
}

Swift::Int sub_1000056E8()
{
  return sub_100009750();
}

void (*sub_100005750())(uint64_t)
{
  return sub_1000057E0(*v0, (void (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100005788@<X0>(void *a1@<X8>)
{
  NSString result = sub_10000560C();
  *a1 = result;
  return result;
}

void (*sub_1000057B0())(uint64_t)
{
  return sub_1000057E0(*v0, (void (*)(uint64_t))&String.hashValue.getter);
}

void (*sub_1000057E0(uint64_t a1, void (*a2)(uint64_t)))(uint64_t)
{
  uint64_t v3 = sub_100009500();
  a2(v3);
  sub_100006D68();
  return a2;
}

uint64_t sub_100005818()
{
  return sub_100005820();
}

uint64_t sub_100005820()
{
  sub_100009500();
  sub_100009530();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005874()
{
  return sub_100008548();
}

uint64_t sub_10000587C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t WitnessTable = swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_1000058E8(void *a1, void *a2)
{
  return sub_100007298(*a1, *a2);
}

uint64_t sub_1000058F4@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_1000094D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000593C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000085BC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005968(uint64_t a1)
{
  uint64_t v2 = sub_10000687C((unint64_t *)&qword_100010F90, type metadata accessor for InfoKey);
  uint64_t v3 = sub_10000687C(&qword_100010F98, type metadata accessor for InfoKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005A24(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005AF8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000622C((uint64_t)v12, *a3);
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
      sub_10000622C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000061DC((uint64_t)v12);
  return v7;
}

uint64_t sub_100005AF8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100005C50((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100009630();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100005D28(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000096A0();
    if (!v8)
    {
      uint64_t result = sub_1000096D0();
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

void *sub_100005C50(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000096F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100005D28(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100005DC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005F9C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005F9C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100005DC0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100009550();
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
  unint64_t v3 = sub_100005F34(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100009690();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_1000096F0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_1000096D0();
  __break(1u);
  return result;
}

void *sub_100005F34(uint64_t a1, uint64_t a2)
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
  sub_100005424(&qword_100010F00);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100005F9C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100005424(&qword_100010F00);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000614C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006074(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100006074(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_1000096F0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_10000614C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1000096F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1000061DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000622C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000628C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100005468(a1, a2);
  }
  return a1;
}

uint64_t *sub_1000062A0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

double sub_100006304@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000085C0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100005424(&qword_100010F08);
    sub_1000096B0(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_10000643C((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    sub_1000096C0();
    *unint64_t v4 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_10000643C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000644C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1000064DC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

_OWORD *sub_1000064DC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000085C0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005424(&qword_100010F08);
  if (!sub_1000096B0(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000085C0(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_100009730();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    unint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_1000061DC((uint64_t)v21);
    return sub_10000643C(a1, v21);
  }
  else
  {
    sub_10000661C(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_10000661C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_10000643C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

id sub_100006688()
{
  return [*(id *)(v0 + 16) drawInRect:0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32)];
}

uint64_t sub_1000066A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000066CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005424(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006728()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006738()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100006760(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006770()
{
  return swift_release();
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_10000678C(void *a1)
{
  id v1 = [a1 croppedAndFilteredImageUUID];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100009500();

  return v3;
}

uint64_t sub_1000067F0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_errorRetain();
  return v1;
}

uint64_t sub_10000681C()
{
  return _MGGetBoolAnswer(@"still-camera");
}

uint64_t sub_100006828()
{
  return _MGGetBoolAnswer(@"cameraRestriction");
}

uint64_t sub_100006834()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100006874()
{
  sub_1000032F4(*(void **)(v0 + 16));
}

uint64_t sub_10000687C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000068C4()
{
  unint64_t result = qword_100010F48;
  if (!qword_100010F48)
  {
    sub_100006918(&qword_100010F40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F48);
  }
  return result;
}

uint64_t sub_100006918(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006960(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000699C()
{
  return _swift_deallocObject(v0, 24, 7);
}

char *sub_1000069D4()
{
  return sub_100002C48(*(char **)(v0 + 16));
}

void type metadata accessor for InfoKey(uint64_t a1)
{
}

void sub_1000069F0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006A38()
{
  return sub_10000687C(&qword_100010F20, type metadata accessor for CFString);
}

uint64_t sub_100006A80()
{
  return sub_10000687C(&qword_100010F70, type metadata accessor for InfoKey);
}

uint64_t sub_100006AC8()
{
  return sub_10000687C(&qword_100010F78, type metadata accessor for InfoKey);
}

uint64_t sub_100006B10()
{
  return sub_10000687C(&qword_100010F80, type metadata accessor for InfoKey);
}

uint64_t sub_100006B58()
{
  return sub_10000687C(&qword_100010F88, type metadata accessor for CFString);
}

uint64_t sub_100006BCC()
{
  return v0;
}

void sub_100006BE4()
{
  uint64_t v1 = 0x2E6172656D61632FLL;
  unint64_t v2 = 0xEC00000072616163;
  String.append(_:)(*(Swift::String *)&v1);
}

uint64_t sub_100006C14()
{
  return sub_100009720();
}

uint64_t sub_100006C30()
{
  return swift_dynamicCast();
}

uint64_t sub_100006C50()
{
  return sub_100009720();
}

uint64_t sub_100006C78()
{
  return 0;
}

uint64_t sub_100006CBC(void *a1)
{
  return sub_100004088(a1, v1, v2, 0, v4);
}

uint64_t sub_100006D1C()
{
  return swift_slowDealloc();
}

uint64_t sub_100006D34()
{
  return v0;
}

id sub_100006D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000050C4(a1, a2, a3, 0, 0, 0);
}

uint64_t sub_100006D68()
{
  return swift_bridgeObjectRelease();
}

void sub_100006D80(uint64_t (*a1)(void), uint64_t a2, void (*a3)(void))
{
  a3();
  double v4 = (void *)sub_100009330();
  swift_errorRelease();
  id v5 = [v4 localizedDescription];
  uint64_t v6 = sub_100009500();
  unint64_t v8 = v7;

  uint64_t v9 = a1();
  if (v10)
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    id v27 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100009430();
    os_log_type_t v14 = sub_1000095D0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136446979;
      swift_bridgeObjectRetain();
      sub_100005A24(v11, v12, &v28);
      sub_100009620();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2082;
      id v16 = [v27 domain];
      uint64_t v17 = v6;
      uint64_t v18 = sub_100009500();
      unint64_t v20 = v19;

      sub_100005A24(v18, v20, &v28);
      sub_100009620();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2048;
      [v27 code];

      sub_100009620();
      *(_WORD *)(v15 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_100005A24(v17, v8, &v28);
      sub_100009620();
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
    uint64_t v13 = sub_100009430();
    os_log_type_t v21 = sub_1000095D0();
    if (os_log_type_enabled(v13, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446723;
      id v23 = [v27 domain];
      uint64_t v24 = sub_100009500();
      unint64_t v26 = v25;

      sub_100005A24(v24, v26, &v28);
      sub_10000727C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2048;
      [v27 code];

      sub_10000727C();
      *(_WORD *)(v22 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_100005A24(v6, v8, &v28);
      sub_10000727C();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v21, "%{public}s (%ld) %{private}s", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t sub_10000727C()
{
  return sub_100009620();
}

uint64_t sub_10000729C()
{
  uint64_t v0 = sub_100009500();
  uint64_t v2 = v1;
  if (v0 == sub_100009500() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100009720();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

double sub_100007324@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100008638(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_10000622C(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

double sub_100007388@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10000867C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_10000622C(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_1000073EC()
{
  uint64_t v2 = sub_100009410();
  sub_100008C1C();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100006CF8();
  char v6 = (objc_class *)type metadata accessor for CameraPicker();
  v23.receiver = v0;
  v23.super_class = v6;
  id result = [super init];
  if (result)
  {
    id v8 = result;
    Class isa = sub_1000095B0().super.super.isa;
    v22.receiver = v8;
    v22.super_class = v6;
    [super _setValue:isa forProperty:_UIImagePickerControllerAllowAnySuperview];

    v21.receiver = v8;
    v21.super_class = v6;
    [super setSourceType:1];
    id v10 = [self standardUserDefaults];
    if ([v10 objectForKey:_UIImagePickerControllerCameraDevice])
    {
      sub_100009640();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_100008BB4((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      if (sub_100008C34()) {
        [v8 setCameraDevice:v16];
      }
    }
    else
    {
      sub_1000084E8((uint64_t)v19);
    }
    if ([v10 objectForKey:_UIImagePickerControllerCameraFlashMode])
    {
      sub_100009640();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    sub_100008BB4((uint64_t)&v17, (uint64_t)v19);
    if (v20)
    {
      if (sub_100008C34()) {
        [v8 setCameraFlashMode:v16];
      }
    }
    else
    {
      sub_1000084E8((uint64_t)v19);
    }
    sub_100005424((uint64_t *)&unk_100011140);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100009EA0;
    sub_1000093F0();
    uint64_t v12 = sub_1000093D0();
    uint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    Class v15 = sub_100009570().super.isa;
    swift_bridgeObjectRelease();
    [v8 setMediaTypes:v15];

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000076E8()
{
}

uint64_t sub_100007754(uint64_t a1, uint64_t a2, NSString a3)
{
  uint64_t v8 = sub_100009500();
  if (!a3)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v8 != a2 || v9 != a3)
  {
    uint64_t v4 = sub_100009720();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_11;
    }
LABEL_9:
    sub_100008B08(a1, (uint64_t)v21);
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  Class isa = sub_1000095C0().super.super.isa;
  v21[3] = sub_100006960(0, &qword_100011138);
  v21[0] = isa;
LABEL_12:
  sub_100008B08((uint64_t)v21, (uint64_t)v19);
  uint64_t v12 = v20;
  if (!v20)
  {
    uint64_t v16 = 0;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  sub_100008B70(v19, v20);
  sub_100008C1C();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_100006CF8();
  (*(void (**)(uint64_t))(v14 + 16))(v4);
  uint64_t v16 = sub_100009710();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v12);
  sub_1000061DC((uint64_t)v19);
  if (a3) {
LABEL_14:
  }
    a3 = sub_1000094D0();
LABEL_15:
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for CameraPicker();
  [super _setValue:v16 forProperty:a3];
  swift_unknownObjectRelease();

  return sub_1000084E8((uint64_t)v21);
}

id sub_100007A44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraPicker();
  return [super setSourceType:1];
}

void sub_100007A84(char a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for CameraPicker();
  [super viewWillDisappear:a1 & 1];
  id v3 = [self standardUserDefaults];
  id v4 = [v1 cameraDevice];
  [v3 setInteger:v4 forKey:_UIImagePickerControllerCameraDevice];
  id v5 = [v1 cameraFlashMode];
  [v3 setInteger:v5 forKey:_UIImagePickerControllerCameraFlashMode];
  [v3 synchronize];
}

id sub_100007BB8()
{
  return sub_100008438(type metadata accessor for CameraPicker, (SEL *)&selRef_dealloc);
}

uint64_t type metadata accessor for CameraPicker()
{
  return self;
}

BOOL sub_100007C30()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  return v1 == (id)1;
}

void sub_100007C94()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for CameraViewController();
  [super viewDidLoad];
  id v1 = *(void **)&v0[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker];
  [v1 setDelegate:v0];
  [v0 addChildViewController:v1];
  id v2 = [v1 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v3 = v2;
  id v4 = [v0 view];
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v5 = v4;
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [v3 setFrame:v7, v9, v11, v13];
  id v14 = [v0 view];
  if (v14)
  {
    uint64_t v15 = v14;
    [v14 addSubview:v3];

    [v1 didMoveToParentViewController:v0];
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_100007EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100009450();
  sub_100008C1C();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  double v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = UIImagePickerControllerOriginalImage;
  sub_100007388((uint64_t)v11, a2, &v18);

  if (v19)
  {
    sub_100006960(0, (unint64_t *)&unk_100011128);
    if (swift_dynamicCast())
    {
      double v12 = (void *)v17[1];
      if (!swift_unknownObjectWeakLoadStrong())
      {

        return;
      }
      sub_1000036BC(v3, v12);

      goto LABEL_10;
    }
  }
  else
  {
    sub_1000084E8((uint64_t)&v18);
  }
  sub_100009440();
  double v13 = sub_100009430();
  os_log_type_t v14 = sub_1000095D0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "no image from UIImagePickerController", v15, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong completeRequest:1];
LABEL_10:
    swift_unknownObjectRelease();
  }
}

void *sub_100008138()
{
  id result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    [result completeRequest:1];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_1000081FC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker;
  id v7 = objc_allocWithZone((Class)type metadata accessor for CameraPicker());
  uint64_t v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  *(void *)&v8[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  if (a2)
  {
    NSString v9 = sub_1000094D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for CameraViewController();
  [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100008344(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_cameraPicker;
  id v4 = objc_allocWithZone((Class)type metadata accessor for CameraPicker());
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC16ContinuityCamera20CameraViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CameraViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_100008418()
{
  return sub_100008438(type metadata accessor for CameraViewController, (SEL *)&selRef_dealloc);
}

id sub_100008438(uint64_t (*a1)(void), SEL *a2)
{
  v5.receiver = v2;
  v5.super_class = (Class)a1();
  return [super *a2];
}

uint64_t type metadata accessor for CameraViewController()
{
  return self;
}

uint64_t sub_1000084E8(uint64_t a1)
{
  uint64_t v2 = sub_100005424(&qword_100011120);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Int sub_100008548()
{
  sub_100009500();
  sub_100009740();
  sub_100009530();
  Swift::Int v0 = sub_100009750();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1000085C0(uint64_t a1, uint64_t a2)
{
  sub_100009740();
  sub_100009530();
  Swift::Int v4 = sub_100009750();

  return sub_100008710(a1, a2, v4);
}

unint64_t sub_100008638(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100009660(*(void *)(v2 + 40));

  return sub_1000087F4(a1, v4);
}

unint64_t sub_10000867C(uint64_t a1)
{
  sub_100009500();
  sub_100009740();
  sub_100009530();
  Swift::Int v2 = sub_100009750();
  swift_bridgeObjectRelease();

  return sub_100008918(a1, v2);
}

unint64_t sub_100008710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100009720() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        double v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100009720() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000087F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000088BC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100009670();
      sub_1000054C0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000088BC(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100008918(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100009500();
    uint64_t v8 = v7;
    if (v6 == sub_100009500() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100009720();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_100009500();
          uint64_t v15 = v14;
          if (v13 == sub_100009500() && v15 == v16) {
            break;
          }
          char v18 = sub_100009720();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100008A90()
{
  unint64_t result = qword_100010F90;
  if (!qword_100010F90)
  {
    type metadata accessor for InfoKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010F90);
  }
  return result;
}

uint64_t sub_100008AE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005424(&qword_100011120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_100008B70(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100008BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005424(&qword_100011120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008C34()
{
  return swift_dynamicCast();
}

id sub_100008C64()
{
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  [super viewDidLoad];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera];
  [v1 setDelegate:v0];
  [v0 addChildViewController:v1];
  id result = [v1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = result;
  id result = [v0 view];
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v4 = result;
  [result bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
  id result = [v0 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v13 = result;
  id result = [v1 view];
  if (result)
  {
    uint64_t v14 = result;
    [v13 addSubview:result];

    return [v1 didMoveToParentViewController:v0];
  }
LABEL_9:
  __break(1u);
  return result;
}

void *sub_100008E34(uint64_t a1, uint64_t a2)
{
  id result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    double v5 = result;
    if ([result respondsToSelector:"documentCameraViewController:didFinishWithScan:"]) {
      [v5 documentCameraViewController:a1 didFinishWithScan:a2];
    }
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_100008F44(uint64_t a1)
{
  id result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if ([result respondsToSelector:"documentCameraViewControllerDidCancel:"]) {
      [v3 documentCameraViewControllerDidCancel:a1];
    }
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_100009038(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera;
  id v7 = objc_allocWithZone((Class)VNDocumentCameraViewController);
  double v8 = v3;
  *(void *)&v3[v6] = [v7 init];

  if (a2)
  {
    NSString v9 = sub_1000094D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  id v10 = [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100009180(void *a1)
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC16ContinuityCamera29DocumentScannerViewController_documentCamera;
  id v4 = objc_allocWithZone((Class)VNDocumentCameraViewController);
  double v5 = v1;
  *(void *)&v1[v3] = [v4 init];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  [super initWithCoder:a1];

  return v6;
}

id sub_100009254()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DocumentScannerViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for DocumentScannerViewController()
{
  return self;
}

uint64_t sub_100009330()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100009340()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009350()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009360()
{
  return type metadata accessor for URL();
}

uint64_t sub_100009370()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_100009380()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100009390()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000093B0()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_1000093C0()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000093D0()
{
  return UTType.identifier.getter();
}

uint64_t sub_1000093E0()
{
  return static UTType.jpeg.getter();
}

uint64_t sub_1000093F0()
{
  return static UTType.image.getter();
}

uint64_t sub_100009400()
{
  return UTType.conforms(to:)();
}

uint64_t sub_100009410()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100009420()
{
  return UTType.init(_:)();
}

uint64_t sub_100009430()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009440()
{
  return Logger.init()();
}

uint64_t sub_100009450()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009460()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100009470()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100009480()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100009490()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000094A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000094B0()
{
  return Dictionary.description.getter();
}

uint64_t sub_1000094C0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_1000094D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000094E0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000094F0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100009500()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009510()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100009520()
{
  return String.utf8CString.getter();
}

uint64_t sub_100009530()
{
  return String.hash(into:)();
}

Swift::Int sub_100009550()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009560()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100009570()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009580()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100009590()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000095A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_1000095B0()
{
  return Bool._bridgeToObjectiveC()();
}

NSNumber sub_1000095C0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1000095D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000095E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000095F0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100009600()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100009610()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100009620()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009630()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009640()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100009650()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_100009660(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100009670()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100009680()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100009690()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000096A0()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_1000096B0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_1000096C0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_1000096D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000096E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000096F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100009710()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100009720()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100009730()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100009740()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100009750()
{
  return Hasher._finalize()();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return _CAEncodeLayerTreeToFile();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGSize CGSizeFromString(NSString *string)
{
  CGSize v3 = _CGSizeFromString(string);
  double height = v3.height;
  double width = v3.width;
  result.double height = height;
  result.double width = width;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SidecarMessageGetDefaults()
{
  return _SidecarMessageGetDefaults();
}

uint64_t SidecarMessageGetServiceName()
{
  return _SidecarMessageGetServiceName();
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}