id sub_23C4()
{
  id result;
  void *v1;
  unsigned int v2;

  result = [self sharedConnection];
  if (result)
  {
    v1 = result;
    v2 = [result isPasscodeSet];

    return (id)(v2 ^ 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2424()
{
  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_canBeShownFromSuspendedState);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t sub_247C(uint64_t a1, uint64_t a2)
{
  v5 = (void *)(v2 + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_canBeShownFromSuspendedState);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_release();
}

uint64_t (*sub_24DC())()
{
  return j__swift_endAccess;
}

id sub_253C()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for RTSettingsViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for RTSettingsViewController()
{
  uint64_t result = qword_21EF8;
  if (!qword_21EF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26DC(uint64_t a1)
{
  uint64_t v2 = sub_273C(&qword_217E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_273C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_2780()
{
  id v1 = v0;
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for RTSettingsViewController();
  objc_msgSendSuper2(&v7, "viewDidLoad");
  uint64_t v2 = self;
  NSString v3 = sub_15740();
  id v4 = objc_msgSend(v2, "_coreroutine_LocalizedStringForKey:", v3);

  [v1 setTitle:v4];
  v5 = (uint64_t (*)(void))(*(uint64_t (**)(void))&stru_68.segname[swift_isaMask & *v1])();
  LOBYTE(v3) = v5();
  swift_release();
  if ((v3 & 1) == 0)
  {
    id v6 = [self defaultCenter];
    [v6 addObserver:v1 selector:"viewWasBackgrounded" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
}

uint64_t sub_2924(void *a1)
{
  id v1 = a1;
  sub_8204((uint64_t)&v4);
  id v2 = objc_allocWithZone((Class)sub_273C(&qword_217E8));
  return sub_15400();
}

uint64_t sub_2B0C()
{
  sub_273C(&qword_217E0);
  __chkstk_darwin();
  id v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15220();
  uint64_t v3 = sub_15230();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  uint64_t v4 = v0 + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_sessionStartDate;
  swift_beginAccess();
  sub_2BF4((uint64_t)v2, v4);
  return swift_endAccess();
}

uint64_t sub_2BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_273C(&qword_217E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2C5C()
{
  uint64_t v1 = sub_15230();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_273C(&qword_217E0);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  objc_super v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  v10 = (char *)&v23 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v23 - v11;
  uint64_t v13 = v0 + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_sessionStartDate;
  swift_beginAccess();
  sub_3008(v13, (uint64_t)v12);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48);
  int v15 = v14(v12, 1, v1);
  sub_26DC((uint64_t)v12);
  if (v15 != 1)
  {
    sub_15220();
    sub_3008(v13, (uint64_t)v10);
    if (v14(v10, 1, v1) == 1)
    {
      __break(1u);
    }
    else
    {
      sub_15200();
      v16 = *(void (**)(char *, uint64_t))(v2 + 8);
      v16(v4, v1);
      v16(v10, v1);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v7, 1, 1, v1);
      swift_beginAccess();
      sub_2BF4((uint64_t)v7, v13);
      swift_endAccess();
      sub_273C(&qword_217F0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_16C60;
      *(void *)(inited + 32) = 0x6E6F697461727564;
      *(void *)(inited + 40) = 0xE800000000000000;
      *(NSNumber *)(inited + 48) = sub_157B0();
      unint64_t v18 = sub_3070(inited);
      NSString v19 = sub_15740();
      sub_318C(v18);
      Class isa = sub_15730().super.isa;
      swift_bridgeObjectRelease();
      sub_13C6C(v19, isa);

      NSString v21 = sub_15740();
      sub_3550(v18);
      swift_bridgeObjectRelease();
      sub_3DAC(0, &qword_21DC0);
      Class v22 = sub_15730().super.isa;
      swift_bridgeObjectRelease();
      AnalyticsSendEvent();
    }
  }
}

uint64_t sub_3008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_273C(&qword_217E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_3070(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_273C(&qword_21838);
  uint64_t v2 = (void *)sub_15910();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    objc_super v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_3C48(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_318C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_273C(&qword_21828);
    uint64_t v2 = (void *)sub_15910();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    NSString v19 = *(void **)(*(void *)(a1 + 56) + 8 * v12);
    *(void *)&v37[0] = *v17;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    v19;
    swift_dynamicCast();
    sub_3DAC(0, &qword_21830);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_3DE8(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_3DE8(v36, v37);
    sub_3DE8(v37, &v33);
    uint64_t result = sub_158E0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_3DE8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_3CC0();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_3550(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_273C((uint64_t *)&unk_21DD0);
    uint64_t v2 = (void *)sub_15910();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_3CC0();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    int64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_3C48(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      objc_super v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *objc_super v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    char v23 = (uint64_t *)(v2[6] + 16 * v20);
    *char v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void sub_37F4()
{
  id v1 = [v0 navigationController];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 popViewControllerAnimated:0];
  }
}

uint64_t sub_3A8C()
{
  return type metadata accessor for RTSettingsViewController();
}

void sub_3B54()
{
  sub_3BF0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_3BF0()
{
  if (!qword_21820)
  {
    sub_15230();
    unint64_t v0 = sub_15850();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_21820);
    }
  }
}

unint64_t sub_3C48(uint64_t a1, uint64_t a2)
{
  sub_15930();
  sub_15780();
  Swift::Int v4 = sub_15940();

  return sub_3CC8(a1, a2, v4);
}

uint64_t sub_3CC0()
{
  return swift_release();
}

unint64_t sub_3CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_15920() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_15920() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_3DAC(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_3DE8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_3DF8()
{
  unint64_t result = qword_21840;
  if (!qword_21840)
  {
    type metadata accessor for RTSettingsController();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21840);
  }
  return result;
}

uint64_t sub_3E50(uint64_t a1)
{
  return a1;
}

uint64_t sub_3E7C(uint64_t a1)
{
  return a1;
}

uint64_t sub_3EA8()
{
  sub_273C(&qword_21870);
  sub_15610();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_15900();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v0 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (v0)
  {
    sub_15610();
    sub_273C(&qword_21878);
    return sub_15620();
  }
  return result;
}

uint64_t sub_3FB4(uint64_t a1)
{
  return sub_4018(a1, (uint64_t)sub_3FDC, (uint64_t)&unk_1D1F0, &qword_21ED8);
}

id sub_3FDC(void *a1)
{
  return sub_40EC(a1, (SEL *)&selRef_whiteColor, (SEL *)&selRef_blackColor);
}

uint64_t sub_3FF0(uint64_t a1)
{
  return sub_4018(a1, (uint64_t)sub_40D8, (uint64_t)&unk_1D1C8, &qword_21EE0);
}

uint64_t sub_4018(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = objc_allocWithZone((Class)UIColor);
  v11[4] = a2;
  v11[5] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_97B4;
  v11[3] = a3;
  uint64_t v8 = _Block_copy(v11);
  id v9 = [v7 initWithDynamicProvider:v8];
  _Block_release(v8);
  uint64_t result = swift_release();
  *a4 = v9;
  return result;
}

id sub_40D8(void *a1)
{
  return sub_40EC(a1, (SEL *)&selRef_systemGray6Color, (SEL *)&selRef_whiteColor);
}

id sub_40EC(void *a1, SEL *a2, SEL *a3)
{
  uint64_t v5 = (char *)[a1 userInterfaceStyle];
  unint64_t v6 = self;
  if (v5 == (unsigned char *)&dword_0 + 2) {
    id v7 = a2;
  }
  else {
    id v7 = a3;
  }
  id v8 = [v6 *v7];

  return v8;
}

uint64_t sub_4158(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = sub_3EA8();
  if (a3)
  {
    __break(1u);
  }
  else
  {
    sub_273C(&qword_21B40);
    return sub_15620();
  }
  return result;
}

uint64_t sub_41CC()
{
  return sub_4158(v0 + 16, *(void *)(v0 + 256), *(unsigned char *)(v0 + 264));
}

uint64_t sub_41E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [a1 preferredName];
  if (!v4)
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0xE000000000000000;
LABEL_5:
    if (v8 == 0xE000000000000000) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_15760();
  uint64_t v8 = v7;

  if (!v6) {
    goto LABEL_5;
  }
LABEL_6:
  if ((sub_15920() & 1) == 0)
  {
    uint64_t v9 = sub_153E0();
    uint64_t v10 = sub_153C0();
    uint64_t v11 = sub_153F0();
    sub_45D8(v6, v8, (unint64_t)a1, (uint64_t *)&v37);
    swift_bridgeObjectRelease();
    *(_DWORD *)unint64_t v20 = *(_DWORD *)v17;
    *(_DWORD *)&v20[3] = *(_DWORD *)&v17[3];
    *(_DWORD *)&v24[3] = *(_DWORD *)&v16[3];
    *(_DWORD *)uint64_t v24 = *(_DWORD *)v16;
    *(_DWORD *)&v28[3] = *(_DWORD *)&v15[3];
    *(_DWORD *)uint64_t v28 = *(_DWORD *)v15;
    *(_DWORD *)&v31[3] = *(_DWORD *)&v14[3];
    *(_DWORD *)uint64_t v31 = *(_DWORD *)v14;
    *(_DWORD *)&v35[3] = *(_DWORD *)&v13[3];
    *(_DWORD *)uint64_t v35 = *(_DWORD *)v13;
    v18[0] = v9;
    v18[1] = 0;
    char v19 = 1;
    uint64_t v21 = v10;
    uint64_t v22 = 0;
    char v23 = 1;
    uint64_t v25 = v11;
    uint64_t v26 = 0;
    char v27 = 1;
    long long v29 = v37;
    char v30 = v38;
    uint64_t v32 = v39;
    long long v33 = v40;
    char v34 = v41;
    uint64_t v36 = v42;
    nullsub_1(v18);
    goto LABEL_9;
  }
LABEL_7:
  swift_bridgeObjectRelease();
  sub_BF48((uint64_t)v18);
LABEL_9:
  sub_BEE4((uint64_t)v18, (uint64_t)&v37, &qword_21880);
  return sub_BEE4((uint64_t)&v37, a2, &qword_21880);
}

uint64_t sub_43D0@<X0>(uint64_t a1@<X8>)
{
  return sub_41E0(*(void **)(v1 + 16), a1);
}

uint64_t sub_43D8(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_44F8()
{
  unint64_t result = qword_21888;
  if (!qword_21888)
  {
    sub_4590(&qword_21880);
    sub_BAB4(&qword_21890, &qword_21898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21888);
  }
  return result;
}

uint64_t sub_4590(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_45D8(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  v72 = a4;
  uint64_t v7 = sub_273C(&qword_21C50);
  __chkstk_darwin(v7 - 8);
  v71 = &v64[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_15230();
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  __chkstk_darwin(v10);
  uint64_t v66 = sub_151E0();
  uint64_t v11 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  int64_t v13 = &v64[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v73 = a1;
  uint64_t v74 = a2;
  unint64_t v14 = sub_81A0();
  swift_bridgeObjectRetain();
  unint64_t v67 = v14;
  uint64_t v15 = sub_15550();
  uint64_t v17 = v16;
  char v19 = v18;
  if (qword_21F10 != -1) {
    swift_once();
  }
  id v20 = (id)qword_21ED8;
  sub_155F0();
  uint64_t v21 = sub_15520();
  uint64_t v68 = v22;
  uint64_t v69 = v21;
  int v65 = v23;
  uint64_t v70 = v24;
  swift_release();
  sub_B0B0(v15, v17, v19 & 1);
  swift_bridgeObjectRelease();
  id v25 = [(id)a3 visits];
  sub_3DAC(0, (unint64_t *)&unk_21C60);
  unint64_t v26 = sub_157A0();

  if (!(v26 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_5;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_15900();
  swift_bridgeObjectRelease();
  if (!v62) {
    goto LABEL_15;
  }
LABEL_5:
  if ((v26 & 0xC000000000000001) != 0)
  {
LABEL_16:
    id v27 = (id)sub_158F0();
    goto LABEL_8;
  }
  if (!*(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)))
  {
    __break(1u);
    goto LABEL_18;
  }
  id v27 = *(id *)(v26 + 32);
LABEL_8:
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  id v29 = [v28 entryDate];

  sub_15210();
  id v30 = [(id)a3 visits];
  a3 = sub_157A0();

  if (!(a3 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_10;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_20;
  }
LABEL_18:
  swift_bridgeObjectRetain();
  uint64_t v63 = sub_15900();
  swift_bridgeObjectRelease();
  if (!v63) {
    goto LABEL_19;
  }
LABEL_10:
  if ((a3 & 0xC000000000000001) != 0)
  {
LABEL_20:
    id v31 = (id)sub_158F0();
    goto LABEL_13;
  }
  if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)))
  {
    id v31 = *(id *)(a3 + 32);
LABEL_13:
    uint64_t v32 = v31;
    swift_bridgeObjectRelease();
    char v33 = v65 & 1;
    char v34 = self;
    id v35 = [v32 exitDate];

    sub_15210();
    sub_151D0();
    Class isa = sub_151B0().super.isa;
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v66);
    id v37 = [v34 configureDateRangeString:isa dateStyle:2 timeStyle:1];

    uint64_t v38 = sub_15760();
    uint64_t v40 = v39;

    uint64_t v73 = v38;
    uint64_t v74 = v40;
    uint64_t v41 = sub_15550();
    uint64_t v43 = v42;
    LOBYTE(v35) = v44 & 1;
    uint64_t v45 = sub_154E0();
    uint64_t v46 = (uint64_t)v71;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v71, 1, 1, v45);
    sub_154F0();
    sub_BCAC(v46, &qword_21C50);
    uint64_t v47 = sub_15540();
    uint64_t v49 = v48;
    char v51 = v50;
    swift_release();
    char v52 = v51 & 1;
    sub_B0B0(v41, v43, (char)v35);
    swift_bridgeObjectRelease();
    sub_155D0();
    uint64_t v53 = sub_15520();
    uint64_t v55 = v54;
    LOBYTE(v35) = v56;
    uint64_t v58 = v57;
    swift_release();
    LOBYTE(v38) = v35 & 1;
    sub_B0B0(v47, v49, v52);
    swift_bridgeObjectRelease();
    LOBYTE(v73) = v33;
    v59 = v72;
    uint64_t v61 = v68;
    uint64_t v60 = v69;
    uint64_t *v72 = v69;
    v59[1] = v61;
    *((unsigned char *)v59 + 16) = v33;
    v59[3] = v70;
    v59[4] = v53;
    v59[5] = v55;
    *((unsigned char *)v59 + 48) = v38;
    v59[7] = v58;
    sub_B0C0(v60, v61, v33);
    swift_bridgeObjectRetain();
    sub_B0C0(v53, v55, v38);
    swift_bridgeObjectRetain();
    sub_B0B0(v53, v55, v38);
    swift_bridgeObjectRelease();
    sub_B0B0(v60, v61, v73);
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t sub_4C40(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_15880();
    uint64_t v5 = v4;
    sub_158D0();
    char v6 = sub_15890();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_B138(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_9938(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_B138(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_9BB0(a1);
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

uint64_t sub_4D50@<X0>(uint64_t a1@<X8>)
{
  void (*v23)(void *__return_ptr, uint64_t);
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  unsigned char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned char v42[12];
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  unsigned char *v51;
  unsigned char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned char *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  unsigned char *v70;
  uint64_t v71;
  unsigned __int8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned __int8 v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t (*v92)();
  _OWORD *v93;
  uint64_t (*v94)();
  _OWORD *v95;
  uint64_t v96;
  uint64_t v97;
  void v98[12];
  char v99[40];
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;

  uint64_t v2 = v1;
  uint64_t v55 = a1;
  uint64_t v3 = sub_273C((uint64_t *)&unk_218A0);
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  char v52 = &v42[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_153E0();
  uint64_t v6 = sub_153E0();
  uint64_t v7 = (_OWORD *)swift_allocObject();
  long long v8 = *(_OWORD *)(v2 + 208);
  v7[13] = *(_OWORD *)(v2 + 192);
  v7[14] = v8;
  v7[15] = *(_OWORD *)(v2 + 224);
  long long v9 = *(_OWORD *)(v2 + 144);
  v7[9] = *(_OWORD *)(v2 + 128);
  v7[10] = v9;
  long long v10 = *(_OWORD *)(v2 + 176);
  v7[11] = *(_OWORD *)(v2 + 160);
  v7[12] = v10;
  long long v11 = *(_OWORD *)(v2 + 80);
  v7[5] = *(_OWORD *)(v2 + 64);
  v7[6] = v11;
  long long v12 = *(_OWORD *)(v2 + 112);
  v7[7] = *(_OWORD *)(v2 + 96);
  v7[8] = v12;
  long long v13 = *(_OWORD *)(v2 + 16);
  v7[1] = *(_OWORD *)v2;
  v7[2] = v13;
  long long v14 = *(_OWORD *)(v2 + 48);
  v7[3] = *(_OWORD *)(v2 + 32);
  v7[4] = v14;
  uint64_t v15 = (_OWORD *)swift_allocObject();
  long long v16 = *(_OWORD *)(v2 + 208);
  v15[13] = *(_OWORD *)(v2 + 192);
  v15[14] = v16;
  v15[15] = *(_OWORD *)(v2 + 224);
  long long v17 = *(_OWORD *)(v2 + 144);
  v15[9] = *(_OWORD *)(v2 + 128);
  v15[10] = v17;
  long long v18 = *(_OWORD *)(v2 + 176);
  v15[11] = *(_OWORD *)(v2 + 160);
  v15[12] = v18;
  long long v19 = *(_OWORD *)(v2 + 80);
  v15[5] = *(_OWORD *)(v2 + 64);
  v15[6] = v19;
  long long v20 = *(_OWORD *)(v2 + 112);
  unsigned char v15[7] = *(_OWORD *)(v2 + 96);
  v15[8] = v20;
  long long v21 = *(_OWORD *)(v2 + 16);
  v15[1] = *(_OWORD *)v2;
  v15[2] = v21;
  long long v22 = *(_OWORD *)(v2 + 48);
  v15[3] = *(_OWORD *)(v2 + 32);
  v15[4] = v22;
  v86 = v5;
  v87 = 0;
  v88 = 1;
  v89 = v6;
  v90 = 0;
  v91 = 1;
  v92 = sub_5268;
  v93 = v7;
  v94 = sub_7DF0;
  v95 = v15;
  v96 = 0;
  v97 = 0;
  int v23 = *(void (**)(void *__return_ptr, uint64_t))((char *)&stru_B8.size
                                                             + (swift_isaMask & **(void **)(v2 + 8)));
  sub_43D8(v2);
  uint64_t v24 = sub_43D8(v2);
  v23(v98, v24);
  uint64_t result = sub_BEE4((uint64_t)v98, (uint64_t)v99, &qword_21CD0);
  if (v100)
  {
    id v27 = v101;
    unint64_t v26 = v102;
    swift_bridgeObjectRetain();
    sub_B224((uint64_t)v98, (void (*)(void, void, void, void, void, void, void, void, void, void, void, char))sub_7DF8);
    uint64_t v28 = 0x206E776F6E6B6E55;
    if (v26) {
      uint64_t v28 = v27;
    }
    id v29 = 0xED0000726F727245;
    if (v26) {
      id v29 = v26;
    }
    v84 = v28;
    v85 = v29;
    type metadata accessor for RTSettingsController();
    sub_3DF8();
    id v30 = (void *)sub_15330();
    swift_getKeyPath();
    sub_15340();
    swift_release();

    id v31 = v70;
    uint64_t v32 = v71;
    char v50 = v71;
    char v51 = v70;
    uint64_t v49 = v72;
    char v33 = v74;
    uint64_t v47 = v75;
    uint64_t v48 = v73;
    char v34 = v77;
    id v35 = v78;
    uint64_t v45 = v79;
    uint64_t v46 = v76;
    uint64_t v36 = v80;
    char v44 = v81;
    id v37 = v82;
    uint64_t v43 = v83;
    swift_getKeyPath();
    char v56 = v31;
    uint64_t v57 = v32;
    uint64_t v58 = v49;
    v59 = v48;
    uint64_t v60 = v33;
    uint64_t v61 = v47;
    uint64_t v62 = v46;
    uint64_t v63 = v34;
    v64 = v35;
    int v65 = v45;
    uint64_t v66 = v36;
    unint64_t v67 = v44;
    uint64_t v68 = v37;
    uint64_t v69 = v43;
    sub_273C(&qword_218B0);
    sub_15690();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = swift_bridgeObjectRelease();
    char v51 = v42;
    __chkstk_darwin(v38);
    sub_273C(&qword_218B8);
    sub_273C(&qword_218C0);
    sub_8100();
    sub_81A0();
    sub_BAB4(&qword_218E8, &qword_218C0);
    uint64_t v39 = v52;
    sub_155A0();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v40 = (uint64_t)v94;
    uint64_t v41 = v96;
    swift_release();
    sub_81F4(v40);
    sub_81F4(v41);
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v53 + 32))(v55, v39, v54);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_5260()
{
  return sub_BD78(256);
}

uint64_t sub_5268()
{
  return sub_15510();
}

void sub_5300(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, char *a3@<X8>)
{
  unint64_t v67 = a2;
  uint64_t v68 = a3;
  uint64_t v70 = sub_273C(&qword_21B58);
  uint64_t v69 = *(void *)(v70 - 8);
  uint64_t v4 = __chkstk_darwin(v70);
  v81 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v77 = (char *)&v65 - v6;
  uint64_t v7 = sub_273C(&qword_21B60);
  uint64_t v75 = *(void *)(v7 - 8);
  uint64_t v76 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  v80 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v66 = (char *)&v65 - v11;
  __chkstk_darwin(v10);
  v78 = (char *)&v65 - v12;
  uint64_t v13 = sub_273C(&qword_21B68);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v83 = v13;
  uint64_t v84 = v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v79 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  long long v19 = (char *)&v65 - v18;
  __chkstk_darwin(v17);
  v82 = (char *)&v65 - v20;
  uint64_t v74 = sub_273C(&qword_21B70);
  uint64_t v73 = *(void *)(v74 - 8);
  uint64_t v21 = __chkstk_darwin(v74);
  v72 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v65 - v23;
  long long v86 = *(_OWORD *)(a1 + 104);
  uint64_t v87 = *(void *)(a1 + 120);
  sub_273C(&qword_21B38);
  sub_15610();
  long long v86 = v89;
  uint64_t v85 = a1;
  sub_273C(&qword_21B78);
  uint64_t v25 = sub_4590(&qword_21B80);
  unint64_t v26 = sub_B5BC();
  *(void *)&long long v89 = v25;
  *((void *)&v89 + 1) = v26;
  swift_getOpaqueTypeConformance2();
  sub_B680();
  v71 = v24;
  sub_156E0();
  id v27 = self;
  NSString v28 = sub_15740();
  id v29 = objc_msgSend(v27, "_coreroutine_LocalizedStringForKey:", v28);

  if (v29)
  {
    uint64_t v30 = sub_15760();
    uint64_t v32 = v31;

    *(void *)&long long v86 = v30;
    *((void *)&v86 + 1) = v32;
    sub_81A0();
    *(void *)&long long v86 = sub_15550();
    *((void *)&v86 + 1) = v33;
    LOBYTE(v87) = v34 & 1;
    uint64_t v88 = v35;
    __chkstk_darwin(v86);
    *(&v65 - 2) = (void (*)(char *, char *, uint64_t))a1;
    sub_273C(&qword_21BB8);
    sub_BAB4(&qword_21BC0, &qword_21BB8);
    sub_156C0();
    (*(void (**)(char *, char *, uint64_t))(v84 + 32))(v82, v19, v83);
    NSString v36 = sub_15740();
    id v37 = objc_msgSend(v27, "_coreroutine_LocalizedStringForKey:", v36);

    if (v37)
    {
      uint64_t v38 = sub_15760();
      uint64_t v40 = v39;

      *(void *)&long long v86 = v38;
      *((void *)&v86 + 1) = v40;
      __chkstk_darwin(v41);
      uint64_t v42 = v67;
      *(&v65 - 2) = (void (*)(char *, char *, uint64_t))a1;
      *(&v65 - 1) = v42;
      sub_273C(&qword_21BC8);
      sub_B754();
      uint64_t v43 = v66;
      sub_156B0();
      uint64_t v45 = v75;
      uint64_t v44 = v76;
      uint64_t v46 = (*(uint64_t (**)(char *, char *, uint64_t))(v75 + 32))(v78, v43, v76);
      __chkstk_darwin(v46);
      *(&v65 - 2) = (void (*)(char *, char *, uint64_t))a1;
      sub_273C(&qword_21BE8);
      uint64_t v47 = sub_4590(&qword_218C0);
      uint64_t v48 = sub_BAB4(&qword_218E8, &qword_218C0);
      *(void *)&long long v86 = v47;
      *((void *)&v86 + 1) = v48;
      swift_getOpaqueTypeConformance2();
      uint64_t v49 = v77;
      sub_156D0();
      char v50 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
      char v51 = v72;
      uint64_t v52 = v74;
      v50(v72, v71, v74);
      unint64_t v67 = *(void (**)(char *, char *, uint64_t))(v84 + 16);
      v67(v79, v82, v83);
      uint64_t v66 = *(char **)(v45 + 16);
      ((void (*)(char *, char *, uint64_t))v66)(v80, v78, v44);
      uint64_t v53 = v69;
      int v65 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
      uint64_t v54 = v49;
      uint64_t v55 = v70;
      v65(v81, v54, v70);
      char v56 = v68;
      v50(v68, v51, v52);
      uint64_t v57 = (int *)sub_273C(&qword_21BF0);
      uint64_t v58 = v83;
      v67(&v56[v57[12]], v79, v83);
      uint64_t v59 = v76;
      ((void (*)(char *, char *, uint64_t))v66)(&v56[v57[16]], v80, v76);
      v65(&v56[v57[20]], v81, v55);
      uint64_t v60 = *(void (**)(char *, uint64_t))(v53 + 8);
      v60(v77, v55);
      uint64_t v61 = *(void (**)(char *, uint64_t))(v75 + 8);
      v61(v78, v59);
      uint64_t v62 = *(void (**)(char *, uint64_t))(v84 + 8);
      v84 += 8;
      v62(v82, v58);
      uint64_t v63 = *(void (**)(char *, uint64_t))(v73 + 8);
      uint64_t v64 = v74;
      v63(v71, v74);
      v60(v81, v55);
      v61(v80, v59);
      v62(v79, v83);
      v63(v72, v64);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_5C68(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_273C(&qword_21B98);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_273C(&qword_21B80);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_273C(&qword_21B78);
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  __chkstk_darwin(v10);
  uint64_t v30 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = self;
  NSString v13 = sub_15740();
  id v14 = objc_msgSend(v12, "_coreroutine_LocalizedStringForKey:", v13);

  if (v14)
  {
    uint64_t v15 = sub_15760();
    uint64_t v17 = v16;

    *(void *)&long long v36 = v15;
    *((void *)&v36 + 1) = v17;
    long long v37 = *((_OWORD *)a1 + 2);
    long long v34 = *((_OWORD *)a1 + 2);
    sub_273C(&qword_21850);
    sub_15630();
    sub_81A0();
    sub_15670();
    long long v35 = v37;
    sub_15610();
    char v18 = v36;
    long long v19 = (_OWORD *)swift_allocObject();
    long long v20 = *((_OWORD *)a1 + 13);
    v19[13] = *((_OWORD *)a1 + 12);
    v19[14] = v20;
    v19[15] = *((_OWORD *)a1 + 14);
    long long v21 = *((_OWORD *)a1 + 9);
    v19[9] = *((_OWORD *)a1 + 8);
    v19[10] = v21;
    long long v22 = *((_OWORD *)a1 + 11);
    v19[11] = *((_OWORD *)a1 + 10);
    v19[12] = v22;
    long long v23 = *((_OWORD *)a1 + 5);
    v19[5] = *((_OWORD *)a1 + 4);
    v19[6] = v23;
    long long v24 = *((_OWORD *)a1 + 7);
    v19[7] = *((_OWORD *)a1 + 6);
    v19[8] = v24;
    long long v25 = *((_OWORD *)a1 + 1);
    v19[1] = *(_OWORD *)a1;
    v19[2] = v25;
    long long v26 = *((_OWORD *)a1 + 3);
    v19[3] = *((_OWORD *)a1 + 2);
    v19[4] = v26;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
    id v27 = &v9[*(int *)(v7 + 36)];
    *id v27 = v18;
    *((void *)v27 + 1) = sub_BBF4;
    *((void *)v27 + 2) = v19;
    sub_43D8((uint64_t)a1);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    long long v36 = *((_OWORD *)a1 + 3);
    uint64_t v28 = sub_15630();
    __chkstk_darwin(v28);
    *(&v30 - 2) = a1;
    sub_B5BC();
    id v29 = v30;
    sub_15580();
    swift_release();
    swift_release();
    sub_BCAC((uint64_t)v9, &qword_21B80);
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v33, v29, v32);
  }
  else
  {
    __break(1u);
  }
}

void sub_6068(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = sub_155C0();
  uint64_t v80 = *(void *)(v3 - 8);
  uint64_t v81 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  v82 = (char *)v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v74 - v6;
  uint64_t v8 = self;
  NSString v9 = sub_15740();
  id v10 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v9);

  if (!v10)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v11 = sub_15760();
  uint64_t v13 = v12;

  uint64_t v83 = v11;
  uint64_t v84 = v13;
  sub_81A0();
  uint64_t v14 = sub_15550();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  long long v19 = (_OWORD *)swift_allocObject();
  long long v20 = a1[13];
  v19[13] = a1[12];
  v19[14] = v20;
  v19[15] = a1[14];
  long long v21 = a1[9];
  v19[9] = a1[8];
  v19[10] = v21;
  long long v22 = a1[11];
  v19[11] = a1[10];
  v19[12] = v22;
  long long v23 = a1[5];
  v19[5] = a1[4];
  v19[6] = v23;
  long long v24 = a1[7];
  v19[7] = a1[6];
  v19[8] = v24;
  long long v25 = a1[1];
  v19[1] = *a1;
  v19[2] = v25;
  long long v26 = a1[3];
  v19[3] = a1[2];
  v19[4] = v26;
  sub_43D8((uint64_t)a1);
  sub_155B0();
  swift_release();
  sub_B0B0(v14, v16, v18);
  swift_bridgeObjectRelease();
  NSString v27 = sub_15740();
  id v28 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v27);

  if (!v28)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v29 = sub_15760();
  uint64_t v31 = v30;

  uint64_t v83 = v29;
  uint64_t v84 = v31;
  uint64_t v32 = sub_15550();
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  long long v37 = (_OWORD *)swift_allocObject();
  long long v38 = a1[13];
  v37[13] = a1[12];
  v37[14] = v38;
  v37[15] = a1[14];
  long long v39 = a1[9];
  v37[9] = a1[8];
  v37[10] = v39;
  long long v40 = a1[11];
  v37[11] = a1[10];
  v37[12] = v40;
  long long v41 = a1[5];
  v37[5] = a1[4];
  v37[6] = v41;
  long long v42 = a1[7];
  v37[7] = a1[6];
  v37[8] = v42;
  long long v43 = a1[1];
  v37[1] = *a1;
  _OWORD v37[2] = v43;
  long long v44 = a1[3];
  v37[3] = a1[2];
  v37[4] = v44;
  sub_43D8((uint64_t)a1);
  sub_155B0();
  swift_release();
  sub_B0B0(v32, v34, v36);
  swift_bridgeObjectRelease();
  NSString v45 = sub_15740();
  id v46 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v45);

  if (!v46)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v47 = sub_15760();
  uint64_t v49 = v48;

  uint64_t v83 = v47;
  uint64_t v84 = v49;
  uint64_t v50 = sub_15550();
  uint64_t v77 = v51;
  uint64_t v78 = v50;
  int v75 = v52;
  uint64_t v76 = v53;
  NSString v54 = sub_15740();
  id v55 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v54);

  if (v55)
  {
    char v56 = v7;
    uint64_t v57 = sub_15760();
    uint64_t v59 = v58;

    uint64_t v83 = v57;
    uint64_t v84 = v59;
    uint64_t v60 = sub_15550();
    v74[1] = v61;
    v74[2] = v60;
    sub_273C(&qword_21BF8);
    uint64_t v62 = v80;
    uint64_t v63 = *(void *)(v80 + 72);
    unint64_t v64 = (*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
    uint64_t v65 = swift_allocObject();
    *(_OWORD *)(v65 + 16) = xmmword_16CC0;
    unint64_t v66 = v65 + v64;
    unint64_t v67 = *(void (**)(unint64_t, char *, uint64_t))(v62 + 16);
    uint64_t v68 = v56;
    uint64_t v69 = v56;
    uint64_t v70 = v81;
    v67(v66, v68, v81);
    unint64_t v71 = v66 + v63;
    v72 = v82;
    v67(v71, v82, v70);
    sub_152F0();
    uint64_t v73 = *(void (**)(char *, uint64_t))(v62 + 8);
    v73(v72, v70);
    v73(v69, v70);
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_65B0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_273C(&qword_21C50);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  NSString v8 = sub_15740();
  id v9 = objc_msgSend(v7, "_coreroutine_LocalizedStringForKey:", v8);

  if (v9)
  {
    sub_15760();

    sub_273C(&qword_21C58);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_16C60;
    long long v49 = *(_OWORD *)(a1 + 64);
    sub_273C(&qword_21B40);
    sub_15610();
    uint64_t v11 = v51;
    *(void *)(v10 + 56) = &type metadata for Int;
    *(void *)(v10 + 64) = &protocol witness table for Int;
    *(void *)(v10 + 32) = v11;
    uint64_t v12 = sub_15750();
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&long long v49 = v12;
    *((void *)&v49 + 1) = v14;
    sub_81A0();
    uint64_t v47 = sub_15550();
    uint64_t v48 = v15;
    uint64_t v17 = v16;
    int v46 = v18;
    long long v49 = *(_OWORD *)(a1 + 80);
    uint64_t v50 = *(void *)(a1 + 96);
    sub_273C(&qword_21B38);
    sub_15610();
    if (v51 == __PAIR128__(0xE000000000000000, 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
    }
    else
    {
      NSString v45 = v6;
      char v23 = sub_15920();
      swift_bridgeObjectRelease();
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      if ((v23 & 1) == 0)
      {
        long long v49 = *(_OWORD *)(a1 + 80);
        uint64_t v50 = *(void *)(a1 + 96);
        sub_15610();
        long long v49 = v51;
        uint64_t v24 = sub_15550();
        uint64_t v26 = v25;
        char v28 = v27 & 1;
        uint64_t v29 = sub_154E0();
        uint64_t v30 = (uint64_t)v45;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v45, 1, 1, v29);
        sub_154F0();
        sub_BCAC(v30, &qword_21C50);
        uint64_t v31 = sub_15540();
        v44[1] = v33;
        NSString v45 = v32;
        char v35 = v34;
        swift_release();
        sub_B0B0(v24, v26, v28);
        swift_bridgeObjectRelease();
        sub_155D0();
        uint64_t v36 = (uint64_t)v45;
        LOBYTE(v26) = v35 & 1;
        uint64_t v19 = sub_15520();
        uint64_t v20 = v37;
        LOBYTE(v30) = v38;
        uint64_t v22 = v39;
        swift_release();
        uint64_t v21 = v30 & 1;
        sub_B0B0(v31, v36, v26);
        swift_bridgeObjectRelease();
      }
    }
    char v40 = v46;
    char v41 = v46 & 1;
    uint64_t v43 = v47;
    uint64_t v42 = v48;
    *(void *)a2 = v47;
    *(void *)(a2 + 8) = v17;
    *(unsigned char *)(a2 + 16) = v40 & 1;
    *(void *)(a2 + 24) = v42;
    *(void *)(a2 + 32) = v19;
    *(void *)(a2 + 40) = v20;
    *(void *)(a2 + 48) = v21;
    *(void *)(a2 + 56) = v22;
    sub_B0C0(v43, v17, v40 & 1);
    swift_bridgeObjectRetain();
    sub_BB64(v19, v20, v21, v22);
    sub_BBA8(v19, v20, v21, v22);
    sub_B0B0(v43, v17, v41);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_69E4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v53 = sub_273C(&qword_21C00);
  __chkstk_darwin(v53);
  uint64_t v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_273C(&qword_21BE0);
  __chkstk_darwin(v54);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_273C(&qword_21C08);
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v41 - v11;
  long long v64 = *(_OWORD *)(a1 + 168);
  long long v60 = *(_OWORD *)(a1 + 168);
  sub_273C(&qword_21870);
  sub_15610();
  if ((unint64_t)v57 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_15900();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((char *)&dword_10 + (v57 & 0xFFFFFFFFFFFFFF8));
  }
  swift_bridgeObjectRelease();
  if (v13)
  {
    long long v14 = *(_OWORD *)(a1 + 144);
    long long v60 = *(_OWORD *)(a1 + 128);
    long long v61 = v14;
    uint64_t v62 = *(void *)(a1 + 160);
    sub_273C(&qword_21878);
    sub_15610();
    uint64_t v15 = v57;
    uint64_t v49 = v58;
    uint64_t v50 = *((void *)&v57 + 1);
    uint64_t v48 = v59;
    sub_15310();
    sub_156F0();
    sub_15300();
    uint64_t v47 = v60;
    int v46 = BYTE8(v60);
    uint64_t v45 = v61;
    int v44 = BYTE8(v61);
    uint64_t v43 = v62;
    uint64_t v42 = v63;
    long long v57 = v64;
    sub_15610();
    uint64_t v51 = v15;
    if (!(v56 >> 62))
    {
      uint64_t v16 = *(void *)((char *)&dword_10 + (v56 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRelease();
LABEL_6:
      *(void *)&long long v57 = 0;
      *((void *)&v57 + 1) = v16;
      swift_getKeyPath();
      uint64_t v17 = (_OWORD *)swift_allocObject();
      long long v18 = *(_OWORD *)(a1 + 208);
      v17[13] = *(_OWORD *)(a1 + 192);
      v17[14] = v18;
      v17[15] = *(_OWORD *)(a1 + 224);
      long long v19 = *(_OWORD *)(a1 + 144);
      v17[9] = *(_OWORD *)(a1 + 128);
      v17[10] = v19;
      long long v20 = *(_OWORD *)(a1 + 176);
      v17[11] = *(_OWORD *)(a1 + 160);
      v17[12] = v20;
      long long v21 = *(_OWORD *)(a1 + 80);
      v17[5] = *(_OWORD *)(a1 + 64);
      v17[6] = v21;
      long long v22 = *(_OWORD *)(a1 + 112);
      unsigned char v17[7] = *(_OWORD *)(a1 + 96);
      v17[8] = v22;
      long long v23 = *(_OWORD *)(a1 + 16);
      v17[1] = *(_OWORD *)a1;
      v17[2] = v23;
      long long v24 = *(_OWORD *)(a1 + 48);
      v17[3] = *(_OWORD *)(a1 + 32);
      v17[4] = v24;
      sub_43D8(a1);
      sub_273C(&qword_21C10);
      sub_273C(&qword_21C18);
      sub_B920();
      sub_B9F0();
      sub_156A0();
      uint64_t v25 = v52;
      uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
      v26(v10, v12, v7);
      uint64_t v27 = v50;
      *(void *)uint64_t v6 = v51;
      *((void *)v6 + 1) = v27;
      uint64_t v28 = v48;
      *((void *)v6 + 2) = v49;
      *((void *)v6 + 3) = v28;
      *((void *)v6 + 4) = v47;
      v6[40] = v46;
      *((void *)v6 + 6) = v45;
      v6[56] = v44;
      uint64_t v29 = v42;
      *((void *)v6 + 8) = v43;
      *((void *)v6 + 9) = v29;
      *((_OWORD *)v6 + 5) = 0u;
      *((_OWORD *)v6 + 6) = 0u;
      v6[112] = 0;
      uint64_t v30 = sub_273C(&qword_21C48);
      v26(&v6[*(int *)(v30 + 48)], v10, v7);
      uint64_t v31 = *(void (**)(char *, uint64_t))(v25 + 8);
      swift_bridgeObjectRetain();
      v31(v10, v7);
      swift_bridgeObjectRelease();
      sub_BAF8((uint64_t)v6, (uint64_t)v4, &qword_21BE0);
      swift_storeEnumTagMultiPayload();
      sub_BAB4(&qword_21BD8, &qword_21BE0);
      sub_154C0();
      sub_BCAC((uint64_t)v6, &qword_21BE0);
      v31(v12, v7);
      return;
    }
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_15900();
    swift_bridgeObjectRelease_n();
    if ((v16 & 0x8000000000000000) == 0) {
      goto LABEL_6;
    }
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v32 = self;
  NSString v33 = sub_15740();
  id v34 = objc_msgSend(v32, "_coreroutine_LocalizedStringForKey:", v33);

  if (!v34)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v35 = sub_15760();
  uint64_t v37 = v36;

  *(void *)&long long v60 = v35;
  *((void *)&v60 + 1) = v37;
  sub_81A0();
  *(void *)uint64_t v4 = sub_15550();
  *((void *)v4 + 1) = v38;
  v4[16] = v39 & 1;
  *((void *)v4 + 3) = v40;
  swift_storeEnumTagMultiPayload();
  sub_BAB4(&qword_21BD8, &qword_21BE0);
  sub_154C0();
}

uint64_t sub_7050@<X0>(unint64_t *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_273C(&qword_21C18);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_273C(&qword_21A78);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = *a1;
  long long v32 = *(_OWORD *)((char *)a2 + 168);
  sub_273C(&qword_21870);
  sub_15610();
  uint64_t v30 = v6;
  uint64_t v31 = a3;
  uint64_t v29 = (_OWORD *)v9;
  if ((v33 & 0xC000000000000001) == 0)
  {
    if ((v13 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v13 < *(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8)))
    {
      id v14 = *(id *)(v33 + 8 * v13 + 32);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_13;
  }
  id v14 = (id)sub_158F0();
LABEL_5:
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = swift_allocObject();
  long long v17 = a2[13];
  *(_OWORD *)(v16 + 208) = a2[12];
  *(_OWORD *)(v16 + 224) = v17;
  *(_OWORD *)(v16 + 240) = a2[14];
  long long v18 = a2[9];
  *(_OWORD *)(v16 + 144) = a2[8];
  *(_OWORD *)(v16 + 160) = v18;
  long long v19 = a2[11];
  *(_OWORD *)(v16 + 176) = a2[10];
  *(_OWORD *)(v16 + 192) = v19;
  long long v20 = a2[5];
  *(_OWORD *)(v16 + 80) = a2[4];
  *(_OWORD *)(v16 + 96) = v20;
  long long v21 = a2[7];
  *(_OWORD *)(v16 + 112) = a2[6];
  *(_OWORD *)(v16 + 128) = v21;
  long long v22 = a2[1];
  *(_OWORD *)(v16 + 16) = *a2;
  *(_OWORD *)(v16 + 32) = v22;
  long long v23 = a2[3];
  *(_OWORD *)(v16 + 48) = a2[2];
  *(_OWORD *)(v16 + 64) = v23;
  *(void *)(v16 + 256) = v13;
  *(unsigned char *)(v16 + 264) = 0;
  __chkstk_darwin(v16);
  *(&v28 - 2) = (uint64_t)v15;
  sub_43D8((uint64_t)a2);
  sub_273C(&qword_21880);
  sub_44F8();
  sub_15640();

  long long v32 = a2[14];
  sub_273C(&qword_21B40);
  sub_15610();
  if (v33 != v13)
  {
    a2 = v29;
    uint64_t v6 = v30;
    if (qword_21F18 == -1)
    {
LABEL_8:
      id v25 = (id)qword_21EE0;
      goto LABEL_9;
    }
LABEL_13:
    swift_once();
    goto LABEL_8;
  }
  id v24 = [self systemGray4Color];
  a2 = v29;
  uint64_t v6 = v30;
LABEL_9:
  *(void *)&long long v32 = sub_155F0();
  swift_retain();
  uint64_t v26 = sub_15680();
  (*(void (**)(char *, char *, _OWORD *))(v10 + 16))(v8, v12, a2);
  swift_release();
  *(void *)&v8[*(int *)(v6 + 36)] = v26;
  (*(void (**)(char *, _OWORD *))(v10 + 8))(v12, a2);
  return sub_BEE4((uint64_t)v8, v31, &qword_21C18);
}

void sub_73F0(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v27 = sub_273C(&qword_218C0);
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_273C(&qword_21BE8);
  uint64_t v6 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = self;
  NSString v10 = sub_15740();
  id v11 = objc_msgSend(v9, "_coreroutine_LocalizedStringForKey:", v10);

  if (v11)
  {
    uint64_t v12 = sub_15760();
    uint64_t v14 = v13;

    uint64_t v30 = v12;
    uint64_t v31 = v14;
    uint64_t v15 = (_OWORD *)swift_allocObject();
    long long v16 = a1[13];
    v15[13] = a1[12];
    v15[14] = v16;
    v15[15] = a1[14];
    long long v17 = a1[9];
    v15[9] = a1[8];
    v15[10] = v17;
    long long v18 = a1[11];
    v15[11] = a1[10];
    v15[12] = v18;
    long long v19 = a1[5];
    v15[5] = a1[4];
    v15[6] = v19;
    long long v20 = a1[7];
    unsigned char v15[7] = a1[6];
    v15[8] = v20;
    long long v21 = a1[1];
    v15[1] = *a1;
    v15[2] = v21;
    long long v22 = a1[3];
    v15[3] = a1[2];
    v15[4] = v22;
    sub_43D8((uint64_t)a1);
    sub_81A0();
    sub_15660();
    long long v29 = a1[13];
    sub_273C(&qword_21850);
    uint64_t v23 = sub_15630();
    __chkstk_darwin(v23);
    *(&v25 - 2) = (uint64_t)a1;
    sub_BAB4(&qword_218E8, &qword_218C0);
    uint64_t v24 = v27;
    sub_15580();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v24);
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v28, v8, v26);
  }
  else
  {
    __break(1u);
  }
}

void sub_7738(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v68 = sub_155C0();
  uint64_t v66 = *(void *)(v68 - 8);
  uint64_t v3 = __chkstk_darwin(v68);
  uint64_t v5 = (char *)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v59 - v6;
  uint64_t v8 = self;
  NSString v9 = sub_15740();
  id v10 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v9);

  if (!v10)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v11 = sub_15760();
  uint64_t v13 = v12;

  *(void *)&long long v69 = v11;
  *((void *)&v69 + 1) = v13;
  sub_81A0();
  uint64_t v14 = sub_15550();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  long long v19 = (_OWORD *)swift_allocObject();
  long long v20 = *(_OWORD *)(a1 + 208);
  v19[13] = *(_OWORD *)(a1 + 192);
  v19[14] = v20;
  v19[15] = *(_OWORD *)(a1 + 224);
  long long v21 = *(_OWORD *)(a1 + 144);
  v19[9] = *(_OWORD *)(a1 + 128);
  v19[10] = v21;
  long long v22 = *(_OWORD *)(a1 + 176);
  v19[11] = *(_OWORD *)(a1 + 160);
  v19[12] = v22;
  long long v23 = *(_OWORD *)(a1 + 80);
  v19[5] = *(_OWORD *)(a1 + 64);
  v19[6] = v23;
  long long v24 = *(_OWORD *)(a1 + 112);
  v19[7] = *(_OWORD *)(a1 + 96);
  v19[8] = v24;
  long long v25 = *(_OWORD *)(a1 + 16);
  v19[1] = *(_OWORD *)a1;
  v19[2] = v25;
  long long v26 = *(_OWORD *)(a1 + 48);
  v19[3] = *(_OWORD *)(a1 + 32);
  v19[4] = v26;
  sub_43D8(a1);
  uint64_t v65 = v7;
  sub_155B0();
  swift_release();
  sub_B0B0(v14, v16, v18);
  swift_bridgeObjectRelease();
  NSString v27 = sub_15740();
  id v28 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v27);

  if (!v28)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v29 = sub_15760();
  uint64_t v31 = v30;

  *(void *)&long long v69 = v29;
  *((void *)&v69 + 1) = v31;
  uint64_t v32 = sub_15550();
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  long long v64 = v5;
  sub_155B0();
  sub_B0B0(v32, v34, v36);
  swift_bridgeObjectRelease();
  NSString v37 = sub_15740();
  id v38 = objc_msgSend(v8, "_coreroutine_LocalizedStringForKey:", v37);

  if (v38)
  {
    uint64_t v39 = sub_15760();
    uint64_t v41 = v40;

    *(void *)&long long v69 = v39;
    *((void *)&v69 + 1) = v41;
    uint64_t v42 = sub_15550();
    uint64_t v62 = v43;
    uint64_t v63 = v42;
    int v60 = v44;
    uint64_t v61 = v45;
    long long v69 = *(_OWORD *)(a1 + 184);
    uint64_t v70 = *(void *)(a1 + 200);
    sub_273C(&qword_21B38);
    sub_15610();
    long long v69 = v71;
    uint64_t v46 = sub_15550();
    v59[0] = v47;
    v59[1] = v46;
    sub_273C(&qword_21BF8);
    uint64_t v48 = v66;
    uint64_t v49 = *(void *)(v66 + 72);
    unint64_t v50 = (*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_16CC0;
    unint64_t v52 = v51 + v50;
    uint64_t v53 = *(void (**)(unint64_t, char *, uint64_t))(v48 + 16);
    uint64_t v54 = v65;
    uint64_t v55 = v68;
    v53(v52, v65, v68);
    unint64_t v56 = v52 + v49;
    long long v57 = v64;
    v53(v56, v64, v55);
    sub_152F0();
    uint64_t v58 = *(void (**)(char *, uint64_t))(v48 + 8);
    v58(v57, v55);
    v58(v54, v55);
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_7BF4(uint64_t a1)
{
  uint64_t v2 = sub_273C(&qword_21B20);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))((char *)&stru_B8.flags + (swift_isaMask & **(void **)(a1 + 8))))(v4);
  uint64_t v7 = (_OWORD *)swift_allocObject();
  long long v8 = *(_OWORD *)(a1 + 208);
  v7[13] = *(_OWORD *)(a1 + 192);
  v7[14] = v8;
  v7[15] = *(_OWORD *)(a1 + 224);
  long long v9 = *(_OWORD *)(a1 + 144);
  v7[9] = *(_OWORD *)(a1 + 128);
  v7[10] = v9;
  long long v10 = *(_OWORD *)(a1 + 176);
  v7[11] = *(_OWORD *)(a1 + 160);
  v7[12] = v10;
  long long v11 = *(_OWORD *)(a1 + 80);
  v7[5] = *(_OWORD *)(a1 + 64);
  v7[6] = v11;
  long long v12 = *(_OWORD *)(a1 + 112);
  v7[7] = *(_OWORD *)(a1 + 96);
  v7[8] = v12;
  long long v13 = *(_OWORD *)(a1 + 16);
  v7[1] = *(_OWORD *)a1;
  v7[2] = v13;
  long long v14 = *(_OWORD *)(a1 + 48);
  v7[3] = *(_OWORD *)(a1 + 32);
  v7[4] = v14;
  sub_43D8(a1);
  sub_BAB4(&qword_21B28, &qword_21B20);
  uint64_t v15 = sub_152C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  long long v18 = *(_OWORD *)(a1 + 16);
  v17[1] = v15;
  sub_273C(&qword_21B30);
  return sub_15620();
}

uint64_t sub_7DE8()
{
  return sub_BD78(256);
}

uint64_t sub_7DF0()
{
  return sub_7BF4(v0 + 16);
}

uint64_t sub_7DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_7E68@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(void *__return_ptr))((char *)&stru_B8.size + (swift_isaMask & **a1)))(v4);
  return sub_BEE4((uint64_t)v4, a2, &qword_21CD0);
}

uint64_t sub_7EE0(uint64_t a1, void **a2)
{
  sub_BEE4(a1, (uint64_t)v5, &qword_21CD0);
  uint64_t v3 = *(uint64_t (**)(unsigned char *))((char *)&stru_B8.offset + (swift_isaMask & **a2));
  sub_B224((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, char))sub_B288);
  return v3(v5);
}

uint64_t sub_7F78(_OWORD *a1)
{
  uint64_t v2 = sub_273C(&qword_21B18);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_153D0();
  sub_152D0();
  uint64_t v5 = sub_152E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  uint64_t v6 = (_OWORD *)swift_allocObject();
  long long v7 = a1[13];
  v6[13] = a1[12];
  v6[14] = v7;
  v6[15] = a1[14];
  long long v8 = a1[9];
  v6[9] = a1[8];
  v6[10] = v8;
  long long v9 = a1[11];
  v6[11] = a1[10];
  v6[12] = v9;
  long long v10 = a1[5];
  v6[5] = a1[4];
  v6[6] = v10;
  long long v11 = a1[7];
  v6[7] = a1[6];
  v6[8] = v11;
  long long v12 = a1[1];
  v6[1] = *a1;
  v6[2] = v12;
  long long v13 = a1[3];
  v6[3] = a1[2];
  v6[4] = v13;
  sub_43D8((uint64_t)a1);
  return sub_15650();
}

uint64_t sub_80F8()
{
  return sub_7F78(*(_OWORD **)(v0 + 16));
}

unint64_t sub_8100()
{
  unint64_t result = qword_218C8;
  if (!qword_218C8)
  {
    sub_4590(&qword_218B8);
    sub_BAB4(&qword_218D0, &qword_218D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_218C8);
  }
  return result;
}

unint64_t sub_81A0()
{
  unint64_t result = qword_218E0;
  if (!qword_218E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_218E0);
  }
  return result;
}

uint64_t sub_81F4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

__n128 sub_8204@<Q0>(uint64_t a1@<X8>)
{
  sub_9C38((uint64_t)v9);
  long long v2 = v9[13];
  *(_OWORD *)(a1 + 192) = v9[12];
  *(_OWORD *)(a1 + 208) = v2;
  *(_OWORD *)(a1 + 224) = v9[14];
  long long v3 = v9[9];
  *(_OWORD *)(a1 + 128) = v9[8];
  *(_OWORD *)(a1 + 144) = v3;
  long long v4 = v9[11];
  *(_OWORD *)(a1 + 160) = v9[10];
  *(_OWORD *)(a1 + 176) = v4;
  long long v5 = v9[5];
  *(_OWORD *)(a1 + 64) = v9[4];
  *(_OWORD *)(a1 + 80) = v5;
  long long v6 = v9[7];
  *(_OWORD *)(a1 + 96) = v9[6];
  *(_OWORD *)(a1 + 112) = v6;
  long long v7 = v9[1];
  *(_OWORD *)a1 = v9[0];
  *(_OWORD *)(a1 + 16) = v7;
  __n128 result = (__n128)v9[3];
  *(_OWORD *)(a1 + 32) = v9[2];
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_827C@<X0>(uint64_t a1@<X8>)
{
  return sub_4D50(a1);
}

uint64_t sub_82E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_273C(&qword_21AA8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  long long v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  long long v11 = (char *)&v22 - v10;
  uint64_t v12 = sub_273C(&qword_21AB0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v17 = (char *)&v22 - v16;
  *(void *)char v17 = sub_153F0();
  *((void *)v17 + 1) = 0;
  v17[16] = 1;
  uint64_t v18 = sub_273C(&qword_21AB8);
  sub_857C(a1, a2, (uint64_t)&v17[*(int *)(v18 + 44)]);
  *(void *)long long v11 = sub_153F0();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  sub_273C(&qword_21AC0);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(v19 + 24) = a2;
  swift_bridgeObjectRetain();
  sub_273C(&qword_21AC8);
  sub_BAB4(&qword_21AD0, &qword_21AC8);
  sub_15640();
  sub_BAF8((uint64_t)v17, (uint64_t)v15, &qword_21AB0);
  sub_BAF8((uint64_t)v11, (uint64_t)v9, &qword_21AA8);
  sub_BAF8((uint64_t)v15, a3, &qword_21AB0);
  uint64_t v20 = sub_273C(&qword_21AD8);
  sub_BAF8((uint64_t)v9, a3 + *(int *)(v20 + 48), &qword_21AA8);
  sub_BCAC((uint64_t)v11, &qword_21AA8);
  sub_BCAC((uint64_t)v17, &qword_21AB0);
  sub_BCAC((uint64_t)v9, &qword_21AA8);
  return sub_BCAC((uint64_t)v15, &qword_21AB0);
}

uint64_t sub_857C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v35 = sub_273C(&qword_21AE0);
  __chkstk_darwin(v35);
  NSString v37 = (uint64_t *)((char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_273C(&qword_21AE8);
  __chkstk_darwin(v6 - 8);
  char v36 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_273C(&qword_21AF0);
  uint64_t result = __chkstk_darwin(v34);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v39 = a1;
    uint64_t v40 = a2;
    sub_81A0();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_15550();
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    sub_155E0();
    uint64_t v16 = sub_15520();
    uint64_t v18 = v17;
    char v20 = v19;
    swift_release();
    sub_B0B0(v11, v13, v15);
    swift_bridgeObjectRelease();
    sub_15500();
    uint64_t v21 = sub_15540();
    uint64_t v23 = v22;
    char v25 = v24;
    uint64_t v27 = v26;
    swift_release();
    v25 &= 1u;
    sub_B0B0(v16, v18, v20 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v29 = sub_15530();
    uint64_t v30 = (uint64_t)v36;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v36, 1, 1, v29);
    uint64_t v31 = swift_getKeyPath();
    uint64_t v32 = v37;
    sub_BAF8(v30, (uint64_t)v37 + *(int *)(v35 + 28), &qword_21AE8);
    *uint64_t v32 = v31;
    sub_BAF8((uint64_t)v32, (uint64_t)&v10[*(int *)(v34 + 36)], &qword_21AE0);
    *(void *)uint64_t v10 = v21;
    *((void *)v10 + 1) = v23;
    v10[16] = v25;
    *((void *)v10 + 3) = v27;
    *((void *)v10 + 4) = KeyPath;
    *((void *)v10 + 5) = 0;
    v10[48] = 1;
    sub_B0C0(v21, v23, v25);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_BCAC((uint64_t)v32, &qword_21AE0);
    sub_BCAC(v30, &qword_21AE8);
    sub_B0B0(v21, v23, v25);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_BEE4((uint64_t)v10, v38, &qword_21AF0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_88CC(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v38 = sub_273C(&qword_21AE0);
  __chkstk_darwin(v38);
  uint64_t v40 = (uint64_t *)((char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = sub_273C(&qword_21AE8);
  __chkstk_darwin(v2 - 8);
  uint64_t v39 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_273C(&qword_21AF0);
  uint64_t v4 = __chkstk_darwin(v37);
  uint64_t v42 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v37 - v7;
  __chkstk_darwin(v6);
  uint64_t v41 = (uint64_t)&v37 - v9;
  uint64_t v10 = self;
  NSString v11 = sub_15740();
  id v12 = objc_msgSend(v10, "_coreroutine_LocalizedStringForKey:", v11);

  if (v12)
  {
    uint64_t v13 = sub_15760();
    uint64_t v15 = v14;

    uint64_t v44 = v13;
    uint64_t v45 = v15;
    sub_81A0();
    uint64_t v16 = sub_15550();
    uint64_t v18 = v17;
    char v20 = v19 & 1;
    sub_15500();
    uint64_t v21 = sub_15540();
    uint64_t v23 = v22;
    char v25 = v24;
    uint64_t v27 = v26;
    swift_release();
    LOBYTE(v13) = v25 & 1;
    sub_B0B0(v16, v18, v20);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v29 = sub_15530();
    uint64_t v30 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v39, 1, 1, v29);
    uint64_t v31 = swift_getKeyPath();
    uint64_t v32 = v40;
    sub_BAF8(v30, (uint64_t)v40 + *(int *)(v38 + 28), &qword_21AE8);
    *uint64_t v32 = v31;
    sub_BAF8((uint64_t)v32, (uint64_t)&v8[*(int *)(v37 + 36)], &qword_21AE0);
    *(void *)uint64_t v8 = v21;
    *((void *)v8 + 1) = v23;
    v8[16] = v13;
    *((void *)v8 + 3) = v27;
    *((void *)v8 + 4) = KeyPath;
    *((void *)v8 + 5) = 0;
    v8[48] = 1;
    sub_B0C0(v21, v23, v13);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_BCAC((uint64_t)v32, &qword_21AE0);
    sub_BCAC(v30, &qword_21AE8);
    sub_B0B0(v21, v23, v13);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v33 = v41;
    sub_BEE4((uint64_t)v8, v41, &qword_21AF0);
    uint64_t v34 = v42;
    sub_BAF8(v33, v42, &qword_21AF0);
    uint64_t v35 = v43;
    sub_BAF8(v34, v43, &qword_21AF0);
    uint64_t v36 = v35 + *(int *)(sub_273C(&qword_21AF8) + 48);
    *(void *)uint64_t v36 = 0;
    *(unsigned char *)(v36 + 8) = 1;
    sub_BCAC(v33, &qword_21AF0);
    sub_BCAC(v34, &qword_21AF0);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_8CD0()
{
  return sub_15590();
}

uint64_t sub_8CEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  *(void *)a1 = sub_153F0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v5 = sub_273C(&qword_218F0);
  return sub_82E8(v4, v3, a1 + *(int *)(v5 + 44));
}

void sub_8D48(void *a1, double a2, uint64_t a3, unint64_t a4, unint64_t a5, char a6)
{
  Class isa = (Class)[a1 annotations];
  if (!isa)
  {
    sub_273C(&qword_21958);
    sub_157A0();
    Class isa = sub_15790().super.isa;
    swift_bridgeObjectRelease();
  }
  [a1 removeAnnotations:isa];

  if (a6) {
    goto LABEL_39;
  }
  unint64_t v50 = a4 & 0xC000000000000001;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a5 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFFF8)) > a5)
    {
      id v13 = *(id *)(a4 + 8 * a5 + 32);
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_32;
  }
  id v13 = (id)sub_158F0();
LABEL_8:
  uint64_t v14 = v13;
  uint64_t v6 = &RTSettingsViewController;
  id v15 = [v13 location];

  [v15 latitude];
  CLLocationDegrees v17 = v16;

  if (v50)
  {
    id v18 = (id)sub_158F0();
  }
  else
  {
    if ((a5 & 0x8000000000000000) != 0)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (*(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFFF8)) <= a5)
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return;
    }
    id v18 = *(id *)(a4 + 8 * a5 + 32);
  }
  char v19 = v18;
  id v20 = [v18 location];

  [v20 longitude];
  CLLocationDegrees v22 = v21;

  if (v50) {
    id v23 = (id)sub_158F0();
  }
  else {
    id v23 = *(id *)(a4 + 8 * a5 + 32);
  }
  char v24 = v23;
  id v25 = [v23 location];

  [v25 horizontalUncertainty];
  double v27 = v26;

  if (v50) {
    id v28 = (id)sub_158F0();
  }
  else {
    id v28 = *(id *)(a4 + 8 * a5 + 32);
  }
  uint64_t v29 = v28;
  id v30 = [v28 location];

  [v30 horizontalUncertainty];
  double v32 = v31;

  v52.latitude = v17;
  v52.longitude = v22;
  MKCoordinateRegion v53 = MKCoordinateRegionMakeWithDistance(v52, v27 + a2, v32 + a2);
  objc_msgSend(a1, "regionThatFits:", v53.center.latitude, v53.center.longitude, v53.span.latitudeDelta, v53.span.longitudeDelta);
  objc_msgSend(a1, "setRegion:");
  Class v33 = (Class)[a1 overlays];
  if (!v33)
  {
    sub_273C(&qword_219C0);
    sub_157A0();
    Class v33 = sub_15790().super.isa;
    swift_bridgeObjectRelease();
  }
  [a1 removeOverlays:v33];

  if (a4 >> 62)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_15900();
    if (v34) {
      goto LABEL_23;
    }
    goto LABEL_33;
  }
  uint64_t v34 = *(void *)((char *)&dword_10 + (a4 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (v34)
  {
LABEL_23:
    uint64_t v35 = self;
    if (v34 >= 1)
    {
      uint64_t v36 = (void *)v35;
      uint64_t v37 = 0;
      do
      {
        if (v50) {
          id v38 = (id)sub_158F0();
        }
        else {
          id v38 = *(id *)(a4 + 8 * v37 + 32);
        }
        uint64_t v39 = v38;
        ++v37;
        id v40 = objc_msgSend(v38, (SEL)v6[56].base_meths);
        [v40 latitude];
        double v42 = v41;

        id v43 = objc_msgSend(v39, (SEL)v6[56].base_meths);
        [v43 longitude];
        double v45 = v44;

        id v46 = objc_msgSend(v39, (SEL)v6[56].base_meths);
        [v46 horizontalUncertainty];
        double v48 = v47;

        id v49 = objc_msgSend(v36, "circleWithCenterCoordinate:radius:", v42, v45, v48);
        [a1 addOverlay:v49];
      }
      while (v34 != v37);
      goto LABEL_33;
    }
    __break(1u);
    goto LABEL_37;
  }
LABEL_33:

  swift_bridgeObjectRelease();
}

id sub_91DC(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR____TtCV19CoreRoutineSettings17RTSettingsMapView11Coordinator_parent];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  v10[16] = a3 & 1;
  *((double *)v10 + 3) = a4;
  v12.receiver = v9;
  v12.super_class = v4;
  return objc_msgSendSuper2(&v12, "init");
}

void sub_9258(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  id v7 = [objc_allocWithZone((Class)MKMapView) init];
  if (a4) {
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  if ((a2 & 0xC000000000000001) == 0)
  {
    if ((a3 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)) > a3)
    {
      id v9 = *(id *)(a2 + 8 * a3 + 32);
      goto LABEL_6;
    }
    __break(1u);
    goto LABEL_15;
  }
  id v9 = (id)sub_158F0();
LABEL_6:
  uint64_t v10 = v9;
  id v11 = [v9 location];

  [v11 latitude];
  CLLocationDegrees v13 = v12;

  if ((a2 & 0xC000000000000001) != 0)
  {
    id v14 = (id)sub_158F0();
LABEL_11:
    id v15 = v14;
    id v16 = [v14 location];

    [v16 longitude];
    CLLocationDegrees v18 = v17;

    sub_273C(&qword_219D0);
    sub_154D0();
    [v8 setDelegate:v19];

    v20.latitude = v13;
    v20.longitude = v18;
    MKCoordinateRegion v21 = MKCoordinateRegionMakeWithDistance(v20, 50.0, 50.0);
    objc_msgSend(v8, "regionThatFits:", v21.center.latitude, v21.center.longitude, v21.span.latitudeDelta, v21.span.longitudeDelta);
    objc_msgSend(v8, "setRegion:animated:", 1);
    return;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)) > a3)
    {
      id v14 = *(id *)(a2 + 8 * a3 + 32);
      goto LABEL_11;
    }
    goto LABEL_16;
  }
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

id sub_9428()
{
  return sub_A184();
}

id sub_94D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RTSettingsMapView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_9518(uint64_t a1)
{
  sub_9258(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

void sub_952C(void *a1, uint64_t a2)
{
  sub_8D48(a1, *(double *)(v2 + 24), a2, *(void *)v2, *(void *)(v2 + 8), *(unsigned char *)(v2 + 16));
}

id sub_954C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  char v5 = *((unsigned char *)v1 + 16);
  uint64_t v6 = v1[3];
  id v7 = (objc_class *)type metadata accessor for RTSettingsMapView.Coordinator();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  id v9 = &v8[OBJC_IVAR____TtCV19CoreRoutineSettings17RTSettingsMapView11Coordinator_parent];
  *(void *)id v9 = v3;
  *((void *)v9 + 1) = v4;
  v9[16] = v5;
  *((void *)v9 + 3) = v6;
  v11.receiver = v8;
  v11.super_class = v7;
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v11, "init");
  *a1 = result;
  return result;
}

uint64_t sub_95E4()
{
  return sub_15430();
}

uint64_t sub_9628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_B020();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_968C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_B020();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_96F0()
{
}

uint64_t sub_971C(uint64_t a1)
{
  unint64_t v2 = sub_AFCC();

  return static PreviewProvider._previews.getter(a1, v2);
}

uint64_t sub_9768(uint64_t a1)
{
  unint64_t v2 = sub_AFCC();

  return static PreviewProvider._platform.getter(a1, v2);
}

id sub_97B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  char v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_981C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_153A0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_9850()
{
  return sub_153B0();
}

uint64_t sub_9880()
{
  return sub_15380();
}

uint64_t sub_98A4(uint64_t a1)
{
  uint64_t v2 = sub_273C(&qword_21AE8);
  __chkstk_darwin(v2 - 8);
  sub_BAF8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_21AE8);
  return sub_15390();
}

void sub_9938(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_158C0();
      sub_3DAC(0, &qword_21B00);
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
  if (sub_158A0() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_158B0();
  sub_3DAC(0, &qword_21B00);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_15830(*(void *)(a4 + 40));
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
  char v10 = sub_15840();

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
      char v13 = sub_15840();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  id v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_9BB0(uint64_t a1)
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

__n128 sub_9C38@<Q0>(uint64_t a1@<X8>)
{
  type metadata accessor for RTSettingsController();
  sub_C614();
  sub_3DF8();
  uint64_t v2 = sub_15320();
  uint64_t v5 = v3;
  uint64_t v6 = v2;
  sub_273C(&qword_21848);
  sub_15600();
  sub_15600();
  sub_15600();
  sub_15600();
  sub_15600();
  sub_15600();
  sub_273C(&qword_21860);
  sub_15600();
  sub_273C(&qword_21868);
  sub_15600();
  sub_15600();
  sub_15600();
  sub_15600();
  __n128 result = v7;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v5;
  *(__n128 *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 32) = v7.n128_u8[0];
  *(void *)(a1 + 40) = v7.n128_u64[1];
  *(unsigned char *)(a1 + 48) = v7.n128_u8[0];
  *(void *)(a1 + 56) = v7.n128_u64[1];
  *(__n128 *)(a1 + 64) = v7;
  *(__n128 *)(a1 + 80) = v7;
  *(void *)(a1 + 96) = v8;
  *(__n128 *)(a1 + 104) = v7;
  *(void *)(a1 + 120) = v8;
  *(__n128 *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 144) = v8;
  *(void *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 168) = v7;
  *(__n128 *)(a1 + 184) = v7;
  *(void *)(a1 + 200) = v8;
  *(unsigned char *)(a1 + 208) = v7.n128_u8[0];
  *(void *)(a1 + 216) = v7.n128_u64[1];
  *(__n128 *)(a1 + 224) = v7;
  return result;
}

void sub_9ED0()
{
  NSString v0 = sub_15740();
  id v1 = [self presenterForPrivacySplashWithIdentifier:v0];

  id v2 = [self sharedApplication];
  id v3 = [v2 connectedScenes];

  sub_3DAC(0, &qword_21B00);
  sub_B0D0();
  uint64_t v4 = sub_157C0();

  uint64_t v5 = (void *)sub_4C40(v4);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    id v14 = 0;
    __n128 v7 = 0;
    if (!v1) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  self;
  uint64_t v6 = (void *)swift_dynamicCastObjCClass();
  __n128 v7 = v6;
  if (!v6)
  {

    id v14 = 0;
    if (!v1) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  id v8 = [v6 windows];
  sub_3DAC(0, &qword_21B10);
  unint64_t v9 = sub_157A0();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_15900();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_5;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    id v14 = 0;
    if (!v1) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  if (!*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_17;
  }
LABEL_5:
  if ((v9 & 0xC000000000000001) != 0) {
    goto LABEL_19;
  }
  if (!*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)))
  {
    __break(1u);
    return;
  }
  for (id i = *(id *)(v9 + 32); ; id i = (id)sub_158F0())
  {
    id v14 = i;
    swift_bridgeObjectRelease();
    if (v1) {
      break;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    ;
  }
LABEL_13:
  id v11 = v1;
  id v12 = [v14 rootViewController];
  [v11 setPresentingViewController:v12];

  [v11 present];
}

uint64_t type metadata accessor for RTSettingsMapView.Coordinator()
{
  return self;
}

id sub_A184()
{
  self;
  uint64_t v0 = swift_dynamicCastObjCClass();
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = objc_allocWithZone((Class)MKCircleRenderer);
    swift_unknownObjectRetain();
    id v3 = [v2 initWithCircle:v1];
    uint64_t v4 = self;
    id v5 = v3;
    id v6 = [v4 blueColor];
    [v5 setStrokeColor:v6];

    [v5 setLineWidth:1.0];
    id v7 = v5;
    id v8 = [v4 systemBlueColor];
    [v7 setFillColor:v8];

    id v9 = v7;
    [v9 setAlpha:0.3];

    swift_unknownObjectRelease();
    return v9;
  }
  else
  {
    id v11 = objc_allocWithZone((Class)MKOverlayRenderer);
    return [v11 init];
  }
}

uint64_t sub_A304()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_A320()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_A340()
{
  unint64_t result = qword_219D8;
  if (!qword_219D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_219D8);
  }
  return result;
}

void *sub_A394()
{
  return &protocol witness table for Never;
}

unint64_t sub_A3A4()
{
  unint64_t result = qword_219E0;
  if (!qword_219E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_219E0);
  }
  return result;
}

uint64_t sub_A3F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for RTSettingsMainView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for RTSettingsMainView(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  uint64_t v15 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v15;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  uint64_t v9 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v9;
  uint64_t v14 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v14;
  uint64_t v10 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v10;
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  uint64_t v11 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v11;
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  id v12 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RTSettingsMainView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_retain();
  swift_release();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_retain();
  swift_release();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RTSettingsMainView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[14];
  *(_OWORD *)(a1 + 208) = a2[13];
  *(_OWORD *)(a1 + 224) = v12;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v11;
  return result;
}

uint64_t assignWithTake for RTSettingsMainView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v4;
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_release();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  swift_release();
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RTSettingsMainView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 240)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RTSettingsMainView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 232) = 0;
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 240) = 1;
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
    *(unsigned char *)(result + 240) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RTSettingsMainView()
{
  return &type metadata for RTSettingsMainView;
}

void *initializeBufferWithCopyOfBuffer for PrivacyTextView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PrivacyTextView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PrivacyTextView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrivacyTextView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for PrivacyTextView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyTextView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyTextView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyTextView()
{
  return &type metadata for PrivacyTextView;
}

uint64_t initializeBufferWithCopyOfBuffer for RTSettingsDetails(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RTSettingsMapView()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RTSettingsMapView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RTSettingsMapView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for RTSettingsMapView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for RTSettingsMapView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for RTSettingsMapView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RTSettingsMapView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RTSettingsMapView()
{
  return &type metadata for RTSettingsMapView;
}

ValueMetadata *type metadata accessor for RTSettingsMainView_Previews()
{
  return &type metadata for RTSettingsMainView_Previews;
}

uint64_t sub_AE78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_AF38()
{
  return sub_BAB4(&qword_21A80, &qword_21A88);
}

unint64_t sub_AF78()
{
  unint64_t result = qword_21A90;
  if (!qword_21A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21A90);
  }
  return result;
}

unint64_t sub_AFCC()
{
  unint64_t result = qword_21A98;
  if (!qword_21A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21A98);
  }
  return result;
}

unint64_t sub_B020()
{
  unint64_t result = qword_21AA0;
  if (!qword_21AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21AA0);
  }
  return result;
}

uint64_t sub_B074()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_B0B0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_B0C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_B0D0()
{
  unint64_t result = qword_21B08;
  if (!qword_21B08)
  {
    sub_3DAC(255, &qword_21B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21B08);
  }
  return result;
}

uint64_t sub_B138(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_B144()
{
  return sub_BD78(256);
}

void (*sub_B14C())(unsigned char *, void)
{
  uint64_t v1 = *(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & **(void **)(v0 + 24)));
  uint64_t result = (void (*)(unsigned char *, void))v1(v6);
  if (*(void *)(v3 + 40))
  {
    *(unsigned char *)(v3 + 88) = 0;
    result(v6, 0);
    uint64_t result = (void (*)(unsigned char *, void))v1(v6);
    if (v4[5])
    {
      uint64_t v5 = (uint64_t (*)(unsigned char *, void))result;
      v4[9] = 0;
      v4[10] = 0;
      swift_bridgeObjectRelease();
      return (void (*)(unsigned char *, void))v5(v6, 0);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_B224(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 88);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v4);
  return a1;
}

uint64_t sub_B288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_B2F8()
{
  return sub_BD78(256);
}

void sub_B300(void *a1)
{
  if (!a1[5])
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v1 = a1[2];
  uint64_t v2 = a1[8];
  sub_273C(&qword_21850);
  sub_15620();
  if (!v1)
  {
    uint64_t v3 = self;
    NSString v4 = sub_15740();
    id v5 = objc_msgSend(v3, "_coreroutine_LocalizedStringForKey:", v4);

    if (v5)
    {
      sub_15760();

      goto LABEL_5;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
LABEL_5:
  swift_bridgeObjectRetain();
  sub_273C(&qword_21B38);
  sub_15620();
  sub_273C(&qword_21B40);
  sub_15620();
  swift_bridgeObjectRetain();
  sub_15620();
  swift_bridgeObjectRetain();
  sub_273C(&qword_21870);
  sub_15620();
  sub_3EA8();
  if (v2)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    sub_15620();
    return;
  }
  long long v6 = self;
  NSString v7 = sub_15740();
  id v8 = objc_msgSend(v6, "_coreroutine_LocalizedStringForKey:", v7);

  if (v8)
  {
    sub_15760();

    goto LABEL_8;
  }
LABEL_11:
  __break(1u);
}

void sub_B5AC(char *a1@<X8>)
{
  sub_5300(*(void *)(v1 + 16), *(void (**)(char *, char *, uint64_t))(v1 + 24), a1);
}

void sub_B5B4(uint64_t a1@<X8>)
{
  sub_5C68(*(char **)(v1 + 16), a1);
}

unint64_t sub_B5BC()
{
  unint64_t result = qword_21B88;
  if (!qword_21B88)
  {
    sub_4590(&qword_21B80);
    sub_BAB4(&qword_21B90, &qword_21B98);
    sub_BAB4(&qword_21BA0, &qword_21BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21B88);
  }
  return result;
}

unint64_t sub_B680()
{
  unint64_t result = qword_21BB0;
  if (!qword_21BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21BB0);
  }
  return result;
}

__n128 sub_B6D4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = sub_153F0();
  sub_65B0(v3, (uint64_t)&v10);
  char v5 = v11;
  uint64_t v6 = v12;
  __n128 result = v10;
  long long v8 = v13;
  long long v9 = v14;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 56) = v8;
  *(_OWORD *)(a1 + 72) = v9;
  return result;
}

void sub_B74C(uint64_t a1@<X8>)
{
  sub_69E4(*(void *)(v1 + 16), a1);
}

unint64_t sub_B754()
{
  unint64_t result = qword_21BD0;
  if (!qword_21BD0)
  {
    sub_4590(&qword_21BC8);
    sub_BAB4(&qword_21BD8, &qword_21BE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21BD0);
  }
  return result;
}

void sub_B7F4(uint64_t a1@<X8>)
{
  sub_73F0(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_B7FC()
{
  return sub_BD78(256);
}

uint64_t sub_B804()
{
  long long v2 = *(_OWORD *)(v0 + 224);
  sub_BEE4((uint64_t)&v2 + 8, (uint64_t)v3, &qword_21858);
  sub_3E50((uint64_t)v3);
  sub_273C(&qword_21850);
  sub_15610();
  sub_15620();
  return sub_3E7C((uint64_t)&v2);
}

void sub_B8A4(uint64_t a1@<X8>)
{
  sub_7738(*(void *)(v1 + 16), a1);
}

uint64_t sub_B8AC()
{
  return sub_BD78(256);
}

uint64_t sub_B8B4()
{
  return (*(uint64_t (**)(void))((char *)&stru_108.flags + (swift_isaMask & **(void **)(v0 + 24))))();
}

uint64_t sub_B910()
{
  return sub_BD78(256);
}

uint64_t sub_B918@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_7050(a1, (_OWORD *)(v2 + 16), a2);
}

unint64_t sub_B920()
{
  unint64_t result = qword_21C20;
  if (!qword_21C20)
  {
    sub_4590(&qword_21C10);
    sub_B99C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21C20);
  }
  return result;
}

unint64_t sub_B99C()
{
  unint64_t result = qword_21C28;
  if (!qword_21C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21C28);
  }
  return result;
}

unint64_t sub_B9F0()
{
  unint64_t result = qword_21C30;
  if (!qword_21C30)
  {
    sub_4590(&qword_21C18);
    sub_BAB4(&qword_21A70, &qword_21A78);
    sub_BAB4(&qword_21C38, &qword_21C40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21C30);
  }
  return result;
}

uint64_t sub_BAB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_4590(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_BAF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_273C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_BB5C()
{
  return sub_BD78(265);
}

uint64_t sub_BB64(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_B0C0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_BBA8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_B0B0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_BBEC()
{
  return sub_BD78(256);
}

uint64_t sub_BBF4(unsigned char *a1)
{
  if (*a1) {
    (*(void (**)(uint64_t))((char *)&stru_108.reserved2 + (swift_isaMask & **(void **)(v1 + 24))))(1);
  }
  sub_273C(&qword_21850);
  return sub_15620();
}

void sub_BCA4(uint64_t a1@<X8>)
{
  sub_6068(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_BCAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_273C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_BD08()
{
  return sub_BD78(256);
}

uint64_t sub_BD10()
{
  return (*(uint64_t (**)(void))((char *)&stru_108.reserved2 + (swift_isaMask & **(void **)(v0 + 24))))(0);
}

uint64_t sub_BD70()
{
  return sub_BD78(256);
}

uint64_t sub_BD78(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_BE44()
{
  long long v2 = *(_OWORD *)(v0 + 48);
  sub_BEE4((uint64_t)&v2 + 8, (uint64_t)v3, &qword_21858);
  sub_3E50((uint64_t)v3);
  sub_273C(&qword_21850);
  sub_15610();
  sub_15620();
  return sub_3E7C((uint64_t)&v2);
}

uint64_t sub_BEE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_273C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_BF48(uint64_t a1)
{
  *(void *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_BF64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_BF74()
{
  return swift_release();
}

uint64_t sub_BF98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_273C(&qword_21CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_C000@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_15290();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 88) = v9;
  return result;
}

uint64_t sub_C09C(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_BF98(a1, (uint64_t)&v5);
  id v3 = v1;
  return sub_152A0();
}

void (*sub_C110(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_15280();
  return sub_C19C;
}

void sub_C19C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_C204()
{
  return swift_endAccess();
}

uint64_t sub_C268(uint64_t a1)
{
  uint64_t v2 = sub_273C(&qword_21B20);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  sub_273C((uint64_t *)&unk_21CD8);
  sub_15270();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_C394(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_273C(&qword_21B20);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  long long v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController__settingsDetails;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_273C((uint64_t *)&unk_21CD8);
  sub_15260();
  swift_endAccess();
  return sub_C4A4;
}

void sub_C4A4(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  long long v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_15270();
    swift_endAccess();
    __n128 v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_15270();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

id sub_C614()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void *sub_C648()
{
  uint64_t v1 = sub_157F0();
  uint64_t v18 = *(void *)(v1 - 8);
  uint64_t v19 = v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_157E0();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_15720();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_273C((uint64_t *)&unk_21CD8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_timer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_sessionStartDate] = 0;
  __n128 v10 = &v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController__settingsDetails];
  long long v24 = 0u;
  memset(v25, 0, sizeof(v25));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  char v11 = v0;
  sub_273C(&qword_21CD0);
  sub_15250();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v9, v6);
  uint64_t v12 = OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_queue;
  sub_3DAC(0, &qword_21CE8);
  sub_15710();
  *(void *)&long long v21 = &_swiftEmptyArrayStorage;
  sub_11318(&qword_21CF0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_273C(&qword_21CF8);
  sub_11360(&qword_21D00, &qword_21CF8);
  sub_15870();
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v19);
  *(void *)&v11[v12] = sub_15820();

  long long v13 = (objc_class *)type metadata accessor for RTSettingsController();
  v20.receiver = v11;
  v20.super_class = v13;
  id v14 = objc_msgSendSuper2(&v20, "init");
  swift_getKeyPath();
  swift_getKeyPath();
  long long v21 = 0u;
  long long v22 = 0u;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = 0xE000000000000000;
  long long v24 = 0u;
  memset(v25, 0, sizeof(v25));
  uint64_t v15 = v14;
  uint64_t v16 = sub_152A0();
  (*(void (**)(uint64_t))&stru_108.segname[(swift_isaMask & *v15) - 8])(v16);

  return v15;
}

uint64_t type metadata accessor for RTSettingsController()
{
  uint64_t result = qword_222E0;
  if (!qword_222E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_CAE8()
{
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_queue];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_CC74;
  *(void *)(v3 + 24) = v2;
  v8[4] = sub_CD94;
  v8[5] = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_CDBC;
  v8[3] = &unk_1D268;
  uint64_t v4 = _Block_copy(v8);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_CC3C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_CC74()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = [objc_allocWithZone((Class)RTRoutineManager) init];
  uint64_t v3 = OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager;
  uint64_t v4 = *(void **)((char *)v1 + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager);
  *(void *)((char *)v1 + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager) = v2;

  uint64_t v5 = *(void **)((char *)v1 + v3);
  if (v5)
  {
    id v6 = objc_allocWithZone((Class)RTLocationShifter);
    id v7 = v5;
    id v8 = [v6 init];
    id v9 = [objc_allocWithZone((Class)RTLocationOfInterestDataSource) initWithRoutineManager:v7 locationShifter:v8];

    __n128 v10 = *(void **)((char *)v1 + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource);
    *(void *)((char *)v1 + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource) = v9;

    (*(void (**)(void))&stru_108.segname[swift_isaMask & *v1])();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_CD84()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_CD94()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_CDBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_CDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_CDF4()
{
  return swift_release();
}

uint64_t sub_CDFC()
{
  uint64_t v1 = (*(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & *v0])();
  (*(void (**)(uint64_t))((char *)&stru_108.reloff + (swift_isaMask & *v0)))(v1);
  uint64_t v2 = *(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v0) + 8];

  return v2();
}

void sub_CEE0()
{
  uint64_t v1 = OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource];
  if (v2)
  {
    [v2 reset];
    uint64_t v3 = *(void **)&v0[v1];
    if (v3)
    {
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = v0;
      v8[4] = sub_D2A8;
      v8[5] = v4;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 1107296256;
      v8[2] = sub_D2F4;
      v8[3] = &unk_1D2B8;
      uint64_t v5 = _Block_copy(v8);
      id v6 = v3;
      id v7 = v0;
      swift_release();
      [v6 loadLocationsOfInterestWithHandler:v5];
      _Block_release(v5);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_CFEC(uint64_t a1, char *a2)
{
  uint64_t v4 = sub_15700();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_15720();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)&a2[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_queue];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  aBlock[4] = sub_11404;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_D2B0;
  aBlock[3] = &unk_1D898;
  long long v13 = _Block_copy(aBlock);
  swift_errorRetain();
  id v14 = a2;
  sub_15710();
  v16[1] = &_swiftEmptyArrayStorage;
  sub_11318(&qword_21DE0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_273C(&qword_21DE8);
  sub_11360((unint64_t *)&unk_21DF0, &qword_21DE8);
  sub_15870();
  sub_15810();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_D2A8(uint64_t a1)
{
  return sub_CFEC(a1, *(char **)(v1 + 16));
}

uint64_t sub_D2B0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_D2F4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_D360()
{
  uint64_t v1 = v0;
  sub_3DAC(0, &qword_21CE8);
  uint64_t v2 = sub_15800();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_D880;
  *(void *)(v4 + 24) = v3;
  v8[4] = sub_117E8;
  v8[5] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_CDBC;
  v8[3] = &unk_1D330;
  uint64_t v5 = _Block_copy(v8);
  id v6 = v1;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v5);

  _Block_release(v5);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_D4D4(void *a1)
{
  uint64_t v2 = sub_151E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_273C(&qword_21E08);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource;
  uint64_t v10 = *(void **)((char *)a1 + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource);
  if (!v10) {
    goto LABEL_13;
  }
  unint64_t v11 = (unint64_t)[v10 summaryRecordCount];
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v12 = v11;
  uint64_t v13 = (swift_isaMask & *a1) + 240;
  double v31 = *(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *a1));
  v30[1] = v13;
  id v14 = (uint64_t (*)(unsigned char *, void))v31(v34);
  if (!*(void *)(v15 + 40))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(void *)(v15 + 24) = v12;
  uint64_t v16 = v14(v34, 0);
  (*(void (**)(void *__return_ptr, uint64_t))((char *)&stru_B8.size + (swift_isaMask & *a1)))(v33, v16);
  sub_BF98((uint64_t)v33, (uint64_t)v34);
  if (!v36)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v17 = v35;
  uint64_t result = sub_B224((uint64_t)v33, (void (*)(void, void, void, void, void, void, void, void, void, void, void, char))sub_7DF8);
  if (v17 < 1) {
    return result;
  }
  uint64_t v19 = *(void **)((char *)a1 + v9);
  if (!v19) {
    goto LABEL_16;
  }
  id v20 = [v19 summaryInterval];
  if (!v20)
  {
LABEL_17:
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
    goto LABEL_18;
  }
  long long v21 = v20;
  sub_151C0();

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
  if (result == 1)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  long long v22 = self;
  Class isa = sub_151B0().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  id v24 = [v22 configureDateRangeString:isa dateStyle:2 timeStyle:0];

  uint64_t v25 = sub_15760();
  uint64_t v27 = v26;

  uint64_t v29 = (uint64_t (*)(unsigned char *, void))v31(v32);
  uint64_t result = *(void *)(v28 + 40);
  if (!result)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  *(void *)(v28 + 32) = v25;
  *(void *)(v28 + 40) = v27;
  swift_bridgeObjectRelease();
  return v29(v32, 0);
}

uint64_t sub_D880()
{
  return sub_D4D4(*(void **)(v0 + 16));
}

uint64_t sub_D888()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D898()
{
  uint64_t v1 = v0;
  sub_3DAC(0, &qword_21CE8);
  uint64_t v2 = sub_15800();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_DA0C;
  *(void *)(v4 + 24) = v3;
  v8[4] = sub_117E8;
  v8[5] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_CDBC;
  v8[3] = &unk_1D3A8;
  uint64_t v5 = _Block_copy(v8);
  id v6 = v1;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v5);

  _Block_release(v5);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_DA0C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)((char *)v1 + OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_dataSource);
  if (v2)
  {
    id v3 = [v2 recentRecords];
    if (v3)
    {
      uint64_t v4 = v3;
      sub_3DAC(0, &qword_21E00);
      uint64_t v5 = sub_157A0();
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = (*(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *v1)))(v10);
    if (*(void *)(v7 + 40))
    {
      uint64_t v8 = (uint64_t (*)(unsigned char *, void))v6;
      *(void *)(v7 + 48) = v5;
      swift_bridgeObjectRelease();
      return v8(v10, 0);
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_DB14()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DB24(uint64_t a1, char a2)
{
  id v3 = v2;
  sub_3DAC(0, &qword_21CE8);
  uint64_t v6 = sub_15800();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(unsigned char *)(v7 + 24) = a2 & 1;
  *(void *)(v7 + 32) = v3;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_DCE4;
  *(void *)(v8 + 24) = v7;
  v12[4] = sub_117E8;
  v12[5] = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_CDBC;
  v12[3] = &unk_1D420;
  uint64_t v9 = _Block_copy(v12);
  id v10 = v3;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v6, v9);

  _Block_release(v9);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v6) {
    __break(1u);
  }
  return result;
}

uint64_t sub_DCAC()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_DCE4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  v180 = *(void **)(v0 + 32);
  id v3 = self;
  id v4 = [v3 currentDevice];
  id v5 = [v4 model];

  sub_15760();
  uint64_t v6 = sub_15770();
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v181 = v6;
  uint64_t v182 = v8;
  uint64_t v183 = 0x656E6F687069;
  unint64_t v184 = 0xE600000000000000;
  sub_81A0();
  LOBYTE(v6) = sub_15860();
  swift_bridgeObjectRelease();
  if (v6)
  {
    if (v1 == 2) {
      char v9 = v2;
    }
    else {
      char v9 = 1;
    }
    id v10 = self;
    if (v9)
    {
      NSString v11 = sub_15740();
      id v12 = objc_msgSend(v10, "_coreroutine_LocalizedStringForKey:", v11);

      if (v12)
      {
        uint64_t v13 = sub_15760();
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v15 = 0;
      }
      uint64_t v62 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
      uint64_t v63 = v62(&v181);
      if (v64[5])
      {
        uint64_t v65 = (void (*)(uint64_t *, void))v63;
        v64[1] = v13;
        v64[2] = v15;
        swift_bridgeObjectRelease();
        v65(&v181, 0);
        NSString v66 = sub_15740();
        id v67 = objc_msgSend(v10, "_coreroutine_LocalizedStringForKey:", v66);

        if (v67)
        {
          uint64_t v68 = sub_15760();
          uint64_t v39 = v69;
        }
        else
        {
          uint64_t v68 = 0;
          uint64_t v39 = 0;
        }
        uint64_t v76 = v62(&v181);
        if (v77[5]) {
          goto LABEL_134;
        }
        swift_bridgeObjectRelease();
        __break(1u);
        goto LABEL_44;
      }
      swift_bridgeObjectRelease();
      __break(1u);
    }
    else
    {
      NSString v28 = sub_15740();
      id v29 = objc_msgSend(v10, "_coreroutine_LocalizedStringForKey:", v28);

      if (v29)
      {
        uint64_t v30 = sub_15760();
        uint64_t v32 = v31;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v32 = 0;
      }
      uint64_t v62 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
      uint64_t v70 = v62(&v181);
      if (v71[5])
      {
        v72 = (void (*)(uint64_t *, void))v70;
        v71[1] = v30;
        v71[2] = v32;
        swift_bridgeObjectRelease();
        v72(&v181, 0);
        NSString v73 = sub_15740();
        id v74 = objc_msgSend(v10, "_coreroutine_LocalizedStringForKey:", v73);

        if (v74)
        {
          uint64_t v68 = sub_15760();
          uint64_t v39 = v75;

LABEL_45:
          uint64_t v76 = v62(&v181);
          if (v77[5]) {
            goto LABEL_134;
          }
          swift_bridgeObjectRelease();
          __break(1u);
LABEL_47:
          NSString v78 = sub_15740();
          id v79 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v78);

          double v42 = v180;
          if (v79)
          {
            uint64_t v80 = sub_15760();
            uint64_t v82 = v81;
          }
          else
          {
            uint64_t v80 = 0;
            uint64_t v82 = 0;
          }
          v118 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
          uint64_t v125 = v118(&v181);
          if (v126[5])
          {
            v127 = (void (*)(uint64_t *, void))v125;
            v126[1] = v80;
            v126[2] = v82;
            swift_bridgeObjectRelease();
            v127(&v181, 0);
            NSString v128 = sub_15740();
            id v129 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v128);

            if (v129)
            {
              uint64_t v68 = sub_15760();
              uint64_t v39 = v130;

LABEL_87:
              uint64_t v76 = v118(&v181);
              if (v77[5]) {
                goto LABEL_134;
              }
              swift_bridgeObjectRelease();
              __break(1u);
LABEL_89:
              NSString v131 = sub_15740();
              id v132 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v131);

              if (v132)
              {
                uint64_t v59 = (__objc2_class_ro *)sub_15760();
                uint64_t v134 = v133;
              }
              else
              {
                uint64_t v59 = 0;
                uint64_t v134 = 0;
              }
              v153 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v42));
              uint64_t v166 = v153(&v181);
              if (v167[5])
              {
                v168 = (void (*)(uint64_t *, void))v166;
                v167[1] = v59;
                v167[2] = v134;
                swift_bridgeObjectRelease();
                v168(&v181, 0);
                NSString v169 = sub_15740();
                id v170 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v169);

                if (v170)
                {
                  uint64_t v68 = sub_15760();
                  uint64_t v39 = v171;

                  goto LABEL_130;
                }
LABEL_129:
                uint64_t v68 = 0;
                uint64_t v39 = 0;
LABEL_130:
                uint64_t v76 = v153(&v181);
                if (!v77[5])
                {
                  swift_bridgeObjectRelease();
                  __break(1u);
                  goto LABEL_132;
                }
LABEL_134:
                v178 = (uint64_t (*)(uint64_t *, void))v76;
                v77[7] = v68;
                v77[8] = v39;
                swift_bridgeObjectRelease();
                return v178(&v181, 0);
              }
              goto LABEL_145;
            }
LABEL_86:
            uint64_t v68 = 0;
            uint64_t v39 = 0;
            goto LABEL_87;
          }
          goto LABEL_140;
        }
LABEL_44:
        uint64_t v68 = 0;
        uint64_t v39 = 0;
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_137;
  }
  id v16 = [v3 currentDevice];
  id v17 = [v16 model];

  sub_15760();
  uint64_t v18 = sub_15770();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  uint64_t v181 = v18;
  uint64_t v182 = v20;
  uint64_t v183 = 1684107369;
  unint64_t v184 = 0xE400000000000000;
  LOBYTE(v18) = sub_15860();
  swift_bridgeObjectRelease();
  if (v18)
  {
    if (v1 == 2) {
      char v21 = v2;
    }
    else {
      char v21 = 1;
    }
    long long v22 = self;
    if (v21)
    {
      NSString v23 = sub_15740();
      id v24 = objc_msgSend(v22, "_coreroutine_LocalizedStringForKey:", v23);

      if (v24)
      {
        uint64_t v25 = sub_15760();
        uint64_t v27 = v26;
      }
      else
      {
        uint64_t v25 = 0;
        uint64_t v27 = 0;
      }
      v95 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
      uint64_t v96 = v95(&v181);
      if (!v97[5])
      {
LABEL_137:
        swift_bridgeObjectRelease();
        __break(1u);
LABEL_138:
        swift_bridgeObjectRelease();
        __break(1u);
        goto LABEL_139;
      }
      v98 = (void (*)(uint64_t *, void))v96;
      v97[1] = v25;
      v97[2] = v27;
      swift_bridgeObjectRelease();
      v98(&v181, 0);
      NSString v99 = sub_15740();
      id v100 = objc_msgSend(v22, "_coreroutine_LocalizedStringForKey:", v99);

      if (v100)
      {
        uint64_t v68 = sub_15760();
        uint64_t v39 = v101;
      }
      else
      {
        uint64_t v68 = 0;
        uint64_t v39 = 0;
      }
      uint64_t v76 = v95(&v181);
      if (v77[5]) {
        goto LABEL_134;
      }
      swift_bridgeObjectRelease();
      __break(1u);
    }
    else
    {
      NSString v46 = sub_15740();
      id v47 = objc_msgSend(v22, "_coreroutine_LocalizedStringForKey:", v46);

      if (v47)
      {
        uint64_t v48 = sub_15760();
        uint64_t v50 = v49;
      }
      else
      {
        uint64_t v48 = 0;
        uint64_t v50 = 0;
      }
      v95 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
      uint64_t v102 = v95(&v181);
      if (!v103[5]) {
        goto LABEL_138;
      }
      v104 = (void (*)(uint64_t *, void))v102;
      v103[1] = v48;
      v103[2] = v50;
      swift_bridgeObjectRelease();
      v104(&v181, 0);
      NSString v105 = sub_15740();
      id v106 = objc_msgSend(v22, "_coreroutine_LocalizedStringForKey:", v105);

      if (v106)
      {
        uint64_t v68 = sub_15760();
        uint64_t v39 = v107;

LABEL_68:
        uint64_t v76 = v95(&v181);
        if (v77[5]) {
          goto LABEL_134;
        }
        swift_bridgeObjectRelease();
        __break(1u);
        goto LABEL_70;
      }
    }
    uint64_t v68 = 0;
    uint64_t v39 = 0;
    goto LABEL_68;
  }
  id v33 = [v3 currentDevice];
  id v34 = [v33 model];

  sub_15760();
  uint64_t v35 = sub_15770();
  uint64_t v37 = v36;
  swift_bridgeObjectRelease();
  uint64_t v181 = v35;
  uint64_t v182 = v37;
  uint64_t v183 = 1685024873;
  unint64_t v184 = 0xE400000000000000;
  LOBYTE(v35) = sub_15860();
  swift_bridgeObjectRelease();
  if (v35)
  {
    if (v1 == 2) {
      char v38 = v2;
    }
    else {
      char v38 = 1;
    }
    uint64_t v39 = self;
    if ((v38 & 1) == 0) {
      goto LABEL_47;
    }
    NSString v40 = sub_15740();
    id v41 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v40);

    double v42 = v180;
    if (v41)
    {
      uint64_t v43 = sub_15760();
      uint64_t v45 = v44;
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v45 = 0;
    }
    v117 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
    v118 = (uint64_t (*)(uint64_t *))((swift_isaMask & *v180) + 240);
    uint64_t v119 = v117(&v181);
    if (v120[5])
    {
      v121 = (void (*)(uint64_t *, void))v119;
      v120[1] = v43;
      v120[2] = v45;
      swift_bridgeObjectRelease();
      v121(&v181, 0);
      NSString v122 = sub_15740();
      id v123 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v122);

      if (v123)
      {
        uint64_t v68 = sub_15760();
        uint64_t v39 = v124;
      }
      else
      {
        uint64_t v68 = 0;
        uint64_t v39 = 0;
      }
      uint64_t v76 = v117(&v181);
      if (v77[5]) {
        goto LABEL_134;
      }
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_86;
    }
LABEL_139:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_140:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_141:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_142:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_143;
  }
  id v51 = [v3 currentDevice];
  id v52 = [v51 model];

  sub_15760();
  uint64_t v53 = sub_15770();
  uint64_t v55 = v54;
  swift_bridgeObjectRelease();
  uint64_t v181 = v53;
  uint64_t v182 = v55;
  uint64_t v183 = 6513005;
  unint64_t v184 = 0xE300000000000000;
  LOBYTE(v53) = sub_15860();
  swift_bridgeObjectRelease();
  if (v53)
  {
    if (v1 == 2) {
      char v56 = v2;
    }
    else {
      char v56 = 1;
    }
    uint64_t v39 = self;
    if (v56)
    {
      NSString v57 = sub_15740();
      id v58 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v57);

      double v42 = v180;
      if (v58)
      {
        uint64_t v59 = (__objc2_class_ro *)sub_15760();
        uint64_t v61 = v60;
      }
      else
      {
        uint64_t v59 = 0;
        uint64_t v61 = 0;
      }
      v140 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
      uint64_t v141 = v140(&v181);
      if (!v142[5]) {
        goto LABEL_141;
      }
      v143 = (void (*)(uint64_t *, void))v141;
      v142[1] = v59;
      v142[2] = v61;
      swift_bridgeObjectRelease();
      v143(&v181, 0);
      NSString v144 = sub_15740();
      id v145 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v144);

      if (v145)
      {
        uint64_t v68 = sub_15760();
        uint64_t v39 = v146;
      }
      else
      {
        uint64_t v68 = 0;
        uint64_t v39 = 0;
      }
      uint64_t v76 = v140(&v181);
      if (v77[5]) {
        goto LABEL_134;
      }
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_104;
    }
LABEL_70:
    NSString v108 = sub_15740();
    id v109 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v108);

    double v42 = v180;
    if (v109)
    {
      uint64_t v59 = (__objc2_class_ro *)sub_15760();
      uint64_t v111 = v110;
    }
    else
    {
      uint64_t v59 = 0;
      uint64_t v111 = 0;
    }
    v140 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
    uint64_t v147 = v140(&v181);
    if (!v148[5]) {
      goto LABEL_142;
    }
    v149 = (void (*)(uint64_t *, void))v147;
    v148[1] = v59;
    v148[2] = v111;
    swift_bridgeObjectRelease();
    v149(&v181, 0);
    NSString v150 = sub_15740();
    id v151 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v150);

    if (v151)
    {
      uint64_t v68 = sub_15760();
      uint64_t v39 = v152;

LABEL_105:
      uint64_t v76 = v140(&v181);
      if (v77[5]) {
        goto LABEL_134;
      }
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_107;
    }
LABEL_104:
    uint64_t v68 = 0;
    uint64_t v39 = 0;
    goto LABEL_105;
  }
  id v83 = [v3 currentDevice];
  id v84 = [v83 model];

  sub_15760();
  uint64_t v85 = sub_15770();
  uint64_t v87 = v86;
  swift_bridgeObjectRelease();
  uint64_t v181 = v85;
  uint64_t v182 = v87;
  uint64_t v183 = 0x6863746177;
  unint64_t v184 = 0xE500000000000000;
  char v88 = sub_15860();
  swift_bridgeObjectRelease();
  if (v1 == 2) {
    char v89 = v2;
  }
  else {
    char v89 = 1;
  }
  uint64_t v39 = self;
  if (v88)
  {
    double v42 = v180;
    if ((v89 & 1) == 0) {
      goto LABEL_89;
    }
    NSString v90 = sub_15740();
    uint64_t v59 = &RTSettingsViewController;
    id v91 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v90);

    if (v91)
    {
      uint64_t v92 = sub_15760();
      uint64_t v94 = v93;

LABEL_108:
      v153 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v42));
      uint64_t v154 = v153(&v181);
      if (!v155[5])
      {
LABEL_143:
        swift_bridgeObjectRelease();
        __break(1u);
LABEL_144:
        swift_bridgeObjectRelease();
        __break(1u);
LABEL_145:
        swift_bridgeObjectRelease();
        __break(1u);
LABEL_146:
        swift_bridgeObjectRelease();
        __break(1u);
        goto LABEL_147;
      }
      v156 = (void (*)(uint64_t *, void))v154;
      v155[1] = v92;
      v155[2] = v94;
      swift_bridgeObjectRelease();
      v156(&v181, 0);
      NSString v157 = sub_15740();
      id v158 = objc_msgSend(v39, *(SEL *)&v59[51].flags, v157);

      if (v158)
      {
        uint64_t v68 = sub_15760();
        uint64_t v39 = v159;
      }
      else
      {
        uint64_t v68 = 0;
        uint64_t v39 = 0;
      }
      uint64_t v76 = v153(&v181);
      if (v77[5]) {
        goto LABEL_134;
      }
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_126;
    }
LABEL_107:
    uint64_t v92 = 0;
    uint64_t v94 = 0;
    goto LABEL_108;
  }
  if (v89)
  {
    NSString v112 = sub_15740();
    uint64_t v59 = &RTSettingsViewController;
    id v113 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v112);

    if (v113)
    {
      uint64_t v114 = sub_15760();
      uint64_t v116 = v115;
    }
    else
    {
      uint64_t v114 = 0;
      uint64_t v116 = 0;
    }
    v153 = *(uint64_t (**)(uint64_t *))((char *)&stru_B8.reloff + (swift_isaMask & *v180));
    uint64_t v160 = v153(&v181);
    if (!v161[5]) {
      goto LABEL_144;
    }
    v162 = (void (*)(uint64_t *, void))v160;
    v161[1] = v114;
    v161[2] = v116;
    swift_bridgeObjectRelease();
    v162(&v181, 0);
    NSString v163 = sub_15740();
    id v164 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v163);

    if (v164)
    {
      uint64_t v68 = sub_15760();
      uint64_t v39 = v165;

LABEL_127:
      uint64_t v76 = v153(&v181);
      if (v77[5]) {
        goto LABEL_134;
      }
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_129;
    }
LABEL_126:
    uint64_t v68 = 0;
    uint64_t v39 = 0;
    goto LABEL_127;
  }
  NSString v135 = sub_15740();
  id v136 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v135);

  if (v136)
  {
    uint64_t v137 = sub_15760();
    uint64_t v139 = v138;
  }
  else
  {
    uint64_t v137 = 0;
    uint64_t v139 = 0;
  }
  uint64_t v59 = *(__objc2_class_ro **)((char *)&stru_B8.reloff + (swift_isaMask & *v180));
  uint64_t v172 = ((uint64_t (*)(uint64_t *))v59)(&v181);
  if (!v173[5]) {
    goto LABEL_146;
  }
  v174 = (void (*)(uint64_t *, void))v172;
  v173[1] = v137;
  v173[2] = v139;
  swift_bridgeObjectRelease();
  v174(&v181, 0);
  NSString v175 = sub_15740();
  id v176 = objc_msgSend(v39, "_coreroutine_LocalizedStringForKey:", v175);

  if (v176)
  {
    uint64_t v68 = sub_15760();
    uint64_t v39 = v177;

    goto LABEL_133;
  }
LABEL_132:
  uint64_t v68 = 0;
  uint64_t v39 = 0;
LABEL_133:
  uint64_t v76 = ((uint64_t (*)(uint64_t *))v59)(&v181);
  if (v77[5]) {
    goto LABEL_134;
  }
LABEL_147:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_F264()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_F274()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager];
  if (v1)
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v0;
    v6[4] = sub_F61C;
    v6[5] = v2;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_F624;
    v6[3] = &unk_1D470;
    id v3 = _Block_copy(v6);
    id v4 = v1;
    id v5 = v0;
    swift_release();
    [v4 fetchCloudSyncAuthorizationState:v3];
    _Block_release(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_F368(uint64_t a1, char *a2)
{
  uint64_t v4 = sub_15700();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_15720();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  NSString v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(void *)&a2[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_queue];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_112B4;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_D2B0;
  aBlock[3] = &unk_1D848;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = a2;
  sub_15710();
  v16[1] = &_swiftEmptyArrayStorage;
  sub_11318(&qword_21DE0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_273C(&qword_21DE8);
  sub_11360((unint64_t *)&unk_21DF0, &qword_21DE8);
  sub_15870();
  sub_15810();
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_F61C(uint64_t a1)
{
  return sub_F368(a1, *(char **)(v1 + 16));
}

void sub_F624(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_F62C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager];
  if (v1)
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v0;
    v6[4] = sub_F720;
    v6[5] = v2;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_D2F4;
    v6[3] = &unk_1D4C0;
    id v3 = _Block_copy(v6);
    id v4 = v1;
    uint64_t v5 = v0;
    swift_release();
    [v4 clearRoutineWithHandler:v3];
    _Block_release(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_F720(uint64_t a1)
{
  id v3 = *(char **)(v1 + 16);
  id v4 = *(NSObject **)&v3[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_queue];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_10EB4;
  *(void *)(v6 + 24) = v5;
  v10[4] = sub_117E8;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_CDBC;
  v10[3] = &unk_1D780;
  uint64_t v7 = _Block_copy(v10);
  swift_errorRetain();
  uint64_t v8 = v3;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LODWORD(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    __break(1u);
  }
  return result;
}

unint64_t sub_F88C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_273C((uint64_t *)&unk_21DD0);
  uint64_t v2 = (void *)sub_15910();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_3C48(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    NSString v11 = (uint64_t *)(v2[6] + 16 * result);
    *NSString v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_F9A8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_273C(&qword_21828);
    uint64_t v2 = (void *)sub_15910();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    uint64_t v19 = *(void **)(*(void *)(a1 + 56) + 8 * v12);
    *(void *)&v37[0] = *v17;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    v19;
    swift_dynamicCast();
    sub_3DAC(0, &qword_21DC0);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_3DE8(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_3DE8(v36, v37);
    sub_3DE8(v37, &v33);
    uint64_t result = sub_158E0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_3DE8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_3CC0();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_FD6C(char a1)
{
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager];
  if (v2)
  {
    if (a1 != 2)
    {
      uint64_t v4 = a1 & 1;
      uint64_t v5 = swift_allocObject();
      *(unsigned char *)(v5 + 16) = a1;
      *(void *)(v5 + 24) = v1;
      v9[4] = sub_FEBC;
      v9[5] = v5;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256;
      v9[2] = sub_D2F4;
      v9[3] = &unk_1D510;
      uint64_t v6 = _Block_copy(v9);
      id v7 = v2;
      int64_t v8 = v1;
      swift_release();
      [v7 setRoutineEnabled:v4 withHandler:v6];
      _Block_release(v6);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_FE84()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_FEBC(uint64_t a1)
{
  char v3 = *(unsigned char *)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 24);
  sub_3DAC(0, &qword_21CE8);
  uint64_t v5 = sub_15800();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(unsigned char *)(v6 + 24) = v3;
  *(void *)(v6 + 32) = v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10B6C;
  *(void *)(v7 + 24) = v6;
  v11[4] = sub_117E8;
  v11[5] = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_CDBC;
  v11[3] = &unk_1D708;
  int64_t v8 = _Block_copy(v11);
  swift_errorRetain();
  id v9 = v4;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);

  _Block_release(v8);
  LODWORD(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v5) {
    __break(1u);
  }
  return result;
}

void sub_10050()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC19CoreRoutineSettings20RTSettingsController_routineManager];
  if (v1)
  {
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v0;
    v6[4] = sub_10144;
    v6[5] = v2;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_102D4;
    v6[3] = &unk_1D560;
    char v3 = _Block_copy(v6);
    id v4 = v1;
    uint64_t v5 = v0;
    swift_release();
    [v4 fetchRoutineStateWithHandler:v3];
    _Block_release(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10144(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  sub_3DAC(0, &qword_21CE8);
  uint64_t v6 = sub_15800();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a2;
  v7[3] = v5;
  v7[4] = a1;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10920;
  *(void *)(v8 + 24) = v7;
  v12[4] = sub_117E8;
  v12[5] = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_CDBC;
  v12[3] = &unk_1D690;
  id v9 = _Block_copy(v12);
  swift_errorRetain();
  id v10 = v5;
  swift_retain();
  swift_release();
  dispatch_sync(v6, v9);

  _Block_release(v9);
  LODWORD(v6) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v6) {
    __break(1u);
  }
  return result;
}

void sub_102D4(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_102DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_1035C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RTSettingsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *sub_10458()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10464@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for RTSettingsController();
  uint64_t result = sub_15240();
  *a1 = result;
  return result;
}

uint64_t destroy for RTSettingsDetails()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RTSettingsDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RTSettingsDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

__n128 initializeWithTake for RTSettingsDetails(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for RTSettingsDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for RTSettingsDetails(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RTSettingsDetails(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 89) = 1;
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
    *(unsigned char *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RTSettingsDetails()
{
  return &type metadata for RTSettingsDetails;
}

uint64_t sub_107C4()
{
  return type metadata accessor for RTSettingsController();
}

void sub_107CC()
{
  sub_10878();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10878()
{
  if (!qword_21D50)
  {
    sub_4590(&qword_21CD0);
    unint64_t v0 = sub_152B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_21D50);
    }
  }
}

void type metadata accessor for RTCloudSyncAuthorization(uint64_t a1)
{
}

BOOL sub_108E8(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_108FC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1090C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10918()
{
  return sub_113B8(40);
}

uint64_t (*sub_10920())(unsigned char *, void)
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  if (v2)
  {
    uint64_t v4 = self;
    NSString v5 = sub_15740();
    id v6 = objc_msgSend(v4, "_coreroutine_LocalizedStringForKey:", v5);

    if (v6)
    {
      uint64_t v7 = sub_15760();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    unint64_t v14 = *(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *v3));
    uint64_t v15 = v14(v20);
    if (v16[5])
    {
      id v17 = (void (*)(unsigned char *, void))v15;
      v16[9] = v7;
      v16[10] = v9;
      swift_bridgeObjectRelease();
      v17(v20, 0);
      __n128 result = (uint64_t (*)(unsigned char *, void))v14(v20);
      if (*(void *)(v18 + 40))
      {
        *(unsigned char *)(v18 + 88) = 1;
        return (uint64_t (*)(unsigned char *, void))result(v20, 0);
      }
    }
    else
    {
      __n128 result = (uint64_t (*)(unsigned char *, void))swift_bridgeObjectRelease();
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v10 = *(void *)(v1 + 32);
  unint64_t v11 = *(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *v3));
  if (v10 <= 1)
  {
    __n128 result = (uint64_t (*)(unsigned char *, void))v11(v20);
    if (*(void *)(v13 + 40))
    {
      *(unsigned char *)uint64_t v13 = 0;
      return (uint64_t (*)(unsigned char *, void))result(v20, 0);
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  __n128 result = (uint64_t (*)(unsigned char *, void))v11(v20);
  if (!*(void *)(v19 + 40))
  {
LABEL_17:
    __break(1u);
    return result;
  }
  *(unsigned char *)uint64_t v19 = 1;
  return (uint64_t (*)(unsigned char *, void))result(v20, 0);
}

uint64_t sub_10B1C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10B2C()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10B6C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  int v2 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  if (!v1)
  {
    if (v2 != 2)
    {
      unint64_t v10 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff
                                                                                     + (swift_isaMask & *v3)))(v22);
      if (*(void *)(v11 + 40))
      {
        *(unsigned char *)uint64_t v11 = v2 & 1;
        v10(v22, 0);
        id v12 = [self defaultCenter];
        NSString v13 = sub_15740();
        [v12 postNotificationName:v13 object:v3];

        return;
      }
      goto LABEL_22;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v2 == 2)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v4 = self;
  if (v2)
  {
    NSString v14 = sub_15740();
    id v15 = objc_msgSend(v4, "_coreroutine_LocalizedStringForKey:", v14);

    if (v15)
    {
      uint64_t v7 = sub_15760();
      uint64_t v9 = v16;

      goto LABEL_15;
    }
  }
  else
  {
    NSString v5 = sub_15740();
    id v6 = objc_msgSend(v4, "_coreroutine_LocalizedStringForKey:", v5);

    if (v6)
    {
      uint64_t v7 = sub_15760();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    uint64_t v17 = (*(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *v3)))(v22);
    if (v18[5]) {
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
    __break(1u);
  }
  uint64_t v7 = 0;
  uint64_t v9 = 0;
LABEL_15:
  uint64_t v17 = (*(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *v3)))(v22);
  if (!v18[5])
  {
LABEL_23:
    swift_bridgeObjectRelease();
    __break(1u);
    return;
  }
LABEL_16:
  uint64_t v19 = (void (*)(unsigned char *, void))v17;
  v18[9] = v7;
  v18[10] = v9;
  swift_bridgeObjectRelease();
  v19(v22, 0);
  uint64_t v20 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff
                                                                                 + (swift_isaMask & *v3)))(v22);
  if (!*(void *)(v21 + 40))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  *(unsigned char *)(v21 + 88) = 1;
  v20(v22, 0);
}

uint64_t sub_10E9C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10EAC()
{
  return sub_113B8(32);
}

void sub_10EB4()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (!*(void *)(v0 + 16))
  {
    (*(void (**)(void))&stru_108.segname[swift_isaMask & *v1])();
    id v12 = 0;
    uint64_t v11 = &_swiftEmptyDictionarySingleton;
    goto LABEL_6;
  }
  sub_3DAC(0, &qword_21CE8);
  uint64_t v2 = sub_15800();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_11250;
  *(void *)(v4 + 24) = v3;
  v17[4] = sub_117E8;
  v17[5] = v4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  void v17[2] = sub_CDBC;
  v17[3] = &unk_1D7F8;
  NSString v5 = _Block_copy(v17);
  id v6 = v1;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v5);

  _Block_release(v5);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v2)
  {
    __break(1u);
  }
  else
  {
    sub_273C(&qword_21DC8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_16CC0;
    *(void *)(inited + 32) = 0xD000000000000013;
    *(void *)(inited + 40) = 0x8000000000017630;
    uint64_t v8 = (void *)sub_151F0();
    id v9 = [v8 domain];

    if (v9)
    {
      *(void *)(inited + 48) = v9;
      *(void *)(inited + 56) = 0xD000000000000011;
      *(void *)(inited + 64) = 0x8000000000017610;
      unint64_t v10 = (void *)sub_151F0();
      [v10 code];

      *(NSNumber *)(inited + 72) = sub_157D0();
      uint64_t v11 = (void *)sub_F88C(inited);
      id v12 = sub_11250;
LABEL_6:
      NSString v13 = sub_15740();
      sub_F9A8((uint64_t)v11);
      Class isa = sub_15730().super.isa;
      swift_bridgeObjectRelease();
      sub_13C6C(v13, isa);

      NSString v15 = sub_15740();
      sub_3DAC(0, &qword_21DC0);
      Class v16 = sub_15730().super.isa;
      swift_bridgeObjectRelease();
      AnalyticsSendEvent();

      sub_81F4((uint64_t)v12);
      return;
    }
  }
  __break(1u);
}

uint64_t sub_11240()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t (*sub_11250())(unsigned char *, void)
{
  return sub_11618();
}

uint64_t sub_1126C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1127C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_112B4()
{
  return (*(uint64_t (**)(void, void))((char *)&stru_108.offset + (swift_isaMask & **(void **)(v0 + 16))))(*(void *)(v0 + 24), 0);
}

uint64_t sub_11318(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_11360(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_4590(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_113B0()
{
  return sub_113B8(32);
}

uint64_t sub_113B8(uint64_t a1)
{
  swift_errorRelease();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_11404()
{
  uint64_t isEscapingClosureAtFileLocation = *(void *)(v0 + 24);
  if (*(void *)(v0 + 16))
  {
    sub_3DAC(0, &qword_21CE8);
    uint64_t v2 = sub_15800();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = isEscapingClosureAtFileLocation;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = sub_115FC;
    *(void *)(v4 + 24) = v3;
    v9[4] = sub_117E8;
    v9[5] = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_CDBC;
    v9[3] = &unk_1D910;
    NSString v5 = _Block_copy(v9);
    id v6 = (id)isEscapingClosureAtFileLocation;
    swift_retain();
    swift_release();
    dispatch_sync(v2, v5);

    _Block_release(v5);
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  uint64_t v8 = (*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *(void *)isEscapingClosureAtFileLocation) + 16])();
  return (*(uint64_t (**)(uint64_t))((char *)&stru_108.size
                                            + (swift_isaMask & *(void *)isEscapingClosureAtFileLocation)))(v8);
}

uint64_t (*sub_115FC())(unsigned char *, void)
{
  return sub_11618();
}

uint64_t (*sub_11618())(unsigned char *, void)
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = self;
  NSString v3 = sub_15740();
  id v4 = objc_msgSend(v2, "_coreroutine_LocalizedStringForKey:", v3);

  if (v4)
  {
    uint64_t v5 = sub_15760();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(unsigned char *))((char *)&stru_B8.reloff + (swift_isaMask & *v1));
  uint64_t v9 = v8(v14);
  if (v10[5])
  {
    uint64_t v11 = (void (*)(unsigned char *, void))v9;
    v10[9] = v5;
    v10[10] = v7;
    swift_bridgeObjectRelease();
    v11(v14, 0);
    uint64_t result = (uint64_t (*)(unsigned char *, void))v8(v14);
    if (*(void *)(v13 + 40))
    {
      *(unsigned char *)(v13 + 88) = 1;
      return (uint64_t (*)(unsigned char *, void))result(v14, 0);
    }
  }
  else
  {
    uint64_t result = (uint64_t (*)(unsigned char *, void))swift_bridgeObjectRelease();
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1177C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void type metadata accessor for RTRoutineState(uint64_t a1)
{
}

void sub_117A0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_118A8()
{
  return 0;
}

uint64_t sub_11B60(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

uint64_t sub_11C64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_11C74(uint64_t a1)
{
}

uint64_t sub_11C7C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) copy];

  return _objc_release_x1();
}

uint64_t sub_11DB8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return _objc_release_x1();
}

void sub_11F00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_11FC8;
    v4[3] = &unk_1DA00;
    v4[4] = v1;
    id v5 = *(id *)(a1 + 40);
    [v2 fetchAllLocationsOfInterestForSettingsWithHandler:v4];
  }
  else
  {
    NSString v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void sub_11FC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    if ([v5 count])
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(NSObject **)(v11 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_12174;
      block[3] = &unk_1D9D8;
      block[4] = v11;
      id v15 = v5;
      id v16 = *(id *)(a1 + 40);
      dispatch_async(v12, block);

      goto LABEL_13;
    }
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_12:
    v13();
    goto LABEL_13;
  }
  uint64_t v8 = [v6 domain];
  if (![v8 isEqualToString:RTErrorDomain])
  {

    goto LABEL_10;
  }
  uint64_t v9 = (char *)[v7 code];

  if (v9 != (unsigned char *)&dword_4 + 1)
  {
LABEL_10:
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  unint64_t v10 = sub_139DC(&qword_21EB0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "attempted to fetch locations of interest and the data store was unavailable, attempting again.", buf, 2u);
  }

  [*(id *)(a1 + 32) loadLocationsOfInterestWithHandler:*(void *)(a1 + 40)];
LABEL_13:
}

void sub_12174(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  v18[0] = 0;
  v18[1] = v18;
  void v18[2] = 0x3032000000;
  v18[3] = sub_11C64;
  v18[4] = sub_11C74;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  void v16[2] = 0x3032000000;
  v16[3] = sub_11C64;
  v16[4] = sub_11C74;
  id v17 = 0;
  dispatch_group_enter(v2);
  NSString v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1236C;
  v12[3] = &unk_1D988;
  NSString v14 = v18;
  id v15 = v16;
  id v5 = v2;
  uint64_t v13 = v5;
  [v3 shiftLocationOfInterestCoordinates:v4 handler:v12];
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12408;
  block[3] = &unk_1D9B0;
  unint64_t v10 = v16;
  id v7 = *(id *)(a1 + 48);
  block[4] = *(void *)(a1 + 32);
  id v9 = v7;
  uint64_t v11 = v18;
  dispatch_group_notify(v5, v6, block);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

void sub_12348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1236C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_12408(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    return [*(id *)(a1 + 32) processLocationsOfInterest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 40)];
  }
  uint64_t v2 = sub_139DC(&qword_21EB0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "Failed to shift locations of interest for display in Settings.", v4, 2u);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) processLocationsOfInterest:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handler:*(void *)(a1 + 40)];
  }
}

void sub_12A50(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] < 3)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v6 entryDate];
    uint64_t v9 = [v7 earlierDate:v8];
    if ([v9 isEqualToDate:*(void *)(a1 + 40)])
    {
      unint64_t v10 = [v6 entryDate];
      id v11 = [v10 earlierDate:*(void *)(a1 + 48)];
      id v12 = [v6 entryDate];
      unsigned int v13 = [v11 isEqualToDate:v12];

      if (v13)
      {
        NSString v14 = *(void **)(a1 + 56);
        id v15 = [v6 identifier];
        id v16 = [v14 objectForKeyedSubscript:v15];

        id v46 = objc_alloc((Class)RTLocationOfInterest);
        uint64_t v17 = [v16 location];
        [v16 confidence];
        double v19 = v18;
        uint64_t v20 = [v16 identifier];
        id v21 = [v16 type];
        id v22 = [v16 typeSource];
        id v49 = v6;
        char v23 = +[NSArray arrayWithObjects:&v49 count:1];
        unint64_t v24 = [v16 customLabel];
        BOOL v25 = [v16 mapItem];
        id v26 = [v46 initWithLocation:v17 confidence:v20 identifier:v21 type:v22 typeSource:v23 visits:v24 customLabel:v19 mapItem:v25];

        [*(id *)(a1 + 32) addObject:v26];
        goto LABEL_10;
      }
    }
    else
    {
    }
    int64_t v27 = [v6 entryDate];
    uint64_t v28 = [v27 earlierDate:*(void *)(a1 + 40)];
    long long v29 = [v6 entryDate];
    unsigned int v30 = [v28 isEqualToDate:v29];

    if (!v30) {
      goto LABEL_10;
    }
    if (![*(id *)(a1 + 32) count])
    {
      uint64_t v31 = *(void **)(a1 + 56);
      long long v32 = [v6 identifier];
      long long v33 = [v31 objectForKeyedSubscript:v32];

      id v34 = objc_alloc((Class)RTLocationOfInterest);
      uint64_t v35 = [v33 location];
      [v33 confidence];
      double v37 = v36;
      char v38 = [v33 identifier];
      id v47 = [v33 type];
      id v45 = [v33 typeSource];
      id v48 = v6;
      uint64_t v39 = +[NSArray arrayWithObjects:&v48 count:1];
      NSString v40 = [v33 customLabel];
      id v41 = [v33 mapItem];
      double v42 = v34;
      uint64_t v43 = (void *)v35;
      id v44 = [v42 initWithLocation:v35 confidence:v38 identifier:v47 type:v45 typeSource:v39 visits:v40 customLabel:v37 mapItem:v41];

      [*(id *)(a1 + 32) addObject:v44];
    }
  }
  *a4 = 1;
LABEL_10:
}

void sub_134A0(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13550;
  block[3] = &unk_1DA78;
  double v9 = a2;
  double v10 = a3;
  id v5 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  id v7 = v5;
  id v8 = *(id *)(a1 + 56);
  dispatch_async(v4, block);
}

void sub_13550(uint64_t a1)
{
  id v2 = objc_alloc((Class)RTLocation);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) location];
  [v5 horizontalUncertainty];
  double v7 = v6;
  id v8 = [*(id *)(a1 + 32) location];
  id v19 = objc_msgSend(v2, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v8, "referenceFrame"), v3, v4, v7);

  id v9 = objc_alloc((Class)RTLocationOfInterest);
  [*(id *)(a1 + 32) confidence];
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) identifier];
  id v13 = [*(id *)(a1 + 32) type];
  id v14 = [*(id *)(a1 + 32) typeSource];
  id v15 = [*(id *)(a1 + 32) visits];
  id v16 = [*(id *)(a1 + 32) customLabel];
  uint64_t v17 = [*(id *)(a1 + 32) mapItem];
  id v18 = [v9 initWithLocation:v19 confidence:v12 identifier:v13 type:v14 typeSource:v15 visits:v16 customLabel:v11 mapItem:v17];

  if (v18) {
    [*(id *)(a1 + 40) addObject:v18];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_136E8(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v6), (void)v8);
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_13864(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
}

id sub_139DC(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_13A3C);
  }
  uint64_t v2 = (void *)predicate[2];

  return v2;
}

os_log_t sub_13A3C(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void sub_13C6C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new();
  [v5 appendFormat:@"\n=== BEGIN analytics submission for event %@ ===\n", v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = [v4 allKeys];
  double v7 = [v6 sortedArrayUsingComparator:&stru_1DCE8];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (id i = 0; i != v9; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v4 objectForKeyedSubscript:v12];
        [v5 appendFormat:@"%@ : %@\n", v12, v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v9);
  }

  [v5 appendFormat:@"=== END analytics submission for event %@ ===\n", v3];
  id v14 = sub_139DC(&qword_21E98);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

int64_t sub_13E60(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_143A4(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v12 = a2;
  if (v12)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = objc_alloc((Class)RTLocation);
    long long v11 = [*(id *)(a1 + 32) date];
    id v9 = [v10 initWithLatitude:v11 longitude:2 horizontalUncertainty:a3 date:a4 referenceFrame:a5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_149BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_14A00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_14A10(uint64_t a1)
{
}

void sub_14A18(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v7 + 32) = a3;
  *(double *)(v7 + 40) = a4;
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v8 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_14CD8(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(a2, a3);
  v7.n128_f64[0] = v8.longitude;
  v6.n128_f64[0] = v8.latitude;
  id v9 = *(uint64_t (**)(uint64_t, void, __n128, __n128, __n128))(v5 + 16);
  v10.n128_f64[0] = a4;

  return v9(v5, 0, v6, v7, v10);
}

uint64_t sub_14D2C(uint64_t a1)
{
  return (*(uint64_t (**)(void, double, double, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_14D60(uint64_t a1, SEL aSelector)
{
  id v3 = NSStringFromSelector(aSelector);
  uint64_t v4 = +[NSString stringWithFormat:@"%@ requires the use of the initializer: %@", a1, v3];

  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];
  objc_exception_throw(v5);
}

CFStringRef RTCloudSyncAuthorizationString(uint64_t a1)
{
  if (a1 == 2) {
    return @"WITH";
  }
  else {
    return @"WITHOUT";
  }
}

id RTAppendDeviceSpecificMessage(uint64_t a1)
{
  uint64_t v1 = +[UIDevice modelSpecificLocalizedStringKeyForKey:a1];
  uint64_t v2 = +[NSBundle _coreroutine_LocalizedStringForKey:v1];

  return v2;
}

id RTExplanationStringWithCloudSyncAuthorizationState(uint64_t a1)
{
  CFStringRef v1 = @"WITHOUT";
  if (a1 == 2) {
    CFStringRef v1 = @"WITH";
  }
  uint64_t v2 = +[NSString stringWithFormat:@"CORE_ROUTINE_EXPLANATION_%@_ICLOUD", v1];
  id v3 = RTAppendDeviceSpecificMessage((uint64_t)v2);

  uint64_t v4 = objc_opt_new();
  id v5 = +[NSBundle _coreroutine_LocalizedStringForKey:v3];
  [v4 appendString:v5];

  __n128 v6 = +[NSBundle _coreroutine_LocalizedStringForKey:@"ABOUT_SIGNIFICANT_LOCATIONS_AND_PRIVACY_TITLE_LINK"];
  [v4 appendFormat:@" %@", v6];

  __n128 v7 = +[NSString stringWithString:v4];

  return v7;
}

id RTClearHistoryStringWithCloudSyncAuthorizationState(uint64_t a1)
{
  CFStringRef v1 = @"WITHOUT";
  if (a1 == 2) {
    CFStringRef v1 = @"WITH";
  }
  uint64_t v2 = +[NSString stringWithFormat:@"RESET_CORE_ROUTINE_%@_ICLOUD_TITLE", v1];
  id v3 = RTAppendDeviceSpecificMessage((uint64_t)v2);

  return v3;
}

BOOL parentalControlsEnabled()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBParentalControlsEnabled", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t locationServicesRestricted()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBParentalControlsEnabled", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  uint64_t v1 = 0;
  if (keyExistsAndHasValidFormat) {
    BOOL v2 = AppBooleanValue == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    id v3 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
    if ([v3 count])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = v3;
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          CLLocationCoordinate2D v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "isEqualToString:", @"location", (void)v10))
            {
              uint64_t v1 = 1;
              goto LABEL_16;
            }
            CLLocationCoordinate2D v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      uint64_t v1 = 0;
LABEL_16:
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

NSDateInterval sub_151B0()
{
  return DateInterval._bridgeToObjectiveC()();
}

uint64_t sub_151C0()
{
  return static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_151D0()
{
  return DateInterval.init(start:end:)();
}

uint64_t sub_151E0()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_151F0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_15200()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_15210()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15220()
{
  return static Date.now.getter();
}

uint64_t sub_15230()
{
  return type metadata accessor for Date();
}

uint64_t sub_15240()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_15250()
{
  return Published.init(initialValue:)();
}

uint64_t sub_15260()
{
  return Published.projectedValue.getter();
}

uint64_t sub_15270()
{
  return Published.projectedValue.setter();
}

uint64_t sub_15280()
{
  return static Published.subscript.modify();
}

uint64_t sub_15290()
{
  return static Published.subscript.getter();
}

uint64_t sub_152A0()
{
  return static Published.subscript.setter();
}

uint64_t sub_152B0()
{
  return type metadata accessor for Published();
}

uint64_t sub_152C0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_152D0()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_152E0()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_152F0()
{
  return ActionSheet.init(title:message:buttons:)();
}

uint64_t sub_15300()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_15310()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_15320()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_15330()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_15340()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_15350()
{
  return static PreviewProvider.platform.getter();
}

uint64_t sub_15380()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_15390()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_153A0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_153B0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_153C0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_153D0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_153E0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_153F0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_15400()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t sub_15410()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_15420()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_15430()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_15450()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_15460()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_15470()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_15480()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_15490()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_154A0()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_154C0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_154D0()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t sub_154E0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_154F0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_15500()
{
  return static Font.caption.getter();
}

uint64_t sub_15510()
{
  return List<>.init(content:)();
}

uint64_t sub_15520()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_15530()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_15540()
{
  return Text.font(_:)();
}

uint64_t sub_15550()
{
  return Text.init<A>(_:)();
}

uint64_t sub_15560()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_15570()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_15580()
{
  return View.actionSheet(isPresented:content:)();
}

uint64_t sub_15590()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_155A0()
{
  return View.alert<A, B>(_:isPresented:actions:)();
}

uint64_t sub_155B0()
{
  return static Alert.Button.default(_:action:)();
}

uint64_t sub_155C0()
{
  return type metadata accessor for Alert.Button();
}

uint64_t sub_155D0()
{
  return static Color.gray.getter();
}

uint64_t sub_155E0()
{
  return static Color.secondary.getter();
}

uint64_t sub_155F0()
{
  return Color.init(_:)();
}

uint64_t sub_15600()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_15610()
{
  return State.wrappedValue.getter();
}

uint64_t sub_15620()
{
  return State.wrappedValue.setter();
}

uint64_t sub_15630()
{
  return State.projectedValue.getter();
}

uint64_t sub_15640()
{
  return Button.init(action:label:)();
}

uint64_t sub_15650()
{
  return Button<>.init(_:role:action:)();
}

uint64_t sub_15660()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_15670()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t sub_15680()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_15690()
{
  return Binding.subscript.getter();
}

uint64_t sub_156A0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_156B0()
{
  return Section<>.init<A>(_:content:)();
}

uint64_t sub_156C0()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_156D0()
{
  return Section<>.init(content:)();
}

uint64_t sub_156E0()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_156F0()
{
  return static Alignment.center.getter();
}

uint64_t sub_15700()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_15710()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_15720()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_15730()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_15740()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_15750()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_15760()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15770()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_15780()
{
  return String.hash(into:)();
}

NSArray sub_15790()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_157A0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber sub_157B0()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_157C0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber sub_157D0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_157E0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_157F0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_15800()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_15810()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_15820()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

Swift::Int sub_15830(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_15840()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_15850()
{
  return type metadata accessor for Optional();
}

uint64_t sub_15860()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_15870()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_15880()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_15890()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_158A0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_158B0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_158C0()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_158D0()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int sub_158E0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_158F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_15900()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_15910()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_15920()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_15930()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_15940()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  return _MKMapRectUnion(rect1, rect2);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__coreroutine_LocalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coreroutine_LocalizedStringForKey:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_boundingMapRect(void *a1, const char *a2, ...)
{
  return _[a1 boundingMapRect];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_circleWithCenterCoordinate_radius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circleWithCenterCoordinate:radius:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _[a1 confidence];
}

id objc_msgSend_convertRegion_toRectToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRegion:toRectToView:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
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

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_customLabel(void *a1, const char *a2, ...)
{
  return _[a1 customLabel];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return _[a1 entryDate];
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_exitDate(void *a1, const char *a2, ...)
{
  return _[a1 exitDate];
}

id objc_msgSend_fetchAllLocationsOfInterestForSettingsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllLocationsOfInterestForSettingsWithHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_horizontalUncertainty(void *a1, const char *a2, ...)
{
  return _[a1 horizontalUncertainty];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithLatitude_longitude_horizontalUncertainty_date_referenceFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:");
}

id objc_msgSend_initWithLocation_confidence_identifier_type_typeSource_visits_customLabel_mapItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLocationShiftRequiredForCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocationShiftRequiredForCoordinate:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_loadLocationsOfInterestWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLocationsOfInterestWithHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_mapItem(void *a1, const char *a2, ...)
{
  return _[a1 mapItem];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_polygon(void *a1, const char *a2, ...)
{
  return _[a1 polygon];
}

id objc_msgSend_processLocationsOfInterest_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLocationsOfInterest:handler:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return _[a1 referenceFrame];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_shiftCoordinate_accuracy_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftCoordinate:accuracy:handler:");
}

id objc_msgSend_shiftCoordinate_accuracy_shiftedCoordinate_shiftedAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:");
}

id objc_msgSend_shiftCoordinate_accuracy_withCompletionHandler_mustGoToNetworkCallback_errorHandler_callbackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:");
}

id objc_msgSend_shiftLocationOfInterestCoordinates_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftLocationOfInterestCoordinates:handler:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_stringFromDateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDateInterval:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeSource(void *a1, const char *a2, ...)
{
  return _[a1 typeSource];
}

id objc_msgSend_visits(void *a1, const char *a2, ...)
{
  return _[a1 visits];
}