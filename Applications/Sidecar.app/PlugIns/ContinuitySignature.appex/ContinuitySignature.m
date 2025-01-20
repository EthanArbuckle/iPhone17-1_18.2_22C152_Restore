id sub_100004884()
{
  id v0;
  NSString v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = sub_100007020();
  swift_bridgeObjectRelease();
  v2 = [v0 initWithTitle:v1];

  return v2;
}

void sub_100004910()
{
  v148.receiver = v0;
  v148.Class super_class = (Class)type metadata accessor for SignatureViewController();
  Class super_class = v148.super_class;
  [super viewDidLoad];
  id v1 = [v0 view];
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)&v0[OBJC_IVAR___SignatureViewController_signatureView];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v142 = v0;
    v4 = self;
    id v5 = [v4 systemBackgroundColor];
    [v3 setBackgroundColor:v5];

    id v6 = [v4 labelColor];
    [v3 setStrokeColor:v6];

    [v2 insertSubview:v3 atIndex:0];
    id v7 = [v3 leftAnchor];
    id v8 = sub_100006F34();
    id v9 = sub_100006E54();

    sub_100006E04();
    id v10 = [v3 rightAnchor];
    id v11 = [v2 rightAnchor];
    id v12 = sub_100006E54();

    sub_100006E04();
    id v13 = [v3 topAnchor];
    id v14 = [v2 topAnchor];
    id v15 = sub_100006E54();

    sub_100006E04();
    id v16 = [v3 bottomAnchor];
    id v17 = [v2 bottomAnchor];
    id v18 = sub_100006E54();

    sub_100006E04();
    v19 = *(void **)&v0[OBJC_IVAR___SignatureViewController_lineView];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v20 = [v4 clearColor];
    [v19 setBackgroundColor:v20];

    id v144 = v3;
    [v2 insertSubview:v19 aboveSubview:v3];
    id v21 = [v19 leftAnchor];
    id v22 = sub_100006F34();
    id v23 = sub_100006E54();

    sub_100006EF4();
    id v24 = [v19 rightAnchor];
    id v25 = [v2 rightAnchor];
    id v26 = sub_100006E54();

    sub_100006EF4();
    id v27 = [v19 bottomAnchor];
    id v28 = [v2 bottomAnchor];
    id v29 = [v27 constraintEqualToAnchor:v28 constant:-60.0];

    sub_100006EF4();
    id v30 = [v19 heightAnchor];
    id v31 = [v30 constraintEqualToConstant:30.0];

    [v31 setActive:1];
    id v32 = sub_100006E8C(objc_allocWithZone((Class)UILabel), "initWithFrame:");
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v33 = [self systemFontOfSize:12.0];
    [v32 setFont:v33];

    [v32 setTextAlignment:1];
    id v34 = [v4 secondaryLabelColor];
    [v32 setTextColor:v34];

    id v35 = v32;
    id v36 = [v4 clearColor];
    [v35 setBackgroundColor:v36];

    id v141 = self;
    id v37 = [v141 mainBundle];
    v127._countAndFlagsBits = 0xE000000000000000;
    sub_100006EAC();
    v38 = (void *)sub_100006FC0(v151, v153, v149, v155, v127);
    uint64_t v40 = v39;

    sub_100006CE0((uint64_t)v38, v40, v35);
    [v2 addSubview:v35];
    id v41 = [v35 leftAnchor];
    id v42 = sub_100006F34();
    id v43 = sub_100006F6C((uint64_t)v42);

    [v43 setActive:1];
    id v44 = [v35 rightAnchor];
    id v45 = sub_100006F6C((uint64_t)[v2 rightAnchor]);

    [v45 setActive:1];
    v139 = v35;
    id v46 = [v35 topAnchor];
    id v47 = [v19 bottomAnchor];
    id v48 = [v46 constraintEqualToAnchor:v47 constant:10.0];

    sub_100006E04();
    v49 = *(void **)&v142[OBJC_IVAR___SignatureViewController_navBar];
    [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v2 addSubview:v49];
    id v50 = [v49 leftAnchor];
    id v51 = sub_100006F34();
    id v52 = [v50 constraintEqualToAnchor:v51];

    sub_100006E04();
    id v53 = [v49 rightAnchor];
    id v54 = [v2 rightAnchor];
    id v55 = [v53 constraintEqualToAnchor:v54];

    sub_100006E04();
    id v56 = [v49 topAnchor];
    id v57 = [v2 topAnchor];
    id v58 = [v56 constraintEqualToAnchor:v57 constant:0.0];

    sub_100006E04();
    sub_1000063D8(&qword_10000C7A8);
    uint64_t v59 = sub_100006EDC();
    *((void *)&v137 + 1) = 3;
    *(_OWORD *)(v59 + 16) = xmmword_100007500;
    v60 = *(void **)&v142[OBJC_IVAR___SignatureViewController_titleItem];
    *(void *)(v59 + 32) = v60;
    sub_100006EC4(v59, v61, v62, v63, v64, v65, v66, v67, v128, v133, 1);
    id v140 = v60;
    sub_100006D44(v146, v49, &qword_10000C7E0, (uint64_t)UINavigationItem_ptr, (SEL *)&selRef_setItems_);
    *((void *)&v147 + 1) = super_class;
    *(void *)&long long v146 = v142;
    id v68 = objc_allocWithZone((Class)UIBarButtonItem);
    v69 = v142;
    id v143 = sub_100006454(1, &v146, (uint64_t)"_cancelWithSender:");
    id v70 = [v141 mainBundle];
    v129._countAndFlagsBits = 0xEC000000656C7469;
    sub_100006EAC();
    uint64_t v71 = sub_100006FC0(v152, v154, v150, v156, v129);
    uint64_t v73 = v72;

    *((void *)&v147 + 1) = super_class;
    *(void *)&long long v146 = v69;
    id v74 = objc_allocWithZone((Class)UIBarButtonItem);
    v75 = v69;
    id v76 = sub_1000065AC(v71, v73, 0, &v146, (uint64_t)"_clearWithSender:");
    *((void *)&v147 + 1) = super_class;
    *(void *)&long long v146 = v75;
    objc_allocWithZone((Class)UIBarButtonItem);
    v77 = v75;
    id v78 = sub_100006454(0, &v146, (uint64_t)"_doneWithSender:");
    long long v146 = 0u;
    long long v147 = 0u;
    id v79 = objc_allocWithZone((Class)UIBarButtonItem);
    id v80 = sub_100006454(6, &v146, 0);
    [v80 setWidth:27.0];
    id v81 = [v77 presentationController];
    if (v81 && (v82 = v81, id v83 = [v81 presentationStyle], v82, v83 == (id)7))
    {
      uint64_t v84 = sub_100006EDC();
      *(_OWORD *)(v84 + 16) = v137;
      *(void *)(v84 + 32) = v76;
      sub_100006EC4(v84, v85, v86, v87, v88, v89, v90, v91, v130, v134, v137);
      uint64_t v92 = v146;
      id v93 = v76;
      v94 = v140;
      sub_100006D44(v92, v140, (unint64_t *)&unk_10000C7F0, (uint64_t)UIBarButtonItem_ptr, (SEL *)&selRef_setLeftBarButtonItems_);
      uint64_t v95 = sub_100006EDC();
      *(_OWORD *)(v95 + 16) = v137;
      *(void *)(v95 + 32) = v78;
      sub_100006EC4(v95, v96, v97, v98, v99, v100, v101, v102, v131, v135, v137);
      uint64_t v103 = v146;
      id v104 = v78;
      v105 = v143;
    }
    else
    {
      uint64_t v106 = swift_allocObject();
      *(_OWORD *)(v106 + 16) = xmmword_100007510;
      v105 = v143;
      *(void *)(v106 + 32) = v143;
      *(void *)(v106 + 40) = v80;
      sub_100006EC4(v106, v107, v108, v109, v110, v111, v112, v113, v130, v134, v137);
      uint64_t v114 = v146;
      id v115 = v143;
      id v104 = v80;
      v94 = v140;
      sub_100006D44(v114, v140, (unint64_t *)&unk_10000C7F0, (uint64_t)UIBarButtonItem_ptr, (SEL *)&selRef_setLeftBarButtonItems_);
      uint64_t v116 = swift_allocObject();
      *(_OWORD *)(v116 + 16) = xmmword_100007520;
      *(void *)(v116 + 32) = v76;
      *(void *)(v116 + 40) = v104;
      *(void *)(v116 + 48) = v78;
      sub_100006EC4(v116, v117, v118, v119, v120, v121, v122, v123, v132, v136, v138);
      uint64_t v103 = v146;
      id v124 = v76;
      id v125 = v78;
    }
    id v126 = v104;
    sub_100006D44(v103, v94, (unint64_t *)&unk_10000C7F0, (uint64_t)UIBarButtonItem_ptr, (SEL *)&selRef_setRightBarButtonItems_);
    [v144 setLiveDelegate:v77];
    [v77 sidecarServiceUpdateSupportedOrientations];
  }
  else
  {
    __break(1u);
  }
}

id sub_100005514()
{
  return [v0 completeRequest:1];
}

id sub_100005540()
{
  return [*(id *)(v0 + OBJC_IVAR___SignatureViewController_signatureView) clear];
}

uint64_t sub_100005570(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1000070F0();
    uint64_t v2 = result;
    if (result)
    {
LABEL_3:
      if (v2 < 1)
      {
        __break(1u);
      }
      else
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if ((a1 & 0xC000000000000001) != 0) {
            id v5 = (id)sub_1000070E0();
          }
          else {
            id v5 = *(id *)(a1 + 8 * i + 32);
          }
          id v6 = v5;
          if ([v5 objectValue])
          {
            sub_100007090();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v8, 0, sizeof(v8));
          }
          sub_100006C78((uint64_t)v8, (uint64_t)v9);
          if (v10)
          {
            sub_1000063D8(&qword_10000C7E8);
            if (swift_dynamicCast())
            {
              sub_1000057A0(v7);

              swift_bridgeObjectRelease();
            }
            else
            {
            }
          }
          else
          {

            sub_1000068B4((uint64_t)v9);
          }
        }
        return swift_bridgeObjectRelease();
      }
      return result;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000057A0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100006FE0();
  sub_100006E70();
  uint64_t v6 = v5;
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100007000();
  sub_100006E70();
  uint64_t v13 = v12;
  __chkstk_darwin(v14, v15);
  id v17 = (char *)&aBlock[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = 1;
  sub_1000070D0();
  sub_100005A64((uint64_t)aBlock, a1, &v26);
  sub_100006860((uint64_t)aBlock);
  if (!v27) {
    return sub_1000068B4((uint64_t)&v26);
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0 && v25 == 3)
  {
    sub_100006DC8(0, &qword_10000C7C0);
    v19 = (void *)sub_100007070();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v2;
    aBlock[4] = sub_10000694C;
    aBlock[5] = v20;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005AC8;
    aBlock[3] = &unk_100008418;
    id v21 = _Block_copy(aBlock);
    id v22 = v2;
    swift_release();
    sub_100006FF0();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100006980();
    sub_1000063D8(&qword_10000C7D0);
    sub_1000069D0();
    sub_1000070A0();
    sub_100007080();
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v11);
  }
  return result;
}

double sub_100005A64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100006A6C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100006AB0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_100005AC8(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100005B0C()
{
  id v1 = v0;
  id v2 = [*(id *)&v0[OBJC_IVAR___SignatureViewController_signatureView] copyStrokedInterpolatedPath];
  if (v2)
  {
    v3 = v2;
    sub_1000063D8(&qword_10000C798);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100007530;
    *(_OWORD *)(inited + 32) = xmmword_100007540;
    *(void *)(inited + 64) = &type metadata for Int;
    *(void *)(inited + 72) = 2;
    id v5 = sub_10000641C((uint64_t)v3);
    uint64_t v6 = sub_100006FD0();
    uint64_t v8 = v7;

    *(void *)(inited + 104) = &type metadata for Data;
    *(void *)(inited + 80) = v6;
    *(void *)(inited + 88) = v8;
    sub_100007010();
    sub_1000063D8(&qword_10000C7A0);
    id v9 = objc_allocWithZone((Class)SidecarItem);
    id v10 = sub_100006F4C();
    id v11 = [v1 request];
    if (v11)
    {
      uint64_t v12 = v11;
      sub_1000063D8(&qword_10000C7A8);
      uint64_t v13 = (__n128 *)sub_100006EDC();
      sub_100006FA0(v13, v14, v15, v16, v17, v18, v19, v20, (__n128)xmmword_100007500, v22, v23, v24);
      sub_100006DC8(0, &qword_10000C7B0);
      id v10 = v10;
      Class isa = sub_100007040().super.isa;
      swift_bridgeObjectRelease();
      [v12 sendItems:isa complete:0];
    }
  }
  else
  {
    [v0 completeRequest:1];
  }
}

uint64_t sub_100005D24(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v6 = a1;
  sub_100007090();
  uint64_t v7 = swift_unknownObjectRelease();
  a4(v7);

  return sub_100006810((uint64_t)&v9);
}

id sub_100005D98(uint64_t a1, uint64_t x1_0, void *a3)
{
  uint64_t v6 = OBJC_IVAR___SignatureViewController_navBar;
  id v7 = objc_allocWithZone((Class)UINavigationBar);
  uint64_t v8 = v3;
  double v9 = sub_100006F8C();
  *(void *)&v3[v6] = [v7 v10:v9];
  uint64_t v11 = OBJC_IVAR___SignatureViewController_titleItem;
  sub_100006DC8(0, &qword_10000C7E0);
  uint64_t v12 = (objc_class *)[self mainBundle];
  v24._countAndFlagsBits = sub_100006E20();
  v13.super.Class isa = v12;
  sub_100006F10(v24, v25, v13, v14, v15, v16, v22);

  *(void *)&v8[v11] = sub_100004884();
  uint64_t v17 = OBJC_IVAR___SignatureViewController_signatureView;
  *(void *)&v8[v17] = sub_100006E8C(objc_allocWithZone((Class)AKSignatureView), "initWithFrame:");
  uint64_t v18 = OBJC_IVAR___SignatureViewController_lineView;
  *(void *)&v8[v18] = sub_100006C30();

  if (x1_0)
  {
    NSString v19 = sub_100007020();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v19 = 0;
  }
  v23.receiver = v8;
  v23.Class super_class = (Class)type metadata accessor for SignatureViewController();
  id v20 = [super initWithNibName:v19 bundle:a3];

  return v20;
}

id sub_100005F80(void *a1)
{
  uint64_t v3 = OBJC_IVAR___SignatureViewController_navBar;
  id v4 = objc_allocWithZone((Class)UINavigationBar);
  id v5 = v1;
  double v6 = sub_100006F8C();
  *(void *)&v1[v3] = [v4 v7:v6];
  uint64_t v8 = OBJC_IVAR___SignatureViewController_titleItem;
  sub_100006DC8(0, &qword_10000C7E0);
  double v9 = (objc_class *)[self mainBundle];
  v20._countAndFlagsBits = sub_100006E20();
  v10.super.Class isa = v9;
  sub_100006F10(v20, v21, v10, v11, v12, v13, v18);

  *(void *)&v5[v8] = sub_100004884();
  uint64_t v14 = OBJC_IVAR___SignatureViewController_signatureView;
  *(void *)&v5[v14] = sub_100006E8C(objc_allocWithZone((Class)AKSignatureView), "initWithFrame:");
  uint64_t v15 = OBJC_IVAR___SignatureViewController_lineView;
  *(void *)&v5[v15] = sub_100006C30();

  v19.receiver = v5;
  v19.Class super_class = (Class)type metadata accessor for SignatureViewController();
  [super initWithCoder:a1];

  return v16;
}

id sub_1000060F4()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for SignatureViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for SignatureViewController()
{
  return self;
}

void sub_1000061B8()
{
  id v1 = v0;
  id v2 = [*(id *)&v0[OBJC_IVAR___SignatureViewController_signatureView] copyStrokedInterpolatedPath];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1000063D8(&qword_10000C798);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100007530;
    *(int64x2_t *)(inited + 32) = vdupq_n_s64(1uLL);
    *(void *)(inited + 64) = &type metadata for Int;
    *(void *)(inited + 72) = 2;
    id v5 = sub_10000641C((uint64_t)v3);
    uint64_t v6 = sub_100006FD0();
    uint64_t v8 = v7;

    *(void *)(inited + 104) = &type metadata for Data;
    *(void *)(inited + 80) = v6;
    *(void *)(inited + 88) = v8;
    sub_100007010();
    sub_1000063D8(&qword_10000C7A0);
    id v9 = objc_allocWithZone((Class)SidecarItem);
    id v10 = sub_100006F4C();
    id v11 = [v1 request];
    if (v11)
    {
      uint64_t v12 = v11;
      sub_1000063D8(&qword_10000C7A8);
      uint64_t v13 = (__n128 *)sub_100006EDC();
      sub_100006FA0(v13, v14, v15, v16, v17, v18, v19, v20, (__n128)xmmword_100007500, v23, v24, v25);
      sub_100006DC8(0, &qword_10000C7B0);
      id v21 = v10;
      Class isa = sub_100007040().super.isa;
      swift_bridgeObjectRelease();
      [v12 sendItems:isa complete:0];
    }
  }
}

uint64_t sub_1000063D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id sub_10000641C(uint64_t a1)
{
  id v1 = +[NSData encodeCGPath:a1];

  return v1;
}

id sub_100006454(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[3];
  if (v6)
  {
    uint64_t v8 = sub_1000067CC(a2, a2[3]);
    uint64_t v9 = *(void *)(v6 - 8);
    __chkstk_darwin(v8, v8);
    id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = sub_100007100();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    sub_100006810((uint64_t)a2);
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = [v3 initWithBarButtonSystemItem:a1 target:v12 action:a3];
  swift_unknownObjectRelease();
  return v13;
}

id sub_1000065AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (a2)
  {
    NSString v10 = sub_100007020();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  uint64_t v11 = a4[3];
  if (v11)
  {
    uint64_t v12 = sub_1000067CC(a4, a4[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12, v12);
    uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_100007100();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_100006810((uint64_t)a4);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [v6 initWithTitle:v10 style:a3 target:v16 action:a5];

  swift_unknownObjectRelease();
  return v17;
}

id sub_100006730(void *a1)
{
  sub_1000067CC(a1, a1[3]);
  uint64_t v3 = sub_100007100();
  NSString v4 = sub_100007020();
  swift_bridgeObjectRelease();
  id v5 = [v1 initWithObject:v3 type:v4];
  swift_unknownObjectRelease();

  sub_100006810((uint64_t)a1);
  return v5;
}

void *sub_1000067CC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006810(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006860(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000068B4(uint64_t a1)
{
  uint64_t v2 = sub_1000063D8(&qword_10000C7B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006914()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000694C()
{
  return [*(id *)(*(void *)(v0 + 16) + OBJC_IVAR___SignatureViewController_signatureView) clear];
}

uint64_t sub_100006968(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006978()
{
  return swift_release();
}

unint64_t sub_100006980()
{
  unint64_t result = qword_10000C7C8;
  if (!qword_10000C7C8)
  {
    sub_100006FE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C7C8);
  }
  return result;
}

unint64_t sub_1000069D0()
{
  unint64_t result = qword_10000C7D8;
  if (!qword_10000C7D8)
  {
    sub_100006A24(&qword_10000C7D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C7D8);
  }
  return result;
}

uint64_t sub_100006A24(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006A6C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000070B0(*(void *)(v2 + 40));

  return sub_100006B0C(a1, v4);
}

uint64_t sub_100006AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100006BD4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1000070C0();
      sub_100006860((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100006BD4(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_100006C30()
{
  id v0 = [objc_alloc(NSClassFromString(@"AKSignatureBaselineView")) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  return v0;
}

uint64_t sub_100006C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063D8(&qword_10000C7B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100006CE0(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100007020();
  swift_bridgeObjectRelease();
  [a3 setText:v4];
}

void sub_100006D44(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  sub_100006DC8(0, a3);
  Class isa = sub_100007040().super.isa;
  swift_bridgeObjectRelease();
  [a2 *a5:isa];
}

uint64_t sub_100006DC8(uint64_t a1, unint64_t *a2)
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

id sub_100006E04()
{
  uint64_t v3 = *(const char **)(v0 + 1288);
  return [v1 v3:1];
}

uint64_t sub_100006E20()
{
  return 0x6E6769532077654ELL;
}

id sub_100006E54()
{
  NSString v4 = *(const char **)(v2 + 1280);
  return [v0 v4:v1];
}

id sub_100006E8C(id a1, SEL a2)
{
  return [a1 a2:0.0:0.0:0.0:0.0];
}

uint64_t sub_100006EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return specialized Array._endMutation()(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_100006EDC()
{
  return swift_allocObject();
}

id sub_100006EF4()
{
  uint64_t v3 = *(const char **)(v0 + 1288);
  return [v1 v3:1];
}

uint64_t sub_100006F10(Swift::String a1, Swift::String_optional a2, NSBundle a3, uint64_t a4, uint64_t a5, uint64_t a6, Swift::String a7)
{
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  return sub_100006FC0(a1, a2, a3, v8, a7);
}

id sub_100006F34()
{
  uint64_t v3 = *(const char **)(v1 + 1272);
  return [v0 v3];
}

id sub_100006F4C()
{
  return sub_100006730((void *)(v0 - 96));
}

id sub_100006F6C(uint64_t a1)
{
  NSString v4 = *(const char **)(v2 + 1280);
  return [v1 v4:a1];
}

double sub_100006F8C()
{
  return 0.0;
}

uint64_t sub_100006FA0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  a1[1] = a9;
  a1[2].n128_u64[0] = v12;
  *(void *)(v13 - 96) = a1;
  return specialized Array._endMutation()(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12);
}

uint64_t sub_100006FC0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100006FD0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006FE0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100006FF0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100007000()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100007010()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_100007020()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007030()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

NSArray sub_100007040()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100007050()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007070()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100007080()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100007090()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000070A0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_1000070B0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000070C0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1000070D0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000070E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000070F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100007100()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_release()
{
  return _swift_release();
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

id objc_msgSend_encodeCGPath_(void *a1, const char *a2, ...)
{
  return [a1 encodeCGPath:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}