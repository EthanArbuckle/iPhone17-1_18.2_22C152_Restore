uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24E8BC1E4()
{
  sub_24E8BF690();
  MEMORY[0x270FA5388]();
  sub_24E8BF610();
  MEMORY[0x270FA5388]();
  uint64_t v0 = sub_24E8BF6A0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E8BF340();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F138], v0);
  sub_24E8BF600();
  v5[1] = MEMORY[0x263F8EE78];
  sub_24E8BF380(&qword_26B1C2868, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2858);
  sub_24E8BF3C8(&qword_26B1C2860, &qword_26B1C2858);
  sub_24E8BF6E0();
  uint64_t result = sub_24E8BF6C0();
  qword_26B1C2900 = result;
  return result;
}

uint64_t unsafeBlocking<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_24E8BC440, 0, 0);
}

{
  void *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_24E8BD070, 0, 0);
}

uint64_t sub_24E8BC440()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_24E8BC534;
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v6, 0, 0, 0xD000000000000012, 0x800000024E8BF9C0, sub_24E8BCAB4, v2, v5);
}

uint64_t sub_24E8BC534()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24E8BC670, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24E8BC670()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E8BC6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v6 = sub_24E8BF5F0();
  uint64_t v29 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24E8BF610();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388](v9);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269906FE0);
  uint64_t v12 = sub_24E8BF650();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12);
  v16 = (char *)v24 - v15;
  if (qword_26B1C28F8 != -1) {
    swift_once();
  }
  v24[1] = qword_26B1C2900;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, v12);
  unint64_t v17 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v19 + v17, v16, v12);
  v20 = (void *)(v19 + v18);
  uint64_t v21 = v26;
  void *v20 = v25;
  v20[1] = v21;
  aBlock[4] = sub_24E8BF4E0;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E8BD008;
  aBlock[3] = &block_descriptor_24;
  v22 = _Block_copy(aBlock);
  swift_retain();
  sub_24E8BF600();
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_24E8BF380(&qword_26B1C2840, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2848);
  sub_24E8BF3C8(&qword_26B1C2850, &qword_26B1C2848);
  sub_24E8BF6E0();
  MEMORY[0x253343820](0, v11, v8, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return swift_release();
}

uint64_t sub_24E8BCAB4(uint64_t a1)
{
  return sub_24E8BC6D4(a1, v1[3], v1[4], v1[2]);
}

uint64_t sub_24E8BCAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269906FE0);
  uint64_t v7 = sub_24E8BF710();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v13[-v9];
  uint64_t v14 = a4;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  sub_24E8BCC18((void (*)(unsigned char *))sub_24E8BF59C, (uint64_t)&v13[-v9]);
  uint64_t v11 = sub_24E8BF650();
  sub_24E8BCDCC((uint64_t)v10, v11);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24E8BCC18@<X0>(void (*a1)(unsigned char *)@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388]();
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_24E8BF710();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = &v11[-v8];
  a1(v5);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v7 + 32))(a2, v9, v6);
}

uint64_t sub_24E8BCDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E8BF710();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_24E8BF630();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_24E8BF640();
  }
}

uint64_t sub_24E8BD008(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24E8BD070()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_24E8BD164;
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2318](v6, 0, 0, 0xD000000000000012, 0x800000024E8BF9C0, sub_24E8BD64C, v2, v5);
}

uint64_t sub_24E8BD164()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E8BD274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v6 = sub_24E8BF5F0();
  uint64_t v29 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24E8BF610();
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24E8BF650();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v24 - v15;
  if (qword_26B1C28F8 != -1) {
    swift_once();
  }
  v24[1] = qword_26B1C2900;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, v12);
  unint64_t v17 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v19 + v17, v16, v12);
  v20 = (void *)(v19 + v18);
  uint64_t v21 = v26;
  void *v20 = v25;
  v20[1] = v21;
  aBlock[4] = sub_24E8BF22C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E8BD008;
  aBlock[3] = &block_descriptor;
  v22 = _Block_copy(aBlock);
  swift_retain();
  sub_24E8BF600();
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_24E8BF380(&qword_26B1C2840, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2848);
  sub_24E8BF3C8(&qword_26B1C2850, &qword_26B1C2848);
  sub_24E8BF6E0();
  MEMORY[0x253343820](0, v11, v8, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return swift_release();
}

uint64_t sub_24E8BD64C(uint64_t a1)
{
  return sub_24E8BD274(a1, v1[3], v1[4], v1[2]);
}

uint64_t sub_24E8BD658(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  v2(v1);
  sub_24E8BF650();
  return sub_24E8BF640();
}

uint64_t UnsafeSendableBox.contents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = sub_24E8BF6D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UnsafeSendableBox.contents.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 88);
  swift_beginAccess();
  uint64_t v4 = sub_24E8BF6D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*UnsafeSendableBox.contents.modify())()
{
  return j__swift_endAccess;
}

uint64_t UnsafeSendableBox.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 56))(v0 + *(void *)(*(void *)v0 + 88), 1, 1);
  return v0;
}

uint64_t UnsafeSendableBox.init()()
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 56))(v0 + *(void *)(*(void *)v0 + 88), 1, 1);
  return v0;
}

uint64_t UnsafeSendableBox.deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_24E8BF6D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t UnsafeSendableBox.__deallocating_deinit()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_24E8BF6D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void unsafeFromAsyncTask<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v23 = a1;
  uint64_t v6 = sub_24E8BF6D0();
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2830);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E8BF5E0();
  type metadata accessor for UnsafeSendableBox();
  uint64_t v12 = UnsafeSendableBox.__allocating_init()();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2838);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 1;
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  uint64_t v15 = sub_24E8BF670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v14;
  v16[5] = v12;
  v16[6] = v23;
  v16[7] = a2;
  v16[8] = v13;
  unint64_t v17 = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24E8BE4B4((uint64_t)v11, (uint64_t)&unk_269906FB8, (uint64_t)v16);
  swift_release();
  sub_24E8BF680();
  swift_beginAccess();
  if (*(void *)(v13 + 16) >= 2uLL)
  {
    MEMORY[0x253343990](*(void *)(v13 + 16));
    swift_willThrow();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v18 = v12 + *(void *)(*(void *)v12 + 88);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v8, v18, v22);
    uint64_t v19 = *(void *)(a3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v8, 1, a3) == 1)
    {
      __break(1u);
    }
    else
    {
      swift_release();
      swift_release();

      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v20, v8, a3);
    }
  }
}

uint64_t type metadata accessor for UnsafeSendableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E8BDE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a5;
  v8[10] = a8;
  v8[8] = a4;
  v8[11] = *(void *)(*(void *)a5 + 80);
  uint64_t v10 = sub_24E8BF6D0();
  v8[12] = v10;
  v8[13] = *(void *)(v10 - 8);
  uint64_t v11 = swift_task_alloc();
  v8[14] = v11;
  uint64_t v14 = (uint64_t (*)(uint64_t))((char *)a6 + *a6);
  uint64_t v12 = (void *)swift_task_alloc();
  v8[15] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_24E8BDFF4;
  return v14(v11);
}

uint64_t sub_24E8BDFF4()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E8BE218;
  }
  else {
    uint64_t v2 = sub_24E8BE108;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E8BE108()
{
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 72);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(*(void *)(v0 + 88) - 8) + 56))(v1, 0, 1);
  uint64_t v5 = v4 + *(void *)(*(void *)v4 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(v5, v1, v3);
  swift_endAccess();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24E8BE218()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 80);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v2 + 16) = v1;
  sub_24E8BF160(v3);
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24E8BE2AC()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24E8BE304()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = (int *)v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24E8BE3C0;
  return sub_24E8BDE94((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_24E8BE3C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E8BE4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E8BF670();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E8BF660();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E8BEE3C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E8BF620();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t unsafeFromAsyncTask<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v7 = sub_24E8BF6D0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2830);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E8BF5E0();
  type metadata accessor for UnsafeSendableBox();
  uint64_t v14 = UnsafeSendableBox.__allocating_init()();
  uint64_t v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  uint64_t v16 = sub_24E8BF670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  unint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v14;
  v17[5] = a1;
  v17[6] = a2;
  v17[7] = v15;
  swift_retain();
  swift_retain();
  uint64_t v18 = v15;
  sub_24E8BE4B4((uint64_t)v13, (uint64_t)&unk_269906FC8, (uint64_t)v17);
  swift_release();
  sub_24E8BF680();
  uint64_t v19 = v14 + *(void *)(*(void *)v14 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v19, v7);
  uint64_t v20 = *(void *)(a3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v10, 1, a3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    swift_release();

    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v22, v10, a3);
  }
  return result;
}

uint64_t sub_24E8BE918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a4;
  v7[6] = a7;
  v7[7] = *(void *)(*(void *)a4 + 80);
  uint64_t v9 = sub_24E8BF6D0();
  v7[8] = v9;
  v7[9] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v7[10] = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a5 + *a5);
  uint64_t v11 = (void *)swift_task_alloc();
  v7[11] = v11;
  void *v11 = v7;
  v11[1] = sub_24E8BEA74;
  return v13(v10);
}

uint64_t sub_24E8BEA74()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E8BEB70, 0, 0);
}

uint64_t sub_24E8BEB70()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0[7] - 8) + 56))(v1, 0, 1);
  uint64_t v6 = v5 + *(void *)(*(void *)v5 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(v6, v1, v3);
  swift_endAccess();
  dispatch_group_leave(v4);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24E8BEC7C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E8BECCC()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = (int *)v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24E8BF5DC;
  return sub_24E8BE918((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_24E8BED7C()
{
  uint64_t result = sub_24E8BF6D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for UnsafeSendableBox(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UnsafeSendableBox);
}

uint64_t dispatch thunk of UnsafeSendableBox.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_24E8BEE3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2830);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E8BEE9C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E8BEF78;
  return v6(a1);
}

uint64_t sub_24E8BEF78()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E8BF070()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E8BF0A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E8BE3C0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269906FD0 + dword_269906FD0);
  return v6(a1, v4);
}

uint64_t sub_24E8BF160(uint64_t result)
{
  if (result != 1) {
    JUMPOUT(0x253343980);
  }
  return result;
}

uint64_t sub_24E8BF170()
{
  uint64_t v1 = sub_24E8BF650();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24E8BF22C()
{
  uint64_t v1 = *(void *)(sub_24E8BF650() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_24E8BD658(v2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_24E8BF340()
{
  unint64_t result = qword_26B1C2870;
  if (!qword_26B1C2870)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1C2870);
  }
  return result;
}

uint64_t sub_24E8BF380(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E8BF3C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E8BF418()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269906FE0);
  uint64_t v1 = sub_24E8BF650();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24E8BF4E0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269906FE0);
  uint64_t v2 = *(void *)(sub_24E8BF650() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  return sub_24E8BCAC0(v4, v6, v7, v1);
}

uint64_t sub_24E8BF59C(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 24))();
  if (v2) {
    *a1 = v2;
  }
  return result;
}

uint64_t sub_24E8BF5E0()
{
  return MEMORY[0x270F28D68]();
}

uint64_t sub_24E8BF5F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24E8BF600()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24E8BF610()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24E8BF620()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E8BF630()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24E8BF640()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24E8BF650()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24E8BF660()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E8BF670()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E8BF680()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_24E8BF690()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24E8BF6A0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24E8BF6B0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24E8BF6C0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24E8BF6D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24E8BF6E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24E8BF710()
{
  return MEMORY[0x270F9FCF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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