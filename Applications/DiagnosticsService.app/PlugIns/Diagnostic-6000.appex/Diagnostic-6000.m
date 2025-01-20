uint64_t sub_100001610(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  long long v20;
  long long v21;

  if (!result)
  {
    __break(1u);
    return result;
  }
  v2 = v1;
  v3 = result;
  if (!*(void *)(result + 16))
  {
    v20 = 0u;
    v21 = 0u;
    goto LABEL_12;
  }
  v5 = *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerTextKey);
  v4 = *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerTextKey + 8);
  swift_bridgeObjectRetain();
  v6 = sub_100002578(v5, v4);
  if ((v7 & 1) == 0) {
    goto LABEL_10;
  }
  sub_100001BDC(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_12:
    sub_100001B38((uint64_t)&v20);
    return 0;
  }
  if (swift_dynamicCast())
  {
    if (*(void *)(v3 + 16))
    {
      v9 = *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageTextKey);
      v8 = *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageTextKey + 8);
      swift_bridgeObjectRetain();
      v10 = sub_100002578(v9, v8);
      if (v11)
      {
        sub_100001BDC(*(void *)(v3 + 56) + 32 * v10, (uint64_t)&v20);
      }
      else
      {
        v20 = 0u;
        v21 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v21 + 1))
      {
        if ((swift_dynamicCast() & 1) == 0)
        {
LABEL_29:
          swift_bridgeObjectRelease();
          return 0;
        }
        if (*(void *)(v3 + 16))
        {
          v13 = *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey);
          v12 = *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey + 8);
          swift_bridgeObjectRetain();
          v14 = sub_100002578(v13, v12);
          if (v15)
          {
            sub_100001BDC(*(void *)(v3 + 56) + 32 * v14, (uint64_t)&v20);
          }
          else
          {
            v20 = 0u;
            v21 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v21 + 1))
          {
            sub_100001B98((uint64_t *)&unk_1000089C0);
            if (swift_dynamicCast())
            {
              if (*(void *)(v18 + 16))
              {
                v16 = (void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerText);
                *v16 = v18;
                v16[1] = v19;
                swift_bridgeObjectRelease();
                v17 = (void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageText);
                *v17 = v18;
                v17[1] = v19;
                swift_bridgeObjectRelease();
                *(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonStrings) = v18;
                swift_bridgeObjectRelease();
                return 1;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            goto LABEL_29;
          }
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
        }
        swift_bridgeObjectRelease();
      }
      goto LABEL_11;
    }
LABEL_10:
    v20 = 0u;
    v21 = 0u;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  return 0;
}

id sub_100001944()
{
  v1 = &v0[OBJC_IVAR___UserAlertPresenterInputs_headerTextKey];
  *(void *)v1 = 0x6554726564616568;
  *((void *)v1 + 1) = 0xEA00000000007478;
  v2 = &v0[OBJC_IVAR___UserAlertPresenterInputs_messageTextKey];
  *(void *)v2 = 0x546567617373656DLL;
  *((void *)v2 + 1) = 0xEB00000000747865;
  v3 = &v0[OBJC_IVAR___UserAlertPresenterInputs_buttonsTextKey];
  *(void *)v3 = 0x736E6F74747562;
  *((void *)v3 + 1) = 0xE700000000000000;
  v4 = &v0[OBJC_IVAR___UserAlertPresenterInputs_headerText];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v5 = &v0[OBJC_IVAR___UserAlertPresenterInputs_messageText];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v0[OBJC_IVAR___UserAlertPresenterInputs_buttonStrings] = 0;
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserAlertPresenterInputs();
  return [super init];
}

id sub_100001A40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserAlertPresenterInputs();
  return [super dealloc];
}

uint64_t type metadata accessor for UserAlertPresenterInputs()
{
  return self;
}

uint64_t sub_100001B38(uint64_t a1)
{
  uint64_t v2 = sub_100001B98(&qword_100008A10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100001B98(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100001BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100001C38()
{
  id result = (id)DiagnosticLogHandleForCategory();
  qword_100008A20 = (uint64_t)result;
  return result;
}

id sub_100001C64(uint64_t a1, void *a2)
{
  if (a1)
  {
    type metadata accessor for UserAlertPresenterInputs();
    uint64_t v4 = swift_dynamicCastClass();
    if (v4) {
      swift_unknownObjectRetain();
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = *(void **)&v2[OBJC_IVAR___UserAlertPresenterController_inputs];
  *(void *)&v2[OBJC_IVAR___UserAlertPresenterController_inputs] = v4;

  if ([a2 respondsToSelector:"displayAlertWithHeader:message:buttonStrings:completion:"])
  {
    *(void *)&v2[OBJC_IVAR___UserAlertPresenterController_responder] = a2;
    swift_unknownObjectRetain();
    return (id)swift_unknownObjectRelease();
  }
  else
  {
    sub_1000032F0();
    if (qword_100008830 != -1) {
      swift_once();
    }
    sub_100003280();
    id v7 = [v2 result];
    Class isa = sub_1000032E0().super.super.isa;
    [v7 setStatusCode:isa];

    return [v2 setFinished:1];
  }
}

void sub_100001DF8(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

void sub_100001F0C()
{
  v1 = *(void **)&v0[OBJC_IVAR___UserAlertPresenterController_responder];
  if (!v1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (([*(id *)&v0[OBJC_IVAR___UserAlertPresenterController_responder] respondsToSelector:"displayAlertWithHeader:message:buttonStrings:completion:"] & 1) == 0)return; {
  uint64_t v2 = *(void *)&v0[OBJC_IVAR___UserAlertPresenterController_inputs];
  }
  if (!v2) {
    goto LABEL_10;
  }
  if (!*(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_headerText + 8))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!*(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_messageText + 8))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!*(void *)(v2 + OBJC_IVAR___UserAlertPresenterInputs_buttonStrings))
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = v0;
  NSString v5 = sub_1000032B0();
  NSString v6 = sub_1000032B0();
  Class isa = sub_1000032D0().super.isa;
  v9[4] = sub_100002518;
  v9[5] = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100001DF8;
  v9[3] = &unk_100004300;
  v8 = _Block_copy(v9);
  swift_retain();
  [v1 displayAlertWithHeader:v5 message:v6 buttonStrings:isa completion:v8];
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

id sub_100002130(void *a1, uint64_t a2, id a3)
{
  id v6 = [a3 result];
  if (a2)
  {
    Class isa = sub_1000032E0().super.super.isa;
    [v6 setStatusCode:isa];

    return [a3 setFinished:1];
  }
  else
  {
    *((void *)&v18 + 1) = 0x8000000100003C00;
    sub_100003330();
    unint64_t v19 = sub_100002538();
    *(void *)&long long v18 = a1;
    id v9 = a1;
    id v10 = [v6 data];
    uint64_t v11 = sub_1000032A0();

    uint64_t v17 = v11;
    if (v19)
    {
      sub_100002930(&v18, v16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_100002E24(v16, (uint64_t)v20, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_1000028DC((uint64_t)v20);
    }
    else
    {
      sub_100001B38((uint64_t)&v18);
      sub_1000027E0((uint64_t)v20, v16);
      sub_1000028DC((uint64_t)v20);
      sub_100001B38((uint64_t)v16);
    }
    Class v13 = sub_100003290().super.isa;
    swift_bridgeObjectRelease();
    [v6 setData:v13];

    id v14 = [a3 result];
    Class v15 = sub_1000032E0().super.super.isa;
    [v14 setStatusCode:v15];

    return [a3 setFinished:1];
  }
}

id sub_10000243C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserAlertPresenterController();
  return [super dealloc];
}

uint64_t type metadata accessor for UserAlertPresenterController()
{
  return self;
}

uint64_t sub_1000024E0()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100002518(void *a1, uint64_t a2)
{
  return sub_100002130(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_100002520(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100002530()
{
  return swift_release();
}

unint64_t sub_100002538()
{
  unint64_t result = qword_100008A08;
  if (!qword_100008A08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008A08);
  }
  return result;
}

unint64_t sub_100002578(uint64_t a1, uint64_t a2)
{
  sub_100003380();
  sub_1000032C0();
  Swift::Int v4 = sub_100003390();

  return sub_100002634(a1, a2, v4);
}

unint64_t sub_1000025F0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100003310(*(void *)(v2 + 40));

  return sub_100002718(a1, v4);
}

unint64_t sub_100002634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100003360() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        Class v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100003360() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100002718(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000031D4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100003320();
      sub_1000028DC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_1000027E0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1000025F0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100002FEC();
      uint64_t v9 = v11;
    }
    sub_1000028DC(*(void *)(v9 + 48) + 40 * v6);
    sub_100002930((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_100002C58(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1000028DC(uint64_t a1)
{
  return a1;
}

_OWORD *sub_100002930(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100002940(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100001B98(&qword_100008A18);
  uint64_t v6 = sub_100003350();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_100002930((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1000031D4(v25, (uint64_t)&v38);
      sub_100001BDC(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_100003310(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_100002930(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_100002C58(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100003300();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1000031D4(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = sub_100003310(*(void *)(a2 + 40));
        uint64_t result = sub_1000028DC((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  uint64_t *v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100002E24(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1000025F0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100002FEC();
      goto LABEL_7;
    }
    sub_100002940(v13, a3 & 1);
    unint64_t v19 = sub_1000025F0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_1000031D4(a2, (uint64_t)v21);
      return sub_100002F70(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_100003370();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_100003230((uint64_t)v17);

  return sub_100002930(a1, v17);
}

_OWORD *sub_100002F70(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_100002930(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_100002FEC()
{
  uint64_t v1 = v0;
  sub_100001B98(&qword_100008A18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100003340();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_1000031D4(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_100001BDC(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_100002930(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000031D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100003230(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003280()
{
  return os_log(_:dso:log:_:_:)();
}

NSDictionary sub_100003290()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000032A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000032B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000032C0()
{
  return String.hash(into:)();
}

NSArray sub_1000032D0()
{
  return Array._bridgeToObjectiveC()();
}

NSNumber sub_1000032E0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1000032F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100003300()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100003310(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100003320()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100003330()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100003340()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100003350()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100003360()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100003370()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100003380()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003390()
{
  return Hasher._finalize()();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
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

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}