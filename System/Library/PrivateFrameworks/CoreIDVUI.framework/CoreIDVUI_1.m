char *sub_21F519F70(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  char *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  objc_super v43;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (double *)&v4[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_contentInsets];
  v11 = *MEMORY[0x263F834E8];
  v12 = *(double *)(MEMORY[0x263F834E8] + 8);
  v13 = *(double *)(MEMORY[0x263F834E8] + 16);
  v14 = *(double *)(MEMORY[0x263F834E8] + 24);
  *v10 = *(double *)MEMORY[0x263F834E8];
  v10[1] = v12;
  v10[2] = v13;
  v10[3] = v14;
  v15 = OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_registeredAccessories;
  v16 = v4;
  *(void *)&v4[v15] = sub_21F4718E0(MEMORY[0x263F8EE78]);
  v17 = &v16[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize];
  *(void *)v17 = 0;
  *((void *)v17 + 1) = 0;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82D60]), sel_initWithFrame_, 0.0, 0.0, a3, a4);
  *(void *)&v16[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView] = v18;

  v43.receiver = v16;
  v43.super_class = ObjectType;
  v19 = (char *)objc_msgSendSuper2(&v43, sel_initWithFrame_, a1, a2, a3, a4);
  v20 = OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView;
  v21 = *(void **)&v19[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView];
  v22 = v19;
  objc_msgSend(v21, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(*(id *)&v19[v20], sel_setEditable_, 0);
  objc_msgSend(*(id *)&v19[v20], sel_setSelectable_, 0);
  objc_msgSend(*(id *)&v19[v20], sel_setTextAlignment_, 1);
  objc_msgSend(*(id *)&v19[v20], sel_setTextContainerInset_, v11, v12, v13, v14);
  objc_msgSend(*(id *)&v19[v20], sel_setContentInsetAdjustmentBehavior_, 2);
  v23 = *(void **)&v19[v20];
  v24 = self;
  v25 = v23;
  v26 = objc_msgSend(v24, sel_clearColor);
  objc_msgSend(v25, sel_setBackgroundColor_, v26);

  objc_msgSend(v22, sel_addSubview_, *(void *)&v19[v20]);
  v27 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_21F555D00;
  v29 = objc_msgSend(*(id *)&v19[v20], sel_topAnchor);
  v30 = objc_msgSend(v22, sel_topAnchor);
  v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(void *)(v28 + 32) = v31;
  v32 = objc_msgSend(*(id *)&v19[v20], sel_bottomAnchor);
  v33 = objc_msgSend(v22, sel_bottomAnchor);
  v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

  *(void *)(v28 + 40) = v34;
  v35 = objc_msgSend(*(id *)&v19[v20], sel_leadingAnchor);
  v36 = objc_msgSend(v22, sel_leadingAnchor);
  v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v28 + 48) = v37;
  v38 = objc_msgSend(*(id *)&v19[v20], sel_trailingAnchor);
  v39 = objc_msgSend(v22, sel_trailingAnchor);
  v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

  *(void *)(v28 + 56) = v40;
  sub_21F551660();
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDF160);
  v41 = (void *)sub_21F551640();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_activateConstraints_, v41);

  return v22;
}

double sub_21F51A47C(char a1, CGFloat a2, CGFloat a3, double a4, CGFloat a5)
{
  double v11 = sub_21F51A990(v5, a4);
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  double v12 = floor(CGRectGetMidX(v23) + v11 * -0.5);
  uint64_t v13 = OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView;
  id v14 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView], sel_attributedText);
  if (v14)
  {
    v15 = v14;
    if ((uint64_t)objc_msgSend(v14, sel_length) >= 1)
    {
      id v16 = *(id *)&v5[v13];
      objc_msgSend(v16, sel_sizeThatFits_, v11, 1.79769313e308);
      double v18 = v17;

      goto LABEL_6;
    }
  }
  double v18 = *(double *)&v5[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize + 8];
LABEL_6:
  v24.origin.x = v12;
  v24.origin.y = a3;
  v24.size.width = v11;
  v24.size.height = v18;
  double MaxY = CGRectGetMaxY(v24);
  if ((a1 & 1) == 0)
  {
    objc_msgSend(*(id *)&v5[v13], sel_setFrame_, v12, a3, v11, v18);
    id v20 = objc_msgSend(*(id *)&v5[v13], sel_textContainer);
    objc_msgSend(v20, sel_setSize_, v11, v18);
  }
  sub_21F51AA94(v12, a3, v11, v18, (uint64_t)v22, a1 & 1);
  return MaxY;
}

id sub_21F51A780()
{
  v1 = &v0[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_registeredAccessories];
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)v1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(*(void *)v1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(*(void *)v1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v7) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v3 + 8 * v9);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    id result = objc_msgSend(*(id *)(*(void *)(v2 + 56) + 40 * v11 + 32), sel_removeFromSuperview);
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_23:
    swift_release();
    *(void *)v1 = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    v15 = &v0[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize];
    *(void *)v15 = 0;
    *((void *)v15 + 1) = 0;
    return objc_msgSend(v0, sel_setNeedsLayout);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

double sub_21F51A990(char *a1, double a2)
{
  uint64_t v4 = &a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_registeredAccessories];
  swift_beginAccess();
  double v5 = *(double *)&a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_contentInsets + 8]
     + *(double *)&a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_contentInsets + 24];
  if (*(void *)(*(void *)v4 + 16))
  {
    id v6 = objc_msgSend(a1, sel_traitCollection);
    id v7 = objc_msgSend(v6, sel_preferredContentSizeCategory);

    LOBYTE(v6) = sub_21F5518D0();
    double v8 = 6.0;
    if (v6) {
      double v8 = 18.0;
    }
    double v9 = v8
       + *(double *)&a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize]
       + v8
       + *(double *)&a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize];
    if (v5 <= v9) {
      double v5 = v9;
    }
  }
  return a2 - v5;
}

id sub_21F51AA94(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, char a6)
{
  if (a6) {
    return result;
  }
  double v7 = sub_21F51AC8C(v6, 0, a1, a2, a3, a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int64_t v14 = &v6[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_registeredAccessories];
  swift_beginAccess();
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = v15 + 64;
  uint64_t v17 = 1 << *(unsigned char *)(v15 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & *(void *)(v15 + 64);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain_n();
  int64_t v22 = 0;
  while (1)
  {
    if (v19)
    {
      unint64_t v23 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v24 = v23 | (v22 << 6);
      goto LABEL_6;
    }
    int64_t v25 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v25 >= v20) {
      goto LABEL_24;
    }
    unint64_t v26 = *(void *)(v16 + 8 * v25);
    ++v22;
    if (!v26)
    {
      int64_t v22 = v25 + 1;
      if (v25 + 1 >= v20) {
        goto LABEL_24;
      }
      unint64_t v26 = *(void *)(v16 + 8 * v22);
      if (!v26)
      {
        int64_t v22 = v25 + 2;
        if (v25 + 2 >= v20) {
          goto LABEL_24;
        }
        unint64_t v26 = *(void *)(v16 + 8 * v22);
        if (!v26)
        {
          int64_t v22 = v25 + 3;
          if (v25 + 3 >= v20) {
            goto LABEL_24;
          }
          unint64_t v26 = *(void *)(v16 + 8 * v22);
          if (!v26) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v22 << 6);
LABEL_6:
    id result = objc_msgSend(*(id *)(*(void *)(v15 + 56) + 40 * v24 + 32), sel_setFrame_, ceil(v7 + (v11 - *(double *)(*(void *)(v15 + 56) + 40 * v24 + 16)) * 0.5), ceil(v9 + (v13 - *(double *)(*(void *)(v15 + 56) + 40 * v24 + 24)) * 0.5));
  }
  int64_t v27 = v25 + 4;
  if (v27 >= v20)
  {
LABEL_24:
    swift_release();
    return (id)swift_bridgeObjectRelease();
  }
  unint64_t v26 = *(void *)(v16 + 8 * v27);
  if (v26)
  {
    int64_t v22 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v22 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v22 >= v20) {
      goto LABEL_24;
    }
    unint64_t v26 = *(void *)(v16 + 8 * v22);
    ++v27;
    if (v26) {
      goto LABEL_23;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

CGFloat sub_21F51AC8C(char *a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  unsigned int v12 = objc_msgSend(a1, sel__shouldReverseLayoutDirection);
  unint64_t v13 = sub_21F51AEA8((uint64_t)a1, a2, a3, a4, a5, a6);
  if (v13)
  {
    uint64_t v15 = (void *)v13;
    uint64_t v16 = v14;
    objc_msgSend(v14, sel_typographicBounds);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    objc_msgSend(v15, sel_layoutFragmentFrame);
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    uint64_t v29 = OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize;
    uint64_t v30 = *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_maxAccessorySize];
    v51.origin.double x = v18;
    v51.origin.double y = v20;
    v51.size.width = v22;
    v51.size.height = v24;
    CGFloat Height = CGRectGetHeight(v51);
    CGFloat v32 = v18;
    CGFloat v33 = v20;
    CGFloat v34 = v22;
    CGFloat v35 = v24;
    if (v12) {
      CGFloat MinX = CGRectGetMinX(*(CGRect *)&v32);
    }
    else {
      CGFloat MinX = CGRectGetMaxX(*(CGRect *)&v32);
    }
    CGFloat v37 = v20;
    uint64_t v38 = v30;
    CGFloat v39 = Height;
    CGRect v52 = CGRectOffset(*(CGRect *)&MinX, v26, v28);
    double x = v52.origin.x;
    double y = v52.origin.y;
    double v42 = v52.size.height;
    double v43 = *(double *)&a1[v29];
    id v44 = objc_msgSend(a1, sel_traitCollection);
    id v45 = objc_msgSend(v44, sel_preferredContentSizeCategory);

    LOBYTE(v44) = sub_21F5518D0();
    double v46 = 6.0;
    if (v44) {
      double v46 = 18.0;
    }
    if (v12) {
      double v46 = -(v43 + v46);
    }
    double v47 = x + v46;
    id v48 = *(id *)&a1[OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView];
    objc_msgSend(v48, sel_convertRect_toCoordinateSpace_, a1, v47, y, v43, v42);
    a3 = v49;
  }
  return a3;
}

unint64_t sub_21F51AEA8(uint64_t a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC9CoreIDVUI25IDVTrailingAccessoryLabel_textView), sel_textLayoutManager);
  if (!v11) {
    return 0;
  }
  unsigned int v12 = v11;
  v28.origin.double x = a3;
  v28.origin.double y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  objc_msgSend(v11, sel_ensureLayoutForBounds_, 0.0, 0.0, CGRectGetWidth(v28), 1.79769313e308);
  id v27 = 0;
  id v13 = objc_msgSend(v12, sel_documentRange);
  id v14 = objc_msgSend(v13, sel_endLocation);

  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = &v27;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = sub_21F51B504;
  v16[3] = v15;
  aBlock[4] = sub_21F51B548;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F51B2B4;
  aBlock[3] = &block_descriptor_27;
  unint64_t v17 = (unint64_t)_Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v18 = objc_msgSend(v12, sel_enumerateTextLayoutFragmentsFromLocation_options_usingBlock_, v14, 1, v17);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  _Block_release((const void *)v17);
  uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t isEscapingClosureAtFileLocation = (uint64_t)v27;
    if (!v27)
    {
      if (a2) {
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    uint64_t v16 = v27;
    id v20 = objc_msgSend(v16, sel_textLineFragments);
    sub_21F46EFD8(0, (unint64_t *)&unk_267EE02B0);
    unint64_t v17 = sub_21F551650();

    if (!(v17 >> 62))
    {
      uint64_t v21 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v21) {
        goto LABEL_6;
      }
LABEL_19:

      swift_bridgeObjectRelease();
      if (a2)
      {
LABEL_20:
        id v25 = objc_msgSend(v12, sel_documentRange);
        objc_msgSend(v12, sel_invalidateLayoutForRange_, v25);
        swift_release();

        uint64_t isEscapingClosureAtFileLocation = 0;
        unsigned int v12 = v25;
LABEL_22:

        return isEscapingClosureAtFileLocation;
      }
LABEL_21:
      swift_release();
      uint64_t isEscapingClosureAtFileLocation = 0;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_21F551B50();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_19;
  }
LABEL_6:
  unint64_t result = v21 - 1;
  if (__OFSUB__(v21, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if ((v17 & 0xC000000000000001) != 0)
  {
LABEL_25:
    MEMORY[0x223C4E570](result, v17);
LABEL_11:
    swift_bridgeObjectRelease();

    if (a2)
    {
      id v24 = objc_msgSend(v12, sel_documentRange);
      objc_msgSend(v12, sel_invalidateLayoutForRange_, v24);
      swift_release();

      unsigned int v12 = v24;
    }
    else
    {
      swift_release();
    }
    goto LABEL_22;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v23 = *(id *)(v17 + 8 * result + 32);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_21F51B2B4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  char v4 = v2();

  return v4 & 1;
}

id sub_21F51B2F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IDVTrailingAccessoryLabel()
{
  return self;
}

void destroy for IDVTrailingAccessoryLabel.Accessory(uint64_t a1)
{
  swift_bridgeObjectRelease();
  objc_super v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for IDVTrailingAccessoryLabel.Accessory(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  char v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for IDVTrailingAccessoryLabel.Accessory(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  char v4 = (void *)a2[4];
  id v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for IDVTrailingAccessoryLabel.Accessory(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  id v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

ValueMetadata *type metadata accessor for IDVTrailingAccessoryLabel.Accessory()
{
  return &type metadata for IDVTrailingAccessoryLabel.Accessory;
}

uint64_t sub_21F51B4F4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F51B504(void *a1)
{
  objc_super v2 = *(void ***)(v1 + 16);
  uint64_t v3 = *v2;
  *objc_super v2 = a1;
  id v4 = a1;

  return 0;
}

uint64_t sub_21F51B538()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F51B548()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t block_copy_helper_24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_24()
{
  return swift_release();
}

uint64_t destroy for RGBCaptureViewConfiguration(uint64_t a1)
{
  swift_release();

  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for RGBCaptureViewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_retain();
  id v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RGBCaptureViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for RGBCaptureViewConfiguration(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for RGBCaptureViewConfiguration(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RGBCaptureViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RGBCaptureViewConfiguration()
{
  return &type metadata for RGBCaptureViewConfiguration;
}

uint64_t sub_21F51B7D8()
{
  uint64_t v0 = sub_21F54F8D0();
  if (v1)
  {
    unint64_t v2 = v1;
  }
  else
  {
    uint64_t v0 = 0;
    unint64_t v2 = 0xE000000000000000;
  }
  uint64_t v3 = sub_21F534070(v0, v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_21F51B838()
{
  uint64_t v0 = sub_21F54EC30();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_21F551550();
  MEMORY[0x270FA5388](v1 - 8);
  sub_21F551540();
  if (qword_267EDE2E0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_267EE25A0;
  sub_21F54EC20();
  return sub_21F5515C0();
}

BOOL sub_21F51B970()
{
  return sub_21F51BC68(*v0);
}

uint64_t sub_21F51B978()
{
  return sub_21F51BC9C(*v0);
}

uint64_t sub_21F51B980()
{
  return sub_21F51B9A8(*v0);
}

id sub_21F51B988()
{
  return sub_21F51B9E0(*v0);
}

uint64_t sub_21F51B994()
{
  return 0x3FC999999999999ALL;
}

uint64_t sub_21F51B9A8(uint64_t a1)
{
  if ((*(void *)(a1 + 136) & 3) == 2) {
    return 2;
  }
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp)) {
    return 2;
  }
  return 1;
}

id sub_21F51B9E0(uint64_t a1)
{
  if ((*(void *)(a1 + 136) & 3) == 2
    || (*(unsigned char *)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) & 1) != 0)
  {
    uint64_t v1 = sub_21F5295C8();
    unint64_t v3 = v2;
    id v4 = objc_allocWithZone(MEMORY[0x263F827E8]);
    id v5 = (id)sub_21F54EBF0();
    id v6 = objc_msgSend(v4, sel_initWithData_, v5);
    sub_21F46EE8C(v1, v3);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21F5547F0;
    double v8 = self;
    *(void *)(v7 + 32) = objc_msgSend(v8, sel_systemBlueColor);
    id v9 = objc_msgSend(v8, sel_systemBlueColor);
    id v10 = objc_msgSend(v9, sel_colorWithAlphaComponent_, 0.4);

    *(void *)(v7 + 40) = v10;
    sub_21F551660();
    sub_21F51BC28();
    id v11 = (void *)sub_21F551640();
    swift_bridgeObjectRelease();
    unsigned int v12 = self;
    id v13 = objc_msgSend(v12, sel_configurationWithPaletteColors_, v11);

    id v14 = objc_msgSend(v12, sel_configurationWithPointSize_, 80.0);
    id v15 = objc_msgSend(v13, sel_configurationByApplyingConfiguration_, v14);

    id v5 = v15;
    uint64_t v16 = (void *)sub_21F551560();
    id v6 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v16, v5);
  }
  return v6;
}

unint64_t sub_21F51BC28()
{
  unint64_t result = qword_267EDE938;
  if (!qword_267EDE938)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EDE938);
  }
  return result;
}

BOOL sub_21F51BC68(uint64_t a1)
{
  return *(unsigned char *)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) == 1
      && (*(void *)(a1 + 136) & 3) != 2;
}

uint64_t sub_21F51BC9C(uint64_t a1)
{
  uint64_t v2 = sub_21F54EC30();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_21F551550();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t result = 0;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) == 1)
  {
    if ((*(void *)(a1 + 136) & 3) == 2)
    {
      return 0;
    }
    else
    {
      sub_21F551540();
      if (qword_267EDE2E0 != -1) {
        swift_once();
      }
      id v5 = (id)qword_267EE25A0;
      sub_21F54EC20();
      return sub_21F5515C0();
    }
  }
  return result;
}

id sub_21F51BE20(uint64_t a1)
{
  void (**v23)(void *__return_ptr, uint64_t, id);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  id v37;
  void (**v38)(void *__return_ptr, uint64_t, id);
  uint64_t v39;
  id result;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void v50[3];
  uint64_t v51;
  uint64_t v52;
  void v53[5];
  void v54[5];
  void v55[5];
  long long v56;
  long long v57;
  void (**v58)(void *__return_ptr, uint64_t, id);
  long long v59;
  long long v60;
  _OWORD v61[2];
  uint64_t v62;
  long long v63;
  long long v64;
  uint64_t v65;
  long long v66;
  long long v67;
  uint64_t v68;
  _OWORD v69[2];
  uint64_t v70;
  long long v71;
  id v72;
  long long v73;
  id v74;
  long long v75;
  long long v76;

  uint64_t v2 = v1;
  sub_21F4E09EC(a1, (uint64_t)v69);
  uint64_t v3 = (uint64_t)&v1[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config];
  swift_beginAccess();
  sub_21F51E5FC((uint64_t)v69, v3);
  swift_endAccess();
  uint64_t v4 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView], sel_setDelegate_, v1);
  objc_msgSend(*(id *)&v1[v4], sel_setDataSource_, v1);
  id v5 = *(void **)&v1[v4];
  type metadata accessor for IdentityProofingWatchPendingStateTableViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = v5;
  double v8 = (void *)sub_21F551560();
  objc_msgSend(v7, sel_registerClass_forCellReuseIdentifier_, ObjCClassFromMetadata, v8);

  double v49 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel;
  id v9 = *(void **)&v2[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel];
  sub_21F4E09EC(v3, (uint64_t)&v63);
  uint64_t v10 = *((void *)&v64 + 1);
  if (*((void *)&v64 + 1))
  {
    uint64_t v11 = v65;
    unsigned int v12 = __swift_project_boxed_opaque_existential_1(&v63, *((uint64_t *)&v64 + 1));
    uint64_t v13 = *(void *)(v10 - 8);
    MEMORY[0x270FA5388](v12);
    id v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    id v16 = v9;
    sub_21F476EE4((uint64_t)&v63);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v11 + 16))(v53, v10, v11);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v10);
    sub_21F47607C((uint64_t)v53, (uint64_t)&v66, &qword_267EDE858);
    if (*((void *)&v66 + 1))
    {
      v69[0] = v66;
      v69[1] = v67;
      v70 = v68;
      v71 = v67;
      sub_21F51E664((uint64_t)&v71);
      sub_21F47607C((uint64_t)&v70, (uint64_t)&v72, &qword_267EE00B0);
      sub_21F51E690(&v72);
      unint64_t v17 = (void *)sub_21F551560();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    id v18 = v9;
    sub_21F476EE4((uint64_t)&v63);
  }
  unint64_t v17 = 0;
LABEL_6:
  double v19 = &selRef_setBioBindingFlowManager_;
  objc_msgSend(v9, sel_setText_, v17);

  uint64_t v20 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel;
  uint64_t v21 = *(void **)&v2[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel];
  sub_21F4E09EC(v3, (uint64_t)&v56);
  uint64_t v22 = *((void *)&v57 + 1);
  if (*((void *)&v57 + 1))
  {
    id v48 = v20;
    id v23 = v58;
    id v24 = __swift_project_boxed_opaque_existential_1(&v56, *((uint64_t *)&v57 + 1));
    id v25 = *(void *)(v22 - 8);
    MEMORY[0x270FA5388](v24);
    id v27 = (char *)&v47 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v25 + 16))(v27);
    CGRect v28 = v21;
    sub_21F476EE4((uint64_t)&v56);
    v23[2](v54, v22, v23);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v22);
    sub_21F47607C((uint64_t)v54, (uint64_t)v61, &qword_267EDE858);
    if (*((void *)&v61[0] + 1))
    {
      v63 = v61[0];
      v64 = v61[1];
      v65 = v62;
      v73 = v61[0];
      sub_21F51E664((uint64_t)&v73);
      sub_21F47607C((uint64_t)&v65, (uint64_t)&v74, &qword_267EE00B0);
      sub_21F51E690(&v74);
      uint64_t v29 = (void *)sub_21F551560();
      swift_bridgeObjectRelease();
      uint64_t v20 = v48;
      double v19 = &selRef_setBioBindingFlowManager_;
      goto LABEL_12;
    }
    uint64_t v20 = v48;
    double v19 = &selRef_setBioBindingFlowManager_;
  }
  else
  {
    uint64_t v30 = v21;
    sub_21F476EE4((uint64_t)&v56);
  }
  uint64_t v29 = 0;
LABEL_12:
  objc_msgSend(v21, v19[150], v29);

  sub_21F4E09EC(v3, (uint64_t)v50);
  v31 = v51;
  if (v51)
  {
    CGFloat v32 = v52;
    CGFloat v33 = __swift_project_boxed_opaque_existential_1(v50, v51);
    CGFloat v34 = *(void *)(v31 - 8);
    MEMORY[0x270FA5388](v33);
    v36 = (char *)&v47 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v34 + 16))(v36);
    sub_21F476EE4((uint64_t)v50);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v32 + 16))(v55, v31, v32);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v31);
    sub_21F47607C((uint64_t)v55, (uint64_t)&v56, &qword_267EDE858);
    if (*((void *)&v56 + 1))
    {
      v59 = v56;
      v60 = v57;
      CGFloat v37 = v58;
      v75 = v56;
      uint64_t v38 = v58;
      sub_21F51E664((uint64_t)&v75);
      v76 = v60;
      sub_21F51E664((uint64_t)&v76);

      if (v37)
      {
        objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView], sel_setImage_, v38);
      }
    }
  }
  else
  {
    sub_21F476EE4((uint64_t)v50);
  }
  CGFloat v39 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryStackView;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryStackView], sel_addArrangedSubview_, *(void *)&v2[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView]);
  objc_msgSend(*(id *)&v2[v39], sel_addArrangedSubview_, *(void *)&v2[v49]);
  objc_msgSend(*(id *)&v2[v39], sel_addArrangedSubview_, *(void *)&v2[v20]);
  objc_msgSend(*(id *)&v2[v4], sel_setTableHeaderView_, *(void *)&v2[v39]);
  uint64_t result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v41 = result;
    objc_msgSend(result, sel_addSubview_, *(void *)&v2[v4]);

    sub_21F51CBE8();
    sub_21F51CA04();
    double v42 = objc_msgSend(v2, sel_traitCollection);
    double v43 = objc_msgSend(v42, sel_preferredContentSizeCategory);

    LOBYTE(v42) = sub_21F5518D0();
    if (v42) {
      objc_msgSend(*(id *)&v2[v4], sel_setScrollEnabled_, 1);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF970);
    id v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_21F554510;
    id v45 = sub_21F550C40();
    double v46 = MEMORY[0x263F82018];
    *(void *)(v44 + 32) = v45;
    *(void *)(v44 + 40) = v46;
    MEMORY[0x223C4E2D0](v44, sel_updateUI_previousTraitCollection_);
    swift_unknownObjectRelease();
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21F51C5C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView;
  id v3 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView), sel_tableHeaderView);
  if (v3)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
    unint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_21F5547F0;
    id v6 = objc_msgSend(v4, sel_widthAnchor);
    objc_msgSend(*(id *)(v1 + v2), sel_frame);
    id v7 = objc_msgSend(v6, sel_constraintEqualToConstant_, CGRectGetWidth(v29) + -40.0);

    *(void *)(v5 + 32) = v7;
    id v8 = objc_msgSend(v4, sel_centerXAnchor);
    id v9 = objc_msgSend(*(id *)(v1 + v2), sel_centerXAnchor);
    id v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

    *(void *)(v5 + 40) = v10;
    sub_21F551660();
    uint64_t v11 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView;
    id v12 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView), sel_image);
    if (!v12)
    {
LABEL_10:
      id v25 = self;
      sub_21F48C034();
      CGFloat v26 = (void *)sub_21F551640();
      swift_bridgeObjectRelease();
      objc_msgSend(v25, sel_activateConstraints_, v26);

      objc_msgSend(v4, sel_systemLayoutSizeFittingSize_, *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
      objc_msgSend(v4, sel_frame);
      objc_msgSend(v4, sel_setFrame_);
      id v27 = *(id *)(v1 + v2);
      objc_msgSend(v27, sel_setTableHeaderView_, v4);

      return;
    }
    uint64_t v13 = v12;
    objc_msgSend(v12, sel_size);
    double v15 = v14;
    objc_msgSend(v13, sel_size);
    id v16 = &selRef_setBioBindingFlowManager_;
    double v18 = v15 / v17;
    id v19 = objc_msgSend(*(id *)(v1 + v11), sel_widthAnchor);
    objc_msgSend(*(id *)(v1 + v2), sel_frame);
    id v28 = objc_msgSend(v19, sel_constraintEqualToConstant_, CGRectGetWidth(v30) / 3.0);

    id v20 = objc_msgSend(*(id *)(v1 + v11), sel_heightAnchor);
    id v21 = objc_msgSend(*(id *)(v1 + v11), sel_widthAnchor);
    id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_multiplier_, v21, v18);

    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_21F551B50();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (__OFADD__(v23, 2))
    {
      __break(1u);
    }
    else
    {
      sub_21F51E02C(v23 + 2, 1);
      sub_21F551660();
      id v16 = (char **)v28;
      MEMORY[0x223C4E100]();
      if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      {
LABEL_7:
        sub_21F5516A0();
        sub_21F551660();
        id v24 = v22;
        MEMORY[0x223C4E100]();
        if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21F551680();
        }
        sub_21F5516A0();
        sub_21F551660();

        goto LABEL_10;
      }
    }
    sub_21F551680();
    goto LABEL_7;
  }
}

void sub_21F51CA04()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel);
  id v3 = self;
  uint64_t v4 = *MEMORY[0x263F835E0];
  uint64_t v5 = *MEMORY[0x263F83418];
  id v6 = v2;
  id v7 = objc_msgSend(v3, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v4, v5);
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_pointSize);
    id v9 = objc_msgSend(v3, sel_systemFontOfSize_weight_);

    objc_msgSend(v6, sel_setFont_, v9);
    objc_msgSend(*(id *)(v0 + v1), sel_setAdjustsFontForContentSizeCategory_, 1);
    uint64_t v10 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel;
    uint64_t v11 = *MEMORY[0x263F83570];
    id v12 = objc_retain(*(id *)(v0
                            + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel));
    id v13 = objc_msgSend(v3, sel_preferredFontForTextStyle_, v11);
    objc_msgSend(v12, sel_setFont_, v13);

    objc_msgSend(*(id *)(v0 + v10), sel_setAdjustsFontForContentSizeCategory_, 1);
    double v14 = *(void **)(v0 + v10);
    double v15 = self;
    id v16 = v14;
    id v17 = objc_msgSend(v15, sel_lightGrayColor);
    objc_msgSend(v16, sel_setTextColor_, v17);
  }
  else
  {
    __break(1u);
  }
}

void sub_21F51CBE8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21F555D00;
  uint64_t v2 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView;
  id v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView], sel_topAnchor);
  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_safeAreaLayoutGuide);

  id v7 = objc_msgSend(v6, sel_topAnchor);
  id v8 = objc_msgSend(v3, sel_constraintEqualToAnchor_constant_, v7, 20.0);

  *(void *)(v1 + 32) = v8;
  id v9 = objc_msgSend(*(id *)&v0[v2], sel_widthAnchor);
  id v10 = objc_msgSend(v0, sel_view);
  if (!v10)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_widthAnchor);

  id v13 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v12);
  *(void *)(v1 + 40) = v13;
  id v14 = objc_msgSend(*(id *)&v0[v2], sel_bottomAnchor);
  id v15 = objc_msgSend(v0, sel_view);
  if (!v15)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v16 = v15;
  id v17 = objc_msgSend(v15, sel_safeAreaLayoutGuide);

  id v18 = objc_msgSend(v17, sel_bottomAnchor);
  id v19 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v18);

  *(void *)(v1 + 48) = v19;
  id v20 = objc_msgSend(*(id *)&v0[v2], sel_centerXAnchor);
  id v21 = objc_msgSend(v0, sel_view);
  if (!v21)
  {
LABEL_11:
    __break(1u);
    return;
  }
  id v22 = v21;
  uint64_t v23 = self;
  id v24 = objc_msgSend(v22, sel_centerXAnchor);

  id v25 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v24);
  *(void *)(v1 + 56) = v25;
  sub_21F551660();
  sub_21F48C034();
  id v26 = (id)sub_21F551640();
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_activateConstraints_, v26);
}

id sub_21F51CF04()
{
  type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_21F551560();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v3);
  objc_msgSend(v4, sel_setContentMode_, 1);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v4, sel_setClipsToBounds_, 1);
  id v5 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v5, sel_setCornerRadius_, 5.0);

  return v4;
}

id sub_21F51D1EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = &v3[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config];
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  uint64_t v5 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = v3;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v8, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_setLineBreakMode_, 0);
  objc_msgSend(v8, sel_setTextAlignment_, 1);

  *(void *)&v3[v5] = v8;
  uint64_t v9 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel;
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v10, sel_setNumberOfLines_, 0);
  objc_msgSend(v10, sel_setLineBreakMode_, 0);
  objc_msgSend(v10, sel_setTextAlignment_, 1);

  *(void *)&v7[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView;
  *(void *)&v7[v11] = sub_21F51CF04();
  uint64_t v12 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryStackView;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v13, sel_setAxis_, 1);
  objc_msgSend(v13, sel_setSpacing_, 5.0);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setAlignment_, 3);
  *(void *)&v7[v12] = v13;
  uint64_t v14 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_setScrollEnabled_, 0);
  *(void *)&v7[v14] = v15;

  if (a2)
  {
    id v16 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = 0;
  }
  v21.receiver = v7;
  v21.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  id v17 = objc_msgSendSuper2(&v21, sel_initWithNibName_bundle_, v16, a3);

  return v17;
}

id sub_21F51D4D8(void *a1)
{
  uint64_t v2 = &v1[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config];
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  uint64_t v3 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel;
  id v4 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v5 = v1;
  id v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v6, sel_setNumberOfLines_, 0);
  objc_msgSend(v6, sel_setLineBreakMode_, 0);
  objc_msgSend(v6, sel_setTextAlignment_, 1);

  *(void *)&v1[v3] = v6;
  uint64_t v7 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v8, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_setLineBreakMode_, 0);
  objc_msgSend(v8, sel_setTextAlignment_, 1);

  *(void *)&v5[v7] = v8;
  uint64_t v9 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView;
  *(void *)&v5[v9] = sub_21F51CF04();
  uint64_t v10 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryStackView;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
  objc_msgSend(v11, sel_setAxis_, 1);
  objc_msgSend(v11, sel_setSpacing_, 5.0);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_setAlignment_, 3);
  *(void *)&v5[v10] = v11;
  uint64_t v12 = OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82C78]), sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setScrollEnabled_, 0);
  *(void *)&v5[v12] = v13;

  v17.receiver = v5;
  v17.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  id v14 = objc_msgSendSuper2(&v17, sel_initWithCoder_, a1);

  return v14;
}

id sub_21F51D758()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingWatchPendingStateBaseViewController()
{
  return self;
}

id sub_21F51D8DC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21F54EC80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (void *)sub_21F551560();
  uint64_t v10 = (void *)sub_21F54EC40();
  id v11 = objc_msgSend(a1, sel_dequeueReusableCellWithIdentifier_forIndexPath_, v9, v10);

  type metadata accessor for IdentityProofingWatchPendingStateTableViewCell();
  uint64_t v12 = swift_dynamicCastClass();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v3 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config;
    swift_beginAccess();
    sub_21F4E09EC(v14, (uint64_t)v23);
    sub_21F4DFE40((uint64_t)v23, a2);
    sub_21F476EE4((uint64_t)v23);
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    (*(void (**)(unsigned char *, void *, uint64_t))(v7 + 16))(&v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], a2, v6);
    unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v15;
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 32))(v17 + v16, &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v6);
    id v18 = (void (**)())(v13 + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped);
    uint64_t v19 = *(void *)(v13 + OBJC_IVAR____TtC9CoreIDVUI46IdentityProofingWatchPendingStateTableViewCell_buttonTapped);
    *id v18 = sub_21F51DFC8;
    v18[1] = (void (*)())v17;
    sub_21F47D8F8(v19);
    return (id)v13;
  }
  else
  {

    id v21 = objc_allocWithZone(MEMORY[0x263F82C80]);
    return objc_msgSend(v21, sel_init);
  }
}

void sub_21F51DB58(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223C4F1E0](v1);
  if (!v2) {
    return;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = v2 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config;
  swift_beginAccess();
  sub_21F4E09EC(v4, (uint64_t)v19);
  uint64_t v5 = v20;
  if (!v20)
  {

    sub_21F476EE4((uint64_t)v19);
    return;
  }
  uint64_t v6 = v21;
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(v19, v20);
  uint64_t v8 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  (*(void (**)(char *))(v8 + 16))(v10);
  sub_21F476EE4((uint64_t)v19);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v5);
  if (!v11)
  {
LABEL_12:

    return;
  }
  unint64_t v12 = sub_21F54EC70();
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v12 >= *(void *)(v11 + 16))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(v11 + 8 * v12 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v14 = sub_21F54EC60();
  if ((v13 & 0xC000000000000001) != 0)
  {
LABEL_17:
    uint64_t v15 = MEMORY[0x223C4E570]();
LABEL_10:
    swift_bridgeObjectRelease();
    unint64_t v16 = *(void (**)(uint64_t))(v15 + 72);
    sub_21F47F790((uint64_t)v16);
    uint64_t v17 = swift_release();
    if (v16)
    {
      v16(v17);
      sub_21F47D8F8((uint64_t)v16);
    }
    goto LABEL_12;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v15 = *(void *)(v13 + 8 * v14 + 32);
    swift_retain();
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_21F51DEC4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F51DEFC()
{
  uint64_t v1 = sub_21F54EC80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_21F51DFC8()
{
  sub_21F54EC80();
  uint64_t v1 = *(void *)(v0 + 16);

  sub_21F51DB58(v1);
}

uint64_t sub_21F51E02C(uint64_t a1, char a2)
{
  unint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v5;
  uint64_t v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_21F551B50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = MEMORY[0x223C4E580](v7, v9, a2 & 1, v5);
  *uint64_t v2 = result;
  return result;
}

id sub_21F51E0EC(void *a1)
{
  if (a1) {
    id v2 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  }
  else {
    id v2 = 0;
  }
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!v2)
  {

LABEL_12:
    sub_21F51CA04();
    id v12 = objc_msgSend(v1, sel_traitCollection);
    id v13 = objc_msgSend(v12, sel_preferredContentSizeCategory);

    char v14 = sub_21F5518D0();
    uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView];
    return objc_msgSend(v15, sel_setScrollEnabled_, (v14 & 1) != 0);
  }
  uint64_t v5 = sub_21F5515A0();
  uint64_t v7 = v6;
  if (v5 == sub_21F5515A0() && v7 == v8)
  {

    return (id)swift_bridgeObjectRelease_n();
  }
  char v10 = sub_21F551BF0();

  swift_bridgeObjectRelease();
  id result = (id)swift_bridgeObjectRelease();
  if ((v10 & 1) == 0) {
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_21F51E298()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config;
  swift_beginAccess();
  sub_21F4E09EC(v1, (uint64_t)v11);
  uint64_t v2 = v12;
  if (v12)
  {
    uint64_t v3 = v13;
    id v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v5 = *(void *)(v2 - 8);
    MEMORY[0x270FA5388](v4);
    uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v5 + 16))(v7);
    sub_21F476EE4((uint64_t)v11);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v2);
    if (v8)
    {
      uint64_t v2 = *(void *)(v8 + 16);
      swift_bridgeObjectRelease();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_21F476EE4((uint64_t)v11);
  }
  return v2;
}

uint64_t sub_21F51E414(unint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config;
  swift_beginAccess();
  sub_21F4E09EC(v3, (uint64_t)v14);
  uint64_t v4 = v15;
  if (v15)
  {
    uint64_t v5 = v16;
    uint64_t v6 = __swift_project_boxed_opaque_existential_1(v14, v15);
    uint64_t v7 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v6);
    uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v7 + 16))(v9);
    sub_21F476EE4((uint64_t)v14);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v4);
    if (v10)
    {
      if ((a1 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (*(void *)(v10 + 16) > a1)
      {
        unint64_t v11 = *(void *)(v10 + 8 * a1 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (!(v11 >> 62))
        {
          uint64_t v10 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_7:
          swift_bridgeObjectRelease();
          return v10;
        }
LABEL_13:
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_21F551B50();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      __break(1u);
      goto LABEL_13;
    }
  }
  else
  {
    sub_21F476EE4((uint64_t)v14);
    return 0;
  }
  return v10;
}

uint64_t sub_21F51E5FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F51E664(uint64_t a1)
{
  return a1;
}

id *sub_21F51E690(id *a1)
{
  return a1;
}

uint64_t sub_21F51E6BC()
{
  v1[2] = v0;
  uint64_t v2 = sub_21F550540();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_21F550C20();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F51E7D8, 0, 0);
}

uint64_t sub_21F51E7D8()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F551790();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Enrolling in biometric binding", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v6 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[9] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_21F51E908;
  return sub_21F5212C4();
}

uint64_t sub_21F51E908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)*v4;
  uint64_t v8 = (void *)*v4;
  v7[10] = a1;
  v7[11] = a2;
  v7[12] = a3;
  v7[13] = v3;
  swift_task_dealloc();
  if (v3)
  {
    return MEMORY[0x270FA2498](sub_21F51EE84, 0, 0);
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    v7[14] = v9;
    *uint64_t v9 = v8;
    v9[1] = sub_21F51EAB4;
    return sub_21F521BA8(a1, a2, 0, 0, 0, 0);
  }
}

uint64_t sub_21F51EAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[17] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_21F51F008;
  }
  else {
    uint64_t v5 = sub_21F51EBCC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F51EBCC()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[4];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_1(v1 + 1, v2);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 40) + **(int **)(v3 + 40));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[18] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_21F51ECDC;
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];
  uint64_t v7 = v0[12];
  return v9(v6, v5, v7, v2, v3);
}

uint64_t sub_21F51ECDC()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_21F51F194;
  }
  else {
    uint64_t v2 = sub_21F51EDF0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F51EDF0()
{
  uint64_t v1 = v0[10];
  unint64_t v2 = v0[11];
  sub_21F46EE8C(v0[15], v0[16]);
  sub_21F46EE8C(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_21F51EE84()
{
  uint64_t v1 = (void *)v0[13];
  (*(void (**)(void, void, void))(v0[4] + 104))(v0[5], *MEMORY[0x263F36418], v0[3]);
  id v2 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_21F51F008()
{
  sub_21F46EE8C(v0[10], v0[11]);
  uint64_t v1 = (void *)v0[17];
  (*(void (**)(void, void, void))(v0[4] + 104))(v0[5], *MEMORY[0x263F36418], v0[3]);
  id v2 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_21F51F194()
{
  uint64_t v1 = v0[10];
  unint64_t v2 = v0[11];
  sub_21F46EE8C(v0[15], v0[16]);
  sub_21F46EE8C(v1, v2);
  uint64_t v3 = (void *)v0[19];
  (*(void (**)(void, void, void))(v0[4] + 104))(v0[5], *MEMORY[0x263F36418], v0[3]);
  id v4 = v3;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_21F51F330()
{
  v1[2] = v0;
  uint64_t v2 = sub_21F550540();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_21F550C20();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F51F44C, 0, 0);
}

uint64_t sub_21F51F44C()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F551790();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Fetching biometric binding attestations", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)v0[2];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = v7[4];
  uint64_t v9 = v7[5];
  __swift_project_boxed_opaque_existential_1(v7 + 1, v8);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v9 + 8) + **(int **)(v9 + 8));
  uint64_t v10 = (void *)swift_task_alloc();
  v0[9] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_21F51F5F0;
  return v12(v8, v9);
}

uint64_t sub_21F51F5F0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_21F51FA38;
  }
  else {
    uint64_t v4 = sub_21F51F704;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21F51F704()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[4];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_1(v1 + 1, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_21F51F808;
  return v6(v2, v3);
}

uint64_t sub_21F51F808(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 104) = a1;
  *(void *)(v3 + 112) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_21F51FBC8;
  }
  else {
    uint64_t v4 = sub_21F51F91C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21F51F91C()
{
  uint64_t v1 = *(void **)(v0 + 80);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_attestationData);
    uint64_t v3 = sub_21F54EC00();
    unint64_t v5 = v4;

    uint64_t v6 = *(void **)(v0 + 104);
    if (v6)
    {
LABEL_3:
      id v7 = objc_msgSend(v6, sel_attestationData);
      uint64_t v8 = sub_21F54EC00();
      unint64_t v10 = v9;

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xF000000000000000;
    uint64_t v6 = *(void **)(v0 + 104);
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
LABEL_6:

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t))(v0 + 8);
  return v11(v3, v5, v8, v10);
}

uint64_t sub_21F51FA38()
{
  uint64_t v1 = (void *)v0[11];
  (*(void (**)(void, void, void))(v0[4] + 104))(v0[5], *MEMORY[0x263F36418], v0[3]);
  id v2 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_21F51FBC8()
{
  uint64_t v1 = *(void **)(v0 + 112);
  (*(void (**)(void, void, void))(*(void *)(v0 + 32) + 104))(*(void *)(v0 + 40), *MEMORY[0x263F36418], *(void *)(v0 + 24));
  id v2 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21F51FD60()
{
  id v2 = *v0;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_21F51FE5C;
  uint64_t v3 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_21F51FF9C;
  v1[13] = &block_descriptor_23_0;
  v1[14] = v3;
  objc_msgSend(v2, sel_getGlobalProgenitorKeyAttestation_, v1 + 10);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_21F51FE5C()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48))
  {
    swift_willThrow();
    id v2 = *(uint64_t (**)(void))(v1 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = *(void *)(*v0 + 120);
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v1 + 8);
    return v5(v4);
  }
}

uint64_t sub_21F51FF9C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE638);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_21F5211C8((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_21F520060()
{
  id v2 = *v0;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_21F523664;
  uint64_t v3 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_21F51FF9C;
  v1[13] = &block_descriptor_21;
  v1[14] = v3;
  objc_msgSend(v2, sel_getGlobalThirdPartyProgenitorKeyAttestation_, v1 + 10);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_21F52015C()
{
  id v2 = *v0;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_21F520258;
  uint64_t v3 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_21F520398;
  v1[13] = &block_descriptor_19;
  v1[14] = v3;
  objc_msgSend(v2, sel_bioBindingUnboundACL_, v1 + 10);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_21F520258()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  if (*(void *)(*v0 + 48))
  {
    swift_willThrow();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    uint64_t v5 = *(void *)(v1 + 120);
    uint64_t v6 = *(void *)(v1 + 128);
    id v7 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
    return v7(v5, v6);
  }
}

uint64_t sub_21F520398(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE638);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = sub_21F54EC00();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_21F52046C()
{
  uint64_t v2 = *v0;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_21F523670;
  uint64_t v3 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_21F520398;
  v1[13] = &block_descriptor_17;
  v1[14] = v3;
  objc_msgSend(v2, sel_passcodeBindingUnboundACL_, v1 + 10);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_21F520568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t v7 = sub_21F54EBF0();
  v4[15] = v7;
  v4[2] = v4;
  v4[3] = sub_21F52067C;
  uint64_t v8 = swift_continuation_init();
  v4[10] = MEMORY[0x263EF8330];
  v4[11] = 0x40000000;
  v4[12] = sub_21F534790;
  v4[13] = &block_descriptor_15;
  v4[14] = v8;
  objc_msgSend(v6, sel_setGlobalAuthACL_ofType_completion_, v7, a3, v4 + 10);
  return MEMORY[0x270FA23F0](v4 + 2);
}

uint64_t sub_21F52067C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void **)(*v0 + 120);
  if (*(void *)(v1 + 48)) {
    swift_willThrow();
  }

  uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
  return v4();
}

uint64_t sub_21F52079C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267EE0330 + dword_267EE0330);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21F4B99C8;
  return v7(a1, a2);
}

uint64_t sub_21F520858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  if (a2) {
    uint64_t v6 = sub_21F5514E0();
  }
  else {
    uint64_t v6 = 0;
  }
  v3[16] = v6;
  v3[2] = v3;
  v3[7] = v3 + 15;
  v3[3] = sub_21F5209A4;
  uint64_t v7 = swift_continuation_init();
  v3[10] = MEMORY[0x263EF8330];
  v3[11] = 0x40000000;
  v3[12] = sub_21F4727C8;
  v3[13] = &block_descriptor_13;
  v3[14] = v7;
  objc_msgSend(v4, sel_evaluatePolicy_options_reply_, a1, v6, v3 + 10);
  return MEMORY[0x270FA23F0](v3 + 2);
}

uint64_t sub_21F5209A4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *v0;
  uint64_t v4 = *(void **)(*v0 + 128);
  if (*(void *)(v1 + 48))
  {
    swift_willThrow();

    uint64_t v5 = *(uint64_t (**)(void))(v3 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v2 + 120);

    uint64_t v8 = *(uint64_t (**)(uint64_t))(v3 + 8);
    return v8(v7);
  }
}

uint64_t sub_21F520B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_267EE0328 + dword_267EE0328);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_21F52366C;
  return v9(a1, a2, a3);
}

uint64_t destroy for BiometricBindingEnrollmentProvider(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);

  return swift_release();
}

uint64_t initializeWithCopy for BiometricBindingEnrollmentProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a2 + 8;
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 8, v4, v6);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_retain();
  return a1;
}

void *assignWithCopy for BiometricBindingEnrollmentProvider(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  uint64_t v4 = a2[7];
  a1[6] = a2[6];
  a1[7] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        id result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *id result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BiometricBindingEnrollmentProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BiometricBindingEnrollmentProvider(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BiometricBindingEnrollmentProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiometricBindingEnrollmentProvider()
{
  return &type metadata for BiometricBindingEnrollmentProvider;
}

uint64_t sub_21F521074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  if (a3) {
    uint64_t v8 = sub_21F5514E0();
  }
  else {
    uint64_t v8 = 0;
  }
  v4[16] = v8;
  v4[2] = v4;
  v4[7] = v4 + 15;
  v4[3] = sub_21F523668;
  uint64_t v9 = swift_continuation_init();
  v4[10] = MEMORY[0x263EF8330];
  v4[11] = 0x40000000;
  v4[12] = sub_21F4727C8;
  v4[13] = &block_descriptor_2;
  v4[14] = v9;
  objc_msgSend(v5, sel_evaluateAccessControl_operation_options_reply_, a1, a2, v8, v4 + 10);
  return MEMORY[0x270FA23F0](v4 + 2);
}

uint64_t sub_21F5211C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F521230@<X0>(void *a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10468]), sel_init);
  unint64_t result = sub_21F521284();
  a1[3] = result;
  a1[4] = &off_26D0E25A8;
  *a1 = v2;
  return result;
}

unint64_t sub_21F521284()
{
  unint64_t result = qword_267EE0340;
  if (!qword_267EE0340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_267EE0340);
  }
  return result;
}

uint64_t sub_21F5212C4()
{
  v1[2] = v0;
  uint64_t v2 = sub_21F550540();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_21F550C20();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F5213F0, 0, 0);
}

uint64_t sub_21F5213F0()
{
  uint64_t v1 = **(void **)(v0 + 16);
  if ((*(uint64_t (**)(void))(*(void *)v1 + 104))())
  {
    sub_21F54EF20();
    uint64_t v2 = sub_21F550C10();
    os_log_type_t v3 = sub_21F5517A0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21F464000, v2, v3, "Using bio binding unbound acl", v4, 2u);
      MEMORY[0x223C4F110](v4, -1, -1);
    }
    uint64_t v5 = *(void *)(v0 + 72);
    uint64_t v6 = *(void *)(v0 + 48);
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t v8 = *(void **)(v0 + 16);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    uint64_t v9 = v8[4];
    uint64_t v10 = v8[5];
    __swift_project_boxed_opaque_existential_1(v8 + 1, v9);
    id v27 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v10 + 24) + **(int **)(v10 + 24));
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_21F5218B8;
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    char v14 = v27;
    return v14(v12, v13);
  }
  if ((*(uint64_t (**)(void))(*(void *)v1 + 96))())
  {
    sub_21F54EF20();
    uint64_t v16 = sub_21F550C10();
    os_log_type_t v17 = sub_21F5517A0();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_21F464000, v16, v17, "Using passcode binding unbound acl", v18, 2u);
      MEMORY[0x223C4F110](v18, -1, -1);
    }
    uint64_t v20 = *(void *)(v0 + 56);
    uint64_t v19 = *(void *)(v0 + 64);
    uint64_t v21 = *(void *)(v0 + 48);
    id v22 = *(void **)(v0 + 16);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    uint64_t v23 = v22[4];
    uint64_t v24 = v22[5];
    __swift_project_boxed_opaque_existential_1(v22 + 1, v23);
    id v28 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v24 + 32) + **(int **)(v24 + 32));
    id v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v25;
    *id v25 = v0;
    v25[1] = sub_21F521A30;
    uint64_t v12 = v23;
    uint64_t v13 = v24;
    char v14 = v28;
    return v14(v12, v13);
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 32) + 104))(*(void *)(v0 + 40), *MEMORY[0x263F36590], *(void *)(v0 + 24));
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_21F5218B8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }
  return v10(v7, v8, v9);
}

uint64_t sub_21F521A30(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
    uint64_t v9 = 2;
  }
  return v10(v7, v8, v9);
}

uint64_t sub_21F521BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[30] = a6;
  v7[31] = v6;
  v7[28] = a4;
  v7[29] = a5;
  v7[26] = a2;
  v7[27] = a3;
  v7[25] = a1;
  uint64_t v8 = sub_21F550C20();
  v7[32] = v8;
  v7[33] = *(void *)(v8 - 8);
  v7[34] = swift_task_alloc();
  v7[35] = swift_task_alloc();
  v7[36] = swift_task_alloc();
  uint64_t v9 = sub_21F550540();
  v7[37] = v9;
  v7[38] = *(void *)(v9 - 8);
  v7[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F521CEC, 0, 0);
}

uint64_t sub_21F521CEC()
{
  uint64_t v23 = v0;
  type metadata accessor for SecAccessControl(0);
  uint64_t v1 = sub_21F5518B0();
  v0[40] = v1;
  uint64_t v2 = (void *)v1;
  uint64_t v3 = v0[30];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE658);
  uint64_t inited = swift_initStackObject();
  *(_DWORD *)(inited + 32) = 1011;
  *(_OWORD *)(inited + 16) = xmmword_21F5546A0;
  *(void *)(inited + 64) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 40) = 0;
  *(_DWORD *)(inited + 72) = 1003;
  *(void *)(inited + 104) = MEMORY[0x263F8E548];
  *(_DWORD *)(inited + 80) = 0x7FFFFFFF;
  unint64_t v5 = sub_21F474800(inited);
  swift_setDeallocating();
  id v6 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE660);
  swift_arrayDestroy();
  v0[21] = v5;
  uint64_t v7 = MEMORY[0x263F8D310];
  if (v3)
  {
    uint64_t v9 = v0[29];
    uint64_t v8 = v0[30];
    uint64_t v22 = MEMORY[0x263F8D310];
    uint64_t v20 = v9;
    uint64_t v21 = v8;
    swift_bridgeObjectRetain();
    sub_21F471A34((uint64_t)&v20, 2u);
  }
  uint64_t v10 = v0[28];
  if (v10)
  {
    uint64_t v11 = v0[27];
    uint64_t v22 = v7;
    uint64_t v20 = v11;
    uint64_t v21 = v10;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21F471A34((uint64_t)&v20, 0x406u);
  }
  (*(void (**)(uint64_t))(v0[31] + 48))(v10);
  uint64_t v12 = v0[19];
  uint64_t v13 = v0[20];
  __swift_project_boxed_opaque_existential_1(v0 + 16, v12);
  v0[41] = v0[21];
  id v14 = v6;
  uint64_t v15 = swift_bridgeObjectRetain();
  uint64_t v16 = sub_21F471B38(v15);
  v0[42] = v16;
  swift_bridgeObjectRelease();
  uint64_t v19 = (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 + 16) + **(int **)(v13 + 16));
  os_log_type_t v17 = (void *)swift_task_alloc();
  v0[43] = v17;
  *os_log_type_t v17 = v0;
  v17[1] = sub_21F5220D0;
  return v19(v6, 3, v16, v12, v13);
}

uint64_t sub_21F5220D0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 352) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void **)(v2 + 320);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21F522330;
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21F522240;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

void sub_21F522240()
{
  uint64_t v1 = *(void **)(v0 + 320);
  uint64_t v2 = (void *)SecAccessControlCopyData();

  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + 320);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21F54EC00();
    uint64_t v6 = v5;

    __swift_destroy_boxed_opaque_existential_0(v0 + 128);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
    v7(v4, v6);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21F522330()
{
  uint64_t v1 = (void *)v0[44];
  type metadata accessor for Code(0);
  v0[22] = -8;
  id v2 = v1;
  sub_21F52361C(&qword_267EDE4E8, type metadata accessor for Code);
  char v3 = sub_21F54EAE0();

  if (v3)
  {
    sub_21F54EF20();
    uint64_t v4 = sub_21F550C10();
    os_log_type_t v5 = sub_21F5517B0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21F464000, v4, v5, "Biometry lockout detected", v6, 2u);
      MEMORY[0x223C4F110](v6, -1, -1);
    }
    uint64_t v7 = v0[36];
    uint64_t v8 = v0[32];
    uint64_t v9 = v0[33];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[45] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_21F522984;
    return sub_21F522E58();
  }
  else
  {
    v0[23] = -2;
    uint64_t v12 = (void *)v0[44];
    id v13 = v12;
    char v14 = sub_21F54EAE0();

    if (v14)
    {
      sub_21F54EF20();
      uint64_t v15 = sub_21F550C10();
      os_log_type_t v16 = sub_21F5517B0();
      if (os_log_type_enabled(v15, v16))
      {
        os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v17 = 0;
        _os_log_impl(&dword_21F464000, v15, v16, "Biometry user cancelled", v17, 2u);
        MEMORY[0x223C4F110](v17, -1, -1);
      }
      id v18 = (void *)v0[44];
      uint64_t v19 = v0[39];
      uint64_t v20 = (void *)v0[40];
      uint64_t v21 = v0[37];
      uint64_t v22 = v0[38];
      uint64_t v23 = v0[35];
      uint64_t v24 = v0[32];
      uint64_t v25 = v0[33];

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
      (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v19, *MEMORY[0x263F364C0], v21);
      id v26 = v18;
      sub_21F4BA81C(MEMORY[0x263F8EE78]);
      sub_21F550550();
      sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      swift_allocError();
    }
    else
    {
      id v27 = (void *)v0[44];
      v0[24] = -4;
      id v28 = v27;
      char v29 = sub_21F54EAE0();

      if (v29)
      {
        sub_21F54EF20();
        CGRect v30 = sub_21F550C10();
        os_log_type_t v31 = sub_21F5517B0();
        if (os_log_type_enabled(v30, v31))
        {
          CGFloat v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)CGFloat v32 = 0;
          _os_log_impl(&dword_21F464000, v30, v31, "Biometry system cancelled", v32, 2u);
          MEMORY[0x223C4F110](v32, -1, -1);
        }
        id v18 = (void *)v0[44];
        uint64_t v33 = v0[39];
        uint64_t v20 = (void *)v0[40];
        uint64_t v34 = v0[37];
        uint64_t v35 = v0[38];
        uint64_t v37 = v0[33];
        uint64_t v36 = v0[34];
        uint64_t v38 = v0[32];

        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
        (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v33, *MEMORY[0x263F364F0], v34);
        id v39 = v18;
        sub_21F4BA81C(MEMORY[0x263F8EE78]);
        sub_21F550550();
        sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
        swift_allocError();
      }
      else
      {
        id v18 = (void *)v0[44];
        uint64_t v20 = (void *)v0[40];
        (*(void (**)(void, void, void))(v0[38] + 104))(v0[39], *MEMORY[0x263F36508], v0[37]);
        id v40 = v18;
        sub_21F4BA81C(MEMORY[0x263F8EE78]);
        sub_21F550550();
        sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
        swift_allocError();
      }
    }
    sub_21F550560();
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 16));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v41 = (uint64_t (*)(void))v0[1];
    return v41();
  }
}

uint64_t sub_21F522984()
{
  id v2 = (void *)*v1;
  v2[46] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_21F522D00, 0, 0);
  }
  else
  {
    char v3 = (void *)swift_task_alloc();
    v2[47] = v3;
    *char v3 = v2;
    v3[1] = sub_21F522B00;
    uint64_t v4 = v2[30];
    uint64_t v5 = v2[28];
    uint64_t v6 = v2[29];
    uint64_t v7 = v2[26];
    uint64_t v8 = v2[27];
    uint64_t v9 = v2[25];
    return sub_21F521BA8(v9, v7, v8, v5, v6, v4);
  }
}

uint64_t sub_21F522B00(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 384) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_21F522DAC;
  }
  else
  {
    *(void *)(v6 + 392) = a2;
    *(void *)(v6 + 400) = a1;
    uint64_t v7 = sub_21F522C34;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_21F522C34()
{
  uint64_t v1 = *(void **)(v0 + 352);

  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v2 = *(void *)(v0 + 400);
  __swift_destroy_boxed_opaque_existential_0(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v4(v2, v3);
}

uint64_t sub_21F522D00()
{
  uint64_t v1 = *(void **)(v0 + 352);

  __swift_destroy_boxed_opaque_existential_0(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21F522DAC()
{
  uint64_t v1 = *(void **)(v0 + 352);

  __swift_destroy_boxed_opaque_existential_0(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21F522E58()
{
  v1[20] = v0;
  uint64_t v2 = sub_21F550540();
  v1[21] = v2;
  v1[22] = *(void *)(v2 - 8);
  v1[23] = swift_task_alloc();
  sub_21F54EC30();
  v1[24] = swift_task_alloc();
  sub_21F551550();
  v1[25] = swift_task_alloc();
  uint64_t v3 = sub_21F550C20();
  v1[26] = v3;
  v1[27] = *(void *)(v3 - 8);
  v1[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F522FCC, 0, 0);
}

uint64_t sub_21F522FCC()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Managing bio lockout", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 160);

  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t))(v7 + 48))(v8);
  uint64_t v9 = *(void *)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 152);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 120), v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE628);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21F554510;
  *(_DWORD *)(v0 + 256) = 1030;
  sub_21F551A40();
  sub_21F551540();
  if (qword_267EDE2E0 != -1) {
    swift_once();
  }
  id v12 = (id)qword_267EE25A0;
  sub_21F54EC20();
  uint64_t v13 = sub_21F5515C0();
  *(void *)(inited + 96) = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = v13;
  *(void *)(inited + 80) = v14;
  unint64_t v15 = sub_21F47161C(inited);
  *(void *)(v0 + 232) = v15;
  id v18 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(v10 + 8) + **(int **)(v10 + 8));
  os_log_type_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v16;
  *os_log_type_t v16 = v0;
  v16[1] = sub_21F523298;
  return v18(2, v15, v9, v10);
}

uint64_t sub_21F523298()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v2 = sub_21F523460;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    os_log_type_t v2 = sub_21F5233C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F5233C8()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 120);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21F523460()
{
  uint64_t v1 = (void *)v0[31];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F36578], v4);
  id v5 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F52361C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  swift_allocError();
  sub_21F550560();
  swift_willThrow();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 15));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_21F52361C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21F523674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  swift_retain_n();
  uint64_t v10 = sub_21F550C10();
  os_log_type_t v11 = sub_21F5517D0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v19 = v6;
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v13;
    *(_DWORD *)id v12 = 136315138;
    uint64_t v14 = (uint64_t *)(*(void *)(v5 + 24) + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    if (v14[1])
    {
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
    }
    else
    {
      unint64_t v16 = 0xE300000000000000;
      uint64_t v15 = 7104878;
    }
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_21F4BAC68(v15, v16, &v25);
    sub_21F551970();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F464000, v10, v11, "State: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v13, -1, -1);
    MEMORY[0x223C4F110](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_21F550100();
  (*(uint64_t (**)(void))(**(void **)(v5 + 48) + 96))();
  sub_21F54FFC0();
  swift_bridgeObjectRetain();
  sub_21F5500B0();
  sub_21F54F980();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F5239A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F551470();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F5514A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550C20();
  uint64_t v25 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v0 + 48);
  if (((*(uint64_t (**)(uint64_t))(*(void *)v14 + 112))(v11) & 1) != 0
    && ((*(uint64_t (**)(void))(*(void *)v14 + 104))() & 1) == 0)
  {
    sub_21F54EF20();
    uint64_t v18 = sub_21F550C10();
    os_log_type_t v19 = sub_21F5517A0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_21F464000, v18, v19, "The user is eligible to proof but have not enabled the biometrics. Show setup biometrics alert", v20, 2u);
      MEMORY[0x223C4F110](v20, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v13, v10);
    uint64_t v21 = *(void **)(v1 + 64);
    if (v21)
    {
      uint64_t v22 = swift_allocObject();
      swift_weakInit();
      id v23 = v21;
      swift_retain();
      sub_21F52538C(v23, (uint64_t)sub_21F5261B8, v22);

      return swift_release_n();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_21F475E60();
    uint64_t v15 = (void *)sub_21F551850();
    aBlock[4] = sub_21F52619C;
    aBlock[5] = v1;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21F46FC24;
    aBlock[3] = &block_descriptor_48_0;
    unint64_t v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_21F551490();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21F4D66A8((unint64_t *)&qword_267EDEC80, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE0060);
    sub_21F46EEEC();
    sub_21F551A00();
    MEMORY[0x223C4E340](0, v9, v5, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

uint64_t sub_21F523E18()
{
  uint64_t v0 = sub_21F551470();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21F5514A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F550C20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v13 = Strong;
    sub_21F475E60();
    uint64_t v14 = (void *)sub_21F551850();
    aBlock[4] = (uint64_t)sub_21F52619C;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21F46FC24;
    aBlock[3] = (uint64_t)&block_descriptor_52;
    uint64_t v15 = _Block_copy(aBlock);
    uint64_t v23 = v4;
    unint64_t v16 = v15;
    swift_retain();
    swift_release();
    sub_21F551490();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21F4D66A8((unint64_t *)&qword_267EDEC80, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE0060);
    sub_21F46EEEC();
    sub_21F551A00();
    MEMORY[0x223C4E340](0, v7, v3, v16);
    _Block_release(v16);
    swift_release();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v23);
  }
  else
  {
    sub_21F54EF20();
    uint64_t v18 = sub_21F550C10();
    os_log_type_t v19 = sub_21F5517A0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      aBlock[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      void aBlock[6] = sub_21F4BAC68(0xD00000000000001CLL, 0x800000021F55E250, aBlock);
      sub_21F551970();
      _os_log_impl(&dword_21F464000, v18, v19, "self doesn't exist inside %s's showHSA2Alert closure. Exiting...", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v21, -1, -1);
      MEMORY[0x223C4F110](v20, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_21F524278(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 64);
  swift_retain();
  id v2 = objc_msgSend(v1, sel_navigationController);
  sub_21F53447C(v2, 2, 0, 0);
  swift_release();
}

uint64_t sub_21F5242F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v57 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v54 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v54 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v54 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v54 - v15;
  sub_21F54EF20();
  os_log_type_t v17 = sub_21F550C10();
  os_log_type_t v18 = sub_21F5517A0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = v2;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_21F464000, v17, v18, "Checking if the account is in good standing, before proceeding to the next UI", v20, 2u);
    uint64_t v21 = v20;
    uint64_t v2 = v19;
    MEMORY[0x223C4F110](v21, -1, -1);
  }

  uint64_t v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v16, v2);
  if ((*(unsigned char *)(*(void *)(v1 + 24)
                 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig) & 1) == 0)
  {
    sub_21F54EF20();
    uint64_t v23 = sub_21F550C10();
    os_log_type_t v24 = sub_21F5517A0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = v22;
      id v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_21F464000, v23, v24, "Did not prefetch liveness config, initiating a new one", v26, 2u);
      id v27 = v26;
      uint64_t v22 = v25;
      MEMORY[0x223C4F110](v27, -1, -1);
    }

    v22(v14, v2);
    swift_retain();
    sub_21F53E098();
    swift_release();
  }
  uint64_t result = sub_21F525C94();
  char v29 = (void *)result;
  if (v30)
  {
    v56 = v22;
    id v34 = (id)result;
    sub_21F54EF20();
    id v35 = v29;
    id v36 = v29;
    uint64_t v37 = sub_21F550C10();
    os_log_type_t v38 = sub_21F5517A0();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v55 = v2;
      uint64_t v41 = v40;
      uint64_t v59 = v40;
      *(_DWORD *)id v39 = 136315138;
      v54 = v39 + 4;
      swift_getErrorValue();
      uint64_t v42 = sub_21F551C60();
      uint64_t v58 = sub_21F4BAC68(v42, v43, &v59);
      sub_21F551970();
      swift_bridgeObjectRelease();
      sub_21F52613C(v29, 1);
      sub_21F52613C(v29, 1);
      _os_log_impl(&dword_21F464000, v37, v38, "received an error from the account verification request %s", v39, 0xCu);
      swift_arrayDestroy();
      uint64_t v44 = v41;
      uint64_t v2 = v55;
      MEMORY[0x223C4F110](v44, -1, -1);
      MEMORY[0x223C4F110](v39, -1, -1);
    }
    else
    {
      sub_21F52613C(v29, 1);
      sub_21F52613C(v29, 1);
    }

    double v49 = v8;
    v50 = (uint64_t (*)(char *, uint64_t))v56;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v56)(v49, v2);
    CGRect v51 = *(void **)(v1 + 64);
    if (v51)
    {
      swift_retain();
      id v52 = v51;
      sub_21F535CCC(v52);
      swift_release();

      v53 = v57;
      sub_21F54EF20();
      sub_21F54EF30();
      sub_21F52613C(v29, 1);
      sub_21F52613C(v29, 1);
      return v50(v53, v2);
    }
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result)
  {
    id v45 = *(void **)(v1 + 64);
    if (v45)
    {
      uint64_t v46 = swift_allocObject();
      swift_weakInit();
      double v47 = (void *)swift_allocObject();
      v47[2] = v46;
      v47[3] = sub_21F526148;
      v47[4] = v1;
      swift_retain_n();
      swift_retain();
      id v48 = v45;
      swift_retain();
      sub_21F535CE8(v48, (uint64_t)sub_21F526190, (uint64_t)v47);
      swift_release();
      swift_release();

      swift_release();
      return swift_release();
    }
    goto LABEL_21;
  }
  sub_21F54EF20();
  os_log_type_t v31 = sub_21F550C10();
  os_log_type_t v32 = sub_21F5517A0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_21F464000, v31, v32, "Account in good standing navigate to next view", v33, 2u);
    MEMORY[0x223C4F110](v33, -1, -1);
  }

  v22(v11, v2);
  return sub_21F5239A8();
}

uint64_t sub_21F52490C(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v7 = sub_21F550C20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v40 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v40 - v15;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v18 = Strong;
    if (!a1)
    {
      a3(1);
      return swift_release();
    }
    uint64_t v44 = a4;
    id v19 = a1;
    sub_21F54EF20();
    id v20 = a1;
    id v21 = a1;
    uint64_t v22 = sub_21F550C10();
    os_log_type_t v23 = sub_21F5517A0();
    BOOL v24 = os_log_type_enabled(v22, v23);
    unint64_t v43 = a3;
    if (v24)
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v41 = v8;
      uint64_t v27 = v26;
      uint64_t v46 = v26;
      uint64_t v42 = v7;
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v40 = v25 + 4;
      swift_getErrorValue();
      uint64_t v28 = sub_21F551C60();
      uint64_t v45 = sub_21F4BAC68(v28, v29, &v46);
      uint64_t v7 = v42;
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v22, v23, "received an error from the hsa2 upgrade flow %s", v25, 0xCu);
      swift_arrayDestroy();
      uint64_t v30 = v27;
      uint64_t v8 = v41;
      MEMORY[0x223C4F110](v30, -1, -1);
      MEMORY[0x223C4F110](v25, -1, -1);
    }
    else
    {
    }
    uint64_t v37 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    uint64_t result = v37(v14, v7);
    os_log_type_t v38 = *(void **)(v18 + 64);
    if (v38)
    {
      swift_retain();
      id v39 = v38;
      sub_21F535CCC(v39);
      swift_release();

      sub_21F54EF20();
      sub_21F54EF30();
      v37(v11, v7);
      v43(0);

      return swift_release();
    }
    __break(1u);
  }
  else
  {
    sub_21F54EF20();
    os_log_type_t v31 = sub_21F550C10();
    os_log_type_t v32 = sub_21F5517A0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = v8;
      id v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v46 = v35;
      *(_DWORD *)id v34 = 136315138;
      uint64_t v45 = sub_21F4BAC68(0xD00000000000001ALL, 0x800000021F55E180, &v46);
      sub_21F551970();
      _os_log_impl(&dword_21F464000, v31, v32, "self doesn't exist inside %s's showHSA2Alert closure. Exiting...", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v35, -1, -1);
      MEMORY[0x223C4F110](v34, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v16, v7);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v16, v7);
    }
  }
  return result;
}

id sub_21F524DAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F54EC30();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_21F551550();
  MEMORY[0x270FA5388](v3 - 8);
  sub_21F551540();
  if (qword_267EDE2E0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_267EE25A0;
  sub_21F54EC20();
  uint64_t v5 = sub_21F5515C0();
  uint64_t v7 = v6;
  if ((*(unsigned char *)(*(void *)(v0 + 24) + 136) & 2) != 0)
  {
    swift_bridgeObjectRelease();
    sub_21F551540();
    id v10 = (id)qword_267EE25A0;
    sub_21F54EC20();
    uint64_t v49 = sub_21F5515C0();
    uint64_t v7 = v11;
    sub_21F551540();
    id v12 = v10;
    sub_21F54EC20();
    uint64_t v8 = sub_21F5515C0();
    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v49 = v5;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  swift_retain();
  uint64_t v14 = sub_21F5295C8();
  unint64_t v48 = v15;
  swift_release();
  id v16 = *(id *)(v0 + 16);
  uint64_t v17 = sub_21F54F8D0();
  unint64_t v19 = v18;

  if (v19)
  {
    swift_retain();
    uint64_t v20 = sub_21F534070(v17, v19);
    uint64_t v22 = v21;
    swift_release();
    swift_bridgeObjectRelease();
    if (v22) {
      uint64_t v23 = v20;
    }
    else {
      uint64_t v23 = 0;
    }
    if (!v22) {
      uint64_t v22 = 0xE000000000000000;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v22 = 0xE000000000000000;
  }
  id v24 = *(id *)(v1 + 16);
  uint64_t v25 = sub_21F54F920();
  unint64_t v27 = v26;

  if (v27)
  {
    swift_retain();
    uint64_t v28 = sub_21F534070(v25, v27);
    uint64_t v47 = v1;
    uint64_t v29 = v22;
    uint64_t v30 = v23;
    uint64_t v31 = v7;
    uint64_t v32 = v14;
    uint64_t v33 = v9;
    uint64_t v34 = v8;
    uint64_t v36 = v35;
    swift_release();
    swift_bridgeObjectRelease();
    if (v36) {
      uint64_t v37 = v28;
    }
    else {
      uint64_t v37 = 0;
    }
    if (v36) {
      uint64_t v38 = v36;
    }
    else {
      uint64_t v38 = 0xE000000000000000;
    }
    uint64_t v8 = v34;
    uint64_t v9 = v33;
    uint64_t v14 = v32;
    uint64_t v7 = v31;
    uint64_t v23 = v30;
    uint64_t v22 = v29;
    uint64_t v1 = v47;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0xE000000000000000;
  }
  id v39 = objc_allocWithZone((Class)IdentityHeroViewControllerWrapper);
  id v40 = sub_21F525B58(v14, v48, v23, v22, v37, v38, v49, v7, v8, v9);
  v54 = sub_21F525C84;
  uint64_t v55 = v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v51 = 1107296256;
  id v52 = sub_21F46FC24;
  v53 = &block_descriptor_36;
  uint64_t v41 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v54 = sub_21F525C8C;
  uint64_t v55 = v1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v51 = 1107296256;
  id v52 = sub_21F46FC24;
  v53 = &block_descriptor_39;
  uint64_t v42 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v43 = objc_msgSend(v40, sel_identityHeroViewController_secondaryButtonClicked_, v41, v42);

  _Block_release(v42);
  _Block_release(v41);
  uint64_t v44 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = v43;
  id v45 = v43;

  return v45;
}

uint64_t sub_21F525294(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) + 136);
  if (v1)
  {
    uint64_t v2 = sub_21F550280();
    if ((v1 & 2) != 0)
    {
      uint64_t v5 = 0x6E41656E6F685069;
      uint64_t v4 = 0xEE00686374615764;
    }
    else
    {
      uint64_t v4 = 0x800000021F55E160;
      uint64_t v5 = 0xD00000000000001BLL;
    }
    sub_21F523674(v2, v3, v5, v4);
    swift_bridgeObjectRelease();
  }
  return sub_21F5242F4();
}

uint64_t sub_21F525328(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(v1 + 136);
  if ((v2 & 2) != 0) {
    *(void *)(v1 + 136) = v2 & 0xFFFFFFFFFFFFFFFDLL;
  }
  uint64_t v3 = sub_21F550280();
  sub_21F523674(v3, v4, 0xD000000000000018, 0x800000021F55E140);
  swift_bridgeObjectRelease();
  return sub_21F5242F4();
}

void sub_21F52538C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_21F54EC30();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_21F551550();
  MEMORY[0x270FA5388](v4 - 8);
  sub_21F54F050();
  swift_allocObject();
  sub_21F54F040();
  uint64_t v5 = sub_21F54F030();
  uint64_t v7 = v6;
  swift_release();
  sub_21F551540();
  if (qword_267EDE2E0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_267EE25A0;
  sub_21F54EC20();
  sub_21F5515C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE7B0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21F554510;
  *(void *)(v9 + 56) = MEMORY[0x263F8D310];
  unint64_t v10 = sub_21F47C6D4();
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v7;
  swift_bridgeObjectRetain();
  sub_21F5515B0();
  swift_bridgeObjectRelease();
  sub_21F551540();
  id v11 = (id)qword_267EE25A0;
  sub_21F54EC20();
  sub_21F5515C0();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_21F554510;
  *(void *)(v12 + 56) = MEMORY[0x263F8D310];
  *(void *)(v12 + 64) = v10;
  *(void *)(v12 + 32) = v5;
  *(void *)(v12 + 40) = v7;
  swift_bridgeObjectRetain();
  sub_21F5515B0();
  swift_bridgeObjectRelease();
  sub_21F551540();
  id v13 = (id)qword_267EE25A0;
  sub_21F54EC20();
  sub_21F5515C0();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_21F554510;
  *(void *)(v14 + 56) = MEMORY[0x263F8D310];
  *(void *)(v14 + 64) = v10;
  *(void *)(v14 + 32) = v5;
  *(void *)(v14 + 40) = v7;
  sub_21F5515B0();
  swift_bridgeObjectRelease();
  sub_21F551540();
  id v15 = (id)qword_267EE25A0;
  sub_21F54EC20();
  sub_21F5515C0();
  id v16 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v16, v17, 1);

  unint64_t v19 = (void *)swift_allocObject();
  v19[2] = v28;
  void v19[3] = a2;
  v19[4] = a3;
  swift_retain();
  swift_retain();
  uint64_t v20 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_21F525AFC;
  uint64_t v37 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_21F46C554;
  uint64_t v35 = &block_descriptor_28;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v22 = self;
  id v23 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v20, 0, v21);
  _Block_release(v21);

  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a2;
  *(void *)(v24 + 24) = a3;
  swift_retain();
  uint64_t v25 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_21F4F9EDC;
  uint64_t v37 = (void *)v24;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  uint64_t v34 = sub_21F46C554;
  uint64_t v35 = &block_descriptor_33;
  unint64_t v26 = _Block_copy(&aBlock);
  swift_release();
  id v27 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v25, 0, v26);
  _Block_release(v26);

  objc_msgSend(v18, sel_addAction_, v23);
  objc_msgSend(v18, sel_addAction_, v27);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v18, 1, 0);
}

uint64_t sub_21F5259CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  sub_21F494F00(a2 + 80, (uint64_t)v6);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_21F54F6D0();
  uint64_t v4 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return a3(v4);
}

uint64_t sub_21F525A48()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 80);
  return v0;
}

uint64_t sub_21F525AA0()
{
  sub_21F525A48();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentityHeroViewControllerProvider()
{
  return self;
}

uint64_t sub_21F525AFC(uint64_t a1)
{
  return sub_21F5259CC(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t block_copy_helper_25(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_25()
{
  return swift_release();
}

uint64_t sub_21F525B20()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_21F525B58(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v12 = (void *)sub_21F54EBF0();
  id v13 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  id v15 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  if (a10)
  {
    id v16 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = 0;
  }
  id v17 = objc_msgSend(v19, sel_initWithImageData_title_subtitle_primaryButtonTitle_secondaryButtonTitle_, v12, v13, v14, v15, v16);
  sub_21F46EE8C(a1, a2);

  return v17;
}

uint64_t sub_21F525C84()
{
  return sub_21F525294(v0);
}

uint64_t sub_21F525C8C()
{
  return sub_21F525328(v0);
}

uint64_t sub_21F525C94()
{
  uint64_t v0 = sub_21F550C20();
  v6[2] = *(void *)(v0 - 8);
  v6[3] = v0;
  MEMORY[0x270FA5388](v0);
  v6[1] = (char *)v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_21F550540();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = sub_21F550550();
  v6[0] = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE848);
  MEMORY[0x270FA5388](v4 - 8);
  sub_21F54F0C0();
  sub_21F54F0B0();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_21F54F970();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return 0;
}

void sub_21F52613C(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_21F526148(uint64_t result)
{
  if (result) {
    return sub_21F5239A8();
  }
  return result;
}

uint64_t sub_21F526154()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F526190(void *a1)
{
  return sub_21F52490C(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32));
}

void sub_21F52619C()
{
  sub_21F524278(v0);
}

uint64_t sub_21F5261B8()
{
  return sub_21F523E18();
}

void destroy for IdentityProofingReviewSubmissionViewConfiguration(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *_s9CoreIDVUI49IdentityProofingReviewSubmissionViewConfigurationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  id v4 = v3;
  return a1;
}

void *assignWithCopy for IdentityProofingReviewSubmissionViewConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v4 = (void *)a2[1];
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for IdentityProofingReviewSubmissionViewConfiguration(uint64_t a1, uint64_t a2)
{
  swift_release();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for IdentityProofingReviewSubmissionViewConfiguration()
{
  return &type metadata for IdentityProofingReviewSubmissionViewConfiguration;
}

void destroy for IdentityProofingDocumentConfirmation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s9CoreIDVUI36IdentityProofingDocumentConfirmationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for IdentityProofingDocumentConfirmation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

uint64_t assignWithTake for IdentityProofingDocumentConfirmation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityProofingDocumentConfirmation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentityProofingDocumentConfirmation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityProofingDocumentConfirmation()
{
  return &type metadata for IdentityProofingDocumentConfirmation;
}

uint64_t sub_21F5264E0()
{
  uint64_t v0 = (void *)sub_21F54F8E0();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0[2];
  if ((unint64_t)(v1 - 1) >= 2)
  {
    if (v1 == 3)
    {
      uint64_t v2 = v0[6];
      unint64_t v3 = v0[7];
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v2 = v0[4];
  unint64_t v3 = v0[5];
LABEL_6:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_21F534070(v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21F526588(uint64_t a1)
{
  uint64_t v2 = sub_21F550C20();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F550340();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)sub_21F54F8E0();
  id v13 = *(void **)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  if (v13)
  {
    id v14 = v13;
    id v15 = (void *)sub_21F54F760();

    if (v15)
    {

      uint64_t v16 = *(void *)(a1 + 176);
      if (v16)
      {
        if (*(void *)(v16 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v17 = sub_21F472B68(0xD000000000000015, 0x800000021F55E270);
          if (v18)
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(void *)(v16 + 56) + *(void *)(v6 + 72) * v17, v5);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, 1, 1, v5);
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, 1, 1, v5);
          swift_bridgeObjectRetain();
        }
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
        {
          sub_21F49C960((uint64_t)v11);
          swift_bridgeObjectRelease();
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
          sub_21F49C960((uint64_t)v11);
          swift_bridgeObjectRelease();
          uint64_t v24 = sub_21F550330();
          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          if (v24)
          {
            swift_bridgeObjectRelease();
            sub_21F54EF20();
            uint64_t v25 = sub_21F550C10();
            os_log_type_t v26 = sub_21F5517A0();
            if (os_log_type_enabled(v25, v26))
            {
              id v27 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v27 = 0;
              _os_log_impl(&dword_21F464000, v25, v26, "selecting unorderdUI messages for Passive Liveness", v27, 2u);
              MEMORY[0x223C4F110](v27, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v2);
            uint64_t v12 = (void *)v24;
            goto LABEL_12;
          }
        }
      }
    }
  }
  if (!v12) {
    return 0;
  }
LABEL_12:
  uint64_t v19 = v12[2];
  if (v19 == 1)
  {
    uint64_t v20 = v12[4];
    unint64_t v21 = v12[5];
    goto LABEL_18;
  }
  if (v19 == 2)
  {
    uint64_t v20 = v12[6];
    unint64_t v21 = v12[7];
    goto LABEL_18;
  }
  if (v19 != 3)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v20 = v12[8];
  unint64_t v21 = v12[9];
LABEL_18:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_21F534070(v20, v21);
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_21F5269BC(uint64_t a1, uint64_t a2)
{
  return sub_21F5269EC(a1, a2, MEMORY[0x263F361D0]);
}

uint64_t sub_21F5269D4(uint64_t a1, uint64_t a2)
{
  return sub_21F5269EC(a1, a2, MEMORY[0x263F361D8]);
}

uint64_t sub_21F5269EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3();
  if (v4)
  {
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  uint64_t v6 = sub_21F534070(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21F526A50()
{
  uint64_t v0 = sub_21F54EC30();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_21F551550();
  MEMORY[0x270FA5388](v1 - 8);
  sub_21F551540();
  if (qword_267EDE2E0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_267EE25A0;
  sub_21F54EC20();
  return sub_21F5515C0();
}

uint64_t sub_21F526B88()
{
  return 3;
}

ValueMetadata *type metadata accessor for DigitalPresentmentPlatter()
{
  return &type metadata for DigitalPresentmentPlatter;
}

uint64_t sub_21F526BA0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F526BC4()
{
  return sub_21F550F70();
}

uint64_t sub_21F526BE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21F550FC0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (_OWORD *)((char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_21F550BC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0370);
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267EDE388 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_267EE2630);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
  uint64_t v15 = sub_21F551390();
  char v16 = sub_21F551180();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0378);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v13, a1, v17);
  char v18 = &v13[*(int *)(v11 + 36)];
  *(void *)char v18 = v15;
  v18[8] = v16;
  uint64_t v19 = (char *)v6 + *(int *)(v4 + 20);
  uint64_t v20 = *MEMORY[0x263F19860];
  uint64_t v21 = sub_21F5510E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  __asm { FMOV            V0.2D, #10.0 }
  *uint64_t v6 = _Q0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0380);
  sub_21F48D71C((uint64_t)v6, a2 + *(int *)(v27 + 36));
  sub_21F526E8C((uint64_t)v13, a2);
  sub_21F48D780((uint64_t)v6);
  return sub_21F526EF4((uint64_t)v13);
}

uint64_t sub_21F526E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F526EF4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21F526F58()
{
  unint64_t result = qword_267EE0388;
  if (!qword_267EE0388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EE0380);
    sub_21F526FF8();
    sub_21F48D5A4(&qword_267EDEAC8, &qword_267EDEAD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EE0388);
  }
  return result;
}

unint64_t sub_21F526FF8()
{
  unint64_t result = qword_267EE0390;
  if (!qword_267EE0390)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EE0370);
    sub_21F48D5A4(&qword_267EE0398, &qword_267EE0378);
    sub_21F48D5A4(&qword_267EE03A0, &qword_267EE03A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EE0390);
  }
  return result;
}

void sub_21F5270BC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_21F54EB50();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id CIDVUIInternalIdentityProofingDataSharingFlowManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CIDVUIInternalIdentityProofingDataSharingFlowManager.init()()
{
  id v1 = objc_allocWithZone((Class)sub_21F5502E0());
  uint64_t v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  type metadata accessor for IdentityProofingDataSharingFlowManager();
  uint64_t v4 = swift_allocObject();
  *(void *)&v2[OBJC_IVAR____TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager_dataSharingFlowManager] = sub_21F52895C((uint64_t)v3, v4);

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_21F527290()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_21F5272B0, 0, 0);
}

uint64_t sub_21F5272B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_21F52734C;
  return sub_21F4978B0();
}

uint64_t sub_21F52734C(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_21F527488, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(a1 & 1);
  }
}

uint64_t sub_21F527488()
{
  uint64_t v1 = *(void **)(v0 + 32);
  sub_21F528AF0();
  sub_21F5515A0();
  sub_21F551910();
  swift_bridgeObjectRelease();
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(0);
}

uint64_t sub_21F5276C0(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return MEMORY[0x270FA2498](sub_21F527738, 0, 0);
}

uint64_t sub_21F527738()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_21F5277D4;
  return sub_21F4978B0();
}

uint64_t sub_21F5277D4(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_21F527940, 0, 0);
  }
  else
  {
    uint64_t v5 = *(void *)(v4 + 24);

    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, a1 & 1, 0);
    _Block_release(*(const void **)(v4 + 24));
    uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
    return v6();
  }
}

uint64_t sub_21F527940()
{
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  sub_21F528AF0();
  sub_21F5515A0();
  uint64_t v4 = (void *)sub_21F551910();
  swift_bridgeObjectRelease();
  swift_willThrow();

  uint64_t v5 = (void *)sub_21F54EB50();
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v5);

  _Block_release(*(const void **)(v0 + 24));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_21F527A50()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_21F527A70, 0, 0);
}

uint64_t sub_21F527A70()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_21F527B0C;
  return sub_21F497EB8();
}

uint64_t sub_21F527B0C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_21F527CF0;
  }
  else
  {
    *(void *)(v4 + 40) = a1;
    uint64_t v5 = sub_21F527C34;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F527C34()
{
  if (sub_21F550410() < 0) {
    return sub_21F551B30();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21F527CF0()
{
  uint64_t v1 = *(void **)(v0 + 32);
  sub_21F528AF0();
  sub_21F5515A0();
  sub_21F551910();
  swift_bridgeObjectRelease();
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21F527F24(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_21F527FE4;
  v5[2] = v4;
  return MEMORY[0x270FA2498](sub_21F527A70, 0, 0);
}

uint64_t sub_21F527FE4(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_21F54EB50();

    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, a1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_21F528170(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = sub_21F550400();
    if (v6) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a2;
    *(void *)(v8 + 24) = a3;
    swift_retain();
    sub_21F498678(v7, (uint64_t)sub_21F528B68, v8);
    return swift_release();
  }
  return result;
}

void sub_21F52821C(void *a1, void (*a2)(void))
{
  if (a1)
  {
    sub_21F528AF0();
    sub_21F5515A0();
    id v4 = a1;
    uint64_t v5 = (void *)sub_21F551910();
    swift_bridgeObjectRelease();
    id v6 = v5;
    ((void (*)(void *))a2)(v5);
  }
  else
  {
    a2();
  }
}

id CIDVUIInternalIdentityProofingDataSharingFlowManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21F52844C(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_21F47F180;
  return v6();
}

uint64_t sub_21F528518(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_21F47F180;
  return v7();
}

uint64_t sub_21F5285E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21F551710();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21F551700();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21F528EB4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21F5516B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21F528788(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21F528864;
  return v6(a1);
}

uint64_t sub_21F528864()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21F52895C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F550C20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54F9B0();
  swift_allocObject();
  *(void *)(a2 + 24) = sub_21F54F9A0();
  sub_21F54EF20();
  uint64_t v8 = sub_21F550C10();
  os_log_type_t v9 = sub_21F551790();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21F464000, v8, v9, "IdentityProofingDataSharingFlowManager creating xpc connection", v10, 2u);
    MEMORY[0x223C4F110](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(a2 + 16) = a1;
  return a2;
}

uint64_t type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager()
{
  return self;
}

unint64_t sub_21F528AF0()
{
  unint64_t result = qword_267EDE840;
  if (!qword_267EDE840)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EDE840);
  }
  return result;
}

uint64_t sub_21F528B30()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21F528B68(void *a1)
{
  sub_21F52821C(a1, *(void (**)(void))(v1 + 16));
}

uint64_t method lookup function for CIDVUIInternalIdentityProofingDataSharingFlowManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CIDVUIInternalIdentityProofingDataSharingFlowManager);
}

uint64_t dispatch thunk of CIDVUIInternalIdentityProofingDataSharingFlowManager.checkUserConsent()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x58);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21F4BCDA8;
  return v5();
}

uint64_t dispatch thunk of CIDVUIInternalIdentityProofingDataSharingFlowManager.fetchUserConsent()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21F4BCDA8;
  return v5();
}

uint64_t dispatch thunk of CIDVUIInternalIdentityProofingDataSharingFlowManager.didChangeUserConsent(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t sub_21F528DC4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F528E00()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_21F47F180;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_267EE03D8 + dword_267EE03D8);
  return v5(v2, v3);
}

uint64_t sub_21F528EB4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21F528F14(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21F47C4D4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267EE03F8 + dword_267EE03F8);
  return v6(a1, v4);
}

uint64_t sub_21F528FD0()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_21F47C4D4;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_267EE0408 + dword_267EE0408);
  return v5(v2, v3);
}

uint64_t sub_21F529090(void *a1, char a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v40 = a4;
  uint64_t v8 = sub_21F550C20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21F550540();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21F550550();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = v4;
  uint64_t v21 = *(void *)(v4 + 32);
  if (a2)
  {
    uint64_t v39 = v9;
    if ((*(void *)(v21 + 136) & 3) == 2)
    {
      swift_retain();
      sub_21F5358E0(a1);
      uint64_t result = swift_release();
      if (!a3) {
        return result;
      }
      return a3(result);
    }
    id v23 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v24 = v17;
    uint64_t v25 = v12;
    uint64_t v26 = v19;
    uint64_t v27 = v20;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F364D8], v25);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550560();
    uint64_t v28 = *(void *)(v27 + 32);
    sub_21F529570();
    uint64_t v29 = (void *)swift_allocError();
    uint64_t v37 = v23;
    uint64_t v38 = v26;
    uint64_t v30 = v24;
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v31, v23, v24);
    swift_retain();
    uint64_t v32 = v11;
    sub_21F54EF20();
    uint64_t v33 = sub_21F550C10();
    os_log_type_t v34 = sub_21F5517A0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_21F464000, v33, v34, "Invoked delegate to close the view", v35, 2u);
      uint64_t v36 = v35;
      uint64_t v32 = v11;
      MEMORY[0x223C4F110](v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v8);
    sub_21F53FC24();
    if (MEMORY[0x223C4F1E0](v28 + 96))
    {
      sub_21F4BA36C(v29);
      swift_unknownObjectRelease();
    }

    swift_release();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v37, v30);
    if (a3) {
      return a3(result);
    }
  }
  else
  {
    swift_retain();
    sub_21F542D00(a1, 0xD000000000000012, (void *)0x800000021F558EB0, 0, (uint64_t)a3, v40);
    return swift_release();
  }
  return result;
}

uint64_t sub_21F5294FC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RGBCaptureInteractor()
{
  return self;
}

unint64_t sub_21F529570()
{
  unint64_t result = qword_267EDE650;
  if (!qword_267EDE650)
  {
    sub_21F550550();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EDE650);
  }
  return result;
}

uint64_t sub_21F5295C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550BE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v0 + 32);
  if (v6)
  {
    swift_retain();
    uint64_t v7 = v6;
    unint64_t v8 = sub_21F54F860();
    sub_21F4B6904(v8);
    uint64_t v28 = v9;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v15 = v14;
    swift_release();
    swift_bridgeObjectRelease();
    sub_21F50C260();
    if (qword_267EDE3B0 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_267EE26A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
    uint64_t v17 = (UIImage *)sub_21F551930();
    uint64_t v18 = UIImagePNGRepresentation(v17);

    if (v18)
    {
      uint64_t v19 = sub_21F54EC00();
      unint64_t v21 = v20;
    }
    else
    {
      uint64_t v19 = 0;
      unint64_t v21 = 0xC000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_21F4DAFDC(v13, v15);
    sub_21F47F01C(v13, v15);
    if (v11)
    {
      swift_bridgeObjectRetain();
      sub_21F4DAFDC(v13, v15);
      swift_bridgeObjectRelease();
      if (v15 >> 60 != 15)
      {
        uint64_t v24 = (uint64_t *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData);
        swift_beginAccess();
        swift_retain();
        sub_21F4DAFDC(v13, v15);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v29 = *v24;
        *uint64_t v24 = 0x8000000000000000;
        sub_21F473DC8(v13, v15, v28, v11, isUniquelyReferenced_nonNull_native);
        *uint64_t v24 = v29;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_21F46EE8C(v19, v21);
        swift_bridgeObjectRelease();
        sub_21F47F01C(v13, v15);
        swift_release();

        return v13;
      }
      swift_bridgeObjectRelease();
      sub_21F47F01C(v13, v15);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_21F47F01C(v13, v15);
    }
  }
  else
  {
    sub_21F50C260();
    if (qword_267EDE3B0 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v2, (uint64_t)qword_267EE26A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v22, v2);
    id v23 = (UIImage *)sub_21F551930();
    uint64_t v7 = UIImagePNGRepresentation(v23);

    if (!v7) {
      return 0;
    }
    uint64_t v19 = sub_21F54EC00();
  }

  return v19;
}

uint64_t sub_21F529984()
{
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentityProofingImageAssetProvider()
{
  return self;
}

uint64_t type metadata accessor for UsingYourIDInteractor()
{
  return self;
}

id sub_21F529A14()
{
  return sub_21F529A6C(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray, &qword_267EDE340, (double *)&qword_267EE0438);
}

id sub_21F529A40()
{
  return sub_21F529A6C(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView, &qword_267EDE368, (double *)&qword_267EE0460);
}

id sub_21F529A6C(uint64_t *a1, void *a2, double *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    id v6 = *(id *)(v3 + *a1);
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v6, sel_setAxis_, 1);
    if (*a2 != -1) {
      swift_once();
    }
    objc_msgSend(v6, sel_setSpacing_, *a3);
    uint64_t v9 = *(void **)(v3 + v4);
    *(void *)(v3 + v4) = v6;

    uint64_t v5 = 0;
  }
  id v10 = v5;
  return v6;
}

id sub_21F529B44()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_setTextAlignment_, 1);
    objc_msgSend(v3, sel_setNumberOfLines_, 0);
    objc_msgSend(v3, sel_setLineBreakMode_, 0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;

    uint64_t v2 = 0;
  }
  id v5 = v2;
  return v3;
}

id sub_21F529C04()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_setTextAlignment_, 1);
    objc_msgSend(v3, sel_setNumberOfLines_, 0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;

    uint64_t v2 = 0;
  }
  id v5 = v2;
  return v3;
}

id sub_21F529CB0()
{
  return sub_21F52A0E8(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView, (Class *)0x263F82B88);
}

id sub_21F529CC4()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_init);
    objc_msgSend(v4, sel_setAxis_, 1);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setAlignment_, 3);
    if (qword_267EDE348 != -1) {
      swift_once();
    }
    objc_msgSend(v4, sel_setSpacing_, *(double *)&qword_267EE0440);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

unsigned char *sub_21F529DBC()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton);
  if (v2)
  {
    id v3 = *(unsigned char **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreIDVUIButton()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style] = 0;
    id v3 = v5;
    sub_21F4EF308();
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v4, sel_primaryButtonClicked, 64);
    id v6 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v3;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

unsigned char *sub_21F529E8C()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton);
  if (v2)
  {
    id v3 = *(unsigned char **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreIDVUIButton()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style] = 1;
    id v3 = v5;
    sub_21F4EF308();
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v4, sel_secondaryButtonClicked, 64);
    id v6 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v3;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

unsigned char *sub_21F529F60()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton);
  if (v2)
  {
    id v3 = *(unsigned char **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreIDVUIButton()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style] = 2;
    id v3 = v5;
    sub_21F4EF308();
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v4, sel_secondaryButtonClicked, 64);
    id v6 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v3;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_21F52A034()
{
  return sub_21F52A074(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption, (uint64_t (*)(void))sub_21F52DE0C);
}

id sub_21F52A054()
{
  return sub_21F52A074(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer, (uint64_t (*)(void))sub_21F52DED8);
}

id sub_21F52A074(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = (void *)a2();
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_21F52A0D4()
{
  return sub_21F52A0E8(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView, (Class *)0x263F82E00);
}

id sub_21F52A0E8(uint64_t *a1, Class *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = objc_msgSend(objc_allocWithZone(*a2), sel_init);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_21F52A168()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_setContentMode_, 1);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;

    uint64_t v2 = 0;
  }
  id v5 = v2;
  return v3;
}

void sub_21F52A200()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_navigationController);
  if (!v2) {
    return;
  }
  id v3 = v2;
  id v4 = objc_msgSend(v2, sel_viewControllers);

  sub_21F46EFD8(0, (unint64_t *)&qword_267EDEC30);
  unint64_t v5 = sub_21F551650();

  v22[0] = MEMORY[0x263F8EE78];
  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_21F551B50();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_16;
  }
LABEL_4:
  if (v6 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x223C4E570](i, v5);
    }
    else {
      id v8 = *(id *)(v5 + 8 * i + 32);
    }
    uint64_t v9 = v8;
    type metadata accessor for IdentityProofingViewController();
    if (swift_dynamicCastClass())
    {
      sub_21F551AD0();
      sub_21F551B00();
      sub_21F551B10();
      sub_21F551AE0();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = v22[0];
  if ((v22[0] & 0x8000000000000000) != 0) {
    goto LABEL_27;
  }
LABEL_17:
  if ((v10 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = *(void *)(v10 + 16);
    goto LABEL_19;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_21F551B50();
  swift_release();
LABEL_19:
  swift_release();
  if (v11 > 1)
  {
    sub_21F494F00((uint64_t)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration], (uint64_t)v22);
    uint64_t v12 = v23;
    uint64_t v13 = v24;
    __swift_project_boxed_opaque_existential_1(v22, v23);
    int v14 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v13 + 120))(v12, v13);
    if (v14)
    {
      if (v14 == 1)
      {
        id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, sel_cancelButtonClicked);
        uint64_t v16 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton;
        uint64_t v17 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton];
        *(void *)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = v15;

        id v18 = objc_msgSend(v1, sel_navigationItem);
        id v19 = *(id *)&v1[v16];
        objc_msgSend(v18, sel_setLeftBarButtonItem_, v19);

        id v20 = objc_msgSend(v1, sel_navigationItem);
        objc_msgSend(v20, sel_setHidesBackButton_, 1);
      }
      else
      {
        id v20 = objc_msgSend(v1, sel_navigationItem);
        objc_msgSend(v20, sel_setHidesBackButton_, 0);
      }
    }
    else
    {
      id v21 = objc_msgSend(v1, sel_navigationItem);
      objc_msgSend(v21, sel_setHidesBackButton_, 1);

      id v20 = objc_msgSend(v1, sel_navigationItem);
      objc_msgSend(v20, sel_setLeftBarButtonItem_, 0);
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  }
}

void sub_21F52A57C()
{
  uint64_t v1 = v0;
  objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
  id v2 = sub_21F529DBC();
  v2[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme] = 1;
  sub_21F4EF308();

  id v3 = sub_21F529E8C();
  v3[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme] = 1;
  sub_21F4EF308();

  id v4 = sub_21F529F60();
  v4[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme] = 1;
  sub_21F4EF308();

  unint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton];
  if (v5)
  {
    uint64_t v6 = self;
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_systemOrangeColor);
    objc_msgSend(v7, sel_setTintColor_, v8);
  }
  id v9 = objc_msgSend(v1, sel_navigationController);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = objc_msgSend(v9, sel_navigationBar);

    id v12 = objc_msgSend(self, sel_systemOrangeColor);
    objc_msgSend(v11, sel_setTintColor_, v12);
  }
}

void sub_21F52A71C()
{
  id v0 = sub_21F529B44();
  uint64_t v1 = self;
  uint64_t v2 = *MEMORY[0x263F83418];
  id v3 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F835E0], *MEMORY[0x263F83418]);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_pointSize);
    id v5 = objc_msgSend(v1, sel_systemFontOfSize_weight_);

    objc_msgSend(v0, sel_setFont_, v5);
    id v6 = sub_21F529B44();
    objc_msgSend(v6, sel_setAdjustsFontForContentSizeCategory_, 1);

    id v7 = sub_21F529C04();
    uint64_t v8 = *MEMORY[0x263F83570];
    id v9 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F83570], v2);
    objc_msgSend(v7, sel_setFont_, v9);

    id v10 = sub_21F529C04();
    objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);

    id v11 = sub_21F529F60();
    id v12 = objc_msgSend(v11, sel_titleLabel);

    if (v12)
    {
      id v13 = objc_msgSend(v1, sel_preferredFontForTextStyle_, v8);
      objc_msgSend(v13, sel_pointSize);
      id v14 = objc_msgSend(v1, sel_systemFontOfSize_weight_);

      objc_msgSend(v12, sel_setFont_, v14);
    }
    id v15 = sub_21F529DBC();
    id v16 = objc_msgSend(v15, sel_titleLabel);

    if (v16)
    {
      id v17 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F835D0], v2);
      objc_msgSend(v16, sel_setFont_, v17);
    }
    id v18 = sub_21F529E8C();
    id v19 = objc_msgSend(v18, sel_titleLabel);

    if (v19)
    {
      id v20 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v8, v2);
      objc_msgSend(v19, sel_setFont_, v20);
    }
    id v21 = sub_21F52A034();
    id v22 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F83590], v2);
    objc_msgSend(v21, sel_setFont_, v22);
  }
  else
  {
    __break(1u);
  }
}

void sub_21F52AA48()
{
  id v0 = sub_21F529A14();
  id v1 = objc_msgSend(v0, sel_subviews);

  sub_21F46EFD8(0, &qword_267EE0510);
  unint64_t v2 = sub_21F551650();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21F551B50();
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_41;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x223C4E570](i, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    id v6 = v5;
    objc_msgSend(v5, sel_removeFromSuperview);
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  id v7 = sub_21F529A14();
  objc_msgSend(v7, sel_removeFromSuperview);

  id v8 = sub_21F529CC4();
  id v9 = objc_msgSend(v8, sel_subviews);

  unint64_t v10 = sub_21F551650();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_21F551B50();
    if (!v11) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_19;
    }
  }
  if (v11 < 1)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  for (uint64_t j = 0; j != v11; ++j)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x223C4E570](j, v10);
    }
    else {
      id v13 = *(id *)(v10 + 8 * j + 32);
    }
    id v14 = v13;
    objc_msgSend(v13, sel_removeFromSuperview);
  }
LABEL_19:
  swift_bridgeObjectRelease_n();
  id v15 = sub_21F529CC4();
  objc_msgSend(v15, sel_removeFromSuperview);

  id v16 = sub_21F529CB0();
  id v17 = objc_msgSend(v16, sel_subviews);

  unint64_t v18 = sub_21F551650();
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_21F551B50();
    if (!v19) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v19) {
      goto LABEL_28;
    }
  }
  if (v19 < 1)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  for (uint64_t k = 0; k != v19; ++k)
  {
    if ((v18 & 0xC000000000000001) != 0) {
      id v21 = (id)MEMORY[0x223C4E570](k, v18);
    }
    else {
      id v21 = *(id *)(v18 + 8 * k + 32);
    }
    id v22 = v21;
    objc_msgSend(v21, sel_removeFromSuperview);
  }
LABEL_28:
  swift_bridgeObjectRelease_n();
  id v23 = sub_21F529CB0();
  objc_msgSend(v23, sel_removeFromSuperview);

  id v24 = sub_21F529A40();
  id v25 = objc_msgSend(v24, sel_subviews);

  unint64_t v26 = sub_21F551650();
  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_21F551B50();
    if (v27)
    {
LABEL_30:
      if (v27 >= 1)
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if ((v26 & 0xC000000000000001) != 0) {
            id v29 = (id)MEMORY[0x223C4E570](m, v26);
          }
          else {
            id v29 = *(id *)(v26 + 8 * m + 32);
          }
          uint64_t v30 = v29;
          objc_msgSend(v29, sel_removeFromSuperview);
        }
        goto LABEL_37;
      }
LABEL_43:
      __break(1u);
      return;
    }
  }
  else
  {
    uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v27) {
      goto LABEL_30;
    }
  }
LABEL_37:
  swift_bridgeObjectRelease_n();
  id v31 = sub_21F529A40();
  objc_msgSend(v31, sel_removeFromSuperview);
}

void sub_21F52AE64()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v3 = v2;
  id v4 = sub_21F529A14();
  objc_msgSend(v3, sel_addSubview_, v4);

  id v5 = sub_21F52A0D4();
  id v6 = sub_21F52A168();
  objc_msgSend(v5, sel_addSubview_, v6);

  id v7 = sub_21F529CB0();
  id v8 = sub_21F529CC4();
  objc_msgSend(v7, sel_addSubview_, v8);

  id v9 = objc_msgSend(v1, sel_view);
  if (!v9)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v10 = v9;
  id v11 = sub_21F529CB0();
  objc_msgSend(v10, sel_addSubview_, v11);

  sub_21F52CB98();
  id v12 = sub_21F529A40();
  id v13 = sub_21F529B44();
  objc_msgSend(v12, sel_addArrangedSubview_, v13);

  id v14 = sub_21F529A40();
  id v15 = sub_21F529C04();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  uint64_t v16 = (uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_21F494F00((uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v85);
  uint64_t v17 = v86;
  uint64_t v18 = v87;
  __swift_project_boxed_opaque_existential_1(v85, v86);
  LOBYTE(v15) = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 144))(v17, v18);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v85);
  if (v15)
  {
    id v19 = sub_21F529A40();
    id v20 = sub_21F529F60();
    objc_msgSend(v19, sel_addArrangedSubview_, v20);
  }
  id v21 = sub_21F529CC4();
  id v22 = sub_21F529A40();
  objc_msgSend(v21, sel_addArrangedSubview_, v22);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_21F556C80;
  id v24 = sub_21F529A14();
  id v25 = objc_msgSend(v24, sel_widthAnchor);

  id v26 = objc_msgSend(v1, sel_view);
  if (!v26) {
    goto LABEL_23;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(v26, sel_widthAnchor);

  if (qword_267EDE360 != -1) {
    swift_once();
  }
  id v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v28, -*(double *)&qword_267EE0458);

  *(void *)(v23 + 32) = v29;
  id v30 = sub_21F529A14();
  id v31 = objc_msgSend(v30, sel_centerXAnchor);

  id v32 = objc_msgSend(v1, sel_view);
  if (!v32) {
    goto LABEL_24;
  }
  uint64_t v33 = v32;
  id v34 = objc_msgSend(v32, sel_centerXAnchor);

  id v35 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v34);
  *(void *)(v23 + 40) = v35;
  id v36 = sub_21F529CB0();
  id v37 = objc_msgSend(v36, sel_leadingAnchor);

  id v38 = objc_msgSend(v1, sel_view);
  if (!v38)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v39 = v38;
  id v40 = objc_msgSend(v38, sel_leadingAnchor);

  id v41 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v40);
  *(void *)(v23 + 48) = v41;
  id v42 = sub_21F529CB0();
  id v43 = objc_msgSend(v42, sel_trailingAnchor);

  id v44 = objc_msgSend(v1, sel_view);
  if (!v44)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v45 = v44;
  uint64_t v46 = self;
  id v47 = objc_msgSend(v45, sel_trailingAnchor);

  id v48 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v47);
  *(void *)(v23 + 56) = v48;
  id v49 = sub_21F529CB0();
  id v50 = objc_msgSend(v49, sel_bottomAnchor);

  id v51 = sub_21F529A14();
  id v52 = objc_msgSend(v51, sel_topAnchor);

  id v53 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v52);
  *(void *)(v23 + 64) = v53;
  v85[0] = v23;
  sub_21F551660();
  uint64_t v54 = v85[0];
  unint64_t v55 = sub_21F52C4C0();
  v85[0] = v54;
  sub_21F489EC4(v55);
  uint64_t v56 = v85[0];
  unint64_t v57 = sub_21F52C960();
  v85[0] = v56;
  sub_21F489EC4(v57);
  uint64_t v58 = v85[0];
  unint64_t v59 = sub_21F52BD90();
  v85[0] = v58;
  sub_21F489EC4(v59);
  uint64_t v60 = v85[0];
  unint64_t v61 = sub_21F52C7FC();
  v85[0] = v60;
  sub_21F489EC4(v61);
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDF160);
  v62 = (void *)sub_21F551640();
  swift_bridgeObjectRelease();
  objc_msgSend(v46, sel_activateConstraints_, v62);

  sub_21F494F00(v16, (uint64_t)v85);
  uint64_t v63 = v86;
  uint64_t v64 = v87;
  __swift_project_boxed_opaque_existential_1(v85, v86);
  LOBYTE(v64) = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 40))(v63, v64);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v85);
  id v65 = sub_21F529A14();
  id v66 = objc_msgSend(v65, sel_bottomAnchor);

  id v67 = objc_msgSend(v1, sel_view);
  v68 = v67;
  if (v64)
  {
    if (v67)
    {
      id v69 = objc_msgSend(v67, sel_safeAreaLayoutGuide);

      id v70 = objc_msgSend(v69, sel_bottomAnchor);
      id v71 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v70);
      v72 = &selRef_setBioBindingFlowManager_;
LABEL_20:
      id v75 = v71;

      objc_msgSend(v75, sel_setActive_, 1);
      id v76 = sub_21F529A14();
      sub_21F52B720(v76);

      id v77 = sub_21F529A14();
      id v78 = sub_21F52A034();
      objc_msgSend(v77, v72[126], v78);

      id v79 = sub_21F529A14();
      id v80 = sub_21F52A054();
      objc_msgSend(v79, v72[126], v80);

      id v81 = sub_21F529A14();
      v82 = sub_21F529DBC();
      objc_msgSend(v81, v72[126], v82);

      id v83 = sub_21F529A14();
      v84 = sub_21F529E8C();
      objc_msgSend(v83, v72[126], v84);

      return;
    }
    goto LABEL_27;
  }
  if (v67)
  {
    id v73 = objc_msgSend(v67, sel_safeAreaLayoutGuide);

    id v70 = objc_msgSend(v73, sel_bottomAnchor);
    if (qword_267EDE330 != -1) {
      swift_once();
    }
    double v74 = *(double *)&qword_267EE0428;
    v72 = &selRef_setBioBindingFlowManager_;
    if (qword_267EDE340 != -1) {
      swift_once();
    }
    id v71 = objc_msgSend(v66, sel_constraintEqualToAnchor_constant_, v70, -(v74 + *(double *)&qword_267EE0438));
    goto LABEL_20;
  }
LABEL_28:
  __break(1u);
}

void sub_21F52B720(void *a1)
{
  id v2 = v1;
  uint64_t v4 = (uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_21F494F00((uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v16);
  uint64_t v5 = v17;
  uint64_t v6 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  char v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 72))(v5, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  if (v7)
  {
    sub_21F494F00(v4, (uint64_t)v16);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v9 + 128))(v8, v9);
    if (v10)
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
      id v11 = self;
      id v12 = (void *)sub_21F551560();
      swift_bridgeObjectRelease();
      id v13 = objc_msgSend(v11, sel_linkWithBundleIdentifier_, v12);

      if (v13)
      {
        objc_msgSend(v2, sel_addChildViewController_, v13);
        id v14 = objc_msgSend(v13, sel_view);
        if (v14)
        {
          id v15 = v14;
          objc_msgSend(a1, sel_addArrangedSubview_, v14);

          objc_msgSend(v13, sel_didMoveToParentViewController_, v2);
        }
        else
        {
          __break(1u);
        }
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    }
  }
}

void sub_21F52B8C8()
{
  id v1 = v0;
  id v2 = sub_21F52A0D4();
  id v3 = sub_21F52A168();
  objc_msgSend(v2, sel_addSubview_, v3);

  id v4 = sub_21F529CB0();
  id v5 = sub_21F529CC4();
  objc_msgSend(v4, sel_addSubview_, v5);

  id v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
    __break(1u);
    goto LABEL_9;
  }
  char v7 = v6;
  id v8 = sub_21F529CB0();
  objc_msgSend(v7, sel_addSubview_, v8);

  sub_21F52CB98();
  id v9 = sub_21F529A40();
  id v10 = sub_21F529B44();
  objc_msgSend(v9, sel_addArrangedSubview_, v10);

  id v11 = sub_21F529A40();
  id v12 = sub_21F529C04();
  objc_msgSend(v11, sel_addArrangedSubview_, v12);

  id v13 = sub_21F529A40();
  sub_21F52B720(v13);

  id v14 = sub_21F529A40();
  id v15 = sub_21F52A034();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  id v16 = sub_21F529A40();
  uint64_t v17 = sub_21F529DBC();
  objc_msgSend(v16, sel_addArrangedSubview_, v17);

  id v18 = sub_21F529A40();
  id v19 = sub_21F529E8C();
  objc_msgSend(v18, sel_addArrangedSubview_, v19);

  id v20 = sub_21F529CC4();
  id v21 = sub_21F529A40();
  objc_msgSend(v20, sel_addArrangedSubview_, v21);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_21F555E80;
  id v23 = sub_21F529CB0();
  id v24 = objc_msgSend(v23, sel_leadingAnchor);

  id v25 = objc_msgSend(v1, sel_view);
  if (!v25)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v26 = v25;
  id v27 = objc_msgSend(v25, sel_leadingAnchor);

  id v28 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v27);
  *(void *)(v22 + 32) = v28;
  id v29 = sub_21F529CB0();
  id v30 = objc_msgSend(v29, sel_trailingAnchor);

  id v31 = objc_msgSend(v1, sel_view);
  if (!v31)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v32 = v31;
  id v33 = objc_msgSend(v31, sel_trailingAnchor);

  id v34 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v33);
  *(void *)(v22 + 40) = v34;
  id v35 = sub_21F529CB0();
  id v36 = objc_msgSend(v35, sel_bottomAnchor);

  id v37 = objc_msgSend(v1, sel_view);
  if (!v37)
  {
LABEL_11:
    __break(1u);
    return;
  }
  id v38 = v37;
  uint64_t v39 = self;
  id v40 = objc_msgSend(v38, sel_safeAreaLayoutGuide);

  id v41 = objc_msgSend(v40, sel_bottomAnchor);
  id v42 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v41);

  *(void *)(v22 + 48) = v42;
  sub_21F551660();
  unint64_t v43 = sub_21F52BD90();
  sub_21F489EC4(v43);
  unint64_t v44 = sub_21F52C4C0();
  sub_21F489EC4(v44);
  unint64_t v45 = sub_21F52C960();
  sub_21F489EC4(v45);
  unint64_t v46 = sub_21F52C7FC();
  sub_21F489EC4(v46);
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDF160);
  id v47 = (id)sub_21F551640();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_activateConstraints_, v47);
}

uint64_t sub_21F52BD90()
{
  id v1 = v0;
  uint64_t v2 = (uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_21F494F00((uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v75);
  uint64_t v3 = v76;
  uint64_t v4 = v77;
  __swift_project_boxed_opaque_existential_1(v75, v76);
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 80))(v3, v4);
  uint64_t v6 = MEMORY[0x263F8EE78];
  switch(v5)
  {
    case 1:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_21F555E80;
      id v23 = sub_21F52A168();
      id v24 = objc_msgSend(v23, sel_topAnchor);

      id v25 = sub_21F52A0D4();
      id v26 = objc_msgSend(v25, sel_topAnchor);

      id v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v26);
      *(void *)(v7 + 32) = v27;
      id v28 = sub_21F52A168();
      id v29 = objc_msgSend(v28, sel_centerXAnchor);

      id v30 = sub_21F52A0D4();
      id v31 = objc_msgSend(v30, sel_centerXAnchor);

      id v32 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v31);
      *(void *)(v7 + 40) = v32;
      id v33 = sub_21F52A168();
      id v19 = objc_msgSend(v33, sel_bottomAnchor);

      id v34 = sub_21F52A0D4();
      id v21 = objc_msgSend(v34, sel_bottomAnchor);

      id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v21);
      goto LABEL_4;
    case 2:
      sub_21F494F00(v2, (uint64_t)v72);
      uint64_t v36 = v73;
      uint64_t v37 = v74;
      __swift_project_boxed_opaque_existential_1(v72, v73);
      id v38 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v37 + 88))(v36, v37);
      if (v38)
      {
        uint64_t v39 = v38;
        objc_msgSend(v38, sel_size);
        double v41 = v40;
        double v43 = v42;

        __swift_destroy_boxed_opaque_existential_0((uint64_t)v72);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
        uint64_t v7 = swift_allocObject();
        *(_OWORD *)(v7 + 16) = xmmword_21F556C80;
        id v44 = sub_21F52A168();
        id v45 = objc_msgSend(v44, sel_widthAnchor);

        id v46 = objc_msgSend(v1, sel_view);
        if (!v46)
        {
          __break(1u);
          JUMPOUT(0x21F52C4B0);
        }
        id v47 = v46;
        double v48 = v43 / v41;
        id v49 = objc_msgSend(v46, sel_widthAnchor);

        if (qword_267EDE370 != -1) {
          swift_once();
        }
        id v50 = objc_msgSend(v45, sel_constraintEqualToAnchor_multiplier_, v49, *(double *)&qword_267EE0468);

        *(void *)(v7 + 32) = v50;
        id v51 = sub_21F52A168();
        id v52 = objc_msgSend(v51, sel_heightAnchor);

        id v53 = sub_21F52A168();
        id v54 = objc_msgSend(v53, sel_widthAnchor);

        id v55 = objc_msgSend(v52, sel_constraintEqualToAnchor_multiplier_, v54, v48);
        *(void *)(v7 + 40) = v55;
        id v56 = sub_21F52A168();
        id v57 = objc_msgSend(v56, sel_centerXAnchor);

        id v58 = sub_21F52A0D4();
        id v59 = objc_msgSend(v58, sel_centerXAnchor);

        id v60 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v59);
        *(void *)(v7 + 48) = v60;
        id v61 = sub_21F52A168();
        id v62 = objc_msgSend(v61, sel_topAnchor);

        id v63 = sub_21F52A0D4();
        id v64 = objc_msgSend(v63, sel_topAnchor);

        id v65 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v64);
        *(void *)(v7 + 56) = v65;
        id v66 = sub_21F52A168();
        id v67 = objc_msgSend(v66, sel_bottomAnchor);

        id v68 = sub_21F52A0D4();
        id v69 = objc_msgSend(v68, sel_bottomAnchor);

        id v70 = objc_msgSend(v67, sel_constraintEqualToAnchor_, v69);
        *(void *)(v7 + 64) = v70;
LABEL_10:
        v72[0] = v7;
        sub_21F551660();
        uint64_t v6 = v72[0];
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v72);
        uint64_t v6 = MEMORY[0x263F8EE78];
      }
LABEL_11:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v75);
      return v6;
    case 3:
      goto LABEL_11;
    default:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_21F555E80;
      id v8 = sub_21F52A168();
      id v9 = objc_msgSend(v8, sel_widthAnchor);

      id v10 = sub_21F52A0D4();
      id v11 = objc_msgSend(v10, sel_widthAnchor);

      id v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
      *(void *)(v7 + 32) = v12;
      id v13 = sub_21F52A168();
      id v14 = objc_msgSend(v13, sel_heightAnchor);

      id v15 = sub_21F52A0D4();
      id v16 = objc_msgSend(v15, sel_heightAnchor);

      id v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
      *(void *)(v7 + 40) = v17;
      id v18 = sub_21F52A168();
      id v19 = objc_msgSend(v18, sel_topAnchor);

      id v20 = sub_21F52A0D4();
      id v21 = objc_msgSend(v20, sel_topAnchor);

      id v22 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v21);
LABEL_4:
      id v35 = v22;

      *(void *)(v7 + 48) = v35;
      goto LABEL_10;
  }
}

uint64_t sub_21F52C4C0()
{
  sub_21F494F00(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v31);
  uint64_t v1 = v32;
  uint64_t v2 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 112))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  id v3 = sub_21F529CC4();
  id v4 = objc_msgSend(v3, sel_topAnchor);

  id v5 = sub_21F529CB0();
  id v6 = objc_msgSend(v5, sel_topAnchor);

  if (v2) {
    id v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_constant_, v6, 20.0);
  }
  else {
    id v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v6);
  }
  id v8 = v7;

  objc_msgSend(v8, sel_setActive_, 1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21F555D00;
  id v10 = sub_21F529CC4();
  id v11 = objc_msgSend(v10, sel_bottomAnchor);

  id v12 = sub_21F529CB0();
  id v13 = objc_msgSend(v12, sel_bottomAnchor);

  id v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(void *)(v9 + 32) = v14;
  id v15 = sub_21F529CC4();
  id v16 = objc_msgSend(v15, sel_leadingAnchor);

  id v17 = sub_21F529CB0();
  id v18 = objc_msgSend(v17, sel_leadingAnchor);

  id v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(void *)(v9 + 40) = v19;
  id v20 = sub_21F529CC4();
  id v21 = objc_msgSend(v20, sel_trailingAnchor);

  id v22 = sub_21F529CB0();
  id v23 = objc_msgSend(v22, sel_trailingAnchor);

  id v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(void *)(v9 + 48) = v24;
  id v25 = sub_21F529CC4();
  id v26 = objc_msgSend(v25, sel_widthAnchor);

  id v27 = sub_21F529CB0();
  id v28 = objc_msgSend(v27, sel_widthAnchor);

  id v29 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v28);
  *(void *)(v9 + 56) = v29;
  v31[0] = v9;
  sub_21F551660();
  return v31[0];
}

uint64_t sub_21F52C7FC()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21F5547F0;
  uint64_t v1 = sub_21F529E8C();
  id v2 = objc_msgSend(v1, sel_heightAnchor);

  if (qword_267EDE330 != -1) {
    swift_once();
  }
  id v3 = objc_msgSend(v2, sel_constraintEqualToConstant_, *(double *)&qword_267EE0428);

  *(void *)(v0 + 32) = v3;
  id v4 = sub_21F529DBC();
  id v5 = objc_msgSend(v4, sel_heightAnchor);

  if (qword_267EDE338 != -1) {
    swift_once();
  }
  id v6 = objc_msgSend(v5, sel_constraintEqualToConstant_, *(double *)&qword_267EE0430);

  *(void *)(v0 + 40) = v6;
  sub_21F551660();
  return v0;
}

uint64_t sub_21F52C960()
{
  sub_21F494F00(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v18);
  uint64_t v1 = v19;
  uint64_t v2 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  char v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 160))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  if (v3)
  {
    if (qword_267EDE358 != -1) {
      swift_once();
    }
    id v4 = &qword_267EE0450;
  }
  else
  {
    if (qword_267EDE350 != -1) {
      swift_once();
    }
    id v4 = &qword_267EE0448;
  }
  double v5 = *(double *)v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21F5547F0;
  id v7 = sub_21F529A40();
  id v8 = objc_msgSend(v7, sel_widthAnchor);

  id v9 = sub_21F529CC4();
  id v10 = objc_msgSend(v9, sel_widthAnchor);

  id v11 = objc_msgSend(v8, sel_constraintEqualToAnchor_constant_, v10, -v5);
  *(void *)(v6 + 32) = v11;
  id v12 = sub_21F529A40();
  id v13 = objc_msgSend(v12, sel_centerXAnchor);

  id v14 = sub_21F529CC4();
  id v15 = objc_msgSend(v14, sel_centerXAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(void *)(v6 + 40) = v16;
  v18[0] = v6;
  sub_21F551660();
  return v18[0];
}

void sub_21F52CB98()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_21F494F00((uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v111);
  uint64_t v3 = v112;
  uint64_t v4 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 112))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
  if (v5)
  {
    id v6 = objc_msgSend(v1, sel_view);
    if (v6)
    {
      id v7 = v6;
      id v8 = sub_21F52A0D4();
      objc_msgSend(v7, sel_addSubview_, v8);

      id v9 = sub_21F529CB0();
      id v10 = objc_msgSend(v9, sel_topAnchor);

      id v11 = sub_21F52A0D4();
      id v12 = objc_msgSend(v11, sel_bottomAnchor);

      id v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
      objc_msgSend(v13, sel_setActive_, 1);
      goto LABEL_9;
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v14 = sub_21F529CC4();
  id v15 = sub_21F52A0D4();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  id v16 = sub_21F529CB0();
  id v17 = objc_msgSend(v16, sel_topAnchor);

  id v18 = objc_msgSend(v1, sel_view);
  if (!v18) {
    goto LABEL_35;
  }
  uint64_t v19 = v18;
  id v20 = objc_msgSend(v18, sel_safeAreaLayoutGuide);

  id v21 = objc_msgSend(v20, sel_topAnchor);
  id v22 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v21);

  objc_msgSend(v22, sel_setActive_, 1);
  sub_21F494F00(v2, (uint64_t)v111);
  uint64_t v23 = v112;
  uint64_t v24 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  int v25 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v24 + 80))(v23, v24);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
  if (v25 != 2) {
    goto LABEL_10;
  }
  id v26 = sub_21F529CC4();
  if (qword_267EDE378 != -1) {
    swift_once();
  }
  double v27 = *(double *)&qword_267EE0470;
  id v13 = sub_21F52A0D4();
  objc_msgSend(v26, sel_setCustomSpacing_afterView_, v13, v27);

LABEL_9:
LABEL_10:
  sub_21F494F00(v2, (uint64_t)v111);
  uint64_t v28 = v112;
  uint64_t v29 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  int v30 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v29 + 80))(v28, v29);
  if ((v30 - 2) >= 2)
  {
    if (v30)
    {
      id v79 = objc_msgSend(self, sel_mainScreen);
      objc_msgSend(v79, sel_bounds);
      CGFloat v81 = v80;
      CGFloat v83 = v82;
      CGFloat v85 = v84;
      CGFloat v87 = v86;

      v115.origin.double x = v81;
      v115.origin.double y = v83;
      v115.size.width = v85;
      v115.size.height = v87;
      double Height = CGRectGetHeight(v115);
      sub_21F494F00(v2, (uint64_t)v108);
      uint64_t v89 = v109;
      uint64_t v90 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      v91 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v90 + 88))(v89, v90);
      if (v91)
      {
        v92 = v91;
        objc_msgSend(v91, sel_size);
        double v94 = v93;
      }
      else
      {
        double v94 = 0.0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      sub_21F494F00(v2, (uint64_t)v108);
      uint64_t v96 = v109;
      uint64_t v97 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      char v98 = (*(uint64_t (**)(uint64_t, uint64_t))(v97 + 112))(v96, v97);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      if (v98)
      {
        id v99 = sub_21F52A0D4();
        id v100 = objc_msgSend(v99, sel_topAnchor);

        id v101 = objc_msgSend(v1, sel_view);
        if (!v101)
        {
LABEL_41:
          __break(1u);
          return;
        }
        v102 = v101;
        id v103 = objc_msgSend(v101, sel_topAnchor);

        id v104 = objc_msgSend(v100, sel_constraintEqualToAnchor_constant_, v103, Height * 0.09);
        objc_msgSend(v104, sel_setActive_, 1);
      }
      id v105 = sub_21F52A0D4();
      id v106 = objc_msgSend(v105, sel_heightAnchor);

      id v107 = objc_msgSend(v106, sel_constraintEqualToConstant_, v94);
      objc_msgSend(v107, sel_setActive_, 1);
    }
    else
    {
      sub_21F494F00(v2, (uint64_t)v108);
      uint64_t v49 = v109;
      uint64_t v50 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      char v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 112))(v49, v50);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      if (v51)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EDF950);
        uint64_t v52 = swift_allocObject();
        *(_OWORD *)(v52 + 16) = xmmword_21F5547F0;
        id v53 = sub_21F52A0D4();
        id v54 = objc_msgSend(v53, sel_widthAnchor);

        id v55 = objc_msgSend(v1, sel_view);
        if (!v55)
        {
LABEL_37:
          __break(1u);
          goto LABEL_38;
        }
        id v56 = v55;
        id v57 = objc_msgSend(v55, sel_widthAnchor);

        id v58 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v57);
        *(void *)(v52 + 32) = v58;
        id v59 = sub_21F52A0D4();
        id v60 = objc_msgSend(v59, sel_topAnchor);

        id v61 = objc_msgSend(v1, sel_view);
        if (!v61)
        {
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        id v62 = v61;
        id v63 = self;
        id v64 = objc_msgSend(v62, sel_safeAreaLayoutGuide);

        id v65 = objc_msgSend(v64, sel_topAnchor);
        id v66 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v65);

        *(void *)(v52 + 40) = v66;
        v108[0] = v52;
        sub_21F551660();
        sub_21F46EFD8(0, (unint64_t *)&qword_267EDF160);
        id v67 = (void *)sub_21F551640();
        swift_bridgeObjectRelease();
        objc_msgSend(v63, sel_activateConstraints_, v67);
      }
      sub_21F494F00(v2, (uint64_t)v108);
      uint64_t v68 = v109;
      uint64_t v69 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      double v70 = COERCE_DOUBLE((*(uint64_t (**)(uint64_t, uint64_t))(v69 + 104))(v68, v69));
      char v72 = v71;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      id v73 = sub_21F52A0D4();
      id v74 = objc_msgSend(v73, sel_heightAnchor);

      id v75 = objc_msgSend(v1, sel_view);
      uint64_t v76 = v75;
      if (v72)
      {
        if (!v75)
        {
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        id v77 = objc_msgSend(v75, sel_heightAnchor);

        id v78 = objc_msgSend(v74, sel_constraintEqualToAnchor_multiplier_, v77, 0.45);
      }
      else
      {
        if (!v75)
        {
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        id v77 = objc_msgSend(v75, sel_heightAnchor);

        id v78 = objc_msgSend(v74, sel_constraintEqualToAnchor_multiplier_, v77, v70);
      }
      id v95 = v78;

      objc_msgSend(v95, sel_setActive_, 1);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
    id v31 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v31, sel_bounds);
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;

    v114.origin.double x = v33;
    v114.origin.double y = v35;
    v114.size.width = v37;
    v114.size.height = v39;
    double v40 = CGRectGetHeight(v114);
    sub_21F494F00(v2, (uint64_t)v111);
    uint64_t v41 = v112;
    uint64_t v42 = v113;
    __swift_project_boxed_opaque_existential_1(v111, v112);
    LOBYTE(v31) = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 112))(v41, v42);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
    if (v31)
    {
      id v43 = sub_21F52A0D4();
      id v44 = objc_msgSend(v43, sel_topAnchor);

      id v45 = objc_msgSend(v1, sel_view);
      if (v45)
      {
        id v46 = v45;
        id v47 = objc_msgSend(v45, sel_topAnchor);

        id v48 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v47, v40 * 0.09);
        objc_msgSend(v48, sel_setActive_, 1);

        return;
      }
      goto LABEL_36;
    }
  }
}

void sub_21F52D608(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F550C20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v40[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = sub_21F529CC4();
  id v9 = objc_msgSend(v8, sel_arrangedSubviews);

  sub_21F46EFD8(0, &qword_267EE0510);
  unint64_t v10 = sub_21F551650();

  LOBYTE(v9) = sub_21F52DAEC((uint64_t)a1, v10);
  swift_bridgeObjectRelease();
  if (v9)
  {
    sub_21F54EF20();
    id v11 = sub_21F550C10();
    os_log_type_t v12 = sub_21F5517A0();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_21F464000, v11, v12, "view is already configured in proofing view; aborting", v13, 2u);
      MEMORY[0x223C4F110](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  id v14 = objc_msgSend(v2, sel_traitCollection);
  id v15 = objc_msgSend(v14, sel_preferredContentSizeCategory);

  LOBYTE(v14) = sub_21F5518C0();
  if (v14)
  {
    id v16 = sub_21F529CC4();
    objc_msgSend(v16, sel_addArrangedSubview_, a1);

    sub_21F494F00((uint64_t)v2 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v40);
    uint64_t v17 = v41;
    uint64_t v18 = v42;
    __swift_project_boxed_opaque_existential_1(v40, v41);
    LOBYTE(v16) = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 160))(v17, v18);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
    if (v16)
    {
      if (qword_267EDE358 != -1) {
        swift_once();
      }
      uint64_t v19 = &qword_267EE0450;
LABEL_17:
      double v29 = *(double *)v19;
      id v30 = objc_msgSend(a1, sel_widthAnchor);
      id v31 = sub_21F529CC4();
      id v32 = objc_msgSend(v31, sel_widthAnchor);

      id v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_constant_, v32, -v29);
      objc_msgSend(v33, sel_setActive_, 1);

      return;
    }
LABEL_14:
    if (qword_267EDE350 != -1) {
      swift_once();
    }
    uint64_t v19 = &qword_267EE0448;
    goto LABEL_17;
  }
  id v20 = sub_21F529A40();
  id v21 = objc_msgSend(v20, sel_arrangedSubviews);

  unint64_t v22 = sub_21F551650();
  id v23 = sub_21F529C04();
  sub_21F52EFCC((uint64_t)v23, v22);
  uint64_t v25 = v24;
  char v27 = v26;
  swift_bridgeObjectRelease();

  if (v27)
  {
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  id v34 = sub_21F529A40();
  objc_msgSend(v34, sel_insertArrangedSubview_atIndex_, a1, v28);

  id v35 = objc_msgSend(a1, sel_widthAnchor);
  id v36 = sub_21F529A40();
  id v37 = objc_msgSend(v36, sel_widthAnchor);

  id v39 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  objc_msgSend(v39, sel_setActive_, 1);
  id v38 = v39;
}

uint64_t sub_21F52DAEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_21F551B50())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x223C4E570](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_21F46EFD8(0, &qword_267EE0510);
      char v7 = sub_21F551940();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_21F551940();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x223C4E570](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_21F551940();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

BOOL sub_21F52DC74(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    unint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_21F52DCD4()
{
  qword_267EE0428 = 0x4049000000000000;
}

void sub_21F52DCE4()
{
  qword_267EE0430 = 0x4049000000000000;
}

void sub_21F52DCF4()
{
  qword_267EE0438 = 0x4014000000000000;
}

void sub_21F52DD04()
{
  qword_267EE0440 = 0x402E000000000000;
}

void sub_21F52DD14()
{
  qword_267EE0448 = 0x4048000000000000;
}

void sub_21F52DD24()
{
  qword_267EE0450 = 0x4040000000000000;
}

void sub_21F52DD34()
{
  qword_267EE0458 = 0x4048000000000000;
}

void sub_21F52DD44()
{
  qword_267EE0460 = 0x402E000000000000;
}

void sub_21F52DD54()
{
  qword_267EE0468 = 0x3FE1C71C71C71C72;
}

void sub_21F52DD70()
{
  qword_267EE0470 = 0x4038000000000000;
}

id sub_21F52DE0C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v1 = objc_msgSend(self, sel_grayColor);
  objc_msgSend(v0, sel_setTextColor_, v1);

  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setLineBreakMode_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);

  return v0;
}

id sub_21F52DED8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v1 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  id v2 = objc_msgSend(v0, sel_heightAnchor);
  id v3 = objc_msgSend(v2, sel_constraintEqualToConstant_, 10.0);

  objc_msgSend(v3, sel_setActive_, 1);
  return v0;
}

void sub_21F52E0AC()
{
  id v1 = v0;
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v106[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = (objc_class *)type metadata accessor for IdentityProofingViewController();
  v109.receiver = v0;
  v109.super_class = v6;
  objc_msgSendSuper2(&v109, sel_viewDidLoad);
  id v7 = sub_21F529B44();
  uint64_t v8 = (uint64_t)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration];
  sub_21F494F00((uint64_t)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration], (uint64_t)v106);
  uint64_t v9 = v107;
  uint64_t v10 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  if (v11)
  {
    unint64_t v12 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v7, sel_setText_, v12);

  id v13 = sub_21F529C04();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v14 = v107;
  uint64_t v15 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
  if (v16)
  {
    uint64_t v17 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v13, sel_setText_, v17);

  uint64_t v18 = sub_21F529DBC();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v19 = v107;
  uint64_t v20 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
  uint64_t v105 = v3;
  if (v21)
  {
    unint64_t v22 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v22 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v18, sel_setTitle_forState_, v22, 0);

  id v23 = sub_21F529E8C();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v24 = v107;
  uint64_t v25 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v25 + 48))(v24, v25);
  if (v26)
  {
    char v27 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v27 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v23, sel_setTitle_forState_, v27, 0);

  uint64_t v28 = sub_21F529F60();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v29 = v107;
  uint64_t v30 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v30 + 152))(v29, v30);
  if (v31)
  {
    id v32 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v32 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v28, sel_setTitle_forState_, v32, 0);

  id v33 = sub_21F52A034();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v34 = v107;
  uint64_t v35 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v35 + 64))(v34, v35);
  if (v36)
  {
    id v37 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v37 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v33, sel_setText_, v37);

  sub_21F52A200();
  id v38 = sub_21F529DBC();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v39 = v107;
  uint64_t v40 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  char v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 24))(v39, v40);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v38, sel_setHidden_, (v41 & 1) == 0);

  uint64_t v42 = sub_21F529E8C();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v43 = v107;
  uint64_t v44 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  char v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 40))(v43, v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v42, sel_setHidden_, (v45 & 1) == 0);

  id v46 = sub_21F52A034();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v47 = v107;
  uint64_t v48 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  char v49 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 56))(v47, v48);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v46, sel_setHidden_, (v49 & 1) == 0);

  id v50 = sub_21F52A054();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v51 = v107;
  uint64_t v52 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  char v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 56))(v51, v52);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v50, sel_setHidden_, (v53 & 1) == 0);

  id v54 = sub_21F52A168();
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v55 = v107;
  uint64_t v56 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  uint64_t v57 = (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 88))(v55, v56);
  objc_msgSend(v54, sel_setImage_, v57);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v58 = v107;
  uint64_t v59 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  LOBYTE(v57) = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 96))(v58, v59);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  if (v57)
  {
    id v60 = sub_21F52A168();
    sub_21F46EFD8(0, (unint64_t *)&qword_267EDE5C8);
    uint64_t v61 = sub_21F54FA80();
    char v62 = MEMORY[0x223C4E2C0](v61);
    swift_bridgeObjectRelease();
    if (v62)
    {
      sub_21F54EF20();
      id v63 = sub_21F550C10();
      os_log_type_t v64 = sub_21F5517D0();
      if (os_log_type_enabled(v63, v64))
      {
        id v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v65 = 0;
        _os_log_impl(&dword_21F464000, v63, v64, "Internal setting to skip disable screen captures", v65, 2u);
        MEMORY[0x223C4F110](v65, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v105 + 8))(v5, v2);
    }
    else
    {
      id v66 = objc_msgSend(v60, sel_layer);
      unsigned int v67 = objc_msgSend(v66, sel_disableUpdateMask);

      id v68 = objc_msgSend(v60, sel_layer);
      objc_msgSend(v68, sel_setDisableUpdateMask_, v67 | 0x12);

      id v60 = v68;
    }
  }
  sub_21F494F00(v8, (uint64_t)v106);
  uint64_t v69 = v107;
  uint64_t v70 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  int v71 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v70 + 80))(v69, v70);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  if (v71 == 2)
  {
    id v72 = sub_21F52A168();
    id v73 = sub_21F52A168();
    objc_msgSend(v73, sel_frame);
    CGFloat v75 = v74;
    CGFloat v77 = v76;
    CGFloat v79 = v78;
    CGFloat v81 = v80;

    v110.origin.double x = v75;
    v110.origin.double y = v77;
    v110.size.width = v79;
    v110.size.height = v81;
    CGRect v111 = CGRectInset(v110, -1.0, -1.0);
    objc_msgSend(v72, sel_setFrame_, v111.origin.x, v111.origin.y, v111.size.width, v111.size.height);

    id v82 = sub_21F52A168();
    id v83 = objc_msgSend(v82, sel_layer);

    objc_msgSend(v83, sel_setCornerRadius_, 8.0);
    id v84 = sub_21F52A168();
    id v85 = objc_msgSend(v84, sel_layer);

    id v86 = objc_msgSend(self, sel_blackColor);
    id v87 = objc_msgSend(v86, sel_colorWithAlphaComponent_, 0.1);

    id v88 = objc_msgSend(v87, sel_CGColor);
    objc_msgSend(v85, sel_setBorderColor_, v88);

    id v89 = sub_21F52A168();
    id v90 = objc_msgSend(v89, sel_layer);

    objc_msgSend(v90, sel_setBorderWidth_, 1.0);
    id v91 = sub_21F52A168();
    objc_msgSend(v91, sel_setClipsToBounds_, 1);
  }
  id v92 = objc_msgSend(v1, sel_view, v105);
  if (v92)
  {
    double v93 = v92;
    id v94 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v93, sel_setBackgroundColor_, v94);

    id v95 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton];
    if (v95) {
      objc_msgSend(v95, sel_setEnabled_, 1);
    }
    sub_21F52A71C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF970);
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_21F554510;
    uint64_t v97 = sub_21F550C40();
    uint64_t v98 = MEMORY[0x263F82018];
    *(void *)(v96 + 32) = v97;
    *(void *)(v96 + 40) = v98;
    MEMORY[0x223C4E2D0](v96, sel_updateViewLayout_previousTraitCollection_);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    id v99 = objc_msgSend(v1, sel_traitCollection);
    id v100 = objc_msgSend(v99, sel_preferredContentSizeCategory);

    char v101 = sub_21F5518C0();
    if (v101)
    {
      sub_21F52AE64();
    }
    else
    {
      id v102 = objc_msgSend(v1, sel_traitCollection);
      id v103 = objc_msgSend(v102, sel_preferredContentSizeCategory);

      char v104 = sub_21F5518D0();
      if (v104) {
        sub_21F52B8C8();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_21F52ED24()
{
  id v1 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  objc_msgSendSuper2(&v29, sel_viewDidLayoutSubviews);
  uint64_t v2 = (uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_21F494F00((uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v26);
  uint64_t v3 = v27;
  uint64_t v4 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 112))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  if ((v5 & 1) == 0)
  {
    sub_21F494F00(v2, (uint64_t)v26);
    uint64_t v6 = v27;
    uint64_t v7 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 80))(v6, v7);
    BOOL v9 = sub_21F52DC74(v8, (uint64_t)&unk_26D0DE580);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    if (v9)
    {
      id v10 = objc_msgSend(self, sel_mainScreen);
      objc_msgSend(v10, sel_bounds);
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;

      v30.origin.double x = v12;
      v30.origin.double y = v14;
      v30.size.width = v16;
      v30.size.height = v18;
      double Height = CGRectGetHeight(v30);
      id v20 = sub_21F529CB0();
      id v21 = objc_msgSend(v1, sel_view);
      if (v21)
      {
        unint64_t v22 = v21;
        double v23 = Height * 0.09;
        objc_msgSend(v21, sel_safeAreaInsets);
        double v25 = v24;

        objc_msgSend(v20, sel_contentInset);
        objc_msgSend(v20, sel_setContentInset_, vabdd_f64(v23, v25));
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_21F52EFCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x223C4E570](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      char v5 = v4;
      sub_21F46EFD8(0, &qword_267EE0510);
      char v6 = sub_21F551940();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x223C4E570](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          BOOL v9 = v8;
          char v10 = sub_21F551940();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_21F551B50();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

id sub_21F52F19C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingViewController()
{
  return self;
}

id sub_21F52F360(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  v15[3] = a3;
  v15[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  id v8 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  BOOL v9 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)BOOL v9 = 0;
  *((void *)v9 + 1) = 0;
  char v10 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)char v10 = 0;
  *((void *)v10 + 1) = 0;
  unint64_t v11 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)unint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_21F494F00((uint64_t)v15, (uint64_t)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v14.receiver = a2;
  v14.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v12;
}

void sub_21F52F500(void *a1)
{
  uint64_t v3 = sub_21F550C20();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  BOOL v9 = (char *)&v44 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  char v45 = (char *)&v44 - v11;
  MEMORY[0x270FA5388](v10);
  id v46 = (char *)&v44 - v12;
  sub_21F52A71C();
  if (a1) {
    id v13 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  }
  else {
    id v13 = 0;
  }
  objc_super v14 = v1;
  id v15 = objc_msgSend(v1, sel_traitCollection);
  id v16 = objc_msgSend(v15, sel_preferredContentSizeCategory);

  if (!v13)
  {

    goto LABEL_12;
  }
  double v17 = v9;
  uint64_t v18 = v3;
  uint64_t v19 = sub_21F5515A0();
  uint64_t v21 = v20;
  if (v19 == sub_21F5515A0() && v21 == v22)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  char v24 = sub_21F551BF0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v18;
  BOOL v9 = v17;
  id v1 = v14;
  if ((v24 & 1) == 0)
  {
LABEL_12:
    if (!a1)
    {
      __break(1u);
      return;
    }
    id v25 = objc_msgSend(a1, sel_preferredContentSizeCategory);
    char v26 = sub_21F5518D0();

    if ((v26 & 1) != 0
      && (id v27 = objc_msgSend(v1, sel_traitCollection),
          id v28 = objc_msgSend(v27, sel_preferredContentSizeCategory),
          v27,
          LOBYTE(v27) = sub_21F5518D0(),
          v28,
          (v27 & 1) != 0))
    {
      char v6 = v46;
      sub_21F54EF20();
      objc_super v29 = sub_21F550C10();
      os_log_type_t v30 = sub_21F5517A0();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        id v32 = "previous and current are both greater than the threshold, no layout changes needed";
LABEL_29:
        _os_log_impl(&dword_21F464000, v29, v30, v32, v31, 2u);
        MEMORY[0x223C4F110](v31, -1, -1);
      }
    }
    else
    {
      id v33 = objc_msgSend(a1, sel_preferredContentSizeCategory);
      char v34 = sub_21F5518C0();

      if ((v34 & 1) != 0
        && (id v35 = objc_msgSend(v1, sel_traitCollection),
            id v36 = objc_msgSend(v35, sel_preferredContentSizeCategory),
            v35,
            LOBYTE(v35) = sub_21F5518C0(),
            v36,
            (v35 & 1) != 0))
      {
        char v6 = v45;
        sub_21F54EF20();
        objc_super v29 = sub_21F550C10();
        os_log_type_t v30 = sub_21F5517A0();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v31 = 0;
          id v32 = "previous and current are both lesser than the threshold, no layout changes needed";
          goto LABEL_29;
        }
      }
      else
      {
        id v37 = objc_msgSend(v1, sel_traitCollection);
        id v38 = objc_msgSend(v37, sel_preferredContentSizeCategory);

        LOBYTE(v37) = sub_21F5518D0();
        if (v37)
        {
          sub_21F52AA48();
          sub_21F52B8C8();
          sub_21F54EF20();
          uint64_t v39 = sub_21F550C10();
          os_log_type_t v40 = sub_21F5517A0();
          if (os_log_type_enabled(v39, v40))
          {
            char v41 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)char v41 = 0;
            _os_log_impl(&dword_21F464000, v39, v40, "current size is greater than the threshold, reset layout for larger text", v41, 2u);
            MEMORY[0x223C4F110](v41, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v3);
          return;
        }
        id v42 = objc_msgSend(v1, sel_traitCollection);
        id v43 = objc_msgSend(v42, sel_preferredContentSizeCategory);

        LOBYTE(v42) = sub_21F5518C0();
        if ((v42 & 1) == 0) {
          return;
        }
        sub_21F52AA48();
        sub_21F52AE64();
        sub_21F54EF20();
        objc_super v29 = sub_21F550C10();
        os_log_type_t v30 = sub_21F5517A0();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v31 = 0;
          id v32 = "current size is lesser than the threshold, reset layout for smaller text";
          goto LABEL_29;
        }
      }
    }

    (*(void (**)(char *, uint64_t))(v47 + 8))(v6, v3);
  }
}

void sub_21F52FA98()
{
  id v1 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  objc_super v2 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)objc_super v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;

  sub_21F551B40();
  __break(1u);
}

id sub_21F52FC88()
{
  return sub_21F478104(&OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel);
}

id sub_21F52FC94()
{
  return sub_21F478104(&OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel);
}

id sub_21F52FCA0()
{
  return sub_21F478104(&OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel);
}

id sub_21F52FCAC()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton;
  objc_super v2 = *(void **)(v0
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton);
  }
  else
  {
    id v4 = sub_21F4781E0(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    objc_super v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_21F52FD10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550BE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView;
  uint64_t v7 = *(void **)(v1
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView);
  if (v7)
  {
    id v8 = *(id *)(v1 + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView);
  }
  else
  {
    sub_21F50C260();
    if (qword_267EDE3B0 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_267EE26A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    uint64_t v10 = (void *)sub_21F551930();
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v10);

    uint64_t v12 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v11;
    id v8 = v11;

    uint64_t v7 = 0;
  }
  id v13 = v7;
  return v8;
}

uint64_t sub_21F52FE90()
{
  uint64_t v1 = v0;
  v25.receiver = v0;
  v25.super_class = (Class)type metadata accessor for IdentityProofingAddedToWalletViewController();
  objc_msgSendSuper2(&v25, sel_viewDidLoad);
  sub_21F530D60();
  id v2 = sub_21F4E75D4();
  id v3 = sub_21F52FD10();
  objc_msgSend(v2, sel_addArrangedSubview_, v3);

  id v4 = sub_21F4E75D4();
  id v5 = sub_21F52FC88();
  objc_msgSend(v4, sel_addArrangedSubview_, v5);

  id v6 = sub_21F4E75D4();
  id v7 = sub_21F52FC94();
  objc_msgSend(v6, sel_addArrangedSubview_, v7);

  id v8 = sub_21F4E7698();
  id v9 = sub_21F52FCAC();
  objc_msgSend(v8, sel_addArrangedSubview_, v9);

  id v10 = sub_21F4E75D4();
  id v11 = sub_21F52FD10();
  objc_msgSend(v10, sel_setCustomSpacing_afterView_, v11, 24.0);

  id v12 = sub_21F52FCAC();
  id v13 = objc_msgSend(v12, sel_widthAnchor);

  id v14 = sub_21F4E7698();
  id v15 = objc_msgSend(v14, sel_widthAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v15, -20.0);
  objc_msgSend(v16, sel_setActive_, 1);

  id v17 = sub_21F52FCAC();
  id v18 = objc_msgSend(v17, sel_heightAnchor);

  id v19 = objc_msgSend(v18, sel_constraintEqualToConstant_, 50.0);
  objc_msgSend(v19, sel_setActive_, 1);

  sub_21F530D60();
  sub_21F53044C();
  uint64_t v20 = *(void *)&v1[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager];
  sub_21F530268((*(void *)(v20 + 136) & 3) == 2);
  sub_21F54FEE0();
  if (*(void *)(v20 + 136) == 2)
  {
    swift_bridgeObjectRelease();
    sub_21F54FF60();
  }
  sub_21F5501F0();
  swift_retain();
  sub_21F5500D0();
  sub_21F54F980();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF970);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_21F554510;
  uint64_t v22 = sub_21F550C40();
  uint64_t v23 = MEMORY[0x263F82018];
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v23;
  MEMORY[0x223C4E2D0](v21, sel_configureFonts);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_21F530268(char a1)
{
  if (a1)
  {
    id v2 = sub_21F52FC88();
    id v3 = self;
    id v4 = objc_msgSend(v3, sel_whiteColor);
    objc_msgSend(v2, sel_setTextColor_, v4);

    id v5 = sub_21F52FC94();
    id v6 = objc_msgSend(v3, sel_whiteColor);
    objc_msgSend(v5, sel_setTextColor_, v6);

    id v7 = sub_21F52FCA0();
    id v8 = objc_msgSend(v3, sel_whiteColor);
    objc_msgSend(v7, sel_setTextColor_, v8);

    id v9 = sub_21F52FCAC();
    id v10 = objc_msgSend(v3, sel_systemGray5Color);
    objc_msgSend(v9, sel_setBackgroundColor_, v10);

    objc_msgSend(v1, sel_setOverrideUserInterfaceStyle_, 2);
    id v11 = objc_msgSend(v1, sel_navigationController);
    if (v11)
    {
      id v12 = v11;
      id v13 = objc_msgSend(v11, sel_navigationBar);

      id v14 = objc_msgSend(v3, sel_systemOrangeColor);
      objc_msgSend(v13, sel_setTintColor_, v14);
    }
  }
}

void sub_21F53044C()
{
  id v0 = sub_21F52FC88();
  uint64_t v1 = self;
  uint64_t v2 = *MEMORY[0x263F83418];
  id v3 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F835E0], *MEMORY[0x263F83418]);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_pointSize);
    id v5 = objc_msgSend(v1, sel_systemFontOfSize_weight_);

    objc_msgSend(v0, sel_setFont_, v5);
    id v6 = sub_21F52FC88();
    objc_msgSend(v6, sel_setAdjustsFontForContentSizeCategory_, 1);

    id v7 = sub_21F52FC94();
    uint64_t v8 = *MEMORY[0x263F83570];
    id v9 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F83570], v2);
    objc_msgSend(v7, sel_setFont_, v9);

    id v10 = sub_21F52FC94();
    objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);

    id v11 = sub_21F52FCA0();
    id v12 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v8, v2);
    objc_msgSend(v11, sel_setFont_, v12);

    id v13 = sub_21F52FCA0();
    objc_msgSend(v13, sel_setAdjustsFontForContentSizeCategory_, 1);

    id v14 = sub_21F52FCAC();
    id v15 = objc_msgSend(v14, sel_titleLabel);

    if (v15)
    {
      id v16 = objc_msgSend(v1, sel_preferredFontForTextStyle_, *MEMORY[0x263F835D0]);
      objc_msgSend(v15, sel_setFont_, v16);
    }
    id v17 = sub_21F52FCAC();
    id v18 = objc_msgSend(v17, sel_titleLabel);

    objc_msgSend(v18, sel_setAdjustsFontSizeToFitWidth_, 1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21F530714()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager];
  type metadata accessor for UsingYourIDInteractor();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  id v4 = (char *)objc_allocWithZone((Class)type metadata accessor for UsingYourIDViewController());
  *(void *)&v4[OBJC_IVAR____TtC9CoreIDVUI25UsingYourIDViewController_interactor] = v3;
  swift_retain_n();
  swift_retain();
  id v5 = sub_21F531BB0(v2, v4);
  id v6 = objc_msgSend(v1, sel_navigationController);
  sub_21F5342D8(v5, v6);

  sub_21F54FEE0();
  if (*(void *)(v2 + 136) == 2)
  {
    swift_bridgeObjectRelease();
    sub_21F54FF60();
  }
  sub_21F550280();
  swift_retain();
  sub_21F5500D0();
  sub_21F54F980();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21F530918@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)&v33 - v8;
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v33 - v10;
  uint64_t v12 = sub_21F550340();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  uint64_t result = v14(a1, 1, 1, v12);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager);
  uint64_t v17 = *(void *)(v16 + 136);
  if (v17 == 1)
  {
    uint64_t v18 = *(void *)(v16 + 176);
    if (v18)
    {
      if (*(void *)(v18 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v19 = sub_21F472B68(0xD000000000000012, 0x800000021F55E720);
        if (v20)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, *(void *)(v18 + 56) + *(void *)(v13 + 72) * v19, v12);
          uint64_t v21 = v11;
          uint64_t v22 = 0;
        }
        else
        {
          uint64_t v21 = v11;
          uint64_t v22 = 1;
        }
        v14((uint64_t)v21, v22, 1, v12);
      }
      else
      {
        v14((uint64_t)v11, 1, 1, v12);
        swift_bridgeObjectRetain();
      }
      sub_21F49C960(a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21F49C960(a1);
      v14((uint64_t)v11, 1, 1, v12);
    }
    uint64_t result = sub_21F50C2A0((uint64_t)v11, a1);
    uint64_t v17 = *(void *)(v16 + 136);
    if (v17 != 2)
    {
LABEL_3:
      if (v17 != 3) {
        return result;
      }
      goto LABEL_25;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_3;
  }
  uint64_t v23 = *(void *)(v16 + 176);
  if (v23)
  {
    if (*(void *)(v23 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_21F472B68(0xD000000000000012, 0x800000021F55E700);
      if (v25)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v9, *(void *)(v23 + 56) + *(void *)(v13 + 72) * v24, v12);
        char v26 = v9;
        uint64_t v27 = 0;
      }
      else
      {
        char v26 = v9;
        uint64_t v27 = 1;
      }
      v14((uint64_t)v26, v27, 1, v12);
    }
    else
    {
      v14((uint64_t)v9, 1, 1, v12);
      swift_bridgeObjectRetain();
    }
    sub_21F49C960(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21F49C960(a1);
    v14((uint64_t)v9, 1, 1, v12);
  }
  uint64_t result = sub_21F50C2A0((uint64_t)v9, a1);
  if (*(void *)(v16 + 136) == 3)
  {
LABEL_25:
    uint64_t v28 = *(void *)(v16 + 176);
    if (v28)
    {
      if (*(void *)(v28 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v29 = sub_21F472B68(0xD000000000000011, 0x800000021F55E6E0);
        if (v30)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v6, *(void *)(v28 + 56) + *(void *)(v13 + 72) * v29, v12);
          uint64_t v31 = v6;
          uint64_t v32 = 0;
        }
        else
        {
          uint64_t v31 = v6;
          uint64_t v32 = 1;
        }
        v14((uint64_t)v31, v32, 1, v12);
      }
      else
      {
        v14((uint64_t)v6, 1, 1, v12);
        swift_bridgeObjectRetain();
      }
      sub_21F49C960(a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21F49C960(a1);
      v14((uint64_t)v6, 1, 1, v12);
    }
    return sub_21F50C2A0((uint64_t)v6, a1);
  }
  return result;
}

void sub_21F530D60()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)v32 - v6;
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)v32 - v8;
  v32[1] = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager);
  sub_21F530918((uint64_t)v32 - v8);
  uint64_t v10 = sub_21F550340();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10) == 1)
  {
    sub_21F49C960((uint64_t)v9);
  }
  else
  {
    uint64_t v13 = sub_21F550300();
    unint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (v15) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = 0;
  unint64_t v15 = 0xE000000000000000;
LABEL_5:
  sub_21F534070(v13, v15);
  swift_bridgeObjectRelease();
  sub_21F53113C();
  swift_bridgeObjectRelease();
  sub_21F530918((uint64_t)v7);
  if (v12(v7, 1, v10) == 1)
  {
    sub_21F49C960((uint64_t)v7);
  }
  else
  {
    uint64_t v16 = (void *)sub_21F550330();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    if (v16)
    {
      if (v16[2])
      {
        id v17 = sub_21F52FC94();
        if (!v16[2])
        {
          __break(1u);
          goto LABEL_27;
        }
        uint64_t v18 = v17;
        uint64_t v19 = v16[4];
        unint64_t v20 = v16[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_21F534070(v19, v20);
        uint64_t v22 = v21;
        swift_bridgeObjectRelease();
        if (v22)
        {
          uint64_t v23 = (void *)sub_21F551560();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v23 = 0;
        }
        objc_msgSend(v18, sel_setText_, v23);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_21F530918((uint64_t)v4);
  if (v12(v4, 1, v10) == 1)
  {
    sub_21F49C960((uint64_t)v4);
    return;
  }
  unint64_t v24 = (void *)sub_21F550310();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v4, v10);
  if (v24)
  {
    if (!v24[2])
    {
      swift_bridgeObjectRelease();
      return;
    }
    id v25 = sub_21F52FCAC();
    if (v24[2])
    {
      char v26 = v25;
      uint64_t v27 = v24[4];
      unint64_t v28 = v24[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_21F534070(v27, v28);
      uint64_t v30 = v29;
      swift_bridgeObjectRelease();
      if (v30)
      {
        uint64_t v31 = (void *)sub_21F551560();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v31 = 0;
      }
      objc_msgSend(v26, sel_setTitle_forState_, v31, 0);

      return;
    }
LABEL_27:
    __break(1u);
  }
}

void sub_21F53113C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81678]), sel_init);
  id v2 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835E0]);
  objc_msgSend(v2, sel_pointSize);
  id v4 = objc_msgSend(self, sel_configurationWithPointSize_weight_, 7, v3);
  uint64_t v5 = *(void *)(*(void *)(v0
                             + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager)
                 + 136);
  id v6 = v4;
  uint64_t v7 = (void *)sub_21F551560();
  id v8 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v7, v6);

  if (v8)
  {
    id v9 = self;
    uint64_t v10 = &selRef_whiteColor;
    if ((v5 & 3) != 2) {
      uint64_t v10 = &selRef_systemBlueColor;
    }
    id v11 = [v9 *v10];
    id v12 = objc_msgSend(v8, sel_imageWithTintColor_, v11);
  }
  else
  {
    id v12 = 0;
  }
  objc_msgSend(v1, sel_setImage_, v12);

  swift_bridgeObjectRetain();
  sub_21F551600();
  id v13 = objc_allocWithZone(MEMORY[0x263F089B8]);
  unint64_t v14 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithString_, v14);

  id v16 = objc_msgSend(self, sel_attributedStringWithAttachment_, v1);
  objc_msgSend(v15, sel_appendAttributedString_, v16);

  id v17 = sub_21F52FC88();
  objc_msgSend(v17, sel_setAttributedText_, v15);
}

void sub_21F531424()
{
  swift_release();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton));
  id v1 = *(void **)(v0
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView);
}

id sub_21F5314A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingAddedToWalletViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingAddedToWalletViewController()
{
  return self;
}

id sub_21F531588(uint64_t a1, char *a2)
{
  v13[3] = &type metadata for RGBCaptureViewConfiguration;
  v13[4] = &off_26D0E2480;
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  id v8 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v13[0] = v4;
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v4 + 32) = v9;
  *(unsigned char *)(v4 + 48) = *(unsigned char *)(a1 + 32);
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_21F494F00((uint64_t)v13, (uint64_t)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v12.receiver = a2;
  v12.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v10;
}

id sub_21F531730(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  id v8 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  v12[4] = &off_26D0E28E0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  v12[0] = a1;
  v12[1] = a2;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v12[2] = a3;
  v12[3] = &type metadata for IdentityProofingReviewSubmissionViewConfiguration;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_21F494F00((uint64_t)v12, (uint64_t)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v11.receiver = a4;
  v11.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v9;
}

id sub_21F5318B4(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  void v11[3] = &type metadata for IDScanViewConfiguration;
  v11[4] = &off_26D0E0E48;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v11[0] = a1;
  v11[1] = a2;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_21F494F00((uint64_t)v11, (uint64_t)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v10.receiver = a3;
  v10.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v8 = objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v8;
}

id sub_21F531A34(char *a1)
{
  objc_super v2 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)objc_super v2 = 0;
  *((void *)v2 + 1) = 0;
  double v3 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)double v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  objc_super v10 = &type metadata for ProvideFeedbackViewConfiguration;
  objc_super v11 = &off_26D0E07B8;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_21F494F00((uint64_t)v9, (uint64_t)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

id sub_21F531BB0(uint64_t a1, char *a2)
{
  double v3 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(void *)double v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  v10[4] = &off_26D0E1F10;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v10[3] = &type metadata for UsingYourIDConfiguration;
  v10[0] = a1;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(void *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_21F494F00((uint64_t)v10, (uint64_t)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v9.receiver = a2;
  v9.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v7;
}

uint64_t sub_21F531D34()
{
  swift_release();

  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 49, 7);
}

id sub_21F531D84(uint64_t a1)
{
  objc_super v2 = (objc_class *)type metadata accessor for IdentityProofingAddedToWalletViewController();
  double v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager] = a1;
  v5.receiver = v3;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
}

ValueMetadata *type metadata accessor for DigitalPresentmentRootView()
{
  return &type metadata for DigitalPresentmentRootView;
}

uint64_t sub_21F531E2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F531E48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0548);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0550);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  objc_super v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v6 = sub_21F5510F0();
  *((void *)v6 + 1) = 0x403D000000000000;
  v6[16] = 0;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0558);
  sub_21F531FD8(a1, (uint64_t)&v6[*(int *)(v11 + 44)]);
  uint64_t v12 = sub_21F551370();
  char v13 = sub_21F551180();
  sub_21F475FD0((uint64_t)v6, (uint64_t)v10, &qword_267EE0548);
  unint64_t v14 = &v10[*(int *)(v8 + 44)];
  *(void *)unint64_t v14 = v12;
  v14[8] = v13;
  sub_21F47F030((uint64_t)v6, &qword_267EE0548);
  uint64_t KeyPath = swift_getKeyPath();
  sub_21F475FD0((uint64_t)v10, a2, &qword_267EE0550);
  uint64_t v16 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EE0560) + 36);
  *(void *)uint64_t v16 = KeyPath;
  *(void *)(v16 + 8) = 0;
  *(unsigned char *)(v16 + 16) = 1;
  return sub_21F47F030((uint64_t)v10, &qword_267EE0550);
}

uint64_t sub_21F531FD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0568);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v23 - v8;
  uint64_t v10 = sub_21F550E70();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v23[1] = a1;
  sub_21F489E6C();
  sub_21F54ECA0();
  swift_release();
  uint64_t v14 = a1 + OBJC_IVAR____TtC9CoreIDVUI31DigitalPresentmentRootViewModel__displayConfiguration;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  uint64_t v15 = sub_21F550D90();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v17)
  {
    uint64_t v18 = sub_21F485A4C();
    char v19 = sub_21F485F1C() & 1;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v18 = 0;
    char v19 = 0;
  }
  *(void *)uint64_t v9 = sub_21F551100();
  *((void *)v9 + 1) = 0x4020000000000000;
  v9[16] = 0;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0570);
  sub_21F532280(a1, (uint64_t)&v9[*(int *)(v20 + 44)]);
  sub_21F475FD0((uint64_t)v9, (uint64_t)v7, &qword_267EE0568);
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v17;
  *(void *)(a2 + 16) = v18;
  *(unsigned char *)(a2 + 24) = v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0578);
  sub_21F475FD0((uint64_t)v7, a2 + *(int *)(v21 + 48), &qword_267EE0568);
  sub_21F532780(v15, v17);
  sub_21F47F030((uint64_t)v9, &qword_267EE0568);
  sub_21F47F030((uint64_t)v7, &qword_267EE0568);
  return sub_21F5327C4(v15, v17);
}

uint64_t sub_21F532280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = type metadata accessor for DigitalPresentmentPassView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v45 = v3;
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v3);
  id v42 = (uint64_t *)((char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_21F550CF0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = sub_21F550E70();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0580);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v44 = (uint64_t)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v43 = (uint64_t)&v41 - v20;
  swift_getKeyPath();
  uint64_t v48 = a1;
  sub_21F489E6C();
  sub_21F54ECA0();
  swift_release();
  uint64_t v21 = a1 + OBJC_IVAR____TtC9CoreIDVUI31DigitalPresentmentRootViewModel__displayConfiguration;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v21, v13);
  sub_21F550E00();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F35F08], v6);
  LOBYTE(v21) = sub_21F550CE0();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  v22(v10, v6);
  v22(v12, v6);
  if (v21)
  {
    uint64_t v23 = sub_21F486B10();
    uint64_t v25 = v24;
    uint64_t v26 = sub_21F486F6C();
    uint64_t v28 = v27;
    uint64_t v29 = sub_21F4863C8();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v31 = (uint64_t)v42;
    *id v42 = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEE00);
    swift_storeEnumTagMultiPayload();
    uint64_t v32 = v45;
    uint64_t v33 = (uint64_t *)(v31 + *(int *)(v45 + 20));
    *uint64_t v33 = v23;
    v33[1] = v25;
    char v34 = (uint64_t *)(v31 + *(int *)(v32 + 24));
    *char v34 = v26;
    v34[1] = v28;
    *(void *)(v31 + *(int *)(v32 + 28)) = v29;
    uint64_t v35 = v43;
    sub_21F532810(v31, v43);
    uint64_t v36 = 0;
    uint64_t v37 = v32;
  }
  else
  {
    uint64_t v36 = 1;
    uint64_t v37 = v45;
    uint64_t v35 = v43;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(v35, v36, 1, v37);
  uint64_t v38 = v44;
  sub_21F475FD0(v35, v44, &qword_267EE0580);
  uint64_t v39 = v47;
  sub_21F475FD0(v38, v47, &qword_267EE0580);
  *(void *)(v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267EE0588) + 48)) = a1;
  swift_retain_n();
  sub_21F47F030(v35, &qword_267EE0580);
  swift_release();
  return sub_21F47F030(v38, &qword_267EE0580);
}

uint64_t sub_21F53270C@<X0>(uint64_t a1@<X8>)
{
  return sub_21F531E48(*v1, a1);
}

uint64_t sub_21F532714@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_21F551060();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_21F532748()
{
  return sub_21F551070();
}

uint64_t sub_21F532780(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21F5327C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_21F532810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DigitalPresentmentPassView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F532878()
{
  unint64_t result = qword_267EE0590;
  if (!qword_267EE0590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EE0560);
    sub_21F532918();
    sub_21F48D5A4(&qword_267EE05A8, &qword_267EE05B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EE0590);
  }
  return result;
}

unint64_t sub_21F532918()
{
  unint64_t result = qword_267EE0598;
  if (!qword_267EE0598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EE0550);
    sub_21F48D5A4(&qword_267EE05A0, &qword_267EE0548);
    sub_21F48D5A4(&qword_267EE03A0, &qword_267EE03A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EE0598);
  }
  return result;
}

uint64_t IdentityDocumentPresentmentConsentView.relyingParty.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);

  return sub_21F532A6C(v3, a1);
}

uint64_t type metadata accessor for IdentityDocumentPresentmentConsentView()
{
  uint64_t result = qword_267EE05B8;
  if (!qword_267EE05B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21F532A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F532AD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F532A6C(a1, (uint64_t)v4);
  return IdentityDocumentPresentmentConsentView.relyingParty.setter((uint64_t)v4);
}

uint64_t IdentityDocumentPresentmentConsentView.relyingParty.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F550C80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)v1 + *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  sub_21F532D30(a1, v10);
  sub_21F532A6C(v10, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_21F532D98((uint64_t)v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    uint64_t v11 = v1[1];
    v13[1] = *v1;
    v13[2] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF378);
    sub_21F551400();
    sub_21F487A10();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return sub_21F532D98(a1);
}

uint64_t sub_21F532D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F532D98(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*IdentityDocumentPresentmentConsentView.relyingParty.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  v3[4] = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  uint64_t v5 = sub_21F550C80();
  v3[5] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[6] = v6;
  v3[7] = malloc(*(void *)(v6 + 64));
  *((_DWORD *)v3 + 16) = *(_DWORD *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  return sub_21F532EDC;
}

void sub_21F532EDC(void **a1, char a2)
{
  uint64_t v2 = (int *)*a1;
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *((void *)v2 + 5);
    uint64_t v4 = *((void *)v2 + 6);
    uint64_t v5 = *((void *)v2 + 4);
    sub_21F532A6C(*((void *)v2 + 3) + v2[16], v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_21F532D98(*((void *)v2 + 4));
    }
    else
    {
      uint64_t v7 = *((void *)v2 + 6);
      uint64_t v6 = *((void *)v2 + 7);
      uint64_t v8 = *((void *)v2 + 5);
      uint64_t v9 = (void *)*((void *)v2 + 3);
      (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v6, *((void *)v2 + 4), v8);
      uint64_t v10 = v9[1];
      *(void *)uint64_t v2 = *v9;
      *((void *)v2 + 1) = v10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF378);
      sub_21F551400();
      sub_21F487A10();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
  }
  uint64_t v11 = (void *)*((void *)v2 + 4);
  free(*((void **)v2 + 7));
  free(v11);

  free(v2);
}

uint64_t IdentityDocumentPresentmentConsentView.init(elementCategoryGroups:relyingParty:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v54 = a1;
  uint64_t v56 = sub_21F550C80();
  uint64_t v45 = *(void *)(v56 - 8);
  uint64_t v4 = v45;
  MEMORY[0x270FA5388](v56);
  uint64_t v43 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F550C50();
  MEMORY[0x270FA5388](v6 - 8);
  char v53 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  char v49 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v48 = (char *)&v42 - v11;
  uint64_t v47 = sub_21F550DC0();
  uint64_t v12 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v46 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21F550CF0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = v17;
  uint64_t v18 = sub_21F550D50();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  uint64_t v55 = a3;
  uint64_t v23 = (uint64_t)a3 + v22;
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v24(v23, 1, 1, v56);
  uint64_t v50 = v23;
  sub_21F532D30(v57, v23);
  uint64_t v51 = v19;
  uint64_t v52 = v18;
  uint64_t v25 = v54;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v54, v18);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F35F10], v14);
  uint64_t v26 = v46;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v46, *MEMORY[0x263F35F28], v47);
  uint64_t v27 = sub_21F550D40();
  LODWORD(v12) = v28 & 1;
  uint64_t v29 = (uint64_t)v48;
  uint64_t v30 = v56;
  v24((uint64_t)v48, 1, 1, v56);
  uint64_t v31 = v25;
  uint64_t v32 = (uint64_t)v49;
  uint64_t v33 = (uint64_t)v53;
  sub_21F550D00();
  uint64_t v34 = (uint64_t)v26;
  uint64_t v35 = v57;
  int v36 = v12;
  uint64_t v37 = v45;
  uint64_t v38 = sub_21F48B0F0((uint64_t)v21, (uint64_t)v44, v34, v27, v36, v29, 0, 0, v33);
  sub_21F532A6C(v35, v32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v32, 1, v30) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v31, v52);
    sub_21F532D98(v32);
  }
  else
  {
    uint64_t v39 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v43, v32, v30);
    sub_21F487A10();
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v31, v52);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v30);
  }
  uint64_t result = sub_21F53353C(v35, v50);
  uint64_t v41 = v55;
  *uint64_t v55 = v38;
  v41[1] = 0;
  return result;
}

uint64_t IdentityDocumentPresentmentConsentView.body.getter@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF378);
  uint64_t result = sub_21F551400();
  *a1 = v3;
  return result;
}

uint64_t sub_21F53353C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F5335A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21F5335C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);

  return sub_21F532A6C(v3, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for IdentityDocumentPresentmentConsentView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_21F550C80();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_retain();
    swift_retain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v5;
}

uint64_t destroy for IdentityDocumentPresentmentConsentView(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_21F550C80();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for IdentityDocumentPresentmentConsentView(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_21F550C80();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_retain();
  swift_retain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithCopy for IdentityDocumentPresentmentConsentView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21F550C80();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for IdentityDocumentPresentmentConsentView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_21F550C80();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for IdentityDocumentPresentmentConsentView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21F550C80();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityDocumentPresentmentConsentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F533E08);
}

uint64_t sub_21F533E08(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for IdentityDocumentPresentmentConsentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F533ED0);
}

void *sub_21F533ED0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEA18);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_21F533F7C()
{
  sub_21F534014();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21F534014()
{
  if (!qword_267EE05C8)
  {
    sub_21F550C80();
    unint64_t v0 = sub_21F551960();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EE05C8);
    }
  }
}

uint64_t sub_21F534070(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_21F550C10();
  os_log_type_t v11 = sub_21F5517A0();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v21 = a1;
  if (v12)
  {
    uint64_t v20 = v3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v6;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v23 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21F4BAC68(a1, a2, &v23);
    uint64_t v3 = v20;
    sub_21F551970();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21F464000, v10, v11, "looking up text for %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v15, -1, -1);
    MEMORY[0x223C4F110](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (!*(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper)) {
    return 0;
  }
  swift_retain();
  uint64_t v16 = sub_21F550380();
  swift_release();
  return v16;
}

id sub_21F5342D8(void *a1, void *a2)
{
  uint64_t v4 = sub_21F550C20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v8 = sub_21F542474(a1);
  sub_21F54EF20();
  uint64_t v9 = sub_21F550C10();
  os_log_type_t v10 = sub_21F5517A0();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v11 = 67109120;
    void v13[3] = v8;
    sub_21F551970();
    _os_log_impl(&dword_21F464000, v9, v10, "shouldAnimate while pushing viewcontroller on the navigation stack : %{BOOL}d", v11, 8u);
    MEMORY[0x223C4F110](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return objc_msgSend(a2, sel_pushViewController_animated_, a1, v8);
}

void sub_21F53447C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_21F550C20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_21F4A09F4();
  id v36 = v14;
  swift_release();
  type metadata accessor for IdentityProofingTCViewController();
  uint64_t v15 = swift_dynamicCastClass();
  if (v15)
  {
    uint64_t v16 = *(void **)(v4 + 168);
    *(void *)(v5 + 168) = v15;
    id v17 = v36;

    if (*(void *)(v5 + 168)) {
      swift_weakAssign();
    }
    sub_21F54EF20();
    uint64_t v18 = sub_21F550C10();
    os_log_type_t v19 = sub_21F5517A0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      id v36 = v17;
      uint64_t v21 = a1;
      uint64_t v22 = a3;
      uint64_t v23 = a4;
      uint64_t v24 = v20;
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_21F464000, v18, v19, "The page to show is termsAndConditions", v20, 2u);
      uint64_t v25 = v24;
      a4 = v23;
      a3 = v22;
      a1 = v21;
      id v17 = v36;
      MEMORY[0x223C4F110](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v26 = *(void **)(v5 + 168);
    if (v26)
    {
      id v27 = v26;
      sub_21F4EFA50(a1, a3, a4);

      char v28 = *(char **)(v5 + 168);
      if (v28)
      {
        uint64_t v29 = (void (**)())&v28[OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_agreeClicked];
        uint64_t v30 = *(void *)&v28[OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_agreeClicked];
        *uint64_t v29 = sub_21F54B7A8;
        v29[1] = (void (*)())v5;
        uint64_t v31 = v28;
        swift_retain();
        sub_21F47D8F8(v30);
      }
    }

    return;
  }
  type metadata accessor for IdentityProofingErrorViewController();
  if (swift_dynamicCastClass())
  {
    uint64_t v32 = sub_21F544DF8();

    id v33 = (id)v32;
    if (!a1) {
      goto LABEL_18;
    }
LABEL_14:
    id v36 = v33;
    if (a2 == 2) {
      char v34 = sub_21F542474(v33);
    }
    else {
      char v34 = a2 & 1;
    }
    sub_21F4EBFBC((uint64_t)v36, v34 & 1, a3, a4);
    id v33 = v36;
    goto LABEL_18;
  }
  id v33 = v36;
  if (a1) {
    goto LABEL_14;
  }
LABEL_18:
}

uint64_t sub_21F534790(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE638);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

void sub_21F534828(void *a1)
{
  uint64_t v2 = sub_21F550C20();
  uint64_t v30 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_21F4A09F4();
  id v6 = v5;
  swift_release();
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v6);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829A8]), sel_init);
  objc_msgSend(v8, sel_configureWithTransparentBackground);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF490);
  uint64_t inited = swift_initStackObject();
  uint64_t v10 = (void **)MEMORY[0x263F81500];
  *(_OWORD *)(inited + 16) = xmmword_21F554510;
  uint64_t v11 = *v10;
  *(void *)(inited + 32) = *v10;
  uint64_t v12 = self;
  id v13 = v11;
  id v14 = objc_msgSend(v12, sel_systemOrangeColor);
  *(void *)(inited + 64) = sub_21F46EFD8(0, (unint64_t *)&qword_267EDE938);
  *(void *)(inited + 40) = v14;
  sub_21F471760(inited);
  type metadata accessor for Key(0);
  sub_21F54B9C8((unint64_t *)&qword_267EDE518, type metadata accessor for Key);
  uint64_t v15 = (void *)sub_21F5514E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setTitleTextAttributes_, v15);

  objc_msgSend(v7, sel_setModalPresentationStyle_, 1);
  objc_msgSend(v7, sel_setModalInPresentation_, 1);
  id v16 = objc_msgSend(v7, sel_navigationBar);
  objc_msgSend(v16, sel_setStandardAppearance_, v8);

  sub_21F54EF20();
  id v17 = v6;
  uint64_t v18 = sub_21F550C10();
  os_log_type_t v19 = sub_21F5517A0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v29 = a1;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    id v27 = v20;
    *(_DWORD *)uint64_t v20 = 138412290;
    uint64_t v31 = v17;
    uint64_t v21 = v17;
    char v28 = v4;
    uint64_t v22 = v21;
    a1 = v29;
    sub_21F551970();
    uint64_t v23 = v26;
    *uint64_t v26 = v17;

    uint64_t v24 = v27;
    uint64_t v4 = v28;
    _os_log_impl(&dword_21F464000, v18, v19, "IdentityProofingFlowManager about to present: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEC70);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v23, -1, -1);
    MEMORY[0x223C4F110](v24, -1, -1);
  }
  else
  {

    uint64_t v18 = v17;
  }

  (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v2);
  if (a1) {
    objc_msgSend(a1, sel_presentViewController_animated_completion_, v7, 1, 0);
  }
}

char *sub_21F534C48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F54F8D0();
  if (!v3) {
    uint64_t v2 = 0;
  }
  uint64_t v4 = 0xE000000000000000;
  if (v3) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = 0xE000000000000000;
  }
  uint64_t v6 = sub_21F534070(v2, v5);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_21F54F910();
  if (!v9) {
    goto LABEL_15;
  }
  if (!v9[2])
  {
    swift_bridgeObjectRelease();
LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = v9[4];
  unint64_t v11 = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_21F534070(v10, v11);
  uint64_t v4 = v13;
  swift_bridgeObjectRelease();
  if (v4) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 0;
  }
  if (!v4) {
    uint64_t v4 = 0xE000000000000000;
  }
LABEL_16:
  uint64_t v15 = (void *)sub_21F54F910();
  uint64_t v42 = v14;
  if (!v15)
  {
LABEL_25:
    uint64_t v41 = 0;
    uint64_t v22 = 0xE000000000000000;
    goto LABEL_26;
  }
  if (v15[2] < 2uLL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  uint64_t v16 = v15[6];
  unint64_t v17 = v15[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_21F534070(v16, v17);
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  if (v20) {
    uint64_t v21 = v18;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v41 = v21;
  if (v20) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = 0xE000000000000000;
  }
LABEL_26:
  if (!v8)
  {
    uint64_t v8 = 0xE000000000000000;
    uint64_t v6 = 0;
  }
  uint64_t v23 = sub_21F54F870();
  if (v24)
  {
    unint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
  uint64_t v26 = sub_21F534070(v23, v25);
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  if (v28) {
    uint64_t v29 = v26;
  }
  else {
    uint64_t v29 = 0;
  }
  if (v28) {
    uint64_t v30 = v28;
  }
  else {
    uint64_t v30 = 0xE000000000000000;
  }
  type metadata accessor for IdentityProofingNavigationControllerHelper();
  uint64_t v31 = swift_allocObject();
  id v32 = objc_allocWithZone((Class)type metadata accessor for IdentityErrorViewController());
  swift_retain();
  id v33 = (char *)sub_21F4FC2F0(v6, v8, v42, v4, v29, v30, v41, v22, v31, v1);
  swift_release();
  swift_release();
  uint64_t v34 = swift_allocObject();
  swift_weakInit();
  uint64_t v35 = (uint64_t (**)())&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  uint64_t v36 = *(void *)&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  *uint64_t v35 = sub_21F54B9B8;
  v35[1] = (uint64_t (*)())v34;
  sub_21F47D8F8(v36);
  uint64_t v37 = swift_allocObject();
  swift_weakInit();
  uint64_t v38 = (uint64_t (**)())&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  uint64_t v39 = *(void *)&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  *uint64_t v38 = sub_21F54B9C0;
  v38[1] = (uint64_t (*)())v37;
  sub_21F47D8F8(v39);
  sub_21F538974();
  return v33;
}

uint64_t sub_21F534F10(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE848);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  unint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v46 - v6;
  uint64_t v8 = sub_21F550C20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v46 - v14;
  if (a1)
  {
    char v49 = v13;
    uint64_t v50 = v5;
    uint64_t v51 = v12;
    id v16 = a1;
    sub_21F54EF20();
    id v17 = a1;
    id v18 = a1;
    uint64_t v19 = sub_21F550C10();
    os_log_type_t v20 = sub_21F5517A0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v47 = v8;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v46 = v9;
      uint64_t v24 = v23;
      uint64_t v53 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v48 = v7;
      swift_getErrorValue();
      uint64_t v25 = sub_21F551C60();
      uint64_t v52 = sub_21F4BAC68(v25, v26, &v53);
      uint64_t v7 = v48;
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v19, v20, "Received an error from proofing %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v27 = v24;
      uint64_t v9 = v46;
      MEMORY[0x223C4F110](v27, -1, -1);
      uint64_t v28 = v22;
      uint64_t v8 = v47;
      MEMORY[0x223C4F110](v28, -1, -1);
    }
    else
    {
    }
    uint64_t v30 = *(void (**)(char *, uint64_t))(v9 + 8);
    v30(v15, v8);
    swift_getErrorValue();
    sub_21F551C70();
    uint64_t v31 = sub_21F550540();
    uint64_t v32 = *(void *)(v31 - 8);
    int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v7, 1, v31);
    uint64_t v34 = v51;
    if (v33 != 1)
    {
      uint64_t v40 = (uint64_t)v50;
      sub_21F475FD0((uint64_t)v7, (uint64_t)v50, &qword_267EDE848);
      int v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 88))(v40, v31);
      if (v41 == *MEMORY[0x263F364F8] || v41 == *MEMORY[0x263F364C8]) {
        goto LABEL_20;
      }
      if (v41 == *MEMORY[0x263F36528])
      {
        uint64_t v42 = v49;
        sub_21F54EF20();
        uint64_t v43 = sub_21F550C10();
        os_log_type_t v44 = sub_21F5517A0();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v45 = 0;
          _os_log_impl(&dword_21F464000, v43, v44, "Received a provisioning identity failure error", v45, 2u);
          uint64_t v42 = v49;
          MEMORY[0x223C4F110](v45, -1, -1);
        }

        v30(v42, v8);
        uint64_t v38 = sub_21F545410();
        goto LABEL_12;
      }
      if (v41 == *MEMORY[0x263F36420])
      {
LABEL_20:
        sub_21F47F030((uint64_t)v7, &qword_267EDE848);
        uint64_t v39 = sub_21F544DF8();

        return v39;
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v50, v31);
    }
    sub_21F54EF20();
    uint64_t v35 = sub_21F550C10();
    os_log_type_t v36 = sub_21F5517A0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_21F464000, v35, v36, "No specific error Received from proofing. Showing generic error", v37, 2u);
      uint64_t v34 = v51;
      MEMORY[0x223C4F110](v37, -1, -1);
    }

    v30(v34, v8);
    uint64_t v38 = sub_21F544DF8();
LABEL_12:
    uint64_t v39 = v38;

    sub_21F47F030((uint64_t)v7, &qword_267EDE848);
    return v39;
  }

  return sub_21F544DF8();
}

uint64_t sub_21F535500(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v27 = (char *)a2;
  uint64_t v24 = a1;
  uint64_t v4 = sub_21F551840();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v21 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F551820();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_21F5514A0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF5A8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages);
  uint64_t v15 = *(void *)(v2 + 176);
  uint64_t v16 = *(void *)(v2 + 112);
  sub_21F4FA0BC(v24, (uint64_t)v13);
  uint64_t v17 = (uint64_t)v27;
  uint64_t v27 = v10;
  sub_21F475FD0(v17, (uint64_t)v10, &qword_267EDF5A8);
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDEC50);
  uint64_t v23 = v15;
  swift_bridgeObjectRetain();
  uint64_t v22 = v16;
  swift_unknownObjectRetain();
  uint64_t v24 = v14;
  swift_bridgeObjectRetain();
  sub_21F551490();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_21F54B9C8(&qword_267EE0270, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0278);
  sub_21F519B98(&qword_267EE0280, &qword_267EE0278);
  sub_21F551A00();
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v21, *MEMORY[0x263F8F130], v26);
  uint64_t v18 = sub_21F551880();
  if (qword_267EDE328 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_267EE25B0;
  type metadata accessor for IdentityProofingUploadsManager();
  swift_allocObject();
  swift_retain();
  swift_retain();
  *(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager) = sub_21F4F2900(v24, v23, v22, v3, (uint64_t)v13, (uint64_t)v27, v18, v19);
  return swift_release();
}

uint64_t sub_21F5358E0(void *a1)
{
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(uint8_t **)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = objc_msgSend(a1, sel_navigationController);
  if (!v9) {
    uint64_t v9 = a1;
  }
  uint64_t v10 = [v9 presentingViewController];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 dismissViewControllerAnimated:1 completion:0];
    swift_retain();
    sub_21F4A0FF4();
    swift_release();
    sub_21F54EF20();
    uint64_t v12 = a1;
    uint64_t v13 = sub_21F550C10();
    os_log_type_t v14 = sub_21F5517A0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v32 = v2;
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      uint64_t v30 = v15;
      *(_DWORD *)uint64_t v15 = 138412290;
      int v33 = v12;
      uint64_t v16 = v12;
      uint64_t v31 = v9;
      uint64_t v17 = v16;
      uint64_t v2 = v32;
      sub_21F551970();
      uint64_t v18 = v29;
      *uint64_t v29 = v12;

      uint64_t v19 = v30;
      _os_log_impl(&dword_21F464000, v13, v14, "IdentityProofingFlowManager dismissing %@ and reverting back to base view modal", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEC70);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v18, -1, -1);
      MEMORY[0x223C4F110](v19, -1, -1);

      uint64_t v12 = v31;
    }
    else
    {

      uint64_t v11 = v12;
    }
  }
  else
  {
    sub_21F54EF20();
    os_log_type_t v20 = a1;
    uint64_t v12 = sub_21F550C10();
    os_log_type_t v21 = sub_21F5517A0();
    if (os_log_type_enabled(v12, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v32 = v2;
      int v33 = v20;
      uint64_t v24 = (void *)v23;
      uint64_t v30 = v3;
      uint64_t v31 = v9;
      *(_DWORD *)uint64_t v22 = 138412290;
      uint64_t v25 = v20;
      uint64_t v3 = v30;
      sub_21F551970();
      *uint64_t v24 = v20;

      _os_log_impl(&dword_21F464000, v12, v21, "IdentityProofingFlowManager could not dismiss %@; not being presented",
        v22,
        0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEC70);
      swift_arrayDestroy();
      uint64_t v26 = v24;
      uint64_t v2 = v32;
      MEMORY[0x223C4F110](v26, -1, -1);
      MEMORY[0x223C4F110](v22, -1, -1);
      uint64_t v11 = v31;
    }
    else
    {

      uint64_t v12 = v20;
      uint64_t v11 = v9;
    }
    uint64_t v8 = v6;
  }

  return (*((uint64_t (**)(char *, uint64_t))v3 + 1))(v8, v2);
}

uint64_t sub_21F535CCC(void *a1)
{
  return sub_21F5425B4(a1, 0x800000021F55EF40, "Unable to show the Account Service unable alert as the server doesn't have the related fields in the config");
}

uint64_t sub_21F535CE8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v81 = a2;
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v78 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v78 - v18;
  MEMORY[0x270FA5388](v17);
  os_log_type_t v21 = (char *)&v78 - v20;
  id v86 = (char *)v6;
  uint64_t v87 = v3;
  uint64_t v22 = *(void *)(v3 + 176);
  id v84 = v9;
  uint64_t v85 = v7;
  id v82 = a1;
  uint64_t v83 = a3;
  if (v22 && *(void *)(v22 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v23 = sub_21F472B68(0x4153487472656C61, 0xE900000000000032);
    if (v24)
    {
      unint64_t v25 = v23;
      uint64_t v26 = *(void *)(v22 + 56);
      uint64_t v27 = sub_21F550340();
      uint64_t v28 = v21;
      uint64_t v29 = *(void *)(v27 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v29 + 16))(v28, v26 + *(void *)(v29 + 72) * v25, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v28, 0, 1, v27);
      os_log_type_t v21 = v28;
    }
    else
    {
      uint64_t v27 = sub_21F550340();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v21, 1, 1, v27);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = sub_21F550340();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v21, 1, 1, v27);
  }
  sub_21F475FD0((uint64_t)v21, (uint64_t)v19, &qword_267EDEEC8);
  sub_21F550340();
  uint64_t v30 = *(void *)(v27 - 8);
  uint64_t v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
  if (v31(v19, 1, v27) == 1)
  {
    sub_21F47F030((uint64_t)v19, &qword_267EDEEC8);
  }
  else
  {
    uint64_t v32 = sub_21F550300();
    unint64_t v34 = v33;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v19, v27);
    if (v34)
    {
      uint64_t v80 = sub_21F534070(v32, v34);
      uint64_t v36 = v35;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  uint64_t v80 = 0;
  uint64_t v36 = 0;
LABEL_13:
  sub_21F475FD0((uint64_t)v21, (uint64_t)v16, &qword_267EDEEC8);
  if (v31(v16, 1, v27) == 1)
  {
    sub_21F47F030((uint64_t)v16, &qword_267EDEEC8);
  }
  else
  {
    uint64_t v37 = (void *)sub_21F550330();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v27);
    if (v37)
    {
      if (v37[2])
      {
        uint64_t v78 = v36;
        uint64_t v38 = v21;
        uint64_t v39 = v37[4];
        unint64_t v40 = v37[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v79 = sub_21F534070(v39, v40);
        uint64_t v42 = v41;
        os_log_type_t v21 = v38;
        uint64_t v36 = v78;
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v79 = 0;
  uint64_t v42 = 0;
LABEL_20:
  sub_21F475FD0((uint64_t)v21, (uint64_t)v13, &qword_267EDEEC8);
  if (v31(v13, 1, v27) == 1)
  {
    sub_21F47F030((uint64_t)v13, &qword_267EDEEC8);
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    if (!v36) {
      goto LABEL_37;
    }
    goto LABEL_22;
  }
  uint64_t v61 = v21;
  char v62 = (void *)sub_21F550310();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v27);
  if (!v62) {
    goto LABEL_35;
  }
  unint64_t v63 = v62[2];
  if (!v63)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    goto LABEL_36;
  }
  uint64_t v64 = v62[4];
  unint64_t v65 = v62[5];
  swift_bridgeObjectRetain();
  sub_21F534070(v64, v65);
  uint64_t v44 = v66;
  uint64_t result = swift_bridgeObjectRelease();
  if (!v44 || v63 <= 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = 0;
LABEL_36:
    os_log_type_t v21 = v61;
    if (!v36) {
      goto LABEL_37;
    }
LABEL_22:
    if (v42 && v44 && v43)
    {
      uint64_t v45 = sub_21F551560();
      id v86 = v21;
      uint64_t v46 = (void *)v45;
      swift_bridgeObjectRelease();
      uint64_t v47 = (void *)sub_21F551560();
      swift_bridgeObjectRelease();
      id v48 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v46, v47, 1);

      char v49 = (void *)swift_allocObject();
      uint64_t v50 = v81;
      uint64_t v51 = v82;
      v49[2] = v87;
      v49[3] = v51;
      uint64_t v52 = v83;
      v49[4] = v50;
      v49[5] = v52;
      swift_retain();
      id v53 = v51;
      swift_retain();
      uint64_t v54 = (void *)sub_21F551560();
      swift_bridgeObjectRelease();
      aBlock[4] = sub_21F54B33C;
      aBlock[5] = v49;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_21F46C554;
      aBlock[3] = &block_descriptor_201;
      uint64_t v55 = _Block_copy(aBlock);
      swift_release();
      uint64_t v56 = self;
      id v57 = objc_msgSend(v56, sel_actionWithTitle_style_handler_, v54, 0, v55);
      uint64_t v58 = v55;
      os_log_type_t v21 = v86;
      _Block_release(v58);

      uint64_t v59 = (void *)sub_21F551560();
      swift_bridgeObjectRelease();
      id v60 = objc_msgSend(v56, sel_actionWithTitle_style_handler_, v59, 0, 0);

      objc_msgSend(v48, sel_addAction_, v57);
      objc_msgSend(v48, sel_addAction_, v60);
      objc_msgSend(v53, sel_presentViewController_animated_completion_, v48, 1, 0);

      return sub_21F47F030((uint64_t)v21, &qword_267EDEEC8);
    }
LABEL_37:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v71 = v84;
    sub_21F54EF20();
    id v72 = sub_21F550C10();
    os_log_type_t v73 = sub_21F5517A0();
    BOOL v74 = os_log_type_enabled(v72, v73);
    uint64_t v76 = v85;
    CGFloat v75 = v86;
    if (v74)
    {
      CGFloat v77 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGFloat v77 = 0;
      _os_log_impl(&dword_21F464000, v72, v73, "Unable to show the HSA2 upgrade alert as the server doesn't have the related fields in the config", v77, 2u);
      MEMORY[0x223C4F110](v77, -1, -1);
    }

    (*(void (**)(char *, char *))(v76 + 8))(v71, v75);
    return sub_21F47F030((uint64_t)v21, &qword_267EDEEC8);
  }
  if (v62[2] >= 2uLL)
  {
    uint64_t v68 = v62[6];
    unint64_t v69 = v62[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_21F534070(v68, v69);
    uint64_t v43 = v70;
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_21F5365F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F54F7A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8))
  {
    uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    unint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
    uint64_t v14 = v6;
  }
  else
  {
    unint64_t v13 = 0xE000000000000000;
    uint64_t v14 = 0;
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8))
  {
    uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
    unint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8);
    uint64_t v12 = v7;
  }
  else
  {
    unint64_t v11 = 0xE000000000000000;
    uint64_t v12 = 0;
  }
  sub_21F5503A0();
  uint64_t v8 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21F54F790();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper) = sub_21F550390();
  return swift_release();
}

uint64_t sub_21F5367E8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21F536808()
{
  if (!*(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8)
    || !*(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8))
  {
    return 0;
  }
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21F551600();
  sub_21F551600();
  swift_bridgeObjectRelease();
  sub_21F551600();
  sub_21F551600();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_21F536914(v3, v4);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_21F536914(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = a1;
  uint64_t v5 = sub_21F54F7A0();
  uint64_t v45 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F550C20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v38 - v13;
  unint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  if (!v15 || (unint64_t v16 = *(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8)) == 0)
  {
    sub_21F54EF20();
    uint64_t v30 = sub_21F550C10();
    os_log_type_t v31 = sub_21F5517A0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_21F464000, v30, v31, "State and Country cannot be nil)", v32, 2u);
      MEMORY[0x223C4F110](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return 0;
  }
  uint64_t v17 = *(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
  uint64_t v42 = *(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
  uint64_t v43 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21F54EF20();
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_21F550C10();
  os_log_type_t v19 = sub_21F5517A0();
  int v44 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v41 = a2;
    uint64_t v21 = v20;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v49 = v40;
    *(_DWORD *)uint64_t v21 = 136315650;
    os_log_t v39 = v18;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_21F4BAC68(v42, v15, &v49);
    uint64_t v42 = v8;
    sub_21F551970();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_21F4BAC68(v43, v16, &v49);
    sub_21F551970();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 22) = 2080;
    uint64_t v22 = v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
    swift_beginAccess();
    uint64_t v23 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v7, v22, v5);
    uint64_t v24 = sub_21F54F790();
    unint64_t v26 = v25;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v5);
    uint64_t v47 = sub_21F4BAC68(v24, v26, &v49);
    sub_21F551970();
    swift_release_n();
    swift_bridgeObjectRelease();
    os_log_t v27 = v39;
    _os_log_impl(&dword_21F464000, v39, (os_log_type_t)v44, "The state is %s, country is %s, IDType is %s", (uint8_t *)v21, 0x20u);
    uint64_t v28 = v40;
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v28, -1, -1);
    uint64_t v29 = v21;
    a2 = v41;
    MEMORY[0x223C4F110](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v42);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  uint64_t v33 = *(void *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements);
  if (!*(void *)(v33 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_21F472B68(v46, a2);
  if ((v35 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v36 = *(void *)(*(void *)(v33 + 56) + 16 * v34);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_21F536E48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v25 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v25 - v10;
  sub_21F54EF20();
  uint64_t v12 = sub_21F550C10();
  os_log_type_t v13 = sub_21F5517A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21F464000, v12, v13, "IdentityProofingFlowManager - deinit", v14, 2u);
    MEMORY[0x223C4F110](v14, -1, -1);
  }

  unint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v11, v2);
  sub_21F54FA60();
  if (swift_dynamicCastClass())
  {
    swift_unknownObjectRetain();
    sub_21F54EF20();
    unint64_t v16 = sub_21F550C10();
    os_log_type_t v17 = sub_21F5517A0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_21F464000, v16, v17, "IdentityProofingFlowManager - connection is IdentityManagementUIClient, calling invalidate", v18, 2u);
      MEMORY[0x223C4F110](v18, -1, -1);
    }

    v15(v6, v2);
    sub_21F54FA40();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_21F54EF20();
    os_log_type_t v19 = sub_21F550C10();
    os_log_type_t v20 = sub_21F5517A0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_21F464000, v19, v20, "IdentityProofingFlowManager - connection is not IdentityManagementUIClient, no invalidate called", v21, 2u);
      MEMORY[0x223C4F110](v21, -1, -1);
    }

    v15(v9, v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21F4BD3D8(v1 + 96);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  uint64_t v22 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  uint64_t v23 = sub_21F54F7A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  swift_release();
  sub_21F47F030(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData, &qword_267EDF5A8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_21F53732C()
{
  sub_21F536E48();

  return swift_deallocClassInstance();
}

uint64_t sub_21F537384()
{
  return type metadata accessor for IdentityProofingFlowManager();
}

uint64_t type metadata accessor for IdentityProofingFlowManager()
{
  uint64_t result = qword_267EE0638;
  if (!qword_267EE0638) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21F5373D8()
{
  sub_21F54F7A0();
  if (v0 <= 0x3F)
  {
    sub_21F4F6A20();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_21F537578(uint64_t a1, void *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_21F550C20();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  os_log_type_t v17 = (char *)&v45 - v16;
  MEMORY[0x270FA5388](v15);
  os_log_type_t v19 = (char *)&v45 - v18;
  if (a2)
  {
    id v20 = a2;
    sub_21F54EF20();
    id v21 = a2;
    id v22 = a2;
    uint64_t v23 = sub_21F550C10();
    os_log_type_t v24 = sub_21F5517B0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v47 = v11;
      unint64_t v26 = (uint8_t *)v25;
      uint64_t v27 = swift_slowAlloc();
      uint64_t v48 = a3;
      uint64_t v28 = v27;
      uint64_t v50 = v27;
      *(_DWORD *)unint64_t v26 = 136446210;
      uint64_t v46 = v10;
      swift_getErrorValue();
      uint64_t v29 = sub_21F551C60();
      uint64_t v49 = sub_21F4BAC68(v29, v30, &v50);
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v23, v24, "Error! Proofing not complete %{public}s", v26, 0xCu);
      swift_arrayDestroy();
      uint64_t v31 = v28;
      a3 = v48;
      MEMORY[0x223C4F110](v31, -1, -1);
      MEMORY[0x223C4F110](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v46);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
    }
    id v44 = a2;
    a3(a2);
  }
  else
  {
    if (a1)
    {
      uint64_t v32 = sub_21F54FB40();
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v48 = a4;
        sub_21F54EF20();
        unint64_t v34 = sub_21F550C10();
        os_log_type_t v35 = sub_21F5517A0();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = v11;
          uint64_t v37 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v37 = 0;
          _os_log_impl(&dword_21F464000, v34, v35, "received new proofing views", v37, 2u);
          uint64_t v38 = v37;
          uint64_t v11 = v36;
          MEMORY[0x223C4F110](v38, -1, -1);
        }

        os_log_t v39 = *(void (**)(char *, uint64_t))(v11 + 8);
        v39(v17, v10);
        *(void *)(*(void *)(v5 + 144) + 24) = v33;
        swift_bridgeObjectRelease();
        uint64_t v40 = *(void *)(v5 + 144);
        swift_retain();
        sub_21F54EF20();
        uint64_t v41 = sub_21F550C10();
        os_log_type_t v42 = sub_21F5517A0();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl(&dword_21F464000, v41, v42, "reset page iterator", v43, 2u);
          MEMORY[0x223C4F110](v43, -1, -1);
        }

        v39(v14, v10);
        *(void *)(v40 + 16) = 0;
        swift_release();
      }
    }
    a3(0);
  }
}

uint64_t sub_21F5379D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 128) = a6;
  *(void *)(v7 + 136) = a7;
  *(unsigned char *)(v7 + 192) = a5;
  *(void *)(v7 + 120) = a4;
  uint64_t v8 = sub_21F550C20();
  *(void *)(v7 + 144) = v8;
  *(void *)(v7 + 152) = *(void *)(v8 - 8);
  *(void *)(v7 + 160) = swift_task_alloc();
  *(void *)(v7 + 168) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F537AA8, 0, 0);
}

uint64_t sub_21F537AA8()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void **)(v2 + 112);
  uint64_t v4 = sub_21F551560();
  *(void *)(v0 + 176) = v4;
  uint64_t v5 = *(void *)(v2 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_21F537BD0;
  uint64_t v6 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_21F534790;
  *(void *)(v0 + 104) = &block_descriptor_277;
  *(void *)(v0 + 112) = v6;
  objc_msgSend(v3, sel_saveIdentityProofingBiomeDataSharingUserConsent_state_proofingOptions_completionHandler_, v1, v4, v5, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_21F537BD0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_21F537E18;
  }
  else {
    uint64_t v2 = sub_21F537CE0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F537CE0()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Successfully saved the user's consent to share the proofing biome data.", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  if (MEMORY[0x223C4F1E0](v7 + 96))
  {
    sub_21F4BA36C(0);
    swift_unknownObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_21F537E18()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v3 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[15];
  swift_willThrow();

  sub_21F54EF20();
  sub_21F54EF30();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v6 = MEMORY[0x223C4F1E0](v5 + 96);
  uint64_t v7 = (void *)v0[23];
  if (v6)
  {
    id v8 = v7;
    sub_21F4BA36C(v7);

    swift_unknownObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_21F537F24()
{
  v1[16] = v0;
  uint64_t v2 = sub_21F550540();
  v1[17] = v2;
  v1[18] = *(void *)(v2 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v3 = sub_21F550C20();
  v1[20] = v3;
  v1[21] = *(void *)(v3 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F538050, 0, 0);
}

uint64_t sub_21F538050()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = v1[17];
  if (v2)
  {
    uint64_t v3 = (void *)v1[20];
    v0[24] = v3;
    if (v3)
    {
      uint64_t v4 = (void *)v1[14];
      v0[2] = v0;
      v0[7] = v0 + 15;
      v0[3] = sub_21F5384DC;
      uint64_t v5 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_21F535CC8;
      v0[13] = &block_descriptor_164;
      v0[14] = v5;
      objc_msgSend(v4, sel_fetchExtendedReviewDisplayInfo_proofingOptions_completionHandler_, v3, v2, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    sub_21F54EF20();
    uint64_t v15 = sub_21F550C10();
    os_log_type_t v16 = sub_21F5517B0();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl(&dword_21F464000, v15, v16, "proofing configuration doesn't exist, unable to request for extended review UI data", v17, 2u);
      MEMORY[0x223C4F110](v17, -1, -1);
    }
    uint64_t v18 = v0[23];
    uint64_t v19 = v0[20];
    uint64_t v20 = v0[21];
    uint64_t v22 = v0[18];
    uint64_t v21 = v0[19];
    uint64_t v23 = v0[17];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, *MEMORY[0x263F36588], v23);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    swift_allocError();
  }
  else
  {
    sub_21F54EF20();
    uint64_t v6 = sub_21F550C10();
    os_log_type_t v7 = sub_21F5517B0();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21F464000, v6, v7, "proofing options doesn't exist, unable to request for extended review UI data", v8, 2u);
      MEMORY[0x223C4F110](v8, -1, -1);
    }
    uint64_t v10 = v0[21];
    uint64_t v9 = v0[22];
    uint64_t v11 = v0[19];
    uint64_t v12 = v0[20];
    uint64_t v13 = v0[17];
    uint64_t v14 = v0[18];

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v12);
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v11, *MEMORY[0x263F36438], v13);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    swift_allocError();
  }
  sub_21F550560();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_21F5384DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_21F538680;
  }
  else {
    uint64_t v2 = sub_21F5385EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F5385EC()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_21F538680()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_21F538710(unint64_t a1)
{
  if (a1)
  {
    uint64_t v3 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData;
    swift_beginAccess();
    if (!*(void *)(*(void *)v3 + 16))
    {
      if (a1 >> 62) {
        goto LABEL_18;
      }
      uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v4; uint64_t v4 = sub_21F551B50())
      {
        os_log_type_t v17 = (uint64_t *)v3;
        uint64_t v3 = 4;
        while (1)
        {
          id v5 = (a1 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x223C4E570](v3 - 4, a1)
             : *(id *)(a1 + 8 * v3);
          uint64_t v6 = v5;
          uint64_t v7 = v3 - 3;
          if (__OFADD__(v3 - 4, 1)) {
            break;
          }
          unint64_t v8 = sub_21F54F860();
          if (v8)
          {
            sub_21F4B6904(v8);
            uint64_t v18 = v9;
            uint64_t v11 = v10;
            uint64_t v13 = v12;
            unint64_t v15 = v14;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            sub_21F4DAFDC(v13, v15);
            sub_21F47F01C(v13, v15);
            if (v11)
            {
              swift_bridgeObjectRetain();
              sub_21F4DAFDC(v13, v15);
              swift_bridgeObjectRelease();
              if (v15 >> 60 != 15)
              {
                swift_bridgeObjectRelease();
                swift_beginAccess();
                sub_21F475EF4(v13, v15);
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                uint64_t v19 = *v17;
                *os_log_type_t v17 = 0x8000000000000000;
                sub_21F473DC8(v13, v15, v18, v11, isUniquelyReferenced_nonNull_native);
                *os_log_type_t v17 = v19;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_endAccess();
                swift_bridgeObjectRelease();
                sub_21F47F01C(v13, v15);
                sub_21F47F01C(v13, v15);

                return;
              }
              swift_bridgeObjectRelease();
              sub_21F47F01C(v13, v15);
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
              sub_21F47F01C(v13, v15);
            }
          }

          ++v3;
          if (v7 == v4) {
            goto LABEL_19;
          }
        }
        __break(1u);
LABEL_18:
        swift_bridgeObjectRetain();
      }
LABEL_19:
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_21F538974()
{
  uint64_t v1 = sub_21F550C20();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  if (v8)
  {
    uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    uint64_t v10 = sub_21F551710();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    void v11[3] = 0;
    v11[4] = v0;
    void v11[5] = v9;
    v11[6] = v8;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_21F47D908((uint64_t)v7, (uint64_t)&unk_267EE06C0, (uint64_t)v11);
    return swift_release();
  }
  else
  {
    sub_21F54EF20();
    uint64_t v13 = sub_21F550C10();
    os_log_type_t v14 = sub_21F5517A0();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_21F464000, v13, v14, "the state is empty, unable to call proofing completion", v15, 2u);
      MEMORY[0x223C4F110](v15, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_21F538BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  uint64_t v7 = sub_21F550C20();
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F538C7C, 0, 0);
}

uint64_t sub_21F538C7C()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = *(void **)(v1 + 112);
  uint64_t v3 = sub_21F551560();
  v0[27] = v3;
  uint64_t v4 = *(void *)(v1 + 136);
  v0[2] = v0;
  v0[3] = sub_21F538D98;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F534790;
  v0[13] = &block_descriptor_163;
  v0[14] = v5;
  objc_msgSend(v2, sel_clearDataAfterTerminalProofingStateWithState_proofingOptions_completionHandler_, v3, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F538D98()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_21F538FB4;
  }
  else {
    uint64_t v2 = sub_21F538EA8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F538EA8()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Proofing data cleared successfully after proofing completion", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_21F538FB4()
{
  uint64_t v22 = v0;
  os_log_type_t v2 = (void *)v0[27];
  uint64_t v1 = (void *)v0[28];
  swift_willThrow();

  sub_21F54EF20();
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_21F550C10();
  os_log_type_t v6 = sub_21F5517A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[28];
    uint64_t v18 = v0[24];
    uint64_t v19 = v0[23];
    uint64_t v20 = v0[25];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v10 = sub_21F551C60();
    v0[19] = sub_21F4BAC68(v10, v11, &v21);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v5, v6, "received an error while clearing data after proofing completion %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v9, -1, -1);
    MEMORY[0x223C4F110](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v12 = (void *)v0[28];
    uint64_t v14 = v0[24];
    uint64_t v13 = v0[25];
    uint64_t v15 = v0[23];

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_21F539208(uint64_t a1, uint64_t a2)
{
  v3[58] = a2;
  v3[59] = v2;
  v3[57] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  v3[60] = swift_task_alloc();
  uint64_t v4 = sub_21F54F7A0();
  v3[61] = v4;
  v3[62] = *(void *)(v4 - 8);
  v3[63] = swift_task_alloc();
  v3[64] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE06F0);
  v3[65] = swift_task_alloc();
  uint64_t v5 = sub_21F5503E0();
  v3[66] = v5;
  v3[67] = *(void *)(v5 - 8);
  v3[68] = swift_task_alloc();
  uint64_t v6 = sub_21F550540();
  v3[69] = v6;
  v3[70] = *(void *)(v6 - 8);
  v3[71] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF5A8);
  v3[72] = swift_task_alloc();
  uint64_t v7 = sub_21F550C20();
  v3[73] = v7;
  v3[74] = *(void *)(v7 - 8);
  v3[75] = swift_task_alloc();
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  v3[79] = swift_task_alloc();
  v3[80] = swift_task_alloc();
  v3[81] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F5394CC, 0, 0);
}

uint64_t sub_21F5394CC()
{
  id v53 = v0;
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  uint64_t v51 = v0 + 18;
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[74];
    uint64_t v49 = v0[73];
    uint64_t v50 = v0[81];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v52 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[53] = sub_21F4BAC68(0xD000000000000024, 0x800000021F55F160, &v52);
    sub_21F551970();
    _os_log_impl(&dword_21F464000, v1, v2, "%s enter", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v5, -1, -1);
    MEMORY[0x223C4F110](v4, -1, -1);

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v6(v50, v49);
  }
  else
  {
    uint64_t v7 = v0[81];
    uint64_t v8 = v0[74];
    uint64_t v9 = v0[73];

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v6(v7, v9);
  }
  v0[82] = v6;
  uint64_t v10 = *(void *)(v0[59] + 144);
  swift_retain();
  sub_21F54EF20();
  unint64_t v11 = sub_21F550C10();
  os_log_type_t v12 = sub_21F5517A0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21F464000, v11, v12, "reset page iterator", v13, 2u);
    MEMORY[0x223C4F110](v13, -1, -1);
  }
  uint64_t v14 = v0[80];
  uint64_t v15 = v0[74];
  uint64_t v16 = v0[73];
  uint64_t v17 = v0[72];
  uint64_t v18 = v0[59];
  uint64_t v19 = (void *)v0[57];

  v0[83] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v14, v16);
  *(void *)(v10 + 16) = 0;
  swift_release();
  swift_retain();
  sub_21F51387C();
  swift_release();
  uint64_t v20 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  uint64_t v21 = v18 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData;
  swift_beginAccess();
  sub_21F4FA3EC(v17, v21, &qword_267EDF5A8);
  swift_endAccess();
  sub_21F54F0C0();
  sub_21F54F0B0();
  __swift_project_boxed_opaque_existential_1(v51, v0[21]);
  sub_21F54F960();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v51);
  uint64_t v22 = *(void **)(v18 + 160);
  *(void *)(v18 + 160) = v19;
  id v23 = v19;

  uint64_t v24 = sub_21F54FE70();
  if (v25)
  {
    uint64_t v24 = sub_21F5515D0();
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v0[59];
  uint64_t v29 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state;
  v0[84] = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state;
  unint64_t v30 = (uint64_t *)(v28 + v29);
  *unint64_t v30 = v24;
  v30[1] = v27;
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_21F54FE80();
  if (v32)
  {
    uint64_t v31 = sub_21F5515D0();
    uint64_t v34 = v33;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = 0;
  }
  uint64_t v35 = v0[59];
  uint64_t v36 = (void *)v0[57];
  uint64_t v37 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country;
  v0[85] = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country;
  uint64_t v38 = (uint64_t *)(v35 + v37);
  *uint64_t v38 = v31;
  v38[1] = v34;
  swift_bridgeObjectRelease();
  sub_21F5365F8();
  os_log_t v39 = *(void **)(v18 + 160);
  *(void *)(v18 + 160) = v19;
  id v40 = v36;

  uint64_t v41 = *(uint64_t (**)(uint64_t))(**(void **)(v35 + 152) + 120);
  uint64_t v42 = swift_retain();
  uint64_t v43 = v41(v42);
  swift_release();
  if (v43 == 2)
  {
    (*(void (**)(void, void, void))(v0[70] + 104))(v0[71], *MEMORY[0x263F364B0], v0[69]);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    swift_allocError();
    sub_21F550560();
    swift_willThrow();
    sub_21F53B4D8();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v44 = (uint64_t (*)(void))v0[1];
    return v44();
  }
  else
  {
    uint64_t v46 = v0[58];
    uint64_t v47 = *(void **)(v0[59] + 112);
    v0[86] = v47;
    v0[2] = v0;
    v0[7] = (char *)v0 + 708;
    v0[3] = sub_21F539C08;
    uint64_t v48 = swift_continuation_init();
    v0[28] = MEMORY[0x263EF8330];
    v0[29] = 0x40000000;
    v0[30] = sub_21F4B0844;
    v0[31] = &block_descriptor_303;
    v0[32] = v48;
    objc_msgSend(v47, sel_isWatchPairedWithIdType_completionHandler_, v46, v0 + 28);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
}

uint64_t sub_21F539C08()
{
  return MEMORY[0x270FA2498](sub_21F539CE8, 0, 0);
}

uint64_t sub_21F539CE8()
{
  uint64_t v33 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 708);
  sub_21F54EF20();
  os_log_type_t v2 = sub_21F550C10();
  os_log_type_t v3 = sub_21F551790();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    *(_DWORD *)(v0 + 704) = v1;
    sub_21F551970();
    _os_log_impl(&dword_21F464000, v2, v3, "prepareForProofingDisplay: isWatchPaired = %{BOOL}d", v4, 8u);
    MEMORY[0x223C4F110](v4, -1, -1);
  }
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
  uint64_t v6 = *(void *)(v0 + 632);
  uint64_t v7 = *(void *)(v0 + 584);

  v5(v6, v7);
  uint64_t v8 = sub_21F54FE00();
  if ((v9 & 1) != 0 || v8 != 2)
  {
    if (v1) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
LABEL_10:
    unint64_t v11 = *(void **)(v0 + 688);
    uint64_t v12 = *(void *)(v0 + 464);
    uint64_t v13 = *(void *)(v0 + 456);
    *(void *)(*(void *)(v0 + 472) + 136) = v10;
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 120) = v0 + 432;
    *(void *)(v0 + 88) = sub_21F53A29C;
    uint64_t v14 = swift_continuation_init();
    *(void *)(v0 + 184) = MEMORY[0x263EF8330];
    *(void *)(v0 + 192) = 0x40000000;
    *(void *)(v0 + 200) = sub_21F535CC8;
    *(void *)(v0 + 208) = &block_descriptor_304;
    *(void *)(v0 + 216) = v14;
    objc_msgSend(v11, sel_prepareForProofingDisplay_proofingOptions_idType_completionHandler_, v13, v10, v12, v0 + 184);
    return MEMORY[0x270FA23F0](v0 + 80);
  }
  if (v1)
  {
    uint64_t v10 = 2;
    goto LABEL_10;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 560) + 104))(*(void *)(v0 + 568), *MEMORY[0x263F364B8], *(void *)(v0 + 552));
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550550();
  sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  uint64_t v15 = (void *)swift_allocError();
  sub_21F550560();
  swift_willThrow();
  sub_21F54EF20();
  id v16 = v15;
  id v17 = v15;
  uint64_t v18 = sub_21F550C10();
  os_log_type_t v19 = sub_21F5517B0();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
  uint64_t v22 = *(void *)(v0 + 600);
  uint64_t v23 = *(void *)(v0 + 584);
  if (v20)
  {
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    uint64_t v30 = *(void *)(v0 + 600);
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v32 = v25;
    *(_DWORD *)uint64_t v24 = 136446210;
    swift_getErrorValue();
    uint64_t v26 = sub_21F551C60();
    *(void *)(v0 + 416) = sub_21F4BAC68(v26, v27, &v32);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v18, v19, "Received an error from start proofing: %{public}s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v25, -1, -1);
    MEMORY[0x223C4F110](v24, -1, -1);

    v31(v30, v23);
  }
  else
  {

    v21(v22, v23);
  }
  swift_willThrow();
  sub_21F53B4D8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_21F53A29C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 696) = v1;
  if (v1) {
    os_log_type_t v2 = sub_21F53B1EC;
  }
  else {
    os_log_type_t v2 = sub_21F53A3AC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F53A3AC()
{
  CGRect v110 = v0;
  uint64_t v1 = (void *)v0[54];
  uint64_t v2 = sub_21F54FB40();
  if (!v2)
  {
    (*(void (**)(void, void, void))(v0[70] + 104))(v0[71], *MEMORY[0x263F364E8], v0[69]);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    unint64_t v11 = (void *)swift_allocError();
    goto LABEL_5;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v0[67];
  uint64_t v5 = v0[66];
  uint64_t v6 = v0[65];
  sub_21F53EDE4(v6);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) == 1)
  {
    uint64_t v7 = v0[71];
    uint64_t v8 = v0[70];
    uint64_t v9 = v0[69];
    uint64_t v10 = v0[65];
    swift_bridgeObjectRelease();
    sub_21F47F030(v10, &qword_267EE06F0);
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, *MEMORY[0x263F36500], v9);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    unint64_t v11 = (void *)swift_allocError();
LABEL_5:
    sub_21F550560();
    swift_willThrow();

    sub_21F54EF20();
    id v12 = v11;
    id v13 = v11;
    uint64_t v14 = sub_21F550C10();
    os_log_type_t v15 = sub_21F5517B0();
    BOOL v16 = os_log_type_enabled(v14, v15);
    id v17 = (void (*)(uint64_t, uint64_t))v0[82];
    uint64_t v18 = v0[75];
    uint64_t v19 = v0[73];
    if (v16)
    {
      id v106 = (void (*)(uint64_t, uint64_t))v0[82];
      BOOL v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v105 = v18;
      uint64_t v21 = swift_slowAlloc();
      v109[0] = v21;
      *(_DWORD *)BOOL v20 = 136446210;
      swift_getErrorValue();
      uint64_t v22 = sub_21F551C60();
      v0[52] = sub_21F4BAC68(v22, v23, v109);
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v14, v15, "Received an error from start proofing: %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v21, -1, -1);
      MEMORY[0x223C4F110](v20, -1, -1);

      v106(v105, v19);
    }
    else
    {

      v17(v18, v19);
    }
    swift_willThrow();
    sub_21F53B4D8();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = (uint64_t (*)(void))v0[1];
    goto LABEL_32;
  }
  uint64_t v25 = v0[59];
  (*(void (**)(void, void, void))(v0[67] + 32))(v0[68], v0[65], v0[66]);
  unint64_t v26 = sub_21F54FB40();
  sub_21F538710(v26);
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_21F54FBC0();
  uint64_t v28 = v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_waitingForWiFiAlertDataThresholdInBytes;
  *(void *)uint64_t v28 = v27;
  *(unsigned char *)(v28 + 8) = v29 & 1;
  uint64_t v30 = sub_21F54FB30();
  uint64_t v31 = v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_lowDataModeAlertDataThresholdInBytes;
  *(void *)uint64_t v31 = v30;
  *(unsigned char *)(v31 + 8) = v32 & 1;
  uint64_t v33 = sub_21F54FB50();
  uint64_t v34 = (uint64_t *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL);
  *uint64_t v34 = v33;
  v34[1] = v35;
  swift_bridgeObjectRelease();
  *(void *)(v25 + 176) = sub_21F5503B0();
  swift_bridgeObjectRelease();
  *(void *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages) = sub_21F5503C0();
  swift_bridgeObjectRelease();
  *(void *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements) = sub_21F5503D0();
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_21F54FB90();
  uint64_t v37 = *(void **)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_featureEnablementConfig);
  *(void *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_featureEnablementConfig) = v36;

  *(void *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_supportedRegions) = sub_21F54FB70();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_21F54FB80();
  os_log_t v39 = *(void **)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  *(void *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = v38;

  id v40 = (void *)sub_21F54FB80();
  uint64_t v41 = v40;
  if (v40) {

  }
  uint64_t v42 = v0[59];
  *(unsigned char *)(v42 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) = v41 != 0;
  char v43 = sub_21F54FBB0();
  uint64_t v44 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig;
  *(unsigned char *)(v42 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig) = v43 & 1;
  uint64_t v45 = sub_21F54FB80();
  uint64_t v103 = v44;
  uint64_t v104 = v42;
  uint64_t v108 = v3;
  if (v45 && (uint64_t v46 = (void *)v45, v47 = (void *)sub_21F54F750(), v46, v47))
  {
    char v48 = sub_21F54FC00();
  }
  else
  {
    char v48 = 1;
  }
  *(unsigned char *)(v0[59] + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) = v48 & 1;
  uint64_t v49 = sub_21F54FBA0();
  if (v49)
  {
    uint64_t v50 = (void *)v49;
    sub_21F54EF20();
    uint64_t v51 = sub_21F550C10();
    os_log_type_t v52 = sub_21F5517A0();
    if (os_log_type_enabled(v51, v52))
    {
      id v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v53 = 0;
      _os_log_impl(&dword_21F464000, v51, v52, "Saving IQSettings from Liveness Step Up workflow", v53, 2u);
      MEMORY[0x223C4F110](v53, -1, -1);
    }
    uint64_t v54 = (void (*)(uint64_t, uint64_t))v0[82];
    uint64_t v55 = v0[78];
    uint64_t v56 = v0[73];

    v54(v55, v56);
    swift_retain();
    id v57 = v50;
    sub_21F50EEF0((uint64_t)v50);
    swift_release();
  }
  sub_21F54FBD0();
  if (v58)
  {
    uint64_t v60 = v0[63];
    uint64_t v59 = v0[64];
    uint64_t v61 = v0[61];
    uint64_t v62 = v0[62];
    uint64_t v63 = v0[59];
    sub_21F54F770();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v60, v59, v61);
    uint64_t v64 = v63 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 24))(v64, v60, v61);
    swift_endAccess();
    sub_21F5365F8();
    unint64_t v65 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
    v65(v60, v61);
    v65(v59, v61);
  }
  sub_21F5503C0();
  sub_21F5503D0();
  uint64_t v66 = v0[59];
  uint64_t v67 = v0[64];
  uint64_t v69 = v0[61];
  uint64_t v68 = v0[62];
  sub_21F5503A0();
  uint64_t v70 = v66 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16))(v67, v70, v69);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21F54F790();
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
  *(void *)(v66 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper) = sub_21F550390();
  swift_release();
  *(void *)(*(void *)(v66 + 144) + 24) = v108;
  swift_bridgeObjectRelease();
  uint64_t v71 = sub_21F54FBE0();
  if (v71)
  {
    id v72 = (void *)v71;
    sub_21F54EF20();
    id v73 = v72;
    BOOL v74 = sub_21F550C10();
    os_log_type_t v75 = sub_21F5517A0();
    BOOL v76 = os_log_type_enabled(v74, v75);
    CGFloat v77 = (void (*)(uint64_t, uint64_t))v0[82];
    uint64_t v78 = v0[77];
    if (v76)
    {
      uint64_t v100 = v0[73];
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      uint64_t v80 = swift_slowAlloc();
      v109[0] = v80;
      *(_DWORD *)uint64_t v79 = 136315138;
      uint64_t v81 = sub_21F54F620();
      v0[55] = sub_21F4BAC68(v81, v82, v109);
      sub_21F551970();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21F464000, v74, v75, "received doc scan config. IIN = %s", v79, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v80, -1, -1);
      MEMORY[0x223C4F110](v79, -1, -1);

      v77(v78, v100);
    }
    else
    {
      uint64_t v83 = v0[73];

      v77(v78, v83);
    }
    uint64_t v107 = v0[68];
    uint64_t v101 = v0[67];
    uint64_t v102 = v0[66];
    uint64_t v84 = *(void *)(v0[59] + 144);
    uint64_t v85 = *(void **)(v84 + 40);
    *(void *)(v84 + 40) = v73;
    id v86 = v73;

    swift_retain();
    sub_21F54F620();
    swift_beginAccess();
    uint64_t v87 = (void (*)(void *, void))sub_21F54F540();
    swift_bridgeObjectRetain();
    sub_21F54F440();
    v87(v0 + 33, 0);
    swift_endAccess();

    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v107, v102);
  }
  else
  {
    (*(void (**)(void, void))(v0[67] + 8))(v0[68], v0[66]);
  }
  uint64_t v88 = v0[59];
  uint64_t v89 = v0[60];
  uint64_t v90 = sub_21F551710();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56))(v89, 1, 1, v90);
  id v91 = (void *)swift_allocObject();
  v91[2] = 0;
  v91[3] = 0;
  v91[4] = v88;
  swift_retain();
  sub_21F47D908(v89, (uint64_t)&unk_267EE0700, (uint64_t)v91);
  swift_release();
  if (*(unsigned char *)(v104 + v103))
  {
    sub_21F54EF20();
    id v92 = sub_21F550C10();
    os_log_type_t v93 = sub_21F5517A0();
    if (os_log_type_enabled(v92, v93))
    {
      id v94 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v94 = 0;
      _os_log_impl(&dword_21F464000, v92, v93, "Instructed to pre fetch liveness config", v94, 2u);
      MEMORY[0x223C4F110](v94, -1, -1);
    }
    id v95 = (void (*)(uint64_t, uint64_t))v0[82];
    uint64_t v96 = v0[76];
    uint64_t v97 = v0[73];

    v95(v96, v97);
    sub_21F53E098();
    uint64_t v98 = sub_21F53F6EC();
    sub_21F495018(v98);
  }
  sub_21F53B4D8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v0[1];
LABEL_32:
  return v24();
}

uint64_t sub_21F53B1EC()
{
  uint64_t v19 = v0;
  swift_willThrow();
  uint64_t v1 = (void *)v0[87];
  sub_21F54EF20();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21F550C10();
  os_log_type_t v5 = sub_21F5517B0();
  if (os_log_type_enabled(v4, v5))
  {
    id v17 = (void (*)(uint64_t, uint64_t))v0[82];
    uint64_t v16 = v0[75];
    uint64_t v15 = v0[73];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v18 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_getErrorValue();
    uint64_t v8 = sub_21F551C60();
    v0[52] = sub_21F4BAC68(v8, v9, &v18);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v4, v5, "Received an error from start proofing: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v7, -1, -1);
    MEMORY[0x223C4F110](v6, -1, -1);

    v17(v16, v15);
  }
  else
  {
    uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[82];
    uint64_t v11 = v0[75];
    uint64_t v12 = v0[73];

    v10(v11, v12);
  }
  swift_willThrow();
  sub_21F53B4D8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_21F53B4D8()
{
  uint64_t v0 = sub_21F550C20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v4 = sub_21F550C10();
  os_log_type_t v5 = sub_21F5517A0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v9 = sub_21F4BAC68(0xD000000000000024, 0x800000021F55F160, &v10);
    sub_21F551970();
    _os_log_impl(&dword_21F464000, v4, v5, "%s exit", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v7, -1, -1);
    MEMORY[0x223C4F110](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_21F53B6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_21F53B6CC, 0, 0);
}

uint64_t sub_21F53B6CC()
{
  if ((*(void *)(*(void *)(v0 + 16) + 136) & 3) != 2) {
    sub_21F53C764();
  }
  sub_21F53B744();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21F53B744()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F551710();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  void v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_21F47F030((uint64_t)v4, &qword_267EE0070);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_21F551700();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_21F5516B0();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_267EE06A8;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    void v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_21F53B988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[19] = a4;
  uint64_t v5 = sub_21F550C20();
  v4[20] = v5;
  v4[21] = *(void *)(v5 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  v4[26] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_21F53BAA0;
  return sub_21F53F278();
}

uint64_t sub_21F53BAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)*v3;
  v5[27] = a2;
  v5[28] = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v6 = sub_21F53C050;
  }
  else
  {
    v5[29] = a1;
    uint64_t v6 = sub_21F53BBC8;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_21F53BBC8()
{
  uint64_t v1 = sub_21F54FD50();
  uint64_t v2 = sub_21F54FD50();
  unint64_t v3 = v0[27];
  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    sub_21F54EF20();
    uint64_t v4 = sub_21F550C10();
    os_log_type_t v5 = sub_21F5517A0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21F464000, v4, v5, "proofing status unavailable. This is an unexpected daemon state.", v6, 2u);
      MEMORY[0x223C4F110](v6, -1, -1);
    }
    uint64_t v7 = v0[23];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[21];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    goto LABEL_18;
  }
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_21F551B50();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    unint64_t v10 = v0[27];
    uint64_t v11 = *(void **)(v0[19] + 160);
    id v12 = v11;
    id v13 = sub_21F54A7B8(v10, (uint64_t)v11);
    swift_bridgeObjectRelease();
    if (v13
      && (id v14 = v13, sub_21F54FDF0(), v16 = v15, v14, (v16 & 1) == 0)
      && (uint64_t v17 = sub_21F54FD40(), v17 == sub_21F54FD40()))
    {
      uint64_t v18 = v0[19];
      uint64_t v19 = *(void **)(v18 + 112);
      v0[6] = sub_21F54A97C;
      v0[7] = v18;
      v0[2] = MEMORY[0x263EF8330];
      v0[3] = 1107296256;
      v0[4] = sub_21F53870C;
      v0[5] = &block_descriptor_154;
      uint64_t v20 = _Block_copy(v0 + 2);
      swift_retain();
      swift_release();
      objc_msgSend(v19, sel_fetchImageQualitySettingsWithCompletion_, v20);
      _Block_release(v20);
    }
    else
    {
      sub_21F54EF20();
      uint64_t v21 = sub_21F550C10();
      os_log_type_t v22 = sub_21F5517A0();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v23 = 0;
        _os_log_impl(&dword_21F464000, v21, v22, "Stored Proofing Session exists. Do not fetch image quality settings", v23, 2u);
        MEMORY[0x223C4F110](v23, -1, -1);
      }
      uint64_t v24 = v0[25];
      uint64_t v25 = v0[20];
      uint64_t v26 = v0[21];

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  sub_21F54EF20();
  uint64_t v28 = sub_21F550C10();
  os_log_type_t v29 = sub_21F5517A0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_21F464000, v28, v29, "Proofing session doesn't exist. Start fetching image quality settings", v30, 2u);
    MEMORY[0x223C4F110](v30, -1, -1);
  }
  uint64_t v31 = v0[24];
  uint64_t v32 = v0[20];
  uint64_t v33 = v0[21];
  uint64_t v34 = v0[19];

  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
  uint64_t v35 = *(void **)(v34 + 112);
  v0[12] = sub_21F54A97C;
  v0[13] = v34;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_21F53870C;
  v0[11] = &block_descriptor_158;
  uint64_t v36 = _Block_copy(v0 + 8);
  swift_retain();
  swift_release();
  objc_msgSend(v35, sel_fetchImageQualitySettingsWithCompletion_, v36);
  _Block_release(v36);
LABEL_18:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = (uint64_t (*)(void))v0[1];
  return v37();
}

uint64_t sub_21F53C050()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[28];
  sub_21F54EF20();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21F550C10();
  os_log_type_t v5 = sub_21F5517A0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[28];
    uint64_t v17 = v0[21];
    uint64_t v18 = v0[20];
    uint64_t v19 = v0[22];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_21F551C60();
    v0[18] = sub_21F4BAC68(v9, v10, &v20);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v4, v5, "Received an error while checking for proofing flow availability %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v8, -1, -1);
    MEMORY[0x223C4F110](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    uint64_t v11 = (void *)v0[28];
    uint64_t v13 = v0[21];
    uint64_t v12 = v0[22];
    uint64_t v14 = v0[20];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_21F53C2AC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21F550540();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550C20();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v32 - v15;
  if (a2)
  {
    uint64_t v35 = a1;
    id v17 = a2;
    sub_21F54EF20();
    id v18 = a2;
    id v19 = a2;
    uint64_t v20 = sub_21F550C10();
    os_log_type_t v21 = sub_21F5517B0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v34 = a3;
      uint64_t v24 = v23;
      uint64_t v37 = v23;
      *(_DWORD *)uint64_t v22 = 136446210;
      uint64_t v33 = v10;
      swift_getErrorValue();
      uint64_t v25 = sub_21F551C60();
      uint64_t v36 = sub_21F4BAC68(v25, v26, &v37);
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v20, v21, "Received error while trying to fetch the image quality model: %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v24, -1, -1);
      MEMORY[0x223C4F110](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v33);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }
    uint64_t v28 = v35;
    swift_retain();
    uint64_t v29 = v28;
    goto LABEL_10;
  }
  if (!a1)
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F364A0], v6);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    uint64_t v30 = v10;
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    uint64_t v31 = (void *)swift_allocError();
    sub_21F550560();
    sub_21F54EF20();
    sub_21F54EF30();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v30);

    swift_retain();
    uint64_t v29 = 0;
LABEL_10:
    sub_21F50EEF0(v29);
    return swift_release();
  }
  swift_retain();
  sub_21F50EEF0(a1);

  return swift_release();
}

void sub_21F53C764()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v6 = sub_21F550C10();
  os_log_type_t v7 = sub_21F5517A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21F464000, v6, v7, "Requesting to fetch BiomeFedStatsUI", v8, 2u);
    MEMORY[0x223C4F110](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = *(void **)(v1 + 112);
  aBlock[4] = sub_21F549524;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F53870C;
  aBlock[3] = &block_descriptor_141;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_fetchBiomeFedStatsUIWithCompletion_, v10);
  _Block_release(v10);
}

void sub_21F53C940(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v36 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - v14;
  if (a2)
  {
    id v16 = a2;
    sub_21F54EF20();
    id v17 = a2;
    id v18 = a2;
    id v19 = sub_21F550C10();
    os_log_type_t v20 = sub_21F5517B0();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v37 = v6;
      uint64_t v23 = v22;
      uint64_t v39 = v22;
      *(_DWORD *)os_log_type_t v21 = 136315138;
      swift_getErrorValue();
      uint64_t v24 = sub_21F551C60();
      uint64_t v38 = sub_21F4BAC68(v24, v25, &v39);
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v19, v20, "Received an error while attempting to fetch the Biome-FedStatsUI -> %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v23, -1, -1);
      MEMORY[0x223C4F110](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v37);
      return;
    }

    uint64_t v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v32 = v15;
    goto LABEL_12;
  }
  if (!a1)
  {
    sub_21F54EF20();
    uint64_t v33 = sub_21F550C10();
    os_log_type_t v34 = sub_21F5517B0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_21F464000, v33, v34, "The biome fed stats UI Config was not a part of the dynamic workflow", v35, 2u);
      MEMORY[0x223C4F110](v35, -1, -1);
    }

    uint64_t v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v32 = v13;
LABEL_12:
    v31(v32, v6);
    return;
  }
  id v26 = a1;
  sub_21F54EF20();
  uint64_t v27 = sub_21F550C10();
  os_log_type_t v28 = sub_21F5517A0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_21F464000, v27, v28, "Successfully received biome-fedstats UI config from the server", v29, 2u);
    MEMORY[0x223C4F110](v29, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v30 = *(void **)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_biomeFedStatsUIConfig);
  *(void *)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_biomeFedStatsUIConfig) = a1;
}

void sub_21F53CD08(uint64_t a1, void *a2, void *a3)
{
  os_log_type_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_21F53CD94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v31 - v12;
  if (a3)
  {
    id v14 = a3;
    sub_21F54EF20();
    id v15 = a3;
    id v16 = a3;
    id v17 = sub_21F550C10();
    os_log_type_t v18 = sub_21F5517A0();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v32 = v20;
      *(_DWORD *)id v19 = 136315138;
      v31[0] = v6;
      swift_getErrorValue();
      uint64_t v21 = sub_21F551C60();
      v31[1] = sub_21F4BAC68(v21, v22, &v32);
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v17, v18, "Received an error while fetching terms and conditions %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v20, -1, -1);
      MEMORY[0x223C4F110](v19, -1, -1);

      return (*(uint64_t (**)(char *, void))(v7 + 8))(v13, v31[0]);
    }

    uint64_t v29 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v30 = v13;
  }
  else
  {
    if (!a2) {
      return result;
    }
    MEMORY[0x270FA5388](result);
    v31[-2] = a1;
    v31[-1] = a2;
    uint64_t v24 = (void *)(v23 + 16);
    unint64_t v25 = (os_unfair_lock_s *)(v23 + 32);
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v25);
    sub_21F5469B8(v24);
    os_unfair_lock_unlock(v25);
    swift_bridgeObjectRelease();
    sub_21F54EF20();
    id v26 = sub_21F550C10();
    os_log_type_t v27 = sub_21F5517A0();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v28 = 0;
      _os_log_impl(&dword_21F464000, v26, v27, "Successfully stored terms and conditions in memory", v28, 2u);
      MEMORY[0x223C4F110](v28, -1, -1);
    }

    uint64_t v29 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v30 = v10;
  }
  return v29(v30, v6);
}

uint64_t sub_21F53D104(void *a1)
{
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v25 - v7;
  if (a1)
  {
    id v9 = a1;
    sub_21F54EF20();
    id v10 = a1;
    id v11 = a1;
    uint64_t v12 = sub_21F550C10();
    os_log_type_t v13 = sub_21F5517A0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v26 = v2;
      id v15 = (uint8_t *)v14;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v28 = v16;
      *(_DWORD *)id v15 = 136315138;
      swift_getErrorValue();
      uint64_t v17 = sub_21F551C60();
      uint64_t v27 = sub_21F4BAC68(v17, v18, &v28);
      sub_21F551970();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F464000, v12, v13, "received an error from opportunistic file upload %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v16, -1, -1);
      MEMORY[0x223C4F110](v15, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v26);
    }

    uint64_t v23 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    uint64_t v24 = v6;
  }
  else
  {
    sub_21F54EF20();
    uint64_t v20 = sub_21F550C10();
    os_log_type_t v21 = sub_21F5517A0();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl(&dword_21F464000, v20, v21, "opportunitistic file uploads complete", v22, 2u);
      MEMORY[0x223C4F110](v22, -1, -1);
    }

    uint64_t v23 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    uint64_t v24 = v8;
  }
  return v23(v24, v2);
}

uint64_t sub_21F53D3F4()
{
  v1[18] = v0;
  uint64_t v2 = sub_21F550540();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  uint64_t v3 = sub_21F550550();
  v1[22] = v3;
  v1[23] = *(void *)(v3 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  uint64_t v4 = sub_21F550C20();
  v1[27] = v4;
  v1[28] = *(void *)(v4 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F53D5B0, 0, 0);
}

uint64_t sub_21F53D5B0()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Preparing for proofing", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[27];
  uint64_t v6 = v0[28];
  uint64_t v7 = v0[18];

  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[33] = v8;
  v0[34] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v4, v5);
  swift_retain();
  uint64_t v9 = sub_21F4A1500();
  swift_release();
  v0[15] = v9;
  sub_21F546ED4(2u);
  uint64_t v10 = *(void *)(v7 + 120);
  uint64_t v11 = v0[15];
  uint64_t v12 = swift_task_alloc();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v10;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EDFDC8);
  sub_21F551860();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  uint64_t v13 = v0[16];
  v0[35] = v13;
  if (v13)
  {
    uint64_t v14 = *(void **)(v0[18] + 112);
    v0[2] = v0;
    v0[3] = sub_21F53DA18;
    uint64_t v15 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_21F534790;
    v0[13] = &block_descriptor_139;
    v0[14] = v15;
    objc_msgSend(v14, sel_prepareForProofingIdentity_completionHandler_, v13, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    uint64_t v16 = v0[30];
    uint64_t v17 = v0[26];
    uint64_t v18 = v0[27];
    uint64_t v19 = v0[22];
    uint64_t v20 = v0[23];
    (*(void (**)(void, void, void))(v0[20] + 104))(v0[21], *MEMORY[0x263F364A0], v0[19]);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550560();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    os_log_type_t v21 = (void *)swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v22, v17, v19);
    sub_21F54EF20();
    sub_21F54EF30();
    v8(v16, v18);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v17, v19);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_21F53DA18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 288) = v1;
  if (v1) {
    os_log_type_t v2 = sub_21F53DC84;
  }
  else {
    os_log_type_t v2 = sub_21F53DB28;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F53DB28()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F551790();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Called daemon to prepare for proofing", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v4 = (void *)v0[35];
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[33];
  uint64_t v6 = v0[31];
  uint64_t v7 = v0[27];

  v5(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_21F53DC84()
{
  uint64_t v39 = v0;
  uint64_t v1 = (void *)v0[36];
  uint64_t v33 = (void (*)(uint64_t, uint64_t))v0[33];
  uint64_t v2 = v0[30];
  uint64_t v31 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v35 = v0[24];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[21];
  uint64_t v8 = v0[19];
  swift_willThrow();
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v7, *MEMORY[0x263F36418], v8);
  id v9 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550560();
  sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  uint64_t v10 = (void *)swift_allocError();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v11(v12, v3, v4);
  sub_21F54EF20();
  sub_21F54EF30();
  v33(v2, v31);

  sub_21F54EF20();
  v11(v35, v3, v4);
  uint64_t v13 = sub_21F550C10();
  os_log_type_t v14 = sub_21F5517B0();
  if (os_log_type_enabled(v13, v14))
  {
    os_log_type_t v34 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t v30 = v0[27];
    uint64_t v32 = v0[29];
    uint64_t v15 = v0[23];
    uint64_t v29 = v0[24];
    uint64_t v36 = v0[22];
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v38 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v18 = sub_21F551C60();
    v0[17] = sub_21F4BAC68(v18, v19, &v38);
    sub_21F551970();
    swift_bridgeObjectRelease();
    uint64_t v20 = v36;
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v37(v29, v20);
    _os_log_impl(&dword_21F464000, v13, v14, "Ignoring Error preparing for proofing: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v17, -1, -1);
    MEMORY[0x223C4F110](v16, -1, -1);

    v34(v32, v30);
  }
  else
  {
    os_log_type_t v21 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t v22 = v0[29];
    uint64_t v23 = v0[27];
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0[23] + 8);
    v37(v0[24], v0[22]);

    v21(v22, v23);
  }
  uint64_t v24 = (void *)v0[35];
  uint64_t v25 = v0[25];
  uint64_t v26 = v0[22];
  swift_willThrow();

  v37(v25, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t sub_21F53E098()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F550C20();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v24 - v10;
  sub_21F54EF20();
  uint64_t v12 = sub_21F550C10();
  os_log_type_t v13 = sub_21F5517A0();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v14 = 0;
    _os_log_impl(&dword_21F464000, v12, v13, "Retrieving new liveness config", v14, 2u);
    MEMORY[0x223C4F110](v14, -1, -1);
  }

  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v11, v5);
  uint64_t v16 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = 0;

  uint64_t v17 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError) = 0;

  sub_21F54EF20();
  uint64_t v18 = sub_21F550C10();
  os_log_type_t v19 = sub_21F5517A0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_21F464000, v18, v19, "Entering the liveness config fetch lock", v20, 2u);
    MEMORY[0x223C4F110](v20, -1, -1);
  }

  v15(v9, v5);
  dispatch_group_enter(*(dispatch_group_t *)(v1
                                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup));
  uint64_t v21 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  void v22[3] = 0;
  v22[4] = v1;
  swift_retain();
  sub_21F47D908((uint64_t)v4, (uint64_t)&unk_267EE0698, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_21F53E398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a4;
  uint64_t v5 = sub_21F550540();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_21F550550();
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  uint64_t v7 = sub_21F550C20();
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F53E53C, 0, 0);
}

uint64_t sub_21F53E53C()
{
  uint64_t v1 = *(void **)(v0[17] + 112);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_21F53E63C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F535CC8;
  v0[13] = &block_descriptor_138;
  v0[14] = v2;
  objc_msgSend(v1, sel_getLivenessConfigWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F53E63C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 240) = v1;
  if (v1) {
    uint64_t v2 = sub_21F53E908;
  }
  else {
    uint64_t v2 = sub_21F53E74C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F53E74C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = (void *)v0[15];
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = v2;
  id v4 = v2;

  sub_21F54EF10();
  sub_21F54EF20();
  uint64_t v5 = sub_21F550C10();
  os_log_type_t v6 = sub_21F5517A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21F464000, v5, v6, "Signalling the liveness config fetch lock", v7, 2u);
    MEMORY[0x223C4F110](v7, -1, -1);
  }
  uint64_t v8 = v0[29];
  uint64_t v9 = v0[26];
  uint64_t v10 = v0[25];
  uint64_t v11 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  dispatch_group_leave(*(dispatch_group_t *)(v11
                                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_21F53E908()
{
  char v48 = v0;
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[26];
  uint64_t v42 = v0[24];
  uint64_t v4 = v0[22];
  uint64_t v44 = v0[23];
  uint64_t v46 = v0[25];
  uint64_t v6 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v8 = v0[18];
  uint64_t v7 = v0[19];
  swift_willThrow();
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v6, *MEMORY[0x263F36418], v8);
  id v9 = v1;
  sub_21F4BA81C(MEMORY[0x263F8EE78]);
  sub_21F550560();
  sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
  uint64_t v10 = (void *)swift_allocError();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v11(v12, v42, v5);
  sub_21F54EF20();
  sub_21F54EF30();
  os_log_type_t v13 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v13(v2, v46);

  sub_21F54EF20();
  v11(v44, v42, v5);
  uint64_t v14 = sub_21F550C10();
  os_log_type_t v15 = sub_21F5517B0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v43 = v0[25];
    uint64_t v45 = v0[27];
    uint64_t v17 = v0[22];
    uint64_t v16 = v0[23];
    uint64_t v41 = v0[21];
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v47 = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v20 = sub_21F551C60();
    v0[16] = sub_21F4BAC68(v20, v21, &v47);
    sub_21F551970();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v41);
    _os_log_impl(&dword_21F464000, v14, v15, "Attempt to get new liveness config failed with error: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v19, -1, -1);
    MEMORY[0x223C4F110](v18, -1, -1);

    v13(v45, v43);
  }
  else
  {
    uint64_t v22 = v0[27];
    uint64_t v23 = v0[25];
    (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);

    v13(v22, v23);
  }
  uint64_t v24 = (void *)v0[30];
  uint64_t v25 = v0[24];
  uint64_t v26 = v0[21];
  uint64_t v27 = v0[22];
  uint64_t v28 = v0[17];
  uint64_t v29 = swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v30, v25, v26);

  uint64_t v31 = *(void **)(v28 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  *(void *)(v28 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError) = v29;

  sub_21F54EF20();
  uint64_t v32 = sub_21F550C10();
  os_log_type_t v33 = sub_21F5517A0();
  if (os_log_type_enabled(v32, v33))
  {
    os_log_type_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v34 = 0;
    _os_log_impl(&dword_21F464000, v32, v33, "Signalling the liveness config fetch lock", v34, 2u);
    MEMORY[0x223C4F110](v34, -1, -1);
  }
  uint64_t v35 = v0[29];
  uint64_t v36 = v0[26];
  uint64_t v37 = v0[25];
  uint64_t v38 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
  dispatch_group_leave(*(dispatch_group_t *)(v38
                                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v39 = (uint64_t (*)(void))v0[1];
  return v39();
}

uint64_t sub_21F53EDE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v19 = sub_21F550C20();
  uint64_t v1 = *(void *)(v19 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v19);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = sub_21F5503E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21F54FB60();
  if (v10 >> 60 == 15)
  {
    sub_21F54EF20();
    uint64_t v11 = sub_21F550C10();
    os_log_type_t v12 = sub_21F5517A0();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v13 = 0;
      _os_log_impl(&dword_21F464000, v11, v12, "Unable to fetch the attributeConfig, proofing cannot continue", v13, 2u);
      MEMORY[0x223C4F110](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v19);
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v14 = v9;
    unint64_t v15 = v10;
    sub_21F54EA80();
    swift_allocObject();
    sub_21F54EA70();
    sub_21F54B9C8(&qword_267EE0688, MEMORY[0x263F36298]);
    sub_21F54EA60();
    sub_21F47F01C(v14, v15);
    swift_release();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v20, v8, v5);
    uint64_t v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v20, v16, 1, v5);
}

uint64_t sub_21F53F278()
{
  v1[16] = v0;
  uint64_t v2 = sub_21F550C20();
  v1[17] = v2;
  v1[18] = *(void *)(v2 - 8);
  v1[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F53F338, 0, 0);
}

uint64_t sub_21F53F338()
{
  uint64_t v1 = *(void **)(v0[16] + 112);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_21F53F438;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F535CC8;
  v0[13] = &block_descriptor_132;
  v0[14] = v2;
  objc_msgSend(v1, sel_proofingFlowAvailabilityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F53F438()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_21F53F678;
  }
  else {
    uint64_t v2 = sub_21F53F548;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F53F548()
{
  uint64_t v1 = (void *)v0[15];
  sub_21F54EF20();
  uint64_t v2 = sub_21F550C10();
  os_log_type_t v3 = sub_21F5517A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21F464000, v2, v3, "Proofing status saved", v4, 2u);
    MEMORY[0x223C4F110](v4, -1, -1);
  }
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v8 = sub_21F54F7B0();
  uint64_t v9 = sub_21F54F7C0();

  swift_task_dealloc();
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v10(v8, v9);
}

uint64_t sub_21F53F678()
{
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_21F53F6EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550540();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v32 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F550550();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21F550C20();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  os_log_type_t v13 = sub_21F550C10();
  os_log_type_t v14 = sub_21F5517A0();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = v1;
    uint64_t v16 = v4;
    uint64_t v17 = v8;
    uint64_t v18 = v6;
    uint64_t v19 = v5;
    uint64_t v20 = v15;
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_21F464000, v13, v14, "Waiting for the liveness config fetch lock", v15, 2u);
    unint64_t v21 = v20;
    uint64_t v5 = v19;
    uint64_t v6 = v18;
    uint64_t v8 = v17;
    uint64_t v4 = v16;
    uint64_t v1 = v30;
    MEMORY[0x223C4F110](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  id v22 = *(id *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup);
  sub_21F551810();

  uint64_t v23 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  if (v23)
  {
    uint64_t v24 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  }
  else
  {
    uint64_t v24 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
    if (v24)
    {
      id v25 = v24;
    }
    else
    {
      (*(void (**)(char *, void, uint64_t))(v31 + 104))(v4, *MEMORY[0x263F364A0], v32);
      sub_21F4BA81C(MEMORY[0x263F8EE78]);
      sub_21F550560();
      sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      uint64_t v24 = (void *)swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v26, v8, v5);
    }
  }
  id v27 = v23;
  return v24;
}

uint64_t sub_21F53FAB8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F550C20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v8 = sub_21F550C10();
  os_log_type_t v9 = sub_21F5517A0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21F464000, v8, v9, "Invoked delegate to close the view", v10, 2u);
    MEMORY[0x223C4F110](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_21F53FC24();
  uint64_t result = MEMORY[0x223C4F1E0](v2 + 96);
  if (result)
  {
    sub_21F4BA36C(a1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21F53FC24()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDF5A8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_21F550C20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  os_log_type_t v9 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__termsAndConditions);
  uint64_t v10 = v9 + 4;
  uint64_t v11 = v9 + 8;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  os_unfair_lock_lock(v9 + 8);
  sub_21F5469B8(v10);
  os_unfair_lock_unlock(v11);
  uint64_t v12 = *(void *)(v0 + 144);
  swift_retain();
  sub_21F54EF20();
  os_log_type_t v13 = sub_21F550C10();
  os_log_type_t v14 = sub_21F5517A0();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v15 = 0;
    _os_log_impl(&dword_21F464000, v13, v14, "reset page iterator", v15, 2u);
    MEMORY[0x223C4F110](v15, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)(v12 + 16) = 0;
  swift_release();
  swift_retain();
  sub_21F51387C();
  swift_release();
  uint64_t v16 = MEMORY[0x263F8EE80];
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages) = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData);
  swift_beginAccess();
  *uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 1, v18);
  uint64_t v19 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData;
  swift_beginAccess();
  sub_21F4FA3EC((uint64_t)v4, v19, &qword_267EDF5A8);
  swift_endAccess();
  *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager) = 0;
  return swift_release();
}

uint64_t sub_21F53FF10()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F550C20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  os_log_type_t v9 = sub_21F550C10();
  os_log_type_t v10 = sub_21F5517A0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21F464000, v9, v10, "notify active configurations changed invoked on the caller", v11, 2u);
    MEMORY[0x223C4F110](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  os_log_type_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  void v13[3] = 0;
  _DWORD v13[4] = v1;
  swift_retain();
  sub_21F47D908((uint64_t)v4, (uint64_t)&unk_267EE0680, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_21F540124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[21] = a4;
  uint64_t v5 = sub_21F550C20();
  v4[22] = v5;
  v4[23] = *(void *)(v5 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F5401F4, 0, 0);
}

uint64_t sub_21F5401F4()
{
  uint64_t v1 = *(void **)(v0[21] + 112);
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_21F5402F4;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F535CC8;
  v0[13] = &block_descriptor_131;
  v0[14] = v2;
  objc_msgSend(v1, sel_proofingFlowAvailabilityWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F5402F4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_21F54060C;
  }
  else {
    uint64_t v2 = sub_21F540404;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F540404()
{
  uint64_t v1 = (void *)v0[18];
  sub_21F54EF20();
  uint64_t v2 = sub_21F550C10();
  os_log_type_t v3 = sub_21F5517A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21F464000, v2, v3, "proofing status doesn't exist. Cannot return the active configuration.", v4, 2u);
    MEMORY[0x223C4F110](v4, -1, -1);
  }
  uint64_t v5 = v0[25];
  uint64_t v6 = v0[22];
  uint64_t v7 = v0[23];
  uint64_t v8 = v0[21];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  uint64_t v9 = MEMORY[0x223C4F1E0](v8 + 96);
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = sub_21F54F7C0();
    uint64_t v12 = (void *)MEMORY[0x223C4F1E0](v10 + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_delegate);
    if (v12)
    {
      os_log_type_t v13 = v12;
      if (objc_msgSend(v12, sel_respondsToSelector_, sel_proofingFlowManager_didChangeActiveConfigurations_))
      {
        os_log_type_t v14 = (void *)MEMORY[0x223C4F1E0](v10 + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_externalProofingFlowManager);
        sub_21F50A644(v11);
        sub_21F46EFD8(0, &qword_267EDF438);
        uint64_t v15 = (void *)sub_21F551640();
        objc_msgSend(v13, sel_proofingFlowManager_didChangeActiveConfigurations_, v14, v15);

        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_21F54060C()
{
  unint64_t v21 = v0;
  uint64_t v1 = (void *)v0[26];
  swift_willThrow();
  sub_21F54EF20();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_21F550C10();
  os_log_type_t v5 = sub_21F5517B0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[26];
    uint64_t v17 = v0[23];
    uint64_t v18 = v0[22];
    uint64_t v19 = v0[24];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_21F551C60();
    v0[20] = sub_21F4BAC68(v9, v10, &v20);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v4, v5, "received an error in checking the proofing status %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v8, -1, -1);
    MEMORY[0x223C4F110](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    unint64_t v11 = (void *)v0[26];
    uint64_t v13 = v0[23];
    uint64_t v12 = v0[24];
    uint64_t v14 = v0[22];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_21F54085C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_21F550C20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_authorizationStatus) == (id)2)
  {
    swift_retain();
    sub_21F5502B0();
    sub_21F550150();
    uint64_t v8 = *(void (**)(uint64_t))(**(void **)(a2 + 152) + 96);
    uint64_t v9 = swift_retain();
    v8(v9);
    swift_release();
    sub_21F536808();
    sub_21F54F980();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_21F54EF20();
    unint64_t v11 = sub_21F550C10();
    os_log_type_t v12 = sub_21F5517A0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_21F464000, v11, v12, "The notification has not been authorized by the user", v13, 2u);
      MEMORY[0x223C4F110](v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_21F540AE0()
{
  uint64_t v1 = sub_21F54F7A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper);
  uint64_t v7 = *(void *)(v0 + 176);
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements);
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8);
  uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
  uint64_t v16 = v9;
  uint64_t v12 = v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
  type metadata accessor for IdentityProofingUIConfigFactory();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_21F4E35CC(v5, v7, v6, v8, v16, v10, v15, v11, (uint64_t)v4);
}

void sub_21F540C94()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F550540();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  if (v16)
  {
    uint64_t v17 = *(void *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    uint64_t v18 = sub_21F551710();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = 0;
    void v19[3] = 0;
    v19[4] = v1;
    v19[5] = v17;
    v19[6] = v16;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_21F47D908((uint64_t)v15, (uint64_t)&unk_267EE0670, (uint64_t)v19);
    swift_release();
  }
  else
  {
    sub_21F54EF20();
    uint64_t v20 = sub_21F550C10();
    uint64_t v21 = sub_21F5517A0();
    if (os_log_type_enabled(v20, (os_log_type_t)v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = v7;
      uint64_t v23 = v22;
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_21F464000, v20, (os_log_type_t)v21, "State of the document doesn't exist. Cannot invoke provision identity", v22, 2u);
      uint64_t v24 = v23;
      uint64_t v7 = v31;
      MEMORY[0x223C4F110](v24, -1, -1);
    }

    id v25 = *(void (**)(char *, uint64_t))(v7 + 8);
    v25(v12, v6);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F36448], v2);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    uint64_t v26 = (void *)swift_allocError();
    sub_21F550560();
    sub_21F54EF20();
    id v27 = sub_21F550C10();
    os_log_type_t v28 = sub_21F5517A0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_21F464000, v27, v28, "Invoked delegate to close the view", v29, 2u);
      MEMORY[0x223C4F110](v29, -1, -1);
    }

    v25(v10, v6);
    sub_21F53FC24();
    if (MEMORY[0x223C4F1E0](v1 + 96))
    {
      sub_21F4BA36C(v26);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_21F541134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  uint64_t v7 = sub_21F550C20();
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F541208, 0, 0);
}

uint64_t sub_21F541208()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = *(void **)(v1 + 112);
  uint64_t v3 = sub_21F551560();
  v0[27] = v3;
  uint64_t v4 = *(void *)(v1 + 136);
  v0[2] = v0;
  v0[3] = sub_21F541324;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F534790;
  v0[13] = &block_descriptor_3;
  v0[14] = v5;
  objc_msgSend(v2, sel_provisionIdentityWithState_proofingOptions_completionHandler_, v3, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F541324()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_21F541540;
  }
  else {
    uint64_t v2 = sub_21F541434;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F541434()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Successfully invoked provisionIdentity", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_21F541540()
{
  uint64_t v22 = v0;
  os_log_type_t v2 = (void *)v0[27];
  uint64_t v1 = (void *)v0[28];
  swift_willThrow();

  sub_21F54EF20();
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_21F550C10();
  os_log_type_t v6 = sub_21F5517A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[28];
    uint64_t v18 = v0[24];
    uint64_t v19 = v0[23];
    uint64_t v20 = v0[25];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v10 = sub_21F551C60();
    v0[19] = sub_21F4BAC68(v10, v11, &v21);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v5, v6, "Error received on provisionIdentity invocation %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v9, -1, -1);
    MEMORY[0x223C4F110](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v12 = (void *)v0[28];
    uint64_t v14 = v0[24];
    uint64_t v13 = v0[25];
    uint64_t v15 = v0[23];

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_21F541794@<X0>(char a1@<W0>, unint64_t *a2@<X8>)
{
  uint64_t v4 = sub_21F550340();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v48 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v48 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v17((char *)&v48 - v15, 1, 1, v4);
  if (a1 == 1)
  {
    uint64_t v23 = *(void *)(v49 + 176);
    if (v23 && *(void *)(v23 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_21F472B68(0x7365527472656C61, 0xEF6B6361426E6163);
      if (v25)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v11, *(void *)(v23 + 56) + *(void *)(v5 + 72) * v24, v4);
        uint64_t v26 = v11;
        uint64_t v27 = 0;
      }
      else
      {
        uint64_t v26 = v11;
        uint64_t v27 = 1;
      }
      v17(v26, v27, 1, v4);
      swift_bridgeObjectRelease();
    }
    else
    {
      v17(v11, 1, 1, v4);
    }
    uint64_t v14 = v11;
  }
  else
  {
    if (a1) {
      goto LABEL_19;
    }
    uint64_t v18 = *(void *)(v49 + 176);
    if (v18 && *(void *)(v18 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_21F472B68(0xD000000000000010, 0x800000021F55EB00);
      if (v20)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v14, *(void *)(v18 + 56) + *(void *)(v5 + 72) * v19, v4);
        uint64_t v21 = v14;
        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v21 = v14;
        uint64_t v22 = 1;
      }
      v17(v21, v22, 1, v4);
      swift_bridgeObjectRelease();
    }
    else
    {
      v17(v14, 1, 1, v4);
    }
  }
  sub_21F4FA3EC((uint64_t)v14, (uint64_t)v16, &qword_267EDEEC8);
LABEL_19:
  os_log_type_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v28(v16, 1, v4))
  {
    unint64_t v29 = 0;
LABEL_21:
    unint64_t v30 = 0;
    goto LABEL_24;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v16, v4);
  uint64_t v31 = sub_21F550300();
  unint64_t v29 = v32;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!v29) {
    goto LABEL_21;
  }
  uint64_t v33 = sub_21F534070(v31, v29);
  unint64_t v30 = v34;
  unint64_t v29 = v33;
  swift_bridgeObjectRelease();
LABEL_24:
  if (v28(v16, 1, v4))
  {
    unint64_t v35 = 0;
    unint64_t v36 = 0;
    uint64_t v37 = 0;
    unint64_t v38 = 0;
LABEL_38:
    uint64_t result = sub_21F47F030((uint64_t)v16, &qword_267EDEEC8);
    *a2 = v29;
    a2[1] = v30;
    a2[2] = v37;
    a2[3] = v38;
    a2[4] = v35;
    a2[5] = v36;
    return result;
  }
  unint64_t v39 = v29;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v16, v4);
  uint64_t v40 = (void *)sub_21F550310();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!v40)
  {
    unint64_t v35 = 0;
LABEL_36:
    unint64_t v36 = 0;
    uint64_t v37 = 0;
    unint64_t v38 = 0;
LABEL_37:
    unint64_t v29 = v39;
    goto LABEL_38;
  }
  unint64_t v35 = v40[2];
  if (!v35)
  {
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  uint64_t v41 = v40[4];
  unint64_t v42 = v40[5];
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_21F534070(v41, v42);
  unint64_t v38 = v43;
  uint64_t result = swift_bridgeObjectRelease();
  if (!v38)
  {
    swift_bridgeObjectRelease();
    unint64_t v35 = 0;
    unint64_t v36 = 0;
    uint64_t v37 = 0;
    goto LABEL_37;
  }
  if (v35 <= 1)
  {
    swift_bridgeObjectRelease();
    unint64_t v35 = 0;
    unint64_t v36 = 0;
    goto LABEL_37;
  }
  if (v40[2] >= 2uLL)
  {
    uint64_t v45 = v40[6];
    unint64_t v46 = v40[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v35 = sub_21F534070(v45, v46);
    unint64_t v36 = v47;
    swift_bridgeObjectRelease();
    if (!v36) {
      unint64_t v35 = 0;
    }
    goto LABEL_37;
  }
  __break(1u);
  return result;
}

void sub_21F541CBC(void *a1)
{
  uint64_t v2 = v1;
  id v39 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F550340();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550C20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v14 = sub_21F550C10();
  os_log_type_t v15 = sub_21F5517A0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v40 = v6;
  if (v16)
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_21F464000, v14, v15, "Will show an error alert due to an internal error", v17, 2u);
    uint64_t v18 = v17;
    uint64_t v6 = v40;
    MEMORY[0x223C4F110](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v19 = *(void *)(v2 + 176);
  if (!v19 || !*(void *)(v19 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
LABEL_26:
    sub_21F47F030((uint64_t)v5, &qword_267EDEEC8);
    sub_21F551B40();
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_21F472B68(0xD000000000000018, 0x800000021F55EF90);
  if (v21)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, *(void *)(v19 + 56) + *(void *)(v7 + 72) * v20, v6);
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v22, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  uint64_t v23 = sub_21F550300();
  if (v24)
  {
    unint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
  sub_21F534070(v23, v25);
  swift_bridgeObjectRelease();
  uint64_t v26 = (void *)sub_21F550330();
  if (v26)
  {
    if (v26[2])
    {
      uint64_t v27 = v26[4];
      unint64_t v28 = v26[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_21F534070(v27, v28);
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v29 = (void *)sub_21F550310();
  if (v29)
  {
    if (v29[2])
    {
      uint64_t v30 = v29[4];
      unint64_t v31 = v29[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_21F534070(v30, v31);
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v32 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  id v34 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v32, v33, 1);

  uint64_t v35 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  unint64_t v36 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_21F54B8AC;
  aBlock[5] = v35;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F46C554;
  aBlock[3] = &block_descriptor_238;
  uint64_t v37 = _Block_copy(aBlock);
  swift_release();
  id v38 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v36, 0, v37);
  _Block_release(v37);
  swift_release();

  objc_msgSend(v34, sel_addAction_, v38);
  if (v39)
  {
    objc_msgSend(v39, sel_presentViewController_animated_completion_, v34, 1, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v40);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v40);
  }
}

void sub_21F542328(uint64_t a1)
{
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v6 = sub_21F550C10();
  os_log_type_t v7 = sub_21F5517A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21F464000, v6, v7, "Deinitializing the termsAndConditionsViewController object in proofingFlowManager", v8, 2u);
    MEMORY[0x223C4F110](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = *(void **)(a1 + 168);
  *(void *)(a1 + 168) = 0;
}

BOOL sub_21F542474(void *a1)
{
  type metadata accessor for IDScanViewController(0);
  uint64_t v2 = swift_dynamicCastClass();
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_scanSide;
    if (*(unsigned char *)(v2 + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_scanSide))
    {
      id v5 = a1;
    }
    else
    {
      id v6 = a1;
      swift_retain();
      char v7 = sub_21F4A17A8();
      swift_release();
      if (v7)
      {

        return 1;
      }
      if (*(unsigned char *)(v3 + v4) != 1)
      {

        goto LABEL_10;
      }
    }
    swift_retain();
    char v9 = sub_21F4A17A8();
    swift_release();

    if ((v9 & 1) == 0) {
      return 1;
    }
  }
LABEL_10:
  type metadata accessor for IdentityProofingReviewSubmissionViewController();
  if (swift_dynamicCastClass()) {
    return 1;
  }
  type metadata accessor for IdentityProofingProgressViewController();
  if (swift_dynamicCastClass()) {
    return 1;
  }
  type metadata accessor for RGBCaptureViewController();
  if (swift_dynamicCastClass()) {
    return 1;
  }
  type metadata accessor for IdentityProofingFedStatsOptinViewController();
  return swift_dynamicCastClass() != 0;
}

uint64_t sub_21F5425B4(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v64 = a3;
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v66 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  os_log_type_t v15 = (char *)&v61 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v61 - v17;
  MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v61 - v19;
  uint64_t v65 = v3;
  uint64_t v21 = *(void *)(v3 + 176);
  id v63 = a1;
  uint64_t v67 = v7;
  uint64_t v68 = v6;
  if (v21 && *(void *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_21F472B68(0xD00000000000001FLL, a2);
    if (v23)
    {
      unint64_t v24 = v22;
      unint64_t v25 = v20;
      uint64_t v26 = *(void *)(v21 + 56);
      uint64_t v27 = sub_21F550340();
      uint64_t v28 = *(void *)(v27 - 8);
      uint64_t v29 = v28;
      uint64_t v30 = v26 + *(void *)(v28 + 72) * v24;
      unint64_t v20 = v25;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v25, v30, v27);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v25, 0, 1, v27);
    }
    else
    {
      uint64_t v27 = sub_21F550340();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v20, 1, 1, v27);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = sub_21F550340();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v20, 1, 1, v27);
  }
  sub_21F475FD0((uint64_t)v20, (uint64_t)v18, &qword_267EDEEC8);
  sub_21F550340();
  uint64_t v31 = *(void *)(v27 - 8);
  unint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
  if (v32(v18, 1, v27) == 1)
  {
    sub_21F47F030((uint64_t)v18, &qword_267EDEEC8);
  }
  else
  {
    uint64_t v33 = sub_21F550300();
    unint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v27);
    if (v35)
    {
      uint64_t v62 = sub_21F534070(v33, v35);
      uint64_t v37 = v36;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  uint64_t v62 = 0;
  uint64_t v37 = 0;
LABEL_13:
  sub_21F475FD0((uint64_t)v20, (uint64_t)v15, &qword_267EDEEC8);
  if (v32(v15, 1, v27) == 1)
  {
    sub_21F47F030((uint64_t)v15, &qword_267EDEEC8);
  }
  else
  {
    id v38 = (void *)sub_21F550330();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v27);
    if (v38)
    {
      if (v38[2])
      {
        uint64_t v61 = v20;
        uint64_t v39 = v38[4];
        unint64_t v40 = v38[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_21F534070(v39, v40);
        uint64_t v42 = v41;
        unint64_t v20 = v61;
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v42 = 0;
LABEL_20:
  sub_21F475FD0((uint64_t)v20, (uint64_t)v12, &qword_267EDEEC8);
  if (v32(v12, 1, v27) == 1)
  {
    sub_21F47F030((uint64_t)v12, &qword_267EDEEC8);
  }
  else
  {
    unint64_t v43 = (void *)sub_21F550310();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v27);
    if (!v43)
    {
      if (!v37) {
        goto LABEL_33;
      }
      goto LABEL_30;
    }
    if (v43[2])
    {
      uint64_t v44 = v20;
      uint64_t v45 = v43[4];
      unint64_t v46 = v43[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_21F534070(v45, v46);
      unint64_t v43 = v47;
      swift_bridgeObjectRelease();
      unint64_t v20 = v44;
      if (!v37) {
        goto LABEL_33;
      }
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
  }
  unint64_t v43 = 0;
  if (!v37) {
    goto LABEL_33;
  }
LABEL_30:
  if (v42 && v43)
  {
    uint64_t v48 = v20;
    uint64_t v49 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    uint64_t v50 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    id v51 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v49, v50, 1);

    unint64_t v20 = v48;
    os_log_type_t v52 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    id v53 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v52, 0, 0);

    objc_msgSend(v51, sel_addAction_, v53);
    objc_msgSend(v63, sel_presentViewController_animated_completion_, v51, 1, 0);

    return sub_21F47F030((uint64_t)v20, &qword_267EDEEC8);
  }
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v55 = v67;
  uint64_t v54 = v68;
  uint64_t v56 = v66;
  sub_21F54EF20();
  id v57 = sub_21F550C10();
  os_log_type_t v58 = sub_21F5517A0();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v59 = 0;
    _os_log_impl(&dword_21F464000, v57, v58, v64, v59, 2u);
    MEMORY[0x223C4F110](v59, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v54);
  return sub_21F47F030((uint64_t)v20, &qword_267EDEEC8);
}

uint64_t sub_21F542D00(void *a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v84 = a5;
  uint64_t v85 = a6;
  int v83 = a4;
  id v86 = a1;
  uint64_t v87 = a2;
  uint64_t v8 = sub_21F550C20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  os_log_type_t v15 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v80 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v80 - v20;
  MEMORY[0x270FA5388](v19);
  char v23 = (char *)&v80 - v22;
  uint64_t v89 = v8;
  uint64_t v90 = v6;
  uint64_t v24 = *(void *)(v6 + 176);
  id v92 = v11;
  os_log_type_t v93 = (char *)&v80 - v22;
  uint64_t v88 = v9;
  id v91 = a3;
  if (v24 && *(void *)(v24 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_21F472B68(v87, (uint64_t)a3);
    if (v26)
    {
      unint64_t v27 = v25;
      uint64_t v28 = *(void *)(v24 + 56);
      uint64_t v29 = sub_21F550340();
      uint64_t v30 = *(void *)(v29 - 8);
      uint64_t v31 = v30;
      uint64_t v32 = v28 + *(void *)(v30 + 72) * v27;
      char v23 = v93;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v93, v32, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v23, 0, 1, v29);
    }
    else
    {
      uint64_t v29 = sub_21F550340();
      char v23 = v93;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v93, 1, 1, v29);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = sub_21F550340();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v23, 1, 1, v29);
  }
  sub_21F475FD0((uint64_t)v23, (uint64_t)v21, &qword_267EDEEC8);
  sub_21F550340();
  uint64_t v33 = *(void *)(v29 - 8);
  unint64_t v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  if (v34(v21, 1, v29) == 1)
  {
    sub_21F47F030((uint64_t)v21, &qword_267EDEEC8);
    uint64_t v82 = 0;
    uint64_t v35 = 0;
  }
  else
  {
    uint64_t v36 = sub_21F550300();
    unint64_t v38 = v37;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v29);
    if (v38)
    {
      uint64_t v82 = sub_21F534070(v36, v38);
      uint64_t v35 = v39;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v82 = 0;
      uint64_t v35 = 0;
    }
    char v23 = v93;
  }
  sub_21F475FD0((uint64_t)v23, (uint64_t)v18, &qword_267EDEEC8);
  if (v34(v18, 1, v29) == 1)
  {
    sub_21F47F030((uint64_t)v18, &qword_267EDEEC8);
  }
  else
  {
    unint64_t v40 = (void *)sub_21F550330();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v18, v29);
    if (v40)
    {
      if (v40[2])
      {
        uint64_t v41 = v40[4];
        unint64_t v42 = v40[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v43 = v41;
        char v23 = v93;
        uint64_t v81 = sub_21F534070(v43, v42);
        uint64_t v45 = v44;
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v81 = 0;
  uint64_t v45 = 0;
LABEL_21:
  sub_21F475FD0((uint64_t)v23, (uint64_t)v15, &qword_267EDEEC8);
  if (v34(v15, 1, v29) == 1)
  {
    sub_21F47F030((uint64_t)v15, &qword_267EDEEC8);
LABEL_29:
    uint64_t v58 = 0;
    uint64_t v53 = 0;
    unint64_t v49 = (unint64_t)v91;
    id v48 = v92;
    goto LABEL_30;
  }
  unint64_t v46 = (void *)sub_21F550310();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v15, v29);
  if (!v46) {
    goto LABEL_29;
  }
  unint64_t v47 = v46[2];
  unint64_t v49 = (unint64_t)v91;
  id v48 = v92;
  if (v47)
  {
    uint64_t v50 = v46[4];
    unint64_t v51 = v46[5];
    swift_bridgeObjectRetain();
    sub_21F534070(v50, v51);
    uint64_t v53 = v52;
    uint64_t result = swift_bridgeObjectRelease();
    if (v53 && v47 > 1)
    {
      if (v46[2] < 2uLL)
      {
        __break(1u);
        return result;
      }
      uint64_t v55 = v46[6];
      unint64_t v56 = v46[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_21F534070(v55, v56);
      uint64_t v58 = v57;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v58 = 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v58 = 0;
    uint64_t v53 = 0;
  }
LABEL_30:
  if (v35 && v45 && v53 && v58)
  {
    uint64_t v59 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    uint64_t v60 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    id v91 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v59, v60, 1);

    uint64_t v61 = v90;
    swift_retain();
    uint64_t v62 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    uint64_t v98 = sub_21F54AA98;
    uint64_t v99 = v61;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v95 = 1107296256;
    uint64_t v96 = sub_21F46C554;
    uint64_t v97 = &block_descriptor_168;
    id v63 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v64 = self;
    id v92 = objc_msgSend(v64, sel_actionWithTitle_style_handler_, v62, 0, v63);
    _Block_release(v63);

    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = v61;
    *(unsigned char *)(v65 + 24) = v83 & 1;
    uint64_t v66 = v84;
    uint64_t v67 = v85;
    *(void *)(v65 + 32) = v84;
    *(void *)(v65 + 40) = v67;
    uint64_t v68 = v86;
    *(void *)(v65 + 48) = v86;
    swift_retain();
    sub_21F47F790(v66);
    id v69 = v68;
    uint64_t v70 = (void *)sub_21F551560();
    swift_bridgeObjectRelease();
    uint64_t v98 = sub_21F54AAF0;
    uint64_t v99 = v65;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v95 = 1107296256;
    uint64_t v96 = sub_21F46C554;
    uint64_t v97 = &block_descriptor_174;
    uint64_t v71 = _Block_copy(&aBlock);
    swift_release();
    id v72 = objc_msgSend(v64, sel_actionWithTitle_style_handler_, v70, 0, v71);
    _Block_release(v71);

    id v73 = v91;
    objc_msgSend(v91, sel_addAction_, v92);
    objc_msgSend(v73, sel_addAction_, v72);
    objc_msgSend(v73, sel_setPreferredAction_, v72);
    objc_msgSend(v69, sel_presentViewController_animated_completion_, v73, 1, 0);
    uint64_t v89 = sub_21F5502A0();
    swift_retain();
    sub_21F54FFE0();
    BOOL v74 = *(void (**)(uint64_t))(**(void **)(v61 + 152) + 96);
    uint64_t v75 = swift_retain();
    v74(v75);
    swift_release();
    sub_21F54F980();

    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21F54EF20();
    swift_bridgeObjectRetain_n();
    BOOL v76 = sub_21F550C10();
    os_log_type_t v77 = sub_21F5517A0();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      uint64_t aBlock = v79;
      *(_DWORD *)uint64_t v78 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v100 = sub_21F4BAC68(v87, v49, &aBlock);
      sub_21F551970();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F464000, v76, v77, "Unable to show the %s as the server doesn't have the related fields in the config", v78, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v79, -1, -1);
      MEMORY[0x223C4F110](v78, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(id, uint64_t))(v88 + 8))(v48, v89);
  }
  return sub_21F47F030((uint64_t)v93, &qword_267EDEEC8);
}

uint64_t sub_21F54384C(uint64_t a1, uint64_t a2)
{
  sub_21F550280();
  sub_21F54FFD0();
  swift_retain();
  sub_21F54FFE0();
  uint64_t v3 = *(void (**)(uint64_t))(**(void **)(a2 + 152) + 96);
  uint64_t v4 = swift_retain();
  v3(v4);
  swift_release();
  sub_21F54F980();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21F54398C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  unint64_t v38 = a6;
  uint64_t v39 = a4;
  uint64_t v40 = a5;
  int v47 = a3;
  uint64_t v7 = sub_21F551470();
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_21F5514A0();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v41 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550C20();
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v35 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v34 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F550280();
  sub_21F54FF90();
  swift_retain();
  sub_21F54FFE0();
  uint64_t v48 = a2;
  uint64_t v14 = *(void (**)(uint64_t))(**(void **)(a2 + 152) + 96);
  uint64_t v15 = swift_retain();
  v14(v15);
  swift_release();
  sub_21F54F980();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (v47)
  {
    uint64_t v16 = sub_21F551710();
    uint64_t v17 = (uint64_t)v34;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v34, 1, 1, v16);
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = 0;
    void v18[3] = 0;
    uint64_t v19 = v38;
    v18[4] = v48;
    v18[5] = v19;
    swift_retain();
    id v20 = v19;
    sub_21F47D908(v17, (uint64_t)&unk_267EE06D0, (uint64_t)v18);
    return swift_release();
  }
  else
  {
    uint64_t v22 = v48;
    char v23 = v35;
    sub_21F54EF20();
    uint64_t v24 = sub_21F550C10();
    os_log_type_t v25 = sub_21F5517A0();
    if (os_log_type_enabled(v24, v25))
    {
      char v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v26 = 0;
      _os_log_impl(&dword_21F464000, v24, v25, "User has clicked on cancel before a proofing request has been made. Close the view", v26, 2u);
      MEMORY[0x223C4F110](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v23, v37);
    sub_21F46EFD8(0, (unint64_t *)&qword_267EDEC50);
    unint64_t v27 = (void *)sub_21F551850();
    uint64_t v28 = (void *)swift_allocObject();
    uint64_t v29 = v39;
    v28[2] = v22;
    v28[3] = v29;
    v28[4] = v40;
    aBlock[4] = sub_21F54AB4C;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21F46FC24;
    aBlock[3] = &block_descriptor_180;
    uint64_t v30 = _Block_copy(aBlock);
    swift_retain();
    sub_21F47F790(v29);
    swift_release();
    uint64_t v31 = v41;
    sub_21F551490();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21F54B9C8((unint64_t *)&qword_267EDEC80, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE0060);
    sub_21F519B98((unint64_t *)&qword_267EDEC90, (uint64_t *)&unk_267EE0060);
    uint64_t v32 = v43;
    uint64_t v33 = v46;
    sub_21F551A00();
    MEMORY[0x223C4E340](0, v31, v32, v30);
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v33);
    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v31, v44);
  }
}

uint64_t sub_21F543F94(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = sub_21F550C20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v8 = sub_21F550C10();
  os_log_type_t v9 = sub_21F5517A0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21F464000, v8, v9, "Invoked delegate to close the view", v10, 2u);
    MEMORY[0x223C4F110](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_21F53FC24();
  uint64_t result = MEMORY[0x223C4F1E0](a1 + 96);
  if (result)
  {
    sub_21F4BA36C(0);
    uint64_t result = swift_unknownObjectRelease();
  }
  if (a2) {
    return a2(result);
  }
  return result;
}

uint64_t sub_21F54411C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = sub_21F551470();
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  uint64_t v7 = sub_21F5514A0();
  v5[21] = v7;
  v5[22] = *(void *)(v7 - 8);
  v5[23] = swift_task_alloc();
  uint64_t v10 = (uint64_t (__cdecl *)())((char *)&dword_267EE06D8 + dword_267EE06D8);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[24] = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_21F54427C;
  return v10();
}

uint64_t sub_21F54427C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 200) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21F54437C, 0, 0);
}

uint64_t sub_21F54437C()
{
  uint64_t v1 = (void *)v0;
  char v2 = *(unsigned char *)(v0 + 200);
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDEC50);
  uint64_t v3 = sub_21F551850();
  uint64_t v4 = v1[23];
  uint64_t v18 = v1[22];
  uint64_t v5 = v1[20];
  uint64_t v16 = (void *)v3;
  uint64_t v17 = v1[21];
  uint64_t v6 = v1[18];
  uint64_t v15 = v1[19];
  if (v2)
  {
    v1[13] = v1[16];
    uint64_t v7 = v1 + 15;
    v1[12] = sub_21F54B31C;
    v1[8] = MEMORY[0x263EF8330];
    v1[9] = 1107296256;
    v1[10] = sub_21F46FC24;
    v1[11] = &block_descriptor_194;
    uint64_t v8 = _Block_copy(v1 + 8);
    swift_retain();
  }
  else
  {
    uint64_t v10 = v1[16];
    os_log_type_t v9 = (void *)v1[17];
    uint64_t v11 = swift_allocObject();
    v1[7] = v11;
    uint64_t v7 = v1 + 14;
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = v9;
    v1[6] = sub_21F54B2DC;
    v1[2] = MEMORY[0x263EF8330];
    v1[3] = 1107296256;
    v1[4] = sub_21F46FC24;
    v1[5] = &block_descriptor_190;
    uint64_t v8 = _Block_copy(v1 + 2);
    swift_retain();
    id v12 = v9;
  }
  sub_21F551490();
  *uint64_t v7 = MEMORY[0x263F8EE78];
  sub_21F54B9C8((unint64_t *)&qword_267EDEC80, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE0060);
  sub_21F519B98((unint64_t *)&qword_267EDEC90, (uint64_t *)&unk_267EE0060);
  sub_21F551A00();
  MEMORY[0x223C4E340](0, v4, v5, v8);
  _Block_release(v8);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v17);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v1[1];
  return v13();
}

uint64_t sub_21F544654(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_21F551470();
  uint64_t v21 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_21F5514A0();
  uint64_t v12 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDEC50);
  uint64_t v15 = (void *)sub_21F551850();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a2;
  void v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  aBlock[4] = sub_21F54B34C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F46FC24;
  aBlock[3] = &block_descriptor_207;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  id v18 = a3;
  swift_retain();
  swift_release();
  sub_21F551490();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_21F54B9C8((unint64_t *)&qword_267EDEC80, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE0060);
  sub_21F519B98((unint64_t *)&qword_267EDEC90, (uint64_t *)&unk_267EE0060);
  sub_21F551A00();
  MEMORY[0x223C4E340](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v20);
}

void sub_21F544944(char a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_21F550C20();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - v13;
  if (a2)
  {
    uint64_t v15 = (void *)sub_21F54EB50();
    sub_21F54EF20();
    id v16 = v15;
    uint64_t v17 = sub_21F550C10();
    os_log_type_t v18 = sub_21F5517B0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v39 = v8;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v42 = v37;
      unint64_t v38 = a3;
      *(_DWORD *)uint64_t v19 = 136446210;
      uint64_t v35 = v19 + 4;
      id v20 = v16;
      uint64_t v40 = a4;
      id v21 = v20;
      id v22 = objc_msgSend(v20, sel_description);
      uint64_t v36 = v9;
      id v23 = v22;
      uint64_t v24 = sub_21F5515A0();
      unint64_t v26 = v25;

      uint64_t v41 = sub_21F4BAC68(v24, v26, &v42);
      a3 = v38;
      sub_21F551970();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21F464000, v17, v18, "Failed to repair cloud sync state with error %{public}s", v19, 0xCu);
      uint64_t v27 = v37;
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v27, -1, -1);
      MEMORY[0x223C4F110](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v39);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    id v34 = v16;
    a3(v16);
  }
  else
  {
    sub_21F54EF20();
    uint64_t v28 = sub_21F550C10();
    os_log_type_t v29 = sub_21F5517A0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v40 = a4;
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v39 = v8;
      *(_DWORD *)uint64_t v30 = 136446210;
      uint64_t v42 = v31;
      if (a1) {
        uint64_t v32 = 1702195828;
      }
      else {
        uint64_t v32 = 0x65736C6166;
      }
      if (a1) {
        unint64_t v33 = 0xE400000000000000;
      }
      else {
        unint64_t v33 = 0xE500000000000000;
      }
      uint64_t v41 = sub_21F4BAC68(v32, v33, &v42);
      sub_21F551970();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21F464000, v28, v29, "Repaired iCloud account: %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v31, -1, -1);
      MEMORY[0x223C4F110](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v39);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    a3(0);
  }
}

void sub_21F544D80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_21F544DF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F54EC30();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_21F551550();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21F550340();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v11 = sub_21F49DB68();
  uint64_t v12 = *(void *)(v0 + 176);
  if (!v12 || !*(void *)(v12 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_43:
    sub_21F47F030((uint64_t)v6, &qword_267EDEEC8);
    uint64_t result = sub_21F551B40();
    __break(1u);
    return result;
  }
  int v13 = v11;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_21F472B68(0xD000000000000010, 0x800000021F55F0A0);
  if (v15)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *(void *)(v12 + 56) + *(void *)(v8 + 72) * v14, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  int v53 = v13;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    goto LABEL_43;
  }
  id v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v54 = v7;
  v16(v10, v6, v7);
  uint64_t v17 = sub_21F550300();
  if (!v18) {
    uint64_t v17 = 0;
  }
  uint64_t v19 = 0xE000000000000000;
  if (v18) {
    unint64_t v20 = v18;
  }
  else {
    unint64_t v20 = 0xE000000000000000;
  }
  uint64_t v21 = sub_21F534070(v17, v20);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = (void *)sub_21F550330();
  if (!v24)
  {
LABEL_30:
    uint64_t v52 = 0;
    if ((sub_21F49DB68() & 1) == 0) {
      goto LABEL_21;
    }
LABEL_31:
    sub_21F551540();
    if (qword_267EDE2E0 != -1) {
      swift_once();
    }
    id v39 = (id)qword_267EE25A0;
    sub_21F54EC20();
    uint64_t v38 = sub_21F5515C0();
    uint64_t v37 = v40;
    goto LABEL_36;
  }
  if (!v24[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  uint64_t v25 = v24[4];
  unint64_t v26 = v24[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_21F534070(v25, v26);
  uint64_t v28 = v21;
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  if (v30) {
    uint64_t v31 = v27;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v52 = v31;
  if (v30) {
    uint64_t v19 = v30;
  }
  else {
    uint64_t v19 = 0xE000000000000000;
  }
  uint64_t v21 = v28;
  if (sub_21F49DB68()) {
    goto LABEL_31;
  }
LABEL_21:
  uint64_t v32 = (void *)sub_21F550310();
  if (v32)
  {
    if (v32[2])
    {
      uint64_t v33 = v32[4];
      unint64_t v34 = v32[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_21F534070(v33, v34);
      uint64_t v37 = v36;
      swift_bridgeObjectRelease();
      if (v37) {
        uint64_t v38 = v35;
      }
      else {
        uint64_t v38 = 0;
      }
      if (!v37) {
        uint64_t v37 = 0xE000000000000000;
      }
      goto LABEL_36;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v38 = 0;
  uint64_t v37 = 0xE000000000000000;
LABEL_36:
  if (v23) {
    uint64_t v41 = v23;
  }
  else {
    uint64_t v41 = 0xE000000000000000;
  }
  if (!v23) {
    uint64_t v21 = 0;
  }
  type metadata accessor for IdentityProofingNavigationControllerHelper();
  uint64_t v42 = swift_allocObject();
  id v43 = objc_allocWithZone((Class)type metadata accessor for IdentityErrorViewController());
  swift_retain();
  uint64_t v44 = (char *)sub_21F4FC2F0(v21, v41, v52, v19, v38, v37, 0, 0, v42, v1);
  swift_release();
  swift_release();
  uint64_t v45 = swift_allocObject();
  *(unsigned char *)(v45 + 16) = v53 & 1;
  *(void *)(v45 + 24) = v1;
  *(void *)(v45 + 32) = v44;
  uint64_t v46 = (void (**)())&v44[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  uint64_t v47 = *(void *)&v44[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  *uint64_t v46 = sub_21F54BAEC;
  v46[1] = (void (*)())v45;
  swift_retain();
  uint64_t v48 = v44;
  sub_21F47D8F8(v47);
  unint64_t v49 = (uint64_t (**)())&v48[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  uint64_t v50 = *(void *)&v48[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  *unint64_t v49 = sub_21F54BAF8;
  v49[1] = (uint64_t (*)())v1;
  swift_retain();
  sub_21F47D8F8(v50);
  sub_21F538974();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v54);
  return (uint64_t)v48;
}

uint64_t sub_21F545410()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDEEC8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F550340();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v0 + 176);
  if (!v9 || !*(void *)(v9 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
LABEL_36:
    sub_21F47F030((uint64_t)v4, &qword_267EDEEC8);
    uint64_t result = sub_21F551B40();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_21F472B68(0x676150726F727265, 0xEF64656C69614665);
  if (v11)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v4, *(void *)(v9 + 56) + *(void *)(v6 + 72) * v10, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    goto LABEL_36;
  }
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v42 = v5;
  v12(v8, v4, v5);
  uint64_t v13 = sub_21F550300();
  if (!v14) {
    uint64_t v13 = 0;
  }
  uint64_t v15 = 0xE000000000000000;
  if (v14) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = 0xE000000000000000;
  }
  uint64_t v17 = sub_21F534070(v13, v16);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  unint64_t v20 = (void *)sub_21F550330();
  if (!v20) {
    goto LABEL_21;
  }
  if (!v20[2])
  {
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v41 = 0;
    goto LABEL_22;
  }
  uint64_t v21 = v20[4];
  unint64_t v22 = v20[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_21F534070(v21, v22);
  uint64_t v15 = v24;
  swift_bridgeObjectRelease();
  if (v15) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v41 = v25;
  if (!v15) {
    uint64_t v15 = 0xE000000000000000;
  }
LABEL_22:
  unint64_t v26 = (void *)sub_21F550310();
  if (v26)
  {
    if (v26[2])
    {
      uint64_t v27 = v26[4];
      unint64_t v28 = v26[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_21F534070(v27, v28);
      uint64_t v31 = v30;
      swift_bridgeObjectRelease();
      if (v31) {
        uint64_t v32 = v29;
      }
      else {
        uint64_t v32 = 0;
      }
      if (!v31) {
        uint64_t v31 = 0xE000000000000000;
      }
      goto LABEL_32;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v32 = 0;
  uint64_t v31 = 0xE000000000000000;
LABEL_32:
  if (!v19)
  {
    uint64_t v19 = 0xE000000000000000;
    uint64_t v17 = 0;
  }
  type metadata accessor for IdentityProofingNavigationControllerHelper();
  uint64_t v33 = swift_allocObject();
  id v34 = objc_allocWithZone((Class)type metadata accessor for IdentityErrorViewController());
  swift_retain();
  uint64_t v35 = (char *)sub_21F4FC2F0(v17, v19, v41, v15, v32, v31, 0, 0, v33, v1);
  swift_release();
  swift_release();
  uint64_t v36 = (uint64_t (**)())&v35[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  uint64_t v37 = *(void *)&v35[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  *uint64_t v36 = sub_21F54B31C;
  v36[1] = (uint64_t (*)())v1;
  swift_retain();
  sub_21F47D8F8(v37);
  uint64_t v38 = (uint64_t (**)())&v35[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  uint64_t v39 = *(void *)&v35[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  *uint64_t v38 = sub_21F54BAF8;
  v38[1] = (uint64_t (*)())v1;
  swift_retain();
  sub_21F47D8F8(v39);
  sub_21F538974();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v42);
  return (uint64_t)v35;
}

uint64_t sub_21F5458C4()
{
  uint64_t v0 = sub_21F550C20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    sub_21F54EF20();
    uint64_t v6 = sub_21F550C10();
    os_log_type_t v7 = sub_21F5517A0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21F464000, v6, v7, "Invoked delegate to close the view", v8, 2u);
      MEMORY[0x223C4F110](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_21F53FC24();
    if (MEMORY[0x223C4F1E0](v5 + 96))
    {
      sub_21F4BA36C(0);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

void sub_21F545A6C(char a1, uint64_t (*a2)(), void *a3)
{
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    unint64_t v10 = (char *)objc_allocWithZone((Class)type metadata accessor for ProvideFeedbackViewController());
    *(void *)&v10[OBJC_IVAR____TtC9CoreIDVUI29ProvideFeedbackViewController_proofingManager] = a2;
    char v11 = (uint64_t (**)())&v10[OBJC_IVAR____TtC9CoreIDVUI29ProvideFeedbackViewController_continuation];
    *char v11 = sub_21F54B31C;
    v11[1] = a2;
    swift_retain_n();
    id v12 = sub_21F531A34(v10);
    id v18 = objc_msgSend(a3, sel_navigationController);
    sub_21F5342D8(v12, v18);

    uint64_t v13 = v18;
  }
  else
  {
    sub_21F54EF20();
    unint64_t v14 = sub_21F550C10();
    os_log_type_t v15 = sub_21F5517A0();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl(&dword_21F464000, v14, v15, "Invoked delegate to close the view", v16, 2u);
      MEMORY[0x223C4F110](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_21F53FC24();
    if (MEMORY[0x223C4F1E0]((char *)a2 + 96))
    {
      sub_21F4BA36C(0);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_21F545C98(uint64_t a1)
{
  uint64_t v2 = sub_21F550C20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EF20();
  uint64_t v6 = sub_21F550C10();
  os_log_type_t v7 = sub_21F5517A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21F464000, v6, v7, "Invoked delegate to close the view", v8, 2u);
    MEMORY[0x223C4F110](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_21F53FC24();
  uint64_t result = MEMORY[0x223C4F1E0](a1 + 96);
  if (result)
  {
    sub_21F4BA36C(0);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21F545E00(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE790);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F54EBC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL + 8))
  {
    swift_bridgeObjectRetain();
    sub_21F54EBB0();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      return sub_21F47F030((uint64_t)v4, &qword_267EDE790);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
      id v10 = objc_msgSend(self, sel_sharedApplication);
      char v11 = (void *)sub_21F54EBA0();
      sub_21F471788(MEMORY[0x263F8EE78]);
      type metadata accessor for OpenExternalURLOptionsKey(0);
      sub_21F54B9C8((unint64_t *)&qword_267EDF170, type metadata accessor for OpenExternalURLOptionsKey);
      id v12 = (void *)sub_21F5514E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_openURL_options_completionHandler_, v11, v12, 0);

      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return result;
}

uint64_t sub_21F546074()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE790);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_21F54EBC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21F550C20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (*(void *)(Strong + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL + 8))
    {
      swift_bridgeObjectRetain();
      sub_21F54EBB0();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
      {
        sub_21F47F030((uint64_t)v2, &qword_267EDE790);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
        id v17 = objc_msgSend(self, sel_sharedApplication);
        id v18 = (void *)sub_21F54EBA0();
        sub_21F471788(MEMORY[0x263F8EE78]);
        type metadata accessor for OpenExternalURLOptionsKey(0);
        sub_21F54B9C8((unint64_t *)&qword_267EDF170, type metadata accessor for OpenExternalURLOptionsKey);
        uint64_t v19 = (void *)sub_21F5514E0();
        swift_bridgeObjectRelease();
        objc_msgSend(v17, sel_openURL_options_completionHandler_, v18, v19, 0);

        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
    }
    return swift_release();
  }
  else
  {
    sub_21F54EF20();
    id v12 = sub_21F550C10();
    os_log_type_t v13 = sub_21F5517B0();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v21 = v15;
      *(_DWORD *)unint64_t v14 = 136315138;
      v20[1] = sub_21F4BAC68(0xD000000000000026, 0x800000021F55F070, &v21);
      sub_21F551970();
      _os_log_impl(&dword_21F464000, v12, v13, "self doesn't exist in %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v15, -1, -1);
      MEMORY[0x223C4F110](v14, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_21F5464BC()
{
  uint64_t v0 = sub_21F550C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v17 - v5;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    sub_21F54EF20();
    uint64_t v9 = sub_21F550C10();
    os_log_type_t v10 = sub_21F5517A0();
    if (os_log_type_enabled(v9, v10))
    {
      char v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v11 = 0;
      _os_log_impl(&dword_21F464000, v9, v10, "Invoked delegate to close the view", v11, 2u);
      MEMORY[0x223C4F110](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    sub_21F53FC24();
    if (MEMORY[0x223C4F1E0](v8 + 96))
    {
      sub_21F4BA36C(0);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  else
  {
    sub_21F54EF20();
    os_log_type_t v13 = sub_21F550C10();
    os_log_type_t v14 = sub_21F5517B0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      v17[1] = sub_21F4BAC68(0xD000000000000026, 0x800000021F55F070, &v18);
      sub_21F551970();
      _os_log_impl(&dword_21F464000, v13, v14, "self doesn't exist in %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v16, -1, -1);
      MEMORY[0x223C4F110](v15, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  }
}

id sub_21F546894()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingErrorViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingErrorViewController()
{
  return self;
}

uint64_t sub_21F5468F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_21F47F180;
  return sub_21F541134(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21F5469B8(void *a1)
{
  return sub_21F54B8B4(a1);
}

uint64_t sub_21F5469D0()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EEE8]);
}

uint64_t sub_21F5469E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_21F47F180;
  return sub_21F540124(a1, v4, v5, v6);
}

void *sub_21F546A9C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0268);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21F551A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21F546C30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F5504C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0258);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_21F551A50();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  unint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_21F546ED4(unsigned __int8 a1)
{
  uint64_t v3 = *v1;
  sub_21F551CA0();
  sub_21F551CB0();
  uint64_t v4 = sub_21F551CC0();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 3;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(unsigned __int8 *)(v7 + v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        return 3;
      }
    }
    while (*(unsigned __int8 *)(v7 + v6) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v13 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21F546A9C();
    uint64_t v10 = v13;
  }
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v10 + 48) + v6);
  sub_21F546FF8(v6);
  uint64_t *v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_21F546FF8(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_21F551A10();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_21F551CA0();
        sub_21F551CB0();
        unint64_t v10 = sub_21F551CC0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          uint64_t v12 = (unsigned char *)(v11 + v2);
          uint64_t v13 = (unsigned char *)(v11 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *uint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_21F5471A4(void *a1)
{
  uint64_t v3 = sub_21F551470();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21F5514A0();
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F46EFD8(0, (unint64_t *)&qword_267EDEC50);
  unint64_t v10 = (void *)sub_21F551850();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_21F54B84C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F46FC24;
  aBlock[3] = &block_descriptor_232;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a1;
  swift_retain();
  swift_release();
  sub_21F551490();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_21F54B9C8((unint64_t *)&qword_267EDEC80, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EE0060);
  sub_21F519B98((unint64_t *)&qword_267EDEC90, (uint64_t *)&unk_267EE0060);
  sub_21F551A00();
  MEMORY[0x223C4E340](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

void sub_21F54747C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v65 = a1;
  uint64_t v7 = sub_21F550540();
  uint64_t v63 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550550();
  uint64_t v64 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21F550C20();
  uint64_t v66 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  int64_t v18 = (char *)&v58 - v17;
  uint64_t v67 = swift_allocObject();
  *(void *)(v67 + 16) = a4;
  if (a2)
  {
    uint64_t v19 = a3;
    id v20 = a4;
    sub_21F54EF20();
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_21F550C10();
    os_log_type_t v22 = sub_21F5517A0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v62 = v13;
      int64_t v24 = (uint8_t *)v23;
      uint64_t v25 = swift_slowAlloc();
      uint64_t aBlock = (void *)v25;
      *(_DWORD *)int64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v68 = sub_21F4BAC68(v65, a2, (uint64_t *)&aBlock);
      sub_21F551970();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F464000, v21, v22, "This is the auth code proofing flow with passcode: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v25, -1, -1);
      MEMORY[0x223C4F110](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v18, v62);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v18, v13);
    }
    uint64_t v26 = v67;
    uint64_t v41 = *(void **)(v19 + 112);
    uint64_t v42 = (void *)sub_21F551560();
    uint64_t v43 = *(void *)(v19 + 136);
    uint64_t v44 = (void *)swift_allocObject();
    v44[2] = v19;
    v44[3] = sub_21F54BA48;
    v44[4] = v26;
    id v73 = sub_21F54B7EC;
    BOOL v74 = v44;
    uint64_t aBlock = (void *)MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    uint64_t v71 = sub_21F53870C;
    id v72 = &block_descriptor_299;
    uint64_t v45 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v41, sel_proofIdentityUsing_proofingOptions_completion_, v42, v43, v45);
    _Block_release(v45);
    swift_release();
  }
  else
  {
    uint64_t v58 = v16;
    uint64_t v59 = v7;
    uint64_t v60 = v9;
    uint64_t v61 = v12;
    uint64_t v65 = v10;
    uint64_t v62 = v13;
    id v27 = a4;
    swift_retain();
    swift_retain();
    sub_21F4A1500();
    uint64_t v28 = swift_release();
    MEMORY[0x270FA5388](v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDFDC8);
    sub_21F551860();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v29 = aBlock;
    if (aBlock)
    {
      uint64_t v30 = a3;
      uint64_t v31 = *(void **)(a3 + 112);
      uint64_t v32 = *(void *)(a3 + 136);
      uint64_t v33 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      uint64_t v34 = *(void *)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v34) {
        goto LABEL_10;
      }
      uint64_t v35 = *(void **)(v34 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      id v36 = v35;
      sub_21F551860();
      swift_release();

      uint64_t v34 = aBlock;
      uint64_t v37 = *(void *)(a3 + v33);
      if (v37)
      {
        uint64_t v38 = *(void **)(v37 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        id v39 = v38;
        sub_21F551860();
        swift_release();

        uint64_t v40 = (uint64_t)aBlock;
      }
      else
      {
LABEL_10:
        uint64_t v40 = 0;
      }
      uint64_t v46 = v67;
      uint64_t v47 = (void *)swift_allocObject();
      v47[2] = v30;
      v47[3] = sub_21F54BA48;
      v47[4] = v46;
      id v73 = sub_21F54B7EC;
      BOOL v74 = v47;
      uint64_t aBlock = (void *)MEMORY[0x263EF8330];
      uint64_t v70 = 1107296256;
      uint64_t v71 = sub_21F53870C;
      id v72 = &block_descriptor_292;
      uint64_t v48 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v31, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v29, v32, v34, v40, v48);

      _Block_release(v48);
    }
    else
    {
      unint64_t v49 = v58;
      sub_21F54EF20();
      uint64_t v50 = sub_21F550C10();
      os_log_type_t v51 = sub_21F5517A0();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl(&dword_21F464000, v50, v51, "proofIdentity skipped due to missing scanned images", v52, 2u);
        MEMORY[0x223C4F110](v52, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v66 + 8))(v49, v62);
      (*(void (**)(char *, void, uint64_t))(v63 + 104))(v60, *MEMORY[0x263F364A0], v59);
      sub_21F4BA81C(MEMORY[0x263F8EE78]);
      int v53 = v61;
      sub_21F550560();
      sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      uint64_t v54 = v65;
      uint64_t v55 = (void *)swift_allocError();
      uint64_t v56 = v64;
      (*(void (**)(uint64_t, char *, uint64_t))(v64 + 16))(v57, v53, v54);
      sub_21F46C5BC(v55, v27);

      (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v54);
    }
    swift_release();
  }
}

void *sub_21F547D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = (void *)v5;
  v37[0] = a5;
  v37[1] = a2;
  uint64_t v10 = sub_21F550C20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v5 + 16) = 0xD000000000000010;
  *(void *)(v5 + 24) = 0x800000021F55F120;
  strcpy((char *)(v5 + 32), "id.subregion");
  *(unsigned char *)(v5 + 45) = 0;
  *(_WORD *)(v5 + 46) = -5120;
  strcpy((char *)(v5 + 48), "idtype.proper");
  *(_WORD *)(v5 + 62) = -4864;
  strcpy((char *)(v5 + 64), "idtype.lower");
  *(unsigned char *)(v5 + 77) = 0;
  *(_WORD *)(v5 + 78) = -5120;
  *(void *)(v5 + 80) = 0x6E2E726575737369;
  *(void *)(v5 + 88) = 0xEB00000000656D61;
  *(void *)(v5 + 104) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v5 + 128) = 0x4008000000000000;
  *(void *)(v5 + 136) = 0;
  *(void *)(v5 + 168) = 0;
  *(void *)(v5 + 176) = 0;
  *(void *)(v5 + 160) = 0;
  uint64_t v14 = v5 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  uint64_t v15 = *MEMORY[0x263F36150];
  uint64_t v16 = sub_21F54F7A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_biomeFedStatsUIConfig) = 0;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_featureEnablementConfig) = 0;
  uint64_t v17 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages;
  uint64_t v18 = MEMORY[0x263F8EE78];
  *(void *)((char *)v6 + v17) = sub_21F4713D0(MEMORY[0x263F8EE78]);
  uint64_t v19 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements;
  *(void *)((char *)v6 + v19) = sub_21F4713D0(v18);
  id v20 = (void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
  *id v20 = 0;
  v20[1] = 0;
  uint64_t v21 = (void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
  *uint64_t v21 = 0;
  v21[1] = 0;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_supportedRegions) = v18;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessSessionManager) = 0;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper) = 0;
  uint64_t v22 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup;
  *(void *)((char *)v6 + v22) = dispatch_group_create();
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError) = 0;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = 0;
  *((unsigned char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig) = 2;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager) = 0;
  uint64_t v23 = (char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData;
  uint64_t v24 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  uint64_t v25 = (char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_waitingForWiFiAlertDataThresholdInBytes;
  *(void *)uint64_t v25 = 0;
  v25[8] = 1;
  uint64_t v26 = (char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_lowDataModeAlertDataThresholdInBytes;
  *(void *)uint64_t v26 = 0;
  v26[8] = 1;
  id v27 = (void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL);
  *id v27 = 0;
  v27[1] = 0;
  *((unsigned char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) = 0;
  *((unsigned char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) = 1;
  uint64_t v28 = (void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__passcode);
  *uint64_t v28 = 0;
  v28[1] = 0;
  uint64_t v29 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_analyticsReporter;
  sub_21F54F9B0();
  swift_allocObject();
  *(void *)((char *)v6 + v29) = sub_21F54F9A0();
  uint64_t v30 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData;
  *(void *)((char *)v6 + v30) = sub_21F4714F4(v18);
  uint64_t v31 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__termsAndConditions;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EE06E8);
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = 0;
  *(void *)(v32 + 24) = 0;
  *(_DWORD *)(v32 + 32) = 0;
  *(void *)((char *)v6 + v31) = v32;
  sub_21F54EF20();
  uint64_t v33 = sub_21F550C10();
  os_log_type_t v34 = sub_21F5517A0();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_21F464000, v33, v34, "IdentityProofingFlowManager - init", v35, 2u);
    MEMORY[0x223C4F110](v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v6[18] = a1;
  v6[19] = a3;
  v6[15] = a4;
  *(void *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeConfigHelper) = v37[0];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v6[14] = sub_21F47F7A0();
  swift_weakAssign();
  swift_weakAssign();
  return v6;
}

void sub_21F54820C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_21F550C20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v36 - v11;
  uint64_t v13 = *(void *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
  if (v13)
  {
    id v14 = a3;
    swift_retain();
    swift_retain();
    char v15 = sub_21F4A19B0();
    swift_release();
    if ((v15 & 1) != 0
      || (type metadata accessor for IdentityProofingReviewSubmissionViewController(), swift_dynamicCastClass())
      || *(unsigned char *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) == 1
      && (*(unsigned char *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) & 1) == 0
      && (type metadata accessor for RGBCaptureViewController(), swift_dynamicCastClass()))
    {
      id v40 = v14;
      sub_21F4F721C(a1, v13, v40);
      swift_release();

      uint64_t v16 = v40;
    }
    else
    {
      id v22 = objc_msgSend(v14, sel_navigationController);
      swift_retain();
      sub_21F53447C(v22, 2, 0, 0);

      swift_release();
      sub_21F54EF20();
      id v23 = a1;
      uint64_t v24 = sub_21F550C10();
      os_log_type_t v25 = sub_21F5517A0();
      int v26 = v25;
      if (os_log_type_enabled(v24, v25))
      {
        LODWORD(v40) = v26;
        id v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        uint64_t v42 = v39;
        uint64_t v37 = v27;
        os_log_t v38 = v24;
        *(_DWORD *)id v27 = 136315138;
        v36[1] = v27 + 4;
        id v28 = v23;
        id v29 = objc_msgSend(v28, sel_description);
        uint64_t v30 = sub_21F5515A0();
        unint64_t v32 = v31;

        uint64_t v41 = sub_21F4BAC68(v30, v32, &v42);
        sub_21F551970();

        swift_bridgeObjectRelease();
        os_log_type_t v34 = v37;
        os_log_t v33 = v38;
        _os_log_impl(&dword_21F464000, v38, (os_log_type_t)v40, "Terms and Conditions not in pagination, unable to show liveness video alert on %s", v37, 0xCu);
        uint64_t v35 = v39;
        swift_arrayDestroy();
        MEMORY[0x223C4F110](v35, -1, -1);
        MEMORY[0x223C4F110](v34, -1, -1);
      }
      else
      {
      }
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  else
  {
    id v17 = a3;
    id v18 = objc_msgSend(v17, sel_navigationController);
    swift_retain();
    sub_21F53447C(v18, 2, 0, 0);

    swift_release();
    sub_21F54EF20();
    uint64_t v19 = sub_21F550C10();
    os_log_type_t v20 = sub_21F5517B0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_21F464000, v19, v20, "livenessVideoUploadsManager not instantiated, cannot show upload alert if necessary.", v21, 2u);
      MEMORY[0x223C4F110](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

void sub_21F5486B8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v65 = a1;
  uint64_t v66 = a3;
  uint64_t v10 = sub_21F550540();
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v63 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21F550550();
  uint64_t v64 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21F550C20();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  id v69 = (char *)&v60 - v20;
  uint64_t v21 = (void *)swift_allocObject();
  uint64_t v67 = v21;
  uint64_t v68 = a4;
  v21[2] = a4;
  v21[3] = a5;
  v21[4] = a6;
  if (a2)
  {
    id v22 = a6;
    swift_retain();
    id v23 = a5;
    sub_21F54EF20();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_21F550C10();
    os_log_type_t v25 = sub_21F5517A0();
    if (os_log_type_enabled(v24, v25))
    {
      int v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t aBlock = (void *)v27;
      *(_DWORD *)int v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_21F4BAC68(v65, a2, (uint64_t *)&aBlock);
      sub_21F551970();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F464000, v24, v25, "This is the auth code proofing flow with passcode: %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v27, -1, -1);
      MEMORY[0x223C4F110](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v69, v15);
    uint64_t v28 = v66;
    uint64_t v44 = *(void **)(v66 + 112);
    uint64_t v45 = (void *)sub_21F551560();
    uint64_t v46 = *(void *)(v28 + 136);
    uint64_t v47 = (void *)swift_allocObject();
    v47[2] = v28;
    v47[3] = sub_21F54B97C;
    v47[4] = v67;
    uint64_t v75 = sub_21F54B7EC;
    BOOL v76 = v47;
    uint64_t aBlock = (void *)MEMORY[0x263EF8330];
    uint64_t v72 = 1107296256;
    id v73 = sub_21F53870C;
    BOOL v74 = &block_descriptor_276;
    uint64_t v48 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v44, sel_proofIdentityUsing_proofingOptions_completion_, v45, v46, v48);
    _Block_release(v48);
    swift_release();
  }
  else
  {
    uint64_t v60 = v14;
    uint64_t v65 = v16;
    id v69 = (char *)v15;
    uint64_t v29 = v66;
    id v30 = a6;
    swift_retain();
    swift_retain();
    swift_retain();
    id v31 = a5;
    sub_21F4A1500();
    uint64_t v32 = swift_release();
    MEMORY[0x270FA5388](v32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDFDC8);
    sub_21F551860();
    swift_release();
    swift_bridgeObjectRelease();
    os_log_t v33 = aBlock;
    if (aBlock)
    {
      os_log_type_t v34 = *(void **)(v29 + 112);
      uint64_t v35 = *(void *)(v29 + 136);
      uint64_t v36 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      uint64_t v37 = *(void *)(v29 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v37) {
        goto LABEL_13;
      }
      os_log_t v38 = *(void **)(v37 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      id v39 = v38;
      sub_21F551860();
      swift_release();

      uint64_t v37 = aBlock;
      uint64_t v40 = *(void *)(v29 + v36);
      if (v40)
      {
        uint64_t v41 = *(void **)(v40 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        id v42 = v41;
        sub_21F551860();
        swift_release();

        uint64_t v43 = (uint64_t)aBlock;
      }
      else
      {
LABEL_13:
        uint64_t v43 = 0;
      }
      uint64_t v58 = (void *)swift_allocObject();
      v58[2] = v29;
      v58[3] = sub_21F54B97C;
      v58[4] = v67;
      uint64_t v75 = sub_21F54B7EC;
      BOOL v76 = v58;
      uint64_t aBlock = (void *)MEMORY[0x263EF8330];
      uint64_t v72 = 1107296256;
      id v73 = sub_21F53870C;
      BOOL v74 = &block_descriptor_269;
      uint64_t v59 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v34, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v33, v35, v37, v43, v59);

      _Block_release(v59);
    }
    else
    {
      unint64_t v49 = v31;
      uint64_t v50 = v68;
      sub_21F54EF20();
      os_log_type_t v51 = sub_21F550C10();
      os_log_type_t v52 = sub_21F5517A0();
      if (os_log_type_enabled(v51, v52))
      {
        int v53 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v53 = 0;
        _os_log_impl(&dword_21F464000, v51, v52, "proofIdentity skipped due to missing scanned images", v53, 2u);
        MEMORY[0x223C4F110](v53, -1, -1);
      }

      (*(void (**)(char *, char *))(v65 + 8))(v19, v69);
      (*(void (**)(char *, void, uint64_t))(v61 + 104))(v63, *MEMORY[0x263F364A0], v62);
      sub_21F4BA81C(MEMORY[0x263F8EE78]);
      uint64_t v54 = v60;
      sub_21F550560();
      sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      uint64_t v55 = (void *)swift_allocError();
      uint64_t v56 = v64;
      (*(void (**)(uint64_t, char *, uint64_t))(v64 + 16))(v57, v54, v12);
      sub_21F4F0B90(v55, v50, v49, a6);

      (*(void (**)(char *, uint64_t))(v56 + 8))(v54, v12);
    }
    swift_release();
  }
}

void sub_21F548FB8(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = sub_21F550C20();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v42 - v15;
  uint64_t v17 = *(void *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
  if (!v17)
  {
    uint64_t v22 = v14;
    id v23 = a5;
    swift_retain();
    id v24 = a4;
    sub_21F4F03B8(a3, v24, a5);
    sub_21F54EF20();
    os_log_type_t v25 = sub_21F550C10();
    os_log_type_t v26 = sub_21F5517B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_21F464000, v25, v26, "livenessVideoUploadsManager not instantiated, cannot show upload alert if necessary.", v27, 2u);
      MEMORY[0x223C4F110](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v10);
    goto LABEL_17;
  }
  uint64_t v47 = v14;
  id v48 = a5;
  swift_retain();
  swift_retain();
  swift_retain();
  id v18 = a4;
  char v19 = sub_21F4A19B0();
  swift_release();
  if ((v19 & 1) == 0)
  {
    type metadata accessor for IdentityProofingReviewSubmissionViewController();
    if (!swift_dynamicCastClass())
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) != 1
        || (*(unsigned char *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) & 1) != 0
        || (type metadata accessor for RGBCaptureViewController(), !swift_dynamicCastClass()))
      {
        sub_21F4F03B8(a3, v18, a5);
        sub_21F54EF20();
        id v28 = a1;
        uint64_t v29 = sub_21F550C10();
        os_log_type_t v30 = sub_21F5517A0();
        int v31 = v30;
        if (os_log_type_enabled(v29, v30))
        {
          os_log_t v46 = v29;
          uint64_t v32 = swift_slowAlloc();
          int v44 = v31;
          os_log_t v33 = (uint8_t *)v32;
          uint64_t v45 = swift_slowAlloc();
          uint64_t v50 = v45;
          uint64_t v43 = v33;
          *(_DWORD *)os_log_t v33 = 136315138;
          v42[1] = v33 + 4;
          id v34 = v28;
          id v35 = objc_msgSend(v34, sel_description);
          uint64_t v36 = sub_21F5515A0();
          unint64_t v38 = v37;

          uint64_t v49 = sub_21F4BAC68(v36, v38, &v50);
          sub_21F551970();

          swift_bridgeObjectRelease();
          os_log_t v39 = v46;
          uint64_t v40 = v43;
          _os_log_impl(&dword_21F464000, v46, (os_log_type_t)v44, "Terms and Conditions not in pagination, unable to show liveness video alert on %s", v43, 0xCu);
          uint64_t v41 = v45;
          swift_arrayDestroy();
          MEMORY[0x223C4F110](v41, -1, -1);
          MEMORY[0x223C4F110](v40, -1, -1);
        }
        else
        {
        }
        swift_release();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v10);

LABEL_17:
        swift_release();
        return;
      }
    }
  }
  swift_retain();
  id v20 = v18;
  id v48 = v48;
  sub_21F4F7C60(a1, v17, a3, v20, a5);
  swift_release();
  swift_release_n();

  id v21 = v48;
}

uint64_t sub_21F549458()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EEE8]);
}

uint64_t sub_21F549470(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_21F47F180;
  return sub_21F53E398(a1, v4, v5, v6);
}

void sub_21F549524(void *a1, void *a2)
{
  sub_21F53C940(a1, a2, v2);
}

uint64_t block_copy_helper_26(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_26()
{
  return swift_release();
}

uint64_t sub_21F549544()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EEE8]);
}

uint64_t sub_21F54955C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_21F47F180;
  return sub_21F53B988(a1, v4, v5, v6);
}

uint64_t sub_21F549610()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21F549648(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v62 = a1;
  uint64_t v7 = sub_21F550540();
  uint64_t v60 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550550();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21F550C20();
  uint64_t v63 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v54 - v17;
  if (a2)
  {
    uint64_t v19 = a3;
    swift_retain();
    sub_21F54EF20();
    swift_bridgeObjectRetain_n();
    id v20 = sub_21F550C10();
    os_log_type_t v21 = sub_21F5517A0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v59 = v14;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v61 = a4;
      id v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t aBlock = (void *)v24;
      *(_DWORD *)id v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_21F4BAC68(v62, a2, (uint64_t *)&aBlock);
      sub_21F551970();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F464000, v20, v21, "This is the auth code proofing flow with passcode: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v24, -1, -1);
      os_log_type_t v25 = v23;
      a4 = v61;
      MEMORY[0x223C4F110](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v63 + 8))(v18, v59);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v18, v14);
    }
    os_log_t v39 = *(void **)(v19 + 112);
    uint64_t v40 = (void *)sub_21F551560();
    uint64_t v41 = *(void *)(v19 + 136);
    id v42 = (void *)swift_allocObject();
    void v42[2] = v19;
    v42[3] = sub_21F54B8FC;
    v42[4] = a4;
    id v69 = sub_21F54B7EC;
    uint64_t v70 = v42;
    uint64_t aBlock = (void *)MEMORY[0x263EF8330];
    uint64_t v66 = 1107296256;
    uint64_t v67 = sub_21F53870C;
    uint64_t v68 = &block_descriptor_256;
    uint64_t v43 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v39, sel_proofIdentityUsing_proofingOptions_completion_, v40, v41, v43);
    _Block_release(v43);
    swift_release();
  }
  else
  {
    uint64_t v61 = a4;
    uint64_t v62 = v16;
    uint64_t v54 = v7;
    uint64_t v55 = v9;
    uint64_t v56 = v13;
    uint64_t v57 = v11;
    uint64_t v58 = v10;
    uint64_t v59 = v14;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21F4A1500();
    uint64_t v26 = swift_release();
    MEMORY[0x270FA5388](v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDFDC8);
    sub_21F551860();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v27 = aBlock;
    if (aBlock)
    {
      uint64_t v28 = a3;
      uint64_t v29 = *(void **)(a3 + 112);
      uint64_t v30 = *(void *)(a3 + 136);
      uint64_t v31 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      uint64_t v32 = *(void *)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v32) {
        goto LABEL_13;
      }
      os_log_t v33 = *(void **)(v32 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      id v34 = v33;
      sub_21F551860();
      swift_release();

      uint64_t v32 = aBlock;
      uint64_t v35 = *(void *)(v28 + v31);
      if (v35)
      {
        uint64_t v36 = *(void **)(v35 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        id v37 = v36;
        sub_21F551860();
        swift_release();

        uint64_t v38 = (uint64_t)aBlock;
      }
      else
      {
LABEL_13:
        uint64_t v38 = 0;
      }
      os_log_type_t v52 = (void *)swift_allocObject();
      v52[2] = v28;
      v52[3] = sub_21F54B8FC;
      v52[4] = v61;
      id v69 = sub_21F54B7EC;
      uint64_t v70 = v52;
      uint64_t aBlock = (void *)MEMORY[0x263EF8330];
      uint64_t v66 = 1107296256;
      uint64_t v67 = sub_21F53870C;
      uint64_t v68 = &block_descriptor_249;
      int v53 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v29, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v27, v30, v32, v38, v53);

      _Block_release(v53);
    }
    else
    {
      sub_21F54EF20();
      int v44 = sub_21F550C10();
      os_log_type_t v45 = sub_21F5517A0();
      if (os_log_type_enabled(v44, v45))
      {
        os_log_t v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_t v46 = 0;
        _os_log_impl(&dword_21F464000, v44, v45, "proofIdentity skipped due to missing scanned images", v46, 2u);
        MEMORY[0x223C4F110](v46, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v59);
      (*(void (**)(char *, void, uint64_t))(v60 + 104))(v55, *MEMORY[0x263F364A0], v54);
      sub_21F4BA81C(MEMORY[0x263F8EE78]);
      uint64_t v47 = v56;
      sub_21F550560();
      sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      uint64_t v48 = v58;
      uint64_t v49 = (void *)swift_allocError();
      uint64_t v50 = v57;
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v51, v47, v48);
      sub_21F4FD11C(v49, v61);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v48);
    }
    swift_release();
  }
}

void sub_21F549F00(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v62 = a1;
  uint64_t v7 = sub_21F550540();
  uint64_t v60 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_21F550550();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21F550C20();
  uint64_t v63 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v54 - v17;
  if (a2)
  {
    uint64_t v19 = a3;
    swift_retain();
    sub_21F54EF20();
    swift_bridgeObjectRetain_n();
    id v20 = sub_21F550C10();
    os_log_type_t v21 = sub_21F5517A0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v59 = v14;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v61 = a4;
      id v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t aBlock = (void *)v24;
      *(_DWORD *)id v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_21F4BAC68(v62, a2, (uint64_t *)&aBlock);
      sub_21F551970();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F464000, v20, v21, "This is the auth code proofing flow with passcode: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C4F110](v24, -1, -1);
      os_log_type_t v25 = v23;
      a4 = v61;
      MEMORY[0x223C4F110](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v63 + 8))(v18, v59);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v18, v14);
    }
    os_log_t v39 = *(void **)(v19 + 112);
    uint64_t v40 = (void *)sub_21F551560();
    uint64_t v41 = *(void *)(v19 + 136);
    id v42 = (void *)swift_allocObject();
    void v42[2] = v19;
    v42[3] = sub_21F54B7B0;
    v42[4] = a4;
    id v69 = sub_21F54B7EC;
    uint64_t v70 = v42;
    uint64_t aBlock = (void *)MEMORY[0x263EF8330];
    uint64_t v66 = 1107296256;
    uint64_t v67 = sub_21F53870C;
    uint64_t v68 = &block_descriptor_226;
    uint64_t v43 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v39, sel_proofIdentityUsing_proofingOptions_completion_, v40, v41, v43);
    _Block_release(v43);
    swift_release();
  }
  else
  {
    uint64_t v61 = a4;
    uint64_t v62 = v16;
    uint64_t v54 = v7;
    uint64_t v55 = v9;
    uint64_t v56 = v13;
    uint64_t v57 = v11;
    uint64_t v58 = v10;
    uint64_t v59 = v14;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21F4A1500();
    uint64_t v26 = swift_release();
    MEMORY[0x270FA5388](v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EDFDC8);
    sub_21F551860();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v27 = aBlock;
    if (aBlock)
    {
      uint64_t v28 = a3;
      uint64_t v29 = *(void **)(a3 + 112);
      uint64_t v30 = *(void *)(a3 + 136);
      uint64_t v31 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      uint64_t v32 = *(void *)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v32) {
        goto LABEL_13;
      }
      os_log_t v33 = *(void **)(v32 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      id v34 = v33;
      sub_21F551860();
      swift_release();

      uint64_t v32 = aBlock;
      uint64_t v35 = *(void *)(v28 + v31);
      if (v35)
      {
        uint64_t v36 = *(void **)(v35 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        id v37 = v36;
        sub_21F551860();
        swift_release();

        uint64_t v38 = (uint64_t)aBlock;
      }
      else
      {
LABEL_13:
        uint64_t v38 = 0;
      }
      os_log_type_t v52 = (void *)swift_allocObject();
      v52[2] = v28;
      v52[3] = sub_21F54B7B0;
      v52[4] = v61;
      id v69 = sub_21F54B7EC;
      uint64_t v70 = v52;
      uint64_t aBlock = (void *)MEMORY[0x263EF8330];
      uint64_t v66 = 1107296256;
      uint64_t v67 = sub_21F53870C;
      uint64_t v68 = &block_descriptor_220;
      int v53 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v29, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v27, v30, v32, v38, v53);

      _Block_release(v53);
    }
    else
    {
      sub_21F54EF20();
      int v44 = sub_21F550C10();
      os_log_type_t v45 = sub_21F5517A0();
      if (os_log_type_enabled(v44, v45))
      {
        os_log_t v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_t v46 = 0;
        _os_log_impl(&dword_21F464000, v44, v45, "proofIdentity skipped due to missing scanned images", v46, 2u);
        MEMORY[0x223C4F110](v46, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v59);
      (*(void (**)(char *, void, uint64_t))(v60 + 104))(v55, *MEMORY[0x263F364A0], v54);
      sub_21F4BA81C(MEMORY[0x263F8EE78]);
      uint64_t v47 = v56;
      sub_21F550560();
      sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      uint64_t v48 = v58;
      uint64_t v49 = (void *)swift_allocError();
      uint64_t v50 = v57;
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v51, v47, v48);
      sub_21F506AE0(v49, v61);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v48);
    }
    swift_release();
  }
}

void *sub_21F54A7B8(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_21F551B50();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v6 = (id)MEMORY[0x223C4E570](v5 - 4, a1);
        }
        else {
          id v6 = *(id *)(a1 + 8 * v5);
        }
        uint64_t v7 = v6;
        uint64_t v8 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
          goto LABEL_25;
        }
        uint64_t v9 = sub_21F54FE70();
        uint64_t v11 = v10;
        if (!a2) {
          break;
        }
        uint64_t v12 = v9;
        uint64_t v13 = sub_21F54FE70();
        if (!v11)
        {
          if (!v14) {
            goto LABEL_23;
          }
          goto LABEL_5;
        }
        if (!v14) {
          goto LABEL_5;
        }
        if (v12 == v13 && v11 == v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_23:
          swift_bridgeObjectRelease();
          return v7;
        }
        char v15 = sub_21F551BF0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v15) {
          goto LABEL_23;
        }

LABEL_6:
        ++v5;
        if (v8 == v4) {
          goto LABEL_26;
        }
      }
      if (!v10) {
        goto LABEL_23;
      }
LABEL_5:

      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
LABEL_26:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_21F54A97C(uint64_t a1, void *a2)
{
  return sub_21F53C2AC(a1, a2, v2);
}

uint64_t objectdestroyTm_5()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21F54A9D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_21F47F180;
  return sub_21F538BA8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_21F54AA98(uint64_t a1)
{
  return sub_21F54384C(a1, v1);
}

uint64_t sub_21F54AAA0()
{
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21F54AAF0(uint64_t a1)
{
  return sub_21F54398C(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_21F54AB04()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21F54AB4C()
{
  return sub_21F543F94(*(void *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

uint64_t sub_21F54AB58()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21F54ABA0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_21F47F180;
  return sub_21F54411C(a1, v4, v5, v7, v6);
}

uint64_t sub_21F54AC60()
{
  v1[20] = v0;
  uint64_t v2 = sub_21F550C20();
  v1[21] = v2;
  v1[22] = *(void *)(v2 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F54AD30, 0, 0);
}

uint64_t sub_21F54AD30()
{
  uint64_t v1 = (void *)v0[20];
  sub_21F53FC24();
  uint64_t v2 = (void *)v1[14];
  uint64_t v3 = (void *)v1[20];
  v0[25] = v3;
  uint64_t v4 = v1[17];
  v0[2] = v0;
  v0[3] = sub_21F54AE50;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F534790;
  v0[13] = &block_descriptor_195;
  v0[14] = v5;
  objc_msgSend(v2, sel_proofingCancelledWithConfiguration_proofingOptions_completionHandler_, v3, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F54AE50()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_21F54B078;
  }
  else {
    uint64_t v2 = sub_21F54AF60;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21F54AF60()
{
  sub_21F54EF20();
  uint64_t v1 = sub_21F550C10();
  os_log_type_t v2 = sub_21F5517A0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21F464000, v1, v2, "Proofing Session Cancellation Successful", v3, 2u);
    MEMORY[0x223C4F110](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 168);
  uint64_t v6 = *(void *)(v0 + 176);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v8 = *(void *)(v0 + 208) == 0;
  return v7(v8);
}

uint64_t sub_21F54B078()
{
  id v23 = v0;
  os_log_type_t v2 = (void *)v0[25];
  uint64_t v1 = (void *)v0[26];
  swift_willThrow();

  sub_21F54EF20();
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_21F550C10();
  os_log_type_t v6 = sub_21F5517A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (void *)v0[26];
    uint64_t v19 = v0[22];
    uint64_t v20 = v0[21];
    uint64_t v21 = v0[23];
    BOOL v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v22 = v9;
    *(_DWORD *)BOOL v8 = 136315138;
    swift_getErrorValue();
    uint64_t v10 = sub_21F551C60();
    v0[19] = sub_21F4BAC68(v10, v11, &v22);
    sub_21F551970();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F464000, v5, v6, "Error received while cancelling proofing session %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C4F110](v9, -1, -1);
    MEMORY[0x223C4F110](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v20);
  }
  else
  {
    uint64_t v12 = (void *)v0[26];
    uint64_t v14 = v0[22];
    uint64_t v13 = v0[23];
    uint64_t v15 = v0[21];

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(BOOL))v0[1];
  BOOL v17 = v0[26] == 0;
  return v16(v17);
}

uint64_t sub_21F54B2DC()
{
  return sub_21F5425B4(*(void **)(v0 + 24), 0x800000021F55EED0, "Unable to show the cancellation failure alert as the server doesn't have the related fields in the config");
}

uint64_t sub_21F54B31C()
{
  return sub_21F545C98(v0);
}

uint64_t sub_21F54B33C(uint64_t a1)
{
  return sub_21F544654(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

void sub_21F54B34C()
{
  sub_21F54B358(*(void *)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40));
}

void sub_21F54B358(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = sub_21F550540();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFB210]), sel_init);
  id v11 = objc_msgSend(v10, sel_aida_accountForPrimaryiCloudAccount);
  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v12 = v11;
  os_log_type_t v25 = a2;
  id v13 = objc_msgSend(self, sel_sharedInstance);
  id v14 = objc_msgSend(v13, sel_altDSIDForAccount_, v12);

  if (!v14)
  {

    a2 = v25;
LABEL_5:
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F36460], v6);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550550();
    sub_21F54B9C8((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
    id v23 = (void *)swift_allocError();
    sub_21F550560();
    a2(v23);

    goto LABEL_6;
  }
  sub_21F5515A0();
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29110]), sel_init);
  objc_msgSend(v15, sel_setAltDSID_, v14);

  uint64_t v16 = *MEMORY[0x263F29088];
  objc_msgSend(v15, sel_setSecurityUpgradeContext_, *MEMORY[0x263F29088]);
  id v17 = objc_allocWithZone(MEMORY[0x263F34A18]);
  id v18 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v17, sel_initWithAltDSID_, v18);

  objc_msgSend(v19, sel_setPresentingViewController_, a1);
  objc_msgSend(v19, sel_setDeviceToDeviceEncryptionUpgradeType_, 1);
  objc_msgSend(v19, sel_setDeviceToDeviceEncryptionUpgradeUIStyle_, 3);
  objc_msgSend(v19, sel_setSecurityUpgradeContext_, v16);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F34A20]), sel_initWithContext_, v19);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v25;
  *(void *)(v21 + 24) = a3;
  aBlock[4] = sub_21F54B7A0;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F544D80;
  aBlock[3] = &block_descriptor_213;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_performDeviceToDeviceEncryptionStateRepairWithCompletion_, v22);
  _Block_release(v22);

  id v10 = v20;
LABEL_6:
}

void sub_21F54B7A0(char a1, uint64_t a2)
{
  sub_21F544944(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24));
}

void sub_21F54B7A8()
{
  sub_21F542328(v0);
}

void sub_21F54B7B0(void *a1)
{
  sub_21F506AE0(a1, v1);
}

uint64_t sub_21F54B7B8@<X0>(void *a1@<X8>)
{
  return sub_21F4F653C(v1, a1);
}

uint64_t sub_21F54B7D4()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t sub_21F54B7F0()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_186Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_21F54B84C()
{
  sub_21F541CBC(*(void **)(v0 + 24));
}

uint64_t sub_21F54B874()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F54B8AC()
{
  return sub_21F5458C4();
}

uint64_t sub_21F54B8B4(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

void sub_21F54B8FC(void *a1)
{
  sub_21F4FD11C(a1, v1);
}

uint64_t sub_21F54B904()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t sub_21F54B91C()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t sub_21F54B934()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21F54B97C(void *a1)
{
  sub_21F4F0B90(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_21F54B988()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t sub_21F54B9A0()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t sub_21F54B9B8()
{
  return sub_21F546074();
}

uint64_t sub_21F54B9C0()
{
  return sub_21F5464BC();
}

uint64_t sub_21F54B9C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21F54BA10()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21F54BA48(void *a1)
{
  sub_21F46C5BC(a1, *(void **)(v1 + 16));
}

uint64_t sub_21F54BA50()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

uint64_t sub_21F54BA68()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EED8]);
}

void sub_21F54BA80(uint64_t a1, void *a2)
{
  sub_21F537578(a1, a2, *(void (**)(void))(v2 + 24), *(void (**)(void))(v2 + 32));
}

uint64_t sub_21F54BAAC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21F54BAEC()
{
  sub_21F545A6C(*(unsigned char *)(v0 + 16), *(uint64_t (**)())(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_21F54BAF8()
{
  return sub_21F545E00(v0);
}

uint64_t sub_21F54BB14()
{
  return objectdestroy_128Tm_0(MEMORY[0x263F8EEE8]);
}

uint64_t objectdestroy_128Tm_0(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));
  swift_release();

  return MEMORY[0x270FA0238](v1, 40, 7);
}

uint64_t sub_21F54BB74()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21F47C4D4;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_21F53B6CC, 0, 0);
}

uint64_t sub_21F54BCC0@<X0>(uint64_t *a1@<X8>)
{
  return sub_21F4FA374(a1);
}

uint64_t sub_21F54BCD8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_21F5516F0();
  id v5 = v0;
  uint64_t v6 = sub_21F5516E0();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  v7[2] = v6;
  v7[3] = v8;
  void v7[4] = v5;
  sub_21F47D908((uint64_t)v3, (uint64_t)&unk_267EDEEB0, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_21F54BDF0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_21F49B030(v3, (uint64_t)v10);
  if (!v11) {
    return sub_21F47F030((uint64_t)v10, &qword_267EDEEA0);
  }
  sub_21F494F00((uint64_t)v10, (uint64_t)v7);
  sub_21F47F030((uint64_t)v10, &qword_267EDEEA0);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

uint64_t sub_21F54BEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_21F49B030(v5, (uint64_t)v12);
  if (!v13) {
    return sub_21F47F030((uint64_t)v12, &qword_267EDEEA0);
  }
  sub_21F494F00((uint64_t)v12, (uint64_t)v9);
  sub_21F47F030((uint64_t)v12, &qword_267EDEEA0);
  uint64_t v6 = v10;
  uint64_t v7 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v7 + 8))(v2, a1, a2, 0, v6, v7);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

id sub_21F54BFB4()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v0, sel_cancelBarButtonClicked);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_21F54C03C()
{
  uint64_t v1 = sub_21F54EC30();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_21F551550();
  MEMORY[0x270FA5388](v2 - 8);
  id v3 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel];
  objc_msgSend(v3, sel_setNumberOfLines_, 0);
  id v4 = objc_msgSend(self, sel_labelColor);
  objc_msgSend(v3, sel_setTextColor_, v4);

  objc_msgSend(v3, sel_setAccessibilityTraits_, *MEMORY[0x263F83268]);
  objc_msgSend(v3, sel_setTextAlignment_, 1);
  objc_msgSend(v3, sel_setAdjustsFontForContentSizeCategory_, 1);
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x263F835E0], *MEMORY[0x263F83418]);
  if (!v6)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  objc_msgSend(v6, sel_pointSize);
  id v8 = objc_msgSend(v5, sel_systemFontOfSize_weight_);

  objc_msgSend(v3, sel_setFont_, v8);
  sub_21F551540();
  if (qword_267EDE2E0 != -1) {
    swift_once();
  }
  id v9 = (id)qword_267EE25A0;
  sub_21F54EC20();
  sub_21F5515C0();
  uint64_t v10 = (void *)sub_21F551560();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v10);

  id v11 = objc_msgSend(v0, sel_view);
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = v11;
  objc_msgSend(v11, sel_addSubview_, v3);

  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v13 = objc_msgSend(v3, sel_topAnchor);
  id v14 = objc_msgSend(v0, sel_view);
  if (!v14)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v15 = v14;
  id v16 = objc_msgSend(v14, sel_safeAreaLayoutGuide);

  id v17 = objc_msgSend(v16, sel_topAnchor);
  id v18 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v17, 10.0);

  objc_msgSend(v18, sel_setActive_, 1);
  id v19 = objc_msgSend(v3, sel_leadingAnchor);
  id v20 = objc_msgSend(v0, sel_view);
  if (!v20)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v21 = v20;
  id v22 = objc_msgSend(v20, sel_leadingAnchor);

  id v23 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v22, 20.0);
  objc_msgSend(v23, sel_setActive_, 1);

  id v24 = objc_msgSend(v3, sel_trailingAnchor);
  id v25 = objc_msgSend(v0, sel_view);
  if (v25)
  {
    uint64_t v26 = v25;
    id v27 = objc_msgSend(v25, sel_trailingAnchor);

    id v28 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v27, -20.0);
    objc_msgSend(v28, sel_setActive_, 1);

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_21F54C51C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel];
  objc_msgSend(v1, sel_setNumberOfLines_, 0);
  id v2 = objc_msgSend(self, sel_labelColor);
  objc_msgSend(v1, sel_setTextColor_, v2);

  objc_msgSend(v1, sel_setTextAlignment_, 1);
  objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, 1);
  id v3 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83570]);
  objc_msgSend(v1, sel_setFont_, v3);

  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_addSubview_, v1);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v6 = objc_msgSend(v1, sel_topAnchor);
  id v7 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel], sel_bottomAnchor);
  id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v7, 20.0);

  objc_msgSend(v8, sel_setActive_, 1);
  id v9 = objc_msgSend(v1, sel_leadingAnchor);
  id v10 = objc_msgSend(v0, sel_view);
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v11 = v10;
  id v12 = objc_msgSend(v10, sel_leadingAnchor);

  id v13 = objc_msgSend(v9, sel_constraintEqualToAnchor_constant_, v12, 20.0);
  objc_msgSend(v13, sel_setActive_, 1);

  id v14 = objc_msgSend(v1, sel_trailingAnchor);
  id v15 = objc_msgSend(v0, sel_view);
  if (!v15)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v16 = v15;
  id v17 = objc_msgSend(v15, sel_trailingAnchor);

  id v18 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v17, -20.0);
  objc_msgSend(v18, sel_setActive_, 1);
}

id sub_21F54C824()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton];
  id v2 = self;
  id v3 = objc_msgSend(v2, sel_systemBlueColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v3);

  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v0, sel_performBinding, 64);
  id v4 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v4, sel_setCornerRadius_, 10.0);

  id v5 = objc_msgSend(v2, sel_whiteColor);
  objc_msgSend(v1, sel_setTintColor_, v5);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v6 = objc_msgSend(v1, sel_titleLabel);
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F835D0]);
    objc_msgSend(v7, sel_setFont_, v8);
  }
  id v9 = objc_msgSend(v1, sel_titleLabel);
  if (v9)
  {
    id v10 = v9;
    objc_msgSend(v9, sel_setAdjustsFontSizeToFitWidth_, 1);
  }
  id v11 = objc_msgSend(v1, sel_titleLabel);
  if (v11)
  {
    id v12 = v11;
    objc_msgSend(v11, sel_setAdjustsFontForContentSizeCategory_, 1);
  }
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  id v14 = result;
  objc_msgSend(result, sel_addSubview_, v1);

  id v15 = objc_msgSend(v1, sel_bottomAnchor);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  id v16 = result;
  id v17 = objc_msgSend(result, sel_safeAreaLayoutGuide);

  id v18 = objc_msgSend(v17, sel_bottomAnchor);
  id v19 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v18, -40.0);

  objc_msgSend(v19, sel_setActive_, 1);
  id v20 = objc_msgSend(v1, sel_leadingAnchor);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v21 = result;
  id v22 = objc_msgSend(result, sel_leadingAnchor);

  id v23 = objc_msgSend(v20, sel_constraintEqualToAnchor_constant_, v22, 20.0);
  objc_msgSend(v23, sel_setActive_, 1);

  id v24 = objc_msgSend(v1, sel_trailingAnchor);
  id result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  id v25 = result;
  id v26 = objc_msgSend(result, sel_trailingAnchor);

  id v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v26, -20.0);
  objc_msgSend(v27, sel_setActive_, 1);

  id v28 = objc_msgSend(v1, sel_heightAnchor);
  id v29 = objc_msgSend(v28, sel_constraintEqualToConstant_, 50.0);

  objc_msgSend(v29, sel_setActive_, 1);
  objc_msgSend(v1, sel_setEnabled_, 1);

  return objc_msgSend(v1, sel_setHidden_, 1);
}

uint64_t sub_21F54CCA4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_21F49B030(v1, (uint64_t)&v5);
  if (!v6) {
    return sub_21F47F030((uint64_t)&v5, &qword_267EDEEA0);
  }
  sub_21F47EDC0(&v5, (uint64_t)v7);
  uint64_t v2 = v8;
  uint64_t v3 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 16))(v0, 0, v2, v3);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

void sub_21F54CD90()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  objc_msgSend(v0, sel_setView_, v1);

  sub_21F54C03C();
  sub_21F54C51C();
  sub_21F54C824();
  id v2 = objc_msgSend(v0, sel_navigationItem);
  id v3 = sub_21F54BFB4();
  objc_msgSend(v2, sel_setLeftBarButtonItem_, v3);

  id v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    long long v5 = v4;
    uint64_t v6 = self;
    id v7 = objc_msgSend(v6, sel_systemBackgroundColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v7);

    uint64_t v8 = sub_21F54EF60();
    if (v8 == sub_21F54EF60())
    {
      objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
      uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton];
      id v10 = objc_msgSend(v6, sel_systemGray5Color);
      objc_msgSend(v9, sel_setBackgroundColor_, v10);

      id v11 = sub_21F54BFB4();
      id v12 = objc_msgSend(v6, sel_systemOrangeColor);
      objc_msgSend(v11, sel_setTintColor_, v12);
    }
    id v13 = sub_21F54BFB4();
    objc_msgSend(v13, sel_setEnabled_, 1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21F54CFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a4;
  uint64_t v5 = sub_21F550540();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_21F550550();
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  sub_21F5516F0();
  v4[25] = sub_21F5516E0();
  uint64_t v8 = sub_21F5516B0();
  v4[26] = v8;
  v4[27] = v7;
  return MEMORY[0x270FA2498](sub_21F54D124, v8, v7);
}

uint64_t sub_21F54D124()
{
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  void *v1 = v0;
  v1[1] = sub_21F54D1C0;
  return sub_21F47044C();
}

uint64_t sub_21F54D1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  id v4 = (void *)*v2;
  v4[15] = v2;
  v4[16] = a1;
  v4[17] = a2;
  v4[29] = a2;
  swift_task_dealloc();
  uint64_t v5 = v3[27];
  uint64_t v6 = v3[26];
  return MEMORY[0x270FA2498](sub_21F54D2E8, v6, v5);
}

uint64_t sub_21F54D2E8()
{
  unint64_t v1 = v0[29];
  swift_release();
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = v0[18];
    (*(void (**)(void, void, void))(v0[20] + 104))(v0[21], *MEMORY[0x263F36538], v0[19]);
    sub_21F4BA81C(MEMORY[0x263F8EE78]);
    sub_21F550560();
    uint64_t v3 = v2 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
    swift_beginAccess();
    sub_21F49B030(v3, (uint64_t)(v0 + 2));
    uint64_t v5 = v0[23];
    uint64_t v4 = v0[24];
    uint64_t v6 = v0[22];
    if (v0[5])
    {
      uint64_t v7 = v0[18];
      sub_21F494F00((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
      sub_21F47F030((uint64_t)(v0 + 2), &qword_267EDEEA0);
      uint64_t v8 = v0[10];
      uint64_t v9 = v0[11];
      __swift_project_boxed_opaque_existential_1(v0 + 7, v8);
      sub_21F54E01C((unint64_t *)&qword_267EDE650, MEMORY[0x263F36628]);
      uint64_t v10 = (void *)swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v11, v4, v6);
      (*(void (**)(uint64_t, void, unint64_t, void *, uint64_t, uint64_t))(v9 + 8))(v7, 0, 0xF000000000000000, v10, v8, v9);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 7));
    }
    else
    {
      (*(void (**)(void, void))(v5 + 8))(v0[24], v0[22]);
      sub_21F47F030((uint64_t)(v0 + 2), &qword_267EDEEA0);
    }
  }
  else
  {
    unint64_t v12 = v0[29];
    uint64_t v13 = v0[16];
    id v14 = *(void **)(v0[18] + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context);
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_21F474F90(v14, v13, v12, 0, 0, 0, 0, v15);
    swift_release();
    sub_21F47F01C(v13, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

void sub_21F54D608(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EDE848);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v11 = (void *)MEMORY[0x223C4F1E0](a4 + 16);
  if (!v11) {
    return;
  }
  unint64_t v12 = v11;
  if (a2 >> 60 != 15)
  {
    id v16 = *(void (**)(uint64_t, unint64_t))((*MEMORY[0x263F8EED0] & *v11) + 0x140);
    sub_21F475EF4(a1, a2);
    v16(a1, a2);
    sub_21F47F01C(a1, a2);
    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_7:

    return;
  }
  uint64_t v13 = (void *)sub_21F54EB50();
  v29[0] = v13;
  sub_21F528AF0();
  sub_21F54E01C(&qword_267EE0768, (void (*)(uint64_t))sub_21F528AF0);
  sub_21F551C70();
  uint64_t v14 = sub_21F550540();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) == 1)
  {
    sub_21F47F030((uint64_t)v10, &qword_267EDE848);
  }
  else
  {
    int v17 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v10, v14);
    int v18 = *MEMORY[0x263F36440];
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v14);
    if (v17 == v18)
    {
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v12) + 0x148))(v19);

      return;
    }
  }
  uint64_t v20 = (uint64_t)v12 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_21F49B030(v20, (uint64_t)v29);
  if (v29[3])
  {
    sub_21F494F00((uint64_t)v29, (uint64_t)v26);
    sub_21F47F030((uint64_t)v29, &qword_267EDEEA0);
    uint64_t v21 = v27;
    uint64_t v22 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    id v23 = *(void (**)(void *, void, unint64_t, void *, uint64_t, uint64_t))(v22 + 8);
    id v24 = v12;
    id v25 = v13;
    v23(v12, 0, 0xF000000000000000, v13, v21, v22);

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  }
  else
  {

    sub_21F47F030((uint64_t)v29, &qword_267EDEEA0);
  }
}

uint64_t sub_21F54DAAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = sub_21F5516F0();
  v4[4] = sub_21F5516E0();
  uint64_t v7 = (uint64_t (__cdecl *)())((char *)&dword_267EDE620 + dword_267EDE620);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[5] = v5;
  void *v5 = v4;
  v5[1] = sub_21F54DB68;
  return v7();
}

uint64_t sub_21F54DB68()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_21F5516B0();
  if (v0) {
    uint64_t v4 = sub_21F54DD70;
  }
  else {
    uint64_t v4 = sub_21F54DCC4;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_21F54DCC4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = swift_release();
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x150))(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_21F54DD70()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = (void *)v0[2];
  swift_release();
  uint64_t v3 = *(void (**)(void *))((*MEMORY[0x263F8EED0] & *v2) + 0x138);
  id v4 = v1;
  v3(v1);

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

id sub_21F54DEC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BiometricBindingReplacementViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BiometricBindingReplacementViewController()
{
  return self;
}

uint64_t sub_21F54DFE4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F54E01C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_21F54E064(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel;
  *(void *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton;
  *(void *)&v7[v9] = objc_msgSend(self, sel_buttonWithType_, 1);
  uint64_t v10 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context;
  *(void *)&v7[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10468]), sel_init);
  uint64_t v11 = &v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate];
  *((void *)v11 + 4) = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *(void *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicator] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicatorBarButtonItem] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_target] = a1;
  *(void *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_biometricBindingController] = a2;
  swift_retain();

  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for BiometricBindingReplacementViewController();
  return objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
}

void sub_21F54E1C8()
{
  uint64_t v1 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton;
  *(void *)&v0[v3] = objc_msgSend(self, sel_buttonWithType_, 1);
  uint64_t v4 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context;
  *(void *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10468]), sel_init);
  uint64_t v5 = &v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate];
  *((void *)v5 + 4) = 0;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicator] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicatorBarButtonItem] = 0;

  sub_21F551B40();
  __break(1u);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_21F54E320()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267EE0770 = (uint64_t)result;
  return result;
}

uint64_t sub_21F54E378()
{
  uint64_t v0 = sub_21F550BC0();
  __swift_allocate_value_buffer(v0, qword_267EE2630);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE2630);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t sub_21F54E420()
{
  uint64_t v0 = sub_21F550BE0();
  __swift_allocate_value_buffer(v0, qword_267EE2648);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE2648);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21F54E52C()
{
  uint64_t v0 = sub_21F550BE0();
  __swift_allocate_value_buffer(v0, qword_267EE2660);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE2660);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t sub_21F54E5D4()
{
  uint64_t v0 = sub_21F550BE0();
  __swift_allocate_value_buffer(v0, qword_267EE2678);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE2678);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t sub_21F54E67C()
{
  uint64_t v0 = sub_21F550BE0();
  __swift_allocate_value_buffer(v0, qword_267EE2690);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE2690);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t sub_21F54E724()
{
  uint64_t v0 = sub_21F550BE0();
  __swift_allocate_value_buffer(v0, qword_267EE26A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE26A8);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t sub_21F54E7D4()
{
  uint64_t v0 = sub_21F550BE0();
  __swift_allocate_value_buffer(v0, qword_267EE26C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EE26C0);
  if (qword_267EDE380 != -1) {
    swift_once();
  }
  id v1 = (id)qword_267EE0770;
  return sub_21F550BB0();
}

uint64_t __getPKIdentityHeroViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPKIdentityHeroViewConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getPKIdentityHeroViewConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PassWrapper getPassImageWithSize:](v0);
}

void __getPKPassViewClass_block_invoke_cold_1()
{
}

uint64_t sub_21F54EA60()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21F54EA70()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21F54EA80()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21F54EA90()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_21F54EAA0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21F54EAB0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21F54EAC0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_21F54EAD0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_21F54EAE0()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_21F54EB50()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21F54EB60()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21F54EB70()
{
  return MEMORY[0x270F19598]();
}

uint64_t sub_21F54EB80()
{
  return MEMORY[0x270F195A0]();
}

uint64_t sub_21F54EB90()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_21F54EBA0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21F54EBB0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_21F54EBC0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21F54EBD0()
{
  return MEMORY[0x270F195A8]();
}

uint64_t sub_21F54EBE0()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_21F54EBF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21F54EC00()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21F54EC10()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21F54EC20()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_21F54EC30()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21F54EC40()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_21F54EC50()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_21F54EC60()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_21F54EC70()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_21F54EC80()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_21F54EC90()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_21F54ECA0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_21F54ECB0()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_21F54ECC0()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_21F54ECD0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_21F54ECE0()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_21F54ECF0()
{
  return MEMORY[0x270F195B0]();
}

uint64_t sub_21F54ED00()
{
  return MEMORY[0x270F195F8]();
}

uint64_t sub_21F54ED10()
{
  return MEMORY[0x270F19600]();
}

uint64_t sub_21F54ED20()
{
  return MEMORY[0x270F19608]();
}

uint64_t sub_21F54ED30()
{
  return MEMORY[0x270F19610]();
}

uint64_t sub_21F54ED40()
{
  return MEMORY[0x270F19618]();
}

uint64_t sub_21F54ED50()
{
  return MEMORY[0x270F19620]();
}

uint64_t sub_21F54ED60()
{
  return MEMORY[0x270F19628]();
}

uint64_t sub_21F54ED70()
{
  return MEMORY[0x270F19630]();
}

uint64_t sub_21F54ED80()
{
  return MEMORY[0x270F19638]();
}

uint64_t sub_21F54ED90()
{
  return MEMORY[0x270F19640]();
}

uint64_t sub_21F54EDA0()
{
  return MEMORY[0x270F19648]();
}

uint64_t sub_21F54EDB0()
{
  return MEMORY[0x270F19650]();
}

uint64_t sub_21F54EDC0()
{
  return MEMORY[0x270F19658]();
}

uint64_t sub_21F54EDD0()
{
  return MEMORY[0x270F19660]();
}

uint64_t sub_21F54EDE0()
{
  return MEMORY[0x270F19668]();
}

uint64_t sub_21F54EDF0()
{
  return MEMORY[0x270F19670]();
}

uint64_t sub_21F54EE00()
{
  return MEMORY[0x270F19678]();
}

uint64_t sub_21F54EE10()
{
  return MEMORY[0x270F19680]();
}

uint64_t sub_21F54EE20()
{
  return MEMORY[0x270F19688]();
}

uint64_t sub_21F54EE30()
{
  return MEMORY[0x270F19690]();
}

uint64_t sub_21F54EE40()
{
  return MEMORY[0x270F19698]();
}

uint64_t sub_21F54EE50()
{
  return MEMORY[0x270F196A0]();
}

uint64_t sub_21F54EE60()
{
  return MEMORY[0x270F196A8]();
}

uint64_t sub_21F54EE70()
{
  return MEMORY[0x270F196B0]();
}

uint64_t sub_21F54EE80()
{
  return MEMORY[0x270F196B8]();
}

uint64_t sub_21F54EE90()
{
  return MEMORY[0x270F196C0]();
}

uint64_t sub_21F54EEA0()
{
  return MEMORY[0x270F196C8]();
}

uint64_t sub_21F54EEB0()
{
  return MEMORY[0x270F196D0]();
}

uint64_t sub_21F54EEC0()
{
  return MEMORY[0x270F196D8]();
}

uint64_t sub_21F54EED0()
{
  return MEMORY[0x270F196E0]();
}

uint64_t sub_21F54EEE0()
{
  return MEMORY[0x270F196E8]();
}

uint64_t sub_21F54EEF0()
{
  return MEMORY[0x270F196F0]();
}

uint64_t sub_21F54EF00()
{
  return MEMORY[0x270F196F8]();
}

uint64_t sub_21F54EF10()
{
  return MEMORY[0x270F19700]();
}

uint64_t sub_21F54EF20()
{
  return MEMORY[0x270F19708]();
}

uint64_t sub_21F54EF30()
{
  return MEMORY[0x270F19710]();
}

uint64_t sub_21F54EF40()
{
  return MEMORY[0x270F19718]();
}

uint64_t sub_21F54EF50()
{
  return MEMORY[0x270F19720]();
}

uint64_t sub_21F54EF60()
{
  return MEMORY[0x270F19728]();
}

uint64_t sub_21F54EF70()
{
  return MEMORY[0x270F19730]();
}

uint64_t sub_21F54EF80()
{
  return MEMORY[0x270F19738]();
}

uint64_t sub_21F54EF90()
{
  return MEMORY[0x270F19740]();
}

uint64_t sub_21F54EFA0()
{
  return MEMORY[0x270F19748]();
}

uint64_t sub_21F54EFB0()
{
  return MEMORY[0x270F19750]();
}

uint64_t sub_21F54EFC0()
{
  return MEMORY[0x270F19758]();
}

uint64_t sub_21F54EFD0()
{
  return MEMORY[0x270F19760]();
}

uint64_t sub_21F54EFE0()
{
  return MEMORY[0x270F19768]();
}

uint64_t sub_21F54EFF0()
{
  return MEMORY[0x270F19770]();
}

uint64_t sub_21F54F000()
{
  return MEMORY[0x270F19778]();
}

uint64_t sub_21F54F010()
{
  return MEMORY[0x270F19790]();
}

uint64_t sub_21F54F020()
{
  return MEMORY[0x270F19798]();
}

uint64_t sub_21F54F030()
{
  return MEMORY[0x270F197A0]();
}

uint64_t sub_21F54F040()
{
  return MEMORY[0x270F197A8]();
}

uint64_t sub_21F54F050()
{
  return MEMORY[0x270F197B0]();
}

uint64_t sub_21F54F060()
{
  return MEMORY[0x270F197B8]();
}

uint64_t sub_21F54F070()
{
  return MEMORY[0x270F197C0]();
}

uint64_t sub_21F54F080()
{
  return MEMORY[0x270F197C8]();
}

uint64_t sub_21F54F090()
{
  return MEMORY[0x270F197D0]();
}

uint64_t sub_21F54F0A0()
{
  return MEMORY[0x270F197D8]();
}

uint64_t sub_21F54F0B0()
{
  return MEMORY[0x270F197E0]();
}

uint64_t sub_21F54F0C0()
{
  return MEMORY[0x270F197E8]();
}

uint64_t sub_21F54F0D0()
{
  return MEMORY[0x270F197F0]();
}

uint64_t sub_21F54F0E0()
{
  return MEMORY[0x270F197F8]();
}

uint64_t sub_21F54F0F0()
{
  return MEMORY[0x270F19800]();
}

uint64_t sub_21F54F100()
{
  return MEMORY[0x270F19808]();
}

uint64_t sub_21F54F110()
{
  return MEMORY[0x270F19810]();
}

uint64_t sub_21F54F120()
{
  return MEMORY[0x270F19818]();
}

uint64_t sub_21F54F130()
{
  return MEMORY[0x270F19820]();
}

uint64_t sub_21F54F140()
{
  return MEMORY[0x270F19828]();
}

uint64_t sub_21F54F150()
{
  return MEMORY[0x270F19830]();
}

uint64_t sub_21F54F160()
{
  return MEMORY[0x270F19838]();
}

uint64_t sub_21F54F170()
{
  return MEMORY[0x270F19840]();
}

uint64_t sub_21F54F180()
{
  return MEMORY[0x270F19848]();
}

uint64_t sub_21F54F190()
{
  return MEMORY[0x270F19850]();
}

uint64_t sub_21F54F1A0()
{
  return MEMORY[0x270F19858]();
}

uint64_t sub_21F54F1B0()
{
  return MEMORY[0x270F19860]();
}

uint64_t sub_21F54F1C0()
{
  return MEMORY[0x270F19868]();
}

uint64_t sub_21F54F1D0()
{
  return MEMORY[0x270F19870]();
}

uint64_t sub_21F54F1E0()
{
  return MEMORY[0x270F19878]();
}

uint64_t sub_21F54F1F0()
{
  return MEMORY[0x270F19880]();
}

uint64_t sub_21F54F200()
{
  return MEMORY[0x270F19888]();
}

uint64_t sub_21F54F210()
{
  return MEMORY[0x270F19890]();
}

uint64_t sub_21F54F220()
{
  return MEMORY[0x270F19898]();
}

uint64_t sub_21F54F230()
{
  return MEMORY[0x270F198A0]();
}

uint64_t sub_21F54F240()
{
  return MEMORY[0x270F198A8]();
}

uint64_t sub_21F54F250()
{
  return MEMORY[0x270F198B0]();
}

uint64_t sub_21F54F260()
{
  return MEMORY[0x270F198B8]();
}

uint64_t sub_21F54F270()
{
  return MEMORY[0x270F198C0]();
}

uint64_t sub_21F54F280()
{
  return MEMORY[0x270F198C8]();
}

uint64_t sub_21F54F290()
{
  return MEMORY[0x270F198D0]();
}

uint64_t sub_21F54F2A0()
{
  return MEMORY[0x270F198E8]();
}

uint64_t sub_21F54F2B0()
{
  return MEMORY[0x270F198F0]();
}

uint64_t sub_21F54F2C0()
{
  return MEMORY[0x270F198F8]();
}

uint64_t sub_21F54F2D0()
{
  return MEMORY[0x270F19900]();
}

uint64_t sub_21F54F2E0()
{
  return MEMORY[0x270F19908]();
}

uint64_t sub_21F54F2F0()
{
  return MEMORY[0x270F19910]();
}

uint64_t sub_21F54F300()
{
  return MEMORY[0x270F19918]();
}

uint64_t sub_21F54F310()
{
  return MEMORY[0x270F19920]();
}

uint64_t sub_21F54F320()
{
  return MEMORY[0x270F19928]();
}

uint64_t sub_21F54F330()
{
  return MEMORY[0x270F19930]();
}

uint64_t sub_21F54F340()
{
  return MEMORY[0x270F19938]();
}

uint64_t sub_21F54F350()
{
  return MEMORY[0x270F19940]();
}

uint64_t sub_21F54F360()
{
  return MEMORY[0x270F19948]();
}

uint64_t sub_21F54F370()
{
  return MEMORY[0x270F19950]();
}

uint64_t sub_21F54F380()
{
  return MEMORY[0x270F19958]();
}

uint64_t sub_21F54F390()
{
  return MEMORY[0x270F19960]();
}

uint64_t sub_21F54F3A0()
{
  return MEMORY[0x270F19968]();
}

uint64_t sub_21F54F3B0()
{
  return MEMORY[0x270F19970]();
}

uint64_t sub_21F54F3C0()
{
  return MEMORY[0x270F19978]();
}

uint64_t sub_21F54F3D0()
{
  return MEMORY[0x270F19980]();
}

uint64_t sub_21F54F3E0()
{
  return MEMORY[0x270F19988]();
}

uint64_t sub_21F54F3F0()
{
  return MEMORY[0x270F19990]();
}

uint64_t sub_21F54F400()
{
  return MEMORY[0x270F19998]();
}

uint64_t sub_21F54F410()
{
  return MEMORY[0x270F199A0]();
}

uint64_t sub_21F54F420()
{
  return MEMORY[0x270F199A8]();
}

uint64_t sub_21F54F430()
{
  return MEMORY[0x270F199B0]();
}

uint64_t sub_21F54F440()
{
  return MEMORY[0x270F199B8]();
}

uint64_t sub_21F54F450()
{
  return MEMORY[0x270F199C0]();
}

uint64_t sub_21F54F460()
{
  return MEMORY[0x270F199C8]();
}

uint64_t sub_21F54F470()
{
  return MEMORY[0x270F199D0]();
}

uint64_t sub_21F54F480()
{
  return MEMORY[0x270F199D8]();
}

uint64_t sub_21F54F490()
{
  return MEMORY[0x270F199E0]();
}

uint64_t sub_21F54F4A0()
{
  return MEMORY[0x270F199E8]();
}

uint64_t sub_21F54F4B0()
{
  return MEMORY[0x270F199F0]();
}

uint64_t sub_21F54F4C0()
{
  return MEMORY[0x270F199F8]();
}

uint64_t sub_21F54F4D0()
{
  return MEMORY[0x270F19A00]();
}

uint64_t sub_21F54F4E0()
{
  return MEMORY[0x270F19A08]();
}

uint64_t sub_21F54F4F0()
{
  return MEMORY[0x270F19A10]();
}

uint64_t sub_21F54F500()
{
  return MEMORY[0x270F19A18]();
}

uint64_t sub_21F54F510()
{
  return MEMORY[0x270F19A20]();
}

uint64_t sub_21F54F520()
{
  return MEMORY[0x270F19A28]();
}

uint64_t sub_21F54F530()
{
  return MEMORY[0x270F19A30]();
}

uint64_t sub_21F54F540()
{
  return MEMORY[0x270F19A38]();
}

uint64_t sub_21F54F550()
{
  return MEMORY[0x270F19A40]();
}

uint64_t sub_21F54F560()
{
  return MEMORY[0x270F19A48]();
}

uint64_t sub_21F54F570()
{
  return MEMORY[0x270F19A50]();
}

uint64_t sub_21F54F580()
{
  return MEMORY[0x270F19A58]();
}

uint64_t sub_21F54F590()
{
  return MEMORY[0x270F19A68]();
}

uint64_t sub_21F54F5A0()
{
  return MEMORY[0x270F19A70]();
}

uint64_t sub_21F54F5B0()
{
  return MEMORY[0x270F19A78]();
}

uint64_t sub_21F54F5C0()
{
  return MEMORY[0x270F19A80]();
}

uint64_t sub_21F54F5D0()
{
  return MEMORY[0x270F19A88]();
}

uint64_t sub_21F54F5E0()
{
  return MEMORY[0x270F19A90]();
}

uint64_t sub_21F54F5F0()
{
  return MEMORY[0x270F19A98]();
}

uint64_t sub_21F54F600()
{
  return MEMORY[0x270F19AA0]();
}

uint64_t sub_21F54F610()
{
  return MEMORY[0x270F19AA8]();
}

uint64_t sub_21F54F620()
{
  return MEMORY[0x270F19AB0]();
}

uint64_t sub_21F54F630()
{
  return MEMORY[0x270F19AB8]();
}

uint64_t sub_21F54F640()
{
  return MEMORY[0x270F19AC0]();
}

uint64_t sub_21F54F650()
{
  return MEMORY[0x270F19AC8]();
}

uint64_t sub_21F54F660()
{
  return MEMORY[0x270F19AD0]();
}

uint64_t sub_21F54F670()
{
  return MEMORY[0x270F19AD8]();
}

uint64_t sub_21F54F680()
{
  return MEMORY[0x270F19AE0]();
}

uint64_t sub_21F54F690()
{
  return MEMORY[0x270F19AE8]();
}

uint64_t sub_21F54F6A0()
{
  return MEMORY[0x270F19AF0]();
}

uint64_t sub_21F54F6B0()
{
  return MEMORY[0x270F19AF8]();
}

uint64_t sub_21F54F6C0()
{
  return MEMORY[0x270F19B00]();
}

uint64_t sub_21F54F6D0()
{
  return MEMORY[0x270F19B08]();
}

uint64_t sub_21F54F6E0()
{
  return MEMORY[0x270F19B10]();
}

uint64_t sub_21F54F6F0()
{
  return MEMORY[0x270F19B18]();
}

uint64_t sub_21F54F700()
{
  return MEMORY[0x270F19B20]();
}

uint64_t sub_21F54F710()
{
  return MEMORY[0x270F19B28]();
}

uint64_t sub_21F54F720()
{
  return MEMORY[0x270F19B30]();
}

uint64_t sub_21F54F730()
{
  return MEMORY[0x270F19B38]();
}

uint64_t sub_21F54F740()
{
  return MEMORY[0x270F19B40]();
}

uint64_t sub_21F54F750()
{
  return MEMORY[0x270F19B48]();
}

uint64_t sub_21F54F760()
{
  return MEMORY[0x270F19B50]();
}

uint64_t sub_21F54F770()
{
  return MEMORY[0x270F19B58]();
}

uint64_t sub_21F54F780()
{
  return MEMORY[0x270F19B60]();
}

uint64_t sub_21F54F790()
{
  return MEMORY[0x270F19B68]();
}

uint64_t sub_21F54F7A0()
{
  return MEMORY[0x270F19B70]();
}

uint64_t sub_21F54F7B0()
{
  return MEMORY[0x270F19B78]();
}

uint64_t sub_21F54F7C0()
{
  return MEMORY[0x270F19B80]();
}

uint64_t sub_21F54F7D0()
{
  return MEMORY[0x270F19B88]();
}

uint64_t sub_21F54F7E0()
{
  return MEMORY[0x270F19B90]();
}

uint64_t sub_21F54F7F0()
{
  return MEMORY[0x270F19B98]();
}

uint64_t sub_21F54F800()
{
  return MEMORY[0x270F19BA0]();
}

uint64_t sub_21F54F810()
{
  return MEMORY[0x270F19BB0]();
}

uint64_t sub_21F54F820()
{
  return MEMORY[0x270F19BB8]();
}

uint64_t sub_21F54F830()
{
  return MEMORY[0x270F19C10]();
}

uint64_t sub_21F54F840()
{
  return MEMORY[0x270F19C18]();
}

uint64_t sub_21F54F850()
{
  return MEMORY[0x270F19C20]();
}

uint64_t sub_21F54F860()
{
  return MEMORY[0x270F19C28]();
}

uint64_t sub_21F54F870()
{
  return MEMORY[0x270F19C30]();
}

uint64_t sub_21F54F880()
{
  return MEMORY[0x270F19C38]();
}

uint64_t sub_21F54F890()
{
  return MEMORY[0x270F19C40]();
}

uint64_t sub_21F54F8A0()
{
  return MEMORY[0x270F19C48]();
}

uint64_t sub_21F54F8B0()
{
  return MEMORY[0x270F19C50]();
}

uint64_t sub_21F54F8C0()
{
  return MEMORY[0x270F19C58]();
}

uint64_t sub_21F54F8D0()
{
  return MEMORY[0x270F19C60]();
}

uint64_t sub_21F54F8E0()
{
  return MEMORY[0x270F19C68]();
}

uint64_t sub_21F54F8F0()
{
  return MEMORY[0x270F19C70]();
}

uint64_t sub_21F54F900()
{
  return MEMORY[0x270F19C78]();
}

uint64_t sub_21F54F910()
{
  return MEMORY[0x270F19C80]();
}

uint64_t sub_21F54F920()
{
  return MEMORY[0x270F19C88]();
}

uint64_t sub_21F54F930()
{
  return MEMORY[0x270F19C90]();
}

uint64_t sub_21F54F940()
{
  return MEMORY[0x270F19C98]();
}

uint64_t sub_21F54F950()
{
  return MEMORY[0x270F19CA0]();
}

uint64_t sub_21F54F960()
{
  return MEMORY[0x270F19CA8]();
}

uint64_t sub_21F54F970()
{
  return MEMORY[0x270F19CB0]();
}

uint64_t sub_21F54F980()
{
  return MEMORY[0x270F19CB8]();
}

uint64_t sub_21F54F990()
{
  return MEMORY[0x270F19CC0]();
}

uint64_t sub_21F54F9A0()
{
  return MEMORY[0x270F19CC8]();
}

uint64_t sub_21F54F9B0()
{
  return MEMORY[0x270F19CD0]();
}

uint64_t sub_21F54F9C0()
{
  return MEMORY[0x270F19CD8]();
}

uint64_t sub_21F54F9D0()
{
  return MEMORY[0x270F19CE0]();
}

uint64_t sub_21F54F9E0()
{
  return MEMORY[0x270F19CE8]();
}

uint64_t sub_21F54F9F0()
{
  return MEMORY[0x270F19CF0]();
}

uint64_t sub_21F54FA00()
{
  return MEMORY[0x270F19CF8]();
}

uint64_t sub_21F54FA10()
{
  return MEMORY[0x270F19D00]();
}

uint64_t sub_21F54FA20()
{
  return MEMORY[0x270F19D08]();
}

uint64_t sub_21F54FA30()
{
  return MEMORY[0x270F19D10]();
}

uint64_t sub_21F54FA40()
{
  return MEMORY[0x270F19D18]();
}

uint64_t sub_21F54FA50()
{
  return MEMORY[0x270F19D20]();
}

uint64_t sub_21F54FA60()
{
  return MEMORY[0x270F19D28]();
}

uint64_t sub_21F54FA70()
{
  return MEMORY[0x270F19D38]();
}

uint64_t sub_21F54FA80()
{
  return MEMORY[0x270F19D40]();
}

uint64_t sub_21F54FA90()
{
  return MEMORY[0x270F19D50]();
}

uint64_t sub_21F54FAA0()
{
  return MEMORY[0x270F19D60]();
}

uint64_t sub_21F54FAB0()
{
  return MEMORY[0x270F19D78]();
}

uint64_t sub_21F54FAC0()
{
  return MEMORY[0x270F19D90]();
}

uint64_t sub_21F54FAD0()
{
  return MEMORY[0x270F19D98]();
}

uint64_t sub_21F54FAE0()
{
  return MEMORY[0x270F19DA0]();
}

uint64_t sub_21F54FAF0()
{
  return MEMORY[0x270F19DA8]();
}

uint64_t sub_21F54FB00()
{
  return MEMORY[0x270F19DB0]();
}

uint64_t sub_21F54FB10()
{
  return MEMORY[0x270F19DB8]();
}

uint64_t sub_21F54FB20()
{
  return MEMORY[0x270F19DC0]();
}

uint64_t sub_21F54FB30()
{
  return MEMORY[0x270F19DC8]();
}

uint64_t sub_21F54FB40()
{
  return MEMORY[0x270F19DD0]();
}

uint64_t sub_21F54FB50()
{
  return MEMORY[0x270F19DD8]();
}

uint64_t sub_21F54FB60()
{
  return MEMORY[0x270F19DE0]();
}

uint64_t sub_21F54FB70()
{
  return MEMORY[0x270F19DE8]();
}

uint64_t sub_21F54FB80()
{
  return MEMORY[0x270F19DF0]();
}

uint64_t sub_21F54FB90()
{
  return MEMORY[0x270F19DF8]();
}

uint64_t sub_21F54FBA0()
{
  return MEMORY[0x270F19E00]();
}

uint64_t sub_21F54FBB0()
{
  return MEMORY[0x270F19E08]();
}

uint64_t sub_21F54FBC0()
{
  return MEMORY[0x270F19E10]();
}

uint64_t sub_21F54FBD0()
{
  return MEMORY[0x270F19E18]();
}

uint64_t sub_21F54FBE0()
{
  return MEMORY[0x270F19E20]();
}

uint64_t sub_21F54FBF0()
{
  return MEMORY[0x270F19E28]();
}

uint64_t sub_21F54FC00()
{
  return MEMORY[0x270F19E30]();
}

uint64_t sub_21F54FC10()
{
  return MEMORY[0x270F19E38]();
}

uint64_t sub_21F54FC20()
{
  return MEMORY[0x270F19E40]();
}

uint64_t sub_21F54FC30()
{
  return MEMORY[0x270F19E48]();
}

uint64_t sub_21F54FC40()
{
  return MEMORY[0x270F19E50]();
}

uint64_t sub_21F54FC50()
{
  return MEMORY[0x270F19E58]();
}

uint64_t sub_21F54FC60()
{
  return MEMORY[0x270F19E60]();
}

uint64_t sub_21F54FC70()
{
  return MEMORY[0x270F19E68]();
}

uint64_t sub_21F54FC80()
{
  return MEMORY[0x270F19E70]();
}

uint64_t sub_21F54FC90()
{
  return MEMORY[0x270F19E78]();
}

uint64_t sub_21F54FCA0()
{
  return MEMORY[0x270F19E80]();
}

uint64_t sub_21F54FCB0()
{
  return MEMORY[0x270F19E88]();
}

uint64_t sub_21F54FCC0()
{
  return MEMORY[0x270F19E90]();
}

uint64_t sub_21F54FCD0()
{
  return MEMORY[0x270F19E98]();
}

uint64_t sub_21F54FCE0()
{
  return MEMORY[0x270F19EA0]();
}

uint64_t sub_21F54FCF0()
{
  return MEMORY[0x270F19EA8]();
}

uint64_t sub_21F54FD00()
{
  return MEMORY[0x270F19EB0]();
}

uint64_t sub_21F54FD10()
{
  return MEMORY[0x270F19EB8]();
}

uint64_t sub_21F54FD20()
{
  return MEMORY[0x270F19EC0]();
}

uint64_t sub_21F54FD30()
{
  return MEMORY[0x270F19EC8]();
}

uint64_t sub_21F54FD40()
{
  return MEMORY[0x270F19ED0]();
}

uint64_t sub_21F54FD50()
{
  return MEMORY[0x270F19ED8]();
}

uint64_t sub_21F54FD60()
{
  return MEMORY[0x270F19EE0]();
}

uint64_t sub_21F54FD70()
{
  return MEMORY[0x270F19EE8]();
}

uint64_t sub_21F54FD80()
{
  return MEMORY[0x270F19EF0]();
}

uint64_t sub_21F54FD90()
{
  return MEMORY[0x270F19EF8]();
}

uint64_t sub_21F54FDA0()
{
  return MEMORY[0x270F19F00]();
}

uint64_t sub_21F54FDB0()
{
  return MEMORY[0x270F19F08]();
}

uint64_t sub_21F54FDC0()
{
  return MEMORY[0x270F19F10]();
}

uint64_t sub_21F54FDD0()
{
  return MEMORY[0x270F19F18]();
}

uint64_t sub_21F54FDE0()
{
  return MEMORY[0x270F19F20]();
}

uint64_t sub_21F54FDF0()
{
  return MEMORY[0x270F19F28]();
}

uint64_t sub_21F54FE00()
{
  return MEMORY[0x270F19F30]();
}

uint64_t sub_21F54FE10()
{
  return MEMORY[0x270F19F38]();
}

uint64_t sub_21F54FE20()
{
  return MEMORY[0x270F19F40]();
}

uint64_t sub_21F54FE30()
{
  return MEMORY[0x270F19F48]();
}

uint64_t sub_21F54FE40()
{
  return MEMORY[0x270F19F50]();
}

uint64_t sub_21F54FE50()
{
  return MEMORY[0x270F19F58]();
}

uint64_t sub_21F54FE60()
{
  return MEMORY[0x270F19F60]();
}

uint64_t sub_21F54FE70()
{
  return MEMORY[0x270F19F68]();
}

uint64_t sub_21F54FE80()
{
  return MEMORY[0x270F19F70]();
}

uint64_t sub_21F54FE90()
{
  return MEMORY[0x270F19F78]();
}

uint64_t sub_21F54FEA0()
{
  return MEMORY[0x270F19FB8]();
}

uint64_t sub_21F54FEB0()
{
  return MEMORY[0x270F19FC0]();
}

uint64_t sub_21F54FEC0()
{
  return MEMORY[0x270F19FC8]();
}

uint64_t sub_21F54FED0()
{
  return MEMORY[0x270F19FD0]();
}

uint64_t sub_21F54FEE0()
{
  return MEMORY[0x270F19FD8]();
}

uint64_t sub_21F54FEF0()
{
  return MEMORY[0x270F19FE0]();
}

uint64_t sub_21F54FF00()
{
  return MEMORY[0x270F19FE8]();
}

uint64_t sub_21F54FF10()
{
  return MEMORY[0x270F19FF0]();
}

uint64_t sub_21F54FF20()
{
  return MEMORY[0x270F19FF8]();
}

uint64_t sub_21F54FF30()
{
  return MEMORY[0x270F1A000]();
}

uint64_t sub_21F54FF40()
{
  return MEMORY[0x270F1A008]();
}

uint64_t sub_21F54FF50()
{
  return MEMORY[0x270F1A010]();
}

uint64_t sub_21F54FF60()
{
  return MEMORY[0x270F1A018]();
}

uint64_t sub_21F54FF70()
{
  return MEMORY[0x270F1A020]();
}

uint64_t sub_21F54FF80()
{
  return MEMORY[0x270F1A028]();
}

uint64_t sub_21F54FF90()
{
  return MEMORY[0x270F1A030]();
}

uint64_t sub_21F54FFA0()
{
  return MEMORY[0x270F1A038]();
}

uint64_t sub_21F54FFB0()
{
  return MEMORY[0x270F1A040]();
}

uint64_t sub_21F54FFC0()
{
  return MEMORY[0x270F1A048]();
}

uint64_t sub_21F54FFD0()
{
  return MEMORY[0x270F1A050]();
}

uint64_t sub_21F54FFE0()
{
  return MEMORY[0x270F1A058]();
}

uint64_t sub_21F54FFF0()
{
  return MEMORY[0x270F1A060]();
}

uint64_t sub_21F550000()
{
  return MEMORY[0x270F1A068]();
}

uint64_t sub_21F550010()
{
  return MEMORY[0x270F1A070]();
}

uint64_t sub_21F550020()
{
  return MEMORY[0x270F1A078]();
}

uint64_t sub_21F550030()
{
  return MEMORY[0x270F1A080]();
}

uint64_t sub_21F550040()
{
  return MEMORY[0x270F1A088]();
}

uint64_t sub_21F550050()
{
  return MEMORY[0x270F1A090]();
}

uint64_t sub_21F550060()
{
  return MEMORY[0x270F1A098]();
}

uint64_t sub_21F550070()
{
  return MEMORY[0x270F1A0A0]();
}

uint64_t sub_21F550080()
{
  return MEMORY[0x270F1A0A8]();
}

uint64_t sub_21F550090()
{
  return MEMORY[0x270F1A0B0]();
}

uint64_t sub_21F5500A0()
{
  return MEMORY[0x270F1A0B8]();
}

uint64_t sub_21F5500B0()
{
  return MEMORY[0x270F1A0C0]();
}

uint64_t sub_21F5500C0()
{
  return MEMORY[0x270F1A0C8]();
}

uint64_t sub_21F5500D0()
{
  return MEMORY[0x270F1A0D0]();
}

uint64_t sub_21F5500E0()
{
  return MEMORY[0x270F1A0D8]();
}

uint64_t sub_21F5500F0()
{
  return MEMORY[0x270F1A0E0]();
}

uint64_t sub_21F550100()
{
  return MEMORY[0x270F1A0E8]();
}

uint64_t sub_21F550110()
{
  return MEMORY[0x270F1A0F0]();
}

uint64_t sub_21F550120()
{
  return MEMORY[0x270F1A0F8]();
}

uint64_t sub_21F550130()
{
  return MEMORY[0x270F1A100]();
}

uint64_t sub_21F550140()
{
  return MEMORY[0x270F1A108]();
}

uint64_t sub_21F550150()
{
  return MEMORY[0x270F1A110]();
}

uint64_t sub_21F550160()
{
  return MEMORY[0x270F1A118]();
}

uint64_t sub_21F550170()
{
  return MEMORY[0x270F1A120]();
}

uint64_t sub_21F550180()
{
  return MEMORY[0x270F1A128]();
}

uint64_t sub_21F550190()
{
  return MEMORY[0x270F1A130]();
}

uint64_t sub_21F5501A0()
{
  return MEMORY[0x270F1A138]();
}

uint64_t sub_21F5501B0()
{
  return MEMORY[0x270F1A140]();
}

uint64_t sub_21F5501C0()
{
  return MEMORY[0x270F1A148]();
}

uint64_t sub_21F5501D0()
{
  return MEMORY[0x270F1A150]();
}

uint64_t sub_21F5501E0()
{
  return MEMORY[0x270F1A158]();
}

uint64_t sub_21F5501F0()
{
  return MEMORY[0x270F1A160]();
}

uint64_t sub_21F550200()
{
  return MEMORY[0x270F1A168]();
}

uint64_t sub_21F550210()
{
  return MEMORY[0x270F1A170]();
}

uint64_t sub_21F550220()
{
  return MEMORY[0x270F1A178]();
}

uint64_t sub_21F550230()
{
  return MEMORY[0x270F1A180]();
}

uint64_t sub_21F550240()
{
  return MEMORY[0x270F1A188]();
}

uint64_t sub_21F550250()
{
  return MEMORY[0x270F1A190]();
}

uint64_t sub_21F550260()
{
  return MEMORY[0x270F1A198]();
}

uint64_t sub_21F550270()
{
  return MEMORY[0x270F1A1A0]();
}

uint64_t sub_21F550280()
{
  return MEMORY[0x270F1A1A8]();
}

uint64_t sub_21F550290()
{
  return MEMORY[0x270F1A1B0]();
}

uint64_t sub_21F5502A0()
{
  return MEMORY[0x270F1A1B8]();
}

uint64_t sub_21F5502B0()
{
  return MEMORY[0x270F1A1C0]();
}

uint64_t sub_21F5502C0()
{
  return MEMORY[0x270F1A1D8]();
}

uint64_t sub_21F5502D0()
{
  return MEMORY[0x270F1A1E0]();
}

uint64_t sub_21F5502E0()
{
  return MEMORY[0x270F1A208]();
}

uint64_t sub_21F5502F0()
{
  return MEMORY[0x270F1A210]();
}

uint64_t sub_21F550300()
{
  return MEMORY[0x270F1A218]();
}

uint64_t sub_21F550310()
{
  return MEMORY[0x270F1A220]();
}

uint64_t sub_21F550320()
{
  return MEMORY[0x270F1A228]();
}

uint64_t sub_21F550330()
{
  return MEMORY[0x270F1A230]();
}

uint64_t sub_21F550340()
{
  return MEMORY[0x270F1A238]();
}

uint64_t sub_21F550350()
{
  return MEMORY[0x270F1A250]();
}

uint64_t sub_21F550360()
{
  return MEMORY[0x270F1A258]();
}

uint64_t sub_21F550370()
{
  return MEMORY[0x270F1A260]();
}

uint64_t sub_21F550380()
{
  return MEMORY[0x270F1A268]();
}

uint64_t sub_21F550390()
{
  return MEMORY[0x270F1A270]();
}

uint64_t sub_21F5503A0()
{
  return MEMORY[0x270F1A278]();
}

uint64_t sub_21F5503B0()
{
  return MEMORY[0x270F1A280]();
}

uint64_t sub_21F5503C0()
{
  return MEMORY[0x270F1A288]();
}

uint64_t sub_21F5503D0()
{
  return MEMORY[0x270F1A290]();
}

uint64_t sub_21F5503E0()
{
  return MEMORY[0x270F1A298]();
}

uint64_t sub_21F5503F0()
{
  return MEMORY[0x270F1A2A0]();
}

uint64_t sub_21F550400()
{
  return MEMORY[0x270F1A2A8]();
}

uint64_t sub_21F550410()
{
  return MEMORY[0x270F1A2B0]();
}

uint64_t sub_21F550420()
{
  return MEMORY[0x270F1A2B8]();
}

uint64_t sub_21F550430()
{
  return MEMORY[0x270F1A2C0]();
}

uint64_t sub_21F550440()
{
  return MEMORY[0x270F1A2C8]();
}

uint64_t sub_21F550450()
{
  return MEMORY[0x270F1A2D0]();
}

uint64_t sub_21F550460()
{
  return MEMORY[0x270F1A2D8]();
}

uint64_t sub_21F550470()
{
  return MEMORY[0x270F1A2E0]();
}

uint64_t sub_21F550480()
{
  return MEMORY[0x270F1A2E8]();
}

uint64_t sub_21F550490()
{
  return MEMORY[0x270F1A2F0]();
}

uint64_t sub_21F5504A0()
{
  return MEMORY[0x270F1A2F8]();
}

uint64_t sub_21F5504B0()
{
  return MEMORY[0x270F1A300]();
}

uint64_t sub_21F5504C0()
{
  return MEMORY[0x270F1A308]();
}

uint64_t sub_21F5504D0()
{
  return MEMORY[0x270F1A310]();
}

uint64_t sub_21F5504E0()
{
  return MEMORY[0x270F1A318]();
}

uint64_t sub_21F5504F0()
{
  return MEMORY[0x270F1A320]();
}

uint64_t sub_21F550500()
{
  return MEMORY[0x270F1A328]();
}

uint64_t sub_21F550510()
{
  return MEMORY[0x270F1A330]();
}

uint64_t sub_21F550520()
{
  return MEMORY[0x270F1A338]();
}

uint64_t sub_21F550530()
{
  return MEMORY[0x270F1A340]();
}

uint64_t sub_21F550540()
{
  return MEMORY[0x270F1A350]();
}

uint64_t sub_21F550550()
{
  return MEMORY[0x270F1A358]();
}

uint64_t sub_21F550560()
{
  return MEMORY[0x270F1A360]();
}

uint64_t sub_21F550570()
{
  return MEMORY[0x270F52070]();
}

uint64_t sub_21F550580()
{
  return MEMORY[0x270F52078]();
}

uint64_t sub_21F550590()
{
  return MEMORY[0x270F19280]();
}

uint64_t sub_21F5505A0()
{
  return MEMORY[0x270F19288]();
}

uint64_t sub_21F5505B0()
{
  return MEMORY[0x270F19290]();
}

uint64_t sub_21F5505C0()
{
  return MEMORY[0x270F19298]();
}

uint64_t sub_21F5505D0()
{
  return MEMORY[0x270F192A0]();
}

uint64_t sub_21F5505E0()
{
  return MEMORY[0x270F192A8]();
}

uint64_t sub_21F5505F0()
{
  return MEMORY[0x270F192B0]();
}

uint64_t sub_21F550600()
{
  return MEMORY[0x270F192B8]();
}

uint64_t sub_21F550610()
{
  return MEMORY[0x270F192C0]();
}

uint64_t sub_21F550620()
{
  return MEMORY[0x270F192C8]();
}

uint64_t sub_21F550630()
{
  return MEMORY[0x270F192D0]();
}

uint64_t sub_21F550640()
{
  return MEMORY[0x270F192D8]();
}

uint64_t sub_21F550650()
{
  return MEMORY[0x270F192E0]();
}

uint64_t sub_21F550660()
{
  return MEMORY[0x270F192E8]();
}

uint64_t sub_21F550670()
{
  return MEMORY[0x270F192F0]();
}

uint64_t sub_21F550680()
{
  return MEMORY[0x270F192F8]();
}

uint64_t sub_21F550690()
{
  return MEMORY[0x270F19300]();
}

uint64_t sub_21F5506A0()
{
  return MEMORY[0x270F19308]();
}

uint64_t sub_21F5506B0()
{
  return MEMORY[0x270F19310]();
}

uint64_t sub_21F5506C0()
{
  return MEMORY[0x270F19318]();
}

uint64_t sub_21F5506D0()
{
  return MEMORY[0x270F19320]();
}

uint64_t sub_21F5506E0()
{
  return MEMORY[0x270F19328]();
}

uint64_t sub_21F5506F0()
{
  return MEMORY[0x270F19330]();
}

uint64_t sub_21F550700()
{
  return MEMORY[0x270F19338]();
}

uint64_t sub_21F550710()
{
  return MEMORY[0x270F19340]();
}

uint64_t sub_21F550720()
{
  return MEMORY[0x270F19348]();
}

uint64_t sub_21F550730()
{
  return MEMORY[0x270F19350]();
}

uint64_t sub_21F550740()
{
  return MEMORY[0x270F19358]();
}

uint64_t sub_21F550750()
{
  return MEMORY[0x270F19360]();
}

uint64_t sub_21F550760()
{
  return MEMORY[0x270F19368]();
}

uint64_t sub_21F550780()
{
  return MEMORY[0x270F19378]();
}

uint64_t sub_21F550790()
{
  return MEMORY[0x270F19380]();
}

uint64_t sub_21F5507A0()
{
  return MEMORY[0x270F19388]();
}

uint64_t sub_21F5507B0()
{
  return MEMORY[0x270F19390]();
}

uint64_t sub_21F5507C0()
{
  return MEMORY[0x270F19398]();
}

uint64_t sub_21F5507D0()
{
  return MEMORY[0x270F193A0]();
}

uint64_t sub_21F5507E0()
{
  return MEMORY[0x270F193A8]();
}

uint64_t sub_21F5507F0()
{
  return MEMORY[0x270F193B0]();
}

uint64_t sub_21F550800()
{
  return MEMORY[0x270F193B8]();
}

uint64_t sub_21F550810()
{
  return MEMORY[0x270F193C0]();
}

uint64_t sub_21F550820()
{
  return MEMORY[0x270F193C8]();
}

uint64_t sub_21F550830()
{
  return MEMORY[0x270F193D0]();
}

uint64_t sub_21F550840()
{
  return MEMORY[0x270F193D8]();
}

uint64_t sub_21F550850()
{
  return MEMORY[0x270F193E0]();
}

uint64_t sub_21F550860()
{
  return MEMORY[0x270F193E8]();
}

uint64_t sub_21F550870()
{
  return MEMORY[0x270F193F0]();
}

uint64_t sub_21F550880()
{
  return MEMORY[0x270F193F8]();
}

uint64_t sub_21F550890()
{
  return MEMORY[0x270F19400]();
}

uint64_t sub_21F5508A0()
{
  return MEMORY[0x270F19408]();
}

uint64_t sub_21F5508B0()
{
  return MEMORY[0x270F19410]();
}

uint64_t sub_21F5508C0()
{
  return MEMORY[0x270F19418]();
}

uint64_t sub_21F5508D0()
{
  return MEMORY[0x270F19420]();
}

uint64_t sub_21F5508E0()
{
  return MEMORY[0x270F19428]();
}

uint64_t sub_21F5508F0()
{
  return MEMORY[0x270F19430]();
}

uint64_t sub_21F550900()
{
  return MEMORY[0x270F19438]();
}

uint64_t sub_21F550910()
{
  return MEMORY[0x270F19440]();
}

uint64_t sub_21F550920()
{
  return MEMORY[0x270F19448]();
}

uint64_t sub_21F550930()
{
  return MEMORY[0x270F19450]();
}

uint64_t sub_21F550940()
{
  return MEMORY[0x270F19458]();
}

uint64_t sub_21F550950()
{
  return MEMORY[0x270F19460]();
}

uint64_t sub_21F550960()
{
  return MEMORY[0x270F19468]();
}

uint64_t sub_21F550970()
{
  return MEMORY[0x270F19470]();
}

uint64_t sub_21F550980()
{
  return MEMORY[0x270F19478]();
}

uint64_t sub_21F550990()
{
  return MEMORY[0x270F19480]();
}

uint64_t sub_21F5509A0()
{
  return MEMORY[0x270F19488]();
}

uint64_t sub_21F5509B0()
{
  return MEMORY[0x270F19490]();
}

uint64_t sub_21F5509C0()
{
  return MEMORY[0x270F19498]();
}

uint64_t sub_21F5509D0()
{
  return MEMORY[0x270F194A0]();
}

uint64_t sub_21F5509E0()
{
  return MEMORY[0x270F194A8]();
}

uint64_t sub_21F5509F0()
{
  return MEMORY[0x270F194B0]();
}

uint64_t sub_21F550A00()
{
  return MEMORY[0x270F194B8]();
}

uint64_t sub_21F550A10()
{
  return MEMORY[0x270F194C0]();
}

uint64_t sub_21F550A20()
{
  return MEMORY[0x270F194C8]();
}

uint64_t sub_21F550A30()
{
  return MEMORY[0x270F194D0]();
}

uint64_t sub_21F550A40()
{
  return MEMORY[0x270F194D8]();
}

uint64_t sub_21F550A50()
{
  return MEMORY[0x270F194E0]();
}

uint64_t sub_21F550A60()
{
  return MEMORY[0x270F194E8]();
}

uint64_t sub_21F550A70()
{
  return MEMORY[0x270F194F0]();
}

uint64_t sub_21F550A80()
{
  return MEMORY[0x270F194F8]();
}

uint64_t sub_21F550A90()
{
  return MEMORY[0x270F19500]();
}

uint64_t sub_21F550AA0()
{
  return MEMORY[0x270F19508]();
}

uint64_t sub_21F550AB0()
{
  return MEMORY[0x270F19510]();
}

uint64_t sub_21F550AC0()
{
  return MEMORY[0x270F19518]();
}

uint64_t sub_21F550AD0()
{
  return MEMORY[0x270F19520]();
}

uint64_t sub_21F550AE0()
{
  return MEMORY[0x270F19528]();
}

uint64_t sub_21F550AF0()
{
  return MEMORY[0x270F19530]();
}

uint64_t sub_21F550B00()
{
  return MEMORY[0x270F19538]();
}

uint64_t sub_21F550B10()
{
  return MEMORY[0x270F19540]();
}

uint64_t sub_21F550B20()
{
  return MEMORY[0x270F19548]();
}

uint64_t sub_21F550B30()
{
  return MEMORY[0x270F19550]();
}

uint64_t sub_21F550B40()
{
  return MEMORY[0x270F19558]();
}

uint64_t sub_21F550B50()
{
  return MEMORY[0x270F19560]();
}

uint64_t sub_21F550B60()
{
  return MEMORY[0x270F19568]();
}

uint64_t sub_21F550B70()
{
  return MEMORY[0x270F19570]();
}

uint64_t sub_21F550B80()
{
  return MEMORY[0x270F19578]();
}

uint64_t sub_21F550B90()
{
  return MEMORY[0x270F19580]();
}

uint64_t sub_21F550BA0()
{
  return MEMORY[0x270F19588]();
}

uint64_t sub_21F550BB0()
{
  return MEMORY[0x270EEB1B0]();
}

uint64_t sub_21F550BC0()
{
  return MEMORY[0x270EEB1C0]();
}

uint64_t sub_21F550BD0()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_21F550BE0()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_21F550BF0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_21F550C00()
{
  return MEMORY[0x270F1A370]();
}

uint64_t sub_21F550C10()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21F550C20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21F550C30()
{
  return MEMORY[0x270F81D20]();
}

uint64_t sub_21F550C40()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_21F550C50()
{
  return MEMORY[0x270F18DF8]();
}

uint64_t sub_21F550C60()
{
  return MEMORY[0x270F18F08]();
}

uint64_t sub_21F550C70()
{
  return MEMORY[0x270F18F10]();
}

uint64_t sub_21F550C80()
{
  return MEMORY[0x270F18F18]();
}

uint64_t sub_21F550C90()
{
  return MEMORY[0x270F19108]();
}

uint64_t sub_21F550CA0()
{
  return MEMORY[0x270F19110]();
}

uint64_t sub_21F550CB0()
{
  return MEMORY[0x270F19118]();
}

uint64_t sub_21F550CC0()
{
  return MEMORY[0x270F19120]();
}

uint64_t sub_21F550CD0()
{
  return MEMORY[0x270F19128]();
}

uint64_t sub_21F550CE0()
{
  return MEMORY[0x270F19130]();
}

uint64_t sub_21F550CF0()
{
  return MEMORY[0x270F19138]();
}

uint64_t sub_21F550D00()
{
  return MEMORY[0x270F19150]();
}

uint64_t sub_21F550D10()
{
  return MEMORY[0x270F19158]();
}

uint64_t sub_21F550D20()
{
  return MEMORY[0x270F19160]();
}

uint64_t sub_21F550D30()
{
  return MEMORY[0x270F19168]();
}

uint64_t sub_21F550D40()
{
  return MEMORY[0x270F19170]();
}

uint64_t sub_21F550D50()
{
  return MEMORY[0x270F19178]();
}

uint64_t sub_21F550D60()
{
  return MEMORY[0x270F19180]();
}

uint64_t sub_21F550D70()
{
  return MEMORY[0x270F19188]();
}

uint64_t sub_21F550D80()
{
  return MEMORY[0x270F19190]();
}

uint64_t sub_21F550D90()
{
  return MEMORY[0x270F19198]();
}

uint64_t sub_21F550DA0()
{
  return MEMORY[0x270F191A0]();
}

uint64_t sub_21F550DB0()
{
  return MEMORY[0x270F191A8]();
}

uint64_t sub_21F550DC0()
{
  return MEMORY[0x270F191B0]();
}

uint64_t sub_21F550DD0()
{
  return MEMORY[0x270F191B8]();
}

uint64_t sub_21F550DE0()
{
  return MEMORY[0x270F191C0]();
}

uint64_t sub_21F550DF0()
{
  return MEMORY[0x270F191C8]();
}

uint64_t sub_21F550E00()
{
  return MEMORY[0x270F191D0]();
}

uint64_t sub_21F550E10()
{
  return MEMORY[0x270F191D8]();
}

uint64_t sub_21F550E20()
{
  return MEMORY[0x270F191E0]();
}

uint64_t sub_21F550E30()
{
  return MEMORY[0x270F191E8]();
}

uint64_t sub_21F550E40()
{
  return MEMORY[0x270F191F0]();
}

uint64_t sub_21F550E50()
{
  return MEMORY[0x270F191F8]();
}

uint64_t sub_21F550E60()
{
  return MEMORY[0x270F19200]();
}

uint64_t sub_21F550E70()
{
  return MEMORY[0x270F19208]();
}

uint64_t sub_21F550E80()
{
  return MEMORY[0x270F19230]();
}

uint64_t sub_21F550E90()
{
  return MEMORY[0x270EF7760]();
}

uint64_t sub_21F550EA0()
{
  return MEMORY[0x270EF7780]();
}

uint64_t sub_21F550EB0()
{
  return MEMORY[0x270EF77B0]();
}

uint64_t sub_21F550EC0()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t sub_21F550ED0()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t sub_21F550EE0()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t sub_21F550EF0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_21F550F00()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_21F550F10()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_21F550F20()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_21F550F30()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_21F550F40()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_21F550F50()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_21F550F60()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_21F550F70()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_21F550F80()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_21F550F90()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_21F550FA0()
{
  return MEMORY[0x270EFFEC0]();
}

uint64_t sub_21F550FB0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_21F550FC0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_21F550FD0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_21F550FE0()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_21F550FF0()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_21F551000()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_21F551010()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_21F551020()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_21F551030()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_21F551040()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_21F551050()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_21F551060()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_21F551070()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_21F551080()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_21F551090()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_21F5510A0()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_21F5510B0()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_21F5510C0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_21F5510D0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_21F5510E0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_21F5510F0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_21F551100()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_21F551110()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_21F551120()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_21F551130()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_21F551140()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_21F551150()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_21F551160()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_21F551170()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_21F551180()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_21F551190()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_21F5511A0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_21F5511B0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_21F5511C0()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_21F5511D0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_21F5511E0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_21F5511F0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_21F551200()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_21F551210()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_21F551220()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_21F551230()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_21F551240()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_21F551250()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_21F551260()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_21F551270()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_21F551280()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_21F551290()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_21F5512A0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_21F5512B0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_21F5512C0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_21F5512D0()
{
  return MEMORY[0x270F03630]();
}

uint64_t sub_21F5512E0()
{
  return MEMORY[0x270F03648]();
}

uint64_t sub_21F5512F0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_21F551300()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_21F551310()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_21F551320()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_21F551330()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_21F551340()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_21F551350()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_21F551360()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_21F551370()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_21F551380()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_21F551390()
{
  return MEMORY[0x270F04598]();
}

uint64_t sub_21F5513A0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_21F5513B0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_21F5513C0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_21F5513D0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_21F5513E0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_21F5513F0()
{
  return MEMORY[0x270F04740]();
}

uint64_t sub_21F551400()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_21F551410()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_21F551420()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_21F551430()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_21F551440()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_21F551450()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_21F551460()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_21F551470()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21F551480()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_21F551490()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21F5514A0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21F5514B0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21F5514C0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21F5514D0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_21F5514E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21F5514F0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21F551500()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21F551510()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_21F551520()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_21F551530()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21F551540()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_21F551550()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_21F551560()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21F551570()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_21F551580()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21F551590()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21F5515A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21F5515B0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21F5515C0()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_21F5515D0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_21F5515E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21F5515F0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21F551600()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21F551610()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21F551620()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_21F551630()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21F551640()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21F551650()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21F551660()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21F551670()
{
  return MEMORY[0x270F1A378]();
}

uint64_t sub_21F551680()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21F551690()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_21F5516A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21F5516B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21F5516C0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_21F5516D0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21F5516E0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21F5516F0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21F551700()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21F551710()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21F551720()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_21F551730()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t sub_21F551740()
{
  return MEMORY[0x270F9DE10]();
}

uint64_t sub_21F551750()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_21F551760()
{
  return MEMORY[0x270F9DF00]();
}

uint64_t sub_21F551770()
{
  return MEMORY[0x270F1A380]();
}

uint64_t sub_21F551780()
{
  return MEMORY[0x270F1A388]();
}

uint64_t sub_21F551790()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_21F5517A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21F5517B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21F5517C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21F5517D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21F5517E0()
{
  return MEMORY[0x270F1A390]();
}

uint64_t sub_21F5517F0()
{
  return MEMORY[0x270F1A3A0]();
}

uint64_t sub_21F551800()
{
  return MEMORY[0x270F82568]();
}

uint64_t sub_21F551810()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_21F551820()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21F551830()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_21F551840()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21F551850()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21F551860()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_21F551870()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21F551880()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21F551890()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_21F5518A0()
{
  return MEMORY[0x270F825C0]();
}

uint64_t sub_21F5518B0()
{
  return MEMORY[0x270F1A3A8]();
}

uint64_t sub_21F5518C0()
{
  return MEMORY[0x270F826A8]();
}

uint64_t sub_21F5518D0()
{
  return MEMORY[0x270F826B0]();
}

uint64_t sub_21F5518E0()
{
  return MEMORY[0x270F1A3B0]();
}

uint64_t sub_21F5518F0()
{
  return MEMORY[0x270EF2080]();
}

uint64_t sub_21F551900()
{
  return MEMORY[0x270F828C8]();
}

uint64_t sub_21F551910()
{
  return MEMORY[0x270F1A3B8]();
}

uint64_t sub_21F551920()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_21F551930()
{
  return MEMORY[0x270F82940]();
}

uint64_t sub_21F551940()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21F551950()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_21F551960()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21F551970()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21F551980()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21F551990()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_21F5519A0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_21F5519B0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_21F5519C0()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_21F5519D0()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_21F5519E0()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_21F551A00()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21F551A10()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21F551A20()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21F551A30()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21F551A40()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21F551A50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21F551A60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21F551A70()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21F551A80()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21F551A90()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21F551AA0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21F551AB0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21F551AC0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21F551AD0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21F551AE0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21F551AF0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21F551B00()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21F551B10()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21F551B20()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21F551B30()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21F551B40()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21F551B50()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21F551B60()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21F551B70()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21F551B80()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21F551B90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21F551BB0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21F551BC0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21F551BD0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21F551BE0()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_21F551BF0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21F551C00()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_21F551C20()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21F551C30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21F551C60()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21F551C70()
{
  return MEMORY[0x270F1A3C8]();
}

uint64_t sub_21F551C80()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21F551C90()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_21F551CA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21F551CB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21F551CC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21F551CD0()
{
  return MEMORY[0x270FA00C0]();
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x270F82BA0](string);
  result.double y = v2;
  result.double x = v1;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x270EFD630]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F82C70]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}