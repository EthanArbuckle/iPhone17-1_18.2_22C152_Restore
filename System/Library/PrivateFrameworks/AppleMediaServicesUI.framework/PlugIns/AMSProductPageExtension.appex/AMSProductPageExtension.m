double sub_100003A50@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  long long v7[2];
  uint64_t v8;
  unsigned char v9[32];
  void v10[3];
  uint64_t v11;
  uint64_t v12;
  uint64_t vars8;

  if (sub_100003B68(a1))
  {
    sub_10000478C(a1, (uint64_t)a2);
  }
  else
  {
    sub_10000478C(a1, (uint64_t)v9);
    sub_1000046E4(&qword_10000C6E0);
    if (swift_dynamicCast())
    {
      sub_1000047E8(v7, (uint64_t)v10);
      v5 = v11;
      v6 = v12;
      sub_100004800(v10, v11);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      sub_100004844((uint64_t)v10);
    }
    else
    {
      v8 = 0;
      memset(v7, 0, sizeof(v7));
      sub_10000490C((uint64_t)v7, &qword_10000C7C0);
      result = 0.0;
      *a2 = 0u;
      a2[1] = 0u;
    }
  }
  return result;
}

uint64_t sub_100003B68(uint64_t a1)
{
  sub_10000478C(a1, (uint64_t)v4);
  if ((swift_dynamicCast() & 1) == 0
    && (swift_dynamicCast() & 1) == 0
    && (swift_dynamicCast() & 1) == 0
    && (swift_dynamicCast() & 1) == 0)
  {
    sub_100004894();
    if (swift_dynamicCast())
    {
    }
    else
    {
      if (!swift_dynamicCast())
      {
        uint64_t v1 = 0;
        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = 1;
LABEL_10:
  sub_100004844((uint64_t)v4);
  return v1;
}

uint64_t sub_100003C98@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  v2 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    v5 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_25;
  }
  uint64_t v4 = a1 + 32;
  swift_bridgeObjectRetain();
  v5 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    sub_10000478C(v4, (uint64_t)v21);
    v18[3] = (char *)&type metadata for Any + 8;
    v18[0] = swift_allocObject();
    sub_10000478C((uint64_t)v21, v18[0] + 16);
    sub_10000478C((uint64_t)v18, (uint64_t)&v15);
    if ((swift_dynamicCast() & 1) != 0
      || (swift_dynamicCast() & 1) != 0
      || (swift_dynamicCast() & 1) != 0
      || (swift_dynamicCast() & 1) != 0)
    {
      goto LABEL_11;
    }
    sub_100004894();
    if (swift_dynamicCast())
    {

LABEL_11:
      sub_100004844((uint64_t)&v15);
      sub_10000478C((uint64_t)v18, (uint64_t)&v19);
      goto LABEL_12;
    }
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_100004844((uint64_t)&v15);
    sub_10000478C((uint64_t)v18, (uint64_t)v14);
    sub_1000046E4(&qword_10000C6E0);
    if (swift_dynamicCast())
    {
      sub_1000047E8(v12, (uint64_t)&v15);
      uint64_t v9 = v16;
      uint64_t v8 = v17;
      sub_100004800(&v15, v16);
      (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v8 + 8))(&v19, v9, v8);
      sub_100004844((uint64_t)&v15);
    }
    else
    {
      uint64_t v13 = 0;
      memset(v12, 0, sizeof(v12));
      sub_10000490C((uint64_t)v12, &qword_10000C7C0);
      long long v19 = 0u;
      long long v20 = 0u;
    }
LABEL_12:
    sub_100004844((uint64_t)v18);
    sub_100004844((uint64_t)v21);
    if (*((void *)&v20 + 1))
    {
      sub_100004968(&v19, &v15);
      sub_100004968(&v15, v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v5 = sub_100004978(0, *((void *)v5 + 2) + 1, 1, v5);
      }
      unint64_t v7 = *((void *)v5 + 2);
      unint64_t v6 = *((void *)v5 + 3);
      if (v7 >= v6 >> 1) {
        v5 = sub_100004978((char *)(v6 > 1), v7 + 1, 1, v5);
      }
      *((void *)v5 + 2) = v7 + 1;
      sub_100004968(v12, &v5[32 * v7 + 32]);
    }
    else
    {
      sub_10000490C((uint64_t)&v19, &qword_10000C6F0);
    }
    v4 += 32;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  v2 = a2;
LABEL_25:
  uint64_t result = sub_1000046E4(&qword_10000C6E8);
  v2[3] = (char *)result;
  *v2 = v5;
  return result;
}

uint64_t sub_100003FEC@<X0>(uint64_t *a1@<X8>)
{
  sub_100006CE0();
  swift_getWitnessTable();
  uint64_t v2 = sub_100006CB0();
  uint64_t result = sub_1000046E4(&qword_10000C6E8);
  a1[3] = result;
  *a1 = v2;
  return result;
}

uint64_t sub_10000409C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  sub_100006CE0();
  v8[3] = a2;
  unint64_t v6 = sub_100004728(v8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(v6, a1, a2);
  sub_100003A50((uint64_t)v8, a3);
  return sub_100004844((uint64_t)v8);
}

uint64_t sub_100004150@<X0>(uint64_t *a1@<X8>)
{
  return sub_100003FEC(a1);
}

uint64_t sub_100004160@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = sub_1000046E4(&qword_10000C6D8);
  sub_100006C80();
  swift_getWitnessTable();
  return sub_100006CC0();
}

uint64_t sub_10000423C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v32 = a1;
  uint64_t v30 = a5;
  uint64_t v8 = swift_getTupleTypeMetadata2() - 8;
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v29 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - v11;
  uint64_t v13 = *(int *)(v8 + 56);
  v14 = (char *)&v24 + v13 - v11;
  v31 = v14;
  uint64_t v26 = a2;
  uint64_t v15 = a2 + v13;
  uint64_t v36 = *(void *)(a3 - 8);
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  v25((char *)&v24 - v11, a2, a3);
  uint64_t v27 = *(void *)(a4 - 8);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  v16(v14, v15, a4);
  sub_100006D40();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v36 + 8);
  v36 += 8;
  v28 = v17;
  v17(v12, a3);
  sub_100006C80();
  uint64_t v18 = *(int *)(v8 + 56);
  long long v19 = v29;
  long long v20 = &v29[v18];
  v25(v29, v26, a3);
  v16(v20, v15, a4);
  v33[3] = a4;
  v21 = sub_100004728(v33);
  uint64_t v22 = v27;
  (*(void (**)(uint64_t *, char *, uint64_t))(v27 + 32))(v21, v20, a4);
  sub_100003A50((uint64_t)v33, v34);
  sub_100004844((uint64_t)v33);
  v28(v19, a3);
  sub_1000057C0((uint64_t)v34, (uint64_t)v35);
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v31, a4);
}

uint64_t sub_1000044FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004160(a1);
}

uint64_t sub_100004510@<X0>(void *a1@<X8>)
{
  sub_100006CD0();
  uint64_t result = sub_1000046E4(&qword_10000C6E8);
  a1[3] = result;
  *a1 = &_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_1000045A8@<X0>(void *a1@<X8>)
{
  return sub_100004510(a1);
}

uint64_t sub_1000045CC@<X0>(uint64_t *a1@<X8>)
{
  sub_100006C50();
  uint64_t v2 = sub_100006C70();
  uint64_t result = sub_1000046E4(&qword_10000C6D8);
  a1[3] = result;
  *a1 = v2;
  return result;
}

uint64_t sub_1000046A0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000045CC(a1);
}

uint64_t sub_1000046C4(uint64_t a1, uint64_t a2)
{
  return sub_10000423C(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_1000046E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100004728(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000478C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000047E8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_100004800(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004844(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100004894()
{
  unint64_t result = qword_10000C7B0;
  if (!qword_10000C7B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C7B0);
  }
  return result;
}

uint64_t sub_1000048D4()
{
  sub_100004844(v0 + 16);
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000490C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000046E4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_100004968(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

char *sub_100004978(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000046E4(&qword_10000C6F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100004A80@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_10000409C(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100004A9C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v68 = a2;
  a2[3] = sub_1000046E4(&qword_10000C6D8);
  sub_100006B54(a1, v89);
  uint64_t v72 = v89[0];
  uint64_t v73 = v89[3];
  uint64_t v69 = v89[1];
  int64_t v70 = (unint64_t)(v89[2] + 64) >> 6;
  unint64_t v3 = v89[4];
  v71 = &__src[40];
  swift_bridgeObjectRetain();
  uint64_t v4 = &_swiftEmptyDictionarySingleton;
  if (!v3) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v5 = __clz(__rbit64(v3));
  v3 &= v3 - 1;
  unint64_t v6 = v5 | (v73 << 6);
  while (1)
  {
    sub_100006A20(*(void *)(v72 + 48) + 40 * v6, (uint64_t)__src);
    sub_10000478C(*(void *)(v72 + 56) + 32 * v6, (uint64_t)v71);
    memcpy(__dst, __src, sizeof(__dst));
    sub_100006A20((uint64_t)__dst, (uint64_t)v85);
    sub_10000478C((uint64_t)&__dst[40], (uint64_t)v86);
    sub_100006A20((uint64_t)v85, (uint64_t)v81);
    sub_100006D10();
    sub_100006524((uint64_t)v85);
    sub_100006A20((uint64_t)__dst, (uint64_t)v81);
    sub_10000478C((uint64_t)&__dst[40], (uint64_t)v82);
    v83[3] = (char *)&type metadata for Any + 8;
    v83[0] = swift_allocObject();
    sub_100004968(v82, (_OWORD *)(v83[0] + 16));
    sub_10000478C((uint64_t)v83, (uint64_t)v78);
    uint64_t v14 = swift_dynamicCast();
    if (v14) {
      goto LABEL_33;
    }
    sub_100006BC4(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v68, v69, v70, (uint64_t)v71, v72, v73, v74);
    uint64_t v22 = swift_dynamicCast();
    if (v22) {
      goto LABEL_33;
    }
    sub_100006BC4(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)v68, v69, v70, (uint64_t)v71, v72, v73, v74);
    uint64_t v30 = swift_dynamicCast();
    if (v30) {
      goto LABEL_33;
    }
    sub_100006BC4(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v68, v69, v70, (uint64_t)v71, v72, v73, v74);
    if (swift_dynamicCast()) {
      goto LABEL_33;
    }
    unint64_t v38 = sub_100004894();
    sub_100006BC4(v38, v39, v40, v38, v41, v42, v43, v44, (uint64_t)v68, v69, v70, (uint64_t)v71, v72, v73, v74);
    uint64_t v45 = swift_dynamicCast();
    if (v45)
    {

LABEL_33:
      sub_100004844((uint64_t)v78);
      sub_10000478C((uint64_t)v83, (uint64_t)&v74);
      goto LABEL_34;
    }
    sub_100006BC4(v45, v46, v47, v48, v49, v50, v51, v52, (uint64_t)v68, v69, v70, (uint64_t)v71, v72, v73, v74);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      goto LABEL_33;
    }
    sub_100004844((uint64_t)v78);
    sub_10000478C((uint64_t)v83, (uint64_t)v77);
    sub_1000046E4(&qword_10000C6E0);
    if (swift_dynamicCast())
    {
      sub_1000047E8(&v74, (uint64_t)v78);
      uint64_t v65 = v79;
      uint64_t v66 = v80;
      sub_100004800(v78, v79);
      (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v66 + 8))(&v74, v65, v66);
      sub_100004844((uint64_t)v78);
    }
    else
    {
      uint64_t v76 = 0;
      long long v74 = 0u;
      long long v75 = 0u;
      sub_10000490C((uint64_t)&v74, &qword_10000C7C0);
      long long v74 = 0u;
      long long v75 = 0u;
    }
LABEL_34:
    sub_100004844((uint64_t)v83);
    sub_100006524((uint64_t)v81);
    if (!*((void *)&v75 + 1))
    {
      sub_10000490C((uint64_t)&v74, &qword_10000C6F0);
      swift_bridgeObjectRetain();
      unint64_t v60 = sub_100006760((uint64_t)v84);
      char v62 = v61;
      swift_bridgeObjectRelease();
      if (v62)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v78[0] = v4;
        sub_1000046E4(&qword_10000C7D0);
        sub_100006BEC();
        uint64_t v4 = (void *)v78[0];
        sub_100006524(*(void *)(v78[0] + 48) + 40 * v60);
        sub_100004968((_OWORD *)(v4[7] + 32 * v60), v81);
        sub_100006D30();
        swift_bridgeObjectRelease();
      }
      else
      {
        memset(v81, 0, sizeof(v81));
      }
      sub_100006524((uint64_t)v84);
      sub_10000490C((uint64_t)v81, &qword_10000C6F0);
      goto LABEL_48;
    }
    sub_100004968(&v74, v81);
    swift_isUniquelyReferenced_nonNull_native();
    v78[0] = v4;
    unint64_t v53 = sub_100006760((uint64_t)v84);
    if (__OFADD__(v4[2], (v54 & 1) == 0)) {
      break;
    }
    unint64_t v55 = v53;
    char v56 = v54;
    sub_1000046E4(&qword_10000C7D0);
    if (sub_100006BEC())
    {
      unint64_t v57 = sub_100006760((uint64_t)v84);
      if ((v56 & 1) != (v58 & 1)) {
        goto LABEL_57;
      }
      unint64_t v55 = v57;
    }
    uint64_t v4 = (void *)v78[0];
    if (v56)
    {
      v59 = (_OWORD *)(*(void *)(v78[0] + 56) + 32 * v55);
      sub_100004844((uint64_t)v59);
      sub_100004968(v81, v59);
    }
    else
    {
      *(void *)(v78[0] + 8 * (v55 >> 6) + 64) |= 1 << v55;
      sub_100006A20((uint64_t)v84, v4[6] + 40 * v55);
      sub_100004968(v81, (_OWORD *)(v4[7] + 32 * v55));
      uint64_t v63 = v4[2];
      BOOL v11 = __OFADD__(v63, 1);
      uint64_t v64 = v63 + 1;
      if (v11) {
        goto LABEL_56;
      }
      v4[2] = v64;
    }
    swift_bridgeObjectRelease();
    sub_100006524((uint64_t)v84);
LABEL_48:
    sub_100004844((uint64_t)v86);
    sub_10000490C((uint64_t)__dst, &qword_10000C7D8);
    if (v3) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v7 = v73 + 1;
    if (__OFADD__(v73, 1)) {
      goto LABEL_55;
    }
    if (v7 >= v70) {
      goto LABEL_53;
    }
    unint64_t v8 = *(void *)(v69 + 8 * v7);
    uint64_t v9 = v73 + 1;
    if (!v8)
    {
      sub_100006BE0();
      if (v10 == v11) {
        goto LABEL_53;
      }
      sub_100006BD4();
      if (!v8)
      {
        sub_100006BE0();
        if (v10 == v11) {
          goto LABEL_53;
        }
        sub_100006BD4();
        if (!v8)
        {
          sub_100006BE0();
          if (v10 == v11) {
            goto LABEL_53;
          }
          sub_100006BD4();
          if (!v8)
          {
            sub_100006BE0();
            if (v10 == v11) {
              goto LABEL_53;
            }
            sub_100006BD4();
            if (!v8)
            {
              uint64_t v9 = v12 + 5;
              if (v12 + 5 >= v70) {
                goto LABEL_53;
              }
              unint64_t v8 = *(void *)(v69 + 8 * v9);
              if (!v8)
              {
                int64_t v13 = v73 + 7;
                while (v13 < v70)
                {
                  unint64_t v8 = *(void *)(v69 + 8 * v13++);
                  if (v8)
                  {
                    uint64_t v9 = v13 - 1;
                    goto LABEL_24;
                  }
                }
LABEL_53:
                uint64_t result = swift_release();
                void *v68 = v4;
                return result;
              }
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v3 = (v8 - 1) & v8;
    unint64_t v6 = __clz(__rbit64(v8)) + (v9 << 6);
    uint64_t v73 = v9;
  }
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  uint64_t result = sub_100006D60();
  __break(1u);
  return result;
}

uint64_t sub_1000050FC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  a2[3] = sub_1000046E4(&qword_10000C6D8);
  sub_100006B54(a1, v63);
  int64_t v3 = v63[3];
  unint64_t v4 = v63[4];
  uint64_t v42 = v63[1];
  int64_t v43 = (unint64_t)(v63[2] + 64) >> 6;
  uint64_t v44 = v63[0];
  unint64_t v5 = &v58;
  swift_bridgeObjectRetain();
  unint64_t v6 = &_swiftEmptyDictionarySingleton;
  if (!v4) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v7 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  unint64_t v8 = v7 | (v3 << 6);
  while (1)
  {
    int64_t v13 = (uint64_t *)(*(void *)(v44 + 48) + 16 * v8);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    sub_10000478C(*(void *)(v44 + 56) + 32 * v8, (uint64_t)v62);
    *(void *)&long long v61 = v15;
    *((void *)&v61 + 1) = v14;
    long long v59 = v61;
    v60[0] = v62[0];
    v60[1] = v62[1];
    long long v16 = v61;
    uint64_t v56 = v15;
    uint64_t v57 = v14;
    sub_10000478C((uint64_t)v60, (uint64_t)v5);
    long long v52 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100006D10();
    long long v52 = v16;
    sub_10000478C((uint64_t)v60, (uint64_t)v53);
    v54[3] = (char *)&type metadata for Any + 8;
    v54[0] = swift_allocObject();
    sub_100004968(v53, (_OWORD *)(v54[0] + 16));
    sub_10000478C((uint64_t)v54, (uint64_t)v49);
    swift_bridgeObjectRetain();
    if ((swift_dynamicCast() & 1) != 0
      || (swift_dynamicCast() & 1) != 0
      || (swift_dynamicCast() & 1) != 0
      || (swift_dynamicCast() & 1) != 0)
    {
      goto LABEL_29;
    }
    sub_100004894();
    if (swift_dynamicCast())
    {

LABEL_29:
      sub_100004844((uint64_t)v49);
      sub_10000478C((uint64_t)v54, (uint64_t)&v45);
      goto LABEL_30;
    }
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      goto LABEL_29;
    }
    sub_100004844((uint64_t)v49);
    sub_10000478C((uint64_t)v54, (uint64_t)v48);
    sub_1000046E4(&qword_10000C6E0);
    if (swift_dynamicCast())
    {
      sub_1000047E8(&v45, (uint64_t)v49);
      uint64_t v38 = v50;
      uint64_t v39 = v51;
      sub_100004800(v49, v50);
      (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v39 + 8))(&v45, v38, v39);
      sub_100004844((uint64_t)v49);
    }
    else
    {
      uint64_t v47 = 0;
      long long v45 = 0u;
      long long v46 = 0u;
      sub_10000490C((uint64_t)&v45, &qword_10000C7C0);
      long long v45 = 0u;
      long long v46 = 0u;
    }
LABEL_30:
    sub_100004844((uint64_t)v54);
    swift_bridgeObjectRelease();
    if (!*((void *)&v46 + 1))
    {
      sub_10000490C((uint64_t)&v45, &qword_10000C6F0);
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_100006760((uint64_t)v55);
      char v32 = v31;
      swift_bridgeObjectRelease();
      if (v32)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v49[0] = v6;
        Swift::Int v34 = v6[3];
        sub_1000046E4(&qword_10000C7D0);
        sub_100006D20(isUniquelyReferenced_nonNull_native, v34);
        unint64_t v6 = (void *)v49[0];
        sub_100006524(*(void *)(v49[0] + 48) + 40 * v30);
        sub_100004968((_OWORD *)(v6[7] + 32 * v30), &v52);
        sub_100006D30();
        swift_bridgeObjectRelease();
      }
      else
      {
        long long v52 = 0u;
        v53[0] = 0u;
      }
      sub_100006524((uint64_t)v55);
      sub_10000490C((uint64_t)&v52, &qword_10000C6F0);
      goto LABEL_44;
    }
    uint64_t v17 = v5;
    uint64_t v18 = v3;
    sub_100004968(&v45, &v52);
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    v49[0] = v6;
    unint64_t v20 = sub_100006760((uint64_t)v55);
    uint64_t v22 = v6[2];
    BOOL v23 = (v21 & 1) == 0;
    Swift::Int v24 = v22 + v23;
    if (__OFADD__(v22, v23)) {
      break;
    }
    unint64_t v25 = v20;
    char v26 = v21;
    sub_1000046E4(&qword_10000C7D0);
    if (sub_100006D20(v19, v24))
    {
      unint64_t v27 = sub_100006760((uint64_t)v55);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_53;
      }
      unint64_t v25 = v27;
    }
    unint64_t v6 = (void *)v49[0];
    if (v26)
    {
      uint64_t v29 = (_OWORD *)(*(void *)(v49[0] + 56) + 32 * v25);
      sub_100004844((uint64_t)v29);
      sub_100004968(&v52, v29);
    }
    else
    {
      *(void *)(v49[0] + 8 * (v25 >> 6) + 64) |= 1 << v25;
      sub_100006A20((uint64_t)v55, v6[6] + 40 * v25);
      sub_100004968(&v52, (_OWORD *)(v6[7] + 32 * v25));
      uint64_t v35 = v6[2];
      BOOL v36 = __OFADD__(v35, 1);
      uint64_t v37 = v35 + 1;
      if (v36) {
        goto LABEL_52;
      }
      v6[2] = v37;
    }
    swift_bridgeObjectRelease();
    sub_100006524((uint64_t)v55);
    int64_t v3 = v18;
    unint64_t v5 = v17;
LABEL_44:
    sub_100004844((uint64_t)v5);
    sub_10000490C((uint64_t)&v59, &qword_10000C7C8);
    if (v4) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_51;
    }
    if (v9 >= v43) {
      goto LABEL_49;
    }
    unint64_t v10 = *(void *)(v42 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v43) {
        goto LABEL_49;
      }
      unint64_t v10 = *(void *)(v42 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v43) {
          goto LABEL_49;
        }
        unint64_t v10 = *(void *)(v42 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v3 + 4;
          if (v3 + 4 >= v43) {
            goto LABEL_49;
          }
          unint64_t v10 = *(void *)(v42 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v3 + 5;
            if (v3 + 5 >= v43) {
              goto LABEL_49;
            }
            unint64_t v10 = *(void *)(v42 + 8 * v11);
            if (!v10)
            {
              int64_t v11 = v3 + 6;
              if (v3 + 6 >= v43) {
                goto LABEL_49;
              }
              unint64_t v10 = *(void *)(v42 + 8 * v11);
              if (!v10)
              {
                int64_t v12 = v3 + 7;
                while (v12 < v43)
                {
                  unint64_t v10 = *(void *)(v42 + 8 * v12++);
                  if (v10)
                  {
                    int64_t v11 = v12 - 1;
                    goto LABEL_20;
                  }
                }
LABEL_49:
                uint64_t result = swift_release();
                *a2 = v6;
                return result;
              }
            }
          }
        }
      }
    }
LABEL_20:
    unint64_t v4 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    int64_t v3 = v11;
  }
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t result = sub_100006D60();
  __break(1u);
  return result;
}

uint64_t sub_1000057C0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_100004968((_OWORD *)a1, v4);
    sub_1000066E0(v4, a2);
    return sub_100006524(a2);
  }
  else
  {
    sub_10000490C(a1, &qword_10000C6F0);
    sub_1000065B0(a2, v4);
    sub_100006524(a2);
    return sub_10000490C((uint64_t)v4, &qword_10000C6F0);
  }
}

void sub_100005848(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    [v2 willMoveToParentViewController:0];
    id v3 = [v2 view];
    if (!v3)
    {
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    unint64_t v4 = v3;
    [v3 removeFromSuperview];

    [v2 removeFromParentViewController];
  }
  unint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC23AMSProductPageExtension25ProductPageViewController_child];
  if (!v5) {
    return;
  }
  id v10 = v5;
  objc_msgSend(v1, "addChildViewController:");
  id v6 = [v1 view];
  if (!v6) {
    goto LABEL_12;
  }
  unint64_t v7 = v6;
  id v8 = [v10 view];
  if (!v8)
  {
LABEL_13:
    __break(1u);
    return;
  }
  int64_t v9 = v8;
  [v7 addSubview:v8];

  [v10 didMoveToParentViewController:v1];
}

void sub_10000599C(void *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC23AMSProductPageExtension25ProductPageViewController_child);
  *(void *)(v1 + OBJC_IVAR____TtC23AMSProductPageExtension25ProductPageViewController_child) = a1;
  id v3 = a1;
  sub_100005848(v2);
}

void sub_1000059F8()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for ProductPageViewController();
  objc_msgSendSuper2(&v4, "loadView");
  id v1 = [v0 view];
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(self, "ams_primaryBackground");
    [v2 setBackgroundColor:v3];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100005AE0(void *a1, uint64_t a2)
{
  return 0;
}

void sub_100005B84()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for ProductPageViewController();
  objc_msgSendSuper2(&v14, "viewWillLayoutSubviews");
  id v1 = *(void **)&v0[OBJC_IVAR____TtC23AMSProductPageExtension25ProductPageViewController_child];
  if (v1)
  {
    id v2 = [v1 view];
    if (v2)
    {
      id v3 = v2;
      id v4 = [v0 view];
      if (v4)
      {
        unint64_t v5 = v4;
        [v4 bounds];
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;

        objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_100005CB4(void *a1, uint64_t a2)
{
  id v5 = [self createBagForSubProfile];
  if (v5)
  {
    double v6 = v5;
    if (qword_10000C6D0 != -1) {
      swift_once();
    }
    id v17 = [v6 URLForKey:qword_10000C700];
    id v7 = [objc_allocWithZone((Class)AMSUIDynamicViewController) initWithBag:v6 bagValue:v17];
    sub_1000046E4((uint64_t *)&unk_10000C7A0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000071B0;
    sub_100006D10();
    id v9 = [a1 itemDictionary];
    long long v16 = v6;
    uint64_t v10 = sub_100006C60();

    sub_100004A9C(v10, (void *)(inited + 72));
    swift_bridgeObjectRelease();
    strcpy((char *)&aBlock, "pageParameters");
    sub_100006D10();
    sub_1000050FC(a2, (void *)(inited + 144));
    uint64_t v11 = sub_100006C70();
    sub_100006A7C(v11, v7);
    [v7 setDelegate:v2];
    id v12 = [v7 preload];
    uint64_t v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    char v21 = sub_100006B34;
    uint64_t v22 = v13;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    char v19 = sub_1000060D4;
    unint64_t v20 = &unk_1000084B8;
    objc_super v14 = _Block_copy(&aBlock);
    swift_release();
    [v12 addFinishBlock:v14];
    _Block_release(v14);

    id v15 = v7;
    sub_10000599C(v7);
  }
  else
  {
    __break(1u);
  }
}

void sub_100005FEC()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    [Strong loadDidFinish];
  }
}

id sub_100006048(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC23AMSProductPageExtension25ProductPageViewController_child] = 0;
  if (a2)
  {
    NSString v5 = sub_100006C90();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ProductPageViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void sub_1000060D4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_1000061AC(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC23AMSProductPageExtension25ProductPageViewController_child] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ProductPageViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100006230()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProductPageViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProductPageViewController()
{
  return self;
}

uint64_t sub_100006298(uint64_t a1, void *a2)
{
  v7._countAndFlagsBits = a1;
  v3._rawValue = &off_1000083D8;
  v7._object = a2;
  Swift::Int v4 = sub_100006D50(v3, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

void sub_1000062EC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = sub_10000633C(a2);
    if ((v4 & 1) == 0)
    {
      [v2 finishWithResult:v3 completion:0];
    }
  }
}

uint64_t sub_10000633C(uint64_t a1)
{
  sub_100006D10();
  sub_1000064C0((uint64_t)v4, a1, &v5);
  sub_100006524((uint64_t)v4);
  if (v6)
  {
    if (swift_dynamicCast())
    {
      int v2 = sub_100006298(0x6E6F69746361, (void *)0xE600000000000000);
      if (v2 != 2) {
        return ~(2 * v2) & 2;
      }
    }
  }
  else
  {
    sub_10000490C((uint64_t)&v5, &qword_10000C6F0);
  }
  return 0;
}

double sub_1000064C0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100006760(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_10000478C(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_100006524(uint64_t a1)
{
  return a1;
}

NSString sub_100006578()
{
  NSString result = sub_100006C90();
  qword_10000C700 = (uint64_t)result;
  return result;
}

double sub_1000065B0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100006760(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v9 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_1000046E4(&qword_10000C7D0);
    sub_100006D20(isUniquelyReferenced_nonNull_native, v10);
    sub_100006524(*(void *)(v12 + 48) + 40 * v6);
    sub_100004968((_OWORD *)(*(void *)(v12 + 56) + 32 * v6), a2);
    sub_100006D30();
    uint64_t *v3 = v12;
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

uint64_t sub_1000066E0(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *int v2 = 0x8000000000000000;
  sub_1000067A4(a1, a2, isUniquelyReferenced_nonNull_native);
  *int v2 = v7;
  return swift_bridgeObjectRelease();
}

unint64_t sub_100006760(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100006CF0(*(void *)(v2 + 40));
  return sub_100006958(a1, v4);
}

_OWORD *sub_1000067A4(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  objc_super v8 = (void *)*v3;
  unint64_t v9 = sub_100006760(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_1000046E4(&qword_10000C7D0);
  if (!sub_100006D20(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_100006760(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    double result = (_OWORD *)sub_100006D60();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    char v19 = (_OWORD *)(v18[7] + 32 * v14);
    sub_100004844((uint64_t)v19);
    return sub_100004968(a1, v19);
  }
  else
  {
    sub_100006A20(a2, (uint64_t)v21);
    return sub_1000068DC(v14, (uint64_t)v21, a1, v18);
  }
}

_OWORD *sub_1000068DC(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = sub_100004968(a3, (_OWORD *)(a4[7] + 32 * a1));
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

unint64_t sub_100006958(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100006A20(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100006D00();
      sub_100006524((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100006A20(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100006A7C(uint64_t a1, void *a2)
{
  Class isa = sub_100006C40().super.isa;
  swift_bridgeObjectRelease();
  [a2 setClientOptions:isa];
}

uint64_t sub_100006AFC()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006B34()
{
}

uint64_t sub_100006B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006B4C()
{
  return swift_release();
}

uint64_t sub_100006B54@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_100006B8C()
{
  sub_100004844(v0 + 16);
  return _swift_deallocObject(v0, 48, 7);
}

char *sub_100006BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  return &a15;
}

BOOL sub_100006BEC()
{
  return sub_100006D20(v1, v0);
}

uint64_t sub_100006C0C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

NSDictionary sub_100006C40()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100006C50()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100006C60()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006C70()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100006C80()
{
  return type metadata accessor for Dictionary();
}

NSString sub_100006C90()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006CA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006CB0()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t sub_100006CC0()
{
  return Sequence.reduce<A>(into:_:)();
}

uint64_t sub_100006CD0()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100006CE0()
{
  return type metadata accessor for Array();
}

Swift::Int sub_100006CF0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100006D00()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100006D10()
{
  return AnyHashable.init<A>(_:)();
}

BOOL sub_100006D20(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_100006D30()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_100006D40()
{
  return _convertToAnyHashable<A>(_:)();
}

Swift::Int sub_100006D50(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006D60()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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