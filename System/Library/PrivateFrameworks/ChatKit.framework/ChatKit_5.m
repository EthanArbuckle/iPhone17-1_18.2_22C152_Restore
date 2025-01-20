id sub_18F79BFE4(void *a1)
{
  id result;
  void *v3;
  id v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E923D2E8);
  sub_18F7B8DD0();
  if (!v5) {
    return 0;
  }
  result = objc_msgSend(a1, sel_guid);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(v5, sel_messageItemForGUID_, result);

    return v4;
  }
  __break(1u);
  return result;
}

id sub_18F79C090(void *a1)
{
  id v1 = objc_msgSend(a1, sel_fileTransferGUIDs);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (!v1) {
    return (id)v2;
  }
  v3 = v1;
  uint64_t v4 = sub_18F7B99C0();

  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return (id)v2;
  }
  v6 = self;
  sub_18F7B6CA0();
  uint64_t v7 = v4 + 40;
  while (1)
  {
    sub_18F7B6CA0();
    id result = objc_msgSend(v6, sel_sharedInstance);
    if (!result) {
      break;
    }
    v9 = result;
    v10 = (void *)sub_18F7B97A0();
    id v11 = objc_msgSend(v9, sel_transferForGUID_, v10);
    swift_bridgeObjectRelease();

    if (v11)
    {
      MEMORY[0x192FB7F10]();
      if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_18F7B99F0();
      }
      sub_18F7B9A20();
      sub_18F7B99E0();
    }
    v7 += 16;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

void sub_18F79C220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_18F633C50(a5, a6);
  }
}

void sub_18F79C298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    sub_18F7B6CA0();
    sub_18F7B6CA0();
    sub_18F633C0C(a5, a6);
  }
}

uint64_t sub_18F79C310(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 != 1)
  {
    sub_18F633C0C(result, a2);
    return sub_18F633C0C(a5, a6);
  }
  return result;
}

uint64_t sub_18F79C374(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 != 1)
  {
    sub_18F633C50(result, a2);
    return sub_18F633C50(a5, a6);
  }
  return result;
}

unint64_t sub_18F79C3DC()
{
  unint64_t result = qword_1E92422A8;
  if (!qword_1E92422A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9242298);
    sub_18EF23558(&qword_1E92422B0, &qword_1E9242270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92422A8);
  }
  return result;
}

void sub_18F79C47C(id a1, char a2)
{
  v3 = v2;
  uint64_t v5 = (id *)&v2[OBJC_IVAR___CKBalloonShapeView_drawingMode];
  uint64_t v6 = *(void **)&v2[OBJC_IVAR___CKBalloonShapeView_drawingMode];
  if (a2)
  {
    if (v2[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8])
    {
      sub_18EF3528C(0, (unint64_t *)&qword_1E922C120);
      id v11 = v6;
      id v12 = a1;
      char v13 = sub_18F7B9FF0();

      if (v13) {
        return;
      }
    }
    objc_msgSend(a1, sel_removeFromSuperlayer);
  }
  else
  {
    if ((v2[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) == 0)
    {
      sub_18EF3528C(0, (unint64_t *)&qword_1E922C120);
      id v7 = v6;
      id v8 = a1;
      char v9 = sub_18F7B9FF0();

      if (v9) {
        return;
      }
    }
    id v10 = objc_msgSend(v3, sel_layer);
    objc_msgSend(v10, sel_setContents_, 0);
  }
  if (*((unsigned char *)v5 + 8) == 1)
  {
    id v14 = *v5;
    id v15 = objc_msgSend(v3, sel_layer);
    objc_msgSend(v15, sel_addSublayer_, v14);
  }
}

void sub_18F79C71C()
{
  id v1 = v0;
  uint64_t v2 = sub_18F7B9450();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C0E0);
  *uint64_t v5 = sub_18F7B9E30();
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCBE8], v2);
  char v6 = sub_18F7B9480();
  (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    sub_18F7BA5D0();
    __break(1u);
    return;
  }
  objc_msgSend(v1, sel_setNeedsLayout);
  id v7 = &v1[OBJC_IVAR___CKBalloonShapeView_descriptor];
  unsigned int v8 = v1[OBJC_IVAR___CKBalloonShapeView_descriptor + 2];
  if (v8 < 3)
  {
    char v9 = *(uint64_t (**)(__int16 *))&v1[OBJC_IVAR___CKBalloonShapeView_imageGenerator];
    char v10 = v7[3];
    uint64_t v11 = *((void *)v7 + 1);
    char v12 = v7[16];
    char v13 = v7[72];
    char v14 = v7[73];
    char v15 = v7[74];
    char v16 = v7[75];
    __int16 v64 = *(_WORD *)v7;
    char v65 = v8;
    char v66 = v10;
    uint64_t v67 = v11;
    char v68 = v12;
    long long v17 = *(_OWORD *)(v7 + 40);
    long long v69 = *(_OWORD *)(v7 + 24);
    long long v70 = v17;
    long long v71 = *(_OWORD *)(v7 + 56);
    char v72 = v13;
    char v73 = v14;
    char v74 = v15;
    char v75 = v16;
    v18 = (void *)v9(&v64);
    v19 = &v1[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    v20 = *(void **)&v1[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    char v21 = v1[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8];
    *(void *)v19 = v18;
    v19[8] = 0;
    id v22 = v18;
    sub_18F79C47C(v20, v21);

    return;
  }
  if (v8 - 3 >= 2) {
    goto LABEL_9;
  }
  v23 = &v1[OBJC_IVAR___CKBalloonShapeView_drawingMode];
  if (v1[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8])
  {
    v24 = *(void **)v23;
    char v25 = v7[3];
    uint64_t v26 = *((void *)v7 + 1);
    char v27 = v7[16];
    char v28 = v7[72];
    char v29 = v7[73];
    char v30 = v7[74];
    char v31 = v7[75];
    uint64_t v32 = *(void *)v23 + OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor;
    long long v33 = *(_OWORD *)(v7 + 24);
    long long v34 = *(_OWORD *)(v7 + 40);
    long long v35 = *(_OWORD *)(v7 + 56);
    *(_WORD *)uint64_t v32 = *(_WORD *)v7;
    *(unsigned char *)(v32 + 2) = v8;
    *(unsigned char *)(v32 + 3) = v25;
    *(void *)(v32 + 8) = v26;
    *(unsigned char *)(v32 + 16) = v27;
    *(_OWORD *)(v32 + 24) = v33;
    *(_OWORD *)(v32 + 40) = v34;
    *(_OWORD *)(v32 + 56) = v35;
    *(unsigned char *)(v32 + 72) = v28;
    *(unsigned char *)(v32 + 73) = v29;
    *(unsigned char *)(v32 + 74) = v30;
    *(unsigned char *)(v32 + 75) = v31;
    objc_msgSend(v24, sel_setNeedsDisplay);
  }
  else
  {
    __int16 v36 = *(_WORD *)v7;
    char v37 = v7[3];
    uint64_t v38 = *((void *)v7 + 1);
    char v39 = v7[16];
    long long v62 = *(_OWORD *)(v7 + 24);
    uint64_t v40 = *((void *)v7 + 5);
    uint64_t v41 = *((void *)v7 + 6);
    uint64_t v42 = *((void *)v7 + 7);
    uint64_t v61 = *((void *)v7 + 8);
    int v43 = v7[72];
    int v59 = v7[73];
    int v60 = v43;
    int v58 = v7[74];
    int v57 = v7[75];
    uint64_t v44 = *(void *)&v1[OBJC_IVAR___CKBalloonShapeView_configuration];
    uint64_t v45 = *(void *)&v1[OBJC_IVAR___CKBalloonShapeView_configuration + 8];
    v46 = (objc_class *)type metadata accessor for BalloonShapeLayer();
    v47 = (char *)objc_allocWithZone(v46);
    v48 = &v47[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
    *(_WORD *)v48 = v36;
    v48[2] = v8;
    v48[3] = v37;
    *((void *)v48 + 1) = v38;
    v48[16] = v39;
    *(_OWORD *)(v48 + 24) = v62;
    *((void *)v48 + 5) = v40;
    *((void *)v48 + 6) = v41;
    uint64_t v49 = v61;
    *((void *)v48 + 7) = v42;
    *((void *)v48 + 8) = v49;
    v48[72] = v60;
    v48[73] = v59;
    v48[74] = v58;
    v48[75] = v57;
    v50 = &v47[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
    *(void *)v50 = v44;
    *((void *)v50 + 1) = v45;
    v63.receiver = v47;
    v63.super_class = v46;
    sub_18F7B6CA0();
    id v51 = objc_msgSendSuper2(&v63, sel_init);
    objc_msgSend(v51, sel_setNeedsDisplayOnBoundsChange_, 1);
    id v52 = v51;
    objc_msgSend(v1, sel_frame);
    objc_msgSend(v52, sel_setFrame_);

    v53 = *(void **)v23;
    char v54 = v23[8];
    *(void *)v23 = v52;
    v23[8] = 1;
    id v55 = v52;
    sub_18F79C47C(v53, v54);
  }
}

id sub_18F79CD08(int *a1, uint64_t a2)
{
  uint64_t v2 = *((void *)a1 + 1);
  char v3 = *((unsigned char *)a1 + 16);
  uint64_t v4 = *(uint64_t (**)(uint64_t, int *))(a2 + 16);
  int v9 = *a1;
  uint64_t v10 = v2;
  char v11 = v3;
  long long v12 = *(_OWORD *)(a1 + 6);
  long long v13 = *(_OWORD *)(a1 + 10);
  long long v14 = *(_OWORD *)(a1 + 14);
  v5.i32[1] = DWORD1(v14);
  v5.i32[0] = a1[18];
  int16x8_t v6 = (int16x8_t)vmovl_u8(v5);
  v6.i64[0] &= 0xFF01FF01FF01FF01;
  unsigned __int32 v15 = vmovn_s16(v6).u32[0];
  id v7 = (void *)v4(a2, &v9);

  return v7;
}

uint64_t sub_18F79CD90(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, double a5)
{
  int16x8_t v6 = v5;
  uint64_t ObjectType = swift_getObjectType();
  long long v13 = &v6[OBJC_IVAR___CKBalloonShapeView_descriptor];
  long long v14 = *(_OWORD *)(a1 + 16);
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v13 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 4) = v16;
  *(_OWORD *)long long v13 = *(_OWORD *)a1;
  *((_OWORD *)v13 + 1) = v14;
  long long v17 = &v6[OBJC_IVAR___CKBalloonShapeView_configuration];
  *(double *)long long v17 = a5;
  *((void *)v17 + 1) = a2;
  v18 = &v6[OBJC_IVAR___CKBalloonShapeView_imageGenerator];
  *(void *)v18 = a3;
  *((void *)v18 + 1) = a4;
  LODWORD(v18) = *(unsigned __int8 *)(a1 + 2);
  BOOL v19 = v18 >= 3;
  unsigned int v20 = v18 - 3;
  if (v19)
  {
    if (v20 >= 2)
    {
      uint64_t result = sub_18F7BA5D0();
      __break(1u);
      return result;
    }
    char v25 = (objc_class *)type metadata accessor for BalloonShapeLayer();
    uint64_t v26 = (char *)objc_allocWithZone(v25);
    char v27 = &v26[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
    long long v28 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v27 + 2) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v27 + 3) = v28;
    *((_OWORD *)v27 + 4) = *(_OWORD *)(a1 + 64);
    long long v29 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)char v27 = *(_OWORD *)a1;
    *((_OWORD *)v27 + 1) = v29;
    char v30 = &v26[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
    *(double *)char v30 = a5;
    *((void *)v30 + 1) = a2;
    v48.receiver = v26;
    v48.super_class = v25;
    char v31 = v6;
    sub_18F7B5790();
    sub_18F7B6CA0();
    id v24 = objc_msgSendSuper2(&v48, sel_init);
    objc_msgSend(v24, sel_setNeedsDisplayOnBoundsChange_, 1);
    uint64_t v32 = &v31[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    *(void *)uint64_t v32 = v24;
    v32[8] = 1;
    id v33 = v24;
  }
  else
  {
    char v21 = v6;
    sub_18F7B5790();
    uint64_t v22 = a3(a1);
    v23 = &v21[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    *(void *)v23 = v22;
    v23[8] = 0;

    id v24 = 0;
  }
  v47.receiver = v6;
  v47.super_class = (Class)CKBalloonShapeView;
  id v34 = objc_msgSendSuper2(&v47, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  long long v35 = v34;
  if (v24)
  {
    id v36 = v34;
    id v37 = v24;
    id v38 = objc_msgSend(v36, sel_layer);
    objc_msgSend(v38, sel_addSublayer_, v37);
  }
  else
  {
    id v39 = v34;
    id v37 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C70);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_18F820610;
  uint64_t v41 = sub_18F7B6A60();
  uint64_t v42 = MEMORY[0x1E4F42448];
  *(void *)(v40 + 32) = v41;
  *(void *)(v40 + 40) = v42;
  uint64_t v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v43;
  *(void *)(v44 + 24) = ObjectType;
  id v45 = v35;
  sub_18F7B9F80();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return (uint64_t)v45;
}

void sub_18F79D0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t v4 = (char *)MEMORY[0x192FBC390](v3);
  if (v4)
  {
    uint8x8_t v5 = v4;
    if (v4[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8])
    {
      id v6 = *(id *)&v4[OBJC_IVAR___CKBalloonShapeView_drawingMode];
      objc_msgSend(v6, sel_setNeedsDisplay);
    }
    else
    {
      objc_msgSend(v4, sel_descriptor);
      objc_msgSend(v5, sel_setDescriptor_, &v7);
    }
  }
}

void CKBalloonShapeView.alignmentRectInsets.getter()
{
  if ((v0[OBJC_IVAR___CKBalloonShapeView_drawingMode + 8] & 1) == 0)
  {
    id v2 = *(id *)&v0[OBJC_IVAR___CKBalloonShapeView_drawingMode];
    objc_msgSend(v2, sel_alignmentRectInsets);
    CKEdgeInsetsWithImageOrientation((uint64_t)objc_msgSend(v2, sel_imageOrientation), v3);
    goto LABEL_5;
  }
  id v1 = objc_msgSend(self, sel_sharedBehaviors);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_descriptor);
    objc_msgSend(v2, sel_balloonMaskAlignmentRectInsetsWithTailShape_, v4);
LABEL_5:

    return;
  }
  __break(1u);
}

double CKEdgeInsetsWithImageOrientation(uint64_t a1, double a2)
{
  if (a1 && a1 != 4)
  {
    char v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint8x8_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"CKGeometry.h", 429, @"CKEdgeInsetsWithImageOrientation %ld hasn't been implemented", a1);
  }
  return a2;
}

void __swiftcall CKBalloonShapeView.init(coder:)(CKBalloonShapeView_optional *__return_ptr retstr, NSCoder coder)
{
}

void CKBalloonShapeView.init(coder:)()
{
}

id CKBalloonShapeView.frame.getter()
{
  v1.super_class = (Class)CKBalloonShapeView;
  return objc_msgSendSuper2(&v1, sel_frame);
}

id CKBalloonShapeView.frame.setter(double a1, double a2, double a3, double a4)
{
  v23.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v23, sel_frame);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v22.receiver = v4;
  v22.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v22, sel_setFrame_, a1, a2, a3, a4);
  objc_msgSend(v4, sel_frame);
  v25.origin.x = v17;
  v25.origin.y = v18;
  v25.size.width = v19;
  v25.size.height = v20;
  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  id result = (id)CGRectEqualToRect(v24, v25);
  if ((result & 1) == 0) {
    return objc_msgSend(v4, sel_setNeedsLayout);
  }
  return result;
}

Swift::Void __swiftcall CKBalloonShapeView.layoutSublayers(of:)(CALayer of)
{
  Class isa = of.super.isa;
  v10.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v10, sel_layoutSublayersOfLayer_, of.super.isa, of._attr._objc_observation_info);
  id v3 = [(objc_class *)isa sublayers];
  if (v3)
  {
    char v4 = v3;
    sub_18EF3528C(0, &qword_1E922BFC0);
    unint64_t v5 = sub_18F7B99C0();

    if (v5 >> 62)
    {
      sub_18F7B6CA0();
      uint64_t v6 = sub_18F7BA5F0();
      if (v6) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      sub_18F7B6CA0();
      if (v6)
      {
LABEL_4:
        if (v6 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v7 = 0;
        do
        {
          if ((v5 & 0xC000000000000001) != 0) {
            id v8 = (id)MEMORY[0x192FB89F0](v7, v5);
          }
          else {
            id v8 = *(id *)(v5 + 8 * v7 + 32);
          }
          double v9 = v8;
          ++v7;
          objc_msgSend(v1, sel_frame);
          objc_msgSend(v9, sel_setFrame_);
          objc_msgSend(v9, sel_layoutIfNeeded);
        }
        while (v6 != v7);
      }
    }
    swift_bridgeObjectRelease_n();
  }
}

Swift::Bool __swiftcall CKBalloonShapeView._shouldAnimateProperty(withKey:)(Swift::String withKey)
{
  if (withKey._countAndFlagsBits == 0xD000000000000011 && withKey._object == (void *)0x800000018F89D100
    || (sub_18F7BA700() & 1) != 0)
  {
    return 1;
  }
  id v3 = (void *)sub_18F7B97A0();
  v5.receiver = v1;
  v5.super_class = (Class)CKBalloonShapeView;
  unsigned __int8 v2 = objc_msgSendSuper2(&v5, sel__shouldAnimatePropertyWithKey_, v3);

  return v2;
}

Swift::Void __swiftcall CKBalloonShapeView.layoutSubviews()()
{
  v2.super_class = (Class)CKBalloonShapeView;
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  if ((*(unsigned char *)(v0 + OBJC_IVAR___CKBalloonShapeView_drawingMode + 8) & 1) == 0)
  {
    id v1 = *(id *)(v0 + OBJC_IVAR___CKBalloonShapeView_drawingMode);
    sub_18F79DB78(v1);
  }
}

void sub_18F79DB78(void *a1)
{
  id v3 = objc_msgSend(v1, sel_layer);
  id v4 = objc_msgSend(a1, sel_CGImage);
  objc_msgSend(v3, sel_setContents_, v4);

  id v5 = objc_msgSend(v1, sel_layer);
  objc_msgSend(a1, sel_scale);
  objc_msgSend(v5, sel_setContentsScale_);

  objc_msgSend(a1, sel_size);
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(a1, sel_capInsets);
  double v11 = v10 / v7;
  double v13 = v12 / v9;
  double v15 = (v7 - v10 - v14) / v7;
  double v17 = (v9 - v12 - v16) / v9;
  id v18 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v18, sel_setContentsCenter_, v11, v13, v15, v17);

  id v19 = objc_msgSend(a1, sel_imageOrientation);
  id v20 = objc_msgSend(v1, sel_layer);
  if (v19 == (id)4)
  {
    objc_msgSend(v1, sel_bounds);
    CGAffineTransformMake(&v22, -1.0, 0.0, 0.0, 1.0, v21, 0.0);
  }
  else
  {
    *(_OWORD *)&v22.a = 0x3FF0000000000000uLL;
    v22.c = 0.0;
    v22.d = 1.0;
    *(_OWORD *)&v22.tx = 0uLL;
  }
  objc_msgSend(v20, sel_setContentsTransform_, &v22);
}

void __swiftcall CKBalloonShapeView.init(frame:)(CKBalloonShapeView *__return_ptr retstr, __C::CGRect frame)
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v6, sel_initWithFrame_, x, y, width, height);
}

void CKBalloonShapeView.init(frame:)()
{
}

id sub_18F79DF20(uint64_t a1)
{
  sub_18F4A6500(a1, (uint64_t)v22);
  id v3 = (objc_class *)type metadata accessor for BalloonShapeLayer();
  id v4 = v1;
  swift_dynamicCast();
  id v5 = v21;
  uint64_t v6 = *(void *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 8];
  char v7 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 16];
  char v8 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 72];
  char v9 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 73];
  char v10 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 74];
  char v11 = v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 75];
  double v12 = &v4[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
  long long v13 = *(_OWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 24];
  long long v14 = *(_OWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 40];
  long long v15 = *(_OWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 56];
  *(_DWORD *)double v12 = *(_DWORD *)&v21[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
  *((void *)v12 + 1) = v6;
  v12[16] = v7;
  *(_OWORD *)(v12 + 24) = v13;
  *(_OWORD *)(v12 + 40) = v14;
  *(_OWORD *)(v12 + 56) = v15;
  v12[72] = v8;
  v12[73] = v9;
  v12[74] = v10;
  v12[75] = v11;
  uint64_t v16 = *(void *)&v5[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config + 8];
  double v17 = &v4[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
  *(void *)double v17 = *(void *)&v5[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
  *((void *)v17 + 1) = v16;
  sub_18F7B6CA0();

  v20.receiver = v4;
  v20.super_class = v3;
  id v18 = objc_msgSendSuper2(&v20, sel_initWithLayer_, v5);
  objc_msgSend(v5, sel_frame);
  objc_msgSend(v18, sel_setFrame_);
  objc_msgSend(v18, sel_setNeedsDisplayOnBoundsChange_, 1);

  __swift_destroy_boxed_opaque_existential_0(a1);
  return v18;
}

void sub_18F79E0CC()
{
  id v1 = v0;
  v76.receiver = v0;
  v76.super_class = (Class)type metadata accessor for BalloonShapeLayer();
  objc_msgSendSuper2(&v76, sel_display);
  objc_msgSend(v0, sel_frame);
  uint64_t v6 = (CGFloat *)&v0[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor];
  unsigned int v7 = v0[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_descriptor + 2];
  if (v7 > 4) {
    goto LABEL_42;
  }
  CGFloat v8 = v2;
  CGFloat y = v3;
  CGFloat v10 = v4;
  CGFloat width = v5;
  double v12 = &selRef_setUpdateType_;
  unint64_t v13 = (unint64_t)&off_1E5632000;
  if (((1 << v7) & 0x15) == 0) {
    goto LABEL_15;
  }
  id v14 = objc_msgSend(self, sel_sharedBehaviors);
  if (!v14) {
    goto LABEL_39;
  }
  long long v15 = v14;
  id v16 = objc_msgSend(v14, sel_theme);

  if (!v16)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  id v17 = objc_msgSend(v16, sel_balloonColorsForColorType_, *((char *)v6 + 16));

  if (v17)
  {
    sub_18EF3528C(0, (unint64_t *)&qword_1E922C150);
    unint64_t v18 = sub_18F7B99C0();

    if (v18 >> 62)
    {
      sub_18F7B6CA0();
      uint64_t v22 = sub_18F7BA5F0();
      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_8;
      }
    }
    else if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_8:
      if ((v18 & 0xC000000000000001) != 0) {
        goto LABEL_36;
      }
      if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        for (id i = *(id *)(v18 + 32); ; id i = (id)MEMORY[0x192FB89F0](0, v18))
        {
          objc_super v20 = i;
          swift_bridgeObjectRelease();
          id v21 = [v20 *(SEL *)(v13 + 368)];

          if (!v21)
          {
LABEL_15:
            id v23 = objc_msgSend(self, sel_clearColor);
            id v21 = [v23 *(SEL *)(v13 + 368)];
          }
          objc_msgSend(v1, sel_setFillColor_, v21);

          __int16 v64 = &v1[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config];
          objc_msgSend(v1, sel_setLineWidth_, *(double *)&v1[OBJC_IVAR____TtC7ChatKit17BalloonShapeLayer_config]);
          CGColorRef GenericRGB = CGColorCreateGenericRGB(v6[3], v6[4], v6[5], v6[6]);
          objc_msgSend(v1, sel_setStrokeColor_, GenericRGB);

          objc_msgSend(v1, sel_setLineJoin_, *MEMORY[0x1E4F3A478]);
          objc_msgSend(v1, sel_setLineCap_, *MEMORY[0x1E4F3A458]);
          objc_msgSend(v1, sel_setLineDashPhase_, 1.0);
          CGRect v25 = v12;
          objc_msgSend(v1, sel_lineWidth);
          CGFloat v27 = v26;
          objc_msgSend(v1, sel_lineWidth);
          CGFloat v29 = v28;
          v78.origin.CGFloat x = v8;
          v78.origin.CGFloat y = y;
          tCGFloat x = v10;
          v78.size.CGFloat width = v10;
          v78.size.CGFloat height = width;
          CGRect v79 = CGRectInset(v78, v27, v29);
          CGFloat x = v79.origin.x;
          CGFloat y = v79.origin.y;
          CGFloat width = v79.size.width;
          CGFloat height = v79.size.height;
          LODWORD(v8) = *(_DWORD *)v6;
          objc_super v63 = (char **)v1;
          CGFloat v31 = v6[1];
          char v32 = *((unsigned char *)v6 + 16);
          CGFloat v33 = v6[3];
          CGFloat v34 = v6[4];
          CGFloat v35 = v6[5];
          CGFloat v10 = v6[6];
          uint64_t v37 = *((void *)v6 + 7);
          uint64_t v36 = *((void *)v6 + 8);
          char v38 = *((unsigned char *)v6 + 72);
          char v39 = *((unsigned char *)v6 + 73);
          unint64_t v13 = *((unsigned __int8 *)v6 + 74);
          char v40 = *((unsigned char *)v6 + 75);
          id v41 = [self (SEL)v25 + 4094];
          if (!v41) {
            goto LABEL_38;
          }
          uint64_t v42 = v41;
          LODWORD(t1.a) = vmovn_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)&v8)).u32[0];
          t1.b = v31;
          LOBYTE(t1.c) = v32;
          t1.d = v33;
          t1.tCGFloat x = v34;
          t1.tCGFloat y = v35;
          CGFloat v69 = v10;
          uint64_t v70 = v37;
          uint64_t v71 = v36;
          char v72 = v38;
          char v73 = v39;
          char v74 = v13;
          char v75 = v40;
          objc_msgSend(v41, sel_balloonMaskSizeWithBalloonDescriptor_, &t1);
          double v44 = v43;

          v45.n128_f64[0] = y;
          uint64_t v46 = sub_18F57A934(v39, 0, x, v45, width, height, v44 * 0.5);
          sub_18F57A310(v46, (uint64_t)v77);
          objc_super v47 = (void *)sub_18F7B8520();
          sub_18F79E9BC((uint64_t)v77);
          double v12 = v63;
          objc_msgSend(v63, sel_setPath_, v47);
          unint64_t v48 = *((void *)v64 + 1);
          if (v48 >> 62)
          {
            sub_18F7B6CA0();
            uint64_t v49 = sub_18F7BA5F0();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          unint64_t v18 = *((void *)v64 + 1);
          if (v49 != 1) {
            break;
          }
          if (v18 >> 62)
          {
            sub_18F7B6CA0();
            id v1 = (char *)sub_18F7BA5F0();
            if (!v1)
            {
LABEL_33:
              swift_bridgeObjectRelease();
              __break(1u);
LABEL_34:
              id v50 = (id)MEMORY[0x192FB89F0](0, v18);
LABEL_25:
              id v51 = v50;
              swift_bridgeObjectRelease();
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
              uint64_t v52 = swift_allocObject();
              *(_OWORD *)(v52 + 16) = xmmword_18F822670;
              *(void *)(v52 + 32) = v51;
              id v53 = v51;
              sub_18F62343C();
              sub_18F7B64C0();
              *(void *)(v52 + 40) = sub_18F7B6480();
              *(void *)&t1.a = v52;
              sub_18F7B99E0();
              sub_18EF3528C(0, (unint64_t *)&qword_1E922C110);
              char v54 = (void *)sub_18F7B99A0();
              swift_bridgeObjectRelease();
              objc_msgSend(v63, sel_setLineDashPattern_, v54);

LABEL_27:
              if (*((unsigned char *)v6 + 3) != 1)
              {
                if (*((unsigned char *)v6 + 3)) {
                  goto LABEL_42;
                }
                CGAffineTransformMakeScale(&t1, -1.0, 1.0);
                long long v65 = *(_OWORD *)&t1.a;
                long long v62 = *(_OWORD *)&t1.c;
                CGFloat v55 = t1.tx;
                tCGFloat y = t1.ty;
                CGAffineTransformMakeTranslation(&t1, tx, 0.0);
                long long v57 = *(_OWORD *)&t1.a;
                long long v58 = *(_OWORD *)&t1.c;
                long long v59 = *(_OWORD *)&t1.tx;
                *(_OWORD *)&t1.a = v65;
                *(_OWORD *)&t1.c = v62;
                t1.tCGFloat x = v55;
                t1.tCGFloat y = ty;
                *(_OWORD *)&t2.a = v57;
                *(_OWORD *)&t2.c = v58;
                *(_OWORD *)&t2.tCGFloat x = v59;
                CGAffineTransformConcat(&v66, &t1, &t2);
                CGAffineTransform t1 = v66;
                objc_msgSend(v63, sel_setAffineTransform_, &t1);
              }

              return;
            }
          }
          else
          {
            id v1 = *(char **)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
            sub_18F7B6CA0();
            if (!v1) {
              goto LABEL_33;
            }
          }
          if ((v18 & 0xC000000000000001) != 0) {
            goto LABEL_34;
          }
          if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v50 = *(id *)(v18 + 32);
            goto LABEL_25;
          }
          __break(1u);
LABEL_36:
          ;
        }
        sub_18EF3528C(0, (unint64_t *)&qword_1E922C110);
        sub_18F7B6CA0();
        char v54 = (void *)sub_18F7B99A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v63, sel_setLineDashPattern_, v54);
        goto LABEL_27;
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  sub_18F7BA5D0();
  __break(1u);
}

id sub_18F79E92C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalloonShapeLayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CKBalloonShapeView(uint64_t a1)
{
  return sub_18EF3528C(a1, &qword_1E92422D8);
}

uint64_t type metadata accessor for BalloonShapeLayer()
{
  return self;
}

ValueMetadata *_s13ConfigurationVMa()
{
  return &_s13ConfigurationVN;
}

uint64_t sub_18F79E9BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_18F79E9F4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_18F79EA2C(int *a1)
{
  return sub_18F79CD08(a1, *(void *)(v1 + 16));
}

uint64_t sub_18F79EA34()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18F79EA6C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_18F79EAA4(uint64_t a1, uint64_t a2)
{
  sub_18F79D0E0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_18F79EAAC(unint64_t a1)
{
  uint64_t v13 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  for (; v2; uint64_t v2 = sub_18F7BA5F0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x192FB89F0](i - 4, a1) : *(id *)(a1 + 8 * i);
      char v9 = v8;
      uint64_t v10 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      self;
      uint64_t v11 = swift_dynamicCastObjCClass();
      if (v11 || (self, (uint64_t v11 = swift_dynamicCastObjCClass()) != 0))
      {
        double v4 = (void *)v11;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
        uint64_t v5 = swift_allocObject();
        *(_OWORD *)(v5 + 16) = xmmword_18F81DD50;
        id v6 = v9;
        *(void *)(v5 + 32) = objc_msgSend(v4, sel_mediaObject);
        sub_18F7B99E0();
        unint64_t v7 = v5;
      }
      else
      {
        unint64_t v7 = (unint64_t)sub_18F7A00B8();
      }
      sub_18F4E9010(v7);
      if (v10 == v2)
      {
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    __break(1u);
LABEL_15:
    sub_18F7B6CA0();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

void CKTranscriptCollectionViewController.selectedMediaObjectForCommSafetyReport(selectedIndexPath:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18F7B6410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E922ABE0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F79F0C8(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_18F4ADE30((uint64_t)v10);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  id v11 = objc_msgSend(v2, sel_chatItems);
  unint64_t v12 = sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  unint64_t v13 = sub_18F7B99C0();

  if (v13 >> 62)
  {
    sub_18F7B6CA0();
    uint64_t v14 = sub_18F7BA5F0();
    unint64_t v17 = swift_bridgeObjectRelease_n();
    if (v14 < 0)
    {
      __break(1u);
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = sub_18F7B63F0();
  if (v15 < 0 || v15 >= v14) {
    goto LABEL_20;
  }
  id v16 = objc_msgSend(v2, sel_chatItems);
  unint64_t v12 = sub_18F7B99C0();

  unint64_t v17 = sub_18F7B63F0();
  if ((v12 & 0xC000000000000001) == 0)
  {
    if ((v17 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v17 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v18 = *(id *)(v12 + 8 * v17 + 32);
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_26;
  }
LABEL_23:
  id v18 = (id)MEMORY[0x192FB89F0](v17, v12);
LABEL_11:
  id v16 = v18;
  swift_bridgeObjectRelease();
  self;
  id v19 = (void *)swift_dynamicCastObjCClass();
  if (v19)
  {
    objc_msgSend(v19, sel_mediaObject);

LABEL_20:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  id v20 = objc_msgSend(v16, sel_visibleAssociatedStickerChatItems);
  sub_18EF3528C(0, (unint64_t *)&unk_1E923A070);
  unint64_t v12 = sub_18F7B99C0();

  if (v12 >> 62)
  {
LABEL_26:
    sub_18F7B6CA0();
    uint64_t v23 = sub_18F7BA5F0();
    swift_bridgeObjectRelease();
    if (v23) {
      goto LABEL_16;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    return;
  }
  if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_27;
  }
LABEL_16:
  if ((v12 & 0xC000000000000001) != 0)
  {
    id v21 = (id)MEMORY[0x192FB89F0](0, v12);
    goto LABEL_19;
  }
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v21 = *(id *)(v12 + 32);
LABEL_19:
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_mediaObject);

    goto LABEL_20;
  }
  __break(1u);
}

uint64_t sub_18F79F0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E922ABE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CKTranscriptCollectionViewController.mediaObjectsForCommSafetyReport(selectedMediaObject:)()
{
  id v1 = objc_msgSend(v0, sel_chatItems);
  sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  unint64_t v2 = sub_18F7B99C0();

  unint64_t v3 = MEMORY[0x1E4FBC860];
  unint64_t v35 = MEMORY[0x1E4FBC860];
  if (v2 >> 62) {
    goto LABEL_34;
  }
  unint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = v3;
      while (1)
      {
        if (__OFSUB__(v4--, 1))
        {
          __break(1u);
LABEL_17:
          swift_bridgeObjectRelease();
          unint64_t v9 = v35;
          unint64_t v3 = v5;
          goto LABEL_18;
        }
        if ((v2 & 0xC000000000000001) == 0) {
          break;
        }
        id v7 = (id)MEMORY[0x192FB89F0](v4, v2);
LABEL_11:
        uint64_t v8 = v7;
        self;
        if (swift_dynamicCastObjCClass())
        {
          MEMORY[0x192FB7F10]();
          unint64_t v3 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v3 >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_18F7B99F0();
          }
          sub_18F7B9A20();
          sub_18F7B99E0();
          if (!v4) {
            goto LABEL_17;
          }
        }
        else
        {

          if (!v4) {
            goto LABEL_17;
          }
        }
      }
      if ((v4 & 0x8000000000000000) == 0) {
        break;
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      sub_18F7B6CA0();
      unint64_t v4 = sub_18F7BA5F0();
      if (!v4) {
        goto LABEL_35;
      }
    }
    if (v4 >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_33;
    }
    id v7 = *(id *)(v2 + 32 + 8 * v4);
    goto LABEL_11;
  }
LABEL_35:
  swift_bridgeObjectRelease();
  unint64_t v9 = MEMORY[0x1E4FBC860];
LABEL_18:
  swift_bridgeObjectRelease();
  if (v9 >> 62)
  {
    sub_18F7B6CA0();
    uint64_t v10 = sub_18F7BA5F0();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_20;
    }
LABEL_37:
    uint64_t v22 = swift_bridgeObjectRelease();
    unint64_t v13 = MEMORY[0x1E4FBC860];
    goto LABEL_38;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    goto LABEL_37;
  }
LABEL_20:
  unint64_t v36 = v3;
  uint64_t result = sub_18F62A3F0(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = 0;
  unint64_t v13 = v36;
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v14 = (id)MEMORY[0x192FB89F0](v12, v9);
    }
    else {
      id v14 = *(id *)(v9 + 8 * v12 + 32);
    }
    id v15 = v14;
    id v16 = objc_msgSend(v15, sel_visibleAssociatedMessageChatItems);
    if (v16)
    {
      unint64_t v17 = v16;
      sub_18EF3528C(0, &qword_1E922BC10);
      uint64_t v18 = sub_18F7B99C0();
    }
    else
    {
      unint64_t v17 = v15;
      uint64_t v18 = MEMORY[0x1E4FBC860];
    }

    unint64_t v20 = *(void *)(v36 + 16);
    unint64_t v19 = *(void *)(v36 + 24);
    if (v20 >= v19 >> 1) {
      sub_18F62A3F0(v19 > 1, v20 + 1, 1);
    }
    ++v12;
    *(void *)(v36 + 16) = v20 + 1;
    unint64_t v21 = v36 + 16 * v20;
    *(void *)(v21 + 32) = v15;
    *(void *)(v21 + 40) = v18;
  }
  while (v10 != v12);
  uint64_t v22 = swift_bridgeObjectRelease();
  unint64_t v3 = MEMORY[0x1E4FBC860];
LABEL_38:
  MEMORY[0x1F4188790](v22);
  uint64_t v23 = sub_18F7B6CA0();
  uint64_t v24 = sub_18F7A11CC(v23, (uint64_t (*)(id, uint64_t))sub_18F7A0B44);
  char v26 = v25;
  swift_bridgeObjectRelease();
  if (v26) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = v24;
  }
  sub_18F79FB10(10, v27);
  unint64_t v34 = v3;
  uint64_t v28 = *(void *)(v13 + 16);
  if (v28)
  {
    sub_18F7B6CA0();
    CGFloat v29 = (unint64_t *)(v13 + 40);
    do
    {
      unint64_t v30 = *v29;
      id v31 = (id)*(v29 - 1);
      sub_18F7B6CA0();
      id v32 = sub_18F79FBE8(v31, v30);
      swift_bridgeObjectRelease();

      sub_18F4E9010((unint64_t)v32);
      v29 += 2;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    unint64_t v3 = v34;
  }
  uint64_t v33 = sub_18F73C5A0(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v33;
}

id sub_18F79F6A8(void *a1, unint64_t a2, void *a3)
{
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6 || (self, (uint64_t v6 = swift_dynamicCastObjCClass()) != 0))
  {
    id v7 = (void *)v6;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_18F81DD50;
    id v9 = a1;
    *(void *)(v8 + 32) = objc_msgSend(v7, sel_mediaObject);
    sub_18F7B99E0();
    unint64_t v10 = v8;

    goto LABEL_4;
  }
  self;
  id v16 = (void *)swift_dynamicCastObjCClass();
  if (!v16)
  {
    unint64_t v10 = MEMORY[0x1E4FBC860];
    goto LABEL_4;
  }
  id v17 = objc_msgSend(v16, sel_acknowledgments);
  unint64_t v10 = MEMORY[0x1E4FBC860];
  if (!v17)
  {
LABEL_4:
    id v11 = a3;
    int v12 = sub_18F7A0B4C(v10, a3);
    swift_bridgeObjectRelease();

    id v13 = v11;
    int v14 = sub_18F7A0D90(a2, a3);

    return (id)((v12 | v14) & 1);
  }
  uint64_t v18 = v17;
  sub_18EF3528C(0, (unint64_t *)&qword_1E9238E98);
  unint64_t v19 = sub_18F7B99C0();

  unint64_t v39 = v10;
  if (v19 >> 62)
  {
LABEL_28:
    sub_18F7B6CA0();
    uint64_t v20 = sub_18F7BA5F0();
    if (v20) {
      goto LABEL_9;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    unint64_t v10 = MEMORY[0x1E4FBC860];
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  if (!v20) {
    goto LABEL_29;
  }
LABEL_9:
  unint64_t v37 = a2;
  unint64_t v38 = v19 & 0xC000000000000001;
  uint64_t v21 = 4;
  uint64_t v35 = v20;
  unint64_t v36 = v19;
  while (1)
  {
    if (v38) {
      id v22 = (id)MEMORY[0x192FB89F0](v21 - 4, v19);
    }
    else {
      id v22 = *(id *)(v19 + 8 * v21);
    }
    uint64_t v23 = v22;
    uint64_t v24 = v21 - 3;
    if (__OFADD__(v21 - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    id v25 = objc_msgSend(v22, sel_tapback);
    if (!v25)
    {

      goto LABEL_11;
    }
    char v26 = v25;
    self;
    uint64_t v27 = (void *)swift_dynamicCastObjCClass();
    if (v27)
    {
      uint64_t v28 = v27;
      if ((objc_msgSend(v27, sel_isRemoved) & 1) == 0) {
        break;
      }
    }

LABEL_11:
    ++v21;
    if (v24 == v20)
    {
      swift_bridgeObjectRelease();
      unint64_t v10 = v39;
      goto LABEL_30;
    }
  }
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    CGFloat v29 = result;
    id v30 = objc_msgSend(v28, sel_transferGUID);
    sub_18F7B97E0();

    id v31 = (void *)sub_18F7B97A0();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v23, sel_message);
    id v33 = objc_msgSend(v23, sel_chatContext);
    id v34 = objc_msgSend(v29, sel_mediaObjectWithTransferGUID_imMessage_chatContext_, v31, v32, v33);

    unint64_t v19 = v36;
    a2 = v37;
    uint64_t v20 = v35;
    if (v34)
    {
      MEMORY[0x192FB7F10]();
      if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_18F7B99F0();
      }
      sub_18F7B9A20();
      sub_18F7B99E0();
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_18F79FB10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (a2 < 0 || (int64_t v5 = *(void *)(v3 + 16), v5 <= a2))
  {
    uint64_t result = swift_bridgeObjectRelease();
    *unint64_t v2 = MEMORY[0x1E4FBC860];
    return result;
  }
  uint64_t result = sub_18F7A0ADC(a2 + 1, a1, *v2);
  if (__OFSUB__(0, a1))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v8 = result;
  uint64_t result = sub_18F7A0ADC(a2, -a1, v3);
  if (v5 < v8)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = result;
  uint64_t result = sub_18F73C750(v8, v5);
  if (v9 < 0)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  return sub_18F73C750(0, v9);
}

id sub_18F79FBE8(void *a1, unint64_t a2)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4 || (self, (uint64_t v4 = swift_dynamicCastObjCClass()) != 0))
  {
    int64_t v5 = (void *)v4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_18F81DD50;
    id v7 = a1;
    *(void *)(v6 + 32) = objc_msgSend(v5, sel_mediaObject);
    sub_18F7B99E0();
    uint64_t v8 = v6;

    goto LABEL_4;
  }
  self;
  id v11 = (void *)swift_dynamicCastObjCClass();
  if (!v11)
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
    goto LABEL_4;
  }
  id v12 = objc_msgSend(v11, sel_acknowledgments);
  uint64_t v8 = MEMORY[0x1E4FBC860];
  if (!v12)
  {
LABEL_4:
    unint64_t v9 = sub_18F79EAAC(a2);
    sub_18F4E9010(v9);
    return (id)v8;
  }
  id v13 = v12;
  sub_18EF3528C(0, (unint64_t *)&qword_1E9238E98);
  unint64_t v14 = sub_18F7B99C0();

  uint64_t v34 = v8;
  if (v14 >> 62)
  {
LABEL_28:
    sub_18F7B6CA0();
    uint64_t v15 = sub_18F7BA5F0();
    if (v15) {
      goto LABEL_9;
    }
LABEL_29:
    swift_bridgeObjectRelease();
LABEL_30:
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  if (!v15) {
    goto LABEL_29;
  }
LABEL_9:
  unint64_t v16 = v14 & 0xC000000000000001;
  uint64_t v8 = 4;
  uint64_t v32 = v15;
  unint64_t v33 = v14;
  unint64_t v31 = v14 & 0xC000000000000001;
  while (1)
  {
    if (v16) {
      id v17 = (id)MEMORY[0x192FB89F0](v8 - 4, v14);
    }
    else {
      id v17 = *(id *)(v14 + 8 * v8);
    }
    uint64_t v18 = v17;
    uint64_t v19 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    id v20 = objc_msgSend(v17, sel_tapback);
    if (!v20)
    {

      goto LABEL_11;
    }
    uint64_t v21 = v20;
    self;
    id v22 = (void *)swift_dynamicCastObjCClass();
    if (v22)
    {
      uint64_t v23 = v22;
      if ((objc_msgSend(v22, sel_isRemoved) & 1) == 0) {
        break;
      }
    }

LABEL_11:
    ++v8;
    if (v19 == v15)
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v34;
      goto LABEL_30;
    }
  }
  unint64_t v24 = a2;
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    id v25 = result;
    id v26 = objc_msgSend(v23, sel_transferGUID);
    sub_18F7B97E0();

    uint64_t v27 = (void *)sub_18F7B97A0();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v18, sel_message);
    id v29 = objc_msgSend(v18, sel_chatContext);
    id v30 = objc_msgSend(v25, sel_mediaObjectWithTransferGUID_imMessage_chatContext_, v27, v28, v29);

    a2 = v24;
    uint64_t v15 = v32;
    unint64_t v14 = v33;
    unint64_t v16 = v31;
    if (v30)
    {
      MEMORY[0x192FB7F10]();
      if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_18F7B99F0();
      }
      sub_18F7B9A20();
      sub_18F7B99E0();
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

id sub_18F7A00B8()
{
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClass();
  if (!v0) {
    return (id)MEMORY[0x1E4FBC860];
  }
  id v1 = objc_msgSend(v0, sel_acknowledgments);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (!v1) {
    return (id)v2;
  }
  uint64_t v3 = v1;
  sub_18EF3528C(0, (unint64_t *)&qword_1E9238E98);
  unint64_t v4 = sub_18F7B99C0();

  uint64_t v26 = v2;
  if (v4 >> 62)
  {
LABEL_24:
    sub_18F7B6CA0();
    uint64_t v5 = sub_18F7BA5F0();
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  if (!v5)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v2 = MEMORY[0x1E4FBC860];
LABEL_26:
    swift_bridgeObjectRelease();
    return (id)v2;
  }
LABEL_5:
  unint64_t v6 = v4 & 0xC000000000000001;
  uint64_t v7 = 4;
  uint64_t v8 = &selRef_startWithQueue_completionHandler_;
  unint64_t v24 = v4 & 0xC000000000000001;
  unint64_t v25 = v4;
  while (1)
  {
    if (v6) {
      id v9 = (id)MEMORY[0x192FB89F0](v7 - 4, v4);
    }
    else {
      id v9 = *(id *)(v4 + 8 * v7);
    }
    unint64_t v10 = v9;
    uint64_t v11 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    id v12 = [v9 v8[505]];
    if (!v12)
    {

      goto LABEL_7;
    }
    id v13 = v12;
    self;
    unint64_t v14 = (void *)swift_dynamicCastObjCClass();
    if (v14)
    {
      uint64_t v15 = v14;
      if ((objc_msgSend(v14, sel_isRemoved) & 1) == 0) {
        break;
      }
    }

LABEL_7:
    ++v7;
    if (v11 == v5)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v26;
      goto LABEL_26;
    }
  }
  uint64_t v16 = v5;
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v18 = result;
    id v19 = objc_msgSend(v15, sel_transferGUID);
    sub_18F7B97E0();

    id v20 = (void *)sub_18F7B97A0();
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v10, sel_message);
    id v22 = objc_msgSend(v10, sel_chatContext);
    id v23 = objc_msgSend(v18, sel_mediaObjectWithTransferGUID_imMessage_chatContext_, v20, v21, v22);

    uint64_t v5 = v16;
    unint64_t v6 = v24;
    unint64_t v4 = v25;
    uint64_t v8 = &selRef_startWithQueue_completionHandler_;
    if (v23)
    {
      MEMORY[0x192FB7F10]();
      if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_18F7B99F0();
      }
      sub_18F7B9A20();
      sub_18F7B99E0();
    }
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

id CKTranscriptCollectionViewController.hasCommSafetyNotViewableAssociatedItems(_:)()
{
  sub_18F7A04D4();
  unint64_t v1 = v0;
  if (v0 >> 62) {
    goto LABEL_12;
  }
  uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  for (; v2; uint64_t v2 = sub_18F7BA5F0())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x192FB89F0](v3 - 4, v1) : *(id *)(v1 + 8 * v3);
      uint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_isCommSafetySensitiveNotViewable);

      if ((v7 & 1) == 0)
      {
        ++v3;
        if (v6 != v2) {
          continue;
        }
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    sub_18F7B6CA0();
  }
  id v7 = 0;
LABEL_14:
  swift_bridgeObjectRelease_n();
  return v7;
}

void sub_18F7A04D4()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_18F7B63F0();
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v2;
    while (1)
    {
      id v4 = objc_msgSend(v1, sel_chatItems);
      sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
      uint64_t v5 = sub_18F7B99C0();

      if ((v5 & 0xC000000000000001) != 0)
      {
        id v6 = (id)MEMORY[0x192FB89F0](v3, v5);
      }
      else
      {
        if ((unint64_t)v3 >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v6 = *(id *)(v5 + 8 * v3 + 32);
      }
      id v7 = v6;
      swift_bridgeObjectRelease();
      self;
      uint64_t v8 = swift_dynamicCastObjCClass();
      if (v8) {
        break;
      }

      if (v3-- < 1) {
        return;
      }
    }
    unint64_t v10 = (void *)v8;
    id v11 = v7;
    id v12 = objc_msgSend(v10, sel_visibleAssociatedMessageChatItems);
    if (v12)
    {
      id v13 = v12;
      sub_18EF3528C(0, &qword_1E922BC10);
      sub_18F7B99C0();
    }
    else
    {
      id v13 = v11;
    }
  }
}

id sub_18F7A08D0()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s19TemporaryMenuButtonCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall UIButton.popCommSafetyMenu(_:)(UIMenu *a1)
{
  objc_msgSend(v1, sel_frame);
  id v7 = objc_msgSend(objc_allocWithZone((Class)_s19TemporaryMenuButtonCMa()), sel_initWithFrame_, v3, v4, v5, v6);
  objc_msgSend(v7, sel_setShowsMenuAsPrimaryAction_, 1);
  objc_msgSend(v7, sel_setMenu_, a1);
  objc_msgSend(v1, sel_addSubview_, v7);
  objc_msgSend(v7, sel_performPrimaryAction);
}

void sub_18F7A09E8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  objc_msgSend(v5, sel_frame);
  id v10 = objc_msgSend(objc_allocWithZone((Class)_s19TemporaryMenuButtonCMa()), sel_initWithFrame_, v6, v7, v8, v9);
  objc_msgSend(v10, sel_setShowsMenuAsPrimaryAction_, 1);
  objc_msgSend(v10, sel_setMenu_, v4);
  objc_msgSend(v5, sel_addSubview_, v10);
  objc_msgSend(v10, sel_performPrimaryAction);
}

uint64_t sub_18F7A0ADC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = *(void *)(a3 + 16);
    uint64_t v4 = v3 - result;
    if (__OFSUB__(v3, result))
    {
      __break(1u);
      goto LABEL_15;
    }
    if ((v4 & 0x8000000000000000) == 0 && v4 < a2) {
      return v3;
    }
    uint64_t v3 = result + a2;
    if (!__OFADD__(result, a2)) {
      return v3;
    }
    __break(1u);
  }
  if (__OFSUB__(0, result))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (result >= 0 && -result > a2) {
    return 0;
  }
  uint64_t v3 = result + a2;
  if (!__OFADD__(result, a2)) {
    return v3;
  }
LABEL_16:
  __break(1u);
  return result;
}

id sub_18F7A0B44(void *a1, unint64_t a2)
{
  return sub_18F79F6A8(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_18F7A0B4C(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_29:
    sub_18F7B6CA0();
    uint64_t v4 = sub_18F7BA5F0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_18F7B6CA0();
    if (v4)
    {
LABEL_3:
      uint64_t v20 = v4;
      uint64_t v5 = 4;
      id v21 = a2;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v7 = (id)MEMORY[0x192FB89F0](v5 - 4, a1);
        }
        else {
          id v7 = *(id *)(a1 + 8 * v5);
        }
        double v8 = v7;
        uint64_t v9 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
          goto LABEL_29;
        }
        id v10 = objc_msgSend(v7, sel_transferGUID);
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = sub_18F7B97E0();
          uint64_t v14 = v13;

          if (!a2) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v12 = 0;
          uint64_t v14 = 0;
          if (!a2)
          {
LABEL_16:
            uint64_t v18 = 0;
            if (!v14) {
              goto LABEL_22;
            }
            goto LABEL_17;
          }
        }
        id v15 = objc_msgSend(a2, sel_transferGUID);
        if (v15)
        {
          uint64_t v16 = v15;
          a2 = (void *)sub_18F7B97E0();
          uint64_t v18 = v17;

          if (!v14) {
            goto LABEL_22;
          }
        }
        else
        {
          a2 = 0;
          uint64_t v18 = 0;
          if (!v14)
          {
LABEL_22:
            if (!v18)
            {
              swift_bridgeObjectRelease();

              return 1;
            }
LABEL_24:

            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
        }
LABEL_17:
        if (!v18) {
          goto LABEL_24;
        }
        if ((void *)v12 == a2 && v14 == v18)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
LABEL_26:
          swift_bridgeObjectRelease();
          return 1;
        }
        char v6 = sub_18F7BA700();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_26;
        }
LABEL_5:
        ++v5;
        a2 = v21;
      }
      while (v9 != v20);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_18F7A0D90(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_44;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_18F7B6CA0();
  while (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = v3 & 0xC000000000000001;
    id v41 = (char *)(v3 + 32);
    id v7 = &selRef_transcriptMinBottomInsetIsEntryViewHeight;
    unint64_t v43 = v3;
    unint64_t v42 = v3 & 0xC000000000000001;
    while (1)
    {
      id v8 = v6 ? (id)MEMORY[0x192FB89F0](v5, v3) : *(id *)&v41[8 * v5];
      id v9 = v8;
      BOOL v10 = __OFADD__(v5, 1);
      uint64_t v11 = v5 + 1;
      if (v10) {
        break;
      }
      self;
      uint64_t v12 = swift_dynamicCastObjCClass();
      __n128 v45 = v9;
      if (v12 || (self, (uint64_t v12 = swift_dynamicCastObjCClass()) != 0))
      {
        uint64_t v13 = (void *)v12;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
        uint64_t v14 = swift_allocObject();
        id v15 = v9;
        uint64_t v16 = (void *)v14;
        *(_OWORD *)(v14 + 16) = xmmword_18F81DD50;
        id v17 = v15;
        v16[4] = objc_msgSend(v13, sel_mediaObject);
        sub_18F7B99E0();
        unint64_t v3 = (unint64_t)v16;
      }
      else
      {
        unint64_t v3 = (unint64_t)sub_18F7A00B8();
      }
      uint64_t v44 = v11;
      if (v3 >> 62)
      {
        id v38 = a2;
        sub_18F7B6CA0();
        uint64_t v18 = sub_18F7BA5F0();
        if (!v18) {
          goto LABEL_4;
        }
LABEL_14:
        uint64_t v46 = v18;
        unint64_t v47 = v3 & 0xC000000000000001;
        uint64_t v20 = 4;
LABEL_17:
        if (v47) {
          id v22 = (id)MEMORY[0x192FB89F0](v20 - 4, v3);
        }
        else {
          id v22 = *(id *)(v3 + 8 * v20);
        }
        id v23 = v22;
        uint64_t v24 = v20 - 3;
        if (__OFADD__(v20 - 4, 1))
        {
          __break(1u);
          break;
        }
        id v25 = [v22 v7[78]];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v48 = sub_18F7B97E0();
          uint64_t v28 = v27;

          uint64_t v49 = v23;
          if (a2) {
            goto LABEL_23;
          }
LABEL_26:
          uint64_t v35 = 0;
          uint64_t v37 = 0;
          if (!v28) {
            goto LABEL_27;
          }
LABEL_31:
          if (v37)
          {
            if (v48 == v35 && v28 == v37)
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_40;
            }
            char v21 = sub_18F7BA700();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v21)
            {

LABEL_40:
              swift_bridgeObjectRelease();
LABEL_41:
              swift_bridgeObjectRelease();

              uint64_t v39 = 1;
              goto LABEL_46;
            }
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v48 = 0;
          uint64_t v28 = 0;
          uint64_t v49 = v23;
          if (!a2) {
            goto LABEL_26;
          }
LABEL_23:
          unint64_t v29 = v3;
          id v30 = v7;
          unint64_t v31 = v7[78];
          uint64_t v32 = a2;
          id v33 = objc_msgSend(a2, v31, v41);
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = sub_18F7B97E0();
            uint64_t v37 = v36;
          }
          else
          {
            uint64_t v35 = 0;
            uint64_t v37 = 0;
          }
          a2 = v32;
          id v7 = v30;
          unint64_t v3 = v29;
          if (v28) {
            goto LABEL_31;
          }
LABEL_27:
          if (!v37)
          {

            swift_bridgeObjectRelease();
            goto LABEL_41;
          }
        }

        swift_bridgeObjectRelease();
LABEL_16:
        ++v20;
        if (v24 == v46) {
          goto LABEL_4;
        }
        goto LABEL_17;
      }
      uint64_t v18 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v19 = a2;
      sub_18F7B6CA0();
      if (v18) {
        goto LABEL_14;
      }
LABEL_4:

      swift_bridgeObjectRelease_n();
      unint64_t v6 = v42;
      unint64_t v3 = v43;
      uint64_t v5 = v44;
      if (v44 == v4) {
        goto LABEL_45;
      }
    }
    __break(1u);
LABEL_44:
    sub_18F7B6CA0();
    uint64_t v4 = sub_18F7BA5F0();
  }
LABEL_45:
  uint64_t v39 = 0;
LABEL_46:
  swift_bridgeObjectRelease();
  return v39;
}

uint64_t sub_18F7A11CC(uint64_t a1, uint64_t (*a2)(id, uint64_t))
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = 0;
  for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
  {
    uint64_t v6 = *i;
    id v7 = (id)*(i - 1);
    sub_18F7B6CA0();
    char v8 = a2(v7, v6);
    swift_bridgeObjectRelease();

    if (v8) {
      break;
    }
    if (v2 == ++v4) {
      return 0;
    }
  }
  return v4;
}

uint64_t _s19TemporaryMenuButtonCMa()
{
  return self;
}

id CKDebugTicker.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CKDebugTicker.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow] = 0;
  *(void *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter] = 0;
  *(void *)&v0[OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKDebugTicker();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CKDebugTicker()
{
  return self;
}

id sub_18F7A13DC()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CKDebugTicker()), sel_init);
  qword_1E922C1C8 = (uint64_t)result;
  return result;
}

id static CKDebugTicker.shared.getter()
{
  if (qword_1E922C1D0 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1E922C1C8;

  return v0;
}

uint64_t sub_18F7A14D8()
{
  return *(void *)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) >> 1;
}

void sub_18F7A14EC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter);
  BOOL v2 = __CFADD__(v1, 1);
  unint64_t v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = v0;
    *(void *)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) = v3;
    uint64_t v5 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window;
    uint64_t v6 = *(char **)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window);
    if (v6)
    {
      uint64_t v7 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter;
      *(void *)&v6[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E12TickerWindow_tickCounter] = v3 >> 1;
      char v8 = v6;
      id v9 = (char *)objc_msgSend(v8, sel_rootViewController);
      if (v9)
      {
        BOOL v10 = v9;
        type metadata accessor for TickerViewController();
        if (swift_dynamicCastClass()) {
          sub_18F7A21FC(*(void *)&v6[v7]);
        }
      }
      else
      {
        BOOL v10 = v8;
      }

      uint64_t v11 = *(void **)(v0 + v5);
      if (v11)
      {
        uint64_t v12 = *(void **)(v0 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow);
        id v23 = *(id *)(v4 + v5);
        if (v12)
        {
          id v13 = v11;
          id v14 = v12;
          objc_msgSend(v13, sel_sizeThatFits_, 0.0, 0.0);
          double v16 = v15;
          double v18 = v17;
          objc_msgSend(v14, sel_bounds);
          double MidY = CGRectGetMidY(v25);

          double v20 = MidY + v18 * -0.5;
          double v21 = 10.0;
        }
        else
        {
          id v22 = v11;
          double v21 = 0.0;
          double v20 = 0.0;
          double v16 = 0.0;
          double v18 = 0.0;
        }
        objc_msgSend(v23, sel_setFrame_, v21, v20, v16, v18);
      }
    }
  }
}

void sub_18F7A16F8(uint64_t a1, void *a2)
{
  id v5 = objc_msgSend(self, sel_displayLinkWithTarget_selector_, v2, sel_tick);
  uint64_t v6 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink;
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink);
  *(void *)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink) = v5;

  char v8 = *(void **)(v2 + v6);
  if (!v8)
  {
    __break(1u);
    return;
  }
  id v9 = self;
  id v10 = v8;
  id v11 = objc_msgSend(v9, sel_mainRunLoop);
  objc_msgSend(v10, sel_addToRunLoop_forMode_, v11, *MEMORY[0x1E4F1C4B0]);

  uint64_t v12 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow;
  id v13 = *(void **)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow);
  *(void *)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow) = a2;
  id v14 = a2;

  id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TickerWindow()), sel_initWithWindowScene_, a1);
  objc_msgSend(v15, sel_setWindowLevel_, *MEMORY[0x1E4F43958]);
  uint64_t v16 = OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window;
  double v17 = *(void **)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window);
  *(void *)(v2 + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window) = v15;
  id v18 = v15;

  objc_msgSend(v18, sel_makeKeyAndVisible);
  id v19 = objc_allocWithZone((Class)type metadata accessor for TickerViewController());
  id v35 = v18;
  id v20 = objc_msgSend(v19, sel_init);
  objc_msgSend(v35, sel_setRootViewController_, v20);

  double v21 = *(void **)(v2 + v16);
  if (!v21)
  {
    id v22 = v35;
    goto LABEL_6;
  }
  id v22 = v35;
  id v23 = *(void **)(v2 + v12);
  if (!v23)
  {
LABEL_6:
    id v34 = v22;
    double v33 = 0.0;
    double v32 = 0.0;
    double v28 = 0.0;
    double v30 = 0.0;
    goto LABEL_7;
  }
  id v24 = v35;
  id v25 = v21;
  id v26 = v23;
  objc_msgSend(v25, sel_sizeThatFits_, 0.0, 0.0);
  double v28 = v27;
  double v30 = v29;
  objc_msgSend(v26, sel_bounds);
  double MidY = CGRectGetMidY(v37);

  double v32 = MidY + v30 * -0.5;
  double v33 = 10.0;
LABEL_7:
  objc_msgSend(v35, sel_setFrame_, v33, v32, v28, v30);
}

uint64_t type metadata accessor for TickerWindow()
{
  return self;
}

uint64_t type metadata accessor for TickerViewController()
{
  return self;
}

id CKDebugTicker.__deallocating_deinit(uint64_t a1)
{
  return sub_18F7A2640(a1, type metadata accessor for CKDebugTicker);
}

uint64_t method lookup function for CKDebugTicker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CKDebugTicker);
}

uint64_t dispatch thunk of CKDebugTicker.tickCounter.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CKDebugTicker.installUI(windowScene:parentWindow:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

char *sub_18F7A1B70()
{
  uint64_t v1 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel;
  id v2 = objc_allocWithZone(MEMORY[0x1E4F42B38]);
  unint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  *(void *)&v3[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCounter] = 0;

  v22.receiver = v3;
  v22.super_class = (Class)type metadata accessor for CKDebugTickHUDView();
  uint64_t v4 = (char *)objc_msgSendSuper2(&v22, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v5 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel;
  uint64_t v6 = *(void **)&v4[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel];
  uint64_t v7 = self;
  uint64_t v8 = *MEMORY[0x1E4F43870];
  id v9 = v4;
  id v10 = v6;
  id v11 = objc_msgSend(v7, sel_preferredFontForTextStyle_, v8);
  objc_msgSend(v10, sel_setFont_, v11);

  uint64_t v12 = *(void **)&v4[v5];
  id v13 = self;
  id v14 = v12;
  id v15 = objc_msgSend(v13, sel_whiteColor);
  objc_msgSend(v14, sel_setTextColor_, v15);

  id v16 = *(id *)&v4[v5];
  double v17 = (void *)sub_18F7B97A0();
  objc_msgSend(v16, sel_setText_, v17);

  id v18 = v9;
  id v19 = objc_msgSend(v13, sel_blackColor);
  id v20 = objc_msgSend(v19, sel_colorWithAlphaComponent_, 0.5);

  objc_msgSend(v18, sel_setBackgroundColor_, v20);
  objc_msgSend(v18, sel__setContinuousCornerRadius_, 4.0);
  objc_msgSend(v18, sel_addSubview_, *(void *)&v4[v5]);

  return v18;
}

id sub_18F7A1F98()
{
  return sub_18F7A2640(0, type metadata accessor for CKDebugTickHUDView);
}

uint64_t type metadata accessor for CKDebugTickHUDView()
{
  return self;
}

void sub_18F7A21FC(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter;
  *(void *)&v1[OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter] = a1;
  id v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    type metadata accessor for CKDebugTickHUDView();
    uint64_t v3 = swift_dynamicCastClass();
    if (v3)
    {
      uint64_t v4 = (void *)v3;
      *(void *)(v3 + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCounter) = *(void *)&v1[v2];
      uint64_t v5 = *(void **)(v3
                    + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E18CKDebugTickHUDView_tickCountLabel);
      sub_18F7BA6D0();
      uint64_t v6 = (void *)sub_18F7B97A0();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_setText_, v6);

      objc_msgSend(v4, sel_setNeedsLayout);
    }
    else
    {
    }
  }
}

id sub_18F7A2314()
{
  return sub_18F7A2640(0, type metadata accessor for TickerViewController);
}

double sub_18F7A2330(double a1, double a2)
{
  id v5 = objc_msgSend(v2, sel_rootViewController);
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    type metadata accessor for TickerViewController();
    uint64_t v8 = (void *)swift_dynamicCastClass();
    if (v8 && (id v9 = objc_msgSend(v8, sel_view)) != 0)
    {
      id v10 = v9;
      type metadata accessor for CKDebugTickHUDView();
      id v11 = (void *)swift_dynamicCastClass();
      if (v11)
      {
        objc_msgSend(v11, sel_sizeThatFits_, a1, a2);
        double v13 = v12;

        return v13 + 6.0;
      }
      else
      {
      }
    }
    else
    {
    }
  }
  return v6;
}

id sub_18F7A2624()
{
  return sub_18F7A2640(0, type metadata accessor for TickerWindow);
}

id sub_18F7A2640(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

double UIEdgeInsetsInsetRect_0(double a1)
{
  return a1 + 3.0;
}

id LinkIntentsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static LinkIntentsManager.shared.getter()
{
  if (qword_1E922AA28 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1E922AE50;

  return v0;
}

uint64_t sub_18F7A2724()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18F7A2738()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18F7A274C(void *a1)
{
  sub_18F7B5390();
  sub_18F7B5380();
  sub_18F7BA3E0();
  *(void *)(swift_allocObject() + 16) = a1;
  sub_18F7A2874();
  id v2 = a1;
  sub_18F7B5370();
  swift_release();
  swift_release();
  return sub_18F7A28B4((uint64_t)v4);
}

uint64_t sub_18F7A2830()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_18F7A2868@<X0>(void *a1@<X8>)
{
  id v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_18F7A2874()
{
  unint64_t result = qword_1E9242340;
  if (!qword_1E9242340)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9242340);
  }
  return result;
}

uint64_t sub_18F7A28B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922B6E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18F7A2A24()
{
  sub_18F7B5390();
  sub_18F7B5380();
  sub_18F7BA3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E922AAF8);
  sub_18F7B5370();
  swift_release();
  return sub_18F7A28B4((uint64_t)v1);
}

id LinkIntentsManager.init()()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkIntentsManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id LinkIntentsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LinkIntentsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for LinkIntentsManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LinkIntentsManager);
}

uint64_t dispatch thunk of LinkIntentsManager.registerMessagesNavigator(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of LinkIntentsManager.registerChatController(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LinkIntentsManager.registerDependency(detailsController:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LinkIntentsManager.purgeDependencies()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t sub_18F7A2D60()
{
  uint64_t v0 = sub_18F7B68E0();
  __swift_allocate_value_buffer(v0, qword_1E9265270);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9265270);
  sub_18F7B68B0();
  return sub_18F7B68D0();
}

void CKConversationListCell.makeTextAttachmentsForCurrentIndicatorState()()
{
  id v0 = objc_msgSend(self, sel_sharedBehaviors);
  if (!v0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_theme);

  if (!v2)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v3 = objc_msgSend(v2, sel_accessoryIndicatorTintColor);

  if (!v3) {
    id v3 = objc_msgSend(self, sel_tertiaryLabelColor);
  }
  objc_super v4 = sub_18EF32C28();
  id v5 = v3;
  sub_18F7A2F2C((uint64_t)v4, (uint64_t)v5);
  swift_bridgeObjectRelease();
}

uint64_t sub_18F7A2F2C(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v15 = MEMORY[0x1E4FBC860];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_18F7B6CA0();
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(unsigned char *)(a1 + i + 32) && *(unsigned char *)(a1 + i + 32) != 1)
      {
        id v7 = (void *)sub_18F7B97A0();
        uint64_t v8 = &selRef__systemImageNamed_;
      }
      else
      {
        id v7 = (void *)sub_18F7B97A0();
        uint64_t v8 = &selRef_systemImageNamed_;
      }
      id v9 = objc_msgSend(self, *v8, v7);

      if (v9)
      {
        uint64_t v10 = qword_1E9237AA0;
        id v11 = v9;
        if (v10 != -1) {
          swift_once();
        }
        id v12 = objc_msgSend(v11, sel_imageWithConfiguration_, qword_1E923FD98);

        if (v12)
        {
          id v13 = objc_msgSend(v12, sel_imageWithTintColor_, a2);

          if (v13)
          {
            id v14 = objc_msgSend(self, sel_textAttachmentWithImage_, v13);

            MEMORY[0x192FB7F10]();
            if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_18F7B99F0();
            }
            sub_18F7B9A20();
            sub_18F7B99E0();
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

void *initializeWithCopy for PersonPancakeView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  id v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  a1[6] = a2[6];
  sub_18F7B6CA0();
  id v7 = v4;
  id v8 = v5;
  sub_18F7B6CA0();
  return a1;
}

void *assignWithCopy for PersonPancakeView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_18F7B6CA0();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  id v7 = (void *)a1[3];
  id v8 = (void *)a2[3];
  a1[3] = v8;
  id v9 = v8;

  a1[4] = a2[4];
  a1[5] = a2[5];
  sub_18F7B6CA0();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for PersonPancakeView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

ValueMetadata *type metadata accessor for PersonPancakeView()
{
  return &type metadata for PersonPancakeView;
}

uint64_t sub_18F7A3304()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18F7A3320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v95 = a1;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242348);
  MEMORY[0x1F4188790](v81);
  v82 = (char *)&v80 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242350);
  MEMORY[0x1F4188790](v93);
  uint64_t v4 = (char *)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  id v7 = (char *)&v80 - v6;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242358);
  MEMORY[0x1F4188790](v94);
  id v9 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242360);
  MEMORY[0x1F4188790](v90);
  uint64_t v91 = (uint64_t)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242368);
  MEMORY[0x1F4188790](v96);
  v92 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242370);
  MEMORY[0x1F4188790](v89);
  uint64_t v88 = (uint64_t)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_18F7B77C0();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_18F7B9240();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  id v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242378);
  MEMORY[0x1F4188790](v87);
  double v21 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9242380);
  MEMORY[0x1F4188790](v83);
  v84 = (char **)((char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9242388);
  MEMORY[0x1F4188790](v23);
  MEMORY[0x1F4188790](v24);
  uint64_t v97 = v1;
  double v28 = *(void **)(v1 + 16);
  if (v28)
  {
    uint64_t v86 = v25;
    uint64_t v81 = (uint64_t)&v80 - v26;
    v80 = v27;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_18F81DD50;
    *(void *)(v29 + 32) = v28;
    *(void *)&long long v103 = v29;
    sub_18F7B99E0();
    uint64_t v30 = v103;
    v82 = v28;
    uint64_t v31 = sub_18F7B8BF0();
    sub_18F7B70D0();
    uint64_t v32 = v98;
    uint64_t v33 = v100;
    uint64_t v34 = v101;
    uint64_t v35 = v102;
    uint64_t v36 = sub_18F7B9170();
    v85 = v9;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v40 = v99;
    (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x1E4F3EFC8], v16);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v15, v19, v16);
    sub_18F7A41C4((uint64_t)v15, (uint64_t)&v21[*(int *)(v87 + 36)]);
    *(void *)double v21 = v32;
    *((void *)v21 + 1) = v40;
    *((void *)v21 + 2) = v33;
    *((void *)v21 + 3) = v34;
    *((void *)v21 + 4) = v35;
    *((void *)v21 + 5) = v31;
    *((_WORD *)v21 + 24) = 256;
    *((void *)v21 + 7) = v37;
    *((void *)v21 + 8) = v39;
    sub_18F7B6CA0();
    sub_18F7B5790();
    sub_18F7A4228((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_18F7B9170();
    uint64_t v43 = v42;
    uint64_t v44 = v88;
    sub_18F4AABD4((uint64_t)v21, v88, &qword_1E9242378);
    __n128 v45 = (uint64_t *)(v44 + *(int *)(v89 + 36));
    *__n128 v45 = v41;
    v45[1] = v43;
    uint64_t v46 = v84;
    sub_18F4AABD4(v44, (uint64_t)v84 + *((int *)v83 + 9), &qword_1E9242370);
    void *v46 = v30;
    sub_18F7B6CA0();
    sub_18EF27FE8(v44, &qword_1E9242370);
    sub_18EF27FE8((uint64_t)v21, &qword_1E9242378);
    swift_bridgeObjectRelease();
    sub_18F7B9170();
    sub_18F7B71C0();
    unint64_t v47 = v80;
    sub_18F4AABD4((uint64_t)v46, (uint64_t)v80, &qword_1E9242380);
    uint64_t v48 = &v47[*(int *)(v86 + 36)];
    long long v49 = v104;
    *(_OWORD *)uint64_t v48 = v103;
    *((_OWORD *)v48 + 1) = v49;
    *((_OWORD *)v48 + 2) = v105;
    sub_18EF27FE8((uint64_t)v46, &qword_1E9242380);
    id v50 = &qword_1E9242388;
    uint64_t v51 = v81;
    sub_18F4BFDAC((uint64_t)v47, v81, &qword_1E9242388);
    sub_18F4AABD4(v51, v91, &qword_1E9242388);
    swift_storeEnumTagMultiPayload();
    sub_18F7A4080(&qword_1E9242398, &qword_1E9242388, (void (*)(void))sub_18F7A3FE0);
    sub_18F7A4080(&qword_1E92423B0, &qword_1E9242350, (void (*)(void))sub_18F7A4100);
    uint64_t v52 = (uint64_t)v92;
    sub_18F7B7E00();
    sub_18F4AABD4(v52, (uint64_t)v85, &qword_1E9242368);
    swift_storeEnumTagMultiPayload();
    sub_18F7A3F1C();
    sub_18F7B7E00();

    sub_18EF27FE8(v52, &qword_1E9242368);
    uint64_t v53 = v51;
    return sub_18EF27FE8(v53, v50);
  }
  v83 = v4;
  v84 = v7;
  char v54 = *(void **)(v97 + 24);
  if (v54)
  {
    CGFloat v55 = v19;
    uint64_t v56 = v17;
    uint64_t v86 = v25;
    v80 = v54;
    uint64_t v57 = MEMORY[0x192FB70C0]();
    v85 = v9;
    uint64_t v58 = v57;
    uint64_t v59 = sub_18F7B8BF0();
    sub_18F7B70D0();
    uint64_t v60 = v98;
    uint64_t v61 = v100;
    uint64_t v62 = v101;
    uint64_t v63 = v102;
    uint64_t v64 = sub_18F7B9170();
    uint64_t v66 = v65;
    uint64_t v67 = v99;
    (*(void (**)(char *, void, uint64_t))(v56 + 104))(v55, *MEMORY[0x1E4F3EFC8], v16);
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v15, v55, v16);
    sub_18F7A41C4((uint64_t)v15, (uint64_t)&v21[*(int *)(v87 + 36)]);
    *(void *)double v21 = v60;
    *((void *)v21 + 1) = v67;
    *((void *)v21 + 2) = v61;
    *((void *)v21 + 3) = v62;
    *((void *)v21 + 4) = v63;
    *((void *)v21 + 5) = v59;
    *((_WORD *)v21 + 24) = 256;
    *((void *)v21 + 7) = v64;
    *((void *)v21 + 8) = v66;
    sub_18F7B6CA0();
    sub_18F7B5790();
    sub_18F7A4228((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v16);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v68 = sub_18F7B9170();
    uint64_t v70 = v69;
    uint64_t v71 = v88;
    sub_18F4AABD4((uint64_t)v21, v88, &qword_1E9242378);
    char v72 = (uint64_t *)(v71 + *(int *)(v89 + 36));
    *char v72 = v68;
    v72[1] = v70;
    char v73 = v82;
    sub_18F4AABD4(v71, (uint64_t)&v82[*(int *)(v81 + 36)], &qword_1E9242370);
    *(void *)char v73 = v58;
    v73[4] = 256;
    sub_18F7B5790();
    sub_18EF27FE8(v71, &qword_1E9242370);
    sub_18EF27FE8((uint64_t)v21, &qword_1E9242378);
    swift_release();
    sub_18F7B9170();
    sub_18F7B71C0();
    uint64_t v74 = (uint64_t)v83;
    sub_18F4AABD4((uint64_t)v73, (uint64_t)v83, &qword_1E9242348);
    char v75 = (_OWORD *)(v74 + *(int *)(v93 + 36));
    long long v76 = v104;
    *char v75 = v103;
    v75[1] = v76;
    v75[2] = v105;
    sub_18EF27FE8((uint64_t)v73, &qword_1E9242348);
    id v50 = &qword_1E9242350;
    uint64_t v77 = (uint64_t)v84;
    sub_18F4BFDAC(v74, (uint64_t)v84, &qword_1E9242350);
    sub_18F4AABD4(v77, v91, &qword_1E9242350);
    swift_storeEnumTagMultiPayload();
    sub_18F7A4080(&qword_1E9242398, &qword_1E9242388, (void (*)(void))sub_18F7A3FE0);
    sub_18F7A4080(&qword_1E92423B0, &qword_1E9242350, (void (*)(void))sub_18F7A4100);
    uint64_t v78 = (uint64_t)v92;
    sub_18F7B7E00();
    sub_18F4AABD4(v78, (uint64_t)v85, &qword_1E9242368);
    swift_storeEnumTagMultiPayload();
    sub_18F7A3F1C();
    sub_18F7B7E00();

    sub_18EF27FE8(v78, &qword_1E9242368);
    uint64_t v53 = v77;
    return sub_18EF27FE8(v53, v50);
  }
  swift_storeEnumTagMultiPayload();
  sub_18F7A3F1C();
  return sub_18F7B7E00();
}

unint64_t sub_18F7A3F1C()
{
  unint64_t result = qword_1E9242390;
  if (!qword_1E9242390)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9242368);
    sub_18F7A4080(&qword_1E9242398, &qword_1E9242388, (void (*)(void))sub_18F7A3FE0);
    sub_18F7A4080(&qword_1E92423B0, &qword_1E9242350, (void (*)(void))sub_18F7A4100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9242390);
  }
  return result;
}

unint64_t sub_18F7A3FE0()
{
  unint64_t result = qword_1E92423A0;
  if (!qword_1E92423A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9242380);
    sub_18F6096A4();
    sub_18EF23558(&qword_1E92423A8, &qword_1E9242370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92423A0);
  }
  return result;
}

uint64_t sub_18F7A4080(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18F7A4100()
{
  unint64_t result = qword_1E92423B8;
  if (!qword_1E92423B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9242348);
    sub_18EF23558(&qword_1E92423C0, &qword_1E92423C8);
    sub_18EF23558(&qword_1E92423A8, &qword_1E9242370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92423B8);
  }
  return result;
}

uint64_t sub_18F7A41C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18F7B77C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18F7A4228(uint64_t a1)
{
  uint64_t v2 = sub_18F7B77C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_18F7A4288()
{
  unint64_t result = qword_1E92423D0;
  if (!qword_1E92423D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92423D8);
    sub_18F7A3F1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92423D0);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_1E92648A8 == -1)
  {
    if (qword_1E92648B0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_1E92648A8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1E92648B0) {
      return _availability_version_check();
    }
  }
  if (qword_1E92648A0 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_1E92648A0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_1E9264894 > a3) {
    return 1;
  }
  return dword_1E9264894 >= a3 && dword_1E9264898 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = qword_1E92648B0;
  if (qword_1E92648B0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x1E4F143E8])
    {
      uint64_t v1 = MEMORY[0x1F4188798];
      qword_1E92648B0 = MEMORY[0x1F4188798];
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            id v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                id v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    double v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          double v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x192FBB570](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  id v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1E9264894, &dword_1E9264898);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    id v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  id v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                id v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          id v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void getTLToneIdentifierNone_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getTLToneIdentifierNone(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SMSApplicationSoundHelper.m", 34, @"%s", dlerror());

  __break(1u);
}

void getTLVibrationIdentifierNone_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getTLVibrationIdentifierNone(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SMSApplicationSoundHelper.m", 35, @"%s", dlerror());

  __break(1u);
}

void ToneLibraryLibrary_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ToneLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SMSApplicationSoundHelper.m", 32, @"%s", *a1);

  __break(1u);
}

void __getTLAlertClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getTLAlertClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SMSApplicationSoundHelper.m", 33, @"Unable to find class %s", "TLAlert");

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FindMyUICoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKDetailsController+Location.m", 25, @"%s", *a1);

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMSMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKDetailsController+Location.m", 26, @"Unable to find class %s", "MSMessage");

  __break(1u);
}

void __getDCIMImageWellUtilitiesClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotoLibraryServicesCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKPhotoLibraryUtilities.m", 16, @"%s", *a1);

  __break(1u);
}

void __getDCIMImageWellUtilitiesClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getDCIMImageWellUtilitiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKPhotoLibraryUtilities.m", 17, @"Unable to find class %s", "DCIMImageWellUtilities");

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_1_0(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FindMyUICoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKChatController.m", 353, @"%s", *a1);

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_2_0()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getMSMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatController.m", 354, @"Unable to find class %s", "MSMessage");

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *UserSafetyUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKChatController.m", 464, @"%s", *a1);

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getUSUIInterventionViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatController.m", 465, @"Unable to find class %s", "USUIInterventionViewController");

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *VoiceTriggerLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKSentWithSiriViewController.m", 23, @"%s", *a1);

  __break(1u);
}

void __getVTPreferencesClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getVTPreferencesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKSentWithSiriViewController.m", 24, @"Unable to find class %s", "VTPreferences");

  __break(1u);
}

void __getWorkoutKitXPCServiceHelperClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *WorkoutKitServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKWorkoutUtilities.m", 23, @"%s", *a1);

  __break(1u);
}

void __getWorkoutKitXPCServiceHelperClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWorkoutKitXPCServiceHelperClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKWorkoutUtilities.m", 24, @"Unable to find class %s", "WorkoutKitXPCServiceHelper");

  __break(1u);
}

void __getWKUIRemoteViewServiceAdaptorClass_block_invoke_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *WorkoutKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKWorkoutUtilities.m", 34, @"%s", *a1);

  __break(1u);
}

void __getWKUIRemoteViewServiceAdaptorClass_block_invoke_cold_2()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWKUIRemoteViewServiceAdaptorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKWorkoutUtilities.m", 35, @"Unable to find class %s", "WKUIRemoteViewServiceAdaptor");

  __break(1u);
}

void CoreDuetLibrary_cold_1(void *a1)
{
  BOOL v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKSMSComposeViewServiceController.m", 90, @"%s", *a1);

  __break(1u);
}

void CKLinkAndCreateAppendedVideoTransfer_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F6D368];
  int v1 = 138412546;
  uint64_t v2 = v0;
  __int16 v3 = 2080;
  uint64_t v4 = "transcoderOptions";
  _os_log_error_impl(&dword_18EF18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v1, 0x16u);
}

void _CKRegistrationFailureHandleDependentValueChanged_cold_1(char a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Sending notification: WaitingForCloud %d, UpdateAppleID: %d", (uint8_t *)v3, 0xEu);
}

void __getFMUILocationDetailViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFMUILocationDetailViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKDetailsController.m", 184, @"Unable to find class %s", "FMUILocationDetailViewController");

  __break(1u);
}

void FindMyUICoreLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  __int16 v3 = [NSString stringWithUTF8String:"void *FindMyUICoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKDetailsController.m", 182, @"%s", *a1);

  __break(1u);
}

void __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFMUILocationDetailViewControllerViewOptionsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKDetailsController.m", 185, @"Unable to find class %s", "FMUILocationDetailViewControllerViewOptions");

  __break(1u);
}

void __CKMomentShareURLForMediaObjects_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "CKMomentShareURLForMediaObjects: media objects have different moment URLs", v1, 2u);
}

void CKSaveMomentShareFromURL_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Error fetching moment share: %@", (uint8_t *)&v2, 0xCu);
}

void CKSaveMomentShareFromURL_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "_saveMomentShareWithContext: Didn't find indexes for assets %{public}@", (uint8_t *)&v2, 0xCu);
}

void CKSaveMomentShareFromURL_cold_3(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 dataSource];
  int v5 = 138543362;
  id v6 = (id)objc_opt_class();
  id v4 = v6;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "_saveMomentShareWithContext: Data source snapshot is not of PXAssetsDataSource type: %{public}@", (uint8_t *)&v5, 0xCu);
}

void DataDetectorsUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DataDetectorsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKTextMessagePartChatItem.m", 63, @"%s", *a1);

  __break(1u);
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKTapToRadar.m", 19, @"%s", *a1);

  __break(1u);
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLSApplicationWorkspaceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKTapToRadar.m", 20, @"Unable to find class %s", "LSApplicationWorkspace");

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FinanceKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKChatController_QuickLook.m", 67, @"%s", *a1);

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFKOrderImportPreviewControllerProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatController_QuickLook.m", 68, @"Unable to find class %s", "FKOrderImportPreviewControllerProvider");

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FinanceKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKChatController_QuickLook.m", 71, @"%s", *a1);

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFKOrderMessagesPreviewMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatController_QuickLook.m", 72, @"Unable to find class %s", "FKOrderMessagesPreviewMetadata");

  __break(1u);
}

void CKSpotlightPreviewCachesFileURL_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Unable to create preview caches directories with error: %@", (uint8_t *)&v4, 0xCu);
}

void __getPLLocalizedCountDescriptionSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *PhotoLibraryServicesCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKPhotosGridFooterViewModel.m", 27, @"%s", *a1);

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FinanceKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKOrderMediaObject.m", 39, @"%s", *a1);

  __break(1u);
}

void __getFKOrderMessagesPreviewMetadataClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFKOrderMessagesPreviewMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKOrderMediaObject.m", 40, @"Unable to find class %s", "FKOrderMessagesPreviewMetadata");

  __break(1u);
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAFPreferencesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKMessageEntryView.m", 143, @"Unable to find class %s", "AFPreferences");

  __break(1u);
}

void AssistantServicesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AssistantServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKMessageEntryView.m", 141, @"%s", *a1);

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *UserSafetyUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKTranscriptCollectionViewController+UserSafety.m", 28, @"%s", *a1);

  __break(1u);
}

void __getUSUIInterventionViewControllerClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getUSUIInterventionViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKTranscriptCollectionViewController+UserSafety.m", 29, @"Unable to find class %s", "USUIInterventionViewController");

  __break(1u);
}

void __getSCUIMoreHelpContextMenuClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSCUIMoreHelpContextMenuClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKTranscriptCollectionViewController+UserSafety.m", 35, @"Unable to find class %s", "SCUIMoreHelpContextMenu");

  __break(1u);
}

void SensitiveContentAnalysisUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SensitiveContentAnalysisUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKTranscriptCollectionViewController+UserSafety.m", 32, @"%s", *a1);

  __break(1u);
}

void __getSCUIMoreHelpMenuClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSCUIMoreHelpMenuClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKTranscriptCollectionViewController+UserSafety.m", 34, @"Unable to find class %s", "SCUIMoreHelpMenu");

  __break(1u);
}

void __getSCUIReportEvidenceClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSCUIReportEvidenceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKTranscriptCollectionViewController+UserSafety.m", 33, @"Unable to find class %s", "SCUIReportEvidence");

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_1_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FindMyUICoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKDetailsControllerAdapter.m", 25, @"%s", *a1);

  __break(1u);
}

void __getMSMessageClass_block_invoke_cold_2_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getMSMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKDetailsControllerAdapter.m", 26, @"Unable to find class %s", "MSMessage");

  __break(1u);
}

void __getSCUIMoreHelpContextMenuClass_block_invoke_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SensitiveContentAnalysisUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKObscurableBalloonView.m", 21, @"%s", *a1);

  __break(1u);
}

void __getSCUIMoreHelpContextMenuClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSCUIMoreHelpContextMenuClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKObscurableBalloonView.m", 22, @"Unable to find class %s", "SCUIMoreHelpContextMenu");

  __break(1u);
}

void __getBKSHIDEventDeferringTokenClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BackBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKCamPhysicalCaptureNotifier.m", 25, @"%s", *a1);

  __break(1u);
}

void __getBKSHIDEventDeferringTokenClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getBKSHIDEventDeferringTokenClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKCamPhysicalCaptureNotifier.m", 26, @"Unable to find class %s", "BKSHIDEventDeferringToken");

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FinanceKitUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKWalletItemSearchController.m", 38, @"%s", *a1);

  __break(1u);
}

void __getFKOrderImportPreviewControllerProviderClass_block_invoke_cold_2_0()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFKOrderImportPreviewControllerProviderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKWalletItemSearchController.m", 39, @"Unable to find class %s", "FKOrderImportPreviewControllerProvider");

  __break(1u);
}

void __getKTStatusClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *TransparencyLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKKeyTransparencyErrorUtilities.m", 39, @"%s", *a1);

  __break(1u);
}

void __getKTStatusClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getKTStatusClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKKeyTransparencyErrorUtilities.m", 41, @"Unable to find class %s", "KTStatus");

  __break(1u);
}

void __getTUIKTReportToAppleContextClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getTUIKTReportToAppleContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKKeyTransparencyErrorUtilities.m", 42, @"Unable to find class %s", "TUIKTReportToAppleContext");

  __break(1u);
}

void TransparencyUILibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *TransparencyUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKKeyTransparencyErrorUtilities.m", 40, @"%s", *a1);

  __break(1u);
}

void __getTUIKTReportToAppleViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getTUIKTReportToAppleViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKKeyTransparencyErrorUtilities.m", 44, @"Unable to find class %s", "TUIKTReportToAppleViewController");

  __break(1u);
}

void __getTUIKTConversationViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getTUIKTConversationViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKKeyTransparencyErrorUtilities.m", 43, @"Unable to find class %s", "TUIKTConversationViewController");

  __break(1u);
}

void __getDDActionClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDActionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKChatInputController_TextInputPayloads.m", 33, @"Unable to find class %s", "DDAction");

  __break(1u);
}

void DataDetectorsUILibrary_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DataDetectorsUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKChatInputController_TextInputPayloads.m", 32, @"%s", *a1);

  __break(1u);
}

void __getSTManagementStateClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSTManagementStateClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKCommSafetyAuthenticationController.m", 19, @"Unable to find class %s", "STManagementState");

  __break(1u);
}

void ScreenTimeCoreLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ScreenTimeCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CKCommSafetyAuthenticationController.m", 17, @"%s", *a1);

  __break(1u);
}

void __getSTCommunicationClientClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getSTCommunicationClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKCommSafetyAuthenticationController.m", 18, @"Unable to find class %s", "STCommunicationClient");

  __break(1u);
}

uint64_t sub_18F7B5330()
{
  return MEMORY[0x1F40D3A18]();
}

uint64_t sub_18F7B5360()
{
  return MEMORY[0x1F40D3AB0]();
}

uint64_t sub_18F7B5370()
{
  return MEMORY[0x1F40D3AF0]();
}

uint64_t sub_18F7B5380()
{
  return MEMORY[0x1F40D3B10]();
}

uint64_t sub_18F7B5390()
{
  return MEMORY[0x1F40D3B20]();
}

uint64_t sub_18F7B53C0()
{
  return MEMORY[0x1F40D3C18]();
}

uint64_t sub_18F7B53D0()
{
  return MEMORY[0x1F40D3C40]();
}

uint64_t sub_18F7B53E0()
{
  return MEMORY[0x1F40D3C48]();
}

uint64_t sub_18F7B53F0()
{
  return MEMORY[0x1F40D3C60]();
}

uint64_t sub_18F7B5400()
{
  return MEMORY[0x1F40D3C88]();
}

uint64_t sub_18F7B5420()
{
  return MEMORY[0x1F40D3D10]();
}

uint64_t sub_18F7B5430()
{
  return MEMORY[0x1F40D3D20]();
}

uint64_t sub_18F7B5440()
{
  return MEMORY[0x1F40D3D30]();
}

uint64_t sub_18F7B5480()
{
  return MEMORY[0x1F40D3DA0]();
}

uint64_t sub_18F7B5490()
{
  return MEMORY[0x1F40D3DB0]();
}

uint64_t sub_18F7B54A0()
{
  return MEMORY[0x1F40D3DB8]();
}

uint64_t sub_18F7B54B0()
{
  return MEMORY[0x1F40D3DC0]();
}

uint64_t sub_18F7B54C0()
{
  return MEMORY[0x1F40D3DC8]();
}

uint64_t sub_18F7B54D0()
{
  return MEMORY[0x1F40D3DD0]();
}

uint64_t sub_18F7B54E0()
{
  return MEMORY[0x1F40D3DF8]();
}

uint64_t sub_18F7B54F0()
{
  return MEMORY[0x1F40D3E00]();
}

uint64_t sub_18F7B5500()
{
  return MEMORY[0x1F40D3E08]();
}

uint64_t sub_18F7B5510()
{
  return MEMORY[0x1F40D3E10]();
}

uint64_t sub_18F7B5520()
{
  return MEMORY[0x1F40D3E18]();
}

uint64_t sub_18F7B5530()
{
  return MEMORY[0x1F40D3E20]();
}

uint64_t sub_18F7B5540()
{
  return MEMORY[0x1F40D3E28]();
}

uint64_t sub_18F7B5550()
{
  return MEMORY[0x1F40D3E30]();
}

uint64_t sub_18F7B5560()
{
  return MEMORY[0x1F40D3E40]();
}

uint64_t sub_18F7B5570()
{
  return MEMORY[0x1F40D3E58]();
}

uint64_t sub_18F7B5580()
{
  return MEMORY[0x1F40D3E68]();
}

uint64_t sub_18F7B5590()
{
  return MEMORY[0x1F40D3E88]();
}

uint64_t sub_18F7B55A0()
{
  return MEMORY[0x1F40D3E98]();
}

uint64_t sub_18F7B55B0()
{
  return MEMORY[0x1F40D3EF8]();
}

uint64_t sub_18F7B55C0()
{
  return MEMORY[0x1F40D3F08]();
}

uint64_t sub_18F7B55D0()
{
  return MEMORY[0x1F40D3F20]();
}

uint64_t sub_18F7B55E0()
{
  return MEMORY[0x1F40D3F28]();
}

uint64_t sub_18F7B55F0()
{
  return MEMORY[0x1F40D3F38]();
}

uint64_t sub_18F7B5600()
{
  return MEMORY[0x1F40D3F50]();
}

uint64_t sub_18F7B5610()
{
  return MEMORY[0x1F40D3F60]();
}

uint64_t sub_18F7B5620()
{
  return MEMORY[0x1F40D3F70]();
}

uint64_t sub_18F7B5630()
{
  return MEMORY[0x1F40D3F90]();
}

uint64_t sub_18F7B5640()
{
  return MEMORY[0x1F40D3F98]();
}

uint64_t sub_18F7B5650()
{
  return MEMORY[0x1F40D3FB8]();
}

uint64_t sub_18F7B5660()
{
  return MEMORY[0x1F40D3FC0]();
}

uint64_t sub_18F7B5670()
{
  return MEMORY[0x1F40D3FE0]();
}

uint64_t sub_18F7B5680()
{
  return MEMORY[0x1F40D4080]();
}

uint64_t sub_18F7B5690()
{
  return MEMORY[0x1F40D4090]();
}

uint64_t sub_18F7B56A0()
{
  return MEMORY[0x1F40D40A0]();
}

uint64_t sub_18F7B56B0()
{
  return MEMORY[0x1F40D40B8]();
}

uint64_t sub_18F7B56C0()
{
  return MEMORY[0x1F40D40C0]();
}

uint64_t sub_18F7B56D0()
{
  return MEMORY[0x1F40D40E0]();
}

uint64_t sub_18F7B56E0()
{
  return MEMORY[0x1F40D40E8]();
}

uint64_t sub_18F7B56F0()
{
  return MEMORY[0x1F40D4120]();
}

uint64_t sub_18F7B5700()
{
  return MEMORY[0x1F40D4140]();
}

uint64_t sub_18F7B5710()
{
  return MEMORY[0x1F40D4160]();
}

uint64_t sub_18F7B5720()
{
  return MEMORY[0x1F40D4178]();
}

uint64_t sub_18F7B5730()
{
  return MEMORY[0x1F40D4198]();
}

uint64_t sub_18F7B5740()
{
  return MEMORY[0x1F40D41B8]();
}

uint64_t sub_18F7B5750()
{
  return MEMORY[0x1F40D41D0]();
}

uint64_t sub_18F7B5760()
{
  return MEMORY[0x1F40D41F0]();
}

uint64_t sub_18F7B5770()
{
  return MEMORY[0x1F40D4218]();
}

uint64_t sub_18F7B5780()
{
  return MEMORY[0x1F40D4228]();
}

uint64_t sub_18F7B5790()
{
  return MEMORY[0x1F40D4268]();
}

uint64_t sub_18F7B57A0()
{
  return MEMORY[0x1F40D4270]();
}

uint64_t sub_18F7B57B0()
{
  return MEMORY[0x1F40D4288]();
}

uint64_t sub_18F7B57C0()
{
  return MEMORY[0x1F40D4290]();
}

uint64_t sub_18F7B57D0()
{
  return MEMORY[0x1F40D42A0]();
}

uint64_t sub_18F7B57E0()
{
  return MEMORY[0x1F40D42B0]();
}

uint64_t sub_18F7B57F0()
{
  return MEMORY[0x1F40D42C8]();
}

uint64_t sub_18F7B5800()
{
  return MEMORY[0x1F40D42D8]();
}

uint64_t sub_18F7B5810()
{
  return MEMORY[0x1F40D42E0]();
}

uint64_t sub_18F7B5820()
{
  return MEMORY[0x1F40D42F8]();
}

uint64_t sub_18F7B5830()
{
  return MEMORY[0x1F40D4300]();
}

uint64_t sub_18F7B5840()
{
  return MEMORY[0x1F40D4318]();
}

uint64_t sub_18F7B5850()
{
  return MEMORY[0x1F40D4328]();
}

uint64_t sub_18F7B5860()
{
  return MEMORY[0x1F40D4330]();
}

uint64_t sub_18F7B5870()
{
  return MEMORY[0x1F40D4340]();
}

uint64_t sub_18F7B5880()
{
  return MEMORY[0x1F40D4358]();
}

uint64_t sub_18F7B5890()
{
  return MEMORY[0x1F40D4360]();
}

uint64_t sub_18F7B58A0()
{
  return MEMORY[0x1F40D4370]();
}

uint64_t sub_18F7B58B0()
{
  return MEMORY[0x1F40D4388]();
}

uint64_t sub_18F7B58C0()
{
  return MEMORY[0x1F40D4398]();
}

uint64_t sub_18F7B58D0()
{
  return MEMORY[0x1F40D43A8]();
}

uint64_t sub_18F7B58E0()
{
  return MEMORY[0x1F40D43C8]();
}

uint64_t sub_18F7B58F0()
{
  return MEMORY[0x1F40D43D8]();
}

uint64_t sub_18F7B5900()
{
  return MEMORY[0x1F40D4430]();
}

uint64_t sub_18F7B5940()
{
  return MEMORY[0x1F40D44D0]();
}

uint64_t sub_18F7B5950()
{
  return MEMORY[0x1F40D44D8]();
}

uint64_t sub_18F7B5980()
{
  return MEMORY[0x1F40D4540]();
}

uint64_t sub_18F7B5990()
{
  return MEMORY[0x1F40D4558]();
}

uint64_t sub_18F7B59A0()
{
  return MEMORY[0x1F40D45B0]();
}

uint64_t sub_18F7B59B0()
{
  return MEMORY[0x1F4104C60]();
}

uint64_t sub_18F7B59C0()
{
  return MEMORY[0x1F40D45D8]();
}

uint64_t sub_18F7B59D0()
{
  return MEMORY[0x1F40D45E0]();
}

uint64_t sub_18F7B59E0()
{
  return MEMORY[0x1F40D45F0]();
}

uint64_t sub_18F7B59F0()
{
  return MEMORY[0x1F40D45F8]();
}

uint64_t sub_18F7B5A00()
{
  return MEMORY[0x1F40D4608]();
}

uint64_t sub_18F7B5A10()
{
  return MEMORY[0x1F40D4620]();
}

uint64_t sub_18F7B5A20()
{
  return MEMORY[0x1F40D4650]();
}

uint64_t sub_18F7B5A40()
{
  return MEMORY[0x1F40D46B0]();
}

uint64_t sub_18F7B5A50()
{
  return MEMORY[0x1F40D46E0]();
}

uint64_t sub_18F7B5A60()
{
  return MEMORY[0x1F40D4708]();
}

uint64_t sub_18F7B5A70()
{
  return MEMORY[0x1F40D4720]();
}

uint64_t sub_18F7B5A80()
{
  return MEMORY[0x1F40D4730]();
}

uint64_t sub_18F7B5A90()
{
  return MEMORY[0x1F40D4750]();
}

uint64_t sub_18F7B5AA0()
{
  return MEMORY[0x1F40D4798]();
}

uint64_t sub_18F7B5AB0()
{
  return MEMORY[0x1F40D47A8]();
}

uint64_t sub_18F7B5AC0()
{
  return MEMORY[0x1F40D47C0]();
}

uint64_t sub_18F7B5AD0()
{
  return MEMORY[0x1F40D47D0]();
}

uint64_t sub_18F7B5B10()
{
  return MEMORY[0x1F40D4820]();
}

uint64_t sub_18F7B5B20()
{
  return MEMORY[0x1F40D4840]();
}

uint64_t sub_18F7B5B30()
{
  return MEMORY[0x1F40D4848]();
}

uint64_t sub_18F7B5B40()
{
  return MEMORY[0x1F40D4850]();
}

uint64_t sub_18F7B5B50()
{
  return MEMORY[0x1F40D4858]();
}

uint64_t sub_18F7B5B60()
{
  return MEMORY[0x1F40D4860]();
}

uint64_t sub_18F7B5B70()
{
  return MEMORY[0x1F40D4888]();
}

uint64_t sub_18F7B5B80()
{
  return MEMORY[0x1F40D48B8]();
}

uint64_t sub_18F7B5B90()
{
  return MEMORY[0x1F40D48D0]();
}

uint64_t sub_18F7B5BA0()
{
  return MEMORY[0x1F40D4920]();
}

uint64_t sub_18F7B5BB0()
{
  return MEMORY[0x1F40D4948]();
}

uint64_t sub_18F7B5BC0()
{
  return MEMORY[0x1F40D4958]();
}

uint64_t sub_18F7B5BE0()
{
  return MEMORY[0x1F40D49B8]();
}

uint64_t sub_18F7B5BF0()
{
  return MEMORY[0x1F40D49F8]();
}

uint64_t sub_18F7B5C00()
{
  return MEMORY[0x1F40D4A00]();
}

uint64_t sub_18F7B5C10()
{
  return MEMORY[0x1F40D4A08]();
}

uint64_t sub_18F7B5C30()
{
  return MEMORY[0x1F40D4A40]();
}

uint64_t sub_18F7B5C40()
{
  return MEMORY[0x1F40E2E18]();
}

uint64_t sub_18F7B5C50()
{
  return MEMORY[0x1F40E2FC0]();
}

uint64_t sub_18F7B5C60()
{
  return MEMORY[0x1F40E3360]();
}

uint64_t sub_18F7B5C70()
{
  return MEMORY[0x1F40E33E0]();
}

uint64_t sub_18F7B5C80()
{
  return MEMORY[0x1F40E3428]();
}

uint64_t sub_18F7B5C90()
{
  return MEMORY[0x1F40E34A8]();
}

uint64_t sub_18F7B5CA0()
{
  return MEMORY[0x1F40E34B8]();
}

uint64_t sub_18F7B5CB0()
{
  return MEMORY[0x1F40E34C8]();
}

uint64_t sub_18F7B5CC0()
{
  return MEMORY[0x1F40E34E0]();
}

uint64_t sub_18F7B5CD0()
{
  return MEMORY[0x1F40E3528]();
}

uint64_t sub_18F7B5CE0()
{
  return MEMORY[0x1F40E3538]();
}

uint64_t sub_18F7B5CF0()
{
  return MEMORY[0x1F40E3548]();
}

uint64_t sub_18F7B5D00()
{
  return MEMORY[0x1F40E3558]();
}

uint64_t sub_18F7B5D10()
{
  return MEMORY[0x1F40E3580]();
}

uint64_t sub_18F7B5D20()
{
  return MEMORY[0x1F40E3588]();
}

uint64_t sub_18F7B5D30()
{
  return MEMORY[0x1F40E35A0]();
}

uint64_t sub_18F7B5D40()
{
  return MEMORY[0x1F40E35B8]();
}

uint64_t sub_18F7B5D50()
{
  return MEMORY[0x1F40E35E0]();
}

uint64_t sub_18F7B5D60()
{
  return MEMORY[0x1F40E3678]();
}

uint64_t sub_18F7B5D70()
{
  return MEMORY[0x1F40E36E0]();
}

uint64_t sub_18F7B5D80()
{
  return MEMORY[0x1F40E3768]();
}

uint64_t sub_18F7B5D90()
{
  return MEMORY[0x1F40E37B0]();
}

uint64_t sub_18F7B5DA0()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_18F7B5DB0()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_18F7B5DC0()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_18F7B5DD0()
{
  return MEMORY[0x1F40E38C8]();
}

uint64_t sub_18F7B5DE0()
{
  return MEMORY[0x1F40E38F0]();
}

uint64_t sub_18F7B5DF0()
{
  return MEMORY[0x1F40E3918]();
}

uint64_t sub_18F7B5E00()
{
  return MEMORY[0x1F40E3930]();
}

uint64_t sub_18F7B5E10()
{
  return MEMORY[0x1F40E3968]();
}

uint64_t sub_18F7B5E20()
{
  return MEMORY[0x1F40E3980]();
}

uint64_t sub_18F7B5E30()
{
  return MEMORY[0x1F40E39A8]();
}

uint64_t sub_18F7B5E40()
{
  return MEMORY[0x1F40E39D0]();
}

uint64_t sub_18F7B5E50()
{
  return MEMORY[0x1F40E3A08]();
}

uint64_t sub_18F7B5E60()
{
  return MEMORY[0x1F40E3A18]();
}

uint64_t sub_18F7B5E70()
{
  return MEMORY[0x1F40E3A38]();
}

uint64_t sub_18F7B5E80()
{
  return MEMORY[0x1F40E3A60]();
}

uint64_t sub_18F7B5E90()
{
  return MEMORY[0x1F41025D0]();
}

uint64_t sub_18F7B5EA0()
{
  return MEMORY[0x1F41025D8]();
}

uint64_t sub_18F7B5EB0()
{
  return MEMORY[0x1F40E3C08]();
}

uint64_t sub_18F7B5EC0()
{
  return MEMORY[0x1F40E3C30]();
}

uint64_t sub_18F7B5ED0()
{
  return MEMORY[0x1F40E3EA8]();
}

uint64_t sub_18F7B5EE0()
{
  return MEMORY[0x1F40E3F08]();
}

uint64_t sub_18F7B5EF0()
{
  return MEMORY[0x1F40E3F50]();
}

uint64_t sub_18F7B5F00()
{
  return MEMORY[0x1F40E4020]();
}

uint64_t sub_18F7B5F10()
{
  return MEMORY[0x1F40E4098]();
}

uint64_t sub_18F7B5F20()
{
  return MEMORY[0x1F40E42D0]();
}

uint64_t sub_18F7B5F30()
{
  return MEMORY[0x1F40E42E8]();
}

uint64_t sub_18F7B5F40()
{
  return MEMORY[0x1F40E4318]();
}

uint64_t sub_18F7B5F50()
{
  return MEMORY[0x1F40E4360]();
}

uint64_t sub_18F7B5F60()
{
  return MEMORY[0x1F40E43B8]();
}

uint64_t sub_18F7B5F70()
{
  return MEMORY[0x1F40E43C8]();
}

uint64_t sub_18F7B5F80()
{
  return MEMORY[0x1F40E4458]();
}

uint64_t sub_18F7B5F90()
{
  return MEMORY[0x1F41025E0]();
}

uint64_t sub_18F7B5FA0()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_18F7B5FB0()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_18F7B5FC0()
{
  return MEMORY[0x1F40E4578]();
}

uint64_t sub_18F7B5FD0()
{
  return MEMORY[0x1F40E4580]();
}

uint64_t sub_18F7B5FE0()
{
  return MEMORY[0x1F40E4598]();
}

uint64_t sub_18F7B5FF0()
{
  return MEMORY[0x1F40E45B0]();
}

uint64_t sub_18F7B6000()
{
  return MEMORY[0x1F40E45D0]();
}

uint64_t sub_18F7B6010()
{
  return MEMORY[0x1F40E48E0]();
}

uint64_t sub_18F7B6020()
{
  return MEMORY[0x1F40E48F0]();
}

uint64_t sub_18F7B6030()
{
  return MEMORY[0x1F40E4940]();
}

uint64_t sub_18F7B6040()
{
  return MEMORY[0x1F40E4968]();
}

uint64_t sub_18F7B6050()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_18F7B6060()
{
  return MEMORY[0x1F40E49F0]();
}

uint64_t sub_18F7B6070()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_18F7B6080()
{
  return MEMORY[0x1F40E4AB8]();
}

uint64_t sub_18F7B6090()
{
  return MEMORY[0x1F40E4B18]();
}

uint64_t sub_18F7B60A0()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_18F7B60B0()
{
  return MEMORY[0x1F40E4C38]();
}

uint64_t sub_18F7B60C0()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_18F7B60D0()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_18F7B60E0()
{
  return MEMORY[0x1F40E4E08]();
}

uint64_t sub_18F7B60F0()
{
  return MEMORY[0x1F40E5070]();
}

uint64_t sub_18F7B6100()
{
  return MEMORY[0x1F40E5080]();
}

uint64_t sub_18F7B6110()
{
  return MEMORY[0x1F40E50B0]();
}

uint64_t sub_18F7B6120()
{
  return MEMORY[0x1F40E5150]();
}

uint64_t sub_18F7B6130()
{
  return MEMORY[0x1F40E5190]();
}

uint64_t sub_18F7B6140()
{
  return MEMORY[0x1F40E51A0]();
}

uint64_t sub_18F7B6150()
{
  return MEMORY[0x1F40E51B0]();
}

uint64_t sub_18F7B6160()
{
  return MEMORY[0x1F40E51E8]();
}

uint64_t sub_18F7B6170()
{
  return MEMORY[0x1F40E52B8]();
}

uint64_t sub_18F7B6180()
{
  return MEMORY[0x1F40E52C8]();
}

uint64_t sub_18F7B6190()
{
  return MEMORY[0x1F40E52E8]();
}

uint64_t sub_18F7B61A0()
{
  return MEMORY[0x1F40E52F8]();
}

uint64_t sub_18F7B61B0()
{
  return MEMORY[0x1F40E5330]();
}

uint64_t sub_18F7B61C0()
{
  return MEMORY[0x1F40E5370]();
}

uint64_t sub_18F7B61D0()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_18F7B61E0()
{
  return MEMORY[0x1F40E53A8]();
}

uint64_t sub_18F7B61F0()
{
  return MEMORY[0x1F40E53F0]();
}

uint64_t sub_18F7B6200()
{
  return MEMORY[0x1F40E5400]();
}

uint64_t sub_18F7B6210()
{
  return MEMORY[0x1F40E5440]();
}

uint64_t sub_18F7B6220()
{
  return MEMORY[0x1F40E5450]();
}

uint64_t sub_18F7B6230()
{
  return MEMORY[0x1F40E5640]();
}

uint64_t sub_18F7B6240()
{
  return MEMORY[0x1F40E5730]();
}

uint64_t sub_18F7B6250()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_18F7B6260()
{
  return MEMORY[0x1F40E58D8]();
}

uint64_t sub_18F7B6270()
{
  return MEMORY[0x1F40E5900]();
}

uint64_t sub_18F7B6280()
{
  return MEMORY[0x1F40E5928]();
}

uint64_t sub_18F7B6290()
{
  return MEMORY[0x1F40E5940]();
}

uint64_t sub_18F7B62A0()
{
  return MEMORY[0x1F40E5970]();
}

uint64_t sub_18F7B62B0()
{
  return MEMORY[0x1F40E59A8]();
}

uint64_t sub_18F7B62C0()
{
  return MEMORY[0x1F40E59D8]();
}

uint64_t sub_18F7B62D0()
{
  return MEMORY[0x1F40E5A20]();
}

uint64_t sub_18F7B62E0()
{
  return MEMORY[0x1F40E5A28]();
}

uint64_t sub_18F7B62F0()
{
  return MEMORY[0x1F40E5A38]();
}

uint64_t sub_18F7B6300()
{
  return MEMORY[0x1F40E5A50]();
}

uint64_t sub_18F7B6310()
{
  return MEMORY[0x1F40E5A70]();
}

uint64_t sub_18F7B6320()
{
  return MEMORY[0x1F40E5AB0]();
}

uint64_t sub_18F7B6330()
{
  return MEMORY[0x1F40E5AF8]();
}

uint64_t sub_18F7B6340()
{
  return MEMORY[0x1F40E5B08]();
}

uint64_t sub_18F7B6350()
{
  return MEMORY[0x1F40E5B10]();
}

uint64_t sub_18F7B6360()
{
  return MEMORY[0x1F40E5B98]();
}

uint64_t sub_18F7B6370()
{
  return MEMORY[0x1F40E5BB8]();
}

uint64_t sub_18F7B6380()
{
  return MEMORY[0x1F40E5C10]();
}

uint64_t sub_18F7B6390()
{
  return MEMORY[0x1F40E5C48]();
}

uint64_t sub_18F7B63A0()
{
  return MEMORY[0x1F40E5C60]();
}

uint64_t sub_18F7B63B0()
{
  return MEMORY[0x1F40E5CA0]();
}

uint64_t sub_18F7B63C0()
{
  return MEMORY[0x1F40E5CB0]();
}

uint64_t sub_18F7B63D0()
{
  return MEMORY[0x1F40E5E70]();
}

uint64_t sub_18F7B63E0()
{
  return MEMORY[0x1F40E5E98]();
}

uint64_t sub_18F7B63F0()
{
  return MEMORY[0x1F4102600]();
}

uint64_t sub_18F7B6400()
{
  return MEMORY[0x1F4102608]();
}

uint64_t sub_18F7B6410()
{
  return MEMORY[0x1F40E5EF8]();
}

uint64_t sub_18F7B6420()
{
  return MEMORY[0x1F4187530]();
}

uint64_t sub_18F7B6430()
{
  return MEMORY[0x1F4187548]();
}

uint64_t sub_18F7B6440()
{
  return MEMORY[0x1F4187558]();
}

uint64_t sub_18F7B6450()
{
  return MEMORY[0x1F4187560]();
}

uint64_t sub_18F7B6460()
{
  return MEMORY[0x1F4187570]();
}

uint64_t sub_18F7B6470()
{
  return MEMORY[0x1F4187580]();
}

uint64_t sub_18F7B6480()
{
  return MEMORY[0x1F40E5F48]();
}

uint64_t sub_18F7B6490()
{
  return MEMORY[0x1F40E5F58]();
}

uint64_t sub_18F7B64A0()
{
  return MEMORY[0x1F40E5F68]();
}

uint64_t sub_18F7B64B0()
{
  return MEMORY[0x1F40E5F78]();
}

uint64_t sub_18F7B64C0()
{
  return MEMORY[0x1F40E5F88]();
}

uint64_t sub_18F7B64D0()
{
  return MEMORY[0x1F4186950]();
}

uint64_t sub_18F7B64E0()
{
  return MEMORY[0x1F4186960]();
}

uint64_t sub_18F7B64F0()
{
  return MEMORY[0x1F4186970]();
}

uint64_t sub_18F7B6500()
{
  return MEMORY[0x1F4117BF8]();
}

uint64_t sub_18F7B6510()
{
  return MEMORY[0x1F4117C00]();
}

uint64_t sub_18F7B6520()
{
  return MEMORY[0x1F4112B60]();
}

uint64_t sub_18F7B6530()
{
  return MEMORY[0x1F4112B68]();
}

uint64_t sub_18F7B6540()
{
  return MEMORY[0x1F4112BB8]();
}

uint64_t sub_18F7B6550()
{
  return MEMORY[0x1F4112BC0]();
}

uint64_t sub_18F7B6560()
{
  return MEMORY[0x1F4112BC8]();
}

uint64_t sub_18F7B6570()
{
  return MEMORY[0x1F4112BD0]();
}

uint64_t sub_18F7B6580()
{
  return MEMORY[0x1F4112BD8]();
}

uint64_t sub_18F7B6590()
{
  return MEMORY[0x1F4123C80]();
}

uint64_t sub_18F7B65A0()
{
  return MEMORY[0x1F4123C88]();
}

uint64_t sub_18F7B65B0()
{
  return MEMORY[0x1F4123D90]();
}

uint64_t sub_18F7B65C0()
{
  return MEMORY[0x1F4123D98]();
}

uint64_t sub_18F7B65D0()
{
  return MEMORY[0x1F4123DA0]();
}

uint64_t sub_18F7B65E0()
{
  return MEMORY[0x1F4123DA8]();
}

uint64_t sub_18F7B65F0()
{
  return MEMORY[0x1F4123DB0]();
}

uint64_t sub_18F7B6600()
{
  return MEMORY[0x1F4108930]();
}

uint64_t sub_18F7B6610()
{
  return MEMORY[0x1F4108948]();
}

uint64_t sub_18F7B6620()
{
  return MEMORY[0x1F4108950]();
}

uint64_t sub_18F7B6630()
{
  return MEMORY[0x1F4108968]();
}

uint64_t sub_18F7B6640()
{
  return MEMORY[0x1F4108970]();
}

uint64_t sub_18F7B6650()
{
  return MEMORY[0x1F4108988]();
}

uint64_t sub_18F7B6660()
{
  return MEMORY[0x1F4108998]();
}

uint64_t sub_18F7B6670()
{
  return MEMORY[0x1F41089A0]();
}

uint64_t sub_18F7B6680()
{
  return MEMORY[0x1F41089B8]();
}

uint64_t sub_18F7B6690()
{
  return MEMORY[0x1F41089C0]();
}

uint64_t sub_18F7B66A0()
{
  return MEMORY[0x1F41089D8]();
}

uint64_t sub_18F7B66C0()
{
  return MEMORY[0x1F4108B08]();
}

uint64_t sub_18F7B66D0()
{
  return MEMORY[0x1F4108C08]();
}

uint64_t sub_18F7B6700()
{
  return MEMORY[0x1F410D110]();
}

uint64_t sub_18F7B6710()
{
  return MEMORY[0x1F410D118]();
}

uint64_t sub_18F7B6720()
{
  return MEMORY[0x1F410D120]();
}

uint64_t sub_18F7B6730()
{
  return MEMORY[0x1F410D128]();
}

uint64_t sub_18F7B6740()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_18F7B6750()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_18F7B6760()
{
  return MEMORY[0x1F4187A20]();
}

uint64_t sub_18F7B6770()
{
  return MEMORY[0x1F41460C0]();
}

uint64_t sub_18F7B6780()
{
  return MEMORY[0x1F41460C8]();
}

uint64_t sub_18F7B6790()
{
  return MEMORY[0x1F41460D0]();
}

uint64_t sub_18F7B67A0()
{
  return MEMORY[0x1F41460D8]();
}

uint64_t sub_18F7B67B0()
{
  return MEMORY[0x1F41460E0]();
}

uint64_t sub_18F7B67C0()
{
  return MEMORY[0x1F4146118]();
}

uint64_t sub_18F7B67D0()
{
  return MEMORY[0x1F4146120]();
}

uint64_t sub_18F7B67E0()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_18F7B67F0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_18F7B6800()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_18F7B6810()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_18F7B6820()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_18F7B6830()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_18F7B6840()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t sub_18F7B6850()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_18F7B6860()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_18F7B6870()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_18F7B6880()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_18F7B6890()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_18F7B68A0()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_18F7B68B0()
{
  return MEMORY[0x1F4123E08]();
}

uint64_t sub_18F7B68C0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_18F7B68D0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_18F7B68E0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_18F7B68F0()
{
  return MEMORY[0x1F414A6A8]();
}

uint64_t sub_18F7B6900()
{
  return MEMORY[0x1F414A6B0]();
}

uint64_t sub_18F7B6910()
{
  return MEMORY[0x1F414A6C0]();
}

uint64_t sub_18F7B6920()
{
  return MEMORY[0x1F4102610]();
}

uint64_t sub_18F7B6930()
{
  return MEMORY[0x1F4102618]();
}

uint64_t sub_18F7B6940()
{
  return MEMORY[0x1F4102628]();
}

uint64_t sub_18F7B6950()
{
  return MEMORY[0x1F4102680]();
}

uint64_t sub_18F7B6960()
{
  return MEMORY[0x1F4102688]();
}

uint64_t sub_18F7B6970()
{
  return MEMORY[0x1F4102690]();
}

uint64_t sub_18F7B6980()
{
  return MEMORY[0x1F4102698]();
}

uint64_t sub_18F7B6990()
{
  return MEMORY[0x1F41026A0]();
}

uint64_t sub_18F7B69A0()
{
  return MEMORY[0x1F41026A8]();
}

uint64_t sub_18F7B69B0()
{
  return MEMORY[0x1F41026B0]();
}

uint64_t sub_18F7B69C0()
{
  return MEMORY[0x1F41026D0]();
}

uint64_t sub_18F7B69D0()
{
  return MEMORY[0x1F41026D8]();
}

uint64_t sub_18F7B69E0()
{
  return MEMORY[0x1F41026E0]();
}

uint64_t sub_18F7B69F0()
{
  return MEMORY[0x1F41026F0]();
}

uint64_t sub_18F7B6A00()
{
  return MEMORY[0x1F41026F8]();
}

uint64_t sub_18F7B6A10()
{
  return MEMORY[0x1F4102700]();
}

uint64_t sub_18F7B6A20()
{
  return MEMORY[0x1F4102708]();
}

uint64_t sub_18F7B6A30()
{
  return MEMORY[0x1F4102718]();
}

uint64_t sub_18F7B6A40()
{
  return MEMORY[0x1F4102750]();
}

uint64_t sub_18F7B6A50()
{
  return MEMORY[0x1F4102760]();
}

uint64_t sub_18F7B6A60()
{
  return MEMORY[0x1F4102780]();
}

uint64_t sub_18F7B6A70()
{
  return MEMORY[0x1F4102800]();
}

uint64_t sub_18F7B6A80()
{
  return MEMORY[0x1F4102808]();
}

uint64_t sub_18F7B6A90()
{
  return MEMORY[0x1F4102810]();
}

uint64_t sub_18F7B6AA0()
{
  return MEMORY[0x1F4102818]();
}

uint64_t sub_18F7B6AB0()
{
  return MEMORY[0x1F4102820]();
}

uint64_t sub_18F7B6AC0()
{
  return MEMORY[0x1F4102828]();
}

uint64_t sub_18F7B6AD0()
{
  return MEMORY[0x1F4102830]();
}

uint64_t sub_18F7B6AE0()
{
  return MEMORY[0x1F4102838]();
}

uint64_t sub_18F7B6AF0()
{
  return MEMORY[0x1F4102840]();
}

uint64_t sub_18F7B6B00()
{
  return MEMORY[0x1F4102848]();
}

uint64_t sub_18F7B6B10()
{
  return MEMORY[0x1F4102850]();
}

uint64_t sub_18F7B6B20()
{
  return MEMORY[0x1F4102858]();
}

uint64_t sub_18F7B6B30()
{
  return MEMORY[0x1F4102860]();
}

uint64_t sub_18F7B6B40()
{
  return MEMORY[0x1F4102868]();
}

uint64_t sub_18F7B6B50()
{
  return MEMORY[0x1F4102870]();
}

uint64_t sub_18F7B6B60()
{
  return MEMORY[0x1F4102878]();
}

uint64_t sub_18F7B6B70()
{
  return MEMORY[0x1F4102898]();
}

uint64_t sub_18F7B6B80()
{
  return MEMORY[0x1F41028A0]();
}

uint64_t sub_18F7B6B90()
{
  return MEMORY[0x1F41028A8]();
}

uint64_t sub_18F7B6BA0()
{
  return MEMORY[0x1F4102158]();
}

uint64_t sub_18F7B6BB0()
{
  return MEMORY[0x1F4102178]();
}

uint64_t sub_18F7B6BC0()
{
  return MEMORY[0x1F4102190]();
}

uint64_t sub_18F7B6BD0()
{
  return MEMORY[0x1F41021A0]();
}

uint64_t sub_18F7B6BE0()
{
  return MEMORY[0x1F41021A8]();
}

uint64_t sub_18F7B6BF0()
{
  return MEMORY[0x1F41021C0]();
}

uint64_t sub_18F7B6C00()
{
  return MEMORY[0x1F41021D0]();
}

uint64_t sub_18F7B6C10()
{
  return MEMORY[0x1F41021E8]();
}

uint64_t sub_18F7B6C20()
{
  return MEMORY[0x1F4102230]();
}

uint64_t sub_18F7B6C30()
{
  return MEMORY[0x1F4102240]();
}

uint64_t sub_18F7B6C40()
{
  return MEMORY[0x1F4102250]();
}

uint64_t sub_18F7B6C50()
{
  return MEMORY[0x1F4102258]();
}

uint64_t sub_18F7B6C60()
{
  return MEMORY[0x1F4102268]();
}

uint64_t sub_18F7B6C70()
{
  return MEMORY[0x1F4102278]();
}

uint64_t sub_18F7B6C80()
{
  return MEMORY[0x1F4102290]();
}

uint64_t sub_18F7B6C90()
{
  return MEMORY[0x1F41022A8]();
}

uint64_t sub_18F7B6CA0()
{
  return MEMORY[0x1F41022C0]();
}

uint64_t sub_18F7B6CB0()
{
  return MEMORY[0x1F41022F8]();
}

uint64_t sub_18F7B6CC0()
{
  return MEMORY[0x1F4102308]();
}

uint64_t sub_18F7B6CD0()
{
  return MEMORY[0x1F4102318]();
}

uint64_t sub_18F7B6CE0()
{
  return MEMORY[0x1F4102320]();
}

uint64_t sub_18F7B6CF0()
{
  return MEMORY[0x1F4102338]();
}

uint64_t sub_18F7B6D00()
{
  return MEMORY[0x1F4102348]();
}

uint64_t sub_18F7B6D10()
{
  return MEMORY[0x1F4102350]();
}

uint64_t sub_18F7B6D20()
{
  return MEMORY[0x1F4102360]();
}

uint64_t sub_18F7B6D30()
{
  return MEMORY[0x1F4102380]();
}

uint64_t sub_18F7B6D40()
{
  return MEMORY[0x1F4102398]();
}

uint64_t sub_18F7B6D50()
{
  return MEMORY[0x1F41023B8]();
}

uint64_t sub_18F7B6D60()
{
  return MEMORY[0x1F41023D0]();
}

uint64_t sub_18F7B6D70()
{
  return MEMORY[0x1F41023D8]();
}

uint64_t sub_18F7B6D80()
{
  return MEMORY[0x1F41023F0]();
}

uint64_t sub_18F7B6D90()
{
  return MEMORY[0x1F4102400]();
}

uint64_t sub_18F7B6DA0()
{
  return MEMORY[0x1F4102408]();
}

uint64_t sub_18F7B6DB0()
{
  return MEMORY[0x1F4102420]();
}

uint64_t sub_18F7B6DC0()
{
  return MEMORY[0x1F4102430]();
}

uint64_t sub_18F7B6DD0()
{
  return MEMORY[0x1F4102438]();
}

uint64_t sub_18F7B6DE0()
{
  return MEMORY[0x1F4102448]();
}

uint64_t sub_18F7B6DF0()
{
  return MEMORY[0x1F4102460]();
}

uint64_t sub_18F7B6E00()
{
  return MEMORY[0x1F4102468]();
}

uint64_t sub_18F7B6E10()
{
  return MEMORY[0x1F4102480]();
}

uint64_t sub_18F7B6E20()
{
  return MEMORY[0x1F4102490]();
}

uint64_t sub_18F7B6E30()
{
  return MEMORY[0x1F41024B0]();
}

uint64_t sub_18F7B6E40()
{
  return MEMORY[0x1F41024F0]();
}

uint64_t sub_18F7B6E50()
{
  return MEMORY[0x1F4102500]();
}

uint64_t sub_18F7B6E60()
{
  return MEMORY[0x1F4102508]();
}

uint64_t sub_18F7B6E70()
{
  return MEMORY[0x1F4102518]();
}

uint64_t sub_18F7B6E80()
{
  return MEMORY[0x1F4102530]();
}

uint64_t sub_18F7B6E90()
{
  return MEMORY[0x1F4102568]();
}

uint64_t sub_18F7B6EA0()
{
  return MEMORY[0x1F4102580]();
}

uint64_t sub_18F7B6EB0()
{
  return MEMORY[0x1F4102598]();
}

uint64_t sub_18F7B6EC0()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_18F7B6ED0()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_18F7B6EE0()
{
  return MEMORY[0x1F40F7D68]();
}

uint64_t sub_18F7B6EF0()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_18F7B6F00()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_18F7B6F10()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_18F7B6F20()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_18F7B6F30()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_18F7B6F40()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_18F7B6F50()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_18F7B6F60()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_18F7B6F70()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_18F7B6F80()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_18F7B6F90()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_18F7B6FA0()
{
  return MEMORY[0x1F40F7E20]();
}

uint64_t sub_18F7B6FB0()
{
  return MEMORY[0x1F40F7E30]();
}

uint64_t sub_18F7B6FC0()
{
  return MEMORY[0x1F40F7E40]();
}

uint64_t sub_18F7B6FD0()
{
  return MEMORY[0x1F40F7E60]();
}

uint64_t sub_18F7B6FE0()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_18F7B6FF0()
{
  return MEMORY[0x1F40F7EC0]();
}

uint64_t sub_18F7B7000()
{
  return MEMORY[0x1F40F7EC8]();
}

uint64_t sub_18F7B7010()
{
  return MEMORY[0x1F40F7EE0]();
}

uint64_t sub_18F7B7020()
{
  return MEMORY[0x1F40F7F20]();
}

uint64_t sub_18F7B7030()
{
  return MEMORY[0x1F40F7F60]();
}

uint64_t sub_18F7B7040()
{
  return MEMORY[0x1F40F7FB0]();
}

uint64_t sub_18F7B7050()
{
  return MEMORY[0x1F40F7FB8]();
}

uint64_t sub_18F7B7060()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_18F7B7070()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_18F7B7080()
{
  return MEMORY[0x1F40F8068]();
}

uint64_t sub_18F7B7090()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_18F7B70A0()
{
  return MEMORY[0x1F40F80F8]();
}

uint64_t sub_18F7B70B0()
{
  return MEMORY[0x1F40F8108]();
}

uint64_t sub_18F7B70C0()
{
  return MEMORY[0x1F40F8110]();
}

uint64_t sub_18F7B70D0()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_18F7B70E0()
{
  return MEMORY[0x1F40F8148]();
}

uint64_t sub_18F7B70F0()
{
  return MEMORY[0x1F40F81D8]();
}

uint64_t sub_18F7B7100()
{
  return MEMORY[0x1F40F81F8]();
}

uint64_t sub_18F7B7110()
{
  return MEMORY[0x1F40F8288]();
}

uint64_t sub_18F7B7120()
{
  return MEMORY[0x1F40F82B8]();
}

uint64_t sub_18F7B7130()
{
  return MEMORY[0x1F40F82C8]();
}

uint64_t sub_18F7B7140()
{
  return MEMORY[0x1F40F82D8]();
}

uint64_t sub_18F7B7150()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_18F7B7160()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_18F7B7170()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_18F7B7180()
{
  return MEMORY[0x1F40F83A0]();
}

uint64_t sub_18F7B7190()
{
  return MEMORY[0x1F40F83A8]();
}

uint64_t sub_18F7B71A0()
{
  return MEMORY[0x1F40F83B0]();
}

uint64_t sub_18F7B71B0()
{
  return MEMORY[0x1F40F83B8]();
}

uint64_t sub_18F7B71C0()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_18F7B71D0()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_18F7B71E0()
{
  return MEMORY[0x1F40F8400]();
}

uint64_t sub_18F7B71F0()
{
  return MEMORY[0x1F40F8408]();
}

uint64_t sub_18F7B7200()
{
  return MEMORY[0x1F40F8420]();
}

uint64_t sub_18F7B7210()
{
  return MEMORY[0x1F40F8428]();
}

uint64_t sub_18F7B7220()
{
  return MEMORY[0x1F40F8430]();
}

uint64_t sub_18F7B7230()
{
  return MEMORY[0x1F40F8438]();
}

uint64_t sub_18F7B7240()
{
  return MEMORY[0x1F40F8448]();
}

uint64_t sub_18F7B7250()
{
  return MEMORY[0x1F40F8460]();
}

uint64_t sub_18F7B7260()
{
  return MEMORY[0x1F40F8470]();
}

uint64_t sub_18F7B7270()
{
  return MEMORY[0x1F40F8488]();
}

uint64_t sub_18F7B7280()
{
  return MEMORY[0x1F40F84A0]();
}

uint64_t sub_18F7B7290()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_18F7B72A0()
{
  return MEMORY[0x1F40F84C8]();
}

uint64_t sub_18F7B72B0()
{
  return MEMORY[0x1F40F84D8]();
}

uint64_t sub_18F7B72C0()
{
  return MEMORY[0x1F40F84E8]();
}

uint64_t sub_18F7B72D0()
{
  return MEMORY[0x1F40F84F0]();
}

uint64_t sub_18F7B72E0()
{
  return MEMORY[0x1F40F8518]();
}

uint64_t sub_18F7B72F0()
{
  return MEMORY[0x1F40F8530]();
}

uint64_t sub_18F7B7300()
{
  return MEMORY[0x1F40F8538]();
}

uint64_t sub_18F7B7310()
{
  return MEMORY[0x1F40F8550]();
}

uint64_t sub_18F7B7320()
{
  return MEMORY[0x1F40F8560]();
}

uint64_t sub_18F7B7330()
{
  return MEMORY[0x1F40F8578]();
}

uint64_t sub_18F7B7340()
{
  return MEMORY[0x1F40F85C8]();
}

uint64_t sub_18F7B7350()
{
  return MEMORY[0x1F40F85D8]();
}

uint64_t sub_18F7B7360()
{
  return MEMORY[0x1F40F8640]();
}

uint64_t sub_18F7B7370()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_18F7B7380()
{
  return MEMORY[0x1F40F8658]();
}

uint64_t sub_18F7B7390()
{
  return MEMORY[0x1F40F8680]();
}

uint64_t sub_18F7B73A0()
{
  return MEMORY[0x1F40F86E0]();
}

uint64_t sub_18F7B73B0()
{
  return MEMORY[0x1F40F86E8]();
}

uint64_t sub_18F7B73C0()
{
  return MEMORY[0x1F40F86F0]();
}

uint64_t sub_18F7B73D0()
{
  return MEMORY[0x1F40F8728]();
}

uint64_t sub_18F7B73E0()
{
  return MEMORY[0x1F40F8748]();
}

uint64_t sub_18F7B73F0()
{
  return MEMORY[0x1F40F8750]();
}

uint64_t sub_18F7B7400()
{
  return MEMORY[0x1F40F8758]();
}

uint64_t sub_18F7B7410()
{
  return MEMORY[0x1F40F8760]();
}

uint64_t sub_18F7B7420()
{
  return MEMORY[0x1F40F8770]();
}

uint64_t sub_18F7B7430()
{
  return MEMORY[0x1F40F8778]();
}

uint64_t sub_18F7B7440()
{
  return MEMORY[0x1F40F8780]();
}

uint64_t sub_18F7B7450()
{
  return MEMORY[0x1F40F8788]();
}

uint64_t sub_18F7B7460()
{
  return MEMORY[0x1F40F8790]();
}

uint64_t sub_18F7B7470()
{
  return MEMORY[0x1F40F87D0]();
}

uint64_t sub_18F7B7480()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_18F7B7490()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_18F7B74A0()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_18F7B74B0()
{
  return MEMORY[0x1F40F8888]();
}

uint64_t sub_18F7B74C0()
{
  return MEMORY[0x1F40F8898]();
}

uint64_t sub_18F7B74D0()
{
  return MEMORY[0x1F40F8930]();
}

uint64_t sub_18F7B74E0()
{
  return MEMORY[0x1F40F8960]();
}

uint64_t sub_18F7B74F0()
{
  return MEMORY[0x1F40F89D8]();
}

uint64_t sub_18F7B7500()
{
  return MEMORY[0x1F40F8A08]();
}

uint64_t sub_18F7B7510()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_18F7B7520()
{
  return MEMORY[0x1F40F8A48]();
}

uint64_t sub_18F7B7530()
{
  return MEMORY[0x1F40F8A58]();
}

uint64_t sub_18F7B7540()
{
  return MEMORY[0x1F40F8A60]();
}

uint64_t sub_18F7B7550()
{
  return MEMORY[0x1F40F8A80]();
}

uint64_t sub_18F7B7560()
{
  return MEMORY[0x1F40F8A90]();
}

uint64_t sub_18F7B7570()
{
  return MEMORY[0x1F40F8A98]();
}

uint64_t sub_18F7B7580()
{
  return MEMORY[0x1F40F8AA0]();
}

uint64_t sub_18F7B7590()
{
  return MEMORY[0x1F40F8AC0]();
}

uint64_t sub_18F7B75A0()
{
  return MEMORY[0x1F40F8AD0]();
}

uint64_t sub_18F7B75B0()
{
  return MEMORY[0x1F40F8AE0]();
}

uint64_t sub_18F7B75C0()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_18F7B75D0()
{
  return MEMORY[0x1F40F8B08]();
}

uint64_t sub_18F7B75E0()
{
  return MEMORY[0x1F40F8B10]();
}

uint64_t sub_18F7B75F0()
{
  return MEMORY[0x1F40F8B58]();
}

uint64_t sub_18F7B7600()
{
  return MEMORY[0x1F40F8B68]();
}

uint64_t sub_18F7B7610()
{
  return MEMORY[0x1F40F8B88]();
}

uint64_t sub_18F7B7620()
{
  return MEMORY[0x1F40F8B90]();
}

uint64_t sub_18F7B7630()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_18F7B7640()
{
  return MEMORY[0x1F40F8C28]();
}

uint64_t sub_18F7B7650()
{
  return MEMORY[0x1F40F8C30]();
}

uint64_t sub_18F7B7660()
{
  return MEMORY[0x1F40F8C58]();
}

uint64_t sub_18F7B7670()
{
  return MEMORY[0x1F40F8C70]();
}

uint64_t sub_18F7B7680()
{
  return MEMORY[0x1F40F8CF8]();
}

uint64_t sub_18F7B7690()
{
  return MEMORY[0x1F40F8D00]();
}

uint64_t sub_18F7B76A0()
{
  return MEMORY[0x1F40F8D10]();
}

uint64_t sub_18F7B76B0()
{
  return MEMORY[0x1F40F8D18]();
}

uint64_t sub_18F7B76C0()
{
  return MEMORY[0x1F40F8D20]();
}

uint64_t sub_18F7B76D0()
{
  return MEMORY[0x1F40F8D28]();
}

uint64_t sub_18F7B76E0()
{
  return MEMORY[0x1F40F8D30]();
}

uint64_t sub_18F7B76F0()
{
  return MEMORY[0x1F40F8D40]();
}

uint64_t sub_18F7B7700()
{
  return MEMORY[0x1F40F8D48]();
}

uint64_t sub_18F7B7710()
{
  return MEMORY[0x1F40F8D68]();
}

uint64_t sub_18F7B7720()
{
  return MEMORY[0x1F40F8D70]();
}

uint64_t sub_18F7B7730()
{
  return MEMORY[0x1F40F8D90]();
}

uint64_t sub_18F7B7740()
{
  return MEMORY[0x1F40F8D98]();
}

uint64_t sub_18F7B7750()
{
  return MEMORY[0x1F40F8DA0]();
}

uint64_t sub_18F7B7760()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_18F7B7770()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_18F7B7780()
{
  return MEMORY[0x1F40F8E18]();
}

uint64_t sub_18F7B7790()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_18F7B77A0()
{
  return MEMORY[0x1F40F8F00]();
}

uint64_t sub_18F7B77B0()
{
  return MEMORY[0x1F40F8F08]();
}

uint64_t sub_18F7B77C0()
{
  return MEMORY[0x1F40F8F40]();
}

uint64_t sub_18F7B77D0()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_18F7B77E0()
{
  return MEMORY[0x1F40F8F68]();
}

uint64_t sub_18F7B77F0()
{
  return MEMORY[0x1F40F8F70]();
}

uint64_t sub_18F7B7800()
{
  return MEMORY[0x1F40F8F78]();
}

uint64_t sub_18F7B7810()
{
  return MEMORY[0x1F40F8F80]();
}

uint64_t sub_18F7B7820()
{
  return MEMORY[0x1F40F8F88]();
}

uint64_t sub_18F7B7830()
{
  return MEMORY[0x1F40F8F98]();
}

uint64_t sub_18F7B7840()
{
  return MEMORY[0x1F40F9008]();
}

uint64_t sub_18F7B7850()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_18F7B7860()
{
  return MEMORY[0x1F40F90B8]();
}

uint64_t sub_18F7B7870()
{
  return MEMORY[0x1F40F90C8]();
}

uint64_t sub_18F7B7880()
{
  return MEMORY[0x1F40F90E0]();
}

uint64_t sub_18F7B7890()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_18F7B78A0()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_18F7B78B0()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_18F7B78C0()
{
  return MEMORY[0x1F40F9160]();
}

uint64_t sub_18F7B78D0()
{
  return MEMORY[0x1F40F9168]();
}

uint64_t sub_18F7B78E0()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_18F7B78F0()
{
  return MEMORY[0x1F40F9210]();
}

uint64_t sub_18F7B7900()
{
  return MEMORY[0x1F40F9248]();
}

uint64_t sub_18F7B7910()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_18F7B7920()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_18F7B7930()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_18F7B7940()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_18F7B7950()
{
  return MEMORY[0x1F40F92B8]();
}

uint64_t sub_18F7B7960()
{
  return MEMORY[0x1F40F9340]();
}

uint64_t sub_18F7B7970()
{
  return MEMORY[0x1F40F9350]();
}

uint64_t sub_18F7B7980()
{
  return MEMORY[0x1F40F9378]();
}

uint64_t sub_18F7B7990()
{
  return MEMORY[0x1F40F9388]();
}

uint64_t sub_18F7B79A0()
{
  return MEMORY[0x1F40F9390]();
}

uint64_t sub_18F7B79B0()
{
  return MEMORY[0x1F40F93A8]();
}

uint64_t sub_18F7B79C0()
{
  return MEMORY[0x1F40F93B0]();
}

uint64_t sub_18F7B79D0()
{
  return MEMORY[0x1F40F9450]();
}

uint64_t sub_18F7B79E0()
{
  return MEMORY[0x1F40F9470]();
}

uint64_t sub_18F7B79F0()
{
  return MEMORY[0x1F40F9480]();
}

uint64_t sub_18F7B7A00()
{
  return MEMORY[0x1F40F9490]();
}

uint64_t sub_18F7B7A10()
{
  return MEMORY[0x1F40F9498]();
}

uint64_t sub_18F7B7A20()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_18F7B7A30()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_18F7B7A40()
{
  return MEMORY[0x1F40F9570]();
}

uint64_t sub_18F7B7A50()
{
  return MEMORY[0x1F40F9588]();
}

uint64_t sub_18F7B7A60()
{
  return MEMORY[0x1F40F95B8]();
}

uint64_t sub_18F7B7A70()
{
  return MEMORY[0x1F40F9648]();
}

uint64_t sub_18F7B7A80()
{
  return MEMORY[0x1F40F9658]();
}

uint64_t sub_18F7B7A90()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_18F7B7AA0()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_18F7B7AB0()
{
  return MEMORY[0x1F40F9688]();
}

uint64_t sub_18F7B7AC0()
{
  return MEMORY[0x1F40F9690]();
}

uint64_t sub_18F7B7AD0()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_18F7B7AE0()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_18F7B7AF0()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_18F7B7B00()
{
  return MEMORY[0x1F40F9708]();
}

uint64_t sub_18F7B7B10()
{
  return MEMORY[0x1F40F9718]();
}

uint64_t sub_18F7B7B20()
{
  return MEMORY[0x1F40F9720]();
}

uint64_t sub_18F7B7B30()
{
  return MEMORY[0x1F40F97D8]();
}

uint64_t sub_18F7B7B40()
{
  return MEMORY[0x1F40F9800]();
}

uint64_t sub_18F7B7B50()
{
  return MEMORY[0x1F40F9840]();
}

uint64_t sub_18F7B7B60()
{
  return MEMORY[0x1F40F9848]();
}

uint64_t sub_18F7B7B70()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_18F7B7B80()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_18F7B7B90()
{
  return MEMORY[0x1F40F99C8]();
}

uint64_t sub_18F7B7BA0()
{
  return MEMORY[0x1F40F99D0]();
}

uint64_t sub_18F7B7BB0()
{
  return MEMORY[0x1F40F99D8]();
}

uint64_t sub_18F7B7BC0()
{
  return MEMORY[0x1F40F9A38]();
}

uint64_t sub_18F7B7BD0()
{
  return MEMORY[0x1F40F9A40]();
}

uint64_t sub_18F7B7BE0()
{
  return MEMORY[0x1F40F9A50]();
}

uint64_t sub_18F7B7BF0()
{
  return MEMORY[0x1F40F9A60]();
}

uint64_t sub_18F7B7C00()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_18F7B7C10()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_18F7B7C20()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_18F7B7C30()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_18F7B7C40()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_18F7B7C50()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_18F7B7C60()
{
  return MEMORY[0x1F40F9B38]();
}

uint64_t sub_18F7B7C70()
{
  return MEMORY[0x1F40F9B40]();
}

uint64_t sub_18F7B7C80()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_18F7B7C90()
{
  return MEMORY[0x1F40F9C60]();
}

uint64_t sub_18F7B7CA0()
{
  return MEMORY[0x1F40F9C68]();
}

uint64_t sub_18F7B7CB0()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_18F7B7CC0()
{
  return MEMORY[0x1F40F9CB8]();
}

uint64_t sub_18F7B7CD0()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_18F7B7CE0()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_18F7B7CF0()
{
  return MEMORY[0x1F40F9D10]();
}

uint64_t sub_18F7B7D00()
{
  return MEMORY[0x1F40F9DE0]();
}

uint64_t sub_18F7B7D10()
{
  return MEMORY[0x1F40F9DE8]();
}

uint64_t sub_18F7B7D20()
{
  return MEMORY[0x1F40F9E00]();
}

uint64_t sub_18F7B7D30()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_18F7B7D40()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_18F7B7D50()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_18F7B7D60()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_18F7B7D80()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_18F7B7D90()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_18F7B7DA0()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_18F7B7DB0()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_18F7B7DC0()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_18F7B7DD0()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_18F7B7DF0()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_18F7B7E00()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_18F7B7E10()
{
  return MEMORY[0x1F40FA028]();
}

uint64_t sub_18F7B7E20()
{
  return MEMORY[0x1F40FA038]();
}

uint64_t sub_18F7B7E30()
{
  return MEMORY[0x1F40FA040]();
}

uint64_t sub_18F7B7E40()
{
  return MEMORY[0x1F40FA090]();
}

uint64_t sub_18F7B7E50()
{
  return MEMORY[0x1F40FA0C8]();
}

uint64_t sub_18F7B7E60()
{
  return MEMORY[0x1F40FA0D8]();
}

uint64_t sub_18F7B7E70()
{
  return MEMORY[0x1F40FA0E0]();
}

uint64_t sub_18F7B7E80()
{
  return MEMORY[0x1F40FA0F0]();
}

uint64_t sub_18F7B7E90()
{
  return MEMORY[0x1F40FA120]();
}

uint64_t sub_18F7B7EA0()
{
  return MEMORY[0x1F40FA140]();
}

uint64_t sub_18F7B7EB0()
{
  return MEMORY[0x1F40FA150]();
}

uint64_t sub_18F7B7EC0()
{
  return MEMORY[0x1F40FA1A8]();
}

uint64_t sub_18F7B7ED0()
{
  return MEMORY[0x1F40FA1B0]();
}

uint64_t sub_18F7B7EE0()
{
  return MEMORY[0x1F40FA1B8]();
}

uint64_t sub_18F7B7EF0()
{
  return MEMORY[0x1F40FA1E8]();
}

uint64_t sub_18F7B7F00()
{
  return MEMORY[0x1F40FA220]();
}

uint64_t sub_18F7B7F10()
{
  return MEMORY[0x1F40FA230]();
}

uint64_t sub_18F7B7F20()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_18F7B7F30()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_18F7B7F40()
{
  return MEMORY[0x1F40FA2C0]();
}

uint64_t sub_18F7B7F50()
{
  return MEMORY[0x1F40FA2E0]();
}

uint64_t sub_18F7B7F60()
{
  return MEMORY[0x1F40FA350]();
}

uint64_t sub_18F7B7F70()
{
  return MEMORY[0x1F40FA3A0]();
}

uint64_t sub_18F7B7F80()
{
  return MEMORY[0x1F40FA3A8]();
}

uint64_t sub_18F7B7F90()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_18F7B7FA0()
{
  return MEMORY[0x1F40FA3E0]();
}

uint64_t sub_18F7B7FB0()
{
  return MEMORY[0x1F40FA510]();
}

uint64_t sub_18F7B7FC0()
{
  return MEMORY[0x1F40FA518]();
}

uint64_t sub_18F7B7FD0()
{
  return MEMORY[0x1F40FA528]();
}

uint64_t sub_18F7B7FE0()
{
  return MEMORY[0x1F40FA560]();
}

uint64_t sub_18F7B7FF0()
{
  return MEMORY[0x1F40FA5A0]();
}

uint64_t sub_18F7B8000()
{
  return MEMORY[0x1F40FA5A8]();
}

uint64_t sub_18F7B8010()
{
  return MEMORY[0x1F40FA5B8]();
}

uint64_t sub_18F7B8020()
{
  return MEMORY[0x1F40FA5D0]();
}

uint64_t sub_18F7B8030()
{
  return MEMORY[0x1F40FA5E8]();
}

uint64_t sub_18F7B8040()
{
  return MEMORY[0x1F40FA690]();
}

uint64_t sub_18F7B8050()
{
  return MEMORY[0x1F40FA6A0]();
}

uint64_t sub_18F7B8060()
{
  return MEMORY[0x1F40FA6B8]();
}

uint64_t sub_18F7B8070()
{
  return MEMORY[0x1F40FA6C0]();
}

uint64_t sub_18F7B8080()
{
  return MEMORY[0x1F40FA6C8]();
}

uint64_t sub_18F7B8090()
{
  return MEMORY[0x1F40FA6D0]();
}

uint64_t sub_18F7B80A0()
{
  return MEMORY[0x1F40FA790]();
}

uint64_t sub_18F7B80B0()
{
  return MEMORY[0x1F40FA798]();
}

uint64_t sub_18F7B80C0()
{
  return MEMORY[0x1F40FA800]();
}

uint64_t sub_18F7B80D0()
{
  return MEMORY[0x1F40FA810]();
}

uint64_t sub_18F7B80E0()
{
  return MEMORY[0x1F40FA860]();
}

uint64_t sub_18F7B80F0()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_18F7B8100()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_18F7B8110()
{
  return MEMORY[0x1F40FA908]();
}

uint64_t sub_18F7B8120()
{
  return MEMORY[0x1F40FA910]();
}

uint64_t sub_18F7B8130()
{
  return MEMORY[0x1F40FA918]();
}

uint64_t sub_18F7B8140()
{
  return MEMORY[0x1F40FA928]();
}

uint64_t sub_18F7B8150()
{
  return MEMORY[0x1F40FA930]();
}

uint64_t sub_18F7B8160()
{
  return MEMORY[0x1F40FA938]();
}

uint64_t sub_18F7B8170()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_18F7B8180()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_18F7B8190()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_18F7B81B0()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_18F7B81C0()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_18F7B81D0()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_18F7B81F0()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_18F7B8200()
{
  return MEMORY[0x1F40FAC40]();
}

uint64_t sub_18F7B8210()
{
  return MEMORY[0x1F40FAC48]();
}

uint64_t sub_18F7B8220()
{
  return MEMORY[0x1F40FAC50]();
}

uint64_t sub_18F7B8230()
{
  return MEMORY[0x1F40FAC58]();
}

uint64_t sub_18F7B8240()
{
  return MEMORY[0x1F40FAC60]();
}

uint64_t sub_18F7B8250()
{
  return MEMORY[0x1F40FAC68]();
}

uint64_t sub_18F7B8260()
{
  return MEMORY[0x1F40FAC70]();
}

uint64_t sub_18F7B8270()
{
  return MEMORY[0x1F40FAC78]();
}

uint64_t sub_18F7B8280()
{
  return MEMORY[0x1F40FACE8]();
}

uint64_t sub_18F7B8290()
{
  return MEMORY[0x1F40FACF0]();
}

uint64_t sub_18F7B82A0()
{
  return MEMORY[0x1F40FAD00]();
}

uint64_t sub_18F7B82B0()
{
  return MEMORY[0x1F40FAD10]();
}

uint64_t sub_18F7B82C0()
{
  return MEMORY[0x1F40FAD18]();
}

uint64_t sub_18F7B82D0()
{
  return MEMORY[0x1F40FAD20]();
}

uint64_t sub_18F7B82E0()
{
  return MEMORY[0x1F40FAD28]();
}

uint64_t sub_18F7B82F0()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_18F7B8300()
{
  return MEMORY[0x1F40FAD78]();
}

uint64_t sub_18F7B8310()
{
  return MEMORY[0x1F40FAD88]();
}

uint64_t sub_18F7B8320()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_18F7B8330()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_18F7B8340()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_18F7B8350()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_18F7B8360()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_18F7B8370()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_18F7B8380()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_18F7B8390()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_18F7B83A0()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_18F7B83B0()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_18F7B83C0()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_18F7B83D0()
{
  return MEMORY[0x1F40FAF08]();
}

uint64_t sub_18F7B83E0()
{
  return MEMORY[0x1F40FAF48]();
}

uint64_t sub_18F7B83F0()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_18F7B8400()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_18F7B8410()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_18F7B8420()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_18F7B8430()
{
  return MEMORY[0x1F40FB020]();
}

uint64_t sub_18F7B8440()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_18F7B8450()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_18F7B8460()
{
  return MEMORY[0x1F40FB0C8]();
}

uint64_t sub_18F7B8470()
{
  return MEMORY[0x1F40FB0D0]();
}

uint64_t sub_18F7B8480()
{
  return MEMORY[0x1F40FB0F8]();
}

uint64_t sub_18F7B8490()
{
  return MEMORY[0x1F40FB108]();
}

uint64_t sub_18F7B84A0()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_18F7B84B0()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_18F7B84C0()
{
  return MEMORY[0x1F40FB180]();
}

uint64_t sub_18F7B84D0()
{
  return MEMORY[0x1F40FB198]();
}

uint64_t sub_18F7B84E0()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_18F7B84F0()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_18F7B8500()
{
  return MEMORY[0x1F40FB1F8]();
}

uint64_t sub_18F7B8510()
{
  return MEMORY[0x1F40FB218]();
}

uint64_t sub_18F7B8520()
{
  return MEMORY[0x1F40FB220]();
}

uint64_t sub_18F7B8530()
{
  return MEMORY[0x1F40FB238]();
}

uint64_t sub_18F7B8540()
{
  return MEMORY[0x1F40FB268]();
}

uint64_t sub_18F7B8550()
{
  return MEMORY[0x1F40FB280]();
}

uint64_t sub_18F7B8560()
{
  return MEMORY[0x1F40FB2A0]();
}

uint64_t sub_18F7B8570()
{
  return MEMORY[0x1F40FB2B0]();
}

uint64_t sub_18F7B8580()
{
  return MEMORY[0x1F40FB2B8]();
}

uint64_t sub_18F7B8590()
{
  return MEMORY[0x1F40FB2D0]();
}

uint64_t sub_18F7B85A0()
{
  return MEMORY[0x1F40FB2E8]();
}

uint64_t sub_18F7B85B0()
{
  return MEMORY[0x1F40FB320]();
}

uint64_t sub_18F7B85C0()
{
  return MEMORY[0x1F40FB3A0]();
}

uint64_t sub_18F7B85D0()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_18F7B85E0()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_18F7B85F0()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_18F7B8600()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_18F7B8610()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_18F7B8620()
{
  return MEMORY[0x1F40FB598]();
}

uint64_t sub_18F7B8630()
{
  return MEMORY[0x1F4112C10]();
}

uint64_t sub_18F7B8640()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_18F7B8650()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_18F7B8660()
{
  return MEMORY[0x1F40FB5F0]();
}

uint64_t sub_18F7B8670()
{
  return MEMORY[0x1F40FB608]();
}

uint64_t sub_18F7B8680()
{
  return MEMORY[0x1F40FB610]();
}

uint64_t sub_18F7B8690()
{
  return MEMORY[0x1F40FB638]();
}

uint64_t sub_18F7B86A0()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_18F7B86B0()
{
  return MEMORY[0x1F40FB660]();
}

uint64_t sub_18F7B86C0()
{
  return MEMORY[0x1F40FB688]();
}

uint64_t sub_18F7B86D0()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_18F7B86E0()
{
  return MEMORY[0x1F40FB6E0]();
}

uint64_t sub_18F7B86F0()
{
  return MEMORY[0x1F40FB6F0]();
}

uint64_t sub_18F7B8700()
{
  return MEMORY[0x1F40FB780]();
}

uint64_t sub_18F7B8710()
{
  return MEMORY[0x1F40FB788]();
}

uint64_t sub_18F7B8720()
{
  return MEMORY[0x1F40FB7A8]();
}

uint64_t sub_18F7B8730()
{
  return MEMORY[0x1F40FB7C0]();
}

uint64_t sub_18F7B8740()
{
  return MEMORY[0x1F40FB7F8]();
}

uint64_t sub_18F7B8750()
{
  return MEMORY[0x1F40FB840]();
}

uint64_t sub_18F7B8760()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_18F7B8770()
{
  return MEMORY[0x1F40FB870]();
}

uint64_t sub_18F7B8780()
{
  return MEMORY[0x1F40FB878]();
}

uint64_t sub_18F7B8790()
{
  return MEMORY[0x1F40FB918]();
}

uint64_t sub_18F7B87A0()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_18F7B87B0()
{
  return MEMORY[0x1F40FB9C0]();
}

uint64_t sub_18F7B87C0()
{
  return MEMORY[0x1F40FB9C8]();
}

uint64_t sub_18F7B87D0()
{
  return MEMORY[0x1F40FB9D8]();
}

uint64_t sub_18F7B87E0()
{
  return MEMORY[0x1F40FB9E8]();
}

uint64_t sub_18F7B87F0()
{
  return MEMORY[0x1F40FBA40]();
}

uint64_t sub_18F7B8800()
{
  return MEMORY[0x1F40FBA50]();
}

uint64_t sub_18F7B8810()
{
  return MEMORY[0x1F40FBA60]();
}

uint64_t sub_18F7B8820()
{
  return MEMORY[0x1F40FBA78]();
}

uint64_t sub_18F7B8830()
{
  return MEMORY[0x1F40FBA90]();
}

uint64_t sub_18F7B8840()
{
  return MEMORY[0x1F40FBAA0]();
}

uint64_t sub_18F7B8850()
{
  return MEMORY[0x1F40FBAE0]();
}

uint64_t sub_18F7B8860()
{
  return MEMORY[0x1F40FBAF8]();
}

uint64_t sub_18F7B8870()
{
  return MEMORY[0x1F40FBB38]();
}

uint64_t sub_18F7B8880()
{
  return MEMORY[0x1F40FBB48]();
}

uint64_t sub_18F7B8890()
{
  return MEMORY[0x1F40FBB58]();
}

uint64_t sub_18F7B88A0()
{
  return MEMORY[0x1F40FBB98]();
}

uint64_t sub_18F7B88B0()
{
  return MEMORY[0x1F40FBBC8]();
}

uint64_t sub_18F7B88C0()
{
  return MEMORY[0x1F40FBBE0]();
}

uint64_t sub_18F7B88D0()
{
  return MEMORY[0x1F40FBBF0]();
}

uint64_t sub_18F7B88E0()
{
  return MEMORY[0x1F40FBC68]();
}

uint64_t sub_18F7B88F0()
{
  return MEMORY[0x1F40FBC88]();
}

uint64_t sub_18F7B8900()
{
  return MEMORY[0x1F40FBC90]();
}

uint64_t sub_18F7B8910()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_18F7B8920()
{
  return MEMORY[0x1F40FBD28]();
}

uint64_t sub_18F7B8930()
{
  return MEMORY[0x1F40FBD30]();
}

uint64_t sub_18F7B8940()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_18F7B8950()
{
  return MEMORY[0x1F40FBD70]();
}

uint64_t sub_18F7B8960()
{
  return MEMORY[0x1F40FBDC0]();
}

uint64_t sub_18F7B8970()
{
  return MEMORY[0x1F40FBE38]();
}

uint64_t sub_18F7B8980()
{
  return MEMORY[0x1F40FBE70]();
}

uint64_t sub_18F7B8990()
{
  return MEMORY[0x1F40FBEF8]();
}

uint64_t sub_18F7B89A0()
{
  return MEMORY[0x1F40FBF20]();
}

uint64_t sub_18F7B89B0()
{
  return MEMORY[0x1F40FBF58]();
}

uint64_t sub_18F7B89C0()
{
  return MEMORY[0x1F40FBF88]();
}

uint64_t sub_18F7B89D0()
{
  return MEMORY[0x1F40FBFB8]();
}

uint64_t sub_18F7B89E0()
{
  return MEMORY[0x1F40FBFD8]();
}

uint64_t sub_18F7B89F0()
{
  return MEMORY[0x1F40FBFF8]();
}

uint64_t sub_18F7B8A00()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_18F7B8A10()
{
  return MEMORY[0x1F40FC018]();
}

uint64_t sub_18F7B8A20()
{
  return MEMORY[0x1F40FC050]();
}

uint64_t sub_18F7B8A30()
{
  return MEMORY[0x1F40FC090]();
}

uint64_t sub_18F7B8A40()
{
  return MEMORY[0x1F40FC0C0]();
}

uint64_t sub_18F7B8A50()
{
  return MEMORY[0x1F40FC100]();
}

uint64_t sub_18F7B8A60()
{
  return MEMORY[0x1F40FC108]();
}

uint64_t sub_18F7B8A70()
{
  return MEMORY[0x1F40FC138]();
}

uint64_t sub_18F7B8A80()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_18F7B8A90()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_18F7B8AA0()
{
  return MEMORY[0x1F40FC168]();
}

uint64_t sub_18F7B8AB0()
{
  return MEMORY[0x1F40FC1B8]();
}

uint64_t sub_18F7B8AC0()
{
  return MEMORY[0x1F40FC1D0]();
}

uint64_t sub_18F7B8AD0()
{
  return MEMORY[0x1F40FC1D8]();
}

uint64_t sub_18F7B8AE0()
{
  return MEMORY[0x1F40FC220]();
}

uint64_t sub_18F7B8AF0()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_18F7B8B00()
{
  return MEMORY[0x1F40FC280]();
}

uint64_t sub_18F7B8B10()
{
  return MEMORY[0x1F40FC298]();
}

uint64_t sub_18F7B8B20()
{
  return MEMORY[0x1F40FC2A0]();
}

uint64_t sub_18F7B8B30()
{
  return MEMORY[0x1F40FC2A8]();
}

uint64_t sub_18F7B8B40()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_18F7B8B50()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_18F7B8B60()
{
  return MEMORY[0x1F40FC318]();
}

uint64_t sub_18F7B8B70()
{
  return MEMORY[0x1F40FC320]();
}

uint64_t sub_18F7B8B80()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_18F7B8B90()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_18F7B8BA0()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_18F7B8BB0()
{
  return MEMORY[0x1F40FC3A8]();
}

uint64_t sub_18F7B8BC0()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_18F7B8BD0()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_18F7B8BE0()
{
  return MEMORY[0x1F40FC3E0]();
}

uint64_t sub_18F7B8BF0()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_18F7B8C00()
{
  return MEMORY[0x1F40FC420]();
}

uint64_t sub_18F7B8C10()
{
  return MEMORY[0x1F40FC428]();
}

uint64_t sub_18F7B8C20()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_18F7B8C30()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_18F7B8C40()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_18F7B8C50()
{
  return MEMORY[0x1F40FC4A8]();
}

uint64_t sub_18F7B8C60()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_18F7B8C70()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_18F7B8C80()
{
  return MEMORY[0x1F40FC4F0]();
}

uint64_t sub_18F7B8C90()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_18F7B8CA0()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_18F7B8CB0()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_18F7B8CC0()
{
  return MEMORY[0x1F40FC580]();
}

uint64_t sub_18F7B8CD0()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_18F7B8CE0()
{
  return MEMORY[0x1F40FC5B8]();
}

uint64_t sub_18F7B8CF0()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_18F7B8D00()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_18F7B8D10()
{
  return MEMORY[0x1F4112C20]();
}

uint64_t sub_18F7B8D20()
{
  return MEMORY[0x1F40FC620]();
}

uint64_t sub_18F7B8D30()
{
  return MEMORY[0x1F40FC628]();
}

uint64_t sub_18F7B8D40()
{
  return MEMORY[0x1F40FC638]();
}

uint64_t sub_18F7B8D50()
{
  return MEMORY[0x1F40FC678]();
}

uint64_t sub_18F7B8D80()
{
  return MEMORY[0x1F40FC6A0]();
}

uint64_t sub_18F7B8DA0()
{
  return MEMORY[0x1F40FC6C8]();
}

uint64_t sub_18F7B8DC0()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_18F7B8DD0()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_18F7B8DE0()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_18F7B8DF0()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_18F7B8E00()
{
  return MEMORY[0x1F40FC738]();
}

uint64_t sub_18F7B8E10()
{
  return MEMORY[0x1F40FC750]();
}

uint64_t sub_18F7B8E20()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_18F7B8E30()
{
  return MEMORY[0x1F40FC770]();
}

uint64_t sub_18F7B8E40()
{
  return MEMORY[0x1F40FC778]();
}

uint64_t sub_18F7B8E50()
{
  return MEMORY[0x1F40FC780]();
}

uint64_t sub_18F7B8E60()
{
  return MEMORY[0x1F40FC790]();
}

uint64_t sub_18F7B8E70()
{
  return MEMORY[0x1F40FC7A0]();
}

uint64_t sub_18F7B8E80()
{
  return MEMORY[0x1F40FC7B0]();
}

uint64_t sub_18F7B8E90()
{
  return MEMORY[0x1F40FC7E8]();
}

uint64_t sub_18F7B8EA0()
{
  return MEMORY[0x1F40FC7F8]();
}

uint64_t sub_18F7B8EB0()
{
  return MEMORY[0x1F40FC808]();
}

uint64_t sub_18F7B8EC0()
{
  return MEMORY[0x1F40FC820]();
}

uint64_t sub_18F7B8ED0()
{
  return MEMORY[0x1F40FC830]();
}

uint64_t sub_18F7B8EE0()
{
  return MEMORY[0x1F40FC840]();
}

uint64_t sub_18F7B8EF0()
{
  return MEMORY[0x1F40FC878]();
}

uint64_t sub_18F7B8F00()
{
  return MEMORY[0x1F40FC880]();
}

uint64_t sub_18F7B8F10()
{
  return MEMORY[0x1F40FC888]();
}

uint64_t sub_18F7B8F20()
{
  return MEMORY[0x1F40FC8A8]();
}

uint64_t sub_18F7B8F30()
{
  return MEMORY[0x1F40FC8E0]();
}

uint64_t sub_18F7B8F40()
{
  return MEMORY[0x1F40FC8E8]();
}

uint64_t sub_18F7B8F50()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_18F7B8F60()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_18F7B8F70()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_18F7B8F80()
{
  return MEMORY[0x1F40FC930]();
}

uint64_t sub_18F7B8F90()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_18F7B8FA0()
{
  return MEMORY[0x1F40FC970]();
}

uint64_t sub_18F7B8FB0()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_18F7B8FC0()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_18F7B8FD0()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_18F7B8FE0()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_18F7B8FF0()
{
  return MEMORY[0x1F40FCA00]();
}

uint64_t sub_18F7B9000()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_18F7B9010()
{
  return MEMORY[0x1F40FCA30]();
}

uint64_t sub_18F7B9020()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_18F7B9030()
{
  return MEMORY[0x1F40FCA48]();
}

uint64_t sub_18F7B9040()
{
  return MEMORY[0x1F40FCA70]();
}

uint64_t sub_18F7B9050()
{
  return MEMORY[0x1F40FCA98]();
}

uint64_t sub_18F7B9060()
{
  return MEMORY[0x1F40FCAB0]();
}

uint64_t sub_18F7B9070()
{
  return MEMORY[0x1F40FCAB8]();
}

uint64_t sub_18F7B9080()
{
  return MEMORY[0x1F40FCAD0]();
}

uint64_t sub_18F7B9090()
{
  return MEMORY[0x1F40FCAD8]();
}

uint64_t sub_18F7B90A0()
{
  return MEMORY[0x1F40FCB30]();
}

uint64_t sub_18F7B90B0()
{
  return MEMORY[0x1F40FCB38]();
}

uint64_t sub_18F7B90C0()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_18F7B90D0()
{
  return MEMORY[0x1F40FCB58]();
}

uint64_t sub_18F7B90E0()
{
  return MEMORY[0x1F40FCB68]();
}

uint64_t sub_18F7B90F0()
{
  return MEMORY[0x1F40FCB78]();
}

uint64_t sub_18F7B9100()
{
  return MEMORY[0x1F40FCB88]();
}

uint64_t sub_18F7B9110()
{
  return MEMORY[0x1F40FCB98]();
}

uint64_t sub_18F7B9120()
{
  return MEMORY[0x1F40FCBC8]();
}

uint64_t sub_18F7B9130()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_18F7B9140()
{
  return MEMORY[0x1F40FCBE8]();
}

uint64_t sub_18F7B9150()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_18F7B9160()
{
  return MEMORY[0x1F40FCC20]();
}

uint64_t sub_18F7B9170()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_18F7B9180()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_18F7B9190()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_18F7B91A0()
{
  return MEMORY[0x1F40FCC88]();
}

uint64_t sub_18F7B91B0()
{
  return MEMORY[0x1F40FCC98]();
}

uint64_t sub_18F7B91C0()
{
  return MEMORY[0x1F40FCCA0]();
}

uint64_t sub_18F7B91D0()
{
  return MEMORY[0x1F40FCCC0]();
}

uint64_t sub_18F7B91E0()
{
  return MEMORY[0x1F40FCCE0]();
}

uint64_t sub_18F7B91F0()
{
  return MEMORY[0x1F40FCCE8]();
}

uint64_t sub_18F7B9200()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_18F7B9210()
{
  return MEMORY[0x1F40FCD10]();
}

uint64_t sub_18F7B9220()
{
  return MEMORY[0x1F40FCD18]();
}

uint64_t sub_18F7B9230()
{
  return MEMORY[0x1F40FCD20]();
}

uint64_t sub_18F7B9240()
{
  return MEMORY[0x1F40FCD30]();
}

uint64_t sub_18F7B9250()
{
  return MEMORY[0x1F40FCD90]();
}

uint64_t sub_18F7B9260()
{
  return MEMORY[0x1F40FCDE0]();
}

uint64_t sub_18F7B9270()
{
  return MEMORY[0x1F40FCE08]();
}

uint64_t sub_18F7B9280()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_18F7B9290()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_18F7B92A0()
{
  return MEMORY[0x1F40FCE70]();
}

uint64_t sub_18F7B92B0()
{
  return MEMORY[0x1F40FCE78]();
}

uint64_t sub_18F7B92C0()
{
  return MEMORY[0x1F40FCE88]();
}

uint64_t sub_18F7B92D0()
{
  return MEMORY[0x1F40FCEB0]();
}

uint64_t sub_18F7B92E0()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_18F7B92F0()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_18F7B9300()
{
  return MEMORY[0x1F40FCEE0]();
}

uint64_t sub_18F7B9310()
{
  return MEMORY[0x1F40FCEE8]();
}

uint64_t sub_18F7B9320()
{
  return MEMORY[0x1F4101BE0]();
}

uint64_t sub_18F7B9330()
{
  return MEMORY[0x1F4101BE8]();
}

uint64_t sub_18F7B9340()
{
  return MEMORY[0x1F4101C88]();
}

uint64_t sub_18F7B9350()
{
  return MEMORY[0x1F4101C90]();
}

uint64_t sub_18F7B9360()
{
  return MEMORY[0x1F4101CC8]();
}

uint64_t sub_18F7B9370()
{
  return MEMORY[0x1F4101CD0]();
}

uint64_t sub_18F7B9380()
{
  return MEMORY[0x1F4101CF8]();
}

uint64_t sub_18F7B9390()
{
  return MEMORY[0x1F4101D00]();
}

uint64_t sub_18F7B93A0()
{
  return MEMORY[0x1F4186C68]();
}

uint64_t sub_18F7B93B0()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_18F7B93C0()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_18F7B93D0()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_18F7B93E0()
{
  return MEMORY[0x1F4186E20]();
}

uint64_t sub_18F7B93F0()
{
  return MEMORY[0x1F4186E30]();
}

uint64_t sub_18F7B9400()
{
  return MEMORY[0x1F4186E40]();
}

uint64_t sub_18F7B9410()
{
  return MEMORY[0x1F4186E50]();
}

uint64_t sub_18F7B9420()
{
  return MEMORY[0x1F4186E58]();
}

uint64_t sub_18F7B9430()
{
  return MEMORY[0x1F4186EA8]();
}

uint64_t sub_18F7B9440()
{
  return MEMORY[0x1F4186EE0]();
}

uint64_t sub_18F7B9450()
{
  return MEMORY[0x1F4186EF0]();
}

uint64_t sub_18F7B9460()
{
  return MEMORY[0x1F4186F00]();
}

uint64_t sub_18F7B9470()
{
  return MEMORY[0x1F4186F10]();
}

uint64_t sub_18F7B9480()
{
  return MEMORY[0x1F4186F38]();
}

uint64_t sub_18F7B9490()
{
  return MEMORY[0x1F415C6C8]();
}

uint64_t sub_18F7B94A0()
{
  return MEMORY[0x1F415C6D0]();
}

uint64_t sub_18F7B94B0()
{
  return MEMORY[0x1F415C6E0]();
}

uint64_t sub_18F7B94C0()
{
  return MEMORY[0x1F415C6F0]();
}

uint64_t sub_18F7B94D0()
{
  return MEMORY[0x1F415C6F8]();
}

uint64_t sub_18F7B94E0()
{
  return MEMORY[0x1F415C730]();
}

uint64_t sub_18F7B94F0()
{
  return MEMORY[0x1F415C738]();
}

uint64_t sub_18F7B9500()
{
  return MEMORY[0x1F415C740]();
}

uint64_t sub_18F7B9510()
{
  return MEMORY[0x1F415C758]();
}

uint64_t sub_18F7B9520()
{
  return MEMORY[0x1F415C778]();
}

uint64_t sub_18F7B9530()
{
  return MEMORY[0x1F415C780]();
}

uint64_t sub_18F7B9540()
{
  return MEMORY[0x1F415C790]();
}

uint64_t sub_18F7B9550()
{
  return MEMORY[0x1F415C7A0]();
}

uint64_t sub_18F7B9560()
{
  return MEMORY[0x1F415C7A8]();
}

uint64_t sub_18F7B9570()
{
  return MEMORY[0x1F415C7B8]();
}

uint64_t sub_18F7B9580()
{
  return MEMORY[0x1F415C7C0]();
}

uint64_t sub_18F7B9590()
{
  return MEMORY[0x1F415C7C8]();
}

uint64_t sub_18F7B95A0()
{
  return MEMORY[0x1F415C7D0]();
}

uint64_t sub_18F7B95B0()
{
  return MEMORY[0x1F415C7D8]();
}

uint64_t sub_18F7B95C0()
{
  return MEMORY[0x1F415C7E8]();
}

uint64_t sub_18F7B95D0()
{
  return MEMORY[0x1F415C7F8]();
}

uint64_t sub_18F7B95E0()
{
  return MEMORY[0x1F415C808]();
}

uint64_t sub_18F7B95F0()
{
  return MEMORY[0x1F415C810]();
}

uint64_t sub_18F7B9600()
{
  return MEMORY[0x1F415C818]();
}

uint64_t sub_18F7B9610()
{
  return MEMORY[0x1F415C820]();
}

uint64_t sub_18F7B9620()
{
  return MEMORY[0x1F415C828]();
}

uint64_t sub_18F7B9630()
{
  return MEMORY[0x1F415C830]();
}

uint64_t sub_18F7B9640()
{
  return MEMORY[0x1F40E5FF8]();
}

uint64_t sub_18F7B9650()
{
  return MEMORY[0x1F40E6010]();
}

uint64_t sub_18F7B9660()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_18F7B9670()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_18F7B9680()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_18F7B9690()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_18F7B96A0()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_18F7B96B0()
{
  return MEMORY[0x1F41836D0]();
}

uint64_t sub_18F7B96C0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_18F7B96D0()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_18F7B96E0()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_18F7B96F0()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_18F7B9700()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_18F7B9710()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_18F7B9720()
{
  return MEMORY[0x1F40D4A48]();
}

uint64_t sub_18F7B9730()
{
  return MEMORY[0x1F40E60B0]();
}

uint64_t sub_18F7B9740()
{
  return MEMORY[0x1F40E60E8]();
}

uint64_t sub_18F7B9750()
{
  return MEMORY[0x1F40E6100]();
}

uint64_t sub_18F7B9760()
{
  return MEMORY[0x1F40E6118]();
}

uint64_t sub_18F7B9770()
{
  return MEMORY[0x1F40E6120]();
}

uint64_t sub_18F7B9780()
{
  return MEMORY[0x1F40E6138]();
}

uint64_t sub_18F7B9790()
{
  return MEMORY[0x1F40E6150]();
}

uint64_t sub_18F7B97A0()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_18F7B97B0()
{
  return MEMORY[0x1F40E61A8]();
}

uint64_t sub_18F7B97C0()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t sub_18F7B97D0()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t sub_18F7B97E0()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_18F7B97F0()
{
  return MEMORY[0x1F40E6230]();
}

uint64_t sub_18F7B9800()
{
  return MEMORY[0x1F40E62F0]();
}

uint64_t sub_18F7B9810()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_18F7B9820()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_18F7B9830()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_18F7B9840()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_18F7B9850()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_18F7B9860()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_18F7B9870()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_18F7B9880()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_18F7B9890()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_18F7B98A0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_18F7B98B0()
{
  return MEMORY[0x1F4183A58]();
}

uint64_t sub_18F7B98C0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_18F7B98D0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_18F7B98E0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_18F7B98F0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_18F7B9900()
{
  return MEMORY[0x1F4183AA8]();
}

uint64_t sub_18F7B9910()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_18F7B9920()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_18F7B9930()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_18F7B9940()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t sub_18F7B9950()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_18F7B9960()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_18F7B9970()
{
  return MEMORY[0x1F40E6318]();
}

uint64_t sub_18F7B9980()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_18F7B9990()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_18F7B99A0()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_18F7B99B0()
{
  return MEMORY[0x1F40E6358]();
}

uint64_t sub_18F7B99C0()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_18F7B99D0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_18F7B99E0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_18F7B99F0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_18F7B9A00()
{
  return MEMORY[0x1F4183ED0]();
}

uint64_t sub_18F7B9A10()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_18F7B9A20()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_18F7B9A30()
{
  return MEMORY[0x1F40D4A68]();
}

uint64_t sub_18F7B9A40()
{
  return MEMORY[0x1F40D4A70]();
}

uint64_t sub_18F7B9A50()
{
  return MEMORY[0x1F40E6390]();
}

uint64_t sub_18F7B9A60()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_18F7B9A70()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_18F7B9A80()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_18F7B9AA0()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_18F7B9AB0()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_18F7B9AC0()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_18F7B9AD0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_18F7B9AE0()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_18F7B9AF0()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_18F7B9B00()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_18F7B9B20()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_18F7B9B30()
{
  return MEMORY[0x1F40E63B0]();
}

uint64_t sub_18F7B9B40()
{
  return MEMORY[0x1F40E63C0]();
}

uint64_t sub_18F7B9B50()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_18F7B9B70()
{
  return MEMORY[0x1F40E63F8]();
}

uint64_t sub_18F7B9B80()
{
  return MEMORY[0x1F40E6400]();
}

uint64_t sub_18F7B9B90()
{
  return MEMORY[0x1F40E6418]();
}

uint64_t sub_18F7B9BA0()
{
  return MEMORY[0x1F40E6420]();
}

uint64_t sub_18F7B9BC0()
{
  return MEMORY[0x1F40E6438]();
}

uint64_t sub_18F7B9BD0()
{
  return MEMORY[0x1F40E6460]();
}

uint64_t sub_18F7B9BE0()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_18F7B9BF0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_18F7B9C00()
{
  return MEMORY[0x1F40E6480]();
}

uint64_t sub_18F7B9C10()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_18F7B9C20()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_18F7B9C30()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_18F7B9C40()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_18F7B9C50()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_18F7B9C60()
{
  return MEMORY[0x1F40E64E0]();
}

uint64_t sub_18F7B9C70()
{
  return MEMORY[0x1F4123E10]();
}

uint64_t sub_18F7B9C80()
{
  return MEMORY[0x1F41028B0]();
}

uint64_t sub_18F7B9C90()
{
  return MEMORY[0x1F41028B8]();
}

uint64_t sub_18F7B9CA0()
{
  return MEMORY[0x1F4123E18]();
}

uint64_t sub_18F7B9CB0()
{
  return MEMORY[0x1F41028C0]();
}

uint64_t sub_18F7B9CC0()
{
  return MEMORY[0x1F41028C8]();
}

uint64_t sub_18F7B9CD0()
{
  return MEMORY[0x1F41028D0]();
}

uint64_t sub_18F7B9CE0()
{
  return MEMORY[0x1F4123E20]();
}

uint64_t sub_18F7B9CF0()
{
  return MEMORY[0x1F40E6540]();
}

uint64_t sub_18F7B9D00()
{
  return MEMORY[0x1F41028D8]();
}

uint64_t sub_18F7B9D10()
{
  return MEMORY[0x1F40E6648]();
}

uint64_t sub_18F7B9D20()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_18F7B9D30()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_18F7B9D40()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_18F7B9D50()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_18F7B9D60()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_18F7B9D70()
{
  return MEMORY[0x1F41028E0]();
}

uint64_t sub_18F7B9D80()
{
  return MEMORY[0x1F41028E8]();
}

uint64_t sub_18F7B9D90()
{
  return MEMORY[0x1F41028F8]();
}

uint64_t sub_18F7B9DA0()
{
  return MEMORY[0x1F4102910]();
}

uint64_t sub_18F7B9DB0()
{
  return MEMORY[0x1F41875A0]();
}

uint64_t sub_18F7B9DC0()
{
  return MEMORY[0x1F4122ED0]();
}

uint64_t sub_18F7B9DD0()
{
  return MEMORY[0x1F4102918]();
}

uint64_t sub_18F7B9DE0()
{
  return MEMORY[0x1F4102920]();
}

uint64_t sub_18F7B9DF0()
{
  return MEMORY[0x1F4102930]();
}

uint64_t sub_18F7B9E00()
{
  return MEMORY[0x1F4186FA8]();
}

uint64_t sub_18F7B9E10()
{
  return MEMORY[0x1F4186FF8]();
}

uint64_t sub_18F7B9E20()
{
  return MEMORY[0x1F4187008]();
}

uint64_t sub_18F7B9E30()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t sub_18F7B9E40()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_18F7B9E50()
{
  return MEMORY[0x1F40E6738]();
}

uint64_t sub_18F7B9E60()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_18F7B9E70()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_18F7B9E80()
{
  return MEMORY[0x1F4123E80]();
}

uint64_t sub_18F7B9E90()
{
  return MEMORY[0x1F40E6750]();
}

uint64_t sub_18F7B9EA0()
{
  return MEMORY[0x1F40E6760]();
}

uint64_t sub_18F7B9EB0()
{
  return MEMORY[0x1F40E6770]();
}

uint64_t sub_18F7B9EC0()
{
  return MEMORY[0x1F40E6790]();
}

uint64_t sub_18F7B9ED0()
{
  return MEMORY[0x1F40E67A8]();
}

uint64_t sub_18F7B9EE0()
{
  return MEMORY[0x1F4102960]();
}

uint64_t sub_18F7B9EF0()
{
  return MEMORY[0x1F40FCF08]();
}

uint64_t sub_18F7B9F00()
{
  return MEMORY[0x1F4102968]();
}

uint64_t sub_18F7B9F10()
{
  return MEMORY[0x1F4102980]();
}

uint64_t sub_18F7B9F20()
{
  return MEMORY[0x1F4102988]();
}

uint64_t sub_18F7B9F30()
{
  return MEMORY[0x1F4102990]();
}

uint64_t sub_18F7B9F40()
{
  return MEMORY[0x1F4102998]();
}

uint64_t sub_18F7B9F50()
{
  return MEMORY[0x1F4104CD8]();
}

uint64_t sub_18F7B9F60()
{
  return MEMORY[0x1F41029A0]();
}

uint64_t sub_18F7B9F70()
{
  return MEMORY[0x1F41029A8]();
}

uint64_t sub_18F7B9F80()
{
  return MEMORY[0x1F41029B0]();
}

uint64_t sub_18F7B9F90()
{
  return MEMORY[0x1F40E6830]();
}

uint64_t sub_18F7B9FA0()
{
  return MEMORY[0x1F40E6850]();
}

uint64_t sub_18F7B9FB0()
{
  return MEMORY[0x1F41029C0]();
}

uint64_t sub_18F7B9FC0()
{
  return MEMORY[0x1F40E68F0]();
}

uint64_t sub_18F7B9FD0()
{
  return MEMORY[0x1F40E6908]();
}

uint64_t sub_18F7B9FE0()
{
  return MEMORY[0x1F41874B0]();
}

uint64_t sub_18F7B9FF0()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_18F7BA000()
{
  return MEMORY[0x1F41874C8]();
}

uint64_t sub_18F7BA010()
{
  return MEMORY[0x1F41029C8]();
}

uint64_t sub_18F7BA020()
{
  return MEMORY[0x1F41029D0]();
}

uint64_t sub_18F7BA030()
{
  return MEMORY[0x1F41029D8]();
}

uint64_t sub_18F7BA040()
{
  return MEMORY[0x1F41029E0]();
}

uint64_t sub_18F7BA050()
{
  return MEMORY[0x1F41029E8]();
}

uint64_t sub_18F7BA060()
{
  return MEMORY[0x1F41029F0]();
}

uint64_t sub_18F7BA070()
{
  return MEMORY[0x1F41029F8]();
}

uint64_t sub_18F7BA080()
{
  return MEMORY[0x1F4102A00]();
}

uint64_t sub_18F7BA090()
{
  return MEMORY[0x1F4102A08]();
}

uint64_t sub_18F7BA0A0()
{
  return MEMORY[0x1F4102A10]();
}

uint64_t sub_18F7BA0B0()
{
  return MEMORY[0x1F4102A18]();
}

uint64_t sub_18F7BA0C0()
{
  return MEMORY[0x1F4102A20]();
}

uint64_t sub_18F7BA0D0()
{
  return MEMORY[0x1F4102A28]();
}

uint64_t sub_18F7BA0E0()
{
  return MEMORY[0x1F4102A30]();
}

uint64_t sub_18F7BA0F0()
{
  return MEMORY[0x1F4102A38]();
}

uint64_t sub_18F7BA100()
{
  return MEMORY[0x1F4102A40]();
}

uint64_t sub_18F7BA110()
{
  return MEMORY[0x1F4102A48]();
}

uint64_t sub_18F7BA120()
{
  return MEMORY[0x1F4102A50]();
}

uint64_t sub_18F7BA130()
{
  return MEMORY[0x1F4102A58]();
}

uint64_t sub_18F7BA140()
{
  return MEMORY[0x1F4102A60]();
}

uint64_t sub_18F7BA150()
{
  return MEMORY[0x1F4102A68]();
}

uint64_t sub_18F7BA160()
{
  return MEMORY[0x1F4102A70]();
}

uint64_t sub_18F7BA170()
{
  return MEMORY[0x1F4102A78]();
}

uint64_t sub_18F7BA180()
{
  return MEMORY[0x1F4102A80]();
}

uint64_t sub_18F7BA190()
{
  return MEMORY[0x1F4102A88]();
}

uint64_t sub_18F7BA1A0()
{
  return MEMORY[0x1F4102A90]();
}

uint64_t sub_18F7BA1B0()
{
  return MEMORY[0x1F4102A98]();
}

uint64_t sub_18F7BA1C0()
{
  return MEMORY[0x1F4102AA0]();
}

uint64_t sub_18F7BA1D0()
{
  return MEMORY[0x1F4102AA8]();
}

uint64_t sub_18F7BA1E0()
{
  return MEMORY[0x1F4102AB0]();
}

uint64_t sub_18F7BA1F0()
{
  return MEMORY[0x1F4102AB8]();
}

uint64_t sub_18F7BA200()
{
  return MEMORY[0x1F40E6950]();
}

uint64_t sub_18F7BA210()
{
  return MEMORY[0x1F40E6A90]();
}

uint64_t sub_18F7BA220()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_18F7BA230()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_18F7BA240()
{
  return MEMORY[0x1F4102AC0]();
}

uint64_t sub_18F7BA250()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_18F7BA260()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_18F7BA270()
{
  return MEMORY[0x1F4184798]();
}

uint64_t sub_18F7BA280()
{
  return MEMORY[0x1F40E6B88]();
}

uint64_t sub_18F7BA290()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_18F7BA2A0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_18F7BA2B0()
{
  return MEMORY[0x1F40E6BB8]();
}

uint64_t sub_18F7BA2C0()
{
  return MEMORY[0x1F40E6C60]();
}

uint64_t sub_18F7BA2D0()
{
  return MEMORY[0x1F40E6CC0]();
}

uint64_t sub_18F7BA2E0()
{
  return MEMORY[0x1F40E6CE0]();
}

uint64_t sub_18F7BA2F0()
{
  return MEMORY[0x1F40E6D30]();
}

uint64_t sub_18F7BA300()
{
  return MEMORY[0x1F40E6D80]();
}

uint64_t sub_18F7BA310()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_18F7BA320()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_18F7BA340()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_18F7BA350()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_18F7BA360()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_18F7BA370()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_18F7BA380()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_18F7BA390()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_18F7BA3A0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_18F7BA3B0()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_18F7BA3C0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_18F7BA3D0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_18F7BA3E0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_18F7BA3F0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_18F7BA400()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_18F7BA410()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_18F7BA420()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_18F7BA430()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_18F7BA440()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_18F7BA450()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_18F7BA460()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_18F7BA470()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_18F7BA480()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_18F7BA490()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_18F7BA4B0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_18F7BA4C0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_18F7BA4D0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_18F7BA4E0()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_18F7BA4F0()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_18F7BA500()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_18F7BA510()
{
  return MEMORY[0x1F4187FC8]();
}

uint64_t sub_18F7BA520()
{
  return MEMORY[0x1F4187FD0]();
}

uint64_t sub_18F7BA530()
{
  return MEMORY[0x1F4187FE0]();
}

uint64_t sub_18F7BA540()
{
  return MEMORY[0x1F4187FE8]();
}

uint64_t sub_18F7BA550()
{
  return MEMORY[0x1F4187FF0]();
}

uint64_t sub_18F7BA560()
{
  return MEMORY[0x1F4188000]();
}

uint64_t sub_18F7BA570()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_18F7BA580()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_18F7BA590()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_18F7BA5A0()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_18F7BA5B0()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_18F7BA5C0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_18F7BA5D0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_18F7BA5E0()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_18F7BA5F0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_18F7BA600()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_18F7BA610()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_18F7BA620()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_18F7BA630()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_18F7BA640()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_18F7BA650()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_18F7BA660()
{
  return MEMORY[0x1F41853C0]();
}

uint64_t sub_18F7BA670()
{
  return MEMORY[0x1F41853D8]();
}

uint64_t sub_18F7BA680()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_18F7BA690()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t sub_18F7BA6A0()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_18F7BA6B0()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_18F7BA6C0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_18F7BA6D0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_18F7BA6F0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_18F7BA700()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_18F7BA710()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_18F7BA720()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_18F7BA740()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_18F7BA750()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_18F7BA760()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_18F7BA770()
{
  return MEMORY[0x1F40E6E28]();
}

uint64_t sub_18F7BA780()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_18F7BA790()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_18F7BA7A0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_18F7BA7B0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_18F7BA7D0()
{
  return MEMORY[0x1F4185E98]();
}

uint64_t sub_18F7BA7E0()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_18F7BA7F0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_18F7BA800()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_18F7BA810()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_18F7BA820()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_18F7BA830()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_18F7BA840()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_18F7BA850()
{
  return MEMORY[0x1F40E6ED0]();
}

uint64_t sub_18F7BA860()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_18F7BA870()
{
  return MEMORY[0x1F4186318]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x1F410B538](inAudioFile);
}

OSStatus AudioFileCreateWithURL(CFURLRef inFileRef, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inFormat, AudioFileFlags inFlags, AudioFileID *outAudioFile)
{
  return MEMORY[0x1F410B540](inFileRef, *(void *)&inFileType, inFormat, *(void *)&inFlags, outAudioFile);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x1F410B568](inFileRef, inPermissions, *(void *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileWritePackets(AudioFileID inAudioFile, Boolean inUseCache, UInt32 inNumBytes, const AudioStreamPacketDescription *inPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, const void *inBuffer)
{
  return MEMORY[0x1F410B598](inAudioFile, inUseCache, *(void *)&inNumBytes, inPacketDescriptions, inStartingPacket, ioNumPackets, inBuffer);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1F410B5A0](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

uint64_t CAColorMatrixMakeBrightness()
{
  return MEMORY[0x1F40F4A50]();
}

uint64_t CAColorMatrixMakeContrast()
{
  return MEMORY[0x1F40F4A60]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1F40F4A80]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CAMShutterButtonSpecMake()
{
  return MEMORY[0x1F410FA98]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x1F40F4CE0](a, b);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40F4CE8](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D48](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D58](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D68](retstr, t, tx, ty, tz);
}

uint64_t CEMCreateEmojiCharacterSet()
{
  return MEMORY[0x1F4113BA0]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x1F4113BB0]();
}

uint64_t CEMEmojiTokenCopyName()
{
  return MEMORY[0x1F4113BF0]();
}

uint64_t CEMEmojiTokenCreateWithString()
{
  return MEMORY[0x1F4113C20]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x1F4113C58]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x1F4113C70]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1F4113C88]();
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x1F4113C98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1F40D77B8]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

uint64_t CFGetUserName()
{
  return MEMORY[0x1F40D7B88]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D18]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

uint64_t CFPhoneNumberCopyUnformattedInternationalRepresentation()
{
  return MEMORY[0x1F4114210]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x1F40D9798](retstr, transform);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMake(CGAffineTransform *__return_ptr retstr, CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C0](retstr, a, b, c, d, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1F40D9A08](colorName);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

CGAffineTransform *__cdecl CGContextGetTextMatrix(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40DA020](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9958]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CGImageSourceGetTypeWithURL()
{
  return MEMORY[0x1F40E9A40]();
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return MEMORY[0x1F40DB208]((__n128)point1, *(__n128 *)&point1.y, (__n128)point2, *(__n128 *)&point2.y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1F40DB4D8]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

uint64_t CMPhotoJPEGCreateCGImageFromJPEG()
{
  return MEMORY[0x1F410DA48]();
}

uint64_t CMPhotoJPEGDecodeSessionCreate()
{
  return MEMORY[0x1F410DAB0]();
}

uint64_t CMPhotoJPEGDecodeSessionCreateCGImageFromData()
{
  return MEMORY[0x1F410DAB8]();
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

uint64_t CNUIIsMessages()
{
  return MEMORY[0x1F40D6F68]();
}

uint64_t CPBitmapCreateImagesFromPath()
{
  return MEMORY[0x1F4109258]();
}

uint64_t CPBitmapWriterAddImage()
{
  return MEMORY[0x1F4109270]();
}

uint64_t CPBitmapWriterCreate()
{
  return MEMORY[0x1F4109278]();
}

uint64_t CPBitmapWriterFinalize()
{
  return MEMORY[0x1F4109290]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
}

uint64_t CPFreeSpaceRequestBytesAtPathWithCompletionBlock()
{
  return MEMORY[0x1F4109308]();
}

uint64_t CPPhoneNumberCopyCountryCodeForIncomingTextMessage()
{
  return MEMORY[0x1F4109348]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1F40DF300]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1F40DF338](font, matrix, attributes, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF398](name, matrix, options, size);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x1F40DF4C0](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x1F40DF558](font);
  return result;
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1F40DF7A0]();
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF8B8](run);
}

uint64_t CTRunGetFont()
{
  return MEMORY[0x1F40DF8D0]();
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1F40DF8D8](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFIndex v1 = MEMORY[0x1F40DF940](run);
  result.length = v2;
  result.location = v1;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t ExtractURLQueries()
{
  return MEMORY[0x1F4123650]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1F4122BD8]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1F4122BE0]();
}

uint64_t IMAVURLAssetOptionsDefault()
{
  return MEMORY[0x1F4123E98]();
}

uint64_t IMAVURLAssetOptionsWithExtraOptions()
{
  return MEMORY[0x1F4123EA0]();
}

uint64_t IMAVURLAssetOptionsWithExtraOptionsForWrite()
{
  return MEMORY[0x1F4123EA8]();
}

uint64_t IMAssociatedMessageDecodeGUID()
{
  return MEMORY[0x1F4123ED0]();
}

uint64_t IMAttachmentEmojiImagePreviewFileURL()
{
  return MEMORY[0x1F4123EE0]();
}

uint64_t IMAttachmentFileNameAndExtension()
{
  return MEMORY[0x1F4123EE8]();
}

uint64_t IMAttachmentPreviewFileURL()
{
  return MEMORY[0x1F4123EF0]();
}

uint64_t IMAttachmentPreviewFileURLFromURLWithSuffix()
{
  return MEMORY[0x1F4123EF8]();
}

uint64_t IMAttachmentPreviewMetadataFileURL()
{
  return MEMORY[0x1F4123F00]();
}

uint64_t IMAttributedStringByRemovingTrackingInformation()
{
  return MEMORY[0x1F4122ED8]();
}

uint64_t IMBagBoolValueWithDefault()
{
  return MEMORY[0x1F4123F10]();
}

uint64_t IMBagIntValueWithDefault()
{
  return MEMORY[0x1F4123F20]();
}

uint64_t IMBalloonBundleIDFromExtensionID()
{
  return MEMORY[0x1F4123F28]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x1F4123F30]();
}

uint64_t IMBalloonExtensionIDWithTeamAndSuffix()
{
  return MEMORY[0x1F4123F38]();
}

uint64_t IMBiomeQueue()
{
  return MEMORY[0x1F4123F50]();
}

uint64_t IMCachesDirectoryURL()
{
  return MEMORY[0x1F4123F78]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x1F4123678]();
}

uint64_t IMChatCalculateServiceForSendingNewComposeMaybeForce()
{
  return MEMORY[0x1F4122EE0]();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return MEMORY[0x1F4123F90]();
}

uint64_t IMClearDisplayKeepMessagesSetting()
{
  return MEMORY[0x1F4123F98]();
}

uint64_t IMClientPreviewConstraints()
{
  return MEMORY[0x1F4123FA0]();
}

uint64_t IMClientPreviewStickerConstraints()
{
  return MEMORY[0x1F4123FA8]();
}

uint64_t IMClientTelemetryLogHandle()
{
  return MEMORY[0x1F4123FB0]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x1F4123688]();
}

uint64_t IMCoreMomentShareURLForMessage()
{
  return MEMORY[0x1F4122EE8]();
}

uint64_t IMCountryCodeForNumber()
{
  return MEMORY[0x1F41236C8]();
}

uint64_t IMCreateHEICSImageDataFromCGImageRef()
{
  return MEMORY[0x1F4124000]();
}

uint64_t IMCreatePNGImageDataFromCGImageRef()
{
  return MEMORY[0x1F4124010]();
}

uint64_t IMCreateThumbnailWithImageSourceAtIndexForMaxDimension()
{
  return MEMORY[0x1F4124028]();
}

uint64_t IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset()
{
  return MEMORY[0x1F4123088]();
}

uint64_t IMDAttachmentFindLargestConversations()
{
  return MEMORY[0x1F4123090]();
}

uint64_t IMDAttachmentFindLargestNonSyncedAttachmentGUIDs()
{
  return MEMORY[0x1F41230A0]();
}

uint64_t IMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays()
{
  return MEMORY[0x1F4123140]();
}

uint64_t IMDAttachmentRecordGetNonSyncedAttachmentDiskSpace()
{
  return MEMORY[0x1F4123150]();
}

uint64_t IMDAttachmentSpaceTakenByAttachmentClass()
{
  return MEMORY[0x1F4123190]();
}

uint64_t IMDChatRecordCopyChatIdentifier()
{
  return MEMORY[0x1F4123240]();
}

uint64_t IMDCopyAttachmentPersistentPath()
{
  return MEMORY[0x1F41232F8]();
}

uint64_t IMDCoreSpotlightIndexNextMessageBatchIfNeededBlocking()
{
  return MEMORY[0x1F4123328]();
}

uint64_t IMDCoreSpotlightSetNeedsMessageReindexBlocking()
{
  return MEMORY[0x1F4123348]();
}

uint64_t IMDDScanAttributedStringWithContext()
{
  return MEMORY[0x1F4123708]();
}

uint64_t IMDMessageRecordBulkCopy()
{
  return MEMORY[0x1F4123408]();
}

uint64_t IMDMessageRecordChatForMessageGUID()
{
  return MEMORY[0x1F4123418]();
}

uint64_t IMDMessageRecordCopyMostRecentUseageOfAddresses()
{
  return MEMORY[0x1F4123500]();
}

uint64_t IMDPersistencePerformBlock()
{
  return MEMORY[0x1F41235D8]();
}

uint64_t IMDeviceIsGreenTea()
{
  return MEMORY[0x1F4124050]();
}

uint64_t IMEmotePrefixes()
{
  return MEMORY[0x1F4122EF0]();
}

uint64_t IMEnableInlineReplyGlyph()
{
  return MEMORY[0x1F4124068]();
}

uint64_t IMEnableModernTranscript()
{
  return MEMORY[0x1F4124078]();
}

uint64_t IMEnableTranscriptChromelessNavBar()
{
  return MEMORY[0x1F4124088]();
}

uint64_t IMEncryptedIdentifier()
{
  return MEMORY[0x1F4122EF8]();
}

uint64_t IMEstimateDurationForSize()
{
  return MEMORY[0x1F4124090]();
}

uint64_t IMExtensionPayloadUnarchivingClasses()
{
  return MEMORY[0x1F4124098]();
}

uint64_t IMFauxMessageGUIDForTapbackOfCMMAssetAtIndexInParentMessageGUID()
{
  return MEMORY[0x1F41240A0]();
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x1F4123728]();
}

uint64_t IMFileSizeForItemAtPath()
{
  return MEMORY[0x1F41240A8]();
}

uint64_t IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex()
{
  return MEMORY[0x1F41240B8]();
}

uint64_t IMFileTransferGUIDIsTemporary()
{
  return MEMORY[0x1F41240D8]();
}

uint64_t IMFileURLIsActuallyAnimated()
{
  return MEMORY[0x1F41240F0]();
}

uint64_t IMFindExistingChatForAddresses()
{
  return MEMORY[0x1F4122F00]();
}

uint64_t IMFormattedDisplayStringForIDInAddressBook()
{
  return MEMORY[0x1F4122F08]();
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1F4123748]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x1F4123768]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x1F4123780]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1F4123788]();
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1F4123790]();
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return MEMORY[0x1F41237A0]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1F41237B8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1F41237D0]();
}

uint64_t IMGetUserIgnoreFailureUpdateAppleIDIntent()
{
  return MEMORY[0x1F4124100]();
}

uint64_t IMGetUserIgnoreFailureWaitingForCloudIntent()
{
  return MEMORY[0x1F4124108]();
}

uint64_t IMGetUserIgnoreLogoutIntent()
{
  return MEMORY[0x1F4124110]();
}

uint64_t IMGetUserLoginIntent()
{
  return MEMORY[0x1F4124118]();
}

uint64_t IMGetUserRegistrationFailureIntent()
{
  return MEMORY[0x1F4124120]();
}

uint64_t IMIndexesFromOrderedCollectionDifference()
{
  return MEMORY[0x1F4122F10]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1F41238A0]();
}

uint64_t IMIsAAVideoURL()
{
  return MEMORY[0x1F4124148]();
}

uint64_t IMIsEnrolledInContactKeyVerification()
{
  return MEMORY[0x1F4122F18]();
}

uint64_t IMIsHEVCWithAlphaVideo()
{
  return MEMORY[0x1F4124150]();
}

uint64_t IMIsHEVCWithAlphaVideoFromData()
{
  return MEMORY[0x1F4124158]();
}

uint64_t IMIsImageURLAScreenshot()
{
  return MEMORY[0x1F4124160]();
}

uint64_t IMIsOscarEnabled()
{
  return MEMORY[0x1F4122F20]();
}

uint64_t IMIsPlugInProxyAMessagesExtensionPoint()
{
  return MEMORY[0x1F4124168]();
}

uint64_t IMIsRunningInMessages()
{
  return MEMORY[0x1F41241A0]();
}

uint64_t IMIsRunningInMessagesComposeViewService()
{
  return MEMORY[0x1F41241A8]();
}

uint64_t IMIsRunningInMessagesExtension()
{
  return MEMORY[0x1F41241B0]();
}

uint64_t IMIsRunningInMessagesTranscriptExtension()
{
  return MEMORY[0x1F41241B8]();
}

uint64_t IMIsRunningInMessagesUIProcess()
{
  return MEMORY[0x1F41241C0]();
}

uint64_t IMIsRunningInMessagesViewService()
{
  return MEMORY[0x1F41241C8]();
}

uint64_t IMIsRunningInScreenshotTesting_IsolatedTranscriptUI()
{
  return MEMORY[0x1F41241E0]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x1F41241E8]();
}

uint64_t IMIsRunningIniMessageAppExtension()
{
  return MEMORY[0x1F41241F0]();
}

uint64_t IMIsRunningIniMessageAppsViewService()
{
  return MEMORY[0x1F41241F8]();
}

uint64_t IMIsStringStewieEmergency()
{
  return MEMORY[0x1F4124210]();
}

uint64_t IMIsStringStewieRoadside()
{
  return MEMORY[0x1F4124218]();
}

uint64_t IMIsSupportedUTIType()
{
  return MEMORY[0x1F4124220]();
}

uint64_t IMLegacyCalculateFileSizeForPath()
{
  return MEMORY[0x1F4124228]();
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x1F41238B0]();
}

uint64_t IMLogExceptionBacktrace()
{
  return MEMORY[0x1F41238B8]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x1F4124230]();
}

uint64_t IMLogSimulateCrashForException()
{
  return MEMORY[0x1F41238C8]();
}

uint64_t IMLogSimulateCrashForProcess()
{
  return MEMORY[0x1F41238D0]();
}

uint64_t IMLookUpExtensionInCache()
{
  return MEMORY[0x1F4124238]();
}

uint64_t IMMMSPartCanBeSent()
{
  return MEMORY[0x1F4123928]();
}

uint64_t IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier()
{
  return MEMORY[0x1F4124250]();
}

uint64_t IMMessageCreateThreadIdentifierWithOriginatorGUID()
{
  return MEMORY[0x1F4124260]();
}

uint64_t IMMessageGuidFromIMFileTransferGuid()
{
  return MEMORY[0x1F4124268]();
}

uint64_t IMMessageItemExpireStateExpiringDuration()
{
  return MEMORY[0x1F4124270]();
}

uint64_t IMMessageSoundPlayReceivedAckSound()
{
  return MEMORY[0x1F4124290]();
}

uint64_t IMMessageThreadIdentifierOriginatorGUIDAndPartMatch()
{
  return MEMORY[0x1F41242C0]();
}

uint64_t IMMetricsValueForAssociatedMessageContentType()
{
  return MEMORY[0x1F41242D0]();
}

uint64_t IMMomentShareCacheErrorIsPermanent()
{
  return MEMORY[0x1F4122F28]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x1F4123948]();
}

uint64_t IMNormalizePhoneNumber()
{
  return MEMORY[0x1F41242E0]();
}

uint64_t IMNormalizedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x1F4123950]();
}

uint64_t IMNormalizedPhoneNumberForPhoneNumber()
{
  return MEMORY[0x1F4123958]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x1F4123960]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x1F4123980]();
}

uint64_t IMPluginSnapshotCachesFileURL()
{
  return MEMORY[0x1F41242E8]();
}

uint64_t IMPluginSnapshotExistsInCache()
{
  return MEMORY[0x1F41242F0]();
}

uint64_t IMPreferredAccountForService()
{
  return MEMORY[0x1F4122F30]();
}

uint64_t IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService()
{
  return MEMORY[0x1F4122F38]();
}

uint64_t IMPreviewCachesDirectoryWithAttachmentURL()
{
  return MEMORY[0x1F41242F8]();
}

uint64_t IMPreviewConstraintsEqualToConstraints()
{
  return MEMORY[0x1F4124300]();
}

uint64_t IMPreviewConstraintsFromDictionary()
{
  return MEMORY[0x1F4124308]();
}

uint64_t IMPreviewConstraintsZero()
{
  return MEMORY[0x1F4124310]();
}

uint64_t IMPreviewExtension()
{
  return MEMORY[0x1F4124318]();
}

uint64_t IMResetCachedCarrierSettings()
{
  return MEMORY[0x1F41239D0]();
}

uint64_t IMResetCachedUserSettings()
{
  return MEMORY[0x1F41239D8]();
}

uint64_t IMResetInternationalFilterEligibilityState()
{
  return MEMORY[0x1F4122F40]();
}

uint64_t IMResetJunkiMessageFilteringState()
{
  return MEMORY[0x1F4122F48]();
}

uint64_t IMRichLinkUtilitiesEnumerateRichLinksInAttributedString()
{
  return MEMORY[0x1F4122F50]();
}

uint64_t IMRichLinkUtilitiesIsSupportedRichLinkURL()
{
  return MEMORY[0x1F4122F58]();
}

uint64_t IMSMSDirectoryURL()
{
  return MEMORY[0x1F4124358]();
}

uint64_t IMSMSReportSpamExtensionAvailable()
{
  return MEMORY[0x1F4124368]();
}

uint64_t IMSPISendMessageWithAttachmentsFromSubscriptionIdentifier()
{
  return MEMORY[0x1F4122FB8]();
}

uint64_t IMSPISetChatContextForSubscriptionIdentifier()
{
  return MEMORY[0x1F4122FD8]();
}

uint64_t IMSSMSReportSpamShouldShowReportMessagesForItems()
{
  return MEMORY[0x1F4124378]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x1F4124380]();
}

uint64_t IMSanitizedAppIconDataForIMExtensionPayloadAppIconKey()
{
  return MEMORY[0x1F4124388]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1F41239F8]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1F4123A08]();
}

uint64_t IMSetUserIgnoreFailureUpdateAppleIDIntent()
{
  return MEMORY[0x1F41243D0]();
}

uint64_t IMSetUserIgnoreFailureWaitingForCloudIntent()
{
  return MEMORY[0x1F41243D8]();
}

uint64_t IMSetUserIgnoreLogoutIntent()
{
  return MEMORY[0x1F41243E0]();
}

uint64_t IMSetUserLoginIntent()
{
  return MEMORY[0x1F41243E8]();
}

uint64_t IMSharedDowntimeController()
{
  return MEMORY[0x1F4122FE0]();
}

uint64_t IMSharedHelperAlwaysShowNicknameBanners()
{
  return MEMORY[0x1F41243F8]();
}

uint64_t IMSharedHelperBusinessAllowlist()
{
  return MEMORY[0x1F4124410]();
}

uint64_t IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs()
{
  return MEMORY[0x1F4124430]();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return MEMORY[0x1F4124440]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x1F4124448]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive()
{
  return MEMORY[0x1F4124450]();
}

uint64_t IMSharedHelperDeviceIsiPad()
{
  return MEMORY[0x1F4124460]();
}

uint64_t IMSharedHelperDeviceIsiPod()
{
  return MEMORY[0x1F4124468]();
}

uint64_t IMSharedHelperEnsureDirectoryExistsAtPath()
{
  return MEMORY[0x1F4124470]();
}

uint64_t IMSharedHelperIsOlderDevice()
{
  return MEMORY[0x1F4124498]();
}

uint64_t IMSharedHelperMD5HashOfFileAtPath()
{
  return MEMORY[0x1F41244A0]();
}

uint64_t IMSharedHelperMD5OfData()
{
  return MEMORY[0x1F41244A8]();
}

uint64_t IMSharedHelperMessagesRootFolderPath()
{
  return MEMORY[0x1F41244B8]();
}

uint64_t IMSharedHelperMissingKeysInStickerUserInfo()
{
  return MEMORY[0x1F41244C0]();
}

uint64_t IMSharedHelperNickNameEnabled()
{
  return MEMORY[0x1F41244D0]();
}

uint64_t IMSharedHelperPayloadFromCombinedPluginPayloadData()
{
  return MEMORY[0x1F41244E0]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x1F4124540]();
}

uint64_t IMShouldDisplayKeepMessagesSetting()
{
  return MEMORY[0x1F4124550]();
}

uint64_t IMShouldHandleInternalPhishingAttempts()
{
  return MEMORY[0x1F4124558]();
}

uint64_t IMStickerEffectTypeShouldAvoidEffectView()
{
  return MEMORY[0x1F4124578]();
}

uint64_t IMStickersExtensionIdentifier()
{
  return MEMORY[0x1F4124580]();
}

uint64_t IMStringFromIMCloudKitSyncJobState()
{
  return MEMORY[0x1F41245D8]();
}

uint64_t IMStringFromIMFileTransferUpdateReason()
{
  return MEMORY[0x1F41245F0]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x1F4123A40]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1F4123A48]();
}

uint64_t IMStringIsEmergencyPhoneNumber()
{
  return MEMORY[0x1F4123A50]();
}

uint64_t IMStringIsEmpty()
{
  return MEMORY[0x1F4123A58]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1F4123A70]();
}

uint64_t IMStringIsStewie()
{
  return MEMORY[0x1F4123A80]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x1F4123A90]();
}

uint64_t IMStripLoginID()
{
  return MEMORY[0x1F4123A98]();
}

uint64_t IMSupportsUserNotifications()
{
  return MEMORY[0x1F4124618]();
}

uint64_t IMTextEffectDiscoverabilityTitleLocalizationKeyFromType()
{
  return MEMORY[0x1F4124628]();
}

uint64_t IMTextEffectLocalizationKeyFromType()
{
  return MEMORY[0x1F4124630]();
}

uint64_t IMTextEffectNameFromType()
{
  return MEMORY[0x1F4124638]();
}

uint64_t IMTextEffectOrderedSupportedNames()
{
  return MEMORY[0x1F4124640]();
}

uint64_t IMTextEffectTypeFromName()
{
  return MEMORY[0x1F4124648]();
}

uint64_t IMTextStyleAttributeNameFromStyle()
{
  return MEMORY[0x1F4124650]();
}

uint64_t IMTranscriptChatItemEqual()
{
  return MEMORY[0x1F4122FF0]();
}

uint64_t IMUTITypeForExtension()
{
  return MEMORY[0x1F4124658]();
}

uint64_t IMUTITypeForFilename()
{
  return MEMORY[0x1F4124660]();
}

uint64_t IMUTITypeIsAnimatedImage()
{
  return MEMORY[0x1F4124668]();
}

uint64_t IMUTITypeIsPhoto()
{
  return MEMORY[0x1F4124678]();
}

uint64_t IMUTITypeIsSupportedForTranscodeOnSend()
{
  return MEMORY[0x1F4124688]();
}

uint64_t IMUTITypeIsVideo()
{
  return MEMORY[0x1F4124690]();
}

uint64_t IMUTTypeIsSupportedAnimatedImage()
{
  return MEMORY[0x1F41246D0]();
}

uint64_t IMUTTypeIsWatchface()
{
  return MEMORY[0x1F41246F0]();
}

uint64_t IMUTTypeWantsQuicklook()
{
  return MEMORY[0x1F41246F8]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1F4123AF0]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1F4123AF8]();
}

uint64_t IM_APFS_PURGEABLE_IGNORE_ME()
{
  return MEMORY[0x1F4124718]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t LICreateDefaultIcon()
{
  return MEMORY[0x1F412F8B0]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x1F412F8C0]();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x1F412F8C8]();
}

uint64_t LIIconOutputSizeForVariant()
{
  return MEMORY[0x1F412F8E0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x1F40ECE20]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t MarcoLogMadridLevelCF_V()
{
  return MEMORY[0x1F412C638]();
}

uint64_t MarcoShouldLogMadridLevelCF()
{
  return MEMORY[0x1F412C660]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FE0](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1F4102AF0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1F4102B10](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x1F4123B88]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x1F4123B90]();
}

uint64_t PKPeerPaymentShouldDisplayResultForDetectedAmount()
{
  return MEMORY[0x1F413B778]();
}

uint64_t PNCopyCompressedFormattedStringWithCountry()
{
  return MEMORY[0x1F4114248]();
}

uint64_t PUPhotosFileProviderTypeIdentifierLivePhotoBundle()
{
  return MEMORY[0x1F4144618]();
}

uint64_t PXDisplayAssetFetchResultFromArray()
{
  return MEMORY[0x1F4143CA0]();
}

uint64_t PXEdgeInsetsInsetSize()
{
  return MEMORY[0x1F4143CC8]();
}

uint64_t PXFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F4143CF8]();
}

uint64_t PXFloatFloorToPixel()
{
  return MEMORY[0x1F4143D00]();
}

uint64_t PXLargestSalientAspectFilledCropRect()
{
  return MEMORY[0x1F4143D30]();
}

uint64_t PXLocalizationKeyForMediaType()
{
  return MEMORY[0x1F4143D68]();
}

uint64_t PXRectFlippedVertically()
{
  return MEMORY[0x1F4143EE0]();
}

uint64_t PXRectNormalize()
{
  return MEMORY[0x1F4143EE8]();
}

uint64_t PXRectWithAspectRatioFittingRect()
{
  return MEMORY[0x1F4143EF0]();
}

uint64_t PXSimpleIndexPathDescription()
{
  return MEMORY[0x1F4143FA8]();
}

uint64_t QLPreviewControllerSupportsContentType()
{
  return MEMORY[0x1F40F4DF0]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x1F415C408]();
}

uint64_t SBSSetAlertSuppressionContexts()
{
  return MEMORY[0x1F415C420]();
}

uint64_t SWCollaborationMetadataForDocumentURL()
{
  return MEMORY[0x1F40F75D0]();
}

uint64_t StringGUID()
{
  return MEMORY[0x1F4123BA8]();
}

uint64_t TUOpenURL()
{
  return MEMORY[0x1F4163AA8]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4102B28]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1F4102B30]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1F4102B40]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4102B58]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

uint64_t UIAuditTokenTaskHasEntitlement()
{
  return MEMORY[0x1F4102BA0]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4102BB0]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4102BE0]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1F4102C18]();
}

void UIGraphicsBeginImageContext(CGSize size)
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
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

uint64_t UIImageDataWriteToSavedPhotosAlbum()
{
  return MEMORY[0x1F4102C60]();
}

uint64_t UIImageGetUnreadIndicator()
{
  return MEMORY[0x1F4102C70]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1F4102CA8]();
}

uint64_t UIKeyboardOrderInAutomaticSkippingAnimation()
{
  return MEMORY[0x1F4102D18]();
}

uint64_t UIKeyboardPredictionEnabledForCurrentInputMode()
{
  return MEMORY[0x1F4102D38]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1F4102D70]();
}

uint64_t UIRectCornersAtEdges()
{
  return MEMORY[0x1F4102DA0]();
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UIRectRoundToViewScale()
{
  return MEMORY[0x1F4102DE8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4102E00]();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x1F4102E40]();
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x1F4102E48](videoPath);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE40](inUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1F40DEE68](inUTI1, inUTI2);
}

uint64_t _AXSForceTouchTimeDuration()
{
  return MEMORY[0x1F4178AD0]();
}

uint64_t _AXSReduceMotionAutoplayAnimatedImagesEnabled()
{
  return MEMORY[0x1F4178E48]();
}

uint64_t _AXSReduceMotionAutoplayMessagesEffectsEnabled()
{
  return MEMORY[0x1F4178E50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CreateIMMessageFromIMItem()
{
  return MEMORY[0x1F4122FF8]();
}

uint64_t _FTAreIDsEquivalent()
{
  return MEMORY[0x1F4119000]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1F4123BB8]();
}

uint64_t _IMBestAccountForIMItem()
{
  return MEMORY[0x1F4123000]();
}

uint64_t _IMChatServiceForSendingAvailabilityErrorFromReachabilityResults()
{
  return MEMORY[0x1F4123008]();
}

uint64_t _IMLog()
{
  return MEMORY[0x1F4123BD8]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x1F4123C00]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1F4123C08]();
}

uint64_t _NSStringFromIMMessageError()
{
  return MEMORY[0x1F4123010]();
}

uint64_t _UIApplicationUsesLegacyUI()
{
  return MEMORY[0x1F4102EC0]();
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x1F4102F08]();
}

uint64_t _UISheetMinimumTopInset()
{
  return MEMORY[0x1F4102F58]();
}

uint64_t _UIStickerCreateAdaptiveImageGlyphFromSticker()
{
  return MEMORY[0x1F4102F80]();
}

uint64_t _UIStickerCreateStickerFromTextInputPayload()
{
  return MEMORY[0x1F4102F88]();
}

uint64_t _UIUpdateCycleEnabled()
{
  return MEMORY[0x1F4102FD8]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1F4102FE0]();
}

uint64_t _UIUpdateSequenceInsertItem()
{
  return MEMORY[0x1F4102FF0]();
}

uint64_t _UIUpdateSequenceRemoveItem()
{
  return MEMORY[0x1F4102FF8]();
}

uint64_t _UIUserInterfaceSizeClassForHeight()
{
  return MEMORY[0x1F4103000]();
}

uint64_t _UIUserInterfaceSizeClassForWidth()
{
  return MEMORY[0x1F4103008]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKPassSecurePreviewContextCreateMessagesPreview(NSURL *a1, NSURL *a2)
{
  return MEMORY[0x1F413C0D8](a1, a2);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1F40C9D48]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

float acosf(float a1)
{
  MEMORY[0x1F40CA338](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

uint64_t ckDefaultTextSizeForFontPointSize()
{
  return MEMORY[0x1F4124758]();
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CC060](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC638](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x1F4123C10]();
}

uint64_t im_main_thread()
{
  return MEMORY[0x1F4123C30]();
}

uint64_t im_perform_with_task_assertion()
{
  return MEMORY[0x1F4123C40]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE0](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

float nanf(const char *a1)
{
  MEMORY[0x1F40CCE98](a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x1F40CD3A0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  double v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

void rewind(FILE *a1)
{
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1F41864F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x1F4188268]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SafariServices(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_EventKitUI(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___SFSafariViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_SafariServices)) {
    return dlopenHelper_SafariServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___EKEventEditViewController(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_EventKitUI)) {
    return dlopenHelper_EventKitUI(result);
  }
  return result;
}