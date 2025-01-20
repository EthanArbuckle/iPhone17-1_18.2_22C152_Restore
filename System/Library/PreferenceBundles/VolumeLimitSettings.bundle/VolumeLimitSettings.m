id sub_2D14(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_class *ObjectType;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  objc_super v15;
  void v16[3];
  uint64_t v17;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_2FBC(a1, (uint64_t)v16);
  v7 = v17;
  if (v17)
  {
    v8 = sub_30C8(v16, v17);
    v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8, v8);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = sub_CEF8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_310C((uint64_t)v16);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v3;
  v15.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v15, "initWithTarget:action:", v12, a2);
  swift_unknownObjectRelease();
  sub_3068(a1);
  return v13;
}

id VolumeLimitSettingsState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id variable initialization expression of VolumeLimitSettingsState.isSpeakerVolumeLimitModificationAllowed()
{
  id result = [self sharedConnection];
  if (result)
  {
    v1 = result;
    id v2 = [result isSpeakerVolumeLimitModificationAllowed];

    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for NonMovableTapGestureRecognizer()
{
  return self;
}

uint64_t sub_2FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3024(&qword_148D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3024(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3068(uint64_t a1)
{
  uint64_t v2 = sub_3024(&qword_148D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_30C8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_310C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_315C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_31D0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_3244()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  return v1;
}

id sub_32B8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  if (!v6)
  {
LABEL_5:
    [v0 maximumValue];
    float v3 = v2;
    id result = [v0 minimumValue];
    float v5 = (float)(v3 - v4) + 1.0;
    if ((~LODWORD(v5) & 0x7F800000) != 0)
    {
      if (v5 > -9.2234e18)
      {
        if (v5 < 9.2234e18) {
          return (id)(uint64_t)v5;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  id result = (id)(v6 + 1);
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  return result;
}

id sub_33FC(double a1)
{
  [v1 minimumValue];
  float v4 = v3;
  [v1 maximumValue];
  float v6 = v5;
  [v1 minimumValue];
  float v8 = v7;
  id result = sub_32B8();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    goto LABEL_7;
  }
  double v10 = round((a1 - v4) / ((float)(v6 - v8) / (double)((unint64_t)result - 1)));
  if ((~*(void *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v10 < 9.22337204e18) {
    return (id)(uint64_t)v10;
  }
LABEL_9:
  __break(1u);
  return result;
}

id sub_34D8(char a1, uint64_t a2)
{
  uint64_t v35 = a2;
  ObjectType = (objc_class *)swift_getObjectType();
  int v34 = a1 & 1;
  uint64_t v33 = sub_3024(&qword_14988);
  uint64_t v37 = *(void *)(v33 - 8);
  __chkstk_darwin(v33, v4);
  v30 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_CE38();
  __chkstk_darwin(v6, v7);
  uint64_t v8 = sub_CE58();
  __chkstk_darwin(v8, v9);
  uint64_t v10 = sub_3024(&qword_14990);
  uint64_t v29 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v2[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator] = 0;
  v15 = &v2[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__snappingBehavior];
  LOBYTE(v40) = 0;
  v16 = v2;
  sub_CE48();
  sub_CE28();
  unint64_t v31 = sub_50A0();
  uint64_t v28 = v6;
  sub_CDE8();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v14, v10);
  v32 = v16;
  v17 = &v16[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__segmentCount];
  id v40 = 0;
  sub_CE48();
  sub_CE28();
  v18 = v30;
  sub_CDE8();
  uint64_t v19 = v33;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v17, v18, v33);
  id v40 = [self systemGrayColor];
  sub_CE48();
  sub_3024(&qword_14968);
  sub_5264();
  sub_CDD8();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v29);
  LOBYTE(v39) = v34;
  sub_CE48();
  sub_CE28();
  sub_CDE8();
  swift_endAccess();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v19);
  uint64_t v39 = v35;
  sub_CE48();
  sub_CE28();
  sub_CDE8();
  swift_endAccess();
  v20 = v32;

  v38.receiver = v20;
  v38.super_class = ObjectType;
  id v21 = objc_msgSendSuper2(&v38, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_5358(0, &qword_14998);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v22 = v21;
  v23 = (void *)sub_CE88();
  [v22 addAction:v23 forControlEvents:1];

  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v24 = v22;
  v25 = (void *)sub_CE88();
  [v24 addAction:v25 forControlEvents:448];

  id v26 = [objc_allocWithZone((Class)type metadata accessor for NonMovableTapGestureRecognizer()) initWithTarget:v24 action:"handleSliderTap:"];
  [v24 addGestureRecognizer:v26];

  return v24;
}

void sub_3B44()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    id v2 = [objc_allocWithZone((Class)UISelectionFeedbackGenerator) init];
    uint64_t v3 = OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator;
    uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator];
    *(void *)&v1[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator] = v2;

    uint64_t v5 = *(void **)&v1[v3];
    if (v5) {
      [v5 prepare];
    }
  }
}

void sub_3BD4()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)&Strong[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator];
    *(void *)&Strong[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator] = 0;
  }
}

double sub_3CBC()
{
  ObjectType = (objc_class *)swift_getObjectType();
  [v0 bounds];
  v57.receiver = v0;
  v57.super_class = ObjectType;
  objc_msgSendSuper2(&v57, "trackRectForBounds:");
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  [v0 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v0 minimumValue];
  v56.receiver = v0;
  v56.super_class = ObjectType;
  double v16 = v15;
  double v17 = v3;
  CGFloat v52 = v5;
  double v53 = v3;
  CGFloat v54 = v7;
  objc_msgSendSuper2(&v56, "thumbRectForBounds:trackRect:value:", v9, v11, v13, v16, v3, v5, v7, 4.0, v18);
  CGFloat v20 = v19;
  CGFloat v48 = v21;
  CGFloat v49 = v22;
  CGFloat v51 = v23;
  [v0 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [v0 maximumValue];
  v55.receiver = v0;
  v55.super_class = ObjectType;
  LODWORD(v47) = v32;
  objc_msgSendSuper2(&v55, "thumbRectForBounds:trackRect:value:", v25, v27, v29, v31, v17, v5, v7, 4.0, v47);
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  v58.origin.x = v20;
  v58.origin.y = v48;
  v58.size.width = v49;
  v58.size.height = v51;
  double MidX = CGRectGetMidX(v58);
  v59.origin.x = v34;
  v59.origin.y = v36;
  v59.size.width = v38;
  v59.size.height = v40;
  double v41 = CGRectGetMidX(v59);
  v60.origin.x = v20;
  v60.origin.y = v48;
  v60.size.width = v49;
  v60.size.height = v51;
  CGRectGetMidY(v60);
  id v42 = [v0 traitCollection];
  v43 = (char *)[v42 layoutDirection];

  if (v43 == (unsigned char *)&dword_0 + 1) {
    double v44 = MidX - v41;
  }
  else {
    double v44 = v41 - MidX;
  }
  v61.size.height = 4.0;
  v61.origin.x = v53;
  v61.origin.y = v52;
  v61.size.width = v54;
  CGFloat v45 = CGRectGetWidth(v61) - v44;
  v62.size.height = 4.0;
  v62.origin.x = v53;
  v62.origin.y = v52;
  v62.size.width = v54;
  CGRectGetHeight(v62);
  return v53 + v45 * 0.5;
}

unint64_t sub_3F18(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v5 = v4;
  double MidY = CGRectGetMidY(*(CGRect *)&a1);
  [v4 value];
  id v43 = sub_33FC(v11);
  unint64_t result = (unint64_t)sub_32B8();
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_21:
    __break(1u);
  }
  else
  {
    unint64_t v13 = result;
    if (result)
    {
      double v14 = MidY + -4.0;
      id v44 = self;
      uint64_t v15 = 0;
      double v16 = &NonMovableTapGestureRecognizer;
      while (1)
      {
        [v5 minimumValue];
        float v19 = v18;
        objc_msgSend(v5, (SEL)v16[12].base_props);
        float v21 = v20;
        [v5 minimumValue];
        float v23 = v22;
        unint64_t result = (unint64_t)sub_32B8();
        if (__OFSUB__(result, 1))
        {
          __break(1u);
          goto LABEL_21;
        }
        double v24 = (float)(v21 - v23) / (double)(uint64_t)(result - 1) * (double)v15 + v19;
        v46.origin.x = a1;
        v46.origin.y = a2;
        v46.size.width = a3;
        v46.size.height = a4;
        double Width = CGRectGetWidth(v46);
        double v26 = v16;
        objc_msgSend(v5, (SEL)v16[12].base_props);
        float v28 = v27;
        [v5 minimumValue];
        double v30 = Width / (float)(v28 - v29);
        [v5 minimumValue];
        double v32 = v30 * (v24 - v31);
        id v33 = [v5 traitCollection];
        CGFloat v34 = (char *)[v33 layoutDirection];

        CGFloat v35 = a1;
        CGFloat v36 = a2;
        CGFloat v37 = a3;
        CGFloat v38 = a4;
        if (v34 == (unsigned char *)&dword_0 + 1) {
          double v39 = CGRectGetMaxX(*(CGRect *)&v35) - v32;
        }
        else {
          double v39 = v32 + CGRectGetMinX(*(CGRect *)&v35);
        }
        id v40 = objc_msgSend(v44, "bezierPathWithRoundedRect:cornerRadius:", v39 + -2.0, v14, 4.0, 8.0, 4.0);
        swift_getKeyPath();
        swift_getKeyPath();
        sub_CDF8();
        swift_release();
        swift_release();
        if (v45 == 1)
        {
          [v5 value];
          if (v24 <= v41) {
            goto LABEL_4;
          }
        }
        else if ((uint64_t)v43 >= v15)
        {
LABEL_4:
          id v17 = v40;
          sub_CD68();
          if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
            sub_CD88();
          }
          goto LABEL_6;
        }
        id v42 = v40;
        sub_CD68();
        if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
          sub_CD88();
        }
LABEL_6:
        sub_CD98();
        ++v15;
        sub_CD78();

        double v16 = v26;
        if (v13 == v15) {
          return (unint64_t)&_swiftEmptyArrayStorage;
        }
      }
    }
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  return result;
}

id sub_4298(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  [v4 value];
  sub_4C18(v9, a1, a2, a3, a4);
  double v11 = v10;
  [v4 minimumValue];
  sub_4C18(v12, a1, a2, a3, a4);
  double v14 = v13;
  [v4 maximumValue];
  sub_4C18(v15, a1, a2, a3, a4);
  id v16 = [v4 traitCollection];
  id v17 = (char *)[v16 layoutDirection];

  if (v14 >= v11) {
    double v18 = v11;
  }
  else {
    double v18 = v14;
  }
  if (v11 <= v14) {
    double v11 = v14;
  }
  if (v17 == (unsigned char *)&dword_0 + 1)
  {
    v28.origin.x = a1;
    v28.origin.y = a2;
    v28.size.width = a3;
    v28.size.height = a4;
    double v27 = CGRectGetMaxX(v28) - v11;
    v29.origin.x = a1;
    v29.origin.y = a2;
    v29.size.width = a3;
    v29.size.height = a4;
    double MaxX = CGRectGetMaxX(v29);
    v30.origin.x = a1;
    v30.origin.y = a2;
    v30.size.width = a3;
    v30.size.height = a4;
    double MinX = CGRectGetMinX(v30);
    v31.origin.x = a1;
    v31.origin.y = a2;
    v31.size.width = a3;
    v31.size.height = a4;
    double v21 = v18 - CGRectGetMinX(v31);
  }
  else
  {
    double v27 = v18 - a1;
    double v21 = a1 + a3 - v11;
    double MinX = v11;
    double MaxX = v11;
    double v11 = a1;
  }
  float v22 = self;
  id v23 = objc_msgSend(v22, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v11, a2, v27, a4, 2.0, 2.0);
  id v24 = objc_msgSend(v22, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, MinX, a2, v21, a4, 2.0, 2.0);
  id v25 = objc_msgSend(v22, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v18, a2, MaxX - v18, a4, 2.0, 2.0);
  return v23;
}

id sub_45B4(char a1, float a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  double v6 = a2;
  id v7 = sub_33FC(v6);
  [v2 minimumValue];
  float v9 = v8;
  [v2 maximumValue];
  float v11 = v10;
  [v2 minimumValue];
  float v13 = v12;
  id result = sub_32B8();
  if (__OFSUB__(result, 1))
  {
    __break(1u);
    return result;
  }
  double v15 = (float)(v11 - v13) / (double)((unint64_t)result - 1) * (double)(uint64_t)v7 + v9;
  [v2 value];
  double v17 = v16;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  id result = (id)swift_release();
  if ((v21 & 1) == 0)
  {
    id result = [v2 isTracking];
    if (!result) {
      goto LABEL_11;
    }
    [v2 value];
    id result = sub_33FC(v19);
    if (v7 == result) {
      goto LABEL_11;
    }
LABEL_9:
    id result = *(id *)&v2[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator];
    if (result) {
      id result = [result selectionChanged];
    }
    goto LABEL_11;
  }
  double v18 = vabdd_f64(v15, v6);
  if (v18 >= 0.015) {
    goto LABEL_12;
  }
  id result = [v2 isTracking];
  if (result && v15 != v17) {
    goto LABEL_9;
  }
LABEL_11:
  double v6 = v15;
LABEL_12:
  if (v6 != v17)
  {
    *(float *)&double v18 = v6;
    v20.receiver = v2;
    v20.super_class = ObjectType;
    return objc_msgSendSuper2(&v20, "setValue:animated:", a1 & 1, v18);
  }
  return result;
}

id sub_47F8(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  [a1 locationInView:v1];
  double v5 = v4;
  [v1 bounds];
  v28.receiver = v1;
  v28.super_class = ObjectType;
  objc_msgSendSuper2(&v28, "trackRectForBounds:");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  id v12 = [v1 traitCollection];
  id v13 = [v12 layoutDirection];

  double v14 = 4.0;
  CGFloat v15 = v7;
  CGFloat v16 = v9;
  CGFloat v17 = v11;
  if (v13) {
    double v18 = CGRectGetMaxX(*(CGRect *)&v15) - v5;
  }
  else {
    double v18 = v5 - CGRectGetMinX(*(CGRect *)&v15);
  }
  v29.size.height = 4.0;
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  double v19 = fmin(v18 / CGRectGetWidth(v29), 1.0);
  if (v19 < 0.0) {
    double v20 = 0.0;
  }
  else {
    double v20 = v19;
  }
  [v1 maximumValue];
  float v22 = v21;
  [v1 minimumValue];
  float v24 = v22 - v23;
  [v1 minimumValue];
  float v26 = v20 * (float)(v24 + v25);
  sub_45B4(1, v26);
  return [v1 sendActionsForControlEvents:4096];
}

double sub_49D8(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, float a9)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v39.receiver = v17;
  v39.super_class = ObjectType;
  objc_msgSendSuper2(&v39, "thumbRectForBounds:trackRect:value:", a1, a2, a3, a4, a5, a6, a7, a8, LODWORD(a9));
  double v27 = v26;
  [v17 minimumValue];
  if (v28 == a9 || ([v17 maximumValue], v29 == a9))
  {
    v38.receiver = v17;
    v38.super_class = ObjectType;
    objc_msgSendSuper2(&v38, "trackRectForBounds:", a1, a2, a3, a4);
    [v17 minimumValue];
    if (v30 == a9) {
      double v31 = 4.0;
    }
    else {
      double v31 = -4.0;
    }
    id v32 = [v17 traitCollection];
    id v33 = (char *)[v32 layoutDirection];

    double v34 = -v31;
    if (v33 != (unsigned char *)&dword_0 + 1) {
      double v34 = v31;
    }
    return v27 + v34;
  }
  return v27;
}

void sub_4C18(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetWidth(v16);
  [v5 maximumValue];
  [v5 minimumValue];
  [v5 minimumValue];
  id v10 = [v5 traitCollection];
  CGFloat v11 = (char *)[v10 layoutDirection];

  CGFloat v12 = a2;
  CGFloat v13 = a3;
  CGFloat v14 = a4;
  CGFloat v15 = a5;
  if (v11 == (unsigned char *)&dword_0 + 1) {
    CGRectGetMaxX(*(CGRect *)&v12);
  }
  else {
    CGRectGetMinX(*(CGRect *)&v12);
  }
}

uint64_t sub_4E68()
{
  return type metadata accessor for NotchedPlatformSlider();
}

uint64_t type metadata accessor for NotchedPlatformSlider()
{
  uint64_t result = qword_14928;
  if (!qword_14928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_4EBC()
{
  sub_4FCC();
  if (v0 <= 0x3F)
  {
    sub_5150();
    if (v1 <= 0x3F)
    {
      sub_51D4();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_4FCC()
{
  if (!qword_14938)
  {
    sub_5058(&qword_14940);
    sub_50A0();
    sub_50F4();
    unint64_t v0 = sub_CE18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14938);
    }
  }
}

uint64_t sub_5058(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_50A0()
{
  unint64_t result = qword_14948;
  if (!qword_14948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14948);
  }
  return result;
}

unint64_t sub_50F4()
{
  unint64_t result = qword_14950;
  if (!qword_14950)
  {
    sub_5058(&qword_14940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14950);
  }
  return result;
}

void sub_5150()
{
  if (!qword_14958)
  {
    sub_5058(&qword_14940);
    sub_50F4();
    unint64_t v0 = sub_CE18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14958);
    }
  }
}

void sub_51D4()
{
  if (!qword_14960)
  {
    sub_5058(&qword_14968);
    sub_CE58();
    sub_5264();
    unint64_t v0 = sub_CE18();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_14960);
    }
  }
}

unint64_t sub_5264()
{
  unint64_t result = qword_14970;
  if (!qword_14970)
  {
    sub_5058(&qword_14968);
    sub_52D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14970);
  }
  return result;
}

unint64_t sub_52D8()
{
  unint64_t result = qword_14978;
  if (!qword_14978)
  {
    sub_5358(255, (unint64_t *)&qword_14980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14978);
  }
  return result;
}

uint64_t sub_5358(uint64_t a1, unint64_t *a2)
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

uint64_t sub_5394()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_53CC()
{
}

void sub_53D4()
{
}

void sub_53DC()
{
  uint64_t v1 = sub_3024(&qword_14988);
  uint64_t v17 = *(void *)(v1 - 8);
  uint64_t v18 = v1;
  __chkstk_darwin(v1, v2);
  double v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_CE38();
  __chkstk_darwin(v5, v6);
  uint64_t v7 = sub_CE58();
  __chkstk_darwin(v7, v8);
  uint64_t v9 = sub_3024(&qword_14990);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  CGFloat v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider_generator] = 0;
  CGFloat v14 = &v0[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__snappingBehavior];
  LOBYTE(v19) = 0;
  sub_CE48();
  sub_CE28();
  sub_50A0();
  sub_CDE8();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v13, v9);
  CGFloat v15 = &v0[OBJC_IVAR____TtC19VolumeLimitSettings21NotchedPlatformSlider__segmentCount];
  id v19 = 0;
  sub_CE48();
  sub_CE28();
  sub_CDE8();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v15, v4, v18);
  id v19 = [self systemGrayColor];
  sub_CE48();
  sub_3024(&qword_14968);
  sub_5264();
  sub_CDD8();

  sub_CED8();
  __break(1u);
}

void sub_5760()
{
  uint64_t v1 = v0;
  id v2 = [v0 _minTrackView];
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 setHidden:1];

    id v4 = [v0 _maxTrackView];
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 setHidden:1];

      double v6 = sub_3CBC();
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      unint64_t v13 = sub_3F18(v6, v7, v9, v11);
      unint64_t v15 = v14;
      uint64_t v16 = (__objc2_class_ro *)sub_4298(v6, v8, v10, v12);
      uint64_t v18 = v17;
      uint64_t KeyPath = v19;
      id v21 = [v1 minimumTrackTintColor];
      if (v21) {
        goto LABEL_6;
      }
      if (qword_148A0 != -1) {
        goto LABEL_37;
      }
      while (1)
      {
        id v21 = (id)qword_15310;
LABEL_6:
        objc_super v39 = v21;
        objc_msgSend(v21, "set", v35, v36);
        [(__objc2_class_ro *)v16 fill];
        id v22 = [v1 maximumTrackTintColor];
        if (!v22)
        {
          if (qword_148A0 != -1) {
            swift_once();
          }
          id v22 = (id)qword_15310;
        }
        objc_super v38 = v22;
        [v22 set];
        [v18 fill];
        id v23 = [v1 tintColor];
        if (!v23) {
          goto LABEL_40;
        }
        float v24 = v23;
        [v23 set];

        CGFloat v37 = (void *)KeyPath;
        [(id)KeyPath fill];
        id v25 = [objc_allocWithZone((Class)UIBezierPath) init];
        swift_getKeyPath();
        uint64_t KeyPath = swift_getKeyPath();
        sub_CDF8();
        swift_release();
        swift_release();
        id v26 = v40;
        if (!v40)
        {
          if (qword_14898 != -1) {
            swift_once();
          }
          id v26 = (id)qword_15308;
        }
        [v26 set];
        CGFloat v35 = v16;
        CGFloat v36 = v18;
        if (v13 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = sub_CEE8();
          swift_bridgeObjectRelease();
          uint64_t v16 = &NonMovableTapGestureRecognizer;
          if (!v27) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v27 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8));
          uint64_t v16 = &NonMovableTapGestureRecognizer;
          if (!v27) {
            goto LABEL_24;
          }
        }
        if (v27 < 1)
        {
          __break(1u);
          goto LABEL_36;
        }
        for (uint64_t KeyPath = 0; KeyPath != v27; ++KeyPath)
        {
          if ((v13 & 0xC000000000000001) != 0) {
            id v28 = (id)sub_CEB8();
          }
          else {
            id v28 = *(id *)(v13 + 8 * KeyPath + 32);
          }
          uint64_t v18 = v28;
          objc_msgSend(v25, "appendPath:", v28, v35, v36);
        }
LABEL_24:
        swift_bridgeObjectRelease();
        [v25 fill];
        unint64_t v13 = (unint64_t)[objc_allocWithZone((Class)UIBezierPath) init];
        id v29 = [v1 tintColor];
        if (!v29) {
          goto LABEL_41;
        }
        float v30 = v29;
        [v29 set];

        if (v15 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_CEE8();
          swift_bridgeObjectRelease();
          if (!v31) {
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v31 = *(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8));
          if (!v31) {
            goto LABEL_34;
          }
        }
        if (v31 >= 1)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if ((v15 & 0xC000000000000001) != 0) {
              id v33 = (id)sub_CEB8();
            }
            else {
              id v33 = *(id *)(v15 + 8 * i + 32);
            }
            double v34 = v33;
            objc_msgSend((id)v13, "appendPath:", v33, v35);
          }
LABEL_34:
          swift_bridgeObjectRelease();
          [(id)v13 fill];

          return;
        }
LABEL_36:
        __break(1u);
LABEL_37:
        swift_once();
      }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
}

id sub_5C3C()
{
  uint64_t v1 = v0;
  char v2 = *(unsigned char *)(v0 + 104);
  uint64_t v3 = *(void *)(v1 + 112);
  id v4 = objc_allocWithZone((Class)type metadata accessor for NotchedPlatformSlider());
  id v5 = sub_34D8(v2, v3);
  uint64_t v6 = *(void *)v1;
  char v7 = *(unsigned char *)(v1 + 8);
  j__swift_retain();
  uint64_t v8 = sub_71CC(v6, v7);
  j__swift_release();
  if (v8)
  {
    sub_73B4();
    id v9 = v5;
    swift_retain();
    CGFloat v10 = (void *)sub_CE68();
    [v9 setTintColor:v10];
    swift_release();
  }
  sub_73B4();
  char v11 = *(unsigned char *)(v1 + 24);
  id v12 = v5;
  uint64_t v13 = swift_retain();
  sub_73F4(v13, v11);
  swift_release();
  unint64_t v14 = (void *)sub_CE68();
  [v12 setMaximumTrackTintColor:v14];

  char v15 = *(unsigned char *)(v1 + 40);
  id v16 = v12;
  uint64_t v17 = swift_retain();
  sub_73F4(v17, v15);
  swift_release();
  uint64_t v18 = (void *)sub_CE68();
  [v16 setMinimumTrackTintColor:v18];

  char v19 = *(unsigned char *)(v1 + 56);
  uint64_t v20 = swift_retain();
  sub_73F4(v20, v19);
  swift_release();
  uint64_t v21 = sub_CE68();
  swift_getKeyPath();
  swift_getKeyPath();
  id v22 = v16;
  sub_CE08();
  sub_3024(&qword_14AA0);
  sub_CB68();
  [v22 addTarget:v21 action:"valueChanged:" forControlEvents:4096];
  swift_release();
  sub_CB68();
  [v22 addTarget:v21 action:"editingEnded:" forControlEvents:448];
  swift_release();
  return v22;
}

uint64_t sub_5EC8(void *a1)
{
  uint64_t v2 = v1;
  long long v53 = *(_OWORD *)(v1 + 64);
  uint64_t v55 = *(void *)(v1 + 80);
  sub_3024(&qword_14A98);
  sub_CCB8();
  sub_3024(&qword_14AA0);
  sub_CB78();
  uint64_t v4 = sub_C8C8();
  swift_release();
  if (v4) {
    swift_release();
  }
  float v5 = v56;
  sub_45B4(v4 != 0, v5);
  uint64_t v6 = *(void *)v2;
  char v7 = *(unsigned char *)(v2 + 8);
  j__swift_retain();
  uint64_t v8 = sub_71CC(v6, v7);
  j__swift_release();
  if (v8)
  {
    sub_73B4();
    swift_retain();
    id v9 = (void *)sub_CE68();
    id v10 = [a1 tintColor];
    if (v10)
    {
      char v11 = v10;
      id v12 = v9;
      char v13 = sub_CE78();

      if (v13)
      {
        swift_release();
        goto LABEL_9;
      }
    }
    else
    {
    }
    swift_retain();
    unint64_t v14 = (void *)sub_CE68();
    [a1 setTintColor:v14];
    swift_release();
  }
LABEL_9:
  id v15 = objc_msgSend(a1, "maximumTrackTintColor", v53, v55);
  sub_73B4();
  char v16 = *(unsigned char *)(v2 + 24);
  uint64_t v17 = swift_retain();
  sub_73F4(v17, v16);
  swift_release();
  uint64_t v18 = (void *)sub_CE68();
  char v19 = v18;
  if (!v15)
  {

    goto LABEL_13;
  }
  id v20 = v15;
  char v21 = sub_CE78();

  if ((v21 & 1) == 0)
  {
LABEL_13:
    uint64_t v22 = swift_retain();
    sub_73F4(v22, v16);
    swift_release();
    id v23 = (void *)sub_CE68();
    [a1 setMaximumTrackTintColor:v23];
  }
  id v24 = [a1 minimumTrackTintColor];
  char v25 = *(unsigned char *)(v2 + 40);
  uint64_t v26 = swift_retain();
  sub_73F4(v26, v25);
  swift_release();
  uint64_t v27 = (void *)sub_CE68();
  id v28 = v27;
  if (!v24)
  {

    goto LABEL_18;
  }
  id v29 = v24;
  char v30 = sub_CE78();

  if ((v30 & 1) == 0)
  {
LABEL_18:
    uint64_t v31 = swift_retain();
    sub_73F4(v31, v25);
    swift_release();
    id v32 = (void *)sub_CE68();
    [a1 setMinimumTrackTintColor:v32];
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  char v33 = *(unsigned char *)(v2 + 56);
  uint64_t v34 = swift_retain();
  sub_73F4(v34, v33);
  swift_release();
  CGFloat v35 = (void *)sub_CE68();
  CGFloat v36 = v35;
  if (!v54)
  {

    goto LABEL_23;
  }
  id v37 = (id)v54;
  char v38 = sub_CE78();

  if ((v38 & 1) == 0)
  {
LABEL_23:
    uint64_t v39 = swift_retain();
    sub_73F4(v39, v33);
    swift_release();
    uint64_t v40 = sub_CE68();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v54 = v40;
    id v41 = a1;
    sub_CE08();
  }
  int v42 = *(unsigned __int8 *)(v2 + 104);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  if (v42 != v54)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v54) = v42;
    id v43 = a1;
    sub_CE08();
  }
  uint64_t v44 = *(void *)(v2 + 112);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  swift_release();
  if (v44 != v54)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v54 = v44;
    id v45 = a1;
    sub_CE08();
  }
  sub_CB68();
  long long v47 = *(_OWORD *)(v2 + 80);
  long long v46 = *(_OWORD *)(v2 + 96);
  long long v48 = *(_OWORD *)(v2 + 64);
  *(void *)(v54 + 128) = *(void *)(v2 + 112);
  *(_OWORD *)(v54 + 96) = v47;
  long long v49 = *(_OWORD *)(v2 + 48);
  long long v51 = *(_OWORD *)v2;
  long long v50 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v54 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v54 + 64) = v49;
  *(_OWORD *)(v54 + 16) = v51;
  *(_OWORD *)(v54 + 32) = v50;
  *(_OWORD *)(v54 + 80) = v48;
  *(_OWORD *)(v54 + 112) = v46;
  sub_75E0(v2);
  j__swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_64C8(void *a1)
{
  return sub_5EC8(a1);
}

uint64_t sub_6524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  char v3 = *((unsigned char *)v1 + 8);
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[4];
  char v17 = *((unsigned char *)v1 + 40);
  char v18 = *((unsigned char *)v1 + 24);
  uint64_t v6 = v1[6];
  char v7 = *((unsigned char *)v1 + 56);
  uint64_t v8 = v1[8];
  uint64_t v9 = v1[9];
  uint64_t v10 = v1[10];
  uint64_t v11 = v1[12];
  uint64_t v16 = v1[11];
  char v15 = *((unsigned char *)v1 + 104);
  uint64_t v14 = v1[14];
  type metadata accessor for NotchedSliderCoordinator();
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 136) = 0;
  *(void *)(v12 + 16) = v2;
  *(unsigned char *)(v12 + 24) = v3;
  *(void *)(v12 + 32) = v4;
  *(unsigned char *)(v12 + 40) = v18;
  *(void *)(v12 + 48) = v5;
  *(unsigned char *)(v12 + 56) = v17;
  *(void *)(v12 + 64) = v6;
  *(unsigned char *)(v12 + 72) = v7;
  *(void *)(v12 + 80) = v8;
  *(void *)(v12 + 88) = v9;
  *(void *)(v12 + 96) = v10;
  *(void *)(v12 + 104) = v16;
  *(void *)(v12 + 112) = v11;
  *(unsigned char *)(v12 + 120) = v15;
  *(void *)(v12 + 128) = v14;
  *a1 = v12;
  j__swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  return swift_retain();
}

uint64_t sub_6668()
{
  return sub_CA68();
}

uint64_t sub_66AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_7B28();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_6710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_7B28();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_6774()
{
  return sub_CC28();
}

void sub_6790()
{
}

id sub_67B8(void *a1)
{
  if ((*(unsigned char *)(v1 + 136) & 1) == 0)
  {
    *(unsigned char *)(v1 + 136) = 1;
    char v3 = *(void (**)(uint64_t))(v1 + 104);
    swift_retain();
    v3(1);
    swift_release();
  }
  swift_retain();
  swift_retain();
  [a1 value];
  double v7 = v4;
  sub_3024(&qword_14A98);
  sub_CCC8();
  swift_release();
  swift_release();
  sub_CCB8();
  HIDWORD(v5) = HIDWORD(v7);
  *(float *)&double v5 = v7;
  return [a1 setValue:v5];
}

uint64_t sub_6988()
{
  j__swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 137, 7);
}

uint64_t type metadata accessor for NotchedSliderCoordinator()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for NotchedSlider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for NotchedSlider()
{
  j__swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for NotchedSlider(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  j__swift_retain();
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  char v6 = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = v6;
  char v7 = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 32) = a2[4];
  *(unsigned char *)(a1 + 40) = v7;
  char v8 = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 48) = a2[6];
  *(unsigned char *)(a1 + 56) = v8;
  uint64_t v9 = a2[9];
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = a2[11];
  uint64_t v11 = a2[12];
  *(void *)(a1 + 80) = a2[10];
  *(void *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = v11;
  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 112) = a2[14];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for NotchedSlider(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  j__swift_retain();
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  j__swift_release();
  char v6 = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = v6;
  swift_retain();
  swift_release();
  char v7 = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 32) = a2[4];
  *(unsigned char *)(a1 + 40) = v7;
  swift_retain();
  swift_release();
  char v8 = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 48) = a2[6];
  *(unsigned char *)(a1 + 56) = v8;
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = a2[8];
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = a2[10];
  uint64_t v9 = a2[12];
  *(void *)(a1 + 88) = a2[11];
  *(void *)(a1 + 96) = v9;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 112) = a2[14];
  return a1;
}

__n128 initializeWithTake for NotchedSlider(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for NotchedSlider(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  j__swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_release();
  char v6 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v6;
  swift_release();
  char v7 = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v7;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotchedSlider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotchedSlider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotchedSlider()
{
  return &type metadata for NotchedSlider;
}

void *sub_6E94()
{
  return &protocol witness table for Never;
}

unint64_t sub_6EA4()
{
  unint64_t result = qword_14A90;
  if (!qword_14A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14A90);
  }
  return result;
}

uint64_t sub_6EF8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_6F78(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_CE08();
}

uint64_t sub_6FE8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_7068(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_CE08();
}

uint64_t sub_70D8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_CDF8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_7158(void **a1, void **a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_CE08();
}

uint64_t sub_71CC(uint64_t a1, char a2)
{
  uint64_t v4 = sub_C988();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v9 = sub_CDC8();
    uint64_t v10 = sub_CB88();
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      *(void *)(v11 + 4) = sub_766C(0x6C616E6F6974704FLL, 0xEF3E726F6C6F433CLL, &v14);
      _os_log_impl(&dword_0, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_C978();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return v14;
  }
  return a1;
}

unint64_t sub_73B4()
{
  unint64_t result = qword_14980;
  if (!qword_14980)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_14980);
  }
  return result;
}

uint64_t sub_73F4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_C988();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v9 = sub_CDC8();
    uint64_t v10 = sub_CB88();
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      *(void *)(v11 + 4) = sub_766C(0x726F6C6F43, 0xE500000000000000, &v14);
      _os_log_impl(&dword_0, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_C978();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_75E0(uint64_t a1)
{
  return a1;
}

unint64_t sub_766C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_7740(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7840((uint64_t)v12, *a3);
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
      sub_7840((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_310C((uint64_t)v12);
  return v7;
}

unint64_t sub_7740(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_789C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_CEC8();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_7840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_789C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (char *)sub_7934(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_7A38(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_7A38((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_7934(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_79D0(v2, 0);
      unint64_t result = (void *)sub_CEA8();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_CD58();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_79D0(uint64_t a1, uint64_t a2)
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
  sub_3024(&qword_14AA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_7A38(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_3024(&qword_14AA8);
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
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_7B28()
{
  unint64_t result = qword_14AB0;
  if (!qword_14AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14AB0);
  }
  return result;
}

uint64_t sub_7B7C(uint64_t a1)
{
  return sub_7C48(a1, &qword_148A0, (id *)&qword_15310, &qword_152F0);
}

uint64_t sub_7BA8@<X0>(void *a1@<X8>)
{
  return sub_7CBC(&qword_14880, &qword_152F0, a1);
}

uint64_t sub_7BCC(uint64_t a1)
{
  return sub_7C48(a1, &qword_148A0, (id *)&qword_15310, &qword_152F8);
}

uint64_t sub_7BF8@<X0>(void *a1@<X8>)
{
  return sub_7CBC(&qword_14888, &qword_152F8, a1);
}

uint64_t sub_7C1C(uint64_t a1)
{
  return sub_7C48(a1, &qword_14898, (id *)&qword_15308, &qword_15300);
}

uint64_t sub_7C48(uint64_t a1, void *a2, id *a3, uint64_t *a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  id v6 = *a3;
  uint64_t result = sub_CC58();
  *a4 = result;
  return result;
}

uint64_t sub_7C98@<X0>(void *a1@<X8>)
{
  return sub_7CBC(&qword_14890, &qword_15300, a1);
}

uint64_t sub_7CBC@<X0>(void *a1@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  *a3 = *a2;

  return swift_retain();
}

uint64_t sub_7D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_7F4C();

  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

uint64_t sub_7D78()
{
  return sub_7E80((void (*)(void))sub_7E0C);
}

uint64_t sub_7D98()
{
  return sub_7E80((void (*)(void))sub_7DB8);
}

unint64_t sub_7DB8()
{
  unint64_t result = qword_14AB8;
  if (!qword_14AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14AB8);
  }
  return result;
}

unint64_t sub_7E0C()
{
  unint64_t result = qword_14AC0;
  if (!qword_14AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14AC0);
  }
  return result;
}

uint64_t sub_7E60()
{
  return sub_7E80((void (*)(void))sub_7EC8);
}

uint64_t sub_7E80(void (*a1)(void))
{
  a1();
  sub_C998();
  return v2;
}

unint64_t sub_7EC8()
{
  unint64_t result = qword_14AC8;
  if (!qword_14AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14AC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for NotchedSliderUnfilledTickColorKey()
{
  return &type metadata for NotchedSliderUnfilledTickColorKey;
}

ValueMetadata *type metadata accessor for NotchedSliderMaximumTrackTintColorKey()
{
  return &type metadata for NotchedSliderMaximumTrackTintColorKey;
}

ValueMetadata *type metadata accessor for NotchedSliderMinimumTrackTintColorKey()
{
  return &type metadata for NotchedSliderMinimumTrackTintColorKey;
}

unint64_t sub_7F4C()
{
  unint64_t result = qword_14AD0;
  if (!qword_14AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14AD0);
  }
  return result;
}

id sub_7FA4(uint64_t a1)
{
  return sub_7FCC(a1, (SEL *)&selRef_systemGray4Color, &qword_15308);
}

id sub_7FB8(uint64_t a1)
{
  return sub_7FCC(a1, (SEL *)&selRef_systemFillColor, &qword_15310);
}

id sub_7FCC(uint64_t a1, SEL *a2, void *a3)
{
  id result = [self *a2];
  *a3 = result;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for NotchedSliderSnappingBehavior(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotchedSliderSnappingBehavior(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NotchedSliderSnappingBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x817CLL);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_81A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_81B0(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NotchedSliderSnappingBehavior()
{
  return &type metadata for NotchedSliderSnappingBehavior;
}

BOOL sub_81D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_81E8()
{
  Swift::UInt v1 = *v0;
  sub_CF08();
  sub_CF18(v1);
  return sub_CF28();
}

void sub_8230()
{
  sub_CF18(*v0);
}

Swift::Int sub_825C()
{
  Swift::UInt v1 = *v0;
  sub_CF08();
  sub_CF18(v1);
  return sub_CF28();
}

__n128 initializeBufferWithCopyOfBuffer for NotchedSliderStyle(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotchedSliderStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for NotchedSliderStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotchedSliderStyle()
{
  return &type metadata for NotchedSliderStyle;
}

uint64_t sub_8340()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_835C@<X0>(char a1@<W1>, uint64_t a2@<X2>, unsigned char *a3@<X8>)
{
  uint64_t v73 = a2;
  long long v53 = a3;
  int v54 = a1 & 1;
  uint64_t v72 = sub_CB18();
  uint64_t v49 = *(void *)(v72 - 8);
  uint64_t v3 = v49;
  uint64_t v5 = __chkstk_darwin(v72, v4);
  CGRect v61 = &v45[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5, v7);
  int64_t v9 = &v45[-v8];
  uint64_t v10 = sub_CB28();
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v11 = v51;
  uint64_t v13 = __chkstk_darwin(v10, v12);
  char v15 = &v45[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13, v16);
  char v18 = &v45[-v17];
  long long v50 = &v45[-v17];
  sub_CB48();
  *(void *)&long long v71 = sub_CB58();
  *((void *)&v71 + 1) = v19;
  uint64_t v21 = v20;
  uint64_t v22 = sub_CB08();
  uint64_t v69 = v23;
  uint64_t v70 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v65 = swift_getKeyPath();
  uint64_t v64 = swift_getKeyPath();
  uint64_t v63 = swift_getKeyPath();
  sub_CD08();
  sub_C8E8();
  uint64_t v62 = v81;
  uint64_t v67 = v83;
  uint64_t v68 = v85;
  uint64_t v55 = v86;
  unsigned __int8 v99 = 0;
  unsigned __int8 v97 = 0;
  unsigned __int8 v95 = 0;
  unsigned __int8 v93 = 0;
  unsigned __int8 v90 = v82;
  unsigned __int8 v88 = v84;
  long long v47 = v9;
  sub_CB38();
  id v24 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
  CGFloat v52 = v15;
  uint64_t v48 = v10;
  v24(v15, v18, v10);
  v80[0] = *(_DWORD *)v98;
  *(_DWORD *)((char *)v80 + 3) = *(_DWORD *)&v98[3];
  int v57 = v99;
  int v58 = v97;
  v79[0] = *(_DWORD *)v96;
  *(_DWORD *)((char *)v79 + 3) = *(_DWORD *)&v96[3];
  LOBYTE(v18) = v95;
  int v46 = v95;
  *(_DWORD *)((char *)v78 + 3) = *(_DWORD *)&v94[3];
  v78[0] = *(_DWORD *)v94;
  int v56 = v93;
  *(_DWORD *)((char *)v77 + 3) = *(_DWORD *)&v92[3];
  v77[0] = *(_DWORD *)v92;
  *(_DWORD *)((char *)v76 + 3) = *(_DWORD *)&v91[3];
  v76[0] = *(_DWORD *)v91;
  *(_DWORD *)((char *)v75 + 3) = *(_DWORD *)&v89[3];
  v75[0] = *(_DWORD *)v89;
  int v59 = v90;
  int v60 = v88;
  *(_DWORD *)((char *)v74 + 3) = *(_DWORD *)&v87[3];
  v74[0] = *(_DWORD *)v87;
  char v25 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v3 + 16);
  v25((uint64_t)v61, v9, v72);
  uint64_t v26 = v25;
  uint64_t v27 = v53;
  v24(v53, v15, v10);
  uint64_t v28 = sub_3024(&qword_14AE0);
  id v29 = &v27[*(int *)(v28 + 48)];
  *(void *)&long long v100 = KeyPath;
  BYTE8(v100) = v57;
  *(_DWORD *)((char *)&v100 + 9) = v80[0];
  HIDWORD(v100) = *(_DWORD *)((char *)v80 + 3);
  *(void *)&long long v101 = v65;
  BYTE8(v101) = v58;
  *(_DWORD *)((char *)&v101 + 9) = v79[0];
  HIDWORD(v101) = *(_DWORD *)((char *)v79 + 3);
  *(void *)&long long v102 = v64;
  BYTE8(v102) = (_BYTE)v18;
  *(_DWORD *)((char *)&v102 + 9) = v78[0];
  HIDWORD(v102) = *(_DWORD *)((char *)v78 + 3);
  *(void *)&long long v103 = v63;
  BYTE8(v103) = v56;
  HIDWORD(v103) = *(_DWORD *)((char *)v77 + 3);
  *(_DWORD *)((char *)&v103 + 9) = v77[0];
  long long v104 = v71;
  *(void *)&long long v105 = v21;
  *((void *)&v105 + 1) = v70;
  *(void *)&long long v106 = v69;
  LOBYTE(v15) = v54;
  BYTE8(v106) = v54;
  HIDWORD(v106) = *(_DWORD *)((char *)v76 + 3);
  *(_DWORD *)((char *)&v106 + 9) = v76[0];
  *(void *)&long long v107 = v73;
  *((void *)&v107 + 1) = v62;
  LOBYTE(v108) = v59;
  DWORD1(v108) = *(_DWORD *)((char *)v75 + 3);
  *(_DWORD *)((char *)&v108 + 1) = v75[0];
  *((void *)&v108 + 1) = v67;
  LOBYTE(v109) = v60;
  DWORD1(v109) = *(_DWORD *)((char *)v74 + 3);
  *(_DWORD *)((char *)&v109 + 1) = v74[0];
  *((void *)&v109 + 1) = v68;
  uint64_t v110 = v55;
  long long v30 = v107;
  long long v31 = v108;
  long long v32 = v109;
  *((void *)v29 + 20) = v55;
  *((_OWORD *)v29 + 8) = v31;
  *((_OWORD *)v29 + 9) = v32;
  long long v33 = v101;
  long long v34 = v102;
  *(_OWORD *)id v29 = v100;
  *((_OWORD *)v29 + 1) = v33;
  long long v35 = v103;
  long long v36 = v104;
  *((_OWORD *)v29 + 6) = v106;
  *((_OWORD *)v29 + 7) = v30;
  long long v37 = v105;
  *((_OWORD *)v29 + 4) = v36;
  *((_OWORD *)v29 + 5) = v37;
  *((_OWORD *)v29 + 2) = v34;
  *((_OWORD *)v29 + 3) = v35;
  char v38 = &v27[*(int *)(v28 + 64)];
  uint64_t v39 = v61;
  uint64_t v40 = v72;
  v26((uint64_t)v38, v61, v72);
  sub_75E0((uint64_t)&v100);
  id v41 = *(void (**)(unsigned char *, uint64_t))(v49 + 8);
  v41(v47, v40);
  int v42 = *(void (**)(unsigned char *, uint64_t))(v51 + 8);
  uint64_t v43 = v48;
  v42(v50, v48);
  v41(v39, v40);
  uint64_t v111 = KeyPath;
  char v112 = v57;
  *(_DWORD *)v113 = v80[0];
  *(_DWORD *)&v113[3] = *(_DWORD *)((char *)v80 + 3);
  uint64_t v114 = v65;
  char v115 = v58;
  *(_DWORD *)v116 = v79[0];
  *(_DWORD *)&v116[3] = *(_DWORD *)((char *)v79 + 3);
  uint64_t v117 = v64;
  char v118 = v46;
  *(_DWORD *)v119 = v78[0];
  *(_DWORD *)&v119[3] = *(_DWORD *)((char *)v78 + 3);
  uint64_t v120 = v63;
  char v121 = v56;
  *(_DWORD *)&v122[3] = *(_DWORD *)((char *)v77 + 3);
  *(_DWORD *)v122 = v77[0];
  long long v123 = v71;
  uint64_t v124 = v21;
  uint64_t v125 = v70;
  uint64_t v126 = v69;
  char v127 = (char)v15;
  *(_DWORD *)&v128[3] = *(_DWORD *)((char *)v76 + 3);
  *(_DWORD *)v128 = v76[0];
  uint64_t v129 = v73;
  uint64_t v130 = v62;
  char v131 = v59;
  *(_DWORD *)&v132[3] = *(_DWORD *)((char *)v75 + 3);
  *(_DWORD *)v132 = v75[0];
  uint64_t v133 = v67;
  char v134 = v60;
  *(_DWORD *)v135 = v74[0];
  *(_DWORD *)&v135[3] = *(_DWORD *)((char *)v74 + 3);
  uint64_t v136 = v68;
  uint64_t v137 = v55;
  sub_8ADC((uint64_t)&v111);
  return ((uint64_t (*)(unsigned char *, uint64_t))v42)(v52, v43);
}

uint64_t sub_8A08@<X0>(uint64_t a1@<X8>)
{
  char v3 = *(unsigned char *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  *(void *)a1 = sub_C9B8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v5 = sub_3024(&qword_14AD8);
  return sub_835C(v3, v4, (unsigned char *)(a1 + *(int *)(v5 + 44)));
}

uint64_t sub_8A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_C918();
  *a1 = result;
  return result;
}

uint64_t sub_8A98()
{
  return sub_C928();
}

uint64_t sub_8ADC(uint64_t a1)
{
  return a1;
}

unint64_t sub_8B6C()
{
  unint64_t result = qword_14AE8;
  if (!qword_14AE8)
  {
    sub_5058(&qword_14AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14AE8);
  }
  return result;
}

uint64_t sub_8BC8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FindVolumeLimitSettingsClass()
{
  return self;
}

id sub_8BFC()
{
  type metadata accessor for FindVolumeLimitSettingsClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_15318 = (uint64_t)result;
  return result;
}

void sub_8C54()
{
  uint64_t v1 = v0;
  v17.receiver = v0;
  v17.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v17, "viewDidLoad");
  [objc_allocWithZone((Class)type metadata accessor for VolumeLimitSettingsState()) init];
  sub_CC68();
  id v2 = objc_allocWithZone((Class)sub_3024(&qword_14BB8));
  char v3 = (void *)sub_CA38();
  if (qword_148A8 != -1) {
    swift_once();
  }
  v4.super.isa = (Class)qword_15318;
  v16._countAndFlagsBits = 0x800000000000E710;
  v18._countAndFlagsBits = 0x4C20656D756C6F56;
  v18._object = (void *)0xEC00000074696D69;
  v19.value._countAndFlagsBits = 0;
  v19.value._object = 0;
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  sub_C7E8(v18, v19, v4, v20, v16);
  NSString v5 = sub_CD38();
  swift_bridgeObjectRelease();
  [v1 setTitle:v5];

  id v6 = [v3 view];
  if (!v6)
  {
    uint64_t v7 = v3;
    goto LABEL_8;
  }
  uint64_t v7 = v6;
  id v8 = [v1 view];
  if (v8)
  {
    int64_t v9 = v8;
    [v8 addSubview:v7];

    id v10 = [v1 view];
    if (v10)
    {
      uint64_t v11 = v10;
      [v10 bounds];
      double v13 = v12;
      double v15 = v14;

      objc_msgSend(v7, "setFrame:", 0.0, 0.0, v13, v15);
      [v7 setAutoresizingMask:18];
      [v1 addChildViewController:v3];
      [v3 didMoveToParentViewController:v1];

LABEL_8:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t type metadata accessor for VolumeLimitSettingsRoot()
{
  return self;
}

uint64_t destroy for VolumeLimitSettingsSection(id *a1)
{
  return swift_release();
}

uint64_t _s19VolumeLimitSettings26VolumeLimitSettingsSectionVwCP_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VolumeLimitSettingsSection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for VolumeLimitSettingsSection(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for VolumeLimitSettingsSection(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for VolumeLimitSettingsSection(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 20)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VolumeLimitSettingsSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 20) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 20) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VolumeLimitSettingsSection()
{
  return &type metadata for VolumeLimitSettingsSection;
}

uint64_t sub_91F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_9210@<X0>(void *a1@<X8>)
{
  return sub_92B0((void (*)(void))sub_7E0C, a1);
}

uint64_t sub_9230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_932C(a1, a2, a3, a4, (void (*)(void))sub_7E0C);
}

uint64_t sub_9250@<X0>(void *a1@<X8>)
{
  return sub_92B0((void (*)(void))sub_7DB8, a1);
}

uint64_t sub_9270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_932C(a1, a2, a3, a4, (void (*)(void))sub_7DB8);
}

uint64_t sub_9290@<X0>(void *a1@<X8>)
{
  return sub_92B0((void (*)(void))sub_7EC8, a1);
}

uint64_t sub_92B0@<X0>(void (*a1)(void)@<X3>, void *a2@<X8>)
{
  a1();
  uint64_t result = sub_C998();
  *a2 = v4;
  return result;
}

uint64_t sub_930C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_932C(a1, a2, a3, a4, (void (*)(void))sub_7EC8);
}

uint64_t sub_932C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_C9A8();
}

uint64_t sub_9390@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, float a4@<S0>)
{
  uint64_t v25 = a3;
  uint64_t v7 = sub_3024(&qword_14BE0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  float v28 = a4;
  sub_CA08();
  if (qword_148A8 != -1) {
    swift_once();
  }
  id v12 = (id)qword_15318;
  uint64_t v30 = sub_CBD8();
  uint64_t v31 = v13;
  char v32 = v14 & 1;
  uint64_t v33 = v15;
  sub_3024(&qword_14BF0);
  sub_AF64(&qword_14BE8, &qword_14BF0);
  sub_CCF8();
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  sub_3024(&qword_14C10);
  sub_CC78();
  Swift::String v16 = v29;
  swift_getKeyPath();
  uint64_t v30 = (uint64_t)v16;
  sub_AE18();
  sub_C878();
  swift_release();
  objc_super v17 = &v16[OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState__isSpeakerVolumeLimitModificationAllowed];
  swift_beginAccess();
  char v18 = *v17;

  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = (v18 & 1) == 0;
  uint64_t v21 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v25, v11, v7);
  uint64_t v22 = (uint64_t *)(v21 + *(int *)(sub_3024(&qword_14BC8) + 36));
  *uint64_t v22 = KeyPath;
  v22[1] = (uint64_t)sub_AED8;
  v22[2] = v20;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_96BC@<X0>(void *a1@<X0>, void *a2@<X1>, char *a3@<X8>, float a4@<S0>)
{
  uint64_t v40 = a2;
  uint64_t v41 = (uint64_t)a1;
  uint64_t v43 = a3;
  uint64_t v7 = sub_3024(&qword_14C20);
  uint64_t v9 = __chkstk_darwin(v7 - 8, v8);
  uint64_t v44 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = sub_3024(&qword_14C28);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = __chkstk_darwin(v14, v16);
  int v42 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v40 - v20;
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  sub_3024(&qword_14C10);
  sub_CC88();
  uint64_t v22 = v51;
  uint64_t v23 = v52;
  uint64_t v24 = v53;
  swift_getKeyPath();
  uint64_t v51 = v22;
  CGFloat v52 = v23;
  long long v53 = v24;
  sub_3024(&qword_14C30);
  sub_CCD8();

  swift_release();
  swift_release();
  swift_release();
  id v45 = v48;
  int v46 = v49;
  char v47 = v50;
  sub_CD18();
  sub_3024(&qword_14C38);
  sub_CCE8();
  swift_release();
  swift_release();
  swift_release();
  sub_3024(&qword_14C40);
  uint64_t v48 = &type metadata for Text;
  uint64_t v49 = &protocol witness table for Text;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v40;
  uint64_t v26 = v41;
  sub_CCA8();
  uint64_t v51 = v26;
  CGFloat v52 = v25;
  sub_CC78();
  uint64_t v27 = v48;
  swift_getKeyPath();
  uint64_t v51 = (uint64_t)v27;
  sub_AE18();
  sub_C878();
  swift_release();
  sub_C500();
  float v29 = v28;

  if (v29 >= 1.0)
  {
    uint64_t v32 = sub_3024(&qword_14C48);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v13, 1, 1, v32);
  }
  else
  {
    *(void *)uint64_t v13 = sub_CA28();
    *((void *)v13 + 1) = 0;
    v13[16] = 1;
    uint64_t v30 = sub_3024(&qword_14C58);
    sub_9C88(v26, v25, (uint64_t *)&v13[*(int *)(v30 + 44)], a4);
    uint64_t v31 = sub_3024(&qword_14C48);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v13, 0, 1, v31);
  }
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  long long v34 = v42;
  v33(v42, v21, v14);
  uint64_t v35 = v44;
  sub_B214((uint64_t)v13, v44, &qword_14C20);
  long long v36 = v43;
  v33(v43, v34, v14);
  uint64_t v37 = sub_3024(&qword_14C50);
  sub_B214(v35, (uint64_t)&v36[*(int *)(v37 + 48)], &qword_14C20);
  sub_B288((uint64_t)v13, &qword_14C20);
  char v38 = *(void (**)(char *, uint64_t))(v15 + 8);
  v38(v21, v14);
  sub_B288(v35, &qword_14C20);
  return ((uint64_t (*)(char *, uint64_t))v38)(v34, v14);
}

uint64_t sub_9B54()
{
  sub_CA08();
  if (qword_148A8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_15318;
  uint64_t v1 = sub_CBD8();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_C8D8();
  sub_CC38();
  sub_AF54(v1, v3, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_9C88@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>, float a4@<S0>)
{
  v139 = a3;
  uint64_t v126 = sub_3024(&qword_14C60);
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126, v7);
  uint64_t v124 = (char *)v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_3024(&qword_14C68);
  uint64_t v130 = *(void *)(v131 - 8);
  __chkstk_darwin(v131, v9);
  v128 = (char *)v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_3024(&qword_14C70);
  __chkstk_darwin(v127, v11);
  v132 = (char *)v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_3024(&qword_14C78);
  __chkstk_darwin(v129, v13);
  uint64_t v134 = (uint64_t)v117 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_3024(&qword_14C80);
  __chkstk_darwin(v133, v15);
  uint64_t v136 = (uint64_t)v117 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_3024(&qword_14C88);
  uint64_t v18 = __chkstk_darwin(v135, v17);
  uint64_t v138 = (uint64_t)v117 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v20);
  uint64_t v137 = (uint64_t)v117 - v21;
  uint64_t v123 = sub_C838();
  uint64_t v122 = *(void *)(v123 - 8);
  __chkstk_darwin(v123, v22);
  uint64_t v24 = (char *)v117 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_C858();
  __chkstk_darwin(v25 - 8, v26);
  uint64_t v27 = sub_3024(&qword_14C90);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v30 = __chkstk_darwin(v27, v29);
  uint64_t v32 = (char *)v117 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30, v33);
  uint64_t v35 = (char *)v117 - v34;
  uint64_t v36 = sub_C9F8();
  __chkstk_darwin(v36 - 8, v37);
  sub_C9E8();
  v155._uint64_t countAndFlagsBits = 0x206D756D6978614DLL;
  v155._object = (void *)0xEF203A74696D694CLL;
  sub_C9D8(v155);
  uint64_t v118 = a1;
  v144._uint64_t countAndFlagsBits = a1;
  v144._object = a2;
  v119 = a2;
  v117[1] = sub_3024(&qword_14C10);
  sub_CC78();
  char v38 = v140;
  swift_getKeyPath();
  v144._uint64_t countAndFlagsBits = (uint64_t)v38;
  sub_AE18();
  sub_C878();
  swift_release();
  sub_C500();
  int v40 = v39;

  LODWORD(v140) = v40;
  sub_C848();
  unint64_t v41 = sub_AF00();
  sub_C808();
  sub_C828();
  sub_C818();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v24, v123);
  int v42 = *(void (**)(char *, uint64_t))(v28 + 8);
  v42(v32, v27);
  sub_AF64(&qword_14CA0, &qword_14C90);
  v117[2] = v41;
  sub_CD28();
  v42(v35, v27);
  sub_C9C8(v144);
  swift_bridgeObjectRelease();
  v156._uint64_t countAndFlagsBits = 0;
  v156._object = (void *)0xE000000000000000;
  sub_C9D8(v156);
  sub_CA18();
  if (qword_148A8 != -1) {
    swift_once();
  }
  id v43 = (id)qword_15318;
  uint64_t v123 = sub_CBD8();
  uint64_t v121 = v44;
  uint64_t v122 = v45;
  int v120 = v46 & 1;
  v140 = (void *)v118;
  v141 = v119;
  sub_CC88();
  uint64_t countAndFlagsBits = v144._countAndFlagsBits;
  object = v144._object;
  uint64_t v49 = v145;
  swift_getKeyPath();
  v144._uint64_t countAndFlagsBits = countAndFlagsBits;
  v144._object = object;
  v145 = v49;
  sub_3024(&qword_14C30);
  sub_CCD8();

  swift_release();
  swift_release();
  swift_release();
  v119 = v152;
  v149 = v152;
  uint64_t v150 = v153;
  int v151 = v154;
  uint64_t v148 = 0x3F6666663E4CCCCDLL;
  float v147 = a4;
  swift_retain();
  swift_retain();
  sub_CA08();
  id v50 = (id)qword_15318;
  uint64_t v51 = sub_CBD8();
  uint64_t v53 = v52;
  char v55 = v54 & 1;
  sub_CB98();
  uint64_t v56 = sub_CBC8();
  uint64_t v58 = v57;
  char v60 = v59;
  swift_release();
  sub_AF54(v51, v53, v55);
  swift_bridgeObjectRelease();
  LODWORD(v144._countAndFlagsBits) = sub_CAF8();
  uint64_t v61 = sub_CBB8();
  uint64_t v63 = v62;
  char v65 = v64;
  uint64_t v67 = v66;
  sub_AF54(v56, v58, v60 & 1);
  swift_bridgeObjectRelease();
  v144._uint64_t countAndFlagsBits = v61;
  v144._object = v63;
  LOBYTE(v145) = v65 & 1;
  uint64_t v146 = v67;
  sub_CA08();
  id v68 = (id)qword_15318;
  uint64_t v69 = sub_CBD8();
  uint64_t v71 = v70;
  LOBYTE(v56) = v72 & 1;
  sub_CB98();
  uint64_t v73 = sub_CBC8();
  uint64_t v75 = v74;
  char v77 = v76;
  swift_release();
  sub_AF54(v69, v71, v56);
  swift_bridgeObjectRelease();
  LODWORD(v140) = sub_CAF8();
  uint64_t v78 = sub_CBB8();
  v80 = v79;
  LOBYTE(v67) = v81;
  uint64_t v83 = v82;
  sub_AF54(v73, v75, v77 & 1);
  swift_bridgeObjectRelease();
  v140 = (void *)v78;
  v141 = v80;
  char v142 = v67 & 1;
  uint64_t v143 = v83;
  unsigned __int8 v84 = v124;
  sub_CC98();
  swift_release();
  swift_release();
  LOBYTE(v144._countAndFlagsBits) = 0;
  v144._object = &dword_4 + 3;
  sub_AF64(&qword_14CA8, &qword_14C60);
  sub_AFA8();
  uint64_t v85 = v128;
  uint64_t v86 = v126;
  sub_CC18();
  (*(void (**)(char *, uint64_t))(v125 + 8))(v84, v86);
  v87 = self;
  id v88 = [v87 systemGrayColor];
  uint64_t v89 = sub_CC48();
  uint64_t KeyPath = swift_getKeyPath();
  v144._uint64_t countAndFlagsBits = v89;
  swift_retain();
  uint64_t v91 = sub_C8F8();
  uint64_t v92 = v130;
  uint64_t v93 = (uint64_t)v132;
  uint64_t v94 = v131;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v132, v85, v131);
  swift_release();
  unsigned __int8 v95 = (uint64_t *)(v93 + *(int *)(v127 + 36));
  *unsigned __int8 v95 = KeyPath;
  v95[1] = v91;
  (*(void (**)(char *, uint64_t))(v92 + 8))(v85, v94);
  id v96 = [v87 systemGrayColor];
  uint64_t v97 = sub_CC48();
  uint64_t v98 = swift_getKeyPath();
  uint64_t v99 = v134;
  sub_B214(v93, v134, &qword_14C70);
  long long v100 = (uint64_t *)(v99 + *(int *)(v129 + 36));
  *long long v100 = v98;
  v100[1] = v97;
  sub_B288(v93, &qword_14C70);
  id v101 = [v87 systemGrayColor];
  uint64_t v102 = sub_CC48();
  uint64_t v103 = swift_getKeyPath();
  uint64_t v104 = v136;
  sub_B214(v99, v136, &qword_14C78);
  long long v105 = (uint64_t *)(v104 + *(int *)(v133 + 36));
  *long long v105 = v103;
  v105[1] = v102;
  sub_B288(v99, &qword_14C78);
  id v106 = [v87 systemGrayColor];
  uint64_t v107 = sub_CC48();
  uint64_t v108 = swift_getKeyPath();
  uint64_t v109 = v138;
  sub_B214(v104, v138, &qword_14C80);
  uint64_t v110 = (uint64_t *)(v109 + *(int *)(v135 + 36));
  *uint64_t v110 = v108;
  v110[1] = v107;
  sub_B288(v104, &qword_14C80);
  uint64_t v111 = v137;
  sub_B1AC(v109, v137);
  sub_B214(v111, v109, &qword_14C88);
  char v112 = v139;
  uint64_t v113 = v123;
  uint64_t v114 = v121;
  uint64_t *v139 = v123;
  v112[1] = v114;
  LOBYTE(v92) = v120;
  *((unsigned char *)v112 + 16) = v120;
  v112[3] = v122;
  uint64_t v115 = sub_3024(&qword_14CB8);
  sub_B214(v109, (uint64_t)v112 + *(int *)(v115 + 48), &qword_14C88);
  sub_B278(v113, v114, v92);
  swift_bridgeObjectRetain();
  sub_B288(v111, &qword_14C88);
  sub_B288(v109, &qword_14C88);
  sub_AF54(v113, v114, v92);
  return swift_bridgeObjectRelease();
}

uint64_t sub_AAE8@<X0>(uint64_t a1@<X8>)
{
  sub_CA08();
  uint64_t result = sub_CBD8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_AB58()
{
  uint64_t v1 = sub_3024(&qword_14BC0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = v0[1];
  int v7 = *((_DWORD *)v0 + 4);
  uint64_t v10 = *v0;
  uint64_t v11 = v6;
  int v12 = v7;
  sub_3024(&qword_14BC8);
  sub_ACB8();
  sub_CBA8();
  sub_AF64(&qword_14C08, &qword_14BC0);
  sub_CBE8();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_ACAC@<X0>(uint64_t a1@<X8>)
{
  return sub_9390(*(void *)(v1 + 16), *(void *)(v1 + 24), a1, *(float *)(v1 + 32));
}

unint64_t sub_ACB8()
{
  unint64_t result = qword_14BD0;
  if (!qword_14BD0)
  {
    sub_5058(&qword_14BC8);
    sub_AD58();
    sub_AF64(&qword_14BF8, &qword_14C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14BD0);
  }
  return result;
}

unint64_t sub_AD58()
{
  unint64_t result = qword_14BD8;
  if (!qword_14BD8)
  {
    sub_5058(&qword_14BE0);
    sub_AF64(&qword_14BE8, &qword_14BF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14BD8);
  }
  return result;
}

uint64_t sub_AE04@<X0>(char *a1@<X8>)
{
  return sub_96BC(*(void **)(v1 + 16), *(void **)(v1 + 24), a1, *(float *)(v1 + 32));
}

unint64_t sub_AE18()
{
  unint64_t result = qword_14C18;
  if (!qword_14C18)
  {
    type metadata accessor for VolumeLimitSettingsState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14C18);
  }
  return result;
}

uint64_t sub_AE70@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_C958();
  *a1 = result & 1;
  return result;
}

uint64_t sub_AEA0()
{
  return sub_C968();
}

uint64_t sub_AEC8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_AED8(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_AF00()
{
  unint64_t result = qword_14C98;
  if (!qword_14C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14C98);
  }
  return result;
}

uint64_t sub_AF54(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_AF64(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_5058(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_AFA8()
{
  unint64_t result = qword_14CB0;
  if (!qword_14CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_14CB0);
  }
  return result;
}

uint64_t sub_AFFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_C938();
  *a1 = result;
  return result;
}

uint64_t sub_B028()
{
  return sub_C948();
}

uint64_t sub_B054@<X0>(void *a1@<X8>)
{
  return sub_B11C((void (*)(void))sub_7EC8, a1);
}

uint64_t sub_B074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_932C(a1, a2, a3, a4, (void (*)(void))sub_7EC8);
}

uint64_t sub_B0A8@<X0>(void *a1@<X8>)
{
  return sub_B11C((void (*)(void))sub_7E0C, a1);
}

uint64_t sub_B0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_932C(a1, a2, a3, a4, (void (*)(void))sub_7E0C);
}

uint64_t sub_B0FC@<X0>(void *a1@<X8>)
{
  return sub_B11C((void (*)(void))sub_7DB8, a1);
}

uint64_t sub_B11C@<X0>(void (*a1)(void)@<X3>, void *a2@<X8>)
{
  a1();
  uint64_t result = sub_C998();
  *a2 = v4;
  return result;
}

uint64_t sub_B178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_932C(a1, a2, a3, a4, (void (*)(void))sub_7DB8);
}

uint64_t sub_B1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3024(&qword_14C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_B214(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3024(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_B278(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_B288(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3024(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_B2E4()
{
  return swift_getOpaqueTypeConformance2();
}

id VolumeLimitSettingsState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

BOOL VolumeLimitSettingsState.isVolumeLimitEnabled.getter()
{
  swift_getKeyPath();
  sub_AE18();
  sub_C878();
  swift_release();
  sub_C500();
  return v0 < 1.0;
}

id sub_B414@<X0>(BOOL *a1@<X8>)
{
  swift_getKeyPath();
  sub_AE18();
  sub_C878();
  swift_release();
  id result = sub_C500();
  *a1 = v3 < 1.0;
  return result;
}

uint64_t sub_B49C()
{
  return swift_release();
}

uint64_t type metadata accessor for VolumeLimitSettingsState()
{
  uint64_t result = qword_14D00;
  if (!qword_14D00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t VolumeLimitSettingsState.isVolumeLimitEnabled.setter()
{
  return swift_release();
}

id VolumeLimitSettingsState.volumeLimit.getter()
{
  return sub_C500();
}

id sub_B6AC@<X0>(_DWORD *a1@<X8>)
{
  swift_getKeyPath();
  sub_AE18();
  sub_C878();
  swift_release();
  id result = sub_C500();
  *a1 = v3;
  return result;
}

uint64_t sub_B724()
{
  return swift_release();
}

uint64_t VolumeLimitSettingsState.volumeLimit.setter()
{
  return swift_release();
}

uint64_t VolumeLimitSettingsState.isSpeakerVolumeLimitModificationAllowed.getter()
{
  swift_getKeyPath();
  sub_AE18();
  sub_C878();
  swift_release();
  id v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState__isSpeakerVolumeLimitModificationAllowed);
  swift_beginAccess();
  return *v1;
}

id sub_B914@<X0>(unsigned char *a1@<X8>)
{
  id v2 = [self sharedAVSystemController];
  if (!v2) {
    __break(1u);
  }
  int v3 = v2;
  Class isa = sub_CDB8().super.super.isa;
  id v8 = 0;
  unsigned int v5 = [v3 setAttribute:isa forKey:AVSystemController_MaximumSpeakerVolumeLimitAttribute error:&v8];

  if (v5)
  {
    id result = v8;
  }
  else
  {
    id v7 = v8;
    sub_C7F8();

    swift_willThrow();
    id result = (id)swift_errorRelease();
  }
  *a1 = v5 ^ 1;
  return result;
}

void (*VolumeLimitSettingsState.volumeLimit.modify(void *a1))(void **a1)
{
  int v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState___observationRegistrar;
  *int v3 = v1;
  v3[3] = sub_AE18();
  sub_C878();
  swift_release();
  sub_C500();
  *((_DWORD *)v3 + 8) = v4;
  return sub_BAEC;
}

void sub_BAEC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  void *v1 = v1[1];
  sub_3024(&qword_14CC8);
  sub_C868();
  swift_release();
  free(v1);
}

id sub_BBD4@<X0>(char a1@<W0>, char *a2@<X8>)
{
  id result = [self sharedAVSystemController];
  unsigned int v5 = result;
  if (a1)
  {
    if (result) {
      goto LABEL_5;
    }
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  if (!result) {
    goto LABEL_10;
  }
LABEL_5:
  Class isa = sub_CDA8().super.super.isa;
  id v10 = 0;
  unsigned int v7 = [v5 setAttribute:isa forKey:AVSystemController_MaximumSpeakerVolumeLimitAttribute error:&v10];

  if (v7)
  {
    id result = v10;
    char v8 = 0;
  }
  else
  {
    id v9 = v10;
    sub_C7F8();

    swift_willThrow();
    id result = (id)swift_errorRelease();
    char v8 = 1;
  }
  *a2 = v8;
  return result;
}

void (*VolumeLimitSettingsState.isVolumeLimitEnabled.modify(void *a1))(void **a1)
{
  int v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  swift_getKeyPath();
  v3[2] = OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState___observationRegistrar;
  *int v3 = v1;
  v3[3] = sub_AE18();
  sub_C878();
  swift_release();
  sub_C500();
  *((unsigned char *)v3 + 32) = v4 < 1.0;
  return sub_BDD0;
}

void sub_BDD0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  void *v1 = v1[1];
  sub_3024(&qword_14CC8);
  sub_C868();
  swift_release();
  free(v1);
}

uint64_t sub_BEB0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_AE18();
  sub_C878();
  swift_release();
  float v4 = (unsigned char *)(v3
               + OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState__isSpeakerVolumeLimitModificationAllowed);
  uint64_t result = swift_beginAccess();
  *a2 = *v4;
  return result;
}

uint64_t sub_BF48()
{
  return swift_release();
}

uint64_t VolumeLimitSettingsState.isSpeakerVolumeLimitModificationAllowed.setter()
{
  return swift_release();
}

void (*VolumeLimitSettingsState.isSpeakerVolumeLimitModificationAllowed.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_AE18();
  sub_C878();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_C898();
  swift_release();
  swift_beginAccess();
  return sub_C188;
}

void sub_C188(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  void *v1 = v1[3];
  swift_getKeyPath();
  sub_C888();
  swift_release();

  free(v1);
}

id VolumeLimitSettingsState.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v2 = self;
  uint64_t v3 = v0;
  id result = [v2 sharedConnection];
  if (result)
  {
    unsigned int v5 = result;
    unsigned __int8 v6 = [result isSpeakerVolumeLimitModificationAllowed];

    v3[OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState__isSpeakerVolumeLimitModificationAllowed] = v6;
    _s19VolumeLimitSettings0abC5StateC22__observationRegistrar33_BE8AC304D49CEB404A72F43C59CA0B1DLL11Observation0pF0Vvpfi_0();

    v11.receiver = v3;
    v11.super_class = ObjectType;
    id v7 = objc_msgSendSuper2(&v11, "init");
    char v8 = self;
    id v9 = v7;
    id v10 = [v8 defaultCenter];
    [v10 addObserver:v9 selector:"effectiveSettingsChanged" name:MCEffectiveSettingsChangedNotification object:0];

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_C350()
{
  id result = [self sharedConnection];
  if (result)
  {
    uint64_t v1 = result;
    [result isSpeakerVolumeLimitModificationAllowed];

    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath, v3);
    sub_AE18();
    sub_C868();
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_C500()
{
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [result attributeForKey:AVSystemController_MaximumSpeakerVolumeLimitAttribute];

    if (v2)
    {
      sub_CE98();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v3, 0, sizeof(v3));
    }
    sub_C750((uint64_t)v3, (uint64_t)v4);
    if (v5) {
      return (id)swift_dynamicCast();
    }
    else {
      return (id)sub_3068((uint64_t)v4);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_C5EC@<X0>(char *a1@<X8>)
{
  return sub_BBD4(*(unsigned char *)(v1 + 16), a1);
}

id sub_C610@<X0>(unsigned char *a1@<X8>)
{
  return sub_B914(a1);
}

uint64_t sub_C634()
{
  return sub_C6F0();
}

uint64_t sub_C64C()
{
  return type metadata accessor for VolumeLimitSettingsState();
}

uint64_t sub_C654()
{
  uint64_t result = sub_C8B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_C6F0()
{
  char v1 = *(unsigned char *)(v0 + 24);
  id v2 = (unsigned char *)(*(void *)(v0 + 16)
               + OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState__isSpeakerVolumeLimitModificationAllowed);
  uint64_t result = swift_beginAccess();
  *id v2 = v1;
  return result;
}

uint64_t sub_C750(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3024(&qword_148D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_C7B8@<X0>(unsigned char *a1@<X8>)
{
  return sub_C610(a1);
}

id sub_C7D0@<X0>(char *a1@<X8>)
{
  return sub_C5EC(a1);
}

uint64_t sub_C7E8(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_C7F8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_C808()
{
  return FloatingPointFormatStyle.Percent.init(locale:)();
}

uint64_t sub_C818()
{
  return FloatingPointFormatStyle.Percent.precision(_:)();
}

uint64_t sub_C828()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength(_:)();
}

uint64_t sub_C838()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Precision();
}

uint64_t sub_C848()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_C858()
{
  return type metadata accessor for Locale();
}

uint64_t sub_C868()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_C878()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_C888()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t sub_C898()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t _s19VolumeLimitSettings0abC5StateC22__observationRegistrar33_BE8AC304D49CEB404A72F43C59CA0B1DLL11Observation0pF0Vvpfi_0()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_C8B8()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_C8C8()
{
  return Transaction.animation.getter();
}

uint64_t sub_C8D8()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_C8E8()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_C8F8()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_C918()
{
  return EnvironmentValues._tintColor.getter();
}

uint64_t sub_C928()
{
  return EnvironmentValues._tintColor.setter();
}

uint64_t sub_C938()
{
  return EnvironmentValues.tint.getter();
}

uint64_t sub_C948()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_C958()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_C968()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_C978()
{
  return EnvironmentValues.init()();
}

uint64_t sub_C988()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_C998()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_C9A8()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_C9B8()
{
  return static VerticalAlignment.center.getter();
}

void sub_C9C8(Swift::String a1)
{
}

void sub_C9D8(Swift::String a1)
{
}

uint64_t sub_C9E8()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_C9F8()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_CA08()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_CA18()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_CA28()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_CA38()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_CA48()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_CA58()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_CA68()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_CA88()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_CA98()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_CAA8()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_CAB8()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_CAC8()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_CAD8()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_CAF8()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_CB08()
{
  return SliderStyleConfiguration.onEditingChanged.getter();
}

uint64_t sub_CB18()
{
  return type metadata accessor for SliderStyleConfiguration.MaximumValueLabel();
}

uint64_t sub_CB28()
{
  return type metadata accessor for SliderStyleConfiguration.MinimumValueLabel();
}

uint64_t sub_CB38()
{
  return SliderStyleConfiguration.maximumValueLabel.getter();
}

uint64_t sub_CB48()
{
  return SliderStyleConfiguration.minimumValueLabel.getter();
}

uint64_t sub_CB58()
{
  return SliderStyleConfiguration.$value.getter();
}

uint64_t sub_CB68()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t sub_CB78()
{
  return UIViewRepresentableContext.transaction.getter();
}

uint64_t sub_CB88()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_CB98()
{
  return static Font.subheadline.getter();
}

uint64_t sub_CBA8()
{
  return List<>.init(content:)();
}

uint64_t sub_CBB8()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_CBC8()
{
  return Text.font(_:)();
}

uint64_t sub_CBD8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_CBE8()
{
  return View.settingsListAppearance()();
}

uint64_t sub_CBF8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_CC08()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_CC18()
{
  return View.sliderStyle<A>(_:)();
}

uint64_t sub_CC28()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_CC38()
{
  return View.listSectionSeparator(_:edges:)();
}

uint64_t sub_CC48()
{
  return Color.init(uiColor:)();
}

uint64_t sub_CC58()
{
  return Color.init(_:)();
}

uint64_t sub_CC68()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_CC78()
{
  return State.wrappedValue.getter();
}

uint64_t sub_CC88()
{
  return State.projectedValue.getter();
}

uint64_t sub_CC98()
{
  return Slider.init<A>(value:in:step:onEditingChanged:minimumValueLabel:maximumValueLabel:label:)();
}

uint64_t sub_CCA8()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_CCB8()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_CCC8()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_CCD8()
{
  return Binding.subscript.getter();
}

uint64_t sub_CCE8()
{
  return Binding.animation(_:)();
}

uint64_t sub_CCF8()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_CD08()
{
  return static Alignment.center.getter();
}

uint64_t sub_CD18()
{
  return static Animation.default.getter();
}

uint64_t sub_CD28()
{
  return BinaryFloatingPoint.formatted<A>(_:)();
}

NSString sub_CD38()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_CD48()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_CD58()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_CD68()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_CD78()
{
  return specialized Array._endMutation()();
}

uint64_t sub_CD88()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_CD98()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_CDA8()
{
  return Double._bridgeToObjectiveC()();
}

NSNumber sub_CDB8()
{
  return Float._bridgeToObjectiveC()();
}

uint64_t sub_CDC8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_CDD8()
{
  return UIView.Invalidating.init(wrappedValue:_:)();
}

uint64_t sub_CDE8()
{
  return UIView.Invalidating.init<A, B>(wrappedValue:_:_:)();
}

uint64_t sub_CDF8()
{
  return static UIView.Invalidating.subscript.getter();
}

uint64_t sub_CE08()
{
  return static UIView.Invalidating.subscript.setter();
}

uint64_t sub_CE18()
{
  return type metadata accessor for UIView.Invalidating();
}

uint64_t sub_CE28()
{
  return UIView.Invalidations.Layout.init()();
}

uint64_t sub_CE38()
{
  return type metadata accessor for UIView.Invalidations.Layout();
}

uint64_t sub_CE48()
{
  return UIView.Invalidations.Display.init()();
}

uint64_t sub_CE58()
{
  return type metadata accessor for UIView.Invalidations.Display();
}

uint64_t sub_CE68()
{
  return UIColor.init(_:)();
}

uint64_t sub_CE78()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_CE88()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_CE98()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_CEA8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_CEB8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_CEC8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_CED8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_CEE8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_CEF8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_CF08()
{
  return Hasher.init(_seed:)();
}

void sub_CF18(Swift::UInt a1)
{
}

Swift::Int sub_CF28()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void free(void *a1)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}