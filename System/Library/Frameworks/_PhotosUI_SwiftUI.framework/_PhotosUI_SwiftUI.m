uint64_t View._photosSharedAlbumsView(isPresented:posting:preselecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_217B419DC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_217B4180C);
}

{
  return sub_217B419DC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_217B41AE4);
}

__n128 sub_217B4180C@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unsigned __int8 a3@<W2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE30);
  sub_217B5F790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE40);
  sub_217B5F830();
  __n128 result = v20;
  a9->n128_u64[0] = a7;
  a9->n128_u64[1] = a8;
  a9[1].n128_u64[0] = a4;
  a9[1].n128_u64[1] = a5;
  a9[2].n128_u64[0] = a6;
  a9[2].n128_u64[1] = v19;
  a9[3] = v20;
  a9[4].n128_u64[0] = a1;
  a9[4].n128_u64[1] = a2;
  a9[5].n128_u8[0] = a3;
  a9[5].n128_u64[1] = v19;
  a9[6].n128_u64[0] = v20.n128_u64[0];
  return result;
}

uint64_t sub_217B418E8(uint64_t a1)
{
  v2 = *(void **)(a1 + 88);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return a1;
}

uint64_t sub_217B419DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  a11(__src, a1, a2, a3, a4, a5, a6, a7, a8);
  memcpy(__dst, __src, sizeof(__dst));
  MEMORY[0x21D455950](__dst, a9, &type metadata for _PostToSharedAlbumModifer, a10);
  return sub_217B418E8((uint64_t)__src);
}

__n128 sub_217B41AE4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE30);
  sub_217B5F790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F830();
  __n128 result = v20;
  *(void *)a9 = a7;
  *(void *)(a9 + 8) = a8;
  *(void *)(a9 + 16) = v19;
  *(__n128 *)(a9 + 24) = v20;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a1;
  *(void *)(a9 + 72) = a2;
  *(unsigned char *)(a9 + 80) = a3;
  *(void *)(a9 + 88) = v19;
  *(void *)(a9 + 96) = v20.n128_u64[0];
  return result;
}

uint64_t sub_217B41BC4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD10);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_217B5F840();
  uint64_t v9 = v8;
  long long v17 = *(_OWORD *)(v1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD18);
  sub_217B5F7C0();
  long long v16 = v18;
  uint64_t v10 = v19;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD20);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v6, a1, v11);
  v12 = &v6[*(int *)(v4 + 36)];
  *(_OWORD *)v12 = v16;
  *((void *)v12 + 2) = v10;
  *((void *)v12 + 3) = v7;
  *((void *)v12 + 4) = v9;
  long long v18 = *(_OWORD *)(v2 + 64);
  LOBYTE(v19) = *(unsigned char *)(v2 + 80);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD28);
  MEMORY[0x21D4559D0](&v17, v13);
  LOBYTE(v18) = v17;
  uint64_t v14 = swift_allocObject();
  memcpy((void *)(v14 + 16), (const void *)v2, 0x68uLL);
  sub_217B47160(v2);
  sub_217B4721C();
  sub_217B5F780();
  swift_release();
  return sub_217B487D8((uint64_t)v6, &qword_267BABD10);
}

uint64_t sub_217B41DB4(uint64_t a1, unsigned char *a2, const void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD50);
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a2 == 1)
  {
    uint64_t v8 = sub_217B5FC60();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
    sub_217B5FC40();
    sub_217B47160((uint64_t)a3);
    uint64_t v9 = sub_217B5FC30();
    uint64_t v10 = (void *)swift_allocObject();
    uint64_t v11 = MEMORY[0x263F8F500];
    v10[2] = v9;
    v10[3] = v11;
    memcpy(v10 + 4, a3, 0x68uLL);
    sub_217B438C8((uint64_t)v7, (uint64_t)&unk_267BABD60, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_217B41EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[31] = a4;
  sub_217B5FC40();
  v4[32] = sub_217B5FC30();
  uint64_t v6 = sub_217B5FBF0();
  v4[33] = v6;
  v4[34] = v5;
  return MEMORY[0x270FA2498](sub_217B41F60, v6, v5);
}

uint64_t sub_217B41F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_33();
  uint64_t v13 = *(void **)(v10 + 248);
  uint64_t v14 = v13[2];
  *(void *)(v10 + 280) = v14;
  uint64_t v15 = v13[3];
  *(void *)(v10 + 288) = v15;
  uint64_t v16 = v13[4];
  *(void *)(v10 + 112) = v14;
  *(void *)(v10 + 296) = v16;
  *(void *)(v10 + 120) = v15;
  *(void *)(v10 + 128) = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD68);
  *(void *)(v10 + 304) = v17;
  MEMORY[0x21D4559D0]();
  uint64_t v18 = *(void *)(*(void *)(v10 + 200) + 16);
  swift_bridgeObjectRelease();
  if (v18)
  {
    *(void *)(v10 + 160) = v14;
    *(void *)(v10 + 168) = v15;
    *(void *)(v10 + 176) = v16;
    MEMORY[0x21D4559D0](v17);
    *(void *)(v10 + 312) = *(void *)(v10 + 192);
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v10 + 320) = v19;
    *uint64_t v19 = v10;
    v19[1] = sub_217B4223C;
    OUTLINED_FUNCTION_3();
    return sub_217B42594(v20);
  }
  else
  {
    uint64_t v23 = *(void *)(v10 + 248);
    uint64_t v24 = *(void *)(v23 + 56);
    *(_OWORD *)(v10 + 64) = *(_OWORD *)(v23 + 40);
    *(void *)(v10 + 80) = v24;
    uint64_t v25 = *(void *)(v23 + 56);
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(v23 + 40);
    *(void *)(v10 + 56) = v25;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD78);
    MEMORY[0x21D4559D0]();
    unint64_t v27 = *(void *)(v10 + 216);
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_217B5FDB0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v28)
    {
      *(_OWORD *)(v10 + 16) = *(_OWORD *)(v10 + 64);
      *(void *)(v10 + 32) = *(void *)(v10 + 80);
      MEMORY[0x21D4559D0](v26);
      *(void *)(v10 + 328) = *(void *)(v10 + 232);
      v29 = (void *)swift_task_alloc();
      *(void *)(v10 + 336) = v29;
      void *v29 = v10;
      v29[1] = sub_217B42440;
      OUTLINED_FUNCTION_3();
      return sub_217B433F4(v30);
    }
    else
    {
      swift_release();
      OUTLINED_FUNCTION_7();
      swift_retain();
      sub_217B475AC(v10 + 64);
      MEMORY[0x21D4559D0](v26);
      swift_bridgeObjectRelease();
      *(void *)(v10 + 88) = v12;
      *(void *)(v10 + 96) = v15;
      *(void *)(v10 + 104) = v11;
      *(void *)(v10 + 208) = MEMORY[0x263F8EE78];
      sub_217B5F800();
      sub_217B475D8(0);
      swift_release();
      sub_217B47604(v10 + 64);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_3();
      return v33(v32, v33, v34, v35, v36, v37, v38, v39, a9, a10);
    }
  }
}

uint64_t sub_217B4223C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  OUTLINED_FUNCTION_4();
  void *v3 = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v1 + 272);
  uint64_t v5 = *(void *)(v1 + 264);
  return MEMORY[0x270FA2498](sub_217B42378, v5, v4);
}

uint64_t sub_217B42378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_33();
  swift_release();
  OUTLINED_FUNCTION_7();
  swift_retain();
  sub_217B475AC(v13);
  MEMORY[0x21D4559D0](v10);
  swift_bridgeObjectRelease();
  v12[11] = v16;
  v12[12] = v14;
  v12[13] = v15;
  v12[26] = MEMORY[0x263F8EE78];
  sub_217B5F800();
  sub_217B475D8(v11);
  swift_release();
  sub_217B47604(v13);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_3();
  return v18(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10);
}

uint64_t sub_217B42440()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  v3 = v2;
  OUTLINED_FUNCTION_5();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4();
  void *v6 = v5;
  v3[43] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[33];
    uint64_t v8 = v3[34];
    uint64_t v9 = sub_217B42528;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = v3[33];
    uint64_t v8 = v3[34];
    uint64_t v9 = sub_217B489EC;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_217B42528()
{
  OUTLINED_FUNCTION_2();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_217B42594(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  v2[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDB8);
  v2[11] = swift_task_alloc();
  v2[12] = type metadata accessor for Photo(0);
  v2[13] = swift_task_alloc();
  uint64_t v3 = sub_217B5F490();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDC0);
  v2[18] = swift_task_alloc();
  v2[19] = type metadata accessor for Movie(0);
  v2[20] = swift_task_alloc();
  sub_217B5FC40();
  v2[21] = sub_217B5FC30();
  uint64_t v5 = sub_217B5FBF0();
  v2[22] = v5;
  v2[23] = v4;
  return MEMORY[0x270FA2498](sub_217B42750, v5, v4);
}

uint64_t sub_217B42750()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 56) = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v0 + 192) = v3;
  if (v3)
  {
    *(void *)(v0 + 200) = 0;
    long long v4 = *(_OWORD *)(v1 + 32);
    long long v5 = *(_OWORD *)(v1 + 48);
    *(void *)(v0 + 48) = *(void *)(v1 + 64);
    *(_OWORD *)(v0 + 16) = v4;
    *(_OWORD *)(v0 + 32) = v5;
    swift_bridgeObjectRetain();
    sub_217B479A0(v0 + 16);
    OUTLINED_FUNCTION_16();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
  else
  {
    *(void *)(v0 + 256) = v2;
    uint64_t v9 = swift_task_alloc();
    uint64_t v10 = (void *)OUTLINED_FUNCTION_29(v9);
    *uint64_t v10 = v11;
    v10[1] = sub_217B4323C;
    uint64_t v12 = OUTLINED_FUNCTION_15();
    return sub_217B433F4(v12);
  }
}

uint64_t sub_217B4284C()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 208) = v1;
  *(void *)(v1 + 16) = v0 + 16;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v2;
  void *v2 = v0;
  v2[1] = sub_217B4291C;
  OUTLINED_FUNCTION_23();
  return MEMORY[0x270FA2360]();
}

uint64_t sub_217B4291C()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4();
  void *v6 = v5;
  v3[28] = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_16();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v8 = v3[22];
    uint64_t v9 = v3[23];
    uint64_t v7 = sub_217B42A08;
  }
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_217B42A08()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_33();
  uint64_t v1 = v0[18];
  if (__swift_getEnumTagSinglePayload(v1, 1, v0[19]) == 1)
  {
    sub_217B487D8(v1, &qword_267BABDC0);
LABEL_10:
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_3();
    return MEMORY[0x270FA2498](v21, v22, v23);
  }
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v4 = v0[14];
  sub_217B47AD4(v1, v0[20]);
  uint64_t v5 = sub_217B5F360();
  sub_217B5F480();
  uint64_t v6 = sub_217B5F430();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  id v9 = objc_allocWithZone(MEMORY[0x263F088E0]);
  sub_217B46A40(v5, v6, v8);
  MEMORY[0x21D455D70]();
  OUTLINED_FUNCTION_34();
  if (v11) {
    OUTLINED_FUNCTION_25(v10);
  }
  uint64_t v12 = v0[20];
  sub_217B5FBE0();
  sub_217B5FBC0();
  sub_217B47A8C((uint64_t)(v0 + 2));
  sub_217B47B24(v12);
  OUTLINED_FUNCTION_26();
  if (!v14)
  {
    OUTLINED_FUNCTION_11(v13);
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  v0[32] = v0[7];
  uint64_t v15 = swift_task_alloc();
  uint64_t v16 = (void *)OUTLINED_FUNCTION_29(v15);
  *uint64_t v16 = v17;
  v16[1] = sub_217B4323C;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3();
  return sub_217B433F4(v18);
}

uint64_t sub_217B42C0C()
{
  OUTLINED_FUNCTION_2();

  swift_task_dealloc();
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 184);
  return MEMORY[0x270FA2498](sub_217B42C78, v1, v2);
}

uint64_t sub_217B42C78()
{
  OUTLINED_FUNCTION_2();
  __swift_storeEnumTagSinglePayload(*(void *)(v0 + 144), 1, 1, *(void *)(v0 + 152));
  sub_217B487D8(*(void *)(v0 + 144), &qword_267BABDC0);
  OUTLINED_FUNCTION_16();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_217B42CF0()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  *(void *)(v1 + 16) = v0 + 16;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v2;
  void *v2 = v0;
  v2[1] = sub_217B42DC0;
  OUTLINED_FUNCTION_23();
  return MEMORY[0x270FA2360]();
}

uint64_t sub_217B42DC0()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4();
  void *v6 = v5;
  v3[31] = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_16();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v8 = v3[22];
    uint64_t v9 = v3[23];
    uint64_t v7 = sub_217B42EAC;
  }
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_217B42EAC()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_33();
  uint64_t v1 = v0[11];
  if (__swift_getEnumTagSinglePayload(v1, 1, v0[12]) == 1)
  {
    sub_217B47A8C((uint64_t)(v0 + 2));
    sub_217B487D8(v1, &qword_267BABDB8);
  }
  else
  {
    uint64_t v3 = v0[15];
    uint64_t v2 = v0[16];
    uint64_t v4 = v0[14];
    sub_217B47AD4(v1, v0[13]);
    uint64_t v5 = sub_217B5F360();
    sub_217B5F470();
    uint64_t v6 = sub_217B5F430();
    uint64_t v8 = v7;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    id v9 = objc_allocWithZone(MEMORY[0x263F088E0]);
    sub_217B46A40(v5, v6, v8);
    MEMORY[0x21D455D70]();
    OUTLINED_FUNCTION_34();
    if (v11) {
      OUTLINED_FUNCTION_25(v10);
    }
    uint64_t v12 = v0[13];
    sub_217B5FBE0();
    sub_217B5FBC0();
    sub_217B47A8C((uint64_t)(v0 + 2));
    sub_217B47B24(v12);
  }
  OUTLINED_FUNCTION_26();
  if (v14)
  {
    swift_bridgeObjectRelease();
    v0[32] = v0[7];
    uint64_t v15 = swift_task_alloc();
    uint64_t v16 = (void *)OUTLINED_FUNCTION_29(v15);
    *uint64_t v16 = v17;
    v16[1] = sub_217B4323C;
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_3();
    return sub_217B433F4(v18);
  }
  else
  {
    OUTLINED_FUNCTION_11(v13);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_3();
    return MEMORY[0x270FA2498](v21, v22, v23);
  }
}

uint64_t sub_217B430A8()
{
  OUTLINED_FUNCTION_2();

  swift_task_dealloc();
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 184);
  return MEMORY[0x270FA2498](sub_217B43114, v1, v2);
}

uint64_t sub_217B43114()
{
  OUTLINED_FUNCTION_2();
  __swift_storeEnumTagSinglePayload(*(void *)(v0 + 88), 1, 1, *(void *)(v0 + 96));
  uint64_t v1 = *(void *)(v0 + 88);
  sub_217B47A8C(v0 + 16);
  sub_217B487D8(v1, &qword_267BABDB8);
  OUTLINED_FUNCTION_26();
  if (v3)
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 256) = *(void *)(v0 + 56);
    uint64_t v4 = swift_task_alloc();
    uint64_t v5 = (void *)OUTLINED_FUNCTION_29(v4);
    *uint64_t v5 = v6;
    v5[1] = sub_217B4323C;
    uint64_t v7 = OUTLINED_FUNCTION_15();
    return sub_217B433F4(v7);
  }
  else
  {
    *(void *)(v0 + 200) = v2;
    uint64_t v9 = *(void *)(v0 + 64) + 40 * v2;
    uint64_t v10 = *(void *)(v9 + 64);
    long long v11 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v0 + 32) = v11;
    *(void *)(v0 + 48) = v10;
    sub_217B479A0(v0 + 16);
    OUTLINED_FUNCTION_16();
    return MEMORY[0x270FA2498](v12, v13, v14);
  }
}

uint64_t sub_217B4323C()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_5();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  OUTLINED_FUNCTION_4();
  void *v6 = v5;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {

    uint64_t v7 = *(void *)(v3 + 176);
    uint64_t v8 = *(void *)(v3 + 184);
    uint64_t v9 = sub_217B489E4;
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 176);
    uint64_t v8 = *(void *)(v3 + 184);
    uint64_t v9 = sub_217B4334C;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_217B4334C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_217B433F4(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  sub_217B5FC40();
  v2[11] = sub_217B5FC30();
  uint64_t v4 = sub_217B5FBF0();
  return MEMORY[0x270FA2498](sub_217B4348C, v4, v3);
}

uint64_t sub_217B4348C()
{
  uint64_t v1 = v0[10];
  swift_release();
  *((_OWORD *)v0 + 1) = *(_OWORD *)(v1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD18);
  sub_217B5F7A0();
  uint64_t v2 = (void *)v0[8];
  if (v2)
  {
    unint64_t v3 = v0[9];
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_217B5FDB0();
      swift_bridgeObjectRelease();
      if (v24)
      {
LABEL_4:
        uint64_t v5 = v0[9];
        uint64_t v4 = (const void *)v0[10];
        id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08810]), sel_init);
        uint64_t v7 = sub_217B43A10();
        uint64_t v8 = sub_217B43AF0(v7);
        swift_bridgeObjectRelease();
        sub_217B47630(v8, v6);
        sub_217B476B0(v5, v6);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD88);
        uint64_t v9 = swift_allocObject();
        *(_OWORD *)(v9 + 16) = xmmword_217B604B0;
        *(void *)(v9 + 56) = sub_217B47BE4(0, &qword_267BABD90);
        *(void *)(v9 + 32) = v6;
        id v10 = objc_allocWithZone(MEMORY[0x263F6BC98]);
        id v11 = v6;
        id v12 = sub_217B46ABC(v9, 0);
        objc_msgSend(v12, sel_willMoveToParentViewController_, v2);
        objc_msgSend(v2, sel_addChildViewController_, v12);
        objc_msgSend(v12, sel_didMoveToParentViewController_, v2);
        uint64_t v13 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v14 = swift_allocObject();
        *(void *)(v14 + 16) = v13;
        memcpy((void *)(v14 + 24), v4, 0x68uLL);
        v0[6] = sub_217B477F4;
        v0[7] = v14;
        uint64_t v15 = MEMORY[0x263EF8330];
        v0[2] = MEMORY[0x263EF8330];
        v0[3] = 1107296256;
        v0[4] = sub_217B43F38;
        v0[5] = &block_descriptor;
        uint64_t v16 = _Block_copy(v0 + 2);
        sub_217B47160((uint64_t)v4);
        swift_release();
        objc_msgSend(v12, sel_setCompletionWithItemsHandler_, v16);
        _Block_release(v16);
        uint64_t v17 = (NSString *)sub_217B5FB40();
        SEL v18 = NSSelectorFromString(v17);

        if (objc_msgSend(v12, sel_respondsToSelector_, v18))
        {
          uint64_t v19 = (const void *)v0[10];
          uint64_t v20 = swift_allocObject();
          *(void *)(v20 + 16) = v12;
          memcpy((void *)(v20 + 24), v19, 0x68uLL);
          uint64_t v21 = swift_allocObject();
          *(void *)(v21 + 16) = sub_217B478A8;
          *(void *)(v21 + 24) = v20;
          v0[6] = sub_217B478EC;
          v0[7] = v21;
          v0[2] = v15;
          v0[3] = 1107296256;
          v0[4] = sub_217B44064;
          v0[5] = &block_descriptor_28;
          uint64_t v22 = _Block_copy(v0 + 2);
          sub_217B47160((uint64_t)v19);
          id v23 = v12;
          swift_retain();
          swift_release();
          id v12 = v23;
          _Block_copy(v22);
          objc_msgSend(v12, sel_performSelector_withObject_, v18, v22);

          swift_release();
          _Block_release(v22);

          _Block_release(v22);
        }
        else
        {
        }
        goto LABEL_9;
      }
    }
    else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    id v12 = v2;
LABEL_9:
  }
  OUTLINED_FUNCTION_18();
  return v25();
}

uint64_t sub_217B438C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_217B5FC60();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_217B487D8(a1, &qword_267BABD50);
  }
  else
  {
    sub_217B5FC50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_217B5FBF0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_217B43A10()
{
  uint64_t v1 = v0[1];
  if (v1)
  {
    uint64_t v2 = *v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDB0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_217B604B0;
    *(void *)(inited + 32) = 0xD000000000000028;
    *(void *)(inited + 40) = 0x8000000217B618A0;
    *(void *)(inited + 48) = v2;
    *(void *)(inited + 56) = v1;
    swift_bridgeObjectRetain();
    return sub_217B5FB10();
  }
  else
  {
    return sub_217B5FB10();
  }
}

uint64_t sub_217B43AF0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDA8);
    uint64_t v2 = sub_217B5FDD0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (void *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v16 = v15[1];
    *(void *)&v36[0] = *v15;
    *((void *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_217B47914(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_217B47914(v35, v36);
    sub_217B47914(v36, &v32);
    uint64_t result = sub_217B5FD40();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6))) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v6 + 8 * v19);
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v6 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t v25 = *(void *)(v2 + 48) + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_217B47914(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v20));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_217B47924();
    return v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_217B43EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5 + 16;
  swift_beginAccess();
  uint64_t v6 = (void *)MEMORY[0x21D456610](v5);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_removeFromParentViewController);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD28);
  return sub_217B5F800();
}

uint64_t sub_217B43F38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  int64_t v8 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a4) {
    uint64_t v9 = sub_217B5FBB0();
  }
  else {
    uint64_t v9 = 0;
  }
  swift_retain();
  id v10 = a2;
  id v11 = a5;
  v8(a2, a3, v9, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_217B43FF4(uint64_t result, int a2, id a3)
{
  if ((result & 1) == 0)
  {
    objc_msgSend(a3, sel_removeFromParentViewController);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD28);
    return sub_217B5F800();
  }
  return result;
}

void sub_217B44064(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_217B440E4()
{
  return sub_217B5F4D0();
}

uint64_t sub_217B44100(uint64_t a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_217B41BC4(a1);
}

uint64_t sub_217B44154()
{
  return sub_217B5F400();
}

uint64_t sub_217B44254(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_217B5F390();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217B44314, 0, 0);
}

uint64_t sub_217B44314()
{
  OUTLINED_FUNCTION_2();
  (*(void (**)(void, void, void))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  sub_217B5F410();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18();
  return v1();
}

uint64_t sub_217B4439C(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABEA8);
  v2[6] = swift_task_alloc();
  uint64_t v3 = sub_217B5F490();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_217B5F3D0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v5 = sub_217B5F390();
  v2[14] = v5;
  v2[15] = *(void *)(v5 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217B4459C, 0, 0);
}

uint64_t sub_217B4459C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  OUTLINED_FUNCTION_9(a1, a2, a3, a4, a5, a6, a7);
  sub_217B5F3C0();
  sub_217B5F3B0();
  uint64_t v8 = OUTLINED_FUNCTION_21();
  uint64_t v10 = v9(v8);
  MEMORY[0x21D455600](v10);
  sub_217B5F340();
  uint64_t v11 = OUTLINED_FUNCTION_13();
  v12(v11);
  sub_217B5F480();
  uint64_t v13 = OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_37(v13, v14, v15, v16, v17, v18, v19, v20, v52);
  if (v21)
  {
    uint64_t v22 = *(void *)(v7 + 48);
    sub_217B5F480();
    uint64_t v24 = sub_217B487D8(v22, &qword_267BABEA8);
  }
  else
  {
    OUTLINED_FUNCTION_36();
    uint64_t v24 = v23();
  }
  OUTLINED_FUNCTION_14(v24, v25, v26, v27, v28, v29, v30, v31, v53, v54, v55);
  swift_bridgeObjectRelease();
  uint64_t v32 = OUTLINED_FUNCTION_28();
  v33(v32);
  OUTLINED_FUNCTION_22();
  v56();
  id v34 = objc_msgSend(self, sel_defaultManager);
  sub_217B5F380();
  uint64_t v35 = (void *)sub_217B5FB40();
  swift_bridgeObjectRelease();
  unsigned int v36 = objc_msgSend(v34, sel_fileExistsAtPath_, v35);

  if (v36)
  {
    id v37 = OUTLINED_FUNCTION_35();
    uint64_t v38 = (void *)sub_217B5F360();
    *(void *)(v7 + 24) = 0;
    unsigned int v39 = objc_msgSend(v37, sel_removeItemAtURL_error_, v38, v35);

    id v40 = *(id *)(v7 + 24);
    if (!v39) {
      goto LABEL_8;
    }
  }
  id v41 = OUTLINED_FUNCTION_20();
  MEMORY[0x21D455600]();
  v42 = (void *)sub_217B5F360();
  OUTLINED_FUNCTION_22();
  v56();
  v43 = (void *)sub_217B5F360();
  *(void *)(v7 + 16) = 0;
  unsigned int v44 = OUTLINED_FUNCTION_32((uint64_t)v43, sel_copyItemAtURL_toURL_error_);

  id v40 = *(id *)(v7 + 16);
  if (v44)
  {
    uint64_t v45 = OUTLINED_FUNCTION_6();
    v46(v45);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17();
  }
  else
  {
LABEL_8:
    v48 = v40;
    sub_217B5F330();

    swift_willThrow();
    uint64_t v49 = OUTLINED_FUNCTION_10();
    v50(v49);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17();
  }
  return v47();
}

uint64_t sub_217B448B0()
{
  return sub_217B5F400();
}

uint64_t sub_217B449B0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_217B5F390();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217B4898C, 0, 0);
}

uint64_t sub_217B44A70(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABEA8);
  v2[6] = swift_task_alloc();
  uint64_t v3 = sub_217B5F490();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_217B5F3D0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v5 = sub_217B5F390();
  v2[14] = v5;
  v2[15] = *(void *)(v5 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_217B44C70, 0, 0);
}

uint64_t sub_217B44C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  OUTLINED_FUNCTION_9(a1, a2, a3, a4, a5, a6, a7);
  sub_217B5F3C0();
  sub_217B5F3B0();
  uint64_t v8 = OUTLINED_FUNCTION_21();
  uint64_t v10 = v9(v8);
  MEMORY[0x21D455600](v10);
  sub_217B5F340();
  uint64_t v11 = OUTLINED_FUNCTION_13();
  v12(v11);
  sub_217B5F470();
  uint64_t v13 = OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_37(v13, v14, v15, v16, v17, v18, v19, v20, v52);
  if (v21)
  {
    uint64_t v22 = *(void *)(v7 + 48);
    sub_217B5F470();
    uint64_t v24 = sub_217B487D8(v22, &qword_267BABEA8);
  }
  else
  {
    OUTLINED_FUNCTION_36();
    uint64_t v24 = v23();
  }
  OUTLINED_FUNCTION_14(v24, v25, v26, v27, v28, v29, v30, v31, v53, v54, v55);
  swift_bridgeObjectRelease();
  uint64_t v32 = OUTLINED_FUNCTION_28();
  v33(v32);
  OUTLINED_FUNCTION_22();
  v56();
  id v34 = objc_msgSend(self, sel_defaultManager);
  sub_217B5F380();
  uint64_t v35 = (void *)sub_217B5FB40();
  swift_bridgeObjectRelease();
  unsigned int v36 = objc_msgSend(v34, sel_fileExistsAtPath_, v35);

  if (v36)
  {
    id v37 = OUTLINED_FUNCTION_35();
    uint64_t v38 = (void *)sub_217B5F360();
    *(void *)(v7 + 24) = 0;
    unsigned int v39 = objc_msgSend(v37, sel_removeItemAtURL_error_, v38, v35);

    id v40 = *(id *)(v7 + 24);
    if (!v39) {
      goto LABEL_8;
    }
  }
  id v41 = OUTLINED_FUNCTION_20();
  MEMORY[0x21D455600]();
  v42 = (void *)sub_217B5F360();
  OUTLINED_FUNCTION_22();
  v56();
  v43 = (void *)sub_217B5F360();
  *(void *)(v7 + 16) = 0;
  unsigned int v44 = OUTLINED_FUNCTION_32((uint64_t)v43, sel_copyItemAtURL_toURL_error_);

  id v40 = *(id *)(v7 + 16);
  if (v44)
  {
    uint64_t v45 = OUTLINED_FUNCTION_6();
    v46(v45);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17();
  }
  else
  {
LABEL_8:
    v48 = v40;
    sub_217B5F330();

    swift_willThrow();
    uint64_t v49 = OUTLINED_FUNCTION_10();
    v50(v49);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17();
  }
  return v47();
}

id sub_217B44F88()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE28);
  sub_217B5F810();
  id v0 = objc_allocWithZone((Class)type metadata accessor for _PresentationViewController());
  return sub_217B451CC(v2, v3, v4);
}

id sub_217B45000()
{
  return sub_217B44F88();
}

uint64_t sub_217B4500C(uint64_t a1, uint64_t a2)
{
  return nullsub_1(a1, a2, *v2, v2[1], v2[2]);
}

uint64_t sub_217B45024()
{
  return sub_217B5F5F0();
}

uint64_t sub_217B45060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_217B48880();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_217B450C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_217B48880();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_217B45128()
{
  return sub_217B5F730();
}

void sub_217B45144()
{
}

uint64_t sub_217B4516C()
{
  return sub_217B5F800();
}

id sub_217B451CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtC17_PhotosUI_SwiftUIP33_3BA943E6D7A29AC315168BE52F028B9927_PresentationViewController__presentationViewController];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for _PresentationViewController();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

void sub_217B45220()
{
}

uint64_t sub_217B4529C(uint64_t a1)
{
  id v3 = v1;
  return a1;
}

void sub_217B452B4()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for _PresentationViewController();
  objc_msgSendSuper2(&v3, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setHidden_, 1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_217B45374(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _PresentationViewController();
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a1 & 1);
  id v3 = v1;
  return sub_217B4516C();
}

uint64_t sub_217B45424(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for _PresentationViewController();
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1 & 1);
  return sub_217B4516C();
}

void sub_217B454C8()
{
}

id sub_217B45558()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PresentationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _PresentationViewController()
{
  return self;
}

uint64_t sub_217B45610()
{
  return swift_getWitnessTable();
}

unint64_t sub_217B45674()
{
  unint64_t result = qword_267BABCB0;
  if (!qword_267BABCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BABCB0);
  }
  return result;
}

void type metadata accessor for _PHPickerSourceType(uint64_t a1)
{
}

void type metadata accessor for _PHPickerPrivateCapabilities(uint64_t a1)
{
}

void type metadata accessor for PHPickerCapabilities(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for _PostToSharedAlbumModifer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _PostToSharedAlbumModifer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for _PostToSharedAlbumModifer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v9 = *(void **)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = v9;
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v10 = v9;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for _PostToSharedAlbumModifer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void **)(a1 + 88);
  uint64_t v5 = *(void **)(a2 + 88);
  *(void *)(a1 + 88) = v5;
  id v6 = v5;

  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for _PostToSharedAlbumModifer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);

  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _PostToSharedAlbumModifer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _PostToSharedAlbumModifer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _PostToSharedAlbumModifer()
{
  return &type metadata for _PostToSharedAlbumModifer;
}

id sub_217B45B40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v4 = sub_217B5F850();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_217B5F870();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Photo(0);
  uint64_t v38 = sub_217B46E78(&qword_267BABDD0, (void (*)(uint64_t))type metadata accessor for Photo);
  uint64_t v39 = v12;
  uint64_t v13 = sub_217B5F3E0();
  uint64_t v14 = *(void *)(v13 + 16);
  v42 = v7;
  uint64_t v43 = v8;
  id v40 = v11;
  uint64_t v41 = v9;
  if (v14)
  {
    uint64_t v36 = v5;
    uint64_t v37 = v4;
    uint64_t v15 = *(void *)(sub_217B5F490() - 8);
    unint64_t v16 = v13 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void **)(v3 + 32);
    uint64_t v18 = *(void *)(v15 + 72);
    while (1)
    {
      id v19 = v17;
      uint64_t v20 = (void *)sub_217B5F450();
      id v21 = objc_msgSend(v19, sel_registeredContentTypesConformingToContentType_, v20);

      uint64_t v22 = sub_217B5FBB0();
      uint64_t v23 = *(void *)(v22 + 16);
      swift_bridgeObjectRelease();
      if (v23) {
        break;
      }
      v16 += v18;
      if (!--v14)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v36;
        uint64_t v4 = v37;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v45;
    *(void *)(v32 + 16) = v44;
    *(void *)(v32 + 24) = v33;
    id v34 = v19;
    swift_retain();
    uint64_t v35 = sub_217B5FC80();

    swift_release();
    return (id)v35;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_217B47BE4(0, &qword_267BABDD8);
    uint64_t v24 = (void *)sub_217B5FC90();
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v45;
    *(void *)(v25 + 16) = v44;
    *(void *)(v25 + 24) = v26;
    aBlock[4] = sub_217B47C20;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_217B4AC50;
    aBlock[3] = &block_descriptor_43;
    uint64_t v27 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v28 = v40;
    sub_217B5F860();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_217B46E78(&qword_267BABDE0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDE8);
    sub_217B48944(&qword_267BABDF0, &qword_267BABDE8);
    uint64_t v29 = v42;
    sub_217B5FD30();
    MEMORY[0x21D455E80](0, v28, v29, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v29, v4);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v28, v43);
    id v30 = objc_msgSend(self, sel_discreteProgressWithTotalUnitCount_, 0);
    return v30;
  }
}

id sub_217B46044(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v4 = sub_217B5F850();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_217B5F870();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Movie(0);
  uint64_t v38 = sub_217B46E78(&qword_267BABE10, (void (*)(uint64_t))type metadata accessor for Movie);
  uint64_t v39 = v12;
  uint64_t v13 = sub_217B5F3E0();
  uint64_t v14 = *(void *)(v13 + 16);
  v42 = v7;
  uint64_t v43 = v8;
  id v40 = v11;
  uint64_t v41 = v9;
  if (v14)
  {
    uint64_t v36 = v5;
    uint64_t v37 = v4;
    uint64_t v15 = *(void *)(sub_217B5F490() - 8);
    unint64_t v16 = v13 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void **)(v3 + 32);
    uint64_t v18 = *(void *)(v15 + 72);
    while (1)
    {
      id v19 = v17;
      uint64_t v20 = (void *)sub_217B5F450();
      id v21 = objc_msgSend(v19, sel_registeredContentTypesConformingToContentType_, v20);

      uint64_t v22 = sub_217B5FBB0();
      uint64_t v23 = *(void *)(v22 + 16);
      swift_bridgeObjectRelease();
      if (v23) {
        break;
      }
      v16 += v18;
      if (!--v14)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v36;
        uint64_t v4 = v37;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v45;
    *(void *)(v32 + 16) = v44;
    *(void *)(v32 + 24) = v33;
    id v34 = v19;
    swift_retain();
    uint64_t v35 = sub_217B5FC80();

    swift_release();
    return (id)v35;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_217B47BE4(0, &qword_267BABDD8);
    uint64_t v24 = (void *)sub_217B5FC90();
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v45;
    *(void *)(v25 + 16) = v44;
    *(void *)(v25 + 24) = v26;
    aBlock[4] = sub_217B47DD4;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_217B4AC50;
    aBlock[3] = &block_descriptor_55;
    uint64_t v27 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v28 = v40;
    sub_217B5F860();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_217B46E78(&qword_267BABDE0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDE8);
    sub_217B48944(&qword_267BABDF0, &qword_267BABDE8);
    uint64_t v29 = v42;
    sub_217B5FD30();
    MEMORY[0x21D455E80](0, v28, v29, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v29, v4);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v28, v43);
    id v30 = objc_msgSend(self, sel_discreteProgressWithTotalUnitCount_, 0);
    return v30;
  }
}

uint64_t sub_217B46548(uint64_t a1, void (*a2)(void *), uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v24 = a3;
  uint64_t v25 = a2;
  uint64_t v9 = OUTLINED_FUNCTION_27();
  uint64_t v11 = v10(v9);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v24 - v13;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_8();
  uint64_t v18 = (void *)(v17 - v16);
  __swift_instantiateConcreteTypeFromMangledName(a6);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_8();
  uint64_t v22 = (void *)(v21 - v20);
  sub_217B47E5C(a1, (uint64_t)v18, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *uint64_t v22 = *v18;
  }
  else
  {
    sub_217B47AD4((uint64_t)v18, (uint64_t)v14);
    sub_217B47E0C((uint64_t)v14, (uint64_t)v22);
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v11);
    sub_217B47B24((uint64_t)v14);
  }
  swift_storeEnumTagMultiPayload();
  v25(v22);
  return sub_217B487D8((uint64_t)v22, a6);
}

uint64_t sub_217B466F8(void (*a1)(uint64_t), uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = OUTLINED_FUNCTION_27();
  uint64_t v12 = a4(v11);
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v12);
  swift_storeEnumTagMultiPayload();
  a1(v10);
  return sub_217B487D8(v10, a3);
}

void sub_217B467B8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  uint64_t v14 = (void *)a6(a5, v13);
  swift_release();
}

uint64_t sub_217B46904(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a3);
  MEMORY[0x270FA5388](v9 - 8);
  OUTLINED_FUNCTION_8();
  uint64_t v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_8();
  uint64_t v16 = v15 - v14;
  sub_217B47E5C(a1, v15 - v14, a4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    return sub_217B5FC00();
  }
  else
  {
    sub_217B47EAC(v16, v12, a3);
    __swift_instantiateConcreteTypeFromMangledName(a5);
    return sub_217B5FC10();
  }
}

BOOL sub_217B46A34(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id sub_217B46A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = (void *)sub_217B5FB40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(v3, sel_initWithItem_typeIdentifier_, a1, v5);

  swift_unknownObjectRelease();
  return v6;
}

id sub_217B46ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_217B5FBA0();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_217B47BE4(0, &qword_267BABD98);
    uint64_t v5 = (void *)sub_217B5FBA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(v2, sel_initWithActivityItems_applicationActivities_, v4, v5);

  return v6;
}

uint64_t sub_217B46B68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217B47EFC();
  *a1 = result;
  return result;
}

uint64_t sub_217B46B90@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217B47FA4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_217B46BC0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217B47F14(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_217B46BF0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217B47F74(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_217B46C20(void *a1, uint64_t *a2)
{
  return sub_217B47F2C(a1, *a2);
}

uint64_t sub_217B46C28@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_217B47FAC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_217B46C5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_217B47FD0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_217B46C90(uint64_t *a1)
{
  return sub_217B47F1C(*a1);
}

uint64_t sub_217B46C98(uint64_t *a1)
{
  return sub_217B47F04(*a1);
}

uint64_t sub_217B46CA0(uint64_t *a1)
{
  return sub_217B47F64(*a1);
}

uint64_t sub_217B46CA8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217B47FE8(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_217B46CD8(uint64_t *a1)
{
  return sub_217B47F8C(*a1, *v1);
}

BOOL sub_217B46CE4(uint64_t *a1)
{
  return sub_217B47FF0(*a1, *v1);
}

BOOL sub_217B46CF0(uint64_t *a1)
{
  return sub_217B47F98(*a1, *v1);
}

BOOL sub_217B46CFC()
{
  return sub_217B47F58(*v0);
}

uint64_t sub_217B46D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_217B46D1C(uint64_t *a1)
{
  return sub_217B47F7C(*a1);
}

BOOL sub_217B46D24(uint64_t *a1, uint64_t *a2)
{
  return sub_217B46A34(*a1, *a2);
}

void sub_217B46D30(uint64_t a1@<X8>)
{
  sub_217B46D64();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_217B46D6C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t result = nullsub_1(*v5, a1, a2, a3, a4);
  *a5 = result;
  return result;
}

void *sub_217B46D98@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_217B46DA4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217B4882C(a1);
  *a2 = result;
  return result;
}

void *sub_217B46DCC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_217B46DDC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_217B46DE8()
{
  return sub_217B46E78(&qword_267BABCD0, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217B46E30()
{
  return sub_217B46E78(&qword_267BABCD8, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217B46E78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_217B46EC0()
{
  return sub_217B46E78(&qword_267BABCE0, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217B46F08()
{
  return sub_217B46E78(&qword_267BABCE8, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217B46F50()
{
  return sub_217B46E78(&qword_267BABCF0, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217B46F98()
{
  return sub_217B46E78(&qword_267BABCF8, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217B46FE0()
{
  return sub_217B46E78(&qword_267BABD00, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217B47028()
{
  return sub_217B46E78(&qword_267BABD08, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217B47070()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_217B470D0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_217B47158(uint64_t a1, unsigned char *a2)
{
  return sub_217B41DB4(a1, a2, (const void *)(v2 + 16));
}

uint64_t sub_217B47160(uint64_t a1)
{
  char v4 = *(void **)(a1 + 88);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v2 = v4;
  return a1;
}

unint64_t sub_217B4721C()
{
  unint64_t result = qword_267BABD30;
  if (!qword_267BABD30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BABD10);
    sub_217B48944(&qword_267BABD38, &qword_267BABD20);
    sub_217B48944(&qword_267BABD40, &qword_267BABD48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BABD30);
  }
  return result;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_217B47350()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t sub_217B473E0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_217B47494;
  return sub_217B41EC8(a1, v4, v5, v1 + 32);
}

uint64_t sub_217B47494()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4();
  void *v2 = v1;
  swift_task_dealloc();
  char v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_217B47580(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B475AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B475D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_217B47604(uint64_t a1)
{
  return a1;
}

void sub_217B47630(uint64_t a1, void *a2)
{
  id v3 = (id)sub_217B5FB00();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserInfo_, v3);
}

void sub_217B476B0(uint64_t a1, void *a2)
{
  sub_217B47BE4(0, &qword_267BABDA0);
  id v3 = (id)sub_217B5FBA0();
  objc_msgSend(a2, sel_setAttachments_, v3);
}

uint64_t sub_217B4772C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_217B47764()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_217B477F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217B43EA8(a1, a2, a3, a4, *(void *)(v4 + 16));
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

uint64_t sub_217B47818()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_217B478A8(uint64_t a1, int a2)
{
  return sub_217B43FF4(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_217B478B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217B478EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

_OWORD *sub_217B47914(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_217B47924()
{
  return swift_release();
}

uint64_t type metadata accessor for Photo(uint64_t a1)
{
  return sub_217B4796C(a1, (uint64_t *)&unk_267BABE60);
}

uint64_t type metadata accessor for Movie(uint64_t a1)
{
  return sub_217B4796C(a1, (uint64_t *)&unk_267BABE50);
}

uint64_t sub_217B4796C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217B479A0(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return a1;
}

void sub_217B479E4(uint64_t a1)
{
  sub_217B467B8(a1, *(void *)(v1 + 16), &qword_267BABE08, (uint64_t)&unk_26C81C1A0, (uint64_t)sub_217B47CE8, (uint64_t (*)(uint64_t, uint64_t))sub_217B46044);
}

void sub_217B47A38(uint64_t a1)
{
  sub_217B467B8(a1, *(void *)(v1 + 16), &qword_267BABDC8, (uint64_t)&unk_26C81C100, (uint64_t)sub_217B47B84, (uint64_t (*)(uint64_t, uint64_t))sub_217B45B40);
}

uint64_t sub_217B47A8C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_217B47AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_27();
  v4(v3);
  OUTLINED_FUNCTION_1();
  uint64_t v5 = OUTLINED_FUNCTION_30();
  v6(v5);
  return a2;
}

uint64_t sub_217B47B24(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_27();
  v3(v2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v4 + 8))(a1);
  return a1;
}

uint64_t sub_217B47B78()
{
  return objectdestroy_33Tm(&qword_267BABDC8);
}

uint64_t sub_217B47B84(uint64_t a1)
{
  return sub_217B47D04(a1, &qword_267BABDC8, &qword_267BABDB8, &qword_267BABDF8);
}

uint64_t sub_217B47BA0(uint64_t a1)
{
  return sub_217B46548(a1, *(void (**)(void *))(v1 + 16), *(void *)(v1 + 24), (uint64_t)type metadata accessor for Photo, &qword_267BABE00, &qword_267BABDF8);
}

uint64_t sub_217B47BE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_217B47C20()
{
  return sub_217B466F8(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), &qword_267BABDF8, type metadata accessor for Photo);
}

uint64_t sub_217B47C58()
{
  return objectdestroy_33Tm(&qword_267BABE08);
}

uint64_t objectdestroy_33Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t))(v2 + 8))(v1 + v4);

  return MEMORY[0x270FA0238](v1, v5, v6);
}

uint64_t sub_217B47CE8(uint64_t a1)
{
  return sub_217B47D04(a1, &qword_267BABE08, &qword_267BABDC0, &qword_267BABE18);
}

uint64_t sub_217B47D04(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_217B46904(a1, v4 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a3, a4, a2);
}

uint64_t sub_217B47D90(uint64_t a1)
{
  return sub_217B46548(a1, *(void (**)(void *))(v1 + 16), *(void *)(v1 + 24), (uint64_t)type metadata accessor for Movie, &qword_267BABE20, &qword_267BABE18);
}

uint64_t sub_217B47DD4()
{
  return sub_217B466F8(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), &qword_267BABE18, type metadata accessor for Movie);
}

uint64_t sub_217B47E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = OUTLINED_FUNCTION_27();
  v4(v3);
  OUTLINED_FUNCTION_1();
  uint64_t v5 = OUTLINED_FUNCTION_31();
  v6(v5);
  return a2;
}

uint64_t sub_217B47E5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_31();
  v5(v4);
  return a2;
}

uint64_t sub_217B47EAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  uint64_t v4 = OUTLINED_FUNCTION_30();
  v5(v4);
  return a2;
}

uint64_t sub_217B47EFC()
{
  return 0;
}

uint64_t sub_217B47F04(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_217B47F14(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_217B47F1C(uint64_t result)
{
  *v1 |= result;
  return result;
}

BOOL sub_217B47F2C(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

BOOL sub_217B47F58(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_217B47F64(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_217B47F74(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_217B47F7C(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

BOOL sub_217B47F8C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_217B47F98(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_217B47FA4(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_217B47FAC(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_217B47FD0(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_217B47FE8(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_217B47FF0(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

void type metadata accessor for NSDirectionalRectEdge(uint64_t a1)
{
}

void sub_217B48010(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_217B48070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B48084);
}

uint64_t sub_217B48084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5F390();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_217B480CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B480E0);
}

uint64_t sub_217B480E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5F390();

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_217B48130()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = *v3;

  return v4(v1, v0, v2);
}

uint64_t sub_217B48188(uint64_t a1)
{
  sub_217B5F390();
  OUTLINED_FUNCTION_1();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);

  return v4(a1, v2);
}

uint64_t sub_217B481E4()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = OUTLINED_FUNCTION_19();
  v2(v1);
  return v0;
}

uint64_t sub_217B4822C()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = OUTLINED_FUNCTION_19();
  v2(v1);
  return v0;
}

uint64_t sub_217B48274()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = OUTLINED_FUNCTION_19();
  v2(v1);
  return v0;
}

uint64_t sub_217B482BC()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1();
  uint64_t v1 = OUTLINED_FUNCTION_19();
  v2(v1);
  return v0;
}

uint64_t sub_217B48304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B48994);
}

uint64_t sub_217B48318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B48990);
}

uint64_t sub_217B4832C()
{
  uint64_t result = sub_217B5F390();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for _PresentationViewControllerRepresentable(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s17_PhotosUI_SwiftUI40_PresentationViewControllerRepresentableVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for _PresentationViewControllerRepresentable(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for _PresentationViewControllerRepresentable(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for _PresentationViewControllerRepresentable(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _PresentationViewControllerRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for _PresentationViewControllerRepresentable()
{
  return &type metadata for _PresentationViewControllerRepresentable;
}

uint64_t sub_217B485B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B48624()
{
  return MEMORY[0x263F1BB58];
}

unint64_t sub_217B48634()
{
  unint64_t result = qword_267BABE70;
  if (!qword_267BABE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BABE70);
  }
  return result;
}

uint64_t sub_217B48680()
{
  return sub_217B46E78(&qword_267BABE78, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217B486C8()
{
  return sub_217B46E78(&qword_267BABE80, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217B48710()
{
  return sub_217B46E78(&qword_267BABE88, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217B48758()
{
  return sub_217B46E78(&qword_267BABE90, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217B487A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B487BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B487D8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_217B4882C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_217B48880()
{
  unint64_t result = qword_267BABEC0;
  if (!qword_267BABEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BABEC0);
  }
  return result;
}

uint64_t sub_217B488CC()
{
  return sub_217B48944(&qword_267BABEC8, &qword_267BABED0);
}

uint64_t sub_217B48908()
{
  return sub_217B48944(&qword_267BABED8, &qword_267BABEE0);
}

uint64_t sub_217B48944(unint64_t *a1, uint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_6()
{
  return *(void *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v2 = v0[37];
  uint64_t v4 = v0[35];
  uint64_t v3 = v0[36];
  v0[23] = v4;
  v0[28] = v2;
  v0[17] = v4;
  v0[18] = v3;
  v0[19] = v2;
  return sub_217B47580((uint64_t)(v0 + 23));
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return MEMORY[0x270EEFD10](a1, a2, a3, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_11@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 200) = a1;
  uint64_t v4 = *(void *)(v2 + 64) + 40 * a1;
  uint64_t v5 = *(void *)(v4 + 64);
  long long v6 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v1 + 16) = v6;
  *(void *)(v1 + 32) = v5;
  return sub_217B479A0(v1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_217B5F390();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13 = *(void *)(v11 + 80);
  return MEMORY[0x270FA1648](a10, a11, v13);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

id OUTLINED_FUNCTION_20()
{
  return [v0 (SEL)(v1 + 827)];
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25@<X0>(unint64_t a1@<X8>)
{
  return MEMORY[0x270F9DBF0](a1 > 1, v1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29(uint64_t result)
{
  *(void *)(v1 + 264) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

id OUTLINED_FUNCTION_32(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v5, v3, v4);
}

id OUTLINED_FUNCTION_35()
{
  return [v0 (SEL)(v1 + 827)];
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __swift_getEnumTagSinglePayload(v10, 1, a9);
  return *(void *)(v9 + 80);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return MEMORY[0x270FA1750](v0, v1, v2);
}

uint64_t PhotosPickerItem.loadTransferable<A>(type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 72) = a3;
  *(void *)(v5 + 80) = a4;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a2;
  long long v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 48) = *(void *)(v4 + 32);
  return MEMORY[0x270FA2498](sub_217B48E48, 0, 0);
}

uint64_t sub_217B48E48()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 88) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 72);
  *(void *)(v2 + 32) = v0 + 16;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  uint64_t v4 = sub_217B5FD10();
  void *v3 = v0;
  v3[1] = sub_217B48F5C;
  uint64_t v5 = *(void *)(v0 + 56);
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000017, 0x8000000217B618D0, sub_217B4AE40, v2, v4);
}

uint64_t sub_217B48F5C()
{
  OUTLINED_FUNCTION_0();
  *(void *)(v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_217B49070, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_56();
    return v2();
  }
}

uint64_t sub_217B49070()
{
  swift_task_dealloc();
  OUTLINED_FUNCTION_56();
  return v0();
}

void static PHLivePhoto.transferRepresentation.getter()
{
  OUTLINED_FUNCTION_5_0();
  v21[1] = v0;
  uint64_t v1 = sub_217B5F490();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v21 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v21 - v13;
  id v15 = (id)PFCurrentPlatformLivePhotoBundleType();
  if (v15)
  {
    uint64_t v16 = v15;
    sub_217B5F460();

    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v17(v14, v12, v1);
    uint64_t v18 = *(void (**)(void))(v3 + 16);
    OUTLINED_FUNCTION_73();
    v18();
    OUTLINED_FUNCTION_73();
    v18();
    unint64_t v19 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v20 = swift_allocObject();
    v17((char *)(v20 + v19), v8, v1);
    sub_217B47BE4(0, &qword_267BAC058);
    sub_217B4B068();
    sub_217B5F3F0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v1);
    OUTLINED_FUNCTION_4_0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_217B492BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](sub_217B49350, 0, 0);
}

uint64_t sub_217B49350()
{
  uint64_t v1 = self;
  uint64_t v2 = (void *)sub_217B5F3A0();
  sub_217B5F430();
  uint64_t v3 = (void *)sub_217B5FB40();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = 0;
  id v4 = objc_msgSend(v1, sel_objectWithItemProviderData_typeIdentifier_error_, v2, v3, v0 + 16);

  uint64_t v5 = *(void **)(v0 + 16);
  if (v4)
  {
    **(void **)(v0 + 24) = v4;
    OUTLINED_FUNCTION_56();
    uint64_t v11 = v6;
    id v7 = v5;
    uint64_t v8 = v11;
  }
  else
  {
    id v9 = v5;
    sub_217B5F330();

    swift_willThrow();
    OUTLINED_FUNCTION_56();
  }
  return v8();
}

void sub_217B494B8()
{
}

uint64_t sub_217B494D0(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_267BABEE8, MEMORY[0x263F151C8], MEMORY[0x263F151D8]);
}

uint64_t static PhotosPickerSelectionBehavior.default.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC30 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABEE8);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

uint64_t sub_217B4958C(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_267BABF00, MEMORY[0x263F151D0], MEMORY[0x263F151D8]);
}

uint64_t sub_217B495C8(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, unsigned int *a4, void (*a5)(void))
{
  uint64_t v8 = a2(0);
  __swift_allocate_value_buffer(v8, a3);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)a3);
  uint64_t v10 = *a4;
  a5(0);
  OUTLINED_FUNCTION_1();
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 104);

  return v13(v9, v10, v11);
}

uint64_t static PhotosPickerSelectionBehavior.ordered.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC38 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF00);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

uint64_t sub_217B496E8(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_267BABF18, MEMORY[0x263F151B8], MEMORY[0x263F151D8]);
}

uint64_t static PhotosPickerSelectionBehavior.continuous.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC40 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF18);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

uint64_t sub_217B497A4(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerSelectionBehavior, qword_267BABF30, MEMORY[0x263F151C0], MEMORY[0x263F151D8]);
}

uint64_t static PhotosPickerSelectionBehavior.continuousAndOrdered.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC48 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF30);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

uint64_t PhotosPickerSelectionBehavior.hash(into:)(uint64_t a1)
{
  return sub_217B4A0C0(a1, MEMORY[0x263F151D8]);
}

uint64_t PhotosPickerSelectionBehavior.hashValue.getter()
{
  return sub_217B4A174();
}

uint64_t sub_217B49900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_217B4A238(a1, a2, a3, MEMORY[0x263F151D8]);
}

uint64_t sub_217B49948(uint64_t a1)
{
  return sub_217B49A10(a1, qword_267BABF48, MEMORY[0x263F15160], 0);
}

uint64_t static PhotosPickerStyle.presentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerStyle(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF48);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerStyle);
}

uint64_t sub_217B499EC(uint64_t a1)
{
  return sub_217B49A10(a1, qword_267BABF60, MEMORY[0x263F15160], 1);
}

uint64_t sub_217B49A10(uint64_t a1, uint64_t *a2, void (*a3)(void), char a4)
{
  uint64_t v8 = sub_217B5F8A0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OUTLINED_FUNCTION_49();
  uint64_t v13 = type metadata accessor for PhotosPickerStyle(v12);
  __swift_allocate_value_buffer(v13, a2);
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)a2);
  a3();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v14, v4, v8);
  *(unsigned char *)(v14 + *(int *)(v13 + 20)) = a4;
  return result;
}

uint64_t static PhotosPickerStyle.inline.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC58 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerStyle(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF60);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerStyle);
}

uint64_t sub_217B49B64(uint64_t a1)
{
  return sub_217B49A10(a1, qword_267BABF78, MEMORY[0x263F15158], 1);
}

uint64_t static PhotosPickerStyle.compact.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC60 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerStyle(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF78);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerStyle);
}

uint64_t static PhotosPickerStyle.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (sub_217B5F880())
  {
    uint64_t v4 = type metadata accessor for PhotosPickerStyle(0);
    char v5 = *(unsigned char *)(a1 + *(int *)(v4 + 20)) ^ *(unsigned char *)(a2 + *(int *)(v4 + 20)) ^ 1;
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t PhotosPickerStyle.hash(into:)()
{
  return sub_217B5FE30();
}

uint64_t PhotosPickerStyle.hashValue.getter()
{
  return sub_217B5FE40();
}

uint64_t sub_217B49DA0()
{
  return sub_217B5FE40();
}

uint64_t sub_217B49E40(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, qword_267BABF90, MEMORY[0x263F151A0], MEMORY[0x263F151A8]);
}

uint64_t static PhotosPickerItem.EncodingDisambiguationPolicy.automatic.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC68 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABF90);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
}

uint64_t sub_217B49EFC(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, qword_267BABFA8, MEMORY[0x263F15198], MEMORY[0x263F151A8]);
}

uint64_t static PhotosPickerItem.EncodingDisambiguationPolicy.current.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC70 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABFA8);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
}

uint64_t sub_217B49FB8(uint64_t a1)
{
  return sub_217B495C8(a1, type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy, qword_267BABFC0, MEMORY[0x263F15190], MEMORY[0x263F151A8]);
}

uint64_t static PhotosPickerItem.EncodingDisambiguationPolicy.compatible.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267BABC78 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267BABFC0);
  return sub_217B4B188(v3, a1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
}

uint64_t PhotosPickerItem.EncodingDisambiguationPolicy.hash(into:)(uint64_t a1)
{
  return sub_217B4A0C0(a1, MEMORY[0x263F151A8]);
}

uint64_t sub_217B4A0C0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_57();

  return sub_217B5FB20();
}

uint64_t PhotosPickerItem.EncodingDisambiguationPolicy.hashValue.getter()
{
  return sub_217B4A174();
}

uint64_t sub_217B4A174()
{
  OUTLINED_FUNCTION_37_0();
  sub_217B5FE10();
  v0(0);
  OUTLINED_FUNCTION_57();
  sub_217B5FB20();
  return sub_217B5FE40();
}

uint64_t sub_217B4A1F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_217B4A238(a1, a2, a3, MEMORY[0x263F151A8]);
}

uint64_t sub_217B4A238(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return sub_217B5FE40();
}

uint64_t PhotosPickerItem.itemIdentifier.getter()
{
  if (*((unsigned char *)v0 + 16) != 1) {
    return 0;
  }
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PhotosPickerItem.supportedContentTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void PhotosPickerItem.loadTransferable<A>(type:completionHandler:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v39 = v7;
  uint64_t v36 = v8;
  sub_217B5F850();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_13_0();
  sub_217B5F870();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9_0();
  uint64_t v11 = *(void **)(v0 + 32);
  uint64_t v37 = v6;
  uint64_t v38 = v4;
  uint64_t v12 = sub_217B5F3E0();
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v35 = v1;
  uint64_t v34 = v2;
  if (v13)
  {
    sub_217B5F490();
    OUTLINED_FUNCTION_10_0();
    unint64_t v15 = v12 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    uint64_t v17 = *(void *)(v16 + 72);
    while (1)
    {
      id v18 = v11;
      unint64_t v19 = (void *)sub_217B5F450();
      id v20 = objc_msgSend(v18, sel_registeredContentTypesConformingToContentType_, v19);

      uint64_t v21 = sub_217B5FBB0();
      uint64_t v22 = *(void *)(v21 + 16);
      swift_bridgeObjectRelease();
      if (v22) {
        break;
      }
      v15 += v17;
      if (!--v13) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v32 = (void *)swift_allocObject();
    v32[2] = v37;
    v32[3] = v38;
    v32[4] = v36;
    v32[5] = v39;
    id v33 = v18;
    swift_retain();
    sub_217B5FC80();

    swift_release();
    OUTLINED_FUNCTION_4_0();
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    sub_217B47BE4(0, &qword_267BABDD8);
    uint64_t v23 = (void *)sub_217B5FC90();
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = v37;
    v24[3] = v38;
    v24[4] = v36;
    v24[5] = v39;
    v40[4] = sub_217B4B248;
    v40[5] = v24;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 1107296256;
    v40[2] = sub_217B4AC50;
    v40[3] = &block_descriptor_0;
    uint64_t v25 = _Block_copy(v40);
    swift_retain();
    swift_release();
    sub_217B5F860();
    v40[0] = MEMORY[0x263F8EE78];
    sub_217B4B120(&qword_267BABDE0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABDE8);
    sub_217B48944(&qword_267BABDF0, &qword_267BABDE8);
    sub_217B5FD30();
    MEMORY[0x21D455E80](0, v34, v35, v25);
    _Block_release(v25);

    uint64_t v26 = OUTLINED_FUNCTION_61();
    v27(v26);
    OUTLINED_FUNCTION_14_0();
    v28();
    objc_msgSend(self, sel_discreteProgressWithTotalUnitCount_, 0);
    OUTLINED_FUNCTION_4_0();
    id v31 = v29;
  }
}

id PhotosPickerItem.itemProvider.getter()
{
  return *(id *)(v0 + 32);
}

uint64_t sub_217B4A734(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = a2;
  sub_217B5FD10();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC398);
  uint64_t v7 = sub_217B5FE50();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - v9;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v11 = sub_217B5FE50();
  sub_217B4A918((void (*)(char *))sub_217B5E708, v11, (uint64_t)v10);
  v14(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_217B4A8A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);

  return __swift_storeEnumTagSinglePayload(a3, 0, 1, a2);
}

uint64_t sub_217B4A918@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v13 + 16))(v12, v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, char *, void))(*(void *)(*(void *)(a2 + 24) - 8) + 32))(a3, v12, *(void *)(a2 + 24));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v12, v6);
    a1(v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  sub_217B5FE50();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_217B4AB2C(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  sub_217B5FD10();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC398);
  uint64_t v5 = sub_217B5FE50();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - v7;
  __swift_storeEnumTagSinglePayload((uint64_t)&v10 - v7, 1, 1, a3);
  swift_storeEnumTagMultiPayload();
  a1(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_217B4AC50(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_217B4AC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_217B5FD10();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC398);
  uint64_t v9 = sub_217B5FC20();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v18 - v11;
  long long v13 = *(_OWORD *)(a2 + 16);
  v18[0] = *(_OWORD *)a2;
  v18[1] = v13;
  uint64_t v19 = *(void *)(a2 + 32);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v18 - v11, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v15 + v14, v12, v9);
  PhotosPickerItem.loadTransferable<A>(type:completionHandler:)();
  uint64_t v17 = v16;
  swift_release();
}

void sub_217B4AE40(uint64_t a1)
{
  sub_217B4AC94(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_217B4AE4C()
{
  sub_217B5F490();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14_0();
  v0();
  OUTLINED_FUNCTION_44();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_217B4AECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_217B5F490();
  OUTLINED_FUNCTION_8_0(v8);
  uint64_t v10 = v3 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_217B4AF9C;
  return sub_217B492BC(a1, a2, a3, v10);
}

uint64_t sub_217B4AF9C()
{
  OUTLINED_FUNCTION_0();
  swift_task_dealloc();
  OUTLINED_FUNCTION_56();
  return v0();
}

unint64_t sub_217B4B068()
{
  unint64_t result = qword_267BAC060;
  if (!qword_267BAC060)
  {
    sub_217B47BE4(255, &qword_267BAC058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC060);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for PhotosPickerSelectionBehavior(uint64_t a1)
{
  return sub_217B4796C(a1, (uint64_t *)&unk_267BAC0E8);
}

uint64_t sub_217B4B120(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for PhotosPickerStyle(uint64_t a1)
{
  return sub_217B4796C(a1, (uint64_t *)&unk_267BAC0F8);
}

uint64_t sub_217B4B188(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_20_0();
  v4();
  return a2;
}

uint64_t type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1)
{
  return sub_217B4796C(a1, qword_267BAC108);
}

uint64_t sub_217B4B204()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_217B4B23C(uint64_t a1)
{
  return sub_217B4A734(a1, *(void (**)(char *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_217B4B248()
{
  return sub_217B4AB2C(*(void (**)(char *))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_217B4B26C(uint64_t a1)
{
  sub_217B5FD10();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC398);
  uint64_t v2 = sub_217B5FC20();
  return sub_217B4B2D8(a1, v2);
}

uint64_t sub_217B4B2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_217B5FE50();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_217B5FC00();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_217B5FC10();
  }
}

id PhotosPickerItem.init(itemIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088E0]), sel_init);
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 1;
  *(void *)(a3 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a3 + 32) = result;
  return result;
}

uint64_t static PhotosPickerItem.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    if (v2 != v4) {
      return 0;
    }
  }
  else if (sub_217B5FDE0() & 1) == 0 || ((v2 ^ v4))
  {
    return 0;
  }
  if (sub_217B4B638(v3, v5))
  {
    sub_217B47BE4(0, &qword_267BAC080);
    return sub_217B5FCF0() & 1;
  }
  return 0;
}

uint64_t sub_217B4B638(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5F490();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      uint64_t v31 = v7;
      uint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      uint64_t v30 = (void (**)(uint64_t, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      uint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        uint64_t v19 = v9;
        id v20 = v9;
        uint64_t v21 = v32;
        v32((uint64_t)v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        uint64_t v9 = v20;
        sub_217B4B120(&qword_267BAC350, MEMORY[0x263F8F3A0]);
        char v23 = sub_217B5FB30();
        uint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24((uint64_t)v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v14 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_217B4B858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5F490();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  v61 = (char *)&v44 - v8;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v9 || a1 == a2) {
    return 1;
  }
  uint64_t v10 = 0;
  uint64_t v48 = a2 + 32;
  uint64_t v49 = a1 + 32;
  uint64_t v11 = v6 + 16;
  uint64_t v46 = v6;
  uint64_t v47 = v9;
  uint64_t v57 = v7;
  v58 = (void (**)(char *, uint64_t))(v6 + 8);
  while (1)
  {
    uint64_t v12 = (uint64_t *)(v49 + 40 * v10);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    int v15 = *((unsigned __int8 *)v12 + 16);
    uint64_t v16 = v12[3];
    uint64_t v17 = (uint64_t *)(v48 + 40 * v10);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    int v20 = *((unsigned __int8 *)v17 + 16);
    uint64_t v22 = v17[3];
    uint64_t v21 = (void *)v17[4];
    id v52 = (id)v12[4];
    id v53 = v21;
    BOOL v23 = v13 == v18 && v14 == v19;
    uint64_t v60 = v16;
    if (v23)
    {
      if (v15 != v20) {
        return 0;
      }
    }
    else
    {
      uint64_t v24 = v14;
      uint64_t v25 = v19;
      char v26 = sub_217B5FDE0();
      uint64_t result = 0;
      if ((v26 & 1) == 0) {
        return result;
      }
      uint64_t v19 = v25;
      uint64_t v14 = v24;
      uint64_t v16 = v60;
      if ((v15 ^ v20)) {
        return result;
      }
    }
    uint64_t v28 = *(void *)(v16 + 16);
    if (v28 != *(void *)(v22 + 16)) {
      return 0;
    }
    uint64_t v54 = v19;
    uint64_t v50 = v10;
    uint64_t v51 = v14;
    if (v28)
    {
      if (v16 != v22) {
        break;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v39 = v52;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v40 = v53;
LABEL_22:
    sub_217B47BE4(0, &qword_267BAC080);
    id v41 = v52;
    id v42 = v53;
    char v43 = sub_217B5FCF0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0) {
      return 0;
    }
    uint64_t v10 = v50 + 1;
    uint64_t result = 1;
    if (v50 + 1 == v47) {
      return result;
    }
  }
  uint64_t v56 = v28;
  unint64_t v29 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  uint64_t v55 = *(void *)(v46 + 72);
  uint64_t v30 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v46 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v45 = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v44 = v53;
  unint64_t v31 = 0;
  uint64_t v59 = v22;
  while (1)
  {
    uint64_t result = v30(v61, v16 + v29, v4);
    if (v31 >= *(void *)(v22 + 16)) {
      break;
    }
    unint64_t v32 = v22 + v29;
    uint64_t v33 = v57;
    uint64_t v34 = v11;
    uint64_t v35 = v30;
    v30(v57, v32, v4);
    sub_217B4B120(&qword_267BAC350, MEMORY[0x263F8F3A0]);
    uint64_t v36 = v61;
    char v37 = sub_217B5FB30();
    uint64_t v38 = *v58;
    (*v58)(v33, v4);
    v38(v36, v4);
    if ((v37 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    ++v31;
    v29 += v55;
    uint64_t v11 = v34;
    uint64_t v22 = v59;
    uint64_t v16 = v60;
    uint64_t v30 = v35;
    if (v56 == v31) {
      goto LABEL_22;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_217B4BC70(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = sub_217B5FDE0();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v8 = a1 + 7;
  uint64_t v9 = a2 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      uint64_t result = sub_217B5FDE0();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

void PhotosPickerItem.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void **)(v1 + 32);
  swift_bridgeObjectRetain();
  sub_217B5FB60();
  swift_bridgeObjectRelease();
  sub_217B5FE30();
  swift_bridgeObjectRetain();
  sub_217B57E50(a1, v3);
  swift_bridgeObjectRelease();
  id v5 = v4;
  sub_217B5FD00();
}

uint64_t PhotosPickerItem.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void **)(v0 + 32);
  sub_217B5FE10();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_44();
  sub_217B5FB60();
  swift_bridgeObjectRelease();
  sub_217B5FE30();
  swift_bridgeObjectRetain();
  sub_217B57E50((uint64_t)v5, v1);
  swift_bridgeObjectRelease();
  id v3 = v2;
  sub_217B5FD00();

  return sub_217B5FE40();
}

uint64_t sub_217B4BEB8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void **)(v0 + 32);
  sub_217B5FE10();
  swift_bridgeObjectRetain();
  sub_217B5FB60();
  swift_bridgeObjectRelease();
  sub_217B5FE30();
  swift_bridgeObjectRetain();
  sub_217B57E50((uint64_t)v5, v1);
  swift_bridgeObjectRelease();
  id v3 = v2;
  sub_217B5FD00();

  return sub_217B5FE40();
}

uint64_t sub_217B4BF64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v60 = a7;
  int v55 = a6;
  uint64_t v56 = a4;
  uint64_t v57 = a3;
  uint64_t v58 = a2;
  uint64_t v54 = a8;
  uint64_t v10 = sub_217B5F9B0();
  uint64_t v52 = *(void *)(v10 - 8);
  uint64_t v53 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v51 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_217B5FA90();
  uint64_t v49 = *(void *)(v12 - 8);
  uint64_t v50 = v12;
  MEMORY[0x270FA5388](v12);
  id v45 = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  int v20 = (char *)v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v44 - v21;
  uint64_t v23 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_217B5FAC0();
  uint64_t v47 = *(void *)(v26 - 8);
  uint64_t v48 = v26;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  unint64_t v29 = (char *)v44 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v46 = (char *)v44 - v30;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = 0;
  *(void *)(v31 + 24) = 0;
  long long v32 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v31 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v31 + 48) = v32;
  *(_OWORD *)(v31 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v31 + 80) = *(void *)(a1 + 48);
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = 0;
  *(void *)(v33 + 24) = 0;
  long long v34 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v33 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v33 + 48) = v34;
  *(_OWORD *)(v33 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v33 + 80) = *(void *)(a1 + 48);
  uint64_t v59 = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B57F6C((void *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  v44[2] = v62;
  v44[3] = v61;
  v44[1] = v63;
  uint64_t v35 = self;
  unsigned int v36 = objc_msgSend(v35, sel_isMultiLibraryModeEnabled);
  char v37 = &selRef_imagePickerPhotoLibrary;
  if (!v36) {
    char v37 = &selRef_sharedPhotoLibrary;
  }
  id v38 = [v35 *v37];
  if (qword_267BABC30 != -1) {
    swift_once();
  }
  uint64_t v39 = __swift_project_value_buffer(v23, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v39, (uint64_t)v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v40 = v58;
  sub_217B5E6B0(v58, (uint64_t)v22, &qword_267BAC088);
  uint64_t v41 = v57;
  sub_217B4B188(v57, (uint64_t)v16, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v42 = v38;
  sub_217B5F930();
  sub_217B5F950();
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v45, v25, v50);
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v22, (uint64_t)v20, &qword_267BAC088);
  sub_217B5FA70();
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v16, v53);
  sub_217B5FA10();

  sub_217B58034((uint64_t)v16, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v22, &qword_267BAC088);
  sub_217B58034((uint64_t)v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v29, v48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B4D1FC();
  sub_217B58034(v41, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v40, &qword_267BAC088);
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_217B4C578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(long long *__return_ptr, uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  void (*v56)(long long *__return_ptr, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  uint64_t v56 = a4;
  uint64_t v57 = a5;
  uint64_t v58 = a3;
  uint64_t v59 = a2;
  uint64_t v55 = a6;
  uint64_t v7 = sub_217B5F9B0();
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v52 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_217B5FA90();
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v49 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_217B5FAC0();
  uint64_t v47 = *(void *)(v23 - 8);
  uint64_t v48 = v23;
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v42 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v46 = (char *)&v42 - v27;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = 0;
  *(void *)(v28 + 24) = 0;
  long long v29 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v28 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v28 + 48) = v29;
  *(_OWORD *)(v28 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v28 + 80) = *(void *)(a1 + 48);
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = 0;
  *(void *)(v30 + 24) = 0;
  long long v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 48) = v31;
  *(_OWORD *)(v30 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v30 + 80) = *(void *)(a1 + 48);
  sub_217B57F6C((void *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  uint64_t v44 = v61;
  uint64_t v45 = v60;
  uint64_t v43 = v62;
  long long v32 = self;
  unsigned int v33 = objc_msgSend(v32, sel_isMultiLibraryModeEnabled);
  long long v34 = &selRef_imagePickerPhotoLibrary;
  if (!v33) {
    long long v34 = &selRef_sharedPhotoLibrary;
  }
  id v35 = [v32 *v34];
  if (qword_267BABC30 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v20, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v36, (uint64_t)v22, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v37 = v59;
  sub_217B5E6B0(v59, (uint64_t)v19, &qword_267BAC088);
  uint64_t v38 = v58;
  sub_217B4B188(v58, (uint64_t)v13, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v39 = v35;
  sub_217B5F930();
  sub_217B5F950();
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v22, v51);
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v19, (uint64_t)v17, &qword_267BAC088);
  sub_217B5FA70();
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v13, v54);
  sub_217B5FA10();

  sub_217B58034((uint64_t)v13, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v19, &qword_267BAC088);
  sub_217B58034((uint64_t)v22, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v40 = (uint64_t)v46;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v26, v48);
  sub_217B4D3F0(v45, v44, v43, v40, 1, v56, v55);
  sub_217B58034(v38, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  return sub_217B5E660(v37, &qword_267BAC088);
}

void PhotosPicker.init(selection:matching:preferredItemEncoding:label:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v53 = v5;
  uint64_t v54 = v4;
  uint64_t v55 = v6;
  uint64_t v56 = v7;
  uint64_t v57 = v9;
  uint64_t v58 = v8;
  OUTLINED_FUNCTION_71(v10);
  OUTLINED_FUNCTION_0_0();
  uint64_t v50 = v12;
  uint64_t v51 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v49 = OUTLINED_FUNCTION_12_0(v13, v41);
  OUTLINED_FUNCTION_0_0();
  uint64_t v48 = v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v17 = OUTLINED_FUNCTION_6_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_19_0();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v19 = OUTLINED_FUNCTION_6_0(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_38_0();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v41 - v21;
  uint64_t v23 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v24);
  uint64_t v47 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_0_0();
  uint64_t v46 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_25_0();
  uint64_t v28 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_33_0(v28);
  uint64_t v29 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_26_0(v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  uint64_t v44 = v59;
  uint64_t v43 = v60;
  uint64_t v42 = v61;
  uint64_t v30 = self;
  unsigned int v31 = objc_msgSend(v30, sel_isMultiLibraryModeEnabled);
  long long v32 = &selRef_imagePickerPhotoLibrary;
  if (!v31) {
    long long v32 = &selRef_sharedPhotoLibrary;
  }
  id v33 = [v30 *v32];
  if (qword_267BABC30 != -1) {
    swift_once();
  }
  uint64_t v34 = __swift_project_value_buffer(v23, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v34, v0, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_67();
  uint64_t v35 = v57;
  sub_217B4B188(v57, v1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v36 = v33;
  sub_217B5F930();
  sub_217B5F950();
  OUTLINED_FUNCTION_20_0();
  v37();
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v22, v45, &qword_267BAC088);
  sub_217B5FA70();
  OUTLINED_FUNCTION_20_0();
  v38();
  sub_217B5FA10();

  sub_217B58034(v1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v22, &qword_267BAC088);
  sub_217B58034(v0, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v39 = OUTLINED_FUNCTION_28_0();
  v40(v39);
  sub_217B4D5B8(v44, v43, v42, v3, 1, v54, v55, v56, v52);
  sub_217B58034(v35, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v2, &qword_267BAC088);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B4CF8C(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  v23[1] = a3;
  uint64_t v24 = a2;
  uint64_t v8 = sub_217B5F9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_217B5FA90();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a1;
  sub_217B5F930();
  sub_217B5F950();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a4, v15);
  sub_217B5FAB0();
  uint64_t v20 = v25;
  sub_217B5E6B0(v25, (uint64_t)v14, &qword_267BAC088);
  sub_217B5FA70();
  uint64_t v21 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v26, v8);
  sub_217B5FA10();

  sub_217B58034(v21, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v20, &qword_267BAC088);
  return sub_217B58034(a4, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

void sub_217B4D1FC()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v27 = v1;
  char v26 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC400);
  uint64_t v12 = (int *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_18_0();
  sub_217B5F790();
  *(unsigned char *)uint64_t v0 = v28;
  *(void *)(v0 + 8) = v29;
  *(void *)(v0 + 40) = swift_getKeyPath();
  *(unsigned char *)(v0 + 48) = 0;
  uint64_t v13 = (uint64_t *)(v0 + v12[13]);
  *uint64_t v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC0B0);
  swift_storeEnumTagMultiPayload();
  *(void *)(v0 + 16) = v10;
  *(void *)(v0 + 24) = v8;
  *(void *)(v0 + 32) = v6;
  uint64_t v14 = v0 + v12[14];
  uint64_t v15 = sub_217B5FAC0();
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v4, v15);
  *(unsigned char *)(v0 + v12[15]) = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_217B5F6E0();
  uint64_t v19 = v18;
  LOBYTE(v13) = v20;
  uint64_t v22 = v21;
  uint64_t v23 = OUTLINED_FUNCTION_61();
  v24(v23);
  uint64_t v25 = v0 + v12[16];
  *(void *)uint64_t v25 = v17;
  *(void *)(v25 + 8) = v19;
  *(unsigned char *)(v25 + 16) = v13 & 1;
  *(void *)(v25 + 24) = v22;
  sub_217B5E414(v0, v27, &qword_267BAC400);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_0();
}

double sub_217B4D3F0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, void (*a6)(long long *__return_ptr, uint64_t)@<X5>, uint64_t a7@<X8>)
{
  char v28 = 0;
  sub_217B5F790();
  uint64_t v13 = *((void *)&v25 + 1);
  *(unsigned char *)a7 = v25;
  *(void *)(a7 + 8) = v13;
  *(void *)(a7 + 40) = swift_getKeyPath();
  *(unsigned char *)(a7 + 48) = 0;
  uint64_t v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BAC400);
  uint64_t v15 = (uint64_t *)(a7 + v14[11]);
  *uint64_t v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC0B0);
  swift_storeEnumTagMultiPayload();
  *(void *)(a7 + 16) = a1;
  *(void *)(a7 + 24) = a2;
  *(void *)(a7 + 32) = a3;
  uint64_t v16 = a7 + v14[12];
  uint64_t v17 = sub_217B5FAC0();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a4, v17);
  *(unsigned char *)(a7 + v14[13]) = a5;
  swift_retain();
  swift_retain();
  uint64_t v19 = swift_bridgeObjectRetain();
  a6(&v25, v19);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a4, v17);
  uint64_t v20 = a7 + v14[14];
  char v21 = v26;
  uint64_t v22 = v27;
  double result = *(double *)&v25;
  *(_OWORD *)uint64_t v20 = v25;
  *(unsigned char *)(v20 + 16) = v21;
  *(void *)(v20 + 24) = v22;
  return result;
}

uint64_t sub_217B4D5B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v27 = a7;
  char v28 = a6;
  int v26 = a5;
  uint64_t v25 = a8;
  uint64_t v29 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)a9 = sub_217B509E0() & 1;
  *(void *)(a9 + 8) = v16;
  *(void *)(a9 + 40) = swift_getKeyPath();
  *(unsigned char *)(a9 + 48) = 0;
  uint64_t v17 = (int *)type metadata accessor for PhotosPicker();
  uint64_t v18 = (uint64_t *)(a9 + v17[11]);
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC0B0);
  swift_storeEnumTagMultiPayload();
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  uint64_t v19 = a9 + v17[12];
  uint64_t v20 = sub_217B5FAC0();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, a4, v20);
  *(unsigned char *)(a9 + v17[13]) = v26;
  swift_retain();
  swift_retain();
  uint64_t v22 = swift_bridgeObjectRetain();
  v28(v22);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a4, v20);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(a9 + v17[14], v15, v25);
}

uint64_t sub_217B4D7F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, unsigned __int8 a12)
{
  uint64_t v33 = a8;
  uint64_t v34 = a4;
  int v32 = a5;
  uint64_t v40 = a3;
  uint64_t v35 = a9;
  uint64_t v36 = a1;
  int v39 = a12;
  uint64_t v37 = a10;
  uint64_t v38 = a2;
  uint64_t v31 = a11;
  uint64_t v14 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_217B5FAC0();
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v24 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unsigned int v25 = objc_msgSend(v24, sel_isMultiLibraryModeEnabled, v31);
  int v26 = &selRef_imagePickerPhotoLibrary;
  if (!v25) {
    int v26 = &selRef_sharedPhotoLibrary;
  }
  id v27 = [v24 *v26];
  int v28 = v32 & 1;
  sub_217B4B188(a6, (uint64_t)v22, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a7, (uint64_t)v19, &qword_267BAC088);
  uint64_t v29 = v33;
  sub_217B4B188(v33, (uint64_t)v16, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B4CF8C(v27, v34, v28, (uint64_t)v22, (uint64_t)v19, (uint64_t)v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B4D1FC();
  sub_217B58034(v29, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(a7, &qword_267BAC088);
  sub_217B58034(a6, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_217B4DAF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void (*a10)(long long *__return_ptr, uint64_t), uint64_t a11)
{
  void (*v38)(long long *__return_ptr, uint64_t);
  uint64_t v39;

  uint64_t v33 = a4;
  uint64_t v34 = a9;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v38 = a10;
  int v39 = a3;
  uint64_t v37 = a11;
  uint64_t v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_217B5FAC0();
  MEMORY[0x270FA5388](v24 - 8);
  int v26 = (char *)&v32 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v27 = self;
  unsigned int v28 = objc_msgSend(v27, sel_isMultiLibraryModeEnabled);
  uint64_t v29 = &selRef_imagePickerPhotoLibrary;
  if (!v28) {
    uint64_t v29 = &selRef_sharedPhotoLibrary;
  }
  id v30 = [v27 *v29];
  sub_217B4B188(a6, (uint64_t)v23, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a7, (uint64_t)v20, &qword_267BAC088);
  sub_217B4B188(a8, (uint64_t)v17, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B4CF8C(v30, v33, a5 & 1, (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);
  sub_217B4D3F0(v35, v36, v39, (uint64_t)v26, 1, v38, v34);
  sub_217B58034(a8, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(a7, &qword_267BAC088);
  return sub_217B58034(a6, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

void PhotosPicker.init(selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t),uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  char v34 = v33;
  uint64_t v56 = v35;
  uint64_t v57 = v36;
  uint64_t v55 = v37;
  uint64_t v60 = a21;
  uint64_t v61 = v38;
  uint64_t v58 = a23;
  uint64_t v59 = a22;
  uint64_t v53 = v39;
  uint64_t v54 = a24;
  uint64_t v40 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v41 = OUTLINED_FUNCTION_6_0(v40);
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_13_0();
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v43 = OUTLINED_FUNCTION_6_0(v42);
  MEMORY[0x270FA5388](v43);
  uint64_t v45 = (char *)&v52 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v47 = OUTLINED_FUNCTION_6_0(v46);
  MEMORY[0x270FA5388](v47);
  uint64_t v48 = OUTLINED_FUNCTION_15_0();
  uint64_t v49 = OUTLINED_FUNCTION_6_0(v48);
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_9_0();
  int v50 = objc_msgSend(self, sel_isMultiLibraryModeEnabled);
  id v51 = OUTLINED_FUNCTION_68(v50, (const char **)&selRef_imagePickerPhotoLibrary);
  sub_217B4B188(v32, v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(v30, (uint64_t)v45, &qword_267BAC088);
  sub_217B4B188(v28, v24, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B4CF8C(v51, v53, v34 & 1, v25, (uint64_t)v45, v24);
  sub_217B4D5B8(v56, v57, v61, v26, 1, v60, v59, v58, v55);
  sub_217B58034(v28, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v30, &qword_267BAC088);
  sub_217B58034(v32, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B4DFE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v60 = a8;
  int v55 = a7;
  uint64_t v56 = a5;
  uint64_t v57 = a3;
  id v46 = a4;
  uint64_t v58 = a2;
  uint64_t v54 = a9;
  uint64_t v11 = sub_217B5F9B0();
  uint64_t v52 = *(void *)(v11 - 8);
  uint64_t v53 = v11;
  MEMORY[0x270FA5388](v11);
  id v51 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_217B5FA90();
  uint64_t v49 = *(void *)(v13 - 8);
  uint64_t v50 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v44 = (char *)v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v45 = (uint64_t)v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v43 - v21;
  uint64_t v23 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_217B5FAC0();
  uint64_t v47 = *(void *)(v26 - 8);
  uint64_t v48 = v26;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)v43 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)v43 - v30;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = 0;
  *(void *)(v32 + 24) = 0;
  long long v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v32 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v32 + 48) = v33;
  *(_OWORD *)(v32 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v32 + 80) = *(void *)(a1 + 48);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = 0;
  *(void *)(v34 + 24) = 0;
  long long v35 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v34 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v34 + 48) = v35;
  *(_OWORD *)(v34 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v34 + 80) = *(void *)(a1 + 48);
  uint64_t v59 = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B57F6C((void *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  v43[2] = v61;
  v43[1] = v62;
  v43[0] = v63;
  uint64_t v36 = qword_267BABC30;
  id v37 = v46;
  if (v36 != -1) {
    swift_once();
  }
  uint64_t v38 = __swift_project_value_buffer(v23, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v38, (uint64_t)v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v39 = v58;
  sub_217B5E6B0(v58, (uint64_t)v22, &qword_267BAC088);
  uint64_t v40 = v57;
  sub_217B4B188(v57, (uint64_t)v17, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v41 = v37;
  sub_217B5F930();
  sub_217B5F950();
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v44, v25, v50);
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v22, v45, &qword_267BAC088);
  sub_217B5FA70();
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v17, v53);
  sub_217B5FA10();

  sub_217B58034((uint64_t)v17, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v22, &qword_267BAC088);
  sub_217B58034((uint64_t)v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v31, v29, v48);
  sub_217B4D1FC();

  sub_217B58034(v40, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v39, &qword_267BAC088);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217B4E5BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void (*a5)(long long *__return_ptr, uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  void (*v55)(long long *__return_ptr, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  int v55 = a5;
  uint64_t v56 = a6;
  id v46 = a4;
  uint64_t v57 = a3;
  uint64_t v58 = a2;
  uint64_t v54 = a7;
  uint64_t v8 = sub_217B5F9B0();
  uint64_t v52 = *(void *)(v8 - 8);
  uint64_t v53 = v8;
  MEMORY[0x270FA5388](v8);
  id v51 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_217B5FA90();
  uint64_t v49 = *(void *)(v10 - 8);
  uint64_t v50 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v45 = (uint64_t)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v41 - v19;
  uint64_t v21 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v41 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_217B5FAC0();
  uint64_t v47 = *(void *)(v24 - 8);
  uint64_t v48 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v41 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v41 - v28;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = 0;
  *(void *)(v30 + 24) = 0;
  long long v31 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 48) = v31;
  *(_OWORD *)(v30 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v30 + 80) = *(void *)(a1 + 48);
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = 0;
  *(void *)(v32 + 24) = 0;
  long long v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v32 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v32 + 48) = v33;
  *(_OWORD *)(v32 + 64) = *(_OWORD *)(a1 + 32);
  *(void *)(v32 + 80) = *(void *)(a1 + 48);
  sub_217B57F6C((void *)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  uint64_t v43 = v60;
  uint64_t v44 = v59;
  uint64_t v42 = v61;
  uint64_t v34 = qword_267BABC30;
  id v35 = v46;
  if (v34 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v21, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v36, (uint64_t)v23, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v37 = v58;
  sub_217B5E6B0(v58, (uint64_t)v20, &qword_267BAC088);
  uint64_t v38 = v57;
  sub_217B4B188(v57, (uint64_t)v15, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v39 = v35;
  sub_217B5F930();
  sub_217B5F950();
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v12, v23, v50);
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v20, v45, &qword_267BAC088);
  sub_217B5FA70();
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v15, v53);
  sub_217B5FA10();

  sub_217B58034((uint64_t)v15, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v20, &qword_267BAC088);
  sub_217B58034((uint64_t)v23, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v29, v27, v48);
  sub_217B4D3F0(v44, v43, v42, (uint64_t)v29, 0, v55, v54);

  sub_217B58034(v38, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  return sub_217B5E660(v37, &qword_267BAC088);
}

void PhotosPicker.init(selection:matching:preferredItemEncoding:photoLibrary:label:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v51 = v4;
  uint64_t v52 = v3;
  uint64_t v53 = v5;
  uint64_t v54 = v6;
  id v43 = v7;
  uint64_t v55 = v9;
  uint64_t v56 = v8;
  OUTLINED_FUNCTION_71(v10);
  OUTLINED_FUNCTION_0_0();
  uint64_t v48 = v12;
  uint64_t v49 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v47 = OUTLINED_FUNCTION_12_0(v13, v39);
  OUTLINED_FUNCTION_0_0();
  uint64_t v46 = v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v17 = OUTLINED_FUNCTION_6_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_19_0();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v19 = OUTLINED_FUNCTION_6_0(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_38_0();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v39 - v21;
  uint64_t v23 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v24);
  uint64_t v45 = OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_0_0();
  uint64_t v44 = v25;
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_25_0();
  uint64_t v28 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_33_0(v28);
  uint64_t v29 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_26_0(v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  uint64_t v41 = v57;
  uint64_t v40 = v58;
  uint64_t v39 = v59;
  uint64_t v30 = qword_267BABC30;
  id v31 = v43;
  if (v30 != -1) {
    swift_once();
  }
  uint64_t v32 = __swift_project_value_buffer(v23, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v32, v0, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_67();
  uint64_t v33 = v55;
  sub_217B4B188(v55, v1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v34 = v31;
  sub_217B5F930();
  sub_217B5F950();
  OUTLINED_FUNCTION_20_0();
  v35();
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v22, v42, &qword_267BAC088);
  sub_217B5FA70();
  OUTLINED_FUNCTION_20_0();
  v36();
  sub_217B5FA10();

  sub_217B58034(v1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v22, &qword_267BAC088);
  sub_217B58034(v0, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  uint64_t v37 = OUTLINED_FUNCTION_28_0();
  v38(v37);
  sub_217B4D5B8(v41, v40, v39, v2, 0, v52, v53, v54, v50);

  sub_217B58034(v33, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v30, &qword_267BAC088);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B4EF64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void *a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  uint64_t v31 = a4;
  uint64_t v32 = a9;
  uint64_t v37 = a3;
  uint64_t v33 = a1;
  int v36 = a13;
  uint64_t v34 = a11;
  uint64_t v35 = a2;
  id v29 = a10;
  int v30 = a5 & 1;
  uint64_t v16 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v28 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_217B5FAC0();
  MEMORY[0x270FA5388](v25 - 8);
  sub_217B4B188(a6, (uint64_t)v24, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a7, (uint64_t)v21, &qword_267BAC088);
  sub_217B4B188(a8, (uint64_t)v18, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v26 = v29;
  sub_217B4CF8C(v26, v31, v30, (uint64_t)v24, (uint64_t)v21, (uint64_t)v18);
  sub_217B4D1FC();

  sub_217B58034(a8, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(a7, &qword_267BAC088);
  sub_217B58034(a6, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217B4F208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, void *a10, void (*a11)(long long *__return_ptr, uint64_t), uint64_t a12)
{
  void (*v34)(long long *__return_ptr, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  uint64_t v31 = a4;
  uint64_t v32 = a9;
  uint64_t v33 = a1;
  int v36 = a12;
  uint64_t v37 = a3;
  uint64_t v34 = a11;
  uint64_t v35 = a2;
  int v15 = a5 & 1;
  uint64_t v16 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_217B5FAC0();
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v30 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B4B188(a6, (uint64_t)v24, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a7, (uint64_t)v21, &qword_267BAC088);
  sub_217B4B188(a8, (uint64_t)v18, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v28 = a10;
  sub_217B4CF8C(v28, v31, v15, (uint64_t)v24, (uint64_t)v21, (uint64_t)v18);
  sub_217B4D3F0(v33, v35, v37, (uint64_t)v27, 0, v34, v32);

  sub_217B58034(a8, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(a7, &qword_267BAC088);
  return sub_217B58034(a6, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
}

void PhotosPicker.init(selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void (*a22)(uint64_t),uint64_t a23,uint64_t a24,uint64_t a25)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v57 = v34;
  uint64_t v58 = v35;
  uint64_t v55 = v36;
  uint64_t v60 = a23;
  uint64_t v61 = v37;
  uint64_t v59 = a24;
  uint64_t v53 = v38;
  uint64_t v54 = a25;
  uint64_t v56 = a22;
  int v40 = v39 & 1;
  uint64_t v41 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v42 = OUTLINED_FUNCTION_6_0(v41);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_18_0();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v44 = OUTLINED_FUNCTION_6_0(v43);
  MEMORY[0x270FA5388](v44);
  uint64_t v46 = (char *)&v52 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v48 = OUTLINED_FUNCTION_6_0(v47);
  MEMORY[0x270FA5388](v48);
  uint64_t v49 = OUTLINED_FUNCTION_15_0();
  uint64_t v50 = OUTLINED_FUNCTION_6_0(v49);
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_9_0();
  sub_217B4B188(v33, v26, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(v31, (uint64_t)v46, &qword_267BAC088);
  sub_217B4B188(v29, v25, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v51 = a21;
  sub_217B4CF8C(v51, v53, v40, v26, (uint64_t)v46, v25);
  sub_217B4D5B8(v57, v58, v61, v27, 0, v56, v60, v59, v55);

  sub_217B58034(v29, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v31, &qword_267BAC088);
  sub_217B58034(v33, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker.body.getter()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v111 = v4;
  uint64_t v98 = sub_217B5FAC0();
  OUTLINED_FUNCTION_0_0();
  v96[2] = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_23_0();
  uint64_t v97 = v7;
  uint64_t v8 = type metadata accessor for PhotosPickerViewController(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v9);
  v99 = (void *)((char *)v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = *(void *)(v3 + 24);
  v102 = *(char **)(v3 + 16);
  v100 = (char *)v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = v16;
  uint64_t v17 = sub_217B5F7E0();
  OUTLINED_FUNCTION_0_0();
  v96[1] = v18;
  MEMORY[0x270FA5388](v19);
  v96[0] = (char *)v96 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC090);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC098);
  uint64_t v24 = sub_217B5F5C0();
  unint64_t v25 = sub_217B580B0();
  uint64_t v115 = v23;
  uint64_t v116 = v24;
  uint64_t v117 = v25;
  uint64_t v118 = MEMORY[0x263F1A0E0];
  uint64_t v26 = OUTLINED_FUNCTION_72();
  uint64_t v108 = v21;
  uint64_t v109 = v17;
  uint64_t v115 = v17;
  uint64_t v116 = v21;
  uint64_t v112 = WitnessTable;
  uint64_t v117 = WitnessTable;
  uint64_t v118 = v26;
  uint64_t v106 = v26;
  swift_getOpaqueTypeMetadata2();
  OUTLINED_FUNCTION_0_0();
  uint64_t v28 = v27;
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v32 = (void *)((char *)v96 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)v96 - v33;
  uint64_t v103 = v35;
  uint64_t v110 = v8;
  uint64_t v107 = sub_217B5F5B0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v105 = v36;
  MEMORY[0x270FA5388](v37);
  v104 = (char *)v96 - v38;
  if (sub_217B4FED4())
  {
    char v39 = v100;
    OUTLINED_FUNCTION_58();
    v40();
    uint64_t v41 = *(unsigned __int8 *)(v12 + 80);
    uint64_t v98 = v28;
    uint64_t v42 = (v41 + 32) & ~v41;
    uint64_t v43 = swift_allocObject();
    uint64_t v44 = v102;
    v99 = v32;
    uint64_t v45 = v101;
    *(void *)(v43 + 16) = v102;
    *(void *)(v43 + 24) = v45;
    uint64_t v46 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v43 + v42, v39, v3);
    MEMORY[0x270FA5388](v46);
    v96[-4] = v44;
    v96[-3] = v45;
    uint64_t v95 = v1;
    sub_217B5F7D0();
    uint64_t v47 = sub_217B50178();
    uint64_t v49 = v48;
    char v51 = v50;
    uint64_t v52 = sub_217B501CC();
    v102 = v34;
    uint64_t v53 = v1 + *(int *)(v3 + 48);
    int v54 = *(unsigned __int8 *)(v1 + *(int *)(v3 + 52));
    uint64_t v55 = v109;
    uint64_t v56 = v112;
    sub_217B50220(v47, v49, v51 & 1, v52, v57, v58, v53, v54, (uint64_t)v99, v109, v112);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_14_0();
    v59();
    uint64_t v60 = v108;
    uint64_t v115 = v55;
    uint64_t v116 = v108;
    uint64_t v61 = v106;
    uint64_t v117 = v56;
    uint64_t v118 = v106;
    uint64_t v101 = OUTLINED_FUNCTION_72();
    uint64_t v63 = v98;
    uint64_t v62 = v99;
    v64 = *(void (**)(char *, uint64_t *, uint64_t))(v98 + 16);
    v65 = v102;
    uint64_t v66 = v103;
    v64(v102, v99, v103);
    v67 = *(void (**)(void))(v63 + 8);
    OUTLINED_FUNCTION_52();
    v67();
    v64((char *)v62, (uint64_t *)v65, v66);
    sub_217B4B120(&qword_267BAC0A8, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
    v68 = v104;
    sub_217B5047C((uint64_t)v62, v66);
    OUTLINED_FUNCTION_52();
    v67();
    OUTLINED_FUNCTION_52();
    v67();
    uint64_t v69 = v112;
  }
  else
  {
    sub_217B5FC40();
    uint64_t v70 = sub_217B5FC30();
    uint64_t v71 = swift_allocObject();
    uint64_t v72 = MEMORY[0x263F8F500];
    *(void *)(v71 + 16) = v70;
    *(void *)(v71 + 24) = v72;
    v73 = v100;
    OUTLINED_FUNCTION_58();
    v74();
    uint64_t v75 = sub_217B5FC30();
    unint64_t v76 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v77 = (char *)swift_allocObject();
    *((void *)v77 + 2) = v75;
    *((void *)v77 + 3) = v72;
    uint64_t v78 = v101;
    *((void *)v77 + 4) = v102;
    *((void *)v77 + 5) = v78;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v77[v76], v73, v3);
    sub_217B5F820();
    uint64_t v79 = v115;
    uint64_t v80 = v116;
    LOBYTE(v73) = v117;
    uint64_t v81 = sub_217B501CC();
    uint64_t v83 = v82;
    uint64_t v85 = v84;
    uint64_t v86 = v97;
    OUTLINED_FUNCTION_20_0();
    v87();
    char v88 = *(unsigned char *)(v1 + *(int *)(v3 + 52));
    v89 = v99;
    sub_217B506B8(v79, v80, (char)v73, v81, v83, v85, v86, v88, v99);
    uint64_t v60 = v108;
    uint64_t v55 = v109;
    uint64_t v115 = v109;
    uint64_t v116 = v108;
    uint64_t v69 = v112;
    uint64_t v61 = v106;
    uint64_t v117 = v112;
    uint64_t v118 = v106;
    OUTLINED_FUNCTION_72();
    sub_217B4B120(&qword_267BAC0A8, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
    v68 = v104;
    sub_217B508E8((uint64_t)v89, v103, v110);
    sub_217B58034((uint64_t)v89, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  }
  uint64_t v115 = v55;
  uint64_t v116 = v60;
  uint64_t v117 = v69;
  uint64_t v118 = v61;
  uint64_t v90 = OUTLINED_FUNCTION_72();
  uint64_t v91 = sub_217B4B120(&qword_267BAC0A8, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
  uint64_t v113 = v90;
  uint64_t v114 = v91;
  uint64_t v92 = v107;
  swift_getWitnessTable();
  uint64_t v93 = v105;
  OUTLINED_FUNCTION_58();
  v94();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v68, v92);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B4FED4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  char v2 = *(unsigned char *)(v0 + 48);
  sub_217B5C2B4(v1, v2);
  char v3 = sub_217B50A1C(v1, v2);
  sub_217B5C5D4(v1, v2);
  return v3 & 1;
}

uint64_t sub_217B4FF2C()
{
  return sub_217B4FF60();
}

uint64_t sub_217B4FF60()
{
  return sub_217B5F7B0();
}

uint64_t sub_217B4FFB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for UncheckedSendable();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PhotosPicker();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1 + *(int *)(v14 + 56), v6);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v15(v13, v10, a2);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  v16(v10, a2);
  v15(a3, v13, a2);
  return ((uint64_t (*)(char *, uint64_t))v16)(v13, a2);
}

uint64_t sub_217B50178()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC408);
  sub_217B5F7C0();
  return v1;
}

uint64_t sub_217B501CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD68);
  sub_217B5F810();
  return v1;
}

uint64_t sub_217B50220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  int v28 = a8;
  int v29 = a3;
  uint64_t v26 = a2;
  uint64_t v27 = a6;
  char v14 = a3;
  uint64_t v25 = a1;
  uint64_t v31 = a9;
  uint64_t v32 = a10;
  uint64_t v30 = a11;
  uint64_t v16 = sub_217B5FAC0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a7, v16);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = v26;
  *(unsigned char *)(v20 + 32) = v14;
  *(void *)(v20 + 40) = a4;
  *(void *)(v20 + 48) = a5;
  *(void *)(v20 + 56) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v20 + v19, (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  *(unsigned char *)(v20 + v19 + v18) = v28;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC090);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC098);
  uint64_t v22 = sub_217B5F5C0();
  unint64_t v23 = sub_217B580B0();
  uint64_t v33 = v21;
  uint64_t v34 = v22;
  unint64_t v35 = v23;
  uint64_t v36 = MEMORY[0x263F1A0E0];
  swift_getOpaqueTypeConformance2();
  sub_217B5F760();
  return swift_release();
}

uint64_t sub_217B5047C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5F590();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_217B5F5A0();
}

uint64_t sub_217B50574(unsigned char *a1)
{
  uint64_t v2 = sub_217B5F4F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*a1 & 1) == 0)
  {
    type metadata accessor for PhotosPicker();
    sub_217B50BF4();
    sub_217B5F4E0();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_217B506B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>)
{
  *a9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = (int *)type metadata accessor for PhotosPickerViewController(0);
  uint64_t v17 = (char *)a9 + v16[5];
  *(void *)uint64_t v17 = swift_getKeyPath();
  v17[8] = 0;
  uint64_t v18 = (char *)a9 + v16[6];
  *(void *)uint64_t v18 = swift_getKeyPath();
  v18[8] = 0;
  unint64_t v19 = (char *)a9 + v16[7];
  *(void *)unint64_t v19 = swift_getKeyPath();
  v19[8] = 0;
  uint64_t v20 = (char *)a9 + v16[8];
  *(void *)uint64_t v20 = swift_getKeyPath();
  *((void *)v20 + 1) = 0;
  v20[16] = 0;
  uint64_t v21 = (char *)a9 + v16[9];
  *(void *)uint64_t v21 = swift_getKeyPath();
  v21[8] = 0;
  uint64_t v22 = (uint64_t *)((char *)a9 + v16[10]);
  *uint64_t v22 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
  swift_storeEnumTagMultiPayload();
  unint64_t v23 = (uint64_t *)((char *)a9 + v16[11]);
  *unint64_t v23 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = (uint64_t *)((char *)a9 + v16[12]);
  *uint64_t v24 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = (char *)a9 + v16[13];
  *(void *)uint64_t v25 = a1;
  *((void *)v25 + 1) = a2;
  v25[16] = a3;
  uint64_t v26 = (uint64_t *)((char *)a9 + v16[14]);
  *uint64_t v26 = a4;
  v26[1] = a5;
  v26[2] = a6;
  uint64_t v27 = (char *)a9 + v16[15];
  uint64_t v28 = sub_217B5FAC0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v27, a7, v28);
  *((unsigned char *)a9 + v16[16]) = a8;
  return result;
}

uint64_t sub_217B508E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_217B5F590();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_217B5F5A0();
}

uint64_t sub_217B509E0()
{
  sub_217B5F790();
  return v1;
}

uint64_t sub_217B50A1C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_217B5F550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_217B5FC70();
  uint64_t v9 = sub_217B5F670();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_217B56CC0(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_217B3F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D456550](v11, -1, -1);
    MEMORY[0x21D456550](v10, -1, -1);
  }

  sub_217B5F540();
  swift_getAtKeyPath();
  sub_217B5C5D4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

void sub_217B50BF4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_59(v4, v5, v6, v7);
  uint64_t v9 = v8;
  uint64_t v10 = sub_217B5F550();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_32_0(v15, v20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v1(0);
    OUTLINED_FUNCTION_1();
    (*(void (**)(uint64_t, uint64_t))(v16 + 32))(v9, v2);
  }
  else
  {
    os_log_type_t v17 = sub_217B5FC70();
    uint64_t v18 = sub_217B5F670();
    if (os_log_type_enabled(v18, v17))
    {
      swift_slowAlloc();
      OUTLINED_FUNCTION_51();
      *(void *)(v3 + 4) = OUTLINED_FUNCTION_69(4.8149e-34);
      OUTLINED_FUNCTION_55(&dword_217B3F000, v18, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_42();
    }

    sub_217B5F540();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v10);
  }
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B50DA8(uint64_t a1, char a2)
{
  uint64_t v4 = sub_217B5F550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_217B5FC70();
    uint64_t v9 = sub_217B5F670();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v13 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_217B56CC0(7628115, 0xE300000000000000, &v13);
      _os_log_impl(&dword_217B3F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D456550](v11, -1, -1);
      MEMORY[0x21D456550](v10, -1, -1);
    }

    sub_217B5F540();
    swift_getAtKeyPath();
    sub_217B5C5D4(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_217B50F7C()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_217B5F550();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_19_0();
  if ((v8 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v15 = sub_217B5FC70();
    uint64_t v16 = sub_217B5F670();
    if (os_log_type_enabled(v16, v15))
    {
      swift_slowAlloc();
      uint64_t v18 = OUTLINED_FUNCTION_51();
      *(_DWORD *)uint64_t v2 = 136315138;
      *(void *)(v2 + 4) = sub_217B56CC0(v6, v4, &v18);
      OUTLINED_FUNCTION_55(&dword_217B3F000, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_42();
    }

    sub_217B5F540();
    swift_getAtKeyPath();
    ((void (*)(uint64_t, void))v2)(v10, 0);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0, v11);
  }
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B510F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_217B5F550();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = sub_217B5FC70();
    uint64_t v11 = sub_217B5F670();
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      *(void *)(v12 + 4) = sub_217B56CC0(0xD000000000000010, 0x8000000217B61AB0, &v15);
      _os_log_impl(&dword_217B3F000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D456550](v13, -1, -1);
      MEMORY[0x21D456550](v12, -1, -1);
    }

    sub_217B5F540();
    swift_getAtKeyPath();
    sub_217B5C5E0(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v15;
  }
  return a1;
}

uint64_t sub_217B512F0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_217B5F550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_217B5FC70();
    uint64_t v9 = sub_217B5F670();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_217B56CC0(0xD000000000000013, 0x8000000217B61A90, &v14);
      _os_log_impl(&dword_217B3F000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D456550](v11, -1, -1);
      MEMORY[0x21D456550](v10, -1, -1);
    }

    sub_217B5F540();
    swift_getAtKeyPath();
    sub_217B5C5D4(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_217B514D0()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_59(v4, v5, v6, v7);
  uint64_t v9 = v8;
  uint64_t v10 = sub_217B5F550();
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_32_0(v15, v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217B5E414(v2, v9, v1);
  }
  else
  {
    os_log_type_t v16 = sub_217B5FC70();
    uint64_t v17 = sub_217B5F670();
    if (os_log_type_enabled(v17, v16))
    {
      swift_slowAlloc();
      OUTLINED_FUNCTION_51();
      *(void *)(v3 + 4) = OUTLINED_FUNCTION_69(4.8149e-34);
      OUTLINED_FUNCTION_55(&dword_217B3F000, v17, v18, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_42();
    }

    sub_217B5F540();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v10);
  }
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init(_:selection:matching:preferredItemEncoding:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  int v20 = v8;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v16 = OUTLINED_FUNCTION_6_0(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_9_0();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v18 = OUTLINED_FUNCTION_6_0(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_27_0();
  uint64_t v19 = OUTLINED_FUNCTION_34_0();
  sub_217B5E6B0(v19, v0, &qword_267BAC088);
  sub_217B4B188(v3, v1, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B4BF64((uint64_t)&v21, v0, v1, v12, v10, v20, v7, v14);
  sub_217B58034(v3, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v5, &qword_267BAC088);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init<A>(_:selection:matching:preferredItemEncoding:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v15 = OUTLINED_FUNCTION_6_0(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_11_0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v17 = OUTLINED_FUNCTION_6_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_9_0();
  uint64_t v18 = OUTLINED_FUNCTION_34_0();
  sub_217B5E6B0(v18, v1, &qword_267BAC088);
  sub_217B4B188(v7, v0, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v20[2] = v5;
  v20[3] = v3;
  v20[4] = v11;
  sub_217B4C578((uint64_t)&v21, v1, v0, (void (*)(long long *__return_ptr, uint64_t))sub_217B5EB90, (uint64_t)v20, v13);
  sub_217B58034(v7, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v9, &qword_267BAC088);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14_0();
  v19();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v47 = v27;
  uint64_t v48 = v28;
  uint64_t v45 = v29;
  uint64_t v46 = v30;
  uint64_t v32 = v31;
  uint64_t v44 = v33;
  uint64_t v35 = v34;
  unsigned __int8 v43 = v36;
  uint64_t v37 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v38 = OUTLINED_FUNCTION_6_0(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_13_0();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v40 = OUTLINED_FUNCTION_6_0(v39);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_18_0();
  uint64_t v41 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v42 = OUTLINED_FUNCTION_6_0(v41);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_11_0();
  sub_217B4B188(a22, v26, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a23, v25, &qword_267BAC088);
  sub_217B4B188(a24, v24, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B4D7F0(v45, v46, v47, v48, a21 & 1, v26, v25, v24, v35, v44, v32, v43);
  sub_217B58034(a24, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(a23, &qword_267BAC088);
  sub_217B58034(a22, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init<A>(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_62(v28, v29, v30, v31, v32);
  uint64_t v44 = v33;
  int v45 = v34 & 1;
  uint64_t v35 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v36 = OUTLINED_FUNCTION_6_0(v35);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_11_0();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v38 = OUTLINED_FUNCTION_6_0(v37);
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v44 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v42 = OUTLINED_FUNCTION_6_0(v41);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_9_0();
  sub_217B4B188(v24, v27, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(v25, (uint64_t)v40, &qword_267BAC088);
  sub_217B4B188(a21, v26, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v50[2] = a22;
  v50[3] = a23;
  uint64_t v51 = v23;
  sub_217B4DAF4(v46, v47, v48, v49, v45, v27, (uint64_t)v40, v26, v44, (void (*)(long long *__return_ptr, uint64_t))sub_217B5EB90, (uint64_t)v50);
  sub_217B58034(a21, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v25, &qword_267BAC088);
  sub_217B58034(v24, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14_0();
  v43();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init(_:selection:matching:preferredItemEncoding:photoLibrary:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v22 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  int v21 = v9;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v17 = OUTLINED_FUNCTION_6_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_27_0();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v19 = OUTLINED_FUNCTION_6_0(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_13_0();
  uint64_t v20 = OUTLINED_FUNCTION_40();
  sub_217B5E6B0(v20, v1, &qword_267BAC088);
  sub_217B4B188(v4, v0, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B4DFE8((uint64_t)&v23, v1, v0, v22, v13, v11, v21, v8, v15);
  sub_217B58034(v4, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v6, &qword_267BAC088);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init<A>(_:selection:matching:preferredItemEncoding:photoLibrary:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v23 = v5;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v15 = OUTLINED_FUNCTION_6_0(v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v19 = OUTLINED_FUNCTION_6_0(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_27_0();
  uint64_t v20 = OUTLINED_FUNCTION_40();
  sub_217B5E6B0(v20, v0, &qword_267BAC088);
  sub_217B4B188(v7, (uint64_t)v17, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v24[2] = v4;
  v24[3] = v2;
  v24[4] = v11;
  sub_217B4E5BC((uint64_t)&v25, v0, (uint64_t)v17, v23, (void (*)(long long *__return_ptr, uint64_t))sub_217B5EB90, (uint64_t)v24, v13);
  sub_217B58034(v7, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v9, &qword_267BAC088);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14_0();
  v21();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v50 = v27;
  uint64_t v51 = v28;
  uint64_t v48 = v29;
  uint64_t v49 = v30;
  int v45 = v31;
  uint64_t v33 = v32;
  uint64_t v46 = v34;
  uint64_t v47 = v35;
  uint64_t v44 = a25;
  uint64_t v36 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v37 = OUTLINED_FUNCTION_6_0(v36);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_9_0();
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v39 = OUTLINED_FUNCTION_6_0(v38);
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)&v44 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v43 = OUTLINED_FUNCTION_6_0(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_18_0();
  sub_217B4B188(a22, v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a23, (uint64_t)v41, &qword_267BAC088);
  sub_217B4B188(a24, v26, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_217B4EF64(v48, v49, v50, v51, a21 & 1, v25, (uint64_t)v41, v26, v47, v44, v46, v33, v45);
  sub_217B58034(a24, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(a23, &qword_267BAC088);
  sub_217B58034(a22, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_0();
}

void PhotosPicker<>.init<A>(_:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_62(v29, v30, v31, v32, v33);
  uint64_t v48 = v34;
  uint64_t v46 = a22;
  int v47 = v35 & 1;
  uint64_t v36 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v37 = OUTLINED_FUNCTION_6_0(v36);
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_11_0();
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v39 = OUTLINED_FUNCTION_6_0(v38);
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)&v45 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v43 = OUTLINED_FUNCTION_6_0(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_13_0();
  sub_217B4B188(v25, v27, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(v26, (uint64_t)v41, &qword_267BAC088);
  sub_217B4B188(a21, v28, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  v53[2] = a23;
  v53[3] = a24;
  uint64_t v54 = v24;
  sub_217B4F208(v49, v50, v51, v52, v47, v27, (uint64_t)v41, v28, v48, v46, (void (*)(long long *__return_ptr, uint64_t))sub_217B58564, (uint64_t)v53);
  sub_217B58034(a21, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660(v26, &qword_267BAC088);
  sub_217B58034(v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14_0();
  v44();
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B523F8@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19_0();
  (*(void (**)(uint64_t))(v4 + 16))(v1);
  uint64_t result = sub_217B5F6F0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

void View.photosPicker(isPresented:selection:matching:preferredItemEncoding:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v61 = v2;
  uint64_t v60 = v3;
  OUTLINED_FUNCTION_66(v4, v5, v6, v7, v8, v9);
  int v57 = v10;
  uint64_t v58 = v11;
  uint64_t v59 = v12;
  OUTLINED_FUNCTION_71(v13);
  OUTLINED_FUNCTION_0_0();
  uint64_t v54 = v15;
  uint64_t v55 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v51 = OUTLINED_FUNCTION_12_0(v16, v45);
  OUTLINED_FUNCTION_0_0();
  uint64_t v49 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_23_0();
  uint64_t v48 = v19;
  uint64_t v20 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v21 = OUTLINED_FUNCTION_6_0(v20);
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_65();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v23 = OUTLINED_FUNCTION_6_0(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_38_0();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v45 - v25;
  uint64_t v27 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_49();
  uint64_t v52 = sub_217B5FAC0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v30 = v29;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v45 - v33;
  OUTLINED_FUNCTION_50();
  uint64_t v35 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_36_0(v35);
  uint64_t v36 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_29_0(v36);
  sub_217B57F6C(v65);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  uint64_t v46 = v62;
  uint64_t v37 = v64;
  uint64_t v45 = v63;
  int v38 = objc_msgSend(self, sel_isMultiLibraryModeEnabled);
  id v39 = OUTLINED_FUNCTION_68(v38, (const char **)&selRef_imagePickerPhotoLibrary);
  if (qword_267BABC30 != -1) {
    swift_once();
  }
  uint64_t v40 = __swift_project_value_buffer(v27, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v40, v1, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(v50, (uint64_t)v26, &qword_267BAC088);
  sub_217B4B188(v53, v0, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v41 = v39;
  sub_217B5F930();
  sub_217B5F950();
  OUTLINED_FUNCTION_20_0();
  v42();
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v26, v47, &qword_267BAC088);
  sub_217B5FA70();
  OUTLINED_FUNCTION_20_0();
  v43();
  sub_217B5FA10();

  sub_217B58034(v0, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v26, &qword_267BAC088);
  sub_217B58034(v1, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_43();
  v44();
  sub_217B50220(v58, v59, v57 & 1, v46, v45, v37, (uint64_t)v34, 1, v56, v61, v60);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v34, v0);
  OUTLINED_FUNCTION_4_0();
}

void View.photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v64 = v26;
  uint64_t v65 = v24;
  char v28 = v27;
  OUTLINED_FUNCTION_63(v29, v30, v31, v32, v33, v34);
  uint64_t v61 = v36;
  uint64_t v62 = v35;
  uint64_t v63 = a24;
  uint64_t v60 = a23;
  uint64_t v37 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v38 = OUTLINED_FUNCTION_6_0(v37);
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_64();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v40 = OUTLINED_FUNCTION_6_0(v39);
  MEMORY[0x270FA5388](v40);
  uint64_t v42 = (char *)&v60 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v44 = OUTLINED_FUNCTION_6_0(v43);
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_11_0();
  uint64_t v46 = self;
  unsigned int v47 = objc_msgSend(v46, sel_isMultiLibraryModeEnabled);
  uint64_t v48 = &selRef_imagePickerPhotoLibrary;
  if (!v47) {
    uint64_t v48 = &selRef_sharedPhotoLibrary;
  }
  id v49 = objc_msgSend(v46, *v48, v60);
  sub_217B4B188(a21, v25, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a22, (uint64_t)v42, &qword_267BAC088);
  sub_217B4B188(v60, v24, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B4CF8C(v49, v62, v28 & 1, v25, (uint64_t)v42, v24);
  uint64_t v50 = OUTLINED_FUNCTION_21_0();
  sub_217B50220(v50, v51, v52, v53, v54, v55, v56, 1, v57, v60, v61);
  uint64_t v58 = OUTLINED_FUNCTION_45();
  v59(v58);
  OUTLINED_FUNCTION_4_0();
}

void View.photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v85 = v22;
  id v70 = v23;
  OUTLINED_FUNCTION_66(v24, v25, v26, v27, v28, v29);
  int v82 = v30;
  uint64_t v83 = v31;
  uint64_t v84 = v32;
  uint64_t v81 = v33;
  OUTLINED_FUNCTION_71(a21);
  OUTLINED_FUNCTION_0_0();
  uint64_t v78 = v35;
  uint64_t v79 = v34;
  MEMORY[0x270FA5388](v34);
  uint64_t v73 = OUTLINED_FUNCTION_12_0(v36, v67);
  OUTLINED_FUNCTION_0_0();
  uint64_t v72 = v37;
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_23_0();
  uint64_t v71 = v39;
  uint64_t v40 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v41 = OUTLINED_FUNCTION_6_0(v40);
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_23_0();
  uint64_t v75 = v42;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v44 = OUTLINED_FUNCTION_6_0(v43);
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_38_0();
  MEMORY[0x270FA5388](v45);
  unsigned int v47 = (char *)&v67 - v46;
  uint64_t v48 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v49);
  OUTLINED_FUNCTION_65();
  uint64_t v76 = sub_217B5FAC0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v51 = v50;
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = (char *)&v67 - v54;
  OUTLINED_FUNCTION_50();
  uint64_t v56 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_36_0(v56);
  uint64_t v57 = OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_29_0(v57);
  sub_217B57F6C(v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BABE38);
  sub_217B5F820();
  uint64_t v68 = v86;
  uint64_t v58 = v88;
  uint64_t v67 = v87;
  uint64_t v59 = qword_267BABC30;
  id v60 = v70;
  if (v59 != -1) {
    swift_once();
  }
  uint64_t v61 = __swift_project_value_buffer(v48, (uint64_t)qword_267BABEE8);
  sub_217B4B188(v61, v21, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(v74, (uint64_t)v47, &qword_267BAC088);
  uint64_t v62 = v75;
  sub_217B4B188(v77, v75, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v63 = v60;
  sub_217B5F930();
  sub_217B5F950();
  OUTLINED_FUNCTION_20_0();
  v64();
  sub_217B5FAB0();
  sub_217B5E6B0((uint64_t)v47, v69, &qword_267BAC088);
  sub_217B5FA70();
  OUTLINED_FUNCTION_20_0();
  v65();
  sub_217B5FA10();

  sub_217B58034(v62, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  sub_217B5E660((uint64_t)v47, &qword_267BAC088);
  sub_217B58034(v21, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  OUTLINED_FUNCTION_43();
  v66();
  sub_217B50220(v83, v84, v82 & 1, v68, v67, v58, (uint64_t)v55, 0, v81, v85, v80);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v55, v21);
  OUTLINED_FUNCTION_4_0();
}

void View.photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26)
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v64 = v28;
  uint64_t v65 = v26;
  OUTLINED_FUNCTION_63(v29, v30, v31, v32, v33, v34);
  uint64_t v62 = v35;
  uint64_t v63 = v36;
  uint64_t v61 = a26;
  id v59 = a24;
  int v60 = v37 & 1;
  uint64_t v38 = type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy(0);
  uint64_t v39 = OUTLINED_FUNCTION_6_0(v38);
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_64();
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC088);
  uint64_t v41 = OUTLINED_FUNCTION_6_0(v40);
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = (char *)&v58 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for PhotosPickerSelectionBehavior(0);
  uint64_t v45 = OUTLINED_FUNCTION_6_0(v44);
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_11_0();
  sub_217B4B188(a21, v27, (void (*)(void))type metadata accessor for PhotosPickerSelectionBehavior);
  sub_217B5E6B0(a22, (uint64_t)v43, &qword_267BAC088);
  sub_217B4B188(a23, v26, (void (*)(void))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
  id v47 = v59;
  sub_217B4CF8C(v47, v62, v60, v27, (uint64_t)v43, v26);
  uint64_t v48 = OUTLINED_FUNCTION_21_0();
  sub_217B50220(v48, v49, v50, v51, v52, v53, v54, 0, v55, v58, (uint64_t)v59);
  uint64_t v56 = OUTLINED_FUNCTION_45();
  v57(v56);
  OUTLINED_FUNCTION_4_0();
}

void View.photosPickerStyle(_:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC0B8);
  uint64_t v4 = sub_217B5F510();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v11 - v8;
  swift_getKeyPath();
  BOOL v12 = (*(unsigned char *)(v3 + *(int *)(type metadata accessor for PhotosPickerStyle(0) + 20)) & 1) == 0;
  sub_217B5F720();
  swift_release();
  swift_getKeyPath();
  uint64_t v10 = sub_217B48944(&qword_267BAC0C0, &qword_267BAC0B8);
  v11[1] = v1;
  v11[2] = v10;
  swift_getWitnessTable();
  OUTLINED_FUNCTION_44();
  sub_217B5F720();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_217B53368()
{
  sub_217B5E3A4();
  sub_217B5F560();
  return v1;
}

uint64_t sub_217B533A4()
{
  return sub_217B5F570();
}

uint64_t sub_217B533E0()
{
  sub_217B5E358();

  return sub_217B5F560();
}

uint64_t sub_217B53428(uint64_t a1)
{
  uint64_t v2 = sub_217B5F8A0();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_217B534F0((uint64_t)v4);
}

uint64_t sub_217B534F0(uint64_t a1)
{
  uint64_t v2 = sub_217B5F8A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_217B5E358();
  sub_217B5F570();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t View.photosPickerAccessoryVisibility(_:edges:)(char a1, char a2)
{
  swift_getKeyPath();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  *(unsigned char *)(v4 + 17) = a2;
  sub_217B5F750();
  swift_release();

  return swift_release();
}

uint64_t sub_217B536B0()
{
  sub_217B5E30C();
  sub_217B5F560();
  return v1;
}

uint64_t sub_217B536EC()
{
  return sub_217B5F570();
}

uint64_t sub_217B53728(unsigned char *a1, char a2, unsigned __int8 a3)
{
  if (a2 != 2) {
    return sub_217B53798();
  }
  sub_217B5F6C0();
  uint64_t result = sub_217B5F6C0();
  if (result != a3)
  {
    uint64_t result = sub_217B5F6C0();
    *a1 = result;
  }
  return result;
}

uint64_t sub_217B53798()
{
  sub_217B5F6C0();
  unsigned __int8 v1 = sub_217B5F6C0();
  unsigned __int8 v2 = sub_217B5F6C0();
  unsigned __int8 v3 = 0;
  if (v1 != v2)
  {
    sub_217B5F6C0();
    sub_217B5F6C0();
    unsigned char *v0 = sub_217B5F6C0();
    unsigned __int8 v3 = v1;
  }
  return v3 | ((v1 == v2) << 8);
}

uint64_t View.photosPickerDisabledCapabilities(_:)()
{
  return sub_217B5386C();
}

uint64_t sub_217B53840()
{
  return sub_217B538D0((void (*)(void))sub_217B5E2C0);
}

uint64_t View._photosPickerDisabledPrivateCapabilities(_:)()
{
  return sub_217B5386C();
}

uint64_t sub_217B5386C()
{
  return swift_release();
}

uint64_t sub_217B538B0()
{
  return sub_217B538D0((void (*)(void))sub_217B5E274);
}

uint64_t sub_217B538D0(void (*a1)(void))
{
  a1();
  sub_217B5F560();
  return v2;
}

uint64_t sub_217B53918(uint64_t a1, void (*a2)(void))
{
  return sub_217B5F570();
}

uint64_t View._photosPickerSourceType(_:)()
{
  return swift_release();
}

uint64_t sub_217B539BC()
{
  sub_217B5E228();
  sub_217B5F560();
  return v1;
}

uint64_t sub_217B539F8()
{
  return sub_217B5F570();
}

uint64_t View._photosPickerPeopleConfiguration(_:)()
{
  return sub_217B53CA0();
}

uint64_t sub_217B53A40()
{
  sub_217B5E1DC();

  return sub_217B5F560();
}

uint64_t View._photosPickerContainerIdentifier(_:)()
{
  return swift_release();
}

uint64_t sub_217B53AFC()
{
  sub_217B5E190();
  sub_217B5F560();
  return v1;
}

uint64_t sub_217B53B38()
{
  return sub_217B53B78();
}

uint64_t sub_217B53B78()
{
  return sub_217B5F570();
}

uint64_t View._photosPickerAlbumsConfiguration(_:)()
{
  return sub_217B53CA0();
}

uint64_t sub_217B53BC0()
{
  sub_217B5E144();

  return sub_217B5F560();
}

uint64_t sub_217B53C08()
{
  OUTLINED_FUNCTION_37_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(v3);
  uint64_t v5 = OUTLINED_FUNCTION_6_0(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = OUTLINED_FUNCTION_31_0(v6, v9);
  v0(v7);
  sub_217B5F570();
  return sub_217B5E660(v2, v1);
}

uint64_t View._photosPickerSuggestionGroup(_:)()
{
  return sub_217B53CA0();
}

uint64_t sub_217B53CA0()
{
  OUTLINED_FUNCTION_53();
  sub_217B5F720();

  return swift_release();
}

uint64_t sub_217B53CFC()
{
  sub_217B5E0F8();

  return sub_217B5F560();
}

uint64_t sub_217B53D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v6 = OUTLINED_FUNCTION_6_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_31_0(v7, v9);
  return sub_217B53C08();
}

uint64_t sub_217B53DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  int v34 = a8;
  uint64_t v30 = a7;
  uint64_t v31 = a2;
  uint64_t v33 = a6;
  int v32 = a3;
  uint64_t v37 = a9;
  uint64_t v12 = sub_217B5F5C0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v35 = v12;
  uint64_t v36 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_217B5FAC0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for PhotosPickerViewController(0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (uint64_t *)((char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC098);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v30 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v30, v16);
  sub_217B506B8(a1, v31, v32, a4, a5, v33, (uint64_t)v19, v34, v22);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v26 = sub_217B5F520();
  LOBYTE(v16) = sub_217B5F680();
  sub_217B4B188((uint64_t)v22, (uint64_t)v25, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  uint64_t v27 = &v25[*(int *)(v23 + 36)];
  *(void *)uint64_t v27 = v26;
  v27[8] = v16;
  sub_217B58034((uint64_t)v22, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  sub_217B5F580();
  sub_217B580B0();
  uint64_t v28 = v35;
  sub_217B5F740();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v28);
  return sub_217B5E660((uint64_t)v25, &qword_267BAC098);
}

uint64_t sub_217B540DC()
{
  uint64_t v0 = sub_217B5F8A0();
  __swift_allocate_value_buffer(v0, qword_267BABFD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BABFD8);
  return sub_217B5F890();
}

uint64_t sub_217B54128()
{
  if (qword_267BABC80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_217B5F8A0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_267BABFD8);
}

uint64_t sub_217B5418C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217B54128();
  uint64_t v3 = sub_217B5F8A0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_217B541FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_217B4B120((unint64_t *)&unk_267BAC460, MEMORY[0x263F15168]);

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void sub_217B54290(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_217B5429C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

uint64_t sub_217B542A8()
{
  uint64_t result = sub_217B5F6C0();
  byte_267BABFF0 = result;
  return result;
}

char *sub_217B542CC()
{
  if (qword_267BABC88 != -1) {
    swift_once();
  }
  return &byte_267BABFF0;
}

char *sub_217B54318@<X0>(char *a1@<X8>)
{
  uint64_t result = sub_217B542CC();
  *a1 = *result;
  return result;
}

uint64_t sub_217B54344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_217B5EB3C();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

void sub_217B543A8(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_217B543B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_217B4B120(&qword_267BABCD0, type metadata accessor for PHPickerCapabilities);

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B54444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_217B4B120(&qword_267BABCF0, type metadata accessor for _PHPickerPrivateCapabilities);

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B544D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_217B4B120(&qword_267BAC450, type metadata accessor for _PHPickerSourceType);

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B5456C(uint64_t a1)
{
  return sub_217B5476C(a1, &qword_267BAC2E0, qword_267BABFF8, MEMORY[0x263F151F8]);
}

uint64_t sub_217B54594@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217B547E8(&qword_267BABC90, &qword_267BAC2E0, (uint64_t)qword_267BABFF8);
  return sub_217B5E6B0(v2, a1, &qword_267BAC2E0);
}

void sub_217B545F0(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t sub_217B545F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_217B5EAD0();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B5465C(uint64_t a1)
{
  return sub_217B5476C(a1, &qword_267BAC2E0, qword_267BAC010, MEMORY[0x263F151F8]);
}

uint64_t sub_217B54684@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217B547E8(&qword_267BABC98, &qword_267BAC2E0, (uint64_t)qword_267BAC010);
  return sub_217B5E6B0(v2, a1, &qword_267BAC2E0);
}

uint64_t sub_217B546E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_217B5EA2C();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B54744(uint64_t a1)
{
  return sub_217B5476C(a1, &qword_267BAC2F0, qword_267BAC028, MEMORY[0x263F151E8]);
}

uint64_t sub_217B5476C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  __swift_allocate_value_buffer(v6, a3);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)a3);
  uint64_t v8 = a4(0);

  return __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
}

uint64_t sub_217B547E8(void *a1, uint64_t *a2, uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);

  return __swift_project_value_buffer(v5, a3);
}

uint64_t sub_217B54840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_217B547E8(&qword_267BABCA0, &qword_267BAC2F0, (uint64_t)qword_267BAC028);
  return sub_217B5E6B0(v2, a1, &qword_267BAC2F0);
}

uint64_t sub_217B5489C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_217B5E988();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_217B54900()
{
  char v0 = sub_217B5F690();
  unsigned __int8 v1 = sub_217B5F6A0();
  unsigned __int8 v2 = sub_217B5F6B0();
  unsigned __int8 v3 = sub_217B5F6D0();
  sub_217B5F6C0();
  char v4 = sub_217B5F6C0();
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4 == v0)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_217B5711C(0, 1, 1);
    uint64_t v5 = v23;
    unint64_t v7 = *(void *)(v23 + 16);
    unint64_t v6 = *(void *)(v23 + 24);
    if (v7 >= v6 >> 1)
    {
      sub_217B5711C((char *)(v6 > 1), v7 + 1, 1);
      uint64_t v5 = v23;
    }
    *(void *)(v5 + 16) = v7 + 1;
    uint64_t v8 = v5 + 16 * v7;
    *(unsigned char *)(v8 + 32) = v0;
    *(void *)(v8 + 40) = 1;
  }
  sub_217B5F6C0();
  if (sub_217B5F6C0() == v1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_217B5711C(0, *(void *)(v5 + 16) + 1, 1);
    }
    unint64_t v10 = *(void *)(v5 + 16);
    unint64_t v9 = *(void *)(v5 + 24);
    if (v10 >= v9 >> 1) {
      sub_217B5711C((char *)(v9 > 1), v10 + 1, 1);
    }
    *(void *)(v5 + 16) = v10 + 1;
    uint64_t v11 = v5 + 16 * v10;
    *(unsigned char *)(v11 + 32) = v1;
    *(void *)(v11 + 40) = 4;
  }
  sub_217B5F6C0();
  if (sub_217B5F6C0() == v2)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_217B5711C(0, *(void *)(v5 + 16) + 1, 1);
    }
    unint64_t v13 = *(void *)(v5 + 16);
    unint64_t v12 = *(void *)(v5 + 24);
    if (v13 >= v12 >> 1) {
      sub_217B5711C((char *)(v12 > 1), v13 + 1, 1);
    }
    *(void *)(v5 + 16) = v13 + 1;
    uint64_t v14 = v5 + 16 * v13;
    *(unsigned char *)(v14 + 32) = v2;
    *(void *)(v14 + 40) = 2;
  }
  sub_217B5F6C0();
  if (sub_217B5F6C0() == v3)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_217B5711C(0, *(void *)(v5 + 16) + 1, 1);
    }
    unint64_t v16 = *(void *)(v5 + 16);
    unint64_t v15 = *(void *)(v5 + 24);
    unint64_t v17 = v16 + 1;
    if (v16 >= v15 >> 1) {
      sub_217B5711C((char *)(v15 > 1), v16 + 1, 1);
    }
    *(void *)(v5 + 16) = v17;
    uint64_t v18 = v5 + 16 * v16;
    *(unsigned char *)(v18 + 32) = v3;
    *(void *)(v18 + 40) = 8;
  }
  else
  {
    unint64_t v17 = *(void *)(v5 + 16);
    if (!v17)
    {
      uint64_t v19 = 0;
      goto LABEL_28;
    }
  }
  uint64_t v19 = 0;
  uint64_t v20 = 40;
  do
  {
    uint64_t v21 = *(void *)(v5 + v20);
    if ((v21 & ~v19) == 0) {
      uint64_t v21 = 0;
    }
    v19 |= v21;
    v20 += 16;
    --v17;
  }
  while (v17);
LABEL_28:
  swift_release();
  return v19;
}

uint64_t sub_217B54BCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC410);
  MEMORY[0x21D4559D0](&v7, v2);
  uint64_t v3 = v8;
  if (v8)
  {
    char v4 = v9;
    uint64_t v5 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC380);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_217B604B0;
    *(void *)(result + 32) = v5;
    *(void *)(result + 40) = v3;
    *(unsigned char *)(result + 48) = v4 & 1;
    *(_OWORD *)(result + 56) = v10;
  }
  else
  {
    uint64_t result = MEMORY[0x263F8EE78];
  }
  *a1 = result;
  return result;
}

uint64_t sub_217B54C84(uint64_t a1)
{
  if (*(void *)(*(void *)a1 + 16))
  {
    unsigned __int8 v1 = *(void **)(*(void *)a1 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v2 = v1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC410);
  return sub_217B5F800();
}

uint64_t sub_217B54D3C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_217B5F910() == 1)
  {
    sub_217B5F8F0();
    uint64_t v3 = sub_217B5FAF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) != 1)
    {
      uint64_t v4 = sub_217B5FAE0();
      (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
      return v4;
    }
    sub_217B5E660((uint64_t)v2, &qword_267BAC2E0);
  }
  return sub_217B5F9E0();
}

uint64_t sub_217B54E40()
{
  uint64_t v1 = type metadata accessor for PhotosPickerViewController(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B4B188(v0, (uint64_t)v3, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  type metadata accessor for PhotosPickerViewController.Coordinator(0);
  swift_allocObject();
  return sub_217B55A48((uint64_t)v3);
}

uint64_t sub_217B54EE8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v39 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v36 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_217B5F8A0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_217B5FAC0();
  uint64_t v34 = v7;
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v8 = v38;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v37 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v34 - v11;
  unint64_t v13 = (int *)type metadata accessor for PhotosPickerViewController(0);
  uint64_t v14 = v2 + v13[15];
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v35(v12, v14, v7);
  sub_217B50BF4();
  sub_217B5FA20();
  uint64_t v15 = v2 + v13[5];
  uint64_t v16 = *(void *)v15;
  LOBYTE(v7) = *(unsigned char *)(v15 + 8);
  sub_217B5C2B4(*(void *)v15, v7);
  sub_217B50DA8(v16, v7);
  sub_217B5C5D4(v16, v7);
  uint64_t v17 = sub_217B54900();
  MEMORY[0x21D455BB0](v17);
  uint64_t v18 = v2 + v13[6];
  uint64_t v19 = *(void *)v18;
  LOBYTE(v7) = *(unsigned char *)(v18 + 8);
  sub_217B5C2B4(*(void *)v18, v7);
  sub_217B50F7C();
  uint64_t v21 = v20;
  sub_217B5C5D4(v19, v7);
  MEMORY[0x21D455B70](v21);
  uint64_t v22 = v2 + v13[7];
  uint64_t v23 = *(void *)v22;
  LOBYTE(v7) = *(unsigned char *)(v22 + 8);
  sub_217B5C2B4(*(void *)v22, v7);
  sub_217B50F7C();
  sub_217B5C5D4(v23, v7);
  sub_217B5FA00();
  uint64_t v24 = v2 + v13[8];
  uint64_t v25 = *(void *)v24;
  uint64_t v26 = *(void *)(v24 + 8);
  LOBYTE(v21) = *(unsigned char *)(v24 + 16);
  sub_217B5C2C0(*(void *)v24, v26, v21);
  sub_217B510F0(v25, v26, v21);
  sub_217B5C5E0(v25, v26, v21);
  sub_217B5F970();
  uint64_t v27 = v2 + v13[9];
  uint64_t v28 = *(void *)v27;
  LOBYTE(v26) = *(unsigned char *)(v27 + 8);
  sub_217B5C2B4(*(void *)v27, v26);
  sub_217B512F0(v28, v26);
  sub_217B5C5D4(v28, v26);
  sub_217B5F920();
  sub_217B514D0();
  sub_217B5F900();
  sub_217B514D0();
  sub_217B5F8E0();
  sub_217B514D0();
  sub_217B5F960();
  uint64_t v29 = (uint64_t *)(v2 + v13[14]);
  uint64_t v40 = *v29;
  long long v41 = *(_OWORD *)(v29 + 1);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD68);
  MEMORY[0x21D4559D0](&v42, v30);
  sub_217B557D0(v42);
  swift_bridgeObjectRelease();
  sub_217B5F9F0();
  sub_217B47BE4(0, &qword_267BAC368);
  uint64_t v31 = v34;
  v35(v37, (uint64_t)v12, v34);
  uint64_t v32 = sub_217B5FCD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC340);
  sub_217B5F660();
  sub_217B4B120(&qword_267BAC370, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController.Coordinator);
  sub_217B5FCE0();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v31);
  return v32;
}

uint64_t sub_217B554F0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_217B5FA60();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217B5FA50();
  uint64_t v9 = type metadata accessor for PhotosPickerViewController(0);
  sub_217B5F940();
  sub_217B5FA30();
  uint64_t v10 = v2 + *(int *)(v9 + 20);
  uint64_t v11 = *(void *)v10;
  char v12 = *(unsigned char *)(v10 + 8);
  sub_217B5C2B4(*(void *)v10, v12);
  sub_217B50DA8(v11, v12);
  sub_217B5C5D4(v11, v12);
  sub_217B54900();
  sub_217B5FA40();
  id v24 = a1;
  sub_217B5FCB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC340);
  uint64_t v25 = a2;
  sub_217B5F660();
  uint64_t v13 = *(void *)(v31
                  + OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_selection);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v14 = (void *)(v3 + *(int *)(v9 + 56));
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v17 = v14[2];
  uint64_t v28 = *v14;
  *(void *)&long long v29 = v15;
  *((void *)&v29 + 1) = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD68);
  MEMORY[0x21D4559D0](&v30);
  LOBYTE(v3) = sub_217B4B858(v13, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3) {
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v8, v27);
  }
  uint64_t v28 = v16;
  *(void *)&long long v29 = v15;
  *((void *)&v29 + 1) = v17;
  MEMORY[0x21D4559D0](&v31, v18);
  sub_217B557D0(v31);
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)sub_217B5FBA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel__updateSelectedAssetsWithIdentifiers_, v20);

  sub_217B5F660();
  uint64_t v21 = v31;
  uint64_t v28 = *v14;
  long long v29 = *(_OWORD *)(v14 + 1);
  MEMORY[0x21D4559D0](&v30, v18);
  uint64_t v22 = v30;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v27);
  *(void *)(v21
            + OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_selection) = v22;
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217B557D0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_217B5713C(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        sub_217B5713C((char *)(v7 > 1), v8 + 1, 1);
      }
      v4 += 5;
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_217B558A8(uint64_t a1, uint64_t a2, char a3)
{
  int64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_217B5717C(0, v4, 0);
    uint64_t v7 = v25;
    uint64_t v8 = *(void *)(sub_217B5F8D0() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v21 = *(void *)(v8 + 72);
    int v20 = a3 & 1;
    do
    {
      uint64_t v10 = a2;
      sub_217B5633C(v9, a2, v20, v22);
      uint64_t v11 = v22[0];
      uint64_t v12 = v22[1];
      char v13 = v23;
      long long v14 = v24;
      uint64_t v25 = v7;
      unint64_t v16 = *(void *)(v7 + 16);
      unint64_t v15 = *(void *)(v7 + 24);
      if (v16 >= v15 >> 1)
      {
        long long v19 = v24;
        sub_217B5717C((char *)(v15 > 1), v16 + 1, 1);
        long long v14 = v19;
        uint64_t v7 = v25;
      }
      *(void *)(v7 + 16) = v16 + 1;
      uint64_t v17 = v7 + 40 * v16;
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v12;
      *(unsigned char *)(v17 + 48) = v13;
      *(_OWORD *)(v17 + 56) = v14;
      v9 += v21;
      --v4;
      a2 = v10;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v7;
}

uint64_t sub_217B55A48(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_217B4B188(a1, v1+ OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_parent, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  type metadata accessor for PhotosPickerViewController(0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD68);
  MEMORY[0x21D4559D0](&v7, v4);
  uint64_t v5 = v7;
  sub_217B58034(a1, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  *(void *)(v2
            + OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_selection) = v5;
  return v2;
}

uint64_t sub_217B55B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5FA90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v56 - v9;
  uint64_t v68 = sub_217B5FAC0();
  uint64_t v71 = *(void *)(v68 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v68);
  char v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v56 - v14;
  uint64_t v16 = v2
      + OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_parent;
  uint64_t v70 = type metadata accessor for PhotosPickerViewController(0);
  uint64_t v17 = *(int *)(v70 + 56);
  uint64_t v67 = v16;
  uint64_t v18 = (uint64_t *)(v16 + v17);
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  uint64_t v21 = v18[2];
  uint64_t v61 = v20;
  uint64_t v62 = v19;
  uint64_t v72 = v19;
  uint64_t v73 = v20;
  uint64_t v60 = v21;
  uint64_t v74 = v21;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD68);
  MEMORY[0x21D4559D0](&v75);
  uint64_t v66 = v75;
  sub_217B5FCC0();
  uint64_t v22 = (void *)sub_217B54D3C();
  uint64_t v63 = a2;
  uint64_t v64 = v22;
  uint64_t v69 = sub_217B5609C(a2);
  uint64_t v58 = 0;
  sub_217B5FAA0();
  char v23 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  v23(v8, *MEMORY[0x263F151B8], v4);
  LOBYTE(v16) = _s015_PhotosUI_SwiftB00A23PickerSelectionBehaviorV2eeoiySbAC_ACtFZ_0();
  long long v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v8, v4);
  uint64_t v57 = v4;
  v24(v10, v4);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
  uint64_t v26 = v13;
  uint64_t v65 = v15;
  uint64_t v27 = v15;
  uint64_t v28 = v68;
  v25(v13, v27, v68);
  if (v16)
  {
    long long v29 = *(void (**)(char *, uint64_t))(v71 + 8);
    v29(v26, v28);
    uint64_t v30 = v28;
LABEL_4:
    uint64_t v34 = v65;
    uint64_t v33 = v66;
    uint64_t v35 = v67;
    swift_bridgeObjectRelease();
    char v36 = 1;
    goto LABEL_5;
  }
  sub_217B5FAA0();
  uint64_t v31 = v57;
  v23(v8, *MEMORY[0x263F151C0], v57);
  char v32 = _s015_PhotosUI_SwiftB00A23PickerSelectionBehaviorV2eeoiySbAC_ACtFZ_0();
  v24(v8, v31);
  v24(v10, v31);
  long long v29 = *(void (**)(char *, uint64_t))(v71 + 8);
  v29(v26, v28);
  uint64_t v30 = v28;
  if (v32) {
    goto LABEL_4;
  }
  if (v64[2] || *(void *)(v63 + 16))
  {
    char v46 = sub_217B4BC70(v69, v64);
    swift_bridgeObjectRelease();
    uint64_t v34 = v65;
    uint64_t v33 = v66;
    uint64_t v35 = v67;
    if (v46)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      uint64_t v44 = swift_bridgeObjectRelease();
      char v45 = 0;
      goto LABEL_12;
    }
    char v36 = 0;
LABEL_5:
    uint64_t v37 = swift_bridgeObjectRetain();
    uint64_t v38 = sub_217B561F4(v37);
    char v40 = v39;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_217B558A8(v63, v38, v40 & 1);
    swift_bridgeObjectRelease();
    uint64_t v72 = v62;
    uint64_t v73 = v61;
    uint64_t v74 = v60;
    uint64_t v75 = v41;
    sub_217B5F800();
    if (v36)
    {
      uint64_t v42 = (void *)sub_217B557D0(v33);
      swift_bridgeObjectRelease();
      char v43 = sub_217B4BC70(v42, v69);
      swift_bridgeObjectRelease();
      uint64_t v44 = swift_bridgeObjectRelease();
      char v45 = v43 ^ 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v44 = swift_bridgeObjectRelease();
  char v45 = 0;
  uint64_t v34 = v65;
  uint64_t v35 = v67;
LABEL_12:
  char v47 = MEMORY[0x21D455B60](v44);
  char v48 = MEMORY[0x21D455BA0]();
  id v49 = objc_msgSend(self, sel_currentDevice);
  id v50 = objc_msgSend(v49, sel_userInterfaceIdiom);

  if (v50 == (id)5)
  {
    if ((v47 & 8) != 0) {
      return ((uint64_t (*)(char *, uint64_t))v29)(v34, v30);
    }
    uint64_t v51 = v48 & 4;
  }
  else
  {
    if ((v47 & 8) != 0) {
      return ((uint64_t (*)(char *, uint64_t))v29)(v34, v30);
    }
    uint64_t v51 = v48 & 1;
  }
  if (!(v45 & 1 | (v51 != 0)))
  {
    uint64_t v52 = (uint64_t *)(v35 + *(int *)(v70 + 52));
    uint64_t v53 = *v52;
    uint64_t v54 = v52[1];
    LOBYTE(v52) = *((unsigned char *)v52 + 16);
    uint64_t v72 = v53;
    uint64_t v73 = v54;
    LOBYTE(v74) = (_BYTE)v52;
    LOBYTE(v75) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BABD28);
    sub_217B5F800();
  }
  return ((uint64_t (*)(void, void))v29)(v34, v30);
}

char *sub_217B5609C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v3 = *(void *)(sub_217B5F8D0() - 8);
  uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = *(void *)(v3 + 72);
  swift_bridgeObjectRetain();
  uint64_t v6 = (char *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v7 = sub_217B5F8C0();
    if (v8)
    {
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_217B56990(0, *((void *)v6 + 2) + 1, 1, v6);
      }
      unint64_t v12 = *((void *)v6 + 2);
      unint64_t v11 = *((void *)v6 + 3);
      if (v12 >= v11 >> 1) {
        uint64_t v6 = sub_217B56990((char *)(v11 > 1), v12 + 1, 1, v6);
      }
      *((void *)v6 + 2) = v12 + 1;
      char v13 = &v6[16 * v12];
      *((void *)v13 + 4) = v9;
      *((void *)v13 + 5) = v10;
    }
    v4 += v5;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_217B561F4(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v14 = MEMORY[0x263F8EE78];
    sub_217B5715C(0, v2, 0);
    uint64_t v3 = v14;
    uint64_t v4 = (_OWORD *)(a1 + 56);
    do
    {
      uint64_t v6 = *((void *)v4 - 3);
      uint64_t v5 = *((void *)v4 - 2);
      char v7 = *((unsigned char *)v4 - 8);
      long long v13 = *v4;
      unint64_t v8 = *(void *)(v14 + 16);
      unint64_t v9 = *(void *)(v14 + 24);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      id v10 = *((id *)&v13 + 1);
      if (v8 >= v9 >> 1) {
        sub_217B5715C((void *)(v9 > 1), v8 + 1, 1);
      }
      *(void *)(v14 + 16) = v8 + 1;
      unint64_t v11 = v14 + 56 * v8;
      *(void *)(v11 + 32) = v6;
      *(void *)(v11 + 40) = v5;
      *(void *)(v11 + 48) = v6;
      *(void *)(v11 + 56) = v5;
      *(unsigned char *)(v11 + 64) = v7;
      *(_OWORD *)(v11 + 72) = v13;
      uint64_t v4 = (_OWORD *)((char *)v4 + 40);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x263F8EE78];
  }
  return sub_217B566A8(v3);
}

void sub_217B5633C(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  int v44 = a3;
  char v43 = a4;
  uint64_t v6 = sub_217B5F490();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v40 - v11;
  long long v13 = (void *)sub_217B5F8B0();
  id v14 = objc_msgSend(v13, sel_registeredContentTypes);

  uint64_t v15 = sub_217B5FBB0();
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v50 = *(void *)(v15 + 16);
  uint64_t v51 = MEMORY[0x263F8EE78];
  if (v50)
  {
    uint64_t v41 = a2;
    uint64_t v42 = a1;
    unint64_t v17 = 0;
    char v48 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v49 = v7 + 16;
    char v45 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v46 = v15;
    char v47 = v10;
    while (v17 < *(void *)(v15 + 16))
    {
      unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v19 = *(void *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, v15 + v18 + v19 * v17, v6);
      uint64_t v20 = (void *)sub_217B5F450();
      char v21 = PFIsLivePhotoBundleType();

      if (v21)
      {
        (*v45)(v12, v6);
      }
      else
      {
        uint64_t v22 = *v48;
        (*v48)(v10, v12, v6);
        uint64_t v23 = v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_217B5719C(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v23 = v51;
        }
        unint64_t v25 = *(void *)(v23 + 16);
        unint64_t v24 = *(void *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          sub_217B5719C(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v51;
        }
        *(void *)(v23 + 16) = v25 + 1;
        unint64_t v26 = v23 + v18 + v25 * v19;
        id v10 = v47;
        v22((char *)v26, v47, v6);
        uint64_t v51 = v23;
        uint64_t v15 = v46;
      }
      if (v50 == ++v17)
      {
        uint64_t v16 = v51;
        a2 = v41;
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_22;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_217B5F8C0();
  char v29 = v44;
  if (v28)
  {
    uint64_t v30 = v27;
    uint64_t v31 = v28;
    if (!*(void *)(v16 + 16) && *(void *)(a2 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v34 = sub_217B56B64(v30, v31);
      if (v35)
      {
        uint64_t v36 = *(void *)(a2 + 56) + 40 * v34;
        uint64_t v30 = *(void *)v36;
        uint64_t v37 = *(void *)(v36 + 8);
        char v29 = *(unsigned char *)(v36 + 16);
        uint64_t v39 = *(void *)(v36 + 24);
        uint64_t v38 = *(void **)(v36 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v32 = v38;
        swift_release();
        swift_bridgeObjectRelease_n();
        uint64_t v31 = v37;
        uint64_t v16 = v39;
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
    }
    id v32 = (id)sub_217B5F8B0();
LABEL_16:
    uint64_t v33 = v43;
    uint64_t *v43 = v30;
    v33[1] = v31;
    *((unsigned char *)v33 + 16) = v29 & 1;
    v33[3] = v16;
    v33[4] = (uint64_t)v32;
    return;
  }
LABEL_22:
  __break(1u);
}

uint64_t sub_217B566A8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC388);
    uint64_t v1 = sub_217B5FDD0();
  }
  else
  {
    uint64_t v1 = MEMORY[0x263F8EE80];
  }
  uint64_t v4 = v1;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_217B5779C(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_217B56754()
{
  sub_217B58034(v0+ OBJC_IVAR____TtCV17_PhotosUI_SwiftUIP33_017389DAE44781501AADB4871649B48726PhotosPickerViewController11Coordinator_parent, (void (*)(void))type metadata accessor for PhotosPickerViewController);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_217B567E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217B54E40();
  *a1 = result;
  return result;
}

uint64_t sub_217B56810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217B4B120(&qword_267BAC338, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_217B568A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217B4B120(&qword_267BAC338, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_217B56938()
{
}

char *sub_217B56990(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC348);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

uint64_t sub_217B56A90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1 || (uint64_t result = sub_217B5F490(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = sub_217B5F490();
    return MEMORY[0x270FA01D8](a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return MEMORY[0x270FA01D0](a3, a1, a2, result);
  }
  return result;
}

unint64_t sub_217B56B64(uint64_t a1, uint64_t a2)
{
  sub_217B5FE10();
  sub_217B5FB60();
  uint64_t v4 = sub_217B5FE40();

  return sub_217B56BDC(a1, a2, v4);
}

unint64_t sub_217B56BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_217B5FDE0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_217B5FDE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_217B56CC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_217B56D94(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_217B5E09C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_217B5E09C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_217B56D94(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_217B56E94(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_217B5FD70();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_217B56E94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_217B56F2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_217B57030(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_217B57030((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_217B56F2C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_217B56FC8(v2, 0);
      uint64_t result = sub_217B5FD60();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_217B5FB80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_217B56FC8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC360);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_217B57030(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC360);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_217B5711C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217B571BC(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_217B5713C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217B572B4(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

void *sub_217B5715C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217B573B4(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_217B5717C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217B574DC(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

size_t sub_217B5719C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_217B575EC(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

char *sub_217B571BC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC358);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_release();
  return v10;
}

char *sub_217B572B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC348);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

void *sub_217B573B4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC3A0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[7 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 56 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC3A8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_217B574DC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC380);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12) {
      memmove(v12, v13, 40 * v8);
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

size_t sub_217B575EC(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    long long v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC378);
  uint64_t v10 = *(void *)(sub_217B5F490() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  long long v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_217B5F490() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_217B56A90(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

void sub_217B5779C(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a1 + 40;
    while (1)
    {
      if (v5 >= *(void *)(a1 + 16))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        sub_217B5FE00();
        __break(1u);
        goto LABEL_21;
      }
      uint64_t v8 = *(void *)(v6 - 8);
      uint64_t v7 = *(void *)v6;
      uint64_t v9 = *(void *)(v6 + 8);
      uint64_t v10 = *(void *)(v6 + 16);
      char v11 = *(unsigned char *)(v6 + 24);
      long long v36 = *(_OWORD *)(v6 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v12 = *((id *)&v36 + 1);
      if (!v7) {
        goto LABEL_14;
      }
      uint64_t v33 = v10;
      unint64_t v34 = v5;
      char v13 = a2;
      uint64_t v31 = v12;
      BOOL v14 = (void *)*a3;
      unint64_t v16 = sub_217B56B64(v8, v7);
      uint64_t v17 = v14[2];
      BOOL v18 = (v15 & 1) == 0;
      uint64_t v19 = v17 + v18;
      if (__OFADD__(v17, v18)) {
        goto LABEL_18;
      }
      char v20 = v15;
      if (v14[3] >= v19)
      {
        if ((v13 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC390);
          sub_217B5FD90();
        }
      }
      else
      {
        sub_217B57AEC(v19, v13 & 1);
        unint64_t v21 = sub_217B56B64(v8, v7);
        if ((v20 & 1) != (v22 & 1)) {
          goto LABEL_20;
        }
        unint64_t v16 = v21;
      }
      if (v20) {
        break;
      }
      uint64_t v23 = (void *)*a3;
      *(void *)(*a3 + 8 * (v16 >> 6) + 64) |= 1 << v16;
      unint64_t v24 = (uint64_t *)(v23[6] + 16 * v16);
      *unint64_t v24 = v8;
      v24[1] = v7;
      uint64_t v25 = v23[7] + 40 * v16;
      *(void *)uint64_t v25 = v9;
      *(void *)(v25 + 8) = v33;
      *(unsigned char *)(v25 + 16) = v11;
      *(_OWORD *)(v25 + 24) = v36;
      uint64_t v26 = v23[2];
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (v27) {
        goto LABEL_19;
      }
      unint64_t v5 = v34 + 1;
      _DWORD v23[2] = v28;
      v6 += 56;
      a2 = 1;
      if (v4 == v34 + 1) {
        goto LABEL_14;
      }
    }
    char v29 = (void *)swift_allocError();
    swift_willThrow();
    id v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC398);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
LABEL_21:
    sub_217B5FD50();
    sub_217B5FB70();
    sub_217B5FD80();
    sub_217B5FB70();
    sub_217B5FDA0();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_217B57AEC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC388);
  char v41 = a2;
  uint64_t v6 = sub_217B5FDC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v39 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v38 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v40 = v5;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = *(void *)(v5 + 56) + 40 * i;
      uint64_t v23 = *(void *)v22;
      uint64_t v24 = *(void *)(v22 + 8);
      char v25 = *(unsigned char *)(v22 + 16);
      long long v42 = *(_OWORD *)(v22 + 24);
      if ((v41 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v26 = *((id *)&v42 + 1);
      }
      sub_217B5FE10();
      sub_217B5FB60();
      uint64_t result = sub_217B5FE40();
      uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) == 0)
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v27) >> 6;
        while (++v29 != v32 || (v31 & 1) == 0)
        {
          BOOL v33 = v29 == v32;
          if (v29 == v32) {
            unint64_t v29 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v11 + 8 * v29);
          if (v34 != -1)
          {
            unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
      char v35 = (void *)(*(void *)(v7 + 48) + 16 * v30);
      *char v35 = v21;
      v35[1] = v20;
      uint64_t v36 = *(void *)(v7 + 56) + 40 * v30;
      *(void *)uint64_t v36 = v23;
      *(void *)(v36 + 8) = v24;
      *(unsigned char *)(v36 + 16) = v25;
      *(_OWORD *)(v36 + 24) = v42;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_39;
      }
      if (v16 >= v38) {
        goto LABEL_32;
      }
      unint64_t v17 = v39[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v38) {
          goto LABEL_32;
        }
        unint64_t v17 = v39[v13];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v38)
          {
LABEL_32:
            swift_release();
            unint64_t v3 = v2;
            if (v41)
            {
              uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
              if (v37 >= 64) {
                sub_217B57E34(0, (unint64_t)(v37 + 63) >> 6, v39);
              }
              else {
                *uint64_t v39 = -1 << v37;
              }
              *(void *)(v5 + 16) = 0;
            }
            break;
          }
          unint64_t v17 = v39[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v13 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_40;
              }
              if (v13 >= v38) {
                goto LABEL_32;
              }
              unint64_t v17 = v39[v13];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v18;
        }
      }
LABEL_18:
      unint64_t v10 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_217B57E34(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_217B57E50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_217B5FE20();
  if (v3)
  {
    uint64_t v5 = *(void *)(sub_217B5F490() - 8);
    uint64_t v6 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v7 = *(void *)(v5 + 72);
    sub_217B4B120(&qword_267BAC418, MEMORY[0x263F8F3A0]);
    do
    {
      uint64_t result = sub_217B5FB20();
      v6 += v7;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_217B57F50@<X0>(uint64_t *a1@<X8>)
{
  return sub_217B54BCC(a1);
}

uint64_t sub_217B57F60(uint64_t a1)
{
  return sub_217B54C84(a1);
}

void *sub_217B57F6C(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = (void *)a1[6];
  swift_retain();
  swift_retain();
  sub_217B57FDC(v2, v3, v4, v5, v6);
  return a1;
}

void sub_217B57FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v5 = a5;
  }
}

uint64_t sub_217B58034(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14_0();
  v3();
  return a1;
}

uint64_t type metadata accessor for PhotosPickerViewController(uint64_t a1)
{
  return sub_217B4796C(a1, (uint64_t *)&unk_267BAC310);
}

unint64_t sub_217B580B0()
{
  unint64_t result = qword_267BAC0A0;
  if (!qword_267BAC0A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC098);
    sub_217B4B120(&qword_267BAC0A8, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC0A0);
  }
  return result;
}

uint64_t sub_217B5815C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217B58194()
{
  type metadata accessor for PhotosPicker();
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  uint64_t v4 = v0 + ((v3 + 48) & ~v3);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_217B5C5D4(*(void *)(v4 + 40), *(unsigned char *)(v4 + 48));
  uint64_t v5 = v4 + *(int *)(v1 + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC0B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217B5F4F0();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_14_0();
    v6();
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14_0();
  v7();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14_0();
  v8();

  return MEMORY[0x270FA0238](v0, v3, v5);
}

uint64_t type metadata accessor for PhotosPicker()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_217B58320(unsigned char *a1)
{
  uint64_t v2 = type metadata accessor for PhotosPicker();
  OUTLINED_FUNCTION_8_0(v2);

  return sub_217B50574(a1);
}

uint64_t sub_217B58390()
{
  type metadata accessor for PhotosPicker();
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + ((v3 + 32) & ~v3);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_217B5C5D4(*(void *)(v4 + 40), *(unsigned char *)(v4 + 48));
  uint64_t v5 = v4 + *(int *)(v1 + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC0B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217B5F4F0();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_14_0();
    v6();
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14_0();
  v7();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_14_0();
  v8();

  return MEMORY[0x270FA0238](v0, v3, v5);
}

uint64_t sub_217B584FC()
{
  OUTLINED_FUNCTION_44();
  uint64_t v0 = type metadata accessor for PhotosPicker();
  OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_44();

  return sub_217B4FF2C();
}

uint64_t sub_217B58558@<X0>(char *a1@<X8>)
{
  return sub_217B4FFB4(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_217B58564@<X0>(uint64_t a1@<X8>)
{
  return sub_217B523F8(a1);
}

uint64_t sub_217B58594()
{
  OUTLINED_FUNCTION_41();
  uint64_t result = sub_217B53368();
  unsigned char *v0 = result & 1;
  return result;
}

uint64_t sub_217B585C0()
{
  return sub_217B533A4();
}

uint64_t sub_217B585E8()
{
  return sub_217B533E0();
}

uint64_t sub_217B58610()
{
  OUTLINED_FUNCTION_41();
  uint64_t result = sub_217B536B0();
  unsigned char *v0 = result;
  return result;
}

uint64_t sub_217B58638()
{
  return sub_217B536EC();
}

uint64_t sub_217B58660()
{
  return MEMORY[0x270FA0238](v0, 18, 7);
}

uint64_t sub_217B58670(unsigned char *a1)
{
  return sub_217B53728(a1, *(unsigned char *)(v1 + 16), *(unsigned char *)(v1 + 17));
}

uint64_t sub_217B5867C()
{
  OUTLINED_FUNCTION_41();
  uint64_t result = sub_217B53840();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_217B586A4(uint64_t *a1)
{
  return sub_217B53918(*a1, (void (*)(void))sub_217B5E2C0);
}

uint64_t sub_217B586E8()
{
  OUTLINED_FUNCTION_41();
  uint64_t result = sub_217B538B0();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_217B58710(uint64_t *a1)
{
  return sub_217B53918(*a1, (void (*)(void))sub_217B5E274);
}

uint64_t sub_217B58754()
{
  OUTLINED_FUNCTION_41();
  uint64_t result = sub_217B539BC();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_217B5877C()
{
  return sub_217B539F8();
}

uint64_t sub_217B587A4()
{
  return sub_217B53A40();
}

uint64_t sub_217B587C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217B53D44(a1, a2, a3, a4, &qword_267BAC2E0);
}

uint64_t sub_217B58804()
{
  OUTLINED_FUNCTION_41();
  uint64_t result = sub_217B53AFC();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_217B58830()
{
  return sub_217B53BC0();
}

uint64_t sub_217B58854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217B53D44(a1, a2, a3, a4, &qword_267BAC2E0);
}

uint64_t sub_217B58890()
{
  return sub_217B53CFC();
}

uint64_t sub_217B588B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217B53D44(a1, a2, a3, a4, &qword_267BAC2F0);
}

uint64_t sub_217B588F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B5890C()
{
  return sub_217B4B120(&qword_267BAC0C8, (void (*)(uint64_t))type metadata accessor for PhotosPickerSelectionBehavior);
}

uint64_t sub_217B58954()
{
  return sub_217B4B120(&qword_267BAC0D0, (void (*)(uint64_t))type metadata accessor for PhotosPickerStyle);
}

uint64_t sub_217B5899C()
{
  return sub_217B4B120(&qword_267BAC0D8, (void (*)(uint64_t))type metadata accessor for PhotosPickerItem.EncodingDisambiguationPolicy);
}

unint64_t sub_217B589E8()
{
  unint64_t result = qword_267BAC0E0;
  if (!qword_267BAC0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC0E0);
  }
  return result;
}

uint64_t sub_217B58A34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosPickerSelectionBehavior()
{
  return sub_217B592A4();
}

uint64_t destroy for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2)
{
  return sub_217B59318(a1, a2, MEMORY[0x263F151D8]);
}

uint64_t initializeWithCopy for PhotosPickerSelectionBehavior()
{
  return sub_217B59390();
}

uint64_t assignWithCopy for PhotosPickerSelectionBehavior()
{
  return sub_217B593F8();
}

uint64_t initializeWithTake for PhotosPickerSelectionBehavior()
{
  return sub_217B5945C();
}

uint64_t assignWithTake for PhotosPickerSelectionBehavior()
{
  return sub_217B594C0();
}

uint64_t getEnumTagSinglePayload for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B58B1C);
}

uint64_t sub_217B58B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5FA90();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PhotosPickerSelectionBehavior(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B58B78);
}

uint64_t sub_217B58B78()
{
  sub_217B5FA90();
  uint64_t v0 = OUTLINED_FUNCTION_35_0();

  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_217B58BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_217B595D4(a1, a2, a3, MEMORY[0x263F151D8]);
}

void *initializeBufferWithCopyOfBuffer for PhotosPickerStyle(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_217B5F8A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for PhotosPickerStyle(uint64_t a1, uint64_t a2)
{
  return sub_217B59318(a1, a2, MEMORY[0x263F15168]);
}

uint64_t initializeWithCopy for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217B5F8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217B5F8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217B5F8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_217B5F8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B58EB8);
}

uint64_t sub_217B58EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_217B5F8A0();
  OUTLINED_FUNCTION_2_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for PhotosPickerStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B58F68);
}

void sub_217B58F68()
{
  OUTLINED_FUNCTION_70();
  sub_217B5F8A0();
  OUTLINED_FUNCTION_2_0();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_35_0();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(unsigned char *)(v1 + *(int *)(v2 + 20)) = v0 + 1;
  }
}

uint64_t sub_217B58FD8()
{
  uint64_t result = sub_217B5F8A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for PhotosPickerItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for PhotosPickerItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for PhotosPickerItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 32);
  id v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PhotosPickerItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosPickerItem(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosPickerItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosPickerItem()
{
  return &type metadata for PhotosPickerItem;
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return sub_217B592A4();
}

uint64_t sub_217B592A4()
{
  uint64_t v2 = OUTLINED_FUNCTION_17_0();
  v3(v2);
  OUTLINED_FUNCTION_1();
  id v6 = *v5;

  return v6(v1, v0, v4);
}

uint64_t destroy for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2)
{
  return sub_217B59318(a1, a2, MEMORY[0x263F151A8]);
}

uint64_t sub_217B59318(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);

  return v6(a1, v4);
}

uint64_t initializeWithCopy for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return sub_217B59390();
}

uint64_t sub_217B59390()
{
  uint64_t v1 = OUTLINED_FUNCTION_17_0();
  v2(v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_20_0();
  v3();
  return v0;
}

uint64_t assignWithCopy for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return sub_217B593F8();
}

uint64_t sub_217B593F8()
{
  uint64_t v1 = OUTLINED_FUNCTION_17_0();
  v2(v1);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = OUTLINED_FUNCTION_19();
  v4(v3);
  return v0;
}

uint64_t initializeWithTake for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return sub_217B5945C();
}

uint64_t sub_217B5945C()
{
  uint64_t v1 = OUTLINED_FUNCTION_17_0();
  v2(v1);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = OUTLINED_FUNCTION_19();
  v4(v3);
  return v0;
}

uint64_t assignWithTake for PhotosPickerItem.EncodingDisambiguationPolicy()
{
  return sub_217B594C0();
}

uint64_t sub_217B594C0()
{
  uint64_t v1 = OUTLINED_FUNCTION_17_0();
  v2(v1);
  OUTLINED_FUNCTION_1();
  uint64_t v3 = OUTLINED_FUNCTION_19();
  v4(v3);
  return v0;
}

uint64_t getEnumTagSinglePayload for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B59520);
}

uint64_t sub_217B59520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_217B5F9B0();

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PhotosPickerItem.EncodingDisambiguationPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B5957C);
}

uint64_t sub_217B5957C()
{
  sub_217B5F9B0();
  uint64_t v0 = OUTLINED_FUNCTION_35_0();

  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_217B595BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_217B595D4(a1, a2, a3, MEMORY[0x263F151A8]);
}

uint64_t sub_217B595D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_217B59664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

void sub_217B5966C()
{
  sub_217B5DF5C(319, &qword_267BAC198, MEMORY[0x263F188C0]);
  if (v0 <= 0x3F)
  {
    sub_217B5FAC0();
    if (v1 <= 0x3F)
    {
      swift_checkMetadataState();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_217B597B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_217B5F4F0();
  uint64_t v55 = *(void *)(v6 - 8);
  int v7 = *(_DWORD *)(v55 + 80);
  uint64_t v8 = v7 & 0xF8 | 7;
  if (*(void *)(v55 + 64) <= 8uLL) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  uint64_t v10 = sub_217B5FAC0();
  int v11 = *(_DWORD *)(*(void *)(v10 - 8) + 80);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = *(_DWORD *)(v14 + 80);
  uint64_t v16 = v15;
  unint64_t v17 = ((*(void *)(*(void *)(v10 - 8) + 64)
        + v15
        + ((v9 + 1 + v11 + (((v7 & 0xF8) + 56) & ~v8)) & ~(unint64_t)v11)
        + 1) & ~(unint64_t)v15)
      + *(void *)(v14 + 64);
  unint64_t v18 = v11 | (unint64_t)v8 | v15;
  int v19 = (v11 | v7 | v15) & 0x100000;
  if (v18 != 7 || v19 != 0 || v17 > 0x18)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    uint64_t v23 = (uint64_t *)(v22 + ((v18 + 16) & ~v18));
    swift_retain();
  }
  else
  {
    uint64_t v46 = *(void *)(*(void *)(v10 - 8) + 64);
    uint64_t v47 = v6;
    uint64_t v49 = v9 + 1;
    uint64_t v50 = *(void *)(v10 - 8);
    uint64_t v51 = *(void *)(v13 - 8);
    uint64_t v52 = v10;
    uint64_t v53 = v13;
    uint64_t v54 = a1;
    uint64_t v45 = ~v8;
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v24 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    char v25 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v24 = *v25;
    v24[1] = v25[1];
    v24[2] = v25[2];
    unint64_t v26 = ((unint64_t)v24 + 31) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v27 = ((unint64_t)v25 + 31) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v48 = v9;
    uint64_t v28 = *(void *)v27;
    char v29 = *(unsigned char *)(v27 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_217B5C2B4(v28, v29);
    *(void *)unint64_t v26 = v28;
    *(unsigned char *)(v26 + 8) = v29;
    unint64_t v30 = (void *)((v26 + v8 + 9) & v45);
    char v31 = (unsigned __int8 *)((v27 + v8 + 9) & v45);
    unsigned int v32 = v31[v48];
    unsigned int v33 = v32 - 2;
    if (v32 < 2)
    {
      uint64_t v23 = v54;
      uint64_t v35 = v49;
      uint64_t v36 = v47;
    }
    else
    {
      if (v48 <= 3) {
        uint64_t v34 = v48;
      }
      else {
        uint64_t v34 = 4;
      }
      uint64_t v23 = v54;
      uint64_t v35 = v49;
      uint64_t v36 = v47;
      switch(v34)
      {
        case 1:
          int v37 = *v31;
          goto LABEL_23;
        case 2:
          int v37 = *(unsigned __int16 *)v31;
          goto LABEL_23;
        case 3:
          int v37 = *(unsigned __int16 *)v31 | (v31[2] << 16);
          goto LABEL_23;
        case 4:
          int v37 = *(_DWORD *)v31;
LABEL_23:
          int v38 = (v37 | (v33 << (8 * v48))) + 2;
          unsigned int v32 = v37 + 2;
          if (v48 < 4) {
            unsigned int v32 = v38;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v39 = ~v12;
    if (v32 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v55 + 16))(v30, v31, v36);
      char v40 = 1;
    }
    else
    {
      *unint64_t v30 = *(void *)v31;
      swift_retain();
      char v40 = 0;
    }
    *((unsigned char *)v30 + v48) = v40;
    char v41 = &v31[v35];
    unint64_t v42 = ((unint64_t)v30 + v35 + v12) & v39;
    unint64_t v43 = (unint64_t)&v41[v12] & v39;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))(v42, v43, v52);
    *(unsigned char *)(v42 + v46) = *(unsigned char *)(v43 + v46);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v51 + 16))((v42 + v46 + v16 + 1) & ~v16, (v43 + v46 + v16 + 1) & ~v16, v53);
  }
  return v23;
}

uint64_t sub_217B59BB0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v4 = (((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  sub_217B5C5D4(*(void *)v4, *(unsigned char *)(v4 + 8));
  uint64_t v5 = sub_217B5F4F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80) & 0xF8 | 7;
  uint64_t v8 = (unsigned __int8 *)((v4 + v7 + 9) & ~v7);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = *(void *)(v6 + 64);
  }
  unsigned int v10 = v8[v9];
  unsigned int v11 = v10 - 2;
  if (v10 >= 2)
  {
    if (v9 <= 3) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *v8;
        goto LABEL_13;
      case 2:
        int v13 = *(unsigned __int16 *)v8;
        goto LABEL_13;
      case 3:
        int v13 = *(unsigned __int16 *)v8 | (v8[2] << 16);
        goto LABEL_13;
      case 4:
        int v13 = *(_DWORD *)v8;
LABEL_13:
        int v14 = (v13 | (v11 << (8 * v9))) + 2;
        unsigned int v10 = v13 + 2;
        if (v9 < 4) {
          unsigned int v10 = v14;
        }
        break;
      default:
        break;
    }
  }
  if (v10 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(v8, v5);
  }
  else {
    swift_release();
  }
  int v15 = &v8[v9];
  uint64_t v16 = sub_217B5FAC0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = v17 + 8;
  unint64_t v19 = (unint64_t)&v15[*(unsigned __int8 *)(v17 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  (*(void (**)(unint64_t, uint64_t))(v17 + 8))(v19, v16);
  uint64_t v20 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v21 = *(uint64_t (**)(unint64_t))(v20 + 8);
  unint64_t v22 = (*(void *)(v18 + 56) + *(unsigned __int8 *)(v20 + 80) + v19 + 1) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);

  return v21(v22);
}

uint64_t sub_217B59DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v5 = (void *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void *)((a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  v5[1] = v6[1];
  v5[2] = v6[2];
  unint64_t v7 = ((unint64_t)v5 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = ((unint64_t)v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(void *)v8;
  char v10 = *(unsigned char *)(v8 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_217B5C2B4(v9, v10);
  *(void *)unint64_t v7 = v9;
  *(unsigned char *)(v7 + 8) = v10;
  uint64_t v11 = sub_217B5F4F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(_DWORD *)(v12 + 80) & 0xF8;
  uint64_t v14 = v13 + 16;
  unint64_t v15 = v13 + 16 + v7;
  unint64_t v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = (void *)(v15 & v16);
  uint64_t v18 = (unsigned __int8 *)((v14 + v8) & v16);
  if (*(void *)(v12 + 64) <= 8uLL) {
    uint64_t v19 = 8;
  }
  else {
    uint64_t v19 = *(void *)(*(void *)(v11 - 8) + 64);
  }
  unsigned int v20 = v18[v19];
  unsigned int v21 = v20 - 2;
  if (v20 >= 2)
  {
    if (v19 <= 3) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = 4;
    }
    switch(v22)
    {
      case 1:
        int v23 = *v18;
        goto LABEL_13;
      case 2:
        int v23 = *(unsigned __int16 *)v18;
        goto LABEL_13;
      case 3:
        int v23 = *(unsigned __int16 *)((v14 + v8) & v16) | (*(unsigned __int8 *)(((v14 + v8) & v16) + 2) << 16);
        goto LABEL_13;
      case 4:
        int v23 = *(_DWORD *)v18;
LABEL_13:
        int v24 = (v23 | (v21 << (8 * v19))) + 2;
        unsigned int v20 = v23 + 2;
        if (v19 < 4) {
          unsigned int v20 = v24;
        }
        break;
      default:
        break;
    }
  }
  if (v20 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v12 + 16))(v17, v18, v11);
    char v25 = 1;
  }
  else
  {
    *uint64_t v17 = *(void *)v18;
    swift_retain();
    char v25 = 0;
  }
  *((unsigned char *)v17 + v19) = v25;
  uint64_t v26 = v19 + 1;
  uint64_t v27 = sub_217B5FAC0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = v28 + 16;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  unint64_t v31 = ((unint64_t)v17 + v26 + v30) & ~v30;
  unint64_t v32 = (unint64_t)&v18[v26 + v30] & ~v30;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v28 + 16))(v31, v32, v27);
  uint64_t v33 = *(void *)(v29 + 48);
  uint64_t v34 = (unsigned char *)(v31 + v33);
  uint64_t v35 = (unsigned char *)(v32 + v33);
  *uint64_t v34 = *v35;
  uint64_t v36 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v36 + 16))((unint64_t)&v34[*(unsigned __int8 *)(v36 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v36 + 80), (unint64_t)&v35[*(unsigned __int8 *)(v36 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  return a1;
}

uint64_t sub_217B5A09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = (void *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = (void *)((a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v6 = *v7;
  swift_retain();
  swift_release();
  v6[1] = v7[1];
  swift_retain();
  swift_release();
  v6[2] = v7[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v8 = ((unint64_t)v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = ((unint64_t)v7 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)v9;
  LOBYTE(v6) = *(unsigned char *)(v9 + 8);
  sub_217B5C2B4(*(void *)v9, (char)v6);
  uint64_t v11 = *(void *)v8;
  char v12 = *(unsigned char *)(v8 + 8);
  *(void *)unint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v6;
  sub_217B5C5D4(v11, v12);
  uint64_t v13 = sub_217B5F4F0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(_DWORD *)(v14 + 80) & 0xF8;
  uint64_t v16 = v15 + 16;
  unint64_t v17 = v15 + 16 + v8;
  unint64_t v18 = ~v15 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = (unsigned __int8 *)(v17 & v18);
  unsigned int v20 = (unsigned __int8 *)((v16 + v9) & v18);
  if (*(void *)(v14 + 64) <= 8uLL) {
    uint64_t v21 = 8;
  }
  else {
    uint64_t v21 = *(void *)(*(void *)(v13 - 8) + 64);
  }
  if (v19 != v20)
  {
    uint64_t v22 = v13;
    unsigned int v23 = v19[v21];
    unsigned int v24 = v23 - 2;
    if (v23 >= 2)
    {
      if (v21 <= 3) {
        uint64_t v25 = v21;
      }
      else {
        uint64_t v25 = 4;
      }
      switch(v25)
      {
        case 1:
          int v26 = *v19;
          goto LABEL_14;
        case 2:
          int v26 = *(unsigned __int16 *)v19;
          goto LABEL_14;
        case 3:
          int v26 = *(unsigned __int16 *)(v17 & v18) | (*(unsigned __int8 *)((v17 & v18) + 2) << 16);
          goto LABEL_14;
        case 4:
          int v26 = *(_DWORD *)v19;
LABEL_14:
          int v27 = (v26 | (v24 << (8 * v21))) + 2;
          unsigned int v23 = v26 + 2;
          if (v21 < 4) {
            unsigned int v23 = v27;
          }
          break;
        default:
          break;
      }
    }
    if (v23 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v14 + 8))(v19, v13);
    }
    else {
      swift_release();
    }
    unsigned int v28 = v20[v21];
    unsigned int v29 = v28 - 2;
    if (v28 >= 2)
    {
      if (v21 <= 3) {
        uint64_t v30 = v21;
      }
      else {
        uint64_t v30 = 4;
      }
      switch(v30)
      {
        case 1:
          int v31 = *v20;
          goto LABEL_28;
        case 2:
          int v31 = *(unsigned __int16 *)v20;
          goto LABEL_28;
        case 3:
          int v31 = *(unsigned __int16 *)v20 | (v20[2] << 16);
          goto LABEL_28;
        case 4:
          int v31 = *(_DWORD *)v20;
LABEL_28:
          int v32 = (v31 | (v29 << (8 * v21))) + 2;
          unsigned int v28 = v31 + 2;
          if (v21 < 4) {
            unsigned int v28 = v32;
          }
          break;
        default:
          break;
      }
    }
    if (v28 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v14 + 16))(v19, v20, v22);
      v19[v21] = 1;
    }
    else
    {
      *(void *)uint64_t v19 = *(void *)v20;
      v19[v21] = 0;
      swift_retain();
    }
  }
  uint64_t v33 = sub_217B5FAC0();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = v34 + 24;
  uint64_t v36 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v37 = v21 + v36 + 1;
  unint64_t v38 = (unint64_t)&v19[v37] & ~v36;
  unint64_t v39 = (unint64_t)&v20[v37] & ~v36;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v34 + 24))(v38, v39, v33);
  uint64_t v40 = *(void *)(v35 + 40);
  char v41 = (unsigned char *)(v40 + v38);
  unint64_t v42 = (unsigned char *)(v40 + v39);
  *char v41 = *v42;
  uint64_t v43 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v43 + 24))((unint64_t)&v41[*(unsigned __int8 *)(v43 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v43 + 80), (unint64_t)&v42[*(unsigned __int8 *)(v43 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
  return a1;
}

_OWORD *sub_217B5A450(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  unint64_t v5 = ((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = ((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v7 = *(_OWORD *)v6;
  *(void *)(v5 + 16) = *(void *)(v6 + 16);
  *(_OWORD *)unint64_t v5 = v7;
  unint64_t v8 = (v5 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  *(void *)unint64_t v8 = v10;
  uint64_t v11 = sub_217B5F4F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(_DWORD *)(v12 + 80) & 0xF8;
  uint64_t v14 = v13 + 16;
  unint64_t v15 = v13 + 16 + v8;
  unint64_t v16 = ~v13 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (void *)(v15 & v16);
  unint64_t v18 = (unsigned __int8 *)((v14 + v9) & v16);
  if (*(void *)(v12 + 64) <= 8uLL) {
    uint64_t v19 = 8;
  }
  else {
    uint64_t v19 = *(void *)(*(void *)(v11 - 8) + 64);
  }
  unsigned int v20 = v18[v19];
  unsigned int v21 = v20 - 2;
  if (v20 >= 2)
  {
    if (v19 <= 3) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = 4;
    }
    switch(v22)
    {
      case 1:
        int v23 = *v18;
        goto LABEL_13;
      case 2:
        int v23 = *(unsigned __int16 *)v18;
        goto LABEL_13;
      case 3:
        int v23 = *(unsigned __int16 *)v18 | (v18[2] << 16);
        goto LABEL_13;
      case 4:
        int v23 = *(_DWORD *)v18;
LABEL_13:
        int v24 = (v23 | (v21 << (8 * v19))) + 2;
        unsigned int v20 = v23 + 2;
        if (v19 < 4) {
          unsigned int v20 = v24;
        }
        break;
      default:
        break;
    }
  }
  if (v20 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v12 + 32))(v17, v18, v11);
    char v25 = 1;
  }
  else
  {
    char v25 = 0;
    *unint64_t v17 = *(void *)v18;
  }
  *((unsigned char *)v17 + v19) = v25;
  uint64_t v26 = v19 + 1;
  uint64_t v27 = sub_217B5FAC0();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = v28 + 32;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  unint64_t v31 = ((unint64_t)v17 + v26 + v30) & ~v30;
  unint64_t v32 = (unint64_t)&v18[v26 + v30] & ~v30;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v28 + 32))(v31, v32, v27);
  uint64_t v33 = *(void *)(v29 + 32);
  uint64_t v34 = (unsigned char *)(v31 + v33);
  uint64_t v35 = (unsigned char *)(v32 + v33);
  *uint64_t v34 = *v35;
  uint64_t v36 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v36 + 32))((unint64_t)&v34[*(unsigned __int8 *)(v36 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v36 + 80), (unint64_t)&v35[*(unsigned __int8 *)(v36 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
  return a1;
}

uint64_t sub_217B5A6C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  unint64_t v6 = (void *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v7 = (void *)((a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v6 = *v7;
  swift_release();
  v6[1] = v7[1];
  swift_release();
  v6[2] = v7[2];
  swift_bridgeObjectRelease();
  unint64_t v8 = ((unint64_t)v6 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = ((unint64_t)v7 + 31) & 0xFFFFFFFFFFFFFFF8;
  char v10 = *(unsigned char *)(v9 + 8);
  uint64_t v11 = *(void *)v8;
  char v12 = *(unsigned char *)(v8 + 8);
  *(void *)unint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  sub_217B5C5D4(v11, v12);
  uint64_t v13 = sub_217B5F4F0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(_DWORD *)(v14 + 80) & 0xF8;
  uint64_t v16 = v15 + 16;
  unint64_t v17 = v15 + 16 + v8;
  unint64_t v18 = ~v15 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = (unsigned __int8 *)(v17 & v18);
  unsigned int v20 = (unsigned __int8 *)((v16 + v9) & v18);
  if (*(void *)(v14 + 64) <= 8uLL) {
    uint64_t v21 = 8;
  }
  else {
    uint64_t v21 = *(void *)(*(void *)(v13 - 8) + 64);
  }
  if (v19 != v20)
  {
    uint64_t v22 = v13;
    unsigned int v23 = v19[v21];
    unsigned int v24 = v23 - 2;
    if (v23 >= 2)
    {
      if (v21 <= 3) {
        uint64_t v25 = v21;
      }
      else {
        uint64_t v25 = 4;
      }
      switch(v25)
      {
        case 1:
          int v26 = *v19;
          goto LABEL_14;
        case 2:
          int v26 = *(unsigned __int16 *)v19;
          goto LABEL_14;
        case 3:
          int v26 = *(unsigned __int16 *)(v17 & v18) | (*(unsigned __int8 *)((v17 & v18) + 2) << 16);
          goto LABEL_14;
        case 4:
          int v26 = *(_DWORD *)v19;
LABEL_14:
          int v27 = (v26 | (v24 << (8 * v21))) + 2;
          unsigned int v23 = v26 + 2;
          if (v21 < 4) {
            unsigned int v23 = v27;
          }
          break;
        default:
          break;
      }
    }
    if (v23 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v14 + 8))(v19, v13);
    }
    else {
      swift_release();
    }
    unsigned int v28 = v20[v21];
    unsigned int v29 = v28 - 2;
    if (v28 >= 2)
    {
      if (v21 <= 3) {
        uint64_t v30 = v21;
      }
      else {
        uint64_t v30 = 4;
      }
      switch(v30)
      {
        case 1:
          int v31 = *v20;
          goto LABEL_28;
        case 2:
          int v31 = *(unsigned __int16 *)v20;
          goto LABEL_28;
        case 3:
          int v31 = *(unsigned __int16 *)v20 | (v20[2] << 16);
          goto LABEL_28;
        case 4:
          int v31 = *(_DWORD *)v20;
LABEL_28:
          int v32 = (v31 | (v29 << (8 * v21))) + 2;
          unsigned int v28 = v31 + 2;
          if (v21 < 4) {
            unsigned int v28 = v32;
          }
          break;
        default:
          break;
      }
    }
    if (v28 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v14 + 32))(v19, v20, v22);
      char v33 = 1;
    }
    else
    {
      char v33 = 0;
      *(void *)uint64_t v19 = *(void *)v20;
    }
    v19[v21] = v33;
  }
  uint64_t v34 = sub_217B5FAC0();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = v35 + 40;
  uint64_t v37 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v38 = v21 + v37 + 1;
  unint64_t v39 = (unint64_t)&v19[v38] & ~v37;
  unint64_t v40 = (unint64_t)&v20[v38] & ~v37;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v35 + 40))(v39, v40, v34);
  uint64_t v41 = *(void *)(v36 + 24);
  unint64_t v42 = (unsigned char *)(v41 + v39);
  uint64_t v43 = (unsigned char *)(v41 + v40);
  unsigned char *v42 = *v43;
  uint64_t v44 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v44 + 40))((unint64_t)&v42[*(unsigned __int8 *)(v44 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v44 + 80), (unint64_t)&v43[*(unsigned __int8 *)(v44 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
  return a1;
}

uint64_t sub_217B5AA44(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_217B5F4F0() - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  uint64_t v8 = sub_217B5FAC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int *)(v12 + 84);
  if (v10 <= v13) {
    unsigned int v14 = *(_DWORD *)(v12 + 84);
  }
  else {
    unsigned int v14 = *(_DWORD *)(v9 + 84);
  }
  if (v14 <= 0x7FFFFFFF) {
    unsigned int v15 = 0x7FFFFFFF;
  }
  else {
    unsigned int v15 = v14;
  }
  int v16 = *(_DWORD *)(v6 + 80);
  uint64_t v17 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = *(void *)(v12 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v20 = v16 & 0xF8 | 7;
  uint64_t v21 = v7 + v17 + 1;
  uint64_t v22 = *(void *)(*(void *)(v8 - 8) + 64) + v18 + 1;
  if (a2 <= v15) {
    goto LABEL_31;
  }
  uint64_t v23 = ((v22 + ((v21 + (((v16 & 0xF8) + 56) & ~v20)) & ~v17)) & ~v18) + v19;
  char v24 = 8 * v23;
  if (v23 <= 3)
  {
    unsigned int v27 = ((a2 - v15 + ~(-1 << v24)) >> v24) + 1;
    if (HIWORD(v27))
    {
      int v25 = *(_DWORD *)((char *)a1 + v23);
      if (!v25) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
    if (v27 > 0xFF)
    {
      int v25 = *(unsigned __int16 *)((char *)a1 + v23);
      if (!*(unsigned __int16 *)((char *)a1 + v23)) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
    if (v27 < 2)
    {
LABEL_31:
      unint64_t v31 = ((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8;
      if ((v14 & 0x80000000) != 0)
      {
        unint64_t v33 = (v21 + ((((v31 + 31) & 0xFFFFFFFFFFFFFFF8) + v20 + 9) & ~v20)) & ~v17;
        if (v10 == v15)
        {
          uint64_t v11 = v8;
        }
        else
        {
          unint64_t v33 = (v22 + v33) & ~v18;
          uint64_t v10 = v13;
        }
        return __swift_getEnumTagSinglePayload(v33, v10, v11);
      }
      else
      {
        unint64_t v32 = *(void *)(v31 + 8);
        if (v32 >= 0xFFFFFFFF) {
          LODWORD(v32) = -1;
        }
        return (v32 + 1);
      }
    }
  }
  int v25 = *((unsigned __int8 *)a1 + v23);
  if (!*((unsigned char *)a1 + v23)) {
    goto LABEL_31;
  }
LABEL_21:
  int v28 = (v25 - 1) << v24;
  if (v23 > 3) {
    int v28 = 0;
  }
  if (v23)
  {
    if (v23 <= 3) {
      int v29 = v23;
    }
    else {
      int v29 = 4;
    }
    switch(v29)
    {
      case 2:
        int v30 = *a1;
        break;
      case 3:
        int v30 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v30 = *(_DWORD *)a1;
        break;
      default:
        int v30 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v30 = 0;
  }
  return v15 + (v30 | v28) + 1;
}

void sub_217B5AD48(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(sub_217B5F4F0() - 8);
  if (*(void *)(v8 + 64) <= 8uLL) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = *(void *)(v8 + 64);
  }
  uint64_t v10 = sub_217B5FAC0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int *)(v11 + 84);
  uint64_t v13 = *(void *)(a4 + 16);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int *)(v14 + 84);
  if (v12 <= v15) {
    unsigned int v16 = *(_DWORD *)(v14 + 84);
  }
  else {
    unsigned int v16 = *(_DWORD *)(v11 + 84);
  }
  if (v16 <= 0x7FFFFFFF) {
    unsigned int v17 = 0x7FFFFFFF;
  }
  else {
    unsigned int v17 = v16;
  }
  uint64_t v18 = *(_DWORD *)(v8 + 80) & 0xF8;
  uint64_t v19 = v18 | 7;
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = v9 + v20 + 1;
  uint64_t v22 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v23 = *(void *)(*(void *)(v10 - 8) + 64) + v22 + 1;
  size_t v24 = ((v23 + ((v21 + ((v18 + 56) & ~(v18 | 7))) & ~v20)) & ~v22) + *(void *)(v14 + 64);
  char v25 = 8 * v24;
  if (a3 <= v17)
  {
    int v26 = 0;
  }
  else if (v24 <= 3)
  {
    unsigned int v31 = ((a3 - v17 + ~(-1 << v25)) >> v25) + 1;
    if (HIWORD(v31))
    {
      int v26 = 4;
    }
    else if (v31 >= 0x100)
    {
      int v26 = 2;
    }
    else
    {
      int v26 = v31 > 1;
    }
  }
  else
  {
    int v26 = 1;
  }
  if (v17 < a2)
  {
    unsigned int v27 = ~v17 + a2;
    if (v24 < 4)
    {
      int v28 = (v27 >> v25) + 1;
      if (v24)
      {
        int v32 = v27 & ~(-1 << v25);
        bzero(a1, v24);
        if (v24 == 3)
        {
          *(_WORD *)a1 = v32;
          a1[2] = BYTE2(v32);
        }
        else if (v24 == 2)
        {
          *(_WORD *)a1 = v32;
        }
        else
        {
          *a1 = v32;
        }
      }
    }
    else
    {
      bzero(a1, v24);
      *(_DWORD *)a1 = v27;
      int v28 = 1;
    }
    switch(v26)
    {
      case 1:
        a1[v24] = v28;
        return;
      case 2:
        *(_WORD *)&a1[v24] = v28;
        return;
      case 3:
        goto LABEL_50;
      case 4:
        *(_DWORD *)&a1[v24] = v28;
        return;
      default:
        return;
    }
  }
  uint64_t v29 = ~v20;
  uint64_t v30 = ~v22;
  switch(v26)
  {
    case 1:
      a1[v24] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v24] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_50:
      __break(1u);
      JUMPOUT(0x217B5B0C8);
    case 4:
      *(_DWORD *)&a1[v24] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        unint64_t v33 = (void *)((unint64_t)(a1 + 23) & 0xFFFFFFFFFFFFFFF8);
        if ((v16 & 0x80000000) != 0)
        {
          unint64_t v34 = (v21 + (((((unint64_t)v33 + 31) & 0xFFFFFFFFFFFFFFF8) + v19 + 9) & ~v19)) & v29;
          if (v12 == v17)
          {
            uint64_t v35 = a2;
            uint64_t v13 = v10;
          }
          else
          {
            unint64_t v34 = (v23 + v34) & v30;
            uint64_t v35 = a2;
            uint64_t v12 = v15;
          }
          __swift_storeEnumTagSinglePayload(v34, v35, v12, v13);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          v33[1] = 0;
          v33[2] = 0;
          *unint64_t v33 = a2 ^ 0x80000000;
        }
        else
        {
          v33[1] = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t sub_217B5B0F0()
{
  return type metadata accessor for PhotosPickerViewController.Coordinator(0);
}

uint64_t type metadata accessor for PhotosPickerViewController.Coordinator(uint64_t a1)
{
  return sub_217B4796C(a1, (uint64_t *)&unk_267BAC1B0);
}

uint64_t sub_217B5B118()
{
  uint64_t result = type metadata accessor for PhotosPickerViewController(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_217B5B1B4()
{
  return sub_217B48944(&qword_267BAC1C0, &qword_267BAC1C8);
}

uint64_t sub_217B5B1F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_217B5B37C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B5B43C()
{
  return swift_getWitnessTable();
}

uint64_t sub_217B5B538(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC1E0, &qword_267BAC1E8);
}

uint64_t sub_217B5B560(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC1F0, &qword_267BAC1F8);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getWitnessTable();
}

uint64_t sub_217B5B61C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC200, &qword_267BAC208);
}

uint64_t sub_217B5B644(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC210, &qword_267BAC218);
}

uint64_t sub_217B5B66C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC220, &qword_267BAC228);
}

uint64_t sub_217B5B694(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC230, &qword_267BAC238);
}

uint64_t sub_217B5B6BC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA32_EnvironmentKeyTransformModifierVyAA4EdgeO3SetVGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_267BAC240, qword_267BAC248);
}

uint64_t sub_217B5B6E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_217B5B6EC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_217B5B77C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_217B5B834(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_217B5B860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_217B5B8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_217B5B900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_217B5B950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_217B5B9A0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(unsigned int *)(*(void *)(v4 - 8) + 84);
  uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  if (!a2) {
    return 0;
  }
  int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return __swift_getEnumTagSinglePayload((uint64_t)a1, v5, v4);
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_217B5BAEC(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 - 8) + 84);
  size_t v8 = *(void *)(*(void *)(v6 - 8) + 64);
  char v9 = 8 * v8;
  BOOL v10 = a3 >= v7;
  int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v8 < 4)
    {
      int v14 = (v13 >> v9) + 1;
      if (v8)
      {
        int v16 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v8] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x217B5BCF0);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        __swift_storeEnumTagSinglePayload((uint64_t)a1, a2, v7, v6);
      }
      return;
  }
}

uint64_t type metadata accessor for UncheckedSendable()
{
  return __swift_instantiateGenericMetadata();
}

void *sub_217B5BD30(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_217B5F8A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    BOOL v10 = (char *)a1 + v9;
    int v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_217B5C2B4(*(void *)v11, v13);
    *(void *)BOOL v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    unsigned int v15 = (char *)a1 + v14;
    int v16 = (char *)a2 + v14;
    uint64_t v17 = *(void *)v16;
    char v18 = v16[8];
    sub_217B5C2B4(*(void *)v16, v18);
    *(void *)unsigned int v15 = v17;
    v15[8] = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = *(void *)v21;
    char v23 = v21[8];
    sub_217B5C2B4(*(void *)v21, v23);
    *(void *)uint64_t v20 = v22;
    v20[8] = v23;
    uint64_t v24 = a3[8];
    char v25 = (char *)a1 + v24;
    int v26 = (char *)a2 + v24;
    uint64_t v27 = *(void *)v26;
    uint64_t v28 = *((void *)v26 + 1);
    char v29 = v26[16];
    sub_217B5C2C0(*(void *)v26, v28, v29);
    *(void *)char v25 = v27;
    *((void *)v25 + 1) = v28;
    v25[16] = v29;
    uint64_t v30 = a3[9];
    unsigned int v31 = (char *)a1 + v30;
    int v32 = (char *)a2 + v30;
    uint64_t v33 = *(void *)v32;
    LOBYTE(v28) = v32[8];
    sub_217B5C2B4(*(void *)v32, v28);
    *(void *)unsigned int v31 = v33;
    v31[8] = v28;
    uint64_t v34 = a3[10];
    uint64_t v35 = (void *)((char *)a1 + v34);
    uint64_t v36 = (void *)((char *)a2 + v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_217B5FAF0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
      {
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
        memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
        __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
      }
    }
    else
    {
      *uint64_t v35 = *v36;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = a3[11];
    unint64_t v40 = (void *)((char *)a1 + v39);
    uint64_t v41 = (void *)((char *)a2 + v39);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v42 = sub_217B5FAF0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v42))
      {
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
        memcpy(v40, v41, *(void *)(*(void *)(v43 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
        __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v42);
      }
    }
    else
    {
      *unint64_t v40 = *v41;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v44 = a3[12];
    uint64_t v45 = (void *)((char *)a1 + v44);
    uint64_t v46 = (void *)((char *)a2 + v44);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v47 = sub_217B5FAD0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
      {
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F0);
        memcpy(v45, v46, *(void *)(*(void *)(v48 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v47 - 8) + 16))(v45, v46, v47);
        __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
      }
    }
    else
    {
      *uint64_t v45 = *v46;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v49 = a3[13];
    uint64_t v50 = a3[14];
    uint64_t v51 = (char *)a1 + v49;
    uint64_t v52 = (char *)a2 + v49;
    uint64_t v53 = *((void *)v52 + 1);
    *(void *)uint64_t v51 = *(void *)v52;
    *((void *)v51 + 1) = v53;
    v51[16] = v52[16];
    uint64_t v54 = (void *)((char *)a1 + v50);
    uint64_t v55 = (void *)((char *)a2 + v50);
    uint64_t v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    v54[2] = v55[2];
    uint64_t v57 = a3[15];
    uint64_t v62 = (char *)a2 + v57;
    uint64_t v63 = (char *)a1 + v57;
    uint64_t v58 = sub_217B5FAC0();
    uint64_t v61 = a2;
    uint64_t v59 = *(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v59(v63, v62, v58);
    *((unsigned char *)a1 + a3[16]) = *((unsigned char *)v61 + a3[16]);
  }
  return a1;
}

uint64_t sub_217B5C2B4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_217B5C2C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_217B5C2D0(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_217B5F8A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_217B5C5D4(*(void *)(a1 + a2[5]), *(unsigned char *)(a1 + a2[5] + 8));
  sub_217B5C5D4(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));
  sub_217B5C5D4(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  sub_217B5C5E0(*(void *)(a1 + a2[8]), *(void *)(a1 + a2[8] + 8), *(unsigned char *)(a1 + a2[8] + 16));
  sub_217B5C5D4(*(void *)(a1 + a2[9]), *(unsigned char *)(a1 + a2[9] + 8));
  uint64_t v5 = a1 + a2[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_217B5FAF0();
    if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[11];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_217B5FAF0();
    if (!__swift_getEnumTagSinglePayload(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_217B5FAD0();
    if (!__swift_getEnumTagSinglePayload(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + a2[15];
  uint64_t v12 = sub_217B5FAC0();
  char v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);

  return v13(v11, v12);
}

uint64_t sub_217B5C5D4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_217B5C5E0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

void *sub_217B5C5F0(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_217B5F8A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_217B5C2B4(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  char v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = v14[8];
  sub_217B5C2B4(*(void *)v14, v16);
  *(void *)char v13 = v15;
  v13[8] = v16;
  uint64_t v17 = a3[7];
  char v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = *(void *)v19;
  char v21 = v19[8];
  sub_217B5C2B4(*(void *)v19, v21);
  *(void *)char v18 = v20;
  v18[8] = v21;
  uint64_t v22 = a3[8];
  char v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  uint64_t v26 = *((void *)v24 + 1);
  char v27 = v24[16];
  sub_217B5C2C0(*(void *)v24, v26, v27);
  *(void *)char v23 = v25;
  *((void *)v23 + 1) = v26;
  v23[16] = v27;
  uint64_t v28 = a3[9];
  char v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void *)v30;
  LOBYTE(v26) = v30[8];
  sub_217B5C2B4(*(void *)v30, v26);
  *(void *)char v29 = v31;
  v29[8] = v26;
  uint64_t v32 = a3[10];
  uint64_t v33 = (void *)((char *)a1 + v32);
  uint64_t v34 = (void *)((char *)a2 + v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v35 = sub_217B5FAF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
    }
  }
  else
  {
    *uint64_t v33 = *v34;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v37 = a3[11];
  uint64_t v38 = (void *)((char *)a1 + v37);
  uint64_t v39 = (void *)((char *)a2 + v37);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v40 = sub_217B5FAF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v40))
    {
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
      memcpy(v38, v39, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
      __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v40);
    }
  }
  else
  {
    *uint64_t v38 = *v39;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v42 = a3[12];
  uint64_t v43 = (void *)((char *)a1 + v42);
  uint64_t v44 = (void *)((char *)a2 + v42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v45 = sub_217B5FAD0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v45))
    {
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F0);
      memcpy(v43, v44, *(void *)(*(void *)(v46 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
      __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v45);
    }
  }
  else
  {
    void *v43 = *v44;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v47 = a3[13];
  uint64_t v48 = a3[14];
  uint64_t v49 = (char *)a1 + v47;
  uint64_t v50 = (char *)a2 + v47;
  uint64_t v51 = *((void *)v50 + 1);
  *(void *)uint64_t v49 = *(void *)v50;
  *((void *)v49 + 1) = v51;
  v49[16] = v50[16];
  uint64_t v52 = (void *)((char *)a1 + v48);
  uint64_t v53 = (void *)((char *)a2 + v48);
  uint64_t v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  v52[2] = v53[2];
  uint64_t v55 = a3[15];
  uint64_t v60 = (char *)a2 + v55;
  uint64_t v61 = (char *)a1 + v55;
  uint64_t v56 = sub_217B5FAC0();
  uint64_t v59 = a2;
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v57(v61, v60, v56);
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)v59 + a3[16]);
  return a1;
}

void *sub_217B5CB24(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_217B5E660((uint64_t)a1, &qword_267BAC2D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_217B5F8A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_217B5C2B4(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_217B5C5D4(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  char v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = v16[8];
  sub_217B5C2B4(*(void *)v16, v18);
  uint64_t v19 = *(void *)v15;
  char v20 = v15[8];
  *(void *)uint64_t v15 = v17;
  v15[8] = v18;
  sub_217B5C5D4(v19, v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = (char *)a1 + v21;
  char v23 = (char *)a2 + v21;
  uint64_t v24 = *(void *)v23;
  char v25 = v23[8];
  sub_217B5C2B4(*(void *)v23, v25);
  uint64_t v26 = *(void *)v22;
  char v27 = v22[8];
  *(void *)uint64_t v22 = v24;
  v22[8] = v25;
  sub_217B5C5D4(v26, v27);
  uint64_t v28 = a3[8];
  char v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = *(void *)v30;
  uint64_t v32 = *((void *)v30 + 1);
  LOBYTE(v22) = v30[16];
  sub_217B5C2C0(*(void *)v30, v32, (char)v22);
  uint64_t v33 = *(void *)v29;
  uint64_t v34 = *((void *)v29 + 1);
  char v35 = v29[16];
  *(void *)char v29 = v31;
  *((void *)v29 + 1) = v32;
  v29[16] = (char)v22;
  sub_217B5C5E0(v33, v34, v35);
  uint64_t v36 = a3[9];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = *(void *)v38;
  LOBYTE(v32) = v38[8];
  sub_217B5C2B4(*(void *)v38, v32);
  uint64_t v40 = *(void *)v37;
  char v41 = v37[8];
  *(void *)uint64_t v37 = v39;
  v37[8] = v32;
  sub_217B5C5D4(v40, v41);
  if (a1 != a2)
  {
    uint64_t v42 = a3[10];
    uint64_t v43 = (void *)((char *)a1 + v42);
    uint64_t v44 = (void *)((char *)a2 + v42);
    sub_217B5E660((uint64_t)a1 + v42, &qword_267BAC2D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v45 = sub_217B5FAF0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v45))
      {
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
        memcpy(v43, v44, *(void *)(*(void *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
        __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v45);
      }
    }
    else
    {
      void *v43 = *v44;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = a3[11];
    uint64_t v48 = (void *)((char *)a1 + v47);
    uint64_t v49 = (void *)((char *)a2 + v47);
    sub_217B5E660((uint64_t)a1 + v47, &qword_267BAC2D8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v50 = sub_217B5FAF0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50))
      {
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
        memcpy(v48, v49, *(void *)(*(void *)(v51 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
        __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
      }
    }
    else
    {
      void *v48 = *v49;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v52 = a3[12];
    uint64_t v53 = (void *)((char *)a1 + v52);
    uint64_t v54 = (void *)((char *)a2 + v52);
    sub_217B5E660((uint64_t)a1 + v52, &qword_267BAC2E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v55 = sub_217B5FAD0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v54, 1, v55))
      {
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F0);
        memcpy(v53, v54, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
        __swift_storeEnumTagSinglePayload((uint64_t)v53, 0, 1, v55);
      }
    }
    else
    {
      *uint64_t v53 = *v54;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v57 = a3[13];
  uint64_t v58 = (char *)a1 + v57;
  uint64_t v59 = (char *)a2 + v57;
  *(void *)((char *)a1 + v57) = *(void *)((char *)a2 + v57);
  swift_retain();
  swift_release();
  *((void *)v58 + 1) = *((void *)v59 + 1);
  swift_retain();
  swift_release();
  v58[16] = v59[16];
  uint64_t v60 = a3[14];
  uint64_t v61 = (char *)a1 + v60;
  uint64_t v62 = (char *)a2 + v60;
  *(void *)((char *)a1 + v60) = *(void *)((char *)a2 + v60);
  swift_retain();
  swift_release();
  *((void *)v61 + 1) = *((void *)v62 + 1);
  swift_retain();
  swift_release();
  *((void *)v61 + 2) = *((void *)v62 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v63 = a3[15];
  uint64_t v64 = (char *)a1 + v63;
  uint64_t v65 = (char *)a2 + v63;
  uint64_t v66 = sub_217B5FAC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 24))(v64, v65, v66);
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
  return a1;
}

char *sub_217B5D114(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_217B5F8A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = &a1[v9];
  char v13 = &a2[v9];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  char v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  *(void *)char v16 = *(void *)v17;
  v16[8] = v17[8];
  char v18 = &a1[v15];
  uint64_t v19 = &a2[v15];
  *(_OWORD *)char v18 = *(_OWORD *)v19;
  v18[16] = v19[16];
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = &a1[v20];
  char v23 = &a2[v20];
  v22[8] = v23[8];
  *(void *)uint64_t v22 = *(void *)v23;
  uint64_t v24 = &a1[v21];
  char v25 = &a2[v21];
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v27 = sub_217B5FAF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v27))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
      memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v24, v25, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v27);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  uint64_t v29 = a3[11];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v32 = sub_217B5FAF0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
      memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v30, v31, *(void *)(*(void *)(v26 - 8) + 64));
  }
  uint64_t v34 = a3[12];
  char v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = sub_217B5FAD0();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F0);
      memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v35, v36, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v38);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  uint64_t v40 = a3[13];
  uint64_t v41 = a3[14];
  uint64_t v42 = &a1[v40];
  uint64_t v43 = &a2[v40];
  long long v44 = *(_OWORD *)v43;
  v42[16] = v43[16];
  *(_OWORD *)uint64_t v42 = v44;
  uint64_t v45 = &a1[v41];
  uint64_t v46 = &a2[v41];
  *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
  *((void *)v45 + 2) = *((void *)v46 + 2);
  uint64_t v47 = a3[15];
  uint64_t v48 = &a1[v47];
  uint64_t v49 = &a2[v47];
  uint64_t v50 = sub_217B5FAC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
  a1[a3[16]] = a2[a3[16]];
  return a1;
}

char *sub_217B5D5DC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_217B5E660((uint64_t)a1, &qword_267BAC2D0);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_217B5F8A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_217B5C5D4(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  char v16 = &a2[v14];
  uint64_t v17 = *(void *)v16;
  LOBYTE(v16) = v16[8];
  uint64_t v18 = *(void *)v15;
  char v19 = v15[8];
  *(void *)uint64_t v15 = v17;
  v15[8] = (char)v16;
  sub_217B5C5D4(v18, v19);
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = *(void *)v22;
  LOBYTE(v22) = v22[8];
  uint64_t v24 = *(void *)v21;
  char v25 = v21[8];
  *(void *)uint64_t v21 = v23;
  v21[8] = (char)v22;
  sub_217B5C5D4(v24, v25);
  uint64_t v26 = a3[8];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  char v29 = v28[16];
  uint64_t v30 = *(void *)v27;
  uint64_t v31 = *((void *)v27 + 1);
  char v32 = v27[16];
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  v27[16] = v29;
  sub_217B5C5E0(v30, v31, v32);
  uint64_t v33 = a3[9];
  uint64_t v34 = &a1[v33];
  char v35 = &a2[v33];
  uint64_t v36 = *(void *)v35;
  LOBYTE(v35) = v35[8];
  uint64_t v37 = *(void *)v34;
  char v38 = v34[8];
  *(void *)uint64_t v34 = v36;
  v34[8] = (char)v35;
  sub_217B5C5D4(v37, v38);
  if (a1 != a2)
  {
    uint64_t v39 = a3[10];
    uint64_t v40 = &a1[v39];
    uint64_t v41 = &a2[v39];
    sub_217B5E660((uint64_t)&a1[v39], &qword_267BAC2D8);
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v43 = sub_217B5FAF0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v43))
      {
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
        memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v40, v41, v43);
        __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v43);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
    uint64_t v45 = a3[11];
    uint64_t v46 = &a1[v45];
    uint64_t v47 = &a2[v45];
    sub_217B5E660((uint64_t)&a1[v45], &qword_267BAC2D8);
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2D8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v49 = sub_217B5FAF0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v49))
      {
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E0);
        memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(v46, v47, v49);
        __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v49);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v46, v47, *(void *)(*(void *)(v48 - 8) + 64));
    }
    uint64_t v51 = a3[12];
    uint64_t v52 = &a1[v51];
    uint64_t v53 = &a2[v51];
    sub_217B5E660((uint64_t)&a1[v51], &qword_267BAC2E8);
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v55 = sub_217B5FAD0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v53, 1, v55))
      {
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F0);
        memcpy(v52, v53, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 32))(v52, v53, v55);
        __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v55);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v52, v53, *(void *)(*(void *)(v54 - 8) + 64));
    }
  }
  uint64_t v57 = a3[13];
  uint64_t v58 = &a1[v57];
  uint64_t v59 = &a2[v57];
  *(void *)&a1[v57] = *(void *)&a2[v57];
  swift_release();
  *((void *)v58 + 1) = *((void *)v59 + 1);
  swift_release();
  v58[16] = v59[16];
  uint64_t v60 = a3[14];
  uint64_t v61 = &a1[v60];
  uint64_t v62 = &a2[v60];
  *(void *)&a1[v60] = *(void *)&a2[v60];
  swift_release();
  *((void *)v61 + 1) = *((void *)v62 + 1);
  swift_release();
  *((void *)v61 + 2) = *((void *)v62 + 2);
  swift_bridgeObjectRelease();
  uint64_t v63 = a3[15];
  uint64_t v64 = &a1[v63];
  uint64_t v65 = &a2[v63];
  uint64_t v66 = sub_217B5FAC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 40))(v64, v65, v66);
  a1[a3[16]] = a2[a3[16]];
  return a1;
}

uint64_t sub_217B5DB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217B5DB98);
}

uint64_t sub_217B5DB98(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F8);
  OUTLINED_FUNCTION_2_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_13:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC300);
  OUTLINED_FUNCTION_2_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[10];
LABEL_12:
    uint64_t v9 = a1 + v12;
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC308);
  OUTLINED_FUNCTION_2_0();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[12];
    goto LABEL_12;
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_217B5FAC0();
    uint64_t v12 = a3[15];
    goto LABEL_12;
  }
  unint64_t v15 = *(void *)(a1 + a3[13] + 8);
  if (v15 >= 0xFFFFFFFF) {
    LODWORD(v15) = -1;
  }
  return (v15 + 1);
}

uint64_t sub_217B5DCA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217B5DCB4);
}

void sub_217B5DCB4()
{
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC2F8);
  OUTLINED_FUNCTION_2_0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC300);
    OUTLINED_FUNCTION_2_0();
    if (*(_DWORD *)(v9 + 84) == v3)
    {
      uint64_t v6 = v8;
      uint64_t v10 = v2[10];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BAC308);
      OUTLINED_FUNCTION_2_0();
      if (*(_DWORD *)(v12 + 84) == v3)
      {
        uint64_t v6 = v11;
        uint64_t v10 = v2[12];
      }
      else
      {
        if (v3 == 0x7FFFFFFF)
        {
          *(void *)(v1 + v2[13] + 8) = (v0 - 1);
          return;
        }
        uint64_t v6 = sub_217B5FAC0();
        uint64_t v10 = v2[15];
      }
    }
    uint64_t v7 = v1 + v10;
  }

  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_217B5DDAC()
{
  sub_217B5DF5C(319, &qword_267BAC320, MEMORY[0x263F15168]);
  if (v0 <= 0x3F)
  {
    sub_217B5DFB0(319, &qword_267BAC328, &qword_267BAC2E0);
    if (v1 <= 0x3F)
    {
      sub_217B5DFB0(319, &qword_267BAC330, &qword_267BAC2F0);
      if (v2 <= 0x3F)
      {
        sub_217B5FAC0();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_217B5DF5C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_217B5F4A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_217B5DFB0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_217B5F4A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_217B5E000()
{
  return sub_217B4B120(&qword_267BAC0A8, (void (*)(uint64_t))type metadata accessor for PhotosPickerViewController);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_217B5E09C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_217B5E0F8()
{
  unint64_t result = qword_267BAC3B0;
  if (!qword_267BAC3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3B0);
  }
  return result;
}

unint64_t sub_217B5E144()
{
  unint64_t result = qword_267BAC3B8;
  if (!qword_267BAC3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3B8);
  }
  return result;
}

unint64_t sub_217B5E190()
{
  unint64_t result = qword_267BAC3C0;
  if (!qword_267BAC3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3C0);
  }
  return result;
}

unint64_t sub_217B5E1DC()
{
  unint64_t result = qword_267BAC3C8;
  if (!qword_267BAC3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3C8);
  }
  return result;
}

unint64_t sub_217B5E228()
{
  unint64_t result = qword_267BAC3D0;
  if (!qword_267BAC3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3D0);
  }
  return result;
}

unint64_t sub_217B5E274()
{
  unint64_t result = qword_267BAC3D8;
  if (!qword_267BAC3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3D8);
  }
  return result;
}

unint64_t sub_217B5E2C0()
{
  unint64_t result = qword_267BAC3E0;
  if (!qword_267BAC3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3E0);
  }
  return result;
}

unint64_t sub_217B5E30C()
{
  unint64_t result = qword_267BAC3E8;
  if (!qword_267BAC3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3E8);
  }
  return result;
}

unint64_t sub_217B5E358()
{
  unint64_t result = qword_267BAC3F0;
  if (!qword_267BAC3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3F0);
  }
  return result;
}

unint64_t sub_217B5E3A4()
{
  unint64_t result = qword_267BAC3F8;
  if (!qword_267BAC3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC3F8);
  }
  return result;
}

uint64_t sub_217B5E3F0()
{
  return sub_217B5F530();
}

uint64_t sub_217B5E414(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t objectdestroy_11Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 56))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_217B5E4F4()
{
  uint64_t v1 = sub_217B5FAC0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 64) & ~v6;
  uint64_t v8 = v6 | 7;
  uint64_t v9 = *(void *)(v5 + 64) + v7 + 1;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v9, v8);
}

uint64_t sub_217B5E5BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_217B5FAC0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  int v7 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  uint64_t v9 = *(void *)(v1 + 48);
  uint64_t v10 = *(void *)(v1 + 56);
  int v11 = *(unsigned __int8 *)(v1 + v4 + *(void *)(v3 + 64));

  return sub_217B53DCC(v5, v6, v7, v8, v9, v10, v1 + v4, v11, a1);
}

uint64_t sub_217B5E660(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14_0();
  v3();
  return a1;
}

uint64_t sub_217B5E6B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_20_0();
  v4();
  return a2;
}

uint64_t sub_217B5E708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_217B4A8A0(a1, *(void *)(v2 + 16), a2);
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

uint64_t sub_217B5E774()
{
  sub_217B5FD10();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC398);
  sub_217B5FC20();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14_0();
  v0();
  OUTLINED_FUNCTION_44();

  return MEMORY[0x270FA0238](v1, v2, v3);
}

uint64_t sub_217B5E820(uint64_t a1)
{
  sub_217B5FD10();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC398);
  uint64_t v2 = sub_217B5FC20();
  OUTLINED_FUNCTION_8_0(v2);

  return sub_217B4B26C(a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

ValueMetadata *type metadata accessor for PhotosPickerIsPresentationEnvironmentKey()
{
  return &type metadata for PhotosPickerIsPresentationEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerModeEnvironmentKey()
{
  return &type metadata for PhotosPickerModeEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerEdgesWithoutContentMarginsEnvironmentKey()
{
  return &type metadata for PhotosPickerEdgesWithoutContentMarginsEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerDisabledCapabilitiesEnvironmentKey()
{
  return &type metadata for PhotosPickerDisabledCapabilitiesEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerDisabledPrivateCapabilitiesEnvironmentKey()
{
  return &type metadata for PhotosPickerDisabledPrivateCapabilitiesEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerSourceTypeEnvironmentKey()
{
  return &type metadata for PhotosPickerSourceTypeEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerPeopleConfigurationEnvironmentKey()
{
  return &type metadata for PhotosPickerPeopleConfigurationEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerContainerIdentifierEnvironmentKey()
{
  return &type metadata for PhotosPickerContainerIdentifierEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerAlbumsConfigurationEnvironmentKey()
{
  return &type metadata for PhotosPickerAlbumsConfigurationEnvironmentKey;
}

ValueMetadata *type metadata accessor for PhotosPickerSuggestionGroupEnvironmentKey()
{
  return &type metadata for PhotosPickerSuggestionGroupEnvironmentKey;
}

unint64_t sub_217B5E988()
{
  unint64_t result = qword_267BAC420;
  if (!qword_267BAC420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC2F0);
    sub_217B4B120(&qword_267BAC428, MEMORY[0x263F151E8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC420);
  }
  return result;
}

unint64_t sub_217B5EA2C()
{
  unint64_t result = qword_267BAC430;
  if (!qword_267BAC430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC2E0);
    sub_217B4B120(&qword_267BAC438, MEMORY[0x263F151F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC430);
  }
  return result;
}

unint64_t sub_217B5EAD0()
{
  unint64_t result = qword_267BAC440;
  if (!qword_267BAC440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BAC448);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC440);
  }
  return result;
}

unint64_t sub_217B5EB3C()
{
  unint64_t result = qword_267BAC458;
  if (!qword_267BAC458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BAC458);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_12_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_217B5FA90();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_217B5FAC0();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return *(void *)(v0 - 136);
}

__n128 OUTLINED_FUNCTION_25_0()
{
  long long v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 144) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 128) = v2;
  __n128 result = *(__n128 *)(v0 + 32);
  *(__n128 *)(v1 - 112) = result;
  *(void *)(v1 - 96) = *(void *)(v0 + 48);
  return result;
}

void *OUTLINED_FUNCTION_26_0(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 32);
  *(void *)(a1 + 80) = *(void *)(v1 + 48);
  return sub_217B57F6C((void *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_29_0(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 32);
  *(void *)(a1 + 80) = *(void *)(v1 + 48);
  return sub_217B57F6C((void *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_31_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_217B5E6B0(v3, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
}

uint64_t OUTLINED_FUNCTION_32_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_217B5E6B0(v3, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
}

__n128 OUTLINED_FUNCTION_33_0(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  long long v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 48) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  *(__n128 *)(a1 + 64) = result;
  *(void *)(a1 + 80) = *(void *)(v1 + 48);
  return result;
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 - 144) = *(_OWORD *)v1;
  *(_OWORD *)(v2 - 128) = v3;
  *(_OWORD *)(v2 - 112) = *(_OWORD *)(v1 + 32);
  *(void *)(v2 - 96) = *(void *)(v1 + 48);
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return v0;
}

__n128 OUTLINED_FUNCTION_36_0(uint64_t a1)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  long long v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 48) = v2;
  __n128 result = *(__n128 *)(v1 + 32);
  *(__n128 *)(a1 + 64) = result;
  *(void *)(a1 + 80) = *(void *)(v1 + 48);
  return result;
}

void OUTLINED_FUNCTION_38_0()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 - 144) = *(_OWORD *)v1;
  *(_OWORD *)(v2 - 128) = v3;
  *(_OWORD *)(v2 - 112) = *(_OWORD *)(v1 + 32);
  *(void *)(v2 - 96) = *(void *)(v1 + 48);
  return v0;
}

void OUTLINED_FUNCTION_42()
{
  JUMPOUT(0x21D456550);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_217B5F720();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_217B5FAC0();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return 0;
}

__n128 OUTLINED_FUNCTION_50()
{
  long long v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 144) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 128) = v2;
  __n128 result = *(__n128 *)(v0 + 32);
  *(__n128 *)(v1 - 112) = result;
  *(void *)(v1 - 96) = *(void *)(v0 + 48);
  return result;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_55(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_217B4B120(v1, v0);
}

void OUTLINED_FUNCTION_59(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 - 96) = a4;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_217B5FAC0();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return v0;
}

void OUTLINED_FUNCTION_62(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 - 144) = a4;
  *(void *)(v5 - 136) = a5;
  *(void *)(v5 - 160) = a2;
  *(void *)(v5 - 152) = a3;
}

uint64_t OUTLINED_FUNCTION_63@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)(v6 - 112) = a4;
  *(void *)(v6 - 104) = a5;
  *(_DWORD *)(v6 - 116) = a3;
  *(void *)(v6 - 136) = result;
  *(void *)(v6 - 128) = a2;
  *(void *)(v6 - 144) = a6;
  return result;
}

void OUTLINED_FUNCTION_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 - 256) = a6;
  *(void *)(v6 - 280) = a5;
}

uint64_t OUTLINED_FUNCTION_67()
{
  uint64_t v4 = *(void *)(v2 - 176);
  return sub_217B5E6B0(v4, v0, v1);
}

id OUTLINED_FUNCTION_68@<X0>(int a1@<W0>, const char **a2@<X8>)
{
  if (!a1) {
    a2 = v2;
  }
  uint64_t v5 = *a2;
  return [v3 v5];
}

unint64_t OUTLINED_FUNCTION_69(float a1)
{
  float *v2 = a1;
  unint64_t v5 = *(void *)(v3 - 96);
  return sub_217B56CC0(v1, v5, (uint64_t *)(v3 - 88));
}

uint64_t OUTLINED_FUNCTION_71@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 224) = a1;
  return sub_217B5F9B0();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_217B5F330()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_217B5F340()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_217B5F360()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_217B5F380()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_217B5F390()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_217B5F3A0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_217B5F3B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_217B5F3C0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_217B5F3D0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_217B5F3E0()
{
  return MEMORY[0x270EE9F30]();
}

uint64_t sub_217B5F3F0()
{
  return MEMORY[0x270EE9F48]();
}

uint64_t sub_217B5F400()
{
  return MEMORY[0x270EE9F50]();
}

uint64_t sub_217B5F410()
{
  return MEMORY[0x270EE9F68]();
}

uint64_t sub_217B5F420()
{
  return MEMORY[0x270EE9F88]();
}

uint64_t sub_217B5F430()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_217B5F450()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_217B5F460()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t sub_217B5F470()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_217B5F480()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_217B5F490()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_217B5F4A0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_217B5F4B0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_217B5F4C0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_217B5F4D0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_217B5F4E0()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_217B5F4F0()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_217B5F510()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_217B5F520()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_217B5F530()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_217B5F540()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_217B5F550()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_217B5F560()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_217B5F570()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_217B5F580()
{
  return MEMORY[0x270F01318]();
}

uint64_t sub_217B5F590()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_217B5F5A0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_217B5F5B0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_217B5F5C0()
{
  return MEMORY[0x270F02130]();
}

uint64_t sub_217B5F5D0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_217B5F5E0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_217B5F5F0()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_217B5F610()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_217B5F620()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_217B5F630()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_217B5F650()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_217B5F660()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_217B5F670()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_217B5F680()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_217B5F690()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_217B5F6A0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_217B5F6B0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_217B5F6C0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_217B5F6D0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_217B5F6E0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_217B5F6F0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_217B5F700()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_217B5F710()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_217B5F720()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_217B5F730()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_217B5F740()
{
  return MEMORY[0x270F03A90]();
}

uint64_t sub_217B5F750()
{
  return MEMORY[0x270F03C48]();
}

uint64_t sub_217B5F760()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_217B5F770()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_217B5F780()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_217B5F790()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_217B5F7A0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_217B5F7B0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_217B5F7C0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_217B5F7D0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_217B5F7E0()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_217B5F7F0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_217B5F800()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_217B5F810()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_217B5F820()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_217B5F830()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_217B5F840()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_217B5F850()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_217B5F860()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_217B5F870()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_217B5F880()
{
  return MEMORY[0x270EFA330]();
}

uint64_t sub_217B5F890()
{
  return MEMORY[0x270EFA338]();
}

uint64_t sub_217B5F8A0()
{
  return MEMORY[0x270EFA340]();
}

uint64_t sub_217B5F8B0()
{
  return MEMORY[0x270EFA380]();
}

uint64_t sub_217B5F8C0()
{
  return MEMORY[0x270EFA388]();
}

uint64_t sub_217B5F8D0()
{
  return MEMORY[0x270EFA398]();
}

uint64_t sub_217B5F8E0()
{
  return MEMORY[0x270EFA3A0]();
}

uint64_t sub_217B5F8F0()
{
  return MEMORY[0x270EFA3A8]();
}

uint64_t sub_217B5F900()
{
  return MEMORY[0x270EFA3B0]();
}

uint64_t sub_217B5F910()
{
  return MEMORY[0x270EFA3B8]();
}

uint64_t sub_217B5F920()
{
  return MEMORY[0x270EFA3C0]();
}

uint64_t sub_217B5F930()
{
  return MEMORY[0x270EFA3C8]();
}

uint64_t sub_217B5F940()
{
  return MEMORY[0x270EFA3D8]();
}

uint64_t sub_217B5F950()
{
  return MEMORY[0x270EFA3E0]();
}

uint64_t sub_217B5F960()
{
  return MEMORY[0x270EFA3E8]();
}

uint64_t sub_217B5F970()
{
  return MEMORY[0x270EFA3F0]();
}

uint64_t sub_217B5F980()
{
  return MEMORY[0x270EFA400]();
}

uint64_t sub_217B5F990()
{
  return MEMORY[0x270EFA408]();
}

uint64_t _s015_PhotosUI_SwiftB00A23PickerSelectionBehaviorV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EFA410]();
}

uint64_t sub_217B5F9B0()
{
  return MEMORY[0x270EFA418]();
}

uint64_t sub_217B5F9C0()
{
  return MEMORY[0x270EFA420]();
}

uint64_t sub_217B5F9D0()
{
  return MEMORY[0x270EFA428]();
}

uint64_t sub_217B5F9E0()
{
  return MEMORY[0x270EFA430]();
}

uint64_t sub_217B5F9F0()
{
  return MEMORY[0x270EFA438]();
}

uint64_t sub_217B5FA00()
{
  return MEMORY[0x270EFA440]();
}

uint64_t sub_217B5FA10()
{
  return MEMORY[0x270EFA450]();
}

uint64_t sub_217B5FA20()
{
  return MEMORY[0x270EFA460]();
}

uint64_t sub_217B5FA30()
{
  return MEMORY[0x270EFA468]();
}

uint64_t sub_217B5FA40()
{
  return MEMORY[0x270EFA470]();
}

uint64_t sub_217B5FA50()
{
  return MEMORY[0x270EFA478]();
}

uint64_t sub_217B5FA60()
{
  return MEMORY[0x270EFA480]();
}

uint64_t sub_217B5FA70()
{
  return MEMORY[0x270EFA488]();
}

uint64_t sub_217B5FA80()
{
  return MEMORY[0x270EFA490]();
}

uint64_t sub_217B5FA90()
{
  return MEMORY[0x270EFA498]();
}

uint64_t sub_217B5FAA0()
{
  return MEMORY[0x270EFA4A0]();
}

uint64_t sub_217B5FAB0()
{
  return MEMORY[0x270EFA4A8]();
}

uint64_t sub_217B5FAC0()
{
  return MEMORY[0x270EFA4B8]();
}

uint64_t sub_217B5FAD0()
{
  return MEMORY[0x270EFA4D0]();
}

uint64_t sub_217B5FAE0()
{
  return MEMORY[0x270EFA4E8]();
}

uint64_t sub_217B5FAF0()
{
  return MEMORY[0x270EFA500]();
}

uint64_t sub_217B5FB00()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_217B5FB10()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_217B5FB20()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_217B5FB30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_217B5FB40()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_217B5FB50()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_217B5FB60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_217B5FB70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_217B5FB80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_217B5FB90()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_217B5FBA0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_217B5FBB0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_217B5FBC0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_217B5FBE0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_217B5FBF0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_217B5FC00()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_217B5FC10()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_217B5FC20()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_217B5FC30()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_217B5FC40()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_217B5FC50()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_217B5FC60()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_217B5FC70()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_217B5FC80()
{
  return MEMORY[0x270EE9FA0]();
}

uint64_t sub_217B5FC90()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_217B5FCA0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_217B5FCB0()
{
  return MEMORY[0x270EFA508]();
}

uint64_t sub_217B5FCC0()
{
  return MEMORY[0x270EFA510]();
}

uint64_t sub_217B5FCD0()
{
  return MEMORY[0x270EFA518]();
}

uint64_t sub_217B5FCE0()
{
  return MEMORY[0x270EFA520]();
}

uint64_t sub_217B5FCF0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_217B5FD00()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_217B5FD10()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_217B5FD30()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_217B5FD40()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_217B5FD50()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_217B5FD60()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_217B5FD70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_217B5FD80()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_217B5FD90()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_217B5FDA0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_217B5FDB0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_217B5FDC0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_217B5FDD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_217B5FDE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_217B5FE00()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_217B5FE10()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_217B5FE20()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_217B5FE30()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_217B5FE40()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_217B5FE50()
{
  return MEMORY[0x270F9FCF8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x270F53AA8]();
}

uint64_t PFIsLivePhotoBundleType()
{
  return MEMORY[0x270F53AD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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