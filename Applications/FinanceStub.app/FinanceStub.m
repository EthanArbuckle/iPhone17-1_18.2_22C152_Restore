uint64_t sub_100002178()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_1000021F8(v0, qword_100010F68);
  sub_10000225C(v0, (uint64_t)qword_100010F68);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_1000021F8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000225C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002294()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_1000021F8(v0, qword_100010F80);
  sub_10000225C(v0, (uint64_t)qword_100010F80);
  sub_100002C10(&qword_100010C78);
  v1 = (int *)(sub_100002C10(&qword_100010C80) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100009AF0;
  v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "server_state";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.standard(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)v10 = "client_state";
  *((void *)v10 + 1) = 12;
  v10[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10000244C()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_1000024E0()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        uint64_t v5 = v0[2];
        unint64_t v6 = v0[3];
        switch(v6 >> 62)
        {
          case 1uLL:
            if ((int)v5 != v5 >> 32) {
              goto LABEL_14;
            }
            goto LABEL_15;
          case 2uLL:
            if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
              goto LABEL_14;
            }
            goto LABEL_15;
          case 3uLL:
            goto LABEL_15;
          default:
            if ((v6 & 0xFF000000000000) == 0) {
              goto LABEL_15;
            }
LABEL_14:
            uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
            if (!v1)
            {
LABEL_15:
              type metadata accessor for CombinedState();
              uint64_t result = UnknownStorage.traverse<A>(visitor:)();
            }
            break;
        }
      }
      return result;
  }
}

uint64_t sub_100002654@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100009B00;
  a1[1] = xmmword_100009B00;
  return UnknownStorage.init()();
}

uint64_t sub_100002680()
{
  return 0x64656E69626D6F43;
}

uint64_t sub_1000026A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100002718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_100002788())()
{
  return nullsub_1;
}

uint64_t sub_1000027B0()
{
  return sub_10000244C();
}

uint64_t sub_1000027C8()
{
  return sub_1000024E0();
}

uint64_t sub_1000027E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034B8(&qword_100010C70, (void (*)(uint64_t))type metadata accessor for CombinedState);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100002864@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010C28 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for _NameMap();
  uint64_t v3 = sub_10000225C(v2, (uint64_t)qword_100010F80);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000290C(uint64_t a1)
{
  uint64_t v2 = sub_1000034B8(&qword_100010C58, (void (*)(uint64_t))type metadata accessor for CombinedState);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100002978()
{
  return Hasher._finalize()();
}

uint64_t sub_1000029D0()
{
  sub_1000034B8(&qword_100010C58, (void (*)(uint64_t))type metadata accessor for CombinedState);

  return Message.hash(into:)();
}

Swift::Int sub_100002A4C()
{
  return Hasher._finalize()();
}

uint64_t sub_100002AA4()
{
  return sub_1000034B8(&qword_100010C50, (void (*)(uint64_t))type metadata accessor for CombinedState);
}

uint64_t type metadata accessor for CombinedState()
{
  uint64_t result = qword_100010CE8;
  if (!qword_100010CE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100002B38()
{
  return sub_1000034B8(&qword_100010C58, (void (*)(uint64_t))type metadata accessor for CombinedState);
}

uint64_t sub_100002B80()
{
  return sub_1000034B8(&qword_100010C60, (void (*)(uint64_t))type metadata accessor for CombinedState);
}

uint64_t sub_100002BC8()
{
  return sub_1000034B8(&qword_100010C68, (void (*)(uint64_t))type metadata accessor for CombinedState);
}

uint64_t sub_100002C10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002C54@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_100003500(a2, a3);
      v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x100002EB8);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_100003558(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_100002EC8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_100002C54((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_100002FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  sub_100002C54(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100003058(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1000032C0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_100003500(a3, a4);
                  sub_100003500(a1, a2);
                  char v17 = sub_100002FA0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_100003558(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_100003500(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_100002FA0(v21, v22, v20, a3, a4);
                  sub_100003558(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_100003500(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_100003500(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_100002EC8(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_100003558(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1000032F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((sub_100003058(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) != 0
    && (sub_100003058(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 16), *(void *)(a2 + 24)) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for CombinedState();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 24), v4);
    v12(v8, a2 + *(int *)(v11 + 24), v4);
    sub_1000034B8(&qword_100010C88, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1000034B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003500(uint64_t a1, unint64_t a2)
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

uint64_t sub_100003558(uint64_t a1, unint64_t a2)
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

uint64_t *sub_1000035B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_100003500(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[2];
    unint64_t v10 = a2[3];
    sub_100003500(v9, v10);
    a1[2] = v9;
    a1[3] = v10;
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (char *)a1 + v11;
    char v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_1000036AC(uint64_t a1, uint64_t a2)
{
  sub_100003558(*(void *)a1, *(void *)(a1 + 8));
  sub_100003558(*(void *)(a1 + 16), *(void *)(a1 + 24));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t *sub_100003730(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100003500(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_100003500(v8, v9);
  a1[2] = v8;
  a1[3] = v9;
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t *sub_1000037DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100003500(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_100003558(v8, v9);
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  sub_100003500(v10, v11);
  uint64_t v12 = a1[2];
  unint64_t v13 = a1[3];
  a1[2] = v10;
  a1[3] = v11;
  sub_100003558(v12, v13);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

_OWORD *sub_100003898(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  unint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t *sub_100003914(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_100003558(v6, v7);
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_100003558(v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  unint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_1000039B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000039C8);
}

uint64_t sub_1000039C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100003A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100003A98);
}

void *sub_100003A98(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100003B48()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_100003BE0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1000055A0(a1))
  {
    return sub_100003EBC(a1, a2);
  }
  else
  {
    if (qword_100010C20 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_10000225C(v9, (uint64_t)qword_100010F68);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      sub_1000067A4((unint64_t *)&qword_100010E30, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v15 = sub_1000069C8(v13, v14, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "URL is not a BankConnect universal link: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    return 0;
  }
}

id sub_100003EBC(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  os_log_type_t v11 = (char *)&v39 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v14 = sub_100002C10(&qword_100010D58);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v19 = (uint8_t *)&v39 - v18;
  if ((unsigned __int16)sub_100005DB0(a1) == 1) {
    sub_1000047E0((uint64_t)v19);
  }
  else {
    sub_100004A94((uint64_t)v19);
  }
  sub_1000066DC((uint64_t)v19, (uint64_t)v17, &qword_100010D58);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v17, 1, v4) == 1)
  {
    sub_10000684C((uint64_t)v17, &qword_100010D58);
    if (qword_100010C20 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_10000225C(v20, (uint64_t)qword_100010F68);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      int v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)int v23 = 136315138;
      v42 = v23 + 4;
      sub_1000067A4((unint64_t *)&qword_100010E30, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v43 = sub_1000069C8(v24, v25, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to create authorization URL from universalLink: %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    sub_10000684C((uint64_t)v19, &qword_100010D58);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v13, v17, v4);
    if (qword_100010C20 != -1) {
      swift_once();
    }
    id v41 = a2;
    v42 = v19;
    uint64_t v26 = type metadata accessor for Logger();
    sub_10000225C(v26, (uint64_t)qword_100010F68);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v11, v13, v4);
    char v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v44 = v40;
      *(_DWORD *)char v29 = 136315138;
      sub_1000067A4((unint64_t *)&qword_100010E30, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v43 = sub_1000069C8(v30, v31, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v32 = *(void (**)(char *, uint64_t))(v5 + 8);
      v32(v11, v4);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Opening BankConnect authorization URL: %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v32 = *(void (**)(char *, uint64_t))(v5 + 8);
      v32(v11, v4);
    }

    URL._bridgeToObjectiveC()(v34);
    v36 = v35;
    sub_1000046A8((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v33 = [v41 openSensitiveURL:v36 withOptions:isa];

    v32(v13, v4);
    sub_10000684C((uint64_t)v42, &qword_100010D58);
  }
  return v33;
}

uint64_t sub_100004534(uint64_t a1)
{
  return sub_10000457C(a1, qword_100010D28);
}

uint64_t sub_100004558(uint64_t a1)
{
  return sub_10000457C(a1, qword_100010D40);
}

uint64_t sub_10000457C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002C10(&qword_100010D58);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  sub_1000021F8(v6, a2);
  uint64_t v7 = sub_10000225C(v6, (uint64_t)a2);
  URL.init(string:)();
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v7, v5, v6);
  }
  __break(1u);
  return result;
}

unint64_t sub_1000046A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002C10(&qword_100010D68);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1000066DC(v6, (uint64_t)&v15, &qword_100010D70);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000053A8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    os_log_type_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *os_log_type_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100006740(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_1000047E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v1 = type metadata accessor for CharacterSet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v24 - v7;
  __chkstk_darwin(v6);
  char v10 = (char *)&v24 - v9;
  if (qword_100010C38 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for URL();
  sub_10000225C(v11, (uint64_t)qword_100010D40);
  uint64_t v24 = URL.absoluteString.getter();
  uint64_t v13 = v12;
  static CharacterSet.alphanumerics.getter();
  CharacterSet.init(charactersIn:)();
  CharacterSet.union(_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v2 + 8);
  v14(v5, v1);
  v14(v8, v1);
  uint64_t v26 = URL.absoluteString.getter();
  uint64_t v27 = v15;
  sub_100006688();
  uint64_t v16 = StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  v14(v10, v1);
  if (v18)
  {
    uint64_t v26 = v24;
    uint64_t v27 = v13;
    v19._countAndFlagsBits = 38;
    v19._object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    v20._countAndFlagsBits = 0x7463657269646572;
    v20._object = (void *)0xEB000000004C5255;
    String.append(_:)(v20);
    v21._countAndFlagsBits = 61;
    v21._object = (void *)0xE100000000000000;
    String.append(_:)(v21);
    v22._countAndFlagsBits = v16;
    v22._object = v18;
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    URL.init(string:)();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v25, 1, 1, v11);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100004A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URLComponents();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002C10(&qword_100010D78);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010C30 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for URL();
  sub_10000225C(v9, (uint64_t)qword_100010D28);
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  char v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (!v10(v8, 1, v2))
  {
    sub_100002C10(&qword_100010D80);
    uint64_t v13 = a1;
    type metadata accessor for URLQueryItem();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100009CD0;
    URL.absoluteString.getter();
    URLQueryItem.init(name:value:)();
    swift_bridgeObjectRelease();
    a1 = v13;
    URLComponents.queryItems.setter();
  }
  if (v10(v8, 1, v2))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    URLComponents.url.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_10000684C((uint64_t)v8, &qword_100010D78);
}

uint64_t sub_100004D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URLQueryItem();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002C10((uint64_t *)&unk_100010D90);
  __chkstk_darwin(v8 - 8);
  char v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URLComponents();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    URLComponents.init()();
    swift_bridgeObjectRetain();
    URLComponents.query.setter();
    uint64_t v15 = URLComponents.queryItems.getter();
    a1 = v15;
    if (v15)
    {
      uint64_t v16 = *(void *)(v15 + 16);
      if (v16)
      {
        uint64_t v27 = v14;
        uint64_t v28 = v12;
        uint64_t v29 = v11;
        uint64_t v30 = v10;
        uint64_t v31 = v5;
        Swift::String v19 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
        uint64_t v17 = v5 + 16;
        uint64_t v18 = v19;
        unint64_t v20 = v15 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
        uint64_t v21 = *(void *)(v17 + 56);
        uint64_t v26 = v15;
        swift_bridgeObjectRetain();
        while (1)
        {
          v18(v7, v20, v4);
          if (URLQueryItem.name.getter() == 0x6574617473 && v22 == 0xE500000000000000) {
            break;
          }
          char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v23) {
            goto LABEL_14;
          }
          (*(void (**)(char *, uint64_t))(v17 - 8))(v7, v4);
          v20 += v21;
          if (!--v16)
          {
            swift_bridgeObjectRelease();
            uint64_t v24 = 1;
            char v10 = v30;
            uint64_t v5 = v31;
            goto LABEL_15;
          }
        }
        swift_bridgeObjectRelease();
LABEL_14:
        swift_bridgeObjectRelease();
        char v10 = v30;
        uint64_t v5 = v31;
        (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v30, v7, v4);
        uint64_t v24 = 0;
LABEL_15:
        uint64_t v12 = v28;
        uint64_t v11 = v29;
        uint64_t v14 = v27;
      }
      else
      {
        uint64_t v24 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v24, 1, v4);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        sub_10000684C((uint64_t)v10, (uint64_t *)&unk_100010D90);
        return 0;
      }
      else
      {
        a1 = URLQueryItem.value.getter();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
  return a1;
}

void *sub_100005184(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      uint64_t v3 = sub_1000052FC(v2, 0);
      if (v2 < 0) {
        break;
      }
      uint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    unint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000052FC(uint64_t a1, uint64_t a2)
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
  sub_100002C10((uint64_t *)&unk_100010E40);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_100005364(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_100005420(a1, v2);
}

unint64_t sub_1000053A8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000054BC(a1, a2, v4);
}

unint64_t sub_100005420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000054BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000055A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_allocWithZone((Class)NSURLComponents);
  URL._bridgeToObjectiveC()(v7);
  uint64_t v9 = v8;
  id v10 = [v6 initWithURL:v8 resolvingAgainstBaseURL:1];

  if (v10)
  {
    id v11 = [v10 scheme];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0;
    }
    id v22 = [v10 host];
    if (v22)
    {
      char v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v26 = v25;
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v26 = 0;
    }
    id v27 = [v10 path];
    if (v27)
    {
      uint64_t v28 = v27;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v30 = v29;

      if (v15)
      {
LABEL_14:
        if (v13 == 0x7370747468 && v15 == 0xE500000000000000) {
          char v31 = 1;
        }
        else {
          char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
        }
        swift_bridgeObjectRelease();
        if (v26)
        {
LABEL_22:
          if (v24 == 0x6562626131342E61 && v26 == 0xEF747365742E3565)
          {
            char v33 = 1;
          }
          else
          {
            char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
            if (v24 == 0xD000000000000018 && v26 == 0x8000000100009FA0)
            {
              char v32 = 1;
              goto LABEL_31;
            }
          }
          char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
          if (v24 == 0xD000000000000010 && v26 == 0x8000000100009F60)
          {
            swift_bridgeObjectRelease();
            goto LABEL_32;
          }
LABEL_31:
          char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v34 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_37;
          }
LABEL_32:
          if (v30)
          {
            v35._countAndFlagsBits = 0xD000000000000015;
            v35._object = (void *)0x8000000100009F80;
            LOBYTE(v26) = String.hasPrefix(_:)(v35);
            swift_bridgeObjectRelease();
            goto LABEL_38;
          }
LABEL_37:
          LOBYTE(v26) = 0;
          goto LABEL_38;
        }
LABEL_19:
        swift_bridgeObjectRelease();
        char v32 = 0;
        char v33 = 0;
LABEL_38:
        if (qword_100010C20 != -1) {
          swift_once();
        }
        uint64_t v37 = type metadata accessor for Logger();
        sub_10000225C(v37, (uint64_t)qword_100010F68);
        v38 = Logger.logObject.getter();
        os_log_type_t v39 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = 67109632;
          LODWORD(v43) = v31 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v40 + 8) = 1024;
          LODWORD(v43) = v33 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v40 + 14) = 1024;
          LODWORD(v43) = v26 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "Universal link validation: isValidScheme: %{BOOL}d, isValidUndisclosedUniversalLink: %{BOOL}d, isValidDefaultUniversalLink: %{BOOL}d.", (uint8_t *)v40, 0x14u);
          swift_slowDealloc();
        }

        char v36 = v31 & (v33 | v26 | v32);
        return v36 & 1;
      }
    }
    else
    {
      uint64_t v30 = 0;
      if (v15) {
        goto LABEL_14;
      }
    }
    char v31 = 0;
    if (v26) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  if (qword_100010C20 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_10000225C(v16, (uint64_t)qword_100010F68);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    Swift::String v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)Swift::String v19 = 136315138;
    sub_1000067A4((unint64_t *)&qword_100010E30, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v42 = sub_1000069C8(v20, v21, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to create URL components from universalLink:%s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  char v36 = 0;
  return v36 & 1;
}

uint64_t sub_100005C38(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_100005CFC(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_100005C38(__src, &__src[a2]);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  type metadata accessor for Data.RangeReference();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_100005DB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BinaryDecodingOptions();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for CombinedState();
  __chkstk_darwin(v3);
  v58 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v55 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v54 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v54 - v12;
  uint64_t v14 = URL.query.getter();
  v59 = (void (*)(char *, uint64_t))sub_100004D9C(v14, v15);
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v54 = v6;
  v56 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v57 = a1;
  v56(v13, a1, v5);
  if (v17)
  {
    os_log_type_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    v18(v13, v5);
    Swift::String v19 = v18;
  }
  else
  {
    uint64_t v20 = URL.fragment.getter();
    v59 = (void (*)(char *, uint64_t))sub_100004D9C(v20, v21);
    unint64_t v17 = v22;
    swift_bridgeObjectRelease();
    char v23 = v13;
    uint64_t v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    v24(v23, v5);
    if (!v17)
    {
      if (qword_100010C20 != -1) {
        swift_once();
      }
      uint64_t v44 = type metadata accessor for Logger();
      sub_10000225C(v44, (uint64_t)qword_100010F68);
      v56(v11, v57, v5);
      char v34 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        *(_DWORD *)v46 = 136315138;
        v59 = (void (*)(char *, uint64_t))(v46 + 4);
        *(void *)&v60[0] = v47;
        sub_1000067A4((unint64_t *)&qword_100010E30, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v62 = sub_1000069C8(v48, v49, (uint64_t *)v60);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v24(v11, v5);
        _os_log_impl((void *)&_mh_execute_header, v34, v45, "State parameter is missed in the redirect url %s.", v46, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v24(v11, v5);
      }
      goto LABEL_13;
    }
    Swift::String v19 = v24;
  }
  Swift::String v25 = String.uppercased()();
  uint64_t v26 = sub_100005184(v25._countAndFlagsBits, (unint64_t)v25._object);
  swift_bridgeObjectRelease();
  id v27 = sub_1000088B4((uint64_t)v26);
  swift_release();
  uint64_t v28 = (uint64_t)v58;
  if (!v27)
  {
    sub_100006750();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();
    char v32 = v55;
    if (qword_100010C20 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_10000225C(v33, (uint64_t)qword_100010F68);
    v56(v32, v57, v5);
    char v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      v59 = v19;
      uint64_t v37 = v32;
      v38 = (uint8_t *)v36;
      *(void *)&v60[0] = swift_slowAlloc();
      *(_DWORD *)v38 = 136315138;
      sub_1000067A4((unint64_t *)&qword_100010E30, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v39 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v62 = sub_1000069C8(v39, v40, (uint64_t *)v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v59(v37, v5);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Failed to decode client state on redirect to %s.", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v19(v32, v5);
    }
    swift_errorRelease();
LABEL_13:

    return 0;
  }
  uint64_t v29 = sub_100005CFC(v27 + 32, *((void *)v27 + 2));
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  uint64_t v61 = 0;
  memset(v60, 0, sizeof(v60));
  sub_100003500(v29, v31);
  BinaryDecodingOptions.init()();
  sub_1000067A4(&qword_100010C58, (void (*)(uint64_t))type metadata accessor for CombinedState);
  Message.init(serializedData:extensions:partial:options:)();
  sub_100003500(*(void *)(v28 + 16), *(void *)(v28 + 24));
  uint64_t v43 = BankConnectAuthorizationSession.AuthSource.init(with:)();
  if ((v43 & 0x10000) == 0)
  {
    uint64_t v41 = v43;
    sub_1000067EC(v28);
    sub_100003558(v29, v31);
    swift_bridgeObjectRelease();
    return v41;
  }
  if (qword_100010C20 != -1) {
    swift_once();
  }
  uint64_t v50 = type metadata accessor for Logger();
  sub_10000225C(v50, (uint64_t)qword_100010F68);
  swift_bridgeObjectRetain();
  v51 = Logger.logObject.getter();
  os_log_type_t v52 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    *(void *)&v60[0] = swift_slowAlloc();
    *(_DWORD *)v53 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_1000069C8((uint64_t)v59, v17, (uint64_t *)v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed to decode AuthSource from state %s.", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_100003558(v29, v31);
  sub_1000067EC(v28);
  return 0;
}

unint64_t sub_100006688()
{
  unint64_t result = qword_100010D60;
  if (!qword_100010D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010D60);
  }
  return result;
}

uint64_t sub_1000066DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002C10(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006740(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100006750()
{
  unint64_t result = qword_100010D88;
  if (!qword_100010D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010D88);
  }
  return result;
}

uint64_t sub_1000067A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000067EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CombinedState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000684C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002C10(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_100006970()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t sub_1000069C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006A9C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007DF4((uint64_t)v12, *a3);
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
      sub_100007DF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007DA4((uint64_t)v12);
  return v7;
}

uint64_t sub_100006A9C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006C58(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100006C58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005184(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006CF0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006CF0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_100006CF0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    sub_100002C10((uint64_t *)&unk_100010E40);
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
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100006E40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  unint64_t v3 = *(char **)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int64_t v8 = (char *)&v32 - v7;
  if (qword_100010C20 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = sub_10000225C(v9, (uint64_t)qword_100010F68);
  os_log_type_t v35 = (void (*)(char *, uint64_t, uint64_t))*((void *)v3 + 2);
  uint64_t v36 = v3 + 16;
  v35(v8, a1, v2);
  uint64_t v37 = (void *)v10;
  size_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    char v34 = v6;
    id v39 = v14;
    uint64_t v33 = a1;
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_100007D4C();
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v38 = sub_1000069C8(v15, v16, (uint64_t *)&v39);
    a1 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v17 = (void (*)(char *, uint64_t))*((void *)v3 + 1);
    v17(v8, v2);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Cannot handle universal link to URL: %s", v13, 0xCu);
    swift_arrayDestroy();
    unint64_t v6 = v34;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    unint64_t v17 = (void (*)(char *, uint64_t))*((void *)v3 + 1);
    v17(v8, v2);
  }

  id v18 = [self defaultWorkspace];
  if (!v18) {
    __break(1u);
  }
  uint64_t v20 = v18;
  URL._bridgeToObjectiveC()(v19);
  unint64_t v22 = v21;
  id v39 = 0;
  id v23 = [v20 openURL:v21 configuration:0 error:&v39];

  if (v23)
  {
    id v24 = v39;
  }
  else
  {
    char v34 = v3;
    id v25 = v39;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v35(v6, a1, v2);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      id v39 = v37;
      *(_DWORD *)uint64_t v28 = 136315394;
      sub_100007D4C();
      uint64_t v29 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v38 = sub_1000069C8(v29, v30, (uint64_t *)&v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v17(v6, v2);
      *(_WORD *)(v28 + 12) = 2112;
      swift_errorRetain();
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v38 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v36 = v31;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to re-direct URL: %s to Safari with error: %@", (uint8_t *)v28, 0x16u);
      sub_100002C10(&qword_100010E38);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      v17(v6, v2);
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_1000073D4(void *a1)
{
  uint64_t v2 = sub_100002C10(&qword_100010D58);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  int64_t v8 = (char *)&v63 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v63 - v9;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  uint64_t v66 = v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  id v18 = (char *)&v63 - v17;
  __chkstk_darwin(v16);
  v64 = (char *)&v63 - v19;
  uint64_t v20 = type metadata accessor for DeviceType();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v23 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DeviceInfo.deviceType.getter();
  char v24 = DeviceType.isiPhone.getter();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  if ((v24 & 1) == 0) {
    return 0;
  }
  id v25 = [a1 activityType];
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;

  if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v30 = v65;
  }
  else
  {
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = v65;
    if ((v31 & 1) == 0)
    {
LABEL_14:
      if (qword_100010C20 != -1) {
        swift_once();
      }
      uint64_t v44 = type metadata accessor for Logger();
      sub_10000225C(v44, (uint64_t)qword_100010F68);
      id v45 = a1;
      v46 = Logger.logObject.getter();
      os_log_type_t v47 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        uint64_t v68 = v49;
        *(_DWORD *)uint64_t v48 = 136315394;
        id v50 = [v45 webpageURL];
        uint64_t v65 = v49;
        if (v50)
        {
          v51 = v50;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v52 = 0;
        }
        else
        {
          uint64_t v52 = 1;
        }
        uint64_t v53 = v66;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v5, v52, 1, v30);
        sub_100007C84((uint64_t)v5, (uint64_t)v8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v8, 1, v30))
        {
          sub_100007CEC((uint64_t)v8);
          uint64_t v54 = 0;
          unint64_t v55 = 0xE000000000000000;
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v18, v8, v30);
          sub_100007CEC((uint64_t)v8);
          uint64_t v54 = URL.absoluteString.getter();
          unint64_t v55 = v56;
          (*(void (**)(char *, uint64_t))(v53 + 8))(v18, v30);
        }
        uint64_t v67 = sub_1000069C8(v54, v55, &v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 12) = 2080;
        id v57 = [v45 activityType];
        uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v60 = v59;

        uint64_t v67 = sub_1000069C8(v58, v60, &v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "The activity didn't continue from a universal link: %s activityType: %s", (uint8_t *)v48, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return 0;
    }
  }
  id v32 = [a1 webpageURL];
  if (!v32)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v10, 1, 1, v30);
    goto LABEL_13;
  }
  uint64_t v33 = v32;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v34 = v66;
  os_log_type_t v35 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
  v35(v10, v18, v30);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v10, 0, 1, v30);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v10, 1, v30) == 1)
  {
LABEL_13:
    sub_100007CEC((uint64_t)v10);
    goto LABEL_14;
  }
  uint64_t v36 = (uint64_t)v64;
  v35(v64, v10, v30);
  if (qword_100010C20 != -1) {
    swift_once();
  }
  uint64_t v37 = type metadata accessor for Logger();
  sub_10000225C(v37, (uint64_t)qword_100010F68);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v15, v36, v30);
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v38, v39))
  {
    unint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    *(_DWORD *)unint64_t v40 = 136315138;
    uint64_t v30 = v65;
    sub_100007D4C();
    uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v67 = sub_1000069C8(v41, v42, &v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v43 = *(void (**)(char *, uint64_t))(v34 + 8);
    v43(v15, v30);
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Handling universal link: %s", v40, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v36 = (uint64_t)v64;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v43 = *(void (**)(char *, uint64_t))(v34 + 8);
    v43(v15, v30);
  }

  uint64_t result = (uint64_t)[self defaultWorkspace];
  if (result)
  {
    uint64_t v62 = (void *)result;
    if (sub_100003BE0(v36, (void *)result))
    {
      v43((char *)v36, v30);

      return 1;
    }
    sub_100006E40(v36);

    v43((char *)v36, v30);
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002C10(&qword_100010D58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007CEC(uint64_t a1)
{
  uint64_t v2 = sub_100002C10(&qword_100010D58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100007D4C()
{
  unint64_t result = qword_100010E30;
  if (!qword_100010E30)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010E30);
  }
  return result;
}

uint64_t sub_100007DA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100007E50()
{
  off_100010EB0 = &off_10000C798;
}

uint64_t sub_100007E64()
{
  if (qword_100010C40 != -1) {
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v0 = (unsigned int *)off_100010EB0;
    uint64_t v1 = *((void *)off_100010EB0 + 2);
    if (!v1) {
      break;
    }
    uint64_t v2 = *((unsigned int *)off_100010EB0 + 8);
    swift_bridgeObjectRetain_n();
    uint64_t v3 = 0;
    while (1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v6 = sub_100005364(v2);
      uint64_t v7 = _swiftEmptyDictionarySingleton[2];
      BOOL v8 = (v5 & 1) == 0;
      uint64_t v9 = v7 + v8;
      if (__OFADD__(v7, v8)) {
        break;
      }
      char v10 = v5;
      if (_swiftEmptyDictionarySingleton[3] >= v9)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if ((v5 & 1) == 0) {
            goto LABEL_13;
          }
        }
        else
        {
          sub_1000084F8();
          if ((v10 & 1) == 0) {
            goto LABEL_13;
          }
        }
      }
      else
      {
        sub_100008260(v9, isUniquelyReferenced_nonNull_native);
        unint64_t v11 = sub_100005364(v2);
        if ((v10 & 1) != (v12 & 1))
        {
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          return result;
        }
        unint64_t v6 = v11;
        if ((v10 & 1) == 0)
        {
LABEL_13:
          _swiftEmptyDictionarySingleton[(v6 >> 6) + 8] |= 1 << v6;
          *(void *)(_swiftEmptyDictionarySingleton[6] + 8 * v6) = v2;
          *(unsigned char *)(_swiftEmptyDictionarySingleton[7] + v6) = v3;
          uint64_t v13 = _swiftEmptyDictionarySingleton[2];
          BOOL v14 = __OFADD__(v13, 1);
          uint64_t v15 = v13 + 1;
          if (v14) {
            goto LABEL_24;
          }
          _swiftEmptyDictionarySingleton[2] = v15;
          goto LABEL_15;
        }
      }
      *(unsigned char *)(_swiftEmptyDictionarySingleton[7] + v6) = v3;
LABEL_15:
      swift_bridgeObjectRelease();
      if (v1 - 1 == v3) {
        goto LABEL_18;
      }
      uint64_t v2 = v0[v3++ + 9];
      if (v3 == 256)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
LABEL_18:
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_once();
  }
  swift_bridgeObjectRetain();
LABEL_20:
  off_100010EB8 = _swiftEmptyDictionarySingleton;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000080A0()
{
  return 1;
}

Swift::Int sub_1000080A8()
{
  return Hasher._finalize()();
}

void sub_1000080EC()
{
}

Swift::Int sub_100008114()
{
  return Hasher._finalize()();
}

char *sub_100008164(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100002C10((uint64_t *)&unk_100010E40);
      char v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      char v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      char v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1000087CC(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008260(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100002C10(&qword_100010EC0);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    char v31 = v3;
    int64_t v8 = 0;
    int64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1)) {
          goto LABEL_38;
        }
        if (v8 >= v13)
        {
LABEL_29:
          if ((v32 & 1) == 0)
          {
            uint64_t result = swift_release();
            uint64_t v3 = v31;
            goto LABEL_36;
          }
          uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
          if (v30 >= 64) {
            bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            *int64_t v9 = -1 << v30;
          }
          uint64_t v3 = v31;
          *(void *)(v5 + 16) = 0;
          break;
        }
        unint64_t v19 = v9[v8];
        if (!v19)
        {
          int64_t v20 = v8 + 1;
          if (v8 + 1 >= v13) {
            goto LABEL_29;
          }
          unint64_t v19 = v9[v20];
          if (!v19)
          {
            while (1)
            {
              int64_t v8 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                break;
              }
              if (v8 >= v13) {
                goto LABEL_29;
              }
              unint64_t v19 = v9[v8];
              ++v20;
              if (v19) {
                goto LABEL_19;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_19:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      char v22 = *(unsigned char *)(*(void *)(v5 + 56) + v17);
      uint64_t result = static Hasher._hash(seed:_:)();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      *(unsigned char *)(*(void *)(v7 + 56) + v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_36:
  *uint64_t v3 = v7;
  return result;
}

void *sub_1000084F8()
{
  uint64_t v1 = v0;
  sub_100002C10(&qword_100010EC0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    if (!v18) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_100008670(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return &_swiftEmptyArrayStorage;
    }
    if (v5 <= 0)
    {
      int64_t v8 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        uint64_t v10 = v8 + 4;
        if (a2 + a3 < (unint64_t)v8 + v5 + 32 && (unint64_t)v10 < a2 + a3 + v5) {
          goto LABEL_17;
        }
        memcpy(v10, (const void *)(a2 + a3), v5);
        return v8;
      }
    }
    else
    {
      sub_100002C10((uint64_t *)&unk_100010E40);
      int64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000087CC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    int64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000088B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v2 = 0;
  uint64_t v50 = a1 + 32;
  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v51 = *(void *)(a1 + 16);
LABEL_4:
  uint64_t v4 = v2 + 8;
  if (__OFADD__(v2, 8))
  {
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    JUMPOUT(0x100008ECCLL);
  }
  if (v1 >= v4) {
    uint64_t v5 = v2 + 8;
  }
  else {
    uint64_t v5 = v1;
  }
  if (v5 < v2) {
    goto LABEL_70;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v6 = (void *)swift_dynamicCastClass();
  if (!v6)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = &_swiftEmptyArrayStorage;
  }
  uint64_t v7 = v6[2];
  swift_release();
  if (v7 == v5 - v2)
  {
    int64_t v8 = (void *)swift_dynamicCastClass();
    if (!v8)
    {
      swift_bridgeObjectRelease();
      int64_t v8 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    int64_t v8 = sub_100008670(a1, v50, v2, (2 * v5) | 1);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = v8[2];
  if (v9)
  {
    uint64_t v10 = qword_100010C48;
    swift_retain();
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v11 = 0;
    unint64_t v12 = off_100010EB8;
    int64_t v13 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if (v12[2])
      {
        unint64_t v14 = sub_100005364(*((unsigned __int8 *)v8 + v11 + 32));
        if (v15)
        {
          char v16 = *(unsigned char *)(v12[7] + v14);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v13 = sub_100008164(0, *((void *)v13 + 2) + 1, 1, v13);
          }
          unint64_t v18 = *((void *)v13 + 2);
          unint64_t v17 = *((void *)v13 + 3);
          if (v18 >= v17 >> 1) {
            int64_t v13 = sub_100008164((char *)(v17 > 1), v18 + 1, 1, v13);
          }
          *((void *)v13 + 2) = v18 + 1;
          v13[v18 + 32] = v16;
        }
      }
      ++v11;
    }
    while (v9 != v11);
    swift_release_n();
  }
  else
  {
    swift_release();
    int64_t v13 = (char *)&_swiftEmptyArrayStorage;
  }
  int64_t v19 = (char *)&_swiftEmptyArrayStorage;
  switch(*((void *)v13 + 2))
  {
    case 2:
      goto LABEL_53;
    case 4:
      goto LABEL_47;
    case 5:
      goto LABEL_40;
    case 7:
      goto LABEL_34;
    case 8:
      char v20 = v13[38];
      char v21 = v13[39];
      int64_t v19 = sub_100008164(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      unint64_t v23 = *((void *)v19 + 2);
      unint64_t v22 = *((void *)v19 + 3);
      if (v23 >= v22 >> 1) {
        int64_t v19 = sub_100008164((char *)(v22 > 1), v23 + 1, 1, v19);
      }
      *((void *)v19 + 2) = v23 + 1;
      v19[v23 + 32] = v21 | (32 * v20);
      unint64_t v24 = *((void *)v13 + 2);
      if (v24 < 5) {
        goto LABEL_78;
      }
      if (v24 == 5) {
        goto LABEL_79;
      }
      if (v24 < 7) {
        goto LABEL_80;
      }
LABEL_34:
      char v25 = v13[36];
      char v26 = v13[37];
      unsigned int v27 = v13[38];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v19 = sub_100008164(0, *((void *)v19 + 2) + 1, 1, v19);
      }
      unint64_t v29 = *((void *)v19 + 2);
      unint64_t v28 = *((void *)v19 + 3);
      if (v29 >= v28 >> 1) {
        int64_t v19 = sub_100008164((char *)(v28 > 1), v29 + 1, 1, v19);
      }
      *((void *)v19 + 2) = v29 + 1;
      v19[v29 + 32] = (4 * v26) | (v25 << 7) | (v27 >> 3);
      unint64_t v30 = *((void *)v13 + 2);
      if (v30 < 4) {
        goto LABEL_76;
      }
      if (v30 == 4) {
        goto LABEL_77;
      }
LABEL_40:
      char v31 = v13[35];
      unsigned int v32 = v13[36];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v19 = sub_100008164(0, *((void *)v19 + 2) + 1, 1, v19);
      }
      unint64_t v34 = *((void *)v19 + 2);
      unint64_t v33 = *((void *)v19 + 3);
      if (v34 >= v33 >> 1) {
        int64_t v19 = sub_100008164((char *)(v33 > 1), v34 + 1, 1, v19);
      }
      *((void *)v19 + 2) = v34 + 1;
      v19[v34 + 32] = (v32 >> 1) | (16 * v31);
      unint64_t v35 = *((void *)v13 + 2);
      if (v35 < 2) {
        goto LABEL_73;
      }
      if (v35 == 2) {
        goto LABEL_74;
      }
      if (v35 < 4) {
        goto LABEL_75;
      }
LABEL_47:
      char v36 = v13[33];
      char v37 = v13[34];
      unsigned int v38 = v13[35];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v19 = sub_100008164(0, *((void *)v19 + 2) + 1, 1, v19);
      }
      unint64_t v40 = *((void *)v19 + 2);
      unint64_t v39 = *((void *)v19 + 3);
      if (v40 >= v39 >> 1) {
        int64_t v19 = sub_100008164((char *)(v39 > 1), v40 + 1, 1, v19);
      }
      *((void *)v19 + 2) = v40 + 1;
      v19[v40 + 32] = (2 * v37) | (v36 << 6) | (v38 >> 4);
      uint64_t v41 = *((void *)v13 + 2);
      if (v41 == 1) {
        goto LABEL_71;
      }
      if (!v41) {
        goto LABEL_72;
      }
LABEL_53:
      char v42 = v13[32];
      unsigned int v43 = v13[33];
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        int64_t v19 = sub_100008164(0, *((void *)v19 + 2) + 1, 1, v19);
      }
      unint64_t v45 = *((void *)v19 + 2);
      unint64_t v44 = *((void *)v19 + 3);
      if (v45 >= v44 >> 1) {
        int64_t v19 = sub_100008164((char *)(v44 > 1), v45 + 1, 1, v19);
      }
      *((void *)v19 + 2) = v45 + 1;
      v19[v45 + 32] = (v43 >> 2) | (8 * v42);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_100008164(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      break;
    default:
      goto LABEL_68;
  }
  while (v45 < *((void *)v19 + 2))
  {
    char v46 = v19[v45 + 32];
    unint64_t v48 = *((void *)v3 + 2);
    unint64_t v47 = *((void *)v3 + 3);
    if (v48 >= v47 >> 1) {
      uint64_t v3 = sub_100008164((char *)(v47 > 1), v48 + 1, 1, v3);
    }
    --v45;
    *((void *)v3 + 2) = v48 + 1;
    v3[v48 + 32] = v46;
    if (v45 == -1)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v4;
      uint64_t v1 = v51;
      if (v4 >= v51) {
        return v3;
      }
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_68:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t _s5ErrorOwet(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s5ErrorOwst(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100008FDCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100009004()
{
  return 0;
}

ValueMetadata *_s5ErrorOMa()
{
  return &_s5ErrorON;
}

unint64_t sub_100009020()
{
  unint64_t result = qword_100010EC8;
  if (!qword_100010EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010EC8);
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  int v3 = static CommandLine.argc.getter();
  unsigned int v4 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for AppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v6 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v3, v4, 0, v6);

  return 0;
}

uint64_t sub_1000090FC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static DeviceInfo.deviceType.getter()
{
  return static DeviceInfo.deviceType.getter();
}

uint64_t DeviceType.isiPhone.getter()
{
  return DeviceType.isiPhone.getter();
}

uint64_t type metadata accessor for DeviceType()
{
  return type metadata accessor for DeviceType();
}

uint64_t BankConnectAuthorizationSession.AuthSource.init(with:)()
{
  return BankConnectAuthorizationSession.AuthSource.init(with:)();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t static CharacterSet.alphanumerics.getter()
{
  return static CharacterSet.alphanumerics.getter();
}

uint64_t CharacterSet.union(_:)()
{
  return CharacterSet.union(_:)();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.query.setter()
{
  return URLComponents.query.setter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.query.getter()
{
  return URL.query.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.fragment.getter()
{
  return URL.fragment.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

uint64_t UnknownStorage.init()()
{
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t BinaryDecodingOptions.init()()
{
  return BinaryDecodingOptions.init()();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return _MessageImplementationBase._protobuf_generated_isEqualTo(other:)();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t Message.isInitialized.getter()
{
  return Message.isInitialized.getter();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t Message.hash(into:)()
{
  return Message.hash(into:)();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return type metadata accessor for _NameMap.NameDescription();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t type metadata accessor for _NameMap()
{
  return type metadata accessor for _NameMap();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}