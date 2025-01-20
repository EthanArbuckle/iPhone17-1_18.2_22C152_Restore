uint64_t sub_100727F88(uint64_t a1)
{
  return sub_100727F9C(a1, qword_10095A968);
}

uint64_t sub_100727F9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1007649A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000FB44(&qword_100934820);
  sub_100047D88(v8, a2);
  sub_10001076C(v8, (uint64_t)a2);
  if (qword_100932770 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001076C(v3, (uint64_t)qword_100996150);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v9, v3);
  return sub_100758490();
}

char *sub_1007280EC(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100764BD0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = &v5[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_itemLayoutContext];
  uint64_t v16 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button;
  sub_10075B4B0();
  uint64_t v18 = qword_100931AA8;
  v19 = v5;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_10001076C(v10, (uint64_t)qword_100994728);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v20, v10);
  *(void *)&v5[v17] = sub_10075B4A0();
  *(void *)&v19[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_dividerView] = 0;
  v21 = &v19[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_action];
  uint64_t v22 = sub_10000FB44((uint64_t *)&unk_10095A9D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v19[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_hasDivider] = 0;

  v23 = (objc_class *)type metadata accessor for RoundedButtonCollectionViewCell();
  v34.receiver = v19;
  v34.super_class = v23;
  v24 = (char *)objc_msgSendSuper2(&v34, "initWithFrame:", a1, a2, a3, a4);
  id v25 = [v24 contentView];
  objc_msgSend(v25, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  uint64_t v26 = OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button;
  v27 = *(void **)&v24[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button];
  [v27 addTarget:v24 action:"didTapButton:" forControlEvents:64];
  uint64_t v28 = qword_100932748;
  id v29 = v27;
  if (v28 != -1) {
    swift_once();
  }
  [v29 _setCornerRadius:*(double *)&qword_10095A8B0];

  v30 = *(void **)&v24[v26];
  [v30 _setWantsAccessibilityUnderline:0];
  id v31 = [v24 contentView];
  id v32 = v30;
  [v31 addSubview:v32];

  return v24;
}

id sub_10072849C()
{
  v1 = v0;
  uint64_t v2 = sub_100768B20();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DividerView.Style(0);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (objc_class *)type metadata accessor for RoundedButtonCollectionViewCell();
  v57.receiver = v0;
  v57.super_class = v11;
  objc_msgSendSuper2(&v57, "layoutSubviews");
  id v12 = [v0 contentView];
  sub_10001A860(0, (unint64_t *)&qword_100932C80);
  sub_10075C580();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = *(void **)&v1[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_dividerView];
  if (v21)
  {
    uint64_t v22 = (uint64_t)v21 + OBJC_IVAR____TtC22SubscribePageExtension11DividerView_style;
    swift_beginAccess();
    sub_10012A968(v22, (uint64_t)v10);
    uint64_t v23 = qword_100931400;
    id v24 = v21;
    if (v23 != -1) {
      swift_once();
    }
    double v25 = floor(*(double *)&qword_100993418);
    sub_100764970();
    uint64_t v26 = sub_100765180();
    sub_100764C00();
    double v28 = v27;
    id v29 = *(void (**)(char *, uint64_t))(v3 + 8);
    v29(v6, v2);
    double v30 = v25 + v28;
    sub_10012AA30((uint64_t)v10);
    if (qword_100932778 != -1) {
      swift_once();
    }
    sub_10001076C(v26, (uint64_t)qword_10095A908);
    sub_100764970();
    sub_100764C00();
    double v32 = v31;
    v29(v6, v2);
    objc_msgSend(v24, "setFrame:", 0.0, v32, v18, v30);
    v58.origin.x = 0.0;
    v58.origin.y = v32;
    v58.size.width = v18;
    v58.size.height = v30;
    double MaxY = CGRectGetMaxY(v58);
    if (qword_100932780 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_10000FB44(&qword_100934820);
    sub_10001076C(v34, (uint64_t)qword_10095A920);
    sub_100764970();
    sub_1007584B0();
    double v36 = v35;

    v29(v6, v2);
    double v37 = MaxY + v36;
  }
  else
  {
    if (qword_100932790 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_100765180();
    sub_10001076C(v38, (uint64_t)qword_10095A950);
    sub_100764970();
    sub_100764C00();
    double v37 = v39;
    id v29 = *(void (**)(char *, uint64_t))(v3 + 8);
    v29(v6, v2);
  }
  v40 = *(void **)&v1[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button];
  id v41 = [v40 imageForState:0];

  if (v41)
  {
    if (UIAccessibilityIsBoldTextEnabled())
    {
      if (qword_100932760 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_100765180();
      v43 = qword_10095A8D8;
    }
    else
    {
      if (qword_100932758 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_100765180();
      v43 = qword_10095A8C0;
    }
    sub_10001076C(v42, (uint64_t)v43);
    sub_100764970();
    sub_100764C00();
    double v46 = v45;
    v29(v6, v2);
    double v44 = ceil(v46 * 0.5);
  }
  else
  {
    double v44 = 0.0;
  }
  id v47 = [v1 traitCollection];
  char v48 = sub_100767D00();

  if (v48) {
    double v49 = -v44;
  }
  else {
    double v49 = v44;
  }
  if (qword_100932750 != -1) {
    swift_once();
  }
  objc_msgSend(v40, "setContentEdgeInsets:", 0.0, v44 + *(double *)&qword_10095A8B8, 0.0, v44 + v44 + *(double *)&qword_10095A8B8);
  objc_msgSend(v40, "setImageEdgeInsets:", 0.0, -v49, 0.0, v49);
  objc_msgSend(v40, "setTitleEdgeInsets:", 0.0, v49, 0.0, -v49);
  objc_msgSend(v40, "sizeThatFits:", v18, v20);
  double v51 = v50;
  if (qword_100932768 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_100765180();
  sub_10001076C(v52, (uint64_t)qword_10095A8F0);
  sub_100764970();
  sub_100764C00();
  double v54 = v53;
  v29(v6, v2);
  v59.origin.x = v14;
  v59.origin.y = v16;
  v59.size.width = v18;
  v59.size.height = v20;
  return objc_msgSend(v40, "setFrame:", CGRectGetMidX(v59) + v51 * -0.5, v37, v51, v54);
}

uint64_t sub_100728C00(void *a1)
{
  uint64_t v3 = sub_10000FB44(&qword_10095A9E0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10000FB44((uint64_t *)&unk_10095A9D0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = v1 + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_action;
  swift_beginAccess();
  sub_100729B04(v12, (uint64_t)v6);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_10000FED8((uint64_t)v6, &qword_10095A9E0);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v11, v6, v7);
  id v14 = [a1 bounds];
  char v29 = 1;
  uint64_t v32 = 15;
  v28[0] = a1;
  v28[1] = v15;
  v28[2] = v16;
  v28[3] = v17;
  v28[4] = v18;
  __asm { FMOV            V0.2D, #10.0 }
  long long v30 = _Q0;
  long long v31 = _Q0;
  __chkstk_darwin(v14, v24);
  *(void *)&v27[-16] = v11;
  id v25 = a1;
  sub_100727618((uint64_t)v28, (void (*)(id *))sub_100729B6C, (uint64_t)&v27[-32], v26);

  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_100728E38()
{
  uint64_t v0 = sub_100766800();
  uint64_t v35 = *(void *)(v0 - 8);
  uint64_t v36 = v0;
  __chkstk_darwin(v0, v1);
  uint64_t v32 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100767040();
  uint64_t v3 = *(void *)(v30 - 8);
  __chkstk_darwin(v30, v4);
  char v29 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_10000FB44((uint64_t *)&unk_100933BF0);
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  __chkstk_darwin(v10, v11);
  long long v31 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000FB44((uint64_t *)&unk_100936B80);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FB44((uint64_t *)&unk_10095A9D0);
  sub_10075A380();
  sub_100758690();
  if (!swift_dynamicCastClass()) {
    return swift_release();
  }
  sub_100758680();
  uint64_t v17 = sub_10000FB44((uint64_t *)&unk_100933C00);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    swift_release();
    return sub_10000FED8((uint64_t)v16, (uint64_t *)&unk_100936B80);
  }
  else
  {
    uint64_t v28 = v17;
    sub_10075A390();
    uint64_t v20 = v37[6];
    v37[3] = sub_100763930();
    v37[4] = sub_100062E2C();
    v37[0] = v20;
    swift_retain();
    sub_1004017B0();
    uint64_t v21 = v30;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v29, v9, v30);
    uint64_t v27 = v18;
    uint64_t v22 = v32;
    sub_1007667E0();
    sub_100766C40();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v36);
    uint64_t v23 = v31;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v31, v9, v21);
    uint64_t v25 = v33;
    uint64_t v24 = v34;
    (*(void (**)(char *, void, uint64_t))(v33 + 104))(v23, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v34);
    uint64_t v26 = v28;
    sub_100766D00();
    swift_release();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v37);
    swift_release();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v16, v26);
  }
}

id sub_10072931C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RoundedButtonCollectionViewCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1007293C4()
{
  return type metadata accessor for RoundedButtonCollectionViewCell();
}

uint64_t type metadata accessor for RoundedButtonCollectionViewCell()
{
  uint64_t result = qword_10095A9B0;
  if (!qword_10095A9B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100729418()
{
  sub_10001A3E4();
  if (v0 <= 0x3F)
  {
    sub_100729504();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100729504()
{
  if (!qword_10095A9C8)
  {
    sub_10000FC88((uint64_t *)&unk_10095A9D0);
    unint64_t v0 = sub_100768690();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10095A9C8);
    }
  }
}

double sub_100729560()
{
  uint64_t v0 = sub_10000FB44(&qword_100934820);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100768B20();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100759630())
  {
    uint64_t v36 = v1;
    if (qword_100932778 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100765180();
    sub_10001076C(v10, (uint64_t)qword_10095A908);
    swift_getObjectType();
    sub_100764970();
    sub_100764C00();
    double v12 = v11;
    uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
    v13(v9, v5);
    type metadata accessor for DividerView(0);
    if (qword_100931410 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for DividerView.Style(0);
    sub_10001076C(v14, (uint64_t)qword_100993438);
    double v15 = v12 + sub_1004D73FC();
    if (qword_100932780 != -1) {
      swift_once();
    }
    sub_10001076C(v0, (uint64_t)qword_10095A920);
    sub_100764970();
    sub_1007584B0();
    double v17 = v16;
    v13(v9, v5);
    double v18 = v15 + v17;
    if (qword_100932768 != -1) {
      swift_once();
    }
    sub_10001076C(v10, (uint64_t)qword_10095A8F0);
    sub_100764970();
    sub_100764C00();
    double v20 = v19;
    v13(v9, v5);
    double v21 = v18 + v20;
    if (qword_100932788 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_10001076C(v0, (uint64_t)qword_10095A938);
    uint64_t v23 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v4, v22, v0);
    sub_100764970();
    sub_1007584B0();
    double v25 = v24;
    v13(v9, v5);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v0);
  }
  else
  {
    if (qword_100932790 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100765180();
    sub_10001076C(v26, (uint64_t)qword_10095A950);
    sub_100764970();
    sub_100764C00();
    double v28 = v27;
    char v29 = *(void (**)(char *, uint64_t))(v6 + 8);
    v29(v9, v5);
    if (qword_100932768 != -1) {
      swift_once();
    }
    sub_10001076C(v26, (uint64_t)qword_10095A8F0);
    sub_100764970();
    sub_100764C00();
    double v31 = v30;
    v29(v9, v5);
    double v21 = v28 + v31;
    if (qword_100932798 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_10001076C(v0, (uint64_t)qword_10095A968);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v32, v0);
    sub_100764970();
    sub_1007584B0();
    double v25 = v33;
    v29(v9, v5);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  }
  return v21 + v25;
}

uint64_t sub_100729B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000FB44(&qword_10095A9E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100729B6C()
{
  return sub_100728E38();
}

void sub_100729B88()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100764BD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_itemLayoutContext];
  uint64_t v8 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button;
  sub_10075B4B0();
  if (qword_100931AA8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10001076C(v2, (uint64_t)qword_100994728);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
  *(void *)&v1[v9] = sub_10075B4A0();
  *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_dividerView] = 0;
  double v11 = &v1[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_action];
  uint64_t v12 = sub_10000FB44((uint64_t *)&unk_10095A9D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v1[OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_hasDivider] = 0;

  sub_100768A40();
  __break(1u);
}

uint64_t sub_100729DA4()
{
  sub_10000FB44(&qword_100934A70);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1007B9A20;
  uint64_t v1 = self;
  *(void *)(v0 + 32) = [v1 blackColor];
  id v2 = [v1 blackColor];
  id v3 = [v2 colorWithAlphaComponent:0.4];

  *(void *)(v0 + 40) = v3;
  id v4 = [v1 blackColor];
  id v5 = [v4 colorWithAlphaComponent:0.0];

  *(void *)(v0 + 48) = v5;
  uint64_t result = sub_100767810();
  qword_10095A9E8 = v0;
  return result;
}

uint64_t sub_100729EB8()
{
  sub_10000FB44(&qword_100934A70);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1007B9A20;
  sub_100010808();
  *(UIColor *)(v0 + 32) = sub_100768390(0.43137, 0.43137, 0.43137, 0.6);
  *(UIColor *)(v0 + 40) = sub_100768390(0.35294, 0.35294, 0.35294, 0.5);
  *(UIColor *)(v0 + 48) = sub_100768390(0.27146, 0.2665, 0.26659, 0.2);
  uint64_t result = sub_100767810();
  qword_10095A9F0 = v0;
  return result;
}

char *sub_100729FB0()
{
  uint64_t v2 = OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_colors;
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension23MultiCornerGradientView_colors);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_32:
    swift_bridgeObjectRelease();
    double v12 = _swiftEmptyArrayStorage[2];
    if (v12 != 0.0) {
      goto LABEL_12;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100768A60();
  if (!v4) {
    goto LABEL_32;
  }
LABEL_3:
  sub_100024C54(0, v4 & ~(v4 >> 63), 0);
  if (v4 < 0)
  {
    __break(1u);
    goto LABEL_44;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_100768950();
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    uint64_t v7 = v6;
    [v6 _luminance];
    double v9 = v8;

    double v11 = _swiftEmptyArrayStorage[2];
    double v10 = _swiftEmptyArrayStorage[3];
    if (*(void *)&v11 >= *(void *)&v10 >> 1) {
      sub_100024C54(*(void *)&v10 > 1uLL, *(void *)&v11 + 1, 1);
    }
    *(void *)&_swiftEmptyArrayStorage[2] = *(void *)&v11 + 1;
    _swiftEmptyArrayStorage[*(void *)&v11 + 4] = v9;
  }
  swift_bridgeObjectRelease();
  double v12 = _swiftEmptyArrayStorage[2];
  if (v12 == 0.0) {
    goto LABEL_33;
  }
LABEL_12:
  if (*(void *)&v12 == 1)
  {
    uint64_t v13 = 0;
    double v1 = 0.0;
LABEL_17:
    uint64_t v16 = *(void *)&v12 - v13;
    double v17 = &_swiftEmptyArrayStorage[v13 + 4];
    do
    {
      double v18 = *v17++;
      double v1 = v1 + v18;
      --v16;
    }
    while (v16);
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)&v12 & 0x7FFFFFFFFFFFFFFELL;
  uint64_t v14 = &_swiftEmptyArrayStorage[5];
  double v1 = 0.0;
  uint64_t v15 = *(void *)&v12 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v1 = v1 + *(v14 - 1) + *v14;
    v14 += 2;
    v15 -= 2;
  }
  while (v15);
  if (*(void *)&v12 != v13) {
    goto LABEL_17;
  }
LABEL_19:
  swift_bridgeObjectRelease();
  if (v1 <= 0.0)
  {
LABEL_34:
    if (qword_1009327A8 != -1) {
      swift_once();
    }
    uint64_t v23 = &qword_10095A9F0;
    *(double *)&uint64_t v24 = 0.6;
    goto LABEL_37;
  }
  unint64_t v19 = *(void *)(v0 + v2);
  if (!(v19 >> 62))
  {
    uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_22;
  }
LABEL_44:
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_100768A60();
  swift_bridgeObjectRelease();
LABEL_22:
  double v21 = v1 / (double)v20;
  if (v21 == 0.0) {
    goto LABEL_34;
  }
  if (v21 < COERCE_DOUBLE(1) || v21 >= 0.83)
  {
    if (qword_1009327A0 != -1) {
      swift_once();
    }
    uint64_t v23 = &qword_10095A9E8;
    *(double *)&uint64_t v24 = 0.7;
LABEL_37:
    double v22 = *(double *)&v24;
    goto LABEL_38;
  }
  double v22 = 0.2;
  if (qword_1009327A0 != -1) {
    swift_once();
  }
  uint64_t v23 = &qword_10095A9E8;
LABEL_38:
  uint64_t v25 = *v23;
  swift_bridgeObjectRetain();
  if (qword_100930280 != -1) {
    swift_once();
  }
  long long v26 = xmmword_10098FA40;
  if (qword_100930278 != -1) {
    swift_once();
  }
  long long v27 = xmmword_10098FA30;
  sub_10000FB44(&qword_10093A5C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1007B8200;
  *(_OWORD *)(inited + 32) = xmmword_1007D3690;
  *(void *)(inited + 48) = 0x3FF0000000000000;
  char v29 = sub_10005D550(v25, *(double *)&v26, *((double *)&v26 + 1), *(double *)&v27, *((double *)&v27 + 1), inited, 0);
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  id v30 = [v29 layer];
  [v30 setCompositingFilter:kCAFilterPlusD];

  [v29 setAlpha:v22];
  return v29;
}

id sub_10072A5A8()
{
  sub_10005C508();
  uint64_t v1 = OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView;
  [*(id *)&v0[OBJC_IVAR____TtC22SubscribePageExtension28MultiAppFallbackGradientView_overlayGradientView] removeFromSuperview];
  uint64_t v2 = sub_100729FB0();
  unint64_t v3 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v2;

  [v0 addSubview:*(void *)&v0[v1]];
  [v0 setNeedsLayout];

  return [v0 setNeedsDisplay];
}

void sub_10072A630()
{
}

uint64_t type metadata accessor for MultiAppFallbackGradientView()
{
  return self;
}

ValueMetadata *type metadata accessor for OfferActionImplementation()
{
  return &type metadata for OfferActionImplementation;
}

uint64_t sub_10072A688()
{
  return sub_10072EEAC(&qword_100939548, (void (*)(uint64_t))&type metadata accessor for OfferAction);
}

uint64_t sub_10072A6BC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_10001A860(0, &qword_10095AA48);
    uint64_t v4 = sub_100767800();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10072A760(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100766B10();
  __chkstk_darwin(v4 - 8, v5);
  v106[1] = (char *)v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_10075D000();
  uint64_t v110 = *(void *)(v111 - 8);
  __chkstk_darwin(v111, v7);
  v106[0] = (char *)v106 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v10);
  v109 = (char *)v106 - v11;
  uint64_t v12 = sub_100766B20();
  uint64_t v122 = *(void *)(v12 - 8);
  uint64_t v123 = v12;
  __chkstk_darwin(v12, v13);
  v121 = (char *)v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100757230();
  uint64_t v115 = *(void *)(v15 - 8);
  uint64_t v116 = v15;
  __chkstk_darwin(v15, v16);
  v113 = (char *)v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_1007572A0();
  uint64_t v134 = *(void *)(v132 - 8);
  __chkstk_darwin(v132, v18);
  v108 = (char *)v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20, v21);
  v112 = (char *)v106 - v22;
  __chkstk_darwin(v23, v24);
  v124 = (char *)v106 - v25;
  __chkstk_darwin(v26, v27);
  v133 = (char *)v106 - v28;
  __chkstk_darwin(v29, v30);
  uint64_t v32 = (char *)v106 - v31;
  __chkstk_darwin(v33, v34);
  uint64_t v36 = (char *)v106 - v35;
  uint64_t v37 = sub_100763990();
  uint64_t v38 = *(void *)(v37 - 8);
  __chkstk_darwin(v37, v39);
  v107 = (char *)v106 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v41, v42);
  double v44 = (char *)v106 - v43;
  uint64_t v114 = sub_10000FB44(&qword_100942600);
  uint64_t v130 = sub_1007672D0();
  uint64_t v125 = a2;
  uint64_t v45 = sub_100763D40();
  uint64_t v47 = v46;
  uint64_t ObjectType = swift_getObjectType();
  sub_1007586E0();
  uint64_t v129 = v45;
  uint64_t v117 = ObjectType;
  uint64_t v118 = v47;
  uint64_t v49 = v132;
  uint64_t v50 = sub_100757500();
  uint64_t v52 = v51;
  double v53 = *(void (**)(char *, uint64_t))(v38 + 8);
  v119 = v44;
  uint64_t v120 = v37;
  double v54 = v53;
  uint64_t v55 = v37;
  uint64_t v56 = v52;
  v53(v44, v55);
  swift_getObjectType();
  uint64_t v57 = a1;
  uint64_t v58 = v134;
  uint64_t v127 = v57;
  sub_1007586D0();
  uint64_t v128 = v50;
  sub_100757400();
  CGRect v59 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v131 = v36;
  v60 = v36;
  v61 = v32;
  v59(v32, v60, v49);
  int v62 = (*(uint64_t (**)(char *, uint64_t))(v58 + 88))(v32, v49);
  if (v62 == enum case for LegacyAppState.waiting(_:))
  {
    v63 = v133;
    v59(v133, v61, v49);
    (*(void (**)(char *, uint64_t))(v58 + 96))(v63, v49);
    uint64_t v64 = sub_10075AAE0();
    (*(void (**)(char *, uint64_t))(*(void *)(v64 - 8) + 8))(v63, v64);
LABEL_3:
    v65 = *(void (**)(char *, uint64_t))(v58 + 8);
    v65(v61, v49);
    sub_10072CF2C(v127, 1, v128, v56);
LABEL_15:
    uint64_t v76 = v130;
    sub_100767260();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    v65(v131, v49);
    return v76;
  }
  v66 = v133;
  if (v62 == enum case for LegacyAppState.purchased(_:))
  {
    v67 = v124;
    v59(v124, v61, v49);
    (*(void (**)(char *, uint64_t))(v58 + 96))(v67, v49);
    uint64_t v68 = sub_100758F80();
    uint64_t v69 = *(void *)(v68 - 8);
    int v70 = (*(uint64_t (**)(char *, uint64_t))(v69 + 88))(v67, v68);
    uint64_t v71 = v127;
    if (v70 != enum case for PurchaseType.preorder(_:))
    {
      (*(void (**)(char *, uint64_t))(v69 + 8))(v67, v68);
LABEL_7:
      v72 = v119;
      sub_1007586E0();
      sub_1007574D0();
      v54(v72, v120);
      v74 = v121;
      uint64_t v73 = v122;
      uint64_t v75 = v123;
      (*(void (**)(char *, void, uint64_t))(v122 + 104))(v121, enum case for ActionOutcome.performed(_:), v123);
      uint64_t v76 = v130;
      sub_1007672C0();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v75);
      v77 = *(void (**)(char *, uint64_t))(v58 + 8);
      v77(v131, v49);
      v77(v61, v49);
      return v76;
    }
LABEL_14:
    v65 = *(void (**)(char *, uint64_t))(v58 + 8);
    v65(v61, v49);
    sub_10072B4E4(v71, v128, v56, v125);
    goto LABEL_15;
  }
  if (v62 == enum case for LegacyAppState.updatable(_:) || v62 == enum case for LegacyAppState.downloadable(_:))
  {
    v59(v133, v61, v49);
    (*(void (**)(char *, uint64_t))(v58 + 96))(v66, v49);
    swift_bridgeObjectRelease();
    uint64_t v71 = v127;
    goto LABEL_14;
  }
  if (v62 == enum case for LegacyAppState.paused(_:))
  {
    v78 = v112;
    v59(v112, v61, v49);
    uint64_t v79 = v58;
    (*(void (**)(char *, uint64_t))(v58 + 96))(v78, v49);
    uint64_t v81 = v115;
    uint64_t v80 = v116;
    v82 = v113;
    (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v113, v78, v116);
    v83 = (void *)sub_100757210();
    uint64_t v76 = v130;
    if (v83)
    {
      v84 = v83;
      [v83 resume];
      (*(void (**)(char *, void, uint64_t))(v122 + 104))(v121, enum case for ActionOutcome.performed(_:), v123);
      sub_100767290();
    }
    else
    {
      (*(void (**)(char *, void, uint64_t))(v122 + 104))(v121, enum case for ActionOutcome.unsupported(_:), v123);
      sub_100767290();
    }
    sub_100767260();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v80);
    v94 = *(void (**)(char *, uint64_t))(v79 + 8);
    v94(v131, v49);
    v94(v61, v49);
  }
  else
  {
    if (v62 == enum case for LegacyAppState.downloading(_:))
    {
      v59(v133, v61, v49);
      (*(void (**)(char *, uint64_t))(v58 + 96))(v66, v49);
      (*(void (**)(char *, uint64_t))(v115 + 8))(v66, v116);
      goto LABEL_3;
    }
    if (v62 != enum case for LegacyAppState.openable(_:))
    {
      uint64_t v71 = v127;
      if (v62 != enum case for LegacyAppState.buyable(_:) && v62 != enum case for LegacyAppState.unknown(_:)) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
    v86 = v108;
    v59(v108, v61, v49);
    (*(void (**)(char *, uint64_t))(v58 + 96))(v86, v49);

    uint64_t v87 = v110;
    v88 = v109;
    (*(void (**)(char *, char *, uint64_t))(v110 + 32))(v109, v86, v111);
    v89 = v107;
    sub_1007586E0();
    v90 = (char *)sub_100763940();
    v91 = v89;
    uint64_t v92 = v120;
    v54(v91, v120);
    if (v90)
    {
      v133 = v90;
      sub_10075D670();
      sub_100766C70();
      if (v135)
      {
        v93 = v119;
        sub_1007586E0();
        sub_10075D660();
        swift_release();
        v54(v93, v92);
      }
      uint64_t v76 = v130;
      sub_1007586E0();
      uint64_t v87 = v110;
      v100 = v109;
      uint64_t v103 = v111;
      (*(void (**)(void, char *, uint64_t))(v110 + 16))(v106[0], v109, v111);
      sub_100766AF0();
      sub_1007571A0();
      swift_allocObject();
      uint64_t v104 = sub_100757180();
      sub_10072DEC0(v104, v125, v126, (uint64_t (*)(void))&type metadata accessor for OpenAppAction, &qword_100939560, (void (*)(uint64_t))&type metadata accessor for OpenAppAction);
      swift_release();

      v102 = v131;
    }
    else
    {
      v95 = v119;
      sub_1007586E0();
      v96 = v88;
      uint64_t v97 = sub_100763950();
      uint64_t v99 = v98;
      v54(v95, v92);
      v100 = v96;
      sub_10072DDA0();
      swift_allocError();
      *(void *)uint64_t v101 = v97;
      *(void *)(v101 + 8) = v99;
      *(unsigned char *)(v101 + 16) = 0;
      sub_100767280();
      uint64_t v76 = v130;
      v102 = v131;
      uint64_t v103 = v111;
    }
    sub_100767260();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v100, v103);
    v105 = *(void (**)(char *, uint64_t))(v134 + 8);
    v105(v102, v49);
    v105(v61, v49);
  }
  return v76;
}

id sub_10072B4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = a3;
  uint64_t v7 = sub_1007572A0();
  uint64_t v38 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100763990();
  uint64_t v37 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000FB44(&qword_10095AA30);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100759CC0();
  uint64_t v19 = *(void *)(v42 - 8);
  __chkstk_darwin(v42, v20);
  uint64_t v41 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AdHeaderProvider();
  uint64_t v40 = a4;
  sub_100766C70();
  if (v44[0])
  {
    swift_retain();
    sub_10000FB44(&qword_10095AA38);
    sub_100762D40();
    swift_release();
  }
  swift_unknownObjectRetain();
  swift_retain();
  sub_100759CB0();
  uint64_t v22 = v42;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v42) == 1)
  {
    sub_10000FED8((uint64_t)v18, &qword_10095AA30);
    sub_10000FB44(&qword_100942600);
    sub_10072DDA0();
    swift_allocError();
    *(void *)uint64_t v23 = 0;
    *(void *)(v23 + 8) = 0;
    *(unsigned char *)(v23 + 16) = 5;
    uint64_t v24 = sub_100767280();
    swift_release();
    return (id)v24;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v41, v18, v22);
  sub_10000FB44(&qword_100942600);
  uint64_t v36 = sub_1007672D0();
  sub_10075D670();
  sub_100766C70();
  if (v44[0])
  {
    sub_1007586E0();
    swift_getObjectType();
    sub_1007573F0();
    sub_10075D640();
    swift_release();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v11);
  }
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v26 = result;
    NSString v27 = sub_1007675C0();
    unsigned __int8 v28 = [v26 applicationIsInstalled:v27];

    if (v28)
    {
      sub_1007586F0();
      if (!v29
        || (objc_allocWithZone((Class)LSApplicationRecord),
            swift_bridgeObjectRetain(),
            id v35 = sub_10072DDF4(),
            v35,
            swift_bridgeObjectRelease(),
            !v35))
      {
        sub_100764120();
        sub_100758690();
        uint64_t v30 = v40;
        sub_100767240();
        uint64_t v31 = v41;
        sub_100764110();
        sub_1004D019C(v39, (uint64_t)v44);
        uint64_t v32 = (void *)swift_allocObject();
        uint64_t v24 = v36;
        v32[2] = v36;
        sub_1006E4064((uint64_t)v44, (uint64_t)(v32 + 3));
        v32[5] = a1;
        v32[6] = v30;
        uint64_t v33 = sub_10001A860(0, (unint64_t *)&qword_100940210);
        swift_retain();
        swift_retain();
        swift_retain();
        uint64_t v34 = sub_100767C80();
        v44[3] = v33;
        v44[4] = &protocol witness table for OS_dispatch_queue;
        v44[0] = v34;
        sub_100767270();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v44);
        (*(void (**)(char *, uint64_t))(v19 + 8))(v31, v42);
        return (id)v24;
      }
      sub_10072BB5C(a1, a2, v43, v40);
    }
    else
    {
      sub_10072E380(a1, v40);
    }
    uint64_t v24 = v36;
    sub_100767260();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v41, v42);
    return (id)v24;
  }
  __break(1u);
  return result;
}

uint64_t sub_10072BB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = a4;
  uint64_t v44 = a2;
  uint64_t v45 = a3;
  uint64_t v5 = sub_1007572A0();
  uint64_t v43 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10075AAE0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  uint64_t v48 = v10;
  __chkstk_darwin(v9, v11);
  uint64_t v46 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100763990();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007586F0();
  if (!v18) {
    goto LABEL_4;
  }
  uint64_t v41 = v4;
  id v19 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain_n();
  id v25 = sub_10072DDF4();

  swift_bridgeObjectRelease();
  if (!v25)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    sub_10000FB44(&qword_100942600);
    uint64_t v20 = sub_1007586F0();
    uint64_t v22 = v21;
    sub_10072DDA0();
    swift_allocError();
    *(void *)uint64_t v23 = v20;
    *(void *)(v23 + 8) = v22;
    *(unsigned char *)(v23 + 16) = 3;
    return sub_100767280();
  }
  id v26 = objc_allocWithZone((Class)ASDSystemAppRequest);
  NSString v27 = sub_1007675C0();
  swift_bridgeObjectRelease();
  id v28 = [v26 initWithBundleID:v27];

  sub_1007586E0();
  uint64_t v29 = (void *)sub_100763940();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v14 + 8);
  v39(v17, v13);
  [v28 setStoreItemID:v29];

  uint64_t v40 = v28;
  [v28 setUserInitiated:1];
  swift_getObjectType();
  sub_1007573F0();
  uint64_t v30 = v43;
  int v31 = (*(uint64_t (**)(char *, uint64_t))(v43 + 88))(v8, v5);
  if (v31 == enum case for LegacyAppState.downloadable(_:))
  {
    (*(void (**)(char *, uint64_t))(v30 + 96))(v8, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v48 + 104))(v46, enum case for InstallationType.redownload(_:), v47);
  }
  else
  {
    uint64_t v32 = *(void (**)(char *, void, uint64_t))(v48 + 104);
    if (v31 == enum case for LegacyAppState.buyable(_:) || v31 == enum case for LegacyAppState.unknown(_:))
    {
      v32(v46, enum case for InstallationType.purchase(_:), v47);
    }
    else
    {
      v32(v46, enum case for InstallationType.unknown(_:), v47);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v5);
    }
  }
  uint64_t v33 = v42;
  if (!sub_1007573D0()) {
    sub_100763D40();
  }
  swift_getObjectType();
  sub_1007586E0();
  uint64_t v34 = v46;
  sub_1007574E0();
  id v35 = v39;
  v39(v17, v13);
  sub_1007586E0();
  uint64_t v36 = v40;
  uint64_t v37 = sub_10072C980(v40, (uint64_t)v17, v33);
  swift_unknownObjectRelease();

  v35(v17, v13);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v47);
  return v37;
}

uint64_t sub_10072C064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v48 = a4;
  uint64_t v49 = a2;
  v45[1] = *a5;
  uint64_t v46 = a3;
  uint64_t v7 = sub_100763990();
  uint64_t v47 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100766B20();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100759CD0();
  uint64_t v17 = *(void *)(v16 - 8);
  __n128 v19 = __chkstk_darwin(v16, v18);
  uint64_t v21 = (char *)v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v17 + 16))(v21, a1, v16, v19);
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v21, v16);
  if (v22 == enum case for PurchaseResult.askToBuy(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v21, v16);
    uint64_t v48 = *((void *)v21 + 1);
    id v23 = [self defaultCenter];
    uint64_t v24 = (void *)sub_100762480();
    sub_10000FB44(&qword_100938B00);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1007B8540;
    uint64_t v50 = sub_100762490();
    uint64_t v51 = v26;
    sub_1007688D0();
    *(void *)(inited + 96) = v7;
    sub_1000107A4((uint64_t *)(inited + 72));
    sub_100763970();
    sub_100421E20(inited);
    Class isa = sub_100767470().super.isa;
    swift_bridgeObjectRelease();
    [v23 postNotificationName:v24 object:0 userInfo:isa];

    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for ActionOutcome.performed(_:), v11);
    sub_1007672C0();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  if (v22 != enum case for PurchaseResult.completed(_:))
  {
    if (v22 == enum case for PurchaseResult.canceled(_:))
    {
      sub_1007586E0();
      uint64_t v37 = sub_100763950();
      uint64_t v39 = v38;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v7);
      sub_10072DDA0();
      swift_allocError();
      *(void *)uint64_t v40 = v37;
      *(void *)(v40 + 8) = v39;
      *(unsigned char *)(v40 + 16) = 1;
    }
    else
    {
      if (v22 != enum case for PurchaseResult.unknown(_:)) {
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v16);
      }
      sub_1007586E0();
      uint64_t v41 = sub_100763950();
      uint64_t v43 = v42;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v7);
      sub_10072DDA0();
      swift_allocError();
      *(void *)uint64_t v44 = v41;
      *(void *)(v44 + 8) = v43;
      *(unsigned char *)(v44 + 16) = 2;
    }
    sub_1007672B0();
    return swift_errorRelease();
  }
  (*(void (**)(char *, uint64_t))(v17 + 96))(v21, v16);
  int v29 = v21[2];
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for ActionOutcome.performed(_:), v11);
  sub_1007672C0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t v30 = v46;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v31 = *(void *)(v30 + 8);
    uint64_t ObjectType = swift_getObjectType();
    sub_1007586E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 8))(v10, 0, ObjectType, v31);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v7);
  }
  uint64_t result = sub_1007586A0();
  if (result)
  {
    sub_10072DEC0(result, (uint64_t)a5, v30, (uint64_t (*)(void))&type metadata accessor for Action, (unint64_t *)&qword_100936B90, (void (*)(uint64_t))&type metadata accessor for Action);
    swift_release();
    uint64_t result = swift_release();
  }
  if (v29)
  {
    type metadata accessor for InAppMessagesManager();
    sub_100767240();
    uint64_t v33 = *(void **)(v50 + 16);
    id v34 = objc_allocWithZone((Class)IAMCountableEvent);
    NSString v35 = sub_1007675C0();
    id v36 = [v34 initWithName:v35];

    [v33 receiveEvent:v36];
    sub_10010D810();
    return swift_release();
  }
  return result;
}

uint64_t sub_10072C71C()
{
  uint64_t v0 = sub_100767330();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100932818 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10001076C(v0, (uint64_t)qword_100996388);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  sub_10000FB44(&qword_10093C6D0);
  sub_100766940();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1007B8210;
  sub_100766890();
  swift_getErrorValue();
  uint64_t v6 = v10;
  uint64_t v7 = v11;
  v12[3] = v11;
  uint64_t v8 = sub_1000107A4(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v8, v6, v7);
  sub_100766930();
  sub_10000FED8((uint64_t)v12, &qword_1009360F0);
  sub_100767210();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_10072C980(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100763990();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8, v11);
  sub_10000FB44(&qword_100942600);
  uint64_t v12 = sub_1007672D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v8);
  sub_1004D019C(v4, (uint64_t)v18);
  unint64_t v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = v12;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  sub_1006E4064((uint64_t)v18, v14 + ((v10 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  aBlock[4] = sub_10072EA94;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1005B9CCC;
  aBlock[3] = &unk_10088F6E8;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  [a1 startWithErrorHandler:v15];
  _Block_release(v15);
  return v12;
}

uint64_t sub_10072CB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_100763990();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9, v12);
  unint64_t v13 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100763D40();
  uint64_t v16 = v15;
  if (a1)
  {
    swift_errorRetain();
    sub_1007672B0();
    swift_getObjectType();
    sub_100757520();
    swift_unknownObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    uint64_t v27 = a3;
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v18 = a4;
      uint64_t v19 = *(void *)(a5 + 8);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v21 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 8);
      uint64_t v22 = v19;
      a4 = v18;
      v21(v18, 0, ObjectType, v22);
      swift_unknownObjectRelease();
    }
    swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v9);
    unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    unint64_t v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v14;
    *(void *)(v25 + 24) = v16;
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v25 + v23, v13, v9);
    *(void *)(v25 + v24) = v27;
    swift_unknownObjectRetain();
    swift_retain();
    sub_100757510();
    swift_release();
    return swift_unknownObjectRelease();
  }
}

uint64_t sub_10072CE04()
{
  uint64_t v0 = sub_100766B20();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_100757520();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for ActionOutcome.performed(_:), v0);
  sub_1007672C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_10072CF2C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v65 = a4;
  int v60 = a2;
  uint64_t v66 = sub_100764930();
  uint64_t v62 = *(void *)(v66 - 8);
  uint64_t v6 = *(void *)(v62 + 64);
  __chkstk_darwin(v66, v7);
  uint64_t v64 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v54 - v10;
  uint64_t v12 = sub_100763990();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v54 - v19;
  uint64_t v63 = a1;
  sub_1007586E0();
  uint64_t v21 = (void *)sub_100763940();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v20, v12);
  if (v21)
  {
    sub_10000FB44(&qword_100942600);
    uint64_t v23 = sub_1007672D0();
    swift_getObjectType();
    int v24 = sub_1007573B0() & v60;
    if (v24) {
      uint64_t v25 = "ActionDispatcher[ASDAppQuery.BetaApps]:cancelAction";
    }
    else {
      uint64_t v25 = "ActionDispatcher[ASDAppQuery]:cancelAction";
    }
    if (v24) {
      uint64_t v26 = 51;
    }
    else {
      uint64_t v26 = 42;
    }
    sub_100766F10();
    sub_100766F00();
    sub_100764920();
    sub_100767DE0();
    uint64_t v27 = (void *)sub_100766F00();
    uint64_t v56 = v26;
    uint64_t v57 = v25;
    sub_100764910();

    sub_10000FB44(&qword_100934A70);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1007B8800;
    *(void *)(v28 + 32) = v21;
    int v60 = v24;
    uint64_t v58 = v23;
    uint64_t v59 = a3;
    aBlock[0] = v28;
    sub_100767810();
    if (v24) {
      int v29 = &selRef_queryForBetaAppsWithStoreItemIDs_;
    }
    else {
      int v29 = &selRef_queryForStoreItemIDs_;
    }
    sub_10001A860(0, (unint64_t *)&qword_100940220);
    id v54 = v21;
    Class isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
    id v55 = objc_msgSend(self, *v29, isa);

    uint64_t v37 = v62;
    uint64_t v38 = v66;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v64, v11, v66);
    sub_1004D019C((uint64_t)v61, (uint64_t)v68);
    unint64_t v39 = (*(unsigned __int8 *)(v37 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    uint64_t v40 = v39 + v6;
    unint64_t v41 = (v39 + v6) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v42 = (v41 + 31) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v43 = (v42 + 15) & 0xFFFFFFFFFFFFFFF8;
    v61 = v11;
    unint64_t v44 = (v43 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = v56;
    *(void *)(v45 + 16) = v57;
    *(void *)(v45 + 24) = v46;
    *(unsigned char *)(v45 + 32) = 2;
    (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v45 + v39, v64, v38);
    *(unsigned char *)(v45 + v40) = v60 & 1;
    sub_1006E4064((uint64_t)v68, v41 + v45 + 8);
    *(void *)(v45 + v42) = v63;
    uint64_t v47 = (void *)(v45 + v43);
    uint64_t v35 = v58;
    uint64_t v48 = v65;
    *uint64_t v47 = v59;
    v47[1] = v48;
    *(void *)(v45 + v44) = v35;
    uint64_t v49 = v54;
    *(void *)(v45 + ((v44 + 15) & 0xFFFFFFFFFFFFFFF8)) = v54;
    aBlock[4] = sub_10072EDB8;
    aBlock[5] = v45;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10072A6BC;
    aBlock[3] = &unk_10088F760;
    uint64_t v50 = _Block_copy(aBlock);
    id v51 = v49;
    swift_retain();
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    id v52 = v55;
    [v55 executeQueryWithResultHandler:v50];
    _Block_release(v50);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v61, v66);
  }
  else
  {
    if (qword_100932818 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_100767330();
    sub_10001076C(v30, (uint64_t)qword_100996388);
    sub_10000FB44(&qword_10093C6D0);
    sub_100766940();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1007B8540;
    sub_100766890();
    sub_100767210();
    swift_bridgeObjectRelease();
    sub_10000FB44(&qword_100942600);
    sub_1007586E0();
    uint64_t v31 = sub_100763950();
    uint64_t v33 = v32;
    v22(v16, v12);
    sub_10072DDA0();
    swift_allocError();
    *(void *)uint64_t v34 = v31;
    *(void *)(v34 + 8) = v33;
    *(unsigned char *)(v34 + 16) = 0;
    return sub_100767280();
  }
  return v35;
}

uint64_t sub_10072D5B0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v56 = a8;
  id v57 = a13;
  uint64_t v54 = a10;
  uint64_t v55 = a11;
  uint64_t v64 = a9;
  uint64_t v65 = a12;
  uint64_t v15 = sub_100766B20();
  uint64_t v53 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100763990();
  uint64_t v62 = *(void *)(v19 - 8);
  uint64_t v63 = v19;
  __chkstk_darwin(v19, v20);
  v61 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100767330();
  uint64_t v59 = *(void *)(v22 - 8);
  uint64_t v60 = v22;
  __chkstk_darwin(v22, v23);
  uint64_t v58 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100767DD0();
  sub_100766F10();
  uint64_t v25 = (void *)sub_100766F00();
  sub_100764910();

  if (a1)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_100768A60()) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v26 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v26)
      {
LABEL_4:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v27 = (id)sub_100768950();
          goto LABEL_7;
        }
        if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v27 = *(id *)(a1 + 32);
LABEL_7:
          uint64_t v28 = v27;
          swift_bridgeObjectRelease();
          id v29 = [v28 progress];
          if (v29)
          {
            uint64_t v30 = v29;
            [v29 cancel];
            uint64_t v31 = v53;
            (*(void (**)(char *, void, uint64_t))(v53 + 104))(v18, enum case for ActionOutcome.performed(_:), v15);
            sub_1007672C0();

            return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v18, v15);
          }
          if (qword_100932818 != -1) {
            swift_once();
          }
          uint64_t v33 = v60;
          uint64_t v34 = sub_10001076C(v60, (uint64_t)qword_100996388);
          id v36 = v58;
          uint64_t v35 = v59;
          (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v34, v33);
          sub_10000FB44(&qword_10093C6D0);
          sub_100766940();
          *(_OWORD *)(swift_allocObject() + 16) = xmmword_1007B8200;
          sub_100766890();
          uint64_t v67 = sub_10001A860(0, (unint64_t *)&qword_100940220);
          v66[0] = v57;
          id v37 = v57;
          sub_1007668A0();
          sub_10000FED8((uint64_t)v66, &qword_1009360F0);
          sub_100766890();
          sub_100767210();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v33);
          uint64_t v38 = v61;
          sub_1007586E0();
          uint64_t v39 = sub_100763950();
          uint64_t v41 = v40;
          (*(void (**)(char *, uint64_t))(v62 + 8))(v38, v63);
          sub_10072DDA0();
          swift_allocError();
          *(void *)uint64_t v42 = v39;
          *(void *)(v42 + 8) = v41;
          *(unsigned char *)(v42 + 16) = 4;
          sub_1007672B0();

          return swift_errorRelease();
        }
        __break(1u);
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease();
  }
  if ((a7 & 1) == 0)
  {
    if (qword_100932818 == -1)
    {
LABEL_19:
      uint64_t v43 = v60;
      uint64_t v44 = sub_10001076C(v60, (uint64_t)qword_100996388);
      uint64_t v46 = v58;
      uint64_t v45 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v44, v43);
      sub_10000FB44(&qword_10093C6D0);
      sub_100766940();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1007B8200;
      sub_100766890();
      uint64_t v67 = sub_10001A860(0, (unint64_t *)&qword_100940220);
      v66[0] = v57;
      id v47 = v57;
      sub_1007668A0();
      sub_10000FED8((uint64_t)v66, &qword_1009360F0);
      sub_100766890();
      sub_100767210();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v43);
      uint64_t v48 = v61;
      sub_1007586E0();
      uint64_t v49 = sub_100763950();
      uint64_t v51 = v50;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v48, v63);
      sub_10072DDA0();
      swift_allocError();
      *(void *)uint64_t v52 = v49;
      *(void *)(v52 + 8) = v51;
      *(unsigned char *)(v52 + 16) = 4;
      sub_1007672B0();
      return swift_errorRelease();
    }
LABEL_23:
    swift_once();
    goto LABEL_19;
  }
  sub_10072CF2C(v64, 0, v54, v55);
  sub_100767260();

  return swift_release();
}

uint64_t sub_10072DD98(uint64_t *a1, uint64_t a2)
{
  return sub_10072A760(*a1, a2);
}

unint64_t sub_10072DDA0()
{
  unint64_t result = qword_10095AA28;
  if (!qword_10095AA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10095AA28);
  }
  return result;
}

id sub_10072DDF4()
{
  NSString v1 = sub_1007675C0();
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithBundleIdentifierOfSystemPlaceholder:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_100755DA0();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_10072DEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  uint64_t v40 = a4;
  uint64_t v7 = sub_100766800();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  __chkstk_darwin(v7, v8);
  uint64_t v44 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100767040();
  uint64_t v10 = *(void *)(v39 - 8);
  __chkstk_darwin(v39, v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = sub_10000FB44((uint64_t *)&unk_100933BF0);
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  __chkstk_darwin(v18, v19);
  uint64_t v41 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000FB44((uint64_t *)&unk_100936B80);
  __chkstk_darwin(v21 - 8, v22);
  uint64_t v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10000FB44((uint64_t *)&unk_100933C00);
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25, v27);
  id v29 = (char *)&v39 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a1;
  swift_retain();
  sub_100766C70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
    sub_10000FED8((uint64_t)v24, (uint64_t *)&unk_100936B80);
    sub_10000FB44(&qword_100942600);
    sub_10005BFEC();
    swift_allocError();
    unsigned char *v30 = 1;
    uint64_t v31 = sub_100767280();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v29, v24, v25);
    v50[3] = v40(0);
    v50[4] = sub_10072EEAC(v42, v43);
    v50[0] = v49;
    swift_retain();
    sub_1004017B0();
    uint64_t v32 = v13;
    uint64_t v33 = v39;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v32, v17, v39);
    uint64_t v34 = v44;
    sub_1007667E0();
    sub_100766C40();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v48);
    uint64_t v35 = v41;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v41, v17, v33);
    uint64_t v37 = v45;
    uint64_t v36 = v46;
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v35, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v46);
    uint64_t v31 = sub_100766D00();
    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v50);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
  }
  swift_release();
  return v31;
}

uint64_t sub_10072E380(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a2;
  uint64_t v2 = sub_10075A8C0();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v31 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100763990();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000FB44(&qword_10093AE50);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100766B10();
  __chkstk_darwin(v14 - 8, v15);
  unint64_t v36 = (unint64_t)_swiftEmptyArrayStorage;
  sub_100766AF0();
  sub_1007586E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v13, 0, 1, v5);
  sub_100757340();
  swift_allocObject();
  uint64_t v16 = sub_100757330();
  swift_retain();
  sub_1007677E0();
  if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_100767820();
  }
  v28[1] = v16;
  sub_1007678A0();
  sub_100767810();
  unint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  sub_100768920(35);
  swift_bridgeObjectRelease();
  unint64_t v34 = 0xD000000000000021;
  unint64_t v35 = 0x80000001007A0450;
  sub_1007586E0();
  uint64_t v17 = sub_100763950();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v37._countAndFlagsBits = v17;
  v37._object = v19;
  sub_100767700(v37);
  swift_bridgeObjectRelease();
  sub_100766AF0();
  sub_10075B510();
  swift_allocObject();
  if (sub_10075B500())
  {
    swift_retain();
    sub_1007677E0();
    if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100767820();
    }
    sub_1007678A0();
    sub_100767810();
  }
  sub_100766AF0();
  sub_100759AC0();
  swift_allocObject();
  uint64_t v20 = sub_100759AA0();
  v38._countAndFlagsBits = 0xD000000000000023;
  v38._object = (void *)0x80000001007A0480;
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  uint64_t v21 = sub_10075A680(v38, v41);
  uint64_t v23 = v22;
  swift_retain();
  v39._object = (void *)0x80000001007A04B0;
  v39._countAndFlagsBits = 0xD00000000000001ALL;
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  sub_10075A680(v39, v42);
  v40._countAndFlagsBits = 0xD00000000000001CLL;
  v40._object = (void *)0x80000001007A04D0;
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  sub_10075A680(v40, v43);
  sub_10000FB44(&qword_10095AA40);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1007B8540;
  *(void *)(v24 + 32) = v21;
  *(void *)(v24 + 40) = v23;
  *(void *)(v24 + 56) = 0;
  *(void *)(v24 + 64) = 0;
  *(void *)(v24 + 48) = v20;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100766AF0();
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v31, enum case for AlertActionStyle.normal(_:), v30);
  sub_1007580E0();
  swift_allocObject();
  sub_1007580C0();
  uint64_t v25 = swift_retain();
  uint64_t v26 = sub_10072DEC0(v25, v32, v33, (uint64_t (*)(void))&type metadata accessor for AlertAction, (unint64_t *)&unk_10094AF40, (void (*)(uint64_t))&type metadata accessor for AlertAction);
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_release_n();
  swift_release();
  swift_release();
  return v26;
}

uint64_t sub_10072E944()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10072E994(uint64_t a1)
{
  return sub_10072C064(a1, *(void *)(v1 + 16), v1 + 24, *(void *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_10072E9A4()
{
  uint64_t v1 = sub_100763990();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10072EA94(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100763990() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);

  return sub_10072CB8C(a1, v5, v6, v1 + v4, v7);
}

uint64_t sub_10072EB34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10072EB44()
{
  return swift_release();
}

uint64_t sub_10072EB4C()
{
  uint64_t v1 = sub_100763990();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10072EC34()
{
  sub_100763990();

  return sub_10072CE04();
}

uint64_t sub_10072ECC4()
{
  uint64_t v1 = sub_100764930();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 33) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((((((v4 + *(void *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10072EDB8(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100764930() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  unint64_t v8 = ((v7 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_10072D5B0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), v2 + v6, *(unsigned char *)(v2 + v7), (v7 & 0xFFFFFFFFFFFFFFF8) + v2 + 8, *(void *)(v2 + v8), *(void *)(v2 + v9), *(void *)(v2 + v9 + 8), *(void *)(v2 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_10072EEAC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10072EF04(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 4u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for OfferActionImplementation.ImplementationError(uint64_t a1)
{
  return sub_10072EF2C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10072EF2C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 4u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s22SubscribePageExtension25OfferActionImplementationV19ImplementationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_10072EF04(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for OfferActionImplementation.ImplementationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_10072EF04(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_10072EF2C(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for OfferActionImplementation.ImplementationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_10072EF2C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferActionImplementation.ImplementationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferActionImplementation.ImplementationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10072F0BC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 4u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_10072F0D4(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)uint64_t result = a2 - 5;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OfferActionImplementation.ImplementationError()
{
  return &type metadata for OfferActionImplementation.ImplementationError;
}

uint64_t sub_10072F12C()
{
  uint64_t v1 = sub_1007649F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10075AC80();
  __chkstk_darwin(v6 - 8, v7);
  unsigned __int8 v8 = (objc_class *)type metadata accessor for IconGridView();
  v12.receiver = v0;
  v12.super_class = v8;
  objc_msgSendSuper2(&v12, "layoutSubviews");
  sub_10075C580();
  sub_10072F368();
  sub_10075AC70();
  swift_beginAccess();
  unint64_t v9 = swift_bridgeObjectRetain();
  sub_1004F9DFC(v9);
  swift_bridgeObjectRelease();
  sub_10075ACA0();
  swift_allocObject();
  sub_10075AC90();
  sub_10075C580();
  sub_10075AC50();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

void sub_10072F368()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10075AC80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10075ACA0();
  sub_10075AC70();
  uint64_t v7 = sub_10075AC60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  unsigned __int8 v8 = &v0[OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkViews];
  swift_beginAccess();
  if (*(void *)v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100768A60();
    swift_bridgeObjectRelease();
    if (v14 == v7) {
      return;
    }
  }
  else if (*(void *)((*(void *)v8 & 0xFFFFFFFFFFFFFF8) + 0x10) == v7)
  {
    return;
  }
  uint64_t v9 = *(void *)v8;
  if (*(void *)v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100768A60();
    if (!v10) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v10) {
      goto LABEL_14;
    }
  }
  if (v10 < 1)
  {
LABEL_29:
    __break(1u);
    return;
  }
  uint64_t v11 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v12 = (id)sub_100768950();
    }
    else {
      id v12 = *(id *)(v9 + 8 * v11 + 32);
    }
    uint64_t v13 = v12;
    ++v11;
    id v23 = v12;
    swift_beginAccess();
    sub_10000FB44(&qword_10093B900);
    sub_100765990();
    swift_endAccess();
  }
  while (v10 != v11);
LABEL_14:
  swift_bridgeObjectRelease();
  *(void *)unsigned __int8 v8 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  if (v7 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  for (; v7; --v7)
  {
    swift_beginAccess();
    sub_10000FB44(&qword_10093B900);
    sub_100765970();
    swift_endAccess();
    uint64_t v15 = v23;
    swift_beginAccess();
    id v16 = v15;
    sub_1007677E0();
    if (*(void *)((*(void *)v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v8 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
      sub_100767820();
    sub_1007678A0();
    sub_100767810();
    swift_endAccess();
    id v17 = [v16 superview];
    if (!v17) {
      goto LABEL_17;
    }
    uint64_t v18 = v17;
    sub_10000D514();
    uint64_t v19 = v1;
    id v20 = v18;
    LOBYTE(v18) = sub_100768430();

    if ((v18 & 1) == 0) {
LABEL_17:
    }
      [v1 addSubview:v16];
  }
  unint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_impressionableArtworks];
  if (v21)
  {
    if (*(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkLoader])
    {
      swift_bridgeObjectRetain();
      swift_retain();
      sub_10072F7F8(v21);
      swift_bridgeObjectRelease();
      swift_release();
    }
  }
}

uint64_t sub_10072F7C4@<X0>(uint64_t *a1@<X8>)
{
  sub_100758360();
  uint64_t result = sub_100758160();
  *a1 = result;
  return result;
}

uint64_t sub_10072F7F8(unint64_t a1)
{
  unint64_t v3 = v1 + OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkViews;
  uint64_t result = swift_beginAccess();
  if (*(void *)v3 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_100768A60();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v19) {
      return result;
    }
  }
  else if (!*(void *)((*(void *)v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return result;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100768A60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v3 = *(void *)v3;
  unint64_t v6 = v3 >> 62;
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_100768A60();
      if (!v7) {
        return swift_bridgeObjectRelease();
      }
      goto LABEL_8;
    }
    uint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_8:
      unint64_t v8 = a1;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_100768A60();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v9)
      {
        if (v7 >= 1)
        {
          uint64_t v15 = 0;
          a1 = v3 & 0xC000000000000001;
          unint64_t v16 = v8 & 0xC000000000000001;
          uint64_t v20 = v8 & 0xFFFFFFFFFFFFFF8;
          while (1)
          {
            if (a1) {
              id v17 = (id)sub_100768950();
            }
            else {
              id v17 = *(id *)(v3 + 8 * v15 + 32);
            }
            uint64_t v18 = v17;
            if (v16)
            {
              sub_100768950();
            }
            else
            {
              if ((unint64_t)(v15 % v9) >= *(void *)(v20 + 16))
              {
                __break(1u);
                goto LABEL_31;
              }
              swift_retain();
            }
            ++v15;
            sub_10075E240();
            swift_release();
            sub_100763FE0();
            sub_100758360();
            sub_100060F5C();
            sub_100759150();

            swift_release();
            swift_release();
            if (v7 == v15) {
              return swift_bridgeObjectRelease();
            }
          }
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      uint64_t result = sub_100768A60();
      uint64_t v10 = result;
      if (!result) {
        return swift_bridgeObjectRelease();
      }
LABEL_12:
      if (v10 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v11 = 0;
      do
      {
        if ((v3 & 0xC000000000000001) != 0) {
          id v12 = (id)sub_100768950();
        }
        else {
          id v12 = *(id *)(v3 + 8 * v11 + 32);
        }
        uint64_t v14 = v12;
        ++v11;
        v21.value.super.Class isa = 0;
        v21.is_nil = 1;
        sub_100758290(v21, v13);
      }
      while (v10 != v11);
    }
  }
  else
  {
    if (v6) {
      goto LABEL_38;
    }
    uint64_t v10 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_12;
    }
  }
  return swift_bridgeObjectRelease();
}

id sub_10072FB58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IconGridView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10072FC34()
{
  return type metadata accessor for IconGridView();
}

uint64_t type metadata accessor for IconGridView()
{
  uint64_t result = qword_10095AA90;
  if (!qword_10095AA90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10072FC88()
{
  sub_100335558();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

ValueMetadata *type metadata accessor for IconGridView.Configuration()
{
  return &type metadata for IconGridView.Configuration;
}

void sub_10072FD4C()
{
  uint64_t v1 = sub_10000FB44(&qword_10093F3D0);
  __chkstk_darwin(v1, v2);
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkViews] = _swiftEmptyArrayStorage;
  sub_100758360();
  sub_100764CC0();
  sub_1003355C0();
  sub_1007659A0();
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_impressionableArtworks] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension12IconGridView_artworkLoader] = 0;

  sub_100768A40();
  __break(1u);
}

char *sub_10072FE6C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button;
  id v10 = objc_allocWithZone((Class)UIView);
  uint64_t v11 = v4;
  id v12 = [v10 init];
  id v13 = [self secondarySystemBackgroundColor];
  [v12 setBackgroundColor:v13];

  *(void *)&v4[v9] = v12;
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for PlaceholderHelper.PlacholderOfferButton();
  uint64_t v14 = (char *)objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  [v14 addSubview:*(void *)&v14[OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button]];
  return v14;
}

id sub_1007300C8()
{
  uint64_t v1 = sub_10000FB44((uint64_t *)&unk_1009407A0);
  __chkstk_darwin(v1 - 8, v2);
  Swift::String v42 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1007611A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41[0] = sub_10000FB44((uint64_t *)&unk_1009369C0);
  uint64_t v9 = *(void *)(v41[0] - 8);
  __chkstk_darwin(v41[0], v10);
  id v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10075C770();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  id v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v19);
  UIImage_optional v21 = (char *)v41 - v20;
  uint64_t v22 = (objc_class *)type metadata accessor for PlaceholderHelper.PlacholderOfferButton();
  v44.receiver = v0;
  v44.super_class = v22;
  v41[1] = v22;
  objc_msgSendSuper2(&v44, "layoutSubviews");
  Swift::String v43 = v0;
  id v23 = [v0 traitCollection];
  if (sub_100767D10())
  {
    if (qword_100932160 != -1) {
      swift_once();
    }
    uint64_t v24 = qword_100952BF8;
  }
  else
  {
    if (qword_100932168 != -1) {
      swift_once();
    }
    uint64_t v24 = qword_100952C10;
  }
  uint64_t v25 = sub_10001076C(v13, (uint64_t)v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v25, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v17, v13);

  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for OfferButtonSubtitlePosition.below(_:), v4);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v42, 1, 1, v4);
  sub_10020CBB0();
  sub_10075F670();
  uint64_t v26 = v43;
  sub_10075C750();
  double v28 = v27;
  double v30 = v29;
  (*(void (**)(char *, void))(v9 + 8))(v12, v41[0]);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  uint64_t v31 = *(void **)&v26[OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button];
  [v31 frame];
  objc_msgSend(v31, "setFrame:");
  id v32 = [v31 layer];
  uint64_t v33 = v32;
  if (v28 >= v30) {
    double v34 = v30;
  }
  else {
    double v34 = v28;
  }
  objc_msgSend(v32, "setCornerRadius:", v34 * 0.5, v41[0]);

  sub_10075C580();
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  CGFloat height = v45.size.height;
  double MidX = CGRectGetMidX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  return objc_msgSend(v31, "setCenter:", MidX, CGRectGetMidY(v46));
}

id sub_1007305C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlaceholderHelper.PlacholderOfferButton();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PlaceholderHelper.PlacholderOfferButton()
{
  return self;
}

id sub_100730630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [objc_allocWithZone((Class)UILabel) init];
  NSString v5 = sub_1007675C0();
  [v4 setText:v5];

  [v4 setNumberOfLines:1];
  [v4 setLineBreakMode:1];
  [v4 setAdjustsFontForContentSizeCategory:1];
  id v6 = [self preferredFontForTextStyle:a3];
  [v4 setFont:v6];

  id v7 = [self secondarySystemBackgroundColor];
  [v4 setTextColor:v7];

  return v4;
}

id sub_100730760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_10075F7F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000FB44((uint64_t *)&unk_100933F40);
  __chkstk_darwin(v9 - 8, v10);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100764BD0();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, a3, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for DirectionalTextAlignment.none(_:), v4);
  id v15 = objc_allocWithZone((Class)sub_10075AA00());
  uint64_t v16 = (void *)sub_10075A9F0();
  NSString v17 = sub_1007675C0();
  [v16 setText:v17];

  sub_10075A9B0();
  uint64_t v18 = self;
  id v19 = v16;
  id v20 = [v18 secondarySystemBackgroundColor];
  [v19 setTextColor:v20];

  return v19;
}

double sub_1007309C8()
{
  uint64_t v1 = sub_10000FB44((uint64_t *)&unk_1009407A0);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v31 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1007611A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10000FB44((uint64_t *)&unk_1009369C0);
  uint64_t v9 = *(void *)(v30 - 8);
  __chkstk_darwin(v30, v10);
  id v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10075C770();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  NSString v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&double v20 = __chkstk_darwin(v18, v19).n128_u64[0];
  uint64_t v22 = (char *)&v29 - v21;
  id v32 = v0;
  id v23 = objc_msgSend(v0, "traitCollection", v20);
  if (sub_100767D10())
  {
    if (qword_100932160 != -1) {
      swift_once();
    }
    uint64_t v24 = qword_100952BF8;
  }
  else
  {
    if (qword_100932168 != -1) {
      swift_once();
    }
    uint64_t v24 = qword_100952C10;
  }
  uint64_t v25 = sub_10001076C(v13, (uint64_t)v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v25, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v22, v17, v13);

  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for OfferButtonSubtitlePosition.below(_:), v4);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v31, 1, 1, v4);
  sub_10020CBB0();
  sub_10075F670();
  sub_10075C750();
  double v27 = v26;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v30);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v22, v13);
  return v27;
}

void sub_100730E20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100765660();
  __chkstk_darwin(v2 - 8, v3);
  v25.receiver = v0;
  v25.super_class = (Class)type metadata accessor for PurchasesLoadingViewController();
  objc_msgSendSuper2(&v25, "viewDidLoad");
  id v4 = [v0 view];
  if (v4)
  {
    uint64_t v5 = v4;
    sub_10001A860(0, (unint64_t *)&qword_100933F20);
    uint64_t v6 = (void *)sub_100768270();
    [v5 setBackgroundColor:v6];

    sub_100732090(&qword_10095AB38, v7, (void (*)(uint64_t))type metadata accessor for PurchasesLoadingViewController);
    swift_unknownObjectRetain();
    sub_10075C860();
    sub_100759240();
    sub_100765650();
    id v8 = objc_allocWithZone((Class)sub_100765680());
    uint64_t v9 = (void *)sub_100765670();
    uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController;
    id v11 = *(id *)&v1[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController];
    sub_100760680();

    id v12 = *(void **)&v1[v10];
    *(void *)&v1[v10] = v9;
    id v13 = v9;

    id v14 = *(id *)&v1[v10];
    id v15 = [v1 view];
    if (v15)
    {
      uint64_t v16 = v15;
      [v15 bounds];
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;

      uint64_t v26 = v18;
      uint64_t v27 = v20;
      uint64_t v28 = v22;
      uint64_t v29 = v24;
      char v30 = 0;
      sub_100760670();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100731108()
{
  v43.receiver = v0;
  v43.super_class = (Class)type metadata accessor for PurchasesLoadingViewController();
  objc_msgSendSuper2(&v43, "viewDidLayoutSubviews");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v2 view];
    if (v3)
    {
      id v4 = v3;
      id v5 = [v0 view];
      if (v5)
      {
        uint64_t v6 = v5;
        [v5 bounds];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        objc_msgSend(v4, "setFrame:", v8, v10, v12, v14);
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
LABEL_5:
  id v15 = *(void **)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases];
  if (!v15) {
    goto LABEL_9;
  }
  id v16 = v15;
  id v17 = [v16 view];
  if (!v17) {
    goto LABEL_16;
  }
  uint64_t v18 = v17;
  id v19 = [v0 view];
  if (!v19)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v20 = v19;
  [v19 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  objc_msgSend(v18, "setFrame:", v22, v24, v26, v28);
LABEL_9:
  uint64_t v29 = *(void **)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases];
  if (!v29) {
    return;
  }
  id v30 = v29;
  id v31 = [v30 view];
  if (!v31) {
    goto LABEL_18;
  }
  id v32 = v31;
  id v33 = [v0 view];
  if (!v33)
  {
LABEL_19:
    __break(1u);
    return;
  }
  double v34 = v33;
  [v33 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  objc_msgSend(v32, "setFrame:", v36, v38, v40, v42);
}

void sub_10073137C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100766800();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v40[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController;
  id v8 = *(id *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController];
  sub_100760680();

  double v9 = *(void **)&v0[v7];
  *(void *)&v0[v7] = 0;

  id v10 = *(id *)&v0[v7];
  id v11 = [v0 view];
  if (!v11)
  {
    __break(1u);
    goto LABEL_10;
  }
  double v12 = v11;
  [v11 bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  uint64_t v42 = v14;
  uint64_t v43 = v16;
  uint64_t v44 = v18;
  uint64_t v45 = v20;
  char v46 = 0;
  sub_100760670();

  uint64_t v21 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases;
  if (!*(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases])
  {
    sub_10000FB44((uint64_t *)&unk_10094ABF0);
    uint64_t v22 = *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_objectGraph];
    sub_100758690();
    sub_100767240();
    type metadata accessor for ASDPurchaseHistoryContext(0);
    v40[0] = 1;
    sub_1007667E0();
    sub_100766C40();
    double v23 = *(void (**)(char *, uint64_t))(v3 + 8);
    v23(v6, v2);
    LOBYTE(v40[0]) = 1;
    sub_1007667E0();
    double v24 = (void *)sub_100766C40();
    swift_release();
    v23(v6, v2);
    sub_1000CE244(v24);
    sub_10001A860(0, (unint64_t *)&qword_10094BFB0);
    swift_retain();
    sub_100767240();
    sub_10000FE30((uint64_t)v41, (uint64_t)v40);
    sub_100760390();
    swift_allocObject();
    swift_unknownObjectRetain();
    uint64_t v25 = sub_1007602E0();
    uint64_t v26 = sub_100732090((unint64_t *)&unk_10094ACB8, 255, (void (*)(uint64_t))&type metadata accessor for PurchasesContentPresenter);
    swift_retain();
    uint64_t v27 = sub_1006D3004(v22, v25, v26, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000014, 0x80000001007A07D0);
    id v28 = objc_allocWithZone((Class)type metadata accessor for PurchasesViewController());
    sub_1002DA5DC(v25, v27);
    uint64_t v29 = *(void **)&v1[v21];
    *(void *)&v1[v21] = v30;

    id v31 = *(void **)&v1[v21];
    if (v31)
    {
      id v32 = v31;
      [v32 willMoveToParentViewController:v1];
      [v1 addChildViewController:v32];
      id v33 = [v1 view];
      if (v33)
      {
        double v34 = v33;
        id v35 = [v32 view];
        if (v35)
        {
          double v36 = v35;
          [v34 addSubview:v35];

          [v32 didMoveToParentViewController:v1];
          id v37 = [v32 title];
          [v1 setTitle:v37];

          id v38 = [v32 collectionView];
          [v1 setContentScrollView:v38 forEdge:15];
          swift_unknownObjectRelease();
          swift_release();

          swift_release();
          _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v41);
          return;
        }
        goto LABEL_11;
      }
LABEL_10:
      __break(1u);
LABEL_11:
      __break(1u);
      return;
    }
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v41);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

void sub_10073186C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1007671E0();
  __chkstk_darwin(v2, v3);
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController;
  id v5 = *(id *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController];
  sub_100760680();

  uint64_t v6 = *(void **)&v0[v4];
  *(void *)&v0[v4] = 0;

  id v7 = *(id *)&v0[v4];
  id v8 = [v0 view];
  if (!v8)
  {
    __break(1u);
    goto LABEL_10;
  }
  double v9 = v8;
  [v8 bounds];

  sub_100760670();
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases;
  if (*(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases]) {
    return;
  }
  uint64_t v11 = *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_objectGraph];
  sub_100758690();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100767240();
  sub_10075F920();
  swift_allocObject();
  uint64_t v12 = sub_10075F890();
  uint64_t v13 = sub_100732090(&qword_10095AB30, 255, (void (*)(uint64_t))&type metadata accessor for FamilyPurchasesPresenter);
  swift_retain();
  uint64_t v14 = sub_1006D3004(v11, v12, v13, (uint64_t)_swiftEmptyArrayStorage, 0xD000000000000013, 0x80000001007A07B0);
  id v15 = objc_allocWithZone((Class)type metadata accessor for FamilyPurchasesViewController());
  uint64_t v16 = sub_10037D2C0(v12, v14);
  uint64_t v17 = *(void **)&v1[v10];
  *(void *)&v1[v10] = v16;

  uint64_t v18 = *(void **)&v1[v10];
  if (v18)
  {
    id v19 = v18;
    [v19 willMoveToParentViewController:v1];
    [v1 addChildViewController:v19];
    id v20 = [v1 view];
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = [v19 view];
      if (v22)
      {
        double v23 = v22;
        [v21 addSubview:v22];

        [v19 didMoveToParentViewController:v1];
        id v24 = [v19 title];
        [v1 setTitle:v24];

        id v25 = [v19 collectionView];
        [v1 setContentScrollView:v25 forEdge:15];

        goto LABEL_7;
      }
LABEL_11:
      __break(1u);
      return;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
LABEL_7:
  swift_release();
}

void sub_100731C00()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100765660();
  __chkstk_darwin(v2 - 8, v3);
  sub_100765650();
  id v4 = objc_allocWithZone((Class)sub_100765680());
  id v5 = (void *)sub_100765670();
  uint64_t v6 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController;
  id v7 = *(id *)&v1[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController];
  sub_100760680();

  id v8 = *(void **)&v1[v6];
  *(void *)&v1[v6] = v5;
  id v9 = v5;

  id v10 = *(id *)&v1[v6];
  id v11 = [v1 view];
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 bounds];

    sub_100760670();
  }
  else
  {
    __break(1u);
  }
}

void sub_100731D68()
{
  uint64_t v1 = OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController;
  id v2 = *(id *)&v0[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController];
  sub_100760680();

  uint64_t v3 = *(void **)&v0[v1];
  *(void *)&v0[v1] = 0;

  id v6 = *(id *)&v0[v1];
  id v4 = [v0 view];
  if (v4)
  {
    id v5 = v4;
    [v4 bounds];

    sub_100760670();
  }
  else
  {
    __break(1u);
  }
}

id sub_100731E84()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PurchasesLoadingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PurchasesLoadingViewController()
{
  return self;
}

uint64_t sub_100731F78(uint64_t a1, uint64_t a2)
{
  return sub_100732090(&qword_10095AB28, a2, (void (*)(uint64_t))type metadata accessor for PurchasesLoadingViewController);
}

id sub_100731FC0(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_loggedInUserPurchases] = 0;
  *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_familyPurchases] = 0;
  *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_overlayViewController] = 0;
  *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_objectGraph] = a2;
  sub_1007591F0();
  id v4 = v2;
  swift_retain();
  *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_artworkLoader] = sub_100763D60();
  *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension30PurchasesLoadingViewController_presenter] = a1;
  swift_retain();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PurchasesLoadingViewController();
  return objc_msgSendSuper2(&v6, "initWithNibName:bundle:", 0, 0);
}

uint64_t sub_100732090(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1007320D8(uint64_t a1)
{
  return sub_100070524(a1, (SEL *)&selRef_whiteColor, &qword_10095AB40);
}

id sub_1007320EC(uint64_t a1)
{
  return sub_100070524(a1, (SEL *)&selRef_blackColor, &qword_10095AB48);
}

id sub_100732100(uint64_t a1)
{
  sub_1007591F0();
  uint64_t v3 = v1;
  *(void *)&v3[OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artworkLoader] = sub_100763D60();
  *(void *)&v3[OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artwork] = a1;

  id v4 = [objc_allocWithZone((Class)UICollectionViewFlowLayout) init];
  objc_msgSend(v4, "setSectionInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [v4 setMinimumInteritemSpacing:0.0];
  [v4 setMinimumLineSpacing:0.0];
  [v4 setScrollDirection:1];
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for GalleryViewController();
  id v5 = objc_msgSendSuper2(&v11, "initWithCollectionViewLayout:", v4);
  id v6 = [v5 collectionView];
  if (v6)
  {
    id v7 = v6;
    [v6 setContentInsetAdjustmentBehavior:2];
  }
  id v8 = [v5 navigationItem];
  id v9 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v5 action:"dismissFrom:"];
  [v8 setRightBarButtonItem:v9];

  swift_release();
  return v5;
}

id sub_100732318()
{
  id v1 = [v0 navigationController];
  if (v1)
  {
    objc_super v2 = v1;
    id v3 = [v1 barHideOnTapGestureRecognizer];

    [v3 removeTarget:v0 action:0];
  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for GalleryViewController();
  return objc_msgSendSuper2(&v5, "dealloc");
}

void sub_1007324D0(void *a1, uint64_t a2, uint64_t a3, const char **a4)
{
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for GalleryViewController();
  id v6 = *a4;
  id v7 = v8.receiver;
  objc_msgSendSuper2(&v8, v6, a3);
  sub_100759190();
}

void sub_100732558(void *a1, uint64_t a2, const char **a3)
{
  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for GalleryViewController();
  id v4 = *a3;
  id v5 = v6.receiver;
  objc_msgSendSuper2(&v6, v4);
  sub_100759190();
}

void sub_1007325C8()
{
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for GalleryViewController();
  objc_msgSendSuper2(&v23, "viewDidLoad");
  id v1 = [v0 navigationController];
  if (v1)
  {
    objc_super v2 = v1;
    [v1 setHidesBarsOnTap:1];
  }
  id v3 = [v0 navigationController];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 barHideOnTapGestureRecognizer];

    [v5 addTarget:v0 action:"tapStateChangedOn:"];
  }
  id v6 = [objc_allocWithZone((Class)UISwipeGestureRecognizer) initWithTarget:v0 action:"swipeStateChangedOn:"];
  [v6 setDirection:8];
  id v7 = [v0 view];
  if (v7)
  {
    objc_super v8 = v7;
    [v7 addGestureRecognizer:v6];

    id v9 = [v0 collectionView];
    if (v9)
    {
      id v10 = v9;
      if (qword_1009327B0 != -1) {
        swift_once();
      }
      [v10 setBackgroundColor:qword_10095AB40];
    }
    id v11 = [v0 collectionView];
    if (v11)
    {
      uint64_t v12 = v11;
      [v11 setAllowsSelection:0];
    }
    id v13 = [v0 collectionView];
    if (v13)
    {
      uint64_t v14 = v13;
      [v13 setAlwaysBounceHorizontal:1];
    }
    id v15 = [v0 collectionView];
    if (v15)
    {
      uint64_t v16 = v15;
      [v15 setShowsHorizontalScrollIndicator:0];
    }
    id v17 = [v0 collectionView];
    if (v17)
    {
      uint64_t v18 = v17;
      [v17 setPagingEnabled:1];
    }
    id v19 = [v0 collectionView];
    if (v19)
    {
      id v20 = v19;
      type metadata accessor for ArtworkCollectionViewCell();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      sub_100767EF0();
      NSString v22 = sub_1007675C0();
      swift_bridgeObjectRelease();
      [v20 registerClass:ObjCClassFromMetadata forCellWithReuseIdentifier:v22];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1007328F4(uint64_t a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for GalleryViewController();
  objc_msgSendSuper2(&v8, "traitCollectionDidChange:", a1);
  id v3 = [v1 collectionView];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 collectionViewLayout];

    [v5 invalidateLayout];
  }
  id v6 = [v1 collectionView];
  if (v6)
  {
    id v7 = v6;
    [v6 setNeedsLayout];
  }
}

id sub_100732A90(void *a1)
{
  id result = [a1 state];
  if (result == (id)3)
  {
    id v3 = self;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v1;
    v7[4] = sub_100733848;
    v7[5] = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_1000DFF64;
    v7[3] = &unk_10088F918;
    id v5 = _Block_copy(v7);
    id v6 = v1;
    swift_release();
    [v3 animateWithDuration:v5 animations:UINavigationControllerHideShowBarDuration];
    _Block_release(v5);
    return [v6 setNeedsStatusBarAppearanceUpdate];
  }
  return result;
}

void sub_100732BB4(void *a1)
{
  id v2 = [a1 navigationController];
  if (!v2)
  {
    __break(1u);
    return;
  }
  id v3 = v2;
  unsigned int v4 = [v2 isNavigationBarHidden];

  id v5 = [a1 collectionView];
  if (v4)
  {
    if (!v5) {
      return;
    }
    if (qword_1009327B8 != -1)
    {
      id v8 = v5;
      swift_once();
      id v5 = v8;
    }
    id v6 = &qword_10095AB48;
  }
  else
  {
    if (!v5) {
      return;
    }
    if (qword_1009327B0 != -1)
    {
      id v9 = v5;
      swift_once();
      id v5 = v9;
    }
    id v6 = &qword_10095AB40;
  }
  id v7 = v5;
  [v5 setBackgroundColor:*v6];
}

void sub_100732D64()
{
  id v1 = [v0 navigationController];
  if (v1)
  {
    id v2 = v1;
    unsigned __int8 v3 = [v1 isNavigationBarHidden];

    if ((v3 & 1) == 0)
    {
      unsigned int v4 = self;
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v0;
      v10[4] = sub_100733828;
      v10[5] = v5;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      v10[2] = sub_1000DFF64;
      v10[3] = &unk_10088F8C8;
      id v6 = _Block_copy(v10);
      id v7 = v0;
      swift_release();
      [v4 animateWithDuration:v6 animations:UINavigationControllerHideShowBarDuration];
      _Block_release(v6);
      id v8 = [v7 navigationController];
      if (v8)
      {
        id v9 = v8;
        [v8 setNavigationBarHidden:1 animated:1];
      }
      [v7 setNeedsStatusBarAppearanceUpdate];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100732EEC(void *a1)
{
  id v1 = [a1 collectionView];
  if (v1)
  {
    id v2 = v1;
    if (qword_1009327B8 != -1)
    {
      swift_once();
      id v1 = v2;
    }
    [v1 setBackgroundColor:qword_10095AB48];
  }
}

unint64_t sub_1007330AC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100763FA0();
  __chkstk_darwin(v4 - 8, v5);
  type metadata accessor for ArtworkCollectionViewCell();
  sub_100767EF0();
  NSString v6 = sub_1007675C0();
  swift_bridgeObjectRelease();
  Class isa = sub_100756340().super.isa;
  id v8 = [a1 dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:isa];

  id v9 = (char *)swift_dynamicCastClassUnconditional();
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_artworkView;
  id v11 = *(void **)&v9[OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_artworkView];
  [v11 setContentMode:1];
  uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artwork);
  unint64_t result = sub_1007563C0();
  if ((v12 & 0xC000000000000001) != 0)
  {
    sub_100768950();
    goto LABEL_5;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (result >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  swift_retain();
LABEL_5:
  [v9 frame];
  CGRectGetWidth(v17);
  [v9 frame];
  CGRectGetHeight(v18);
  sub_100763F40();
  sub_100763F40();
  sub_100763F40();
  [v11 contentMode];
  sub_100763FF0();
  id v14 = v11;
  sub_100763FB0();
  sub_100758300();
  [v14 setContentMode:sub_100763E30()];
  sub_10075CD00();
  sub_100758340();
  if (!sub_100763E80())
  {
    sub_100010808();
    sub_1007682A0();
  }
  sub_1007581B0();

  id v15 = *(void **)&v9[v10];
  sub_100758360();
  sub_100060F5C();
  id v16 = v15;
  sub_100759150();

  swift_release();
  swift_release();
  return (unint64_t)v9;
}

uint64_t type metadata accessor for GalleryViewController()
{
  return self;
}

uint64_t sub_1007337F0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100733828()
{
  sub_100732EEC(*(void **)(v0 + 16));
}

uint64_t sub_100733830(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100733840()
{
  return swift_release();
}

void sub_100733848()
{
  sub_100732BB4(*(void **)(v0 + 16));
}

uint64_t sub_10073385C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100733874(a1, (char *)sub_1003B1678, a2);
}

uint64_t sub_100733874@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v5 = sub_10075BF00();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v44 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v13 - 8, v14);
  id v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v23);
  id v25 = (char *)&v37 - v24;
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_10001076C(v17, (uint64_t)qword_100992AF8);
  uint64_t v42 = v25;
  sub_1003FCE6C(v26, (uint64_t)v25);
  ((void (*)(uint64_t))v43)(a1);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  uint64_t v27 = enum case for TitleHeaderLayout.AccessoryVerticalAlignment.firstLineCenter(_:);
  uint64_t v28 = sub_10075BEF0();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v43 = v16;
  uint64_t v30 = v29;
  double v41 = v21;
  uint64_t v31 = (uint64_t)v12;
  id v38 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 104);
  v38(v12, v27, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v12, 0, 1, v28);
  id v32 = v44;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v44, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v5);
  sub_100010808();
  uint64_t v39 = sub_100768210();
  id v33 = (int *)type metadata accessor for TitleHeaderView.Style(0);
  uint64_t v40 = v5;
  uint64_t v34 = v33[8];
  sub_100736814((uint64_t)v42, a3, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v41, a3 + v33[5], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC((uint64_t)v43, a3 + v33[6]);
  *(unsigned char *)(a3 + v33[7]) = 0;
  *(unsigned char *)(a3 + v34) = 0;
  *(unsigned char *)(a3 + v33[9]) = 0;
  *(void *)(a3 + v33[14]) = 0x4030000000000000;
  *(void *)(a3 + v33[12]) = 0;
  uint64_t v35 = v40;
  *(void *)(a3 + v33[13]) = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a3 + v33[11], v32, v35);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v31, 1, v28) != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(a3 + v33[10], v31, v28);
  }
  sub_10000FED8(v31, &qword_10093A160);
  return ((uint64_t (*)(uint64_t, void, uint64_t))v38)(a3 + v33[10], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastBaseline(_:), v28);
}

uint64_t sub_100733CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10075BF00();
  uint64_t v47 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v22);
  uint64_t v24 = (char *)&v41 - v23;
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001076C(v16, (uint64_t)qword_100992AF8);
  char v46 = v24;
  sub_1003FCE6C(v25, (uint64_t)v24);
  sub_1003B1678(a1);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  char v26 = sub_100767CF0();
  uint64_t v27 = sub_10075BEF0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v44 = v20;
  uint64_t v45 = v15;
  uint64_t v29 = v28;
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 104);
  uint64_t v31 = (unsigned int *)&enum case for TitleHeaderLayout.AccessoryVerticalAlignment.center(_:);
  if ((v26 & 1) == 0) {
    uint64_t v31 = (unsigned int *)&enum case for TitleHeaderLayout.AccessoryVerticalAlignment.firstLineCenter(_:);
  }
  uint64_t v32 = *v31;
  uint64_t v42 = *(uint64_t (**)(uint64_t, void, uint64_t))(v28 + 104);
  v30(v11, v32, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v11, 0, 1, v27);
  uint64_t v33 = v47;
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v7, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v4);
  sub_100010808();
  uint64_t v34 = sub_100768210();
  uint64_t v43 = v7;
  uint64_t v35 = v34;
  double v36 = (int *)type metadata accessor for TitleHeaderView.Style(0);
  uint64_t v48 = v11;
  uint64_t v37 = v4;
  uint64_t v38 = v36[8];
  sub_100736814((uint64_t)v46, a2, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v44, a2 + v36[5], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC((uint64_t)v45, a2 + v36[6]);
  *(unsigned char *)(a2 + v36[7]) = 0;
  *(unsigned char *)(a2 + v38) = 0;
  *(unsigned char *)(a2 + v36[9]) = 0;
  *(void *)(a2 + v36[14]) = 0x4030000000000000;
  *(void *)(a2 + v36[12]) = 0;
  *(void *)(a2 + v36[13]) = v35;
  uint64_t v39 = (uint64_t)v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(a2 + v36[11], v43, v37);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v39, 1, v27) != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(a2 + v36[10], v39, v27);
  }
  sub_10000FED8(v39, &qword_10093A160);
  return v42(a2 + v36[10], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastBaseline(_:), v27);
}

uint64_t sub_100734180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100733874(a1, (char *)sub_1003B07A0, a2);
}

uint64_t sub_100734198@<X0>(char a1@<W0>, int a2@<W1>, char a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v92 = a6;
  int v101 = a4;
  int v102 = a5;
  int v104 = a2;
  uint64_t v103 = a7;
  uint64_t v9 = sub_10075BF00();
  uint64_t v98 = *(void *)(v9 - 8);
  uint64_t v99 = v9;
  __chkstk_darwin(v9, v10);
  v100 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000FB44(&qword_10093A1F0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v91 - v18;
  __chkstk_darwin(v20, v21);
  uint64_t v23 = (char *)&v91 - v22;
  __chkstk_darwin(v24, v25);
  uint64_t v27 = (char *)&v91 - v26;
  uint64_t v28 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v28 - 8, v29);
  uint64_t v97 = (uint64_t)&v91 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31, v32);
  uint64_t v34 = (uint64_t *)((char *)&v91 - v33);
  uint64_t v35 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v35 - 8, v36);
  uint64_t v96 = (uint64_t)&v91 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38, v39);
  uint64_t v41 = (char *)&v91 - v40;
  uint64_t v42 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v93 = *(void *)(v42 - 8);
  __chkstk_darwin(v42, v43);
  uint64_t v95 = (uint64_t)&v91 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v45, v46);
  uint64_t v94 = (uint64_t)&v91 - v47;
  __chkstk_darwin(v48, v49);
  uint64_t v51 = (char *)&v91 - v50;
  __chkstk_darwin(v52, v53);
  v105 = (uint64_t *)((char *)&v91 - v54);
  if (a3)
  {
    if (qword_1009305D8 != -1) {
      swift_once();
    }
    uint64_t v55 = qword_100990520;
    *uint64_t v34 = qword_100990538;
    v34[1] = v55;
    uint64_t v56 = enum case for TitleHeaderLayout.AccessoryVerticalAlignment.corner(_:);
    uint64_t v57 = sub_10075BEF0();
    uint64_t v58 = *(void *)(v57 - 8);
    (*(void (**)(void *, uint64_t, uint64_t))(v58 + 104))(v34, v56, v57);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v58 + 56))(v34, 0, 1, v57);
    if (qword_100931030 != -1) {
      swift_once();
    }
    uint64_t v59 = (uint64_t)v34;
    uint64_t v60 = sub_10001076C(v42, (uint64_t)qword_100992B10);
    sub_1003FCE6C(v60, (uint64_t)v105);
    double v61 = 10.0;
    uint64_t v62 = (uint64_t)v51;
    if (qword_100931060 != -1) {
      swift_once();
    }
    uint64_t v63 = 1;
    uint64_t v64 = qword_100992BA0;
LABEL_39:
    uint64_t v80 = v62;
    goto LABEL_40;
  }
  uint64_t v65 = sub_10075BEF0();
  (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v34, 1, 1, v65);
  if (a1)
  {
    if ((v104 & 1) == 0)
    {
      sub_10001A758(v92, (uint64_t)v23, &qword_10093A1F0);
      uint64_t v72 = sub_100758980();
      uint64_t v73 = *(void *)(v72 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48))(v23, 1, v72) == 1)
      {
        sub_10000FED8((uint64_t)v23, &qword_10093A1F0);
        v74 = 0;
      }
      else
      {
        v74 = (void *)sub_100758920();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v23, v72);
      }
      uint64_t v62 = (uint64_t)v51;
      uint64_t v59 = (uint64_t)v34;
      sub_1003AF96C(v74, v105);

      double v61 = 16.0;
      if (qword_100931058 != -1) {
        swift_once();
      }
      uint64_t v63 = 1;
      uint64_t v64 = qword_100992B88;
      goto LABEL_39;
    }
    sub_10001A758(v92, (uint64_t)v27, &qword_10093A1F0);
    uint64_t v66 = sub_100758980();
    uint64_t v67 = *(void *)(v66 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48))(v27, 1, v66) == 1)
    {
      sub_10000FED8((uint64_t)v27, &qword_10093A1F0);
      uint64_t v68 = 0;
    }
    else
    {
      uint64_t v68 = (void *)sub_100758920();
      (*(void (**)(char *, uint64_t))(v67 + 8))(v27, v66);
    }
    sub_1003AF96C(v68, v105);

    if (qword_100931070 != -1) {
      swift_once();
    }
    uint64_t v59 = (uint64_t)v34;
    uint64_t v78 = sub_10001076C(v42, (uint64_t)qword_100992BD0);
    uint64_t v62 = (uint64_t)v51;
    uint64_t v79 = (uint64_t)v51;
  }
  else
  {
    if ((v104 & 1) == 0)
    {
      sub_10001A758(v92, (uint64_t)v15, &qword_10093A1F0);
      uint64_t v75 = sub_100758980();
      uint64_t v76 = *(void *)(v75 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v76 + 48))(v15, 1, v75) == 1)
      {
        sub_10000FED8((uint64_t)v15, &qword_10093A1F0);
        v77 = 0;
      }
      else
      {
        v77 = (void *)sub_100758920();
        (*(void (**)(char *, uint64_t))(v76 + 8))(v15, v75);
      }
      uint64_t v62 = (uint64_t)v51;
      uint64_t v59 = (uint64_t)v34;
      sub_1003AF96C(v77, v105);

      double v61 = 16.0;
      if (qword_100931050 != -1) {
        swift_once();
      }
      uint64_t v63 = 1;
      uint64_t v64 = qword_100992B70;
      goto LABEL_39;
    }
    sub_10001A758(v92, (uint64_t)v19, &qword_10093A1F0);
    uint64_t v69 = sub_100758980();
    uint64_t v70 = *(void *)(v69 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48))(v19, 1, v69) == 1)
    {
      sub_10000FED8((uint64_t)v19, &qword_10093A1F0);
      uint64_t v71 = 0;
    }
    else
    {
      uint64_t v71 = (void *)sub_100758920();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v19, v69);
    }
    uint64_t v62 = (uint64_t)v51;
    sub_1003AF96C(v71, v105);

    if (qword_100931068 != -1) {
      swift_once();
    }
    uint64_t v59 = (uint64_t)v34;
    uint64_t v78 = sub_10001076C(v42, (uint64_t)qword_100992BB8);
    uint64_t v79 = (uint64_t)v51;
  }
  sub_1003FCE6C(v78, v79);
  double v61 = 16.0;
  if (qword_100931048 != -1) {
    swift_once();
  }
  uint64_t v63 = 0;
  uint64_t v64 = qword_100992B58;
  uint64_t v80 = (uint64_t)v41;
LABEL_40:
  uint64_t v81 = sub_10001076C(v42, (uint64_t)v64);
  sub_1003FCE6C(v81, v80);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v93 + 56))(v41, v63, 1, v42);
  v82 = v105;
  uint64_t v83 = v94;
  sub_1003FCE6C((uint64_t)v105, v94);
  uint64_t v84 = v95;
  sub_1003FCE6C(v62, v95);
  uint64_t v85 = v96;
  sub_10001A758((uint64_t)v41, v96, &qword_100939FE8);
  uint64_t v86 = v59;
  uint64_t v87 = v97;
  sub_10001A758(v59, v97, &qword_10093A160);
  uint64_t v88 = (uint64_t)v100;
  (*(void (**)(char *, void, uint64_t))(v98 + 104))(v100, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v99);
  sub_100010808();
  uint64_t v89 = sub_100768210();
  sub_10010FE4C(v83, v84, v85, v101 & 1, v102 & 1, v104 & 1, v87, v88, v103, v61, 0, v89);
  sub_10000FED8(v86, &qword_10093A160);
  sub_10000FED8((uint64_t)v41, &qword_100939FE8);
  sub_1003B5FA8(v62);
  return sub_1003B5FA8((uint64_t)v82);
}

uint64_t sub_100734C44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v35 = sub_10075BF00();
  uint64_t v3 = *(void *)(v35 - 8);
  __chkstk_darwin(v35, v4);
  uint64_t v6 = &v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = &v33[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (uint64_t *)&v33[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = &v33[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v20, v21);
  uint64_t v23 = &v33[-v22];
  sub_1007599C0();
  sub_100763D70();
  int v34 = sub_100759940();
  swift_release();
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_10001076C(v15, (uint64_t)qword_100992AF8);
  sub_1003FCE6C(v24, (uint64_t)v23);
  sub_1003B07A0(a1, v19);
  sub_1003B0D64(v14);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  if (sub_100767CE0())
  {
    uint64_t v25 = (unsigned int *)&enum case for TitleHeaderLayout.AccessoryVerticalAlignment.firstLineCenter(_:);
  }
  else
  {
    *uint64_t v10 = 0;
    v10[1] = 0;
    uint64_t v25 = (unsigned int *)&enum case for TitleHeaderLayout.AccessoryVerticalAlignment.corner(_:);
  }
  uint64_t v26 = *v25;
  uint64_t v27 = sub_10075BEF0();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v10, v26, v27);
  sub_10075BEF0();
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v10, 0, 1, v27);
  char v28 = sub_100767CE0();
  uint64_t v29 = (unsigned int *)&enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:);
  if ((v28 & 1) == 0) {
    uint64_t v29 = (unsigned int *)&enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.centered(_:);
  }
  (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v6, *v29, v35);
  sub_100010808();
  uint64_t v32 = sub_100768210();
  if (v34) {
    char v30 = 2;
  }
  else {
    char v30 = 1;
  }
  return sub_10010FE4C((uint64_t)v23, (uint64_t)v19, (uint64_t)v14, 0, 0, v30, (uint64_t)v10, (uint64_t)v6, v36, 16.0, 0, v32);
}

uint64_t sub_100735004@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v53 = type metadata accessor for TitleHeaderView.Style(0);
  __chkstk_darwin(v53, v3);
  uint64_t v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10075BF00();
  uint64_t v6 = *(void *)(v57 - 8);
  __chkstk_darwin(v57, v7);
  uint64_t v50 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v56 = (uint64_t)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v20 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20, v22);
  uint64_t v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25, v26);
  char v28 = (char *)&v48 - v27;
  __chkstk_darwin(v29, v30);
  uint64_t v32 = (char *)&v48 - v31;
  uint64_t Main = JUScreenClassGetMain();
  if (a1)
  {
    if (Main == 1)
    {
      if (qword_1009310C0 != -1) {
        swift_once();
      }
      int v34 = qword_100992CC0;
    }
    else
    {
      if (qword_1009310B8 != -1) {
        swift_once();
      }
      int v34 = qword_100992CA8;
    }
    uint64_t v36 = sub_10001076C(v20, (uint64_t)v34);
    sub_1003FCE6C(v36, (uint64_t)v32);
    if (qword_1009310C8 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_10001076C(v20, (uint64_t)qword_100992CD8);
    sub_1003FCE6C(v37, (uint64_t)v19);
    uint64_t v38 = 0;
  }
  else
  {
    if (Main == 1)
    {
      if (qword_1009310B0 != -1) {
        swift_once();
      }
      uint64_t v35 = qword_100992C90;
    }
    else
    {
      if (qword_1009310A8 != -1) {
        swift_once();
      }
      uint64_t v35 = qword_100992C78;
    }
    uint64_t v39 = sub_10001076C(v20, (uint64_t)v35);
    sub_1003FCE6C(v39, (uint64_t)v32);
    uint64_t v38 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v19, v38, 1, v20);
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_10001076C(v20, (uint64_t)qword_100992AF8);
  sub_1003FCE6C(v40, (uint64_t)v28);
  uint64_t v51 = v32;
  sub_1003FCE6C((uint64_t)v32, (uint64_t)v24);
  uint64_t v54 = v19;
  sub_10001A758((uint64_t)v19, v56, &qword_100939FE8);
  uint64_t v41 = sub_10075BEF0();
  uint64_t v42 = *(void *)(v41 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v12, 1, 1, v41);
  uint64_t v43 = v50;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v50, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v57);
  sub_100010808();
  uint64_t v49 = sub_100768210();
  uint64_t v52 = v12;
  uint64_t v44 = (int *)v53;
  uint64_t v45 = *(int *)(v53 + 32);
  sub_100736814((uint64_t)v28, (uint64_t)v5, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v24, (uint64_t)&v5[v44[5]], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC(v56, (uint64_t)&v5[v44[6]]);
  v5[v44[7]] = 0;
  v5[v45] = 0;
  v5[v44[9]] = 1;
  *(void *)&v5[v44[14]] = 0x4030000000000000;
  *(void *)&v5[v44[12]] = 0;
  *(void *)&v5[v44[13]] = v49;
  uint64_t v46 = (uint64_t)v52;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v5[v44[11]], v43, v57);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v46, 1, v41) == 1)
  {
    sub_10000FED8(v46, &qword_10093A160);
    (*(void (**)(char *, void, uint64_t))(v42 + 104))(&v5[v44[10]], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.firstBaseline(_:), v41);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(&v5[v44[10]], v46, v41);
  }
  sub_100736814((uint64_t)v5, v55, type metadata accessor for TitleHeaderView.Style);
  sub_10000FED8((uint64_t)v54, &qword_100939FE8);
  return sub_1003B5FA8((uint64_t)v51);
}

uint64_t sub_100735690@<X0>(int a1@<W0>, int a2@<W1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v108 = a5;
  int v107 = a1;
  uint64_t v120 = a6;
  uint64_t v9 = sub_10075BF00();
  uint64_t v117 = *(void *)(v9 - 8);
  uint64_t v118 = v9;
  __chkstk_darwin(v9, v10);
  v119 = (char *)&v106 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000FB44(&qword_10093A1F0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v106 - v18;
  __chkstk_darwin(v20, v21);
  uint64_t v23 = (char *)&v106 - v22;
  __chkstk_darwin(v24, v25);
  uint64_t v27 = (char *)&v106 - v26;
  __chkstk_darwin(v28, v29);
  uint64_t v31 = (char *)&v106 - v30;
  uint64_t v32 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v32 - 8, v33);
  uint64_t v116 = (uint64_t)&v106 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35, v36);
  uint64_t v38 = (void **)((char *)&v106 - v37);
  uint64_t v39 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v39 - 8, v40);
  uint64_t v115 = (uint64_t)&v106 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42, v43);
  uint64_t v114 = (char *)&v106 - v44;
  uint64_t v45 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v109 = *(void *)(v45 - 8);
  uint64_t v110 = v45;
  __chkstk_darwin(v45, v46);
  uint64_t v113 = (uint64_t)&v106 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v48, v49);
  uint64_t v111 = (uint64_t)&v106 - v50;
  __chkstk_darwin(v51, v52);
  uint64_t v54 = (char *)&v106 - v53;
  __chkstk_darwin(v55, v56);
  v121 = (uint64_t *)((char *)&v106 - v57);
  int v112 = a2;
  if (a3)
  {
    if (qword_1009305D8 != -1) {
      swift_once();
    }
    uint64_t v58 = qword_100990520;
    uint64_t v59 = (uint64_t)v38;
    *uint64_t v38 = qword_100990538;
    v38[1] = v58;
    uint64_t v60 = enum case for TitleHeaderLayout.AccessoryVerticalAlignment.corner(_:);
    uint64_t v61 = sub_10075BEF0();
    uint64_t v62 = *(void *)(v61 - 8);
    (*(void (**)(void *, uint64_t, uint64_t))(v62 + 104))(v38, v60, v61);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v62 + 56))(v38, 0, 1, v61);
    uint64_t v63 = v110;
    if (qword_100931030 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_10001076C(v63, (uint64_t)qword_100992B10);
    sub_1003FCE6C(v64, (uint64_t)v121);
    double v65 = 10.0;
    uint64_t v66 = v114;
    if (qword_100931060 != -1) {
      swift_once();
    }
    uint64_t v67 = 1;
    uint64_t v68 = qword_100992BA0;
LABEL_45:
    uint64_t v88 = (uint64_t)v54;
    goto LABEL_46;
  }
  uint64_t v69 = sub_10075BEF0();
  uint64_t v70 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56);
  v106 = v38;
  v70(v38, 1, 1, v69);
  if ((a2 & 1) == 0)
  {
    if (a4)
    {
      sub_10001A758(v108, (uint64_t)v23, &qword_10093A1F0);
      uint64_t v75 = sub_100758980();
      uint64_t v76 = *(void *)(v75 - 8);
      int v77 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v76 + 48))(v23, 1, v75);
      uint64_t v66 = v114;
      if (v77 == 1)
      {
        sub_10000FED8((uint64_t)v23, &qword_10093A1F0);
        uint64_t v78 = 0;
      }
      else
      {
        uint64_t v78 = (void *)sub_100758920();
        (*(void (**)(char *, uint64_t))(v76 + 8))(v23, v75);
      }
      uint64_t v59 = (uint64_t)v106;
      uint64_t v63 = v110;
      sub_1003AF96C(v78, v121);

      double v65 = 16.0;
      if (qword_100931090 != -1) {
        swift_once();
      }
      uint64_t v67 = 1;
      uint64_t v68 = qword_100992C30;
    }
    else
    {
      uint64_t v66 = v114;
      if (v107)
      {
        sub_10001A758(v108, (uint64_t)v19, &qword_10093A1F0);
        uint64_t v83 = sub_100758980();
        uint64_t v84 = *(void *)(v83 - 8);
        int v85 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v19, 1, v83);
        uint64_t v63 = v110;
        if (v85 == 1)
        {
          sub_10000FED8((uint64_t)v19, &qword_10093A1F0);
          uint64_t v86 = 0;
        }
        else
        {
          uint64_t v86 = (void *)sub_100758920();
          (*(void (**)(char *, uint64_t))(v84 + 8))(v19, v83);
        }
        sub_1003AF974(v86, v121);

        double v65 = 16.0;
        uint64_t v59 = (uint64_t)v106;
        if (qword_100931080 != -1) {
          swift_once();
        }
        uint64_t v67 = 1;
        uint64_t v68 = qword_100992C00;
      }
      else
      {
        sub_10001A758(v108, (uint64_t)v15, &qword_10093A1F0);
        uint64_t v90 = sub_100758980();
        uint64_t v91 = *(void *)(v90 - 8);
        int v92 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 48))(v15, 1, v90);
        uint64_t v63 = v110;
        if (v92 == 1)
        {
          sub_10000FED8((uint64_t)v15, &qword_10093A1F0);
          uint64_t v93 = 0;
        }
        else
        {
          uint64_t v93 = (void *)sub_100758920();
          (*(void (**)(char *, uint64_t))(v91 + 8))(v15, v90);
        }
        uint64_t v59 = (uint64_t)v106;
        sub_1003AF96C(v93, v121);

        double v65 = 16.0;
        if (qword_100931078 != -1) {
          swift_once();
        }
        uint64_t v67 = 1;
        uint64_t v68 = qword_100992BE8;
      }
    }
    goto LABEL_45;
  }
  if (a4)
  {
    sub_10001A758(v108, (uint64_t)v31, &qword_10093A1F0);
    uint64_t v71 = sub_100758980();
    uint64_t v72 = *(void *)(v71 - 8);
    int v73 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48))(v31, 1, v71);
    uint64_t v63 = v110;
    if (v73 == 1)
    {
      sub_10000FED8((uint64_t)v31, &qword_10093A1F0);
      v74 = 0;
    }
    else
    {
      v74 = (void *)sub_100758920();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v71);
    }
    uint64_t v59 = (uint64_t)v106;
    sub_1003AF96C(v74, v121);

    uint64_t v66 = v114;
    if (qword_100931098 != -1) {
      swift_once();
    }
    uint64_t v87 = sub_10001076C(v63, (uint64_t)qword_100992C48);
    sub_1003FCE6C(v87, (uint64_t)v54);
    double v65 = 16.0;
    if (qword_100931048 == -1) {
      goto LABEL_25;
    }
  }
  else
  {
    sub_10001A758(v108, (uint64_t)v27, &qword_10093A1F0);
    uint64_t v79 = sub_100758980();
    uint64_t v80 = *(void *)(v79 - 8);
    int v81 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v80 + 48))(v27, 1, v79);
    uint64_t v63 = v110;
    if (v81 == 1)
    {
      sub_10000FED8((uint64_t)v27, &qword_10093A1F0);
      v82 = 0;
    }
    else
    {
      v82 = (void *)sub_100758920();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v27, v79);
    }
    uint64_t v59 = (uint64_t)v106;
    sub_1003AF96C(v82, v121);

    if (qword_100931088 != -1) {
      swift_once();
    }
    uint64_t v89 = sub_10001076C(v63, (uint64_t)qword_100992C18);
    sub_1003FCE6C(v89, (uint64_t)v54);
    double v65 = 16.0;
    uint64_t v66 = v114;
    if (qword_100931048 == -1) {
      goto LABEL_25;
    }
  }
  swift_once();
LABEL_25:
  uint64_t v67 = 0;
  uint64_t v68 = qword_100992B58;
  uint64_t v88 = (uint64_t)v66;
LABEL_46:
  uint64_t v94 = sub_10001076C(v63, (uint64_t)v68);
  sub_1003FCE6C(v94, v88);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v66, v67, 1, v63);
  uint64_t v95 = v121;
  uint64_t v96 = v111;
  sub_1003FCE6C((uint64_t)v121, v111);
  uint64_t v97 = (uint64_t)v66;
  uint64_t v98 = v113;
  sub_1003FCE6C((uint64_t)v54, v113);
  uint64_t v99 = v115;
  sub_10001A758(v97, v115, &qword_100939FE8);
  uint64_t v100 = v116;
  sub_10001A758(v59, v116, &qword_10093A160);
  uint64_t v101 = (uint64_t)v54;
  uint64_t v102 = v59;
  uint64_t v103 = (uint64_t)v119;
  (*(void (**)(char *, void, uint64_t))(v117 + 104))(v119, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v118);
  sub_100010808();
  uint64_t v104 = sub_100768210();
  sub_10010FE4C(v96, v98, v99, 0, 0, v112 & 1, v100, v103, v120, v65, 0, v104);
  sub_10000FED8(v102, &qword_10093A160);
  sub_10000FED8(v97, &qword_100939FE8);
  sub_1003B5FA8(v101);
  return sub_1003B5FA8((uint64_t)v95);
}

uint64_t sub_10073628C()
{
  uint64_t v0 = (int *)type metadata accessor for TitleHeaderView.Style(0);
  __chkstk_darwin(v0, v1);
  uint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10075BF00();
  uint64_t v4 = *(void *)(v41 - 8);
  __chkstk_darwin(v41, v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v22);
  uint64_t v40 = (uint64_t)&v34 - v23;
  sub_100047D88((uint64_t)v0, qword_100996198);
  uint64_t v38 = sub_10001076C((uint64_t)v0, (uint64_t)qword_100996198);
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_10001076C(v16, (uint64_t)qword_100992AF8);
  sub_1003FCE6C(v24, v40);
  if (qword_100931038 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001076C(v16, (uint64_t)qword_100992B28);
  sub_1003FCE6C(v25, (uint64_t)v20);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  uint64_t v26 = enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastLineCenter(_:);
  uint64_t v27 = sub_10075BEF0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v36 = v20;
  uint64_t v37 = v15;
  uint64_t v29 = v28;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 104);
  v35(v11, v26, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v11, 0, 1, v27);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v41);
  sub_100010808();
  uint64_t v30 = sub_100768210();
  uint64_t v39 = v11;
  uint64_t v31 = v0[8];
  sub_100736814(v40, (uint64_t)v3, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v36, (uint64_t)&v3[v0[5]], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC((uint64_t)v37, (uint64_t)&v3[v0[6]]);
  v3[v0[7]] = 0;
  v3[v31] = 0;
  v3[v0[9]] = 0;
  *(void *)&v3[v0[14]] = 0x4030000000000000;
  *(void *)&v3[v0[12]] = 0;
  *(void *)&v3[v0[13]] = v30;
  uint64_t v32 = (uint64_t)v39;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v3[v0[11]], v7, v41);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v32, 1, v27) == 1)
  {
    sub_10000FED8(v32, &qword_10093A160);
    v35(&v3[v0[10]], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastBaseline(_:), v27);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 32))(&v3[v0[10]], v32, v27);
  }
  return sub_100736814((uint64_t)v3, v38, type metadata accessor for TitleHeaderView.Style);
}

uint64_t sub_1007367AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000FB44(&qword_100939FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100736814(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10073687C(uint64_t a1)
{
  return sub_1007372B8(a1, qword_1009961B0, &qword_1009310A0, (uint64_t)qword_100992C60, (uint64_t)sub_1003B336C);
}

uint64_t sub_1007368A8()
{
  uint64_t v0 = (int *)type metadata accessor for TitleHeaderView.Style(0);
  __chkstk_darwin(v0, v1);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_10075BF00();
  uint64_t v4 = *(void *)(v38 - 8);
  __chkstk_darwin(v38, v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v22);
  uint64_t v37 = (uint64_t)&v33 - v23;
  sub_100047D88((uint64_t)v0, qword_1009961C8);
  uint64_t v35 = sub_10001076C((uint64_t)v0, (uint64_t)qword_1009961C8);
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_10001076C(v16, (uint64_t)qword_100992AF8);
  sub_1003FCE6C(v24, v37);
  if (qword_1009310D0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001076C(v16, (uint64_t)qword_100992CF0);
  sub_1003FCE6C(v25, (uint64_t)v20);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  uint64_t v26 = sub_10075BEF0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v34 = v15;
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v11, 1, 1, v26);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v38);
  sub_100010808();
  uint64_t v29 = sub_100768210();
  uint64_t v36 = v11;
  uint64_t v30 = v0[8];
  sub_100736814(v37, (uint64_t)v3, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v20, (uint64_t)&v3[v0[5]], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC((uint64_t)v34, (uint64_t)&v3[v0[6]]);
  v3[v0[7]] = 1;
  v3[v30] = 0;
  v3[v0[9]] = 0;
  *(void *)&v3[v0[14]] = 0x4030000000000000;
  *(void *)&v3[v0[12]] = 0;
  *(void *)&v3[v0[13]] = v29;
  uint64_t v31 = (uint64_t)v36;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v3[v0[11]], v7, v38);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v31, 1, v26) == 1)
  {
    sub_10000FED8(v31, &qword_10093A160);
    (*(void (**)(char *, void, uint64_t))(v28 + 104))(&v3[v0[10]], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastBaseline(_:), v26);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(&v3[v0[10]], v31, v26);
  }
  return sub_100736814((uint64_t)v3, v35, type metadata accessor for TitleHeaderView.Style);
}

uint64_t sub_100736D9C()
{
  uint64_t v0 = (int *)type metadata accessor for TitleHeaderView.Style(0);
  __chkstk_darwin(v0, v1);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_10075BF00();
  uint64_t v4 = *(void *)(v38 - 8);
  __chkstk_darwin(v38, v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v22);
  uint64_t v37 = (uint64_t)&v33 - v23;
  sub_100047D88((uint64_t)v0, qword_1009961E0);
  uint64_t v35 = sub_10001076C((uint64_t)v0, (uint64_t)qword_1009961E0);
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_10001076C(v16, (uint64_t)qword_100992AF8);
  sub_1003FCE6C(v24, v37);
  if (qword_1009310D8 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001076C(v16, (uint64_t)qword_100992D08);
  sub_1003FCE6C(v25, (uint64_t)v20);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  uint64_t v26 = sub_10075BEF0();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v34 = v15;
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v11, 1, 1, v26);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.centered(_:), v38);
  sub_100010808();
  uint64_t v29 = sub_100768210();
  uint64_t v36 = v11;
  uint64_t v30 = v0[8];
  sub_100736814(v37, (uint64_t)v3, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v20, (uint64_t)&v3[v0[5]], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC((uint64_t)v34, (uint64_t)&v3[v0[6]]);
  v3[v0[7]] = 0;
  v3[v30] = 0;
  v3[v0[9]] = 0;
  *(void *)&v3[v0[14]] = 0x4030000000000000;
  *(void *)&v3[v0[12]] = 0;
  *(void *)&v3[v0[13]] = v29;
  uint64_t v31 = (uint64_t)v36;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v3[v0[11]], v7, v38);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v31, 1, v26) == 1)
  {
    sub_10000FED8(v31, &qword_10093A160);
    (*(void (**)(char *, void, uint64_t))(v28 + 104))(&v3[v0[10]], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastBaseline(_:), v26);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(&v3[v0[10]], v31, v26);
  }
  return sub_100736814((uint64_t)v3, v35, type metadata accessor for TitleHeaderView.Style);
}

uint64_t sub_10073728C(uint64_t a1)
{
  return sub_1007372B8(a1, qword_1009961F8, &qword_1009310E0, (uint64_t)qword_100992D20, (uint64_t)sub_1003B560C);
}

uint64_t sub_1007372B8(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = (char *)a5;
  uint64_t v43 = (char *)a4;
  uint64_t v7 = (int *)type metadata accessor for TitleHeaderView.Style(0);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_10075BF00();
  uint64_t v41 = *(void *)(v45 - 8);
  __chkstk_darwin(v45, v11);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000FB44(&qword_10093A160);
  __chkstk_darwin(v14 - 8, v15);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000FB44(&qword_100939FE8);
  __chkstk_darwin(v18 - 8, v19);
  uint64_t v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for TitleHeaderView.TextConfiguration(0);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22, v24);
  uint64_t v26 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27, v28);
  uint64_t v44 = (uint64_t)&v40 - v29;
  sub_100047D88((uint64_t)v7, a2);
  uint64_t v42 = sub_10001076C((uint64_t)v7, (uint64_t)a2);
  if (qword_100931028 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_10001076C(v22, (uint64_t)qword_100992AF8);
  sub_1003FCE6C(v30, v44);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_10001076C(v22, (uint64_t)v43);
  sub_1003FCE6C(v31, (uint64_t)v26);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v21, 1, 1, v22);
  uint64_t v32 = sub_10075BEF0();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v40 = v21;
  uint64_t v34 = v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v17, 1, 1, v32);
  uint64_t v35 = v41;
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v13, enum case for TitleHeaderLayout.ChildrenHorizontalAlignment.leading(_:), v45);
  sub_100010808();
  uint64_t v36 = sub_100768210();
  uint64_t v43 = v17;
  uint64_t v37 = v7[8];
  sub_100736814(v44, (uint64_t)v10, type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_100736814((uint64_t)v26, (uint64_t)&v10[v7[5]], type metadata accessor for TitleHeaderView.TextConfiguration);
  sub_1007367AC((uint64_t)v40, (uint64_t)&v10[v7[6]]);
  v10[v7[7]] = 0;
  v10[v37] = 0;
  v10[v7[9]] = 0;
  *(void *)&v10[v7[14]] = 0x4030000000000000;
  *(void *)&v10[v7[12]] = 0;
  *(void *)&v10[v7[13]] = v36;
  uint64_t v38 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v10[v7[11]], v13, v45);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v38, 1, v32) == 1)
  {
    sub_10000FED8(v38, &qword_10093A160);
    (*(void (**)(char *, void, uint64_t))(v34 + 104))(&v10[v7[10]], enum case for TitleHeaderLayout.AccessoryVerticalAlignment.lastBaseline(_:), v32);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(&v10[v7[10]], v38, v32);
  }
  return sub_100736814((uint64_t)v10, v42, type metadata accessor for TitleHeaderView.Style);
}

unint64_t sub_1007377A0()
{
  unint64_t result = qword_10095AB88;
  if (!qword_10095AB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10095AB88);
  }
  return result;
}

unint64_t sub_1007377F8()
{
  unint64_t result = qword_10095AB90;
  if (!qword_10095AB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10095AB90);
  }
  return result;
}

id sub_10073784C(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  int v8 = a2;
  uint64_t v9 = sub_10075E6F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v8 == 2) {
    char v14 = sub_100759370();
  }
  else {
    char v14 = v8 & 1;
  }
  id v15 = [a5 snapshotPageTraitEnvironment];
  *(void *)&v6[OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_pageTraits] = v15;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_1004C07A8();
  swift_unknownObjectRelease();
  v6[OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_showsBadge] = sub_100759360() & 1;
  sub_1004C0C74();
  uint64_t v16 = *(void **)&v6[OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_titleLabel];
  sub_100759390();
  if (v17)
  {
    NSString v18 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v18 = 0;
  }
  [v16 setText:v18];

  uint64_t v19 = *(void **)&v6[OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_textLabel];
  sub_100759380();
  if (v20)
  {
    NSString v21 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = 0;
  }
  [v19 setText:v21];

  sub_10075E670();
  sub_100737AAC();
  char v22 = sub_100768720();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v6[OBJC_IVAR____TtC22SubscribePageExtension23EditorsChoiceReviewView_isExpanded] = v22 & 1 | ((v14 & 1) == 0);
  sub_1004C07A8();
  return [v6 setNeedsLayout];
}

unint64_t sub_100737AAC()
{
  unint64_t result = qword_10093B010;
  if (!qword_10093B010)
  {
    sub_10075E6F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10093B010);
  }
  return result;
}

unsigned char *_s5StateVwst_7(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x100737BD0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *_s5StateVMa_8()
{
  return &_s5StateVN_8;
}

uint64_t sub_100737C08(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
  id v3 = [a1 superview];
  if (!v3) {
    return 0;
  }
  unsigned int v4 = v3;
  sub_10000D514();
  id v5 = v2;
  id v6 = v4;
  char v7 = sub_100768430();

  return v7 & 1;
}

id sub_100737C98()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000FB44(&qword_10094F7C0);
  __chkstk_darwin(v2 - 8, v3);
  id v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000FB44(&qword_100938110);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(unsigned char **)(v0 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView);
  uint64_t v11 = sub_100763E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  uint64_t v12 = (uint64_t)&v10[OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkTemplate];
  swift_beginAccess();
  sub_100078B50((uint64_t)v9, v12, &qword_100938110);
  swift_endAccess();
  uint64_t v13 = sub_1007560D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v5, 1, 1, v13);
  uint64_t v14 = (uint64_t)&v10[OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkHandlerKey];
  swift_beginAccess();
  sub_100078B50((uint64_t)v5, v14, &qword_10094F7C0);
  swift_endAccess();
  [*(id *)&v10[OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_imageView] setImage:0];
  uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v17 = (void *)Strong;
    *(unsigned char *)(Strong + qword_100995C50) = 7;
    sub_10068B23C();
  }
  NSString v18 = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  sub_100227028(v18);

  uint64_t v19 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded) = 0;
  v10[OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_isExpanded] = 0;
  [v10 setNeedsLayout];
  *(unsigned char *)(v15 + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_isExpanded) = *(unsigned char *)(v1 + v19);
  id result = sub_100225FDC();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_hasMedia) = 0;
  return result;
}

void sub_100737F4C(char a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_originalSizeCategory;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_originalSizeCategory) = a1;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = (id)Strong;
    sub_10073A1C0(&qword_10093AE08, (void (*)(uint64_t))type metadata accessor for TodayCardVideoView);
    id v6 = [v11 superview];
    if (v6)
    {
      uint64_t v7 = v6;
      sub_10000D514();
      id v8 = v4;
      id v9 = v7;
      LOBYTE(v7) = sub_100768430();

      if ((v7 & 1) == 0) {
        return;
      }
      uint64_t v10 = swift_unknownObjectWeakLoadStrong();
      if (!v10) {
        return;
      }
      *(unsigned char *)(v10 + qword_100995C50) = *(unsigned char *)(v2 + v3);
      id v11 = (id)v10;
      sub_10068B23C();
    }
  }
}

id sub_1007380B8(char *a1, char a2, uint64_t a3, unsigned int a4)
{
  id v5 = v4;
  char v9 = a2 & 1;
  if ((a2 & 1) == 0)
  {
    [a1 frame];
    objc_msgSend(v5, "setFrame:");
  }
  uint64_t v10 = *(unsigned char **)&v5[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView];
  sub_1005407E8(*(void **)&a1[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView], v9, a3, a4);
  uint64_t v11 = *(void *)&v5[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView];
  sub_100227C84(*(void **)&a1[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView], v9, a3);
  uint64_t v12 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded;
  char v13 = a1[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded];
  v5[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded] = v13;
  v10[OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_isExpanded] = v13;
  [v10 setNeedsLayout];
  *(unsigned char *)(v11 + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_isExpanded) = v5[v12];
  sub_100225FDC();
  id result = objc_msgSend(v5, "setHidden:", objc_msgSend(a1, "isHidden"));
  v5[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_hasMedia] = a1[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_hasMedia];
  return result;
}

void sub_1007381D8()
{
  uint64_t v1 = sub_10000FB44(&qword_10094F7C0);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1007560D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  char v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10, v11);
  char v13 = &v17[-v12];
  uint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView)
      + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_currentArtworkHandlerKey;
  swift_beginAccess();
  sub_10001A758(v14, (uint64_t)v4, &qword_10094F7C0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000FED8((uint64_t)v4, &qword_10094F7C0);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v13, v4, v5);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v13, v5);
    sub_10073A1C0(&qword_10094F7D0, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_1007688D0();
    sub_1007591A0();
    sub_10001A544((uint64_t)v17);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v5);
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = (void *)Strong;
    type metadata accessor for TodayCardVideoView();
    sub_10073A1C0((unint64_t *)&unk_10095ABF0, (void (*)(uint64_t))type metadata accessor for TodayCardVideoView);
    sub_1007591B0();
  }
}

void sub_1007384B8(uint64_t a1, double a2)
{
  uint64_t v5 = sub_100758520();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16))(v10, a1, v5, v8);
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v10, v5);
  if (v11 == enum case for CornerStyle.continuous(_:))
  {
    uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView);
    [v12 _setContinuousCornerRadius:a2];
    char v13 = *(void **)(v2 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
    [v13 _setContinuousCornerRadius:a2];
  }
  else
  {
    int v14 = v11;
    int v15 = enum case for CornerStyle.arc(_:);
    uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView);
    [v12 _setCornerRadius:a2];
    char v13 = *(void **)(v2 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
    [v13 _setCornerRadius:a2];
    if (v14 != v15) {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
    }
  }
  id v16 = [v12 layer];
  [v16 setMaskedCorners:sub_100767AF0()];

  id v17 = [v13 layer];
  [v17 setMaskedCorners:sub_100767AF0()];
}

char *sub_1007386F0(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v4[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded] = 0;
  uint64_t v10 = &v4[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_pageGrid];
  uint64_t v11 = sub_100764370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v4[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_sizeCategory] = 7;
  v4[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_originalSizeCategory] = 7;
  v4[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isTransitioning] = 0;
  v4[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_hasMedia] = 0;
  uint64_t v12 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView;
  type metadata accessor for RevealingImageView();
  id v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  int v14 = v4;
  *(void *)&v4[v12] = [v13 init];
  uint64_t v15 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView;
  type metadata accessor for RevealingVideoView();
  *(void *)&v14[v15] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v20.receiver = v14;
  v20.super_class = ObjectType;
  id v16 = (char *)objc_msgSendSuper2(&v20, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v17 = *(void *)&v16[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView];
  uint64_t v18 = v16;
  [v18 addSubview:v17];
  [v18 addSubview:*(void *)&v18[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView]];

  return v18;
}

void sub_1007388F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView);
  uint64_t v3 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_sizeCategory;
  uint64_t v4 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_sizeCategory);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension18RevealingImageView_sizeCategory) = v4;
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    (*(void (**)(uint64_t))((swift_isaMask & *Strong) + 0x128))(v4);
  }
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
  uint64_t v8 = *(unsigned __int8 *)(v1 + v3);
  *(unsigned char *)(v7 + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_sizeCategory) = v8;
  uint64_t v9 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v9)
  {
    id v10 = v9;
    (*(void (**)(uint64_t))((swift_isaMask & *v9) + 0x118))(v8);
  }
}

void (*sub_100738B04(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v2 = OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_videoView;
  a1[1] = *(void *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
  a1[2] = v2;
  *a1 = swift_unknownObjectWeakLoadStrong();
  return sub_10022738C;
}

uint64_t sub_100738BCC()
{
  return type metadata accessor for StoryCardMediaView();
}

uint64_t type metadata accessor for StoryCardMediaView()
{
  uint64_t result = qword_10095ABC8;
  if (!qword_10095ABC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100738C20()
{
  sub_10022780C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100738CDC()
{
  return swift_unknownObjectWeakLoadStrong();
}

void sub_100738CFC(void *a1)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  sub_100227028(Strong);
}

uint64_t (*sub_100738D80(uint64_t **a1))()
{
  uint64_t v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_100738B04(v2);
  return sub_10001D2B4;
}

uint64_t sub_100738DD8()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = sub_10073A1C0(&qword_10095ABE8, (void (*)(uint64_t))type metadata accessor for StoryCardMediaView);

  return VideoViewProviding.someVideoView.getter(ObjectType, v1);
}

uint64_t sub_100738E4C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_10073A1C0(&qword_10095ABE8, (void (*)(uint64_t))type metadata accessor for StoryCardMediaView);

  return VideoViewProviding.someVideoView.setter(a1, a2, ObjectType, v5);
}

uint64_t (*sub_100738ED8(void *a1))()
{
  swift_getObjectType();
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_10073A1C0(&qword_10095ABE8, (void (*)(uint64_t))type metadata accessor for StoryCardMediaView);
  v2[4] = sub_10075CB60();
  return sub_10001D2B4;
}

uint64_t sub_100738F80()
{
  return sub_10073A1C0(&qword_10095ABD8, (void (*)(uint64_t))type metadata accessor for StoryCardMediaView);
}

uint64_t sub_100738FC8()
{
  return sub_10073A1C0(&qword_10095ABE0, (void (*)(uint64_t))type metadata accessor for StoryCardMediaView);
}

uint64_t sub_100739010()
{
  return sub_10073A1C0(&qword_10093AE08, (void (*)(uint64_t))type metadata accessor for TodayCardVideoView);
}

uint64_t sub_100739058(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v59 = a1;
  uint64_t v60 = a5;
  int v51 = a3;
  uint64_t v54 = a2;
  uint64_t v5 = sub_100763FC0();
  __chkstk_darwin(v5 - 8, v6);
  double v65 = &v50[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100763E10();
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v62 = &v50[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_100764020();
  uint64_t v63 = *(void *)(v11 - 8);
  uint64_t v64 = v11;
  __chkstk_darwin(v11, v12);
  uint64_t v61 = &v50[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_10000FB44((uint64_t *)&unk_100950A98);
  __chkstk_darwin(v14 - 8, v15);
  uint64_t v55 = &v50[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v58 = sub_100763F20();
  uint64_t v17 = *(void *)(v58 - 8);
  __chkstk_darwin(v58, v18);
  uint64_t v56 = &v50[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v20, v21);
  uint64_t v57 = &v50[-v22];
  uint64_t v53 = sub_100768B20();
  uint64_t v23 = *(void *)(v53 - 8);
  __chkstk_darwin(v53, v24);
  uint64_t v26 = &v50[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v52 = sub_10075EE20();
  uint64_t v27 = *(void *)(v52 - 8);
  __chkstk_darwin(v52, v28);
  uint64_t v30 = &v50[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = sub_100762810();
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31, v33);
  uint64_t v35 = &v50[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v36, v37);
  uint64_t v39 = &v50[-v38];
  sub_100756480();
  sub_1007642F0();
  if (v51 == 6)
  {
    uint64_t v40 = (unsigned int *)&enum case for TodayCardArtworkSizedLayoutMetrics.Priority.extraWide(_:);
  }
  else
  {
    if (v51 == 5)
    {
      sub_100764220();
    }
    else
    {
      if (v51 == 4)
      {
        sub_1007642B0();
        uint64_t v40 = (unsigned int *)&enum case for TodayCardArtworkSizedLayoutMetrics.Priority.mini(_:);
        goto LABEL_9;
      }
      sub_100701AEC(v51);
    }
    uint64_t v40 = (unsigned int *)&enum case for TodayCardArtworkSizedLayoutMetrics.Priority.none(_:);
  }
LABEL_9:
  (*(void (**)(unsigned char *, void, uint64_t))(v32 + 104))(v35, *v40, v31);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v32 + 32))(v39, v35, v31);
  sub_100767830();
  (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v39, v31);
  sub_1007627F0();
  if (v41) {
    sub_100763F40();
  }
  uint64_t v42 = v60;
  sub_100762800();
  sub_10075EDF0();
  sub_100768090();
  sub_100768050();
  uint64_t v43 = v53;
  (*(void (**)(unsigned char *, void, uint64_t))(v23 + 104))(v26, enum case for FloatingPointRoundingRule.toNearestOrAwayFromZero(_:), v53);
  sub_100768070();
  (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v26, v43);
  (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v30, v52);
  uint64_t v44 = (uint64_t)v55;
  sub_1007627E0();
  uint64_t v45 = v58;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v44, 1, v58) == 1)
  {
    uint64_t v46 = v57;
    sub_100763F30();
    sub_10000FED8(v44, (uint64_t *)&unk_100950A98);
  }
  else
  {
    uint64_t v46 = v57;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 32))(v57, v44, v45);
  }
  uint64_t v47 = v61;
  sub_100763E20();
  sub_100764040();
  [v42 displayScale];
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v17 + 16))(v56, v46, v45);
  sub_100764000();
  sub_100764010();
  sub_10075CD40();
  swift_allocObject();
  uint64_t v48 = sub_10075CD20();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v63 + 8))(v47, v64);
  (*(void (**)(unsigned char *, uint64_t))(v17 + 8))(v46, v45);
  return v48;
}

void sub_100739780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t v8 = v7;
  unsigned int v74 = a6;
  uint64_t v71 = a5;
  uint64_t v75 = a4;
  uint64_t v82 = a3;
  uint64_t v73 = a2;
  uint64_t v11 = sub_10000FB44(&qword_100934590);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v72 = (char *)v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000FB44((uint64_t *)&unk_100939960);
  __chkstk_darwin(v14 - 8, v15);
  int v81 = (char *)v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v18);
  uint64_t v80 = (char *)v69 - v19;
  uint64_t v20 = sub_100755EA0();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20, v22);
  uint64_t v76 = (char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10000FB44((uint64_t *)&unk_100943DE0);
  __chkstk_darwin(v24, v25);
  uint64_t v27 = (char *)v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10000FB44((uint64_t *)&unk_100938040);
  __chkstk_darwin(v28 - 8, v29);
  uint64_t v79 = (char *)v69 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31, v32);
  uint64_t v78 = (uint64_t)v69 - v33;
  __chkstk_darwin(v34, v35);
  uint64_t v37 = (char *)v69 - v36;
  __chkstk_darwin(v38, v39);
  char v41 = (char *)v69 - v40;
  uint64_t v83 = a1;
  sub_100763880();
  uint64_t v42 = 1;
  int v85 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  v85(v41, 0, 1, v20);
  uint64_t v77 = v8;
  uint64_t v70 = *(char **)(v8 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView);
  v69[1] = &v70[OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_videoView];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v84 = a7;
  if (Strong)
  {
    uint64_t v44 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v37, Strong + qword_1009950B0, v20);

    uint64_t v42 = 0;
  }
  v85(v37, v42, 1, v20);
  uint64_t v45 = (uint64_t)&v27[*(int *)(v24 + 48)];
  sub_10001A758((uint64_t)v41, (uint64_t)v27, (uint64_t *)&unk_100938040);
  sub_10001A758((uint64_t)v37, v45, (uint64_t *)&unk_100938040);
  uint64_t v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
  if (v46((uint64_t)v27, 1, v20) == 1)
  {
    sub_10000FED8((uint64_t)v37, (uint64_t *)&unk_100938040);
    sub_10000FED8((uint64_t)v41, (uint64_t *)&unk_100938040);
    if (v46(v45, 1, v20) == 1)
    {
      sub_10000FED8((uint64_t)v27, (uint64_t *)&unk_100938040);
      return;
    }
  }
  else
  {
    uint64_t v47 = v78;
    sub_10001A758((uint64_t)v27, v78, (uint64_t *)&unk_100938040);
    if (v46(v45, 1, v20) != 1)
    {
      uint64_t v52 = v47;
      uint64_t v53 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(v76, v45, v20);
      sub_10073A1C0(&qword_100937568, (void (*)(uint64_t))&type metadata accessor for URL);
      char v54 = sub_100767570();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v21 + 8);
      v55(v53, v20);
      sub_10000FED8((uint64_t)v37, (uint64_t *)&unk_100938040);
      sub_10000FED8((uint64_t)v41, (uint64_t *)&unk_100938040);
      v55((char *)v52, v20);
      sub_10000FED8((uint64_t)v27, (uint64_t *)&unk_100938040);
      if (v54) {
        return;
      }
      goto LABEL_9;
    }
    sub_10000FED8((uint64_t)v37, (uint64_t *)&unk_100938040);
    sub_10000FED8((uint64_t)v41, (uint64_t *)&unk_100938040);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v47, v20);
  }
  sub_10000FED8((uint64_t)v27, (uint64_t *)&unk_100943DE0);
LABEL_9:
  sub_10075B250();
  sub_100766C80();
  sub_100767240();
  sub_1007637F0();
  uint64_t v48 = (uint64_t)v79;
  sub_100763880();
  v85((char *)v48, 0, 1, v20);
  uint64_t v49 = (uint64_t)v80;
  sub_100763840();
  uint64_t v50 = (uint64_t)v81;
  sub_100763830();
  type metadata accessor for TodayCardVideoView();
  sub_10073A1C0(&qword_10093AE08, (void (*)(uint64_t))type metadata accessor for TodayCardVideoView);
  int v51 = (void *)sub_10075B230();
  sub_10000FED8(v50, (uint64_t *)&unk_100939960);
  sub_10000FED8(v49, (uint64_t *)&unk_100939960);
  sub_10000FED8(v48, (uint64_t *)&unk_100938040);
  sub_10000FED8((uint64_t)v86, (uint64_t *)&unk_100938A80);
  if (!v51)
  {
LABEL_12:
    swift_release();
    return;
  }
  if (*((unsigned char *)v51 + qword_100995C58))
  {

    goto LABEL_12;
  }
  *((unsigned char *)v51 + qword_100995C50) = *(unsigned char *)(v77
                                               + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_originalSizeCategory);
  id v56 = v51;
  sub_10068B23C();
  swift_unknownObjectWeakAssign();
  uint64_t v57 = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  id v58 = v56;
  uint64_t v59 = v70;
  sub_100227028(v57);

  id v60 = v58;
  sub_100763870();
  sub_100763F40();
  double v62 = v61;
  double v64 = v63;
  swift_release();
  uint64_t v65 = sub_100764370();
  uint64_t v66 = *(void *)(v65 - 8);
  uint64_t v67 = (uint64_t)v72;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v72, v71, v65);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56))(v67, 0, 1, v65);
  sub_1002265B0(v51, v73, v67, v74, v62, v64);

  sub_10000FED8(v67, &qword_100934590);
  sub_1007591F0();
  sub_100767240();
  sub_10073A1C0((unint64_t *)&unk_10095ABF0, (void (*)(uint64_t))type metadata accessor for TodayCardVideoView);
  sub_100759150();
  [v59 setHidden:0];
  uint64_t v68 = v77;
  [*(id *)(v77 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView) setHidden:1];
  swift_release();
  swift_release();

  *(unsigned char *)(v68 + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_hasMedia) = 1;
}

void sub_10073A080()
{
  v0[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isExpanded] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_pageGrid];
  uint64_t v2 = sub_100764370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v0[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_sizeCategory] = 7;
  v0[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_originalSizeCategory] = 7;
  v0[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_isTransitioning] = 0;
  v0[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_hasMedia] = 0;
  uint64_t v3 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView;
  type metadata accessor for RevealingImageView();
  *(void *)&v0[v3] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView;
  type metadata accessor for RevealingVideoView();
  *(void *)&v0[v4] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  sub_100768A40();
  __break(1u);
}

uint64_t sub_10073A1C0(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10073A360(void *a1)
{
  uint64_t v2 = v1;
  sub_1005378AC(0);
  id v4 = [a1 viewControllerForKey:UITransitionContextToViewControllerKey];
  if (v4)
  {
    id v5 = v4;
    [a1 finalFrameForViewController:v4];
  }
  else
  {
    id v5 = [a1 containerView];
    [v5 bounds];
  }
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  CGFloat v75 = v8;
  CGFloat v12 = v9;

  v83.origin.CGFloat x = v10;
  v83.origin.CGFloat y = v11;
  v83.size.CGFloat width = v75;
  v83.size.CGFloat height = v12;
  double MidX = CGRectGetMidX(v83);
  v84.origin.CGFloat x = v10;
  v84.origin.CGFloat y = v11;
  v84.size.CGFloat width = v75;
  v84.size.CGFloat height = v12;
  double MidY = CGRectGetMidY(v84);
  v85.origin.CGFloat x = v10;
  v85.origin.CGFloat y = v11;
  v85.size.CGFloat width = v75;
  v85.size.CGFloat height = v12;
  double v13 = CGRectGetMidX(v85);
  v86.origin.CGFloat x = v10;
  v86.origin.CGFloat y = v11;
  v86.size.CGFloat width = v75;
  v86.size.CGFloat height = v12;
  double v14 = CGRectGetMidY(v86);
  uint64_t v15 = *(void **)(v2
                 + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCollectionViewController);
  double v16 = 0.0;
  if (v15)
  {
    id v17 = [*(id *)(v2+ OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCollectionViewController) view];
    double v18 = 0.0;
    if (v17)
    {
      uint64_t v19 = v17;
      [v17 bounds];
      double v21 = v20;
      double v23 = v22;
      double v72 = v12;
      double v24 = v13;
      double v26 = v25;
      double v27 = v10;
      double v28 = v14;
      double v30 = v29;
      id v31 = [a1 containerView];
      double v32 = v26;
      double v13 = v24;
      CGFloat v12 = v72;
      double v33 = v30;
      double v14 = v28;
      CGFloat v10 = v27;
      objc_msgSend(v19, "convertRect:toCoordinateSpace:", v31, v21, v23, v32, v33);
      double v18 = v34;
      double v16 = v35;

      double MidY = MidY - v16;
      double MidX = MidX - v18;
    }
  }
  else
  {
    double v18 = 0.0;
  }
  id v36 = *(id *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCardView);
  uint64_t v37 = *(void *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCenter);
  uint64_t v38 = *(void *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCenter + 8);
  char v39 = *(unsigned char *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCenter + 16);
  if (v36
    && (*(unsigned char *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCenter + 16) & 1) == 0)
  {
    double v70 = v14;
    double v71 = v13;
    if (v15)
    {
      id v40 = v15;
      id v41 = v36;
      id result = [v40 view];
      if (!result)
      {
        __break(1u);
        return result;
      }
      id v43 = result;
      [result addSubview:v41];
    }
    else
    {
      id v44 = v36;
      id v43 = [a1 containerView];
      [v43 addSubview:v44];
    }

    objc_msgSend(v36, "setCenter:", *(double *)&v37, *(double *)&v38);
  }
  id v45 = objc_msgSend(a1, "viewForKey:", UITransitionContextToViewKey, *(void *)&v70, *(void *)&v71);
  if (v15)
  {
    id v46 = [v15 traitCollection];
    id v47 = [v46 horizontalSizeClass];
  }
  else
  {
    id v47 = 0;
  }
  sub_10073B4A0(v45, v36, v37, v38, v39, a1, (uint64_t)v47, v15 == 0, v18, v16, v10, v11, v75, v12);
  unint64_t v82 = (unint64_t)_swiftEmptyArrayStorage;
  id v48 = sub_10073AC50(v36, v45, (uint64_t)a1, 0.0, 0.0, v75, v12, MidX, MidY, v13, v14);
  if (v48)
  {
    id v49 = v48;
    sub_1007677E0();
    if (*(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100767820();
    }
    sub_1007678A0();
    sub_100767810();
  }
  if (v36)
  {
    id v50 = v36;
    if (!UIAccessibilityIsReduceMotionEnabled())
    {
      uint64_t v51 = swift_allocObject();
      *(void *)(v51 + 16) = v50;
      id v52 = objc_allocWithZone((Class)UIViewPropertyAnimator);
      uint64_t v80 = sub_1002EBB24;
      uint64_t v81 = v51;
      aBlock = _NSConcreteStackBlock;
      uint64_t v77 = 1107296256;
      uint64_t v78 = sub_1000DFF64;
      uint64_t v79 = &unk_10088FB78;
      uint64_t v53 = _Block_copy(&aBlock);
      id v54 = v50;
      swift_release();
      id v55 = objc_msgSend(v52, "initWithDuration:controlPoint1:controlPoint2:animations:", v53, 0.28, 0.17, 0.0, 0.67, 1.0);
      _Block_release(v53);
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = v54;
      uint64_t v80 = sub_1002EBB38;
      uint64_t v81 = v56;
      aBlock = _NSConcreteStackBlock;
      uint64_t v77 = 1107296256;
      uint64_t v78 = sub_1001B30B8;
      uint64_t v79 = &unk_10088FBC8;
      uint64_t v57 = _Block_copy(&aBlock);
      id v58 = v54;
      swift_release();
      [v55 addCompletion:v57];
      _Block_release(v57);

      id v36 = v55;
      sub_1007677E0();
      if (*(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_50;
      }
      goto LABEL_28;
    }
  }
  if (v45) {
    goto LABEL_29;
  }
  while (1)
  {
    id v63 = sub_10073AFA8(v45, (uint64_t)a1, 0.0, 0.0, v75, v12, v13, v14);
    if (v63)
    {
      id v64 = v63;
      sub_1007677E0();
      a1 = *(void **)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if ((unint64_t)a1 >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100767820();
      }
      sub_1007678A0();
      sub_100767810();
    }
    unint64_t v65 = v82;
    if (v82 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v66 = sub_100768A60();
      if (!v66) {
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v66 = *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (!v66) {
        goto LABEL_48;
      }
    }
    if (v66 >= 1) {
      break;
    }
    __break(1u);
LABEL_50:
    sub_100767820();
LABEL_28:
    sub_1007678A0();
    sub_100767810();

    if (v45)
    {
LABEL_29:
      id v36 = v45;
      if (UIAccessibilityIsReduceMotionEnabled()) {
        goto LABEL_34;
      }
      uint64_t v59 = swift_allocObject();
      *(void *)(v59 + 16) = v36;
      id v60 = objc_allocWithZone((Class)UIViewPropertyAnimator);
      uint64_t v80 = sub_1002EBB10;
      uint64_t v81 = v59;
      aBlock = _NSConcreteStackBlock;
      uint64_t v77 = 1107296256;
      uint64_t v78 = sub_1000DFF64;
      uint64_t v79 = &unk_10088FB28;
      double v61 = _Block_copy(&aBlock);
      id v36 = v36;
      swift_release();
      id v62 = objc_msgSend(v60, "initWithDuration:controlPoint1:controlPoint2:animations:", v61, 0.13, 0.33, 0.0, 0.83, 0.83);
      _Block_release(v61);

      if (v62)
      {
        id v36 = v62;
        sub_1007677E0();
        if (*(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v82 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100767820();
        }
        sub_1007678A0();
        sub_100767810();
LABEL_34:
      }
    }
  }
  for (uint64_t i = 0; i != v66; ++i)
  {
    if ((v65 & 0xC000000000000001) != 0) {
      id v68 = (id)sub_100768950();
    }
    else {
      id v68 = *(id *)(v65 + 8 * i + 32);
    }
    uint64_t v69 = v68;
    [v68 startAnimation];
  }
LABEL_48:

  return (id)swift_bridgeObjectRelease_n();
}

id sub_10073AC50(void *a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  if (UIAccessibilityIsReduceMotionEnabled()) {
    return 0;
  }
  id v24 = objc_msgSend(objc_allocWithZone((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 180.0, 22.0, 0.0, 0.0);
  id v23 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:v24 timingParameters:0.0];

  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v11;
  *(void *)(v25 + 24) = a1;
  *(double *)(v25 + 32) = a4;
  *(double *)(v25 + 40) = a5;
  *(double *)(v25 + 48) = a6;
  *(double *)(v25 + 56) = a7;
  *(double *)(v25 + 64) = a8;
  *(double *)(v25 + 72) = a9;
  *(void *)(v25 + 80) = a2;
  *(double *)(v25 + 88) = a10;
  *(double *)(v25 + 96) = a11;
  uint64_t v38 = sub_10073B480;
  uint64_t v39 = v25;
  double v34 = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  id v36 = sub_1000DFF64;
  uint64_t v37 = &unk_10088FA88;
  double v26 = _Block_copy(&v34);
  id v27 = a2;
  id v28 = v11;
  id v29 = a1;
  swift_release();
  [v23 addAnimations:v26];
  _Block_release(v26);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = a3;
  *(void *)(v30 + 24) = v28;
  uint64_t v38 = sub_10073B434;
  uint64_t v39 = v30;
  double v34 = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  id v36 = sub_1001B30B8;
  uint64_t v37 = &unk_10088FAD8;
  id v31 = _Block_copy(&v34);
  id v32 = v28;
  swift_unknownObjectRetain();
  swift_release();
  [v23 addCompletion:v31];
  _Block_release(v31);
  return v23;
}

id sub_10073AEBC(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, uint64_t a9, void *a10, void *a11)
{
  sub_1005378AC(1);
  objc_msgSend(a10, "setBounds:", a1, a2, a3, a4);
  objc_msgSend(a10, "setCenter:", a5, a6);
  objc_msgSend(a11, "setBounds:", a1, a2, a3, a4);

  return objc_msgSend(a11, "setCenter:", a7, a8);
}

id sub_10073AFA8(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (!UIAccessibilityIsReduceMotionEnabled()) {
    return 0;
  }
  objc_msgSend(a1, "setBounds:", a3, a4, a5, a6);
  objc_msgSend(a1, "setCenter:", a7, a8);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v8;
  *(void *)(v17 + 24) = a1;
  id v18 = objc_allocWithZone((Class)UIViewPropertyAnimator);
  id v31 = sub_10073B410;
  uint64_t v32 = v17;
  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 1107296256;
  id v29 = sub_1000DFF64;
  uint64_t v30 = &unk_10088F9E8;
  uint64_t v19 = _Block_copy(&v27);
  id v20 = v8;
  id v21 = a1;
  swift_release();
  id v22 = [v18 initWithDuration:0 curve:v19 animations:0.3];
  _Block_release(v19);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a2;
  *(void *)(v23 + 24) = v20;
  id v31 = sub_10073B434;
  uint64_t v32 = v23;
  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 1107296256;
  id v29 = sub_1001B30B8;
  uint64_t v30 = &unk_10088FA38;
  id v24 = _Block_copy(&v27);
  id v25 = v20;
  swift_unknownObjectRetain();
  swift_release();
  [v22 addCompletion:v24];
  _Block_release(v24);
  return v22;
}

id sub_10073B1E8(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC22SubscribePageExtension27AnimatedTransitionWithTasks_tasks);
  id result = (id)swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    double v7 = (unsigned char *)(v5 + 48);
    do
    {
      if (*v7 == 1)
      {
        double v8 = (void (*)(uint64_t, uint64_t))*((void *)v7 - 2);
        swift_retain();
        v8(1, 1);
        swift_release();
      }
      v7 += 24;
      --v6;
    }
    while (v6);
    id result = (id)swift_bridgeObjectRelease();
  }
  if (a2) {
    return [a2 setAlpha:1.0];
  }
  return result;
}

void sub_10073B2EC()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionPageOpenAnimation_fromCollectionViewController);
}

id sub_10073B32C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppPromotionPageOpenAnimation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppPromotionPageOpenAnimation()
{
  return self;
}

uint64_t sub_10073B3D0()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10073B410()
{
  return sub_10073B1E8(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10073B418(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10073B428()
{
  return swift_release();
}

uint64_t sub_10073B438()
{
  return _swift_deallocObject(v0, 104, 7);
}

id sub_10073B480()
{
  return sub_10073AEBC(*(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56), *(double *)(v0 + 64), *(double *)(v0 + 72), *(double *)(v0 + 88), *(double *)(v0 + 96), *(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 80));
}

void sub_10073B4A0(void *a1, void *a2, uint64_t a3, uint64_t a4, char a5, void *a6, uint64_t a7, char a8, double a9, double a10, CGFloat a11, CGFloat a12, CGFloat a13, CGFloat a14)
{
  if (a1)
  {
    id v42 = a1;
    id v27 = [a6 containerView];
    [v27 addSubview:v42];

    if (!a2 || (a5 & 1) != 0)
    {
      BOOL v38 = a7 == 1 && (a8 & 1) == 0;
      double v31 = 0.0;
      if (v38) {
        double v39 = 0.0;
      }
      else {
        double v39 = 0.25;
      }
      v44.origin.CGFloat x = a11;
      v44.origin.CGFloat y = a12;
      v44.size.double width = a13;
      v44.size.double height = a14;
      CGFloat v40 = v39 * CGRectGetWidth(v44);
      v45.origin.CGFloat x = a11;
      v45.origin.CGFloat y = a12;
      v45.size.double width = a13;
      v45.size.double height = a14;
      CGFloat v41 = CGRectGetHeight(v45) * 0.25;
      v46.origin.CGFloat x = a11;
      v46.origin.CGFloat y = a12;
      v46.size.double width = a13;
      v46.size.double height = a14;
      CGRect v47 = CGRectInset(v46, v40, v41);
      double width = v47.size.width;
      double height = v47.size.height;
      v47.origin.CGFloat x = a11;
      v47.origin.CGFloat y = a12;
      v47.size.double width = a13;
      v47.size.double height = a14;
      double MidX = CGRectGetMidX(v47);
      v48.origin.CGFloat x = a11;
      v48.origin.CGFloat y = a12;
      v48.size.double width = a13;
      v48.size.double height = a14;
      double MidY = CGRectGetMidY(v48);
      double v28 = 0.0;
    }
    else
    {
      [a2 bounds];
      double v29 = a10;
      double v31 = v30;
      double width = v32;
      double height = v34;
      double MidX = *(double *)&a3 + a9;
      double MidY = *(double *)&a4 + v29;
    }
    objc_msgSend(v42, "setBounds:", v31, v28, width, height);
    objc_msgSend(v42, "setCenter:", MidX, MidY);
    [v42 setNeedsLayout];
    [v42 layoutIfNeeded];
    [v42 setAlpha:0.0];
  }
}

uint64_t sub_10073B6C4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10073B734(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v39 = sub_100766800();
  uint64_t v2 = *(void *)(v39 - 8);
  __chkstk_darwin(v39, v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100767040();
  uint64_t v36 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  double v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v11);
  double v13 = (char *)&v31 - v12;
  uint64_t v14 = sub_10000FB44((uint64_t *)&unk_100933BF0);
  uint64_t v37 = *(void *)(v14 - 8);
  uint64_t v38 = v14;
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000FB44((uint64_t *)&unk_100936B80);
  __chkstk_darwin(v18 - 8, v19);
  id v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v23 = (void *)Strong;
    sub_100757560();
    uint64_t v24 = sub_100757920();
    swift_release();
    if (v24)
    {
      uint64_t v35 = v2;
      sub_100758680();
      uint64_t v25 = sub_10000FB44((uint64_t *)&unk_100933C00);
      uint64_t v26 = *(void *)(v25 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v21, 1, v25) == 1)
      {
        swift_release();

        sub_10000FED8((uint64_t)v21, (uint64_t *)&unk_100936B80);
      }
      else
      {
        v41[3] = sub_100763930();
        v41[4] = sub_10073C57C((unint64_t *)&qword_100936B90, (void (*)(uint64_t))&type metadata accessor for Action);
        uint64_t v33 = v24;
        v41[0] = v24;
        swift_retain_n();
        uint64_t v32 = v25;
        sub_1004017B0();
        uint64_t v34 = v26;
        uint64_t v27 = v36;
        (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v9, v13, v6);
        sub_1007667E0();
        sub_100766C40();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v39);
        (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v17, v13, v6);
        uint64_t v29 = v37;
        uint64_t v28 = v38;
        (*(void (**)(char *, void, uint64_t))(v37 + 104))(v17, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v38);
        uint64_t v30 = v32;
        sub_100766D00();
        swift_release();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v28);
        _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v41);
        swift_release_n();

        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v30);
      }
    }
    else
    {
    }
  }
}

double sub_10073BBD0(uint64_t a1, void *a2, uint64_t a3, double a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a3;
  uint64_t v40 = a6;
  uint64_t v9 = sub_100768B20();
  uint64_t v36 = *(void *)(v9 - 8);
  uint64_t v37 = v9;
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000FB44((uint64_t *)&unk_10094B200);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100768090();
  double v18 = v17;
  uint64_t v38 = a1;
  sub_100757570();
  uint64_t v35 = sub_100763B60();
  uint64_t v20 = v19;
  swift_retain();
  uint64_t v34 = sub_100763BF0();
  uint64_t v22 = v21;
  swift_release();
  swift_retain();
  uint64_t v23 = sub_100763BE0();
  swift_release();
  if (v23)
  {
    uint64_t v24 = sub_1007643D0();
    uint64_t v26 = v25;
    swift_release();
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v26 = 0;
  }
  uint64_t v27 = sub_10075FAA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v16, 1, 1, v27);
  unsigned __int8 v28 = sub_10075AB60() & 1;
  id v29 = [a2 traitCollection];
  sub_100196AE8(v35, v20, v34, v22, v24, v26, 0, (uint64_t)v16, 0, v28, v29);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FED8((uint64_t)v16, (uint64_t *)&unk_10094B200);
  if (qword_100930658 != -1) {
    swift_once();
  }
  sub_10000FE94(qword_100990660, qword_100990678);
  sub_10054FDBC();
  sub_100764C00();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
  uint64_t v30 = type metadata accessor for AppEventView();
  uint64_t v31 = sub_100757560();
  sub_1001A49FC(v18, v31, a2, v39, v30, v40);
  swift_release();
  swift_release();
  return a4;
}

id sub_10073BF5C(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v8 = v7;
  uint64_t v16 = sub_10000FB44((uint64_t *)&unk_100934630);
  *(void *)&double v18 = __chkstk_darwin(v16 - 8, v17).n128_u64[0];
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = objc_msgSend(v7, "contentView", v18);
  objc_msgSend(v21, "setLayoutMargins:", a4, a5, a6, a7);

  uint64_t v22 = *(char **)&v8[OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_lockupView];
  *(double *)&v22[OBJC_IVAR____TtC22SubscribePageExtension21SmallSearchLockupView_regularWidthColumnSpacing] = a3;
  [v22 setNeedsLayout];
  sub_100010808();
  uint64_t v23 = (void *)sub_100768270();
  [v8 setBackgroundColor:v23];

  uint64_t v24 = sub_100757570();
  uint64_t v25 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v20, 1, 1, v25);
  sub_10002DF8C(v24, (uint64_t)v20, a2);
  swift_release();
  sub_10000FED8((uint64_t)v20, (uint64_t *)&unk_100934630);
  uint64_t v26 = sub_100757560();
  sub_1001A4D0C(v26, a2);
  swift_release();
  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unsigned __int8 v28 = (void (*)())swift_allocObject();
  *((void *)v28 + 2) = v27;
  *((void *)v28 + 3) = a2;
  *((void *)v28 + 4) = a1;
  id v29 = (void (**)())&v8[OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction];
  uint64_t v30 = *(void *)&v8[OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction];
  *id v29 = sub_10073C570;
  v29[1] = v28;
  swift_retain();
  swift_retain();
  sub_10001A4D0(v30);
  return [v8 setNeedsLayout];
}

uint64_t sub_10073C1EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_100763FA0();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t result = sub_10002CA74(a2, (uint64_t)v25);
  if ((v25[32] & 1) == 0)
  {
    uint64_t v10 = *(void *)(v4 + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_lockupView);
    uint64_t v11 = OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_artworkView;
    id v12 = *(id *)(v10 + OBJC_IVAR____TtC22SubscribePageExtension14BaseLockupView_artworkView);
    v26.value.super.Class isa = 0;
    v26.is_nil = 0;
    sub_100758320(v26, v13);

    uint64_t v14 = *(void **)(v10 + v11);
    sub_100758360();
    sub_10073C57C((unint64_t *)&qword_100935020, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
    id v15 = v14;
    sub_1007591B0();

    uint64_t v16 = *(void *)(v4 + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventView);
    uint64_t v17 = OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView;
    sub_100526070(a3, 1, v18);
    sub_100757570();
    uint64_t v19 = sub_100763B50();
    swift_release();
    if (v19)
    {
      uint64_t v20 = qword_1009308B8;
      id v21 = *(id *)(v10 + v11);
      if (v20 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_10075BDE0();
      sub_10001076C(v22, (uint64_t)qword_100990E38);
      sub_10075BCB0();
      [v21 contentMode];
      sub_100763FF0();
      sub_100763FB0();
      sub_100758300();
      [v21 setContentMode:sub_100763E30()];
      sub_10075CD00();
      sub_100758340();
      if (!sub_100763E80())
      {
        sub_100010808();
        sub_1007682A0();
      }
      sub_1007581B0();
      id v23 = *(id *)(v10 + v11);
      sub_100759150();
      swift_release();

      swift_release();
    }
    uint64_t v24 = sub_100757560();
    sub_1000210E4(v24, a3, *(void *)(v16 + v17));
    return swift_release();
  }
  return result;
}

uint64_t sub_10073C4F0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10073C528()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10073C570()
{
  sub_10073B734(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10073C57C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10073C5C4(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v1 = sub_10000FB44(&qword_100934AC0);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_1007642D0();
  uint64_t v36 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (int64x2_t *)((char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10000FB44(&qword_100933C48);
  __chkstk_darwin(v7 - 8, v8);
  __chkstk_darwin(v9, v10);
  __chkstk_darwin(v11, v12);
  __chkstk_darwin(v13, v14);
  sub_10000FB44(&qword_100934AC8);
  uint64_t v35 = *(void *)(*(void *)(sub_100764200() - 8) + 72);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1007B9A60;
  uint64_t v31 = v15;
  if (qword_100932038 != -1) {
    swift_once();
  }
  double v16 = (double)v34;
  double v37 = (double)v34;
  sub_100023180();
  sub_100764290();
  double v37 = 15.0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  __asm { FMOV            V0.2D, #16.0 }
  *uint64_t v6 = _Q0;
  uint64_t v22 = *(void (**)(void))(v36 + 104);
  LODWORD(v34) = enum case for PageGrid.HorizontalMargins.absolute(_:);
  v36 += 104;
  uint64_t v33 = (void (*)(int64x2_t *, void, uint64_t))v22;
  v22(v6);
  CGFloat left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  LOBYTE(v37) = 0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  sub_1007641C0();
  uint64_t v32 = v3;
  if (qword_100932040 != -1) {
    swift_once();
  }
  double v37 = v16;
  sub_100764290();
  double v37 = 15.0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  __asm { FMOV            V0.2D, #20.0 }
  *uint64_t v6 = _Q0;
  v33(v6, v34, v32);
  LOBYTE(v37) = 0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  sub_1007641C0();
  if (qword_100932048 != -1) {
    swift_once();
  }
  double v37 = v16;
  sub_100764290();
  double v37 = 20.0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  int64x2_t v27 = vdupq_n_s64(0x4041000000000000uLL);
  *uint64_t v6 = v27;
  v33(v6, v34, v32);
  LOBYTE(v37) = 0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  CGFloat v29 = left;
  CGFloat top = UIEdgeInsetsZero.top;
  CGFloat v28 = bottom;
  sub_1007641C0();
  if (qword_100932068 != -1) {
    swift_once();
  }
  double v37 = v16;
  sub_100764290();
  double v37 = 20.0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  *uint64_t v6 = v27;
  v33(v6, v34, v32);
  sub_100767AD0();
  LOBYTE(v37) = 0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  sub_1007641C0();
  if (qword_100932070 != -1) {
    swift_once();
  }
  double v37 = v16;
  sub_100764290();
  double v37 = 24.0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  int64x2_t v27 = vdupq_n_s64(0x404A000000000000uLL);
  *uint64_t v6 = v27;
  v33(v6, v34, v32);
  LOBYTE(v37) = 0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  sub_1007641C0();
  if (qword_100932078 != -1) {
    swift_once();
  }
  double v37 = v16;
  sub_100764290();
  double v37 = 24.0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  *uint64_t v6 = v27;
  v33(v6, v34, v32);
  LOBYTE(v37) = 0;
  sub_100764290();
  double v37 = 0.0;
  sub_100764290();
  sub_1007641C0();
  return v31;
}

void sub_10073CF88(uint64_t a1)
{
}

void sub_10073CFA8(uint64_t a1)
{
}

void sub_10073CFC8(uint64_t a1, uint64_t (*a2)(void), void *a3)
{
  uint64_t v5 = self;
  sub_100010808();
  uint64_t v6 = (void *)a2();
  id v7 = [v5 _effectWithTintColor:v6];

  *a3 = v7;
}

id sub_10073D044()
{
  return sub_10073D0B0((SEL *)&selRef_didMoveToWindow);
}

id sub_10073D0A4()
{
  return sub_10073D0B0((SEL *)&selRef__dynamicUserInterfaceTraitDidChange);
}

id sub_10073D0B0(SEL *a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  objc_msgSendSuper2(&v8, *a1);
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension21PaletteBackgroundView_blurEffectOverride];
  if (!v3)
  {
    id v4 = [v1 traitCollection];
    id v5 = [v4 userInterfaceStyle];

    if (v5 == (id)2)
    {
      if (qword_1009327F0 != -1) {
        swift_once();
      }
      uint64_t v6 = &qword_100996250;
    }
    else
    {
      if (qword_1009327E8 != -1) {
        swift_once();
      }
      uint64_t v6 = &qword_100996248;
    }
    uint64_t v3 = *v6;
  }
  return [v1 setEffect:v3];
}

id sub_10073D2C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PaletteBackgroundView()
{
  return self;
}

uint64_t sub_10073D328(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = sub_1007560D0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  Swift::Bool v18 = (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = a2;
  *(unsigned char *)(v7 + 72) = a3;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(unsigned char *)(v7 + 96) = a6;
  sub_1007560C0();
  uint64_t v19 = sub_1007560A0();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  v24[1] = v19;
  v24[2] = v21;
  sub_1007688D0();
  long long v22 = v26;
  *(_OWORD *)(v7 + 16) = v25;
  *(_OWORD *)(v7 + 32) = v22;
  *(void *)(v7 + 48) = v27;
  return v7;
}

uint64_t sub_10073D478(void *a1)
{
  if (*(void *)v1 != *a1) {
    goto LABEL_10;
  }
  if ((sub_1007688B0() & 1) == 0) {
    goto LABEL_10;
  }
  type metadata accessor for BoolUserDefaultsDebugSetting();
  uint64_t v2 = swift_dynamicCastClass();
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  BOOL v4 = *(void *)(v2 + 56) == *(void *)(v1 + 56) && *(void *)(v2 + 64) == *(void *)(v1 + 64);
  if (v4 || (char v5 = sub_100768B50(), v6 = 0, (v5 & 1) != 0))
  {
    if (*(unsigned __int8 *)(v3 + 72) != *(unsigned __int8 *)(v1 + 72))
    {
LABEL_10:
      char v6 = 0;
      return v6 & 1;
    }
    if (*(void *)(v3 + 80) == *(void *)(v1 + 80) && *(void *)(v3 + 88) == *(void *)(v1 + 88)
      || (v8 = sub_100768B50(), char v6 = 0, (v8 & 1) != 0))
    {
      char v6 = *(unsigned char *)(v3 + 96) ^ *(unsigned char *)(v1 + 96) ^ 1;
    }
  }
  return v6 & 1;
}

void sub_10073D590()
{
  sub_1007688C0();
  swift_bridgeObjectRetain();
  sub_1007676C0();
  swift_bridgeObjectRelease();
  sub_100768C50(*(unsigned char *)(v0 + 72));
  swift_bridgeObjectRetain();
  sub_1007676C0();
  swift_bridgeObjectRelease();
  sub_100768C50(*(unsigned char *)(v0 + 96));
}

uint64_t sub_10073D624()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10073D654()
{
  sub_10001A544(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BoolUserDefaultsDebugSetting()
{
  return self;
}

uint64_t sub_10073D6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a2;
  uint64_t v2 = sub_10075C9C0();
  uint64_t v21 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  __chkstk_darwin(v2, v3);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1007635F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000FB44((uint64_t *)&unk_1009345C0);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10075B6A0();
  swift_release();
  swift_getKeyPath();
  sub_100766AA0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v10, v6) == enum case for Shelf.ContentType.todayCard(_:)
    && (sub_100764850(),
        sub_10073DE88((unint64_t *)&qword_10094D2C0, (void (*)(uint64_t))&type metadata accessor for TodayCard), (sub_10075B660() & 1) != 0))
  {
    type metadata accessor for TodayPageSectionGridTracker();
    sub_100766C00();
    sub_10075B640();
    uint64_t v16 = v23;
    char v17 = sub_1001390F8();
    uint64_t v18 = sub_10073DA84(v16, v17);
    swift_release();
    swift_release();
  }
  else
  {
    sub_10075B610();
    uint64_t v18 = sub_100631154();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v18;
}

uint64_t type metadata accessor for TodayShelfComponentTypeMappingProvider()
{
  return self;
}

uint64_t sub_10073DA84(uint64_t a1, char a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    swift_retain();
    sub_1007647F0();
    uint64_t v4 = sub_100759FC0();
    swift_release();
    switch(v4)
    {
      case 0:
      case 1:
      case 8:
        swift_release();
        uint64_t v2 = type metadata accessor for StoryCardCollectionViewCell();
        char v5 = (unint64_t *)&unk_1009498A0;
        uint64_t v6 = type metadata accessor for StoryCardCollectionViewCell;
        goto LABEL_29;
      case 2:
        if (a2 == 4)
        {
          sub_1007647F0();
          sub_10075CA50();
          if (swift_dynamicCastClass())
          {
            char v16 = sub_10075CA10();
            swift_release();
            swift_release();
            if (v16)
            {
              uint64_t v2 = type metadata accessor for ListTodayCardCollectionViewCell();
              char v5 = (unint64_t *)&unk_10093ADF0;
              uint64_t v6 = type metadata accessor for ListTodayCardCollectionViewCell;
              goto LABEL_29;
            }
          }
          else
          {
            swift_release();
            swift_release();
          }
LABEL_27:
          uint64_t v15 = type metadata accessor for MultiAppFallbackCardCollectionViewCell();
        }
        else
        {
          swift_release();
          uint64_t v15 = type metadata accessor for ListTodayCardCollectionViewCell();
        }
LABEL_28:
        uint64_t v2 = v15;
        char v5 = (unint64_t *)&unk_1009534B0;
        uint64_t v6 = type metadata accessor for BaseTodayCardCollectionViewCell;
        goto LABEL_29;
      case 3:
      case 6:
        swift_release();
        uint64_t v2 = type metadata accessor for MultiAppFallbackCardCollectionViewCell();
        char v5 = (unint64_t *)&unk_100949898;
        uint64_t v6 = type metadata accessor for MultiAppFallbackCardCollectionViewCell;
        goto LABEL_29;
      case 4:
        swift_release();
        uint64_t v2 = type metadata accessor for InAppPurchaseTodayCardCollectionViewCell();
        char v5 = (unint64_t *)&unk_1009498B8;
        uint64_t v6 = type metadata accessor for InAppPurchaseTodayCardCollectionViewCell;
        goto LABEL_29;
      case 5:
        swift_release();
        if (a2 == 4) {
          goto LABEL_27;
        }
        uint64_t v15 = type metadata accessor for RiverTodayCardCollectionViewCell();
        goto LABEL_28;
      case 7:
        swift_release();
        uint64_t v2 = type metadata accessor for GridTodayCardCollectionViewCell();
        char v5 = (unint64_t *)&unk_1009498A8;
        uint64_t v6 = type metadata accessor for GridTodayCardCollectionViewCell;
        goto LABEL_29;
      case 10:
        swift_release();
        uint64_t v2 = type metadata accessor for AppEventTodayCardCollectionViewCell();
        char v5 = (unint64_t *)&unk_100949890;
        uint64_t v6 = type metadata accessor for AppEventTodayCardCollectionViewCell;
        goto LABEL_29;
      case 11:
        swift_release();
        uint64_t v2 = type metadata accessor for CondensedAdLockupWithIconBackgroundViewTodayCardCollectionViewCell();
        char v5 = (unint64_t *)&unk_100949888;
        uint64_t v6 = type metadata accessor for CondensedAdLockupWithIconBackgroundViewTodayCardCollectionViewCell;
        goto LABEL_29;
      case 12:
        id v7 = (id)ASKDeviceTypeGetCurrent();
        uint64_t v8 = sub_1007675F0();
        uint64_t v10 = v9;
        if (v8 == sub_1007675F0() && v10 == v11)
        {

          swift_release();
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v13 = sub_100768B50();

          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v13 & 1) == 0)
          {
            uint64_t v14 = type metadata accessor for MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell();
            goto LABEL_24;
          }
        }
        uint64_t v14 = type metadata accessor for IPadMediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell();
LABEL_24:
        uint64_t v2 = v14;
        char v5 = (unint64_t *)&unk_100949880;
        uint64_t v6 = type metadata accessor for MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell;
LABEL_29:
        sub_10073DE88(v5, (void (*)(uint64_t))v6);
        break;
      default:
        sub_100768A40();
        __break(1u);
        JUMPOUT(0x10073DE54);
    }
  }
  return v2;
}

uint64_t sub_10073DE88(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10073DED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);

  return v3;
}

void *sub_10073DF14()
{
  uint64_t v1 = v0;
  uint64_t v34 = sub_100756440();
  uint64_t v2 = *(void *)(v34 - 8);
  *(void *)&double v4 = __chkstk_darwin(v34, v3).n128_u64[0];
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v1, "collectionView", v4);
  if (v7)
  {
    uint64_t v8 = v7;
    [v7 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = 0.0;
    double v12 = 0.0;
    double v14 = 0.0;
    double v16 = 0.0;
  }
  id v17 = objc_msgSend(v1, "layoutAttributesForElementsInRect:", v10, v12, v14, v16);
  if (!v17) {
    return &_swiftEmptySetSingleton;
  }
  uint64_t v18 = v17;
  sub_1000F5604();
  unint64_t v19 = sub_100767800();

  if (!(v19 >> 62))
  {
    uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v20) {
      goto LABEL_7;
    }
LABEL_22:
    uint64_t v24 = _swiftEmptyArrayStorage;
LABEL_23:
    swift_bridgeObjectRelease_n();
    uint64_t v32 = sub_1004FCFD8((uint64_t)v24);
    swift_bridgeObjectRelease();
    return (void *)v32;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_100768A60();
  uint64_t v20 = (uint64_t)result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_7:
  if (v20 >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v24 = _swiftEmptyArrayStorage;
    long long v25 = &selRef_systemFontOfSize_;
    do
    {
      if ((v19 & 0xC000000000000001) != 0) {
        id v26 = (id)sub_100768950();
      }
      else {
        id v26 = *(id *)(v19 + 8 * v22 + 32);
      }
      uint64_t v27 = v26;
      if ([v26 v25[442]])
      {
      }
      else
      {
        id v28 = [v27 indexPath];
        sub_100756380();

        uint64_t v29 = sub_1007563D0();
        (*v23)(v6, v34);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v24 = sub_100269658(0, v24[2] + 1, 1, v24);
        }
        unint64_t v31 = v24[2];
        unint64_t v30 = v24[3];
        if (v31 >= v30 >> 1) {
          uint64_t v24 = sub_100269658((void *)(v30 > 1), v31 + 1, 1, v24);
        }
        v24[2] = v31 + 1;
        v24[v31 + 4] = v29;
        long long v25 = &selRef_systemFontOfSize_;
      }
      ++v22;
    }
    while (v20 != v22);
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

char *sub_10073E220(void *a1)
{
  id v26 = a1;
  uint64_t v2 = sub_100756440();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding];
  swift_bridgeObjectRetain();
  id v8 = [v26 indexPath];
  sub_100756380();

  LOBYTE(v8) = sub_1002BB43C((uint64_t)v6, v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  if (v8)
  {
    id v9 = [v1 collectionView];
    if (v9)
    {
      double v10 = v9;
      type metadata accessor for BaseCollectionViewLayoutAttributes();
      uint64_t v11 = swift_dynamicCastClass();
      if (v11)
      {
        double v12 = (char *)v11;
        id v13 = v26;
        [v10 contentOffset];
        double v15 = -v14;
        if ([v10 edgesInsettingLayoutMarginsFromSafeArea])
        {
          [v10 safeAreaInsets];
          double v15 = v15 - v16;
        }
        if (v15 < 0.0) {
          double v17 = 0.0;
        }
        else {
          double v17 = v15;
        }
        *(double *)&v12[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance] = v17;
        id v18 = v13;
        [v12 frame];
        objc_msgSend(v12, "setFrame:");

        id v19 = v18;
        [v12 frame];
        objc_msgSend(v12, "setFrame:");

        v12[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding] = v15 > 0.0;
        if (v15 < 0.0)
        {
          [v10 contentOffset];
          double v21 = v20;

          double v22 = v21 * 0.28;
          if (v21 * 0.28 < 0.0) {
            double v22 = 0.0;
          }
          *(double *)&v12[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY] = v22;
        }
        else
        {

          *(void *)&v12[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY] = 0;
        }
        return v12;
      }
    }
  }
  id v23 = v26;

  return (char *)v23;
}

_OWORD *sub_10073E4E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = (objc_class *)type metadata accessor for BaseCollectionViewLayoutAttributes();
  v9.receiver = v2;
  v9.super_class = v5;
  objc_msgSendSuper2(&v9, "copyWithZone:", a1);
  sub_100768710();
  swift_unknownObjectRelease();
  sub_10000FBDC((uint64_t)v10, (uint64_t)v8);
  if (!swift_dynamicCast()) {
    return sub_10003BFE4(v10, (_OWORD *)a2);
  }
  *(void *)(v7 + OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY) = *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY];
  *(void *)(v7 + OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance) = *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance];
  *(unsigned char *)(v7 + OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding) = v2[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding];
  *(void *)(a2 + 24) = v5;
  *(void *)a2 = v7;
  return (_OWORD *)_s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v10);
}

BOOL sub_10073E638(uint64_t a1)
{
  sub_10016D210(a1, (uint64_t)v18);
  uint64_t v3 = v19;
  if (v19)
  {
    uint64_t v4 = sub_10000FE94(v18, v19);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = __chkstk_darwin(v4, v4);
    id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    uint64_t v9 = sub_100768B30();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v18);
  }
  else
  {
    uint64_t v9 = 0;
  }
  double v10 = (objc_class *)type metadata accessor for BaseCollectionViewLayoutAttributes();
  v17.receiver = v1;
  v17.super_class = v10;
  unsigned int v11 = objc_msgSendSuper2(&v17, "isEqual:", v9);
  swift_unknownObjectRelease();
  if (!v11) {
    return 0;
  }
  sub_10016D210(a1, (uint64_t)v18);
  if (!v19)
  {
    sub_1000126F4((uint64_t)v18);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (*(double *)&v1[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY] != *(double *)&v16[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_parallaxY]
    || v1[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding] != v16[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_isRubberbanding])
  {

    return 0;
  }
  double v13 = *(double *)&v1[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance];
  double v14 = *(double *)&v16[OBJC_IVAR____TtC22SubscribePageExtension34BaseCollectionViewLayoutAttributes_rubberbandingDistance];

  return v13 == v14;
}

id sub_10073E914()
{
  return sub_10073FA1C(type metadata accessor for BaseCollectionViewLayoutAttributes);
}

uint64_t type metadata accessor for BaseCollectionViewLayoutAttributes()
{
  return self;
}

id sub_10073E978(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding] = &_swiftEmptySetSingleton;
  uint64_t v5 = &v3[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1002CAA14;
  aBlock[3] = &unk_10088FC68;
  __n128 v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v44.receiver = v3;
  v44.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
  id v7 = objc_msgSendSuper2(&v44, "initWithSectionProvider:configuration:", v6, a3);
  _Block_release(v6);
  type metadata accessor for GradientSectionBackgroundView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = v7;
  sub_100767EE0();
  NSString v10 = sub_1007675C0();
  swift_bridgeObjectRelease();
  [v9 registerClass:ObjCClassFromMetadata forDecorationViewOfKind:v10];

  type metadata accessor for MaterialGradientSectionBackgroundView();
  uint64_t v11 = swift_getObjCClassFromMetadata();
  id v12 = v9;
  sub_100767EE0();
  NSString v13 = sub_1007675C0();
  swift_bridgeObjectRelease();
  [v12 registerClass:v11 forDecorationViewOfKind:v13];

  type metadata accessor for ArtworkSectionBackgroundView();
  uint64_t v14 = swift_getObjCClassFromMetadata();
  id v15 = v12;
  sub_100767EE0();
  NSString v16 = sub_1007675C0();
  swift_bridgeObjectRelease();
  [v15 registerClass:v14 forDecorationViewOfKind:v16];

  type metadata accessor for InteractiveSectionBackgroundView();
  uint64_t v17 = swift_getObjCClassFromMetadata();
  id v18 = v15;
  sub_100767EE0();
  NSString v19 = sub_1007675C0();
  swift_bridgeObjectRelease();
  [v18 registerClass:v17 forDecorationViewOfKind:v19];

  type metadata accessor for EditorsChoiceBackgroundView();
  uint64_t v20 = swift_getObjCClassFromMetadata();
  id v21 = v18;
  sub_100767EE0();
  NSString v22 = sub_1007675C0();
  swift_bridgeObjectRelease();
  [v21 registerClass:v20 forDecorationViewOfKind:v22];

  id v23 = (id)ASKBuildTypeGetCurrent();
  uint64_t v24 = sub_1007675F0();
  uint64_t v26 = v25;
  if (v24 != sub_1007675F0() || v26 != v27)
  {
    char v28 = sub_100768B50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_8;
    }
    uint64_t v29 = sub_1007675F0();
    uint64_t v31 = v30;
    if (v29 != sub_1007675F0() || v31 != v32)
    {
      char v33 = sub_100768B50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v33) {
        goto LABEL_8;
      }
      uint64_t v38 = sub_1007675F0();
      uint64_t v40 = v39;
      if (v38 == sub_1007675F0() && v40 == v41)
      {

        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v42 = sub_100768B50();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v42 & 1) == 0) {
          goto LABEL_19;
        }
      }
      sub_100766D60();
      sub_100766D30();
      if (qword_100932858 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_10000FB44(&qword_10095AEF0);
      sub_10001076C(v43, (uint64_t)qword_1009964A8);
      sub_100766A20();
      swift_release();
      if (LOBYTE(aBlock[0]) != 2 && (aBlock[0] & 1) != 0) {
        goto LABEL_9;
      }
LABEL_19:

      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_8:

LABEL_9:
  type metadata accessor for TodayDebugSectionBackgroundView();
  uint64_t v34 = swift_getObjCClassFromMetadata();
  id v35 = v21;
  sub_100767EE0();
  NSString v36 = sub_1007675C0();
  swift_bridgeObjectRelease();
  [v35 registerClass:v34 forDecorationViewOfKind:v36];

LABEL_10:
  swift_release();

  return v21;
}

char *sub_10073F210(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v7 = sub_100756440();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007675F0();
  sub_100756380();
  id v12 = a1;
  NSString v13 = sub_1007675C0();
  Class isa = sub_100756340().super.isa;
  id v15 = (objc_class *)type metadata accessor for BaseCollectionCompositionalLayout();
  v19.receiver = v12;
  v19.super_class = v15;
  NSString v16 = (char *)objc_msgSendSuper2(&v19, *a5, v13, isa);

  if (v16)
  {
    uint64_t v17 = v16;
    NSString v16 = sub_10073E220(v17);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v16;
}

uint64_t sub_10073F45C(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  id v10 = [v4 collectionView];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding;
    *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding] = &_swiftEmptySetSingleton;
    swift_bridgeObjectRelease();
    id v13 = [v11 delegate];
    if (v13)
    {
      id v14 = v13;
      swift_getObjectType();
      uint64_t v15 = swift_conformsToProtocol2();
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      if (v15) {
        id v17 = v14;
      }
      else {
        id v17 = 0;
      }
      if (v17)
      {
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v19 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 8))(v11, ObjectType, v16);
        id v20 = v11;
        uint64_t v21 = sub_1007402F4(v19, v20);

        *(void *)&v5[v12] = v21;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    id v23 = [v5 collectionView];
    if (v23)
    {
      uint64_t v24 = v23;
      [v23 bounds];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      if (v28 != a3) {
        goto LABEL_24;
      }
    }
    else
    {
      double v26 = 0.0;
      double v30 = 0.0;
      if (a3 != 0.0)
      {
LABEL_24:

        return 1;
      }
    }
    if (v30 != a4) {
      goto LABEL_24;
    }
    if (*(void *)(*(void *)&v5[v12] + 16) && v26 != a2) {
      goto LABEL_24;
    }
    v33.receiver = v5;
    v33.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
    id v22 = objc_msgSendSuper2(&v33, "shouldInvalidateLayoutForBoundsChange:", a1, a2, a3, a4);
  }
  else
  {
    v34.receiver = v4;
    v34.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
    return (uint64_t)objc_msgSendSuper2(&v34, "shouldInvalidateLayoutForBoundsChange:", a1, a2, a3, a4);
  }
  return (uint64_t)v22;
}

id sub_10073F70C(double a1, double a2, double a3, double a4)
{
  id v9 = [v4 collectionView];
  if (v9)
  {
    id v10 = v9;
    [v9 bounds];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = 0.0;
    double v14 = 0.0;
  }
  BOOL v15 = v12 == a3 && v14 == a4;
  if (v15
    && *(void *)(*(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension33BaseCollectionCompositionalLayout_indexPathsRequiringRubberbanding]
                 + 16))
  {
    id v16 = [objc_allocWithZone((Class)UICollectionViewLayoutInvalidationContext) init];
    uint64_t v17 = swift_bridgeObjectRetain();
    sub_1006578CC(v17);
    swift_bridgeObjectRelease();
    sub_100756440();
    Class isa = sub_1007677F0().super.isa;
    swift_release();
    [v16 invalidateItemsAtIndexPaths:isa];

    return v16;
  }
  else
  {
    v21.receiver = v4;
    v21.super_class = (Class)type metadata accessor for BaseCollectionCompositionalLayout();
    id v20 = objc_msgSendSuper2(&v21, "invalidationContextForBoundsChange:", a1, a2, a3, a4);
    return v20;
  }
}

id sub_10073FA04()
{
  return sub_10073FA1C(type metadata accessor for BaseCollectionCompositionalLayout);
}

id sub_10073FA1C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for BaseCollectionCompositionalLayout()
{
  return self;
}

uint64_t sub_10073FAC8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v35 = a1;
  uint64_t v7 = sub_100756440();
  uint64_t v38 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  id v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  sub_10000FB44(&qword_10093CAD0);
  uint64_t result = sub_100768910();
  uint64_t v11 = result;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = *v35;
  }
  uint64_t v14 = 0;
  uint64_t v15 = result + 56;
  NSString v36 = (uint64_t (**)(unint64_t, char *, uint64_t))(v38 + 32);
  uint64_t v37 = v38 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v14 << 6);
    }
    else
    {
      uint64_t v18 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_40;
      }
      if (v18 >= v34)
      {
LABEL_37:
        swift_release();
        return v11;
      }
      unint64_t v19 = v35[v18];
      ++v14;
      if (!v19)
      {
        uint64_t v14 = v18 + 1;
        if (v18 + 1 >= v34) {
          goto LABEL_37;
        }
        unint64_t v19 = v35[v14];
        if (!v19)
        {
          uint64_t v14 = v18 + 2;
          if (v18 + 2 >= v34) {
            goto LABEL_37;
          }
          unint64_t v19 = v35[v14];
          if (!v19)
          {
            uint64_t v20 = v18 + 3;
            if (v20 >= v34) {
              goto LABEL_37;
            }
            unint64_t v19 = v35[v20];
            if (!v19)
            {
              while (1)
              {
                uint64_t v14 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v14 >= v34) {
                  goto LABEL_37;
                }
                unint64_t v19 = v35[v14];
                ++v20;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v14 = v20;
          }
        }
      }
LABEL_24:
      unint64_t v13 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
    }
    uint64_t v21 = a4;
    uint64_t v22 = *(void *)(a4 + 48);
    uint64_t v23 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v10, v22 + v23 * v17, v7);
    sub_1007404A8();
    uint64_t result = sub_1007674F0();
    uint64_t v24 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v15 + 8 * v26);
      }
      while (v31 == -1);
      unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
    }
    *(void *)(v15 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t result = (*v36)(*(void *)(v11 + 48) + v27 * v23, v10, v7);
    ++*(void *)(v11 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v21;
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

double *sub_10073FE24(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (double *)sub_1007689A0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100768950();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      __n128 v6 = v5;
      ++v4;
      sub_10073E220(v5);

      sub_100768980();
      sub_1007689B0();
      sub_1007689C0();
      sub_100768990();
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100768A60();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10073FF60(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v44 = a2;
  id v55 = a4;
  CGRect v45 = a1;
  uint64_t v5 = sub_100756440();
  __chkstk_darwin(v5, v6);
  id v52 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v11 = __chkstk_darwin(v8, v9);
  unint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = 0;
  int64_t v15 = 0;
  uint64_t v53 = v10;
  uint64_t v54 = a3;
  uint64_t v18 = *(void *)(a3 + 56);
  uint64_t v17 = a3 + 56;
  uint64_t v16 = v18;
  uint64_t v19 = 1 << *(unsigned char *)(v17 - 24);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v16;
  uint64_t v47 = v17;
  int64_t v48 = (unint64_t)(v19 + 63) >> 6;
  id v50 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v51 = v10 + 16;
LABEL_4:
  uint64_t v46 = v14;
  while (v21)
  {
    unint64_t v23 = __clz(__rbit64(v21));
    v21 &= v21 - 1;
    int64_t v56 = v15;
    unint64_t v24 = v23 | (v15 << 6);
    unint64_t v25 = v55;
LABEL_19:
    uint64_t v30 = *(void *)(v54 + 48);
    uint64_t v31 = *(void *)(v53 + 72);
    unint64_t v49 = v24;
    uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t, __n128))(v53 + 16);
    v32(v13, v30 + v31 * v24, v5, v11);
    id v33 = [v25 numberOfSections];
    uint64_t v34 = v5;
    uint64_t v35 = sub_1007563D0();
    NSString v36 = v52;
    ((void (*)(char *, char *, uint64_t))v32)(v52, v13, v34);
    if (v35 >= (uint64_t)v33)
    {
      uint64_t v22 = *v50;
      (*v50)(v36, v34);
      v22(v13, v34);
      uint64_t v5 = v34;
      int64_t v15 = v56;
    }
    else
    {
      id v37 = [v25 numberOfItemsInSection:sub_1007563D0()];
      uint64_t v38 = sub_1007563C0();
      uint64_t v39 = *v50;
      (*v50)(v36, v34);
      v39(v13, v34);
      uint64_t v5 = v34;
      int64_t v15 = v56;
      if (v38 < (uint64_t)v37)
      {
        uint64_t v40 = v46;
        *(unint64_t *)((char *)v45 + ((v49 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v49;
        BOOL v26 = __OFADD__(v40, 1);
        uint64_t v14 = v40 + 1;
        if (!v26) {
          goto LABEL_4;
        }
        __break(1u);
LABEL_29:
        uint64_t v41 = v44;
        uint64_t v42 = v54;
        swift_retain();
        sub_10073FAC8(v45, v41, v46, v42);
        return;
      }
    }
  }
  BOOL v26 = __OFADD__(v15, 1);
  int64_t v27 = v15 + 1;
  unint64_t v25 = v55;
  if (v26)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v27 >= v48) {
    goto LABEL_29;
  }
  unint64_t v28 = *(void *)(v47 + 8 * v27);
  if (v28)
  {
LABEL_18:
    unint64_t v21 = (v28 - 1) & v28;
    int64_t v56 = v27;
    unint64_t v24 = __clz(__rbit64(v28)) + (v27 << 6);
    goto LABEL_19;
  }
  int64_t v29 = v27 + 1;
  if (v27 + 1 >= v48) {
    goto LABEL_29;
  }
  unint64_t v28 = *(void *)(v47 + 8 * v29);
  if (v28) {
    goto LABEL_17;
  }
  int64_t v29 = v27 + 2;
  if (v27 + 2 >= v48) {
    goto LABEL_29;
  }
  unint64_t v28 = *(void *)(v47 + 8 * v29);
  if (v28) {
    goto LABEL_17;
  }
  int64_t v29 = v27 + 3;
  if (v27 + 3 >= v48) {
    goto LABEL_29;
  }
  unint64_t v28 = *(void *)(v47 + 8 * v29);
  if (v28)
  {
LABEL_17:
    int64_t v27 = v29;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v27 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v27 >= v48) {
      goto LABEL_29;
    }
    unint64_t v28 = *(void *)(v47 + 8 * v27);
    ++v29;
    if (v28) {
      goto LABEL_18;
    }
  }
LABEL_31:
  __break(1u);
}

uint64_t sub_1007402F4(uint64_t a1, void *a2)
{
  char v4 = *(unsigned char *)(a1 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (unint64_t)((1 << v4) + 63) >> 6;
  uint64_t isStackAllocationSafe = a2;
  uint64_t v9 = (void *)isStackAllocationSafe;
  if (v5 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, v8);
    uint64_t v10 = (char *)&v18 - ((8 * v6 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v10, 8 * v6);
    id v11 = v9;
    sub_10073FF60((unint64_t *)v10, v6, a1, v11);
    uint64_t v13 = v12;
    swift_release();

    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v14 = (void *)swift_slowAlloc();
    bzero(v14, 8 * v6);
    id v15 = v9;
    sub_10073FF60((unint64_t *)v14, v6, a1, v15);
    uint64_t v13 = v16;
    swift_release();

    swift_slowDealloc();
  }
  return v13;
}

unint64_t sub_1007404A8()
{
  unint64_t result = qword_10095AE80;
  if (!qword_10095AE80)
  {
    sub_100756440();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10095AE80);
  }
  return result;
}

uint64_t sub_100740500()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

id sub_100740538()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();

  return v1;
}

uint64_t sub_100740578(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100740588()
{
  return swift_release();
}

uint64_t sub_100740590(void *a1)
{
  if (*v1 != *a1) {
    goto LABEL_23;
  }
  uint64_t v2 = v1;
  if ((sub_1007688B0() & 1) == 0) {
    goto LABEL_23;
  }
  type metadata accessor for NavigationActionDebugSetting();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3) {
    goto LABEL_23;
  }
  uint64_t v4 = v3;
  if (*(void *)(v3 + 56) != v2[7] || *(void *)(v3 + 64) != v2[8])
  {
    char v6 = 0;
    if ((sub_100768B50() & 1) == 0) {
      return v6 & 1;
    }
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 72);
  if (!v7)
  {
    uint64_t v17 = (void (*)(uint64_t))v2[9];
    uint64_t v18 = swift_retain();
    if (v17)
    {
      v17(v18);
      uint64_t v16 = v19;
LABEL_18:
      swift_release();
      if (v16) {
        goto LABEL_22;
      }
LABEL_26:
      char v6 = 1;
      return v6 & 1;
    }
LABEL_25:
    swift_release();
    goto LABEL_26;
  }
  uint64_t v8 = swift_retain();
  uint64_t v9 = v7(v8);
  uint64_t v11 = v10;
  uint64_t v12 = (uint64_t (*)(void))v2[9];
  if (!v12)
  {
    if (v10) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  uint64_t v13 = v9;
  uint64_t v14 = v12();
  uint64_t v16 = v15;
  if (!v11) {
    goto LABEL_18;
  }
  if (!v15)
  {
LABEL_21:
    swift_release();
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    char v6 = 0;
    return v6 & 1;
  }
  if (v13 == v14 && v11 == v15) {
    char v6 = 1;
  }
  else {
    char v6 = sub_100768B50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

uint64_t type metadata accessor for NavigationActionDebugSetting()
{
  return self;
}

uint64_t sub_100740780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = sub_1007560D0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = a2;
  *(void *)(v7 + 72) = a3;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(void *)(v7 + 96) = a6;
  sub_10001A4E0(a3);
  swift_retain();
  sub_1007560C0();
  uint64_t v19 = sub_1007560A0();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  v24[1] = v19;
  v24[2] = v21;
  sub_1007688D0();
  long long v22 = v26;
  *(_OWORD *)(v7 + 16) = v25;
  *(_OWORD *)(v7 + 32) = v22;
  *(void *)(v7 + 48) = v27;
  return v7;
}

uint64_t sub_1007408E0()
{
  uint64_t v0 = sub_1007649A0();
  uint64_t v1 = *(void **)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1009318D0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100764BD0();
  uint64_t v6 = sub_10001076C(v5, (uint64_t)qword_1009941A0);
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v9 = v7 + 16;
  v8(v4, v6, v5);
  uint64_t v10 = enum case for FontSource.useCase(_:);
  uint64_t v11 = v1 + 13;
  int64_t v29 = (void (*)(char *, void, uint64_t))v1[13];
  v29(v4, enum case for FontSource.useCase(_:), v0);
  uint64_t v28 = sub_100765180();
  uint64_t v38 = v28;
  uint64_t v39 = &protocol witness table for StaticDimension;
  sub_1000107A4((uint64_t *)&v37);
  uint64_t v35 = v0;
  NSString v36 = &protocol witness table for FontSource;
  uint64_t v12 = sub_1000107A4((uint64_t *)&v34);
  uint64_t v27 = (void (*)(uint64_t *, char *, uint64_t))v1[2];
  v27(v12, v4, v0);
  sub_100765190();
  uint64_t v13 = (void (*)(char *, uint64_t))v1[1];
  long long v25 = v1 + 1;
  long long v26 = v13;
  v13(v4, v0);
  if (qword_1009318E0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10001076C(v5, (uint64_t)qword_1009941D0);
  v22[0] = v8;
  v22[1] = v9;
  v8(v4, v14, v5);
  uint64_t v15 = v29;
  v29(v4, v10, v0);
  unint64_t v24 = v11;
  uint64_t v16 = v28;
  uint64_t v35 = v28;
  NSString v36 = &protocol witness table for StaticDimension;
  sub_1000107A4((uint64_t *)&v34);
  unsigned int v23 = v10;
  uint64_t v32 = v0;
  id v33 = &protocol witness table for FontSource;
  uint64_t v17 = sub_1000107A4((uint64_t *)&v31);
  uint64_t v18 = v27;
  v27(v17, v4, v0);
  sub_100765190();
  uint64_t v19 = v26;
  v26(v4, v0);
  ((void (*)(char *, uint64_t, uint64_t))v22[0])(v4, v14, v5);
  v15(v4, v23, v0);
  uint64_t v32 = v16;
  id v33 = &protocol witness table for StaticDimension;
  sub_1000107A4((uint64_t *)&v31);
  v30[3] = v0;
  v30[4] = (uint64_t)&protocol witness table for FontSource;
  uint64_t v20 = sub_1000107A4(v30);
  v18(v20, v4, v0);
  sub_100765190();
  v19(v4, v0);
  qword_100996300 = (uint64_t)&type metadata for Double;
  unk_100996308 = &protocol witness table for Double;
  qword_1009962E8 = 0x4028000000000000;
  xmmword_100996260 = (__int128)vdupq_n_s64(0x4064000000000000uLL);
  sub_10000FCD0(&v37, (uint64_t)&unk_100996270);
  sub_10000FCD0(&v34, (uint64_t)&unk_100996298);
  uint64_t result = sub_10000FCD0(&v31, (uint64_t)&unk_1009962C0);
  byte_100996310 = 1;
  return result;
}

char *sub_100740D20(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_10000FB44(&qword_100943570);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v76 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100758520();
  uint64_t v74 = *(void *)(v12 - 8);
  uint64_t v75 = v12;
  __chkstk_darwin(v12, v13);
  uint64_t v73 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10075F7F0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000FB44((uint64_t *)&unk_100933F40);
  __chkstk_darwin(v20 - 8, v21);
  unsigned int v23 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v24 = &v4[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext];
  uint64_t v25 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
  uint64_t v26 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_preferredArtworkSize;
  uint64_t v27 = qword_1009327F8;
  uint64_t v28 = v4;
  if (v27 != -1) {
    swift_once();
  }
  int64_t v29 = v19;
  *(_OWORD *)&v4[v26] = xmmword_100996260;
  uint64_t v71 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias;
  double v72 = v28;
  if (qword_1009318D0 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100764BD0();
  uint64_t v31 = sub_10001076C(v30, (uint64_t)qword_1009941A0);
  uint64_t v32 = *(void *)(v30 - 8);
  double v70 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
  v70(v23, v31, v30);
  uint64_t v69 = *(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56);
  v69(v23, 0, 1, v30);
  id v33 = *(void (**)(void))(v16 + 104);
  long long v34 = v29;
  unsigned int v68 = enum case for DirectionalTextAlignment.none(_:);
  uint64_t v67 = (void (*)(char *, void, uint64_t))v33;
  v33(v29);
  uint64_t v35 = (objc_class *)sub_10075AA00();
  id v36 = objc_allocWithZone(v35);
  uint64_t v37 = sub_10075A9F0();
  uint64_t v38 = v72;
  *(void *)&v72[v71] = v37;
  uint64_t v71 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName;
  if (qword_1009318E0 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_10001076C(v30, (uint64_t)qword_1009941D0);
  v70(v23, v39, v30);
  v69(v23, 0, 1, v30);
  v67(v34, v68, v15);
  id v40 = objc_allocWithZone(v35);
  *(void *)&v38[v71] = sub_10075A9F0();
  *(void *)&v38[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView] = objc_msgSend(objc_allocWithZone((Class)sub_100758360()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  uint64_t v41 = (objc_class *)type metadata accessor for LargeGameCenterPlayerCollectionViewCell();
  v77.receiver = v38;
  v77.super_class = v41;
  uint64_t v42 = (char *)objc_msgSendSuper2(&v77, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v43 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView;
  uint64_t v44 = *(void **)&v42[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView];
  sub_100010808();
  CGRect v45 = v42;
  id v46 = v44;
  sub_1007682A0();
  sub_1007581B0();

  id v47 = *(id *)&v42[v43];
  int64_t v48 = v73;
  sub_10075BBE0();
  sub_100758350();

  (*(void (**)(char *, uint64_t))(v74 + 8))(v48, v75);
  uint64_t v49 = qword_100930878;
  id v50 = *(id *)&v42[v43];
  if (v49 != -1) {
    swift_once();
  }
  uint64_t v51 = sub_100763D10();
  uint64_t v52 = sub_10001076C(v51, (uint64_t)qword_100990D80);
  uint64_t v53 = *(void *)(v51 - 8);
  uint64_t v54 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v76, v52, v51);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v54, 0, 1, v51);
  sub_100758310();

  id v55 = [v45 contentView];
  [v55 addSubview:*(void *)&v42[v43]];

  uint64_t v56 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias;
  id v57 = *(id *)&v45[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias];
  sub_1007683C0();

  id v58 = *(void **)&v45[v56];
  [v58 setNumberOfLines:1];
  id v59 = [v45 contentView];
  [v59 addSubview:v58];

  uint64_t v60 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName;
  id v61 = *(id *)&v45[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName];
  id v62 = (void *)sub_100768250();
  [v61 setTextColor:v62];

  id v63 = *(void **)&v45[v60];
  [v63 setNumberOfLines:1];
  id v64 = [v45 contentView];
  id v65 = v63;
  [v64 addSubview:v65];

  return v45;
}

uint64_t sub_1007414E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1007649F0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (objc_class *)type metadata accessor for LargeGameCenterPlayerCollectionViewCell();
  v25.receiver = v0;
  v25.super_class = v7;
  objc_msgSendSuper2(&v25, "layoutSubviews");
  if (qword_1009327F8 != -1) {
    swift_once();
  }
  sub_100266B7C((uint64_t)&xmmword_100996260, (uint64_t)v19);
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView];
  v19[26] = sub_100758360();
  v19[27] = &protocol witness table for UIView;
  v19[23] = v8;
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias];
  uint64_t v20 = sub_10075AA00();
  uint64_t v21 = &protocol witness table for UILabel;
  v19[28] = v9;
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName];
  uint64_t v23 = v20;
  unint64_t v24 = &protocol witness table for UILabel;
  uint64_t v22 = v10;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [v1 bounds];
  LargeGameCenterPlayerLayout.placeChildren(relativeTo:in:)((uint64_t)v1, (uint64_t)v6, v14, v15, v16, v17);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return sub_100741A14((uint64_t)v19);
}

id sub_1007416F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LargeGameCenterPlayerCollectionViewCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100741798()
{
  return type metadata accessor for LargeGameCenterPlayerCollectionViewCell();
}

uint64_t type metadata accessor for LargeGameCenterPlayerCollectionViewCell()
{
  uint64_t result = qword_10095AFF8;
  if (!qword_10095AFF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1007417EC()
{
  sub_10001A3E4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

id sub_100741898()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView));
}

double sub_1007418A8()
{
  return *(double *)(v0
                   + OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_preferredArtworkSize);
}

void sub_1007418BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  sub_1001553A0(a1, a2, a3, WitnessTable);
}

void sub_100741928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  sub_10015565C(a1, a2, a3, WitnessTable);
}

unint64_t sub_100741994(uint64_t a1)
{
  unint64_t result = sub_1007419BC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1007419BC()
{
  unint64_t result = qword_10095B008;
  if (!qword_10095B008)
  {
    type metadata accessor for LargeGameCenterPlayerCollectionViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10095B008);
  }
  return result;
}

uint64_t sub_100741A14(uint64_t a1)
{
  return a1;
}

void sub_100741A68()
{
  uint64_t v1 = sub_10075F7F0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v30 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000FB44((uint64_t *)&unk_100933F40);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v0;
  uint64_t v9 = &v0[OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext];
  uint64_t v10 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_preferredArtworkSize;
  if (qword_1009327F8 != -1) {
    swift_once();
  }
  *(_OWORD *)&v31[v11] = xmmword_100996260;
  uint64_t v27 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_alias;
  if (qword_1009318D0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100764BD0();
  uint64_t v13 = sub_10001076C(v12, (uint64_t)qword_1009941A0);
  uint64_t v14 = *(void *)(v12 - 8);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v26(v8, v13, v12);
  CGFloat v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
  v15(v8, 0, 1, v12);
  uint64_t v16 = enum case for DirectionalTextAlignment.none(_:);
  uint64_t v17 = v2 + 104;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  uint64_t v28 = v17;
  uint64_t v29 = v1;
  v18(v30, enum case for DirectionalTextAlignment.none(_:), v1);
  uint64_t v19 = (objc_class *)sub_10075AA00();
  id v20 = objc_allocWithZone(v19);
  *(void *)&v31[v27] = sub_10075A9F0();
  uint64_t v21 = OBJC_IVAR____TtC22SubscribePageExtension39LargeGameCenterPlayerCollectionViewCell_displayName;
  if (qword_1009318E0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_10001076C(v12, (uint64_t)qword_1009941D0);
  v26(v8, v22, v12);
  v15(v8, 0, 1, v12);
  v18(v30, v16, v29);
  id v23 = objc_allocWithZone(v19);
  uint64_t v24 = sub_10075A9F0();
  objc_super v25 = v31;
  *(void *)&v31[v21] = v24;

  sub_100768A40();
  __break(1u);
}

void sub_100741E44(void *a1)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  uint64_t v2 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v2)
  {
    uint64_t v3 = v2;
    if (Strong)
    {
      type metadata accessor for ProductLockupCollectionViewCell();
      id v4 = Strong;
      id v5 = v3;
      char v6 = sub_100768430();

      if (v6) {
        goto LABEL_9;
      }
    }
    else
    {
    }
LABEL_8:
    sub_10074312C();
    id v4 = Strong;
LABEL_9:

    goto LABEL_10;
  }
  if (Strong) {
    goto LABEL_8;
  }
LABEL_10:
}

void sub_100741F1C(uint64_t a1)
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = *(id *)(Strong + qword_100991A48);

    if (a1) {
      sub_100744520(&qword_10095B1A8, (void (*)(uint64_t))type metadata accessor for ChevronView);
    }
    sub_10075E720();
  }
  uint64_t v5 = swift_unknownObjectWeakLoadStrong();
  if (v5)
  {
    char v6 = (void *)v5;
    id v7 = *(id *)(v5 + qword_100991A48);

    id v8 = (id)swift_unknownObjectWeakLoadStrong();
    if (v8) {
      sub_100744520(&qword_10095B1A8, (void (*)(uint64_t))type metadata accessor for ChevronView);
    }
    sub_10075E730();
  }
}

uint64_t sub_10074208C()
{
  if (*(void *)(v0 + 64))
  {
    uint64_t v1 = *(void *)(v0 + 64);
  }
  else
  {
    uint64_t v2 = swift_allocObject();
    swift_weakInit();
    type metadata accessor for ProductScrollObserver();
    uint64_t v1 = swift_allocObject();
    *(void *)(v1 + 16) = 0;
    *(unsigned char *)(v1 + 24) = 1;
    *(void *)(v1 + 48) = 0;
    *(void *)(v1 + 56) = 0;
    *(void *)(v1 + 32) = sub_10074460C;
    *(void *)(v1 + 40) = v2;
    *(void *)(v0 + 64) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_100742140(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100742D50(a1, a2 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_1007421C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100742390(a4, a1, a2, a5);
    return swift_release();
  }
  return result;
}

uint64_t sub_100742250(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_weakLoadStrong();
    uint64_t result = swift_release();
    if (Strong)
    {
      v5[3] = sub_10001A860(0, (unint64_t *)&qword_100934610);
      v5[0] = a1;
      id v4 = a1;
      sub_100761670();
      swift_release();
      return sub_10000FED8((uint64_t)v5, &qword_1009360F0);
    }
  }
  return result;
}

uint64_t sub_100742304()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t Strong = swift_weakLoadStrong();
    uint64_t result = swift_release();
    if (Strong)
    {
      memset(v2, 0, sizeof(v2));
      sub_100761690();
      swift_release();
      return sub_10000FED8((uint64_t)v2, &qword_1009360F0);
    }
  }
  return result;
}

uint64_t sub_100742390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v44[2] = a3;
  uint64_t v6 = sub_10000FB44((uint64_t *)&unk_100939ED0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1007572A0();
  uint64_t v45 = *(void *)(v10 - 8);
  uint64_t v46 = v10;
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000FB44(&qword_10095B1B0);
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007599C0();
  sub_100766C80();
  sub_100767240();
  uint64_t v18 = sub_1007598E0();
  swift_release();
  double v19 = (double)v18;
  sub_100767240();
  uint64_t v20 = sub_100759920();
  swift_release();
  double v21 = (double)v20;
  sub_10000FB44(&qword_1009577C8);
  v44[0] = a4;
  sub_100766C00();
  sub_10000FE94(v50, v50[3]);
  char v22 = sub_100759C70();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v50);
  sub_1001C2C84();
  v44[1] = a1;
  sub_10075B6B0();
  swift_getObjectType();
  sub_1007573F0();
  sub_100757410();
  uint64_t v23 = sub_100756090();
  uint64_t v24 = *(void *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v9, 1, v23) == 1)
  {
    sub_10000FED8((uint64_t)v9, (uint64_t *)&unk_100939ED0);
    double v25 = 0.0;
  }
  else
  {
    sub_100756050();
    double v25 = v26;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v23);
  }
  swift_getKeyPath();
  uint64_t v27 = v48;
  sub_100766E80();
  swift_release();
  uint64_t v28 = sub_1007435EC((uint64_t)v13, LOBYTE(v50[0]), v22 & 1, v21, v19, -v25);
  uint64_t v30 = v29;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v46);
  swift_getKeyPath();
  sub_100766E80();
  uint64_t Strong = (void *)swift_release();
  if ((v30 != 0) == LOBYTE(v50[0]))
  {
    char v35 = 0;
  }
  else
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v33 = Strong;
      id v34 = [Strong traitCollection];

      char v35 = sub_100767D10();
    }
    else
    {
      char v35 = 0;
    }
  }
  __chkstk_darwin(Strong, v32);
  LOBYTE(v44[-4]) = v36;
  v44[-3] = v28;
  v44[-2] = v30;
  sub_100766E60();
  swift_bridgeObjectRelease();
  if (v35)
  {
    if (swift_weakLoadStrong())
    {
      sub_1007615F0();
      swift_release();
    }
  }
  else
  {
    uint64_t v37 = swift_unknownObjectWeakLoadStrong();
    if (v37)
    {
      uint64_t v38 = (char *)v37;
      swift_getKeyPath();
      sub_100766E80();
      swift_release();
      uint64_t v40 = v50[0];
      uint64_t v39 = v50[1];
      swift_getKeyPath();
      sub_100766E80();
      swift_release();
      int v41 = v49;
      sub_100758690();
      swift_dynamicCastClassUnconditional();
      id v42 = sub_10009352C();
      swift_getObjectType();
      sub_100288BD8(v40, v39, v41, v42, v38);

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v17, v27);
}

uint64_t sub_10074295C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100764B90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10075AEB0();
  sub_100744520((unint64_t *)&unk_1009407C0, (void (*)(uint64_t))&type metadata accessor for ProductTopLockup);
  uint64_t result = sub_10075B640();
  if (v21)
  {
    if (swift_weakLoadStrong())
    {
      uint64_t v9 = swift_allocObject();
      swift_weakInit();
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v11 = (void *)Strong;
        id v20 = *(id *)(Strong + qword_1009927D0);

        uint64_t v18 = sub_10075AE70();
        uint64_t v19 = a2;
        unint64_t v13 = v12;
        sub_1001C239C();
        sub_100764BA0();
        uint64_t v14 = sub_1007616D0();
        uint64_t v15 = sub_10075AD70();
        uint64_t v16 = sub_100761680();
        uint64_t v17 = v20;
        sub_10050B968(v18, v13, (uint64_t)v7, v14, v15, v16, v19, (uint64_t)sub_1007445B0, v9);
        swift_release();
        swift_release();

        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      }
      swift_release();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

void sub_100742BC8()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    swift_release();
    if (Strong)
    {
      id v1 = [Strong collectionView];

      if (v1)
      {
        [v1 scrollToTopAnimated:1];
      }
    }
  }
}

void sub_100742C68(void *a1)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    id v4 = [Strong collectionView];

    if (v4)
    {
      sub_10001A860(0, (unint64_t *)&qword_100946C58);
      id v5 = a1;
      char v6 = sub_100768430();

      if (v6)
      {
        sub_10074208C();
        sub_1005B3BF8(v5);
        swift_release();
      }
    }
  }
}

uint64_t sub_100742D50(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000FB44(&qword_10093AE50);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v12 = (char *)Strong;
    int v30 = sub_100761610();
    uint64_t v32 = sub_10075FC30();
    uint64_t v31 = sub_10075FC30();
    if (a2) {
      uint64_t v34 = sub_1005B3D58();
    }
    else {
      uint64_t v34 = 0;
    }
    uint64_t v13 = qword_1009927D0;
    int v33 = a2 ^ 1;
    char v14 = sub_10075EBD0();
    uint64_t v15 = *(void *)&v12[qword_1009927D8];
    if (v15 && (v14 & 1) == 0)
    {
      if (!a1)
      {
        uint64_t v19 = swift_allocObject();
        *(void *)(v19 + 16) = v12;
        *(void *)(v19 + 24) = v15;
        swift_bridgeObjectRetain();
        uint64_t v28 = v12;
        uint64_t v18 = sub_1007445A8;
LABEL_15:
        id v20 = *(void **)&v12[v13];
        int v21 = v33 & 1;
        id v22 = v20;
        sub_10050B034(a1, v34, v21, v18, v19);

        uint64_t v23 = swift_unknownObjectWeakLoadStrong();
        if (v23)
        {
          uint64_t v24 = (void *)v23;
          sub_1007616F0();
          if (swift_weakLoadStrong() && (uint64_t v25 = sub_100761660(), swift_release(), v25))
          {
            swift_release();
            char v26 = 1;
          }
          else
          {
            char v26 = 0;
          }
          sub_100282BC8(v32 == v31, v34, v21, (v30 & 1) == 0, (uint64_t)v9, v26);

          swift_release();
          sub_10001A4D0((uint64_t)v18);
          return sub_10000FED8((uint64_t)v9, &qword_10093AE50);
        }
        else
        {
          BOOL v27 = v32 != v31;
          sub_10001A4D0((uint64_t)v18);

          uint64_t result = swift_release();
          *(unsigned char *)(v3 + 48) = v27;
        }
        return result;
      }
      if (a1 == 1)
      {
        id v16 = [v12 navigationItem];
        sub_10001A860(0, (unint64_t *)&qword_10094AF50);
        Class isa = sub_1007677F0().super.isa;
        [v16 setRightBarButtonItems:isa animated:0];
      }
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_15;
  }

  return swift_release();
}

void sub_100743094(void *a1)
{
  id v1 = [a1 navigationItem];
  sub_10001A860(0, (unint64_t *)&qword_10094AF50);
  Class isa = sub_1007677F0().super.isa;
  [v1 setRightBarButtonItems:isa animated:0];
}

void sub_10074312C()
{
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v0 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v0)
  {
    id v1 = v0;
    id v2 = [v0 collectionView];

    if (v2)
    {
      uint64_t v3 = *(void **)&Strong[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerButton];
      id v4 = *(void **)&Strong[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_downloadProgressLabel];
      if (v4)
      {
        id v5 = v3;
        id v6 = v4;
        if (([v6 isHidden] & 1) == 0)
        {
LABEL_12:
          if ([v3 isHidden] && objc_msgSend(v6, "isHidden"))
          {
            uint64_t v8 = *(void **)&Strong[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareButton];
          }
          else
          {
            unsigned __int8 v9 = [v3 isHidden];
            uint64_t v8 = v6;
            if ((v9 & 1) == 0)
            {
              unsigned __int8 v10 = [v6 isHidden];
              uint64_t v8 = v3;
              if ((v10 & 1) == 0)
              {
                v53.receiver = v3;
                v53.super_class = (Class)type metadata accessor for OfferButton();
                objc_msgSendSuper2(&v53, "frame");
                double MaxY = CGRectGetMaxY(v55);
                [v6 frame];
                if (MaxY >= CGRectGetMaxY(v56)) {
                  uint64_t v8 = v3;
                }
                else {
                  uint64_t v8 = v6;
                }
              }
            }
          }
          id v12 = v8;
          [v12 frame];
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          id v21 = [v12 superview];
          objc_msgSend(v2, "convertRect:fromView:", v21, v14, v16, v18, v20);
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;

          v57.origin.CGFloat x = v23;
          v57.origin.CGFloat y = v25;
          v57.size.double width = v27;
          v57.size.double height = v29;
          double MinY = CGRectGetMinY(v57);
          uint64_t v31 = (void *)swift_unknownObjectWeakLoadStrong();
          if (!v31) {
            goto LABEL_24;
          }
          uint64_t v32 = v31;
          id v33 = [v31 view];
          if (v33)
          {
            uint64_t v34 = v33;
            type metadata accessor for InsetCollectionViewControllerContentView();
            uint64_t v35 = swift_dynamicCastClass();
            if (v35)
            {
              char v36 = *(unsigned char *)(v35
                             + OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset);

              if (v36)
              {
LABEL_28:
                uint64_t v50 = sub_10074208C();
                *(double *)(v50 + 16) = MinY;
                *(unsigned char *)(v50 + 24) = 0;
                uint64_t v51 = *(void (**)(void, void, double))(v50 + 32);
                if (v51) {
                  v51(*(void *)(v50 + 48), 0, *(double *)(v50 + 56));
                }

                swift_release();
                return;
              }
LABEL_24:
              uint64_t v37 = (void *)swift_unknownObjectWeakLoadStrong();
              double v38 = 0.0;
              if (v37)
              {
                uint64_t v39 = v37;
                id v40 = [v37 navigationController];

                if (v40)
                {
                  id v41 = [v40 navigationBar];

                  [v41 frame];
                  CGFloat v43 = v42;
                  CGFloat v45 = v44;
                  CGFloat v47 = v46;
                  CGFloat v49 = v48;

                  v58.origin.CGFloat x = v43;
                  v58.origin.CGFloat y = v45;
                  v58.size.double width = v47;
                  v58.size.double height = v49;
                  double v38 = CGRectGetMaxY(v58);
                }
              }
              double MinY = MinY - v38;
              goto LABEL_28;
            }
          }
          __break(1u);
          return;
        }
      }
      else
      {
        id v7 = v3;
      }
      id v6 = *(id *)&Strong[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_offerSubtitleLabel];
      goto LABEL_12;
    }
  }
}

uint64_t sub_1007434E0()
{
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ProductTopLockupCollectionElementsObserver()
{
  return self;
}

void sub_100743564(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_100743570(void *a1)
{
  [a1 adjustedContentInset];
  double v4 = v3;
  [a1 contentOffset];
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension11ChevronView_shouldAnimate) = v4 + v5 <= 0.1;

  sub_100645C70();
}

uint64_t sub_1007435EC(uint64_t a1, int a2, int a3, double a4, double a5, double a6)
{
  int v56 = a2;
  int v57 = a3;
  uint64_t v10 = sub_100757230();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  objc_super v53 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v15);
  uint64_t v54 = (char *)&v53 - v16;
  __chkstk_darwin(v17, v18);
  double v20 = (char *)&v53 - v19;
  uint64_t v21 = sub_1007572A0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v23);
  CGFloat v25 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26, v27);
  CGFloat v29 = (char *)&v53 - v28;
  __n128 v32 = __chkstk_darwin(v30, v31);
  id v33 = *(void (**)(__n128))(v22 + 16);
  uint64_t v55 = a1;
  uint64_t v35 = (char *)&v53 - v34;
  v33(v32);
  int v36 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v35, v21);
  if (v36 == enum case for LegacyAppState.downloading(_:))
  {
    ((void (*)(char *, char *, uint64_t))v33)(v29, v35, v21);
    (*(void (**)(char *, uint64_t))(v22 + 96))(v29, v21);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v20, v29, v10);
    uint64_t v37 = v11;
    if ((v57 & 1) != 0 && a5 < a6)
    {
      uint64_t v38 = sub_100757270();
      if ((v39 & 1) == 0)
      {
        double v40 = *(double *)&v38;
        if ((sub_100757200() & 1) == 0
          || (id v41 = (void *)sub_100757220()) == 0
          || (double v42 = v41, v43 = [v41 completedUnitCount], v42, (uint64_t)v43 > 0))
        {
          if (v40 > a4 || (v56 & 1) != 0)
          {
            uint64_t v51 = sub_100757280();
            (*(void (**)(char *, uint64_t))(v37 + 8))(v20, v10);
            goto LABEL_20;
          }
        }
      }
    }
    (*(void (**)(char *, uint64_t))(v37 + 8))(v20, v10);
    goto LABEL_15;
  }
  if (v36 == enum case for LegacyAppState.installing(_:))
  {
    double v44 = v35;
    ((void (*)(char *, char *, uint64_t))v33)(v25, v35, v21);
    (*(void (**)(char *, uint64_t))(v22 + 96))(v25, v21);
    uint64_t v45 = v11;
    double v46 = v54;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v54, v25, v10);
    CGFloat v47 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    double v48 = v53;
    v47(v53, v46, v10);
    if (v56)
    {
      char v49 = sub_100757200();
      uint64_t v50 = *(void (**)(char *, uint64_t))(v45 + 8);
      v50(v48, v10);
      if ((v49 & 1) == 0)
      {
        v58._object = (void *)0x80000001007A0FA0;
        v58._countAndFlagsBits = 0xD000000000000024;
        v59._countAndFlagsBits = 0;
        v59._object = (void *)0xE000000000000000;
        uint64_t v51 = sub_10075A680(v58, v59);
        v50(v46, v10);
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v50 = *(void (**)(char *, uint64_t))(v45 + 8);
      v50(v48, v10);
    }
    v50(v46, v10);
    uint64_t v51 = 0;
LABEL_19:
    uint64_t v35 = v44;
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v51 = 0;
LABEL_20:
  (*(void (**)(char *, uint64_t))(v22 + 8))(v35, v21);
  return v51;
}

void sub_100743AA4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_10000FB44(&qword_10093AE50);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10075B720();
  uint64_t v90 = *(void *)(v11 - 8);
  uint64_t v91 = v11;
  uint64_t v12 = *(void *)(v90 + 64);
  __chkstk_darwin(v11, v13);
  uint64_t v14 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100763990();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ProductLockupCollectionViewCell();
  uint64_t v20 = swift_dynamicCastClass();
  if (!v20) {
    return;
  }
  uint64_t v88 = v16;
  uint64_t v89 = v15;
  uint64_t v87 = v10;
  uint64_t v92 = a3;
  uint64_t v21 = (char *)v20;
  sub_10075AEB0();
  uint64_t v93 = a2;
  sub_100744520((unint64_t *)&unk_1009407C0, (void (*)(uint64_t))&type metadata accessor for ProductTopLockup);
  id v22 = a1;
  sub_10075B640();
  uint64_t v23 = v94;
  if (!v94)
  {

    return;
  }
  uint64_t v24 = v3;
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {

LABEL_22:
    swift_release();
    return;
  }
  uint64_t v26 = Strong;
  id v81 = v22;
  CGRect v84 = v21;
  sub_100741E44(v21);
  sub_10000FB44(&qword_10093D120);
  uint64_t v27 = v92;
  sub_100766C00();
  uint64_t v86 = v23;
  swift_getObjectType();
  uint64_t v85 = v26;
  sub_10075AE80();
  uint64_t v28 = sub_100757500();
  uint64_t v30 = v29;
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v19, v89);
  uint64_t v31 = v93;
  uint64_t v83 = v30;
  sub_100742390(v93, v28, v30, v27);
  uint64_t ObjectType = swift_getObjectType();
  sub_1007573E0();
  uint64_t v32 = swift_allocObject();
  swift_weakInit();
  uint64_t v33 = v90;
  uint64_t v34 = v91;
  (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))((char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v91);
  unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  unint64_t v36 = (v12 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v32;
  (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v37 + v35, v14, v34);
  *(void *)(v37 + v36) = v92;
  swift_retain();
  swift_retain();
  uint64_t v91 = v28;
  sub_1007573C0();
  uint64_t v38 = v84;
  swift_release();
  swift_release();
  if (*(unsigned char *)(v24 + 48))
  {
    *(unsigned char *)(v24 + 48) = 0;
    char v39 = sub_100761610();
    uint64_t v40 = (uint64_t)v87;
    sub_10075AE80();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v88 + 56))(v40, 0, 1, v89);
    if (swift_weakLoadStrong() && (uint64_t v41 = sub_100761660(), swift_release(), v41))
    {
      swift_release();
      char v42 = 1;
    }
    else
    {
      char v42 = 0;
    }
    sub_100282BC8(0, 0, 1, (v39 & 1) == 0, v40, v42);
    sub_10000FED8(v40, &qword_10093AE50);
  }
  id v43 = *(void **)&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_disclosureArrow];
  double v44 = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakAssign();
  id v45 = v43;
  sub_100741F1C((uint64_t)v44);

  uint64_t v46 = swift_allocObject();
  swift_weakInit();
  CGFloat v47 = (uint64_t (**)(void *))&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareTapHandler];
  uint64_t v48 = *(void *)&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareTapHandler];
  *CGFloat v47 = sub_100744510;
  v47[1] = (uint64_t (*)(void *))v46;
  sub_10001A4D0(v48);
  uint64_t v49 = swift_weakLoadStrong();
  uint64_t v50 = v93;
  if (v49 && (uint64_t v51 = sub_100761660(), swift_release(), v51))
  {
    swift_release();
    uint64_t v52 = 0;
  }
  else
  {
    uint64_t v52 = 1;
  }
  [*(id *)&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_shareButton] setHidden:v52];
  uint64_t v53 = swift_allocObject();
  swift_weakInit();
  uint64_t v54 = (uint64_t (**)())&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerTapHandler];
  uint64_t v55 = *(void *)&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_developerTapHandler];
  *uint64_t v54 = sub_100744518;
  v54[1] = (uint64_t (*)())v53;
  sub_10001A4D0(v55);
  sub_100758690();
  uint64_t v56 = swift_dynamicCastClassUnconditional();
  sub_10074295C(v50, v56);
  uint64_t v57 = swift_unknownObjectWeakLoadStrong();
  id v58 = (id)v57;
  if (v57)
  {
    Swift::String v59 = (char *)*(id *)(v57 + qword_1009927D0);

    id v58 = objc_retain(*(id *)(*(void *)&v59[OBJC_IVAR____TtC22SubscribePageExtension16ProductTitleView_iconTitleView]
                            + OBJC_IVAR____TtCC22SubscribePageExtension16ProductTitleViewP33_7358649AA0F63191E5632A80D277647513IconTitleView_iconView));
  }
  sub_1007611D0();

  id v60 = *(id *)&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_iconView];
  sub_1007611D0();

  sub_1007611E0();
  id v61 = *(void **)&v38[OBJC_IVAR____TtC22SubscribePageExtension31ProductLockupCollectionViewCell_uberView];
  if (!v61)
  {

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_22;
  }
  id v62 = (void *)swift_unknownObjectWeakLoadStrong();
  id v63 = v61;
  if (v62)
  {
    id v64 = [v62 navigationItem];
  }
  else
  {
    id v64 = 0;
  }
  uint64_t v65 = OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_navigationItem;
  uint64_t v66 = *(void **)&v63[OBJC_IVAR____TtC22SubscribePageExtension14UberHeaderView_navigationItem];
  if (v66)
  {
    id v67 = v66;
    NSString v68 = sub_1007675C0();
    [v67 removeObserver:v63 forKeyPath:v68 context:&unk_1009558F8];

    uint64_t v69 = *(void **)&v63[v65];
  }
  else
  {
    uint64_t v69 = 0;
  }
  *(void *)&v63[v65] = v64;
  id v70 = v64;

  uint64_t v71 = *(void **)&v63[v65];
  if (v71
    && (id v72 = v71,
        NSString v73 = sub_1007675C0(),
        [v72 addObserver:v63 forKeyPath:v73 options:0 context:&unk_1009558F8],
        v72,
        v73,
        (uint64_t v74 = *(void **)&v63[v65]) != 0)
    && (id v75 = [v74 title]) != 0)
  {
    uint64_t v76 = v75;
    uint64_t v77 = sub_1007675F0();
    uint64_t v79 = v78;
  }
  else
  {
    uint64_t v77 = 0;
    uint64_t v79 = 0;
  }
  sub_100668398(v77, v79);

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

uint64_t sub_100744340()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100744378()
{
  uint64_t v1 = sub_10075B720();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100744460(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_10075B720() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1007421C4(a1, a2, v7, v2 + v6, v8);
}

uint64_t sub_100744510(void *a1)
{
  return sub_100742250(a1);
}

uint64_t sub_100744518()
{
  return sub_100742304();
}

uint64_t sub_100744520(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100744568()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1007445A8()
{
  sub_100743094(*(void **)(v0 + 16));
}

void sub_1007445B0()
{
}

uint64_t sub_1007445B8(uint64_t a1)
{
  char v3 = *(unsigned char *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  *(unsigned char *)a1 = v3;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_10074460C(uint64_t a1, char a2)
{
  return sub_100742140(a1, a2);
}

uint64_t sub_100744614()
{
  uint64_t v0 = sub_100767310();
  sub_100047D88(v0, qword_100996340);
  sub_10001076C(v0, (uint64_t)qword_100996340);
  return sub_100767300();
}

uint64_t sub_100744678(uint64_t a1)
{
  return sub_10074473C(a1, qword_100996358);
}

uint64_t sub_10074469C(uint64_t a1)
{
  return sub_10074473C(a1, qword_100996370);
}

uint64_t sub_1007446B8(uint64_t a1)
{
  return sub_10074473C(a1, qword_100996388);
}

uint64_t sub_1007446E0(uint64_t a1)
{
  return sub_10074473C(a1, qword_1009963A0);
}

uint64_t sub_1007446F8(uint64_t a1)
{
  return sub_10074473C(a1, qword_1009963B8);
}

uint64_t sub_10074471C(uint64_t a1)
{
  return sub_10074473C(a1, qword_1009963D0);
}

uint64_t sub_10074473C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100767310();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100767330();
  sub_100047D88(v8, a2);
  sub_10001076C(v8, (uint64_t)a2);
  if (qword_100932800 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_10001076C(v3, (uint64_t)qword_100996340);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v9, v3);
  return sub_100767320();
}

uint64_t sub_10074488C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000FB44(&qword_100936F60);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v8 = sub_10000FB44(&qword_100944520);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000FB44(&qword_1009443B0);
  __chkstk_darwin(v13 - 8, v14);
  id v43 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v39 - v18;
  sub_100757B50();
  sub_10039892C(&qword_100945670, (void (*)(uint64_t))&type metadata accessor for Annotation);
  uint64_t result = sub_10075B640();
  if (v44)
  {
    uint64_t v40 = v9;
    uint64_t v41 = a1;
    uint64_t v42 = v8;
    *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_detailItems] = sub_100757B40();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_100757B20();
    id v22 = (uint64_t *)&v2[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleText];
    *id v22 = v21;
    v22[1] = v23;
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_titleLabel];
    if (v22[1])
    {
      swift_bridgeObjectRetain();
      NSString v25 = sub_1007675C0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v25 = 0;
    }
    [v24 setText:v25];

    [v3 setNeedsLayout];
    uint64_t v26 = sub_100757B30();
    uint64_t v27 = (uint64_t *)&v3[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_explicitSummary];
    uint64_t *v27 = v26;
    v27[1] = v28;
    swift_bridgeObjectRelease();
    sub_10028F444();
    uint64_t v29 = sub_100757AF0();
    uint64_t v39 = a2;
    if (v29)
    {
      uint64_t v44 = v29;
      sub_100758690();
      swift_dynamicCastClassUnconditional();
      sub_100763930();
      sub_10039892C(&qword_100939CD8, (void (*)(uint64_t))&type metadata accessor for Action);
      sub_100766BB0();
      swift_release();
      uint64_t v30 = sub_10000FB44((uint64_t *)&unk_1009443A0);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v19, 0, 1, v30);
    }
    else
    {
      uint64_t v31 = sub_10000FB44((uint64_t *)&unk_1009443A0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v19, 1, 1, v31);
    }
    uint64_t v32 = (uint64_t)&v3[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_linkAction];
    swift_beginAccess();
    sub_100291204((uint64_t)v19, v32);
    swift_endAccess();
    sub_10028F5D8();
    sub_1003988CC((uint64_t)v19);
    sub_10075B680();
    sub_100766EA0();
    sub_10035A49C();
    uint64_t v33 = v42;
    sub_100766E70();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v33);
    if (v44) {
      char v34 = 1;
    }
    else {
      char v34 = sub_100757B00();
    }
    uint64_t v35 = (uint64_t)v43;
    sub_100290FA4();
    v3[OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_isExpanded] = v34 & 1;
    sub_10028F124();
    uint64_t v36 = sub_100757AF0();
    if (v36)
    {
      uint64_t v44 = v36;
      sub_100758690();
      swift_dynamicCastClassUnconditional();
      sub_100763930();
      sub_10039892C(&qword_100939CD8, (void (*)(uint64_t))&type metadata accessor for Action);
      sub_100766BB0();
      swift_release();
      uint64_t v37 = sub_10000FB44((uint64_t *)&unk_1009443A0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v35, 0, 1, v37);
    }
    else
    {
      uint64_t v38 = sub_10000FB44((uint64_t *)&unk_1009443A0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v35, 1, 1, v38);
    }
    swift_beginAccess();
    sub_100291204(v35, v32);
    swift_endAccess();
    sub_10028F5D8();
    sub_1003988CC(v35);
    return swift_release();
  }
  return result;
}

uint64_t sub_100744EB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_itemLayoutContext;
  swift_beginAccess();
  return sub_10002790C(v3, a1);
}

uint64_t sub_100744F08(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22SubscribePageExtension28AnnotationCollectionViewCell_itemLayoutContext;
  swift_beginAccess();
  sub_1000278A4(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_100744F68())()
{
  return j__swift_endAccess;
}

char *sub_100744FD0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_productReviewActionsView;
  type metadata accessor for ProductReviewActionsView();
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  uint64_t v12 = OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_separatorView;
  type metadata accessor for SeparatorView();
  *(void *)&v11[v12] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v26.receiver = v11;
  v26.super_class = (Class)type metadata accessor for ProductReviewActionsCell();
  uint64_t v13 = (char *)objc_msgSendSuper2(&v26, "initWithFrame:", a1, a2, a3, a4);
  id v14 = [v13 contentView];
  objc_msgSend(v14, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  uint64_t v15 = OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_separatorView;
  uint64_t v16 = *(void **)&v13[OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_separatorView];
  sub_10001A860(0, (unint64_t *)&qword_100933F20);
  id v17 = v16;
  uint64_t v18 = (void *)sub_100768210();
  [v17 setBackgroundColor:v18];

  id v19 = [v13 contentView];
  [v19 addSubview:*(void *)&v13[v15]];

  uint64_t v20 = sub_100764060();
  v25[3] = v20;
  v25[4] = sub_1000358D0();
  uint64_t v21 = sub_1000107A4(v25);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, enum case for Feature.iOS.review_summarization(_:), v20);
  LOBYTE(v20) = sub_1007564E0();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v25);
  if (v20) {
    [*(id *)&v13[v15] setHidden:1];
  }
  id v22 = [v13 contentView];
  id v23 = *(id *)&v13[OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_productReviewActionsView];
  [v22 addSubview:v23];

  return v13;
}

id sub_100745288()
{
  uint64_t v1 = v0;
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for ProductReviewActionsCell();
  objc_msgSendSuper2(&v13, "layoutSubviews");
  id v2 = [v0 contentView];
  sub_10001A860(0, (unint64_t *)&qword_100932C80);
  sub_10075C580();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_productReviewActionsView], "setFrame:", v4, v6, v8, v10);
  v14.origin.CGFloat x = v4;
  v14.origin.CGFloat y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  CGRectGetMinX(v14);
  v15.origin.CGFloat x = v4;
  v15.origin.CGFloat y = v6;
  v15.size.double width = v8;
  v15.size.double height = v10;
  CGRectGetMinY(v15);
  v16.origin.CGFloat x = v4;
  v16.origin.CGFloat y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  CGRectGetWidth(v16);
  if (qword_100931400 != -1) {
    swift_once();
  }
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_separatorView];
  sub_100768010();
  return objc_msgSend(v11, "setFrame:");
}

id sub_100745480()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProductReviewActionsCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProductReviewActionsCell()
{
  return self;
}

void sub_100745524()
{
  uint64_t v1 = OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_productReviewActionsView;
  type metadata accessor for ProductReviewActionsView();
  *(void *)&v0[v1] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v2 = OBJC_IVAR____TtC22SubscribePageExtension24ProductReviewActionsCell_separatorView;
  type metadata accessor for SeparatorView();
  *(void *)&v0[v2] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  sub_100768A40();
  __break(1u);
}

uint64_t sub_1007455D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v4 = sub_100756440();
  uint64_t v29 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  double v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1007635F0();
  uint64_t v8 = *(void *)(v38 - 8);
  __chkstk_darwin(v38, v9);
  uint64_t v37 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v12);
  uint64_t v36 = (char *)&v28 - v13;
  uint64_t v31 = v2;
  sub_10075D8A0();
  sub_1007474E4(&qword_10093C340, (void (*)(uint64_t))&type metadata accessor for GenericPagePresenter);
  uint64_t result = sub_100759E50();
  if (result < 0) {
    goto LABEL_25;
  }
  uint64_t v35 = result;
  if (!result)
  {
    uint64_t v27 = 1;
    uint64_t v26 = v29;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(a2, v27, 1, v4);
  }
  uint64_t v28 = a2;
  uint64_t v15 = 0;
  unsigned int v34 = enum case for Shelf.ContentType.privacyType(_:);
  uint64_t v32 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v33 = (void (**)(char *, void, uint64_t))(v8 + 104);
  CGRect v16 = (uint64_t (**)(char *, uint64_t))(v29 + 8);
  uint64_t v17 = v35;
  while (v15 != v17)
  {
    uint64_t result = sub_10075C240();
    if (result)
    {
      sub_10075C250();
      (*v33)(v37, v34, v38);
      sub_1007474E4((unint64_t *)&qword_100938120, (void (*)(uint64_t))&type metadata accessor for Shelf.ContentType);
      sub_1007677D0();
      sub_1007677D0();
      if (v39 == v41 && v40 == v42)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v18 = *v32;
        uint64_t v19 = v38;
        (*v32)(v37, v38);
        v18(v36, v19);
        uint64_t v17 = v35;
      }
      else
      {
        char v20 = sub_100768B50();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v21 = *v32;
        uint64_t v22 = v38;
        (*v32)(v37, v38);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v36, v22);
        uint64_t v17 = v35;
        if ((v20 & 1) == 0) {
          goto LABEL_4;
        }
      }
      swift_getObjectType();
      uint64_t result = sub_100603BC4(v15);
      if (result < 0) {
        goto LABEL_24;
      }
      uint64_t v23 = result;
      if (result)
      {
        uint64_t v24 = 0;
        while (v23 != v24)
        {
          sub_1007563B0();
          sub_10075C2A0();
          sub_10000FB44(&qword_100934500);
          sub_1007587E0();
          if (swift_dynamicCast())
          {
            char v25 = sub_100758790();
            swift_release();
            if (v25)
            {
              a2 = v28;
              uint64_t v26 = v29;
              (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v28, v7, v4);
              uint64_t v27 = 0;
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(a2, v27, 1, v4);
            }
          }
          uint64_t result = (*v16)(v7, v4);
          if (v23 == ++v24) {
            goto LABEL_4;
          }
        }
        __break(1u);
        break;
      }
    }
LABEL_4:
    if (++v15 == v17)
    {
      uint64_t v27 = 1;
      a2 = v28;
      uint64_t v26 = v29;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(a2, v27, 1, v4);
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100745A7C()
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_100745AD4(uint64_t a1, uint64_t a2, void (*a3)(void, __n128), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  v27[0] = a2;
  v27[1] = a6;
  uint64_t v10 = sub_10000FB44((uint64_t *)&unk_10094FA80);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1007635F0();
  uint64_t v15 = *(void *)(v14 - 8);
  __n128 v17 = __chkstk_darwin(v14, v16);
  uint64_t v19 = (char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3(0, v17);
  sub_1007474E4(a4, a5);
  uint64_t v20 = a1;
  sub_100759E30();
  uint64_t v21 = sub_10035F0A8();
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  if (v21)
  {
    if (v20 < 1)
    {
      uint64_t v24 = 1;
    }
    else
    {
      sub_100759E30();
      uint64_t v24 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v24, 1, v14);
    char v25 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v23 + 96))(v13, v27[0], v21, v23);
    sub_10000FED8((uint64_t)v13, (uint64_t *)&unk_10094FA80);
  }
  else
  {
    char v25 = 0;
  }
  return v25 & 1;
}

uint64_t sub_100745CF4(uint64_t a1, void *a2, void (*a3)(void, __n128), unint64_t *a4, void (*a5)(uint64_t), void (*a6)(char *, char *, uint64_t))
{
  uint64_t v103 = a6;
  id v99 = a2;
  uint64_t v10 = sub_10000FB44(&qword_10094C8F0);
  __chkstk_darwin(v10, v11);
  v106 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10075A570();
  uint64_t v102 = *(void **)(v13 - 8);
  __chkstk_darwin(v13, v14);
  __chkstk_darwin(v15, v16);
  uint64_t v100 = (char *)&v91 - v17;
  __chkstk_darwin(v18, v19);
  __chkstk_darwin(v20, v21);
  uint64_t v101 = (char *)&v91 - v22;
  __chkstk_darwin(v23, v24);
  uint64_t v26 = (char *)&v91 - v25;
  __chkstk_darwin(v27, v28);
  __chkstk_darwin(v29, v30);
  uint64_t v32 = (id *)((char *)&v91 - v31);
  __chkstk_darwin(v33, v34);
  uint64_t v104 = (char *)&v91 - v35;
  __n128 v41 = __chkstk_darwin(v36, v37);
  v105 = (char *)&v91 - v42;
  if (a1 < 1) {
    return 0;
  }
  uint64_t v96 = v40;
  uint64_t v97 = v39;
  uint64_t v98 = v38;
  a3(0, v41);
  sub_1007474E4(a4, a5);
  if (sub_100759E50() < 1) {
    return 0;
  }
  uint64_t v94 = v26;
  id v43 = v105;
  sub_100759E20();
  uint64_t v44 = v104;
  sub_100759E20();
  id v45 = v106;
  uint64_t v46 = &v106[*(int *)(v10 + 48)];
  CGFloat v47 = v102;
  uint64_t v48 = (uint64_t)(v102 + 2);
  uint64_t v49 = (void (*)(char *, char *, uint64_t))v102[2];
  v49(v106, v43, v13);
  uint64_t v95 = v46;
  v49(v46, v44, v13);
  uint64_t v50 = v45;
  uint64_t v51 = (uint64_t (*)(char *, uint64_t))v47[11];
  int v52 = v51(v50, v13);
  uint64_t v103 = v49;
  if (v52 == enum case for ShelfBackground.color(_:))
  {
    int v53 = v52;
    v49((char *)v32, v106, v13);
    uint64_t v54 = (void (*)(id *, uint64_t))v47[12];
    v54(v32, v13);
    id v92 = *v32;
    uint64_t v55 = sub_10000FB44(&qword_1009355B0);
    uint64_t v93 = v48;
    uint64_t v56 = v55;
    uint64_t v57 = (char *)v32 + *(int *)(v55 + 48);
    id v58 = v95;
    if (v51(v95, v13) == v53)
    {
      uint64_t v91 = v57;
      Swift::String v59 = v96;
      v49((char *)v96, v58, v13);
      v54(v59, v13);
      id v60 = v58;
      id v61 = *v59;
      id v62 = (char *)v59 + *(int *)(v56 + 48);
      id v63 = v99;
      id v64 = [v99 traitCollection];
      id v65 = v92;
      id v66 = [v92 resolvedColorWithTraitCollection:v64];

      id v67 = [v63 traitCollection];
      id v68 = [v61 resolvedColorWithTraitCollection:v67];

      sub_100010808();
      LOBYTE(v67) = sub_100768430();

      uint64_t v69 = v106;
      CGFloat v47 = v102;
      if ((v67 & 1) == 0)
      {
        uint64_t v88 = (void (*)(char *, uint64_t))v102[1];
        v88(v104, v13);
        v88(v105, v13);
        uint64_t v89 = sub_10075DC30();
        uint64_t v90 = *(void (**)(char *, uint64_t))(*(void *)(v89 - 8) + 8);
        v90(v62, v89);
        v90(v91, v89);
        v88(v60, v13);
        v88(v69, v13);
        return 2;
      }
      uint64_t v70 = sub_10075DC30();
      uint64_t v71 = *(void (**)(char *, uint64_t))(*(void *)(v70 - 8) + 8);
      v71(v62, v70);
      v71(v91, v70);
      uint64_t v44 = v104;
      id v43 = v105;
      uint64_t v49 = v103;
    }
    else
    {
      uint64_t v73 = sub_10075DC30();
      (*(void (**)(char *, uint64_t))(*(void *)(v73 - 8) + 8))(v57, v73);

      CGFloat v47 = v102;
      uint64_t v44 = v104;
      id v43 = v105;
    }
  }
  uint64_t v74 = (void *)v47[13];
  id v75 = v94;
  LODWORD(v102) = enum case for ShelfBackground.none(_:);
  id v99 = v74;
  uint64_t v96 = (void **)(v47 + 13);
  ((void (*)(char *))v74)(v94);
  uint64_t v93 = sub_1007474E4((unint64_t *)&qword_100943EC0, (void (*)(uint64_t))&type metadata accessor for ShelfBackground);
  char v76 = sub_100767570();
  uint64_t v77 = (void (*)(char *, uint64_t))v47[1];
  v77(v75, v13);
  uint64_t v78 = v101;
  v49(v101, v44, v13);
  if (v76)
  {
    v77(v78, v13);
    uint64_t v79 = v98;
    uint64_t v80 = v103;
    v103(v98, v43, v13);
    id v81 = v100;
    v80(v100, v44, v13);
    goto LABEL_13;
  }
  ((void (*)(char *, void, uint64_t))v99)(v75, v102, v13);
  char v82 = sub_10075A560();
  v77(v75, v13);
  v77(v78, v13);
  uint64_t v79 = v98;
  uint64_t v83 = v103;
  v103(v98, v43, v13);
  id v81 = v100;
  v83(v100, v44, v13);
  if ((v82 & 1) == 0)
  {
LABEL_13:
    ((void (*)(char *, void, uint64_t))v99)(v75, v102, v13);
    char v85 = sub_10075A560();
    v77(v75, v13);
    uint64_t v86 = v97;
    v103(v97, v81, v13);
    if (v85)
    {
      ((void (*)(char *, void, uint64_t))v99)(v75, v102, v13);
      char v87 = sub_100767570();
      v77(v75, v13);
      v77(v86, v13);
      v77(v81, v13);
      v77(v79, v13);
      v77(v104, v13);
      v77(v105, v13);
      uint64_t v84 = (uint64_t)v106;
      if ((v87 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      v77(v86, v13);
      v77(v81, v13);
      v77(v79, v13);
      v77(v104, v13);
      v77(v105, v13);
      uint64_t v84 = (uint64_t)v106;
    }
    sub_10000FED8(v84, &qword_10094C8F0);
    return 0;
  }
  v77(v81, v13);
  v77(v79, v13);
  v77(v44, v13);
  v77(v105, v13);
  uint64_t v84 = (uint64_t)v106;
LABEL_15:
  v77(v95, v13);
  v77((char *)v84, v13);
  return 2;
}

uint64_t sub_1007466D8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100746C98(a1, a2, (void (*)(void, __n128))&type metadata accessor for GenericPagePresenter, &qword_10093C340, (void (*)(uint64_t))&type metadata accessor for GenericPagePresenter, (void (*)(void, __n128))&type metadata accessor for GenericPagePresenter, a3);
}

uint64_t sub_100746720@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v44 = a2;
  uint64_t v4 = sub_10000FB44(&qword_10093A1F0);
  __chkstk_darwin(v4 - 8, v5);
  __n128 v41 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v8);
  uint64_t v40 = (char *)&v40 - v9;
  uint64_t v10 = sub_10075A570();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v16);
  uint64_t v18 = (char *)&v40 - v17;
  sub_100760390();
  sub_1007474E4((unint64_t *)&qword_100936840, (void (*)(uint64_t))&type metadata accessor for PurchasesContentPresenter);
  char v19 = sub_100759E10();
  uint64_t v45 = 0;
  if (v19) {
    uint64_t v45 = sub_100759F00();
  }
  sub_100759F20();
  uint64_t v21 = v20;
  if (v20) {
    swift_bridgeObjectRelease();
  }
  uint64_t v42 = v21;
  sub_100759F30();
  uint64_t v23 = v22;
  if (v22) {
    swift_bridgeObjectRelease();
  }
  sub_100759E20();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for ShelfBackground.interactive(_:), v10);
  char v24 = sub_10075A560();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v14, v10);
  v25(v18, v10);
  uint64_t v26 = (uint64_t)v44;
  char v27 = sub_100745CF4(a1, v44, (void (*)(void, __n128))&type metadata accessor for PurchasesContentPresenter, (unint64_t *)&qword_100936840, (void (*)(uint64_t))&type metadata accessor for PurchasesContentPresenter, (void (*)(char *, char *, uint64_t))&protocol conformance descriptor for PurchasesContentPresenter);
  char v28 = sub_100745AD4(a1, v26, (void (*)(void, __n128))&type metadata accessor for PurchasesContentPresenter, (unint64_t *)&qword_100936840, (void (*)(uint64_t))&type metadata accessor for PurchasesContentPresenter, (uint64_t)&protocol conformance descriptor for PurchasesContentPresenter);
  if (v24)
  {
    sub_100735004(v23 != 0, v43);
    return swift_release();
  }
  else
  {
    if (v27)
    {
      if (v45 && (swift_retain(), uint64_t v30 = sub_1007637A0(), swift_release(), v30))
      {
        uint64_t v31 = (uint64_t)v41;
        sub_100758990();
        swift_release();
        uint64_t v32 = sub_100758980();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 0, 1, v32);
      }
      else
      {
        uint64_t v37 = sub_100758980();
        uint64_t v31 = (uint64_t)v41;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v41, 1, 1, v37);
      }
      sub_100735690(v42 != 0, v23 != 0, 0, v27 == 1, v31, v43);
      swift_release();
      uint64_t v38 = v31;
    }
    else
    {
      char v33 = v28;
      if (v45 && (swift_retain(), uint64_t v34 = sub_1007637A0(), swift_release(), v34))
      {
        uint64_t v35 = (uint64_t)v40;
        sub_100758990();
        swift_release();
        uint64_t v36 = sub_100758980();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
      }
      else
      {
        uint64_t v39 = sub_100758980();
        uint64_t v35 = (uint64_t)v40;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v40, 1, 1, v39);
      }
      sub_100734198(v42 != 0, v23 != 0, 0, v33 & 1, 0, v35, v43);
      swift_release();
      uint64_t v38 = v35;
    }
    return sub_10000FED8(v38, &qword_10093A1F0);
  }
}

uint64_t sub_100746C50@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100746C98(a1, a2, (void (*)(void, __n128))&type metadata accessor for ReviewsPagePresenter, &qword_10093C350, (void (*)(uint64_t))&type metadata accessor for ReviewsPagePresenter, (void (*)(void, __n128))&type metadata accessor for ReviewsPagePresenter, a3);
}

uint64_t sub_100746C98@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void (*a3)(void, __n128)@<X2>, unint64_t *a4@<X3>, void (*a5)(uint64_t)@<X4>, void (*a6)(void, __n128)@<X5>, uint64_t a7@<X8>)
{
  uint64_t v57 = a6;
  uint64_t v53 = a7;
  uint64_t v54 = a2;
  uint64_t v12 = sub_10000FB44(&qword_10093A1F0);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v51 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v16);
  uint64_t v50 = (char *)&v50 - v17;
  uint64_t v18 = sub_10075A570();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  uint64_t v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v25 = __chkstk_darwin(v23, v24);
  char v27 = (char *)&v50 - v26;
  uint64_t v55 = v7;
  a3(0, v25);
  uint64_t v56 = a4;
  id v58 = a5;
  sub_1007474E4(a4, a5);
  char v28 = sub_100759E10();
  uint64_t v59 = 0;
  if (v28) {
    uint64_t v59 = sub_100759F00();
  }
  sub_100759F20();
  uint64_t v30 = v29;
  if (v29) {
    swift_bridgeObjectRelease();
  }
  sub_100759F30();
  uint64_t v32 = v31;
  if (v31) {
    swift_bridgeObjectRelease();
  }
  uint64_t v52 = v32;
  sub_100759E20();
  (*(void (**)(char *, void, uint64_t))(v19 + 104))(v22, enum case for ShelfBackground.interactive(_:), v18);
  char v33 = sub_10075A560();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v19 + 8);
  v34(v22, v18);
  v34(v27, v18);
  uint64_t v35 = (uint64_t)v54;
  uint64_t v37 = v56;
  uint64_t v36 = v57;
  uint64_t v38 = v58;
  char v39 = sub_100745CF4(a1, v54, v57, v56, v58, (void (*)(char *, char *, uint64_t))&protocol conformance descriptor for BaseShelfPresenter);
  char v40 = sub_100745AD4(a1, v35, v36, v37, v38, (uint64_t)&protocol conformance descriptor for BaseShelfPresenter);
  if (v33)
  {
    sub_100735004(v52 != 0, v53);
    return swift_release();
  }
  else
  {
    if (v39)
    {
      if (v59 && (swift_retain(), uint64_t v42 = sub_1007637A0(), swift_release(), v42))
      {
        uint64_t v43 = (uint64_t)v51;
        sub_100758990();
        swift_release();
        uint64_t v44 = sub_100758980();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v43, 0, 1, v44);
      }
      else
      {
        uint64_t v48 = sub_100758980();
        uint64_t v43 = (uint64_t)v51;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v51, 1, 1, v48);
      }
      sub_100735690(v30 != 0, v52 != 0, 0, v39 == 1, v43, v53);
    }
    else
    {
      char v45 = v40;
      if (v59 && (swift_retain(), uint64_t v46 = sub_1007637A0(), swift_release(), v46))
      {
        uint64_t v43 = (uint64_t)v50;
        sub_100758990();
        swift_release();
        uint64_t v47 = sub_100758980();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v43, 0, 1, v47);
      }
      else
      {
        uint64_t v49 = sub_100758980();
        uint64_t v43 = (uint64_t)v50;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v50, 1, 1, v49);
      }
      sub_100734198(v30 != 0, v52 != 0, 0, v45 & 1, 0, v43, v53);
    }
    swift_release();
    return sub_10000FED8(v43, &qword_10093A1F0);
  }
}

uint64_t sub_100747194@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a3;
  uint64_t v5 = sub_1007635F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v20 - v12;
  sub_10075C250();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for Shelf.ContentType.privacyCategory(_:), v5);
  sub_1007474E4((unint64_t *)&qword_100938120, (void (*)(uint64_t))&type metadata accessor for Shelf.ContentType);
  sub_1007677D0();
  sub_1007677D0();
  if (v24 == v22 && v25 == v23)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
    v14(v9, v5);
    v14(v13, v5);
  }
  else
  {
    char v15 = sub_100768B50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    v16(v13, v5);
    if ((v15 & 1) == 0) {
      return sub_100746C98(a1, a2, (void (*)(void, __n128))&type metadata accessor for GenericPagePresenter, &qword_10093C340, (void (*)(uint64_t))&type metadata accessor for GenericPagePresenter, (void (*)(void, __n128))&type metadata accessor for GenericPagePresenter, v21);
    }
  }
  if (qword_1009327D0 != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for TitleHeaderView.Style(0);
  uint64_t v18 = sub_10001076C(v17, (uint64_t)qword_1009961C8);
  return sub_1003EC738(v18, v21);
}

uint64_t sub_100747468()
{
  sub_100745A7C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PrivacyDetailDataSource()
{
  uint64_t result = qword_10095B218;
  if (!qword_10095B218) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1007474E4(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_10074752C(uint64_t a1, double a2, double a3)
{
  return sub_100747544(a1, (double (*)(double, double))sub_10017F7C0, a2, a3);
}

double sub_100747544(uint64_t a1, double (*a2)(double, double), double a3, double a4)
{
  uint64_t v9 = sub_100765800();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = &v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14, v15);
  uint64_t v17 = &v44[-v16];
  __chkstk_darwin(v18, v19);
  uint64_t v21 = &v44[-v20];
  __chkstk_darwin(v22, v23);
  uint64_t v25 = &v44[-v24];
  double v26 = a2(a3, a4);
  id v27 = [v4 traitCollection];
  id v28 = [v27 horizontalSizeClass];

  if (v28 == (id)2) {
    double v29 = 635.0;
  }
  else {
    double v29 = a3;
  }
  if (v29 <= v26)
  {
    sub_10000FE30(a1, (uint64_t)v46);
    *((void *)v25 + 3) = &type metadata for CGFloat;
    *((void *)v25 + 4) = &protocol witness table for CGFloat;
    *(double *)uint64_t v25 = v29;
    uint64_t v38 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 104);
    v38(v25, enum case for Resize.Rule.replaced(_:), v9);
    uint64_t v39 = enum case for Resize.Rule.unchanged(_:);
    v38(v21, enum case for Resize.Rule.unchanged(_:), v9);
    v38(v17, v39, v9);
    v38(v13, v39, v9);
    uint64_t v48 = sub_100765810();
    uint64_t v49 = &protocol witness table for Resize;
    sub_1000107A4(v47);
    sub_100765820();
  }
  else
  {
    sub_1007652B0();
    char v31 = v30;
    char v33 = v32;
    sub_10000FE30(a1, (uint64_t)v46);
    sub_1007652B0();
    char v35 = v34;
    char v37 = v36;
    uint64_t v48 = sub_1007658E0();
    uint64_t v49 = &protocol witness table for Constrain;
    sub_1000107A4(v47);
    char v45 = v35 & 1;
    v44[0] = v37 & 1;
    sub_1007658F0();
    v46[0] = v31 & 1;
    char v45 = v33 & 1;
    sub_1007652D0();
  }
  sub_10000FE94(v47, v48);
  id v40 = [v4 traitCollection];
  sub_100765910();
  double v42 = v41;

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v47);
  return v42;
}

char *sub_100747900(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_10075F090();
  __chkstk_darwin(v9 - 8, v10);
  char v37 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_10075F0F0();
  uint64_t v12 = *(void *)(v36 - 8);
  __chkstk_darwin(v36, v13);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10075F010();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_headerView;
  type metadata accessor for CarouselItemModuleHeaderView();
  id v22 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v23 = v4;
  *(void *)&v4[v21] = [v22 init];
  uint64_t v24 = OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_platterView;
  type metadata accessor for CarouselItemModulePlatterView();
  *(void *)&v23[v24] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v25 = OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_tapGestureRecognizer;
  *(void *)&v23[v25] = [objc_allocWithZone((Class)UITapGestureRecognizer) init];
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v20, enum case for HeroCarouselItemOverlay.DisplayOptions.TextAlignment.center(_:), v16);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for HeroCarouselItemOverlay.DisplayOptions.Placement.leading(_:), v36);
  sub_10075F080();
  sub_10075F020();
  double v26 = &v23[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler];
  *(void *)double v26 = 0;
  *((void *)v26 + 1) = 0;

  v39.receiver = v23;
  v39.super_class = ObjectType;
  id v27 = objc_msgSendSuper2(&v39, "initWithFrame:", a1, a2, a3, a4);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  char v31 = (char *)v27;
  objc_msgSend(v31, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  [v31 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];
  id v32 = [v31 layer];
  [v32 setAllowsGroupOpacity:0];

  char v33 = *(void **)&v31[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_tapGestureRecognizer];
  [v33 setEnabled:0];
  [v33 addTarget:v31 action:"handleSelection:"];
  [v33 setDelegate:v31];
  [v31 addGestureRecognizer:v33];
  [v31 addSubview:*(void *)&v31[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_headerView]];
  [v31 addSubview:*(void *)&v31[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_platterView]];

  return v31;
}

uint64_t sub_100747D48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v2 = sub_100764E50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_100764D80();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100764D50();
  *(void *)(swift_allocObject() + 16) = v1;
  uint64_t v16 = v1;
  sub_100764E30();
  uint64_t v17 = *(void **)&v16[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_headerView];
  uint64_t v28 = type metadata accessor for CarouselItemModuleHeaderView();
  double v29 = (void *)sub_100748C7C(&qword_100940690, (void (*)(uint64_t))type metadata accessor for CarouselItemModuleHeaderView);
  v27[0] = (uint64_t)v17;
  id v18 = v17;
  sub_100764E40();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
  v19(v6, v2);
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v27);
  uint64_t v20 = *(void **)&v16[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_platterView];
  v26[3] = type metadata accessor for CarouselItemModulePlatterView();
  v26[4] = sub_100748C7C(&qword_10095B578, (void (*)(uint64_t))type metadata accessor for CarouselItemModulePlatterView);
  v26[0] = v20;
  uint64_t v28 = v2;
  double v29 = &protocol witness table for VerticalStack;
  sub_1000107A4(v27);
  id v21 = v20;
  sub_100764E40();
  v19(v10, v2);
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v26);
  id v22 = v25;
  v25[3] = v11;
  v22[4] = (uint64_t)&protocol witness table for DisjointStack;
  sub_1000107A4(v22);
  sub_100764D70();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  return _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v27);
}

uint64_t sub_100748180()
{
  uint64_t v0 = sub_100764D40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (uint64_t *)((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4[3] = sub_100764E70();
  v4[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_1000107A4(v4);
  sub_100764E60();
  (*(void (**)(uint64_t *, void, uint64_t))(v1 + 104))(v4, enum case for DisjointStack.EdgePosition.anchored(_:), v0);
  return sub_100764CF0();
}

uint64_t sub_100748274(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10075F0F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10075F100();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a2 + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_displayOptions;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v13, v8);
  sub_10075F0B0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  sub_10075F0D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return sub_100764DE0();
}

uint64_t sub_100748634()
{
  return type metadata accessor for CarouselItemCollectionModuleOverlay();
}

uint64_t type metadata accessor for CarouselItemCollectionModuleOverlay()
{
  uint64_t result = qword_10095B568;
  if (!qword_10095B568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100748688()
{
  uint64_t result = sub_10075F100();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100748734(uint64_t a1, uint64_t a2)
{
  sub_1007489AC(a1, a2);

  return sub_10001A4D0(a1);
}

uint64_t sub_100748780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10075F120();
  if (v3) {
    uint64_t v4 = (double *)v3;
  }
  else {
    uint64_t v4 = _swiftEmptyArrayStorage;
  }
  sub_10038FB4C((unint64_t)v4, a2);

  return swift_bridgeObjectRelease();
}

id sub_100748800()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_10075F100();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10075F110();
  uint64_t v7 = &v0[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_displayOptions];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v3 + 40))(v7, v6, v2);
  swift_endAccess();
  sub_100180E84();
  sub_10075F110();
  uint64_t v8 = sub_10075F170();
  uint64_t v10 = v9;
  uint64_t v11 = sub_10075F130();
  sub_10064E3AC((uint64_t)v6, v8, v10, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return [v1 setNeedsLayout];
}

id sub_1007489AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler);
  *uint64_t v3 = a1;
  v3[1] = a2;
  sub_10001A4E0(a1);
  sub_10001A4D0(v4);
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_tapGestureRecognizer);
  uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  if (*v3)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    *(void *)(v8 + 24) = v7;
    uint64_t v9 = sub_100055398;
  }
  else
  {
    uint64_t v9 = 0;
  }
  sub_10001A4E0(v6);
  sub_10001A4D0((uint64_t)v9);

  return [v5 setEnabled:v6 != 0];
}

uint64_t sub_100748A8C()
{
  unint64_t v1 = (unint64_t *)(*(void *)(*(void *)(v0
                                                  + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_platterView)
                                      + OBJC_IVAR____TtC22SubscribePageExtension29CarouselItemModulePlatterView_lockupCollectionView)
                          + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView_artworkViews);
  swift_beginAccess();
  unint64_t v2 = *v1;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_100768A60();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)sub_100768950();
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      ++v5;
      sub_100758360();
      sub_100748C7C((unint64_t *)&qword_100935020, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
      sub_1007591B0();
    }
    while (v3 != v5);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_100748C04()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100748C3C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100748C74(uint64_t a1)
{
  return sub_100748274(a1, *(void *)(v1 + 16));
}

uint64_t sub_100748C7C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100748CC4()
{
  uint64_t v1 = sub_10075F090();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_10075F0F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10075F010();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  NSString v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_headerView;
  type metadata accessor for CarouselItemModuleHeaderView();
  *(void *)&v0[v13] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v14 = OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_platterView;
  type metadata accessor for CarouselItemModulePlatterView();
  *(void *)&v0[v14] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v15 = OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_tapGestureRecognizer;
  *(void *)&v0[v15] = [objc_allocWithZone((Class)UITapGestureRecognizer) init];
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, enum case for HeroCarouselItemOverlay.DisplayOptions.TextAlignment.center(_:), v8);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for HeroCarouselItemOverlay.DisplayOptions.Placement.leading(_:), v3);
  sub_10075F080();
  sub_10075F020();
  uint64_t v16 = &v0[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;

  sub_100768A40();
  __break(1u);
}

void sub_100748F60()
{
  if (([v0 isViewLoaded] & 1) == 0)
  {
    v5._countAndFlagsBits = 0x535F474E494D4F43;
    v5._object = (void *)0xEB000000004E4F4FLL;
    v6._countAndFlagsBits = 0;
    v6._object = (void *)0xE000000000000000;
    sub_10075A680(v5, v6);
    id v1 = objc_allocWithZone((Class)_UIContentUnavailableView);
    NSString v2 = sub_1007675C0();
    swift_bridgeObjectRelease();
    id v3 = objc_msgSend(v1, "initWithFrame:title:style:", v2, 0, 0.0, 0.0, 0.0, 0.0);

    [v0 setView:v3];
  }
}

id sub_100749200()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComingSoonViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ComingSoonViewController()
{
  return self;
}

ValueMetadata *type metadata accessor for OfferStateActionImplementation()
{
  return &type metadata for OfferStateActionImplementation;
}

uint64_t sub_100749268()
{
  return sub_100749C84(&qword_10095B5A8, (void (*)(uint64_t))&type metadata accessor for OfferStateAction);
}

uint64_t sub_10074929C(uint64_t *a1, uint64_t a2)
{
  return sub_100749758(*a1, a2);
}

uint64_t sub_1007492A4(uint64_t a1)
{
  uint64_t v2 = sub_100766800();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v35 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100767040();
  uint64_t v34 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v6);
  char v33 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v32 - v10;
  uint64_t v12 = sub_10000FB44((uint64_t *)&unk_100933BF0);
  uint64_t v36 = *(void *)(v12 - 8);
  uint64_t v37 = v12;
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000FB44((uint64_t *)&unk_100936B80);
  __chkstk_darwin(v16 - 8, v17);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000FB44((uint64_t *)&unk_100933C00);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20, v22);
  uint64_t v24 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  swift_retain();
  sub_100766C70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_100068080((uint64_t)v19);
    sub_10000FB44(&qword_100942600);
    sub_10005BFEC();
    swift_allocError();
    *uint64_t v25 = 1;
    uint64_t v26 = sub_100767280();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v24, v19, v20);
    v41[3] = sub_100763930();
    v41[4] = sub_100749C84((unint64_t *)&qword_100936B90, (void (*)(uint64_t))&type metadata accessor for Action);
    v41[0] = v40;
    swift_retain();
    sub_1004017B0();
    uint64_t v27 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v33, v11, v5);
    uint64_t v28 = v35;
    sub_1007667E0();
    sub_100766C40();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v39);
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v15, v11, v5);
    uint64_t v30 = v36;
    uint64_t v29 = v37;
    (*(void (**)(char *, void, uint64_t))(v36 + 104))(v15, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v37);
    uint64_t v26 = sub_100766D00();
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v29);
    _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v41);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  }
  swift_release();
  return v26;
}

uint64_t sub_100749758(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = sub_1007572A0();
  uint64_t v43 = *(void *)(v46 - 8);
  __chkstk_darwin(v46, v3);
  v38[0] = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v6);
  char v45 = (char *)v38 - v7;
  __chkstk_darwin(v8, v9);
  double v42 = (char *)v38 - v10;
  uint64_t v11 = sub_10000FB44((uint64_t *)&unk_100933C00);
  uint64_t v39 = *(void *)(v11 - 8);
  uint64_t v40 = v11;
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100763990();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FB44(&qword_100942600);
  uint64_t v44 = sub_1007672D0();
  sub_100763D40();
  swift_getObjectType();
  sub_10075AC30();
  sub_100757500();
  swift_unknownObjectRelease();
  uint64_t v20 = v15;
  uint64_t v21 = v45;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v20);
  double v41 = v14;
  v38[1] = a2;
  uint64_t v23 = v42;
  uint64_t v22 = v43;
  sub_100763D30();
  uint64_t v24 = sub_10075AC00();
  swift_getObjectType();
  sub_10075AC20();
  uint64_t v25 = v46;
  sub_100757400();
  char v26 = sub_100757290();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v27(v21, v23, v25);
  if (v26)
  {
    char v45 = *(char **)(v22 + 8);
    ((void (*)(char *, uint64_t))v45)(v21, v25);
    goto LABEL_4;
  }
  char v28 = sub_100757240();
  char v45 = *(char **)(v22 + 8);
  ((void (*)(char *, uint64_t))v45)(v21, v25);
  if (v28)
  {
LABEL_4:
    uint64_t v29 = sub_10075ABE0();
    uint64_t v31 = v39;
    uint64_t v30 = v40;
    uint64_t v32 = v41;
    if (!v29)
    {
      swift_retain();
      uint64_t v29 = v24;
    }
    goto LABEL_12;
  }
  uint64_t v33 = v38[0];
  v27((char *)v38[0], v23, v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 88))(v33, v25) == enum case for LegacyAppState.openable(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v22 + 96))(v33, v25);

    uint64_t v34 = sub_10075D000();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
    uint64_t v35 = sub_10075ABF0();
    uint64_t v32 = v41;
    if (v35)
    {
      uint64_t v29 = v35;
    }
    else
    {
      swift_retain();
      uint64_t v29 = v24;
    }
    uint64_t v31 = v39;
    uint64_t v30 = v40;
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v45)(v33, v25);
    swift_retain();
    uint64_t v29 = v24;
    uint64_t v31 = v39;
    uint64_t v30 = v40;
    uint64_t v32 = v41;
  }
LABEL_12:
  sub_1007492A4(v29);
  swift_release();
  uint64_t v36 = v44;
  sub_100767260();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  ((void (*)(char *, uint64_t))v45)(v23, v46);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v30);
  return v36;
}

uint64_t sub_100749C84(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100749CD8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = v2;
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v7 = (void (*)(uint64_t))swift_allocObject();
    *((void *)v7 + 2) = a1;
    *((void *)v7 + 3) = a2;
    *((void *)v7 + 4) = v6;
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    updated = (objc_class *)type metadata accessor for SingleUseGKDaemonProxyDataUpdateDelegate();
    uint64_t v10 = (char *)objc_allocWithZone(updated);
    *(_DWORD *)&v10[OBJC_IVAR____TtC22SubscribePageExtensionP33_77955017F366B854A4892EB35CDC853540SingleUseGKDaemonProxyDataUpdateDelegate_updateType] = 4;
    uint64_t v11 = (void (**)(uint64_t))&v10[OBJC_IVAR____TtC22SubscribePageExtensionP33_77955017F366B854A4892EB35CDC853540SingleUseGKDaemonProxyDataUpdateDelegate_updateBlock];
    *uint64_t v11 = sub_10074AA58;
    v11[1] = v7;
    uint64_t v12 = (void (**)())&v10[OBJC_IVAR____TtC22SubscribePageExtensionP33_77955017F366B854A4892EB35CDC853540SingleUseGKDaemonProxyDataUpdateDelegate_cleanupBlock];
    *uint64_t v12 = sub_10074AA64;
    v12[1] = (void (*)())v8;
    v26.receiver = v10;
    v26.super_class = updated;
    swift_bridgeObjectRetain();
    id v13 = objc_msgSendSuper2(&v26, "init");
    uint64_t v14 = self;
    id v15 = [v14 daemonProxy];
    [v15 addDataUpdateDelegate:v13];

    uint64_t v16 = *(void **)(v2
                   + OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate);
    *(void *)(v2
              + OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate) = v13;
    id v17 = v13;

    if (sub_100759900())
    {
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v19 = (char *)objc_allocWithZone(updated);
      *(_DWORD *)&v19[OBJC_IVAR____TtC22SubscribePageExtensionP33_77955017F366B854A4892EB35CDC853540SingleUseGKDaemonProxyDataUpdateDelegate_updateType] = 21;
      uint64_t v20 = (uint64_t (**)(uint64_t))&v19[OBJC_IVAR____TtC22SubscribePageExtensionP33_77955017F366B854A4892EB35CDC853540SingleUseGKDaemonProxyDataUpdateDelegate_updateBlock];
      *uint64_t v20 = sub_10074A498;
      v20[1] = 0;
      uint64_t v21 = (void (**)())&v19[OBJC_IVAR____TtC22SubscribePageExtensionP33_77955017F366B854A4892EB35CDC853540SingleUseGKDaemonProxyDataUpdateDelegate_cleanupBlock];
      char *v21 = sub_10074AA88;
      v21[1] = (void (*)())v18;
      v25.receiver = v19;
      v25.super_class = updated;
      id v22 = objc_msgSendSuper2(&v25, "init");
      id v23 = [v14 daemonProxy];
      id v24 = v22;
      [v23 addDataUpdateDelegate:v24];

      id v17 = *(id *)(v3
                  + OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate);
      *(void *)(v3
                + OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate) = v24;
    }
  }
}

char *sub_100749F58(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = &v4[OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_itemLayoutContext];
  uint64_t v11 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate] = 0;
  *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate] = 0;
  id v12 = objc_allocWithZone((Class)sub_100756710());
  id v13 = v4;
  id v14 = objc_msgSend(v12, "initWithFrame:", a1, a2, a3, a4);
  *(void *)&v13[OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_smallPlayerCard] = v14;
  id v15 = (void *)sub_100756680();
  id v16 = [self systemGrayColor];
  [v15 setTintColor:v16];

  v21.receiver = v13;
  v21.super_class = ObjectType;
  id v17 = (char *)objc_msgSendSuper2(&v21, "initWithFrame:", a1, a2, a3, a4);
  id v18 = [v17 contentView];
  id v19 = *(id *)&v17[OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_smallPlayerCard];
  [v18 addSubview:v19];

  return v17;
}

void sub_10074A300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = sub_1007675F0();
  uint64_t v15 = v6;
  sub_1007688D0();
  if (*(void *)(a1 + 16) && (unint64_t v7 = sub_1004237C8((uint64_t)v16), (v8 & 1) != 0))
  {
    sub_10000FBDC(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v17);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_10001A544((uint64_t)v16);
  if (!*((void *)&v18 + 1))
  {
    sub_10000FED8((uint64_t)&v17, &qword_1009360F0);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  if (v14 == a2 && v15 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_100768B50();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      return;
    }
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = (void *)Strong;
    id v12 = objc_retain(*(id *)(Strong
                            + OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_smallPlayerCard));

    id v13 = (void (*)(void))sub_1007566B0();
    if (v13)
    {
      v13();
      sub_10001A4D0((uint64_t)v13);
    }
  }
}

uint64_t sub_10074A498(uint64_t a1)
{
  sub_1007675F0();
  sub_1007688D0();
  if (*(void *)(a1 + 16) && (unint64_t v2 = sub_1004237C8((uint64_t)v5), (v3 & 1) != 0))
  {
    sub_10000FBDC(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v6);
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  sub_10001A544((uint64_t)v5);
  if (!*((void *)&v7 + 1)) {
    return sub_10000FED8((uint64_t)&v6, &qword_1009360F0);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    sub_10074AAAC();
    sub_100767B00();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10074A598(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *a2;
    uint64_t v5 = *(void **)&Strong[*a2];
    *(void *)&Strong[v4] = 0;
  }
}

uint64_t sub_10074A66C()
{
  return type metadata accessor for SmallContactCardCollectionViewCell();
}

uint64_t type metadata accessor for SmallContactCardCollectionViewCell()
{
  uint64_t result = qword_10095B5F0;
  if (!qword_10095B5F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10074A6C0()
{
  sub_10001A3E4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

id sub_10074A834()
{
  id v1 = [self daemonProxy];
  [v1 removeDataUpdateDelegate:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for SingleUseGKDaemonProxyDataUpdateDelegate();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SingleUseGKDaemonProxyDataUpdateDelegate()
{
  return self;
}

uint64_t sub_10074A9E0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10074AA18()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10074AA58(uint64_t a1)
{
  sub_10074A300(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_10074AA64()
{
  sub_10074A598(v0, &OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate);
}

void sub_10074AA88()
{
  sub_10074A598(v0, &OBJC_IVAR____TtC22SubscribePageExtension34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate);
}

unint64_t sub_10074AAAC()
{
  unint64_t result = qword_10095B650;
  if (!qword_10095B650)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10095B650);
  }
  return result;
}

id sub_10074AAEC(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = sub_10000FB44(&qword_10095B6B8);
  __chkstk_darwin(v10, v11);
  *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViews] = _swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViewCount] = 0;
  type metadata accessor for TodayCardChinLockupListIconView(0);
  id v12 = v4;
  sub_100764CC0();
  sub_10074CC20();
  sub_1007659A0();
  swift_weakInit();
  id v13 = &v12[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsUpdateBlock];
  *(void *)id v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = &v12[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_todayCardStyle];
  uint64_t v15 = enum case for TodayCard.Style.light(_:);
  uint64_t v16 = sub_1007647E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  long long v17 = &v12[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_clickActionHandler];
  *(void *)long long v17 = 0;
  *((void *)v17 + 1) = 0;
  v12[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded] = 0;
  v12[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory] = 7;
  v12[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_wantsCardConsistentMargins] = 0;

  v23.receiver = v12;
  v23.super_class = ObjectType;
  id v18 = objc_msgSendSuper2(&v23, "initWithFrame:", a1, a2, a3, a4);
  [v18 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraExtraLarge];
  objc_msgSend(v18, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  sub_10000FB44((uint64_t *)&unk_100935E00);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1007B8540;
  *(void *)(v19 + 32) = sub_100765FF0();
  *(void *)(v19 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
  v22[3] = ObjectType;
  v22[0] = v18;
  id v20 = v18;
  sub_1007681B0();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v22);
  return v20;
}

void sub_10074ADEC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1007647E0();
  uint64_t v3 = *(void *)(v2 - 8);
  *(void *)&double v5 = __chkstk_darwin(v2, v4).n128_u64[0];
  long long v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded] & 1) != 0
    || v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory] != 6
    || (id v8 = objc_msgSend(v0, "traitCollection", v5),
        char v9 = sub_100767D10(),
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = &v1[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_todayCardStyle];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v7, v10, v2);
    id v11 = (id)sub_1005870A4((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
  else
  {
    id v11 = [self clearColor];
  }
  [v1 setBackgroundColor:v11];
}

uint64_t sub_10074AF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v9 = v6;
  uint64_t v52 = a6;
  uint64_t v10 = a5;
  uint64_t v50 = a2;
  int v12 = a5;
  uint64_t v13 = sub_1007647E0();
  uint64_t v14 = *(void *)(v13 - 8);
  __n128 v16 = __chkstk_darwin(v13, v15);
  id v18 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v19 = v9[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory];
  v9[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory] = v10;
  if (v12 == 7)
  {
    if (v19 == 7) {
      goto LABEL_6;
    }
LABEL_5:
    [v9 setNeedsLayout];
    goto LABEL_6;
  }
  if (v19 == 7) {
    goto LABEL_5;
  }
  switch(v10)
  {
    case 6u:
      if (v19 != 6) {
        goto LABEL_5;
      }
      break;
    case 5u:
      if (v19 != 5) {
        goto LABEL_5;
      }
      break;
    case 4u:
      if (v19 != 4) {
        goto LABEL_5;
      }
      break;
    default:
      if ((v19 - 7) > 0xFCu || v19 != v10) {
        goto LABEL_5;
      }
      break;
  }
LABEL_6:
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v14 + 16))(v18, a4, v13, v16);
  id v20 = &v9[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_todayCardStyle];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v20, v18, v13);
  swift_endAccess();
  sub_10074ADEC();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
  unint64_t v21 = sub_100760C50();
  uint64_t v22 = v21;
  unint64_t v23 = v21 >> 62;
  if (!(v21 >> 62))
  {
    if (*(uint64_t *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 6) {
      uint64_t v24 = 6;
    }
    else {
      uint64_t v24 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    goto LABEL_10;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_100768A60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_100768A60();
    uint64_t result = swift_bridgeObjectRelease();
    if (v43 < 0) {
      break;
    }
    if (v42 >= 6) {
      uint64_t v45 = 6;
    }
    else {
      uint64_t v45 = v42;
    }
    if (v42 >= 0) {
      uint64_t v24 = v45;
    }
    else {
      uint64_t v24 = 6;
    }
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_100768A60();
    swift_bridgeObjectRelease();
    if (v32 < v24)
    {
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
LABEL_10:
    if ((v22 & 0xC000000000000001) != 0 && v24)
    {
      sub_100763C10();
      Swift::Int v25 = 0;
      do
      {
        Swift::Int v26 = v25 + 1;
        sub_100768940(v25);
        Swift::Int v25 = v26;
      }
      while (v24 != v26);
    }
    if (v23)
    {
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_100768A70();
      id v8 = v28;
      uint64_t v27 = v29;
      unint64_t v31 = v30;
      swift_bridgeObjectRelease_n();
      uint64_t v24 = v31 >> 1;
    }
    else
    {
      uint64_t v27 = 0;
      unint64_t v23 = v22 & 0xFFFFFFFFFFFFFF8;
      id v8 = (void *)((v22 & 0xFFFFFFFFFFFFFF8) + 32);
    }
    uint64_t v32 = v24 - v27;
    if (__OFSUB__(v24, v27)) {
      goto LABEL_65;
    }
    sub_10074B5E0(v24 - v27, v52);
    *(void *)&v9[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViewCount] = v32;
    uint64_t v33 = (NSString *)[v9 traitCollection];
    [v9 bounds];
    double Width = CGRectGetWidth(v59);
    sub_10074DE24(v33, v10, v9[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded], (uint64_t)&v58, Width);

    uint64_t v35 = (uint64_t *)&v9[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViews];
    swift_beginAccess();
    uint64_t v10 = *v35;
    uint64_t v48 = v9;
    v47[1] = v23;
    if (v27 == v24)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
LABEL_69:
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      sub_10074E2B8((uint64_t)&v58);
      uint64_t v46 = v48;
      sub_10074ADEC();
      [v46 setNeedsLayout];
      return swift_unknownObjectRelease();
    }
    if (v27 >= v24) {
      goto LABEL_66;
    }
    uint64_t v32 = v27;
    uint64_t v7 = v8[v27];
    unint64_t v57 = (unint64_t)v10 >> 62;
    if (!((unint64_t)v10 >> 62))
    {
      uint64_t v22 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_retain();
      if (!v22) {
        goto LABEL_68;
      }
      goto LABEL_23;
    }
LABEL_67:
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v22 = sub_100768A60();
    swift_bridgeObjectRelease();
    if (!v22)
    {
LABEL_68:
      swift_release();
      goto LABEL_69;
    }
LABEL_23:
    unint64_t v36 = 0;
    unint64_t v56 = v10 & 0xC000000000000001;
    uint64_t v37 = v10 & 0xFFFFFFFFFFFFFF8;
    uint64_t v51 = v10 & 0xFFFFFFFFFFFFFF8;
    if (v10 < 0) {
      uint64_t v37 = v10;
    }
    uint64_t v49 = v37;
    uint64_t v55 = ~v32 + v24;
    uint64_t v53 = (uint64_t)&v8[v32 + 1];
    uint64_t v54 = v32 + 1;
    while (1)
    {
      if (v56)
      {
        uint64_t v38 = (void *)sub_100768950();
      }
      else
      {
        if (v36 >= *(void *)(v51 + 16)) {
          goto LABEL_55;
        }
        uint64_t v38 = *(id *)(v10 + 8 * v36 + 32);
      }
      id v8 = v38;
      unint64_t v23 = v36 + 1;
      if (__OFADD__(v36, 1)) {
        break;
      }
      uint64_t v22 = v7;
      uint64_t v39 = sub_100763B50();
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = sub_100763A10();
        char v9 = (unsigned char *)v32;
        uint64_t v22 = (uint64_t)v8;
        sub_10074BA28(v40, v41, v50);
        swift_release();

        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
      }
      if (v55 == v36) {
        goto LABEL_69;
      }
      if ((uint64_t)(v54 + v36) < v32 || (uint64_t)(v54 + v36) >= v24) {
        goto LABEL_54;
      }
      uint64_t v7 = *(void *)(v53 + 8 * v36);
      if (v57)
      {
        swift_bridgeObjectRetain();
        swift_retain();
        uint64_t v22 = sub_100768A60();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v22 = *(void *)(v51 + 16);
        swift_retain();
      }
      ++v36;
      if (v23 == v22) {
        goto LABEL_68;
      }
    }
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_10074B5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (uint64_t *)&v3[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViews];
  swift_beginAccess();
  if ((unint64_t)*v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100768A60();
    swift_bridgeObjectRelease();
    if (v7 == a1) {
      return;
    }
  }
  else if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) == a1)
  {
    return;
  }
  if ((unint64_t)*v6 >> 62) {
    goto LABEL_34;
  }
  uint64_t v8 = *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_7:
  uint64_t v9 = *v6;
  unint64_t v10 = (unint64_t)*v6 >> 62;
  if (v8 < a1)
  {
    if (v10)
    {
      swift_bridgeObjectRetain();
      a2 = sub_100768A60();
      swift_bridgeObjectRelease();
      uint64_t v11 = a1 - a2;
      if (!__OFSUB__(a1, a2))
      {
LABEL_10:
        if ((v11 & 0x8000000000000000) == 0)
        {
          for (; v11; --v11)
          {
            swift_beginAccess();
            sub_10000FB44(&qword_10095B7B8);
            sub_100765970();
            swift_endAccess();
            [v3 addSubview:v23];
            swift_beginAccess();
            id v12 = v23;
            sub_1007677E0();
            if (*(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100767820();
            }
            sub_1007678A0();
            sub_100767810();
            swift_endAccess();
          }
          return;
        }
        goto LABEL_38;
      }
    }
    else
    {
      a2 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v11 = a1 - a2;
      if (!__OFSUB__(a1, a2)) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (!v10)
  {
    uint64_t v13 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v14 = v13 - a1;
    if (!__OFSUB__(v13, a1)) {
      goto LABEL_18;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_39:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_100768A60();
  swift_bridgeObjectRelease();
  uint64_t v14 = v22 - a1;
  if (__OFSUB__(v22, a1)) {
    goto LABEL_41;
  }
LABEL_18:
  if (v14 < 0)
  {
LABEL_42:
    __break(1u);
    return;
  }
  if (v14)
  {
    v3 += OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViewReusePool;
    do
    {
      swift_beginAccess();
      a1 = *v6;
      if ((unint64_t)*v6 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_100768A60();
        swift_bridgeObjectRelease();
        if (!v21)
        {
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_100768A60();
          swift_bridgeObjectRelease();
          goto LABEL_7;
        }
      }
      else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_32;
      }
      a1 = *v6;
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *uint64_t v6 = a1;
      if (!isUniquelyReferenced_nonNull_bridgeObject || a1 < 0 || (a1 & 0x4000000000000000) != 0)
      {
        a1 = sub_1006CB77C(a1);
        *uint64_t v6 = a1;
      }
      uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v16) {
        goto LABEL_33;
      }
      uint64_t v17 = v16 - 1;
      id v18 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 8 * v17 + 0x20);
      *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v17;
      sub_100767810();
      swift_endAccess();
      if (a2)
      {
        int v19 = *(void **)&v18[OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView];
        sub_100758360();
        sub_1005611E8((unint64_t *)&qword_100935020, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
        id v20 = v19;
        sub_1007591B0();
      }
      [v18 removeFromSuperview];
      unint64_t v23 = v18;
      swift_beginAccess();
      sub_10000FB44(&qword_10095B7B8);
      sub_100765990();
      swift_endAccess();

      --v14;
    }
    while (v14);
  }
}

uint64_t sub_10074BA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[0] = a3;
  uint64_t v5 = sub_10000FB44(&qword_1009443B0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100763FA0();
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v11 = sub_100763F20();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100763F30();
  sub_100763F00();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  sub_100763FF0();
  uint64_t v16 = *(void **)(v3 + OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView);
  sub_100763FB0();
  sub_100758300();
  objc_msgSend(v16, "setContentMode:", sub_100763E30(), v21[0]);
  sub_10075CD00();
  sub_100758340();
  if (!sub_100763E80())
  {
    sub_100010808();
    sub_1007682A0();
  }
  sub_1007581B0();
  sub_100758360();
  sub_1005611E8((unint64_t *)&qword_100935020, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
  sub_100759150();
  if (a2)
  {
    v21[1] = a2;
    sub_100763930();
    sub_100758690();
    sub_1005611E8(&qword_100939CD8, (void (*)(uint64_t))&type metadata accessor for Action);
    swift_retain();
    sub_100766BB0();
    swift_release();
    swift_release();
    uint64_t v17 = sub_10000FB44((uint64_t *)&unk_1009443A0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 0, 1, v17);
  }
  else
  {
    swift_release();
    uint64_t v18 = sub_10000FB44((uint64_t *)&unk_1009443A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  }
  uint64_t v19 = v3 + OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_clickAction;
  swift_beginAccess();
  sub_1001A5074((uint64_t)v8, v19);
  return swift_endAccess();
}

id sub_10074BDF4@<X0>(void *a1@<X8>)
{
  type metadata accessor for TodayCardChinLockupListIconView(0);
  id result = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *a1 = result;
  return result;
}

uint64_t sub_10074BE34()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1007649F0();
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  *(void *)&double v5 = __chkstk_darwin(v3, v4).n128_u64[0];
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31.receiver = v1;
  v31.super_class = ObjectType;
  objc_msgSendSuper2(&v31, "layoutSubviews", v5);
  uint64_t v8 = (NSString *)[v1 traitCollection];
  [v1 bounds];
  double Width = CGRectGetWidth(v52);
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory;
  uint64_t v11 = OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded;
  sub_10074DE24(v8, v1[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory], v1[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded], (uint64_t)v32, Width);
  long long v27 = v32[1];
  long long v28 = v32[0];
  uint64_t v12 = v33;
  uint64_t v13 = v34;
  char v14 = v35;
  long long v26 = v36;
  uint64_t v15 = v37;
  uint64_t v16 = v38;
  uint64_t v17 = v39;

  swift_beginAccess();
  unint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_1004FABD4(v18);
  swift_bridgeObjectRelease();
  char v20 = v1[v10];
  char v21 = v1[v11];
  long long v40 = v28;
  long long v41 = v27;
  uint64_t v42 = v12;
  uint64_t v43 = v13;
  char v44 = v14;
  long long v45 = v26;
  uint64_t v46 = v15;
  uint64_t v47 = v16;
  uint64_t v48 = v17;
  uint64_t v49 = v19;
  char v50 = v20;
  char v51 = v21;
  [v1 bounds];
  sub_1006B1F18(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v30);
  uint64_t v22 = &v1[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsUpdateBlock];
  uint64_t result = swift_beginAccess();
  uint64_t v24 = *(void (**)(uint64_t))v22;
  if (*(void *)v22)
  {
    uint64_t v25 = swift_retain();
    v24(v25);
    return sub_10001A4D0((uint64_t)v24);
  }
  return result;
}

double sub_10074C0F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (NSString *)[v0 traitCollection];
  [v1 bounds];
  double Width = CGRectGetWidth(v49);
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory;
  uint64_t v5 = OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded;
  sub_10074DE24(v2, *((unsigned char *)v1 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory), *((unsigned char *)v1 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded), (uint64_t)v30, Width);
  long long v28 = v30[1];
  long long v29 = v30[0];
  uint64_t v6 = v31;
  uint64_t v7 = v32;
  char v8 = v33;
  long long v27 = v34;
  uint64_t v9 = v35;
  uint64_t v10 = v36;
  uint64_t v11 = v37;

  swift_beginAccess();
  unint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_1004FABD4(v12);
  swift_bridgeObjectRelease();
  char v14 = *((unsigned char *)v1 + v4);
  char v15 = *((unsigned char *)v1 + v5);
  v38[0] = v29;
  v38[1] = v28;
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  char v41 = v8;
  long long v42 = v27;
  uint64_t v43 = v9;
  uint64_t v44 = v10;
  uint64_t v45 = v11;
  uint64_t v46 = v13;
  char v47 = v14;
  char v48 = v15;
  id v16 = [v1 traitCollection];
  if (qword_100930D08 != -1) {
    swift_once();
  }
  sub_100246774(v16, (uint64_t)&xmmword_100991FD0, 1);
  sub_100767D10();
  sub_100767AC0();
  sub_100767D10();
  sub_100767AC0();

  id v17 = [v1 traitCollection];
  sub_1007656F0();
  sub_10000FB44(&qword_100934A70);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1007B8800;
  *(void *)(v18 + 32) = v17;
  id v19 = v17;
  char v20 = (void *)sub_100765700();
  sub_10074DA38(v20, (uint64_t)v38);
  double v22 = v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if ((*((unsigned char *)v1 + v5) & 1) != 0
    || *((unsigned char *)v1 + v4) != 6
    || (id v23 = [v1 traitCollection],
        char v24 = sub_100767D10(),
        v23,
        (v24 & 1) != 0))
  {
    id v25 = objc_msgSend(v1, "traitCollection", v27, v28, v29);
    sub_100246774(v25, (uint64_t)&xmmword_100991FD0, 1);
    sub_100767D10();
    sub_100767AC0();
    sub_100767D10();
    sub_100767AC0();
  }
  return v22;
}

uint64_t sub_10074C4AC()
{
  uint64_t v1 = (unint64_t *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViews);
  swift_beginAccess();
  unint64_t v2 = *v1;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_100768A60();
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        uint64_t v6 = (char *)sub_100768950();
      }
      else {
        uint64_t v6 = (char *)*(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      ++v5;
      char v8 = *(void **)&v6[OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView];
      sub_100758360();
      sub_1005611E8((unint64_t *)&qword_100935020, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
      id v9 = v8;
      sub_1007591B0();
    }
    while (v3 != v5);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_10074C620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_10000FB44((uint64_t *)&unk_1009369D0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100766E20();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  unint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v14 = (void *)Strong;
    swift_beginAccess();
    uint64_t v15 = swift_weakLoadStrong();
    if (!v15)
    {

      return;
    }
    uint64_t v16 = v15;
    sub_10000FE30(a3, (uint64_t)v27);
    sub_10000FB44(&qword_100934500);
    sub_100764850();
    if (swift_dynamicCast())
    {
      uint64_t v17 = sub_100764830();
      swift_release();
      if (v17)
      {
        sub_100760C60();
        if (swift_dynamicCastClass())
        {
          unint64_t v18 = sub_100760C50();
          unint64_t v19 = v18;
          uint64_t v25 = v16;
          v22[1] = v17;
          if (v18 >> 62)
          {
            uint64_t v20 = sub_100768A60();
            if (v20) {
              goto LABEL_8;
            }
          }
          else
          {
            uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v20)
            {
LABEL_8:
              if (v20 < 1)
              {
                __break(1u);
                return;
              }
              uint64_t v21 = 0;
              unint64_t v26 = v19 & 0xC000000000000001;
              id v23 = (void (**)(char *, uint64_t))(v9 + 8);
              char v24 = (void (**)(char *, char *, uint64_t))(v9 + 32);
              do
              {
                if (v26) {
                  sub_100768950();
                }
                else {
                  swift_retain();
                }
                sub_100763AF0();
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
                {
                  swift_release();
                  sub_10000FED8((uint64_t)v7, (uint64_t *)&unk_1009369D0);
                }
                else
                {
                  (*v24)(v12, v7, v8);
                  [v14 frame];
                  sub_10075E280();
                  swift_release();
                  (*v23)(v12, v8);
                }
                ++v21;
              }
              while (v20 != v21);
            }
          }

          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_20;
        }
        swift_release();
      }
    }

LABEL_20:
    swift_release();
  }
}

uint64_t sub_10074CA80()
{
  return type metadata accessor for TodayCardChinLockupListView(0);
}

uint64_t type metadata accessor for TodayCardChinLockupListView(uint64_t a1)
{
  return sub_100063F74(a1, (uint64_t *)&unk_10095B6A0);
}

void sub_10074CAA8()
{
  sub_10074CBB8();
  if (v0 <= 0x3F)
  {
    sub_1007647E0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10074CBB8()
{
  if (!qword_10095B6B0)
  {
    sub_10000FC88(&qword_10095B6B8);
    sub_10074CC20();
    unint64_t v0 = sub_1007659B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10095B6B0);
    }
  }
}

unint64_t sub_10074CC20()
{
  unint64_t result = qword_10095B6C0;
  if (!qword_10095B6C0)
  {
    sub_10000FC88(&qword_10095B6B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10095B6C0);
  }
  return result;
}

uint64_t sub_10074CC7C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_10074AF90(*a1, a2, a3, a4, a5, a6);
}

void sub_10074CC84(char a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded) = a1;
  sub_10074ADEC();
}

uint64_t sub_10074CC94()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_wantsCardConsistentMargins);
}

uint64_t sub_10074CCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_clickActionHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_clickActionHandler);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_10001A4D0(v4);
}

uint64_t sub_10074CCC8()
{
  return swift_weakLoadStrong();
}

uint64_t sub_10074CD14()
{
  return swift_release();
}

void (*sub_10074CD70(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsCalculator;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_weakLoadStrong();
  return sub_1000A0668;
}

uint64_t sub_10074CDF4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsUpdateBlock);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_10001A4E0(*v1);
  return v2;
}

uint64_t sub_10074CE50(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsUpdateBlock);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_10001A4D0(v6);
}

uint64_t (*sub_10074CEB0())()
{
  return j__swift_endAccess;
}

void (*sub_10074CF0C(uint64_t a1))()
{
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  sub_10000FE30(a1, (uint64_t)v6);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  sub_10000FCD0(v6, v4 + 32);
  return sub_10074E39C;
}

char *sub_10074CFD4(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView;
  sub_100758360();
  uint64_t v11 = v4;
  *(void *)&v4[v10] = sub_100758160();
  unint64_t v12 = &v11[OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_clickAction];
  uint64_t v13 = sub_10000FB44((uint64_t *)&unk_1009443A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);

  v21.receiver = v11;
  v21.super_class = ObjectType;
  char v14 = (char *)objc_msgSendSuper2(&v21, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v15 = OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView;
  uint64_t v16 = *(void **)&v14[OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_artworkView];
  uint64_t v17 = v14;
  [v17 addSubview:v16];
  id v18 = v16;
  sub_100758240();

  [*(id *)&v14[v15] setUserInteractionEnabled:0];
  id v19 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v17 action:"handleTap"];
  [v19 setDelaysTouchesBegan:1];
  [v17 addGestureRecognizer:v19];

  return v17;
}

uint64_t sub_10074D2F0()
{
  uint64_t v1 = sub_100766800();
  uint64_t v54 = *(void *)(v1 - 8);
  uint64_t v55 = v1;
  __chkstk_darwin(v1, v2);
  char v51 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100767040();
  uint64_t v4 = *(void *)(v49 - 8);
  __chkstk_darwin(v49, v5);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = sub_10000FB44((uint64_t *)&unk_100933BF0);
  uint64_t v52 = *(void *)(v12 - 8);
  uint64_t v53 = v12;
  __chkstk_darwin(v12, v13);
  char v50 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000FB44((uint64_t *)&unk_100936B80);
  __chkstk_darwin(v15 - 8, v16);
  id v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000FB44(&qword_1009443B0);
  __chkstk_darwin(v19 - 8, v20);
  double v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10000FB44((uint64_t *)&unk_1009443A0);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23, v25);
  long long v27 = (char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v0 + OBJC_IVAR____TtC22SubscribePageExtension31TodayCardChinLockupListIconView_clickAction;
  swift_beginAccess();
  sub_1001FB3FC(v28, (uint64_t)v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    long long v29 = &qword_1009443B0;
    uint64_t v30 = (uint64_t)v22;
    return sub_10000FED8(v30, v29);
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v27, v22, v23);
  sub_10075A380();
  sub_100758680();
  swift_release();
  uint64_t v31 = sub_10000FB44((uint64_t *)&unk_100933C00);
  uint64_t v32 = *(void *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v18, 1, v31) == 1)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
    long long v29 = (uint64_t *)&unk_100936B80;
    uint64_t v30 = (uint64_t)v18;
    return sub_10000FED8(v30, v29);
  }
  uint64_t v48 = v31;
  sub_10075A390();
  uint64_t v34 = sub_10075A380();
  uint64_t v45 = v7;
  uint64_t v35 = v34;
  uint64_t v36 = v56[5];
  v56[3] = sub_100763930();
  v56[4] = sub_1005611E8((unint64_t *)&qword_100936B90, (void (*)(uint64_t))&type metadata accessor for Action);
  v56[0] = v36;
  swift_retain();
  uint64_t v46 = v35;
  sub_1004017B0();
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v47 = v32;
  uint64_t v38 = v49;
  v37(v45, v11, v49);
  uint64_t v39 = v51;
  sub_1007667E0();
  sub_100766C40();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v39, v55);
  uint64_t v40 = v50;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v50, v11, v38);
  uint64_t v42 = v52;
  uint64_t v41 = v53;
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v40, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v53);
  uint64_t v43 = v48;
  sub_100766D00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v56);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v18, v43);
}

uint64_t sub_10074D970()
{
  return type metadata accessor for TodayCardChinLockupListIconView(0);
}

uint64_t type metadata accessor for TodayCardChinLockupListIconView(uint64_t a1)
{
  return sub_100063F74(a1, (uint64_t *)&unk_10095B6F8);
}

void sub_10074D998()
{
  sub_1001F803C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10074DA38(void *a1, uint64_t a2)
{
  id v4 = [a1 traitCollection];
  sub_1006B1054();

  sub_100768090();
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  id v9 = [a1 traitCollection];
  LOBYTE(v4) = sub_100767D10();

  if (v4) {
    sub_1006B1190(0, v12, 0.0, 0.0, v6, v8);
  }
  else {
    sub_1006B1A70(0, (uint64_t)v12, 0.0, 0.0, v6, v8);
  }
  sub_1000E1628((uint64_t)v12);
  sub_1007680B0();
  id v10 = [a1 traitCollection];
  uint64_t v11 = v10;
  if ((*(unsigned char *)(a2 + 105) & 1) == 0 && *(unsigned char *)(a2 + 104) == 6)
  {
    sub_100767D10();
  }
  else
  {
  }
}

void sub_10074DC30(uint64_t a1, void *a2)
{
  if (sub_100767D10())
  {
    id v4 = [a2 preferredContentSizeCategory];
    double v5 = UIContentSizeCategoryAccessibilityMedium;
    CGFloat v6 = UIContentSizeCategoryAccessibilityExtraLarge;
    if ((sub_100767E80() & 1) == 0)
    {
      __break(1u);
      goto LABEL_17;
    }
    if (sub_100767E70())
    {
      double v7 = v6;
      id v8 = v4;
      char v9 = sub_100767E80();

      if (v9)
      {
        if (qword_10092FFB0 == -1) {
          return;
        }
LABEL_17:
        swift_once();
        return;
      }
    }
    else
    {
    }
    if (qword_100930D08 != -1) {
      goto LABEL_16;
    }
    while (1)
    {
      sub_100246774(a2, (uint64_t)&xmmword_100991FD0, 1);
      if (!__OFSUB__(a1, 1)) {
        break;
      }
      __break(1u);
LABEL_16:
      swift_once();
    }
  }
  else if (qword_100930D08 != -1)
  {
    goto LABEL_17;
  }
}

unint64_t sub_10074DE24@<X0>(UIContentSizeCategory a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>)
{
  if ((sub_100767D10() & 1) == 0)
  {
    id v17 = (id)ASKDeviceTypeGetCurrent();
    uint64_t v18 = sub_1007675F0();
    uint64_t v20 = v19;
    double v16 = 16.0;
    if (v18 != sub_1007675F0() || v20 != v21)
    {
      if (sub_100768B50()) {
        double v16 = 16.0;
      }
      else {
        double v16 = 10.0;
      }
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = 1;
    sub_10074DC30(1, a1);
    a5 = v23;
    uint64_t v25 = v24;
    if (((a2 != 7) & ~a3 & (a2 == 6)) != 0) {
      unint64_t v26 = -1;
    }
    else {
      unint64_t v26 = 0;
    }
    int8x16_t v27 = (int8x16_t)vdupq_n_s64(v26);
    int8x16_t v47 = vbslq_s8(v27, *(int8x16_t *)&UIEdgeInsetsZero.top, (int8x16_t)xmmword_1007E6350);
    int8x16_t v46 = vbslq_s8(v27, *(int8x16_t *)&UIEdgeInsetsZero.bottom, (int8x16_t)xmmword_1007E6350);
    sub_10000FB44(&qword_10095B7B0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1007B8200;
    *(void *)(inited + 32) = 2;
    *(_OWORD *)(inited + 40) = xmmword_1007E6360;
    *(_OWORD *)(inited + 56) = xmmword_1007E6360;
    *(void *)(inited + 72) = 3;
    *(_OWORD *)(inited + 80) = xmmword_1007E6370;
    *(_OWORD *)(inited + 96) = xmmword_1007E6370;
    *(void *)(inited + 112) = 4;
    *(_OWORD *)(inited + 120) = xmmword_1007E6380;
    *(_OWORD *)(inited + 136) = xmmword_1007E6380;
    unint64_t v29 = sub_10042504C(inited);
    unint64_t result = swift_setDeallocating();
    long long v32 = (__int128)v46;
    long long v31 = (__int128)v47;
    char v33 = 0;
    double v34 = 22.0;
    double v35 = 8.0;
    goto LABEL_34;
  }
  id v10 = [(NSString *)a1 preferredContentSizeCategory];
  uint64_t v11 = UIContentSizeCategoryAccessibilityMedium;
  uint64_t v12 = UIContentSizeCategoryAccessibilityExtraLarge;
  if ((sub_100767E80() & 1) == 0)
  {
    __break(1u);
    goto LABEL_36;
  }
  if ((sub_100767E70() & 1) == 0)
  {

    double v16 = 20.0;
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  id v14 = v10;
  char v15 = sub_100767E80();

  double v16 = 20.0;
  if ((v15 & 1) == 0) {
    goto LABEL_21;
  }
  if (qword_10092FFB0 != -1) {
    goto LABEL_38;
  }
  while (1)
  {
    if (*(double *)&qword_10098F360 >= a5) {
      double v16 = 10.0;
    }
    else {
      double v16 = 16.0;
    }
LABEL_21:
    id v36 = [(NSString *)a1 preferredContentSizeCategory];
    uint64_t v11 = (uint64_t)(id)v11;
    uint64_t v12 = v12;
    if ((sub_100767E80() & 1) == 0)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (sub_100767E70())
    {
      uint64_t v37 = v12;
      id v38 = v36;
      char v39 = sub_100767E80();

      if (v39)
      {
        uint64_t v11 = 1;
        goto LABEL_27;
      }
    }
    else
    {
    }
    uint64_t v11 = 2;
LABEL_27:
    sub_10074DC30(v11, a1);
    a5 = v40;
    uint64_t v25 = v41;
    uint64_t v12 = (NSString *)[(NSString *)a1 preferredContentSizeCategory];
    a1 = UIContentSizeCategoryAccessibilityExtraExtraLarge;
    uint64_t v42 = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
    if (sub_100767E80()) {
      break;
    }
LABEL_37:
    __break(1u);
LABEL_38:
    swift_once();
  }
  if (sub_100767E70())
  {
    uint64_t v43 = v42;
    uint64_t v44 = v12;
    char v45 = sub_100767E80();

    if (v45)
    {
      char v33 = 1;
      goto LABEL_33;
    }
  }
  else
  {
  }
  char v33 = 0;
LABEL_33:
  unint64_t result = sub_10042504C((uint64_t)_swiftEmptyArrayStorage);
  long long v31 = xmmword_1007E6390;
  unint64_t v29 = result;
  double v35 = v16;
  double v34 = v16;
  long long v32 = xmmword_1007E6390;
LABEL_34:
  *(double *)a4 = a5;
  *(void *)(a4 + 8) = v25;
  *(double *)(a4 + 16) = v16;
  *(double *)(a4 + 24) = v35;
  *(double *)(a4 + 32) = v34;
  *(void *)(a4 + 40) = v11;
  *(unsigned char *)(a4 + 48) = v33;
  *(_OWORD *)(a4 + 56) = v31;
  *(_OWORD *)(a4 + 72) = v32;
  *(void *)(a4 + 88) = v29;
  return result;
}

uint64_t sub_10074E2B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10074E2E4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10074E31C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10074E354()
{
  swift_release();
  swift_release();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v0 + 32);

  return _swift_deallocObject(v0, 72, 7);
}

void sub_10074E39C()
{
  sub_10074C620(*(void *)(v0 + 16), *(void *)(v0 + 24), v0 + 32);
}

void sub_10074E3A8()
{
  uint64_t v1 = sub_10000FB44(&qword_10095B6B8);
  __chkstk_darwin(v1, v2);
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViews] = _swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_lockupIconViewCount] = 0;
  type metadata accessor for TodayCardChinLockupListIconView(0);
  sub_100764CC0();
  sub_10074CC20();
  sub_1007659A0();
  swift_weakInit();
  uint64_t v3 = &v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_impressionsUpdateBlock];
  *uint64_t v3 = 0;
  v3[1] = 0;
  id v4 = &v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_todayCardStyle];
  uint64_t v5 = enum case for TodayCard.Style.light(_:);
  uint64_t v6 = sub_1007647E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  double v7 = &v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_clickActionHandler];
  void *v7 = 0;
  v7[1] = 0;
  v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_isExpanded] = 0;
  v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_sizeCategory] = 7;
  v0[OBJC_IVAR____TtC22SubscribePageExtension27TodayCardChinLockupListView_wantsCardConsistentMargins] = 0;

  sub_100768A40();
  __break(1u);
}

void sub_10074E56C()
{
  sub_10001A3E4();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t sub_10074E628()
{
  return *(unsigned __int8 *)(v0 + qword_100996490);
}

double sub_10074E638()
{
  return *(double *)(v0 + qword_100996498);
}

uint64_t sub_10074E650()
{
  return *(unsigned __int8 *)(v0 + qword_1009964A0);
}

void sub_10074E660(CGFloat *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000FB44((uint64_t *)&unk_100933F40);
  __chkstk_darwin(v6 - 8, v7);
  char v9 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)&uint64_t v10 = COERCE_DOUBLE(sub_100768B20());
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)&double v13 = __chkstk_darwin(v10, v12).n128_u64[0];
  char v15 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2[qword_100996490] != 1) {
    return;
  }
  id v16 = objc_msgSend(v2, "traitCollection", v13);
  int v17 = sub_100767D00();

  double v18 = 20.0;
  CGFloat v100 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  double v21 = 20.0;
  if (a2)
  {
    double v19 = *(double *)&v3[qword_100996498];
    double v18 = *(double *)&v3[qword_100996498 + 8];
    double v20 = *(double *)&v3[qword_100996498 + 16];
    double v21 = *(double *)&v3[qword_100996498 + 24];
  }
  if (v17) {
    double v22 = v21;
  }
  else {
    double v22 = v18;
  }
  double v101 = v22;
  CGFloat v23 = *a1;
  CGFloat v24 = a1[1];
  CGFloat v25 = a1[2];
  CGFloat v26 = a1[3];
  v106.origin.CGFloat x = *a1;
  v106.origin.CGFloat y = v24;
  v106.size.double width = v25;
  v106.size.double height = v26;
  double v99 = CGRectGetWidth(v106) - v18 - v21;
  v107.origin.CGFloat x = v23;
  v107.origin.CGFloat y = v24;
  v107.size.double width = v25;
  v107.size.double height = v26;
  CGFloat v27 = v19;
  double v28 = CGRectGetHeight(v107) - v19 - v20;
  unint64_t v29 = *(void **)&v3[qword_10095B7D0];
  id v30 = [v29 text];
  if (v30)
  {

    double v31 = v99;
    objc_msgSend(v29, "sizeThatFits:", v99, v28);
    double v33 = v32;
    CGFloat v100 = v34;
    if (v17)
    {
      v108.origin.CGFloat x = v21;
      v108.origin.CGFloat y = v27;
      v108.size.double width = v31;
      v108.size.double height = v28;
      double MinX = CGRectGetMaxX(v108) - v33;
      double v35 = v33 + 30.0;
      double v36 = 0.0;
    }
    else
    {
      v109.origin.CGFloat x = v18;
      v109.origin.CGFloat y = v27;
      v109.size.double width = v31;
      v109.size.double height = v28;
      double MinX = CGRectGetMinX(v109);
      double v36 = v33 + 30.0;
      double v35 = v33 + 30.0;
    }
    double v37 = v101 + v36;
    double v38 = v31 - v35;
  }
  else
  {
    double v33 = 0.0;
    double MinX = 0.0;
    double v37 = v101;
    double v38 = v99;
  }
  int v98 = v17;
  id v97 = v29;
  if (qword_100932840 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_100765180();
  sub_10001076C(v39, (uint64_t)qword_100996448);
  sub_100764970();
  sub_100764C00();
  double v41 = v40;
  uint64_t v43 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v42 = v11 + 8;
  id v92 = v43;
  v43(v15, v10);
  uint64_t v96 = *(char **)&v3[qword_10095B7D8];
  id v44 = [v96 attributedText];
  if (v44)
  {
    char v45 = v44;
    uint64_t v90 = v15;
    uint64_t v91 = v42;
    uint64_t v93 = v10;
    uint64_t v94 = a1;
    id v46 = [v3 traitCollection];
    id v47 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:v45];
    double v99 = COERCE_DOUBLE([v45 length]);
    char v15 = (char *)swift_allocObject();
    *((void *)v15 + 2) = 0;
    *((void *)v15 + 3) = v46;
    *((void *)v15 + 4) = v47;
    v15[40] = 1;
    *(double *)&uint64_t v10 = COERCE_DOUBLE(swift_allocObject());
    *(void *)(v10 + 16) = sub_100056BE8;
    *(void *)(v10 + 24) = v15;
    unint64_t v104 = (unint64_t)sub_100056C08;
    uint64_t v105 = v10;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1006AFC84;
    uint64_t v103 = &unk_100890040;
    uint64_t v48 = _Block_copy(aBlock);
    a1 = (CGFloat *)v105;
    uint64_t v49 = (SEL *)v46;
    double v101 = COERCE_DOUBLE(v47);
    swift_retain();
    swift_release();
    objc_msgSend(v45, "enumerateAttributesInRange:options:usingBlock:", 0, *(void *)&v99, 0x100000, v48);
    _Block_release(v48);
    LOBYTE(v48) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if (v48)
    {
      __break(1u);
      goto LABEL_35;
    }
    a1 = v94;
    uint64_t v10 = v93;
    char v15 = v90;
  }
  else
  {
    double v101 = 0.0;
  }
  CGFloat v50 = v27;
  double v99 = v33;
  if (qword_100931A98 != -1) {
    swift_once();
  }
  *(double *)&uint64_t v94 = v41;
  uint64_t v51 = sub_100764BD0();
  uint64_t v52 = sub_10001076C(v51, (uint64_t)qword_1009946F8);
  uint64_t v53 = *(void *)(v51 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v9, v52, v51);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v9, 0, 1, v51);
  uint64_t v54 = sub_100764070();
  uint64_t v103 = (void *)v54;
  unint64_t v104 = sub_10021132C();
  uint64_t v55 = sub_1000107A4(aBlock);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v54 - 8) + 104))(v55, enum case for Feature.measurement_with_labelplaceholder(_:), v54);
  sub_1007564E0();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)aBlock);
  sub_1007619A0();
  double v57 = v56;
  double v59 = v58;
  uint64_t v93 = v60;
  sub_10000FED8((uint64_t)v9, (uint64_t *)&unk_100933F40);
  if (v98)
  {
    v110.origin.CGFloat x = v37;
    v110.origin.CGFloat y = v50;
    v110.size.double width = v38;
    v110.size.double height = v28;
    double v61 = v57;
    double v41 = CGRectGetMaxX(v110) - v57;
  }
  else
  {
    double v61 = v57;
    v111.origin.CGFloat x = v37;
    v111.origin.CGFloat y = v50;
    v111.size.double width = v38;
    v111.size.double height = v28;
    double v41 = CGRectGetMinX(v111);
  }
  char v9 = v96;
  v112.origin.CGFloat x = v37;
  v112.origin.CGFloat y = v50;
  v112.size.double width = v38;
  v112.size.double height = v28;
  double MinY = CGRectGetMinY(v112);
  if (qword_100932838 != -1) {
    swift_once();
  }
  sub_10001076C(v39, (uint64_t)qword_100996430);
  double v63 = v59;
  CGFloat v27 = v61;
  double v21 = v63;
  sub_100764C20();
  double v20 = MinY + v64;
  uint64_t v49 = (SEL *)&off_100902000;
  objc_msgSend(v9, "setFrame:", v41, v20, v61, v21);
  double v65 = 0.0;
  v113.origin.CGFloat y = 0.0;
  double v37 = MinX;
  v113.origin.CGFloat x = MinX;
  double v66 = v99;
  double v28 = v100;
  v113.size.double width = v99;
  v113.size.double height = v100;
  if (!CGRectIsEmpty(v113))
  {
    if (qword_100932848 == -1)
    {
LABEL_29:
      sub_10001076C(v39, (uint64_t)qword_100996460);
      sub_100764970();
      sub_100764C00();
      double v69 = v68;
      v92(v15, v10);
      v114.origin.CGFloat x = v41;
      v114.origin.CGFloat y = v20;
      v114.size.double width = v27;
      v114.size.double height = v21;
      double v70 = CGRectGetMinY(v114);
      [v9 firstBaselineFromTop];
      double v72 = v70 + v71;
      id v67 = v97;
      [v97 firstBaselineFromTop];
      double v65 = v69 + v72 - v73;
      double v66 = v99;
      goto LABEL_30;
    }
LABEL_35:
    swift_once();
    goto LABEL_29;
  }
  id v67 = v97;
LABEL_30:
  objc_msgSend(v67, v49[465], v37, v65, v66, v28);
  v115.origin.CGFloat x = v37;
  v115.origin.CGFloat y = v65;
  v115.size.double width = v66;
  v115.size.double height = v28;
  double MaxY = CGRectGetMaxY(v115);
  [v67 lastBaselineFromBottom];
  double v76 = MaxY - v75;
  v116.origin.CGFloat x = v41;
  v116.origin.CGFloat y = v20;
  v116.size.double width = v27;
  v116.size.double height = v21;
  double v77 = CGRectGetMaxY(v116);
  [v9 lastBaselineFromBottom];
  double v79 = v77 - v78;
  if (v76 > v79) {
    double v79 = v76;
  }
  CGFloat v80 = *(double *)&v94 + v79;
  CGFloat v81 = *a1;
  CGFloat v82 = a1[1];
  CGFloat v84 = a1[2];
  double v83 = a1[3];
  v117.origin.CGFloat x = *a1;
  v117.origin.CGFloat y = v82;
  v117.size.double width = v84;
  v117.size.double height = v83;
  CGFloat v85 = CGRectGetMinX(v117);
  v118.origin.CGFloat x = v81;
  v118.origin.CGFloat y = v82;
  v118.size.double width = v84;
  v118.size.double height = v83;
  CGFloat v86 = CGRectGetMaxY(v118) - v80;
  v119.origin.CGFloat x = v81;
  v119.origin.CGFloat y = v82;
  v119.size.double width = v84;
  v119.size.double height = v83;
  v120.size.double width = CGRectGetWidth(v119);
  v120.origin.CGFloat x = v85;
  v120.origin.CGFloat y = v86;
  v120.size.double height = v80;
  CGRect v121 = CGRectIntegral(v120);
  char v87 = *(void **)&v3[qword_10095B7C8];
  objc_msgSend(v87, v49[465], v121.origin.x, v121.origin.y, v121.size.width, v121.size.height);
  [v87 frame];
  double Height = CGRectGetHeight(v122);

  a1[3] = v83 - Height;
}

uint64_t sub_10074F058(uint64_t a1)
{
  return sub_10074F088(a1, qword_100996430);
}

uint64_t sub_10074F068(uint64_t a1)
{
  return sub_10074F088(a1, qword_100996448);
}

uint64_t sub_10074F078(uint64_t a1)
{
  return sub_10074F088(a1, qword_100996460);
}

uint64_t sub_10074F088(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1007649A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v14[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100765180();
  sub_100047D88(v8, a2);
  sub_10001076C(v8, (uint64_t)a2);
  if (qword_100931A98 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_100764BD0();
  uint64_t v10 = sub_10001076C(v9, (uint64_t)qword_1009946F8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v10, v9);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for FontSource.useCase(_:), v3);
  v14[3] = v3;
  v14[4] = (uint64_t)&protocol witness table for FontSource;
  uint64_t v11 = sub_1000107A4(v14);
  (*(void (**)(uint64_t *, char *, uint64_t))(v4 + 16))(v11, v7, v3);
  sub_100765190();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_10074F264()
{
  sub_10001A860(0, (unint64_t *)&qword_100933F20);
  uint64_t result = sub_100768250();
  qword_100996478 = result;
  return result;
}

void *sub_10074F2A8(double a1, double a2, double a3, double a4)
{
  uint64_t v61 = swift_isaMask & *v4;
  uint64_t v9 = sub_10075F7F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  id v62 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000FB44((uint64_t *)&unk_100933F40);
  __chkstk_darwin(v13 - 8, v14);
  id v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = qword_10095B7C0;
  sub_10075BC30();
  id v18 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v19 = v4;
  *(void *)((char *)v4 + v17) = [v18 init];
  double v20 = (char *)v19 + qword_100996480;
  uint64_t v21 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  *((unsigned char *)v19 + qword_100996488) = 0;
  *((unsigned char *)v19 + qword_100996490) = 0;
  double v22 = (CGFloat *)((char *)v19 + qword_100996498);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  *double v22 = UIEdgeInsetsZero.top;
  v22[1] = left;
  void v22[2] = bottom;
  v22[3] = right;
  *((unsigned char *)v19 + qword_1009964A0) = 0;
  id v26 = [objc_allocWithZone((Class)UIView) init];
  *(void *)((char *)v19 + qword_10095B7C8) = v26;
  if (qword_100931AA0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_100764BD0();
  uint64_t v28 = sub_10001076C(v27, (uint64_t)qword_100994710);
  uint64_t v29 = *(void *)(v27 - 8);
  uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v60(v16, v28, v27);
  double v59 = *(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56);
  v59(v16, 0, 1, v27);
  uint64_t v30 = enum case for DirectionalTextAlignment.none(_:);
  double v58 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v58(v62, enum case for DirectionalTextAlignment.none(_:), v9);
  double v31 = (objc_class *)sub_10075AA00();
  uint64_t v57 = v9;
  double v32 = v31;
  id v33 = objc_allocWithZone(v31);
  *(void *)((char *)v19 + qword_10095B7D0) = sub_10075A9F0();
  if (qword_100931A98 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_10001076C(v27, (uint64_t)qword_1009946F8);
  v60(v16, v34, v27);
  v59(v16, 0, 1, v27);
  v58(v62, v30, v57);
  id v35 = objc_allocWithZone(v32);
  *(void *)((char *)v19 + qword_10095B7D8) = sub_10075A9F0();

  double v36 = (objc_class *)type metadata accessor for FramedMediaCollectionViewCell();
  v63.receiver = v19;
  v63.super_class = v36;
  double v37 = objc_msgSendSuper2(&v63, "initWithFrame:", a1, a2, a3, a4);
  id v38 = [v37 contentView];
  objc_msgSend(v38, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

  id v39 = [v37 contentView];
  uint64_t v40 = qword_10095B7C0;
  [v39 addSubview:*(void *)((char *)v37 + qword_10095B7C0)];

  uint64_t v41 = qword_10095B7C8;
  uint64_t v42 = *(void **)((char *)v37 + qword_10095B7C8);
  sub_10001A860(0, (unint64_t *)&qword_100933F20);
  id v43 = v42;
  id v44 = (void *)sub_1007682A0();
  [v43 setBackgroundColor:v44];

  char v45 = *(void **)((char *)v37 + v41);
  [v45 setHidden:1];
  [*(id *)((char *)v37 + v40) addSubview:v45];
  uint64_t v46 = qword_10095B7D0;
  id v47 = *(id *)((char *)v37 + qword_10095B7D0);
  uint64_t v48 = (void *)sub_100768230();
  [v47 setTextColor:v48];

  [*(id *)((char *)v37 + v41) addSubview:*(void *)((char *)v37 + v46)];
  uint64_t v49 = qword_10095B7D8;
  uint64_t v50 = qword_100932850;
  id v51 = *(id *)((char *)v37 + qword_10095B7D8);
  if (v50 != -1) {
    swift_once();
  }
  [v51 setTextColor:qword_100996478];

  uint64_t v52 = *(void **)((char *)v37 + v49);
  [v52 setTextAlignment:4];
  [*(id *)((char *)v37 + v41) addSubview:v52];
  uint64_t v53 = *(void **)((char *)v37 + v40);
  uint64_t v54 = *(void (**)(void))((swift_isaMask & *v37) + 0x130);
  id v55 = v53;
  v54();

  return v37;
}

void *sub_10074F960(double a1, double a2, double a3, double a4)
{
  return sub_10074F2A8(a1, a2, a3, a4);
}

void sub_10074F984(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_10074FC4C();
}

uint64_t sub_10074F9AC()
{
  uint64_t v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for FramedMediaCollectionViewCell();
  objc_msgSendSuper2(&v16, "layoutSubviews");
  uint64_t v2 = *(void **)((char *)v0 + qword_10095B7C0);
  id v3 = [v0 contentView];
  sub_10001A860(0, (unint64_t *)&qword_100932C80);
  sub_10075C580();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v2, "setFrame:", v5, v7, v9, v11);
  [v2 frame];
  v15[0] = 0.0;
  v15[1] = 0.0;
  v15[2] = v12;
  v15[3] = v13;
  sub_10074E660(v15, *((unsigned char *)v1 + qword_1009964A0));
  return (*(uint64_t (**)(CGFloat *))((swift_isaMask & *v1) + 0x128))(v15);
}

void sub_10074FB18(void *a1)
{
  id v1 = a1;
  sub_10074F9AC();
}

id sub_10074FB60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FramedMediaCollectionViewCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10074FBBC(uint64_t a1)
{
  return sub_10000FED8(a1 + qword_100996480, (uint64_t *)&unk_100934630);
}

uint64_t type metadata accessor for FramedMediaCollectionViewCell()
{
  return sub_10001104C();
}

void sub_10074FC4C()
{
  uint64_t v1 = qword_10095B7C0;
  sub_10075BC30();
  *(void *)&v0[v1] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  objc_super v2 = &v0[qword_100996480];
  uint64_t v3 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v0[qword_100996488] = 0;
  v0[qword_100996490] = 0;
  double v4 = &v0[qword_100996498];
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *double v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v0[qword_1009964A0] = 0;

  sub_100768A40();
  __break(1u);
}

uint64_t sub_10074FD64()
{
  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_10074FDAC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10074FDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10074FDCC()
{
  return swift_release();
}

uint64_t sub_10074FDD4()
{
  return sub_10075000C(&qword_10094D178, (void (*)(uint64_t))type metadata accessor for AppPromotionOfferCollectionViewCell);
}

double sub_10074FE20()
{
  uint64_t v0 = sub_100764370();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  double v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100757940();
  sub_10075000C(&qword_100939698, (void (*)(uint64_t))&type metadata accessor for AppPromotion);
  sub_10075B640();
  uint64_t v5 = v14;
  if (!v14) {
    return 0.0;
  }
  swift_getKeyPath();
  sub_10075B6A0();
  swift_release();
  sub_1007642F0();
  double v7 = v6;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  id v8 = sub_10009352C();
  uint64_t ObjectType = swift_getObjectType();
  sub_100758690();
  swift_dynamicCastClassUnconditional();
  swift_unknownObjectRetain();
  sub_1005A3664(v7, v5, v8, ObjectType);
  double v11 = v10;
  swift_unknownObjectRelease_n();
  swift_release();
  return v11;
}

uint64_t sub_10075000C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10075005C()
{
  uint64_t v0 = sub_10000FB44(&qword_10095AEF0);
  sub_100047D88(v0, qword_1009964A8);
  sub_10001076C(v0, (uint64_t)qword_1009964A8);
  return sub_100766B90();
}

id sub_1007500CC(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_settingsProviders] = _swiftEmptyArrayStorage;
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_cellRegistrations;
  type metadata accessor for DebugSettingCellRegistrations();
  swift_allocObject();
  uint64_t v5 = v1;
  *(void *)&v1[v4] = sub_1000956C0();
  *(void *)&v5[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource] = 0;
  uint64_t v6 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_userDefaults;
  *(void *)&v5[v6] = [self standardUserDefaults];
  uint64_t v7 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_notificationCenter;
  *(void *)&v5[v7] = [self defaultCenter];
  *(void *)&v5[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_debugSections] = _swiftEmptyArrayStorage;
  *(void *)&v5[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_objectGraph] = a1;
  swift_retain();

  id v8 = [objc_allocWithZone((Class)UICollectionViewFlowLayout) init];
  v15.receiver = v5;
  v15.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v15, "initWithCollectionViewLayout:", v8);

  id v10 = v9;
  NSString v11 = sub_1007675C0();
  [v10 setTitle:v11];

  id v12 = [v10 navigationItem];
  id v13 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v10 action:"dismissFrom:"];
  [v12 setRightBarButtonItem:v13];

  swift_release();
  return v10;
}

id sub_100750304()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_100765BC0();
  *(void *)&double v5 = __chkstk_darwin(v3, v4).n128_u64[0];
  v23.receiver = v1;
  v23.super_class = ObjectType;
  objc_msgSendSuper2(&v23, "viewDidLoad", v5);
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_objectGraph];
  uint64_t v7 = sub_1007533E0(v1);
  uint64_t v8 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_settingsProviders;
  *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_settingsProviders] = v7;
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)&v1[v8];
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_100753228((uint64_t)_swiftEmptyArrayStorage, v9, v6);
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_debugSections] = v10;
  swift_bridgeObjectRelease();
  id v11 = sub_100750624();
  uint64_t v12 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource;
  id v13 = *(void **)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource];
  *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource] = v11;

  id result = [v1 collectionView];
  if (result)
  {
    objc_super v15 = result;
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v17 = objc_allocWithZone((Class)UICollectionViewCompositionalLayout);
    aBlock[4] = sub_100754280;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1002CAA14;
    uint64_t aBlock[3] = &unk_1008901D0;
    id v18 = _Block_copy(aBlock);
    swift_retain();
    id v19 = [v17 initWithSectionProvider:v18];
    _Block_release(v18);
    swift_release();
    swift_release();
    [v15 setCollectionViewLayout:v19];

    id result = [v1 collectionView];
    if (result)
    {
      double v20 = result;
      [result setDataSource:*(void *)&v1[v12]];

      [*(id *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_notificationCenter] addObserver:v1 selector:"userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:*(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_userDefaults]];
      sub_1007508CC();
      uint64_t v21 = UIContentSizeCategoryLarge;
      sub_100767BD0();
      sub_100765B90();
      return (id)sub_100767BE0();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100750624()
{
  uint64_t v1 = sub_10000FB44(&qword_100947590);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1, v4);
  double v5 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v7);
  unint64_t v9 = (char *)&v17 - v8;
  sub_1007675F0();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10001A860(0, (unint64_t *)&qword_100934790);
  sub_100767BA0();
  id result = [v0 collectionView];
  if (result)
  {
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_100754290;
    *(void *)(v12 + 24) = v11;
    id v13 = objc_allocWithZone((Class)sub_10000FB44(&qword_10095B8E8));
    uint64_t v14 = sub_100765E90();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v9, v1);
    unint64_t v15 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    uint64_t v16 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v16 + v15, v5, v1);
    sub_100765EA0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v1);
    return (id)v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1007508CC()
{
  uint64_t v1 = sub_10000FB44(&qword_10095B8C0);
  uint64_t v48 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v2);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_10000FB44(&qword_10095B8C8);
  uint64_t v35 = *(void *)(v46 - 8);
  __chkstk_darwin(v46, v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DebugSection();
  uint64_t v8 = type metadata accessor for DebugSetting();
  sub_100754390(&qword_10095B8D8, (void (*)(uint64_t))type metadata accessor for DebugSection);
  uint64_t v9 = sub_100754390(&qword_10095B8E0, (void (*)(uint64_t))type metadata accessor for DebugSetting);
  id v47 = v7;
  uint64_t v43 = v9;
  uint64_t v44 = v8;
  sub_100765DD0();
  uint64_t v49 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_debugSections;
  unint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_debugSections);
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100768A60();
    uint64_t v11 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_10;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v13 = 0;
  long long v50 = xmmword_1007B8800;
  do
  {
    if ((v10 & 0xC000000000000001) != 0)
    {
      uint64_t v14 = sub_100768950();
    }
    else
    {
      uint64_t v14 = *(void *)(v10 + 8 * v13 + 32);
      swift_retain();
    }
    ++v13;
    sub_10000FB44(&qword_100934A70);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = v50;
    *(void *)(v15 + 32) = v14;
    id v51 = (void *)v15;
    sub_100767810();
    uint64_t v16 = v51;
    swift_retain();
    v17._rawValue = v16;
    sub_100765D70(v17);
    swift_release();
    swift_bridgeObjectRelease();
  }
  while (v11 != v13);
LABEL_10:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v18 = v45;
  uint64_t v42 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource;
  id v19 = *(void **)(v45 + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource);
  if (!v19)
  {
LABEL_45:
    __break(1u);
    return result;
  }
  id v20 = v19;
  sub_100765ED0();

  unint64_t v38 = *(void *)(v18 + v49);
  if (v38 >> 62) {
    goto LABEL_41;
  }
  uint64_t v21 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v21; uint64_t v21 = sub_100768A60())
  {
    unint64_t v22 = 0;
    unint64_t v41 = v38 & 0xC000000000000001;
    unint64_t v36 = v38 + 32;
    uint64_t v37 = v38 & 0xFFFFFFFFFFFFFF8;
    id v39 = (void (**)(char *, uint64_t))(v48 + 8);
    long long v50 = xmmword_1007B8800;
    uint64_t v40 = v21;
    while (v41)
    {
      uint64_t v23 = sub_100768950();
      BOOL v24 = __OFADD__(v22, 1);
      uint64_t v25 = v22 + 1;
      if (v24) {
        goto LABEL_38;
      }
LABEL_20:
      sub_100765F50();
      unint64_t v26 = *(void *)(v23 + 48);
      uint64_t v48 = v23;
      uint64_t v49 = v25;
      if (v26 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_100768A60();
        if (!v27) {
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v27) {
          goto LABEL_35;
        }
      }
      if (v27 < 1) {
        goto LABEL_39;
      }
      for (uint64_t i = 0; i != v27; ++i)
      {
        if ((v26 & 0xC000000000000001) != 0)
        {
          uint64_t v29 = sub_100768950();
        }
        else
        {
          uint64_t v29 = *(void *)(v26 + 8 * i + 32);
          swift_retain();
        }
        sub_10000FB44(&qword_100934A70);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = v50;
        *(void *)(v30 + 32) = v29;
        id v51 = (void *)v30;
        sub_100767810();
        id v51 = 0;
        swift_retain();
        sub_100765F20();
        swift_bridgeObjectRelease();
        type metadata accessor for MenuDebugSetting();
        uint64_t v31 = swift_dynamicCastClass();
        if (v31)
        {
          if (*(void *)(v31 + 72) >> 62)
          {
            swift_retain();
            swift_bridgeObjectRetain();
            sub_100768A50();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_retain();
            swift_bridgeObjectRetain();
            sub_100768B60();
          }
          id v51 = (void *)v29;
          swift_retain();
          sub_100765F20();
          swift_release_n();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
        }
      }
LABEL_35:
      uint64_t result = swift_bridgeObjectRelease();
      double v32 = *(void **)(v45 + v42);
      if (!v32) {
        goto LABEL_44;
      }
      id v51 = (void *)v48;
      id v33 = v32;
      sub_100765EE0();

      (*v39)(v4, v1);
      swift_release();
      unint64_t v22 = v49;
      if (v49 == v40) {
        goto LABEL_37;
      }
    }
    if (v22 >= *(void *)(v37 + 16)) {
      goto LABEL_40;
    }
    uint64_t v23 = *(void *)(v36 + 8 * v22);
    swift_retain();
    BOOL v24 = __OFADD__(v22, 1);
    uint64_t v25 = v22 + 1;
    if (!v24) {
      goto LABEL_20;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    swift_bridgeObjectRetain();
  }
LABEL_37:
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v47, v46);
}

id sub_100750F68()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  [*(id *)&v0[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_notificationCenter] removeObserver:v0];
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_100751144(unint64_t a1, uint64_t a2)
{
  unint64_t v49 = a1;
  uint64_t v50 = a2;
  uint64_t v2 = sub_10000FB44(&qword_10095B8C8);
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100765FA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100765F80();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100765FE0();
  uint64_t v16 = *(void *)(v15 - 8);
  __n128 v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = v10;
  uint64_t v21 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v11 + 104))(v14, enum case for UICollectionLayoutListConfiguration.Appearance.insetGrouped(_:), v20, v18);
  sub_100765FB0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for UICollectionLayoutListConfiguration.HeaderMode.supplementary(_:), v5);
  sub_100765FD0();
  sub_10001A860(0, (unint64_t *)&qword_100952440);
  unint64_t v22 = (void *)sub_100767F70();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    return;
  }
  BOOL v24 = (void *)Strong;
  uint64_t v25 = *(void **)(Strong + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource);
  id v26 = v25;

  if (!v25) {
    goto LABEL_16;
  }
  uint64_t v27 = v46;
  sub_100765F00();

  uint64_t v28 = v48;
  uint64_t v29 = sub_100765DC0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v28);
  uint64_t v30 = v15;
  uint64_t v31 = v16;
  if ((v29 & 0xC000000000000001) != 0)
  {
    uint64_t v32 = sub_100768950();
    goto LABEL_7;
  }
  if ((v49 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) <= v49)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  uint64_t v32 = *(void *)(v29 + 8 * v49 + 32);
  swift_retain();
LABEL_7:
  swift_bridgeObjectRelease();
  unint64_t v33 = *(void *)(v32 + 40);
  uint64_t v34 = *(void *)(v32 + 32) & 0xFFFFFFFFFFFFLL;
  if ((v33 & 0x2000000000000000) != 0) {
    uint64_t v34 = HIBYTE(v33) & 0xF;
  }
  if (v34)
  {
    uint64_t v35 = self;
    id v36 = [v35 fractionalWidthDimension:1.0];
    id v37 = [v35 estimatedDimension:44.0];
    id v38 = [self sizeWithWidthDimension:v36 heightDimension:v37];

    sub_1007675F0();
    id v39 = v38;
    NSString v40 = sub_1007675C0();
    swift_bridgeObjectRelease();
    id v41 = [self boundarySupplementaryItemWithLayoutSize:v39 elementKind:v40 alignment:1];

    sub_10000FB44(&qword_100934A70);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1007B8800;
    *(void *)(v42 + 32) = v41;
    uint64_t v51 = v42;
    sub_100767810();
    sub_10001A860(0, (unint64_t *)&unk_100941B50);
    id v43 = v41;
    Class isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
    [v22 setBoundarySupplementaryItems:isa];

    swift_release();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v30);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    swift_release();
  }
}

unint64_t sub_1007516EC(uint64_t a1)
{
  uint64_t v2 = sub_100765D30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000FB44(&qword_10095B8C8);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  unint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v13 = (void *)result;
    v18[1] = a1;
    uint64_t v14 = *(void **)(result + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource);
    if (v14)
    {
      id v15 = v14;
      sub_100765F00();

      uint64_t v16 = sub_100765DC0();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      unint64_t result = sub_100756450();
      if ((v16 & 0xC000000000000001) != 0)
      {
        sub_100768950();
        goto LABEL_7;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (result < *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        swift_retain();
LABEL_7:
        swift_bridgeObjectRelease();
        sub_100765C90();
        swift_bridgeObjectRetain();
        sub_100765D10();
        v19[3] = v2;
        v19[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
        uint64_t v17 = sub_1000107A4(v19);
        (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v17, v6, v2);
        sub_100767DF0();

        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100751988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v12 = (void *)Strong;
    swift_retain();

    uint64_t v13 = sub_1000958B0(a1, a3, a2);
    swift_release();
    if (v13) {
      return v13;
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  v15[1] = 0;
  v15[2] = 0xE000000000000000;
  sub_100768920(55);
  v16._object = (void *)0x80000001007A16C0;
  v16._countAndFlagsBits = 0xD000000000000035;
  sub_100767700(v16);
  sub_100754390(&qword_10095B8F0, (void (*)(uint64_t))&type metadata accessor for IndexPath);
  v17._countAndFlagsBits = sub_100768B10();
  sub_100767700(v17);
  swift_bridgeObjectRelease();
  uint64_t result = sub_100768A40();
  __break(1u);
  return result;
}

void sub_100751BA0()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong collectionView];

    if (v2)
    {
      [v2 reloadData];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100751C84(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_10000FB44(&qword_10095B8C0);
  CGRect v115 = *(uint64_t **)(v5 - 8);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000FB44(&qword_10095B8C8);
  uint64_t v116 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v114 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v14);
  Swift::String v16 = (char *)&v114 - v15;
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v114 - v19;
  uint64_t v21 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource;
  CGRect v119 = v2;
  unint64_t v22 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource];
  if (!v22)
  {
    __break(1u);
    goto LABEL_58;
  }
  id v23 = v22;
  uint64_t v118 = a2;
  sub_100765EB0();

  BOOL v24 = v121;
  if (!v121) {
    return;
  }
  CGRect v117 = a1;
  type metadata accessor for NavigationActionDebugSetting();
  uint64_t v25 = swift_dynamicCastClass();
  if (!v25)
  {
    type metadata accessor for ActionDebugSetting();
    uint64_t v32 = swift_dynamicCastClass();
    if (!v32)
    {
      type metadata accessor for StringPreferencesDebugSetting();
      uint64_t v56 = swift_dynamicCastClass();
      if (!v56)
      {
        type metadata accessor for StringUserDefaultsDebugSetting();
        uint64_t v68 = swift_dynamicCastClass();
        if (v68)
        {
          uint64_t v70 = v68;
          uint64_t v72 = *(void *)(v68 + 56);
          uint64_t v71 = *(void *)(v68 + 64);
          __chkstk_darwin(v68, v69);
          id v73 = v119;
          *(&v114 - 2) = (uint64_t)v119;
          *(&v114 - 1) = v74;
          uint64_t v75 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v76 = swift_allocObject();
          *(void *)(v76 + 16) = v75;
          *(void *)(v76 + 24) = v70;
          LOBYTE(v70) = *(unsigned char *)(v70 + 88);
          swift_retain_n();
          swift_bridgeObjectRetain();
          swift_retain();
          id v77 = sub_100753D5C(v72, v71, sub_1007541A0, (uint64_t)(&v114 - 4), (uint64_t)sub_1007541AC, v76, v70);
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          [v73 presentViewController:v77 animated:1 completion:0];
        }
        else
        {
          type metadata accessor for PromptActionDebugSetting();
          CGFloat v80 = (void *)swift_dynamicCastClass();
          if (!v80)
          {
            type metadata accessor for MenuDebugSetting();
            uint64_t v95 = swift_dynamicCastClass();
            if (!v95)
            {
              type metadata accessor for MenuItemDebugSetting();
              uint64_t v109 = swift_dynamicCastClass();
              uint64_t v54 = v117;
              if (v109)
              {
                CGRect v110 = *(void (**)(uint64_t))(v109 + 80);
                swift_retain();
                uint64_t v111 = swift_retain();
                v110(v111);
                swift_release();
                [v54 reloadData];
                swift_release();
              }
              goto LABEL_35;
            }
            uint64_t v96 = *(void **)&v119[v21];
            if (!v96) {
              goto LABEL_62;
            }
            uint64_t v97 = v95;
            swift_retain();
            id v98 = v96;
            sub_100765F00();

            uint64_t v120 = v97;
            sub_100765DB0();
            (*(void (**)(char *, uint64_t))(v116 + 8))(v12, v9);
            double v99 = v121;
            if (v121)
            {
              CGFloat v100 = *(void **)&v119[v21];
              if (!v100)
              {
LABEL_63:
                __break(1u);
LABEL_64:
                __break(1u);
                return;
              }
              id v101 = v100;
              sub_100765EF0();

              CGRect v121 = v24;
              LOBYTE(v101) = sub_100765F10();
              sub_10000FB44(&qword_100934A70);
              uint64_t v102 = swift_allocObject();
              *(_OWORD *)(v102 + 16) = xmmword_1007B8800;
              *(void *)(v102 + 32) = v24;
              CGRect v121 = (void *)v102;
              sub_100767810();
              uint64_t v103 = v121;
              swift_retain();
              v104._rawValue = v103;
              if (v101) {
                sub_100765F40(v104);
              }
              else {
                sub_100765F30(v104);
              }
              swift_bridgeObjectRelease();
              CGRect v112 = *(void **)&v119[v21];
              if (!v112) {
                goto LABEL_64;
              }
              CGRect v121 = v99;
              id v113 = v112;
              sub_100765EE0();
              swift_release();

              ((void (*)(char *, uint64_t))v115[1])(v8, v5);
            }
            goto LABEL_33;
          }
          CGFloat v82 = v80;
          uint64_t v83 = v80[7];
          uint64_t v116 = v80[8];
          uint64_t v84 = v80[9];
          uint64_t v85 = v80[10];
          if (v84)
          {
            CGFloat v80 = (void *)swift_allocObject();
            CGFloat v86 = v80;
            v80[2] = v84;
            v80[3] = v85;
          }
          else
          {
            CGFloat v86 = 0;
          }
          CGRect v115 = &v114;
          __chkstk_darwin(v80, v81);
          *(&v114 - 2) = v105;
          *(&v114 - 1) = (uint64_t)v86;
          uint64_t v106 = swift_allocObject();
          id v107 = v119;
          swift_unknownObjectWeakInit();
          uint64_t v108 = swift_allocObject();
          *(void *)(v108 + 16) = v106;
          *(void *)(v108 + 24) = v82;
          swift_retain_n();
          sub_10001A4E0(v84);
          swift_retain();
          id v77 = sub_100753D5C(v83, v116, sub_1007540F4, (uint64_t)(&v114 - 4), (uint64_t)sub_100754168, v108, 0);
          swift_release();
          swift_release();
          swift_release();
          [v107 presentViewController:v77 animated:1 completion:0];
        }
        swift_release();

        goto LABEL_34;
      }
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)(v56 + 56);
      uint64_t v59 = *(void *)(v56 + 64);
      swift_retain_n();
      swift_bridgeObjectRetain();
      id v60 = sub_100753D5C(v58, v59, sub_1007541B4, v57, (uint64_t)sub_1007541BC, v57, 1);
      swift_bridgeObjectRelease();
      swift_release();
      [v119 presentViewController:v60 animated:1 completion:0];
      swift_release();

LABEL_34:
      uint64_t v54 = v117;
      goto LABEL_35;
    }
    uint64_t v33 = v32;
    uint64_t v34 = *(uint64_t (**)(uint64_t))(v32 + 88);
    swift_retain();
    if (v34)
    {
      uint64_t v35 = sub_10001A4E0((uint64_t)v34);
      uint64_t v36 = v34(v35);
      uint64_t v38 = v37;
      sub_10001A4D0((uint64_t)v34);
    }
    else
    {
      uint64_t v36 = 0;
      uint64_t v38 = 0;
    }
    uint64_t v61 = *(void (**)(uint64_t))(v33 + 104);
    uint64_t v62 = *(void *)&v119[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_objectGraph];
    swift_retain();
    v61(v62);
    swift_release();
    if (!v38) {
      goto LABEL_33;
    }
    objc_super v63 = *(uint64_t (**)(uint64_t))(v33 + 88);
    if (v63)
    {
      uint64_t v64 = swift_retain();
      uint64_t v65 = v63(v64);
      uint64_t v67 = v66;
      sub_10001A4D0((uint64_t)v63);
      if (v67)
      {
        if (v65 != v36 || v67 != v38)
        {
          char v78 = sub_100768B50();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v78 & 1) == 0)
          {
            char v87 = v119;
            uint64_t v88 = *(void **)&v119[v21];
            if (v88)
            {
              id v89 = v88;
              sub_100765F00();

              sub_10000FB44(&qword_100934A70);
              uint64_t v90 = swift_allocObject();
              *(_OWORD *)(v90 + 16) = xmmword_1007B8800;
              *(void *)(v90 + 32) = v24;
              CGRect v121 = (void *)v90;
              sub_100767810();
              uint64_t v91 = v121;
              swift_retain();
              v92._rawValue = v91;
              sub_100765DA0(v92);
              swift_bridgeObjectRelease();
              uint64_t v93 = *(void **)&v87[v21];
              uint64_t v54 = v117;
              if (v93)
              {
                id v94 = v93;
                sub_100765ED0();
                swift_release();

                (*(void (**)(char *, uint64_t))(v116 + 8))(v16, v9);
                goto LABEL_35;
              }
              goto LABEL_61;
            }
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
LABEL_62:
            __break(1u);
            goto LABEL_63;
          }
          goto LABEL_33;
        }
        goto LABEL_27;
      }
    }
LABEL_28:
    swift_release();
    goto LABEL_29;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(uint64_t (**)(uint64_t))(v25 + 72);
  swift_retain();
  if (v27)
  {
    uint64_t v28 = sub_10001A4E0((uint64_t)v27);
    uint64_t v29 = v27(v28);
    uint64_t v31 = v30;
    sub_10001A4D0((uint64_t)v27);
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v31 = 0;
  }
  id v39 = *(void (**)(uint64_t))(v26 + 88);
  uint64_t v40 = *(void *)&v119[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_objectGraph];
  swift_retain();
  v39(v40);
  swift_release();
  if (!v31) {
    goto LABEL_33;
  }
  id v41 = *(uint64_t (**)(uint64_t))(v26 + 72);
  if (!v41) {
    goto LABEL_28;
  }
  uint64_t v42 = swift_retain();
  uint64_t v43 = v41(v42);
  uint64_t v45 = v44;
  sub_10001A4D0((uint64_t)v41);
  if (!v45) {
    goto LABEL_28;
  }
  if (v43 == v29 && v45 == v31)
  {
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  char v46 = sub_100768B50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v46)
  {
LABEL_33:
    swift_release();
    goto LABEL_34;
  }
  uint64_t v47 = v119;
  uint64_t v48 = *(void **)&v119[v21];
  if (!v48)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v49 = v48;
  sub_100765F00();

  sub_10000FB44(&qword_100934A70);
  uint64_t v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_1007B8800;
  *(void *)(v50 + 32) = v24;
  CGRect v121 = (void *)v50;
  sub_100767810();
  uint64_t v51 = v121;
  swift_retain();
  v52._rawValue = v51;
  sub_100765DA0(v52);
  swift_bridgeObjectRelease();
  uint64_t v53 = *(void **)&v47[v21];
  uint64_t v54 = v117;
  if (!v53)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  id v55 = v53;
  sub_100765ED0();
  swift_release();

  (*(void (**)(char *, uint64_t))(v116 + 8))(v20, v9);
LABEL_35:
  Class isa = sub_100756340().super.isa;
  [v54 deselectItemAtIndexPath:isa animated:1];
  swift_release();
}

uint64_t sub_1007527D4()
{
  swift_getObjectType();
  sub_100766A20();
  return v1;
}

uint64_t sub_10075284C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000FB44(&qword_10094A190);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v16[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    goto LABEL_6;
  }
  uint64_t v11 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v11 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a3 + OBJC_IVAR____TtC22SubscribePageExtension29StringPreferencesDebugSetting_key, v6);
    v16[0] = a1;
    v16[1] = a2;
    swift_bridgeObjectRetain();
    return sub_100766A30();
  }
  else
  {
LABEL_6:
    swift_getObjectType();
    uint64_t v13 = a3 + OBJC_IVAR____TtC22SubscribePageExtension29StringPreferencesDebugSetting_key;
    v16[3] = v6;
    v16[4] = sub_10000FD3C(&qword_10094A1A8, &qword_10094A190);
    uint64_t v14 = sub_1000107A4(v16);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(v14, v13, v6);
    sub_1007669F0();
    return _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v16);
  }
}

uint64_t sub_100752A44(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_userDefaults);
  NSString v2 = sub_1007675C0();
  id v3 = [v1 valueForKey:v2];

  if (v3)
  {
    sub_100768710();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1000A7F00((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_1000126F4((uint64_t)v7);
    return 0;
  }
}

void sub_100752B24(uint64_t a1, NSString a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    id v5 = *(id *)(Strong + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_userDefaults);

    if (a2) {
      a2 = sub_1007675C0();
    }
    NSString v6 = sub_1007675C0();
    [v5 setObject:a2 forKey:v6];

    swift_unknownObjectRelease();
  }
}

uint64_t sub_100752BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v8 = (void *)result;
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 88);
    uint64_t v10 = swift_retain();
    v9(v10, a1, a2);

    return swift_release();
  }
  return result;
}

void sub_100752E84(id a1, uint64_t a2, NSString a3)
{
  if (!a3)
  {
LABEL_7:
    id v4 = a3;
    objc_msgSend(a1, "setText:");

    return;
  }
  if ((a2 != 0x746C7561666544 || a3 != (NSString)0xE700000000000000) && (sub_100768B50() & 1) == 0)
  {
    a3 = sub_1007675C0();
    goto LABEL_7;
  }
}

void sub_100752F58(int a1, id a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t), uint64_t a6, char a7)
{
  id v11 = [a2 textFields];
  if (!v11) {
    return;
  }
  uint64_t v12 = v11;
  sub_10001A860(0, &qword_10095B8D0);
  unint64_t v13 = sub_100767800();

  if (!(v13 >> 62))
  {
    if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_100768A60();
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_12;
  }
LABEL_4:
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v14 = (id)sub_100768950();
  }
  else
  {
    if (!*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v14 = *(id *)(v13 + 32);
  }
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  id v16 = [v15 text];

  if (v16)
  {
    uint64_t v17 = sub_1007675F0();
    uint64_t v19 = v18;

    if (a4 && (v17 == a3 && v19 == a4 || (sub_100768B50() & 1) != 0)) {
      goto LABEL_12;
    }
    a5(v17, v19);
    swift_bridgeObjectRelease();
    if (a7)
    {
      id v21 = [self sharedCoordinator];
      [v21 notify];
    }
  }
}

uint64_t type metadata accessor for DebugSettingsViewController()
{
  return self;
}

uint64_t sub_100753228(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_100768A60())
  {
    for (uint64_t i = 4; ; ++i)
    {
      uint64_t v4 = i - 4;
      uint64_t v7 = (a2 & 0xC000000000000001) != 0 ? (void *)sub_100768950() : *(id *)(a2 + 8 * i);
      uint64_t v8 = v7;
      uint64_t v9 = i - 3;
      if (__OFADD__(v4, 1)) {
        break;
      }
      uint64_t v10 = (*(uint64_t (**)(void))((swift_isaMask & *v7) + 0x78))();
      id v11 = (id)ASKBuildTypeGetCurrent();
      char v12 = sub_1002BB864(v11, v10);

      swift_bridgeObjectRelease();
      if (v12)
      {
        unint64_t v13 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v8) + 0x80))(a3);
        sub_10001B840(v13);
      }

      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        return a1;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1007533E0(void *a1)
{
  sub_10000FB44(&qword_100934A70);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1007E6600;
  id v3 = objc_allocWithZone((Class)type metadata accessor for DefaultSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v4 = (objc_class *)type metadata accessor for DebugSettingsProvider();
  v46.receiver = v3;
  v46.super_class = v4;
  *(void *)(v2 + 32) = objc_msgSendSuper2(&v46, "init");
  id v5 = objc_allocWithZone((Class)type metadata accessor for LocaleSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v45.receiver = v5;
  v45.super_class = v4;
  *(void *)(v2 + 40) = objc_msgSendSuper2(&v45, "init");
  id v6 = objc_allocWithZone((Class)type metadata accessor for MetricsSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v44.receiver = v6;
  v44.super_class = v4;
  *(void *)(v2 + 48) = objc_msgSendSuper2(&v44, "init");
  id v7 = objc_allocWithZone((Class)type metadata accessor for TodaySettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v43.receiver = v7;
  v43.super_class = v4;
  *(void *)(v2 + 56) = objc_msgSendSuper2(&v43, "init");
  id v8 = objc_allocWithZone((Class)type metadata accessor for SearchSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v42.receiver = v8;
  v42.super_class = v4;
  *(void *)(v2 + 64) = objc_msgSendSuper2(&v42, "init");
  id v9 = objc_allocWithZone((Class)type metadata accessor for ProductPageSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v41.receiver = v9;
  v41.super_class = v4;
  *(void *)(v2 + 72) = objc_msgSendSuper2(&v41, "init");
  id v10 = objc_allocWithZone((Class)type metadata accessor for DemoModeSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v40.receiver = v10;
  v40.super_class = v4;
  *(void *)(v2 + 80) = objc_msgSendSuper2(&v40, "init");
  id v11 = objc_allocWithZone((Class)type metadata accessor for StorefrontSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v39.receiver = v11;
  v39.super_class = v4;
  *(void *)(v2 + 88) = objc_msgSendSuper2(&v39, "init");
  id v12 = objc_allocWithZone((Class)type metadata accessor for AdsSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v38.receiver = v12;
  v38.super_class = v4;
  *(void *)(v2 + 96) = objc_msgSendSuper2(&v38, "init");
  id v13 = objc_allocWithZone((Class)type metadata accessor for ProductPageVariantSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v37.receiver = v13;
  v37.super_class = v4;
  *(void *)(v2 + 104) = objc_msgSendSuper2(&v37, "init");
  id v14 = objc_allocWithZone((Class)type metadata accessor for TestProductPageSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v36.receiver = v14;
  v36.super_class = v4;
  *(void *)(v2 + 112) = objc_msgSendSuper2(&v36, "init");
  id v15 = objc_allocWithZone((Class)type metadata accessor for TestPagesSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v35.receiver = v15;
  v35.super_class = v4;
  *(void *)(v2 + 120) = objc_msgSendSuper2(&v35, "init");
  id v16 = objc_allocWithZone((Class)type metadata accessor for OnboardingSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v34.receiver = v16;
  v34.super_class = v4;
  *(void *)(v2 + 128) = objc_msgSendSuper2(&v34, "init");
  id v17 = objc_allocWithZone((Class)type metadata accessor for AppEventSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v33.receiver = v17;
  v33.super_class = v4;
  *(void *)(v2 + 136) = objc_msgSendSuper2(&v33, "init");
  id v18 = objc_allocWithZone((Class)type metadata accessor for ShelfPlaceholderSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v32.receiver = v18;
  v32.super_class = v4;
  *(void *)(v2 + 144) = objc_msgSendSuper2(&v32, "init");
  id v19 = objc_allocWithZone((Class)type metadata accessor for ArcadeSettings());
  swift_unknownObjectWeakInit();
  sub_10075FF30();
  id v20 = a1;
  swift_retain();
  id v21 = v19;
  unint64_t v22 = (void *)sub_100763DA0();
  swift_unknownObjectWeakAssign();

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v31.receiver = v21;
  v31.super_class = v4;
  id v23 = objc_msgSendSuper2(&v31, "init");
  swift_release();

  *(void *)(v2 + 152) = v23;
  id v24 = objc_allocWithZone((Class)type metadata accessor for DownloadProgressSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v30.receiver = v24;
  v30.super_class = v4;
  *(void *)(v2 + 160) = objc_msgSendSuper2(&v30, "init");
  id v25 = objc_allocWithZone((Class)type metadata accessor for AppCapabilitiesSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v29.receiver = v25;
  v29.super_class = v4;
  *(void *)(v2 + 168) = objc_msgSendSuper2(&v29, "init");
  id v26 = objc_allocWithZone((Class)type metadata accessor for LocalizerSettings());
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v28.receiver = v26;
  v28.super_class = v4;
  *(void *)(v2 + 176) = objc_msgSendSuper2(&v28, "init");
  sub_100767810();
  return v2;
}

void sub_100753960()
{
  uint64_t v1 = v0;
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_settingsProviders] = _swiftEmptyArrayStorage;
  uint64_t v2 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_cellRegistrations;
  type metadata accessor for DebugSettingCellRegistrations();
  swift_allocObject();
  *(void *)&v0[v2] = sub_1000956C0();
  *(void *)&v0[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource] = 0;
  uint64_t v3 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_userDefaults;
  *(void *)&v1[v3] = [self standardUserDefaults];
  uint64_t v4 = OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_notificationCenter;
  *(void *)&v1[v4] = [self defaultCenter];
  *(void *)&v1[OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_debugSections] = _swiftEmptyArrayStorage;

  sub_100768A40();
  __break(1u);
}

uint64_t sub_100753A78()
{
  uint64_t v0 = sub_1007666D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100766710();
  uint64_t v5 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v6);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A860(0, (unint64_t *)&qword_100940210);
  id v9 = (void *)sub_100767C80();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_100754278;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000DFF64;
  uint64_t aBlock[3] = &unk_1008901A8;
  id v11 = _Block_copy(aBlock);
  swift_release();
  sub_1007666F0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100754390((unint64_t *)&qword_1009340E0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000FB44((uint64_t *)&unk_100938050);
  sub_10000FD3C((unint64_t *)&qword_1009340F0, (uint64_t *)&unk_100938050);
  sub_1007687A0();
  sub_100767C90();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v14);
}

id sub_100753D5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v8 = a3();
  uint64_t v10 = v9;
  swift_bridgeObjectRetain();
  NSString v11 = sub_1007675C0();
  swift_bridgeObjectRelease();
  id v12 = [self alertControllerWithTitle:v11 message:0 preferredStyle:1];

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  *(void *)(v13 + 24) = v10;
  objc_super v30 = sub_1007541FC;
  uint64_t v31 = v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  objc_super v28 = sub_100750058;
  objc_super v29 = &unk_100890130;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  [v12 addTextFieldWithConfigurationHandler:v14];
  _Block_release(v14);
  NSString v15 = sub_1007675C0();
  id v16 = self;
  id v17 = [v16 actionWithTitle:v15 style:1 handler:0];

  [v12 addAction:v17];
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  *(void *)(v18 + 24) = v8;
  *(void *)(v18 + 32) = v10;
  *(void *)(v18 + 40) = a5;
  *(void *)(v18 + 48) = a6;
  *(unsigned char *)(v18 + 56) = a7;
  id v19 = v12;
  swift_retain();
  NSString v20 = sub_1007675C0();
  objc_super v30 = sub_100754264;
  uint64_t v31 = v18;
  aBlock = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  objc_super v28 = sub_100750058;
  objc_super v29 = &unk_100890180;
  id v21 = _Block_copy(&aBlock);
  swift_release();
  id v22 = [v16 actionWithTitle:v20 style:2 handler:v21];
  _Block_release(v21);

  [v19 addAction:v22];
  return v19;
}

void sub_100754038()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC22SubscribePageExtension27DebugSettingsViewController_diffableDataSource);
  if (v1)
  {
    id v2 = v1;
    sub_100765EB0();

    if (v3)
    {
      type metadata accessor for InfoDebugSetting();
      if (swift_dynamicCastClass()
        || (type metadata accessor for BoolUserDefaultsDebugSetting(), swift_dynamicCastClass()))
      {
        swift_release();
      }
      else
      {
        type metadata accessor for BoolPreferencesDebugSetting();
        swift_dynamicCastClass();
        swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1007540F4()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t sub_10075412C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100754168(uint64_t a1, uint64_t a2)
{
  return sub_100752BEC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100754170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1007541A0()
{
  return sub_100752A44(*(void *)(v0 + 16));
}

void sub_1007541AC(uint64_t a1, NSString a2)
{
}

uint64_t sub_1007541B4()
{
  return sub_1007527D4();
}

uint64_t sub_1007541BC(uint64_t a1, unint64_t a2)
{
  return sub_10075284C(a1, a2, v2);
}

uint64_t sub_1007541C4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1007541FC(void *a1)
{
  sub_100752E84(a1, *(void *)(v1 + 16), *(NSString *)(v1 + 24));
}

uint64_t sub_100754204(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100754214()
{
  return swift_release();
}

uint64_t sub_10075421C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 57, 7);
}

void sub_100754264(int a1)
{
  sub_100752F58(a1, *(id *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(uint64_t, uint64_t))(v1 + 40), *(void *)(v1 + 48), *(unsigned char *)(v1 + 56));
}

void sub_100754278()
{
}

void sub_100754280(unint64_t a1, uint64_t a2)
{
}

unint64_t sub_100754288(uint64_t a1)
{
  return sub_1007516EC(a1);
}

uint64_t sub_100754290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100751988(a1, a2, a3);
}

uint64_t sub_100754298()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1007542D0(uint64_t a1, uint64_t a2, void *a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(a1, a2, *a3);
}

uint64_t sub_1007542FC()
{
  uint64_t v1 = sub_10000FB44(&qword_100947590);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100754390(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1007543F4(uint64_t a1)
{
  uint64_t v48 = sub_10000FB44(&qword_10094A060);
  uint64_t v47 = *(void *)(v48 - 8);
  __chkstk_darwin(v48, v2);
  objc_super v46 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000FB44(&qword_100934AC0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v58 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_1007642D0();
  uint64_t v7 = *(void *)(v60 - 8);
  __chkstk_darwin(v60, v8);
  uint64_t v10 = (int64x2_t *)((char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_10000FB44(&qword_100933C48);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v53 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v15);
  __chkstk_darwin(v16, v17);
  uint64_t v50 = (char *)v41 - v18;
  __chkstk_darwin(v19, v20);
  id v22 = (char *)v41 - v21;
  sub_10000FB44(&qword_100934AC8);
  uint64_t v23 = *(void *)(sub_100764200() - 8);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v55 = *(void *)(v23 + 72);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1007B9A60;
  uint64_t v49 = v25;
  unint64_t v26 = v25 + v24;
  if (qword_100932038 != -1) {
    swift_once();
  }
  v52.i64[0] = a1;
  uint64_t v63 = 0x3FF0000000000000;
  sub_100023180();
  sub_100764290();
  uint64_t v63 = 0x4020000000000000;
  uint64_t v61 = 0x4030000000000000;
  sub_100764270();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  __asm { FMOV            V0.2D, #16.0 }
  *uint64_t v10 = _Q0;
  uint64_t v32 = enum case for PageGrid.HorizontalMargins.absolute(_:);
  objc_super v33 = *(void (**)(int64x2_t *, uint64_t, uint64_t))(v7 + 104);
  uint64_t v59 = v7 + 104;
  uint64_t v57 = v33;
  v33(v10, enum case for PageGrid.HorizontalMargins.absolute(_:), v60);
  CGFloat left = UIEdgeInsetsZero.left;
  LOBYTE(v63) = 0;
  sub_100764290();
  uint64_t v63 = 0;
  sub_100764290();
  sub_1007641C0();
  uint64_t v35 = v55;
  uint64_t v54 = (char *)(v26 + v55);
  if (qword_100932040 != -1) {
    swift_once();
  }
  uint64_t v63 = 0x3FF0000000000000;
  sub_100764290();
  uint64_t v63 = 0x4024000000000000;
  uint64_t v61 = 0x4034000000000000;
  sub_100764270();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  __asm { FMOV            V0.2D, #20.0 }
  *uint64_t v10 = _Q0;
  v57(v10, v32, v60);
  LOBYTE(v63) = 0;
  unsigned int v56 = v32;
  sub_100764290();
  uint64_t v63 = 0;
  sub_100764290();
  uint64_t v54 = v22;
  sub_1007641C0();
  unint64_t v51 = v26 + 2 * v35;
  if (qword_100932048 != -1) {
    swift_once();
  }
  uint64_t v63 = 0x3FF0000000000000;
  sub_100764290();
  uint64_t v63 = 0x4034000000000000;
  sub_100764290();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  int64x2_t v42 = vdupq_n_s64(0x4041000000000000uLL);
  *uint64_t v10 = v42;
  v57(v10, v56, v60);
  LOBYTE(v63) = 0;
  sub_100764290();
  uint64_t v63 = 0;
  sub_100764290();
  CGFloat top = UIEdgeInsetsZero.top;
  CGFloat v44 = left;
  sub_1007641C0();
  v41[1] = v26 + 3 * v35;
  unint64_t v51 = v26;
  if (qword_100932068 != -1) {
    swift_once();
  }
  uint64_t v65 = 0x4000000000000000;
  uint64_t v63 = 0;
  char v64 = 1;
  uint64_t v61 = 0x3FF0000000000000;
  char v62 = 0;
  unint64_t v37 = sub_100461EF8();
  objc_super v38 = v46;
  unint64_t v43 = v37;
  sub_10075F640();
  uint64_t v39 = v48;
  sub_10075F650();
  uint64_t v47 = *(void *)(v47 + 8);
  ((void (*)(char *, uint64_t))v47)(v38, v39);
  uint64_t v61 = v63;
  sub_100764290();
  uint64_t v63 = 0x4034000000000000;
  sub_100764290();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  *uint64_t v10 = v42;
  v57(v10, v56, v60);
  sub_100767AD0();
  LOBYTE(v63) = 0;
  sub_100764290();
  uint64_t v63 = 0;
  sub_100764290();
  sub_1007641C0();
  v42.i64[0] = v51 + 4 * v55;
  if (qword_100932070 != -1) {
    swift_once();
  }
  uint64_t v65 = 0x4000000000000000;
  uint64_t v63 = 0;
  char v64 = 1;
  uint64_t v61 = 0x3FF0000000000000;
  char v62 = 0;
  sub_10075F640();
  sub_10075F650();
  ((void (*)(char *, uint64_t))v47)(v38, v39);
  uint64_t v61 = v63;
  sub_100764290();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  int64x2_t v52 = vdupq_n_s64(0x404A000000000000uLL);
  *uint64_t v10 = v52;
  v57(v10, v56, v60);
  LOBYTE(v63) = 0;
  sub_100764290();
  uint64_t v63 = 0;
  sub_100764290();
  sub_1007641C0();
  if (qword_100932078 != -1) {
    swift_once();
  }
  uint64_t v63 = 0x4000000000000000;
  sub_100764290();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  uint64_t v63 = 0x4038000000000000;
  sub_100764290();
  *uint64_t v10 = v52;
  v57(v10, v56, v60);
  LOBYTE(v63) = 0;
  sub_100764290();
  uint64_t v63 = 0;
  sub_100764290();
  sub_1007641C0();
  return v49;
}

id sub_100755080()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for PlayerViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_100755220()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for PlayerViewController();
  objc_msgSendSuper2(&v7, "viewDidLoad");
  id v1 = [self defaultCenter];
  NSString v2 = sub_1007675C0();
  id v3 = [v0 player];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 currentItem];

    if (v5)
    {
      sub_10075594C();
      uint64_t v4 = (void *)sub_100768B30();
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  [v1 addObserver:v0 selector:"playerItemDidPlayToEndWithNotification:" name:v2 object:v4];

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for PlayerViewController()
{
  return self;
}

id sub_1007557A0(uint64_t a1)
{
  uint64_t v2 = sub_100755EA0();
  uint64_t v3 = *(void *)(v2 - 8);
  __n128 v5 = __chkstk_darwin(v2, v4);
  objc_super v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16))(v7, a1, v2, v5);
  id v8 = objc_allocWithZone((Class)AVPlayer);
  sub_100755E50(v9);
  uint64_t v11 = v10;
  id v12 = [v8 initWithURL:v10];

  id v13 = [objc_allocWithZone((Class)type metadata accessor for PlayerViewController()) initWithNibName:0 bundle:0];
  [v13 setPlayer:v12];

  *((unsigned char *)v13 + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_autoplay) = 1;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  [v13 setAllowsPictureInPicturePlayback:0];
  [v13 setUpdatesNowPlayingInfoCenter:0];
  [v13 setAllowsVideoFrameAnalysis:0];
  return v13;
}

unint64_t sub_10075594C()
{
  unint64_t result = qword_10095B938;
  if (!qword_10095B938)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10095B938);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1007559B0()
{
  return type metadata accessor for AppEntityVisualState();
}

uint64_t sub_1007559F0()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_100755A00()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_100755A10()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t sub_100755A20()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100755A30()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100755A40()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100755A60()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100755A70()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100755A80()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100755A90()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_100755AA0(Swift::String a1)
{
}

uint64_t sub_100755AB0()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100755AC0()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100755AD0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100755AE0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100755B00()
{
  return NSNotFound.getter();
}

uint64_t sub_100755B10()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_100755B20()
{
  return static CharacterSet.excessiveLeading.getter();
}

uint64_t sub_100755B30()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_100755B40()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100755B50()
{
  return Notification.name.getter();
}

uint64_t sub_100755B60()
{
  return Notification.userInfo.getter();
}

uint64_t sub_100755B70()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100755B80()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_100755B90()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100755BA0()
{
  return URLComponents.queryItems.modify();
}

uint64_t sub_100755BB0()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_100755BC0()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100755BD0()
{
  return URLComponents.url.getter();
}

uint64_t sub_100755BE0()
{
  return URLComponents.host.setter();
}

uint64_t sub_100755BF0()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_100755C00()
{
  return URLComponents.string.getter();
}

uint64_t sub_100755C10()
{
  return URLComponents.init()();
}

uint64_t sub_100755C20()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100755C30()
{
  return DateComponents.day.getter();
}

uint64_t sub_100755C40()
{
  return DateComponents.year.getter();
}

uint64_t sub_100755C50()
{
  return DateComponents.month.getter();
}

uint64_t sub_100755C60()
{
  return DateComponents.minute.getter();
}

uint64_t sub_100755C70()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100755C80()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100755C90()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100755CA0()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_100755CB0()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100755CC0()
{
  return AttributeScopes.UIKitAttributes.paragraphStyle.getter();
}

uint64_t sub_100755CD0()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t sub_100755CE0()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t sub_100755CF0()
{
  return AttributedString.subscript.setter();
}

uint64_t sub_100755D00()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_100755D10()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_100755D20()
{
  return AttributedString.subscript.modify();
}

uint64_t sub_100755D30()
{
  return AttributeContainer.subscript.setter();
}

uint64_t sub_100755D40()
{
  return AttributeContainer.init()();
}

uint64_t sub_100755D50()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_100755D60()
{
  return AttributeContainer.init(_:)();
}

uint64_t sub_100755D70()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t sub_100755D80()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_100755D90()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100755DA0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100755DB0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100755DC0()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_100755DD0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100755DE0()
{
  return AttributedStringProtocol.range<A>(of:options:locale:)();
}

uint64_t sub_100755DF0()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_100755E00()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_100755E10()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t sub_100755E20()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t sub_100755E30()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100755E40()
{
  return URL.lastPathComponent.getter();
}

void sub_100755E50(NSURL *retstr@<X8>)
{
}

uint64_t sub_100755E60()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100755E70()
{
  return URL.host.getter();
}

uint64_t sub_100755E80()
{
  return URL.scheme.getter();
}

uint64_t sub_100755E90()
{
  return URL.init(string:)();
}

uint64_t sub_100755EA0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100755EB0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100755EC0()
{
  return static Date.FormatStyle.TimeStyle.standard.getter();
}

uint64_t sub_100755ED0()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_100755EE0()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t sub_100755EF0()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_100755F00()
{
  return Date.FormatStyle.secondFraction(_:)();
}

uint64_t sub_100755F10()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t sub_100755F20()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t sub_100755F30()
{
  return static Date.FormatStyle.Symbol.SecondFraction.fractional(_:)();
}

uint64_t sub_100755F40()
{
  return type metadata accessor for Date.FormatStyle.Symbol.SecondFraction();
}

uint64_t sub_100755F50()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.omitted.getter();
}

uint64_t sub_100755F60()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t sub_100755F70()
{
  return static Date.FormatStyle.Symbol.Hour.twoDigits(amPM:)();
}

uint64_t sub_100755F80()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t sub_100755F90()
{
  return static Date.FormatStyle.Symbol.Minute.twoDigits.getter();
}

uint64_t sub_100755FA0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Minute();
}

uint64_t sub_100755FB0()
{
  return static Date.FormatStyle.Symbol.Second.twoDigits.getter();
}

uint64_t sub_100755FC0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Second();
}

uint64_t sub_100755FD0()
{
  return Date.FormatStyle.minute(_:)();
}

uint64_t sub_100755FE0()
{
  return Date.FormatStyle.second(_:)();
}

uint64_t sub_100755FF0()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t sub_100756000()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_100756010()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100756020()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_100756030()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_100756040()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_100756050()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100756060()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_100756070()
{
  return Date.formatted<A>(_:)();
}

uint64_t sub_100756080()
{
  return Date.init()();
}

uint64_t sub_100756090()
{
  return type metadata accessor for Date();
}

uint64_t sub_1007560A0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1007560B0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1007560C0()
{
  return UUID.init()();
}

uint64_t sub_1007560D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1007560E0()
{
  return Locale.identifier.getter();
}

uint64_t sub_1007560F0()
{
  return Locale.regionCode.getter();
}

uint64_t sub_100756100()
{
  return Locale.isJapanese.getter();
}

uint64_t sub_100756110()
{
  return Locale.prefersSmallerText.getter();
}

uint64_t sub_100756120()
{
  return Locale.baseWritingDirection.getter();
}

uint64_t sub_100756130()
{
  return Locale.paragraphLineHeightMultiple.getter();
}

uint64_t sub_100756140()
{
  return Locale.isKorean.getter();
}

uint64_t sub_100756150()
{
  return Locale.isChinese.getter();
}

uint64_t sub_100756160()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_100756170()
{
  return static Locale.availableIdentifiers.getter();
}

uint64_t sub_100756180()
{
  return static Locale.storefront.getter();
}

uint64_t sub_100756190()
{
  return Locale.hasExtraTallWritingSystem.getter();
}

uint64_t sub_1007561A0()
{
  return static Locale.current.getter();
}

uint64_t sub_1007561B0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1007561C0()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_1007561D0()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_1007561E0()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_1007561F0()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_100756200()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_100756210()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_100756220()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_100756230()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t sub_100756240()
{
  return Calendar.date(from:)();
}

uint64_t sub_100756250()
{
  return static Calendar.current.getter();
}

uint64_t sub_100756260()
{
  return Calendar.nextDate(after:matching:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_100756270()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100756280()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100756290()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t sub_1007562A0()
{
  return IndexSet.makeIterator()();
}

void sub_1007562B0(NSIndexSet *retstr@<X8>)
{
}

uint64_t sub_1007562C0()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1007562D0()
{
  return IndexSet.count.getter();
}

BOOL sub_1007562E0(Swift::Int a1)
{
  return IndexSet.contains(_:)(a1);
}

uint64_t sub_1007562F0()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_100756300()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t sub_100756310()
{
  return static TimeZone.current.getter();
}

uint64_t sub_100756320()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100756330()
{
  return IndexPath.init(arrayLiteral:)();
}

NSIndexPath sub_100756340()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_100756350()
{
  return static IndexPath.> infix(_:_:)();
}

uint64_t sub_100756360()
{
  return static IndexPath.< infix(_:_:)();
}

uint64_t sub_100756370()
{
  return static IndexPath.== infix(_:_:)();
}

uint64_t sub_100756380()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100756390()
{
  return IndexPath.init(row:section:)();
}

uint64_t sub_1007563A0()
{
  return IndexPath.row.getter();
}

uint64_t sub_1007563B0()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_1007563C0()
{
  return IndexPath.item.getter();
}

uint64_t sub_1007563D0()
{
  return IndexPath.section.getter();
}

uint64_t sub_1007563E0()
{
  return IndexPath.count.getter();
}

uint64_t sub_1007563F0()
{
  return IndexPath.init(index:)();
}

void sub_100756400(Swift::Int a1)
{
}

uint64_t sub_100756410()
{
  return IndexPath.appending(_:)();
}

uint64_t sub_100756420()
{
  return IndexPath.appending(_:)();
}

uint64_t sub_100756430()
{
  return IndexPath.init()();
}

uint64_t sub_100756440()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_100756450()
{
  return IndexPath.subscript.getter();
}

uint64_t sub_100756460()
{
  return type metadata accessor for CGPathFillRule();
}

NSNumber sub_100756470()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_100756480()
{
  return static CGFloat.allColumns.getter();
}

uint64_t sub_100756490()
{
  return static CGFloat.solvedValue(between:and:forInput:)();
}

uint64_t sub_1007564A0()
{
  return CGFloat.isLessThanOrEffectivelyEqualTo(_:accuracy:)();
}

uint64_t sub_1007564B0()
{
  return CGFloat.rounded(_:toScale:)();
}

uint64_t sub_1007564C0()
{
  return CGFloat.scalingLike(_:with:)();
}

uint64_t sub_1007564D0()
{
  return CGFloat.rawValue(in:)();
}

uint64_t sub_1007564E0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1007564F0()
{
  return GameLayerAchievementsPresenter.init(gameRecord:entryPoint:achievementIdsToHighlight:achievementIdToPresent:)();
}

uint64_t sub_100756500()
{
  return type metadata accessor for GameLayerAchievementsPresenter();
}

uint64_t sub_100756510()
{
  return type metadata accessor for GameLayerAchievementsEntryPoint();
}

uint64_t sub_100756520()
{
  return GameLayerAchievementsViewController.init(presenter:theme:objectGraph:)();
}

uint64_t sub_100756530()
{
  return type metadata accessor for GameLayerAchievementsViewController();
}

uint64_t sub_100756540()
{
  return type metadata accessor for Achievement();
}

uint64_t sub_100756550()
{
  return static AchievementCard.defaultMetrics.getter();
}

uint64_t sub_100756560()
{
  return AchievementCard.alwaysShowShadow.setter();
}

uint64_t sub_100756570()
{
  return AchievementCard.backgroundEffectsGroup.setter();
}

uint64_t sub_100756580()
{
  return AchievementCard.init(frame:metrics:theme:)();
}

uint64_t sub_100756590()
{
  return AchievementCard.model.setter();
}

uint64_t sub_1007565A0()
{
  return type metadata accessor for AchievementCard();
}

uint64_t sub_1007565B0()
{
  return type metadata accessor for AchievementsTheme();
}

uint64_t sub_1007565C0()
{
  return SmallPlayerCardData.buttonText.getter();
}

uint64_t sub_1007565D0()
{
  return SmallPlayerCardData.avatarImage.getter();
}

uint64_t sub_1007565E0()
{
  return SmallPlayerCardData.buttonAction.getter();
}

uint64_t sub_1007565F0()
{
  return SmallPlayerCardData.removeButtonAction.getter();
}

uint64_t sub_100756600()
{
  return SmallPlayerCardData.shouldShowMessagesBadge.getter();
}

uint64_t sub_100756610()
{
  return SmallPlayerCardData.avatarArtworkLoaderConfig.getter();
}

uint64_t sub_100756620()
{
  return SmallPlayerCardData.init(id:title:subtitle:buttonText:avatarArtworkLoaderConfig:avatarImage:shouldShowMessagesBadge:buttonAction:removeButtonAction:isEnabled:segue:messagesGroupIdentifier:groupRecipients:)();
}

uint64_t sub_100756630()
{
  return SmallPlayerCardData.id.getter();
}

uint64_t sub_100756640()
{
  return SmallPlayerCardData.segue.getter();
}

uint64_t sub_100756650()
{
  return SmallPlayerCardData.title.getter();
}

uint64_t sub_100756660()
{
  return SmallPlayerCardData.subtitle.getter();
}

uint64_t sub_100756670()
{
  return type metadata accessor for SmallPlayerCardData();
}

uint64_t sub_100756680()
{
  return SmallPlayerCardView.closeButton.getter();
}

uint64_t sub_100756690()
{
  return dispatch thunk of SmallPlayerCardView.prepareForReuse()();
}

uint64_t sub_1007566A0()
{
  return dispatch thunk of SmallPlayerCardView.buttonActionBlock.setter();
}

uint64_t sub_1007566B0()
{
  return dispatch thunk of SmallPlayerCardView.closeButtonActionBlock.getter();
}

uint64_t sub_1007566C0()
{
  return dispatch thunk of SmallPlayerCardView.closeButtonActionBlock.setter();
}

uint64_t sub_1007566D0()
{
  return dispatch thunk of SmallPlayerCardView.show(image:isAnimationPermitted:)();
}

uint64_t sub_1007566E0()
{
  return static SmallPlayerCardView.size(fitting:traitEnvironment:)();
}

uint64_t sub_1007566F0()
{
  return dispatch thunk of SmallPlayerCardView.apply(data:shouldSetImage:)();
}

uint64_t sub_100756700()
{
  return dispatch thunk of SmallPlayerCardView.image.getter();
}

uint64_t sub_100756710()
{
  return type metadata accessor for SmallPlayerCardView();
}

uint64_t sub_100756720()
{
  return type metadata accessor for AchievementCardLayout.Metrics();
}

uint64_t sub_100756730()
{
  return type metadata accessor for DashboardLaunchContext();
}

uint64_t sub_100756740()
{
  return static ActivityFeedPlatterView.viewHeight(for:)();
}

uint64_t sub_100756750()
{
  return ActivityFeedPlatterView.init(data:actionHandlers:)();
}

uint64_t sub_100756760()
{
  return type metadata accessor for ActivityFeedPlatterView();
}

uint64_t sub_100756770()
{
  return JetDashboardViewController.__allocating_init(launchContext:request:navigationProxy:)();
}

uint64_t sub_100756780()
{
  return type metadata accessor for JetDashboardViewController();
}

uint64_t sub_100756790()
{
  return type metadata accessor for ActivityFeedLockupViewModel();
}

uint64_t sub_1007567A0()
{
  return PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)();
}

uint64_t sub_1007567B0()
{
  return type metadata accessor for PlayerProfileViewController();
}

uint64_t sub_1007567C0()
{
  return ActivityFeedLockupActionHandlers.init(profileHandler:leaderboardsHandler:achievementsHandler:appHandler:)();
}

uint64_t sub_1007567D0()
{
  return type metadata accessor for ActivityFeedLockupActionHandlers();
}

uint64_t sub_1007567E0()
{
  return AppEntityViewAnnotation.init<A>(entity:state:)();
}

uint64_t sub_1007567F0()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t sub_100756800()
{
  return IntentView.init(what:transaction:configuration:working:failed:content:)();
}

uint64_t sub_100756810()
{
  return LoadingView.init<>()();
}

uint64_t sub_100756830()
{
  return IntentViewConfiguration.init()();
}

uint64_t sub_100756840()
{
  return type metadata accessor for IntentViewConfiguration();
}

uint64_t sub_100756850()
{
  return ShareSheetAppEventMetadata.text.getter();
}

uint64_t sub_100756860()
{
  return ShareSheetAppEventMetadata.artwork.getter();
}

uint64_t sub_100756870()
{
  return ShareSheetAppEventMetadata.subtitle.getter();
}

uint64_t sub_100756880()
{
  return makeModernAppStateController(deviceAppFetcher:updateRegistry:dataSources:)();
}

uint64_t sub_100756890()
{
  return StreamlinedInAppPurchaseOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:restrictions:subtitlePosition:alignment:)();
}

uint64_t sub_1007568A0()
{
  return static StreamlinedInAppPurchaseOfferButtonPresenter.activeStateDataSource.getter();
}

uint64_t sub_1007568B0()
{
  return static StreamlinedInAppPurchaseOfferButtonPresenter.use(stateDataSource:)();
}

uint64_t sub_1007568C0()
{
  return type metadata accessor for StreamlinedInAppPurchaseOfferButtonPresenter();
}

uint64_t sub_1007568D0()
{
  return SupplementaryAppPlatform.systemImageName.getter();
}

uint64_t sub_1007568E0()
{
  return SupplementaryAppPlatform.rawValue.getter();
}

uint64_t sub_1007568F0()
{
  return type metadata accessor for SupplementaryAppPlatform();
}

uint64_t sub_100756900()
{
  return InstallPagePreInstallFreeLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100756910()
{
  return InstallPagePreInstallFreeLayout.Metrics.init(iconSize:ageRatingMargin:ageRatingBaselineOffset:titleSpace:titleHorizontalMargin:parentTitleSpace:parentTitleHorizontalMargin:subtitleSpace:subtitleHorizontalMargin:descriptionSpace:descriptionHorizontalMargin:offerButtonMargin:bottomSpace:)();
}

uint64_t sub_100756920()
{
  return type metadata accessor for InstallPagePreInstallFreeLayout.Metrics();
}

uint64_t sub_100756930()
{
  return InstallPagePreInstallFreeLayout.init(metrics:iconView:titleText:parentTitleText:subtitleText:descriptionText:ageRatingView:offerButton:)();
}

uint64_t sub_100756940()
{
  return type metadata accessor for InstallPagePreInstallFreeLayout();
}

uint64_t sub_100756950()
{
  return InstallPagePreInstallPaidLayout.measurements(fitting:in:)();
}

uint64_t sub_100756960()
{
  return InstallPagePreInstallPaidLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100756970()
{
  return InstallPagePreInstallPaidLayout.Metrics.init(titleSpace:subtitleSpace:separatorSpace:descriptionSpace:iconViewMargin:bottomLockupMargin:horizontalMargin:)();
}

uint64_t sub_100756980()
{
  return type metadata accessor for InstallPagePreInstallPaidLayout.Metrics();
}

uint64_t sub_100756990()
{
  return InstallPagePreInstallPaidLayout.init(metrics:iconView:titleText:subtitleText:separator:descriptionText:bottomLockupView:)();
}

uint64_t sub_1007569A0()
{
  return type metadata accessor for InstallPagePreInstallPaidLayout();
}

uint64_t sub_1007569B0()
{
  return TodayCardMediaAppIcon.icon.getter();
}

uint64_t sub_1007569C0()
{
  return type metadata accessor for TodayCardMediaAppIcon();
}

uint64_t sub_1007569D0()
{
  return TodayCardMediaAppEvent.formattedDates.getter();
}

uint64_t sub_1007569E0()
{
  return TodayCardMediaAppEvent.tintColor.getter();
}

uint64_t sub_1007569F0()
{
  return type metadata accessor for TodayCardMediaAppEvent();
}

uint64_t sub_100756A00()
{
  return BadgeContentKeyContentRatingResource.getter();
}

uint64_t sub_100756A10()
{
  return BadgeContentKeyContentRating.getter();
}

uint64_t sub_100756A20()
{
  return PurchaseHistoryAppStateDataSource.__allocating_init(asPartOf:)();
}

uint64_t sub_100756A30()
{
  return type metadata accessor for PurchaseHistoryAppStateDataSource();
}

uint64_t sub_100756A40()
{
  return TodayCardMediaInAppPurchase.lockup.getter();
}

uint64_t sub_100756A50()
{
  return type metadata accessor for TodayCardMediaInAppPurchase();
}

uint64_t sub_100756A60()
{
  return CondensedSearchInAppEventContentLayout.Metrics.lockupBottomSpacing.getter();
}

uint64_t sub_100756A70()
{
  return static CondensedSearchInAppEventContentLayout.Metrics.standard.getter();
}

uint64_t sub_100756A80()
{
  return type metadata accessor for CondensedSearchInAppEventContentLayout.Metrics();
}

uint64_t _s22SubscribePageExtension33CondensedInAppPurchaseContentViewC7metrics0F16StoreKitInternal0d6SearchefG10CardLayoutV7MetricsVvpfi_0()
{
  return static CondensedSearchInAppPurchaseCardLayout.Metrics.baseMetrics.getter();
}

uint64_t sub_100756AA0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.cardInsets.getter();
}

uint64_t sub_100756AB0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerFont.getter();
}

uint64_t sub_100756AC0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.tileOffset.getter();
}

uint64_t sub_100756AD0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleFont.getter();
}

uint64_t sub_100756AE0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.textTopMargin.getter();
}

uint64_t sub_100756AF0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleTextSpace.getter();
}

uint64_t sub_100756B00()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerTextSpace.getter();
}

uint64_t sub_100756B10()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleTextSpace.getter();
}

uint64_t sub_100756B20()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleNumberOfLines.getter();
}

uint64_t sub_100756B30()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerNumberOfLines.getter();
}

uint64_t sub_100756B40()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.offerButtonTopMargin.getter();
}

uint64_t sub_100756B50()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.withCornerTileOffset(_:)();
}

uint64_t sub_100756B60()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.artworkAXBottomMargin.getter();
}

uint64_t sub_100756B70()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.artworkTrailingMargin.getter();
}

Swift::Int sub_100756B80(UITraitCollection a1)
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleNumberOfLines(for:)(a1);
}

uint64_t sub_100756B90()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleFont.getter();
}

uint64_t sub_100756BA0()
{
  return type metadata accessor for CondensedSearchInAppPurchaseCardLayout.Metrics();
}

uint64_t sub_100756BB0()
{
  return dispatch thunk of TriggerPersistantStore.date(for:)();
}

uint64_t sub_100756BC0()
{
  return dispatch thunk of TriggerPersistantStore.remove(_:)();
}

void sub_100756BD0(Swift::OpaquePointer a1)
{
}

uint64_t sub_100756BE0()
{
  return TodayCardMediaMultiAppFallback.dominantStyle.getter();
}

uint64_t sub_100756BF0()
{
  return TodayCardMediaMultiAppFallback.additionalText.getter();
}

uint64_t sub_100756C00()
{
  return TodayCardMediaMultiAppFallback.lockups.getter();
}

uint64_t sub_100756C10()
{
  return type metadata accessor for TodayCardMediaMultiAppFallback();
}

uint64_t sub_100756C20()
{
  return BadgeContentKeyNativeContentView.getter();
}

uint64_t sub_100756C30()
{
  return RemotePersonalizationAppStateDataSource.__allocating_init(asPartOf:)();
}

uint64_t sub_100756C40()
{
  return type metadata accessor for RemotePersonalizationAppStateDataSource();
}

uint64_t sub_100756C50()
{
  return type metadata accessor for TodayCardMediaBrandedSingleApp();
}

uint64_t sub_100756C60()
{
  return InAppPurchaseState.hasBeenPurchased.getter();
}

uint64_t sub_100756C70()
{
  return type metadata accessor for InAppPurchaseState();
}

uint64_t sub_100756C80()
{
  return type metadata accessor for InAppPurchaseTheme();
}

uint64_t sub_100756C90()
{
  return InAppPurchaseAction.streamlineBuyAction.getter();
}

uint64_t sub_100756CA0()
{
  return InAppPurchaseAction.installRequiredAction.getter();
}

uint64_t sub_100756CB0()
{
  return InAppPurchaseAction.minimumShortVersionSupportingInAppPurchaseFlow.getter();
}

uint64_t sub_100756CC0()
{
  return InAppPurchaseAction.appBundleId.getter();
}

uint64_t sub_100756CD0()
{
  return InAppPurchaseAction.productTitle.getter();
}

uint64_t sub_100756CE0()
{
  return InAppPurchaseAction.productIdentifier.getter();
}

uint64_t sub_100756CF0()
{
  return InAppPurchaseAction.additionalBuyParams.getter();
}

uint64_t sub_100756D00()
{
  return InAppPurchaseAction.appTitle.getter();
}

uint64_t sub_100756D10()
{
  return InAppPurchaseAction.appAdamId.getter();
}

uint64_t sub_100756D20()
{
  return type metadata accessor for InAppPurchaseAction();
}

uint64_t sub_100756D30()
{
  return InAppPurchaseLockup.productAction.getter();
}

uint64_t sub_100756D40()
{
  return InAppPurchaseLockup.isSubscription.getter();
}

uint64_t sub_100756D50()
{
  return InAppPurchaseLockup.descriptionText.getter();
}

uint64_t sub_100756D60()
{
  return InAppPurchaseLockup.theme.getter();
}

uint64_t sub_100756D70()
{
  return InAppPurchaseLockup.parent.getter();
}

uint64_t sub_100756D80()
{
  return type metadata accessor for InAppPurchaseLockup();
}

uint64_t sub_100756D90()
{
  return InAppPurchaseShowcase.descriptionText.getter();
}

uint64_t sub_100756DA0()
{
  return InAppPurchaseShowcase.lockup.getter();
}

uint64_t sub_100756DB0()
{
  return InAppPurchaseShowcase.subtitle.getter();
}

uint64_t sub_100756DC0()
{
  return type metadata accessor for InAppPurchaseShowcase();
}

uint64_t sub_100756DD0()
{
  return InAppPurchaseIconLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100756DE0()
{
  return InAppPurchaseIconLayout.Metrics.mainIconSize.getter();
}

uint64_t sub_100756DF0()
{
  return InAppPurchaseIconLayout.Metrics.mainIconDimension.getter();
}

uint64_t sub_100756E00()
{
  return InAppPurchaseIconLayout.Metrics.init(mainIconDimension:shouldPlaceTileAtOrigin:scaleToFit:)();
}

uint64_t sub_100756E10()
{
  return InAppPurchaseIconLayout.Metrics.tileIconWidth.getter();
}

uint64_t sub_100756E20()
{
  return InAppPurchaseIconLayout.Metrics.scaleToFit.getter();
}

uint64_t sub_100756E30()
{
  return InAppPurchaseIconLayout.Metrics.tileOffset.getter();
}

uint64_t sub_100756E40()
{
  return InAppPurchaseIconLayout.Metrics.overallSize.getter();
}

uint64_t sub_100756E50()
{
  return InAppPurchaseIconLayout.Metrics.displaysPlus.getter();
}

uint64_t sub_100756E60()
{
  return InAppPurchaseIconLayout.Metrics.plusLineWidth.getter();
}

uint64_t sub_100756E70()
{
  return InAppPurchaseIconLayout.Metrics.tileBorderWidth.getter();
}

uint64_t sub_100756E80()
{
  return type metadata accessor for InAppPurchaseIconLayout.Metrics();
}

uint64_t sub_100756E90()
{
  return InAppPurchaseIconLayout.init(metrics:artworkView:artworkContainingView:backgroundView:plusView:tileArtworkView:tileArtworkBackgroundView:)();
}

uint64_t sub_100756EA0()
{
  return type metadata accessor for InAppPurchaseIconLayout();
}

uint64_t sub_100756EB0()
{
  return InAppPurchaseInstallPage.preInstallOfferDescription.getter();
}

uint64_t sub_100756EC0()
{
  return InAppPurchaseInstallPage.parentLockup.getter();
}

uint64_t sub_100756ED0()
{
  return InAppPurchaseInstallPage.lockup.getter();
}

uint64_t sub_100756EE0()
{
  return type metadata accessor for InAppPurchaseInstallPage();
}

uint64_t sub_100756EF0()
{
  return InAppPurchaseSearchResult.lockup.getter();
}

uint64_t sub_100756F00()
{
  return type metadata accessor for InAppPurchaseSearchResult();
}

uint64_t sub_100756F10()
{
  return InAppPurchaseStateDataSource.init(withStateProvider:)();
}

void sub_100756F20()
{
}

uint64_t sub_100756F30()
{
  return InAppPurchaseStateDataSource.addObserver(_:action:)();
}

uint64_t sub_100756F40()
{
  return InAppPurchaseStateDataSource.removeObserver(_:)();
}

uint64_t sub_100756F50()
{
  return InAppPurchaseStateDataSource.state(for:subscriptionFamilyId:)();
}

uint64_t sub_100756F60()
{
  return type metadata accessor for InAppPurchaseStateDataSource();
}

uint64_t sub_100756F70()
{
  return InAppPurchaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100756F80()
{
  return InAppPurchaseLockupViewLayout.Metrics.iconMargin.getter();
}

uint64_t sub_100756F90()
{
  return InAppPurchaseLockupViewLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_100756FA0()
{
  return InAppPurchaseLockupViewLayout.Metrics.isHeightConstrained.setter();
}

uint64_t sub_100756FB0()
{
  return InAppPurchaseLockupViewLayout.Metrics.init(iconSize:iconMargin:titlePrimaryLineSpace:titleSecondaryLineSpace:subtitleLineSpace:descriptionPrimaryLineSpace:descriptionSecondaryLineSpace:offerButtonMargin:offerButtonSize:isHeightConstrained:)();
}

uint64_t sub_100756FC0()
{
  return InAppPurchaseLockupViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_100756FD0()
{
  return type metadata accessor for InAppPurchaseLockupViewLayout.Metrics();
}

uint64_t sub_100756FE0()
{
  return InAppPurchaseLockupViewLayout.init(metrics:iconView:titleText:subtitleText:descriptionText:offerButton:)();
}

uint64_t sub_100756FF0()
{
  return type metadata accessor for InAppPurchaseLockupViewLayout();
}

uint64_t sub_100757000()
{
  return InAppPurchaseSearchResultLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100757010()
{
  return static InAppPurchaseSearchResultLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_100757020()
{
  return InAppPurchaseSearchResultLayout.Metrics.init(offerButtonSize:offerButtonMargin:inAppPurchaseTextSpace:titleTextSpace:subtitleTextSpace:descriptionTextSpace:detailsBottomMargin:accessibilityDetailsBottomMargin:preferredMainArtworkWidth:regularLockupAreaAspectRatio:compactLockupAreaAspectRatio:regularBodySideEdgeInsetPercentage:regularBodyHorizontalComponentSpacingPercentage:compactBodySideEdgeInsetPercentage:compactBodyHorizontalComponentSpacingPercentage:inAppIconBottomMargin:bodyVerticalPadding:)();
}

uint64_t sub_100757030()
{
  return InAppPurchaseSearchResultLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_100757040()
{
  return type metadata accessor for InAppPurchaseSearchResultLayout.Metrics();
}

uint64_t sub_100757050()
{
  return InAppPurchaseSearchResultLayout.init(metrics:inAppPurchaseText:titleText:subtitleText:offerButton:inAppPurchaseIcon:inAppPurchaseDescription:inAppPurchaseBackgroundView:)();
}

uint64_t sub_100757060()
{
  return type metadata accessor for InAppPurchaseSearchResultLayout();
}

uint64_t sub_100757070()
{
  return InAppPurchaseInstallPagePresenter.init(objectGraph:sidepack:pageUrl:appStateController:)();
}

uint64_t sub_100757080()
{
  return dispatch thunk of InAppPurchaseInstallPagePresenter.purchaseDidComplete(for:)();
}

uint64_t sub_100757090()
{
  return static InAppPurchaseInstallPagePresenter.use(stateDataSource:)();
}

uint64_t sub_1007570A0()
{
  return dispatch thunk of InAppPurchaseInstallPagePresenter.view.setter();
}

uint64_t sub_1007570B0()
{
  return type metadata accessor for InAppPurchaseInstallPagePresenter();
}

uint64_t sub_1007570C0()
{
  return InAppPurchaseOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:restrictions:subtitlePosition:alignment:)();
}

uint64_t sub_1007570D0()
{
  return static InAppPurchaseOfferButtonPresenter.use(stateDataSource:)();
}

uint64_t sub_1007570E0()
{
  return type metadata accessor for InAppPurchaseOfferButtonPresenter();
}

uint64_t sub_1007570F0()
{
  return InAppPurchaseShowcaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100757100()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.offerButtonSize.getter();
}

uint64_t sub_100757110()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.init(iconSize:titleSpace:subtitleSpace:offerTopSpace:offerButtonSize:descriptionSpace:)();
}

uint64_t sub_100757120()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_100757130()
{
  return type metadata accessor for InAppPurchaseShowcaseLockupViewLayout.Metrics();
}

uint64_t sub_100757140()
{
  return InAppPurchaseShowcaseLockupViewLayout.init(metrics:iconView:titleText:subtitleText:descriptionText:offerButton:)();
}

uint64_t sub_100757150()
{
  return type metadata accessor for InAppPurchaseShowcaseLockupViewLayout();
}

uint64_t sub_100757160()
{
  return OpenAppAction.destination.getter();
}

uint64_t sub_100757170()
{
  return OpenAppAction.allowBetaApps.getter();
}

uint64_t sub_100757180()
{
  return OpenAppAction.init(title:adamId:allowBetaApps:destination:presentationStyle:actionMetrics:)();
}

uint64_t sub_100757190()
{
  return OpenAppAction.adamId.getter();
}

uint64_t sub_1007571A0()
{
  return type metadata accessor for OpenAppAction();
}

uint64_t sub_1007571B0()
{
  return dispatch thunk of static ASDInAppPurchaseDatabase.refresh()();
}

uint64_t sub_1007571C0()
{
  return type metadata accessor for ASDInAppPurchaseDatabase();
}

uint64_t sub_1007571D0()
{
  return ASDInAppPurchaseStateProvider.init()();
}

uint64_t sub_1007571E0()
{
  return type metadata accessor for ASDInAppPurchaseStateProvider();
}

uint64_t sub_1007571F0()
{
  return type metadata accessor for ClearAppUsageDataAction();
}

uint64_t sub_100757200()
{
  return LegacyAppState.AppInstallationDetails.hasPostProcessing.getter();
}

uint64_t sub_100757210()
{
  return LegacyAppState.AppInstallationDetails.downloadingPhaseProgress.getter();
}

uint64_t sub_100757220()
{
  return LegacyAppState.AppInstallationDetails.postProcessingPhaseProgress.getter();
}

uint64_t sub_100757230()
{
  return type metadata accessor for LegacyAppState.AppInstallationDetails();
}

uint64_t sub_100757240()
{
  return LegacyAppState.isUpdatable.getter();
}

uint64_t sub_100757250()
{
  return LegacyAppState.hasBeenPurchased.getter();
}

uint64_t sub_100757260()
{
  return LegacyAppState.isLocalApplication.getter();
}

uint64_t sub_100757270()
{
  return LegacyAppState.estimatedTimeRemaining.getter();
}

uint64_t sub_100757280()
{
  return LegacyAppState.estimatedTimeRemainingText.getter();
}

uint64_t sub_100757290()
{
  return LegacyAppState.isBuyable.getter();
}

uint64_t sub_1007572A0()
{
  return type metadata accessor for LegacyAppState();
}

uint64_t sub_1007572B0()
{
  return type metadata accessor for ModernAppStateDataSource();
}

uint64_t sub_1007572C0()
{
  return ModernAppStateDataSource.init(_:isIncremental:supportedAppKinds:)();
}

uint64_t sub_1007572D0()
{
  return static UpdateStore.didChangeNotification.getter();
}

uint64_t sub_1007572E0()
{
  return static UpdateStore.shared.getter();
}

uint64_t sub_1007572F0()
{
  return type metadata accessor for UpdateStore();
}

uint64_t sub_100757300()
{
  return static PendingAppLaunch.didFailToLaunch()();
}

uint64_t sub_100757310()
{
  return static PendingAppLaunch.didFinishLaunch(postEventUsing:)();
}

uint64_t sub_100757320()
{
  return RestoreAppStoreAction.gatedAppAdamId.getter();
}

uint64_t sub_100757330()
{
  return RestoreAppStoreAction.init(actionMetrics:gatedAppAdamId:)();
}

uint64_t sub_100757340()
{
  return type metadata accessor for RestoreAppStoreAction();
}

uint64_t sub_100757350()
{
  return TodayCardAppEventLockupOverlay.lockup.getter();
}

uint64_t sub_100757360()
{
  return type metadata accessor for TodayCardAppEventLockupOverlay();
}

uint64_t sub_100757370()
{
  return dispatch thunk of AppSearchResult.shouldDisplayMedia.getter();
}

uint64_t sub_100757380()
{
  return AppSearchResult.lockup.getter();
}

uint64_t sub_100757390()
{
  return type metadata accessor for AppSearchResult();
}

uint64_t sub_1007573A0()
{
  return type metadata accessor for AppShowcaseType();
}

uint64_t sub_1007573B0()
{
  return dispatch thunk of AppStateMachine.hasCurrentBetaState.getter();
}

uint64_t sub_1007573C0()
{
  return dispatch thunk of AppStateMachine.addStateTransitionObserver(_:action:)();
}

uint64_t sub_1007573D0()
{
  return dispatch thunk of AppStateMachine.appStateController.getter();
}

uint64_t sub_1007573E0()
{
  return dispatch thunk of AppStateMachine.removeStateTransitionActions(for:)();
}

uint64_t sub_1007573F0()
{
  return dispatch thunk of AppStateMachine.currentState.getter();
}

uint64_t sub_100757400()
{
  return dispatch thunk of AppStateMachine.currentStateIncludingBeta(_:)();
}

uint64_t sub_100757410()
{
  return dispatch thunk of AppStateMachine.startDownloadTime.getter();
}

uint64_t sub_100757420()
{
  return dispatch thunk of AppStateMachine.adamId.getter();
}

uint64_t sub_100757430()
{
  return type metadata accessor for AppPromotionType();
}

uint64_t sub_100757440()
{
  return AppUpdateLockups.pendingManual.getter();
}

uint64_t sub_100757450()
{
  return type metadata accessor for AppUpdateLockups();
}

uint64_t sub_100757460()
{
  return AppEventDetailPage.appEvent.getter();
}

uint64_t sub_100757470()
{
  return AppEventDetailPage.shareAction.getter();
}

uint64_t sub_100757480()
{
  return AppEventDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_100757490()
{
  return AppEventDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_1007574A0()
{
  return AppEventDetailPage.video.getter();
}

uint64_t sub_1007574B0()
{
  return AppEventDetailPage.artwork.getter();
}

uint64_t sub_1007574C0()
{
  return type metadata accessor for AppEventDetailPage();
}

uint64_t sub_1007574D0()
{
  return dispatch thunk of AppStateController.refreshState(for:)();
}

uint64_t sub_1007574E0()
{
  return dispatch thunk of AppStateController.setWaiting(for:installationType:)();
}

uint64_t sub_1007574F0()
{
  return dispatch thunk of AppStateController.clearWaiting(for:refreshState:)();
}

uint64_t sub_100757500()
{
  return dispatch thunk of AppStateController.stateMachine(forApp:)();
}

uint64_t sub_100757510()
{
  return dispatch thunk of AppStateController.refreshDataSources(for:completion:)();
}

uint64_t sub_100757520()
{
  return AppStateController.clearWaiting(for:)();
}

uint64_t sub_100757530()
{
  return static AppExitMetricsEvent.makeData()();
}

uint64_t sub_100757540()
{
  return type metadata accessor for AppEnterMetricsEvent.EnterKind();
}

uint64_t sub_100757550()
{
  return static AppEnterMetricsEvent.makeData(enterKind:)();
}

uint64_t sub_100757560()
{
  return AppEventSearchResult.appEvent.getter();
}

uint64_t sub_100757570()
{
  return AppEventSearchResult.lockup.getter();
}

uint64_t sub_100757580()
{
  return type metadata accessor for AppEventSearchResult();
}

uint64_t sub_1007575A0()
{
  return AppUpdatesDataSource.makeUpdatesLockupsStream()();
}

uint64_t sub_1007575B0()
{
  return AppUpdatesDataSource.init(objectGraph:)();
}

uint64_t sub_1007575C0()
{
  return type metadata accessor for AppUpdatesDataSource();
}

uint64_t sub_1007575D0()
{
  return AppEventFormattedDate.countdownToDate.getter();
}

uint64_t sub_1007575E0()
{
  return AppEventFormattedDate.displayFromDate.getter();
}

uint64_t sub_1007575F0()
{
  return AppEventFormattedDate.displayText.getter();
}

uint64_t sub_100757600()
{
  return AppEventFormattedDate.showLiveIndicator.getter();
}

uint64_t sub_100757610()
{
  return AppEventFormattedDate.countdownStringKey.getter();
}

uint64_t sub_100757620()
{
  return AppOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:appStoreInstallStateMonitor:restrictions:subtitlePosition:alignment:hasCompactRedownloads:arePreordersCancellable:includeBetaApps:)();
}

uint64_t sub_100757630()
{
  return type metadata accessor for AppOfferButtonPresenter();
}

uint64_t sub_100757640()
{
  return AppLaunchTrampolineAction.fallbackAction.getter();
}

uint64_t sub_100757650()
{
  return AppLaunchTrampolineAction.payloadUrl.getter();
}

uint64_t sub_100757660()
{
  return AppLaunchTrampolineAction.bundleId.getter();
}

uint64_t sub_100757670()
{
  return AppEventNotificationConfig.scheduleClickEvent.getter();
}

uint64_t sub_100757680()
{
  return AppEventNotificationConfig.cancelScheduleClickEvent.getter();
}

uint64_t sub_100757690()
{
  return AppEventNotificationConfig.appEventId.getter();
}

uint64_t sub_1007576A0()
{
  return AppEventNotificationConfig.displayTime.getter();
}

uint64_t sub_1007576B0()
{
  return AppEventNotificationConfig.failureAction.getter();
}

uint64_t sub_1007576C0()
{
  return AppEventNotificationConfig.scheduledAction.getter();
}

uint64_t sub_1007576D0()
{
  return AppEventNotificationConfig.notAuthorizedAction.getter();
}

uint64_t sub_1007576E0()
{
  return AppEventDetailPagePresenter.init(objectGraph:appEventDetailPage:)();
}

uint64_t sub_1007576F0()
{
  return dispatch thunk of AppEventDetailPagePresenter.lockupClickAction.getter();
}

uint64_t sub_100757700()
{
  return dispatch thunk of AppEventDetailPagePresenter.sizeClassDidChange()();
}

uint64_t sub_100757710()
{
  return dispatch thunk of AppEventDetailPagePresenter.view.setter();
}

uint64_t sub_100757720()
{
  return type metadata accessor for AppEventDetailPagePresenter();
}

uint64_t sub_100757730()
{
  return AppShowcaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100757740()
{
  return AppShowcaseLockupViewLayout.Metrics.init(isCenterAligned:iconSize:wordmarkSpace:titleSpace:titleWithWordmarkSpace:descriptionSpace:descriptionBottomBufferSpace:offerLabelSpace:offerLabelBottomBufferSpace:offerButtonSize:crossLinkTitleSpace:crossLinkTitleWithWordmarkSpace:crossLinkSubtitleSpace:)();
}

uint64_t sub_100757750()
{
  return type metadata accessor for AppShowcaseLockupViewLayout.Metrics();
}

uint64_t sub_100757760()
{
  return AppShowcaseLockupViewLayout.init(metrics:iconView:wordmarkView:titleText:descriptionText:offerButton:offerText:crossLinkTitleText:crossLinkSubtitleText:)();
}

uint64_t sub_100757770()
{
  return type metadata accessor for AppShowcaseLockupViewLayout();
}

uint64_t sub_100757780()
{
  return AppPromotionDetailPagePresenter.init(objectGraph:appPromotionDetailPage:)();
}

uint64_t sub_100757790()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.lockupClickAction.getter();
}

uint64_t sub_1007577A0()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.sizeClassDidChange()();
}

uint64_t sub_1007577B0()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.view.setter();
}

uint64_t sub_1007577C0()
{
  return type metadata accessor for AppPromotionDetailPagePresenter();
}

uint64_t sub_1007577D0()
{
  return AppEvent.moduleVideo.getter();
}

uint64_t sub_1007577E0()
{
  return AppEvent.requirements.getter();
}

uint64_t sub_1007577F0()
{
  return AppEvent.moduleArtwork.getter();
}

uint64_t sub_100757800()
{
  return AppEvent.formattedDates.getter();
}

uint64_t sub_100757810()
{
  return AppEvent.mediaOverlayStyle.getter();
}

uint64_t sub_100757820()
{
  return AppEvent.notificationConfig.getter();
}

uint64_t sub_100757830()
{
  return AppEvent.includeBorderInDarkMode.getter();
}

uint64_t sub_100757840()
{
  return AppEvent.hideLockupWhenNotInstalled.getter();
}

uint64_t sub_100757850()
{
  return AppEvent.kind.getter();
}

uint64_t sub_100757860()
{
  return AppEvent.title.getter();
}

uint64_t sub_100757870()
{
  return AppEvent.detail.getter();
}

uint64_t sub_100757880()
{
  return AppEvent.lockup.getter();
}

uint64_t sub_100757890()
{
  return AppEvent.subtitle.getter();
}

uint64_t sub_1007578A0()
{
  return type metadata accessor for AppEvent();
}

uint64_t sub_1007578B0()
{
  return AppPlatform.rawValue.getter();
}

uint64_t sub_1007578C0()
{
  return type metadata accessor for AppPlatform();
}

uint64_t sub_1007578D0()
{
  return AppShowcase.descriptionText.getter();
}

uint64_t sub_1007578E0()
{
  return AppShowcase.type.getter();
}

uint64_t sub_1007578F0()
{
  return AppShowcase.video.getter();
}

uint64_t sub_100757900()
{
  return AppShowcase.lockup.getter();
}

uint64_t sub_100757910()
{
  return type metadata accessor for AppShowcase();
}

uint64_t sub_100757920()
{
  return AppPromotion.clickAction.getter();
}

uint64_t sub_100757930()
{
  return AppPromotion.promotionType.getter();
}

uint64_t sub_100757940()
{
  return type metadata accessor for AppPromotion();
}

uint64_t sub_100757950()
{
  return type metadata accessor for StoreViewControllerLifecycleEvent();
}

uint64_t sub_100757960()
{
  return dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
}

uint64_t sub_100757970()
{
  return StoreTab.Identifier.init(navigationTab:)();
}

uint64_t sub_100757980()
{
  return StoreTab.Identifier.init(rawValue:)();
}

uint64_t sub_100757990()
{
  return StoreTab.Identifier.rawValue.getter();
}

uint64_t sub_1007579A0()
{
  return type metadata accessor for StoreTab.Identifier();
}

uint64_t sub_1007579B0()
{
  return StoreTab.init(identifier:url:title:imageIdentifier:editorialPageUrls:)();
}

uint64_t sub_1007579C0()
{
  return type metadata accessor for StoreTab();
}

uint64_t sub_1007579D0()
{
  return type metadata accessor for AppStoreEngagementEvent();
}

uint64_t sub_1007579E0()
{
  return AppStoreEngagementManager.recordEngagement(event:resultHandler:)();
}

uint64_t sub_1007579F0()
{
  return AppStoreEngagementManager.properties.getter();
}

uint64_t sub_100757A00()
{
  return AppStoreEngagementManager.init(objectGraph:subscriptionManager:)();
}

void sub_100757A10(Swift::String _, Swift::Bool isEnabled)
{
}

BOOL sub_100757A20(Swift::String identifier)
{
  return AppStoreEngagementManager.isBadgeEnabled(identifier:)(identifier);
}

uint64_t sub_100757A30()
{
  return AppStoreEngagementManager.previouslyDisabledProperties.getter();
}

uint64_t sub_100757A40()
{
  return type metadata accessor for AppStoreEngagementManager();
}

uint64_t sub_100757A50()
{
  return dispatch thunk of AppStoreInstallStateMonitor.onAppStoreInstallStateChange.getter();
}

uint64_t sub_100757A60()
{
  return dispatch thunk of AppStoreInstallStateMonitor.appStoreInstalled.getter();
}

void sub_100757A70()
{
}

uint64_t sub_100757A80()
{
  return dispatch thunk of AppStoreOnDeviceRecommendationsManager.loadInferences(for:)();
}

uint64_t sub_100757A90()
{
  return dispatch thunk of AppStoreOnDeviceRecommendationsManager.clearData()();
}

uint64_t sub_100757AA0()
{
  return type metadata accessor for AppStoreOnDeviceRecommendationsManager();
}

uint64_t sub_100757AB0()
{
  return AppStoreDeepLink.init(userActivity:refApp:)();
}

uint64_t sub_100757AC0()
{
  return AppStoreDeepLink.url.getter();
}

uint64_t sub_100757AD0()
{
  return AppStoreDeepLink.referral.getter();
}

uint64_t sub_100757AE0()
{
  return type metadata accessor for AppStoreDeepLink();
}

uint64_t sub_100757AF0()
{
  return Annotation.linkAction.getter();
}

uint64_t sub_100757B00()
{
  return Annotation.shouldAlwaysPresentExpanded.getter();
}

uint64_t sub_100757B10()
{
  return Annotation.items.getter();
}

uint64_t sub_100757B20()
{
  return Annotation.title.getter();
}

uint64_t sub_100757B30()
{
  return Annotation.summary.getter();
}

uint64_t sub_100757B40()
{
  return Annotation.items_V2.getter();
}

uint64_t sub_100757B50()
{
  return type metadata accessor for Annotation();
}

uint64_t sub_100757B60()
{
  return ArcadePage.subscriptionLockup.getter();
}

uint64_t sub_100757B70()
{
  return type metadata accessor for ArcadePage();
}

uint64_t sub_100757B80()
{
  return type metadata accessor for BadgeStyle();
}

uint64_t sub_100757B90()
{
  return BorderView.borderColor.setter();
}

uint64_t sub_100757BA0()
{
  return BorderView.borderWidth.setter();
}

uint64_t sub_100757BB0()
{
  return type metadata accessor for BorderView();
}

uint64_t sub_100757BC0()
{
  return FlowAction.referrerUrl.getter();
}

uint64_t sub_100757BD0()
{
  return FlowAction.setPageData(_:)();
}

uint64_t sub_100757BE0()
{
  return FlowAction.referrerData.getter();
}

uint64_t sub_100757BF0()
{
  return FlowAction.animationBehavior.getter();
}

uint64_t sub_100757C00()
{
  return FlowAction.presentationContext.getter();
}

uint64_t sub_100757C10()
{
  return FlowAction.presentationContext.setter();
}

uint64_t sub_100757C20()
{
  return FlowAction.pageDataPageRenderMetrics.getter();
}

uint64_t sub_100757C30()
{
  return FlowAction.init(id:title:artwork:page:url:referrerUrl:referrerData:pageData:actionMetrics:presentationContext:animationBehavior:origin:presentationStyle:presentation:)();
}

uint64_t sub_100757C40()
{
  return FlowAction.page.getter();
}

uint64_t sub_100757C50()
{
  return FlowAction.origin.getter();
}

uint64_t sub_100757C60()
{
  return FlowAction.pageUrl.getter();
}

uint64_t sub_100757C70()
{
  return FlowAction.pageData<A>(as:or:)();
}

uint64_t sub_100757C80()
{
  return type metadata accessor for FlowAction();
}

uint64_t sub_100757C90()
{
  return static FlowOrigin.== infix(_:_:)();
}

uint64_t sub_100757CA0()
{
  return type metadata accessor for FlowOrigin();
}

uint64_t sub_100757CB0()
{
  return static GameCenter.fetchGameRecord(for:with:)();
}

uint64_t sub_100757CC0()
{
  return static GameCenter.withLocalPlayer(on:_:)();
}

uint64_t sub_100757CD0()
{
  return static GameCenter.addContactToDenyList(_:for:)();
}

uint64_t sub_100757CE0()
{
  return type metadata accessor for GameCenter.PushFriendInvitationType();
}

uint64_t sub_100757CF0()
{
  return static GameCenter.inviteFriendViewController(localPlayer:contactId:)();
}

uint64_t sub_100757D10()
{
  return type metadata accessor for GameCenter();
}

uint64_t sub_100757D20()
{
  return HttpAction.failureAction.getter();
}

uint64_t sub_100757D30()
{
  return HttpAction.successAction.getter();
}

uint64_t sub_100757D40()
{
  return HttpAction.needsMediaToken.getter();
}

uint64_t sub_100757D50()
{
  return HttpAction.start(urlSession:bag:process:bagContract:mediaTokenService:)();
}

uint64_t sub_100757D60()
{
  return type metadata accessor for HttpAction();
}

uint64_t sub_100757D70()
{
  return dispatch thunk of LinkLoader.setPresentation(_:forKey:)();
}

uint64_t sub_100757D80()
{
  return dispatch thunk of LinkLoader.fetchPresentation(for:cacheEnabled:)();
}

uint64_t sub_100757D90()
{
  return dispatch thunk of LinkLoader.availablePresentation(for:)();
}

uint64_t sub_100757DA0()
{
  return LinkLoader.init(_:)();
}

uint64_t sub_100757DB0()
{
  return type metadata accessor for MSOContext();
}

uint64_t sub_100757DC0()
{
  return static OfferStyle.== infix(_:_:)();
}

uint64_t sub_100757DD0()
{
  return type metadata accessor for OfferStyle();
}

uint64_t sub_100757DE0()
{
  return PageFacets.FacetGroup.title.getter();
}

uint64_t sub_100757DF0()
{
  return PageFacets.FacetGroup.facets.getter();
}

uint64_t sub_100757E00()
{
  return type metadata accessor for PageFacets.FacetGroup();
}

uint64_t sub_100757E10()
{
  return PageFacets.facetGroups.getter();
}

uint64_t sub_100757E20()
{
  return type metadata accessor for PageFacets.Facet.DisplayType();
}

uint64_t sub_100757E30()
{
  return PageFacets.Facet.displayType.getter();
}

uint64_t sub_100757E40()
{
  return PageFacets.Facet.defaultOptions.getter();
}

uint64_t sub_100757E50()
{
  return PageFacets.Facet.isHiddenFromMenu.getter();
}

uint64_t sub_100757E60()
{
  return PageFacets.Facet.displayOptionsInline.getter();
}

uint64_t sub_100757E70()
{
  return PageFacets.Facet.metricsParameterName.getter();
}

uint64_t sub_100757E80()
{
  return PageFacets.Facet.showsSelectedOptions.getter();
}

uint64_t sub_100757E90()
{
  return static PageFacets.Facet.== infix(_:_:)();
}

uint64_t sub_100757EA0()
{
  return PageFacets.Facet.id.getter();
}

uint64_t sub_100757EB0()
{
  return PageFacets.Facet.title.getter();
}

uint64_t sub_100757EC0()
{
  return PageFacets.Facet.Option.metricsValue.getter();
}

uint64_t sub_100757ED0()
{
  return PageFacets.Facet.Option.systemImageName.getter();
}

uint64_t sub_100757EE0()
{
  return static PageFacets.Facet.Option.== infix(_:_:)();
}

uint64_t sub_100757EF0()
{
  return PageFacets.Facet.Option.title.getter();
}

uint64_t sub_100757F00()
{
  return type metadata accessor for PageFacets.Facet.Option();
}

uint64_t sub_100757F10()
{
  return PageFacets.Facet.options.getter();
}

uint64_t sub_100757F20()
{
  return type metadata accessor for PageFacets.Facet();
}

uint64_t sub_100757F30()
{
  return type metadata accessor for PageFacets();
}

uint64_t sub_100757F40()
{
  return RateAction.adamId.getter();
}

uint64_t sub_100757F50()
{
  return dispatch thunk of RateAction.rating.getter();
}

uint64_t sub_100757F60()
{
  return dispatch thunk of RateAction.rating.setter();
}

uint64_t sub_100757F70()
{
  return RateAction.Parameter.rawValue.getter();
}

uint64_t sub_100757F80()
{
  return type metadata accessor for RateAction.Parameter();
}

uint64_t sub_100757F90()
{
  return type metadata accessor for RateAction();
}

uint64_t sub_100757FA0()
{
  return dispatch thunk of ShadowView.shouldAnimateBoundsChange.setter();
}

uint64_t sub_100757FB0()
{
  return ShadowView.__allocating_init(radius:style:)();
}

uint64_t sub_100757FC0()
{
  return dispatch thunk of ShadowView.shadow.setter();
}

uint64_t sub_100757FD0()
{
  return dispatch thunk of ShadowView.setCorner(radius:style:)();
}

uint64_t sub_100757FE0()
{
  return type metadata accessor for ShadowView();
}

uint64_t sub_100757FF0()
{
  return ShelfBatch.shelves.getter();
}

uint64_t sub_100758000()
{
  return StyledText.init(rawText:rawTextType:)();
}

uint64_t sub_100758010()
{
  return dispatch thunk of StyledText.plainText.getter();
}

uint64_t sub_100758020()
{
  return dispatch thunk of StyledText.asAttributedString(using:)();
}

uint64_t sub_100758030()
{
  return type metadata accessor for StyledText.MediaType();
}

uint64_t sub_100758040()
{
  return type metadata accessor for StyledText();
}

uint64_t sub_100758050()
{
  return tryToFetch(artworkFor:into:on:asPartOf:)();
}

uint64_t sub_100758060()
{
  return AlertAction.destructiveActionIndex.getter();
}

uint64_t sub_100758070()
{
  return AlertAction.cancelTitle.getter();
}

uint64_t sub_100758080()
{
  return AlertAction.isCancelable.getter();
}

uint64_t sub_100758090()
{
  return AlertAction.buttonActions.getter();
}

uint64_t sub_1007580A0()
{
  return AlertAction.toastDuration.getter();
}

uint64_t sub_1007580B0()
{
  return AlertAction.style.getter();
}

uint64_t sub_1007580C0()
{
  return AlertAction.init(title:message:isCancelable:cancelTitle:cancelAction:buttonActions:destructiveActionIndex:style:artwork:toastDuration:presentationStyle:actionMetrics:)();
}

uint64_t sub_1007580D0()
{
  return AlertAction.message.getter();
}

uint64_t sub_1007580E0()
{
  return type metadata accessor for AlertAction();
}

uint64_t sub_1007580F0()
{
  return ArcadeState.isSubscribed.getter();
}

uint64_t sub_100758100()
{
  return ArcadeState.shortSummary.getter();
}

uint64_t sub_100758110()
{
  return ArcadeState.isTrialAvailable.getter();
}

uint64_t sub_100758120()
{
  return type metadata accessor for ArcadeState();
}

uint64_t sub_100758130()
{
  return ArticlePage.__allocating_init(copying:replacingCard:)();
}

uint64_t sub_100758140()
{
  return type metadata accessor for ArticlePage();
}

uint64_t sub_100758150()
{
  return static ArtworkView.cardArtworkView.getter();
}

uint64_t sub_100758160()
{
  return static ArtworkView.iconArtworkView.getter();
}

uint64_t sub_100758170()
{
  return static ArtworkView.brickArtworkView.getter();
}

uint64_t sub_100758180()
{
  return static ArtworkView.iapIconArtworkView.getter();
}

uint64_t sub_100758190()
{
  return ArtworkView.isImageHidden.setter();
}

uint64_t sub_1007581A0()
{
  return ArtworkView.roundedCorners.setter();
}

uint64_t sub_1007581B0()
{
  return ArtworkView.backgroundColor.setter();
}

uint64_t sub_1007581C0()
{
  return static ArtworkView.iconBorderColor.getter();
}

uint64_t sub_1007581D0()
{
  return static ArtworkView.iconBorderWidth.getter();
}

uint64_t sub_1007581E0()
{
  return ArtworkView.artworkTintColor.setter();
}

uint64_t sub_1007581F0()
{
  return ArtworkView.placeholderColor.setter();
}

uint64_t sub_100758200()
{
  return ArtworkView.clipImageToBounds.setter();
}

uint64_t sub_100758210()
{
  return ArtworkView.frameUpdatesImageSize.setter();
}

uint64_t sub_100758220()
{
  return ArtworkView.isDisplayingSymbolImage.getter();
}

uint64_t sub_100758230()
{
  return ArtworkView.shouldSymbolImageSelfSize.setter();
}

uint64_t sub_100758240()
{
  return ArtworkView.setImageDisablesAnimations.setter();
}

uint64_t sub_100758250()
{
  return ArtworkView.preferredSymbolConfiguration.getter();
}

uint64_t sub_100758260()
{
  return ArtworkView.preferredSymbolConfiguration.setter();
}

uint64_t sub_100758270()
{
  return ArtworkView.imageBaselineOffsetFromBottom.getter();
}

uint64_t sub_100758280()
{
  return ArtworkView.accessibilityIgnoresInvertColors.setter();
}

void sub_100758290(UIImage_optional image, Swift::Bool isAnimationPermitted)
{
}

uint64_t sub_1007582A0()
{
  return ArtworkView.frame.modify();
}

uint64_t sub_1007582B0()
{
  return ArtworkView.frame.getter();
}

uint64_t sub_1007582C0()
{
  return ArtworkView.frame.setter();
}

uint64_t sub_1007582D0()
{
  return ArtworkView.image.getter();
}

uint64_t sub_1007582E0()
{
  return ArtworkView.image.setter();
}

uint64_t sub_1007582F0()
{
  return ArtworkView.style.getter();
}

uint64_t sub_100758300()
{
  return ArtworkView.style.setter();
}

uint64_t sub_100758310()
{
  return ArtworkView.shadow.setter();
}

void sub_100758320(UIImage_optional image, Swift::Bool animated)
{
}

uint64_t sub_100758330()
{
  return ArtworkView.imageSize.getter();
}

uint64_t sub_100758340()
{
  return ArtworkView.imageSize.setter();
}

uint64_t sub_100758350()
{
  return ArtworkView.setCorner(radius:style:)();
}

uint64_t sub_100758360()
{
  return type metadata accessor for ArtworkView();
}

uint64_t sub_100758370()
{
  return BlankAction.__allocating_init(actionMetrics:)();
}

uint64_t sub_100758380()
{
  return BlankAction.init(id:title:artwork:presentationStyle:actionMetrics:impressionMetrics:)();
}

uint64_t sub_100758390()
{
  return type metadata accessor for BlankAction();
}

uint64_t sub_1007583A0()
{
  return BrickLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007583B0()
{
  return BrickLayout.Metrics.init(artworkAspectRatio:labelSpace:labelFontSource:isLabelFullWidth:numberOfLines:)();
}

uint64_t sub_1007583C0()
{
  return type metadata accessor for BrickLayout.Metrics();
}

uint64_t sub_1007583D0()
{
  return BrickLayout.init(metrics:artworkView:labelView:)();
}

uint64_t sub_1007583E0()
{
  return type metadata accessor for BrickLayout();
}

uint64_t sub_1007583F0()
{
  return Conditional.evaluate<>(in:)();
}

uint64_t sub_100758400()
{
  return Conditional.evaluate(with:)();
}

uint64_t sub_100758410()
{
  return Conditional<>.init(regularValue:rightToLeftValue:)();
}

uint64_t sub_100758420()
{
  return Conditional<>.init(regularValue:compactValue:)();
}

uint64_t sub_100758430()
{
  return Conditional<>.init(accessibleLayoutValue:regularLayoutValue:)();
}

uint64_t sub_100758440()
{
  return Conditional<>.init(value:)();
}

uint64_t sub_100758450()
{
  return Conditional<>.init(property:trueValue:falseValue:)();
}

uint64_t sub_100758460()
{
  return Conditional<>.anyDimension.getter();
}

uint64_t sub_100758470()
{
  return Conditional<>.init(regularConstant:compactConstant:regularSource:compactSource:)();
}

uint64_t sub_100758480()
{
  return Conditional<>.init(regularConstant:compactConstant:source:)();
}

uint64_t sub_100758490()
{
  return Conditional<>.init(roundedCornersConstant:nonRoundedCornersConstant:source:)();
}

uint64_t sub_1007584A0()
{
  return Conditional<>.init(accessibleLayoutConstant:regularLayoutConstant:source:)();
}

uint64_t sub_1007584B0()
{
  return Conditional<>.value(in:rounded:)();
}

uint64_t sub_1007584C0()
{
  return Conditional<>.init(roundedCornersValue:nonRoundedCornersValue:)();
}

uint64_t sub_1007584D0()
{
  return Conditional<>.value.getter();
}

uint64_t sub_1007584E0()
{
  return Conditional<>.init(whenOneOf:use:otherwiseUse:)();
}

uint64_t sub_1007584F0()
{
  return type metadata accessor for Conditional();
}

uint64_t sub_100758500()
{
  return Conditional.init(_:)();
}

uint64_t sub_100758510()
{
  return static CornerStyle.== infix(_:_:)();
}

uint64_t sub_100758520()
{
  return type metadata accessor for CornerStyle();
}

uint64_t sub_100758530()
{
  return DynamicPage.presentationOptions.getter();
}

uint64_t sub_100758540()
{
  return FinanceType.url.getter();
}

uint64_t sub_100758550()
{
  return type metadata accessor for FinanceType();
}

uint64_t sub_100758560()
{
  return FlowPreview.init(destination:actions:)();
}

uint64_t sub_100758570()
{
  return FlowPreview.destination.getter();
}

uint64_t sub_100758580()
{
  return FlowPreview.actions.getter();
}

uint64_t sub_100758590()
{
  return type metadata accessor for FlowPreview();
}

uint64_t sub_1007585A0()
{
  return FramedMedia.isFullWidth.getter();
}

uint64_t sub_1007585B0()
{
  return FramedMedia.hasRoundedCorners.getter();
}

uint64_t sub_1007585C0()
{
  return FramedMedia.caption.getter();
}

uint64_t sub_1007585D0()
{
  return FramedMedia.ordinal.getter();
}

uint64_t sub_1007585E0()
{
  return FramedVideo.video.getter();
}

uint64_t sub_1007585F0()
{
  return FramedVideo.artwork.getter();
}

uint64_t sub_100758600()
{
  return type metadata accessor for FramedVideo();
}

uint64_t sub_100758610()
{
  return GenericPage.presentationOptions.getter();
}

uint64_t sub_100758620()
{
  return GenericPage.title.getter();
}

uint64_t sub_100758630()
{
  return GenericPage.init(shelves:title:shareAction:presentationOptions:nextPage:isIncomplete:uber:loadCompletedAction:pageRefreshPolicy:pageMetrics:pageRenderEvent:context:)();
}

uint64_t sub_100758640()
{
  return type metadata accessor for GenericPage();
}

void sub_100758650()
{
}

uint64_t sub_100758660()
{
  return type metadata accessor for LocalAction();
}

uint64_t sub_100758670()
{
  return ObjectGraph.artworkLoader.getter();
}

uint64_t sub_100758680()
{
  return ObjectGraph.actionDispatcher.getter();
}

uint64_t sub_100758690()
{
  return type metadata accessor for ObjectGraph();
}

uint64_t sub_1007586A0()
{
  return OfferAction.buyCompletedAction.getter();
}

uint64_t sub_1007586B0()
{
  return OfferAction.purchaseToken.getter();
}

uint64_t sub_1007586C0()
{
  return OfferAction.purchaseToken.setter();
}

uint64_t sub_1007586D0()
{
  return OfferAction.includeBetaApps.getter();
}

uint64_t sub_1007586E0()
{
  return OfferAction.adamId.getter();
}

uint64_t sub_1007586F0()
{
  return OfferAction.bundleId.getter();
}

uint64_t sub_100758700()
{
  return type metadata accessor for OfferAction();
}

uint64_t sub_100758710()
{
  return static Placeholder.subtitleText.getter();
}

uint64_t sub_100758720()
{
  return static Placeholder.appEventKindText.getter();
}

uint64_t sub_100758730()
{
  return static Placeholder.headingTitleText.getter();
}

uint64_t sub_100758740()
{
  return static Placeholder.appEventTitleText.getter();
}

uint64_t sub_100758750()
{
  return static Placeholder.appEventSubtitleText.getter();
}

uint64_t sub_100758760()
{
  return static Placeholder.titleText.getter();
}

uint64_t sub_100758770()
{
  return type metadata accessor for Placeholder();
}

uint64_t sub_100758780()
{
  return PrivacyType.categories.getter();
}

uint64_t sub_100758790()
{
  return PrivacyType.wantsScrollFocus.getter();
}

uint64_t sub_1007587A0()
{
  return PrivacyType.style.getter();
}

uint64_t sub_1007587B0()
{
  return PrivacyType.title.getter();
}

uint64_t sub_1007587C0()
{
  return PrivacyType.detail.getter();
}

uint64_t sub_1007587D0()
{
  return PrivacyType.artwork.getter();
}

uint64_t sub_1007587E0()
{
  return type metadata accessor for PrivacyType();
}

uint64_t sub_1007587F0()
{
  return ReviewsPage.SortOption.selectedActionTitle.getter();
}

uint64_t sub_100758800()
{
  return type metadata accessor for ReviewsPage();
}

uint64_t sub_100758810()
{
  return Screenshots.mediaPlatform.getter();
}

uint64_t sub_100758820()
{
  return Screenshots.artwork.getter();
}

uint64_t sub_100758830()
{
  return type metadata accessor for Screenshots();
}

uint64_t sub_100758840()
{
  return SheetAction.destructiveActionIndex.getter();
}

uint64_t sub_100758850()
{
  return SheetAction.cancelTitle.getter();
}

uint64_t sub_100758860()
{
  return SheetAction.checkedIndex.getter();
}

uint64_t sub_100758870()
{
  return SheetAction.isCancelable.getter();
}

uint64_t sub_100758880()
{
  return SheetAction.style.getter();
}

uint64_t sub_100758890()
{
  return SheetAction.actions.getter();
}

uint64_t sub_1007588A0()
{
  return SheetAction.message.getter();
}

uint64_t sub_1007588B0()
{
  return SheetAction.isCustom.getter();
}

uint64_t sub_1007588C0()
{
  return ShelfHeader.shouldUseShelfHeader.getter();
}

uint64_t sub_1007588D0()
{
  return type metadata accessor for ShelfHeader.ArtworkType();
}

uint64_t sub_1007588E0()
{
  return ShelfHeader.titleAction.getter();
}

uint64_t sub_1007588F0()
{
  return ShelfHeader.titleArtwork.getter();
}

uint64_t sub_100758900()
{
  return ShelfHeader.Configuration.titleColor.getter();
}

uint64_t sub_100758910()
{
  return ShelfHeader.Configuration.init(eyebrowColor:eyebrowImageColor:titleColor:titleImageColor:subtitleColor:accessoryColor:includeSeparator:includeTrailingArtwork:prefersShelfHeader:)();
}

uint64_t sub_100758920()
{
  return ShelfHeader.Configuration.eyebrowColor.getter();
}

uint64_t sub_100758930()
{
  return ShelfHeader.Configuration.subtitleColor.getter();
}

uint64_t sub_100758940()
{
  return ShelfHeader.Configuration.accessoryColor.getter();
}

uint64_t sub_100758950()
{
  return ShelfHeader.Configuration.titleImageColor.getter();
}

uint64_t sub_100758960()
{
  return ShelfHeader.Configuration.includeSeparator.getter();
}

uint64_t sub_100758970()
{
  return ShelfHeader.Configuration.eyebrowImageColor.getter();
}

uint64_t sub_100758980()
{
  return type metadata accessor for ShelfHeader.Configuration();
}

uint64_t sub_100758990()
{
  return ShelfHeader.configuration.getter();
}

uint64_t sub_1007589A0()
{
  return ShelfHeader.eyebrowAction.getter();
}

uint64_t sub_1007589B0()
{
  return ShelfHeader.eyebrowArtwork.getter();
}

uint64_t sub_1007589C0()
{
  return ShelfHeader.accessoryAction.getter();
}

uint64_t sub_1007589D0()
{
  return ShelfHeader.titleArtworkType.getter();
}

uint64_t sub_1007589E0()
{
  return ShelfHeader.eyebrowArtworkType.getter();
}

uint64_t sub_1007589F0()
{
  return ShelfHeader.hasTrailingArtwork.getter();
}

uint64_t sub_100758A00()
{
  return ShelfHeader.eyebrowTrailingArtwork.getter();
}

uint64_t sub_100758A10()
{
  return ShelfHeader.title.getter();
}

uint64_t sub_100758A20()
{
  return ShelfHeader.init(eyebrow:eyebrowArtwork:eyebrowArtworkType:eyebrowAction:eyebrowTrailingArtwork:title:titleArtwork:titleArtworkType:titleAction:subtitle:trailingArtwork:accessoryAction:configuration:)();
}

uint64_t sub_100758A30()
{
  return ShelfHeader.eyebrow.getter();
}

uint64_t sub_100758A40()
{
  return ShelfHeader.subtitle.getter();
}

uint64_t sub_100758A50()
{
  return type metadata accessor for ShelfHeader();
}

uint64_t sub_100758A60()
{
  return type metadata accessor for ShelfMarker();
}

uint64_t sub_100758A70()
{
  return static SystemImage.load(artwork:with:includePrivateImages:)();
}

uint64_t sub_100758A80()
{
  return static SystemImage.load(_:with:includePrivateImages:)();
}

uint64_t sub_100758A90()
{
  return static SystemImage.load(_:with:)();
}

uint64_t sub_100758AA0()
{
  return type metadata accessor for SystemImage();
}

uint64_t sub_100758AB0()
{
  return static TimingCurve.easingCurve1.getter();
}

uint64_t sub_100758AC0()
{
  return static TimingCurve.easingCurve2.getter();
}

uint64_t sub_100758AD0()
{
  return TimingCurve.controlPoint1.getter();
}

uint64_t sub_100758AE0()
{
  return TimingCurve.controlPoint2.getter();
}

uint64_t sub_100758AF0()
{
  return type metadata accessor for TimingCurve();
}

uint64_t sub_100758B00()
{
  return type metadata accessor for TitleEffect();
}

uint64_t sub_100758B10()
{
  return dispatch thunk of VideoPlayer.playerItem.getter();
}

uint64_t sub_100758B20()
{
  return dispatch thunk of VideoPlayer.releaseAssets()();
}

uint64_t sub_100758B30()
{
  return dispatch thunk of VideoPlayer.shouldBePlaying.getter();
}

uint64_t sub_100758B40()
{
  return dispatch thunk of VideoPlayer.startPreloading()();
}

uint64_t sub_100758B50()
{
  return dispatch thunk of VideoPlayer.shouldLoopPlayback.setter();
}

uint64_t sub_100758B60()
{
  return VideoPlayer.init(with:)();
}

uint64_t sub_100758B70()
{
  return dispatch thunk of VideoPlayer.state.getter();
}

uint64_t sub_100758B80()
{
  return dispatch thunk of VideoPlayer.restart()();
}

uint64_t sub_100758B90()
{
  return dispatch thunk of VideoPlayer.delegate.setter();
}

uint64_t sub_100758BA0()
{
  return dispatch thunk of VideoPlayer.videoUrl.getter();
}

uint64_t sub_100758BB0()
{
  return dispatch thunk of VideoPlayer.isLoading.getter();
}

uint64_t sub_100758BC0()
{
  return dispatch thunk of VideoPlayer.isPlaying.getter();
}

uint64_t sub_100758BD0()
{
  return type metadata accessor for VideoPlayer();
}

uint64_t sub_100758BE0()
{
  return type metadata accessor for ASKBootstrap.TargetType();
}

uint64_t sub_100758BF0()
{
  return static ASKBootstrap.tokenServiceClient.getter();
}

uint64_t sub_100758C00()
{
  return ActionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100758C10()
{
  return static ActionLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_100758C20()
{
  return ActionLayout.Metrics.init(artworkSize:maxArtworkSize:artworkMargin:artworkLeadingMargin:labelWithArtworkLeadingMargin:accessoryMargin:labelFontSource:labelVerticalMargin:searchAdButtonTopMargin:searchAdButtonLeadingMargin:shouldLabelFitAvailableWidth:)();
}

uint64_t sub_100758C30()
{
  return ActionLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100758C40()
{
  return ActionLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_100758C50()
{
  return ActionLayout.Metrics.maxArtworkSize.getter();
}

uint64_t sub_100758C60()
{
  return ActionLayout.Metrics.labelFontSource.getter();
}

uint64_t sub_100758C70()
{
  return type metadata accessor for ActionLayout.Metrics();
}

uint64_t sub_100758C80()
{
  return ActionLayout.init(metrics:artworkView:labelView:accessoryView:searchAdButton:artworkBaselineOffsetFromBottom:isDisplayingSearchTrendingItem:restrictArtworkSizeToMetrics:in:)();
}

uint64_t sub_100758C90()
{
  return type metadata accessor for ActionLayout();
}

uint64_t sub_100758CA0()
{
  return ArcadeAction.postSubscribeAction.getter();
}

uint64_t sub_100758CB0()
{
  return ArcadeAction.subscriptionToken.getter();
}

uint64_t sub_100758CC0()
{
  return ArcadeAction.appAdamId.getter();
}

uint64_t sub_100758CD0()
{
  return ArcadeAction.productId.getter();
}

uint64_t sub_100758CE0()
{
  return ArcadeFooter.buttonAction.getter();
}

uint64_t sub_100758CF0()
{
  return ArcadeFooter.backgroundColor.getter();
}

uint64_t sub_100758D00()
{
  return ArcadeFooter.icons.getter();
}

uint64_t sub_100758D10()
{
  return ArcadeFooter.footnote.getter();
}

uint64_t sub_100758D20()
{
  return ArcadeLockup.impressionMetrics.getter();
}

uint64_t sub_100758D30()
{
  return ArcadeLockup.subscribedSubtitle.getter();
}

uint64_t sub_100758D40()
{
  return ArcadeLockup.nonsubscribedSubtitle.getter();
}

uint64_t sub_100758D50()
{
  return ArcadeLockup.offerDisplayProperties.getter();
}

uint64_t sub_100758D60()
{
  return ArcadeLockup.subscribedButtonAction.getter();
}

uint64_t sub_100758D70()
{
  return ArcadeLockup.unsubscribedButtonAction.getter();
}

uint64_t sub_100758D80()
{
  return HeroCarousel.wantsTopGradient.getter();
}

uint64_t sub_100758D90()
{
  return HeroCarousel.wantsBottomGradient.getter();
}

uint64_t sub_100758DA0()
{
  return HeroCarousel.autoScrollConfiguration.getter();
}

uint64_t sub_100758DB0()
{
  return HeroCarousel.id.getter();
}

uint64_t sub_100758DC0()
{
  return HeroCarousel.items.getter();
}

uint64_t sub_100758DD0()
{
  return type metadata accessor for HeroCarousel();
}

uint64_t sub_100758DE0()
{
  return HideCriteria.isHidden.getter();
}

uint64_t sub_100758DF0()
{
  return type metadata accessor for HideCriteria();
}

uint64_t sub_100758E00()
{
  return Interpolator.value(forInput:)();
}

uint64_t sub_100758E10()
{
  return Interpolator.value(forInput:)();
}

uint64_t sub_100758E20()
{
  return Interpolator.init(fromValue:toValue:curve:)();
}

uint64_t sub_100758E30()
{
  return LinkableText.plainText.getter();
}

uint64_t sub_100758E40()
{
  return LinkableText.styledText.getter();
}

uint64_t sub_100758E50()
{
  return LinkableText.linkedSubstrings.getter();
}

uint64_t sub_100758E60()
{
  return LinkableText.__allocating_init(id:text:linkedSubstrings:)();
}

uint64_t sub_100758E70()
{
  return type metadata accessor for LinkableText();
}

uint64_t sub_100758E80()
{
  return dispatch thunk of MetricsEvent.metricsData.getter();
}

uint64_t sub_100758E90()
{
  return PosterLockup.footerText.getter();
}

uint64_t sub_100758EA0()
{
  return PosterLockup.epicHeading.getter();
}

uint64_t sub_100758EB0()
{
  return PosterLockup.posterVideo.getter();
}

uint64_t sub_100758EC0()
{
  return PosterLockup.posterArtwork.getter();
}

uint64_t sub_100758ED0()
{
  return PosterLockup.isDark.getter();
}

uint64_t sub_100758EE0()
{
  return type metadata accessor for PosterLockup();
}

uint64_t sub_100758EF0()
{
  return ProductMedia.hasPortraitPhoneMedia.getter();
}

uint64_t sub_100758F00()
{
  return ProductMedia.allPlatforms.getter();
}

uint64_t sub_100758F10()
{
  return ProductMedia.platformDescription.getter();
}

uint64_t sub_100758F20()
{
  return type metadata accessor for ProductMedia.DescriptionPlacement();
}

uint64_t sub_100758F30()
{
  return ProductMedia.descriptionPlacement(when:)();
}

uint64_t sub_100758F40()
{
  return ProductMedia.allPlatformsDescription.getter();
}

uint64_t sub_100758F50()
{
  return ProductMedia.items.getter();
}

uint64_t sub_100758F60()
{
  return ProductMedia.platform.getter();
}

uint64_t sub_100758F70()
{
  return type metadata accessor for ProductMedia();
}

uint64_t sub_100758F80()
{
  return type metadata accessor for PurchaseType();
}

uint64_t sub_100758F90()
{
  return ReferrerData.init(app:externalUrl:kind:)();
}

uint64_t sub_100758FA0()
{
  return type metadata accessor for ReferrerData.Kind();
}

uint64_t sub_100758FB0()
{
  return type metadata accessor for ReferrerData();
}

uint64_t sub_100758FC0()
{
  return SearchAction.guidedSearchOptimizationTerm.getter();
}

uint64_t sub_100758FD0()
{
  return SearchAction.guidedSearchTokens.getter();
}

uint64_t sub_100758FE0()
{
  return SearchAction.prefixTerm.getter();
}

uint64_t sub_100758FF0()
{
  return SearchAction.excludedTerms.getter();
}

uint64_t sub_100759000()
{
  return SearchAction.originatingTerm.getter();
}

uint64_t sub_100759010()
{
  return SearchAction.spellCheckEnabled.getter();
}

uint64_t sub_100759020()
{
  return SearchAction.term.getter();
}

uint64_t sub_100759030()
{
  return SearchAction.init(title:term:url:origin:source:entity:spellCheckEnabled:excludedTerms:originatingTerm:prefixTerm:guidedSearchTokens:guidedSearchOptimizationTerm:actionMetrics:)();
}

uint64_t sub_100759040()
{
  return SearchAction.entity.getter();
}

uint64_t sub_100759050()
{
  return SearchAction.origin.getter();
}

uint64_t sub_100759060()
{
  return SearchAction.source.getter();
}

uint64_t sub_100759070()
{
  return type metadata accessor for SearchAction();
}

uint64_t sub_100759080()
{
  return type metadata accessor for SearchEntity();
}

uint64_t sub_100759090()
{
  return type metadata accessor for SearchOrigin();
}

uint64_t sub_1007590A0()
{
  return SearchResult.condensedBehavior.getter();
}

uint64_t sub_1007590B0()
{
  return type metadata accessor for SearchResult();
}

uint64_t sub_1007590C0()
{
  return TitledButton.id.getter();
}

uint64_t sub_1007590D0()
{
  return TitledButton.title.getter();
}

uint64_t sub_1007590E0()
{
  return TitledButton.action.getter();
}

uint64_t sub_1007590F0()
{
  return WordmarkView.show(wordmark:with:)();
}

uint64_t sub_100759100()
{
  return WordmarkView.init(frame:wordmark:referenceLineHeight:alignment:)();
}

uint64_t sub_100759110()
{
  return type metadata accessor for WordmarkView.Alignment();
}

uint64_t sub_100759120()
{
  return WordmarkView.alignment.setter();
}

uint64_t sub_100759130()
{
  return type metadata accessor for WordmarkView();
}

uint64_t sub_100759140()
{
  return ArtworkLoader.fetchArtwork(using:forReason:closestMatch:handlerKey:completionHandler:)();
}

uint64_t sub_100759150()
{
  return ArtworkLoader.fetchArtwork<A>(using:forReason:closestMatch:into:)();
}

void sub_100759160(Swift::OpaquePointer using)
{
}

uint64_t sub_100759170()
{
  return ArtworkLoader.__allocating_init(cacheLimit:renderIntent:)();
}

uint64_t sub_100759180()
{
  return static ArtworkLoader.handlerKey<A>(for:)();
}

uint64_t sub_100759190()
{
  return ArtworkLoader.isOccluded.setter();
}

uint64_t sub_1007591A0()
{
  return ArtworkLoader.forgetFetch(forHandlerKey:deprioritizingFetch:)();
}

uint64_t sub_1007591B0()
{
  return ArtworkLoader.forgetFetch<A>(forView:deprioritizingFetch:)();
}

uint64_t sub_1007591C0()
{
  return ArtworkLoader.pageRenderMetrics.setter();
}

uint64_t sub_1007591D0()
{
  return ArtworkLoader.init(parent:)();
}

uint64_t sub_1007591E0()
{
  return ArtworkLoader.register(resourceLoader:)();
}

uint64_t sub_1007591F0()
{
  return type metadata accessor for ArtworkLoader();
}

uint64_t sub_100759200()
{
  return dispatch thunk of BasePresenter.pageRenderMetrics.getter();
}

uint64_t sub_100759210()
{
  return dispatch thunk of BasePresenter.pendingPageRender.getter();
}

uint64_t sub_100759220()
{
  return BasePresenter.impressionsTracker.getter();
}

uint64_t sub_100759230()
{
  return BasePresenter.impressionsCalculator.getter();
}

uint64_t sub_100759240()
{
  return dispatch thunk of BasePresenter.didLoad()();
}

uint64_t sub_100759250()
{
  return dispatch thunk of BasePresenter.referrer.getter();
}

uint64_t sub_100759260()
{
  return dispatch thunk of BasePresenter.referrer.setter();
}

uint64_t sub_100759270()
{
  return type metadata accessor for BasePresenter();
}

uint64_t sub_100759280()
{
  return EditorialCard.clickAction.getter();
}

uint64_t sub_100759290()
{
  return EditorialCard.mediaOverlayStyle.getter();
}

uint64_t sub_1007592A0()
{
  return EditorialCard.appEventFormattedDates.getter();
}

uint64_t sub_1007592B0()
{
  return EditorialCard.title.getter();
}

uint64_t sub_1007592C0()
{
  return EditorialCard.lockup.getter();
}

uint64_t sub_1007592D0()
{
  return EditorialCard.artwork.getter();
}

uint64_t sub_1007592E0()
{
  return EditorialCard.caption.getter();
}

uint64_t sub_1007592F0()
{
  return EditorialCard.subtitle.getter();
}

uint64_t sub_100759300()
{
  return type metadata accessor for EditorialCard();
}

uint64_t sub_100759310()
{
  return EditorialLink.summaryText.getter();
}

uint64_t sub_100759320()
{
  return EditorialLink.descriptionText.getter();
}

uint64_t sub_100759330()
{
  return EditorialLink.linkPresentationEnabled.getter();
}

uint64_t sub_100759340()
{
  return dispatch thunk of EditorialLink.url.getter();
}

uint64_t sub_100759350()
{
  return type metadata accessor for EditorialLink();
}

uint64_t sub_100759360()
{
  return EditorsChoice.showsBadge.getter();
}

uint64_t sub_100759370()
{
  return EditorsChoice.isCollapsed.getter();
}

uint64_t sub_100759380()
{
  return EditorsChoice.notes.getter();
}

uint64_t sub_100759390()
{
  return EditorsChoice.title.getter();
}

uint64_t sub_1007593A0()
{
  return type metadata accessor for EditorsChoice();
}

uint64_t sub_1007593B0()
{
  return FramedArtwork.artwork.getter();
}

uint64_t sub_1007593C0()
{
  return type metadata accessor for FramedArtwork();
}

uint64_t sub_1007593D0()
{
  return dispatch thunk of GladiatorRule.validate(events:)();
}

uint64_t sub_1007593E0()
{
  return dispatch thunk of MediaPlatform.supplementaryAppPlatforms.getter();
}

uint64_t sub_1007593F0()
{
  return MediaPlatform.appPlatform.getter();
}

uint64_t sub_100759400()
{
  return dispatch thunk of MediaPlatform.isPhonePlatform.getter();
}

uint64_t sub_100759410()
{
  return static MediaPlatform.systemImages(platforms:)();
}

uint64_t sub_100759420()
{
  return MediaPlatform.systemImageName.getter();
}

uint64_t sub_100759430()
{
  return MediaPlatform.deviceBorderThickness.getter();
}

uint64_t sub_100759440()
{
  return MediaPlatform.deviceCornerRadiusFactor.getter();
}

uint64_t sub_100759450()
{
  return type metadata accessor for MediaPlatform();
}

uint64_t sub_100759460()
{
  return NavigationTab.pageContext.getter();
}

uint64_t sub_100759470()
{
  return static NavigationTab.== infix(_:_:)();
}

uint64_t sub_100759480()
{
  return NavigationTab.init(intValue:)();
}

uint64_t sub_100759490()
{
  return NavigationTab.rawValue.getter();
}

uint64_t sub_1007594A0()
{
  return type metadata accessor for NavigationTab();
}

uint64_t sub_1007594B0()
{
  return PageGridCache.init()();
}

uint64_t sub_1007594C0()
{
  return type metadata accessor for PageGridCache();
}

uint64_t sub_1007594D0()
{
  return PrivacyFooter.bodyText.getter();
}

uint64_t sub_1007594E0()
{
  return type metadata accessor for PrivacyFooter();
}

uint64_t sub_1007594F0()
{
  return PrivacyHeader.isDetailHeader.getter();
}

uint64_t sub_100759500()
{
  return PrivacyHeader.supplementaryItems.getter();
}

uint64_t sub_100759510()
{
  return PrivacyHeader.bodyText.getter();
}

uint64_t sub_100759520()
{
  return type metadata accessor for PrivacyHeader();
}

uint64_t sub_100759530()
{
  return type metadata accessor for ProductReview.ReviewSource();
}

uint64_t sub_100759540()
{
  return ProductReview.source.getter();
}

uint64_t sub_100759550()
{
  return type metadata accessor for ProductReview();
}

uint64_t sub_100759560()
{
  return ReviewSummary.bodySeeAll.getter();
}

uint64_t sub_100759570()
{
  return ReviewSummary.bodyWithTitle.getter();
}

uint64_t sub_100759580()
{
  return ReviewSummary.subtitleArtwork.getter();
}

uint64_t sub_100759590()
{
  return type metadata accessor for ReviewSummary.SubtitleArtworkAlignment();
}

uint64_t sub_1007595A0()
{
  return ReviewSummary.subtitleArtworkAlignment.getter();
}

uint64_t sub_1007595B0()
{
  return ReviewSummary.body.getter();
}

uint64_t sub_1007595C0()
{
  return ReviewSummary.subtitle.getter();
}

uint64_t sub_1007595D0()
{
  return type metadata accessor for ReviewSummary();
}

uint64_t sub_1007595E0()
{
  return RibbonBarItem.artworkTintColor.getter();
}

uint64_t sub_1007595F0()
{
  return RibbonBarItem.accessibilityLabel.getter();
}

uint64_t sub_100759600()
{
  return RibbonBarItem.title.getter();
}

uint64_t sub_100759610()
{
  return RibbonBarItem.artwork.getter();
}

uint64_t sub_100759620()
{
  return type metadata accessor for RibbonBarItem();
}

uint64_t sub_100759630()
{
  return RoundedButton.hasDivider.getter();
}

uint64_t sub_100759640()
{
  return RoundedButton.buttonColor.getter();
}

uint64_t sub_100759650()
{
  return RoundedButton.type.getter();
}

uint64_t sub_100759660()
{
  return RoundedButton.title.getter();
}

uint64_t sub_100759670()
{
  return RoundedButton.action.getter();
}

uint64_t sub_100759680()
{
  return RoundedButton.textColor.getter();
}

uint64_t sub_100759690()
{
  return type metadata accessor for RoundedButton();
}

uint64_t sub_1007596A0()
{
  return ShelvesIntent.init(requests:)();
}

uint64_t sub_1007596B0()
{
  return type metadata accessor for ShelvesIntent();
}

uint64_t sub_1007596C0()
{
  return SmallBreakout.backgroundColor.getter();
}

uint64_t sub_1007596D0()
{
  return SmallBreakout.details.getter();
}

uint64_t sub_1007596E0()
{
  return type metadata accessor for TopChartsPage();
}

uint64_t sub_1007596F0()
{
  return UpdatesLockup.size.getter();
}

uint64_t sub_100759700()
{
  return UpdatesLockup.version.getter();
}

uint64_t sub_100759710()
{
  return UpdatesLockup.whatsNew.getter();
}

uint64_t sub_100759720()
{
  return VideoControls.containsInlineControls.getter();
}

uint64_t sub_100759730()
{
  return static VideoControls.muteUnmute.getter();
}

uint64_t sub_100759740()
{
  return static VideoControls.prominentPlay.getter();
}

uint64_t sub_100759750()
{
  return type metadata accessor for VideoControls();
}

uint64_t sub_100759760()
{
  return VideoFillMode.contentMode.getter();
}

uint64_t sub_100759770()
{
  return VideoFillMode.videoGravity.getter();
}

uint64_t sub_100759780()
{
  return type metadata accessor for VideoFillMode();
}

uint64_t sub_100759790()
{
  return ASKBagContract.isStorePersonalizationOnboardingEnabled.getter();
}

uint64_t sub_1007597A0()
{
  return ASKBagContract.refreshArcadeEntitlementsOnLoadingArcadeView.getter();
}

uint64_t sub_1007597B0()
{
  return ASKBagContract.enableAppEventsServerNotifications.getter();
}

uint64_t sub_1007597C0()
{
  return ASKBagContract.arcadeSAGURL.getter();
}

uint64_t sub_1007597D0()
{
  return ASKBagContract.fetchTimeout.getter();
}

uint64_t sub_1007597E0()
{
  return ASKBagContract.enableSearchTags.getter();
}

uint64_t sub_1007597F0()
{
  return ASKBagContract.isArcadeSupported.getter();
}

uint64_t sub_100759800()
{
  return type metadata accessor for ASKBagContract.AdPlacementBagValue();
}

uint64_t sub_100759810()
{
  return ASKBagContract.adsOverrideLanguage.getter();
}

uint64_t sub_100759820()
{
  return ASKBagContract.enabledAdPlacements.getter();
}

uint64_t sub_100759830()
{
  return ASKBagContract.arcadeProductFamilyId.getter();
}

uint64_t sub_100759840()
{
  return ASKBagContract.isSponsoredAdsEnabled.getter();
}

uint64_t sub_100759850()
{
  return ASKBagContract.familyPurchasesEnabled.getter();
}

uint64_t sub_100759860()
{
  return ASKBagContract.isQRCodeBadgingEnabled.getter();
}

uint64_t sub_100759870()
{
  return ASKBagContract.arePreordersCancellable.getter();
}

uint64_t sub_100759880()
{
  return ASKBagContract.impressionableThreshold.getter();
}

uint64_t sub_100759890()
{
  return ASKBagContract.enableReviewSummarization.getter();
}

uint64_t sub_1007598A0()
{
  return ASKBagContract.defaultAutoPlayVideoSetting.getter();
}

uint64_t sub_1007598B0()
{
  return ASKBagContract.enableLocationPrivacyNotice.getter();
}

uint64_t sub_1007598C0()
{
  return ASKBagContract.isNaturalLanguageSearchEnabled.getter();
}

uint64_t sub_1007598D0()
{
  return ASKBagContract.arcadeSubscribePageDismissDelay.getter();
}

uint64_t sub_1007598E0()
{
  return ASKBagContract.downloadProgressDisplayWaitTime.getter();
}

uint64_t sub_1007598F0()
{
  return ASKBagContract.impressionableViewablePercentage.getter();
}

uint64_t sub_100759900()
{
  return ASKBagContract.gameCenterActivitySharingReprompt.getter();
}

uint64_t sub_100759910()
{
  return ASKBagContract.enablePersonalizedAdsPrivacyNotice.getter();
}

uint64_t sub_100759920()
{
  return ASKBagContract.downloadProgressDisplayRemainingTime.getter();
}

uint64_t sub_100759930()
{
  return ASKBagContract.productPageDownloadingOrderingTimeout.getter();
}

uint64_t sub_100759940()
{
  return ASKBagContract.todayAdMediumLockupScreenshotsEnabled.getter();
}

uint64_t sub_100759950()
{
  return ASKBagContract.isProductPageDownloadingOrderingEnabled.getter();
}

uint64_t sub_100759960()
{
  return ASKBagContract.arcadeDownloadPacksGetAllCTADismissDelay.getter();
}

uint64_t sub_100759970()
{
  return ASKBagContract.personalizedAdsPrivacyNoticeEnabledRegions.getter();
}

uint64_t sub_100759980()
{
  return ASKBagContract.personalizedAdsScrollRequiredDisabledRegionCodes.getter();
}

uint64_t sub_100759990()
{
  return ASKBagContract.enablePersonalizedAdsPrivacyNoticeHighlightedOption.getter();
}

uint64_t sub_1007599A0()
{
  return ASKBagContract.personalizedAdsPrivacyNoticeHighlightedOptionEnabledRegions.getter();
}

uint64_t sub_1007599B0()
{
  return ASKBagContract.amsBag.getter();
}

uint64_t sub_1007599C0()
{
  return type metadata accessor for ASKBagContract();
}

uint64_t sub_1007599D0()
{
  return type metadata accessor for AccountSection.ContentItem();
}

uint64_t sub_1007599E0()
{
  return ArcadePageUrls.init(subscriberUrl:nonSubscriberUrl:)();
}

uint64_t sub_1007599F0()
{
  return type metadata accessor for ArcadePageUrls();
}

uint64_t sub_100759A00()
{
  return ArcadeShowcase.iconArtworks.getter();
}

uint64_t sub_100759A10()
{
  return ArcadeShowcase.subscribedAction.getter();
}

uint64_t sub_100759A20()
{
  return ArcadeShowcase.unsubscribedAction.getter();
}

uint64_t sub_100759A30()
{
  return ArcadeShowcase.subscribedDescription.getter();
}

uint64_t sub_100759A40()
{
  return ArcadeShowcase.offerDisplayProperties.getter();
}

uint64_t sub_100759A50()
{
  return ArcadeShowcase.unsubscribedDescription.getter();
}

uint64_t sub_100759A60()
{
  return type metadata accessor for ArcadeShowcase();
}

uint64_t sub_100759A70()
{
  return type metadata accessor for BootstrapPhase();
}

uint64_t sub_100759A80()
{
  return dispatch thunk of ClickableModel.clickAction.getter();
}

uint64_t sub_100759A90()
{
  return dispatch thunk of ClickableModel.clickSender.getter();
}

uint64_t sub_100759AA0()
{
  return CompoundAction.init(title:actions:presentationStyle:actionMetrics:)();
}

uint64_t sub_100759AB0()
{
  return CompoundAction.actions.getter();
}

uint64_t sub_100759AC0()
{
  return type metadata accessor for CompoundAction();
}

uint64_t sub_100759AD0()
{
  return CopyTextAction.text.getter();
}

uint64_t sub_100759AE0()
{
  return type metadata accessor for CopyTextAction();
}

uint64_t sub_100759AF0()
{
  return CornerStylable<>.applyCorner(radius:style:)();
}

uint64_t sub_100759B00()
{
  return EditorialQuote.attribution.getter();
}

uint64_t sub_100759B10()
{
  return EditorialQuote.text.getter();
}

uint64_t sub_100759B20()
{
  return type metadata accessor for EditorialQuote();
}

uint64_t sub_100759B30()
{
  return EmptyPlaceable.init()();
}

uint64_t sub_100759B40()
{
  return type metadata accessor for EmptyPlaceable();
}

uint64_t sub_100759B50()
{
  return FootnoteLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100759B60()
{
  return FootnoteLayout.Metrics.init(textSpace:bottomSpace:chevronMargin:)();
}

uint64_t sub_100759B70()
{
  return type metadata accessor for FootnoteLayout.Metrics();
}

uint64_t sub_100759B80()
{
  return FootnoteLayout.init(metrics:labelView:chevronView:)();
}

uint64_t sub_100759B90()
{
  return type metadata accessor for FootnoteLayout();
}

uint64_t sub_100759BA0()
{
  return GladiatorRules.rules.getter();
}

uint64_t sub_100759BB0()
{
  return GladiatorRules.init()();
}

uint64_t sub_100759BC0()
{
  return type metadata accessor for GladiatorRules();
}

uint64_t sub_100759BD0()
{
  return HorizontalRule.isFullWidth.getter();
}

void sub_100759BE0(CAShapeLayer to, CGColorRef lineColor, UITraitCollection traitCollection)
{
}

uint64_t sub_100759BF0()
{
  return HorizontalRule.Style.lineThickness(traitCollection:)();
}

uint64_t sub_100759C00()
{
  return HorizontalRule.Style.path(in:traitCollection:)();
}

uint64_t sub_100759C10()
{
  return type metadata accessor for HorizontalRule.Style();
}

uint64_t sub_100759C20()
{
  return HorizontalRule.color.getter();
}

uint64_t sub_100759C30()
{
  return HorizontalRule.style.getter();
}

uint64_t sub_100759C40()
{
  return type metadata accessor for HorizontalRule();
}

uint64_t sub_100759C50()
{
  return type metadata accessor for ItemBackground();
}

uint64_t sub_100759C60()
{
  return dispatch thunk of NetworkInquiry.isConstrained.getter();
}

uint64_t sub_100759C70()
{
  return dispatch thunk of NetworkInquiry.isLikelyReachable.getter();
}

uint64_t sub_100759C80()
{
  return dispatch thunk of NetworkInquiry.observe(on:_:)();
}

uint64_t sub_100759C90()
{
  return type metadata accessor for OfferTitleType();
}

uint64_t sub_100759CA0()
{
  return type metadata accessor for PreorderStatus();
}

uint64_t sub_100759CB0()
{
  return PurchaseIntent.init(from:stateMachine:additionalHeaders:presentingSceneIdentifier:)();
}

uint64_t sub_100759CC0()
{
  return type metadata accessor for PurchaseIntent();
}

uint64_t sub_100759CD0()
{
  return type metadata accessor for PurchaseResult();
}

uint64_t sub_100759CE0()
{
  return type metadata accessor for RuleIdentifier();
}

uint64_t sub_100759CF0()
{
  return dispatch thunk of ScrollObserver.didScroll(visibleItems:layoutEnvironment:contentOffset:)();
}

uint64_t sub_100759D00()
{
  return dispatch thunk of ScrollObserver.didScroll(in:)();
}

uint64_t sub_100759D10()
{
  return ScrollObserver.didScroll(visibleItems:layoutEnvironment:contentOffset:)();
}

void sub_100759D20(UIScrollView in)
{
}

void sub_100759D30(UIScrollView in)
{
}

void sub_100759D40(UIScrollView in, Swift::Bool willDecelerate)
{
}

void sub_100759D50(UIScrollView in)
{
}

uint64_t sub_100759D60()
{
  return ScrollObserver.willEndDragging(in:with:targetContentOffset:)();
}

void sub_100759D70(UIScrollView in)
{
}

uint64_t sub_100759D80()
{
  return SearchAdAction.action.getter();
}

uint64_t sub_100759D90()
{
  return type metadata accessor for SearchAdAction();
}

uint64_t sub_100759DA0()
{
  return ShareSheetData.url.getter();
}

uint64_t sub_100759DB0()
{
  return type metadata accessor for ShareSheetData.Metadata();
}

uint64_t sub_100759DC0()
{
  return ShareSheetData.metadata.getter();
}

uint64_t sub_100759DD0()
{
  return ShareSheetData.shortUrl.getter();
}

uint64_t sub_100759DE0()
{
  return dispatch thunk of ShelfPresenter.interactiveShelfBackground(at:)();
}

uint64_t sub_100759DF0()
{
  return dispatch thunk of ShelfPresenter.prefersHorizontalShelf(for:)();
}

uint64_t sub_100759E00()
{
  return dispatch thunk of ShelfPresenter.isShelfHidden(for:)();
}

uint64_t sub_100759E10()
{
  return dispatch thunk of ShelfPresenter.doesShelfExist(for:)();
}

uint64_t sub_100759E20()
{
  return dispatch thunk of ShelfPresenter.background(for:)();
}

uint64_t sub_100759E30()
{
  return dispatch thunk of ShelfPresenter.contentType(for:)();
}

uint64_t sub_100759E40()
{
  return dispatch thunk of ShelfPresenter.numberOfRows(for:)();
}

uint64_t sub_100759E50()
{
  return dispatch thunk of ShelfPresenter.sectionCount.getter();
}

uint64_t sub_100759E60()
{
  return dispatch thunk of ShelfPresenter.seeAllAction(for:)();
}

uint64_t sub_100759E70()
{
  return dispatch thunk of ShelfPresenter.titleArtwork(for:)();
}

uint64_t sub_100759E80()
{
  return dispatch thunk of ShelfPresenter.didSelectItem(at:)();
}

uint64_t sub_100759E90()
{
  return dispatch thunk of ShelfPresenter.rowsPerColumn(for:)();
}

uint64_t sub_100759EA0()
{
  return dispatch thunk of ShelfPresenter.doesModelExist(for:)();
}

uint64_t sub_100759EB0()
{
  return dispatch thunk of ShelfPresenter.eyebrowArtwork(for:)();
}

uint64_t sub_100759EC0()
{
  return dispatch thunk of ShelfPresenter.itemBackground(forItemAt:)();
}

uint64_t sub_100759ED0()
{
  return dispatch thunk of ShelfPresenter.didSelectSeeAll(for:)();
}

uint64_t sub_100759EE0()
{
  return dispatch thunk of ShelfPresenter.didSelectNestedItem(at:)();
}

uint64_t sub_100759EF0()
{
  return dispatch thunk of ShelfPresenter.model(at:)();
}

uint64_t sub_100759F00()
{
  return dispatch thunk of ShelfPresenter.shelf(for:)();
}

uint64_t sub_100759F10()
{
  return dispatch thunk of ShelfPresenter.title(for:)();
}

uint64_t sub_100759F20()
{
  return dispatch thunk of ShelfPresenter.eyebrow(for:)();
}

uint64_t sub_100759F30()
{
  return dispatch thunk of ShelfPresenter.subtitle(for:)();
}

uint64_t sub_100759F40()
{
  return SnapshotUpdate.contentSnapshot.getter();
}

uint64_t sub_100759F50()
{
  return SnapshotUpdate.useReloadData.getter();
}

uint64_t sub_100759F60()
{
  return SnapshotUpdate.animated.getter();
}

uint64_t sub_100759F70()
{
  return TodayCardMedia.otdTextStyle.getter();
}

uint64_t sub_100759F80()
{
  return TodayCardMedia.impressionMetrics.getter();
}

uint64_t sub_100759F90()
{
  return type metadata accessor for TodayCardMedia.TitleBackingGradient();
}

uint64_t sub_100759FA0()
{
  return TodayCardMedia.titleBackingGradient.getter();
}

uint64_t sub_100759FB0()
{
  return TodayCardMedia.Kind.rawValue.getter();
}

uint64_t sub_100759FC0()
{
  return TodayCardMedia.kind.getter();
}

uint64_t sub_100759FD0()
{
  return type metadata accessor for TodayCardMedia();
}

uint64_t sub_100759FE0()
{
  return UnifiedMessage.placement.getter();
}

uint64_t sub_100759FF0()
{
  return type metadata accessor for UnifiedMessage();
}

uint64_t sub_10075A000()
{
  return dispatch thunk of UpsellBreakout.clickAction.getter();
}

uint64_t sub_10075A010()
{
  return UpsellBreakout.DisplayProperties.badgeColor.getter();
}

uint64_t sub_10075A020()
{
  return UpsellBreakout.DisplayProperties.titleColor.getter();
}

uint64_t sub_10075A030()
{
  return UpsellBreakout.DisplayProperties.backgroundColor.getter();
}

uint64_t sub_10075A040()
{
  return UpsellBreakout.DisplayProperties.descriptionColor.getter();
}

uint64_t sub_10075A050()
{
  return UpsellBreakout.DisplayProperties.callToActionColor.getter();
}

uint64_t sub_10075A060()
{
  return UpsellBreakout.DisplayProperties.wantsBlur.getter();
}

uint64_t sub_10075A070()
{
  return type metadata accessor for UpsellBreakout.DisplayProperties();
}

uint64_t sub_10075A080()
{
  return UpsellBreakout.displayProperties.getter();
}

uint64_t sub_10075A090()
{
  return UpsellBreakout.offerButtonAction.getter();
}

uint64_t sub_10075A0A0()
{
  return UpsellBreakout.buttonCallToAction.getter();
}

uint64_t sub_10075A0B0()
{
  return UpsellBreakout.offerDisplayProperties.getter();
}

uint64_t sub_10075A0C0()
{
  return UpsellBreakout.video.getter();
}

uint64_t sub_10075A0D0()
{
  return UpsellBreakout.artwork.getter();
}

uint64_t sub_10075A0E0()
{
  return UpsellBreakout.details.getter();
}

uint64_t sub_10075A0F0()
{
  return type metadata accessor for UpsellBreakout();
}

uint64_t sub_10075A100()
{
  return type metadata accessor for ArtworkGridType();
}

uint64_t sub_10075A110()
{
  return BreakoutDetails.callToActionButtonAction.getter();
}

uint64_t sub_10075A120()
{
  return BreakoutDetails.description.getter();
}

uint64_t sub_10075A130()
{
  return BreakoutDetails.TextAlignment.textAlignment(in:)();
}

uint64_t sub_10075A140()
{
  return type metadata accessor for BreakoutDetails.TextAlignment();
}

uint64_t sub_10075A150()
{
  return BreakoutDetails.textAlignment.getter();
}

uint64_t sub_10075A160()
{
  return type metadata accessor for BreakoutDetails.BackgroundStyle();
}

uint64_t sub_10075A170()
{
  return BreakoutDetails.backgroundStyle.getter();
}

uint64_t sub_10075A180()
{
  return BreakoutDetails.badgeColorOverride.getter();
}

uint64_t sub_10075A190()
{
  return type metadata accessor for BreakoutDetails.Badge();
}

uint64_t sub_10075A1A0()
{
  return BreakoutDetails.badge.getter();
}

uint64_t sub_10075A1B0()
{
  return BreakoutDetails.title.getter();
}

uint64_t sub_10075A1C0()
{
  return dispatch thunk of CellWithArtwork.cancelArtworkFetch(on:deprioritizingFetch:)();
}

uint64_t sub_10075A1D0()
{
  return dispatch thunk of CellWithArtwork.fetch(artwork:on:)();
}

uint64_t sub_10075A1E0()
{
  return ContingentOffer.trunkAppIcon.getter();
}

uint64_t sub_10075A1F0()
{
  return ContingentOffer.description.getter();
}

uint64_t sub_10075A200()
{
  return ContingentOffer.offerLockup.getter();
}

uint64_t sub_10075A210()
{
  return ContingentOffer.additionalInfo.getter();
}

uint64_t sub_10075A220()
{
  return ContingentOffer.learnMoreTitle.getter();
}

uint64_t sub_10075A230()
{
  return ContingentOffer.backgroundArtwork.getter();
}

uint64_t sub_10075A240()
{
  return ContingentOffer.mediaOverlayStyle.getter();
}

uint64_t sub_10075A250()
{
  return ContingentOffer.badge.getter();
}

uint64_t sub_10075A260()
{
  return ContingentOffer.label.getter();
}

uint64_t sub_10075A270()
{
  return ContingentOffer.title.getter();
}

uint64_t sub_10075A280()
{
  return ContingentOffer.subtitle.getter();
}

uint64_t sub_10075A290()
{
  return type metadata accessor for ContingentOffer();
}

uint64_t sub_10075A2A0()
{
  return dispatch thunk of MetricsActivity.changeContext(_:)();
}

uint64_t sub_10075A2B0()
{
  return dispatch thunk of MetricsActivity.changePreloaded(_:)();
}

uint64_t sub_10075A2C0()
{
  return dispatch thunk of MetricsActivity.setReferrerData(_:)();
}

uint64_t sub_10075A2D0()
{
  return dispatch thunk of MetricsActivity.contextualAction.getter();
}

uint64_t sub_10075A2E0()
{
  return dispatch thunk of MetricsActivity.currentPageFields.getter();
}

uint64_t sub_10075A2F0()
{
  return dispatch thunk of MetricsActivity.currentPageFields.setter();
}

uint64_t sub_10075A300()
{
  return dispatch thunk of MetricsActivity.performingContext(for:body:)();
}

uint64_t sub_10075A310()
{
  return dispatch thunk of MetricsActivity.changePageReferrerUrl(_:)();
}

uint64_t sub_10075A320()
{
  return dispatch thunk of MetricsActivity.currentSearchAdRotationDataProvider.getter();
}

uint64_t sub_10075A330()
{
  return static MetricsActivity.current.getter();
}

uint64_t sub_10075A340()
{
  return dispatch thunk of MetricsActivity.preloaded.getter();
}

uint64_t sub_10075A350()
{
  return type metadata accessor for MetricsActivity();
}

uint64_t sub_10075A360()
{
  return NetworkActivity.delegate.setter();
}

uint64_t sub_10075A370()
{
  return type metadata accessor for NetworkActivity();
}

uint64_t sub_10075A380()
{
  return ObjectGraphPair.objectGraph.getter();
}

uint64_t sub_10075A390()
{
  return ObjectGraphPair.value.getter();
}

uint64_t sub_10075A3A0()
{
  return static OfferLabelStyle.== infix(_:_:)();
}

uint64_t sub_10075A3B0()
{
  return type metadata accessor for OfferLabelStyle();
}

uint64_t sub_10075A3C0()
{
  return PageEnvironment.dynamicTypeSize.getter();
}

uint64_t sub_10075A3D0()
{
  return PageEnvironment.init(traitCollection:)();
}

uint64_t sub_10075A3E0()
{
  return PageEnvironment.isHorizontalSizeClassCompact.getter();
}

uint64_t sub_10075A3F0()
{
  return PageEnvironment.isHorizontalSizeClassRegular.getter();
}

uint64_t sub_10075A400()
{
  return type metadata accessor for PageEnvironment();
}

uint64_t sub_10075A410()
{
  return dispatch thunk of PageGridCaching.invalidateCache()();
}

uint64_t sub_10075A430()
{
  return PageGridCaching.supplementaryPageGrid(for:surroundedBy:containerSize:safeAreaInsets:environment:)();
}

uint64_t sub_10075A440()
{
  return PageGridCaching.contentPageGrid(for:surroundedBy:containerSize:safeAreaInsets:environment:)();
}

void sub_10075A450()
{
}

uint64_t sub_10075A460()
{
  return PageRefreshGate.performRefresh.setter();
}

uint64_t sub_10075A470()
{
  return PageRefreshGate.viewWillAppear(on:)();
}

uint64_t sub_10075A480()
{
  return PageRefreshGate.appWillBackground(on:)();
}

uint64_t sub_10075A490()
{
  return PageRefreshGate.appWillForeground(on:)();
}

uint64_t sub_10075A4A0()
{
  return PageRefreshGate.viewWillDisappear(on:)();
}

uint64_t sub_10075A4B0()
{
  return PageRefreshGate.init(policy:)();
}

uint64_t sub_10075A4C0()
{
  return type metadata accessor for PageRefreshGate();
}

uint64_t sub_10075A4D0()
{
  return PrivacyCategory.prefersSmallArtwork.getter();
}

uint64_t sub_10075A4E0()
{
  return PrivacyCategory.style.getter();
}

uint64_t sub_10075A4F0()
{
  return PrivacyCategory.title.getter();
}

uint64_t sub_10075A500()
{
  return PrivacyCategory.artwork.getter();
}

uint64_t sub_10075A510()
{
  return PrivacyCategory.dataTypes.getter();
}

uint64_t sub_10075A520()
{
  return type metadata accessor for PrivacyCategory();
}

uint64_t sub_10075A530()
{
  return ProductPageLink.systemImageName.getter();
}

uint64_t sub_10075A540()
{
  return ProductPageLink.text.getter();
}

uint64_t sub_10075A550()
{
  return type metadata accessor for ProductPageLink();
}

uint64_t sub_10075A560()
{
  return static ShelfBackground.== infix(_:_:)();
}

uint64_t sub_10075A570()
{
  return type metadata accessor for ShelfBackground();
}

uint64_t sub_10075A580()
{
  return SpacerDimension.init(constant:)();
}

uint64_t sub_10075A590()
{
  return type metadata accessor for SpacerDimension();
}

uint64_t sub_10075A5A0()
{
  return SuggestedFriend.init(contactID:contactAssociationID:handle:fullName:supportsFriendingViaPush:)();
}

uint64_t sub_10075A5B0()
{
  return type metadata accessor for SuggestedFriend();
}

uint64_t sub_10075A5C0()
{
  return TabChangeAction.init(navigationTab:actions:popToRoot:presentationStyle:actionMetrics:)();
}

uint64_t sub_10075A5D0()
{
  return TabChangeAction.navigationTab.getter();
}

uint64_t sub_10075A5E0()
{
  return TabChangeAction.actions.getter();
}

uint64_t sub_10075A5F0()
{
  return TabChangeAction.popToRoot.getter();
}

uint64_t sub_10075A600()
{
  return type metadata accessor for TabChangeAction();
}

uint64_t sub_10075A610()
{
  return dispatch thunk of TitledParagraph.collapsedText.getter();
}

uint64_t sub_10075A620()
{
  return TitledParagraph.primarySubtitle.getter();
}

uint64_t sub_10075A630()
{
  return TitledParagraph.secondarySubtitle.getter();
}

uint64_t sub_10075A640()
{
  return dispatch thunk of TitledParagraph.text.getter();
}

uint64_t sub_10075A650()
{
  return TitledParagraph.style.getter();
}

uint64_t sub_10075A660()
{
  return type metadata accessor for TitledParagraph();
}

uint64_t sub_10075A670(Swift::String _, Swift::OpaquePointer with)
{
  return localizedString(_:with:)(_, with)._countAndFlagsBits;
}

uint64_t sub_10075A680(Swift::String _, Swift::String comment)
{
  return localizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_10075A690()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.TitleStyle();
}

uint64_t sub_10075A6A0()
{
  return AccountPresenter.AccountDetailItem.titleStyle.getter();
}

uint64_t sub_10075A6B0()
{
  return AccountPresenter.AccountDetailItem.accessoryMargin.getter();
}

uint64_t sub_10075A6C0()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.ImageConfiguration();
}

uint64_t sub_10075A6D0()
{
  return AccountPresenter.AccountDetailItem.shouldShowFullTitle.getter();
}

uint64_t sub_10075A6E0()
{
  return AccountPresenter.AccountDetailItem.image.getter();
}

uint64_t sub_10075A6F0()
{
  return AccountPresenter.AccountDetailItem.title.getter();
}

uint64_t sub_10075A700()
{
  return AccountPresenter.AccountDetailItem.detail.getter();
}

uint64_t sub_10075A710()
{
  return AccountPresenter.AccountDetailItem.disabled.getter();
}

uint64_t sub_10075A720()
{
  return AccountPresenter.AccountDetailItem.subtitle.getter();
}

uint64_t sub_10075A730()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.Accessory();
}

uint64_t sub_10075A740()
{
  return AccountPresenter.AccountDetailItem.accessory.getter();
}

uint64_t sub_10075A750()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem();
}

uint64_t sub_10075A760()
{
  return AccountPresenter.init(objectGraph:accountStore:appStateController:iapStateProvider:restrictions:profilePictureDiameter:arcadeSubscriptionManager:gameCenterFriendRequestCoordinator:)();
}

uint64_t sub_10075A770()
{
  return dispatch thunk of AccountPresenter.canUninstall(_:)();
}

uint64_t sub_10075A780()
{
  return dispatch thunk of AccountPresenter.didSelectItem(_:)();
}

uint64_t sub_10075A790()
{
  return dispatch thunk of AccountPresenter.refreshUpdates(fromServer:forceServerFetch:refreshBadgeCount:)();
}

uint64_t sub_10075A7A0()
{
  return dispatch thunk of AccountPresenter.didFinishSignIn()();
}

uint64_t sub_10075A7B0()
{
  return dispatch thunk of AccountPresenter.onApplySnapshot.getter();
}

uint64_t sub_10075A7C0()
{
  return dispatch thunk of AccountPresenter.isUpdatesLoading.getter();
}

uint64_t sub_10075A7D0()
{
  return AccountPresenter.UpdatesLockupItem.isCollapsed.getter();
}

uint64_t sub_10075A7E0()
{
  return AccountPresenter.UpdatesLockupItem.moreButtonHandler.getter();
}

uint64_t sub_10075A7F0()
{
  return AccountPresenter.UpdatesLockupItem.lockup.getter();
}

uint64_t sub_10075A800()
{
  return type metadata accessor for AccountPresenter.UpdatesLockupItem();
}

uint64_t sub_10075A810()
{
  return dispatch thunk of AccountPresenter.shelfImpressionMetrics(at:)();
}

uint64_t sub_10075A820()
{
  return type metadata accessor for AccountPresenter.Item();
}

uint64_t sub_10075A830()
{
  return dispatch thunk of AccountPresenter.view.setter();
}

uint64_t sub_10075A840()
{
  return dispatch thunk of AccountPresenter.title.getter();
}

uint64_t sub_10075A850()
{
  return type metadata accessor for AccountPresenter.Section.Identifier();
}

uint64_t sub_10075A860()
{
  return AccountPresenter.Section.footerText.getter();
}

uint64_t sub_10075A870()
{
  return AccountPresenter.Section.headerText.getter();
}

uint64_t sub_10075A880()
{
  return AccountPresenter.Section.identifier.getter();
}

uint64_t sub_10075A890()
{
  return AccountPresenter.Section.footerButtonHandler.getter();
}

uint64_t sub_10075A8A0()
{
  return dispatch thunk of AccountPresenter.uninstall(_:)();
}

uint64_t sub_10075A8B0()
{
  return type metadata accessor for AccountPresenter();
}

uint64_t sub_10075A8C0()
{
  return type metadata accessor for AlertActionStyle();
}

uint64_t sub_10075A8D0()
{
  return static AutomaticUpdates.enabledDidChangeNotification.getter();
}

uint64_t sub_10075A8E0()
{
  return type metadata accessor for AutomaticUpdates();
}

uint64_t sub_10075A8F0()
{
  return type metadata accessor for BadgeViewSpacing();
}

uint64_t sub_10075A910()
{
  return static ConfigurableCell.reuseIdentifier(in:)();
}

uint64_t sub_10075A920()
{
  return dispatch thunk of DynamicTypeLabel.updateFont(to:)();
}

uint64_t sub_10075A930()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCase.getter();
}

uint64_t sub_10075A940()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCase.setter();
}

uint64_t sub_10075A950()
{
  return DynamicTypeLabel.__allocating_init(customTextStyle:numberOfLines:lineBreakMode:directionalTextAlignment:contentSizeCategoryMapping:)();
}

uint64_t sub_10075A960()
{
  return dispatch thunk of DynamicTypeLabel.customTextStyle.setter();
}

uint64_t sub_10075A970()
{
  return dispatch thunk of DynamicTypeLabel.directionalTextAlignment.getter();
}

uint64_t sub_10075A980()
{
  return dispatch thunk of DynamicTypeLabel.directionalTextAlignment.setter();
}

uint64_t sub_10075A990()
{
  return dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.getter();
}

uint64_t sub_10075A9A0()
{
  return dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.setter();
}

uint64_t sub_10075A9B0()
{
  return dispatch thunk of DynamicTypeLabel.wantsFastBaselineMeasurement.setter();
}

uint64_t sub_10075A9C0()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCaseContentSizeCategory.setter();
}

uint64_t sub_10075A9D0()
{
  return dispatch thunk of DynamicTypeLabel.traitCollectionForFontUseCases.getter();
}

uint64_t sub_10075A9E0()
{
  return DynamicTypeLabel.__allocating_init(frame:)();
}

uint64_t sub_10075A9F0()
{
  return DynamicTypeLabel.init(useCase:numberOfLines:lineBreakMode:isUserInteractionEnabled:directionalTextAlignment:contentSizeCategoryMapping:)();
}

uint64_t sub_10075AA00()
{
  return type metadata accessor for DynamicTypeLabel();
}

uint64_t sub_10075AA10()
{
  return method lookup function for DynamicTypeLabel();
}

uint64_t sub_10075AA20()
{
  return type metadata accessor for EditorialPageKey();
}

uint64_t sub_10075AA30()
{
  return GameCenterPlayer.displayName.getter();
}

uint64_t sub_10075AA40()
{
  return GameCenterPlayer.alias.getter();
}

uint64_t sub_10075AA50()
{
  return GameCenterPlayer.action.getter();
}

uint64_t sub_10075AA60()
{
  return dispatch thunk of GameCenterPlayer.artwork.getter();
}

uint64_t sub_10075AA70()
{
  return dispatch thunk of HeroCarouselItem.clickAction.getter();
}

uint64_t sub_10075AA80()
{
  return dispatch thunk of HeroCarouselItem.titleEffect.getter();
}

uint64_t sub_10075AA90()
{
  return HeroCarouselItem.backgroundColor.getter();
}

uint64_t sub_10075AAA0()
{
  return HeroCarouselItem.impressionMetrics.getter();
}

uint64_t sub_10075AAB0()
{
  return HeroCarouselItem.video.getter();
}

uint64_t sub_10075AAC0()
{
  return HeroCarouselItem.artwork.getter();
}

uint64_t sub_10075AAD0()
{
  return HeroCarouselItem.overlay.getter();
}

uint64_t sub_10075AAE0()
{
  return type metadata accessor for InstallationType();
}

uint64_t sub_10075AAF0()
{
  return MixedMediaLockup.showMetadataInformationInLockup.getter();
}

uint64_t sub_10075AB00()
{
  return MixedMediaLockup.overrideLockupPosition.getter();
}

uint64_t sub_10075AB10()
{
  return type metadata accessor for MixedMediaLockup.LockupPosition();
}

uint64_t sub_10075AB20()
{
  return MixedMediaLockup.screenshots.getter();
}

uint64_t sub_10075AB30()
{
  return MixedMediaLockup.metadataRibbonItems.getter();
}

uint64_t sub_10075AB40()
{
  return MixedMediaLockup.searchTagRibbonItems.getter();
}

uint64_t sub_10075AB50()
{
  return MixedMediaLockup.screenshotsDisplayStyle.getter();
}

uint64_t sub_10075AB60()
{
  return MixedMediaLockup.shouldEvenlyDistributeRibbonItems.getter();
}

uint64_t sub_10075AB70()
{
  return MixedMediaLockup.init(adamId:bundleId:icon:heading:title:subtitle:developerTagline:editorialTagline:editorialDescription:shortEditorialDescription:ordinal:rating:ratingCount:buttonAction:offerDisplayProperties:clickAction:contextMenuData:impressionMetrics:overrideLockupPosition:trailers:screenshots:screenshotsDisplayStyle:metadataRibbonItems:searchTagRibbonItems:shouldEvenlyDistributeRibbonItems:showMetadataInformationInLockup:)();
}

uint64_t sub_10075AB80()
{
  return MixedMediaLockup.trailers.getter();
}

uint64_t sub_10075AB90()
{
  return type metadata accessor for MixedMediaLockup();
}

uint64_t sub_10075ABA0()
{
  return OfferEnvironment.isArcadeEnvironment.getter();
}

uint64_t sub_10075ABB0()
{
  return static OfferEnvironment.== infix(_:_:)();
}

uint64_t sub_10075ABC0()
{
  return type metadata accessor for OfferEnvironment();
}

uint64_t sub_10075ABD0()
{
  return OfferStateAction.subscribePageAction.getter();
}

uint64_t sub_10075ABE0()
{
  return OfferStateAction.buyAction.getter();
}

uint64_t sub_10075ABF0()
{
  return OfferStateAction.openAction.getter();
}

uint64_t sub_10075AC00()
{
  return OfferStateAction.defaultAction.getter();
}

uint64_t sub_10075AC10()
{
  return OfferStateAction.preferredActionFor(stateMachine:)();
}

uint64_t sub_10075AC20()
{
  return OfferStateAction.includeBetaApps.getter();
}

uint64_t sub_10075AC30()
{
  return OfferStateAction.adamId.getter();
}

uint64_t sub_10075AC40()
{
  return type metadata accessor for OfferStateAction();
}

uint64_t sub_10075AC50()
{
  return dispatch thunk of OffsetGridLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075AC60()
{
  return static OffsetGridLayout.numberOfViewsNeeded(toFill:with:)();
}

uint64_t sub_10075AC70()
{
  return static OffsetGridLayout.Metrics.centerOffsetLayout(with:interItemSpacing:lineSpacing:numberOfRows:originOffset:)();
}

uint64_t sub_10075AC80()
{
  return type metadata accessor for OffsetGridLayout.Metrics();
}

uint64_t sub_10075AC90()
{
  return OffsetGridLayout.init(metrics:views:)();
}

uint64_t sub_10075ACA0()
{
  return type metadata accessor for OffsetGridLayout();
}

uint64_t sub_10075ACB0()
{
  return PageGridProvider.bottomPadding(for:surroundedBy:containerSize:environment:)();
}

uint64_t sub_10075ACC0()
{
  return PageMetricsEvent.init(error:pageUrl:)();
}

uint64_t sub_10075ACD0()
{
  return type metadata accessor for PageMetricsEvent();
}

uint64_t sub_10075ACE0()
{
  return PlaceholderBrick.init(style:title:badge:artworks:)();
}

uint64_t sub_10075ACF0()
{
  return type metadata accessor for PlaceholderBrick();
}

uint64_t sub_10075AD00()
{
  return type metadata accessor for PrivacyTypeStyle();
}

uint64_t sub_10075AD10()
{
  return ProductMediaItem.screenshot.getter();
}

uint64_t sub_10075AD20()
{
  return ProductMediaItem.video.getter();
}

uint64_t sub_10075AD30()
{
  return type metadata accessor for ProductMediaItem();
}

uint64_t sub_10075AD40()
{
  return type metadata accessor for ProductPageTheme();
}

uint64_t sub_10075AD50()
{
  return dispatch thunk of ProductPresenter.alwaysAllowReviews.getter();
}

uint64_t sub_10075AD60()
{
  return type metadata accessor for ProductPresenter();
}

uint64_t sub_10075AD70()
{
  return ProductTopLockup.offerAction.getter();
}

uint64_t sub_10075AD80()
{
  return ProductTopLockup.PrimaryBanner.hideCriteria.getter();
}

uint64_t sub_10075AD90()
{
  return type metadata accessor for ProductTopLockup.PrimaryBanner();
}

uint64_t sub_10075ADA0()
{
  return ProductTopLockup.developerName.getter();
}

uint64_t sub_10075ADB0()
{
  return ProductTopLockup.primaryBanner(for:)();
}

uint64_t sub_10075ADC0()
{
  return ProductTopLockup.tertiaryTitle.getter();
}

uint64_t sub_10075ADD0()
{
  return ProductTopLockup.secondaryBanner.getter();
}

uint64_t sub_10075ADE0()
{
  return ProductTopLockup.developerTagline.getter();
}

uint64_t sub_10075ADF0()
{
  return ProductTopLockup.hasExpandedOffer.getter();
}

uint64_t sub_10075AE00()
{
  return ProductTopLockup.expandedOfferTitles.getter();
}

uint64_t sub_10075AE10()
{
  return ProductTopLockup.offerDisplayProperties.getter();
}

uint64_t sub_10075AE20()
{
  return ProductTopLockup.offerSubtitlesOverride.getter();
}

uint64_t sub_10075AE30()
{
  return ProductTopLockup.hasExpandedOfferDetails.getter();
}

uint64_t sub_10075AE40()
{
  return ProductTopLockup.wantsInlineUberPresentationStyle.getter();
}

uint64_t sub_10075AE50()
{
  return ProductTopLockup.uber.getter();
}

uint64_t sub_10075AE60()
{
  return ProductTopLockup.theme.getter();
}

uint64_t sub_10075AE70()
{
  return ProductTopLockup.title.getter();
}

uint64_t sub_10075AE80()
{
  return ProductTopLockup.adamId.getter();
}

uint64_t sub_10075AE90()
{
  return ProductTopLockup.subtitle.getter();
}

uint64_t sub_10075AEA0()
{
  return ProductTopLockup.iconStyle.getter();
}

uint64_t sub_10075AEB0()
{
  return type metadata accessor for ProductTopLockup();
}

uint64_t sub_10075AEC0()
{
  return ReviewsContainer.alwaysAllowReviews.getter();
}

uint64_t sub_10075AED0()
{
  return ReviewsContainer.editorsChoice.getter();
}

uint64_t sub_10075AEE0()
{
  return ReviewsContainer.reviewSummary.getter();
}

uint64_t sub_10075AEF0()
{
  return ReviewsContainer.supportAction.getter();
}

uint64_t sub_10075AF00()
{
  return ReviewsContainer.writeReviewAction.getter();
}

uint64_t sub_10075AF10()
{
  return ReviewsContainer.adamId.getter();
}

uint64_t sub_10075AF20()
{
  return ReviewsContainer.ratings.getter();
}

uint64_t sub_10075AF30()
{
  return ReviewsContainer.reviews.getter();
}

uint64_t sub_10075AF40()
{
  return ReviewsContainer.tapToRate.getter();
}

uint64_t sub_10075AF50()
{
  return type metadata accessor for ReviewsContainer();
}

uint64_t sub_10075AF60()
{
  return static RiverViewStyling.defaultSpeed.getter();
}

uint64_t sub_10075AF70()
{
  return static RiverViewStyling.todayTabSpeed.getter();
}

uint64_t sub_10075AF80()
{
  return RiverViewStyling.interRowSpacing.getter();
}

uint64_t sub_10075AF90()
{
  return RiverViewStyling.interItemSpacing.getter();
}

uint64_t sub_10075AFA0()
{
  return static RiverViewStyling.defaultRowOffsets.getter();
}

uint64_t sub_10075AFB0()
{
  return static RiverViewStyling.defaultInterRowSpacing.getter();
}

uint64_t sub_10075AFC0()
{
  return static RiverViewStyling.defaultInterItemSpacing.getter();
}

uint64_t sub_10075AFD0()
{
  return RiverViewStyling.speed.getter();
}

uint64_t sub_10075AFE0()
{
  return RiverViewStyling.init(itemSize:interRowSpacing:interItemSpacing:speed:rowOffsets:reverseAlternatingRows:)();
}

uint64_t sub_10075AFF0()
{
  return RiverViewStyling.itemSize.getter();
}

uint64_t sub_10075B000()
{
  return type metadata accessor for RiverViewStyling();
}

uint64_t sub_10075B010()
{
  return SearchHintLayout.measurements(fitting:in:)();
}

uint64_t sub_10075B020()
{
  return SearchHintLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075B030()
{
  return SearchHintLayout.Metrics.init(leadingMargin:trailingMargin:textLeadingMargin:iconHorizontalCenterMargin:iconSize:)();
}

uint64_t sub_10075B040()
{
  return SearchHintLayout.Metrics.iconSize.getter();
}

uint64_t sub_10075B050()
{
  return type metadata accessor for SearchHintLayout.Metrics();
}

uint64_t sub_10075B060()
{
  return SearchHintLayout.init(metrics:iconView:titleLabel:separatorView:)();
}

uint64_t sub_10075B070()
{
  return type metadata accessor for SearchHintLayout();
}

uint64_t sub_10075B080()
{
  return ShareSheetAction.shareSheetStyle.getter();
}

uint64_t sub_10075B090()
{
  return type metadata accessor for ShareSheetAction.ShareSheetStyle();
}

uint64_t sub_10075B0A0()
{
  return ShareSheetAction.activities.getter();
}

uint64_t sub_10075B0B0()
{
  return ShareSheetAction.data.getter();
}

uint64_t sub_10075B0C0()
{
  return ShareSheetAction.Activity.activityType.getter();
}

uint64_t sub_10075B0D0()
{
  return ShareSheetAction.Activity.action.getter();
}

uint64_t sub_10075B0E0()
{
  return type metadata accessor for ShareSheetAction.Activity();
}

uint64_t sub_10075B0F0()
{
  return type metadata accessor for ShareSheetAction();
}

uint64_t sub_10075B100()
{
  return SheetActionStyle.allowsDisplayOfTitle.getter();
}

uint64_t sub_10075B110()
{
  return type metadata accessor for SheetActionStyle();
}

uint64_t sub_10075B120()
{
  return TodayCardOverlay.Kind.rawValue.getter();
}

uint64_t sub_10075B130()
{
  return TodayCardOverlay.kind.getter();
}

uint64_t sub_10075B140()
{
  return type metadata accessor for TodayCardOverlay();
}

uint64_t sub_10075B150()
{
  return dispatch thunk of TodayCardTrigger.identifier.getter();
}

uint64_t sub_10075B160()
{
  return dispatch thunk of TodayCardTrigger.clearActivationContext()();
}

uint64_t sub_10075B170()
{
  return dispatch thunk of TodayCardTrigger.adamId.getter();
}

uint64_t sub_10075B180()
{
  return UpsellGridLayout.measurements(fitting:in:)();
}

uint64_t sub_10075B190()
{
  return static UpsellGridLayout.largeIconSize(fitting:using:in:)();
}

uint64_t sub_10075B1A0()
{
  return UpsellGridLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075B1B0()
{
  return UpsellGridLayout.Metrics.init(dimensionSmallIconCount:)();
}

uint64_t sub_10075B1C0()
{
  return type metadata accessor for UpsellGridLayout.Metrics();
}

uint64_t sub_10075B1D0()
{
  return UpsellGridLayout.init(metrics:icons:)();
}

uint64_t sub_10075B1E0()
{
  return static UpsellGridLayout.iconCount(fitting:using:in:)();
}

uint64_t sub_10075B1F0()
{
  return static UpsellGridLayout.iconSizes(fitting:using:in:)();
}

uint64_t sub_10075B200()
{
  return type metadata accessor for UpsellGridLayout();
}

uint64_t sub_10075B210()
{
  return static VideoPlayerState.== infix(_:_:)();
}

uint64_t sub_10075B220()
{
  return type metadata accessor for VideoPlayerState();
}

uint64_t sub_10075B230()
{
  return dispatch thunk of VideoViewManager.videoView<A>(with:videoUrl:configuration:templateMediaEvent:templateClickEvent:asPartOf:)();
}

uint64_t sub_10075B240()
{
  return VideoViewManager.init(networkInquiry:metricsPipeline:)();
}

uint64_t sub_10075B250()
{
  return type metadata accessor for VideoViewManager();
}

uint64_t sub_10075B260()
{
  return AnnotationItem_V2.headingArtworkItems.getter();
}

uint64_t sub_10075B270()
{
  return AnnotationItem_V2.text.getter();
}

uint64_t sub_10075B280()
{
  return AnnotationItem_V2.heading.getter();
}

uint64_t sub_10075B290()
{
  return AnnotationItem_V2.TextPair.leadingText.getter();
}

uint64_t sub_10075B2A0()
{
  return AnnotationItem_V2.TextPair.trailingText.getter();
}

uint64_t sub_10075B2B0()
{
  return type metadata accessor for AnnotationItem_V2.TextPair();
}

uint64_t sub_10075B2C0()
{
  return AnnotationItem_V2.listText.getter();
}

uint64_t sub_10075B2D0()
{
  return AnnotationItem_V2.textPairs.getter();
}

uint64_t sub_10075B2E0()
{
  return ArcadeStateChange.newState.getter();
}

uint64_t sub_10075B2F0()
{
  return ArcadeStateChange.oldState.getter();
}

uint64_t sub_10075B300()
{
  return type metadata accessor for ArcadeStateChange();
}

uint64_t sub_10075B310()
{
  return ArcadeWelcomeItem.body.getter();
}

uint64_t sub_10075B320()
{
  return ArcadeWelcomeItem.artwork.getter();
}

uint64_t sub_10075B330()
{
  return ArcadeWelcomeItem.headline.getter();
}

uint64_t sub_10075B340()
{
  return type metadata accessor for ArcadeWelcomePage.ContentType();
}

uint64_t sub_10075B350()
{
  return type metadata accessor for ArcadeWelcomePage();
}

uint64_t sub_10075B360()
{
  return static BadgeDisplayStyle.style(forBadgeCount:pageTraits:indentForBadges:)();
}

uint64_t sub_10075B370()
{
  return type metadata accessor for BadgeDisplayStyle();
}

uint64_t sub_10075B380()
{
  return type metadata accessor for BadgeLeadingValue();
}

uint64_t sub_10075B390()
{
  return static ClickMetricsEvent.makeErrorRetryEvent()();
}

uint64_t sub_10075B3A0()
{
  return static ClickMetricsEvent.tabClickEvent(named:at:)();
}

uint64_t sub_10075B3B0()
{
  return static ClickMetricsEvent.makeBackClickEvent()();
}

uint64_t sub_10075B3C0()
{
  return ClickMetricsEvent.init(targetType:targetId:including:excluding:eventFields:)();
}

uint64_t sub_10075B3D0()
{
  return type metadata accessor for ClickMetricsEvent();
}

uint64_t sub_10075B3E0()
{
  return DebugMetricsEvent.iconSymbol.getter();
}

uint64_t sub_10075B3F0()
{
  return DebugMetricsEvent.description.getter();
}

uint64_t sub_10075B400()
{
  return DebugMetricsEvent.summaryInfo.getter();
}

uint64_t sub_10075B410()
{
  return DebugMetricsEvent.date.getter();
}

uint64_t sub_10075B420()
{
  return DebugMetricsEvent.title.getter();
}

uint64_t sub_10075B430()
{
  return DebugMetricsEvent.topic.getter();
}

uint64_t sub_10075B440()
{
  return DebugMetricsEvent.fields.getter();
}

uint64_t sub_10075B450()
{
  return DebugMetricsEvent.issues.getter();
}

uint64_t sub_10075B460()
{
  return type metadata accessor for DebugMetricsEvent();
}

uint64_t sub_10075B470()
{
  return dispatch thunk of DynamicTypeButton.updateFont(to:)();
}

uint64_t sub_10075B480()
{
  return dispatch thunk of DynamicTypeButton.fontUseCase.getter();
}

uint64_t sub_10075B490()
{
  return dispatch thunk of DynamicTypeButton.fontUseCase.setter();
}

uint64_t sub_10075B4A0()
{
  return DynamicTypeButton.__allocating_init(useCase:)();
}

uint64_t sub_10075B4B0()
{
  return type metadata accessor for DynamicTypeButton();
}

uint64_t sub_10075B4C0()
{
  return method lookup function for DynamicTypeButton();
}

uint64_t sub_10075B4D0()
{
  return ExternalUrlAction.isSensitive.getter();
}

uint64_t sub_10075B4E0()
{
  return ExternalUrlAction.timeoutSeconds.getter();
}

uint64_t sub_10075B4F0()
{
  return ExternalUrlAction.url.getter();
}

uint64_t sub_10075B500()
{
  return ExternalUrlAction.init(title:urlString:isSensitive:timeoutSeconds:artwork:presentationStyle:actionMetrics:)();
}

uint64_t sub_10075B510()
{
  return type metadata accessor for ExternalUrlAction();
}

uint64_t sub_10075B520()
{
  return FlowPreviewAction.presentationContext.getter();
}

uint64_t sub_10075B530()
{
  return FlowPreviewAction.previewViewController.getter();
}

uint64_t sub_10075B540()
{
  return FlowPreviewAction.requiresNavigationController.getter();
}

uint64_t sub_10075B550()
{
  return type metadata accessor for FlowPreviewAction();
}

uint64_t sub_10075B560()
{
  return GameCenterFriends.getter();
}

uint64_t sub_10075B570()
{
  return GuidedSearchToken.isSelected.getter();
}

uint64_t sub_10075B580()
{
  return GuidedSearchToken.displayName.getter();
}

uint64_t sub_10075B590()
{
  return GuidedSearchToken.leadingIconSymbolName.getter();
}

uint64_t sub_10075B5A0()
{
  return InformationRibbon.hasTopSeparator.getter();
}

uint64_t sub_10075B5B0()
{
  return InformationRibbon.hasBottomSeparator.getter();
}

uint64_t sub_10075B5C0()
{
  return InformationRibbon.separatorsAreFullWidth.getter();
}

uint64_t sub_10075B5D0()
{
  return InformationRibbon.badges.getter();
}

uint64_t sub_10075B5E0()
{
  return type metadata accessor for InformationRibbon.Alignment();
}

uint64_t sub_10075B5F0()
{
  return InformationRibbon.alignment.getter();
}

uint64_t sub_10075B600()
{
  return type metadata accessor for InformationRibbon();
}

uint64_t sub_10075B610()
{
  return ItemLayoutContext.parentShelfLayoutContext.getter();
}

uint64_t sub_10075B620()
{
  return ItemLayoutContext.withUpdatedLayoutOptions(_:)();
}

uint64_t sub_10075B630()
{
  return ItemLayoutContext.componentLayoutOptions.getter();
}

uint64_t sub_10075B640()
{
  return ItemLayoutContext.typedModel<A>(as:)();
}

uint64_t sub_10075B650()
{
  return ItemLayoutContext.typedModel<A>(as:)();
}

uint64_t sub_10075B660()
{
  return ItemLayoutContext.typedModel<A>(is:)();
}

uint64_t sub_10075B670()
{
  return ItemLayoutContext.typedState<A>(as:)();
}

uint64_t sub_10075B680()
{
  return ItemLayoutContext.mutableState.getter();
}

uint64_t sub_10075B690()
{
  return ItemLayoutContext.sectionIndex.getter();
}

uint64_t sub_10075B6A0()
{
  return ItemLayoutContext.subscript.getter();
}

uint64_t sub_10075B6B0()
{
  return ItemLayoutContext.typedWritableState<A>(as:)();
}

uint64_t sub_10075B6C0()
{
  return ItemLayoutContext.item.getter();
}

uint64_t sub_10075B6D0()
{
  return ItemLayoutContext.index.getter();
}

uint64_t sub_10075B6E0()
{
  return ItemLayoutContext.state.getter();
}

uint64_t sub_10075B6F0()
{
  return ItemLayoutContext.Metadata.init()();
}

uint64_t sub_10075B700()
{
  return type metadata accessor for ItemLayoutContext.Metadata();
}

uint64_t sub_10075B710()
{
  return ItemLayoutContext.indexPath.getter();
}

uint64_t sub_10075B720()
{
  return type metadata accessor for ItemLayoutContext();
}

uint64_t sub_10075B730()
{
  return dispatch thunk of LargeHeroBreakout.clickAction.getter();
}

uint64_t sub_10075B740()
{
  return LargeHeroBreakout.backgroundColor.getter();
}

uint64_t sub_10075B750()
{
  return LargeHeroBreakout.detailsDisplayProperties.getter();
}

uint64_t sub_10075B760()
{
  return LargeHeroBreakout.video.getter();
}

uint64_t sub_10075B770()
{
  return LargeHeroBreakout.artwork.getter();
}

uint64_t sub_10075B780()
{
  return LargeHeroBreakout.details.getter();
}

uint64_t sub_10075B790()
{
  return LargeHeroBreakout.heading.getter();
}

uint64_t sub_10075B7A0()
{
  return type metadata accessor for LargeHeroBreakout();
}

uint64_t sub_10075B7B0()
{
  return LargeLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075B7C0()
{
  return LargeLockupLayout.Metrics.init(headingSpace:titleSpace:titleWithHeadingSpace:subtitleSpace:tertiaryTitleSpace:bottomSpace:isTextHorizontallyCentered:)();
}

uint64_t sub_10075B7D0()
{
  return type metadata accessor for LargeLockupLayout.Metrics();
}

uint64_t sub_10075B7E0()
{
  return LargeLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:)();
}

uint64_t sub_10075B7F0()
{
  return type metadata accessor for LargeLockupLayout();
}

uint64_t sub_10075B800()
{
  return LockupMediaLayout.DisplayType.numberOfViews.getter();
}

uint64_t sub_10075B810()
{
  return type metadata accessor for LockupMediaLayout.DisplayType();
}

uint64_t sub_10075B820()
{
  return LockupMediaLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075B830()
{
  return LockupMediaLayout.Metrics.displayType.getter();
}

uint64_t sub_10075B840()
{
  return LockupMediaLayout.Metrics.displayType.setter();
}

uint64_t sub_10075B850()
{
  return LockupMediaLayout.Metrics.init(interItemSpacing:displayType:mediaAspectRatio:boundingAspectRatio:)();
}

uint64_t sub_10075B860()
{
  return LockupMediaLayout.Metrics.boundingAspectRatio.getter();
}

uint64_t sub_10075B870()
{
  return type metadata accessor for LockupMediaLayout.Metrics();
}

uint64_t sub_10075B880()
{
  return LockupMediaLayout.init(metrics:mediaViews:)();
}

uint64_t sub_10075B890()
{
  return static LockupMediaLayout.mediaSize(using:fitting:with:)();
}

uint64_t sub_10075B8A0()
{
  return type metadata accessor for LockupMediaLayout();
}

uint64_t sub_10075B8B0()
{
  return type metadata accessor for MediaMetricsEvent.ActionType();
}

uint64_t sub_10075B8C0()
{
  return type metadata accessor for MediaMetricsEvent.ActionContext();
}

uint64_t sub_10075B8D0()
{
  return type metadata accessor for MediaMetricsEvent.ActionDetails();
}

uint64_t sub_10075B8E0()
{
  return static MediaMetricsEvent.fillIn(template:actionType:actionDetails:actionContext:url:duration:position:)();
}

uint64_t sub_10075B8F0()
{
  return MediaOverlayStyle.userInterfaceStyle.getter();
}

uint64_t sub_10075B900()
{
  return MediaOverlayStyle.inverseUserInterfaceStyle.getter();
}

uint64_t sub_10075B910()
{
  return type metadata accessor for MediaOverlayStyle();
}

uint64_t sub_10075B920()
{
  return PageRefreshPolicy.shouldSendEventsForPageExit.getter();
}

uint64_t sub_10075B930()
{
  return PageRefreshPolicy.updateDelayInterval.getter();
}

uint64_t sub_10075B940()
{
  return PendingPageRender.isLayoutPending.setter();
}

uint64_t sub_10075B950()
{
  return PendingPageRender.appearTime.setter();
}

uint64_t sub_10075B960()
{
  return PendingPageRender.disappearTime.setter();
}

uint64_t sub_10075B970()
{
  return PendingPageRender.observeAssets(_:)();
}

uint64_t sub_10075B980()
{
  return PendingPageRender.DisappearTimeAndReason.init(reason:timeInterval:)();
}

uint64_t sub_10075B990()
{
  return type metadata accessor for PendingPageRender.DisappearTimeAndReason();
}

uint64_t sub_10075B9A0()
{
  return PrivacyDefinition.definition.getter();
}

uint64_t sub_10075B9B0()
{
  return PrivacyDefinition.title.getter();
}

uint64_t sub_10075B9C0()
{
  return type metadata accessor for PrivacyDefinition();
}

uint64_t sub_10075B9D0()
{
  return PrivacyTypeLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075B9E0()
{
  return PrivacyTypeLayout.Metrics.iconBaseline.setter();
}

uint64_t sub_10075B9F0()
{
  return PrivacyTypeLayout.Metrics.iconTopSpace.setter();
}

uint64_t sub_10075BA00()
{
  return PrivacyTypeLayout.Metrics.titleTopSpace.setter();
}

uint64_t sub_10075BA10()
{
  return PrivacyTypeLayout.Metrics.detailTopSpace.setter();
}

uint64_t sub_10075BA20()
{
  return type metadata accessor for PrivacyTypeLayout.Metrics.HorizontalAlignment();
}

uint64_t sub_10075BA30()
{
  return PrivacyTypeLayout.Metrics.compactBottomMargin.setter();
}

uint64_t sub_10075BA40()
{
  return PrivacyTypeLayout.Metrics.init(horizontalAlignment:iconTopSpace:iconSize:iconBaseline:titleTopSpace:detailTopSpace:maxTextWidth:minimumCategoriesColumnWidth:categoriesTopSpace:categoriesHorizontalPadding:categoriesBottomSpace:horizontalMargin:compactBottomMargin:regularBottomMargin:)();
}

uint64_t sub_10075BA50()
{
  return PrivacyTypeLayout.Metrics.horizontalAlignment.setter();
}

uint64_t sub_10075BA60()
{
  return PrivacyTypeLayout.Metrics.regularBottomMargin.setter();
}

uint64_t sub_10075BA70()
{
  return PrivacyTypeLayout.Metrics.iconSize.getter();
}

uint64_t sub_10075BA80()
{
  return PrivacyTypeLayout.Metrics.iconSize.setter();
}

uint64_t sub_10075BA90()
{
  return type metadata accessor for PrivacyTypeLayout.Metrics();
}

uint64_t sub_10075BAA0()
{
  return PrivacyTypeLayout.init(metrics:shadowView:backgroundView:separatorView:iconView:titleLabel:detailLabel:categoryViews:style:)();
}

uint64_t sub_10075BAB0()
{
  return type metadata accessor for PrivacyTypeLayout();
}

uint64_t sub_10075BAC0()
{
  return ProductCapability.artworkTintColor.getter();
}

uint64_t sub_10075BAD0()
{
  return ProductCapability.captionTrailingArtwork.getter();
}

uint64_t sub_10075BAE0()
{
  return ProductCapability.title.getter();
}

uint64_t sub_10075BAF0()
{
  return ProductCapability.artwork.getter();
}

uint64_t sub_10075BB00()
{
  return ProductCapability.caption.getter();
}

uint64_t sub_10075BB10()
{
  return type metadata accessor for ProductCapability();
}

uint64_t sub_10075BB20()
{
  return RateLimitedAction.primaryAction.getter();
}

uint64_t sub_10075BB30()
{
  return RateLimitedAction.fallbackAction.getter();
}

uint64_t sub_10075BB40()
{
  return static RateLimitedAction.preferencesKey.getter();
}

uint64_t sub_10075BB50()
{
  return RateLimitedAction.actionKey.getter();
}

uint64_t sub_10075BB60()
{
  return RateLimitedAction.rateLimit.getter();
}

uint64_t sub_10075BB70()
{
  return type metadata accessor for RateLimitedAction();
}

uint64_t sub_10075BB80()
{
  return type metadata accessor for RoundedButtonType();
}

uint64_t sub_10075BB90()
{
  return dispatch thunk of RoundedCornerView.setCorner(radius:style:)();
}

uint64_t sub_10075BBA0()
{
  return dispatch thunk of RoundedCornerView.applyCorner(radius:style:)();
}

uint64_t sub_10075BBB0()
{
  return dispatch thunk of RoundedCornerView.borderView.getter();
}

uint64_t sub_10075BBC0()
{
  return dispatch thunk of RoundedCornerView.borderColor.setter();
}

uint64_t sub_10075BBD0()
{
  return dispatch thunk of RoundedCornerView.borderWidth.setter();
}

uint64_t sub_10075BBE0()
{
  return dispatch thunk of RoundedCornerView.cornerStyle.getter();
}

uint64_t sub_10075BBF0()
{
  return dispatch thunk of RoundedCornerView.cornerRadius.getter();
}

uint64_t sub_10075BC00()
{
  return dispatch thunk of RoundedCornerView.updateBorder()();
}

uint64_t sub_10075BC10()
{
  return dispatch thunk of RoundedCornerView.roundedCorners.setter();
}

uint64_t sub_10075BC20()
{
  return RoundedCornerView.__allocating_init(radius:style:)();
}

uint64_t sub_10075BC30()
{
  return type metadata accessor for RoundedCornerView();
}

uint64_t sub_10075BC40()
{
  return method lookup function for RoundedCornerView();
}

uint64_t sub_10075BC50()
{
  return dispatch thunk of SearchAdProviding.searchAd.getter();
}

uint64_t sub_10075BC60()
{
  return SearchAdProviding.isSearchAd.getter();
}

uint64_t sub_10075BC70()
{
  return SearchHistoryItem.debugDescription.getter();
}

uint64_t sub_10075BC80()
{
  return type metadata accessor for SearchHistoryItem();
}

uint64_t sub_10075BC90()
{
  return static SmallLockupLayout.estimatedMeasurements(fitting:using:with:)();
}

uint64_t sub_10075BCA0()
{
  return SmallLockupLayout.Metrics.init(artworkSize:artworkMargin:ordinalSpaceProvider:headingSpace:titleRegularSpace:titleMediumSpace:titleShortSpace:titleWithHeadingSpace:subtitleSpace:subtitleExtraTallSpace:tertiaryTitleSpace:offerTextSpace:bottomSpace:offerButtonSize:offerButtonMargin:numberOfLines:)();
}

uint64_t sub_10075BCB0()
{
  return SmallLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_10075BCC0()
{
  return SmallLockupLayout.Metrics.artworkSize.setter();
}

uint64_t sub_10075BCD0()
{
  return SmallLockupLayout.Metrics.bottomSpace.setter();
}

uint64_t sub_10075BCE0()
{
  return SmallLockupLayout.Metrics.headingSpace.setter();
}

uint64_t sub_10075BCF0()
{
  return SmallLockupLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_10075BD00()
{
  return SmallLockupLayout.Metrics.artworkMargin.setter();
}

uint64_t sub_10075BD10()
{
  return SmallLockupLayout.Metrics.numberOfLines.getter();
}

uint64_t sub_10075BD20()
{
  return SmallLockupLayout.Metrics.numberOfLines.setter();
}

uint64_t sub_10075BD30()
{
  return SmallLockupLayout.Metrics.subtitleSpace.setter();
}

uint64_t sub_10075BD40()
{
  return SmallLockupLayout.Metrics.offerTextSpace.setter();
}

uint64_t sub_10075BD50()
{
  return SmallLockupLayout.Metrics.offerButtonSize.getter();
}

uint64_t sub_10075BD60()
{
  return SmallLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_10075BD70()
{
  return SmallLockupLayout.Metrics.titleShortSpace.setter();
}

uint64_t sub_10075BD80()
{
  return SmallLockupLayout.Metrics.titleMediumSpace.setter();
}

uint64_t sub_10075BD90()
{
  return SmallLockupLayout.Metrics.offerButtonMargin.getter();
}

uint64_t sub_10075BDA0()
{
  return SmallLockupLayout.Metrics.titleRegularSpace.getter();
}

uint64_t sub_10075BDB0()
{
  return SmallLockupLayout.Metrics.titleRegularSpace.setter();
}

uint64_t sub_10075BDC0()
{
  return SmallLockupLayout.Metrics.tertiaryTitleSpace.setter();
}

uint64_t sub_10075BDD0()
{
  return SmallLockupLayout.Metrics.titleWithHeadingSpace.setter();
}

uint64_t sub_10075BDE0()
{
  return type metadata accessor for SmallLockupLayout.Metrics();
}

uint64_t sub_10075BDF0()
{
  return SmallLockupLayout.init(metrics:artworkView:ordinalText:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:)();
}

uint64_t sub_10075BE00()
{
  return type metadata accessor for SmallLockupLayout();
}

uint64_t sub_10075BE10()
{
  return static TextConfiguration.maxSubtitleWidth(with:)();
}

uint64_t sub_10075BE20()
{
  return static TextConfiguration.subtitleHorizontalSpacing.getter();
}

uint64_t sub_10075BE30()
{
  return TextConfiguration.init(metrics:symbolName:subtitleText:subtitlePosition:theme:)();
}

uint64_t sub_10075BE40()
{
  return TextConfiguration.init(metrics:text:subtitleText:subtitlePosition:theme:)();
}

uint64_t sub_10075BE50()
{
  return type metadata accessor for TextConfiguration();
}

uint64_t sub_10075BE60()
{
  return TitleEffectUpdate.isAnimated.getter();
}

uint64_t sub_10075BE70()
{
  return TitleEffectUpdate.timingFunction.getter();
}

uint64_t sub_10075BE80()
{
  return TitleEffectUpdate.animationDuration.getter();
}

uint64_t sub_10075BE90()
{
  return TitleEffectUpdate.init(effect:isAnimated:animationDuration:timingFunction:)();
}

uint64_t sub_10075BEA0()
{
  return TitleEffectUpdate.effect.getter();
}

uint64_t sub_10075BEB0()
{
  return type metadata accessor for TitleEffectUpdate();
}

uint64_t sub_10075BEC0()
{
  return TitleHeaderLayout.init(accessoryView:accessoryMargin:accessoryVerticalAlignment:accessoryHorizontalAlignment:children:childrenHorizontalAlignment:allowsAccessibilityLayouts:)();
}

uint64_t sub_10075BED0()
{
  return TitleHeaderLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075BEE0()
{
  return static TitleHeaderLayout.AccessoryVerticalAlignment.== infix(_:_:)();
}

uint64_t sub_10075BEF0()
{
  return type metadata accessor for TitleHeaderLayout.AccessoryVerticalAlignment();
}

uint64_t sub_10075BF00()
{
  return type metadata accessor for TitleHeaderLayout.ChildrenHorizontalAlignment();
}

uint64_t sub_10075BF10()
{
  return type metadata accessor for TitleHeaderLayout.AccessoryHorizontalAlignment();
}

uint64_t sub_10075BF20()
{
  return TitleHeaderLayout.Child.init(decorationView:contentView:decorationViewMargin:firstLineSpace:bottomSpace:trailingView:shortTrailingView:trailingViewMargin:trailingFirstLineSpace:trailingBottomSpace:)();
}

uint64_t sub_10075BF30()
{
  return type metadata accessor for TitleHeaderLayout.Child();
}

uint64_t sub_10075BF40()
{
  return type metadata accessor for TitleHeaderLayout();
}

uint64_t sub_10075BF50()
{
  return TitledButtonStack.compactLineBreaks.getter();
}

uint64_t sub_10075BF60()
{
  return TitledButtonStack.regularLineBreaks.getter();
}

uint64_t sub_10075BF70()
{
  return TitledButtonStack.buttons.getter();
}

uint64_t sub_10075BF80()
{
  return type metadata accessor for TitledButtonStack();
}

uint64_t sub_10075BF90()
{
  return static VersionStringUtil.isShortVersionString(_:atLeast:)();
}

uint64_t sub_10075BFA0()
{
  return dispatch thunk of VideoViewDelegate.playbackWillEnd(in:videoView:)();
}

uint64_t sub_10075BFB0()
{
  return dispatch thunk of VideoViewDelegate.userInitiatedPlay(for:)();
}

uint64_t sub_10075BFC0()
{
  return dispatch thunk of VideoViewDelegate.videoDidPlayToEnd(isLooping:videoView:)();
}

uint64_t sub_10075BFD0()
{
  return dispatch thunk of VideoViewDelegate.userInitiatedPause(for:)();
}

uint64_t sub_10075BFE0()
{
  return dispatch thunk of VideoViewDelegate.videoDidChangeState(to:for:)();
}

uint64_t sub_10075BFF0()
{
  return WriteReviewAction.itemDescription.getter();
}

uint64_t sub_10075C000()
{
  return WriteReviewAction.adamId.getter();
}

uint64_t sub_10075C010()
{
  return WriteReviewAction.appIcon.getter();
}

uint64_t sub_10075C020()
{
  return WriteReviewAction.appName.getter();
}

uint64_t sub_10075C030()
{
  return type metadata accessor for WriteReviewAction();
}

uint64_t sub_10075C040(NSNumber a1)
{
  return localizedFileSize(_:)(a1).value._countAndFlagsBits;
}

uint64_t sub_10075C050()
{
  return type metadata accessor for AccountSectionLink.LinkDisplayType();
}

uint64_t sub_10075C060()
{
  return AccountSectionLink.displayType.getter();
}

uint64_t sub_10075C070()
{
  return AccountSectionLink.title.getter();
}

uint64_t sub_10075C080()
{
  return type metadata accessor for AccountSectionLink();
}

uint64_t sub_10075C090()
{
  return AccountSectionText.paragraph.getter();
}

uint64_t sub_10075C0A0()
{
  return AchievementSummary.achievements.getter();
}

uint64_t sub_10075C0B0()
{
  return AchievementSummary.completedText.getter();
}

uint64_t sub_10075C0C0()
{
  return AchievementSummary.totalAchievements.getter();
}

uint64_t sub_10075C0D0()
{
  return AchievementSummary.completedAchievements.getter();
}

uint64_t sub_10075C0E0()
{
  return type metadata accessor for AchievementSummary();
}

uint64_t sub_10075C0F0()
{
  return dispatch thunk of ArcadeFooterLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075C100()
{
  return type metadata accessor for ArcadeFooterLayout.ButtonLocation();
}

uint64_t sub_10075C110()
{
  return ArcadeFooterLayout.Metrics.layoutMargins.getter();
}

uint64_t sub_10075C120()
{
  return ArcadeFooterLayout.Metrics.layoutMargins.setter();
}

uint64_t sub_10075C130()
{
  return ArcadeFooterLayout.Metrics.buttonMinWidth.setter();
}

uint64_t sub_10075C140()
{
  return ArcadeFooterLayout.Metrics.footnoteSpaceMultiplier.setter();
}

uint64_t sub_10075C150()
{
  return ArcadeFooterLayout.Metrics.init(iconSize:iconSpacing:iconRowCount:firstIconHorizontalOffset:wordmarkTopMargin:wordmarkHeight:buttonLocation:buttonTopMargin:buttonBottomMargin:buttonViewTopSpace:buttonViewBottomSpace:buttonMinWidth:buttonPreferredEdgeInsets:footnoteTopSpace:footnoteBottomSpace:footnoteSpaceMultiplier:layoutMargins:)();
}

uint64_t sub_10075C160()
{
  return ArcadeFooterLayout.Metrics.iconSize.setter();
}

uint64_t sub_10075C170()
{
  return type metadata accessor for ArcadeFooterLayout.Metrics();
}

uint64_t sub_10075C180()
{
  return ArcadeFooterLayout.init(metrics:riverView:wordmarkView:buttonView:footnoteView:)();
}

uint64_t sub_10075C190()
{
  return type metadata accessor for ArcadeFooterLayout();
}

uint64_t sub_10075C1A0()
{
  return ArcadeLockupLayout.init(wordmarkView:subtitleText:offerButton:metrics:)();
}

uint64_t sub_10075C1B0()
{
  return ArcadeLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075C1C0()
{
  return ArcadeLockupLayout.Metrics.init(minimumHeight:offerButtonMargin:wordmarkMargin:wordmarkTopSpace:wordmarkSpace:subtitleLeadingSpace:bottomSpace:numberOfLinesForSubtitle:)();
}

uint64_t sub_10075C1D0()
{
  return ArcadeLockupLayout.Metrics.wordmarkSpace.getter();
}

uint64_t sub_10075C1E0()
{
  return type metadata accessor for ArcadeLockupLayout.Metrics();
}

uint64_t sub_10075C1F0()
{
  return type metadata accessor for ArcadeLockupLayout();
}

uint64_t sub_10075C200()
{
  return dispatch thunk of ArtworkIconFetcher.fetchArtworkIcons(for:partialCompletion:completion:handlerKey:)();
}

uint64_t sub_10075C210()
{
  return ArtworkIconFetcher.init(objectGraph:)();
}

uint64_t sub_10075C220()
{
  return dispatch thunk of ArtworkIconFetcher.forgetFetches(for:)();
}

uint64_t sub_10075C230()
{
  return type metadata accessor for ArtworkIconFetcher();
}

uint64_t sub_10075C240()
{
  return dispatch thunk of BaseShelfPresenter.doesShelfExist(for:)();
}

uint64_t sub_10075C250()
{
  return dispatch thunk of BaseShelfPresenter.contentType(for:)();
}

uint64_t sub_10075C260()
{
  return dispatch thunk of BaseShelfPresenter.numberOfRows(for:)();
}

uint64_t sub_10075C270()
{
  return dispatch thunk of BaseShelfPresenter.sectionCount.getter();
}

uint64_t sub_10075C280()
{
  return dispatch thunk of BaseShelfPresenter.titleArtwork(for:)();
}

uint64_t sub_10075C290()
{
  return dispatch thunk of BaseShelfPresenter.eyebrowArtwork(for:)();
}

uint64_t sub_10075C2A0()
{
  return dispatch thunk of BaseShelfPresenter.model(at:)();
}

uint64_t sub_10075C2B0()
{
  return dispatch thunk of BaseShelfPresenter.title(for:)();
}

uint64_t sub_10075C2C0()
{
  return dispatch thunk of BaseShelfPresenter.eyebrow(for:)();
}

uint64_t sub_10075C2D0()
{
  return BundleSearchResult.lockup.getter();
}

uint64_t sub_10075C2E0()
{
  return type metadata accessor for BundleSearchResult();
}

uint64_t sub_10075C2F0()
{
  return dispatch thunk of ClearablePresenter.clearContent(shouldSendEventsForPageExit:)();
}

uint64_t sub_10075C300()
{
  return ComponentSeparator.frame(forBoundingRect:in:)();
}

uint64_t sub_10075C310()
{
  return ComponentSeparator.height(in:)();
}

uint64_t sub_10075C320()
{
  return ComponentSeparator.Position.rawValue.getter();
}

uint64_t sub_10075C330()
{
  return type metadata accessor for ComponentSeparator.Position();
}

uint64_t sub_10075C340()
{
  return ComponentSeparator.init(position:leadingInset:trailingInset:)();
}

uint64_t sub_10075C350()
{
  return ComponentSeparator.position.getter();
}

uint64_t sub_10075C360()
{
  return static ComponentSeparator.thickness(compatibleWith:)();
}

uint64_t sub_10075C370()
{
  return type metadata accessor for ComponentSeparator();
}

uint64_t sub_10075C380()
{
  return dispatch thunk of EditorialStoryCard.clickAction.getter();
}

uint64_t sub_10075C390()
{
  return EditorialStoryCard.description.getter();
}

uint64_t sub_10075C3A0()
{
  return dispatch thunk of EditorialStoryCard.shelfBackground.getter();
}

uint64_t sub_10075C3B0()
{
  return EditorialStoryCard.title.getter();
}

uint64_t sub_10075C3C0()
{
  return EditorialStoryCard.heading.getter();
}

uint64_t sub_10075C3D0()
{
  return EmptyConfiguration.init()();
}

uint64_t sub_10075C3E0()
{
  return type metadata accessor for EmptyConfiguration();
}

uint64_t sub_10075C3F0()
{
  return FamilyCircleAction.clientName.getter();
}

uint64_t sub_10075C400()
{
  return FamilyCircleAction.additionalParameters.getter();
}

uint64_t sub_10075C410()
{
  return type metadata accessor for FamilyCircleAction.EventType();
}

uint64_t sub_10075C420()
{
  return FamilyCircleAction.eventType.getter();
}

uint64_t sub_10075C430()
{
  return type metadata accessor for FamilyCircleAction();
}

uint64_t sub_10075C440()
{
  return FlowcaseItemLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075C450()
{
  return FlowcaseItemLayout.Metrics.init(captionSpace:titleSpace:subtitleSpace:textArtworkMargin:artworkAspectRatio:bottomSpace:textLayoutMargins:)();
}

uint64_t sub_10075C460()
{
  return FlowcaseItemLayout.Metrics.captionSpace.getter();
}

uint64_t sub_10075C470()
{
  return FlowcaseItemLayout.Metrics.artworkAspectRatio.getter();
}

uint64_t sub_10075C480()
{
  return type metadata accessor for FlowcaseItemLayout.Metrics();
}

uint64_t sub_10075C490()
{
  return FlowcaseItemLayout.init(metrics:artworkView:captionView:titleText:subtitleText:)();
}

uint64_t sub_10075C4A0()
{
  return type metadata accessor for FlowcaseItemLayout();
}

uint64_t sub_10075C4B0()
{
  return GenericAccountPage.title.getter();
}

uint64_t sub_10075C4C0()
{
  return dispatch thunk of HttpTemplateAction.makeAction(with:body:actionMetrics:)();
}

uint64_t sub_10075C4D0()
{
  return HttpTemplateAction.failureAction.getter();
}

uint64_t sub_10075C4E0()
{
  return HttpTemplateAction.parameters.getter();
}

uint64_t sub_10075C4F0()
{
  return HttpTemplateAction.dictionaryBody.getter();
}

uint64_t sub_10075C500()
{
  return HttpTemplateAction.message.getter();
}

uint64_t sub_10075C510()
{
  return type metadata accessor for ImageAlignedButton.ImageAlignment();
}

uint64_t sub_10075C520()
{
  return dispatch thunk of ImageAlignedButton.imageAlignment.setter();
}

uint64_t sub_10075C530()
{
  return dispatch thunk of ImageAlignedButton.touchOutsideMargin.setter();
}

uint64_t sub_10075C540()
{
  return dispatch thunk of ImageAlignedButton.primaryActionHandler.setter();
}

uint64_t sub_10075C550()
{
  return dispatch thunk of ImageAlignedButton.imageWantsBaselineAlignment.setter();
}

uint64_t sub_10075C560()
{
  return dispatch thunk of JSIntentDispatcher.dispatch<A>(intent:with:fileID:)();
}

uint64_t sub_10075C570()
{
  return type metadata accessor for JSIntentDispatcher();
}

uint64_t sub_10075C580()
{
  return LayoutMarginsAware<>.layoutFrame.getter();
}

uint64_t sub_10075C590()
{
  return MediumLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075C5A0()
{
  return MediumLockupLayout.Metrics.init(artworkSize:artworkMargin:headingSpace:titleSpace:titleWithHeadingRegularSpace:titleWithHeadingShortSpace:subtitleRegularSpace:subtitleShortSpace:tertiaryTitleRegularSpace:tertiaryTitleShortSpace:offerTextRegularSpace:offerTextShortSpace:offerButtonTopMargin:offerButtonBottomMargin:offerButtonSize:)();
}

uint64_t sub_10075C5B0()
{
  return MediumLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_10075C5C0()
{
  return MediumLockupLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_10075C5D0()
{
  return MediumLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_10075C5E0()
{
  return type metadata accessor for MediumLockupLayout.Metrics();
}

uint64_t sub_10075C5F0()
{
  return MediumLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:)();
}

uint64_t sub_10075C600()
{
  return type metadata accessor for MediumLockupLayout();
}

uint64_t sub_10075C610()
{
  return MetadataRibbonItem.starRating.getter();
}

uint64_t sub_10075C620()
{
  return MetadataRibbonItem.borderedText.getter();
}

uint64_t sub_10075C630()
{
  return MetadataRibbonItem.useAdsLocale.getter();
}

uint64_t sub_10075C640()
{
  return MetadataRibbonItem.highlightedText.getter();
}

uint64_t sub_10075C650()
{
  return dispatch thunk of MetadataRibbonItem.allowsTruncation.getter();
}

uint64_t sub_10075C660()
{
  return dispatch thunk of MetadataRibbonItem.impressionMetrics.getter();
}

uint64_t sub_10075C670()
{
  return dispatch thunk of MetadataRibbonItem.maxCharacterCount.getter();
}

uint64_t sub_10075C680()
{
  return MetadataRibbonItem.viewContainerType.getter();
}

uint64_t sub_10075C690()
{
  return MetadataRibbonItem.borderTextViewPlacement.getter();
}

uint64_t sub_10075C6A0()
{
  return MetadataRibbonItem.id.getter();
}

uint64_t sub_10075C6B0()
{
  return dispatch thunk of MetadataRibbonItem.truncationLegibilityCharacterCountThreshold.getter();
}

uint64_t sub_10075C6C0()
{
  return MetadataRibbonItem.artwork.getter();
}

uint64_t sub_10075C6D0()
{
  return MetadataRibbonItem.itemType.getter();
}

uint64_t sub_10075C6E0()
{
  return MetadataRibbonItem.labelText.getter();
}

uint64_t sub_10075C6F0()
{
  return type metadata accessor for MetadataRibbonItem();
}

uint64_t sub_10075C700()
{
  return OfferButtonMetrics.inAppPurchaseTextSpace.getter();
}

uint64_t sub_10075C710()
{
  return OfferButtonMetrics.init(fontSource:subtitleFontSource:inAppPurchaseTextSpace:contentInsets:redownloadImage:stopImage:symbolConfiguration:redownloadImageSymbolConfiguration:minimumSize:progressDiameter:lineWidth:textShapeLineWidth:expandsToFit:cornerRadius:includeTopPadding:)();
}

uint64_t sub_10075C720()
{
  return OfferButtonMetrics.fontSource.setter();
}

uint64_t sub_10075C730()
{
  return OfferButtonMetrics.minimumSize.getter();
}

uint64_t sub_10075C740()
{
  return OfferButtonMetrics.minimumSize.setter();
}

uint64_t sub_10075C750()
{
  return OfferButtonMetrics.estimatedSize(for:subtitlePosition:in:)();
}

uint64_t sub_10075C760()
{
  return OfferButtonMetrics.estimatedHeight.getter();
}

uint64_t sub_10075C770()
{
  return type metadata accessor for OfferButtonMetrics();
}

uint64_t sub_10075C780()
{
  return static OfferButtonStyling.maxNumberOfLinesForSubtitle.getter();
}

uint64_t sub_10075C790()
{
  return static PosterLockupLayout.aspectRatio.getter();
}

uint64_t sub_10075C7A0()
{
  return PosterLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075C7B0()
{
  return static PosterLockupLayout.maximiumLogoArtworkSize(metrics:containerSize:)();
}

uint64_t sub_10075C7C0()
{
  return PosterLockupLayout.Metrics.init(headingTopSpace:logoMargin:titleTopSpace:offerButtonTopSpace:footerTopSpace:footerBottomSpace:)();
}

uint64_t sub_10075C7D0()
{
  return type metadata accessor for PosterLockupLayout.Metrics();
}

uint64_t sub_10075C7E0()
{
  return PosterLockupLayout.init(metrics:gradient:poster:header:logoArt:fallbackTitle:offerButton:footer:)();
}

uint64_t sub_10075C7F0()
{
  return type metadata accessor for PosterLockupLayout();
}

uint64_t sub_10075C800()
{
  return PreorderDisclaimer.disclaimer.getter();
}

uint64_t sub_10075C810()
{
  return type metadata accessor for PreorderDisclaimer();
}

uint64_t sub_10075C820()
{
  return ProductDescription.developerAction.getter();
}

uint64_t sub_10075C830()
{
  return ProductDescription.paragraph.getter();
}

uint64_t sub_10075C840()
{
  return type metadata accessor for ProductDescription();
}

uint64_t sub_10075C850()
{
  return PurchasesPresenter.init(objectGraph:bag:)();
}

uint64_t sub_10075C860()
{
  return dispatch thunk of PurchasesPresenter.view.setter();
}

uint64_t sub_10075C870()
{
  return type metadata accessor for PurchasesPresenter();
}

uint64_t sub_10075C880()
{
  return dispatch thunk of SearchAdDisplaying.apply(searchAd:asPartOf:)();
}

uint64_t sub_10075C890()
{
  return SearchMetricsEvent.init(eventFields:)();
}

uint64_t sub_10075C8A0()
{
  return type metadata accessor for SearchMetricsEvent();
}

uint64_t sub_10075C8B0()
{
  return SearchTextSnapshot.init(prefixText:prefixIsProvisional:expansionText:)();
}

uint64_t sub_10075C8C0()
{
  return type metadata accessor for SearchTextSnapshot();
}

uint64_t sub_10075C8D0()
{
  return dispatch thunk of ShelfComponentView.itemLayoutContext.getter();
}

uint64_t sub_10075C8E0()
{
  return dispatch thunk of ShelfComponentView.itemLayoutContext.setter();
}

uint64_t sub_10075C8F0()
{
  return dispatch thunk of ShelfComponentView.applyData(from:asPartOf:)();
}

uint64_t sub_10075C900()
{
  return ShelfLayoutContext.itemLayoutContext(for:at:metadata:)();
}

uint64_t sub_10075C910()
{
  return ShelfLayoutContext.stateStore.getter();
}

uint64_t sub_10075C920()
{
  return ShelfLayoutContext.isFirstShelf.getter();
}

uint64_t sub_10075C930()
{
  return ShelfLayoutContext.contentPageGrid.getter();
}

uint64_t sub_10075C940()
{
  return ShelfLayoutContext.traitCollection.getter();
}

uint64_t sub_10075C950()
{
  return ShelfLayoutContext.traitEnvironment.getter();
}

uint64_t sub_10075C960()
{
  return ShelfLayoutContext.surroundingShelves.getter();
}

uint64_t sub_10075C970()
{
  return ShelfLayoutContext.supplementaryPageGrid.getter();
}

uint64_t sub_10075C980()
{
  return ShelfLayoutContext.shelfPresentationHints.getter();
}

uint64_t sub_10075C990()
{
  return ShelfLayoutContext.id.getter();
}

uint64_t sub_10075C9A0()
{
  return ShelfLayoutContext.index.getter();
}

uint64_t sub_10075C9B0()
{
  return ShelfLayoutContext.shelf.getter();
}

uint64_t sub_10075C9C0()
{
  return type metadata accessor for ShelfLayoutContext();
}

uint64_t sub_10075C9D0()
{
  return TodayCardMediaGrid.artworkGridType.getter();
}

uint64_t sub_10075C9E0()
{
  return TodayCardMediaGrid.lockups.getter();
}

uint64_t sub_10075C9F0()
{
  return type metadata accessor for TodayCardMediaGrid();
}

uint64_t sub_10075CA00()
{
  return TodayCardMediaList.isMediaDark.getter();
}

uint64_t sub_10075CA10()
{
  return TodayCardMediaList.hasMedia.getter();
}

uint64_t sub_10075CA20()
{
  return TodayCardMediaList.marketingText.getter();
}

uint64_t sub_10075CA30()
{
  return TodayCardMediaList.artworkLayoutsWithMetrics.getter();
}

uint64_t sub_10075CA40()
{
  return TodayCardMediaList.lockups.getter();
}

uint64_t sub_10075CA50()
{
  return type metadata accessor for TodayCardMediaList();
}

uint64_t sub_10075CA60()
{
  return dispatch thunk of UpdatablePresenter.update(ignoringCache:)();
}

uint64_t sub_10075CA70()
{
  return dispatch thunk of UpdatablePresenter.didLoad()();
}

uint64_t sub_10075CA80()
{
  return static VideoConfiguration.defaultConfiguration.getter();
}

uint64_t sub_10075CA90()
{
  return VideoConfiguration.aspectRatio.getter();
}

uint64_t sub_10075CAA0()
{
  return VideoConfiguration.allowsAutoPlay.getter();
}

uint64_t sub_10075CAB0()
{
  return VideoConfiguration.roundedCorners.getter();
}

uint64_t sub_10075CAC0()
{
  return VideoConfiguration.playbackControls.getter();
}

uint64_t sub_10075CAD0()
{
  return VideoConfiguration.canPlayFullScreen.getter();
}

uint64_t sub_10075CAE0()
{
  return VideoConfiguration.canPlayFullScreen.setter();
}

uint64_t sub_10075CAF0()
{
  return VideoConfiguration.autoPlayPlaybackControls.getter();
}

uint64_t sub_10075CB00()
{
  return VideoConfiguration.deviceCornerRadiusFactor.getter();
}

uint64_t sub_10075CB10()
{
  return VideoConfiguration.looping.getter();
}

uint64_t sub_10075CB20()
{
  return VideoConfiguration.init(fillMode:aspectRatio:playbackControls:autoPlayPlaybackControls:canPlayFullScreen:allowsAutoPlay:looping:roundedCorners:deviceCornerRadiusFactor:)();
}

uint64_t sub_10075CB30()
{
  return VideoConfiguration.fillMode.getter();
}

uint64_t sub_10075CB40()
{
  return type metadata accessor for VideoConfiguration();
}

uint64_t sub_10075CB50()
{
  return dispatch thunk of VideoViewContainer.currentlyOwns(videoView:)();
}

uint64_t sub_10075CB60()
{
  return VideoViewProviding.someVideoView.modify();
}

uint64_t sub_10075CB90()
{
  return makeNetworkInquiry()();
}

uint64_t sub_10075CBA0()
{
  return static ASKBootstrapFactory.make(bagProfile:appStateControllerFactory:targetType:)();
}

uint64_t sub_10075CBB0()
{
  return dispatch thunk of ActionPresenterView.perform(action:sender:)();
}

uint64_t sub_10075CBC0()
{
  return AdInteractionAction.adActionMetrics.getter();
}

uint64_t sub_10075CBD0()
{
  return dispatch thunk of AdRotationDisabling.disableAdvertRotation.getter();
}

uint64_t sub_10075CBE0()
{
  return dispatch thunk of AdRotationDisabling.disableAdvertRotation.setter();
}

uint64_t sub_10075CBF0()
{
  return type metadata accessor for AdvertActionMetrics.AdvertType();
}

uint64_t sub_10075CC00()
{
  return type metadata accessor for AdvertActionMetrics.ReportingDestination();
}

uint64_t sub_10075CC10()
{
  return type metadata accessor for AdvertActionMetrics();
}

uint64_t sub_10075CC20()
{
  return AdvertsSearchResult.displaysScreenshots.getter();
}

uint64_t sub_10075CC30()
{
  return AdvertsSearchResult.lockups.getter();
}

uint64_t sub_10075CC40()
{
  return type metadata accessor for AdvertsSearchResult();
}

uint64_t sub_10075CC50()
{
  return type metadata accessor for ArcadeSubscribePage.PageType();
}

uint64_t sub_10075CC60()
{
  return ArcadeSubscribePage.askToBuyMessage.getter();
}

uint64_t sub_10075CC70()
{
  return ArcadeSubscribePage.offerButtonAction.getter();
}

uint64_t sub_10075CC80()
{
  return ArcadeSubscribePage.dismissButtonTitle.getter();
}

uint64_t sub_10075CC90()
{
  return ArcadeSubscribePage.offerDisplayProperties.getter();
}

uint64_t sub_10075CCA0()
{
  return ArcadeSubscribePage.subscribedOfferButtonAction.getter();
}

uint64_t sub_10075CCB0()
{
  return ArcadeSubscribePage.details.getter();
}

uint64_t sub_10075CCC0()
{
  return ArcadeSubscribePage.pageType.getter();
}

uint64_t sub_10075CCD0()
{
  return type metadata accessor for ArcadeSubscribePage();
}

uint64_t sub_10075CCE0()
{
  return ArtworkItemProvider.init(artworkLoader:config:)();
}

uint64_t sub_10075CCF0()
{
  return type metadata accessor for ArtworkItemProvider();
}

uint64_t sub_10075CD00()
{
  return ArtworkLoaderConfig.size.getter();
}

uint64_t sub_10075CD10()
{
  return ArtworkLoaderConfig.scale.getter();
}

uint64_t sub_10075CD20()
{
  return ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)();
}

uint64_t sub_10075CD30()
{
  return ArtworkLoaderConfig.template.getter();
}

uint64_t sub_10075CD40()
{
  return type metadata accessor for ArtworkLoaderConfig();
}

uint64_t sub_10075CD50()
{
  return type metadata accessor for ComponentDecoration();
}

uint64_t sub_10075CD60()
{
  return dispatch thunk of DynamicTypeTextView.attributedTextShouldOverrideTextViewAttributes.setter();
}

uint64_t sub_10075CD70()
{
  return dispatch thunk of DynamicTypeTextView.fontUseCase.getter();
}

uint64_t sub_10075CD80()
{
  return dispatch thunk of DynamicTypeTextView.fontUseCase.setter();
}

uint64_t sub_10075CD90()
{
  return dispatch thunk of DynamicTypeTextView.lineBreakMode.getter();
}

uint64_t sub_10075CDA0()
{
  return dispatch thunk of DynamicTypeTextView.lineBreakMode.setter();
}

uint64_t sub_10075CDB0()
{
  return dispatch thunk of DynamicTypeTextView.numberOfLines.setter();
}

uint64_t sub_10075CDC0()
{
  return dispatch thunk of DynamicTypeTextView.hyphenationFactor.setter();
}

uint64_t sub_10075CDD0()
{
  return dispatch thunk of DynamicTypeTextView.contentSizeCategoryMapping.setter();
}

uint64_t sub_10075CDE0()
{
  return dispatch thunk of DynamicTypeTextView.traitCollectionForFontUseCases.getter();
}

uint64_t sub_10075CDF0()
{
  return type metadata accessor for DynamicTypeTextView();
}

uint64_t sub_10075CE00()
{
  return method lookup function for DynamicTypeTextView();
}

uint64_t sub_10075CE10()
{
  return EdgeInsetsDimension.init(top:left:bottom:right:source:)();
}

uint64_t sub_10075CE20()
{
  return EdgeInsetsDimension.value(in:rounded:)();
}

uint64_t sub_10075CE30()
{
  return type metadata accessor for EdgeInsetsDimension();
}

uint64_t sub_10075CE40()
{
  return JSFreshnessWatchdog.__allocating_init(bag:networkInquiry:)();
}

uint64_t sub_10075CE50()
{
  return type metadata accessor for JSFreshnessWatchdog();
}

uint64_t sub_10075CE60()
{
  return dispatch thunk of LanguageAwareString.attributedString.getter();
}

uint64_t sub_10075CE70()
{
  return static LanguageAwareString.keepStatisticsOnLanguageComponents.getter();
}

uint64_t sub_10075CE80()
{
  return static LanguageAwareString.alwaysGenerateAttributedString.getter();
}

uint64_t sub_10075CE90()
{
  return dispatch thunk of LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)();
}

uint64_t sub_10075CEA0()
{
  return dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.getter();
}

uint64_t sub_10075CEB0()
{
  return LanguageAwareString.string.getter();
}

uint64_t sub_10075CEC0()
{
  return dispatch thunk of LanguageAwareString.isEmpty.getter();
}

uint64_t sub_10075CED0()
{
  return type metadata accessor for LanguageAwareString();
}

uint64_t sub_10075CEE0()
{
  return LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_10075CEF0()
{
  return LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_10075CF00()
{
  return LocalAskToBuyAction.completion.getter();
}

uint64_t sub_10075CF10()
{
  return LocalAskToBuyAction.adamIdString.getter();
}

uint64_t sub_10075CF20()
{
  return OfferItemDetailPage.offerItem.getter();
}

uint64_t sub_10075CF30()
{
  return OfferItemDetailPage.additionalInfo.getter();
}

uint64_t sub_10075CF40()
{
  return OfferItemDetailPage.learnMoreTitle.getter();
}

uint64_t sub_10075CF50()
{
  return OfferItemDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_10075CF60()
{
  return OfferItemDetailPage.learnMoreActionMetrics.getter();
}

uint64_t sub_10075CF70()
{
  return OfferItemDetailPage.backButtonActionMetrics.getter();
}

uint64_t sub_10075CF80()
{
  return OfferItemDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_10075CF90()
{
  return OfferItemDetailPage.closeButtonActionMetrics.getter();
}

uint64_t sub_10075CFA0()
{
  return OfferItemDetailPage.video.getter();
}

uint64_t sub_10075CFB0()
{
  return OfferItemDetailPage.artwork.getter();
}

uint64_t sub_10075CFC0()
{
  return type metadata accessor for OfferItemDetailPage();
}

uint64_t sub_10075CFD0()
{
  return OfferLabelPresenter.init(offerDisplayProperties:adamId:appStateController:arePreordersCancellable:)();
}

uint64_t sub_10075CFE0()
{
  return OfferLabelPresenter.view.setter();
}

uint64_t sub_10075CFF0()
{
  return type metadata accessor for OfferLabelPresenter();
}

uint64_t sub_10075D000()
{
  return type metadata accessor for OpenableDestination();
}

uint64_t sub_10075D010()
{
  return PageFacetsPresenter.pageFacets.getter();
}

uint64_t sub_10075D020()
{
  return static PageFacetsPresenter.selectedFacetsTitle(for:)();
}

uint64_t sub_10075D030()
{
  return PageFacetsPresenter.onPerformPageFacetsChangeAction.getter();
}

uint64_t sub_10075D040()
{
  return PageFacetsPresenter.FacetsState.selectedFacetOptions.getter();
}

uint64_t sub_10075D050()
{
  return PageFacetsPresenter.FacetsState.facets.getter();
}

uint64_t sub_10075D060()
{
  return type metadata accessor for PageFacetsPresenter.FacetsState();
}

uint64_t sub_10075D070()
{
  return PageFacetsPresenter.selectedFacetOptions.getter();
}

uint64_t sub_10075D080()
{
  return PageFacetsPresenter.onFacetStateDidChange.getter();
}

uint64_t sub_10075D090()
{
  return PageFacetsPresenter.onSelectedFacetOptionsChanged.getter();
}

void sub_10075D0A0()
{
}

uint64_t sub_10075D0B0()
{
  return PageFacetsPresenter.didSelect(option:in:)();
}

uint64_t sub_10075D0C0()
{
  return PageFacetsPresenter.init()();
}

uint64_t sub_10075D0D0()
{
  return type metadata accessor for PageFacetsPresenter();
}

uint64_t sub_10075D0E0()
{
  return type metadata accessor for PageTabChangeAction();
}

uint64_t sub_10075D0F0()
{
  return dispatch thunk of PlaybackCoordinator.unregister(playableView:)();
}

uint64_t sub_10075D100()
{
  return dispatch thunk of PlaybackCoordinator.setParentViewController(_:)();
}

uint64_t sub_10075D110()
{
  return dispatch thunk of PlaybackCoordinator.pause()();
}

uint64_t sub_10075D120()
{
  return dispatch thunk of PlaybackCoordinator.resume()();
}

uint64_t sub_10075D130()
{
  return dispatch thunk of PlaybackCoordinator.register(playableView:)();
}

uint64_t sub_10075D140()
{
  return type metadata accessor for PlaybackCoordinator();
}

uint64_t sub_10075D150()
{
  return PrivacyFooterLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075D160()
{
  return PrivacyFooterLayout.Metrics.init(bodyTopSpace:actionButtonLeadingMargin:maxTextWidth:bottomSpace:)();
}

uint64_t sub_10075D170()
{
  return type metadata accessor for PrivacyFooterLayout.Metrics();
}

uint64_t sub_10075D180()
{
  return PrivacyFooterLayout.init(metrics:bodyLabel:actionButtons:)();
}

uint64_t sub_10075D190()
{
  return type metadata accessor for PrivacyFooterLayout();
}

uint64_t sub_10075D1A0()
{
  return PrivacyHeaderLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075D1B0()
{
  return PrivacyHeaderLayout.Metrics.init(bodyTopSpace:bodyBottomSpace:supplementaryItemsTopSpace:supplementaryItemsPadding:supplementaryItemsBottomSpace:actionButtonLeadingMargin:bodyOnlyBottomMargin:maxTextWidth:)();
}

uint64_t sub_10075D1C0()
{
  return type metadata accessor for PrivacyHeaderLayout.Metrics();
}

uint64_t sub_10075D1D0()
{
  return PrivacyHeaderLayout.init(metrics:isDetailHeader:bodyLabel:supplementaryItemLabels:topSeparatorView:middleSeparatorView:actionButtons:)();
}

uint64_t sub_10075D1E0()
{
  return type metadata accessor for PrivacyHeaderLayout();
}

uint64_t sub_10075D1F0()
{
  return type metadata accessor for ProductReviewAction.ReviewAction();
}

uint64_t sub_10075D200()
{
  return ProductReviewAction.action.getter();
}

uint64_t sub_10075D210()
{
  return type metadata accessor for ProductReviewAction();
}

uint64_t sub_10075D220()
{
  return ProductReviewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075D230()
{
  return ProductReviewLayout.Metrics.init(titleSpace:ratingSpace:dateSpace:authorSpace:bodyFirstLineSpace:bodySubsequentLineSpace:bodyEstimatedNumberOfLines:responseTitleSpace:responseDateSpace:responseBodyFirstLineSpace:horizontalInterViewSpace:horizontalEdgeSpace:bottomEdgeSpace:badgeSpace:actionsSpace:actionsInterItemSpace:)();
}

uint64_t sub_10075D240()
{
  return type metadata accessor for ProductReviewLayout.Metrics();
}

uint64_t sub_10075D250()
{
  return ProductReviewLayout.init(metrics:titleText:ratingView:dateText:authorText:bodyText:responseTitleText:responseDateText:responseBodyText:badgeText:actionViews:)();
}

uint64_t sub_10075D260()
{
  return type metadata accessor for ProductReviewLayout();
}

uint64_t sub_10075D270()
{
  return ProductWriteAReview.supportAction.getter();
}

uint64_t sub_10075D280()
{
  return ProductWriteAReview.writeReviewAction.getter();
}

uint64_t sub_10075D290()
{
  return ReportConcernAction.sendAction.getter();
}

uint64_t sub_10075D2A0()
{
  return ReportConcernAction.explanation.getter();
}

uint64_t sub_10075D2B0()
{
  return ReportConcernAction.reasons.getter();
}

uint64_t sub_10075D2C0()
{
  return type metadata accessor for ReportConcernAction();
}

uint64_t sub_10075D2D0()
{
  return ReportConcernReason.uppercaseName.getter();
}

uint64_t sub_10075D2E0()
{
  return ReportConcernReason.id.getter();
}

uint64_t sub_10075D2F0()
{
  return ReportConcernReason.name.getter();
}

uint64_t sub_10075D300()
{
  return type metadata accessor for ReportConcernReason();
}

uint64_t sub_10075D310()
{
  return ReviewSummaryLayout.Metrics.contentPadding.setter();
}

uint64_t sub_10075D320()
{
  return ReviewSummaryLayout.Metrics.init(subtitleTopSpace:contentPadding:)();
}

uint64_t sub_10075D330()
{
  return type metadata accessor for ReviewSummaryLayout.Metrics();
}

uint64_t sub_10075D340()
{
  return ReviewSummaryLayout.init(metrics:bodyLabel:subtitleLabel:)();
}

uint64_t sub_10075D350()
{
  return type metadata accessor for ReviewSummaryLayout();
}

uint64_t sub_10075D360()
{
  return type metadata accessor for RiverRowLayoutStyle();
}

uint64_t sub_10075D370()
{
  return SearchTextPresenter.inputSource.setter();
}

uint64_t sub_10075D380()
{
  return SearchTextPresenter.onApplyTermExpansion.getter();
}

uint64_t sub_10075D390()
{
  return SearchTextPresenter.init(ghostHintMetricsTracker:)();
}

uint64_t sub_10075D3A0()
{
  return type metadata accessor for SearchTextPresenter();
}

uint64_t sub_10075D3B0()
{
  return SmallBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075D3C0()
{
  return static SmallBreakoutLayout.rotatedIconFrameOffsets(rotation:iconSize:)();
}

uint64_t sub_10075D3D0()
{
  return SmallBreakoutLayout.Metrics.init(iconSize:iconRotation:iconBottomOffset:detailsTrailingMargin:detailsWidth:layoutMargins:height:)();
}

uint64_t sub_10075D3E0()
{
  return type metadata accessor for SmallBreakoutLayout.Metrics();
}

uint64_t sub_10075D3F0()
{
  return SmallBreakoutLayout.init(metrics:iconView:detailsView:)();
}

uint64_t sub_10075D400()
{
  return type metadata accessor for SmallBreakoutLayout();
}

uint64_t sub_10075D410()
{
  return static SpacerSupplementary.makeSpacerRegistration(elementKind:)();
}

uint64_t sub_10075D420()
{
  return static SpacerSupplementary.topElementKind.getter();
}

uint64_t sub_10075D430()
{
  return static SpacerSupplementary.bottomElementKind.getter();
}

uint64_t sub_10075D440()
{
  return type metadata accessor for SpacerSupplementary();
}

uint64_t sub_10075D450()
{
  return TodayCardMediaRiver.lockups.getter();
}

uint64_t sub_10075D460()
{
  return type metadata accessor for TodayCardMediaRiver();
}

uint64_t sub_10075D470()
{
  return type metadata accessor for TodayCardMediaVideo();
}

uint64_t sub_10075D480()
{
  return type metadata accessor for TriggerBuilderError();
}

uint64_t sub_10075D490()
{
  return type metadata accessor for URLProtocolDelegate.DialogStyle();
}

uint64_t sub_10075D4A0()
{
  return URLProtocolDelegate.init(dialogStyle:)();
}

uint64_t sub_10075D4B0()
{
  return URLProtocolDelegate.dialogStyle.setter();
}

uint64_t sub_10075D4C0()
{
  return URLProtocolDelegate.presentDialog(for:)();
}

uint64_t sub_10075D4D0()
{
  return URLProtocolDelegate.performAuthentication(for:)();
}

uint64_t sub_10075D4E0()
{
  return type metadata accessor for URLProtocolDelegate();
}

uint64_t sub_10075D4F0()
{
  return UpsellGridPresenter.init(objectGraph:contentDictionary:)();
}

uint64_t sub_10075D500()
{
  return UpsellGridPresenter.view.setter();
}

uint64_t sub_10075D510()
{
  return type metadata accessor for UpsellGridPresenter();
}

uint64_t sub_10075D520()
{
  return _VerticalFlowLayout.measurements(fitting:in:)();
}

uint64_t sub_10075D530()
{
  return _VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075D540()
{
  return static _VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_10075D550()
{
  return static _VerticalFlowLayout.ExclusionCondition.hasNoContent.getter();
}

uint64_t sub_10075D560()
{
  return static _VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_10075D570()
{
  return type metadata accessor for _VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_10075D580()
{
  return _VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_10075D590()
{
  return type metadata accessor for _VerticalFlowLayout.Child.HorizontalAlignment();
}

uint64_t sub_10075D5A0()
{
  return static _VerticalFlowLayout.Child.make(forView:placement:horizontalAlignment:topSpace:bottomSpace:excludeWhen:)();
}

uint64_t sub_10075D5B0()
{
  return type metadata accessor for _VerticalFlowLayout.Child.Placement();
}

uint64_t sub_10075D5C0()
{
  return type metadata accessor for _VerticalFlowLayout.Child();
}

uint64_t sub_10075D5D0()
{
  return _VerticalFlowLayout.addChild(_:)();
}

uint64_t sub_10075D5E0()
{
  return type metadata accessor for _VerticalFlowLayout();
}

uint64_t sub_10075D5F0()
{
  return dispatch thunk of ASKBootstrapProtocol.withMetricsEventRecorderProducer(_:)();
}

uint64_t sub_10075D600()
{
  return dispatch thunk of ASKBootstrapProtocol.start()();
}

uint64_t sub_10075D610()
{
  return AchievementGroupView.init(visibleModel:showSecondCard:cardSize:)();
}

uint64_t sub_10075D620()
{
  return type metadata accessor for AchievementGroupView.Size();
}

uint64_t sub_10075D630()
{
  return type metadata accessor for AchievementGroupView();
}

uint64_t sub_10075D640()
{
  return dispatch thunk of AdAttributionManager.performClickThroughAttribution(forAdamID:appState:)();
}

uint64_t sub_10075D650()
{
  return dispatch thunk of AdAttributionManager.processReengagement(forBundleID:payloadURL:)();
}

uint64_t sub_10075D660()
{
  return dispatch thunk of AdAttributionManager.processReengagement(forAdamID:)();
}

uint64_t sub_10075D670()
{
  return type metadata accessor for AdAttributionManager();
}

uint64_t sub_10075D680()
{
  return type metadata accessor for AdTransparencyAction();
}

uint64_t sub_10075D690()
{
  return static AppleAccountBranding.localizedString(_:)();
}

uint64_t sub_10075D6A0()
{
  return ArcadeWelcomeContent.familyAction.getter();
}

uint64_t sub_10075D6B0()
{
  return ArcadeWelcomeContent.continueAction.getter();
}

uint64_t sub_10075D6C0()
{
  return ArcadeWelcomeContent.items.getter();
}

uint64_t sub_10075D6D0()
{
  return ArcadeWelcomeContent.title.getter();
}

uint64_t sub_10075D6E0()
{
  return ArcadeWelcomeContent.subtitle.getter();
}

uint64_t sub_10075D6F0()
{
  return dispatch thunk of ArtworkModelProtocol.artwork.getter();
}

uint64_t sub_10075D700()
{
  return type metadata accessor for BoundsBasedPlaceable();
}

uint64_t sub_10075D710()
{
  return CancelPreorderAction.preorderAdamId.getter();
}

uint64_t sub_10075D720()
{
  return CancelPreorderAction.isArcade.getter();
}

uint64_t sub_10075D730()
{
  return type metadata accessor for CancelPreorderAction();
}

uint64_t sub_10075D740()
{
  return dispatch thunk of ChartOrCategoryBrick.brickBadge.getter();
}

uint64_t sub_10075D750()
{
  return dispatch thunk of ChartOrCategoryBrick.brickTitle.getter();
}

uint64_t sub_10075D760()
{
  return dispatch thunk of ChartOrCategoryBrick.artworkSafeArea.getter();
}

uint64_t sub_10075D770()
{
  return ComponentHeightCache.invalidate(items:)();
}

uint64_t sub_10075D780()
{
  return ComponentHeightCache.init()();
}

uint64_t sub_10075D790()
{
  return type metadata accessor for ComponentHeightCache();
}

uint64_t sub_10075D7A0()
{
  return DynamicUIRequestInfo.clientOptions.getter();
}

uint64_t sub_10075D7B0()
{
  return DynamicUIRequestInfo.metricsOverlay.getter();
}

uint64_t sub_10075D7C0()
{
  return DynamicUIRequestInfo.onDismissalAction.getter();
}

uint64_t sub_10075D7D0()
{
  return DynamicUIRequestInfo.purchaseFailureAction.getter();
}

uint64_t sub_10075D7E0()
{
  return DynamicUIRequestInfo.purchaseSuccessAction.getter();
}

uint64_t sub_10075D7F0()
{
  return DynamicUIRequestInfo.carrierLinkFailureAction.getter();
}

uint64_t sub_10075D800()
{
  return DynamicUIRequestInfo.carrierLinkSuccessAction.getter();
}

uint64_t sub_10075D810()
{
  return type metadata accessor for DynamicUIRequestInfo();
}

uint64_t sub_10075D820()
{
  return EditorialQuoteLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075D830()
{
  return EditorialQuoteLayout.Metrics.init(quoteTopSpace:attributionTopSpace:horizontalMargin:bottomMargin:maxWidth:minHeight:alignment:)();
}

uint64_t sub_10075D840()
{
  return type metadata accessor for EditorialQuoteLayout.Metrics.Alignment();
}

uint64_t sub_10075D850()
{
  return type metadata accessor for EditorialQuoteLayout.Metrics();
}

uint64_t sub_10075D860()
{
  return EditorialQuoteLayout.init(metrics:quoteLabel:attributionLabel:)();
}

uint64_t sub_10075D870()
{
  return type metadata accessor for EditorialQuoteLayout();
}

uint64_t sub_10075D880()
{
  return dispatch thunk of static ExactHeightProviding.height(in:asPartOf:)();
}

uint64_t sub_10075D890()
{
  return GenericPagePresenter.init(objectGraph:personalizationProvider:page:pageUrl:supportsFastImpressions:adLifecycleMetricReporter:)();
}

uint64_t sub_10075D8A0()
{
  return type metadata accessor for GenericPagePresenter();
}

uint64_t sub_10075D8B0()
{
  return InstallPageOfferMode.rawValue.getter();
}

uint64_t sub_10075D8C0()
{
  return LoadingPagePresenter.init(objectGraph:pageUrl:isIncomingURL:referrerData:)();
}

uint64_t sub_10075D8D0()
{
  return dispatch thunk of LoadingPagePresenter.view.setter();
}

uint64_t sub_10075D8E0()
{
  return type metadata accessor for LoadingPagePresenter();
}

uint64_t sub_10075D8F0()
{
  return dispatch thunk of MetricsPagePresenter.pageRenderMetrics.getter();
}

uint64_t sub_10075D900()
{
  return dispatch thunk of MetricsPagePresenter.pendingPageRender.getter();
}

uint64_t sub_10075D910()
{
  return dispatch thunk of MetricsPagePresenter.metricsPipeline.getter();
}

uint64_t sub_10075D920()
{
  return dispatch thunk of MetricsPagePresenter.impressionsTracker.getter();
}

uint64_t sub_10075D930()
{
  return dispatch thunk of MetricsPagePresenter.impressionsCalculator.getter();
}

uint64_t sub_10075D940()
{
  return dispatch thunk of MetricsPagePresenter.referrer.getter();
}

uint64_t sub_10075D950()
{
  return MetricsPagePresenter.observe(lifecycleEvent:)();
}

uint64_t sub_10075D960()
{
  return MetricsTopicProvider.createEventDecorator()();
}

uint64_t sub_10075D970()
{
  return MetricsTopicProvider.shouldHaveAnonymousEvents.getter();
}

uint64_t sub_10075D980()
{
  return MetricsTopicProvider.init(bag:)();
}

uint64_t sub_10075D990()
{
  return type metadata accessor for MetricsTopicProvider();
}

uint64_t sub_10075D9A0()
{
  return dispatch thunk of OfferButtonPresenter.offerDisplayProperties.getter();
}

uint64_t sub_10075D9B0()
{
  return dispatch thunk of OfferButtonPresenter.view.setter();
}

uint64_t sub_10075D9C0()
{
  return dispatch thunk of OfferButtonPresenter.update(ignoringCache:)();
}

uint64_t sub_10075D9D0()
{
  return type metadata accessor for PrivacyCategoryStyle();
}

uint64_t sub_10075D9E0()
{
  return ProductMediaMetadata.hasPortraitMedia.getter();
}

uint64_t sub_10075D9F0()
{
  return ProductMediaMetadata.hasPortraitPhoneMedia.getter();
}

uint64_t sub_10075DA00()
{
  return ProductMediaMetadata.allPlatforms.getter();
}

uint64_t sub_10075DA10()
{
  return ProductMediaMetadata.platformDescription.getter();
}

uint64_t sub_10075DA20()
{
  return ProductMediaMetadata.descriptionPlacement(when:)();
}

uint64_t sub_10075DA30()
{
  return ProductMediaMetadata.allPlatformsDescription.getter();
}

uint64_t sub_10075DA40()
{
  return ProductMediaMetadata.platform.getter();
}

uint64_t sub_10075DA50()
{
  return type metadata accessor for ProductMediaMetadata();
}

uint64_t sub_10075DA60()
{
  return ProductRatingsLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075DA70()
{
  return static ProductRatingsLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_10075DA80()
{
  return ProductRatingsLayout.Metrics.columnWidth.setter();
}

uint64_t sub_10075DA90()
{
  return ProductRatingsLayout.Metrics.columnMargin.setter();
}

uint64_t sub_10075DAA0()
{
  return ProductRatingsLayout.Metrics.layoutMargins.setter();
}

uint64_t sub_10075DAB0()
{
  return ProductRatingsLayout.Metrics.init(averageRatingTextSpace:compactDenominatorTextSpace:denominatorLeadingMargin:columnWidth:columnMargin:histogramLeadingMargin:progressBarMargin:histogramStarSpacing:histogramBarHeight:bottomSpace:layoutMargins:)();
}

uint64_t sub_10075DAC0()
{
  return type metadata accessor for ProductRatingsLayout.Metrics();
}

uint64_t sub_10075DAD0()
{
  return ProductRatingsLayout.init(metrics:averageRatingText:denominatorRatingText:ratingCountText:histogramStarViews:histogramRatingProgressViews:)();
}

uint64_t sub_10075DAE0()
{
  return type metadata accessor for ProductRatingsLayout();
}

uint64_t sub_10075DAF0()
{
  return PurchasesContentMode.displayTitle.getter();
}

uint64_t sub_10075DB00()
{
  return PurchasesContentMode.segmentIndex.getter();
}

uint64_t sub_10075DB10()
{
  return PurchasesContentMode.toggleIsHiddenText.getter();
}

uint64_t sub_10075DB20()
{
  return type metadata accessor for PurchasesContentMode();
}

uint64_t sub_10075DB30()
{
  return ReviewsPagePresenter.init(objectGraph:appStateController:reviewsPage:preferSelectedActionTitles:)();
}

uint64_t sub_10075DB40()
{
  return ReviewsPagePresenter.onPerformAction.getter();
}

uint64_t sub_10075DB50()
{
  return dispatch thunk of ReviewsPagePresenter.sortActionTitle(for:)();
}

uint64_t sub_10075DB60()
{
  return dispatch thunk of ReviewsPagePresenter.initialIndexPath.getter();
}

uint64_t sub_10075DB70()
{
  return dispatch thunk of ReviewsPagePresenter.performSortAction(sender:)();
}

uint64_t sub_10075DB80()
{
  return dispatch thunk of ReviewsPagePresenter.trailingNavBarAction.getter();
}

uint64_t sub_10075DB90()
{
  return ReviewsPagePresenter.title.getter();
}

uint64_t sub_10075DBA0()
{
  return type metadata accessor for ReviewsPagePresenter();
}

uint64_t sub_10075DBB0()
{
  return SearchHintsPresenter.init(objectGraph:searchTextPresenter:searchGhostHintTracker:)();
}

uint64_t sub_10075DBC0()
{
  return dispatch thunk of SearchHintsPresenter.resultCount.getter();
}

uint64_t sub_10075DBD0()
{
  return dispatch thunk of SearchHintsPresenter.didSelectHint(at:)();
}

uint64_t sub_10075DBE0()
{
  return dispatch thunk of SearchHintsPresenter.hint(at:)();
}

uint64_t sub_10075DBF0()
{
  return dispatch thunk of SearchHintsPresenter.view.setter();
}

uint64_t sub_10075DC00()
{
  return type metadata accessor for SearchHintsPresenter();
}

uint64_t sub_10075DC10()
{
  return SearchResultsMessage.primaryText.getter();
}

uint64_t sub_10075DC20()
{
  return SearchResultsMessage.secondaryText.getter();
}

uint64_t sub_10075DC30()
{
  return type metadata accessor for ShelfBackgroundStyle();
}

uint64_t sub_10075DC40()
{
  return SmallStoryCardLayout.init(contentView:headingLabel:descriptionLabel:metrics:)();
}

uint64_t sub_10075DC50()
{
  return SmallStoryCardLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075DC60()
{
  return static SmallStoryCardLayout.estimatedMeasurements(fitting:using:with:)();
}

uint64_t sub_10075DC70()
{
  return SmallStoryCardLayout.Metrics.init(contentAspectRatio:headingPrimarySpace:descriptionPrimarySpace:headingSecondarySpace:descriptionSecondarySpace:descriptionBottomSpace:descriptionNumberOfLines:headingNumberOfLines:)();
}

uint64_t sub_10075DC80()
{
  return SmallStoryCardLayout.Metrics.contentAspectRatio.getter();
}

uint64_t sub_10075DC90()
{
  return type metadata accessor for SmallStoryCardLayout.Metrics();
}

uint64_t sub_10075DCA0()
{
  return type metadata accessor for SmallStoryCardLayout();
}

uint64_t sub_10075DCB0()
{
  return type metadata accessor for TitledParagraphStyle();
}

uint64_t sub_10075DCC0()
{
  return UpsellBreakoutLayout.measuredSize(fitting:in:)();
}

uint64_t sub_10075DCD0()
{
  return UpsellBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075DCE0()
{
  return UpsellBreakoutLayout.Metrics.init(backgroundMediaAspectRatio:detailsWidth:actionButtonHeight:actionButtonMinWidth:actionButtonTopMargin:buttonDetailsSpace:layoutMargins:height:mediaSafeAreaHeight:)();
}

uint64_t sub_10075DCF0()
{
  return type metadata accessor for UpsellBreakoutLayout.Metrics();
}

uint64_t sub_10075DD00()
{
  return UpsellBreakoutLayout.init(metrics:backgroundMediaView:detailsView:actionButton:buttonDetailsView:)();
}

uint64_t sub_10075DD10()
{
  return type metadata accessor for UpsellBreakoutLayout();
}

uint64_t sub_10075DD20()
{
  return type metadata accessor for VideoPlaybackFailure();
}

uint64_t sub_10075DD30()
{
  return dispatch thunk of AnyVideoViewProviding.someVideoView.getter();
}

uint64_t sub_10075DD40()
{
  return dispatch thunk of AnyVideoViewProviding.someVideoView.setter();
}

uint64_t sub_10075DD50()
{
  return type metadata accessor for ArcadeIntroOfferState();
}

uint64_t sub_10075DD60()
{
  return type metadata accessor for ArcadeSeeAllGamesPage.DisplayStyle();
}

uint64_t sub_10075DD70()
{
  return type metadata accessor for ArcadeSeeAllGamesPage();
}

uint64_t sub_10075DD80()
{
  return BadgeContentKeyAdamId.getter();
}

uint64_t sub_10075DD90()
{
  return BadgeContentKeyRating.getter();
}

uint64_t sub_10075DDA0()
{
  return static BadgeViewRibbonLayout.measurements(valueLabelWidth:viewSize:captionWidth:headingLabelWidth:fitting:using:in:)();
}

uint64_t sub_10075DDB0()
{
  return BadgeViewRibbonLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075DDC0()
{
  return static BadgeViewRibbonLayout.estimatedHeight(fitting:using:with:)();
}

uint64_t sub_10075DDD0()
{
  return BadgeViewRibbonLayout.Metrics.accessibleBadgeInsets.modify();
}

uint64_t sub_10075DDE0()
{
  return BadgeViewRibbonLayout.Metrics.valueViewAlignment.setter();
}

uint64_t sub_10075DDF0()
{
  return BadgeViewRibbonLayout.Metrics.regularBadgeInsets.modify();
}

uint64_t sub_10075DE00()
{
  return BadgeViewRibbonLayout.Metrics.spacingType.setter();
}

uint64_t sub_10075DE10()
{
  return BadgeViewRibbonLayout.Metrics.init(headingSpace:captionSpace:captionBottomSpace:badgeValueEditorsChoiceSpace:badgeValueIconSpace:badgeValueTextSpace:badgeValueBaselineOffset:badgeIconSize:valueBufferSpace:spacingType:captionCappingType:badgeType:isLabelLeading:valueViewAlignment:alignment:regularBadgeInsets:accessibleBadgeInsets:)();
}

uint64_t sub_10075DE20()
{
  return BadgeViewRibbonLayout.Metrics.badgeIconSize.getter();
}

uint64_t sub_10075DE30()
{
  return BadgeViewRibbonLayout.Metrics.isLabelLeading.setter();
}

uint64_t sub_10075DE40()
{
  return BadgeViewRibbonLayout.Metrics.captionCappingType.setter();
}

uint64_t sub_10075DE50()
{
  return BadgeViewRibbonLayout.Metrics.badgeValueBaselineOffset.setter();
}

uint64_t sub_10075DE60()
{
  return BadgeViewRibbonLayout.Metrics.alignment.setter();
}

uint64_t sub_10075DE70()
{
  return BadgeViewRibbonLayout.Metrics.badgeType.setter();
}

uint64_t sub_10075DE80()
{
  return type metadata accessor for BadgeViewRibbonLayout.Metrics();
}

uint64_t sub_10075DE90()
{
  return BadgeViewRibbonLayout.init(metrics:headingLabel:captionView:valueLabel:valueView:)();
}

uint64_t sub_10075DEA0()
{
  return type metadata accessor for BadgeViewRibbonLayout();
}

uint64_t sub_10075DEB0()
{
  return BreakoutDetailsLayout.measurements(fitting:in:)();
}

uint64_t sub_10075DEC0()
{
  return BreakoutDetailsLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075DED0()
{
  return type metadata accessor for BreakoutDetailsLayout.DetailDimension();
}

uint64_t sub_10075DEE0()
{
  return BreakoutDetailsLayout.Metrics.init(titleSpace:titleBehavior:descriptionSpace:badgeTextSpace:badgeWordmarkSpace:callToActionSpace:layoutMargins:)();
}

uint64_t sub_10075DEF0()
{
  return BreakoutDetailsLayout.Metrics.TitleTextBehavior.CompressionBehavior.init(lineCountThreshold:standardUseCase:compressedUseCase:)();
}

uint64_t sub_10075DF00()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics.TitleTextBehavior.CompressionBehavior();
}

uint64_t sub_10075DF10()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics.TitleTextBehavior();
}

uint64_t sub_10075DF20()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics();
}

uint64_t sub_10075DF30()
{
  return BreakoutDetailsLayout.init(metrics:titleLabel:descriptionLabel:badgeText:badgeWordmark:callToActionButton:)();
}

uint64_t sub_10075DF40()
{
  return type metadata accessor for BreakoutDetailsLayout();
}

uint64_t sub_10075DF50()
{
  return CommerceDialogHandler.presentingViewController.getter();
}

uint64_t sub_10075DF60()
{
  return CommerceDialogHandler.isActive.setter();
}

uint64_t sub_10075DF70()
{
  return type metadata accessor for CommerceDialogHandler();
}

uint64_t sub_10075DF80()
{
  return CommerceDialogHandler.init(_:_:)();
}

uint64_t sub_10075DF90()
{
  return type metadata accessor for DiffablePagePresenter.UpdatePhase();
}

uint64_t sub_10075DFA0()
{
  return dispatch thunk of DiffablePagePresenter.viewDidLoad()();
}

uint64_t sub_10075DFB0()
{
  return dispatch thunk of DiffablePagePresenter.viewDidAppear()();
}

uint64_t sub_10075DFC0()
{
  return dispatch thunk of DiffablePagePresenter.viewWillAppear()();
}

uint64_t sub_10075DFD0()
{
  return dispatch thunk of DiffablePagePresenter.onApplySnapshot.getter();
}

uint64_t sub_10075DFE0()
{
  return DiffablePagePresenter.onPerformAction.getter();
}

uint64_t sub_10075DFF0()
{
  return dispatch thunk of DiffablePagePresenter.paginationState.getter();
}

uint64_t sub_10075E000()
{
  return dispatch thunk of DiffablePagePresenter.viewDidDisappear()();
}

uint64_t sub_10075E010()
{
  return dispatch thunk of DiffablePagePresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_10075E020()
{
  return dispatch thunk of DiffablePagePresenter.appExitedWhileAppeared()();
}

uint64_t sub_10075E030()
{
  return dispatch thunk of DiffablePagePresenter.appEnteredWhileAppeared()();
}

uint64_t sub_10075E040()
{
  return DiffablePagePresenter.onPaginationStateChanged.getter();
}

uint64_t sub_10075E050()
{
  return dispatch thunk of DiffablePagePresenter.viewWillBecomeFullyVisible()();
}

uint64_t sub_10075E060()
{
  return dispatch thunk of DiffablePagePresenter.viewWillBecomePartiallyVisible()();
}

uint64_t sub_10075E070()
{
  return DiffablePagePresenter.pageUrl.getter();
}

uint64_t sub_10075E080()
{
  return EditorialSearchResult.clickAction.getter();
}

uint64_t sub_10075E090()
{
  return EditorialSearchResult.iconArtwork.getter();
}

uint64_t sub_10075E0A0()
{
  return EditorialSearchResult.editorialVideo.getter();
}

uint64_t sub_10075E0B0()
{
  return EditorialSearchResult.artworkGridType.getter();
}

uint64_t sub_10075E0C0()
{
  return dispatch thunk of EditorialSearchResult.typeDisplayText.getter();
}

uint64_t sub_10075E0D0()
{
  return EditorialSearchResult.editorialArtwork.getter();
}

uint64_t sub_10075E0E0()
{
  return EditorialSearchResult.collectionAdamIds.getter();
}

uint64_t sub_10075E0F0()
{
  return EditorialSearchResult.mediaOverlayStyle.getter();
}

uint64_t sub_10075E100()
{
  return EditorialSearchResult.appEventFormattedDates.getter();
}

uint64_t sub_10075E110()
{
  return EditorialSearchResult.type.getter();
}

uint64_t sub_10075E120()
{
  return EditorialSearchResult.title.getter();
}

uint64_t sub_10075E130()
{
  return EditorialSearchResult.subtitle.getter();
}

uint64_t sub_10075E140()
{
  return EditorialSearchResult.tintColor.getter();
}

uint64_t sub_10075E150()
{
  return type metadata accessor for EditorialSearchResult();
}

uint64_t sub_10075E160()
{
  return type metadata accessor for FlowAnimationBehavior();
}

uint64_t sub_10075E170()
{
  return dispatch thunk of FlowPreviewActionable.flowPreviewActionsConfiguration.getter();
}

uint64_t sub_10075E180()
{
  return GuidedSearchPresenter.didToggleToken(at:actionHandler:)();
}

uint64_t sub_10075E190()
{
  return GuidedSearchPresenter.onTokensDidChange.getter();
}

uint64_t sub_10075E1A0()
{
  return GuidedSearchPresenter.init()();
}

uint64_t sub_10075E1B0()
{
  return type metadata accessor for GuidedSearchPresenter();
}

uint64_t sub_10075E1C0()
{
  return HttpTemplateParameter.isRequired.getter();
}

uint64_t sub_10075E1D0()
{
  return HttpTemplateParameter.maximumLength.getter();
}

uint64_t sub_10075E1E0()
{
  return HttpTemplateParameter.key.getter();
}

uint64_t sub_10075E1F0()
{
  return HttpTemplateParameter.title.getter();
}

uint64_t sub_10075E200()
{
  return type metadata accessor for HttpTemplateParameter.InputType();
}

uint64_t sub_10075E210()
{
  return HttpTemplateParameter.inputType.getter();
}

uint64_t sub_10075E220()
{
  return type metadata accessor for HttpTemplateParameter();
}

uint64_t sub_10075E230()
{
  return ImpressionableArtwork.impressionMetrics.getter();
}

uint64_t sub_10075E240()
{
  return ImpressionableArtwork.art.getter();
}

uint64_t sub_10075E250()
{
  return dispatch thunk of ImpressionableArtwork.artwork.getter();
}

uint64_t sub_10075E260()
{
  return ImpressionsCalculator.childCalculator(for:viewBounds:)();
}

uint64_t sub_10075E270()
{
  return ImpressionsCalculator.makeChildCalculator(for:)();
}

uint64_t sub_10075E280()
{
  return ImpressionsCalculator.addElement(_:at:)();
}

uint64_t sub_10075E290()
{
  return ImpressionsCalculator.viewBounds.setter();
}

uint64_t sub_10075E2A0()
{
  return ImpressionsCalculator.removeElement(_:)();
}

void sub_10075E2B0()
{
}

uint64_t sub_10075E2C0()
{
  return ImpressionsCalculator.init(impressionableThreshold:tracker:)();
}

uint64_t sub_10075E2D0()
{
  return ImpressionsCalculator.increaseImpressionableFrame(forElement:by:isContainer:)();
}

uint64_t sub_10075E2E0()
{
  return ImpressionsCalculator.isVisible.setter();
}

uint64_t sub_10075E2F0()
{
  return type metadata accessor for ImpressionsCalculator();
}

uint64_t sub_10075E300()
{
  return OverlayViewController.init(overlayView:)();
}

uint64_t sub_10075E310()
{
  return type metadata accessor for OverlayViewController();
}

uint64_t sub_10075E320()
{
  return PrivacyCategoryLayout.measurements(fitting:in:)();
}

uint64_t sub_10075E330()
{
  return PrivacyCategoryLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075E340()
{
  return PrivacyCategoryLayout.Metrics.titleTopSpace.setter();
}

uint64_t sub_10075E350()
{
  return PrivacyCategoryLayout.Metrics.init(textLeadingMargin:titleTopSpace:iconHorizontalCenterMargin:iconSize:dataTypesTopSpace:dataTypesBottomSpace:bottomMargin:)();
}

uint64_t sub_10075E360()
{
  return PrivacyCategoryLayout.Metrics.iconSize.getter();
}

uint64_t sub_10075E370()
{
  return PrivacyCategoryLayout.Metrics.iconSize.setter();
}

uint64_t sub_10075E380()
{
  return type metadata accessor for PrivacyCategoryLayout.Metrics();
}

uint64_t sub_10075E390()
{
  return PrivacyCategoryLayout.init(metrics:iconView:titleLabel:dataTypesLabel:)();
}

uint64_t sub_10075E3A0()
{
  return type metadata accessor for PrivacyCategoryLayout();
}

uint64_t sub_10075E3B0()
{
  return ProgressConfiguration.init(metrics:progress:alignment:theme:isInstalling:)();
}

uint64_t sub_10075E3C0()
{
  return type metadata accessor for ProgressConfiguration();
}

uint64_t sub_10075E3D0()
{
  return static ReviewComposerUtility.lockupStyle(from:)();
}

uint64_t sub_10075E3E0()
{
  return ShelfBasedProductPage.fullProductFetchedAction.getter();
}

uint64_t sub_10075E3F0()
{
  return type metadata accessor for ShelfBasedProductPage();
}

uint64_t sub_10075E400()
{
  return type metadata accessor for SmallGameCenterPlayer();
}

uint64_t sub_10075E410()
{
  return SponsoredSearchAdvert.init(instanceId:adamId:assetInformation:adData:cppIds:serverCppId:selectedCppId:appBinaryTraits:)();
}

uint64_t sub_10075E420()
{
  return SponsoredSearchAdvert.instanceId.getter();
}

uint64_t sub_10075E430()
{
  return SponsoredSearchAdvert.serverCppId.getter();
}

uint64_t sub_10075E440()
{
  return SponsoredSearchAdvert.selectedCppId.getter();
}

uint64_t sub_10075E450()
{
  return SponsoredSearchAdvert.appBinaryTraits.getter();
}

uint64_t sub_10075E460()
{
  return SponsoredSearchAdvert.adData.getter();
}

uint64_t sub_10075E470()
{
  return SponsoredSearchAdvert.adamId.getter();
}

uint64_t sub_10075E480()
{
  return SponsoredSearchAdvert.cppIds.getter();
}

uint64_t sub_10075E490()
{
  return type metadata accessor for SponsoredSearchAdvert();
}

uint64_t sub_10075E4A0()
{
  return static StringCharacteristics.accentedCharacters.getter();
}

uint64_t sub_10075E4B0()
{
  return static StringCharacteristics.extraTallCharacters.getter();
}

uint64_t sub_10075E4C0()
{
  return static StringCharacteristics.legacyExtraTallCharacters.getter();
}

uint64_t sub_10075E4D0()
{
  return static StringCharacteristics.longWords.getter();
}

uint64_t sub_10075E4E0()
{
  return type metadata accessor for StringCharacteristics();
}

uint64_t sub_10075E4F0()
{
  return TitleEffectFilterType.compositingFilter.getter();
}

uint64_t sub_10075E500()
{
  return type metadata accessor for TitleEffectFilterType();
}

uint64_t sub_10075E510()
{
  return static TitledParagraphLayout.isMultiColumn(compatibleWith:)();
}

uint64_t sub_10075E520()
{
  return TitledParagraphLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075E530()
{
  return TitledParagraphLayout.Metrics.columnWidth.setter();
}

uint64_t sub_10075E540()
{
  return TitledParagraphLayout.Metrics.columnMargin.setter();
}

uint64_t sub_10075E550()
{
  return TitledParagraphLayout.Metrics.init(textSpace:bodyTopSpace:columnWidth:columnMargin:)();
}

uint64_t sub_10075E560()
{
  return type metadata accessor for TitledParagraphLayout.Metrics();
}

uint64_t sub_10075E570()
{
  return TitledParagraphLayout.init(metrics:allowsMultiColumn:primaryText:secondaryText:bodyText:)();
}

uint64_t sub_10075E580()
{
  return type metadata accessor for TitledParagraphLayout();
}

uint64_t sub_10075E590()
{
  return static AnnotationImagesLayout.measurements(for:fitting:metrics:in:)();
}

uint64_t sub_10075E5A0()
{
  return AnnotationImagesLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075E5B0()
{
  return AnnotationImagesLayout.init(views:metrics:)();
}

uint64_t sub_10075E5C0()
{
  return AnnotationImagesLayout.Metrics.artworkSize.getter();
}

uint64_t sub_10075E5D0()
{
  return AnnotationImagesLayout.Metrics.init(horizontalSpacing:verticalSpacing:artworkSize:)();
}

uint64_t sub_10075E5E0()
{
  return type metadata accessor for AnnotationImagesLayout.Metrics();
}

uint64_t sub_10075E5F0()
{
  return type metadata accessor for AnnotationImagesLayout();
}

uint64_t sub_10075E600()
{
  return ArcadeDownloadPackCard.numberOfPlaceholders.getter();
}

uint64_t sub_10075E610()
{
  return ArcadeDownloadPackCard.lockups.getter();
}

uint64_t sub_10075E620()
{
  return type metadata accessor for ArcadeDownloadPackCard();
}

uint64_t sub_10075E630()
{
  return dispatch thunk of CellWithManagedArtwork.fetch(for:on:asPartOf:)();
}

uint64_t sub_10075E640()
{
  return static ComponentLayoutBuilder.verticalLayoutHorizontalSubgroups(for:withItemHeights:useEstimatedHeights:in:itemSupplementaryProvider:asPartOf:)();
}

uint64_t sub_10075E650()
{
  return static ComponentLayoutBuilder.verticalLayoutGroup(for:withItemHeights:in:itemSupplementaryProvider:asPartOf:)();
}

uint64_t sub_10075E660()
{
  return static ComponentLayoutBuilder.columnGroup(separatedBy:itemHeight:groupWidth:rowCount:)();
}

uint64_t sub_10075E670()
{
  return static ComponentLayoutOptions.overflowed.getter();
}

uint64_t sub_10075E680()
{
  return static ComponentLayoutOptions.hasBackground.getter();
}

uint64_t sub_10075E690()
{
  return static ComponentLayoutOptions.isFirstSection.getter();
}

uint64_t sub_10075E6A0()
{
  return static ComponentLayoutOptions.separatorHidden.getter();
}

uint64_t sub_10075E6B0()
{
  return static ComponentLayoutOptions.fixedHeightContainer.getter();
}

uint64_t sub_10075E6C0()
{
  return static ComponentLayoutOptions.showSupplementaryText.getter();
}

uint64_t sub_10075E6D0()
{
  return static ComponentLayoutOptions.isSingleVerticalColumn.getter();
}

uint64_t sub_10075E6E0()
{
  return ComponentLayoutOptions.init()();
}

uint64_t sub_10075E6F0()
{
  return type metadata accessor for ComponentLayoutOptions();
}

uint64_t sub_10075E700()
{
  return dispatch thunk of CompoundScrollObserver.didScroll(orthogonalScrollView:in:)();
}

uint64_t sub_10075E710()
{
  return dispatch thunk of CompoundScrollObserver.didScroll(in:)();
}

uint64_t sub_10075E720()
{
  return CompoundScrollObserver.removeChild(_:)();
}

uint64_t sub_10075E730()
{
  return CompoundScrollObserver.addChild(_:)();
}

uint64_t sub_10075E740()
{
  return CompoundScrollObserver.init(children:)();
}

uint64_t sub_10075E750()
{
  return type metadata accessor for CompoundScrollObserver();
}

uint64_t sub_10075E760()
{
  return EngagementToggleAction.identifier.getter();
}

uint64_t sub_10075E770()
{
  return EngagementToggleAction.value.getter();
}

uint64_t sub_10075E780()
{
  return type metadata accessor for EngagementToggleAction();
}

uint64_t sub_10075E790()
{
  return FamilyCircleLookupTask.perform()();
}

uint64_t sub_10075E7A0()
{
  return FamilyCircleLookupTask.init()();
}

uint64_t sub_10075E7B0()
{
  return type metadata accessor for FamilyCircleLookupTask();
}

uint64_t sub_10075E7C0()
{
  return type metadata accessor for FamilyPurchasesSection();
}

uint64_t sub_10075E7D0()
{
  return FlowPreviewDestination.init(flowAction:sender:contentType:)();
}

uint64_t sub_10075E7E0()
{
  return FlowPreviewDestination.flowAction.getter();
}

uint64_t sub_10075E7F0()
{
  return type metadata accessor for FlowPreviewDestination.ContentType();
}

uint64_t sub_10075E800()
{
  return FlowPreviewDestination.contentType.getter();
}

uint64_t sub_10075E810()
{
  return FlowPreviewDestination.sender.getter();
}

uint64_t sub_10075E820()
{
  return type metadata accessor for FlowPreviewDestination();
}

uint64_t sub_10075E830()
{
  return GameCenterReengagement.badgeGlyph.getter();
}

uint64_t sub_10075E840()
{
  return dispatch thunk of GameCenterReengagement.heroAction.getter();
}

uint64_t sub_10075E850()
{
  return GameCenterReengagement.achievement.getter();
}

uint64_t sub_10075E860()
{
  return dispatch thunk of GameCenterReengagement.clickAction.getter();
}

uint64_t sub_10075E870()
{
  return GameCenterReengagement.backgroundColor.getter();
}

uint64_t sub_10075E880()
{
  return GameCenterReengagement.backgroundArtwork.getter();
}

uint64_t sub_10075E890()
{
  return GameCenterReengagement.badge.getter();
}

uint64_t sub_10075E8A0()
{
  return GameCenterReengagement.title.getter();
}

uint64_t sub_10075E8B0()
{
  return GameCenterReengagement.lockup.getter();
}

uint64_t sub_10075E8C0()
{
  return GameCenterReengagement.subtitle.getter();
}

uint64_t sub_10075E8D0()
{
  return type metadata accessor for GameCenterReengagement();
}

uint64_t sub_10075E8E0()
{
  return InfiniteScrollObserver.init(paginatedPresenter:triggerDistance:)();
}

uint64_t sub_10075E8F0()
{
  return type metadata accessor for MediaClickMetricsEvent.ActionType();
}

uint64_t sub_10075E900()
{
  return type metadata accessor for MediaClickMetricsEvent.TargetType();
}

uint64_t sub_10075E910()
{
  return type metadata accessor for MediaClickMetricsEvent.ActionContext();
}

uint64_t sub_10075E920()
{
  return static MediaClickMetricsEvent.fillIn(template:targetType:targetId:actionType:actionContext:position:)();
}

uint64_t sub_10075E930()
{
  return type metadata accessor for MediaClickMetricsEvent.TargetId();
}

uint64_t sub_10075E940()
{
  return type metadata accessor for MetadataRibbonItemType();
}

uint64_t sub_10075E950()
{
  return dispatch thunk of static MetadataRibbonItemView.measurements(for:fitting:in:)();
}

uint64_t sub_10075E960()
{
  return dispatch thunk of MetadataRibbonItemView.labelMaxWidth.setter();
}

uint64_t sub_10075E970()
{
  return dispatch thunk of MetadataRibbonItemView.layoutContext.getter();
}

uint64_t sub_10075E980()
{
  return dispatch thunk of MetadataRibbonItemView.allowsTruncation.setter();
}

uint64_t sub_10075E990()
{
  return dispatch thunk of static MetadataRibbonItemView.isBaselineAligned.getter();
}

uint64_t sub_10075E9A0()
{
  return dispatch thunk of MetadataRibbonItemView.searchLayoutContext.getter();
}

uint64_t sub_10075E9B0()
{
  return dispatch thunk of MetadataRibbonItemView.truncationLegibilityThreshold.setter();
}

uint64_t sub_10075E9C0()
{
  return dispatch thunk of MetadataRibbonItemView.id.setter();
}

uint64_t sub_10075E9D0()
{
  return dispatch thunk of static MetadataRibbonItemView.shouldForceIntrinsicSizeDuringLayout.getter();
}

uint64_t sub_10075E9E0()
{
  return dispatch thunk of MetadataRibbonItemView.apply(_:asPartOf:)();
}

uint64_t sub_10075E9F0()
{
  return dispatch thunk of MetadataRibbonItemView.itemType.setter();
}

uint64_t sub_10075EA00()
{
  return MetadataRibbonItemView.layoutContext.getter();
}

uint64_t sub_10075EA10()
{
  return static MetadataRibbonItemView.isBaselineAligned.getter();
}

uint64_t sub_10075EA20()
{
  return MetadataRibbonItemView.searchLayoutContext.getter();
}

uint64_t sub_10075EA40()
{
  return MetadataRibbonItemView.labelText.getter();
}

uint64_t sub_10075EA50()
{
  return dispatch thunk of MetricsReportableError.describeForMetricsEvent(using:)();
}

uint64_t sub_10075EA60()
{
  return dispatch thunk of MetricsReportableError.metricsErrorDescription.getter();
}

uint64_t sub_10075EA70()
{
  return type metadata accessor for MixedMediaLockupLayout.LockupPosition();
}

uint64_t sub_10075EA80()
{
  return MixedMediaLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075EA90()
{
  return MixedMediaLockupLayout.Metrics.init(lockupPosition:taglineNumberOfLines:taglineSpace:taglineFont:alwaysIncludeTaglineSpace:verticalSpacing:layoutMargins:)();
}

uint64_t sub_10075EAA0()
{
  return MixedMediaLockupLayout.Metrics.alwaysIncludeTaglineSpace.getter();
}

uint64_t sub_10075EAB0()
{
  return type metadata accessor for MixedMediaLockupLayout.Metrics();
}

uint64_t sub_10075EAC0()
{
  return MixedMediaLockupLayout.init(metrics:lockupView:media:tagline:)();
}

uint64_t sub_10075EAD0()
{
  return type metadata accessor for MixedMediaLockupLayout();
}

uint64_t sub_10075EAE0()
{
  return dispatch thunk of OfferDisplayProperties.newOfferDisplayPropertiesChanging(titles:titleSymbolNames:subtitles:style:environment:tint:isDeletableSystemApp:isFree:isPreorder:offerLabelStyle:hasDiscount:contentRating:offerToken:subscriptionFamilyId:overrideLocale:useAdsLocale:priceFormatted:isStreamlinedBuy:appCapabilities:)();
}

uint64_t sub_10075EAF0()
{
  return OfferDisplayProperties.isArcadeOffer.getter();
}

uint64_t sub_10075EB00()
{
  return OfferDisplayProperties.environment.getter();
}

uint64_t sub_10075EB10()
{
  return OfferDisplayProperties.offerLabelStyle.getter();
}

uint64_t sub_10075EB20()
{
  return OfferDisplayProperties.isStreamlinedBuy.getter();
}

uint64_t sub_10075EB30()
{
  return OfferDisplayProperties.subscriptionFamilyId.getter();
}

uint64_t sub_10075EB40()
{
  return OfferDisplayProperties.style.getter();
}

uint64_t sub_10075EB50()
{
  return OfferDisplayProperties.adamId.getter();
}

uint64_t sub_10075EB60()
{
  return OfferDisplayProperties.offerType.getter();
}

uint64_t sub_10075EB70()
{
  return OfferDisplayProperties.subtitles.getter();
}

uint64_t sub_10075EB80()
{
  return static PageRenderMetricsEvent.lastInteractionTime.setter();
}

uint64_t sub_10075EB90()
{
  return type metadata accessor for PageRenderMetricsEvent();
}

uint64_t sub_10075EBA0()
{
  return type metadata accessor for PlaybackScrollObserver();
}

uint64_t sub_10075EBB0()
{
  return PlaybackScrollObserver.init(_:)();
}

uint64_t sub_10075EBC0()
{
  return ProductOfferButtonMode.isDisabled.getter();
}

uint64_t sub_10075EBD0()
{
  return ProductOfferButtonMode.isHidden.getter();
}

uint64_t sub_10075EBE0()
{
  return ProductReviewsMetadata.hasReviewSummary.getter();
}

uint64_t sub_10075EBF0()
{
  return ProductReviewsMetadata.reviewSummaryTitle.getter();
}

uint64_t sub_10075EC00()
{
  return type metadata accessor for ProductReviewsMetadata();
}

uint64_t sub_10075EC10()
{
  return ReviewsContainerLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075EC20()
{
  return ReviewsContainerLayout.Metrics.columnSpacer.setter();
}

uint64_t sub_10075EC30()
{
  return ReviewsContainerLayout.Metrics.marginInsets.setter();
}

uint64_t sub_10075EC40()
{
  return ReviewsContainerLayout.Metrics.init(ratingsBottomSpace:tapToRateTopSpace:tapToRateBottomSpace:reviewSummaryBottomSpace:reviewsShelfTopSpace:editorsChoiceTopSpace:columnSpacer:marginInsets:bottomEdgeSpace:)();
}

uint64_t sub_10075EC50()
{
  return type metadata accessor for ReviewsContainerLayout.Metrics();
}

uint64_t sub_10075EC60()
{
  return ReviewsContainerLayout.init(metrics:ratingsView:tapToRateView:actionsView:reviewSummaryView:reviewsShelf:editorsChoiceView:ratingsSeparatorView:)();
}

uint64_t sub_10075EC70()
{
  return type metadata accessor for ReviewsContainerLayout();
}

uint64_t sub_10075EC80()
{
  return SearchActionCalculator.searchAction(modifying:with:)();
}

uint64_t sub_10075EC90()
{
  return SearchActionCalculator.init(optimizationTermProviding:)();
}

uint64_t sub_10075ECA0()
{
  return type metadata accessor for SearchActionCalculator();
}

uint64_t sub_10075ECB0()
{
  return SearchLockupListLayout.Metrics.init(headingLeadingSpace:titleLeadingSpace:lockupCollectionViewTopSpace:layoutMargins:)();
}

uint64_t sub_10075ECC0()
{
  return type metadata accessor for SearchLockupListLayout.Metrics();
}

uint64_t sub_10075ECD0()
{
  return SearchLockupListLayout.init(metrics:iconHeadingView:titleHeadingView:lockupCollectionView:)();
}

uint64_t sub_10075ECE0()
{
  return type metadata accessor for SearchLockupListLayout();
}

uint64_t sub_10075ECF0()
{
  return dispatch thunk of SearchResultsPresenter.isCondensedSearchLockupsEnabled.getter();
}

uint64_t sub_10075ED00()
{
  return dispatch thunk of SearchResultsPresenter.shouldDisplayAppEvent(for:)();
}

uint64_t sub_10075ED10()
{
  return dispatch thunk of SearchResultsPresenter.didSelectResult(at:)();
}

uint64_t sub_10075ED20()
{
  return dispatch thunk of SearchResultsPresenter.transparencyLink.getter();
}

uint64_t sub_10075ED30()
{
  return dispatch thunk of SearchResultsPresenter.transparencyLinkIndex(columnCount:)();
}

uint64_t sub_10075ED40()
{
  return dispatch thunk of SearchResultsPresenter.shouldResultHaveCondensedAppearance(at:in:)();
}

uint64_t sub_10075ED50()
{
  return dispatch thunk of SearchResultsPresenter.result(at:)();
}

uint64_t sub_10075ED60()
{
  return SponsoredSearchOrganic.assetInformation.getter();
}

uint64_t sub_10075ED70()
{
  return SponsoredSearchOrganic.adamId.getter();
}

uint64_t sub_10075ED80()
{
  return type metadata accessor for SponsoredSearchOrganic();
}

uint64_t sub_10075ED90()
{
  return TextConfigurationTheme.init(from:)();
}

uint64_t sub_10075EDA0()
{
  return static TextConfigurationTheme.disabled.getter();
}

uint64_t sub_10075EDB0()
{
  return type metadata accessor for TextConfigurationTheme();
}

uint64_t sub_10075EDC0()
{
  return TodayCardActionOverlay.action.getter();
}

uint64_t sub_10075EDD0()
{
  return type metadata accessor for TodayCardActionOverlay();
}

uint64_t sub_10075EDE0()
{
  return TodayCardArtworkLayout.expandedLayoutInsets.getter();
}

uint64_t sub_10075EDF0()
{
  return TodayCardArtworkLayout.collapsedLayoutInsets.getter();
}

uint64_t sub_10075EE00()
{
  return TodayCardArtworkLayout.expandedContentMode.getter();
}

uint64_t sub_10075EE10()
{
  return TodayCardArtworkLayout.collapsedContentMode.getter();
}

uint64_t sub_10075EE20()
{
  return type metadata accessor for TodayCardArtworkLayout();
}

uint64_t sub_10075EE30()
{
  return TodayCardLockupOverlay.displaysIcon.getter();
}

uint64_t sub_10075EE40()
{
  return TodayCardLockupOverlay.lockup.getter();
}

uint64_t sub_10075EE50()
{
  return type metadata accessor for TodayCardLockupOverlay();
}

uint64_t sub_10075EE60()
{
  return AutoScrollConfiguration.init(isAutoScrollEnabled:autoScrollInterval:autoScrollRestartDelay:)();
}

uint64_t sub_10075EE70()
{
  return AutoScrollConfiguration.isAutoScrollEnabled.getter();
}

uint64_t sub_10075EE80()
{
  return AutoScrollConfiguration.autoScrollRestartDelay.getter();
}

uint64_t sub_10075EE90()
{
  return AutoScrollConfiguration.autoScrollInterval.getter();
}

uint64_t sub_10075EEA0()
{
  return type metadata accessor for AutoScrollConfiguration();
}

uint64_t sub_10075EEB0()
{
  return type metadata accessor for BadgeCaptionCappingType();
}

uint64_t sub_10075EEC0()
{
  return type metadata accessor for BadgeValueViewAlignment();
}

uint64_t sub_10075EED0()
{
  return dispatch thunk of ComponentModelContainer.children.getter();
}

uint64_t sub_10075EEE0()
{
  return ComponentPrefetchSizing.contentMode.getter();
}

uint64_t sub_10075EEF0()
{
  return ComponentPrefetchSizing.init(size:contentMode:)();
}

uint64_t sub_10075EF00()
{
  return ComponentPrefetchSizing.size.getter();
}

uint64_t sub_10075EF10()
{
  return type metadata accessor for ComponentPrefetchSizing();
}

uint64_t sub_10075EF20()
{
  return CrossfireReferralAction.referrerData.getter();
}

uint64_t sub_10075EF30()
{
  return type metadata accessor for CrossfireReferralAction();
}

uint64_t sub_10075EF40()
{
  return EditorialDisplayOptions.suppressLockup.getter();
}

uint64_t sub_10075EF50()
{
  return EditorialDisplayOptions.suppressTagline.getter();
}

uint64_t sub_10075EF60()
{
  return EditorialDisplayOptions.useMaterialBlur.getter();
}

uint64_t sub_10075EF70()
{
  return EditorialDisplayOptions.showBadgeInSmallCards.getter();
}

uint64_t sub_10075EF80()
{
  return type metadata accessor for EditorialDisplayOptions();
}

uint64_t sub_10075EF90()
{
  return FlowPresentationContext.presentationStyle.getter();
}

uint64_t sub_10075EFA0()
{
  return type metadata accessor for FlowPresentationContext();
}

uint64_t sub_10075EFB0()
{
  return HeroCarouselItemOverlay.OverlayType.displaysModuleGradient.getter();
}

uint64_t sub_10075EFC0()
{
  return type metadata accessor for HeroCarouselItemOverlay.OverlayType();
}

uint64_t sub_10075EFD0()
{
  return HeroCarouselItemOverlay.clickAction.getter();
}

uint64_t sub_10075EFE0()
{
  return HeroCarouselItemOverlay.overlayType.getter();
}

uint64_t sub_10075EFF0()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextAlignment.verticalStackAlignment.getter();
}

uint64_t sub_10075F000()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextAlignment.textAlignment(with:)();
}

uint64_t sub_10075F010()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.TextAlignment();
}

uint64_t sub_10075F020()
{
  return HeroCarouselItemOverlay.DisplayOptions.init(textAlignment:horizontalPlacement:textColorOverrides:isOverDarkContent:)();
}

uint64_t sub_10075F030()
{
  return HeroCarouselItemOverlay.DisplayOptions.textAlignment.getter();
}

uint64_t sub_10075F040()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.descriptionColor.getter();
}

uint64_t sub_10075F050()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.callToActionColor.getter();
}

uint64_t sub_10075F060()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.badgeColor.getter();
}

uint64_t sub_10075F070()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.titleColor.getter();
}

uint64_t sub_10075F080()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.init()();
}

uint64_t sub_10075F090()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides();
}

uint64_t sub_10075F0A0()
{
  return HeroCarouselItemOverlay.DisplayOptions.textColorOverrides.getter();
}

uint64_t sub_10075F0B0()
{
  return HeroCarouselItemOverlay.DisplayOptions.horizontalPlacement.getter();
}

uint64_t sub_10075F0C0()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.textAlignment(with:)();
}

uint64_t sub_10075F0D0()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.verticalStackAlignment.getter();
}

uint64_t sub_10075F0E0()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.value(with:)();
}

uint64_t sub_10075F0F0()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement();
}

uint64_t sub_10075F100()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions();
}

uint64_t sub_10075F110()
{
  return HeroCarouselItemOverlay.displayOptions.getter();
}

uint64_t sub_10075F120()
{
  return HeroCarouselItemOverlay.collectionIcons.getter();
}

uint64_t sub_10075F130()
{
  return HeroCarouselItemOverlay.descriptionText.getter();
}

uint64_t sub_10075F140()
{
  return HeroCarouselItemOverlay.callToActionText.getter();
}

uint64_t sub_10075F150()
{
  return HeroCarouselItemOverlay.impressionMetrics.getter();
}

uint64_t sub_10075F160()
{
  return HeroCarouselItemOverlay.lockup.getter();
}

uint64_t sub_10075F170()
{
  return HeroCarouselItemOverlay.badgeText.getter();
}

uint64_t sub_10075F180()
{
  return HeroCarouselItemOverlay.titleText.getter();
}

uint64_t sub_10075F190()
{
  return dispatch thunk of ItemBackgroundProviding.itemBackground.getter();
}

uint64_t sub_10075F1A0()
{
  return LargeHeroBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F1B0()
{
  return type metadata accessor for LargeHeroBreakoutLayout.DetailsVerticalPostion();
}

uint64_t sub_10075F1C0()
{
  return LargeHeroBreakoutLayout.Metrics.init(headerSpace:headerMaxWidth:detailPosition:detailsWidth:detailsVerticalPostion:layoutMargins:height:)();
}

uint64_t sub_10075F1D0()
{
  return type metadata accessor for LargeHeroBreakoutLayout.Metrics();
}

uint64_t sub_10075F1E0()
{
  return LargeHeroBreakoutLayout.init(metrics:backgroundMediaView:headerLabel:detailsView:)();
}

uint64_t sub_10075F1F0()
{
  return type metadata accessor for LargeHeroBreakoutLayout();
}

UIFont sub_10075F200(UITraitCollection compatibleWith)
{
  return MetadataRibbonTextStyle.font(compatibleWith:)(compatibleWith);
}

uint64_t sub_10075F210()
{
  return static MetadataRibbonTextStyle.useCase(_:)();
}

uint64_t sub_10075F220()
{
  return type metadata accessor for MetadataRibbonTextStyle();
}

uint64_t sub_10075F230()
{
  return PrivacyDefinitionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F240()
{
  return PrivacyDefinitionLayout.Metrics.init(titleTopSpace:definitionTopSpace:bottomMargin:maxTextWidth:)();
}

uint64_t sub_10075F250()
{
  return type metadata accessor for PrivacyDefinitionLayout.Metrics();
}

uint64_t sub_10075F260()
{
  return PrivacyDefinitionLayout.init(metrics:titleLabel:definitionLabel:)();
}

uint64_t sub_10075F270()
{
  return type metadata accessor for PrivacyDefinitionLayout();
}

uint64_t sub_10075F280()
{
  return ProductAnnotationLayout.ItemLayout.measurements(fitting:in:)();
}

uint64_t sub_10075F290()
{
  return ProductAnnotationLayout.ItemLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F2A0()
{
  return ProductAnnotationLayout.ItemLayout.Metrics.init(headingArtworkTopSpace:headingArtworkBottomSpace:textSpacing:listTextTopSpace:horizontalPairTextSpace:)();
}

uint64_t sub_10075F2B0()
{
  return type metadata accessor for ProductAnnotationLayout.ItemLayout.Metrics();
}

uint64_t sub_10075F2C0()
{
  return ProductAnnotationLayout.ItemLayout.init(metrics:headingText:headingArtwork:text:listText:leadingTextPairs:trailingTextPairs:)();
}

uint64_t sub_10075F2D0()
{
  return type metadata accessor for ProductAnnotationLayout.ItemLayout();
}

uint64_t sub_10075F2E0()
{
  return ProductAnnotationLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F2F0()
{
  return static ProductAnnotationLayout.isSummaryPlacedBelow(in:)();
}

uint64_t sub_10075F300()
{
  return ProductAnnotationLayout.Metrics.init(disclosureSize:disclosureContentInsets:disclosureMargin:titleSpace:detailSpace:detailMargin:linkSpace:bottomSpace:horizontalSpacing:shouldDisclosureAlignWithContent:)();
}

uint64_t sub_10075F310()
{
  return ProductAnnotationLayout.Metrics.disclosureSize.getter();
}

uint64_t sub_10075F320()
{
  return ProductAnnotationLayout.Metrics.disclosureSize.setter();
}

uint64_t sub_10075F330()
{
  return ProductAnnotationLayout.Metrics.horizontalSpacing.getter();
}

uint64_t sub_10075F340()
{
  return type metadata accessor for ProductAnnotationLayout.Metrics();
}

uint64_t sub_10075F350()
{
  return ProductAnnotationLayout.init(metrics:titleText:summaryText:detailViews:linkText:disclosureView:isExpanded:)();
}

uint64_t sub_10075F360()
{
  return type metadata accessor for ProductAnnotationLayout();
}

uint64_t sub_10075F370()
{
  return ProductCapabilityLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F380()
{
  return ProductCapabilityLayout.Metrics.init(iconSize:iconMargin:titleSpace:captionTopSpace:captionBottomSpace:bottomSpace:)();
}

uint64_t sub_10075F390()
{
  return ProductCapabilityLayout.Metrics.iconSize.setter();
}

uint64_t sub_10075F3A0()
{
  return type metadata accessor for ProductCapabilityLayout.Metrics();
}

uint64_t sub_10075F3B0()
{
  return ProductCapabilityLayout.init(metrics:iconView:titleText:captionText:)();
}

uint64_t sub_10075F3C0()
{
  return type metadata accessor for ProductCapabilityLayout();
}

uint64_t sub_10075F3D0()
{
  return RedownloadConfiguration.init(metrics:alignment:theme:)();
}

uint64_t sub_10075F3E0()
{
  return type metadata accessor for RedownloadConfiguration();
}

uint64_t sub_10075F3F0()
{
  return static RibbonBarItemCellLayout.interItemSpacing.getter();
}

uint64_t sub_10075F400()
{
  return static RibbonBarItemCellLayout.topPadding.getter();
}

uint64_t sub_10075F410()
{
  return static RibbonBarItemCellLayout.bottomPadding.getter();
}

uint64_t sub_10075F420()
{
  return RibbonBarItemCellLayout.Metrics.init(artworkSize:interimSpacing:leadingSpacing:trailingSpacing:artworkBottomSpacing:artworkTopSpacing:labelBottomSpacing:labelTopSpacing:)();
}

uint64_t sub_10075F430()
{
  return RibbonBarItemCellLayout.Metrics.artworkSize.getter();
}

uint64_t sub_10075F440()
{
  return RibbonBarItemCellLayout.Metrics.trailingSpacing.getter();
}

uint64_t sub_10075F450()
{
  return type metadata accessor for RibbonBarItemCellLayout.Metrics();
}

uint64_t sub_10075F460()
{
  return RibbonBarItemCellLayout.init(metrics:artwork:titleLabel:)();
}

uint64_t sub_10075F470()
{
  return type metadata accessor for RibbonBarItemCellLayout();
}

uint64_t sub_10075F480()
{
  return ScreenshotsDisplayStyle.shouldShowScreenshots.getter();
}

uint64_t sub_10075F490()
{
  return type metadata accessor for ScreenshotsDisplayStyle();
}

uint64_t sub_10075F4A0()
{
  return ShareSheetNotesMetadata.url.getter();
}

uint64_t sub_10075F4B0()
{
  return ShareSheetNotesMetadata.category.getter();
}

uint64_t sub_10075F4C0()
{
  return ShareSheetNotesMetadata.fileSize.getter();
}

uint64_t sub_10075F4D0()
{
  return ShareSheetNotesMetadata.itemName.getter();
}

uint64_t sub_10075F4E0()
{
  return ShareSheetNotesMetadata.developer.getter();
}

uint64_t sub_10075F4F0()
{
  return ShareSheetNotesMetadata.mediaType.getter();
}

uint64_t sub_10075F500()
{
  return SmallSearchLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F510()
{
  return SmallSearchLockupLayout.Metrics.init(artworkSize:artworkMargin:headingSpace:titleRegularSpace:titleMediumSpace:titleShortSpace:titleWithHeadingSpace:subtitleSpace:tertiaryTitleSpace:offerTextSpace:metadataTextSpace:bottomSpace:offerButtonSize:offerButtonMargin:userRatingRightMargin:editorsChoiceMargin:adButtonRightMargin:descriptionSpace:regularWidthColumnSpacing:descriptionTopMargin:)();
}

uint64_t sub_10075F520()
{
  return SmallSearchLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_10075F530()
{
  return SmallSearchLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_10075F540()
{
  return type metadata accessor for SmallSearchLockupLayout.Metrics();
}

uint64_t sub_10075F550()
{
  return SmallSearchLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:userRatingView:ratingCountLabel:editorsChoiceView:adButton:description:includesRatings:metadataRibbonView:searchTagsRibbonView:includesMetadataRibbon:includesSearchTagsRibbon:includesMetadataInformationInLockup:)();
}

uint64_t sub_10075F560()
{
  return type metadata accessor for SmallSearchLockupLayout();
}

uint64_t sub_10075F570()
{
  return TitledButtonStackLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F580()
{
  return TitledButtonStackLayout.Metrics.init(buttonHeight:horizontalInterItemSpace:verticalInterItemSpace:maximumButtonWidth:)();
}

uint64_t sub_10075F590()
{
  return TitledButtonStackLayout.Metrics.buttonHeight.getter();
}

uint64_t sub_10075F5A0()
{
  return type metadata accessor for TitledButtonStackLayout.Metrics();
}

uint64_t sub_10075F5B0()
{
  return TitledButtonStackLayout.init(metrics:items:lineBreaks:)();
}

uint64_t sub_10075F5C0()
{
  return type metadata accessor for TitledButtonStackLayout();
}

uint64_t sub_10075F5D0()
{
  return static VerticalFlexStackLayout.estimatedChildFitCount(in:metrics:)();
}

uint64_t sub_10075F5E0()
{
  return VerticalFlexStackLayout.place(at:with:)();
}

uint64_t sub_10075F5F0()
{
  return VerticalFlexStackLayout.Metrics.init(fixedChildHeight:minInterChildSpacing:maxInterChildSpacing:layoutMargins:)();
}

uint64_t sub_10075F600()
{
  return type metadata accessor for VerticalFlexStackLayout.Metrics();
}

uint64_t sub_10075F610()
{
  return VerticalFlexStackLayout.init(metrics:children:)();
}

uint64_t sub_10075F620()
{
  return type metadata accessor for VerticalFlexStackLayout();
}

uint64_t sub_10075F630()
{
  return tryToCancelArtworkFetch(into:on:asPartOf:deprioritizingFetches:)();
}

uint64_t sub_10075F640()
{
  return AccessibilityConditional.init(value:ax1To3Value:ax4To5Value:)();
}

uint64_t sub_10075F650()
{
  return AccessibilityConditional.value(for:)();
}

uint64_t sub_10075F660()
{
  return AccessibilityConditional.value(with:)();
}

uint64_t sub_10075F670()
{
  return AccessibilityConditional.init(value:axValue:)();
}

uint64_t sub_10075F680()
{
  return type metadata accessor for AccessibilityConditional();
}

uint64_t sub_10075F690()
{
  return AchievementSummaryLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F6A0()
{
  return static AchievementSummaryLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_10075F6B0()
{
  return AchievementSummaryLayout.Metrics.init(achievementStackInsets:outOfTotalLeadingMargin:chevronLeadingMargin:chevronTrailingMargin:componentHeight:)();
}

uint64_t sub_10075F6C0()
{
  return AchievementSummaryLayout.Metrics.achievementStackInsets.setter();
}

uint64_t sub_10075F6D0()
{
  return type metadata accessor for AchievementSummaryLayout.Metrics();
}

uint64_t sub_10075F6E0()
{
  return AchievementSummaryLayout.init(metrics:achievementGroupView:numberCompletedLabel:outOfTotalLabel:completedLabel:chevronView:)();
}

uint64_t sub_10075F6F0()
{
  return type metadata accessor for AchievementSummaryLayout();
}

uint64_t sub_10075F700()
{
  return dispatch thunk of AdvertRotationController.didInteractWithAdvert()();
}

uint64_t sub_10075F710()
{
  return dispatch thunk of AdvertRotationController.currentAdvert.getter();
}

uint64_t sub_10075F720()
{
  return dispatch thunk of AdvertRotationController.didApplyCell(_:in:)();
}

uint64_t sub_10075F730()
{
  return dispatch thunk of AdvertRotationController.didEndDisplaying(_:in:)();
}

uint64_t sub_10075F740()
{
  return ArcadeSubscribePresenter.init(objectGraph:subscriptionManager:url:sidepack:)();
}

uint64_t sub_10075F750()
{
  return ArcadeSubscribePresenter.isAskToBuyRequest.getter();
}

uint64_t sub_10075F760()
{
  return ArcadeSubscribePresenter.view.setter();
}

void sub_10075F770()
{
}

uint64_t sub_10075F780()
{
  return type metadata accessor for ArcadeSubscribePresenter();
}

uint64_t sub_10075F790()
{
  return type metadata accessor for ArcadeTrialEnrolledState();
}

void sub_10075F7A0()
{
}

uint64_t sub_10075F7C0()
{
  return dispatch thunk of BaseGenericPagePresenter.uber.getter();
}

uint64_t sub_10075F7D0()
{
  return dispatch thunk of BaseGenericPagePresenter.view.setter();
}

uint64_t sub_10075F7E0()
{
  return dispatch thunk of BaseGenericPagePresenter.pageTitle.getter();
}

uint64_t sub_10075F7F0()
{
  return type metadata accessor for DirectionalTextAlignment();
}

uint64_t sub_10075F800()
{
  return EditorialStoryCardLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075F810()
{
  return EditorialStoryCardLayout.Metrics.init(headerSpace:titleSpace:descriptionSpace:layoutMargins:)();
}

uint64_t sub_10075F820()
{
  return type metadata accessor for EditorialStoryCardLayout.Metrics();
}

uint64_t sub_10075F830()
{
  return EditorialStoryCardLayout.init(metrics:artworkView:headerLabel:titleLabel:descriptionLabel:)();
}

uint64_t sub_10075F840()
{
  return type metadata accessor for EditorialStoryCardLayout();
}

uint64_t sub_10075F850()
{
  return dispatch thunk of static EstimatedHeightProviding.estimatedHeight(in:asPartOf:)();
}

uint64_t sub_10075F860()
{
  return type metadata accessor for FamilyCircleLookupResult();
}

uint64_t sub_10075F870()
{
  return dispatch thunk of FamilyPurchasesPresenter.familyPurchasesSection(for:)();
}

uint64_t sub_10075F880()
{
  return dispatch thunk of FamilyPurchasesPresenter.imageForFamilyMember(at:)();
}

uint64_t sub_10075F890()
{
  return FamilyPurchasesPresenter.init(objectGraph:familyPurchasesError:iCloudMemberAppleId:bag:)();
}

uint64_t sub_10075F8A0()
{
  return dispatch thunk of FamilyPurchasesPresenter.numberOfRows(in:)();
}

uint64_t sub_10075F8B0()
{
  return dispatch thunk of FamilyPurchasesPresenter.didSelectItem(at:)();
}

uint64_t sub_10075F8C0()
{
  return dispatch thunk of FamilyPurchasesPresenter.numberOfSections.getter();
}

uint64_t sub_10075F8D0()
{
  return dispatch thunk of FamilyPurchasesPresenter.errorBannerLinkableText.getter();
}

uint64_t sub_10075F8E0()
{
  return dispatch thunk of FamilyPurchasesPresenter.view.setter();
}

uint64_t sub_10075F8F0()
{
  return dispatch thunk of FamilyPurchasesPresenter.title(forSection:)();
}

uint64_t sub_10075F900()
{
  return dispatch thunk of FamilyPurchasesPresenter.title(forItemAt:)();
}

uint64_t sub_10075F910()
{
  return dispatch thunk of FamilyPurchasesPresenter.pageTitle.getter();
}

uint64_t sub_10075F920()
{
  return type metadata accessor for FamilyPurchasesPresenter();
}

uint64_t sub_10075F930()
{
  return dispatch thunk of FlowPreviewablePresenter.actionPresenterView.getter();
}

uint64_t sub_10075F940()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewBackgroundColor(at:)();
}

uint64_t sub_10075F950()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewDestinationForItem(at:)();
}

uint64_t sub_10075F960()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewActionsConfiguration(at:sender:)();
}

uint64_t sub_10075F970()
{
  return MSODiffablePagePresenter.init(objectGraph:personalizationProvider:pageUrl:context:)();
}

uint64_t sub_10075F980()
{
  return type metadata accessor for MSODiffablePagePresenter();
}

uint64_t sub_10075F990()
{
  return MarketingItemRequestInfo.offerHints.getter();
}

uint64_t sub_10075F9A0()
{
  return MarketingItemRequestInfo.serviceType.getter();
}

uint64_t sub_10075F9B0()
{
  return MarketingItemRequestInfo.clientOptions.getter();
}

uint64_t sub_10075F9C0()
{
  return MarketingItemRequestInfo.metricsOverlay.getter();
}

uint64_t sub_10075F9D0()
{
  return MarketingItemRequestInfo.onDismissalAction.getter();
}

uint64_t sub_10075F9E0()
{
  return MarketingItemRequestInfo.purchaseFailureAction.getter();
}

uint64_t sub_10075F9F0()
{
  return MarketingItemRequestInfo.purchaseSuccessAction.getter();
}

uint64_t sub_10075FA00()
{
  return MarketingItemRequestInfo.carrierLinkFailureAction.getter();
}

uint64_t sub_10075FA10()
{
  return MarketingItemRequestInfo.carrierLinkSuccessAction.getter();
}

uint64_t sub_10075FA20()
{
  return MarketingItemRequestInfo.seed.getter();
}

uint64_t sub_10075FA30()
{
  return MarketingItemRequestInfo.placement.getter();
}

uint64_t sub_10075FA40()
{
  return type metadata accessor for MarketingItemRequestInfo();
}

uint64_t sub_10075FA50()
{
  return MetadataRibbonViewLayout.init(metadataRibbonItemLayoutContexts:metrics:)();
}

uint64_t sub_10075FA60()
{
  return MetadataRibbonViewLayout.measurements(fitting:in:)();
}

uint64_t sub_10075FA70()
{
  return MetadataRibbonViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075FA80()
{
  return MetadataRibbonViewLayout.Metrics.maximumNumberOfItems.getter();
}

uint64_t _s22SubscribePageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0()
{
  return static MetadataRibbonViewLayout.Metrics.standard.getter();
}

uint64_t sub_10075FAA0()
{
  return type metadata accessor for MetadataRibbonViewLayout.Metrics();
}

uint64_t sub_10075FAB0()
{
  return type metadata accessor for MetadataRibbonViewLayout();
}

uint64_t sub_10075FAC0()
{
  return dispatch thunk of OfferButtonConfiguration.shouldReapply(sizeChanged:)();
}

uint64_t sub_10075FAD0()
{
  return dispatch thunk of OfferButtonConfiguration.disableAnimations(whenUpdatingFrom:)();
}

uint64_t sub_10075FAE0()
{
  return dispatch thunk of OfferButtonConfiguration.size(in:)();
}

uint64_t sub_10075FAF0()
{
  return dispatch thunk of OfferButtonConfiguration.apply<A>(to:)();
}

uint64_t sub_10075FB00()
{
  return dispatch thunk of OfferButtonConfiguration.layout<A>(button:in:disableAnimations:)();
}

uint64_t sub_10075FB10()
{
  return dispatch thunk of OfferButtonConfiguration.isEqual(to:with:)();
}

uint64_t sub_10075FB20()
{
  return dispatch thunk of OfferButtonConfiguration.reapply<A>(colorsTo:)();
}

uint64_t sub_10075FB30()
{
  return dispatch thunk of OfferButtonConfiguration.unapply<A>(to:)();
}

uint64_t sub_10075FB40()
{
  return static PageFacetsFieldsProvider.metricsPipelineWithPageFacetsProvider(using:currentPipeline:)();
}

uint64_t sub_10075FB50()
{
  return PreorderDisclaimerLayout.init(disclaimer:)();
}

uint64_t sub_10075FB60()
{
  return PreorderDisclaimerLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075FB70()
{
  return type metadata accessor for PreorderDisclaimerLayout();
}

uint64_t sub_10075FB80()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.measurements(fitting:in:)();
}

uint64_t sub_10075FB90()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075FBA0()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.Metrics.init(primaryTextSpace:secondaryTextSpace:disclosureMargin:disclosureSize:)();
}

uint64_t sub_10075FBB0()
{
  return type metadata accessor for ProductDescriptionLayout.DeveloperLinkLayout.Metrics();
}

uint64_t sub_10075FBC0()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.init(metrics:primaryText:secondaryText:disclosureView:)();
}

uint64_t sub_10075FBD0()
{
  return type metadata accessor for ProductDescriptionLayout.DeveloperLinkLayout();
}

uint64_t sub_10075FBE0()
{
  return ProductDescriptionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10075FBF0()
{
  return ProductDescriptionLayout.Metrics.init(topPadding:developerTopPadding:horizontalTextPadding:horizontalDeveloperSpace:)();
}

uint64_t sub_10075FC00()
{
  return type metadata accessor for ProductDescriptionLayout.Metrics();
}

uint64_t sub_10075FC10()
{
  return ProductDescriptionLayout.init(metrics:bodyText:developerLink:)();
}

uint64_t sub_10075FC20()
{
  return type metadata accessor for ProductDescriptionLayout();
}

uint64_t sub_10075FC30()
{
  return ProductNavigationBarMode.rawValue.getter();
}

uint64_t sub_10075FC40()
{
  return ProductPageIconDimension.rawValue.getter();
}

uint64_t sub_10075FC50()
{
  return type metadata accessor for ProductPageIconDimension();
}

uint64_t sub_10075FC60()
{
  return ReusableCellRegistration.init(reuseIdentifier:configurationHandler:)();
}

uint64_t sub_10075FC70()
{
  return SearchResultsContextCard.action.getter();
}

uint64_t sub_10075FC80()
{
  return SearchResultsContextCard.message.getter();
}

uint64_t sub_10075FC90()
{
  return type metadata accessor for SearchResultsContextCard();
}

uint64_t sub_10075FCA0()
{
  return dispatch thunk of ShelfBackgroundProviding.shelfBackground.getter();
}

uint64_t sub_10075FCB0()
{
  return UnifiedTabBadgingManager.didVisit(_:)();
}

uint64_t sub_10075FCC0()
{
  return type metadata accessor for UnifiedTabBadgingManager();
}

uint64_t sub_10075FCD0()
{
  return static UserNotificationsManager.userNotificationsDidChangeNotification.getter();
}

uint64_t sub_10075FCE0()
{
  return UserNotificationsManager.init(objectGraph:rootViewController:)();
}

uint64_t sub_10075FCF0()
{
  return static UserNotificationsManager.appEventIdKey.getter();
}

uint64_t sub_10075FD00()
{
  return static UserNotificationsManager.sourceViewKey.getter();
}

uint64_t sub_10075FD10()
{
  return UserNotificationsManager.getIsAuthorized()();
}

uint64_t sub_10075FD20()
{
  return type metadata accessor for UserNotificationsManager.SchedulingResult();
}

uint64_t sub_10075FD30()
{
  return UserNotificationsManager.scheduleNotification(with:from:)();
}

uint64_t sub_10075FD40()
{
  return UserNotificationsManager.hasScheduledNotification(with:)();
}

uint64_t sub_10075FD50()
{
  return UserNotificationsManager.cancelScheduledNotification(with:from:)();
}

uint64_t sub_10075FD60()
{
  return type metadata accessor for UserNotificationsManager();
}

uint64_t sub_10075FD70()
{
  return dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo()();
}

uint64_t sub_10075FD80()
{
  return dispatch thunk of VideoPlaybackCoordinator.startAutoPlayVideo()();
}

uint64_t sub_10075FD90()
{
  return dispatch thunk of VideoPlaybackCoordinator.unregisterAllVideoViews()();
}

uint64_t sub_10075FDA0()
{
  return dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo()();
}

uint64_t sub_10075FDB0()
{
  return dispatch thunk of VideoPlaybackCoordinator.shouldLoopSingleVideo.setter();
}

uint64_t sub_10075FDC0()
{
  return dispatch thunk of VideoPlaybackCoordinator.unregister(videoView:videoContainer:pausingPlayback:)();
}

uint64_t sub_10075FDD0()
{
  return dispatch thunk of VideoPlaybackCoordinator.isAutoPlayEnabled.setter();
}

uint64_t sub_10075FDE0()
{
  return VideoPlaybackCoordinator.init(isGlobalAutoPlayEnabled:metricsPipeline:)();
}

uint64_t sub_10075FDF0()
{
  return dispatch thunk of VideoPlaybackCoordinator.setParentViewController(_:)();
}

uint64_t sub_10075FE00()
{
  return dispatch thunk of VideoPlaybackCoordinator.register(videoView:videoContainer:)();
}

uint64_t sub_10075FE10()
{
  return dispatch thunk of VideoPlaybackCoordinator.isPlaying(in:)();
}

uint64_t sub_10075FE20()
{
  return type metadata accessor for VideoPlaybackCoordinator();
}

uint64_t sub_10075FE30(Swift::String _, Swift::Int count, Swift::String comment)
{
  return localizedStringWithCount(_:count:comment:)(_, count, comment)._countAndFlagsBits;
}

void sub_10075FE40()
{
}

uint64_t sub_10075FE50()
{
  return ArcadeDownloadPackStorage.init()();
}

uint64_t sub_10075FE60()
{
  return type metadata accessor for ArcadeDownloadPackStorage();
}

uint64_t sub_10075FE70()
{
  return ArcadeOfferLabelPresenter.init(subscribedText:nonsubscribedText:subscriptionManager:)();
}

uint64_t sub_10075FE80()
{
  return ArcadeOfferLabelPresenter.view.setter();
}

uint64_t sub_10075FE90()
{
  return type metadata accessor for ArcadeOfferLabelPresenter();
}

uint64_t sub_10075FEA0()
{
  return ArcadeSubscriptionManager.addSubscriptionStateObserver(_:action:)();
}

uint64_t sub_10075FEB0()
{
  return ArcadeSubscriptionManager.setSubscriptionState(_:notifyingObservers:)();
}

uint64_t sub_10075FEC0()
{
  return ArcadeSubscriptionManager.init(arcadeSubscriptionFamilyId:subscriptionEntitlements:activeStoreAccountProvider:)();
}

uint64_t sub_10075FED0()
{
  return ArcadeSubscriptionManager.removeSubscriptionStateActions(for:)();
}

uint64_t sub_10075FEE0()
{
  return ArcadeSubscriptionManager.purchaseSubscription(product:appAdamId:decorator:callbacks:dialogHandler:)();
}

uint64_t sub_10075FEF0()
{
  return ArcadeSubscriptionManager.PaymentCallbacks.init(success:failure:)();
}

uint64_t sub_10075FF00()
{
  return type metadata accessor for ArcadeSubscriptionManager.PaymentCallbacks();
}

uint64_t sub_10075FF10()
{
  return ArcadeSubscriptionManager.subscriptionState.getter();
}

uint64_t sub_10075FF20()
{
  return ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)();
}

uint64_t sub_10075FF30()
{
  return type metadata accessor for ArcadeSubscriptionManager();
}

uint64_t sub_10075FF40()
{
  return CappedSizeStaticDimension.init(constant:source:maxSizeCategory:)();
}

uint64_t sub_10075FF50()
{
  return type metadata accessor for CappedSizeStaticDimension();
}

uint64_t sub_10075FF60()
{
  return static ChartOrCategoryBrickStyle.tileMetrics.getter();
}

uint64_t sub_10075FF70()
{
  return type metadata accessor for ChartOrCategoryBrickStyle();
}

uint64_t sub_10075FF80()
{
  return dispatch thunk of ComponentModelContainment.contentType(for:)();
}

uint64_t sub_10075FF90()
{
  return dispatch thunk of ComponentModelContainment.numberOfItems.getter();
}

uint64_t sub_10075FFA0()
{
  return dispatch thunk of ComponentModelContainment.model(at:)();
}

uint64_t sub_10075FFB0()
{
  return ContingentOfferDetailPage.contingentOffer.getter();
}

uint64_t sub_10075FFC0()
{
  return ContingentOfferDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_10075FFD0()
{
  return ContingentOfferDetailPage.learnMoreActionMetrics.getter();
}

uint64_t sub_10075FFE0()
{
  return ContingentOfferDetailPage.backButtonActionMetrics.getter();
}

uint64_t sub_10075FFF0()
{
  return ContingentOfferDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_100760000()
{
  return ContingentOfferDetailPage.closeButtonActionMetrics.getter();
}

uint64_t sub_100760010()
{
  return ContingentOfferDetailPage.video.getter();
}

uint64_t sub_100760020()
{
  return ContingentOfferDetailPage.artwork.getter();
}

uint64_t sub_100760030()
{
  return type metadata accessor for ContingentOfferDetailPage();
}

uint64_t sub_100760040()
{
  return CreateCalendarEventAction.notAuthorizedAction.getter();
}

void sub_100760050()
{
}

uint64_t sub_100760060()
{
  return DebugMetricsEventRecorder.$events.getter();
}

uint64_t sub_100760070()
{
  return type metadata accessor for DebugMetricsEventRecorder();
}

uint64_t sub_100760080()
{
  return type metadata accessor for EditorialSearchResultType();
}

uint64_t sub_100760090()
{
  return FlowPreviewOfferPresenter.offerTitles.getter();
}

uint64_t sub_1007600A0()
{
  return FlowPreviewOfferPresenter.performAction(in:)();
}

uint64_t sub_1007600B0()
{
  return FlowPreviewOfferPresenter.init(displayProperties:offerAction:asPartOf:)();
}

uint64_t sub_1007600C0()
{
  return type metadata accessor for FlowPreviewOfferPresenter();
}

uint64_t sub_1007600D0()
{
  return type metadata accessor for HorizontalAlignmentLayout.HorizontalGravity();
}

uint64_t sub_1007600E0()
{
  return static HorizontalAlignmentLayout.SizingPolicy.policy(priority:constrainedTo:)();
}

uint64_t sub_1007600F0()
{
  return type metadata accessor for HorizontalAlignmentLayout.SizingPolicy.Priority();
}

uint64_t sub_100760100()
{
  return type metadata accessor for HorizontalAlignmentLayout.SizingPolicy();
}

uint64_t sub_100760110()
{
  return static HorizontalAlignmentLayout.VerticalAnchor.anchor(child:at:)();
}

uint64_t sub_100760120()
{
  return type metadata accessor for HorizontalAlignmentLayout.VerticalAnchor();
}

uint64_t sub_100760130()
{
  return type metadata accessor for HorizontalAlignmentLayout.ChildSourceOffset();
}

uint64_t sub_100760140()
{
  return type metadata accessor for HorizontalAlignmentLayout.ContainerDestinationOffset();
}

uint64_t sub_100760150()
{
  return static HorizontalAlignmentLayout.Child.child(view:leadingSpace:trailingSpace:verticalAnchor:horizontalGravity:sizingPolicy:)();
}

uint64_t sub_100760160()
{
  return type metadata accessor for HorizontalAlignmentLayout.Child();
}

uint64_t sub_100760170()
{
  return HorizontalAlignmentLayout.init(children:)();
}

uint64_t sub_100760180()
{
  return type metadata accessor for HorizontalAlignmentLayout();
}

uint64_t sub_100760190()
{
  return HttpTemplateSubstitutions.setParameter(value:for:)();
}

uint64_t sub_1007601A0()
{
  return HttpTemplateSubstitutions.init(urlQuery:headers:jsonBody:formBody:)();
}

uint64_t sub_1007601B0()
{
  return type metadata accessor for HttpTemplateSubstitutions();
}

void sub_1007601C0(UIScrollView in)
{
}

uint64_t sub_1007601D0()
{
  return ImpressionsScrollObserver.collectionView.setter();
}

uint64_t sub_1007601E0()
{
  return type metadata accessor for ImpressionsScrollObserver();
}

uint64_t sub_1007601F0()
{
  return ImpressionsScrollObserver.init(_:)();
}

uint64_t sub_100760200()
{
  return dispatch thunk of ItemSupplementaryProvider.supplementaryItems(for:asPartOf:)();
}

uint64_t sub_100760210()
{
  return dispatch thunk of ItemSupplementaryProvider.supplementaryRegistration(for:in:asPartOf:)();
}

uint64_t sub_100760220()
{
  return dispatch thunk of ManagedVideoViewProviding.registerVideos(with:)();
}

uint64_t sub_100760230()
{
  return dispatch thunk of ManagedVideoViewProviding.unregisterVideos(with:)();
}

uint64_t sub_100760240()
{
  return dispatch thunk of NestedShelfClickableModel.click(for:)();
}

uint64_t sub_100760250()
{
  return type metadata accessor for ProductPageScrollPosition();
}

uint64_t sub_100760260()
{
  return ProductReviewCustomLayout.Metrics.init(horizontalContentPadding:verticalContentPadding:ratingsTopSpace:dateAuthorLeadingPadding:dateAuthorTopPadding:ratingsAccessibilityTopPadding:dateAccessibilityTopPadding:bodyTopPadding:responseTitleTopPadding:responseTitleAccessibilityTopPadding:responseDateAccessibilityTopPadding:responseBodyTopPadding:)();
}

uint64_t sub_100760270()
{
  return ProductReviewCustomLayout.Metrics.horizontalContentPadding.setter();
}

uint64_t sub_100760280()
{
  return type metadata accessor for ProductReviewCustomLayout.Metrics();
}

uint64_t sub_100760290()
{
  return ProductReviewCustomLayout.init(metrics:titleLabel:dateLabel:authorLabel:dateAuthorLabel:bodyLabel:responseTitleLabel:responseDateLabel:responseBodyLabel:hasResponse:ratingsView:)();
}

uint64_t sub_1007602A0()
{
  return type metadata accessor for ProductReviewCustomLayout();
}

uint64_t sub_1007602B0()
{
  return dispatch thunk of PurchasableTodayCardMedia.offerAdamIds.getter();
}

uint64_t sub_1007602C0()
{
  return PurchasesContentPresenter.canHidePurchases.getter();
}

uint64_t sub_1007602D0()
{
  return PurchasesContentPresenter.purchasesContentModes.getter();
}

uint64_t sub_1007602E0()
{
  return PurchasesContentPresenter.init(objectGraph:accountStore:appStateController:familyMember:purchaseHistory:showMacOSCompatibleIOSApps:appleSilicon:)();
}

uint64_t sub_1007602F0()
{
  return PurchasesContentPresenter.hidePurchase(at:)();
}

uint64_t sub_100760300()
{
  return PurchasesContentPresenter.sectionCount.getter();
}

uint64_t sub_100760310()
{
  return PurchasesContentPresenter.unhidePurchase(at:)();
}

uint64_t sub_100760320()
{
  return PurchasesContentPresenter.mode.getter();
}

uint64_t sub_100760330()
{
  return PurchasesContentPresenter.mode.setter();
}

uint64_t sub_100760340()
{
  return PurchasesContentPresenter.term.setter();
}

uint64_t sub_100760350()
{
  return PurchasesContentPresenter.view.setter();
}

void sub_100760360()
{
}

uint64_t sub_100760370()
{
  return PurchasesContentPresenter.pageTitle.getter();
}

void sub_100760380()
{
}

uint64_t sub_100760390()
{
  return type metadata accessor for PurchasesContentPresenter();
}

uint64_t sub_1007603A0()
{
  return static RenderPipelineDiagnostics.errorDidOccurNotification.getter();
}

uint64_t sub_1007603B0()
{
  return static RenderPipelineDiagnostics.incidentsDidOccurNotification.getter();
}

uint64_t sub_1007603C0()
{
  return static RenderPipelineDiagnostics.error(of:)();
}

uint64_t sub_1007603D0()
{
  return RenderPipelineDiagnostics.Recorder.snapshot()();
}

uint64_t sub_1007603E0()
{
  return RenderPipelineDiagnostics.Recorder.init()();
}

uint64_t sub_1007603F0()
{
  return type metadata accessor for RenderPipelineDiagnostics.Recorder();
}

uint64_t sub_100760400()
{
  return static RenderPipelineDiagnostics.incidents(of:)();
}

uint64_t sub_100760410()
{
  return ShareSheetArticleMetadata.id.getter();
}

uint64_t sub_100760420()
{
  return ShareSheetArticleMetadata.text.getter();
}

uint64_t sub_100760430()
{
  return ShareSheetArticleMetadata.artwork.getter();
}

uint64_t sub_100760440()
{
  return ShareSheetArticleMetadata.subtitle.getter();
}

uint64_t sub_100760450()
{
  return ShareSheetProductMetadata.isMessagesOnlyApp.getter();
}

uint64_t sub_100760460()
{
  return ShareSheetProductMetadata.notesMetadata.getter();
}

uint64_t sub_100760470()
{
  return ShareSheetProductMetadata.messagesAppIcon.getter();
}

uint64_t sub_100760480()
{
  return ShareSheetProductMetadata.screenshots.getter();
}

uint64_t sub_100760490()
{
  return ShareSheetProductMetadata.storeFrontIdentifier.getter();
}

uint64_t sub_1007604A0()
{
  return ShareSheetProductMetadata.icon.getter();
}

uint64_t sub_1007604B0()
{
  return ShareSheetProductMetadata.name.getter();
}

uint64_t sub_1007604C0()
{
  return ShareSheetProductMetadata.adamId.getter();
}

uint64_t sub_1007604D0()
{
  return ShareSheetProductMetadata.videos.getter();
}

uint64_t sub_1007604E0()
{
  return ShareSheetProductMetadata.Platform.rawValue.getter();
}

uint64_t sub_1007604F0()
{
  return type metadata accessor for ShareSheetProductMetadata.Platform();
}

uint64_t sub_100760500()
{
  return ShareSheetProductMetadata.platform.getter();
}

uint64_t sub_100760510()
{
  return ShareSheetProductMetadata.subtitle.getter();
}

uint64_t sub_100760520()
{
  return ShareSheetProductMetadata.genreName.getter();
}

uint64_t sub_100760530()
{
  return dispatch thunk of TimedMetricsPagePresenter.pageRenderMetrics.getter();
}

uint64_t sub_100760540()
{
  return dispatch thunk of TimedMetricsPagePresenter.pendingPageRender.getter();
}

uint64_t sub_100760550()
{
  return dispatch thunk of TimedMetricsPagePresenter.metricsPipeline.getter();
}

uint64_t sub_100760560()
{
  return dispatch thunk of TimedMetricsPagePresenter.advertRotationData.setter();
}

uint64_t sub_100760570()
{
  return TimedMetricsPagePresenter.impressionsTracker.getter();
}

uint64_t sub_100760580()
{
  return TimedMetricsPagePresenter.onUpdatePhaseChanged.getter();
}

uint64_t sub_100760590()
{
  return TimedMetricsPagePresenter.impressionsCalculator.getter();
}

uint64_t sub_1007605A0()
{
  return dispatch thunk of TimedMetricsPagePresenter.update(ignoringCache:)();
}

uint64_t sub_1007605B0()
{
  return dispatch thunk of TimedMetricsPagePresenter.didLoad()();
}

uint64_t sub_1007605C0()
{
  return dispatch thunk of TimedMetricsPagePresenter.referrer.setter();
}

uint64_t sub_1007605D0()
{
  return dispatch thunk of TodayCardMediaWithArtwork.artworkLayoutsWithMetrics.getter();
}

uint64_t sub_1007605E0()
{
  return TodayCardMediaWithArtwork.prefetchableArtwork(for:)();
}

uint64_t sub_1007605F0()
{
  return TodayCardMediaWithArtwork.video(for:)();
}

uint64_t sub_100760600()
{
  return TodayCardMediaWithArtwork.artwork(for:)();
}

uint64_t sub_100760610()
{
  return TodayCardParagraphOverlay.style.getter();
}

uint64_t sub_100760620()
{
  return TodayCardParagraphOverlay.paragraph.getter();
}

uint64_t sub_100760630()
{
  return type metadata accessor for TodayCardParagraphOverlay();
}

uint64_t sub_100760640()
{
  return TodayCardThreeLineOverlay.description.getter();
}

uint64_t sub_100760650()
{
  return TodayCardThreeLineOverlay.title.getter();
}

uint64_t sub_100760660()
{
  return TodayCardThreeLineOverlay.heading.getter();
}

uint64_t sub_100760670()
{
  return static ViewControllerContainment.add(_:to:frame:)();
}

uint64_t sub_100760680()
{
  return static ViewControllerContainment.remove(_:)();
}

uint64_t sub_100760690(NSNumber_optional a1, Swift::Int a2)
{
  return localizedStringForDecimal(_:_:)(a1, a2).value._countAndFlagsBits;
}

uint64_t sub_1007606A0()
{
  return AccountSectionInfoListItem.title.getter();
}

uint64_t sub_1007606B0()
{
  return AccountSectionInfoListItem.value.getter();
}

uint64_t sub_1007606C0()
{
  return AdvertActionMetricsHandler.processAdActionMetrics(_:then:)();
}

uint64_t sub_1007606D0()
{
  return AdvertActionMetricsHandler.init(reporters:)();
}

uint64_t sub_1007606E0()
{
  return type metadata accessor for AdvertActionMetricsHandler();
}

uint64_t sub_1007606F0()
{
  return ArcadeDownloadPackCategory.gradientEndColor.getter();
}

uint64_t sub_100760700()
{
  return ArcadeDownloadPackCategory.impressionMetrics.getter();
}

uint64_t sub_100760710()
{
  return ArcadeDownloadPackCategory.gradientStartColor.getter();
}

uint64_t sub_100760720()
{
  return ArcadeDownloadPackCategory.id.getter();
}

uint64_t sub_100760730()
{
  return ArcadeDownloadPackCategory.title.getter();
}

uint64_t sub_100760740()
{
  return ArcadeDownloadPackCategory.artwork.getter();
}

uint64_t sub_100760750()
{
  return ArcadeWelcomeContentLayout.measurements(fitting:in:)();
}

uint64_t sub_100760760()
{
  return ArcadeWelcomeContentLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100760770()
{
  return ArcadeWelcomeContentLayout.Metrics.init(titleTopSpace:titleInsets:subtitleTopSpace:subtitleFontSource:subtitleInsets:itemsMinTopPosition:itemsTopSpace:itemsBottomSpace:)();
}

uint64_t sub_100760780()
{
  return type metadata accessor for ArcadeWelcomeContentLayout.Metrics();
}

uint64_t sub_100760790()
{
  return ArcadeWelcomeContentLayout.init(metrics:titleText:subtitleText:items:)();
}

uint64_t sub_1007607A0()
{
  return type metadata accessor for ArcadeWelcomeContentLayout();
}

uint64_t sub_1007607B0()
{
  return ArcadeWelcomePagePresenter.init(objectGraph:contentType:welcomePage:url:)();
}

uint64_t sub_1007607C0()
{
  return dispatch thunk of ArcadeWelcomePagePresenter.view.setter();
}

uint64_t sub_1007607D0()
{
  return type metadata accessor for ArcadeWelcomePagePresenter();
}

uint64_t sub_1007607E0()
{
  return dispatch thunk of CollectionElementsObserver.didSelectCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_1007607F0()
{
  return dispatch thunk of CollectionElementsObserver.prefetchCells(in:collectionView:asPartOf:)();
}

uint64_t sub_100760800()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760810()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760820()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760830()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760840()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760850()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760860()
{
  return CollectionElementsObserver.didSelectCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100760870()
{
  return CollectionElementsObserver.prefetchCells(in:collectionView:asPartOf:)();
}

uint64_t sub_100760880()
{
  return CollectionElementsObserver.didDequeueCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100760890()
{
  return CollectionElementsObserver.willDisplayCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_1007608A0()
{
  return CollectionElementsObserver.didEndDisplayingCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_1007608B0()
{
  return CollectionElementsObserver.willDisplayItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_1007608C0()
{
  return CollectionElementsObserver.willDisplayShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_1007608D0()
{
  return CollectionElementsObserver.willDisplayGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_1007608E0()
{
  return CollectionElementsObserver.didEndDisplayingItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_1007608F0()
{
  return CollectionElementsObserver.didEndDisplayingShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760900()
{
  return CollectionElementsObserver.didEndDisplayingGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100760910()
{
  return dispatch thunk of ComponentContainerDelegate.mutableState(ofSubItemAt:)();
}

uint64_t sub_100760920()
{
  return dispatch thunk of ComponentContainerDelegate.mutableState(ofItem:)();
}

uint64_t sub_100760930()
{
  return dispatch thunk of ComponentContainerDelegate.numberOfItems.getter();
}

uint64_t sub_100760940()
{
  return dispatch thunk of ComponentContainerDelegate.containerState.getter();
}

uint64_t sub_100760950()
{
  return dispatch thunk of ComponentContainerDelegate.scrollObserver.getter();
}

uint64_t sub_100760960()
{
  return dispatch thunk of ComponentContainerDelegate.propagateSelection(ofItem:)();
}

uint64_t sub_100760970()
{
  return dispatch thunk of ComponentContainerDelegate.impressionsCalculator.getter();
}

uint64_t sub_100760980()
{
  return dispatch thunk of ComponentContainerDelegate.model(ofItem:)();
}

uint64_t sub_100760990()
{
  return dispatch thunk of ComponentContainerDelegate.state(ofItem:)();
}

uint64_t sub_1007609A0()
{
  return type metadata accessor for EntitlementRefeshCondition();
}

uint64_t sub_1007609B0()
{
  return GameCenterActivityFeedCard.appActionMetrics.getter();
}

uint64_t sub_1007609C0()
{
  return GameCenterActivityFeedCard.profileActionMetrics.getter();
}

uint64_t sub_1007609D0()
{
  return GameCenterActivityFeedCard.achievementActionMetrics.getter();
}

uint64_t sub_1007609E0()
{
  return GameCenterActivityFeedCard.leaderboardActionMetrics.getter();
}

uint64_t sub_1007609F0()
{
  return GameCenterActivityFeedCard.profileAvatarActionMetrics.getter();
}

uint64_t sub_100760A00()
{
  return GameCenterActivityFeedCard.data.getter();
}

uint64_t sub_100760A10()
{
  return type metadata accessor for GameCenterActivityFeedCard();
}

uint64_t sub_100760A20()
{
  return type metadata accessor for ImpressionIdScrollObserver();
}

uint64_t sub_100760A30()
{
  return ImpressionIdScrollObserver.init(_:impressionID:collectionView:)();
}

void sub_100760A40()
{
}

uint64_t sub_100760A50()
{
  return type metadata accessor for InvalidateAllWidgetsAction();
}

uint64_t sub_100760A60()
{
  return type metadata accessor for MetadataRibbonItemViewType();
}

uint64_t sub_100760A70()
{
  return static PlatformSelectorViewLayout.makeFullPlatformString(descriptiveText:badgeString:metrics:style:in:)();
}

uint64_t sub_100760A80()
{
  return PlatformSelectorViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100760A90()
{
  return type metadata accessor for PlatformSelectorViewLayout.Metrics.AccessoryAlignment();
}

uint64_t sub_100760AA0()
{
  return PlatformSelectorViewLayout.Metrics.init(badgeHorizontalPadding:textSpaceWhenInline:textSpaceWhenExclusiveLine:badgeSpaceExclusiveLine:accessoryHorizontalPadding:accessoryContentInsets:accessoryAlignment:bottomSpacer:)();
}

uint64_t sub_100760AB0()
{
  return PlatformSelectorViewLayout.Metrics.badgeHorizontalPadding.getter();
}

uint64_t sub_100760AC0()
{
  return type metadata accessor for PlatformSelectorViewLayout.Metrics();
}

uint64_t sub_100760AD0()
{
  return PlatformSelectorViewLayout.init(metrics:style:descriptionLabel:accessoryImageView:)();
}

uint64_t sub_100760AE0()
{
  return type metadata accessor for PlatformSelectorViewLayout();
}

uint64_t sub_100760AF0()
{
  return SearchTagsRibbonViewLayout.init(searchTagsRibbonItemLayoutContexts:metrics:shouldEvenlyDistribute:)();
}

uint64_t sub_100760B00()
{
  return SearchTagsRibbonViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100760B10()
{
  return SearchTagsRibbonViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100760B20()
{
  return SearchTagsRibbonViewLayout.Metrics.maximumNumberOfItems.getter();
}

uint64_t sub_100760B30()
{
  return static SearchTagsRibbonViewLayout.Metrics.standard.getter();
}

uint64_t sub_100760B40()
{
  return type metadata accessor for SearchTagsRibbonViewLayout.Metrics();
}

uint64_t sub_100760B50()
{
  return type metadata accessor for SearchTagsRibbonViewLayout();
}

uint64_t sub_100760B60()
{
  return ShelfBasedPageScrollAction.clicksOnScroll.getter();
}

uint64_t sub_100760B70()
{
  return ShelfBasedPageScrollAction.index.getter();
}

uint64_t sub_100760B80()
{
  return ShelfBasedPageScrollAction.shelfId.getter();
}

uint64_t sub_100760B90()
{
  return type metadata accessor for ShelfBasedPageScrollAction();
}

uint64_t sub_100760BA0()
{
  return ShelfLayoutSpacingProvider.topPadding(in:)();
}

uint64_t sub_100760BB0()
{
  return ShelfLayoutSpacingProvider.bottomPadding(in:)();
}

uint64_t sub_100760BC0()
{
  return ShelfLayoutSpacingProvider.topContentInset(in:)();
}

uint64_t sub_100760BD0()
{
  return ShelfLayoutSpacingProvider.topPaddingValue(in:)();
}

uint64_t sub_100760BE0()
{
  return ShelfLayoutSpacingProvider.bottomContentInset(in:)();
}

uint64_t sub_100760BF0()
{
  return ShelfLayoutSpacingProvider.bottomPaddingValue(in:)();
}

uint64_t sub_100760C00()
{
  return ShelfLayoutSpacingProvider.topContentInsetValue(in:)();
}

uint64_t sub_100760C10()
{
  return dispatch thunk of ShelfSupplementaryProvider.decorationItems(for:shelfLayoutSpacingProvider:asPartOf:)();
}

uint64_t sub_100760C20()
{
  return dispatch thunk of ShelfSupplementaryProvider.supplementaryItems(for:shelfLayoutSpacingProvider:asPartOf:)();
}

uint64_t sub_100760C30()
{
  return dispatch thunk of ShelfSupplementaryProvider.supplementaryRegistration(for:in:asPartOf:)();
}

uint64_t sub_100760C40()
{
  return TodayCardLockupListOverlay.displaysTitle.getter();
}

uint64_t sub_100760C50()
{
  return TodayCardLockupListOverlay.lockups.getter();
}

uint64_t sub_100760C60()
{
  return type metadata accessor for TodayCardLockupListOverlay();
}

uint64_t sub_100760C70()
{
  return TodayCardMediaSingleLockup.condensedAdLockupWithIconBackground.getter();
}

uint64_t sub_100760C80()
{
  return type metadata accessor for TodayCardMediaSingleLockup();
}

uint64_t sub_100760C90()
{
  return TodayCardTriggerController.persistantStore.getter();
}

uint64_t sub_100760CA0()
{
  return dispatch thunk of TodayCardTriggerController.snapshot()();
}

uint64_t sub_100760CB0()
{
  return type metadata accessor for TodayCardTriggerController();
}

uint64_t sub_100760CC0()
{
  return TodayCardTriggerIdentifier.rawValue.getter();
}

uint64_t sub_100760CD0()
{
  return type metadata accessor for TodayCardTriggerIdentifier();
}

uint64_t sub_100760CE0()
{
  return TodayDiffablePagePresenter.init(objectGraph:pageUrl:triggerController:supportsFastImpressions:accountStore:shouldUpdateOnAccountChange:advertLifecycleMetricsReporter:)();
}

uint64_t sub_100760CF0()
{
  return TodayDiffablePagePresenter.pageLongTitle.getter();
}

uint64_t sub_100760D00()
{
  return TodayDiffablePagePresenter.feedPreviewUrl.getter();
}

uint64_t sub_100760D10()
{
  return TodayDiffablePagePresenter.pageTitleDetail.getter();
}

uint64_t sub_100760D20()
{
  return TodayDiffablePagePresenter.pageShortTitleDetail.getter();
}

uint64_t sub_100760D30()
{
  return TodayDiffablePagePresenter.tabTitle.getter();
}

uint64_t sub_100760D40()
{
  return TodayDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_100760D50()
{
  return type metadata accessor for TodayDiffablePagePresenter();
}

uint64_t sub_100760D60()
{
  return type metadata accessor for TodaySectionDisplayOptions.GroupDisplayStyle();
}

uint64_t sub_100760D70()
{
  return TodaySectionDisplayOptions.debugSectionTypeIndicatorColor.getter();
}

uint64_t sub_100760D80()
{
  return TodaySectionDisplayOptions.groupDisplayStyle.getter();
}

uint64_t sub_100760D90()
{
  return type metadata accessor for TodaySectionDisplayOptions();
}

uint64_t sub_100760DA0()
{
  return dispatch thunk of AnyAvatarShowcaseDisplaying.applyAvatars(from:asPartOf:)();
}

uint64_t sub_100760DB0()
{
  return dispatch thunk of AnyAvatarShowcaseDisplaying.unapply()();
}

uint64_t sub_100760DC0()
{
  return ArcadeAccountEventGenerator.init(metricsPipeline:)();
}

uint64_t sub_100760DD0()
{
  return dispatch thunk of ArcadeAccountEventGenerator.arcadeStateDidChange()();
}

uint64_t sub_100760DE0()
{
  return type metadata accessor for ArcadeAccountEventGenerator();
}

uint64_t sub_100760DF0()
{
  return ArcadeDiffablePagePresenter.didFetchPage.getter();
}

uint64_t sub_100760E00()
{
  return ArcadeDiffablePagePresenter.init(objectGraph:arcadeSubscriptionManager:subscriptionStateFetchTimeout:sidePackedPage:pageUrls:)();
}

uint64_t sub_100760E10()
{
  return ArcadeDiffablePagePresenter.titleEffect.getter();
}

uint64_t sub_100760E20()
{
  return ArcadeDiffablePagePresenter.onOnPrepareUpsellHandler.getter();
}

uint64_t sub_100760E30()
{
  return ArcadeDiffablePagePresenter.onRecordTabVisitIfPossible.getter();
}

uint64_t sub_100760E40()
{
  return ArcadeDiffablePagePresenter.tabTitle.getter();
}

uint64_t sub_100760E50()
{
  return ArcadeDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_100760E60()
{
  return type metadata accessor for ArcadeDiffablePagePresenter();
}

uint64_t sub_100760E70()
{
  return ArcadeSubscriptionDecorator.init(objectGraph:product:appAdamId:subscriptionToken:)();
}

uint64_t sub_100760E80()
{
  return type metadata accessor for ArcadeSubscriptionDecorator();
}

uint64_t sub_100760E90()
{
  return ArcadeWelcomeItemViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100760EA0()
{
  return ArcadeWelcomeItemViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100760EB0()
{
  return ArcadeWelcomeItemViewLayout.Metrics.imageWidth.setter();
}

uint64_t sub_100760EC0()
{
  return ArcadeWelcomeItemViewLayout.Metrics.init(imageAspectRatio:imageWidth:headingTopSpace:bodyTopSpace:textInsets:)();
}

uint64_t sub_100760ED0()
{
  return type metadata accessor for ArcadeWelcomeItemViewLayout.Metrics();
}

uint64_t sub_100760EE0()
{
  return ArcadeWelcomeItemViewLayout.init(metrics:headingText:bodyText:image:)();
}

uint64_t sub_100760EF0()
{
  return type metadata accessor for ArcadeWelcomeItemViewLayout();
}

uint64_t sub_100760F00()
{
  return ChartOrCategoryBrickContext.BrickLabelMetrics.badge.getter();
}

uint64_t sub_100760F10()
{
  return ChartOrCategoryBrickContext.BrickLabelMetrics.title.getter();
}

uint64_t sub_100760F20()
{
  return type metadata accessor for ChartOrCategoryBrickContext.BrickLabelMetrics();
}

uint64_t sub_100760F30()
{
  return type metadata accessor for ChartOrCategoryBrickContext.BrickType();
}

uint64_t sub_100760F40()
{
  return ChartOrCategoryBrickContext.LabelMetrics.contentSizeCategoryMapping.getter();
}

uint64_t sub_100760F50()
{
  return ChartOrCategoryBrickContext.LabelMetrics.fontUseCase.getter();
}

uint64_t sub_100760F60()
{
  return ChartOrCategoryBrickContext.LabelMetrics.numberOfLines.getter();
}

uint64_t sub_100760F70()
{
  return type metadata accessor for ChartOrCategoryBrickContext.LabelMetrics();
}

uint64_t sub_100760F80()
{
  return ChartOrCategoryBrickContext.layoutMetrics.getter();
}

uint64_t sub_100760F90()
{
  return ChartOrCategoryBrickContext.currentArtwork.getter();
}

uint64_t sub_100760FA0()
{
  return ChartOrCategoryBrickContext.init(model:fontStyles:in:)();
}

uint64_t sub_100760FB0()
{
  return ChartOrCategoryBrickContext.model.getter();
}

uint64_t sub_100760FC0()
{
  return ChartOrCategoryBrickContext.style.getter();
}

uint64_t sub_100760FD0()
{
  return ChartOrCategoryBrickContext.labels.getter();
}

uint64_t sub_100760FE0()
{
  return type metadata accessor for ChartOrCategoryBrickContext();
}

uint64_t sub_100760FF0()
{
  return dispatch thunk of GenericAccountPagePresenter.contentItem(at:)();
}

uint64_t sub_100761000()
{
  return GenericAccountPagePresenter.init(objectGraph:url:page:)();
}

uint64_t sub_100761010()
{
  return dispatch thunk of GenericAccountPagePresenter.numberOfItems(in:)();
}

uint64_t sub_100761020()
{
  return dispatch thunk of GenericAccountPagePresenter.numberOfSections.getter();
}

uint64_t sub_100761030()
{
  return dispatch thunk of GenericAccountPagePresenter.personalizedRecommendationsEnabled.getter();
}

uint64_t sub_100761040()
{
  return dispatch thunk of GenericAccountPagePresenter.setPersonalizedRecommendationsEnabled(_:)();
}

uint64_t sub_100761050()
{
  return dispatch thunk of GenericAccountPagePresenter.view.setter();
}

uint64_t sub_100761060()
{
  return dispatch thunk of GenericAccountPagePresenter.title(forSection:)();
}

uint64_t sub_100761070()
{
  return dispatch thunk of GenericAccountPagePresenter.title.getter();
}

uint64_t sub_100761080()
{
  return dispatch thunk of GenericAccountPagePresenter.action(at:)();
}

uint64_t sub_100761090()
{
  return dispatch thunk of GenericAccountPagePresenter.footer(forSection:)();
}

uint64_t sub_1007610A0()
{
  return type metadata accessor for GenericAccountPagePresenter();
}

uint64_t sub_1007610B0()
{
  return type metadata accessor for GuidedSearchTokenCollection();
}

uint64_t sub_1007610C0()
{
  return MetadataRibbonBarViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_1007610D0()
{
  return MetadataRibbonBarViewLayout.measurements(fitting:in:)();
}

uint64_t sub_1007610E0()
{
  return MetadataRibbonBarViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007610F0()
{
  return MetadataRibbonBarViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_100761100()
{
  return MetadataRibbonBarViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100761110()
{
  return type metadata accessor for MetadataRibbonBarViewLayout.Metrics();
}

uint64_t sub_100761120()
{
  return type metadata accessor for MetadataRibbonBarViewLayout();
}

uint64_t sub_100761130()
{
  return MetadataRibbonTagViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_100761140()
{
  return MetadataRibbonTagViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100761150()
{
  return MetadataRibbonTagViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100761160()
{
  return MetadataRibbonTagViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_100761170()
{
  return MetadataRibbonTagViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100761180()
{
  return type metadata accessor for MetadataRibbonTagViewLayout.Metrics();
}

uint64_t sub_100761190()
{
  return type metadata accessor for MetadataRibbonTagViewLayout();
}

uint64_t sub_1007611A0()
{
  return type metadata accessor for OfferButtonSubtitlePosition();
}

uint64_t sub_1007611B0()
{
  return type metadata accessor for PaginatedPagePresenterState();
}

uint64_t sub_1007611C0()
{
  return type metadata accessor for PersonalizationDataProvider();
}

uint64_t sub_1007611D0()
{
  return dispatch thunk of ProductTopLockupIconFetcher.addIconRecipient(recipient:)();
}

uint64_t sub_1007611E0()
{
  return dispatch thunk of ProductTopLockupIconFetcher.fetchArtwork(for:in:)();
}

uint64_t sub_1007611F0()
{
  return ProductTopLockupIconFetcher.init(artworkLoader:)();
}

uint64_t sub_100761200()
{
  return type metadata accessor for ProductTopLockupIconFetcher();
}

uint64_t sub_100761210()
{
  return dispatch thunk of PurchasableTodayCardOverlay.offerAdamIds.getter();
}

uint64_t sub_100761220()
{
  return ReloadableItemPagePresenter.reloadItem(_:)();
}

uint64_t sub_100761230()
{
  return static ResilientDeepLinkController.hasResilientDeepLinks(bag:)();
}

uint64_t sub_100761240()
{
  return static ResilientDeepLinkController.removeAllDeepLinks()();
}

uint64_t sub_100761250()
{
  return static ResilientDeepLinkController.removeNonResilientDeepLinks(bag:)();
}

uint64_t sub_100761260()
{
  return static ResilientDeepLinkController.preventDismissingArticlesForFlowUrl(_:bag:)();
}

uint64_t sub_100761270()
{
  return type metadata accessor for VideoPlaybackScrollObserver();
}

uint64_t sub_100761280()
{
  return VideoPlaybackScrollObserver.init(_:)();
}

uint64_t sub_100761290()
{
  return ArcadeDebugSubscriptionState.arcadeState.getter();
}

uint64_t sub_1007612A0()
{
  return static ArcadeDebugSubscriptionState.allCases.getter();
}

uint64_t sub_1007612B0()
{
  return type metadata accessor for ArcadeDebugSubscriptionState();
}

uint64_t sub_1007612C0()
{
  return ArcadeDownloadPackSuggestion.lockup.getter();
}

uint64_t sub_1007612D0()
{
  return ArticleDiffablePagePresenter.reloadLink(_:)();
}

uint64_t sub_1007612E0()
{
  return ArticleDiffablePagePresenter.init(objectGraph:impressionsTracker:pageUrl:sidePackedPage:)();
}

uint64_t sub_1007612F0()
{
  return ArticleDiffablePagePresenter.shareAction.getter();
}

uint64_t sub_100761300()
{
  return type metadata accessor for ArticleDiffablePagePresenter.FooterLockup();
}

uint64_t sub_100761310()
{
  return ArticleDiffablePagePresenter.onShowFooterLockup.getter();
}

uint64_t sub_100761320()
{
  return ArticleDiffablePagePresenter.shouldTerminateOnClose.getter();
}

uint64_t sub_100761330()
{
  return ArticleDiffablePagePresenter.onPrefetchLinkPresentations.getter();
}

uint64_t sub_100761340()
{
  return ArticleDiffablePagePresenter.onPrepareToDisplayTodayCard.getter();
}

uint64_t sub_100761350()
{
  return ArticleDiffablePagePresenter.footerVisibilitySectionThreshold.getter();
}

uint64_t sub_100761360()
{
  return ArticleDiffablePagePresenter.todayCard.getter();
}

uint64_t sub_100761370()
{
  return type metadata accessor for ArticleDiffablePagePresenter();
}

uint64_t sub_100761380()
{
  return dispatch thunk of AutoPlayVideoSettingsManager.isAutoPlayEnabled.getter();
}

uint64_t sub_100761390()
{
  return dispatch thunk of AutoPlayVideoSettingsManager.defaultAutoPlayVideoSetting.setter();
}

uint64_t sub_1007613A0()
{
  return static AutoPlayVideoSettingsManager.shared.getter();
}

uint64_t sub_1007613B0()
{
  return type metadata accessor for AutoPlayVideoSettingsManager();
}

uint64_t sub_1007613C0()
{
  return BadgeContentKeyChartPosition.getter();
}

uint64_t sub_1007613D0()
{
  return BadgeContentKeyParagraphText.getter();
}

uint64_t sub_1007613E0()
{
  return ChartOrCategoryBrickSafeArea.size(in:)();
}

uint64_t sub_1007613F0()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea.Location.RelativeLocation();
}

uint64_t sub_100761400()
{
  return ChartOrCategoryBrickSafeArea.Location.relativeLocation.getter();
}

uint64_t sub_100761410()
{
  return ChartOrCategoryBrickSafeArea.Location.absoluteDistance(in:)();
}

uint64_t sub_100761420()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea.Location();
}

uint64_t sub_100761430()
{
  return ChartOrCategoryBrickSafeArea.location.getter();
}

uint64_t sub_100761440()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea();
}

uint64_t sub_100761450()
{
  return GameCenterAchievementsAction.achievementIdsToHighlight.getter();
}

uint64_t sub_100761460()
{
  return GameCenterAchievementsAction.init(bundleID:achievementIdsToHighlight:actionMetrics:)();
}

uint64_t sub_100761470()
{
  return GameCenterAchievementsAction.bundleId.getter();
}

uint64_t sub_100761480()
{
  return type metadata accessor for GameCenterAchievementsAction();
}

uint64_t sub_100761490()
{
  return type metadata accessor for GameCenterInvitePlayerAction.InvitationType();
}

uint64_t sub_1007614A0()
{
  return GameCenterInvitePlayerAction.invitationType.getter();
}

uint64_t sub_1007614B0()
{
  return GameCenterLeaderboardsAction.init(leaderboardID:bundleID:actionMetrics:)();
}

uint64_t sub_1007614C0()
{
  return GameCenterLeaderboardsAction.leaderboardID.getter();
}

uint64_t sub_1007614D0()
{
  return GameCenterLeaderboardsAction.bundleID.getter();
}

uint64_t sub_1007614E0()
{
  return type metadata accessor for GameCenterLeaderboardsAction();
}

uint64_t sub_1007614F0()
{
  return GameCenterReengagementLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100761500()
{
  return GameCenterReengagementLayout.Metrics.init(layoutMargins:shelfTopSpace:badgeGlyphSpace:badgeTopSpace:titleTopSpace:subtitleTopSpace:heroContentTopSpace:separatorTopSpace:footerTopSpace:footerBottomSpace:maxColumnWidth:columnSpace:maxHeight:)();
}

uint64_t sub_100761510()
{
  return type metadata accessor for GameCenterReengagementLayout.Metrics();
}

uint64_t sub_100761520()
{
  return GameCenterReengagementLayout.init(metrics:badgeGlyph:badgeLabel:titleLabel:subtitleLabel:heroContent:separator:footer:)();
}

uint64_t sub_100761530()
{
  return type metadata accessor for GameCenterReengagementLayout();
}

uint64_t sub_100761540()
{
  return GenericDiffablePagePresenter.init(objectGraph:personalizationProvider:sidePackedPage:sidePackedPageRenderMetrics:pageUrl:)();
}

uint64_t sub_100761550()
{
  return type metadata accessor for GenericDiffablePagePresenter();
}

uint64_t sub_100761560()
{
  return type metadata accessor for IncompleteShelfFetchStrategy();
}

uint64_t sub_100761570()
{
  return LockupCollectionSearchResult.detailAction.getter();
}

uint64_t sub_100761580()
{
  return LockupCollectionSearchResult.items.getter();
}

uint64_t sub_100761590()
{
  return LockupCollectionSearchResult.title.getter();
}

uint64_t sub_1007615A0()
{
  return LockupCollectionSearchResult.heading.getter();
}

uint64_t sub_1007615B0()
{
  return type metadata accessor for LockupCollectionSearchResult();
}

uint64_t sub_1007615C0()
{
  return OnDeviceSearchHistoryManager.fetchRecents(limit:)();
}

void sub_1007615D0()
{
}

uint64_t sub_1007615E0()
{
  return type metadata accessor for OnDeviceSearchHistoryManager();
}

void sub_1007615F0()
{
}

uint64_t sub_100761600()
{
  return ProductDiffablePagePresenter.appPromotionDetailPageAction.getter();
}

uint64_t sub_100761610()
{
  return ProductDiffablePagePresenter.isOfferButtonHiddenByPresenter.getter();
}

void sub_100761620()
{
}

uint64_t sub_100761630()
{
  return ProductDiffablePagePresenter.didChangePageWidth(_:)();
}

uint64_t sub_100761640()
{
  return type metadata accessor for ProductDiffablePagePresenter.PageWidth();
}

uint64_t sub_100761650()
{
  return ProductDiffablePagePresenter.init(objectGraph:pageUrl:sidePackedPage:sidePackedPageRenderMetrics:appStateController:purchaseHistory:restrictions:fullProductFetchedAction:pageWidth:isDownloadingOrderingEnabled:downloadingOrderingTimeout:supportsFastImpressions:advertLifecycleMetricsReporter:referrerData:)();
}

uint64_t sub_100761660()
{
  return ProductDiffablePagePresenter.shareAction.getter();
}

uint64_t sub_100761670()
{
  return ProductDiffablePagePresenter.didSelectShare(sender:)();
}

uint64_t sub_100761680()
{
  return ProductDiffablePagePresenter.offerButtonMode.getter();
}

uint64_t sub_100761690()
{
  return ProductDiffablePagePresenter.didSelectDeveloper(sender:)();
}

uint64_t sub_1007616A0()
{
  return ProductDiffablePagePresenter.onScrollToPosition.getter();
}

uint64_t sub_1007616B0()
{
  return ProductDiffablePagePresenter.didSelectExpandMedia(on:sender:)();
}

uint64_t sub_1007616C0()
{
  return ProductDiffablePagePresenter.pageDisappearedAction.getter();
}

uint64_t sub_1007616D0()
{
  return ProductDiffablePagePresenter.titleOfferDisplayProperties.getter();
}

uint64_t sub_1007616E0()
{
  return ProductDiffablePagePresenter.onDownloadingOrderingItemsRemoved.getter();
}

uint64_t sub_1007616F0()
{
  return ProductDiffablePagePresenter.adamId.getter();
}

uint64_t sub_100761700()
{
  return type metadata accessor for ProductDiffablePagePresenter();
}

uint64_t sub_100761710()
{
  return ReviewsDiffablePagePresenter.init(objectGraph:reviewsPage:preferSelectedActionTitles:)();
}

uint64_t sub_100761720()
{
  return ReviewsDiffablePagePresenter.showSortSheet(sender:)();
}

uint64_t sub_100761730()
{
  return ReviewsDiffablePagePresenter.selectedSortOption.getter();
}

uint64_t sub_100761740()
{
  return ReviewsDiffablePagePresenter.isUpdatingSortOption.getter();
}

uint64_t sub_100761750()
{
  return ReviewsDiffablePagePresenter.trailingNavBarAction.getter();
}

uint64_t sub_100761760()
{
  return ReviewsDiffablePagePresenter.initialFocusedReviewId.getter();
}

uint64_t sub_100761770()
{
  return ReviewsDiffablePagePresenter.title.getter();
}

uint64_t sub_100761780()
{
  return type metadata accessor for ReviewsDiffablePagePresenter();
}

uint64_t sub_100761790()
{
  return SelectableShelfComponentView.didBecomeSelected(in:asPartOf:)();
}

uint64_t sub_1007617A0()
{
  return TodayCardArcadeLockupOverlay.arcadeLockup.getter();
}

uint64_t sub_1007617B0()
{
  return type metadata accessor for TodayCardArcadeLockupOverlay();
}

uint64_t sub_1007617C0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.hasChildren(at:)();
}

uint64_t sub_1007617D0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryCount(at:)();
}

uint64_t sub_1007617E0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryTitle(at:)();
}

uint64_t sub_1007617F0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryArtwork(at:)();
}

uint64_t sub_100761800()
{
  return dispatch thunk of TopChartsCategoriesPresenter.isCategorySelected(at:)();
}

uint64_t sub_100761810()
{
  return dispatch thunk of TopChartsCategoriesPresenter.selectedCategoryIndexPath.getter();
}

uint64_t sub_100761820()
{
  return ArcadeSubscriptionStateAction.purchasingAction.getter();
}

uint64_t sub_100761830()
{
  return ArcadeSubscriptionStateAction.subscribedAction.getter();
}

uint64_t sub_100761840()
{
  return ArcadeSubscriptionStateAction.notSubscribedAction.getter();
}

uint64_t sub_100761850()
{
  return ArcadeSubscriptionStateAction.unknownAction.getter();
}

uint64_t sub_100761860()
{
  return BasePageLayoutSectionProvider.init(componentTypeMappingProvider:visibleItemsObserverProviders:componentHeightCache:useEstimatedLayoutSizing:)();
}

uint64_t sub_100761870()
{
  return BasePageLayoutSectionProvider.componentTypeMappingProvider.getter();
}

uint64_t sub_100761880()
{
  return BasePageLayoutSectionProvider.addSupplementariesAndInsets(to:for:shelfLayoutSpacingProvider:shelfSupplementaryProvider:asPartOf:)();
}

uint64_t sub_100761890()
{
  return BasePageLayoutSectionProvider.visibleItemsObserverProviders.getter();
}

uint64_t sub_1007618A0()
{
  return type metadata accessor for BasePageLayoutSectionProvider();
}

uint64_t sub_1007618B0()
{
  return method lookup function for BasePageLayoutSectionProvider();
}

uint64_t sub_1007618C0()
{
  return BasePageLayoutSectionProvider.deinit();
}

uint64_t sub_1007618D0()
{
  return type metadata accessor for DiffablePageContentIdentifier();
}

uint64_t sub_1007618E0()
{
  return DiffablePageContentIdentifier.init(_:)();
}

uint64_t sub_1007618F0()
{
  return DynamicViewControllerDelegate.init(subscriptionManager:purchaseSuccessHandler:purchaseFailureHandler:carrierLinkSuccessHandler:carrierLinkFailureHandler:didDismissHandler:contentViewConstructor:)();
}

uint64_t sub_100761900()
{
  return type metadata accessor for DynamicViewControllerDelegate();
}

uint64_t sub_100761910()
{
  return GameCenterPlayerProfileAction.init(playerId:actionMetrics:)();
}

uint64_t sub_100761920()
{
  return GameCenterPlayerProfileAction.playerId.getter();
}

uint64_t sub_100761930()
{
  return type metadata accessor for GameCenterPlayerProfileAction();
}

uint64_t sub_100761940()
{
  return ImpressionableSmallPlayerCard.init(id:suggestedFriend:impressionMetrics:)();
}

uint64_t sub_100761950()
{
  return ImpressionableSmallPlayerCard.data.getter();
}

uint64_t sub_100761960()
{
  return type metadata accessor for ImpressionableSmallPlayerCard();
}

uint64_t sub_100761970()
{
  return InlineUnifiedMessagePresenter.actionHandler.setter();
}

uint64_t sub_100761980()
{
  return InlineUnifiedMessagePresenter.inlineViewController(for:)();
}

uint64_t sub_100761990()
{
  return type metadata accessor for InlineUnifiedMessagePresenter();
}

uint64_t sub_1007619A0()
{
  return static LabelPlaceholderCompatibility.measurements(attributedText:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_1007619B0()
{
  return static LabelPlaceholderCompatibility.measurements(text:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_1007619C0()
{
  return static LabelPlaceholderCompatibility.measurements(text:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_1007619D0()
{
  return LabelPlaceholderCompatibility.measurements(fitting:with:)();
}

uint64_t sub_1007619E0()
{
  return LabelPlaceholderCompatibility.init(attributedText:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:shouldUseLabelPlaceholder:)();
}

uint64_t sub_1007619F0()
{
  return LabelPlaceholderCompatibility.layoutTextView.getter();
}

uint64_t sub_100761A00()
{
  return LabelPlaceholderCompatibility.referableLayoutTextView.getter();
}

uint64_t sub_100761A10()
{
  return LabelPlaceholderCompatibility.init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:shouldUseLabelPlaceholder:)();
}

uint64_t sub_100761A20()
{
  return type metadata accessor for LabelPlaceholderCompatibility();
}

uint64_t sub_100761A30()
{
  return dispatch thunk of ModelMappedDiffableDataSource.applySnapshotUsingReloadData(_:animatingDifferences:completion:)();
}

uint64_t sub_100761A40()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModel(for:)();
}

uint64_t sub_100761A50()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModel(for:)();
}

uint64_t sub_100761A60()
{
  return dispatch thunk of ModelMappedDiffableDataSource.sectionModel(at:)();
}

uint64_t sub_100761A70()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModels(in:)();
}

uint64_t sub_100761A80()
{
  return dispatch thunk of ModelMappedDiffableDataSource.sectionIndex(for:)();
}

uint64_t sub_100761A90()
{
  return ModelMappedDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_100761AA0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_100761AB0()
{
  return static OfferButtonPresenterViewTheme.blueColored.getter();
}

uint64_t sub_100761AC0()
{
  return OfferButtonPresenterViewTheme.environment.getter();
}

uint64_t sub_100761AD0()
{
  return static OfferButtonPresenterViewTheme.disabled.getter();
}

uint64_t sub_100761AE0()
{
  return type metadata accessor for OfferButtonPresenterViewTheme();
}

uint64_t sub_100761AF0()
{
  return SearchChartsAndCategoriesPage.title.getter();
}

uint64_t sub_100761B00()
{
  return type metadata accessor for SearchChartsAndCategoriesPage();
}

uint64_t sub_100761B10()
{
  return type metadata accessor for SearchGhostHintMetricsTracker();
}

uint64_t sub_100761B20()
{
  return type metadata accessor for SearchResultCondensedBehavior();
}

uint64_t sub_100761B30()
{
  return dispatch thunk of StorefrontPickerPagePresenter.updateStorefront()();
}

uint64_t sub_100761B40()
{
  return static StorefrontPickerPagePresenter.currentStorefront()();
}

uint64_t sub_100761B50()
{
  return dispatch thunk of StorefrontPickerPagePresenter.canUpdateStorefront.getter();
}

uint64_t sub_100761B60()
{
  return StorefrontPickerPagePresenter.init(objectGraph:impressionsTracker:impressionsCalculator:)();
}

uint64_t sub_100761B70()
{
  return dispatch thunk of StorefrontPickerPagePresenter.didSelectCountry(at:)();
}

uint64_t sub_100761B80()
{
  return dispatch thunk of StorefrontPickerPagePresenter.didSelectLanguage(at:)();
}

uint64_t sub_100761B90()
{
  return dispatch thunk of StorefrontPickerPagePresenter.numberOfCountries.getter();
}

uint64_t sub_100761BA0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.numberOfLanguages.getter();
}

uint64_t sub_100761BB0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.selectedCountryIndex.getter();
}

uint64_t sub_100761BC0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.selectedLanguageIndex.getter();
}

uint64_t sub_100761BD0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.view.setter();
}

uint64_t sub_100761BE0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.country(at:)();
}

uint64_t sub_100761BF0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.language(at:for:)();
}

uint64_t sub_100761C00()
{
  return type metadata accessor for StorefrontPickerPagePresenter();
}

uint64_t sub_100761C10(Swift::String a1)
{
  return localizedStringForAdsLanguage(_:)(a1)._countAndFlagsBits;
}

uint64_t sub_100761C20()
{
  return ArcadeButtonNameFieldsProvider.init(arcadeSubscriptionManager:appStateController:)();
}

uint64_t sub_100761C30()
{
  return type metadata accessor for ArcadeButtonNameFieldsProvider();
}

uint64_t sub_100761C40()
{
  return BadgeContentKeyRatingFormatted.getter();
}

uint64_t sub_100761C50()
{
  return GameCenterDenylistPlayerAction.contactId.getter();
}

uint64_t sub_100761C60()
{
  return type metadata accessor for GameCenterDenylistPlayerAction();
}

uint64_t sub_100761C70()
{
  return dispatch thunk of PageTitleEffectUpdateProviding.onUpdatePageTitleEffect.getter();
}

uint64_t sub_100761C80()
{
  return dispatch thunk of PageTitleEffectUpdateProviding.currentTitleEffect.getter();
}

uint64_t sub_100761C90()
{
  return PersonalizationFeedbackRequest.hasDivider.getter();
}

uint64_t sub_100761CA0()
{
  return PersonalizationFeedbackRequest.description.getter();
}

uint64_t sub_100761CB0()
{
  return PersonalizationFeedbackRequest.options.getter();
}

uint64_t sub_100761CC0()
{
  return type metadata accessor for PersonalizationFeedbackRequest();
}

uint64_t sub_100761CD0()
{
  return PrivacyHeaderSupplementaryItem.bodyText.getter();
}

uint64_t sub_100761CE0()
{
  return type metadata accessor for PrivacyHeaderSupplementaryItem();
}

uint64_t sub_100761CF0()
{
  return SearchResultsContextCardLayout.Metrics.maxCardWidth.getter();
}

uint64_t sub_100761D00()
{
  return static SearchResultsContextCardLayout.Metrics.standard.getter();
}

uint64_t sub_100761D10()
{
  return type metadata accessor for SearchResultsContextCardLayout.Metrics();
}

uint64_t sub_100761D20()
{
  return SearchResultsContextCardLayout.init(metrics:message:button:)();
}

uint64_t sub_100761D30()
{
  return type metadata accessor for SearchResultsContextCardLayout();
}

uint64_t sub_100761D40()
{
  return SearchResultsUnavailableReason.contextCard.getter();
}

uint64_t sub_100761D50()
{
  return SearchResultsUnavailableReason.title.getter();
}

uint64_t sub_100761D60()
{
  return SearchResultsUnavailableReason.action.getter();
}

uint64_t sub_100761D70()
{
  return SearchResultsUnavailableReason.message.getter();
}

uint64_t sub_100761D80()
{
  return type metadata accessor for TopChartsDiffablePagePresenter.UpdatePhase();
}

uint64_t sub_100761D90()
{
  return TopChartsDiffablePagePresenter.init(objectGraph:pageUrl:sidePackedPage:)();
}

void sub_100761DA0()
{
}

uint64_t sub_100761DB0()
{
  return TopChartsDiffablePagePresenter.segmentPresenters.getter();
}

uint64_t sub_100761DC0()
{
  return TopChartsDiffablePagePresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_100761DD0()
{
  return TopChartsDiffablePagePresenter.initialSegmentIndex.getter();
}

uint64_t sub_100761DE0()
{
  return TopChartsDiffablePagePresenter.onSegmentPresentersUpdated.getter();
}

uint64_t sub_100761DF0()
{
  return TopChartsDiffablePagePresenter.onCategoriesButtonTitleChanged.getter();
}

uint64_t sub_100761E00()
{
  return TopChartsDiffablePagePresenter.title.getter();
}

uint64_t sub_100761E10()
{
  return TopChartsDiffablePagePresenter.update(toCategoryAt:)();
}

uint64_t sub_100761E20()
{
  return TopChartsDiffablePagePresenter.pageUrl.getter();
}

uint64_t sub_100761E30()
{
  return type metadata accessor for TopChartsDiffablePagePresenter();
}

uint64_t sub_100761E40()
{
  return BootstrapPendingClosuresHandler.didComplete(bootstrapPhase:)();
}

uint64_t sub_100761E50()
{
  return BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)();
}

uint64_t sub_100761E60()
{
  return BootstrapPendingClosuresHandler.init()();
}

uint64_t sub_100761E70()
{
  return type metadata accessor for BootstrapPendingClosuresHandler();
}

uint64_t sub_100761E80()
{
  return CondensedSearchResultCardLayout.Configuration.headerFont.getter();
}

Swift::Int sub_100761E90(UITraitCollection in)
{
  return CondensedSearchResultCardLayout.Configuration.titleNumberOfLines(in:)(in);
}

uint64_t sub_100761EA0()
{
  return CondensedSearchResultCardLayout.Configuration.headerNumberOfLines.getter();
}

uint64_t sub_100761EB0()
{
  return CondensedSearchResultCardLayout.Configuration.metrics.getter();
}

uint64_t sub_100761EC0()
{
  return CondensedSearchResultCardLayout.Configuration.titleFont.getter();
}

uint64_t sub_100761ED0()
{
  return type metadata accessor for CondensedSearchResultCardLayout.Configuration();
}

uint64_t sub_100761EE0()
{
  return static CondensedSearchResultCardLayout.estimatedSizeForViewButtonInAXLayouts.getter();
}

uint64_t sub_100761EF0()
{
  return CondensedSearchResultCardLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100761F00()
{
  return CondensedSearchResultCardLayout.Metrics.titleTextSpace.getter();
}

uint64_t sub_100761F10()
{
  return CondensedSearchResultCardLayout.Metrics.headerTextSpace.getter();
}

uint64_t sub_100761F20()
{
  return CondensedSearchResultCardLayout.Metrics.artworkTopMargin.getter();
}

uint64_t sub_100761F30()
{
  return CondensedSearchResultCardLayout.Metrics.artworkBottomMargin.getter();
}

uint64_t sub_100761F40()
{
  return CondensedSearchResultCardLayout.Metrics.artworkAXBottomMargin.getter();
}

uint64_t sub_100761F50()
{
  return CondensedSearchResultCardLayout.Metrics.titleTextBottomMargin.getter();
}

uint64_t sub_100761F60()
{
  return CondensedSearchResultCardLayout.Metrics.viewButtonAXTopMargin.getter();
}

uint64_t sub_100761F70()
{
  return CondensedSearchResultCardLayout.Metrics.overriddingArtworkSize(with:)();
}

uint64_t sub_100761F80()
{
  return static CondensedSearchResultCardLayout.Metrics.appEvent.getter();
}

uint64_t sub_100761F90()
{
  return type metadata accessor for CondensedSearchResultCardLayout.Metrics();
}

uint64_t sub_100761FA0()
{
  return CondensedSearchResultCardLayout.init(metrics:artwork:headerText:titleText:viewButton:isTextBaselineAligned:)();
}

uint64_t sub_100761FB0()
{
  return type metadata accessor for CondensedSearchResultCardLayout();
}

void sub_100761FC0()
{
}

uint64_t sub_100761FE0()
{
  return FlowPreviewActionsConfiguration.offerActionIndex.getter();
}

uint64_t sub_100761FF0()
{
  return FlowPreviewActionsConfiguration.destructiveActionIndex.getter();
}

uint64_t sub_100762000()
{
  return FlowPreviewActionsConfiguration.offerDisplayProperties.getter();
}

uint64_t sub_100762010()
{
  return FlowPreviewActionsConfiguration.actions.getter();
}

uint64_t sub_100762020()
{
  return InstallPageInstallingViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100762030()
{
  return InstallPageInstallingViewLayout.Metrics.init(iconSize:ageRatingMargin:ageRatingBaselineOffset:titleSpace:titleHorizontalMargin:subtitleSpace:subtitleHorizontalMargin:descriptionSpace:descriptionHorizontalMargin:offerButtonMargin:offerButtonSize:bottomSpace:)();
}

uint64_t sub_100762040()
{
  return InstallPageInstallingViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_100762050()
{
  return type metadata accessor for InstallPageInstallingViewLayout.Metrics();
}

uint64_t sub_100762060()
{
  return InstallPageInstallingViewLayout.init(metrics:iconView:progressView:titleText:subtitleText:descriptionText:ageRatingView:offerButton:)();
}

uint64_t sub_100762070()
{
  return type metadata accessor for InstallPageInstallingViewLayout();
}

uint64_t sub_100762080()
{
  return dispatch thunk of NestedModelImpressionsRecording.stopRecordingNestedImpressions(using:)();
}

uint64_t sub_100762090()
{
  return dispatch thunk of NestedModelImpressionsRecording.startRecordingNestedImpressions(for:using:)();
}

uint64_t sub_1007620A0()
{
  return dispatch thunk of NestedModelImpressionsRecording.impressionsCalculator.setter();
}

uint64_t sub_1007620B0()
{
  return NestedModelImpressionsRecording.stopRecordingNestedImpressions(using:)();
}

uint64_t sub_1007620C0()
{
  return NestedModelImpressionsRecording.startRecordingNestedImpressions(for:using:)();
}

uint64_t sub_1007620D0()
{
  return ShelfBackgroundGradientLocation.point.getter();
}

uint64_t sub_1007620E0()
{
  return type metadata accessor for ShelfBackgroundGradientLocation();
}

uint64_t sub_1007620F0()
{
  return SponsoredSearchNativeAdvertData.init(adverts:odmlSuccess:installedStates:)();
}

uint64_t sub_100762100()
{
  return type metadata accessor for SponsoredSearchNativeAdvertData();
}

uint64_t sub_100762110()
{
  return TodayCardMarketingLockupOverlay.hideBackground.getter();
}

uint64_t sub_100762120()
{
  return TodayCardMarketingLockupOverlay.artworkBackgroundColor.getter();
}

uint64_t sub_100762130()
{
  return TodayCardMarketingLockupOverlay.lockup.getter();
}

uint64_t sub_100762140()
{
  return TodayCardMarketingLockupOverlay.paragraph.getter();
}

uint64_t sub_100762150()
{
  return type metadata accessor for TodayCardMarketingLockupOverlay();
}

void sub_100762160()
{
}

void sub_100762170()
{
}

void sub_100762180()
{
}

uint64_t sub_100762190()
{
  return AdvertRotationControllerProvider.viewControllerWillRemoveItems(_:asPartOf:)();
}

void sub_1007621A0()
{
}

uint64_t sub_1007621B0()
{
  return AdvertRotationControllerProvider.advertController(for:asPartOf:createIfRequired:)();
}

uint64_t sub_1007621C0()
{
  return AdvertRotationControllerProvider.advertController(for:asPartOf:)();
}

uint64_t sub_1007621D0()
{
  return AdvertRotationControllerProvider.init(supportsAdvertRotation:advertLifecycleMetricsReporter:)();
}

void sub_1007621E0()
{
}

void sub_1007621F0()
{
}

uint64_t sub_100762200()
{
  return type metadata accessor for AdvertRotationControllerProvider();
}

uint64_t sub_100762210()
{
  return ArcadeDownloadPackCategoriesPage.categories.getter();
}

uint64_t sub_100762220()
{
  return ArcadeDownloadPackCategoriesPage.dismissAction.getter();
}

uint64_t sub_100762230()
{
  return ArcadeDownloadPackCategoriesPage.primaryAction.getter();
}

uint64_t sub_100762240()
{
  return ArcadeDownloadPackCategoriesPage.title.getter();
}

uint64_t sub_100762250()
{
  return ArcadeSubscriptionFieldsProvider.init(arcadeSubscriptionManager:)();
}

uint64_t sub_100762260()
{
  return type metadata accessor for ArcadeSubscriptionFieldsProvider();
}

uint64_t sub_100762270()
{
  return type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition();
}

uint64_t sub_100762280()
{
  return BreakoutDetailsDisplayProperties.position.getter();
}

uint64_t sub_100762290()
{
  return BreakoutDetailsDisplayProperties.wantsBlur.getter();
}

uint64_t sub_1007622A0()
{
  return type metadata accessor for BreakoutDetailsDisplayProperties();
}

uint64_t sub_1007622B0()
{
  return ReviewSummaryReportConcernAction.sendAction.getter();
}

uint64_t sub_1007622C0()
{
  return ReviewSummaryReportConcernAction.comment.getter();
}

uint64_t sub_1007622D0()
{
  return ReviewSummaryReportConcernAction.concerns.getter();
}

uint64_t sub_1007622E0()
{
  return type metadata accessor for ReviewSummaryReportConcernAction();
}

uint64_t sub_1007622F0()
{
  return SearchFocusDiffablePagePresenter.init(objectGraph:sidePackedPage:supportsFastImpressions:advertLifecycleMetricsReporter:)();
}

uint64_t sub_100762300()
{
  return type metadata accessor for SearchFocusDiffablePagePresenter();
}

uint64_t sub_100762310()
{
  return TopChartDiffableSegmentPresenter.shortName.getter();
}

uint64_t sub_100762320()
{
  return ArcadeDownloadPackSuggestionsPage.suggestions.getter();
}

uint64_t sub_100762330()
{
  return ArcadeDownloadPackSuggestionsPage.getAllAction.getter();
}

uint64_t sub_100762340()
{
  return ArcadeDownloadPackSuggestionsPage.primaryAction.getter();
}

uint64_t sub_100762350()
{
  return ArcadeDownloadPackSuggestionsPage.getAllButtonStyle.getter();
}

uint64_t sub_100762360()
{
  return ArcadeDownloadPackSuggestionsPage.primaryActionKind.getter();
}

uint64_t sub_100762370()
{
  return ArcadeDownloadPackSuggestionsPage.primaryActionSecondaryTitle.getter();
}

uint64_t sub_100762380()
{
  return ArcadeDownloadPackSuggestionsPage.title.getter();
}

uint64_t sub_100762390()
{
  return AvatarShowcaseLayoutConfiguration.visibleWidth.getter();
}

uint64_t sub_1007623A0()
{
  return AvatarShowcaseLayoutConfiguration.overlappedWidth.getter();
}

uint64_t sub_1007623B0()
{
  return AvatarShowcaseLayoutConfiguration.width.getter();
}

uint64_t sub_1007623C0()
{
  return AvatarShowcaseLayoutConfiguration.init(width:visibleWidth:)();
}

uint64_t sub_1007623D0()
{
  return type metadata accessor for AvatarShowcaseLayoutConfiguration();
}

uint64_t sub_1007623E0()
{
  return CompoundItemSupplementaryProvider.init(children:)();
}

uint64_t sub_1007623F0()
{
  return type metadata accessor for CompoundItemSupplementaryProvider();
}

void sub_100762400(UIViewController a1)
{
}

void sub_100762410(UIViewController a1)
{
}

uint64_t sub_100762420()
{
  return FloatingUnifiedMessageCoordinator.register(accountButton:with:for:)();
}

uint64_t sub_100762430()
{
  return type metadata accessor for FloatingUnifiedMessageCoordinator();
}

uint64_t sub_100762440()
{
  return type metadata accessor for ImpressionsAppendixMetricsTracker();
}

uint64_t sub_100762450()
{
  return type metadata accessor for OfferButtonPresenterViewAlignment();
}

uint64_t sub_100762460()
{
  return ReusableSupplementaryRegistration.init(elementKind:reuseIdentifier:configurationHandler:)();
}

uint64_t sub_100762470()
{
  return dispatch thunk of ShelfComponentTypeMappingProvider.componentType(for:asPartOf:)();
}

uint64_t sub_100762480()
{
  return static AskToBuyRequestNotificationDetails.notificationName.getter();
}

uint64_t sub_100762490()
{
  return static AskToBuyRequestNotificationDetails.adamIdKey.getter();
}

void sub_1007624A0(Swift::OpaquePointer a1)
{
}

uint64_t sub_1007624B0()
{
  return CompoundCollectionElementsObserver.removingChildren(where:)();
}

uint64_t sub_1007624C0()
{
  return CompoundCollectionElementsObserver.addChild(_:)();
}

uint64_t sub_1007624D0()
{
  return CompoundCollectionElementsObserver.init(children:)();
}

uint64_t sub_1007624E0()
{
  return type metadata accessor for CompoundCollectionElementsObserver();
}

uint64_t sub_1007624F0()
{
  return GameCenterFriendRequestCoordinator.onFriendRequestCountDidUpdate.getter();
}

uint64_t sub_100762500()
{
  return dispatch thunk of GameCenterFriendRequestCoordinator.currentFriendRequestCount.getter();
}

uint64_t sub_100762510()
{
  return type metadata accessor for GameCenterFriendRequestCoordinator();
}

uint64_t sub_100762520()
{
  return IndeterminateProgressConfiguration.init(metrics:alignment:theme:)();
}

uint64_t sub_100762530()
{
  return type metadata accessor for IndeterminateProgressConfiguration();
}

uint64_t sub_100762540()
{
  return MetadataRibbonStarRatingViewLayout.init(starsView:ratingLabelView:metrics:)();
}

uint64_t sub_100762550()
{
  return MetadataRibbonStarRatingViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100762560()
{
  return MetadataRibbonStarRatingViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100762570()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.withStarSize(_:)();
}

uint64_t sub_100762580()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.numberOfStars.getter();
}

uint64_t sub_100762590()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.ratingCountLabelLineBreakMode.getter();
}

uint64_t sub_1007625A0()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.ratingCountLabelNumberOfLines.getter();
}

uint64_t sub_1007625B0()
{
  return static MetadataRibbonStarRatingViewLayout.Metrics.standard.getter();
}

uint64_t sub_1007625C0()
{
  return type metadata accessor for MetadataRibbonStarRatingViewLayout.Metrics();
}

uint64_t sub_1007625D0()
{
  return type metadata accessor for MetadataRibbonStarRatingViewLayout();
}

void sub_1007625E0()
{
}

uint64_t sub_1007625F0()
{
  return type metadata accessor for OnDevicePersonalizationDataManager();
}

uint64_t sub_100762600()
{
  return SearchLandingDiffablePagePresenter.onFocusPageFetched.getter();
}

uint64_t sub_100762610()
{
  return SearchLandingDiffablePagePresenter.init(objectGraph:supportsFastImpressions:advertLifecycleMetricsReporter:)();
}

uint64_t sub_100762620()
{
  return type metadata accessor for SearchLandingDiffablePagePresenter();
}

uint64_t sub_100762630()
{
  return SearchResultsDiffablePagePresenter.onBeginTrackingGuidedSearchImpressions.getter();
}

uint64_t sub_100762640()
{
  return SearchResultsDiffablePagePresenter.onShowNoResults.getter();
}

uint64_t sub_100762650()
{
  return SearchResultsDiffablePagePresenter.onDisplayResultsMessage.getter();
}

uint64_t sub_100762660()
{
  return SearchResultsDiffablePagePresenter.init(objectGraph:guidedSearchPresenter:facetsPresenter:sponsoredSearchSessionManager:term:searchEntity:origin:source:isNetworkConstrained:spellCheckEnabled:excludedTerms:originatingTerm:guidedSearchTokens:guidedSearchOptimizationTerm:appStateController:impressionsAppendixDataProvider:)();
}

uint64_t sub_100762670()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.transparencyLink.getter();
}

uint64_t sub_100762680()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.isAutoPlayEnabled.getter();
}

uint64_t sub_100762690()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.transparencyLinkIndex(columnCount:)();
}

uint64_t sub_1007626A0()
{
  return SearchResultsDiffablePagePresenter.term.getter();
}

uint64_t sub_1007626B0()
{
  return type metadata accessor for SearchResultsDiffablePagePresenter();
}

uint64_t sub_1007626C0()
{
  return ShelfBasedCollectionViewController.collectionViewCellProvider(indexPath:item:asPartOf:)();
}

uint64_t sub_1007626D0()
{
  return ShelfBasedCollectionViewController.supplementaryViewProvider(elementKind:indexPath:asPartOf:)();
}

uint64_t sub_1007626E0()
{
  return ShelfBasedCollectionViewController.makeStateStore()();
}

uint64_t sub_1007626F0()
{
  return ShelfBasedCollectionViewController.pageGridProvider.getter();
}

uint64_t sub_100762700()
{
  return ShelfBasedCollectionViewController.itemLayoutContext(at:)();
}

uint64_t sub_100762710()
{
  return ShelfBasedCollectionViewController.shelfLayoutContext(containing:)();
}

uint64_t sub_100762720()
{
  return ShelfBasedCollectionViewController.shelfLayoutContext(for:)();
}

uint64_t sub_100762730()
{
  return ShelfBasedCollectionViewController.itemSupplementaryProvider.getter();
}

void sub_100762740()
{
}

uint64_t sub_100762750()
{
  return ShelfBasedCollectionViewController.collectionElementsObserver.getter();
}

uint64_t sub_100762760()
{
  return ShelfBasedCollectionViewController.shelfLayoutSpacingProvider.getter();
}

uint64_t sub_100762770()
{
  return ShelfBasedCollectionViewController.shelfSupplementaryProvider.getter();
}

uint64_t sub_100762780()
{
  return ShelfBasedCollectionViewController.updateGlobalSupplementaries(fitting:)();
}

uint64_t sub_100762790()
{
  return ShelfBasedCollectionViewController.shelfComponentTypeMappingProvider.getter();
}

uint64_t sub_1007627A0()
{
  return ShelfBasedCollectionViewController.compositionalLayoutSectionProvider(section:layoutEnvironment:asPartOf:)();
}

uint64_t sub_1007627B0()
{
  return type metadata accessor for TodayCardArtworkSizedLayoutMetrics.LayoutSize();
}

uint64_t sub_1007627C0()
{
  return TodayCardArtworkSizedLayoutMetrics.expandedSize.getter();
}

uint64_t sub_1007627D0()
{
  return TodayCardArtworkSizedLayoutMetrics.collapsedSize.getter();
}

uint64_t sub_1007627E0()
{
  return TodayCardArtworkSizedLayoutMetrics.sourceCropOverride(for:)();
}

uint64_t sub_1007627F0()
{
  return TodayCardArtworkSizedLayoutMetrics.sourceSizeOverride.getter();
}

uint64_t sub_100762800()
{
  return TodayCardArtworkSizedLayoutMetrics.layout(for:)();
}

uint64_t sub_100762810()
{
  return type metadata accessor for TodayCardArtworkSizedLayoutMetrics.Priority();
}

uint64_t sub_100762820()
{
  return static VideoDecoderUnavailableUserInfoKey.playbackId.getter();
}

uint64_t sub_100762830()
{
  return static VideoDecoderUnavailableUserInfoKey.error.getter();
}

uint64_t sub_100762840()
{
  return static ArcadeDebugSubscriptionStateManager.state.setter();
}

uint64_t sub_100762850()
{
  return static ArcadePageScrollToShelfNotification.notificationName.getter();
}

uint64_t sub_100762860()
{
  return static ArcadePageScrollToShelfNotification.shelfId.getter();
}

uint64_t sub_100762870()
{
  return CondensedAdLockupWithIconBackground.backgroundArtwork.getter();
}

uint64_t sub_100762880()
{
  return CondensedAdLockupWithIconBackground.lockup.getter();
}

uint64_t sub_100762890()
{
  return type metadata accessor for CondensedAdLockupWithIconBackground();
}

uint64_t sub_1007628A0()
{
  return static PurchaseCompleteNotificationDetails.purchaseKey.getter();
}

uint64_t sub_1007628B0()
{
  return static PurchaseCompleteNotificationDetails.notificationName.getter();
}

uint64_t sub_1007628C0()
{
  return SearchAdsCollectionElementsObserver.init(presenter:advertControllerProvider:)();
}

uint64_t sub_1007628D0()
{
  return SearchLandingTrendingDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_1007628E0()
{
  return type metadata accessor for SearchLandingTrendingDisplayOptions();
}

uint64_t sub_1007628F0()
{
  return type metadata accessor for ShelfHorizontalScrollTargetBehavior();
}

uint64_t sub_100762900()
{
  return dispatch thunk of AnyReusableSupplementaryRegistration.reconfigureSupplementary(at:in:)();
}

uint64_t sub_100762910()
{
  return dispatch thunk of static ArtworkPrefetchingShelfComponentView.prefetchArtwork(for:with:asPartOf:)();
}

uint64_t sub_100762920()
{
  return dispatch thunk of static ArtworkPrefetchingShelfComponentView.sizingForArtworkPrefetch(in:asPartOf:)();
}

uint64_t sub_100762930()
{
  return AutomationCollectionElementsObserver.init()();
}

uint64_t sub_100762940()
{
  return type metadata accessor for AutomationCollectionElementsObserver();
}

uint64_t sub_100762950()
{
  return LinkableTextCollectionViewCellLayout.Metrics.init(textTopSpace:)();
}

uint64_t sub_100762960()
{
  return type metadata accessor for LinkableTextCollectionViewCellLayout.Metrics();
}

uint64_t sub_100762970()
{
  return LinkableTextCollectionViewCellLayout.init(metrics:textLabel:)();
}

uint64_t sub_100762980()
{
  return type metadata accessor for LinkableTextCollectionViewCellLayout();
}

uint64_t sub_100762990()
{
  return type metadata accessor for MetadataRibbonSecondaryViewPlacement();
}

uint64_t sub_1007629A0()
{
  return PersonalizationFeedbackRequestOption.title.getter();
}

uint64_t sub_1007629B0()
{
  return PersonalizationFeedbackRequestOption.action.getter();
}

uint64_t sub_1007629C0()
{
  return static SelectableShelfComponentViewReaction.reapply.getter();
}

uint64_t sub_1007629D0()
{
  return static SelectableShelfComponentViewReaction.deselect.getter();
}

uint64_t sub_1007629E0()
{
  return static SelectableShelfComponentViewReaction.propagate.getter();
}

uint64_t sub_1007629F0()
{
  return type metadata accessor for SelectableShelfComponentViewReaction();
}

uint64_t sub_100762A00()
{
  return dispatch thunk of static SeparatorProvidingShelfComponentView.separator(in:)();
}

uint64_t sub_100762A10()
{
  return type metadata accessor for UserNotificationsAuthorizationAction();
}

uint64_t sub_100762A20()
{
  return ImpressionsCollectionElementsObserver.init(componentTypeMappingProvider:impressionsCalculator:)();
}

uint64_t sub_100762A30()
{
  return type metadata accessor for ImpressionsCollectionElementsObserver();
}

uint64_t sub_100762A40()
{
  return MetadataRibbonEditorsChoiceViewLayout.init(leadingLaurelView:trailingLaurelView:textLabel:metrics:)();
}

uint64_t sub_100762A50()
{
  return MetadataRibbonEditorsChoiceViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100762A60()
{
  return MetadataRibbonEditorsChoiceViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100762A70()
{
  return static MetadataRibbonEditorsChoiceViewLayout.Metrics.standard.getter();
}

uint64_t sub_100762A80()
{
  return type metadata accessor for MetadataRibbonEditorsChoiceViewLayout.Metrics();
}

uint64_t sub_100762A90()
{
  return type metadata accessor for MetadataRibbonEditorsChoiceViewLayout();
}

uint64_t sub_100762AA0()
{
  return MetadataRibbonIconWithLabelViewLayout.init(descriptionLabelView:artworkView:metrics:)();
}

uint64_t sub_100762AB0()
{
  return MetadataRibbonIconWithLabelViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100762AC0()
{
  return MetadataRibbonIconWithLabelViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100762AD0()
{
  return MetadataRibbonIconWithLabelViewLayout.Metrics.labelNumberOfLines.getter();
}

uint64_t sub_100762AE0()
{
  return MetadataRibbonIconWithLabelViewLayout.Metrics.defaultArtworkHeight.getter();
}

uint64_t sub_100762AF0()
{
  return static MetadataRibbonIconWithLabelViewLayout.Metrics.standard.getter();
}

uint64_t sub_100762B00()
{
  return static MetadataRibbonIconWithLabelViewLayout.Metrics.developer.getter();
}

uint64_t sub_100762B10()
{
  return type metadata accessor for MetadataRibbonIconWithLabelViewLayout.Metrics();
}

uint64_t sub_100762B20()
{
  return type metadata accessor for MetadataRibbonIconWithLabelViewLayout();
}

uint64_t sub_100762B30()
{
  return type metadata accessor for ShelfBackgroundMaterialGradientColors();
}

uint64_t sub_100762B40()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.facetsPresenter.getter();
}

uint64_t sub_100762B50()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.init(objectGraph:pageUrl:facetsPresenter:metricsPipeline:)();
}

uint64_t sub_100762B60()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.displayStyle.getter();
}

uint64_t sub_100762B70()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData.title.getter();
}

uint64_t sub_100762B80()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData.subtitle.getter();
}

uint64_t sub_100762B90()
{
  return type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData();
}

uint64_t sub_100762BA0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.onShowEmptyState.getter();
}

void sub_100762BB0()
{
}

void sub_100762BC0()
{
}

void sub_100762BD0()
{
}

uint64_t sub_100762BE0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_100762BF0()
{
  return type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter();
}

uint64_t sub_100762C00()
{
  return ArcadeSubscriptionOfferButtonPresenter.init(displayProperties:buttonAction:subscribedButtonAction:subtitlePosition:asPartOf:alignment:)();
}

uint64_t sub_100762C10()
{
  return type metadata accessor for ArcadeSubscriptionOfferButtonPresenter();
}

uint64_t sub_100762C20()
{
  return dispatch thunk of InlineUnifiedMessageProvidingPresenter.inlineUnifiedMessagePresenter.getter();
}

uint64_t sub_100762C30()
{
  return SearchFocusTwoColumnListDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_100762C40()
{
  return type metadata accessor for SearchFocusTwoColumnListDisplayOptions();
}

uint64_t sub_100762C50()
{
  return static StandardSearchResultContentViewMetrics.bottomMargin.getter();
}

uint64_t sub_100762C60()
{
  return BadgeContentKeyNumberOfAvatarsToDisplay.getter();
}

uint64_t sub_100762C70()
{
  return MediumAdLockupWithScreenshotsBackground.riverSpeed.getter();
}

uint64_t sub_100762C80()
{
  return MediumAdLockupWithScreenshotsBackground.screenshots.getter();
}

uint64_t sub_100762C90()
{
  return MediumAdLockupWithScreenshotsBackground.backgroundColor.getter();
}

uint64_t sub_100762CA0()
{
  return MediumAdLockupWithScreenshotsBackground.secondaryTextColor.getter();
}

uint64_t sub_100762CB0()
{
  return MediumAdLockupWithScreenshotsBackground.lockup.getter();
}

uint64_t sub_100762CC0()
{
  return type metadata accessor for MediumAdLockupWithScreenshotsBackground();
}

uint64_t sub_100762CD0()
{
  return MetadataRibbonHighlightedTextViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_100762CE0()
{
  return MetadataRibbonHighlightedTextViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100762CF0()
{
  return MetadataRibbonHighlightedTextViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100762D00()
{
  return MetadataRibbonHighlightedTextViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_100762D10()
{
  return MetadataRibbonHighlightedTextViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100762D20()
{
  return type metadata accessor for MetadataRibbonHighlightedTextViewLayout.Metrics();
}

uint64_t sub_100762D30()
{
  return type metadata accessor for MetadataRibbonHighlightedTextViewLayout();
}

uint64_t sub_100762D40()
{
  return Box.read<A>(with:)();
}

uint64_t sub_100762D50()
{
  return Box.init(value:)();
}

uint64_t sub_100762D60()
{
  return Box.write(with:)();
}

uint64_t sub_100762D70()
{
  return ArtworkLoadingCollectionElementsObserver.init(componentTypeMappingProvider:)();
}

uint64_t sub_100762D80()
{
  return type metadata accessor for ArtworkLoadingCollectionElementsObserver();
}

uint64_t sub_100762D90()
{
  return PersonalizationTransparencyPagePresenter.init(objectGraph:)();
}

uint64_t sub_100762DA0()
{
  return dispatch thunk of PersonalizationTransparencyPagePresenter.view.setter();
}

uint64_t sub_100762DB0()
{
  return type metadata accessor for PersonalizationTransparencyPagePresenter();
}

uint64_t sub_100762DC0()
{
  return UpdateGranularNotificationSettingsAction.init(settingIDs:)();
}

uint64_t sub_100762DD0()
{
  return UpdateGranularNotificationSettingsAction.settingIDs.getter();
}

uint64_t sub_100762DE0()
{
  return type metadata accessor for UpdateGranularNotificationSettingsAction();
}

uint64_t sub_100762DF0()
{
  return ArcadeDownloadPackCategoriesPagePresenter.init(objectGraph:subscriptionStatus:)();
}

uint64_t sub_100762E00()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapSkipButton()();
}

uint64_t sub_100762E10()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapContinueButton()();
}

uint64_t sub_100762E20()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.view.setter();
}

uint64_t sub_100762E30()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.toggle(category:)();
}

uint64_t sub_100762E40()
{
  return type metadata accessor for ArcadeDownloadPackCategoriesPagePresenter();
}

uint64_t sub_100762E50()
{
  return TodayCardMediaMediumLockupWithScreenshots.mediumAdLockupWithScreenshotsBackground.getter();
}

uint64_t sub_100762E60()
{
  return type metadata accessor for TodayCardMediaMediumLockupWithScreenshots();
}

uint64_t sub_100762E70()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.hasAskToBuy.getter();
}

uint64_t sub_100762E80()
{
  return ArcadeDownloadPackSuggestionsPagePresenter.init(objectGraph:categories:subscriptionStatus:)();
}

uint64_t sub_100762E90()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapDoneButton()();
}

uint64_t sub_100762EA0()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapGetAllButton()();
}

uint64_t sub_100762EB0()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.page.getter();
}

uint64_t sub_100762EC0()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.view.setter();
}

uint64_t sub_100762ED0()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPagePresenter();
}

uint64_t sub_100762EE0()
{
  return NestedCollectionViewImpressionsCoordinator.init(collectionView:)();
}

uint64_t sub_100762EF0()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.prepareForReuse()();
}

uint64_t sub_100762F00()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.impressionsCalculator.setter();
}

uint64_t sub_100762F10()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.models.setter();
}

uint64_t sub_100762F20()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.register(for:at:)();
}

uint64_t sub_100762F30()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.register(model:for:)();
}

uint64_t sub_100762F40()
{
  return type metadata accessor for NestedCollectionViewImpressionsCoordinator();
}

uint64_t sub_100762F50()
{
  return SelectionHandlerCollectionElementsObserver.init(presenter:componentHeightCache:)();
}

uint64_t sub_100762F60()
{
  return type metadata accessor for SelectionHandlerCollectionElementsObserver();
}

uint64_t sub_100762F70()
{
  return method lookup function for SelectionHandlerCollectionElementsObserver();
}

uint64_t sub_100762F80()
{
  return SelectionHandlerCollectionElementsObserver.deinit();
}

uint64_t sub_100762F90()
{
  return SearchImpressionsCollectionElementsObserver.init(componentTypeMappingProvider:impressionsCalculator:advertRotationControllerProvider:objectGraph:collectionView:)();
}

uint64_t sub_100762FA0()
{
  return type metadata accessor for SearchImpressionsCollectionElementsObserver();
}

uint64_t sub_100762FB0()
{
  return UnimplementedAdvertLifecycleMetricsReporter.init()();
}

uint64_t sub_100762FC0()
{
  return type metadata accessor for UnimplementedAdvertLifecycleMetricsReporter();
}

uint64_t sub_100762FD0()
{
  return VideoRegistrationCollectionElementsObserver.init()();
}

uint64_t sub_100762FE0()
{
  return type metadata accessor for VideoRegistrationCollectionElementsObserver();
}

uint64_t sub_100762FF0()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.measurements(fitting:in:)();
}

uint64_t sub_100763000()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100763010()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100763020()
{
  return type metadata accessor for ChartOrCategoryBrickCollectionViewCellLayout.Metrics();
}

uint64_t sub_100763030()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.init(context:badgeTextView:titleTextView:artworkView:textExclusionRect:)();
}

uint64_t sub_100763040()
{
  return type metadata accessor for ChartOrCategoryBrickCollectionViewCellLayout();
}

uint64_t sub_100763050()
{
  return dispatch thunk of ComponentContainerCollectionElementsObserver.ContainerDelegate.modelContainment.getter();
}

uint64_t sub_100763060()
{
  return ComponentContainerCollectionElementsObserver.ContainerDelegate.itemLayoutContext.getter();
}

uint64_t sub_100763070()
{
  return dispatch thunk of ComponentContainerCollectionElementsObserver.ContainerDelegate.indexPath(ofItem:)();
}

uint64_t sub_100763080()
{
  return ComponentContainerCollectionElementsObserver.init(presenter:parent:scrollObserver:impressionsCalculator:)();
}

uint64_t sub_100763090()
{
  return type metadata accessor for ComponentContainerCollectionElementsObserver();
}

uint64_t sub_1007630A0()
{
  return ModelMappedDiffableDataSourceContentSnapshot.identifierSnapshot.getter();
}

uint64_t sub_1007630B0()
{
  return ModelMappedDiffableDataSourceContentSnapshot.itemModel(for:)();
}

uint64_t sub_1007630C0()
{
  return ModelMappedDiffableDataSourceContentSnapshot.sectionModel(at:)();
}

uint64_t sub_1007630D0()
{
  return ModelMappedDiffableDataSourceContentSnapshot.reloadedItems.getter();
}

uint64_t sub_1007630E0()
{
  return UnimplementedAdvertInteractionMetricsReporter.init()();
}

uint64_t sub_1007630F0()
{
  return type metadata accessor for UnimplementedAdvertInteractionMetricsReporter();
}

uint64_t sub_100763100()
{
  return BadgeContentKeyNumberOfFriendsBeforeTruncation.getter();
}

uint64_t sub_100763110()
{
  return InlineUnifiedMessageCollectionElementsObserver.init(presenter:parentViewController:)();
}

uint64_t sub_100763120()
{
  return type metadata accessor for InlineUnifiedMessageCollectionElementsObserver();
}

uint64_t sub_100763130()
{
  return SearchChartsAndCategoriesDiffablePagePresenter.columnCount.getter();
}

uint64_t sub_100763140()
{
  return SearchChartsAndCategoriesDiffablePagePresenter.init(objectGraph:pageUrl:)();
}

uint64_t sub_100763150()
{
  return type metadata accessor for SearchChartsAndCategoriesDiffablePagePresenter();
}

uint64_t sub_100763160()
{
  return SearchLandingChartsAndCategoriesDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_100763170()
{
  return type metadata accessor for SearchLandingChartsAndCategoriesDisplayOptions();
}

uint64_t sub_100763180()
{
  return ShelfBasedCollectionViewControllerDependencies.init()();
}

uint64_t sub_100763190()
{
  return type metadata accessor for ShelfBasedCollectionViewControllerDependencies();
}

uint64_t sub_1007631A0()
{
  return OnDemandShelfFetchingCollectionElementsObserver.init(presenter:)();
}

uint64_t sub_1007631B0()
{
  return type metadata accessor for OnDemandShelfFetchingCollectionElementsObserver();
}

uint64_t sub_1007631C0()
{
  return Gate.add(condition:)();
}

uint64_t sub_1007631D0()
{
  return Gate.init(queue:passingDelay:)();
}

uint64_t sub_1007631E0()
{
  return Gate.observer.setter();
}

uint64_t sub_1007631F0()
{
  return dispatch thunk of Gate.Condition.isSatisfied.getter();
}

uint64_t sub_100763200()
{
  return dispatch thunk of Gate.Condition.isSatisfied.setter();
}

uint64_t sub_100763210()
{
  return Gate.Condition.init(initialValue:)();
}

uint64_t sub_100763220()
{
  return type metadata accessor for Gate.Condition();
}

uint64_t sub_100763230()
{
  return type metadata accessor for Gate();
}

uint64_t sub_100763240()
{
  return Uber.iconArtwork.getter();
}

uint64_t sub_100763250()
{
  return Uber.compactArtwork.getter();
}

uint64_t sub_100763260()
{
  return type metadata accessor for Uber.Style();
}

uint64_t sub_100763270()
{
  return Uber.init(style:assetType:artwork:compactArtwork:video:compactVideo:iconArtwork:title:)();
}

uint64_t sub_100763280()
{
  return Uber.style.getter();
}

uint64_t sub_100763290()
{
  return Uber.title.getter();
}

uint64_t sub_1007632A0()
{
  return Uber.video.getter();
}

uint64_t sub_1007632B0()
{
  return Uber.artwork.getter();
}

uint64_t sub_1007632C0()
{
  return type metadata accessor for Uber.AssetType();
}

uint64_t sub_1007632D0()
{
  return Uber.assetType.getter();
}

uint64_t sub_1007632E0()
{
  return type metadata accessor for Uber();
}

uint64_t sub_1007632F0()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.countTitle.getter();
}

uint64_t sub_100763300()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.primaryButtonEnabled.getter();
}

uint64_t sub_100763310()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.categorySelectionEnabled.getter();
}

uint64_t sub_100763320()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle();
}

uint64_t sub_100763330()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPagePrimaryActionKind();
}

uint64_t sub_100763340()
{
  return PlayableViewRegistrationCollectionElementsObserver.init()();
}

uint64_t sub_100763350()
{
  return type metadata accessor for PlayableViewRegistrationCollectionElementsObserver();
}

uint64_t sub_100763360()
{
  return dispatch thunk of VisibleShelfSupplementaryCollectionElementsObserver.reconfigureVisibleShelfSupplementaries<A>(in:asPartOf:)();
}

uint64_t sub_100763370()
{
  return VisibleShelfSupplementaryCollectionElementsObserver.init()();
}

uint64_t sub_100763380()
{
  return type metadata accessor for VisibleShelfSupplementaryCollectionElementsObserver();
}

uint64_t sub_100763390()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.init(borderedTextView:descriptionLabelTextView:metrics:)();
}

uint64_t sub_1007633A0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.measurements(fitting:in:)();
}

uint64_t sub_1007633B0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007633C0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.init(borderTextToLabelPadding:maximumNumberofLinesForDescriptionLabel:maximumNumberOfLinesForBorderedLabel:)();
}

uint64_t sub_1007633D0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.maximumNumberOfLinesForBorderedLabel.getter();
}

uint64_t sub_1007633E0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_1007633F0()
{
  return type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics();
}

uint64_t sub_100763400()
{
  return type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout();
}

uint64_t sub_100763410()
{
  return Badge.clickAction.getter();
}

uint64_t sub_100763420()
{
  return Badge.longCaption.getter();
}

uint64_t sub_100763430()
{
  return Badge.isMonochrome.getter();
}

uint64_t sub_100763440()
{
  return Badge.leadingValue.getter();
}

uint64_t sub_100763450()
{
  return dispatch thunk of Badge.isTruncatable.getter();
}

uint64_t sub_100763460()
{
  return Badge.impressionMetrics.getter();
}

uint64_t sub_100763470()
{
  return Badge.accessibilityTitle.getter();
}

uint64_t sub_100763480()
{
  return Badge.accessibilityCaption.getter();
}

uint64_t sub_100763490()
{
  return dispatch thunk of Badge.accessibilityIdentifier.getter();
}

uint64_t sub_1007634A0()
{
  return Badge.init(id:type:heading:caption:longCaption:content:leadingValue:style:accessibilityTitle:accessibilityCaption:clickAction:artwork:trailingArtwork:isMonochrome:impressionMetrics:)();
}

uint64_t sub_1007634B0()
{
  return Badge.id.getter();
}

uint64_t sub_1007634C0()
{
  return Badge.type.getter();
}

uint64_t sub_1007634D0()
{
  return Badge.style.getter();
}

uint64_t sub_1007634E0()
{
  return Badge.artwork.getter();
}

uint64_t sub_1007634F0()
{
  return Badge.caption.getter();
}

uint64_t sub_100763500()
{
  return Badge.content.getter();
}

uint64_t sub_100763510()
{
  return Badge.heading.getter();
}

uint64_t sub_100763520()
{
  return type metadata accessor for Badge();
}

uint64_t sub_100763530()
{
  return Brick.accessibilityLabel.getter();
}

uint64_t sub_100763540()
{
  return Brick.shortEditorialDescription.getter();
}

uint64_t sub_100763550()
{
  return type metadata accessor for Brick();
}

uint64_t sub_100763560()
{
  return Quote.isFullWidthArtwork.getter();
}

uint64_t sub_100763570()
{
  return Quote.text.getter();
}

uint64_t sub_100763580()
{
  return Quote.credit.getter();
}

uint64_t sub_100763590()
{
  return Quote.artwork.getter();
}

uint64_t sub_1007635A0()
{
  return type metadata accessor for Quote();
}

uint64_t sub_1007635B0()
{
  return Shelf.background.getter();
}

uint64_t sub_1007635C0()
{
  return Shelf.ContentType.doesModelContainment.getter();
}

uint64_t sub_1007635D0()
{
  return Shelf.ContentType.string.getter();
}

uint64_t sub_1007635E0()
{
  return Shelf.ContentType.rawValue.getter();
}

uint64_t sub_1007635F0()
{
  return type metadata accessor for Shelf.ContentType();
}

uint64_t sub_100763600()
{
  return Shelf.contentType.getter();
}

uint64_t sub_100763610()
{
  return Shelf.footerTitle.getter();
}

uint64_t sub_100763620()
{
  return Shelf.isHorizontal.getter();
}

uint64_t sub_100763630()
{
  return Shelf.seeAllAction.getter();
}

uint64_t sub_100763640()
{
  return Shelf.titleArtwork.getter();
}

uint64_t sub_100763650()
{
  return Shelf.rowsPerColumn.getter();
}

uint64_t sub_100763660()
{
  return Shelf.eyebrowArtwork.getter();
}

uint64_t sub_100763670()
{
  return Shelf.accessoryAction.getter();
}

uint64_t sub_100763680()
{
  return Shelf.trailingArtwork.getter();
}

uint64_t sub_100763690()
{
  return type metadata accessor for Shelf.ContentsMetadata();
}

uint64_t sub_1007636A0()
{
  return Shelf.contentsMetadata.getter();
}

uint64_t sub_1007636B0()
{
  return static Shelf.PresentationHints.isSeeAllContext.getter();
}

uint64_t sub_1007636C0()
{
  return static Shelf.PresentationHints.isAppleArcadeContext.getter();
}

uint64_t sub_1007636D0()
{
  return static Shelf.PresentationHints.showSupplementaryText.getter();
}

uint64_t sub_1007636E0()
{
  return static Shelf.PresentationHints.inProductPageSpotlight.getter();
}

uint64_t sub_1007636F0()
{
  return static Shelf.PresentationHints.accessoriesFollowBackground.getter();
}

uint64_t sub_100763700()
{
  return static Shelf.PresentationHints.sortable.getter();
}

uint64_t sub_100763710()
{
  return type metadata accessor for Shelf.PresentationHints();
}

uint64_t sub_100763720()
{
  return Shelf.impressionMetrics.getter();
}

uint64_t sub_100763730()
{
  return Shelf.presentationHints.getter();
}

uint64_t sub_100763740()
{
  return Shelf.prefetchableArtwork.getter();
}

uint64_t sub_100763750()
{
  return Shelf.placeholderContentType.getter();
}

uint64_t sub_100763760()
{
  return Shelf.init(id:contentType:placeholderContentType:marker:items:header:url:mergeWhenFetched:batchGroup:fetchStrategy:footerTitle:footerAction:isHidden:isHorizontal:horizontalScrollTargetBehavior:isPersonalized:rowsPerColumn:background:onShouldRemoveModel:removeModelEvents:presentationHints:contentsMetadata:nextPreferredContentRefreshDate:impressionMetrics:refreshUrl:pageChangeMetrics:adIncidents:)();
}

uint64_t sub_100763770()
{
  return Shelf.id.getter();
}

uint64_t sub_100763780()
{
  return Shelf.items.getter();
}

uint64_t sub_100763790()
{
  return Shelf.title.getter();
}

uint64_t sub_1007637A0()
{
  return Shelf.header.getter();
}

uint64_t sub_1007637B0()
{
  return Shelf.eyebrow.getter();
}

uint64_t sub_1007637C0()
{
  return Shelf.isHidden.getter();
}

uint64_t sub_1007637D0()
{
  return Shelf.subtitle.getter();
}

uint64_t sub_1007637E0()
{
  return type metadata accessor for Shelf();
}

uint64_t sub_1007637F0()
{
  return Video.playbackId.getter();
}

uint64_t sub_100763800()
{
  return Video.allowsAutoPlay.getter();
}

uint64_t sub_100763810()
{
  return Video.playbackControls.getter();
}

uint64_t sub_100763820()
{
  return Video.canPlayFullScreen.getter();
}

uint64_t sub_100763830()
{
  return Video.templateClickEvent.getter();
}

uint64_t sub_100763840()
{
  return Video.templateMediaEvent.getter();
}

uint64_t sub_100763850()
{
  return Video.autoPlayPlaybackControls.getter();
}

uint64_t sub_100763860()
{
  return Video.looping.getter();
}

uint64_t sub_100763870()
{
  return Video.preview.getter();
}

uint64_t sub_100763880()
{
  return Video.videoUrl.getter();
}

uint64_t sub_100763890()
{
  return type metadata accessor for Video();
}

uint64_t sub_1007638A0()
{
  return dispatch thunk of Action.clickSender.getter();
}

uint64_t sub_1007638B0()
{
  return dispatch thunk of Action.clickSender.setter();
}

uint64_t sub_1007638C0()
{
  return Action.actionMetrics.getter();
}

uint64_t sub_1007638D0()
{
  return Action.impressionMetrics.getter();
}

uint64_t sub_1007638E0()
{
  return Action.presentationStyle.getter();
}

uint64_t sub_1007638F0()
{
  return Action.init(id:title:artwork:presentationStyle:actionMetrics:impressionMetrics:)();
}

uint64_t sub_100763900()
{
  return Action.id.getter();
}

uint64_t sub_100763910()
{
  return Action.title.getter();
}

uint64_t sub_100763920()
{
  return Action.artwork.getter();
}

uint64_t sub_100763930()
{
  return type metadata accessor for Action();
}

uint64_t sub_100763940()
{
  return AdamId.numberValue.getter();
}

uint64_t sub_100763950()
{
  return AdamId.stringValue.getter();
}

uint64_t sub_100763960()
{
  return static AdamId.== infix(_:_:)();
}

uint64_t sub_100763970()
{
  return AdamId.init(value:)();
}

uint64_t sub_100763980()
{
  return AdamId.init(value:)();
}

uint64_t sub_100763990()
{
  return type metadata accessor for AdamId();
}

uint64_t sub_1007639A0()
{
  return Banner.hideCriteria.getter();
}

uint64_t sub_1007639B0()
{
  return Banner.leadingArtwork.getter();
}

uint64_t sub_1007639C0()
{
  return Banner.includeBackgroundBorder.getter();
}

uint64_t sub_1007639D0()
{
  return Banner.leadingArtworkTintColor.getter();
}

uint64_t sub_1007639E0()
{
  return Banner.action.getter();
}

uint64_t sub_1007639F0()
{
  return Banner.message.getter();
}

uint64_t sub_100763A00()
{
  return type metadata accessor for Banner();
}

uint64_t sub_100763A10()
{
  return Lockup.clickAction.getter();
}

uint64_t sub_100763A20()
{
  return dispatch thunk of Lockup.clickSender.getter();
}

uint64_t sub_100763A30()
{
  return dispatch thunk of Lockup.decorations.getter();
}

uint64_t sub_100763A40()
{
  return Lockup.ratingCount.getter();
}

uint64_t sub_100763A50()
{
  return Lockup.buttonAction.getter();
}

uint64_t sub_100763A60()
{
  return Lockup.useAdsLocale.getter();
}

uint64_t sub_100763A70()
{
  return Lockup.tertiaryTitle.getter();
}

uint64_t sub_100763A80()
{
  return Lockup.crossLinkTitle.getter();
}

uint64_t sub_100763A90()
{
  return Lockup.contextMenuData.getter();
}

uint64_t sub_100763AA0()
{
  return Lockup.includeBetaApps.getter();
}

uint64_t sub_100763AB0()
{
  return Lockup.isEditorsChoice.getter();
}

uint64_t sub_100763AC0()
{
  return Lockup.developerTagline.getter();
}

uint64_t sub_100763AD0()
{
  return Lockup.editorialTagline.getter();
}

uint64_t sub_100763AE0()
{
  return Lockup.crossLinkSubtitle.getter();
}

uint64_t sub_100763AF0()
{
  return Lockup.impressionMetrics.getter();
}

uint64_t sub_100763B00()
{
  return Lockup.subtitleTextColor.getter();
}

uint64_t sub_100763B10()
{
  return Lockup.subtitleTextFilter.getter();
}

uint64_t sub_100763B20()
{
  return Lockup.editorialDescription.getter();
}

uint64_t sub_100763B30()
{
  return Lockup.offerDisplayProperties.getter();
}

uint64_t sub_100763B40()
{
  return Lockup.shortEditorialDescription.getter();
}

uint64_t sub_100763B50()
{
  return Lockup.icon.getter();
}

uint64_t sub_100763B60()
{
  return Lockup.title.getter();
}

uint64_t sub_100763B70()
{
  return Lockup.adamId.getter();
}

uint64_t sub_100763B80()
{
  return Lockup.rating.getter();
}

uint64_t sub_100763B90()
{
  return dispatch thunk of Lockup.artwork.getter();
}

uint64_t sub_100763BA0()
{
  return Lockup.heading.getter();
}

uint64_t sub_100763BB0()
{
  return Lockup.ordinal.getter();
}

uint64_t sub_100763BC0()
{
  return Lockup.bundleId.getter();
}

uint64_t sub_100763BD0()
{
  return Lockup.children.getter();
}

uint64_t sub_100763BE0()
{
  return Lockup.searchAd.getter();
}

uint64_t sub_100763BF0()
{
  return Lockup.subtitle.getter();
}

uint64_t sub_100763C00()
{
  return Lockup.ageRating.getter();
}

uint64_t sub_100763C10()
{
  return type metadata accessor for Lockup();
}

uint64_t sub_100763C20()
{
  return Review.moreAction.getter();
}

uint64_t sub_100763C30()
{
  return Review.reviewerName.getter();
}

uint64_t sub_100763C40()
{
  return Review.dateAuthorText.getter();
}

uint64_t sub_100763C50()
{
  return Review.init(id:title:date:dateText:badge:contents:rating:reviewerName:dateAuthorText:response:moreAction:flowPreviewActionsConfiguration:impressionMetrics:voteActions:)();
}

uint64_t sub_100763C60()
{
  return Review.id.getter();
}

uint64_t sub_100763C70()
{
  return Review.title.getter();
}

uint64_t sub_100763C80()
{
  return Review.rating.getter();
}

uint64_t sub_100763C90()
{
  return Review.contents.getter();
}

uint64_t sub_100763CA0()
{
  return Review.dateText.getter();
}

uint64_t sub_100763CB0()
{
  return Review.response.getter();
}

uint64_t sub_100763CC0()
{
  return type metadata accessor for Review();
}

uint64_t sub_100763CD0()
{
  return Shadow.blurRadius.getter();
}

uint64_t sub_100763CE0()
{
  return Shadow.init(color:blurRadius:offset:)();
}

uint64_t sub_100763CF0()
{
  return Shadow.color.getter();
}

uint64_t sub_100763D00()
{
  return Shadow.offset.getter();
}

uint64_t sub_100763D10()
{
  return type metadata accessor for Shadow();
}

uint64_t sub_100763D20()
{
  return inject(_:from:)();
}

uint64_t sub_100763D30()
{
  return inject(_:from:)();
}

uint64_t sub_100763D40()
{
  return inject(_:from:)();
}

uint64_t sub_100763D50()
{
  return inject(_:from:)();
}

uint64_t sub_100763D60()
{
  return inject(_:from:)();
}

uint64_t sub_100763D70()
{
  return inject(_:from:)();
}

uint64_t sub_100763D80()
{
  return inject(_:from:)();
}

uint64_t sub_100763D90()
{
  return inject(_:from:)();
}

uint64_t sub_100763DA0()
{
  return inject(_:from:)();
}

uint64_t sub_100763DB0()
{
  return inject(_:from:)();
}

uint64_t sub_100763DC0()
{
  return dispatch thunk of Artwork.isPortrait.getter();
}

uint64_t sub_100763DD0()
{
  return Artwork.URLTemplate.isSystemImage.getter();
}

uint64_t sub_100763DE0()
{
  return static Artwork.URLTemplate.resourceScheme.getter();
}

uint64_t sub_100763DF0()
{
  return Artwork.URLTemplate.init(rawValue:)();
}

uint64_t sub_100763E00()
{
  return Artwork.URLTemplate.rawValue.getter();
}

uint64_t sub_100763E10()
{
  return type metadata accessor for Artwork.URLTemplate();
}

uint64_t sub_100763E20()
{
  return dispatch thunk of Artwork.bestVariant(prefersLayeredImage:)();
}

uint64_t sub_100763E30()
{
  return Artwork.contentMode.getter();
}

uint64_t sub_100763E40()
{
  return dispatch thunk of Artwork.isLandscape.getter();
}

uint64_t sub_100763E50()
{
  return dispatch thunk of Artwork.isLocalImage.getter();
}

uint64_t sub_100763E60()
{
  return dispatch thunk of Artwork.isBundleImage.getter();
}

uint64_t sub_100763E70()
{
  return dispatch thunk of Artwork.isSystemImage.getter();
}

uint64_t sub_100763E80()
{
  return Artwork.backgroundColor.getter();
}

uint64_t sub_100763E90()
{
  return dispatch thunk of Artwork.systemImageName.getter();
}

uint64_t sub_100763EA0()
{
  return Artwork.backgroundGradientColor.getter();
}

uint64_t sub_100763EB0()
{
  return dispatch thunk of Artwork.symbolImageMeasurements(using:fallBackSize:)();
}

uint64_t sub_100763EC0()
{
  return static Artwork.== infix(_:_:)();
}

uint64_t sub_100763ED0()
{
  return dispatch thunk of Artwork.__allocating_init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)();
}

uint64_t sub_100763EE0()
{
  return static Artwork.Crop.sourceSize.getter();
}

uint64_t sub_100763EF0()
{
  return static Artwork.Crop.boundingBox.getter();
}

uint64_t sub_100763F00()
{
  return Artwork.Crop.preferredContentMode.getter();
}

uint64_t sub_100763F10()
{
  return static Artwork.Crop.fn.getter();
}

uint64_t sub_100763F20()
{
  return type metadata accessor for Artwork.Crop();
}

uint64_t sub_100763F30()
{
  return Artwork.crop.getter();
}

uint64_t sub_100763F40()
{
  return Artwork.size.getter();
}

uint64_t sub_100763F50()
{
  return Artwork.Style.cornerStyle.getter();
}

uint64_t sub_100763F60()
{
  return Artwork.Style.iconHeight(fromWidth:)();
}

uint64_t sub_100763F70()
{
  return Artwork.Style.orIfUnspecified(_:)();
}

uint64_t sub_100763F80()
{
  return Artwork.Style.iconCornerRadius(for:)();
}

uint64_t sub_100763F90()
{
  return Artwork.Style.iconWidth(fromHeight:)();
}

uint64_t sub_100763FA0()
{
  return type metadata accessor for Artwork.Style();
}

uint64_t sub_100763FB0()
{
  return Artwork.style.getter();
}

uint64_t sub_100763FC0()
{
  return type metadata accessor for Artwork.Format();
}

uint64_t sub_100763FD0()
{
  return Artwork.config(using:cropCodeOverride:prefersLayeredImage:)();
}

uint64_t sub_100763FE0()
{
  return Artwork.config(using:)();
}

uint64_t sub_100763FF0()
{
  return Artwork.config(_:mode:prefersLayeredImage:)();
}

uint64_t sub_100764000()
{
  return Artwork.Variant.format.getter();
}

uint64_t sub_100764010()
{
  return Artwork.Variant.quality.getter();
}

uint64_t sub_100764020()
{
  return type metadata accessor for Artwork.Variant();
}

uint64_t sub_100764030()
{
  return Artwork.artwork.getter();
}

uint64_t sub_100764040()
{
  return Artwork.template.getter();
}

uint64_t sub_100764050()
{
  return type metadata accessor for Artwork();
}

uint64_t sub_100764060()
{
  return type metadata accessor for Feature.iOS();
}

uint64_t sub_100764070()
{
  return type metadata accessor for Feature();
}

uint64_t sub_100764080()
{
  return PageTab.id.getter();
}

uint64_t sub_100764090()
{
  return PageTab.title.getter();
}

uint64_t sub_1007640A0()
{
  return PageTab.action.getter();
}

uint64_t sub_1007640B0()
{
  return Ratings.totalNumberOfRatings.getter();
}

uint64_t sub_1007640C0()
{
  return Ratings.ratingCounts.getter();
}

uint64_t sub_1007640D0()
{
  return Ratings.ratingAverage.getter();
}

uint64_t sub_1007640E0()
{
  return Ratings.status.getter();
}

uint64_t sub_1007640F0()
{
  return type metadata accessor for Ratings();
}

uint64_t sub_100764100()
{
  return dispatch thunk of Commerce.cancelPreorder(for:isArcade:)();
}

uint64_t sub_100764110()
{
  return dispatch thunk of Commerce.purchase(with:stateMachine:)();
}

uint64_t sub_100764120()
{
  return type metadata accessor for Commerce();
}

uint64_t sub_100764130()
{
  return Copyable.copyWithOverrides(in:)();
}

uint64_t sub_100764140()
{
  return FlowPage.isPreviewingSupported.getter();
}

uint64_t sub_100764150()
{
  return type metadata accessor for FlowPage();
}

uint64_t sub_100764160()
{
  return dispatch thunk of Footnote.clickAction.getter();
}

uint64_t sub_100764170()
{
  return dispatch thunk of Footnote.clickSender.getter();
}

uint64_t sub_100764180()
{
  return Footnote.presentationStyle.getter();
}

uint64_t sub_100764190()
{
  return Footnote.text.getter();
}

uint64_t sub_1007641A0()
{
  return type metadata accessor for Footnote();
}

uint64_t sub_1007641B0()
{
  return static PageGrid.Breakpoint.== infix(_:_:)();
}

uint64_t sub_1007641C0()
{
  return PageGrid.Breakpoint.init(range:columnCount:columnExtendsToFillWidth:minimumColumnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_1007641D0()
{
  return PageGrid.Breakpoint.init(range:columnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_1007641E0()
{
  return PageGrid.Breakpoint.init(range:centeredColumnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_1007641F0()
{
  return PageGrid.Breakpoint.centered.getter();
}

uint64_t sub_100764200()
{
  return type metadata accessor for PageGrid.Breakpoint();
}

uint64_t sub_100764210()
{
  return PageGrid.columnCount.getter();
}

uint64_t sub_100764220()
{
  return PageGrid.columnWidth.getter();
}

uint64_t sub_100764230()
{
  return PageGrid.interRowSpace.getter();
}

uint64_t sub_100764240()
{
  return PageGrid.containerWidth.getter();
}

uint64_t sub_100764250()
{
  return PageGrid.safeAreaInsets.getter();
}

uint64_t sub_100764260()
{
  return PageGrid.containerHeight.getter();
}

uint64_t sub_100764270()
{
  return PageGrid.DirectionalValue.init(horizontal:vertical:)();
}

uint64_t sub_100764280()
{
  return static PageGrid.DirectionalValue<>.zero.getter();
}

uint64_t sub_100764290()
{
  return PageGrid.DirectionalValue.init(_:)();
}

uint64_t sub_1007642A0()
{
  return PageGrid.activeBreakPoint.getter();
}

uint64_t sub_1007642B0()
{
  return PageGrid.interColumnSpace.getter();
}

uint64_t sub_1007642C0()
{
  return static PageGrid.HorizontalMargins.zero.getter();
}

uint64_t sub_1007642D0()
{
  return type metadata accessor for PageGrid.HorizontalMargins();
}

uint64_t sub_1007642E0()
{
  return PageGrid.horizontalMargins.getter();
}

uint64_t sub_1007642F0()
{
  return PageGrid.componentMeasuringSize(spanning:)();
}

uint64_t sub_100764300()
{
  return PageGrid.smallestPossibleColumnWidth.getter();
}

uint64_t sub_100764310()
{
  return PageGrid.horizontalDirectionalMargins.getter();
}

uint64_t sub_100764320()
{
  return PageGrid.init(from:breakpointOverrides:)();
}

uint64_t sub_100764330()
{
  return PageGrid.init(name:direction:containerSize:safeAreaInsets:requiresAdditionalSafeAreaMargins:breakpoints:)();
}

uint64_t sub_100764340()
{
  return static PageGrid.Direction.== infix(_:_:)();
}

uint64_t sub_100764350()
{
  return type metadata accessor for PageGrid.Direction();
}

uint64_t sub_100764360()
{
  return PageGrid.direction.getter();
}

uint64_t sub_100764370()
{
  return type metadata accessor for PageGrid();
}

uint64_t sub_100764380()
{
  return PageTabs.selectedTabId.getter();
}

uint64_t sub_100764390()
{
  return PageTabs.tabs.getter();
}

uint64_t sub_1007643A0()
{
  return type metadata accessor for PageTabs();
}

uint64_t sub_1007643B0()
{
  return Response.contents.getter();
}

uint64_t sub_1007643C0()
{
  return Response.dateText.getter();
}

uint64_t sub_1007643D0()
{
  return SearchAd.advertisingText.getter();
}

uint64_t sub_1007643E0()
{
  return SearchAd.adTransparencyAction.getter();
}

uint64_t sub_1007643F0()
{
  return Trailers.mediaPlatform.getter();
}

uint64_t sub_100764400()
{
  return Trailers.videos.getter();
}

unint64_t sub_100764410(UITraitCollection in)
{
  return (unint64_t)Wordmark.asset(in:)(in);
}

uint64_t sub_100764420()
{
  return type metadata accessor for Wordmark();
}

uint64_t sub_100764430()
{
  return BadgeType.rendersNatively.getter();
}

uint64_t sub_100764440()
{
  return type metadata accessor for BadgeType();
}

uint64_t sub_100764450()
{
  return dispatch thunk of Gladiator.rule(named:)();
}

uint64_t sub_100764460()
{
  return Gladiator.__allocating_init()();
}

uint64_t sub_100764470()
{
  return type metadata accessor for Gladiator();
}

uint64_t sub_100764480()
{
  return OfferItem.iapArtwork.getter();
}

uint64_t sub_100764490()
{
  return OfferItem.description.getter();
}

uint64_t sub_1007644A0()
{
  return OfferItem.offerLockup.getter();
}

uint64_t sub_1007644B0()
{
  return OfferItem.moduleArtwork.getter();
}

uint64_t sub_1007644C0()
{
  return OfferItem.mediaOverlayStyle.getter();
}

uint64_t sub_1007644D0()
{
  return OfferItem.formattedEndDateString.getter();
}

uint64_t sub_1007644E0()
{
  return OfferItem.badge.getter();
}

uint64_t sub_1007644F0()
{
  return OfferItem.title.getter();
}

uint64_t sub_100764500()
{
  return OfferItem.subtitle.getter();
}

uint64_t sub_100764510()
{
  return type metadata accessor for OfferItem();
}

uint64_t sub_100764520()
{
  return type metadata accessor for OfferTint();
}

uint64_t sub_100764530()
{
  return type metadata accessor for OfferType();
}

uint64_t sub_100764540()
{
  return Paragraph.isCollapsed.getter();
}

uint64_t sub_100764550()
{
  return Paragraph.collapsedText.getter();
}

uint64_t sub_100764560()
{
  return Paragraph.suppressVerticalMargins.getter();
}

uint64_t sub_100764570()
{
  return Paragraph.init(id:text:wantsCollapsedNewlines:alignment:style:isCollapsed:suppressVerticalMargins:impressionMetrics:)();
}

uint64_t sub_100764580()
{
  return Paragraph.text.getter();
}

uint64_t sub_100764590()
{
  return Paragraph.Style.smallerTextStyle.getter();
}

uint64_t sub_1007645A0()
{
  return Paragraph.Style.textStyle.getter();
}

uint64_t sub_1007645B0()
{
  return type metadata accessor for Paragraph.Style();
}

uint64_t sub_1007645C0()
{
  return Paragraph.style.getter();
}

uint64_t sub_1007645D0()
{
  return type metadata accessor for Paragraph.Alignment();
}

uint64_t sub_1007645E0()
{
  return Paragraph.alignment.getter();
}

uint64_t sub_1007645F0()
{
  return type metadata accessor for Paragraph();
}

uint64_t sub_100764600()
{
  return RiverView.init(dataSource:styling:)();
}

uint64_t sub_100764610()
{
  return dispatch thunk of RiverView.dataSource.getter();
}

uint64_t sub_100764620()
{
  return dispatch thunk of RiverView.setSpacing(interRowSpacing:interItemSpacing:)();
}

uint64_t sub_100764630()
{
  return dispatch thunk of RiverView.isAnimating.getter();
}

uint64_t sub_100764640()
{
  return dispatch thunk of RiverView.isAnimating.setter();
}

uint64_t sub_100764650()
{
  return dispatch thunk of RiverView.setItemSize(size:)();
}

uint64_t sub_100764660()
{
  return dispatch thunk of RiverView.interRowSpacing.getter();
}

uint64_t sub_100764670()
{
  return dispatch thunk of RiverView.isTransitioning.setter();
}

uint64_t sub_100764680()
{
  return dispatch thunk of RiverView.cleanUp()();
}

uint64_t sub_100764690()
{
  return dispatch thunk of RiverView.itemSize.getter();
}

uint64_t sub_1007646A0()
{
  return dispatch thunk of RiverView.flushRows()();
}

uint64_t sub_1007646B0()
{
  return TapToRate.rateAction.getter();
}

uint64_t sub_1007646C0()
{
  return TapToRate.title.getter();
}

uint64_t sub_1007646D0()
{
  return type metadata accessor for TapToRate();
}

uint64_t sub_1007646E0()
{
  return TodayCard.shortTitle.getter();
}

uint64_t sub_1007646F0()
{
  return TodayCard.clickAction.getter();
}

uint64_t sub_100764700()
{
  return TodayCard.titleArtwork.getter();
}

uint64_t sub_100764710()
{
  return TodayCard.backgroundColor.getter();
}

uint64_t sub_100764720()
{
  return TodayCard.collapsedHeading.getter();
}

uint64_t sub_100764730()
{
  return TodayCard.impressionMetrics.getter();
}

uint64_t sub_100764740()
{
  return TodayCard.inlineDescription.getter();
}

uint64_t sub_100764750()
{
  return TodayCard.titleCharacteristics.getter();
}

uint64_t sub_100764760()
{
  return TodayCard.supportsMediaMirroring.getter();
}

uint64_t sub_100764770()
{
  return TodayCard.editorialDisplayOptions.getter();
}

uint64_t sub_100764780()
{
  return TodayCard.Style.overlayTextColor.getter();
}

uint64_t sub_100764790()
{
  return TodayCard.Style.cardTitleTextColor.getter();
}

uint64_t sub_1007647A0()
{
  return TodayCard.Style.cardHeadingTextColor.getter();
}

uint64_t sub_1007647B0()
{
  return TodayCard.Style.overlayBackgroundColor.getter();
}

uint64_t sub_1007647C0()
{
  return TodayCard.Style.overlayDetailTextColor.getter();
}

uint64_t sub_1007647D0()
{
  return TodayCard.Style.rawValue.getter();
}

uint64_t sub_1007647E0()
{
  return type metadata accessor for TodayCard.Style();
}

uint64_t sub_1007647F0()
{
  return TodayCard.media.getter();
}

uint64_t sub_100764800()
{
  return TodayCard.style.getter();
}

uint64_t sub_100764810()
{
  return TodayCard.title.getter();
}

uint64_t sub_100764820()
{
  return TodayCard.heading.getter();
}

uint64_t sub_100764830()
{
  return TodayCard.overlay.getter();
}

uint64_t sub_100764840()
{
  return TodayCard.searchAd.getter();
}

uint64_t sub_100764850()
{
  return type metadata accessor for TodayCard();
}

uint64_t sub_100764860()
{
  return VideoCard.overlayStyle.getter();
}

uint64_t sub_100764870()
{
  return VideoCard.video.getter();
}

uint64_t sub_100764880()
{
  return VideoCard.lockup.getter();
}

uint64_t sub_100764890()
{
  return type metadata accessor for VideoCard();
}

uint64_t sub_1007648A0()
{
  return type metadata accessor for ReviewResult();
}

uint64_t sub_1007648B0()
{
  return ReviewContext.init(accentColor:lockupStyle:lockupDetails:mediaTaskType:clientInfo:itemIdentifier:itemVersion:)();
}

uint64_t sub_1007648C0()
{
  return type metadata accessor for ReviewContext();
}

uint64_t sub_1007648D0()
{
  return ReviewCoordinator.init()();
}

uint64_t sub_1007648E0()
{
  return type metadata accessor for ReviewCoordinator();
}

uint64_t sub_1007648F0()
{
  return ReviewLockupDetails.init(name:itemDescription:artworkURLTemplate:)();
}

uint64_t sub_100764900()
{
  return type metadata accessor for ReviewLockupDetails();
}

uint64_t sub_100764910()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_100764920()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100764930()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100764940()
{
  return Logger.logObject.getter();
}

uint64_t sub_100764950()
{
  return Logger.init()();
}

uint64_t sub_100764960()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100764970()
{
  return static Dimensions.defaultRoundingRule.getter();
}

uint64_t sub_100764980()
{
  return FontSource.font(in:for:)();
}

UIFont sub_100764990(UITraitCollection compatibleWith)
{
  return FontSource.font(compatibleWith:)(compatibleWith);
}

uint64_t sub_1007649A0()
{
  return type metadata accessor for FontSource();
}

uint64_t sub_1007649B0()
{
  return LayoutRect.init(representing:)();
}

uint64_t sub_1007649C0()
{
  return LayoutRect.size.modify();
}

uint64_t sub_1007649D0()
{
  return LayoutRect.size.getter();
}

uint64_t sub_1007649E0()
{
  return LayoutRect.origin.getter();
}

uint64_t sub_1007649F0()
{
  return type metadata accessor for LayoutRect();
}

uint64_t sub_100764A00()
{
  return dispatch thunk of LayoutView.hasContent.getter();
}

uint64_t sub_100764A10()
{
  return LayoutView.nilIfHidden()();
}

uint64_t sub_100764A20()
{
  return dispatch thunk of LayoutView.frame.getter();
}

uint64_t sub_100764A30()
{
  return dispatch thunk of LayoutView.frame.setter();
}

uint64_t sub_100764A40()
{
  return dispatch thunk of LayoutView.isHidden.getter();
}

uint64_t sub_100764A50()
{
  return dispatch thunk of LayoutView.isHidden.setter();
}

uint64_t sub_100764A60()
{
  return LayoutView.withLayoutMargins(_:)();
}

uint64_t sub_100764A70()
{
  return LayoutView.withMeasurements(providedBy:)();
}

uint64_t sub_100764A80()
{
  return LayoutView.withMeasurements(representing:)();
}

uint64_t sub_100764A90()
{
  return LayoutView.withMeasurements(_:)();
}

uint64_t sub_100764AA0()
{
  return dispatch thunk of Measurable.measurements(fitting:in:)();
}

uint64_t sub_100764AB0()
{
  return Measurable.measuredSize(fitting:in:)();
}

uint64_t sub_100764AC0()
{
  return Measurable.measurements(fitting:with:)();
}

uint64_t sub_100764AD0()
{
  return Measurable.placeable.getter();
}

uint64_t sub_100764AE0()
{
  return AspectRatio.verticalFraction.getter();
}

uint64_t sub_100764AF0()
{
  return AspectRatio.horizontalFraction.getter();
}

uint64_t sub_100764B00()
{
  return AspectRatio.isPortrait.getter();
}

uint64_t sub_100764B10()
{
  return AspectRatio.isLandscape.getter();
}

uint64_t sub_100764B20()
{
  return AspectRatio.maxSize(filling:)();
}

uint64_t sub_100764B30()
{
  return AspectRatio.maxSize(fitting:)();
}

uint64_t sub_100764B40()
{
  return AspectRatio.inverted.getter();
}

uint64_t sub_100764B50()
{
  return AspectRatio.width(fromHeight:)();
}

uint64_t sub_100764B60()
{
  return AspectRatio.height(fromWidth:)();
}

uint64_t sub_100764B70()
{
  return static AspectRatio.square.getter();
}

uint64_t sub_100764B80()
{
  return AspectRatio.isSquare.getter();
}

uint64_t sub_100764B90()
{
  return type metadata accessor for AspectRatio();
}

uint64_t sub_100764BA0()
{
  return AspectRatio.init(_:_:)();
}

UIFontDescriptor sub_100764BB0(UITraitCollection compatibleWith)
{
  return FontUseCase.makeFontDescriptor(compatibleWith:)(compatibleWith);
}

uint64_t sub_100764BC0()
{
  return static FontUseCase.== infix(_:_:)();
}

uint64_t sub_100764BD0()
{
  return type metadata accessor for FontUseCase();
}

uint64_t sub_100764BE0()
{
  return dispatch thunk of AnyDimension.rawValue(in:)();
}

uint64_t sub_100764BF0()
{
  return AnyDimension.bottomMargin(from:in:)();
}

uint64_t sub_100764C00()
{
  return AnyDimension.value(in:rounded:)();
}

uint64_t sub_100764C10()
{
  return AnyDimension.value(with:)();
}

uint64_t sub_100764C20()
{
  return AnyDimension.topMargin(from:in:)();
}

uint64_t sub_100764C30()
{
  return dispatch thunk of CustomLayout.layout.getter();
}

uint64_t sub_100764C70()
{
  return static DiffableData.makeSnapshot<A, B>(fromSections:withItemsAt:)();
}

uint64_t sub_100764C80()
{
  return dispatch thunk of DynamicLabel.dynamicTextAppearance.getter();
}

uint64_t sub_100764C90()
{
  return dispatch thunk of DynamicLabel.dynamicTextAppearance.setter();
}

uint64_t sub_100764CA0()
{
  return DynamicLabel.__allocating_init(with:)();
}

uint64_t sub_100764CB0()
{
  return type metadata accessor for DynamicLabel();
}

uint64_t sub_100764CC0()
{
  return ViewRecycler.init()();
}

uint64_t sub_100764CD0()
{
  return type metadata accessor for ViewRecycler();
}

uint64_t sub_100764CE0()
{
  return type metadata accessor for DisjointStack.Placements();
}

uint64_t sub_100764CF0()
{
  return DisjointStack.Properties.bottomEdge.setter();
}

uint64_t sub_100764D00()
{
  return DisjointStack.Properties.leadingEdge.setter();
}

uint64_t sub_100764D10()
{
  return DisjointStack.Properties.trailingEdge.setter();
}

uint64_t sub_100764D20()
{
  return DisjointStack.Properties.anchorsHugContent.setter();
}

uint64_t sub_100764D30()
{
  return DisjointStack.Properties.topEdge.setter();
}

uint64_t sub_100764D40()
{
  return type metadata accessor for DisjointStack.EdgePosition();
}

uint64_t sub_100764D50()
{
  return DisjointStack.init(with:)();
}

uint64_t sub_100764D60()
{
  return DisjointStack.insert(_:at:with:)();
}

uint64_t sub_100764D70()
{
  return DisjointStack.inserting(_:at:with:)();
}

uint64_t sub_100764D80()
{
  return type metadata accessor for DisjointStack();
}

uint64_t sub_100764D90()
{
  return type metadata accessor for VerticalStack.Placements();
}

uint64_t sub_100764DA0()
{
  return VerticalStack.Properties.shouldSkip.setter();
}

uint64_t sub_100764DB0()
{
  return VerticalStack.Properties.topSpacing.setter();
}

uint64_t sub_100764DC0()
{
  return VerticalStack.Properties.bottomSpacing.setter();
}

uint64_t sub_100764DD0()
{
  return VerticalStack.Properties.edgesAlignedToBaseline.setter();
}

uint64_t sub_100764DE0()
{
  return VerticalStack.Properties.alignment.setter();
}

uint64_t sub_100764DF0()
{
  return VerticalStack.add(_:with:)();
}

uint64_t sub_100764E00()
{
  return static VerticalStack.Edge.top.getter();
}

uint64_t sub_100764E10()
{
  return static VerticalStack.Edge.bottom.getter();
}

uint64_t sub_100764E20()
{
  return VerticalStack.Edge.init(rawValue:)();
}

uint64_t sub_100764E30()
{
  return VerticalStack.init(with:)();
}

uint64_t sub_100764E40()
{
  return VerticalStack.adding(_:with:)();
}

uint64_t sub_100764E50()
{
  return type metadata accessor for VerticalStack();
}

uint64_t sub_100764E60()
{
  return static ZeroDimension.zero.getter();
}

uint64_t sub_100764E70()
{
  return type metadata accessor for ZeroDimension();
}

uint64_t sub_100764E80()
{
  return dispatch thunk of LayoutTextView.isTextExtraTall.getter();
}

uint64_t sub_100764E90()
{
  return dispatch thunk of LayoutTextView.textLength.getter();
}

uint64_t sub_100764EA0()
{
  return dispatch thunk of LayoutTextView.lineBreakMode.setter();
}

uint64_t sub_100764EB0()
{
  return dispatch thunk of LayoutTextView.numberOfLines.setter();
}

uint64_t sub_100764EC0()
{
  return LayoutTextView.nilIfHasNoContent()();
}

uint64_t sub_100764ED0()
{
  return LayoutTextView.nilIfHiddenOrHasNoContent()();
}

uint64_t sub_100764EE0()
{
  return dispatch thunk of LayoutTextView.languageAwareOutsets.getter();
}

uint64_t sub_100764EF0()
{
  return dispatch thunk of LayoutTextView.font.getter();
}

uint64_t sub_100764F00()
{
  return dispatch thunk of LayoutTextView.font.setter();
}

Swift::Int sub_100764F10(JUMeasurements from)
{
  return LayoutTextView.estimatedNumberOfLines(from:)(from);
}

uint64_t sub_100764F20()
{
  return LayoutTextView.withLanguageAwareOutsets.getter();
}

uint64_t sub_100764F30()
{
  return TextAppearance.withTextAlignment(_:)();
}

uint64_t sub_100764F40()
{
  return TextAppearance.lineSpacing.setter();
}

uint64_t sub_100764F50()
{
  return TextAppearance.lineBreakMode.setter();
}

uint64_t sub_100764F60()
{
  return TextAppearance.numberOfLines.setter();
}

uint64_t sub_100764F70()
{
  return TextAppearance.textAlignment.setter();
}

uint64_t sub_100764F80()
{
  return TextAppearance.withLineSpacing(_:)();
}

uint64_t sub_100764F90()
{
  return TextAppearance.withLineBreakMode(_:)();
}

uint64_t sub_100764FA0()
{
  return TextAppearance.withNumberOfLines(_:)();
}

uint64_t sub_100764FB0()
{
  return TextAppearance.font.getter();
}

uint64_t sub_100764FC0()
{
  return TextAppearance.font.setter();
}

uint64_t sub_100764FD0()
{
  return TextAppearance.withFont(_:)();
}

uint64_t sub_100764FE0()
{
  return TextAppearance.init()();
}

uint64_t sub_100764FF0()
{
  return type metadata accessor for TextAppearance();
}

uint64_t sub_100765000()
{
  return static TextMeasurable.defaultTextAlignment.getter();
}

uint64_t sub_100765010()
{
  return static TextMeasurable.measurements(attributedText:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:)();
}

uint64_t sub_100765020()
{
  return static TextMeasurable.defaultLineBreakMode.getter();
}

uint64_t sub_100765030()
{
  return static CustomTextStyle<>.metadataRibbon.getter();
}

uint64_t sub_100765040()
{
  return dispatch thunk of CustomTextStyle.font(compatibleWith:)();
}

uint64_t sub_100765050()
{
  return HorizontalStack.Properties.leadingSpacing.setter();
}

uint64_t sub_100765060()
{
  return HorizontalStack.Properties.trailingSpacing.setter();
}

uint64_t sub_100765070()
{
  return HorizontalStack.Properties.alignment.setter();
}

uint64_t sub_100765080()
{
  return HorizontalStack.add(_:with:)();
}

uint64_t sub_100765090()
{
  return HorizontalStack.init(with:)();
}

uint64_t sub_1007650A0()
{
  return HorizontalStack.adding(_:with:)();
}

uint64_t sub_1007650B0()
{
  return static HorizontalStack.Alignment.== infix(_:_:)();
}

uint64_t sub_1007650C0()
{
  return type metadata accessor for HorizontalStack();
}

uint64_t sub_1007650D0()
{
  return ImageAppearance.withSymbolConfiguration(_:)();
}

uint64_t sub_1007650E0()
{
  return ImageAppearance.init()();
}

uint64_t sub_1007650F0()
{
  return type metadata accessor for ImageAppearance();
}

uint64_t sub_100765100()
{
  return dispatch thunk of PrimitiveLayout.layout(relativeTo:with:)();
}

uint64_t sub_100765110()
{
  return StackMeasurable.measurements(fitting:in:)();
}

uint64_t sub_100765120()
{
  return type metadata accessor for StackMeasurable.Axis();
}

uint64_t sub_100765130()
{
  return StackMeasurable.init(axis:skipEmptyChildren:children:)();
}

uint64_t sub_100765140()
{
  return type metadata accessor for StackMeasurable();
}

uint64_t sub_100765150()
{
  return static StaticDimension.== infix(_:_:)();
}

uint64_t sub_100765160()
{
  return StaticDimension.value(compatibleWith:rounded:)();
}

uint64_t sub_100765170()
{
  return StaticDimension.rawValue(in:)();
}

uint64_t sub_100765180()
{
  return type metadata accessor for StaticDimension();
}

uint64_t sub_100765190()
{
  return StaticDimension.init(_:scaledLike:)();
}

uint64_t sub_1007651A0()
{
  return CustomLayoutView.sizeThatFits(_:)();
}

uint64_t sub_1007651B0()
{
  return dispatch thunk of CustomLayoutView.invalidateMeasurements()();
}

uint64_t sub_1007651C0()
{
  return CustomLayoutView.measure(toFit:with:)();
}

uint64_t sub_1007651D0()
{
  return type metadata accessor for CustomLayoutView();
}

uint64_t sub_1007651E0()
{
  return method lookup function for CustomLayoutView();
}

uint64_t sub_1007651F0()
{
  return ImagePlaceholder.measure(toFit:with:)();
}

uint64_t sub_100765200()
{
  return type metadata accessor for ImagePlaceholder();
}

uint64_t sub_100765210()
{
  return ImagePlaceholder.init(_:with:)();
}

uint64_t sub_100765220()
{
  return LabelPlaceholder.layoutTextView.getter();
}

uint64_t sub_100765230()
{
  return static LabelPlaceholder.Options.languageAware.getter();
}

uint64_t sub_100765240()
{
  return LabelPlaceholder.Options.init(rawValue:)();
}

uint64_t sub_100765250()
{
  return LabelPlaceholder.measure(toFit:with:)();
}

uint64_t sub_100765260()
{
  return type metadata accessor for LabelPlaceholder();
}

uint64_t sub_100765270()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_100765280()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_100765290()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_1007652A0()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_1007652B0()
{
  return MeasurementRange.init(minimum:maximum:)();
}

uint64_t sub_1007652C0()
{
  return MeasurementRange.contains(_:)();
}

uint64_t sub_1007652D0()
{
  return MeasurementRange.constrain(_:)();
}

uint64_t sub_1007652E0()
{
  return dispatch thunk of PlacementSequence.measure.getter();
}

uint64_t sub_1007652F0()
{
  return type metadata accessor for VerticalFlowLayout.VerticalPlacement();
}

uint64_t sub_100765300()
{
  return VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100765310()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_100765320()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter();
}

uint64_t sub_100765330()
{
  return static VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_100765340()
{
  return type metadata accessor for VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_100765350()
{
  return type metadata accessor for VerticalFlowLayout.HorizontalPlacement();
}

uint64_t sub_100765360()
{
  return VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_100765370()
{
  return static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)();
}

uint64_t sub_100765380()
{
  return type metadata accessor for VerticalFlowLayout.Child();
}

uint64_t sub_100765390()
{
  return type metadata accessor for VerticalFlowLayout();
}

uint64_t sub_1007653A0()
{
  return type metadata accessor for AspectFitMeasurable();
}

uint64_t sub_1007653B0()
{
  return AspectFitMeasurable.init(_:)();
}

uint64_t sub_1007653C0()
{
  return dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_1007653E0()
{
  return static EstimatedMeasurable.estimatedSize(fitting:using:in:)();
}

uint64_t sub_1007653F0()
{
  return LineHeightDimension.init(with:multipliedBy:)();
}

uint64_t sub_100765400()
{
  return type metadata accessor for LineHeightDimension();
}

uint64_t sub_100765410()
{
  return type metadata accessor for VerticalStackLayout.ExclusionCondition();
}

uint64_t sub_100765420()
{
  return static VerticalStackLayout.Child.make(forView:space:spaceMultiplier:alignment:excludeWhen:)();
}

uint64_t sub_100765430()
{
  return type metadata accessor for VerticalStackLayout.Child.Alignment();
}

uint64_t sub_100765440()
{
  return type metadata accessor for VerticalStackLayout.Child();
}

uint64_t sub_100765450()
{
  return VerticalStackLayout.addChild(_:)();
}

uint64_t sub_100765460()
{
  return type metadata accessor for VerticalStackLayout.Alignment();
}

uint64_t sub_100765470()
{
  return VerticalStackLayout.init(alignment:spacing:children:)();
}

uint64_t sub_100765480()
{
  return type metadata accessor for VerticalStackLayout();
}

uint64_t sub_100765490()
{
  return DynamicTextAppearance.withCustomTextStyle(_:)();
}

uint64_t sub_1007654A0()
{
  return DynamicTextAppearance.withTextStyle(_:)();
}

uint64_t sub_1007654B0()
{
  return DynamicTextAppearance.customTextStyle.getter();
}

uint64_t sub_1007654C0()
{
  return DynamicTextAppearance.lineSpacing.getter();
}

uint64_t sub_1007654D0()
{
  return DynamicTextAppearance.lineBreakMode.getter();
}

uint64_t sub_1007654E0()
{
  return DynamicTextAppearance.numberOfLines.getter();
}

uint64_t sub_1007654F0()
{
  return DynamicTextAppearance.textAlignment.getter();
}

uint64_t sub_100765500()
{
  return DynamicTextAppearance.withFontUseCase(_:)();
}

uint64_t sub_100765510()
{
  return DynamicTextAppearance.withLineBreakMode(_:)();
}

uint64_t sub_100765520()
{
  return DynamicTextAppearance.withNumberOfLines(_:)();
}

uint64_t sub_100765530()
{
  return DynamicTextAppearance.init()();
}

uint64_t sub_100765540()
{
  return type metadata accessor for DynamicTextAppearance();
}

uint64_t sub_100765550()
{
  return FlankedVerticalLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100765560()
{
  return type metadata accessor for FlankedVerticalLayout.Alignment();
}

uint64_t sub_100765570()
{
  return FlankedVerticalLayout.init(sublayout:topView:topViewAlignment:topMargin:bottomView:bottomViewAlignment:bottomMargin:)();
}

uint64_t sub_100765580()
{
  return type metadata accessor for FlankedVerticalLayout();
}

uint64_t sub_100765590()
{
  return LayoutViewPlaceholder.hasContent.setter();
}

uint64_t sub_1007655A0()
{
  return LayoutViewPlaceholder.init(measureWith:)();
}

uint64_t sub_1007655B0()
{
  return LayoutViewPlaceholder.init(measurements:)();
}

uint64_t sub_1007655C0()
{
  return LayoutViewPlaceholder.init(representing:)();
}

uint64_t sub_1007655D0()
{
  return static LayoutViewPlaceholder.withIdentityMeasurement.getter();
}

uint64_t sub_1007655E0()
{
  return LayoutViewPlaceholder.isHidden.setter();
}

uint64_t sub_1007655F0()
{
  return type metadata accessor for LayoutViewPlaceholder();
}

uint64_t sub_100765600()
{
  return measuringBoundingRect(toFit:)();
}

uint64_t sub_100765610()
{
  return type metadata accessor for FlankedHorizontalLayout.ViewAlignment();
}

uint64_t sub_100765620()
{
  return FlankedHorizontalLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100765630()
{
  return FlankedHorizontalLayout.init(sublayout:leadingView:leadingMargin:leadingAlignment:trailingView:trailingMargin:trailingAlignment:)();
}

uint64_t sub_100765640()
{
  return type metadata accessor for FlankedHorizontalLayout();
}

uint64_t sub_100765650()
{
  return static JULoadingViewController.PresentationContext.placeholder.getter();
}

uint64_t sub_100765660()
{
  return type metadata accessor for JULoadingViewController.PresentationContext();
}

uint64_t sub_100765670()
{
  return JULoadingViewController.init(label:presentationContext:pageRenderMetrics:)();
}

uint64_t sub_100765680()
{
  return type metadata accessor for JULoadingViewController();
}

uint64_t sub_100765690()
{
  return type metadata accessor for VerticalSpaceMeasurable();
}

uint64_t sub_1007656A0()
{
  return VerticalSpaceMeasurable.init(_:multiplier:)();
}

uint64_t sub_1007656B0()
{
  return VerticalMarginsMeasurable.measurements(fitting:in:)();
}

uint64_t sub_1007656C0()
{
  return VerticalMarginsMeasurable.init(child:topMargin:bottomMargin:skipIfEmpty:shouldMeasureToBaseline:)();
}

uint64_t sub_1007656D0()
{
  return type metadata accessor for VerticalMarginsMeasurable();
}

uint64_t sub_1007656E0()
{
  return TraitEnvironmentPlaceholder.init(traitCollection:)();
}

uint64_t sub_1007656F0()
{
  return type metadata accessor for TraitEnvironmentPlaceholder();
}

uint64_t sub_100765700()
{
  return TraitEnvironmentPlaceholder.__allocating_init(_:)();
}

uint64_t sub_100765710()
{
  return JUContentUnavailableViewController.init(error:from:includeMetrics:retry:)();
}

uint64_t sub_100765720()
{
  return static JUContentUnavailableViewController.PresentationContext.placeholder.getter();
}

uint64_t sub_100765730()
{
  return type metadata accessor for JUContentUnavailableViewController.PresentationContext();
}

uint64_t sub_100765740()
{
  return JUContentUnavailableViewController.init(error:presentationContext:retry:)();
}

uint64_t sub_100765750()
{
  return type metadata accessor for JUContentUnavailableViewController();
}

uint64_t sub_100765760()
{
  return type metadata accessor for Pin.Edge();
}

uint64_t sub_100765770()
{
  return type metadata accessor for Pin();
}

uint64_t sub_100765780()
{
  return Pin.init(_:to:of:)();
}

uint64_t sub_100765790()
{
  return static Center.Axis.horizontal.getter();
}

uint64_t sub_1007657A0()
{
  return static Center.Axis.neither.getter();
}

uint64_t sub_1007657B0()
{
  return static Center.Axis.vertical.getter();
}

uint64_t sub_1007657C0()
{
  return type metadata accessor for Center();
}

uint64_t sub_1007657D0()
{
  return Center.init(_:filling:)();
}

uint64_t sub_1007657E0()
{
  return dispatch thunk of Layout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007657F0()
{
  return Resize.init(_:size:)();
}

uint64_t sub_100765800()
{
  return type metadata accessor for Resize.Rule();
}

uint64_t sub_100765810()
{
  return type metadata accessor for Resize();
}

uint64_t sub_100765820()
{
  return Resize.init(_:width:height:firstBaseline:lastBaseline:)();
}

uint64_t sub_100765830()
{
  return type metadata accessor for Margins.Placements();
}

uint64_t sub_100765840()
{
  return Margins.init(top:left:bottom:right:child:)();
}

uint64_t sub_100765850()
{
  return Margins.init(insets:child:)();
}

uint64_t sub_100765860()
{
  return type metadata accessor for Margins();
}

uint64_t sub_100765870()
{
  return Margins.init(_:top:leading:bottom:trailing:)();
}

uint64_t sub_100765880()
{
  return Adaptive.onCustom<A>(_:_:)();
}

uint64_t sub_100765890()
{
  return type metadata accessor for Adaptive();
}

uint64_t sub_1007658A0()
{
  return Adaptive.init<A>(_:)();
}

uint64_t sub_1007658B0()
{
  return AppStore.CenteredThreeLineTextLayout.init(primaryText:secondaryText:secondarySpace:numberOfLines:)();
}

uint64_t sub_1007658C0()
{
  return AppStore.CenteredThreeLineTextLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007658D0()
{
  return type metadata accessor for AppStore.CenteredThreeLineTextLayout();
}

uint64_t sub_1007658E0()
{
  return type metadata accessor for Constrain();
}

uint64_t sub_1007658F0()
{
  return Constrain.init(_:width:height:)();
}

uint64_t sub_100765900()
{
  return dispatch thunk of Placeable.place(at:with:)();
}

uint64_t sub_100765910()
{
  return dispatch thunk of Placeable.measure(toFit:with:)();
}

uint64_t sub_100765920()
{
  return Placement.child.getter();
}

uint64_t sub_100765930()
{
  return Placement.frame.getter();
}

uint64_t sub_100765940()
{
  return type metadata accessor for Placement();
}

void sub_100765950()
{
}

uint64_t sub_100765960()
{
  return ReusePool.limit.setter();
}

uint64_t sub_100765970()
{
  return ReusePool.dequeue(or:)();
}

uint64_t sub_100765980()
{
  return ReusePool.dequeue()();
}

uint64_t sub_100765990()
{
  return ReusePool.recycle(_:)();
}

uint64_t sub_1007659A0()
{
  return ReusePool.init(recycler:limit:)();
}

uint64_t sub_1007659B0()
{
  return type metadata accessor for ReusePool();
}

uint64_t sub_1007659C0()
{
  return Separator.verticalOutset.getter();
}

uint64_t sub_1007659D0()
{
  return Separator.withLeadingInset(_:)();
}

uint64_t sub_1007659E0()
{
  return Separator.frame(forBoundingRect:in:)();
}

uint64_t sub_1007659F0()
{
  return Separator.height(in:)();
}

uint64_t sub_100765A00()
{
  return type metadata accessor for Separator.Position();
}

uint64_t sub_100765A10()
{
  return Separator.init(position:leadingInset:trailingInset:verticalOutset:)();
}

uint64_t sub_100765A20()
{
  return static Separator.thickness(compatibleWith:)();
}

uint64_t sub_100765A30()
{
  return type metadata accessor for Separator();
}

uint64_t sub_100765A40()
{
  return static UICellAccessory.customView(configuration:)();
}

uint64_t sub_100765A50()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t sub_100765A60()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t sub_100765A70()
{
  return UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_100765A80()
{
  return type metadata accessor for UICellAccessory.CheckmarkOptions();
}

uint64_t sub_100765A90()
{
  return static UICellAccessory.outlineDisclosure(displayed:options:actionHandler:)();
}

uint64_t sub_100765AA0()
{
  return static UICellAccessory.disclosureIndicator(displayed:options:)();
}

uint64_t sub_100765AB0()
{
  return UICellAccessory.CustomViewConfiguration.init(customView:placement:isHidden:reservedLayoutWidth:tintColor:maintainsFixedSize:)();
}

uint64_t sub_100765AC0()
{
  return type metadata accessor for UICellAccessory.CustomViewConfiguration();
}

uint64_t sub_100765AD0()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions.Style();
}

uint64_t sub_100765AE0()
{
  return UICellAccessory.OutlineDisclosureOptions.init(style:isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_100765AF0()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions();
}

uint64_t sub_100765B00()
{
  return UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_100765B10()
{
  return type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
}

uint64_t sub_100765B20()
{
  return type metadata accessor for UICellAccessory.Placement();
}

uint64_t sub_100765B30()
{
  return static UICellAccessory.checkmark(displayed:options:)();
}

uint64_t sub_100765B40()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t sub_100765B50()
{
  return UIMutableTraits.userInterfaceLevel.setter();
}

uint64_t sub_100765B60()
{
  return UIMutableTraits.userInterfaceStyle.setter();
}

uint64_t sub_100765B70()
{
  return UIMutableTraits.horizontalSizeClass.setter();
}

uint64_t sub_100765B80()
{
  return UIMutableTraits.preferredContentSizeCategory.getter();
}

uint64_t sub_100765B90()
{
  return UIMutableTraits.preferredContentSizeCategory.setter();
}

uint64_t sub_100765BA0()
{
  return UIMutableTraits._typesettingLanguageAwareLineHeightRatio.setter();
}

uint64_t sub_100765BB0()
{
  return UITraitOverrides.remove(_:)();
}

uint64_t sub_100765BC0()
{
  return type metadata accessor for UITraitOverrides();
}

uint64_t sub_100765BD0()
{
  return type metadata accessor for UITraitLayoutDirection();
}

uint64_t sub_100765BE0()
{
  return type metadata accessor for UITraitLegibilityWeight();
}

uint64_t sub_100765BF0()
{
  return type metadata accessor for UITraitVerticalSizeClass();
}

uint64_t sub_100765C00()
{
  return UIBackgroundConfiguration.cornerRadius.setter();
}

uint64_t sub_100765C10()
{
  return static UIBackgroundConfiguration.listPlainCell()();
}

uint64_t sub_100765C20()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_100765C30()
{
  return UIBackgroundConfiguration.backgroundInsets.setter();
}

uint64_t sub_100765C40()
{
  return UIBackgroundConfiguration.backgroundColorTransformer.setter();
}

uint64_t sub_100765C50()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t sub_100765C60()
{
  return type metadata accessor for UITraitUserInterfaceLevel();
}

uint64_t sub_100765C70()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t sub_100765C80()
{
  return static UIListContentConfiguration.groupedFooter()();
}

uint64_t sub_100765C90()
{
  return static UIListContentConfiguration.groupedHeader()();
}

uint64_t sub_100765CA0()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t sub_100765CB0()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties.TextAlignment();
}

uint64_t sub_100765CC0()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t sub_100765CD0()
{
  return UIListContentConfiguration.TextProperties.alignment.setter();
}

uint64_t sub_100765CE0()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t sub_100765CF0()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t sub_100765D00()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t sub_100765D10()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t sub_100765D20()
{
  return static UIListContentConfiguration.valueCell()();
}

uint64_t sub_100765D30()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t sub_100765D40()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t sub_100765D50()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_100765D60(Swift::OpaquePointer a1)
{
}

void sub_100765D70(Swift::OpaquePointer a1)
{
}

uint64_t sub_100765D80()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t sub_100765D90()
{
  return NSDiffableDataSourceSnapshot.numberOfSections.getter();
}

void sub_100765DA0(Swift::OpaquePointer a1)
{
}

uint64_t sub_100765DB0()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifier(containingItem:)();
}

uint64_t sub_100765DC0()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t sub_100765DD0()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_100765DE0()
{
  return UIListSeparatorConfiguration.topSeparatorInsets.setter();
}

uint64_t sub_100765DF0()
{
  return UIListSeparatorConfiguration.bottomSeparatorInsets.setter();
}

uint64_t sub_100765E00()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_100765E10()
{
  return UIConfigurationColorTransformer.init(_:)();
}

uint64_t sub_100765E20()
{
  return UIContentUnavailableConfiguration.secondaryText.setter();
}

uint64_t sub_100765E30()
{
  return UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter();
}

uint64_t sub_100765E40()
{
  return UIContentUnavailableConfiguration.buttonProperties.modify();
}

uint64_t sub_100765E50()
{
  return UIContentUnavailableConfiguration.text.setter();
}

uint64_t sub_100765E60()
{
  return UIContentUnavailableConfiguration.button.modify();
}

uint64_t sub_100765E70()
{
  return static UIContentUnavailableConfiguration.search()();
}

uint64_t sub_100765E80()
{
  return type metadata accessor for UIContentUnavailableConfiguration();
}

uint64_t sub_100765E90()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_100765EA0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t sub_100765EB0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t sub_100765EC0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.numberOfSections(in:)();
}

uint64_t sub_100765ED0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_100765EE0()
{
  return UICollectionViewDiffableDataSource.apply(_:to:animatingDifferences:completion:)();
}

uint64_t sub_100765EF0()
{
  return UICollectionViewDiffableDataSource.snapshot(for:)();
}

uint64_t sub_100765F00()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t sub_100765F10()
{
  return NSDiffableDataSourceSectionSnapshot.isExpanded(_:)();
}

uint64_t sub_100765F20()
{
  return NSDiffableDataSourceSectionSnapshot.append(_:to:)();
}

void sub_100765F30(Swift::OpaquePointer a1)
{
}

void sub_100765F40(Swift::OpaquePointer a1)
{
}

uint64_t sub_100765F50()
{
  return NSDiffableDataSourceSectionSnapshot.init()();
}

uint64_t sub_100765F60()
{
  return UICollectionLayoutListConfiguration.trailingSwipeActionsConfigurationProvider.setter();
}

uint64_t sub_100765F70()
{
  return UICollectionLayoutListConfiguration.separatorConfiguration.modify();
}

uint64_t sub_100765F80()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t sub_100765F90()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.FooterMode();
}

uint64_t sub_100765FA0()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t sub_100765FB0()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t sub_100765FC0()
{
  return UICollectionLayoutListConfiguration.footerMode.setter();
}

uint64_t sub_100765FD0()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t sub_100765FE0()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t sub_100765FF0()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_100766000()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t sub_100766010()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t sub_100766020()
{
  return type metadata accessor for UITypesettingLanguageAwareLineHeightRatio();
}

uint64_t sub_100766030()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_100766040()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_100766050()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100766060()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100766070()
{
  return static Published.subscript.getter();
}

uint64_t sub_100766080()
{
  return static Published.subscript.setter();
}

uint64_t sub_100766090()
{
  return type metadata accessor for Published();
}

uint64_t sub_1007660A0()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_1007660B0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1007660C0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1007660D0()
{
  return type metadata accessor for Prominence();
}

uint64_t sub_1007660E0()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_1007660F0()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_100766100()
{
  return static Transaction._loading.getter();
}

uint64_t sub_100766110()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_100766120()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_100766130()
{
  return PlainListStyle.init()();
}

uint64_t sub_100766140()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t sub_100766150()
{
  return DisclosureGroup.init(content:label:)();
}

uint64_t sub_100766160()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_100766170()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100766180()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100766190()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1007661A0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1007661B0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1007661C0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1007661D0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1007661E0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1007661F0()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_100766200()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100766210()
{
  return static VerticalAlignment.center.getter();
}

void sub_100766220(Swift::String a1)
{
}

void sub_100766230(Swift::String a1)
{
}

uint64_t sub_100766240()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100766250()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_100766260()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_100766270()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100766280()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100766290()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1007662A0()
{
  return static SymbolRenderingMode.multicolor.getter();
}

uint64_t sub_1007662B0()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t sub_1007662C0()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_1007662D0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1007662E0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1007662F0()
{
  return static SearchFieldPlacement.automatic.getter();
}

uint64_t sub_100766300()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_100766310()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t sub_100766320()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_100766330()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100766340()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_100766350()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_100766360()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_100766370()
{
  return EnabledTextSelectability.init()();
}

uint64_t sub_100766380()
{
  return type metadata accessor for EnabledTextSelectability();
}

uint64_t sub_100766390()
{
  return static TextInputAutocapitalization.never.getter();
}

uint64_t sub_1007663A0()
{
  return type metadata accessor for TextInputAutocapitalization();
}

uint64_t sub_1007663B0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1007663C0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1007663D0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1007663E0()
{
  return static Font.title3.getter();
}

uint64_t sub_1007663F0()
{
  return static Font.caption.getter();
}

uint64_t sub_100766400()
{
  return static Font.caption2.getter();
}

uint64_t sub_100766410()
{
  return static Font.footnote.getter();
}

uint64_t sub_100766420()
{
  return static Font.headline.getter();
}

uint64_t sub_100766430()
{
  return List<>.init(content:)();
}

uint64_t sub_100766440()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100766450()
{
  return Text.bold()();
}

uint64_t sub_100766460()
{
  return Text.font(_:)();
}

uint64_t sub_100766470()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100766480()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100766490()
{
  return View.intentDispatcher(_:with:)();
}

uint64_t sub_1007664A0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1007664B0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1007664C0()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t sub_1007664D0()
{
  return View.keyboardType(_:)();
}

uint64_t sub_1007664E0()
{
  return View.textSelection<A>(_:)();
}

uint64_t sub_1007664F0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100766500()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_100766510()
{
  return View.headerProminence(_:)();
}

uint64_t sub_100766520()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t sub_100766530()
{
  return View.textInputAutocapitalization(_:)();
}

uint64_t sub_100766540()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_100766550()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_100766560()
{
  return Image.init(systemName:)();
}

uint64_t sub_100766570()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_100766580()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100766590()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1007665A0()
{
  return State.projectedValue.getter();
}

uint64_t sub_1007665B0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_1007665C0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1007665D0()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_1007665E0()
{
  return ShareLink<>.init<>(item:subject:message:label:)();
}

uint64_t sub_1007665F0()
{
  return type metadata accessor for DeviceAppQuery();
}

uint64_t sub_100766600()
{
  return DeviceAppStateDataSource.__allocating_init(query:fetcher:updateRegistry:store:)();
}

uint64_t sub_100766610()
{
  return type metadata accessor for DeviceAppStateDataSource();
}

uint64_t sub_100766620()
{
  return DefaultAppStateDataSource.init()();
}

uint64_t sub_100766630()
{
  return type metadata accessor for DefaultAppStateDataSource();
}

uint64_t sub_100766640()
{
  return WaitingAppStateDataSource.init()();
}

uint64_t sub_100766650()
{
  return type metadata accessor for WaitingAppStateDataSource();
}

uint64_t sub_100766660()
{
  return ASDDeviceAppFetcher.init(regulatoryLogger:)();
}

uint64_t sub_100766670()
{
  return type metadata accessor for ASDDeviceAppFetcher();
}

uint64_t sub_100766680()
{
  return type metadata accessor for App.Kind();
}

uint64_t sub_100766690()
{
  return type metadata accessor for AppStoreType();
}

uint64_t sub_1007666A0()
{
  return DeviceUpdateRegistry.__allocating_init()();
}

uint64_t sub_1007666B0()
{
  return type metadata accessor for DeviceUpdateRegistry();
}

uint64_t sub_1007666C0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1007666D0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1007666E0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1007666F0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100766700()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_100766710()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100766720()
{
  return static DispatchTime.now()();
}

uint64_t sub_100766730()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100766740()
{
  return dispatch thunk of DispatchWorkItem.isCancelled.getter();
}

uint64_t sub_100766750()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_100766760()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_100766770()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_100766780()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_100766790()
{
  return + infix(_:_:)();
}

uint64_t sub_1007667A0()
{
  return + infix(_:_:)();
}

uint64_t sub_1007667B0()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_1007667C0()
{
  return AsyncEvent.post(_:)();
}

uint64_t sub_1007667D0()
{
  return AsyncEvent.init()();
}

uint64_t sub_1007667E0()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_1007667F0()
{
  return static Dependency.satisfying<A>(_:with:)();
}

uint64_t sub_100766800()
{
  return type metadata accessor for Dependency();
}

uint64_t sub_100766810()
{
  return JSIncident.description.getter();
}

uint64_t sub_100766820()
{
  return JSIncident.contextSummary.getter();
}

uint64_t sub_100766830()
{
  return JSIncident.problemSummary.getter();
}

uint64_t sub_100766840()
{
  return type metadata accessor for JSIncident();
}

uint64_t sub_100766850()
{
  return JSONObject.array.getter();
}

uint64_t sub_100766860()
{
  return JSONObject.string.getter();
}

uint64_t sub_100766870()
{
  return type metadata accessor for JSONObject();
}

uint64_t sub_100766880()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_100766890()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_1007668A0()
{
  return static LogMessage.traceableSensitive(_:)();
}

uint64_t sub_1007668B0()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_1007668C0()
{
  return LogMessage.StringInterpolation.appendInterpolation(identity:)();
}

void sub_1007668D0(Swift::String a1)
{
}

uint64_t sub_1007668E0()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1007668F0()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_100766900()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_100766910()
{
  return static LogMessage.safe(_:)();
}

uint64_t sub_100766920()
{
  return static LogMessage.identity(_:)();
}

uint64_t sub_100766930()
{
  return static LogMessage.sensitive(_:)();
}

uint64_t sub_100766940()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_100766950()
{
  return dispatch thunk of ShelfModel.items.getter();
}

uint64_t sub_100766960()
{
  return StateStore.performTransaction<A>(_:)();
}

uint64_t sub_100766970()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t sub_100766980()
{
  return IntentModel._canonicalized.getter();
}

uint64_t sub_100766990()
{
  return static IntentModel<>.kind.getter();
}

uint64_t sub_1007669A0()
{
  return type metadata accessor for JSONContext();
}

uint64_t sub_1007669B0()
{
  return MetricsData.init(fields:includingFields:excludingFields:shouldFlush:)();
}

uint64_t sub_1007669C0()
{
  return type metadata accessor for MetricsData();
}

uint64_t sub_1007669D0()
{
  return static PageMetrics.notInstrumented.getter();
}

uint64_t sub_1007669E0()
{
  return type metadata accessor for PageMetrics();
}

uint64_t sub_1007669F0()
{
  return dispatch thunk of Preferences.removeValue(forKey:)();
}

uint64_t sub_100766A00()
{
  return Preferences.subscript.getter();
}

uint64_t sub_100766A10()
{
  return Preferences.subscript.modify();
}

uint64_t sub_100766A20()
{
  return Preferences.subscript.getter();
}

uint64_t sub_100766A30()
{
  return Preferences.subscript.setter();
}

uint64_t sub_100766A40()
{
  return DiffableLens.subscript.getter();
}

uint64_t sub_100766A50()
{
  return DiffableLens.value.getter();
}

uint64_t sub_100766A60()
{
  return dispatch thunk of static EventEmitter.defaultScheduler.getter();
}

uint64_t sub_100766A70()
{
  return EventEmitter.addObserver<A>(on:target:method:)();
}

uint64_t sub_100766A80()
{
  return EventEmitter.addObserver(on:singleUse:_:)();
}

uint64_t sub_100766A90()
{
  return EventEmitter.asyncStream.getter();
}

uint64_t sub_100766AA0()
{
  return ReadOnlyLens.subscript.getter();
}

uint64_t sub_100766AB0()
{
  return ReadOnlyLens.value.getter();
}

uint64_t sub_100766AC0()
{
  return ReplayLogger.replay(last:messagesInto:)();
}

uint64_t sub_100766AD0()
{
  return ReplayLogger.init()();
}

uint64_t sub_100766AE0()
{
  return type metadata accessor for ReplayLogger();
}

uint64_t sub_100766AF0()
{
  return static ActionMetrics.notInstrumented.getter();
}

uint64_t sub_100766B00()
{
  return ActionMetrics.init(data:custom:)();
}

uint64_t sub_100766B10()
{
  return type metadata accessor for ActionMetrics();
}

uint64_t sub_100766B20()
{
  return type metadata accessor for ActionOutcome();
}

uint64_t sub_100766B30()
{
  return MetricsLogger.init(loggerName:configuration:)();
}

uint64_t sub_100766B40()
{
  return type metadata accessor for MetricsLogger.Configuration();
}

uint64_t sub_100766B50()
{
  return MetricsLogger.log(contentsOf:)();
}

uint64_t sub_100766B60()
{
  return type metadata accessor for MetricsLogger();
}

uint64_t sub_100766B70()
{
  return static PreferenceKey.== infix(_:_:)();
}

uint64_t sub_100766B80()
{
  return type metadata accessor for PreferenceKey();
}

uint64_t sub_100766B90()
{
  return PreferenceKey.init(_:)();
}

uint64_t sub_100766BA0()
{
  return dispatch thunk of TaskScheduler.schedule(task:)();
}

uint64_t sub_100766BB0()
{
  return ComponentModel.pairedWith<A>(objectGraph:)();
}

uint64_t sub_100766BC0()
{
  return dispatch thunk of ComponentModel.id.getter();
}

uint64_t sub_100766BD0()
{
  return CompoundLogger.init(loggers:)();
}

uint64_t sub_100766BE0()
{
  return type metadata accessor for CompoundLogger();
}

uint64_t sub_100766C00()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t sub_100766C10()
{
  return dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)();
}

uint64_t sub_100766C20()
{
  return dispatch thunk of BaseObjectGraph.name.setter();
}

uint64_t sub_100766C30()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t sub_100766C40()
{
  return dispatch thunk of BaseObjectGraph.adding(dependency:)();
}

uint64_t sub_100766C50()
{
  return dispatch thunk of BaseObjectGraph.adding<A>(allDependencies:)();
}

uint64_t sub_100766C60()
{
  return dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
}

uint64_t sub_100766C70()
{
  return BaseObjectGraph.optional<A>(_:)();
}

uint64_t sub_100766C80()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t sub_100766C90()
{
  return BaseObjectGraph.__allocating_init(_:)();
}

uint64_t sub_100766CA0()
{
  return static MetricsPipeline.objectGraphWithNewPipelineConfiguredWith(optInProviders:optOutProviders:asPartOf:)();
}

uint64_t sub_100766CB0()
{
  return MetricsPipeline.process(_:using:)();
}

uint64_t sub_100766CC0()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t sub_100766CD0()
{
  return static PageRenderEvent.willPerformAction()();
}

uint64_t sub_100766CE0()
{
  return ActionDispatcher.targetQueue.getter();
}

uint64_t sub_100766CF0()
{
  return ActionDispatcher.add<A>(_:)();
}

uint64_t sub_100766D00()
{
  return ActionDispatcher.perform(_:withMetrics:asPartOf:)();
}

uint64_t sub_100766D10()
{
  return ActionDispatcher.init()();
}

uint64_t sub_100766D20()
{
  return LocalPreferences.removeValue(forKey:)();
}

uint64_t sub_100766D30()
{
  return static LocalPreferences.currentApplication.getter();
}

uint64_t sub_100766D40()
{
  return static LocalPreferences.placeholderDisableShelfHydration.getter();
}

uint64_t sub_100766D50()
{
  return static LocalPreferences.AppStoreKitInternal.getter();
}

uint64_t sub_100766D60()
{
  return type metadata accessor for LocalPreferences();
}

uint64_t sub_100766D70()
{
  return ScalarDictionary.init()();
}

uint64_t sub_100766D80()
{
  return type metadata accessor for ScalarDictionary();
}

uint64_t sub_100766D90()
{
  return type metadata accessor for EventSubscription();
}

uint64_t sub_100766DA0()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_100766DB0()
{
  return ImpressionMetrics.withParentId(_:)();
}

uint64_t sub_100766DC0()
{
  return ImpressionMetrics.ID.index.getter();
}

uint64_t sub_100766DD0()
{
  return ImpressionMetrics.ID.parent.getter();
}

uint64_t sub_100766DE0()
{
  return ImpressionMetrics.ID.element.getter();
}

uint64_t sub_100766DF0()
{
  return type metadata accessor for ImpressionMetrics.ID();
}

uint64_t sub_100766E00()
{
  return ImpressionMetrics.id.getter();
}

uint64_t sub_100766E10()
{
  return ImpressionMetrics.fields.getter();
}

uint64_t sub_100766E20()
{
  return type metadata accessor for ImpressionMetrics();
}

uint64_t sub_100766E30()
{
  return SyncTaskScheduler.init()();
}

uint64_t sub_100766E40()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t sub_100766E50()
{
  return WritableStateLens.init<A>(contentsOf:in:)();
}

uint64_t sub_100766E60()
{
  return WritableStateLens<A>.updateValue(_:)();
}

uint64_t sub_100766E70()
{
  return WritableStateLens<A>.currentValue.getter();
}

uint64_t sub_100766E80()
{
  return WritableStateLens<A>.subscript.getter();
}

uint64_t sub_100766E90()
{
  return type metadata accessor for WritableStateLens();
}

uint64_t sub_100766EA0()
{
  return WritableStateLens.init(_:)();
}

uint64_t sub_100766EB0()
{
  return dispatch thunk of ImpressionsTracker.removeAllImpressions()();
}

uint64_t sub_100766EC0()
{
  return dispatch thunk of ImpressionsTracker.elementDidEnterView(_:on:)();
}

uint64_t sub_100766ED0()
{
  return dispatch thunk of ImpressionsTracker.elementDidLeaveView(_:on:)();
}

uint64_t sub_100766EE0()
{
  return type metadata accessor for LintedMetricsEvent.Issue();
}

uint64_t sub_100766EF0()
{
  return LintedMetricsEvent.fields.getter();
}

uint64_t sub_100766F00()
{
  return static SignpostAggregator.log.getter();
}

uint64_t sub_100766F10()
{
  return type metadata accessor for SignpostAggregator();
}

uint64_t sub_100766F20()
{
  return static AutomationSemantics.onboarding(elementName:id:parentId:)();
}

uint64_t sub_100766F30()
{
  return static AutomationSemantics.offerButton(id:parentId:)();
}

uint64_t sub_100766F40()
{
  return static AutomationSemantics.productPage(elementName:id:parentId:)();
}

uint64_t sub_100766F50()
{
  return static AutomationSemantics.searchField()();
}

uint64_t sub_100766F60()
{
  return static AutomationSemantics.accountButton()();
}

uint64_t sub_100766F70()
{
  return static AutomationSemantics.dismissButton()();
}

uint64_t sub_100766F80()
{
  return static AutomationSemantics.shelfItemSubComponent(itemKind:id:parentId:)();
}

uint64_t sub_100766F90()
{
  return static AutomationSemantics.page(name:id:)();
}

uint64_t sub_100766FA0()
{
  return static AutomationSemantics.shelf(_:id:parentId:)();
}

uint64_t sub_100766FB0()
{
  return AutomationSemantics.attribute(key:value:)();
}

uint64_t sub_100766FC0()
{
  return static AutomationSemantics.shelfItem(itemKind:id:parentId:)();
}

uint64_t sub_100766FD0()
{
  return type metadata accessor for AutomationSemantics();
}

uint64_t sub_100766FE0()
{
  return TransientStateStore.removeState(at:recursively:)();
}

void sub_100766FF0()
{
}

uint64_t sub_100767000()
{
  return TransientStateStore.init(isConcurrent:)();
}

uint64_t sub_100767010()
{
  return MetricsEventRecorder._recordAsync(_:on:)();
}

uint64_t sub_100767020()
{
  return static MetricsFieldsContext.emptyContext.getter();
}

uint64_t sub_100767030()
{
  return static MetricsFieldsContext.createFieldsContext(impressionsTracker:adamIdString:pageContextOverride:referrer:participatingInCrossfireReferral:pageFields:preloaded:advertRotationData:searchGhostHintData:contextualAction:deviceWindowData:impressionsAppendixData:)();
}

uint64_t sub_100767040()
{
  return type metadata accessor for MetricsFieldsContext();
}

uint64_t sub_100767050()
{
  return static FlowActionPresentation.stackPush.getter();
}

uint64_t sub_100767060()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)();
}

uint64_t sub_100767070()
{
  return type metadata accessor for BasicImpressionsTracker();
}

uint64_t sub_100767080()
{
  return static StartUpPerformanceEvent.Checkpoint.bootstrapFinished.getter();
}

uint64_t sub_100767090()
{
  return type metadata accessor for StartUpPerformanceEvent.Checkpoint();
}

uint64_t sub_1007670A0()
{
  return StartUpPerformanceEvent.record(checkpoint:)();
}

uint64_t sub_1007670B0()
{
  return type metadata accessor for StartUpPerformanceEvent();
}

uint64_t sub_1007670C0()
{
  return static ViewWillDisappearReason.inferred(for:)();
}

uint64_t sub_1007670D0()
{
  return type metadata accessor for ViewWillDisappearReason();
}

JSValue sub_1007670E0(JSContext in)
{
  return CustomJSValueConvertible._jsValue(in:)(in);
}

JSValue sub_1007670F0(JSContext in)
{
  return CustomJSValueConvertible.makeValue(in:)(in);
}

void sub_100767110()
{
}

uint64_t sub_100767120()
{
  return PageRenderMetricsPresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_100767130()
{
  return static MetricsFieldExclusionRequest.arcadeSubscription.getter();
}

uint64_t sub_100767140()
{
  return type metadata accessor for MetricsFieldExclusionRequest();
}

uint64_t sub_100767150()
{
  return static MetricsFieldInclusionRequest.pageFields.getter();
}

uint64_t sub_100767160()
{
  return static MetricsFieldInclusionRequest.searchGhostHint.getter();
}

uint64_t sub_100767170()
{
  return static MetricsFieldInclusionRequest.arcadeButtonName.getter();
}

uint64_t sub_100767180()
{
  return static MetricsFieldInclusionRequest.impressionsSnapshot.getter();
}

uint64_t sub_100767190()
{
  return type metadata accessor for MetricsFieldInclusionRequest();
}

uint64_t sub_1007671A0()
{
  return Bag.amsBag.getter();
}

uint64_t sub_1007671B0()
{
  return Bag.init(from:)();
}

uint64_t sub_1007671C0()
{
  return Bag.Profile.init(name:version:)();
}

uint64_t sub_1007671D0()
{
  return type metadata accessor for Bag.Profile();
}

uint64_t sub_1007671E0()
{
  return type metadata accessor for Bag();
}

uint64_t sub_1007671F0()
{
  return Logger.info(_:)();
}

uint64_t sub_100767200()
{
  return Logger.debug(_:)();
}

uint64_t sub_100767210()
{
  return Logger.error(_:)();
}

uint64_t sub_100767220()
{
  return Logger.warning(_:)();
}

uint64_t sub_100767230()
{
  return inject<A>(_:from:)();
}

uint64_t sub_100767240()
{
  return inject<A, B>(_:from:)();
}

uint64_t sub_100767250()
{
  return type metadata accessor for JSError();
}

uint64_t sub_100767260()
{
  return Promise.pipe(to:)();
}

uint64_t sub_100767270()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_100767280()
{
  return Promise.__allocating_init(error:)();
}

uint64_t sub_100767290()
{
  return Promise.__allocating_init(value:)();
}

uint64_t sub_1007672A0()
{
  return Promise.always(on:perform:)();
}

uint64_t sub_1007672B0()
{
  return Promise.reject(_:)();
}

uint64_t sub_1007672C0()
{
  return Promise.resolve(_:)();
}

uint64_t sub_1007672D0()
{
  return Promise.__allocating_init()();
}

uint64_t sub_1007672E0()
{
  return type metadata accessor for NilState();
}

uint64_t sub_1007672F0()
{
  return static OSLogger.inlineUnifiedMessage.getter();
}

uint64_t sub_100767300()
{
  return OSLogger.Subsystem.init(rawValue:)();
}

uint64_t sub_100767310()
{
  return type metadata accessor for OSLogger.Subsystem();
}

uint64_t sub_100767320()
{
  return OSLogger.init(subsystem:category:)();
}

uint64_t sub_100767330()
{
  return type metadata accessor for OSLogger();
}

uint64_t sub_100767340()
{
  return type metadata accessor for JSONArray();
}

uint64_t sub_100767350()
{
  return type metadata accessor for JSONError();
}

uint64_t sub_100767360()
{
  return StateLens.init<A>(contentsOf:in:)();
}

uint64_t sub_100767370()
{
  return StateLens<A>.currentValue.getter();
}

uint64_t sub_100767380()
{
  return StateLens<A>.subscript.getter();
}

uint64_t sub_100767390()
{
  return type metadata accessor for StateLens();
}

uint64_t sub_1007673A0()
{
  return StateLens.init(_:)();
}

uint64_t sub_1007673B0()
{
  return StateLens.init(_:)();
}

uint64_t sub_1007673C0()
{
  return StatePath.init<A>(components:)();
}

uint64_t sub_1007673D0()
{
  return StatePath<A>.init(_:)();
}

uint64_t sub_1007673E0()
{
  return StatePath.init(component:)();
}

uint64_t sub_1007673F0()
{
  return SyncEvent.removeObserver(_:)();
}

uint64_t sub_100767400()
{
  return SyncEvent.post(_:)();
}

uint64_t sub_100767410()
{
  return SyncEvent.init()();
}

uint64_t sub_100767420()
{
  return type metadata accessor for SyncEvent();
}

uint64_t sub_100767430()
{
  return dispatch thunk of ViewModel.impressionMetrics.getter();
}

uint64_t sub_100767440()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t sub_100767450()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_100767460()
{
  return type metadata accessor for WidgetCenter();
}

NSDictionary sub_100767470()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100767480()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100767490()
{
  return Dictionary.description.getter();
}

uint64_t sub_1007674A0()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t sub_1007674B0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_1007674C0()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_1007674D0()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_1007674E0()
{
  return Dictionary.subscript.setter();
}

uint64_t sub_1007674F0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100767500()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100767510()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_100767520()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t sub_100767530()
{
  return dispatch thunk of BidirectionalCollection.formIndex(before:)();
}

uint64_t sub_100767540()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_100767550()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100767560()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_100767570()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

void sub_100767580(Swift::String a1)
{
}

void sub_100767590(Swift::String a1)
{
}

uint64_t sub_1007675A0()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1007675B0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

NSString sub_1007675C0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1007675D0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1007675E0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1007675F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100767600()
{
  return String.init(data:encoding:)();
}

uint64_t sub_100767610()
{
  return String.init(format:_:)();
}

uint64_t sub_100767620()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100767630()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100767640()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100767650()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100767660()
{
  return String.nilIfEmpty.getter();
}

uint64_t sub_100767670()
{
  return String.encapsulated(color:scale:shape:style:platterSize:lineWeight:minimumWidth:)();
}

uint64_t sub_100767680()
{
  return static String.isNilOrEmpty(_:)();
}

BOOL sub_100767690(Swift::String a1)
{
  return String.hasPrefixCaseInsensitive(_:)(a1);
}

uint64_t sub_1007676A0(Swift::String upToCharacter)
{
  return String.prefix(upToCharacter:)(upToCharacter)._countAndFlagsBits;
}

BOOL sub_1007676B0(Swift::String_optional expansionFor)
{
  return String.isValid(expansionFor:)(expansionFor);
}

uint64_t sub_1007676C0()
{
  return String.hash(into:)();
}

uint64_t sub_1007676D0()
{
  return String.languageAwareOutsets(whenUsedWith:)();
}

uint64_t sub_1007676E0()
{
  return String.count.getter();
}

uint64_t sub_1007676F0()
{
  return String.append<A>(contentsOf:)();
}

void sub_100767700(Swift::String a1)
{
}

uint64_t sub_100767710()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100767720()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100767740()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100767750()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_100767760(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_100767770()
{
  return String.hashValue.getter();
}

uint64_t sub_100767780(Swift::String repeating, Swift::Int count)
{
  return String.init(repeating:count:)(repeating, count)._countAndFlagsBits;
}

uint64_t sub_100767790()
{
  return String.init<A>(_:)();
}

uint64_t sub_1007677A0()
{
  return String.subscript.getter();
}

uint64_t sub_1007677B0()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_1007677C0()
{
  return dispatch thunk of Sequence._copyToContiguousArray()();
}

uint64_t sub_1007677D0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_1007677E0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1007677F0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100767800()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100767810()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100767820()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100767830()
{
  return Array<A>.bestArtworkLayoutMetrics(for:prioritizing:)();
}

uint64_t sub_100767840()
{
  return Array<A>.visibleItemsTransformer(for:observing:asPartOf:)();
}

uint64_t sub_100767850()
{
  return Array.isNotEmpty.getter();
}

uint64_t sub_100767860()
{
  return Array.chunked(by:)();
}

uint64_t sub_100767870()
{
  return Array<A>.totalTopSupplementaryHeight.getter();
}

uint64_t sub_100767880()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_100767890()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1007678A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1007678B0()
{
  return Array<A>.init(tryDeserializing:using:)();
}

uint64_t sub_1007678C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1007678E0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1007678F0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100767900()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100767910()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100767920()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_100767940()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber sub_100767950()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_100767960()
{
  return Double.description.getter();
}

uint64_t sub_100767970()
{
  return Double._roundSlowPath(_:)();
}

uint64_t sub_100767980()
{
  return Double.rawValue(in:)();
}

uint64_t sub_100767990()
{
  return Float.description.getter();
}

NSSet sub_1007679A0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1007679B0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1007679C0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1007679D0()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber sub_1007679E0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1007679F0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100767A00()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_100767A10()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_100767A20()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_100767A30()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_100767A40()
{
  return type metadata accessor for UITextItem.Content();
}

uint64_t sub_100767A50()
{
  return UITextItem.content.getter();
}

uint64_t sub_100767A60()
{
  return CGContextRef.clip(using:)();
}

uint64_t sub_100767A70()
{
  return CGContextRef.move(to:)();
}

uint64_t sub_100767A80()
{
  return CGContextRef.addArc(center:radius:startAngle:endAngle:clockwise:)();
}

uint64_t sub_100767A90()
{
  return CGContextRef.addLine(to:)();
}

uint64_t sub_100767AA0()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t sub_100767AB0()
{
  return NSDictionary.init(dictionary:)();
}

uint64_t sub_100767AC0()
{
  return static UIEdgeInsets.vertical(top:bottom:)();
}

uint64_t sub_100767AD0()
{
  return static UIEdgeInsets.horizontal(left:right:)();
}

uint64_t sub_100767AE0()
{
  return UIEdgeInsets.hash(into:)();
}

uint64_t sub_100767AF0()
{
  return UIRectCorner.caCornerMask.getter();
}

uint64_t sub_100767B00()
{
  return static GKLocalPlayer.presentActivitySharingRepromptInOverlay(recipientName:)();
}

uint64_t sub_100767B10()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100767B20()
{
  return NSUserDefaults.shelfOrthogonalScrollingBehavior.getter();
}

uint64_t sub_100767B30()
{
  return NSUserDefaults.shelfOrthogonalScrollingBehavior.setter();
}

UIBarButtonItem sub_100767B40(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

UIBarButtonItem sub_100767B50(Swift::String_optional title, UIImage_optional image, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(title:image:primaryAction:menu:)(title, image, primaryAction, menu);
}

uint64_t sub_100767B60()
{
  return NSParagraphStyle.isListItem.getter();
}

uint64_t sub_100767B70()
{
  return static NSParagraphStyle.listItem(withFont:)();
}

uint64_t sub_100767B80()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:in:)();
}

uint64_t sub_100767B90()
{
  return UICollectionView.CellRegistration.init(handler:)();
}

uint64_t sub_100767BA0()
{
  return UICollectionView.SupplementaryRegistration.init(elementKind:handler:)();
}

uint64_t sub_100767BB0()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
}

uint64_t sub_100767BC0()
{
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
}

uint64_t sub_100767BD0()
{
  return UIViewController.traitOverrides.getter();
}

uint64_t sub_100767BE0()
{
  return UIViewController.traitOverrides.setter();
}

uint64_t sub_100767BF0()
{
  return UIViewController.registerForTraitChanges(_:action:)();
}

uint64_t sub_100767C00()
{
  return UIViewController.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_100767C10()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_100767C20()
{
  return static CGAffineTransform.== infix(_:_:)();
}

uint64_t sub_100767C30()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100767C40()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100767C50()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_100767C60()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_100767C70()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100767C80()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100767C90()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100767CA0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100767CB0()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_100767CC0()
{
  return UITraitCollection.isRegularPad.getter();
}

UITraitCollection sub_100767CD0(__C::UIContentSizeCategory_optional min, __C::UIContentSizeCategory_optional max)
{
  return UITraitCollection.clampingContentSizeCategory(min:max:)(min, max);
}

uint64_t sub_100767CE0()
{
  return UITraitCollection.isSizeClassCompact.getter();
}

uint64_t sub_100767CF0()
{
  return UITraitCollection.isSizeClassRegular.getter();
}

uint64_t sub_100767D00()
{
  return UITraitCollection.prefersRightToLeftLayouts.getter();
}

uint64_t sub_100767D10()
{
  return UITraitCollection.prefersAccessibilityLayouts.getter();
}

uint64_t sub_100767D20()
{
  return static UITraitCollection.withSystemPreferredContentSizeCategory.getter();
}

uint64_t sub_100767D30()
{
  return UITraitCollection.modifyingTraits(_:)();
}

uint64_t sub_100767D40()
{
  return static UITraitCollection.systemTraitsAffectingImageLookup.getter();
}

uint64_t sub_100767D50()
{
  return static UITraitCollection.systemTraitsAffectingColorAppearance.getter();
}

uint64_t sub_100767D60()
{
  return NSAttributedString.init(_:)();
}

uint64_t sub_100767D70()
{
  return NSAttributedString.byCollapsingNewlines.getter();
}

uint64_t sub_100767D80()
{
  return NSAttributedString.init(images:for:adjustsImageSizeForAccessibilityContentSizeCategory:interItemSpacing:defaultAttributes:imagesShouldRenderAsTemplates:)();
}

NSAttributedString sub_100767D90(NSAttributedString attributedString, Swift::OpaquePointer defaultAttributes)
{
  return NSAttributedString.init(attributedString:defaultAttributes:)(attributedString, defaultAttributes);
}

uint64_t sub_100767DA0()
{
  return static NSNotificationName.VideoDecoderUnavailable.getter();
}

uint64_t sub_100767DB0()
{
  return static NSNotificationName.AutoPlayVideoSettingsDidChange.getter();
}

uint64_t sub_100767DC0()
{
  return UITraitEnvironment.withAccessibleContentSizesDisabled.getter();
}

uint64_t sub_100767DD0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_100767DE0()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_100767DF0()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t sub_100767E00()
{
  return UICollectionViewCell.backgroundConfiguration.setter();
}

uint64_t sub_100767E10()
{
  return static UIImageConfiguration.symbolConfiguration(textStyle:weight:scale:)();
}

uint64_t sub_100767E20()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100767E30()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100767E40()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_100767E50()
{
  return static UIContentSizeCategory.> infix(_:_:)();
}

uint64_t sub_100767E60()
{
  return static UIContentSizeCategory.< infix(_:_:)();
}

uint64_t sub_100767E70()
{
  return static UIContentSizeCategory.>= infix(_:_:)();
}

uint64_t sub_100767E80()
{
  return static UIContentSizeCategory.<= infix(_:_:)();
}

uint64_t sub_100767E90()
{
  return static UIViewPropertyAnimator.fadeInPropertyAnimator.getter();
}

uint64_t sub_100767EA0()
{
  return static NSCollectionLayoutGroup.emptyLayoutGroup(for:)();
}

uint64_t sub_100767EB0()
{
  return NSDirectionalEdgeInsets.edgeInsets.getter();
}

uint64_t sub_100767EC0()
{
  return NSDirectionalEdgeInsets.insetsWithLayoutDirection(in:)();
}

uint64_t sub_100767ED0()
{
  return NSDirectionalEdgeInsets.insetsWithLayoutDirection(_:)();
}

uint64_t sub_100767EE0()
{
  return static UICollectionReusableView.elementKind.getter();
}

uint64_t sub_100767EF0()
{
  return static UICollectionReusableView.defaultReuseIdentifier.getter();
}

uint64_t sub_100767F00()
{
  return static UICollectionReusableView.matchesItemElementKind(_:)();
}

uint64_t sub_100767F10()
{
  return static UICollectionReusableView.makeItemScopedElementKind(in:uniquify:)();
}

uint64_t sub_100767F20()
{
  return UICollectionViewListCell.accessories.getter();
}

uint64_t sub_100767F30()
{
  return UICollectionViewListCell.accessories.setter();
}

uint64_t sub_100767F40()
{
  return UIContentUnavailableView.init(configuration:)();
}

uint64_t sub_100767F50()
{
  return UIPresentationController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_100767F60()
{
  return static NSCollectionLayoutSection.emptyLayoutSection(for:)();
}

uint64_t sub_100767F70()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t sub_100767F80()
{
  return static UIImageSymbolConfiguration.configuration(textStyle:weight:scale:)();
}

uint64_t sub_100767F90()
{
  return UIPopoverPresentationControllerSourceItem.frame(in:)();
}

uint64_t sub_100767FA0()
{
  return CGRect.withLayoutDirection(using:relativeTo:)();
}

uint64_t sub_100767FB0()
{
  return static CGRect.frame(centeredWithin:of:)();
}

uint64_t sub_100767FC0()
{
  return static CGRect.frame(pinnedAtTopCenterOf:of:)();
}

uint64_t sub_100767FD0()
{
  return static CGRect.frame(pinnedAtBottomLeftOf:of:)();
}

uint64_t sub_100767FE0()
{
  return CGRect.rounded(originRule:sizeRule:)();
}

uint64_t sub_100767FF0()
{
  return CGRect.rounded(_:)();
}

uint64_t sub_100768000()
{
  return CGRect.subtracting(insets:)();
}

uint64_t sub_100768010()
{
  return CGRect.withLayoutDirection(in:relativeTo:)();
}

uint64_t sub_100768020()
{
  return CGRect.withLayoutDirection(_:relativeTo:)();
}

uint64_t sub_100768030()
{
  return CGRect.inset(bySeparator:in:)();
}

uint64_t sub_100768040()
{
  return CGRect.adding(outsets:)();
}

uint64_t sub_100768050()
{
  return CGSize.scaled(_:)();
}

uint64_t sub_100768060()
{
  return CGSize.fitting(_:mode:)();
}

uint64_t sub_100768070()
{
  return CGSize.rounded(_:)();
}

uint64_t sub_100768080()
{
  return CGSize.integral.getter();
}

uint64_t sub_100768090()
{
  return CGSize.subtracting(insets:)();
}

uint64_t sub_1007680A0()
{
  return CGSize.add(outsets:)();
}

uint64_t sub_1007680B0()
{
  return CGSize.adding(outsets:)();
}

uint64_t sub_1007680C0()
{
  return CGSize.adding(separator:in:)();
}

uint64_t sub_1007680D0()
{
  return static CMTime.== infix(_:_:)();
}

unint64_t sub_1007680E0(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  return (unint64_t)CMTime.init(seconds:preferredTimescale:)(seconds, preferredTimescale);
}

uint64_t sub_1007680F0()
{
  return static UIFont.preferredFont(forUseWith:in:)();
}

uint64_t sub_100768100()
{
  return static UIFont.preferredFont(forUseWith:compatibleWith:)();
}

uint64_t sub_100768110()
{
  return UIFont.estimatedFirstBaseline.getter();
}

UIMenu sub_100768120(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_100768130()
{
  return UIView.annotate(with:)();
}

uint64_t sub_100768140()
{
  return UIView.boundsBasedPlaceable.getter();
}

uint64_t sub_100768150()
{
  return static UIView.defaultHighlightAlpha.getter();
}

uint64_t sub_100768160()
{
  return UIView.setAutomationSemantics(_:)();
}

uint64_t sub_100768170()
{
  return UIView.withUntransformedFrame.getter();
}

uint64_t sub_100768180()
{
  return UIView.traitOverrides.getter();
}

uint64_t sub_100768190()
{
  return UIView.traitOverrides.setter();
}

uint64_t sub_1007681A0()
{
  return UIView.registerForTraitChanges(_:action:)();
}

uint64_t sub_1007681B0()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_1007681C0()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_1007681D0()
{
  return static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
}

uint64_t sub_1007681E0()
{
  return CGPoint.rounded(_:)();
}

uint64_t sub_1007681F0()
{
  return JSValue.subscript.setter();
}

uint64_t sub_100768200()
{
  return NSArray.makeIterator()();
}

uint64_t sub_100768210()
{
  return static UIColor.defaultLine.getter();
}

uint64_t sub_100768220()
{
  return static UIColor.mediaBorder.getter();
}

uint64_t sub_100768230()
{
  return static UIColor.primaryText.getter();
}

uint64_t sub_100768240()
{
  return static UIColor.tertiaryText.getter();
}

uint64_t sub_100768250()
{
  return static UIColor.secondaryText.getter();
}

uint64_t sub_100768260()
{
  return static UIColor.reviewBackground.getter();
}

uint64_t sub_100768270()
{
  return static UIColor.defaultBackground.getter();
}

uint64_t sub_100768280()
{
  return static UIColor.tableViewBackground.getter();
}

uint64_t sub_100768290()
{
  return static UIColor.tableViewCellChevron.getter();
}

uint64_t sub_1007682A0()
{
  return static UIColor.placeholderBackground.getter();
}

uint64_t sub_1007682B0()
{
  return static UIColor.defaultButtonTitleColor.getter();
}

uint64_t sub_1007682C0()
{
  return static UIColor.tableViewCellBackground.getter();
}

uint64_t sub_1007682D0()
{
  return static UIColor.todayCardDefaultBackground.getter();
}

uint64_t sub_1007682E0()
{
  return static UIColor.componentBackgroundStandout.getter();
}

uint64_t sub_1007682F0()
{
  return static UIColor.defaultButtonBackgroundColor.getter();
}

uint64_t sub_100768300()
{
  return static UIColor.placeholderBackgroundStandout.getter();
}

uint64_t sub_100768310()
{
  return static UIColor.tableViewCellSelectedBackground.getter();
}

uint64_t sub_100768320()
{
  return static UIColor.hex(_:)();
}

UIColor sub_100768330(UIColor light, UIColor dark)
{
  return UIColor.init(light:dark:)(light, dark);
}

uint64_t sub_100768340()
{
  return UIColor.isDark(threshold:)();
}

uint64_t sub_100768350()
{
  return UIColor.isDark.getter();
}

uint64_t sub_100768360()
{
  return static UIColor.appTint.getter();
}

uint64_t sub_100768370()
{
  return UIColor.highlighted.getter();
}

UIColor sub_100768380(UIColor light, UIColor lightHighContrast, UIColor dark, UIColor darkHighContrast)
{
  return UIColor.init(light:lightHighContrast:dark:darkHighContrast:)(light, lightHighContrast, dark, darkHighContrast);
}

UIColor sub_100768390(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
}

uint64_t sub_1007683A0()
{
  return UIImage.baselineOffsetFromBottom.getter();
}

uint64_t sub_1007683B0()
{
  return UILabel.stringValue.getter();
}

uint64_t sub_1007683C0()
{
  return UILabel.alignment.setter();
}

uint64_t sub_1007683D0()
{
  return UILabel.textAppearance.setter();
}

uint64_t sub_1007683E0()
{
  return UILabel.measure(toFit:with:)();
}

uint64_t sub_1007683F0(Swift::OpaquePointer fromLanguageCodes)
{
  return NSBundle.preferredLocalization(fromLanguageCodes:)(fromLanguageCodes)._countAndFlagsBits;
}

NSNumber sub_100768400(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber sub_100768410(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_100768420(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100768430()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100768440()
{
  return NSObject.hash(into:)();
}

uint64_t sub_100768450()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_100768460()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100768470()
{
  return UIButton.measure(toFit:with:)();
}

uint64_t sub_100768480()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.getter();
}

uint64_t sub_100768490()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t sub_1007684A0()
{
  return UIButton.Configuration.background.modify();
}

uint64_t sub_1007684B0()
{
  return UIButton.Configuration.background.getter();
}

uint64_t sub_1007684C0()
{
  return UIButton.Configuration.background.setter();
}

uint64_t sub_1007684D0()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t sub_1007684E0()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_1007684F0()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_100768500()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t sub_100768510()
{
  return UIButton.Configuration.titlePadding.setter();
}

uint64_t sub_100768520()
{
  return UIButton.Configuration.contentInsets.modify();
}

uint64_t sub_100768530()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t sub_100768540()
{
  return UIButton.Configuration.imagePlacement.setter();
}

uint64_t sub_100768550()
{
  return UIButton.Configuration.attributedTitle.modify();
}

uint64_t sub_100768560()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t sub_100768570()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t sub_100768580()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_100768590()
{
  return UIButton.Configuration.imageColorTransformer.setter();
}

uint64_t sub_1007685A0()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t sub_1007685B0()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t sub_1007685C0()
{
  return static UIButton.Configuration.gray()();
}

uint64_t sub_1007685D0()
{
  return UIButton.Configuration.image.getter();
}

uint64_t sub_1007685E0()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_1007685F0()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_100768600()
{
  return UIButton.Configuration.title.setter();
}

uint64_t sub_100768610()
{
  return static UIButton.Configuration.filled()();
}

uint64_t sub_100768620()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_100768630()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_100768640()
{
  return UIButton.configuration.getter();
}

uint64_t sub_100768650()
{
  return UIButton.configuration.setter();
}

uint64_t sub_100768660()
{
  return NSCopying.makeCopy()();
}

uint64_t sub_100768670()
{
  return Optional<A>.isNilOrEmpty.getter();
}

uint64_t sub_100768680()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t sub_100768690()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1007686A0()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_1007686B0()
{
  return StringProtocol.uppercased(with:)();
}

uint64_t sub_1007686C0()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_1007686D0()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_1007686E0()
{
  return StringProtocol.enumerateSubstrings<A>(in:options:_:)();
}

uint64_t sub_1007686F0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_100768700()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t sub_100768710()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100768720()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_100768730()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t sub_100768740()
{
  return dispatch thunk of SetAlgebra.insert(_:)();
}

uint64_t sub_100768750()
{
  return dispatch thunk of SetAlgebra.isEmpty.getter();
}

uint64_t sub_100768760()
{
  return dispatch thunk of SetAlgebra.subtract(_:)();
}

uint64_t sub_100768770()
{
  return dispatch thunk of SetAlgebra.formUnion(_:)();
}

uint64_t sub_100768790()
{
  return dispatch thunk of SetAlgebra.init()();
}

uint64_t sub_1007687A0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1007687B0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1007687C0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1007687D0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_1007687E0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1007687F0()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_100768800()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_100768810()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_100768820()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100768830()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100768840()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_100768850()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100768860()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_100768870()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_100768880()
{
  return debugPrint(_:separator:terminator:)();
}

uint64_t sub_100768890()
{
  return AnyHashable.description.getter();
}

Swift::Int sub_1007688A0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1007688B0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1007688C0()
{
  return AnyHashable.hash(into:)();
}

uint64_t sub_1007688D0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1007688E0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1007688F0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100768900()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100768910()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100768920(Swift::Int a1)
{
}

uint64_t sub_100768930()
{
  return StaticString.description.getter();
}

void sub_100768940(Swift::Int a1)
{
}

uint64_t sub_100768950()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100768960()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100768970()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100768980()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100768990()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1007689A0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1007689B0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1007689C0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1007689D0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1007689E0()
{
  return _NativeDictionary.makeIterator()();
}

uint64_t sub_1007689F0()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_100768A00()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_100768A10()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_100768A20()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_100768A30()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100768A40()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100768A50()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100768A60()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100768A70()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100768A80()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100768A90()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100768AA0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_100768AB0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100768AC0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100768AE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_100768B00(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100768B10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100768B20()
{
  return type metadata accessor for FloatingPointRoundingRule();
}

uint64_t sub_100768B30()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100768B40()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_100768B50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100768B60()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100768B70()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_100768B80()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_100768B90()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_100768BA0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100768BB0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100768BC0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100768BD0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100768BE0()
{
  return Error._code.getter();
}

uint64_t sub_100768BF0()
{
  return Error._domain.getter();
}

uint64_t sub_100768C00()
{
  return Error._userInfo.getter();
}

uint64_t sub_100768C10()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_100768C20()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100768C30()
{
  return Hasher.init(_seed:)();
}

void sub_100768C40(Swift::UInt a1)
{
}

void sub_100768C50(Swift::UInt8 a1)
{
}

void sub_100768C60(Swift::UInt64 a1)
{
}

Swift::Int sub_100768C70()
{
  return Hasher.finalize()();
}

Swift::Int sub_100768C80()
{
  return Hasher._finalize()();
}

uint64_t sub_100768C90()
{
  return Hasher.init()();
}

uint64_t sub_100768CA0()
{
  return _typeName(_:qualified:)();
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t ASKBuildTypeGetCurrent()
{
  return _ASKBuildTypeGetCurrent();
}

uint64_t ASKBuildTypeIsAnyOf()
{
  return _ASKBuildTypeIsAnyOf();
}

uint64_t ASKDeviceTypeGetCurrent()
{
  return _ASKDeviceTypeGetCurrent();
}

uint64_t ASKPerformanceProfileGetForCurrentDevice()
{
  return _ASKPerformanceProfileGetForCurrentDevice();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  CGPoint v4 = _CGPointApplyAffineTransform(point, t);
  double y = v4.y;
  double x = v4.x;
  result.double y = y;
  result.double x = x;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

uint64_t JUMeasurementsEqual()
{
  return _JUMeasurementsEqual();
}

uint64_t JUScreenClassGetLandscapeWidth()
{
  return _JUScreenClassGetLandscapeWidth();
}

uint64_t JUScreenClassGetMain()
{
  return _JUScreenClassGetMain();
}

uint64_t JUScreenClassGetPortraitWidth()
{
  return _JUScreenClassGetPortraitWidth();
}

uint64_t JUScreenClassHasRoundedCorners()
{
  return _JUScreenClassHasRoundedCorners();
}

uint64_t JUScreenClassIsPhone()
{
  return _JUScreenClassIsPhone();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return _UIAccessibilityButtonShapesEnabled();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectCenteredYInRectScale()
{
  return _UIRectCenteredYInRectScale();
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection()
{
  return __UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
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

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return _class_getMethodImplementation(cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

long double hypot(long double __x, long double __y)
{
  return _hypot(__x, __y);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

void method_exchangeImplementations(Method m1, Method m2)
{
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return _method_getTypeEncoding(m);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced()
{
  return _swift_isUniquelyReferenced();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_readAtKeyPath()
{
  return _swift_readAtKeyPath();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return _swift_setAtReferenceWritableKeyPath();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakCopyAssign()
{
  return _swift_weakCopyAssign();
}

uint64_t swift_weakCopyInit()
{
  return _swift_weakCopyInit();
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

uint64_t swift_weakTakeAssign()
{
  return _swift_weakTakeAssign();
}

uint64_t swift_weakTakeInit()
{
  return _swift_weakTakeInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

long double tan(long double __x)
{
  return _tan(__x);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 _baselineOffsetFromBottom];
}

id objc_msgSend__detailsCell(void *a1, const char *a2, ...)
{
  return _[a1 _detailsCell];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__fontWithSize_textStyleAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fontWithSize:textStyleAttribute:");
}

id objc_msgSend__presentationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _presentationViewController];
}

id objc_msgSend__primaryLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 _primaryLabelFont];
}

id objc_msgSend__secondaryLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 _secondaryLabelFont];
}

id objc_msgSend__setContainerIgnoresDirectTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerIgnoresDirectTouchEvents:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_applyHighLumaSettingsToSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyHighLumaSettingsToSettings:");
}

id objc_msgSend_applyLowLumaSettingsToSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyLowLumaSettingsToSettings:");
}

id objc_msgSend_applyMediumLumaSettingsToSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyMediumLumaSettingsToSettings:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_as_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_presentViewController:animated:completion:");
}

id objc_msgSend_as_viewControllersForVisibilityCallbackForwarding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewControllersForVisibilityCallbackForwarding");
}

id objc_msgSend_as_viewDidBecomeFullyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewDidBecomeFullyVisible");
}

id objc_msgSend_as_viewDidBecomePartiallyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewDidBecomePartiallyVisible");
}

id objc_msgSend_as_viewWillBecomeFullyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewWillBecomeFullyVisible");
}

id objc_msgSend_as_viewWillBecomePartiallyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewWillBecomePartiallyVisible");
}

id objc_msgSend_backTitle(void *a1, const char *a2, ...)
{
  return _[a1 backTitle];
}

id objc_msgSend_backgroundColorForReducedTransparency(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColorForReducedTransparency];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_brightness(void *a1, const char *a2, ...)
{
  return _[a1 brightness];
}

id objc_msgSend_cancelTitle(void *a1, const char *a2, ...)
{
  return _[a1 cancelTitle];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
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

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_graphicsQuality(void *a1, const char *a2, ...)
{
  return _[a1 graphicsQuality];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTableView:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keyboardOverlapHeight(void *a1, const char *a2, ...)
{
  return _[a1 keyboardOverlapHeight];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_lineFragmentPadding(void *a1, const char *a2, ...)
{
  return _[a1 lineFragmentPadding];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return _[a1 placeholder];
}

id objc_msgSend_placeholderText(void *a1, const char *a2, ...)
{
  return _[a1 placeholderText];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_primaryLabel(void *a1, const char *a2, ...)
{
  return _[a1 primaryLabel];
}

id objc_msgSend_privacyNote(void *a1, const char *a2, ...)
{
  return _[a1 privacyNote];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return _[a1 readableContentGuide];
}

id objc_msgSend_reasonID(void *a1, const char *a2, ...)
{
  return _[a1 reasonID];
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return _[a1 reasons];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_reportConcernExplanation(void *a1, const char *a2, ...)
{
  return _[a1 reportConcernExplanation];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_secondaryLabel(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabel];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_selectReasonSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 selectReasonSubtitle];
}

id objc_msgSend_selectReasonTitle(void *a1, const char *a2, ...)
{
  return _[a1 selectReasonTitle];
}

id objc_msgSend_selectedReason(void *a1, const char *a2, ...)
{
  return _[a1 selectedReason];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setBackBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackBarButtonItem:");
}

id objc_msgSend_setBackTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackTitle:");
}

id objc_msgSend_setBackdropVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackdropVisible:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBlurRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurRadius:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBrightness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrightness:");
}

id objc_msgSend_setCancelTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelTitle:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColorTint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTint:");
}

id objc_msgSend_setColorTintAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintAlpha:");
}

id objc_msgSend_setColorTintMaskAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintMaskAlpha:");
}

id objc_msgSend_setColorTintMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintMaskImage:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFilterMaskAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterMaskAlpha:");
}

id objc_msgSend_setFilterMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterMaskImage:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGrayscaleTintAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintAlpha:");
}

id objc_msgSend_setGrayscaleTintLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintLevel:");
}

id objc_msgSend_setGrayscaleTintMaskAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintMaskAlpha:");
}

id objc_msgSend_setGrayscaleTintMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintMaskImage:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setKeyboardOverlapHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardOverlapHeight:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLegibleColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLegibleColor:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineSpacing:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlaceholderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderText:");
}

id objc_msgSend_setPresentationWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationWindow:");
}

id objc_msgSend_setPrivacyNote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyNote:");
}

id objc_msgSend_setReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReasons:");
}

id objc_msgSend_setReportConcernExplanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportConcernExplanation:");
}

id objc_msgSend_setRequiresColorStatistics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresColorStatistics:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSaturationDeltaFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaturationDeltaFactor:");
}

id objc_msgSend_setScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreen:");
}

id objc_msgSend_setSelectReasonSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectReasonSubtitle:");
}

id objc_msgSend_setSelectReasonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectReasonTitle:");
}

id objc_msgSend_setSelectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedReason:");
}

id objc_msgSend_setSizesWindowToScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSizesWindowToScene:");
}

id objc_msgSend_setSubmitTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubmitTitle:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUsesBackdropEffectView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesBackdropEffectView:");
}

id objc_msgSend_setUsesColorTintView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesColorTintView:");
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowLevel:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_submitTitle(void *a1, const char *a2, ...)
{
  return _[a1 submitTitle];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _[a1 textContainer];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toastView(void *a1, const char *a2, ...)
{
  return _[a1 toastView];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_uppercaseName(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseName];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}