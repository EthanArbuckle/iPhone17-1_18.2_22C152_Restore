void sub_744970(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_744C38();
}

uint64_t sub_744998()
{
  v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for FramedMediaCollectionViewCell();
  objc_msgSendSuper2(&v16, "layoutSubviews");
  v2 = *(void **)((char *)v0 + qword_9784E8);
  id v3 = [v0 contentView];
  sub_FE2C(0, (unint64_t *)&qword_94FFE0);
  sub_772580();
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
  sub_74364C(v15, *((unsigned char *)v1 + qword_9B4C00));
  return (*(uint64_t (**)(CGFloat *))&stru_108.segname[(swift_isaMask & *v1) + 16])(v15);
}

void sub_744B04(void *a1)
{
  id v1 = a1;
  sub_744998();
}

id sub_744B4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FramedMediaCollectionViewCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_744BA8(uint64_t a1)
{
  return sub_14C88(a1 + qword_9B4BE0, (uint64_t *)&unk_95C250);
}

uint64_t type metadata accessor for FramedMediaCollectionViewCell()
{
  return sub_7DD38();
}

void sub_744C38()
{
  uint64_t v1 = qword_9784E8;
  sub_771C30();
  *(void *)&v0[v1] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  objc_super v2 = &v0[qword_9B4BE0];
  uint64_t v3 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v0[qword_9B4BE8] = 0;
  v0[qword_9B4BF0] = 0;
  double v4 = &v0[qword_9B4BF8];
  long long v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *double v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  v0[qword_9B4C00] = 0;

  sub_77EB20();
  __break(1u);
}

uint64_t sub_744D50()
{
  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_744D98()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_744DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_744DB8()
{
  return swift_release();
}

uint64_t sub_744DC0()
{
  return sub_7452A4(&qword_953820, (void (*)(uint64_t))type metadata accessor for MixedMediaLockupCollectionViewCell);
}

double sub_744E08()
{
  uint64_t v0 = sub_7729C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_771610();
  double v4 = sub_744EF8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

double sub_744EF8()
{
  uint64_t v0 = sub_77A3E0();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_FD50(&qword_954540);
  __chkstk_darwin(v3 - 8);
  long long v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_774AE0();
  uint64_t v22 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  double v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_779770();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v21 - v13;
  sub_772980();
  sub_779730();
  sub_7452A4(&qword_958540, (void (*)(uint64_t))&type metadata accessor for Shelf.PresentationHints);
  sub_77E800();
  v15 = *(void (**)(char *, uint64_t))(v9 + 8);
  v15(v11, v8);
  v15(v14, v8);
  objc_super v16 = (void *)sub_772950();
  uint64_t v17 = sub_774AA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
  sub_2C7A04(v16, (uint64_t)v5, (uint64_t)v7);
  swift_unknownObjectRelease();
  sub_9D194((uint64_t)v5);
  sub_772930();
  sub_77A360();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v2, v25);
  uint64_t v18 = sub_772950();
  double v19 = sub_31C2AC((uint64_t)v7, v18);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
  return v19;
}

uint64_t sub_7452A4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_7452EC()
{
  qword_978588 = 0x4072700000000000;
}

void sub_745300()
{
  qword_978590 = 0x4078C00000000000;
}

void sub_745314()
{
  qword_978598 = 0x4080880000000000;
}

void sub_745328(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = sub_77EC00();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) != 2) {
      return;
    }
LABEL_3:
    v31.origin.x = a2;
    v31.origin.y = a3;
    v31.size.width = a4;
    v31.size.height = a5;
    CGRectGetMidX(v31);
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = a4;
    v32.size.height = a5;
    CGRectGetMidY(v32);
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v14 = (id)sub_77EA30();
    }
    else
    {
      if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) < 2uLL)
      {
        __break(1u);
        goto LABEL_16;
      }
      id v14 = *(id *)(a1 + 40);
    }
    v15 = v14;
    [v14 frame];
    CGRectGetWidth(v33);
    [v15 frame];
    CGRectGetHeight(v34);
    uint64_t v16 = enum case for FloatingPointRoundingRule.down(_:);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
    v17(v13, enum case for FloatingPointRoundingRule.down(_:), v10);
    sub_77E2C0();
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = *(void (**)(char *, uint64_t))(v11 + 8);
    v22(v13, v10);
    objc_msgSend(v15, "setPosition:", v19, v21);
    [v15 setZPosition:0.0];
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v23 = (id)sub_77EA30();
LABEL_10:
      uint64_t v24 = v23;
      [v23 frame];
      CGRectGetWidth(v35);
      v36.origin.x = a2;
      v36.origin.y = a3;
      v36.size.width = a4;
      v36.size.height = a5;
      CGRectGetMaxY(v36);
      [v24 frame];
      CGRectGetHeight(v37);
      v17(v13, v16, v10);
      sub_77E2C0();
      double v26 = v25;
      double v28 = v27;
      v22(v13, v10);
      objc_msgSend(v24, "setPosition:", v26, v28);
      [v24 setZPosition:1.0];

      return;
    }
    if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
    {
      id v23 = *(id *)(a1 + 32);
      goto LABEL_10;
    }
LABEL_16:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_77EB40();
  swift_bridgeObjectRelease();
  if (v29 == 2) {
    goto LABEL_3;
  }
}

void sub_745690(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = sub_77EC00();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) != 3) {
      return;
    }
LABEL_3:
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    CGRectGetMidX(v38);
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    CGRectGetMidY(v39);
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v14 = (id)sub_77EA30();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
      {
        __break(1u);
        goto LABEL_20;
      }
      id v14 = *(id *)(a1 + 32);
    }
    v15 = v14;
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    CGRectGetMaxY(v40);
    [v15 frame];
    CGRectGetHeight(v41);
    uint64_t v16 = enum case for FloatingPointRoundingRule.down(_:);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
    v17(v13, enum case for FloatingPointRoundingRule.down(_:), v10);
    sub_77E2C0();
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = *(void (**)(char *, uint64_t))(v11 + 8);
    v22(v13, v10);
    objc_msgSend(v15, "setPosition:", v19, v21);
    [v15 setZPosition:1.0];
    id v36 = v15;
    unint64_t v37 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v23 = (id)sub_77EA30();
LABEL_10:
      uint64_t v24 = v23;
      objc_msgSend(v23, "frame", v36);
      CGRectGetWidth(v42);
      v43.origin.x = a2;
      v43.origin.y = a3;
      v43.size.width = a4;
      v43.size.height = a5;
      CGRectGetMinY(v43);
      [v24 frame];
      CGRectGetHeight(v44);
      v17(v13, v16, v10);
      sub_77E2C0();
      double v26 = v25;
      double v28 = v27;
      v22(v13, v10);
      objc_msgSend(v24, "setPosition:", v26, v28);
      [v24 setZPosition:0.0];
      if (v37)
      {
        id v29 = (id)sub_77EA30();
LABEL_14:
        uint64_t v30 = v29;
        [v29 frame];
        CGRectGetWidth(v45);
        v46.origin.x = a2;
        v46.origin.y = a3;
        v46.size.width = a4;
        v46.size.height = a5;
        CGRectGetMinY(v46);
        [v30 frame];
        CGRectGetHeight(v47);
        v17(v13, v16, v10);
        sub_77E2C0();
        double v32 = v31;
        double v34 = v33;
        v22(v13, v10);
        objc_msgSend(v30, "setPosition:", v32, v34);
        [v30 setZPosition:0.0];

        return;
      }
      if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) >= 3uLL)
      {
        id v29 = *(id *)(a1 + 48);
        goto LABEL_14;
      }
LABEL_21:
      __break(1u);
      return;
    }
    if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) >= 2uLL)
    {
      id v23 = *(id *)(a1 + 40);
      goto LABEL_10;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_77EB40();
  swift_bridgeObjectRelease();
  if (v35 == 3) {
    goto LABEL_3;
  }
}

void sub_745AF0(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = sub_77EC00();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) != 4) {
      return;
    }
LABEL_3:
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    CGRectGetMidX(v47);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    CGRectGetMidY(v48);
    unint64_t v14 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v15 = (id)sub_77EA30();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
      {
        __break(1u);
        goto LABEL_24;
      }
      id v15 = *(id *)(a1 + 32);
    }
    uint64_t v16 = v15;
    [v15 frame];
    CGRectGetWidth(v49);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    CGRectGetMaxY(v50);
    [v16 frame];
    CGRectGetHeight(v51);
    uint64_t v17 = enum case for FloatingPointRoundingRule.down(_:);
    CGRect v46 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
    v46(v13, enum case for FloatingPointRoundingRule.down(_:), v10);
    sub_77E2C0();
    double v19 = v18;
    double v21 = v20;
    id v23 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v22 = v11 + 8;
    CGRect v45 = v23;
    v23(v13, v10);
    objc_msgSend(v16, "setPosition:", v19, v21);
    [v16 setZPosition:1.0];
    if (v14)
    {
      id v24 = (id)sub_77EA30();
LABEL_10:
      double v25 = v24;
      [v24 frame];
      CGRectGetWidth(v52);
      [v25 frame];
      CGRectGetHeight(v53);
      v46(v13, v17, v10);
      sub_77E2C0();
      double v27 = v26;
      double v29 = v28;
      v45(v13, v10);
      objc_msgSend(v25, "setPosition:", v27, v29);
      [v25 setZPosition:0.0];
      unint64_t v43 = a1 & 0xC000000000000001;
      uint64_t v44 = v22;
      if (v14)
      {
        id v30 = (id)sub_77EA30();
LABEL_14:
        double v31 = v30;
        objc_msgSend(v25, "position", v43, v44);
        [v31 frame];
        CGRectGetWidth(v54);
        [v25 position];
        v46(v13, v17, v10);
        sub_77E2C0();
        double v33 = v32;
        double v35 = v34;
        v45(v13, v10);
        objc_msgSend(v31, "setPosition:", v33, v35);
        [v31 setZPosition:0.0];
        if (v43)
        {
          id v36 = (id)sub_77EA30();
LABEL_18:
          unint64_t v37 = v36;
          [v16 position];
          [v37 frame];
          CGRectGetWidth(v55);
          [v16 position];
          v46(v13, v17, v10);
          sub_77E2C0();
          double v39 = v38;
          double v41 = v40;
          v45(v13, v10);
          objc_msgSend(v37, "setPosition:", v39, v41);
          [v37 setZPosition:1.0];

          return;
        }
        if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) >= 4uLL)
        {
          id v36 = *(id *)(a1 + 56);
          goto LABEL_18;
        }
LABEL_26:
        __break(1u);
        return;
      }
      if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) >= 2uLL)
      {
        id v30 = *(id *)(a1 + 40);
        goto LABEL_14;
      }
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    if (*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)) >= 3uLL)
    {
      id v24 = *(id *)(a1 + 48);
      goto LABEL_10;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_77EB40();
  swift_bridgeObjectRelease();
  if (v42 == 4) {
    goto LABEL_3;
  }
}

uint64_t sub_746054()
{
  uint64_t v0 = sub_77ADB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_77AEE0();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  uint64_t v5 = enum case for DisjointStack.EdgePosition.anchored(_:);
  uint64_t v6 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, enum case for DisjointStack.EdgePosition.anchored(_:), v0);
  sub_77ADA0();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  sub_77AD70();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  sub_77AD60();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  return sub_77AD80();
}

uint64_t sub_7461FC()
{
  uint64_t v0 = sub_77ADB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_77AEE0();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  uint64_t v5 = enum case for DisjointStack.EdgePosition.anchored(_:);
  uint64_t v6 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, enum case for DisjointStack.EdgePosition.anchored(_:), v0);
  sub_77AD60();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  sub_77AD70();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  return sub_77AD80();
}

uint64_t sub_746370()
{
  sub_77ADC0();
  sub_77ADD0();
  sub_145F4(v0 + 88, (uint64_t)&v2);
  v3[3] = sub_77B8D0();
  v3[4] = (uint64_t)&protocol witness table for Margins;
  sub_FBE0(v3);
  sub_77B8B0();
  sub_77ADD0();
  return _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v3);
}

uint64_t destroy for MiniListCardLayout(uint64_t a1)
{
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 48);

  return _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 88);
}

_OWORD *initializeWithCopy for MiniListCardLayout(_OWORD *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  long long v5 = *(_OWORD *)((char *)a2 + 72);
  *(_OWORD *)((char *)a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)(a1 + 3), (uint64_t)(a2 + 3));
  long long v6 = a2[7];
  a1[7] = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)a1 + 88, (uint64_t)a2 + 88);
  return a1;
}

uint64_t assignWithCopy for MiniListCardLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_39ED0((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  sub_39ED0((uint64_t *)(a1 + 88), (uint64_t *)(a2 + 88));
  return a1;
}

uint64_t assignWithTake for MiniListCardLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 48);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 88);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniListCardLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniListCardLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniListCardLayout()
{
  return &type metadata for MiniListCardLayout;
}

double sub_746704@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)(v1 + 40);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(double *)(a1 + 40) = result;
  return result;
}

uint64_t sub_746730(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_746850();

  return CustomLayout._eraseToAnyForTesting(with:)(a1, a2, v4);
}

unint64_t sub_746788()
{
  unint64_t result = qword_9785A0;
  if (!qword_9785A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9785A0);
  }
  return result;
}

unint64_t sub_7467E0()
{
  unint64_t result = qword_9785A8;
  if (!qword_9785A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9785A8);
  }
  return result;
}

uint64_t sub_746834()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_746850()
{
  unint64_t result = qword_9785B0;
  if (!qword_9785B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9785B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MiniListCardLayout.Metrics(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[48]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniListCardLayout.Metrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniListCardLayout.Metrics()
{
  return &type metadata for MiniListCardLayout.Metrics;
}

void *sub_746958()
{
  return &protocol witness table for DisjointStack;
}

CGFloat sub_746964()
{
  CGAffineTransformMakeScale((CGAffineTransform *)&v1, 1.0, -1.0);
  *(_OWORD *)&m.a = *(_OWORD *)&v1.m11;
  *(_OWORD *)&m.c = *(_OWORD *)&v1.m13;
  *(_OWORD *)&m.tx = *(_OWORD *)&v1.m21;
  CATransform3DMakeAffineTransform(&v1, &m);
  CGFloat result = v1.m11;
  *(CATransform3D *)byte_9B4C10 = v1;
  return result;
}

uint64_t sub_746A04()
{
  return type metadata accessor for RevealingImageMirrorView();
}

uint64_t type metadata accessor for RevealingImageMirrorView()
{
  uint64_t result = qword_9785E0;
  if (!qword_9785E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_746A58()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_746A94()
{
  unint64_t result = qword_953838;
  if (!qword_953838)
  {
    type metadata accessor for MediumLockupCollectionViewCell();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_953838);
  }
  return result;
}

double sub_746AEC()
{
  uint64_t v0 = sub_77A3E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unsigned int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v4 = (void *)sub_772950();
  sub_772930();
  sub_77A360();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_getObjectType();
  sub_28096C(v4);
  double v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_746C30()
{
  uint64_t v0 = sub_77D390();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unsigned int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_77D3B0();
  sub_1A358(v4, qword_9B4C90);
  sub_FDF4(v4, (uint64_t)qword_9B4C90);
  if (qword_94F840 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_FDF4(v0, (uint64_t)qword_9B4500);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_77D3A0();
}

id sub_746D84(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_76FA30();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategory] = 0;
  uint64_t v11 = &v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategoryOptions];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_startedDisappearTransition] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_rootViewController] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController] = 0;
  uint64_t v12 = &v3[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeTab];
  uint64_t v13 = sub_76D960();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_bootstrapPendingClosuresHandler;
  sub_777F40();
  swift_allocObject();
  id v15 = v4;
  *(void *)&v4[v14] = sub_777F30();
  v15[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_appHasBeenInBackground] = 0;
  v15[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isOnboardingFinished] = 0;
  v15[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isPresentingContentFinished] = 0;

  if (a2)
  {
    NSString v16 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  uint64_t v17 = (objc_class *)type metadata accessor for StoreRootViewController();
  v26.receiver = v15;
  v26.super_class = v17;
  id v18 = objc_msgSendSuper2(&v26, "initWithNibName:bundle:", v16, a3);

  double v19 = self;
  id v20 = v18;
  [v19 setFlushTimerEnabled:0];
  [v19 setDisableBackgroundMetrics:1];
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for BootstrapPhase.onboarding(_:), v7);
  sub_777F20();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v21 = [self sharedCoordinator];
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_74C77C;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24636C;
  aBlock[3] = &unk_8AC5B8;
  id v23 = _Block_copy(aBlock);
  swift_release();
  [v21 registerAppBootstrapHandler:v23];

  _Block_release(v23);
  return v20;
}

id sub_747150()
{
  uint64_t v0 = self;
  [v0 setFlushTimerEnabled:1];

  return [v0 setDisableBackgroundMetrics:0];
}

void sub_7471AC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_7476BC();
  }
}

id sub_747288()
{
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for StoreRootViewController();
  objc_msgSendSuper2(&v9, "viewDidLoad");
  if (qword_94FB40 != -1) {
    swift_once();
  }
  qword_9B4A38 = (uint64_t)&off_8AC398;
  swift_unknownObjectWeakAssign();
  uint64_t v1 = self;
  id v2 = [v1 defaultCenter];
  unsigned int v3 = (void *)sub_778980();
  [v2 addObserver:v0 selector:"purchaseComplete:" name:v3 object:0];

  id v4 = [v1 defaultCenter];
  if (qword_94FC70 != -1) {
    swift_once();
  }
  [v4 addObserver:v0 selector:"openApp:" name:qword_9B4B30 object:0];

  type metadata accessor for MessagesStoreBootstrap();
  uint64_t v5 = swift_allocObject();
  sub_74BC28(v0, v5);
  id v6 = (id)sub_75B024();
  id result = [v6 view];
  if (result)
  {
    uint64_t v8 = result;
    [result setClipsToBounds:1];

    swift_release();
    sub_74C024(v6);

    if (qword_94FAE0 != -1) {
      swift_once();
    }
    qword_975D10 = (uint64_t)&off_8AC3A8;
    return (id)swift_unknownObjectWeakAssign();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_7476BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_76FA30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_FD50((uint64_t *)&unk_9606C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph] = 0;
  swift_release();
  objc_super v9 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController];
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController] = 0;

  uint64_t v10 = sub_76D960();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  uint64_t v11 = (uint64_t)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeTab];
  swift_beginAccess();
  sub_74C4D0((uint64_t)v8, v11);
  swift_endAccess();
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog] = 0;
  swift_release();
  v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isOnboardingFinished] = 0;
  v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isPresentingContentFinished] = 0;
  type metadata accessor for MessagesStoreBootstrap();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v1;
  sub_74BC28(v13, v12);
  id v14 = (id)sub_75B024();
  id result = [v14 view];
  if (result)
  {
    NSString v16 = result;
    [result setClipsToBounds:1];

    swift_release();
    sub_74C024(v14);

    *(void *)(swift_allocObject() + 16) = v13;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BootstrapPhase.initialBootstrap(_:), v2);
    uint64_t v17 = v13;
    sub_777F20();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_7479B8(void *a1)
{
  uint64_t v2 = sub_76FA30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = a1;
  uint64_t v6 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v6(v5, enum case for BootstrapPhase.initialBootstrap(_:), v2);
  id v7 = a1;
  sub_777F20();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  swift_release();
  *(void *)(swift_allocObject() + 16) = v7;
  v6(v5, enum case for BootstrapPhase.onboarding(_:), v2);
  id v9 = v7;
  sub_777F20();
  v8(v5, v2);
  return swift_release();
}

void sub_747BB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_76B8F0();
  if (!v2)
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_11:
    sub_14C88((uint64_t)&v9, (uint64_t *)&unk_951B40);
    return;
  }
  uint64_t v3 = v2;
  sub_778970();
  sub_77E9B0();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_67A2AC((uint64_t)v8), (v5 & 1) != 0))
  {
    sub_17534(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_22B60((uint64_t)v8);
  if (!*((void *)&v10 + 1)) {
    goto LABEL_11;
  }
  sub_FE2C(0, &qword_96FBA0);
  if (swift_dynamicCast())
  {
    uint64_t v6 = (void *)v8[0];
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      [Strong storeRootViewController:v1 didComplete:v6];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_747D18()
{
  uint64_t v0 = sub_77C870();
  uint64_t v86 = *(void *)(v0 - 8);
  uint64_t v87 = v0;
  __chkstk_darwin(v0);
  v82 = (char *)v76 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_77D0B0();
  uint64_t v81 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v78 = (char *)v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v79 = (char *)v76 - v4;
  uint64_t v85 = sub_FD50((uint64_t *)&unk_9514E0);
  uint64_t v83 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  v80 = (char *)v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_FD50((uint64_t *)&unk_9518E0);
  __chkstk_darwin(v6 - 8);
  v88 = (char *)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_77CB80();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_FD50((uint64_t *)&unk_978690);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_773030();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v91 = v12;
  uint64_t v92 = v13;
  __chkstk_darwin(v12);
  id v15 = (char *)v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v76 - v17;
  __chkstk_darwin(v19);
  v90 = (char *)v76 - v20;
  uint64_t v21 = sub_FD50((uint64_t *)&unk_952560);
  __chkstk_darwin(v21 - 8);
  id v23 = (char *)v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_779A00();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  double v27 = (char *)v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v93 = (char *)v76 - v29;
  uint64_t v30 = sub_76B8F0();
  if (!v30)
  {
    long long v100 = 0u;
    long long v101 = 0u;
LABEL_14:
    sub_14C88((uint64_t)&v100, (uint64_t *)&unk_951B40);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v23, 1, 1, v24);
    goto LABEL_15;
  }
  uint64_t v31 = v30;
  uint64_t v98 = 0x64496D616461;
  unint64_t v99 = 0xE600000000000000;
  sub_77E9B0();
  if (*(void *)(v31 + 16) && (unint64_t v32 = sub_67A2AC((uint64_t)aBlock), (v33 & 1) != 0))
  {
    sub_17534(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&v100);
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_22B60((uint64_t)aBlock);
  if (!*((void *)&v101 + 1)) {
    goto LABEL_14;
  }
  int v34 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v23, v34 ^ 1u, 1, v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
LABEL_15:
    uint64_t v42 = (uint64_t *)&unk_952560;
    uint64_t v43 = (uint64_t)v23;
    return sub_14C88(v43, v42);
  }
  double v35 = v93;
  (*(void (**)(void))(v25 + 32))();
  id v36 = (void *)sub_7799A0();
  if (!v36) {
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v35, v24);
  }
  id v77 = v36;
  uint64_t v37 = sub_76B8F0();
  if (!v37)
  {
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v39 = v91;
LABEL_26:
    sub_14C88((uint64_t)&v100, (uint64_t *)&unk_951B40);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56))(v11, 1, 1, v39);
    goto LABEL_27;
  }
  uint64_t v38 = v37;
  uint64_t v98 = 0x74616E6974736564;
  unint64_t v99 = 0xEB000000006E6F69;
  sub_77E9B0();
  uint64_t v39 = v91;
  if (*(void *)(v38 + 16) && (unint64_t v40 = sub_67A2AC((uint64_t)aBlock), (v41 & 1) != 0))
  {
    sub_17534(*(void *)(v38 + 56) + 32 * v40, (uint64_t)&v100);
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_22B60((uint64_t)aBlock);
  if (!*((void *)&v101 + 1)) {
    goto LABEL_26;
  }
  int v45 = swift_dynamicCast();
  uint64_t v46 = v92;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v92 + 56))(v11, v45 ^ 1u, 1, v39);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v11, 1, v39) == 1)
  {
LABEL_27:

    (*(void (**)(char *, uint64_t))(v25 + 8))(v35, v24);
    uint64_t v42 = (uint64_t *)&unk_978690;
    uint64_t v43 = (uint64_t)v11;
    return sub_14C88(v43, v42);
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v90, v11, v39);
  if (!*(uint64_t (**)(char *, uint64_t))((char *)v89
                                                  + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph))
  {

    (*(void (**)(char *, uint64_t))(v46 + 8))(v90, v39);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v35, v24);
  }
  v76[2] = *(uint64_t (**)(char *, uint64_t))((char *)v89
                                                     + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph);
  CGRect v47 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v47(v18, v90, v39);
  int v48 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v18, v39);
  if (v48 == enum case for OpenableDestination.app(_:))
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v27, v93, v24);
    v47(v15, v90, v39);
    swift_retain();
    sub_77CB60();
    uint64_t v49 = sub_76D110();
    swift_allocObject();
    uint64_t v50 = sub_76D0F0();
    CGRect v51 = v88;
    sub_76E620();
    uint64_t v52 = sub_FD50((uint64_t *)&unk_9514F0);
    CGRect v53 = *(uint64_t (***)(char *, uint64_t))(v52 - 8);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v53[6])(v51, 1, v52) != 1)
    {
      v95 = (void *)v49;
      uint64_t v96 = sub_74C598(&qword_956BD8, (void (*)(uint64_t))&type metadata accessor for OpenAppAction);
      aBlock[0] = v50;
      swift_retain_n();
      v89 = v53;
      v64 = v79;
      v76[0] = v52;
      sub_5F4C3C();
      v76[1] = v50;
      uint64_t v65 = v81;
      uint64_t v66 = v84;
      (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v78, v64, v84);
      v67 = v82;
      sub_77C850();
      sub_77CCB0();
      (*(void (**)(char *, uint64_t))(v86 + 8))(v67, v87);
      v68 = v51;
      v69 = v80;
      (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v80, v64, v66);
      uint64_t v70 = v83;
      uint64_t v71 = v85;
      (*(void (**)(char *, void, uint64_t))(v83 + 104))(v69, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v85);
      uint64_t v72 = v76[0];
      sub_77CD70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v71);
      _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)aBlock);

      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v90, v39);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v93, v24);
      swift_release();
      return v89[1](v68, v72);
    }

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v90, v39);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v93, v24);
    uint64_t v42 = (uint64_t *)&unk_9518E0;
    uint64_t v43 = (uint64_t)v51;
    return sub_14C88(v43, v42);
  }
  int v54 = v48;
  int v55 = enum case for OpenableDestination.messages(_:);
  swift_retain();
  if (v54 == v55)
  {
    v56 = v89;
    id v57 = [v89 presentedViewController];
    if (v57)
    {
      v58 = v57;
      uint64_t v59 = swift_allocObject();
      id v60 = v77;
      *(void *)(v59 + 16) = v56;
      *(void *)(v59 + 24) = v60;
      uint64_t v96 = (uint64_t)sub_74C578;
      uint64_t v97 = v59;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_24636C;
      v95 = &unk_8AC4C8;
      v61 = _Block_copy(aBlock);
      v62 = v56;
      id v63 = v60;
      swift_release();
      [v58 dismissViewControllerAnimated:1 completion:v61];
      swift_release();
      _Block_release(v61);
    }
    else
    {
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v74 = v77;
        [Strong storeRootViewController:v56 openApp:v77];

        swift_unknownObjectRelease();
      }
      else
      {
      }
      swift_release();
    }
    v75 = v93;
    (*(void (**)(char *, uint64_t))(v92 + 8))(v90, v39);
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v75, v24);
  }
  else
  {
    uint64_t result = sub_77EC20();
    __break(1u);
  }
  return result;
}

void *sub_748A74(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    [result storeRootViewController:a1 openApp:a2];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_748B08(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_76B900();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76B8D0();
  id v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_748BF8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_FD50((uint64_t *)&unk_9606C0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v4 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph) = a4;
  swift_retain();
  swift_release();
  uint64_t v12 = *(void **)(v4 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController);
  *(void *)(v4 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController) = a1;
  id v13 = a1;

  uint64_t v14 = sub_76D960();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v11, a2, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
  uint64_t v16 = v4 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeTab;
  swift_beginAccess();
  sub_74C4D0((uint64_t)v11, v16);
  swift_endAccess();
  *(void *)(v4 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog) = a3;
  swift_retain();
  return swift_release();
}

void sub_748E94(uint64_t a1)
{
  uint64_t v54 = a1;
  uint64_t v2 = sub_77C870();
  uint64_t v64 = *(void *)(v2 - 8);
  uint64_t v65 = v2;
  __chkstk_darwin(v2);
  id v60 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_77D0B0();
  uint64_t v59 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  v56 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v57 = (char *)v44 - v6;
  uint64_t v63 = sub_FD50((uint64_t *)&unk_9514E0);
  uint64_t v61 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  v58 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_774FE0();
  uint64_t v52 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  int v55 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_76DC40();
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v49 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_774190();
  uint64_t v47 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int v48 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_77CB80();
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_FD50((uint64_t *)&unk_951CA0);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_FD50(&qword_9526C0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_77A1C0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_FD50((uint64_t *)&unk_9518E0);
  __chkstk_darwin(v25 - 8);
  double v27 = (char *)v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph))
  {
    swift_retain();
    sub_76E620();
    uint64_t v28 = sub_FD50((uint64_t *)&unk_9514F0);
    uint64_t v46 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v27, 1, v28) == 1)
    {
      swift_release();
      sub_14C88((uint64_t)v27, (uint64_t *)&unk_9518E0);
    }
    else
    {
      uint64_t v70 = 0;
      long long v68 = 0u;
      long long v69 = 0u;
      (*(void (**)(char *, void, uint64_t))(v22 + 104))(v24, enum case for FlowPage.unknown(_:), v21);
      uint64_t v29 = sub_76BC30();
      uint64_t v45 = v28;
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)(v29 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v20, v54, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v20, 0, 1, v30);
      uint64_t v32 = sub_76EF50();
      char v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
      v44[2] = v17;
      v33(v17, 1, 1, v32);
      long long v66 = 0u;
      long long v67 = 0u;
      v44[1] = v14;
      sub_77CB60();
      (*(void (**)(char *, void, uint64_t))(v47 + 104))(v48, enum case for FlowAnimationBehavior.never(_:), v10);
      (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, enum case for FlowOrigin.external(_:), v51);
      (*(void (**)(char *, void, uint64_t))(v52 + 104))(v55, enum case for FlowPresentationContext.infer(_:), v53);
      sub_77D0C0();
      uint64_t v34 = sub_76DC20();
      swift_allocObject();
      uint64_t v35 = sub_76DBD0();
      *((void *)&v69 + 1) = v34;
      uint64_t v70 = sub_74C598((unint64_t *)&qword_9562F0, (void (*)(uint64_t))&type metadata accessor for FlowAction);
      *(void *)&long long v68 = v35;
      swift_retain();
      id v36 = v57;
      sub_5F4C3C();
      uint64_t v37 = v59;
      uint64_t v38 = v62;
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v56, v36, v62);
      uint64_t v39 = v60;
      sub_77C850();
      sub_77CCB0();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v39, v65);
      unint64_t v40 = v58;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v58, v36, v38);
      uint64_t v41 = v61;
      uint64_t v42 = v63;
      (*(void (**)(char *, void, uint64_t))(v61 + 104))(v40, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v63);
      uint64_t v43 = v45;
      sub_77CD70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
      _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v68);
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v43);
    }
  }
}

uint64_t sub_749804()
{
  uint64_t v1 = sub_76FA30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v35 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_76D4B0();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  uint64_t v6 = *(void *)(v26 + 64);
  __chkstk_darwin(v5);
  uint64_t v31 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t v33 = OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_appHasBeenInBackground;
  if (v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_appHasBeenInBackground]) {
    uint64_t v12 = (unsigned int *)&enum case for AppEnterMetricsEvent.EnterKind.taskSwitch(_:);
  }
  else {
    uint64_t v12 = (unsigned int *)&enum case for AppEnterMetricsEvent.EnterKind.launch(_:);
  }
  (*(void (**)(char *, void, __n128))(v8 + 104))(v11, *v12, v9);
  *(void *)(swift_allocObject() + 16) = v0;
  uint64_t v29 = *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_bootstrapPendingClosuresHandler];
  uint64_t v32 = v0;
  uint64_t v30 = *(void (**)(char *, void, uint64_t))(v2 + 104);
  uint64_t v25 = v1;
  v30(v4, enum case for BootstrapPhase.initialBootstrap(_:), v1);
  uint64_t v13 = v0;
  sub_777F20();
  uint64_t v14 = v26;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v35 + 8);
  v35 += 8;
  uint64_t v28 = v15;
  v15(v4, v1);
  swift_release();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v17 = v31;
  uint64_t v34 = v11;
  uint64_t v18 = v27;
  v16(v31, v11, v27);
  unint64_t v19 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v19, v17, v18);
  uint64_t v21 = v25;
  v30(v4, enum case for BootstrapPhase.onboarding(_:), v25);
  uint64_t v22 = v13;
  sub_777F20();
  v28(v4, v21);
  swift_release();
  if (v32[v33] == 1 && *(void *)&v22[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog])
  {
    swift_retain();
    sub_772E60();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v34, v18);
}

uint64_t sub_749BCC(char *a1)
{
  uint64_t v2 = sub_76FA30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  id v7 = [v6 sharedInstance];
  id v8 = [v7 category];

  __n128 v9 = *(void **)&a1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategory];
  *(void *)&a1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategory] = v8;

  id v10 = [v6 sharedInstance];
  id v11 = [v10 categoryOptions];

  uint64_t v12 = &a1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategoryOptions];
  *(void *)uint64_t v12 = v11;
  v12[8] = 0;
  uint64_t v13 = AVAudioSessionModeDefault;
  sub_1A7B40(AVAudioSessionCategoryPlayback, v13, 1, 0, 0);

  *(void *)(swift_allocObject() + 16) = a1;
  uint64_t v14 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v14(v5, enum case for BootstrapPhase.initialBootstrap(_:), v2);
  uint64_t v15 = a1;
  sub_777F20();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v5, v2);
  swift_release();
  *(void *)(swift_allocObject() + 16) = v15;
  v14(v5, enum case for BootstrapPhase.onboarding(_:), v2);
  uint64_t v17 = v15;
  sub_777F20();
  v16(v5, v2);
  return swift_release();
}

void sub_749EA0(uint64_t a1)
{
  uint64_t v14 = sub_77D0B0();
  uint64_t v2 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_77CD30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_77CA30();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph))
  {
    swift_retain();
    sub_76D4C0();
    sub_779D90();
    sub_77D090();
    sub_77CD20();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

void sub_74A0F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_77D0B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_77CD30();
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  __chkstk_darwin(v6);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_77CA30();
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t v24 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)(v0 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategory);
  if (v12)
  {
    if (*(unsigned char *)(v0
                  + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategoryOptions
                  + 8))
      uint64_t v13 = 0;
    else {
      uint64_t v13 = *(void *)(v0
    }
                      + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategoryOptions);
    id v14 = v12;
    uint64_t v15 = AVAudioSessionModeDefault;
    sub_1A7B40(v14, v15, v13, 0, 0);
  }
  if (*(void *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph))
  {
    uint64_t v16 = self;
    swift_retain();
    id v17 = [v16 sharedApplication];
    NSString v18 = sub_77D640();
    id v19 = [v17 beginBackgroundTaskWithName:v18 expirationHandler:0];

    sub_76D4A0();
    sub_779D90();
    sub_77D090();
    sub_77CD20();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(void *)(swift_allocObject() + 16) = v19;
    uint64_t v20 = sub_FE2C(0, (unint64_t *)&qword_9526A0);
    uint64_t v21 = sub_77DD60();
    v27[3] = v20;
    v27[4] = &protocol witness table for OS_dispatch_queue;
    v27[0] = v21;
    sub_77D320();
    swift_release();
    swift_release();
    swift_release();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v27);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v26);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_appHasBeenInBackground) = 1;
}

void sub_74A4A8(uint64_t a1, uint64_t a2)
{
  id v3 = [self sharedApplication];
  [v3 endBackgroundTask:a2];
}

void sub_74A518(uint64_t a1)
{
  uint64_t v2 = sub_77C870();
  uint64_t v65 = *(void *)(v2 - 8);
  uint64_t v66 = v2;
  __chkstk_darwin(v2);
  uint64_t v61 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_77D0B0();
  uint64_t v60 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  id v57 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v58 = (char *)&v46 - v6;
  uint64_t v64 = sub_FD50((uint64_t *)&unk_9514E0);
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v59 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_76DC40();
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  v56 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_774190();
  uint64_t v50 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  int v55 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_774FE0();
  uint64_t v47 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v52 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_77CB80();
  __chkstk_darwin(v11 - 8);
  uint64_t v49 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_FD50((uint64_t *)&unk_951CA0);
  __chkstk_darwin(v13 - 8);
  long long v68 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_FD50(&qword_9526C0);
  __chkstk_darwin(v15 - 8);
  long long v67 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_77A1C0();
  uint64_t v46 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_FD50((uint64_t *)&unk_9518E0);
  __chkstk_darwin(v20 - 8);
  uint64_t v22 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_94FB48 != -1) {
    swift_once();
  }
  uint64_t Strong = (void (**)(void, void))swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_12:
    if (*(void *)(a1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph))
    {
      sub_76F980();
      sub_77CCF0();
      swift_retain();
      sub_77D2B0();
      sub_5D2C7C(v72, 2);
      sub_FD50((uint64_t *)&unk_95CE50);
      char v30 = sub_77D8E0();
      swift_release();
      swift_bridgeObjectRelease();
      if (v30)
      {
        sub_76E620();
        uint64_t v31 = sub_FD50((uint64_t *)&unk_9514F0);
        uint64_t v32 = *(void (***)(void, void))(v31 - 8);
        if (((unsigned int (*)(char *, uint64_t, uint64_t))v32[6])(v22, 1, v31) == 1)
        {
          swift_release();
          sub_14C88((uint64_t)v22, (uint64_t *)&unk_9518E0);
        }
        else
        {
          uint64_t v74 = 0;
          long long v72 = 0u;
          long long v73 = 0u;
          (*(void (**)(char *, void, uint64_t))(v46 + 104))(v19, enum case for FlowPage.onboarding(_:), v17);
          uint64_t v33 = sub_76BC30();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v67, 1, 1, v33);
          uint64_t v34 = sub_76EF50();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v68, 1, 1, v34);
          uint64_t v71 = &type metadata for OnboardingConfiguration;
          char v70 = 2;
          sub_77CB60();
          (*(void (**)(char *, void, uint64_t))(v47 + 104))(v52, enum case for FlowPresentationContext.infer(_:), v48);
          (*(void (**)(char *, void, uint64_t))(v50 + 104))(v55, enum case for FlowAnimationBehavior.infer(_:), v51);
          uint64_t v35 = *(void (**)(char *, void, uint64_t))(v53 + 104);
          long long v69 = v32;
          v35(v56, enum case for FlowOrigin.inapp(_:), v54);
          sub_77D0C0();
          uint64_t v54 = v31;
          uint64_t v36 = sub_76DC20();
          swift_allocObject();
          uint64_t v37 = sub_76DBD0();
          *((void *)&v73 + 1) = v36;
          uint64_t v74 = sub_74C598((unint64_t *)&qword_9562F0, (void (*)(uint64_t))&type metadata accessor for FlowAction);
          *(void *)&long long v72 = v37;
          swift_retain();
          uint64_t v38 = v58;
          sub_5F4C3C();
          uint64_t v39 = v60;
          uint64_t v40 = v63;
          (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v57, v38, v63);
          uint64_t v41 = v61;
          sub_77C850();
          sub_77CCB0();
          (*(void (**)(char *, uint64_t))(v65 + 8))(v41, v66);
          uint64_t v42 = v59;
          (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v59, v38, v40);
          uint64_t v43 = v62;
          uint64_t v44 = v64;
          (*(void (**)(char *, void, uint64_t))(v62 + 104))(v42, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v64);
          uint64_t v45 = v54;
          sub_77CD70();
          swift_release();
          (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v44);
          _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v72);
          swift_release();
          swift_release();
          swift_release();
          ((void (**)(char *, uint64_t))v69)[1](v22, v45);
        }
        return;
      }
      swift_release();
    }
    sub_74AFF4();
    return;
  }
  while (1)
  {
    long long v69 = Strong;
    id v25 = [Strong viewIfLoaded];
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = [v25 window];

      if (v27)
      {
        unsigned __int8 v28 = [v27 isHidden];

        if ((v28 & 1) == 0) {
          break;
        }
      }
    }
    id v24 = [v69 presentedViewController];

    uint64_t Strong = (void (**)(void, void))v24;
    if (!v24) {
      goto LABEL_12;
    }
  }
  id v29 = v69;
}

uint64_t sub_74AFF4()
{
  return sub_74B698((unsigned int *)&enum case for BootstrapPhase.onboarding(_:), &OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isOnboardingFinished, 0xD000000000000014, 0x8000000000800D80);
}

void sub_74B020()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_FD50((uint64_t *)&unk_9606C0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_76D960();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_77C7F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)((char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_FE2C(0, (unint64_t *)&qword_9526A0);
  *uint64_t v12 = sub_77DD60();
  (*(void (**)(uint64_t *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  char v13 = sub_77C820();
  (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController);
  if (!v14)
  {
    if (qword_94FCC8 == -1)
    {
LABEL_8:
      uint64_t v18 = sub_77D3B0();
      sub_FDF4(v18, (uint64_t)qword_9B4C90);
      sub_FD50((uint64_t *)&unk_951E60);
      sub_77C9B0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_78DBA0;
      sub_77C900();
      sub_77D280();
      swift_bridgeObjectRelease();
      return;
    }
LABEL_18:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v15 = v1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeTab;
  swift_beginAccess();
  sub_456BCC(v15, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    id v16 = v14;
    sub_14C88((uint64_t)v4, (uint64_t *)&unk_9606C0);
    if (qword_94FCC8 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_77D3B0();
    sub_FDF4(v17, (uint64_t)qword_9B4C90);
    sub_FD50((uint64_t *)&unk_951E60);
    sub_77C9B0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_78DBA0;
    sub_77C900();
    sub_77D280();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v19 = *(void **)(v1 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph);
    if (v19)
    {
      id v20 = v14;
      swift_retain();
      if (sub_4213C()) {
        sub_75C3AC(v20, (uint64_t)v8, v19);
      }
      sub_74B66C();

      swift_release();
    }
    else
    {
      uint64_t v21 = qword_94FCC8;
      id v22 = v14;
      if (v21 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_77D3B0();
      sub_FDF4(v23, (uint64_t)qword_9B4C90);
      sub_FD50((uint64_t *)&unk_951E60);
      sub_77C9B0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_78DBA0;
      sub_77C900();
      sub_77D280();
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_74B66C()
{
  return sub_74B698((unsigned int *)&enum case for BootstrapPhase.presentingContent(_:), &OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isPresentingContentFinished, 0xD00000000000001CLL, 0x8000000000800C80);
}

uint64_t sub_74B698(unsigned int *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a3;
  id v27 = a2;
  uint64_t v7 = v4;
  uint64_t v8 = sub_76FA30();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_77C7F0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (void *)((char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_FE2C(0, (unint64_t *)&qword_9526A0);
  uint64_t *v15 = sub_77DD60();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  char v16 = sub_77C820();
  uint64_t v18 = *(void (**)(uint64_t *, uint64_t))(v13 + 8);
  uint64_t v17 = (uint64_t (*)(char *, uint64_t))(v13 + 8);
  v18(v15, v12);
  if ((v16 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v25 = a4;
  uint64_t v19 = *(uint64_t *)((char *)v7
                   + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_bootstrapPendingClosuresHandler);
  a1 = (unsigned int *)*a1;
  uint64_t v24 = *(void (**)(char *, unsigned int *, uint64_t))(v9 + 104);
  v24(v11, a1, v8);
  char v20 = sub_777F00();
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t result = v17(v11, v8);
  uint64_t v12 = *v27;
  if (*((unsigned char *)v7 + *v27) != 1 || (v20 & 1) != 0)
  {
    v23[1] = v19;
    id v27 = v7;
    if (qword_94FCC8 == -1)
    {
LABEL_5:
      uint64_t v22 = sub_77D3B0();
      v23[0] = sub_FDF4(v22, (uint64_t)qword_9B4C90);
      sub_FD50((uint64_t *)&unk_951E60);
      sub_77C9B0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_78DBA0;
      sub_77C900();
      sub_77D260();
      swift_bridgeObjectRelease();
      *((unsigned char *)v27 + v12) = 1;
      v24(v11, a1, v8);
      sub_777F10();
      return v17(v11, v8);
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  return result;
}

id sub_74BA14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreRootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_74BB00()
{
  return type metadata accessor for StoreRootViewController();
}

uint64_t type metadata accessor for StoreRootViewController()
{
  uint64_t result = qword_978680;
  if (!qword_978680) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_74BB54()
{
  sub_456B6C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_74BC28(void *a1, uint64_t a2)
{
  *(void *)(a2 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_delegate + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = &off_8AC3C0;
  swift_unknownObjectWeakAssign();
  type metadata accessor for NavigationBarManualCheckLayoutMarginsChange();
  uint64_t v4 = (objc_class *)type metadata accessor for StoreNavigationController();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider25StoreNavigationController_objectGraph] = 0;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10.receiver = v5;
  v10.super_class = v4;
  swift_retain();
  id v7 = objc_msgSendSuper2(&v10, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, 0);
  objc_msgSend(v7, "setDelegate:", v7, v10.receiver, v10.super_class);
  *(void *)(a2 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController) = v7;
  swift_release();
  uint64_t v8 = sub_4E6C60();
  sub_770360();
  swift_retain();
  sub_770340();
  sub_7702B0();
  swift_release();
  swift_release();

  return v8;
}

void sub_74BD6C(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v16 = sub_76FA30();
  uint64_t v4 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_76BC30();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __n128 v10 = __chkstk_darwin(v7);
  if (v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_appHasBeenInBackground] == 1
    && *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog])
  {
    swift_retain();
    sub_772E60();
    swift_release();
  }
  if (v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isPresentingContentFinished] == 1
    && *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph])
  {
    sub_748E94(a1);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v8 + 16))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7, v10);
    unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v2;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    uint64_t v13 = v16;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for BootstrapPhase.presentingContent(_:), v16);
    id v14 = v2;
    sub_777F20();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
    swift_release();
  }
}

void sub_74C024(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_rootViewController;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_rootViewController];
  if (v4 && ([v4 removeFromParentViewController], (uint64_t v5 = *(void **)&v1[v3]) != 0))
  {
    id v6 = [v5 view];
    if (!v6)
    {
LABEL_21:
      __break(1u);
      return;
    }
    uint64_t v7 = v6;
    [v6 removeFromSuperview];

    uint64_t v8 = *(void **)&v1[v3];
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)&v1[v3] = a1;
  id v9 = a1;

  __n128 v10 = *(void **)&v1[v3];
  if (!v10) {
    return;
  }
  id v29 = v10;
  [v1 addChildViewController:v29];
  id v11 = [v29 view];
  if (!v11)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v12 = v11;
  id v13 = [v1 view];
  if (!v13)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v14 = v13;
  [v13 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_msgSend(v12, "setFrame:", v16, v18, v20, v22);
  id v23 = [v29 view];
  if (!v23)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v24 = v23;
  [v23 setAutoresizingMask:18];

  id v25 = [v1 view];
  if (!v25)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v26 = v25;
  id v27 = [v29 view];
  if (!v27)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  unsigned __int8 v28 = v27;
  [v26 addSubview:v27];

  [v29 didMoveToParentViewController:v1];
}

void sub_74C258()
{
  uint64_t v1 = v0;
  *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategory] = 0;
  objc_super v2 = &v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategoryOptions];
  *(void *)objc_super v2 = 0;
  v2[8] = 1;
  v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_startedDisappearTransition] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_objectGraph] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_rootViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController] = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeTab];
  uint64_t v4 = sub_76D960();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_bootstrapPendingClosuresHandler;
  sub_777F40();
  swift_allocObject();
  *(void *)&v1[v5] = sub_777F30();
  v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_appHasBeenInBackground] = 0;
  v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isOnboardingFinished] = 0;
  v1[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_isPresentingContentFinished] = 0;

  sub_77EB20();
  __break(1u);
}

uint64_t sub_74C3D0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_74C3E0(uint64_t a1)
{
  sub_74A4A8(a1, *(void *)(v1 + 16));
}

uint64_t sub_74C3E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_74C420()
{
  return sub_749BCC(*(char **)(v0 + 16));
}

uint64_t sub_74C428()
{
  return sub_74C60C((uint64_t (*)(void))&type metadata accessor for AppEnterMetricsEvent.EnterKind);
}

void sub_74C440()
{
  sub_76D4B0();
  uint64_t v1 = *(void *)(v0 + 16);

  sub_749EA0(v1);
}

void sub_74C4A4()
{
  sub_74A518(*(void *)(v0 + 16));
}

void sub_74C4AC()
{
}

uint64_t sub_74C4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_FD50((uint64_t *)&unk_9606C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_74C538()
{
  return _swift_deallocObject(v0, 32, 7);
}

void *sub_74C578()
{
  return sub_748A74(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_74C580(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_74C590()
{
  return swift_release();
}

uint64_t sub_74C598(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_74C5EC()
{
  return sub_7479B8(*(void **)(v0 + 16));
}

uint64_t sub_74C5F4()
{
  return sub_74C60C((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_74C60C(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

void sub_74C6E0()
{
  uint64_t v1 = *(void *)(sub_76BC30() - 8);
  sub_748E94(v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_74C744()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_74C77C()
{
}

void sub_74C7A8()
{
  sub_285718();
  id v1 = [v0 contentView];
  sub_FD50((uint64_t *)&unk_953E90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_78FED0;
  id v3 = [*(id *)&v0[qword_9B1A80] text];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_77D670();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  id v8 = [*(id *)&v0[qword_9B1A88] text];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = sub_77D670();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  *(void *)(inited + 48) = v10;
  *(void *)(inited + 56) = v12;
  if (!*(void *)&v0[qword_9B1A98])
  {
    *(void *)(inited + 64) = 0;
    *(void *)(inited + 72) = 0;
    uint64_t v21 = *(void *)(inited + 40);
    if (v21) {
      goto LABEL_15;
    }
LABEL_11:
    double v22 = _swiftEmptyArrayStorage;
    uint64_t v23 = *(void *)(inited + 56);
    if (!v23) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  uint64_t v13 = *(void *)&v0[qword_9B1A98 + 8];
  uint64_t ObjectType = swift_getObjectType();
  double v15 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 16);
  swift_unknownObjectRetain();
  double v16 = (void *)v15(ObjectType, v13);
  swift_unknownObjectRelease();
  id v17 = [v16 accessibilityLabel];

  if (v17)
  {
    uint64_t v18 = sub_77D670();
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
  }
  *(void *)(inited + 64) = v18;
  *(void *)(inited + 72) = v20;
  uint64_t v21 = *(void *)(inited + 40);
  if (!v21) {
    goto LABEL_11;
  }
LABEL_15:
  uint64_t v24 = *(void *)(inited + 32);
  swift_bridgeObjectRetain();
  double v22 = (double *)sub_85C80(0, 1, 1, _swiftEmptyArrayStorage);
  unint64_t v26 = *((void *)v22 + 2);
  unint64_t v25 = *((void *)v22 + 3);
  if (v26 >= v25 >> 1) {
    double v22 = (double *)sub_85C80((void *)(v25 > 1), v26 + 1, 1, v22);
  }
  *((void *)v22 + 2) = v26 + 1;
  id v27 = &v22[2 * v26];
  *((void *)v27 + 4) = v24;
  *((void *)v27 + 5) = v21;
  uint64_t v23 = *(void *)(inited + 56);
  if (v23)
  {
LABEL_18:
    uint64_t v28 = *(void *)(inited + 48);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      double v22 = (double *)sub_85C80(0, *((void *)v22 + 2) + 1, 1, v22);
    }
    unint64_t v30 = *((void *)v22 + 2);
    unint64_t v29 = *((void *)v22 + 3);
    if (v30 >= v29 >> 1) {
      double v22 = (double *)sub_85C80((void *)(v29 > 1), v30 + 1, 1, v22);
    }
    *((void *)v22 + 2) = v30 + 1;
    uint64_t v31 = &v22[2 * v30];
    *((void *)v31 + 4) = v28;
    *((void *)v31 + 5) = v23;
  }
LABEL_23:
  uint64_t v32 = *(void *)(inited + 72);
  if (v32)
  {
    uint64_t v33 = *(void *)(inited + 64);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      double v22 = (double *)sub_85C80(0, *((void *)v22 + 2) + 1, 1, v22);
    }
    unint64_t v35 = *((void *)v22 + 2);
    unint64_t v34 = *((void *)v22 + 3);
    if (v35 >= v34 >> 1) {
      double v22 = (double *)sub_85C80((void *)(v34 > 1), v35 + 1, 1, v22);
    }
    *((void *)v22 + 2) = v35 + 1;
    uint64_t v36 = &v22[2 * v35];
    *((void *)v36 + 4) = v33;
    *((void *)v36 + 5) = v32;
  }
  swift_bridgeObjectRelease();
  sub_FD50((uint64_t *)&unk_95A4D0);
  sub_69E7C();
  sub_77D5D0();
  swift_bridgeObjectRelease();
  NSString v37 = sub_77D640();
  swift_bridgeObjectRelease();
  [v1 setAccessibilityLabel:v37];
}

id sub_74CB64(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_77A850();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a3;
  sub_288C00(a1, a2, a3);
  id v14 = *(void **)&v5[qword_9B1A80];
  sub_77A890();
  uint64_t v43 = a4;
  unsigned int v45 = a2;
  if (v15)
  {
    NSString v16 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  [v14 setText:v16];

  sub_77A870();
  id v17 = (void *)sub_77A810();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v13, v10);
  [v14 setTextColor:v17];

  UIAccessibilityTraits v19 = UIAccessibilityTraitButton;
  [v14 setAccessibilityTraits:UIAccessibilityTraitButton];
  uint64_t v20 = *(void **)&v5[qword_9B1A88];
  sub_77A880();
  if (v21)
  {
    NSString v22 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v22 = 0;
  }
  uint64_t v23 = v43;
  [v20 setText:v22];

  sub_77A870();
  uint64_t v24 = (void *)sub_77A800();
  v18(v13, v10);
  [v20 setTextColor:v24];

  [v20 setAccessibilityTraits:v19];
  id v25 = [v5 backgroundView];
  unsigned int v26 = v45;
  uint64_t v27 = v44;
  if (v25)
  {
    uint64_t v28 = v25;
    uint64_t v29 = sub_77A780();
    if (!v29)
    {
      sub_FE2C(0, (unint64_t *)&qword_94FFD0);
      uint64_t v29 = sub_77E3B0();
    }
    unint64_t v30 = (void *)v29;
    [v28 setBackgroundColor:v29];
  }
  id v31 = [v5 contentView];
  id v32 = [v5 traitCollection];
  if (v26 != 4)
  {
    sub_77A380();
    sub_77A380();
  }
  [v32 layoutDirection];
  sub_77DFB0();
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  objc_msgSend(v31, "setLayoutMargins:", v34, v36, v38, v40);
  sub_74D7BC(a1, v27, v26, v23);
  return [v5 setNeedsLayout];
}

void sub_74CF2C(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  swift_getObjectType();
  sub_2854F8((uint64_t)a1, a2, a3 & 1);
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7) {
    return;
  }
  id v8 = (char *)v7;
  uint64_t v9 = *(void *)(v7 + qword_9B1A98);
  if (v9 && *(void *)&v4[qword_9B1A98])
  {
    uint64_t v10 = *(void *)&v4[qword_9B1A98 + 8];
    uint64_t v11 = *(void *)(v7 + qword_9B1A98 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v10 + 120);
    id v14 = a1;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v13(v9, v11, a3 & 1, ObjectType, v10);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (a3) {
      goto LABEL_11;
    }
LABEL_8:
    NSString v16 = *(void **)&v4[qword_9B1A80];
    id v17 = *(void **)&v8[qword_9B1A80];
    id v18 = [v17 text];
    [v16 setText:v18];

    id v19 = [v17 textColor];
    [v16 setTextColor:v19];

    uint64_t v20 = *(void **)&v4[qword_9B1A88];
    uint64_t v21 = *(void **)&v8[qword_9B1A88];
    id v22 = [v21 text];
    [v20 setText:v22];

    id v23 = [v21 textColor];
    [v20 setTextColor:v23];

    id v24 = [v4 backgroundView];
    if (v24)
    {
      id v25 = v24;
      id v26 = [v8 backgroundView];
      id v27 = [v26 backgroundColor];

      [v25 setBackgroundColor:v27];
    }
    id v28 = [v4 contentView];
    id v29 = [v8 contentView];
    [v29 layoutMargins];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    objc_msgSend(v28, "setLayoutMargins:", v31, v33, v35, v37);
    [v4 setNeedsLayout];
    goto LABEL_11;
  }
  id v15 = a1;
  if ((a3 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
}

uint64_t sub_74D284(uint64_t a1)
{
  sub_145F4(a1, (uint64_t)v7);
  sub_FD50((uint64_t *)&unk_9512A0);
  sub_77A8C0();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v3 = sub_77A8A0();
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)(v1 + qword_9B1A98);
      if (v5)
      {
        v7[3] = sub_771140();
        v7[4] = sub_75111C((unint64_t *)&qword_969200, (void (*)(uint64_t))&type metadata accessor for TodayCardOverlay);
        v7[0] = v4;
        v6[3] = swift_getObjectType();
        v6[0] = v5;
        swift_unknownObjectRetain_n();
        swift_retain();
        sub_76DFF0();
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
        _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v6);
        return sub_14C88((uint64_t)v7, (uint64_t *)&unk_958570);
      }
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_74D3F0(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v36 = a4;
  unsigned int v35 = a3;
  uint64_t v34 = a2;
  uint64_t v6 = sub_77A850();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_774FC0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77A7E0();
  char v14 = sub_774F80();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    uint64_t result = sub_77A8A0();
    if (result)
    {
      uint64_t v16 = result;
      type metadata accessor for TodayCardOverlayReusePool();
      sub_77CCE0();
      if (v37[0])
      {
        uint64_t v33 = v37[0];
        id v17 = &v5[OBJC_IVAR____TtC18ASMessagesProvider22TodayCardInfoLayerView_overlayKind];
        char v18 = v5[OBJC_IVAR____TtC18ASMessagesProvider22TodayCardInfoLayerView_overlayKind + 8];
        sub_771130();
        if ((v18 & 1) != 0 || (uint64_t v19 = sub_771120(), v19 != sub_771120()))
        {
          uint64_t v20 = sub_771130();
          uint64_t v21 = sub_4B2064(v20);
          uint64_t v23 = v22;
          uint64_t v31 = v7;
          uint64_t ObjectType = v6;
          id v24 = v5;
          id v25 = (uint64_t *)&v5[OBJC_IVAR____TtC18ASMessagesProvider22TodayCardInfoLayerView_overlay];
          swift_unknownObjectRetain();
          uint64_t v26 = swift_unknownObjectRetain();
          sub_4C9E00(v26, v23);
          swift_unknownObjectRelease();
          uint64_t v7 = v31;
          swift_unknownObjectRelease();
          *(void *)id v17 = sub_771130();
          v17[8] = 0;
          *id v25 = v21;
          v25[1] = v23;
          uint64_t v5 = v24;
          uint64_t v6 = ObjectType;
          swift_unknownObjectRelease();
        }
        swift_weakAssign();
        if (*(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider22TodayCardInfoLayerView_overlay])
        {
          uint64_t v27 = *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider22TodayCardInfoLayerView_overlay + 8];
          uint64_t ObjectType = swift_getObjectType();
          v37[3] = sub_771140();
          v37[4] = sub_75111C((unint64_t *)&qword_969200, (void (*)(uint64_t))&type metadata accessor for TodayCardOverlay);
          v37[0] = v16;
          swift_unknownObjectRetain();
          swift_retain();
          sub_77A870();
          sub_76F190();
          uint64_t v28 = v36;
          uint64_t v29 = sub_779DD0();
          (*(void (**)(void *, uint64_t, uint64_t, char *, void, uint64_t, uint64_t, uint64_t))(v27 + 112))(v37, v28, v34, v9, v35, v29, ObjectType, v27);
          swift_unknownObjectRelease();
          swift_release();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v37);
        }
        [v5 setNeedsLayout];
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_74D7BC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v58 = a4;
  unsigned int v56 = a3;
  uint64_t v55 = a2;
  uint64_t v6 = sub_77A850();
  uint64_t v57 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_774FC0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77A7E0();
  char v13 = sub_774F80();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if ((v13 & 1) == 0)
  {
    uint64_t result = sub_77A8A0();
    if (result)
    {
      uint64_t v15 = result;
      type metadata accessor for TodayCardOverlayReusePool();
      sub_77CCE0();
      uint64_t v16 = v59[0];
      if (v59[0])
      {
        uint64_t v53 = (uint64_t *)&v5[qword_9B1A90];
        char v17 = v5[qword_9B1A90 + 8];
        sub_771130();
        uint64_t v54 = v16;
        if ((v17 & 1) != 0 || (uint64_t v18 = sub_771120(), v18 != sub_771120()))
        {
          uint64_t v19 = sub_771130();
          uint64_t v20 = sub_4B2064(v19);
          uint64_t v52 = v21;
          uint64_t v22 = *(void *)&v5[qword_9B1A98];
          uint64_t v50 = (uint64_t *)&v5[qword_9B1A98];
          uint64_t v51 = v6;
          v49[1] = v22;
          if (v22)
          {
            uint64_t v23 = *(void *)&v5[qword_9B1A98 + 8];
            uint64_t ObjectType = swift_getObjectType();
            id v25 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 16);
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            v49[0] = v20;
            uint64_t v26 = (void *)v25(ObjectType, v23);
            [v26 removeFromSuperview];

            uint64_t v27 = swift_getObjectType();
            uint64_t v28 = (void *)v25(v27, v23);
            [v28 _setContinuousCornerRadius:0.0];

            uint64_t v29 = (void *)v25(v27, v23);
            id v30 = [v29 layer];

            uint64_t v20 = v49[0];
            [v30 setMaskedCorners:15];
          }
          else
          {
            swift_unknownObjectRetain();
          }
          uint64_t v31 = swift_getObjectType();
          uint64_t v32 = v52;
          uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t))(v52 + 16);
          swift_unknownObjectRetain();
          uint64_t v34 = v20;
          unsigned int v35 = (void *)v33(v31, v32);
          uint64_t v36 = v35;
          double v37 = 14.0;
          if (v5[OBJC_IVAR____TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell_isExpanded]) {
            double v37 = 0.0;
          }
          [v35 _setContinuousCornerRadius:v37];
          id v38 = [v36 layer];
          [v38 setMaskedCorners:12];

          id v39 = [v5 contentView];
          [v39 addSubview:v36];
          swift_unknownObjectRelease_n();

          swift_unknownObjectRelease();
          uint64_t v40 = sub_771130();
          uint64_t v41 = v53;
          *uint64_t v53 = v40;
          *((unsigned char *)v41 + 8) = 0;
          uint64_t v42 = v50;
          *uint64_t v50 = v34;
          v42[1] = v32;
          swift_unknownObjectRelease();
          uint64_t v6 = v51;
        }
        swift_weakAssign();
        if (*(void *)&v5[qword_9B1A98])
        {
          uint64_t v43 = *(void *)&v5[qword_9B1A98 + 8];
          uint64_t v44 = swift_getObjectType();
          uint64_t v45 = v57;
          uint64_t v46 = v44;
          v59[3] = sub_771140();
          v59[4] = sub_75111C((unint64_t *)&qword_969200, (void (*)(uint64_t))&type metadata accessor for TodayCardOverlay);
          v59[0] = v15;
          swift_unknownObjectRetain();
          swift_retain();
          sub_77A870();
          sub_76F190();
          uint64_t v47 = v58;
          uint64_t v48 = sub_779DD0();
          (*(void (**)(void *, uint64_t, uint64_t, char *, void, uint64_t, uint64_t, uint64_t))(v43 + 112))(v59, v47, v55, v8, v56, v48, v46, v43);
          swift_unknownObjectRelease();
          swift_release();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v6);
          _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v59);
        }
        sub_74C7A8();
        [v5 setNeedsLayout];
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_74DD44(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v60 = a4;
  unsigned int v59 = a3;
  uint64_t v58 = a2;
  uint64_t v6 = sub_77A850();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_774FC0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77A7E0();
  char v14 = sub_774F80();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    uint64_t result = sub_77A8A0();
    if (result)
    {
      uint64_t v16 = result;
      type metadata accessor for TodayCardOverlayReusePool();
      sub_77CCE0();
      uint64_t v17 = v61[0];
      if (v61[0])
      {
        uint64_t v54 = (uint64_t *)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlayKind];
        char v18 = v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlayKind + 8];
        sub_771130();
        uint64_t v57 = v17;
        if ((v18 & 1) != 0 || (uint64_t v19 = sub_771120(), v19 != sub_771120()))
        {
          uint64_t v50 = v6;
          uint64_t v53 = v7;
          uint64_t v20 = sub_771130();
          uint64_t v21 = sub_4B2064(v20);
          uint64_t v56 = v22;
          uint64_t v23 = *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlay];
          uint64_t v55 = v21;
          uint64_t v51 = v23;
          uint64_t v52 = (uint64_t *)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlay];
          if (v23)
          {
            uint64_t v24 = *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlay
                               + 8];
            uint64_t ObjectType = swift_getObjectType();
            uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 16);
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            uint64_t v27 = (void *)v26(ObjectType, v24);
            [v27 removeFromSuperview];
          }
          else
          {
            swift_unknownObjectRetain();
          }
          uint64_t v28 = swift_getObjectType();
          uint64_t v29 = v56;
          id v30 = *(uint64_t (**)(uint64_t, uint64_t))(v56 + 16);
          swift_unknownObjectRetain();
          uint64_t v31 = (void *)v30(v28, v29);
          uint64_t v32 = *(char **)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_infoLayerOverlayContainer];
          uint64_t v33 = OBJC_IVAR____TtC18ASMessagesProvider29InfoLayerOverlayContainerView_overlayView;
          uint64_t v34 = *(void **)&v32[OBJC_IVAR____TtC18ASMessagesProvider29InfoLayerOverlayContainerView_overlayView];
          *(void *)&v32[OBJC_IVAR____TtC18ASMessagesProvider29InfoLayerOverlayContainerView_overlayView] = v31;
          id v35 = v31;

          uint64_t v36 = *(void **)&v32[v33];
          uint64_t v6 = v50;
          if (v36)
          {
            objc_msgSend(v36, "setAnchorPoint:", 0.0, 1.0);
            double v37 = *(void **)&v32[v33];
            if (v37)
            {
              v61[0] = 0x3FF0000000000000;
              v61[1] = 0;
              v61[2] = 0;
              uint64_t v62 = 0x3FF0000000000000;
              uint64_t v63 = 0;
              uint64_t v64 = 0;
              [v37 setTransform:v61];
            }
          }
          [v32 addSubview:v35];
          objc_msgSend(v35, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "overrideUserInterfaceStyle"));
          [v5 _continuousCornerRadius];
          objc_msgSend(v35, "_setContinuousCornerRadius:");
          id v38 = [v35 layer];
          [v38 setMaskedCorners:12];
          uint64_t v39 = v55;
          swift_unknownObjectRelease_n();

          swift_unknownObjectRelease();
          uint64_t v40 = sub_771130();
          uint64_t v41 = v54;
          *uint64_t v54 = v40;
          *((unsigned char *)v41 + 8) = 0;
          uint64_t v42 = v52;
          uint64_t v43 = v56;
          *uint64_t v52 = v39;
          v42[1] = v43;
          swift_unknownObjectRelease();
          uint64_t v7 = v53;
        }
        swift_weakAssign();
        if (*(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlay])
        {
          uint64_t v44 = *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider38MultiAppFallbackCardCollectionViewCell_overlay + 8];
          uint64_t v45 = v7;
          uint64_t v46 = swift_getObjectType();
          uint64_t v62 = sub_771140();
          uint64_t v63 = sub_75111C((unint64_t *)&qword_969200, (void (*)(uint64_t))&type metadata accessor for TodayCardOverlay);
          v61[0] = v16;
          swift_unknownObjectRetain();
          swift_retain();
          sub_77A870();
          sub_76F190();
          uint64_t v47 = v60;
          uint64_t v48 = sub_779DD0();
          (*(void (**)(void *, uint64_t, uint64_t, char *, void, uint64_t, uint64_t, uint64_t))(v44 + 112))(v61, v47, v58, v9, v59, v48, v46, v44);
          swift_unknownObjectRelease();
          swift_release();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v9, v6);
          _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v61);
        }
        sub_285718();
        [v5 setNeedsLayout];
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

void sub_74E2B4()
{
  qword_9786A0 = 0x4063E00000000000;
}

double sub_74E2C8()
{
  if (qword_94FCD0 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_9786A0;
  qword_9786A8 = qword_9786A0;
  unk_9786B0 = qword_9786A0;
  return result;
}

void sub_74E320()
{
  qword_9786B8 = 0x4051800000000000;
}

void sub_74E334()
{
  qword_9786C0 = 0x4034000000000000;
}

uint64_t sub_74E344(uint64_t a1)
{
  return sub_74E378(a1, qword_9786C8);
}

uint64_t sub_74E358(uint64_t a1)
{
  return sub_74E378(a1, qword_9786E0);
}

uint64_t sub_74E368(uint64_t a1)
{
  return sub_74E378(a1, qword_9786F8);
}

uint64_t sub_74E378(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_77AA10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_77B1F0();
  sub_1A358(v7, a2);
  sub_FDF4(v7, (uint64_t)a2);
  if (qword_94F1F8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_77AC40();
  uint64_t v9 = sub_FDF4(v8, (uint64_t)qword_9B34A8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v9, v8);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for FontSource.useCase(_:), v3);
  v13[3] = v3;
  v13[4] = (uint64_t)&protocol witness table for FontSource;
  uint64_t v10 = sub_FBE0(v13);
  (*(void (**)(uint64_t *, char *, uint64_t))(v4 + 16))(v10, v6, v3);
  sub_77B200();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_74E554()
{
  uint64_t v0 = sub_77AA10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (UIFontTextStyle *)((char *)&v9[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_77B1F0();
  sub_1A358(v4, qword_978710);
  sub_FDF4(v4, (uint64_t)qword_978710);
  *uint64_t v3 = UIFontTextStyleFootnote;
  (*(void (**)(UIFontTextStyle *, void, uint64_t))(v1 + 104))(v3, enum case for FontSource.textStyle(_:), v0);
  v9[3] = v0;
  v9[4] = (uint64_t)&protocol witness table for FontSource;
  uint64_t v5 = sub_FBE0(v9);
  (*(void (**)(uint64_t *, UIFontTextStyle *, uint64_t))(v1 + 16))(v5, v3, v0);
  uint64_t v6 = UIFontTextStyleFootnote;
  sub_77B200();
  return (*(uint64_t (**)(UIFontTextStyle *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_74E6C0()
{
  uint64_t v0 = sub_FD50((uint64_t *)&unk_951800);
  sub_1A358(v0, qword_978728);
  sub_FDF4(v0, (uint64_t)qword_978728);
  sub_FD50(&qword_951B50);
  type metadata accessor for NSTextAlignment(0);
  return sub_76E3B0();
}

void sub_74E74C()
{
  uint64_t v1 = sub_FD50(&qword_9637B0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_777210();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_FD50((uint64_t *)&unk_95A6D0);
  uint64_t v20 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_FD50((uint64_t *)&unk_957340);
  __chkstk_darwin(v11 - 8);
  char v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + qword_9B4CB0))
  {
    uint64_t v14 = *(void *)(v0 + qword_9B4CA8);
    if (v14)
    {
      uint64_t v19 = *(void *)(v0 + qword_978760);
      swift_retain_n();
      swift_retain();
      uint64_t v18 = sub_779BA0();
      swift_release();
      swift_retain();
      uint64_t v15 = sub_779AC0();
      swift_release();
      uint64_t v16 = sub_FD50((uint64_t *)&unk_957350);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OfferButtonSubtitlePosition.below(_:), v4);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
      sub_75111C((unint64_t *)&qword_95A6F0, (void (*)(uint64_t))&type metadata accessor for OfferButtonSubtitlePosition);
      sub_7756B0();
      sub_1D6CF0(v18, v15, 0, (uint64_t)v13, (uint64_t)v10, v14, 0, 0);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
      sub_14C88((uint64_t)v13, (uint64_t *)&unk_957340);
    }
  }
}

id sub_74EAD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[qword_9B4CB0];
  if (v2 && (uint64_t v3 = *(void *)&v0[qword_9B4CA8]) != 0)
  {
    uint64_t v4 = *(void **)&v0[qword_978748];
    swift_retain();
    swift_retain();
    sub_779BD0();
    if (v5)
    {
      NSString v6 = sub_77D640();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v6 = 0;
    }
    [v4 setText:v6];

    if (qword_94F1F8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_77AC40();
    uint64_t v8 = sub_FDF4(v7, (uint64_t)qword_9B34A8);
    sub_2C5978(v2, v8, v3);
    uint64_t v9 = *(void **)&v1[qword_978758];
    sub_76CCC0();
    if (v10)
    {
      NSString v11 = sub_77D640();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v11 = 0;
    }
    [v9 setText:v11];
    swift_release();
    swift_release();
  }
  else
  {
    [*(id *)&v0[qword_978748] setText:0];
    sub_4F64E4();
    [*(id *)&v0[qword_978758] setText:0];
  }
  sub_74E74C();

  return [v1 setNeedsLayout];
}

char *sub_74ECB0(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_77D040();
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v62 = v9;
  __chkstk_darwin(v9);
  uint64_t v60 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_77AC40();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unsigned int v59 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_775840();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_FD50((uint64_t *)&unk_94FFC0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_76CDF0();
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[qword_9B4CA8] = 0;
  *(void *)&v4[qword_9B4CB0] = 0;
  uint64_t v24 = qword_94FCD0;
  id v25 = v4;
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v64 = v14;
  sub_76CD70();
  id v26 = objc_allocWithZone((Class)type metadata accessor for InAppPurchaseView());
  *(void *)&v25[qword_978740] = sub_24B514((uint64_t)v23, 1);
  if (qword_94F1F8 != -1) {
    swift_once();
  }
  uint64_t v57 = (void (*)(void, void, void))sub_FDF4(v11, (uint64_t)qword_9B34A8);
  uint64_t v27 = *(void (**)(char *, void, uint64_t))(v12 + 16);
  v27(v20, v57, v11);
  uint64_t v56 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  v56(v20, 0, 1, v11);
  uint64_t v28 = *(void (**)(void))(v15 + 104);
  unsigned int v55 = enum case for DirectionalTextAlignment.none(_:);
  uint64_t v54 = (void (*)(char *, void, uint64_t))v28;
  v28(v17);
  Class v53 = (Class)sub_770A00();
  id v29 = objc_allocWithZone(v53);
  uint64_t v30 = sub_7709F0();
  uint64_t v31 = v25;
  uint64_t v58 = qword_978748;
  *(void *)&v25[qword_978748] = v30;
  uint64_t v32 = (uint64_t)v59;
  uint64_t v33 = v57;
  uint64_t v57 = (void (*)(void, void, void))v27;
  v27(v59, v33, v11);
  id v34 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(void *)&v31[qword_978750] = sub_4F5D40(v32, 1, 4);
  id v35 = v31;
  if (qword_94F200 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_FDF4(v11, (uint64_t)qword_9B34C0);
  v57(v20, v36, v11);
  v56(v20, 0, 1, v11);
  v54(v17, v55, v64);
  id v37 = objc_allocWithZone(v53);
  *(void *)&v31[qword_978758] = sub_7709F0();
  *(void *)&v31[qword_978760] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for OfferButton()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v38 = v60;
  sub_77CFF0();
  sub_14C88((uint64_t)&v66, (uint64_t *)&unk_951B40);
  sub_14C88((uint64_t)&v68, (uint64_t *)&unk_951B40);
  sub_77E240();
  uint64_t v39 = v62;
  uint64_t v40 = *(void (**)(char *, uint64_t))(v61 + 8);
  v40(v38, v62);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  sub_77CFF0();
  sub_14C88((uint64_t)&v66, (uint64_t *)&unk_951B40);
  sub_14C88((uint64_t)&v68, (uint64_t *)&unk_951B40);
  sub_77E240();
  v40(v38, v39);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  sub_77CFF0();
  sub_14C88((uint64_t)&v66, (uint64_t *)&unk_951B40);
  sub_14C88((uint64_t)&v68, (uint64_t *)&unk_951B40);
  sub_77E240();
  v40(v38, v39);

  v65.receiver = v35;
  v65.super_class = ObjectType;
  uint64_t v41 = (char *)objc_msgSendSuper2(&v65, "initWithFrame:", a1, a2, a3, a4);
  id v42 = [v41 contentView];
  [v42 addSubview:*(void *)&v41[qword_978740]];

  id v43 = [v41 contentView];
  [v43 addSubview:*(void *)&v41[qword_978748]];

  id v44 = [v41 contentView];
  [v44 addSubview:*(void *)&v41[qword_978750]];

  uint64_t v45 = qword_978758;
  uint64_t v46 = *(void **)&v41[qword_978758];
  sub_FE2C(0, (unint64_t *)&qword_94FFD0);
  id v47 = v46;
  uint64_t v48 = (void *)sub_77E330();
  [v47 setTextColor:v48];

  id v49 = [v41 contentView];
  [v49 addSubview:*(void *)&v41[v45]];

  id v50 = [v41 contentView];
  id v51 = *(id *)&v41[qword_978760];
  [v50 addSubview:v51];

  return v41;
}

char *sub_74F51C(double a1, double a2, double a3, double a4)
{
  return sub_74ECB0(a1, a2, a3, a4);
}

void sub_74F540()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_77B1F0();
  double v98 = *(double *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v97 = (char *)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_77EC00();
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)&double v7 = __chkstk_darwin(v5).n128_u64[0];
  uint64_t v9 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109.receiver = v1;
  v109.super_class = ObjectType;
  objc_msgSendSuper2(&v109, "layoutSubviews", v7);
  id v10 = [v1 contentView];
  sub_FE2C(0, (unint64_t *)&qword_94FFE0);
  sub_772580();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  uint64_t v19 = *(unsigned char **)&v1[qword_978760];
  uint64_t v20 = (double *)&v19[OBJC_IVAR____TtC18ASMessagesProvider11OfferButton_cachedIntrinsicContentSize];
  if (v19[OBJC_IVAR____TtC18ASMessagesProvider11OfferButton_cachedIntrinsicContentSize + 16])
  {
    uint64_t v21 = (uint64_t)&v19[OBJC_IVAR____TtC18ASMessagesProvider11OfferButton__configuration];
    swift_beginAccess();
    sub_145F4(v21, (uint64_t)v108);
    sub_FB9C(v108, v108[3]);
    sub_775B30();
    double v23 = v22;
    double v25 = v24;
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v108);
    CGFloat v105 = v23;
    *uint64_t v20 = v23;
    v20[1] = v25;
    CGFloat v104 = v25;
    *((unsigned char *)v20 + 16) = 0;
  }
  else
  {
    CGFloat v104 = v20[1];
    CGFloat v105 = *v20;
  }
  if (qword_94FCF8 != -1) {
    swift_once();
  }
  sub_FDF4(v3, (uint64_t)qword_9786E0);
  sub_77A9E0();
  sub_77AC70();
  double v96 = v26;
  uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v9, v5);
  if (qword_94FD08 != -1) {
    swift_once();
  }
  sub_FDF4(v3, (uint64_t)qword_978710);
  sub_77A9E0();
  sub_77AC70();
  double v29 = v28;
  v27(v9, v5);
  uint64_t v30 = *(void **)&v1[qword_978740];
  sub_76CDB0();
  double v32 = v31;
  double v34 = v33;
  v110.origin.x = v12;
  v110.origin.y = v14;
  v110.size.width = v16;
  v110.size.height = v18;
  double v35 = CGRectGetMidX(v110) + v32 * -0.5;
  if (qword_94FCE0 != -1) {
    swift_once();
  }
  CGFloat v93 = v35;
  CGFloat v92 = *(double *)&qword_9786B8;
  CGFloat v95 = v32;
  CGFloat v94 = v34;
  sub_77E0F0();
  objc_msgSend(v30, "setFrame:");
  v111.origin.x = v12;
  v111.origin.y = v14;
  v111.size.width = v16;
  v111.size.height = v18;
  double v36 = CGRectGetWidth(v111) - v105 - v29;
  id v37 = *(void **)&v1[qword_978758];
  v112.origin.x = v12;
  v112.origin.y = v14;
  v112.size.width = v16;
  v112.size.height = v18;
  objc_msgSend(v37, "sizeThatFits:", v36, CGRectGetHeight(v112));
  v113.origin.x = v12;
  v113.origin.y = v14;
  v113.size.width = v16;
  v113.size.height = v18;
  CGRectGetMaxY(v113);
  if (qword_94FCE8 != -1) {
    swift_once();
  }
  CGFloat v102 = *(double *)&qword_9786C0;
  v114.origin.x = v12;
  v114.origin.y = v14;
  v114.size.width = v16;
  v114.size.height = v18;
  CGRectGetMinX(v114);
  [v37 lastBaselineFromBottom];
  double v103 = v36;
  sub_77E0F0();
  objc_msgSend(v37, "setFrame:");
  id v38 = [v37 text];
  if (v38)
  {

    [v37 lastBaselineMaxY];
    double v40 = v39;
  }
  else
  {
    v115.origin.x = v12;
    v115.origin.y = v14;
    v115.size.width = v16;
    v115.size.height = v18;
    double v40 = CGRectGetMaxY(v115) - v102;
  }
  v116.origin.x = v12;
  v116.origin.y = v14;
  v116.size.width = v16;
  v116.size.height = v18;
  CGFloat MaxX = CGRectGetMaxX(v116);
  CGFloat v100 = v12;
  CGFloat v99 = v14;
  CGFloat v102 = MaxX - v105;
  CGFloat v101 = v40 - v104;
  sub_77E0F0();
  double v43 = v42;
  double v45 = v44;
  CGFloat v90 = v18;
  double v47 = v46;
  double v91 = v16;
  double v49 = v48;
  id v50 = (objc_class *)type metadata accessor for OfferButton();
  v107.receiver = v19;
  v107.super_class = v50;
  objc_msgSendSuper2(&v107, "frame");
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  v106.receiver = v19;
  v106.super_class = v50;
  objc_msgSendSuper2(&v106, "setFrame:", v43, v45, v47, v49);
  sub_1D4650(v52, v54, v56, v58);
  if (qword_94FD00 != -1) {
    swift_once();
  }
  sub_FDF4(v3, (uint64_t)qword_9786F8);
  sub_77A9E0();
  sub_77AC70();
  double v60 = v59;
  v27(v9, v5);
  uint64_t v61 = *(void **)&v1[qword_978748];
  double v62 = v91;
  double v63 = v90;
  [v61 sizeThatFits:v91];
  double v65 = v64;
  v117.origin.x = v93;
  v117.origin.y = v92;
  v117.size.width = v95;
  v117.size.height = v94;
  double MaxY = CGRectGetMaxY(v117);
  if (qword_94FCF0 != -1) {
    swift_once();
  }
  uint64_t v67 = sub_FDF4(v3, (uint64_t)qword_9786C8);
  double v68 = v98;
  long long v69 = v97;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)&v98 + 16))(v97, v67, v3);
  sub_77A9E0();
  id v70 = [v61 traitCollection];
  sub_77B1D0();
  double v72 = v71;

  [v61 firstBaselineFromTop];
  double v74 = v72 - v73;
  v27(v9, v5);
  (*(void (**)(char *, uint64_t))(*(void *)&v68 + 8))(v69, v3);
  double v98 = v60;
  CGFloat v75 = v60 + v65 + MaxY + v74;
  v118.origin.x = v102;
  v118.origin.y = v101;
  v118.size.width = v105;
  v118.size.height = v104;
  CGFloat MinY = CGRectGetMinY(v118);
  CGFloat v77 = v100;
  CGFloat v78 = v99;
  if (MinY >= v75)
  {
    v119.origin.x = v100;
    v119.origin.y = v99;
    v119.size.width = v62;
    v119.size.height = v63;
    CGRectGetWidth(v119);
  }
  v120.origin.x = v77;
  v120.origin.y = v78;
  v120.size.width = v62;
  v120.size.height = v63;
  CGRectGetMinX(v120);
  sub_77E0F0();
  objc_msgSend(v61, "setFrame:");
  v79 = *(void **)&v1[qword_978750];
  objc_msgSend(v79, "sizeThatFits:", v62, v63);
  double v81 = v80;
  sub_FE2C(0, (unint64_t *)&qword_951810);
  if (qword_94F1F8 != -1) {
    swift_once();
  }
  uint64_t v82 = sub_77AC40();
  sub_FDF4(v82, (uint64_t)qword_9B34A8);
  id v83 = [v1 traitCollection];
  uint64_t v84 = (void *)sub_77E1E0();

  [v61 lastBaselineMaxY];
  double v86 = v96 + v85;
  sub_77E1F0();
  CGFloat v88 = v98 + v81 + v86 - v87;
  v121.origin.x = v102;
  v121.origin.y = v101;
  v121.size.width = v105;
  v121.size.height = v104;
  if (CGRectGetMinY(v121) >= v88)
  {
    v122.origin.x = v77;
    v122.origin.y = v78;
    v122.size.width = v62;
    v122.size.height = v63;
    CGRectGetWidth(v122);
  }
  v123.origin.x = v77;
  v123.origin.y = v78;
  v123.size.width = v62;
  v123.size.height = v63;
  CGRectGetMinX(v123);
  sub_77E0F0();
  objc_msgSend(v79, "setFrame:");
}

void sub_75001C(void *a1)
{
  id v1 = a1;
  sub_74F540();
}

uint64_t sub_750064(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  swift_getObjectType();
  sub_74CF2C(a1, a2, a3 & 1);
  uint64_t result = swift_dynamicCastClass();
  if (result)
  {
    uint64_t v9 = (char *)result;
    id v10 = a1;
    id v11 = [v4 backgroundView];
    if (v11)
    {
      CGFloat v12 = v11;
      id v13 = [v9 backgroundView];
      id v14 = [v13 backgroundColor];

      [v12 setBackgroundColor:v14];
    }
    double v15 = (char *)*(id *)&v9[qword_978740];
    sub_24CA60(v15);

    *(void *)&v4[qword_9B4CB0] = *(void *)&v9[qword_9B4CB0];
    swift_retain_n();
    swift_release();
    sub_74EAD8();

    return swift_release();
  }
  return result;
}

void sub_7501C8(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_77A850();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  double v46 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  double v15 = (char *)&v37 - v14;
  __chkstk_darwin(v16);
  CGFloat v18 = (char *)&v37 - v17;
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v37 - v20;
  sub_74CB64(a1, a2, a3, a4);
  uint64_t v22 = sub_77A860();
  sub_76C9C0();
  uint64_t v23 = swift_dynamicCastClass();
  if (v23)
  {
    double v39 = v15;
    uint64_t v41 = v23;
    uint64_t v43 = v22;
    sub_76F190();
    uint64_t v44 = a4;
    uint64_t v42 = sub_779DD0();
    [*(id *)&v5[qword_9B1A88] setText:0];
    uint64_t v40 = a1;
    sub_77A870();
    id v38 = *(void (**)(char *, void, uint64_t))(v11 + 104);
    v38(v18, enum case for TodayCard.Style.dark(_:), v10);
    sub_75111C((unint64_t *)&qword_96AAA0, (void (*)(uint64_t))&type metadata accessor for TodayCard.Style);
    sub_77D860();
    sub_77D860();
    double v45 = v5;
    if (v49 == v47 && v50 == v48) {
      char v24 = 1;
    }
    else {
      char v24 = sub_77EC30();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    double v25 = *(void (**)(char *, uint64_t))(v11 + 8);
    v25(v18, v10);
    v25(v21, v10);
    if (v24)
    {
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v27 = v39;
      sub_77A870();
      v38(v46, enum case for TodayCard.Style.light(_:), v10);
      sub_77D860();
      sub_77D860();
      if (v49 == v47 && v50 == v48)
      {
        swift_bridgeObjectRelease_n();
        v25(v46, v10);
        v25(v27, v10);
        uint64_t v26 = 1;
      }
      else
      {
        char v28 = sub_77EC30();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v25(v46, v10);
        v25(v27, v10);
        uint64_t v26 = v28 & 1;
      }
    }
    double v29 = v45;
    [v45 setOverrideUserInterfaceStyle:v26];
    uint64_t v30 = sub_77A780();
    if (!v30)
    {
      sub_FE2C(0, (unint64_t *)&qword_94FFD0);
      uint64_t v30 = sub_77E3B0();
    }
    double v31 = (void *)v30;
    id v32 = [v29 backgroundView];
    if (v32)
    {
      double v33 = v32;
      [v32 setBackgroundColor:v31];
    }
    uint64_t v34 = sub_76C9B0();
    if (qword_94FCD8 != -1) {
      swift_once();
    }
    id v35 = v31;
    sub_24C848(v34, (uint64_t)v31, v42);
    swift_release();

    uint64_t v36 = swift_retain();
    sub_750D80(v36);
    swift_release();
    *(void *)&v29[qword_9B4CB0] = sub_76C9B0();
    swift_retain();
    swift_release();
    sub_74EAD8();
    swift_release();
    [v29 setNeedsLayout];
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_75075C(uint64_t a1, uint64_t a2)
{
  sub_74D284(a1);
  sub_145F4(a1, (uint64_t)v8);
  sub_FD50((uint64_t *)&unk_9512A0);
  sub_77A8C0();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    sub_77A860();
    swift_release();
    sub_76C9C0();
    if (swift_dynamicCastClass())
    {
      uint64_t v6 = *(void *)(v2 + qword_978740);
      uint64_t v7 = sub_76C9B0();
      if (qword_94FCD8 != -1) {
        swift_once();
      }
      sub_6BE7A8(v7, v6, a2, 2);
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_750884(uint64_t a1, uint64_t a2, Swift::Bool a3)
{
  if (*(void *)(v3 + qword_9B1A98))
  {
    uint64_t v5 = *(void *)(v3 + qword_9B1A98 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 128);
    swift_unknownObjectRetain();
    v7(a1, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  v10.value.super.isa = 0;
  v10.is_nil = 0;
  sub_76E2C0(v10, a3);
  v11.value.super.isa = 0;
  v11.is_nil = 0;
  sub_76E2C0(v11, v8);
  sub_76E300();
  sub_75111C((unint64_t *)&qword_957370, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
  sub_76F150();
  return sub_76F150();
}

id sub_7509DC(void *a1)
{
  uint64_t v2 = v1;
  v9.receiver = v2;
  v9.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v9, "traitCollectionDidChange:", a1);
  id v4 = [v2 traitCollection];
  id v5 = [v4 layoutDirection];

  if (!a1 || (id result = [a1 layoutDirection], v5 != result))
  {
    if (qword_94FD10 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_FD50((uint64_t *)&unk_951800);
    sub_FDF4(v7, (uint64_t)qword_978728);
    sub_76E3A0();
    objc_msgSend(*(id *)&v2[qword_978748], "setTextAlignment:", v8, v2);
    [*(id *)&v2[qword_978750] setTextAlignment:v8];
    return [*(id *)&v2[qword_978758] setTextAlignment:v8];
  }
  return result;
}

void sub_750B38(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_7509DC(a3);
}

uint64_t sub_750BA4()
{
  swift_release();

  return swift_release();
}

uint64_t sub_750C34(uint64_t a1)
{
  swift_release();

  return swift_release();
}

uint64_t type metadata accessor for InAppPurchaseTodayCardCollectionViewCell()
{
  uint64_t result = qword_978790;
  if (!qword_978790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_750D1C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_750D78()
{
  return type metadata accessor for InAppPurchaseTodayCardCollectionViewCell();
}

uint64_t sub_750D80(uint64_t a1)
{
  uint64_t v3 = sub_FD50(&qword_9637B0);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_777210();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_FD50((uint64_t *)&unk_95A6D0);
  uint64_t v23 = *(void *)(v10 - 8);
  uint64_t v24 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_FD50((uint64_t *)&unk_957340);
  __chkstk_darwin(v13 - 8);
  double v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = qword_9B4CA8;
  *(void *)(v1 + qword_9B4CA8) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if (*(void *)(v1 + qword_9B4CB0))
  {
    uint64_t v18 = *(void *)(v1 + v16);
    if (v18)
    {
      v22[1] = *(void *)(v1 + qword_978760);
      swift_retain_n();
      swift_retain();
      uint64_t v19 = sub_779BA0();
      swift_release();
      swift_retain();
      uint64_t v20 = sub_779AC0();
      swift_release();
      uint64_t v21 = sub_FD50((uint64_t *)&unk_957350);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v15, 1, 1, v21);
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for OfferButtonSubtitlePosition.below(_:), v6);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
      sub_75111C((unint64_t *)&qword_95A6F0, (void (*)(uint64_t))&type metadata accessor for OfferButtonSubtitlePosition);
      sub_7756B0();
      sub_1D6CF0(v19, v20, 0, (uint64_t)v15, (uint64_t)v12, v18, 0, 0);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
      return sub_14C88((uint64_t)v15, (uint64_t *)&unk_957340);
    }
  }
  return result;
}

uint64_t sub_75111C(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_751164(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8 = *a1;
  uint64_t ObjectType = swift_getObjectType();
  PageTraitEnvironment.pageColumnWidth.getter();
  double v11 = v10;
  uint64_t v12 = type metadata accessor for AppEventView();

  return sub_6661F8(v11, v8, a6, a4, v12, ObjectType);
}

id sub_7511E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  sub_666508(*a1, a3);

  return [v3 setNeedsLayout];
}

uint64_t sub_751240(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider26AppEventCollectionViewCell_appEventView];
  [v2 bounds];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = sub_FB9C(a1, v6);

  return sub_6668B8((uint64_t)v8, a2, v5, v6, v7);
}

void sub_7512D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_751318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_7513F8(a1, a2, a3, a4, a5);
}

uint64_t sub_751320()
{
  return sub_7513B0(&qword_96B4A8, (void (*)(uint64_t))&type metadata accessor for AppEvent);
}

uint64_t sub_751368()
{
  return sub_7513B0(&qword_95A660, (void (*)(uint64_t))&type metadata accessor for NilState);
}

uint64_t sub_7513B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_7513F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t ObjectType = swift_getObjectType();
  PageTraitEnvironment.pageColumnWidth.getter();
  double v10 = v9;
  id v11 = [a5 traitCollection];
  id v12 = [v11 preferredContentSizeCategory];
  char v13 = sub_77DF50();

  if ((v13 & 1) == 0)
  {
    if (qword_94DD08 != -1) {
      swift_once();
    }
    sub_54B44C((uint64_t)&unk_9AFB28, (uint64_t)a5);
    if (qword_94D950 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for AppEventCardLayout.Metrics(0);
    uint64_t v18 = sub_FDF4(v17, (uint64_t)qword_9AEF50);
    sub_2E2A18(v18, a1, a4, (char *)a5, ObjectType);
    goto LABEL_30;
  }
  unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v33 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    uint64_t v16 = a1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_145F4(v16, (uint64_t)v32);
      sub_145F4((uint64_t)v32, (uint64_t)v30);
      sub_FD50(&qword_957380);
      sub_76D810();
      if ((swift_dynamicCast() & 1) == 0) {
        uint64_t v31 = 0;
      }
      _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v32);
      if (v31)
      {
        sub_77D870();
        if (*(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v33 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_77D8B0();
        sub_77D930();
        sub_77D8A0();
      }
      v16 += 40;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    unint64_t v14 = v33;
  }
  if (!(v14 >> 62))
  {
    uint64_t v19 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
    if (v19) {
      goto LABEL_19;
    }
LABEL_29:
    swift_bridgeObjectRelease();
LABEL_30:
    uint64_t v27 = self;
    PageTraitEnvironment.pageColumnWidth.getter();
    id v28 = objc_msgSend(v27, "absoluteDimension:");
    uint64_t v29 = sub_774690();

    return v29;
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_77EB40();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_29;
  }
LABEL_19:
  uint64_t result = type metadata accessor for AppEventView();
  if (v19 >= 1)
  {
    uint64_t v21 = result;
    uint64_t v22 = 0;
    double v23 = 0.0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
      {
        uint64_t v24 = sub_77EA30();
      }
      else
      {
        uint64_t v24 = *(void *)(v14 + 8 * v22 + 32);
        swift_retain();
      }
      ++v22;
      sub_6661F8(v10, v24, a5, a4, v21, ObjectType);
      double v26 = v25;
      swift_release();
      if (v23 <= v26) {
        double v23 = v26;
      }
    }
    while (v19 != v22);
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for OfferStateActionImplementation()
{
  return &type metadata for OfferStateActionImplementation;
}

uint64_t sub_7517D0()
{
  return sub_7521EC(&qword_978B78, (void (*)(uint64_t))&type metadata accessor for OfferStateAction);
}

uint64_t sub_751804(uint64_t *a1, uint64_t a2)
{
  return sub_751CC0(*a1, a2);
}

uint64_t sub_75180C(uint64_t a1)
{
  uint64_t v2 = sub_77C870();
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  uint64_t v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_77D0B0();
  uint64_t v28 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v27 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_FD50((uint64_t *)&unk_9514E0);
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  __chkstk_darwin(v9);
  id v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_FD50((uint64_t *)&unk_9518E0);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_FD50((uint64_t *)&unk_9514F0);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1;
  swift_retain();
  sub_77CCE0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_2D268((uint64_t)v14);
    sub_FD50(&qword_9608A0);
    sub_5A760();
    swift_allocError();
    *uint64_t v19 = 1;
    uint64_t v20 = sub_77D300();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    v35[3] = sub_779990();
    v35[4] = sub_7521EC((unint64_t *)&qword_9518F0, (void (*)(uint64_t))&type metadata accessor for Action);
    v35[0] = v34;
    swift_retain();
    sub_5F4C3C();
    uint64_t v21 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v27, v8, v4);
    uint64_t v22 = v29;
    sub_77C850();
    sub_77CCB0();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v33);
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v11, v8, v4);
    uint64_t v24 = v30;
    uint64_t v23 = v31;
    (*(void (**)(char *, void, uint64_t))(v30 + 104))(v11, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v31);
    uint64_t v20 = sub_77CD70();
    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v23);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v35);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  swift_release();
  return v20;
}

uint64_t sub_751CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = sub_76D210();
  uint64_t v38 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  v33[0] = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v40 = (char *)v33 - v5;
  __chkstk_darwin(v6);
  uint64_t v37 = (char *)v33 - v7;
  uint64_t v8 = sub_FD50((uint64_t *)&unk_9514F0);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_779A00();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_FD50(&qword_9608A0);
  uint64_t v39 = sub_77D350();
  sub_779DB0();
  swift_getObjectType();
  sub_770C30();
  sub_76D470();
  swift_unknownObjectRelease();
  uint64_t v15 = v11;
  uint64_t v16 = v40;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v15);
  uint64_t v36 = v10;
  v33[1] = a2;
  uint64_t v18 = v37;
  uint64_t v17 = v38;
  sub_779DA0();
  uint64_t v19 = sub_770C00();
  swift_getObjectType();
  sub_770C20();
  uint64_t v20 = v41;
  sub_76D370();
  char v21 = sub_76D200();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v22(v16, v18, v20);
  if (v21)
  {
    uint64_t v40 = *(char **)(v17 + 8);
    ((void (*)(char *, uint64_t))v40)(v16, v20);
    goto LABEL_4;
  }
  char v23 = sub_76D1B0();
  uint64_t v40 = *(char **)(v17 + 8);
  ((void (*)(char *, uint64_t))v40)(v16, v20);
  if (v23)
  {
LABEL_4:
    uint64_t v24 = sub_770BE0();
    uint64_t v26 = v34;
    uint64_t v25 = v35;
    uint64_t v27 = v36;
    if (!v24)
    {
      swift_retain();
      uint64_t v24 = v19;
    }
    goto LABEL_12;
  }
  uint64_t v28 = v33[0];
  v22((char *)v33[0], v18, v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 88))(v28, v20) == enum case for LegacyAppState.openable(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v17 + 96))(v28, v20);

    uint64_t v29 = sub_773030();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
    uint64_t v30 = sub_770BF0();
    uint64_t v27 = v36;
    if (v30)
    {
      uint64_t v24 = v30;
    }
    else
    {
      swift_retain();
      uint64_t v24 = v19;
    }
    uint64_t v26 = v34;
    uint64_t v25 = v35;
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v40)(v28, v20);
    swift_retain();
    uint64_t v24 = v19;
    uint64_t v26 = v34;
    uint64_t v25 = v35;
    uint64_t v27 = v36;
  }
LABEL_12:
  sub_75180C(v24);
  swift_release();
  uint64_t v31 = v39;
  sub_77D2E0();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  ((void (*)(char *, uint64_t))v40)(v18, v41);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
  return v31;
}

uint64_t sub_7521EC(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_752240(uint64_t a1)
{
  if (a1)
  {
    sub_773C40();
    uint64_t v1 = sub_76EDF0();
    uint64_t v2 = sub_237278(v1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_36698);
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_76EDE0();
    sub_4F61C4(v3, 0, (uint64_t)v2);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    if (sub_773C50())
    {
      uint64_t v4 = sub_76EDF0();
      uint64_t v5 = sub_237278(v4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_36698);
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_76EDE0();
      sub_4F61C4(v6, 0, (uint64_t)v5);
      swift_release();
      swift_bridgeObjectRelease();
      return (id)swift_release();
    }
  }
  else
  {
    sub_4F64E4();
  }
  return sub_4F64E4();
}

double static LargeGameCenterPlayerLayout.estimatedMeasurements(fitting:using:in:)(uint64_t a1, void *a2, double a3)
{
  swift_getObjectType();

  return sub_753344(a1, a2, a3);
}

uint64_t LargeGameCenterPlayerLayout.placeChildren(relativeTo:in:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v7 = v6;
  uint64_t v91 = a1;
  uint64_t v92 = a2;
  uint64_t v98 = sub_77EC00();
  uint64_t v103 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  CGFloat v90 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_77B400();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v97 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_77AA60();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  double v85 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_77B3F0();
  uint64_t v15 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  CGFloat v75 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_77B3B0();
  double v81 = *(void **)(v96 - 8);
  CGFloat v99 = v81;
  __chkstk_darwin(v96);
  CGFloat v95 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_77B3C0();
  uint64_t v102 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  CGFloat v93 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_77B360();
  uint64_t v101 = *(void *)(v100 - 8);
  uint64_t v19 = v101;
  __chkstk_darwin(v100);
  char v21 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v6 + 208);
  id v83 = (void *)(v6 + 184);
  sub_FB9C((void *)(v6 + 184), v22);
  v111.origin.x = a3;
  v111.origin.y = a4;
  v111.size.width = a5;
  v111.size.height = a6;
  CGRectGetMinX(v111);
  v112.origin.x = a3;
  v112.origin.y = a4;
  v112.size.width = a5;
  v112.size.height = a6;
  CGRectGetMinY(v112);
  sub_77AAA0();
  sub_FD50(&qword_950E18);
  uint64_t v23 = *(void *)(v15 + 72);
  uint64_t v76 = v15;
  unint64_t v24 = (*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
  uint64_t v74 = v23;
  uint64_t v25 = swift_allocObject();
  long long v78 = xmmword_78DBA0;
  *(_OWORD *)(v25 + 16) = xmmword_78DBA0;
  unint64_t v73 = v24;
  uint64_t v82 = v25;
  double v80 = (void (*)(char *, uint64_t))(v25 + v24);
  uint64_t v26 = *(void *)(v7 + 248);
  uint64_t v27 = *(void *)(v7 + 256);
  uint64_t v84 = (void *)(v7 + 224);
  uint64_t v28 = sub_FB9C((void *)(v7 + 224), v26);
  uint64_t v109 = v26;
  uint64_t v110 = *(void *)(v27 + 8);
  uint64_t v29 = sub_FBE0(&v108);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v29, v28, v26);
  uint64_t v79 = v7 + 16;
  objc_super v106 = &type metadata for Double;
  objc_super v107 = &protocol witness table for Double;
  uint64_t v105 = 0;
  uint64_t v30 = *(void (**)(void))(v19 + 104);
  unsigned int v71 = enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:);
  uint64_t v72 = v19 + 104;
  id v70 = (void (*)(char *, void, uint64_t))v30;
  v30(v21);
  uint64_t v31 = v102;
  uint64_t v32 = *(void (**)(void))(v102 + 104);
  uint64_t v33 = v93;
  unsigned int v68 = enum case for VerticalFlowLayout.HorizontalPlacement.center(_:);
  uint64_t v34 = v94;
  uint64_t v69 = v102 + 104;
  uint64_t v67 = (void (*)(char *, void, uint64_t))v32;
  v32(v93);
  sub_FD50((uint64_t *)&unk_974FC0);
  uint64_t v35 = v99;
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = v78;
  sub_77B380();
  uint64_t v104 = v36;
  sub_754AAC(&qword_950E08, (void (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition);
  sub_FD50((uint64_t *)&unk_974FD0);
  sub_22E20();
  uint64_t v37 = v95;
  uint64_t v38 = v96;
  sub_77E880();
  uint64_t v39 = v33;
  uint64_t v40 = v37;
  sub_77B3E0();
  uint64_t v41 = (void (*)(char *, uint64_t))v35[1];
  CGFloat v99 = v35 + 1;
  v41(v40, v38);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v102 = v31 + 8;
  v42(v39, v34);
  uint64_t v43 = *(void (**)(char *, uint64_t))(v101 + 8);
  uint64_t v44 = v21;
  v101 += 8;
  v43(v21, v100);
  sub_3A6E8((uint64_t)&v105);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v108);
  LODWORD(v34) = *(unsigned __int8 *)(v7 + 176);
  sub_FB9C((void *)(v7 + 264), *(void *)(v7 + 288));
  double v81 = (void *)(v7 + 264);
  if (v34 == 1)
  {
    sub_77AAC0();
    uint64_t v45 = *(void *)(v7 + 288);
    uint64_t v46 = *(void *)(v7 + 296);
    uint64_t v47 = sub_FB9C((void *)(v7 + 264), v45);
    uint64_t v109 = v45;
    uint64_t v110 = *(void *)(v46 + 8);
    uint64_t v48 = sub_FBE0(&v108);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(v48, v47, v45);
    objc_super v107 = &protocol witness table for Double;
    objc_super v106 = &type metadata for Double;
    uint64_t v105 = 0;
    double v80 = v42;
    uint64_t v49 = v100;
    v70(v21, v71, v100);
    uint64_t v50 = v93;
    uint64_t v51 = v94;
    v67(v93, v68, v94);
    CGFloat v52 = v43;
    double v53 = v95;
    sub_77B390();
    CGFloat v54 = v75;
    sub_77B3E0();
    v41(v53, v96);
    v80(v50, v51);
    v52(v44, v49);
    sub_3A6E8((uint64_t)&v105);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v108);
    unint64_t v56 = *(void *)(v82 + 16);
    unint64_t v55 = *(void *)(v82 + 24);
    double v57 = v54;
    uint64_t v58 = v82;
    if (v56 >= v55 >> 1) {
      uint64_t v58 = sub_85710(v55 > 1, v56 + 1, 1, v82);
    }
    *(void *)(v58 + 16) = v56 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v76 + 32))(v58 + v73 + v56 * v74, v57, v77);
  }
  else
  {
    sub_77AAC0();
    sub_FB9C((void *)(v7 + 264), *(void *)(v7 + 288));
    sub_77AAA0();
  }
  sub_77B3D0();
  v113.origin.x = a3;
  v113.origin.y = a4;
  v113.size.width = a5;
  v113.size.height = a6;
  CGRectGetMinX(v113);
  sub_FB9C((void *)(v7 + 136), *(void *)(v7 + 160));
  double v59 = v90;
  sub_390CC();
  sub_77AC70();
  double v60 = *(void (**)(char *, uint64_t))(v103 + 8);
  v103 += 8;
  uint64_t v61 = v98;
  v60(v59, v98);
  double v62 = v83;
  sub_FB9C(v83, *(void *)(v7 + 208));
  sub_77AA90();
  CGRectGetMaxY(v114);
  v115.origin.x = a3;
  v115.origin.y = a4;
  v115.size.width = a5;
  v115.size.height = a6;
  CGRectGetWidth(v115);
  sub_FB9C((void *)(v7 + 136), *(void *)(v7 + 160));
  sub_390CC();
  sub_77AC70();
  v60(v59, v61);
  v116.origin.x = a3;
  v116.origin.y = a4;
  v116.size.width = a5;
  v116.size.height = a6;
  CGRectGetHeight(v116);
  sub_FB9C(v62, *(void *)(v7 + 208));
  sub_77AA90();
  CGRectGetMaxY(v117);
  double v63 = v85;
  double v64 = v97;
  sub_77B370();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v64, v89);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v63, v87);
  v118.origin.x = a3;
  v118.origin.y = a4;
  v118.size.width = a5;
  v118.size.height = a6;
  CGRectGetMinX(v118);
  v119.origin.x = a3;
  v119.origin.y = a4;
  v119.size.width = a5;
  v119.size.height = a6;
  CGRectGetMinY(v119);
  v120.origin.x = a3;
  v120.origin.y = a4;
  v120.size.width = a5;
  v120.size.height = a6;
  CGRectGetWidth(v120);
  sub_FB9C(v84, *(void *)(v7 + 248));
  sub_77AA90();
  CGRectGetMaxY(v121);
  sub_FB9C(v81, *(void *)(v7 + 288));
  sub_77AA90();
  CGRectGetMaxY(v122);
  sub_FB9C((void *)(v7 + 96), *(void *)(v7 + 120));
  sub_390CC();
  sub_77AC70();
  v60(v59, v98);
  return sub_77AA20();
}

uint64_t LargeGameCenterPlayerLayout.Metrics.labelBottomSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_145F4(v1 + 96, a1);
}

uint64_t LargeGameCenterPlayerLayout.Metrics.labelBottomSpace.setter(long long *a1)
{
  uint64_t v3 = v1 + 96;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(v3);

  return sub_146C0(a1, v3);
}

uint64_t LargeGameCenterPlayerLayout.Metrics.labelMargin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_145F4(v1 + 136, a1);
}

uint64_t LargeGameCenterPlayerLayout.Metrics.labelMargin.setter(long long *a1)
{
  uint64_t v3 = v1 + 136;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(v3);

  return sub_146C0(a1, v3);
}

uint64_t LargeGameCenterPlayerLayout.Metrics.shouldLayoutTwoLines.getter()
{
  return *(unsigned __int8 *)(v0 + 176);
}

uint64_t LargeGameCenterPlayerLayout.Metrics.shouldLayoutTwoLines.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 176) = result;
  return result;
}

uint64_t (*LargeGameCenterPlayerLayout.Metrics.shouldLayoutTwoLines.modify())()
{
  return static CondensedEditorialSearchResultContentView.prefetchArtwork(for:with:asPartOf:);
}

uint64_t LargeGameCenterPlayerLayout.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_269AB4(v1, a1);
}

uint64_t LargeGameCenterPlayerLayout.displayName.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_145F4(v1 + 264, a1);
}

double LargeGameCenterPlayerLayout.measurements(fitting:in:)(void *a1, double a2)
{
  swift_getObjectType();

  return sub_753344(v2, a1, a2);
}

double sub_753344(uint64_t a1, void *a2, double a3)
{
  uint64_t v123 = sub_77EC00();
  uint64_t v122 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  CGRect v119 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_77B400();
  uint64_t v120 = *(void *)(v121 - 8);
  __chkstk_darwin(v121);
  CGRect v118 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_77B3F0();
  uint64_t v8 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v108 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_77B3B0();
  uint64_t v10 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  CGRect v113 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_77B3C0();
  uint64_t v129 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  uint64_t v13 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_77B360();
  uint64_t v128 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  CGRect v114 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_777AD0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = a1;
  unint64_t v19 = sub_2D324();
  if (qword_94F0A0 != -1) {
    swift_once();
  }
  uint64_t v100 = sub_77AC40();
  sub_FDF4(v100, (uint64_t)qword_9B30A0);
  id v125 = a2;
  id v20 = [a2 traitCollection];
  unint64_t v102 = v19;
  sub_77E1E0();

  uint64_t v21 = sub_77A0E0();
  uint64_t v139 = v21;
  uint64_t v99 = sub_754AAC((unint64_t *)&qword_951920, (void (*)(uint64_t))&type metadata accessor for Feature);
  uint64_t v140 = v99;
  uint64_t v22 = sub_FBE0(&v138);
  uint64_t v23 = *(void *)(v21 - 8);
  unint64_t v24 = *(void (**)(void))(v23 + 104);
  unsigned int v98 = enum case for Feature.measurement_with_labelplaceholder(_:);
  uint64_t v101 = v21;
  uint64_t v97 = (void (*)(uint64_t *, void, uint64_t))v24;
  uint64_t v96 = v23 + 104;
  v24(v22);
  sub_76C280();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v138);
  sub_777AC0();
  sub_777AA0();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v105 = v18;
  uint64_t v107 = v15;
  uint64_t v106 = v16 + 8;
  CGFloat v95 = v25;
  v25(v18, v15);
  sub_FD50(&qword_950E18);
  uint64_t v26 = *(void *)(v8 + 72);
  uint64_t v109 = v8;
  unint64_t v27 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v104 = v26;
  uint64_t v28 = swift_allocObject();
  long long v124 = xmmword_78DBA0;
  *(_OWORD *)(v28 + 16) = xmmword_78DBA0;
  uint64_t v117 = v28;
  unint64_t v103 = v27;
  unint64_t v112 = v28 + v27;
  uint64_t v30 = v139;
  uint64_t v29 = v140;
  uint64_t v31 = sub_FB9C(&v138, v139);
  uint64_t v136 = v30;
  uint64_t v137 = *(void *)(v29 + 8);
  uint64_t v32 = sub_FBE0(&v135);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v32, v31, v30);
  uint64_t v33 = v126;
  CGRect v111 = (void (*)(char *, uint64_t))(v126 + 16);
  v133 = &type metadata for Double;
  v134 = &protocol witness table for Double;
  uint64_t v132 = 0;
  uint64_t v34 = v128;
  uint64_t v35 = *(void (**)(void))(v128 + 104);
  uint64_t v36 = v114;
  unsigned int v93 = enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:);
  uint64_t v94 = v128 + 104;
  uint64_t v92 = (void (*)(char *, void, uint64_t))v35;
  v35(v114);
  uint64_t v37 = v129;
  uint64_t v38 = *(void (**)(void))(v129 + 104);
  unsigned int v90 = enum case for VerticalFlowLayout.HorizontalPlacement.center(_:);
  uint64_t v39 = v115;
  uint64_t v91 = v129 + 104;
  uint64_t v89 = (void (*)(char *, void, uint64_t))v38;
  v38(v13);
  uint64_t v40 = sub_FD50((uint64_t *)&unk_974FC0);
  uint64_t v41 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v42 = (v41 + 32) & ~v41;
  uint64_t v43 = v42 + *(void *)(v10 + 72);
  uint64_t v87 = v40;
  uint64_t v86 = v43;
  uint64_t v85 = v41 | 7;
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v124;
  uint64_t v88 = v42;
  sub_77B380();
  v131[0] = v44;
  uint64_t v45 = v13;
  uint64_t v46 = sub_754AAC(&qword_950E08, (void (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition);
  uint64_t v47 = sub_FD50((uint64_t *)&unk_974FD0);
  unint64_t v48 = sub_22E20();
  uint64_t v49 = v113;
  uint64_t v83 = v47;
  unint64_t v82 = v48;
  uint64_t v50 = v116;
  uint64_t v84 = v46;
  sub_77E880();
  sub_77B3E0();
  uint64_t v51 = *(void (**)(char *, uint64_t))(v10 + 8);
  unint64_t v112 = v10 + 8;
  CGRect v111 = v51;
  v51(v49, v50);
  CGFloat v52 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v53 = v39;
  uint64_t v129 = v37 + 8;
  double v81 = v52;
  v52(v45, v39);
  unint64_t v55 = *(void (**)(char *, uint64_t))(v34 + 8);
  uint64_t v54 = v34 + 8;
  uint64_t v56 = v127;
  double v80 = v55;
  v55(v36, v127);
  sub_3A6E8((uint64_t)&v132);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v135);
  if (*(unsigned char *)(v33 + 176) == 1)
  {
    uint64_t v57 = v50;
    uint64_t v58 = v54;
    uint64_t v59 = v56;
    double v60 = v36;
    uint64_t v128 = v58;
    uint64_t v61 = v45;
    if (qword_94F0A8 != -1) {
      swift_once();
    }
    sub_FDF4(v100, (uint64_t)qword_9B30B8);
    id v62 = [v125 traitCollection];
    sub_77E1E0();

    uint64_t v63 = v101;
    uint64_t v136 = v101;
    uint64_t v137 = v99;
    double v64 = sub_FBE0(&v135);
    v97(v64, v98, v63);
    sub_76C280();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v135);
    double v65 = v105;
    sub_777AC0();
    sub_777AA0();
    v95(v65, v107);
    uint64_t v66 = v136;
    uint64_t v67 = v137;
    unsigned int v68 = sub_FB9C(&v135, v136);
    v133 = (void *)v66;
    v134 = *(void **)(v67 + 8);
    uint64_t v69 = sub_FBE0(&v132);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v66 - 8) + 16))(v69, v68, v66);
    uint64_t v33 = v126;
    v131[4] = &protocol witness table for Double;
    v131[3] = &type metadata for Double;
    v131[0] = 0;
    v92(v60, v93, v59);
    v89(v61, v90, v53);
    uint64_t v70 = swift_allocObject();
    *(_OWORD *)(v70 + 16) = v124;
    sub_77B380();
    uint64_t v130 = v70;
    unsigned int v71 = v49;
    sub_77E880();
    uint64_t v72 = v108;
    sub_77B3E0();
    v111(v71, v57);
    v81(v61, v53);
    v80(v60, v59);
    sub_3A6E8((uint64_t)v131);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v132);
    uint64_t v73 = v117;
    unint64_t v75 = *(void *)(v117 + 16);
    unint64_t v74 = *(void *)(v117 + 24);
    if (v75 >= v74 >> 1) {
      uint64_t v73 = sub_85710(v74 > 1, v75 + 1, 1, v117);
    }
    *(void *)(v73 + 16) = v75 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v109 + 32))(v73 + v103 + v75 * v104, v72, v110);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v135);
  }
  uint64_t v76 = v118;
  sub_77B3D0();
  uint64_t v77 = v121;
  sub_77AB10();
  sub_FB9C((void *)(v33 + 96), *(void *)(v33 + 120));
  long long v78 = v119;
  sub_390CC();
  sub_77AC70();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v78, v123);
  (*(void (**)(char *, uint64_t))(v120 + 8))(v76, v77);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v138);
  return a3;
}

unint64_t sub_754168()
{
  unint64_t result = qword_978B80;
  if (!qword_978B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978B80);
  }
  return result;
}

uint64_t destroy for LargeGameCenterPlayerLayout(uint64_t a1)
{
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 16);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 56);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 96);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 136);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 184);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 224);

  return _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 264);
}

uint64_t initializeWithCopy for LargeGameCenterPlayerLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  long long v8 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 184, a2 + 184);
  long long v9 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 224, a2 + 224);
  long long v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 264, a2 + 264);
  return a1;
}

uint64_t assignWithCopy for LargeGameCenterPlayerLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_39ED0((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  sub_39ED0((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  sub_39ED0((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  sub_39ED0((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  sub_39ED0((uint64_t *)(a1 + 184), (uint64_t *)(a2 + 184));
  sub_39ED0((uint64_t *)(a1 + 224), (uint64_t *)(a2 + 224));
  sub_39ED0((uint64_t *)(a1 + 264), (uint64_t *)(a2 + 264));
  return a1;
}

uint64_t assignWithTake for LargeGameCenterPlayerLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 224);
  long long v6 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v6;
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 264);
  long long v7 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v7;
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  return a1;
}

uint64_t getEnumTagSinglePayload for LargeGameCenterPlayerLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 304)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LargeGameCenterPlayerLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 304) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 304) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LargeGameCenterPlayerLayout()
{
  return &type metadata for LargeGameCenterPlayerLayout;
}

uint64_t destroy for LargeGameCenterPlayerLayout.Metrics(uint64_t a1)
{
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 16);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 56);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 96);

  return _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 136);
}

uint64_t initializeWithCopy for LargeGameCenterPlayerLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  return a1;
}

uint64_t assignWithCopy for LargeGameCenterPlayerLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_39ED0((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  sub_39ED0((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  sub_39ED0((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  sub_39ED0((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  return a1;
}

__n128 initializeWithTake for LargeGameCenterPlayerLayout.Metrics(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(unsigned char *)(a1 + 176) = *((unsigned char *)a2 + 176);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for LargeGameCenterPlayerLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  return a1;
}

uint64_t getEnumTagSinglePayload for LargeGameCenterPlayerLayout.Metrics(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 177)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LargeGameCenterPlayerLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 176) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 177) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 177) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LargeGameCenterPlayerLayout.Metrics()
{
  return &type metadata for LargeGameCenterPlayerLayout.Metrics;
}

uint64_t sub_754AAC(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_754AF4()
{
  uint64_t v1 = v0;
  v17.receiver = v0;
  v17.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v17, "prepareForReuse");
  *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artwork] = 0;
  swift_release();
  id v2 = *(id *)&v0[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artworkView];
  sub_76E280();

  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer];
  uint64_t v4 = OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer;
  long long v5 = *(char **)(v3 + OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer);
  long long v6 = *(void **)&v5[OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents];
  *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents] = 0;
  long long v7 = v5;
  sub_1EE36C(v6);

  sub_1ED68C();
  long long v8 = *(char **)(v3 + v4);
  long long v9 = *(void **)&v8[OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents];
  *(void *)&v8[OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents] = 0;
  long long v10 = v8;
  sub_1EE36C(v9);

  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_video] = 0;
  swift_release();
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeaderView];
  if (v11)
  {
    id v12 = v11;
    sub_76E280();
  }
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeadingArtwork] = 0;
  swift_release();
  uint64_t v13 = &v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  swift_bridgeObjectRelease();
  sub_754E04();
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView];
  [v14 setHidden:1];
  [v14 setText:0];
  uint64_t v15 = &v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerText];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  swift_bridgeObjectRelease();
  return sub_754F88();
}

uint64_t sub_754CAC()
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(v0
                                        + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer)
                            + OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer)
                + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents);
  if (!v1) {
    return 0;
  }
  type metadata accessor for VideoView();
  uint64_t v2 = swift_dynamicCastClass();
  if (v2) {
    id v3 = v1;
  }
  return v2;
}

uint64_t sub_754D1C()
{
  return sub_7727C0();
}

id sub_754DC8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artworkView);
}

double sub_754DD8()
{
  [v0 bounds];
  return v1;
}

void sub_754E04()
{
  double v1 = *(void **)&v0[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView];
  id v2 = [v1 text];
  if (!v2)
  {
    long long v8 = &v0[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle + 8];
    uint64_t v7 = *(void *)v8;
LABEL_11:
    if (!v7) {
      return;
    }
LABEL_12:
    if (*(void *)v8)
    {
LABEL_13:
      swift_bridgeObjectRetain();
      NSString v11 = sub_77D640();
      swift_bridgeObjectRelease();
LABEL_17:
      [v1 setText:v11];

      [v0 setNeedsLayout];
      return;
    }
LABEL_16:
    NSString v11 = 0;
    goto LABEL_17;
  }
  id v3 = v2;
  uint64_t v4 = sub_77D670();
  uint64_t v6 = v5;

  long long v8 = &v0[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle + 8];
  uint64_t v7 = *(void *)v8;
  if (!v6) {
    goto LABEL_11;
  }
  if (!v7)
  {
    swift_bridgeObjectRelease();
    if (*(void *)v8) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  if (v4 != *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle]
    || v7 != v6)
  {
    char v10 = sub_77EC30();
    swift_bridgeObjectRelease();
    if (v10) {
      return;
    }
    goto LABEL_12;
  }

  swift_bridgeObjectRelease();
}

id sub_754F88()
{
  double v1 = v0;
  uint64_t v2 = sub_775840();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_FD50((uint64_t *)&unk_94FFC0);
  *(void *)&double v7 = __chkstk_darwin(v6 - 8).n128_u64[0];
  long long v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerText + 8])
  {
    uint64_t v10 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel;
    NSString v11 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel];
    id v12 = (SEL *)&unk_91F000;
    if (v11)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v14 = qword_94EE30;
      swift_bridgeObjectRetain();
      if (v14 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_77AC40();
      uint64_t v16 = sub_FDF4(v15, (uint64_t)qword_9B2950);
      uint64_t v17 = *(void *)(v15 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v9, v16, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v15);
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for DirectionalTextAlignment.none(_:), v2);
      id v18 = objc_allocWithZone((Class)sub_770A00());
      unint64_t v19 = (void *)sub_7709F0();
      NSString v20 = sub_77D640();
      [v19 setText:v20];

      uint64_t v21 = qword_94E168;
      id v22 = v19;
      if (v21 != -1) {
        swift_once();
      }
      [v22 setTextColor:qword_9B09E8];

      [v22 setTextAlignment:1];
      [v22 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];
      id v23 = v22;
      sub_756B44(v22);

      id v12 = (SEL *)&unk_91F000;
      id v24 = [v1 contentView];
      [v24 addSubview:v23];

      NSString v11 = *(void **)&v1[v10];
      if (!v11) {
        goto LABEL_17;
      }
    }
    id v25 = [v11 layer];
    id v26 = [v1 v12[367]];
    [v26 overrideUserInterfaceStyle];

    sub_77D670();
    NSString v27 = sub_77D640();
    swift_bridgeObjectRelease();
    [v25 setCompositingFilter:v27];

    uint64_t v28 = *(void **)&v1[v10];
    if (v28)
    {
      id v29 = v28;
      NSString v30 = sub_77D640();
      swift_bridgeObjectRelease();
      [v29 setText:v30];

      id result = *(id *)&v1[v10];
      if (!result) {
        return result;
      }
      return [result setHidden:0];
    }
LABEL_17:
    swift_bridgeObjectRelease();
    id result = *(id *)&v1[v10];
    if (!result) {
      return result;
    }
    return [result setHidden:0];
  }
  id result = *(id *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel];
  if (result)
  {
    return objc_msgSend(result, "setHidden:", 1, v7);
  }
  return result;
}

void (*sub_755434(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer);
  uint64_t v4 = OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer;
  a1[1] = v3;
  a1[2] = v4;
  uint64_t v5 = *(void **)(*(void *)(v3 + v4)
                + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents);
  if (v5)
  {
    type metadata accessor for VideoView();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6) {
      id v7 = v5;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  return sub_1EDAF8;
}

char *sub_7554D0(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = sub_77D040();
  uint64_t v79 = *(void *)(v10 - 8);
  uint64_t v80 = v10;
  __chkstk_darwin(v10);
  long long v78 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_775840();
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v76 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_FD50((uint64_t *)&unk_94FFC0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_76F0B0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_FD50((uint64_t *)&unk_9610B0);
  __chkstk_darwin(v20 - 8);
  id v22 = (char *)&v73 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v23 = &v5[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_itemLayoutContext];
  uint64_t v24 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  id v25 = &v5[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle];
  *(void *)id v25 = 0;
  *((void *)v25 + 1) = 0;
  id v26 = &v5[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerText];
  *(void *)id v26 = 0;
  *((void *)v26 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_video] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeadingArtwork] = 0;
  *(void *)&v5[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artwork] = 0;
  uint64_t v27 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView;
  uint64_t v28 = enum case for Wordmark.arcade(_:);
  uint64_t v29 = sub_77A490();
  uint64_t v30 = *(void *)(v29 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 104))(v22, v28, v29);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v22, 0, 1, v29);
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, enum case for WordmarkView.Alignment.leading(_:), v16);
  *((void *)&v85 + 1) = &type metadata for Double;
  uint64_t v86 = &protocol witness table for Double;
  *(void *)&long long v84 = 0x4028000000000000;
  objc_allocWithZone((Class)sub_76F0D0());
  uint64_t v31 = v5;
  *(void *)&v5[v27] = sub_76F0A0();
  *(void *)&v31[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeaderView] = 0;
  uint64_t v32 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView;
  if (qword_94EE28 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_77AC40();
  uint64_t v34 = sub_FDF4(v33, (uint64_t)qword_9B2938);
  uint64_t v35 = *(void *)(v33 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v15, v34, v33);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v15, 0, 1, v33);
  (*(void (**)(char *, void, uint64_t))(v74 + 104))(v76, enum case for DirectionalTextAlignment.none(_:), v75);
  id v36 = objc_allocWithZone((Class)sub_770A00());
  *(void *)&v31[v32] = sub_7709F0();
  uint64_t v37 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_offerButton;
  type metadata accessor for OfferButton();
  *(void *)&v31[v37] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v38 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artworkView;
  sub_76E300();
  *(void *)&v31[v38] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)&v31[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel] = 0;
  uint64_t v39 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_gradientView;
  *(void *)&v31[v39] = [objc_allocWithZone((Class)type metadata accessor for GradientView()) init];
  uint64_t v40 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer;
  id v41 = objc_allocWithZone((Class)type metadata accessor for MediaView());
  *(void *)&v31[v40] = sub_1ED548(0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

  v83.receiver = v31;
  v83.super_class = ObjectType;
  uint64_t v42 = (char *)objc_msgSendSuper2(&v83, "initWithFrame:", a1, a2, a3, a4);
  id v43 = [v42 contentView];
  objc_msgSend(v43, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  id v44 = [v42 contentView];
  [v44 _setCornerRadius:5.0];

  id v45 = [v42 contentView];
  [v45 setClipsToBounds:1];

  id v46 = [v42 contentView];
  sub_FE2C(0, (unint64_t *)&qword_94FFD0);
  uint64_t v47 = (void *)sub_77E380();
  [v46 setBackgroundColor:v47];

  id v48 = [v42 contentView];
  id v49 = [v48 layer];

  [v49 setAllowsGroupBlending:0];
  uint64_t v50 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_gradientView;
  uint64_t v51 = *(void **)&v42[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_gradientView];
  sub_FD50(&qword_951820);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_78DB90;
  id v53 = objc_allocWithZone((Class)UIColor);
  uint64_t v54 = v51;
  *(void *)(v52 + 32) = [v53 initWithWhite:0.0 alpha:0.0];
  *(void *)(v52 + 40) = [objc_allocWithZone((Class)UIColor) initWithWhite:0.0 alpha:0.15];
  *(void *)&long long v84 = v52;
  sub_77D8A0();
  *(void *)&v54[OBJC_IVAR____TtC18ASMessagesProvider12GradientView_colors] = v84;
  swift_bridgeObjectRelease();
  sub_4B29E8();

  id v55 = [v42 contentView];
  [v55 addSubview:*(void *)&v42[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer]];

  id v56 = [v42 contentView];
  [v56 addSubview:*(void *)&v42[v50]];

  id v57 = [v42 contentView];
  [v57 addSubview:*(void *)&v42[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_offerButton]];

  uint64_t v58 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView;
  id v59 = *(id *)&v42[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView];
  double v60 = (void *)sub_77E310();
  [v59 setTextColor:v60];

  uint64_t v61 = *(void **)&v42[v58];
  [v61 setTextAlignment:1];
  [v61 setHidden:1];
  id v62 = [v42 contentView];
  [v62 addSubview:v61];

  uint64_t v63 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView;
  id v64 = *(id *)&v42[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView];
  double v65 = (void *)sub_77E310();
  [v64 setTintColor:v65];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v66 = v78;
  sub_77CFF0();
  sub_14C88((uint64_t)&v81, (uint64_t *)&unk_951B40);
  sub_14C88((uint64_t)&v84, (uint64_t *)&unk_951B40);
  sub_77E240();
  uint64_t v67 = v80;
  unsigned int v68 = *(void (**)(char *, uint64_t))(v79 + 8);
  v68(v66, v80);
  id v69 = [v42 contentView];
  [v69 addSubview:*(void *)&v42[v63]];

  uint64_t v70 = *(void **)&v42[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artworkView];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v71 = v70;
  sub_77CFF0();
  sub_14C88((uint64_t)&v81, (uint64_t *)&unk_951B40);
  sub_14C88((uint64_t)&v84, (uint64_t *)&unk_951B40);
  sub_77E240();

  v68(v66, v67);
  return v42;
}

uint64_t sub_755FB4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_77AA60();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_7727D0();
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_7727F0();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  *(void *)&double v9 = __chkstk_darwin(v8).n128_u64[0];
  uint64_t v35 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59.receiver = v1;
  v59.super_class = ObjectType;
  objc_msgSendSuper2(&v59, "layoutSubviews", v9);
  [v1 bounds];
  v31[1] = v7;
  sub_754D1C();
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_gradientView];
  uint64_t v57 = type metadata accessor for GradientView();
  uint64_t v58 = &protocol witness table for UIView;
  v31[0] = v11;
  id v56 = v11;
  uint64_t v12 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer];
  uint64_t v54 = type metadata accessor for MediaView();
  id v55 = &protocol witness table for UIView;
  id v53 = v12;
  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView];
  uint64_t v51 = sub_76F0D0();
  uint64_t v52 = &protocol witness table for UIView;
  uint64_t v50 = v13;
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeaderView];
  if (v14)
  {
    *((void *)&v48 + 1) = sub_76E300();
    id v49 = &protocol witness table for UIView;
    *(void *)&long long v47 = v14;
  }
  else
  {
    id v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
  }
  uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView];
  uint64_t v16 = sub_770A00();
  uint64_t v45 = v16;
  id v46 = &protocol witness table for UILabel;
  id v44 = v15;
  uint64_t v17 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_offerButton];
  uint64_t v42 = type metadata accessor for OfferButton();
  id v43 = &protocol witness table for UIView;
  id v41 = v17;
  uint64_t v18 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel];
  if (v18)
  {
    *((void *)&v39 + 1) = v16;
    uint64_t v40 = &protocol witness table for UIView;
    *(void *)&long long v38 = v18;
  }
  else
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
  }
  id v19 = v14;
  id v20 = v15;
  id v21 = v17;
  id v22 = v18;
  v31[0];
  id v23 = v12;
  id v24 = v13;
  id v25 = v35;
  sub_7727E0();
  id v26 = [v1 contentView];
  [v26 bounds];

  uint64_t v27 = v32;
  sub_7727A0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v27, v34);
  sub_FD50(&qword_953D40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_78FEE0;
  [v1 bounds];
  CGFloat v29 = CGRectGetHeight(v60) + -88.0;
  [v1 bounds];
  *(CGFloat *)(inited + 32) = v29 / CGRectGetHeight(v61);
  *(void *)(inited + 40) = 0x3FF0000000000000;
  sub_4B283C(inited);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v25, v37);
}

uint64_t sub_756460(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer);
  id v3 = [a1 superview];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer);
  sub_FE2C(0, (unint64_t *)&qword_94FFE0);
  id v6 = v5;
  id v7 = v4;
  char v8 = sub_77E510();

  return v8 & 1;
}

uint64_t sub_7566E8()
{
  return type metadata accessor for PosterLockupCollectionViewCell();
}

uint64_t type metadata accessor for PosterLockupCollectionViewCell()
{
  uint64_t result = qword_978BC8;
  if (!qword_978BC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_75673C()
{
  sub_22A20();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_756804(void *a1)
{
  id v2 = objc_retain(*(id *)(*(void *)(v1
                                     + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer)
                         + OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer));
  sub_1EEC54(a1);
}

uint64_t (*sub_75686C(uint64_t **a1))()
{
  id v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_755434(v2);
  return sub_25CF0;
}

uint64_t sub_7568C4()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = sub_756CA0(&qword_978BE8, (void (*)(uint64_t))type metadata accessor for PosterLockupCollectionViewCell);

  return VideoViewProviding.someVideoView.getter(ObjectType, v1);
}

uint64_t sub_756938(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_756CA0(&qword_978BE8, (void (*)(uint64_t))type metadata accessor for PosterLockupCollectionViewCell);

  return VideoViewProviding.someVideoView.setter(a1, a2, ObjectType, v5);
}

uint64_t (*sub_7569C4(void *a1))()
{
  swift_getObjectType();
  id v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_756CA0(&qword_978BE8, (void (*)(uint64_t))type metadata accessor for PosterLockupCollectionViewCell);
  v2[4] = sub_772B60();
  return sub_25CF0;
}

uint64_t sub_756A6C()
{
  return sub_756CA0(&qword_978BD8, (void (*)(uint64_t))type metadata accessor for PosterLockupCollectionViewCell);
}

uint64_t sub_756AB4()
{
  return sub_756CA0(&qword_978BE0, (void (*)(uint64_t))type metadata accessor for PosterLockupCollectionViewCell);
}

uint64_t sub_756AFC()
{
  return sub_756CA0(&qword_951280, (void (*)(uint64_t))type metadata accessor for VideoView);
}

void sub_756B44(void *a1)
{
  uint64_t v3 = sub_77D040();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel;
  char v8 = *(void **)(v1 + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel);
  *(void *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel) = a1;
  id v9 = a1;

  uint64_t v10 = *(void **)(v1 + v7);
  if (v10)
  {
    memset(v13, 0, sizeof(v13));
    memset(v12, 0, sizeof(v12));
    id v11 = v10;
    sub_77CFF0();
    sub_14C88((uint64_t)v12, (uint64_t *)&unk_951B40);
    sub_14C88((uint64_t)v13, (uint64_t *)&unk_951B40);
    sub_77E240();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_756CA0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_756CE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_775840();
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  __chkstk_darwin(v2);
  uint64_t v35 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_FD50((uint64_t *)&unk_94FFC0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_76F0B0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_FD50((uint64_t *)&unk_9610B0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = &v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_itemLayoutContext];
  uint64_t v15 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = &v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitle];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  uint64_t v17 = &v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerText];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_video] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeadingArtwork] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artwork] = 0;
  uint64_t v18 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_headingView;
  uint64_t v19 = enum case for Wordmark.arcade(_:);
  uint64_t v20 = sub_77A490();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 104))(v13, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v13, 0, 1, v20);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for WordmarkView.Alignment.leading(_:), v7);
  uint64_t v37 = &type metadata for Double;
  long long v38 = &protocol witness table for Double;
  uint64_t v36 = 0x4028000000000000;
  id v22 = objc_allocWithZone((Class)sub_76F0D0());
  *(void *)&v1[v18] = sub_76F0A0();
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_epicHeaderView] = 0;
  uint64_t v23 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_fallbackTitleView;
  if (qword_94EE28 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_77AC40();
  uint64_t v25 = sub_FDF4(v24, (uint64_t)qword_9B2938);
  uint64_t v26 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v6, v25, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v6, 0, 1, v24);
  (*(void (**)(char *, void, uint64_t))(v33 + 104))(v35, enum case for DirectionalTextAlignment.none(_:), v34);
  id v27 = objc_allocWithZone((Class)sub_770A00());
  *(void *)&v1[v23] = sub_7709F0();
  uint64_t v28 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_offerButton;
  type metadata accessor for OfferButton();
  *(void *)&v1[v28] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v29 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_artworkView;
  sub_76E300();
  *(void *)&v1[v29] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_footerLabel] = 0;
  uint64_t v30 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_gradientView;
  *(void *)&v1[v30] = [objc_allocWithZone((Class)type metadata accessor for GradientView()) init];
  uint64_t v31 = OBJC_IVAR____TtC18ASMessagesProvider30PosterLockupCollectionViewCell_mediaViewContainer;
  id v32 = objc_allocWithZone((Class)type metadata accessor for MediaView());
  *(void *)&v1[v31] = sub_1ED548(0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

  sub_77EB20();
  __break(1u);
}

BOOL sub_757250(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(double *)(a1 + 24) == *(double *)(a2 + 24)
      && *(double *)(a1 + 32) == *(double *)(a2 + 32);
}

uint64_t sub_757298()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_76C1E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C150();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    type metadata accessor for InteractiveProductReviewsShelfHeaderView();
    sub_77DFC0();
    NSString v8 = sub_77D640();
    swift_bridgeObjectRelease();
    Class isa = sub_76C0E0().super.isa;
    id v10 = [v7 _visibleSupplementaryViewOfKind:v8 atIndexPath:isa];

    if (v10)
    {
      uint64_t v11 = (char *)swift_dynamicCastClass();
      if (v11)
      {
        uint64_t v12 = v1 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState;
        if ((*(unsigned char *)(v1
                       + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState
                       + 40) & 1) == 0)
        {
          float64_t v13 = *(double *)v12;
          float64_t v14 = *(double *)(v12 + 8);
          uint64_t v15 = *(void *)(v12 + 16);
          float64x2_t v16 = *(float64x2_t *)(v12 + 24);
          uint64_t v17 = &v11[OBJC_IVAR____TtC18ASMessagesProvider40InteractiveProductReviewsShelfHeaderView_currentState];
          if ((v11[OBJC_IVAR____TtC18ASMessagesProvider40InteractiveProductReviewsShelfHeaderView_currentState + 40] & 1) != 0
            || (v18.f64[0] = v14,
                v18.f64[1] = v13,
                (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8(*(int8x16_t *)v17, *(int8x16_t *)v17, 8uLL), v18), (int32x4_t)vceqq_f64(*(float64x2_t *)(v17 + 24), v16))), 0xFuLL))) & 1) == 0)|| *((void *)v17 + 2) != v15)
          {
            *(float64_t *)uint64_t v17 = v13;
            *((float64_t *)v17 + 1) = v14;
            *((void *)v17 + 2) = v15;
            *(float64x2_t *)(v17 + 24) = v16;
            v17[40] = 0;
            [v11 setNeedsLayout];
          }
        }
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_7574B0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_shelfLayoutContext;
  uint64_t v2 = sub_7729C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_unknownObjectWeakDestroy();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_757570()
{
  return type metadata accessor for InteractiveProductReviewsShelfScrollObserver();
}

uint64_t type metadata accessor for InteractiveProductReviewsShelfScrollObserver()
{
  uint64_t result = qword_978C28;
  if (!qword_978C28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_7575C4()
{
  uint64_t result = sub_7729C0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for InteractiveProductReviewsShelfScrollObserver.State(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for InteractiveProductReviewsShelfScrollObserver.State(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InteractiveProductReviewsShelfScrollObserver.State()
{
  return &type metadata for InteractiveProductReviewsShelfScrollObserver.State;
}

unint64_t sub_7576E0()
{
  unint64_t result = qword_978D28;
  if (!qword_978D28)
  {
    type metadata accessor for InteractiveProductReviewsShelfScrollObserver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978D28);
  }
  return result;
}

uint64_t sub_757738(unint64_t a1, double a2, double a3)
{
  uint64_t v7 = sub_77A3E0();
  uint64_t v53 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v50 = (char *)&v46 - v11;
  uint64_t v12 = sub_7729C0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v49 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v46 - v16;
  long long v48 = (void (*)(char *, uint64_t, uint64_t))sub_76C1E0();
  uint64_t v18 = *((void *)v48 - 1);
  __chkstk_darwin(v48);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_77EB40();
    uint64_t v21 = result;
  }
  else
  {
    uint64_t v21 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v51 = v13;
  uint64_t v52 = v9;
  uint64_t v54 = v3;
  if (v21)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v23 = (void *)sub_77EA30();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
      {
        __break(1u);
        return result;
      }
      uint64_t v23 = *(void **)(a1 + 32);
      swift_unknownObjectRetain();
    }
    uint64_t v24 = v12;
    swift_bridgeObjectRelease();
    id v25 = [v23 indexPath];
    swift_unknownObjectRelease();
    sub_76C120();

    uint64_t v47 = sub_76C170();
    (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v18 + 8))(v20, v48);
  }
  else
  {
    uint64_t v24 = v12;
    swift_bridgeObjectRelease();
    uint64_t v47 = 0;
  }
  uint64_t v26 = v54 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_shelfLayoutContext;
  uint64_t v27 = v51;
  long long v48 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  v48(v17, v54 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_shelfLayoutContext, v24);
  uint64_t v28 = v50;
  sub_772930();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v27 + 8);
  v29(v17, v24);
  sub_77A290();
  double v31 = v30;
  id v32 = *(void (**)(char *, uint64_t))(v53 + 8);
  v32(v28, v7);
  uint64_t v33 = v49;
  v48(v49, v26, v24);
  uint64_t v34 = v54;
  uint64_t v35 = v52;
  sub_772930();
  v29(v33, v24);
  sub_77A320();
  double v37 = v36;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v32)(v35, v7);
  double v55 = a2;
  double v56 = a3;
  uint64_t v38 = v47;
  uint64_t v57 = v47;
  double v58 = v31;
  double v59 = v37;
  uint64_t v39 = v34 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState;
  double v41 = *(double *)(v34 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState);
  double v40 = *(double *)(v34
                  + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState
                  + 8);
  uint64_t v42 = *(void *)(v34
                  + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState
                  + 16);
  double v44 = *(double *)(v34
                  + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState
                  + 24);
  double v43 = *(double *)(v34
                  + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState
                  + 32);
  char v45 = *(unsigned char *)(v34
                 + OBJC_IVAR____TtC18ASMessagesProvider44InteractiveProductReviewsShelfScrollObserver_currentState
                 + 40);
  *(double *)uint64_t v39 = a2;
  *(double *)(v39 + 8) = a3;
  *(void *)(v39 + 16) = v38;
  *(double *)(v39 + 24) = v31;
  *(double *)(v39 + 32) = v37;
  *(unsigned char *)(v39 + 40) = 0;
  if ((v45 & 1) != 0 || v41 != a2 || v40 != a3 || v38 != v42 || v31 != v44 || v37 != v43) {
    return sub_757298();
  }
  return result;
}

void destroy for TodayCardLabelsLayout(uint64_t a1)
{
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 64);
  if (*(void *)(a1 + 128)) {
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 104);
  }
  uint64_t v2 = *(void **)(a1 + 144);
}

uint64_t initializeWithCopy for TodayCardLabelsLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  uint64_t v5 = *(void **)(a2 + 48);
  id v6 = *(void **)(a2 + 56);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = a1 + 64;
  uint64_t v8 = a2 + 64;
  long long v9 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 88) = v9;
  uint64_t v10 = v9;
  uint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  id v12 = v5;
  id v13 = v6;
  v11(v7, v8, v10);
  uint64_t v14 = (_OWORD *)(a1 + 104);
  uint64_t v15 = (_OWORD *)(a2 + 104);
  uint64_t v16 = *(void *)(a2 + 128);
  if (v16)
  {
    uint64_t v17 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v16;
    *(void *)(a1 + 136) = v17;
    (**(void (***)(_OWORD *, _OWORD *))(v16 - 8))(v14, v15);
  }
  else
  {
    long long v18 = *(_OWORD *)(a2 + 120);
    _OWORD *v14 = *v15;
    *(_OWORD *)(a1 + 120) = v18;
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
  }
  uint64_t v19 = *(void **)(a2 + 144);
  *(void *)(a1 + 144) = v19;
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  id v20 = v19;
  return a1;
}

uint64_t assignWithCopy for TodayCardLabelsLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void **)(a2 + 48);
  id v6 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v5;
  id v7 = v5;

  uint64_t v8 = *(void **)(a2 + 56);
  long long v9 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v8;
  id v10 = v8;

  sub_39ED0((uint64_t *)(a1 + 64), (uint64_t *)(a2 + 64));
  uint64_t v11 = *(void *)(a2 + 128);
  if (!*(void *)(a1 + 128))
  {
    if (v11)
    {
      *(void *)(a1 + 128) = v11;
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 104, a2 + 104);
      goto LABEL_8;
    }
LABEL_7:
    long long v12 = *(_OWORD *)(a2 + 104);
    long long v13 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(_OWORD *)(a1 + 104) = v12;
    *(_OWORD *)(a1 + 120) = v13;
    goto LABEL_8;
  }
  if (!v11)
  {
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 104);
    goto LABEL_7;
  }
  sub_39ED0((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
LABEL_8:
  uint64_t v14 = *(void **)(a2 + 144);
  uint64_t v15 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = v14;
  id v16 = v14;

  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  return a1;
}

__n128 initializeWithTake for TodayCardLabelsLayout(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 137) = *(_OWORD *)(a2 + 137);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for TodayCardLabelsLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  id v6 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 64);
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  if (*(void *)(a1 + 128)) {
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(a1 + 104);
  }
  long long v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v8;
  uint64_t v9 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  id v10 = *(void **)(a1 + 144);
  *(void *)(a1 + 144) = v9;

  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  return a1;
}

uint64_t getEnumTagSinglePayload for TodayCardLabelsLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 153)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TodayCardLabelsLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 152) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 153) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 153) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TodayCardLabelsLayout()
{
  return &type metadata for TodayCardLabelsLayout;
}

uint64_t getEnumTagSinglePayload for TodayCardLabelsLayout.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TodayCardLabelsLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TodayCardLabelsLayout.Metrics()
{
  return &type metadata for TodayCardLabelsLayout.Metrics;
}

void *sub_75805C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v5 = v4;
  uint64_t v115 = a1;
  uint64_t v120 = a2;
  uint64_t v122 = sub_77AEC0();
  uint64_t v8 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  id v10 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v116 = (char *)&v112 - v12;
  __chkstk_darwin(v13);
  uint64_t v117 = (char *)&v112 - v14;
  uint64_t v127 = sub_77B870();
  uint64_t v130 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  CGRect v119 = (double (**)(double))((char *)&v112 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v16);
  uint64_t v129 = (char *)&v112 - v17;
  __chkstk_darwin(v18);
  uint64_t v128 = (char *)&v112 - v19;
  __chkstk_darwin(v20);
  uint64_t v123 = (char *)&v112 - v21;
  __chkstk_darwin(v22);
  uint64_t v24 = (double *)((char *)&v112 - v23);
  uint64_t v131 = sub_77B880();
  uint64_t v124 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  CGRect v118 = (char *)&v112 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&double v27 = __chkstk_darwin(v26).n128_u64[0];
  id v125 = (char *)&v112 - v28;
  unsigned int v29 = objc_msgSend(*(id *)(*(void *)(v4 + 144)+ OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_label), "hasContent", v27);
  sub_75912C(v5, (uint64_t)v151);
  if (v29)
  {
    unsigned __int8 v30 = [v151[18] isHidden];
    sub_390C7C((uint64_t)v151);
    sub_75912C(v5, (uint64_t)v150);
    if (v30) {
      unsigned int v126 = 1;
    }
    else {
      unsigned int v126 = [*(id *)(v150[18] + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_label) isHidden];
    }
  }
  else
  {
    sub_390C7C((uint64_t)v151);
    sub_75912C(v5, (uint64_t)v150);
    unsigned int v126 = 1;
  }
  sub_390C7C((uint64_t)v150);
  unsigned int v31 = [*(id *)(*(void *)(v5 + 48)+ OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_label) hasContent];
  sub_75912C(v5, (uint64_t)v149);
  if (v31)
  {
    unsigned __int8 v32 = [*(id *)(v149[6] + OBJC_IVAR____TtC18ASMessagesProvider27TodayTransitioningLabelView_label) isHidden];
    sub_390C7C((uint64_t)v149);
    sub_75912C(v5, (uint64_t)v148);
    if (v32) {
      unsigned int v33 = 1;
    }
    else {
      unsigned int v33 = [v148[6] isHidden];
    }
  }
  else
  {
    sub_390C7C((uint64_t)v149);
    sub_75912C(v5, (uint64_t)v148);
    unsigned int v33 = 1;
  }
  uint64_t v121 = v8;
  sub_390C7C((uint64_t)v148);
  sub_77108(v5 + 104, (uint64_t)&v136);
  uint64_t v34 = (void (**)(double *))(v130 + 104);
  uint64_t v35 = v123;
  if (*((void *)&v137 + 1))
  {
    sub_146C0(&v136, (uint64_t)v145);
    sub_FB9C(v145, v146);
    sub_77AB40();
    uint64_t v36 = *(void *)(v5 + 8);
    *((void *)v24 + 3) = &type metadata for CGFloat;
    *((void *)v24 + 4) = &protocol witness table for CGFloat;
    *(void *)uint64_t v24 = v36;
    uint64_t v37 = enum case for Resize.Rule.replaced(_:);
    uint64_t v38 = *v34;
    uint64_t v39 = v127;
    ((void (*)(double *, void, uint64_t))*v34)(v24, enum case for Resize.Rule.replaced(_:), v127);
    uint64_t v40 = *(void *)(v5 + 16);
    v35[3] = &type metadata for CGFloat;
    v35[4] = &protocol witness table for CGFloat;
    *uint64_t v35 = v40;
    ((void (*)(void *, uint64_t, uint64_t))v38)(v35, v37, v39);
    uint64_t v41 = enum case for Resize.Rule.unchanged(_:);
    ((void (*)(char *, void, uint64_t))v38)(v128, enum case for Resize.Rule.unchanged(_:), v39);
    ((void (*)(char *, uint64_t, uint64_t))v38)(v129, v41, v39);
    uint64_t v42 = v125;
    sub_77B890();
    double v43 = v116;
    sub_77AEA0();
    uint64_t v44 = v131;
    *((void *)&v137 + 1) = v131;
    *(void *)&long long v138 = &protocol witness table for Resize;
    char v45 = sub_FBE0((uint64_t *)&v136);
    uint64_t v46 = v124;
    (*(void (**)(uint64_t *, char *, uint64_t))(v124 + 16))(v45, v42, v44);
    uint64_t v47 = v117;
    sub_77AEB0();
    uint64_t v48 = v122;
    id v49 = *(void (**)(char *, uint64_t))(v121 + 8);
    v49(v43, v122);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v136);
    *(void *)&long long v136 = *(void *)(v5 + 144);
    type metadata accessor for TodayTransitioningLabelView();
    sub_77AB40();
    sub_75912C(v5, (uint64_t)&v136);
    uint64_t v50 = swift_allocObject();
    long long v51 = v143;
    *(_OWORD *)(v50 + 112) = v142;
    *(_OWORD *)(v50 + 128) = v51;
    *(_OWORD *)(v50 + 144) = v144[0];
    *(_OWORD *)(v50 + 153) = *(_OWORD *)((char *)v144 + 9);
    long long v52 = v139;
    *(_OWORD *)(v50 + 48) = v138;
    *(_OWORD *)(v50 + 64) = v52;
    long long v53 = v141;
    *(_OWORD *)(v50 + 80) = v140;
    *(_OWORD *)(v50 + 96) = v53;
    long long v54 = v137;
    *(_OWORD *)(v50 + 16) = v136;
    *(_OWORD *)(v50 + 32) = v54;
    *(unsigned char *)(v50 + 169) = v126;
    double v55 = v120;
    v120[3] = v48;
    v55[4] = (uint64_t)&protocol witness table for VerticalStack;
    sub_FBE0(v55);
    sub_77AEB0();
    swift_release();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v135);
    v49(v47, v48);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v125, v44);
    return (void *)_s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v145);
  }
  sub_796D8((uint64_t)&v136);
  CGRect v114 = v10;
  sub_77AEA0();
  *(void *)&long long v136 = *(void *)(v5 + 48);
  uint64_t v57 = type metadata accessor for TodayTransitioningLabelView();
  LODWORD(v117) = v33;
  id v125 = (char *)v57;
  sub_77AB40();
  *((void *)v24 + 3) = &type metadata for CGFloat;
  *((void *)v24 + 4) = &protocol witness table for CGFloat;
  *uint64_t v24 = a3;
  double v58 = *v34;
  LODWORD(v116) = enum case for Resize.Rule.replaced(_:);
  uint64_t v59 = v127;
  v58(v24);
  uint64_t v60 = enum case for Resize.Rule.unchanged(_:);
  ((void (*)(void *, void, uint64_t))v58)(v35, enum case for Resize.Rule.unchanged(_:), v59);
  ((void (*)(char *, uint64_t, uint64_t))v58)(v128, v60, v59);
  ((void (*)(char *, uint64_t, uint64_t))v58)(v129, v60, v59);
  *((void *)&v137 + 1) = v131;
  *(void *)&long long v138 = &protocol witness table for Resize;
  sub_FBE0((uint64_t *)&v136);
  sub_77B890();
  *(unsigned char *)(swift_allocObject() + 16) = (_BYTE)v117;
  sub_77AE60();
  uint64_t v61 = v59;
  swift_release();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v136);
  sub_75912C(v5, (uint64_t)&v136);
  id v62 = (_OWORD *)swift_allocObject();
  long long v63 = v143;
  v62[7] = v142;
  v62[8] = v63;
  v62[9] = v144[0];
  *(_OWORD *)((char *)v62 + 153) = *(_OWORD *)((char *)v144 + 9);
  long long v64 = v139;
  v62[3] = v138;
  v62[4] = v64;
  long long v65 = v141;
  v62[5] = v140;
  v62[6] = v65;
  long long v66 = v137;
  v62[1] = v136;
  v62[2] = v66;
  uint64_t v67 = v119;
  *CGRect v119 = sub_7591A8;
  v67[1] = (double (*)(double))v62;
  ((void (*)(double (**)(double), void, uint64_t))v58)(v67, enum case for Resize.Rule.recalculated(_:), v61);
  char v68 = v126 | ~*(unsigned char *)(v5 + 152);
  uint64_t v117 = (char *)v5;
  id v113 = *(id *)(v5 + 56);
  v145[0] = (uint64_t)v113;
  if (v68)
  {
    sub_77AB40();
    *((void *)v24 + 3) = &type metadata for CGFloat;
    *((void *)v24 + 4) = &protocol witness table for CGFloat;
    *uint64_t v24 = a3;
    ((void (*)(double *, void, uint64_t))v58)(v24, v116, v61);
    ((void (*)(void *, uint64_t, uint64_t))v58)(v35, v60, v61);
  }
  else
  {
    sub_77AB40();
    *((void *)v24 + 3) = &type metadata for CGFloat;
    *((void *)v24 + 4) = &protocol witness table for CGFloat;
    *uint64_t v24 = a3;
    ((void (*)(double *, void, uint64_t))v58)(v24, v116, v61);
    (*(void (**)(void *, double (**)(double), uint64_t))(v130 + 16))(v35, v67, v61);
  }
  ((void (*)(char *, uint64_t, uint64_t))v58)(v128, v60, v61);
  ((void (*)(char *, uint64_t, uint64_t))v58)(v129, v60, v61);
  id v69 = v118;
  sub_77B890();
  uint64_t v70 = v124;
  id v71 = v117;
  uint64_t v72 = v131;
  if (v117[40])
  {
    uint64_t v146 = v131;
    v147 = &protocol witness table for Resize;
    uint64_t v73 = sub_FBE0(v145);
    (*(void (**)(uint64_t *, char *, uint64_t))(v70 + 16))(v73, v69, v72);
    sub_75912C((uint64_t)v71, (uint64_t)&v136);
    uint64_t v74 = (_OWORD *)swift_allocObject();
    uint64_t v75 = v70;
    long long v76 = v143;
    v74[7] = v142;
    v74[8] = v76;
    v74[9] = v144[0];
    *(_OWORD *)((char *)v74 + 153) = *(_OWORD *)((char *)v144 + 9);
    long long v77 = v139;
    v74[3] = v138;
    v74[4] = v77;
    long long v78 = v141;
    v74[5] = v140;
    v74[6] = v78;
    long long v79 = v137;
    v74[1] = v136;
    v74[2] = v79;
LABEL_23:
    uint64_t v101 = v114;
    sub_77AE60();
    swift_release();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v145);
    uint64_t v103 = v121;
    uint64_t v102 = v122;
    uint64_t v104 = v119;
    *(void *)&long long v136 = v71[18];
    sub_77AB40();
    sub_75912C((uint64_t)v71, (uint64_t)&v136);
    uint64_t v105 = swift_allocObject();
    long long v106 = v143;
    *(_OWORD *)(v105 + 112) = v142;
    *(_OWORD *)(v105 + 128) = v106;
    *(_OWORD *)(v105 + 144) = v144[0];
    *(_OWORD *)(v105 + 153) = *(_OWORD *)((char *)v144 + 9);
    long long v107 = v139;
    *(_OWORD *)(v105 + 48) = v138;
    *(_OWORD *)(v105 + 64) = v107;
    long long v108 = v141;
    *(_OWORD *)(v105 + 80) = v140;
    *(_OWORD *)(v105 + 96) = v108;
    long long v109 = v137;
    *(_OWORD *)(v105 + 16) = v136;
    *(_OWORD *)(v105 + 32) = v109;
    *(unsigned char *)(v105 + 169) = v126;
    sub_77AE60();
    swift_release();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v145);
    uint64_t v110 = v120;
    v120[3] = v102;
    v110[4] = (uint64_t)&protocol witness table for VerticalStack;
    CGRect v111 = sub_FBE0(v110);
    (*(void (**)(uint64_t *, char *, uint64_t))(v103 + 32))(v111, v101, v102);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v118, v131);
    return (void *)(*(uint64_t (**)(double (**)(double), uint64_t))(v130 + 8))(v104, v127);
  }
  uint64_t v80 = v131;
  uint64_t v81 = *((void *)v117 + 4);
  sub_77B760();
  sub_FD50(&qword_951820);
  uint64_t v82 = swift_allocObject();
  *(_OWORD *)(v82 + 16) = xmmword_78FCC0;
  objc_super v83 = v115;
  *(void *)(v82 + 32) = v115;
  id v84 = v113;
  id v85 = v83;
  uint64_t v86 = (void *)sub_77B770();
  objc_msgSend(v84, "measurementsWithFitting:in:", v86, a3, a4);
  double v88 = v87;

  sub_FB9C(v71 + 8, v71[11]);
  __n128 result = (void *)sub_77AF60();
  if (result)
  {
    uint64_t v89 = result;
    [result lineHeight];
    double v91 = v90;

    if (v91 * (double)v81 - v88 < 0.0) {
      double v92 = 0.0;
    }
    else {
      double v92 = v91 * (double)v81 - v88;
    }
    uint64_t v93 = v80;
    *((void *)&v137 + 1) = v80;
    *(void *)&long long v138 = &protocol witness table for Resize;
    uint64_t v94 = sub_FBE0((uint64_t *)&v136);
    uint64_t v75 = v70;
    (*(void (**)(uint64_t *, char *, uint64_t))(v70 + 16))(v94, v69, v93);
    v135[3] = &type metadata for CGFloat;
    v135[4] = &protocol witness table for CGFloat;
    *(double *)uint64_t v135 = v92;
    uint64_t v95 = sub_77AEE0();
    v134[3] = v95;
    v134[4] = (uint64_t)&protocol witness table for ZeroDimension;
    sub_FBE0(v134);
    sub_77AED0();
    v133[3] = v95;
    v133[4] = (uint64_t)&protocol witness table for ZeroDimension;
    sub_FBE0(v133);
    sub_77AED0();
    v132[3] = v95;
    v132[4] = (uint64_t)&protocol witness table for ZeroDimension;
    sub_FBE0(v132);
    sub_77AED0();
    uint64_t v146 = sub_77B8D0();
    v147 = &protocol witness table for Margins;
    sub_FBE0(v145);
    sub_77B8E0();
    sub_75912C((uint64_t)v71, (uint64_t)&v136);
    uint64_t v96 = (_OWORD *)swift_allocObject();
    long long v97 = v143;
    v96[7] = v142;
    v96[8] = v97;
    v96[9] = v144[0];
    *(_OWORD *)((char *)v96 + 153) = *(_OWORD *)((char *)v144 + 9);
    long long v98 = v139;
    v96[3] = v138;
    v96[4] = v98;
    long long v99 = v141;
    v96[5] = v140;
    v96[6] = v99;
    long long v100 = v137;
    v96[1] = v136;
    v96[2] = v100;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_758EAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  v6[3] = &type metadata for CGFloat;
  void v6[4] = &protocol witness table for CGFloat;
  v6[0] = v3;
  sub_77AE20();
  sub_FB9C(a2 + 8, a2[11]);
  char v4 = sub_77AA70();
  sub_75912C((uint64_t)a2, (uint64_t)v6);
  if (v4) {
    objc_msgSend((id)v6[7], "isHidden", v6[0]);
  }
  sub_390C7C((uint64_t)v6);
  return sub_77AE10();
}

uint64_t sub_758F6C()
{
  return sub_77AE10();
}

double sub_758FD0(void *a1, double a2, double a3)
{
  sub_75805C(a1, v6, a2, a3);
  sub_FB9C(v6, v6[3]);
  sub_77B980();
  double v4 = v3;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v6);
  return v4;
}

uint64_t sub_759074(void *a1, double a2, double a3, double a4, double a5)
{
  sub_75805C(a1, v6, a4, a5);
  sub_FB9C(v6, v6[3]);
  sub_77B970();
  return _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v6);
}

__n128 sub_759110@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  char v3 = *(unsigned char *)(v1 + 40);
  __n128 result = *(__n128 *)v1;
  long long v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v3;
  return result;
}

uint64_t sub_75912C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_759164()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_759174()
{
  return sub_77AE10();
}

uint64_t sub_7591A0()
{
  return sub_759200(169);
}

double sub_7591A8(double a1)
{
  return *(double *)(v1 + 40) + *(double *)(v1 + 40) + a1;
}

uint64_t sub_7591B8()
{
  return sub_759200(169);
}

uint64_t sub_7591C0()
{
  return sub_759200(170);
}

uint64_t sub_7591C8()
{
  return sub_758F6C();
}

uint64_t sub_7591D4()
{
  return sub_759200(169);
}

uint64_t sub_7591DC(uint64_t a1)
{
  return sub_758EAC(a1, (uint64_t *)(v1 + 16));
}

uint64_t sub_7591F8()
{
  return sub_759200(170);
}

uint64_t sub_759200(uint64_t a1)
{
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(v1 + 80);
  if (*(void *)(v1 + 144)) {
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0(v1 + 120);
  }

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_75926C()
{
  return sub_77AE10();
}

id sub_7592D4()
{
  uint64_t v0 = (void *)sub_75B024();

  return v0;
}

uint64_t sub_759300(uint64_t a1)
{
  uint64_t v3 = sub_77D250();
  __n128 v4 = __chkstk_darwin(v3);
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
  (*(void (**)(char *, uint64_t, __n128))(v7 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  id v8 = objc_allocWithZone((Class)sub_773FA0());
  id v9 = v6;
  return sub_773FB0();
}

void sub_7593E4()
{
  uint64_t v1 = sub_77B6D0();
  __chkstk_darwin(v1 - 8);
  sub_77B6C0();
  id v2 = objc_allocWithZone((Class)sub_77B6F0());
  uint64_t v3 = (void *)sub_77B6E0();
  __n128 v4 = *(void **)(v0 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
  sub_FD50(&qword_951820);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_78FCC0;
  *(void *)(v5 + 32) = v3;
  sub_77D8A0();
  sub_FE2C(0, (unint64_t *)&qword_9528A0);
  id v6 = v3;
  Class isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();
  [v4 setViewControllers:isa];
}

uint64_t sub_759528(uint64_t a1)
{
  uint64_t v2 = sub_FD50((uint64_t *)&unk_9514F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_FD50(&qword_978F30);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[2] = sub_4E8CDC(a1);
  sub_FD50(&qword_953DD0);
  sub_77C870();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_7953D0;
  id v10 = (objc_class *)sub_773520();
  uint64_t v11 = sub_7734D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  id v12 = objc_allocWithZone(v10);
  uint64_t v13 = (void *)sub_7734E0();
  uint64_t v18 = (uint64_t)v13;
  sub_77C860();

  sub_777BD0();
  swift_allocObject();
  uint64_t v18 = sub_777BC0();
  sub_77C860();
  swift_release();
  id v14 = [objc_allocWithZone((Class)type metadata accessor for AppEventLiveIndicatorAnimationCoordinator()) init];
  uint64_t v18 = (uint64_t)v14;
  sub_77C860();

  sub_75985C();
  sub_77C860();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v18 = v9;
  sub_FD50(&qword_964CE8);
  sub_4E957C();
  uint64_t v15 = sub_77CCC0();
  swift_bridgeObjectRelease();
  swift_release();
  return v15;
}

uint64_t sub_75985C()
{
  sub_76E630();
  sub_77CD80();
  sub_FD50((uint64_t *)&unk_9514F0);
  sub_75AB38();
  sub_77CD60();
  sub_75AB8C();
  sub_77CD60();
  sub_75ABE0();
  sub_77CD60();
  sub_75AC34();
  sub_77CD60();
  sub_75AC88();
  sub_77CD60();
  sub_75ACDC();
  sub_77CD60();
  sub_75AD30();
  sub_77CD60();
  sub_75AD84();
  sub_77CD60();
  sub_75ADD8();
  sub_77CD60();
  sub_75AE2C();
  sub_77CD60();
  sub_75AE80();
  sub_77CD60();
  sub_75AED4();
  sub_77CD60();
  sub_75AF28();
  sub_77CD60();
  sub_75AF7C();
  sub_77CD60();
  sub_75AFD0();
  sub_77CD60();
  sub_415890();
  sub_77CD60();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_75B270((uint64_t)v7, (uint64_t)v9);
  sub_75B2CC();
  sub_77CD60();
  sub_75B320((uint64_t)v9);
  sub_75B024();
  sub_FD50(&qword_978FB8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_7955F0;
  *(void *)(v0 + 56) = &type metadata for ArticlePresentingFlowActionLogic;
  *(void *)(v0 + 64) = &off_88EAF0;
  *(void *)(v0 + 96) = &type metadata for ArcadeWelcomeFlowActionLogic;
  *(void *)(v0 + 104) = &off_890698;
  *(void *)(v0 + 136) = &type metadata for NavigationControllerFlowActionLogic;
  *(void *)(v0 + 144) = &off_895AD8;
  *(void *)(v0 + 176) = &type metadata for TabBarControllerFlowActionLogic;
  *(void *)(v0 + 184) = &off_897710;
  *(void *)(v0 + 216) = &type metadata for RootFlowActionLogic;
  *(void *)(v0 + 224) = &off_893130;
  type metadata accessor for FlowActionImplementation();
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  *(void *)(v1 + 24) = v0;
  v9[0] = v1;
  sub_75C164(&qword_978FC0, (void (*)(uint64_t))type metadata accessor for FlowActionImplementation);
  sub_77CD60();
  swift_release();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_122958((uint64_t)v7, (uint64_t)v9);
  sub_75B374();
  sub_77CD60();
  sub_75B3C8((uint64_t)v9);
  sub_75B41C();
  sub_77CD60();
  sub_75B470();
  sub_77CD60();
  sub_75B4C4();
  sub_77CD60();
  sub_75B518();
  sub_77CD60();
  sub_75B56C();
  sub_77CD60();
  sub_75B5C0();
  sub_77CD60();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_75B614((uint64_t)v7, (uint64_t)v9);
  sub_75B670();
  sub_77CD60();
  sub_75B6C4((uint64_t)v9);
  sub_75B718();
  sub_77CD60();
  sub_75B76C();
  sub_77CD60();
  sub_75B7C0();
  sub_77CD60();
  sub_75B814();
  sub_77CD60();
  sub_75B868();
  sub_77CD60();
  sub_75B8BC();
  sub_77CD60();
  uint64_t v8 = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = 0;
  swift_unknownObjectWeakAssign();
  sub_4C56C4((uint64_t)v7, (uint64_t)v9);
  sub_75B910();
  sub_77CD60();
  sub_75B964((uint64_t)v9);
  sub_75B9B8();
  sub_77CD60();
  uint64_t v8 = 0;
  swift_unknownObjectWeakInit();
  uint64_t v8 = 0;
  swift_unknownObjectWeakAssign();
  sub_4C56C4((uint64_t)v7, (uint64_t)v9);
  sub_75BA0C();
  sub_77CD60();
  sub_75BA60((uint64_t)v9);
  sub_75BAB4();
  sub_77CD60();
  sub_75BB08();
  sub_77CD60();
  sub_75BB5C();
  sub_77CD60();
  sub_18244();
  sub_77CD60();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_122958((uint64_t)v7, (uint64_t)v9);
  sub_75BBB0();
  sub_77CD60();
  sub_75BC04((uint64_t)v9);
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_75BC58((uint64_t)v7, (uint64_t)v9);
  sub_75BCB4();
  sub_77CD60();
  sub_75BD08((uint64_t)v9);
  sub_75BD5C();
  sub_77CD60();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_75BDB0((uint64_t)v7, (uint64_t)v9);
  sub_75BE0C();
  sub_77CD60();
  sub_75BE60((uint64_t)v9);
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_75BEB4((uint64_t)v7, (uint64_t)v9);
  sub_75BF10();
  sub_77CD60();
  sub_75BF64((uint64_t)v9);
  sub_75BFB8();
  sub_77CD60();
  sub_75C00C();
  sub_77CD60();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_75C060((uint64_t)v7, (uint64_t)v9);
  sub_75C0BC();
  sub_77CD60();
  sub_75C110((uint64_t)v9);
  sub_75B024();
  uint64_t v2 = (objc_class *)type metadata accessor for TabChangeActionImplementation();
  id v3 = objc_allocWithZone(v2);
  swift_unknownObjectUnownedInit();
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, "init");
  v9[0] = v4;
  sub_75C164(&qword_9790A8, (void (*)(uint64_t))type metadata accessor for TabChangeActionImplementation);
  sub_77CD60();

  sub_75C1AC();
  sub_77CD60();
  sub_75C200();
  sub_77CD60();
  sub_75C254();
  sub_77CD60();
  sub_75C2A8();
  sub_77CD60();
  sub_75B024();
  swift_unknownObjectUnownedInit();
  sub_122958((uint64_t)v7, (uint64_t)v9);
  sub_75C2FC();
  sub_77CD60();
  return sub_75C350((uint64_t)v9);
}

uint64_t sub_75A168(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a2;
  uint64_t v4 = sub_76FA30();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  __chkstk_darwin(v4);
  uint64_t v38 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_FD50((uint64_t *)&unk_9606C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v44 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_76D960();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  __chkstk_darwin(v8);
  uint64_t v42 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_FD50(&qword_978F30);
  __chkstk_darwin(v10 - 8);
  id v12 = (uint64_t *)((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_FE2C(0, &qword_96E4C0);
  sub_76E630();
  sub_77D2B0();
  uint64_t v13 = v47;
  sub_773520();
  sub_77D2B0();
  id v14 = v47;
  uint64_t v41 = v2;
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
  *id v12 = v15;
  uint64_t v16 = enum case for URLProtocolDelegate.DialogStyle.alert(_:);
  uint64_t v17 = sub_7734D0();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v18 + 104))(v12, v16, v17);
  uint64_t v19 = 1;
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v12, 0, 1, v17);
  id v20 = v15;
  uint64_t v21 = v14;
  uint64_t v22 = a1;
  id v23 = v20;
  sub_7734F0();
  id v43 = v13;
  [v13 setDelegate:v21];
  sub_76F980();
  sub_779DE0();
  uint64_t v24 = sub_76F940();
  if (*(void *)(v24 + 16))
  {
    uint64_t v26 = (uint64_t)v44;
    uint64_t v25 = v45;
    uint64_t v27 = v46;
    (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v44, v24 + ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80)), v46);
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v25 = v45;
    uint64_t v27 = v46;
    uint64_t v26 = (uint64_t)v44;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v26, v19, 1, v27);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v26, 1, v27) == 1)
  {
    sub_14C88(v26, (uint64_t *)&unk_9606C0);
    if (qword_94F858 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_77D3B0();
    sub_FDF4(v28, (uint64_t)qword_9B4548);
    sub_FD50((uint64_t *)&unk_951E60);
    sub_77C9B0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_78DBA0;
    sub_77C900();
    sub_77D280();

    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    uint64_t v30 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v42, v26, v27);
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_748BF8(v23, v30, v37, v22);
      swift_unknownObjectRelease();
    }
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v32 = Strong;
      unsigned int v33 = v38;
      uint64_t v34 = v39;
      uint64_t v35 = v40;
      (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, enum case for BootstrapPhase.initialBootstrap(_:), v40);
      sub_777F10();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v35);
      if (*(void *)(v32 + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_freshnessWatchdog))
      {
        swift_retain();
        sub_772E50();

        swift_release();
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {

        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {

      swift_release();
    }

    return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v30, v27);
  }
}

void sub_75A7BC()
{
  uint64_t v1 = sub_77B7A0();
  __chkstk_darwin(v1 - 8);
  swift_errorRetain();
  sub_77B790();
  id v2 = objc_allocWithZone((Class)sub_77B7C0());
  swift_retain();
  id v3 = (void *)sub_77B7B0();
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
  sub_FD50(&qword_951820);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_78FCC0;
  *(void *)(v5 + 32) = v3;
  sub_77D8A0();
  sub_FE2C(0, (unint64_t *)&qword_9528A0);
  id v6 = v3;
  Class isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();
  [v4 setViewControllers:isa];
}

void sub_75A924()
{
  sub_174B8(v0 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_delegate);
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
}

uint64_t sub_75A964()
{
  sub_174B8(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ASMessagesProvider13BaseBootstrap_logger;
  uint64_t v2 = sub_77CC50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_174B8(v0 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_delegate);

  return v0;
}

uint64_t sub_75AA34()
{
  sub_75A964();

  return swift_deallocClassInstance();
}

uint64_t sub_75AA8C()
{
  return type metadata accessor for MessagesStoreBootstrap();
}

uint64_t type metadata accessor for MessagesStoreBootstrap()
{
  uint64_t result = qword_978D68;
  if (!qword_978D68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_75AAE0()
{
  return swift_updateClassMetadata2();
}

void sub_75AB30()
{
  sub_4E77BC(v0);
}

unint64_t sub_75AB38()
{
  unint64_t result = qword_978F38;
  if (!qword_978F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F38);
  }
  return result;
}

unint64_t sub_75AB8C()
{
  unint64_t result = qword_978F40;
  if (!qword_978F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F40);
  }
  return result;
}

unint64_t sub_75ABE0()
{
  unint64_t result = qword_978F48;
  if (!qword_978F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F48);
  }
  return result;
}

unint64_t sub_75AC34()
{
  unint64_t result = qword_978F50;
  if (!qword_978F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F50);
  }
  return result;
}

unint64_t sub_75AC88()
{
  unint64_t result = qword_978F58;
  if (!qword_978F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F58);
  }
  return result;
}

unint64_t sub_75ACDC()
{
  unint64_t result = qword_978F60;
  if (!qword_978F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F60);
  }
  return result;
}

unint64_t sub_75AD30()
{
  unint64_t result = qword_978F68;
  if (!qword_978F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F68);
  }
  return result;
}

unint64_t sub_75AD84()
{
  unint64_t result = qword_978F70;
  if (!qword_978F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F70);
  }
  return result;
}

unint64_t sub_75ADD8()
{
  unint64_t result = qword_978F78;
  if (!qword_978F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F78);
  }
  return result;
}

unint64_t sub_75AE2C()
{
  unint64_t result = qword_978F80;
  if (!qword_978F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F80);
  }
  return result;
}

unint64_t sub_75AE80()
{
  unint64_t result = qword_978F88;
  if (!qword_978F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F88);
  }
  return result;
}

unint64_t sub_75AED4()
{
  unint64_t result = qword_978F90;
  if (!qword_978F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F90);
  }
  return result;
}

unint64_t sub_75AF28()
{
  unint64_t result = qword_978F98;
  if (!qword_978F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978F98);
  }
  return result;
}

unint64_t sub_75AF7C()
{
  unint64_t result = qword_978FA0;
  if (!qword_978FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FA0);
  }
  return result;
}

unint64_t sub_75AFD0()
{
  unint64_t result = qword_978FA8;
  if (!qword_978FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FA8);
  }
  return result;
}

uint64_t sub_75B024()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_77B6D0();
  __chkstk_darwin(v2 - 8);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC18ASMessagesProvider13BaseBootstrap_isBootstrapping) & 1) == 0)
  {
    *(unsigned char *)(v0 + OBJC_IVAR____TtC18ASMessagesProvider13BaseBootstrap_isBootstrapping) = 1;
    sub_77B6C0();
    id v3 = objc_allocWithZone((Class)sub_77B6F0());
    uint64_t v4 = (void *)sub_77B6E0();
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
    sub_FD50(&qword_951820);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_78FCC0;
    *(void *)(v6 + 32) = v4;
    v12[0] = v6;
    sub_77D8A0();
    sub_FE2C(0, (unint64_t *)&qword_9528A0);
    id v7 = v4;
    Class isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
    [v5 setViewControllers:isa];

    sub_4E7260(v12);
    sub_FB9C(v12, v12[3]);
    sub_773640();
    uint64_t v9 = sub_FE2C(0, (unint64_t *)&qword_9526A0);
    swift_retain_n();
    v11[3] = v9;
    v11[4] = &protocol witness table for OS_dispatch_queue;
    v11[0] = sub_77DD60();
    sub_77D2F0();
    swift_release();
    swift_release_n();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v11);
    sub_76D130();
    sub_76D120();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v12);
  }
  return *(void *)(v1 + OBJC_IVAR____TtC18ASMessagesProvider22MessagesStoreBootstrap_navigationController);
}

uint64_t sub_75B270(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_75B2CC()
{
  unint64_t result = qword_978FB0;
  if (!qword_978FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FB0);
  }
  return result;
}

uint64_t sub_75B320(uint64_t a1)
{
  return a1;
}

unint64_t sub_75B374()
{
  unint64_t result = qword_978FC8;
  if (!qword_978FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FC8);
  }
  return result;
}

uint64_t sub_75B3C8(uint64_t a1)
{
  return a1;
}

unint64_t sub_75B41C()
{
  unint64_t result = qword_978FD0;
  if (!qword_978FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FD0);
  }
  return result;
}

unint64_t sub_75B470()
{
  unint64_t result = qword_978FD8;
  if (!qword_978FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FD8);
  }
  return result;
}

unint64_t sub_75B4C4()
{
  unint64_t result = qword_978FE0;
  if (!qword_978FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FE0);
  }
  return result;
}

unint64_t sub_75B518()
{
  unint64_t result = qword_978FE8;
  if (!qword_978FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FE8);
  }
  return result;
}

unint64_t sub_75B56C()
{
  unint64_t result = qword_978FF0;
  if (!qword_978FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FF0);
  }
  return result;
}

unint64_t sub_75B5C0()
{
  unint64_t result = qword_978FF8;
  if (!qword_978FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_978FF8);
  }
  return result;
}

uint64_t sub_75B614(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_75B670()
{
  unint64_t result = qword_979000;
  if (!qword_979000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979000);
  }
  return result;
}

uint64_t sub_75B6C4(uint64_t a1)
{
  return a1;
}

unint64_t sub_75B718()
{
  unint64_t result = qword_979008;
  if (!qword_979008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979008);
  }
  return result;
}

unint64_t sub_75B76C()
{
  unint64_t result = qword_979010;
  if (!qword_979010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979010);
  }
  return result;
}

unint64_t sub_75B7C0()
{
  unint64_t result = qword_979018;
  if (!qword_979018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979018);
  }
  return result;
}

unint64_t sub_75B814()
{
  unint64_t result = qword_979020;
  if (!qword_979020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979020);
  }
  return result;
}

unint64_t sub_75B868()
{
  unint64_t result = qword_979028;
  if (!qword_979028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979028);
  }
  return result;
}

unint64_t sub_75B8BC()
{
  unint64_t result = qword_979030;
  if (!qword_979030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979030);
  }
  return result;
}

unint64_t sub_75B910()
{
  unint64_t result = qword_979038;
  if (!qword_979038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979038);
  }
  return result;
}

uint64_t sub_75B964(uint64_t a1)
{
  return a1;
}

unint64_t sub_75B9B8()
{
  unint64_t result = qword_979040;
  if (!qword_979040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979040);
  }
  return result;
}

unint64_t sub_75BA0C()
{
  unint64_t result = qword_979048;
  if (!qword_979048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979048);
  }
  return result;
}

uint64_t sub_75BA60(uint64_t a1)
{
  return a1;
}

unint64_t sub_75BAB4()
{
  unint64_t result = qword_979050;
  if (!qword_979050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979050);
  }
  return result;
}

unint64_t sub_75BB08()
{
  unint64_t result = qword_979058;
  if (!qword_979058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979058);
  }
  return result;
}

unint64_t sub_75BB5C()
{
  unint64_t result = qword_979060;
  if (!qword_979060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979060);
  }
  return result;
}

unint64_t sub_75BBB0()
{
  unint64_t result = qword_979068;
  if (!qword_979068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979068);
  }
  return result;
}

uint64_t sub_75BC04(uint64_t a1)
{
  return a1;
}

uint64_t sub_75BC58(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_75BCB4()
{
  unint64_t result = qword_979070;
  if (!qword_979070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979070);
  }
  return result;
}

uint64_t sub_75BD08(uint64_t a1)
{
  return a1;
}

unint64_t sub_75BD5C()
{
  unint64_t result = qword_979078;
  if (!qword_979078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979078);
  }
  return result;
}

uint64_t sub_75BDB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_75BE0C()
{
  unint64_t result = qword_979080;
  if (!qword_979080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979080);
  }
  return result;
}

uint64_t sub_75BE60(uint64_t a1)
{
  return a1;
}

uint64_t sub_75BEB4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_75BF10()
{
  unint64_t result = qword_979088;
  if (!qword_979088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979088);
  }
  return result;
}

uint64_t sub_75BF64(uint64_t a1)
{
  return a1;
}

unint64_t sub_75BFB8()
{
  unint64_t result = qword_979090;
  if (!qword_979090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979090);
  }
  return result;
}

unint64_t sub_75C00C()
{
  unint64_t result = qword_979098;
  if (!qword_979098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979098);
  }
  return result;
}

uint64_t sub_75C060(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_75C0BC()
{
  unint64_t result = qword_9790A0;
  if (!qword_9790A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9790A0);
  }
  return result;
}

uint64_t sub_75C110(uint64_t a1)
{
  return a1;
}

uint64_t sub_75C164(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_75C1AC()
{
  unint64_t result = qword_9790B0;
  if (!qword_9790B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9790B0);
  }
  return result;
}

unint64_t sub_75C200()
{
  unint64_t result = qword_9790B8;
  if (!qword_9790B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9790B8);
  }
  return result;
}

unint64_t sub_75C254()
{
  unint64_t result = qword_9790C0;
  if (!qword_9790C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9790C0);
  }
  return result;
}

unint64_t sub_75C2A8()
{
  unint64_t result = qword_9790C8;
  if (!qword_9790C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9790C8);
  }
  return result;
}

unint64_t sub_75C2FC()
{
  unint64_t result = qword_9790D0;
  if (!qword_9790D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_9790D0);
  }
  return result;
}

uint64_t sub_75C350(uint64_t a1)
{
  return a1;
}

uint64_t sub_75C3A4(uint64_t a1)
{
  return sub_4E7960(a1);
}

uint64_t sub_75C3AC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_77D3B0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v69 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_FD50((uint64_t *)&unk_9606C0);
  __chkstk_darwin(v9 - 8);
  char v68 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_FD50((uint64_t *)&unk_951CA0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_FD50(&qword_953000);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (uint64_t *)((char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = type metadata accessor for FlowDestination();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = (void (*)(char *, uint64_t))((char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_73AF6C(v16);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
  {
    uint64_t v67 = v7;
    sub_72794((uint64_t)v16, (uint64_t)v20);
    id v26 = [a1 traitCollection];
    uint64_t v27 = sub_76EF50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v13, 1, 1, v27);
    uint64_t v72 = 0;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v28 = sub_46C1D4(v20, (uint64_t)v26, 0, 0, (uint64_t)v13, (uint64_t)&v70, a3);

    sub_14C88((uint64_t)&v70, (uint64_t *)&unk_9693A0);
    sub_14C88((uint64_t)v13, (uint64_t *)&unk_951CA0);
    unsigned int v29 = v20;
    if (!v28)
    {
      unsigned int v33 = v20;
      if (qword_94F858 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_FDF4(v6, (uint64_t)qword_9B4548);
      uint64_t v35 = v67;
      uint64_t v36 = v69;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v69, v34, v6);
      sub_FD50((uint64_t *)&unk_951E60);
      sub_77C9B0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_78FEE0;
      sub_77C900();
      uint64_t v37 = sub_76D960();
      *((void *)&v71 + 1) = v37;
      uint64_t v38 = sub_FBE0((uint64_t *)&v70);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 16))(v38, a2, v37);
      sub_77C980();
      sub_14C88((uint64_t)&v70, (uint64_t *)&unk_951B40);
      sub_77D280();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v6);
      uint64_t v39 = (uint64_t)v33;
      return sub_DEBFC(v39);
    }
    uint64_t v30 = (void *)sub_73BAB4();
    NSString v31 = v30;
    if (v30)
    {
      id v32 = [v30 title];

      if (v32)
      {
        sub_77D670();

        NSString v31 = sub_77D640();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v31 = 0;
      }
    }
    [v28 setTitle:v31];

    type metadata accessor for StoreCollectionViewController();
    uint64_t v40 = (char *)swift_dynamicCastClass();
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = v20;
      v40[OBJC_IVAR____TtC18ASMessagesProvider29StoreCollectionViewController_prefersLargeTitle] = 1;
      (*(void (**)(char *))&stru_1F8.sectname[swift_isaMask & *(void *)v40])(v28);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v44 = sub_76D960();
      uint64_t v45 = (uint64_t)v68;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v68, 1, 1, v44);
      unint64_t v46 = (*(uint64_t (**)(void *, uint64_t))(ObjectType + 512))(a3, v45);
      sub_14C88(v45, (uint64_t *)&unk_9606C0);
      unint64_t v47 = *(void *)&v41[OBJC_IVAR____TtC18ASMessagesProvider29StoreCollectionViewController_navigationAccessories];
      *(void *)&v41[OBJC_IVAR____TtC18ASMessagesProvider29StoreCollectionViewController_navigationAccessories] = v46;
      swift_bridgeObjectRetain();
      id v48 = [v41 traitCollection];
      char v49 = sub_4EAD44(v47, (uint64_t)v48, v46);
      swift_bridgeObjectRelease();

      if ((v49 & 1) == 0) {
        sub_734424();
      }
    }
    else
    {
      type metadata accessor for SearchViewController();
      uint64_t v50 = swift_dynamicCastClass();
      if (!v50)
      {
LABEL_23:
        sub_FD50(&qword_951820);
        uint64_t v63 = swift_allocObject();
        *(_OWORD *)(v63 + 16) = xmmword_78FCC0;
        *(void *)(v63 + 32) = v28;
        *(void *)&long long v70 = v63;
        sub_77D8A0();
        sub_FE2C(0, (unint64_t *)&qword_9528A0);
        long long v64 = v28;
        Class isa = sub_77D880().super.isa;
        swift_bridgeObjectRelease();
        [a1 setViewControllers:isa];

        uint64_t v39 = (uint64_t)v29;
        return sub_DEBFC(v39);
      }
      long long v51 = (char *)v50;
      uint64_t v42 = v20;
      uint64_t v52 = OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_prefersLargeTitle;
      *(unsigned char *)(v50 + OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_prefersLargeTitle) = 1;
      long long v53 = v28;
      id v54 = [v51 navigationItem];
      double v55 = v54;
      if (v51[v52]) {
        uint64_t v56 = 3;
      }
      else {
        uint64_t v56 = 2;
      }
      [v54 setLargeTitleDisplayMode:v56];

      uint64_t v57 = sub_76D960();
      uint64_t v58 = (uint64_t)v68;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v68, 1, 1, v57);
      unint64_t v59 = sub_2C25D0(v58);
      sub_14C88(v58, (uint64_t *)&unk_9606C0);
      unint64_t v60 = *(void *)&v51[OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_navigationAccessories];
      *(void *)&v51[OBJC_IVAR____TtC18ASMessagesProvider20SearchViewController_navigationAccessories] = v59;
      swift_bridgeObjectRetain();
      id v61 = [v51 traitCollection];
      char v62 = sub_4EAD44(v60, (uint64_t)v61, v59);
      swift_bridgeObjectRelease();

      if ((v62 & 1) == 0) {
        sub_2C0928();
      }
    }
    unsigned int v29 = v42;

    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  sub_14C88((uint64_t)v16, &qword_953000);
  if (qword_94F858 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_FDF4(v6, (uint64_t)qword_9B4548);
  uint64_t v22 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v69, v21, v6);
  sub_FD50((uint64_t *)&unk_951E60);
  sub_77C9B0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_78FEE0;
  sub_77C900();
  uint64_t v23 = sub_76D960();
  *((void *)&v71 + 1) = v23;
  uint64_t v24 = sub_FBE0((uint64_t *)&v70);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v24, a2, v23);
  sub_77C980();
  sub_14C88((uint64_t)&v70, (uint64_t *)&unk_951B40);
  sub_77D280();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v22, v6);
}

id sub_75CDF8(double a1, double a2, double a3, double a4)
{
  return sub_75CE10(a1, a2, a3, a4);
}

id sub_75CE10(double a1, double a2, double a3, double a4)
{
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v8, "initWithFrame:", a1, a2, a3, a4);
}

void sub_75CE78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(*(uint64_t (**)(void))(a2 + 32))();
  v10.value.super.Class isa = 0;
  v10.is_nil = 0;
  sub_76E2C0(v10, v5);

  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 40);
  uint64_t v7 = (void *)v6(a1, a2);
  [v7 setAttributedText:0];

  id v8 = (id)v6(a1, a2);
  [v8 setText:0];
}

uint64_t sub_75CF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_75F55C(a1, a3, a4);
}

void sub_75CF64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_77A010();
  __n128 v9 = __chkstk_darwin(v8 - 8);
  uint64_t v24 = 0;
  if (a1)
  {
    swift_retain();
    id v10 = sub_75DE50(&v24, v4, a3, a4);
    sub_75DF30();
    char v12 = v11;

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 32);
      uint64_t v14 = (void *)v13(a3, a4);
      [v14 contentMode];

      sub_77A060();
      uint64_t v15 = (void *)v13(a3, a4);
      sub_77A020();
      sub_76E2A0();
      [v15 setContentMode:sub_779EA0()];
      sub_772D10();
      sub_76E2E0();
      if (!sub_779EF0())
      {
        sub_FE2C(0, (unint64_t *)&qword_94FFD0);
        sub_77E380();
      }
      sub_76E150();

      uint64_t v16 = (void *)v13(a3, a4);
      sub_76E300();
      sub_76F120();

      uint64_t v17 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = a3;
      v18[3] = a4;
      v18[4] = v17;
      swift_retain();
      sub_76F0E0();
      swift_release();
      swift_release();
      swift_release();
      sub_14C88((uint64_t)v23, (uint64_t *)&unk_9563B0);
      uint64_t v19 = v24;
      swift_release();

      return;
    }
    swift_release();
    a1 = v24;
  }
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(a4 + 32))(a3, a4, v9);
  Swift::Bool v21 = v20;
  uint64_t v22 = (void *)v20;
  v26.value.super.Class isa = 0;
  v26.is_nil = 0;
  sub_76E2C0(v26, v21);
}

uint64_t sub_75D2E8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_FD50((uint64_t *)&unk_95C550);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  __n128 v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v10);
  char v12 = &v22[-v11 - 8];
  sub_7729B0();
  swift_getKeyPath();
  sub_77CB10();
  swift_release();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v12, v6);
  if (v23)
  {
    sub_FD50(&qword_957380);
    sub_76F010();
    if (swift_dynamicCast())
    {
      sub_7729B0();
      swift_getKeyPath();
      sub_77CB10();
      swift_release();
      v13(v9, v6);
      if (v22[0] == 1)
      {
        swift_retain();
        uint64_t v14 = sub_779980();
        swift_release();
        if (v14)
        {
          uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a1, a2);
          sub_75DF30();
          char v17 = v16;

          if ((v17 & 1) == 0)
          {
            sub_779EA0();
            sub_774F30();
            swift_release();
            swift_release();
            uint64_t v18 = sub_774F50();
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a3, 0, 1, v18);
          }
          swift_release();
        }
      }
      swift_release();
    }
  }
  else
  {
    sub_14C88((uint64_t)v22, (uint64_t *)&unk_958570);
  }
  uint64_t v20 = sub_774F50();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a3, 1, 1, v20);
}

uint64_t sub_75D5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_75D65C(a1, a2, a3, (uint64_t *)&unk_979130);
}

uint64_t sub_75D600(uint64_t a1, uint64_t a2)
{
  return sub_75D6C0(a1, a2, (uint64_t *)&unk_979130);
}

void sub_75D60C()
{
}

void sub_75D634()
{
}

uint64_t sub_75D650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_75D65C(a1, a2, a3, &qword_979128);
}

uint64_t sub_75D65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_77D5F0() & 1;
}

uint64_t sub_75D6B4(uint64_t a1, uint64_t a2)
{
  return sub_75D6C0(a1, a2, &qword_979128);
}

uint64_t sub_75D6C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_77D590();
}

void sub_75D704()
{
}

void sub_75D72C()
{
}

uint64_t sub_75D748@<X0>(uint64_t a1@<X8>)
{
  sub_779840();
  sub_75FEE4(&qword_979140, (void (*)(uint64_t))&type metadata accessor for Shelf);
  swift_retain();
  uint64_t v2 = sub_77C9C0();
  if (*(void *)(v2 + 16))
  {
    sub_145F4(v2 + 32, a1);
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_75D81C()
{
  uint64_t v13 = v0;
  sub_75FEE4(&qword_979140, (void (*)(uint64_t))&type metadata accessor for Shelf);
  uint64_t v1 = sub_77C9C0();
  if (*(void *)(v1 + 16))
  {
    sub_145F4(v1 + 32, (uint64_t)&v9);
  }
  else
  {
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1))
  {
    sub_14C88((uint64_t)&v9, (uint64_t *)&unk_958570);
    return 1;
  }
  sub_146C0(&v9, (uint64_t)v12);
  sub_FB9C(v12, v12[3]);
  uint64_t DynamicType = swift_getDynamicType();
  uint64_t result = sub_77C9C0();
  unint64_t v4 = *(void *)(result + 16);
  unint64_t v5 = v4 != 0;
  if (v4 == v5)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    uint64_t v8 = 1;
LABEL_13:
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v12);
    return v8;
  }
  uint64_t v6 = result + 40 * (v4 != 0) + 32;
  while (v5 < v4)
  {
    sub_145F4(v6, (uint64_t)&v9);
    sub_FB9C(&v9, *((uint64_t *)&v10 + 1));
    uint64_t v7 = swift_getDynamicType();
    uint64_t result = _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v9);
    if (v7 != DynamicType)
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = 0;
      goto LABEL_13;
    }
    ++v5;
    v6 += 40;
    if (v4 == v5) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_75D9F4@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  char v2 = sub_75D81C();
  uint64_t result = swift_release();
  *a1 = v2 & 1;
  return result;
}

uint64_t sub_75DA40(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_FD50((uint64_t *)&unk_965480);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_FD50(&qword_969EE0);
  __chkstk_darwin(v7 - 8);
  long long v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_76BA80();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  char v16 = (char *)&v31 - v15;
  uint64_t v17 = sub_76EFC0();
  unint64_t v19 = v18;
  if (!v18) {
    return 0;
  }
  uint64_t v20 = v17;
  uint64_t v21 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v21 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (v21)
  {
    id v32 = a2;
    uint64_t v33 = a1;
    uint64_t v34 = v11;
    sub_76EFE0();
    uint64_t v22 = sub_76F020();
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v6, 1, v22) == 1)
    {
      sub_14C88((uint64_t)v6, (uint64_t *)&unk_965480);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v9, 1, 1, v10);
    }
    else
    {
      if (qword_94E910 != -1) {
        swift_once();
      }
      uint64_t v24 = (void *)qword_9B1BB0;
      if (qword_94E918 != -1)
      {
        uint64_t v30 = qword_9B1BB0;
        swift_once();
        uint64_t v24 = (void *)v30;
      }
      sub_75E24C(v20, v19, v32, v24, (void *)qword_9B1BB8, (uint64_t)v9);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v22);
      uint64_t v25 = v34;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v9, 1, v10) != 1)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v16, v9, v10);
        sub_FE2C(0, &qword_96D6C0);
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v13, v16, v10);
        uint64_t v20 = sub_77DE40();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v10);
        return v20;
      }
    }
    sub_14C88((uint64_t)v9, &qword_969EE0);
    uint64_t v26 = sub_779970();
    if (v27)
    {
      uint64_t v28 = v26;
      swift_bridgeObjectRelease();
      return v28;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v20;
}

id sub_75DE50(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  if (*a1)
  {
    id v5 = *a1;
  }
  else
  {
    long long v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
    uint64_t v10 = (void *)sub_76E1F0();

    if (!v10) {
      uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
    }
    swift_beginAccess();
    uint64_t v11 = *a1;
    *a1 = v10;
    id v5 = v10;

    uint64_t v4 = 0;
  }
  id v12 = v4;
  return v5;
}

uint64_t sub_75DF30()
{
  uint64_t v0 = sub_77EC00();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v4 = sub_779EE0();
  uint64_t result = 0;
  if (v4)
  {
    sub_779F20();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for FloatingPointRoundingRule.up(_:), v0);
    sub_77E150();
    uint64_t v7 = v6;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return v7;
  }
  return result;
}

uint64_t sub_75E07C(objc_class *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a7 + 32))(a6, a7);
    v13.value.super.Class isa = a1;
    v13.is_nil = 0;
    sub_76E230(v13, v12);

    (*(void (**)(uint64_t, uint64_t))(a7 + 80))(a6, a7);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_75E140(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t *a3@<X8>)
{
  char v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a1, a2);
  swift_getKeyPath();
  sub_7716A0();
  swift_release();
  id v5 = [v4 configurationWithTraitCollection:v7];

  uint64_t v6 = sub_76EA10();
  *a3 = v6;
}

uint64_t sub_75E218(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_75E24C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  long long v65 = a5;
  id v61 = a4;
  uint64_t v63 = a3;
  uint64_t v9 = sub_FD50(&qword_9790E0);
  __chkstk_darwin(v9 - 8);
  uint64_t v67 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_FD50(&qword_9790E8);
  __chkstk_darwin(v11 - 8);
  char v68 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_FD50((uint64_t *)&unk_9790F0);
  uint64_t v66 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v60 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v59 = (uint64_t)&v57 - v15;
  uint64_t v16 = sub_76BAE0();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = sub_76BA80();
  uint64_t v70 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  long long v64 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v57 - v20;
  uint64_t v22 = sub_76F020();
  uint64_t v23 = *(void *)(v22 - 8);
  __n128 v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v27 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v27)
  {
    uint64_t v57 = v17;
    uint64_t v58 = a6;
    uint64_t v28 = 0xD000000000000020;
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v23 + 16))(v26, v62, v22, v24);
    int v29 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v26, v22);
    if (v29 == enum case for SearchEntity.developers(_:))
    {
      uint64_t v30 = "Search.ResultsTitle.InDevelopers";
    }
    else if (v29 == enum case for SearchEntity.stories(_:))
    {
      uint64_t v28 = 0xD00000000000001DLL;
      uint64_t v30 = "Search.ResultsTitle.InStories";
    }
    else if (v29 == enum case for SearchEntity.arcade(_:))
    {
      uint64_t v28 = 0xD00000000000001CLL;
      uint64_t v30 = "Search.ResultsTitle.InArcade";
    }
    else
    {
      if (v29 != enum case for SearchEntity.watch(_:))
      {
        uint64_t result = sub_77EB20();
        __break(1u);
        return result;
      }
      uint64_t v28 = 0xD00000000000001BLL;
      uint64_t v30 = "Search.ResultsTitle.InWatch";
    }
    uint64_t v33 = (void *)((unint64_t)(v30 - 32) | 0x8000000000000000);
    sub_FD50(&qword_971B40);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_78DBA0;
    *(void *)(inited + 32) = 0x745F686372616573;
    *(void *)(inited + 40) = 0xEB000000006D7265;
    *(void *)(inited + 48) = a1;
    *(void *)(inited + 56) = a2;
    swift_bridgeObjectRetain();
    uint64_t v35 = (void *)sub_677330(inited);
    v73._countAndFlagsBits = v28;
    v73._object = v33;
    v36._rawValue = v35;
    sub_770670(v73, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_76BAD0();
    sub_76BA90();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    swift_getKeyPath();
    uint64_t v38 = v63;
    v71[0] = v63;
    sub_22A80();
    id v39 = v38;
    sub_76BA70();
    uint64_t v40 = swift_getKeyPath();
    __chkstk_darwin(v40);
    swift_getKeyPath();
    uint64_t v41 = v65;
    v71[0] = v65;
    sub_5570A8();
    id v42 = v41;
    sub_76BA70();
    id v43 = v64;
    uint64_t v44 = v57;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v64, v21, v57);
    v71[0] = a1;
    v71[1] = a2;
    uint64_t v45 = sub_76BF50();
    uint64_t v46 = (uint64_t)v67;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v67, 1, 1, v45);
    sub_75FEE4((unint64_t *)&unk_979110, (void (*)(uint64_t))&type metadata accessor for AttributedString);
    sub_12D7CC();
    unint64_t v47 = v68;
    sub_76BB70();
    sub_14C88(v46, &qword_9790E0);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v43, v44);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v47, 1, v69) == 1)
    {
      id v48 = &qword_9790E8;
      uint64_t v49 = (uint64_t)v47;
    }
    else
    {
      uint64_t v50 = (uint64_t)v47;
      uint64_t v51 = v59;
      sub_75FA8C(v50, v59);
      uint64_t v52 = v60;
      sub_75FAF4(v51, v60);
      uint64_t v53 = swift_getKeyPath();
      __chkstk_darwin(v53);
      swift_getKeyPath();
      v71[4] = v61;
      id v54 = v61;
      sub_75FB5C();
      double v55 = (void (*)(void *, void))sub_76BAA0();
      sub_76BB00();
      v55(v71, 0);
      sub_14C88(v52, (uint64_t *)&unk_9790F0);
      uint64_t v49 = v51;
      id v48 = (uint64_t *)&unk_9790F0;
    }
    sub_14C88(v49, v48);
    uint64_t v56 = v58;
    (*(void (**)(uint64_t, char *, uint64_t))(v70 + 32))(v58, v21, v44);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v70 + 56))(v56, 0, 1, v44);
  }
  else
  {
    uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v70 + 56);
    return v31(a6, 1, 1, v17, v24);
  }
}

double sub_75EAF0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v74 = a4;
  uint64_t v65 = a3;
  uint64_t v64 = a2;
  uint64_t v68 = sub_77A3E0();
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v66 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_771720();
  uint64_t v73 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v75 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_77B2D0();
  uint64_t v77 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v72 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v82 = (char *)&v58 - v13;
  uint64_t v14 = sub_77B060();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_77B5B0();
  uint64_t v78 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v58 - v21;
  sub_76F010();
  sub_75FEE4((unint64_t *)&qword_969EC0, (void (*)(uint64_t))&type metadata accessor for SearchAction);
  sub_771640();
  uint64_t v23 = (uint64_t)v88;
  if (!v88) {
    return 0.0;
  }
  uint64_t v62 = v19;
  uint64_t v69 = v15;
  uint64_t v70 = v14;
  swift_getKeyPath();
  sub_7716A0();
  swift_release();
  id v24 = v88;
  (*(void (**)(id, uint64_t, uint64_t))(a6 + 64))(v88, a5, a6);

  swift_getKeyPath();
  uint64_t v61 = a1;
  sub_7716A0();
  swift_release();
  uint64_t v25 = (void *)v85;
  sub_77B050();
  sub_77B520();
  sub_FB9C(&v88, v89);
  sub_77B0B0();
  sub_77B030();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v88);
  sub_77B560();
  sub_77AFE0();
  sub_77B540();
  sub_77AFC0();
  sub_77B550();
  sub_77AFD0();
  sub_77B530();
  sub_77AFB0();

  uint64_t v26 = (void *)sub_77B020();
  uint64_t v71 = a5;
  uint64_t v63 = a6;
  uint64_t v27 = (void *)sub_75DA40(v23, v26);
  uint64_t v29 = v28;
  int v31 = v30;
  int v32 = ~(_BYTE)v30;

  if (!v32)
  {
    swift_release();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v17, v70);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v22, v79);
    return 0.0;
  }
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v62, v22, v79);
  uint64_t v59 = v27;
  int v60 = v31;
  if (v31)
  {
    uint64_t v33 = v23;
    sub_48CFAC(v27, v29, 1);
    sub_77B2B0();
    uint64_t v34 = v72;
    sub_77B310();
  }
  else
  {
    uint64_t v33 = v23;
    sub_48CFAC(v27, v29, 0);
    sub_77B2B0();
    uint64_t v34 = v72;
    sub_77B2F0();
  }
  uint64_t v36 = v61;
  uint64_t v37 = v80;
  uint64_t v38 = v77;
  uint64_t v39 = v73;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v82, v34, v80);
  swift_retain();
  uint64_t v40 = sub_779980();
  uint64_t v73 = v33;
  swift_release();
  uint64_t v58 = v29;
  if (!v40)
  {
    uint64_t v41 = v63;
    goto LABEL_12;
  }
  *(void *)&long long v85 = v40;
  uint64_t v41 = v63;
  sub_75E140(v71, v63, (uint64_t *)&v88);
  uint64_t v37 = v80;
  swift_release();
  id v42 = v88;
  if (!v88)
  {
LABEL_12:
    unint64_t v87 = 0;
    long long v85 = 0u;
    long long v86 = 0u;
    goto LABEL_13;
  }
  [v88 size];
  uint64_t v44 = v43;
  uint64_t v46 = v45;

  *((void *)&v86 + 1) = &type metadata for FixedSizedPlaceholder;
  unint64_t v87 = sub_22D20();
  *(void *)&long long v85 = v44;
  *((void *)&v85 + 1) = v46;
LABEL_13:
  uint64_t v47 = v71;
  v84[3] = v37;
  v84[4] = (uint64_t)&protocol witness table for LabelPlaceholder;
  id v48 = sub_FBE0(v84);
  (*(void (**)(uint64_t *, char *, uint64_t))(v38 + 16))(v48, v82, v37);
  swift_getKeyPath();
  sub_7716A0();
  swift_release();
  (*(void (**)(id *__return_ptr, long long *, uint64_t *, uint64_t, uint64_t, uint64_t))(v41 + 48))(&v88, &v85, v84, v83, v47, v41);
  swift_unknownObjectRelease();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v84);
  sub_14C88((uint64_t)&v85, &qword_9541A0);
  uint64_t v49 = v90;
  sub_FB9C(&v88, v89);
  uint64_t v50 = v75;
  uint64_t v51 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v75, v36, v76);
  uint64_t v81 = v49;
  if (v74)
  {
    swift_getKeyPath();
    uint64_t v52 = v66;
    sub_7716A0();
    swift_release();
    sub_77A360();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v68);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v50, v76);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v39 + 8))(v50, v51);
  }
  uint64_t v53 = v59;
  uint64_t v54 = v58;
  swift_getKeyPath();
  sub_7716A0();
  swift_release();
  double v55 = (void *)v85;
  sub_77B980();
  double v35 = v56;

  sub_48CFC4(v53, v54, v60);
  swift_release();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v82, v80);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v17, v70);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v22, v79);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v88);
  return v35;
}

double sub_75F52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_75EAF0(a1, 0, 0, 1, a2, a3);
  return v3;
}

uint64_t sub_75F55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = v3;
  uint64_t v7 = sub_77B5B0();
  uint64_t v36 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_77B060();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76F010();
  sub_75FEE4((unint64_t *)&qword_969EC0, (void (*)(uint64_t))&type metadata accessor for SearchAction);
  uint64_t result = sub_771640();
  uint64_t v15 = v37[0];
  if (v37[0])
  {
    uint64_t v34 = v11;
    uint64_t v35 = v10;
    uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 40);
    uint64_t v16 = (void *)v33(a2, a3);
    sub_77ACF0();

    id v17 = [v4 traitCollection];
    sub_77B050();
    sub_77B520();
    uint64_t v31 = v7;
    int v32 = v4;
    sub_FB9C(v37, v37[3]);
    uint64_t v18 = a3;
    sub_77B0B0();
    sub_77B030();
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v37);
    sub_77B560();
    sub_77AFE0();
    sub_77B540();
    sub_77AFC0();
    sub_77B550();
    sub_77AFD0();
    sub_77B530();
    sub_77AFB0();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v31);
    uint64_t v19 = (void *)sub_77B020();
    uint64_t v20 = (void *)sub_75DA40(v15, v19);
    uint64_t v22 = v21;
    unsigned __int8 v24 = v23;
    LODWORD(v16) = ~v23;

    if (v16)
    {
      uint64_t v25 = v33;
      if (v24)
      {
        sub_48CFAC(v20, v22, 1);
        uint64_t v29 = (void *)v25(a2, v18);
        [v29 setAttributedText:v20];

        sub_48CFC4(v20, v22, v24);
      }
      else
      {
        uint64_t v26 = (void *)v33(a2, v18);
        NSString v27 = sub_77D640();
        [v26 setText:v27];
      }
      sub_48CFC4(v20, v22, v24);
    }
    else
    {
      uint64_t v28 = (void *)v33(a2, v18);
      [v28 setText:0];
    }
    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
    (*(void (**)(uint64_t, uint64_t))(v18 + 80))(a2, v18);
    return swift_release();
  }
  return result;
}

void sub_75F964()
{
}

void sub_75F984()
{
}

uint64_t sub_75F9AC()
{
  return 8;
}

uint64_t sub_75F9B8()
{
  return swift_release();
}

uint64_t sub_75F9C0(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_75F9CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_75D65C(a1, a2, a3, (uint64_t *)&unk_979130) & 1;
}

uint64_t sub_75F9F0(uint64_t a1, uint64_t a2)
{
  return sub_75D6C0(a1, a2, (uint64_t *)&unk_979130);
}

void *sub_75F9FC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_75FA08()
{
}

void sub_75FA28()
{
}

uint64_t sub_75FA50()
{
  return 8;
}

uint64_t sub_75FA5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_75D65C(a1, a2, a3, &qword_979128) & 1;
}

uint64_t sub_75FA80(uint64_t a1, uint64_t a2)
{
  return sub_75D6C0(a1, a2, &qword_979128);
}

uint64_t sub_75FA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_FD50((uint64_t *)&unk_9790F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_75FAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_FD50((uint64_t *)&unk_9790F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_75FB5C()
{
  unint64_t result = qword_979120;
  if (!qword_979120)
  {
    sub_17590((uint64_t *)&unk_9790F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979120);
  }
  return result;
}

void sub_75FBC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  sub_76E300();
  sub_75FEE4((unint64_t *)&qword_957370, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
  sub_76F150();
}

uint64_t sub_75FC78()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_75FCB0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_75FCE8(objc_class *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_75E07C(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_75FCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_76F010();
  sub_75FEE4((unint64_t *)&qword_969EC0, (void (*)(uint64_t))&type metadata accessor for SearchAction);
  uint64_t result = sub_771640();
  if (v14)
  {
    swift_retain();
    uint64_t v7 = sub_779980();
    swift_release();
    if (v7)
    {
      uint64_t v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
      sub_75DF30();
      char v10 = v9;

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = sub_77A050();
        sub_FD50(&qword_951820);
        uint64_t v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_78FCC0;
        *(void *)(v12 + 32) = v11;
        uint64_t v15 = (void *)v12;
        sub_77D8A0();
        swift_retain();
        v13._rawValue = v15;
        sub_76F100(v13);
        swift_release();
        swift_release();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_75FE9C()
{
  return sub_75FEE4(&qword_979140, (void (*)(uint64_t))&type metadata accessor for Shelf);
}

uint64_t sub_75FEE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_75FF30@<X0>(unsigned char *a1@<X8>)
{
  swift_retain();
  char v2 = sub_75D81C();
  uint64_t result = swift_release();
  *a1 = v2 & 1;
  return result;
}

uint64_t type metadata accessor for ArcadeDownloadPackGamesCardView(uint64_t a1)
{
  return sub_76EF4(a1, (uint64_t *)&unk_979230);
}

uint64_t sub_75FFA8()
{
  uint64_t result = sub_779380();
  if (v1 <= 0x3F) {
    return swift_initClassMetadata2();
  }
  return result;
}

uint64_t sub_7600A0(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_77E8B0();
    uint64_t v5 = v4;
    sub_77E950();
    char v6 = sub_77E8D0();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_4CF93C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_7678E4(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_4CF93C(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_767B5C(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_7601B0(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v16 = sub_779A00();
  uint64_t v4 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  char v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    if (!v7) {
      return (uint64_t)v8;
    }
    id v17 = _swiftEmptyArrayStorage;
    uint64_t result = sub_485E30(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v17;
    unint64_t v15 = a1 & 0xC000000000000001;
    v14[0] = v2;
    v14[1] = v4 + 32;
    unint64_t v11 = a1;
    while (v7 != v10)
    {
      if (v15) {
        sub_77EA30();
      }
      else {
        swift_retain();
      }
      sub_779BE0();
      swift_release();
      id v17 = v8;
      unint64_t v13 = v8[2];
      unint64_t v12 = v8[3];
      unint64_t v2 = v13 + 1;
      if (v13 >= v12 >> 1)
      {
        sub_485E30(v12 > 1, v13 + 1, 1);
        uint64_t v8 = v17;
      }
      ++v10;
      v8[2] = v2;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v13, v6, v16);
      a1 = v11;
      if (v7 == v10) {
        return (uint64_t)v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_77EB40();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_7603CC()
{
  return sub_77D5F0() & 1;
}

uint64_t sub_760428()
{
  return sub_77D590();
}

void sub_760470()
{
}

void sub_760498()
{
}

objc_class *sub_7604B4(unint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v101 = a4;
  LODWORD(v95) = a3;
  uint64_t v89 = a2;
  uint64_t v6 = sub_FD50(&qword_9592F0);
  __chkstk_darwin(v6 - 8);
  uint64_t v83 = (uint64_t)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  long long v86 = (char *)&v77 - v9;
  uint64_t v88 = type metadata accessor for ArcadeDownloadPackGamesCardView.DownloadAllButtonConfiguration(0);
  uint64_t v87 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v81 = (uint64_t)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = v10;
  __chkstk_darwin(v11);
  uint64_t v79 = (uint64_t)&v77 - v12;
  uint64_t v98 = sub_779A00();
  uint64_t v94 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  long long v97 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_77D040();
  uint64_t v82 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  unint64_t v15 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_FD50(&qword_9645A0);
  __chkstk_darwin(v16 - 8);
  uint64_t v78 = (uint64_t)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v84 = (uint64_t)&v77 - v19;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v77 - v21;
  uint64_t v100 = sub_779380();
  unsigned __int8 v23 = *(void (***)(void, void, void))(v100 - 8);
  __chkstk_darwin(v100);
  uint64_t v93 = (char *)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  NSString v27 = (char *)&v77 - v26;
  uint64_t v28 = (char **)&v4[qword_9791E8];
  swift_beginAccess();
  uint64_t v29 = *v28;
  uint64_t v30 = *((void *)*v28 + 2);
  uint64_t v90 = v4;
  unint64_t v99 = a1;
  if (v30)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = 32;
    do
    {
      [*(id *)&v29[v31] removeFromSuperview];
      v31 += 16;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
    uint64_t v4 = v90;
    a1 = v99;
  }
  *uint64_t v28 = (char *)_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  int v32 = (unint64_t *)&v4[qword_979200];
  swift_beginAccess();
  *int v32 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_weakAssign();
  v4[qword_979218] = v95 & 1;
  sub_22D74(v89, (uint64_t)v22, &qword_9645A0);
  uint64_t v33 = v87 + 48;
  uint64_t v34 = v88;
  double v91 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48);
  if (v91(v22, 1, v88) == 1)
  {
    sub_14C88((uint64_t)v22, &qword_9645A0);
    ((void (**)(char *, void, uint64_t))v23)[13](v27, enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.chin(_:), v100);
  }
  else
  {
    uint64_t v35 = &v22[*(int *)(v34 + 20)];
    uint64_t v36 = v93;
    uint64_t v37 = v100;
    ((void (**)(char *, char *, uint64_t))v23)[2](v93, v35, v100);
    sub_768308((uint64_t)v22);
    ((void (**)(char *, char *, uint64_t))v23)[4](v27, v36, v37);
  }
  uint64_t v85 = v33;
  sub_761F44((uint64_t)v27);
  sub_76F190();
  uint64_t v100 = sub_779DD0();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_77EB40();
    if (!v38) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v38 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (!v38) {
      goto LABEL_24;
    }
  }
  type metadata accessor for TodayCardLockupView();
  uint64_t result = (objc_class *)swift_getObjCClassFromMetadata();
  Class v95 = result;
  if (v38 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v40 = 0;
  uint64_t v93 = *(char **)&v90[qword_9791E0];
  unint64_t v92 = a1 & 0xC000000000000001;
  uint64_t v41 = (void (**)(char *, uint64_t))(v94 + 8);
  id v42 = (void (**)(char *, uint64_t))(v82 + 8);
  uint64_t v94 = v38;
  do
  {
    if (v92)
    {
      uint64_t v43 = sub_77EA30();
    }
    else
    {
      uint64_t v43 = *(void *)(a1 + 8 * v40 + 32);
      swift_retain();
    }
    uint64_t v44 = (char *)[objc_allocWithZone(v95) init];
    [v93 addSubview:v44];
    uint64_t v45 = v97;
    sub_779BE0();
    uint64_t v46 = sub_7799B0();
    uint64_t v48 = v47;
    (*v41)(v45, v98);
    v103[3] = &type metadata for String;
    v103[0] = v46;
    v103[1] = v48;
    memset(v102, 0, sizeof(v102));
    sub_77D030();
    sub_14C88((uint64_t)v102, (uint64_t *)&unk_951B40);
    sub_14C88((uint64_t)v103, (uint64_t *)&unk_951B40);
    sub_77E240();
    (*v42)(v15, v96);
    sub_765E88(v43, v100, v101);
    uint64_t v49 = qword_94FD50;
    id v50 = *(id *)&v44[OBJC_IVAR____TtC18ASMessagesProvider14BaseLockupView_artworkView];
    if (v49 != -1) {
      swift_once();
    }
    id v51 = (id)qword_9791B0;
    sub_76E190();

    swift_beginAccess();
    uint64_t v52 = *v28;
    uint64_t v53 = v44;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v28 = v52;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v52 = sub_867CC(0, *((void *)v52 + 2) + 1, 1, v52);
      *uint64_t v28 = v52;
    }
    unint64_t v56 = *((void *)v52 + 2);
    unint64_t v55 = *((void *)v52 + 3);
    if (v56 >= v55 >> 1)
    {
      uint64_t v52 = sub_867CC((char *)(v55 > 1), v56 + 1, 1, v52);
      *uint64_t v28 = v52;
    }
    ++v40;
    uint64_t v57 = sub_768528(&qword_979288, (void (*)(uint64_t))type metadata accessor for TodayCardLockupView);
    *((void *)v52 + 2) = v56 + 1;
    uint64_t v58 = &v52[16 * v56];
    *((void *)v58 + 4) = v53;
    *((void *)v58 + 5) = v57;
    swift_endAccess();

    swift_release();
    a1 = v99;
  }
  while (v94 != v40);
LABEL_24:
  swift_bridgeObjectRelease();
  uint64_t v59 = v89;
  uint64_t v60 = v84;
  sub_22D74(v89, v84, &qword_9645A0);
  uint64_t v61 = v88;
  if (v91((char *)v60, 1, v88) == 1)
  {
    sub_14C88(v60, &qword_9645A0);
    uint64_t v62 = v90;
    uint64_t v63 = &v90[qword_9791F8];
    *(void *)uint64_t v63 = static CondensedEditorialSearchResultContentView.prefetchArtwork(for:with:asPartOf:);
    *((void *)v63 + 1) = 0;
  }
  else
  {
    uint64_t v64 = v60;
    uint64_t v65 = v79;
    sub_768364(v64, v79);
    uint64_t v62 = v90;
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakDestroy();
    uint64_t v66 = v81;
    sub_768364(v65, v81);
    unint64_t v67 = (*(unsigned __int8 *)(v87 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
    uint64_t v68 = swift_allocObject();
    *(void *)(v68 + 16) = v101;
    sub_768364(v66, v68 + v67);
    uint64_t v69 = (uint64_t (**)())&v62[qword_9791F8];
    char *v69 = sub_7684C4;
    v69[1] = (uint64_t (*)())v68;
    swift_retain();
  }
  swift_release();
  uint64_t v70 = (uint64_t)v86;
  uint64_t v71 = *(void **)&v62[qword_9791F0];
  sub_77E720();
  uint64_t v72 = sub_77E700();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 48))(v70, 1, v72))
  {
    sub_22D74(v70, v83, &qword_9592F0);
    sub_77E730();
    sub_14C88(v70, &qword_9592F0);
  }
  else
  {
    uint64_t v73 = v78;
    sub_22D74(v59, v78, &qword_9645A0);
    if (v91((char *)v73, 1, v61) == 1)
    {
      sub_14C88(v73, &qword_9645A0);
    }
    else
    {
      swift_retain();
      sub_768308(v73);
      sub_779970();
      swift_release();
    }
    sub_77E6E0();
    sub_77E730();
  }
  NSString v74 = sub_77D640();
  [v71 setAccessibilityIdentifier:v74];

  objc_msgSend(v71, "setHidden:", v91((char *)v59, 1, v61) == 1);
  sub_779DB0();
  uint64_t v75 = sub_7601B0(a1);
  swift_unknownObjectRetain();
  uint64_t v76 = sub_7681A8(v75);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_763E80((uint64_t)v76);
  [v62 setNeedsLayout];
  swift_release();
  return (objc_class *)swift_unknownObjectRelease();
}

void sub_761140()
{
  unint64_t v1 = *(id *)((char *)v0 + qword_9791E0);
  CGAffineTransformMakeScale(&aBlock, 0.9, 0.9);
  [v1 setTransform:&aBlock];
  unint64_t v2 = (char *)v0 + qword_9791E8;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (!v4)
  {
LABEL_15:
    [*(id *)((char *)v0 + qword_9791F0) setAlpha:0.0];
    if (qword_94FD18 != -1) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  uint64_t v17 = v0;
  uint64_t v0 = (id *)(v3 + 32);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = v0[2 * v5];
    id v7 = [v6 subviews];
    sub_FE2C(0, (unint64_t *)&qword_94FFE0);
    unint64_t v8 = sub_77D890();

    if (v8 >> 62) {
      break;
    }
    uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_6;
    }
LABEL_3:
    ++v5;
    swift_bridgeObjectRelease_n();

    if (v5 == v4)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v0 = v17;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_77EB40();
  if (!v9) {
    goto LABEL_3;
  }
LABEL_6:
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v11 = (id)sub_77EA30();
      }
      else {
        id v11 = *(id *)(v8 + 8 * i + 32);
      }
      uint64_t v12 = v11;
      [v11 setAlpha:0.0];
    }
    goto LABEL_3;
  }
  __break(1u);
LABEL_18:
  swift_once();
LABEL_16:
  id v13 = [objc_allocWithZone((Class)UIViewPropertyAnimator) initWithDuration:qword_979148 timingParameters:0.0];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v0;
  *(void *)&aBlock.tx = sub_768168;
  *(void *)&aBlock.ty = v14;
  *(void *)&aBlock.a = _NSConcreteStackBlock;
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_24636C;
  *(void *)&aBlock.d = &unk_8ACB60;
  unint64_t v15 = _Block_copy(&aBlock);
  uint64_t v16 = v0;
  swift_release();
  [v13 addAnimations:v15];
  _Block_release(v15);
  [v13 startAnimationAfterDelay:0.16];
}

uint64_t sub_761464()
{
  uint64_t v1 = sub_FD50((uint64_t *)&unk_951EB0);
  __chkstk_darwin(v1 - 8);
  uint64_t v40 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v33 - v4;
  uint64_t v6 = sub_77CE90();
  id v7 = *(char **)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v41 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = &v0[qword_979200];
  swift_beginAccess();
  uint64_t v10 = *(void *)v9;
  if (*(void *)v9 >> 62) {
    goto LABEL_14;
  }
  uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
  uint64_t result = swift_bridgeObjectRetain_n();
  if (!v11) {
    return swift_bridgeObjectRelease_n();
  }
  while (v11 >= 1)
  {
    id v13 = &v0[qword_9791E8];
    unint64_t v43 = v10 & 0xC000000000000001;
    swift_beginAccess();
    unint64_t v14 = 0;
    id v42 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v37 = (void (**)(char *, char *, uint64_t))(v7 + 16);
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v35 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v36 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
    uint64_t v15 = 32;
    uint64_t v39 = v10;
    uint64_t v34 = v5;
    while (1)
    {
      if (v43)
      {
        uint64_t v16 = sub_77EA30();
      }
      else
      {
        uint64_t v16 = *(void *)(v10 + 8 * v14 + 32);
        swift_retain();
      }
      if (v14 >= *(void *)(*(void *)v13 + 16)) {
        break;
      }
      id v7 = (char *)*(id *)(*(void *)v13 + v15);
      uint64_t v0 = (char *)v16;
      sub_779B60();
      if ((*v42)(v5, 1, v6) == 1)
      {

        sub_14C88((uint64_t)v5, (uint64_t *)&unk_951EB0);
      }
      else
      {
        uint64_t v17 = v41;
        (*v38)(v41, v5, v6);
        id v7 = v7;
        [v7 bounds];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        id v26 = [self blueColor];
        id v27 = objc_allocWithZone((Class)type metadata accessor for ImpressionMetricsDebugOverlay());
        uint64_t v0 = sub_70A1F4(v26, v19, v21, v23, v25);
        uint64_t v28 = v13;
        uint64_t v29 = v11;
        uint64_t v30 = (uint64_t)v40;
        (*v37)(v40, v17, v6);
        (*v36)(v30, 0, 1, v6);
        sub_709DEC(v30);
        sub_14C88(v30, (uint64_t *)&unk_951EB0);
        id v31 = [v7 viewWithTag:58236912];
        [v31 removeFromSuperview];

        uint64_t v11 = v29;
        id v13 = v28;
        uint64_t v5 = v34;
        [v7 addSubview:v0];

        int v32 = v17;
        uint64_t v10 = v39;
        (*v35)(v32, v6);
      }
      swift_release();
      ++v14;
      v15 += 16;
      if (v11 == v14) {
        return swift_bridgeObjectRelease_n();
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_77EB40();
    uint64_t v11 = result;
    if (!result) {
      return swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
  return result;
}

id sub_7618B4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (char **)&v1[qword_9791E8];
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = *((void *)*v4 + 2);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = 32;
    do
    {
      [*(id *)&v5[v7] removeFromSuperview];
      v7 += 16;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  *uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v8 = &v2[qword_979200];
  swift_beginAccess();
  *(void *)uint64_t v8 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  id result = (id)sub_763E80((uint64_t)_swiftEmptyArrayStorage);
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for ArcadeDownloadPackGameLockupPlaceholder();
      uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      do
      {
        uint64_t v11 = (char *)[objc_allocWithZone(ObjCClassFromMetadata) init];
        if (qword_94FD50 != -1) {
          swift_once();
        }
        id v12 = (id)qword_9791B0;
        sub_76E150();
        [*(id *)&v11[OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder] setTextColor:v12];
        [*(id *)&v11[OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder] setTextColor:v12];
        [*(id *)&v11[OBJC_IVAR____TtC18ASMessagesProvider39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder] setBackgroundColor:v12];
        [v2 addSubview:v11];
        swift_beginAccess();
        id v13 = *v4;
        unint64_t v14 = v11;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v4 = v13;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          id v13 = sub_867CC(0, *((void *)v13 + 2) + 1, 1, v13);
          *uint64_t v4 = v13;
        }
        unint64_t v17 = *((void *)v13 + 2);
        unint64_t v16 = *((void *)v13 + 3);
        if (v17 >= v16 >> 1)
        {
          id v13 = sub_867CC((char *)(v16 > 1), v17 + 1, 1, v13);
          *uint64_t v4 = v13;
        }
        uint64_t v18 = sub_768528(&qword_9792A0, (void (*)(uint64_t))type metadata accessor for ArcadeDownloadPackGameLockupPlaceholder);
        *((void *)v13 + 2) = v17 + 1;
        double v19 = &v13[16 * v17];
        *((void *)v19 + 4) = v14;
        *((void *)v19 + 5) = v18;
        swift_endAccess();

        --a1;
      }
      while (a1);
    }
    [*(id *)&v2[qword_9791F0] setHidden:1];
    return [v2 setNeedsLayout];
  }
  return result;
}

id sub_761BA8()
{
  id result = objc_msgSend(objc_allocWithZone((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 150.0, 25.0, 0.0, 0.0);
  qword_979148 = (uint64_t)result;
  return result;
}

double sub_761BF8()
{
  double result = 8.0;
  xmmword_979150 = xmmword_7BE490;
  *(_OWORD *)&qword_979160 = xmmword_7BE490;
  return result;
}

void sub_761C10()
{
  qword_979170 = 0x4028000000000000;
}

double sub_761C20()
{
  double result = 21.0;
  xmmword_979178 = xmmword_7BE4A0;
  *(_OWORD *)&qword_979188 = xmmword_7BE4B0;
  return result;
}

id sub_761C40()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.450980392 blue:0.333333333 alpha:1.0];
  qword_979198 = (uint64_t)result;
  return result;
}

id sub_761C90()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.764705882 green:0.133333333 blue:0.180392157 alpha:1.0];
  qword_9791A0 = (uint64_t)result;
  return result;
}

void sub_761CE8()
{
  qword_9791A8 = 0x402C000000000000;
}

void sub_761CF8(uint64_t a1)
{
}

id sub_761D18()
{
  id result = [self whiteColor];
  qword_9791B8 = (uint64_t)result;
  return result;
}

void sub_761D54(uint64_t a1)
{
}

void sub_761D70(uint64_t a1)
{
}

void sub_761D8C(double a1, uint64_t a2, SEL *a3, void *a4)
{
  id v6 = [self *a3];
  id v7 = [v6 colorWithAlphaComponent:a1];

  *a4 = v7;
}

uint64_t (*sub_761E08(uint64_t a1))(void *a1)
{
  uint64_t v3 = sub_779380();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __n128 v6 = __chkstk_darwin(v3);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3, v6);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  *(void *)(v8 + ((v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8)) = v1;
  return sub_768710;
}

uint64_t sub_761F44(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = (uint64_t)&v1[qword_9791D0];
  swift_beginAccess();
  uint64_t v5 = sub_779380();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(v4, a1, v5);
  swift_endAccess();
  unint64_t v7 = *(void **)&v1[qword_9791F0];
  v11[4] = sub_761E08(v4);
  void v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_12269C;
  v11[3] = &unk_8ACC50;
  uint64_t v9 = _Block_copy(v11);
  swift_release();
  [v7 setConfigurationUpdateHandler:v9];
  _Block_release(v9);
  [v2 setNeedsLayout];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
}

char *sub_7620C8(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_FD50(&qword_9592F0);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = &v5[qword_9791D0];
  uint64_t v15 = enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.chin(_:);
  uint64_t v16 = sub_779380();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  unint64_t v17 = &v5[qword_9B4D20];
  *(_OWORD *)unint64_t v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  *((void *)v17 + 4) = 0;
  uint64_t v18 = qword_9791D8;
  id v19 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  double v20 = v5;
  *(void *)&v5[v18] = [v19 init];
  uint64_t v21 = qword_9791E0;
  *(void *)&v20[v21] = [objc_allocWithZone((Class)UIView) init];
  *(void *)&v20[qword_9791E8] = _swiftEmptyArrayStorage;
  uint64_t v22 = qword_9791F0;
  *(void *)&v20[v22] = [self buttonWithType:0];
  double v23 = &v20[qword_9791F8];
  *(void *)double v23 = static CondensedEditorialSearchResultContentView.prefetchArtwork(for:with:asPartOf:);
  *((void *)v23 + 1) = 0;
  *(void *)&v20[qword_979200] = _swiftEmptyArrayStorage;
  swift_weakInit();
  *(void *)&v20[qword_979210] = _swiftEmptyArrayStorage;
  v20[qword_979218] = 0;
  *(void *)&v20[qword_979220] = 0;
  v20[qword_9B4D28] = 0;
  double v24 = &v20[qword_979228];
  *(void *)double v24 = 0;
  v24[8] = 1;

  v46.receiver = v20;
  v46.super_class = ObjectType;
  id v25 = objc_msgSendSuper2(&v46, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v26 = qword_94FD48;
  id v27 = (char *)v25;
  if (v26 != -1) {
    swift_once();
  }
  [v27 _setCornerRadius:*(double *)&qword_9791A8];
  [v27 setClipsToBounds:1];
  uint64_t v28 = *(void **)&v27[qword_9791D8];
  [v27 addSubview:v28];
  [v27 addSubview:*(void *)&v27[qword_9791E0]];
  uint64_t v29 = qword_9791F0;
  [v27 addSubview:*(void *)&v27[qword_9791F0]];
  sub_FD50(&qword_951820);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_78DB90;
  uint64_t v31 = qword_94FD38;
  int v32 = v28;
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v33 = (void *)qword_979198;
  *(void *)(v30 + 32) = qword_979198;
  uint64_t v34 = qword_94FD40;
  id v35 = v33;
  if (v34 != -1) {
    swift_once();
  }
  uint64_t v36 = (void *)qword_9791A0;
  *(void *)(v30 + 40) = qword_9791A0;
  uint64_t v45 = v30;
  sub_77D8A0();
  *(void *)&v32[OBJC_IVAR____TtC18ASMessagesProvider12GradientView_colors] = v45;
  id v37 = v36;
  swift_bridgeObjectRelease();
  sub_4B29E8();

  uint64_t v38 = *(void **)&v27[v29];
  [v38 addTarget:v27 action:"didTapDownloadAllButton" forControlEvents:64];
  sub_77E6F0();
  uint64_t v39 = sub_77E700();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v13, 0, 1, v39);
  sub_77E730();
  id v40 = [v38 layer];
  [v40 setCompositingFilter:kCAFilterPlusL];

  [*(id *)&v27[v29] setOverrideUserInterfaceStyle:2];
  id v41 = [v27 layer];
  [v41 setAllowsGroupBlending:0];

  id v42 = *(id *)&v27[v29];
  [v42 setHidden:1];

  return v27;
}

char *sub_7625D4(double a1, double a2, double a3, double a4)
{
  return sub_7620C8(a1, a2, a3, a4);
}

void sub_7625F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_768D88();
}

void sub_762620()
{
  uint64_t v1 = v0 + qword_9791D0;
  uint64_t v2 = sub_779380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_14C88(v0 + qword_9B4D20, &qword_962220);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  id v3 = *(void **)(v0 + qword_979220);
}

id sub_762738()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = *(void *)&v0[qword_979210];
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = v2 + 40;
    do
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_76D350();
      swift_unknownObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  v6.receiver = v0;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "dealloc");
}

id sub_7627FC(void *a1)
{
  id v1 = a1;
  return sub_762738();
}

void sub_762824(uint64_t a1)
{
  uint64_t v2 = a1 + qword_9791D0;
  uint64_t v3 = sub_779380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  sub_14C88(a1 + qword_9B4D20, &qword_962220);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + qword_979220);
}

uint64_t sub_762940()
{
  uint64_t v1 = sub_76D210();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v37 - v6;
  uint64_t v8 = sub_FD50(&qword_969DF0);
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v57 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = qword_979210;
  uint64_t v46 = v0;
  uint64_t v11 = *(void *)(v0 + qword_979210);
  int64_t v12 = *(void *)(v11 + 16);
  id v13 = _swiftEmptyArrayStorage;
  if (!v12) {
    goto LABEL_31;
  }
  uint64_t v58 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_485DE0(0, v12, 0);
  uint64_t v53 = (uint64_t (**)(char *, uint64_t))(v2 + 88);
  uint64_t v54 = (void (**)(char *, char *, uint64_t))(v2 + 16);
  int v52 = enum case for LegacyAppState.waiting(_:);
  int v49 = enum case for LegacyAppState.updatable(_:);
  int v50 = enum case for LegacyAppState.purchased(_:);
  int v47 = enum case for LegacyAppState.downloadable(_:);
  int v44 = enum case for LegacyAppState.paused(_:);
  int v41 = enum case for LegacyAppState.installing(_:);
  int v42 = enum case for LegacyAppState.downloading(_:);
  int v39 = enum case for LegacyAppState.buyable(_:);
  int v40 = enum case for LegacyAppState.openable(_:);
  unint64_t v55 = (void (**)(char *, uint64_t))(v2 + 8);
  int v38 = enum case for LegacyAppState.installed(_:);
  id v51 = (void (**)(char *, uint64_t))(v2 + 96);
  uint64_t v43 = v11;
  uint64_t v14 = v11 + 40;
  int v37 = enum case for LegacyAppState.unknown(_:);
  int v48 = enum case for PurchaseType.preorder(_:);
  do
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_76D390();
    sub_76D360();
    (*v54)(v4, v7, v1);
    int v15 = (*v53)(v4, v1);
    if (v15 == v52)
    {
      (*v51)(v4, v1);
      uint64_t v16 = sub_770AE0();
LABEL_5:
      (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v4, v16);
LABEL_6:
      char v17 = 0;
      goto LABEL_14;
    }
    if (v15 == v50)
    {
      (*v51)(v4, v1);
      uint64_t v18 = sub_76EF20();
      uint64_t v19 = *(void *)(v18 - 8);
      int v20 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v4, v18);
      if (v20 != v48)
      {
        (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v18);
        goto LABEL_6;
      }
    }
    else if (v15 == v49 || v15 == v47)
    {
      (*v51)(v4, v1);
      swift_bridgeObjectRelease();
    }
    else if (v15 == v44)
    {
      (*v51)(v4, v1);
      uint64_t v24 = sub_76D1A0();
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 8))(v4, v24);
    }
    else
    {
      if (v15 == v42 || v15 == v41)
      {
        (*v51)(v4, v1);
        uint64_t v16 = sub_76D1A0();
        goto LABEL_5;
      }
      if (v15 == v40)
      {
        (*v51)(v4, v1);

        uint64_t v16 = sub_773030();
        goto LABEL_5;
      }
      if (v15 != v39)
      {
        if (v15 == v38) {
          goto LABEL_6;
        }
        if (v15 != v37)
        {
          (*v55)(v4, v1);
          goto LABEL_6;
        }
      }
    }
    char v17 = 1;
LABEL_14:
    uint64_t v21 = *(int *)(v57 + 48);
    (*v55)(v7, v1);
    swift_unknownObjectRelease();
    v10[v21] = v17;
    id v13 = v58;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_485DE0(0, v13[2] + 1, 1);
      id v13 = v58;
    }
    unint64_t v23 = v13[2];
    unint64_t v22 = v13[3];
    if (v23 >= v22 >> 1)
    {
      sub_485DE0(v22 > 1, v23 + 1, 1);
      id v13 = v58;
    }
    _OWORD v13[2] = v23 + 1;
    sub_146D8((uint64_t)v10, (uint64_t)v13+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v23, &qword_969DF0);
    v14 += 16;
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
LABEL_31:
  if (v13[2])
  {
    sub_FD50(&qword_963898);
    id v25 = (void *)sub_77EB90();
  }
  else
  {
    id v25 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v26 = v46;
  uint64_t v58 = v25;
  uint64_t v27 = swift_bridgeObjectRetain();
  sub_767BE4(v27, 1, &v58);
  uint64_t v28 = swift_allocObject();
  swift_bridgeObjectRelease();
  *(void *)(v28 + 16) = v58;
  uint64_t v29 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v28;
  *(void *)(v30 + 24) = v29;
  swift_retain();
  uint64_t v31 = swift_retain();
  sub_7634F0(v31, v29);
  swift_release();
  uint64_t v32 = *(void *)(v26 + v45);
  uint64_t v33 = *(void *)(v32 + 16);
  if (v33)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v57 = v32;
    uint64_t v34 = v32 + 40;
    do
    {
      swift_getObjectType();
      id v35 = (void *)swift_allocObject();
      v35[2] = v28;
      v35[3] = sub_768620;
      v35[4] = v30;
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      sub_76D330();
      swift_unknownObjectRelease();
      swift_release();
      v34 += 16;
      --v33;
    }
    while (v33);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_release();
    return swift_release();
  }
}

uint64_t sub_763154()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_76D210();
  uint64_t v3 = *(void *)(v2 - 8);
  __n128 v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16))(v6, v1, v2, v4);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v7 == enum case for LegacyAppState.waiting(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
    uint64_t v8 = sub_770AE0();
LABEL_3:
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    return 0;
  }
  if (v7 == enum case for LegacyAppState.purchased(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
    uint64_t v10 = sub_76EF20();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t))(v11 + 88))(v6, v10) != enum case for PurchaseType.preorder(_:))
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
      return 0;
    }
  }
  else if (v7 == enum case for LegacyAppState.updatable(_:) || v7 == enum case for LegacyAppState.downloadable(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else if (v7 == enum case for LegacyAppState.paused(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
    uint64_t v12 = sub_76D1A0();
    (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v6, v12);
  }
  else
  {
    if (v7 == enum case for LegacyAppState.downloading(_:) || v7 == enum case for LegacyAppState.installing(_:))
    {
      (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);
      uint64_t v8 = sub_76D1A0();
      goto LABEL_3;
    }
    if (v7 == enum case for LegacyAppState.openable(_:))
    {
      (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v2);

      uint64_t v8 = sub_773030();
      goto LABEL_3;
    }
    if (v7 != enum case for LegacyAppState.buyable(_:))
    {
      if (v7 == enum case for LegacyAppState.installed(_:)) {
        return 0;
      }
      if (v7 != enum case for LegacyAppState.unknown(_:))
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        return 0;
      }
    }
  }
  return 1;
}

void sub_7634F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_FD50(&qword_979290);
  __chkstk_darwin(v4);
  uint64_t v6 = &v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v9 = &v33[-v8];
  uint64_t v35 = a2 + 16;
  swift_beginAccess();
  uint64_t v10 = swift_bridgeObjectRetain();
  int v34 = sub_7638C0(v10);
  uint64_t v11 = *(void *)(a1 + 16);
  swift_bridgeObjectRelease();
  uint64_t v12 = v11 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v11 + 64);
  int64_t v36 = (unint64_t)(v13 + 63) >> 6;
  swift_bridgeObjectRetain_n();
  int64_t v16 = 0;
  while (v15)
  {
    unint64_t v17 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v18 = v17 | (v16 << 6);
LABEL_5:
    uint64_t v19 = *(void *)(v11 + 48);
    uint64_t v20 = sub_779A00();
    (*(void (**)(unsigned char *, unint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v9, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v18, v20);
    v9[*(int *)(v4 + 48)] = *(unsigned char *)(*(void *)(v11 + 56) + v18);
    sub_146D8((uint64_t)v9, (uint64_t)v6, &qword_979290);
    int v21 = v6[*(int *)(v4 + 48)];
    sub_14C88((uint64_t)v6, &qword_979290);
    if (v21 == 1)
    {
      uint64_t v25 = 1;
      goto LABEL_27;
    }
  }
  int64_t v22 = v16 + 1;
  if (__OFADD__(v16, 1))
  {
    __break(1u);
LABEL_40:
    __break(1u);
    return;
  }
  if (v22 >= v36) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v12 + 8 * v22);
  ++v16;
  if (v23) {
    goto LABEL_24;
  }
  int64_t v16 = v22 + 1;
  if (v22 + 1 >= v36) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v12 + 8 * v16);
  if (v23) {
    goto LABEL_24;
  }
  int64_t v16 = v22 + 2;
  if (v22 + 2 >= v36) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v12 + 8 * v16);
  if (v23) {
    goto LABEL_24;
  }
  int64_t v16 = v22 + 3;
  if (v22 + 3 >= v36) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v12 + 8 * v16);
  if (v23) {
    goto LABEL_24;
  }
  int64_t v16 = v22 + 4;
  if (v22 + 4 >= v36) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v12 + 8 * v16);
  if (v23)
  {
LABEL_24:
    unint64_t v15 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v16 << 6);
    goto LABEL_5;
  }
  int64_t v24 = v22 + 5;
  if (v24 < v36)
  {
    unint64_t v23 = *(void *)(v12 + 8 * v24);
    if (!v23)
    {
      while (1)
      {
        int64_t v16 = v24 + 1;
        if (__OFADD__(v24, 1)) {
          goto LABEL_40;
        }
        if (v16 >= v36) {
          goto LABEL_26;
        }
        unint64_t v23 = *(void *)(v12 + 8 * v16);
        ++v24;
        if (v23) {
          goto LABEL_24;
        }
      }
    }
    int64_t v16 = v24;
    goto LABEL_24;
  }
LABEL_26:
  uint64_t v25 = 0;
LABEL_27:
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v27 = (void *)Strong;
    id v28 = *(id *)(Strong + qword_9791F0);

    [v28 setEnabled:v25];
  }
  swift_beginAccess();
  uint64_t v29 = swift_unknownObjectWeakLoadStrong();
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = v29 + qword_9B4D20;
    swift_beginAccess();
    if (*(void *)(v31 + 24))
    {
      sub_145F4(v31, (uint64_t)v37);

      sub_FB9C(v37, v37[3]);
      if (v25) {
        unsigned __int8 v32 = 1;
      }
      else {
        unsigned __int8 v32 = 2;
      }
      if (v34) {
        unsigned __int8 v32 = 0;
      }
      sub_32CC80(v32);
      _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v37);
    }
    else
    {
    }
  }
}

uint64_t sub_7638C0(uint64_t a1)
{
  uint64_t v43 = sub_FD50(&qword_979290);
  __chkstk_darwin(v43);
  int v42 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int v41 = (char *)&v36 - v4;
  __chkstk_darwin(v5);
  uint64_t v40 = (uint64_t)&v36 - v6;
  __chkstk_darwin(v7);
  int v39 = (char *)&v36 - v8;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v37 = a1 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v38 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v44 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v14 = 0;
  unint64_t v15 = v41;
  while (1)
  {
    if (v12)
    {
      uint64_t v45 = (v12 - 1) & v12;
      int64_t v46 = v14;
      unint64_t v16 = __clz(__rbit64(v12)) | (v14 << 6);
      goto LABEL_5;
    }
    int64_t v31 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v31 >= v38) {
      goto LABEL_24;
    }
    unint64_t v32 = *(void *)(v37 + 8 * v31);
    int64_t v33 = v14 + 1;
    if (!v32)
    {
      int64_t v33 = v14 + 2;
      if (v14 + 2 >= v38) {
        goto LABEL_24;
      }
      unint64_t v32 = *(void *)(v37 + 8 * v33);
      if (!v32)
      {
        int64_t v33 = v14 + 3;
        if (v14 + 3 >= v38) {
          goto LABEL_24;
        }
        unint64_t v32 = *(void *)(v37 + 8 * v33);
        if (!v32)
        {
          int64_t v33 = v14 + 4;
          if (v14 + 4 >= v38) {
            goto LABEL_24;
          }
          unint64_t v32 = *(void *)(v37 + 8 * v33);
          if (!v32)
          {
            uint64_t v34 = v14 + 5;
            if (v14 + 5 >= v38)
            {
LABEL_24:
              uint64_t v35 = 1;
              goto LABEL_25;
            }
            unint64_t v32 = *(void *)(v37 + 8 * v34);
            if (!v32)
            {
              while (1)
              {
                int64_t v33 = v34 + 1;
                if (__OFADD__(v34, 1)) {
                  goto LABEL_27;
                }
                if (v33 >= v38) {
                  goto LABEL_24;
                }
                unint64_t v32 = *(void *)(v37 + 8 * v33);
                ++v34;
                if (v32) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v33 = v14 + 5;
          }
        }
      }
    }
LABEL_22:
    uint64_t v45 = (v32 - 1) & v32;
    int64_t v46 = v33;
    unint64_t v16 = __clz(__rbit64(v32)) + (v33 << 6);
LABEL_5:
    uint64_t v17 = v44;
    uint64_t v18 = *(void *)(v44 + 48);
    uint64_t v19 = sub_779A00();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = v20;
    uint64_t v22 = v18 + *(void *)(v20 + 72) * v16;
    unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    int64_t v24 = v39;
    v23(v39, v22, v19);
    uint64_t v25 = v43;
    v24[*(int *)(v43 + 48)] = *(unsigned char *)(*(void *)(v17 + 56) + v16);
    uint64_t v26 = (uint64_t)v24;
    uint64_t v27 = v40;
    sub_146D8(v26, v40, &qword_979290);
    uint64_t v28 = *(int *)(v25 + 48);
    v23(v15, v27, v19);
    LOBYTE(v23) = *(unsigned char *)(v27 + v28);
    v15[v28] = (char)v23;
    uint64_t v29 = *(int *)(v25 + 48);
    uint64_t v30 = (uint64_t)v42;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v42, v15, v19);
    *(unsigned char *)(v30 + v29) = (_BYTE)v23;
    sub_14C88(v30, &qword_979290);
    uint64_t result = sub_14C88(v27, &qword_979290);
    int64_t v14 = v46;
    unint64_t v12 = v45;
    if ((v23 & 1) == 0)
    {
      uint64_t v35 = 0;
LABEL_25:
      swift_release();
      return v35;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_763C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v19 = a5;
  uint64_t v20 = a4;
  uint64_t v6 = sub_76D210();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_779A00();
  uint64_t v10 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  unint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_76D390();
  sub_76D360();
  char v13 = sub_763154();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *(void *)(a3 + 16);
  *(void *)(a3 + 16) = 0x8000000000000000;
  sub_37170C(v13 & 1, (uint64_t)v12, isUniquelyReferenced_nonNull_native);
  *(void *)(a3 + 16) = v21;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v18);
  uint64_t v15 = swift_endAccess();
  return v20(v15);
}

uint64_t sub_763E80(uint64_t a1)
{
  uint64_t v3 = qword_979210;
  uint64_t v4 = *(void *)(v1 + qword_979210);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = v4 + 40;
    do
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_76D350();
      swift_unknownObjectRelease();
      v6 += 16;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  *(void *)(v1 + v3) = a1;
  swift_bridgeObjectRelease();

  return sub_762940();
}

uint64_t sub_763F48(void *a1, uint64_t a2)
{
  uint64_t v74 = a2;
  uint64_t v3 = sub_FD50((uint64_t *)&unk_96E2A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v72 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_77BCC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v71 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v57 - v9;
  uint64_t v11 = sub_FD50(&qword_9664A0);
  __chkstk_darwin(v11 - 8);
  uint64_t v69 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = (void (*)(char *, uint64_t))sub_77E690();
  uint64_t v66 = *((void *)v13 - 1);
  unint64_t v67 = v13;
  __chkstk_darwin(v13);
  uint64_t v65 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_779380();
  uint64_t v73 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v68 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v57 - v18;
  uint64_t v20 = sub_FD50(&qword_9592F0);
  __chkstk_darwin(v20 - 8);
  uint64_t v70 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  int64_t v24 = (char *)&v57 - v23;
  uint64_t v25 = sub_77E700();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v57 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77E720();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1) {
    return sub_14C88((uint64_t)v24, &qword_9592F0);
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
  uint64_t v30 = (char *)[a1 state];
  uint64_t v63 = v6;
  uint64_t v64 = v5;
  uint64_t v61 = a1;
  uint64_t v62 = v10;
  if (v30 == (unsigned char *)&def_270DE0 + 2)
  {
    if (qword_94FD68 != -1) {
      swift_once();
    }
    id v60 = (id)sub_77E450();
    if (qword_94FD60 != -1) {
      swift_once();
    }
    int64_t v31 = &qword_9791C0;
    goto LABEL_18;
  }
  if (v30 == (unsigned char *)&def_270DE0 + 1)
  {
    if (qword_94FD68 != -1) {
      swift_once();
    }
    id v60 = (id)sub_77E450();
    if (qword_94FD58 == -1) {
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_94FD68 != -1) {
      swift_once();
    }
    uint64_t v32 = qword_94FD58;
    id v60 = (id)qword_9791C8;
    if (v32 == -1) {
      goto LABEL_17;
    }
  }
  swift_once();
LABEL_17:
  int64_t v31 = &qword_9791B8;
LABEL_18:
  int64_t v33 = (void *)*v31;
  uint64_t v34 = v73;
  uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v73 + 16);
  v59(v19, v74, v15);
  uint64_t v58 = *(uint64_t (**)(char *, uint64_t))(v34 + 88);
  int v35 = v58(v19, v15);
  int v36 = enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.chin(_:);
  if (v35 == enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.chin(_:))
  {
    uint64_t v37 = qword_94FD30;
    id v38 = v33;
    if (v37 != -1) {
      swift_once();
    }
    sub_77E610();
  }
  else if (v35 == enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.withinLockups(_:))
  {
    (*(void (**)(char *, void, void (*)(char *, uint64_t)))(v66 + 104))(v65, enum case for UIButton.Configuration.Size.large(_:), v67);
    id v39 = v33;
    sub_77E5B0();
  }
  else
  {
    unint64_t v67 = *(void (**)(char *, uint64_t))(v73 + 8);
    id v40 = v33;
    v67(v19, v15);
  }
  uint64_t v41 = swift_allocObject();
  int v42 = v61;
  *(void *)(v41 + 16) = v33;
  *(void *)(v41 + 24) = v42;
  unint64_t v67 = v33;
  v42;
  uint64_t v43 = v69;
  sub_77C080();
  uint64_t v44 = sub_77C070();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v43, 0, 1, v44);
  sub_77E680();
  uint64_t v45 = v62;
  sub_77E590();
  int64_t v46 = v68;
  v59(v68, v74, v15);
  int v47 = v58(v46, v15);
  if (v47 == v36)
  {
    sub_77BC70();
    uint64_t v49 = v63;
    uint64_t v48 = v64;
  }
  else
  {
    uint64_t v49 = v63;
    uint64_t v48 = v64;
    if (v47 == enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.withinLockups(_:))
    {
      if (qword_94FD48 != -1) {
        swift_once();
      }
      sub_77BC70();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v73 + 8))(v46, v15);
    }
  }
  int v50 = v45;
  uint64_t v51 = swift_allocObject();
  int v52 = v60;
  *(void *)(v51 + 16) = v60;
  id v53 = v52;
  uint64_t v54 = v72;
  sub_77BE80();
  uint64_t v55 = sub_77BE70();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v54, 0, 1, v55);
  sub_77BCB0();
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v71, v50, v48);
  sub_77E5A0();
  uint64_t v56 = v70;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v70, v28, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v56, 0, 1, v25);
  sub_77E730();

  (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v48);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v28, v25);
}

uint64_t sub_764880@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_76BAE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a4, a1, v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_5570A8();
  id v9 = a2;
  sub_76BAC0();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_FE2C(0, (unint64_t *)&qword_951810);
  if (qword_94F388 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_77AC40();
  sub_FDF4(v10, (uint64_t)qword_9B3958);
  id v11 = objc_msgSend(a3, "traitCollection", KeyPath);
  sub_77E1E0();

  sub_22A80();
  sub_76BAC0();
  uint64_t v12 = swift_getKeyPath();
  __chkstk_darwin(v12);
  swift_getKeyPath();
  if (qword_94D6D8 != -1) {
    swift_once();
  }
  char v13 = (void *)qword_9AE010;
  sub_549C78();
  id v14 = v13;
  return sub_76BAC0();
}

uint64_t sub_764AC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_77ADF0();
  uint64_t v69 = *(void *)(v3 - 8);
  uint64_t v70 = v3;
  __chkstk_darwin(v3);
  uint64_t v66 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v67 = (char *)&v55 - v6;
  uint64_t v58 = sub_77B870();
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v57 = (double (**)(double, double))((char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  uint64_t v55 = (double (**)(double, double))((char *)&v55 - v9);
  __chkstk_darwin(v10);
  uint64_t v62 = (double (**)(double, double))((char *)&v55 - v11);
  __chkstk_darwin(v12);
  id v14 = (double (**)(double, double))((char *)&v55 - v13);
  uint64_t v61 = sub_77B880();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v59 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_779380();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v55 - v21;
  uint64_t v65 = sub_77AEC0();
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  int64_t v24 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77AEA0();
  swift_beginAccess();
  uint64_t v25 = swift_bridgeObjectRetain();
  uint64_t v63 = sub_142160(v25);
  swift_bridgeObjectRelease();
  uint64_t v71 = v1;
  uint64_t v26 = v1 + qword_9791D0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v22, v26, v16);
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.withinLockups(_:), v16);
  sub_768528(&qword_9792A8, (void (*)(uint64_t))&type metadata accessor for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle);
  sub_77D860();
  sub_77D860();
  if ((void)v74 == v72 && *((void *)&v74 + 1) == *(void *)&v73[0])
  {
    swift_bridgeObjectRelease_n();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v17 + 8);
    v27(v19, v16);
    v27(v22, v16);
  }
  else
  {
    char v28 = sub_77EC30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v29 = *(void (**)(char *, uint64_t))(v17 + 8);
    v29(v19, v16);
    v29(v22, v16);
    if ((v28 & 1) == 0)
    {
LABEL_6:
      int64_t v31 = (char *)v63;
      goto LABEL_12;
    }
  }
  uint64_t v30 = *(void **)(v71 + qword_9791F0);
  if ([v30 isHidden]) {
    goto LABEL_6;
  }
  uint64_t v75 = sub_FE2C(0, (unint64_t *)&qword_95C580);
  uint64_t v76 = &protocol witness table for UIButton;
  *(void *)&long long v74 = v30;
  char *v14 = sub_769558;
  v14[1] = 0;
  uint64_t v32 = *(void (**)(double (**)(double, double), uint64_t, uint64_t))(v56 + 104);
  uint64_t v33 = v58;
  v32(v14, enum case for Resize.Rule.recalculated(_:), v58);
  uint64_t v34 = enum case for Resize.Rule.unchanged(_:);
  v32(v62, enum case for Resize.Rule.unchanged(_:), v33);
  v32(v55, v34, v33);
  v32(v57, v34, v33);
  id v35 = v30;
  int v36 = v59;
  sub_77B890();
  int64_t v31 = (char *)v63;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int64_t v31 = sub_87630(0, *((void *)v31 + 2) + 1, 1, v31);
  }
  unint64_t v38 = *((void *)v31 + 2);
  unint64_t v37 = *((void *)v31 + 3);
  if (v38 >= v37 >> 1) {
    int64_t v31 = sub_87630((char *)(v37 > 1), v38 + 1, 1, v31);
  }
  uint64_t v39 = v61;
  uint64_t v75 = v61;
  uint64_t v76 = &protocol witness table for Resize;
  id v40 = sub_FBE0((uint64_t *)&v74);
  uint64_t v41 = v60;
  (*(void (**)(uint64_t *, char *, uint64_t))(v60 + 16))(v40, v36, v39);
  *((void *)v31 + 2) = v38 + 1;
  sub_146C0(&v74, (uint64_t)&v31[40 * v38 + 32]);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v39);
LABEL_12:
  uint64_t v42 = *((void *)v31 + 2);
  swift_bridgeObjectRetain();
  if (v42)
  {
    uint64_t v43 = 0;
    uint64_t v44 = (uint64_t)(v31 + 32);
    do
    {
      sub_145F4(v44, (uint64_t)v73);
      *(void *)&long long v74 = v43;
      sub_146C0(v73, (uint64_t)&v74 + 8);
      sub_76543C(v43, (uint64_t)&v74 + 8, (uint64_t)v24, v42, ObjectType);
      sub_14C88((uint64_t)&v74, &qword_9792B0);
      v44 += 40;
      ++v43;
    }
    while (v42 != v43);
  }
  swift_bridgeObjectRelease_n();
  uint64_t v45 = v66;
  sub_77ADC0();
  uint64_t v72 = *(void *)(v71 + qword_9791E0);
  sub_FE2C(0, (unint64_t *)&qword_94FFE0);
  sub_77AB40();
  int64_t v46 = v67;
  sub_77ADE0();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v74);
  int v47 = *(void (**)(char *, uint64_t))(v69 + 8);
  uint64_t v48 = v45;
  uint64_t v49 = v70;
  v47(v48, v70);
  uint64_t v50 = v65;
  uint64_t v75 = v65;
  uint64_t v76 = &protocol witness table for VerticalStack;
  uint64_t v51 = sub_FBE0((uint64_t *)&v74);
  uint64_t v52 = v64;
  (*(void (**)(uint64_t *, char *, uint64_t))(v64 + 16))(v51, v24, v50);
  id v53 = v68;
  v68[3] = v49;
  v53[4] = (uint64_t)&protocol witness table for DisjointStack;
  sub_FBE0(v53);
  sub_77ADE0();
  v47(v46, v49);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)&v74);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v24, v50);
}

uint64_t sub_76543C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_94FD20 != -1) {
    swift_once();
  }
  sub_145F4(a2, (uint64_t)&v11);
  v12[3] = sub_77B8D0();
  uint64_t v12[4] = (uint64_t)&protocol witness table for Margins;
  sub_FBE0(v12);
  sub_77B8C0();
  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = a1;
  v9[3] = a4;
  v9[4] = a5;
  sub_77AE60();
  swift_release();
  return _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v12);
}

uint64_t sub_765568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 && qword_94FD28 != -1) {
    swift_once();
  }
  sub_77AE20();
  if (__OFSUB__(a3, 1))
  {
    __break(1u);
LABEL_9:
    swift_once();
    return sub_77AE30();
  }
  if (a3 - 1 == a2 && qword_94FD28 != -1) {
    goto LABEL_9;
  }
  return sub_77AE30();
}

uint64_t sub_765668()
{
  uint64_t v0 = sub_77ADB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_77AEE0();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  uint64_t v5 = enum case for DisjointStack.EdgePosition.anchored(_:);
  uint64_t v6 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, enum case for DisjointStack.EdgePosition.anchored(_:), v0);
  sub_77ADA0();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  sub_77AD70();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  sub_77AD60();
  v3[3] = v4;
  v3[4] = (uint64_t)&protocol witness table for ZeroDimension;
  sub_FBE0(v3);
  sub_77AED0();
  v6(v3, v5, v0);
  sub_77AD80();
  return sub_77AD90();
}

uint64_t sub_765818()
{
  return sub_77AD90();
}

uint64_t sub_765840@<X0>(uint64_t *a1@<X8>)
{
  int64_t v46 = a1;
  uint64_t v43 = sub_77B870();
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v45 = (double (**)(double, double))((char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v44 = (double (**)(double, double))((char *)&v37 - v4);
  __chkstk_darwin(v5);
  uint64_t v42 = (double (**)(double, double))((char *)&v37 - v6);
  __chkstk_darwin(v7);
  id v40 = (double (**)(double, double))((char *)&v37 - v8);
  uint64_t v9 = sub_779380();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_77AEC0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v37 - v21;
  sub_77AEA0();
  sub_764AC0(v51);
  sub_77AEB0();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v51);
  uint64_t v23 = v19;
  uint64_t v24 = v16;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v23, v16);
  uint64_t v25 = *(void **)(v1 + qword_9791F0);
  if (([v25 isHidden] & 1) == 0)
  {
    uint64_t v26 = v1 + qword_9791D0;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v26, v9);
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.chin(_:), v9);
    sub_768528(&qword_9792A8, (void (*)(uint64_t))&type metadata accessor for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle);
    sub_77D860();
    sub_77D860();
    if ((void *)v51[0] == v47 && v51[1] == v48)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
      v27(v12, v9);
      v27(v15, v9);
LABEL_6:
      uint64_t v49 = sub_FE2C(0, (unint64_t *)&qword_95C580);
      uint64_t v50 = &protocol witness table for UIButton;
      int v47 = v25;
      id v38 = v25;
      uint64_t v29 = v40;
      *id v40 = sub_F87B4;
      v29[1] = 0;
      uint64_t v39 = v24;
      uint64_t v30 = *(void (**)(double (**)(double, double), uint64_t, uint64_t))(v41 + 104);
      uint64_t v31 = v43;
      v30(v29, enum case for Resize.Rule.recalculated(_:), v43);
      uint64_t v32 = enum case for Resize.Rule.unchanged(_:);
      v30(v42, enum case for Resize.Rule.unchanged(_:), v31);
      v30(v44, v32, v31);
      v30(v45, v32, v31);
      uint64_t v24 = v39;
      v51[3] = sub_77B880();
      v51[4] = (uint64_t)&protocol witness table for Resize;
      sub_FBE0(v51);
      id v33 = v38;
      sub_77B890();
      sub_77AE60();
      _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v51);
      goto LABEL_7;
    }
    LODWORD(v39) = sub_77EC30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v28 = *(void (**)(char *, uint64_t))(v10 + 8);
    v28(v12, v9);
    v28(v15, v9);
    if (v39) {
      goto LABEL_6;
    }
  }
LABEL_7:
  uint64_t v34 = v46;
  v46[3] = v24;
  v34[4] = (uint64_t)&protocol witness table for VerticalStack;
  id v35 = sub_FBE0(v34);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v17 + 32))(v35, v22, v24);
}

id sub_765E0C()
{
  sub_77B240();
  uint64_t v1 = (void (*)(void))sub_77B250();
  v1();
  uint64_t v2 = *(void **)&v0[qword_9791D8];
  [v0 bounds];

  return objc_msgSend(v2, "setFrame:");
}

void sub_765E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v45 = a1;
  uint64_t v5 = sub_FD50((uint64_t *)&unk_95D360);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_FD50((uint64_t *)&unk_95DB00);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_FD50(&qword_95D750);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_FD50((uint64_t *)&unk_95D370);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_FD50((uint64_t *)&unk_957340);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_FD50((uint64_t *)&unk_957350);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = sub_76DD70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 1, 1, v21);
  uint64_t v22 = sub_770BC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v13, 1, 1, v22);
  if (qword_94FD68 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_94FD58;
  id v24 = (id)qword_9791C8;
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v25 = (void *)qword_9791B8;
  *uint64_t v10 = v24;
  v10[1] = v25;
  uint64_t v26 = enum case for OfferTint.custom(_:);
  uint64_t v27 = sub_77A590();
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v28 + 104))(v10, v26, v27);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v10, 0, 1, v27);
  uint64_t v29 = sub_FD50((uint64_t *)&unk_95A6D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v7, 1, 1, v29);
  id v30 = v25;
  sub_4AA14C(v45, v4, (uint64_t)v19, v44, 0, 0, (uint64_t)v16, (uint64_t)v13, (uint64_t)v10, (uint64_t)v7);
  v4[OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_enforceMaximumOfTwoLinesOverall] = 0;
  sub_CAFB0();
  objc_msgSend(v4, "setNeedsLayout", v43);
  sub_CAFB0();
  sub_14C88((uint64_t)v7, (uint64_t *)&unk_95D360);
  sub_14C88((uint64_t)v10, (uint64_t *)&unk_95DB00);
  sub_14C88((uint64_t)v13, &qword_95D750);
  sub_14C88((uint64_t)v16, (uint64_t *)&unk_95D370);
  sub_14C88((uint64_t)v19, (uint64_t *)&unk_957340);
  if (sub_779BC0())
  {
    swift_beginAccess();
    sub_77A050();
    sub_76E300();
    sub_768528((unint64_t *)&qword_957370, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
    sub_76F0F0();
    swift_release();
    swift_release();
  }
  [*(id *)&v4[OBJC_IVAR____TtC18ASMessagesProvider14BaseLockupView_titleLabel] setOverrideUserInterfaceStyle:2];
  uint64_t v31 = OBJC_IVAR____TtC18ASMessagesProvider14BaseLockupView_headingLabel;
  uint64_t v32 = *(void **)&v4[OBJC_IVAR____TtC18ASMessagesProvider14BaseLockupView_headingLabel];
  if (v32)
  {
    [v32 setOverrideUserInterfaceStyle:2];
    id v33 = *(void **)&v4[v31];
    if (v33)
    {
      id v34 = [v33 layer];
      [v34 setCompositingFilter:kCAFilterPlusL];

      id v35 = *(void **)&v4[v31];
      if (v35)
      {
        sub_FE2C(0, (unint64_t *)&qword_94FFD0);
        id v36 = v35;
        uint64_t v37 = (void *)sub_77E330();
        [v36 setTextColor:v37];
      }
    }
  }
  id v38 = *(void **)&v4[OBJC_IVAR____TtC18ASMessagesProvider14BaseLockupView_offerButton];
  id v39 = [v38 layer];
  [v39 setCompositingFilter:kCAFilterPlusL];

  uint64_t v40 = OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_allowsGroupBlending;
  v4[OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_allowsGroupBlending] = 0;
  id v41 = [v4 layer];
  [v41 setAllowsGroupBlending:v4[v40]];

  id v42 = [v38 layer];
  [v42 setAllowsGroupBlending:v4[v40]];
}

uint64_t sub_766520(uint64_t a1, uint64_t *a2)
{
  uint64_t v26 = a2;
  uint64_t v2 = sub_77C870();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2);
  uint64_t v25 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_77D0B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_FD50((uint64_t *)&unk_9514E0);
  uint64_t v27 = *(void *)(v11 - 8);
  uint64_t v28 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_FD50((uint64_t *)&unk_9518E0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76E620();
  uint64_t v17 = sub_FD50((uint64_t *)&unk_9514F0);
  uint64_t v18 = *(uint64_t **)(v17 - 8);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v18[6])(v16, 1, v17) == 1) {
    return sub_14C88((uint64_t)v16, (uint64_t *)&unk_9518E0);
  }
  uint64_t v20 = *v26;
  v31[3] = sub_779990();
  v31[4] = sub_768528((unint64_t *)&qword_9518F0, (void (*)(uint64_t))&type metadata accessor for Action);
  uint64_t v24 = v20;
  v31[0] = v20;
  swift_retain_n();
  uint64_t v26 = v18;
  sub_5F4C3C();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  uint64_t v21 = v25;
  sub_77C850();
  sub_77CCB0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v30);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v13, v10, v4);
  uint64_t v23 = v27;
  uint64_t v22 = v28;
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v13, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v28);
  sub_77CD70();
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v22);
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v31);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v26[1])(v16, v17);
}

id sub_766950(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = a1 + qword_9791E8;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (!v3)
  {
LABEL_15:
    [*(id *)(v1 + qword_9791F0) setAlpha:1.0];
    uint64_t v14 = *(void **)(v1 + qword_9791E0);
    v16[0] = 0x3FF0000000000000;
    v16[1] = 0;
    v16[2] = 0;
    v16[3] = 0x3FF0000000000000;
    v16[4] = 0;
    v16[5] = 0;
    return [v14 setTransform:v16];
  }
  uint64_t v15 = v1;
  uint64_t v4 = *(void *)v2 + 32;
  swift_bridgeObjectRetain_n();
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = *(id *)(v4 + 16 * v5);
    id v7 = [v6 subviews];
    sub_FE2C(0, (unint64_t *)&qword_94FFE0);
    unint64_t v8 = sub_77D890();

    if (v8 >> 62) {
      break;
    }
    uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
    id result = (id)swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_6;
    }
LABEL_3:
    ++v5;
    swift_bridgeObjectRelease_n();

    if (v5 == v3)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v1 = v15;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRetain();
  id result = (id)sub_77EB40();
  uint64_t v9 = (uint64_t)result;
  if (!result) {
    goto LABEL_3;
  }
LABEL_6:
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v12 = (id)sub_77EA30();
      }
      else {
        id v12 = *(id *)(v8 + 8 * i + 32);
      }
      uint64_t v13 = v12;
      [v12 setAlpha:1.0];
    }
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_766B40(char *a1)
{
  uint64_t v1 = *(void (**)(uint64_t))&a1[qword_9791F8];
  uint64_t v2 = a1;
  uint64_t v3 = swift_retain();
  v1(v3);

  return swift_release();
}

uint64_t sub_766BA4(unint64_t a1)
{
  uint64_t v3 = sub_77C870();
  uint64_t v34 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v31 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_77D0B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = sub_FD50((uint64_t *)&unk_9514E0);
  uint64_t v32 = *(void *)(v12 - 8);
  uint64_t v33 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_FD50((uint64_t *)&unk_9518E0);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (uint64_t *)(v1 + qword_979200);
  uint64_t result = swift_beginAccess();
  uint64_t v20 = *v18;
  BOOL v21 = (*v18 & 0xC000000000000001) == 0;
  uint64_t v35 = v3;
  if (!v21)
  {
    sub_77EA30();
    goto LABEL_6;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8)) <= a1)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  swift_retain();
LABEL_6:
  swift_endAccess();
  uint64_t v22 = sub_779A80();
  if (!v22) {
    return swift_release();
  }
  uint64_t v23 = v22;
  if (!swift_weakLoadStrong())
  {
    swift_release();
    return swift_release();
  }
  sub_76E620();
  uint64_t v24 = sub_FD50((uint64_t *)&unk_9514F0);
  uint64_t v30 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v17, 1, v24) == 1)
  {
    swift_release();
    swift_release();
    swift_release();
    return sub_14C88((uint64_t)v17, (uint64_t *)&unk_9518E0);
  }
  else
  {
    v36[3] = sub_779990();
    v36[4] = sub_768528((unint64_t *)&qword_9518F0, (void (*)(uint64_t))&type metadata accessor for Action);
    v36[0] = v23;
    swift_retain_n();
    uint64_t v29 = v24;
    sub_5F4C3C();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    uint64_t v25 = v31;
    sub_77C850();
    sub_77CCB0();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v25, v35);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v11, v5);
    uint64_t v27 = v32;
    uint64_t v26 = v33;
    (*(void (**)(char *, void, uint64_t))(v32 + 104))(v14, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v33);
    uint64_t v28 = v29;
    sub_77CD70();
    swift_release();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v26);
    _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v36);
    swift_release();
    swift_release();
    swift_release_n();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v17, v28);
  }
}

void sub_7670B4(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (v2[qword_979218] == 1)
  {
    uint64_t v5 = qword_979220;
    uint64_t v6 = *(void **)&v2[qword_979220];
    if (!v6
      || [v6 phase] == (char *)&def_270DE0 + 3
      || (uint64_t v7 = *(void **)&v2[v5]) != 0 && [v7 phase] == &dword_4)
    {
      uint64_t v8 = swift_bridgeObjectRetain();
      uint64_t v9 = (void *)sub_7600A0(v8);
      swift_bridgeObjectRelease();
      if (v9)
      {
        [v9 locationInView:v2];
        double v11 = v10;
        double v13 = v12;
        uint64_t v14 = &v2[qword_9791E8];
        swift_beginAccess();
        uint64_t v15 = *(void *)v14;
        uint64_t v16 = *(void *)(v15 + 16);
        if (v16)
        {
          uint64_t v25 = v9;
          uint64_t v26 = v5;
          uint64_t v27 = ObjectType;
          swift_bridgeObjectRetain();
          uint64_t v17 = 0;
          uint64_t v18 = 32;
          while (1)
          {
            id v19 = *(id *)(v15 + v18);
            objc_msgSend(v19, "convertPoint:fromCoordinateSpace:", v2, v11, v13);
            unsigned int v20 = objc_msgSend(v19, "pointInside:withEvent:", a2);

            if (v20) {
              break;
            }
            ++v17;
            v18 += 16;
            if (v16 == v17)
            {
              swift_bridgeObjectRelease();
              uint64_t v17 = 0;
              char v21 = 1;
              goto LABEL_17;
            }
          }
          swift_bridgeObjectRelease();
          char v21 = 0;
LABEL_17:
          uint64_t ObjectType = v27;
          uint64_t v9 = v25;
          uint64_t v5 = v26;
        }
        else
        {
          uint64_t v17 = 0;
          char v21 = 1;
        }
        uint64_t v23 = &v2[qword_979228];
        *(void *)uint64_t v23 = v17;
        v23[8] = v21;
        uint64_t v24 = *(void **)&v2[v5];
        *(void *)&v2[v5] = v9;

        sub_FE2C(0, (unint64_t *)&qword_952AA0);
        sub_63D00();
        v22.super.Class isa = sub_77DA30().super.isa;
        v28.receiver = v2;
        v28.super_class = ObjectType;
        objc_msgSendSuper2(&v28, "touchesBegan:withEvent:", v22.super.isa, a2);
      }
      else
      {
        sub_FE2C(0, (unint64_t *)&qword_952AA0);
        sub_63D00();
        v22.super.Class isa = sub_77DA30().super.isa;
        v29.receiver = v2;
        v29.super_class = ObjectType;
        objc_msgSendSuper2(&v29, "touchesBegan:withEvent:", v22.super.isa, a2);
      }
    }
    else
    {
      sub_FE2C(0, (unint64_t *)&qword_952AA0);
      sub_63D00();
      v22.super.Class isa = sub_77DA30().super.isa;
      v30.receiver = v2;
      v30.super_class = ObjectType;
      objc_msgSendSuper2(&v30, "touchesBegan:withEvent:", v22.super.isa, a2);
    }
  }
  else
  {
    sub_FE2C(0, (unint64_t *)&qword_952AA0);
    sub_63D00();
    v22.super.Class isa = sub_77DA30().super.isa;
    v31.receiver = v2;
    v31.super_class = ObjectType;
    objc_msgSendSuper2(&v31, "touchesBegan:withEvent:", v22.super.isa, a2);
  }
}

uint64_t sub_7673B4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_767594(a1, a2, a3, a4, (void (*)(uint64_t, void *))sub_7670B4);
}

void sub_7673CC(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  if (*(unsigned char *)(v2 + qword_979218) != 1)
  {
    sub_FE2C(0, (unint64_t *)&qword_952AA0);
    sub_63D00();
    v11.super.Class isa = sub_77DA30().super.isa;
    objc_msgSendSuper2(&v14, "touchesEnded:withEvent:", v11.super.isa, a2, v12.receiver, v12.super_class, v13.receiver, v13.super_class, v2, ObjectType);
    goto LABEL_11;
  }
  uint64_t v6 = qword_979220;
  uint64_t v7 = *(void **)(v2 + qword_979220);
  if (!v7)
  {
LABEL_10:
    sub_FE2C(0, (unint64_t *)&qword_952AA0);
    sub_63D00();
    v11.super.Class isa = sub_77DA30().super.isa;
    objc_msgSendSuper2(&v13, "touchesEnded:withEvent:", v11.super.isa, a2, v12.receiver, v12.super_class, v2, ObjectType, v14.receiver, v14.super_class);
    goto LABEL_11;
  }
  id v8 = v7;
  if ((sub_67D4F4(v8, a1) & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v9 = *(void **)(v2 + v6);
  *(void *)(v2 + v6) = 0;

  uint64_t v10 = v2 + qword_979228;
  if ((*(unsigned char *)(v2 + qword_979228 + 8) & 1) == 0 && (*(unsigned char *)(v2 + qword_9B4D28) & 1) == 0) {
    sub_766BA4(*(void *)v10);
  }

  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  sub_FE2C(0, (unint64_t *)&qword_952AA0);
  sub_63D00();
  v11.super.Class isa = sub_77DA30().super.isa;
  objc_msgSendSuper2(&v12, "touchesEnded:withEvent:", v11.super.isa, a2, v2, ObjectType, v13.receiver, v13.super_class, v14.receiver, v14.super_class);
LABEL_11:
}

uint64_t sub_76757C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_767594(a1, a2, a3, a4, (void (*)(uint64_t, void *))sub_7673CC);
}

uint64_t sub_767594(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, void *))
{
  sub_FE2C(0, (unint64_t *)&qword_952AA0);
  sub_63D00();
  uint64_t v8 = sub_77DA40();
  id v9 = a4;
  id v10 = a1;
  a5(v8, a4);

  return swift_bridgeObjectRelease();
}

void sub_767644(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  if (*(unsigned char *)(v2 + qword_979218) == 1)
  {
    uint64_t v5 = *(void **)(v2 + qword_979220);
    *(void *)(v2 + qword_979220) = 0;

    uint64_t v6 = v2 + qword_979228;
    *(void *)uint64_t v6 = 0;
    *(unsigned char *)(v6 + 8) = 1;
    sub_FE2C(0, (unint64_t *)&qword_952AA0);
    sub_63D00();
    v7.super.Class isa = sub_77DA30().super.isa;
    objc_msgSendSuper2(&v8, "touchesCancelled:withEvent:", v7.super.isa, a2, v2, ObjectType, v9.receiver, v9.super_class);
  }
  else
  {
    sub_FE2C(0, (unint64_t *)&qword_952AA0);
    sub_63D00();
    v7.super.Class isa = sub_77DA30().super.isa;
    objc_msgSendSuper2(&v9, "touchesCancelled:withEvent:", v7.super.isa, a2, v8.receiver, v8.super_class, v2, ObjectType);
  }
}

uint64_t sub_767768(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_767594(a1, a2, a3, a4, (void (*)(uint64_t, void *))sub_767644);
}

uint64_t sub_767780()
{
  return type metadata accessor for ArcadeDownloadPackGamesCardView(0);
}

unsigned char *storeEnumTagSinglePayload for ArcadeDownloadPackGamesPurchaseAvailabilityStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x767854);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArcadeDownloadPackGamesPurchaseAvailabilityStatus()
{
  return &type metadata for ArcadeDownloadPackGamesPurchaseAvailabilityStatus;
}

unint64_t sub_767890()
{
  unint64_t result = qword_979280;
  if (!qword_979280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_979280);
  }
  return result;
}

void sub_7678E4(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_77E920();
      sub_FE2C(0, (unint64_t *)&qword_952AA0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_77E8E0() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_77E8F0();
  sub_FE2C(0, (unint64_t *)&qword_952AA0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unsigned int v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_77E500(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = sub_77E510();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = sub_77E510();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  objc_super v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_767B5C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_767BE4(uint64_t a1, int a2, void *a3)
{
  uint64_t v7 = sub_779A00();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_FD50(&qword_969DF0);
  __chkstk_darwin(v11);
  id v15 = (char *)v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return swift_bridgeObjectRelease();
  }
  LODWORD(v56) = a2;
  v53[1] = v3;
  uint64_t v17 = *(int *)(v12 + 48);
  v53[0] = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v18 = a1 + v53[0];
  uint64_t v58 = *(void *)(v13 + 72);
  uint64_t v55 = a1;
  swift_bridgeObjectRetain();
  sub_22D74(v18, (uint64_t)v15, &qword_969DF0);
  uint64_t v54 = v8;
  id v19 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v59 = v7;
  uint64_t v60 = v19;
  v19((unint64_t)v10, v15, v7);
  uint64_t v57 = v17;
  char v20 = v15[v17];
  uint64_t v61 = a3;
  uint64_t v21 = *a3;
  unint64_t v23 = sub_67A624((uint64_t)v10);
  uint64_t v24 = *(void *)(v21 + 16);
  BOOL v25 = (v22 & 1) == 0;
  uint64_t v26 = v24 + v25;
  if (__OFADD__(v24, v25)) {
    goto LABEL_24;
  }
  char v27 = v22;
  if (*(void *)(v21 + 24) >= v26)
  {
    if (v56)
    {
      if (v22) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_372390();
      if (v27) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v32 = (void *)*v61;
    *(void *)(*v61 + 8 * (v23 >> 6) + 64) |= 1 << v23;
    uint64_t v33 = v32[6];
    uint64_t v56 = *(void *)(v54 + 72);
    uint64_t v34 = v59;
    v60(v33 + v56 * v23, v10, v59);
    *(unsigned char *)(v32[7] + v23) = v20;
    uint64_t v35 = v32[2];
    BOOL v36 = __OFADD__(v35, 1);
    uint64_t v37 = v35 + 1;
    if (v36)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v32[2] = v37;
    uint64_t v38 = v16 - 1;
    if (v16 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    uint64_t v39 = v55 + v58 + v53[0];
    while (1)
    {
      sub_22D74(v39, (uint64_t)v15, &qword_969DF0);
      v60((unint64_t)v10, v15, v34);
      char v40 = v15[v57];
      id v41 = (void *)*v61;
      unint64_t v43 = sub_67A624((uint64_t)v10);
      uint64_t v44 = v41[2];
      BOOL v45 = (v42 & 1) == 0;
      uint64_t v46 = v44 + v45;
      if (__OFADD__(v44, v45)) {
        break;
      }
      char v47 = v42;
      if (v41[3] < v46)
      {
        sub_36BE74(v46, 1);
        unint64_t v48 = sub_67A624((uint64_t)v10);
        if ((v47 & 1) != (v49 & 1)) {
          goto LABEL_26;
        }
        unint64_t v43 = v48;
      }
      if (v47) {
        goto LABEL_10;
      }
      uint64_t v50 = (void *)*v61;
      *(void *)(*v61 + 8 * (v43 >> 6) + 64) |= 1 << v43;
      uint64_t v34 = v59;
      v60(v50[6] + v56 * v43, v10, v59);
      *(unsigned char *)(v50[7] + v43) = v40;
      uint64_t v51 = v50[2];
      BOOL v36 = __OFADD__(v51, 1);
      uint64_t v52 = v51 + 1;
      if (v36) {
        goto LABEL_25;
      }
      v50[2] = v52;
      v39 += v58;
      if (!--v38) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  sub_36BE74(v26, v56 & 1);
  unint64_t v28 = sub_67A624((uint64_t)v10);
  if ((v27 & 1) == (v29 & 1))
  {
    unint64_t v23 = v28;
    if ((v27 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v31 = swift_allocError();
    swift_willThrow();
    uint64_t v64 = v31;
    swift_errorRetain();
    sub_FD50(&qword_950C80);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v59);
      swift_bridgeObjectRelease();
      return swift_errorRelease();
    }
    goto LABEL_27;
  }
LABEL_26:
  sub_77EC90();
  __break(1u);
LABEL_27:
  uint64_t v62 = 0;
  unint64_t v63 = 0xE000000000000000;
  sub_77EA00(30);
  v65._object = (void *)0x8000000000801300;
  v65._countAndFlagsBits = 0xD00000000000001BLL;
  sub_77D790(v65);
  sub_77EAB0();
  v66._countAndFlagsBits = 39;
  v66._object = (void *)0xE100000000000000;
  sub_77D790(v66);
  uint64_t result = sub_77EB20();
  __break(1u);
  return result;
}

uint64_t sub_768130()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_768168()
{
  return sub_766950(*(void *)(v0 + 16));
}

uint64_t sub_768170(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_768180()
{
  return swift_release();
}

uint64_t type metadata accessor for ArcadeDownloadPackGamesCardView.DownloadAllButtonConfiguration(uint64_t a1)
{
  return sub_76EF4(a1, qword_979310);
}

void *sub_7681A8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_485E10(0, v1, 0);
    uint64_t v3 = *(void *)(sub_779A00() - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    swift_getObjectType();
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      uint64_t v5 = sub_76D470();
      uint64_t v7 = v6;
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        sub_485E10(v8 > 1, v9 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v9 + 1;
      unint64_t v10 = &_swiftEmptyArrayStorage[2 * v9];
      v10[4] = v5;
      v10[5] = v7;
      v4 += v12;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_768308(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ArcadeDownloadPackGamesCardView.DownloadAllButtonConfiguration(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_768364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ArcadeDownloadPackGamesCardView.DownloadAllButtonConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_7683C8()
{
  int64_t v1 = (int *)(type metadata accessor for ArcadeDownloadPackGamesCardView.DownloadAllButtonConfiguration(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + v1[7];
  uint64_t v7 = sub_779380();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_7684C4()
{
  uint64_t v1 = *(void *)(type metadata accessor for ArcadeDownloadPackGamesCardView.DownloadAllButtonConfiguration(0) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (uint64_t *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));

  return sub_766520(v2, v3);
}

uint64_t sub_768528(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_768570()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_7685A8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_7685E0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_768620()
{
  sub_7634F0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_768628()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_768668(uint64_t a1, uint64_t a2)
{
  return sub_763C70(a1, a2, *(void *)(v2 + 16), *(uint64_t (**)(uint64_t))(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_768674()
{
  uint64_t v1 = sub_779380();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_768710(void *a1)
{
  uint64_t v3 = *(void *)(sub_779380() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_763F48(a1, v4);
}

uint64_t sub_7687AC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_7687EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_764880(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), a2);
}

id sub_7687F4()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_768808()
{
  return 8;
}

uint64_t sub_768814()
{
  return swift_release();
}

uint64_t sub_76881C(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_768830(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_768848()
{
  return 8;
}

void sub_76885C()
{
}

void sub_76887C()
{
}

uint64_t sub_7688A4()
{
  return 8;
}

uint64_t sub_7688B4()
{
  return sub_77D590();
}

double sub_7688FC(uint64_t a1, void *a2)
{
  if (qword_94D728 != -1) {
    swift_once();
  }
  sub_CC1D8((uint64_t)&xmmword_9AE520, (uint64_t)v9);
  if (qword_94D730 != -1) {
    swift_once();
  }
  sub_CBF70((uint64_t)v9, (uint64_t)&xmmword_9AE680, a2, 0.0);
  double v5 = v4;
  sub_CC234((uint64_t)v9);
  if (qword_94FD28 != -1) {
    swift_once();
  }
  double v6 = *(double *)&qword_979170;
  double v7 = *(double *)&qword_979170;
  if (qword_94FD20 != -1)
  {
    swift_once();
    double v7 = *(double *)&qword_979170;
  }
  return v7 + v6 + (ceil(v5) + *(double *)&xmmword_979150 + *(double *)&qword_979160) * (double)a1;
}

uint64_t sub_768A78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = a2;
  id v24 = a3;
  uint64_t v4 = sub_FD50((uint64_t *)&unk_951EB0);
  __chkstk_darwin(v4 - 8);
  double v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_77CE90();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (unint64_t *)(a1 + qword_979200);
  swift_beginAccess();
  unint64_t v12 = *v11;
  unint64_t v27 = v12;
  if (v12 >> 62) {
    goto LABEL_14;
  }
  uint64_t v13 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8));
  uint64_t result = swift_bridgeObjectRetain_n();
  uint64_t v28 = v13;
  if (!v13) {
    return swift_bridgeObjectRelease_n();
  }
  while (v28 >= 1)
  {
    unint64_t v25 = v12 & 0xC000000000000001;
    uint64_t v26 = a1 + qword_9791E8;
    swift_beginAccess();
    unint64_t v15 = 0;
    uint64_t v16 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    char v22 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v17 = (void (**)(char *, uint64_t))(v8 + 8);
    for (uint64_t i = 32; ; i += 16)
    {
      if (v25)
      {
        a1 = sub_77EA30();
      }
      else
      {
        a1 = *(void *)(v12 + 8 * v15 + 32);
        swift_retain();
      }
      if (v15 >= *(void *)(*(void *)v26 + 16)) {
        break;
      }
      id v19 = *(id *)(*(void *)v26 + i);
      uint64_t v8 = a1;
      sub_779B60();
      if ((*v16)(v6, 1, v7) == 1)
      {

        sub_14C88((uint64_t)v6, (uint64_t *)&unk_951EB0);
      }
      else
      {
        (*v22)(v10, v6, v7);
        id v20 = v19;
        [v20 bounds];
        objc_msgSend(v24, "convertRect:fromCoordinateSpace:", v20);
        uint64_t v8 = v23;
        sub_7742B0();

        (*v17)(v10, v7);
      }
      swift_release();
      ++v15;
      unint64_t v12 = v27;
      if (v28 == v15) {
        return swift_bridgeObjectRelease_n();
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain_n();
    unint64_t v12 = v27;
    uint64_t result = sub_77EB40();
    uint64_t v28 = result;
    if (!result) {
      return swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
  return result;
}

void sub_768D88()
{
  uint64_t v1 = &v0[qword_9791D0];
  uint64_t v2 = enum case for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle.chin(_:);
  uint64_t v3 = sub_779380();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(v1, v2, v3);
  uint64_t v4 = &v0[qword_9B4D20];
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  uint64_t v5 = qword_9791D8;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)type metadata accessor for GradientView()) init];
  uint64_t v6 = qword_9791E0;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)UIView) init];
  *(void *)&v0[qword_9791E8] = _swiftEmptyArrayStorage;
  uint64_t v7 = qword_9791F0;
  *(void *)&v0[v7] = [self buttonWithType:0];
  uint64_t v8 = &v0[qword_9791F8];
  *uint64_t v8 = static CondensedEditorialSearchResultContentView.prefetchArtwork(for:with:asPartOf:);
  v8[1] = 0;
  *(void *)&v0[qword_979200] = _swiftEmptyArrayStorage;
  swift_weakInit();
  *(void *)&v0[qword_979210] = _swiftEmptyArrayStorage;
  v0[qword_979218] = 0;
  *(void *)&v0[qword_979220] = 0;
  v0[qword_9B4D28] = 0;
  uint64_t v9 = &v0[qword_979228];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;

  sub_77EB20();
  __break(1u);
}

uint64_t sub_768F6C()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_768F7C(uint64_t a1)
{
  return sub_765568(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t *sub_768F88(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_779380();
    unint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_76906C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_779380();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_7690E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_779380();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_76917C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_779380();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_769210(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_779380();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_76928C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_779380();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_769318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_76932C);
}

uint64_t sub_76932C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_779380();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_7693DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7693F0);
}

void *sub_7693F0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_779380();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_769498()
{
  uint64_t result = sub_779380();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

UIContentSizeCategory sub_769560()
{
  uint64_t v0 = UIContentSizeCategoryAccessibilityMedium;
  return UIContentSizeCategoryAccessibilityMedium;
}

void *sub_769590(void *a1)
{
  unint64_t v1 = (void *)sub_769814(a1);
  id v2 = v1;
  return v1;
}

uint64_t sub_7695BC(void *a1)
{
  id v2 = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  int v3 = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  uint64_t result = sub_77DF60();
  if (result)
  {
    if (sub_77DF50())
    {
      uint64_t v5 = v3;
      id v6 = a1;
      char v7 = sub_77DF60();

      if (v7) {
        return 2;
      }
    }
    else
    {
    }
    uint64_t v8 = UIContentSizeCategoryAccessibilityMedium;
    uint64_t v9 = UIContentSizeCategoryAccessibilityExtraLarge;
    uint64_t result = sub_77DF60();
    if (result)
    {
      if (sub_77DF50())
      {
        id v10 = a1;
        uint64_t v11 = v9;
        char v12 = sub_77DF60();

        if (v12)
        {
          uint64_t v13 = sub_77D670();
          uint64_t v15 = v14;
          if (v13 == sub_77D670() && v15 == v16)
          {
            uint64_t v17 = 2;
          }
          else if (sub_77EC30())
          {
            uint64_t v17 = 2;
          }
          else
          {
            uint64_t v17 = 1;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v17;
        }
      }
      else
      {
      }
      return 2;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_769770(void *a1)
{
  unint64_t v1 = (void *)sub_7698D8(a1);
  id v2 = v1;
  return v1;
}

uint64_t sub_76979C()
{
  if (sub_77DF20()) {
    return 2;
  }
  else {
    return 3;
  }
}

UIContentSizeCategory sub_7697C0()
{
  uint64_t v0 = UIContentSizeCategoryAccessibilityExtraLarge;
  return UIContentSizeCategoryAccessibilityExtraLarge;
}

uint64_t sub_7697F0()
{
  if (sub_77DF20()) {
    return 3;
  }
  else {
    return 2;
  }
}

uint64_t sub_769814(void *a1)
{
  id v2 = UIContentSizeCategoryAccessibilityMedium;
  int v3 = UIContentSizeCategoryAccessibilityExtraLarge;
  uint64_t result = sub_77DF60();
  if (result)
  {
    if (sub_77DF50())
    {
      uint64_t v5 = v3;
      id v6 = a1;
      char v7 = sub_77DF60();

      if (v7)
      {
        uint64_t v8 = &UIContentSizeCategoryExtraExtraExtraLarge;
        return (uint64_t)*v8;
      }
    }
    else
    {
    }
    uint64_t v8 = &UIContentSizeCategoryAccessibilityMedium;
    return (uint64_t)*v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_7698D8(void *a1)
{
  id v2 = UIContentSizeCategoryAccessibilityMedium;
  int v3 = UIContentSizeCategoryAccessibilityExtraLarge;
  uint64_t result = sub_77DF60();
  if (result)
  {
    if (sub_77DF50())
    {
      uint64_t v5 = v3;
      id v6 = a1;
      char v7 = sub_77DF60();

      if (v7)
      {
        uint64_t v8 = &UIContentSizeCategoryAccessibilityLarge;
        return (uint64_t)*v8;
      }
    }
    else
    {
    }
    uint64_t v8 = &UIContentSizeCategoryAccessibilityExtraExtraLarge;
    return (uint64_t)*v8;
  }
  __break(1u);
  return result;
}

char *sub_7699A8(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v10 = &v4[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel;
  id v12 = objc_allocWithZone((Class)UILabel);
  uint64_t v13 = v4;
  *(void *)&v4[v11] = objc_msgSend(v12, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v14 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_highlightView;
  *(void *)&v13[v14] = [objc_allocWithZone((Class)TLKProminenceView) initWithProminence:3];
  uint64_t v15 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_interceptingTapGesture;
  *(void *)&v13[v15] = [objc_allocWithZone((Class)UITapGestureRecognizer) init];

  v39.receiver = v13;
  v39.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v39, "initWithFrame:", a1, a2, a3, a4);
  UIAccessibilityTraits v17 = UIAccessibilityTraitSearchField;
  uint64_t v18 = (char *)v16;
  [v18 setAccessibilityTraits:v17];
  uint64_t v19 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel;
  id v20 = *(void **)&v18[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel];
  sub_FE2C(0, (unint64_t *)&qword_94FFD0);
  id v21 = v20;
  char v22 = (void *)sub_77E310();
  [v21 setTextColor:v22];

  uint64_t v23 = *(void **)&v18[v19];
  v38.receiver = v18;
  v38.super_class = ObjectType;
  id v24 = v23;
  id v25 = objc_msgSendSuper2(&v38, "font");
  objc_msgSend(v24, "setFont:", v25, v38.receiver, v38.super_class);

  uint64_t v26 = *(void **)&v18[v19];
  [v26 setUserInteractionEnabled:0];
  [v26 setLineBreakMode:2];
  unint64_t v27 = v18;
  id v28 = [v27 subviews];
  sub_FE2C(0, (unint64_t *)&qword_94FFE0);
  unint64_t v29 = sub_77D890();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    objc_super v30 = (char *)sub_77EB40();
    swift_bridgeObjectRelease();
    if (!v30) {
      goto LABEL_9;
    }
LABEL_3:
    uint64_t result = v30 - 1;
    if (__OFSUB__(v30, 1))
    {
      __break(1u);
    }
    else if ((v29 & 0xC000000000000001) == 0)
    {
      if (((unint64_t)result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if ((unint64_t)result < *(void *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFFF8)))
      {
        uint64_t v32 = (char *)*(id *)(v29 + 8 * (void)result + 32);
LABEL_8:
        objc_super v30 = v32;
        goto LABEL_9;
      }
      __break(1u);
      return result;
    }
    uint64_t v32 = (char *)sub_77EA30();
    goto LABEL_8;
  }
  objc_super v30 = *(char **)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFFF8));
  if (v30) {
    goto LABEL_3;
  }
LABEL_9:
  swift_bridgeObjectRelease();
  [v27 insertSubview:v26 below:v30];

  uint64_t v33 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_highlightView;
  uint64_t v34 = *(void **)&v27[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_highlightView];
  if (v34)
  {
    id v35 = [v34 layer];
    [v35 setCornerRadius:2.0];

    uint64_t v36 = *(void *)&v27[v33];
    if (v36) {
      [*(id *)&v27[v33] setUserInteractionEnabled:0];
    }
  }
  else
  {
    uint64_t v36 = 0;
  }
  [v27 insertSubview:v36 below:*(void *)&v18[v19]];
  objc_msgSend(v27, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  sub_769DB0();
  uint64_t v37 = *(void **)&v27[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_interceptingTapGesture];
  [v37 addTarget:v27 action:"didTapWithSender:"];
  [v37 setDelegate:v27];
  [v27 addGestureRecognizer:v37];

  return v27;
}

id sub_769DB0()
{
  unint64_t v1 = v0;
  id v2 = &v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  int v3 = *(void **)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8];
  if (!v3) {
    goto LABEL_3;
  }
  swift_bridgeObjectRetain_n();
  id v5 = [v1 traitCollection];
  id v6 = (char *)[v5 layoutDirection];

  int v7 = v6 != (unsigned char *)&def_270DE0 + 1;
  NSString v8 = sub_77D640();
  LODWORD(v6) = [v8 _isNaturallyRTL];
  swift_bridgeObjectRelease();

  if (v7 == v6) {
    char v9 = 1;
  }
  else {
LABEL_3:
  }
    char v9 = 0;
  sub_76B48C(v4, v3, v9, v1);
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel];
  if (v11)
  {
    swift_bridgeObjectRetain();
    NSString v13 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  [v12 setText:v13];

  if (!*((void *)v2 + 1)) {
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  id v14 = [v1 traitCollection];
  uint64_t v15 = (char *)[v14 layoutDirection];

  NSString v16 = sub_77D640();
  LODWORD(v14) = [v16 _isNaturallyRTL];
  swift_bridgeObjectRelease();

  if ((v15 != (unsigned char *)&def_270DE0 + 1) == v14)
  {
    sub_FE2C(0, (unint64_t *)&qword_94FFD0);
    uint64_t v17 = sub_77E330();
  }
  else
  {
LABEL_10:
    sub_FE2C(0, (unint64_t *)&qword_94FFD0);
    uint64_t v17 = sub_77E310();
  }
  uint64_t v18 = (void *)v17;
  [v12 setTextColor:v17];

  double v19 = 1.0;
  if (sub_77D710()) {
    double v20 = 0.0;
  }
  else {
    double v20 = 1.0;
  }
  [v12 setAlpha:v20];
  id v21 = *(void **)&v1[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_highlightView];
  if (v21) {
    [v21 setAlpha:v20];
  }
  char v22 = sub_77D710();
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0)
  {
    if (*((void *)v2 + 1))
    {
      swift_bridgeObjectRetain();
      id v23 = [v1 traitCollection];
      id v24 = (char *)[v23 layoutDirection];

      NSString v25 = sub_77D640();
      LODWORD(v23) = [v25 _isNaturallyRTL];
      swift_bridgeObjectRelease();

      if ((v24 == (unsigned char *)&def_270DE0 + 1) != v23) {
        double v19 = 1.0;
      }
      else {
        double v19 = 0.0;
      }
    }
    else
    {
      double v19 = 0.0;
    }
  }
  id result = [v1 _fieldEditor];
  if (result)
  {
    unint64_t v27 = result;
    [result setAlpha:v19];

    return [v1 setNeedsLayout];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_76A278(uint64_t result, uint64_t a2)
{
  int v3 = (uint64_t *)&v2[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8];
  *int v3 = result;
  v3[1] = a2;
  if (a2)
  {
    if (v5)
    {
      BOOL v6 = v4 == result && v5 == a2;
      if (v6 || (sub_77EC30() & 1) != 0) {
        goto LABEL_11;
      }
    }
  }
  else if (!v5)
  {
    return result;
  }
  sub_769DB0();
  [v2 sendActionsForControlEvents:0x20000];
LABEL_11:

  return swift_bridgeObjectRelease();
}

void sub_76A30C()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  swift_bridgeObjectRetain();
  char v2 = sub_77D710();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    if (*((void *)v1 + 1))
    {
      swift_bridgeObjectRetain();
      NSString v3 = sub_77D640();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v3 = 0;
    }
    [v0 setText:v3];

    uint64_t v4 = *((void *)v1 + 1);
    *(void *)unint64_t v1 = 0;
    *((void *)v1 + 1) = 0;
    if (v4)
    {
      sub_769DB0();
      [v0 sendActionsForControlEvents:0x20000];
      swift_bridgeObjectRelease();
    }
  }
}

id sub_76A428()
{
  unint64_t v1 = v0;
  id v2 = [v0 selectedTextRange];
  if (!v2) {
    return 0;
  }
  NSString v3 = v2;
  id v4 = [v0 traitCollection];
  uint64_t v5 = (char *)[v4 layoutDirection];

  int v6 = v5 != (unsigned char *)&def_270DE0 + 1;
  NSString v7 = sub_77D640();
  LODWORD(v5) = [v7 _isNaturallyRTL];

  if (v6 == v5)
  {
    id v20 = 0;
  }
  else
  {
    id v8 = [v1 markedTextRange];

    sub_FE2C(0, (unint64_t *)&qword_95D220);
    id v9 = [v3 start];
    id v10 = [v3 end];
    int v11 = sub_77E510();

    id v12 = [v1 endOfDocument];
    id v13 = [v3 end];
    int v14 = sub_77E510();

    id v15 = [v1 text];
    if (v15)
    {
      NSString v16 = v15;
      uint64_t v17 = sub_77D670();
      double v19 = v18;
    }
    else
    {
      uint64_t v17 = 0;
      double v19 = 0;
    }
    v23.value._countAndFlagsBits = v17;
    v23.value._object = v19;
    BOOL v21 = sub_77D740(v23);
    swift_bridgeObjectRelease();
    id v20 = 0;
    if (!v8 && ((v11 ^ 1) & 1) == 0 && ((v14 ^ 1) & 1) == 0 && v21) {
      id v20 = [v1 isFirstResponder];
    }
  }

  return v20;
}

id sub_76A670()
{
  v33.receiver = v0;
  v33.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v33, "layoutSubviews");
  unint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel];
  [v0 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = &v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  if (!*(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8]) {
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  id v11 = [v0 traitCollection];
  id v12 = (char *)[v11 layoutDirection];

  NSString v13 = sub_77D640();
  LODWORD(v11) = [v13 _isNaturallyRTL];
  swift_bridgeObjectRelease();

  if ((v12 != (unsigned char *)&def_270DE0 + 1) == v11) {
    char v14 = 1;
  }
  else {
LABEL_3:
  }
    char v14 = 0;
  id result = objc_msgSend(v1, "setFrame:", sub_76ADF8(v14, v0, v0, v3, v5, v7, v9));
  NSString v16 = *(void **)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_highlightView];
  if (v16)
  {
    [v0 bounds];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    if (!*((void *)v10 + 1)) {
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    id v25 = [v0 traitCollection];
    uint64_t v26 = (char *)[v25 layoutDirection];

    NSString v27 = sub_77D640();
    LODWORD(v25) = [v27 _isNaturallyRTL];
    swift_bridgeObjectRelease();

    if ((v26 != (unsigned char *)&def_270DE0 + 1) == v25) {
      char v28 = 1;
    }
    else {
LABEL_8:
    }
      char v28 = 0;
    [v1 frame];
    return objc_msgSend(v16, "setFrame:", sub_76B090(v28, v0, v0, v18, v20, v22, v24, v29, v30, v31, v32));
  }
  return result;
}

id sub_76A918()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  double v2 = &v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8];
  *(void *)double v2 = 0;
  *((void *)v2 + 1) = 0;
  if (v4)
  {
    sub_769DB0();
    [v0 sendActionsForControlEvents:0x20000];
    swift_bridgeObjectRelease();
  }
  v6.receiver = v0;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "resignFirstResponder", v3);
}

id sub_76AA00(double a1, double a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  objc_super v6 = &v2[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v7 = *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8];
  *(void *)objc_super v6 = 0;
  *((void *)v6 + 1) = 0;
  if (v8)
  {
    sub_769DB0();
    [v2 sendActionsForControlEvents:0x20000];
    swift_bridgeObjectRelease();
  }
  v10.receiver = v2;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, "beginFloatingCursorAtPoint:", v7, a1, a2);
}

uint64_t sub_76AB94(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_FE2C(0, (unint64_t *)&qword_95D220);
  if (sub_77E510())
  {
    swift_bridgeObjectRetain();
    char v4 = sub_77D710();
    swift_bridgeObjectRelease();
    char v5 = v4 ^ 1;
  }
  else
  {
    v9.receiver = v1;
    v9.super_class = ObjectType;
    if (objc_msgSendSuper2(&v9, "gestureRecognizerShouldBegin:", a1))
    {
      self;
      if (swift_dynamicCastObjCClass())
      {
        objc_super v6 = &v1[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
        uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8];
        *(void *)objc_super v6 = 0;
        *((void *)v6 + 1) = 0;
        if (v7)
        {
          sub_769DB0();
          [v1 sendActionsForControlEvents:0x20000];
          swift_bridgeObjectRelease();
        }
      }
      char v5 = 1;
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5 & 1;
}

uint64_t type metadata accessor for SearchTextField()
{
  return self;
}

void sub_76ADD8()
{
  qword_979350 = 0x4010000000000000;
}

void sub_76ADE8()
{
  qword_979358 = 0x4010000000000000;
}

double sub_76ADF8(char a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v15 = [a3 text];
  double v16 = 0.0;
  if (v15)
  {
    double v17 = v15;
    v28.receiver = a3;
    v28.super_class = ObjectType;
    id v18 = objc_msgSendSuper2(&v28, "font");
    if (v18)
    {
      double v19 = v18;
      if (a1)
      {
        sub_FD50((uint64_t *)&unk_95C560);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_78DBA0;
        *(void *)(inited + 32) = NSFontAttributeName;
        *(void *)(inited + 64) = sub_FE2C(0, (unint64_t *)&qword_951810);
        *(void *)(inited + 40) = v19;
        CGFloat v22 = NSFontAttributeName;
        id v23 = v19;
        sub_676EEC(inited);
        type metadata accessor for Key(0);
        sub_3BDCE8();
        Class isa = sub_77D4F0().super.isa;
        swift_bridgeObjectRelease();
        [v17 sizeWithAttributes:isa];

        if (qword_94FD78 != -1) {
          swift_once();
        }
        double v20 = *(double *)&qword_979358;
      }
      else
      {
      }
      id v25 = objc_msgSend(a2, "traitCollection", v20);
      [v25 layoutDirection];

      objc_msgSend(a3, "textRectForBounds:", a4, a5, a6, a7);
      sub_77DFA0();
      sub_77E0E0();
      double v16 = v26;
    }
    else
    {
    }
  }
  return v16;
}

double sub_76B090(char a1, void *a2, char *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v22 = [a3 text];
  double v23 = 0.0;
  if (v22)
  {
    CGFloat v24 = v22;
    v36.receiver = a3;
    v36.super_class = ObjectType;
    id v25 = objc_msgSendSuper2(&v36, "font");
    if (v25)
    {
      double v26 = v25;
      sub_FD50((uint64_t *)&unk_95C560);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_78DBA0;
      *(void *)(inited + 32) = NSFontAttributeName;
      *(void *)(inited + 64) = sub_FE2C(0, (unint64_t *)&qword_951810);
      *(void *)(inited + 40) = v26;
      objc_super v28 = NSFontAttributeName;
      id v29 = v26;
      sub_676EEC(inited);
      type metadata accessor for Key(0);
      sub_3BDCE8();
      Class isa = sub_77D4F0().super.isa;
      swift_bridgeObjectRelease();
      [v24 sizeWithAttributes:isa];

      objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel], "sizeThatFits:", a6, a7);
      v37.origin.x = a8;
      v37.origin.y = a9;
      v37.size.width = a10;
      v37.size.height = a11;
      CGRectGetMinY(v37);
      v38.origin.x = a8;
      v38.origin.y = a9;
      v38.size.width = a10;
      v38.size.height = a11;
      CGRectGetHeight(v38);
      id v31 = [a2 traitCollection];
      id v32 = [v31 layoutDirection];

      if (v32)
      {
        v39.origin.y = a5;
        v39.origin.x = a4;
        v39.size.width = a6;
        v39.size.height = a7;
        CGRectGetMaxX(v39);
        v40.origin.x = a8;
        v40.origin.y = a9;
        v40.size.width = a10;
        v40.size.height = a11;
        CGRectGetMaxX(v40);
      }
      else
      {
        v41.origin.x = a8;
        v41.origin.y = a9;
        v41.size.width = a10;
        v41.size.height = a11;
        CGRectGetMinX(v41);
      }
      if (a1)
      {
        if (qword_94FD78 != -1) {
          swift_once();
        }
        if (qword_94FD70 != -1) {
          swift_once();
        }
        v43.origin.x = a8;
        v43.origin.y = a9;
        v43.size.width = a10;
        v43.size.height = a11;
        CGRectGetWidth(v43);
      }
      else
      {
        if (qword_94FD70 != -1) {
          swift_once();
        }
        v42.origin.x = a8;
        v42.origin.y = a9;
        v42.size.width = a10;
        v42.size.height = a11;
        CGRectGetWidth(v42);
      }
      sub_77E0F0();
      double v23 = v33;
    }
    else
    {
    }
  }
  return v23;
}

uint64_t sub_76B48C(uint64_t a1, void *a2, char a3, id a4)
{
  if (a3)
  {
    if (a2)
    {
      id v6 = [a4 traitCollection];
      uint64_t v7 = (char *)[v6 layoutDirection];

      BOOL v8 = v7 != (unsigned char *)&def_270DE0 + 1;
      NSString v9 = sub_77D640();
      LODWORD(v7) = [v9 _isNaturallyRTL];

      if ((v8 ^ v7))
      {
        uint64_t v12 = 546603234;
        v10._countAndFlagsBits = a1;
        v10._object = a2;
      }
      else
      {
        uint64_t v12 = a1;
        swift_bridgeObjectRetain();
        v10._countAndFlagsBits = 2491474464;
        v10._object = (void *)0xA400000000000000;
      }
      sub_77D790(v10);
      return v12;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_76B58C()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  *(void *)unint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v3 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_highlightView;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)TLKProminenceView) initWithProminence:3];
  uint64_t v4 = OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_interceptingTapGesture;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)UITapGestureRecognizer) init];

  sub_77EB20();
  __break(1u);
}

void sub_76B680()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText];
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC18ASMessagesProvider15SearchTextField_ghostHintText + 8];
  *(void *)unint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  if (v2)
  {
    sub_769DB0();
    [v0 sendActionsForControlEvents:0x20000];
    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_76B740()
{
  return type metadata accessor for AppEntityVisualState();
}

uint64_t sub_76B780()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_76B790()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_76B7A0()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t sub_76B7B0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_76B7C0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_76B7D0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_76B7F0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_76B800()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_76B810()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_76B820()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_76B830(Swift::String a1)
{
}

uint64_t sub_76B840()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_76B850()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_76B860()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_76B870()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_76B890()
{
  return NSNotFound.getter();
}

uint64_t sub_76B8A0()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_76B8B0()
{
  return static CharacterSet.excessiveLeading.getter();
}

uint64_t sub_76B8C0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_76B8D0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_76B8E0()
{
  return Notification.name.getter();
}

uint64_t sub_76B8F0()
{
  return Notification.userInfo.getter();
}

uint64_t sub_76B900()
{
  return type metadata accessor for Notification();
}

uint64_t sub_76B910()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_76B920()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_76B930()
{
  return URLComponents.queryItems.modify();
}

uint64_t sub_76B940()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_76B950()
{
  return URLComponents.url.getter();
}

uint64_t sub_76B960()
{
  return URLComponents.host.setter();
}

uint64_t sub_76B970()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_76B980()
{
  return URLComponents.string.getter();
}

uint64_t sub_76B990()
{
  return URLComponents.init()();
}

uint64_t sub_76B9A0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_76B9B0()
{
  return DateComponents.day.getter();
}

uint64_t sub_76B9C0()
{
  return DateComponents.year.getter();
}

uint64_t sub_76B9D0()
{
  return DateComponents.month.getter();
}

uint64_t sub_76B9E0()
{
  return DateComponents.minute.getter();
}

uint64_t sub_76B9F0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_76BA00()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_76BA10()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_76BA20()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_76BA30()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_76BA40()
{
  return AttributeScopes.UIKitAttributes.paragraphStyle.getter();
}

uint64_t sub_76BA50()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t sub_76BA60()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t sub_76BA70()
{
  return AttributedString.subscript.setter();
}

uint64_t sub_76BA80()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_76BA90()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_76BAA0()
{
  return AttributedString.subscript.modify();
}

uint64_t sub_76BAB0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_76BAC0()
{
  return AttributeContainer.subscript.setter();
}

uint64_t sub_76BAD0()
{
  return AttributeContainer.init()();
}

uint64_t sub_76BAE0()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_76BAF0()
{
  return AttributeContainer.init(_:)();
}

uint64_t sub_76BB00()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t sub_76BB10()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_76BB20()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_76BB30()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_76BB40()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_76BB50()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_76BB60()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_76BB70()
{
  return AttributedStringProtocol.range<A>(of:options:locale:)();
}

uint64_t sub_76BB80()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_76BB90()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_76BBA0()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t sub_76BBB0()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t sub_76BBC0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_76BBD0()
{
  return URL.lastPathComponent.getter();
}

void sub_76BBE0(NSURL *retstr@<X8>)
{
}

uint64_t sub_76BBF0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_76BC00()
{
  return URL.host.getter();
}

uint64_t sub_76BC10()
{
  return URL.scheme.getter();
}

uint64_t sub_76BC20()
{
  return URL.init(string:)();
}

uint64_t sub_76BC30()
{
  return type metadata accessor for URL();
}

NSData sub_76BC40()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_76BC50()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_76BC60()
{
  return static Date.FormatStyle.TimeStyle.standard.getter();
}

uint64_t sub_76BC70()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_76BC80()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t sub_76BC90()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_76BCA0()
{
  return Date.FormatStyle.secondFraction(_:)();
}

uint64_t sub_76BCB0()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t sub_76BCC0()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t sub_76BCD0()
{
  return static Date.FormatStyle.Symbol.SecondFraction.fractional(_:)();
}

uint64_t sub_76BCE0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.SecondFraction();
}

uint64_t sub_76BCF0()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.omitted.getter();
}

uint64_t sub_76BD00()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t sub_76BD10()
{
  return static Date.FormatStyle.Symbol.Hour.twoDigits(amPM:)();
}

uint64_t sub_76BD20()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t sub_76BD30()
{
  return static Date.FormatStyle.Symbol.Minute.twoDigits.getter();
}

uint64_t sub_76BD40()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Minute();
}

uint64_t sub_76BD50()
{
  return static Date.FormatStyle.Symbol.Second.twoDigits.getter();
}

uint64_t sub_76BD60()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Second();
}

uint64_t sub_76BD70()
{
  return Date.FormatStyle.minute(_:)();
}

uint64_t sub_76BD80()
{
  return Date.FormatStyle.second(_:)();
}

uint64_t sub_76BD90()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t sub_76BDA0()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_76BDB0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_76BDC0()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_76BDD0()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_76BDE0()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_76BDF0()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_76BE00()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_76BE10()
{
  return Date.formatted<A>(_:)();
}

uint64_t sub_76BE20()
{
  return Date.init()();
}

uint64_t sub_76BE30()
{
  return type metadata accessor for Date();
}

uint64_t sub_76BE40()
{
  return UUID.uuidString.getter();
}

uint64_t sub_76BE50()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_76BE60()
{
  return UUID.init()();
}

uint64_t sub_76BE70()
{
  return type metadata accessor for UUID();
}

uint64_t sub_76BE80()
{
  return Locale.identifier.getter();
}

uint64_t sub_76BE90()
{
  return Locale.regionCode.getter();
}

uint64_t sub_76BEA0()
{
  return Locale.isJapanese.getter();
}

uint64_t sub_76BEB0()
{
  return Locale.prefersSmallerText.getter();
}

uint64_t sub_76BEC0()
{
  return Locale.baseWritingDirection.getter();
}

uint64_t sub_76BED0()
{
  return Locale.paragraphLineHeightMultiple.getter();
}

uint64_t sub_76BEE0()
{
  return Locale.isKorean.getter();
}

uint64_t sub_76BEF0()
{
  return Locale.isChinese.getter();
}

uint64_t sub_76BF00()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_76BF10()
{
  return static Locale.availableIdentifiers.getter();
}

uint64_t sub_76BF20()
{
  return static Locale.storefront.getter();
}

uint64_t sub_76BF30()
{
  return Locale.hasExtraTallWritingSystem.getter();
}

uint64_t sub_76BF40()
{
  return static Locale.current.getter();
}

uint64_t sub_76BF50()
{
  return type metadata accessor for Locale();
}

uint64_t sub_76BF60()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_76BF70()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_76BF80()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_76BF90()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_76BFA0()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_76BFB0()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_76BFC0()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_76BFD0()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t sub_76BFE0()
{
  return Calendar.date(from:)();
}

uint64_t sub_76BFF0()
{
  return static Calendar.current.getter();
}

uint64_t sub_76C000()
{
  return Calendar.nextDate(after:matching:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_76C010()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_76C020()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_76C030()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t sub_76C040()
{
  return IndexSet.makeIterator()();
}

void sub_76C050(NSIndexSet *retstr@<X8>)
{
}

uint64_t sub_76C060()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_76C070()
{
  return IndexSet.count.getter();
}

BOOL sub_76C080(Swift::Int a1)
{
  return IndexSet.contains(_:)(a1);
}

uint64_t sub_76C090()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_76C0A0()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t sub_76C0B0()
{
  return static TimeZone.current.getter();
}

uint64_t sub_76C0C0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_76C0D0()
{
  return IndexPath.init(arrayLiteral:)();
}

NSIndexPath sub_76C0E0()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_76C0F0()
{
  return static IndexPath.> infix(_:_:)();
}

uint64_t sub_76C100()
{
  return static IndexPath.< infix(_:_:)();
}

uint64_t sub_76C110()
{
  return static IndexPath.== infix(_:_:)();
}

uint64_t sub_76C120()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_76C130()
{
  return IndexPath.init(row:section:)();
}

uint64_t sub_76C140()
{
  return IndexPath.row.getter();
}

uint64_t sub_76C150()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_76C160()
{
  return IndexPath.item.getter();
}

uint64_t sub_76C170()
{
  return IndexPath.section.getter();
}

uint64_t sub_76C180()
{
  return IndexPath.count.getter();
}

uint64_t sub_76C190()
{
  return IndexPath.init(index:)();
}

void sub_76C1A0(Swift::Int a1)
{
}

uint64_t sub_76C1B0()
{
  return IndexPath.appending(_:)();
}

uint64_t sub_76C1C0()
{
  return IndexPath.appending(_:)();
}

uint64_t sub_76C1D0()
{
  return IndexPath.init()();
}

uint64_t sub_76C1E0()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_76C1F0()
{
  return IndexPath.subscript.getter();
}

uint64_t sub_76C200()
{
  return type metadata accessor for CGPathFillRule();
}

NSNumber sub_76C210()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_76C220()
{
  return static CGFloat.allColumns.getter();
}

uint64_t sub_76C230()
{
  return static CGFloat.solvedValue(between:and:forInput:)();
}

uint64_t sub_76C240()
{
  return CGFloat.isLessThanOrEffectivelyEqualTo(_:accuracy:)();
}

uint64_t sub_76C250()
{
  return CGFloat.rounded(_:toScale:)();
}

uint64_t sub_76C260()
{
  return CGFloat.scalingLike(_:with:)();
}

uint64_t sub_76C270()
{
  return CGFloat.rawValue(in:)();
}

uint64_t sub_76C280()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_76C290()
{
  return GameLayerAchievementsPresenter.init(gameRecord:entryPoint:achievementIdsToHighlight:achievementIdToPresent:)();
}

uint64_t sub_76C2A0()
{
  return type metadata accessor for GameLayerAchievementsPresenter();
}

uint64_t sub_76C2B0()
{
  return type metadata accessor for GameLayerAchievementsEntryPoint();
}

uint64_t sub_76C2C0()
{
  return GameLayerAchievementsViewController.init(presenter:theme:objectGraph:)();
}

uint64_t sub_76C2D0()
{
  return type metadata accessor for GameLayerAchievementsViewController();
}

uint64_t sub_76C2E0()
{
  return type metadata accessor for Achievement();
}

uint64_t sub_76C2F0()
{
  return static AchievementCard.defaultMetrics.getter();
}

uint64_t sub_76C300()
{
  return AchievementCard.alwaysShowShadow.setter();
}

uint64_t sub_76C310()
{
  return AchievementCard.backgroundEffectsGroup.setter();
}

uint64_t sub_76C320()
{
  return AchievementCard.init(frame:metrics:theme:)();
}

uint64_t sub_76C330()
{
  return AchievementCard.model.setter();
}

uint64_t sub_76C340()
{
  return type metadata accessor for AchievementCard();
}

uint64_t sub_76C350()
{
  return type metadata accessor for AchievementsTheme();
}

uint64_t sub_76C360()
{
  return SmallPlayerCardData.buttonText.getter();
}

uint64_t sub_76C370()
{
  return SmallPlayerCardData.avatarImage.getter();
}

uint64_t sub_76C380()
{
  return SmallPlayerCardData.buttonAction.getter();
}

uint64_t sub_76C390()
{
  return SmallPlayerCardData.removeButtonAction.getter();
}

uint64_t sub_76C3A0()
{
  return SmallPlayerCardData.shouldShowMessagesBadge.getter();
}

uint64_t sub_76C3B0()
{
  return SmallPlayerCardData.avatarArtworkLoaderConfig.getter();
}

uint64_t sub_76C3C0()
{
  return SmallPlayerCardData.init(id:title:subtitle:buttonText:avatarArtworkLoaderConfig:avatarImage:shouldShowMessagesBadge:buttonAction:removeButtonAction:isEnabled:segue:messagesGroupIdentifier:groupRecipients:)();
}

uint64_t sub_76C3D0()
{
  return SmallPlayerCardData.id.getter();
}

uint64_t sub_76C3E0()
{
  return SmallPlayerCardData.segue.getter();
}

uint64_t sub_76C3F0()
{
  return SmallPlayerCardData.title.getter();
}

uint64_t sub_76C400()
{
  return SmallPlayerCardData.subtitle.getter();
}

uint64_t sub_76C410()
{
  return type metadata accessor for SmallPlayerCardData();
}

uint64_t sub_76C420()
{
  return SmallPlayerCardView.closeButton.getter();
}

uint64_t sub_76C430()
{
  return dispatch thunk of SmallPlayerCardView.prepareForReuse()();
}

uint64_t sub_76C440()
{
  return dispatch thunk of SmallPlayerCardView.buttonActionBlock.setter();
}

uint64_t sub_76C450()
{
  return dispatch thunk of SmallPlayerCardView.closeButtonActionBlock.getter();
}

uint64_t sub_76C460()
{
  return dispatch thunk of SmallPlayerCardView.closeButtonActionBlock.setter();
}

uint64_t sub_76C470()
{
  return dispatch thunk of SmallPlayerCardView.show(image:isAnimationPermitted:)();
}

uint64_t sub_76C480()
{
  return static SmallPlayerCardView.size(fitting:traitEnvironment:)();
}

uint64_t sub_76C490()
{
  return dispatch thunk of SmallPlayerCardView.apply(data:shouldSetImage:)();
}

uint64_t sub_76C4A0()
{
  return dispatch thunk of SmallPlayerCardView.image.getter();
}

uint64_t sub_76C4B0()
{
  return type metadata accessor for SmallPlayerCardView();
}

uint64_t sub_76C4C0()
{
  return type metadata accessor for AchievementCardLayout.Metrics();
}

uint64_t sub_76C4D0()
{
  return type metadata accessor for DashboardLaunchContext();
}

uint64_t sub_76C4E0()
{
  return static ActivityFeedPlatterView.viewHeight(for:)();
}

uint64_t sub_76C4F0()
{
  return ActivityFeedPlatterView.init(data:actionHandlers:)();
}

uint64_t sub_76C500()
{
  return type metadata accessor for ActivityFeedPlatterView();
}

uint64_t sub_76C510()
{
  return JetDashboardViewController.__allocating_init(launchContext:request:navigationProxy:)();
}

uint64_t sub_76C520()
{
  return type metadata accessor for JetDashboardViewController();
}

uint64_t sub_76C530()
{
  return type metadata accessor for ActivityFeedLockupViewModel();
}

uint64_t sub_76C540()
{
  return PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)();
}

uint64_t sub_76C550()
{
  return type metadata accessor for PlayerProfileViewController();
}

uint64_t sub_76C560()
{
  return ActivityFeedLockupActionHandlers.init(profileHandler:leaderboardsHandler:achievementsHandler:appHandler:)();
}

uint64_t sub_76C570()
{
  return type metadata accessor for ActivityFeedLockupActionHandlers();
}

uint64_t sub_76C580()
{
  return dispatch thunk of AppStoreAd.instanceId.getter();
}

uint64_t sub_76C590()
{
  return dispatch thunk of AppStoreAd.appMetadata.getter();
}

uint64_t sub_76C5A0()
{
  return dispatch thunk of AppStoreAd.privacyInfo.getter();
}

uint64_t sub_76C5B0()
{
  return dispatch thunk of AppStoreAd.impressionId.getter();
}

uint64_t sub_76C5C0()
{
  return dispatch thunk of AppStoreAd.unfilledReason.getter();
}

uint64_t sub_76C5D0()
{
  return dispatch thunk of AppStoreAd.clientRequestId.getter();
}

uint64_t sub_76C5E0()
{
  return dispatch thunk of AppStoreAd.positionInformation.getter();
}

uint64_t sub_76C5F0()
{
  return dispatch thunk of AppStoreAd.adamId.getter();
}

uint64_t sub_76C600()
{
  return dispatch thunk of AppStoreAd.cppIds.getter();
}

uint64_t sub_76C610()
{
  return dispatch thunk of AppStoreAd.toroId.getter();
}

uint64_t sub_76C620()
{
  return dispatch thunk of AppStoreAd.metadata.getter();
}

uint64_t sub_76C630()
{
  return static AppStoreConfig.iris.getter();
}

uint64_t sub_76C640()
{
  return static AppStoreConfig.flora.getter();
}

uint64_t sub_76C650()
{
  return static AppStoreConfig.metis.getter();
}

uint64_t sub_76C660()
{
  return static AppStoreConfig.thetis.getter();
}

uint64_t sub_76C670()
{
  return type metadata accessor for AppStoreConfig();
}

uint64_t sub_76C680()
{
  return AppStoreModule.getAd(config:appRequestMetaFields:adamId:_:)();
}

uint64_t sub_76C690()
{
  return AppStoreRequestTask.clientRequestId.getter();
}

uint64_t sub_76C6A0()
{
  return AppStoreRequestTask.cancel(_:)();
}

uint64_t sub_76C6B0()
{
  return AppStoreRequestTask.toroId.getter();
}

uint64_t sub_76C6C0()
{
  return AppStoreMetricManager.interacted(_:type:completion:)();
}

void sub_76C6D0(Swift::String _, Swift::Int threshold)
{
}

void sub_76C6E0(Swift::String a1)
{
}

void sub_76C6F0(Swift::String a1)
{
}

uint64_t sub_76C700()
{
  return AppStoreMetricManager.discarded(_:reasonCode:)();
}

uint64_t sub_76C710()
{
  return type metadata accessor for AppStoreInteractionType();
}

uint64_t sub_76C720()
{
  return type metadata accessor for AppStoreAdUnfilledReason();
}

uint64_t sub_76C730()
{
  return type metadata accessor for AppStoreTaskCancelReason();
}

uint64_t sub_76C740()
{
  return type metadata accessor for AppStoreMetricDiscardReason();
}

uint64_t sub_76C750()
{
  return AppEntityViewAnnotation.init<A>(entity:state:)();
}

uint64_t sub_76C760()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t sub_76C770()
{
  return IntentView.init(what:transaction:configuration:working:failed:content:)();
}

uint64_t sub_76C780()
{
  return LoadingView.init<>()();
}

uint64_t sub_76C7A0()
{
  return IntentViewConfiguration.init()();
}

uint64_t sub_76C7B0()
{
  return type metadata accessor for IntentViewConfiguration();
}

uint64_t sub_76C7C0()
{
  return ShareSheetAppEventMetadata.text.getter();
}

uint64_t sub_76C7D0()
{
  return ShareSheetAppEventMetadata.artwork.getter();
}

uint64_t sub_76C7E0()
{
  return ShareSheetAppEventMetadata.subtitle.getter();
}

uint64_t sub_76C7F0()
{
  return makeModernAppStateController(deviceAppFetcher:updateRegistry:dataSources:)();
}

uint64_t sub_76C800()
{
  return StreamlinedInAppPurchaseOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:restrictions:subtitlePosition:alignment:)();
}

uint64_t sub_76C810()
{
  return static StreamlinedInAppPurchaseOfferButtonPresenter.activeStateDataSource.getter();
}

uint64_t sub_76C820()
{
  return static StreamlinedInAppPurchaseOfferButtonPresenter.use(stateDataSource:)();
}

uint64_t sub_76C830()
{
  return type metadata accessor for StreamlinedInAppPurchaseOfferButtonPresenter();
}

uint64_t sub_76C840()
{
  return SupplementaryAppPlatform.systemImageName.getter();
}

uint64_t sub_76C850()
{
  return SupplementaryAppPlatform.rawValue.getter();
}

uint64_t sub_76C860()
{
  return type metadata accessor for SupplementaryAppPlatform();
}

uint64_t sub_76C870()
{
  return InstallPagePreInstallFreeLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76C880()
{
  return InstallPagePreInstallFreeLayout.Metrics.init(iconSize:ageRatingMargin:ageRatingBaselineOffset:titleSpace:titleHorizontalMargin:parentTitleSpace:parentTitleHorizontalMargin:subtitleSpace:subtitleHorizontalMargin:descriptionSpace:descriptionHorizontalMargin:offerButtonMargin:bottomSpace:)();
}

uint64_t sub_76C890()
{
  return type metadata accessor for InstallPagePreInstallFreeLayout.Metrics();
}

uint64_t sub_76C8A0()
{
  return InstallPagePreInstallFreeLayout.init(metrics:iconView:titleText:parentTitleText:subtitleText:descriptionText:ageRatingView:offerButton:)();
}

uint64_t sub_76C8B0()
{
  return type metadata accessor for InstallPagePreInstallFreeLayout();
}

uint64_t sub_76C8C0()
{
  return InstallPagePreInstallPaidLayout.measurements(fitting:in:)();
}

uint64_t sub_76C8D0()
{
  return InstallPagePreInstallPaidLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76C8E0()
{
  return InstallPagePreInstallPaidLayout.Metrics.init(titleSpace:subtitleSpace:separatorSpace:descriptionSpace:iconViewMargin:bottomLockupMargin:horizontalMargin:)();
}

uint64_t sub_76C8F0()
{
  return type metadata accessor for InstallPagePreInstallPaidLayout.Metrics();
}

uint64_t sub_76C900()
{
  return InstallPagePreInstallPaidLayout.init(metrics:iconView:titleText:subtitleText:separator:descriptionText:bottomLockupView:)();
}

uint64_t sub_76C910()
{
  return type metadata accessor for InstallPagePreInstallPaidLayout();
}

uint64_t sub_76C920()
{
  return TodayCardMediaAppIcon.icon.getter();
}

uint64_t sub_76C930()
{
  return type metadata accessor for TodayCardMediaAppIcon();
}

uint64_t sub_76C940()
{
  return TodayCardMediaAppEvent.formattedDates.getter();
}

uint64_t sub_76C950()
{
  return TodayCardMediaAppEvent.tintColor.getter();
}

uint64_t sub_76C960()
{
  return type metadata accessor for TodayCardMediaAppEvent();
}

uint64_t sub_76C970()
{
  return BadgeContentKeyContentRatingResource.getter();
}

uint64_t sub_76C980()
{
  return BadgeContentKeyContentRating.getter();
}

uint64_t sub_76C990()
{
  return PurchaseHistoryAppStateDataSource.__allocating_init(asPartOf:)();
}

uint64_t sub_76C9A0()
{
  return type metadata accessor for PurchaseHistoryAppStateDataSource();
}

uint64_t sub_76C9B0()
{
  return TodayCardMediaInAppPurchase.lockup.getter();
}

uint64_t sub_76C9C0()
{
  return type metadata accessor for TodayCardMediaInAppPurchase();
}

uint64_t sub_76C9D0()
{
  return CondensedSearchInAppEventContentLayout.Metrics.lockupBottomSpacing.getter();
}

uint64_t sub_76C9E0()
{
  return static CondensedSearchInAppEventContentLayout.Metrics.standard.getter();
}

uint64_t sub_76C9F0()
{
  return type metadata accessor for CondensedSearchInAppEventContentLayout.Metrics();
}

uint64_t _s18ASMessagesProvider33CondensedInAppPurchaseContentViewC7metrics0E16StoreKitInternal0c6SearchdeF10CardLayoutV7MetricsVvpfi_0()
{
  return static CondensedSearchInAppPurchaseCardLayout.Metrics.baseMetrics.getter();
}

uint64_t sub_76CA10()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.cardInsets.getter();
}

uint64_t sub_76CA20()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerFont.getter();
}

uint64_t sub_76CA30()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.tileOffset.getter();
}

uint64_t sub_76CA40()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleFont.getter();
}

uint64_t sub_76CA50()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.textTopMargin.getter();
}

uint64_t sub_76CA60()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleTextSpace.getter();
}

uint64_t sub_76CA70()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerTextSpace.getter();
}

uint64_t sub_76CA80()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleTextSpace.getter();
}

uint64_t sub_76CA90()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleNumberOfLines.getter();
}

uint64_t sub_76CAA0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerNumberOfLines.getter();
}

uint64_t sub_76CAB0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.offerButtonTopMargin.getter();
}

uint64_t sub_76CAC0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.withCornerTileOffset(_:)();
}

uint64_t sub_76CAD0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.artworkAXBottomMargin.getter();
}

uint64_t sub_76CAE0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.artworkTrailingMargin.getter();
}

Swift::Int sub_76CAF0(UITraitCollection a1)
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleNumberOfLines(for:)(a1);
}

uint64_t sub_76CB00()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleFont.getter();
}

uint64_t sub_76CB10()
{
  return type metadata accessor for CondensedSearchInAppPurchaseCardLayout.Metrics();
}

uint64_t sub_76CB20()
{
  return dispatch thunk of TriggerPersistantStore.date(for:)();
}

uint64_t sub_76CB30()
{
  return dispatch thunk of TriggerPersistantStore.remove(_:)();
}

void sub_76CB40(Swift::OpaquePointer a1)
{
}

uint64_t sub_76CB50()
{
  return TodayCardMediaMultiAppFallback.dominantStyle.getter();
}

uint64_t sub_76CB60()
{
  return TodayCardMediaMultiAppFallback.additionalText.getter();
}

uint64_t sub_76CB70()
{
  return TodayCardMediaMultiAppFallback.lockups.getter();
}

uint64_t sub_76CB80()
{
  return type metadata accessor for TodayCardMediaMultiAppFallback();
}

uint64_t sub_76CB90()
{
  return BadgeContentKeyNativeContentView.getter();
}

uint64_t sub_76CBA0()
{
  return RemotePersonalizationAppStateDataSource.__allocating_init(asPartOf:)();
}

uint64_t sub_76CBB0()
{
  return type metadata accessor for RemotePersonalizationAppStateDataSource();
}

uint64_t sub_76CBC0()
{
  return type metadata accessor for TodayCardMediaBrandedSingleApp();
}

uint64_t sub_76CBD0()
{
  return InAppPurchaseState.hasBeenPurchased.getter();
}

uint64_t sub_76CBE0()
{
  return type metadata accessor for InAppPurchaseState();
}

uint64_t sub_76CBF0()
{
  return type metadata accessor for InAppPurchaseTheme();
}

uint64_t sub_76CC00()
{
  return InAppPurchaseAction.streamlineBuyAction.getter();
}

uint64_t sub_76CC10()
{
  return InAppPurchaseAction.installRequiredAction.getter();
}

uint64_t sub_76CC20()
{
  return InAppPurchaseAction.minimumShortVersionSupportingInAppPurchaseFlow.getter();
}

uint64_t sub_76CC30()
{
  return InAppPurchaseAction.appBundleId.getter();
}

uint64_t sub_76CC40()
{
  return InAppPurchaseAction.productTitle.getter();
}

uint64_t sub_76CC50()
{
  return InAppPurchaseAction.productIdentifier.getter();
}

uint64_t sub_76CC60()
{
  return InAppPurchaseAction.additionalBuyParams.getter();
}

uint64_t sub_76CC70()
{
  return InAppPurchaseAction.appTitle.getter();
}

uint64_t sub_76CC80()
{
  return InAppPurchaseAction.appAdamId.getter();
}

uint64_t sub_76CC90()
{
  return type metadata accessor for InAppPurchaseAction();
}

uint64_t sub_76CCA0()
{
  return InAppPurchaseLockup.productAction.getter();
}

uint64_t sub_76CCB0()
{
  return InAppPurchaseLockup.isSubscription.getter();
}

uint64_t sub_76CCC0()
{
  return InAppPurchaseLockup.descriptionText.getter();
}

uint64_t sub_76CCD0()
{
  return InAppPurchaseLockup.theme.getter();
}

uint64_t sub_76CCE0()
{
  return InAppPurchaseLockup.parent.getter();
}

uint64_t sub_76CCF0()
{
  return type metadata accessor for InAppPurchaseLockup();
}

uint64_t sub_76CD00()
{
  return InAppPurchaseShowcase.descriptionText.getter();
}

uint64_t sub_76CD10()
{
  return InAppPurchaseShowcase.lockup.getter();
}

uint64_t sub_76CD20()
{
  return InAppPurchaseShowcase.subtitle.getter();
}

uint64_t sub_76CD30()
{
  return type metadata accessor for InAppPurchaseShowcase();
}

uint64_t sub_76CD40()
{
  return InAppPurchaseIconLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76CD50()
{
  return InAppPurchaseIconLayout.Metrics.mainIconSize.getter();
}

uint64_t sub_76CD60()
{
  return InAppPurchaseIconLayout.Metrics.mainIconDimension.getter();
}

uint64_t sub_76CD70()
{
  return InAppPurchaseIconLayout.Metrics.init(mainIconDimension:shouldPlaceTileAtOrigin:scaleToFit:)();
}

uint64_t sub_76CD80()
{
  return InAppPurchaseIconLayout.Metrics.tileIconWidth.getter();
}

uint64_t sub_76CD90()
{
  return InAppPurchaseIconLayout.Metrics.scaleToFit.getter();
}

uint64_t sub_76CDA0()
{
  return InAppPurchaseIconLayout.Metrics.tileOffset.getter();
}

uint64_t sub_76CDB0()
{
  return InAppPurchaseIconLayout.Metrics.overallSize.getter();
}

uint64_t sub_76CDC0()
{
  return InAppPurchaseIconLayout.Metrics.displaysPlus.getter();
}

uint64_t sub_76CDD0()
{
  return InAppPurchaseIconLayout.Metrics.plusLineWidth.getter();
}

uint64_t sub_76CDE0()
{
  return InAppPurchaseIconLayout.Metrics.tileBorderWidth.getter();
}

uint64_t sub_76CDF0()
{
  return type metadata accessor for InAppPurchaseIconLayout.Metrics();
}

uint64_t sub_76CE00()
{
  return InAppPurchaseIconLayout.init(metrics:artworkView:artworkContainingView:backgroundView:plusView:tileArtworkView:tileArtworkBackgroundView:)();
}

uint64_t sub_76CE10()
{
  return type metadata accessor for InAppPurchaseIconLayout();
}

uint64_t sub_76CE20()
{
  return InAppPurchaseInstallPage.preInstallOfferDescription.getter();
}

uint64_t sub_76CE30()
{
  return InAppPurchaseInstallPage.parentLockup.getter();
}

uint64_t sub_76CE40()
{
  return InAppPurchaseInstallPage.lockup.getter();
}

uint64_t sub_76CE50()
{
  return type metadata accessor for InAppPurchaseInstallPage();
}

uint64_t sub_76CE60()
{
  return InAppPurchaseSearchResult.lockup.getter();
}

uint64_t sub_76CE70()
{
  return type metadata accessor for InAppPurchaseSearchResult();
}

uint64_t sub_76CE80()
{
  return InAppPurchaseStateDataSource.init(withStateProvider:)();
}

void sub_76CE90()
{
}

uint64_t sub_76CEA0()
{
  return InAppPurchaseStateDataSource.addObserver(_:action:)();
}

uint64_t sub_76CEB0()
{
  return InAppPurchaseStateDataSource.removeObserver(_:)();
}

uint64_t sub_76CEC0()
{
  return InAppPurchaseStateDataSource.state(for:subscriptionFamilyId:)();
}

uint64_t sub_76CED0()
{
  return type metadata accessor for InAppPurchaseStateDataSource();
}

uint64_t sub_76CEE0()
{
  return InAppPurchaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76CEF0()
{
  return InAppPurchaseLockupViewLayout.Metrics.iconMargin.getter();
}

uint64_t sub_76CF00()
{
  return InAppPurchaseLockupViewLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_76CF10()
{
  return InAppPurchaseLockupViewLayout.Metrics.isHeightConstrained.setter();
}

uint64_t sub_76CF20()
{
  return InAppPurchaseLockupViewLayout.Metrics.init(iconSize:iconMargin:titlePrimaryLineSpace:titleSecondaryLineSpace:subtitleLineSpace:descriptionPrimaryLineSpace:descriptionSecondaryLineSpace:offerButtonMargin:offerButtonSize:isHeightConstrained:)();
}

uint64_t sub_76CF30()
{
  return InAppPurchaseLockupViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_76CF40()
{
  return type metadata accessor for InAppPurchaseLockupViewLayout.Metrics();
}

uint64_t sub_76CF50()
{
  return InAppPurchaseLockupViewLayout.init(metrics:iconView:titleText:subtitleText:descriptionText:offerButton:)();
}

uint64_t sub_76CF60()
{
  return type metadata accessor for InAppPurchaseLockupViewLayout();
}

uint64_t sub_76CF70()
{
  return InAppPurchaseSearchResultLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76CF80()
{
  return static InAppPurchaseSearchResultLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_76CF90()
{
  return InAppPurchaseSearchResultLayout.Metrics.init(offerButtonSize:offerButtonMargin:inAppPurchaseTextSpace:titleTextSpace:subtitleTextSpace:descriptionTextSpace:detailsBottomMargin:accessibilityDetailsBottomMargin:preferredMainArtworkWidth:regularLockupAreaAspectRatio:compactLockupAreaAspectRatio:regularBodySideEdgeInsetPercentage:regularBodyHorizontalComponentSpacingPercentage:compactBodySideEdgeInsetPercentage:compactBodyHorizontalComponentSpacingPercentage:inAppIconBottomMargin:bodyVerticalPadding:)();
}

uint64_t sub_76CFA0()
{
  return InAppPurchaseSearchResultLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_76CFB0()
{
  return type metadata accessor for InAppPurchaseSearchResultLayout.Metrics();
}

uint64_t sub_76CFC0()
{
  return InAppPurchaseSearchResultLayout.init(metrics:inAppPurchaseText:titleText:subtitleText:offerButton:inAppPurchaseIcon:inAppPurchaseDescription:inAppPurchaseBackgroundView:)();
}

uint64_t sub_76CFD0()
{
  return type metadata accessor for InAppPurchaseSearchResultLayout();
}

uint64_t sub_76CFE0()
{
  return InAppPurchaseInstallPagePresenter.init(objectGraph:sidepack:pageUrl:appStateController:)();
}

uint64_t sub_76CFF0()
{
  return dispatch thunk of InAppPurchaseInstallPagePresenter.purchaseDidComplete(for:)();
}

uint64_t sub_76D000()
{
  return static InAppPurchaseInstallPagePresenter.use(stateDataSource:)();
}

uint64_t sub_76D010()
{
  return dispatch thunk of InAppPurchaseInstallPagePresenter.view.setter();
}

uint64_t sub_76D020()
{
  return type metadata accessor for InAppPurchaseInstallPagePresenter();
}

uint64_t sub_76D030()
{
  return InAppPurchaseOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:restrictions:subtitlePosition:alignment:)();
}

uint64_t sub_76D040()
{
  return static InAppPurchaseOfferButtonPresenter.use(stateDataSource:)();
}

uint64_t sub_76D050()
{
  return type metadata accessor for InAppPurchaseOfferButtonPresenter();
}

uint64_t sub_76D060()
{
  return InAppPurchaseShowcaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76D070()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.offerButtonSize.getter();
}

uint64_t sub_76D080()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.init(iconSize:titleSpace:subtitleSpace:offerTopSpace:offerButtonSize:descriptionSpace:)();
}

uint64_t sub_76D090()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_76D0A0()
{
  return type metadata accessor for InAppPurchaseShowcaseLockupViewLayout.Metrics();
}

uint64_t sub_76D0B0()
{
  return InAppPurchaseShowcaseLockupViewLayout.init(metrics:iconView:titleText:subtitleText:descriptionText:offerButton:)();
}

uint64_t sub_76D0C0()
{
  return type metadata accessor for InAppPurchaseShowcaseLockupViewLayout();
}

uint64_t sub_76D0D0()
{
  return OpenAppAction.destination.getter();
}

uint64_t sub_76D0E0()
{
  return OpenAppAction.allowBetaApps.getter();
}

uint64_t sub_76D0F0()
{
  return OpenAppAction.init(title:adamId:allowBetaApps:destination:presentationStyle:actionMetrics:)();
}

uint64_t sub_76D100()
{
  return OpenAppAction.adamId.getter();
}

uint64_t sub_76D110()
{
  return type metadata accessor for OpenAppAction();
}

uint64_t sub_76D120()
{
  return dispatch thunk of static ASDInAppPurchaseDatabase.refresh()();
}

uint64_t sub_76D130()
{
  return type metadata accessor for ASDInAppPurchaseDatabase();
}

uint64_t sub_76D140()
{
  return ASDInAppPurchaseStateProvider.init()();
}

uint64_t sub_76D150()
{
  return type metadata accessor for ASDInAppPurchaseStateProvider();
}

uint64_t sub_76D160()
{
  return type metadata accessor for ClearAppUsageDataAction();
}

uint64_t sub_76D170()
{
  return LegacyAppState.AppInstallationDetails.hasPostProcessing.getter();
}

uint64_t sub_76D180()
{
  return LegacyAppState.AppInstallationDetails.downloadingPhaseProgress.getter();
}

uint64_t sub_76D190()
{
  return LegacyAppState.AppInstallationDetails.postProcessingPhaseProgress.getter();
}

uint64_t sub_76D1A0()
{
  return type metadata accessor for LegacyAppState.AppInstallationDetails();
}

uint64_t sub_76D1B0()
{
  return LegacyAppState.isUpdatable.getter();
}

uint64_t sub_76D1C0()
{
  return LegacyAppState.hasBeenPurchased.getter();
}

uint64_t sub_76D1D0()
{
  return LegacyAppState.isLocalApplication.getter();
}

uint64_t sub_76D1E0()
{
  return LegacyAppState.estimatedTimeRemaining.getter();
}

uint64_t sub_76D1F0()
{
  return LegacyAppState.estimatedTimeRemainingText.getter();
}

uint64_t sub_76D200()
{
  return LegacyAppState.isBuyable.getter();
}

uint64_t sub_76D210()
{
  return type metadata accessor for LegacyAppState();
}

uint64_t sub_76D220()
{
  return type metadata accessor for ModernAppStateDataSource();
}

uint64_t sub_76D230()
{
  return ModernAppStateDataSource.init(_:isIncremental:supportedAppKinds:)();
}

uint64_t sub_76D240()
{
  return static UpdateStore.didChangeNotification.getter();
}

uint64_t sub_76D250()
{
  return static UpdateStore.shared.getter();
}

uint64_t sub_76D260()
{
  return type metadata accessor for UpdateStore();
}

uint64_t sub_76D270()
{
  return static PendingAppLaunch.didFailToLaunch()();
}

uint64_t sub_76D280()
{
  return static PendingAppLaunch.didFinishLaunch(postEventUsing:)();
}

uint64_t sub_76D290()
{
  return RestoreAppStoreAction.gatedAppAdamId.getter();
}

uint64_t sub_76D2A0()
{
  return RestoreAppStoreAction.init(actionMetrics:gatedAppAdamId:)();
}

uint64_t sub_76D2B0()
{
  return type metadata accessor for RestoreAppStoreAction();
}

uint64_t sub_76D2C0()
{
  return TodayCardAppEventLockupOverlay.lockup.getter();
}

uint64_t sub_76D2D0()
{
  return type metadata accessor for TodayCardAppEventLockupOverlay();
}

uint64_t sub_76D2E0()
{
  return dispatch thunk of AppSearchResult.shouldDisplayMedia.getter();
}

uint64_t sub_76D2F0()
{
  return AppSearchResult.lockup.getter();
}

uint64_t sub_76D300()
{
  return type metadata accessor for AppSearchResult();
}

uint64_t sub_76D310()
{
  return type metadata accessor for AppShowcaseType();
}

uint64_t sub_76D320()
{
  return dispatch thunk of AppStateMachine.hasCurrentBetaState.getter();
}

uint64_t sub_76D330()
{
  return dispatch thunk of AppStateMachine.addStateTransitionObserver(_:action:)();
}

uint64_t sub_76D340()
{
  return dispatch thunk of AppStateMachine.appStateController.getter();
}

uint64_t sub_76D350()
{
  return dispatch thunk of AppStateMachine.removeStateTransitionActions(for:)();
}

uint64_t sub_76D360()
{
  return dispatch thunk of AppStateMachine.currentState.getter();
}

uint64_t sub_76D370()
{
  return dispatch thunk of AppStateMachine.currentStateIncludingBeta(_:)();
}

uint64_t sub_76D380()
{
  return dispatch thunk of AppStateMachine.startDownloadTime.getter();
}

uint64_t sub_76D390()
{
  return dispatch thunk of AppStateMachine.adamId.getter();
}

uint64_t sub_76D3A0()
{
  return type metadata accessor for AppPromotionType();
}

uint64_t sub_76D3B0()
{
  return AppUpdateLockups.pendingManual.getter();
}

uint64_t sub_76D3C0()
{
  return type metadata accessor for AppUpdateLockups();
}

uint64_t sub_76D3D0()
{
  return AppEventDetailPage.appEvent.getter();
}

uint64_t sub_76D3E0()
{
  return AppEventDetailPage.shareAction.getter();
}

uint64_t sub_76D3F0()
{
  return AppEventDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_76D400()
{
  return AppEventDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_76D410()
{
  return AppEventDetailPage.video.getter();
}

uint64_t sub_76D420()
{
  return AppEventDetailPage.artwork.getter();
}

uint64_t sub_76D430()
{
  return type metadata accessor for AppEventDetailPage();
}

uint64_t sub_76D440()
{
  return dispatch thunk of AppStateController.refreshState(for:)();
}

uint64_t sub_76D450()
{
  return dispatch thunk of AppStateController.setWaiting(for:installationType:)();
}

uint64_t sub_76D460()
{
  return dispatch thunk of AppStateController.clearWaiting(for:refreshState:)();
}

uint64_t sub_76D470()
{
  return dispatch thunk of AppStateController.stateMachine(forApp:)();
}

uint64_t sub_76D480()
{
  return dispatch thunk of AppStateController.refreshDataSources(for:completion:)();
}

uint64_t sub_76D490()
{
  return AppStateController.clearWaiting(for:)();
}

uint64_t sub_76D4A0()
{
  return static AppExitMetricsEvent.makeData()();
}

uint64_t sub_76D4B0()
{
  return type metadata accessor for AppEnterMetricsEvent.EnterKind();
}

uint64_t sub_76D4C0()
{
  return static AppEnterMetricsEvent.makeData(enterKind:)();
}

uint64_t sub_76D4D0()
{
  return AppEventSearchResult.appEvent.getter();
}

uint64_t sub_76D4E0()
{
  return AppEventSearchResult.lockup.getter();
}

uint64_t sub_76D4F0()
{
  return type metadata accessor for AppEventSearchResult();
}

uint64_t sub_76D510()
{
  return AppUpdatesDataSource.makeUpdatesLockupsStream()();
}

uint64_t sub_76D520()
{
  return AppUpdatesDataSource.init(objectGraph:)();
}

uint64_t sub_76D530()
{
  return type metadata accessor for AppUpdatesDataSource();
}

uint64_t sub_76D540()
{
  return AppEventFormattedDate.countdownToDate.getter();
}

uint64_t sub_76D550()
{
  return AppEventFormattedDate.displayFromDate.getter();
}

uint64_t sub_76D560()
{
  return AppEventFormattedDate.displayText.getter();
}

uint64_t sub_76D570()
{
  return AppEventFormattedDate.showLiveIndicator.getter();
}

uint64_t sub_76D580()
{
  return AppEventFormattedDate.countdownStringKey.getter();
}

uint64_t sub_76D590()
{
  return AppOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:appStoreInstallStateMonitor:restrictions:subtitlePosition:alignment:hasCompactRedownloads:arePreordersCancellable:includeBetaApps:)();
}

uint64_t sub_76D5A0()
{
  return type metadata accessor for AppOfferButtonPresenter();
}

uint64_t sub_76D5B0()
{
  return AppLaunchTrampolineAction.fallbackAction.getter();
}

uint64_t sub_76D5C0()
{
  return AppLaunchTrampolineAction.payloadUrl.getter();
}

uint64_t sub_76D5D0()
{
  return AppLaunchTrampolineAction.bundleId.getter();
}

uint64_t sub_76D5E0()
{
  return AppEventNotificationConfig.scheduleClickEvent.getter();
}

uint64_t sub_76D5F0()
{
  return AppEventNotificationConfig.cancelScheduleClickEvent.getter();
}

uint64_t sub_76D600()
{
  return AppEventNotificationConfig.appEventId.getter();
}

uint64_t sub_76D610()
{
  return AppEventNotificationConfig.displayTime.getter();
}

uint64_t sub_76D620()
{
  return AppEventNotificationConfig.failureAction.getter();
}

uint64_t sub_76D630()
{
  return AppEventNotificationConfig.scheduledAction.getter();
}

uint64_t sub_76D640()
{
  return AppEventNotificationConfig.notAuthorizedAction.getter();
}

uint64_t sub_76D650()
{
  return AppEventDetailPagePresenter.init(objectGraph:appEventDetailPage:)();
}

uint64_t sub_76D660()
{
  return dispatch thunk of AppEventDetailPagePresenter.lockupClickAction.getter();
}

uint64_t sub_76D670()
{
  return dispatch thunk of AppEventDetailPagePresenter.sizeClassDidChange()();
}

uint64_t sub_76D680()
{
  return dispatch thunk of AppEventDetailPagePresenter.view.setter();
}

uint64_t sub_76D690()
{
  return type metadata accessor for AppEventDetailPagePresenter();
}

uint64_t sub_76D6A0()
{
  return AppShowcaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76D6B0()
{
  return AppShowcaseLockupViewLayout.Metrics.init(isCenterAligned:iconSize:wordmarkSpace:titleSpace:titleWithWordmarkSpace:descriptionSpace:descriptionBottomBufferSpace:offerLabelSpace:offerLabelBottomBufferSpace:offerButtonSize:crossLinkTitleSpace:crossLinkTitleWithWordmarkSpace:crossLinkSubtitleSpace:)();
}

uint64_t sub_76D6C0()
{
  return type metadata accessor for AppShowcaseLockupViewLayout.Metrics();
}

uint64_t sub_76D6D0()
{
  return AppShowcaseLockupViewLayout.init(metrics:iconView:wordmarkView:titleText:descriptionText:offerButton:offerText:crossLinkTitleText:crossLinkSubtitleText:)();
}

uint64_t sub_76D6E0()
{
  return type metadata accessor for AppShowcaseLockupViewLayout();
}

uint64_t sub_76D6F0()
{
  return AppPromotionDetailPagePresenter.init(objectGraph:appPromotionDetailPage:)();
}

uint64_t sub_76D700()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.lockupClickAction.getter();
}

uint64_t sub_76D710()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.sizeClassDidChange()();
}

uint64_t sub_76D720()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.view.setter();
}

uint64_t sub_76D730()
{
  return type metadata accessor for AppPromotionDetailPagePresenter();
}

uint64_t sub_76D740()
{
  return AppEvent.moduleVideo.getter();
}

uint64_t sub_76D750()
{
  return AppEvent.requirements.getter();
}

uint64_t sub_76D760()
{
  return AppEvent.moduleArtwork.getter();
}

uint64_t sub_76D770()
{
  return AppEvent.formattedDates.getter();
}

uint64_t sub_76D780()
{
  return AppEvent.mediaOverlayStyle.getter();
}

uint64_t sub_76D790()
{
  return AppEvent.notificationConfig.getter();
}

uint64_t sub_76D7A0()
{
  return AppEvent.includeBorderInDarkMode.getter();
}

uint64_t sub_76D7B0()
{
  return AppEvent.hideLockupWhenNotInstalled.getter();
}

uint64_t sub_76D7C0()
{
  return AppEvent.kind.getter();
}

uint64_t sub_76D7D0()
{
  return AppEvent.title.getter();
}

uint64_t sub_76D7E0()
{
  return AppEvent.detail.getter();
}

uint64_t sub_76D7F0()
{
  return AppEvent.lockup.getter();
}

uint64_t sub_76D800()
{
  return AppEvent.subtitle.getter();
}

uint64_t sub_76D810()
{
  return type metadata accessor for AppEvent();
}

uint64_t sub_76D820()
{
  return AppPlatform.rawValue.getter();
}

uint64_t sub_76D830()
{
  return type metadata accessor for AppPlatform();
}

uint64_t sub_76D840()
{
  return AppShowcase.descriptionText.getter();
}

uint64_t sub_76D850()
{
  return AppShowcase.type.getter();
}

uint64_t sub_76D860()
{
  return AppShowcase.video.getter();
}

uint64_t sub_76D870()
{
  return AppShowcase.lockup.getter();
}

uint64_t sub_76D880()
{
  return type metadata accessor for AppShowcase();
}

uint64_t sub_76D890()
{
  return AppPromotion.clickAction.getter();
}

uint64_t sub_76D8A0()
{
  return AppPromotion.promotionType.getter();
}

uint64_t sub_76D8B0()
{
  return type metadata accessor for AppPromotion();
}

uint64_t sub_76D8C0()
{
  return type metadata accessor for StoreViewControllerLifecycleEvent();
}

uint64_t sub_76D8D0()
{
  return dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
}

uint64_t sub_76D8E0()
{
  return StoreTab.Identifier.init(navigationTab:)();
}

uint64_t sub_76D8F0()
{
  return StoreTab.Identifier.init(rawValue:)();
}

uint64_t sub_76D900()
{
  return StoreTab.Identifier.rawValue.getter();
}

uint64_t sub_76D910()
{
  return type metadata accessor for StoreTab.Identifier();
}

uint64_t sub_76D920()
{
  return StoreTab.init(identifier:url:title:imageIdentifier:editorialPageUrls:)();
}

uint64_t sub_76D930()
{
  return StoreTab.identifier.getter();
}

uint64_t sub_76D940()
{
  return StoreTab.editorialPageUrls.getter();
}

uint64_t sub_76D950()
{
  return StoreTab.url.getter();
}

uint64_t sub_76D960()
{
  return type metadata accessor for StoreTab();
}

uint64_t sub_76D970()
{
  return type metadata accessor for AppStoreEngagementEvent();
}

uint64_t sub_76D980()
{
  return AppStoreEngagementManager.recordEngagement(event:resultHandler:)();
}

uint64_t sub_76D990()
{
  return AppStoreEngagementManager.properties.getter();
}

uint64_t sub_76D9A0()
{
  return AppStoreEngagementManager.init(objectGraph:subscriptionManager:)();
}

void sub_76D9B0(Swift::String _, Swift::Bool isEnabled)
{
}

BOOL sub_76D9C0(Swift::String identifier)
{
  return AppStoreEngagementManager.isBadgeEnabled(identifier:)(identifier);
}

uint64_t sub_76D9D0()
{
  return AppStoreEngagementManager.previouslyDisabledProperties.getter();
}

uint64_t sub_76D9E0()
{
  return type metadata accessor for AppStoreEngagementManager();
}

uint64_t sub_76D9F0()
{
  return dispatch thunk of AppStoreInstallStateMonitor.onAppStoreInstallStateChange.getter();
}

uint64_t sub_76DA00()
{
  return dispatch thunk of AppStoreInstallStateMonitor.appStoreInstalled.getter();
}

void sub_76DA10()
{
}

uint64_t sub_76DA20()
{
  return dispatch thunk of AppStoreOnDeviceRecommendationsManager.loadInferences(for:)();
}

uint64_t sub_76DA30()
{
  return dispatch thunk of AppStoreOnDeviceRecommendationsManager.clearData()();
}

uint64_t sub_76DA40()
{
  return type metadata accessor for AppStoreOnDeviceRecommendationsManager();
}

uint64_t sub_76DA50()
{
  return AppStoreDeepLink.init(userActivity:refApp:)();
}

uint64_t sub_76DA60()
{
  return AppStoreDeepLink.url.getter();
}

uint64_t sub_76DA70()
{
  return AppStoreDeepLink.referral.getter();
}

uint64_t sub_76DA80()
{
  return type metadata accessor for AppStoreDeepLink();
}

uint64_t sub_76DA90()
{
  return Annotation.linkAction.getter();
}

uint64_t sub_76DAA0()
{
  return Annotation.shouldAlwaysPresentExpanded.getter();
}

uint64_t sub_76DAB0()
{
  return Annotation.items.getter();
}

uint64_t sub_76DAC0()
{
  return Annotation.title.getter();
}

uint64_t sub_76DAD0()
{
  return Annotation.summary.getter();
}

uint64_t sub_76DAE0()
{
  return Annotation.items_V2.getter();
}

uint64_t sub_76DAF0()
{
  return type metadata accessor for Annotation();
}

uint64_t sub_76DB00()
{
  return ArcadePage.subscriptionLockup.getter();
}

uint64_t sub_76DB10()
{
  return type metadata accessor for ArcadePage();
}

uint64_t sub_76DB20()
{
  return type metadata accessor for BadgeStyle();
}

uint64_t sub_76DB30()
{
  return BorderView.borderColor.setter();
}

uint64_t sub_76DB40()
{
  return BorderView.borderWidth.setter();
}

uint64_t sub_76DB50()
{
  return type metadata accessor for BorderView();
}

uint64_t sub_76DB60()
{
  return FlowAction.referrerUrl.getter();
}

uint64_t sub_76DB70()
{
  return FlowAction.setPageData(_:)();
}

uint64_t sub_76DB80()
{
  return FlowAction.referrerData.getter();
}

uint64_t sub_76DB90()
{
  return FlowAction.animationBehavior.getter();
}

uint64_t sub_76DBA0()
{
  return FlowAction.presentationContext.getter();
}

uint64_t sub_76DBB0()
{
  return FlowAction.presentationContext.setter();
}

uint64_t sub_76DBC0()
{
  return FlowAction.pageDataPageRenderMetrics.getter();
}

uint64_t sub_76DBD0()
{
  return FlowAction.init(id:title:artwork:page:url:referrerUrl:referrerData:pageData:actionMetrics:presentationContext:animationBehavior:origin:presentationStyle:presentation:)();
}

uint64_t sub_76DBE0()
{
  return FlowAction.page.getter();
}

uint64_t sub_76DBF0()
{
  return FlowAction.origin.getter();
}

uint64_t sub_76DC00()
{
  return FlowAction.pageUrl.getter();
}

uint64_t sub_76DC10()
{
  return FlowAction.pageData<A>(as:or:)();
}

uint64_t sub_76DC20()
{
  return type metadata accessor for FlowAction();
}

uint64_t sub_76DC30()
{
  return static FlowOrigin.== infix(_:_:)();
}

uint64_t sub_76DC40()
{
  return type metadata accessor for FlowOrigin();
}

uint64_t sub_76DC50()
{
  return static GameCenter.fetchGameRecord(for:with:)();
}

uint64_t sub_76DC60()
{
  return static GameCenter.withLocalPlayer(on:_:)();
}

uint64_t sub_76DC70()
{
  return static GameCenter.addContactToDenyList(_:for:)();
}

uint64_t sub_76DC80()
{
  return type metadata accessor for GameCenter.PushFriendInvitationType();
}

uint64_t sub_76DC90()
{
  return static GameCenter.inviteFriendViewController(localPlayer:contactId:)();
}

uint64_t sub_76DCB0()
{
  return type metadata accessor for GameCenter();
}

uint64_t sub_76DCC0()
{
  return HttpAction.failureAction.getter();
}

uint64_t sub_76DCD0()
{
  return HttpAction.successAction.getter();
}

uint64_t sub_76DCE0()
{
  return HttpAction.needsMediaToken.getter();
}

uint64_t sub_76DCF0()
{
  return HttpAction.start(urlSession:bag:process:bagContract:mediaTokenService:)();
}

uint64_t sub_76DD00()
{
  return type metadata accessor for HttpAction();
}

uint64_t sub_76DD10()
{
  return dispatch thunk of LinkLoader.setPresentation(_:forKey:)();
}

uint64_t sub_76DD20()
{
  return dispatch thunk of LinkLoader.fetchPresentation(for:cacheEnabled:)();
}

uint64_t sub_76DD30()
{
  return dispatch thunk of LinkLoader.availablePresentation(for:)();
}

uint64_t sub_76DD40()
{
  return LinkLoader.init(_:)();
}

uint64_t sub_76DD50()
{
  return type metadata accessor for MSOContext();
}

uint64_t sub_76DD60()
{
  return static OfferStyle.== infix(_:_:)();
}

uint64_t sub_76DD70()
{
  return type metadata accessor for OfferStyle();
}

uint64_t sub_76DD80()
{
  return PageFacets.FacetGroup.title.getter();
}

uint64_t sub_76DD90()
{
  return PageFacets.FacetGroup.facets.getter();
}

uint64_t sub_76DDA0()
{
  return type metadata accessor for PageFacets.FacetGroup();
}

uint64_t sub_76DDB0()
{
  return PageFacets.facetGroups.getter();
}

uint64_t sub_76DDC0()
{
  return type metadata accessor for PageFacets.Facet.DisplayType();
}

uint64_t sub_76DDD0()
{
  return PageFacets.Facet.displayType.getter();
}

uint64_t sub_76DDE0()
{
  return PageFacets.Facet.defaultOptions.getter();
}

uint64_t sub_76DDF0()
{
  return PageFacets.Facet.isHiddenFromMenu.getter();
}

uint64_t sub_76DE00()
{
  return PageFacets.Facet.displayOptionsInline.getter();
}

uint64_t sub_76DE10()
{
  return PageFacets.Facet.metricsParameterName.getter();
}

uint64_t sub_76DE20()
{
  return PageFacets.Facet.showsSelectedOptions.getter();
}

uint64_t sub_76DE30()
{
  return static PageFacets.Facet.== infix(_:_:)();
}

uint64_t sub_76DE40()
{
  return PageFacets.Facet.id.getter();
}

uint64_t sub_76DE50()
{
  return PageFacets.Facet.title.getter();
}

uint64_t sub_76DE60()
{
  return PageFacets.Facet.Option.metricsValue.getter();
}

uint64_t sub_76DE70()
{
  return PageFacets.Facet.Option.systemImageName.getter();
}

uint64_t sub_76DE80()
{
  return static PageFacets.Facet.Option.== infix(_:_:)();
}

uint64_t sub_76DE90()
{
  return PageFacets.Facet.Option.title.getter();
}

uint64_t sub_76DEA0()
{
  return type metadata accessor for PageFacets.Facet.Option();
}

uint64_t sub_76DEB0()
{
  return PageFacets.Facet.options.getter();
}

uint64_t sub_76DEC0()
{
  return type metadata accessor for PageFacets.Facet();
}

uint64_t sub_76DED0()
{
  return type metadata accessor for PageFacets();
}

uint64_t sub_76DEE0()
{
  return RateAction.adamId.getter();
}

uint64_t sub_76DEF0()
{
  return dispatch thunk of RateAction.rating.getter();
}

uint64_t sub_76DF00()
{
  return dispatch thunk of RateAction.rating.setter();
}

uint64_t sub_76DF10()
{
  return RateAction.Parameter.rawValue.getter();
}

uint64_t sub_76DF20()
{
  return type metadata accessor for RateAction.Parameter();
}

uint64_t sub_76DF30()
{
  return type metadata accessor for RateAction();
}

uint64_t sub_76DF40()
{
  return dispatch thunk of ShadowView.shouldAnimateBoundsChange.setter();
}

uint64_t sub_76DF50()
{
  return ShadowView.__allocating_init(radius:style:)();
}

uint64_t sub_76DF60()
{
  return dispatch thunk of ShadowView.shadow.setter();
}

uint64_t sub_76DF70()
{
  return dispatch thunk of ShadowView.setCorner(radius:style:)();
}

uint64_t sub_76DF80()
{
  return type metadata accessor for ShadowView();
}

uint64_t sub_76DF90()
{
  return ShelfBatch.shelves.getter();
}

uint64_t sub_76DFA0()
{
  return StyledText.init(rawText:rawTextType:)();
}

uint64_t sub_76DFB0()
{
  return dispatch thunk of StyledText.plainText.getter();
}

uint64_t sub_76DFC0()
{
  return dispatch thunk of StyledText.asAttributedString(using:)();
}

uint64_t sub_76DFD0()
{
  return type metadata accessor for StyledText.MediaType();
}

uint64_t sub_76DFE0()
{
  return type metadata accessor for StyledText();
}

uint64_t sub_76DFF0()
{
  return tryToFetch(artworkFor:into:on:asPartOf:)();
}

uint64_t sub_76E000()
{
  return AlertAction.destructiveActionIndex.getter();
}

uint64_t sub_76E010()
{
  return AlertAction.cancelTitle.getter();
}

uint64_t sub_76E020()
{
  return AlertAction.isCancelable.getter();
}

uint64_t sub_76E030()
{
  return AlertAction.buttonActions.getter();
}

uint64_t sub_76E040()
{
  return AlertAction.toastDuration.getter();
}

uint64_t sub_76E050()
{
  return AlertAction.style.getter();
}

uint64_t sub_76E060()
{
  return AlertAction.init(title:message:isCancelable:cancelTitle:cancelAction:buttonActions:destructiveActionIndex:style:artwork:toastDuration:presentationStyle:actionMetrics:)();
}

uint64_t sub_76E070()
{
  return AlertAction.message.getter();
}

uint64_t sub_76E080()
{
  return type metadata accessor for AlertAction();
}

uint64_t sub_76E090()
{
  return ArcadeState.isSubscribed.getter();
}

uint64_t sub_76E0A0()
{
  return ArcadeState.shortSummary.getter();
}

uint64_t sub_76E0B0()
{
  return ArcadeState.isTrialAvailable.getter();
}

uint64_t sub_76E0C0()
{
  return type metadata accessor for ArcadeState();
}

uint64_t sub_76E0D0()
{
  return ArticlePage.__allocating_init(copying:replacingCard:)();
}

uint64_t sub_76E0E0()
{
  return type metadata accessor for ArticlePage();
}

uint64_t sub_76E0F0()
{
  return static ArtworkView.cardArtworkView.getter();
}

uint64_t sub_76E100()
{
  return static ArtworkView.iconArtworkView.getter();
}

uint64_t sub_76E110()
{
  return static ArtworkView.brickArtworkView.getter();
}

uint64_t sub_76E120()
{
  return static ArtworkView.iapIconArtworkView.getter();
}

uint64_t sub_76E130()
{
  return ArtworkView.isImageHidden.setter();
}

uint64_t sub_76E140()
{
  return ArtworkView.roundedCorners.setter();
}

uint64_t sub_76E150()
{
  return ArtworkView.backgroundColor.setter();
}

uint64_t sub_76E160()
{
  return static ArtworkView.iconBorderColor.getter();
}

uint64_t sub_76E170()
{
  return static ArtworkView.iconBorderWidth.getter();
}

uint64_t sub_76E180()
{
  return ArtworkView.artworkTintColor.setter();
}

uint64_t sub_76E190()
{
  return ArtworkView.placeholderColor.setter();
}

uint64_t sub_76E1A0()
{
  return ArtworkView.clipImageToBounds.setter();
}

uint64_t sub_76E1B0()
{
  return ArtworkView.frameUpdatesImageSize.setter();
}

uint64_t sub_76E1C0()
{
  return ArtworkView.isDisplayingSymbolImage.getter();
}

uint64_t sub_76E1D0()
{
  return ArtworkView.shouldSymbolImageSelfSize.setter();
}

uint64_t sub_76E1E0()
{
  return ArtworkView.setImageDisablesAnimations.setter();
}

uint64_t sub_76E1F0()
{
  return ArtworkView.preferredSymbolConfiguration.getter();
}

uint64_t sub_76E200()
{
  return ArtworkView.preferredSymbolConfiguration.setter();
}

uint64_t sub_76E210()
{
  return ArtworkView.imageBaselineOffsetFromBottom.getter();
}

uint64_t sub_76E220()
{
  return ArtworkView.accessibilityIgnoresInvertColors.setter();
}

void sub_76E230(UIImage_optional image, Swift::Bool isAnimationPermitted)
{
}

uint64_t sub_76E240()
{
  return ArtworkView.frame.modify();
}

uint64_t sub_76E250()
{
  return ArtworkView.frame.getter();
}

uint64_t sub_76E260()
{
  return ArtworkView.frame.setter();
}

uint64_t sub_76E270()
{
  return ArtworkView.image.getter();
}

uint64_t sub_76E280()
{
  return ArtworkView.image.setter();
}

uint64_t sub_76E290()
{
  return ArtworkView.style.getter();
}

uint64_t sub_76E2A0()
{
  return ArtworkView.style.setter();
}

uint64_t sub_76E2B0()
{
  return ArtworkView.shadow.setter();
}

void sub_76E2C0(UIImage_optional image, Swift::Bool animated)
{
}

uint64_t sub_76E2D0()
{
  return ArtworkView.imageSize.getter();
}

uint64_t sub_76E2E0()
{
  return ArtworkView.imageSize.setter();
}

uint64_t sub_76E2F0()
{
  return ArtworkView.setCorner(radius:style:)();
}

uint64_t sub_76E300()
{
  return type metadata accessor for ArtworkView();
}

uint64_t sub_76E310()
{
  return BlankAction.__allocating_init(actionMetrics:)();
}

uint64_t sub_76E320()
{
  return BlankAction.init(id:title:artwork:presentationStyle:actionMetrics:impressionMetrics:)();
}

uint64_t sub_76E330()
{
  return type metadata accessor for BlankAction();
}

uint64_t sub_76E340()
{
  return BrickLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76E350()
{
  return BrickLayout.Metrics.init(artworkAspectRatio:labelSpace:labelFontSource:isLabelFullWidth:numberOfLines:)();
}

uint64_t sub_76E360()
{
  return type metadata accessor for BrickLayout.Metrics();
}

uint64_t sub_76E370()
{
  return BrickLayout.init(metrics:artworkView:labelView:)();
}

uint64_t sub_76E380()
{
  return type metadata accessor for BrickLayout();
}

uint64_t sub_76E390()
{
  return Conditional.evaluate<>(in:)();
}

uint64_t sub_76E3A0()
{
  return Conditional.evaluate(with:)();
}

uint64_t sub_76E3B0()
{
  return Conditional<>.init(regularValue:rightToLeftValue:)();
}

uint64_t sub_76E3C0()
{
  return Conditional<>.init(regularValue:compactValue:)();
}

uint64_t sub_76E3D0()
{
  return Conditional<>.init(accessibleLayoutValue:regularLayoutValue:)();
}

uint64_t sub_76E3E0()
{
  return Conditional<>.init(value:)();
}

uint64_t sub_76E3F0()
{
  return Conditional<>.init(property:trueValue:falseValue:)();
}

uint64_t sub_76E400()
{
  return Conditional<>.anyDimension.getter();
}

uint64_t sub_76E410()
{
  return Conditional<>.init(regularConstant:compactConstant:regularSource:compactSource:)();
}

uint64_t sub_76E420()
{
  return Conditional<>.init(regularConstant:compactConstant:source:)();
}

uint64_t sub_76E430()
{
  return Conditional<>.init(roundedCornersConstant:nonRoundedCornersConstant:source:)();
}

uint64_t sub_76E440()
{
  return Conditional<>.init(accessibleLayoutConstant:regularLayoutConstant:source:)();
}

uint64_t sub_76E450()
{
  return Conditional<>.value(in:rounded:)();
}

uint64_t sub_76E460()
{
  return Conditional<>.init(roundedCornersValue:nonRoundedCornersValue:)();
}

uint64_t sub_76E470()
{
  return Conditional<>.value.getter();
}

uint64_t sub_76E480()
{
  return Conditional<>.init(whenOneOf:use:otherwiseUse:)();
}

uint64_t sub_76E490()
{
  return type metadata accessor for Conditional();
}

uint64_t sub_76E4A0()
{
  return Conditional.init(_:)();
}

uint64_t sub_76E4B0()
{
  return static CornerStyle.== infix(_:_:)();
}

uint64_t sub_76E4C0()
{
  return type metadata accessor for CornerStyle();
}

uint64_t sub_76E4D0()
{
  return DynamicPage.presentationOptions.getter();
}

uint64_t sub_76E4E0()
{
  return FinanceType.url.getter();
}

uint64_t sub_76E4F0()
{
  return type metadata accessor for FinanceType();
}

uint64_t sub_76E500()
{
  return FlowPreview.init(destination:actions:)();
}

uint64_t sub_76E510()
{
  return FlowPreview.destination.getter();
}

uint64_t sub_76E520()
{
  return FlowPreview.actions.getter();
}

uint64_t sub_76E530()
{
  return type metadata accessor for FlowPreview();
}

uint64_t sub_76E540()
{
  return FramedMedia.isFullWidth.getter();
}

uint64_t sub_76E550()
{
  return FramedMedia.hasRoundedCorners.getter();
}

uint64_t sub_76E560()
{
  return FramedMedia.caption.getter();
}

uint64_t sub_76E570()
{
  return FramedMedia.ordinal.getter();
}

uint64_t sub_76E580()
{
  return FramedVideo.video.getter();
}

uint64_t sub_76E590()
{
  return FramedVideo.artwork.getter();
}

uint64_t sub_76E5A0()
{
  return type metadata accessor for FramedVideo();
}

uint64_t sub_76E5B0()
{
  return GenericPage.presentationOptions.getter();
}

uint64_t sub_76E5C0()
{
  return GenericPage.title.getter();
}

uint64_t sub_76E5D0()
{
  return GenericPage.init(shelves:title:shareAction:presentationOptions:nextPage:isIncomplete:uber:loadCompletedAction:pageRefreshPolicy:pageMetrics:pageRenderEvent:context:)();
}

uint64_t sub_76E5E0()
{
  return type metadata accessor for GenericPage();
}

void sub_76E5F0()
{
}

uint64_t sub_76E600()
{
  return type metadata accessor for LocalAction();
}

uint64_t sub_76E610()
{
  return ObjectGraph.artworkLoader.getter();
}

uint64_t sub_76E620()
{
  return ObjectGraph.actionDispatcher.getter();
}

uint64_t sub_76E630()
{
  return type metadata accessor for ObjectGraph();
}

uint64_t sub_76E640()
{
  return OfferAction.buyCompletedAction.getter();
}

uint64_t sub_76E650()
{
  return OfferAction.purchaseToken.getter();
}

uint64_t sub_76E660()
{
  return OfferAction.purchaseToken.setter();
}

uint64_t sub_76E670()
{
  return OfferAction.includeBetaApps.getter();
}

uint64_t sub_76E680()
{
  return OfferAction.adamId.getter();
}

uint64_t sub_76E690()
{
  return OfferAction.bundleId.getter();
}

uint64_t sub_76E6A0()
{
  return type metadata accessor for OfferAction();
}

uint64_t sub_76E6B0()
{
  return static Placeholder.subtitleText.getter();
}

uint64_t sub_76E6C0()
{
  return static Placeholder.appEventKindText.getter();
}

uint64_t sub_76E6D0()
{
  return static Placeholder.headingTitleText.getter();
}

uint64_t sub_76E6E0()
{
  return static Placeholder.appEventTitleText.getter();
}

uint64_t sub_76E6F0()
{
  return static Placeholder.appEventSubtitleText.getter();
}

uint64_t sub_76E700()
{
  return static Placeholder.titleText.getter();
}

uint64_t sub_76E710()
{
  return type metadata accessor for Placeholder();
}

uint64_t sub_76E720()
{
  return PrivacyType.categories.getter();
}

uint64_t sub_76E730()
{
  return PrivacyType.wantsScrollFocus.getter();
}

uint64_t sub_76E740()
{
  return PrivacyType.style.getter();
}

uint64_t sub_76E750()
{
  return PrivacyType.title.getter();
}

uint64_t sub_76E760()
{
  return PrivacyType.detail.getter();
}

uint64_t sub_76E770()
{
  return PrivacyType.artwork.getter();
}

uint64_t sub_76E780()
{
  return type metadata accessor for PrivacyType();
}

uint64_t sub_76E790()
{
  return ReviewsPage.SortOption.selectedActionTitle.getter();
}

uint64_t sub_76E7A0()
{
  return type metadata accessor for ReviewsPage();
}

uint64_t sub_76E7B0()
{
  return Screenshots.mediaPlatform.getter();
}

uint64_t sub_76E7C0()
{
  return Screenshots.artwork.getter();
}

uint64_t sub_76E7D0()
{
  return type metadata accessor for Screenshots();
}

uint64_t sub_76E7E0()
{
  return SheetAction.destructiveActionIndex.getter();
}

uint64_t sub_76E7F0()
{
  return SheetAction.cancelTitle.getter();
}

uint64_t sub_76E800()
{
  return SheetAction.checkedIndex.getter();
}

uint64_t sub_76E810()
{
  return SheetAction.isCancelable.getter();
}

uint64_t sub_76E820()
{
  return SheetAction.style.getter();
}

uint64_t sub_76E830()
{
  return SheetAction.actions.getter();
}

uint64_t sub_76E840()
{
  return SheetAction.message.getter();
}

uint64_t sub_76E850()
{
  return SheetAction.isCustom.getter();
}

uint64_t sub_76E860()
{
  return ShelfHeader.shouldUseShelfHeader.getter();
}

uint64_t sub_76E870()
{
  return type metadata accessor for ShelfHeader.ArtworkType();
}

uint64_t sub_76E880()
{
  return ShelfHeader.titleAction.getter();
}

uint64_t sub_76E890()
{
  return ShelfHeader.titleArtwork.getter();
}

uint64_t sub_76E8A0()
{
  return ShelfHeader.Configuration.titleColor.getter();
}

uint64_t sub_76E8B0()
{
  return ShelfHeader.Configuration.init(eyebrowColor:eyebrowImageColor:titleColor:titleImageColor:subtitleColor:accessoryColor:includeSeparator:includeTrailingArtwork:prefersShelfHeader:)();
}

uint64_t sub_76E8C0()
{
  return ShelfHeader.Configuration.eyebrowColor.getter();
}

uint64_t sub_76E8D0()
{
  return ShelfHeader.Configuration.subtitleColor.getter();
}

uint64_t sub_76E8E0()
{
  return ShelfHeader.Configuration.accessoryColor.getter();
}

uint64_t sub_76E8F0()
{
  return ShelfHeader.Configuration.titleImageColor.getter();
}

uint64_t sub_76E900()
{
  return ShelfHeader.Configuration.includeSeparator.getter();
}

uint64_t sub_76E910()
{
  return ShelfHeader.Configuration.eyebrowImageColor.getter();
}

uint64_t sub_76E920()
{
  return type metadata accessor for ShelfHeader.Configuration();
}

uint64_t sub_76E930()
{
  return ShelfHeader.configuration.getter();
}

uint64_t sub_76E940()
{
  return ShelfHeader.eyebrowAction.getter();
}

uint64_t sub_76E950()
{
  return ShelfHeader.eyebrowArtwork.getter();
}

uint64_t sub_76E960()
{
  return ShelfHeader.accessoryAction.getter();
}

uint64_t sub_76E970()
{
  return ShelfHeader.titleArtworkType.getter();
}

uint64_t sub_76E980()
{
  return ShelfHeader.eyebrowArtworkType.getter();
}

uint64_t sub_76E990()
{
  return ShelfHeader.hasTrailingArtwork.getter();
}

uint64_t sub_76E9A0()
{
  return ShelfHeader.eyebrowTrailingArtwork.getter();
}

uint64_t sub_76E9B0()
{
  return ShelfHeader.title.getter();
}

uint64_t sub_76E9C0()
{
  return ShelfHeader.init(eyebrow:eyebrowArtwork:eyebrowArtworkType:eyebrowAction:eyebrowTrailingArtwork:title:titleArtwork:titleArtworkType:titleAction:subtitle:trailingArtwork:accessoryAction:configuration:)();
}

uint64_t sub_76E9D0()
{
  return ShelfHeader.eyebrow.getter();
}

uint64_t sub_76E9E0()
{
  return ShelfHeader.subtitle.getter();
}

uint64_t sub_76E9F0()
{
  return type metadata accessor for ShelfHeader();
}

uint64_t sub_76EA00()
{
  return type metadata accessor for ShelfMarker();
}

uint64_t sub_76EA10()
{
  return static SystemImage.load(artwork:with:includePrivateImages:)();
}

uint64_t sub_76EA20()
{
  return static SystemImage.load(_:with:includePrivateImages:)();
}

uint64_t sub_76EA30()
{
  return static SystemImage.load(_:with:)();
}

uint64_t sub_76EA40()
{
  return type metadata accessor for SystemImage();
}

uint64_t sub_76EA50()
{
  return static TimingCurve.easingCurve1.getter();
}

uint64_t sub_76EA60()
{
  return static TimingCurve.easingCurve2.getter();
}

uint64_t sub_76EA70()
{
  return TimingCurve.controlPoint1.getter();
}

uint64_t sub_76EA80()
{
  return TimingCurve.controlPoint2.getter();
}

uint64_t sub_76EA90()
{
  return type metadata accessor for TimingCurve();
}

uint64_t sub_76EAA0()
{
  return type metadata accessor for TitleEffect();
}

uint64_t sub_76EAB0()
{
  return dispatch thunk of VideoPlayer.playerItem.getter();
}

uint64_t sub_76EAC0()
{
  return dispatch thunk of VideoPlayer.releaseAssets()();
}

uint64_t sub_76EAD0()
{
  return dispatch thunk of VideoPlayer.shouldBePlaying.getter();
}

uint64_t sub_76EAE0()
{
  return dispatch thunk of VideoPlayer.startPreloading()();
}

uint64_t sub_76EAF0()
{
  return dispatch thunk of VideoPlayer.shouldLoopPlayback.setter();
}

uint64_t sub_76EB00()
{
  return VideoPlayer.init(with:)();
}

uint64_t sub_76EB10()
{
  return dispatch thunk of VideoPlayer.state.getter();
}

uint64_t sub_76EB20()
{
  return dispatch thunk of VideoPlayer.restart()();
}

uint64_t sub_76EB30()
{
  return dispatch thunk of VideoPlayer.delegate.setter();
}

uint64_t sub_76EB40()
{
  return dispatch thunk of VideoPlayer.videoUrl.getter();
}

uint64_t sub_76EB50()
{
  return dispatch thunk of VideoPlayer.isLoading.getter();
}

uint64_t sub_76EB60()
{
  return dispatch thunk of VideoPlayer.isPlaying.getter();
}

uint64_t sub_76EB70()
{
  return type metadata accessor for VideoPlayer();
}

uint64_t sub_76EB80()
{
  return type metadata accessor for ASKBootstrap.TargetType();
}

uint64_t sub_76EB90()
{
  return static ASKBootstrap.tokenServiceClient.getter();
}

uint64_t sub_76EBA0()
{
  return ActionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76EBB0()
{
  return static ActionLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_76EBC0()
{
  return ActionLayout.Metrics.init(artworkSize:maxArtworkSize:artworkMargin:artworkLeadingMargin:labelWithArtworkLeadingMargin:accessoryMargin:labelFontSource:labelVerticalMargin:searchAdButtonTopMargin:searchAdButtonLeadingMargin:shouldLabelFitAvailableWidth:)();
}

uint64_t sub_76EBD0()
{
  return ActionLayout.Metrics.artworkSize.getter();
}

uint64_t sub_76EBE0()
{
  return ActionLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_76EBF0()
{
  return ActionLayout.Metrics.maxArtworkSize.getter();
}

uint64_t sub_76EC00()
{
  return ActionLayout.Metrics.labelFontSource.getter();
}

uint64_t sub_76EC10()
{
  return type metadata accessor for ActionLayout.Metrics();
}

uint64_t sub_76EC20()
{
  return ActionLayout.init(metrics:artworkView:labelView:accessoryView:searchAdButton:artworkBaselineOffsetFromBottom:isDisplayingSearchTrendingItem:restrictArtworkSizeToMetrics:in:)();
}

uint64_t sub_76EC30()
{
  return type metadata accessor for ActionLayout();
}

uint64_t sub_76EC40()
{
  return ArcadeAction.postSubscribeAction.getter();
}

uint64_t sub_76EC50()
{
  return ArcadeAction.subscriptionToken.getter();
}

uint64_t sub_76EC60()
{
  return ArcadeAction.appAdamId.getter();
}

uint64_t sub_76EC70()
{
  return ArcadeAction.productId.getter();
}

uint64_t sub_76EC80()
{
  return ArcadeFooter.buttonAction.getter();
}

uint64_t sub_76EC90()
{
  return ArcadeFooter.backgroundColor.getter();
}

uint64_t sub_76ECA0()
{
  return ArcadeFooter.icons.getter();
}

uint64_t sub_76ECB0()
{
  return ArcadeFooter.footnote.getter();
}

uint64_t sub_76ECC0()
{
  return ArcadeLockup.impressionMetrics.getter();
}

uint64_t sub_76ECD0()
{
  return ArcadeLockup.subscribedSubtitle.getter();
}

uint64_t sub_76ECE0()
{
  return ArcadeLockup.nonsubscribedSubtitle.getter();
}

uint64_t sub_76ECF0()
{
  return ArcadeLockup.offerDisplayProperties.getter();
}

uint64_t sub_76ED00()
{
  return ArcadeLockup.subscribedButtonAction.getter();
}

uint64_t sub_76ED10()
{
  return ArcadeLockup.unsubscribedButtonAction.getter();
}

uint64_t sub_76ED20()
{
  return HeroCarousel.wantsTopGradient.getter();
}

uint64_t sub_76ED30()
{
  return HeroCarousel.wantsBottomGradient.getter();
}

uint64_t sub_76ED40()
{
  return HeroCarousel.autoScrollConfiguration.getter();
}

uint64_t sub_76ED50()
{
  return HeroCarousel.id.getter();
}

uint64_t sub_76ED60()
{
  return HeroCarousel.items.getter();
}

uint64_t sub_76ED70()
{
  return type metadata accessor for HeroCarousel();
}

uint64_t sub_76ED80()
{
  return HideCriteria.isHidden.getter();
}

uint64_t sub_76ED90()
{
  return type metadata accessor for HideCriteria();
}

uint64_t sub_76EDA0()
{
  return Interpolator.value(forInput:)();
}

uint64_t sub_76EDB0()
{
  return Interpolator.value(forInput:)();
}

uint64_t sub_76EDC0()
{
  return Interpolator.init(fromValue:toValue:curve:)();
}

uint64_t sub_76EDD0()
{
  return LinkableText.plainText.getter();
}

uint64_t sub_76EDE0()
{
  return LinkableText.styledText.getter();
}

uint64_t sub_76EDF0()
{
  return LinkableText.linkedSubstrings.getter();
}

uint64_t sub_76EE00()
{
  return LinkableText.__allocating_init(id:text:linkedSubstrings:)();
}

uint64_t sub_76EE10()
{
  return type metadata accessor for LinkableText();
}

uint64_t sub_76EE20()
{
  return dispatch thunk of MetricsEvent.metricsData.getter();
}

uint64_t sub_76EE30()
{
  return PosterLockup.footerText.getter();
}

uint64_t sub_76EE40()
{
  return PosterLockup.epicHeading.getter();
}

uint64_t sub_76EE50()
{
  return PosterLockup.posterVideo.getter();
}

uint64_t sub_76EE60()
{
  return PosterLockup.posterArtwork.getter();
}

uint64_t sub_76EE70()
{
  return PosterLockup.isDark.getter();
}

uint64_t sub_76EE80()
{
  return type metadata accessor for PosterLockup();
}

uint64_t sub_76EE90()
{
  return ProductMedia.hasPortraitPhoneMedia.getter();
}

uint64_t sub_76EEA0()
{
  return ProductMedia.allPlatforms.getter();
}

uint64_t sub_76EEB0()
{
  return ProductMedia.platformDescription.getter();
}

uint64_t sub_76EEC0()
{
  return type metadata accessor for ProductMedia.DescriptionPlacement();
}

uint64_t sub_76EED0()
{
  return ProductMedia.descriptionPlacement(when:)();
}

uint64_t sub_76EEE0()
{
  return ProductMedia.allPlatformsDescription.getter();
}

uint64_t sub_76EEF0()
{
  return ProductMedia.items.getter();
}

uint64_t sub_76EF00()
{
  return ProductMedia.platform.getter();
}

uint64_t sub_76EF10()
{
  return type metadata accessor for ProductMedia();
}

uint64_t sub_76EF20()
{
  return type metadata accessor for PurchaseType();
}

uint64_t sub_76EF30()
{
  return ReferrerData.init(app:externalUrl:kind:)();
}

uint64_t sub_76EF40()
{
  return type metadata accessor for ReferrerData.Kind();
}

uint64_t sub_76EF50()
{
  return type metadata accessor for ReferrerData();
}

uint64_t sub_76EF60()
{
  return SearchAction.guidedSearchOptimizationTerm.getter();
}

uint64_t sub_76EF70()
{
  return SearchAction.guidedSearchTokens.getter();
}

uint64_t sub_76EF80()
{
  return SearchAction.prefixTerm.getter();
}

uint64_t sub_76EF90()
{
  return SearchAction.excludedTerms.getter();
}

uint64_t sub_76EFA0()
{
  return SearchAction.originatingTerm.getter();
}

uint64_t sub_76EFB0()
{
  return SearchAction.spellCheckEnabled.getter();
}

uint64_t sub_76EFC0()
{
  return SearchAction.term.getter();
}

uint64_t sub_76EFD0()
{
  return SearchAction.init(title:term:url:origin:source:entity:spellCheckEnabled:excludedTerms:originatingTerm:prefixTerm:guidedSearchTokens:guidedSearchOptimizationTerm:actionMetrics:)();
}

uint64_t sub_76EFE0()
{
  return SearchAction.entity.getter();
}

uint64_t sub_76EFF0()
{
  return SearchAction.origin.getter();
}

uint64_t sub_76F000()
{
  return SearchAction.source.getter();
}

uint64_t sub_76F010()
{
  return type metadata accessor for SearchAction();
}

uint64_t sub_76F020()
{
  return type metadata accessor for SearchEntity();
}

uint64_t sub_76F030()
{
  return type metadata accessor for SearchOrigin();
}

uint64_t sub_76F040()
{
  return SearchResult.condensedBehavior.getter();
}

uint64_t sub_76F050()
{
  return type metadata accessor for SearchResult();
}

uint64_t sub_76F060()
{
  return TitledButton.id.getter();
}

uint64_t sub_76F070()
{
  return TitledButton.title.getter();
}

uint64_t sub_76F080()
{
  return TitledButton.action.getter();
}

uint64_t sub_76F090()
{
  return WordmarkView.show(wordmark:with:)();
}

uint64_t sub_76F0A0()
{
  return WordmarkView.init(frame:wordmark:referenceLineHeight:alignment:)();
}

uint64_t sub_76F0B0()
{
  return type metadata accessor for WordmarkView.Alignment();
}

uint64_t sub_76F0C0()
{
  return WordmarkView.alignment.setter();
}

uint64_t sub_76F0D0()
{
  return type metadata accessor for WordmarkView();
}

uint64_t sub_76F0E0()
{
  return ArtworkLoader.fetchArtwork(using:forReason:closestMatch:handlerKey:completionHandler:)();
}

uint64_t sub_76F0F0()
{
  return ArtworkLoader.fetchArtwork<A>(using:forReason:closestMatch:into:)();
}

void sub_76F100(Swift::OpaquePointer using)
{
}

uint64_t sub_76F110()
{
  return ArtworkLoader.__allocating_init(cacheLimit:renderIntent:)();
}

uint64_t sub_76F120()
{
  return static ArtworkLoader.handlerKey<A>(for:)();
}

uint64_t sub_76F130()
{
  return ArtworkLoader.isOccluded.setter();
}

uint64_t sub_76F140()
{
  return ArtworkLoader.forgetFetch(forHandlerKey:deprioritizingFetch:)();
}

uint64_t sub_76F150()
{
  return ArtworkLoader.forgetFetch<A>(forView:deprioritizingFetch:)();
}

uint64_t sub_76F160()
{
  return ArtworkLoader.pageRenderMetrics.setter();
}

uint64_t sub_76F170()
{
  return ArtworkLoader.init(parent:)();
}

uint64_t sub_76F180()
{
  return ArtworkLoader.register(resourceLoader:)();
}

uint64_t sub_76F190()
{
  return type metadata accessor for ArtworkLoader();
}

uint64_t sub_76F1A0()
{
  return dispatch thunk of BasePresenter.pageRenderMetrics.getter();
}

uint64_t sub_76F1B0()
{
  return dispatch thunk of BasePresenter.pendingPageRender.getter();
}

uint64_t sub_76F1C0()
{
  return BasePresenter.impressionsTracker.getter();
}

uint64_t sub_76F1D0()
{
  return BasePresenter.impressionsCalculator.getter();
}

uint64_t sub_76F1E0()
{
  return dispatch thunk of BasePresenter.didLoad()();
}

uint64_t sub_76F1F0()
{
  return dispatch thunk of BasePresenter.referrer.getter();
}

uint64_t sub_76F200()
{
  return dispatch thunk of BasePresenter.referrer.setter();
}

uint64_t sub_76F210()
{
  return type metadata accessor for BasePresenter();
}

uint64_t sub_76F220()
{
  return EditorialCard.clickAction.getter();
}

uint64_t sub_76F230()
{
  return EditorialCard.mediaOverlayStyle.getter();
}

uint64_t sub_76F240()
{
  return EditorialCard.appEventFormattedDates.getter();
}

uint64_t sub_76F250()
{
  return EditorialCard.title.getter();
}

uint64_t sub_76F260()
{
  return EditorialCard.lockup.getter();
}

uint64_t sub_76F270()
{
  return EditorialCard.artwork.getter();
}

uint64_t sub_76F280()
{
  return EditorialCard.caption.getter();
}

uint64_t sub_76F290()
{
  return EditorialCard.subtitle.getter();
}

uint64_t sub_76F2A0()
{
  return type metadata accessor for EditorialCard();
}

uint64_t sub_76F2B0()
{
  return EditorialLink.summaryText.getter();
}

uint64_t sub_76F2C0()
{
  return EditorialLink.descriptionText.getter();
}

uint64_t sub_76F2D0()
{
  return EditorialLink.linkPresentationEnabled.getter();
}

uint64_t sub_76F2E0()
{
  return dispatch thunk of EditorialLink.url.getter();
}

uint64_t sub_76F2F0()
{
  return type metadata accessor for EditorialLink();
}

uint64_t sub_76F300()
{
  return EditorsChoice.showsBadge.getter();
}

uint64_t sub_76F310()
{
  return EditorsChoice.isCollapsed.getter();
}

uint64_t sub_76F320()
{
  return EditorsChoice.notes.getter();
}

uint64_t sub_76F330()
{
  return EditorsChoice.title.getter();
}

uint64_t sub_76F340()
{
  return type metadata accessor for EditorsChoice();
}

uint64_t sub_76F350()
{
  return FramedArtwork.artwork.getter();
}

uint64_t sub_76F360()
{
  return type metadata accessor for FramedArtwork();
}

uint64_t sub_76F370()
{
  return dispatch thunk of GladiatorRule.validate(events:)();
}

uint64_t sub_76F380()
{
  return dispatch thunk of MediaPlatform.supplementaryAppPlatforms.getter();
}

uint64_t sub_76F390()
{
  return MediaPlatform.appPlatform.getter();
}

uint64_t sub_76F3A0()
{
  return dispatch thunk of MediaPlatform.isPhonePlatform.getter();
}

uint64_t sub_76F3B0()
{
  return static MediaPlatform.systemImages(platforms:)();
}

uint64_t sub_76F3C0()
{
  return MediaPlatform.systemImageName.getter();
}

uint64_t sub_76F3D0()
{
  return MediaPlatform.deviceBorderThickness.getter();
}

uint64_t sub_76F3E0()
{
  return MediaPlatform.deviceCornerRadiusFactor.getter();
}

uint64_t sub_76F3F0()
{
  return type metadata accessor for MediaPlatform();
}

uint64_t sub_76F400()
{
  return NavigationTab.pageContext.getter();
}

uint64_t sub_76F410()
{
  return NavigationTab.init(intValue:)();
}

uint64_t sub_76F420()
{
  return NavigationTab.intValue.getter();
}

uint64_t sub_76F430()
{
  return type metadata accessor for NavigationTab();
}

uint64_t sub_76F440()
{
  return PageGridCache.init()();
}

uint64_t sub_76F450()
{
  return type metadata accessor for PageGridCache();
}

uint64_t sub_76F460()
{
  return PrivacyFooter.bodyText.getter();
}

uint64_t sub_76F470()
{
  return type metadata accessor for PrivacyFooter();
}

uint64_t sub_76F480()
{
  return PrivacyHeader.isDetailHeader.getter();
}

uint64_t sub_76F490()
{
  return PrivacyHeader.supplementaryItems.getter();
}

uint64_t sub_76F4A0()
{
  return PrivacyHeader.bodyText.getter();
}

uint64_t sub_76F4B0()
{
  return type metadata accessor for PrivacyHeader();
}

uint64_t sub_76F4C0()
{
  return type metadata accessor for ProductReview.ReviewSource();
}

uint64_t sub_76F4D0()
{
  return ProductReview.source.getter();
}

uint64_t sub_76F4E0()
{
  return type metadata accessor for ProductReview();
}

uint64_t sub_76F4F0()
{
  return ReviewSummary.bodySeeAll.getter();
}

uint64_t sub_76F500()
{
  return ReviewSummary.bodyWithTitle.getter();
}

uint64_t sub_76F510()
{
  return ReviewSummary.subtitleArtwork.getter();
}

uint64_t sub_76F520()
{
  return type metadata accessor for ReviewSummary.SubtitleArtworkAlignment();
}

uint64_t sub_76F530()
{
  return ReviewSummary.subtitleArtworkAlignment.getter();
}

uint64_t sub_76F540()
{
  return ReviewSummary.body.getter();
}

uint64_t sub_76F550()
{
  return ReviewSummary.subtitle.getter();
}

uint64_t sub_76F560()
{
  return type metadata accessor for ReviewSummary();
}

uint64_t sub_76F570()
{
  return RibbonBarItem.artworkTintColor.getter();
}

uint64_t sub_76F580()
{
  return RibbonBarItem.accessibilityLabel.getter();
}

uint64_t sub_76F590()
{
  return RibbonBarItem.title.getter();
}

uint64_t sub_76F5A0()
{
  return RibbonBarItem.artwork.getter();
}

uint64_t sub_76F5B0()
{
  return type metadata accessor for RibbonBarItem();
}

uint64_t sub_76F5C0()
{
  return RoundedButton.hasDivider.getter();
}

uint64_t sub_76F5D0()
{
  return RoundedButton.buttonColor.getter();
}

uint64_t sub_76F5E0()
{
  return RoundedButton.type.getter();
}

uint64_t sub_76F5F0()
{
  return RoundedButton.title.getter();
}

uint64_t sub_76F600()
{
  return RoundedButton.action.getter();
}

uint64_t sub_76F610()
{
  return RoundedButton.textColor.getter();
}

uint64_t sub_76F620()
{
  return type metadata accessor for RoundedButton();
}

uint64_t sub_76F630()
{
  return ShelvesIntent.init(requests:)();
}

uint64_t sub_76F640()
{
  return type metadata accessor for ShelvesIntent();
}

uint64_t sub_76F650()
{
  return SmallBreakout.backgroundColor.getter();
}

uint64_t sub_76F660()
{
  return SmallBreakout.details.getter();
}

uint64_t sub_76F670()
{
  return type metadata accessor for TopChartsPage();
}

uint64_t sub_76F680()
{
  return UpdatesLockup.size.getter();
}

uint64_t sub_76F690()
{
  return UpdatesLockup.version.getter();
}

uint64_t sub_76F6A0()
{
  return UpdatesLockup.whatsNew.getter();
}

uint64_t sub_76F6B0()
{
  return static UpdatesSorter.sorted(updates:ordering:)();
}

uint64_t sub_76F6C0()
{
  return type metadata accessor for UpdatesSorter.Ordering();
}

uint64_t sub_76F6D0()
{
  return VideoControls.containsInlineControls.getter();
}

uint64_t sub_76F6E0()
{
  return static VideoControls.muteUnmute.getter();
}

uint64_t sub_76F6F0()
{
  return static VideoControls.prominentPlay.getter();
}

uint64_t sub_76F700()
{
  return type metadata accessor for VideoControls();
}

uint64_t sub_76F710()
{
  return VideoFillMode.contentMode.getter();
}

uint64_t sub_76F720()
{
  return VideoFillMode.videoGravity.getter();
}

uint64_t sub_76F730()
{
  return type metadata accessor for VideoFillMode();
}

uint64_t sub_76F740()
{
  return ASKBagContract.isStorePersonalizationOnboardingEnabled.getter();
}

uint64_t sub_76F750()
{
  return ASKBagContract.refreshArcadeEntitlementsOnLoadingArcadeView.getter();
}

uint64_t sub_76F760()
{
  return ASKBagContract.enableAppEventsServerNotifications.getter();
}

uint64_t sub_76F770()
{
  return ASKBagContract.arcadeSAGURL.getter();
}

uint64_t sub_76F780()
{
  return ASKBagContract.fetchTimeout.getter();
}

uint64_t sub_76F790()
{
  return ASKBagContract.enableSearchTags.getter();
}

uint64_t sub_76F7A0()
{
  return ASKBagContract.isArcadeSupported.getter();
}

uint64_t sub_76F7B0()
{
  return type metadata accessor for ASKBagContract.AdPlacementBagValue();
}

uint64_t sub_76F7C0()
{
  return ASKBagContract.adsOverrideLanguage.getter();
}

uint64_t sub_76F7D0()
{
  return ASKBagContract.enabledAdPlacements.getter();
}

uint64_t sub_76F7E0()
{
  return ASKBagContract.arcadeProductFamilyId.getter();
}

uint64_t sub_76F7F0()
{
  return ASKBagContract.isSponsoredAdsEnabled.getter();
}

uint64_t sub_76F800()
{
  return ASKBagContract.familyPurchasesEnabled.getter();
}

uint64_t sub_76F810()
{
  return ASKBagContract.isQRCodeBadgingEnabled.getter();
}

uint64_t sub_76F820()
{
  return ASKBagContract.arePreordersCancellable.getter();
}

uint64_t sub_76F830()
{
  return ASKBagContract.impressionableThreshold.getter();
}

uint64_t sub_76F840()
{
  return ASKBagContract.enableReviewSummarization.getter();
}

uint64_t sub_76F850()
{
  return ASKBagContract.defaultAutoPlayVideoSetting.getter();
}

uint64_t sub_76F860()
{
  return ASKBagContract.enableLocationPrivacyNotice.getter();
}

uint64_t sub_76F870()
{
  return ASKBagContract.isNaturalLanguageSearchEnabled.getter();
}

uint64_t sub_76F880()
{
  return ASKBagContract.arcadeSubscribePageDismissDelay.getter();
}

uint64_t sub_76F890()
{
  return ASKBagContract.downloadProgressDisplayWaitTime.getter();
}

uint64_t sub_76F8A0()
{
  return ASKBagContract.impressionableViewablePercentage.getter();
}

uint64_t sub_76F8B0()
{
  return ASKBagContract.gameCenterActivitySharingReprompt.getter();
}

uint64_t sub_76F8C0()
{
  return ASKBagContract.enablePersonalizedAdsPrivacyNotice.getter();
}

uint64_t sub_76F8D0()
{
  return ASKBagContract.downloadProgressDisplayRemainingTime.getter();
}

uint64_t sub_76F8E0()
{
  return ASKBagContract.productPageDownloadingOrderingTimeout.getter();
}

uint64_t sub_76F8F0()
{
  return ASKBagContract.todayAdMediumLockupScreenshotsEnabled.getter();
}

uint64_t sub_76F900()
{
  return ASKBagContract.isProductPageDownloadingOrderingEnabled.getter();
}

uint64_t sub_76F910()
{
  return ASKBagContract.arcadeDownloadPacksGetAllCTADismissDelay.getter();
}

uint64_t sub_76F920()
{
  return ASKBagContract.personalizedAdsPrivacyNoticeEnabledRegions.getter();
}

uint64_t sub_76F930()
{
  return ASKBagContract.personalizedAdsScrollRequiredDisabledRegionCodes.getter();
}

uint64_t sub_76F940()
{
  return ASKBagContract.tabs.getter();
}

uint64_t sub_76F950()
{
  return ASKBagContract.enablePersonalizedAdsPrivacyNoticeHighlightedOption.getter();
}

uint64_t sub_76F960()
{
  return ASKBagContract.personalizedAdsPrivacyNoticeHighlightedOptionEnabledRegions.getter();
}

uint64_t sub_76F970()
{
  return ASKBagContract.amsBag.getter();
}

uint64_t sub_76F980()
{
  return type metadata accessor for ASKBagContract();
}

uint64_t sub_76F990()
{
  return type metadata accessor for AccountSection.ContentItem();
}

uint64_t sub_76F9A0()
{
  return ArcadePageUrls.init(subscriberUrl:nonSubscriberUrl:)();
}

uint64_t sub_76F9B0()
{
  return type metadata accessor for ArcadePageUrls();
}

uint64_t sub_76F9C0()
{
  return ArcadeShowcase.iconArtworks.getter();
}

uint64_t sub_76F9D0()
{
  return ArcadeShowcase.subscribedAction.getter();
}

uint64_t sub_76F9E0()
{
  return ArcadeShowcase.unsubscribedAction.getter();
}

uint64_t sub_76F9F0()
{
  return ArcadeShowcase.subscribedDescription.getter();
}

uint64_t sub_76FA00()
{
  return ArcadeShowcase.offerDisplayProperties.getter();
}

uint64_t sub_76FA10()
{
  return ArcadeShowcase.unsubscribedDescription.getter();
}

uint64_t sub_76FA20()
{
  return type metadata accessor for ArcadeShowcase();
}

uint64_t sub_76FA30()
{
  return type metadata accessor for BootstrapPhase();
}

uint64_t sub_76FA40()
{
  return dispatch thunk of ClickableModel.clickAction.getter();
}

uint64_t sub_76FA50()
{
  return dispatch thunk of ClickableModel.clickSender.getter();
}

uint64_t sub_76FA60()
{
  return CompoundAction.init(title:actions:presentationStyle:actionMetrics:)();
}

uint64_t sub_76FA70()
{
  return CompoundAction.actions.getter();
}

uint64_t sub_76FA80()
{
  return type metadata accessor for CompoundAction();
}

uint64_t sub_76FA90()
{
  return CopyTextAction.text.getter();
}

uint64_t sub_76FAA0()
{
  return type metadata accessor for CopyTextAction();
}

uint64_t sub_76FAB0()
{
  return CornerStylable<>.applyCorner(radius:style:)();
}

uint64_t sub_76FAC0()
{
  return EditorialQuote.attribution.getter();
}

uint64_t sub_76FAD0()
{
  return EditorialQuote.text.getter();
}

uint64_t sub_76FAE0()
{
  return type metadata accessor for EditorialQuote();
}

uint64_t sub_76FAF0()
{
  return EmptyPlaceable.init()();
}

uint64_t sub_76FB00()
{
  return type metadata accessor for EmptyPlaceable();
}

uint64_t sub_76FB10()
{
  return FootnoteLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_76FB20()
{
  return FootnoteLayout.Metrics.init(textSpace:bottomSpace:chevronMargin:)();
}

uint64_t sub_76FB30()
{
  return type metadata accessor for FootnoteLayout.Metrics();
}

uint64_t sub_76FB40()
{
  return FootnoteLayout.init(metrics:labelView:chevronView:)();
}

uint64_t sub_76FB50()
{
  return type metadata accessor for FootnoteLayout();
}

uint64_t sub_76FB60()
{
  return GladiatorRules.rules.getter();
}

uint64_t sub_76FB70()
{
  return GladiatorRules.init()();
}

uint64_t sub_76FB80()
{
  return type metadata accessor for GladiatorRules();
}

uint64_t sub_76FB90()
{
  return HorizontalRule.isFullWidth.getter();
}

void sub_76FBA0(CAShapeLayer to, CGColorRef lineColor, UITraitCollection traitCollection)
{
}

uint64_t sub_76FBB0()
{
  return HorizontalRule.Style.lineThickness(traitCollection:)();
}

uint64_t sub_76FBC0()
{
  return HorizontalRule.Style.path(in:traitCollection:)();
}

uint64_t sub_76FBD0()
{
  return type metadata accessor for HorizontalRule.Style();
}

uint64_t sub_76FBE0()
{
  return HorizontalRule.color.getter();
}

uint64_t sub_76FBF0()
{
  return HorizontalRule.style.getter();
}

uint64_t sub_76FC00()
{
  return type metadata accessor for HorizontalRule();
}

uint64_t sub_76FC10()
{
  return type metadata accessor for ItemBackground();
}

uint64_t sub_76FC20()
{
  return dispatch thunk of NetworkInquiry.isConstrained.getter();
}

uint64_t sub_76FC30()
{
  return dispatch thunk of NetworkInquiry.isLikelyReachable.getter();
}

uint64_t sub_76FC40()
{
  return dispatch thunk of NetworkInquiry.observe(on:_:)();
}

uint64_t sub_76FC50()
{
  return type metadata accessor for OfferTitleType();
}

uint64_t sub_76FC60()
{
  return OnDeviceAdvert.init(instanceId:impressionId:adamId:placementType:metadata:privacy:positionInfo:appMetadata:cppIds:)();
}

uint64_t sub_76FC70()
{
  return OnDeviceAdvert.instanceId.getter();
}

uint64_t sub_76FC80()
{
  return type metadata accessor for OnDeviceAdvert();
}

uint64_t sub_76FC90()
{
  return type metadata accessor for PreorderStatus();
}

uint64_t sub_76FCA0()
{
  return PurchaseIntent.init(from:stateMachine:additionalHeaders:presentingSceneIdentifier:)();
}

uint64_t sub_76FCB0()
{
  return type metadata accessor for PurchaseIntent();
}

uint64_t sub_76FCC0()
{
  return type metadata accessor for PurchaseResult();
}

uint64_t sub_76FCD0()
{
  return type metadata accessor for RuleIdentifier();
}

uint64_t sub_76FCE0()
{
  return dispatch thunk of ScrollObserver.didScroll(visibleItems:layoutEnvironment:contentOffset:)();
}

uint64_t sub_76FCF0()
{
  return dispatch thunk of ScrollObserver.didScroll(in:)();
}

uint64_t sub_76FD00()
{
  return ScrollObserver.didScroll(visibleItems:layoutEnvironment:contentOffset:)();
}

void sub_76FD10(UIScrollView in)
{
}

void sub_76FD20(UIScrollView in)
{
}

void sub_76FD30(UIScrollView in, Swift::Bool willDecelerate)
{
}

void sub_76FD40(UIScrollView in)
{
}

uint64_t sub_76FD50()
{
  return ScrollObserver.willEndDragging(in:with:targetContentOffset:)();
}

void sub_76FD60(UIScrollView in)
{
}

uint64_t sub_76FD70()
{
  return SearchAdAction.action.getter();
}

uint64_t sub_76FD80()
{
  return type metadata accessor for SearchAdAction();
}

uint64_t sub_76FD90()
{
  return ShareSheetData.url.getter();
}

uint64_t sub_76FDA0()
{
  return type metadata accessor for ShareSheetData.Metadata();
}

uint64_t sub_76FDB0()
{
  return ShareSheetData.metadata.getter();
}

uint64_t sub_76FDC0()
{
  return ShareSheetData.shortUrl.getter();
}

uint64_t sub_76FDD0()
{
  return dispatch thunk of ShelfPresenter.interactiveShelfBackground(at:)();
}

uint64_t sub_76FDE0()
{
  return dispatch thunk of ShelfPresenter.prefersHorizontalShelf(for:)();
}

uint64_t sub_76FDF0()
{
  return dispatch thunk of ShelfPresenter.isShelfHidden(for:)();
}

uint64_t sub_76FE00()
{
  return dispatch thunk of ShelfPresenter.doesShelfExist(for:)();
}

uint64_t sub_76FE10()
{
  return dispatch thunk of ShelfPresenter.background(for:)();
}

uint64_t sub_76FE20()
{
  return dispatch thunk of ShelfPresenter.contentType(for:)();
}

uint64_t sub_76FE30()
{
  return dispatch thunk of ShelfPresenter.numberOfRows(for:)();
}

uint64_t sub_76FE40()
{
  return dispatch thunk of ShelfPresenter.sectionCount.getter();
}

uint64_t sub_76FE50()
{
  return dispatch thunk of ShelfPresenter.seeAllAction(for:)();
}

uint64_t sub_76FE60()
{
  return dispatch thunk of ShelfPresenter.titleArtwork(for:)();
}

uint64_t sub_76FE70()
{
  return dispatch thunk of ShelfPresenter.didSelectItem(at:)();
}

uint64_t sub_76FE80()
{
  return dispatch thunk of ShelfPresenter.rowsPerColumn(for:)();
}

uint64_t sub_76FE90()
{
  return dispatch thunk of ShelfPresenter.doesModelExist(for:)();
}

uint64_t sub_76FEA0()
{
  return dispatch thunk of ShelfPresenter.eyebrowArtwork(for:)();
}

uint64_t sub_76FEB0()
{
  return dispatch thunk of ShelfPresenter.itemBackground(forItemAt:)();
}

uint64_t sub_76FEC0()
{
  return dispatch thunk of ShelfPresenter.didSelectSeeAll(for:)();
}

uint64_t sub_76FED0()
{
  return dispatch thunk of ShelfPresenter.didSelectNestedItem(at:)();
}

uint64_t sub_76FEE0()
{
  return dispatch thunk of ShelfPresenter.model(at:)();
}

uint64_t sub_76FEF0()
{
  return dispatch thunk of ShelfPresenter.shelf(for:)();
}

uint64_t sub_76FF00()
{
  return dispatch thunk of ShelfPresenter.title(for:)();
}

uint64_t sub_76FF10()
{
  return dispatch thunk of ShelfPresenter.eyebrow(for:)();
}

uint64_t sub_76FF20()
{
  return dispatch thunk of ShelfPresenter.subtitle(for:)();
}

uint64_t sub_76FF30()
{
  return SnapshotUpdate.contentSnapshot.getter();
}

uint64_t sub_76FF40()
{
  return SnapshotUpdate.useReloadData.getter();
}

uint64_t sub_76FF50()
{
  return SnapshotUpdate.animated.getter();
}

uint64_t sub_76FF60()
{
  return TodayCardMedia.otdTextStyle.getter();
}

uint64_t sub_76FF70()
{
  return TodayCardMedia.impressionMetrics.getter();
}

uint64_t sub_76FF80()
{
  return type metadata accessor for TodayCardMedia.TitleBackingGradient();
}

uint64_t sub_76FF90()
{
  return TodayCardMedia.titleBackingGradient.getter();
}

uint64_t sub_76FFA0()
{
  return TodayCardMedia.Kind.rawValue.getter();
}

uint64_t sub_76FFB0()
{
  return TodayCardMedia.kind.getter();
}

uint64_t sub_76FFC0()
{
  return type metadata accessor for TodayCardMedia();
}

uint64_t sub_76FFD0()
{
  return UnifiedMessage.placement.getter();
}

uint64_t sub_76FFE0()
{
  return type metadata accessor for UnifiedMessage();
}

uint64_t sub_76FFF0()
{
  return dispatch thunk of UpsellBreakout.clickAction.getter();
}

uint64_t sub_770000()
{
  return UpsellBreakout.DisplayProperties.badgeColor.getter();
}

uint64_t sub_770010()
{
  return UpsellBreakout.DisplayProperties.titleColor.getter();
}

uint64_t sub_770020()
{
  return UpsellBreakout.DisplayProperties.backgroundColor.getter();
}

uint64_t sub_770030()
{
  return UpsellBreakout.DisplayProperties.descriptionColor.getter();
}

uint64_t sub_770040()
{
  return UpsellBreakout.DisplayProperties.callToActionColor.getter();
}

uint64_t sub_770050()
{
  return UpsellBreakout.DisplayProperties.wantsBlur.getter();
}

uint64_t sub_770060()
{
  return type metadata accessor for UpsellBreakout.DisplayProperties();
}

uint64_t sub_770070()
{
  return UpsellBreakout.displayProperties.getter();
}

uint64_t sub_770080()
{
  return UpsellBreakout.offerButtonAction.getter();
}

uint64_t sub_770090()
{
  return UpsellBreakout.buttonCallToAction.getter();
}

uint64_t sub_7700A0()
{
  return UpsellBreakout.offerDisplayProperties.getter();
}

uint64_t sub_7700B0()
{
  return UpsellBreakout.video.getter();
}

uint64_t sub_7700C0()
{
  return UpsellBreakout.artwork.getter();
}

uint64_t sub_7700D0()
{
  return UpsellBreakout.details.getter();
}

uint64_t sub_7700E0()
{
  return type metadata accessor for UpsellBreakout();
}

uint64_t sub_7700F0()
{
  return AdPlacementType.rawValue.getter();
}

uint64_t sub_770100()
{
  return type metadata accessor for AdPlacementType();
}

uint64_t sub_770110()
{
  return type metadata accessor for ArtworkGridType();
}

uint64_t sub_770120()
{
  return BreakoutDetails.callToActionButtonAction.getter();
}

uint64_t sub_770130()
{
  return BreakoutDetails.description.getter();
}

uint64_t sub_770140()
{
  return BreakoutDetails.TextAlignment.textAlignment(in:)();
}

uint64_t sub_770150()
{
  return type metadata accessor for BreakoutDetails.TextAlignment();
}

uint64_t sub_770160()
{
  return BreakoutDetails.textAlignment.getter();
}

uint64_t sub_770170()
{
  return type metadata accessor for BreakoutDetails.BackgroundStyle();
}

uint64_t sub_770180()
{
  return BreakoutDetails.backgroundStyle.getter();
}

uint64_t sub_770190()
{
  return BreakoutDetails.badgeColorOverride.getter();
}

uint64_t sub_7701A0()
{
  return type metadata accessor for BreakoutDetails.Badge();
}

uint64_t sub_7701B0()
{
  return BreakoutDetails.badge.getter();
}

uint64_t sub_7701C0()
{
  return BreakoutDetails.title.getter();
}

uint64_t sub_7701D0()
{
  return dispatch thunk of CellWithArtwork.cancelArtworkFetch(on:deprioritizingFetch:)();
}

uint64_t sub_7701E0()
{
  return dispatch thunk of CellWithArtwork.fetch(artwork:on:)();
}

uint64_t sub_7701F0()
{
  return ContingentOffer.trunkAppIcon.getter();
}

uint64_t sub_770200()
{
  return ContingentOffer.description.getter();
}

uint64_t sub_770210()
{
  return ContingentOffer.offerLockup.getter();
}

uint64_t sub_770220()
{
  return ContingentOffer.additionalInfo.getter();
}

uint64_t sub_770230()
{
  return ContingentOffer.learnMoreTitle.getter();
}

uint64_t sub_770240()
{
  return ContingentOffer.backgroundArtwork.getter();
}

uint64_t sub_770250()
{
  return ContingentOffer.mediaOverlayStyle.getter();
}

uint64_t sub_770260()
{
  return ContingentOffer.badge.getter();
}

uint64_t sub_770270()
{
  return ContingentOffer.label.getter();
}

uint64_t sub_770280()
{
  return ContingentOffer.title.getter();
}

uint64_t sub_770290()
{
  return ContingentOffer.subtitle.getter();
}

uint64_t sub_7702A0()
{
  return type metadata accessor for ContingentOffer();
}

uint64_t sub_7702B0()
{
  return dispatch thunk of MetricsActivity.changeContext(_:)();
}

uint64_t sub_7702C0()
{
  return dispatch thunk of MetricsActivity.changePreloaded(_:)();
}

uint64_t sub_7702D0()
{
  return dispatch thunk of MetricsActivity.setReferrerData(_:)();
}

uint64_t sub_7702E0()
{
  return dispatch thunk of MetricsActivity.contextualAction.getter();
}

uint64_t sub_7702F0()
{
  return dispatch thunk of MetricsActivity.currentPageFields.getter();
}

uint64_t sub_770300()
{
  return dispatch thunk of MetricsActivity.currentPageFields.setter();
}

uint64_t sub_770310()
{
  return dispatch thunk of MetricsActivity.performingContext(for:body:)();
}

uint64_t sub_770320()
{
  return dispatch thunk of MetricsActivity.changePageReferrerUrl(_:)();
}

uint64_t sub_770330()
{
  return dispatch thunk of MetricsActivity.currentSearchAdRotationDataProvider.getter();
}

uint64_t sub_770340()
{
  return static MetricsActivity.current.getter();
}

uint64_t sub_770350()
{
  return dispatch thunk of MetricsActivity.preloaded.getter();
}

uint64_t sub_770360()
{
  return type metadata accessor for MetricsActivity();
}

uint64_t sub_770370()
{
  return NetworkActivity.delegate.setter();
}

uint64_t sub_770380()
{
  return type metadata accessor for NetworkActivity();
}

uint64_t sub_770390()
{
  return ObjectGraphPair.objectGraph.getter();
}

uint64_t sub_7703A0()
{
  return ObjectGraphPair.value.getter();
}

uint64_t sub_7703B0()
{
  return static OfferLabelStyle.== infix(_:_:)();
}

uint64_t sub_7703C0()
{
  return type metadata accessor for OfferLabelStyle();
}

uint64_t sub_7703D0()
{
  return PageEnvironment.dynamicTypeSize.getter();
}

uint64_t sub_7703E0()
{
  return PageEnvironment.init(traitCollection:)();
}

uint64_t sub_7703F0()
{
  return PageEnvironment.isHorizontalSizeClassCompact.getter();
}

uint64_t sub_770400()
{
  return PageEnvironment.isHorizontalSizeClassRegular.getter();
}

uint64_t sub_770410()
{
  return type metadata accessor for PageEnvironment();
}

uint64_t sub_770420()
{
  return dispatch thunk of PageGridCaching.invalidateCache()();
}

uint64_t sub_770440()
{
  return PageGridCaching.supplementaryPageGrid(for:surroundedBy:containerSize:safeAreaInsets:environment:)();
}

uint64_t sub_770450()
{
  return PageGridCaching.contentPageGrid(for:surroundedBy:containerSize:safeAreaInsets:environment:)();
}

void sub_770460()
{
}

uint64_t sub_770470()
{
  return PageRefreshGate.performRefresh.setter();
}

uint64_t sub_770480()
{
  return PageRefreshGate.viewWillAppear(on:)();
}

uint64_t sub_770490()
{
  return PageRefreshGate.appWillBackground(on:)();
}

uint64_t sub_7704A0()
{
  return PageRefreshGate.appWillForeground(on:)();
}

uint64_t sub_7704B0()
{
  return PageRefreshGate.viewWillDisappear(on:)();
}

uint64_t sub_7704C0()
{
  return PageRefreshGate.init(policy:)();
}

uint64_t sub_7704D0()
{
  return type metadata accessor for PageRefreshGate();
}

uint64_t sub_7704E0()
{
  return PrivacyCategory.prefersSmallArtwork.getter();
}

uint64_t sub_7704F0()
{
  return PrivacyCategory.style.getter();
}

uint64_t sub_770500()
{
  return PrivacyCategory.title.getter();
}

uint64_t sub_770510()
{
  return PrivacyCategory.artwork.getter();
}

uint64_t sub_770520()
{
  return PrivacyCategory.dataTypes.getter();
}

uint64_t sub_770530()
{
  return type metadata accessor for PrivacyCategory();
}

uint64_t sub_770540()
{
  return ProductPageLink.systemImageName.getter();
}

uint64_t sub_770550()
{
  return ProductPageLink.text.getter();
}

uint64_t sub_770560()
{
  return type metadata accessor for ProductPageLink();
}

uint64_t sub_770570()
{
  return static ShelfBackground.== infix(_:_:)();
}

uint64_t sub_770580()
{
  return type metadata accessor for ShelfBackground();
}

uint64_t sub_770590()
{
  return SpacerDimension.init(constant:)();
}

uint64_t sub_7705A0()
{
  return type metadata accessor for SpacerDimension();
}

uint64_t sub_7705B0()
{
  return SuggestedFriend.init(contactID:contactAssociationID:handle:fullName:supportsFriendingViaPush:)();
}

uint64_t sub_7705C0()
{
  return type metadata accessor for SuggestedFriend();
}

uint64_t sub_7705D0()
{
  return TabChangeAction.init(navigationTab:actions:popToRoot:presentationStyle:actionMetrics:)();
}

uint64_t sub_7705E0()
{
  return TabChangeAction.actions.getter();
}

uint64_t sub_7705F0()
{
  return type metadata accessor for TabChangeAction();
}

uint64_t sub_770600()
{
  return dispatch thunk of TitledParagraph.collapsedText.getter();
}

uint64_t sub_770610()
{
  return TitledParagraph.primarySubtitle.getter();
}

uint64_t sub_770620()
{
  return TitledParagraph.secondarySubtitle.getter();
}

uint64_t sub_770630()
{
  return dispatch thunk of TitledParagraph.text.getter();
}

uint64_t sub_770640()
{
  return TitledParagraph.style.getter();
}

uint64_t sub_770650()
{
  return type metadata accessor for TitledParagraph();
}

uint64_t sub_770660()
{
  return UpdateAllAction.ordering.getter();
}

uint64_t sub_770670(Swift::String _, Swift::OpaquePointer with)
{
  return localizedString(_:with:)(_, with)._countAndFlagsBits;
}

uint64_t sub_770680(Swift::String _, Swift::String comment)
{
  return localizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_770690()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.TitleStyle();
}

uint64_t sub_7706A0()
{
  return AccountPresenter.AccountDetailItem.titleStyle.getter();
}

uint64_t sub_7706B0()
{
  return AccountPresenter.AccountDetailItem.accessoryMargin.getter();
}

uint64_t sub_7706C0()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.ImageConfiguration();
}

uint64_t sub_7706D0()
{
  return AccountPresenter.AccountDetailItem.shouldShowFullTitle.getter();
}

uint64_t sub_7706E0()
{
  return AccountPresenter.AccountDetailItem.image.getter();
}

uint64_t sub_7706F0()
{
  return AccountPresenter.AccountDetailItem.title.getter();
}

uint64_t sub_770700()
{
  return AccountPresenter.AccountDetailItem.detail.getter();
}

uint64_t sub_770710()
{
  return AccountPresenter.AccountDetailItem.disabled.getter();
}

uint64_t sub_770720()
{
  return AccountPresenter.AccountDetailItem.subtitle.getter();
}

uint64_t sub_770730()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.Accessory();
}

uint64_t sub_770740()
{
  return AccountPresenter.AccountDetailItem.accessory.getter();
}

uint64_t sub_770750()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem();
}

uint64_t sub_770760()
{
  return AccountPresenter.init(objectGraph:accountStore:appStateController:iapStateProvider:restrictions:profilePictureDiameter:arcadeSubscriptionManager:gameCenterFriendRequestCoordinator:)();
}

uint64_t sub_770770()
{
  return dispatch thunk of AccountPresenter.canUninstall(_:)();
}

uint64_t sub_770780()
{
  return dispatch thunk of AccountPresenter.didSelectItem(_:)();
}

uint64_t sub_770790()
{
  return dispatch thunk of AccountPresenter.refreshUpdates(fromServer:forceServerFetch:refreshBadgeCount:)();
}

uint64_t sub_7707A0()
{
  return dispatch thunk of AccountPresenter.didFinishSignIn()();
}

uint64_t sub_7707B0()
{
  return dispatch thunk of AccountPresenter.onApplySnapshot.getter();
}

uint64_t sub_7707C0()
{
  return dispatch thunk of AccountPresenter.isUpdatesLoading.getter();
}

uint64_t sub_7707D0()
{
  return AccountPresenter.UpdatesLockupItem.isCollapsed.getter();
}

uint64_t sub_7707E0()
{
  return AccountPresenter.UpdatesLockupItem.moreButtonHandler.getter();
}

uint64_t sub_7707F0()
{
  return AccountPresenter.UpdatesLockupItem.lockup.getter();
}

uint64_t sub_770800()
{
  return type metadata accessor for AccountPresenter.UpdatesLockupItem();
}

uint64_t sub_770810()
{
  return dispatch thunk of AccountPresenter.shelfImpressionMetrics(at:)();
}

uint64_t sub_770820()
{
  return type metadata accessor for AccountPresenter.Item();
}

uint64_t sub_770830()
{
  return dispatch thunk of AccountPresenter.view.setter();
}

uint64_t sub_770840()
{
  return dispatch thunk of AccountPresenter.title.getter();
}

uint64_t sub_770850()
{
  return type metadata accessor for AccountPresenter.Section.Identifier();
}

uint64_t sub_770860()
{
  return AccountPresenter.Section.footerText.getter();
}

uint64_t sub_770870()
{
  return AccountPresenter.Section.headerText.getter();
}

uint64_t sub_770880()
{
  return AccountPresenter.Section.identifier.getter();
}

uint64_t sub_770890()
{
  return AccountPresenter.Section.footerButtonHandler.getter();
}

uint64_t sub_7708A0()
{
  return dispatch thunk of AccountPresenter.uninstall(_:)();
}

uint64_t sub_7708B0()
{
  return type metadata accessor for AccountPresenter();
}

uint64_t sub_7708C0()
{
  return type metadata accessor for AlertActionStyle();
}

uint64_t sub_7708D0()
{
  return static AutomaticUpdates.enabledDidChangeNotification.getter();
}

uint64_t sub_7708E0()
{
  return type metadata accessor for AutomaticUpdates();
}

uint64_t sub_7708F0()
{
  return type metadata accessor for BadgeViewSpacing();
}

uint64_t sub_770910()
{
  return static ConfigurableCell.reuseIdentifier(in:)();
}

uint64_t sub_770920()
{
  return dispatch thunk of DynamicTypeLabel.updateFont(to:)();
}

uint64_t sub_770930()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCase.getter();
}

uint64_t sub_770940()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCase.setter();
}

uint64_t sub_770950()
{
  return DynamicTypeLabel.__allocating_init(customTextStyle:numberOfLines:lineBreakMode:directionalTextAlignment:contentSizeCategoryMapping:)();
}

uint64_t sub_770960()
{
  return dispatch thunk of DynamicTypeLabel.customTextStyle.setter();
}

uint64_t sub_770970()
{
  return dispatch thunk of DynamicTypeLabel.directionalTextAlignment.getter();
}

uint64_t sub_770980()
{
  return dispatch thunk of DynamicTypeLabel.directionalTextAlignment.setter();
}

uint64_t sub_770990()
{
  return dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.getter();
}

uint64_t sub_7709A0()
{
  return dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.setter();
}

uint64_t sub_7709B0()
{
  return dispatch thunk of DynamicTypeLabel.wantsFastBaselineMeasurement.setter();
}

uint64_t sub_7709C0()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCaseContentSizeCategory.setter();
}

uint64_t sub_7709D0()
{
  return dispatch thunk of DynamicTypeLabel.traitCollectionForFontUseCases.getter();
}

uint64_t sub_7709E0()
{
  return DynamicTypeLabel.__allocating_init(frame:)();
}

uint64_t sub_7709F0()
{
  return DynamicTypeLabel.init(useCase:numberOfLines:lineBreakMode:isUserInteractionEnabled:directionalTextAlignment:contentSizeCategoryMapping:)();
}

uint64_t sub_770A00()
{
  return type metadata accessor for DynamicTypeLabel();
}

uint64_t sub_770A10()
{
  return method lookup function for DynamicTypeLabel();
}

uint64_t sub_770A20()
{
  return type metadata accessor for EditorialPageKey();
}

uint64_t sub_770A30()
{
  return GameCenterPlayer.displayName.getter();
}

uint64_t sub_770A40()
{
  return GameCenterPlayer.alias.getter();
}

uint64_t sub_770A50()
{
  return GameCenterPlayer.action.getter();
}

uint64_t sub_770A60()
{
  return dispatch thunk of GameCenterPlayer.artwork.getter();
}

uint64_t sub_770A70()
{
  return dispatch thunk of HeroCarouselItem.clickAction.getter();
}

uint64_t sub_770A80()
{
  return dispatch thunk of HeroCarouselItem.titleEffect.getter();
}

uint64_t sub_770A90()
{
  return HeroCarouselItem.backgroundColor.getter();
}

uint64_t sub_770AA0()
{
  return HeroCarouselItem.impressionMetrics.getter();
}

uint64_t sub_770AB0()
{
  return HeroCarouselItem.video.getter();
}

uint64_t sub_770AC0()
{
  return HeroCarouselItem.artwork.getter();
}

uint64_t sub_770AD0()
{
  return HeroCarouselItem.overlay.getter();
}

uint64_t sub_770AE0()
{
  return type metadata accessor for InstallationType();
}

uint64_t sub_770AF0()
{
  return MixedMediaLockup.showMetadataInformationInLockup.getter();
}

uint64_t sub_770B00()
{
  return MixedMediaLockup.overrideLockupPosition.getter();
}

uint64_t sub_770B10()
{
  return type metadata accessor for MixedMediaLockup.LockupPosition();
}

uint64_t sub_770B20()
{
  return MixedMediaLockup.screenshots.getter();
}

uint64_t sub_770B30()
{
  return MixedMediaLockup.metadataRibbonItems.getter();
}

uint64_t sub_770B40()
{
  return MixedMediaLockup.searchTagRibbonItems.getter();
}

uint64_t sub_770B50()
{
  return MixedMediaLockup.screenshotsDisplayStyle.getter();
}

uint64_t sub_770B60()
{
  return MixedMediaLockup.shouldEvenlyDistributeRibbonItems.getter();
}

uint64_t sub_770B70()
{
  return MixedMediaLockup.init(adamId:bundleId:icon:heading:title:subtitle:developerTagline:editorialTagline:editorialDescription:shortEditorialDescription:ordinal:rating:ratingCount:buttonAction:offerDisplayProperties:clickAction:contextMenuData:impressionMetrics:overrideLockupPosition:trailers:screenshots:screenshotsDisplayStyle:metadataRibbonItems:searchTagRibbonItems:shouldEvenlyDistributeRibbonItems:showMetadataInformationInLockup:)();
}

uint64_t sub_770B80()
{
  return MixedMediaLockup.trailers.getter();
}

uint64_t sub_770B90()
{
  return type metadata accessor for MixedMediaLockup();
}

uint64_t sub_770BA0()
{
  return OfferEnvironment.isArcadeEnvironment.getter();
}

uint64_t sub_770BB0()
{
  return static OfferEnvironment.== infix(_:_:)();
}

uint64_t sub_770BC0()
{
  return type metadata accessor for OfferEnvironment();
}

uint64_t sub_770BD0()
{
  return OfferStateAction.subscribePageAction.getter();
}

uint64_t sub_770BE0()
{
  return OfferStateAction.buyAction.getter();
}

uint64_t sub_770BF0()
{
  return OfferStateAction.openAction.getter();
}

uint64_t sub_770C00()
{
  return OfferStateAction.defaultAction.getter();
}

uint64_t sub_770C10()
{
  return OfferStateAction.preferredActionFor(stateMachine:)();
}

uint64_t sub_770C20()
{
  return OfferStateAction.includeBetaApps.getter();
}

uint64_t sub_770C30()
{
  return OfferStateAction.adamId.getter();
}

uint64_t sub_770C40()
{
  return type metadata accessor for OfferStateAction();
}

uint64_t sub_770C50()
{
  return dispatch thunk of OffsetGridLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_770C60()
{
  return static OffsetGridLayout.numberOfViewsNeeded(toFill:with:)();
}

uint64_t sub_770C70()
{
  return static OffsetGridLayout.Metrics.centerOffsetLayout(with:interItemSpacing:lineSpacing:numberOfRows:originOffset:)();
}

uint64_t sub_770C80()
{
  return type metadata accessor for OffsetGridLayout.Metrics();
}

uint64_t sub_770C90()
{
  return OffsetGridLayout.init(metrics:views:)();
}

uint64_t sub_770CA0()
{
  return type metadata accessor for OffsetGridLayout();
}

uint64_t sub_770CB0()
{
  return PageGridProvider.bottomPadding(for:surroundedBy:containerSize:environment:)();
}

uint64_t sub_770CC0()
{
  return PageMetricsEvent.init(error:pageUrl:)();
}

uint64_t sub_770CD0()
{
  return type metadata accessor for PageMetricsEvent();
}

uint64_t sub_770CE0()
{
  return PlaceholderBrick.init(style:title:badge:artworks:)();
}

uint64_t sub_770CF0()
{
  return type metadata accessor for PlaceholderBrick();
}

uint64_t sub_770D00()
{
  return type metadata accessor for PrivacyTypeStyle();
}

uint64_t sub_770D10()
{
  return ProductMediaItem.screenshot.getter();
}

uint64_t sub_770D20()
{
  return ProductMediaItem.video.getter();
}

uint64_t sub_770D30()
{
  return type metadata accessor for ProductMediaItem();
}

uint64_t sub_770D40()
{
  return type metadata accessor for ProductPageTheme();
}

uint64_t sub_770D50()
{
  return dispatch thunk of ProductPresenter.alwaysAllowReviews.getter();
}

uint64_t sub_770D60()
{
  return type metadata accessor for ProductPresenter();
}

uint64_t sub_770D70()
{
  return ProductTopLockup.offerAction.getter();
}

uint64_t sub_770D80()
{
  return ProductTopLockup.PrimaryBanner.hideCriteria.getter();
}

uint64_t sub_770D90()
{
  return type metadata accessor for ProductTopLockup.PrimaryBanner();
}

uint64_t sub_770DA0()
{
  return ProductTopLockup.developerName.getter();
}

uint64_t sub_770DB0()
{
  return ProductTopLockup.primaryBanner(for:)();
}

uint64_t sub_770DC0()
{
  return ProductTopLockup.tertiaryTitle.getter();
}

uint64_t sub_770DD0()
{
  return ProductTopLockup.secondaryBanner.getter();
}

uint64_t sub_770DE0()
{
  return ProductTopLockup.developerTagline.getter();
}

uint64_t sub_770DF0()
{
  return ProductTopLockup.hasExpandedOffer.getter();
}

uint64_t sub_770E00()
{
  return ProductTopLockup.expandedOfferTitles.getter();
}

uint64_t sub_770E10()
{
  return ProductTopLockup.offerDisplayProperties.getter();
}

uint64_t sub_770E20()
{
  return ProductTopLockup.offerSubtitlesOverride.getter();
}

uint64_t sub_770E30()
{
  return ProductTopLockup.hasExpandedOfferDetails.getter();
}

uint64_t sub_770E40()
{
  return ProductTopLockup.wantsInlineUberPresentationStyle.getter();
}

uint64_t sub_770E50()
{
  return ProductTopLockup.uber.getter();
}

uint64_t sub_770E60()
{
  return ProductTopLockup.theme.getter();
}

uint64_t sub_770E70()
{
  return ProductTopLockup.title.getter();
}

uint64_t sub_770E80()
{
  return ProductTopLockup.adamId.getter();
}

uint64_t sub_770E90()
{
  return ProductTopLockup.subtitle.getter();
}

uint64_t sub_770EA0()
{
  return ProductTopLockup.iconStyle.getter();
}

uint64_t sub_770EB0()
{
  return type metadata accessor for ProductTopLockup();
}

uint64_t sub_770EC0()
{
  return ReviewsContainer.alwaysAllowReviews.getter();
}

uint64_t sub_770ED0()
{
  return ReviewsContainer.editorsChoice.getter();
}

uint64_t sub_770EE0()
{
  return ReviewsContainer.reviewSummary.getter();
}

uint64_t sub_770EF0()
{
  return ReviewsContainer.supportAction.getter();
}

uint64_t sub_770F00()
{
  return ReviewsContainer.writeReviewAction.getter();
}

uint64_t sub_770F10()
{
  return ReviewsContainer.adamId.getter();
}

uint64_t sub_770F20()
{
  return ReviewsContainer.ratings.getter();
}

uint64_t sub_770F30()
{
  return ReviewsContainer.reviews.getter();
}

uint64_t sub_770F40()
{
  return ReviewsContainer.tapToRate.getter();
}

uint64_t sub_770F50()
{
  return type metadata accessor for ReviewsContainer();
}

uint64_t sub_770F60()
{
  return static RiverViewStyling.defaultSpeed.getter();
}

uint64_t sub_770F70()
{
  return static RiverViewStyling.todayTabSpeed.getter();
}

uint64_t sub_770F80()
{
  return RiverViewStyling.interRowSpacing.getter();
}

uint64_t sub_770F90()
{
  return RiverViewStyling.interItemSpacing.getter();
}

uint64_t sub_770FA0()
{
  return static RiverViewStyling.defaultRowOffsets.getter();
}

uint64_t sub_770FB0()
{
  return static RiverViewStyling.defaultInterRowSpacing.getter();
}

uint64_t sub_770FC0()
{
  return static RiverViewStyling.defaultInterItemSpacing.getter();
}

uint64_t sub_770FD0()
{
  return RiverViewStyling.speed.getter();
}

uint64_t sub_770FE0()
{
  return RiverViewStyling.init(itemSize:interRowSpacing:interItemSpacing:speed:rowOffsets:reverseAlternatingRows:)();
}

uint64_t sub_770FF0()
{
  return RiverViewStyling.itemSize.getter();
}

uint64_t sub_771000()
{
  return type metadata accessor for RiverViewStyling();
}

uint64_t sub_771010()
{
  return SearchHintLayout.measurements(fitting:in:)();
}

uint64_t sub_771020()
{
  return SearchHintLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_771030()
{
  return SearchHintLayout.Metrics.init(leadingMargin:trailingMargin:textLeadingMargin:iconHorizontalCenterMargin:iconSize:)();
}

uint64_t sub_771040()
{
  return SearchHintLayout.Metrics.iconSize.getter();
}

uint64_t sub_771050()
{
  return type metadata accessor for SearchHintLayout.Metrics();
}

uint64_t sub_771060()
{
  return SearchHintLayout.init(metrics:iconView:titleLabel:separatorView:)();
}

uint64_t sub_771070()
{
  return type metadata accessor for SearchHintLayout();
}

uint64_t sub_771080()
{
  return ShareSheetAction.shareSheetStyle.getter();
}

uint64_t sub_771090()
{
  return type metadata accessor for ShareSheetAction.ShareSheetStyle();
}

uint64_t sub_7710A0()
{
  return ShareSheetAction.activities.getter();
}

uint64_t sub_7710B0()
{
  return ShareSheetAction.data.getter();
}

uint64_t sub_7710C0()
{
  return ShareSheetAction.Activity.activityType.getter();
}

uint64_t sub_7710D0()
{
  return ShareSheetAction.Activity.action.getter();
}

uint64_t sub_7710E0()
{
  return type metadata accessor for ShareSheetAction.Activity();
}

uint64_t sub_7710F0()
{
  return type metadata accessor for ShareSheetAction();
}

uint64_t sub_771100()
{
  return SheetActionStyle.allowsDisplayOfTitle.getter();
}

uint64_t sub_771110()
{
  return type metadata accessor for SheetActionStyle();
}

uint64_t sub_771120()
{
  return TodayCardOverlay.Kind.rawValue.getter();
}

uint64_t sub_771130()
{
  return TodayCardOverlay.kind.getter();
}

uint64_t sub_771140()
{
  return type metadata accessor for TodayCardOverlay();
}

uint64_t sub_771150()
{
  return dispatch thunk of TodayCardTrigger.identifier.getter();
}

uint64_t sub_771160()
{
  return dispatch thunk of TodayCardTrigger.clearActivationContext()();
}

uint64_t sub_771170()
{
  return dispatch thunk of TodayCardTrigger.adamId.getter();
}

uint64_t sub_771180()
{
  return UpsellGridLayout.measurements(fitting:in:)();
}

uint64_t sub_771190()
{
  return static UpsellGridLayout.largeIconSize(fitting:using:in:)();
}

uint64_t sub_7711A0()
{
  return UpsellGridLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7711B0()
{
  return UpsellGridLayout.Metrics.init(dimensionSmallIconCount:)();
}

uint64_t sub_7711C0()
{
  return type metadata accessor for UpsellGridLayout.Metrics();
}

uint64_t sub_7711D0()
{
  return UpsellGridLayout.init(metrics:icons:)();
}

uint64_t sub_7711E0()
{
  return static UpsellGridLayout.iconCount(fitting:using:in:)();
}

uint64_t sub_7711F0()
{
  return static UpsellGridLayout.iconSizes(fitting:using:in:)();
}

uint64_t sub_771200()
{
  return type metadata accessor for UpsellGridLayout();
}

uint64_t sub_771210()
{
  return static VideoPlayerState.== infix(_:_:)();
}

uint64_t sub_771220()
{
  return type metadata accessor for VideoPlayerState();
}

uint64_t sub_771230()
{
  return dispatch thunk of VideoViewManager.videoView<A>(with:videoUrl:configuration:templateMediaEvent:templateClickEvent:asPartOf:)();
}

uint64_t sub_771240()
{
  return VideoViewManager.init(networkInquiry:metricsPipeline:)();
}

uint64_t sub_771250()
{
  return type metadata accessor for VideoViewManager();
}

uint64_t sub_771260()
{
  return AnnotationItem_V2.headingArtworkItems.getter();
}

uint64_t sub_771270()
{
  return AnnotationItem_V2.text.getter();
}

uint64_t sub_771280()
{
  return AnnotationItem_V2.heading.getter();
}

uint64_t sub_771290()
{
  return AnnotationItem_V2.TextPair.leadingText.getter();
}

uint64_t sub_7712A0()
{
  return AnnotationItem_V2.TextPair.trailingText.getter();
}

uint64_t sub_7712B0()
{
  return type metadata accessor for AnnotationItem_V2.TextPair();
}

uint64_t sub_7712C0()
{
  return AnnotationItem_V2.listText.getter();
}

uint64_t sub_7712D0()
{
  return AnnotationItem_V2.textPairs.getter();
}

uint64_t sub_7712E0()
{
  return ArcadeStateChange.newState.getter();
}

uint64_t sub_7712F0()
{
  return ArcadeStateChange.oldState.getter();
}

uint64_t sub_771300()
{
  return type metadata accessor for ArcadeStateChange();
}

uint64_t sub_771310()
{
  return ArcadeWelcomeItem.body.getter();
}

uint64_t sub_771320()
{
  return ArcadeWelcomeItem.artwork.getter();
}

uint64_t sub_771330()
{
  return ArcadeWelcomeItem.headline.getter();
}

uint64_t sub_771340()
{
  return type metadata accessor for ArcadeWelcomePage.ContentType();
}

uint64_t sub_771350()
{
  return type metadata accessor for ArcadeWelcomePage();
}

uint64_t sub_771360()
{
  return static BadgeDisplayStyle.style(forBadgeCount:pageTraits:indentForBadges:)();
}

uint64_t sub_771370()
{
  return type metadata accessor for BadgeDisplayStyle();
}

uint64_t sub_771380()
{
  return type metadata accessor for BadgeLeadingValue();
}

uint64_t sub_771390()
{
  return static ClickMetricsEvent.makeErrorRetryEvent()();
}

uint64_t sub_7713A0()
{
  return static ClickMetricsEvent.tabClickEvent(named:at:)();
}

uint64_t sub_7713B0()
{
  return static ClickMetricsEvent.makeBackClickEvent()();
}

uint64_t sub_7713C0()
{
  return ClickMetricsEvent.init(targetType:targetId:including:excluding:eventFields:)();
}

uint64_t sub_7713D0()
{
  return type metadata accessor for ClickMetricsEvent();
}

uint64_t sub_7713E0()
{
  return DebugMetricsEvent.iconSymbol.getter();
}

uint64_t sub_7713F0()
{
  return DebugMetricsEvent.description.getter();
}

uint64_t sub_771400()
{
  return DebugMetricsEvent.summaryInfo.getter();
}

uint64_t sub_771410()
{
  return DebugMetricsEvent.date.getter();
}

uint64_t sub_771420()
{
  return DebugMetricsEvent.title.getter();
}

uint64_t sub_771430()
{
  return DebugMetricsEvent.topic.getter();
}

uint64_t sub_771440()
{
  return DebugMetricsEvent.fields.getter();
}

uint64_t sub_771450()
{
  return DebugMetricsEvent.issues.getter();
}

uint64_t sub_771460()
{
  return type metadata accessor for DebugMetricsEvent();
}

uint64_t sub_771470()
{
  return dispatch thunk of DynamicTypeButton.updateFont(to:)();
}

uint64_t sub_771480()
{
  return dispatch thunk of DynamicTypeButton.fontUseCase.getter();
}

uint64_t sub_771490()
{
  return dispatch thunk of DynamicTypeButton.fontUseCase.setter();
}

uint64_t sub_7714A0()
{
  return DynamicTypeButton.__allocating_init(useCase:)();
}

uint64_t sub_7714B0()
{
  return type metadata accessor for DynamicTypeButton();
}

uint64_t sub_7714C0()
{
  return method lookup function for DynamicTypeButton();
}

uint64_t sub_7714D0()
{
  return ExternalUrlAction.isSensitive.getter();
}

uint64_t sub_7714E0()
{
  return ExternalUrlAction.timeoutSeconds.getter();
}

uint64_t sub_7714F0()
{
  return ExternalUrlAction.url.getter();
}

uint64_t sub_771500()
{
  return ExternalUrlAction.init(title:urlString:isSensitive:timeoutSeconds:artwork:presentationStyle:actionMetrics:)();
}

uint64_t sub_771510()
{
  return type metadata accessor for ExternalUrlAction();
}

uint64_t sub_771520()
{
  return FlowPreviewAction.presentationContext.getter();
}

uint64_t sub_771530()
{
  return FlowPreviewAction.previewViewController.getter();
}

uint64_t sub_771540()
{
  return FlowPreviewAction.requiresNavigationController.getter();
}

uint64_t sub_771550()
{
  return type metadata accessor for FlowPreviewAction();
}

uint64_t sub_771560()
{
  return GameCenterFriends.getter();
}

uint64_t sub_771570()
{
  return GuidedSearchToken.isSelected.getter();
}

uint64_t sub_771580()
{
  return GuidedSearchToken.displayName.getter();
}

uint64_t sub_771590()
{
  return GuidedSearchToken.leadingIconSymbolName.getter();
}

uint64_t sub_7715A0()
{
  return InformationRibbon.hasTopSeparator.getter();
}

uint64_t sub_7715B0()
{
  return InformationRibbon.hasBottomSeparator.getter();
}

uint64_t sub_7715C0()
{
  return InformationRibbon.separatorsAreFullWidth.getter();
}

uint64_t sub_7715D0()
{
  return InformationRibbon.badges.getter();
}

uint64_t sub_7715E0()
{
  return type metadata accessor for InformationRibbon.Alignment();
}

uint64_t sub_7715F0()
{
  return InformationRibbon.alignment.getter();
}

uint64_t sub_771600()
{
  return type metadata accessor for InformationRibbon();
}

uint64_t sub_771610()
{
  return ItemLayoutContext.parentShelfLayoutContext.getter();
}

uint64_t sub_771620()
{
  return ItemLayoutContext.withUpdatedLayoutOptions(_:)();
}

uint64_t sub_771630()
{
  return ItemLayoutContext.componentLayoutOptions.getter();
}

uint64_t sub_771640()
{
  return ItemLayoutContext.typedModel<A>(as:)();
}

uint64_t sub_771650()
{
  return ItemLayoutContext.typedModel<A>(as:)();
}

uint64_t sub_771660()
{
  return ItemLayoutContext.typedModel<A>(is:)();
}

uint64_t sub_771670()
{
  return ItemLayoutContext.typedState<A>(as:)();
}

uint64_t sub_771680()
{
  return ItemLayoutContext.mutableState.getter();
}

uint64_t sub_771690()
{
  return ItemLayoutContext.sectionIndex.getter();
}

uint64_t sub_7716A0()
{
  return ItemLayoutContext.subscript.getter();
}

uint64_t sub_7716B0()
{
  return ItemLayoutContext.typedWritableState<A>(as:)();
}

uint64_t sub_7716C0()
{
  return ItemLayoutContext.item.getter();
}

uint64_t sub_7716D0()
{
  return ItemLayoutContext.index.getter();
}

uint64_t sub_7716E0()
{
  return ItemLayoutContext.state.getter();
}

uint64_t sub_7716F0()
{
  return ItemLayoutContext.Metadata.init()();
}

uint64_t sub_771700()
{
  return type metadata accessor for ItemLayoutContext.Metadata();
}

uint64_t sub_771710()
{
  return ItemLayoutContext.indexPath.getter();
}

uint64_t sub_771720()
{
  return type metadata accessor for ItemLayoutContext();
}

uint64_t sub_771730()
{
  return dispatch thunk of LargeHeroBreakout.clickAction.getter();
}

uint64_t sub_771740()
{
  return LargeHeroBreakout.backgroundColor.getter();
}

uint64_t sub_771750()
{
  return LargeHeroBreakout.detailsDisplayProperties.getter();
}

uint64_t sub_771760()
{
  return LargeHeroBreakout.video.getter();
}

uint64_t sub_771770()
{
  return LargeHeroBreakout.artwork.getter();
}

uint64_t sub_771780()
{
  return LargeHeroBreakout.details.getter();
}

uint64_t sub_771790()
{
  return LargeHeroBreakout.heading.getter();
}

uint64_t sub_7717A0()
{
  return type metadata accessor for LargeHeroBreakout();
}

uint64_t sub_7717B0()
{
  return LargeLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7717C0()
{
  return LargeLockupLayout.Metrics.init(headingSpace:titleSpace:titleWithHeadingSpace:subtitleSpace:tertiaryTitleSpace:bottomSpace:isTextHorizontallyCentered:)();
}

uint64_t sub_7717D0()
{
  return type metadata accessor for LargeLockupLayout.Metrics();
}

uint64_t sub_7717E0()
{
  return LargeLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:)();
}

uint64_t sub_7717F0()
{
  return type metadata accessor for LargeLockupLayout();
}

uint64_t sub_771800()
{
  return LockupMediaLayout.DisplayType.numberOfViews.getter();
}

uint64_t sub_771810()
{
  return type metadata accessor for LockupMediaLayout.DisplayType();
}

uint64_t sub_771820()
{
  return LockupMediaLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_771830()
{
  return LockupMediaLayout.Metrics.displayType.getter();
}

uint64_t sub_771840()
{
  return LockupMediaLayout.Metrics.displayType.setter();
}

uint64_t sub_771850()
{
  return LockupMediaLayout.Metrics.init(interItemSpacing:displayType:mediaAspectRatio:boundingAspectRatio:)();
}

uint64_t sub_771860()
{
  return LockupMediaLayout.Metrics.boundingAspectRatio.getter();
}

uint64_t sub_771870()
{
  return type metadata accessor for LockupMediaLayout.Metrics();
}

uint64_t sub_771880()
{
  return LockupMediaLayout.init(metrics:mediaViews:)();
}

uint64_t sub_771890()
{
  return static LockupMediaLayout.mediaSize(using:fitting:with:)();
}

uint64_t sub_7718A0()
{
  return type metadata accessor for LockupMediaLayout();
}

uint64_t sub_7718B0()
{
  return type metadata accessor for MediaMetricsEvent.ActionType();
}

uint64_t sub_7718C0()
{
  return type metadata accessor for MediaMetricsEvent.ActionContext();
}

uint64_t sub_7718D0()
{
  return type metadata accessor for MediaMetricsEvent.ActionDetails();
}

uint64_t sub_7718E0()
{
  return static MediaMetricsEvent.fillIn(template:actionType:actionDetails:actionContext:url:duration:position:)();
}

uint64_t sub_7718F0()
{
  return MediaOverlayStyle.userInterfaceStyle.getter();
}

uint64_t sub_771900()
{
  return MediaOverlayStyle.inverseUserInterfaceStyle.getter();
}

uint64_t sub_771910()
{
  return type metadata accessor for MediaOverlayStyle();
}

uint64_t sub_771920()
{
  return PageRefreshPolicy.shouldSendEventsForPageExit.getter();
}

uint64_t sub_771930()
{
  return PageRefreshPolicy.updateDelayInterval.getter();
}

uint64_t sub_771940()
{
  return PendingPageRender.isLayoutPending.setter();
}

uint64_t sub_771950()
{
  return PendingPageRender.appearTime.setter();
}

uint64_t sub_771960()
{
  return PendingPageRender.disappearTime.setter();
}

uint64_t sub_771970()
{
  return PendingPageRender.observeAssets(_:)();
}

uint64_t sub_771980()
{
  return PendingPageRender.DisappearTimeAndReason.init(reason:timeInterval:)();
}

uint64_t sub_771990()
{
  return type metadata accessor for PendingPageRender.DisappearTimeAndReason();
}

uint64_t sub_7719A0()
{
  return PrivacyDefinition.definition.getter();
}

uint64_t sub_7719B0()
{
  return PrivacyDefinition.title.getter();
}

uint64_t sub_7719C0()
{
  return type metadata accessor for PrivacyDefinition();
}

uint64_t sub_7719D0()
{
  return PrivacyTypeLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7719E0()
{
  return PrivacyTypeLayout.Metrics.iconBaseline.setter();
}

uint64_t sub_7719F0()
{
  return PrivacyTypeLayout.Metrics.iconTopSpace.setter();
}

uint64_t sub_771A00()
{
  return PrivacyTypeLayout.Metrics.titleTopSpace.setter();
}

uint64_t sub_771A10()
{
  return PrivacyTypeLayout.Metrics.detailTopSpace.setter();
}

uint64_t sub_771A20()
{
  return type metadata accessor for PrivacyTypeLayout.Metrics.HorizontalAlignment();
}

uint64_t sub_771A30()
{
  return PrivacyTypeLayout.Metrics.compactBottomMargin.setter();
}

uint64_t sub_771A40()
{
  return PrivacyTypeLayout.Metrics.init(horizontalAlignment:iconTopSpace:iconSize:iconBaseline:titleTopSpace:detailTopSpace:maxTextWidth:minimumCategoriesColumnWidth:categoriesTopSpace:categoriesHorizontalPadding:categoriesBottomSpace:horizontalMargin:compactBottomMargin:regularBottomMargin:)();
}

uint64_t sub_771A50()
{
  return PrivacyTypeLayout.Metrics.horizontalAlignment.setter();
}

uint64_t sub_771A60()
{
  return PrivacyTypeLayout.Metrics.regularBottomMargin.setter();
}

uint64_t sub_771A70()
{
  return PrivacyTypeLayout.Metrics.iconSize.getter();
}

uint64_t sub_771A80()
{
  return PrivacyTypeLayout.Metrics.iconSize.setter();
}

uint64_t sub_771A90()
{
  return type metadata accessor for PrivacyTypeLayout.Metrics();
}

uint64_t sub_771AA0()
{
  return PrivacyTypeLayout.init(metrics:shadowView:backgroundView:separatorView:iconView:titleLabel:detailLabel:categoryViews:style:)();
}

uint64_t sub_771AB0()
{
  return type metadata accessor for PrivacyTypeLayout();
}

uint64_t sub_771AC0()
{
  return ProductCapability.artworkTintColor.getter();
}

uint64_t sub_771AD0()
{
  return ProductCapability.captionTrailingArtwork.getter();
}

uint64_t sub_771AE0()
{
  return ProductCapability.title.getter();
}

uint64_t sub_771AF0()
{
  return ProductCapability.artwork.getter();
}

uint64_t sub_771B00()
{
  return ProductCapability.caption.getter();
}

uint64_t sub_771B10()
{
  return type metadata accessor for ProductCapability();
}

uint64_t sub_771B20()
{
  return RateLimitedAction.primaryAction.getter();
}

uint64_t sub_771B30()
{
  return RateLimitedAction.fallbackAction.getter();
}

uint64_t sub_771B40()
{
  return static RateLimitedAction.preferencesKey.getter();
}

uint64_t sub_771B50()
{
  return RateLimitedAction.actionKey.getter();
}

uint64_t sub_771B60()
{
  return RateLimitedAction.rateLimit.getter();
}

uint64_t sub_771B70()
{
  return type metadata accessor for RateLimitedAction();
}

uint64_t sub_771B80()
{
  return type metadata accessor for RoundedButtonType();
}

uint64_t sub_771B90()
{
  return dispatch thunk of RoundedCornerView.setCorner(radius:style:)();
}

uint64_t sub_771BA0()
{
  return dispatch thunk of RoundedCornerView.applyCorner(radius:style:)();
}

uint64_t sub_771BB0()
{
  return dispatch thunk of RoundedCornerView.borderView.getter();
}

uint64_t sub_771BC0()
{
  return dispatch thunk of RoundedCornerView.borderColor.setter();
}

uint64_t sub_771BD0()
{
  return dispatch thunk of RoundedCornerView.borderWidth.setter();
}

uint64_t sub_771BE0()
{
  return dispatch thunk of RoundedCornerView.cornerStyle.getter();
}

uint64_t sub_771BF0()
{
  return dispatch thunk of RoundedCornerView.cornerRadius.getter();
}

uint64_t sub_771C00()
{
  return dispatch thunk of RoundedCornerView.updateBorder()();
}

uint64_t sub_771C10()
{
  return dispatch thunk of RoundedCornerView.roundedCorners.setter();
}

uint64_t sub_771C20()
{
  return RoundedCornerView.__allocating_init(radius:style:)();
}

uint64_t sub_771C30()
{
  return type metadata accessor for RoundedCornerView();
}

uint64_t sub_771C40()
{
  return method lookup function for RoundedCornerView();
}

uint64_t sub_771C50()
{
  return dispatch thunk of SearchAdProviding.searchAd.getter();
}

uint64_t sub_771C60()
{
  return SearchAdProviding.isSearchAd.getter();
}

uint64_t sub_771C70()
{
  return SearchHistoryItem.debugDescription.getter();
}

uint64_t sub_771C80()
{
  return type metadata accessor for SearchHistoryItem();
}

uint64_t sub_771C90()
{
  return static SmallLockupLayout.estimatedMeasurements(fitting:using:with:)();
}

uint64_t sub_771CA0()
{
  return SmallLockupLayout.Metrics.init(artworkSize:artworkMargin:ordinalSpaceProvider:headingSpace:titleRegularSpace:titleMediumSpace:titleShortSpace:titleWithHeadingSpace:subtitleSpace:subtitleExtraTallSpace:tertiaryTitleSpace:offerTextSpace:bottomSpace:offerButtonSize:offerButtonMargin:numberOfLines:)();
}

uint64_t sub_771CB0()
{
  return SmallLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_771CC0()
{
  return SmallLockupLayout.Metrics.artworkSize.setter();
}

uint64_t sub_771CD0()
{
  return SmallLockupLayout.Metrics.bottomSpace.setter();
}

uint64_t sub_771CE0()
{
  return SmallLockupLayout.Metrics.headingSpace.setter();
}

uint64_t sub_771CF0()
{
  return SmallLockupLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_771D00()
{
  return SmallLockupLayout.Metrics.artworkMargin.setter();
}

uint64_t sub_771D10()
{
  return SmallLockupLayout.Metrics.numberOfLines.getter();
}

uint64_t sub_771D20()
{
  return SmallLockupLayout.Metrics.numberOfLines.setter();
}

uint64_t sub_771D30()
{
  return SmallLockupLayout.Metrics.subtitleSpace.setter();
}

uint64_t sub_771D40()
{
  return SmallLockupLayout.Metrics.offerTextSpace.setter();
}

uint64_t sub_771D50()
{
  return SmallLockupLayout.Metrics.offerButtonSize.getter();
}

uint64_t sub_771D60()
{
  return SmallLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_771D70()
{
  return SmallLockupLayout.Metrics.titleShortSpace.setter();
}

uint64_t sub_771D80()
{
  return SmallLockupLayout.Metrics.titleMediumSpace.setter();
}

uint64_t sub_771D90()
{
  return SmallLockupLayout.Metrics.offerButtonMargin.getter();
}

uint64_t sub_771DA0()
{
  return SmallLockupLayout.Metrics.titleRegularSpace.getter();
}

uint64_t sub_771DB0()
{
  return SmallLockupLayout.Metrics.titleRegularSpace.setter();
}

uint64_t sub_771DC0()
{
  return SmallLockupLayout.Metrics.tertiaryTitleSpace.setter();
}

uint64_t sub_771DD0()
{
  return SmallLockupLayout.Metrics.titleWithHeadingSpace.setter();
}

uint64_t sub_771DE0()
{
  return type metadata accessor for SmallLockupLayout.Metrics();
}

uint64_t sub_771DF0()
{
  return SmallLockupLayout.init(metrics:artworkView:ordinalText:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:)();
}

uint64_t sub_771E00()
{
  return type metadata accessor for SmallLockupLayout();
}

uint64_t sub_771E10()
{
  return static TextConfiguration.maxSubtitleWidth(with:)();
}

uint64_t sub_771E20()
{
  return static TextConfiguration.subtitleHorizontalSpacing.getter();
}

uint64_t sub_771E30()
{
  return TextConfiguration.init(metrics:symbolName:subtitleText:subtitlePosition:theme:)();
}

uint64_t sub_771E40()
{
  return TextConfiguration.init(metrics:text:subtitleText:subtitlePosition:theme:)();
}

uint64_t sub_771E50()
{
  return type metadata accessor for TextConfiguration();
}

uint64_t sub_771E60()
{
  return TitleEffectUpdate.isAnimated.getter();
}

uint64_t sub_771E70()
{
  return TitleEffectUpdate.timingFunction.getter();
}

uint64_t sub_771E80()
{
  return TitleEffectUpdate.animationDuration.getter();
}

uint64_t sub_771E90()
{
  return TitleEffectUpdate.init(effect:isAnimated:animationDuration:timingFunction:)();
}

uint64_t sub_771EA0()
{
  return TitleEffectUpdate.effect.getter();
}

uint64_t sub_771EB0()
{
  return type metadata accessor for TitleEffectUpdate();
}

uint64_t sub_771EC0()
{
  return TitleHeaderLayout.init(accessoryView:accessoryMargin:accessoryVerticalAlignment:accessoryHorizontalAlignment:children:childrenHorizontalAlignment:allowsAccessibilityLayouts:)();
}

uint64_t sub_771ED0()
{
  return TitleHeaderLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_771EE0()
{
  return static TitleHeaderLayout.AccessoryVerticalAlignment.== infix(_:_:)();
}

uint64_t sub_771EF0()
{
  return type metadata accessor for TitleHeaderLayout.AccessoryVerticalAlignment();
}

uint64_t sub_771F00()
{
  return type metadata accessor for TitleHeaderLayout.ChildrenHorizontalAlignment();
}

uint64_t sub_771F10()
{
  return type metadata accessor for TitleHeaderLayout.AccessoryHorizontalAlignment();
}

uint64_t sub_771F20()
{
  return TitleHeaderLayout.Child.init(decorationView:contentView:decorationViewMargin:firstLineSpace:bottomSpace:trailingView:shortTrailingView:trailingViewMargin:trailingFirstLineSpace:trailingBottomSpace:)();
}

uint64_t sub_771F30()
{
  return type metadata accessor for TitleHeaderLayout.Child();
}

uint64_t sub_771F40()
{
  return type metadata accessor for TitleHeaderLayout();
}

uint64_t sub_771F50()
{
  return TitledButtonStack.compactLineBreaks.getter();
}

uint64_t sub_771F60()
{
  return TitledButtonStack.regularLineBreaks.getter();
}

uint64_t sub_771F70()
{
  return TitledButtonStack.buttons.getter();
}

uint64_t sub_771F80()
{
  return type metadata accessor for TitledButtonStack();
}

uint64_t sub_771F90()
{
  return static VersionStringUtil.isShortVersionString(_:atLeast:)();
}

uint64_t sub_771FA0()
{
  return dispatch thunk of VideoViewDelegate.playbackWillEnd(in:videoView:)();
}

uint64_t sub_771FB0()
{
  return dispatch thunk of VideoViewDelegate.userInitiatedPlay(for:)();
}

uint64_t sub_771FC0()
{
  return dispatch thunk of VideoViewDelegate.videoDidPlayToEnd(isLooping:videoView:)();
}

uint64_t sub_771FD0()
{
  return dispatch thunk of VideoViewDelegate.userInitiatedPause(for:)();
}

uint64_t sub_771FE0()
{
  return dispatch thunk of VideoViewDelegate.videoDidChangeState(to:for:)();
}

uint64_t sub_771FF0()
{
  return WriteReviewAction.itemDescription.getter();
}

uint64_t sub_772000()
{
  return WriteReviewAction.adamId.getter();
}

uint64_t sub_772010()
{
  return WriteReviewAction.appIcon.getter();
}

uint64_t sub_772020()
{
  return WriteReviewAction.appName.getter();
}

uint64_t sub_772030()
{
  return type metadata accessor for WriteReviewAction();
}

uint64_t sub_772040(NSNumber a1)
{
  return localizedFileSize(_:)(a1).value._countAndFlagsBits;
}

uint64_t sub_772050()
{
  return type metadata accessor for AccountSectionLink.LinkDisplayType();
}

uint64_t sub_772060()
{
  return AccountSectionLink.displayType.getter();
}

uint64_t sub_772070()
{
  return AccountSectionLink.title.getter();
}

uint64_t sub_772080()
{
  return type metadata accessor for AccountSectionLink();
}

uint64_t sub_772090()
{
  return AccountSectionText.paragraph.getter();
}

uint64_t sub_7720A0()
{
  return AchievementSummary.achievements.getter();
}

uint64_t sub_7720B0()
{
  return AchievementSummary.completedText.getter();
}

uint64_t sub_7720C0()
{
  return AchievementSummary.totalAchievements.getter();
}

uint64_t sub_7720D0()
{
  return AchievementSummary.completedAchievements.getter();
}

uint64_t sub_7720E0()
{
  return type metadata accessor for AchievementSummary();
}

uint64_t sub_7720F0()
{
  return dispatch thunk of ArcadeFooterLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_772100()
{
  return type metadata accessor for ArcadeFooterLayout.ButtonLocation();
}

uint64_t sub_772110()
{
  return ArcadeFooterLayout.Metrics.layoutMargins.getter();
}

uint64_t sub_772120()
{
  return ArcadeFooterLayout.Metrics.layoutMargins.setter();
}

uint64_t sub_772130()
{
  return ArcadeFooterLayout.Metrics.buttonMinWidth.setter();
}

uint64_t sub_772140()
{
  return ArcadeFooterLayout.Metrics.footnoteSpaceMultiplier.setter();
}

uint64_t sub_772150()
{
  return ArcadeFooterLayout.Metrics.init(iconSize:iconSpacing:iconRowCount:firstIconHorizontalOffset:wordmarkTopMargin:wordmarkHeight:buttonLocation:buttonTopMargin:buttonBottomMargin:buttonViewTopSpace:buttonViewBottomSpace:buttonMinWidth:buttonPreferredEdgeInsets:footnoteTopSpace:footnoteBottomSpace:footnoteSpaceMultiplier:layoutMargins:)();
}

uint64_t sub_772160()
{
  return ArcadeFooterLayout.Metrics.iconSize.setter();
}

uint64_t sub_772170()
{
  return type metadata accessor for ArcadeFooterLayout.Metrics();
}

uint64_t sub_772180()
{
  return ArcadeFooterLayout.init(metrics:riverView:wordmarkView:buttonView:footnoteView:)();
}

uint64_t sub_772190()
{
  return type metadata accessor for ArcadeFooterLayout();
}

uint64_t sub_7721A0()
{
  return ArcadeLockupLayout.init(wordmarkView:subtitleText:offerButton:metrics:)();
}

uint64_t sub_7721B0()
{
  return ArcadeLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7721C0()
{
  return ArcadeLockupLayout.Metrics.init(minimumHeight:offerButtonMargin:wordmarkMargin:wordmarkTopSpace:wordmarkSpace:subtitleLeadingSpace:bottomSpace:numberOfLinesForSubtitle:)();
}

uint64_t sub_7721D0()
{
  return ArcadeLockupLayout.Metrics.wordmarkSpace.getter();
}

uint64_t sub_7721E0()
{
  return type metadata accessor for ArcadeLockupLayout.Metrics();
}

uint64_t sub_7721F0()
{
  return type metadata accessor for ArcadeLockupLayout();
}

uint64_t sub_772200()
{
  return dispatch thunk of ArtworkIconFetcher.fetchArtworkIcons(for:partialCompletion:completion:handlerKey:)();
}

uint64_t sub_772210()
{
  return ArtworkIconFetcher.init(objectGraph:)();
}

uint64_t sub_772220()
{
  return dispatch thunk of ArtworkIconFetcher.forgetFetches(for:)();
}

uint64_t sub_772230()
{
  return type metadata accessor for ArtworkIconFetcher();
}

uint64_t sub_772240()
{
  return dispatch thunk of BaseShelfPresenter.doesShelfExist(for:)();
}

uint64_t sub_772250()
{
  return dispatch thunk of BaseShelfPresenter.contentType(for:)();
}

uint64_t sub_772260()
{
  return dispatch thunk of BaseShelfPresenter.numberOfRows(for:)();
}

uint64_t sub_772270()
{
  return dispatch thunk of BaseShelfPresenter.sectionCount.getter();
}

uint64_t sub_772280()
{
  return dispatch thunk of BaseShelfPresenter.titleArtwork(for:)();
}

uint64_t sub_772290()
{
  return dispatch thunk of BaseShelfPresenter.eyebrowArtwork(for:)();
}

uint64_t sub_7722A0()
{
  return dispatch thunk of BaseShelfPresenter.model(at:)();
}

uint64_t sub_7722B0()
{
  return dispatch thunk of BaseShelfPresenter.title(for:)();
}

uint64_t sub_7722C0()
{
  return dispatch thunk of BaseShelfPresenter.eyebrow(for:)();
}

uint64_t sub_7722D0()
{
  return BundleSearchResult.lockup.getter();
}

uint64_t sub_7722E0()
{
  return type metadata accessor for BundleSearchResult();
}

uint64_t sub_7722F0()
{
  return dispatch thunk of ClearablePresenter.clearContent(shouldSendEventsForPageExit:)();
}

uint64_t sub_772300()
{
  return ComponentSeparator.frame(forBoundingRect:in:)();
}

uint64_t sub_772310()
{
  return ComponentSeparator.height(in:)();
}

uint64_t sub_772320()
{
  return ComponentSeparator.Position.rawValue.getter();
}

uint64_t sub_772330()
{
  return type metadata accessor for ComponentSeparator.Position();
}

uint64_t sub_772340()
{
  return ComponentSeparator.init(position:leadingInset:trailingInset:)();
}

uint64_t sub_772350()
{
  return ComponentSeparator.position.getter();
}

uint64_t sub_772360()
{
  return static ComponentSeparator.thickness(compatibleWith:)();
}

uint64_t sub_772370()
{
  return type metadata accessor for ComponentSeparator();
}

uint64_t sub_772380()
{
  return dispatch thunk of EditorialStoryCard.clickAction.getter();
}

uint64_t sub_772390()
{
  return EditorialStoryCard.description.getter();
}

uint64_t sub_7723A0()
{
  return dispatch thunk of EditorialStoryCard.shelfBackground.getter();
}

uint64_t sub_7723B0()
{
  return EditorialStoryCard.title.getter();
}

uint64_t sub_7723C0()
{
  return EditorialStoryCard.heading.getter();
}

uint64_t sub_7723D0()
{
  return EmptyConfiguration.init()();
}

uint64_t sub_7723E0()
{
  return type metadata accessor for EmptyConfiguration();
}

uint64_t sub_7723F0()
{
  return FamilyCircleAction.clientName.getter();
}

uint64_t sub_772400()
{
  return FamilyCircleAction.additionalParameters.getter();
}

uint64_t sub_772410()
{
  return type metadata accessor for FamilyCircleAction.EventType();
}

uint64_t sub_772420()
{
  return FamilyCircleAction.eventType.getter();
}

uint64_t sub_772430()
{
  return type metadata accessor for FamilyCircleAction();
}

uint64_t sub_772440()
{
  return FlowcaseItemLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_772450()
{
  return FlowcaseItemLayout.Metrics.init(captionSpace:titleSpace:subtitleSpace:textArtworkMargin:artworkAspectRatio:bottomSpace:textLayoutMargins:)();
}

uint64_t sub_772460()
{
  return FlowcaseItemLayout.Metrics.captionSpace.getter();
}

uint64_t sub_772470()
{
  return FlowcaseItemLayout.Metrics.artworkAspectRatio.getter();
}

uint64_t sub_772480()
{
  return type metadata accessor for FlowcaseItemLayout.Metrics();
}

uint64_t sub_772490()
{
  return FlowcaseItemLayout.init(metrics:artworkView:captionView:titleText:subtitleText:)();
}

uint64_t sub_7724A0()
{
  return type metadata accessor for FlowcaseItemLayout();
}

uint64_t sub_7724B0()
{
  return GenericAccountPage.title.getter();
}

uint64_t sub_7724C0()
{
  return dispatch thunk of HttpTemplateAction.makeAction(with:body:actionMetrics:)();
}

uint64_t sub_7724D0()
{
  return HttpTemplateAction.failureAction.getter();
}

uint64_t sub_7724E0()
{
  return HttpTemplateAction.parameters.getter();
}

uint64_t sub_7724F0()
{
  return HttpTemplateAction.dictionaryBody.getter();
}

uint64_t sub_772500()
{
  return HttpTemplateAction.message.getter();
}

uint64_t sub_772510()
{
  return type metadata accessor for ImageAlignedButton.ImageAlignment();
}

uint64_t sub_772520()
{
  return dispatch thunk of ImageAlignedButton.imageAlignment.setter();
}

uint64_t sub_772530()
{
  return dispatch thunk of ImageAlignedButton.touchOutsideMargin.setter();
}

uint64_t sub_772540()
{
  return dispatch thunk of ImageAlignedButton.primaryActionHandler.setter();
}

uint64_t sub_772550()
{
  return dispatch thunk of ImageAlignedButton.imageWantsBaselineAlignment.setter();
}

uint64_t sub_772560()
{
  return dispatch thunk of JSIntentDispatcher.dispatch<A>(intent:with:fileID:)();
}

uint64_t sub_772570()
{
  return type metadata accessor for JSIntentDispatcher();
}

uint64_t sub_772580()
{
  return LayoutMarginsAware<>.layoutFrame.getter();
}

uint64_t sub_772590()
{
  return MediumLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7725A0()
{
  return MediumLockupLayout.Metrics.init(artworkSize:artworkMargin:headingSpace:titleSpace:titleWithHeadingRegularSpace:titleWithHeadingShortSpace:subtitleRegularSpace:subtitleShortSpace:tertiaryTitleRegularSpace:tertiaryTitleShortSpace:offerTextRegularSpace:offerTextShortSpace:offerButtonTopMargin:offerButtonBottomMargin:offerButtonSize:)();
}

uint64_t sub_7725B0()
{
  return MediumLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_7725C0()
{
  return MediumLockupLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_7725D0()
{
  return MediumLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_7725E0()
{
  return type metadata accessor for MediumLockupLayout.Metrics();
}

uint64_t sub_7725F0()
{
  return MediumLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:)();
}

uint64_t sub_772600()
{
  return type metadata accessor for MediumLockupLayout();
}

uint64_t sub_772610()
{
  return MetadataRibbonItem.starRating.getter();
}

uint64_t sub_772620()
{
  return MetadataRibbonItem.borderedText.getter();
}

uint64_t sub_772630()
{
  return MetadataRibbonItem.useAdsLocale.getter();
}

uint64_t sub_772640()
{
  return MetadataRibbonItem.highlightedText.getter();
}

uint64_t sub_772650()
{
  return dispatch thunk of MetadataRibbonItem.allowsTruncation.getter();
}

uint64_t sub_772660()
{
  return dispatch thunk of MetadataRibbonItem.impressionMetrics.getter();
}

uint64_t sub_772670()
{
  return dispatch thunk of MetadataRibbonItem.maxCharacterCount.getter();
}

uint64_t sub_772680()
{
  return MetadataRibbonItem.viewContainerType.getter();
}

uint64_t sub_772690()
{
  return MetadataRibbonItem.borderTextViewPlacement.getter();
}

uint64_t sub_7726A0()
{
  return MetadataRibbonItem.id.getter();
}

uint64_t sub_7726B0()
{
  return dispatch thunk of MetadataRibbonItem.truncationLegibilityCharacterCountThreshold.getter();
}

uint64_t sub_7726C0()
{
  return MetadataRibbonItem.artwork.getter();
}

uint64_t sub_7726D0()
{
  return MetadataRibbonItem.itemType.getter();
}

uint64_t sub_7726E0()
{
  return MetadataRibbonItem.labelText.getter();
}

uint64_t sub_7726F0()
{
  return type metadata accessor for MetadataRibbonItem();
}

uint64_t sub_772700()
{
  return OfferButtonMetrics.inAppPurchaseTextSpace.getter();
}

uint64_t sub_772710()
{
  return OfferButtonMetrics.init(fontSource:subtitleFontSource:inAppPurchaseTextSpace:contentInsets:redownloadImage:stopImage:symbolConfiguration:redownloadImageSymbolConfiguration:minimumSize:progressDiameter:lineWidth:textShapeLineWidth:expandsToFit:cornerRadius:includeTopPadding:)();
}

uint64_t sub_772720()
{
  return OfferButtonMetrics.fontSource.setter();
}

uint64_t sub_772730()
{
  return OfferButtonMetrics.minimumSize.getter();
}

uint64_t sub_772740()
{
  return OfferButtonMetrics.minimumSize.setter();
}

uint64_t sub_772750()
{
  return OfferButtonMetrics.estimatedSize(for:subtitlePosition:in:)();
}

uint64_t sub_772760()
{
  return OfferButtonMetrics.estimatedHeight.getter();
}

uint64_t sub_772770()
{
  return type metadata accessor for OfferButtonMetrics();
}

uint64_t sub_772780()
{
  return static OfferButtonStyling.maxNumberOfLinesForSubtitle.getter();
}

uint64_t sub_772790()
{
  return static PosterLockupLayout.aspectRatio.getter();
}

uint64_t sub_7727A0()
{
  return PosterLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7727B0()
{
  return static PosterLockupLayout.maximiumLogoArtworkSize(metrics:containerSize:)();
}

uint64_t sub_7727C0()
{
  return PosterLockupLayout.Metrics.init(headingTopSpace:logoMargin:titleTopSpace:offerButtonTopSpace:footerTopSpace:footerBottomSpace:)();
}

uint64_t sub_7727D0()
{
  return type metadata accessor for PosterLockupLayout.Metrics();
}

uint64_t sub_7727E0()
{
  return PosterLockupLayout.init(metrics:gradient:poster:header:logoArt:fallbackTitle:offerButton:footer:)();
}

uint64_t sub_7727F0()
{
  return type metadata accessor for PosterLockupLayout();
}

uint64_t sub_772800()
{
  return PreorderDisclaimer.disclaimer.getter();
}

uint64_t sub_772810()
{
  return type metadata accessor for PreorderDisclaimer();
}

uint64_t sub_772820()
{
  return ProductDescription.developerAction.getter();
}

uint64_t sub_772830()
{
  return ProductDescription.paragraph.getter();
}

uint64_t sub_772840()
{
  return type metadata accessor for ProductDescription();
}

uint64_t sub_772850()
{
  return PurchasesPresenter.init(objectGraph:bag:)();
}

uint64_t sub_772860()
{
  return dispatch thunk of PurchasesPresenter.view.setter();
}

uint64_t sub_772870()
{
  return type metadata accessor for PurchasesPresenter();
}

uint64_t sub_772880()
{
  return dispatch thunk of SearchAdDisplaying.apply(searchAd:asPartOf:)();
}

uint64_t sub_772890()
{
  return SearchMetricsEvent.init(eventFields:)();
}

uint64_t sub_7728A0()
{
  return type metadata accessor for SearchMetricsEvent();
}

uint64_t sub_7728B0()
{
  return SearchTextSnapshot.init(prefixText:prefixIsProvisional:expansionText:)();
}

uint64_t sub_7728C0()
{
  return type metadata accessor for SearchTextSnapshot();
}

uint64_t sub_7728D0()
{
  return dispatch thunk of ShelfComponentView.itemLayoutContext.getter();
}

uint64_t sub_7728E0()
{
  return dispatch thunk of ShelfComponentView.itemLayoutContext.setter();
}

uint64_t sub_7728F0()
{
  return dispatch thunk of ShelfComponentView.applyData(from:asPartOf:)();
}

uint64_t sub_772900()
{
  return ShelfLayoutContext.itemLayoutContext(for:at:metadata:)();
}

uint64_t sub_772910()
{
  return ShelfLayoutContext.stateStore.getter();
}

uint64_t sub_772920()
{
  return ShelfLayoutContext.isFirstShelf.getter();
}

uint64_t sub_772930()
{
  return ShelfLayoutContext.contentPageGrid.getter();
}

uint64_t sub_772940()
{
  return ShelfLayoutContext.traitCollection.getter();
}

uint64_t sub_772950()
{
  return ShelfLayoutContext.traitEnvironment.getter();
}

uint64_t sub_772960()
{
  return ShelfLayoutContext.surroundingShelves.getter();
}

uint64_t sub_772970()
{
  return ShelfLayoutContext.supplementaryPageGrid.getter();
}

uint64_t sub_772980()
{
  return ShelfLayoutContext.shelfPresentationHints.getter();
}

uint64_t sub_772990()
{
  return ShelfLayoutContext.id.getter();
}

uint64_t sub_7729A0()
{
  return ShelfLayoutContext.index.getter();
}

uint64_t sub_7729B0()
{
  return ShelfLayoutContext.shelf.getter();
}

uint64_t sub_7729C0()
{
  return type metadata accessor for ShelfLayoutContext();
}

uint64_t sub_7729D0()
{
  return TodayCardMediaGrid.artworkGridType.getter();
}

uint64_t sub_7729E0()
{
  return TodayCardMediaGrid.lockups.getter();
}

uint64_t sub_7729F0()
{
  return type metadata accessor for TodayCardMediaGrid();
}

uint64_t sub_772A00()
{
  return TodayCardMediaList.isMediaDark.getter();
}

uint64_t sub_772A10()
{
  return TodayCardMediaList.hasMedia.getter();
}

uint64_t sub_772A20()
{
  return TodayCardMediaList.marketingText.getter();
}

uint64_t sub_772A30()
{
  return TodayCardMediaList.artworkLayoutsWithMetrics.getter();
}

uint64_t sub_772A40()
{
  return TodayCardMediaList.lockups.getter();
}

uint64_t sub_772A50()
{
  return type metadata accessor for TodayCardMediaList();
}

uint64_t sub_772A60()
{
  return dispatch thunk of UpdatablePresenter.update(ignoringCache:)();
}

uint64_t sub_772A70()
{
  return dispatch thunk of UpdatablePresenter.didLoad()();
}

uint64_t sub_772A80()
{
  return static VideoConfiguration.defaultConfiguration.getter();
}

uint64_t sub_772A90()
{
  return VideoConfiguration.aspectRatio.getter();
}

uint64_t sub_772AA0()
{
  return VideoConfiguration.allowsAutoPlay.getter();
}

uint64_t sub_772AB0()
{
  return VideoConfiguration.roundedCorners.getter();
}

uint64_t sub_772AC0()
{
  return VideoConfiguration.playbackControls.getter();
}

uint64_t sub_772AD0()
{
  return VideoConfiguration.canPlayFullScreen.getter();
}

uint64_t sub_772AE0()
{
  return VideoConfiguration.canPlayFullScreen.setter();
}

uint64_t sub_772AF0()
{
  return VideoConfiguration.autoPlayPlaybackControls.getter();
}

uint64_t sub_772B00()
{
  return VideoConfiguration.deviceCornerRadiusFactor.getter();
}

uint64_t sub_772B10()
{
  return VideoConfiguration.looping.getter();
}

uint64_t sub_772B20()
{
  return VideoConfiguration.init(fillMode:aspectRatio:playbackControls:autoPlayPlaybackControls:canPlayFullScreen:allowsAutoPlay:looping:roundedCorners:deviceCornerRadiusFactor:)();
}

uint64_t sub_772B30()
{
  return VideoConfiguration.fillMode.getter();
}

uint64_t sub_772B40()
{
  return type metadata accessor for VideoConfiguration();
}

uint64_t sub_772B50()
{
  return dispatch thunk of VideoViewContainer.currentlyOwns(videoView:)();
}

uint64_t sub_772B60()
{
  return VideoViewProviding.someVideoView.modify();
}

uint64_t sub_772B90()
{
  return makeNetworkInquiry()();
}

uint64_t sub_772BA0()
{
  return static ASKBootstrapFactory.make(bagProfile:appStateControllerFactory:targetType:)();
}

uint64_t sub_772BB0()
{
  return dispatch thunk of ActionPresenterView.perform(action:sender:)();
}

uint64_t sub_772BC0()
{
  return AdInteractionAction.adActionMetrics.getter();
}

uint64_t sub_772BD0()
{
  return dispatch thunk of AdRotationDisabling.disableAdvertRotation.getter();
}

uint64_t sub_772BE0()
{
  return dispatch thunk of AdRotationDisabling.disableAdvertRotation.setter();
}

uint64_t sub_772BF0()
{
  return type metadata accessor for AdvertActionMetrics.AdvertType();
}

uint64_t sub_772C00()
{
  return type metadata accessor for AdvertActionMetrics.ReportingDestination();
}

uint64_t sub_772C10()
{
  return type metadata accessor for AdvertActionMetrics();
}

uint64_t sub_772C20()
{
  return type metadata accessor for AdvertDiscardReason();
}

uint64_t sub_772C30()
{
  return AdvertsSearchResult.displaysScreenshots.getter();
}

uint64_t sub_772C40()
{
  return AdvertsSearchResult.lockups.getter();
}

uint64_t sub_772C50()
{
  return type metadata accessor for AdvertsSearchResult();
}

uint64_t sub_772C60()
{
  return type metadata accessor for ArcadeSubscribePage.PageType();
}

uint64_t sub_772C70()
{
  return ArcadeSubscribePage.askToBuyMessage.getter();
}

uint64_t sub_772C80()
{
  return ArcadeSubscribePage.offerButtonAction.getter();
}

uint64_t sub_772C90()
{
  return ArcadeSubscribePage.dismissButtonTitle.getter();
}

uint64_t sub_772CA0()
{
  return ArcadeSubscribePage.offerDisplayProperties.getter();
}

uint64_t sub_772CB0()
{
  return ArcadeSubscribePage.subscribedOfferButtonAction.getter();
}

uint64_t sub_772CC0()
{
  return ArcadeSubscribePage.details.getter();
}

uint64_t sub_772CD0()
{
  return ArcadeSubscribePage.pageType.getter();
}

uint64_t sub_772CE0()
{
  return type metadata accessor for ArcadeSubscribePage();
}

uint64_t sub_772CF0()
{
  return ArtworkItemProvider.init(artworkLoader:config:)();
}

uint64_t sub_772D00()
{
  return type metadata accessor for ArtworkItemProvider();
}

uint64_t sub_772D10()
{
  return ArtworkLoaderConfig.size.getter();
}

uint64_t sub_772D20()
{
  return ArtworkLoaderConfig.scale.getter();
}

uint64_t sub_772D30()
{
  return ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)();
}

uint64_t sub_772D40()
{
  return ArtworkLoaderConfig.template.getter();
}

uint64_t sub_772D50()
{
  return type metadata accessor for ArtworkLoaderConfig();
}

uint64_t sub_772D60()
{
  return type metadata accessor for ComponentDecoration();
}

uint64_t sub_772D70()
{
  return dispatch thunk of DynamicTypeTextView.attributedTextShouldOverrideTextViewAttributes.setter();
}

uint64_t sub_772D80()
{
  return dispatch thunk of DynamicTypeTextView.fontUseCase.getter();
}

uint64_t sub_772D90()
{
  return dispatch thunk of DynamicTypeTextView.fontUseCase.setter();
}

uint64_t sub_772DA0()
{
  return dispatch thunk of DynamicTypeTextView.lineBreakMode.getter();
}

uint64_t sub_772DB0()
{
  return dispatch thunk of DynamicTypeTextView.lineBreakMode.setter();
}

uint64_t sub_772DC0()
{
  return dispatch thunk of DynamicTypeTextView.numberOfLines.setter();
}

uint64_t sub_772DD0()
{
  return dispatch thunk of DynamicTypeTextView.hyphenationFactor.setter();
}

uint64_t sub_772DE0()
{
  return dispatch thunk of DynamicTypeTextView.contentSizeCategoryMapping.setter();
}

uint64_t sub_772DF0()
{
  return dispatch thunk of DynamicTypeTextView.traitCollectionForFontUseCases.getter();
}

uint64_t sub_772E00()
{
  return type metadata accessor for DynamicTypeTextView();
}

uint64_t sub_772E10()
{
  return method lookup function for DynamicTypeTextView();
}

uint64_t sub_772E20()
{
  return EdgeInsetsDimension.init(top:left:bottom:right:source:)();
}

uint64_t sub_772E30()
{
  return EdgeInsetsDimension.value(in:rounded:)();
}

uint64_t sub_772E40()
{
  return type metadata accessor for EdgeInsetsDimension();
}

void sub_772E50()
{
}

void sub_772E60()
{
}

uint64_t sub_772E70()
{
  return JSFreshnessWatchdog.__allocating_init(bag:networkInquiry:)();
}

uint64_t sub_772E80()
{
  return type metadata accessor for JSFreshnessWatchdog();
}

uint64_t sub_772E90()
{
  return dispatch thunk of LanguageAwareString.attributedString.getter();
}

uint64_t sub_772EA0()
{
  return static LanguageAwareString.keepStatisticsOnLanguageComponents.getter();
}

uint64_t sub_772EB0()
{
  return static LanguageAwareString.alwaysGenerateAttributedString.getter();
}

uint64_t sub_772EC0()
{
  return dispatch thunk of LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)();
}

uint64_t sub_772ED0()
{
  return dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.getter();
}

uint64_t sub_772EE0()
{
  return LanguageAwareString.string.getter();
}

uint64_t sub_772EF0()
{
  return dispatch thunk of LanguageAwareString.isEmpty.getter();
}

uint64_t sub_772F00()
{
  return type metadata accessor for LanguageAwareString();
}

uint64_t sub_772F10()
{
  return LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_772F20()
{
  return LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_772F30()
{
  return LocalAskToBuyAction.completion.getter();
}

uint64_t sub_772F40()
{
  return LocalAskToBuyAction.adamIdString.getter();
}

uint64_t sub_772F50()
{
  return OfferItemDetailPage.offerItem.getter();
}

uint64_t sub_772F60()
{
  return OfferItemDetailPage.additionalInfo.getter();
}

uint64_t sub_772F70()
{
  return OfferItemDetailPage.learnMoreTitle.getter();
}

uint64_t sub_772F80()
{
  return OfferItemDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_772F90()
{
  return OfferItemDetailPage.learnMoreActionMetrics.getter();
}

uint64_t sub_772FA0()
{
  return OfferItemDetailPage.backButtonActionMetrics.getter();
}

uint64_t sub_772FB0()
{
  return OfferItemDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_772FC0()
{
  return OfferItemDetailPage.closeButtonActionMetrics.getter();
}

uint64_t sub_772FD0()
{
  return OfferItemDetailPage.video.getter();
}

uint64_t sub_772FE0()
{
  return OfferItemDetailPage.artwork.getter();
}

uint64_t sub_772FF0()
{
  return type metadata accessor for OfferItemDetailPage();
}

uint64_t sub_773000()
{
  return OfferLabelPresenter.init(offerDisplayProperties:adamId:appStateController:arePreordersCancellable:)();
}

uint64_t sub_773010()
{
  return OfferLabelPresenter.view.setter();
}

uint64_t sub_773020()
{
  return type metadata accessor for OfferLabelPresenter();
}

uint64_t sub_773030()
{
  return type metadata accessor for OpenableDestination();
}

uint64_t sub_773040()
{
  return PageFacetsPresenter.pageFacets.getter();
}

uint64_t sub_773050()
{
  return static PageFacetsPresenter.selectedFacetsTitle(for:)();
}

uint64_t sub_773060()
{
  return PageFacetsPresenter.onPerformPageFacetsChangeAction.getter();
}

uint64_t sub_773070()
{
  return PageFacetsPresenter.FacetsState.selectedFacetOptions.getter();
}

uint64_t sub_773080()
{
  return PageFacetsPresenter.FacetsState.facets.getter();
}

uint64_t sub_773090()
{
  return type metadata accessor for PageFacetsPresenter.FacetsState();
}

uint64_t sub_7730A0()
{
  return PageFacetsPresenter.selectedFacetOptions.getter();
}

uint64_t sub_7730B0()
{
  return PageFacetsPresenter.onFacetStateDidChange.getter();
}

uint64_t sub_7730C0()
{
  return PageFacetsPresenter.onSelectedFacetOptionsChanged.getter();
}

void sub_7730D0()
{
}

uint64_t sub_7730E0()
{
  return PageFacetsPresenter.didSelect(option:in:)();
}

uint64_t sub_7730F0()
{
  return PageFacetsPresenter.init()();
}

uint64_t sub_773100()
{
  return type metadata accessor for PageFacetsPresenter();
}

uint64_t sub_773110()
{
  return PageTabChangeAction.selectedTabId.getter();
}

uint64_t sub_773120()
{
  return type metadata accessor for PageTabChangeAction();
}

uint64_t sub_773130()
{
  return dispatch thunk of PlaybackCoordinator.unregister(playableView:)();
}

uint64_t sub_773140()
{
  return dispatch thunk of PlaybackCoordinator.setParentViewController(_:)();
}

uint64_t sub_773150()
{
  return dispatch thunk of PlaybackCoordinator.pause()();
}

uint64_t sub_773160()
{
  return dispatch thunk of PlaybackCoordinator.resume()();
}

uint64_t sub_773170()
{
  return dispatch thunk of PlaybackCoordinator.register(playableView:)();
}

uint64_t sub_773180()
{
  return type metadata accessor for PlaybackCoordinator();
}

uint64_t sub_773190()
{
  return PrivacyFooterLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7731A0()
{
  return PrivacyFooterLayout.Metrics.init(bodyTopSpace:actionButtonLeadingMargin:maxTextWidth:bottomSpace:)();
}

uint64_t sub_7731B0()
{
  return type metadata accessor for PrivacyFooterLayout.Metrics();
}

uint64_t sub_7731C0()
{
  return PrivacyFooterLayout.init(metrics:bodyLabel:actionButtons:)();
}

uint64_t sub_7731D0()
{
  return type metadata accessor for PrivacyFooterLayout();
}

uint64_t sub_7731E0()
{
  return PrivacyHeaderLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7731F0()
{
  return PrivacyHeaderLayout.Metrics.init(bodyTopSpace:bodyBottomSpace:supplementaryItemsTopSpace:supplementaryItemsPadding:supplementaryItemsBottomSpace:actionButtonLeadingMargin:bodyOnlyBottomMargin:maxTextWidth:)();
}

uint64_t sub_773200()
{
  return type metadata accessor for PrivacyHeaderLayout.Metrics();
}

uint64_t sub_773210()
{
  return PrivacyHeaderLayout.init(metrics:isDetailHeader:bodyLabel:supplementaryItemLabels:topSeparatorView:middleSeparatorView:actionButtons:)();
}

uint64_t sub_773220()
{
  return type metadata accessor for PrivacyHeaderLayout();
}

uint64_t sub_773230()
{
  return type metadata accessor for ProductReviewAction.ReviewAction();
}

uint64_t sub_773240()
{
  return ProductReviewAction.action.getter();
}

uint64_t sub_773250()
{
  return type metadata accessor for ProductReviewAction();
}

uint64_t sub_773260()
{
  return ProductReviewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773270()
{
  return ProductReviewLayout.Metrics.init(titleSpace:ratingSpace:dateSpace:authorSpace:bodyFirstLineSpace:bodySubsequentLineSpace:bodyEstimatedNumberOfLines:responseTitleSpace:responseDateSpace:responseBodyFirstLineSpace:horizontalInterViewSpace:horizontalEdgeSpace:bottomEdgeSpace:badgeSpace:actionsSpace:actionsInterItemSpace:)();
}

uint64_t sub_773280()
{
  return type metadata accessor for ProductReviewLayout.Metrics();
}

uint64_t sub_773290()
{
  return ProductReviewLayout.init(metrics:titleText:ratingView:dateText:authorText:bodyText:responseTitleText:responseDateText:responseBodyText:badgeText:actionViews:)();
}

uint64_t sub_7732A0()
{
  return type metadata accessor for ProductReviewLayout();
}

uint64_t sub_7732B0()
{
  return ProductWriteAReview.supportAction.getter();
}

uint64_t sub_7732C0()
{
  return ProductWriteAReview.writeReviewAction.getter();
}

uint64_t sub_7732D0()
{
  return ReportConcernAction.sendAction.getter();
}

uint64_t sub_7732E0()
{
  return ReportConcernAction.explanation.getter();
}

uint64_t sub_7732F0()
{
  return ReportConcernAction.reasons.getter();
}

uint64_t sub_773300()
{
  return type metadata accessor for ReportConcernAction();
}

uint64_t sub_773310()
{
  return ReportConcernReason.uppercaseName.getter();
}

uint64_t sub_773320()
{
  return ReportConcernReason.id.getter();
}

uint64_t sub_773330()
{
  return ReportConcernReason.name.getter();
}

uint64_t sub_773340()
{
  return type metadata accessor for ReportConcernReason();
}

uint64_t sub_773350()
{
  return ReviewSummaryLayout.Metrics.contentPadding.setter();
}

uint64_t sub_773360()
{
  return ReviewSummaryLayout.Metrics.init(subtitleTopSpace:contentPadding:)();
}

uint64_t sub_773370()
{
  return type metadata accessor for ReviewSummaryLayout.Metrics();
}

uint64_t sub_773380()
{
  return ReviewSummaryLayout.init(metrics:bodyLabel:subtitleLabel:)();
}

uint64_t sub_773390()
{
  return type metadata accessor for ReviewSummaryLayout();
}

uint64_t sub_7733A0()
{
  return type metadata accessor for RiverRowLayoutStyle();
}

uint64_t sub_7733B0()
{
  return SearchTextPresenter.inputSource.setter();
}

uint64_t sub_7733C0()
{
  return SearchTextPresenter.onApplyTermExpansion.getter();
}

uint64_t sub_7733D0()
{
  return SearchTextPresenter.init(ghostHintMetricsTracker:)();
}

uint64_t sub_7733E0()
{
  return type metadata accessor for SearchTextPresenter();
}

uint64_t sub_7733F0()
{
  return SmallBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773400()
{
  return static SmallBreakoutLayout.rotatedIconFrameOffsets(rotation:iconSize:)();
}

uint64_t sub_773410()
{
  return SmallBreakoutLayout.Metrics.init(iconSize:iconRotation:iconBottomOffset:detailsTrailingMargin:detailsWidth:layoutMargins:height:)();
}

uint64_t sub_773420()
{
  return type metadata accessor for SmallBreakoutLayout.Metrics();
}

uint64_t sub_773430()
{
  return SmallBreakoutLayout.init(metrics:iconView:detailsView:)();
}

uint64_t sub_773440()
{
  return type metadata accessor for SmallBreakoutLayout();
}

uint64_t sub_773450()
{
  return static SpacerSupplementary.makeSpacerRegistration(elementKind:)();
}

uint64_t sub_773460()
{
  return static SpacerSupplementary.topElementKind.getter();
}

uint64_t sub_773470()
{
  return static SpacerSupplementary.bottomElementKind.getter();
}

uint64_t sub_773480()
{
  return type metadata accessor for SpacerSupplementary();
}

uint64_t sub_773490()
{
  return TodayCardMediaRiver.lockups.getter();
}

uint64_t sub_7734A0()
{
  return type metadata accessor for TodayCardMediaRiver();
}

uint64_t sub_7734B0()
{
  return type metadata accessor for TodayCardMediaVideo();
}

uint64_t sub_7734C0()
{
  return type metadata accessor for TriggerBuilderError();
}

uint64_t sub_7734D0()
{
  return type metadata accessor for URLProtocolDelegate.DialogStyle();
}

uint64_t sub_7734E0()
{
  return URLProtocolDelegate.init(dialogStyle:)();
}

uint64_t sub_7734F0()
{
  return URLProtocolDelegate.dialogStyle.setter();
}

uint64_t sub_773500()
{
  return URLProtocolDelegate.presentDialog(for:)();
}

uint64_t sub_773510()
{
  return URLProtocolDelegate.performAuthentication(for:)();
}

uint64_t sub_773520()
{
  return type metadata accessor for URLProtocolDelegate();
}

uint64_t sub_773530()
{
  return UpsellGridPresenter.init(objectGraph:contentDictionary:)();
}

uint64_t sub_773540()
{
  return UpsellGridPresenter.view.setter();
}

uint64_t sub_773550()
{
  return type metadata accessor for UpsellGridPresenter();
}

uint64_t sub_773560()
{
  return _VerticalFlowLayout.measurements(fitting:in:)();
}

uint64_t sub_773570()
{
  return _VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773580()
{
  return static _VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_773590()
{
  return static _VerticalFlowLayout.ExclusionCondition.hasNoContent.getter();
}

uint64_t sub_7735A0()
{
  return static _VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_7735B0()
{
  return type metadata accessor for _VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_7735C0()
{
  return _VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_7735D0()
{
  return type metadata accessor for _VerticalFlowLayout.Child.HorizontalAlignment();
}

uint64_t sub_7735E0()
{
  return static _VerticalFlowLayout.Child.make(forView:placement:horizontalAlignment:topSpace:bottomSpace:excludeWhen:)();
}

uint64_t sub_7735F0()
{
  return type metadata accessor for _VerticalFlowLayout.Child.Placement();
}

uint64_t sub_773600()
{
  return type metadata accessor for _VerticalFlowLayout.Child();
}

uint64_t sub_773610()
{
  return _VerticalFlowLayout.addChild(_:)();
}

uint64_t sub_773620()
{
  return type metadata accessor for _VerticalFlowLayout();
}

uint64_t sub_773630()
{
  return dispatch thunk of ASKBootstrapProtocol.withMetricsEventRecorderProducer(_:)();
}

uint64_t sub_773640()
{
  return dispatch thunk of ASKBootstrapProtocol.start()();
}

uint64_t sub_773650()
{
  return AchievementGroupView.init(visibleModel:showSecondCard:cardSize:)();
}

uint64_t sub_773660()
{
  return type metadata accessor for AchievementGroupView.Size();
}

uint64_t sub_773670()
{
  return type metadata accessor for AchievementGroupView();
}

uint64_t sub_773680()
{
  return dispatch thunk of AdAttributionManager.performClickThroughAttribution(forAdamID:appState:)();
}

uint64_t sub_773690()
{
  return dispatch thunk of AdAttributionManager.processReengagement(forBundleID:payloadURL:)();
}

uint64_t sub_7736A0()
{
  return type metadata accessor for AdAttributionManager();
}

uint64_t sub_7736B0()
{
  return type metadata accessor for AdTransparencyAction();
}

uint64_t sub_7736C0()
{
  return static AppleAccountBranding.localizedString(_:)();
}

uint64_t sub_7736D0()
{
  return ArcadeWelcomeContent.familyAction.getter();
}

uint64_t sub_7736E0()
{
  return ArcadeWelcomeContent.continueAction.getter();
}

uint64_t sub_7736F0()
{
  return ArcadeWelcomeContent.items.getter();
}

uint64_t sub_773700()
{
  return ArcadeWelcomeContent.title.getter();
}

uint64_t sub_773710()
{
  return ArcadeWelcomeContent.subtitle.getter();
}

uint64_t sub_773720()
{
  return dispatch thunk of ArtworkModelProtocol.artwork.getter();
}

uint64_t sub_773730()
{
  return type metadata accessor for BoundsBasedPlaceable();
}

uint64_t sub_773740()
{
  return CancelPreorderAction.preorderAdamId.getter();
}

uint64_t sub_773750()
{
  return CancelPreorderAction.isArcade.getter();
}

uint64_t sub_773760()
{
  return type metadata accessor for CancelPreorderAction();
}

uint64_t sub_773770()
{
  return dispatch thunk of ChartOrCategoryBrick.brickBadge.getter();
}

uint64_t sub_773780()
{
  return dispatch thunk of ChartOrCategoryBrick.brickTitle.getter();
}

uint64_t sub_773790()
{
  return dispatch thunk of ChartOrCategoryBrick.artworkSafeArea.getter();
}

uint64_t sub_7737A0()
{
  return ComponentHeightCache.invalidate(items:)();
}

uint64_t sub_7737B0()
{
  return ComponentHeightCache.init()();
}

uint64_t sub_7737C0()
{
  return type metadata accessor for ComponentHeightCache();
}

uint64_t sub_7737D0()
{
  return DynamicUIRequestInfo.clientOptions.getter();
}

uint64_t sub_7737E0()
{
  return DynamicUIRequestInfo.metricsOverlay.getter();
}

uint64_t sub_7737F0()
{
  return DynamicUIRequestInfo.onDismissalAction.getter();
}

uint64_t sub_773800()
{
  return DynamicUIRequestInfo.purchaseFailureAction.getter();
}

uint64_t sub_773810()
{
  return DynamicUIRequestInfo.purchaseSuccessAction.getter();
}

uint64_t sub_773820()
{
  return DynamicUIRequestInfo.carrierLinkFailureAction.getter();
}

uint64_t sub_773830()
{
  return DynamicUIRequestInfo.carrierLinkSuccessAction.getter();
}

uint64_t sub_773840()
{
  return type metadata accessor for DynamicUIRequestInfo();
}

uint64_t sub_773850()
{
  return EditorialQuoteLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773860()
{
  return EditorialQuoteLayout.Metrics.init(quoteTopSpace:attributionTopSpace:horizontalMargin:bottomMargin:maxWidth:minHeight:alignment:)();
}

uint64_t sub_773870()
{
  return type metadata accessor for EditorialQuoteLayout.Metrics.Alignment();
}

uint64_t sub_773880()
{
  return type metadata accessor for EditorialQuoteLayout.Metrics();
}

uint64_t sub_773890()
{
  return EditorialQuoteLayout.init(metrics:quoteLabel:attributionLabel:)();
}

uint64_t sub_7738A0()
{
  return type metadata accessor for EditorialQuoteLayout();
}

uint64_t sub_7738B0()
{
  return dispatch thunk of static ExactHeightProviding.height(in:asPartOf:)();
}

uint64_t sub_7738C0()
{
  return GenericPagePresenter.init(objectGraph:personalizationProvider:page:pageUrl:supportsFastImpressions:adLifecycleMetricReporter:)();
}

uint64_t sub_7738D0()
{
  return type metadata accessor for GenericPagePresenter();
}

uint64_t sub_7738E0()
{
  return InstallPageOfferMode.rawValue.getter();
}

uint64_t sub_7738F0()
{
  return LoadingPagePresenter.init(objectGraph:pageUrl:isIncomingURL:referrerData:)();
}

uint64_t sub_773900()
{
  return dispatch thunk of LoadingPagePresenter.view.setter();
}

uint64_t sub_773910()
{
  return type metadata accessor for LoadingPagePresenter();
}

uint64_t sub_773920()
{
  return dispatch thunk of MetricsPagePresenter.pageRenderMetrics.getter();
}

uint64_t sub_773930()
{
  return dispatch thunk of MetricsPagePresenter.pendingPageRender.getter();
}

uint64_t sub_773940()
{
  return dispatch thunk of MetricsPagePresenter.metricsPipeline.getter();
}

uint64_t sub_773950()
{
  return dispatch thunk of MetricsPagePresenter.impressionsTracker.getter();
}

uint64_t sub_773960()
{
  return dispatch thunk of MetricsPagePresenter.impressionsCalculator.getter();
}

uint64_t sub_773970()
{
  return dispatch thunk of MetricsPagePresenter.referrer.getter();
}

uint64_t sub_773980()
{
  return MetricsPagePresenter.observe(lifecycleEvent:)();
}

uint64_t sub_773990()
{
  return MetricsTopicProvider.createEventDecorator()();
}

uint64_t sub_7739A0()
{
  return MetricsTopicProvider.shouldHaveAnonymousEvents.getter();
}

uint64_t sub_7739B0()
{
  return MetricsTopicProvider.init(bag:)();
}

uint64_t sub_7739C0()
{
  return type metadata accessor for MetricsTopicProvider();
}

uint64_t sub_7739D0()
{
  return dispatch thunk of OfferButtonPresenter.offerDisplayProperties.getter();
}

uint64_t sub_7739E0()
{
  return dispatch thunk of OfferButtonPresenter.view.setter();
}

uint64_t sub_7739F0()
{
  return dispatch thunk of OfferButtonPresenter.update(ignoringCache:)();
}

uint64_t sub_773A00()
{
  return type metadata accessor for PrivacyCategoryStyle();
}

uint64_t sub_773A10()
{
  return ProductMediaMetadata.hasPortraitMedia.getter();
}

uint64_t sub_773A20()
{
  return ProductMediaMetadata.hasPortraitPhoneMedia.getter();
}

uint64_t sub_773A30()
{
  return ProductMediaMetadata.allPlatforms.getter();
}

uint64_t sub_773A40()
{
  return ProductMediaMetadata.platformDescription.getter();
}

uint64_t sub_773A50()
{
  return ProductMediaMetadata.descriptionPlacement(when:)();
}

uint64_t sub_773A60()
{
  return ProductMediaMetadata.allPlatformsDescription.getter();
}

uint64_t sub_773A70()
{
  return ProductMediaMetadata.platform.getter();
}

uint64_t sub_773A80()
{
  return type metadata accessor for ProductMediaMetadata();
}

uint64_t sub_773A90()
{
  return ProductRatingsLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773AA0()
{
  return static ProductRatingsLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_773AB0()
{
  return ProductRatingsLayout.Metrics.columnWidth.setter();
}

uint64_t sub_773AC0()
{
  return ProductRatingsLayout.Metrics.columnMargin.setter();
}

uint64_t sub_773AD0()
{
  return ProductRatingsLayout.Metrics.layoutMargins.setter();
}

uint64_t sub_773AE0()
{
  return ProductRatingsLayout.Metrics.init(averageRatingTextSpace:compactDenominatorTextSpace:denominatorLeadingMargin:columnWidth:columnMargin:histogramLeadingMargin:progressBarMargin:histogramStarSpacing:histogramBarHeight:bottomSpace:layoutMargins:)();
}

uint64_t sub_773AF0()
{
  return type metadata accessor for ProductRatingsLayout.Metrics();
}

uint64_t sub_773B00()
{
  return ProductRatingsLayout.init(metrics:averageRatingText:denominatorRatingText:ratingCountText:histogramStarViews:histogramRatingProgressViews:)();
}

uint64_t sub_773B10()
{
  return type metadata accessor for ProductRatingsLayout();
}

uint64_t sub_773B20()
{
  return PurchasesContentMode.displayTitle.getter();
}

uint64_t sub_773B30()
{
  return PurchasesContentMode.segmentIndex.getter();
}

uint64_t sub_773B40()
{
  return PurchasesContentMode.toggleIsHiddenText.getter();
}

uint64_t sub_773B50()
{
  return type metadata accessor for PurchasesContentMode();
}

uint64_t sub_773B60()
{
  return ReviewsPagePresenter.init(objectGraph:appStateController:reviewsPage:preferSelectedActionTitles:)();
}

uint64_t sub_773B70()
{
  return ReviewsPagePresenter.onPerformAction.getter();
}

uint64_t sub_773B80()
{
  return dispatch thunk of ReviewsPagePresenter.sortActionTitle(for:)();
}

uint64_t sub_773B90()
{
  return dispatch thunk of ReviewsPagePresenter.initialIndexPath.getter();
}

uint64_t sub_773BA0()
{
  return dispatch thunk of ReviewsPagePresenter.performSortAction(sender:)();
}

uint64_t sub_773BB0()
{
  return dispatch thunk of ReviewsPagePresenter.trailingNavBarAction.getter();
}

uint64_t sub_773BC0()
{
  return ReviewsPagePresenter.title.getter();
}

uint64_t sub_773BD0()
{
  return type metadata accessor for ReviewsPagePresenter();
}

uint64_t sub_773BE0()
{
  return SearchHintsPresenter.init(objectGraph:searchTextPresenter:searchGhostHintTracker:)();
}

uint64_t sub_773BF0()
{
  return dispatch thunk of SearchHintsPresenter.resultCount.getter();
}

uint64_t sub_773C00()
{
  return dispatch thunk of SearchHintsPresenter.didSelectHint(at:)();
}

uint64_t sub_773C10()
{
  return dispatch thunk of SearchHintsPresenter.hint(at:)();
}

uint64_t sub_773C20()
{
  return dispatch thunk of SearchHintsPresenter.view.setter();
}

uint64_t sub_773C30()
{
  return type metadata accessor for SearchHintsPresenter();
}

uint64_t sub_773C40()
{
  return SearchResultsMessage.primaryText.getter();
}

uint64_t sub_773C50()
{
  return SearchResultsMessage.secondaryText.getter();
}

uint64_t sub_773C60()
{
  return type metadata accessor for ShelfBackgroundStyle();
}

uint64_t sub_773C70()
{
  return SmallStoryCardLayout.init(contentView:headingLabel:descriptionLabel:metrics:)();
}

uint64_t sub_773C80()
{
  return SmallStoryCardLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773C90()
{
  return static SmallStoryCardLayout.estimatedMeasurements(fitting:using:with:)();
}

uint64_t sub_773CA0()
{
  return SmallStoryCardLayout.Metrics.init(contentAspectRatio:headingPrimarySpace:descriptionPrimarySpace:headingSecondarySpace:descriptionSecondarySpace:descriptionBottomSpace:descriptionNumberOfLines:headingNumberOfLines:)();
}

uint64_t sub_773CB0()
{
  return SmallStoryCardLayout.Metrics.contentAspectRatio.getter();
}

uint64_t sub_773CC0()
{
  return type metadata accessor for SmallStoryCardLayout.Metrics();
}

uint64_t sub_773CD0()
{
  return type metadata accessor for SmallStoryCardLayout();
}

uint64_t sub_773CE0()
{
  return type metadata accessor for TitledParagraphStyle();
}

uint64_t sub_773CF0()
{
  return UpsellBreakoutLayout.measuredSize(fitting:in:)();
}

uint64_t sub_773D00()
{
  return UpsellBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773D10()
{
  return UpsellBreakoutLayout.Metrics.init(backgroundMediaAspectRatio:detailsWidth:actionButtonHeight:actionButtonMinWidth:actionButtonTopMargin:buttonDetailsSpace:layoutMargins:height:mediaSafeAreaHeight:)();
}

uint64_t sub_773D20()
{
  return type metadata accessor for UpsellBreakoutLayout.Metrics();
}

uint64_t sub_773D30()
{
  return UpsellBreakoutLayout.init(metrics:backgroundMediaView:detailsView:actionButton:buttonDetailsView:)();
}

uint64_t sub_773D40()
{
  return type metadata accessor for UpsellBreakoutLayout();
}

uint64_t sub_773D50()
{
  return type metadata accessor for VideoPlaybackFailure();
}

uint64_t sub_773D60()
{
  return dispatch thunk of AnyVideoViewProviding.someVideoView.getter();
}

uint64_t sub_773D70()
{
  return dispatch thunk of AnyVideoViewProviding.someVideoView.setter();
}

uint64_t sub_773D80()
{
  return type metadata accessor for ArcadeIntroOfferState();
}

uint64_t sub_773D90()
{
  return type metadata accessor for ArcadeSeeAllGamesPage.DisplayStyle();
}

uint64_t sub_773DA0()
{
  return type metadata accessor for ArcadeSeeAllGamesPage();
}

uint64_t sub_773DB0()
{
  return BadgeContentKeyAdamId.getter();
}

uint64_t sub_773DC0()
{
  return BadgeContentKeyRating.getter();
}

uint64_t sub_773DD0()
{
  return static BadgeViewRibbonLayout.measurements(valueLabelWidth:viewSize:captionWidth:headingLabelWidth:fitting:using:in:)();
}

uint64_t sub_773DE0()
{
  return BadgeViewRibbonLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773DF0()
{
  return static BadgeViewRibbonLayout.estimatedHeight(fitting:using:with:)();
}

uint64_t sub_773E00()
{
  return BadgeViewRibbonLayout.Metrics.accessibleBadgeInsets.modify();
}

uint64_t sub_773E10()
{
  return BadgeViewRibbonLayout.Metrics.valueViewAlignment.setter();
}

uint64_t sub_773E20()
{
  return BadgeViewRibbonLayout.Metrics.regularBadgeInsets.modify();
}

uint64_t sub_773E30()
{
  return BadgeViewRibbonLayout.Metrics.spacingType.setter();
}

uint64_t sub_773E40()
{
  return BadgeViewRibbonLayout.Metrics.init(headingSpace:captionSpace:captionBottomSpace:badgeValueEditorsChoiceSpace:badgeValueIconSpace:badgeValueTextSpace:badgeValueBaselineOffset:badgeIconSize:valueBufferSpace:spacingType:captionCappingType:badgeType:isLabelLeading:valueViewAlignment:alignment:regularBadgeInsets:accessibleBadgeInsets:)();
}

uint64_t sub_773E50()
{
  return BadgeViewRibbonLayout.Metrics.badgeIconSize.getter();
}

uint64_t sub_773E60()
{
  return BadgeViewRibbonLayout.Metrics.isLabelLeading.setter();
}

uint64_t sub_773E70()
{
  return BadgeViewRibbonLayout.Metrics.captionCappingType.setter();
}

uint64_t sub_773E80()
{
  return BadgeViewRibbonLayout.Metrics.badgeValueBaselineOffset.setter();
}

uint64_t sub_773E90()
{
  return BadgeViewRibbonLayout.Metrics.alignment.setter();
}

uint64_t sub_773EA0()
{
  return BadgeViewRibbonLayout.Metrics.badgeType.setter();
}

uint64_t sub_773EB0()
{
  return type metadata accessor for BadgeViewRibbonLayout.Metrics();
}

uint64_t sub_773EC0()
{
  return BadgeViewRibbonLayout.init(metrics:headingLabel:captionView:valueLabel:valueView:)();
}

uint64_t sub_773ED0()
{
  return type metadata accessor for BadgeViewRibbonLayout();
}

uint64_t sub_773EE0()
{
  return BreakoutDetailsLayout.measurements(fitting:in:)();
}

uint64_t sub_773EF0()
{
  return BreakoutDetailsLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_773F00()
{
  return type metadata accessor for BreakoutDetailsLayout.DetailDimension();
}

uint64_t sub_773F10()
{
  return BreakoutDetailsLayout.Metrics.init(titleSpace:titleBehavior:descriptionSpace:badgeTextSpace:badgeWordmarkSpace:callToActionSpace:layoutMargins:)();
}

uint64_t sub_773F20()
{
  return BreakoutDetailsLayout.Metrics.TitleTextBehavior.CompressionBehavior.init(lineCountThreshold:standardUseCase:compressedUseCase:)();
}

uint64_t sub_773F30()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics.TitleTextBehavior.CompressionBehavior();
}

uint64_t sub_773F40()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics.TitleTextBehavior();
}

uint64_t sub_773F50()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics();
}

uint64_t sub_773F60()
{
  return BreakoutDetailsLayout.init(metrics:titleLabel:descriptionLabel:badgeText:badgeWordmark:callToActionButton:)();
}

uint64_t sub_773F70()
{
  return type metadata accessor for BreakoutDetailsLayout();
}

uint64_t sub_773F80()
{
  return CommerceDialogHandler.presentingViewController.getter();
}

uint64_t sub_773F90()
{
  return CommerceDialogHandler.isActive.setter();
}

uint64_t sub_773FA0()
{
  return type metadata accessor for CommerceDialogHandler();
}

uint64_t sub_773FB0()
{
  return CommerceDialogHandler.init(_:_:)();
}

uint64_t sub_773FC0()
{
  return type metadata accessor for DiffablePagePresenter.UpdatePhase();
}

uint64_t sub_773FD0()
{
  return dispatch thunk of DiffablePagePresenter.viewDidLoad()();
}

uint64_t sub_773FE0()
{
  return dispatch thunk of DiffablePagePresenter.viewDidAppear()();
}

uint64_t sub_773FF0()
{
  return dispatch thunk of DiffablePagePresenter.viewWillAppear()();
}

uint64_t sub_774000()
{
  return dispatch thunk of DiffablePagePresenter.onApplySnapshot.getter();
}

uint64_t sub_774010()
{
  return DiffablePagePresenter.onPerformAction.getter();
}

uint64_t sub_774020()
{
  return dispatch thunk of DiffablePagePresenter.paginationState.getter();
}

uint64_t sub_774030()
{
  return dispatch thunk of DiffablePagePresenter.viewDidDisappear()();
}

uint64_t sub_774040()
{
  return dispatch thunk of DiffablePagePresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_774050()
{
  return dispatch thunk of DiffablePagePresenter.appExitedWhileAppeared()();
}

uint64_t sub_774060()
{
  return dispatch thunk of DiffablePagePresenter.appEnteredWhileAppeared()();
}

uint64_t sub_774070()
{
  return DiffablePagePresenter.onPaginationStateChanged.getter();
}

uint64_t sub_774080()
{
  return dispatch thunk of DiffablePagePresenter.viewWillBecomeFullyVisible()();
}

uint64_t sub_774090()
{
  return dispatch thunk of DiffablePagePresenter.viewWillBecomePartiallyVisible()();
}

uint64_t sub_7740A0()
{
  return DiffablePagePresenter.pageUrl.getter();
}

uint64_t sub_7740B0()
{
  return EditorialSearchResult.clickAction.getter();
}

uint64_t sub_7740C0()
{
  return EditorialSearchResult.iconArtwork.getter();
}

uint64_t sub_7740D0()
{
  return EditorialSearchResult.editorialVideo.getter();
}

uint64_t sub_7740E0()
{
  return EditorialSearchResult.artworkGridType.getter();
}

uint64_t sub_7740F0()
{
  return dispatch thunk of EditorialSearchResult.typeDisplayText.getter();
}

uint64_t sub_774100()
{
  return EditorialSearchResult.editorialArtwork.getter();
}

uint64_t sub_774110()
{
  return EditorialSearchResult.collectionAdamIds.getter();
}

uint64_t sub_774120()
{
  return EditorialSearchResult.mediaOverlayStyle.getter();
}

uint64_t sub_774130()
{
  return EditorialSearchResult.appEventFormattedDates.getter();
}

uint64_t sub_774140()
{
  return EditorialSearchResult.type.getter();
}

uint64_t sub_774150()
{
  return EditorialSearchResult.title.getter();
}

uint64_t sub_774160()
{
  return EditorialSearchResult.subtitle.getter();
}

uint64_t sub_774170()
{
  return EditorialSearchResult.tintColor.getter();
}

uint64_t sub_774180()
{
  return type metadata accessor for EditorialSearchResult();
}

uint64_t sub_774190()
{
  return type metadata accessor for FlowAnimationBehavior();
}

uint64_t sub_7741A0()
{
  return dispatch thunk of FlowPreviewActionable.flowPreviewActionsConfiguration.getter();
}

uint64_t sub_7741B0()
{
  return GuidedSearchPresenter.didToggleToken(at:actionHandler:)();
}

uint64_t sub_7741C0()
{
  return GuidedSearchPresenter.onTokensDidChange.getter();
}

uint64_t sub_7741D0()
{
  return GuidedSearchPresenter.init()();
}

uint64_t sub_7741E0()
{
  return type metadata accessor for GuidedSearchPresenter();
}

uint64_t sub_7741F0()
{
  return HttpTemplateParameter.isRequired.getter();
}

uint64_t sub_774200()
{
  return HttpTemplateParameter.maximumLength.getter();
}

uint64_t sub_774210()
{
  return HttpTemplateParameter.key.getter();
}

uint64_t sub_774220()
{
  return HttpTemplateParameter.title.getter();
}

uint64_t sub_774230()
{
  return type metadata accessor for HttpTemplateParameter.InputType();
}

uint64_t sub_774240()
{
  return HttpTemplateParameter.inputType.getter();
}

uint64_t sub_774250()
{
  return type metadata accessor for HttpTemplateParameter();
}

uint64_t sub_774260()
{
  return ImpressionableArtwork.impressionMetrics.getter();
}

uint64_t sub_774270()
{
  return ImpressionableArtwork.art.getter();
}

uint64_t sub_774280()
{
  return dispatch thunk of ImpressionableArtwork.artwork.getter();
}

uint64_t sub_774290()
{
  return ImpressionsCalculator.childCalculator(for:viewBounds:)();
}

uint64_t sub_7742A0()
{
  return ImpressionsCalculator.makeChildCalculator(for:)();
}

uint64_t sub_7742B0()
{
  return ImpressionsCalculator.addElement(_:at:)();
}

uint64_t sub_7742C0()
{
  return ImpressionsCalculator.viewBounds.setter();
}

uint64_t sub_7742D0()
{
  return ImpressionsCalculator.removeElement(_:)();
}

void sub_7742E0()
{
}

uint64_t sub_7742F0()
{
  return ImpressionsCalculator.init(impressionableThreshold:tracker:)();
}

uint64_t sub_774300()
{
  return ImpressionsCalculator.increaseImpressionableFrame(forElement:by:isContainer:)();
}

uint64_t sub_774310()
{
  return ImpressionsCalculator.isVisible.setter();
}

uint64_t sub_774320()
{
  return type metadata accessor for ImpressionsCalculator();
}

uint64_t sub_774330()
{
  return OverlayViewController.init(overlayView:)();
}

uint64_t sub_774340()
{
  return type metadata accessor for OverlayViewController();
}

uint64_t sub_774350()
{
  return PrivacyCategoryLayout.measurements(fitting:in:)();
}

uint64_t sub_774360()
{
  return PrivacyCategoryLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_774370()
{
  return PrivacyCategoryLayout.Metrics.titleTopSpace.setter();
}

uint64_t sub_774380()
{
  return PrivacyCategoryLayout.Metrics.init(textLeadingMargin:titleTopSpace:iconHorizontalCenterMargin:iconSize:dataTypesTopSpace:dataTypesBottomSpace:bottomMargin:)();
}

uint64_t sub_774390()
{
  return PrivacyCategoryLayout.Metrics.iconSize.getter();
}

uint64_t sub_7743A0()
{
  return PrivacyCategoryLayout.Metrics.iconSize.setter();
}

uint64_t sub_7743B0()
{
  return type metadata accessor for PrivacyCategoryLayout.Metrics();
}

uint64_t sub_7743C0()
{
  return PrivacyCategoryLayout.init(metrics:iconView:titleLabel:dataTypesLabel:)();
}

uint64_t sub_7743D0()
{
  return type metadata accessor for PrivacyCategoryLayout();
}

uint64_t sub_7743E0()
{
  return ProgressConfiguration.init(metrics:progress:alignment:theme:isInstalling:)();
}

uint64_t sub_7743F0()
{
  return type metadata accessor for ProgressConfiguration();
}

uint64_t sub_774400()
{
  return static ReviewComposerUtility.lockupStyle(from:)();
}

uint64_t sub_774410()
{
  return ShelfBasedProductPage.fullProductFetchedAction.getter();
}

uint64_t sub_774420()
{
  return type metadata accessor for ShelfBasedProductPage();
}

uint64_t sub_774430()
{
  return type metadata accessor for SmallGameCenterPlayer();
}

uint64_t sub_774440()
{
  return SponsoredSearchAdvert.init(instanceId:adamId:assetInformation:adData:cppIds:serverCppId:selectedCppId:appBinaryTraits:)();
}

uint64_t sub_774450()
{
  return SponsoredSearchAdvert.instanceId.getter();
}

uint64_t sub_774460()
{
  return SponsoredSearchAdvert.serverCppId.getter();
}

uint64_t sub_774470()
{
  return SponsoredSearchAdvert.selectedCppId.getter();
}

uint64_t sub_774480()
{
  return SponsoredSearchAdvert.appBinaryTraits.getter();
}

uint64_t sub_774490()
{
  return SponsoredSearchAdvert.adData.getter();
}

uint64_t sub_7744A0()
{
  return SponsoredSearchAdvert.adamId.getter();
}

uint64_t sub_7744B0()
{
  return SponsoredSearchAdvert.cppIds.getter();
}

uint64_t sub_7744C0()
{
  return type metadata accessor for SponsoredSearchAdvert();
}

uint64_t sub_7744D0()
{
  return static StringCharacteristics.accentedCharacters.getter();
}

uint64_t sub_7744E0()
{
  return static StringCharacteristics.extraTallCharacters.getter();
}

uint64_t sub_7744F0()
{
  return static StringCharacteristics.legacyExtraTallCharacters.getter();
}

uint64_t sub_774500()
{
  return static StringCharacteristics.longWords.getter();
}

uint64_t sub_774510()
{
  return type metadata accessor for StringCharacteristics();
}

uint64_t sub_774520()
{
  return TitleEffectFilterType.compositingFilter.getter();
}

uint64_t sub_774530()
{
  return type metadata accessor for TitleEffectFilterType();
}

uint64_t sub_774540()
{
  return static TitledParagraphLayout.isMultiColumn(compatibleWith:)();
}

uint64_t sub_774550()
{
  return TitledParagraphLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_774560()
{
  return TitledParagraphLayout.Metrics.columnWidth.setter();
}

uint64_t sub_774570()
{
  return TitledParagraphLayout.Metrics.columnMargin.setter();
}

uint64_t sub_774580()
{
  return TitledParagraphLayout.Metrics.init(textSpace:bodyTopSpace:columnWidth:columnMargin:)();
}

uint64_t sub_774590()
{
  return type metadata accessor for TitledParagraphLayout.Metrics();
}

uint64_t sub_7745A0()
{
  return TitledParagraphLayout.init(metrics:allowsMultiColumn:primaryText:secondaryText:bodyText:)();
}

uint64_t sub_7745B0()
{
  return type metadata accessor for TitledParagraphLayout();
}

uint64_t sub_7745C0()
{
  return static AnnotationImagesLayout.measurements(for:fitting:metrics:in:)();
}

uint64_t sub_7745D0()
{
  return AnnotationImagesLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7745E0()
{
  return AnnotationImagesLayout.init(views:metrics:)();
}

uint64_t sub_7745F0()
{
  return AnnotationImagesLayout.Metrics.artworkSize.getter();
}

uint64_t sub_774600()
{
  return AnnotationImagesLayout.Metrics.init(horizontalSpacing:verticalSpacing:artworkSize:)();
}

uint64_t sub_774610()
{
  return type metadata accessor for AnnotationImagesLayout.Metrics();
}

uint64_t sub_774620()
{
  return type metadata accessor for AnnotationImagesLayout();
}

uint64_t sub_774630()
{
  return ArcadeDownloadPackCard.numberOfPlaceholders.getter();
}

uint64_t sub_774640()
{
  return ArcadeDownloadPackCard.lockups.getter();
}

uint64_t sub_774650()
{
  return type metadata accessor for ArcadeDownloadPackCard();
}

uint64_t sub_774660()
{
  return dispatch thunk of CellWithManagedArtwork.fetch(for:on:asPartOf:)();
}

uint64_t sub_774670()
{
  return static ComponentLayoutBuilder.verticalLayoutHorizontalSubgroups(for:withItemHeights:useEstimatedHeights:in:itemSupplementaryProvider:asPartOf:)();
}

uint64_t sub_774680()
{
  return static ComponentLayoutBuilder.verticalLayoutGroup(for:withItemHeights:in:itemSupplementaryProvider:asPartOf:)();
}

uint64_t sub_774690()
{
  return static ComponentLayoutBuilder.columnGroup(separatedBy:itemHeight:groupWidth:rowCount:)();
}

uint64_t sub_7746A0()
{
  return static ComponentLayoutOptions.overflowed.getter();
}

uint64_t sub_7746B0()
{
  return static ComponentLayoutOptions.hasBackground.getter();
}

uint64_t sub_7746C0()
{
  return static ComponentLayoutOptions.isFirstSection.getter();
}

uint64_t sub_7746D0()
{
  return static ComponentLayoutOptions.separatorHidden.getter();
}

uint64_t sub_7746E0()
{
  return static ComponentLayoutOptions.fixedHeightContainer.getter();
}

uint64_t sub_7746F0()
{
  return static ComponentLayoutOptions.showSupplementaryText.getter();
}

uint64_t sub_774700()
{
  return static ComponentLayoutOptions.isSingleVerticalColumn.getter();
}

uint64_t sub_774710()
{
  return ComponentLayoutOptions.init()();
}

uint64_t sub_774720()
{
  return type metadata accessor for ComponentLayoutOptions();
}

uint64_t sub_774730()
{
  return dispatch thunk of CompoundScrollObserver.didScroll(orthogonalScrollView:in:)();
}

uint64_t sub_774740()
{
  return dispatch thunk of CompoundScrollObserver.didScroll(in:)();
}

uint64_t sub_774750()
{
  return CompoundScrollObserver.removeChild(_:)();
}

uint64_t sub_774760()
{
  return CompoundScrollObserver.addChild(_:)();
}

uint64_t sub_774770()
{
  return CompoundScrollObserver.init(children:)();
}

uint64_t sub_774780()
{
  return type metadata accessor for CompoundScrollObserver();
}

uint64_t sub_774790()
{
  return EngagementToggleAction.identifier.getter();
}

uint64_t sub_7747A0()
{
  return EngagementToggleAction.value.getter();
}

uint64_t sub_7747B0()
{
  return type metadata accessor for EngagementToggleAction();
}

uint64_t sub_7747C0()
{
  return FamilyCircleLookupTask.perform()();
}

uint64_t sub_7747D0()
{
  return FamilyCircleLookupTask.init()();
}

uint64_t sub_7747E0()
{
  return type metadata accessor for FamilyCircleLookupTask();
}

uint64_t sub_7747F0()
{
  return type metadata accessor for FamilyPurchasesSection();
}

uint64_t sub_774800()
{
  return FlowPreviewDestination.init(flowAction:sender:contentType:)();
}

uint64_t sub_774810()
{
  return FlowPreviewDestination.flowAction.getter();
}

uint64_t sub_774820()
{
  return type metadata accessor for FlowPreviewDestination.ContentType();
}

uint64_t sub_774830()
{
  return FlowPreviewDestination.contentType.getter();
}

uint64_t sub_774840()
{
  return FlowPreviewDestination.sender.getter();
}

uint64_t sub_774850()
{
  return type metadata accessor for FlowPreviewDestination();
}

uint64_t sub_774860()
{
  return GameCenterReengagement.badgeGlyph.getter();
}

uint64_t sub_774870()
{
  return dispatch thunk of GameCenterReengagement.heroAction.getter();
}

uint64_t sub_774880()
{
  return GameCenterReengagement.achievement.getter();
}

uint64_t sub_774890()
{
  return dispatch thunk of GameCenterReengagement.clickAction.getter();
}

uint64_t sub_7748A0()
{
  return GameCenterReengagement.backgroundColor.getter();
}

uint64_t sub_7748B0()
{
  return GameCenterReengagement.backgroundArtwork.getter();
}

uint64_t sub_7748C0()
{
  return GameCenterReengagement.badge.getter();
}

uint64_t sub_7748D0()
{
  return GameCenterReengagement.title.getter();
}

uint64_t sub_7748E0()
{
  return GameCenterReengagement.lockup.getter();
}

uint64_t sub_7748F0()
{
  return GameCenterReengagement.subtitle.getter();
}

uint64_t sub_774900()
{
  return type metadata accessor for GameCenterReengagement();
}

uint64_t sub_774910()
{
  return InfiniteScrollObserver.init(paginatedPresenter:triggerDistance:)();
}

uint64_t sub_774920()
{
  return type metadata accessor for MediaClickMetricsEvent.ActionType();
}

uint64_t sub_774930()
{
  return type metadata accessor for MediaClickMetricsEvent.TargetType();
}

uint64_t sub_774940()
{
  return type metadata accessor for MediaClickMetricsEvent.ActionContext();
}

uint64_t sub_774950()
{
  return static MediaClickMetricsEvent.fillIn(template:targetType:targetId:actionType:actionContext:position:)();
}

uint64_t sub_774960()
{
  return type metadata accessor for MediaClickMetricsEvent.TargetId();
}

uint64_t sub_774970()
{
  return type metadata accessor for MetadataRibbonItemType();
}

uint64_t sub_774980()
{
  return dispatch thunk of static MetadataRibbonItemView.measurements(for:fitting:in:)();
}

uint64_t sub_774990()
{
  return dispatch thunk of MetadataRibbonItemView.labelMaxWidth.setter();
}

uint64_t sub_7749A0()
{
  return dispatch thunk of MetadataRibbonItemView.layoutContext.getter();
}

uint64_t sub_7749B0()
{
  return dispatch thunk of MetadataRibbonItemView.allowsTruncation.setter();
}

uint64_t sub_7749C0()
{
  return dispatch thunk of static MetadataRibbonItemView.isBaselineAligned.getter();
}

uint64_t sub_7749D0()
{
  return dispatch thunk of MetadataRibbonItemView.searchLayoutContext.getter();
}

uint64_t sub_7749E0()
{
  return dispatch thunk of MetadataRibbonItemView.truncationLegibilityThreshold.setter();
}

uint64_t sub_7749F0()
{
  return dispatch thunk of MetadataRibbonItemView.id.setter();
}

uint64_t sub_774A00()
{
  return dispatch thunk of static MetadataRibbonItemView.shouldForceIntrinsicSizeDuringLayout.getter();
}

uint64_t sub_774A10()
{
  return dispatch thunk of MetadataRibbonItemView.apply(_:asPartOf:)();
}

uint64_t sub_774A20()
{
  return dispatch thunk of MetadataRibbonItemView.itemType.setter();
}

uint64_t sub_774A30()
{
  return MetadataRibbonItemView.layoutContext.getter();
}

uint64_t sub_774A40()
{
  return static MetadataRibbonItemView.isBaselineAligned.getter();
}

uint64_t sub_774A50()
{
  return MetadataRibbonItemView.searchLayoutContext.getter();
}

uint64_t sub_774A70()
{
  return MetadataRibbonItemView.labelText.getter();
}

uint64_t sub_774A80()
{
  return dispatch thunk of MetricsReportableError.describeForMetricsEvent(using:)();
}

uint64_t sub_774A90()
{
  return dispatch thunk of MetricsReportableError.metricsErrorDescription.getter();
}

uint64_t sub_774AA0()
{
  return type metadata accessor for MixedMediaLockupLayout.LockupPosition();
}

uint64_t sub_774AB0()
{
  return MixedMediaLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_774AC0()
{
  return MixedMediaLockupLayout.Metrics.init(lockupPosition:taglineNumberOfLines:taglineSpace:taglineFont:alwaysIncludeTaglineSpace:verticalSpacing:layoutMargins:)();
}

uint64_t sub_774AD0()
{
  return MixedMediaLockupLayout.Metrics.alwaysIncludeTaglineSpace.getter();
}

uint64_t sub_774AE0()
{
  return type metadata accessor for MixedMediaLockupLayout.Metrics();
}

uint64_t sub_774AF0()
{
  return MixedMediaLockupLayout.init(metrics:lockupView:media:tagline:)();
}

uint64_t sub_774B00()
{
  return type metadata accessor for MixedMediaLockupLayout();
}

uint64_t sub_774B10()
{
  return dispatch thunk of OfferDisplayProperties.newOfferDisplayPropertiesChanging(titles:titleSymbolNames:subtitles:style:environment:tint:isDeletableSystemApp:isFree:isPreorder:offerLabelStyle:hasDiscount:contentRating:offerToken:subscriptionFamilyId:overrideLocale:useAdsLocale:priceFormatted:isStreamlinedBuy:appCapabilities:)();
}

uint64_t sub_774B20()
{
  return OfferDisplayProperties.isArcadeOffer.getter();
}

uint64_t sub_774B30()
{
  return OfferDisplayProperties.environment.getter();
}

uint64_t sub_774B40()
{
  return OfferDisplayProperties.offerLabelStyle.getter();
}

uint64_t sub_774B50()
{
  return OfferDisplayProperties.isStreamlinedBuy.getter();
}

uint64_t sub_774B60()
{
  return OfferDisplayProperties.subscriptionFamilyId.getter();
}

uint64_t sub_774B70()
{
  return OfferDisplayProperties.style.getter();
}

uint64_t sub_774B80()
{
  return OfferDisplayProperties.adamId.getter();
}

uint64_t sub_774B90()
{
  return OfferDisplayProperties.offerType.getter();
}

uint64_t sub_774BA0()
{
  return OfferDisplayProperties.subtitles.getter();
}

uint64_t sub_774BB0()
{
  return static PageRenderMetricsEvent.lastInteractionTime.setter();
}

uint64_t sub_774BC0()
{
  return type metadata accessor for PageRenderMetricsEvent();
}

uint64_t sub_774BD0()
{
  return type metadata accessor for PlaybackScrollObserver();
}

uint64_t sub_774BE0()
{
  return PlaybackScrollObserver.init(_:)();
}

uint64_t sub_774BF0()
{
  return ProductOfferButtonMode.isDisabled.getter();
}

uint64_t sub_774C00()
{
  return ProductOfferButtonMode.isHidden.getter();
}

uint64_t sub_774C10()
{
  return ProductReviewsMetadata.hasReviewSummary.getter();
}

uint64_t sub_774C20()
{
  return ProductReviewsMetadata.reviewSummaryTitle.getter();
}

uint64_t sub_774C30()
{
  return type metadata accessor for ProductReviewsMetadata();
}

uint64_t sub_774C40()
{
  return ReviewsContainerLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_774C50()
{
  return ReviewsContainerLayout.Metrics.columnSpacer.setter();
}

uint64_t sub_774C60()
{
  return ReviewsContainerLayout.Metrics.marginInsets.setter();
}

uint64_t sub_774C70()
{
  return ReviewsContainerLayout.Metrics.init(ratingsBottomSpace:tapToRateTopSpace:tapToRateBottomSpace:reviewSummaryBottomSpace:reviewsShelfTopSpace:editorsChoiceTopSpace:columnSpacer:marginInsets:bottomEdgeSpace:)();
}

uint64_t sub_774C80()
{
  return type metadata accessor for ReviewsContainerLayout.Metrics();
}

uint64_t sub_774C90()
{
  return ReviewsContainerLayout.init(metrics:ratingsView:tapToRateView:actionsView:reviewSummaryView:reviewsShelf:editorsChoiceView:ratingsSeparatorView:)();
}

uint64_t sub_774CA0()
{
  return type metadata accessor for ReviewsContainerLayout();
}

uint64_t sub_774CB0()
{
  return SearchActionCalculator.searchAction(modifying:with:)();
}

uint64_t sub_774CC0()
{
  return SearchActionCalculator.searchAction(modifying:with:)();
}

uint64_t sub_774CD0()
{
  return SearchActionCalculator.init(optimizationTermProviding:)();
}

uint64_t sub_774CE0()
{
  return type metadata accessor for SearchActionCalculator();
}

uint64_t sub_774CF0()
{
  return SearchLockupListLayout.Metrics.init(headingLeadingSpace:titleLeadingSpace:lockupCollectionViewTopSpace:layoutMargins:)();
}

uint64_t sub_774D00()
{
  return type metadata accessor for SearchLockupListLayout.Metrics();
}

uint64_t sub_774D10()
{
  return SearchLockupListLayout.init(metrics:iconHeadingView:titleHeadingView:lockupCollectionView:)();
}

uint64_t sub_774D20()
{
  return type metadata accessor for SearchLockupListLayout();
}

uint64_t sub_774D30()
{
  return dispatch thunk of SearchResultsPresenter.isCondensedSearchLockupsEnabled.getter();
}

uint64_t sub_774D40()
{
  return dispatch thunk of SearchResultsPresenter.shouldDisplayAppEvent(for:)();
}

uint64_t sub_774D50()
{
  return dispatch thunk of SearchResultsPresenter.didSelectResult(at:)();
}

uint64_t sub_774D60()
{
  return dispatch thunk of SearchResultsPresenter.transparencyLink.getter();
}

uint64_t sub_774D70()
{
  return dispatch thunk of SearchResultsPresenter.transparencyLinkIndex(columnCount:)();
}

uint64_t sub_774D80()
{
  return dispatch thunk of SearchResultsPresenter.shouldResultHaveCondensedAppearance(at:in:)();
}

uint64_t sub_774D90()
{
  return dispatch thunk of SearchResultsPresenter.result(at:)();
}

uint64_t sub_774DA0()
{
  return SponsoredSearchOrganic.assetInformation.getter();
}

uint64_t sub_774DB0()
{
  return SponsoredSearchOrganic.adamId.getter();
}

uint64_t sub_774DC0()
{
  return type metadata accessor for SponsoredSearchOrganic();
}

uint64_t sub_774DD0()
{
  return TextConfigurationTheme.init(from:)();
}

uint64_t sub_774DE0()
{
  return static TextConfigurationTheme.disabled.getter();
}

uint64_t sub_774DF0()
{
  return type metadata accessor for TextConfigurationTheme();
}

uint64_t sub_774E00()
{
  return TodayCardActionOverlay.action.getter();
}

uint64_t sub_774E10()
{
  return type metadata accessor for TodayCardActionOverlay();
}

uint64_t sub_774E20()
{
  return TodayCardArtworkLayout.expandedLayoutInsets.getter();
}

uint64_t sub_774E30()
{
  return TodayCardArtworkLayout.collapsedLayoutInsets.getter();
}

uint64_t sub_774E40()
{
  return TodayCardArtworkLayout.expandedContentMode.getter();
}

uint64_t sub_774E50()
{
  return TodayCardArtworkLayout.collapsedContentMode.getter();
}

uint64_t sub_774E60()
{
  return type metadata accessor for TodayCardArtworkLayout();
}

uint64_t sub_774E70()
{
  return TodayCardLockupOverlay.displaysIcon.getter();
}

uint64_t sub_774E80()
{
  return TodayCardLockupOverlay.lockup.getter();
}

uint64_t sub_774E90()
{
  return type metadata accessor for TodayCardLockupOverlay();
}

uint64_t sub_774EA0()
{
  return AutoScrollConfiguration.init(isAutoScrollEnabled:autoScrollInterval:autoScrollRestartDelay:)();
}

uint64_t sub_774EB0()
{
  return AutoScrollConfiguration.isAutoScrollEnabled.getter();
}

uint64_t sub_774EC0()
{
  return AutoScrollConfiguration.autoScrollRestartDelay.getter();
}

uint64_t sub_774ED0()
{
  return AutoScrollConfiguration.autoScrollInterval.getter();
}

uint64_t sub_774EE0()
{
  return type metadata accessor for AutoScrollConfiguration();
}

uint64_t sub_774EF0()
{
  return type metadata accessor for BadgeCaptionCappingType();
}

uint64_t sub_774F00()
{
  return type metadata accessor for BadgeValueViewAlignment();
}

uint64_t sub_774F10()
{
  return dispatch thunk of ComponentModelContainer.children.getter();
}

uint64_t sub_774F20()
{
  return ComponentPrefetchSizing.contentMode.getter();
}

uint64_t sub_774F30()
{
  return ComponentPrefetchSizing.init(size:contentMode:)();
}

uint64_t sub_774F40()
{
  return ComponentPrefetchSizing.size.getter();
}

uint64_t sub_774F50()
{
  return type metadata accessor for ComponentPrefetchSizing();
}

uint64_t sub_774F60()
{
  return CrossfireReferralAction.referrerData.getter();
}

uint64_t sub_774F70()
{
  return type metadata accessor for CrossfireReferralAction();
}

uint64_t sub_774F80()
{
  return EditorialDisplayOptions.suppressLockup.getter();
}

uint64_t sub_774F90()
{
  return EditorialDisplayOptions.suppressTagline.getter();
}

uint64_t sub_774FA0()
{
  return EditorialDisplayOptions.useMaterialBlur.getter();
}

uint64_t sub_774FB0()
{
  return EditorialDisplayOptions.showBadgeInSmallCards.getter();
}

uint64_t sub_774FC0()
{
  return type metadata accessor for EditorialDisplayOptions();
}

uint64_t sub_774FD0()
{
  return FlowPresentationContext.presentationStyle.getter();
}

uint64_t sub_774FE0()
{
  return type metadata accessor for FlowPresentationContext();
}

uint64_t sub_774FF0()
{
  return HeroCarouselItemOverlay.OverlayType.displaysModuleGradient.getter();
}

uint64_t sub_775000()
{
  return type metadata accessor for HeroCarouselItemOverlay.OverlayType();
}

uint64_t sub_775010()
{
  return HeroCarouselItemOverlay.clickAction.getter();
}

uint64_t sub_775020()
{
  return HeroCarouselItemOverlay.overlayType.getter();
}

uint64_t sub_775030()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextAlignment.verticalStackAlignment.getter();
}

uint64_t sub_775040()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextAlignment.textAlignment(with:)();
}

uint64_t sub_775050()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.TextAlignment();
}

uint64_t sub_775060()
{
  return HeroCarouselItemOverlay.DisplayOptions.init(textAlignment:horizontalPlacement:textColorOverrides:isOverDarkContent:)();
}

uint64_t sub_775070()
{
  return HeroCarouselItemOverlay.DisplayOptions.textAlignment.getter();
}

uint64_t sub_775080()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.descriptionColor.getter();
}

uint64_t sub_775090()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.callToActionColor.getter();
}

uint64_t sub_7750A0()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.badgeColor.getter();
}

uint64_t sub_7750B0()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.titleColor.getter();
}

uint64_t sub_7750C0()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.init()();
}

uint64_t sub_7750D0()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides();
}

uint64_t sub_7750E0()
{
  return HeroCarouselItemOverlay.DisplayOptions.textColorOverrides.getter();
}

uint64_t sub_7750F0()
{
  return HeroCarouselItemOverlay.DisplayOptions.horizontalPlacement.getter();
}

uint64_t sub_775100()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.textAlignment(with:)();
}

uint64_t sub_775110()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.verticalStackAlignment.getter();
}

uint64_t sub_775120()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.value(with:)();
}

uint64_t sub_775130()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement();
}

uint64_t sub_775140()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions();
}

uint64_t sub_775150()
{
  return HeroCarouselItemOverlay.displayOptions.getter();
}

uint64_t sub_775160()
{
  return HeroCarouselItemOverlay.collectionIcons.getter();
}

uint64_t sub_775170()
{
  return HeroCarouselItemOverlay.descriptionText.getter();
}

uint64_t sub_775180()
{
  return HeroCarouselItemOverlay.callToActionText.getter();
}

uint64_t sub_775190()
{
  return HeroCarouselItemOverlay.impressionMetrics.getter();
}

uint64_t sub_7751A0()
{
  return HeroCarouselItemOverlay.lockup.getter();
}

uint64_t sub_7751B0()
{
  return HeroCarouselItemOverlay.badgeText.getter();
}

uint64_t sub_7751C0()
{
  return HeroCarouselItemOverlay.titleText.getter();
}

uint64_t sub_7751D0()
{
  return dispatch thunk of ItemBackgroundProviding.itemBackground.getter();
}

uint64_t sub_7751E0()
{
  return LargeHeroBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7751F0()
{
  return type metadata accessor for LargeHeroBreakoutLayout.DetailsVerticalPostion();
}

uint64_t sub_775200()
{
  return LargeHeroBreakoutLayout.Metrics.init(headerSpace:headerMaxWidth:detailPosition:detailsWidth:detailsVerticalPostion:layoutMargins:height:)();
}

uint64_t sub_775210()
{
  return type metadata accessor for LargeHeroBreakoutLayout.Metrics();
}

uint64_t sub_775220()
{
  return LargeHeroBreakoutLayout.init(metrics:backgroundMediaView:headerLabel:detailsView:)();
}

uint64_t sub_775230()
{
  return type metadata accessor for LargeHeroBreakoutLayout();
}

UIFont sub_775240(UITraitCollection compatibleWith)
{
  return MetadataRibbonTextStyle.font(compatibleWith:)(compatibleWith);
}

uint64_t sub_775250()
{
  return static MetadataRibbonTextStyle.useCase(_:)();
}

uint64_t sub_775260()
{
  return type metadata accessor for MetadataRibbonTextStyle();
}

uint64_t sub_775270()
{
  return PrivacyDefinitionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775280()
{
  return PrivacyDefinitionLayout.Metrics.init(titleTopSpace:definitionTopSpace:bottomMargin:maxTextWidth:)();
}

uint64_t sub_775290()
{
  return type metadata accessor for PrivacyDefinitionLayout.Metrics();
}

uint64_t sub_7752A0()
{
  return PrivacyDefinitionLayout.init(metrics:titleLabel:definitionLabel:)();
}

uint64_t sub_7752B0()
{
  return type metadata accessor for PrivacyDefinitionLayout();
}

uint64_t sub_7752C0()
{
  return ProductAnnotationLayout.ItemLayout.measurements(fitting:in:)();
}

uint64_t sub_7752D0()
{
  return ProductAnnotationLayout.ItemLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7752E0()
{
  return ProductAnnotationLayout.ItemLayout.Metrics.init(headingArtworkTopSpace:headingArtworkBottomSpace:textSpacing:listTextTopSpace:horizontalPairTextSpace:)();
}

uint64_t sub_7752F0()
{
  return type metadata accessor for ProductAnnotationLayout.ItemLayout.Metrics();
}

uint64_t sub_775300()
{
  return ProductAnnotationLayout.ItemLayout.init(metrics:headingText:headingArtwork:text:listText:leadingTextPairs:trailingTextPairs:)();
}

uint64_t sub_775310()
{
  return type metadata accessor for ProductAnnotationLayout.ItemLayout();
}

uint64_t sub_775320()
{
  return ProductAnnotationLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775330()
{
  return static ProductAnnotationLayout.isSummaryPlacedBelow(in:)();
}

uint64_t sub_775340()
{
  return ProductAnnotationLayout.Metrics.init(disclosureSize:disclosureContentInsets:disclosureMargin:titleSpace:detailSpace:detailMargin:linkSpace:bottomSpace:horizontalSpacing:shouldDisclosureAlignWithContent:)();
}

uint64_t sub_775350()
{
  return ProductAnnotationLayout.Metrics.disclosureSize.getter();
}

uint64_t sub_775360()
{
  return ProductAnnotationLayout.Metrics.disclosureSize.setter();
}

uint64_t sub_775370()
{
  return ProductAnnotationLayout.Metrics.horizontalSpacing.getter();
}

uint64_t sub_775380()
{
  return type metadata accessor for ProductAnnotationLayout.Metrics();
}

uint64_t sub_775390()
{
  return ProductAnnotationLayout.init(metrics:titleText:summaryText:detailViews:linkText:disclosureView:isExpanded:)();
}

uint64_t sub_7753A0()
{
  return type metadata accessor for ProductAnnotationLayout();
}

uint64_t sub_7753B0()
{
  return ProductCapabilityLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7753C0()
{
  return ProductCapabilityLayout.Metrics.init(iconSize:iconMargin:titleSpace:captionTopSpace:captionBottomSpace:bottomSpace:)();
}

uint64_t sub_7753D0()
{
  return ProductCapabilityLayout.Metrics.iconSize.setter();
}

uint64_t sub_7753E0()
{
  return type metadata accessor for ProductCapabilityLayout.Metrics();
}

uint64_t sub_7753F0()
{
  return ProductCapabilityLayout.init(metrics:iconView:titleText:captionText:)();
}

uint64_t sub_775400()
{
  return type metadata accessor for ProductCapabilityLayout();
}

uint64_t sub_775410()
{
  return RedownloadConfiguration.init(metrics:alignment:theme:)();
}

uint64_t sub_775420()
{
  return type metadata accessor for RedownloadConfiguration();
}

uint64_t sub_775430()
{
  return static RibbonBarItemCellLayout.interItemSpacing.getter();
}

uint64_t sub_775440()
{
  return static RibbonBarItemCellLayout.topPadding.getter();
}

uint64_t sub_775450()
{
  return static RibbonBarItemCellLayout.bottomPadding.getter();
}

uint64_t sub_775460()
{
  return RibbonBarItemCellLayout.Metrics.init(artworkSize:interimSpacing:leadingSpacing:trailingSpacing:artworkBottomSpacing:artworkTopSpacing:labelBottomSpacing:labelTopSpacing:)();
}

uint64_t sub_775470()
{
  return RibbonBarItemCellLayout.Metrics.artworkSize.getter();
}

uint64_t sub_775480()
{
  return RibbonBarItemCellLayout.Metrics.trailingSpacing.getter();
}

uint64_t sub_775490()
{
  return type metadata accessor for RibbonBarItemCellLayout.Metrics();
}

uint64_t sub_7754A0()
{
  return RibbonBarItemCellLayout.init(metrics:artwork:titleLabel:)();
}

uint64_t sub_7754B0()
{
  return type metadata accessor for RibbonBarItemCellLayout();
}

uint64_t sub_7754C0()
{
  return ScreenshotsDisplayStyle.shouldShowScreenshots.getter();
}

uint64_t sub_7754D0()
{
  return type metadata accessor for ScreenshotsDisplayStyle();
}

uint64_t sub_7754E0()
{
  return ShareSheetNotesMetadata.url.getter();
}

uint64_t sub_7754F0()
{
  return ShareSheetNotesMetadata.category.getter();
}

uint64_t sub_775500()
{
  return ShareSheetNotesMetadata.fileSize.getter();
}

uint64_t sub_775510()
{
  return ShareSheetNotesMetadata.itemName.getter();
}

uint64_t sub_775520()
{
  return ShareSheetNotesMetadata.developer.getter();
}

uint64_t sub_775530()
{
  return ShareSheetNotesMetadata.mediaType.getter();
}

uint64_t sub_775540()
{
  return SmallSearchLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775550()
{
  return SmallSearchLockupLayout.Metrics.init(artworkSize:artworkMargin:headingSpace:titleRegularSpace:titleMediumSpace:titleShortSpace:titleWithHeadingSpace:subtitleSpace:tertiaryTitleSpace:offerTextSpace:metadataTextSpace:bottomSpace:offerButtonSize:offerButtonMargin:userRatingRightMargin:editorsChoiceMargin:adButtonRightMargin:descriptionSpace:regularWidthColumnSpacing:descriptionTopMargin:)();
}

uint64_t sub_775560()
{
  return SmallSearchLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_775570()
{
  return SmallSearchLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_775580()
{
  return type metadata accessor for SmallSearchLockupLayout.Metrics();
}

uint64_t sub_775590()
{
  return SmallSearchLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:userRatingView:ratingCountLabel:editorsChoiceView:adButton:description:includesRatings:metadataRibbonView:searchTagsRibbonView:includesMetadataRibbon:includesSearchTagsRibbon:includesMetadataInformationInLockup:)();
}

uint64_t sub_7755A0()
{
  return type metadata accessor for SmallSearchLockupLayout();
}

uint64_t sub_7755B0()
{
  return TitledButtonStackLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7755C0()
{
  return TitledButtonStackLayout.Metrics.init(buttonHeight:horizontalInterItemSpace:verticalInterItemSpace:maximumButtonWidth:)();
}

uint64_t sub_7755D0()
{
  return TitledButtonStackLayout.Metrics.buttonHeight.getter();
}

uint64_t sub_7755E0()
{
  return type metadata accessor for TitledButtonStackLayout.Metrics();
}

uint64_t sub_7755F0()
{
  return TitledButtonStackLayout.init(metrics:items:lineBreaks:)();
}

uint64_t sub_775600()
{
  return type metadata accessor for TitledButtonStackLayout();
}

uint64_t sub_775610()
{
  return static VerticalFlexStackLayout.estimatedChildFitCount(in:metrics:)();
}

uint64_t sub_775620()
{
  return VerticalFlexStackLayout.place(at:with:)();
}

uint64_t sub_775630()
{
  return VerticalFlexStackLayout.Metrics.init(fixedChildHeight:minInterChildSpacing:maxInterChildSpacing:layoutMargins:)();
}

uint64_t sub_775640()
{
  return type metadata accessor for VerticalFlexStackLayout.Metrics();
}

uint64_t sub_775650()
{
  return VerticalFlexStackLayout.init(metrics:children:)();
}

uint64_t sub_775660()
{
  return type metadata accessor for VerticalFlexStackLayout();
}

uint64_t sub_775670()
{
  return tryToCancelArtworkFetch(into:on:asPartOf:deprioritizingFetches:)();
}

uint64_t sub_775680()
{
  return AccessibilityConditional.init(value:ax1To3Value:ax4To5Value:)();
}

uint64_t sub_775690()
{
  return AccessibilityConditional.value(for:)();
}

uint64_t sub_7756A0()
{
  return AccessibilityConditional.value(with:)();
}

uint64_t sub_7756B0()
{
  return AccessibilityConditional.init(value:axValue:)();
}

uint64_t sub_7756C0()
{
  return type metadata accessor for AccessibilityConditional();
}

uint64_t sub_7756D0()
{
  return AchievementSummaryLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7756E0()
{
  return static AchievementSummaryLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_7756F0()
{
  return AchievementSummaryLayout.Metrics.init(achievementStackInsets:outOfTotalLeadingMargin:chevronLeadingMargin:chevronTrailingMargin:componentHeight:)();
}

uint64_t sub_775700()
{
  return AchievementSummaryLayout.Metrics.achievementStackInsets.setter();
}

uint64_t sub_775710()
{
  return type metadata accessor for AchievementSummaryLayout.Metrics();
}

uint64_t sub_775720()
{
  return AchievementSummaryLayout.init(metrics:achievementGroupView:numberCompletedLabel:outOfTotalLabel:completedLabel:chevronView:)();
}

uint64_t sub_775730()
{
  return type metadata accessor for AchievementSummaryLayout();
}

uint64_t sub_775740()
{
  return dispatch thunk of AdvertRotationController.didInteractWithAdvert()();
}

uint64_t sub_775750()
{
  return dispatch thunk of AdvertRotationController.currentAdvert.getter();
}

uint64_t sub_775760()
{
  return dispatch thunk of AdvertRotationController.didApplyCell(_:in:)();
}

uint64_t sub_775770()
{
  return dispatch thunk of AdvertRotationController.didEndDisplaying(_:in:)();
}

uint64_t sub_775780()
{
  return ArcadeSubscribePresenter.init(objectGraph:subscriptionManager:url:sidepack:)();
}

uint64_t sub_775790()
{
  return ArcadeSubscribePresenter.isAskToBuyRequest.getter();
}

uint64_t sub_7757A0()
{
  return ArcadeSubscribePresenter.view.setter();
}

void sub_7757B0()
{
}

uint64_t sub_7757C0()
{
  return type metadata accessor for ArcadeSubscribePresenter();
}

uint64_t sub_7757D0()
{
  return type metadata accessor for ArcadeTrialEnrolledState();
}

void sub_7757E0()
{
}

uint64_t sub_775800()
{
  return dispatch thunk of BaseGenericPagePresenter.uber.getter();
}

uint64_t sub_775810()
{
  return dispatch thunk of BaseGenericPagePresenter.view.setter();
}

uint64_t sub_775820()
{
  return dispatch thunk of BaseGenericPagePresenter.pageTitle.getter();
}

uint64_t sub_775830()
{
  return type metadata accessor for ClearSearchHistoryAction();
}

uint64_t sub_775840()
{
  return type metadata accessor for DirectionalTextAlignment();
}

uint64_t sub_775850()
{
  return EditorialStoryCardLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775860()
{
  return EditorialStoryCardLayout.Metrics.init(headerSpace:titleSpace:descriptionSpace:layoutMargins:)();
}

uint64_t sub_775870()
{
  return type metadata accessor for EditorialStoryCardLayout.Metrics();
}

uint64_t sub_775880()
{
  return EditorialStoryCardLayout.init(metrics:artworkView:headerLabel:titleLabel:descriptionLabel:)();
}

uint64_t sub_775890()
{
  return type metadata accessor for EditorialStoryCardLayout();
}

uint64_t sub_7758A0()
{
  return dispatch thunk of static EstimatedHeightProviding.estimatedHeight(in:asPartOf:)();
}

uint64_t sub_7758B0()
{
  return type metadata accessor for FamilyCircleLookupResult();
}

uint64_t sub_7758C0()
{
  return dispatch thunk of FamilyPurchasesPresenter.familyPurchasesSection(for:)();
}

uint64_t sub_7758D0()
{
  return dispatch thunk of FamilyPurchasesPresenter.imageForFamilyMember(at:)();
}

uint64_t sub_7758E0()
{
  return FamilyPurchasesPresenter.init(objectGraph:familyPurchasesError:iCloudMemberAppleId:bag:)();
}

uint64_t sub_7758F0()
{
  return dispatch thunk of FamilyPurchasesPresenter.numberOfRows(in:)();
}

uint64_t sub_775900()
{
  return dispatch thunk of FamilyPurchasesPresenter.didSelectItem(at:)();
}

uint64_t sub_775910()
{
  return dispatch thunk of FamilyPurchasesPresenter.numberOfSections.getter();
}

uint64_t sub_775920()
{
  return dispatch thunk of FamilyPurchasesPresenter.errorBannerLinkableText.getter();
}

uint64_t sub_775930()
{
  return dispatch thunk of FamilyPurchasesPresenter.view.setter();
}

uint64_t sub_775940()
{
  return dispatch thunk of FamilyPurchasesPresenter.title(forSection:)();
}

uint64_t sub_775950()
{
  return dispatch thunk of FamilyPurchasesPresenter.title(forItemAt:)();
}

uint64_t sub_775960()
{
  return dispatch thunk of FamilyPurchasesPresenter.pageTitle.getter();
}

uint64_t sub_775970()
{
  return type metadata accessor for FamilyPurchasesPresenter();
}

uint64_t sub_775980()
{
  return dispatch thunk of FlowPreviewablePresenter.actionPresenterView.getter();
}

uint64_t sub_775990()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewBackgroundColor(at:)();
}

uint64_t sub_7759A0()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewDestinationForItem(at:)();
}

uint64_t sub_7759B0()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewActionsConfiguration(at:sender:)();
}

uint64_t sub_7759C0()
{
  return MSODiffablePagePresenter.init(objectGraph:personalizationProvider:pageUrl:context:)();
}

uint64_t sub_7759D0()
{
  return type metadata accessor for MSODiffablePagePresenter();
}

uint64_t sub_7759E0()
{
  return MarketingItemRequestInfo.offerHints.getter();
}

uint64_t sub_7759F0()
{
  return MarketingItemRequestInfo.serviceType.getter();
}

uint64_t sub_775A00()
{
  return MarketingItemRequestInfo.clientOptions.getter();
}

uint64_t sub_775A10()
{
  return MarketingItemRequestInfo.metricsOverlay.getter();
}

uint64_t sub_775A20()
{
  return MarketingItemRequestInfo.onDismissalAction.getter();
}

uint64_t sub_775A30()
{
  return MarketingItemRequestInfo.purchaseFailureAction.getter();
}

uint64_t sub_775A40()
{
  return MarketingItemRequestInfo.purchaseSuccessAction.getter();
}

uint64_t sub_775A50()
{
  return MarketingItemRequestInfo.carrierLinkFailureAction.getter();
}

uint64_t sub_775A60()
{
  return MarketingItemRequestInfo.carrierLinkSuccessAction.getter();
}

uint64_t sub_775A70()
{
  return MarketingItemRequestInfo.seed.getter();
}

uint64_t sub_775A80()
{
  return MarketingItemRequestInfo.placement.getter();
}

uint64_t sub_775A90()
{
  return type metadata accessor for MarketingItemRequestInfo();
}

uint64_t sub_775AA0()
{
  return MetadataRibbonViewLayout.init(metadataRibbonItemLayoutContexts:metrics:)();
}

uint64_t sub_775AB0()
{
  return MetadataRibbonViewLayout.measurements(fitting:in:)();
}

uint64_t sub_775AC0()
{
  return MetadataRibbonViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775AD0()
{
  return MetadataRibbonViewLayout.Metrics.maximumNumberOfItems.getter();
}

uint64_t _s18ASMessagesProvider18MetadataRibbonViewC7metrics19AppStoreKitInternal0cdE6LayoutV7MetricsVvpfi_0()
{
  return static MetadataRibbonViewLayout.Metrics.standard.getter();
}

uint64_t sub_775AF0()
{
  return type metadata accessor for MetadataRibbonViewLayout.Metrics();
}

uint64_t sub_775B00()
{
  return type metadata accessor for MetadataRibbonViewLayout();
}

uint64_t sub_775B10()
{
  return dispatch thunk of OfferButtonConfiguration.shouldReapply(sizeChanged:)();
}

uint64_t sub_775B20()
{
  return dispatch thunk of OfferButtonConfiguration.disableAnimations(whenUpdatingFrom:)();
}

uint64_t sub_775B30()
{
  return dispatch thunk of OfferButtonConfiguration.size(in:)();
}

uint64_t sub_775B40()
{
  return dispatch thunk of OfferButtonConfiguration.apply<A>(to:)();
}

uint64_t sub_775B50()
{
  return dispatch thunk of OfferButtonConfiguration.layout<A>(button:in:disableAnimations:)();
}

uint64_t sub_775B60()
{
  return dispatch thunk of OfferButtonConfiguration.isEqual(to:with:)();
}

uint64_t sub_775B70()
{
  return dispatch thunk of OfferButtonConfiguration.reapply<A>(colorsTo:)();
}

uint64_t sub_775B80()
{
  return dispatch thunk of OfferButtonConfiguration.unapply<A>(to:)();
}

uint64_t sub_775B90()
{
  return static PageFacetsFieldsProvider.metricsPipelineWithPageFacetsProvider(using:currentPipeline:)();
}

uint64_t sub_775BA0()
{
  return PreorderDisclaimerLayout.init(disclaimer:)();
}

uint64_t sub_775BB0()
{
  return PreorderDisclaimerLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775BC0()
{
  return type metadata accessor for PreorderDisclaimerLayout();
}

uint64_t sub_775BD0()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.measurements(fitting:in:)();
}

uint64_t sub_775BE0()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775BF0()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.Metrics.init(primaryTextSpace:secondaryTextSpace:disclosureMargin:disclosureSize:)();
}

uint64_t sub_775C00()
{
  return type metadata accessor for ProductDescriptionLayout.DeveloperLinkLayout.Metrics();
}

uint64_t sub_775C10()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.init(metrics:primaryText:secondaryText:disclosureView:)();
}

uint64_t sub_775C20()
{
  return type metadata accessor for ProductDescriptionLayout.DeveloperLinkLayout();
}

uint64_t sub_775C30()
{
  return ProductDescriptionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_775C40()
{
  return ProductDescriptionLayout.Metrics.init(topPadding:developerTopPadding:horizontalTextPadding:horizontalDeveloperSpace:)();
}

uint64_t sub_775C50()
{
  return type metadata accessor for ProductDescriptionLayout.Metrics();
}

uint64_t sub_775C60()
{
  return ProductDescriptionLayout.init(metrics:bodyText:developerLink:)();
}

uint64_t sub_775C70()
{
  return type metadata accessor for ProductDescriptionLayout();
}

uint64_t sub_775C80()
{
  return ProductNavigationBarMode.rawValue.getter();
}

uint64_t sub_775C90()
{
  return ProductPageIconDimension.rawValue.getter();
}

uint64_t sub_775CA0()
{
  return type metadata accessor for ProductPageIconDimension();
}

uint64_t sub_775CB0()
{
  return ReusableCellRegistration.init(reuseIdentifier:configurationHandler:)();
}

uint64_t sub_775CC0()
{
  return SearchResultsContextCard.action.getter();
}

uint64_t sub_775CD0()
{
  return SearchResultsContextCard.message.getter();
}

uint64_t sub_775CE0()
{
  return type metadata accessor for SearchResultsContextCard();
}

uint64_t sub_775CF0()
{
  return dispatch thunk of ShelfBackgroundProviding.shelfBackground.getter();
}

uint64_t sub_775D00()
{
  return UnifiedTabBadgingManager.didVisit(_:)();
}

uint64_t sub_775D10()
{
  return type metadata accessor for UnifiedTabBadgingManager();
}

uint64_t sub_775D20()
{
  return static UserNotificationsManager.userNotificationsDidChangeNotification.getter();
}

uint64_t sub_775D30()
{
  return UserNotificationsManager.init(objectGraph:rootViewController:)();
}

uint64_t sub_775D40()
{
  return static UserNotificationsManager.appEventIdKey.getter();
}

uint64_t sub_775D50()
{
  return static UserNotificationsManager.sourceViewKey.getter();
}

uint64_t sub_775D60()
{
  return UserNotificationsManager.getIsAuthorized()();
}

uint64_t sub_775D70()
{
  return type metadata accessor for UserNotificationsManager.SchedulingResult();
}

uint64_t sub_775D80()
{
  return UserNotificationsManager.scheduleNotification(with:from:)();
}

uint64_t sub_775D90()
{
  return UserNotificationsManager.hasScheduledNotification(with:)();
}

uint64_t sub_775DA0()
{
  return UserNotificationsManager.cancelScheduledNotification(with:from:)();
}

uint64_t sub_775DB0()
{
  return type metadata accessor for UserNotificationsManager();
}

uint64_t sub_775DC0()
{
  return dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo()();
}

uint64_t sub_775DD0()
{
  return dispatch thunk of VideoPlaybackCoordinator.startAutoPlayVideo()();
}

uint64_t sub_775DE0()
{
  return dispatch thunk of VideoPlaybackCoordinator.unregisterAllVideoViews()();
}

uint64_t sub_775DF0()
{
  return dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo()();
}

uint64_t sub_775E00()
{
  return dispatch thunk of VideoPlaybackCoordinator.shouldLoopSingleVideo.setter();
}

uint64_t sub_775E10()
{
  return dispatch thunk of VideoPlaybackCoordinator.unregister(videoView:videoContainer:pausingPlayback:)();
}

uint64_t sub_775E20()
{
  return dispatch thunk of VideoPlaybackCoordinator.isAutoPlayEnabled.setter();
}

uint64_t sub_775E30()
{
  return VideoPlaybackCoordinator.init(isGlobalAutoPlayEnabled:metricsPipeline:)();
}

uint64_t sub_775E40()
{
  return dispatch thunk of VideoPlaybackCoordinator.setParentViewController(_:)();
}

uint64_t sub_775E50()
{
  return dispatch thunk of VideoPlaybackCoordinator.register(videoView:videoContainer:)();
}

uint64_t sub_775E60()
{
  return dispatch thunk of VideoPlaybackCoordinator.isPlaying(in:)();
}

uint64_t sub_775E70()
{
  return type metadata accessor for VideoPlaybackCoordinator();
}

uint64_t sub_775E80(Swift::String _, Swift::Int count, Swift::String comment)
{
  return localizedStringWithCount(_:count:comment:)(_, count, comment)._countAndFlagsBits;
}

void sub_775E90()
{
}

uint64_t sub_775EA0()
{
  return ArcadeDownloadPackStorage.init()();
}

uint64_t sub_775EB0()
{
  return type metadata accessor for ArcadeDownloadPackStorage();
}

uint64_t sub_775EC0()
{
  return ArcadeOfferLabelPresenter.init(subscribedText:nonsubscribedText:subscriptionManager:)();
}

uint64_t sub_775ED0()
{
  return ArcadeOfferLabelPresenter.view.setter();
}

uint64_t sub_775EE0()
{
  return type metadata accessor for ArcadeOfferLabelPresenter();
}

uint64_t sub_775EF0()
{
  return ArcadeSubscriptionManager.addSubscriptionStateObserver(_:action:)();
}

uint64_t sub_775F00()
{
  return ArcadeSubscriptionManager.setSubscriptionState(_:notifyingObservers:)();
}

uint64_t sub_775F10()
{
  return ArcadeSubscriptionManager.init(arcadeSubscriptionFamilyId:subscriptionEntitlements:activeStoreAccountProvider:)();
}

uint64_t sub_775F20()
{
  return ArcadeSubscriptionManager.removeSubscriptionStateActions(for:)();
}

uint64_t sub_775F30()
{
  return ArcadeSubscriptionManager.purchaseSubscription(product:appAdamId:decorator:callbacks:dialogHandler:)();
}

uint64_t sub_775F40()
{
  return ArcadeSubscriptionManager.PaymentCallbacks.init(success:failure:)();
}

uint64_t sub_775F50()
{
  return type metadata accessor for ArcadeSubscriptionManager.PaymentCallbacks();
}

uint64_t sub_775F60()
{
  return ArcadeSubscriptionManager.subscriptionState.getter();
}

uint64_t sub_775F70()
{
  return ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)();
}

uint64_t sub_775F80()
{
  return type metadata accessor for ArcadeSubscriptionManager();
}

uint64_t sub_775F90()
{
  return CappedSizeStaticDimension.init(constant:source:maxSizeCategory:)();
}

uint64_t sub_775FA0()
{
  return type metadata accessor for CappedSizeStaticDimension();
}

uint64_t sub_775FB0()
{
  return static ChartOrCategoryBrickStyle.tileMetrics.getter();
}

uint64_t sub_775FC0()
{
  return type metadata accessor for ChartOrCategoryBrickStyle();
}

uint64_t sub_775FD0()
{
  return dispatch thunk of ComponentModelContainment.contentType(for:)();
}

uint64_t sub_775FE0()
{
  return dispatch thunk of ComponentModelContainment.numberOfItems.getter();
}

uint64_t sub_775FF0()
{
  return dispatch thunk of ComponentModelContainment.model(at:)();
}

uint64_t sub_776000()
{
  return ContingentOfferDetailPage.contingentOffer.getter();
}

uint64_t sub_776010()
{
  return ContingentOfferDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_776020()
{
  return ContingentOfferDetailPage.learnMoreActionMetrics.getter();
}

uint64_t sub_776030()
{
  return ContingentOfferDetailPage.backButtonActionMetrics.getter();
}

uint64_t sub_776040()
{
  return ContingentOfferDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_776050()
{
  return ContingentOfferDetailPage.closeButtonActionMetrics.getter();
}

uint64_t sub_776060()
{
  return ContingentOfferDetailPage.video.getter();
}

uint64_t sub_776070()
{
  return ContingentOfferDetailPage.artwork.getter();
}

uint64_t sub_776080()
{
  return type metadata accessor for ContingentOfferDetailPage();
}

uint64_t sub_776090()
{
  return CreateCalendarEventAction.notAuthorizedAction.getter();
}

void sub_7760A0()
{
}

uint64_t sub_7760B0()
{
  return DebugMetricsEventRecorder.$events.getter();
}

uint64_t sub_7760C0()
{
  return type metadata accessor for DebugMetricsEventRecorder();
}

uint64_t sub_7760D0()
{
  return type metadata accessor for EditorialSearchResultType();
}

uint64_t sub_7760E0()
{
  return FlowPreviewOfferPresenter.offerTitles.getter();
}

uint64_t sub_7760F0()
{
  return FlowPreviewOfferPresenter.performAction(in:)();
}

uint64_t sub_776100()
{
  return FlowPreviewOfferPresenter.init(displayProperties:offerAction:asPartOf:)();
}

uint64_t sub_776110()
{
  return type metadata accessor for FlowPreviewOfferPresenter();
}

uint64_t sub_776120()
{
  return type metadata accessor for HorizontalAlignmentLayout.HorizontalGravity();
}

uint64_t sub_776130()
{
  return static HorizontalAlignmentLayout.SizingPolicy.policy(priority:constrainedTo:)();
}

uint64_t sub_776140()
{
  return type metadata accessor for HorizontalAlignmentLayout.SizingPolicy.Priority();
}

uint64_t sub_776150()
{
  return type metadata accessor for HorizontalAlignmentLayout.SizingPolicy();
}

uint64_t sub_776160()
{
  return static HorizontalAlignmentLayout.VerticalAnchor.anchor(child:at:)();
}

uint64_t sub_776170()
{
  return type metadata accessor for HorizontalAlignmentLayout.VerticalAnchor();
}

uint64_t sub_776180()
{
  return type metadata accessor for HorizontalAlignmentLayout.ChildSourceOffset();
}

uint64_t sub_776190()
{
  return type metadata accessor for HorizontalAlignmentLayout.ContainerDestinationOffset();
}

uint64_t sub_7761A0()
{
  return static HorizontalAlignmentLayout.Child.child(view:leadingSpace:trailingSpace:verticalAnchor:horizontalGravity:sizingPolicy:)();
}

uint64_t sub_7761B0()
{
  return type metadata accessor for HorizontalAlignmentLayout.Child();
}

uint64_t sub_7761C0()
{
  return HorizontalAlignmentLayout.init(children:)();
}

uint64_t sub_7761D0()
{
  return type metadata accessor for HorizontalAlignmentLayout();
}

uint64_t sub_7761E0()
{
  return HttpTemplateSubstitutions.setParameter(value:for:)();
}

uint64_t sub_7761F0()
{
  return HttpTemplateSubstitutions.init(urlQuery:headers:jsonBody:formBody:)();
}

uint64_t sub_776200()
{
  return type metadata accessor for HttpTemplateSubstitutions();
}

void sub_776210(UIScrollView in)
{
}

uint64_t sub_776220()
{
  return ImpressionsScrollObserver.collectionView.setter();
}

uint64_t sub_776230()
{
  return type metadata accessor for ImpressionsScrollObserver();
}

uint64_t sub_776240()
{
  return ImpressionsScrollObserver.init(_:)();
}

uint64_t sub_776250()
{
  return dispatch thunk of ItemSupplementaryProvider.supplementaryItems(for:asPartOf:)();
}

uint64_t sub_776260()
{
  return dispatch thunk of ItemSupplementaryProvider.supplementaryRegistration(for:in:asPartOf:)();
}

uint64_t sub_776270()
{
  return dispatch thunk of ManagedVideoViewProviding.registerVideos(with:)();
}

uint64_t sub_776280()
{
  return dispatch thunk of ManagedVideoViewProviding.unregisterVideos(with:)();
}

uint64_t sub_776290()
{
  return dispatch thunk of NestedShelfClickableModel.click(for:)();
}

uint64_t sub_7762A0()
{
  return type metadata accessor for OnDeviceAdFetchFailReason();
}

uint64_t sub_7762B0()
{
  return type metadata accessor for ProductPageScrollPosition();
}

uint64_t sub_7762C0()
{
  return ProductReviewCustomLayout.Metrics.init(horizontalContentPadding:verticalContentPadding:ratingsTopSpace:dateAuthorLeadingPadding:dateAuthorTopPadding:ratingsAccessibilityTopPadding:dateAccessibilityTopPadding:bodyTopPadding:responseTitleTopPadding:responseTitleAccessibilityTopPadding:responseDateAccessibilityTopPadding:responseBodyTopPadding:)();
}

uint64_t sub_7762D0()
{
  return ProductReviewCustomLayout.Metrics.horizontalContentPadding.setter();
}

uint64_t sub_7762E0()
{
  return type metadata accessor for ProductReviewCustomLayout.Metrics();
}

uint64_t sub_7762F0()
{
  return ProductReviewCustomLayout.init(metrics:titleLabel:dateLabel:authorLabel:dateAuthorLabel:bodyLabel:responseTitleLabel:responseDateLabel:responseBodyLabel:hasResponse:ratingsView:)();
}

uint64_t sub_776300()
{
  return type metadata accessor for ProductReviewCustomLayout();
}

uint64_t sub_776310()
{
  return dispatch thunk of PurchasableTodayCardMedia.offerAdamIds.getter();
}

uint64_t sub_776320()
{
  return PurchasesContentPresenter.canHidePurchases.getter();
}

uint64_t sub_776330()
{
  return PurchasesContentPresenter.purchasesContentModes.getter();
}

uint64_t sub_776340()
{
  return PurchasesContentPresenter.init(objectGraph:accountStore:appStateController:familyMember:purchaseHistory:showMacOSCompatibleIOSApps:appleSilicon:)();
}

uint64_t sub_776350()
{
  return PurchasesContentPresenter.hidePurchase(at:)();
}

uint64_t sub_776360()
{
  return PurchasesContentPresenter.sectionCount.getter();
}

uint64_t sub_776370()
{
  return PurchasesContentPresenter.unhidePurchase(at:)();
}

uint64_t sub_776380()
{
  return PurchasesContentPresenter.mode.getter();
}

uint64_t sub_776390()
{
  return PurchasesContentPresenter.mode.setter();
}

uint64_t sub_7763A0()
{
  return PurchasesContentPresenter.term.setter();
}

uint64_t sub_7763B0()
{
  return PurchasesContentPresenter.view.setter();
}

void sub_7763C0()
{
}

uint64_t sub_7763D0()
{
  return PurchasesContentPresenter.pageTitle.getter();
}

void sub_7763E0()
{
}

uint64_t sub_7763F0()
{
  return type metadata accessor for PurchasesContentPresenter();
}

uint64_t sub_776400()
{
  return static RenderPipelineDiagnostics.errorDidOccurNotification.getter();
}

uint64_t sub_776410()
{
  return static RenderPipelineDiagnostics.incidentsDidOccurNotification.getter();
}

uint64_t sub_776420()
{
  return static RenderPipelineDiagnostics.error(of:)();
}

uint64_t sub_776430()
{
  return RenderPipelineDiagnostics.Recorder.snapshot()();
}

uint64_t sub_776440()
{
  return RenderPipelineDiagnostics.Recorder.init()();
}

uint64_t sub_776450()
{
  return type metadata accessor for RenderPipelineDiagnostics.Recorder();
}

uint64_t sub_776460()
{
  return static RenderPipelineDiagnostics.incidents(of:)();
}

uint64_t sub_776470()
{
  return ShareSheetArticleMetadata.id.getter();
}

uint64_t sub_776480()
{
  return ShareSheetArticleMetadata.text.getter();
}

uint64_t sub_776490()
{
  return ShareSheetArticleMetadata.artwork.getter();
}

uint64_t sub_7764A0()
{
  return ShareSheetArticleMetadata.subtitle.getter();
}

uint64_t sub_7764B0()
{
  return ShareSheetProductMetadata.isMessagesOnlyApp.getter();
}

uint64_t sub_7764C0()
{
  return ShareSheetProductMetadata.notesMetadata.getter();
}

uint64_t sub_7764D0()
{
  return ShareSheetProductMetadata.messagesAppIcon.getter();
}

uint64_t sub_7764E0()
{
  return ShareSheetProductMetadata.screenshots.getter();
}

uint64_t sub_7764F0()
{
  return ShareSheetProductMetadata.storeFrontIdentifier.getter();
}

uint64_t sub_776500()
{
  return ShareSheetProductMetadata.icon.getter();
}

uint64_t sub_776510()
{
  return ShareSheetProductMetadata.name.getter();
}

uint64_t sub_776520()
{
  return ShareSheetProductMetadata.adamId.getter();
}

uint64_t sub_776530()
{
  return ShareSheetProductMetadata.videos.getter();
}

uint64_t sub_776540()
{
  return ShareSheetProductMetadata.Platform.rawValue.getter();
}

uint64_t sub_776550()
{
  return type metadata accessor for ShareSheetProductMetadata.Platform();
}

uint64_t sub_776560()
{
  return ShareSheetProductMetadata.platform.getter();
}

uint64_t sub_776570()
{
  return ShareSheetProductMetadata.subtitle.getter();
}

uint64_t sub_776580()
{
  return ShareSheetProductMetadata.genreName.getter();
}

uint64_t sub_776590()
{
  return dispatch thunk of TimedMetricsPagePresenter.pageRenderMetrics.getter();
}

uint64_t sub_7765A0()
{
  return dispatch thunk of TimedMetricsPagePresenter.pendingPageRender.getter();
}

uint64_t sub_7765B0()
{
  return dispatch thunk of TimedMetricsPagePresenter.metricsPipeline.getter();
}

uint64_t sub_7765C0()
{
  return dispatch thunk of TimedMetricsPagePresenter.advertRotationData.setter();
}

uint64_t sub_7765D0()
{
  return TimedMetricsPagePresenter.impressionsTracker.getter();
}

uint64_t sub_7765E0()
{
  return TimedMetricsPagePresenter.onUpdatePhaseChanged.getter();
}

uint64_t sub_7765F0()
{
  return TimedMetricsPagePresenter.impressionsCalculator.getter();
}

uint64_t sub_776600()
{
  return dispatch thunk of TimedMetricsPagePresenter.update(ignoringCache:)();
}

uint64_t sub_776610()
{
  return dispatch thunk of TimedMetricsPagePresenter.didLoad()();
}

uint64_t sub_776620()
{
  return dispatch thunk of TimedMetricsPagePresenter.referrer.setter();
}

uint64_t sub_776630()
{
  return dispatch thunk of TodayCardMediaWithArtwork.artworkLayoutsWithMetrics.getter();
}

uint64_t sub_776640()
{
  return TodayCardMediaWithArtwork.prefetchableArtwork(for:)();
}

uint64_t sub_776650()
{
  return TodayCardMediaWithArtwork.video(for:)();
}

uint64_t sub_776660()
{
  return TodayCardMediaWithArtwork.artwork(for:)();
}

uint64_t sub_776670()
{
  return TodayCardParagraphOverlay.style.getter();
}

uint64_t sub_776680()
{
  return TodayCardParagraphOverlay.paragraph.getter();
}

uint64_t sub_776690()
{
  return type metadata accessor for TodayCardParagraphOverlay();
}

uint64_t sub_7766A0()
{
  return TodayCardThreeLineOverlay.description.getter();
}

uint64_t sub_7766B0()
{
  return TodayCardThreeLineOverlay.title.getter();
}

uint64_t sub_7766C0()
{
  return TodayCardThreeLineOverlay.heading.getter();
}

uint64_t sub_7766D0()
{
  return static ViewControllerContainment.add(_:to:frame:)();
}

uint64_t sub_7766E0()
{
  return static ViewControllerContainment.remove(_:)();
}

uint64_t sub_7766F0(NSNumber_optional a1, Swift::Int a2)
{
  return localizedStringForDecimal(_:_:)(a1, a2).value._countAndFlagsBits;
}

uint64_t sub_776700()
{
  return AccountSectionInfoListItem.title.getter();
}

uint64_t sub_776710()
{
  return AccountSectionInfoListItem.value.getter();
}

uint64_t sub_776720()
{
  return AdvertActionMetricsHandler.processAdActionMetrics(_:then:)();
}

uint64_t sub_776730()
{
  return AdvertActionMetricsHandler.init(reporters:)();
}

uint64_t sub_776740()
{
  return type metadata accessor for AdvertActionMetricsHandler();
}

uint64_t sub_776750()
{
  return type metadata accessor for AdvertVisibilityCalculator.VisibilityThreshold();
}

uint64_t sub_776760()
{
  return ArcadeDownloadPackCategory.gradientEndColor.getter();
}

uint64_t sub_776770()
{
  return ArcadeDownloadPackCategory.impressionMetrics.getter();
}

uint64_t sub_776780()
{
  return ArcadeDownloadPackCategory.gradientStartColor.getter();
}

uint64_t sub_776790()
{
  return ArcadeDownloadPackCategory.id.getter();
}

uint64_t sub_7767A0()
{
  return ArcadeDownloadPackCategory.title.getter();
}

uint64_t sub_7767B0()
{
  return ArcadeDownloadPackCategory.artwork.getter();
}

uint64_t sub_7767C0()
{
  return ArcadeWelcomeContentLayout.measurements(fitting:in:)();
}

uint64_t sub_7767D0()
{
  return ArcadeWelcomeContentLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7767E0()
{
  return ArcadeWelcomeContentLayout.Metrics.init(titleTopSpace:titleInsets:subtitleTopSpace:subtitleFontSource:subtitleInsets:itemsMinTopPosition:itemsTopSpace:itemsBottomSpace:)();
}

uint64_t sub_7767F0()
{
  return type metadata accessor for ArcadeWelcomeContentLayout.Metrics();
}

uint64_t sub_776800()
{
  return ArcadeWelcomeContentLayout.init(metrics:titleText:subtitleText:items:)();
}

uint64_t sub_776810()
{
  return type metadata accessor for ArcadeWelcomeContentLayout();
}

uint64_t sub_776820()
{
  return ArcadeWelcomePagePresenter.init(objectGraph:contentType:welcomePage:url:)();
}

uint64_t sub_776830()
{
  return dispatch thunk of ArcadeWelcomePagePresenter.view.setter();
}

uint64_t sub_776840()
{
  return type metadata accessor for ArcadeWelcomePagePresenter();
}

uint64_t sub_776850()
{
  return dispatch thunk of CollectionElementsObserver.didSelectCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_776860()
{
  return dispatch thunk of CollectionElementsObserver.prefetchCells(in:collectionView:asPartOf:)();
}

uint64_t sub_776870()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776880()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776890()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_7768A0()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_7768B0()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_7768C0()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_7768D0()
{
  return CollectionElementsObserver.didSelectCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_7768E0()
{
  return CollectionElementsObserver.prefetchCells(in:collectionView:asPartOf:)();
}

uint64_t sub_7768F0()
{
  return CollectionElementsObserver.didDequeueCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_776900()
{
  return CollectionElementsObserver.willDisplayCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_776910()
{
  return CollectionElementsObserver.didEndDisplayingCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_776920()
{
  return CollectionElementsObserver.willDisplayItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776930()
{
  return CollectionElementsObserver.willDisplayShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776940()
{
  return CollectionElementsObserver.willDisplayGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776950()
{
  return CollectionElementsObserver.didEndDisplayingItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776960()
{
  return CollectionElementsObserver.didEndDisplayingShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776970()
{
  return CollectionElementsObserver.didEndDisplayingGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_776980()
{
  return dispatch thunk of ComponentContainerDelegate.mutableState(ofSubItemAt:)();
}

uint64_t sub_776990()
{
  return dispatch thunk of ComponentContainerDelegate.mutableState(ofItem:)();
}

uint64_t sub_7769A0()
{
  return dispatch thunk of ComponentContainerDelegate.numberOfItems.getter();
}

uint64_t sub_7769B0()
{
  return dispatch thunk of ComponentContainerDelegate.containerState.getter();
}

uint64_t sub_7769C0()
{
  return dispatch thunk of ComponentContainerDelegate.scrollObserver.getter();
}

uint64_t sub_7769D0()
{
  return dispatch thunk of ComponentContainerDelegate.propagateSelection(ofItem:)();
}

uint64_t sub_7769E0()
{
  return dispatch thunk of ComponentContainerDelegate.impressionsCalculator.getter();
}

uint64_t sub_7769F0()
{
  return dispatch thunk of ComponentContainerDelegate.model(ofItem:)();
}

uint64_t sub_776A00()
{
  return dispatch thunk of ComponentContainerDelegate.state(ofItem:)();
}

uint64_t sub_776A10()
{
  return type metadata accessor for EntitlementRefeshCondition();
}

uint64_t sub_776A20()
{
  return GameCenterActivityFeedCard.appActionMetrics.getter();
}

uint64_t sub_776A30()
{
  return GameCenterActivityFeedCard.profileActionMetrics.getter();
}

uint64_t sub_776A40()
{
  return GameCenterActivityFeedCard.achievementActionMetrics.getter();
}

uint64_t sub_776A50()
{
  return GameCenterActivityFeedCard.leaderboardActionMetrics.getter();
}

uint64_t sub_776A60()
{
  return GameCenterActivityFeedCard.profileAvatarActionMetrics.getter();
}

uint64_t sub_776A70()
{
  return GameCenterActivityFeedCard.data.getter();
}

uint64_t sub_776A80()
{
  return type metadata accessor for GameCenterActivityFeedCard();
}

uint64_t sub_776A90()
{
  return type metadata accessor for ImpressionIdScrollObserver();
}

uint64_t sub_776AA0()
{
  return ImpressionIdScrollObserver.init(_:impressionID:collectionView:)();
}

void sub_776AB0()
{
}

uint64_t sub_776AC0()
{
  return type metadata accessor for InvalidateAllWidgetsAction();
}

uint64_t sub_776AD0()
{
  return type metadata accessor for MetadataRibbonItemViewType();
}

uint64_t sub_776AE0()
{
  return static PlatformSelectorViewLayout.makeFullPlatformString(descriptiveText:badgeString:metrics:style:in:)();
}

uint64_t sub_776AF0()
{
  return PlatformSelectorViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_776B00()
{
  return type metadata accessor for PlatformSelectorViewLayout.Metrics.AccessoryAlignment();
}

uint64_t sub_776B10()
{
  return PlatformSelectorViewLayout.Metrics.init(badgeHorizontalPadding:textSpaceWhenInline:textSpaceWhenExclusiveLine:badgeSpaceExclusiveLine:accessoryHorizontalPadding:accessoryContentInsets:accessoryAlignment:bottomSpacer:)();
}

uint64_t sub_776B20()
{
  return PlatformSelectorViewLayout.Metrics.badgeHorizontalPadding.getter();
}

uint64_t sub_776B30()
{
  return type metadata accessor for PlatformSelectorViewLayout.Metrics();
}

uint64_t sub_776B40()
{
  return PlatformSelectorViewLayout.init(metrics:style:descriptionLabel:accessoryImageView:)();
}

uint64_t sub_776B50()
{
  return type metadata accessor for PlatformSelectorViewLayout();
}

uint64_t sub_776B60()
{
  return SearchTagsRibbonViewLayout.init(searchTagsRibbonItemLayoutContexts:metrics:shouldEvenlyDistribute:)();
}

uint64_t sub_776B70()
{
  return SearchTagsRibbonViewLayout.measurements(fitting:in:)();
}

uint64_t sub_776B80()
{
  return SearchTagsRibbonViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_776B90()
{
  return SearchTagsRibbonViewLayout.Metrics.maximumNumberOfItems.getter();
}

uint64_t sub_776BA0()
{
  return static SearchTagsRibbonViewLayout.Metrics.standard.getter();
}

uint64_t sub_776BB0()
{
  return type metadata accessor for SearchTagsRibbonViewLayout.Metrics();
}

uint64_t sub_776BC0()
{
  return type metadata accessor for SearchTagsRibbonViewLayout();
}

uint64_t sub_776BD0()
{
  return ShelfBasedPageScrollAction.clicksOnScroll.getter();
}

uint64_t sub_776BE0()
{
  return ShelfBasedPageScrollAction.index.getter();
}

uint64_t sub_776BF0()
{
  return ShelfBasedPageScrollAction.shelfId.getter();
}

uint64_t sub_776C00()
{
  return type metadata accessor for ShelfBasedPageScrollAction();
}

uint64_t sub_776C10()
{
  return ShelfLayoutSpacingProvider.topPadding(in:)();
}

uint64_t sub_776C20()
{
  return ShelfLayoutSpacingProvider.bottomPadding(in:)();
}

uint64_t sub_776C30()
{
  return ShelfLayoutSpacingProvider.topContentInset(in:)();
}

uint64_t sub_776C40()
{
  return ShelfLayoutSpacingProvider.topPaddingValue(in:)();
}

uint64_t sub_776C50()
{
  return ShelfLayoutSpacingProvider.bottomContentInset(in:)();
}

uint64_t sub_776C60()
{
  return ShelfLayoutSpacingProvider.bottomPaddingValue(in:)();
}

uint64_t sub_776C70()
{
  return ShelfLayoutSpacingProvider.topContentInsetValue(in:)();
}

uint64_t sub_776C80()
{
  return dispatch thunk of ShelfSupplementaryProvider.decorationItems(for:shelfLayoutSpacingProvider:asPartOf:)();
}

uint64_t sub_776C90()
{
  return dispatch thunk of ShelfSupplementaryProvider.supplementaryItems(for:shelfLayoutSpacingProvider:asPartOf:)();
}

uint64_t sub_776CA0()
{
  return dispatch thunk of ShelfSupplementaryProvider.supplementaryRegistration(for:in:asPartOf:)();
}

uint64_t sub_776CB0()
{
  return TodayCardLockupListOverlay.displaysTitle.getter();
}

uint64_t sub_776CC0()
{
  return TodayCardLockupListOverlay.lockups.getter();
}

uint64_t sub_776CD0()
{
  return type metadata accessor for TodayCardLockupListOverlay();
}

uint64_t sub_776CE0()
{
  return TodayCardMediaSingleLockup.condensedAdLockupWithIconBackground.getter();
}

uint64_t sub_776CF0()
{
  return type metadata accessor for TodayCardMediaSingleLockup();
}

uint64_t sub_776D00()
{
  return TodayCardTriggerController.persistantStore.getter();
}

uint64_t sub_776D10()
{
  return dispatch thunk of TodayCardTriggerController.snapshot()();
}

uint64_t sub_776D20()
{
  return type metadata accessor for TodayCardTriggerController();
}

uint64_t sub_776D30()
{
  return TodayCardTriggerIdentifier.rawValue.getter();
}

uint64_t sub_776D40()
{
  return type metadata accessor for TodayCardTriggerIdentifier();
}

uint64_t sub_776D50()
{
  return TodayDiffablePagePresenter.init(objectGraph:pageUrl:triggerController:supportsFastImpressions:accountStore:shouldUpdateOnAccountChange:advertLifecycleMetricsReporter:)();
}

uint64_t sub_776D60()
{
  return TodayDiffablePagePresenter.pageLongTitle.getter();
}

uint64_t sub_776D70()
{
  return TodayDiffablePagePresenter.feedPreviewUrl.getter();
}

uint64_t sub_776D80()
{
  return TodayDiffablePagePresenter.pageTitleDetail.getter();
}

uint64_t sub_776D90()
{
  return TodayDiffablePagePresenter.pageShortTitleDetail.getter();
}

uint64_t sub_776DA0()
{
  return TodayDiffablePagePresenter.tabTitle.getter();
}

uint64_t sub_776DB0()
{
  return TodayDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_776DC0()
{
  return type metadata accessor for TodayDiffablePagePresenter();
}

uint64_t sub_776DD0()
{
  return type metadata accessor for TodaySectionDisplayOptions.GroupDisplayStyle();
}

uint64_t sub_776DE0()
{
  return TodaySectionDisplayOptions.debugSectionTypeIndicatorColor.getter();
}

uint64_t sub_776DF0()
{
  return TodaySectionDisplayOptions.groupDisplayStyle.getter();
}

uint64_t sub_776E00()
{
  return type metadata accessor for TodaySectionDisplayOptions();
}

uint64_t sub_776E10()
{
  return dispatch thunk of AnyAvatarShowcaseDisplaying.applyAvatars(from:asPartOf:)();
}

uint64_t sub_776E20()
{
  return dispatch thunk of AnyAvatarShowcaseDisplaying.unapply()();
}

uint64_t sub_776E30()
{
  return ArcadeAccountEventGenerator.init(metricsPipeline:)();
}

uint64_t sub_776E40()
{
  return dispatch thunk of ArcadeAccountEventGenerator.arcadeStateDidChange()();
}

uint64_t sub_776E50()
{
  return type metadata accessor for ArcadeAccountEventGenerator();
}

uint64_t sub_776E60()
{
  return ArcadeDiffablePagePresenter.didFetchPage.getter();
}

uint64_t sub_776E70()
{
  return ArcadeDiffablePagePresenter.init(objectGraph:arcadeSubscriptionManager:subscriptionStateFetchTimeout:sidePackedPage:pageUrls:)();
}

uint64_t sub_776E80()
{
  return ArcadeDiffablePagePresenter.titleEffect.getter();
}

uint64_t sub_776E90()
{
  return ArcadeDiffablePagePresenter.onOnPrepareUpsellHandler.getter();
}

uint64_t sub_776EA0()
{
  return ArcadeDiffablePagePresenter.onRecordTabVisitIfPossible.getter();
}

uint64_t sub_776EB0()
{
  return ArcadeDiffablePagePresenter.tabTitle.getter();
}

uint64_t sub_776EC0()
{
  return ArcadeDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_776ED0()
{
  return type metadata accessor for ArcadeDiffablePagePresenter();
}

uint64_t sub_776EE0()
{
  return ArcadeSubscriptionDecorator.init(objectGraph:product:appAdamId:subscriptionToken:)();
}

uint64_t sub_776EF0()
{
  return type metadata accessor for ArcadeSubscriptionDecorator();
}

uint64_t sub_776F00()
{
  return ArcadeWelcomeItemViewLayout.measurements(fitting:in:)();
}

uint64_t sub_776F10()
{
  return ArcadeWelcomeItemViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_776F20()
{
  return ArcadeWelcomeItemViewLayout.Metrics.imageWidth.setter();
}

uint64_t sub_776F30()
{
  return ArcadeWelcomeItemViewLayout.Metrics.init(imageAspectRatio:imageWidth:headingTopSpace:bodyTopSpace:textInsets:)();
}

uint64_t sub_776F40()
{
  return type metadata accessor for ArcadeWelcomeItemViewLayout.Metrics();
}

uint64_t sub_776F50()
{
  return ArcadeWelcomeItemViewLayout.init(metrics:headingText:bodyText:image:)();
}

uint64_t sub_776F60()
{
  return type metadata accessor for ArcadeWelcomeItemViewLayout();
}

uint64_t sub_776F70()
{
  return ChartOrCategoryBrickContext.BrickLabelMetrics.badge.getter();
}

uint64_t sub_776F80()
{
  return ChartOrCategoryBrickContext.BrickLabelMetrics.title.getter();
}

uint64_t sub_776F90()
{
  return type metadata accessor for ChartOrCategoryBrickContext.BrickLabelMetrics();
}

uint64_t sub_776FA0()
{
  return type metadata accessor for ChartOrCategoryBrickContext.BrickType();
}

uint64_t sub_776FB0()
{
  return ChartOrCategoryBrickContext.LabelMetrics.contentSizeCategoryMapping.getter();
}

uint64_t sub_776FC0()
{
  return ChartOrCategoryBrickContext.LabelMetrics.fontUseCase.getter();
}

uint64_t sub_776FD0()
{
  return ChartOrCategoryBrickContext.LabelMetrics.numberOfLines.getter();
}

uint64_t sub_776FE0()
{
  return type metadata accessor for ChartOrCategoryBrickContext.LabelMetrics();
}

uint64_t sub_776FF0()
{
  return ChartOrCategoryBrickContext.layoutMetrics.getter();
}

uint64_t sub_777000()
{
  return ChartOrCategoryBrickContext.currentArtwork.getter();
}

uint64_t sub_777010()
{
  return ChartOrCategoryBrickContext.init(model:fontStyles:in:)();
}

uint64_t sub_777020()
{
  return ChartOrCategoryBrickContext.model.getter();
}

uint64_t sub_777030()
{
  return ChartOrCategoryBrickContext.style.getter();
}

uint64_t sub_777040()
{
  return ChartOrCategoryBrickContext.labels.getter();
}

uint64_t sub_777050()
{
  return type metadata accessor for ChartOrCategoryBrickContext();
}

uint64_t sub_777060()
{
  return dispatch thunk of GenericAccountPagePresenter.contentItem(at:)();
}

uint64_t sub_777070()
{
  return GenericAccountPagePresenter.init(objectGraph:url:page:)();
}

uint64_t sub_777080()
{
  return dispatch thunk of GenericAccountPagePresenter.numberOfItems(in:)();
}

uint64_t sub_777090()
{
  return dispatch thunk of GenericAccountPagePresenter.numberOfSections.getter();
}

uint64_t sub_7770A0()
{
  return dispatch thunk of GenericAccountPagePresenter.personalizedRecommendationsEnabled.getter();
}

uint64_t sub_7770B0()
{
  return dispatch thunk of GenericAccountPagePresenter.setPersonalizedRecommendationsEnabled(_:)();
}

uint64_t sub_7770C0()
{
  return dispatch thunk of GenericAccountPagePresenter.view.setter();
}

uint64_t sub_7770D0()
{
  return dispatch thunk of GenericAccountPagePresenter.title(forSection:)();
}

uint64_t sub_7770E0()
{
  return dispatch thunk of GenericAccountPagePresenter.title.getter();
}

uint64_t sub_7770F0()
{
  return dispatch thunk of GenericAccountPagePresenter.action(at:)();
}

uint64_t sub_777100()
{
  return dispatch thunk of GenericAccountPagePresenter.footer(forSection:)();
}

uint64_t sub_777110()
{
  return type metadata accessor for GenericAccountPagePresenter();
}

uint64_t sub_777120()
{
  return type metadata accessor for GuidedSearchTokenCollection();
}

uint64_t sub_777130()
{
  return MetadataRibbonBarViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_777140()
{
  return MetadataRibbonBarViewLayout.measurements(fitting:in:)();
}

uint64_t sub_777150()
{
  return MetadataRibbonBarViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_777160()
{
  return MetadataRibbonBarViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_777170()
{
  return MetadataRibbonBarViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_777180()
{
  return type metadata accessor for MetadataRibbonBarViewLayout.Metrics();
}

uint64_t sub_777190()
{
  return type metadata accessor for MetadataRibbonBarViewLayout();
}

uint64_t sub_7771A0()
{
  return MetadataRibbonTagViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_7771B0()
{
  return MetadataRibbonTagViewLayout.measurements(fitting:in:)();
}

uint64_t sub_7771C0()
{
  return MetadataRibbonTagViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7771D0()
{
  return MetadataRibbonTagViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_7771E0()
{
  return MetadataRibbonTagViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_7771F0()
{
  return type metadata accessor for MetadataRibbonTagViewLayout.Metrics();
}

uint64_t sub_777200()
{
  return type metadata accessor for MetadataRibbonTagViewLayout();
}

uint64_t sub_777210()
{
  return type metadata accessor for OfferButtonSubtitlePosition();
}

uint64_t sub_777220()
{
  return OnDeviceAdvertFetchResponse.failureReason.getter();
}

uint64_t sub_777230()
{
  return OnDeviceAdvertFetchResponse.init(clientRequestId:iAdId:ad:failureReason:)();
}

uint64_t sub_777240()
{
  return OnDeviceAdvertFetchResponse.ad.getter();
}

uint64_t sub_777250()
{
  return type metadata accessor for OnDeviceAdvertFetchResponse();
}

uint64_t sub_777260()
{
  return type metadata accessor for PaginatedPagePresenterState();
}

uint64_t sub_777270()
{
  return type metadata accessor for PersonalizationDataProvider();
}

uint64_t sub_777280()
{
  return dispatch thunk of ProductTopLockupIconFetcher.addIconRecipient(recipient:)();
}

uint64_t sub_777290()
{
  return dispatch thunk of ProductTopLockupIconFetcher.fetchArtwork(for:in:)();
}

uint64_t sub_7772A0()
{
  return ProductTopLockupIconFetcher.init(artworkLoader:)();
}

uint64_t sub_7772B0()
{
  return type metadata accessor for ProductTopLockupIconFetcher();
}

uint64_t sub_7772C0()
{
  return dispatch thunk of PurchasableTodayCardOverlay.offerAdamIds.getter();
}

uint64_t sub_7772D0()
{
  return ReloadableItemPagePresenter.reloadItem(_:)();
}

uint64_t sub_7772E0()
{
  return static ResilientDeepLinkController.hasResilientDeepLinks(bag:)();
}

uint64_t sub_7772F0()
{
  return static ResilientDeepLinkController.removeAllDeepLinks()();
}

uint64_t sub_777300()
{
  return static ResilientDeepLinkController.removeNonResilientDeepLinks(bag:)();
}

uint64_t sub_777310()
{
  return static ResilientDeepLinkController.preventDismissingArticlesForFlowUrl(_:bag:)();
}

uint64_t sub_777320()
{
  return type metadata accessor for VideoPlaybackScrollObserver();
}

uint64_t sub_777330()
{
  return VideoPlaybackScrollObserver.init(_:)();
}

uint64_t sub_777340()
{
  return ArcadeDebugSubscriptionState.arcadeState.getter();
}

uint64_t sub_777350()
{
  return static ArcadeDebugSubscriptionState.allCases.getter();
}

uint64_t sub_777360()
{
  return type metadata accessor for ArcadeDebugSubscriptionState();
}

uint64_t sub_777370()
{
  return ArcadeDownloadPackSuggestion.lockup.getter();
}

uint64_t sub_777380()
{
  return ArticleDiffablePagePresenter.reloadLink(_:)();
}

uint64_t sub_777390()
{
  return ArticleDiffablePagePresenter.init(objectGraph:impressionsTracker:pageUrl:sidePackedPage:)();
}

uint64_t sub_7773A0()
{
  return ArticleDiffablePagePresenter.shareAction.getter();
}

uint64_t sub_7773B0()
{
  return type metadata accessor for ArticleDiffablePagePresenter.FooterLockup();
}

uint64_t sub_7773C0()
{
  return ArticleDiffablePagePresenter.onShowFooterLockup.getter();
}

uint64_t sub_7773D0()
{
  return ArticleDiffablePagePresenter.shouldTerminateOnClose.getter();
}

uint64_t sub_7773E0()
{
  return ArticleDiffablePagePresenter.onPrefetchLinkPresentations.getter();
}

uint64_t sub_7773F0()
{
  return ArticleDiffablePagePresenter.onPrepareToDisplayTodayCard.getter();
}

uint64_t sub_777400()
{
  return ArticleDiffablePagePresenter.footerVisibilitySectionThreshold.getter();
}

uint64_t sub_777410()
{
  return ArticleDiffablePagePresenter.todayCard.getter();
}

uint64_t sub_777420()
{
  return type metadata accessor for ArticleDiffablePagePresenter();
}

uint64_t sub_777430()
{
  return dispatch thunk of AutoPlayVideoSettingsManager.isAutoPlayEnabled.getter();
}

uint64_t sub_777440()
{
  return dispatch thunk of AutoPlayVideoSettingsManager.defaultAutoPlayVideoSetting.setter();
}

uint64_t sub_777450()
{
  return static AutoPlayVideoSettingsManager.shared.getter();
}

uint64_t sub_777460()
{
  return type metadata accessor for AutoPlayVideoSettingsManager();
}

uint64_t sub_777470()
{
  return BadgeContentKeyChartPosition.getter();
}

uint64_t sub_777480()
{
  return BadgeContentKeyParagraphText.getter();
}

uint64_t sub_777490()
{
  return ChartOrCategoryBrickSafeArea.size(in:)();
}

uint64_t sub_7774A0()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea.Location.RelativeLocation();
}

uint64_t sub_7774B0()
{
  return ChartOrCategoryBrickSafeArea.Location.relativeLocation.getter();
}

uint64_t sub_7774C0()
{
  return ChartOrCategoryBrickSafeArea.Location.absoluteDistance(in:)();
}

uint64_t sub_7774D0()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea.Location();
}

uint64_t sub_7774E0()
{
  return ChartOrCategoryBrickSafeArea.location.getter();
}

uint64_t sub_7774F0()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea();
}

uint64_t sub_777500()
{
  return GameCenterAchievementsAction.achievementIdsToHighlight.getter();
}

uint64_t sub_777510()
{
  return GameCenterAchievementsAction.init(bundleID:achievementIdsToHighlight:actionMetrics:)();
}

uint64_t sub_777520()
{
  return GameCenterAchievementsAction.bundleId.getter();
}

uint64_t sub_777530()
{
  return type metadata accessor for GameCenterAchievementsAction();
}

uint64_t sub_777540()
{
  return type metadata accessor for GameCenterInvitePlayerAction.InvitationType();
}

uint64_t sub_777550()
{
  return GameCenterInvitePlayerAction.invitationType.getter();
}

uint64_t sub_777560()
{
  return GameCenterLeaderboardsAction.init(leaderboardID:bundleID:actionMetrics:)();
}

uint64_t sub_777570()
{
  return GameCenterLeaderboardsAction.leaderboardID.getter();
}

uint64_t sub_777580()
{
  return GameCenterLeaderboardsAction.bundleID.getter();
}

uint64_t sub_777590()
{
  return type metadata accessor for GameCenterLeaderboardsAction();
}

uint64_t sub_7775A0()
{
  return GameCenterReengagementLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7775B0()
{
  return GameCenterReengagementLayout.Metrics.init(layoutMargins:shelfTopSpace:badgeGlyphSpace:badgeTopSpace:titleTopSpace:subtitleTopSpace:heroContentTopSpace:separatorTopSpace:footerTopSpace:footerBottomSpace:maxColumnWidth:columnSpace:maxHeight:)();
}

uint64_t sub_7775C0()
{
  return type metadata accessor for GameCenterReengagementLayout.Metrics();
}

uint64_t sub_7775D0()
{
  return GameCenterReengagementLayout.init(metrics:badgeGlyph:badgeLabel:titleLabel:subtitleLabel:heroContent:separator:footer:)();
}

uint64_t sub_7775E0()
{
  return type metadata accessor for GameCenterReengagementLayout();
}

uint64_t sub_7775F0()
{
  return GenericDiffablePagePresenter.init(objectGraph:personalizationProvider:sidePackedPage:sidePackedPageRenderMetrics:pageUrl:)();
}

uint64_t sub_777600()
{
  return type metadata accessor for GenericDiffablePagePresenter();
}

uint64_t sub_777610()
{
  return type metadata accessor for IncompleteShelfFetchStrategy();
}

uint64_t sub_777620()
{
  return LockupCollectionSearchResult.detailAction.getter();
}

uint64_t sub_777630()
{
  return LockupCollectionSearchResult.items.getter();
}

uint64_t sub_777640()
{
  return LockupCollectionSearchResult.title.getter();
}

uint64_t sub_777650()
{
  return LockupCollectionSearchResult.heading.getter();
}

uint64_t sub_777660()
{
  return type metadata accessor for LockupCollectionSearchResult();
}

uint64_t sub_777670()
{
  return OnDeviceSearchHistoryManager.fetchRecents(limit:)();
}

void sub_777680()
{
}

uint64_t sub_777690()
{
  return type metadata accessor for OnDeviceSearchHistoryManager();
}

void sub_7776A0()
{
}

uint64_t sub_7776B0()
{
  return ProductDiffablePagePresenter.appPromotionDetailPageAction.getter();
}

uint64_t sub_7776C0()
{
  return ProductDiffablePagePresenter.isOfferButtonHiddenByPresenter.getter();
}

void sub_7776D0()
{
}

uint64_t sub_7776E0()
{
  return ProductDiffablePagePresenter.didChangePageWidth(_:)();
}

uint64_t sub_7776F0()
{
  return type metadata accessor for ProductDiffablePagePresenter.PageWidth();
}

uint64_t sub_777700()
{
  return ProductDiffablePagePresenter.init(objectGraph:pageUrl:sidePackedPage:sidePackedPageRenderMetrics:appStateController:purchaseHistory:restrictions:fullProductFetchedAction:pageWidth:isDownloadingOrderingEnabled:downloadingOrderingTimeout:supportsFastImpressions:advertLifecycleMetricsReporter:referrerData:)();
}

uint64_t sub_777710()
{
  return ProductDiffablePagePresenter.shareAction.getter();
}

uint64_t sub_777720()
{
  return ProductDiffablePagePresenter.didSelectShare(sender:)();
}

uint64_t sub_777730()
{
  return ProductDiffablePagePresenter.offerButtonMode.getter();
}

uint64_t sub_777740()
{
  return ProductDiffablePagePresenter.didSelectDeveloper(sender:)();
}

uint64_t sub_777750()
{
  return ProductDiffablePagePresenter.onScrollToPosition.getter();
}

uint64_t sub_777760()
{
  return ProductDiffablePagePresenter.didSelectExpandMedia(on:sender:)();
}

uint64_t sub_777770()
{
  return ProductDiffablePagePresenter.pageDisappearedAction.getter();
}

uint64_t sub_777780()
{
  return ProductDiffablePagePresenter.titleOfferDisplayProperties.getter();
}

uint64_t sub_777790()
{
  return ProductDiffablePagePresenter.onDownloadingOrderingItemsRemoved.getter();
}

uint64_t sub_7777A0()
{
  return ProductDiffablePagePresenter.adamId.getter();
}

uint64_t sub_7777B0()
{
  return type metadata accessor for ProductDiffablePagePresenter();
}

uint64_t sub_7777C0()
{
  return ReviewsDiffablePagePresenter.init(objectGraph:reviewsPage:preferSelectedActionTitles:)();
}

uint64_t sub_7777D0()
{
  return ReviewsDiffablePagePresenter.showSortSheet(sender:)();
}

uint64_t sub_7777E0()
{
  return ReviewsDiffablePagePresenter.selectedSortOption.getter();
}

uint64_t sub_7777F0()
{
  return ReviewsDiffablePagePresenter.isUpdatingSortOption.getter();
}

uint64_t sub_777800()
{
  return ReviewsDiffablePagePresenter.trailingNavBarAction.getter();
}

uint64_t sub_777810()
{
  return ReviewsDiffablePagePresenter.initialFocusedReviewId.getter();
}

uint64_t sub_777820()
{
  return ReviewsDiffablePagePresenter.title.getter();
}

uint64_t sub_777830()
{
  return type metadata accessor for ReviewsDiffablePagePresenter();
}

uint64_t sub_777840()
{
  return SelectableShelfComponentView.didBecomeSelected(in:asPartOf:)();
}

uint64_t sub_777850()
{
  return TodayCardArcadeLockupOverlay.arcadeLockup.getter();
}

uint64_t sub_777860()
{
  return type metadata accessor for TodayCardArcadeLockupOverlay();
}

uint64_t sub_777870()
{
  return dispatch thunk of TopChartsCategoriesPresenter.hasChildren(at:)();
}

uint64_t sub_777880()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryCount(at:)();
}

uint64_t sub_777890()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryTitle(at:)();
}

uint64_t sub_7778A0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryArtwork(at:)();
}

uint64_t sub_7778B0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.isCategorySelected(at:)();
}

uint64_t sub_7778C0()
{
  return dispatch thunk of TopChartsCategoriesPresenter.selectedCategoryIndexPath.getter();
}

uint64_t sub_7778D0()
{
  return ArcadeSubscriptionStateAction.purchasingAction.getter();
}

uint64_t sub_7778E0()
{
  return ArcadeSubscriptionStateAction.subscribedAction.getter();
}

uint64_t sub_7778F0()
{
  return ArcadeSubscriptionStateAction.notSubscribedAction.getter();
}

uint64_t sub_777900()
{
  return ArcadeSubscriptionStateAction.unknownAction.getter();
}

uint64_t sub_777910()
{
  return BasePageLayoutSectionProvider.init(componentTypeMappingProvider:visibleItemsObserverProviders:componentHeightCache:useEstimatedLayoutSizing:)();
}

uint64_t sub_777920()
{
  return BasePageLayoutSectionProvider.componentTypeMappingProvider.getter();
}

uint64_t sub_777930()
{
  return BasePageLayoutSectionProvider.addSupplementariesAndInsets(to:for:shelfLayoutSpacingProvider:shelfSupplementaryProvider:asPartOf:)();
}

uint64_t sub_777940()
{
  return BasePageLayoutSectionProvider.visibleItemsObserverProviders.getter();
}

uint64_t sub_777950()
{
  return type metadata accessor for BasePageLayoutSectionProvider();
}

uint64_t sub_777960()
{
  return method lookup function for BasePageLayoutSectionProvider();
}

uint64_t sub_777970()
{
  return BasePageLayoutSectionProvider.deinit();
}

uint64_t sub_777980()
{
  return type metadata accessor for DiffablePageContentIdentifier();
}

uint64_t sub_777990()
{
  return DiffablePageContentIdentifier.init(_:)();
}

uint64_t sub_7779A0()
{
  return DynamicViewControllerDelegate.init(subscriptionManager:purchaseSuccessHandler:purchaseFailureHandler:carrierLinkSuccessHandler:carrierLinkFailureHandler:didDismissHandler:contentViewConstructor:)();
}

uint64_t sub_7779B0()
{
  return type metadata accessor for DynamicViewControllerDelegate();
}

uint64_t sub_7779C0()
{
  return GameCenterPlayerProfileAction.init(playerId:actionMetrics:)();
}

uint64_t sub_7779D0()
{
  return GameCenterPlayerProfileAction.playerId.getter();
}

uint64_t sub_7779E0()
{
  return type metadata accessor for GameCenterPlayerProfileAction();
}

uint64_t sub_7779F0()
{
  return ImpressionableSmallPlayerCard.init(id:suggestedFriend:impressionMetrics:)();
}

uint64_t sub_777A00()
{
  return ImpressionableSmallPlayerCard.data.getter();
}

uint64_t sub_777A10()
{
  return type metadata accessor for ImpressionableSmallPlayerCard();
}

uint64_t sub_777A20()
{
  return InlineUnifiedMessagePresenter.actionHandler.setter();
}

uint64_t sub_777A30()
{
  return InlineUnifiedMessagePresenter.inlineViewController(for:)();
}

uint64_t sub_777A40()
{
  return type metadata accessor for InlineUnifiedMessagePresenter();
}

uint64_t sub_777A50()
{
  return static LabelPlaceholderCompatibility.measurements(attributedText:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_777A60()
{
  return static LabelPlaceholderCompatibility.measurements(text:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_777A70()
{
  return static LabelPlaceholderCompatibility.measurements(text:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_777A80()
{
  return LabelPlaceholderCompatibility.measurements(fitting:with:)();
}

uint64_t sub_777A90()
{
  return LabelPlaceholderCompatibility.init(attributedText:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:shouldUseLabelPlaceholder:)();
}

uint64_t sub_777AA0()
{
  return LabelPlaceholderCompatibility.layoutTextView.getter();
}

uint64_t sub_777AB0()
{
  return LabelPlaceholderCompatibility.referableLayoutTextView.getter();
}

uint64_t sub_777AC0()
{
  return LabelPlaceholderCompatibility.init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:shouldUseLabelPlaceholder:)();
}

uint64_t sub_777AD0()
{
  return type metadata accessor for LabelPlaceholderCompatibility();
}

uint64_t sub_777AE0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.applySnapshotUsingReloadData(_:animatingDifferences:completion:)();
}

uint64_t sub_777AF0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModel(for:)();
}

uint64_t sub_777B00()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModel(for:)();
}

uint64_t sub_777B10()
{
  return dispatch thunk of ModelMappedDiffableDataSource.sectionModel(at:)();
}

uint64_t sub_777B20()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModels(in:)();
}

uint64_t sub_777B30()
{
  return dispatch thunk of ModelMappedDiffableDataSource.sectionIndex(for:)();
}

uint64_t sub_777B40()
{
  return ModelMappedDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_777B50()
{
  return dispatch thunk of ModelMappedDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_777B60()
{
  return static OfferButtonPresenterViewTheme.blueColored.getter();
}

uint64_t sub_777B70()
{
  return OfferButtonPresenterViewTheme.environment.getter();
}

uint64_t sub_777B80()
{
  return static OfferButtonPresenterViewTheme.disabled.getter();
}

uint64_t sub_777B90()
{
  return type metadata accessor for OfferButtonPresenterViewTheme();
}

uint64_t sub_777BA0()
{
  return SearchChartsAndCategoriesPage.title.getter();
}

uint64_t sub_777BB0()
{
  return type metadata accessor for SearchChartsAndCategoriesPage();
}

uint64_t sub_777BC0()
{
  return SearchGhostHintMetricsTracker.init()();
}

uint64_t sub_777BD0()
{
  return type metadata accessor for SearchGhostHintMetricsTracker();
}

uint64_t sub_777BE0()
{
  return type metadata accessor for SearchResultCondensedBehavior();
}

uint64_t sub_777BF0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.updateStorefront()();
}

uint64_t sub_777C00()
{
  return static StorefrontPickerPagePresenter.currentStorefront()();
}

uint64_t sub_777C10()
{
  return dispatch thunk of StorefrontPickerPagePresenter.canUpdateStorefront.getter();
}

uint64_t sub_777C20()
{
  return StorefrontPickerPagePresenter.init(objectGraph:impressionsTracker:impressionsCalculator:)();
}

uint64_t sub_777C30()
{
  return dispatch thunk of StorefrontPickerPagePresenter.didSelectCountry(at:)();
}

uint64_t sub_777C40()
{
  return dispatch thunk of StorefrontPickerPagePresenter.didSelectLanguage(at:)();
}

uint64_t sub_777C50()
{
  return dispatch thunk of StorefrontPickerPagePresenter.numberOfCountries.getter();
}

uint64_t sub_777C60()
{
  return dispatch thunk of StorefrontPickerPagePresenter.numberOfLanguages.getter();
}

uint64_t sub_777C70()
{
  return dispatch thunk of StorefrontPickerPagePresenter.selectedCountryIndex.getter();
}

uint64_t sub_777C80()
{
  return dispatch thunk of StorefrontPickerPagePresenter.selectedLanguageIndex.getter();
}

uint64_t sub_777C90()
{
  return dispatch thunk of StorefrontPickerPagePresenter.view.setter();
}

uint64_t sub_777CA0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.country(at:)();
}

uint64_t sub_777CB0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.language(at:for:)();
}

uint64_t sub_777CC0()
{
  return type metadata accessor for StorefrontPickerPagePresenter();
}

uint64_t sub_777CD0(Swift::String a1)
{
  return localizedStringForAdsLanguage(_:)(a1)._countAndFlagsBits;
}

uint64_t sub_777CE0()
{
  return ArcadeButtonNameFieldsProvider.init(arcadeSubscriptionManager:appStateController:)();
}

uint64_t sub_777CF0()
{
  return type metadata accessor for ArcadeButtonNameFieldsProvider();
}

uint64_t sub_777D00()
{
  return BadgeContentKeyRatingFormatted.getter();
}

uint64_t sub_777D10()
{
  return GameCenterDenylistPlayerAction.contactId.getter();
}

uint64_t sub_777D20()
{
  return type metadata accessor for GameCenterDenylistPlayerAction();
}

uint64_t sub_777D30()
{
  return dispatch thunk of PageTitleEffectUpdateProviding.onUpdatePageTitleEffect.getter();
}

uint64_t sub_777D40()
{
  return dispatch thunk of PageTitleEffectUpdateProviding.currentTitleEffect.getter();
}

uint64_t sub_777D50()
{
  return PersonalizationFeedbackRequest.hasDivider.getter();
}

uint64_t sub_777D60()
{
  return PersonalizationFeedbackRequest.description.getter();
}

uint64_t sub_777D70()
{
  return PersonalizationFeedbackRequest.options.getter();
}

uint64_t sub_777D80()
{
  return type metadata accessor for PersonalizationFeedbackRequest();
}

uint64_t sub_777D90()
{
  return PrivacyHeaderSupplementaryItem.bodyText.getter();
}

uint64_t sub_777DA0()
{
  return type metadata accessor for PrivacyHeaderSupplementaryItem();
}

uint64_t sub_777DB0()
{
  return SearchResultsContextCardLayout.Metrics.maxCardWidth.getter();
}

uint64_t sub_777DC0()
{
  return static SearchResultsContextCardLayout.Metrics.standard.getter();
}

uint64_t sub_777DD0()
{
  return type metadata accessor for SearchResultsContextCardLayout.Metrics();
}

uint64_t sub_777DE0()
{
  return SearchResultsContextCardLayout.init(metrics:message:button:)();
}

uint64_t sub_777DF0()
{
  return type metadata accessor for SearchResultsContextCardLayout();
}

uint64_t sub_777E00()
{
  return SearchResultsUnavailableReason.contextCard.getter();
}

uint64_t sub_777E10()
{
  return SearchResultsUnavailableReason.title.getter();
}

uint64_t sub_777E20()
{
  return SearchResultsUnavailableReason.action.getter();
}

uint64_t sub_777E30()
{
  return SearchResultsUnavailableReason.message.getter();
}

uint64_t sub_777E40()
{
  return type metadata accessor for TopChartsDiffablePagePresenter.UpdatePhase();
}

uint64_t sub_777E50()
{
  return TopChartsDiffablePagePresenter.init(objectGraph:pageUrl:sidePackedPage:)();
}

void sub_777E60()
{
}

uint64_t sub_777E70()
{
  return TopChartsDiffablePagePresenter.segmentPresenters.getter();
}

uint64_t sub_777E80()
{
  return TopChartsDiffablePagePresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_777E90()
{
  return TopChartsDiffablePagePresenter.initialSegmentIndex.getter();
}

uint64_t sub_777EA0()
{
  return TopChartsDiffablePagePresenter.onSegmentPresentersUpdated.getter();
}

uint64_t sub_777EB0()
{
  return TopChartsDiffablePagePresenter.onCategoriesButtonTitleChanged.getter();
}

uint64_t sub_777EC0()
{
  return TopChartsDiffablePagePresenter.title.getter();
}

uint64_t sub_777ED0()
{
  return TopChartsDiffablePagePresenter.update(toCategoryAt:)();
}

uint64_t sub_777EE0()
{
  return TopChartsDiffablePagePresenter.pageUrl.getter();
}

uint64_t sub_777EF0()
{
  return type metadata accessor for TopChartsDiffablePagePresenter();
}

uint64_t sub_777F00()
{
  return BootstrapPendingClosuresHandler.hasClosures(pending:)();
}

uint64_t sub_777F10()
{
  return BootstrapPendingClosuresHandler.didComplete(bootstrapPhase:)();
}

uint64_t sub_777F20()
{
  return BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)();
}

uint64_t sub_777F30()
{
  return BootstrapPendingClosuresHandler.init()();
}

uint64_t sub_777F40()
{
  return type metadata accessor for BootstrapPendingClosuresHandler();
}

uint64_t sub_777F50()
{
  return CondensedSearchResultCardLayout.Configuration.headerFont.getter();
}

Swift::Int sub_777F60(UITraitCollection in)
{
  return CondensedSearchResultCardLayout.Configuration.titleNumberOfLines(in:)(in);
}

uint64_t sub_777F70()
{
  return CondensedSearchResultCardLayout.Configuration.headerNumberOfLines.getter();
}

uint64_t sub_777F80()
{
  return CondensedSearchResultCardLayout.Configuration.metrics.getter();
}

uint64_t sub_777F90()
{
  return CondensedSearchResultCardLayout.Configuration.titleFont.getter();
}

uint64_t sub_777FA0()
{
  return type metadata accessor for CondensedSearchResultCardLayout.Configuration();
}

uint64_t sub_777FB0()
{
  return static CondensedSearchResultCardLayout.estimatedSizeForViewButtonInAXLayouts.getter();
}

uint64_t sub_777FC0()
{
  return CondensedSearchResultCardLayout.Metrics.artworkSize.getter();
}

uint64_t sub_777FD0()
{
  return CondensedSearchResultCardLayout.Metrics.titleTextSpace.getter();
}

uint64_t sub_777FE0()
{
  return CondensedSearchResultCardLayout.Metrics.headerTextSpace.getter();
}

uint64_t sub_777FF0()
{
  return CondensedSearchResultCardLayout.Metrics.artworkTopMargin.getter();
}

uint64_t sub_778000()
{
  return CondensedSearchResultCardLayout.Metrics.artworkBottomMargin.getter();
}

uint64_t sub_778010()
{
  return CondensedSearchResultCardLayout.Metrics.artworkAXBottomMargin.getter();
}

uint64_t sub_778020()
{
  return CondensedSearchResultCardLayout.Metrics.titleTextBottomMargin.getter();
}

uint64_t sub_778030()
{
  return CondensedSearchResultCardLayout.Metrics.viewButtonAXTopMargin.getter();
}

uint64_t sub_778040()
{
  return CondensedSearchResultCardLayout.Metrics.overriddingArtworkSize(with:)();
}

uint64_t sub_778050()
{
  return static CondensedSearchResultCardLayout.Metrics.appEvent.getter();
}

uint64_t sub_778060()
{
  return type metadata accessor for CondensedSearchResultCardLayout.Metrics();
}

uint64_t sub_778070()
{
  return CondensedSearchResultCardLayout.init(metrics:artwork:headerText:titleText:viewButton:isTextBaselineAligned:)();
}

uint64_t sub_778080()
{
  return type metadata accessor for CondensedSearchResultCardLayout();
}

void sub_778090()
{
}

uint64_t sub_7780B0()
{
  return FlowPreviewActionsConfiguration.offerActionIndex.getter();
}

uint64_t sub_7780C0()
{
  return FlowPreviewActionsConfiguration.destructiveActionIndex.getter();
}

uint64_t sub_7780D0()
{
  return FlowPreviewActionsConfiguration.offerDisplayProperties.getter();
}

uint64_t sub_7780E0()
{
  return FlowPreviewActionsConfiguration.actions.getter();
}

uint64_t sub_7780F0()
{
  return InstallPageInstallingViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_778100()
{
  return InstallPageInstallingViewLayout.Metrics.init(iconSize:ageRatingMargin:ageRatingBaselineOffset:titleSpace:titleHorizontalMargin:subtitleSpace:subtitleHorizontalMargin:descriptionSpace:descriptionHorizontalMargin:offerButtonMargin:offerButtonSize:bottomSpace:)();
}

uint64_t sub_778110()
{
  return InstallPageInstallingViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_778120()
{
  return type metadata accessor for InstallPageInstallingViewLayout.Metrics();
}

uint64_t sub_778130()
{
  return InstallPageInstallingViewLayout.init(metrics:iconView:progressView:titleText:subtitleText:descriptionText:ageRatingView:offerButton:)();
}

uint64_t sub_778140()
{
  return type metadata accessor for InstallPageInstallingViewLayout();
}

uint64_t sub_778150()
{
  return dispatch thunk of NestedModelImpressionsRecording.stopRecordingNestedImpressions(using:)();
}

uint64_t sub_778160()
{
  return dispatch thunk of NestedModelImpressionsRecording.startRecordingNestedImpressions(for:using:)();
}

uint64_t sub_778170()
{
  return dispatch thunk of NestedModelImpressionsRecording.impressionsCalculator.setter();
}

uint64_t sub_778180()
{
  return NestedModelImpressionsRecording.stopRecordingNestedImpressions(using:)();
}

uint64_t sub_778190()
{
  return NestedModelImpressionsRecording.startRecordingNestedImpressions(for:using:)();
}

uint64_t sub_7781A0()
{
  return ShelfBackgroundGradientLocation.point.getter();
}

uint64_t sub_7781B0()
{
  return type metadata accessor for ShelfBackgroundGradientLocation();
}

uint64_t sub_7781C0()
{
  return SponsoredSearchNativeAdvertData.init(adverts:odmlSuccess:installedStates:)();
}

uint64_t sub_7781D0()
{
  return type metadata accessor for SponsoredSearchNativeAdvertData();
}

uint64_t sub_7781E0()
{
  return TodayCardMarketingLockupOverlay.hideBackground.getter();
}

uint64_t sub_7781F0()
{
  return TodayCardMarketingLockupOverlay.artworkBackgroundColor.getter();
}

uint64_t sub_778200()
{
  return TodayCardMarketingLockupOverlay.lockup.getter();
}

uint64_t sub_778210()
{
  return TodayCardMarketingLockupOverlay.paragraph.getter();
}

uint64_t sub_778220()
{
  return type metadata accessor for TodayCardMarketingLockupOverlay();
}

void sub_778230()
{
}

void sub_778240()
{
}

void sub_778250()
{
}

uint64_t sub_778260()
{
  return AdvertRotationControllerProvider.viewControllerWillRemoveItems(_:asPartOf:)();
}

void sub_778270()
{
}

uint64_t sub_778280()
{
  return AdvertRotationControllerProvider.advertController(for:asPartOf:createIfRequired:)();
}

uint64_t sub_778290()
{
  return AdvertRotationControllerProvider.advertController(for:asPartOf:)();
}

uint64_t sub_7782A0()
{
  return AdvertRotationControllerProvider.init(supportsAdvertRotation:advertLifecycleMetricsReporter:)();
}

void sub_7782B0()
{
}

void sub_7782C0()
{
}

uint64_t sub_7782D0()
{
  return type metadata accessor for AdvertRotationControllerProvider();
}

uint64_t sub_7782E0()
{
  return ArcadeDownloadPackCategoriesPage.categories.getter();
}

uint64_t sub_7782F0()
{
  return ArcadeDownloadPackCategoriesPage.dismissAction.getter();
}

uint64_t sub_778300()
{
  return ArcadeDownloadPackCategoriesPage.primaryAction.getter();
}

uint64_t sub_778310()
{
  return ArcadeDownloadPackCategoriesPage.title.getter();
}

uint64_t sub_778320()
{
  return ArcadeSubscriptionFieldsProvider.init(arcadeSubscriptionManager:)();
}

uint64_t sub_778330()
{
  return type metadata accessor for ArcadeSubscriptionFieldsProvider();
}

uint64_t sub_778340()
{
  return type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition();
}

uint64_t sub_778350()
{
  return BreakoutDetailsDisplayProperties.position.getter();
}

uint64_t sub_778360()
{
  return BreakoutDetailsDisplayProperties.wantsBlur.getter();
}

uint64_t sub_778370()
{
  return type metadata accessor for BreakoutDetailsDisplayProperties();
}

uint64_t sub_778380()
{
  return ReviewSummaryReportConcernAction.sendAction.getter();
}

uint64_t sub_778390()
{
  return ReviewSummaryReportConcernAction.comment.getter();
}

uint64_t sub_7783A0()
{
  return ReviewSummaryReportConcernAction.concerns.getter();
}

uint64_t sub_7783B0()
{
  return type metadata accessor for ReviewSummaryReportConcernAction();
}

uint64_t sub_7783C0()
{
  return SearchFocusDiffablePagePresenter.init(objectGraph:sidePackedPage:supportsFastImpressions:advertLifecycleMetricsReporter:)();
}

uint64_t sub_7783D0()
{
  return type metadata accessor for SearchFocusDiffablePagePresenter();
}

uint64_t sub_7783E0()
{
  return TopChartDiffableSegmentPresenter.shortName.getter();
}

uint64_t sub_7783F0()
{
  return ArcadeDownloadPackSuggestionsPage.suggestions.getter();
}

uint64_t sub_778400()
{
  return ArcadeDownloadPackSuggestionsPage.getAllAction.getter();
}

uint64_t sub_778410()
{
  return ArcadeDownloadPackSuggestionsPage.primaryAction.getter();
}

uint64_t sub_778420()
{
  return ArcadeDownloadPackSuggestionsPage.getAllButtonStyle.getter();
}

uint64_t sub_778430()
{
  return ArcadeDownloadPackSuggestionsPage.primaryActionKind.getter();
}

uint64_t sub_778440()
{
  return ArcadeDownloadPackSuggestionsPage.primaryActionSecondaryTitle.getter();
}

uint64_t sub_778450()
{
  return ArcadeDownloadPackSuggestionsPage.title.getter();
}

uint64_t sub_778460()
{
  return AvatarShowcaseLayoutConfiguration.visibleWidth.getter();
}

uint64_t sub_778470()
{
  return AvatarShowcaseLayoutConfiguration.overlappedWidth.getter();
}

uint64_t sub_778480()
{
  return AvatarShowcaseLayoutConfiguration.width.getter();
}

uint64_t sub_778490()
{
  return AvatarShowcaseLayoutConfiguration.init(width:visibleWidth:)();
}

uint64_t sub_7784A0()
{
  return type metadata accessor for AvatarShowcaseLayoutConfiguration();
}

uint64_t sub_7784B0()
{
  return CompoundItemSupplementaryProvider.init(children:)();
}

uint64_t sub_7784C0()
{
  return type metadata accessor for CompoundItemSupplementaryProvider();
}

void sub_7784D0(UIViewController a1)
{
}

void sub_7784E0(UIViewController a1)
{
}

uint64_t sub_7784F0()
{
  return FloatingUnifiedMessageCoordinator.register(accountButton:with:for:)();
}

uint64_t sub_778500()
{
  return type metadata accessor for FloatingUnifiedMessageCoordinator();
}

uint64_t sub_778510()
{
  return type metadata accessor for ImpressionsAppendixMetricsTracker();
}

uint64_t sub_778520()
{
  return type metadata accessor for OfferButtonPresenterViewAlignment();
}

uint64_t sub_778530()
{
  return ReusableSupplementaryRegistration.init(elementKind:reuseIdentifier:configurationHandler:)();
}

uint64_t sub_778540()
{
  return dispatch thunk of ShelfComponentTypeMappingProvider.componentType(for:asPartOf:)();
}

uint64_t sub_778550()
{
  return static AskToBuyRequestNotificationDetails.notificationName.getter();
}

uint64_t sub_778560()
{
  return static AskToBuyRequestNotificationDetails.adamIdKey.getter();
}

void sub_778570(Swift::OpaquePointer a1)
{
}

uint64_t sub_778580()
{
  return CompoundCollectionElementsObserver.removingChildren(where:)();
}

uint64_t sub_778590()
{
  return CompoundCollectionElementsObserver.addChild(_:)();
}

uint64_t sub_7785A0()
{
  return CompoundCollectionElementsObserver.init(children:)();
}

uint64_t sub_7785B0()
{
  return type metadata accessor for CompoundCollectionElementsObserver();
}

uint64_t sub_7785C0()
{
  return GameCenterFriendRequestCoordinator.onFriendRequestCountDidUpdate.getter();
}

uint64_t sub_7785D0()
{
  return dispatch thunk of GameCenterFriendRequestCoordinator.currentFriendRequestCount.getter();
}

uint64_t sub_7785E0()
{
  return type metadata accessor for GameCenterFriendRequestCoordinator();
}

uint64_t sub_7785F0()
{
  return IndeterminateProgressConfiguration.init(metrics:alignment:theme:)();
}

uint64_t sub_778600()
{
  return type metadata accessor for IndeterminateProgressConfiguration();
}

uint64_t sub_778610()
{
  return MetadataRibbonStarRatingViewLayout.init(starsView:ratingLabelView:metrics:)();
}

uint64_t sub_778620()
{
  return MetadataRibbonStarRatingViewLayout.measurements(fitting:in:)();
}

uint64_t sub_778630()
{
  return MetadataRibbonStarRatingViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_778640()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.withStarSize(_:)();
}

uint64_t sub_778650()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.numberOfStars.getter();
}

uint64_t sub_778660()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.ratingCountLabelLineBreakMode.getter();
}

uint64_t sub_778670()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.ratingCountLabelNumberOfLines.getter();
}

uint64_t sub_778680()
{
  return static MetadataRibbonStarRatingViewLayout.Metrics.standard.getter();
}

uint64_t sub_778690()
{
  return type metadata accessor for MetadataRibbonStarRatingViewLayout.Metrics();
}

uint64_t sub_7786A0()
{
  return type metadata accessor for MetadataRibbonStarRatingViewLayout();
}

void sub_7786B0()
{
}

uint64_t sub_7786C0()
{
  return type metadata accessor for OnDevicePersonalizationDataManager();
}

uint64_t sub_7786D0()
{
  return SearchLandingDiffablePagePresenter.onFocusPageFetched.getter();
}

uint64_t sub_7786E0()
{
  return SearchLandingDiffablePagePresenter.init(objectGraph:supportsFastImpressions:advertLifecycleMetricsReporter:)();
}

uint64_t sub_7786F0()
{
  return type metadata accessor for SearchLandingDiffablePagePresenter();
}

uint64_t sub_778700()
{
  return SearchResultsDiffablePagePresenter.onBeginTrackingGuidedSearchImpressions.getter();
}

uint64_t sub_778710()
{
  return SearchResultsDiffablePagePresenter.onShowNoResults.getter();
}

uint64_t sub_778720()
{
  return SearchResultsDiffablePagePresenter.onDisplayResultsMessage.getter();
}

uint64_t sub_778730()
{
  return SearchResultsDiffablePagePresenter.init(objectGraph:guidedSearchPresenter:facetsPresenter:sponsoredSearchSessionManager:term:searchEntity:origin:source:isNetworkConstrained:spellCheckEnabled:excludedTerms:originatingTerm:guidedSearchTokens:guidedSearchOptimizationTerm:appStateController:impressionsAppendixDataProvider:)();
}

uint64_t sub_778740()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.transparencyLink.getter();
}

uint64_t sub_778750()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.isAutoPlayEnabled.getter();
}

uint64_t sub_778760()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.transparencyLinkIndex(columnCount:)();
}

uint64_t sub_778770()
{
  return SearchResultsDiffablePagePresenter.term.getter();
}

uint64_t sub_778780()
{
  return type metadata accessor for SearchResultsDiffablePagePresenter();
}

uint64_t sub_778790()
{
  return ShelfBasedCollectionViewController.collectionViewCellProvider(indexPath:item:asPartOf:)();
}

uint64_t sub_7787A0()
{
  return ShelfBasedCollectionViewController.supplementaryViewProvider(elementKind:indexPath:asPartOf:)();
}

uint64_t sub_7787B0()
{
  return ShelfBasedCollectionViewController.makeStateStore()();
}

uint64_t sub_7787C0()
{
  return ShelfBasedCollectionViewController.pageGridProvider.getter();
}

uint64_t sub_7787D0()
{
  return ShelfBasedCollectionViewController.itemLayoutContext(at:)();
}

uint64_t sub_7787E0()
{
  return ShelfBasedCollectionViewController.shelfLayoutContext(containing:)();
}

uint64_t sub_7787F0()
{
  return ShelfBasedCollectionViewController.shelfLayoutContext(for:)();
}

uint64_t sub_778800()
{
  return ShelfBasedCollectionViewController.itemSupplementaryProvider.getter();
}

void sub_778810()
{
}

uint64_t sub_778820()
{
  return ShelfBasedCollectionViewController.collectionElementsObserver.getter();
}

uint64_t sub_778830()
{
  return ShelfBasedCollectionViewController.shelfLayoutSpacingProvider.getter();
}

uint64_t sub_778840()
{
  return ShelfBasedCollectionViewController.shelfSupplementaryProvider.getter();
}

uint64_t sub_778850()
{
  return ShelfBasedCollectionViewController.updateGlobalSupplementaries(fitting:)();
}

uint64_t sub_778860()
{
  return ShelfBasedCollectionViewController.shelfComponentTypeMappingProvider.getter();
}

uint64_t sub_778870()
{
  return ShelfBasedCollectionViewController.compositionalLayoutSectionProvider(section:layoutEnvironment:asPartOf:)();
}

uint64_t sub_778880()
{
  return type metadata accessor for TodayCardArtworkSizedLayoutMetrics.LayoutSize();
}

uint64_t sub_778890()
{
  return TodayCardArtworkSizedLayoutMetrics.expandedSize.getter();
}

uint64_t sub_7788A0()
{
  return TodayCardArtworkSizedLayoutMetrics.collapsedSize.getter();
}

uint64_t sub_7788B0()
{
  return TodayCardArtworkSizedLayoutMetrics.sourceCropOverride(for:)();
}

uint64_t sub_7788C0()
{
  return TodayCardArtworkSizedLayoutMetrics.sourceSizeOverride.getter();
}

uint64_t sub_7788D0()
{
  return TodayCardArtworkSizedLayoutMetrics.layout(for:)();
}

uint64_t sub_7788E0()
{
  return type metadata accessor for TodayCardArtworkSizedLayoutMetrics.Priority();
}

uint64_t sub_7788F0()
{
  return static VideoDecoderUnavailableUserInfoKey.playbackId.getter();
}

uint64_t sub_778900()
{
  return static VideoDecoderUnavailableUserInfoKey.error.getter();
}

uint64_t sub_778910()
{
  return static ArcadeDebugSubscriptionStateManager.state.setter();
}

uint64_t sub_778920()
{
  return static ArcadePageScrollToShelfNotification.notificationName.getter();
}

uint64_t sub_778930()
{
  return static ArcadePageScrollToShelfNotification.shelfId.getter();
}

uint64_t sub_778940()
{
  return CondensedAdLockupWithIconBackground.backgroundArtwork.getter();
}

uint64_t sub_778950()
{
  return CondensedAdLockupWithIconBackground.lockup.getter();
}

uint64_t sub_778960()
{
  return type metadata accessor for CondensedAdLockupWithIconBackground();
}

uint64_t sub_778970()
{
  return static PurchaseCompleteNotificationDetails.purchaseKey.getter();
}

uint64_t sub_778980()
{
  return static PurchaseCompleteNotificationDetails.notificationName.getter();
}

uint64_t sub_778990()
{
  return SearchAdsCollectionElementsObserver.init(presenter:advertControllerProvider:)();
}

uint64_t sub_7789A0()
{
  return SearchLandingTrendingDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_7789B0()
{
  return type metadata accessor for SearchLandingTrendingDisplayOptions();
}

uint64_t sub_7789C0()
{
  return type metadata accessor for ShelfHorizontalScrollTargetBehavior();
}

uint64_t sub_7789D0()
{
  return dispatch thunk of AnyReusableSupplementaryRegistration.reconfigureSupplementary(at:in:)();
}

uint64_t sub_7789E0()
{
  return dispatch thunk of static ArtworkPrefetchingShelfComponentView.prefetchArtwork(for:with:asPartOf:)();
}

uint64_t sub_7789F0()
{
  return dispatch thunk of static ArtworkPrefetchingShelfComponentView.sizingForArtworkPrefetch(in:asPartOf:)();
}

uint64_t sub_778A00()
{
  return AutomationCollectionElementsObserver.init()();
}

uint64_t sub_778A10()
{
  return type metadata accessor for AutomationCollectionElementsObserver();
}

uint64_t sub_778A20()
{
  return LinkableTextCollectionViewCellLayout.Metrics.init(textTopSpace:)();
}

uint64_t sub_778A30()
{
  return type metadata accessor for LinkableTextCollectionViewCellLayout.Metrics();
}

uint64_t sub_778A40()
{
  return LinkableTextCollectionViewCellLayout.init(metrics:textLabel:)();
}

uint64_t sub_778A50()
{
  return type metadata accessor for LinkableTextCollectionViewCellLayout();
}

uint64_t sub_778A60()
{
  return type metadata accessor for MetadataRibbonSecondaryViewPlacement();
}

uint64_t sub_778A70()
{
  return PersonalizationFeedbackRequestOption.title.getter();
}

uint64_t sub_778A80()
{
  return PersonalizationFeedbackRequestOption.action.getter();
}

uint64_t sub_778A90()
{
  return static SelectableShelfComponentViewReaction.reapply.getter();
}

uint64_t sub_778AA0()
{
  return static SelectableShelfComponentViewReaction.deselect.getter();
}

uint64_t sub_778AB0()
{
  return static SelectableShelfComponentViewReaction.propagate.getter();
}

uint64_t sub_778AC0()
{
  return type metadata accessor for SelectableShelfComponentViewReaction();
}

uint64_t sub_778AD0()
{
  return dispatch thunk of static SeparatorProvidingShelfComponentView.separator(in:)();
}

uint64_t sub_778AE0()
{
  return type metadata accessor for UserNotificationsAuthorizationAction();
}

uint64_t sub_778AF0()
{
  return ImpressionsCollectionElementsObserver.init(componentTypeMappingProvider:impressionsCalculator:)();
}

uint64_t sub_778B00()
{
  return type metadata accessor for ImpressionsCollectionElementsObserver();
}

uint64_t sub_778B10()
{
  return MetadataRibbonEditorsChoiceViewLayout.init(leadingLaurelView:trailingLaurelView:textLabel:metrics:)();
}

uint64_t sub_778B20()
{
  return MetadataRibbonEditorsChoiceViewLayout.measurements(fitting:in:)();
}

uint64_t sub_778B30()
{
  return MetadataRibbonEditorsChoiceViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_778B40()
{
  return static MetadataRibbonEditorsChoiceViewLayout.Metrics.standard.getter();
}

uint64_t sub_778B50()
{
  return type metadata accessor for MetadataRibbonEditorsChoiceViewLayout.Metrics();
}

uint64_t sub_778B60()
{
  return type metadata accessor for MetadataRibbonEditorsChoiceViewLayout();
}

uint64_t sub_778B70()
{
  return MetadataRibbonIconWithLabelViewLayout.init(descriptionLabelView:artworkView:metrics:)();
}

uint64_t sub_778B80()
{
  return MetadataRibbonIconWithLabelViewLayout.measurements(fitting:in:)();
}

uint64_t sub_778B90()
{
  return MetadataRibbonIconWithLabelViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_778BA0()
{
  return MetadataRibbonIconWithLabelViewLayout.Metrics.labelNumberOfLines.getter();
}

uint64_t sub_778BB0()
{
  return MetadataRibbonIconWithLabelViewLayout.Metrics.defaultArtworkHeight.getter();
}

uint64_t sub_778BC0()
{
  return static MetadataRibbonIconWithLabelViewLayout.Metrics.standard.getter();
}

uint64_t sub_778BD0()
{
  return static MetadataRibbonIconWithLabelViewLayout.Metrics.developer.getter();
}

uint64_t sub_778BE0()
{
  return type metadata accessor for MetadataRibbonIconWithLabelViewLayout.Metrics();
}

uint64_t sub_778BF0()
{
  return type metadata accessor for MetadataRibbonIconWithLabelViewLayout();
}

uint64_t sub_778C00()
{
  return type metadata accessor for ShelfBackgroundMaterialGradientColors();
}

uint64_t sub_778C10()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.facetsPresenter.getter();
}

uint64_t sub_778C20()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.init(objectGraph:pageUrl:facetsPresenter:metricsPipeline:)();
}

uint64_t sub_778C30()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.displayStyle.getter();
}

uint64_t sub_778C40()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData.title.getter();
}

uint64_t sub_778C50()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData.subtitle.getter();
}

uint64_t sub_778C60()
{
  return type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData();
}

uint64_t sub_778C70()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.onShowEmptyState.getter();
}

void sub_778C80()
{
}

void sub_778C90()
{
}

void sub_778CA0()
{
}

uint64_t sub_778CB0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_778CC0()
{
  return type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter();
}

uint64_t sub_778CD0()
{
  return ArcadeSubscriptionOfferButtonPresenter.init(displayProperties:buttonAction:subscribedButtonAction:subtitlePosition:asPartOf:alignment:)();
}

uint64_t sub_778CE0()
{
  return type metadata accessor for ArcadeSubscriptionOfferButtonPresenter();
}

uint64_t sub_778CF0()
{
  return dispatch thunk of InlineUnifiedMessageProvidingPresenter.inlineUnifiedMessagePresenter.getter();
}

uint64_t sub_778D00()
{
  return SearchFocusTwoColumnListDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_778D10()
{
  return type metadata accessor for SearchFocusTwoColumnListDisplayOptions();
}

uint64_t sub_778D20()
{
  return static StandardSearchResultContentViewMetrics.bottomMargin.getter();
}

uint64_t sub_778D30()
{
  return BadgeContentKeyNumberOfAvatarsToDisplay.getter();
}

uint64_t sub_778D40()
{
  return MediumAdLockupWithScreenshotsBackground.riverSpeed.getter();
}

uint64_t sub_778D50()
{
  return MediumAdLockupWithScreenshotsBackground.screenshots.getter();
}

uint64_t sub_778D60()
{
  return MediumAdLockupWithScreenshotsBackground.backgroundColor.getter();
}

uint64_t sub_778D70()
{
  return MediumAdLockupWithScreenshotsBackground.secondaryTextColor.getter();
}

uint64_t sub_778D80()
{
  return MediumAdLockupWithScreenshotsBackground.lockup.getter();
}

uint64_t sub_778D90()
{
  return type metadata accessor for MediumAdLockupWithScreenshotsBackground();
}

uint64_t sub_778DA0()
{
  return MetadataRibbonHighlightedTextViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_778DB0()
{
  return MetadataRibbonHighlightedTextViewLayout.measurements(fitting:in:)();
}

uint64_t sub_778DC0()
{
  return MetadataRibbonHighlightedTextViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_778DD0()
{
  return MetadataRibbonHighlightedTextViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_778DE0()
{
  return MetadataRibbonHighlightedTextViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_778DF0()
{
  return type metadata accessor for MetadataRibbonHighlightedTextViewLayout.Metrics();
}

uint64_t sub_778E00()
{
  return type metadata accessor for MetadataRibbonHighlightedTextViewLayout();
}

uint64_t sub_778E10()
{
  return Box.read<A>(with:)();
}

uint64_t sub_778E20()
{
  return Box.init(value:)();
}

uint64_t sub_778E30()
{
  return Box.write(with:)();
}

uint64_t sub_778E40()
{
  return ArtworkLoadingCollectionElementsObserver.init(componentTypeMappingProvider:)();
}

uint64_t sub_778E50()
{
  return type metadata accessor for ArtworkLoadingCollectionElementsObserver();
}

uint64_t sub_778E60()
{
  return PersonalizationTransparencyPagePresenter.init(objectGraph:)();
}

uint64_t sub_778E70()
{
  return dispatch thunk of PersonalizationTransparencyPagePresenter.view.setter();
}

uint64_t sub_778E80()
{
  return type metadata accessor for PersonalizationTransparencyPagePresenter();
}

uint64_t sub_778E90()
{
  return UpdateGranularNotificationSettingsAction.init(settingIDs:)();
}

uint64_t sub_778EA0()
{
  return UpdateGranularNotificationSettingsAction.settingIDs.getter();
}

uint64_t sub_778EB0()
{
  return type metadata accessor for UpdateGranularNotificationSettingsAction();
}

uint64_t sub_778EC0()
{
  return ArcadeDownloadPackCategoriesPagePresenter.init(objectGraph:subscriptionStatus:)();
}

uint64_t sub_778ED0()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapSkipButton()();
}

uint64_t sub_778EE0()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapContinueButton()();
}

uint64_t sub_778EF0()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.view.setter();
}

uint64_t sub_778F00()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.toggle(category:)();
}

uint64_t sub_778F10()
{
  return type metadata accessor for ArcadeDownloadPackCategoriesPagePresenter();
}

uint64_t sub_778F20()
{
  return TodayCardMediaMediumLockupWithScreenshots.mediumAdLockupWithScreenshotsBackground.getter();
}

uint64_t sub_778F30()
{
  return type metadata accessor for TodayCardMediaMediumLockupWithScreenshots();
}

uint64_t sub_778F40()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.hasAskToBuy.getter();
}

uint64_t sub_778F50()
{
  return ArcadeDownloadPackSuggestionsPagePresenter.init(objectGraph:categories:subscriptionStatus:)();
}

uint64_t sub_778F60()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapDoneButton()();
}

uint64_t sub_778F70()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapGetAllButton()();
}

uint64_t sub_778F80()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.page.getter();
}

uint64_t sub_778F90()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.view.setter();
}

uint64_t sub_778FA0()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPagePresenter();
}

uint64_t sub_778FB0()
{
  return NestedCollectionViewImpressionsCoordinator.init(collectionView:)();
}

uint64_t sub_778FC0()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.prepareForReuse()();
}

uint64_t sub_778FD0()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.impressionsCalculator.setter();
}

uint64_t sub_778FE0()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.models.setter();
}

uint64_t sub_778FF0()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.register(for:at:)();
}

uint64_t sub_779000()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.register(model:for:)();
}

uint64_t sub_779010()
{
  return type metadata accessor for NestedCollectionViewImpressionsCoordinator();
}

uint64_t sub_779020()
{
  return SelectionHandlerCollectionElementsObserver.init(presenter:componentHeightCache:)();
}

uint64_t sub_779030()
{
  return type metadata accessor for SelectionHandlerCollectionElementsObserver();
}

uint64_t sub_779040()
{
  return method lookup function for SelectionHandlerCollectionElementsObserver();
}

uint64_t sub_779050()
{
  return SelectionHandlerCollectionElementsObserver.deinit();
}

uint64_t sub_779060()
{
  return SearchImpressionsCollectionElementsObserver.init(componentTypeMappingProvider:impressionsCalculator:advertRotationControllerProvider:objectGraph:collectionView:)();
}

uint64_t sub_779070()
{
  return type metadata accessor for SearchImpressionsCollectionElementsObserver();
}

uint64_t sub_779080()
{
  return UnimplementedAdvertLifecycleMetricsReporter.init()();
}

uint64_t sub_779090()
{
  return type metadata accessor for UnimplementedAdvertLifecycleMetricsReporter();
}

uint64_t sub_7790A0()
{
  return VideoRegistrationCollectionElementsObserver.init()();
}

uint64_t sub_7790B0()
{
  return type metadata accessor for VideoRegistrationCollectionElementsObserver();
}

uint64_t sub_7790C0()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.measurements(fitting:in:)();
}

uint64_t sub_7790D0()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_7790E0()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.Metrics.artworkSize.getter();
}

uint64_t sub_7790F0()
{
  return type metadata accessor for ChartOrCategoryBrickCollectionViewCellLayout.Metrics();
}

uint64_t sub_779100()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.init(context:badgeTextView:titleTextView:artworkView:textExclusionRect:)();
}

uint64_t sub_779110()
{
  return type metadata accessor for ChartOrCategoryBrickCollectionViewCellLayout();
}

uint64_t sub_779120()
{
  return dispatch thunk of ComponentContainerCollectionElementsObserver.ContainerDelegate.modelContainment.getter();
}

uint64_t sub_779130()
{
  return ComponentContainerCollectionElementsObserver.ContainerDelegate.itemLayoutContext.getter();
}

uint64_t sub_779140()
{
  return dispatch thunk of ComponentContainerCollectionElementsObserver.ContainerDelegate.indexPath(ofItem:)();
}

uint64_t sub_779150()
{
  return ComponentContainerCollectionElementsObserver.init(presenter:parent:scrollObserver:impressionsCalculator:)();
}

uint64_t sub_779160()
{
  return type metadata accessor for ComponentContainerCollectionElementsObserver();
}

uint64_t sub_779170()
{
  return ModelMappedDiffableDataSourceContentSnapshot.identifierSnapshot.getter();
}

uint64_t sub_779180()
{
  return ModelMappedDiffableDataSourceContentSnapshot.itemModel(for:)();
}

uint64_t sub_779190()
{
  return ModelMappedDiffableDataSourceContentSnapshot.sectionModel(at:)();
}

uint64_t sub_7791A0()
{
  return ModelMappedDiffableDataSourceContentSnapshot.reloadedItems.getter();
}

uint64_t sub_7791B0()
{
  return UnimplementedAdvertInteractionMetricsReporter.init()();
}

uint64_t sub_7791C0()
{
  return type metadata accessor for UnimplementedAdvertInteractionMetricsReporter();
}

uint64_t sub_7791D0()
{
  return BadgeContentKeyNumberOfFriendsBeforeTruncation.getter();
}

uint64_t sub_7791E0()
{
  return InlineUnifiedMessageCollectionElementsObserver.init(presenter:parentViewController:)();
}

uint64_t sub_7791F0()
{
  return type metadata accessor for InlineUnifiedMessageCollectionElementsObserver();
}

uint64_t sub_779200()
{
  return SearchChartsAndCategoriesDiffablePagePresenter.columnCount.getter();
}

uint64_t sub_779210()
{
  return SearchChartsAndCategoriesDiffablePagePresenter.init(objectGraph:pageUrl:)();
}

void sub_779220(Swift::String a1)
{
}

uint64_t sub_779230()
{
  return type metadata accessor for SearchChartsAndCategoriesDiffablePagePresenter();
}

uint64_t sub_779240()
{
  return SearchLandingChartsAndCategoriesDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_779250()
{
  return type metadata accessor for SearchLandingChartsAndCategoriesDisplayOptions();
}

uint64_t sub_779260()
{
  return ShelfBasedCollectionViewControllerDependencies.init()();
}

uint64_t sub_779270()
{
  return type metadata accessor for ShelfBasedCollectionViewControllerDependencies();
}

uint64_t sub_779280()
{
  return OnDemandShelfFetchingCollectionElementsObserver.init(presenter:)();
}

uint64_t sub_779290()
{
  return type metadata accessor for OnDemandShelfFetchingCollectionElementsObserver();
}

uint64_t sub_7792A0()
{
  return Uber.iconArtwork.getter();
}

uint64_t sub_7792B0()
{
  return Uber.compactArtwork.getter();
}

uint64_t sub_7792C0()
{
  return type metadata accessor for Uber.Style();
}

uint64_t sub_7792D0()
{
  return Uber.init(style:assetType:artwork:compactArtwork:video:compactVideo:iconArtwork:title:)();
}

uint64_t sub_7792E0()
{
  return Uber.style.getter();
}

uint64_t sub_7792F0()
{
  return Uber.title.getter();
}

uint64_t sub_779300()
{
  return Uber.video.getter();
}

uint64_t sub_779310()
{
  return Uber.artwork.getter();
}

uint64_t sub_779320()
{
  return type metadata accessor for Uber.AssetType();
}

uint64_t sub_779330()
{
  return Uber.assetType.getter();
}

uint64_t sub_779340()
{
  return type metadata accessor for Uber();
}

uint64_t sub_779350()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.countTitle.getter();
}

uint64_t sub_779360()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.primaryButtonEnabled.getter();
}

uint64_t sub_779370()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.categorySelectionEnabled.getter();
}

uint64_t sub_779380()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle();
}

uint64_t sub_779390()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPagePrimaryActionKind();
}

uint64_t sub_7793A0()
{
  return PlayableViewRegistrationCollectionElementsObserver.init()();
}

uint64_t sub_7793B0()
{
  return type metadata accessor for PlayableViewRegistrationCollectionElementsObserver();
}

uint64_t sub_7793C0()
{
  return dispatch thunk of VisibleShelfSupplementaryCollectionElementsObserver.reconfigureVisibleShelfSupplementaries<A>(in:asPartOf:)();
}

uint64_t sub_7793D0()
{
  return VisibleShelfSupplementaryCollectionElementsObserver.init()();
}

uint64_t sub_7793E0()
{
  return type metadata accessor for VisibleShelfSupplementaryCollectionElementsObserver();
}

uint64_t sub_7793F0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.init(borderedTextView:descriptionLabelTextView:metrics:)();
}

uint64_t sub_779400()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.measurements(fitting:in:)();
}

uint64_t sub_779410()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_779420()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.init(borderTextToLabelPadding:maximumNumberofLinesForDescriptionLabel:maximumNumberOfLinesForBorderedLabel:)();
}

uint64_t sub_779430()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.maximumNumberOfLinesForBorderedLabel.getter();
}

uint64_t sub_779440()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_779450()
{
  return type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics();
}

uint64_t sub_779460()
{
  return type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout();
}

uint64_t sub_779470()
{
  return Badge.clickAction.getter();
}

uint64_t sub_779480()
{
  return Badge.longCaption.getter();
}

uint64_t sub_779490()
{
  return Badge.isMonochrome.getter();
}

uint64_t sub_7794A0()
{
  return Badge.leadingValue.getter();
}

uint64_t sub_7794B0()
{
  return dispatch thunk of Badge.isTruncatable.getter();
}

uint64_t sub_7794C0()
{
  return Badge.impressionMetrics.getter();
}

uint64_t sub_7794D0()
{
  return Badge.accessibilityTitle.getter();
}

uint64_t sub_7794E0()
{
  return Badge.accessibilityCaption.getter();
}

uint64_t sub_7794F0()
{
  return dispatch thunk of Badge.accessibilityIdentifier.getter();
}

uint64_t sub_779500()
{
  return Badge.init(id:type:heading:caption:longCaption:content:leadingValue:style:accessibilityTitle:accessibilityCaption:clickAction:artwork:trailingArtwork:isMonochrome:impressionMetrics:)();
}

uint64_t sub_779510()
{
  return Badge.id.getter();
}

uint64_t sub_779520()
{
  return Badge.type.getter();
}

uint64_t sub_779530()
{
  return Badge.style.getter();
}

uint64_t sub_779540()
{
  return Badge.artwork.getter();
}

uint64_t sub_779550()
{
  return Badge.caption.getter();
}

uint64_t sub_779560()
{
  return Badge.content.getter();
}

uint64_t sub_779570()
{
  return Badge.heading.getter();
}

uint64_t sub_779580()
{
  return type metadata accessor for Badge();
}

uint64_t sub_779590()
{
  return Brick.accessibilityLabel.getter();
}

uint64_t sub_7795A0()
{
  return Brick.shortEditorialDescription.getter();
}

uint64_t sub_7795B0()
{
  return type metadata accessor for Brick();
}

uint64_t sub_7795C0()
{
  return Quote.isFullWidthArtwork.getter();
}

uint64_t sub_7795D0()
{
  return Quote.text.getter();
}

uint64_t sub_7795E0()
{
  return Quote.credit.getter();
}

uint64_t sub_7795F0()
{
  return Quote.artwork.getter();
}

uint64_t sub_779600()
{
  return type metadata accessor for Quote();
}

uint64_t sub_779610()
{
  return Shelf.background.getter();
}

uint64_t sub_779620()
{
  return Shelf.ContentType.doesModelContainment.getter();
}

uint64_t sub_779630()
{
  return Shelf.ContentType.string.getter();
}

uint64_t sub_779640()
{
  return Shelf.ContentType.rawValue.getter();
}

uint64_t sub_779650()
{
  return type metadata accessor for Shelf.ContentType();
}

uint64_t sub_779660()
{
  return Shelf.contentType.getter();
}

uint64_t sub_779670()
{
  return Shelf.footerTitle.getter();
}

uint64_t sub_779680()
{
  return Shelf.isHorizontal.getter();
}

uint64_t sub_779690()
{
  return Shelf.seeAllAction.getter();
}

uint64_t sub_7796A0()
{
  return Shelf.titleArtwork.getter();
}

uint64_t sub_7796B0()
{
  return Shelf.rowsPerColumn.getter();
}

uint64_t sub_7796C0()
{
  return Shelf.eyebrowArtwork.getter();
}

uint64_t sub_7796D0()
{
  return Shelf.accessoryAction.getter();
}

uint64_t sub_7796E0()
{
  return Shelf.trailingArtwork.getter();
}

uint64_t sub_7796F0()
{
  return type metadata accessor for Shelf.ContentsMetadata();
}

uint64_t sub_779700()
{
  return Shelf.contentsMetadata.getter();
}

uint64_t sub_779710()
{
  return static Shelf.PresentationHints.isSeeAllContext.getter();
}

uint64_t sub_779720()
{
  return static Shelf.PresentationHints.isAppleArcadeContext.getter();
}

uint64_t sub_779730()
{
  return static Shelf.PresentationHints.showSupplementaryText.getter();
}

uint64_t sub_779740()
{
  return static Shelf.PresentationHints.inProductPageSpotlight.getter();
}

uint64_t sub_779750()
{
  return static Shelf.PresentationHints.accessoriesFollowBackground.getter();
}

uint64_t sub_779760()
{
  return static Shelf.PresentationHints.sortable.getter();
}

uint64_t sub_779770()
{
  return type metadata accessor for Shelf.PresentationHints();
}

uint64_t sub_779780()
{
  return Shelf.impressionMetrics.getter();
}

uint64_t sub_779790()
{
  return Shelf.presentationHints.getter();
}

uint64_t sub_7797A0()
{
  return Shelf.prefetchableArtwork.getter();
}

uint64_t sub_7797B0()
{
  return Shelf.placeholderContentType.getter();
}

uint64_t sub_7797C0()
{
  return Shelf.init(id:contentType:placeholderContentType:marker:items:header:url:mergeWhenFetched:batchGroup:fetchStrategy:footerTitle:footerAction:isHidden:isHorizontal:horizontalScrollTargetBehavior:isPersonalized:rowsPerColumn:background:onShouldRemoveModel:removeModelEvents:presentationHints:contentsMetadata:nextPreferredContentRefreshDate:impressionMetrics:refreshUrl:pageChangeMetrics:adIncidents:)();
}

uint64_t sub_7797D0()
{
  return Shelf.id.getter();
}

uint64_t sub_7797E0()
{
  return Shelf.items.getter();
}

uint64_t sub_7797F0()
{
  return Shelf.title.getter();
}

uint64_t sub_779800()
{
  return Shelf.header.getter();
}

uint64_t sub_779810()
{
  return Shelf.eyebrow.getter();
}

uint64_t sub_779820()
{
  return Shelf.isHidden.getter();
}

uint64_t sub_779830()
{
  return Shelf.subtitle.getter();
}

uint64_t sub_779840()
{
  return type metadata accessor for Shelf();
}

uint64_t sub_779850()
{
  return Video.playbackId.getter();
}

uint64_t sub_779860()
{
  return Video.allowsAutoPlay.getter();
}

uint64_t sub_779870()
{
  return Video.playbackControls.getter();
}

uint64_t sub_779880()
{
  return Video.canPlayFullScreen.getter();
}

uint64_t sub_779890()
{
  return Video.templateClickEvent.getter();
}

uint64_t sub_7798A0()
{
  return Video.templateMediaEvent.getter();
}

uint64_t sub_7798B0()
{
  return Video.autoPlayPlaybackControls.getter();
}

uint64_t sub_7798C0()
{
  return Video.looping.getter();
}

uint64_t sub_7798D0()
{
  return Video.preview.getter();
}

uint64_t sub_7798E0()
{
  return Video.videoUrl.getter();
}

uint64_t sub_7798F0()
{
  return type metadata accessor for Video();
}

uint64_t sub_779900()
{
  return dispatch thunk of Action.clickSender.getter();
}

uint64_t sub_779910()
{
  return dispatch thunk of Action.clickSender.setter();
}

uint64_t sub_779920()
{
  return Action.actionMetrics.getter();
}

uint64_t sub_779930()
{
  return Action.impressionMetrics.getter();
}

uint64_t sub_779940()
{
  return Action.presentationStyle.getter();
}

uint64_t sub_779950()
{
  return Action.init(id:title:artwork:presentationStyle:actionMetrics:impressionMetrics:)();
}

uint64_t sub_779960()
{
  return Action.id.getter();
}

uint64_t sub_779970()
{
  return Action.title.getter();
}

uint64_t sub_779980()
{
  return Action.artwork.getter();
}

uint64_t sub_779990()
{
  return type metadata accessor for Action();
}

uint64_t sub_7799A0()
{
  return AdamId.numberValue.getter();
}

uint64_t sub_7799B0()
{
  return AdamId.stringValue.getter();
}

uint64_t sub_7799C0()
{
  return static AdamId.== infix(_:_:)();
}

uint64_t sub_7799D0()
{
  return AdamId.init(value:)();
}

uint64_t sub_7799E0()
{
  return AdamId.init(value:)();
}

uint64_t sub_7799F0()
{
  return AdamId.init(value:)();
}

uint64_t sub_779A00()
{
  return type metadata accessor for AdamId();
}

uint64_t sub_779A10()
{
  return Banner.hideCriteria.getter();
}

uint64_t sub_779A20()
{
  return Banner.leadingArtwork.getter();
}

uint64_t sub_779A30()
{
  return Banner.includeBackgroundBorder.getter();
}

uint64_t sub_779A40()
{
  return Banner.leadingArtworkTintColor.getter();
}

uint64_t sub_779A50()
{
  return Banner.action.getter();
}

uint64_t sub_779A60()
{
  return Banner.message.getter();
}

uint64_t sub_779A70()
{
  return type metadata accessor for Banner();
}

uint64_t sub_779A80()
{
  return Lockup.clickAction.getter();
}

uint64_t sub_779A90()
{
  return dispatch thunk of Lockup.clickSender.getter();
}

uint64_t sub_779AA0()
{
  return dispatch thunk of Lockup.decorations.getter();
}

uint64_t sub_779AB0()
{
  return Lockup.ratingCount.getter();
}

uint64_t sub_779AC0()
{
  return Lockup.buttonAction.getter();
}

uint64_t sub_779AD0()
{
  return Lockup.useAdsLocale.getter();
}

uint64_t sub_779AE0()
{
  return Lockup.tertiaryTitle.getter();
}

uint64_t sub_779AF0()
{
  return Lockup.crossLinkTitle.getter();
}

uint64_t sub_779B00()
{
  return Lockup.contextMenuData.getter();
}

uint64_t sub_779B10()
{
  return Lockup.includeBetaApps.getter();
}

uint64_t sub_779B20()
{
  return Lockup.isEditorsChoice.getter();
}

uint64_t sub_779B30()
{
  return Lockup.developerTagline.getter();
}

uint64_t sub_779B40()
{
  return Lockup.editorialTagline.getter();
}

uint64_t sub_779B50()
{
  return Lockup.crossLinkSubtitle.getter();
}

uint64_t sub_779B60()
{
  return Lockup.impressionMetrics.getter();
}

uint64_t sub_779B70()
{
  return Lockup.subtitleTextColor.getter();
}

uint64_t sub_779B80()
{
  return Lockup.subtitleTextFilter.getter();
}

uint64_t sub_779B90()
{
  return Lockup.editorialDescription.getter();
}

uint64_t sub_779BA0()
{
  return Lockup.offerDisplayProperties.getter();
}

uint64_t sub_779BB0()
{
  return Lockup.shortEditorialDescription.getter();
}

uint64_t sub_779BC0()
{
  return Lockup.icon.getter();
}

uint64_t sub_779BD0()
{
  return Lockup.title.getter();
}

uint64_t sub_779BE0()
{
  return Lockup.adamId.getter();
}

uint64_t sub_779BF0()
{
  return Lockup.rating.getter();
}

uint64_t sub_779C00()
{
  return dispatch thunk of Lockup.artwork.getter();
}

uint64_t sub_779C10()
{
  return Lockup.heading.getter();
}

uint64_t sub_779C20()
{
  return Lockup.ordinal.getter();
}

uint64_t sub_779C30()
{
  return Lockup.bundleId.getter();
}

uint64_t sub_779C40()
{
  return Lockup.children.getter();
}

uint64_t sub_779C50()
{
  return Lockup.searchAd.getter();
}

uint64_t sub_779C60()
{
  return Lockup.subtitle.getter();
}

uint64_t sub_779C70()
{
  return Lockup.ageRating.getter();
}

uint64_t sub_779C80()
{
  return type metadata accessor for Lockup();
}

uint64_t sub_779C90()
{
  return Review.moreAction.getter();
}

uint64_t sub_779CA0()
{
  return Review.reviewerName.getter();
}

uint64_t sub_779CB0()
{
  return Review.dateAuthorText.getter();
}

uint64_t sub_779CC0()
{
  return Review.init(id:title:date:dateText:badge:contents:rating:reviewerName:dateAuthorText:response:moreAction:flowPreviewActionsConfiguration:impressionMetrics:voteActions:)();
}

uint64_t sub_779CD0()
{
  return Review.id.getter();
}

uint64_t sub_779CE0()
{
  return Review.title.getter();
}

uint64_t sub_779CF0()
{
  return Review.rating.getter();
}

uint64_t sub_779D00()
{
  return Review.contents.getter();
}

uint64_t sub_779D10()
{
  return Review.dateText.getter();
}

uint64_t sub_779D20()
{
  return Review.response.getter();
}

uint64_t sub_779D30()
{
  return type metadata accessor for Review();
}

uint64_t sub_779D40()
{
  return Shadow.blurRadius.getter();
}

uint64_t sub_779D50()
{
  return Shadow.init(color:blurRadius:offset:)();
}

uint64_t sub_779D60()
{
  return Shadow.color.getter();
}

uint64_t sub_779D70()
{
  return Shadow.offset.getter();
}

uint64_t sub_779D80()
{
  return type metadata accessor for Shadow();
}

uint64_t sub_779D90()
{
  return inject(_:from:)();
}

uint64_t sub_779DA0()
{
  return inject(_:from:)();
}

uint64_t sub_779DB0()
{
  return inject(_:from:)();
}

uint64_t sub_779DC0()
{
  return inject(_:from:)();
}

uint64_t sub_779DD0()
{
  return inject(_:from:)();
}

uint64_t sub_779DE0()
{
  return inject(_:from:)();
}

uint64_t sub_779DF0()
{
  return inject(_:from:)();
}

uint64_t sub_779E00()
{
  return inject(_:from:)();
}

uint64_t sub_779E10()
{
  return inject(_:from:)();
}

uint64_t sub_779E20()
{
  return inject(_:from:)();
}

uint64_t sub_779E30()
{
  return dispatch thunk of Artwork.isPortrait.getter();
}

uint64_t sub_779E40()
{
  return Artwork.URLTemplate.isSystemImage.getter();
}

uint64_t sub_779E50()
{
  return static Artwork.URLTemplate.resourceScheme.getter();
}

uint64_t sub_779E60()
{
  return Artwork.URLTemplate.init(rawValue:)();
}

uint64_t sub_779E70()
{
  return Artwork.URLTemplate.rawValue.getter();
}

uint64_t sub_779E80()
{
  return type metadata accessor for Artwork.URLTemplate();
}

uint64_t sub_779E90()
{
  return dispatch thunk of Artwork.bestVariant(prefersLayeredImage:)();
}

uint64_t sub_779EA0()
{
  return Artwork.contentMode.getter();
}

uint64_t sub_779EB0()
{
  return dispatch thunk of Artwork.isLandscape.getter();
}

uint64_t sub_779EC0()
{
  return dispatch thunk of Artwork.isLocalImage.getter();
}

uint64_t sub_779ED0()
{
  return dispatch thunk of Artwork.isBundleImage.getter();
}

uint64_t sub_779EE0()
{
  return dispatch thunk of Artwork.isSystemImage.getter();
}

uint64_t sub_779EF0()
{
  return Artwork.backgroundColor.getter();
}

uint64_t sub_779F00()
{
  return dispatch thunk of Artwork.systemImageName.getter();
}

uint64_t sub_779F10()
{
  return Artwork.backgroundGradientColor.getter();
}

uint64_t sub_779F20()
{
  return dispatch thunk of Artwork.symbolImageMeasurements(using:fallBackSize:)();
}

uint64_t sub_779F30()
{
  return static Artwork.== infix(_:_:)();
}

uint64_t sub_779F40()
{
  return dispatch thunk of Artwork.__allocating_init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)();
}

uint64_t sub_779F50()
{
  return static Artwork.Crop.sourceSize.getter();
}

uint64_t sub_779F60()
{
  return static Artwork.Crop.boundingBox.getter();
}

uint64_t sub_779F70()
{
  return Artwork.Crop.preferredContentMode.getter();
}

uint64_t sub_779F80()
{
  return static Artwork.Crop.fn.getter();
}

uint64_t sub_779F90()
{
  return type metadata accessor for Artwork.Crop();
}

uint64_t sub_779FA0()
{
  return Artwork.crop.getter();
}

uint64_t sub_779FB0()
{
  return Artwork.size.getter();
}

uint64_t sub_779FC0()
{
  return Artwork.Style.cornerStyle.getter();
}

uint64_t sub_779FD0()
{
  return Artwork.Style.iconHeight(fromWidth:)();
}

uint64_t sub_779FE0()
{
  return Artwork.Style.orIfUnspecified(_:)();
}

uint64_t sub_779FF0()
{
  return Artwork.Style.iconCornerRadius(for:)();
}

uint64_t sub_77A000()
{
  return Artwork.Style.iconWidth(fromHeight:)();
}

uint64_t sub_77A010()
{
  return type metadata accessor for Artwork.Style();
}

uint64_t sub_77A020()
{
  return Artwork.style.getter();
}

uint64_t sub_77A030()
{
  return type metadata accessor for Artwork.Format();
}

uint64_t sub_77A040()
{
  return Artwork.config(using:cropCodeOverride:prefersLayeredImage:)();
}

uint64_t sub_77A050()
{
  return Artwork.config(using:)();
}

uint64_t sub_77A060()
{
  return Artwork.config(_:mode:prefersLayeredImage:)();
}

uint64_t sub_77A070()
{
  return Artwork.Variant.format.getter();
}

uint64_t sub_77A080()
{
  return Artwork.Variant.quality.getter();
}

uint64_t sub_77A090()
{
  return type metadata accessor for Artwork.Variant();
}

uint64_t sub_77A0A0()
{
  return Artwork.artwork.getter();
}

uint64_t sub_77A0B0()
{
  return Artwork.template.getter();
}

uint64_t sub_77A0C0()
{
  return type metadata accessor for Artwork();
}

uint64_t sub_77A0D0()
{
  return type metadata accessor for Feature.iOS();
}

uint64_t sub_77A0E0()
{
  return type metadata accessor for Feature();
}

uint64_t sub_77A0F0()
{
  return PageTab.id.getter();
}

uint64_t sub_77A100()
{
  return PageTab.title.getter();
}

uint64_t sub_77A110()
{
  return PageTab.action.getter();
}

uint64_t sub_77A120()
{
  return Ratings.totalNumberOfRatings.getter();
}

uint64_t sub_77A130()
{
  return Ratings.ratingCounts.getter();
}

uint64_t sub_77A140()
{
  return Ratings.ratingAverage.getter();
}

uint64_t sub_77A150()
{
  return Ratings.status.getter();
}

uint64_t sub_77A160()
{
  return type metadata accessor for Ratings();
}

uint64_t sub_77A170()
{
  return dispatch thunk of Commerce.cancelPreorder(for:isArcade:)();
}

uint64_t sub_77A180()
{
  return dispatch thunk of Commerce.purchase(with:stateMachine:)();
}

uint64_t sub_77A190()
{
  return type metadata accessor for Commerce();
}

uint64_t sub_77A1A0()
{
  return Copyable.copyWithOverrides(in:)();
}

uint64_t sub_77A1B0()
{
  return FlowPage.isPreviewingSupported.getter();
}

uint64_t sub_77A1C0()
{
  return type metadata accessor for FlowPage();
}

uint64_t sub_77A1D0()
{
  return dispatch thunk of Footnote.clickAction.getter();
}

uint64_t sub_77A1E0()
{
  return dispatch thunk of Footnote.clickSender.getter();
}

uint64_t sub_77A1F0()
{
  return Footnote.presentationStyle.getter();
}

uint64_t sub_77A200()
{
  return Footnote.text.getter();
}

uint64_t sub_77A210()
{
  return type metadata accessor for Footnote();
}

uint64_t sub_77A220()
{
  return static PageGrid.Breakpoint.== infix(_:_:)();
}

uint64_t sub_77A230()
{
  return PageGrid.Breakpoint.init(range:columnCount:columnExtendsToFillWidth:minimumColumnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_77A240()
{
  return PageGrid.Breakpoint.init(range:columnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_77A250()
{
  return PageGrid.Breakpoint.init(range:centeredColumnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_77A260()
{
  return PageGrid.Breakpoint.centered.getter();
}

uint64_t sub_77A270()
{
  return type metadata accessor for PageGrid.Breakpoint();
}

uint64_t sub_77A280()
{
  return PageGrid.columnCount.getter();
}

uint64_t sub_77A290()
{
  return PageGrid.columnWidth.getter();
}

uint64_t sub_77A2A0()
{
  return PageGrid.interRowSpace.getter();
}

uint64_t sub_77A2B0()
{
  return PageGrid.containerWidth.getter();
}

uint64_t sub_77A2C0()
{
  return PageGrid.safeAreaInsets.getter();
}

uint64_t sub_77A2D0()
{
  return PageGrid.containerHeight.getter();
}

uint64_t sub_77A2E0()
{
  return PageGrid.DirectionalValue.init(horizontal:vertical:)();
}

uint64_t sub_77A2F0()
{
  return static PageGrid.DirectionalValue<>.zero.getter();
}

uint64_t sub_77A300()
{
  return PageGrid.DirectionalValue.init(_:)();
}

uint64_t sub_77A310()
{
  return PageGrid.activeBreakPoint.getter();
}

uint64_t sub_77A320()
{
  return PageGrid.interColumnSpace.getter();
}

uint64_t sub_77A330()
{
  return static PageGrid.HorizontalMargins.zero.getter();
}

uint64_t sub_77A340()
{
  return type metadata accessor for PageGrid.HorizontalMargins();
}

uint64_t sub_77A350()
{
  return PageGrid.horizontalMargins.getter();
}

uint64_t sub_77A360()
{
  return PageGrid.componentMeasuringSize(spanning:)();
}

uint64_t sub_77A370()
{
  return PageGrid.smallestPossibleColumnWidth.getter();
}

uint64_t sub_77A380()
{
  return PageGrid.horizontalDirectionalMargins.getter();
}

uint64_t sub_77A390()
{
  return PageGrid.init(from:breakpointOverrides:)();
}

uint64_t sub_77A3A0()
{
  return PageGrid.init(name:direction:containerSize:safeAreaInsets:requiresAdditionalSafeAreaMargins:breakpoints:)();
}

uint64_t sub_77A3B0()
{
  return static PageGrid.Direction.== infix(_:_:)();
}

uint64_t sub_77A3C0()
{
  return type metadata accessor for PageGrid.Direction();
}

uint64_t sub_77A3D0()
{
  return PageGrid.direction.getter();
}

uint64_t sub_77A3E0()
{
  return type metadata accessor for PageGrid();
}

uint64_t sub_77A3F0()
{
  return PageTabs.selectedTabId.getter();
}

uint64_t sub_77A400()
{
  return PageTabs.tabs.getter();
}

uint64_t sub_77A410()
{
  return type metadata accessor for PageTabs();
}

uint64_t sub_77A420()
{
  return Response.contents.getter();
}

uint64_t sub_77A430()
{
  return Response.dateText.getter();
}

uint64_t sub_77A440()
{
  return SearchAd.advertisingText.getter();
}

uint64_t sub_77A450()
{
  return SearchAd.adTransparencyAction.getter();
}

uint64_t sub_77A460()
{
  return Trailers.mediaPlatform.getter();
}

uint64_t sub_77A470()
{
  return Trailers.videos.getter();
}

unint64_t sub_77A480(UITraitCollection in)
{
  return (unint64_t)Wordmark.asset(in:)(in);
}

uint64_t sub_77A490()
{
  return type metadata accessor for Wordmark();
}

uint64_t sub_77A4A0()
{
  return BadgeType.rendersNatively.getter();
}

uint64_t sub_77A4B0()
{
  return type metadata accessor for BadgeType();
}

uint64_t sub_77A4C0()
{
  return dispatch thunk of Gladiator.rule(named:)();
}

uint64_t sub_77A4D0()
{
  return Gladiator.__allocating_init()();
}

uint64_t sub_77A4E0()
{
  return type metadata accessor for Gladiator();
}

uint64_t sub_77A4F0()
{
  return OfferItem.iapArtwork.getter();
}

uint64_t sub_77A500()
{
  return OfferItem.description.getter();
}

uint64_t sub_77A510()
{
  return OfferItem.offerLockup.getter();
}

uint64_t sub_77A520()
{
  return OfferItem.moduleArtwork.getter();
}

uint64_t sub_77A530()
{
  return OfferItem.mediaOverlayStyle.getter();
}

uint64_t sub_77A540()
{
  return OfferItem.formattedEndDateString.getter();
}

uint64_t sub_77A550()
{
  return OfferItem.badge.getter();
}

uint64_t sub_77A560()
{
  return OfferItem.title.getter();
}

uint64_t sub_77A570()
{
  return OfferItem.subtitle.getter();
}

uint64_t sub_77A580()
{
  return type metadata accessor for OfferItem();
}

uint64_t sub_77A590()
{
  return type metadata accessor for OfferTint();
}

uint64_t sub_77A5A0()
{
  return type metadata accessor for OfferType();
}

uint64_t sub_77A5B0()
{
  return Paragraph.isCollapsed.getter();
}

uint64_t sub_77A5C0()
{
  return Paragraph.collapsedText.getter();
}

uint64_t sub_77A5D0()
{
  return Paragraph.suppressVerticalMargins.getter();
}

uint64_t sub_77A5E0()
{
  return Paragraph.init(id:text:wantsCollapsedNewlines:alignment:style:isCollapsed:suppressVerticalMargins:impressionMetrics:)();
}

uint64_t sub_77A5F0()
{
  return Paragraph.text.getter();
}

uint64_t sub_77A600()
{
  return Paragraph.Style.smallerTextStyle.getter();
}

uint64_t sub_77A610()
{
  return Paragraph.Style.textStyle.getter();
}

uint64_t sub_77A620()
{
  return type metadata accessor for Paragraph.Style();
}

uint64_t sub_77A630()
{
  return Paragraph.style.getter();
}

uint64_t sub_77A640()
{
  return type metadata accessor for Paragraph.Alignment();
}

uint64_t sub_77A650()
{
  return Paragraph.alignment.getter();
}

uint64_t sub_77A660()
{
  return type metadata accessor for Paragraph();
}

uint64_t sub_77A670()
{
  return RiverView.init(dataSource:styling:)();
}

uint64_t sub_77A680()
{
  return dispatch thunk of RiverView.dataSource.getter();
}

uint64_t sub_77A690()
{
  return dispatch thunk of RiverView.setSpacing(interRowSpacing:interItemSpacing:)();
}

uint64_t sub_77A6A0()
{
  return dispatch thunk of RiverView.isAnimating.getter();
}

uint64_t sub_77A6B0()
{
  return dispatch thunk of RiverView.isAnimating.setter();
}

uint64_t sub_77A6C0()
{
  return dispatch thunk of RiverView.setItemSize(size:)();
}

uint64_t sub_77A6D0()
{
  return dispatch thunk of RiverView.interRowSpacing.getter();
}

uint64_t sub_77A6E0()
{
  return dispatch thunk of RiverView.isTransitioning.setter();
}

uint64_t sub_77A6F0()
{
  return dispatch thunk of RiverView.cleanUp()();
}

uint64_t sub_77A700()
{
  return dispatch thunk of RiverView.itemSize.getter();
}

uint64_t sub_77A710()
{
  return dispatch thunk of RiverView.flushRows()();
}

uint64_t sub_77A720()
{
  return TapToRate.rateAction.getter();
}

uint64_t sub_77A730()
{
  return TapToRate.title.getter();
}

uint64_t sub_77A740()
{
  return type metadata accessor for TapToRate();
}

uint64_t sub_77A750()
{
  return TodayCard.shortTitle.getter();
}

uint64_t sub_77A760()
{
  return TodayCard.clickAction.getter();
}

uint64_t sub_77A770()
{
  return TodayCard.titleArtwork.getter();
}

uint64_t sub_77A780()
{
  return TodayCard.backgroundColor.getter();
}

uint64_t sub_77A790()
{
  return TodayCard.collapsedHeading.getter();
}

uint64_t sub_77A7A0()
{
  return TodayCard.impressionMetrics.getter();
}

uint64_t sub_77A7B0()
{
  return TodayCard.inlineDescription.getter();
}

uint64_t sub_77A7C0()
{
  return TodayCard.titleCharacteristics.getter();
}

uint64_t sub_77A7D0()
{
  return TodayCard.supportsMediaMirroring.getter();
}

uint64_t sub_77A7E0()
{
  return TodayCard.editorialDisplayOptions.getter();
}

uint64_t sub_77A7F0()
{
  return TodayCard.Style.overlayTextColor.getter();
}

uint64_t sub_77A800()
{
  return TodayCard.Style.cardTitleTextColor.getter();
}

uint64_t sub_77A810()
{
  return TodayCard.Style.cardHeadingTextColor.getter();
}

uint64_t sub_77A820()
{
  return TodayCard.Style.overlayBackgroundColor.getter();
}

uint64_t sub_77A830()
{
  return TodayCard.Style.overlayDetailTextColor.getter();
}

uint64_t sub_77A840()
{
  return TodayCard.Style.rawValue.getter();
}

uint64_t sub_77A850()
{
  return type metadata accessor for TodayCard.Style();
}

uint64_t sub_77A860()
{
  return TodayCard.media.getter();
}

uint64_t sub_77A870()
{
  return TodayCard.style.getter();
}

uint64_t sub_77A880()
{
  return TodayCard.title.getter();
}

uint64_t sub_77A890()
{
  return TodayCard.heading.getter();
}

uint64_t sub_77A8A0()
{
  return TodayCard.overlay.getter();
}

uint64_t sub_77A8B0()
{
  return TodayCard.searchAd.getter();
}

uint64_t sub_77A8C0()
{
  return type metadata accessor for TodayCard();
}

uint64_t sub_77A8D0()
{
  return VideoCard.overlayStyle.getter();
}

uint64_t sub_77A8E0()
{
  return VideoCard.video.getter();
}

uint64_t sub_77A8F0()
{
  return VideoCard.lockup.getter();
}

uint64_t sub_77A900()
{
  return type metadata accessor for VideoCard();
}

uint64_t sub_77A910()
{
  return type metadata accessor for ReviewResult();
}

uint64_t sub_77A920()
{
  return ReviewContext.init(accentColor:lockupStyle:lockupDetails:mediaTaskType:clientInfo:itemIdentifier:itemVersion:)();
}

uint64_t sub_77A930()
{
  return type metadata accessor for ReviewContext();
}

uint64_t sub_77A940()
{
  return ReviewCoordinator.init()();
}

uint64_t sub_77A950()
{
  return type metadata accessor for ReviewCoordinator();
}

uint64_t sub_77A960()
{
  return ReviewLockupDetails.init(name:itemDescription:artworkURLTemplate:)();
}

uint64_t sub_77A970()
{
  return type metadata accessor for ReviewLockupDetails();
}

uint64_t sub_77A980()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_77A990()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_77A9A0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_77A9B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_77A9C0()
{
  return Logger.init()();
}

uint64_t sub_77A9D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_77A9E0()
{
  return static Dimensions.defaultRoundingRule.getter();
}

uint64_t sub_77A9F0()
{
  return FontSource.font(in:for:)();
}

UIFont sub_77AA00(UITraitCollection compatibleWith)
{
  return FontSource.font(compatibleWith:)(compatibleWith);
}

uint64_t sub_77AA10()
{
  return type metadata accessor for FontSource();
}

uint64_t sub_77AA20()
{
  return LayoutRect.init(representing:)();
}

uint64_t sub_77AA30()
{
  return LayoutRect.size.modify();
}

uint64_t sub_77AA40()
{
  return LayoutRect.size.getter();
}

uint64_t sub_77AA50()
{
  return LayoutRect.origin.getter();
}

uint64_t sub_77AA60()
{
  return type metadata accessor for LayoutRect();
}

uint64_t sub_77AA70()
{
  return dispatch thunk of LayoutView.hasContent.getter();
}

uint64_t sub_77AA80()
{
  return LayoutView.nilIfHidden()();
}

uint64_t sub_77AA90()
{
  return dispatch thunk of LayoutView.frame.getter();
}

uint64_t sub_77AAA0()
{
  return dispatch thunk of LayoutView.frame.setter();
}

uint64_t sub_77AAB0()
{
  return dispatch thunk of LayoutView.isHidden.getter();
}

uint64_t sub_77AAC0()
{
  return dispatch thunk of LayoutView.isHidden.setter();
}

uint64_t sub_77AAD0()
{
  return LayoutView.withLayoutMargins(_:)();
}

uint64_t sub_77AAE0()
{
  return LayoutView.withMeasurements(providedBy:)();
}

uint64_t sub_77AAF0()
{
  return LayoutView.withMeasurements(representing:)();
}

uint64_t sub_77AB00()
{
  return LayoutView.withMeasurements(_:)();
}

uint64_t sub_77AB10()
{
  return dispatch thunk of Measurable.measurements(fitting:in:)();
}

uint64_t sub_77AB20()
{
  return Measurable.measuredSize(fitting:in:)();
}

uint64_t sub_77AB30()
{
  return Measurable.measurements(fitting:with:)();
}

uint64_t sub_77AB40()
{
  return Measurable.placeable.getter();
}

uint64_t sub_77AB50()
{
  return AspectRatio.verticalFraction.getter();
}

uint64_t sub_77AB60()
{
  return AspectRatio.horizontalFraction.getter();
}

uint64_t sub_77AB70()
{
  return AspectRatio.isPortrait.getter();
}

uint64_t sub_77AB80()
{
  return AspectRatio.isLandscape.getter();
}

uint64_t sub_77AB90()
{
  return AspectRatio.maxSize(filling:)();
}

uint64_t sub_77ABA0()
{
  return AspectRatio.maxSize(fitting:)();
}

uint64_t sub_77ABB0()
{
  return AspectRatio.inverted.getter();
}

uint64_t sub_77ABC0()
{
  return AspectRatio.width(fromHeight:)();
}

uint64_t sub_77ABD0()
{
  return AspectRatio.height(fromWidth:)();
}

uint64_t sub_77ABE0()
{
  return static AspectRatio.square.getter();
}

uint64_t sub_77ABF0()
{
  return AspectRatio.isSquare.getter();
}

uint64_t sub_77AC00()
{
  return type metadata accessor for AspectRatio();
}

uint64_t sub_77AC10()
{
  return AspectRatio.init(_:_:)();
}

UIFontDescriptor sub_77AC20(UITraitCollection compatibleWith)
{
  return FontUseCase.makeFontDescriptor(compatibleWith:)(compatibleWith);
}

uint64_t sub_77AC30()
{
  return static FontUseCase.== infix(_:_:)();
}

uint64_t sub_77AC40()
{
  return type metadata accessor for FontUseCase();
}

uint64_t sub_77AC50()
{
  return dispatch thunk of AnyDimension.rawValue(in:)();
}

uint64_t sub_77AC60()
{
  return AnyDimension.bottomMargin(from:in:)();
}

uint64_t sub_77AC70()
{
  return AnyDimension.value(in:rounded:)();
}

uint64_t sub_77AC80()
{
  return AnyDimension.value(with:)();
}

uint64_t sub_77AC90()
{
  return AnyDimension.topMargin(from:in:)();
}

uint64_t sub_77ACA0()
{
  return dispatch thunk of CustomLayout.layout.getter();
}

uint64_t sub_77ACE0()
{
  return static DiffableData.makeSnapshot<A, B>(fromSections:withItemsAt:)();
}

uint64_t sub_77ACF0()
{
  return dispatch thunk of DynamicLabel.dynamicTextAppearance.getter();
}

uint64_t sub_77AD00()
{
  return dispatch thunk of DynamicLabel.dynamicTextAppearance.setter();
}

uint64_t sub_77AD10()
{
  return DynamicLabel.__allocating_init(with:)();
}

uint64_t sub_77AD20()
{
  return type metadata accessor for DynamicLabel();
}

uint64_t sub_77AD30()
{
  return ViewRecycler.init()();
}

uint64_t sub_77AD40()
{
  return type metadata accessor for ViewRecycler();
}

uint64_t sub_77AD50()
{
  return type metadata accessor for DisjointStack.Placements();
}

uint64_t sub_77AD60()
{
  return DisjointStack.Properties.bottomEdge.setter();
}

uint64_t sub_77AD70()
{
  return DisjointStack.Properties.leadingEdge.setter();
}

uint64_t sub_77AD80()
{
  return DisjointStack.Properties.trailingEdge.setter();
}

uint64_t sub_77AD90()
{
  return DisjointStack.Properties.anchorsHugContent.setter();
}

uint64_t sub_77ADA0()
{
  return DisjointStack.Properties.topEdge.setter();
}

uint64_t sub_77ADB0()
{
  return type metadata accessor for DisjointStack.EdgePosition();
}

uint64_t sub_77ADC0()
{
  return DisjointStack.init(with:)();
}

uint64_t sub_77ADD0()
{
  return DisjointStack.insert(_:at:with:)();
}

uint64_t sub_77ADE0()
{
  return DisjointStack.inserting(_:at:with:)();
}

uint64_t sub_77ADF0()
{
  return type metadata accessor for DisjointStack();
}

uint64_t sub_77AE00()
{
  return type metadata accessor for VerticalStack.Placements();
}

uint64_t sub_77AE10()
{
  return VerticalStack.Properties.shouldSkip.setter();
}

uint64_t sub_77AE20()
{
  return VerticalStack.Properties.topSpacing.setter();
}

uint64_t sub_77AE30()
{
  return VerticalStack.Properties.bottomSpacing.setter();
}

uint64_t sub_77AE40()
{
  return VerticalStack.Properties.edgesAlignedToBaseline.setter();
}

uint64_t sub_77AE50()
{
  return VerticalStack.Properties.alignment.setter();
}

uint64_t sub_77AE60()
{
  return VerticalStack.add(_:with:)();
}

uint64_t sub_77AE70()
{
  return static VerticalStack.Edge.top.getter();
}

uint64_t sub_77AE80()
{
  return static VerticalStack.Edge.bottom.getter();
}

uint64_t sub_77AE90()
{
  return VerticalStack.Edge.init(rawValue:)();
}

uint64_t sub_77AEA0()
{
  return VerticalStack.init(with:)();
}

uint64_t sub_77AEB0()
{
  return VerticalStack.adding(_:with:)();
}

uint64_t sub_77AEC0()
{
  return type metadata accessor for VerticalStack();
}

uint64_t sub_77AED0()
{
  return static ZeroDimension.zero.getter();
}

uint64_t sub_77AEE0()
{
  return type metadata accessor for ZeroDimension();
}

uint64_t sub_77AEF0()
{
  return dispatch thunk of LayoutTextView.isTextExtraTall.getter();
}

uint64_t sub_77AF00()
{
  return dispatch thunk of LayoutTextView.textLength.getter();
}

uint64_t sub_77AF10()
{
  return dispatch thunk of LayoutTextView.lineBreakMode.setter();
}

uint64_t sub_77AF20()
{
  return dispatch thunk of LayoutTextView.numberOfLines.setter();
}

uint64_t sub_77AF30()
{
  return LayoutTextView.nilIfHasNoContent()();
}

uint64_t sub_77AF40()
{
  return LayoutTextView.nilIfHiddenOrHasNoContent()();
}

uint64_t sub_77AF50()
{
  return dispatch thunk of LayoutTextView.languageAwareOutsets.getter();
}

uint64_t sub_77AF60()
{
  return dispatch thunk of LayoutTextView.font.getter();
}

uint64_t sub_77AF70()
{
  return dispatch thunk of LayoutTextView.font.setter();
}

Swift::Int sub_77AF80(JUMeasurements from)
{
  return LayoutTextView.estimatedNumberOfLines(from:)(from);
}

uint64_t sub_77AF90()
{
  return LayoutTextView.withLanguageAwareOutsets.getter();
}

uint64_t sub_77AFA0()
{
  return TextAppearance.withTextAlignment(_:)();
}

uint64_t sub_77AFB0()
{
  return TextAppearance.lineSpacing.setter();
}

uint64_t sub_77AFC0()
{
  return TextAppearance.lineBreakMode.setter();
}

uint64_t sub_77AFD0()
{
  return TextAppearance.numberOfLines.setter();
}

uint64_t sub_77AFE0()
{
  return TextAppearance.textAlignment.setter();
}

uint64_t sub_77AFF0()
{
  return TextAppearance.withLineSpacing(_:)();
}

uint64_t sub_77B000()
{
  return TextAppearance.withLineBreakMode(_:)();
}

uint64_t sub_77B010()
{
  return TextAppearance.withNumberOfLines(_:)();
}

uint64_t sub_77B020()
{
  return TextAppearance.font.getter();
}

uint64_t sub_77B030()
{
  return TextAppearance.font.setter();
}

uint64_t sub_77B040()
{
  return TextAppearance.withFont(_:)();
}

uint64_t sub_77B050()
{
  return TextAppearance.init()();
}

uint64_t sub_77B060()
{
  return type metadata accessor for TextAppearance();
}

uint64_t sub_77B070()
{
  return static TextMeasurable.defaultTextAlignment.getter();
}

uint64_t sub_77B080()
{
  return static TextMeasurable.measurements(attributedText:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:)();
}

uint64_t sub_77B090()
{
  return static TextMeasurable.defaultLineBreakMode.getter();
}

uint64_t sub_77B0A0()
{
  return static CustomTextStyle<>.metadataRibbon.getter();
}

uint64_t sub_77B0B0()
{
  return dispatch thunk of CustomTextStyle.font(compatibleWith:)();
}

uint64_t sub_77B0C0()
{
  return HorizontalStack.Properties.leadingSpacing.setter();
}

uint64_t sub_77B0D0()
{
  return HorizontalStack.Properties.trailingSpacing.setter();
}

uint64_t sub_77B0E0()
{
  return HorizontalStack.Properties.alignment.setter();
}

uint64_t sub_77B0F0()
{
  return HorizontalStack.add(_:with:)();
}

uint64_t sub_77B100()
{
  return HorizontalStack.init(with:)();
}

uint64_t sub_77B110()
{
  return HorizontalStack.adding(_:with:)();
}

uint64_t sub_77B120()
{
  return static HorizontalStack.Alignment.== infix(_:_:)();
}

uint64_t sub_77B130()
{
  return type metadata accessor for HorizontalStack();
}

uint64_t sub_77B140()
{
  return ImageAppearance.withSymbolConfiguration(_:)();
}

uint64_t sub_77B150()
{
  return ImageAppearance.init()();
}

uint64_t sub_77B160()
{
  return type metadata accessor for ImageAppearance();
}

uint64_t sub_77B170()
{
  return dispatch thunk of PrimitiveLayout.layout(relativeTo:with:)();
}

uint64_t sub_77B180()
{
  return StackMeasurable.measurements(fitting:in:)();
}

uint64_t sub_77B190()
{
  return type metadata accessor for StackMeasurable.Axis();
}

uint64_t sub_77B1A0()
{
  return StackMeasurable.init(axis:skipEmptyChildren:children:)();
}

uint64_t sub_77B1B0()
{
  return type metadata accessor for StackMeasurable();
}

uint64_t sub_77B1C0()
{
  return static StaticDimension.== infix(_:_:)();
}

uint64_t sub_77B1D0()
{
  return StaticDimension.value(compatibleWith:rounded:)();
}

uint64_t sub_77B1E0()
{
  return StaticDimension.rawValue(in:)();
}

uint64_t sub_77B1F0()
{
  return type metadata accessor for StaticDimension();
}

uint64_t sub_77B200()
{
  return StaticDimension.init(_:scaledLike:)();
}

uint64_t sub_77B210()
{
  return CustomLayoutView.sizeThatFits(_:)();
}

uint64_t sub_77B220()
{
  return dispatch thunk of CustomLayoutView.invalidateMeasurements()();
}

uint64_t sub_77B230()
{
  return CustomLayoutView.measure(toFit:with:)();
}

uint64_t sub_77B240()
{
  return type metadata accessor for CustomLayoutView();
}

uint64_t sub_77B250()
{
  return method lookup function for CustomLayoutView();
}

uint64_t sub_77B260()
{
  return ImagePlaceholder.measure(toFit:with:)();
}

uint64_t sub_77B270()
{
  return type metadata accessor for ImagePlaceholder();
}

uint64_t sub_77B280()
{
  return ImagePlaceholder.init(_:with:)();
}

uint64_t sub_77B290()
{
  return LabelPlaceholder.layoutTextView.getter();
}

uint64_t sub_77B2A0()
{
  return static LabelPlaceholder.Options.languageAware.getter();
}

uint64_t sub_77B2B0()
{
  return LabelPlaceholder.Options.init(rawValue:)();
}

uint64_t sub_77B2C0()
{
  return LabelPlaceholder.measure(toFit:with:)();
}

uint64_t sub_77B2D0()
{
  return type metadata accessor for LabelPlaceholder();
}

uint64_t sub_77B2E0()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_77B2F0()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_77B300()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_77B310()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_77B320()
{
  return MeasurementRange.init(minimum:maximum:)();
}

uint64_t sub_77B330()
{
  return MeasurementRange.contains(_:)();
}

uint64_t sub_77B340()
{
  return MeasurementRange.constrain(_:)();
}

uint64_t sub_77B350()
{
  return dispatch thunk of PlacementSequence.measure.getter();
}

uint64_t sub_77B360()
{
  return type metadata accessor for VerticalFlowLayout.VerticalPlacement();
}

uint64_t sub_77B370()
{
  return VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_77B380()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_77B390()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter();
}

uint64_t sub_77B3A0()
{
  return static VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_77B3B0()
{
  return type metadata accessor for VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_77B3C0()
{
  return type metadata accessor for VerticalFlowLayout.HorizontalPlacement();
}

uint64_t sub_77B3D0()
{
  return VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_77B3E0()
{
  return static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)();
}

uint64_t sub_77B3F0()
{
  return type metadata accessor for VerticalFlowLayout.Child();
}

uint64_t sub_77B400()
{
  return type metadata accessor for VerticalFlowLayout();
}

uint64_t sub_77B410()
{
  return type metadata accessor for AspectFitMeasurable();
}

uint64_t sub_77B420()
{
  return AspectFitMeasurable.init(_:)();
}

uint64_t sub_77B430()
{
  return dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_77B450()
{
  return static EstimatedMeasurable.estimatedSize(fitting:using:in:)();
}

uint64_t sub_77B460()
{
  return LineHeightDimension.init(with:multipliedBy:)();
}

uint64_t sub_77B470()
{
  return type metadata accessor for LineHeightDimension();
}

uint64_t sub_77B480()
{
  return type metadata accessor for VerticalStackLayout.ExclusionCondition();
}

uint64_t sub_77B490()
{
  return static VerticalStackLayout.Child.make(forView:space:spaceMultiplier:alignment:excludeWhen:)();
}

uint64_t sub_77B4A0()
{
  return type metadata accessor for VerticalStackLayout.Child.Alignment();
}

uint64_t sub_77B4B0()
{
  return type metadata accessor for VerticalStackLayout.Child();
}

uint64_t sub_77B4C0()
{
  return VerticalStackLayout.addChild(_:)();
}

uint64_t sub_77B4D0()
{
  return type metadata accessor for VerticalStackLayout.Alignment();
}

uint64_t sub_77B4E0()
{
  return VerticalStackLayout.init(alignment:spacing:children:)();
}

uint64_t sub_77B4F0()
{
  return type metadata accessor for VerticalStackLayout();
}

uint64_t sub_77B500()
{
  return DynamicTextAppearance.withCustomTextStyle(_:)();
}

uint64_t sub_77B510()
{
  return DynamicTextAppearance.withTextStyle(_:)();
}

uint64_t sub_77B520()
{
  return DynamicTextAppearance.customTextStyle.getter();
}

uint64_t sub_77B530()
{
  return DynamicTextAppearance.lineSpacing.getter();
}

uint64_t sub_77B540()
{
  return DynamicTextAppearance.lineBreakMode.getter();
}

uint64_t sub_77B550()
{
  return DynamicTextAppearance.numberOfLines.getter();
}

uint64_t sub_77B560()
{
  return DynamicTextAppearance.textAlignment.getter();
}

uint64_t sub_77B570()
{
  return DynamicTextAppearance.withFontUseCase(_:)();
}

uint64_t sub_77B580()
{
  return DynamicTextAppearance.withLineBreakMode(_:)();
}

uint64_t sub_77B590()
{
  return DynamicTextAppearance.withNumberOfLines(_:)();
}

uint64_t sub_77B5A0()
{
  return DynamicTextAppearance.init()();
}

uint64_t sub_77B5B0()
{
  return type metadata accessor for DynamicTextAppearance();
}

uint64_t sub_77B5C0()
{
  return FlankedVerticalLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_77B5D0()
{
  return type metadata accessor for FlankedVerticalLayout.Alignment();
}

uint64_t sub_77B5E0()
{
  return FlankedVerticalLayout.init(sublayout:topView:topViewAlignment:topMargin:bottomView:bottomViewAlignment:bottomMargin:)();
}

uint64_t sub_77B5F0()
{
  return type metadata accessor for FlankedVerticalLayout();
}

uint64_t sub_77B600()
{
  return LayoutViewPlaceholder.hasContent.setter();
}

uint64_t sub_77B610()
{
  return LayoutViewPlaceholder.init(measureWith:)();
}

uint64_t sub_77B620()
{
  return LayoutViewPlaceholder.init(measurements:)();
}

uint64_t sub_77B630()
{
  return LayoutViewPlaceholder.init(representing:)();
}

uint64_t sub_77B640()
{
  return static LayoutViewPlaceholder.withIdentityMeasurement.getter();
}

uint64_t sub_77B650()
{
  return LayoutViewPlaceholder.isHidden.setter();
}

uint64_t sub_77B660()
{
  return type metadata accessor for LayoutViewPlaceholder();
}

uint64_t sub_77B670()
{
  return measuringBoundingRect(toFit:)();
}

uint64_t sub_77B680()
{
  return type metadata accessor for FlankedHorizontalLayout.ViewAlignment();
}

uint64_t sub_77B690()
{
  return FlankedHorizontalLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_77B6A0()
{
  return FlankedHorizontalLayout.init(sublayout:leadingView:leadingMargin:leadingAlignment:trailingView:trailingMargin:trailingAlignment:)();
}

uint64_t sub_77B6B0()
{
  return type metadata accessor for FlankedHorizontalLayout();
}

uint64_t sub_77B6C0()
{
  return static JULoadingViewController.PresentationContext.placeholder.getter();
}

uint64_t sub_77B6D0()
{
  return type metadata accessor for JULoadingViewController.PresentationContext();
}

uint64_t sub_77B6E0()
{
  return JULoadingViewController.init(label:presentationContext:pageRenderMetrics:)();
}

uint64_t sub_77B6F0()
{
  return type metadata accessor for JULoadingViewController();
}

uint64_t sub_77B700()
{
  return type metadata accessor for VerticalSpaceMeasurable();
}

uint64_t sub_77B710()
{
  return VerticalSpaceMeasurable.init(_:multiplier:)();
}

uint64_t sub_77B720()
{
  return VerticalMarginsMeasurable.measurements(fitting:in:)();
}

uint64_t sub_77B730()
{
  return VerticalMarginsMeasurable.init(child:topMargin:bottomMargin:skipIfEmpty:shouldMeasureToBaseline:)();
}

uint64_t sub_77B740()
{
  return type metadata accessor for VerticalMarginsMeasurable();
}

uint64_t sub_77B750()
{
  return TraitEnvironmentPlaceholder.init(traitCollection:)();
}

uint64_t sub_77B760()
{
  return type metadata accessor for TraitEnvironmentPlaceholder();
}

uint64_t sub_77B770()
{
  return TraitEnvironmentPlaceholder.__allocating_init(_:)();
}

uint64_t sub_77B780()
{
  return JUContentUnavailableViewController.init(error:from:includeMetrics:retry:)();
}

uint64_t sub_77B790()
{
  return static JUContentUnavailableViewController.PresentationContext.placeholder.getter();
}

uint64_t sub_77B7A0()
{
  return type metadata accessor for JUContentUnavailableViewController.PresentationContext();
}

uint64_t sub_77B7B0()
{
  return JUContentUnavailableViewController.init(error:presentationContext:retry:)();
}

uint64_t sub_77B7C0()
{
  return type metadata accessor for JUContentUnavailableViewController();
}

uint64_t sub_77B7D0()
{
  return type metadata accessor for Pin.Edge();
}

uint64_t sub_77B7E0()
{
  return type metadata accessor for Pin();
}

uint64_t sub_77B7F0()
{
  return Pin.init(_:to:of:)();
}

uint64_t sub_77B800()
{
  return static Center.Axis.horizontal.getter();
}

uint64_t sub_77B810()
{
  return static Center.Axis.neither.getter();
}

uint64_t sub_77B820()
{
  return static Center.Axis.vertical.getter();
}

uint64_t sub_77B830()
{
  return type metadata accessor for Center();
}

uint64_t sub_77B840()
{
  return Center.init(_:filling:)();
}

uint64_t sub_77B850()
{
  return dispatch thunk of Layout.placeChildren(relativeTo:in:)();
}

uint64_t sub_77B860()
{
  return Resize.init(_:size:)();
}

uint64_t sub_77B870()
{
  return type metadata accessor for Resize.Rule();
}

uint64_t sub_77B880()
{
  return type metadata accessor for Resize();
}

uint64_t sub_77B890()
{
  return Resize.init(_:width:height:firstBaseline:lastBaseline:)();
}

uint64_t sub_77B8A0()
{
  return type metadata accessor for Margins.Placements();
}

uint64_t sub_77B8B0()
{
  return Margins.init(top:left:bottom:right:child:)();
}

uint64_t sub_77B8C0()
{
  return Margins.init(insets:child:)();
}

uint64_t sub_77B8D0()
{
  return type metadata accessor for Margins();
}

uint64_t sub_77B8E0()
{
  return Margins.init(_:top:leading:bottom:trailing:)();
}

uint64_t sub_77B8F0()
{
  return Adaptive.onCustom<A>(_:_:)();
}

uint64_t sub_77B900()
{
  return type metadata accessor for Adaptive();
}

uint64_t sub_77B910()
{
  return Adaptive.init<A>(_:)();
}

uint64_t sub_77B920()
{
  return AppStore.CenteredThreeLineTextLayout.init(primaryText:secondaryText:secondarySpace:numberOfLines:)();
}

uint64_t sub_77B930()
{
  return AppStore.CenteredThreeLineTextLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_77B940()
{
  return type metadata accessor for AppStore.CenteredThreeLineTextLayout();
}

uint64_t sub_77B950()
{
  return type metadata accessor for Constrain();
}

uint64_t sub_77B960()
{
  return Constrain.init(_:width:height:)();
}

uint64_t sub_77B970()
{
  return dispatch thunk of Placeable.place(at:with:)();
}

uint64_t sub_77B980()
{
  return dispatch thunk of Placeable.measure(toFit:with:)();
}

uint64_t sub_77B990()
{
  return Placement.child.getter();
}

uint64_t sub_77B9A0()
{
  return Placement.frame.getter();
}

uint64_t sub_77B9B0()
{
  return type metadata accessor for Placement();
}

void sub_77B9C0()
{
}

uint64_t sub_77B9D0()
{
  return ReusePool.limit.setter();
}

uint64_t sub_77B9E0()
{
  return ReusePool.dequeue(or:)();
}

uint64_t sub_77B9F0()
{
  return ReusePool.dequeue()();
}

uint64_t sub_77BA00()
{
  return ReusePool.recycle(_:)();
}

uint64_t sub_77BA10()
{
  return ReusePool.init(recycler:limit:)();
}

uint64_t sub_77BA20()
{
  return type metadata accessor for ReusePool();
}

uint64_t sub_77BA30()
{
  return Separator.verticalOutset.getter();
}

uint64_t sub_77BA40()
{
  return Separator.withLeadingInset(_:)();
}

uint64_t sub_77BA50()
{
  return Separator.frame(forBoundingRect:in:)();
}

uint64_t sub_77BA60()
{
  return Separator.height(in:)();
}

uint64_t sub_77BA70()
{
  return type metadata accessor for Separator.Position();
}

uint64_t sub_77BA80()
{
  return Separator.init(position:leadingInset:trailingInset:verticalOutset:)();
}

uint64_t sub_77BA90()
{
  return static Separator.thickness(compatibleWith:)();
}

uint64_t sub_77BAA0()
{
  return type metadata accessor for Separator();
}

uint64_t sub_77BAB0()
{
  return static UICellAccessory.customView(configuration:)();
}

uint64_t sub_77BAC0()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t sub_77BAD0()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t sub_77BAE0()
{
  return UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_77BAF0()
{
  return type metadata accessor for UICellAccessory.CheckmarkOptions();
}

uint64_t sub_77BB00()
{
  return static UICellAccessory.outlineDisclosure(displayed:options:actionHandler:)();
}

uint64_t sub_77BB10()
{
  return static UICellAccessory.disclosureIndicator(displayed:options:)();
}

uint64_t sub_77BB20()
{
  return UICellAccessory.CustomViewConfiguration.init(customView:placement:isHidden:reservedLayoutWidth:tintColor:maintainsFixedSize:)();
}

uint64_t sub_77BB30()
{
  return type metadata accessor for UICellAccessory.CustomViewConfiguration();
}

uint64_t sub_77BB40()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions.Style();
}

uint64_t sub_77BB50()
{
  return UICellAccessory.OutlineDisclosureOptions.init(style:isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_77BB60()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions();
}

uint64_t sub_77BB70()
{
  return UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_77BB80()
{
  return type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
}

uint64_t sub_77BB90()
{
  return type metadata accessor for UICellAccessory.Placement();
}

uint64_t sub_77BBA0()
{
  return static UICellAccessory.checkmark(displayed:options:)();
}

uint64_t sub_77BBB0()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t sub_77BBC0()
{
  return UIMutableTraits.userInterfaceLevel.setter();
}

uint64_t sub_77BBD0()
{
  return UIMutableTraits.userInterfaceStyle.setter();
}

uint64_t sub_77BBE0()
{
  return UIMutableTraits.horizontalSizeClass.setter();
}

uint64_t sub_77BBF0()
{
  return UIMutableTraits.preferredContentSizeCategory.getter();
}

uint64_t sub_77BC00()
{
  return UIMutableTraits.preferredContentSizeCategory.setter();
}

uint64_t sub_77BC10()
{
  return UIMutableTraits._typesettingLanguageAwareLineHeightRatio.setter();
}

uint64_t sub_77BC20()
{
  return UITraitOverrides.remove(_:)();
}

uint64_t sub_77BC30()
{
  return type metadata accessor for UITraitOverrides();
}

uint64_t sub_77BC40()
{
  return type metadata accessor for UITraitLayoutDirection();
}

uint64_t sub_77BC50()
{
  return type metadata accessor for UITraitLegibilityWeight();
}

uint64_t sub_77BC60()
{
  return type metadata accessor for UITraitVerticalSizeClass();
}

uint64_t sub_77BC70()
{
  return UIBackgroundConfiguration.cornerRadius.setter();
}

uint64_t sub_77BC80()
{
  return static UIBackgroundConfiguration.listPlainCell()();
}

uint64_t sub_77BC90()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_77BCA0()
{
  return UIBackgroundConfiguration.backgroundInsets.setter();
}

uint64_t sub_77BCB0()
{
  return UIBackgroundConfiguration.backgroundColorTransformer.setter();
}

uint64_t sub_77BCC0()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t sub_77BCD0()
{
  return type metadata accessor for UITraitUserInterfaceLevel();
}

uint64_t sub_77BCE0()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t sub_77BCF0()
{
  return static UIListContentConfiguration.groupedFooter()();
}

uint64_t sub_77BD00()
{
  return static UIListContentConfiguration.groupedHeader()();
}

uint64_t sub_77BD10()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t sub_77BD20()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties.TextAlignment();
}

uint64_t sub_77BD30()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t sub_77BD40()
{
  return UIListContentConfiguration.TextProperties.alignment.setter();
}

uint64_t sub_77BD50()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t sub_77BD60()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t sub_77BD70()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t sub_77BD80()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t sub_77BD90()
{
  return static UIListContentConfiguration.valueCell()();
}

uint64_t sub_77BDA0()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t sub_77BDB0()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t sub_77BDC0()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_77BDD0(Swift::OpaquePointer a1)
{
}

void sub_77BDE0(Swift::OpaquePointer a1)
{
}

uint64_t sub_77BDF0()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t sub_77BE00()
{
  return NSDiffableDataSourceSnapshot.numberOfSections.getter();
}

void sub_77BE10(Swift::OpaquePointer a1)
{
}

uint64_t sub_77BE20()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifier(containingItem:)();
}

uint64_t sub_77BE30()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t sub_77BE40()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_77BE50()
{
  return UIListSeparatorConfiguration.topSeparatorInsets.setter();
}

uint64_t sub_77BE60()
{
  return UIListSeparatorConfiguration.bottomSeparatorInsets.setter();
}

uint64_t sub_77BE70()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_77BE80()
{
  return UIConfigurationColorTransformer.init(_:)();
}

uint64_t sub_77BE90()
{
  return UIContentUnavailableConfiguration.secondaryText.setter();
}

uint64_t sub_77BEA0()
{
  return UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter();
}

uint64_t sub_77BEB0()
{
  return UIContentUnavailableConfiguration.buttonProperties.modify();
}

uint64_t sub_77BEC0()
{
  return UIContentUnavailableConfiguration.text.setter();
}

uint64_t sub_77BED0()
{
  return UIContentUnavailableConfiguration.button.modify();
}

uint64_t sub_77BEE0()
{
  return static UIContentUnavailableConfiguration.search()();
}

uint64_t sub_77BEF0()
{
  return type metadata accessor for UIContentUnavailableConfiguration();
}

uint64_t sub_77BF00()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_77BF10()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t sub_77BF20()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t sub_77BF30()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.numberOfSections(in:)();
}

uint64_t sub_77BF40()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_77BF50()
{
  return UICollectionViewDiffableDataSource.apply(_:to:animatingDifferences:completion:)();
}

uint64_t sub_77BF60()
{
  return UICollectionViewDiffableDataSource.snapshot(for:)();
}

uint64_t sub_77BF70()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t sub_77BF80()
{
  return NSDiffableDataSourceSectionSnapshot.isExpanded(_:)();
}

uint64_t sub_77BF90()
{
  return NSDiffableDataSourceSectionSnapshot.append(_:to:)();
}

void sub_77BFA0(Swift::OpaquePointer a1)
{
}

void sub_77BFB0(Swift::OpaquePointer a1)
{
}

uint64_t sub_77BFC0()
{
  return NSDiffableDataSourceSectionSnapshot.init()();
}

uint64_t sub_77BFD0()
{
  return UICollectionLayoutListConfiguration.trailingSwipeActionsConfigurationProvider.setter();
}

uint64_t sub_77BFE0()
{
  return UICollectionLayoutListConfiguration.separatorConfiguration.modify();
}

uint64_t sub_77BFF0()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t sub_77C000()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.FooterMode();
}

uint64_t sub_77C010()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t sub_77C020()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t sub_77C030()
{
  return UICollectionLayoutListConfiguration.footerMode.setter();
}

uint64_t sub_77C040()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t sub_77C050()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t sub_77C060()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_77C070()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t sub_77C080()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t sub_77C090()
{
  return type metadata accessor for UITypesettingLanguageAwareLineHeightRatio();
}

uint64_t sub_77C0A0()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_77C0B0()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_77C0C0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_77C0D0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_77C0E0()
{
  return static Published.subscript.getter();
}

uint64_t sub_77C0F0()
{
  return static Published.subscript.setter();
}

uint64_t sub_77C100()
{
  return type metadata accessor for Published();
}

uint64_t sub_77C110()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_77C120()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_77C130()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_77C140()
{
  return type metadata accessor for Prominence();
}

uint64_t sub_77C150()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_77C160()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_77C170()
{
  return static Transaction._loading.getter();
}

uint64_t sub_77C180()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_77C190()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_77C1A0()
{
  return PlainListStyle.init()();
}

uint64_t sub_77C1B0()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t sub_77C1C0()
{
  return DisclosureGroup.init(content:label:)();
}

uint64_t sub_77C1D0()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_77C1E0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_77C1F0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_77C200()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_77C210()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_77C220()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_77C230()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_77C240()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_77C250()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_77C260()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_77C270()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_77C280()
{
  return static VerticalAlignment.center.getter();
}

void sub_77C290(Swift::String a1)
{
}

void sub_77C2A0(Swift::String a1)
{
}

uint64_t sub_77C2B0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_77C2C0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_77C2D0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_77C2E0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_77C2F0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_77C300()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_77C310()
{
  return static SymbolRenderingMode.multicolor.getter();
}

uint64_t sub_77C320()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t sub_77C330()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_77C340()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_77C350()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_77C360()
{
  return static SearchFieldPlacement.automatic.getter();
}

uint64_t sub_77C370()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_77C380()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t sub_77C390()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_77C3A0()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_77C3B0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_77C3C0()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_77C3D0()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_77C3E0()
{
  return EnabledTextSelectability.init()();
}

uint64_t sub_77C3F0()
{
  return type metadata accessor for EnabledTextSelectability();
}

uint64_t sub_77C400()
{
  return static TextInputAutocapitalization.never.getter();
}

uint64_t sub_77C410()
{
  return type metadata accessor for TextInputAutocapitalization();
}

uint64_t sub_77C420()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_77C430()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_77C440()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_77C450()
{
  return static Font.title3.getter();
}

uint64_t sub_77C460()
{
  return static Font.caption.getter();
}

uint64_t sub_77C470()
{
  return static Font.caption2.getter();
}

uint64_t sub_77C480()
{
  return static Font.footnote.getter();
}

uint64_t sub_77C490()
{
  return static Font.headline.getter();
}

uint64_t sub_77C4A0()
{
  return List<>.init(content:)();
}

uint64_t sub_77C4B0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_77C4C0()
{
  return Text.bold()();
}

uint64_t sub_77C4D0()
{
  return Text.font(_:)();
}

uint64_t sub_77C4E0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_77C4F0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_77C500()
{
  return View.intentDispatcher(_:with:)();
}

uint64_t sub_77C510()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_77C520()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_77C530()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t sub_77C540()
{
  return View.keyboardType(_:)();
}

uint64_t sub_77C550()
{
  return View.textSelection<A>(_:)();
}

uint64_t sub_77C560()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_77C570()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_77C580()
{
  return View.headerProminence(_:)();
}

uint64_t sub_77C590()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t sub_77C5A0()
{
  return View.textInputAutocapitalization(_:)();
}

uint64_t sub_77C5B0()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_77C5C0()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_77C5D0()
{
  return Image.init(systemName:)();
}

uint64_t sub_77C5E0()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_77C5F0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_77C600()
{
  return State.wrappedValue.getter();
}

uint64_t sub_77C610()
{
  return State.projectedValue.getter();
}

uint64_t sub_77C620()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_77C630()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_77C640()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_77C650()
{
  return ShareLink<>.init<>(item:subject:message:label:)();
}

uint64_t sub_77C660()
{
  return type metadata accessor for DeviceAppQuery();
}

uint64_t sub_77C670()
{
  return DeviceAppStateDataSource.__allocating_init(query:fetcher:updateRegistry:store:)();
}

uint64_t sub_77C680()
{
  return type metadata accessor for DeviceAppStateDataSource();
}

uint64_t sub_77C690()
{
  return DefaultAppStateDataSource.init()();
}

uint64_t sub_77C6A0()
{
  return type metadata accessor for DefaultAppStateDataSource();
}

uint64_t sub_77C6B0()
{
  return WaitingAppStateDataSource.init()();
}

uint64_t sub_77C6C0()
{
  return type metadata accessor for WaitingAppStateDataSource();
}

uint64_t sub_77C6D0()
{
  return ASDDeviceAppFetcher.init(regulatoryLogger:)();
}

uint64_t sub_77C6E0()
{
  return type metadata accessor for ASDDeviceAppFetcher();
}

uint64_t sub_77C6F0()
{
  return type metadata accessor for App.Kind();
}

uint64_t sub_77C700()
{
  return type metadata accessor for AppStoreType();
}

uint64_t sub_77C710()
{
  return DeviceUpdateRegistry.__allocating_init()();
}

uint64_t sub_77C720()
{
  return type metadata accessor for DeviceUpdateRegistry();
}

uint64_t sub_77C730()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_77C740()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_77C750()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_77C760()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_77C770()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_77C780()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_77C790()
{
  return static DispatchTime.now()();
}

uint64_t sub_77C7A0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_77C7B0()
{
  return dispatch thunk of DispatchWorkItem.isCancelled.getter();
}

uint64_t sub_77C7C0()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_77C7D0()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_77C7E0()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_77C7F0()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_77C800()
{
  return + infix(_:_:)();
}

uint64_t sub_77C810()
{
  return + infix(_:_:)();
}

uint64_t sub_77C820()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_77C830()
{
  return AsyncEvent.post(_:)();
}

uint64_t sub_77C840()
{
  return AsyncEvent.init()();
}

uint64_t sub_77C850()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_77C860()
{
  return static Dependency.satisfying<A>(_:with:)();
}

uint64_t sub_77C870()
{
  return type metadata accessor for Dependency();
}

uint64_t sub_77C880()
{
  return JSIncident.description.getter();
}

uint64_t sub_77C890()
{
  return JSIncident.contextSummary.getter();
}

uint64_t sub_77C8A0()
{
  return JSIncident.problemSummary.getter();
}

uint64_t sub_77C8B0()
{
  return type metadata accessor for JSIncident();
}

uint64_t sub_77C8C0()
{
  return JSONObject.array.getter();
}

uint64_t sub_77C8D0()
{
  return JSONObject.string.getter();
}

uint64_t sub_77C8E0()
{
  return type metadata accessor for JSONObject();
}

uint64_t sub_77C8F0()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_77C900()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_77C910()
{
  return static LogMessage.traceableSensitive(_:)();
}

uint64_t sub_77C920()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_77C930()
{
  return LogMessage.StringInterpolation.appendInterpolation(identity:)();
}

void sub_77C940(Swift::String a1)
{
}

uint64_t sub_77C950()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_77C960()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_77C970()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_77C980()
{
  return static LogMessage.safe(_:)();
}

uint64_t sub_77C990()
{
  return static LogMessage.identity(_:)();
}

uint64_t sub_77C9A0()
{
  return static LogMessage.sensitive(_:)();
}

uint64_t sub_77C9B0()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_77C9C0()
{
  return dispatch thunk of ShelfModel.items.getter();
}

uint64_t sub_77C9D0()
{
  return StateStore.performTransaction<A>(_:)();
}

uint64_t sub_77C9E0()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t sub_77C9F0()
{
  return IntentModel._canonicalized.getter();
}

uint64_t sub_77CA00()
{
  return static IntentModel<>.kind.getter();
}

uint64_t sub_77CA10()
{
  return type metadata accessor for JSONContext();
}

uint64_t sub_77CA20()
{
  return MetricsData.init(fields:includingFields:excludingFields:shouldFlush:)();
}

uint64_t sub_77CA30()
{
  return type metadata accessor for MetricsData();
}

uint64_t sub_77CA40()
{
  return static PageMetrics.notInstrumented.getter();
}

uint64_t sub_77CA50()
{
  return type metadata accessor for PageMetrics();
}

uint64_t sub_77CA60()
{
  return dispatch thunk of Preferences.removeValue(forKey:)();
}

uint64_t sub_77CA70()
{
  return Preferences.subscript.getter();
}

uint64_t sub_77CA80()
{
  return Preferences.subscript.modify();
}

uint64_t sub_77CA90()
{
  return Preferences.subscript.getter();
}

uint64_t sub_77CAA0()
{
  return Preferences.subscript.setter();
}

uint64_t sub_77CAB0()
{
  return DiffableLens.subscript.getter();
}

uint64_t sub_77CAC0()
{
  return DiffableLens.value.getter();
}

uint64_t sub_77CAD0()
{
  return dispatch thunk of static EventEmitter.defaultScheduler.getter();
}

uint64_t sub_77CAE0()
{
  return EventEmitter.addObserver<A>(on:target:method:)();
}

uint64_t sub_77CAF0()
{
  return EventEmitter.addObserver(on:singleUse:_:)();
}

uint64_t sub_77CB00()
{
  return EventEmitter.asyncStream.getter();
}

uint64_t sub_77CB10()
{
  return ReadOnlyLens.subscript.getter();
}

uint64_t sub_77CB20()
{
  return ReadOnlyLens.value.getter();
}

uint64_t sub_77CB30()
{
  return ReplayLogger.replay(last:messagesInto:)();
}

uint64_t sub_77CB40()
{
  return ReplayLogger.init()();
}

uint64_t sub_77CB50()
{
  return type metadata accessor for ReplayLogger();
}

uint64_t sub_77CB60()
{
  return static ActionMetrics.notInstrumented.getter();
}

uint64_t sub_77CB70()
{
  return ActionMetrics.init(data:custom:)();
}

uint64_t sub_77CB80()
{
  return type metadata accessor for ActionMetrics();
}

uint64_t sub_77CB90()
{
  return type metadata accessor for ActionOutcome();
}

uint64_t sub_77CBA0()
{
  return MetricsLogger.init(loggerName:configuration:)();
}

uint64_t sub_77CBB0()
{
  return type metadata accessor for MetricsLogger.Configuration();
}

uint64_t sub_77CBC0()
{
  return MetricsLogger.log(contentsOf:)();
}

uint64_t sub_77CBD0()
{
  return type metadata accessor for MetricsLogger();
}

uint64_t sub_77CBE0()
{
  return static PreferenceKey.== infix(_:_:)();
}

uint64_t sub_77CBF0()
{
  return type metadata accessor for PreferenceKey();
}

uint64_t sub_77CC00()
{
  return PreferenceKey.init(_:)();
}

uint64_t sub_77CC10()
{
  return dispatch thunk of TaskScheduler.schedule(task:)();
}

uint64_t sub_77CC20()
{
  return ComponentModel.pairedWith<A>(objectGraph:)();
}

uint64_t sub_77CC30()
{
  return dispatch thunk of ComponentModel.id.getter();
}

uint64_t sub_77CC40()
{
  return CompoundLogger.init(loggers:)();
}

uint64_t sub_77CC50()
{
  return type metadata accessor for CompoundLogger();
}

uint64_t sub_77CC70()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t sub_77CC80()
{
  return dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)();
}

uint64_t sub_77CC90()
{
  return dispatch thunk of BaseObjectGraph.name.setter();
}

uint64_t sub_77CCA0()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t sub_77CCB0()
{
  return dispatch thunk of BaseObjectGraph.adding(dependency:)();
}

uint64_t sub_77CCC0()
{
  return dispatch thunk of BaseObjectGraph.adding<A>(allDependencies:)();
}

uint64_t sub_77CCD0()
{
  return dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
}

uint64_t sub_77CCE0()
{
  return BaseObjectGraph.optional<A>(_:)();
}

uint64_t sub_77CCF0()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t sub_77CD00()
{
  return BaseObjectGraph.__allocating_init(_:)();
}

uint64_t sub_77CD10()
{
  return static MetricsPipeline.objectGraphWithNewPipelineConfiguredWith(optInProviders:optOutProviders:asPartOf:)();
}

uint64_t sub_77CD20()
{
  return MetricsPipeline.process(_:using:)();
}

uint64_t sub_77CD30()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t sub_77CD40()
{
  return static PageRenderEvent.willPerformAction()();
}

uint64_t sub_77CD50()
{
  return ActionDispatcher.targetQueue.getter();
}

uint64_t sub_77CD60()
{
  return ActionDispatcher.add<A>(_:)();
}

uint64_t sub_77CD70()
{
  return ActionDispatcher.perform(_:withMetrics:asPartOf:)();
}

uint64_t sub_77CD80()
{
  return ActionDispatcher.init()();
}

uint64_t sub_77CD90()
{
  return LocalPreferences.removeValue(forKey:)();
}

uint64_t sub_77CDA0()
{
  return static LocalPreferences.currentApplication.getter();
}

uint64_t sub_77CDB0()
{
  return static LocalPreferences.placeholderDisableShelfHydration.getter();
}

uint64_t sub_77CDC0()
{
  return static LocalPreferences.AppStoreKitInternal.getter();
}

uint64_t sub_77CDD0()
{
  return type metadata accessor for LocalPreferences();
}

uint64_t sub_77CDE0()
{
  return ScalarDictionary.init()();
}

uint64_t sub_77CDF0()
{
  return type metadata accessor for ScalarDictionary();
}

uint64_t sub_77CE00()
{
  return type metadata accessor for EventSubscription();
}

uint64_t sub_77CE10()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_77CE20()
{
  return ImpressionMetrics.withParentId(_:)();
}

uint64_t sub_77CE30()
{
  return ImpressionMetrics.ID.index.getter();
}

uint64_t sub_77CE40()
{
  return ImpressionMetrics.ID.parent.getter();
}

uint64_t sub_77CE50()
{
  return ImpressionMetrics.ID.element.getter();
}

uint64_t sub_77CE60()
{
  return type metadata accessor for ImpressionMetrics.ID();
}

uint64_t sub_77CE70()
{
  return ImpressionMetrics.id.getter();
}

uint64_t sub_77CE80()
{
  return ImpressionMetrics.fields.getter();
}

uint64_t sub_77CE90()
{
  return type metadata accessor for ImpressionMetrics();
}

uint64_t sub_77CEA0()
{
  return SyncTaskScheduler.init()();
}

uint64_t sub_77CEB0()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t sub_77CEC0()
{
  return WritableStateLens.init<A>(contentsOf:in:)();
}

uint64_t sub_77CED0()
{
  return WritableStateLens<A>.updateValue(_:)();
}

uint64_t sub_77CEE0()
{
  return WritableStateLens<A>.currentValue.getter();
}

uint64_t sub_77CEF0()
{
  return WritableStateLens<A>.subscript.getter();
}

uint64_t sub_77CF00()
{
  return type metadata accessor for WritableStateLens();
}

uint64_t sub_77CF10()
{
  return WritableStateLens.init(_:)();
}

uint64_t sub_77CF20()
{
  return dispatch thunk of ImpressionsTracker.removeAllImpressions()();
}

uint64_t sub_77CF30()
{
  return dispatch thunk of ImpressionsTracker.elementDidEnterView(_:on:)();
}

uint64_t sub_77CF40()
{
  return dispatch thunk of ImpressionsTracker.elementDidLeaveView(_:on:)();
}

uint64_t sub_77CF50()
{
  return type metadata accessor for LintedMetricsEvent.Issue();
}

uint64_t sub_77CF60()
{
  return LintedMetricsEvent.fields.getter();
}

uint64_t sub_77CF70()
{
  return static SignpostAggregator.log.getter();
}

uint64_t sub_77CF80()
{
  return type metadata accessor for SignpostAggregator();
}

uint64_t sub_77CF90()
{
  return static AutomationSemantics.onboarding(elementName:id:parentId:)();
}

uint64_t sub_77CFA0()
{
  return static AutomationSemantics.offerButton(id:parentId:)();
}

uint64_t sub_77CFB0()
{
  return static AutomationSemantics.productPage(elementName:id:parentId:)();
}

uint64_t sub_77CFC0()
{
  return static AutomationSemantics.searchField()();
}

uint64_t sub_77CFD0()
{
  return static AutomationSemantics.accountButton()();
}

uint64_t sub_77CFE0()
{
  return static AutomationSemantics.dismissButton()();
}

uint64_t sub_77CFF0()
{
  return static AutomationSemantics.shelfItemSubComponent(itemKind:id:parentId:)();
}

uint64_t sub_77D000()
{
  return static AutomationSemantics.page(name:id:)();
}

uint64_t sub_77D010()
{
  return static AutomationSemantics.shelf(_:id:parentId:)();
}

uint64_t sub_77D020()
{
  return AutomationSemantics.attribute(key:value:)();
}

uint64_t sub_77D030()
{
  return static AutomationSemantics.shelfItem(itemKind:id:parentId:)();
}

uint64_t sub_77D040()
{
  return type metadata accessor for AutomationSemantics();
}

uint64_t sub_77D050()
{
  return TransientStateStore.removeState(at:recursively:)();
}

void sub_77D060()
{
}

uint64_t sub_77D070()
{
  return TransientStateStore.init(isConcurrent:)();
}

uint64_t sub_77D080()
{
  return MetricsEventRecorder._recordAsync(_:on:)();
}

uint64_t sub_77D090()
{
  return static MetricsFieldsContext.emptyContext.getter();
}

uint64_t sub_77D0A0()
{
  return static MetricsFieldsContext.createFieldsContext(impressionsTracker:adamIdString:pageContextOverride:referrer:participatingInCrossfireReferral:pageFields:preloaded:advertRotationData:searchGhostHintData:contextualAction:deviceWindowData:impressionsAppendixData:)();
}

uint64_t sub_77D0B0()
{
  return type metadata accessor for MetricsFieldsContext();
}

uint64_t sub_77D0C0()
{
  return static FlowActionPresentation.stackPush.getter();
}

uint64_t sub_77D0D0()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)();
}

uint64_t sub_77D0E0()
{
  return type metadata accessor for BasicImpressionsTracker();
}

uint64_t sub_77D0F0()
{
  return static StartUpPerformanceEvent.Checkpoint.bootstrapFinished.getter();
}

uint64_t sub_77D100()
{
  return type metadata accessor for StartUpPerformanceEvent.Checkpoint();
}

uint64_t sub_77D110()
{
  return StartUpPerformanceEvent.record(checkpoint:)();
}

uint64_t sub_77D120()
{
  return type metadata accessor for StartUpPerformanceEvent();
}

uint64_t sub_77D130()
{
  return static ViewWillDisappearReason.inferred(for:)();
}

uint64_t sub_77D140()
{
  return type metadata accessor for ViewWillDisappearReason();
}

JSValue sub_77D150(JSContext in)
{
  return CustomJSValueConvertible._jsValue(in:)(in);
}

JSValue sub_77D160(JSContext in)
{
  return CustomJSValueConvertible.makeValue(in:)(in);
}

void sub_77D180()
{
}

uint64_t sub_77D190()
{
  return PageRenderMetricsPresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_77D1A0()
{
  return static MetricsFieldExclusionRequest.arcadeSubscription.getter();
}

uint64_t sub_77D1B0()
{
  return type metadata accessor for MetricsFieldExclusionRequest();
}

uint64_t sub_77D1C0()
{
  return static MetricsFieldInclusionRequest.pageFields.getter();
}

uint64_t sub_77D1D0()
{
  return static MetricsFieldInclusionRequest.searchGhostHint.getter();
}

uint64_t sub_77D1E0()
{
  return static MetricsFieldInclusionRequest.arcadeButtonName.getter();
}

uint64_t sub_77D1F0()
{
  return static MetricsFieldInclusionRequest.impressionsSnapshot.getter();
}

uint64_t sub_77D200()
{
  return type metadata accessor for MetricsFieldInclusionRequest();
}

uint64_t sub_77D210()
{
  return Bag.amsBag.getter();
}

uint64_t sub_77D220()
{
  return Bag.init(from:)();
}

uint64_t sub_77D230()
{
  return Bag.Profile.init(name:version:)();
}

uint64_t sub_77D240()
{
  return type metadata accessor for Bag.Profile();
}

uint64_t sub_77D250()
{
  return type metadata accessor for Bag();
}

uint64_t sub_77D260()
{
  return Logger.info(_:)();
}

uint64_t sub_77D270()
{
  return Logger.debug(_:)();
}

uint64_t sub_77D280()
{
  return Logger.error(_:)();
}

uint64_t sub_77D290()
{
  return Logger.warning(_:)();
}

uint64_t sub_77D2A0()
{
  return inject<A>(_:from:)();
}

uint64_t sub_77D2B0()
{
  return inject<A, B>(_:from:)();
}

uint64_t sub_77D2C0()
{
  return type metadata accessor for JSError();
}

uint64_t sub_77D2D0()
{
  return Promise.isResolved.getter();
}

uint64_t sub_77D2E0()
{
  return Promise.pipe(to:)();
}

uint64_t sub_77D2F0()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_77D300()
{
  return Promise.__allocating_init(error:)();
}

uint64_t sub_77D310()
{
  return Promise.__allocating_init(value:)();
}

uint64_t sub_77D320()
{
  return Promise.always(on:perform:)();
}

uint64_t sub_77D330()
{
  return Promise.reject(_:)();
}

uint64_t sub_77D340()
{
  return Promise.resolve(_:)();
}

uint64_t sub_77D350()
{
  return Promise.__allocating_init()();
}

uint64_t sub_77D360()
{
  return type metadata accessor for NilState();
}

uint64_t sub_77D370()
{
  return static OSLogger.inlineUnifiedMessage.getter();
}

uint64_t sub_77D380()
{
  return OSLogger.Subsystem.init(rawValue:)();
}

uint64_t sub_77D390()
{
  return type metadata accessor for OSLogger.Subsystem();
}

uint64_t sub_77D3A0()
{
  return OSLogger.init(subsystem:category:)();
}

uint64_t sub_77D3B0()
{
  return type metadata accessor for OSLogger();
}

uint64_t sub_77D3C0()
{
  return type metadata accessor for JSONArray();
}

uint64_t sub_77D3D0()
{
  return type metadata accessor for JSONError();
}

uint64_t sub_77D3E0()
{
  return StateLens.init<A>(contentsOf:in:)();
}

uint64_t sub_77D3F0()
{
  return StateLens<A>.currentValue.getter();
}

uint64_t sub_77D400()
{
  return StateLens<A>.subscript.getter();
}

uint64_t sub_77D410()
{
  return type metadata accessor for StateLens();
}

uint64_t sub_77D420()
{
  return StateLens.init(_:)();
}

uint64_t sub_77D430()
{
  return StateLens.init(_:)();
}

uint64_t sub_77D440()
{
  return StatePath.init<A>(components:)();
}

uint64_t sub_77D450()
{
  return StatePath<A>.init(_:)();
}

uint64_t sub_77D460()
{
  return StatePath.init(component:)();
}

uint64_t sub_77D470()
{
  return SyncEvent.removeObserver(_:)();
}

uint64_t sub_77D480()
{
  return SyncEvent.post(_:)();
}

uint64_t sub_77D490()
{
  return SyncEvent.init()();
}

uint64_t sub_77D4A0()
{
  return type metadata accessor for SyncEvent();
}

uint64_t sub_77D4B0()
{
  return dispatch thunk of ViewModel.impressionMetrics.getter();
}

uint64_t sub_77D4C0()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t sub_77D4D0()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_77D4E0()
{
  return type metadata accessor for WidgetCenter();
}

NSDictionary sub_77D4F0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_77D500()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_77D510()
{
  return Dictionary.description.getter();
}

uint64_t sub_77D520()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t sub_77D530()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_77D540()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_77D550()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_77D560()
{
  return Dictionary.subscript.setter();
}

uint64_t sub_77D570()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_77D580()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_77D590()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_77D5A0()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t sub_77D5B0()
{
  return dispatch thunk of BidirectionalCollection.formIndex(before:)();
}

uint64_t sub_77D5C0()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_77D5D0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_77D5E0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_77D5F0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

void sub_77D600(Swift::String a1)
{
}

void sub_77D610(Swift::String a1)
{
}

uint64_t sub_77D620()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_77D630()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

NSString sub_77D640()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_77D650()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_77D660()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_77D670()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_77D680()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_77D690()
{
  return String.init(data:encoding:)();
}

uint64_t sub_77D6A0()
{
  return String.init(format:_:)();
}

uint64_t sub_77D6B0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_77D6C0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_77D6D0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_77D6E0()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_77D6F0()
{
  return String.nilIfEmpty.getter();
}

uint64_t sub_77D700()
{
  return String.encapsulated(color:scale:shape:style:platterSize:lineWeight:minimumWidth:)();
}

uint64_t sub_77D710()
{
  return static String.isNilOrEmpty(_:)();
}

BOOL sub_77D720(Swift::String a1)
{
  return String.hasPrefixCaseInsensitive(_:)(a1);
}

uint64_t sub_77D730(Swift::String upToCharacter)
{
  return String.prefix(upToCharacter:)(upToCharacter)._countAndFlagsBits;
}

BOOL sub_77D740(Swift::String_optional expansionFor)
{
  return String.isValid(expansionFor:)(expansionFor);
}

uint64_t sub_77D750()
{
  return String.hash(into:)();
}

uint64_t sub_77D760()
{
  return String.languageAwareOutsets(whenUsedWith:)();
}

uint64_t sub_77D770()
{
  return String.count.getter();
}

uint64_t sub_77D780()
{
  return String.append<A>(contentsOf:)();
}

void sub_77D790(Swift::String a1)
{
}

uint64_t sub_77D7A0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_77D7B0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_77D7D0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_77D7E0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_77D7F0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_77D800()
{
  return String.hashValue.getter();
}

uint64_t sub_77D810(Swift::String repeating, Swift::Int count)
{
  return String.init(repeating:count:)(repeating, count)._countAndFlagsBits;
}

uint64_t sub_77D820()
{
  return String.init<A>(_:)();
}

uint64_t sub_77D830()
{
  return String.subscript.getter();
}

uint64_t sub_77D840()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_77D850()
{
  return dispatch thunk of Sequence._copyToContiguousArray()();
}

uint64_t sub_77D860()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_77D870()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_77D880()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_77D890()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_77D8A0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_77D8B0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_77D8C0()
{
  return Array<A>.bestArtworkLayoutMetrics(for:prioritizing:)();
}

uint64_t sub_77D8D0()
{
  return Array<A>.visibleItemsTransformer(for:observing:asPartOf:)();
}

uint64_t sub_77D8E0()
{
  return Array.isNotEmpty.getter();
}

uint64_t sub_77D8F0()
{
  return Array.chunked(by:)();
}

uint64_t sub_77D900()
{
  return Array<A>.totalTopSupplementaryHeight.getter();
}

uint64_t sub_77D910()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_77D920()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_77D930()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_77D940()
{
  return Array<A>.init(tryDeserializing:using:)();
}

uint64_t sub_77D950()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_77D970()
{
  return static MainActor.shared.getter();
}

uint64_t sub_77D980()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_77D990()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_77D9A0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_77D9B0()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_77D9D0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber sub_77D9E0()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_77D9F0()
{
  return Double.description.getter();
}

uint64_t sub_77DA00()
{
  return Double._roundSlowPath(_:)();
}

uint64_t sub_77DA10()
{
  return Double.rawValue(in:)();
}

uint64_t sub_77DA20()
{
  return Float.description.getter();
}

NSSet sub_77DA30()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_77DA40()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_77DA50()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_77DA60()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber sub_77DA70()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_77DA80()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_77DA90()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_77DAA0()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_77DAC0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_77DAD0()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_77DAE0()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_77DAF0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_77DB00()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_77DB10()
{
  return type metadata accessor for UITextItem.Content();
}

uint64_t sub_77DB20()
{
  return UITextItem.content.getter();
}

uint64_t sub_77DB30()
{
  return CGContextRef.clip(using:)();
}

uint64_t sub_77DB40()
{
  return CGContextRef.move(to:)();
}

uint64_t sub_77DB50()
{
  return CGContextRef.addArc(center:radius:startAngle:endAngle:clockwise:)();
}

uint64_t sub_77DB60()
{
  return CGContextRef.addLine(to:)();
}

uint64_t sub_77DB70()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t sub_77DB80()
{
  return NSDictionary.init(dictionary:)();
}

uint64_t sub_77DB90()
{
  return static UIEdgeInsets.vertical(top:bottom:)();
}

uint64_t sub_77DBA0()
{
  return static UIEdgeInsets.horizontal(left:right:)();
}

uint64_t sub_77DBB0()
{
  return UIEdgeInsets.hash(into:)();
}

uint64_t sub_77DBC0()
{
  return UIRectCorner.caCornerMask.getter();
}

uint64_t sub_77DBD0()
{
  return UITabBarItem.withAXIdentifier(_:)();
}

uint64_t sub_77DBE0()
{
  return static GKLocalPlayer.presentActivitySharingRepromptInOverlay(recipientName:)();
}

uint64_t sub_77DBF0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_77DC00()
{
  return NSUserDefaults.shelfOrthogonalScrollingBehavior.getter();
}

uint64_t sub_77DC10()
{
  return NSUserDefaults.shelfOrthogonalScrollingBehavior.setter();
}

UIBarButtonItem sub_77DC20(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

UIBarButtonItem sub_77DC30(Swift::String_optional title, UIImage_optional image, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(title:image:primaryAction:menu:)(title, image, primaryAction, menu);
}

uint64_t sub_77DC40()
{
  return NSParagraphStyle.isListItem.getter();
}

uint64_t sub_77DC50()
{
  return static NSParagraphStyle.listItem(withFont:)();
}

uint64_t sub_77DC60()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:in:)();
}

uint64_t sub_77DC70()
{
  return UICollectionView.CellRegistration.init(handler:)();
}

uint64_t sub_77DC80()
{
  return UICollectionView.SupplementaryRegistration.init(elementKind:handler:)();
}

uint64_t sub_77DC90()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
}

uint64_t sub_77DCA0()
{
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
}

uint64_t sub_77DCB0()
{
  return UIViewController.traitOverrides.getter();
}

uint64_t sub_77DCC0()
{
  return UIViewController.traitOverrides.setter();
}

uint64_t sub_77DCD0()
{
  return UIViewController.registerForTraitChanges(_:action:)();
}

uint64_t sub_77DCE0()
{
  return UIViewController.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_77DCF0()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_77DD00()
{
  return static CGAffineTransform.== infix(_:_:)();
}

uint64_t sub_77DD10()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_77DD20()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_77DD30()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_77DD40()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_77DD50()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_77DD60()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_77DD70()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_77DD80()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_77DD90()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_77DDA0()
{
  return UITraitCollection.isRegularPad.getter();
}

UITraitCollection sub_77DDB0(__C::UIContentSizeCategory_optional min, __C::UIContentSizeCategory_optional max)
{
  return UITraitCollection.clampingContentSizeCategory(min:max:)(min, max);
}

uint64_t sub_77DDC0()
{
  return UITraitCollection.isSizeClassCompact.getter();
}

uint64_t sub_77DDD0()
{
  return UITraitCollection.isSizeClassRegular.getter();
}

uint64_t sub_77DDE0()
{
  return UITraitCollection.prefersRightToLeftLayouts.getter();
}

uint64_t sub_77DDF0()
{
  return UITraitCollection.prefersAccessibilityLayouts.getter();
}

uint64_t sub_77DE00()
{
  return static UITraitCollection.withSystemPreferredContentSizeCategory.getter();
}

uint64_t sub_77DE10()
{
  return UITraitCollection.modifyingTraits(_:)();
}

uint64_t sub_77DE20()
{
  return static UITraitCollection.systemTraitsAffectingImageLookup.getter();
}

uint64_t sub_77DE30()
{
  return static UITraitCollection.systemTraitsAffectingColorAppearance.getter();
}

uint64_t sub_77DE40()
{
  return NSAttributedString.init(_:)();
}

uint64_t sub_77DE50()
{
  return NSAttributedString.byCollapsingNewlines.getter();
}

uint64_t sub_77DE60()
{
  return NSAttributedString.init(images:for:adjustsImageSizeForAccessibilityContentSizeCategory:interItemSpacing:defaultAttributes:imagesShouldRenderAsTemplates:)();
}

NSAttributedString sub_77DE70(NSAttributedString attributedString, Swift::OpaquePointer defaultAttributes)
{
  return NSAttributedString.init(attributedString:defaultAttributes:)(attributedString, defaultAttributes);
}

uint64_t sub_77DE80()
{
  return static NSNotificationName.VideoDecoderUnavailable.getter();
}

uint64_t sub_77DE90()
{
  return static NSNotificationName.AutoPlayVideoSettingsDidChange.getter();
}

uint64_t sub_77DEA0()
{
  return UITraitEnvironment.withAccessibleContentSizesDisabled.getter();
}

uint64_t sub_77DEB0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_77DEC0()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_77DED0()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t sub_77DEE0()
{
  return UICollectionViewCell.backgroundConfiguration.setter();
}

uint64_t sub_77DEF0()
{
  return static UIImageConfiguration.symbolConfiguration(textStyle:weight:scale:)();
}

uint64_t sub_77DF00()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_77DF10()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_77DF20()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_77DF30()
{
  return static UIContentSizeCategory.> infix(_:_:)();
}

uint64_t sub_77DF40()
{
  return static UIContentSizeCategory.< infix(_:_:)();
}

uint64_t sub_77DF50()
{
  return static UIContentSizeCategory.>= infix(_:_:)();
}

uint64_t sub_77DF60()
{
  return static UIContentSizeCategory.<= infix(_:_:)();
}

uint64_t sub_77DF70()
{
  return static UIViewPropertyAnimator.fadeInPropertyAnimator.getter();
}

uint64_t sub_77DF80()
{
  return static NSCollectionLayoutGroup.emptyLayoutGroup(for:)();
}

uint64_t sub_77DF90()
{
  return NSDirectionalEdgeInsets.edgeInsets.getter();
}

uint64_t sub_77DFA0()
{
  return NSDirectionalEdgeInsets.insetsWithLayoutDirection(in:)();
}

uint64_t sub_77DFB0()
{
  return NSDirectionalEdgeInsets.insetsWithLayoutDirection(_:)();
}

uint64_t sub_77DFC0()
{
  return static UICollectionReusableView.elementKind.getter();
}

uint64_t sub_77DFD0()
{
  return static UICollectionReusableView.defaultReuseIdentifier.getter();
}

uint64_t sub_77DFE0()
{
  return static UICollectionReusableView.matchesItemElementKind(_:)();
}

uint64_t sub_77DFF0()
{
  return static UICollectionReusableView.makeItemScopedElementKind(in:uniquify:)();
}

uint64_t sub_77E000()
{
  return UICollectionViewListCell.accessories.getter();
}

uint64_t sub_77E010()
{
  return UICollectionViewListCell.accessories.setter();
}

uint64_t sub_77E020()
{
  return UIContentUnavailableView.init(configuration:)();
}

uint64_t sub_77E030()
{
  return UIPresentationController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_77E040()
{
  return static NSCollectionLayoutSection.emptyLayoutSection(for:)();
}

uint64_t sub_77E050()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t sub_77E060()
{
  return static UIImageSymbolConfiguration.configuration(textStyle:weight:scale:)();
}

uint64_t sub_77E070()
{
  return UIPopoverPresentationControllerSourceItem.frame(in:)();
}

uint64_t sub_77E080()
{
  return CGRect.withLayoutDirection(using:relativeTo:)();
}

uint64_t sub_77E090()
{
  return static CGRect.frame(centeredWithin:of:)();
}

uint64_t sub_77E0A0()
{
  return static CGRect.frame(pinnedAtTopCenterOf:of:)();
}

uint64_t sub_77E0B0()
{
  return static CGRect.frame(pinnedAtBottomLeftOf:of:)();
}

uint64_t sub_77E0C0()
{
  return CGRect.rounded(originRule:sizeRule:)();
}

uint64_t sub_77E0D0()
{
  return CGRect.rounded(_:)();
}

uint64_t sub_77E0E0()
{
  return CGRect.subtracting(insets:)();
}

uint64_t sub_77E0F0()
{
  return CGRect.withLayoutDirection(in:relativeTo:)();
}

uint64_t sub_77E100()
{
  return CGRect.withLayoutDirection(_:relativeTo:)();
}

uint64_t sub_77E110()
{
  return CGRect.inset(bySeparator:in:)();
}

uint64_t sub_77E120()
{
  return CGRect.adding(outsets:)();
}

uint64_t sub_77E130()
{
  return CGSize.scaled(_:)();
}

uint64_t sub_77E140()
{
  return CGSize.fitting(_:mode:)();
}

uint64_t sub_77E150()
{
  return CGSize.rounded(_:)();
}

uint64_t sub_77E160()
{
  return CGSize.integral.getter();
}

uint64_t sub_77E170()
{
  return CGSize.subtracting(insets:)();
}

uint64_t sub_77E180()
{
  return CGSize.add(outsets:)();
}

uint64_t sub_77E190()
{
  return CGSize.adding(outsets:)();
}

uint64_t sub_77E1A0()
{
  return CGSize.adding(separator:in:)();
}

uint64_t sub_77E1B0()
{
  return static CMTime.== infix(_:_:)();
}

unint64_t sub_77E1C0(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  return (unint64_t)CMTime.init(seconds:preferredTimescale:)(seconds, preferredTimescale);
}

uint64_t sub_77E1D0()
{
  return static UIFont.preferredFont(forUseWith:in:)();
}

uint64_t sub_77E1E0()
{
  return static UIFont.preferredFont(forUseWith:compatibleWith:)();
}

uint64_t sub_77E1F0()
{
  return UIFont.estimatedFirstBaseline.getter();
}

UIMenu sub_77E200(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_77E210()
{
  return UIView.annotate(with:)();
}

uint64_t sub_77E220()
{
  return UIView.boundsBasedPlaceable.getter();
}

uint64_t sub_77E230()
{
  return static UIView.defaultHighlightAlpha.getter();
}

uint64_t sub_77E240()
{
  return UIView.setAutomationSemantics(_:)();
}

uint64_t sub_77E250()
{
  return UIView.withUntransformedFrame.getter();
}

uint64_t sub_77E260()
{
  return UIView.traitOverrides.getter();
}

uint64_t sub_77E270()
{
  return UIView.traitOverrides.setter();
}

uint64_t sub_77E280()
{
  return UIView.registerForTraitChanges(_:action:)();
}

uint64_t sub_77E290()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_77E2A0()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_77E2B0()
{
  return static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
}

uint64_t sub_77E2C0()
{
  return CGPoint.rounded(_:)();
}

uint64_t sub_77E2D0()
{
  return JSValue.subscript.setter();
}

uint64_t sub_77E2E0()
{
  return NSArray.makeIterator()();
}

uint64_t sub_77E2F0()
{
  return static UIColor.defaultLine.getter();
}

uint64_t sub_77E300()
{
  return static UIColor.mediaBorder.getter();
}

uint64_t sub_77E310()
{
  return static UIColor.primaryText.getter();
}

uint64_t sub_77E320()
{
  return static UIColor.tertiaryText.getter();
}

uint64_t sub_77E330()
{
  return static UIColor.secondaryText.getter();
}

uint64_t sub_77E340()
{
  return static UIColor.reviewBackground.getter();
}

uint64_t sub_77E350()
{
  return static UIColor.defaultBackground.getter();
}

uint64_t sub_77E360()
{
  return static UIColor.tableViewBackground.getter();
}

uint64_t sub_77E370()
{
  return static UIColor.tableViewCellChevron.getter();
}

uint64_t sub_77E380()
{
  return static UIColor.placeholderBackground.getter();
}

uint64_t sub_77E390()
{
  return static UIColor.defaultButtonTitleColor.getter();
}

uint64_t sub_77E3A0()
{
  return static UIColor.tableViewCellBackground.getter();
}

uint64_t sub_77E3B0()
{
  return static UIColor.todayCardDefaultBackground.getter();
}

uint64_t sub_77E3C0()
{
  return static UIColor.componentBackgroundStandout.getter();
}

uint64_t sub_77E3D0()
{
  return static UIColor.defaultButtonBackgroundColor.getter();
}

uint64_t sub_77E3E0()
{
  return static UIColor.placeholderBackgroundStandout.getter();
}

uint64_t sub_77E3F0()
{
  return static UIColor.tableViewCellSelectedBackground.getter();
}

uint64_t sub_77E400()
{
  return static UIColor.hex(_:)();
}

UIColor sub_77E410(UIColor light, UIColor dark)
{
  return UIColor.init(light:dark:)(light, dark);
}

uint64_t sub_77E420()
{
  return UIColor.isDark(threshold:)();
}

uint64_t sub_77E430()
{
  return UIColor.isDark.getter();
}

uint64_t sub_77E440()
{
  return static UIColor.appTint.getter();
}

uint64_t sub_77E450()
{
  return UIColor.highlighted.getter();
}

UIColor sub_77E460(UIColor light, UIColor lightHighContrast, UIColor dark, UIColor darkHighContrast)
{
  return UIColor.init(light:lightHighContrast:dark:darkHighContrast:)(light, lightHighContrast, dark, darkHighContrast);
}

UIColor sub_77E470(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
}

uint64_t sub_77E480()
{
  return UIImage.baselineOffsetFromBottom.getter();
}

uint64_t sub_77E490()
{
  return UILabel.stringValue.getter();
}

uint64_t sub_77E4A0()
{
  return UILabel.alignment.setter();
}

uint64_t sub_77E4B0()
{
  return UILabel.textAppearance.setter();
}

uint64_t sub_77E4C0()
{
  return UILabel.measure(toFit:with:)();
}

uint64_t sub_77E4D0(Swift::OpaquePointer fromLanguageCodes)
{
  return NSBundle.preferredLocalization(fromLanguageCodes:)(fromLanguageCodes)._countAndFlagsBits;
}

NSNumber sub_77E4E0(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber sub_77E4F0(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_77E500(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_77E510()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_77E520()
{
  return NSObject.hash(into:)();
}

uint64_t sub_77E530()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_77E540()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_77E550()
{
  return UIButton.measure(toFit:with:)();
}

uint64_t sub_77E560()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.getter();
}

uint64_t sub_77E570()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t sub_77E580()
{
  return UIButton.Configuration.background.modify();
}

uint64_t sub_77E590()
{
  return UIButton.Configuration.background.getter();
}

uint64_t sub_77E5A0()
{
  return UIButton.Configuration.background.setter();
}

uint64_t sub_77E5B0()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t sub_77E5C0()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_77E5D0()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_77E5E0()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t sub_77E5F0()
{
  return UIButton.Configuration.titlePadding.setter();
}

uint64_t sub_77E600()
{
  return UIButton.Configuration.contentInsets.modify();
}

uint64_t sub_77E610()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t sub_77E620()
{
  return UIButton.Configuration.imagePlacement.setter();
}

uint64_t sub_77E630()
{
  return UIButton.Configuration.attributedTitle.modify();
}

uint64_t sub_77E640()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t sub_77E650()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t sub_77E660()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_77E670()
{
  return UIButton.Configuration.imageColorTransformer.setter();
}

uint64_t sub_77E680()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t sub_77E690()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t sub_77E6A0()
{
  return static UIButton.Configuration.gray()();
}

uint64_t sub_77E6B0()
{
  return UIButton.Configuration.image.getter();
}

uint64_t sub_77E6C0()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_77E6D0()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_77E6E0()
{
  return UIButton.Configuration.title.setter();
}

uint64_t sub_77E6F0()
{
  return static UIButton.Configuration.filled()();
}

uint64_t sub_77E700()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_77E710()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_77E720()
{
  return UIButton.configuration.getter();
}

uint64_t sub_77E730()
{
  return UIButton.configuration.setter();
}

uint64_t sub_77E740()
{
  return NSCopying.makeCopy()();
}

uint64_t sub_77E750()
{
  return Optional<A>.isNilOrEmpty.getter();
}

uint64_t sub_77E760()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t sub_77E770()
{
  return type metadata accessor for Optional();
}

uint64_t sub_77E780()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_77E790()
{
  return StringProtocol.uppercased(with:)();
}

uint64_t sub_77E7A0()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_77E7B0()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_77E7C0()
{
  return StringProtocol.enumerateSubstrings<A>(in:options:_:)();
}

uint64_t sub_77E7D0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_77E7E0()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t sub_77E7F0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_77E800()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_77E810()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t sub_77E820()
{
  return dispatch thunk of SetAlgebra.insert(_:)();
}

uint64_t sub_77E830()
{
  return dispatch thunk of SetAlgebra.isEmpty.getter();
}

uint64_t sub_77E840()
{
  return dispatch thunk of SetAlgebra.subtract(_:)();
}

uint64_t sub_77E850()
{
  return dispatch thunk of SetAlgebra.formUnion(_:)();
}

uint64_t sub_77E870()
{
  return dispatch thunk of SetAlgebra.init()();
}

uint64_t sub_77E880()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_77E890()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_77E8A0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_77E8B0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_77E8C0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_77E8D0()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_77E8E0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_77E8F0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_77E900()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_77E910()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_77E920()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_77E930()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_77E940()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_77E950()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_77E960()
{
  return debugPrint(_:separator:terminator:)();
}

uint64_t sub_77E970()
{
  return AnyHashable.description.getter();
}

Swift::Int sub_77E980(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_77E990()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_77E9A0()
{
  return AnyHashable.hash(into:)();
}

uint64_t sub_77E9B0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_77E9C0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_77E9D0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_77E9E0()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_77E9F0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_77EA00(Swift::Int a1)
{
}

uint64_t sub_77EA10()
{
  return StaticString.description.getter();
}

void sub_77EA20(Swift::Int a1)
{
}

uint64_t sub_77EA30()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_77EA40()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_77EA50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_77EA60()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_77EA70()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_77EA80()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_77EA90()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_77EAA0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_77EAB0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_77EAC0()
{
  return _NativeDictionary.makeIterator()();
}

uint64_t sub_77EAD0()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_77EAE0()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_77EAF0()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_77EB00()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_77EB10()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_77EB20()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_77EB30()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_77EB40()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_77EB50()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_77EB60()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_77EB70()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_77EB80()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_77EB90()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_77EBA0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_77EBB0()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int sub_77EBC0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_77EBE0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_77EBF0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_77EC00()
{
  return type metadata accessor for FloatingPointRoundingRule();
}

uint64_t sub_77EC10()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_77EC20()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_77EC30()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_77EC40()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_77EC50()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_77EC60()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_77EC70()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_77EC80()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_77EC90()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_77ECA0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_77ECB0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_77ECC0()
{
  return Error._code.getter();
}

uint64_t sub_77ECD0()
{
  return Error._domain.getter();
}

uint64_t sub_77ECE0()
{
  return Error._userInfo.getter();
}

uint64_t sub_77ECF0()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_77ED00()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_77ED10()
{
  return Hasher.init(_seed:)();
}

void sub_77ED20(Swift::UInt a1)
{
}

void sub_77ED30(Swift::UInt8 a1)
{
}

void sub_77ED40(Swift::UInt64 a1)
{
}

Swift::Int sub_77ED50()
{
  return Hasher.finalize()();
}

Swift::Int sub_77ED60()
{
  return Hasher._finalize()();
}

uint64_t sub_77ED70()
{
  return Hasher.init()();
}

uint64_t sub_77ED80()
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

pid_t getpid(void)
{
  return _getpid();
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