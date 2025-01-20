uint64_t sub_100004F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  BOOL v17;

  if (*(void *)(a3 + 16))
  {
    sub_100010F88();
    sub_100010D78();
    v6 = sub_100010F98();
    v7 = -1 << *(unsigned char *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      v10 = *(void *)(a3 + 48);
      v11 = (void *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100010F58() & 1) != 0) {
        return 1;
      }
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          v16 = (void *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100010F58() & 1) != 0) {
            break;
          }
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_100005168(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    sub_100007CF4(0, (unint64_t *)&unk_1000192A0);
    Class isa = sub_100010DA8().super.isa;
  }
  if (a2) {
    uint64_t v6 = sub_100010AA8();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

id sub_1000052F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GradientUpdatingDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GradientUpdatingDelegate()
{
  return self;
}

void type metadata accessor for Identifier(uint64_t a1)
{
}

uint64_t sub_100005360(uint64_t a1, uint64_t a2)
{
  return sub_1000057D8(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

BOOL sub_100005384(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005398(uint64_t a1, id *a2)
{
  uint64_t result = sub_100010D48();
  *a2 = 0;
  return result;
}

uint64_t sub_100005410(uint64_t a1, id *a2)
{
  char v3 = sub_100010D58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100005490@<X0>(void *a1@<X8>)
{
  sub_100010D68();
  NSString v2 = sub_100010D38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_1000054D4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000054E4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000054F4(uint64_t a1)
{
  uint64_t v2 = sub_100005770(&qword_100019318, type metadata accessor for PRTimeFontIdentifier);
  uint64_t v3 = sub_100005770((unint64_t *)&unk_100019320, type metadata accessor for PRTimeFontIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000055B0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100010D38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000055F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010D68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005624(uint64_t a1)
{
  uint64_t v2 = sub_100005770(&qword_100019290, type metadata accessor for Identifier);
  uint64_t v3 = sub_100005770(&qword_100019298, type metadata accessor for Identifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000056E0()
{
  return sub_100005770(&qword_100019278, type metadata accessor for Identifier);
}

uint64_t sub_100005728()
{
  return sub_100005770(&qword_100019280, type metadata accessor for Identifier);
}

uint64_t sub_100005770(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000057C0(uint64_t a1, uint64_t a2)
{
  return sub_1000057D8(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000057D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100010D68();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000581C()
{
  sub_100010D68();
  sub_100010D78();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005870()
{
  sub_100010D68();
  sub_100010F88();
  sub_100010D78();
  Swift::Int v0 = sub_100010F98();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000058E8()
{
  uint64_t v0 = sub_100010D68();
  uint64_t v2 = v1;
  if (v0 == sub_100010D68() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100010F58();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100005974()
{
  return sub_100005770(&qword_100019288, type metadata accessor for Identifier);
}

uint64_t sub_1000059BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000059F4(objc_class *a1, uint64_t a2)
{
  sub_100005168(a1, a2, *(void *)(v2 + 16));
}

size_t sub_1000059FC(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = sub_1000065B8(result, v11, 1, v3);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  uint64_t result = sub_100007BE4(&qword_100019530);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100005B28(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100010F88();
  swift_bridgeObjectRetain();
  sub_100010D78();
  Swift::Int v8 = sub_100010F98();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100010F58() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100010F58() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100005FB8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100005CD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007BE4(&qword_1000192C8);
  uint64_t v3 = sub_100010E78();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100010F88();
      sub_100010D78();
      uint64_t result = sub_100010F98();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100005FB8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100005CD8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100006154();
      goto LABEL_22;
    }
    sub_100006308();
  }
  uint64_t v11 = *v4;
  sub_100010F88();
  sub_100010D78();
  uint64_t result = sub_100010F98();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100010F58(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100010F68();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100010F58();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_100006154()
{
  uint64_t v1 = v0;
  sub_100007BE4(&qword_1000192C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100010E68();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100006308()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007BE4(&qword_1000192C8);
  uint64_t v3 = sub_100010E78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100010F88();
    swift_bridgeObjectRetain();
    sub_100010D78();
    uint64_t result = sub_100010F98();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

size_t sub_1000065B8(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100007BE4(&qword_1000192E0);
  uint64_t v10 = *(void *)(sub_100007BE4(&qword_100019530) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100007BE4(&qword_100019530) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

Swift::Int sub_100006794(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100007BE4(&qword_1000192C8);
    uint64_t v3 = sub_100010E88();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100010F88();
      swift_bridgeObjectRetain();
      sub_100010D78();
      Swift::Int result = sub_100010F98();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        unint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_100010F58(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          BOOL v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_100010F58();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_100006938()
{
  sub_100007BE4(&qword_1000192D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000115F0;
  strcpy((char *)(inited + 32), "plum.preset3");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(void *)(inited + 48) = 0xD000000000000018;
  *(void *)(inited + 56) = 0x8000000100011BC0;
  *(void *)(inited + 64) = 0xD000000000000011;
  *(void *)(inited + 72) = 0x8000000100011BE0;
  *(void *)(inited + 80) = 0xD000000000000029;
  *(void *)(inited + 88) = 0x8000000100011C00;
  strcpy((char *)(inited + 96), "peach.preset1");
  *(_WORD *)(inited + 110) = -4864;
  *(void *)(inited + 112) = 0xD000000000000018;
  *(void *)(inited + 120) = 0x8000000100011BC0;
  *(void *)(inited + 128) = 0xD000000000000011;
  *(void *)(inited + 136) = 0x8000000100011BE0;
  *(void *)(inited + 144) = 0xD000000000000028;
  *(void *)(inited + 152) = 0x8000000100011C30;
  return sub_100008518(inited);
}

unint64_t sub_100006A28()
{
  sub_100007BE4(&qword_1000192D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011600;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x8000000100011B00;
  uint64_t v1 = (void *)PRTimeFontIdentifierSoft;
  *(void *)(inited + 48) = PRTimeFontIdentifierSoft;
  *(void *)(inited + 56) = 0xD000000000000010;
  uint64_t v2 = (void *)PRTimeFontIdentifierSlab;
  *(void *)(inited + 64) = 0x8000000100011B80;
  *(void *)(inited + 72) = v2;
  strcpy((char *)(inited + 80), "plum.preset3");
  *(unsigned char *)(inited + 93) = 0;
  *(_WORD *)(inited + 94) = -5120;
  uint64_t v3 = (void *)PRTimeFontIdentifierRail;
  *(void *)(inited + 96) = PRTimeFontIdentifierRail;
  strcpy((char *)(inited + 104), "pink.preset5");
  uint64_t v4 = (void *)PRTimeFontIdentifierRounded;
  *(unsigned char *)(inited + 117) = 0;
  *(_WORD *)(inited + 118) = -5120;
  *(void *)(inited + 120) = v4;
  strcpy((char *)(inited + 128), "pink.preset2");
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  uint64_t v5 = (void *)PRTimeFontIdentifierNewYork;
  *(void *)(inited + 144) = PRTimeFontIdentifierNewYork;
  strcpy((char *)(inited + 152), "coral.preset2");
  *(_WORD *)(inited + 166) = -4864;
  *(void *)(inited + 168) = v3;
  strcpy((char *)(inited + 176), "peach.preset1");
  *(_WORD *)(inited + 190) = -4864;
  *(void *)(inited + 192) = v5;
  *(void *)(inited + 200) = 0xD000000000000013;
  unint64_t v6 = (void *)PRTimeFontIdentifierStencil;
  *(void *)(inited + 208) = 0x8000000100011BA0;
  *(void *)(inited + 216) = v6;
  strcpy((char *)(inited + 224), "green.preset5");
  *(_WORD *)(inited + 238) = -4864;
  *(void *)(inited + 240) = v1;
  *(void *)(inited + 248) = 0x6C616E6F73726570;
  *(void *)(inited + 256) = 0xE800000000000000;
  *(void *)(inited + 264) = v4;
  *(void *)(inited + 272) = 1802661751;
  *(void *)(inited + 280) = 0xE400000000000000;
  *(void *)(inited + 288) = v4;
  *(void *)(inited + 296) = 0x7065656C73;
  *(void *)(inited + 304) = 0xE500000000000000;
  *(void *)(inited + 312) = v4;
  *(void *)(inited + 320) = 0x7373656E746966;
  *(void *)(inited + 328) = 0xE700000000000000;
  *(void *)(inited + 336) = v6;
  *(void *)(inited + 344) = 0x676E696D6167;
  *(void *)(inited + 352) = 0xE600000000000000;
  *(void *)(inited + 360) = v3;
  *(void *)(inited + 368) = 0x6E6C7566646E696DLL;
  *(void *)(inited + 376) = 0xEB00000000737365;
  *(void *)(inited + 384) = v4;
  *(void *)(inited + 392) = 0x676E6964616572;
  *(void *)(inited + 400) = 0xE700000000000000;
  *(void *)(inited + 408) = v5;
  id v7 = v4;
  id v8 = v3;
  id v9 = v5;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  id v13 = v1;
  id v14 = v6;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  id v19 = v14;
  id v20 = v2;
  return sub_10000867C(inited);
}

uint64_t sub_100006CFC(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v106 = a1;
  uint64_t v93 = sub_100010C68();
  uint64_t v5 = *(void *)(v93 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v107 = (char *)v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_100010C18();
  uint64_t v7 = *(void *)(v103 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v94 = (char *)v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v104 = (char *)v84 - v10;
  uint64_t v11 = sub_100007BE4(&qword_100019530);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (void *)((char *)v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v111 = (unint64_t)&_swiftEmptyArrayStorage;
  v110 = &_swiftEmptySetSingleton;
  id v15 = (void *)sub_100010AE8();
  size_t v16 = sub_100010AF8();
  v115 = v15;
  sub_1000059FC(v16);
  uint64_t v102 = v115[2];
  if (!v102)
  {
    swift_bridgeObjectRelease();
    v82 = &_swiftEmptyArrayStorage;
    goto LABEL_67;
  }
  v84[2] = a3;
  v85 = a2;
  uint64_t v17 = 0;
  uint64_t v90 = 0;
  v100 = (char *)v14 + *(int *)(v11 + 64);
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v99 = *(int *)(v11 + 80);
  v84[1] = v115;
  v98 = (char *)v115 + v18;
  v97 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v96 = *(void *)(v12 + 72);
  v95 = (void (**)(char *, uint64_t))(v7 + 8);
  v92 = (void (**)(char *, char *, uint64_t))(v7 + 16);
  v91 = (void (**)(char *, uint64_t))(v5 + 8);
  v87 = (char *)&type metadata for Any + 8;
  long long v86 = xmmword_100011610;
  uint64_t v19 = v103;
  id v20 = v104;
  v101 = v14;
  do
  {
    uint64_t v108 = v17;
    sub_100007C28((uint64_t)&v98[v96 * v17], (uint64_t)v14);
    uint64_t v21 = *v14;
    uint64_t v22 = v14[1];
    BOOL v23 = (void *)v14[2];
    uint64_t v24 = *(uint64_t *)((char *)v14 + v99);
    (*v97)(v20, v100, v19);
    uint64_t v25 = v110;
    if (v110[2])
    {
      sub_100010F88();
      swift_bridgeObjectRetain();
      sub_100010D78();
      Swift::Int v26 = sub_100010F98();
      uint64_t v27 = -1 << *((unsigned char *)v25 + 32);
      unint64_t v28 = v26 & ~v27;
      if ((*(void *)((char *)v25 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v28))
      {
        uint64_t v29 = v25[6];
        v30 = (void *)(v29 + 16 * v28);
        BOOL v31 = *v30 == v21 && v30[1] == v22;
        if (v31 || (sub_100010F58() & 1) != 0)
        {
LABEL_3:
          swift_bridgeObjectRelease();
          id v20 = v104;
          uint64_t v19 = v103;
          (*v95)(v104, v103);
          swift_bridgeObjectRelease();

          goto LABEL_4;
        }
        uint64_t v32 = ~v27;
        while (1)
        {
          unint64_t v28 = (v28 + 1) & v32;
          if (((*(void *)((char *)v25 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v28) & 1) == 0) {
            break;
          }
          v33 = (void *)(v29 + 16 * v28);
          BOOL v34 = *v33 == v21 && v33[1] == v22;
          if (v34 || (sub_100010F58() & 1) != 0) {
            goto LABEL_3;
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v19 = v103;
      id v20 = v104;
    }
    if (*(void *)(v106 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v35 = sub_10000D304(v21, v22);
      if (v36)
      {
        id v37 = *(id *)(*(void *)(v106 + 56) + 8 * v35);
        swift_bridgeObjectRelease();
        v115 = 0;
        id v38 = [v37 loadUserInfoWithError:&v115];
        id v39 = v115;
        if (v38)
        {
          v40 = v38;
          uint64_t v41 = sub_100010D08();
          id v42 = v39;

          *(void *)&long long v113 = 0x6E6F6973726576;
          *((void *)&v113 + 1) = 0xE700000000000000;
          sub_100010E58();
          if (*(void *)(v41 + 16) && (unint64_t v43 = sub_10000D37C((uint64_t)&v115), (v44 & 1) != 0))
          {
            sub_100007D90(*(void *)(v41 + 56) + 32 * v43, (uint64_t)&v113);
          }
          else
          {
            long long v113 = 0u;
            long long v114 = 0u;
          }
          id v20 = v104;
          sub_100007CA0((uint64_t)&v115);
          uint64_t v45 = *((void *)&v114 + 1);
          sub_100007D30((uint64_t)&v113);
          if (v45)
          {
            *(void *)&long long v112 = 0x6E6F6973726576;
            *((void *)&v112 + 1) = 0xE700000000000000;
            sub_100010E58();
            if (*(void *)(v41 + 16) && (unint64_t v46 = sub_10000D37C((uint64_t)&v115), (v47 & 1) != 0))
            {
              sub_100007D90(*(void *)(v41 + 56) + 32 * v46, (uint64_t)&v113);
            }
            else
            {
              long long v113 = 0u;
              long long v114 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_100007CA0((uint64_t)&v115);
            if (*((void *)&v114 + 1))
            {
              if ((swift_dynamicCast() & 1) != 0 && (void)v112 == 1)
              {
                id v49 = v37;
                sub_100010D98();
                if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_100010DC8();
                }
                sub_100010DD8();
                sub_100010DB8();
                sub_100005B28((Swift::Int *)&v115, v21, v22);

                swift_bridgeObjectRelease();
                uint64_t v19 = v103;
                (*v95)(v20, v103);
                goto LABEL_4;
              }
            }
            else
            {
              sub_100007D30((uint64_t)&v113);
            }
          }
          else
          {

            swift_bridgeObjectRelease();
          }
          uint64_t v19 = v103;
        }
        else
        {
          v48 = v115;
          sub_100010AB8();

          swift_willThrow();
          swift_errorRelease();

          uint64_t v90 = 0;
          uint64_t v19 = v103;
          id v20 = v104;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRetain();
    NSString v50 = sub_100010D38();
    swift_bridgeObjectRelease();
    id v51 = [self mutableDescriptorWithIdentifier:v50];

    (*v92)(v94, v20, v19);
    id v105 = v23;
    sub_100010C48();
    uint64_t v52 = sub_100010C38();
    *(void *)&long long v113 = 0x6E6F6973726576;
    *((void *)&v113 + 1) = 0xE700000000000000;
    sub_100010E58();
    *((void *)&v114 + 1) = &type metadata for Int;
    *(void *)&long long v113 = 1;
    sub_100007C90(&v113, &v112);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v109 = v52;
    sub_10000E1E8(&v112, (uint64_t)&v115, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_100007CA0((uint64_t)&v115);
    id v54 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
    v55 = v54;
    if (v24)
    {
      [v54 setFocus:v24];
      [v55 setOnlyEligibleForMadeForFocusSection:1];
    }
    unint64_t v56 = sub_100006938();
    if (*(void *)(v56 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v57 = sub_10000D304(v21, v22);
      if (v58)
      {
        uint64_t v59 = *(void *)(v56 + 56) + 48 * v57;
        uint64_t v88 = *(void *)(v59 + 16);
        v89 = *(void **)(v59 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v60 = objc_allocWithZone((Class)CHSWidget);
        NSString v61 = sub_100010D38();
        swift_bridgeObjectRelease();
        NSString v62 = sub_100010D38();
        swift_bridgeObjectRelease();
        NSString v63 = sub_100010D38();
        id v20 = v104;
        swift_bridgeObjectRelease();
        id v64 = [v60 initWithExtensionBundleIdentifier:v61 containerBundleIdentifier:v62 kind:v63 family:12 intent:0];

        uint64_t v19 = v103;
        [v55 setPreferredInlineComplication:v64];

        goto LABEL_52;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_52:
    unint64_t v65 = sub_100006A28();
    if (!*(void *)(v65 + 16)) {
      goto LABEL_56;
    }
    swift_bridgeObjectRetain();
    unint64_t v66 = sub_10000D304(v21, v22);
    if ((v67 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_56:
      swift_bridgeObjectRelease();
      goto LABEL_57;
    }
    id v68 = *(id *)(*(void *)(v65 + 56) + 8 * v66);
    v89 = v55;
    id v69 = v68;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100007BE4(&qword_1000192B0);
    uint64_t v70 = swift_allocObject();
    *(_OWORD *)(v70 + 16) = v86;
    *(void *)(v70 + 32) = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:v69];
    v115 = (void *)v70;
    sub_100010DB8();
    sub_100007CF4(0, &qword_1000192B8);
    Class isa = sub_100010DA8().super.isa;
    swift_bridgeObjectRelease();
    [v51 setPreferredTimeFontConfigurations:isa];

    v55 = v89;
LABEL_57:
    Swift::Int v72 = sub_100006794((uint64_t)&off_100014900);
    swift_arrayDestroy();
    char v73 = sub_100004F5C(v21, v22, v72);
    swift_bridgeObjectRelease();
    [v55 setAllowsSystemSuggestedComplications:(v73 & 1) == 0];
    v115 = 0;
    if (![v51 storeGalleryOptions:v55 error:&v115])
    {
      v80 = v115;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100010AB8();

      swift_willThrow();
LABEL_64:
      (*v91)(v107, v93);
      (*v95)(v20, v19);
      swift_errorRelease();
      uint64_t v90 = 0;
      goto LABEL_4;
    }
    v74 = v115;
    Class v75 = sub_100010CF8().super.isa;
    swift_bridgeObjectRelease();
    v115 = 0;
    v76 = v51;
    unsigned int v77 = [v51 storeUserInfo:v75 error:&v115];

    if (!v77)
    {
      v81 = v115;
      swift_bridgeObjectRelease();
      sub_100010AB8();

      swift_willThrow();
      goto LABEL_64;
    }
    v78 = v115;
    id v79 = v76;
    sub_100010D98();
    if (*(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100010DC8();
    }
    sub_100010DD8();
    sub_100010DB8();
    sub_100005B28((Swift::Int *)&v115, v21, v22);

    swift_bridgeObjectRelease();
    (*v91)(v107, v93);
    id v20 = v104;
    (*v95)(v104, v19);
LABEL_4:
    id v14 = v101;
    uint64_t v17 = v108 + 1;
  }
  while (v108 + 1 != v102);
  swift_bridgeObjectRelease();
  v82 = (void *)v111;
  a2 = v85;
LABEL_67:
  swift_bridgeObjectRelease();
  a2(v82, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100007BE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007BE4(&qword_100019530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100007C90(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007CA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007CF4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100007D30(uint64_t a1)
{
  uint64_t v2 = sub_100007BE4(&qword_1000192C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007D90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for PRTimeFontIdentifier(uint64_t a1)
{
}

__n128 sub_100007E04(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100007E14(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007E34(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for ATXPosterDescriptorFocus(uint64_t a1)
{
}

void sub_100007E84(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100007ECC()
{
  return sub_100005770(&qword_100019300, type metadata accessor for PRTimeFontIdentifier);
}

uint64_t sub_100007F14()
{
  return sub_100005770(&qword_100019308, type metadata accessor for PRTimeFontIdentifier);
}

uint64_t sub_100007F5C()
{
  return sub_100005770(&qword_100019310, type metadata accessor for PRTimeFontIdentifier);
}

uint64_t sub_100007FAC@<X0>(uint64_t *a1@<X8>)
{
  sub_100010CD8();
  swift_allocObject();
  sub_100010CE8();
  sub_100010CA8();
  swift_allocObject();
  swift_retain();
  sub_100010CB8();
  sub_100007BE4(&qword_1000193B0);
  sub_100010AD8();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000115F0;
  sub_100008454(&qword_1000193B8, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100010AC8();
  sub_100008454(&qword_1000193C0, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100010AC8();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_1000081D8()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for GradientPosterController());

  return [v0 init];
}

uint64_t sub_100008214()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100008370()
{
  unint64_t result = qword_100019390;
  if (!qword_100019390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100019390);
  }
  return result;
}

uint64_t sub_1000083C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for GradientPosterExtension()
{
  return &type metadata for GradientPosterExtension;
}

uint64_t sub_10000841C()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100008454(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000849C()
{
  return sub_1000084D0(&qword_1000193C8);
}

uint64_t sub_1000084D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000083C4(&qword_1000193A0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008518(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    char v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007BE4((uint64_t *)&unk_1000195B0);
  uint64_t v2 = sub_100010F38();
  char v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v21 = v2 + 64;
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v22 = v4;
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    uint64_t v9 = v5[1];
    uint64_t v11 = v5[2];
    uint64_t v10 = v5[3];
    uint64_t v13 = v5[4];
    uint64_t v12 = v5[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000D304(v6, v7);
    if (v15) {
      break;
    }
    *(void *)(v21 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    size_t v16 = (uint64_t *)(v3[6] + 16 * result);
    *size_t v16 = v6;
    v16[1] = v7;
    uint64_t v17 = (void *)(v3[7] + 48 * result);
    *uint64_t v17 = v8;
    v17[1] = v9;
    v17[2] = v11;
    v17[3] = v10;
    v17[4] = v13;
    v17[5] = v12;
    uint64_t v18 = v3[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    v3[2] = v20;
    v5 += 8;
    uint64_t v4 = v22 - 1;
    if (v22 == 1)
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

unint64_t sub_10000867C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007BE4(&qword_1000195A8);
  uint64_t v2 = (void *)sub_100010F38();
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
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10000D304(v5, v6);
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

unint64_t sub_100008798(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007BE4(&qword_100019570);
  uint64_t v2 = sub_100010F38();
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
    sub_100010968(v6, (uint64_t)v15, &qword_100019578);
    unint64_t result = sub_10000D37C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100007C90(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_1000088DC(uint64_t a1)
{
  uint64_t v2 = sub_100007BE4(&qword_100019560);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007BE4(&qword_100019540);
  uint64_t v6 = sub_100010F38();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100010968(v12, (uint64_t)v5, &qword_100019560);
    unint64_t result = sub_10000D3C0((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_100010C18();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

id sub_100008AD0()
{
  uint64_t v1 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController____lazy_storage___bundle;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController____lazy_storage___bundle);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController____lazy_storage___bundle);
  }
  else
  {
    sub_100010B68();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v5 = [self bundleForClass:ObjCClassFromMetadata];
    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_100008B60(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100010C18();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v41 - v9;
  uint64_t v11 = sub_100007BE4(&qword_100019548);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = *(void **)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView);
  if (v17)
  {
    id v18 = v17;
    sub_100010B38();

LABEL_34:
    *(double *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle) = a1;
    return;
  }
  v53 = v8;
  uint64_t v19 = (uint64_t *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews);
  swift_beginAccess();
  uint64_t v20 = *v19;
  uint64_t v21 = *(void *)(*v19 + 64);
  uint64_t v43 = *v19 + 64;
  uint64_t v22 = 1 << *(unsigned char *)(v20 + 32);
  uint64_t v23 = -1;
  if (v22 < 64) {
    uint64_t v23 = ~(-1 << v22);
  }
  unint64_t v24 = v23 & v21;
  uint64_t v42 = v2;
  uint64_t v25 = v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
  uint64_t v46 = v20;
  swift_bridgeObjectRetain();
  uint64_t v50 = v25;
  swift_beginAccess();
  int64_t v51 = 0;
  uint64_t v52 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  id v49 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v45 = v5;
  v48 = (void (**)(char *, uint64_t))(v5 + 8);
  int64_t v44 = (unint64_t)(v22 + 63) >> 6;
  int64_t v41 = v44 - 1;
  Swift::Int v26 = v10;
  for (i = v16; ; unint64_t v16 = i)
  {
    if (v24)
    {
      unint64_t v28 = __clz(__rbit64(v24));
      v24 &= v24 - 1;
      unint64_t v29 = v28 | (v51 << 6);
LABEL_10:
      uint64_t v30 = v46;
      (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v14, *(void *)(v46 + 48) + *(void *)(v45 + 72) * v29, v4);
      uint64_t v31 = *(void *)(v30 + 56);
      uint64_t v32 = sub_100007BE4(&qword_100019550);
      v33 = *(void **)(v31 + 8 * v29);
      *(void *)&v14[*(int *)(v32 + 48)] = v33;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v14, 0, 1, v32);
      id v34 = v33;
      goto LABEL_29;
    }
    int64_t v35 = v51 + 1;
    if (__OFADD__(v51, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v35 < v44)
    {
      unint64_t v36 = *(void *)(v43 + 8 * v35);
      if (v36) {
        goto LABEL_14;
      }
      int64_t v37 = v51 + 2;
      ++v51;
      if (v35 + 1 < v44)
      {
        unint64_t v36 = *(void *)(v43 + 8 * v37);
        if (v36) {
          goto LABEL_17;
        }
        int64_t v51 = v35 + 1;
        if (v35 + 2 < v44)
        {
          unint64_t v36 = *(void *)(v43 + 8 * (v35 + 2));
          if (v36)
          {
            v35 += 2;
            goto LABEL_14;
          }
          int64_t v37 = v35 + 3;
          int64_t v51 = v35 + 2;
          if (v35 + 3 < v44) {
            break;
          }
        }
      }
    }
LABEL_28:
    uint64_t v38 = sub_100007BE4(&qword_100019550);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v14, 1, 1, v38);
    unint64_t v24 = 0;
LABEL_29:
    sub_10000EED0((uint64_t)v14, (uint64_t)v16);
    uint64_t v39 = sub_100007BE4(&qword_100019550);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 48))(v16, 1, v39) == 1)
    {
      swift_release();
      uint64_t v2 = v42;
      goto LABEL_34;
    }
    v40 = *(void **)&v16[*(int *)(v39 + 48)];
    (*v49)(v26, v16, v4);
    (*v52)(v53, v50, v4);
    sub_10000EF38(&qword_100019558);
    sub_100010D88();
    sub_100010D88();
    if (v56 != v54 || v57 != v55) {
      sub_100010F58();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v27 = *v48;
    (*v48)(v53, v4);
    sub_100010B38();

    v27(v26, v4);
  }
  unint64_t v36 = *(void *)(v43 + 8 * v37);
  if (v36)
  {
LABEL_17:
    int64_t v35 = v37;
LABEL_14:
    unint64_t v24 = (v36 - 1) & v36;
    unint64_t v29 = __clz(__rbit64(v36)) + (v35 << 6);
    int64_t v51 = v35;
    goto LABEL_10;
  }
  while (1)
  {
    int64_t v35 = v37 + 1;
    if (__OFADD__(v37, 1)) {
      break;
    }
    if (v35 >= v44)
    {
      int64_t v51 = v41;
      goto LABEL_28;
    }
    unint64_t v36 = *(void *)(v43 + 8 * v35);
    ++v37;
    if (v36) {
      goto LABEL_14;
    }
  }
LABEL_36:
  __break(1u);
}

uint64_t sub_10000917C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007BE4(&qword_100019548);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  v78 = (void (*)(char *, uint64_t, uint64_t))((char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v58 - v5;
  uint64_t v79 = sub_100010B18();
  uint64_t v83 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010BB8();
  uint64_t v66 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010C18();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100010C68();
  id v64 = *(uint64_t (***)(char *, uint64_t))(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v17 = *(void **)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView);
  v84 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v17)
  {
    uint64_t v82 = v9;
    id v18 = *(void **)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
    uint64_t v19 = v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v19, v12);
    id v20 = v17;
    id v21 = v18;
    sub_100010C48();
    uint64_t v22 = v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientOptions;
    swift_beginAccess();
    uint64_t v23 = v66;
    v78 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
    uint64_t v24 = v82;
    v78(v11, v22, v82);
    sub_100010B88();
    uint64_t v25 = v83;
    int64_t v81 = *(void *)(v23 + 8);
    ((void (*)(char *, uint64_t))v81)(v11, v24);
    sub_100010B48();
    sub_100010B58();
    [v20 bounds];
    v78(v11, v22, v24);
    Swift::Int v26 = v84;
    sub_100010BC8();
    ((void (*)(char *, uint64_t))v81)(v11, v24);
    sub_100010B28();

    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v79);
    return v64[1](v26, v80);
  }
  v74 = v15;
  uint64_t v82 = v12;
  v76 = v6;
  unsigned int v77 = v11;
  unint64_t v28 = (uint64_t *)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews);
  swift_beginAccess();
  uint64_t v29 = *v28;
  uint64_t v30 = *(void *)(*v28 + 64);
  uint64_t v60 = *v28 + 64;
  uint64_t v31 = 1 << *(unsigned char *)(v29 + 32);
  uint64_t v32 = -1;
  if (v31 < 64) {
    uint64_t v32 = ~(-1 << v31);
  }
  unint64_t v33 = v32 & v30;
  uint64_t v73 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor;
  uint64_t v75 = v1;
  uint64_t v34 = v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientOptions;
  uint64_t v70 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle;
  uint64_t v63 = v29;
  swift_bridgeObjectRetain();
  uint64_t v71 = v34;
  uint64_t result = swift_beginAccess();
  int64_t v81 = 0;
  uint64_t v62 = v13 + 16;
  id v69 = (void (**)(char *, uint64_t, uint64_t))(v13 + 32);
  id v68 = (void (**)(char *, uint64_t, uint64_t))(v66 + 16);
  v66 += 8;
  unint64_t v65 = (void (**)(char *, uint64_t))(v83 + 8);
  ++v64;
  int64_t v61 = (unint64_t)(v31 + 63) >> 6;
  int64_t v59 = v61 - 1;
  uint64_t v72 = v13;
  char v67 = v8;
  if (!v33) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v83 = (v33 - 1) & v33;
  unint64_t v44 = __clz(__rbit64(v33)) | (v81 << 6);
  uint64_t v46 = v77;
  uint64_t v45 = (uint64_t)v78;
  uint64_t v47 = (uint64_t)v76;
  while (2)
  {
    uint64_t v48 = v63;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 16))(v45, *(void *)(v63 + 48) + *(void *)(v13 + 72) * v44, v82);
    uint64_t v49 = *(void *)(v48 + 56);
    uint64_t v50 = sub_100007BE4(&qword_100019550);
    int64_t v51 = *(void **)(v49 + 8 * v44);
    *(void *)(v45 + *(int *)(v50 + 48)) = v51;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v45, 0, 1, v50);
    id v52 = v51;
    while (1)
    {
      sub_10000EED0(v45, v47);
      uint64_t v57 = sub_100007BE4(&qword_100019550);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 48))(v47, 1, v57) == 1) {
        return swift_release();
      }
      int64_t v35 = *(void **)(v47 + *(int *)(v57 + 48));
      unint64_t v36 = *(void **)(v75 + v73);
      (*v69)(v74, v47, v82);
      id v37 = v36;
      sub_100010C48();
      uint64_t v38 = *v68;
      uint64_t v39 = v71;
      (*v68)(v46, v71, v9);
      sub_100010B88();
      v40 = *(void (**)(char *, uint64_t))v66;
      (*(void (**)(char *, uint64_t))v66)(v46, v9);
      sub_100010B48();
      sub_100010B58();
      [v35 bounds];
      v38(v46, v39, v9);
      int64_t v41 = v67;
      sub_100010BC8();
      v40(v46, v9);
      uint64_t v13 = v72;
      uint64_t v42 = v79;
      uint64_t v43 = v84;
      sub_100010B28();

      (*v65)(v41, v42);
      uint64_t result = (*v64)(v43, v80);
      unint64_t v33 = v83;
      if (v83) {
        goto LABEL_8;
      }
LABEL_10:
      int64_t v53 = v81 + 1;
      uint64_t v46 = v77;
      uint64_t v45 = (uint64_t)v78;
      uint64_t v47 = (uint64_t)v76;
      if (__OFADD__(v81, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v53 < v61)
      {
        unint64_t v54 = *(void *)(v60 + 8 * v53);
        if (v54) {
          goto LABEL_13;
        }
        int64_t v55 = v81 + 2;
        ++v81;
        if (v53 + 1 < v61)
        {
          unint64_t v54 = *(void *)(v60 + 8 * v55);
          if (v54) {
            goto LABEL_16;
          }
          int64_t v81 = v53 + 1;
          if (v53 + 2 < v61)
          {
            unint64_t v54 = *(void *)(v60 + 8 * (v53 + 2));
            if (v54)
            {
              v53 += 2;
              goto LABEL_13;
            }
            int64_t v55 = v53 + 3;
            int64_t v81 = v53 + 2;
            if (v53 + 3 < v61) {
              break;
            }
          }
        }
      }
LABEL_27:
      uint64_t v56 = sub_100007BE4(&qword_100019550);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v45, 1, 1, v56);
      uint64_t v83 = 0;
    }
    unint64_t v54 = *(void *)(v60 + 8 * v55);
    if (v54)
    {
LABEL_16:
      int64_t v53 = v55;
LABEL_13:
      uint64_t v83 = (v54 - 1) & v54;
      unint64_t v44 = __clz(__rbit64(v54)) + (v53 << 6);
      int64_t v81 = v53;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v53 = v55 + 1;
    if (__OFADD__(v55, 1)) {
      break;
    }
    if (v53 >= v61)
    {
      int64_t v81 = v59;
      goto LABEL_27;
    }
    unint64_t v54 = *(void *)(v60 + 8 * v53);
    ++v55;
    if (v54) {
      goto LABEL_13;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void *sub_100009B70(uint64_t a1)
{
  if (!*(void *)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer))
  {
    uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews);
    swift_beginAccess();
    uint64_t v6 = *v5;
    if (*(void *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_10000D3C0(a1);
      if (v8)
      {
        uint64_t v2 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
        id v9 = v2;
        swift_bridgeObjectRelease();
        return v2;
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView);
  id v3 = v2;
  return v2;
}

void sub_100009C24(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_100010C18();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer))
  {
    uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView);
    *(void *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView) = a1;
    id v9 = a1;
    uint64_t v10 = v15;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    uint64_t v11 = (uint64_t *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews);
    swift_beginAccess();
    id v12 = a1;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v11;
    *uint64_t v11 = 0x8000000000000000;
    sub_10000E334((uint64_t)v12, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v11 = v16;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_endAccess();
  }
}

void sub_100009DD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007BE4(&qword_100019530);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (void *)((char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  char v8 = (void *)((char *)v48 - v7);
  id v9 = *(id *)&v0[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor];
  uint64_t v10 = sub_100010AE8();
  uint64_t v11 = *(void *)(v10 + 16);
  id v49 = v9;
  uint64_t v50 = v0;
  if (v11)
  {
    *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
    sub_100010EC8();
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    v48[1] = v10;
    uint64_t v13 = v10 + ((v12 + 32) & ~v12);
    uint64_t v51 = *(void *)(v3 + 72);
    id v52 = (id)v2;
    do
    {
      sub_100010968(v13, (uint64_t)v8, &qword_100019530);
      uint64_t v14 = *(int *)(v2 + 64);
      uint64_t v15 = (char *)v6 + v14;
      uint64_t v16 = *(int *)(v2 + 80);
      uint64_t v17 = (char *)v8 + v14;
      uint64_t v18 = v8[1];
      *uint64_t v6 = *v8;
      v6[1] = v18;
      uint64_t v19 = (void *)v8[2];
      v6[2] = v19;
      uint64_t v20 = sub_100010C18();
      uint64_t v21 = *(void *)(v20 - 8);
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v15, v17, v20);
      *(void *)((char *)v6 + v16) = *(void *)((char *)v8 + v16);
      uint64_t v22 = *(void (**)(char *, uint64_t))(v21 + 8);
      id v23 = v19;
      v22(v15, v20);
      sub_10000EE1C((uint64_t)v8, &qword_100019530);
      sub_100010EA8();
      sub_100010ED8();
      uint64_t v2 = (uint64_t)v52;
      sub_100010EE8();
      sub_100010EB8();
      v13 += v51;
      --v11;
    }
    while (v11);
    unint64_t v24 = aBlock;
    swift_bridgeObjectRelease();
    id v9 = v49;
    uint64_t v1 = v50;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v24 = (unint64_t)&_swiftEmptyArrayStorage;
  }
  unint64_t v59 = v24;
  swift_bridgeObjectRetain();
  char v25 = sub_10000A404((uint64_t)v9, v24);
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_9;
  }
  id v26 = v9;
  sub_100010D98();
  if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_30;
  }
  while (1)
  {
    sub_100010DD8();
    sub_100010DB8();
    unint64_t v24 = v59;
LABEL_9:
    id v27 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
    id v28 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v9];
    [v27 setSelectedColor:v28];

    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_100010F08();
      if (!v29)
      {
LABEL_21:
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v29 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v29) {
        goto LABEL_21;
      }
    }
    uint64_t v58 = &_swiftEmptyArrayStorage;
    sub_10000EAB0(0, v29 & ~(v29 >> 63), 0);
    if ((v29 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_30:
    sub_100010DC8();
  }
  id v52 = v27;
  uint64_t v30 = 0;
  uint64_t v31 = v58;
  do
  {
    if ((v24 & 0xC000000000000001) != 0) {
      id v32 = (id)sub_100010E98();
    }
    else {
      id v32 = *(id *)(v24 + 8 * v30 + 32);
    }
    unint64_t v33 = v32;
    id v34 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v32];
    int64_t v55 = (void *)sub_100007CF4(0, &qword_100019508);

    *(void *)&long long aBlock = v34;
    uint64_t v58 = v31;
    unint64_t v36 = v31[2];
    unint64_t v35 = v31[3];
    if (v36 >= v35 >> 1)
    {
      sub_10000EAB0((char *)(v35 > 1), v36 + 1, 1);
      uint64_t v31 = v58;
    }
    ++v30;
    v31[2] = v36 + 1;
    sub_100007C90(&aBlock, &v31[4 * v36 + 4]);
  }
  while (v29 != v30);
  swift_bridgeObjectRelease();
  id v9 = v49;
  uint64_t v1 = v50;
  id v27 = v52;
LABEL_22:
  swift_bridgeObjectRelease();
  Class isa = sub_100010DA8().super.isa;
  swift_bridgeObjectRelease();
  [v27 setSuggestedColors:isa];

  uint64_t v38 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor;
  uint64_t v39 = *(void **)&v1[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor];
  if (v39)
  {
    sub_100010D68();
    id v40 = v39;
    NSString v41 = sub_100010D38();
    swift_bridgeObjectRelease();
    id v42 = [v40 viewForMenuElementIdentifier:v41];
  }
  else
  {
    id v42 = 0;
  }
  [v27 setColorPickerSourceItem:v42];
  swift_unknownObjectRelease();
  uint64_t v43 = *(void **)&v1[v38];
  if (v43)
  {
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v1;
    uint64_t v56 = sub_10000EEB0;
    uint64_t v57 = v44;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    unint64_t v54 = sub_10000A644;
    int64_t v55 = &unk_100014AD0;
    uint64_t v45 = _Block_copy(&aBlock);
    id v46 = v43;
    uint64_t v47 = v1;
    swift_release();
    [v46 presentColorPickerWithConfiguration:v27 changeHandler:v45];

    _Block_release(v45);
    id v9 = v46;
  }
  else
  {
  }
}

uint64_t sub_10000A404(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_100010F08())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)sub_100010E98();
LABEL_5:
      uint64_t v6 = v5;
      sub_100007CF4(0, &qword_100019538);
      char v7 = sub_100010E08();

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
        char v14 = sub_100010E08();

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
      sub_100010E98();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_100010E08();
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

void sub_10000A58C(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [v3 colorWithAlphaComponent:1.0];
  id v5 = *(void **)(a2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
  *(void *)(a2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor) = v4;
  id v7 = v4;

  sub_10000917C();
  uint64_t v6 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor;
  [*(id *)(a2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) updateActions];
  [*(id *)(a2 + v6) updateLuminanceValuesForLooks];
}

void sub_10000A644(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000A6AC(void *a1, uint64_t a2)
{
  if (*(void *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer))
  {
    if (*(void *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView)) {
      return;
    }
    goto LABEL_6;
  }
  uint64_t v5 = v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews;
  swift_beginAccess();
  if (!*(void *)(*(void *)v5 + 16)
    || (swift_bridgeObjectRetain(), sub_10000D3C0(a2), char v7 = v6, swift_bridgeObjectRelease(), (v7 & 1) == 0))
  {
LABEL_6:
    sub_100010B68();
    id v8 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    sub_100010B58();
    [a1 addSubview:v8];
    v9.super.super.Class isa = (Class)v8;
    sub_100010DE8(v9);
    sub_100009C24(v8, a2);
  }
}

void sub_10000A7D4()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(*v1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(*v1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_28:
      __break(1u);
      return;
    }
    if (v11 >= v7) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_5:
    [*(id *)(*(void *)(v2 + 56) + 8 * v10) removeFromSuperview];
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_28;
        }
        if (v8 >= v7) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_22;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_22;
  }
LABEL_23:
  swift_release();
  uint64_t *v1 = (uint64_t)&_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  uint64_t v14 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView;
  uint64_t v15 = *(void **)(v0 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView);
  if (v15)
  {
    [v15 removeFromSuperview];
    uint64_t v16 = *(void **)(v0 + v14);
  }
  else
  {
    uint64_t v16 = 0;
  }
  *(void *)(v0 + v14) = 0;
}

uint64_t sub_10000A998(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100010C18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007BE4(&qword_1000194F8);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100010C68();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[0] = 0;
  id v15 = [a1 loadUserInfoWithError:v28];
  id v16 = v28[0];
  if (v15)
  {
    uint64_t v17 = v15;
    v27[0] = v5;
    sub_100010D08();
    id v18 = v16;

    id v19 = sub_100008AD0();
    sub_100010BD8();

    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      sub_10000EE1C((uint64_t)v10, &qword_1000194F8);
      return 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
      sub_100010C28();
      uint64_t v22 = v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v27[0] + 40))(v22, v7, v4);
      swift_endAccess();
      id v23 = (void *)sub_100010C58();
      unint64_t v24 = *(void **)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
      *(void *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor) = v23;
      id v25 = v23;

      sub_10000917C();
      uint64_t v26 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor;
      [*(id *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) updateActions];
      [*(id *)(v2 + v26) updateLuminanceValuesForLooks];

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      return 1;
    }
  }
  else
  {
    id v21 = v28[0];
    sub_100010AB8();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
}

void sub_10000AD24(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100010C18();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer;
  uint64_t v11 = *(void **)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer);
  *(void *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer) = a1;
  id v12 = a1;

  swift_getObjectType();
  unsigned __int8 v13 = [a2 isPreview];
  *(unsigned char *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_isPreview) = v13;
  if (!UIAccessibilityIsReduceMotionEnabled()) {
    [a2 unlockProgress];
  }
  swift_beginAccess();
  sub_100010B78();
  swift_endAccess();
  [a2 backlightProgress];
  swift_beginAccess();
  sub_100010B98();
  swift_endAccess();
  *(double *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle) = sub_10000EDAC();
  uint64_t v14 = *(void **)(v3 + v10);
  if (v14)
  {
    id v15 = [v14 backgroundView];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
      sub_10000A6AC(v16, (uint64_t)v9);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      LOBYTE(v17) = sub_10000A998([a2 contents]);
      swift_unknownObjectRelease();
      if ((v17 & 1) == 0)
      {
        id v18 = [self blueColor];
        id v19 = *(void **)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
        *(void *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor) = v18;
        id v20 = v18;

        sub_10000917C();
        uint64_t v21 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor;
        [*(id *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) updateActions];
        [*(id *)(v3 + v21) updateLuminanceValuesForLooks];

        id v16 = v20;
      }
    }
  }
}

void sub_10000B1D0(void *a1)
{
  id v1 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  v12[0] = 0;
  id v2 = [v1 loadUserInfoWithError:v12];
  swift_unknownObjectRelease();
  id v3 = v12[0];
  if (v2)
  {
    uint64_t v4 = sub_100010D08();
    id v5 = v3;

    *(void *)&long long v10 = 0x546B6E616C427369;
    *((void *)&v10 + 1) = 0xEF6574616C706D65;
    sub_100010E58();
    if (*(void *)(v4 + 16) && (unint64_t v6 = sub_10000D37C((uint64_t)v12), (v7 & 1) != 0))
    {
      sub_100007D90(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v10);
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100007CA0((uint64_t)v12);
    uint64_t v8 = *((void *)&v11 + 1);
    sub_10000EE1C((uint64_t)&v10, &qword_1000192C0);
    if (v8) {
      sub_100009DD0();
    }
  }
  else
  {
    id v9 = v12[0];
    sub_100010AB8();

    swift_willThrow();
    swift_errorRelease();
  }
}

void sub_10000B414(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void (*a6)(uint64_t, void *))
{
  id v10 = a3;
  swift_unknownObjectRetain();
  id v11 = a5;
  id v12 = a1;
  a6(a4, a5);

  swift_unknownObjectRelease();
}

void sub_10000B540(void *a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = (CGContext *)[a1 CGContext];
  id v11 = (CGColor *)[*(id *)(a2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor) CGColor];
  CGContextSetFillColorWithColor(v10, v11);

  id v12 = (CGContext *)[a1 CGContext];
  CGContextSetLineWidth(v12, a3);

  unsigned __int8 v13 = (CGContext *)[a1 CGContext];
  id v14 = [self systemBackgroundColor];
  id v15 = [self traitCollectionWithUserInterfaceStyle:1];
  id v16 = [v14 resolvedColorWithTraitCollection:v15];

  uint64_t v17 = (CGColor *)[v16 CGColor];
  CGContextSetStrokeColorWithColor(v13, v17);

  id v18 = (CGContext *)[a1 CGContext];
  v21.origin.x = a3;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGContextAddEllipseInRect(v18, v21);

  id v19 = (CGContext *)[a1 CGContext];
  CGContextDrawPath(v19, kCGPathFillStroke);
}

void sub_10000B734(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_10000B780()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    sub_100009DD0();
  }
}

uint64_t sub_10000B86C(void *a1)
{
  uint64_t v2 = sub_100007BE4(&qword_1000194F8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010C68();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010C18();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Look.Variant.preset1(_:), v9);
  uint64_t v25 = sub_100010C08();
  uint64_t v14 = v13;
  unint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v12, v9);
  id v15 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  id v26 = 0;
  id v16 = [v15 loadUserInfoWithError:&v26];
  swift_unknownObjectRelease();
  id v17 = v26;
  if (v16)
  {
    v23[1] = v14;
    sub_100010D08();
    id v18 = v17;

    id v19 = sub_100008AD0();
    sub_100010BD8();

    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_10000EE1C((uint64_t)v4, &qword_1000194F8);
      return v25;
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
      sub_100010C28();
      uint64_t v20 = sub_100010C08();
      v24(v12, v9);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
  }
  else
  {
    id v21 = v26;
    sub_100010AB8();

    swift_willThrow();
    swift_errorRelease();
    return v25;
  }
  return v20;
}

uint64_t sub_10000BD40(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  id v42 = a1;
  uint64_t v7 = sub_100007BE4(&qword_1000194F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100010C68();
  uint64_t v40 = *(void *)(v10 - 8);
  uint64_t v41 = v10;
  __chkstk_darwin(v10);
  uint64_t v39 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100007BE4((uint64_t *)&unk_100019510);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100010C18();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [a3 identifier];
  sub_100010D68();

  sub_100010BF8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    return sub_10000EE1C((uint64_t)v14, (uint64_t *)&unk_100019510);
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
  id v21 = [a2 backgroundView];
  uint64_t v38 = v18;
  sub_10000A6AC(v21, (uint64_t)v18);

  uint64_t v22 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor;
  id v23 = *(id *)(v4 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
  id v24 = objc_msgSend(objc_msgSend(v42, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  id v43 = 0;
  id v25 = [v24 loadUserInfoWithError:&v43];
  swift_unknownObjectRelease();
  id v26 = v43;
  if (v25)
  {
    sub_100010D08();
    id v27 = v26;

    id v28 = sub_100008AD0();
    sub_100010BD8();

    swift_bridgeObjectRelease();
    uint64_t v30 = v40;
    uint64_t v29 = v41;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v9, 1, v41) == 1)
    {
      sub_10000EE1C((uint64_t)v9, &qword_1000194F8);
    }
    else
    {
      id v32 = v39;
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v39, v9, v29);
      uint64_t v33 = sub_100010C58();

      (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
      id v23 = (id)v33;
    }
  }
  else
  {
    id v31 = v43;
    sub_100010AB8();

    swift_willThrow();
    swift_errorRelease();
  }
  id v34 = v38;
  unint64_t v35 = *(void **)(v4 + v22);
  *(void *)(v4 + v22) = v23;
  id v36 = v23;

  sub_10000917C();
  uint64_t v37 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor;
  [*(id *)(v4 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) updateActions];
  [*(id *)(v4 + v37) updateLuminanceValuesForLooks];

  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v34, v15);
}

void sub_10000C41C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100010C18();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor);
  if (v9) {
    BOOL v10 = v9 == a1;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
    uint64_t v17 = v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
    id v18 = v16;
    sub_100010C48();
    uint64_t v19 = sub_100010C68();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a2, 0, 1, v19);
  }
  else
  {
    id v11 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
    swift_unknownObjectRelease();
    v23[0] = 0;
    id v12 = [v11 loadUserInfoWithError:v23];
    swift_unknownObjectRelease();
    id v13 = v23[0];
    if (v12)
    {
      sub_100010D08();
      id v14 = v13;

      id v15 = sub_100008AD0();
      sub_100010BD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v20 = v23[0];
      sub_100010AB8();

      swift_willThrow();
      swift_errorRelease();
      uint64_t v21 = sub_100010C68();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a2, 1, 1, v21);
    }
  }
}

id sub_10000C734(void *a1)
{
  uint64_t v2 = sub_100007BE4(&qword_1000194F8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010C68();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C41C(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000EE1C((uint64_t)v4, &qword_1000194F8);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v9 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
    sub_100007BE4(&qword_100019500);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100011A70;
    id v11 = (void *)sub_100010C58();
    id v12 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v11];

    *(void *)(v10 + 56) = sub_100007CF4(0, &qword_100019508);
    *(void *)(v10 + 32) = v12;
    Class isa = sub_100010DA8().super.isa;
    swift_bridgeObjectRelease();
    [v9 setSuggestedColors:isa];

    id v14 = (void *)sub_100010C58();
    id v15 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:v14];

    [v9 setSelectedColor:v15];
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

id sub_10000C9CC()
{
  v0[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_looksShareBaseAppearance] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_extendRenderSessionInvalidatable] = 0;
  *(void *)&v0[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor] = 0;
  id v1 = v0;
  sub_100010BA8();
  v1[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_isPreview] = 0;
  uint64_t v2 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_colorPickerViewIdentifier;
  *(void *)&v1[v2] = sub_100010D38();
  uint64_t v3 = &v1[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant];
  uint64_t v4 = enum case for Look.Variant.preset1(_:);
  uint64_t v5 = sub_100010C18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  uint64_t v6 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor;
  *(void *)&v1[v6] = [self blueColor];
  *(void *)&v1[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController____lazy_storage___bundle] = 0;
  uint64_t v7 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientViews;
  *(void *)&v1[v7] = sub_1000088DC((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v1[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_sharedGradientView] = 0;

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for GradientPosterController();
  return objc_msgSendSuper2(&v9, "init");
}

id sub_10000CB78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GradientPosterController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000CCE4()
{
  return type metadata accessor for GradientPosterController();
}

uint64_t type metadata accessor for GradientPosterController()
{
  uint64_t result = qword_1000194E8;
  if (!qword_1000194E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000CD38()
{
  uint64_t result = sub_100010BB8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100010C18();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10000CE5C()
{
  uint64_t v0 = sub_100010C18();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010C28();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == enum case for Look.Variant.preset1(_:))
  {
    uint64_t v5 = (objc_class *)[self mainBundle];
    v12._countAndFlagsBits = 0xED00006B6F6F4C20;
    v6._countAndFlagsBits = 0x746E6172626956;
    v6._object = (void *)0xE700000000000000;
    v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v7.value._object = (void *)0xEB00000000656C62;
    v8.super.Class isa = v5;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
LABEL_13:
    uint64_t v10 = sub_100010A98(v6, v7, v8, v9, v12);

    return v10;
  }
  if (v4 == enum case for Look.Variant.preset2(_:))
  {
    uint64_t v5 = (objc_class *)[self mainBundle];
    v12._countAndFlagsBits = 0xED00006B6F6F4C20;
    v6._countAndFlagsBits = 1701736276;
    v6._object = (void *)0xE400000000000000;
    v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v7.value._object = (void *)0xEB00000000656C62;
    v8.super.Class isa = v5;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    goto LABEL_13;
  }
  if (v4 == enum case for Look.Variant.preset3(_:))
  {
    uint64_t v5 = (objc_class *)[self mainBundle];
    v12._countAndFlagsBits = 0xED00006B6F6F4C20;
    v6._countAndFlagsBits = 1885693252;
    v6._object = (void *)0xE400000000000000;
    v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v7.value._object = (void *)0xEB00000000656C62;
    v8.super.Class isa = v5;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    goto LABEL_13;
  }
  if (v4 == enum case for Look.Variant.preset4(_:))
  {
    uint64_t v5 = (objc_class *)[self mainBundle];
    v12._countAndFlagsBits = 0xED00006B6F6F4C20;
    v6._countAndFlagsBits = 0x726F706156;
    v6._object = (void *)0xE500000000000000;
    v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v7.value._object = (void *)0xEB00000000656C62;
    v8.super.Class isa = v5;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    goto LABEL_13;
  }
  if (v4 == enum case for Look.Variant.preset5(_:))
  {
    uint64_t v5 = (objc_class *)[self mainBundle];
    v12._countAndFlagsBits = 0xED00006B6F6F4C20;
    v6._countAndFlagsBits = 0x746867697242;
    v6._object = (void *)0xE600000000000000;
    v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v7.value._object = (void *)0xEB00000000656C62;
    v8.super.Class isa = v5;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    goto LABEL_13;
  }
  if (v4 == enum case for Look.Variant.preset6(_:))
  {
    uint64_t v5 = (objc_class *)[self mainBundle];
    v12._countAndFlagsBits = 0xED00006B6F6F4C20;
    v6._countAndFlagsBits = 0x64696C6F53;
    v6._object = (void *)0xE500000000000000;
    v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v7.value._object = (void *)0xEB00000000656C62;
    v8.super.Class isa = v5;
    v9._countAndFlagsBits = 0;
    v9._object = (void *)0xE000000000000000;
    goto LABEL_13;
  }
  uint64_t result = sub_100010EF8();
  __break(1u);
  return result;
}

unint64_t sub_10000D304(uint64_t a1, uint64_t a2)
{
  sub_100010F88();
  sub_100010D78();
  Swift::Int v4 = sub_100010F98();

  return sub_10000D444(a1, a2, v4);
}

unint64_t sub_10000D37C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100010E38(*(void *)(v2 + 40));

  return sub_10000D528(a1, v4);
}

unint64_t sub_10000D3C0(uint64_t a1)
{
  sub_100010C18();
  sub_10000EF38(&qword_100019520);
  uint64_t v2 = sub_100010D18();

  return sub_10000D64C(a1, v2);
}

unint64_t sub_10000D444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100010F58() & 1) == 0)
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
      while (!v14 && (sub_100010F58() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000D528(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000D5F0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100010E48();
      sub_100007CA0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000D5F0(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_10000D64C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100010C18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String_optional v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10000EF38(&qword_100019528);
      char v15 = sub_100010D28();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

double sub_10000D7F8@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000D37C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000E610();
      uint64_t v9 = v11;
    }
    sub_100007CA0(*(void *)(v9 + 48) + 40 * v6);
    sub_100007C90((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_10000E01C(v6, v9);
    *uint64_t v3 = v9;
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

uint64_t sub_10000D8F4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007BE4(&qword_100019570);
  uint64_t v6 = sub_100010F28();
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
    uint64_t v22 = (void *)(v5 + 64);
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
      sub_100007C90((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10000D5F0(v25, (uint64_t)&v38);
      sub_100007D90(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_100010E38(*(void *)(v7 + 40));
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
    uint64_t result = (uint64_t)sub_100007C90(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000DC0C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100010C18();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100007BE4(&qword_100019540);
  int v46 = a2;
  uint64_t v10 = sub_100010F28();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  id v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  id v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  long long v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_10000EF38(&qword_100019520);
    uint64_t result = sub_100010D18();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

unint64_t sub_10000E01C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100010E28();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000D5F0(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = sub_100010E38(*(void *)(a2 + 40));
        uint64_t result = sub_100007CA0((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            unint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            int64_t v20 = (_OWORD *)(v19 + 32 * v3);
            unint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *int64_t v20 = *v21;
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
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *unint64_t v22 = v24 & v23;
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

_OWORD *sub_10000E1E8(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_10000D37C(a2);
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
      sub_10000E610();
      goto LABEL_7;
    }
    sub_10000D8F4(v13, a3 & 1);
    unint64_t v19 = sub_10000D37C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10000D5F0(a2, (uint64_t)v21);
      return sub_10000E4DC(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_100010F78();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_100010918((uint64_t)v17);

  return sub_100007C90(a1, v17);
}

void sub_10000E334(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_100010C18();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = (void *)*v3;
  unint64_t v14 = sub_10000D3C0(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    char v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_10000E7F8();
    goto LABEL_7;
  }
  sub_10000DC0C(v17, a3 & 1);
  unint64_t v22 = sub_10000D3C0(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_100010F78();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  char v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_10000E558(v14, (uint64_t)v11, a1, v20);
}

_OWORD *sub_10000E4DC(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_100007C90(a3, (_OWORD *)(a4[7] + 32 * a1));
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

uint64_t sub_10000E558(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_100010C18();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_10000E610()
{
  uint64_t v1 = v0;
  sub_100007BE4(&qword_100019570);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100010F18();
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
    sub_10000D5F0(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_100007D90(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_100007C90(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

id sub_10000E7F8()
{
  uint64_t v1 = sub_100010C18();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007BE4(&qword_100019540);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_100010F18();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

size_t sub_10000EA90(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_10000EAD0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000EAB0(char *a1, int64_t a2, char a3)
{
  size_t result = sub_10000ECA4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_10000EAD0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100007BE4(&qword_1000195A0);
  uint64_t v10 = *(void *)(sub_100010C68() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100010C68() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_10000ECA4(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100007BE4(&qword_100019500);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

double sub_10000EDAC()
{
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClass();
  double v1 = 0.0;
  if (v0)
  {
    uint64_t v2 = (char *)[v0 deviceOrientation];
    if ((unint64_t)(v2 - 2) <= 2) {
      return dbl_100011B08[(void)(v2 - 2)];
    }
  }
  return v1;
}

uint64_t sub_10000EE1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007BE4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000EE78()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000EEB0(void *a1)
{
  sub_10000A58C(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000EEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EEC8()
{
  return swift_release();
}

uint64_t sub_10000EED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007BE4(&qword_100019548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EF38(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100010C18();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000EF7C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  unsigned __int8 v6 = [a1 isPreview];
  *(unsigned char *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_isPreview) = v6;
  if (!UIAccessibilityIsReduceMotionEnabled()) {
    [a1 unlockProgress];
  }
  swift_beginAccess();
  sub_100010B78();
  swift_endAccess();
  [a1 backlightProgress];
  swift_beginAccess();
  sub_100010B98();
  swift_endAccess();
  double v7 = sub_10000EDAC();
  if (a2)
  {
    id v8 = [a2 animationSettings];
    if (v8)
    {
      uint64_t v9 = v8;
      [v8 duration];
    }
  }
  if (v7 == *(double *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle))
  {
    char v10 = sub_10000A998([a1 contents]);
    swift_unknownObjectRelease();
    if ((v10 & 1) == 0)
    {
      id v11 = [self blueColor];
      uint64_t v12 = *(void **)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
      *(void *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor) = v11;
      id v13 = v11;

      sub_10000917C();
      uint64_t v14 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor;
      [*(id *)(v3 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_editor) updateActions];
      [*(id *)(v3 + v14) updateLuminanceValuesForLooks];
    }
  }
  else
  {
    sub_100008B60(v7);
  }
}

void sub_10000F1B0()
{
  uint64_t v1 = OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_extendRenderSessionInvalidatable;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_extendRenderSessionInvalidatable);
  if (v2) {
    [v2 invalidate];
  }
  *(void *)(v0 + v1) = 0;
  swift_unknownObjectRelease();
  sub_10000A7D4();
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer);
  *(void *)(v0 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_renderer) = 0;
}

void sub_10000F218(uint64_t a1, void *a2)
{
  swift_getObjectType();
  double v4 = sub_10000EDAC();
  if (v4 != *(double *)(v2 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_rotationAngle))
  {
    if (a2)
    {
      id v5 = [a2 animationSettings];
      if (v5)
      {
        unsigned __int8 v6 = v5;
        [v5 duration];
      }
    }
    sub_100008B60(v4);
  }
}

void *sub_10000F2DC()
{
  uint64_t v43 = sub_100010C18();
  uint64_t v1 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100010C68();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v10 = (char *)v35 - v9;
  uint64_t v11 = sub_100010BE8();
  int64_t v12 = *(void *)(v11 + 16);
  uint64_t v44 = v3;
  uint64_t v37 = v1;
  if (v12)
  {
    BOOL v36 = v8;
    id v42 = (void (*)(char *, char *, uint64_t))v4;
    uint64_t v45 = _swiftEmptyArrayStorage;
    int64_t v41 = v0;
    sub_10000EA90(0, v12, 0);
    id v13 = v45;
    uint64_t v14 = *(void (***)(char *, uint64_t))(v1 + 16);
    uint64_t v15 = *(unsigned __int8 *)(v1 + 80);
    v35[1] = v11;
    uint64_t v16 = v11 + ((v15 + 32) & ~v15);
    uint64_t v39 = (void (**)(char *, uint64_t))OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor;
    uint64_t v40 = v14;
    uint64_t v38 = *(char **)(v1 + 72);
    uint64_t v17 = v43;
    do
    {
      uint64_t v18 = v5;
      int64_t v19 = *(void (**)(char *, uint64_t))((char *)v39 + (void)v41);
      ((void (*)(char *, uint64_t, uint64_t))v40)(v3, v16, v17);
      id v20 = v19;
      sub_100010C48();
      uint64_t v45 = v13;
      unint64_t v22 = v13[2];
      unint64_t v21 = v13[3];
      if (v22 >= v21 >> 1)
      {
        sub_10000EA90(v21 > 1, v22 + 1, 1);
        uint64_t v17 = v43;
        id v13 = v45;
      }
      v13[2] = v22 + 1;
      uint64_t v5 = v18;
      (*(void (**)(unint64_t, char *, void))(v18 + 32))((unint64_t)v13+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(void *)(v18 + 72) * v22, v10, v42);
      v16 += (uint64_t)v38;
      --v12;
      uint64_t v3 = v44;
    }
    while (v12);
    swift_bridgeObjectRelease();

    uint64_t v4 = (uint64_t)v42;
    id v8 = v36;
    int64_t v23 = (char *)v13;
    uint64_t v24 = v13[2];
    if (v24) {
      goto LABEL_7;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  int64_t v23 = (char *)_swiftEmptyArrayStorage;
  uint64_t v24 = _swiftEmptyArrayStorage[2];
  if (!v24) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v45 = _swiftEmptyArrayStorage;
  int64_t v25 = v23;
  sub_100010EC8();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v26 = v5 + 16;
  uint64_t v28 = &v25[(*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64)];
  int64_t v41 = *(char **)(v26 + 56);
  id v42 = v27;
  uint64_t v40 = (void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v38 = v25;
  uint64_t v39 = (void (**)(char *, uint64_t))(v26 - 8);
  do
  {
    v42(v8, v28, v4);
    sub_100010C28();
    sub_100010C08();
    uint64_t v29 = v26;
    (*v40)(v3, v43);
    sub_10000CE5C();
    id v30 = objc_allocWithZone((Class)PREditingLook);
    NSString v31 = sub_100010D38();
    swift_bridgeObjectRelease();
    NSString v32 = sub_100010D38();
    swift_bridgeObjectRelease();
    [v30 initWithIdentifier:v31 displayName:v32];

    (*v39)(v8, v4);
    sub_100010EA8();
    sub_100010ED8();
    uint64_t v26 = v29;
    uint64_t v3 = v44;
    sub_100010EE8();
    sub_100010EB8();
    uint64_t v28 = &v41[(void)v28];
    --v24;
  }
  while (v24);
  unint64_t v33 = v45;
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t sub_10000F754()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", 35.0, 35.0);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  *(_OWORD *)(v2 + 24) = xmmword_100011A80;
  *(void *)(v2 + 40) = 0x403D000000000000;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_100010A04;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_100010A24;
  aBlock[5] = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B734;
  aBlock[3] = &unk_100014B48;
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  id v6 = [v1 imageWithActions:v4];
  _Block_release(v4);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    sub_100007CF4(0, (unint64_t *)&unk_100019588);
    id v8 = self;
    uint64_t v9 = (objc_class *)[v8 mainBundle];
    v20._countAndFlagsBits = 0x8000000100011EE0;
    v22._countAndFlagsBits = 0x695020726F6C6F43;
    v22._object = (void *)0xEC00000072656B63;
    v24.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v24.value._object = (void *)0xEB00000000656C62;
    v10.super.Class isa = v9;
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    sub_100010A98(v22, v24, v10, v26, v20);

    uint64_t v11 = *(void **)&v5[OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_colorPickerViewIdentifier];
    swift_allocObject();
    swift_unknownObjectWeakInit();
    id v12 = v6;
    id v13 = v11;
    id v14 = (id)sub_100010E18();
    uint64_t v15 = (objc_class *)objc_msgSend(v8, "mainBundle", 0);
    v23._countAndFlagsBits = 0x695020726F6C6F43;
    v23._object = (void *)0xEC00000072656B63;
    v25.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v25.value._object = (void *)0xEB00000000656C62;
    v16.super.Class isa = v15;
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_100010A98(v23, v25, v16, v27, (Swift::String)0x8000000100011EE0);

    NSString v17 = sub_100010D38();
    swift_bridgeObjectRelease();
    [v14 setAccessibilityLabel:v17];

    sub_100007BE4(&qword_1000192B0);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_100011610;
    *(void *)(v18 + 32) = v14;
    aBlock[0] = v18;
    sub_100010DB8();
    uint64_t v19 = aBlock[0];
    swift_release();

    return v19;
  }
  return result;
}

double sub_10000FB40(void *a1)
{
  uint64_t v3 = sub_100010BB8();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100010B18();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  __chkstk_darwin(v6);
  uint64_t v39 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100010C68();
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v37 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100007BE4((uint64_t *)&unk_100019510);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010C18();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  NSBundle v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v35 - v17;
  id v19 = [a1 identifier];
  sub_100010D68();

  sub_100010BF8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    unint64_t v21 = sub_100009B70((uint64_t)v18);
    if (v21)
    {
      Swift::String v22 = v21;
      [v21 bounds];
      if (CGRectGetMaxY(v43) > 0.0)
      {
        Swift::String v23 = *(void **)(v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
        id v24 = v23;
        Swift::String_optional v25 = v37;
        sub_100010C48();
        [v22 bounds];
        uint64_t v26 = v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_gradientOptions;
        swift_beginAccess();
        uint64_t v27 = v35;
        uint64_t v28 = v26;
        uint64_t v29 = v36;
        (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v5, v28, v36);
        id v30 = v39;
        sub_100010BC8();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v29);
        [v22 bounds];
        uint64_t v31 = sub_100010B08();
        if (v32)
        {
          double v20 = PREditingLookLuminanceUnknown;
        }
        else
        {
          double v33 = *(double *)&v31;

          double v20 = v33;
        }
        (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v42);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v40);
        goto LABEL_11;
      }
    }
    double v20 = PREditingLookLuminanceUnknown;
LABEL_11:
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    return v20;
  }
  sub_10000EE1C((uint64_t)v11, (uint64_t *)&unk_100019510);
  return PREditingLookLuminanceUnknown;
}

uint64_t sub_10001006C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = a3;
  uint64_t v42 = a2;
  uint64_t v4 = sub_100007BE4((uint64_t *)&unk_100019510);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100010C18();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v39 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v38 - v11;
  unint64_t v44 = sub_100008798((uint64_t)_swiftEmptyArrayStorage);
  id v13 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  v48[0] = 0;
  id v14 = [v13 loadUserInfoWithError:v48];
  swift_unknownObjectRelease();
  id v15 = v48[0];
  if (v14)
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_100010D08();

    unint64_t v44 = v16;
  }
  else
  {
    uint64_t v17 = v15;
    sub_100010AB8();

    swift_willThrow();
    swift_errorRelease();
  }
  uint64_t v18 = v42 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, v18, v7);
  uint64_t v19 = sub_100010C08();
  uint64_t v21 = v20;
  Swift::String v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v12, v7);
  id v40 = a1;
  id v23 = [a1 currentLook];
  id v24 = [v23 identifier];

  sub_100010D68();
  sub_100010BF8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000EE1C((uint64_t)v6, (uint64_t *)&unk_100019510);
  }
  else
  {
    swift_bridgeObjectRelease();
    Swift::String_optional v25 = v39;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v39, v6, v7);
    uint64_t v19 = sub_100010C08();
    uint64_t v21 = v26;
    v22(v25, v7);
  }
  *(void *)&long long v46 = 0x6F6C6F4365736162;
  *((void *)&v46 + 1) = 0xE900000000000072;
  sub_100010E58();
  id v27 = *(id *)(v42 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_baseColor);
  uint64_t v28 = sub_100010DF8();

  uint64_t v47 = (void *)sub_100007BE4(&qword_100019568);
  *(void *)&long long v46 = v28;
  sub_100007C90(&v46, v45);
  unint64_t v29 = v44;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v43 = v29;
  sub_10000E1E8(v45, (uint64_t)v48, isUniquelyReferenced_nonNull_native);
  unint64_t v31 = v43;
  swift_bridgeObjectRelease();
  sub_100007CA0((uint64_t)v48);
  *(void *)&long long v46 = 0x746E6169726176;
  *((void *)&v46 + 1) = 0xE700000000000000;
  sub_100010E58();
  uint64_t v47 = &type metadata for String;
  *(void *)&long long v46 = v19;
  *((void *)&v46 + 1) = v21;
  sub_100007C90(&v46, v45);
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v43 = v31;
  sub_10000E1E8(v45, (uint64_t)v48, v32);
  unint64_t v44 = v43;
  swift_bridgeObjectRelease();
  sub_100007CA0((uint64_t)v48);
  *(void *)&long long v46 = 0x546B6E616C427369;
  *((void *)&v46 + 1) = 0xEF6574616C706D65;
  sub_100010E58();
  sub_10000D7F8((uint64_t)v48, &v46);
  sub_100007CA0((uint64_t)v48);
  sub_10000EE1C((uint64_t)&v46, &qword_1000192C0);
  *(void *)&long long v46 = 0x6D614E726F6C6F63;
  *((void *)&v46 + 1) = 0xE900000000000065;
  sub_100010E58();
  sub_10000D7F8((uint64_t)v48, &v46);
  sub_100007CA0((uint64_t)v48);
  sub_10000EE1C((uint64_t)&v46, &qword_1000192C0);
  id v33 = objc_msgSend(objc_msgSend(v40, "environment"), "targetConfiguration");
  swift_unknownObjectRelease();
  Class isa = sub_100010CF8().super.isa;
  swift_bridgeObjectRelease();
  v48[0] = 0;
  LODWORD(v31) = [v33 storeUserInfo:isa error:v48];

  if (v31)
  {
    id v35 = v48[0];
  }
  else
  {
    id v36 = v48[0];
    sub_100010AB8();

    swift_willThrow();
    swift_errorRelease();
  }
  return (*(uint64_t (**)(void))(v41 + 16))();
}

uint64_t sub_1000106D8(void *a1)
{
  uint64_t v3 = sub_100007BE4((uint64_t *)&unk_100019510);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100010C18();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v16 - v11;
  id v13 = [a1 identifier];
  sub_100010D68();

  sub_100010BF8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    return sub_10000EE1C((uint64_t)v5, (uint64_t *)&unk_100019510);
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v15 = v1 + OBJC_IVAR____TtC23GradientPosterExtension24GradientPosterController_currentLookVariant;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v15, v10, v6);
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_100010918(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100010968(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007BE4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000109CC()
{
  return _swift_deallocObject(v0, 48, 7);
}

void sub_100010A04(void *a1)
{
  sub_10000B540(a1, *(void *)(v1 + 16), *(CGFloat *)(v1 + 24), *(CGFloat *)(v1 + 32), *(CGFloat *)(v1 + 40));
}

uint64_t sub_100010A14()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010A24()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100010A4C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100010A84()
{
}

uint64_t sub_100010A98(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100010AA8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100010AB8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100010AC8()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100010AD8()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100010AE8()
{
  return static Gradient.defaultGradientColors.getter();
}

uint64_t sub_100010AF8()
{
  return static Gradient.focusConfigs.getter();
}

uint64_t sub_100010B08()
{
  return Gradient.luminance(for:in:)();
}

uint64_t sub_100010B18()
{
  return type metadata accessor for Gradient();
}

uint64_t sub_100010B28()
{
  return dispatch thunk of GradientView.setupGradient(_:animated:)();
}

uint64_t sub_100010B38()
{
  return dispatch thunk of GradientView.updateGradientLayerRotationAngle(_:duration:)();
}

uint64_t sub_100010B48()
{
  return dispatch thunk of GradientView.wakeProgress.setter();
}

uint64_t sub_100010B58()
{
  return dispatch thunk of GradientView.rotationAngle.setter();
}

uint64_t sub_100010B68()
{
  return type metadata accessor for GradientView();
}

uint64_t sub_100010B78()
{
  return Look.GradientOptions.unlockProgress.setter();
}

uint64_t sub_100010B88()
{
  return Look.GradientOptions.backlightProgress.getter();
}

uint64_t sub_100010B98()
{
  return Look.GradientOptions.backlightProgress.setter();
}

uint64_t sub_100010BA8()
{
  return Look.GradientOptions.init()();
}

uint64_t sub_100010BB8()
{
  return type metadata accessor for Look.GradientOptions();
}

uint64_t sub_100010BC8()
{
  return Look.gradientIn(bounds:options:)();
}

uint64_t sub_100010BD8()
{
  return static Look.load(userInfo:bundle:)();
}

uint64_t sub_100010BE8()
{
  return static Look.Variant.allCases.getter();
}

uint64_t sub_100010BF8()
{
  return Look.Variant.init(rawValue:)();
}

uint64_t sub_100010C08()
{
  return Look.Variant.rawValue.getter();
}

uint64_t sub_100010C18()
{
  return type metadata accessor for Look.Variant();
}

uint64_t sub_100010C28()
{
  return Look.variant.getter();
}

uint64_t sub_100010C38()
{
  return Look.userInfo.getter();
}

uint64_t sub_100010C48()
{
  return Look.init(baseColor:variant:)();
}

uint64_t sub_100010C58()
{
  return Look.baseColor.getter();
}

uint64_t sub_100010C68()
{
  return type metadata accessor for Look();
}

uint64_t sub_100010C78()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100010C88()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100010C98()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100010CA8()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100010CB8()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100010CC8()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100010CD8()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100010CE8()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100010CF8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100010D08()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010D18()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100010D28()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100010D38()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100010D48()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100010D58()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100010D68()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010D78()
{
  return String.hash(into:)();
}

uint64_t sub_100010D88()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100010D98()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100010DA8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100010DB8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100010DC8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100010DD8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

void sub_100010DE8(UIView forView)
{
}

uint64_t sub_100010DF8()
{
  return UIColor.userInfo.getter();
}

uint64_t sub_100010E08()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100010E18()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100010E28()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100010E38(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100010E48()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100010E58()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100010E68()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100010E78()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100010E88()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100010E98()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100010EA8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100010EB8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100010EC8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100010ED8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100010EE8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100010EF8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100010F08()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100010F18()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100010F28()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100010F38()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100010F58()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100010F68()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100010F78()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100010F88()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100010F98()
{
  return Hasher._finalize()();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
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

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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