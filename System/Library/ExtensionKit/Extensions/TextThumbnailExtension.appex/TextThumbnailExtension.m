uint64_t sub_1000042F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(unint64_t, char *, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  sub_100006EC0();
  ((void (*)(void))__chkstk_darwin)();
  v0 = sub_100006E10();
  v1 = *(void *)(v0 - 8);
  v2 = v1;
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v15 - v6;
  sub_100006E50();
  sub_100006E00();
  sub_100006E90();
  sub_100006E00();
  sub_100005CBC(&qword_10000C2A0);
  v8 = *(void *)(v1 + 72);
  v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100007640;
  v11 = v10 + v9;
  v12 = *(void (**)(unint64_t, char *, uint64_t))(v2 + 16);
  v12(v11, v7, v0);
  v12(v11 + v8, v5, v0);
  sub_100006E30();
  swift_bridgeObjectRelease();
  v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v5, v0);
  return ((uint64_t (*)(char *, uint64_t))v13)(v7, v0);
}

uint64_t sub_100004530(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_100006DD0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_100006EC0();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v5 = (void *)swift_task_alloc();
  v2[11] = v5;
  void *v5 = v2;
  v5[1] = sub_100004690;
  return ThumbnailRequest.data.getter();
}

uint64_t sub_100004690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[12] = a1;
  v4[13] = a2;
  v4[14] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_1000047F0, 0, 0);
  }
}

uint64_t sub_1000047F0()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = sub_1000060FC((void *)v0[12], v0[13]);
  if (v1)
  {
    sub_1000069F8(v0[12], v0[13]);
  }
  else
  {
    uint64_t v5 = (uint64_t)v2;
    unint64_t v6 = v3;
    uint64_t v24 = v0[10];
    uint64_t v7 = v0[7];
    uint64_t v25 = v0[9];
    uint64_t v26 = v0[8];
    uint64_t v9 = v0[5];
    uint64_t v8 = v0[6];
    uint64_t v10 = v0[4];
    uint64_t v27 = v10;
    sub_1000069F8(v0[12], v0[13]);
    sub_100006ABC(v5, v6);
    sub_100006E60();
    sub_100006DF0();
    sub_100006DC0();
    double v12 = v11;
    double v14 = v13;
    v15 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v15(v7, v10);
    sub_100006DF0();
    int v16 = sub_100006DB0();
    v15(v8, v10);
    BOOL v17 = v16 != 0;
    id v18 = objc_allocWithZone((Class)QLTextThumbnailRenderer);
    Class isa = sub_100006D10().super.isa;
    Class v20 = sub_100006E70().super.isa;
    id v21 = objc_msgSend(v18, "initWithData:contentType:stringEncoding:maxSize:iconMode:", isa, v20, 4, v17, v12, v14);

    sub_1000069F8(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    sub_100006DF0();
    [v21 contextSize];
    *(void *)(swift_allocObject() + 16) = v21;
    id v22 = v21;
    sub_100006D70();
    swift_release();
    sub_100006D60();

    sub_1000069F8(v5, v6);
    v15(v7, v27);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100004AD0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_100006DD0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_100006EC0();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  sub_100005CBC(&qword_10000C2A8);
  v2[11] = swift_task_alloc();
  uint64_t v5 = sub_100006D00();
  v2[12] = v5;
  v2[13] = *(void *)(v5 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  return _swift_task_switch(sub_100004C98, 0, 0);
}

uint64_t sub_100004C98()
{
  if (sub_100006D90())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[16] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_100004DAC;
    uint64_t v2 = v0[15];
    return ThumbnailRequest.fileURL.getter(v2);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[18] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_10000523C;
    return ThumbnailRequest.data.getter();
  }
}

uint64_t sub_100004DAC()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000056B0;
  }
  else {
    uint64_t v2 = sub_100004EC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004EC0()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v32 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v5 = v0[8];
  uint64_t v26 = v0[14];
  uint64_t v27 = v0[7];
  uint64_t v29 = v0[6];
  uint64_t v30 = v5;
  uint64_t v33 = v0[9];
  uint64_t v34 = v0[5];
  uint64_t v28 = v0[4];
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
  v6(v3, v1, v2);
  uint64_t v7 = v2;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v3, 0, 1, v2);
  sub_100006D80();
  sub_100006484(v3, v4);
  v31 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
  v31(v4, v5);
  sub_100006998(v3);
  v6(v26, v1, v2);
  sub_100006D80();
  sub_100006DF0();
  sub_100006DC0();
  double v9 = v8;
  double v11 = v10;
  double v12 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  v12(v27, v28);
  sub_100006DF0();
  LODWORD(v2) = sub_100006DB0();
  v12(v29, v28);
  BOOL v13 = v2 != 0;
  id v14 = objc_allocWithZone((Class)QLTextThumbnailRenderer);
  sub_100006CF0(v15);
  BOOL v17 = v16;
  Class isa = sub_100006E70().super.isa;
  id v19 = objc_msgSend(v14, "initWithURL:contentType:stringEncoding:maxSize:iconMode:", v17, isa, 0, v13, v9, v11);

  v31(v4, v30);
  Class v20 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  v20(v26, v7);
  uint64_t v21 = v0[7];
  uint64_t v22 = v0[4];
  v20(v0[15], v0[12]);
  sub_100006DF0();
  [v19 contextSize];
  *(void *)(swift_allocObject() + 16) = v19;
  id v23 = v19;
  sub_100006D70();
  swift_release();
  sub_100006D60();

  v12(v21, v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_10000523C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    double v8 = *(uint64_t (**)(void))(v7 + 8);
    return v8();
  }
  else
  {
    *(void *)(v6 + 152) = a2;
    *(void *)(v6 + 160) = a1;
    return _swift_task_switch(sub_1000053C8, 0, 0);
  }
}

uint64_t sub_1000053C8()
{
  unint64_t v25 = v0[19];
  uint64_t v26 = v0[20];
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v7 = v0[5];
  uint64_t v24 = v0[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[13] + 56))(v1, 1, 1, v0[12]);
  sub_100006D80();
  sub_100006484(v1, v2);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v27(v2, v4);
  sub_100006998(v1);
  sub_100006D80();
  sub_100006DF0();
  sub_100006DC0();
  double v9 = v8;
  double v11 = v10;
  double v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v12(v5, v24);
  sub_100006DF0();
  int v13 = sub_100006DB0();
  v12(v6, v24);
  BOOL v14 = v13 != 0;
  id v15 = objc_allocWithZone((Class)QLTextThumbnailRenderer);
  Class isa = sub_100006D10().super.isa;
  Class v17 = sub_100006E70().super.isa;
  id v18 = objc_msgSend(v15, "initWithData:contentType:stringEncoding:maxSize:iconMode:", isa, v17, 0, v14, v9, v11);

  sub_1000069F8(v26, v25);
  uint64_t v19 = v0[7];
  uint64_t v20 = v0[4];
  v27(v0[10], v0[8]);
  sub_100006DF0();
  [v18 contextSize];
  *(void *)(swift_allocObject() + 16) = v18;
  id v21 = v18;
  sub_100006D70();
  swift_release();
  sub_100006D60();

  v12(v19, v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_1000056B0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_100005754()
{
  unint64_t result = sub_10000577C((uint64_t)&off_100008528);
  qword_10000C3F0 = result;
  return result;
}

unint64_t sub_10000577C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005CBC(&qword_10000C2B0);
  uint64_t v2 = (void *)sub_100006F30();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100005F94(v5, v6, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100006018);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v11 = (uint64_t *)(v2[6] + 16 * result);
    *double v11 = v5;
    v11[1] = v6;
    double v12 = (void *)(v2[7] + 16 * result);
    *double v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t sub_1000058B4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_100006D30();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a3 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_100006ABC(a2, a3);
      sub_100006ABC(a2, a3);
      break;
    default:
      break;
  }
  swift_bridgeObjectRetain();
  sub_100006D40();
  sub_1000069F8(a2, a3);
  sub_100006C1C((unint64_t *)&unk_10000C2D0, (void (*)(uint64_t))&type metadata accessor for Data.Iterator);
  unint64_t v10 = 0;
  while (1)
  {
    sub_100006F10();
    if (v15[15]) {
      break;
    }
    unint64_t v11 = *(void *)(a1 + 16);
    if (v10 == v11)
    {
      (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
      swift_bridgeObjectRelease();
      return 1;
    }
    if (v10 >= v11)
    {
      __break(1u);
      goto LABEL_16;
    }
    uint64_t v12 = a1 + v10++;
    if (v15[14] != *(unsigned __int8 *)(v12 + 32))
    {
      (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  unint64_t v13 = *(void *)(a1 + 16);
  swift_bridgeObjectRelease();
  if (v13 == v10) {
    return 1;
  }
  if (v10 >= v13)
  {
LABEL_16:
    __break(1u);
    JUMPOUT(0x100005AF0);
  }
  return 0;
}

uint64_t sub_100005B04(uint64_t a1)
{
  unint64_t v2 = sub_100005C68();

  return ThumbnailExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005BB0()
{
  unint64_t result = qword_10000C280;
  if (!qword_10000C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C280);
  }
  return result;
}

ValueMetadata *type metadata accessor for TextThumbnailExtension()
{
  return &type metadata for TextThumbnailExtension;
}

uint64_t sub_100005C18()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005C68()
{
  unint64_t result = qword_10000C288;
  if (!qword_10000C288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C288);
  }
  return result;
}

uint64_t sub_100005CBC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005D00(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005CBC(&qword_10000C2C0);
  uint64_t v2 = sub_100006F30();
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
    sub_100006BA8(v6, (uint64_t)&v15, &qword_10000C2C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100005F94(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100005E4C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100006C0C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100005E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_100006F50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_100006F50() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_100006F50()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_100005F94(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  sub_100006F60();
  sub_100006EE0();
  Swift::Int v5 = sub_100006F70();

  return a3(a1, a2, v5);
}

unint64_t sub_100006018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100006F50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100006F50() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1000060FC(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_100006CA0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100006CB0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_1000058B4((uint64_t)&off_100008500, (uint64_t)a1, a2) & 1) == 0)
  {
    sub_100006ABC((uint64_t)a1, a2);
    return a1;
  }
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v9) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_18:
        __break(1u);
      }
      uint64_t v9 = (int)v9;
LABEL_7:
      if (v9 >= 5242880)
      {
        sub_100006C90();
        sub_100005D00((uint64_t)&_swiftEmptyArrayStorage);
        sub_100006C1C(&qword_10000C2B8, (void (*)(uint64_t))&type metadata accessor for CocoaError);
        sub_100006CC0();
        a1 = v8;
        sub_100006C80();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        goto LABEL_14;
      }
LABEL_8:
      BOOL v13 = self;
      Class isa = sub_100006D10().super.isa;
      id v21 = 0;
      a1 = [v13 propertyListWithData:isa options:0 format:0 error:&v21];

      id v15 = v21;
      if (!a1)
      {
        uint64_t v19 = v15;
        sub_100006CD0();

LABEL_14:
        swift_willThrow();
        return a1;
      }
      sub_100006F20();
      swift_unknownObjectRelease();
      sub_100006B14(v22, v22[3]);
      uint64_t v16 = sub_100006F40();
      id v21 = 0;
      id v17 = [v13 dataWithPropertyList:v16 format:100 options:0 error:&v21];
      swift_unknownObjectRelease();
      id v18 = v21;
      if (v17)
      {
        a1 = (void *)sub_100006D20();
      }
      else
      {
        a1 = v18;
        sub_100006CD0();

        swift_willThrow();
      }
      sub_100006B58((uint64_t)v22);
      return a1;
    case 2uLL:
      uint64_t v11 = a1[2];
      uint64_t v10 = a1[3];
      BOOL v12 = __OFSUB__(v10, v11);
      uint64_t v9 = v10 - v11;
      if (!v12) {
        goto LABEL_7;
      }
      goto LABEL_18;
    default:
      goto LABEL_8;
  }
}

uint64_t sub_100006484(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_100006EC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v44 - v9;
  __chkstk_darwin(v8);
  BOOL v12 = (char *)&v44 - v11;
  uint64_t v13 = sub_100005CBC(&qword_10000C2A8);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006BA8(a1, (uint64_t)v15, &qword_10000C2A8);
  uint64_t v16 = sub_100006D00();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_100006998((uint64_t)v15);
  }
  else
  {
    uint64_t v18 = sub_100006CE0();
    unint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v16);
    uint64_t v21 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0) {
      uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
    }
    if (v21)
    {
      uint64_t v45 = v18;
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v45 = 0;
  unint64_t v20 = 0;
LABEL_9:
  uint64_t v22 = v46;
  id v23 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v23(v12, v46, v3);
  if (!v20)
  {
    uint64_t v24 = sub_100006E80();
    uint64_t v22 = v46;
    uint64_t v45 = v24;
    unint64_t v20 = v25;
  }
  uint64_t v26 = *(void (**)(char *, uint64_t))(v4 + 8);
  v26(v12, v3);
  sub_100006E40();
  uint64_t v27 = v22;
  char v28 = sub_100006EB0();
  v26(v10, v3);
  v23(v7, v27, v3);
  if (v28)
  {
    sub_100006EA0();
    char v29 = sub_100006EB0();
    v26(v10, v3);
    v26(v7, v3);
    if ((v29 & 1) == 0)
    {
      if (v20)
      {
        uint64_t v30 = v45;
        if (sub_100006EF0() <= 4)
        {
          uint64_t v47 = 46;
          unint64_t v48 = 0xE100000000000000;
          v49._countAndFlagsBits = v30;
          v49._object = (void *)v20;
          sub_100006F00(v49);
          swift_bridgeObjectRelease();
          uint64_t v31 = v47;
          uint64_t v32 = v48;
          if (qword_10000C2E0 != -1) {
            swift_once();
          }
          swift_beginAccess();
          uint64_t v33 = qword_10000C3F0;
          uint64_t v34 = *(void *)(qword_10000C3F0 + 16);
          swift_bridgeObjectRetain();
          if (v34)
          {
            uint64_t v35 = sub_100005F94(v31, v32, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100006018);
            if (v36)
            {
              uint64_t v31 = *(void *)(*(void *)(v33 + 56) + 16 * v35);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
            }
          }
          swift_endAccess();
          swift_bridgeObjectRelease();
          return v31;
        }
        swift_bridgeObjectRelease();
      }
      return 0;
    }
  }
  else
  {
    v26(v7, v3);
  }
  if (qword_10000C2E0 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_100006ED0();
  uint64_t v39 = v38;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v40 = qword_10000C3F0;
  if (*(void *)(qword_10000C3F0 + 16)
    && (uint64_t v41 = sub_100005F94(v37, v39, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100006018),
        (v42 & 1) != 0))
  {
    uint64_t v31 = *(void *)(*(void *)(v40 + 56) + 16 * v41);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v31 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v31;
}

uint64_t sub_100006998(uint64_t a1)
{
  uint64_t v2 = sub_100005CBC(&qword_10000C2A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000069F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006A50()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100006A88()
{
  return [*(id *)(v0 + 16) draw];
}

uint64_t sub_100006ABC(uint64_t a1, unint64_t a2)
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

void *sub_100006B14(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006B58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006BA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005CBC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006C0C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006C1C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100006C68()
{
  return sub_100006A88();
}

uint64_t sub_100006C80()
{
  return CocoaError._nsError.getter();
}

uint64_t sub_100006C90()
{
  return static CocoaError.Code.fileReadTooLarge.getter();
}

uint64_t sub_100006CA0()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_100006CB0()
{
  return type metadata accessor for CocoaError();
}

uint64_t sub_100006CC0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_100006CD0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100006CE0()
{
  return URL.pathExtension.getter();
}

void sub_100006CF0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006D00()
{
  return type metadata accessor for URL();
}

NSData sub_100006D10()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100006D20()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006D30()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t sub_100006D40()
{
  return Data.Iterator.init(_:at:)();
}

uint64_t sub_100006D50()
{
  return static AppExtension.main()();
}

uint64_t sub_100006D60()
{
  return ThumbnailReply.extensionBadge.setter();
}

uint64_t sub_100006D70()
{
  return static ThumbnailReply.currentContextRenderer(size:renderer:)();
}

uint64_t sub_100006D80()
{
  return ThumbnailRequest.contentType.getter();
}

uint64_t sub_100006D90()
{
  return ThumbnailRequest.isFileBacked.getter();
}

uint64_t sub_100006DB0()
{
  return ThumbnailRequest.Options.iconFlavor.getter();
}

uint64_t sub_100006DC0()
{
  return ThumbnailRequest.Options.maximumSize.getter();
}

uint64_t sub_100006DD0()
{
  return type metadata accessor for ThumbnailRequest.Options();
}

uint64_t sub_100006DF0()
{
  return ThumbnailRequest.options.getter();
}

uint64_t sub_100006E00()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_100006E10()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_100006E30()
{
  return static ThumbnailProviderBuilder.buildBlock(_:)();
}

uint64_t sub_100006E40()
{
  return static UTType.sourceCode.getter();
}

uint64_t sub_100006E50()
{
  return static UTType.propertyList.getter();
}

uint64_t sub_100006E60()
{
  return static UTType.utf8PlainText.getter();
}

UTType sub_100006E70()
{
  return UTType._bridgeToObjectiveC()();
}

uint64_t sub_100006E80()
{
  return UTType.preferredFilenameExtension.getter();
}

uint64_t sub_100006E90()
{
  return static UTType.item.getter();
}

uint64_t sub_100006EA0()
{
  return static UTType.script.getter();
}

uint64_t sub_100006EB0()
{
  return UTType.conforms(to:)();
}

uint64_t sub_100006EC0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100006ED0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100006EE0()
{
  return String.hash(into:)();
}

uint64_t sub_100006EF0()
{
  return String.count.getter();
}

void sub_100006F00(Swift::String a1)
{
}

uint64_t sub_100006F10()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_100006F20()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100006F30()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006F40()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100006F50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006F60()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006F70()
{
  return Hasher._finalize()();
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t QLGuessEncodingForTextFileAtURL()
{
  return _QLGuessEncodingForTextFileAtURL();
}

uint64_t QLGuessEncodingForTextFileFromData()
{
  return _QLGuessEncodingForTextFileFromData();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

void UIRectFill(CGRect rect)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend__readingOptionsFromContentType_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readingOptionsFromContentType:encoding:");
}

id objc_msgSend_attributedString(void *a1, const char *a2, ...)
{
  return _[a1 attributedString];
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_contextSize(void *a1, const char *a2, ...)
{
  return _[a1 contextSize];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_initWithData_options_documentAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:options:documentAttributes:error:");
}

id objc_msgSend_initWithURL_options_documentAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:options:documentAttributes:error:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_monospacedSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monospacedSystemFontOfSize:weight:");
}

id objc_msgSend_mutableAttributedStringForThumbnailWithData_contentType_documentAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableAttributedStringForThumbnailWithData:contentType:documentAttributes:error:");
}

id objc_msgSend_mutableAttributedStringForThumbnailWithURL_contentType_documentAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableAttributedStringForThumbnailWithURL:contentType:documentAttributes:error:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_paperSize(void *a1, const char *a2, ...)
{
  return _[a1 paperSize];
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:range:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_textDocumentTypeFromContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textDocumentTypeFromContentType:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}