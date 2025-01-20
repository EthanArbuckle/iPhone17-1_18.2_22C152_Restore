uint64_t sub_24F94556C()
{
  return MEMORY[0x263F8EE80];
}

uint64_t sub_24F945578@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_24F9455C4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_24F94561C(v0);
}

uint64_t sub_24F9455F0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24F94561C(uint64_t a1)
{
  OUTLINED_FUNCTION_3();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F945658()
{
  type metadata accessor for TypeSchema();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 144))(MEMORY[0x263F8EE78]);
  swift_release();
  return v1;
}

uint64_t sub_24F9456B8()
{
  OUTLINED_FUNCTION_2();
  uint64_t v0 = OUTLINED_FUNCTION_10();
  uint64_t v1 = OUTLINED_FUNCTION_5();
  sub_24F94619C(v1, v2);
  return v0;
}

uint64_t type metadata accessor for TypeSchema()
{
  return self;
}

uint64_t sub_24F945718@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 120))();
  *a2 = result;
  return result;
}

uint64_t sub_24F945764()
{
  uint64_t v0 = swift_retain();
  return sub_24F9457BC(v0);
}

uint64_t sub_24F945790()
{
  return swift_retain();
}

uint64_t sub_24F9457BC(uint64_t a1)
{
  OUTLINED_FUNCTION_3();
  *(void *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t ServiceSchema.__allocating_init(declaration:)(uint64_t *a1)
{
  uint64_t v2 = swift_allocObject();
  ServiceSchema.init(declaration:)(a1);
  return v2;
}

uint64_t ServiceSchema.init(declaration:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  v1[2] = MEMORY[0x263F8EE80];
  type metadata accessor for TypeSchema();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v7 = (*(uint64_t (**)(void))(v5 + 144))(MEMORY[0x263F8EE78]);
  swift_release();
  v1[3] = v7;
  uint64_t v8 = v3;
  v9 = v1;
  (*(void (**)(uint64_t, uint64_t))(*v1 + 168))(v8, v2);
  OUTLINED_FUNCTION_7();
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(v10 + 144))(v6);
  swift_release();
  swift_beginAccess();
  v1[3] = v11;
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)(v4 + 16);
  if (v29)
  {
    unint64_t v13 = 0;
    uint64_t v14 = v4 + 32;
    uint64_t v27 = v4 + 32;
    uint64_t v28 = v4;
    while (v13 < *(void *)(v4 + 16))
    {
      v15 = (uint64_t *)(v14 + 40 * v13);
      uint64_t v16 = v15[2];
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        uint64_t v18 = v15[1];
        uint64_t v32 = *v15;
        unint64_t v30 = v13;
        OUTLINED_FUNCTION_0();
        v31 = *(void (**)(uint64_t, uint64_t, void *))(v19 + 152);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        uint64_t v20 = v18;
        swift_bridgeObjectRetain();
        v21 = (uint64_t *)(v16 + 72);
        do
        {
          uint64_t v22 = *(v21 - 4);
          uint64_t v24 = *(v21 - 3);
          uint64_t v23 = *(v21 - 2);
          uint64_t v26 = *(v21 - 1);
          uint64_t v25 = *v21;
          v33[0] = *(v21 - 5);
          v33[1] = v22;
          v33[2] = v24;
          v33[3] = v23;
          v33[4] = v26;
          v33[5] = v25;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v1 = v9;
          v31(v32, v20, v33);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v21 += 6;
          --v17;
        }
        while (v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v14 = v27;
        uint64_t v4 = v28;
        unint64_t v13 = v30;
      }
      if (++v13 == v29)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v1;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return (uint64_t)v1;
  }
  return result;
}

uint64_t sub_24F945AD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = a3[3];
  OUTLINED_FUNCTION_0();
  (*(void (**)(void))(v7 + 168))();
  uint64_t v10 = v5;
  long long v11 = *(_OWORD *)(a3 + 1);
  uint64_t v12 = v6;
  long long v13 = *((_OWORD *)a3 + 2);
  OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t *))(v8 + 136))(v3, &v10);
  return swift_release();
}

uint64_t sub_24F945B94()
{
  OUTLINED_FUNCTION_0();
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 168))(v2);
  swift_retain();
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_24F945C60(v4, v0);
  swift_bridgeObjectRelease();
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 152))(v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24F945C60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_24F98E3A8();
    uint64_t v5 = *(void (**)(void *))(*(void *)a2 + 160);
    uint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v7 = *(v6 - 2);
      uint64_t v8 = *(v6 - 1);
      uint64_t v9 = *v6;
      v6 += 3;
      v12[0] = v7;
      v12[1] = v8;
      v12[2] = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v5(v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24F98E388();
      sub_24F98E3B8();
      sub_24F98E3C8();
      sub_24F98E398();
      --v3;
    }
    while (v3);
    uint64_t v10 = v13;
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return v10;
}

uint64_t sub_24F945DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_24F98E3A8();
    type metadata accessor for ParameterSchema();
    uint64_t v5 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      uint64_t v8 = v5[3];
      uint64_t v9 = v5[4];
      char v10 = *((unsigned char *)v5 + 40);
      v13[0] = *(v5 - 2);
      v13[1] = v6;
      v13[2] = v7;
      long long v14 = *(_OWORD *)(v5 + 1);
      uint64_t v15 = v8;
      uint64_t v16 = v9;
      char v17 = v10;
      swift_allocObject();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_24F947E14(a2, (uint64_t)v13);
      sub_24F98E388();
      sub_24F98E3B8();
      sub_24F98E3C8();
      sub_24F98E398();
      v5 += 8;
      --v3;
    }
    while (v3);
    uint64_t v11 = v18;
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  return v11;
}

uint64_t sub_24F945EF4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 96);
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = v5(v6);
  uint64_t v8 = OUTLINED_FUNCTION_9(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v8)
  {
    type metadata accessor for TypeSchema();
    uint64_t v8 = OUTLINED_FUNCTION_10();
    uint64_t v9 = OUTLINED_FUNCTION_5();
    sub_24F94619C(v9, v10);
    OUTLINED_FUNCTION_8();
    swift_bridgeObjectRetain_n();
    uint64_t v11 = swift_retain();
    sub_24F948284(v11, a1, a2, &qword_269A35370);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_24F945FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_24F9480BC(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

uint64_t ServiceSchema.deinit()
{
  return sub_24F946520(MEMORY[0x263F8EEA0], MEMORY[0x263F8EED8]);
}

uint64_t ServiceSchema.__deallocating_deinit()
{
  ServiceSchema.deinit();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24F946080()
{
  type metadata accessor for MethodSetSchema();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = MEMORY[0x263F8EE80];
  return result;
}

uint64_t sub_24F9460B0()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = MEMORY[0x263F8EE80];
  return result;
}

uint64_t sub_24F9460E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_24F94612C()
{
  uint64_t v0 = swift_retain();
  return sub_24F946184(v0);
}

uint64_t sub_24F946158()
{
  return swift_retain();
}

uint64_t sub_24F946184(uint64_t a1)
{
  return sub_24F946CDC(a1, MEMORY[0x263F8EED8]);
}

void *sub_24F94619C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for MethodSetSchema();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = MEMORY[0x263F8EE80];
  v2[3] = a2;
  v2[4] = v5;
  v2[2] = a1;
  return v2;
}

uint64_t _s21GameServicesProtocols10TypeSchemaC4nameSSvg_0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24F946220()
{
  OUTLINED_FUNCTION_0();
  uint64_t v2 = (*(uint64_t (**)(void))(v1 + 96))();
  (*(void (**)(void, void))(*(void *)v2 + 120))(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_release();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = OUTLINED_FUNCTION_6();
  v4(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24F94631C()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_24F946344(uint64_t a1)
{
  type metadata accessor for TypeInstance();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_24F946398()
{
  OUTLINED_FUNCTION_2();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  *(void *)(result + 24) = v0;
  return result;
}

uint64_t TypeSchema.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t TypeSchema.__deallocating_deinit()
{
  TypeSchema.deinit();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_24F94642C()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t TypeInstance.schema.getter()
{
  return swift_retain();
}

uint64_t TypeInstance.arguments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24F94647C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24F9464B0()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t TypeInstance.deinit()
{
  return sub_24F946520(MEMORY[0x263F8EED8], MEMORY[0x263F8EEA0]);
}

uint64_t sub_24F946520(void (*a1)(void), void (*a2)(void))
{
  a1(*(void *)(v2 + 16));
  a2(*(void *)(v2 + 24));
  return v2;
}

uint64_t TypeInstance.__deallocating_deinit()
{
  TypeInstance.deinit();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24F946594()
{
  OUTLINED_FUNCTION_0();
  (*(void (**)(void))(v0 + 120))();
  OUTLINED_FUNCTION_7();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v3 = OUTLINED_FUNCTION_6();
  v2(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *sub_24F946660(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 16);
  if (!*(void *)(v5 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24F9480BC(a1, a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    type metadata accessor for OverloadedMethodSchema();
    uint64_t v8 = (void *)swift_allocObject();
    uint64_t v9 = MEMORY[0x263F8EE80];
    v8[4] = MEMORY[0x263F8EE78];
    v8[5] = v9;
    v8[2] = a1;
    v8[3] = a2;
    OUTLINED_FUNCTION_8();
    swift_bridgeObjectRetain_n();
    uint64_t v10 = swift_retain();
    sub_24F948284(v10, a1, a2, &qword_269A35368);
    swift_endAccess();
    goto LABEL_6;
  }
  uint64_t v8 = *(void **)(*(void *)(v5 + 56) + 8 * v6);
  swift_retain();
  swift_bridgeObjectRelease();
LABEL_6:
  swift_bridgeObjectRelease();
  return v8;
}

void *sub_24F946788()
{
  OUTLINED_FUNCTION_2();
  uint64_t result = (void *)swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8EE80];
  result[4] = MEMORY[0x263F8EE78];
  result[5] = v3;
  result[2] = v1;
  result[3] = v0;
  return result;
}

uint64_t sub_24F9467D4@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_24F9468A8(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  a1[1] = 0;
  return result;
}

uint64_t sub_24F946830@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_24F94687C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_24F946CC4(v0);
}

uint64_t sub_24F9468A8(uint64_t a1)
{
  uint64_t v16 = MEMORY[0x263F8EE78];
  sub_24F949C40(a1, v17);
  uint64_t v1 = v17[0];
  uint64_t v2 = v17[1];
  int64_t v3 = v17[3];
  unint64_t v4 = v17[4];
  int64_t v5 = (unint64_t)(v17[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v7 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  unint64_t v8 = v7 | (v3 << 6);
  while (1)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v1 + 56) + 8 * v8) + 104);
    uint64_t v14 = swift_retain();
    unint64_t v15 = v13(v14);
    swift_release();
    uint64_t result = sub_24F9484D8(v15);
    if (v4) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v9 >= v5) {
      goto LABEL_21;
    }
    unint64_t v10 = *(void *)(v2 + 8 * v9);
    int64_t v11 = v3 + 1;
    if (!v10)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v5) {
        goto LABEL_21;
      }
      unint64_t v10 = *(void *)(v2 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v5) {
          goto LABEL_21;
        }
        unint64_t v10 = *(void *)(v2 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v3 + 4;
          if (v3 + 4 >= v5) {
            goto LABEL_21;
          }
          unint64_t v10 = *(void *)(v2 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v3 + 5;
            if (v3 + 5 >= v5) {
              goto LABEL_21;
            }
            unint64_t v10 = *(void *)(v2 + 8 * v11);
            if (!v10)
            {
              int64_t v12 = v3 + 6;
              while (v12 < v5)
              {
                unint64_t v10 = *(void *)(v2 + 8 * v12++);
                if (v10)
                {
                  int64_t v11 = v12 - 1;
                  goto LABEL_18;
                }
              }
LABEL_21:
              swift_release();
              return v16;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v4 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    int64_t v3 = v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_24F946A40()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *(void *)(v0 + 16);
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = OUTLINED_FUNCTION_5();
  unint64_t v4 = sub_24F9480BC(v2, v3);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(v1 + 56) + 8 * v4);
    swift_retain();
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t MethodSetSchema.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MethodSetSchema.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_24F946B30()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = MEMORY[0x263F8EE80];
  return result;
}

uint64_t sub_24F946B44()
{
  OUTLINED_FUNCTION_0();
  (*(void (**)(void))(v0 + 128))();
  return swift_release();
}

uint64_t sub_24F946B9C()
{
  return 2;
}

uint64_t sub_24F946BA4()
{
  return sub_24F946BC8();
}

uint64_t sub_24F946BC8()
{
  uint64_t v1 = sub_24F948BD0(v0);
  swift_release();
  return v1;
}

uint64_t sub_24F946BFC()
{
  return sub_24F946C20();
}

uint64_t sub_24F946C24()
{
  return sub_24F98E098();
}

uint64_t sub_24F946C8C()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24F946C98()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24F946CC4(uint64_t a1)
{
  return sub_24F946CDC(a1, MEMORY[0x263F8EEA0]);
}

uint64_t sub_24F946CDC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_3();
  uint64_t v5 = *(void *)(v2 + 32);
  *(void *)(v2 + 32) = a1;
  return a2(v5);
}

uint64_t sub_24F946D28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 128))();
  *a2 = result;
  return result;
}

uint64_t sub_24F946D74()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_24F946DCC(v0);
}

uint64_t sub_24F946DA0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24F946DCC(uint64_t a1)
{
  OUTLINED_FUNCTION_3();
  *(void *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F946E08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x263F8EE80];
  *(void *)(v2 + 32) = MEMORY[0x263F8EE78];
  *(void *)(v2 + 40) = v3;
  return OUTLINED_FUNCTION_11(a1, a2);
}

uint64_t sub_24F946E20(uint64_t a1)
{
  OUTLINED_FUNCTION_0();
  unint64_t v3 = (*(uint64_t (**)(void))(v2 + 104))();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24F947144(v3, a1);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24F946E9C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 56);
  uint64_t v30 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & v4;
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = a2 + 56;
  if ((v6 & v4) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v32 = v3;
  for (unint64_t i = v9 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    uint64_t v15 = result;
    uint64_t v16 = (uint64_t *)(*(void *)(result + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_24F98E6F8();
    swift_bridgeObjectRetain();
    sub_24F98E038();
    uint64_t v19 = sub_24F98E718();
    uint64_t v20 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v21 = v19 & ~v20;
    if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v22 = *(void *)(a2 + 48);
    uint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (!v24 && (sub_24F98E678() & 1) == 0)
    {
      uint64_t v25 = ~v20;
      for (unint64_t j = v21 + 1; ; unint64_t j = v27 + 1)
      {
        uint64_t v27 = j & v25;
        if (((*(void *)(v8 + (((j & v25) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v25)) & 1) == 0) {
          break;
        }
        uint64_t v28 = (void *)(v22 + 16 * v27);
        BOOL v29 = *v28 == v18 && v28[1] == v17;
        if (v29 || (sub_24F98E678() & 1) != 0) {
          goto LABEL_30;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t result = v15;
    int64_t v3 = v32;
    if (v7) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v11 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v11);
    int64_t v13 = v3 + 1;
    if (!v12)
    {
      int64_t v13 = v3 + 2;
      if (v3 + 2 >= v31) {
        return 1;
      }
      unint64_t v12 = *(void *)(v30 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v3 + 3;
        if (v3 + 3 >= v31) {
          return 1;
        }
        unint64_t v12 = *(void *)(v30 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v3 + 4;
          if (v3 + 4 >= v31) {
            return 1;
          }
          unint64_t v12 = *(void *)(v30 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v32 = v13;
  }
  uint64_t v14 = v3 + 5;
  if (v3 + 5 >= v31) {
    return 1;
  }
  unint64_t v12 = *(void *)(v30 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v3 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v31) {
      return 1;
    }
    unint64_t v12 = *(void *)(v30 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_24F947144(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_24F98E428())
  {
    uint64_t v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x253366C20](v5 - 4, a1);
      }
      else
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5);
        swift_retain();
      }
      uint64_t v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v6 + 112))();
      char v9 = sub_24F946E9C(v8, a2);
      swift_bridgeObjectRelease();
      if (v9) {
        goto LABEL_15;
      }
      swift_release();
      ++v5;
      if (v7 == v4)
      {
        uint64_t v6 = 0;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24F947288(uint64_t a1, Swift::OpaquePointer a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = (void *)a3[1];
  uint64_t v8 = (void *)a3[2];
  uint64_t v9 = v4[2];
  unint64_t v10 = (void *)v4[3];
  v59.name._unint64_t countAndFlagsBits = *a3;
  v59.name._object = v7;
  v59.parameters._rawValue = v8;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v65.name._unint64_t countAndFlagsBits = (uint64_t)&v59;
  uint64_t v51 = v9;
  v11._unint64_t countAndFlagsBits = v9;
  v11._object = v10;
  MethodDeclaration.init(_:_:_:)(&v62, v11, a2, v65);
  GameServicesProtocols::MethodDeclaration v59 = v62;
  type metadata accessor for MethodSchema();
  uint64_t v12 = swift_allocObject();
  sub_24F947B98(a1, &v59);
  OUTLINED_FUNCTION_8();
  uint64_t v13 = swift_retain();
  MEMORY[0x253366A00](v13);
  sub_24F9486A0(*(void *)((v4[4] & 0xFFFFFFFFFFFFFF8) + 0x10));
  sub_24F98E198();
  sub_24F98E148();
  swift_endAccess();
  unint64_t countAndFlagsBits = *(void *)(v12 + 64);
  if (countAndFlagsBits >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_24F98E428();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_3;
    }
LABEL_26:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v15 = *(void *)((countAndFlagsBits & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v15) {
    goto LABEL_26;
  }
LABEL_3:
  v57 = v4 + 5;
  v55 = *(uint64_t (**)(uint64_t))(*v4 + 128);
  unint64_t v56 = countAndFlagsBits & 0xC000000000000001;
  uint64_t v16 = 4;
  unint64_t v53 = countAndFlagsBits;
  v54 = v10;
  v49 = v4;
  uint64_t v52 = v15;
  while (1)
  {
    if (v56)
    {
      uint64_t v17 = MEMORY[0x253366C20](v16 - 4, countAndFlagsBits);
    }
    else
    {
      uint64_t v17 = *(void *)(countAndFlagsBits + 8 * v16);
      swift_retain();
    }
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v58 = v16 - 3;
    uint64_t v18 = swift_bridgeObjectRetain();
    uint64_t v19 = v55(v18);
    if (*(void *)(v19 + 16))
    {
      unint64_t v20 = sub_24F9480BC(v51, (uint64_t)v10);
      if (v21)
      {
        uint64_t v22 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v23 = *(void **)(v22 + 24);
        BOOL v24 = *(void **)(v22 + 32);
        uint64_t v26 = *(void **)(v22 + 56);
        uint64_t v25 = *(void *)(v22 + 64);
        char v27 = *(unsigned char *)(v22 + 72);
        Swift::String v28 = *(Swift::String *)(v22 + 40);
        v62.name._unint64_t countAndFlagsBits = *(void *)(v22 + 16);
        v62.name._object = v23;
        v62.parameters._rawValue = v24;
        v62.returnType.name = v28;
        v62.returnType.arguments._rawValue = v26;
        uint64_t v63 = v25;
        char v64 = v27;
        BOOL v29 = *(void **)(v17 + 24);
        uint64_t v30 = *(void **)(v17 + 32);
        uint64_t v31 = *(void *)(v17 + 64);
        v50 = *(void **)(v17 + 56);
        char v32 = *(unsigned char *)(v17 + 72);
        Swift::String v33 = *(Swift::String *)(v17 + 40);
        v59.name._unint64_t countAndFlagsBits = *(void *)(v17 + 16);
        v59.name._object = v29;
        v59.parameters._rawValue = v30;
        v59.returnType.name = v33;
        v59.returnType.arguments._rawValue = v50;
        uint64_t v60 = v31;
        char v61 = v32;
        sub_24F948710();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24F98DFF8();
        swift_bridgeObjectRelease();
        uint64_t v4 = v49;
        swift_bridgeObjectRelease();
        unint64_t v10 = v54;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v34 = swift_bridgeObjectRelease();
    unint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v17 + 96))(v34);
    uint64_t v36 = v35;
    OUTLINED_FUNCTION_8();
    swift_retain();
    swift_isUniquelyReferenced_nonNull_native();
    v59.name._unint64_t countAndFlagsBits = *v57;
    unint64_t countAndFlagsBits = v59.name._countAndFlagsBits;
    uint64_t *v57 = 0x8000000000000000;
    unint64_t v37 = sub_24F9480BC((uint64_t)v10, v36);
    if (__OFADD__(*(void *)(countAndFlagsBits + 16), (v38 & 1) == 0)) {
      goto LABEL_23;
    }
    unint64_t v39 = v37;
    char v40 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35320);
    if (sub_24F98E3E8()) {
      break;
    }
LABEL_15:
    unint64_t countAndFlagsBits = v59.name._countAndFlagsBits;
    if (v40)
    {
      uint64_t v43 = *(void *)(v59.name._countAndFlagsBits + 56);
      swift_release();
      *(void *)(v43 + 8 * v39) = v17;
    }
    else
    {
      *(void *)(v59.name._countAndFlagsBits + 8 * (v39 >> 6) + 64) |= 1 << v39;
      v44 = (void *)(*(void *)(countAndFlagsBits + 48) + 16 * v39);
      void *v44 = v10;
      v44[1] = v36;
      *(void *)(*(void *)(countAndFlagsBits + 56) + 8 * v39) = v17;
      uint64_t v45 = *(void *)(countAndFlagsBits + 16);
      BOOL v46 = __OFADD__(v45, 1);
      uint64_t v47 = v45 + 1;
      if (v46) {
        goto LABEL_24;
      }
      *(void *)(countAndFlagsBits + 16) = v47;
      swift_bridgeObjectRetain();
    }
    uint64_t *v57 = countAndFlagsBits;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    unint64_t v10 = v54;
LABEL_20:
    ++v16;
    unint64_t countAndFlagsBits = v53;
    if (v58 == v52) {
      goto LABEL_26;
    }
  }
  unint64_t v41 = sub_24F9480BC((uint64_t)v10, v36);
  if ((v40 & 1) == (v42 & 1))
  {
    unint64_t v39 = v41;
    goto LABEL_15;
  }
  uint64_t result = sub_24F98E6A8();
  __break(1u);
  return result;
}

uint64_t sub_24F9477BC()
{
  OUTLINED_FUNCTION_2();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_5();
  sub_24F947B98(v1, v2);
  return v0;
}

uint64_t sub_24F947800()
{
  OUTLINED_FUNCTION_0();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 128);
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = v1(v2);
  uint64_t v4 = OUTLINED_FUNCTION_9(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t OverloadedMethodSchema.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t OverloadedMethodSchema.__deallocating_deinit()
{
  OverloadedMethodSchema.deinit();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t MethodSchema.declaration.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v1[2];
  uint64_t v2 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v4 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v6 = v1[7];
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = v7;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t MethodSchema.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

char *sub_24F947948()
{
  unint64_t v1 = *(void *)(v0 + 64);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24F98E428();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24F947F9C(0, v2 & ~(v2 >> 63), 0);
  if (v2 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  uint64_t v5 = v13;
  do
  {
    if ((v1 & 0xC000000000000001) != 0) {
      MEMORY[0x253366C20](v4, v1);
    }
    else {
      swift_retain();
    }
    OUTLINED_FUNCTION_0();
    uint64_t v7 = (*(uint64_t (**)(void))(v6 + 96))();
    uint64_t v9 = v8;
    swift_release();
    unint64_t v11 = *(void *)(v13 + 16);
    unint64_t v10 = *(void *)(v13 + 24);
    if (v11 >= v10 >> 1) {
      sub_24F947F9C((char *)(v10 > 1), v11 + 1, 1);
    }
    ++v4;
    *(void *)(v13 + 16) = v11 + 1;
    unint64_t v12 = v13 + 16 * v11;
    *(void *)(v12 + 32) = v7;
    *(void *)(v12 + 40) = v9;
  }
  while (v2 != v4);
  swift_bridgeObjectRelease();
LABEL_14:
  return (char *)sub_24F947ADC(v5);
}

uint64_t sub_24F947ADC(uint64_t a1)
{
  uint64_t v2 = sub_24F98E2A8();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24F949058(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t MethodSchema.returnType.getter()
{
  return swift_retain();
}

void *sub_24F947B98(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  v3[2] = *a2;
  v3[3] = v5;
  v3[4] = v6;
  v3[5] = v7;
  v3[6] = v8;
  v3[7] = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_24F945DA0(v6, a1);
  swift_bridgeObjectRelease();
  v3[8] = v10;
  v15[0] = v7;
  v15[1] = v8;
  v15[2] = v9;
  OUTLINED_FUNCTION_0();
  unint64_t v12 = *(uint64_t (**)(void *))(v11 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = v12(v15);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3[9] = v13;
  return v3;
}

uint64_t sub_24F947CB8()
{
  OUTLINED_FUNCTION_2();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = OUTLINED_FUNCTION_5();
  sub_24F947E14(v1, v2);
  return v0;
}

uint64_t MethodSchema.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t MethodSchema.__deallocating_deinit()
{
  MethodSchema.deinit();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t ParameterSchema.declaration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 56);
  uint64_t v5 = *(void *)(v1 + 64);
  char v6 = *(unsigned char *)(v1 + 72);
  *(void *)a1 = *(void *)(v1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 40);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t ParameterSchema.type.getter()
{
  return swift_retain();
}

uint64_t sub_24F947E0C()
{
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t sub_24F947E14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  char v9 = *(unsigned char *)(a2 + 56);
  *(void *)(v2 + 16) = *(void *)a2;
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = v4;
  *(void *)(v2 + 40) = v5;
  *(void *)(v2 + 48) = v6;
  *(void *)(v2 + 56) = v7;
  *(void *)(v2 + 64) = v8;
  *(unsigned char *)(v2 + 72) = v9;
  v14[0] = v6;
  v14[1] = v7;
  v14[2] = v8;
  OUTLINED_FUNCTION_7();
  uint64_t v11 = *(uint64_t (**)(void *))(v10 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v12 = v11(v14);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)(v2 + 80) = v12;
  return v2;
}

uint64_t ParameterSchema.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t ParameterSchema.__deallocating_deinit()
{
  ParameterSchema.deinit();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

char *sub_24F947F9C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24F947FBC(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_24F947FBC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35350);
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
  uint64_t v13 = a4 + 32;
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

unint64_t sub_24F9480BC(uint64_t a1, uint64_t a2)
{
  sub_24F98E6F8();
  sub_24F98E038();
  uint64_t v4 = sub_24F98E718();
  return sub_24F948134(a1, a2, v4);
}

unint64_t sub_24F948134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24F98E678() & 1) == 0)
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
      while (!v14 && (sub_24F98E678() & 1) == 0);
    }
  }
  return v6;
}

uint64_t type metadata accessor for MethodSetSchema()
{
  return self;
}

uint64_t type metadata accessor for TypeInstance()
{
  return self;
}

uint64_t type metadata accessor for OverloadedMethodSchema()
{
  return self;
}

uint64_t sub_24F948284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  sub_24F948340(a1, a2, a3, isUniquelyReferenced_nonNull_native, a4);
  *uint64_t v4 = v11;
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for MethodSchema()
{
  return self;
}

uint64_t sub_24F948340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int64_t v7 = (void **)v5;
  uint64_t v11 = (void *)*v5;
  unint64_t v12 = sub_24F9480BC(a2, a3);
  if (__OFADD__(v11[2], (v13 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v12;
  char v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  if ((sub_24F98E3E8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_24F9480BC(a2, a3);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    uint64_t result = sub_24F98E6A8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v7;
  if (v15)
  {
    uint64_t v19 = v18[7];
    uint64_t result = swift_release();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    sub_24F948474(v14, a2, a3, a1, v18);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24F948474(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_24F9484BC(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_24F9484D8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24F98E428();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24F98E428();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x253366C30](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_24F949C78(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24F98E428();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24F98E148();
}

uint64_t sub_24F9486A0(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
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

unint64_t sub_24F948710()
{
  unint64_t result = qword_269A35328;
  if (!qword_269A35328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35328);
  }
  return result;
}

uint64_t sub_24F94875C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of MethodSetSchema.makeIterator()>>, 1);
}

uint64_t type metadata accessor for ServiceSchema()
{
  return self;
}

uint64_t method lookup function for ServiceSchema(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ServiceSchema);
}

uint64_t dispatch thunk of ServiceSchema.types.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ServiceSchema.root.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ServiceSchema.__allocating_init(declaration:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ServiceSchema.resolve(typeRef:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ServiceSchema.resolve(typeName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t method lookup function for TypeSchema(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TypeSchema);
}

uint64_t dispatch thunk of TypeSchema.methods.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of TypeSchema.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of TypeSchema.instantiate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of TypeSchema.instantiate(arguments:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t method lookup function for TypeInstance(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TypeInstance);
}

uint64_t dispatch thunk of TypeInstance.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of TypeInstance.methods.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t method lookup function for MethodSetSchema(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MethodSetSchema);
}

uint64_t dispatch thunk of MethodSetSchema.makeIterator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MethodSetSchema.subscript.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t method lookup function for OverloadedMethodSchema(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OverloadedMethodSchema);
}

uint64_t dispatch thunk of OverloadedMethodSchema.overloads.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of OverloadedMethodSchema.parameters.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of OverloadedMethodSchema.overload(parameterNames:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of OverloadedMethodSchema.parameter(named:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t method lookup function for MethodSchema(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MethodSchema);
}

uint64_t dispatch thunk of MethodSchema.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MethodSchema.parameterNames.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t type metadata accessor for ParameterSchema()
{
  return self;
}

uint64_t method lookup function for ParameterSchema(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ParameterSchema);
}

uint64_t dispatch thunk of ParameterSchema.name.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ParameterSchema.optional.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_24F948B4C()
{
  return sub_24F949E34(&qword_269A35330, &qword_269A35338);
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

uint64_t sub_24F948BD0(uint64_t a1)
{
  void (*v1)(unint64_t *__return_ptr, uint64_t);
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  uint64_t v1 = *(void (**)(unint64_t *__return_ptr, uint64_t))(*(void *)a1 + 128);
  unint64_t v2 = swift_retain();
  v1(&v28, v2);
  uint64_t result = swift_release();
  uint64_t v5 = v28;
  unint64_t v4 = v29;
  if (!(v28 >> 62))
  {
    uint64_t v6 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v29 == v6) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24F98E428();
  swift_bridgeObjectRelease();
  if (v4 != v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24F98E428();
    uint64_t result = swift_bridgeObjectRelease();
LABEL_6:
    if (v4 >= v6) {
      goto LABEL_37;
    }
    BOOL v7 = 0;
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    uint64_t v10 = v5 & 0xC000000000000001;
    uint64_t v11 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
    char v27 = v6;
    while (!v10)
    {
      if (v4 < 0) {
        goto LABEL_34;
      }
      if ((unint64_t)v4 >= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_35;
      }
      uint64_t v12 = *(void *)(v5 + 8 * v4 + 32);
      uint64_t result = swift_retain();
      if (!v7) {
        goto LABEL_14;
      }
LABEL_27:
      uint64_t v23 = __OFSUB__(v7--, 1);
      if (v23)
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      }
      ++v4;
      *v11++ = v12;
      if (v6 == v4) {
        goto LABEL_29;
      }
    }
    uint64_t result = MEMORY[0x253366C20](v4, v5);
    uint64_t v12 = result;
    if (v7) {
      goto LABEL_27;
    }
LABEL_14:
    BOOL v13 = v8[3];
    if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_36;
    }
    uint64_t v14 = v10;
    char v15 = v13 & 0xFFFFFFFFFFFFFFFELL;
    if (v15 <= 1) {
      unint64_t v16 = 1;
    }
    else {
      unint64_t v16 = v15;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35340);
    char v17 = (void *)swift_allocObject();
    uint64_t v18 = (uint64_t)(_swift_stdlib_malloc_size(v17) - 32) / 8;
    v17[2] = v16;
    v17[3] = (2 * v18) | 1;
    uint64_t v19 = (unint64_t)(v17 + 4);
    unint64_t v20 = v8[3];
    char v21 = v20 >> 1;
    if (v8[2])
    {
      if (v17 != v8 || v19 >= (unint64_t)&v8[v21 + 4]) {
        memmove(v17 + 4, v8 + 4, 8 * v21);
      }
      v8[2] = 0;
    }
    uint64_t v11 = (uint64_t *)(v19 + 8 * v21);
    BOOL v7 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - (v20 >> 1);
    uint64_t result = swift_release();
    uint64_t v8 = v17;
    uint64_t v10 = v14;
    uint64_t v6 = v27;
    goto LABEL_27;
  }
LABEL_3:
  BOOL v7 = 0;
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
LABEL_29:
  uint64_t result = swift_bridgeObjectRelease();
  BOOL v24 = v8[3];
  if (v24 >= 2)
  {
    uint64_t v25 = v24 >> 1;
    uint64_t v23 = __OFSUB__(v25, v7);
    uint64_t v26 = v25 - v7;
    if (v23) {
      goto LABEL_38;
    }
    v8[2] = v26;
  }
  return (uint64_t)v8;
}

uint64_t sub_24F948E34(uint64_t *a1, uint64_t *a2, int64_t a3)
{
  (*(void (**)(unint64_t *__return_ptr))(*(void *)v3 + 128))(&v18);
  swift_release();
  if (!a2)
  {
    a3 = 0;
LABEL_9:
    uint64_t v3 = v18;
    unint64_t v4 = v19;
LABEL_10:
    *a1 = v3;
    a1[1] = v4;
    return a3;
  }
  if (!a3) {
    goto LABEL_9;
  }
  if (a3 < 0) {
    goto LABEL_35;
  }
  uint64_t v3 = v18;
  unint64_t v4 = v19;
  unint64_t v5 = v18 >> 62;
  if (v18 >> 62) {
    goto LABEL_36;
  }
  uint64_t v9 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v4 == v9)
    {
      a3 = 0;
      goto LABEL_10;
    }
    sub_24F949C18(v4, (v3 & 0xC000000000000001) == 0, v3);
    uint64_t result = (v3 & 0xC000000000000001) != 0 ? MEMORY[0x253366C20](v4, v3) : swift_retain();
    unint64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    *a2 = result;
    if (a3 == 1)
    {
      ++v4;
      goto LABEL_10;
    }
    if (v5)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_24F98E428();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v13 = 0;
    unint64_t v16 = v12 - v4;
    unint64_t v17 = v12;
    unint64_t v5 = v11 - v12;
    unint64_t v4 = 0x7FFFFFFFFFFFFFFELL - v4;
    ++a2;
    while (v13 + 1 < a3)
    {
      if (!(v5 + v13))
      {
        a3 = v16;
        unint64_t v4 = v17;
        goto LABEL_10;
      }
      unint64_t v14 = v11 + v13;
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v15 = MEMORY[0x253366C20](v14, v3);
      }
      else
      {
        if ((v14 & 0x8000000000000000) != 0) {
          goto LABEL_33;
        }
        if (v14 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_34;
        }
        uint64_t v15 = swift_retain();
      }
      if (v4 == v13) {
        goto LABEL_32;
      }
      a2[v13++] = v15;
      if (a3 - 1 == v13)
      {
        unint64_t v4 = v11 + v13;
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24F98E428();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_24F949058(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24F98E6F8();
  swift_bridgeObjectRetain();
  sub_24F98E038();
  uint64_t v8 = sub_24F98E718();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24F98E678() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24F98E678() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24F9494E4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24F949208()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35348);
  uint64_t v3 = sub_24F98E318();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      sub_24F98E6F8();
      sub_24F98E038();
      uint64_t result = sub_24F98E718();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      Swift::String v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *Swift::String v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                sub_24F9484BC(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24F9494E4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24F949208();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24F949680();
      goto LABEL_22;
    }
    sub_24F949834();
  }
  uint64_t v11 = *v4;
  sub_24F98E6F8();
  sub_24F98E038();
  uint64_t result = sub_24F98E718();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24F98E678(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24F98E698();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24F98E678();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
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

void *sub_24F949680()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35348);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24F98E308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24F949834()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35348);
  uint64_t v3 = sub_24F98E318();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_24F98E6F8();
    swift_bridgeObjectRetain();
    sub_24F98E038();
    uint64_t result = sub_24F98E718();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    Swift::String v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *Swift::String v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void (*sub_24F949AE0(uint64_t **a1, unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_24F949B90(v6, a2, a3);
  return sub_24F949B48;
}

void sub_24F949B48(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_24F949B90(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_24F949C18(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    uint64_t v7 = MEMORY[0x253366C20](a2, a3);
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *a1 = v7;
  return sub_24F949C10;
}

uint64_t sub_24F949C10()
{
  return swift_release();
}

unint64_t sub_24F949C18(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24F949C40@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_24F949C78(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24F98E428();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_24F98E428();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_24F949E34(&qword_269A35360, &qword_269A35358);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269A35358);
            uint64_t v10 = sub_24F949AE0(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for MethodSchema();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24F949E34(unint64_t *a1, uint64_t *a2)
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

void sub_24F949E78()
{
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_beginAccess();
}

void *OUTLINED_FUNCTION_4()
{
  return sub_24F94619C(0x64696C61766E49, 0xE700000000000000);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return sub_24F945FDC(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t ServiceDeclaration.rootTypeName.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ServiceDeclaration.rootTypeName.setter()
{
  uint64_t result = OUTLINED_FUNCTION_6_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*ServiceDeclaration.rootTypeName.modify())()
{
  return nullsub_1;
}

uint64_t ServiceDeclaration.protocols.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*ServiceDeclaration.protocols.modify())()
{
  return nullsub_1;
}

GameServicesProtocols::ServiceDeclaration __swiftcall ServiceDeclaration.init(rootTypeName:protocols:)(Swift::String rootTypeName, Swift::OpaquePointer protocols)
{
  *(Swift::String *)uint64_t v2 = rootTypeName;
  *(Swift::OpaquePointer *)(v2 + 16) = protocols;
  result.rootTypeName = rootTypeName;
  result.protocols = protocols;
  return result;
}

uint64_t static ServiceDeclaration.== infix(_:_:)(uint64_t a1)
{
  return sub_24F94AFD0(a1);
}

uint64_t sub_24F94A088(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = (void *)(a2 + 40);
    for (unint64_t i = (void *)(a1 + 40); ; i += 6)
    {
      uint64_t v5 = i[1];
      uint64_t v7 = i[3];
      uint64_t v6 = i[4];
      uint64_t v8 = v3[3];
      uint64_t v13 = v3[2];
      uint64_t v14 = i[2];
      uint64_t v15 = v3[4];
      uint64_t v16 = v3[1];
      BOOL v9 = *(i - 1) == *(v3 - 1) && *i == *v3;
      if (!v9 && (sub_24F98E678() & 1) == 0) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((sub_24F94A2B0(v5, v16) & 1) == 0
        || (v14 == v13 ? (BOOL v10 = v7 == v8) : (BOOL v10 = 0), !v10 && (sub_24F98E678() & 1) == 0))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v11 = sub_24F94A4E4(v6, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if ((v11 & 1) == 0) {
        return 0;
      }
      v3 += 6;
      if (!--v2) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24F94A2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = 0;
    uint64_t v18 = a1;
    uint64_t v19 = a2;
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + v3 + 48);
      uint64_t v5 = *(void *)(a1 + v3 + 56);
      uint64_t v6 = *(void *)(a1 + v3 + 64);
      uint64_t v24 = *(void *)(a1 + v3 + 80);
      int v22 = *(unsigned __int8 *)(a1 + v3 + 88);
      uint64_t v7 = *(void *)(a2 + v3 + 48);
      uint64_t v8 = *(void *)(a2 + v3 + 56);
      uint64_t v9 = *(void *)(a2 + v3 + 64);
      uint64_t v25 = *(void *)(a2 + v3 + 72);
      uint64_t v26 = *(void *)(a1 + v3 + 72);
      uint64_t v23 = *(void *)(a2 + v3 + 80);
      BOOL v10 = *(void *)(a1 + v3 + 32) == *(void *)(a2 + v3 + 32)
         && *(void *)(a1 + v3 + 40) == *(void *)(a2 + v3 + 40);
      int v21 = *(unsigned __int8 *)(a2 + v3 + 88);
      if (!v10)
      {
        uint64_t v11 = *(void *)(a1 + v3 + 64);
        char v12 = sub_24F98E678();
        uint64_t v6 = v11;
        if ((v12 & 1) == 0) {
          break;
        }
      }
      if (v5)
      {
        if (!v8) {
          return 0;
        }
        if (v4 != v7 || v5 != v8)
        {
          uint64_t v14 = v6;
          char v15 = sub_24F98E678();
          uint64_t v6 = v14;
          if ((v15 & 1) == 0) {
            return 0;
          }
        }
      }
      else if (v8)
      {
        return 0;
      }
      BOOL v16 = v6 == v9 && v26 == v25;
      if (!v16 && (sub_24F98E678() & 1) == 0) {
        return 0;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v20 = sub_24F94A4E4(v24, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t result = 0;
      if (v20 & 1) == 0 || ((v22 ^ v21)) {
        return result;
      }
      v3 += 64;
      --v2;
      a1 = v18;
      a2 = v19;
      if (!v2) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24F94A4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = (uint64_t *)(a2 + 48);
    for (unint64_t i = (uint64_t *)(a1 + 48); ; i += 3)
    {
      uint64_t v5 = *i;
      uint64_t v6 = *v3;
      BOOL v7 = *(i - 2) == *(v3 - 2) && *(i - 1) == *(v3 - 1);
      if (!v7 && (sub_24F98E678() & 1) == 0) {
        break;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v8 = sub_24F94A4E4(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        break;
      }
      v3 += 3;
      if (!--v2) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24F94A5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 32;
    uint64_t v5 = a2 + 32;
    uint64_t v51 = a1 + 32;
    uint64_t v52 = *(void *)(a1 + 16);
    uint64_t v50 = a2 + 32;
    while (1)
    {
      uint64_t v6 = (void *)(v4 + 40 * v3);
      uint64_t v7 = v6[2];
      uint64_t v8 = v6[4];
      uint64_t v9 = (void *)(v5 + 40 * v3);
      uint64_t v10 = v9[2];
      uint64_t v55 = v9[3];
      uint64_t v56 = v6[3];
      uint64_t v11 = v9[4];
      BOOL v12 = *v6 == *v9 && v6[1] == v9[1];
      if (!v12 && (sub_24F98E678() & 1) == 0) {
        return 0;
      }
      uint64_t v13 = *(void *)(v7 + 16);
      if (v13 != *(void *)(v10 + 16)) {
        return 0;
      }
      uint64_t v62 = v3;
      uint64_t v61 = v11;
      if (v13)
      {
        uint64_t v53 = *(void *)(v7 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v7 != v10)
        {
          uint64_t v14 = v7 + 32;
          uint64_t v15 = v10 + 32;
          swift_bridgeObjectRetain();
          uint64_t v16 = 0;
          uint64_t v54 = v8;
          uint64_t v49 = v10 + 32;
          while (1)
          {
            uint64_t v57 = v16;
            uint64_t v17 = 3 * v16;
            uint64_t v18 = (void *)(v14 + 48 * v16);
            uint64_t v72 = v18[2];
            uint64_t v19 = v18[4];
            uint64_t v64 = v18[5];
            char v20 = (void *)(v15 + 16 * v17);
            uint64_t v21 = v20[2];
            uint64_t v58 = v20[3];
            uint64_t v59 = v18[3];
            uint64_t v22 = v20[4];
            uint64_t v65 = v20[5];
            BOOL v23 = *v18 == *v20 && v18[1] == v20[1];
            if (!v23 && (sub_24F98E678() & 1) == 0) {
              break;
            }
            uint64_t v63 = v19;
            uint64_t v24 = *(void *)(v72 + 16);
            if (v24 != *(void *)(v21 + 16)) {
              break;
            }
            uint64_t v60 = v22;
            if (v24)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if (v72 != v21)
              {
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v25 = 0;
                uint64_t v66 = v21;
                while (1)
                {
                  uint64_t v67 = v24;
                  uint64_t v27 = *(void *)(v72 + v25 + 48);
                  uint64_t v26 = *(void *)(v72 + v25 + 56);
                  uint64_t v28 = *(void *)(v72 + v25 + 64);
                  uint64_t v73 = *(void *)(v72 + v25 + 72);
                  int v69 = *(unsigned __int8 *)(v72 + v25 + 88);
                  uint64_t v29 = v21 + v25;
                  uint64_t v30 = *(void *)(v21 + v25 + 32);
                  uint64_t v31 = *(void *)(v21 + v25 + 40);
                  uint64_t v33 = *(void *)(v21 + v25 + 48);
                  uint64_t v32 = *(void *)(v29 + 56);
                  uint64_t v34 = *(void *)(v29 + 64);
                  uint64_t v35 = *(void *)(v29 + 72);
                  uint64_t v70 = *(void *)(v29 + 80);
                  uint64_t v71 = *(void *)(v72 + v25 + 80);
                  BOOL v36 = *(void *)(v72 + v25 + 32) == v30 && *(void *)(v72 + v25 + 40) == v31;
                  int v68 = *(unsigned __int8 *)(v29 + 88);
                  if (!v36)
                  {
                    uint64_t v37 = *(void *)(v72 + v25 + 64);
                    char v38 = sub_24F98E678();
                    uint64_t v28 = v37;
                    if ((v38 & 1) == 0) {
                      break;
                    }
                  }
                  if (v26)
                  {
                    if (!v32) {
                      break;
                    }
                    if (v27 != v33 || v26 != v32)
                    {
                      uint64_t v40 = v28;
                      char v41 = sub_24F98E678();
                      uint64_t v28 = v40;
                      if ((v41 & 1) == 0) {
                        break;
                      }
                    }
                  }
                  else if (v32)
                  {
                    break;
                  }
                  BOOL v42 = v28 == v34 && v73 == v35;
                  if (!v42 && (sub_24F98E678() & 1) == 0) {
                    break;
                  }
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain_n();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  char v43 = sub_24F94A4E4(v71, v70);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease_n();
                  if (v43 & 1) == 0 || ((v69 ^ v68)) {
                    break;
                  }
                  v25 += 64;
                  uint64_t v21 = v66;
                  uint64_t v24 = v67 - 1;
                  if (v67 == 1) {
                    goto LABEL_48;
                  }
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                break;
              }
            }
            else
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
LABEL_48:
            BOOL v44 = v59 == v58 && v63 == v60;
            if (!v44 && (sub_24F98E678() & 1) == 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_75;
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            char v45 = sub_24F94A4E4(v64, v65);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            if ((v45 & 1) == 0) {
              break;
            }
            uint64_t v16 = v57 + 1;
            uint64_t v2 = v52;
            uint64_t v3 = v62;
            uint64_t v4 = v51;
            uint64_t v8 = v54;
            uint64_t v15 = v49;
            uint64_t v14 = v7 + 32;
            if (v57 + 1 == v53) {
              goto LABEL_58;
            }
          }
LABEL_74:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_75:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRetain();
LABEL_58:
      if (v8)
      {
        if (!v61) {
          goto LABEL_74;
        }
        if (v56 != v55 || v8 != v61)
        {
          char v47 = sub_24F98E678();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v5 = v50;
          if ((v47 & 1) == 0) {
            return 0;
          }
          goto LABEL_70;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (v61) {
          goto LABEL_74;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v50;
LABEL_70:
      ++v3;
      uint64_t result = 1;
      if (v3 == v2) {
        return result;
      }
    }
  }
  return 1;
}

uint64_t (*TypeRef.name.modify())()
{
  return nullsub_1;
}

uint64_t (*TypeRef.arguments.modify())()
{
  return nullsub_1;
}

uint64_t static TypeRef.array(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F990910;
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v3;
  OUTLINED_FUNCTION_12(v4, 0x7961727241);
  return swift_bridgeObjectRetain();
}

void static TypeRef.string.getter(void *a1@<X8>)
{
  *a1 = 0x676E69727453;
  a1[1] = 0xE600000000000000;
  a1[2] = MEMORY[0x263F8EE78];
}

uint64_t static TypeRef.optional(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F990910;
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v3;
  OUTLINED_FUNCTION_12(v4, 0x6C616E6F6974704FLL);
  return swift_bridgeObjectRetain();
}

uint64_t static TypeRef.dictionary(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v7 = a2[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_24F990920;
  *(void *)(v8 + 32) = v3;
  *(void *)(v8 + 40) = v2;
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = v6;
  *(void *)(v8 + 64) = v5;
  *(void *)(v8 + 72) = v7;
  OUTLINED_FUNCTION_12(v8, 0x616E6F6974636944);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t static TypeRef.== infix(_:_:)(uint64_t a1)
{
  return sub_24F94AFD0(a1);
}

uint64_t sub_24F94AFD0(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0(a1);
  BOOL v4 = v1 == *v2 && *(void *)(v3 + 8) == v2[1];
  if (!v4 && (sub_24F98E678() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = OUTLINED_FUNCTION_8_0();
  return v6(v5);
}

uint64_t ProtocolDeclaration.name.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ProtocolDeclaration.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_6_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*ProtocolDeclaration.name.modify())()
{
  return nullsub_1;
}

uint64_t ProtocolDeclaration.methods.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*ProtocolDeclaration.methods.modify())()
{
  return nullsub_1;
}

void sub_24F94B118()
{
}

uint64_t ProtocolDeclaration.machServiceName.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ProtocolDeclaration.machServiceName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*ProtocolDeclaration.machServiceName.modify())()
{
  return nullsub_1;
}

void __swiftcall ProtocolDeclaration.init(_:methods:)(GameServicesProtocols::ProtocolDeclaration *__return_ptr retstr, Swift::String _, Swift::OpaquePointer methods)
{
  retstr->name = _;
  retstr->machServiceName.value._unint64_t countAndFlagsBits = 0;
  retstr->machServiceName.value._object = 0;
  retstr->methods = methods;
}

uint64_t static ProtocolDeclaration.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0(a1);
  uint64_t v4 = v3[2];
  uint64_t v6 = v3[3];
  uint64_t v5 = v3[4];
  uint64_t v8 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  BOOL v10 = v1 == *v2 && v3[1] == v2[1];
  if (v10 || (sub_24F98E678(), uint64_t result = OUTLINED_FUNCTION_13(), (v12 & 1) != 0))
  {
    if (sub_24F94A088(v4, v8))
    {
      if (v5)
      {
        if (v9)
        {
          BOOL v13 = v6 == v7 && v5 == v9;
          if (v13 || (sub_24F98E678() & 1) != 0) {
            return 1;
          }
        }
      }
      else if (!v9)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t MethodDeclaration.name.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t MethodDeclaration.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_6_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*MethodDeclaration.name.modify())()
{
  return nullsub_1;
}

uint64_t MethodDeclaration.parameters.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*MethodDeclaration.parameters.modify())()
{
  return nullsub_1;
}

uint64_t MethodDeclaration.returnType.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[4];
  uint64_t v3 = v1[5];
  *a1 = v1[3];
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 MethodDeclaration.returnType.setter(uint64_t a1)
{
  unint64_t v3 = *(void *)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[1].n128_u64[1] = v3;
  __n128 result = *(__n128 *)(a1 + 8);
  v1[2] = result;
  return result;
}

uint64_t (*MethodDeclaration.returnType.modify())()
{
  return nullsub_1;
}

void __swiftcall MethodDeclaration.init(_:_:_:)(GameServicesProtocols::MethodDeclaration *__return_ptr retstr, Swift::String a2, Swift::OpaquePointer a3, GameServicesProtocols::TypeRef a4)
{
  uint64_t v4 = *(void *)a4.name._countAndFlagsBits;
  retstr->name = a2;
  retstr->parameters = a3;
  retstr->returnType.name._unint64_t countAndFlagsBits = v4;
  *(_OWORD *)&retstr->returnType.name._object = *(_OWORD *)(a4.name._countAndFlagsBits + 8);
}

uint64_t static MethodDeclaration.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0(a1);
  uint64_t v4 = v3[2];
  uint64_t v6 = v3[3];
  uint64_t v5 = v3[4];
  uint64_t v7 = v3[5];
  uint64_t v9 = v2[2];
  uint64_t v8 = v2[3];
  uint64_t v10 = v2[4];
  uint64_t v11 = v2[5];
  BOOL v12 = v1 == *v2 && v3[1] == v2[1];
  if (v12 || (sub_24F98E678(), uint64_t result = OUTLINED_FUNCTION_13(), (v14 & 1) != 0))
  {
    if ((sub_24F94A2B0(v4, v9) & 1) == 0) {
      return 0;
    }
    BOOL v15 = v6 == v8 && v5 == v10;
    if (!v15 && (sub_24F98E678() & 1) == 0) {
      return 0;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v16 = sub_24F94A4E4(v7, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (v16 & 1) != 0;
  }
  return result;
}

uint64_t ParameterDeclaration.name.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ParameterDeclaration.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_6_0();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*ParameterDeclaration.name.modify())()
{
  return nullsub_1;
}

uint64_t ParameterDeclaration.secondName.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ParameterDeclaration.secondName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ParameterDeclaration.secondName.modify())()
{
  return nullsub_1;
}

uint64_t ParameterDeclaration.type.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[5];
  uint64_t v3 = v1[6];
  *a1 = v1[4];
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 ParameterDeclaration.type.setter(uint64_t *a1)
{
  uint64_t v3 = *a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v3;
  __n128 result = *(__n128 *)(a1 + 1);
  *(__n128 *)(v1 + 40) = result;
  return result;
}

uint64_t (*ParameterDeclaration.type.modify())()
{
  return nullsub_1;
}

uint64_t ParameterDeclaration.optional.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t ParameterDeclaration.optional.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 56) = result;
  return result;
}

uint64_t (*ParameterDeclaration.optional.modify())()
{
  return nullsub_1;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return 0;
}

void __swiftcall ParameterDeclaration.init(_:secondName:_:optional:)(GameServicesProtocols::ParameterDeclaration *__return_ptr retstr, Swift::String _, Swift::String_optional secondName, GameServicesProtocols::TypeRef a4, Swift::Bool optional)
{
  uint64_t v5 = *(void *)a4.name._countAndFlagsBits;
  retstr->name = _;
  retstr->secondName = secondName;
  retstr->type.name._unint64_t countAndFlagsBits = v5;
  *(_OWORD *)&retstr->type.name._object = *(_OWORD *)(a4.name._countAndFlagsBits + 8);
  retstr->optional = (Swift::Bool)a4.name._object;
}

uint64_t static ParameterDeclaration.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0(a1);
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v3 + 24);
  uint64_t v6 = *(void *)(v3 + 32);
  uint64_t v8 = *(void *)(v3 + 40);
  uint64_t v9 = *(void *)(v3 + 48);
  int v10 = *(unsigned __int8 *)(v3 + 56);
  uint64_t v12 = *(void *)(v2 + 16);
  uint64_t v11 = *(void *)(v2 + 24);
  uint64_t v14 = *(void *)(v2 + 32);
  uint64_t v13 = *(void *)(v2 + 40);
  uint64_t v15 = *(void *)(v2 + 48);
  BOOL v16 = v1 == *(void *)v2 && v4 == *(void *)(v2 + 8);
  int v24 = *(unsigned __int8 *)(v2 + 56);
  int v25 = v10;
  if (!v16)
  {
    sub_24F98E678();
    uint64_t result = OUTLINED_FUNCTION_13();
    if ((v18 & 1) == 0) {
      return result;
    }
  }
  if (!v7)
  {
    if (!v11)
    {
LABEL_16:
      BOOL v21 = v6 == v14 && v8 == v13;
      if (v21 || (sub_24F98E678(), uint64_t result = OUTLINED_FUNCTION_13(), (v22 & 1) != 0))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v23 = sub_24F94A4E4(v9, v15);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v23) {
          return v25 ^ v24 ^ 1u;
        }
        else {
          return 0;
        }
      }
      return result;
    }
    return 0;
  }
  if (!v11) {
    return 0;
  }
  if (v5 == v12 && v7 == v11) {
    goto LABEL_16;
  }
  sub_24F98E678();
  uint64_t result = OUTLINED_FUNCTION_13();
  if (v20) {
    goto LABEL_16;
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for ServiceDeclaration()
{
}

uint64_t _s21GameServicesProtocols7TypeRefVwxx_0()
{
  OUTLINED_FUNCTION_14();
  return swift_bridgeObjectRelease();
}

void *_s21GameServicesProtocols7TypeRefVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s21GameServicesProtocols7TypeRefVwca_0(void *a1, void *a2)
{
  OUTLINED_FUNCTION_0_0(a1, a2);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s21GameServicesProtocols7TypeRefVwta_0(void *a1, void *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  return v2;
}

uint64_t _s21GameServicesProtocols7TypeRefVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
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
  return OUTLINED_FUNCTION_11_0(v2);
}

uint64_t sub_24F94B9AC(uint64_t result, int a2, int a3)
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
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
  }
  return result;
}

void type metadata accessor for TypeRef()
{
}

uint64_t destroy for ProtocolDeclaration()
{
  OUTLINED_FUNCTION_14();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ProtocolDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_9_0(a1, a2);
  *(void *)(v2 + 32) = *(void *)(v3 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v2;
}

void *assignWithCopy for ProtocolDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_0_0(a1, a2);
  swift_bridgeObjectRelease();
  v3[2] = v2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[3] = v2[3];
  v3[4] = v2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
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

uint64_t assignWithTake for ProtocolDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  uint64_t v4 = *(void *)(v2 + 32);
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  *(void *)(v3 + 32) = v4;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t getEnumTagSinglePayload for ProtocolDeclaration(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
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
  return OUTLINED_FUNCTION_11_0(v2);
}

uint64_t storeEnumTagSinglePayload for ProtocolDeclaration(uint64_t result, int a2, int a3)
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
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
  }
  return result;
}

void type metadata accessor for ProtocolDeclaration()
{
}

uint64_t initializeBufferWithCopyOfBuffer for MethodDeclaration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MethodDeclaration()
{
  OUTLINED_FUNCTION_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MethodDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_9_0(a1, a2);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v2 + 32) = *(void *)(v3 + 32);
  *(void *)(v2 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v2;
}

void *assignWithCopy for MethodDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_0_0(a1, a2);
  swift_bridgeObjectRelease();
  v3[2] = v2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[3] = v2[3];
  v3[4] = v2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[5] = v2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MethodDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v2 + 32);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t getEnumTagSinglePayload for MethodDeclaration(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48))
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
  return OUTLINED_FUNCTION_11_0(v2);
}

uint64_t storeEnumTagSinglePayload for MethodDeclaration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
  }
  return result;
}

void type metadata accessor for MethodDeclaration()
{
}

uint64_t destroy for ParameterDeclaration()
{
  OUTLINED_FUNCTION_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ParameterDeclaration(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParameterDeclaration(void *a1, void *a2)
{
  OUTLINED_FUNCTION_0_0(a1, a2);
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = *(void *)(v2 + 16);
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 32) = *(void *)(v2 + 32);
  *(void *)(v3 + 40) = *(void *)(v2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 48) = *(void *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v3 + 56) = *(unsigned char *)(v2 + 56);
  return v3;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ParameterDeclaration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterDeclaration(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57))
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
  return OUTLINED_FUNCTION_11_0(v2);
}

uint64_t storeEnumTagSinglePayload for ParameterDeclaration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_4_0(result, a2);
    }
  }
  return result;
}

void type metadata accessor for ParameterDeclaration()
{
}

uint64_t OUTLINED_FUNCTION_0_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0x656C707554;
  a2[1] = 0xE500000000000000;
  a2[2] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_0(void *a1, void *a2)
{
  *a1 = *a2;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0(void *a1, void *a2)
{
  uint64_t result = a2[1];
  *a1 = *a2;
  a1[1] = result;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  *(_OWORD *)(v1 + 8) = *(_OWORD *)(v0 + 8);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *long long v3 = a2;
  v3[1] = v2;
  v3[2] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain();
}

uint64_t FriendActivity.player.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

uint64_t FriendActivity.context.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FriendActivity.image.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 40), a1);
}

uint64_t FriendActivity.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FriendActivity() + 28);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for FriendActivity()
{
  uint64_t result = qword_269A36390;
  if (!qword_269A36390) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FriendActivity.init(player:context:image:date:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v7 = a1[1];
  uint64_t v8 = *a4;
  uint64_t v9 = a4[1];
  *a6 = *a1;
  a6[1] = v7;
  a6[2] = a2;
  a6[3] = a3;
  a6[4] = v8;
  a6[5] = v9;
  int v10 = (char *)a6 + *(int *)(type metadata accessor for FriendActivity() + 28);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 32);
  return v13(v10, a5, v11);
}

BOOL sub_24F94C33C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24F94C34C()
{
  return sub_24F98E708();
}

uint64_t sub_24F94C374(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726579616C70 && a2 == 0xE600000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6567616D69 && a2 == 0xE500000000000000;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 1702125924 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = OUTLINED_FUNCTION_5_1();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_24F94C4D4()
{
  return sub_24F98E718();
}

uint64_t sub_24F94C51C(char a1)
{
  uint64_t result = 0x726579616C70;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x747865746E6F63;
      break;
    case 2:
      uint64_t result = 0x6567616D69;
      break;
    case 3:
      uint64_t result = 1702125924;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_24F94C5A0(char *a1, char *a2)
{
  return sub_24F94C33C(*a1, *a2);
}

uint64_t sub_24F94C5AC()
{
  return sub_24F94C4D4();
}

uint64_t sub_24F94C5B4()
{
  return sub_24F94C34C();
}

uint64_t sub_24F94C5BC()
{
  return sub_24F98E718();
}

uint64_t sub_24F94C600()
{
  return sub_24F94C51C(*v0);
}

uint64_t sub_24F94C608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F94C374(a1, a2);
  *a3 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return 0;
}

void sub_24F94C63C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24F94C648(uint64_t a1)
{
  unint64_t v2 = sub_24F94C920();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F94C684(uint64_t a1)
{
  unint64_t v2 = sub_24F94C920();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FriendActivity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35380);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F94C920();
  sub_24F98E738();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A35390, &qword_269A35388);
  OUTLINED_FUNCTION_4_1();
  if (!v1)
  {
    sub_24F98E5D8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
    sub_24F949E34(&qword_269A353A0, &qword_269A35398);
    OUTLINED_FUNCTION_4_1();
    type metadata accessor for FriendActivity();
    sub_24F98DFB8();
    sub_24F94CD40(&qword_269A353A8);
    sub_24F98E628();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v8, v3);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24F94C920()
{
  unint64_t result = qword_269A36280[0];
  if (!qword_269A36280[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A36280);
  }
  return result;
}

uint64_t FriendActivity.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A353B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = type metadata accessor for FriendActivity();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_3_1();
  uint64_t v11 = (char *)(v10 - v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F94C920();
  sub_24F98E728();
  if (v18) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A353B8, &qword_269A35388);
  OUTLINED_FUNCTION_8_1();
  sub_24F98E538();
  *(void *)uint64_t v11 = v19;
  *((void *)v11 + 1) = v20;
  LOBYTE(v19) = 1;
  *((void *)v11 + 2) = sub_24F98E4E8();
  *((void *)v11 + 3) = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
  sub_24F949E34(&qword_269A353C0, &qword_269A35398);
  OUTLINED_FUNCTION_8_1();
  sub_24F98E538();
  *((void *)v11 + 4) = v19;
  *((void *)v11 + 5) = v20;
  sub_24F94CD40(&qword_269A353C8);
  sub_24F98E538();
  uint64_t v13 = OUTLINED_FUNCTION_2_1();
  v14(v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v11[*(int *)(v8 + 28)], v7, v3);
  sub_24F94CD84((uint64_t)v11, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24F94CDE8((uint64_t)v11);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24F94CD40(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24F98DFB8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F94CD84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FriendActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F94CDE8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FriendActivity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F94CE44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FriendActivity.init(from:)(a1, a2);
}

uint64_t sub_24F94CE5C(void *a1)
{
  return FriendActivity.encode(to:)(a1);
}

uint64_t dispatch thunk of ActivityServiceProtocol.listFriendActivities(player:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24F94CF78;
  return v9(a1, a2, a3);
}

uint64_t sub_24F94CF78(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for FriendActivity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = OUTLINED_FUNCTION_7_1();
    v9(v10);
  }
  return v3;
}

uint64_t destroy for FriendActivity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(v4, v5);
}

void *initializeWithCopy for FriendActivity(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = *(void (**)(uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = OUTLINED_FUNCTION_7_1();
  v7(v8);
  return a1;
}

void *assignWithCopy for FriendActivity(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(char *, char *))(v9 + 24))(v7, v8);
  return a1;
}

_OWORD *initializeWithTake for FriendActivity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(char *, char *))(v8 + 32))(v6, v7);
  return a1;
}

void *assignWithTake for FriendActivity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(char *, char *))(v12 + 40))(v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for FriendActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F94D49C);
}

uint64_t sub_24F94D49C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24F98DFB8();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for FriendActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F94D560);
}

uint64_t sub_24F94D560(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24F98DFB8();
    uint64_t v8 = v5 + *(int *)(a4 + 28);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24F94D608()
{
  uint64_t result = sub_24F98DFB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FriendActivity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FriendActivity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x24F94D808);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_66(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F94D838(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendActivity.CodingKeys()
{
  return &type metadata for FriendActivity.CodingKeys;
}

unint64_t sub_24F94D854()
{
  unint64_t result = qword_269A364A0[0];
  if (!qword_269A364A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A364A0);
  }
  return result;
}

unint64_t sub_24F94D8A4()
{
  unint64_t result = qword_269A365B0;
  if (!qword_269A365B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A365B0);
  }
  return result;
}

unint64_t sub_24F94D8F4()
{
  unint64_t result = qword_269A365B8[0];
  if (!qword_269A365B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A365B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return v0;
}

uint64_t sub_24F94DA1C()
{
  sub_24F94E744();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94DA54()
{
  sub_24F94E744();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94DA90()
{
  return _s21GameServicesProtocols3RefVA2A11Achievement_pRszlE0eD6FieldsO9hashValueSivg_0();
}

uint64_t sub_24F94DAB0()
{
  OUTLINED_FUNCTION_32();
  BOOL v3 = v3 && v1 == v2;
  if (v3)
  {
    OUTLINED_FUNCTION_111();
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  if (OUTLINED_FUNCTION_5_1()) {
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_52();
  BOOL v7 = v3 && v4 == 0xE400000000000000;
  if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v8 = v5 == 0x7069636974726170 && v4 == 0xEB00000000746E61;
    if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v9 = v5 == 0x657669746361 && v4 == 0xE600000000000000;
      if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v10 = v5 == 0x6574656C706D6F63 && v4 == 0xE800000000000000;
        if (v10 || (OUTLINED_FUNCTION_91(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (v5 == 7237495 && v4 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_42();
          if (v5) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_24F94DC9C()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  switch(v1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_24();
      break;
    case 2:
      uint64_t result = 0x7069636974726170;
      break;
    case 3:
      uint64_t result = 0x657669746361;
      break;
    case 4:
      uint64_t result = OUTLINED_FUNCTION_91();
      break;
    case 5:
      uint64_t result = 7237495;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F94DD3C()
{
  return sub_24F98E708();
}

uint64_t sub_24F94DD6C()
{
  sub_24F94E828();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94DDA4()
{
  sub_24F94E828();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94DDE0()
{
  return sub_24F94DC9C();
}

uint64_t sub_24F94DDE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F94DAB0();
  *a1 = result;
  return result;
}

void sub_24F94DE10(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F94DE18()
{
  sub_24F94E660();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94DE50()
{
  sub_24F94E660();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94DE88()
{
  sub_24F94E6F8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94DEC0()
{
  sub_24F94E6F8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94DEF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_24F94F268(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_24F94DF28()
{
  sub_24F94E7DC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94DF60()
{
  sub_24F94E7DC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94DF98()
{
  sub_24F94E790();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94DFD0()
{
  sub_24F94E790();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94E008@<X0>(uint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t result = j__swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_24F94E038()
{
  sub_24F94E6AC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94E070()
{
  sub_24F94E6AC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void ChallengeFilter.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A353D8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A353E0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A353E8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A353F0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_86(v4, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A353F8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_37(v5, v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35400);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35408);
  OUTLINED_FUNCTION_0_1();
  uint64_t v24 = v6;
  uint64_t v25 = v7;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_28();
  uint64_t v8 = *v0;
  uint64_t v9 = v0[1];
  uint64_t v10 = *((unsigned __int8 *)v0 + 16);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F94E660();
  uint64_t v23 = v1;
  sub_24F98E738();
  switch(v10)
  {
    case 1:
      sub_24F94E7DC();
      sub_24F98E568();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
      sub_24F949E34(&qword_269A35418, &qword_269A35410);
      OUTLINED_FUNCTION_96();
      OUTLINED_FUNCTION_2_2();
      v15();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v1, v24);
      goto LABEL_13;
    case 2:
      sub_24F94E790();
      uint64_t v11 = v24;
      sub_24F98E568();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
      sub_24F949E34(&qword_269A35390, &qword_269A35388);
      OUTLINED_FUNCTION_96();
      OUTLINED_FUNCTION_2_2();
      v16();
      uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      uint64_t v14 = v23;
      goto LABEL_5;
    case 3:
      if (v8 | v9)
      {
        if (v8 ^ 1 | v9) {
          sub_24F94E6AC();
        }
        else {
          sub_24F94E6F8();
        }
        OUTLINED_FUNCTION_141();
        OUTLINED_FUNCTION_2_2();
        v20();
        uint64_t v14 = OUTLINED_FUNCTION_123();
        uint64_t v17 = v8;
LABEL_12:
        v13(v14, v17);
      }
      else
      {
        sub_24F94E744();
        sub_24F98E568();
        OUTLINED_FUNCTION_2_2();
        v18();
        OUTLINED_FUNCTION_123();
        OUTLINED_FUNCTION_2_2();
        v19();
      }
LABEL_13:
      OUTLINED_FUNCTION_16();
      return;
    default:
      sub_24F94E828();
      uint64_t v11 = v24;
      sub_24F98E568();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
      sub_24F949E34(&qword_269A35428, &qword_269A35420);
      sub_24F98E628();
      OUTLINED_FUNCTION_2_2();
      v12();
      uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      uint64_t v14 = v23;
LABEL_5:
      uint64_t v17 = v11;
      goto LABEL_12;
  }
}

unint64_t sub_24F94E660()
{
  unint64_t result = qword_269A36640;
  if (!qword_269A36640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36640);
  }
  return result;
}

unint64_t sub_24F94E6AC()
{
  unint64_t result = qword_269A36648;
  if (!qword_269A36648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36648);
  }
  return result;
}

unint64_t sub_24F94E6F8()
{
  unint64_t result = qword_269A36650;
  if (!qword_269A36650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36650);
  }
  return result;
}

unint64_t sub_24F94E744()
{
  unint64_t result = qword_269A36658;
  if (!qword_269A36658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36658);
  }
  return result;
}

unint64_t sub_24F94E790()
{
  unint64_t result = qword_269A36660;
  if (!qword_269A36660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36660);
  }
  return result;
}

unint64_t sub_24F94E7DC()
{
  unint64_t result = qword_269A36668;
  if (!qword_269A36668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36668);
  }
  return result;
}

unint64_t sub_24F94E828()
{
  unint64_t result = qword_269A36670;
  if (!qword_269A36670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36670);
  }
  return result;
}

void ChallengeFilter.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = v3;
  uint64_t v59 = v5;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35430);
  OUTLINED_FUNCTION_0_1();
  uint64_t v56 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_38(v7, v54[0]);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35438);
  OUTLINED_FUNCTION_0_1();
  uint64_t v61 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_22();
  uint64_t v58 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35440);
  OUTLINED_FUNCTION_0_1();
  v54[7] = v11;
  v54[8] = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_37(v12, v54[0]);
  v54[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35448);
  OUTLINED_FUNCTION_0_1();
  uint64_t v60 = v13;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_22();
  uint64_t v57 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35450);
  OUTLINED_FUNCTION_0_1();
  v54[5] = v16;
  v54[6] = v15;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_48_0();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35458);
  OUTLINED_FUNCTION_0_1();
  v54[4] = v18;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_28();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35460);
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v4[3];
  uint64_t v63 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v24);
  sub_24F94E660();
  sub_24F98E728();
  if (v0) {
    goto LABEL_7;
  }
  v54[2] = v2;
  v54[1] = v17;
  v54[3] = v1;
  uint64_t v25 = sub_24F98E548();
  uint64_t v26 = *(void *)(v25 + 16);
  if (!v26
    || (v54[0] = 0,
        uint64_t v27 = *(unsigned __int8 *)(v25 + 32),
        sub_24F95548C(1, v26, v25, v25 + 32, 0, (2 * v26) | 1),
        uint64_t v29 = v28,
        unint64_t v31 = v30,
        swift_bridgeObjectRelease(),
        v29 != v31 >> 1))
  {
    sub_24F98E378();
    swift_allocError();
    uint64_t v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
    *uint64_t v34 = &type metadata for ChallengeFilter;
    sub_24F98E478();
    OUTLINED_FUNCTION_90();
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(void *))(v35 + 104))(v34);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v19);
LABEL_7:
    uint64_t v36 = (uint64_t)v63;
    goto LABEL_8;
  }
  uint64_t v32 = v61;
  switch(v27)
  {
    case 1:
      LOBYTE(v64) = 1;
      sub_24F94E7DC();
      OUTLINED_FUNCTION_21();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
      sub_24F949E34(&qword_269A35470, &qword_269A35410);
      OUTLINED_FUNCTION_101();
      sub_24F98E538();
      OUTLINED_FUNCTION_2_2();
      v49();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_35();
      v50();
      uint64_t v48 = v64;
      uint64_t v47 = v65;
      char v46 = 1;
      goto LABEL_14;
    case 2:
      LOBYTE(v64) = 2;
      sub_24F94E790();
      OUTLINED_FUNCTION_21();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
      sub_24F949E34(&qword_269A353B8, &qword_269A35388);
      OUTLINED_FUNCTION_101();
      sub_24F98E538();
      uint64_t v51 = OUTLINED_FUNCTION_130();
      v52(v51);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_35();
      v53();
      uint64_t v48 = v64;
      uint64_t v47 = v65;
      char v46 = 2;
      goto LABEL_14;
    case 3:
      LOBYTE(v64) = 3;
      sub_24F94E744();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_2_2();
      v37();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_2();
      v38();
      uint64_t v48 = 0;
      uint64_t v47 = 0;
      char v46 = 3;
      goto LABEL_14;
    case 4:
      LOBYTE(v64) = 4;
      sub_24F94E6F8();
      uint64_t v39 = v58;
      OUTLINED_FUNCTION_21();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v39, v55);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_2();
      v40();
      uint64_t v47 = 0;
      char v46 = 3;
      uint64_t v48 = 1;
      goto LABEL_14;
    case 5:
      LOBYTE(v64) = 5;
      sub_24F94E6AC();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_95();
      OUTLINED_FUNCTION_2_2();
      v41();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_2();
      v42();
      uint64_t v47 = 0;
      char v46 = 3;
      uint64_t v48 = 2;
      uint64_t v36 = (uint64_t)v63;
      uint64_t v43 = v59;
      goto LABEL_15;
    default:
      LOBYTE(v64) = 0;
      sub_24F94E828();
      OUTLINED_FUNCTION_21();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
      sub_24F949E34(&qword_269A35478, &qword_269A35420);
      OUTLINED_FUNCTION_101();
      sub_24F98E538();
      OUTLINED_FUNCTION_2_2();
      v44();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_2_2();
      v45();
      char v46 = 0;
      uint64_t v48 = v64;
      uint64_t v47 = v65;
LABEL_14:
      uint64_t v36 = (uint64_t)v63;
      uint64_t v43 = v59;
LABEL_15:
      *(void *)uint64_t v43 = v48;
      *(void *)(v43 + 8) = v47;
      *(unsigned char *)(v43 + 16) = v46;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v36);
  OUTLINED_FUNCTION_16();
}

uint64_t sub_24F94F0E8()
{
  OUTLINED_FUNCTION_32();
  BOOL v3 = v3 && v1 == v2;
  if (v3)
  {
    OUTLINED_FUNCTION_111();
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  if (OUTLINED_FUNCTION_5_1()) {
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_52();
  BOOL v7 = v3 && v4 == 0xE400000000000000;
  if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v8 = v5 == 1836020326 && v4 == 0xE400000000000000;
    if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (v5 == 28532 && v4 == 0xE200000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v5) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_24F94F218()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  switch(v1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_24();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_109();
      break;
    case 3:
      uint64_t result = 28532;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F94F268(uint64_t a1, uint64_t a2)
{
  if (a1 == 6710642 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    sub_24F98E678();
    OUTLINED_FUNCTION_42();
    char v4 = v2 ^ 1;
  }
  return v4 & 1;
}

void sub_24F94F2D8()
{
}

void sub_24F94F2F0()
{
}

uint64_t sub_24F94F308()
{
  sub_24F954FFC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94F340()
{
  sub_24F954FFC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94F378()
{
  return sub_24F94F218();
}

uint64_t sub_24F94F380@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F94F0E8();
  *a1 = result;
  return result;
}

void sub_24F94F3A8(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F94F3B0()
{
  sub_24F954ECC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94F3E8()
{
  sub_24F954ECC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94F420()
{
  sub_24F954F64();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94F458()
{
  sub_24F954F64();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94F490()
{
  sub_24F954FB0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94F4C8()
{
  sub_24F954FB0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F94F500()
{
  sub_24F954F18();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F94F538()
{
  sub_24F954F18();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void ChallengeInviteFilter.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  char v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35480);
  OUTLINED_FUNCTION_0_1();
  uint64_t v30 = v6;
  uint64_t v31 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_86(v7, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35488);
  OUTLINED_FUNCTION_0_1();
  uint64_t v27 = v9;
  uint64_t v28 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_37(v10, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35490);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_103();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35498);
  OUTLINED_FUNCTION_0_1();
  uint64_t v25 = v12;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_46();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354A0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v32 = v14;
  uint64_t v33 = v13;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_48_0();
  uint64_t v15 = *(unsigned __int8 *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F954ECC();
  sub_24F98E738();
  switch(v15)
  {
    case 1:
      sub_24F954FB0();
      sub_24F98E568();
      OUTLINED_FUNCTION_68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
      sub_24F949E34(&qword_269A35418, &qword_269A35410);
      OUTLINED_FUNCTION_124();
      sub_24F98E628();
      OUTLINED_FUNCTION_2_2();
      v22();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      uint64_t v19 = v1;
      uint64_t v20 = v33;
      goto LABEL_8;
    case 2:
      sub_24F954F64();
      uint64_t v16 = v26;
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
      sub_24F949E34(&qword_269A35390, &qword_269A35388);
      OUTLINED_FUNCTION_124();
      uint64_t v17 = v28;
      OUTLINED_FUNCTION_140();
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      sub_24F954F18();
      uint64_t v16 = v29;
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
      sub_24F949E34(&qword_269A35390, &qword_269A35388);
      OUTLINED_FUNCTION_124();
      uint64_t v17 = v31;
      OUTLINED_FUNCTION_140();
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
      goto LABEL_6;
    default:
      sub_24F954FFC();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
      sub_24F949E34(&qword_269A35428, &qword_269A35420);
      OUTLINED_FUNCTION_124();
      OUTLINED_FUNCTION_96();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v2, v11);
LABEL_6:
      uint64_t v19 = OUTLINED_FUNCTION_95();
LABEL_8:
      v21(v19, v20);
      OUTLINED_FUNCTION_16();
      return;
  }
}

void ChallengeInviteFilter.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v3 = v2;
  uint64_t v36 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354A8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_36(v5, v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_38(v6, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354B8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354C0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_19();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354C8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_103();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F954ECC();
  sub_24F98E728();
  if (!v1)
  {
    uint64_t v39 = v9;
    uint64_t v10 = sub_24F98E548();
    uint64_t v11 = *(void *)(v10 + 16);
    if (v11
      && (uint64_t v12 = v0,
          uint64_t v13 = *(unsigned __int8 *)(v10 + 32),
          sub_24F95548C(1, v11, v10, v10 + 32, 0, (2 * v11) | 1),
          uint64_t v15 = v14,
          unint64_t v17 = v16,
          swift_bridgeObjectRelease(),
          v15 == v17 >> 1))
    {
      char v18 = v13;
      switch(v13)
      {
        case 1:
          LOBYTE(v37) = 1;
          sub_24F954FB0();
          OUTLINED_FUNCTION_70();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
          sub_24F949E34(&qword_269A35470, &qword_269A35410);
          sub_24F98E538();
          OUTLINED_FUNCTION_2_2();
          v24();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_2_2();
          v25();
          goto LABEL_11;
        case 2:
          LOBYTE(v37) = 2;
          sub_24F954F64();
          OUTLINED_FUNCTION_70();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
          sub_24F949E34(&qword_269A353B8, &qword_269A35388);
          OUTLINED_FUNCTION_100();
          sub_24F98E538();
          OUTLINED_FUNCTION_2_2();
          v30();
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v12, v7);
LABEL_11:
          uint64_t v28 = v37;
          uint64_t v29 = v38;
          break;
        case 3:
          LOBYTE(v37) = 3;
          sub_24F954F18();
          OUTLINED_FUNCTION_70();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
          sub_24F949E34(&qword_269A353B8, &qword_269A35388);
          OUTLINED_FUNCTION_100();
          sub_24F98E538();
          OUTLINED_FUNCTION_2_2();
          v31();
          swift_unknownObjectRelease();
          uint64_t v32 = OUTLINED_FUNCTION_53();
          v33(v32);
          uint64_t v28 = v37;
          uint64_t v29 = v38;
          break;
        default:
          LOBYTE(v37) = 0;
          sub_24F954FFC();
          OUTLINED_FUNCTION_70();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
          sub_24F949E34(&qword_269A35478, &qword_269A35420);
          OUTLINED_FUNCTION_100();
          sub_24F98E538();
          OUTLINED_FUNCTION_2_2();
          v26();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_2_2();
          v27();
          uint64_t v28 = v37;
          uint64_t v29 = v38;
          char v18 = v13;
          break;
      }
      *(void *)uint64_t v36 = v28;
      *(void *)(v36 + 8) = v29;
      *(unsigned char *)(v36 + 16) = v18;
    }
    else
    {
      sub_24F98E378();
      swift_allocError();
      uint64_t v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
      *uint64_t v20 = &type metadata for ChallengeInviteFilter;
      sub_24F98E478();
      OUTLINED_FUNCTION_90();
      OUTLINED_FUNCTION_4_2();
      (*(void (**)(void *))(v21 + 104))(v20);
      swift_willThrow();
      swift_unknownObjectRelease();
      uint64_t v22 = OUTLINED_FUNCTION_123();
      v23(v22, v7);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  OUTLINED_FUNCTION_16();
}

void sub_24F9501C4()
{
}

void sub_24F9501DC()
{
}

uint64_t ChallengeDescription.id.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ChallengeDescription.creator.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 40), a1);
}

uint64_t ChallengeDescription.game.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 56), a1);
}

uint64_t ChallengeDescription.leaderboard.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 72), a1);
}

uint64_t ChallengeDescription.startTime.getter()
{
  type metadata accessor for ChallengeDescription(0);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  uint64_t v0 = OUTLINED_FUNCTION_8_0();
  return v1(v0);
}

uint64_t ChallengeDescription.duration.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ChallengeDescription(0) + 40));
}

uint64_t ChallengeDescription.attemptsLimit.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ChallengeDescription(0) + 44));
}

uint64_t ChallengeDescription.init(id:ref:creator:game:leaderboard:startTime:duration:attemptsLimit:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X7>, void *a8@<X8>, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v13 = *a3;
  uint64_t v14 = a3[1];
  uint64_t v15 = *a4;
  uint64_t v16 = a4[1];
  uint64_t v17 = *a5;
  uint64_t v18 = a5[1];
  uint64_t v19 = *a6;
  uint64_t v20 = a6[1];
  *a8 = a1;
  a8[1] = a2;
  a8[2] = v13;
  a8[3] = v14;
  a8[4] = v15;
  a8[5] = v16;
  a8[6] = v17;
  a8[7] = v18;
  a8[8] = v19;
  a8[9] = v20;
  uint64_t v21 = type metadata accessor for ChallengeDescription(0);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  uint64_t result = v22();
  uint64_t v24 = (void *)((char *)a8 + *(int *)(v21 + 40));
  *uint64_t v24 = a7;
  v24[1] = a9;
  uint64_t v25 = (char *)a8 + *(int *)(v21 + 44);
  *(void *)uint64_t v25 = a10;
  v25[8] = a11 & 1;
  return result;
}

uint64_t sub_24F9503D0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  BOOL v6 = v3 == 6710642 && v2 == 0xE300000000000000;
  if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  BOOL v7 = v3 == 0x726F7461657263 && v2 == 0xE700000000000000;
  if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  OUTLINED_FUNCTION_52();
  BOOL v8 = v4 && v2 == 0xE400000000000000;
  if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  BOOL v9 = v3 == 0x6F6272656461656CLL && v2 == 0xEB00000000647261;
  if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  if (v3 == 0x6D69547472617473 && v2 == 0xE900000000000065)
  {
    OUTLINED_FUNCTION_111();
LABEL_38:
    swift_bridgeObjectRelease();
    return 5;
  }
  if (OUTLINED_FUNCTION_5_1()) {
    goto LABEL_38;
  }
  BOOL v11 = v3 == 0x6E6F697461727564 && v2 == 0xE800000000000000;
  if (v11 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    OUTLINED_FUNCTION_72();
    if (v4 && v2 == v12)
    {
      swift_bridgeObjectRelease();
      return 7;
    }
    else
    {
      OUTLINED_FUNCTION_84();
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v3) {
        return 7;
      }
      else {
        return 8;
      }
    }
  }
}

uint64_t sub_24F950674(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 6710642;
      break;
    case 2:
      uint64_t result = 0x726F7461657263;
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_24();
      break;
    case 4:
      uint64_t result = 0x6F6272656461656CLL;
      break;
    case 5:
      uint64_t result = 0x6D69547472617473;
      break;
    case 6:
      uint64_t result = 0x6E6F697461727564;
      break;
    case 7:
      uint64_t result = OUTLINED_FUNCTION_84();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F950764()
{
  return sub_24F950674(*v0);
}

uint64_t sub_24F95076C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F9503D0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F950794(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F95079C()
{
  sub_24F955068();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9507D4()
{
  sub_24F955068();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t ChallengeDescription.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_78();
  sub_24F955068();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_97();
  sub_24F98E5D8();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
    sub_24F949E34(&qword_269A35428, &qword_269A35420);
    OUTLINED_FUNCTION_13_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
    OUTLINED_FUNCTION_13_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35418, &qword_269A35410);
    OUTLINED_FUNCTION_13_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
    sub_24F949E34(&qword_269A354E0, &qword_269A354D8);
    OUTLINED_FUNCTION_13_0();
    type metadata accessor for ChallengeDescription(0);
    sub_24F98DFB8();
    sub_24F9550B4(&qword_269A353A8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_121(7);
    sub_24F98E5A8();
  }
  OUTLINED_FUNCTION_23();
  return v1();
}

void ChallengeDescription.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  uint64_t v16 = sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354E8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388]();
  uint64_t v5 = OUTLINED_FUNCTION_87();
  uint64_t v14 = (int *)type metadata accessor for ChallengeDescription(v5);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_22();
  uint64_t v7 = v6;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F955068();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    LOBYTE(v17) = 0;
    *(void *)uint64_t v7 = sub_24F98E4E8();
    *(void *)(v7 + 8) = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
    OUTLINED_FUNCTION_88();
    sub_24F949E34(&qword_269A35478, &qword_269A35420);
    OUTLINED_FUNCTION_26();
    sub_24F98E538();
    *(_OWORD *)(v7 + 16) = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    OUTLINED_FUNCTION_27();
    *(_OWORD *)(v7 + 32) = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35470, &qword_269A35410);
    OUTLINED_FUNCTION_27();
    *(_OWORD *)(v7 + 48) = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
    sub_24F949E34(&qword_269A354F0, &qword_269A354D8);
    OUTLINED_FUNCTION_27();
    *(_OWORD *)(v7 + 64) = v17;
    LOBYTE(v17) = 5;
    sub_24F9550B4(&qword_269A353C8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_125();
    sub_24F98E538();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v7 + v14[9], v1, v16);
    sub_24F98E538();
    *(_OWORD *)(v7 + v14[10]) = v17;
    uint64_t v9 = sub_24F98E4B8();
    char v11 = v10;
    OUTLINED_FUNCTION_2_2();
    v12();
    uint64_t v13 = v7 + v14[11];
    *(void *)uint64_t v13 = v9;
    *(unsigned char *)(v13 + 8) = v11 & 1;
    sub_24F955238();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_24F955290(v7, (void (*)(void))type metadata accessor for ChallengeDescription);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F9510C4()
{
}

uint64_t sub_24F9510DC()
{
  return ChallengeDescription.encode(to:)();
}

uint64_t ChallengeState.challenge.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

uint64_t ChallengeState.game.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 24), a1);
}

uint64_t ChallengeState.message.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ChallengeState.completedAt.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ChallengeState(0) + 28);
  return sub_24F95511C(v3, a1);
}

uint64_t ChallengeState.init(challenge:game:message:completedAt:)@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v7 = a1[1];
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  *a6 = *a1;
  a6[1] = v7;
  a6[2] = v8;
  a6[3] = v9;
  a6[4] = a3;
  a6[5] = a4;
  uint64_t v10 = (uint64_t)a6 + *(int *)(type metadata accessor for ChallengeState(0) + 28);
  return sub_24F955184(a5, v10);
}

uint64_t sub_24F9511D0()
{
  OUTLINED_FUNCTION_32();
  BOOL v3 = v3 && v1 == v2;
  if (v3)
  {
    OUTLINED_FUNCTION_111();
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  if (OUTLINED_FUNCTION_5_1()) {
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_52();
  BOOL v7 = v3 && v4 == 0xE400000000000000;
  if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v8 = v5 == 0x6567617373656DLL && v4 == 0xE700000000000000;
    if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (v5 == 0x6574656C706D6F63 && v4 == 0xEB00000000744164)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v5) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_24F95132C()
{
  uint64_t result = OUTLINED_FUNCTION_51();
  switch(v1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_24();
      break;
    case 2:
      uint64_t result = 0x6567617373656DLL;
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_91();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F9513A0()
{
  return sub_24F94C4D4();
}

uint64_t sub_24F9513BC()
{
  return sub_24F95132C();
}

uint64_t sub_24F9513C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F9511D0();
  *a1 = result;
  return result;
}

uint64_t sub_24F9513EC()
{
  sub_24F9551EC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F951424()
{
  sub_24F9551EC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t ChallengeState.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35500);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_78();
  sub_24F9551EC();
  OUTLINED_FUNCTION_79();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
  sub_24F949E34(&qword_269A35428, &qword_269A35420);
  OUTLINED_FUNCTION_4_1();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35418, &qword_269A35410);
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_121(2);
    sub_24F98E578();
    type metadata accessor for ChallengeState(0);
    sub_24F98DFB8();
    sub_24F9550B4(&qword_269A353A8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_71();
    sub_24F98E5B8();
  }
  OUTLINED_FUNCTION_23();
  return v2();
}

void ChallengeState.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v6 = OUTLINED_FUNCTION_15_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35508);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  uint64_t v8 = type metadata accessor for ChallengeState(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_29();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F9551EC();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
    sub_24F949E34(&qword_269A35478, &qword_269A35420);
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_118();
    *uint64_t v1 = v13;
    v1[1] = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    OUTLINED_FUNCTION_88();
    sub_24F949E34(&qword_269A35470, &qword_269A35410);
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_118();
    v1[2] = v13;
    v1[3] = v14;
    OUTLINED_FUNCTION_97();
    v1[4] = sub_24F98E488();
    v1[5] = v10;
    sub_24F98DFB8();
    sub_24F9550B4(&qword_269A353C8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_125();
    sub_24F98E4C8();
    uint64_t v11 = OUTLINED_FUNCTION_17();
    v12(v11);
    sub_24F955184(v2, (uint64_t)v1 + *(int *)(v8 + 28));
    sub_24F955238();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    sub_24F955290((uint64_t)v1, (void (*)(void))type metadata accessor for ChallengeState);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F951994()
{
}

uint64_t sub_24F9519AC()
{
  return ChallengeState.encode(to:)();
}

GameServicesProtocols::ChallengeLeaveResult_optional __swiftcall ChallengeLeaveResult.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24F98E458();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t ChallengeLeaveResult.rawValue.getter()
{
  uint64_t v1 = 1952867692;
  if (*v0 != 1) {
    uint64_t v1 = 0x656E696F4A746F6ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4579646165726C61;
  }
}

uint64_t sub_24F951A80(unsigned __int8 *a1, char *a2)
{
  return sub_24F951A8C(*a1, *a2);
}

uint64_t sub_24F951A8C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC0000006465646ELL;
  uint64_t v3 = 0x4579646165726C61;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 1952867692;
    }
    else {
      uint64_t v5 = 0x656E696F4A746F6ELL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE400000000000000;
    }
    else {
      unint64_t v6 = 0xE900000000000064;
    }
  }
  else
  {
    uint64_t v5 = 0x4579646165726C61;
    unint64_t v6 = 0xEC0000006465646ELL;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1952867692;
    }
    else {
      uint64_t v3 = 0x656E696F4A746F6ELL;
    }
    if (a2 == 1) {
      unint64_t v2 = 0xE400000000000000;
    }
    else {
      unint64_t v2 = 0xE900000000000064;
    }
  }
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F951B9C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x657669746361;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x657669746361;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x4179646165726C61;
      unint64_t v3 = 0xEF64657470656363;
      break;
    case 2:
      unint64_t v5 = 0x4979646165726C61;
      unint64_t v3 = 0xEE0064657469766ELL;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v6 = "ed";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD000000000000016;
      unint64_t v6 = "challengeAlreadyEnded";
LABEL_6:
      unint64_t v3 = (unint64_t)v6 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x64696C61766E69;
      break;
    case 6:
      unint64_t v3 = 0x800000024F998960;
      unint64_t v5 = 0xD000000000000013;
      break;
    case 7:
      unint64_t v5 = 0x616C696176616E75;
      unint64_t v3 = 0xEB00000000656C62;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x4179646165726C61;
      unint64_t v7 = 0xEF64657470656363;
      break;
    case 2:
      unint64_t v2 = 0x4979646165726C61;
      unint64_t v7 = 0xEE0064657469766ELL;
      break;
    case 3:
      unint64_t v2 = 0xD000000000000015;
      char v8 = "ed";
      goto LABEL_15;
    case 4:
      unint64_t v2 = 0xD000000000000016;
      char v8 = "challengeAlreadyEnded";
LABEL_15:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    case 5:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v2 = 0x64696C61766E69;
      break;
    case 6:
      unint64_t v7 = 0x800000024F998960;
      unint64_t v2 = 0xD000000000000013;
      break;
    case 7:
      unint64_t v2 = 0x616C696176616E75;
      unint64_t v7 = 0xEB00000000656C62;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_24F951E38()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A35630, &qword_269A35388);
  sub_24F98E0A8();
  sub_24F98E0A8();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_24F951F18()
{
  return sub_24F951F20();
}

uint64_t sub_24F951F20()
{
  return sub_24F9521B8();
}

uint64_t sub_24F951F2C()
{
  return sub_24F98E718();
}

uint64_t sub_24F951F74()
{
  return sub_24F951F7C();
}

uint64_t sub_24F951F7C()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F95200C()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F95216C()
{
  return sub_24F9521B8();
}

uint64_t sub_24F952174()
{
  return sub_24F98E718();
}

uint64_t sub_24F9521B8()
{
  return sub_24F98E718();
}

GameServicesProtocols::ChallengeLeaveResult_optional sub_24F95225C(Swift::String *a1)
{
  return ChallengeLeaveResult.init(rawValue:)(*a1);
}

uint64_t sub_24F952268@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ChallengeLeaveResult.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F952290()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F9522C8()
{
  return OUTLINED_FUNCTION_98();
}

uint64_t ChallengeParticipantState.player.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

uint64_t ChallengeParticipantState.challenge.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 24), a1);
}

uint64_t ChallengeParticipantState.game.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 40), a1);
}

uint64_t ChallengeParticipantState.attemptsCount.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t ChallengeParticipantState.formattedScoreValue.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t ChallengeParticipantState.score.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t ChallengeParticipantState.rank.getter()
{
  return *(void *)(v0 + 88);
}

void *ChallengeParticipantState.init(player:challenge:game:attemptsCount:formattedScoreValue:score:rank:)@<X0>(void *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  uint64_t v11 = result[1];
  uint64_t v12 = *a2;
  uint64_t v13 = a2[1];
  uint64_t v14 = *a3;
  uint64_t v15 = a3[1];
  *(void *)a9 = *result;
  *(void *)(a9 + 8) = v11;
  *(void *)(a9 + 16) = v12;
  *(void *)(a9 + 24) = v13;
  *(void *)(a9 + 32) = v14;
  *(void *)(a9 + 40) = v15;
  *(void *)(a9 + 48) = a4;
  *(void *)(a9 + 56) = a5;
  *(void *)(a9 + 64) = a6;
  *(void *)(a9 + 72) = a7;
  *(unsigned char *)(a9 + 80) = a8 & 1;
  *(void *)(a9 + 88) = a10;
  *(unsigned char *)(a9 + 96) = a11 & 1;
  return result;
}

uint64_t sub_24F95239C()
{
  OUTLINED_FUNCTION_122();
  BOOL v2 = v2 && v1 == 0xE600000000000000;
  if (v2 || (uint64_t v3 = v1, v4 = v0, (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v4 == 0x676E656C6C616863 && v3 == 0xE900000000000065)
  {
    OUTLINED_FUNCTION_111();
LABEL_14:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (OUTLINED_FUNCTION_5_1()) {
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_52();
  BOOL v7 = v2 && v3 == 0xE400000000000000;
  if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    OUTLINED_FUNCTION_72();
    BOOL v9 = v2 && v3 == v8;
    if (v9 || (OUTLINED_FUNCTION_84(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (v4 == 0xD000000000000013 && v3 == 0x800000024F9989B0 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      BOOL v10 = v4 == 0x65726F6373 && v3 == 0xE500000000000000;
      if (v10 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else if (v4 == 1802396018 && v3 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 6;
      }
      else
      {
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_42();
        if (v4) {
          return 6;
        }
        else {
          return 7;
        }
      }
    }
  }
}

unint64_t sub_24F9525D0(char a1)
{
  unint64_t result = 0x726579616C70;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x676E656C6C616863;
      break;
    case 2:
      unint64_t result = OUTLINED_FUNCTION_24();
      break;
    case 3:
      unint64_t result = OUTLINED_FUNCTION_84();
      break;
    case 4:
      unint64_t result = OUTLINED_FUNCTION_89();
      break;
    case 5:
      unint64_t result = 0x65726F6373;
      break;
    case 6:
      unint64_t result = 1802396018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F952694()
{
  return sub_24F9525D0(*v0);
}

uint64_t sub_24F95269C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F95239C();
  *a1 = result;
  return result;
}

void sub_24F9526C4(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F9526CC()
{
  sub_24F9552E8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F952704()
{
  sub_24F9552E8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void ChallengeParticipantState.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35510);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F9552E8();
  sub_24F98E738();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A35390, &qword_269A35388);
  sub_24F98E628();
  if (!v0)
  {
    OUTLINED_FUNCTION_88();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
    sub_24F949E34(&qword_269A35428, &qword_269A35420);
    OUTLINED_FUNCTION_61();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35418, &qword_269A35410);
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_97();
    sub_24F98E608();
    OUTLINED_FUNCTION_97();
    sub_24F98E578();
    OUTLINED_FUNCTION_97();
    sub_24F98E5C8();
    sub_24F98E5A8();
  }
  OUTLINED_FUNCTION_35();
  v4();
  OUTLINED_FUNCTION_16();
}

void ChallengeParticipantState.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35518);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_47();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F9552E8();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    OUTLINED_FUNCTION_26();
    sub_24F98E538();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
    OUTLINED_FUNCTION_88();
    sub_24F949E34(&qword_269A35478, &qword_269A35420);
    swift_bridgeObjectRetain();
    sub_24F98E538();
    uint64_t v18 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35470, &qword_269A35410);
    swift_bridgeObjectRetain();
    sub_24F98E538();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_41();
    uint64_t v17 = sub_24F98E518();
    OUTLINED_FUNCTION_41();
    uint64_t v6 = sub_24F98E488();
    uint64_t v8 = v7;
    uint64_t v16 = v6;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_41();
    uint64_t v9 = sub_24F98E4D8();
    char v21 = v10;
    uint64_t v15 = v9;
    OUTLINED_FUNCTION_41();
    uint64_t v11 = sub_24F98E4B8();
    char v13 = v12;
    OUTLINED_FUNCTION_23();
    v14();
    *(void *)uint64_t v18 = v19;
    *(void *)(v18 + 8) = v20;
    *(void *)(v18 + 16) = v19;
    *(void *)(v18 + 24) = v20;
    *(void *)(v18 + 32) = v19;
    *(void *)(v18 + 40) = v20;
    *(void *)(v18 + 48) = v17;
    *(void *)(v18 + 56) = v16;
    *(void *)(v18 + 64) = v8;
    *(void *)(v18 + 72) = v15;
    *(unsigned char *)(v18 + 80) = v21 & 1;
    *(void *)(v18 + 88) = v11;
    *(unsigned char *)(v18 + 96) = v13 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F952EA8()
{
}

void sub_24F952EC0()
{
}

uint64_t static ChallengeInvite.Details.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = (char *)a1;
  uint64_t v61 = (char *)a2;
  uint64_t v59 = sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v57 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_38(v6, v53[0]);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35520);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_46();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v9 = OUTLINED_FUNCTION_15_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_104();
  uint64_t v12 = v10 - v11;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v53 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v53 - v17;
  type metadata accessor for ChallengeInvite.Details(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_104();
  uint64_t v22 = (uint64_t *)(v20 - v21);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v53 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35528);
  uint64_t v27 = OUTLINED_FUNCTION_15_0(v26);
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_48_0();
  uint64_t v29 = (void *)(v2 + *(int *)(v28 + 56));
  sub_24F955238();
  sub_24F955238();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24F955238();
    uint64_t v30 = *v22;
    uint64_t v31 = v22[1];
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      if (v30 == *v29 && v31 == v29[1])
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v33 = sub_24F98E678();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v33 & 1) == 0)
        {
          uint64_t v34 = v2;
LABEL_22:
          sub_24F955290(v34, (void (*)(void))type metadata accessor for ChallengeInvite.Details);
          return 0;
        }
      }
      uint64_t v34 = v2;
LABEL_19:
      sub_24F955290(v34, (void (*)(void))type metadata accessor for ChallengeInvite.Details);
      return 1;
    }
  }
  else
  {
    uint64_t v60 = v16;
    uint64_t v61 = v18;
    uint64_t v55 = v12;
    sub_24F955238();
    uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A35530) + 64);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v54 = v2;
      v53[1] = v29[2];
      uint64_t v36 = (uint64_t)v61;
      sub_24F955184((uint64_t)&v25[v35], (uint64_t)v61);
      uint64_t v37 = (uint64_t)v29 + v35;
      uint64_t v38 = (uint64_t)v60;
      sub_24F955184(v37, (uint64_t)v60);
      char v39 = sub_24F951E38();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v39)
      {
        char v40 = sub_24F951E38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v40)
        {
          uint64_t v41 = v36;
          uint64_t v42 = v3;
          uint64_t v43 = v3 + *(int *)(v58 + 48);
          sub_24F95511C(v41, v3);
          sub_24F95511C(v38, v43);
          uint64_t v44 = v59;
          if (__swift_getEnumTagSinglePayload(v3, 1, v59) == 1)
          {
            sub_24F955354(v38, &qword_269A354F8);
            sub_24F955354(v41, &qword_269A354F8);
            if (__swift_getEnumTagSinglePayload(v43, 1, v44) == 1)
            {
              sub_24F955354(v3, &qword_269A354F8);
              uint64_t v34 = v54;
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v46 = v3;
            uint64_t v47 = v55;
            sub_24F95511C(v46, v55);
            int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v43, 1, v44);
            uint64_t v49 = v57;
            if (EnumTagSinglePayload != 1)
            {
              uint64_t v50 = v56;
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32))(v56, v43, v44);
              sub_24F9550B4(&qword_269A35538, MEMORY[0x263F07490]);
              char v51 = sub_24F98DFF8();
              uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
              v52(v50, v44);
              sub_24F955354((uint64_t)v60, &qword_269A354F8);
              sub_24F955354((uint64_t)v61, &qword_269A354F8);
              v52(v47, v44);
              sub_24F955354(v42, &qword_269A354F8);
              uint64_t v34 = v54;
              if ((v51 & 1) == 0) {
                goto LABEL_22;
              }
              goto LABEL_19;
            }
            sub_24F955354((uint64_t)v60, &qword_269A354F8);
            sub_24F955354((uint64_t)v61, &qword_269A354F8);
            (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v44);
          }
          sub_24F955354(v42, &qword_269A35520);
          uint64_t v34 = v54;
          goto LABEL_22;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_24F955354(v38, &qword_269A354F8);
      sub_24F955354(v36, &qword_269A354F8);
      uint64_t v34 = v54;
      goto LABEL_22;
    }
    sub_24F955354((uint64_t)&v25[v35], &qword_269A354F8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_24F955354(v2, &qword_269A35528);
  return 0;
}

uint64_t sub_24F953540(uint64_t a1, uint64_t a2)
{
  if (a1 == 1701080931 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    sub_24F98E678();
    OUTLINED_FUNCTION_42();
    char v4 = v2 ^ 1;
  }
  return v4 & 1;
}

uint64_t _s21GameServicesProtocols3RefVA2A11Achievement_pRszlE0eD6FieldsO9hashValueSivg_0()
{
  return sub_24F98E718();
}

uint64_t sub_24F9535F4()
{
  OUTLINED_FUNCTION_122();
  BOOL v2 = v2 && v1 == 0xE600000000000000;
  if (v2 || (uint64_t v3 = v1, v4 = v0, (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v4 == 1701080931 && v3 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_42();
    if (v4) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F9536A0(char a1)
{
  if (a1) {
    return 1701080931;
  }
  else {
    return 0x726579616C70;
  }
}

uint64_t sub_24F9536CC(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 1836020326 && a2 == 0xE400000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 28532 && v2 == 0xE200000000000000;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v3 == 0x4164657469766E69 && v2 == 0xE900000000000074)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v3) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_24F9537D0(char a1)
{
  if (!a1) {
    return OUTLINED_FUNCTION_109();
  }
  if (a1 == 1) {
    return 28532;
  }
  return 0x4164657469766E69;
}

uint64_t sub_24F95380C()
{
  return sub_24F98E718();
}

uint64_t sub_24F95384C()
{
  return 1701080931;
}

uint64_t sub_24F95385C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_24F953540(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_24F95388C()
{
  sub_24F9553F4();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9538C4()
{
  sub_24F9553F4();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F9538FC()
{
  return sub_24F9536A0(*v0);
}

uint64_t sub_24F953904@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F9535F4();
  *a1 = result;
  return result;
}

void sub_24F95392C(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F953934()
{
  sub_24F9553A8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F95396C()
{
  sub_24F9553A8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F9539A4()
{
  return sub_24F9537D0(*v0);
}

uint64_t sub_24F9539AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F9536CC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F9539D4(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F9539DC()
{
  sub_24F955440();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F953A14()
{
  sub_24F955440();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void ChallengeInvite.Details.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35540);
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_47();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35548);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_85(v7, v21);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v9 = OUTLINED_FUNCTION_15_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_36(v10, v22);
  type metadata accessor for ChallengeInvite.Details(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_46();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35550);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F9553A8();
  sub_24F98E738();
  sub_24F955238();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24F9553F4();
    sub_24F98E568();
    sub_24F98E5D8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_2();
    v13();
    OUTLINED_FUNCTION_139();
    OUTLINED_FUNCTION_23();
    v14();
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    sub_24F955184(v1 + *(int *)(v15 + 64), v23);
    sub_24F955440();
    sub_24F98E568();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
    sub_24F98E628();
    swift_bridgeObjectRelease();
    if (v0)
    {
      OUTLINED_FUNCTION_2_2();
      v16();
      sub_24F955354(v23, &qword_269A354F8);
      OUTLINED_FUNCTION_139();
      OUTLINED_FUNCTION_2_2();
      v17();
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_88();
      sub_24F98E628();
      swift_bridgeObjectRelease();
      sub_24F98DFB8();
      sub_24F9550B4(&qword_269A353A8, MEMORY[0x263F07490]);
      OUTLINED_FUNCTION_125();
      sub_24F98E5B8();
      OUTLINED_FUNCTION_123();
      OUTLINED_FUNCTION_2_2();
      v18();
      sub_24F955354(v23, &qword_269A354F8);
      uint64_t v19 = OUTLINED_FUNCTION_139();
      v20(v19);
    }
  }
  OUTLINED_FUNCTION_16();
}

void ChallengeInvite.Details.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v61 = v0;
  uint64_t v2 = v1;
  uint64_t v53 = v3;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35558);
  OUTLINED_FUNCTION_0_1();
  uint64_t v54 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_36(v6, v49);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35560);
  OUTLINED_FUNCTION_0_1();
  uint64_t v55 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_85(v9, v49);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35568);
  OUTLINED_FUNCTION_0_1();
  uint64_t v59 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_28();
  uint64_t v12 = type metadata accessor for ChallengeInvite.Details(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_104();
  uint64_t v16 = (uint64_t *)(v14 - v15);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v49 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v49 - v21;
  uint64_t v60 = v2;
  OUTLINED_FUNCTION_78();
  sub_24F9553A8();
  uint64_t v23 = v61;
  sub_24F98E728();
  if (v23) {
    goto LABEL_7;
  }
  uint64_t v50 = v16;
  char v51 = v22;
  uint64_t v52 = v20;
  uint64_t v61 = v12;
  uint64_t v24 = sub_24F98E548();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25
    || (char v26 = *(unsigned char *)(v24 + 32),
        uint64_t v27 = sub_24F95548C(1, v25, v24, v24 + 32, 0, (2 * v25) | 1),
        uint64_t v29 = v28,
        unint64_t v31 = v30,
        swift_bridgeObjectRelease(),
        v29 != v31 >> 1))
  {
    uint64_t v32 = v61;
    sub_24F98E378();
    swift_allocError();
    uint64_t v34 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
    *uint64_t v34 = v32;
    sub_24F98E478();
    sub_24F98E368();
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(uint64_t *))(v35 + 104))(v34);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v36 = OUTLINED_FUNCTION_94();
    v37(v36);
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(v60);
    goto LABEL_8;
  }
  if (v26)
  {
    OUTLINED_FUNCTION_88();
    sub_24F9553F4();
    OUTLINED_FUNCTION_133();
    uint64_t v39 = sub_24F98E4E8();
    uint64_t v41 = v40;
    OUTLINED_FUNCTION_2_2();
    v42();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_2_2();
    v43();
    uint64_t v44 = v50;
    uint64_t *v50 = v39;
    v44[1] = v41;
    swift_storeEnumTagMultiPayload();
    uint64_t v45 = (uint64_t)v44;
  }
  else
  {
    sub_24F955440();
    OUTLINED_FUNCTION_133();
    uint64_t v58 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    uint64_t v38 = (uint64_t)v52;
    OUTLINED_FUNCTION_106();
    OUTLINED_FUNCTION_106();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    sub_24F98DFB8();
    sub_24F9550B4(&qword_269A353C8, MEMORY[0x263F07490]);
    sub_24F98E4C8();
    OUTLINED_FUNCTION_2_2();
    v47();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_35();
    v48();
    swift_storeEnumTagMultiPayload();
    uint64_t v45 = v38;
  }
  uint64_t v46 = (uint64_t)v51;
  sub_24F955508(v45, (uint64_t)v51);
  sub_24F955508(v46, v53);
  __swift_destroy_boxed_opaque_existential_1(v60);
LABEL_8:
  OUTLINED_FUNCTION_16();
}

void sub_24F95454C()
{
}

void sub_24F954564()
{
}

uint64_t ChallengeInvite.details.getter()
{
  return sub_24F955238();
}

uint64_t ChallengeInvite.init(ref:details:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = a1[1];
  *a3 = *a1;
  a3[1] = v4;
  uint64_t v5 = (uint64_t)a3 + *(int *)(type metadata accessor for ChallengeInvite(0) + 20);
  return sub_24F955508(a2, v5);
}

BOOL sub_24F95461C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24F95462C()
{
  return sub_24F98E708();
}

uint64_t sub_24F954654(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 6710642 && a2 == 0xE300000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v3 == 0x736C6961746564 && v2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_42();
    if (v3) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F954710()
{
  return sub_24F98E718();
}

uint64_t sub_24F954758(char a1)
{
  if (a1) {
    return 0x736C6961746564;
  }
  else {
    return 6710642;
  }
}

BOOL sub_24F954788(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24F95461C(*a1, *a2);
}

uint64_t sub_24F954794()
{
  return sub_24F954710();
}

uint64_t sub_24F9547B0()
{
  return sub_24F95462C();
}

uint64_t sub_24F9547B8()
{
  return sub_24F954758(*v0);
}

uint64_t sub_24F9547C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F954654(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F9547E8()
{
  sub_24F9555C0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F954820()
{
  sub_24F9555C0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t ChallengeInvite.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35570);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_78();
  sub_24F9555C0();
  OUTLINED_FUNCTION_79();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35578);
  sub_24F949E34(&qword_269A35580, &qword_269A35578);
  OUTLINED_FUNCTION_4_1();
  if (!v0)
  {
    type metadata accessor for ChallengeInvite(0);
    type metadata accessor for ChallengeInvite.Details(0);
    sub_24F9550B4(&qword_269A35588, (void (*)(uint64_t))type metadata accessor for ChallengeInvite.Details);
    OUTLINED_FUNCTION_71();
    sub_24F98E628();
  }
  OUTLINED_FUNCTION_23();
  return v2();
}

void ChallengeInvite.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v4 = v3;
  type metadata accessor for ChallengeInvite.Details(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35590);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_87();
  uint64_t v8 = type metadata accessor for ChallengeInvite(v7);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_29();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F9555C0();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35578);
    sub_24F949E34(&qword_269A35598, &qword_269A35578);
    OUTLINED_FUNCTION_26();
    sub_24F98E538();
    *uint64_t v2 = v12;
    v2[1] = v13;
    sub_24F9550B4(&qword_269A355A0, (void (*)(uint64_t))type metadata accessor for ChallengeInvite.Details);
    OUTLINED_FUNCTION_125();
    sub_24F98E538();
    uint64_t v10 = OUTLINED_FUNCTION_82();
    v11(v10);
    sub_24F955508(v1, (uint64_t)v2 + *(int *)(v8 + 20));
    sub_24F955238();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    sub_24F955290((uint64_t)v2, (void (*)(void))type metadata accessor for ChallengeInvite);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F954C68()
{
}

uint64_t sub_24F954C80()
{
  return ChallengeInvite.encode(to:)();
}

GameServicesProtocols::ChallengeInviteState_optional __swiftcall ChallengeInviteState.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24F98E458();
  result.value = swift_bridgeObjectRelease();
  char v5 = 8;
  if (v3 < 8) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t ChallengeInviteState.rawValue.getter()
{
  unint64_t result = 0x657669746361;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x4179646165726C61;
      break;
    case 2:
      unint64_t result = 0x4979646165726C61;
      break;
    case 3:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0x64696C61766E69;
      break;
    case 6:
      unint64_t result = OUTLINED_FUNCTION_89();
      break;
    case 7:
      unint64_t result = 0x616C696176616E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F954E0C(unsigned __int8 *a1, char *a2)
{
  return sub_24F951B9C(*a1, *a2);
}

uint64_t sub_24F954E18()
{
  return sub_24F951F2C();
}

uint64_t sub_24F954E20()
{
  return sub_24F95200C();
}

uint64_t sub_24F954E28()
{
  return sub_24F952174();
}

GameServicesProtocols::ChallengeInviteState_optional sub_24F954E30(Swift::String *a1)
{
  return ChallengeInviteState.init(rawValue:)(*a1);
}

unint64_t sub_24F954E3C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ChallengeInviteState.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F954E64()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F954E9C()
{
  return OUTLINED_FUNCTION_98();
}

unint64_t sub_24F954ECC()
{
  unint64_t result = qword_269A36678;
  if (!qword_269A36678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36678);
  }
  return result;
}

unint64_t sub_24F954F18()
{
  unint64_t result = qword_269A36680;
  if (!qword_269A36680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36680);
  }
  return result;
}

unint64_t sub_24F954F64()
{
  unint64_t result = qword_269A36688;
  if (!qword_269A36688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36688);
  }
  return result;
}

unint64_t sub_24F954FB0()
{
  unint64_t result = qword_269A36690;
  if (!qword_269A36690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36690);
  }
  return result;
}

unint64_t sub_24F954FFC()
{
  unint64_t result = qword_269A36698;
  if (!qword_269A36698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A36698);
  }
  return result;
}

uint64_t type metadata accessor for ChallengeDescription(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A37360);
}

unint64_t sub_24F955068()
{
  unint64_t result = qword_269A366A0;
  if (!qword_269A366A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A366A0);
  }
  return result;
}

uint64_t sub_24F9550B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ChallengeState(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A37370);
}

uint64_t sub_24F95511C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F955184(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24F9551EC()
{
  unint64_t result = qword_269A366A8;
  if (!qword_269A366A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A366A8);
  }
  return result;
}

uint64_t sub_24F955238()
{
  OUTLINED_FUNCTION_113();
  v1(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_40();
  v2();
  return v0;
}

uint64_t sub_24F955290(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_2();
  v3();
  return a1;
}

unint64_t sub_24F9552E8()
{
  unint64_t result = qword_269A366B0;
  if (!qword_269A366B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A366B0);
  }
  return result;
}

uint64_t type metadata accessor for ChallengeInvite.Details(uint64_t a1)
{
  return sub_24F95558C(a1, qword_269A37390);
}

uint64_t sub_24F955354(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_2();
  v3();
  return a1;
}

unint64_t sub_24F9553A8()
{
  unint64_t result = qword_269A366B8;
  if (!qword_269A366B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A366B8);
  }
  return result;
}

unint64_t sub_24F9553F4()
{
  unint64_t result = qword_269A366C0;
  if (!qword_269A366C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A366C0);
  }
  return result;
}

unint64_t sub_24F955440()
{
  unint64_t result = qword_269A366C8;
  if (!qword_269A366C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A366C8);
  }
  return result;
}

uint64_t sub_24F95548C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_24F955508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ChallengeInvite.Details(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ChallengeInvite(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A37380);
}

uint64_t sub_24F95558C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24F9555C0()
{
  unint64_t result = qword_269A366D0[0];
  if (!qword_269A366D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A366D0);
  }
  return result;
}

unint64_t sub_24F955610()
{
  unint64_t result = qword_269A355A8;
  if (!qword_269A355A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A355A8);
  }
  return result;
}

unint64_t sub_24F955660()
{
  unint64_t result = qword_269A355B0;
  if (!qword_269A355B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A355B0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ChallengeFilter(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F9557F8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F9556C4);
}

uint64_t sub_24F9556C4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ChallengeFilter(uint64_t a1)
{
  return sub_24F9556EC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24F9556EC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for ChallengeFilter(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F955874(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F9556C4, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F9556EC);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for ChallengeFilter(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_24F9558F8(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F9556EC);
}

uint64_t sub_24F955764(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_24F95577C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for ChallengeFilter()
{
}

uint64_t initializeBufferWithCopyOfBuffer for ChallengeInviteFilter(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F9557F8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F9557B8);
}

uint64_t sub_24F9557B8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ChallengeInviteFilter(uint64_t a1)
{
  return sub_24F9557E0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24F9557E0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24F9557F8(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for ChallengeInviteFilter(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F955874(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F9557B8, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F9557E0);
}

uint64_t *sub_24F955874(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for ChallengeInviteFilter(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_24F9558F8(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F9557E0);
}

uint64_t *sub_24F9558F8(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t _s21GameServicesProtocols15ChallengeFilterOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return OUTLINED_FUNCTION_11_0(*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 > 3) {
    return OUTLINED_FUNCTION_11_0(v3 ^ 0xFF);
  }
  else {
    return OUTLINED_FUNCTION_11_0(-1);
  }
}

uint64_t _s21GameServicesProtocols15ChallengeFilterOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24F9559C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24F9559CC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void type metadata accessor for ChallengeInviteFilter()
{
}

uint64_t dispatch thunk of ChallengeServiceProtocol.describe(challenges:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.createChallenge(creator:leaderboard:duration:attemptLimit:players:previousChallenge:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a12 + 24) + **(int **)(a12 + 24));
  uint64_t v15 = a6 & 1;
  uint64_t v16 = a8 & 1;
  uint64_t v17 = swift_task_alloc();
  uint64_t v18 = (void *)OUTLINED_FUNCTION_34(v17);
  *uint64_t v18 = v19;
  v18[1] = sub_24F955C0C;
  return v21(a1, a2, a3, a4, a5, v15, a7, v16, a9, a10, a11, a12);
}

uint64_t sub_24F955C0C()
{
  OUTLINED_FUNCTION_44();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of ChallengeServiceProtocol.leave(challenges:for:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_10_1();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.listChallengeStates(player:challenges:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F955E9C;
  uint64_t v3 = OUTLINED_FUNCTION_10_1();
  return v4(v3);
}

uint64_t sub_24F955E9C(uint64_t a1)
{
  OUTLINED_FUNCTION_44();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.listChallenges(player:filters:after:)()
{
  OUTLINED_FUNCTION_73();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A308;
  uint64_t v3 = OUTLINED_FUNCTION_58();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.listParticipantStates(player:challenges:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_10_1();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.sendInvites(player:challenge:to:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_92();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  OUTLINED_FUNCTION_117();
  return v3();
}

uint64_t dispatch thunk of ChallengeServiceProtocol.createInvite(player:challenge:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_92();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A308;
  OUTLINED_FUNCTION_117();
  return v3();
}

uint64_t dispatch thunk of ChallengeServiceProtocol.describeInvites(invites:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.listInvites(player:filters:after:)()
{
  OUTLINED_FUNCTION_73();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A308;
  uint64_t v3 = OUTLINED_FUNCTION_58();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.listInviteStates(player:invites:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_10_1();
  return v4(v3);
}

uint64_t dispatch thunk of ChallengeServiceProtocol.accept(player:invite:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A308;
  uint64_t v3 = OUTLINED_FUNCTION_10_1();
  return v4(v3);
}

uint64_t *initializeBufferWithCopyOfBuffer for ChallengeDescription(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_31(*a2);
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = a2[7];
    a1[6] = a2[6];
    a1[7] = v9;
    uint64_t v10 = a2[9];
    uint64_t v11 = *(int *)(v4 + 36);
    uint64_t v26 = (uint64_t)a2 + v11;
    uint64_t v27 = (uint64_t)a1 + v11;
    a1[8] = a2[8];
    a1[9] = v10;
    sub_24F98DFB8();
    OUTLINED_FUNCTION_4_2();
    uint64_t v25 = *(void *)(v12 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = swift_bridgeObjectRetain();
    uint64_t v21 = OUTLINED_FUNCTION_107(v13, v14, v15, v16, v17, v18, v19, v20, v24, v25, v26, v27);
    v22(v21);
    OUTLINED_FUNCTION_50();
  }
  return a1;
}

uint64_t destroy for ChallengeDescription()
{
  OUTLINED_FUNCTION_114();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return v1(v0);
}

void *initializeWithCopy for ChallengeDescription(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[9];
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v24 = (uint64_t)a2 + v9;
  uint64_t v25 = (uint64_t)a1 + v9;
  a1[8] = a2[8];
  a1[9] = v8;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  uint64_t v23 = *(void *)(v10 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v19 = OUTLINED_FUNCTION_107(v11, v12, v13, v14, v15, v16, v17, v18, v22, v23, v24, v25);
  v20(v19);
  OUTLINED_FUNCTION_50();
  return a1;
}

void *assignWithCopy for ChallengeDescription(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_39(a1, a2);
  swift_bridgeObjectRelease();
  v3[2] = a2[2];
  v3[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[4] = a2[4];
  v3[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[6] = a2[6];
  v3[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[8] = a2[8];
  uint64_t v7 = v3[9];
  v3[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v7, v4);
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = (void *)((char *)v3 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  uint64_t v12 = *(int *)(a3 + 44);
  uint64_t v13 = (char *)v3 + v12;
  uint64_t v14 = (char *)a2 + v12;
  char v15 = v14[8];
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v15;
  return v3;
}

_OWORD *initializeWithTake for ChallengeDescription(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v8();
  uint64_t v9 = *(int *)(a3 + 44);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  v10[8] = v11[8];
  *(void *)uint64_t v10 = *(void *)v11;
  return a1;
}

void *assignWithTake for ChallengeDescription(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_80(a1, a2);
  uint64_t v8 = a2[3];
  v3[2] = a2[2];
  v3[3] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[5];
  v3[4] = a2[4];
  v3[5] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[7];
  v3[6] = a2[6];
  v3[7] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[9];
  v3[8] = a2[8];
  v3[9] = v11;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_126();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v12 + 40))(v4, v5);
  uint64_t v13 = *(int *)(a3 + 44);
  *(_OWORD *)((char *)v3 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  uint64_t v14 = (char *)v3 + v13;
  char v15 = (char *)a2 + v13;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  return v3;
}

uint64_t getEnumTagSinglePayload for ChallengeDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F956BFC);
}

uint64_t sub_24F956BFC()
{
  OUTLINED_FUNCTION_112();
  if (v3) {
    return OUTLINED_FUNCTION_45();
  }
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = sub_24F98DFB8();
  uint64_t v8 = v0 + *(int *)(v5 + 36);
  return __swift_getEnumTagSinglePayload(v8, v6, v7);
}

uint64_t storeEnumTagSinglePayload for ChallengeDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F956C80);
}

void sub_24F956C80()
{
  OUTLINED_FUNCTION_81();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    sub_24F98DFB8();
    uint64_t v5 = OUTLINED_FUNCTION_108(*(int *)(v4 + 36));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

uint64_t sub_24F956CEC()
{
  uint64_t result = sub_24F98DFB8();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_116();
    swift_initStructMetadata();
    return OUTLINED_FUNCTION_142();
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ChallengeState(uint64_t *a1)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_31(*v2);
  }
  else
  {
    uint64_t v4 = v2[1];
    *a1 = *v2;
    a1[1] = v4;
    uint64_t v5 = v2[3];
    a1[2] = v2[2];
    a1[3] = v5;
    uint64_t v6 = v2[5];
    a1[4] = v2[4];
    a1[5] = v6;
    sub_24F98DFB8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (OUTLINED_FUNCTION_49())
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v8 = OUTLINED_FUNCTION_15_0(v7);
      OUTLINED_FUNCTION_115(v8, v10, *(void *)(v9 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v11();
      OUTLINED_FUNCTION_33();
    }
  }
  return a1;
}

uint64_t destroy for ChallengeState()
{
  OUTLINED_FUNCTION_114();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_24F98DFB8();
  uint64_t result = OUTLINED_FUNCTION_75(v0);
  if (!result)
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v2 = OUTLINED_FUNCTION_8_0();
    return v3(v2);
  }
  return result;
}

void *initializeWithCopy for ChallengeState(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  sub_24F98DFB8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (OUTLINED_FUNCTION_49())
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v7 = OUTLINED_FUNCTION_15_0(v6);
    OUTLINED_FUNCTION_115(v7, v9, *(void *)(v8 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_40();
    v10();
    OUTLINED_FUNCTION_33();
  }
  return a1;
}

void *assignWithCopy for ChallengeState(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_39(a1, a2);
  swift_bridgeObjectRelease();
  v3[2] = a2[2];
  v3[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[4] = a2[4];
  v3[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = OUTLINED_FUNCTION_136();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a3, 1, v6);
  int v8 = OUTLINED_FUNCTION_49();
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v10)
    {
      uint64_t v18 = OUTLINED_FUNCTION_138();
      v19(v18);
      return v3;
    }
    uint64_t v11 = OUTLINED_FUNCTION_135();
    v12(v11);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v14 = OUTLINED_FUNCTION_15_0(v13);
    OUTLINED_FUNCTION_115(v14, v16, *(void *)(v15 + 64));
    return v3;
  }
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_40();
  v9();
  OUTLINED_FUNCTION_33();
  return v3;
}

_OWORD *initializeWithTake for ChallengeState(_OWORD *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_24F98DFB8();
  if (OUTLINED_FUNCTION_49())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v5 = OUTLINED_FUNCTION_15_0(v4);
    OUTLINED_FUNCTION_115(v5, v7, *(void *)(v6 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_59();
    v8();
    OUTLINED_FUNCTION_33();
  }
  return a1;
}

void *assignWithTake for ChallengeState(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_80(a1, a2);
  uint64_t v6 = a2[3];
  v3[2] = a2[2];
  v3[3] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[5];
  v3[4] = a2[4];
  v3[5] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = OUTLINED_FUNCTION_136();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a3, 1, v8);
  int v10 = OUTLINED_FUNCTION_49();
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v12)
    {
      uint64_t v20 = OUTLINED_FUNCTION_138();
      v21(v20);
      return v3;
    }
    uint64_t v13 = OUTLINED_FUNCTION_135();
    v14(v13);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v16 = OUTLINED_FUNCTION_15_0(v15);
    OUTLINED_FUNCTION_115(v16, v18, *(void *)(v17 + 64));
    return v3;
  }
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v11();
  OUTLINED_FUNCTION_33();
  return v3;
}

uint64_t getEnumTagSinglePayload for ChallengeState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F9572F4);
}

uint64_t sub_24F9572F4()
{
  OUTLINED_FUNCTION_112();
  if (v3) {
    return OUTLINED_FUNCTION_45();
  }
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v8 = v0 + *(int *)(v5 + 28);
  return __swift_getEnumTagSinglePayload(v8, v6, v7);
}

uint64_t storeEnumTagSinglePayload for ChallengeState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F95737C);
}

void sub_24F95737C()
{
  OUTLINED_FUNCTION_81();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v5 = OUTLINED_FUNCTION_108(*(int *)(v4 + 28));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

void sub_24F9573EC()
{
  sub_24F957484();
  if (v0 <= 0x3F)
  {
    OUTLINED_FUNCTION_116();
    swift_initStructMetadata();
    OUTLINED_FUNCTION_142();
  }
}

void sub_24F957484()
{
  if (!qword_269A35618)
  {
    sub_24F98DFB8();
    unint64_t v0 = sub_24F98E2C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A35618);
    }
  }
}

void type metadata accessor for ChallengeLeaveResult()
{
}

uint64_t destroy for ChallengeParticipantState()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ChallengeParticipantState(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v6;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ChallengeParticipantState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v4;
  uint64_t v5 = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 88) = v5;
  return a1;
}

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t assignWithTake for ChallengeParticipantState()
{
  OUTLINED_FUNCTION_113();
  uint64_t v3 = v2[1];
  *(void *)uint64_t v1 = *v2;
  *(void *)(v1 + 8) = v3;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 24);
  *(void *)(v1 + 16) = *(void *)(v0 + 16);
  *(void *)(v1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 40);
  *(void *)(v1 + 32) = *(void *)(v0 + 32);
  *(void *)(v1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 64) = *(void *)(v0 + 64);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = *(void *)(v0 + 72);
  *(unsigned char *)(v1 + 80) = *(unsigned char *)(v0 + 80);
  *(void *)(v1 + 88) = *(void *)(v0 + 88);
  *(unsigned char *)(v1 + 96) = *(unsigned char *)(v0 + 96);
  return v1;
}

uint64_t getEnumTagSinglePayload for ChallengeParticipantState(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 97))
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

uint64_t storeEnumTagSinglePayload for ChallengeParticipantState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 97) = 1;
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
    *(unsigned char *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ChallengeParticipantState()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for ChallengeInvite(uint64_t *a1)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_31(*v2);
  }
  else
  {
    uint64_t v5 = v2[1];
    *a1 = *v2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(v3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (uint64_t *)((char *)v2 + v6);
    type metadata accessor for ChallengeInvite.Details(0);
    swift_bridgeObjectRetain();
    swift_getEnumCaseMultiPayload();
    OUTLINED_FUNCTION_129();
    if (v9)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      int v10 = (void *)v8[3];
      *((void *)v7 + 2) = v8[2];
      *((void *)v7 + 3) = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
      uint64_t v11 = OUTLINED_FUNCTION_64();
      if (OUTLINED_FUNCTION_74(v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
        OUTLINED_FUNCTION_15_0(v13);
        memcpy(v10, v8, *(void *)(v14 + 64));
      }
      else
      {
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_40();
        v15();
        OUTLINED_FUNCTION_55((uint64_t)v10);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ChallengeInvite()
{
  OUTLINED_FUNCTION_114();
  type metadata accessor for ChallengeInvite.Details(0);
  OUTLINED_FUNCTION_5_2();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload != 1)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    uint64_t v2 = sub_24F98DFB8();
    uint64_t result = OUTLINED_FUNCTION_75(v2);
    if (!result)
    {
      OUTLINED_FUNCTION_4_2();
      uint64_t v3 = OUTLINED_FUNCTION_8_0();
      return v4(v3);
    }
  }
  return result;
}

void *initializeWithCopy for ChallengeInvite(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (void *)((char *)a2 + v5);
  type metadata accessor for ChallengeInvite.Details(0);
  swift_bridgeObjectRetain();
  swift_getEnumCaseMultiPayload();
  OUTLINED_FUNCTION_129();
  if (v8)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    char v9 = (void *)v7[3];
    *((void *)v6 + 2) = v7[2];
    *((void *)v6 + 3) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    uint64_t v10 = OUTLINED_FUNCTION_64();
    if (OUTLINED_FUNCTION_74(v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      OUTLINED_FUNCTION_15_0(v12);
      memcpy(v9, v7, *(void *)(v13 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v14();
      OUTLINED_FUNCTION_55((uint64_t)v9);
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ChallengeInvite(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_39(a1, a2);
  swift_bridgeObjectRelease();
  if (v3 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)v3 + v6);
    char v8 = (void *)((char *)a2 + v6);
    sub_24F955290((uint64_t)v3 + v6, (void (*)(void))type metadata accessor for ChallengeInvite.Details);
    type metadata accessor for ChallengeInvite.Details(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v7 = *v8;
    v7[1] = v8[1];
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v7[2] = v8[2];
      uint64_t v10 = (void *)v8[3];
      v7[3] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
      uint64_t v11 = OUTLINED_FUNCTION_64();
      if (OUTLINED_FUNCTION_74(v11))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
        OUTLINED_FUNCTION_15_0(v12);
        memcpy(v10, v8, *(void *)(v13 + 64));
      }
      else
      {
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_40();
        v14();
        OUTLINED_FUNCTION_55((uint64_t)v10);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

_OWORD *initializeWithTake for ChallengeInvite(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (_OWORD *)((char *)a1 + v5);
  uint64_t v7 = (_OWORD *)((char *)a2 + v5);
  uint64_t v8 = type metadata accessor for ChallengeInvite.Details(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    long long v9 = v7[1];
    *uint64_t v6 = *v7;
    v6[1] = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    uint64_t v10 = OUTLINED_FUNCTION_119();
    if (OUTLINED_FUNCTION_132(v10))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      OUTLINED_FUNCTION_15_0(v11);
      memcpy(v3, v7, *(void *)(v12 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_59();
      v13();
      OUTLINED_FUNCTION_55((uint64_t)v3);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for ChallengeInvite(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_80(a1, a2);
  if (v3 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (_OWORD *)((char *)v3 + v7);
    long long v9 = (_OWORD *)((char *)a2 + v7);
    sub_24F955290((uint64_t)v3 + v7, (void (*)(void))type metadata accessor for ChallengeInvite.Details);
    uint64_t v10 = type metadata accessor for ChallengeInvite.Details(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      long long v11 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
      uint64_t v12 = OUTLINED_FUNCTION_119();
      if (OUTLINED_FUNCTION_132(v12))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
        OUTLINED_FUNCTION_15_0(v13);
        memcpy(v4, v9, *(void *)(v14 + 64));
      }
      else
      {
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_59();
        v15();
        OUTLINED_FUNCTION_55((uint64_t)v4);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return v3;
}

uint64_t getEnumTagSinglePayload for ChallengeInvite(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F957EA4);
}

uint64_t sub_24F957EA4()
{
  OUTLINED_FUNCTION_112();
  if (v3) {
    return OUTLINED_FUNCTION_45();
  }
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  uint64_t v7 = type metadata accessor for ChallengeInvite.Details(0);
  uint64_t v8 = v0 + *(int *)(v5 + 20);
  return __swift_getEnumTagSinglePayload(v8, v6, v7);
}

uint64_t storeEnumTagSinglePayload for ChallengeInvite(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F957F28);
}

void sub_24F957F28()
{
  OUTLINED_FUNCTION_81();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    type metadata accessor for ChallengeInvite.Details(0);
    uint64_t v5 = OUTLINED_FUNCTION_108(*(int *)(v4 + 20));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

uint64_t sub_24F957F94()
{
  uint64_t result = type metadata accessor for ChallengeInvite.Details(319);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_116();
    swift_initStructMetadata();
    return OUTLINED_FUNCTION_142();
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ChallengeInvite.Details(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_31(*a2);
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_8_0();
    }
    else
    {
      uint64_t v7 = (void *)a2[3];
      a1[2] = a2[2];
      a1[3] = (uint64_t)v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
      uint64_t v8 = OUTLINED_FUNCTION_120();
      if (OUTLINED_FUNCTION_137(v8))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
        OUTLINED_FUNCTION_15_0(v9);
        memcpy(v7, a2, *(void *)(v10 + 64));
      }
      else
      {
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_40();
        v11();
        OUTLINED_FUNCTION_54((uint64_t)v7);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ChallengeInvite.Details()
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload != 1)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    uint64_t v2 = sub_24F98DFB8();
    uint64_t result = OUTLINED_FUNCTION_75(v2);
    if (!result)
    {
      OUTLINED_FUNCTION_4_2();
      uint64_t v3 = OUTLINED_FUNCTION_8_0();
      return v4(v3);
    }
  }
  return result;
}

void *initializeWithCopy for ChallengeInvite.Details()
{
  int v2 = OUTLINED_FUNCTION_105();
  uint64_t v3 = v1[1];
  *int v0 = *v1;
  v0[1] = v3;
  if (v2 == 1)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v4 = (void *)v1[3];
    v0[2] = v1[2];
    v0[3] = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    uint64_t v5 = OUTLINED_FUNCTION_63();
    if (OUTLINED_FUNCTION_77(v5))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      OUTLINED_FUNCTION_15_0(v6);
      memcpy(v4, v1, *(void *)(v7 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v8();
      OUTLINED_FUNCTION_54((uint64_t)v4);
    }
  }
  swift_storeEnumTagMultiPayload();
  return v0;
}

void *assignWithCopy for ChallengeInvite.Details(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_24F955290((uint64_t)a1, (void (*)(void))type metadata accessor for ChallengeInvite.Details);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    if (EnumCaseMultiPayload == 1)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      a1[2] = a2[2];
      uint64_t v5 = (void *)a2[3];
      a1[3] = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
      uint64_t v6 = OUTLINED_FUNCTION_120();
      if (OUTLINED_FUNCTION_137(v6))
      {
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
        OUTLINED_FUNCTION_15_0(v7);
        memcpy(v5, a2, *(void *)(v8 + 64));
      }
      else
      {
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_40();
        v9();
        OUTLINED_FUNCTION_54((uint64_t)v5);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for ChallengeInvite.Details()
{
  if (OUTLINED_FUNCTION_105())
  {
    memcpy(v0, v3, *(void *)(*(void *)(v1 - 8) + 64));
  }
  else
  {
    long long v4 = v3[1];
    *int v0 = *v3;
    v0[1] = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
    uint64_t v5 = OUTLINED_FUNCTION_63();
    if (OUTLINED_FUNCTION_77(v5))
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      OUTLINED_FUNCTION_15_0(v6);
      memcpy(v2, v3, *(void *)(v7 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_59();
      v8();
      OUTLINED_FUNCTION_54((uint64_t)v2);
    }
    swift_storeEnumTagMultiPayload();
  }
  return v0;
}

_OWORD *assignWithTake for ChallengeInvite.Details(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24F955290((uint64_t)a1, (void (*)(void))type metadata accessor for ChallengeInvite.Details);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      long long v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35530);
      uint64_t v8 = OUTLINED_FUNCTION_63();
      if (OUTLINED_FUNCTION_77(v8))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
        OUTLINED_FUNCTION_15_0(v9);
        memcpy(v3, a2, *(void *)(v10 + 64));
      }
      else
      {
        OUTLINED_FUNCTION_4_2();
        OUTLINED_FUNCTION_59();
        v11();
        OUTLINED_FUNCTION_54((uint64_t)v3);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24F95862C()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_24F95863C()
{
  sub_24F957484();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v1[4] = v1;
    v1[5] = &unk_24F991218;
    swift_initEnumMetadataMultiPayload();
    OUTLINED_FUNCTION_142();
  }
}

void type metadata accessor for ChallengeInviteState()
{
}

unsigned char *sub_24F958704(unsigned char *a1, char a2)
{
  return OUTLINED_FUNCTION_62(a1, a2 & 1);
}

void type metadata accessor for ChallengeInvite.CodingKeys()
{
}

uint64_t _s21GameServicesProtocols22LeaderboardPlayerScopeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 2);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

unsigned char *sub_24F95879C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F958858);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for ChallengeInvite.Details.CodingKeys()
{
}

uint64_t _s21GameServicesProtocols20ChallengeLeaveResultOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 3);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

unsigned char *_s21GameServicesProtocols20ChallengeLeaveResultOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F9589CCLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 2);
        break;
    }
  }
  return result;
}

void type metadata accessor for ChallengeInvite.Details.PlayerCodingKeys()
{
}

void type metadata accessor for ChallengeInvite.Details.CodeCodingKeys()
{
}

uint64_t sub_24F958A1C(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 7);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 7);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 7);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

unsigned char *sub_24F958AA0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F958B5CLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 6);
        break;
    }
  }
  return result;
}

void type metadata accessor for ChallengeParticipantState.CodingKeys()
{
}

void type metadata accessor for ChallengeState.CodingKeys()
{
}

uint64_t _s21GameServicesProtocols20ChallengeInviteStateOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 8);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 8);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 8);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

unsigned char *_s21GameServicesProtocols20ChallengeInviteStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F958CE4);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 7);
        break;
    }
  }
  return result;
}

void type metadata accessor for ChallengeDescription.CodingKeys()
{
}

uint64_t _s21GameServicesProtocols11AgeCategoryOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 4);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

unsigned char *sub_24F958D9C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F958E58);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 3);
        break;
    }
  }
  return result;
}

void type metadata accessor for ChallengeInviteFilter.CodingKeys()
{
}

void type metadata accessor for ChallengeInviteFilter.ChallengeCodingKeys()
{
}

void type metadata accessor for ChallengeInviteFilter.GameCodingKeys()
{
}

void type metadata accessor for ChallengeInviteFilter.FromCodingKeys()
{
}

void type metadata accessor for ChallengeInviteFilter.ToCodingKeys()
{
}

uint64_t sub_24F958EBC(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 6);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 6);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 8)) - 6);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

unsigned char *sub_24F958F40(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F958FFCLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 5);
        break;
    }
  }
  return result;
}

void type metadata accessor for ChallengeFilter.CodingKeys()
{
}

void type metadata accessor for ChallengeFilter.ChallengeCodingKeys()
{
}

void type metadata accessor for ChallengeFilter.GameCodingKeys()
{
}

uint64_t _s21GameServicesProtocols11GameHistoryV14InstallHistoryV6SourceOwet_0(unsigned __int8 *a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_48();
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
    return *(unsigned int *)a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return OUTLINED_FUNCTION_66(a1);
}

unsigned char *sub_24F959090(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F95912CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for ChallengeFilter.ParticipantCodingKeys()
{
}

void type metadata accessor for ChallengeFilter.ActiveCodingKeys()
{
}

void type metadata accessor for ChallengeFilter.CompleteCodingKeys()
{
}

void type metadata accessor for ChallengeFilter.WonCodingKeys()
{
}

unint64_t sub_24F959188()
{
  unint64_t result = qword_269A377A0[0];
  if (!qword_269A377A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A377A0);
  }
  return result;
}

unint64_t sub_24F9591D8()
{
  unint64_t result = qword_269A379B0[0];
  if (!qword_269A379B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A379B0);
  }
  return result;
}

unint64_t sub_24F959228()
{
  unint64_t result = qword_269A37BC0[0];
  if (!qword_269A37BC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A37BC0);
  }
  return result;
}

unint64_t sub_24F959278()
{
  unint64_t result = qword_269A37DD0[0];
  if (!qword_269A37DD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A37DD0);
  }
  return result;
}

unint64_t sub_24F9592C8()
{
  unint64_t result = qword_269A37FE0[0];
  if (!qword_269A37FE0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A37FE0);
  }
  return result;
}

unint64_t sub_24F959318()
{
  unint64_t result = qword_269A381F0;
  if (!qword_269A381F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A381F0);
  }
  return result;
}

unint64_t sub_24F959368()
{
  unint64_t result = qword_269A38400[0];
  if (!qword_269A38400[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A38400);
  }
  return result;
}

unint64_t sub_24F9593B8()
{
  unint64_t result = qword_269A38610[0];
  if (!qword_269A38610[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A38610);
  }
  return result;
}

unint64_t sub_24F959408()
{
  unint64_t result = qword_269A38820[0];
  if (!qword_269A38820[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A38820);
  }
  return result;
}

unint64_t sub_24F959458()
{
  unint64_t result = qword_269A38A30[0];
  if (!qword_269A38A30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A38A30);
  }
  return result;
}

unint64_t sub_24F9594A8()
{
  unint64_t result = qword_269A38C40[0];
  if (!qword_269A38C40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A38C40);
  }
  return result;
}

unint64_t sub_24F9594F8()
{
  unint64_t result = qword_269A38E50[0];
  if (!qword_269A38E50[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A38E50);
  }
  return result;
}

unint64_t sub_24F959548()
{
  unint64_t result = qword_269A39060[0];
  if (!qword_269A39060[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39060);
  }
  return result;
}

unint64_t sub_24F959598()
{
  unint64_t result = qword_269A39270[0];
  if (!qword_269A39270[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39270);
  }
  return result;
}

unint64_t sub_24F9595E8()
{
  unint64_t result = qword_269A39480[0];
  if (!qword_269A39480[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39480);
  }
  return result;
}

unint64_t sub_24F959638()
{
  unint64_t result = qword_269A39690[0];
  if (!qword_269A39690[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39690);
  }
  return result;
}

unint64_t sub_24F959688()
{
  unint64_t result = qword_269A397A0;
  if (!qword_269A397A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A397A0);
  }
  return result;
}

unint64_t sub_24F9596D8()
{
  unint64_t result = qword_269A397A8[0];
  if (!qword_269A397A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A397A8);
  }
  return result;
}

unint64_t sub_24F959728()
{
  unint64_t result = qword_269A39830;
  if (!qword_269A39830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39830);
  }
  return result;
}

unint64_t sub_24F959778()
{
  unint64_t result = qword_269A39838[0];
  if (!qword_269A39838[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39838);
  }
  return result;
}

unint64_t sub_24F9597C8()
{
  unint64_t result = qword_269A398C0;
  if (!qword_269A398C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A398C0);
  }
  return result;
}

unint64_t sub_24F959818()
{
  unint64_t result = qword_269A398C8[0];
  if (!qword_269A398C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A398C8);
  }
  return result;
}

unint64_t sub_24F959868()
{
  unint64_t result = qword_269A39950;
  if (!qword_269A39950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39950);
  }
  return result;
}

unint64_t sub_24F9598B8()
{
  unint64_t result = qword_269A39958[0];
  if (!qword_269A39958[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39958);
  }
  return result;
}

unint64_t sub_24F959908()
{
  unint64_t result = qword_269A399E0;
  if (!qword_269A399E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A399E0);
  }
  return result;
}

unint64_t sub_24F959958()
{
  unint64_t result = qword_269A399E8[0];
  if (!qword_269A399E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A399E8);
  }
  return result;
}

unint64_t sub_24F9599A8()
{
  unint64_t result = qword_269A39A70;
  if (!qword_269A39A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39A70);
  }
  return result;
}

unint64_t sub_24F9599F8()
{
  unint64_t result = qword_269A39A78;
  if (!qword_269A39A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39A78);
  }
  return result;
}

unint64_t sub_24F959A48()
{
  unint64_t result = qword_269A39B00;
  if (!qword_269A39B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39B00);
  }
  return result;
}

unint64_t sub_24F959A98()
{
  unint64_t result = qword_269A39B08[0];
  if (!qword_269A39B08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39B08);
  }
  return result;
}

unint64_t sub_24F959AE8()
{
  unint64_t result = qword_269A39B90;
  if (!qword_269A39B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39B90);
  }
  return result;
}

unint64_t sub_24F959B38()
{
  unint64_t result = qword_269A39B98[0];
  if (!qword_269A39B98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39B98);
  }
  return result;
}

unint64_t sub_24F959B88()
{
  unint64_t result = qword_269A39C20;
  if (!qword_269A39C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39C20);
  }
  return result;
}

unint64_t sub_24F959BD8()
{
  unint64_t result = qword_269A39C28[0];
  if (!qword_269A39C28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39C28);
  }
  return result;
}

unint64_t sub_24F959C28()
{
  unint64_t result = qword_269A39CB0;
  if (!qword_269A39CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39CB0);
  }
  return result;
}

unint64_t sub_24F959C78()
{
  unint64_t result = qword_269A39CB8[0];
  if (!qword_269A39CB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39CB8);
  }
  return result;
}

unint64_t sub_24F959CC8()
{
  unint64_t result = qword_269A39D40;
  if (!qword_269A39D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39D40);
  }
  return result;
}

unint64_t sub_24F959D18()
{
  unint64_t result = qword_269A39D48[0];
  if (!qword_269A39D48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39D48);
  }
  return result;
}

unint64_t sub_24F959D68()
{
  unint64_t result = qword_269A39DD0;
  if (!qword_269A39DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39DD0);
  }
  return result;
}

unint64_t sub_24F959DB8()
{
  unint64_t result = qword_269A39DD8[0];
  if (!qword_269A39DD8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39DD8);
  }
  return result;
}

unint64_t sub_24F959E08()
{
  unint64_t result = qword_269A39E60;
  if (!qword_269A39E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39E60);
  }
  return result;
}

unint64_t sub_24F959E58()
{
  unint64_t result = qword_269A39E68[0];
  if (!qword_269A39E68[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39E68);
  }
  return result;
}

unint64_t sub_24F959EA8()
{
  unint64_t result = qword_269A39EF0;
  if (!qword_269A39EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39EF0);
  }
  return result;
}

unint64_t sub_24F959EF8()
{
  unint64_t result = qword_269A39EF8[0];
  if (!qword_269A39EF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39EF8);
  }
  return result;
}

unint64_t sub_24F959F48()
{
  unint64_t result = qword_269A39F80;
  if (!qword_269A39F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A39F80);
  }
  return result;
}

unint64_t sub_24F959F98()
{
  unint64_t result = qword_269A39F88[0];
  if (!qword_269A39F88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A39F88);
  }
  return result;
}

unint64_t sub_24F959FE8()
{
  unint64_t result = qword_269A3A010;
  if (!qword_269A3A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A010);
  }
  return result;
}

unint64_t sub_24F95A038()
{
  unint64_t result = qword_269A3A018[0];
  if (!qword_269A3A018[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3A018);
  }
  return result;
}

unint64_t sub_24F95A088()
{
  unint64_t result = qword_269A3A0A0;
  if (!qword_269A3A0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A0A0);
  }
  return result;
}

unint64_t sub_24F95A0D8()
{
  unint64_t result = qword_269A3A0A8[0];
  if (!qword_269A3A0A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3A0A8);
  }
  return result;
}

unint64_t sub_24F95A128()
{
  unint64_t result = qword_269A3A130;
  if (!qword_269A3A130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A130);
  }
  return result;
}

unint64_t sub_24F95A178()
{
  unint64_t result = qword_269A3A138[0];
  if (!qword_269A3A138[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3A138);
  }
  return result;
}

unint64_t sub_24F95A1C8()
{
  unint64_t result = qword_269A3A1C0;
  if (!qword_269A3A1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A1C0);
  }
  return result;
}

unint64_t sub_24F95A218()
{
  unint64_t result = qword_269A3A1C8[0];
  if (!qword_269A3A1C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3A1C8);
  }
  return result;
}

unint64_t sub_24F95A264()
{
  unint64_t result = qword_269A35620;
  if (!qword_269A35620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35620);
  }
  return result;
}

unint64_t sub_24F95A2B0()
{
  unint64_t result = qword_269A35628;
  if (!qword_269A35628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35628);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return v0;
}

void OUTLINED_FUNCTION_9_1(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return 6710642;
}

void OUTLINED_FUNCTION_12_1(unsigned char *a1@<X8>)
{
  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_24F98E468();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return 1701667175;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  *char v1 = a1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void OUTLINED_FUNCTION_36(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_37(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_38(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_39(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_45()
{
  unint64_t v1 = *(void *)(v0 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

__n128 OUTLINED_FUNCTION_50()
{
  uint64_t v3 = *(int *)(v2 + 40);
  uint64_t v4 = *(int *)(v2 + 44);
  __n128 result = *(__n128 *)(v1 + v3);
  *(__n128 *)(v0 + v3) = result;
  uint64_t v6 = v0 + v4;
  uint64_t v7 = v1 + v4;
  *(unsigned char *)(v6 + 8) = *(unsigned char *)(v7 + 8);
  *(void *)uint64_t v6 = *(void *)v7;
  return result;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return 0x676E656C6C616863;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_55(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_24F98E628();
}

unsigned char *OUTLINED_FUNCTION_62@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *__n128 result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_65@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_66_0@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_67@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

void OUTLINED_FUNCTION_68()
{
  uint64_t v1 = *(void *)(v0 - 120);
  *(void *)(v0 - 96) = *(void *)(v0 - 128);
  *(void *)(v0 - 88) = v1;
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_24F98E568();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_24F98E468();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_74(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_75(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

void *OUTLINED_FUNCTION_78()
{
  return __swift_project_boxed_opaque_existential_1(v0, v1);
}

uint64_t OUTLINED_FUNCTION_79()
{
  return sub_24F98E738();
}

uint64_t OUTLINED_FUNCTION_80(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_24F98E108();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return 0x7374706D65747461;
}

void OUTLINED_FUNCTION_85(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_86(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return 0;
}

void OUTLINED_FUNCTION_88()
{
  *(unsigned char *)(v0 - 65) = 1;
}

unint64_t OUTLINED_FUNCTION_89()
{
  return 0xD000000000000013;
}

uint64_t OUTLINED_FUNCTION_90()
{
  return sub_24F98E368();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return 0x6574656C706D6F63;
}

uint64_t OUTLINED_FUNCTION_93()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_94()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_95()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_96()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return sub_24F98E0B8();
}

uint64_t OUTLINED_FUNCTION_99()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_100()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_101()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_105()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_107(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return a12;
}

uint64_t OUTLINED_FUNCTION_108@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_109()
{
  return 1836020326;
}

uint64_t OUTLINED_FUNCTION_110()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_111()
{
  return 0xE900000000000065;
}

uint64_t OUTLINED_FUNCTION_114()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_115(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_116()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_118()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_119()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_120()
{
  return sub_24F98DFB8();
}

void OUTLINED_FUNCTION_121(char a1@<W8>)
{
  *(unsigned char *)(v1 - 80) = a1;
}

uint64_t OUTLINED_FUNCTION_123()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_124()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_126()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_129()
{
  uint64_t result = v1[1];
  *uint64_t v0 = *v1;
  v0[1] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_130()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_132(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_133()
{
  return sub_24F98E468();
}

uint64_t OUTLINED_FUNCTION_134()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_135()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_136()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_137(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_138()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_139()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_140()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_141()
{
  return sub_24F98E568();
}

uint64_t OUTLINED_FUNCTION_142()
{
  return 0;
}

uint64_t dispatch thunk of Receiver.send(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 8)
                                                                                     + **(int **)(a6 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_24F95B094;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_24F95B094()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of ReceiverWrapper.init(receiver:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static GameServiceRootProtocol.authentication.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.achievements.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.activities.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.challenges.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.friends.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.games.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.leaderboards.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.onboarding.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of GameServiceRootProtocol.profiles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 216))();
}

GameServicesProtocols::LeaderboardPlayerScope_optional __swiftcall LeaderboardPlayerScope.init(rawValue:)(Swift::String rawValue)
{
  return (GameServicesProtocols::LeaderboardPlayerScope_optional)sub_24F95BA54(v1);
}

uint64_t LeaderboardPlayerScope.rawValue.getter()
{
  if (*v0) {
    return 0x6C61626F6C67;
  }
  else {
    return 0x73646E65697266;
  }
}

uint64_t sub_24F95B294(char *a1, char *a2)
{
  return sub_24F95B454(*a1, *a2);
}

uint64_t sub_24F95B2A0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x68343274736170;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 0x6B65655774736170;
    }
    else {
      uint64_t v4 = 0x656D69546C6C61;
    }
    if (v3 == 1) {
      unint64_t v5 = 0xE800000000000000;
    }
    else {
      unint64_t v5 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v5 = 0xE700000000000000;
    uint64_t v4 = 0x68343274736170;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v2 = 0x6B65655774736170;
    }
    else {
      uint64_t v2 = 0x656D69546C6C61;
    }
    if (a2 == 1) {
      unint64_t v6 = 0xE800000000000000;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v4 == v2 && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F95B3AC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6E69727275636572;
  }
  else {
    uint64_t v3 = 0x63697373616C63;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE900000000000067;
  }
  if (a2) {
    uint64_t v5 = 0x6E69727275636572;
  }
  else {
    uint64_t v5 = 0x63697373616C63;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000067;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F95B454(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C61626F6C67;
  }
  else {
    uint64_t v3 = 0x73646E65697266;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6C61626F6C67;
  }
  else {
    uint64_t v5 = 0x73646E65697266;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F95B4F4()
{
  return sub_24F95B4FC();
}

uint64_t sub_24F95B4FC()
{
  return sub_24F95B7B8();
}

uint64_t sub_24F95B508()
{
  return sub_24F95B718();
}

uint64_t sub_24F95B514()
{
  return sub_24F95B694();
}

uint64_t sub_24F95B520()
{
  return sub_24F95B528();
}

uint64_t sub_24F95B528()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F95B590()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F95B61C()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F95B68C()
{
  return sub_24F95B7B8();
}

uint64_t sub_24F95B694()
{
  return sub_24F98E718();
}

uint64_t sub_24F95B718()
{
  return sub_24F98E718();
}

uint64_t sub_24F95B7B8()
{
  return sub_24F98E718();
}

GameServicesProtocols::LeaderboardPlayerScope_optional sub_24F95B834(Swift::String *a1)
{
  return LeaderboardPlayerScope.init(rawValue:)(*a1);
}

uint64_t sub_24F95B840@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LeaderboardPlayerScope.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F95B868()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F95B8A0()
{
  return OUTLINED_FUNCTION_98();
}

GameServicesProtocols::LeaderboardTimeScope_optional __swiftcall LeaderboardTimeScope.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  unint64_t v3 = sub_24F98E458();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *BOOL v2 = v5;
  return result;
}

uint64_t LeaderboardTimeScope.rawValue.getter()
{
  uint64_t v1 = 0x6B65655774736170;
  if (*v0 != 1) {
    uint64_t v1 = 0x656D69546C6C61;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x68343274736170;
  }
}

uint64_t sub_24F95B988(unsigned __int8 *a1, char *a2)
{
  return sub_24F95B2A0(*a1, *a2);
}

uint64_t sub_24F95B994()
{
  return sub_24F95B508();
}

uint64_t sub_24F95B99C()
{
  return sub_24F95B590();
}

uint64_t sub_24F95B9A4()
{
  return sub_24F95B718();
}

GameServicesProtocols::LeaderboardTimeScope_optional sub_24F95B9AC(Swift::String *a1)
{
  return LeaderboardTimeScope.init(rawValue:)(*a1);
}

uint64_t sub_24F95B9B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LeaderboardTimeScope.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F95B9E0()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F95BA18()
{
  return OUTLINED_FUNCTION_98();
}

GameServicesProtocols::LeaderboardType_optional __swiftcall LeaderboardType.init(rawValue:)(Swift::String rawValue)
{
  return (GameServicesProtocols::LeaderboardType_optional)sub_24F95BA54(v1);
}

uint64_t sub_24F95BA54@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24F98E458();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t LeaderboardType.rawValue.getter()
{
  if (*v0) {
    return 0x6E69727275636572;
  }
  else {
    return 0x63697373616C63;
  }
}

uint64_t sub_24F95BAF4(char *a1, char *a2)
{
  return sub_24F95B3AC(*a1, *a2);
}

uint64_t sub_24F95BB00()
{
  return sub_24F95B514();
}

uint64_t sub_24F95BB08()
{
  return sub_24F95B61C();
}

uint64_t sub_24F95BB10()
{
  return sub_24F95B694();
}

GameServicesProtocols::LeaderboardType_optional sub_24F95BB18(Swift::String *a1)
{
  return LeaderboardType.init(rawValue:)(*a1);
}

uint64_t sub_24F95BB24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LeaderboardType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F95BB4C()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F95BB84()
{
  return OUTLINED_FUNCTION_98();
}

uint64_t GameWithPlayer.game.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

uint64_t GameWithPlayer.player.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 24), a1);
}

void *GameWithPlayer.init(_:_:)@<X0>(void *result@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = result[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  *a3 = *result;
  a3[1] = v3;
  a3[2] = v4;
  a3[3] = v5;
  return result;
}

uint64_t sub_24F95BBD8(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 1701667175 && a2 == 0xE400000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    OUTLINED_FUNCTION_76_0();
    if (v4 && v2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v3) {
        return 1;
      }
      else {
        return 2;
      }
    }
  }
}

uint64_t sub_24F95BC80(char a1)
{
  if (a1) {
    return 0x726579616C70;
  }
  else {
    return 1701667175;
  }
}

uint64_t sub_24F95BCAC()
{
  return sub_24F954710();
}

uint64_t sub_24F95BCB4()
{
  return sub_24F95BC80(*v0);
}

uint64_t sub_24F95BCBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F95BBD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F95BCE4()
{
  sub_24F95BEC8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F95BD1C()
{
  sub_24F95BEC8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameWithPlayer.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35640);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F95BEC8();
  OUTLINED_FUNCTION_79();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
  sub_24F949E34(&qword_269A35418, &qword_269A35410);
  OUTLINED_FUNCTION_47_0();
  sub_24F98E628();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
    OUTLINED_FUNCTION_47_0();
    sub_24F98E628();
  }
  uint64_t v4 = OUTLINED_FUNCTION_21_0();
  v5(v4);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F95BEC8()
{
  unint64_t result = qword_269A3A250;
  if (!qword_269A3A250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A250);
  }
  return result;
}

void GameWithPlayer.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35648);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_1();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F95BEC8();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35470, &qword_269A35410);
    sub_24F98E538();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    swift_bridgeObjectRetain();
    sub_24F98E538();
    uint64_t v6 = OUTLINED_FUNCTION_74_0();
    v7(v6);
    *uint64_t v4 = v8;
    v4[1] = v9;
    v4[2] = v8;
    v4[3] = v9;
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F95C138()
{
}

void sub_24F95C150()
{
}

uint64_t RecurringLeaderboardProperties.startDate.getter()
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_8_0();
  return v1(v0);
}

uint64_t RecurringLeaderboardProperties.startDate.setter(uint64_t a1)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40);
  return v5(v1, a1, v3);
}

uint64_t (*RecurringLeaderboardProperties.startDate.modify())()
{
  return nullsub_1;
}

uint64_t RecurringLeaderboardProperties.nextStartDate.getter()
{
  return sub_24F95DDF0((void (*)(void))type metadata accessor for RecurringLeaderboardProperties);
}

uint64_t type metadata accessor for RecurringLeaderboardProperties(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A3ADF0);
}

uint64_t RecurringLeaderboardProperties.nextStartDate.setter(uint64_t a1)
{
  return sub_24F95DE9C(a1, type metadata accessor for RecurringLeaderboardProperties);
}

uint64_t (*RecurringLeaderboardProperties.nextStartDate.modify())()
{
  return nullsub_1;
}

double RecurringLeaderboardProperties.duration.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for RecurringLeaderboardProperties(0) + 24));
}

uint64_t RecurringLeaderboardProperties.duration.setter(double a1)
{
  uint64_t result = type metadata accessor for RecurringLeaderboardProperties(0);
  *(double *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*RecurringLeaderboardProperties.duration.modify())()
{
  return nullsub_1;
}

uint64_t sub_24F95C374(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x726174537478656ELL && v2 == 0xED00006574614474;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v3 == 0x6E6F697461727564 && v2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v3) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_24F95C4C4(char a1)
{
  if (!a1) {
    return 0x7461447472617473;
  }
  if (a1 == 1) {
    return 0x726174537478656ELL;
  }
  return 0x6E6F697461727564;
}

uint64_t sub_24F95C52C()
{
  return sub_24F95C4C4(*v0);
}

uint64_t sub_24F95C534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F95C374(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F95C55C()
{
  sub_24F95C740();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F95C594()
{
  sub_24F95C740();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void RecurringLeaderboardProperties.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_14_0();
  a23 = v25;
  a24 = v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35650);
  OUTLINED_FUNCTION_0_1();
  uint64_t v29 = v28;
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_50_0();
  sub_24F95C740();
  OUTLINED_FUNCTION_79();
  a14 = 0;
  sub_24F98DFB8();
  sub_24F95CB20(&qword_269A353A8, MEMORY[0x263F07490]);
  OUTLINED_FUNCTION_60();
  if (!v24)
  {
    type metadata accessor for RecurringLeaderboardProperties(0);
    a13 = 1;
    OUTLINED_FUNCTION_60();
    a12 = 2;
    sub_24F98E5F8();
  }
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v27);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F95C740()
{
  unint64_t result = qword_269A3A258;
  if (!qword_269A3A258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A258);
  }
  return result;
}

uint64_t RecurringLeaderboardProperties.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v33 = sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v30 = v5;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v32 = (char *)&v26 - v10;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35658);
  OUTLINED_FUNCTION_0_1();
  uint64_t v31 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_24_0();
  uint64_t v13 = type metadata accessor for RecurringLeaderboardProperties(0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F95C740();
  sub_24F98E728();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v27 = v3;
  uint64_t v28 = a1;
  uint64_t v26 = v13;
  char v37 = 0;
  sub_24F95CB20(&qword_269A353C8, MEMORY[0x263F07490]);
  uint64_t v15 = v32;
  uint64_t v16 = v33;
  OUTLINED_FUNCTION_58_0();
  uint64_t v32 = *(char **)(v30 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v32)(v27, v15, v16);
  char v36 = 1;
  uint64_t v17 = v9;
  OUTLINED_FUNCTION_58_0();
  uint64_t v19 = v26;
  uint64_t v18 = v27;
  ((void (*)(uint64_t, char *, uint64_t))v32)(v27 + *(int *)(v26 + 20), v17, v16);
  char v35 = 2;
  sub_24F98E508();
  uint64_t v20 = v18;
  uint64_t v21 = (uint64_t)v28;
  uint64_t v23 = v22;
  OUTLINED_FUNCTION_2_2();
  v24();
  *(void *)(v20 + *(int *)(v19 + 24)) = v23;
  sub_24F95DCBC(v20, v29, (void (*)(void))type metadata accessor for RecurringLeaderboardProperties);
  __swift_destroy_boxed_opaque_existential_1(v21);
  return sub_24F95DD18(v20, (void (*)(void))type metadata accessor for RecurringLeaderboardProperties);
}

uint64_t sub_24F95CB20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F95CB68(double a1)
{
  OUTLINED_FUNCTION_113();
  uint64_t v3 = v2;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = *(void (**)(void))(v4 + 32);
  OUTLINED_FUNCTION_42_0();
  v5();
  uint64_t v6 = type metadata accessor for RecurringLeaderboardProperties(0);
  OUTLINED_FUNCTION_42_0();
  uint64_t result = ((uint64_t (*)(void))v5)();
  *(double *)(v3 + *(int *)(v6 + 24)) = a1;
  return result;
}

uint64_t sub_24F95CC00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RecurringLeaderboardProperties.init(from:)(a1, a2);
}

#error "24F95CC24: call analysis failed (funcsize=6)"

uint64_t LeaderboardDescription.baseLeaderboardId.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t LeaderboardDescription.baseLeaderboardId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LeaderboardDescription.baseLeaderboardId.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardDescription.groupId.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t LeaderboardDescription.groupId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*LeaderboardDescription.groupId.modify())()
{
  return nullsub_1;
}

uint64_t sub_24F95CD38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for RecurringLeaderboardProperties(0);
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t LeaderboardDescription.recurringProperties.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LeaderboardDescription(0) + 24);
  return sub_24F95CDE4(v3, a1);
}

uint64_t type metadata accessor for LeaderboardDescription(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A3AE00);
}

uint64_t sub_24F95CDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t LeaderboardDescription.recurringProperties.setter(uint64_t a1)
{
  type metadata accessor for LeaderboardDescription(0);
  OUTLINED_FUNCTION_70_0();
  return sub_24F95CE8C(a1, v2);
}

uint64_t sub_24F95CE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*LeaderboardDescription.recurringProperties.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardDescription.title.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t LeaderboardDescription.title.setter(uint64_t a1, uint64_t a2)
{
  type metadata accessor for LeaderboardDescription(0);
  uint64_t result = OUTLINED_FUNCTION_77_0();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LeaderboardDescription.title.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardDescription.type.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for LeaderboardDescription(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t LeaderboardDescription.type.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for LeaderboardDescription(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = v2;
  return result;
}

uint64_t (*LeaderboardDescription.type.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardDescription.supportsChallenge.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for LeaderboardDescription(0) + 36));
}

uint64_t LeaderboardDescription.supportsChallenge.setter(char a1)
{
  uint64_t result = type metadata accessor for LeaderboardDescription(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*LeaderboardDescription.supportsChallenge.modify())()
{
  return nullsub_1;
}

uint64_t sub_24F95D144()
{
  OUTLINED_FUNCTION_113();
  if (v2 == 0xD000000000000011 && v0 == 0x800000024F998A90 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v4 = v1 == 0x644970756F7267 && v0 == 0xE700000000000000;
    if (v4 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v1 == 0xD000000000000013 && v0 == 0x800000024F998AB0 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v5 = v1 == 0x656C746974 && v0 == 0xE500000000000000;
      if (v5 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v6 = v1 == 1701869940 && v0 == 0xE400000000000000;
        if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (v1 == 0xD000000000000011 && v0 == 0x800000024F998AD0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_42();
          if (v1) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

unint64_t sub_24F95D33C(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x644970756F7267;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x656C746974;
      break;
    case 4:
      unint64_t result = 1701869940;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F95D3F4()
{
  return sub_24F95D33C(*v0);
}

uint64_t sub_24F95D3FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F95D144();
  *a1 = result;
  return result;
}

uint64_t sub_24F95D424()
{
  sub_24F95D6A0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F95D45C()
{
  sub_24F95D6A0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t LeaderboardDescription.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35668);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_50_0();
  sub_24F95D6A0();
  OUTLINED_FUNCTION_79();
  sub_24F98E5D8();
  if (!v0)
  {
    sub_24F98E578();
    type metadata accessor for LeaderboardDescription(0);
    type metadata accessor for RecurringLeaderboardProperties(0);
    sub_24F95CB20(&qword_269A35670, (void (*)(uint64_t))type metadata accessor for RecurringLeaderboardProperties);
    OUTLINED_FUNCTION_54_0();
    sub_24F98E5B8();
    sub_24F98E578();
    sub_24F95D6EC();
    OUTLINED_FUNCTION_43();
    sub_24F98E628();
    OUTLINED_FUNCTION_43();
    sub_24F98E5E8();
  }
  uint64_t v2 = OUTLINED_FUNCTION_21_0();
  return v3(v2);
}

unint64_t sub_24F95D6A0()
{
  unint64_t result = qword_269A3A260;
  if (!qword_269A3A260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3A260);
  }
  return result;
}

unint64_t sub_24F95D6EC()
{
  unint64_t result = qword_269A35678;
  if (!qword_269A35678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35678);
  }
  return result;
}

uint64_t sub_24F95D738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, void *a9@<X8>, char a10)
{
  char v14 = *a8;
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  uint64_t v15 = (int *)type metadata accessor for LeaderboardDescription(0);
  uint64_t result = sub_24F95D7C4(a5, (uint64_t)a9 + v15[6]);
  uint64_t v17 = (void *)((char *)a9 + v15[7]);
  *uint64_t v17 = a6;
  v17[1] = a7;
  *((unsigned char *)a9 + v15[8]) = v14;
  *((unsigned char *)a9 + v15[9]) = a10;
  return result;
}

uint64_t sub_24F95D7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void LeaderboardDescription.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, char a11, char a12)
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v16 = v15;
  uint64_t v33 = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
  uint64_t v19 = OUTLINED_FUNCTION_15_0(v18);
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35680);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_3_1();
  uint64_t v21 = (int *)type metadata accessor for LeaderboardDescription(0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_19();
  v13[2] = 0;
  void v13[3] = 0;
  uint64_t v24 = (uint64_t)v13 + *(int *)(v23 + 24);
  uint64_t v25 = type metadata accessor for RecurringLeaderboardProperties(0);
  __swift_storeEnumTagSinglePayload(v24, 1, 1, v25);
  uint64_t v26 = (uint64_t *)((char *)v13 + v21[7]);
  *uint64_t v26 = 0;
  v26[1] = 0;
  uint64_t v34 = v26;
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_24F95D6A0();
  sub_24F98E728();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    swift_bridgeObjectRelease();
    sub_24F95DC10(v24);
    swift_bridgeObjectRelease();
  }
  else
  {
    *uint64_t v13 = sub_24F98E4E8();
    v13[1] = v27;
    v13[2] = sub_24F98E488();
    void v13[3] = v28;
    sub_24F95CB20(&qword_269A35688, (void (*)(uint64_t))type metadata accessor for RecurringLeaderboardProperties);
    sub_24F98E4C8();
    sub_24F95CE8C(v14, v24);
    uint64_t v29 = sub_24F98E488();
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    *uint64_t v34 = v29;
    v34[1] = v31;
    sub_24F95DC70();
    sub_24F98E538();
    *((unsigned char *)v13 + v21[8]) = a12;
    LOBYTE(v29) = sub_24F98E4F8();
    OUTLINED_FUNCTION_2_2();
    v32();
    *((unsigned char *)v13 + v21[9]) = v29 & 1;
    sub_24F95DCBC((uint64_t)v13, v33, (void (*)(void))type metadata accessor for LeaderboardDescription);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    sub_24F95DD18((uint64_t)v13, (void (*)(void))type metadata accessor for LeaderboardDescription);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t sub_24F95DC10(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24F95DC70()
{
  unint64_t result = qword_269A35690;
  if (!qword_269A35690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35690);
  }
  return result;
}

uint64_t sub_24F95DCBC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = OUTLINED_FUNCTION_8_0();
  v5(v4);
  return a2;
}

uint64_t sub_24F95DD18(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2();
  v3();
  return a1;
}

void sub_24F95DD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LeaderboardDescription.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SBYTE2(vars8), SHIBYTE(vars8));
}

uint64_t sub_24F95DD84()
{
  return LeaderboardDescription.encode(to:)();
}

uint64_t LeaderboardEntry.context.getter()
{
  return *(void *)v0;
}

uint64_t LeaderboardEntry.context.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*LeaderboardEntry.context.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.dateEarned.getter()
{
  return sub_24F95DDF0((void (*)(void))type metadata accessor for LeaderboardEntry);
}

uint64_t sub_24F95DDF0(void (*a1)(void))
{
  a1(0);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = OUTLINED_FUNCTION_8_0();
  return v2(v1);
}

uint64_t type metadata accessor for LeaderboardEntry(uint64_t a1)
{
  return sub_24F95558C(a1, qword_269A3AE10);
}

uint64_t LeaderboardEntry.dateEarned.setter(uint64_t a1)
{
  return sub_24F95DE9C(a1, type metadata accessor for LeaderboardEntry);
}

uint64_t sub_24F95DE9C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  return v7(v4, a1, v5);
}

uint64_t (*LeaderboardEntry.dateEarned.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.formattedScore.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t LeaderboardEntry.formattedScore.setter(uint64_t a1, uint64_t a2)
{
  type metadata accessor for LeaderboardEntry(0);
  uint64_t result = OUTLINED_FUNCTION_77_0();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LeaderboardEntry.formattedScore.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.leaderboard.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for LeaderboardEntry(0) + 28));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t LeaderboardEntry.leaderboard.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  type metadata accessor for LeaderboardEntry(0);
  uint64_t result = OUTLINED_FUNCTION_77_0();
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*LeaderboardEntry.leaderboard.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.player.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for LeaderboardEntry(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t LeaderboardEntry.player.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  type metadata accessor for LeaderboardEntry(0);
  uint64_t result = OUTLINED_FUNCTION_77_0();
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*LeaderboardEntry.player.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.rank.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for LeaderboardEntry(0) + 36));
}

uint64_t LeaderboardEntry.rank.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for LeaderboardEntry(0);
  *(void *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*LeaderboardEntry.rank.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.score.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for LeaderboardEntry(0) + 40));
}

uint64_t LeaderboardEntry.score.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for LeaderboardEntry(0);
  *(void *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*LeaderboardEntry.score.modify())()
{
  return nullsub_1;
}

uint64_t LeaderboardEntry.init(context:dateEarned:formattedScore:leaderboard:player:rank:score:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14 = *a6;
  uint64_t v15 = a6[1];
  uint64_t v16 = *a7;
  uint64_t v17 = a7[1];
  *(void *)a9 = a1;
  *(unsigned char *)(a9 + 8) = a2 & 1;
  uint64_t v18 = (int *)type metadata accessor for LeaderboardEntry(0);
  uint64_t v19 = a9 + v18[5];
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 32))(v19, a3);
  uint64_t v22 = (void *)(a9 + v18[6]);
  *uint64_t v22 = a4;
  v22[1] = a5;
  uint64_t v23 = (void *)(a9 + v18[7]);
  *uint64_t v23 = v14;
  v23[1] = v15;
  uint64_t v24 = (void *)(a9 + v18[8]);
  *uint64_t v24 = v16;
  v24[1] = v17;
  *(void *)(a9 + v18[9]) = a8;
  *(void *)(a9 + v18[10]) = a10;
  return result;
}

uint64_t sub_24F95E3C0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x6E72614565746164 && v2 == 0xEA00000000006465;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = v3 == 0x657474616D726F66 && v2 == 0xEE0065726F635364;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = v3 == 0x6F6272656461656CLL && v2 == 0xEB00000000647261;
        if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          OUTLINED_FUNCTION_76_0();
          BOOL v9 = v4 && v2 == 0xE600000000000000;
          if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = v3 == 1802396018 && v2 == 0xE400000000000000;
            if (v10 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (v3 == 0x65726F6373 && v2 == 0xE500000000000000)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              OUTLINED_FUNCTION_5_1();
              OUTLINED_FUNCTION_42();
              if (v3) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_24F95E64C(char a1)
{
  uint64_t result = 0x747865746E6F63;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E72614565746164;
      break;
    case 2:
      uint64_t result = 0x657474616D726F66;
      break;
    case 3:
      uint64_t result = 0x6F6272656461656CLL;
      break;
    case 4:
      uint64_t result = 0x726579616C70;
      break;
    case 5:
      uint64_t result = 1802396018;
      break;
    case 6:
      uint64_t result = 0x65726F6373;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F95E73C()
{
  return sub_24F95E64C(*v0);
}

uint64_t sub_24F95E744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F95E3C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F95E76C()
{
  sub_24F95EA4C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F95E7A4()
{
  sub_24F95EA4C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t LeaderboardEntry.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35698);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_50_0();
  sub_24F95EA4C();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_68_0();
  sub_24F98E5A8();
  if (!v0)
  {
    type metadata accessor for LeaderboardEntry(0);
    sub_24F98DFB8();
    sub_24F95CB20(&qword_269A353A8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_54_0();
    sub_24F98E628();
    OUTLINED_FUNCTION_68_0();
    sub_24F98E5D8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
    sub_24F949E34(&qword_269A354E0, &qword_269A354D8);
    OUTLINED_FUNCTION_38_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
    OUTLINED_FUNCTION_38_0();
    OUTLINED_FUNCTION_43();
    sub_24F98E618();
    OUTLINED_FUNCTION_43();
    sub_24F98E608();
  }
  uint64_t v2 = OUTLINED_FUNCTION_21_0();
  return v3(v2);
}

unint64_t sub_24F95EA4C()
{
  unint64_t result = qword_269A3A268[0];
  if (!qword_269A3A268[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3A268);
  }
  return result;
}

void LeaderboardEntry.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  uint64_t v22 = v4;
  uint64_t v24 = sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v23 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A356A0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_1();
  BOOL v8 = (int *)type metadata accessor for LeaderboardEntry(0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_1();
  uint64_t v12 = v11 - v10;
  *(void *)uint64_t v12 = 0;
  *(unsigned char *)(v12 + 8) = 1;
  uint64_t v25 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F95EA4C();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    *(void *)uint64_t v12 = sub_24F98E4B8();
    *(unsigned char *)(v12 + 8) = v13 & 1;
    LOBYTE(v26) = 1;
    sub_24F95CB20(&qword_269A353C8, MEMORY[0x263F07490]);
    sub_24F98E538();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v12 + v8[5], v1, v24);
    OUTLINED_FUNCTION_28_0(2);
    uint64_t v14 = sub_24F98E4E8();
    uint64_t v15 = (uint64_t *)(v12 + v8[6]);
    uint64_t *v15 = v14;
    v15[1] = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
    sub_24F949E34(&qword_269A354F0, &qword_269A354D8);
    OUTLINED_FUNCTION_30_0();
    uint64_t v17 = (void *)(v12 + v8[7]);
    *uint64_t v17 = v26;
    v17[1] = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    OUTLINED_FUNCTION_30_0();
    uint64_t v18 = (void *)(v12 + v8[8]);
    *uint64_t v18 = v26;
    v18[1] = v27;
    OUTLINED_FUNCTION_28_0(5);
    *(void *)(v12 + v8[9]) = sub_24F98E528();
    OUTLINED_FUNCTION_28_0(6);
    uint64_t v19 = sub_24F98E518();
    uint64_t v20 = OUTLINED_FUNCTION_7_2();
    v21(v20);
    *(void *)(v12 + v8[10]) = v19;
    sub_24F95DCBC(v12, v22, (void (*)(void))type metadata accessor for LeaderboardEntry);
    __swift_destroy_boxed_opaque_existential_1(v25);
    sub_24F95DD18(v12, (void (*)(void))type metadata accessor for LeaderboardEntry);
  }
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F95EF34()
{
  unint64_t result = qword_269A356A8;
  if (!qword_269A356A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A356A8);
  }
  return result;
}

unint64_t sub_24F95EF84()
{
  unint64_t result = qword_269A356B0;
  if (!qword_269A356B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A356B0);
  }
  return result;
}

unint64_t sub_24F95EFD4()
{
  unint64_t result = qword_269A356B8;
  if (!qword_269A356B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A356B8);
  }
  return result;
}

void sub_24F95F020()
{
}

uint64_t sub_24F95F038()
{
  return LeaderboardEntry.encode(to:)();
}

uint64_t dispatch thunk of LeaderboardServiceProtocol.listLeaderboardEntries(leaderboards:range:locale:timeScope:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 16)
                                                                                              + **(int **)(a7 + 16));
  uint64_t v14 = swift_task_alloc();
  uint64_t v15 = (void *)OUTLINED_FUNCTION_34(v14);
  void *v15 = v16;
  v15[1] = sub_24F955E9C;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of LeaderboardServiceProtocol.listLeaderboardEntries(leaderboards:players:locale:timeScope:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 24)
                                                                                     + **(int **)(a6 + 24));
  uint64_t v12 = swift_task_alloc();
  char v13 = (void *)OUTLINED_FUNCTION_34(v12);
  *char v13 = v14;
  v13[1] = sub_24F95A328;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of LeaderboardServiceProtocol.listLeaderboards(gamesWithPlayers:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of LeaderboardServiceProtocol.previousOcurrences(leaderboardsForPlayers:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of LeaderboardServiceProtocol.submit(entries:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F955C0C;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

void type metadata accessor for LeaderboardPlayerScope()
{
}

void type metadata accessor for LeaderboardTimeScope()
{
}

void type metadata accessor for LeaderboardType()
{
}

uint64_t destroy for GameWithPlayer()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for GameWithPlayer(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GameWithPlayer()
{
  OUTLINED_FUNCTION_113();
  *uint64_t v3 = *v2;
  v1[1] = v2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v1[2] = *(void *)(v0 + 16);
  v1[3] = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for GameWithPlayer()
{
  OUTLINED_FUNCTION_113();
  uint64_t v3 = v2[1];
  *uint64_t v1 = *v2;
  v1[1] = v3;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 24);
  v1[2] = *(void *)(v0 + 16);
  v1[3] = v4;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t getEnumTagSinglePayload for GameWithPlayer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for GameWithPlayer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for GameWithPlayer()
{
}

uint64_t initializeBufferWithCopyOfBuffer for RecurringLeaderboardProperties(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
    uint64_t v10 = OUTLINED_FUNCTION_8_0();
    v9(v10);
    ((void (*)(uint64_t, uint64_t, uint64_t))v9)(a1 + *(int *)(v6 + 20), a2 + *(int *)(v6 + 20), v7);
    OUTLINED_FUNCTION_69_0(*(int *)(v6 + 24));
  }
  return a1;
}

uint64_t destroy for RecurringLeaderboardProperties(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
}

uint64_t initializeWithCopy for RecurringLeaderboardProperties()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  unint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  uint64_t v3 = OUTLINED_FUNCTION_37_0();
  v2(v3);
  uint64_t v4 = OUTLINED_FUNCTION_10_2();
  v2(v4);
  return OUTLINED_FUNCTION_57(*(int *)(v0 + 24));
}

uint64_t assignWithCopy for RecurringLeaderboardProperties()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 24);
  uint64_t v2 = OUTLINED_FUNCTION_37_0();
  v1(v2);
  uint64_t v3 = OUTLINED_FUNCTION_10_2();
  v1(v3);
  return OUTLINED_FUNCTION_73_0();
}

uint64_t initializeWithTake for RecurringLeaderboardProperties()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = *(void (**)(void))(v1 + 32);
  OUTLINED_FUNCTION_42_0();
  v2();
  uint64_t v3 = OUTLINED_FUNCTION_10_2();
  ((void (*)(uint64_t))v2)(v3);
  return OUTLINED_FUNCTION_57(*(int *)(v0 + 24));
}

uint64_t assignWithTake for RecurringLeaderboardProperties()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 40);
  uint64_t v2 = OUTLINED_FUNCTION_37_0();
  v1(v2);
  uint64_t v3 = OUTLINED_FUNCTION_10_2();
  v1(v3);
  return OUTLINED_FUNCTION_73_0();
}

uint64_t getEnumTagSinglePayload for RecurringLeaderboardProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F95FA30);
}

uint64_t sub_24F95FA30()
{
  uint64_t v2 = OUTLINED_FUNCTION_55_0();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for RecurringLeaderboardProperties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F95FA80);
}

uint64_t sub_24F95FA80()
{
  uint64_t v2 = OUTLINED_FUNCTION_55_0();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t sub_24F95FAC0()
{
  uint64_t result = sub_24F98DFB8();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_5_3(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void initializeBufferWithCopyOfBuffer for LeaderboardDescription()
{
  OUTLINED_FUNCTION_36_0();
  unint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1[1];
    *uint64_t v3 = *v1;
    v3[1] = v7;
    uint64_t v8 = v1[3];
    v3[2] = v1[2];
    v3[3] = v8;
    type metadata accessor for RecurringLeaderboardProperties(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (OUTLINED_FUNCTION_29_0())
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
      uint64_t v10 = OUTLINED_FUNCTION_15_0(v9);
      OUTLINED_FUNCTION_52_0(v10, v12, *(void *)(v11 + 64));
    }
    else
    {
      sub_24F98DFB8();
      OUTLINED_FUNCTION_1_1();
      uint64_t v14 = *(void (**)(void))(v13 + 16);
      OUTLINED_FUNCTION_14_1();
      v14();
      uint64_t v15 = OUTLINED_FUNCTION_12_2();
      ((void (*)(uint64_t))v14)(v15);
      OUTLINED_FUNCTION_4_3();
    }
    OUTLINED_FUNCTION_79_0(*(int *)(v6 + 28));
    OUTLINED_FUNCTION_65_0();
    swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_35_0();
}

uint64_t destroy for LeaderboardDescription(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for RecurringLeaderboardProperties(0);
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
  {
    uint64_t v6 = sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v8(v4, v6);
    v8(v4 + *(int *)(v5 + 20), v6);
  }
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for LeaderboardDescription()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = v2[1];
  *uint64_t v4 = *v2;
  v4[1] = v6;
  uint64_t v7 = v2[3];
  v4[2] = v2[2];
  v4[3] = v7;
  type metadata accessor for RecurringLeaderboardProperties(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (OUTLINED_FUNCTION_29_0())
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
    uint64_t v9 = OUTLINED_FUNCTION_15_0(v8);
    OUTLINED_FUNCTION_52_0(v9, v11, *(void *)(v10 + 64));
  }
  else
  {
    sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    uint64_t v13 = *(void (**)(void))(v12 + 16);
    OUTLINED_FUNCTION_14_1();
    v13();
    uint64_t v14 = OUTLINED_FUNCTION_12_2();
    ((void (*)(uint64_t))v13)(v14);
    OUTLINED_FUNCTION_4_3();
  }
  OUTLINED_FUNCTION_78_0(*(int *)(v1 + 28));
  *((unsigned char *)v5 + v15) = *((unsigned char *)v3 + v15);
  *((unsigned char *)v5 + *(int *)(v1 + 36)) = *((unsigned char *)v3 + *(int *)(v1 + 36));
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_35_0();
}

void assignWithCopy for LeaderboardDescription()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  *uint64_t v7 = *v5;
  v7[1] = v5[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[2] = v6[2];
  uint64_t v9 = v8[3];
  v8[3] = v6[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v10 = OUTLINED_FUNCTION_11_2();
  if (!v2)
  {
    if (!v10)
    {
      sub_24F98DFB8();
      OUTLINED_FUNCTION_1_1();
      uint64_t v19 = *(void (**)(uint64_t))(v18 + 24);
      uint64_t v20 = OUTLINED_FUNCTION_66_1();
      v19(v20);
      uint64_t v21 = OUTLINED_FUNCTION_51_0();
      v19(v21);
      *(void *)(v9 + *(int *)(v1 + 24)) = *(void *)(v0 + *(int *)(v1 + 24));
      goto LABEL_7;
    }
    sub_24F95DD18(v9, (void (*)(void))type metadata accessor for RecurringLeaderboardProperties);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
    uint64_t v15 = OUTLINED_FUNCTION_15_0(v14);
    OUTLINED_FUNCTION_52_0(v15, v17, *(void *)(v16 + 64));
    goto LABEL_7;
  }
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v12 = *(void (**)(void))(v11 + 16);
  OUTLINED_FUNCTION_14_1();
  v12();
  uint64_t v13 = OUTLINED_FUNCTION_12_2();
  ((void (*)(uint64_t))v12)(v13);
  OUTLINED_FUNCTION_4_3();
LABEL_7:
  OUTLINED_FUNCTION_6_2(v4[7]);
  swift_bridgeObjectRelease();
  *((unsigned char *)v8 + v4[8]) = *((unsigned char *)v6 + v4[8]);
  *((unsigned char *)v8 + v4[9]) = *((unsigned char *)v6 + v4[9]);
  OUTLINED_FUNCTION_35_0();
}

void initializeWithTake for LeaderboardDescription()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  long long v6 = v2[1];
  *uint64_t v4 = *v2;
  v4[1] = v6;
  type metadata accessor for RecurringLeaderboardProperties(0);
  if (OUTLINED_FUNCTION_29_0())
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
    uint64_t v8 = OUTLINED_FUNCTION_15_0(v7);
    OUTLINED_FUNCTION_52_0(v8, v10, *(void *)(v9 + 64));
  }
  else
  {
    sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    uint64_t v12 = *(void (**)(void))(v11 + 32);
    OUTLINED_FUNCTION_39_0();
    v12();
    OUTLINED_FUNCTION_39_0();
    v12();
    OUTLINED_FUNCTION_4_3();
  }
  *(_OWORD *)((char *)v5 + *(int *)(v1 + 28)) = *(_OWORD *)((char *)v3 + *(int *)(v1 + 28));
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_35_0();
}

void assignWithTake for LeaderboardDescription()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v6[1];
  *uint64_t v8 = *v6;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = v7[3];
  v9[2] = v7[2];
  v9[3] = v11;
  swift_bridgeObjectRelease();
  int v12 = OUTLINED_FUNCTION_11_2();
  if (!v3)
  {
    if (!v12)
    {
      sub_24F98DFB8();
      OUTLINED_FUNCTION_1_1();
      uint64_t v21 = *(void (**)(uint64_t))(v20 + 40);
      uint64_t v22 = OUTLINED_FUNCTION_66_1();
      v21(v22);
      uint64_t v23 = OUTLINED_FUNCTION_51_0();
      v21(v23);
      *(void *)(v0 + *(int *)(v2 + 24)) = *(void *)(v1 + *(int *)(v2 + 24));
      goto LABEL_7;
    }
    sub_24F95DD18(v0, (void (*)(void))type metadata accessor for RecurringLeaderboardProperties);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
    uint64_t v16 = OUTLINED_FUNCTION_15_0(v15);
    OUTLINED_FUNCTION_52_0(v16, v18, *(void *)(v17 + 64));
    goto LABEL_7;
  }
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v14 = *(void (**)(void))(v13 + 32);
  OUTLINED_FUNCTION_39_0();
  v14();
  OUTLINED_FUNCTION_39_0();
  v14();
  OUTLINED_FUNCTION_4_3();
LABEL_7:
  OUTLINED_FUNCTION_9_2(v5[7]);
  uint64_t v19 = v5[9];
  *((unsigned char *)v9 + v5[8]) = *((unsigned char *)v7 + v5[8]);
  *((unsigned char *)v9 + v19) = *((unsigned char *)v7 + v19);
  OUTLINED_FUNCTION_35_0();
}

uint64_t getEnumTagSinglePayload for LeaderboardDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F9601D8);
}

uint64_t sub_24F9601D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_72_0(*(void *)(a1 + 8));
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
  uint64_t v8 = a1 + *(int *)(a3 + 24);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for LeaderboardDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F96026C);
}

uint64_t sub_24F96026C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35660);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_24F9602F0()
{
  sub_24F960378();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_5_3(v0);
    swift_initStructMetadata();
  }
}

void sub_24F960378()
{
  if (!qword_269A356E8)
  {
    type metadata accessor for RecurringLeaderboardProperties(255);
    unint64_t v0 = sub_24F98E2C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A356E8);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for LeaderboardEntry(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    long long v6 = v4;
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    uint64_t v7 = OUTLINED_FUNCTION_67_0();
    v8(v7);
    OUTLINED_FUNCTION_79_0(v6[6]);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = v6[8];
    uint64_t v14 = v6[9];
    uint64_t v15 = (void *)(a1 + v13);
    uint64_t v16 = (void *)(a2 + v13);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    *(void *)(a1 + v14) = *(void *)(a2 + v14);
    OUTLINED_FUNCTION_69_0(v6[10]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for LeaderboardEntry()
{
  OUTLINED_FUNCTION_113();
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2();
  v0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LeaderboardEntry(uint64_t a1, uint64_t a2, int *a3)
{
  OUTLINED_FUNCTION_8_2(a1, a2);
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = OUTLINED_FUNCTION_67_0();
  v7(v6);
  OUTLINED_FUNCTION_78_0(a3[6]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a3[8];
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LeaderboardEntry(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v5;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = OUTLINED_FUNCTION_53_0();
  v7(v6);
  OUTLINED_FUNCTION_6_2(a3[6]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_2(a3[7]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_2(a3[8]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69_0(a3[9]);
  OUTLINED_FUNCTION_69_0(a3[10]);
  return a1;
}

uint64_t initializeWithTake for LeaderboardEntry(uint64_t a1, uint64_t a2, int *a3)
{
  OUTLINED_FUNCTION_8_2(a1, a2);
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = OUTLINED_FUNCTION_53_0();
  v7(v6);
  uint64_t v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  return OUTLINED_FUNCTION_57(a3[10]);
}

uint64_t assignWithTake for LeaderboardEntry(uint64_t a1, uint64_t a2, int *a3)
{
  OUTLINED_FUNCTION_8_2(a1, a2);
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = OUTLINED_FUNCTION_53_0();
  v7(v6);
  OUTLINED_FUNCTION_9_2(a3[6]);
  OUTLINED_FUNCTION_9_2(a3[7]);
  OUTLINED_FUNCTION_9_2(a3[8]);
  uint64_t v8 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for LeaderboardEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F9607FC);
}

uint64_t sub_24F9607FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v7 + 84) != v3) {
    return OUTLINED_FUNCTION_72_0(*(void *)(v4 + *(int *)(a3 + 24) + 8));
  }
  uint64_t v8 = v6;
  uint64_t v9 = v4 + *(int *)(a3 + 20);
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t storeEnumTagSinglePayload for LeaderboardEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F960890);
}

void sub_24F960890(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t sub_24F960924()
{
  uint64_t result = sub_24F98DFB8();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_5_3(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *sub_24F9609B4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F960A70);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 6);
        break;
    }
  }
  return result;
}

void type metadata accessor for LeaderboardEntry.CodingKeys()
{
}

unsigned char *sub_24F960AA4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F960B60);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 5);
        break;
    }
  }
  return result;
}

void type metadata accessor for LeaderboardDescription.CodingKeys()
{
}

unsigned char *_s21GameServicesProtocols20LeaderboardTimeScopeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F960C50);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 2);
        break;
    }
  }
  return result;
}

void type metadata accessor for RecurringLeaderboardProperties.CodingKeys()
{
}

unsigned char *_s21GameServicesProtocols22LeaderboardPlayerScopeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F960D40);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameWithPlayer.CodingKeys()
{
}

unint64_t sub_24F960D78()
{
  unint64_t result = qword_269A3AF20[0];
  if (!qword_269A3AF20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3AF20);
  }
  return result;
}

unint64_t sub_24F960DC8()
{
  unint64_t result = qword_269A3B130[0];
  if (!qword_269A3B130[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B130);
  }
  return result;
}

unint64_t sub_24F960E18()
{
  unint64_t result = qword_269A3B340[0];
  if (!qword_269A3B340[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B340);
  }
  return result;
}

unint64_t sub_24F960E68()
{
  unint64_t result = qword_269A3B550[0];
  if (!qword_269A3B550[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B550);
  }
  return result;
}

unint64_t sub_24F960EB8()
{
  unint64_t result = qword_269A3B660;
  if (!qword_269A3B660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3B660);
  }
  return result;
}

unint64_t sub_24F960F08()
{
  unint64_t result = qword_269A3B668[0];
  if (!qword_269A3B668[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B668);
  }
  return result;
}

unint64_t sub_24F960F58()
{
  unint64_t result = qword_269A3B6F0;
  if (!qword_269A3B6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3B6F0);
  }
  return result;
}

unint64_t sub_24F960FA8()
{
  unint64_t result = qword_269A3B6F8[0];
  if (!qword_269A3B6F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B6F8);
  }
  return result;
}

unint64_t sub_24F960FF8()
{
  unint64_t result = qword_269A3B780;
  if (!qword_269A3B780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3B780);
  }
  return result;
}

unint64_t sub_24F961048()
{
  unint64_t result = qword_269A3B788[0];
  if (!qword_269A3B788[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B788);
  }
  return result;
}

unint64_t sub_24F961098()
{
  unint64_t result = qword_269A3B810;
  if (!qword_269A3B810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3B810);
  }
  return result;
}

unint64_t sub_24F9610E8()
{
  unint64_t result = qword_269A3B818[0];
  if (!qword_269A3B818[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3B818);
  }
  return result;
}

unint64_t sub_24F961134()
{
  unint64_t result = qword_269A356F0;
  if (!qword_269A356F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A356F0);
  }
  return result;
}

unint64_t sub_24F961180()
{
  unint64_t result = qword_269A356F8;
  if (!qword_269A356F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A356F8);
  }
  return result;
}

unint64_t sub_24F9611CC()
{
  unint64_t result = qword_269A35700;
  if (!qword_269A35700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35700);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  *(void *)(v0 + *(int *)(v2 + 24)) = *(void *)(v1 + *(int *)(v2 + 24));
  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v2);
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_6_2@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = (void *)(v1 + a1);
  uint64_t v5 = (void *)(v2 + a1);
  *unsigned int v4 = *v5;
  v4[1] = v5[1];
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_9_2@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = (void *)(v1 + a1);
  uint64_t v5 = (uint64_t *)(v2 + a1);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  *unsigned int v4 = v7;
  v4[1] = v6;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v1 + *(int *)(v0 + 20);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  uint64_t v3 = *(int *)(v2 + 24);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = v1 + v3;
  uint64_t v6 = type metadata accessor for RecurringLeaderboardProperties(0);
  __swift_getEnumTagSinglePayload(v4, 1, v6);
  return __swift_getEnumTagSinglePayload(v5, 1, v6);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0 + *(int *)(v1 + 20);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  *uint64_t v0 = *v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_0@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return v0 - 96;
}

void *OUTLINED_FUNCTION_50_0()
{
  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return v0 + *(int *)(v1 + 20);
}

void *OUTLINED_FUNCTION_52_0(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_57@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) = *(void *)(v1 + a1);
  return v2;
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_24F98E628();
}

void OUTLINED_FUNCTION_65_0()
{
  *(unsigned char *)(v1 + v0) = *(unsigned char *)(v2 + v0);
  *(unsigned char *)(v1 + *(int *)(v3 + 36)) = *(unsigned char *)(v2 + *(int *)(v3 + 36));
}

uint64_t OUTLINED_FUNCTION_66_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return v0;
}

void OUTLINED_FUNCTION_69_0(uint64_t a1@<X8>)
{
  *(void *)(v1 + a1) = *(void *)(v2 + a1);
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return type metadata accessor for LeaderboardEntry(0);
}

uint64_t OUTLINED_FUNCTION_72_0@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  *(void *)(v2 + *(int *)(v0 + 24)) = *(void *)(v1 + *(int *)(v0 + 24));
  return v2;
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_77_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_78_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + a1);
  uint64_t v4 = (void *)(v2 + a1);
  uint64_t result = v4[1];
  *uint64_t v3 = *v4;
  v3[1] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_79_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + a1);
  uint64_t v4 = (void *)(v2 + a1);
  uint64_t result = v4[1];
  *uint64_t v3 = *v4;
  v3[1] = result;
  return result;
}

uint64_t static GameServicesError.== infix(_:_:)()
{
  OUTLINED_FUNCTION_12_3();
  if (!v5)
  {
    if (v4) {
      goto LABEL_19;
    }
    if (v3 == v1 && v2 == v0) {
      char v16 = 1;
    }
    else {
      char v16 = OUTLINED_FUNCTION_0_2();
    }
    uint64_t v40 = OUTLINED_FUNCTION_6_3();
    sub_24F961A38(v40, v41, v42);
    uint64_t v43 = OUTLINED_FUNCTION_3_3();
    sub_24F961A38(v43, v44, v45);
    uint64_t v46 = OUTLINED_FUNCTION_3_3();
    sub_24F961A60(v46, v47, v48);
    uint64_t v37 = OUTLINED_FUNCTION_6_3();
LABEL_25:
    sub_24F961A60(v37, v38, v39);
    return v16 & 1;
  }
  if (v5 != 1)
  {
    if (v4 != 2) {
      goto LABEL_19;
    }
    if (v3 == v1 && v2 == v0) {
      char v16 = 1;
    }
    else {
      char v16 = OUTLINED_FUNCTION_0_2();
    }
    sub_24F961A38(v1, v0, 2);
    uint64_t v31 = OUTLINED_FUNCTION_8_3();
    sub_24F961A38(v31, v32, v33);
    uint64_t v34 = OUTLINED_FUNCTION_8_3();
    sub_24F961A60(v34, v35, v36);
    uint64_t v37 = v1;
    uint64_t v38 = v0;
    char v39 = 2;
    goto LABEL_25;
  }
  if (v4 != 1)
  {
LABEL_19:
    uint64_t v19 = OUTLINED_FUNCTION_5_4();
    sub_24F961A38(v19, v20, v21);
    uint64_t v22 = OUTLINED_FUNCTION_2_3();
    sub_24F961A38(v22, v23, v24);
    uint64_t v25 = OUTLINED_FUNCTION_2_3();
    sub_24F961A60(v25, v26, v27);
    uint64_t v28 = OUTLINED_FUNCTION_5_4();
LABEL_20:
    sub_24F961A60(v28, v29, v30);
    char v16 = 0;
    return v16 & 1;
  }
  sub_24F961A38(v3, v2, 1);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_11_3();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35708);
  if ((OUTLINED_FUNCTION_14_2(v6, v7, v8, (uint64_t)&type metadata for GameServicesInternalError, v9, v10) & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v11 = MEMORY[0x253367250](v1);
  if ((OUTLINED_FUNCTION_14_2(v11, v12, v13, (uint64_t)&type metadata for GameServicesInternalError, v14, v15) & 1) == 0)
  {
    sub_24F961A88(v68, v69, v70);
LABEL_27:
    uint64_t v49 = (void *)sub_24F98DF88();
    uint64_t v50 = (void *)sub_24F98DF88();
    id v67 = v49;
    id v51 = objc_msgSend(v49, sel_domain);
    uint64_t v52 = sub_24F98E008();
    uint64_t v54 = v53;

    uint64_t v55 = v50;
    id v56 = objc_msgSend(v50, sel_domain);
    uint64_t v57 = sub_24F98E008();
    uint64_t v59 = v58;

    if (v52 == v57 && v54 == v59)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v62 = v55;
      uint64_t v63 = v67;
    }
    else
    {
      char v61 = sub_24F98E678();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v62 = v55;
      uint64_t v63 = v67;
      if ((v61 & 1) == 0)
      {
        OUTLINED_FUNCTION_7_3();

        sub_24F961A60(v3, v2, 1);
        uint64_t v28 = OUTLINED_FUNCTION_10_3();
        goto LABEL_20;
      }
    }
    id v64 = objc_msgSend(v63, sel_code);
    id v65 = objc_msgSend(v62, sel_code);
    OUTLINED_FUNCTION_7_3();

    OUTLINED_FUNCTION_1_2();
    char v16 = v64 == v65;
    return v16 & 1;
  }
  char v16 = static GameServicesInternalError.== infix(_:_:)();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_2();
  sub_24F961A88(v68, v69, v70);
  sub_24F961A88(v68, v69, v70);
  return v16 & 1;
}

uint64_t sub_24F961A38(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 2:
      return swift_bridgeObjectRetain();
    case 1:
      JUMPOUT(0x253367250);
    case 0:
      return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24F961A60(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 2:
      return swift_bridgeObjectRelease();
    case 1:
      JUMPOUT(0x253367240);
    case 0:
      return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24F961A88(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t static GameServicesInternalError.== infix(_:_:)()
{
  OUTLINED_FUNCTION_12_3();
  if (v5)
  {
    if (v5 == 1)
    {
      if (v4 == 1)
      {
        if (v3 == v1 && v2 == v0) {
          char v7 = 1;
        }
        else {
          char v7 = OUTLINED_FUNCTION_0_2();
        }
        uint64_t v25 = OUTLINED_FUNCTION_10_3();
        sub_24F961BCC(v25, v26, v27);
        sub_24F961BCC(v3, v2, 1u);
        sub_24F961A88(v3, v2, 1u);
        uint64_t v28 = OUTLINED_FUNCTION_10_3();
LABEL_25:
        sub_24F961A88(v28, v29, v30);
        return v7 & 1;
      }
    }
    else if (v4 == 2 && (v0 | v1) == 0)
    {
      uint64_t v22 = OUTLINED_FUNCTION_8_3();
      sub_24F961A88(v22, v23, v24);
      sub_24F961A88(0, 0, 2u);
      char v7 = 1;
      return v7 & 1;
    }
  }
  else if (!v4)
  {
    if (v3 == v1 && v2 == v0) {
      char v7 = 1;
    }
    else {
      char v7 = OUTLINED_FUNCTION_0_2();
    }
    uint64_t v31 = OUTLINED_FUNCTION_6_3();
    sub_24F961BCC(v31, v32, v33);
    uint64_t v34 = OUTLINED_FUNCTION_3_3();
    sub_24F961BCC(v34, v35, v36);
    uint64_t v37 = OUTLINED_FUNCTION_3_3();
    sub_24F961A88(v37, v38, v39);
    uint64_t v28 = OUTLINED_FUNCTION_6_3();
    goto LABEL_25;
  }
  uint64_t v10 = OUTLINED_FUNCTION_5_4();
  sub_24F961BCC(v10, v11, v12);
  uint64_t v13 = OUTLINED_FUNCTION_2_3();
  sub_24F961BCC(v13, v14, v15);
  uint64_t v16 = OUTLINED_FUNCTION_2_3();
  sub_24F961A88(v16, v17, v18);
  uint64_t v19 = OUTLINED_FUNCTION_5_4();
  sub_24F961A88(v19, v20, v21);
  char v7 = 0;
  return v7 & 1;
}

uint64_t sub_24F961BCC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24F961BFC()
{
  sub_24F961EF4();
  uint64_t result = OUTLINED_FUNCTION_4_4();
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0;
  *(unsigned char *)(v1 + 16) = 2;
  qword_269A3BAB0 = result;
  *(void *)algn_269A3BAB8 = 0;
  byte_269A3BAC0 = 1;
  return result;
}

uint64_t *sub_24F961C44()
{
  if (_MergedGlobals != -1) {
    swift_once();
  }
  return &qword_269A3BAB0;
}

uint64_t static GameServicesError.notYetImplemented.getter()
{
  if (_MergedGlobals != -1) {
    swift_once();
  }
  uint64_t v0 = OUTLINED_FUNCTION_16_0(&qword_269A3BAB0);
  return sub_24F961A38(v0, v1, v2);
}

double sub_24F961CFC()
{
  sub_24F961EF4();
  uint64_t v0 = OUTLINED_FUNCTION_4_4();
  double result = 1.9491968e243;
  *(_OWORD *)uint64_t v2 = xmmword_24F9931D0;
  *(unsigned char *)(v2 + 16) = 1;
  qword_269A3BAC8 = v0;
  unk_269A3BAD0 = 0;
  byte_269A3BAD8 = 1;
  return result;
}

uint64_t *sub_24F961D48()
{
  if (qword_269A3BAA8 != -1) {
    swift_once();
  }
  return &qword_269A3BAC8;
}

uint64_t static GameServicesError.testError.getter()
{
  if (qword_269A3BAA8 != -1) {
    swift_once();
  }
  uint64_t v0 = OUTLINED_FUNCTION_16_0(&qword_269A3BAC8);
  return sub_24F961A38(v0, v1, v2);
}

uint64_t static GameServicesError.illegalCast<A, B>(from:to:)@<X0>(uint64_t a1@<X8>)
{
  sub_24F98E328();
  swift_bridgeObjectRelease();
  sub_24F98E768();
  sub_24F98E058();
  swift_bridgeObjectRelease();
  sub_24F98E058();
  sub_24F98E768();
  sub_24F98E058();
  swift_bridgeObjectRelease();
  sub_24F961EF4();
  uint64_t result = OUTLINED_FUNCTION_4_4();
  *(void *)uint64_t v3 = 0xD000000000000013;
  *(void *)(v3 + 8) = 0x800000024F998AF0;
  *(unsigned char *)(v3 + 16) = 0;
  *(void *)a1 = result;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

unint64_t sub_24F961EF4()
{
  unint64_t result = qword_269A35710;
  if (!qword_269A35710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35710);
  }
  return result;
}

uint64_t static GameServicesError.illegalState(message:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_24F961EF4();
  uint64_t v6 = OUTLINED_FUNCTION_4_4();
  *(void *)uint64_t v7 = a1;
  *(void *)(v7 + 8) = a2;
  *(unsigned char *)(v7 + 16) = 1;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t static GameServicesError.invalidReference<A>(ref:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 2;
  return swift_bridgeObjectRetain();
}

uint64_t static GameServicesError.unexpectedValueFromService(_:)(uint64_t a1)
{
  *(void *)&long long v9 = 0;
  *((void *)&v9 + 1) = 0xE000000000000000;
  sub_24F98E328();
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_24F98E058();
  sub_24F9620EC(a1, (uint64_t)&v7);
  if (v8)
  {
    sub_24F9621B4(&v7, &v9);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8D310];
    *(void *)&long long v9 = 7104878;
    *((void *)&v9 + 1) = 0xE300000000000000;
    sub_24F962154((uint64_t)&v7);
  }
  sub_24F98E3D8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v9);
  sub_24F98E058();
  uint64_t v2 = v11;
  unint64_t v3 = v12;
  sub_24F961EF4();
  uint64_t v4 = OUTLINED_FUNCTION_4_4();
  *int v5 = v2;
  v5[1] = v3;
  return OUTLINED_FUNCTION_13_1(v4, (uint64_t)v5);
}

uint64_t sub_24F9620EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F962154(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_24F9621B4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t static GameServicesError.validateCount(foundCount:expectedCount:)(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    sub_24F98E328();
    uint64_t v2 = sub_24F98E648();
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    sub_24F98E058();
    sub_24F98E648();
    sub_24F98E058();
    swift_bridgeObjectRelease();
    sub_24F98E058();
    sub_24F962328();
    swift_allocError();
    sub_24F961EF4();
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = v2;
    v6[1] = v4;
    OUTLINED_FUNCTION_13_1(v5, (uint64_t)v6);
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_24F962328()
{
  unint64_t result = qword_269A35720;
  if (!qword_269A35720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35720);
  }
  return result;
}

BOOL sub_24F962374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v27[1] = a3;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  long long v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v27 - v10;
  uint64_t DynamicType = swift_getDynamicType();
  swift_getErrorValue();
  uint64_t v13 = swift_getDynamicType();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v11, v4, a2);
  if (DynamicType == v13)
  {
    v14(v9, (uint64_t)v11, a2);
    uint64_t v18 = sub_24F98E658();
    if (v18)
    {
      uint64_t v19 = v18;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a2);
    }
    else
    {
      uint64_t v19 = OUTLINED_FUNCTION_4_4();
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v20, v9, a2);
    }
    unsigned __int8 v21 = (void *)sub_24F98DF88();
    MEMORY[0x253367240](v19);
    id v22 = objc_msgSend(v21, sel_code);

    uint64_t v23 = (void *)sub_24F98DF88();
    id v24 = objc_msgSend(v23, sel_code);

    uint64_t v25 = OUTLINED_FUNCTION_9_3();
    v26(v25);
    return v22 == v24;
  }
  else
  {
    uint64_t v15 = OUTLINED_FUNCTION_9_3();
    v16(v15);
    return 0;
  }
}

BOOL Error.shallowEquals(_:)()
{
  OUTLINED_FUNCTION_15_2();
  uint64_t v3 = v2;
  if (qword_269A3BAA8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_269A3BAC8;
  uint64_t v5 = unk_269A3BAD0;
  char v6 = byte_269A3BAD8;
  sub_24F962328();
  uint64_t v7 = OUTLINED_FUNCTION_4_4();
  *(void *)uint64_t v8 = v4;
  *(void *)(v8 + 8) = v5;
  *(unsigned char *)(v8 + 16) = v6;
  sub_24F961A38(v4, v5, v6);
  uint64_t v9 = v3(v7);
  MEMORY[0x253367240](v7);
  BOOL v10 = sub_24F962374(v9, v1, v0);
  MEMORY[0x253367240](v9);
  return v10;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, unint64_t);
  uint64_t v3;
  BOOL v4;

  OUTLINED_FUNCTION_15_2();
  uint64_t v3 = v2(0x7272452074736554, 0xEA0000000000726FLL);
  uint64_t v4 = sub_24F962374(v3, v1, v0);
  MEMORY[0x253367240](v3);
  return v4;
}

uint64_t initializeBufferWithCopyOfBuffer for GameServicesError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F9627AC(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F961A38);
}

uint64_t destroy for GameServicesError(uint64_t a1)
{
  return sub_24F961A60(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t *assignWithCopy for GameServicesError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F962828(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F961A38, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F961A60);
}

uint64_t *assignWithTake for GameServicesError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_24F9628AC(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F961A60);
}

ValueMetadata *type metadata accessor for GameServicesError()
{
  return &type metadata for GameServicesError;
}

uint64_t initializeBufferWithCopyOfBuffer for GameServicesInternalError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F9627AC(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F961BCC);
}

uint64_t destroy for GameServicesInternalError(uint64_t a1)
{
  return sub_24F961A88(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24F9627AC(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for GameServicesInternalError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_24F962828(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_24F961BCC, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F961A88);
}

uint64_t *sub_24F962828(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for GameServicesInternalError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_24F9628AC(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_24F961A88);
}

uint64_t *sub_24F9628AC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t _s21GameServicesProtocols17GameServicesErrorOwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s21GameServicesProtocols17GameServicesErrorOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24F96297C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24F962994(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GameServicesInternalError()
{
  return &type metadata for GameServicesInternalError;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  sub_24F961A60(v3, v2, 1);
  return sub_24F961A60(v1, v0, 1);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  sub_24F961A60(v3, v2, 1);
  uint64_t v4 = sub_24F961A60(v1, v0, 1);
  return MEMORY[0x270F9A7D8](v4);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  sub_24F961A38(v1, v0, 1);
  return sub_24F961A38(v3, v2, 1);
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)uint64_t v2 = result;
  *(void *)(v2 + 8) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  return MEMORY[0x270FA0260](va1, (uint64_t *)va, v6, a4, 6);
}

uint64_t OUTLINED_FUNCTION_16_0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = *a1;
  uint64_t v3 = a1[1];
  *(void *)uint64_t v1 = *a1;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = *((unsigned char *)a1 + 16);
  return result;
}

uint64_t Ref<A>.AchievementRefFields.hash(into:)()
{
  return sub_24F98E708();
}

void *static Ref<A>.AchievementRefFields.allCases.getter()
{
  return &unk_2701158D8;
}

uint64_t sub_24F962BD4()
{
  return Ref<A>.AchievementRefFields.hashValue.getter();
}

uint64_t sub_24F962BEC()
{
  return Ref<A>.AchievementRefFields.hash(into:)();
}

uint64_t sub_24F962C04()
{
  return sub_24F962C50(&qword_269A35948);
}

uint64_t sub_24F962C50(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_24F9688A0();
  OUTLINED_FUNCTION_144();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_140_0();
  OUTLINED_FUNCTION_117_0();
  sub_24F98E3D8();
  return v2;
}

uint64_t sub_24F962CC4(uint64_t a1, uint64_t *a2)
{
  return 0;
}

uint64_t sub_24F962D60(uint64_t a1, uint64_t *a2)
{
  return 0;
}

uint64_t sub_24F962DFC()
{
  swift_getAssociatedTypeWitness();
  sub_24F9688A0();
  OUTLINED_FUNCTION_144();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_140_0();
  sub_24F98E668();
  return v1;
}

void sub_24F962E74(void *a1@<X8>)
{
}

uint64_t Ref<A>.id.getter()
{
  return sub_24F96355C(&qword_269A35728, &qword_269A35948, (uint64_t)&unk_269A357A0, (uint64_t)type metadata accessor for Ref<A>.AchievementRefFields);
}

{
  return sub_24F96355C(&qword_269A35730, &qword_269A35420, (uint64_t)&unk_269A357C8, (uint64_t)type metadata accessor for Ref<A>.ChallengeRefFields);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  uint64_t v1 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_61_0(v1, v2, &qword_269A35758, &qword_269A35750);
  uint64_t result = OUTLINED_FUNCTION_17_0();
  if (!v0)
  {
    uint64_t v4 = sub_24F962D60(0, &qword_269A35750);
    OUTLINED_FUNCTION_68_1(v4, v5);
    OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_46_0();
  }
  return result;
}

{
  return sub_24F96355C(&qword_269A35780, &qword_269A354D8, (uint64_t)&unk_269A35890, (uint64_t)type metadata accessor for Ref<A>.LeaderboardRefFields);
}

void Ref<A>.game.getter()
{
}

{
  sub_24F966FB4(&qword_269A35780, &qword_269A354D8);
}

void *static Ref<A>.GameRefFields.allCases.getter()
{
  return &unk_270115900;
}

uint64_t sub_24F962EF8(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    OUTLINED_FUNCTION_130_0();
    int64_t v7 = v6;
    OUTLINED_FUNCTION_84_0();
    uint64_t v5 = v16;
    uint64_t v8 = (char *)(v7 + 32);
    do
    {
      char v10 = *v8++;
      char v9 = v10;
      OUTLINED_FUNCTION_127_0();
      if (v12)
      {
        sub_24F969950((void *)(v11 > 1), v7, 1);
        uint64_t v5 = v16;
      }
      sub_24F96C76C(0, v2, v1);
      uint64_t v15 = OUTLINED_FUNCTION_83_0();
      LOBYTE(v14) = v9;
      *(void *)(v5 + 16) = v7;
      sub_24F96C8B0(&v14, v5 + 40 * v3 + 32);
      --v4;
    }
    while (v4);
  }
  return v5;
}

uint64_t sub_24F962FD0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_24F969950(0, v1, 0);
    uint64_t v2 = v13;
    uint64_t v4 = (char *)(a1 + 32);
    do
    {
      char v5 = *v4;
      uint64_t v13 = v2;
      unint64_t v7 = *(void *)(v2 + 16);
      unint64_t v6 = *(void *)(v2 + 24);
      if (v7 >= v6 >> 1)
      {
        sub_24F969950((void *)(v6 > 1), v7 + 1, 1);
        uint64_t v2 = v13;
      }
      sub_24F96C76C(0, &qword_269A35818, (uint64_t (*)(void))type metadata accessor for Ref<A>.ContactRefFields);
      uint64_t v11 = v8;
      uint64_t v12 = sub_24F96B59C(&qword_269A35968, &qword_269A35818, (uint64_t (*)(void))type metadata accessor for Ref<A>.ContactRefFields);
      LOBYTE(v10) = v5;
      *(void *)(v2 + 16) = v7 + 1;
      sub_24F96C8B0(&v10, v2 + 40 * v7 + 32);
      ++v4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24F963110(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    OUTLINED_FUNCTION_130_0();
    OUTLINED_FUNCTION_84_0();
    uint64_t v6 = v12;
    do
    {
      OUTLINED_FUNCTION_127_0();
      if (v8)
      {
        sub_24F969950((void *)(v7 > 1), v3, 1);
        uint64_t v6 = v12;
      }
      sub_24F96C76C(0, v2, v1);
      uint64_t v11 = OUTLINED_FUNCTION_83_0();
      *(void *)(v6 + 16) = v3;
      sub_24F96C8B0(&v10, v6 + 40 * v4 + 32);
      --v5;
    }
    while (v5);
  }
  return v6;
}

uint64_t sub_24F9631D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t *a7@<X6>, uint64_t *a8@<X7>, void *a9@<X8>)
{
  uint64_t v56 = a2;
  uint64_t result = sub_24F9689CC(a3, a4, a5);
  if (!v9)
  {
    uint64_t v19 = result;
    uint64_t v20 = v17;
    uint64_t v50 = a8;
    uint64_t v51 = v18;
    uint64_t v49 = a7;
    __swift_instantiateConcreteTypeFromMangledName(a6);
    BOOL v22 = v19 == sub_24F9688A0() && v20 == v21;
    if (v22 || (sub_24F98E678() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = swift_bridgeObjectRetain();
      uint64_t v24 = sub_24F969424(v23, v51);
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)(a1 + 16);
      unsigned __int8 v27 = (void *)MEMORY[0x263F8EE78];
      if (v26)
      {
        uint64_t v56 = v24;
        uint64_t v54 = (void *)MEMORY[0x263F8EE78];
        OUTLINED_FUNCTION_8_4();
        uint64_t v28 = a1 + 32;
        do
        {
          sub_24F96C7B4(v28, (uint64_t)v53);
          __swift_project_boxed_opaque_existential_1(v53, v53[3]);
          uint64_t v29 = OUTLINED_FUNCTION_107_0();
          uint64_t v31 = v30(v29);
          uint64_t v33 = v32;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
          unsigned __int8 v27 = v54;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            OUTLINED_FUNCTION_42_1(isUniquelyReferenced_nonNull_native, v27[2] + 1);
            unsigned __int8 v27 = v54;
          }
          unint64_t v36 = v27[2];
          unint64_t v35 = v27[3];
          if (v36 >= v35 >> 1)
          {
            sub_24F947F9C((char *)(v35 > 1), v36 + 1, 1);
            unsigned __int8 v27 = v54;
          }
          void v27[2] = v36 + 1;
          uint64_t v37 = &v27[2 * v36];
          v37[4] = v31;
          v37[5] = v33;
          v28 += 40;
          --v26;
        }
        while (v26);
        uint64_t v41 = a9;
        uint64_t v40 = v50;
        char v42 = v49;
        uint64_t v25 = v56;
      }
      else
      {
        uint64_t v41 = a9;
        uint64_t v40 = v50;
        char v42 = v49;
      }
      __swift_instantiateConcreteTypeFromMangledName(v42);
      sub_24F9688A0();
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_24F96A078(v25, v27);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v44 = OUTLINED_FUNCTION_107_0();
      uint64_t v46 = sub_24F966128(v44, v45, v43);
      uint64_t v48 = v47;
      swift_bridgeObjectRelease();
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(v40);
      return Ref.init(rawValue:)(v46, v48, v41);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v53[0] = 0;
      v53[1] = 0xE000000000000000;
      sub_24F98E328();
      uint64_t v54 = (void *)a3;
      uint64_t v55 = a4;
      sub_24F98E3D8();
      OUTLINED_FUNCTION_2_4();
      sub_24F98E058();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_4();
      sub_24F962328();
      uint64_t v38 = OUTLINED_FUNCTION_4_4();
      return OUTLINED_FUNCTION_151(v38, v39);
    }
  }
  return result;
}

uint64_t sub_24F96355C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = v4[1];
  swift_bridgeObjectRetain();
  uint64_t v11 = OUTLINED_FUNCTION_107_0();
  uint64_t v13 = sub_24F9646F8(v11, v12, a1, a2);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    uint64_t v14 = sub_24F962C50(a2);
    a4 = sub_24F964A08(v14, v15, v13);
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v17)
    {
      v21[0] = v9;
      v21[1] = v10;
      sub_24F962328();
      OUTLINED_FUNCTION_4_4();
      uint64_t v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(a1);
      static GameServicesError.invalidReference<A>(ref:)(v21, v20);
      swift_willThrow();
    }
  }
  return a4;
}

void Ref<A>.init(id:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962C50(&qword_269A35420);
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  uint64_t v6 = sub_24F98DFE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35420);
  uint64_t v7 = sub_24F9688A0();
  sub_24F966128(v7, v8, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35730);
  uint64_t v17 = OUTLINED_FUNCTION_139_0(v9, v10, v11, v12, v13, v14, v15, v16, v25);
  OUTLINED_FUNCTION_134_0(v17, v18, v19, v20, v21, v22, v23, v24, v26, v27);
}

void *static Ref<A>.ChallengeRefFields.allCases.getter()
{
  return &unk_270115928;
}

uint64_t sub_24F963774()
{
  return sub_24F962C50(&qword_269A35420);
}

void sub_24F9637C0(void *a1@<X8>)
{
}

uint64_t Ref<A>.invite(code:)@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = sub_24F962EF8((uint64_t)&unk_270115950);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_24F963110((uint64_t)&unk_270115978);
  sub_24F96A934(v6);
  uint64_t v7 = sub_24F96393C();
  sub_24F9631D8(v5, v7, v3, v4, &qword_269A35730, &qword_269A35420, &qword_269A35578, &qword_269A35748, a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *static Ref<A>.ChallengeInviteRefFields.allCases.getter()
{
  return &unk_270115950;
}

uint64_t sub_24F96393C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962CC4(0, &qword_269A35578);
  *(void *)(inited + 40) = v5;
  uint64_t v6 = 1701080931;
  if (v3) {
    uint64_t v6 = 0x726579616C70;
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3) {
    unint64_t v7 = 0xE600000000000000;
  }
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v7;
  sub_24F98DFE8();
  swift_bridgeObjectRetain();
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_24F962CC4(1, &qword_269A35578);
    uint64_t v10 = v9;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = OUTLINED_FUNCTION_81_0();
    sub_24F96AF50(v11, v12, v8, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_24F962CC4(2, &qword_269A35578);
    uint64_t v15 = v14;
    swift_isUniquelyReferenced_nonNull_native();
    sub_24F96AF50(v1, v2, v13, v15);
  }
  else
  {
    uint64_t v16 = sub_24F962CC4(3, &qword_269A35578);
    uint64_t v18 = v17;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = OUTLINED_FUNCTION_81_0();
    sub_24F96AF50(v19, v20, v16, v18);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t Ref<A>.invite(from:to:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v10 = *v3;
  uint64_t v11 = v3[1];
  uint64_t v82 = *a1;
  uint64_t v83 = v7;
  uint64_t result = Ref<A>.playerID.getter((uint64_t)&v84);
  if (!v4)
  {
    uint64_t v20 = OUTLINED_FUNCTION_126_0(result, v13, v14, v15, v16, v17, v18, v19, v61, v64, v69, v74, v79, v82, v83, v84);
    if (v25)
    {
      uint64_t v26 = v20;
      uint64_t v27 = v21;
      uint64_t v80 = v22;
      uint64_t v82 = v8;
      uint64_t v89 = v23;
      uint64_t v83 = v9;
      uint64_t v28 = Ref<A>.playerID.getter((uint64_t)&v84);
      uint64_t v36 = OUTLINED_FUNCTION_126_0(v28, v29, v30, v31, v32, v33, v34, v35, v62, v65, v70, v75, v80, v82, v83, v84);
      if (v25)
      {
        uint64_t v41 = v37;
        uint64_t v72 = v38;
        uint64_t v77 = v39;
        uint64_t v42 = v36;
        uint64_t v43 = sub_24F962EF8((uint64_t)&unk_270115950);
        swift_bridgeObjectRelease();
        uint64_t v44 = (void *)sub_24F963110((uint64_t)&unk_2701159C8);
        uint64_t v84 = v43;
        sub_24F96A934(v44);
        uint64_t v67 = v84;
        uint64_t v84 = v26;
        uint64_t v85 = v27;
        uint64_t v86 = v42;
        uint64_t v87 = v41;
        char v88 = 1;
        uint64_t v45 = sub_24F96393C();
        OUTLINED_FUNCTION_22_0(v45, v46, v47, v48, v49, v50, v51, v52, v63, v67, v72, v77, v81);
        sub_24F96B09C(v42, v41, v73, v78, 1);
        sub_24F9631D8(v68, v45, v10, v11, &qword_269A35730, &qword_269A35420, &qword_269A35578, &qword_269A35748, a3);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      uint64_t v53 = sub_24F96B09C(v36, v37, v38, v39, v40);
      OUTLINED_FUNCTION_22_0(v53, v54, v55, v56, v57, v58, v59, v60, v63, v66, v71, v76, v81);
      uint64_t v84 = v8;
      uint64_t v85 = v9;
    }
    else
    {
      sub_24F96B09C(v20, v21, v22, v23, v24);
      uint64_t v84 = v6;
      uint64_t v85 = v7;
    }
    sub_24F962328();
    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_30_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35740);
    static GameServicesError.invalidReference<A>(ref:)(&v84, (uint64_t)&v82);
    return swift_willThrow();
  }
  return result;
}

uint64_t Ref<A>.playerID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  v26[0] = *v1;
  uint64_t result = (uint64_t)Ref<A>.playerIDs.getter();
  if (v2) {
    return result;
  }
  uint64_t v7 = *(void *)(result + 16);
  if (!v7)
  {
    swift_bridgeObjectRelease();
    v26[0] = v4;
    v26[1] = v5;
    sub_24F962328();
    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_153();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35740);
    static GameServicesError.invalidReference<A>(ref:)(v26, v4);
    return swift_willThrow();
  }
  uint64_t v23 = a1;
  uint64_t v8 = *(void *)(result + 32);
  uint64_t v9 = *(void *)(result + 40);
  uint64_t v10 = *(void *)(result + 48);
  uint64_t v11 = *(void *)(result + 56);
  uint64_t v12 = result;
  char v13 = *(unsigned char *)(result + 64);
  uint64_t v14 = v7 - 1;
  if (v7 == 1)
  {
    uint64_t v15 = *(void *)(result + 32);
    sub_24F96B104(v15, v9, v10, v11, v13);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v27 = v8;
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  uint64_t v16 = v11;
  sub_24F96B104(v8, v9, v10, v11, v13);
  uint64_t v17 = (char *)(v12 + 104);
  do
  {
    uint64_t v19 = *((void *)v17 - 4);
    uint64_t v18 = *((void *)v17 - 3);
    uint64_t v20 = *((void *)v17 - 2);
    uint64_t v21 = *((void *)v17 - 1);
    char v22 = *v17;
    if (v13)
    {
      if (v13 == 1) {
        goto LABEL_14;
      }
      if (((3u >> (v22 & 7)) & 1) == 0)
      {
        char v13 = 2;
        goto LABEL_14;
      }
    }
    else if ((*v17 & 1) == 0)
    {
      char v13 = 0;
      goto LABEL_14;
    }
    sub_24F96B104(*((void *)v17 - 4), *((void *)v17 - 3), *((void *)v17 - 2), *((void *)v17 - 1), *v17);
    sub_24F96B09C(v27, v25, v24, v16, v13);
    uint64_t v27 = v19;
    uint64_t v24 = v20;
    uint64_t v25 = v18;
    uint64_t v16 = v21;
    char v13 = v22;
LABEL_14:
    v17 += 40;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  uint64_t v15 = v27;
  uint64_t v10 = v24;
  uint64_t v9 = v25;
  uint64_t v11 = v16;
LABEL_16:
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)uint64_t v23 = v15;
  *(void *)(v23 + 8) = v9;
  *(void *)(v23 + 16) = v10;
  *(void *)(v23 + 24) = v11;
  *(unsigned char *)(v23 + 32) = v13;
  return result;
}

#error "24F964204: call analysis failed (funcsize=158)"

uint64_t static Ref<A>.InviteDetails.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  char v10 = *(unsigned char *)(a2 + 32);
  if (a1[4])
  {
    if (*(unsigned char *)(a2 + 32))
    {
      if (v2 != v6 || v3 != v7)
      {
        uint64_t v12 = *(void *)(a2 + 24);
        char v13 = sub_24F98E678();
        uint64_t v8 = v12;
        if ((v13 & 1) == 0)
        {
          char v33 = 0;
          goto LABEL_24;
        }
      }
      if (v4 != v9 || v5 != v8)
      {
        uint64_t v15 = v9;
        uint64_t v16 = v8;
        char v17 = sub_24F98E678();
        uint64_t v8 = v16;
        uint64_t v9 = v15;
        char v33 = v17;
LABEL_24:
        char v10 = 1;
        goto LABEL_25;
      }
      char v10 = 1;
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  if (*(unsigned char *)(a2 + 32))
  {
LABEL_14:
    char v33 = 0;
    goto LABEL_25;
  }
  if (v2 == v6 && v3 == v7)
  {
    char v10 = 0;
LABEL_22:
    char v33 = 1;
    goto LABEL_25;
  }
  uint64_t v19 = *(void *)(a2 + 24);
  char v20 = sub_24F98E678();
  uint64_t v8 = v19;
  char v33 = v20;
  char v10 = 0;
LABEL_25:
  uint64_t v21 = v8;
  sub_24F96B16C(v6, v7, v9, v8, v10);
  uint64_t v22 = OUTLINED_FUNCTION_92_0();
  sub_24F96B16C(v22, v23, v24, v25, v26);
  uint64_t v27 = OUTLINED_FUNCTION_92_0();
  sub_24F96B1AC(v27, v28, v29, v30, v31);
  sub_24F96B1AC(v6, v7, v9, v21, v10);
  return v33 & 1;
}

uint64_t sub_24F9643EC()
{
  uint64_t v0 = OUTLINED_FUNCTION_115_0();
  return sub_24F962CC4(v0, &qword_269A35578);
}

void sub_24F964438(void *a1@<X8>)
{
}

uint64_t Ref<A>.inviteDetails.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24F9646F8(v5, v4, &qword_269A35748, &qword_269A35578);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v8 = sub_24F962CC4(0, &qword_269A35578);
    uint64_t v10 = sub_24F964A08(v8, v9, v6);
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v12)
    {
      BOOL v13 = v10 == 0x726579616C70 && v12 == 0xE600000000000000;
      if (v13 || (OUTLINED_FUNCTION_91_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = sub_24F962CC4(1, &qword_269A35578);
        uint64_t v16 = sub_24F964A08(v14, v15, v6);
        uint64_t v18 = v17;
        swift_bridgeObjectRelease();
        if (v18)
        {
          uint64_t v19 = sub_24F962CC4(2, &qword_269A35578);
          uint64_t v21 = sub_24F964A08(v19, v20, v6);
          uint64_t v23 = v22;
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v23)
          {
            *(void *)a1 = v16;
            *(void *)(a1 + 8) = v18;
            *(void *)(a1 + 16) = v21;
            *(void *)(a1 + 24) = v23;
            *(unsigned char *)(a1 + 32) = 1;
            return result;
          }
        }
        goto LABEL_16;
      }
      if (v10 == 1701080931 && v12 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v25 = OUTLINED_FUNCTION_91_0();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0) {
          goto LABEL_16;
        }
      }
      uint64_t v34 = sub_24F962CC4(3, &qword_269A35578);
      uint64_t v36 = sub_24F964A08(v34, v35, v6);
      uint64_t v38 = v37;
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v38)
      {
        *(void *)a1 = v36;
        *(void *)(a1 + 8) = v38;
        *(void *)(a1 + 16) = 0;
        *(void *)(a1 + 24) = 0;
        *(unsigned char *)(a1 + 32) = 0;
        return result;
      }
      goto LABEL_17;
    }
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    sub_24F962328();
    OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_30_1();
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35748);
    OUTLINED_FUNCTION_53_1(v26, v27, v28, v29, v30, v31, v32, v33, v5);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24F9646F8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v9 = sub_24F9689CC(a1, a2, a3);
  uint64_t v12 = v11;
  if (!v4)
  {
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(a4);
    if (sub_24F9688A0() == v13 && v15 == v14)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v17 = OUTLINED_FUNCTION_91_0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v21[0] = a1;
        v21[1] = a2;
        sub_24F962328();
        OUTLINED_FUNCTION_4_4();
        uint64_t v19 = v18;
        __swift_instantiateConcreteTypeFromMangledName(a3);
        static GameServicesError.invalidReference<A>(ref:)(v21, v19);
        swift_willThrow();
      }
    }
  }
  return v12;
}

#error "24F9648B8: call analysis failed (funcsize=128)"

uint64_t sub_24F964A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_24F9480BC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t Ref<A>.associationID.getter()
{
  uint64_t v1 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_61_0(v1, v2, &qword_269A35758, &qword_269A35750);
  uint64_t result = OUTLINED_FUNCTION_17_0();
  if (!v0)
  {
    uint64_t v4 = sub_24F962D60(1, &qword_269A35750);
    OUTLINED_FUNCTION_68_1(v4, v5);
    OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_46_0();
  }
  return result;
}

void *static Ref<A>.ContactRefFields.allCases.getter()
{
  return &unk_270115A18;
}

uint64_t sub_24F964B9C()
{
  uint64_t v0 = OUTLINED_FUNCTION_115_0();
  return sub_24F962D60(v0, &qword_269A35750);
}

void sub_24F964BE8(void *a1@<X8>)
{
}

#error "24F964E54: call analysis failed (funcsize=158)"

uint64_t Ref<A>.init(id:associationID:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  if (a1 | a3)
  {
    uint64_t v34 = MEMORY[0x263F8EE80];
    uint64_t v10 = sub_24F962D60(0, &qword_269A35750);
    if (a1)
    {
      swift_isUniquelyReferenced_nonNull_native();
      OUTLINED_FUNCTION_80_0();
      uint64_t v12 = OUTLINED_FUNCTION_141_0();
      sub_24F96AF50(v12, v13, v14, v15);
      uint64_t v34 = v31;
    }
    else
    {
      sub_24F96AE40(v10, v11);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24F962D60(1, &qword_269A35750);
    uint64_t v18 = v16;
    uint64_t v19 = v17;
    if (a3)
    {
      swift_isUniquelyReferenced_nonNull_native();
      OUTLINED_FUNCTION_80_0();
      sub_24F96AF50(a2, a3, v18, v19);
      uint64_t v20 = v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24F96AE40(v16, v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = v34;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    uint64_t v21 = sub_24F9688A0();
    sub_24F966128(v21, v22, v20);
    OUTLINED_FUNCTION_112_0();
    swift_bridgeObjectRelease();
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35758);
    uint64_t result = OUTLINED_FUNCTION_138_0(v23, v24, v25, v26, v27, v28, v29, v30, v31);
    *a4 = v32;
    a4[1] = v33;
  }
  else
  {
    sub_24F962328();
    OUTLINED_FUNCTION_4_4();
    *(void *)uint64_t v5 = 0xD000000000000026;
    *(void *)(v5 + 8) = 0x800000024F998B30;
    *(unsigned char *)(v5 + 16) = 0;
    return swift_willThrow();
  }
  return result;
}

#error "24F965300: call analysis failed (funcsize=158)"

uint64_t Ref<A>.adamID.getter()
{
  return sub_24F965368(0);
}

uint64_t Ref<A>.bundleID.getter()
{
  return sub_24F965368(1);
}

uint64_t sub_24F965368(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24F9646F8(v5, v4, &qword_269A35760, &qword_269A35410);
  swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v7 = sub_24F962CC4(a1, &qword_269A35410);
    a1 = sub_24F964A08(v7, v8, v6);
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v10)
    {
      sub_24F962328();
      OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_30_1();
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35760);
      OUTLINED_FUNCTION_53_1(v12, v13, v14, v15, v16, v17, v18, v19, v5);
      swift_willThrow();
    }
  }
  return a1;
}

void Ref<A>.init(bundleID:)(uint64_t a1, uint64_t a2)
{
}

BOOL static Ref<A>.GameRefFields.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Ref<A>.GameRefFields.hash(into:)()
{
  return sub_24F98E708();
}

uint64_t sub_24F9654F4()
{
  uint64_t v0 = OUTLINED_FUNCTION_115_0();
  return sub_24F962CC4(v0, &qword_269A35410);
}

void sub_24F965540(void *a1@<X8>)
{
}

uint64_t Ref<A>.nillableAdamID.getter()
{
  uint64_t v1 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_61_0(v1, v2, &qword_269A35760, &qword_269A35410);
  uint64_t result = OUTLINED_FUNCTION_17_0();
  if (!v0)
  {
    uint64_t v4 = sub_24F962CC4(0, &qword_269A35410);
    OUTLINED_FUNCTION_68_1(v4, v5);
    OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_46_0();
  }
  return result;
}

uint64_t Ref<A>.nillableBundleID.getter()
{
  uint64_t v1 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_61_0(v1, v2, &qword_269A35760, &qword_269A35410);
  uint64_t result = OUTLINED_FUNCTION_17_0();
  if (!v0)
  {
    uint64_t v4 = sub_24F962CC4(1, &qword_269A35410);
    OUTLINED_FUNCTION_68_1(v4, v5);
    OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_46_0();
  }
  return result;
}

uint64_t Ref<A>.platform.getter()
{
  uint64_t v1 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_61_0(v1, v2, &qword_269A35760, &qword_269A35410);
  uint64_t result = OUTLINED_FUNCTION_17_0();
  if (!v0)
  {
    uint64_t v4 = sub_24F962CC4(2, &qword_269A35410);
    OUTLINED_FUNCTION_68_1(v4, v5);
    OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_46_0();
  }
  return result;
}

uint64_t Ref<A>.shortBundleVersion.getter()
{
  uint64_t v1 = OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_61_0(v1, v2, &qword_269A35760, &qword_269A35410);
  uint64_t result = OUTLINED_FUNCTION_17_0();
  if (!v0)
  {
    uint64_t v4 = sub_24F962CC4(3, &qword_269A35410);
    OUTLINED_FUNCTION_68_1(v4, v5);
    OUTLINED_FUNCTION_15_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_46_0();
  }
  return result;
}

uint64_t Ref<A>.init(bundleID:adamID:platform:shortBundleVersion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, void *a8@<X8>)
{
  uint64_t v61 = a4;
  uint64_t v62 = a6;
  uint64_t v63 = a8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962CC4(1, &qword_269A35410);
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  uint64_t v15 = sub_24F98DFE8();
  uint64_t v65 = v15;
  uint64_t v16 = sub_24F962CC4(0, &qword_269A35410);
  if (a3)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v65 = 0x8000000000000000;
    uint64_t v18 = OUTLINED_FUNCTION_141_0();
    uint64_t v22 = sub_24F96AF50(v18, v19, v20, v21);
    OUTLINED_FUNCTION_78_1(v22, v23, v24, v25, v26, v27, v28, v29, v61, v62, (uint64_t)v63, v15);
  }
  else
  {
    sub_24F96AE40(v16, v17);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_24F962CC4(2, &qword_269A35410);
  uint64_t v32 = v30;
  uint64_t v33 = v31;
  if (a5)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_79_1();
    uint64_t v34 = sub_24F96AF50(v61, a5, v32, v33);
    OUTLINED_FUNCTION_78_1(v34, v35, v36, v37, v38, v39, v40, v41, v61, v62, (uint64_t)v63, v64[0]);
  }
  else
  {
    sub_24F96AE40(v30, v31);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v42 = sub_24F962CC4(3, &qword_269A35410);
  uint64_t v44 = v42;
  uint64_t v45 = v43;
  if (a7)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_79_1();
    uint64_t v46 = sub_24F96AF50(v62, a7, v44, v45);
    OUTLINED_FUNCTION_78_1(v46, v47, v48, v49, v50, v51, v52, v53, v61, v62, (uint64_t)v63, v64[0]);
  }
  else
  {
    sub_24F96AE40(v42, v43);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
  uint64_t v54 = sub_24F9688A0();
  uint64_t v56 = sub_24F966128(v54, v55, v65);
  uint64_t v58 = v57;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35760);
  uint64_t result = Ref.init(rawValue:)(v56, v58, v64);
  uint64_t v60 = v64[1];
  *uint64_t v63 = v64[0];
  v63[1] = v60;
  return result;
}

void Ref<A>.achievement(id:)()
{
  OUTLINED_FUNCTION_93_0();
  uint64_t v4 = sub_24F963110((uint64_t)&unk_270115A90);
  uint64_t v5 = (void *)sub_24F962EF8((uint64_t)&unk_270115900);
  swift_bridgeObjectRelease();
  uint64_t v38 = v4;
  sub_24F96A934(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962C50(&qword_269A35948);
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v0;
  swift_bridgeObjectRetain();
  sub_24F98DFE8();
  sub_24F9689CC(v1, v2, &qword_269A35760);
  if (!v40)
  {
    OUTLINED_FUNCTION_58_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F9688A0();
    OUTLINED_FUNCTION_55_1();
    BOOL v9 = v9 && inited == v8;
    if (v9 || (OUTLINED_FUNCTION_3_4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v10 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_145(v10);
      OUTLINED_FUNCTION_135_0();
      uint64_t v36 = inited;
      if (v2)
      {
        uint64_t v39 = MEMORY[0x263F8EE78];
        OUTLINED_FUNCTION_8_4();
        do
        {
          sub_24F96C7B4(inited + 32, (uint64_t)&v38);
          uint64_t v11 = OUTLINED_FUNCTION_4_5(&v38);
          uint64_t v13 = v12(v11);
          OUTLINED_FUNCTION_123_0(v13, v14, v15, v16, v17, v18, v19, v20, v35, v36, v37);
          uint64_t v21 = v39;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            OUTLINED_FUNCTION_42_1(isUniquelyReferenced_nonNull_native, *(void *)(v21 + 16) + 1);
          }
          OUTLINED_FUNCTION_14_3();
          if (v24) {
            OUTLINED_FUNCTION_96_0(v23);
          }
          OUTLINED_FUNCTION_10_4();
        }
        while (!v9);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35948);
      sub_24F9688A0();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_47_1();
      OUTLINED_FUNCTION_51_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_52_1();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35728);
      OUTLINED_FUNCTION_48_1();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v25 = OUTLINED_FUNCTION_142_0();
      OUTLINED_FUNCTION_132_0(v25, v26, v27, v28, v29, v30, v31, v32, v35);
      sub_24F98E3D8();
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_56_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_4();
      sub_24F962328();
      uint64_t v33 = OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_13_2(v33, v34);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_136_0();
}

void Ref<A>.leaderboard(id:)()
{
  OUTLINED_FUNCTION_93_0();
  uint64_t v4 = sub_24F963110((uint64_t)&unk_270115AB8);
  uint64_t v5 = (void *)sub_24F962EF8((uint64_t)&unk_270115900);
  swift_bridgeObjectRelease();
  uint64_t v38 = v4;
  sub_24F96A934(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962C50(&qword_269A354D8);
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v0;
  swift_bridgeObjectRetain();
  sub_24F98DFE8();
  sub_24F9689CC(v1, v2, &qword_269A35760);
  if (!v40)
  {
    OUTLINED_FUNCTION_58_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F9688A0();
    OUTLINED_FUNCTION_55_1();
    BOOL v9 = v9 && inited == v8;
    if (v9 || (OUTLINED_FUNCTION_3_4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v10 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_145(v10);
      OUTLINED_FUNCTION_135_0();
      uint64_t v36 = inited;
      if (v2)
      {
        uint64_t v39 = MEMORY[0x263F8EE78];
        OUTLINED_FUNCTION_8_4();
        do
        {
          sub_24F96C7B4(inited + 32, (uint64_t)&v38);
          uint64_t v11 = OUTLINED_FUNCTION_4_5(&v38);
          uint64_t v13 = v12(v11);
          OUTLINED_FUNCTION_123_0(v13, v14, v15, v16, v17, v18, v19, v20, v35, v36, v37);
          uint64_t v21 = v39;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            OUTLINED_FUNCTION_42_1(isUniquelyReferenced_nonNull_native, *(void *)(v21 + 16) + 1);
          }
          OUTLINED_FUNCTION_14_3();
          if (v24) {
            OUTLINED_FUNCTION_96_0(v23);
          }
          OUTLINED_FUNCTION_10_4();
        }
        while (!v9);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
      sub_24F9688A0();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_47_1();
      OUTLINED_FUNCTION_51_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_52_1();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35780);
      OUTLINED_FUNCTION_48_1();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v25 = OUTLINED_FUNCTION_142_0();
      OUTLINED_FUNCTION_132_0(v25, v26, v27, v28, v29, v30, v31, v32, v35);
      sub_24F98E3D8();
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_56_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_4();
      sub_24F962328();
      uint64_t v33 = OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_13_2(v33, v34);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_136_0();
}

void *static Ref<A>.LeaderboardRefFields.allCases.getter()
{
  return &unk_270115AE0;
}

uint64_t sub_24F966128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = sub_24F98DEA8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_0();
  sub_24F98DF68();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_48_0();
  sub_24F98DF58();
  sub_24F98DF28();
  MEMORY[0x2533667C0](0x70612E73656D6167, 0xEF6D6F632E656C70);
  uint64_t v29 = 47;
  unint64_t v30 = 0xE100000000000000;
  sub_24F98E058();
  sub_24F98DF08();
  sub_24F949C40(a3, &v29);
  int64_t v9 = v32;
  uint64_t v10 = v33;
  unint64_t v26 = v30;
  int64_t v27 = (unint64_t)(v31 + 64) >> 6;
  swift_bridgeObjectRetain();
  size_t v11 = MEMORY[0x263F8EE78];
  if (!v10) {
    goto LABEL_3;
  }
LABEL_2:
  v10 &= v10 - 1;
  while (1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24F98DE68();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      size_t v11 = sub_24F96AA2C(0, *(void *)(v11 + 16) + 1, 1, v11);
    }
    unint64_t v20 = *(void *)(v11 + 16);
    unint64_t v19 = *(void *)(v11 + 24);
    if (v20 >= v19 >> 1) {
      size_t v11 = sub_24F96AA2C(v19 > 1, v20 + 1, 1, v11);
    }
    *(void *)(v11 + 16) = v20 + 1;
    (*(void (**)(size_t, uint64_t, uint64_t))(v6 + 32))(v11+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v20, v3, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v12 >= v27) {
      goto LABEL_34;
    }
    uint64_t v13 = *(void *)(v26 + 8 * v12);
    int64_t v14 = v9 + 1;
    if (!v13)
    {
      OUTLINED_FUNCTION_76_1();
      if (v15 == v16) {
        goto LABEL_34;
      }
      OUTLINED_FUNCTION_75_0();
      if (!v13)
      {
        OUTLINED_FUNCTION_76_1();
        if (v15 == v16) {
          goto LABEL_34;
        }
        OUTLINED_FUNCTION_75_0();
        if (!v13)
        {
          OUTLINED_FUNCTION_76_1();
          if (v15 == v16) {
            goto LABEL_34;
          }
          OUTLINED_FUNCTION_75_0();
          if (!v13)
          {
            OUTLINED_FUNCTION_76_1();
            if (v15 == v16) {
              goto LABEL_34;
            }
            OUTLINED_FUNCTION_75_0();
            if (!v13)
            {
              OUTLINED_FUNCTION_76_1();
              if (v15 == v16) {
                goto LABEL_34;
              }
              OUTLINED_FUNCTION_75_0();
              if (!v13)
              {
                int64_t v14 = v17 + 6;
                if (v17 + 6 >= v27) {
                  goto LABEL_34;
                }
                uint64_t v13 = *(void *)(v26 + 8 * v14);
                if (!v13) {
                  break;
                }
              }
            }
          }
        }
      }
    }
LABEL_27:
    uint64_t v10 = (v13 - 1) & v13;
    int64_t v9 = v14;
  }
  int64_t v18 = v9 + 8;
  while (v18 < v27)
  {
    uint64_t v13 = *(void *)(v26 + 8 * v18++);
    if (v13)
    {
      int64_t v14 = v18 - 1;
      goto LABEL_27;
    }
  }
LABEL_34:
  swift_release();
  sub_24F9694B0(v11);
  swift_bridgeObjectRelease();
  sub_24F98DEC8();
  uint64_t v21 = sub_24F98DF48();
  if (v22)
  {
    uint64_t v23 = v21;
    OUTLINED_FUNCTION_2_2();
    v24();
    return v23;
  }
LABEL_37:
  sub_24F98E328();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_122_0();
  sub_24F98E058();
  sub_24F98E058();
  sub_24F98DFD8();
  sub_24F98E058();
  swift_bridgeObjectRelease();
  uint64_t result = OUTLINED_FUNCTION_120_0();
  __break(1u);
  return result;
}

uint64_t sub_24F966590()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990920;
  *(void *)(inited + 32) = sub_24F962D60(1, &qword_269A35398);
  *(void *)(inited + 40) = v4;
  OUTLINED_FUNCTION_116_0();
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = v6;
  *(void *)(inited + 64) = sub_24F962D60(0, &qword_269A35398);
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = v2;
  *(void *)(inited + 88) = v1;
  swift_bridgeObjectRetain();
  return sub_24F98DFE8();
}

uint64_t static Ref<A>.URLType.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return OUTLINED_FUNCTION_56();
  }
  else {
    return sub_24F98E678();
  }
}

BOOL static Ref<A>.ImageRefFields.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Ref<A>.ImageRefFields.hash(into:)()
{
  return sub_24F98E708();
}

void *static Ref<A>.ImageRefFields.allCases.getter()
{
  return &unk_270115B08;
}

uint64_t _s21GameServicesProtocols3RefVA2A21ChallengeInviteEntity_pRszlE0efD6FieldsO9hashValueSivg_0()
{
  return sub_24F98E718();
}

uint64_t sub_24F966734()
{
  return sub_24F98E718();
}

uint64_t sub_24F966770()
{
  uint64_t v0 = OUTLINED_FUNCTION_115_0();
  return sub_24F962D60(v0, &qword_269A35398);
}

void sub_24F9667BC(void *a1@<X8>)
{
}

uint64_t Ref<A>.type.getter()
{
  uint64_t v4 = *v0;
  uint64_t v3 = v0[1];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24F9646F8(v4, v3, &qword_269A35768, &qword_269A35398);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    uint64_t v6 = sub_24F962D60(1, &qword_269A35398);
    uint64_t v2 = sub_24F964A08(v6, v7, v5);
    uint64_t v9 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v9)
    {
      sub_24F962328();
      OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_30_1();
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35768);
      OUTLINED_FUNCTION_53_1(v11, v12, v13, v14, v15, v16, v17, v18, v4);
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t Ref<A>.init(templateURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = sub_24F98DE58();
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_24_0();
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  sub_24F98DE48();
  sub_24F96B1FC();
  uint64_t v11 = sub_24F98E2D8();
  uint64_t v13 = v12;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v7);
  if (v13)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24F990920;
    *(void *)(inited + 32) = sub_24F962D60(0, &qword_269A35398);
    *(void *)(inited + 40) = v15;
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = v13;
    *(void *)(inited + 64) = sub_24F962D60(1, &qword_269A35398);
    *(void *)(inited + 72) = v16;
    OUTLINED_FUNCTION_116_0();
    *(void *)(inited + 80) = v17;
    *(void *)(inited + 88) = v18;
    uint64_t v19 = sub_24F98DFE8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
    uint64_t v20 = sub_24F9688A0();
    sub_24F966128(v20, v21, v19);
    OUTLINED_FUNCTION_112_0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35768);
    uint64_t result = Ref.init(rawValue:)((uint64_t)&qword_269A35398, v13, &v26);
    uint64_t v23 = v27;
    *a3 = v26;
    a3[1] = v23;
  }
  else
  {
    sub_24F98E328();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_122_0();
    sub_24F98E058();
    swift_bridgeObjectRelease();
    sub_24F962328();
    uint64_t v24 = OUTLINED_FUNCTION_4_4();
    return OUTLINED_FUNCTION_151(v24, v25);
  }
  return result;
}

uint64_t Ref<A>.urlString.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  uint64_t v3 = OUTLINED_FUNCTION_107_0();
  uint64_t v7 = sub_24F9646F8(v3, v4, v5, v6);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    uint64_t v8 = sub_24F962D60(0, &qword_269A35398);
    sub_24F964A08(v8, v9, v7);
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v11 || (sub_24F96B1FC(), uint64_t v7 = sub_24F98E2E8(), v13 = v12, swift_bridgeObjectRelease(), !v13))
    {
      sub_24F962328();
      OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_30_1();
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35768);
      OUTLINED_FUNCTION_53_1(v14, v15, v16, v17, v18, v19, v20, v21, v2);
      swift_willThrow();
    }
  }
  return v7;
}

uint64_t Ref<A>.url.getter()
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35778);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_48_0();
  uint64_t v4 = *v0;
  uint64_t v5 = v0[1];
  uint64_t v10 = *v0;
  uint64_t v11 = v5;
  uint64_t result = Ref<A>.urlString.getter();
  if (!v1)
  {
    sub_24F98DF98();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_24F98DFA8();
    if (__swift_getEnumTagSinglePayload(v2, 1, v7) == 1)
    {
      sub_24F96C714(v2, &qword_269A35778);
      uint64_t v10 = v4;
      uint64_t v11 = v5;
      sub_24F962328();
      OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_30_1();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35768);
      static GameServicesError.invalidReference<A>(ref:)(&v10, v7);
      return swift_willThrow();
    }
    else
    {
      uint64_t v8 = OUTLINED_FUNCTION_107_0();
      return v9(v8);
    }
  }
  return result;
}

void Ref<A>.init(leaderboardID:gameBundleID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990920;
  *(void *)(inited + 32) = sub_24F962C50(&qword_269A354D8);
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  *(void *)(inited + 64) = sub_24F962CC4(1, &qword_269A35410);
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = a3;
  *(void *)(inited + 88) = a4;
  uint64_t v11 = sub_24F98DFE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
  uint64_t v12 = sub_24F9688A0();
  sub_24F966128(v12, v13, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35780);
  uint64_t v22 = OUTLINED_FUNCTION_139_0(v14, v15, v16, v17, v18, v19, v20, v21, v30);
  OUTLINED_FUNCTION_134_0(v22, v23, v24, v25, v26, v27, v28, v29, v31, v32);
}

uint64_t sub_24F966F34()
{
  return sub_24F962C50(&qword_269A354D8);
}

void sub_24F966F80(void *a1@<X8>)
{
}

void sub_24F966FB4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v25 = a2;
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v7 = sub_24F962EF8((uint64_t)&unk_270115900);
  swift_bridgeObjectRelease();
  sub_24F98DFE8();
  sub_24F9689CC(v6, v5, a1);
  if (!v3)
  {
    uint64_t v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(v25);
    sub_24F9688A0();
    OUTLINED_FUNCTION_55_1();
    BOOL v11 = v11 && v9 == v10;
    if (v11 || (OUTLINED_FUNCTION_3_4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_145(v12);
      if (*(void *)(v7 + 16))
      {
        uint64_t v23 = MEMORY[0x263F8EE78];
        OUTLINED_FUNCTION_8_4();
        do
        {
          sub_24F96C7B4(v7 + 32, (uint64_t)v22);
          int64_t v13 = v22[3];
          uint64_t v14 = OUTLINED_FUNCTION_4_5(v22);
          v15(v14);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
          uint64_t v16 = v23;
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            OUTLINED_FUNCTION_42_1(isUniquelyReferenced_nonNull_native, *(void *)(v16 + 16) + 1);
          }
          OUTLINED_FUNCTION_14_3();
          if (v19) {
            sub_24F947F9C((char *)(v18 > 1), v13, 1);
          }
          OUTLINED_FUNCTION_10_4();
        }
        while (!v11);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
      sub_24F9688A0();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_47_1();
      OUTLINED_FUNCTION_51_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_45_0();
      OUTLINED_FUNCTION_52_1();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35760);
      OUTLINED_FUNCTION_48_1();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v22[0] = 0;
      v22[1] = 0xE000000000000000;
      sub_24F98E328();
      uint64_t v23 = v6;
      uint64_t v24 = v5;
      sub_24F98E3D8();
      OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_56_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_4();
      sub_24F962328();
      uint64_t v20 = OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_13_2(v20, v21);
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_136_0();
}

void Ref<A>.init(leaderboardID:game:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v7 = *a3;
  uint64_t v6 = a3[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962C50(&qword_269A354D8);
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  uint64_t v10 = sub_24F98DFE8();
  uint64_t v11 = sub_24F9646F8(v7, v6, &qword_269A35760, &qword_269A35410);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33[0] = v10;
    sub_24F96A748(v12, (uint64_t)sub_24F96B294, 0, isUniquelyReferenced_nonNull_native, v33);
    uint64_t v14 = v33[0];
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354D8);
    uint64_t v15 = sub_24F9688A0();
    sub_24F966128(v15, v16, v14);
    OUTLINED_FUNCTION_112_0();
    swift_bridgeObjectRelease();
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35780);
    uint64_t v25 = OUTLINED_FUNCTION_138_0(v17, v18, v19, v20, v21, v22, v23, v24, v33[0]);
    OUTLINED_FUNCTION_134_0(v25, v26, v27, v28, v29, v30, v31, v32, v33[0], v33[1]);
  }
}

uint64_t Ref<A>.internalID.getter()
{
  uint64_t v2 = *v0;
  uint64_t v3 = v0[1];
  v5[0] = *v0;
  v5[1] = v3;
  uint64_t result = Ref<A>.playerID.getter((uint64_t)&v6);
  if (!v1)
  {
    uint64_t result = v6;
    if (v10 != 1)
    {
      sub_24F96B09C(v6, v7, v8, v9, v10);
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      sub_24F962328();
      OUTLINED_FUNCTION_4_4();
      OUTLINED_FUNCTION_30_1();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35740);
      static GameServicesError.invalidReference<A>(ref:)(&v6, (uint64_t)v5);
      return swift_willThrow();
    }
  }
  return result;
}

void Ref<A>.init(internalID:)(uint64_t a1, uint64_t a2)
{
}

void sub_24F96753C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35738);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24F990910;
  *(void *)(inited + 32) = sub_24F962CC4(1, a3);
  *(void *)(inited + 40) = v11;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  uint64_t v12 = sub_24F98DFE8();
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v13 = sub_24F9688A0();
  sub_24F966128(v13, v14, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v15 = OUTLINED_FUNCTION_46_0();
  uint64_t v18 = Ref.init(rawValue:)(v15, v16, v17);
  OUTLINED_FUNCTION_134_0(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
}

BOOL sub_24F967640(uint64_t a1, uint64_t a2)
{
  return qword_24F993BF8[*(char *)(a1 + 32)] < qword_24F993BF8[*(char *)(a2 + 32)];
}

uint64_t (**sub_24F967664())()
{
  return &off_2701158C8;
}

BOOL (*static Ref<A>.PlayerID.precedenceSorter.getter())(uint64_t a1, uint64_t a2)
{
  return sub_24F967640;
}

uint64_t static Ref<A>.PlayerID.== infix(_:_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  int v6 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  int v9 = *((unsigned __int8 *)a2 + 32);
  if (!*(unsigned char *)(a1 + 32))
  {
    if (*((unsigned char *)a2 + 32)) {
      goto LABEL_24;
    }
    BOOL v11 = v3 == v8 && v2 == v7;
    if (!v11 && (OUTLINED_FUNCTION_28_1() & 1) == 0)
    {
      OUTLINED_FUNCTION_105_0();
      OUTLINED_FUNCTION_110_0();
      sub_24F96B09C(v3, v2, v5, v4, 0);
      uint64_t v41 = OUTLINED_FUNCTION_104_0();
      goto LABEL_25;
    }
    OUTLINED_FUNCTION_105_0();
    OUTLINED_FUNCTION_110_0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_125_0();
    uint64_t v12 = OUTLINED_FUNCTION_77_1();
    sub_24F96B09C(v12, v13, v14, v15, 0);
    uint64_t v16 = OUTLINED_FUNCTION_104_0();
LABEL_23:
    sub_24F96B09C(v16, v17, v18, v19, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
  if (v6 != 1)
  {
    if (v9 != 2) {
      goto LABEL_24;
    }
    BOOL v21 = v3 == v8 && v2 == v7;
    if (!v21 && (OUTLINED_FUNCTION_28_1() & 1) == 0)
    {
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_109_0();
      sub_24F96B09C(v3, v2, v5, v4, 2);
      uint64_t v41 = OUTLINED_FUNCTION_102_0();
      goto LABEL_25;
    }
    OUTLINED_FUNCTION_103_0();
    OUTLINED_FUNCTION_109_0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_125_0();
    uint64_t v22 = OUTLINED_FUNCTION_77_1();
    sub_24F96B09C(v22, v23, v24, v25, 2);
    uint64_t v16 = OUTLINED_FUNCTION_102_0();
    goto LABEL_23;
  }
  if (v9 != 1)
  {
LABEL_24:
    uint64_t v26 = OUTLINED_FUNCTION_101_0();
    sub_24F96B104(v26, v27, v28, v29, v30);
    uint64_t v31 = OUTLINED_FUNCTION_108_0();
    sub_24F96B104(v31, v32, v33, v34, v35);
    uint64_t v36 = OUTLINED_FUNCTION_108_0();
    sub_24F96B09C(v36, v37, v38, v39, v40);
    uint64_t v41 = OUTLINED_FUNCTION_101_0();
LABEL_25:
    sub_24F96B09C(v41, v42, v43, v44, v45);
    LOBYTE(v6) = 0;
    return v6 & 1;
  }
  if (v3 == v8 && v2 == v7) {
    LOBYTE(v6) = 1;
  }
  else {
    LOBYTE(v6) = OUTLINED_FUNCTION_28_1();
  }
  uint64_t v46 = OUTLINED_FUNCTION_106_0();
  sub_24F96B104(v46, v47, v48, v49, v50);
  uint64_t v51 = OUTLINED_FUNCTION_111_0();
  sub_24F96B104(v51, v52, v53, v54, v55);
  uint64_t v56 = OUTLINED_FUNCTION_111_0();
  sub_24F96B09C(v56, v57, v58, v59, v60);
  uint64_t v61 = OUTLINED_FUNCTION_106_0();
  sub_24F96B09C(v61, v62, v63, v64, v65);
  return v6 & 1;
}

uint64_t sub_24F967854()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
  sub_24F949E34(&qword_269A358F0, &qword_269A35410);
  sub_24F98E0A8();
  sub_24F98E0A8();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

void *static Ref<A>.PlayerRefFields.allCases.getter()
{
  return &unk_2701159A0;
}

uint64_t sub_24F967948()
{
  uint64_t v0 = OUTLINED_FUNCTION_115_0();
  return sub_24F962CC4(v0, &qword_269A35388);
}

void sub_24F967994(void *a1@<X8>)
{
}

uint64_t Ref<A>.game.getter@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = sub_24F962EF8((uint64_t)&unk_270115900);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_24F98DFE8();
  sub_24F9631D8(v5, v6, v4, v3, &qword_269A35740, &qword_269A35388, &qword_269A35410, &qword_269A35760, a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *Ref<A>.playerIDs.getter()
{
  uint64_t v3 = *v0;
  uint64_t v4 = v0[1];
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24F9646F8(v3, v4, &qword_269A35740, &qword_269A35388);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    uint64_t v50 = v3;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    uint64_t v7 = 0;
    uint64_t v2 = (void *)MEMORY[0x263F8EE78];
    uint64_t v49 = v4;
    uint64_t v51 = v6;
    do
    {
      int v8 = byte_2701159A0[v7 + 32];
      sub_24F9688A0();
      sub_24F98E058();
      swift_bridgeObjectRelease();
      sub_24F98E058();
      sub_24F96C76C(0, &qword_269A35788, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerRefFields);
      sub_24F98E3D8();
      if (*(void *)(v5 + 16) && (unint64_t v9 = sub_24F9480BC(0, 0xE000000000000000), (v10 & 1) != 0))
      {
        BOOL v11 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v9);
        uint64_t v13 = *v11;
        uint64_t v12 = v11[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v8)
        {
          if (v8 == 1)
          {
            uint64_t v14 = v13;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v2 = OUTLINED_FUNCTION_21_1();
            }
            unint64_t v16 = v2[2];
            unint64_t v15 = v2[3];
            if (v16 >= v15 >> 1) {
              uint64_t v2 = OUTLINED_FUNCTION_26_0(v15);
            }
            v2[2] = v16 + 1;
            uint64_t v17 = &v2[5 * v16];
            v17[4] = v14;
            void v17[5] = v12;
            v17[6] = 0;
            v17[7] = 0;
            *((unsigned char *)v17 + 64) = 1;
          }
          else
          {
            swift_bridgeObjectRetain();
            sub_24F962EF8((uint64_t)&unk_270115900);
            sub_24F98DFE8();
            uint64_t v33 = OUTLINED_FUNCTION_44_0();
            sub_24F9631D8(v33, v34, v35, v36, &qword_269A35740, &qword_269A35388, &qword_269A35410, &qword_269A35760, v37);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)OUTLINED_FUNCTION_21_1();
              uint64_t v2 = (void *)isUniquelyReferenced_nonNull_native;
            }
            unint64_t v46 = v2[3];
            if (v2[2] >= v46 >> 1)
            {
              uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)OUTLINED_FUNCTION_26_0(v46);
              uint64_t v2 = (void *)isUniquelyReferenced_nonNull_native;
            }
            OUTLINED_FUNCTION_73_1(isUniquelyReferenced_nonNull_native, v39, v40, v41, v42, v43, v44, v45, v49, v50, v51, v13);
            *(void *)(v47 + 48) = 0;
            *(void *)(v47 + 56) = 0xE000000000000000;
            *(unsigned char *)(v47 + 64) = 2;
          }
        }
        else
        {
          swift_bridgeObjectRetain();
          sub_24F962EF8((uint64_t)&unk_270115900);
          sub_24F98DFE8();
          uint64_t v18 = OUTLINED_FUNCTION_44_0();
          sub_24F9631D8(v18, v19, v20, v21, &qword_269A35740, &qword_269A35388, &qword_269A35410, &qword_269A35760, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v23 = swift_isUniquelyReferenced_nonNull_native();
          if ((v23 & 1) == 0)
          {
            uint64_t v23 = (uint64_t)OUTLINED_FUNCTION_21_1();
            uint64_t v2 = (void *)v23;
          }
          unint64_t v31 = v2[3];
          if (v2[2] >= v31 >> 1)
          {
            uint64_t v23 = (uint64_t)OUTLINED_FUNCTION_26_0(v31);
            uint64_t v2 = (void *)v23;
          }
          OUTLINED_FUNCTION_73_1(v23, v24, v25, v26, v27, v28, v29, v30, v49, v50, v51, v13);
          *(void *)(v32 + 48) = 0;
          *(void *)(v32 + 56) = 0xE000000000000000;
          *(unsigned char *)(v32 + 64) = 0;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      ++v7;
    }
    while (v7 != 3);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t Ref<A>.init(playerID:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v161 = *(void *)(a1 + 16);
  v149 = a2;
  if (!v161)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE80];
LABEL_100:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    uint64_t v139 = sub_24F9688A0();
    uint64_t v141 = sub_24F966128(v139, v140, v6);
    uint64_t v143 = v142;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35740);
    uint64_t result = Ref.init(rawValue:)(v141, v143, &v220);
    uint64_t v145 = v221;
    void *v149 = v220;
    v149[1] = v145;
    return result;
  }
  unint64_t v5 = 0;
  uint64_t v164 = a1 + 32;
  uint64_t v6 = MEMORY[0x263F8EE80];
  uint64_t v158 = a1;
LABEL_3:
  if (v5 >= *(void *)(a1 + 16)) {
    goto LABEL_109;
  }
  uint64_t v170 = v5;
  uint64_t v7 = v164 + 40 * v5;
  uint64_t v8 = *(void *)(v7 + 8);
  uint64_t v183 = *(void *)(v7 + 16);
  uint64_t v188 = *(void *)(v7 + 24);
  int v9 = *(unsigned __int8 *)(v7 + 32);
  uint64_t v174 = *(void *)v7;
  if (!*(unsigned char *)(v7 + 32))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    uint64_t v27 = OUTLINED_FUNCTION_72_1();
    sub_24F96B104(v27, v28, v29, v30, 0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24F9688A0();
    OUTLINED_FUNCTION_37_1();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_118_0();
    sub_24F96C76C(0, &qword_269A35788, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerRefFields);
    OUTLINED_FUNCTION_100_0(v31, v32, v33, v34, v35, v36, v37, v38, v146, (uint64_t)v149, v152, v155, v158, v161, v164, v167, v170, v174, v8,
      v183,
      v188,
      v193,
      v196,
      v199,
      v202,
      v205,
      v208,
      0);
    sub_24F98E3D8();
    uint64_t v39 = v221;
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_41_0();
    uint64_t v6 = v220;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24F9689CC(v4, v3, &qword_269A35760);
    uint64_t v155 = v40;
    if (!v167)
    {
      OUTLINED_FUNCTION_153();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
      if (sub_24F9688A0() == isUniquelyReferenced_nonNull_native && v41 == v220)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_143();
        OUTLINED_FUNCTION_42();
        swift_bridgeObjectRelease();
        uint64_t v43 = v190;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
LABEL_101:
          swift_bridgeObjectRelease();
          uint64_t v220 = v185;
          uint64_t v221 = v190;
          sub_24F962328();
          OUTLINED_FUNCTION_4_4();
          OUTLINED_FUNCTION_153();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35760);
          static GameServicesError.invalidReference<A>(ref:)(&v220, v43);
          swift_willThrow();
          goto LABEL_102;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v224 = v220;
      uint64_t v70 = v155;
      sub_24F96B2F0(v155, (uint64_t)sub_24F96B294, 0, v222);
      uint64_t v202 = v222[0];
      uint64_t v205 = v222[6];
      uint64_t v208 = v222[3];
      uint64_t v71 = v222[4];
      OUTLINED_FUNCTION_64_0();
      while (1)
      {
        if (v71)
        {
          OUTLINED_FUNCTION_34_0();
        }
        else
        {
          uint64_t v72 = v208 + 1;
          if (__OFADD__(v208, 1)) {
            goto LABEL_107;
          }
          if (v72 >= v193) {
            goto LABEL_62;
          }
          if (!*(void *)(v196 + 8 * v72))
          {
            OUTLINED_FUNCTION_63_0();
            if (v73 == v63) {
              goto LABEL_62;
            }
            OUTLINED_FUNCTION_62_0();
            if (!v74)
            {
              OUTLINED_FUNCTION_63_0();
              if (v73 == v63) {
                goto LABEL_62;
              }
              OUTLINED_FUNCTION_62_0();
              if (!v75)
              {
                OUTLINED_FUNCTION_63_0();
                if (v73 == v63) {
                  goto LABEL_62;
                }
                OUTLINED_FUNCTION_62_0();
                if (!v76)
                {
                  OUTLINED_FUNCTION_133_0();
                  if (v73 == v63) {
                    goto LABEL_62;
                  }
                  if (!*(void *)(v196 + 8 * v77))
                  {
                    while (1)
                    {
                      OUTLINED_FUNCTION_133_0();
                      if (v73 == v63) {
                        break;
                      }
                      if (*(void *)(v196 + 8 * v78)) {
                        goto LABEL_51;
                      }
                    }
LABEL_62:
                    swift_bridgeObjectRelease();
                    OUTLINED_FUNCTION_82_0();
                    swift_release();
                    uint64_t v65 = v176;
                    uint64_t v66 = v180;
                    uint64_t v67 = v185;
                    uint64_t v68 = v190;
                    char v69 = 0;
                    goto LABEL_97;
                  }
                }
              }
            }
          }
LABEL_51:
          OUTLINED_FUNCTION_35_1();
        }
        OUTLINED_FUNCTION_23_0();
        uint64_t v79 = swift_bridgeObjectRetain();
        uint64_t v87 = OUTLINED_FUNCTION_90_0(v79, v80, v81, v82, v83, v84, v85, v86, v146, (uint64_t)v149, v152, v155, v158, v161, v164, v167, v171, v176, v180,
                v185,
                v190,
                v193,
                v196,
                v199,
                v202,
                v205,
                v208,
                v211,
                v215,
                v218,
                v219,
                v220);
        v88(v87);
        swift_bridgeObjectRelease();
        uint64_t v89 = swift_bridgeObjectRelease();
        uint64_t v4 = OUTLINED_FUNCTION_89_0(v89, v90, v91, v92, v93, v94, v95, v96, v147, v150, v153, v156, v159, v162, v165, v168, v172, v177, v181,
               v186,
               v191,
               v194,
               v197,
               v200,
               v203,
               v206,
               v209,
               v213,
               v216);
        uint64_t v98 = OUTLINED_FUNCTION_38_1(v4, v97);
        if (v63) {
          break;
        }
        char v100 = v99;
        if (*(void *)(isUniquelyReferenced_nonNull_native + 24) >= v98)
        {
          if ((v6 & 1) == 0)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
            sub_24F98E3F8();
          }
        }
        else
        {
          sub_24F969D68(v98, v6 & 1);
          unint64_t v101 = sub_24F9480BC(v39, v8);
          if ((v100 & 1) != (v102 & 1)) {
            goto LABEL_112;
          }
          uint64_t v4 = v101;
        }
        uint64_t v6 = v224;
        if (v100)
        {
          swift_bridgeObjectRelease();
          v103 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v4);
          swift_bridgeObjectRelease();
          uint64_t *v103 = v3;
          v103[1] = v70;
          uint64_t isUniquelyReferenced_nonNull_native = 1;
        }
        else
        {
          OUTLINED_FUNCTION_7_4();
          if (v63) {
            goto LABEL_105;
          }
          *(void *)(v6 + 16) = v104;
          uint64_t isUniquelyReferenced_nonNull_native = 1;
        }
      }
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
      goto LABEL_110;
    }
LABEL_102:
    sub_24F96B09C(v176, v180, v185, v190, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if (v9 != 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    uint64_t v44 = OUTLINED_FUNCTION_72_1();
    sub_24F96B104(v44, v45, v46, v47, 2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24F9688A0();
    OUTLINED_FUNCTION_37_1();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_118_0();
    sub_24F96C76C(0, &qword_269A35788, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerRefFields);
    OUTLINED_FUNCTION_100_0(v48, v49, v50, v51, v52, v53, v54, v55, v146, (uint64_t)v149, v152, v155, v158, v161, v164, v167, v170, v174, v8,
      v183,
      v188,
      v193,
      v196,
      v199,
      v202,
      v205,
      v208,
      2);
    sub_24F98E3D8();
    uint64_t v56 = v221;
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_41_0();
    uint64_t v6 = v220;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24F9689CC(v4, v3, &qword_269A35760);
    uint64_t v155 = v57;
    if (v167) {
      goto LABEL_102;
    }
    OUTLINED_FUNCTION_153();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    if (sub_24F9688A0() == isUniquelyReferenced_nonNull_native && v58 == v220)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_143();
      OUTLINED_FUNCTION_42();
      swift_bridgeObjectRelease();
      uint64_t v43 = v190;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        goto LABEL_101;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v224 = v220;
    uint64_t v105 = v155;
    sub_24F96B2F0(v155, (uint64_t)sub_24F96B294, 0, v223);
    uint64_t v202 = v223[0];
    uint64_t v205 = v223[6];
    uint64_t v208 = v223[3];
    uint64_t v106 = v223[4];
    OUTLINED_FUNCTION_64_0();
    while (1)
    {
      if (v106)
      {
        OUTLINED_FUNCTION_34_0();
      }
      else
      {
        uint64_t v107 = v208 + 1;
        if (__OFADD__(v208, 1)) {
          goto LABEL_108;
        }
        if (v107 >= v193) {
          goto LABEL_96;
        }
        if (!*(void *)(v196 + 8 * v107))
        {
          OUTLINED_FUNCTION_63_0();
          if (v73 == v63) {
            goto LABEL_96;
          }
          OUTLINED_FUNCTION_62_0();
          if (!v108)
          {
            OUTLINED_FUNCTION_63_0();
            if (v73 == v63) {
              goto LABEL_96;
            }
            OUTLINED_FUNCTION_62_0();
            if (!v109)
            {
              OUTLINED_FUNCTION_63_0();
              if (v73 == v63) {
                goto LABEL_96;
              }
              OUTLINED_FUNCTION_62_0();
              if (!v110)
              {
                OUTLINED_FUNCTION_133_0();
                if (v73 == v63) {
                  goto LABEL_96;
                }
                if (!*(void *)(v196 + 8 * v111))
                {
                  while (1)
                  {
                    OUTLINED_FUNCTION_133_0();
                    if (v73 == v63) {
                      break;
                    }
                    if (*(void *)(v196 + 8 * v112)) {
                      goto LABEL_85;
                    }
                  }
LABEL_96:
                  swift_bridgeObjectRelease();
                  OUTLINED_FUNCTION_82_0();
                  swift_release();
                  uint64_t v65 = v176;
                  uint64_t v66 = v180;
                  uint64_t v67 = v185;
                  uint64_t v68 = v190;
                  char v69 = 2;
LABEL_97:
                  sub_24F96B09C(v65, v66, v67, v68, v69);
                  unint64_t v5 = v171 + 1;
                  a1 = v158;
                  if (v171 + 1 == v161)
                  {
                    swift_bridgeObjectRelease();
                    goto LABEL_100;
                  }
                  goto LABEL_3;
                }
              }
            }
          }
        }
LABEL_85:
        OUTLINED_FUNCTION_35_1();
      }
      OUTLINED_FUNCTION_23_0();
      uint64_t v113 = swift_bridgeObjectRetain();
      v121 = OUTLINED_FUNCTION_90_0(v113, v114, v115, v116, v117, v118, v119, v120, v146, (uint64_t)v149, v152, v155, v158, v161, v164, v167, v171, v176, v180,
               v185,
               v190,
               v193,
               v196,
               v199,
               v202,
               v205,
               v208,
               v212,
               v215,
               v218,
               v219,
               v220);
      v122(v121);
      swift_bridgeObjectRelease();
      uint64_t v123 = swift_bridgeObjectRelease();
      uint64_t v4 = OUTLINED_FUNCTION_89_0(v123, v124, v125, v126, v127, v128, v129, v130, v148, v151, v154, v157, v160, v163, v166, v169, v173, v178, v182,
             v187,
             v192,
             v195,
             v198,
             v201,
             v204,
             v207,
             v210,
             v214,
             v217);
      uint64_t v132 = OUTLINED_FUNCTION_38_1(v4, v131);
      if (v63) {
        goto LABEL_104;
      }
      char v134 = v133;
      if (*(void *)(isUniquelyReferenced_nonNull_native + 24) >= v132)
      {
        if ((v6 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
          sub_24F98E3F8();
        }
      }
      else
      {
        sub_24F969D68(v132, v6 & 1);
        unint64_t v135 = sub_24F9480BC(v56, v8);
        if ((v134 & 1) != (v136 & 1)) {
          goto LABEL_112;
        }
        uint64_t v4 = v135;
      }
      uint64_t v6 = v224;
      if (v134)
      {
        swift_bridgeObjectRelease();
        v137 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v4);
        swift_bridgeObjectRelease();
        uint64_t *v137 = v3;
        v137[1] = v105;
        uint64_t isUniquelyReferenced_nonNull_native = 1;
      }
      else
      {
        OUTLINED_FUNCTION_7_4();
        if (v63) {
          goto LABEL_106;
        }
        *(void *)(v6 + 16) = v138;
        uint64_t isUniquelyReferenced_nonNull_native = 1;
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F96B104(v174, v8, v183, v188, 1);
  swift_bridgeObjectRetain();
  sub_24F9688A0();
  OUTLINED_FUNCTION_37_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_118_0();
  sub_24F96C76C(0, &qword_269A35788, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerRefFields);
  OUTLINED_FUNCTION_100_0(v10, v11, v12, v13, v14, v15, v16, v17, v146, (uint64_t)v149, v152, v155, v158, v161, v164, v167, v170, v174, v8,
    v183,
    v188,
    v193,
    v196,
    v199,
    v202,
    v205,
    v208,
    1);
  sub_24F98E3D8();
  uint64_t v19 = v220;
  uint64_t v18 = v221;
  uint64_t v4 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v220 = v6;
  unint64_t v20 = sub_24F9480BC(v19, v221);
  if (__OFADD__(*(void *)(v6 + 16), (v21 & 1) == 0))
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  unint64_t v22 = v20;
  uint64_t v3 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
  if ((sub_24F98E3E8() & 1) == 0) {
    goto LABEL_10;
  }
  unint64_t v23 = sub_24F9480BC(v19, v221);
  if ((v3 & 1) == (v24 & 1))
  {
    unint64_t v22 = v23;
LABEL_10:
    uint64_t v6 = v220;
    if (v3)
    {
      uint64_t v25 = (uint64_t *)(*(void *)(v220 + 56) + 16 * v22);
      uint64_t v26 = v175;
      uint64_t isUniquelyReferenced_nonNull_native = v179;
      *uint64_t v25 = v175;
      v25[1] = v179;
      swift_bridgeObjectRelease();
LABEL_28:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v65 = v26;
      uint64_t v66 = isUniquelyReferenced_nonNull_native;
      uint64_t v67 = v184;
      uint64_t v68 = v189;
      char v69 = 1;
      goto LABEL_97;
    }
    OUTLINED_FUNCTION_27_0();
    *char v60 = v19;
    v60[1] = v18;
    uint64_t v61 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v22);
    uint64_t v26 = v175;
    uint64_t isUniquelyReferenced_nonNull_native = v179;
    *uint64_t v61 = v175;
    v61[1] = v179;
    uint64_t v62 = *(void *)(v6 + 16);
    BOOL v63 = __OFADD__(v62, 1);
    uint64_t v64 = v62 + 1;
    if (!v63)
    {
      *(void *)(v6 + 16) = v64;
      swift_bridgeObjectRetain();
      goto LABEL_28;
    }
LABEL_111:
    __break(1u);
  }
LABEL_112:
  uint64_t result = sub_24F98E6A8();
  __break(1u);
  return result;
}

uint64_t sub_24F9688A0()
{
  uint64_t v0 = (void *)sub_24F98DFC8();
  if (v1)
  {
    if (v1 <= 0)
    {
      __break(1u);
    }
    else if (*v0)
    {
      sub_24F98E768();
      sub_24F98E018();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_40_0();
      sub_24F96C818();
      unint64_t v2 = sub_24F96C864();
      OUTLINED_FUNCTION_57_0(v2, v3, v4, MEMORY[0x263F8D310], v5, v6, v7, v2, v2, MEMORY[0x263F8D138], v9, v10, v11);
      sub_24F98E2B8();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  sub_24F98E328();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_122_0();
  sub_24F98E768();
  sub_24F98E058();
  swift_bridgeObjectRelease();
  uint64_t result = OUTLINED_FUNCTION_120_0();
  __break(1u);
  return result;
}

uint64_t sub_24F9689CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_24F98DEA8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v73 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_1();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A358D8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_29();
  sub_24F98DF38();
  if (__swift_getEnumTagSinglePayload(v3, 1, v11) == 1)
  {
    sub_24F96C714(v3, &qword_269A358D8);
LABEL_40:
    uint64_t v71 = (void *)a1;
    uint64_t v72 = a2;
    sub_24F962328();
    OUTLINED_FUNCTION_4_4();
    uint64_t v60 = v59;
    __swift_instantiateConcreteTypeFromMangledName(a3);
    static GameServicesError.invalidReference<A>(ref:)((uint64_t *)&v71, v60);
    return swift_willThrow();
  }
  uint64_t v15 = OUTLINED_FUNCTION_39_1();
  v16(v15);
  sub_24F98DF18();
  if (!v17) {
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_71_1();
  BOOL v19 = v19 && v18 == 0xE500000000000000;
  if (v19)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_67_1();
    OUTLINED_FUNCTION_42();
    if ((v4 & 1) == 0) {
      goto LABEL_39;
    }
  }
  sub_24F98DED8();
  if (!v20) {
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_18_0();
  if (v19 && v21 == v22)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_42();
    if ((v4 & 1) == 0) {
      goto LABEL_39;
    }
  }
  uint64_t v24 = sub_24F98DEB8();
  if (!v24)
  {
LABEL_39:
    uint64_t v57 = OUTLINED_FUNCTION_137_0();
    v58(v57);
    goto LABEL_40;
  }
  uint64_t v66 = v24;
  uint64_t v25 = sub_24F98DEF8();
  unint64_t v27 = OUTLINED_FUNCTION_98_0(v25, v26);
  MEMORY[0x253366900](v27);
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69_1();
  if (!v28)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v71 = (void *)a1;
    uint64_t v72 = a2;
    sub_24F962328();
    OUTLINED_FUNCTION_4_4();
    uint64_t v62 = v61;
    __swift_instantiateConcreteTypeFromMangledName(a3);
    static GameServicesError.invalidReference<A>(ref:)((uint64_t *)&v71, v62);
    swift_willThrow();
    uint64_t v63 = OUTLINED_FUNCTION_9_4();
    return v64(v63);
  }
  uint64_t v29 = (void *)sub_24F98DFE8();
  uint64_t v30 = *(void *)(v66 + 16);
  if (!v30)
  {
LABEL_38:
    uint64_t v54 = OUTLINED_FUNCTION_9_4();
    v55(v54);
    swift_bridgeObjectRelease();
    return v65;
  }
  OUTLINED_FUNCTION_12_4();
  uint64_t v67 = v13;
  while (1)
  {
    uint64_t v70 = v30;
    uint64_t v31 = v13;
    OUTLINED_FUNCTION_54_1();
    v32();
    uint64_t v33 = sub_24F98DE78();
    uint64_t v35 = v34;
    uint64_t v36 = sub_24F98DE98();
    if (!v37)
    {
      swift_bridgeObjectRetain();
      sub_24F9480BC(v33, v35);
      char v47 = v46;
      swift_bridgeObjectRelease();
      if (v47)
      {
        swift_isUniquelyReferenced_nonNull_native();
        uint64_t v71 = v29;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
        OUTLINED_FUNCTION_99_0();
        swift_bridgeObjectRelease();
        sub_24F98E408();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = v31;
      goto LABEL_36;
    }
    uint64_t v38 = v37;
    uint64_t v69 = v36;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v71 = v29;
    uint64_t v39 = v35;
    unint64_t v40 = sub_24F9480BC(v33, v35);
    if (__OFADD__(v29[2], (v41 & 1) == 0)) {
      break;
    }
    unint64_t v42 = v40;
    char v43 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
    if (sub_24F98E3E8())
    {
      unint64_t v44 = sub_24F9480BC(v33, v39);
      if ((v43 & 1) != (v45 & 1)) {
        goto LABEL_45;
      }
      unint64_t v42 = v44;
    }
    uint64_t v29 = v71;
    if (v43)
    {
      OUTLINED_FUNCTION_146(v71[7]);
    }
    else
    {
      v71[(v42 >> 6) + 8] |= 1 << v42;
      uint64_t v48 = (uint64_t *)(v29[6] + 16 * v42);
      *uint64_t v48 = v33;
      v48[1] = v39;
      uint64_t v49 = (uint64_t *)(v29[7] + 16 * v42);
      uint64_t *v49 = v69;
      v49[1] = v38;
      uint64_t v50 = v29[2];
      BOOL v51 = __OFADD__(v50, 1);
      uint64_t v52 = v50 + 1;
      if (v51) {
        goto LABEL_44;
      }
      v29[2] = v52;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v67;
LABEL_36:
    OUTLINED_FUNCTION_2_2();
    v53();
    a3 = (uint64_t *)((char *)a3 + v68);
    uint64_t v30 = v70 - 1;
    if (v70 == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_24F98E6A8();
  __break(1u);
  return result;
}

uint64_t sub_24F968F24(uint64_t a1)
{
  sub_24F98DEA8();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_1();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A358D8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_29();
  sub_24F98DF38();
  if (__swift_getEnumTagSinglePayload(v1, 1, v6) == 1)
  {
    sub_24F96C714(v1, &qword_269A358D8);
LABEL_40:
    sub_24F962328();
    uint64_t v54 = OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_113_0(v54, v55);
    return swift_willThrow();
  }
  uint64_t v10 = OUTLINED_FUNCTION_39_1();
  v11(v10);
  sub_24F98DF18();
  if (!v12) {
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_71_1();
  BOOL v14 = v14 && v13 == 0xE500000000000000;
  if (v14)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_67_1();
    OUTLINED_FUNCTION_42();
    if ((v2 & 1) == 0) {
      goto LABEL_39;
    }
  }
  sub_24F98DED8();
  if (!v15) {
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_18_0();
  if (v14 && v16 == v17)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_42();
  if ((v2 & 1) == 0)
  {
LABEL_39:
    uint64_t v52 = OUTLINED_FUNCTION_137_0();
    v53(v52);
    goto LABEL_40;
  }
LABEL_19:
  uint64_t v19 = sub_24F98DEB8();
  if (!v19) {
    goto LABEL_39;
  }
  uint64_t v61 = v19;
  uint64_t v20 = sub_24F98DEF8();
  unint64_t v22 = OUTLINED_FUNCTION_98_0(v20, v21);
  MEMORY[0x253366900](v22);
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69_1();
  if (!v23)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24F962328();
    uint64_t v56 = OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_113_0(v56, v57);
    swift_willThrow();
    uint64_t v58 = OUTLINED_FUNCTION_9_4();
    return v59(v58);
  }
  uint64_t v24 = sub_24F98DFE8();
  uint64_t v25 = *(void *)(v61 + 16);
  if (!v25)
  {
LABEL_38:
    uint64_t v49 = OUTLINED_FUNCTION_9_4();
    v50(v49);
    swift_bridgeObjectRelease();
    return v60;
  }
  OUTLINED_FUNCTION_12_4();
  uint64_t v62 = v8;
  while (1)
  {
    uint64_t v65 = v25;
    uint64_t v26 = v8;
    OUTLINED_FUNCTION_54_1();
    v27();
    uint64_t v28 = sub_24F98DE78();
    uint64_t v30 = v29;
    uint64_t v31 = sub_24F98DE98();
    if (!v32)
    {
      swift_bridgeObjectRetain();
      sub_24F9480BC(v28, v30);
      char v42 = v41;
      swift_bridgeObjectRelease();
      if (v42)
      {
        swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
        OUTLINED_FUNCTION_99_0();
        swift_bridgeObjectRelease();
        sub_24F98E408();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v8 = v26;
      goto LABEL_36;
    }
    uint64_t v33 = v32;
    uint64_t v64 = v31;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v34 = v30;
    unint64_t v35 = sub_24F9480BC(v28, v30);
    if (__OFADD__(*(void *)(v24 + 16), (v36 & 1) == 0)) {
      break;
    }
    unint64_t v37 = v35;
    char v38 = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
    if (sub_24F98E3E8())
    {
      unint64_t v39 = sub_24F9480BC(v28, v34);
      if ((v38 & 1) != (v40 & 1)) {
        goto LABEL_45;
      }
      unint64_t v37 = v39;
    }
    if (v38)
    {
      OUTLINED_FUNCTION_146(*(void *)(v24 + 56));
    }
    else
    {
      OUTLINED_FUNCTION_27_0();
      *char v43 = v28;
      v43[1] = v34;
      unint64_t v44 = (uint64_t *)(*(void *)(v24 + 56) + 16 * v37);
      uint64_t *v44 = v64;
      v44[1] = v33;
      uint64_t v45 = *(void *)(v24 + 16);
      BOOL v46 = __OFADD__(v45, 1);
      uint64_t v47 = v45 + 1;
      if (v46) {
        goto LABEL_44;
      }
      *(void *)(v24 + 16) = v47;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v62;
LABEL_36:
    OUTLINED_FUNCTION_2_2();
    v48();
    a1 += v63;
    uint64_t v25 = v65 - 1;
    if (v65 == 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_24F98E6A8();
  __break(1u);
  return result;
}

uint64_t sub_24F969424(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_24F96A748(a1, (uint64_t)sub_24F96B294, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_24F9694B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A358F8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_1();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_24F98DEA8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v40 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v32 - v15;
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v41 = MEMORY[0x263F8EE78];
  uint64_t v18 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v18)
  {
    uint64_t v33 = v8;
    uint64_t v34 = v4;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v38 = v11 + 16;
    unint64_t v39 = v19;
    uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
    uint64_t v21 = *(void *)(v11 + 72);
    uint64_t v32 = a1;
    uint64_t v37 = (v20 + 32) & ~v20;
    uint64_t v22 = a1 + v37;
    uint64_t v23 = (void (**)(char *, char *, uint64_t))(v11 + 32);
    uint64_t v35 = v2;
    char v36 = (void (**)(char *, uint64_t))(v11 + 8);
    do
    {
      v39(v16, v22, v9);
      sub_24F98DE98();
      uint64_t v25 = v24;
      swift_bridgeObjectRelease();
      if (v25)
      {
        uint64_t v26 = *v23;
        (*v23)(v40, v16, v9);
        uint64_t v27 = v41;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24F969930(0, *(void *)(v27 + 16) + 1, 1);
          uint64_t v27 = v41;
        }
        unint64_t v29 = *(void *)(v27 + 16);
        unint64_t v28 = *(void *)(v27 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_24F969930(v28 > 1, v29 + 1, 1);
          uint64_t v27 = v41;
        }
        *(void *)(v27 + 16) = v29 + 1;
        v26((char *)(v27 + v37 + v29 * v21), v40, v9);
        uint64_t v41 = v27;
      }
      else
      {
        (*v36)(v16, v9);
      }
      v22 += v21;
      --v18;
    }
    while (v18);
    uint64_t v17 = v41;
    uint64_t v4 = v34;
    uint64_t v2 = v35;
    uint64_t v8 = v33;
  }
  swift_bridgeObjectRelease();
  uint64_t v41 = v17;
  swift_getKeyPath();
  sub_24F98DF78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35900);
  sub_24F949E34(&qword_269A35908, &qword_269A35900);
  sub_24F949E34(&qword_269A35910, &qword_269A358F8);
  uint64_t v30 = sub_24F98E078();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  swift_bridgeObjectRelease();
  return v30;
}

unint64_t sub_24F9697F0(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v4 = 11;
    }
    unint64_t v5 = v4 | (v3 << 16);
    uint64_t result = sub_24F98E048();
    if (v6) {
      uint64_t result = v5;
    }
    if (4 * v3 >= result >> 14)
    {
      uint64_t v7 = sub_24F98E068();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24F9698C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24F98DE78();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F9698F0()
{
  return sub_24F98DE88();
}

size_t sub_24F969930(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_24F969970(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_24F969950(void *a1, int64_t a2, char a3)
{
  size_t result = sub_24F969B20(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_24F969970(size_t result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35918);
  uint64_t v10 = *(void *)(sub_24F98DEA8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  void v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_24F98DEA8() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_24F969C48(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

void *sub_24F969B20(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35938);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35940);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_24F969C48(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1 || (uint64_t result = sub_24F98DEA8(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = sub_24F98DEA8();
    return MEMORY[0x270FA01D8](a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return MEMORY[0x270FA01D0](a3, a1, a2, result);
  }
  return result;
}

uint64_t sub_24F969D1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_24F969D68(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A358D0);
  char v40 = a2;
  uint64_t v6 = sub_24F98E438();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = (uint64_t *)(*(void *)(v5 + 56) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24F98E6F8();
    sub_24F98E038();
    uint64_t result = sub_24F98E718();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        BOOL v32 = v28 == v31;
        if (v28 == v31) {
          unint64_t v28 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v11 + 8 * v28);
        if (v33 != -1)
        {
          unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v7 + 48) + 16 * v29);
    *uint64_t v34 = v22;
    v34[1] = v21;
    uint64_t v35 = (void *)(*(void *)(v7 + 56) + 16 * v29);
    *uint64_t v35 = v24;
    v35[1] = v25;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v38)
    {
      swift_release();
      uint64_t v3 = v37;
      uint64_t v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    uint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v39 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v38) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v39 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v38)
  {
    unint64_t v18 = *(void *)(v39 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v38) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v39 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  uint64_t v3 = v37;
LABEL_34:
  if (v40)
  {
    uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
    if (v36 >= 64) {
      sub_24F9484BC(0, (unint64_t)(v36 + 63) >> 6, v17);
    }
    else {
      *uint64_t v17 = -1 << v36;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24F96A078(uint64_t a1, void *a2)
{
  uint64_t v4 = a1;
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    uint64_t v9 = (void *)((char *)v13 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_24F9484BC(0, v7, v9);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24F96A23C((uint64_t)v9, v7, v4, a2);
    if (v2) {
      swift_willThrow();
    }
    else {
      uint64_t v4 = v10;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    sub_24F9484BC(0, v7, v11);
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24F96A23C((uint64_t)v11, v7, v4, a2);
    MEMORY[0x2533673F0](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24F96A23C(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v8 = *(void *)(a3 + 64);
  uint64_t v6 = a3 + 64;
  uint64_t v7 = v8;
  uint64_t v9 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v7;
  uint64_t v32 = v6;
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  unint64_t v28 = (unint64_t *)result;
  unint64_t v29 = a4 + 7;
LABEL_4:
  uint64_t v30 = v4;
  while (1)
  {
LABEL_5:
    if (v11)
    {
      unint64_t v12 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v13 = v12 | (v5 << 6);
    }
    else
    {
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_42;
      }
      if (v14 >= v33) {
        goto LABEL_40;
      }
      unint64_t v15 = *(void *)(v32 + 8 * v14);
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v33) {
          goto LABEL_40;
        }
        unint64_t v15 = *(void *)(v32 + 8 * v5);
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v33) {
            goto LABEL_40;
          }
          unint64_t v15 = *(void *)(v32 + 8 * v5);
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v33) {
              goto LABEL_40;
            }
            unint64_t v15 = *(void *)(v32 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_43;
                }
                if (v5 >= v33) {
                  goto LABEL_40;
                }
                unint64_t v15 = *(void *)(v32 + 8 * v5);
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v11 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
    }
    uint64_t v17 = a4[2];
    if (v17)
    {
      unint64_t v18 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v13);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      uint64_t result = a4[4];
      BOOL v21 = result == *v18 && a4[5] == v20;
      if (v21 || (uint64_t result = sub_24F98E678(), (result & 1) != 0))
      {
LABEL_37:
        *(unint64_t *)((char *)v28 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        uint64_t v4 = v30 + 1;
        if (!__OFADD__(v30, 1)) {
          goto LABEL_4;
        }
        __break(1u);
LABEL_40:
        uint64_t v26 = sub_24F96A498(v28, a2, v30, a3);
        swift_bridgeObjectRelease();
        return v26;
      }
      if (v17 != 1) {
        break;
      }
    }
  }
  uint64_t v22 = v29;
  uint64_t v23 = 1;
  while (1)
  {
    uint64_t v24 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    uint64_t result = *(v22 - 1);
    if (result == v19 && *v22 == v20) {
      goto LABEL_37;
    }
    uint64_t result = sub_24F98E678();
    if (result) {
      goto LABEL_37;
    }
    v22 += 2;
    ++v23;
    if (v24 == v17) {
      goto LABEL_5;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_24F96A498(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A358D0);
  uint64_t result = sub_24F98E448();
  uint64_t v9 = result;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v39 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v38) {
        return v9;
      }
      unint64_t v16 = v37[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v38) {
          return v9;
        }
        unint64_t v16 = v37[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v38) {
            return v9;
          }
          unint64_t v16 = v37[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v38) {
              return v9;
            }
            unint64_t v16 = v37[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v38) {
                  return v9;
                }
                unint64_t v16 = v37[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v39 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = v4;
    uint64_t v20 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = (uint64_t *)(*(void *)(v4 + 56) + 16 * v14);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    sub_24F98E6F8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24F98E038();
    uint64_t result = sub_24F98E718();
    uint64_t v26 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) == 0) {
      break;
    }
    unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    uint64_t v34 = (void *)(*(void *)(v9 + 48) + 16 * v29);
    *uint64_t v34 = v22;
    v34[1] = v21;
    uint64_t v35 = (void *)(*(void *)(v9 + 56) + 16 * v29);
    *uint64_t v35 = v24;
    v35[1] = v25;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_39;
    }
    uint64_t v4 = v19;
    uint64_t v11 = v39;
    if (!v5) {
      return v9;
    }
  }
  char v30 = 0;
  unint64_t v31 = (unint64_t)(63 - v26) >> 6;
  while (++v28 != v31 || (v30 & 1) == 0)
  {
    BOOL v32 = v28 == v31;
    if (v28 == v31) {
      unint64_t v28 = 0;
    }
    v30 |= v32;
    uint64_t v33 = *(void *)(v12 + 8 * v28);
    if (v33 != -1)
    {
      unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24F96A748(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  sub_24F96B2F0(a1, a2, a3, &v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F96B32C();
  if (v11)
  {
    OUTLINED_FUNCTION_129_0();
    while (1)
    {
      uint64_t v12 = (void *)*a5;
      unint64_t v13 = sub_24F9480BC(v5, v8);
      uint64_t v15 = OUTLINED_FUNCTION_38_1(v13, v14);
      if (v17) {
        break;
      }
      char v18 = v16;
      if (v12[3] >= v15)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
          sub_24F98E3F8();
        }
      }
      else
      {
        sub_24F969D68(v15, a4 & 1);
        unint64_t v19 = sub_24F9480BC(v5, v8);
        if ((v18 & 1) != (v20 & 1)) {
          goto LABEL_17;
        }
        unint64_t v13 = v19;
      }
      uint64_t v21 = (void *)*a5;
      if (v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = (void *)(v21[7] + 16 * v13);
        swift_bridgeObjectRelease();
        *uint64_t v22 = v6;
        v22[1] = v7;
      }
      else
      {
        v21[(v13 >> 6) + 8] |= 1 << v13;
        uint64_t v23 = (uint64_t *)(v21[6] + 16 * v13);
        *uint64_t v23 = v5;
        v23[1] = v8;
        uint64_t v24 = (void *)(v21[7] + 16 * v13);
        *uint64_t v24 = v6;
        v24[1] = v7;
        uint64_t v25 = v21[2];
        BOOL v17 = __OFADD__(v25, 1);
        uint64_t v26 = v25 + 1;
        if (v17) {
          goto LABEL_16;
        }
        uint64_t v21[2] = v26;
      }
      sub_24F96B32C();
      OUTLINED_FUNCTION_129_0();
      a4 = 1;
      if (!v27) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    uint64_t result = sub_24F98E6A8();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_24F96B4CC();
    return swift_release();
  }
  return result;
}

void *sub_24F96A934(void *result)
{
  uint64_t v2 = result[2];
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
  uint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v5 > v3[3] >> 1)
  {
    if (v4 <= v5) {
      int64_t v7 = v4 + v2;
    }
    else {
      int64_t v7 = v4;
    }
    uint64_t result = sub_24F96ABDC(result, v7, 1, v3);
    uint64_t v3 = result;
  }
  if (!v6[2])
  {
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35940);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
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

size_t sub_24F96AA2C(size_t result, int64_t a2, char a3, uint64_t a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35918);
  uint64_t v10 = *(void *)(sub_24F98DEA8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  void v13[2] = v8;
  void v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_24F98DEA8() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_24F969C48(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void *sub_24F96ABDC(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35938);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35940);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24F96AD04(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A358E0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_24F96C76C(0, &qword_269A358E8, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerID);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24F96AE40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24F9480BC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
  sub_24F98E3E8();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 16 * v6);
  sub_24F98E408();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_24F96AF50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_24F9480BC(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35790);
  if ((sub_24F98E3E8() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_24F9480BC(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_13:
    uint64_t result = sub_24F98E6A8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  BOOL v17 = *v5;
  if (v14)
  {
    char v18 = (uint64_t *)(v17[7] + 16 * v13);
    *char v18 = a1;
    v18[1] = a2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24F96B248(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24F96B09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 2)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a5 != 1)
  {
    if (a5) {
      return result;
    }
    goto LABEL_4;
  }
LABEL_5:
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F96B104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    goto LABEL_5;
  }
  if (a5 != 1)
  {
    if (a5) {
      return result;
    }
    goto LABEL_4;
  }
LABEL_5:
  return swift_bridgeObjectRetain();
}

uint64_t sub_24F96B16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = vars8;
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_24F96B1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (a5)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24F96B1FC()
{
  unint64_t result = qword_269A35770;
  if (!qword_269A35770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35770);
  }
  return result;
}

unint64_t sub_24F96B248(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 16 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  char v7 = (void *)(a6[7] + 16 * result);
  *char v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_24F96B294@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_24F969D1C(v7, *a1, a1[1], a1[2], a1[3]);
  uint64_t v4 = v7[0];
  uint64_t v5 = v7[1];
  *a2 = result;
  a2[1] = v6;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

uint64_t type metadata accessor for Ref<A>.PlayerRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96B2F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_24F96B32C()
{
  void (*v13)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  void v22[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 56) + 16 * v6);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v13 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(&v21, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v21;
  }
  unint64_t v15 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      BOOL v17 = v0[1];
      char v18 = *(void *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        uint64_t v5 = (v18 - 1) & v18;
        unint64_t v6 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v4 = v15;
        goto LABEL_3;
      }
      unint64_t v19 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        char v18 = *(void *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          unint64_t v15 = v19;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          char v18 = *(void *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            unint64_t v15 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v19 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            char v18 = *(void *)(v17 + 8 * v19);
            if (v18) {
              goto LABEL_10;
            }
            unint64_t v15 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              char v18 = *(void *)(v17 + 8 * v15);
              if (v18) {
                goto LABEL_7;
              }
              int64_t v4 = v16 - 1;
              char v20 = v3 + 6;
              while (v20 < v16)
              {
                char v18 = *(void *)(v17 + 8 * v20++);
                if (v18)
                {
                  unint64_t v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_24F96B4CC()
{
  return swift_release();
}

uint64_t sub_24F96B4D4()
{
  return sub_24F96B59C(&qword_269A35798, &qword_269A357A0, (uint64_t (*)(void))type metadata accessor for Ref<A>.AchievementRefFields);
}

uint64_t type metadata accessor for Ref<A>.AchievementRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96B53C(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A357A8, &qword_269A357A0, (uint64_t (*)(void))type metadata accessor for Ref<A>.AchievementRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96B59C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24F96C76C(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F96B5E0()
{
  return sub_24F949E34(&qword_269A357B0, &qword_269A357B8);
}

uint64_t sub_24F96B61C()
{
  return sub_24F96B59C(&qword_269A357C0, &qword_269A357C8, (uint64_t (*)(void))type metadata accessor for Ref<A>.ChallengeRefFields);
}

uint64_t type metadata accessor for Ref<A>.ChallengeRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96B684(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A357D0, &qword_269A357C8, (uint64_t (*)(void))type metadata accessor for Ref<A>.ChallengeRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96B6E4()
{
  return sub_24F949E34(&qword_269A357D8, &qword_269A357E0);
}

uint64_t sub_24F96B720()
{
  return sub_24F96B59C(&qword_269A357E8, &qword_269A357F0, (uint64_t (*)(void))type metadata accessor for Ref<A>.ChallengeInviteRefFields);
}

uint64_t type metadata accessor for Ref<A>.ChallengeInviteRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96B788(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A357F8, &qword_269A357F0, (uint64_t (*)(void))type metadata accessor for Ref<A>.ChallengeInviteRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96B7E8()
{
  return sub_24F949E34(&qword_269A35800, &qword_269A35808);
}

uint64_t sub_24F96B824()
{
  return sub_24F96B59C(&qword_269A35810, &qword_269A35818, (uint64_t (*)(void))type metadata accessor for Ref<A>.ContactRefFields);
}

uint64_t type metadata accessor for Ref<A>.ContactRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96B88C(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A35820, &qword_269A35818, (uint64_t (*)(void))type metadata accessor for Ref<A>.ContactRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96B8EC()
{
  return sub_24F949E34(&qword_269A35828, &qword_269A35830);
}

uint64_t sub_24F96B928()
{
  return sub_24F96B59C(&qword_269A35838, &qword_269A35840, (uint64_t (*)(void))type metadata accessor for Ref<A>.GameRefFields);
}

uint64_t type metadata accessor for Ref<A>.GameRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96B990(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A35848, &qword_269A35840, (uint64_t (*)(void))type metadata accessor for Ref<A>.GameRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96B9F0()
{
  return sub_24F949E34(&qword_269A35850, &qword_269A35858);
}

uint64_t sub_24F96BA2C()
{
  return sub_24F96B59C(&qword_269A35860, &qword_269A35868, (uint64_t (*)(void))type metadata accessor for Ref<A>.ImageRefFields);
}

uint64_t type metadata accessor for Ref<A>.ImageRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96BA94(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A35870, &qword_269A35868, (uint64_t (*)(void))type metadata accessor for Ref<A>.ImageRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96BAF4()
{
  return sub_24F949E34(&qword_269A35878, &qword_269A35880);
}

uint64_t sub_24F96BB30()
{
  return sub_24F96B59C(&qword_269A35888, &qword_269A35890, (uint64_t (*)(void))type metadata accessor for Ref<A>.LeaderboardRefFields);
}

uint64_t type metadata accessor for Ref<A>.LeaderboardRefFields()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96BB98(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A35898, &qword_269A35890, (uint64_t (*)(void))type metadata accessor for Ref<A>.LeaderboardRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96BBF8()
{
  return sub_24F949E34(&qword_269A358A0, &qword_269A358A8);
}

uint64_t sub_24F96BC34()
{
  return sub_24F96B59C(&qword_269A358B0, &qword_269A35788, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerRefFields);
}

uint64_t sub_24F96BC84(uint64_t a1)
{
  uint64_t result = sub_24F96B59C(&qword_269A358B8, &qword_269A35788, (uint64_t (*)(void))type metadata accessor for Ref<A>.PlayerRefFields);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24F96BCE4()
{
  return sub_24F949E34(&qword_269A358C0, &qword_269A358C8);
}

uint64_t sub_24F96BD28(uint64_t a1)
{
  return sub_24F96B1AC(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_24F96BD3C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_29_1(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(void *)(v2 + 16) = v5;
  *(void *)(v2 + 24) = v6;
  *(unsigned char *)(v2 + 32) = v7;
  return v2;
}

uint64_t sub_24F96BD7C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_29_1(a1, a2);
  uint64_t v8 = *(void *)v2;
  uint64_t v9 = *(void *)(v2 + 8);
  uint64_t v10 = *(void *)(v2 + 16);
  uint64_t v11 = *(void *)(v2 + 24);
  char v12 = *(unsigned char *)(v2 + 32);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(void *)(v2 + 16) = v5;
  *(void *)(v2 + 24) = v6;
  *(unsigned char *)(v2 + 32) = v7;
  sub_24F96B1AC(v8, v9, v10, v11, v12);
  return v2;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_24F96BDE0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  sub_24F96B1AC(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t sub_24F96BE2C(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return OUTLINED_FUNCTION_11_0(*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 > 1) {
    return OUTLINED_FUNCTION_11_0(v3 ^ 0xFF);
  }
  else {
    return OUTLINED_FUNCTION_11_0(-1);
  }
}

uint64_t sub_24F96BE68(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      return OUTLINED_FUNCTION_119_0(result, -(char)a2);
    }
  }
  return result;
}

uint64_t sub_24F96BEAC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_24F96BEB4(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_119_0(a1, a2 & 1);
}

uint64_t type metadata accessor for Ref<A>.InviteDetails()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_24F96BEDC(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F96BF98);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_62(result, a2 + 3);
        break;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Cursor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Cursor()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Cursor(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for Cursor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24F96C07C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for Cursor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Ref<A>.URLType()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_24F96C110(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F96C1CCLL);
      case 4:
        __n128 result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          __n128 result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

unsigned char *sub_24F96C1F4(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24F96C290);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F96C2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t sub_24F96C2C0(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 32);
  if (v1 >= 3) {
    unsigned int v1 = *(_DWORD *)a1 + 3;
  }
  if (v1 != 1) {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F96C32C(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 32);
  if (v3 >= 3) {
    unsigned int v3 = *(_DWORD *)a2 + 3;
  }
  if (v3 == 2)
  {
    OUTLINED_FUNCTION_147(a1, (void *)a2);
    *(unsigned char *)(a1 + 32) = 2;
LABEL_8:
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  if (v3 != 1)
  {
    OUTLINED_FUNCTION_147(a1, (void *)a2);
    *(unsigned char *)(a1 + 32) = 0;
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 32) = 1;
LABEL_9:
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24F96C3AC(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 32);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 != 1) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    unsigned int v5 = *(unsigned __int8 *)(a2 + 32);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      OUTLINED_FUNCTION_33_0();
      *(unsigned char *)(a1 + 32) = 2;
    }
    else
    {
      if (v5 == 1)
      {
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        *(unsigned char *)(a1 + 32) = 1;
LABEL_14:
        swift_bridgeObjectRetain();
        return a1;
      }
      OUTLINED_FUNCTION_33_0();
      *(unsigned char *)(a1 + 32) = 0;
    }
    swift_bridgeObjectRetain();
    goto LABEL_14;
  }
  return a1;
}

uint64_t sub_24F96C480(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 32);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 != 1) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    unsigned int v5 = *(unsigned __int8 *)(a2 + 32);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 != 2)
    {
      if (v5 == 1)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_13:
        *(unsigned char *)(a1 + 32) = v5;
        return a1;
      }
      LOBYTE(v5) = 0;
    }
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_13;
  }
  return a1;
}

uint64_t sub_24F96C530(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_48();
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_24F96C568(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      return OUTLINED_FUNCTION_119_0(result, -(char)a2);
    }
  }
  return result;
}

uint64_t sub_24F96C5B0(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 32);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_24F96C5CC(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

uint64_t type metadata accessor for Ref<A>.PlayerID()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *sub_24F96C608(unsigned char *result, unsigned int a2, unsigned int a3)
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
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F96C6C4);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 2);
        break;
    }
  }
  return result;
}

uint64_t sub_24F96C6EC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24F96C714(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_2();
  v3();
  return a1;
}

void sub_24F96C76C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24F96C7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24F96C818()
{
  unint64_t result = qword_269A35920;
  if (!qword_269A35920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35920);
  }
  return result;
}

unint64_t sub_24F96C864()
{
  unint64_t result = qword_269A35928;
  if (!qword_269A35928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35928);
  }
  return result;
}

uint64_t sub_24F96C8B0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 0);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_24F98E058();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_4_5(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return v0;
}

void OUTLINED_FUNCTION_7_4()
{
  *(void *)(v5 + 8 * (v3 >> 6) + 64) |= 1 << v3;
  unsigned int v6 = (void *)(*(void *)(v5 + 48) + 16 * v3);
  *unsigned int v6 = v1;
  v6[1] = v4;
  uint64_t v7 = (void *)(*(void *)(v5 + 56) + 16 * v3);
  *uint64_t v7 = v2;
  v7[1] = v0;
}

char *OUTLINED_FUNCTION_8_4()
{
  return sub_24F947F9C(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return v0;
}

void OUTLINED_FUNCTION_10_4()
{
  *(void *)(v1 + 16) = v0;
  uint64_t v5 = v1 + 16 * v2;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v3;
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_24F98E058();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  uint64_t v2 = *(void *)(v0 - 72);
  uint64_t v3 = *(void *)(v2 + 16);
  v2 += 16;
  *(void *)(v0 - 136) = v3;
  *(void *)(v0 - 72) = v2;
  *(void *)(v0 - 160) = *(void *)(v2 + 56);
  *(void *)(v0 - 152) = v2 - 8;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_24F98E678();
}

char *OUTLINED_FUNCTION_20_0()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_24F947F9C(0, v2, 1);
}

void *OUTLINED_FUNCTION_21_1()
{
  int64_t v2 = v0[2] + 1;
  return sub_24F96AD04(0, v2, 1, v0);
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17 = *(void *)(v15 - 72);
  return sub_24F96B09C(v14, v13, a13, v17, 1);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_24_1(void *a1@<X8>)
{
  *a1 = v1;
}

char *OUTLINED_FUNCTION_25@<X0>(unint64_t a1@<X8>)
{
  return sub_24F947F9C((char *)(a1 > 1), v1, 1);
}

void *OUTLINED_FUNCTION_26_0@<X0>(unint64_t a1@<X8>)
{
  return sub_24F96AD04((void *)(a1 > 1), v2, 1, v1);
}

void OUTLINED_FUNCTION_27_0()
{
  *(void *)(v1 + 8 * (v0 >> 6) + 64) |= 1 << v0;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_29_1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  return sub_24F96B16C(v6, v7, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  *uint64_t v0 = *v1;
  uint64_t result = v1[1];
  v0[1] = result;
  v0[2] = v1[2];
  v0[3] = v1[3];
  return result;
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return sub_24F98E058();
}

uint64_t OUTLINED_FUNCTION_38_1(uint64_t a1, char a2)
{
  return *(void *)(v2 + 16) + ((a2 & 1) == 0);
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_24F96AF50(v3, v2, v0, v1);
}

char *OUTLINED_FUNCTION_42_1(uint64_t a1, int64_t a2)
{
  return sub_24F947F9C(0, a2, 1);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_24F966128(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return sub_24F96A078(v1, v0);
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return Ref.init(rawValue:)(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  return Ref.init(rawValue:)(v10, v11, a10);
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  return sub_24F98E328();
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_53_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return static GameServicesError.invalidReference<A>(ref:)(&a9, v9);
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return sub_24F98E058();
}

char *OUTLINED_FUNCTION_57_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

void OUTLINED_FUNCTION_58_1()
{
  *(void *)(v1 - 72) = v0;
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return sub_24F98DF68();
}

uint64_t OUTLINED_FUNCTION_61_0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  return sub_24F9646F8(v4, v5, a3, a4);
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_67_1()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_68_1(uint64_t a1, uint64_t a2)
{
  return sub_24F964A08(a1, a2, v2);
}

void OUTLINED_FUNCTION_69_1()
{
  *(void *)(v1 - 200) = v0;
}

uint64_t OUTLINED_FUNCTION_72_1()
{
  return v0;
}

void OUTLINED_FUNCTION_73_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v13 + 16) = v14;
  uint64_t v16 = v13 + 40 * v15;
  *(void *)(v16 + 32) = a12;
  *(void *)(v16 + 40) = v12;
}

void OUTLINED_FUNCTION_74_1()
{
  *(void *)(v1 - 72) = v0;
}

uint64_t OUTLINED_FUNCTION_77_1()
{
  return v0;
}

void OUTLINED_FUNCTION_78_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v12 - 88) = a12;
}

void OUTLINED_FUNCTION_79_1()
{
  *(void *)(v0 - 88) = 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  sub_24F96B4CC();
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return sub_24F96B59C(v0, v2, v1);
}

void *OUTLINED_FUNCTION_84_0()
{
  return sub_24F969950(0, v0, 0);
}

unint64_t OUTLINED_FUNCTION_89_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  return sub_24F9480BC(a28, a29);
}

char *OUTLINED_FUNCTION_90_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  return &a32;
}

uint64_t OUTLINED_FUNCTION_91_0()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_92_0()
{
  return v0;
}

void OUTLINED_FUNCTION_93_0()
{
  *(void *)(v1 - 72) = v0;
}

uint64_t OUTLINED_FUNCTION_94_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_24F9689CC(v3, v4, a3);
}

char *OUTLINED_FUNCTION_96_0@<X0>(unint64_t a1@<X8>)
{
  return sub_24F947F9C((char *)(a1 > 1), v1, 1);
}

void OUTLINED_FUNCTION_97_0()
{
  *(void *)(v1 + 16) = v0;
  uint64_t v5 = v1 + 16 * v2;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v3;
}

unint64_t OUTLINED_FUNCTION_98_0(uint64_t a1, unint64_t a2)
{
  return sub_24F9697F0(1uLL, a1, a2);
}

uint64_t OUTLINED_FUNCTION_99_0()
{
  return sub_24F98E3E8();
}

char *OUTLINED_FUNCTION_100_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  return &a28;
}

uint64_t OUTLINED_FUNCTION_101_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_102_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  return sub_24F96B104(v3, v2, v1, v0, 2);
}

uint64_t OUTLINED_FUNCTION_104_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_105_0()
{
  return sub_24F96B104(v3, v2, v1, v0, 0);
}

uint64_t OUTLINED_FUNCTION_106_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_107_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_108_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_109_0()
{
  return sub_24F96B104(v3, v2, v1, v0, 2);
}

uint64_t OUTLINED_FUNCTION_110_0()
{
  return sub_24F96B104(v3, v2, v1, v0, 0);
}

uint64_t OUTLINED_FUNCTION_111_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_112_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_113_0(uint64_t a1, uint64_t a2)
{
  return static GameServicesError.invalidReference<A>(ref:)((uint64_t *)(v2 - 96), a2);
}

uint64_t OUTLINED_FUNCTION_115_0()
{
  return *v0;
}

void OUTLINED_FUNCTION_117_0()
{
  sub_24F96C76C(0, v1, v0);
}

uint64_t OUTLINED_FUNCTION_118_0()
{
  return sub_24F98E058();
}

uint64_t OUTLINED_FUNCTION_119_0@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_120_0()
{
  return sub_24F98E418();
}

uint64_t OUTLINED_FUNCTION_123_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_124_0(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_125_0()
{
  return sub_24F967854();
}

uint64_t OUTLINED_FUNCTION_126_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return a16;
}

uint64_t OUTLINED_FUNCTION_131()
{
  return sub_24F98E708();
}

void OUTLINED_FUNCTION_132_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 96) = v9;
  *(void *)(v10 - 88) = a9;
}

void OUTLINED_FUNCTION_134_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *uint64_t v10 = a9;
  v10[1] = a10;
}

uint64_t OUTLINED_FUNCTION_137_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_138_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return Ref.init(rawValue:)(v9, v10, &a9);
}

uint64_t OUTLINED_FUNCTION_139_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return Ref.init(rawValue:)(v9, v10, &a9);
}

uint64_t OUTLINED_FUNCTION_140_0()
{
  return sub_24F98E058();
}

uint64_t OUTLINED_FUNCTION_141_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_142_0()
{
  return sub_24F98E328();
}

uint64_t OUTLINED_FUNCTION_143()
{
  return sub_24F98E678();
}

uint64_t OUTLINED_FUNCTION_144()
{
  return sub_24F98E058();
}

uint64_t OUTLINED_FUNCTION_145(uint64_t a1)
{
  return sub_24F969424(a1, v1);
}

uint64_t OUTLINED_FUNCTION_146@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = (void *)(a1 + 16 * v1);
  *uint64_t v5 = *(void *)(v3 - 120);
  v5[1] = v2;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_147(uint64_t a1, void *a2)
{
  uint64_t result = a2[1];
  *uint64_t v2 = *a2;
  v2[1] = result;
  uint64_t v4 = a2[3];
  v2[2] = a2[2];
  v2[3] = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_151(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t Page.elements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Page.elements.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*Page.elements.modify())()
{
  return nullsub_1;
}

void sub_24F96D874(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t Page.previous.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 16), a1);
}

uint64_t Page.previous.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v3;
  return result;
}

uint64_t (*Page.previous.modify())()
{
  return nullsub_1;
}

uint64_t Page.next.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 32), a1);
}

uint64_t Page.next.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v3;
  return result;
}

uint64_t (*Page.next.modify())()
{
  return nullsub_1;
}

__n128 Page.init(_:previous:next:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = a1;
  *(_OWORD *)(a4 + 8) = *a2;
  __n128 result = *a3;
  *(__n128 *)(a4 + 24) = *a3;
  return result;
}

__n128 Page.init(_:next:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = a1;
  __n128 result = *a2;
  *(__n128 *)(a3 + 24) = *a2;
  return result;
}

uint64_t sub_24F96D960(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73746E656D656C65 && a2 == 0xE800000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x73756F6976657270 && a2 == 0xE800000000000000;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1954047342 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = OUTLINED_FUNCTION_5_1();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_24F96DA84(char a1)
{
  if (!a1) {
    return 0x73746E656D656C65;
  }
  if (a1 == 1) {
    return 0x73756F6976657270;
  }
  return 1954047342;
}

uint64_t sub_24F96DAD4()
{
  return sub_24F98E718();
}

uint64_t sub_24F96DB14()
{
  return sub_24F96DA84(*v0);
}

uint64_t sub_24F96DB1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F96D960(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F96DB44(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F96DB50(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24F96DBA4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t Page.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v23 = *(void *)(a2 + 16);
  uint64_t v24 = *(void *)(a2 + 32);
  type metadata accessor for Page.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_24F98E638();
  OUTLINED_FUNCTION_0_1();
  uint64_t v22 = v5;
  OUTLINED_FUNCTION_11_5();
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v17 - v7;
  uint64_t v10 = *v2;
  uint64_t v9 = v2[1];
  uint64_t v20 = v2[2];
  uint64_t v21 = v9;
  uint64_t v11 = v2[3];
  uint64_t v18 = v2[4];
  uint64_t v19 = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F98E738();
  uint64_t v26 = v10;
  char v29 = 0;
  sub_24F98E1D8();
  uint64_t v28 = v24;
  swift_getWitnessTable();
  uint64_t v12 = v25;
  sub_24F98E628();
  if (v12) {
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v8, v4);
  }
  uint64_t v15 = v18;
  uint64_t v14 = v19;
  uint64_t v16 = v22;
  uint64_t v26 = v21;
  uint64_t v27 = v20;
  char v29 = 1;
  sub_24F96DE24();
  OUTLINED_FUNCTION_7_5();
  uint64_t v26 = v14;
  uint64_t v27 = v15;
  char v29 = 2;
  OUTLINED_FUNCTION_7_5();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v8, v4);
}

uint64_t type metadata accessor for Page.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_24F96DE24()
{
  unint64_t result = qword_269A35988;
  if (!qword_269A35988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35988);
  }
  return result;
}

uint64_t Page.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for Page.CodingKeys();
  swift_getWitnessTable();
  sub_24F98E558();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_11_5();
  MEMORY[0x270FA5388](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F98E728();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_24F98E1D8();
    swift_getWitnessTable();
    sub_24F98E538();
    sub_24F96E114();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_5_5();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_5_5();
    uint64_t v6 = OUTLINED_FUNCTION_3_5();
    v7(v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v9;
    a2[1] = v9;
    a2[2] = v10;
    a2[3] = v9;
    a2[4] = v10;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24F96E114()
{
  unint64_t result = qword_269A35990;
  if (!qword_269A35990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35990);
  }
  return result;
}

uint64_t sub_24F96E160@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return Page.init(from:)(a1, a2);
}

uint64_t sub_24F96E184(void *a1, uint64_t a2)
{
  return Page.encode(to:)(a1, a2);
}

uint64_t Cursor.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Cursor.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Cursor.rawValue.modify())()
{
  return nullsub_1;
}

GameServicesProtocols::Cursor __swiftcall Cursor.init(rawValue:)(GameServicesProtocols::Cursor rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t sub_24F96E22C@<X0>(Swift::String *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = Cursor.init(rawValue:)(*a1).rawValue._countAndFlagsBits;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_24F96E26C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Cursor.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F96E294()
{
  return sub_24F98E108();
}

uint64_t sub_24F96E2DC()
{
  return sub_24F98E0B8();
}

__n128 PaginatedSequence.init(after:_:)@<Q0>(__n128 *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, __n128 *a4@<X8>)
{
  __n128 result = *a1;
  *a4 = *a1;
  a4[1].n128_u64[0] = a2;
  a4[1].n128_u64[1] = a3;
  return result;
}

uint64_t sub_24F96E324(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  sub_24F98E238();
  OUTLINED_FUNCTION_11_5();
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = v3;
  long long v10 = *(_OWORD *)(a1 + 24);
  long long v5 = v1[1];
  long long v11 = *v1;
  long long v12 = v5;
  sub_24F96EEC4((uint64_t)&v8[-v6]);
  return sub_24F98E298();
}

uint64_t sub_24F96E40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = a4;
  uint64_t v31 = a8;
  uint64_t v29 = a7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  uint64_t v13 = sub_24F98E268();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v28 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A359B8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24F98E208();
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 1, 1, v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v13);
  unint64_t v23 = (*(unsigned __int8 *)(v15 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  uint64_t v25 = v29;
  *((void *)v24 + 4) = a6;
  *((void *)v24 + 5) = v25;
  *((void *)v24 + 6) = v31;
  *((void *)v24 + 7) = a2;
  uint64_t v26 = v30;
  *((void *)v24 + 8) = a3;
  *((void *)v24 + 9) = v26;
  *((void *)v24 + 10) = a5;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v24[v23], v18, v13);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24F96ED5C((uint64_t)v21, (uint64_t)&unk_269A359C8, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_24F96E5F0()
{
  OUTLINED_FUNCTION_4_6();
  v0[17] = v1;
  v0[18] = v10;
  v0[15] = v2;
  v0[16] = v3;
  v0[13] = v4;
  v0[14] = v5;
  v0[19] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  uint64_t v6 = sub_24F98E228();
  v0[20] = v6;
  v0[21] = *(void *)(v6 - 8);
  v0[22] = swift_task_alloc();
  uint64_t v7 = *(void *)(v10 - 8);
  v0[23] = v7;
  v0[24] = *(void *)(v7 + 64);
  v0[25] = swift_task_alloc();
  v0[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24F96E744, 0, 0);
}

uint64_t sub_24F96E744()
{
  uint64_t v1 = (int *)v0[15];
  uint64_t v2 = v0[13];
  v0[27] = v0[14];
  uint64_t v3 = swift_bridgeObjectRetain();
  v0[7] = v2;
  v0[8] = v3;
  uint64_t v6 = (int *)((char *)v1 + *v1);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[28] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24F96E848;
  return ((uint64_t (*)(void *, void *))v6)(v0 + 2, v0 + 7);
}

uint64_t sub_24F96E848()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_44();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v5 = v4;
  *(void *)(v3 + 232) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v6 = sub_24F96ECC0;
  }
  else {
    uint64_t v6 = sub_24F96E93C;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24F96E93C()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[18];
  uint64_t v20 = v0[5];
  uint64_t v21 = v0[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_24F98E138();
  swift_bridgeObjectRelease();
  v0[10] = v3;
  if (v3 != MEMORY[0x253366A90](v1, v2))
  {
    do
    {
      char v7 = sub_24F98E188();
      sub_24F98E158();
      if (v7)
      {
        (*(void (**)(void, unint64_t, void))(v0[23] + 16))(v0[26], v1+ ((*(unsigned __int8 *)(v0[23] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[23] + 80))+ *(void *)(v0[23] + 72) * v3, v0[18]);
      }
      else
      {
        uint64_t v14 = v0[24];
        uint64_t result = sub_24F98E338();
        if (v14 != 8)
        {
          __break(1u);
          return result;
        }
        uint64_t v15 = result;
        uint64_t v16 = v0[26];
        uint64_t v17 = v0[23];
        uint64_t v18 = v0[18];
        v0[11] = v15;
        (*(void (**)(uint64_t, void *, uint64_t))(v17 + 16))(v16, v0 + 11, v18);
        swift_unknownObjectRelease();
      }
      uint64_t v9 = v0[25];
      uint64_t v8 = v0[26];
      uint64_t v11 = v0[22];
      uint64_t v10 = v0[23];
      uint64_t v12 = v0[21];
      uint64_t v23 = v0[20];
      uint64_t v13 = v0[18];
      swift_bridgeObjectRetain();
      MEMORY[0x253366AA0](v0 + 10, v1, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v9, v8, v13);
      sub_24F98E268();
      sub_24F98E248();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v23);
      uint64_t v3 = v0[10];
    }
    while (v3 != MEMORY[0x253366A90](v1, v13));
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
    v0[27] = v21;
    v0[7] = v20;
    uint64_t v4 = (int *)v0[15];
    v0[8] = v21;
    uint64_t v22 = (int *)((char *)v4 + *v4);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[28] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_24F96E848;
    return ((uint64_t (*)(void *, void *))v22)(v0 + 2, v0 + 7);
  }
  else
  {
    v0[12] = 0;
    sub_24F98E268();
    sub_24F98E258();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_8_5();
    return v19();
  }
}

uint64_t sub_24F96ECC0()
{
  OUTLINED_FUNCTION_4_6();
  *(void *)(v0 + 72) = *(void *)(v0 + 232);
  sub_24F98E268();
  sub_24F98E258();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_5();
  return v1();
}

uint64_t sub_24F96ED5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24F98E208();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_24F970054(a1);
  }
  else
  {
    sub_24F98E1F8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24F98E1E8();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24F96EEC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F680];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  uint64_t v3 = sub_24F98E238();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t PaginatedSequence.makeAsyncIterator()(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  uint64_t v3 = sub_24F98E288();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_11_5();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v11 - v7;
  long long v9 = v1[1];
  v11[0] = *v1;
  v11[1] = v9;
  sub_24F96E324(a1);
  sub_24F98E278();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t PaginatedSequence.toArray()(uint64_t a1)
{
  *(void *)(v2 + 64) = a1;
  long long v3 = v1[1];
  *(_OWORD *)(v2 + 72) = *v1;
  *(_OWORD *)(v2 + 88) = v3;
  return MEMORY[0x270FA2498](sub_24F96F070, 0, 0);
}

uint64_t sub_24F96F070()
{
  uint64_t v1 = *(void **)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 88);
  uint64_t v2 = v1[2];
  *(void *)(v0 + 56) = sub_24F98E178();
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  v3[2] = v2;
  v3[3] = v1[3];
  v3[4] = v1[4];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v4;
  uint64_t v5 = sub_24F98E1D8();
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v4 = v0;
  v4[1] = sub_24F96F1D0;
  uint64_t v7 = *(void *)(v0 + 64);
  return MEMORY[0x270FA20A8](v0 + 48, v0 + 56, &unk_269A359A8, v3, v7, v5, WitnessTable);
}

uint64_t sub_24F96F1D0()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_44();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v5 = v4;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_24F96F2D8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = sub_24F96F2BC;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24F96F2BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 48));
}

uint64_t sub_24F96F2D8()
{
  OUTLINED_FUNCTION_4_6();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_5();
  return v0();
}

uint64_t sub_24F96F334()
{
  OUTLINED_FUNCTION_4_6();
  v0[3] = v1;
  v0[4] = v2;
  v0[2] = v3;
  v0[5] = *(void *)(v2 - 8);
  v0[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24F96F3E8, 0, 0);
}

uint64_t sub_24F96F3E8()
{
  (*(void (**)(void, void, void))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  sub_24F98E1D8();
  sub_24F98E1A8();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24F96F490(uint64_t a1)
{
  PaginatedSequence.makeAsyncIterator()(a1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F96F4D0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F96F5AC;
  return v6(a1);
}

uint64_t sub_24F96F5AC()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_44();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_24F96F674()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F96F720;
  return sub_24F96F334();
}

uint64_t sub_24F96F720()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_44();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_8_5();
  return v3();
}

uint64_t sub_24F96F7E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F96F7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_24F96F804()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_24F96F848(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_24F96F8A0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_24F96F928(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24F96F980(uint64_t *a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    uint64_t v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v2) = -1;
    }
  }
  return OUTLINED_FUNCTION_11_0(v2);
}

uint64_t sub_24F96F9BC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Page()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for Cursor(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16))
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
  return OUTLINED_FUNCTION_11_0(v2);
}

ValueMetadata *type metadata accessor for Cursor()
{
  return &type metadata for Cursor;
}

uint64_t sub_24F96FA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24F96FA70()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_24F96FAAC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_24F96FAF8(void *a1, void *a2)
{
  OUTLINED_FUNCTION_10_5(a1, a2);
  v3[1] = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v2 + 24);
  v3[2] = *(void *)(v2 + 16);
  v3[3] = v5;
  swift_retain();
  swift_release();
  return v3;
}

uint64_t sub_24F96FB54(void *a1, void *a2)
{
  OUTLINED_FUNCTION_10_5(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + 24);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  *(void *)(v3 + 24) = v4;
  swift_release();
  return v3;
}

uint64_t sub_24F96FB98(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    unint64_t v2 = *(void *)(a1 + 16);
    if (v2 >= 0xFFFFFFFF) {
      LODWORD(v2) = -1;
    }
  }
  return OUTLINED_FUNCTION_11_0(v2);
}

uint64_t sub_24F96FBD4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for PaginatedSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F96FC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24F96FC34(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_24F96FCBC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F96FD88);
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

uint64_t sub_24F96FDB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F96FDCC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F96FDE8()
{
  return swift_getWitnessTable();
}

unint64_t sub_24F96FE04()
{
  unint64_t result = qword_269A359B0;
  if (!qword_269A359B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A359B0);
  }
  return result;
}

uint64_t sub_24F96FE50(uint64_t a1)
{
  return sub_24F96E40C(a1, v1[5], v1[6], v1[7], v1[8], v1[2], v1[3], v1[4]);
}

uint64_t sub_24F96FE64()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  uint64_t v1 = sub_24F98E268();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 88) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_24F96FF38()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35708);
  sub_24F98E268();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F96F720;
  return sub_24F96E5F0();
}

uint64_t sub_24F970054(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A359B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F9700B4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F9700EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24F9701A4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A359D0 + dword_269A359D0);
  return v6(a1, v4);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_24F98E4C8();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return sub_24F98E5B8();
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return v0 + 8;
}

void *OUTLINED_FUNCTION_10_5(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return v0;
}

uint64_t Profile.Subscriptions.rawValue.getter()
{
  return *(void *)v0;
}

GameServicesProtocols::Profile::Subscriptions __swiftcall Profile.Subscriptions.init(rawValue:)(GameServicesProtocols::Profile::Subscriptions rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void *sub_24F970280()
{
  return &unk_24F993F00;
}

void static Profile.Subscriptions.arcade.getter(void *a1@<X8>)
{
  *a1 = 1;
}

GameServicesProtocols::Profile::Subscriptions sub_24F970298(Swift::Int *a1)
{
  return Profile.Subscriptions.init(rawValue:)(*a1);
}

uint64_t sub_24F9702A0()
{
  return sub_24F98E118();
}

uint64_t sub_24F9702E8()
{
  return sub_24F98E0C8();
}

void sub_24F970324(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_24F97032C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24F970338(*a1, *v2, a2);
}

uint64_t sub_24F970338@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_24F970344@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24F970350(*a1, *v2, a2);
}

uint64_t sub_24F970350@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_24F97035C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24F970368(*a1, *v2, a2);
}

uint64_t sub_24F970368@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_24F970374(void *a1, uint64_t *a2)
{
  return sub_24F97037C(a1, *a2);
}

BOOL sub_24F97037C(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_24F9703A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24F9703B0(*a1, a2);
}

uint64_t sub_24F9703B0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_24F9703D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24F9703E0(*a1, a2);
}

uint64_t sub_24F9703E0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_24F970400(uint64_t *a1)
{
  return sub_24F970408(*a1);
}

uint64_t sub_24F970408(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_24F970418(uint64_t *a1)
{
  return sub_24F970420(*a1);
}

uint64_t sub_24F970420(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_24F970430(uint64_t *a1)
{
  return sub_24F970438(*a1);
}

uint64_t sub_24F970438(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_24F970448@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24F970454(*a1, *v2, a2);
}

uint64_t sub_24F970454@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_24F970460(uint64_t *a1)
{
  return sub_24F97046C(*a1, *v1);
}

BOOL sub_24F97046C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_24F970478(uint64_t *a1)
{
  return sub_24F970484(*a1, *v1);
}

BOOL sub_24F970484(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_24F970490(uint64_t *a1)
{
  return sub_24F97049C(*a1, *v1);
}

BOOL sub_24F97049C(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_24F9704A8()
{
  return sub_24F9704B0(*v0);
}

BOOL sub_24F9704B0(uint64_t a1)
{
  return a1 == 0;
}

uint64_t OUTLINED_FUNCTION_29_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_24F9704D4(uint64_t *a1)
{
  return sub_24F9704DC(*a1);
}

uint64_t sub_24F9704DC(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

GameServicesProtocols::Profile::Subscriptions sub_24F9704EC@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = Profile.Subscriptions.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_24F970518@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Profile.Subscriptions.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_24F970540(uint64_t *a1, uint64_t *a2)
{
  return sub_24F97054C(*a1, *a2);
}

BOOL sub_24F97054C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_24F97055C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t Profile.player.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

void Profile.subscriptions.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

uint64_t Profile.contact.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 32), a1);
}

uint64_t Profile.nickname.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Profile.contactName.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Profile.image.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 80), a1);
}

__n128 Profile.init(player:subscriptions:contact:nickname:contactName:image:)@<Q0>(void *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, __n128 *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v9 = a1[1];
  uint64_t v10 = *a2;
  *(void *)a9 = *a1;
  *(void *)(a9 + 8) = v9;
  *(void *)(a9 + 16) = v10;
  *(_OWORD *)(a9 + 24) = *a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  __n128 result = *a8;
  *(__n128 *)(a9 + 72) = *a8;
  return result;
}

uint64_t sub_24F970664(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x726579616C70 && a2 == 0xE600000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x7069726373627573 && v2 == 0xED0000736E6F6974;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      OUTLINED_FUNCTION_28_2();
      BOOL v7 = v4 && v2 == 0xE700000000000000;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = v3 == 0x656D616E6B63696ELL && v2 == 0xE800000000000000;
        if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = v3 == 0x4E746361746E6F63 && v2 == 0xEB00000000656D61;
          if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (v3 == 0x6567616D69 && v2 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            OUTLINED_FUNCTION_5_1();
            OUTLINED_FUNCTION_42();
            if (v3) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_24F97089C(char a1)
{
  uint64_t result = 0x726579616C70;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7069726373627573;
      break;
    case 2:
      uint64_t result = 0x746361746E6F63;
      break;
    case 3:
      uint64_t result = 0x656D616E6B63696ELL;
      break;
    case 4:
      uint64_t result = 0x4E746361746E6F63;
      break;
    case 5:
      uint64_t result = 0x6567616D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F970974()
{
  return sub_24F97089C(*v0);
}

uint64_t sub_24F97097C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F970664(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F9709A4()
{
  sub_24F970CC0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9709DC()
{
  sub_24F970CC0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void Profile.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A359E0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_44_1();
  sub_24F970CC0();
  sub_24F98E738();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A35390, &qword_269A35388);
  sub_24F98E628();
  if (!v0)
  {
    sub_24F970D0C();
    sub_24F98E628();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    sub_24F949E34(&qword_269A359F0, &qword_269A35750);
    OUTLINED_FUNCTION_16_2();
    sub_24F98E578();
    sub_24F98E578();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
    sub_24F949E34(&qword_269A353A0, &qword_269A35398);
    OUTLINED_FUNCTION_16_2();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F970CC0()
{
  unint64_t result = qword_269A3D8F0;
  if (!qword_269A3D8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3D8F0);
  }
  return result;
}

unint64_t sub_24F970D0C()
{
  unint64_t result = qword_269A359E8;
  if (!qword_269A359E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A359E8);
  }
  return result;
}

void Profile.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A359F8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_24_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F970CC0();
  sub_24F98E728();
  if (v0)
  {
    char v6 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    OUTLINED_FUNCTION_38_2();
    sub_24F98E538();
    unint64_t v10 = sub_24F971198();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_23_1();
    sub_24F98E538();
    if (!v10)
    {
      uint64_t v24 = v27;
      uint64_t v25 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
      sub_24F949E34(&qword_269A35A08, &qword_269A35750);
      OUTLINED_FUNCTION_38_2();
      sub_24F98E4C8();
      int v7 = 1;
      uint64_t v23 = v27;
      swift_bridgeObjectRetain();
      uint64_t v22 = OUTLINED_FUNCTION_42_2();
      LOBYTE(v27) = 4;
      uint64_t v26 = v13;
      swift_bridgeObjectRetain();
      uint64_t v21 = OUTLINED_FUNCTION_42_2();
      uint64_t v15 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
      uint64_t v16 = sub_24F949E34(&qword_269A353C0, &qword_269A35398);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_38_2();
      OUTLINED_FUNCTION_23_1();
      sub_24F98E4C8();
      if (!v16)
      {
        uint64_t v19 = OUTLINED_FUNCTION_2_6();
        v20(v19);
        swift_bridgeObjectRetain();
        *uint64_t v4 = v25;
        v4[1] = v28;
        v4[2] = v24;
        v4[3] = v23;
        v4[4] = v28;
        v4[5] = v22;
        v4[6] = v26;
        v4[7] = v21;
        v4[8] = v15;
        v4[9] = v27;
        v4[10] = v28;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
      uint64_t v17 = OUTLINED_FUNCTION_2_6();
      v18(v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v8 = 1;
      int v9 = 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
      goto LABEL_6;
    }
    uint64_t v11 = OUTLINED_FUNCTION_2_6();
    v12(v11);
    swift_bridgeObjectRelease();
    char v6 = 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
LABEL_6:
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (!v8)
  {
LABEL_8:
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  if (v9) {
LABEL_12:
  }
    swift_bridgeObjectRelease();
LABEL_13:
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F971198()
{
  unint64_t result = qword_269A35A00;
  if (!qword_269A35A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A00);
  }
  return result;
}

uint64_t sub_24F9711E4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x676E656C6C616863 && a2 == 0xE900000000000065;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v3 == 0x616C7069746C756DLL && v2 == 0xEB00000000726579)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_42();
    if (v3) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F9712D4(char a1)
{
  if (a1) {
    return 0x616C7069746C756DLL;
  }
  else {
    return 0x676E656C6C616863;
  }
}

uint64_t sub_24F971318(uint64_t a1, uint64_t a2)
{
  if (a1 == 1701667175 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    sub_24F98E678();
    OUTLINED_FUNCTION_42();
    char v4 = v2 ^ 1;
  }
  return v4 & 1;
}

void sub_24F971388()
{
}

void sub_24F9713A0()
{
}

uint64_t sub_24F9713BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_24F971318(a1, a2);
  *a3 = result != 0;
  return result;
}

void sub_24F9713EC(unsigned char *a1@<X8>)
{
}

uint64_t sub_24F9713F4()
{
  sub_24F9718AC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97142C()
{
  sub_24F9718AC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F971464()
{
  return sub_24F9712D4(*v0);
}

uint64_t sub_24F97146C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F9711E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F971494()
{
  sub_24F971814();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9714CC()
{
  sub_24F971814();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F971504()
{
  sub_24F971860();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97153C()
{
  sub_24F971860();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void ParticipantInteraction.Mode.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A10);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A18);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A20);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_48_0();
  uint64_t v7 = *(unsigned __int8 *)(v0 + 16);
  OUTLINED_FUNCTION_44_1();
  sub_24F971814();
  sub_24F98E738();
  if (v7) {
    sub_24F971860();
  }
  else {
    sub_24F9718AC();
  }
  OUTLINED_FUNCTION_69();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
  sub_24F949E34(&qword_269A35418, &qword_269A35410);
  sub_24F98E628();
  OUTLINED_FUNCTION_2_2();
  v8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v7);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F971814()
{
  unint64_t result = qword_269A3D8F8;
  if (!qword_269A3D8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3D8F8);
  }
  return result;
}

unint64_t sub_24F971860()
{
  unint64_t result = qword_269A3D900;
  if (!qword_269A3D900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3D900);
  }
  return result;
}

unint64_t sub_24F9718AC()
{
  unint64_t result = qword_269A3D908;
  if (!qword_269A3D908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3D908);
  }
  return result;
}

void ParticipantInteraction.Mode.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = v3;
  uint64_t v34 = v5;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A28);
  OUTLINED_FUNCTION_0_1();
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_48_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A30);
  OUTLINED_FUNCTION_0_1();
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_103();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A38);
  OUTLINED_FUNCTION_0_1();
  uint64_t v37 = v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F971814();
  sub_24F98E728();
  if (v1) {
    goto LABEL_6;
  }
  v33[0] = v8;
  v33[1] = v0;
  uint64_t v33[2] = v2;
  uint64_t v41 = v4;
  uint64_t v16 = sub_24F98E548();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17
    || (char v18 = *(unsigned char *)(v16 + 32),
        sub_24F95548C(1, v17, v16, v16 + 32, 0, (2 * v17) | 1),
        uint64_t v20 = v19,
        unint64_t v22 = v21,
        swift_bridgeObjectRelease(),
        v20 != v22 >> 1))
  {
    uint64_t v23 = v37;
    uint64_t v24 = sub_24F98E378();
    swift_allocError();
    uint64_t v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
    *uint64_t v26 = &type metadata for ParticipantInteraction.Mode;
    sub_24F98E478();
    sub_24F98E368();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCB0], v24);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v15, v11);
    uint64_t v4 = v41;
LABEL_6:
    uint64_t v32 = (uint64_t)v4;
    goto LABEL_7;
  }
  LOBYTE(v39) = 1;
  sub_24F971860();
  OUTLINED_FUNCTION_41_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
  sub_24F949E34(&qword_269A35470, &qword_269A35410);
  sub_24F98E538();
  OUTLINED_FUNCTION_2_2();
  v27();
  swift_unknownObjectRelease();
  uint64_t v28 = OUTLINED_FUNCTION_6_5();
  v29(v28);
  uint64_t v30 = v40;
  uint64_t v31 = v34;
  *uint64_t v34 = v39;
  v31[1] = v30;
  *((unsigned char *)v31 + 16) = v18;
  uint64_t v32 = (uint64_t)v4;
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1(v32);
  OUTLINED_FUNCTION_16();
}

void sub_24F971DF0()
{
}

void sub_24F971E08()
{
}

uint64_t ParticipantInteraction.date.getter@<X0>(uint64_t a1@<X8>)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v5(a1, v1, v3);
}

uint64_t ParticipantInteraction.mode.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ParticipantInteraction() + 20);
  uint64_t v4 = *(void *)(v3 + 8);
  char v5 = *(unsigned char *)(v3 + 16);
  *(void *)a1 = *(void *)v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return sub_24F972900();
}

uint64_t ParticipantInteraction.player.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for ParticipantInteraction() + 24));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t ParticipantInteraction.contact.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for ParticipantInteraction() + 28));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

int *ParticipantInteraction.init(date:mode:player:contact:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  char v9 = *((unsigned char *)a2 + 16);
  uint64_t v10 = *a3;
  uint64_t v11 = a3[1];
  uint64_t v12 = *a4;
  uint64_t v13 = a4[1];
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(a5, a1);
  unint64_t result = (int *)type metadata accessor for ParticipantInteraction();
  uint64_t v16 = a5 + result[5];
  *(void *)uint64_t v16 = v7;
  *(void *)(v16 + 8) = v8;
  *(unsigned char *)(v16 + 16) = v9;
  uint64_t v17 = (void *)(a5 + result[6]);
  *uint64_t v17 = v10;
  v17[1] = v11;
  char v18 = (void *)(a5 + result[7]);
  *char v18 = v12;
  v18[1] = v13;
  return result;
}

uint64_t sub_24F972018(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 1701080941 && v2 == 0xE400000000000000;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = v3 == 0x726579616C70 && v2 == 0xE600000000000000;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        OUTLINED_FUNCTION_28_2();
        if (v4 && v2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_42();
          if (v3) {
            return 3;
          }
          else {
            return 4;
          }
        }
      }
    }
  }
}

uint64_t sub_24F97215C(char a1)
{
  uint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      uint64_t result = 1701080941;
      break;
    case 2:
      uint64_t result = 0x726579616C70;
      break;
    case 3:
      uint64_t result = 0x746361746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F9721D8()
{
  return sub_24F97215C(*v0);
}

uint64_t sub_24F9721E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F972018(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F972208()
{
  sub_24F972908();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F972240()
{
  sub_24F972908();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t ParticipantInteraction.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A40);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F972908();
  sub_24F98E738();
  sub_24F98DFB8();
  sub_24F94CD40(&qword_269A353A8);
  sub_24F98E628();
  if (!v1)
  {
    type metadata accessor for ParticipantInteraction();
    sub_24F972954();
    OUTLINED_FUNCTION_27_1();
    sub_24F98E628();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
    OUTLINED_FUNCTION_27_1();
    sub_24F98E628();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    sub_24F949E34(&qword_269A359F0, &qword_269A35750);
    OUTLINED_FUNCTION_27_1();
    sub_24F98E5B8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

void ParticipantInteraction.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = v3;
  uint64_t v24 = v5;
  uint64_t v6 = sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v26 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v27 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A50);
  OUTLINED_FUNCTION_0_1();
  uint64_t v25 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_29();
  uint64_t v12 = (int *)type metadata accessor for ParticipantInteraction();
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_44_1();
  sub_24F972908();
  uint64_t v29 = v2;
  sub_24F98E728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1(v4);
  }
  else
  {
    uint64_t v23 = v4;
    uint64_t v14 = v26;
    LOBYTE(v30) = 0;
    sub_24F94CD40(&qword_269A353C8);
    uint64_t v15 = v27;
    sub_24F98E538();
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v0, v15, v6);
    sub_24F9729A0();
    sub_24F98E538();
    char v16 = v31;
    uint64_t v17 = v0 + v12[5];
    *(_OWORD *)uint64_t v17 = v30;
    *(unsigned char *)(v17 + 16) = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    OUTLINED_FUNCTION_15_4();
    sub_24F98E538();
    uint64_t v18 = *((void *)&v30 + 1);
    uint64_t v19 = (void *)(v0 + v12[6]);
    *uint64_t v19 = v30;
    v19[1] = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    sub_24F949E34(&qword_269A35A08, &qword_269A35750);
    OUTLINED_FUNCTION_15_4();
    sub_24F98E4C8();
    uint64_t v20 = OUTLINED_FUNCTION_4_7();
    v21(v20);
    *(_OWORD *)(v0 + v12[7]) = v30;
    sub_24F9729F4(v0, v24);
    __swift_destroy_boxed_opaque_existential_1(v23);
    sub_24F972A58(v0);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F972888()
{
}

uint64_t sub_24F9728A0(void *a1)
{
  return ParticipantInteraction.encode(to:)(a1);
}

uint64_t type metadata accessor for ParticipantInteraction()
{
  uint64_t result = qword_269A3DFA0;
  if (!qword_269A3DFA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F972900()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_24F972908()
{
  unint64_t result = qword_269A3D910[0];
  if (!qword_269A3D910[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3D910);
  }
  return result;
}

unint64_t sub_24F972954()
{
  unint64_t result = qword_269A35A48;
  if (!qword_269A35A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A48);
  }
  return result;
}

unint64_t sub_24F9729A0()
{
  unint64_t result = qword_269A35A58;
  if (!qword_269A35A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A58);
  }
  return result;
}

uint64_t sub_24F9729EC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F9729F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ParticipantInteraction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F972A58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ParticipantInteraction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24F972AB8()
{
  unint64_t result = qword_269A35A60;
  if (!qword_269A35A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A60);
  }
  return result;
}

unint64_t sub_24F972B08()
{
  unint64_t result = qword_269A35A68;
  if (!qword_269A35A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A68);
  }
  return result;
}

unint64_t sub_24F972B58()
{
  unint64_t result = qword_269A35A70;
  if (!qword_269A35A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A70);
  }
  return result;
}

unint64_t sub_24F972BA8()
{
  unint64_t result = qword_269A35A78;
  if (!qword_269A35A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35A78);
  }
  return result;
}

uint64_t dispatch thunk of ProfileServiceProtocol.getProfiles(players:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24F94CF78;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of ProfileServiceProtocol.listInteractions(player:participants:after:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 24) + **(int **)(a5 + 24));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24F9740B8;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t destroy for Profile()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Profile(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Profile(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for Profile()
{
  OUTLINED_FUNCTION_113();
  uint64_t v3 = v2[1];
  *(void *)uint64_t v1 = *v2;
  *(void *)(v1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 16);
  *(void *)(v1 + 32) = *(void *)(v0 + 32);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 48);
  *(void *)(v1 + 40) = *(void *)(v0 + 40);
  *(void *)(v1 + 48) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 64);
  *(void *)(v1 + 56) = *(void *)(v0 + 56);
  *(void *)(v1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v0 + 80);
  *(void *)(v1 + 72) = *(void *)(v0 + 72);
  *(void *)(v1 + 80) = v6;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t getEnumTagSinglePayload for Profile(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
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

uint64_t storeEnumTagSinglePayload for Profile(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for Profile()
{
}

void type metadata accessor for Profile.Subscriptions()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for ParticipantInteraction(uint64_t *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_3_2();
  int v10 = *(_DWORD *)(v9 + 80);
  if ((v10 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v10 + 16) & ~(unint64_t)v10));
    swift_retain();
  }
  else
  {
    uint64_t v11 = v8;
    sub_24F98DFB8();
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(uint64_t *, uint64_t *))(v12 + 16))(a1, a2);
    OUTLINED_FUNCTION_12_5();
    *(void *)uint64_t v5 = v2;
    *(void *)(v5 + 8) = v3;
    *(unsigned char *)(v5 + 16) = v4;
    uint64_t v13 = *(int *)(v11 + 24);
    uint64_t v14 = *(int *)(v11 + 28);
    uint64_t v15 = (uint64_t *)((char *)a1 + v13);
    char v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (uint64_t *)((char *)a1 + v14);
    uint64_t v19 = (uint64_t *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ParticipantInteraction()
{
  OUTLINED_FUNCTION_113();
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2();
  v0();
  sub_24F9729EC();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ParticipantInteraction()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  v4(v3);
  uint64_t v5 = v0[5];
  uint64_t v6 = v2 + v5;
  uint64_t v7 = (uint64_t *)(v1 + v5);
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  char v10 = *((unsigned char *)v7 + 16);
  sub_24F972900();
  *(void *)uint64_t v6 = v8;
  *(void *)(v6 + 8) = v9;
  *(unsigned char *)(v6 + 16) = v10;
  uint64_t v11 = v0[6];
  uint64_t v12 = v0[7];
  uint64_t v13 = (void *)(v2 + v11);
  uint64_t v14 = (void *)(v1 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  char v16 = (void *)(v2 + v12);
  uint64_t v17 = (void *)(v1 + v12);
  uint64_t v18 = v17[1];
  *char v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t assignWithCopy for ParticipantInteraction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_1_1();
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(a1, a2);
  OUTLINED_FUNCTION_12_5();
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = v4;
  *(unsigned char *)(v6 + 16) = v5;
  sub_24F9729EC();
  uint64_t v11 = OUTLINED_FUNCTION_21_2(*(int *)(a3 + 24));
  *(void *)(v12 + 8) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = OUTLINED_FUNCTION_21_2(*(int *)(a3 + 28));
  *(void *)(v14 + 8) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ParticipantInteraction()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  v4(v3);
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v2 + v5;
  uint64_t v8 = v1 + v5;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
  *(unsigned char *)(v7 + 16) = *(unsigned char *)(v8 + 16);
  *(_OWORD *)(v2 + v6) = *(_OWORD *)(v1 + v6);
  *(_OWORD *)(v2 + v0[7]) = *(_OWORD *)(v1 + v0[7]);
  return v2;
}

uint64_t assignWithTake for ParticipantInteraction()
{
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = OUTLINED_FUNCTION_20_1();
  v4(v3);
  uint64_t v5 = v0[5];
  uint64_t v6 = v2 + v5;
  uint64_t v7 = v1 + v5;
  char v8 = *(unsigned char *)(v7 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
  *(unsigned char *)(v6 + 16) = v8;
  sub_24F9729EC();
  OUTLINED_FUNCTION_29_3(v0[6]);
  OUTLINED_FUNCTION_29_3(v0[7]);
  return v2;
}

uint64_t getEnumTagSinglePayload for ParticipantInteraction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F973508);
}

uint64_t sub_24F973508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ParticipantInteraction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F9735B0);
}

void sub_24F9735B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
}

uint64_t sub_24F973640()
{
  uint64_t result = sub_24F98DFB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for ParticipantInteraction.Mode()
{
  return sub_24F9729EC();
}

uint64_t _s21GameServicesProtocols22ParticipantInteractionV4ModeOwCP_0()
{
  OUTLINED_FUNCTION_18_1();
  *(void *)uint64_t v0 = v1;
  *(void *)(v0 + 8) = v2;
  *(unsigned char *)(v0 + 16) = v3;
  return v0;
}

uint64_t assignWithCopy for ParticipantInteraction.Mode()
{
  OUTLINED_FUNCTION_18_1();
  *(void *)uint64_t v0 = v1;
  *(void *)(v0 + 8) = v2;
  *(unsigned char *)(v0 + 16) = v3;
  sub_24F9729EC();
  return v0;
}

uint64_t assignWithTake for ParticipantInteraction.Mode(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24F9729EC();
  return a1;
}

uint64_t getEnumTagSinglePayload for ParticipantInteraction.Mode(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return OUTLINED_FUNCTION_11_0(*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 > 1) {
    return OUTLINED_FUNCTION_11_0(v3 ^ 0xFF);
  }
  else {
    return OUTLINED_FUNCTION_11_0(-1);
  }
}

uint64_t storeEnumTagSinglePayload for ParticipantInteraction.Mode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24F973838(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for ParticipantInteraction.Mode()
{
}

unsigned char *sub_24F973850(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F97390CLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 3);
        break;
    }
  }
  return result;
}

void type metadata accessor for ParticipantInteraction.CodingKeys()
{
}

unsigned char *sub_24F973940(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F9739FCLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for ParticipantInteraction.Mode.CodingKeys()
{
}

void type metadata accessor for ParticipantInteraction.Mode.ChallengeCodingKeys()
{
}

unsigned char *sub_24F973A40(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F973ADCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for ParticipantInteraction.Mode.MultiplayerCodingKeys()
{
}

unsigned char *sub_24F973B10(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F973BCCLL);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 5);
        break;
    }
  }
  return result;
}

void type metadata accessor for Profile.CodingKeys()
{
}

unint64_t sub_24F973C04()
{
  unint64_t result = qword_269A3E0B0[0];
  if (!qword_269A3E0B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3E0B0);
  }
  return result;
}

unint64_t sub_24F973C54()
{
  unint64_t result = qword_269A3E2C0[0];
  if (!qword_269A3E2C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3E2C0);
  }
  return result;
}

unint64_t sub_24F973CA4()
{
  unint64_t result = qword_269A3E4D0[0];
  if (!qword_269A3E4D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3E4D0);
  }
  return result;
}

unint64_t sub_24F973CF4()
{
  unint64_t result = qword_269A3E6E0[0];
  if (!qword_269A3E6E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3E6E0);
  }
  return result;
}

unint64_t sub_24F973D44()
{
  unint64_t result = qword_269A3E8F0;
  if (!qword_269A3E8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3E8F0);
  }
  return result;
}

unint64_t sub_24F973D94()
{
  unint64_t result = qword_269A3EA00;
  if (!qword_269A3EA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3EA00);
  }
  return result;
}

unint64_t sub_24F973DE4()
{
  unint64_t result = qword_269A3EA08[0];
  if (!qword_269A3EA08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3EA08);
  }
  return result;
}

unint64_t sub_24F973E34()
{
  unint64_t result = qword_269A3EA90;
  if (!qword_269A3EA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3EA90);
  }
  return result;
}

unint64_t sub_24F973E84()
{
  unint64_t result = qword_269A3EA98[0];
  if (!qword_269A3EA98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3EA98);
  }
  return result;
}

unint64_t sub_24F973ED4()
{
  unint64_t result = qword_269A3EB20;
  if (!qword_269A3EB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3EB20);
  }
  return result;
}

unint64_t sub_24F973F24()
{
  unint64_t result = qword_269A3EB28[0];
  if (!qword_269A3EB28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3EB28);
  }
  return result;
}

unint64_t sub_24F973F74()
{
  unint64_t result = qword_269A3EBB0;
  if (!qword_269A3EBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3EBB0);
  }
  return result;
}

unint64_t sub_24F973FC4()
{
  unint64_t result = qword_269A3EBB8[0];
  if (!qword_269A3EBB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3EBB8);
  }
  return result;
}

unint64_t sub_24F974014()
{
  unint64_t result = qword_269A3EC40;
  if (!qword_269A3EC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3EC40);
  }
  return result;
}

unint64_t sub_24F974064()
{
  unint64_t result = qword_269A3EC48[0];
  if (!qword_269A3EC48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3EC48);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return *(void *)(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return sub_24F972900();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return sub_24F98E5B8();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_24F972900();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_2@<X0>(uint64_t a1@<X8>)
{
  int v3 = (void *)(v1 + a1);
  unsigned int v4 = (void *)(v2 + a1);
  *int v3 = *v4;
  return v4[1];
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return 1701667175;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_29_3@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = (void *)(v2 + a1);
  uint64_t v5 = (uint64_t *)(v1 + a1);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  *unsigned int v4 = v7;
  v4[1] = v6;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return sub_24F98E468();
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return sub_24F98E488();
}

void *OUTLINED_FUNCTION_44_1()
{
  return __swift_project_boxed_opaque_existential_1(v1, v0);
}

uint64_t static GameServiceRootProtocol.schema.getter()
{
  type metadata accessor for ServiceSchema();
  static GameServiceRootProtocol.declaration.getter();
  uint64_t v1 = v3;
  long long v2 = v4;
  return ServiceSchema.__allocating_init(declaration:)(&v1);
}

unint64_t static GameServiceRootProtocol.declaration.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A90);
  uint64_t v0 = swift_allocObject();
  OUTLINED_FUNCTION_20_2((__n128 *)v0, (__n128)xmmword_24F994850);
  static AchievementServiceProtocol.declaration.getter(v1);
  static ActivityServiceProtocol.declaration.getter((GameServicesProtocols::ProtocolDeclaration *)(v0 + 72));
  static ChallengeServiceProtocol.declaration.getter(COERCE_DOUBLE(v0 + 112));
  static FriendServiceProtocol.declaration.getter((GameServicesProtocols::ProtocolDeclaration *)(v0 + 152));
  static GameLibraryServiceProtocol.declaration.getter(v0 + 192);
  static LeaderboardServiceProtocol.declaration.getter(v0 + 232);
  static ProfileServiceProtocol.declaration.getter((GameServicesProtocols::ProtocolDeclaration *)(v0 + 272));
  OUTLINED_FUNCTION_52_2();
  unint64_t v3 = 0xD000000000000017;
  return (unint64_t)ServiceDeclaration.init(rootTypeName:protocols:)(*(Swift::String *)&v3, (Swift::OpaquePointer)v0);
}

void static AchievementServiceProtocol.declaration.getter(double x8_0@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  uint64_t v1 = swift_allocObject();
  OUTLINED_FUNCTION_75_1((__n128 *)v1, (__n128)xmmword_24F994860);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  uint64_t v2 = OUTLINED_FUNCTION_27_2();
  *(_OWORD *)(v2 + 16) = xmmword_24F990910;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  unint64_t v3 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v3, (__n128)xmmword_24F990910);
  v4._rawValue = (void *)MEMORY[0x263F8EE78];
  v5._unint64_t countAndFlagsBits = 0x6D65766569686341;
  v5._object = (void *)0xEE00666552746E65;
  TypeRef.init(_:arguments:)(v5, MEMORY[0x263F8EE78]);
  OUTLINED_FUNCTION_7_6();
  v298.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v298.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_6_6(0x6D65766569686361, v298, v6, (GameServicesProtocols::ParameterDeclaration *)(v2 + 32));
  uint64_t v7 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v7, (__n128)xmmword_24F990910);
  v8._unint64_t countAndFlagsBits = 0xD000000000000016;
  v8._object = (void *)0x800000024F998C60;
  TypeRef.init(_:arguments:)(v8, v4);
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_35_2(v9, v10, v11, v12, v13, v14, v15, v16, v176, 9.47036828e218, _, x8_0, v239, v254, COERCE_DOUBLE(1), COERCE_DOUBLE(2), *(double *)&v283, *(double *)&v284, *(double *)&v285,
    *(double *)&v286,
    *(double *)&v287);
  v17._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_38_3();
  MethodDeclaration.init(_:_:_:)(v18, v17, (Swift::OpaquePointer)v2, v290);
  uint64_t v19 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v19 + 16) = xmmword_24F990920;
  uint64_t v20 = (__n128 *)OUTLINED_FUNCTION_1_4();
  int v21 = OUTLINED_FUNCTION_44_2(v20, (__n128)v265);
  OUTLINED_FUNCTION_56_1(v21, v22, v23, v24, v25, v26, v27, v28, v177, v192, _a, (uint64_t)v223, 2, 4, v265, *((uint64_t *)&v265 + 1), v283, v284, v285,
    v286);
  v299.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v299.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_6_6(0x73656D6167, v299, v29, (GameServicesProtocols::ParameterDeclaration *)(v19 + 32));
  long long v30 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v30, (__n128)v266);
  v31._unint64_t countAndFlagsBits = 0x726F73727543;
  v31._object = (void *)0xE600000000000000;
  TypeRef.init(_:arguments:)(v31, v4);
  OUTLINED_FUNCTION_54_2();
  v300.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v300.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_60_1(v300, v32, (GameServicesProtocols::ParameterDeclaration *)(v19 + 96));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v266;
  uint64_t v33 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_8(v33, v34, v35, v36, v37, v38, v39, v40, v178, v193, _b, (uint64_t)v224, v240, v255, v266);
  v41._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_50_2();
  GameServicesProtocols::TypeRef v289 = TypeRef.init(_:arguments:)(v41, (Swift::OpaquePointer)v3);
  unint64_t v47 = OUTLINED_FUNCTION_56_1(v289.name._countAndFlagsBits, (int)v289.name._object, (int)v289.arguments._rawValue, v42, v43, v44, v45, v46, v179, v194, _c, (uint64_t)v225, v241, v256, v267, v279, v283, v284, v285,
          v286);
  OUTLINED_FUNCTION_32_1(v47, v48, v49, v50, v51, v52, v53, v54, v180, v195, _d, (uint64_t)v226, v242, v257, v268, v280, v283, v284, v285,
    v286,
    v287);
  v55._unint64_t countAndFlagsBits = 0xD000000000000010;
  v55._object = (void *)0x800000024F998C80;
  v291.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v1 + 80), v55, (Swift::OpaquePointer)v19, v291);
  uint64_t v56 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v56 + 16) = *(_OWORD *)v243;
  uint64_t v57 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_8(v57, v58, v59, v60, v61, v62, v63, v64, v181, v196, _e, (uint64_t)v227, v243[0], v243[1], v269);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_51_2();
  uint64_t v65 = v197;
  OUTLINED_FUNCTION_6_6(v197, v301, v66, v67);
  OUTLINED_FUNCTION_0_3();
  char v68 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_12_6(v68, v69, v70, v71, v302, v72, v182, v197, _f, (uint64_t)v228, v244, v258, v270, v281, v283);
  uint64_t v73 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v73, (__n128)v271);
  v74._object = (void *)0x800000024F998CA0;
  v74._unint64_t countAndFlagsBits = 0xD000000000000013;
  TypeRef.init(_:arguments:)(v74, v4);
  unint64_t v75 = OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_32_1(v75, v76, v77, v78, v79, v80, v81, v82, v183, v198, 0x800000024F998CA0, (uint64_t)v229, v245, v259, v271, *((uint64_t *)&v271 + 1), v283, v284, v285,
    v286,
    v287);
  v83._object = (void *)0xEB00000000737365;
  v292.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  v83._unint64_t countAndFlagsBits = 0x72676F7250746567;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v1 + 128), v83, (Swift::OpaquePointer)v56, v292);
  uint64_t v84 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v84 + 16) = *(_OWORD *)v246;
  uint64_t v85 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_8(v85, v86, v87, v88, v89, v90, v91, v92, v184, v199, _g, (uint64_t)v230, v246[0], v246[1], v272);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_51_2();
  v93._unint64_t countAndFlagsBits = 0x676E69766168;
  v93._object = (void *)0xE600000000000000;
  v94.value._unint64_t countAndFlagsBits = v65;
  v94.value._object = (void *)0xEC00000073746E65;
  ParameterDeclaration.init(_:secondName:_:optional:)(v96, v93, v94, v303, v95);
  uint64_t v97 = OUTLINED_FUNCTION_1_4();
  v105._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_46_1(v97, v98, v99, v100, v101, v102, v103, v104, v185, v200, _h, (uint64_t)v231, v247, v260, v273);
  TypeRef.init(_:arguments:)(v105, v4);
  OUTLINED_FUNCTION_13_4();
  v304.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v304.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_60_1(v304, v106, (GameServicesProtocols::ParameterDeclaration *)(v84 + 96));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v274;
  uint64_t v107 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_49_1(v107, v108, v109, v110, v111, v112, v113, v114, v186, v201, _i, (uint64_t)v232, v248, v261, v115);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_81_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_35_2(v116, v117, v118, v119, v120, v121, v122, v123, v187, v202, _j, v233, v249, v262, *(double *)&v274, *((double *)&v274 + 1), *(double *)&v283, *(double *)&v284, *(double *)&v285,
    *(double *)&v286,
    *(double *)&v287);
  v124._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_71_2(0x7473696Cu);
  MethodDeclaration.init(_:_:_:)(v125, v124, (Swift::OpaquePointer)v84, v293);
  uint64_t v126 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v126 + 16) = *(_OWORD *)v250;
  uint64_t v127 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_8(v127, v128, v129, v130, v131, v132, v133, v134, v188, v203, _k, (uint64_t)v234, v250[0], v250[1], v275);
  OUTLINED_FUNCTION_7_6();
  v305.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v305.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_6_6(v65, v305, v135, (GameServicesProtocols::ParameterDeclaration *)(v126 + 32));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v276;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7_6();
  v306.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v306.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_17_1(0x6E69676E6F6C6562, v306, v136, (GameServicesProtocols::ParameterDeclaration *)(v126 + 96));
  OUTLINED_FUNCTION_10_6();
  v137._unint64_t countAndFlagsBits = (unsigned __int16)OUTLINED_FUNCTION_47_2() | 0x6F72507465730000;
  v137._object = (void *)0xED00007373657267;
  MethodDeclaration.init(_:_:_:)(v138, v137, (Swift::OpaquePointer)v126, v294);
  uint64_t v139 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v139 + 16) = *(_OWORD *)v251;
  uint64_t v140 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_8(v140, v141, v142, v143, v144, v145, v146, v147, v189, v204, _l, (uint64_t)v235, v251[0], v251[1], v276);
  OUTLINED_FUNCTION_7_6();
  v307.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v307.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_6_6(v65, v307, v148, (GameServicesProtocols::ParameterDeclaration *)(v139 + 32));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v277;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7_6();
  v308.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v308.name._unint64_t countAndFlagsBits = (uint64_t)&v283;
  OUTLINED_FUNCTION_17_1(0x6E69676E6F6C6562, v308, v149, (GameServicesProtocols::ParameterDeclaration *)(v139 + 96));
  OUTLINED_FUNCTION_10_6();
  v150._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_47_2() & 0xFFFF00000000FFFFLL | 0x6C6165760000;
  v150._object = (void *)0xE600000000000000;
  MethodDeclaration.init(_:_:_:)(v151, v150, (Swift::OpaquePointer)v139, v295);
  *(_OWORD *)(OUTLINED_FUNCTION_27_2() + 16) = v277;
  uint64_t v152 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v152, (__n128)v277);
  v153._unint64_t countAndFlagsBits = 0xD000000000000013;
  v153._object = _m;
  TypeRef.init(_:arguments:)(v153, v4);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_51_2();
  OUTLINED_FUNCTION_6_6(0x73736572676F7270, v309, v154, v155);
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_55_2(v156, v157, v158, v159, v160, v161, v162, v163, v190, v205, *(double *)&_m, v236, v252, v263, *(double *)&v277, *((double *)&v277 + 1), *(double *)&v283, *(double *)&v284, *(double *)&v285,
    *(double *)&v286,
    *(double *)&v287);
  OUTLINED_FUNCTION_65_1(v296, v164);
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_35_2(v165, v166, v167, v168, v169, v170, v171, v172, v191, v206, _n, v237, v253, v264, v278, v282, *(double *)&v283, *(double *)&v284, *(double *)&v285,
    *(double *)&v286,
    *(double *)&v287);
  v173._unint64_t countAndFlagsBits = 0x6361437261656C63;
  v173._object = (void *)0xEA00000000006568;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v1 + 368), v173, v4, v297);
  OUTLINED_FUNCTION_52_2();
  ProtocolDeclaration.init(_:methods:)(v238, *(Swift::String *)&v174, (Swift::OpaquePointer)v1);
}

void static ActivityServiceProtocol.declaration.getter(GameServicesProtocols::ProtocolDeclaration *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F990910;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  Swift::String v5 = (__n128 *)OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_78_2(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v14._rawValue = (void *)MEMORY[0x263F8EE78];
  v15._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_58_2();
  TypeRef.init(_:arguments:)(v15, v14);
  v34.name._object = (void *)(OUTLINED_FUNCTION_83_1() & 1);
  v34.name._unint64_t countAndFlagsBits = (uint64_t)v30;
  OUTLINED_FUNCTION_5_6(v34, v16, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  Swift::String v17 = (__n128 *)OUTLINED_FUNCTION_3_6();
  v18._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_64_1(v17, (__n128)xmmword_24F990910) & 0xFFFFFFFFFFFFLL | 0x6341000000000000;
  v18._object = (void *)0xEE00797469766974;
  TypeRef.init(_:arguments:)(v18, v14);
  unint64_t v19 = OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_82_1(v19, v20, v21, v22, v23, v24, v25, v26, 1, 2, v30[0], v30[1], v30[2], v30[3], v31);
  OUTLINED_FUNCTION_52_2();
  v33.name._unint64_t countAndFlagsBits = (uint64_t)v30;
  v27._unint64_t countAndFlagsBits = 0xD000000000000014;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v4 + 32), v27, v1, v33);
  uint64_t v28 = 0x7974697669746341;
  unint64_t v29 = 0xEF65636976726553;
  ProtocolDeclaration.init(_:methods:)(a1, *(Swift::String *)&v28, (Swift::OpaquePointer)v4);
}

void static ChallengeServiceProtocol.declaration.getter(double a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24F994870;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  unint64_t v3 = (__n128 *)OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_75_1(v3, (__n128)xmmword_24F990910);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v4 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v4, (__n128)xmmword_24F990910);
  v5._rawValue = (void *)MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_42_3();
  OUTLINED_FUNCTION_7_6();
  v118.name._object = (void *)(OUTLINED_FUNCTION_9_5() & 1);
  v118.name._unint64_t countAndFlagsBits = (uint64_t)&v108;
  OUTLINED_FUNCTION_6_6(0x676E656C6C616863, v118, v6, v1);
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = xmmword_24F990910;
  v7._unint64_t countAndFlagsBits = 0xD000000000000014;
  v7._object = (void *)0x800000024F998D00;
  TypeRef.init(_:arguments:)(v7, v5);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_26_1(v8, v9, v10, v11, v12, v13, v14, v15, COERCE_DOUBLE(5), COERCE_DOUBLE(10), v84, v87, v90, *(double *)&v94, 1.69288076e190, a1, COERCE_DOUBLE(1), COERCE_DOUBLE(2), v108,
    *(double *)&v109,
    *((double *)&v109 + 1),
    v110,
    *(double *)&v111);
  v16._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_38_3();
  MethodDeclaration.init(_:_:_:)(v17, v16, (Swift::OpaquePointer)v3, v113);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v79;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_6_6(0x726F7461657263, v119, v19, v20);
  OUTLINED_FUNCTION_15_5();
  OUTLINED_FUNCTION_9_5();
  uint64_t v21 = OUTLINED_FUNCTION_66_3();
  OUTLINED_FUNCTION_6_6(v21, v120, v22, v23);
  v24._unint64_t countAndFlagsBits = 0x6E6F697461727544;
  v24._object = (void *)0xE800000000000000;
  TypeRef.init(_:arguments:)(v24, v5);
  OUTLINED_FUNCTION_9_5();
  uint64_t v25 = OUTLINED_FUNCTION_66_3();
  OUTLINED_FUNCTION_6_6(v25, v121, v26, v27);
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v105;
  OUTLINED_FUNCTION_77_2();
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_6_6(0x4C74706D65747461, v122, v28, v29);
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v105;
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v105;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_13_4();
  v123.name._object = (void *)(OUTLINED_FUNCTION_9_5() & 1);
  v123.name._unint64_t countAndFlagsBits = (uint64_t)&v108;
  OUTLINED_FUNCTION_6_6(0x73726579616C70, v123, v30, (GameServicesProtocols::ParameterDeclaration *)(v18 + 288));
  v31._unint64_t countAndFlagsBits = 0xD000000000000014;
  v31._object = (void *)0x800000024F998D00;
  TypeRef.init(_:arguments:)(v31, v5);
  OUTLINED_FUNCTION_26_1(v32, v33, v34, v35, v36, v37, v38, v39, *(double *)&v79, *((double *)&v79 + 1), COERCE_DOUBLE(v2 + 80), v88, v91, v95, v98, v102, *(double *)&v105, *((double *)&v105 + 1), v108,
    *(double *)&v109,
    *((double *)&v109 + 1),
    v110,
    *(double *)&v111);
  v40._unint64_t countAndFlagsBits = 0x6843657461657263;
  v40._object = (void *)0xEF65676E656C6C61;
  MethodDeclaration.init(_:_:_:)(v85, v40, (Swift::OpaquePointer)v18, v114);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_24F990920;
  OUTLINED_FUNCTION_0_3();
  v124.name._object = (void *)(OUTLINED_FUNCTION_9_5() & 1);
  v124.name._unint64_t countAndFlagsBits = (uint64_t)&v108;
  OUTLINED_FUNCTION_5_6(v124, v42, (GameServicesProtocols::ParameterDeclaration *)(v41 + 32));
  int v43 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_44_2(v43, v106);
  v44._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_61_1();
  TypeRef.init(_:arguments:)(v44, (Swift::OpaquePointer)v43);
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_6_6(1701667175, v125, v45, v46);
  v47._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_68_2();
  TypeRef.init(_:arguments:)(v47, v5);
  double v108 = v110;
  long long v109 = v111;
  v48._object = (void *)0xEA00000000007972;
  v115.name._unint64_t countAndFlagsBits = (uint64_t)&v108;
  v48._unint64_t countAndFlagsBits = 0x616D6D7553746567;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v2 + 128), v48, (Swift::OpaquePointer)v41, v115);
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_24F990920;
  OUTLINED_FUNCTION_42_3();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_6_6(v99, v126, v50, v51);
  *(__n128 *)(OUTLINED_FUNCTION_1_4() + 16) = v106;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_37_2();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_17_1(7499622, v127, v52, v53);
  v54._unint64_t countAndFlagsBits = 0xD000000000000011;
  v54._object = (void *)0x800000024F998D40;
  TypeRef.init(_:arguments:)(v54, v5);
  OUTLINED_FUNCTION_26_1(v55, v56, v57, v58, v59, v60, v61, v62, v80, v82, COERCE_DOUBLE(2), COERCE_DOUBLE(4), v92, v96, *(double *)&v99, v103, v106.n128_f64[0], v106.n128_f64[1], v108,
    *(double *)&v109,
    *((double *)&v109 + 1),
    v110,
    *(double *)&v111);
  v63._unint64_t countAndFlagsBits = 0x6E49657461657263;
  v63._object = (void *)0xEC00000065746976;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v2 + 176), v63, (Swift::OpaquePointer)v49, v116);
  uint64_t v64 = OUTLINED_FUNCTION_27_2();
  *(_OWORD *)(v64 + 16) = v107;
  v65._unint64_t countAndFlagsBits = 0x6552657469766E49;
  v65._object = (void *)0xE900000000000066;
  TypeRef.init(_:arguments:)(v65, v5);
  v128.name._object = (void *)(OUTLINED_FUNCTION_9_5() & 1);
  v128.name._unint64_t countAndFlagsBits = (uint64_t)&v108;
  OUTLINED_FUNCTION_6_6(0x657469766E69, v128, v66, (GameServicesProtocols::ParameterDeclaration *)(v64 + 32));
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_26_1(v67, v68, v69, v70, v71, v72, v73, v74, v81, v83, v86, v89, v93, v97, v100, v104, *(double *)&v107, *((double *)&v107 + 1), v108,
    *(double *)&v109,
    *((double *)&v109 + 1),
    v110,
    *(double *)&v111);
  v75._unint64_t countAndFlagsBits = 0x747065636361;
  v75._object = (void *)0xE600000000000000;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v2 + 224), v75, (Swift::OpaquePointer)v64, v117);
  OUTLINED_FUNCTION_52_2();
  unint64_t v76 = OUTLINED_FUNCTION_68_2();
  ProtocolDeclaration.init(_:methods:)(v78, *(Swift::String *)&v76, (Swift::OpaquePointer)v2);
}

void static FriendServiceProtocol.declaration.getter(GameServicesProtocols::ProtocolDeclaration *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24F994850;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  uint64_t v3 = OUTLINED_FUNCTION_27_2();
  *(_OWORD *)(v3 + 16) = xmmword_24F990910;
  v4._rawValue = (void *)MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_0_3();
  v92.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v92.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v92, v5, (GameServicesProtocols::ParameterDeclaration *)(v3 + 32));
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  *(_OWORD *)(OUTLINED_FUNCTION_3_6() + 16) = xmmword_24F990910;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_36_1();
  unsigned int v6 = OUTLINED_FUNCTION_45_1();
  v7._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_71_2(v6);
  MethodDeclaration.init(_:_:_:)(v8, v7, (Swift::OpaquePointer)v3, v85);
  uint64_t v9 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v9 + 16) = xmmword_24F990920;
  OUTLINED_FUNCTION_0_3();
  v93.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v93.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v93, v10, (GameServicesProtocols::ParameterDeclaration *)(v9 + 32));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = xmmword_24F990910;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_14_4();
  v94.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v94.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_6_6(0x73726579616C70, v94, v11, (GameServicesProtocols::ParameterDeclaration *)(v9 + 96));
  unint64_t v12 = OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_25_1(v12, v13, v14, v86, v15, v16, 2, 4, 1, 2, v80, v81, v82, v83);
  uint64_t v17 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v72;
  OUTLINED_FUNCTION_0_3();
  v95.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v95.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v95, v18, (GameServicesProtocols::ParameterDeclaration *)(v17 + 32));
  Swift::Bool v19 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v19, v76);
  v20._unint64_t countAndFlagsBits = 0x52746361746E6F43;
  v20._object = (void *)0xEA00000000006665;
  TypeRef.init(_:arguments:)(v20, v4);
  OUTLINED_FUNCTION_14_4();
  v96.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v96.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_6_6(0x73746361746E6F63, v96, v21, (GameServicesProtocols::ParameterDeclaration *)(v17 + 96));
  unint64_t v22 = OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_25_1(v22, v23, v24, v87, v25, v26, v72[0], v72[1], v76.n128_i64[0], v76.n128_i64[1], v80, v81, v82, v83);
  uint64_t v27 = OUTLINED_FUNCTION_27_2();
  *(__n128 *)(v27 + 16) = v77;
  OUTLINED_FUNCTION_0_3();
  v97.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v97.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v97, v28, (GameServicesProtocols::ParameterDeclaration *)(v27 + 32));
  unint64_t v29 = (__n128 *)OUTLINED_FUNCTION_1_4();
  v30._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_64_1(v29, v77) & 0xFFFFFFFFFFFFLL | 0x6552000000000000;
  v30._object = (void *)0xED00007473657571;
  TypeRef.init(_:arguments:)(v30, v4);
  OUTLINED_FUNCTION_81_1();
  v31._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_45_1() | 0x7571655200000000;
  v31._object = (void *)0xEC00000073747365;
  MethodDeclaration.init(_:_:_:)(v32, v31, (Swift::OpaquePointer)v27, v88);
  uint64_t v33 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v33 + 16) = *(_OWORD *)v73;
  OUTLINED_FUNCTION_0_3();
  v98.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v98.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v98, v34, (GameServicesProtocols::ParameterDeclaration *)(v33 + 32));
  *(__n128 *)(OUTLINED_FUNCTION_1_4() + 16) = v77;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_14_4();
  v99.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v99.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_17_1(1836020326, v99, v35, (GameServicesProtocols::ParameterDeclaration *)(v33 + 96));
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_29_4(v36, v37, v38, v39, v40, v41, v42, v43, *(double *)v73, *(double *)&v73[1], v77.n128_f64[0], v77.n128_f64[1], *(double *)&v80, *(double *)&v81, *((double *)&v81 + 1), *(double *)&v82, *(double *)&v83);
  OUTLINED_FUNCTION_57_1(0x747065636361, v89, v44);
  uint64_t v45 = OUTLINED_FUNCTION_21_3();
  *(_OWORD *)(v45 + 16) = *(_OWORD *)v74;
  OUTLINED_FUNCTION_0_3();
  v100.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v100.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v100, v46, (GameServicesProtocols::ParameterDeclaration *)(v45 + 32));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = *(_OWORD *)v78;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_14_4();
  v101.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v101.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_17_1(1836020326, v101, v47, (GameServicesProtocols::ParameterDeclaration *)(v45 + 96));
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_29_4(v48, v49, v50, v51, v52, v53, v54, v55, *(double *)v74, *(double *)&v74[1], *(double *)v78, *(double *)&v78[1], *(double *)&v80, *(double *)&v81, *((double *)&v81 + 1), *(double *)&v82, *(double *)&v83);
  OUTLINED_FUNCTION_57_1(0x65726F6E6769, v90, v56);
  uint64_t v57 = OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_75_1((__n128 *)v57, v75);
  OUTLINED_FUNCTION_0_3();
  v102.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v102.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_5_6(v102, v58, (GameServicesProtocols::ParameterDeclaration *)v45);
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = *(_OWORD *)v79;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_23_2();
  v103.name._object = (void *)(OUTLINED_FUNCTION_8_6() & 1);
  v103.name._unint64_t countAndFlagsBits = (uint64_t)&v80;
  OUTLINED_FUNCTION_17_1(28532, v103, v59, (GameServicesProtocols::ParameterDeclaration *)(v57 + 96));
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_29_4(v60, v61, v62, v63, v64, v65, v66, v67, v75.n128_f64[0], v75.n128_f64[1], *(double *)v79, *(double *)&v79[1], *(double *)&v80, *(double *)&v81, *((double *)&v81 + 1), *(double *)&v82, *(double *)&v83);
  v68._unint64_t countAndFlagsBits = 0x65526C65636E6163;
  v68._object = (void *)0xEE00737473657571;
  MethodDeclaration.init(_:_:_:)(v69, v68, (Swift::OpaquePointer)v57, v91);
  uint64_t v70 = 0x6553646E65697246;
  unint64_t v71 = 0xED00006563697672;
  ProtocolDeclaration.init(_:methods:)(a1, *(Swift::String *)&v70, (Swift::OpaquePointer)v2);
}

void static GameLibraryServiceProtocol.declaration.getter(uint64_t x8_0@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24F994880;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  uint64_t v2 = OUTLINED_FUNCTION_27_2();
  *(_OWORD *)(v2 + 16) = xmmword_24F990910;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v3 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v3, (__n128)xmmword_24F990910);
  v4._rawValue = (void *)MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_76_2(0x656D6147u);
  OUTLINED_FUNCTION_14_4();
  v408.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v408.name._unint64_t countAndFlagsBits = (uint64_t)&v397;
  OUTLINED_FUNCTION_6_6(0x73656D6167, v408, v5, (GameServicesProtocols::ParameterDeclaration *)(v2 + 32));
  unsigned int v6 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_49_1(v6, v7, v8, v9, v10, v11, v12, v13, v207, (uint64_t)v233, v259, v284, v308, x8_0, v14);
  v15._unint64_t countAndFlagsBits = 0x63736544656D6147;
  v15._object = (void *)0xEF6E6F6974706972;
  TypeRef.init(_:arguments:)(v15, v4);
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_55_2(v16, v17, v18, v19, v20, v21, v22, v23, v208, v234, v260, v285, v309, v335, COERCE_DOUBLE(1), COERCE_DOUBLE(2), *(double *)&v397, *(double *)&v398, *(double *)&v399,
    *(double *)&v400,
    *(double *)&v401);
  v24._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_38_3();
  MethodDeclaration.init(_:_:_:)(v25, v24, (Swift::OpaquePointer)v2, v405);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_24F994870;
  *(_OWORD *)(OUTLINED_FUNCTION_3_6() + 16) = v361;
  uint64_t v27 = OUTLINED_FUNCTION_3_6();
  unsigned int v35 = OUTLINED_FUNCTION_28_3(v27, v28, v29, v30, v31, v32, v33, v34, v209, (uint64_t)v235, 5, 10, v310, (uint64_t)v336, v361);
  OUTLINED_FUNCTION_62_1(v35);
  int v36 = OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_19_2(v36, v37, v38, v39, v40, v41, v42, v43, v210, (uint64_t)v236, v261, v286, v311, (uint64_t)v337, v362, v383, v397, v398, v399,
    v400);
  v409.name._object = (void *)(OUTLINED_FUNCTION_2_7() & 1);
  v409.name._unint64_t countAndFlagsBits = (uint64_t)&v397;
  OUTLINED_FUNCTION_48_2(v409, v44, (GameServicesProtocols::ParameterDeclaration *)(v26 + 32));
  uint64_t v45 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v45, v363);
  int v46 = OUTLINED_FUNCTION_73_2();
  OUTLINED_FUNCTION_19_2(v46, v47, v48, v49, v50, v51, v52, v53, v211, (uint64_t)v237, v262, v287, v312, (uint64_t)v338, v363.n128_i64[0], v363.n128_i64[1], v397, v398, v399,
    v400);
  char v54 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_24_2(v54, v55, v56, v57, v410, v58, v212, (uint64_t)v238, v263, v288, v313, (uint64_t)v339, v364, v384, v397);
  *(_OWORD *)(OUTLINED_FUNCTION_3_6() + 16) = *(_OWORD *)v365;
  int v59 = OUTLINED_FUNCTION_80_1();
  OUTLINED_FUNCTION_19_2(v59, v60, v61, v62, v63, v64, v65, v66, v213, (uint64_t)v239, v264, v289, v314, (uint64_t)v340, v365[0], v365[1], v397, v398, v399,
    v400);
  char v67 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_34_1(v67, v68, v69, v70, v411, v71, v214, (uint64_t)v240, v265, v290, v315, (uint64_t)v341, v366, v385, v397);
  double v72 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v72, v367);
  v73._unint64_t countAndFlagsBits = 0x726F73727543;
  v73._object = (void *)0xE600000000000000;
  GameServicesProtocols::TypeRef v403 = TypeRef.init(_:arguments:)(v73, v4);
  OUTLINED_FUNCTION_19_2(v403.name._countAndFlagsBits, (int)v403.name._object, (int)v403.arguments._rawValue, v74, v75, v76, v77, v78, v215, (uint64_t)v241, v266, v291, v316, (uint64_t)v342, v367.n128_i64[0], v367.n128_i64[1], v397, v398, v399,
    v400);
  char v79 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_41_2(v79, v80, v81, v82, v412, v83, v216, (uint64_t)v242, v267, v292, v317, (uint64_t)v343, v368, v386, v397);
  OUTLINED_FUNCTION_43_0(v84, v85, v86, v87, v88, v89, v90, v91, v217, (uint64_t)v243, v268, v293, v318, (uint64_t)v344, v369, v387, v397, v398, v399,
    v400);
  char v92 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_12_6(v92, v93, v94, v95, v413, v96, v218, (uint64_t)v244, v269, v294, v319, (uint64_t)v345, v370, v388, v397);
  uint64_t v97 = OUTLINED_FUNCTION_3_6();
  v105._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_28_3(v97, v98, v99, v100, v101, v102, v103, v104, v219, (uint64_t)v245, v270, v295, v320, (uint64_t)v346, v371) | 0x7473694800000000;
  v105._object = (void *)0xEB0000000079726FLL;
  GameServicesProtocols::TypeRef v404 = TypeRef.init(_:arguments:)(v105, v4);
  unint64_t v111 = OUTLINED_FUNCTION_63_1(v404.name._countAndFlagsBits, (int)v404.name._object, (int)v404.arguments._rawValue, v106, v107, v108, v109, v110, v220, (uint64_t)v246, v271, v296, v321, (uint64_t)v347, v372, v389, v397, v398, v399,
           v400);
  OUTLINED_FUNCTION_32_1(v111, v112, v113, v114, v115, v116, v117, v118, v221, (uint64_t)v247, v272, v297, v322, (uint64_t)v348, v373, v390, v397, v398, v399,
    v400,
    v401);
  v119._unint64_t countAndFlagsBits = 0xD000000000000011;
  v119._object = (void *)0x800000024F998D80;
  v406.name._unint64_t countAndFlagsBits = (uint64_t)&v397;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v1 + 80), v119, (Swift::OpaquePointer)v26, v406);
  uint64_t v120 = swift_allocObject();
  *(_OWORD *)(v120 + 16) = *(_OWORD *)v273;
  *(__n128 *)(OUTLINED_FUNCTION_3_6() + 16) = v374;
  GameServicesProtocols::TypeRef v121 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_33_1(v121, v122, v123, v124, v125, v126, v127, v128, v222, v1 + 128, v273[0], v273[1], v323, (uint64_t)v349, v129);
  OUTLINED_FUNCTION_62_1(0x656D6147u);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_53_2();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_51_2();
  OUTLINED_FUNCTION_48_2(v414, v130, v131);
  int v132 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v132, v374);
  OUTLINED_FUNCTION_73_2();
  OUTLINED_FUNCTION_13_4();
  char v133 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_24_2(v133, v134, v135, v136, v415, v137, v223, (uint64_t)v248, v274, v298, v324, (uint64_t)v350, v374.n128_i64[0], v374.n128_i64[1], v397);
  uint64_t v138 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_33_1(v138, v139, v140, v141, v142, v143, v144, v145, v224, (uint64_t)v249, v275, v299, v325, (uint64_t)v351, v146);
  OUTLINED_FUNCTION_80_1();
  OUTLINED_FUNCTION_13_4();
  char v147 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_34_1(v147, v148, v149, v150, v416, v151, v225, (uint64_t)v250, v276, v300, v326, (uint64_t)v352, v375, v391, v397);
  uint64_t v152 = OUTLINED_FUNCTION_3_6();
  v160._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_46_1(v152, v153, v154, v155, v156, v157, v158, v159, v226, (uint64_t)v251, v277, v301, v327, (uint64_t)v353, v376);
  TypeRef.init(_:arguments:)(v160, v4);
  OUTLINED_FUNCTION_13_4();
  char v161 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_41_2(v161, v162, v163, v164, v417, v165, v227, (uint64_t)v252, v278, v302, v328, (uint64_t)v354, v377, v392, v397);
  OUTLINED_FUNCTION_43_0(v166, v167, v168, v169, v170, v171, v172, v173, v228, (uint64_t)v253, v279, v303, v329, (uint64_t)v355, v378, v393, v397, v398, v399,
    v400);
  char v174 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_12_6(v174, v175, v176, v177, v418, v178, v229, (uint64_t)v254, v280, v304, v330, (uint64_t)v356, v379, v394, v397);
  uint64_t v179 = OUTLINED_FUNCTION_3_6();
  unsigned int v187 = OUTLINED_FUNCTION_28_3(v179, v180, v181, v182, v183, v184, v185, v186, v230, (uint64_t)v255, v281, v305, v331, (uint64_t)v357, v380);
  int v188 = OUTLINED_FUNCTION_76_2(v187);
  unint64_t v196 = OUTLINED_FUNCTION_63_1(v188, v189, v190, v191, v192, v193, v194, v195, v231, (uint64_t)v256, v282, v306, v332, (uint64_t)v358, v381, v395, v397, v398, v399,
           v400);
  OUTLINED_FUNCTION_32_1(v196, v197, v198, v199, v200, v201, v202, v203, v232, (uint64_t)v257, v283, v307, v333, (uint64_t)v359, v382, v396, v397, v398, v399,
    v400,
    v401);
  v204._object = (void *)0xE900000000000073;
  v407.name._unint64_t countAndFlagsBits = (uint64_t)&v397;
  v204._unint64_t countAndFlagsBits = 0x656D61477473696CLL;
  MethodDeclaration.init(_:_:_:)(v258, v204, (Swift::OpaquePointer)v120, v407);
  OUTLINED_FUNCTION_52_2();
  unint64_t v206 = 0xD000000000000012;
  ProtocolDeclaration.init(_:methods:)(v360, *(Swift::String *)&v206, (Swift::OpaquePointer)v1);
}

void static LeaderboardServiceProtocol.declaration.getter(uint64_t x8_0@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  int v170 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_20_2(v170, (__n128)xmmword_24F994870);
  uint64_t v184 = v1;
  uint64_t v205 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24F994890;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v3 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v3, (__n128)xmmword_24F990910);
  v4._rawValue = (void *)MEMORY[0x263F8EE78];
  OUTLINED_FUNCTION_15_5();
  v5._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_16_3();
  TypeRef.init(_:arguments:)(v5, (Swift::OpaquePointer)v3);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_70_1();
  OUTLINED_FUNCTION_6_6(0x6F6272656461656CLL, v225, v6, v7);
  uint64_t v8 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_30_2(v8, v9, v10, v11, v12, v13, v14, v15, v134, v141, (uint64_t)v147, _, 4, 8, (uint64_t)v170, v177, (uint64_t)v184, x8_0, v198,
    v205,
    v16);
  OUTLINED_FUNCTION_77_2();
  v17._unint64_t countAndFlagsBits = 0x65676E6152;
  v17._object = (void *)0xE500000000000000;
  TypeRef.init(_:arguments:)(v17, (Swift::OpaquePointer)v8);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_70_1();
  OUTLINED_FUNCTION_6_6(v20, v226, v18, v19);
  v21._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_72_2();
  TypeRef.init(_:arguments:)(v21, v4);
  v227.name._object = (void *)(OUTLINED_FUNCTION_11_6() & 1);
  v227.name._unint64_t countAndFlagsBits = (uint64_t)&v215;
  OUTLINED_FUNCTION_6_6(0x656C61636F6CLL, v227, v22, (GameServicesProtocols::ParameterDeclaration *)(v2 + 160));
  double v23 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_30_2(v23, v24, v25, v26, v27, v28, v29, v30, v135, 0x656C61636F6CLL, (uint64_t)v148, _a, __8, v165, v171, v178, (uint64_t)v185, (uint64_t)v191, v199,
    v206,
    v31);
  v32._unint64_t countAndFlagsBits = 0xD000000000000014;
  v32._object = (void *)0x800000024F998E00;
  v33._rawValue = v4._rawValue;
  TypeRef.init(_:arguments:)(v32, v4);
  OUTLINED_FUNCTION_54_2();
  v228.name._object = (void *)(OUTLINED_FUNCTION_11_6() & 1);
  v228.name._unint64_t countAndFlagsBits = (uint64_t)&v215;
  OUTLINED_FUNCTION_6_6(0x706F6353656D6974, v228, v34, (GameServicesProtocols::ParameterDeclaration *)(v2 + 224));
  uint64_t v35 = OUTLINED_FUNCTION_1_4();
  *(_OWORD *)(v35 + 16) = xmmword_24F990910;
  int v36 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v36, (__n128)xmmword_24F990910);
  v37._unint64_t countAndFlagsBits = 0xD000000000000010;
  v37._object = (void *)0x800000024F998E20;
  TypeRef.init(_:arguments:)(v37, v4);
  v38._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_50_2();
  TypeRef.init(_:arguments:)(v38, (Swift::OpaquePointer)v36);
  v39._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_16_3();
  TypeRef.init(_:arguments:)(v39, (Swift::OpaquePointer)v35);
  OUTLINED_FUNCTION_59_1();
  v41._unint64_t countAndFlagsBits = v40 | 6;
  uint64_t v200 = v40 | 6;
  v220.name._unint64_t countAndFlagsBits = (uint64_t)&v215;
  v41._object = (void *)0x800000024F998DE0;
  MethodDeclaration.init(_:_:_:)(v186, v41, (Swift::OpaquePointer)v2, v220);
  int v42 = (void *)v172;
  uint64_t v43 = swift_allocObject();
  *(Swift::String *)(v43 + 16) = __8a;
  v44._rawValue = (void *)OUTLINED_FUNCTION_1_4();
  v52._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_18_2((uint64_t)v44._rawValue, v45, v46, v47, v48, v49, v50, v51, v136, v142, v172 + 80, 0xD000000000000014, __8a._countAndFlagsBits, (uint64_t)__8a._object, v172, 0x800000024F998E20, (uint64_t)v186, (uint64_t)v192, v200,
                             v207,
                             xmmword_24F990910);
  TypeRef.init(_:arguments:)(v52, v33);
  v53._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_16_3();
  TypeRef.init(_:arguments:)(v53, v44);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_6_6(0x6F6272656461656CLL, v229, v54, v55);
  uint64_t v56 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v56, v212);
  v57._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_79_2();
  TypeRef.init(_:arguments:)(v57, v33);
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_6_6(0x73726579616C70, v230, v58, v59);
  v60._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_72_2();
  v61._rawValue = v33._rawValue;
  TypeRef.init(_:arguments:)(v60, v33);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_6_6(v143, v231, v62, v63);
  int v64 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_20_2(v64, v212);
  v65._unint64_t countAndFlagsBits = _b;
  v65._object = (void *)0x800000024F998E00;
  TypeRef.init(_:arguments:)(v65, v33);
  v66._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_61_1();
  TypeRef.init(_:arguments:)(v66, (Swift::OpaquePointer)v64);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_70_1();
  OUTLINED_FUNCTION_6_6(0x706F6353656D6974, v232, v67, v68);
  uint64_t v69 = (__n128 *)OUTLINED_FUNCTION_1_4();
  v69[1] = v212;
  v70._rawValue = (void *)OUTLINED_FUNCTION_1_4();
  v78._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_67_2((uint64_t)v70._rawValue, v71, v72, v73, v74, v75, v76, v77, v137, v143, (uint64_t)v149, _b, __8b, v166, v173, v179, 0xE900000000000066, (uint64_t)v193, v201,
                             v208,
                             *(_OWORD *)&v212);
  v78._object = (void *)0x800000024F998E20;
  TypeRef.init(_:arguments:)(v78, v61);
  v79._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_50_2();
  TypeRef.init(_:arguments:)(v79, v70);
  v80._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_16_3();
  TypeRef.init(_:arguments:)(v80, (Swift::OpaquePointer)v69);
  OUTLINED_FUNCTION_69_2();
  v81._unint64_t countAndFlagsBits = v202;
  v81._object = (void *)0x800000024F998DE0;
  MethodDeclaration.init(_:_:_:)(v150, v81, (Swift::OpaquePointer)v43, v221);
  v82._rawValue = v42;
  uint64_t v83 = OUTLINED_FUNCTION_27_2();
  *(_OWORD *)(v83 + 16) = v213;
  int v84 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_30_2(v84, v85, v86, v87, v88, v89, v90, v91, v138, v144, (uint64_t)v150, _c, __8c, v167, v174, v180, (uint64_t)v187, (uint64_t)v194, v202,
    v209,
    v92);
  v93._unint64_t countAndFlagsBits = 0x68746957656D6147;
  v93._object = (void *)0xEE00726579616C50;
  v94._rawValue = v61._rawValue;
  TypeRef.init(_:arguments:)(v93, v61);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_39_2();
  unint64_t v95 = OUTLINED_FUNCTION_68_2();
  OUTLINED_FUNCTION_6_6(v95, v233, v96, v97);
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v213;
  v98._rawValue = (void *)OUTLINED_FUNCTION_1_4();
  v106._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_18_2((uint64_t)v98._rawValue, v99, v100, v101, v102, v103, v104, v105, v139, v145, (uint64_t)v151, _d, __8d, v168, v175, v181, (uint64_t)v188, (uint64_t)v195, v203,
                              v210,
                              v213);
  TypeRef.init(_:arguments:)(v106, v61);
  v107._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_50_2();
  TypeRef.init(_:arguments:)(v107, v98);
  OUTLINED_FUNCTION_31_1();
  uint64_t v215 = v217;
  long long v216 = v218;
  OUTLINED_FUNCTION_74_2();
  v108._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_68_2();
  MethodDeclaration.init(_:_:_:)(v109, v108, (Swift::OpaquePointer)v83, v222);
  uint64_t v110 = OUTLINED_FUNCTION_27_2();
  *(_OWORD *)(v110 + 16) = v214;
  unint64_t v111 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_75_1(v111, (__n128)v214);
  uint64_t v112 = swift_allocObject();
  *(_OWORD *)(v112 + 16) = xmmword_24F990920;
  OUTLINED_FUNCTION_15_5();
  v113._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_79_2();
  v113._object = v189;
  TypeRef.init(_:arguments:)(v113, v94);
  v114._unint64_t countAndFlagsBits = 0x656C707554;
  v114._object = (void *)0xE500000000000000;
  TypeRef.init(_:arguments:)(v114, (Swift::OpaquePointer)v112);
  OUTLINED_FUNCTION_31_1();
  v234.name._object = (void *)(OUTLINED_FUNCTION_11_6() & 1);
  v234.name._unint64_t countAndFlagsBits = (uint64_t)&v215;
  OUTLINED_FUNCTION_6_6(v204, v234, v115, (GameServicesProtocols::ParameterDeclaration *)(v110 + 32));
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v214;
  *(_OWORD *)(OUTLINED_FUNCTION_1_4() + 16) = v214;
  OUTLINED_FUNCTION_15_5();
  OUTLINED_FUNCTION_53_2();
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_59_1();
  uint64_t v117 = v116 | 2;
  OUTLINED_FUNCTION_74_2();
  v118._unint64_t countAndFlagsBits = v117;
  MethodDeclaration.init(_:_:_:)(v119, v118, (Swift::OpaquePointer)v110, v223);
  *(_OWORD *)(OUTLINED_FUNCTION_27_2() + 16) = v214;
  v120._rawValue = (void *)OUTLINED_FUNCTION_1_4();
  v128._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_67_2((uint64_t)v120._rawValue, v121, v122, v123, v124, v125, v126, v127, v140, v146, (uint64_t)v152, _e, __8e, v169, v176, v182, (uint64_t)v189, (uint64_t)v196, v204,
                              v211,
                              v214);
  v128._object = v183;
  TypeRef.init(_:arguments:)(v128, v94);
  v129._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_16_3();
  TypeRef.init(_:arguments:)(v129, v120);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_6_6(0x73656972746E65, v235, v130, v131);
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_69_2();
  OUTLINED_FUNCTION_65_1(v224, (GameServicesProtocols::MethodDeclaration *)((char *)v82._rawValue + 224));
  OUTLINED_FUNCTION_52_2();
  uint64_t v133 = v117;
  ProtocolDeclaration.init(_:methods:)(v197, *(Swift::String *)&v133, v82);
}

void static ProfileServiceProtocol.declaration.getter(GameServicesProtocols::ProtocolDeclaration *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35A98);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24F990910;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AA0);
  Swift::String v5 = (__n128 *)OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_78_2(v5, v6, v7, v8, v9, v10, v11, v12, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35378);
  uint64_t v14 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v14, (__n128)xmmword_24F990910);
  v15._rawValue = (void *)MEMORY[0x263F8EE78];
  v16._unint64_t countAndFlagsBits = OUTLINED_FUNCTION_58_2();
  TypeRef.init(_:arguments:)(v16, v15);
  v17._unint64_t countAndFlagsBits = 0x7961727241;
  v17._object = (void *)0xE500000000000000;
  TypeRef.init(_:arguments:)(v17, (Swift::OpaquePointer)v14);
  v36.name._object = (void *)(OUTLINED_FUNCTION_83_1() & 1);
  v36.name._unint64_t countAndFlagsBits = (uint64_t)v32;
  OUTLINED_FUNCTION_6_6(0x73726579616C70, v36, v18, v2);
  double v19 = (__n128 *)OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_20_2(v19, (__n128)xmmword_24F990910);
  v20._unint64_t countAndFlagsBits = 0x656C69666F7250;
  v20._object = (void *)0xE700000000000000;
  TypeRef.init(_:arguments:)(v20, v15);
  unint64_t v21 = OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_82_1(v21, v22, v23, v24, v25, v26, v27, v28, 1, 2, v32[0], v32[1], v32[2], v32[3], v33);
  v35.name._unint64_t countAndFlagsBits = (uint64_t)v32;
  v29._unint64_t countAndFlagsBits = 0x69666F7250746567;
  v29._object = (void *)0xEB0000000073656CLL;
  MethodDeclaration.init(_:_:_:)((GameServicesProtocols::MethodDeclaration *)(v4 + 32), v29, v1, v35);
  uint64_t v30 = 0x53656C69666F7250;
  unint64_t v31 = 0xEE00656369767265;
  ProtocolDeclaration.init(_:methods:)(a1, *(Swift::String *)&v30, (Swift::OpaquePointer)v4);
}

unint64_t OUTLINED_FUNCTION_0_3()
{
  uint64_t v2 = 0x6552726579616C50;
  unint64_t v3 = 0xE900000000000066;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return OUTLINED_FUNCTION_48();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_allocObject();
}

unint64_t OUTLINED_FUNCTION_4_8(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15)
{
  *(_OWORD *)(a1 + 16) = a15;
  uint64_t v17 = 0x6D65766569686341;
  unint64_t v18 = 0xEE00666552746E65;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v17, v15);
}

void OUTLINED_FUNCTION_5_6(GameServicesProtocols::TypeRef a1@<0:X4, 8:X5, 16:X6>, Swift::Bool a2@<W7>, GameServicesProtocols::ParameterDeclaration *a3@<X8>)
{
  uint64_t v4 = 0x726579616C70;
  unint64_t v5 = 0xE600000000000000;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  ParameterDeclaration.init(_:secondName:_:optional:)(a3, *(Swift::String *)&v4, *(Swift::String_optional *)&v6, a1, a2);
}

void OUTLINED_FUNCTION_6_6(uint64_t a1@<X0>, GameServicesProtocols::TypeRef a2@<0:X4, 8:X5, 16:X6>, Swift::Bool a3@<W7>, GameServicesProtocols::ParameterDeclaration *a4@<X8>)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  ParameterDeclaration.init(_:secondName:_:optional:)(a4, *(Swift::String *)&a1, *(Swift::String_optional *)&v6, a2, a3);
}

unint64_t OUTLINED_FUNCTION_7_6()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return OUTLINED_FUNCTION_48();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return OUTLINED_FUNCTION_48();
}

unint64_t OUTLINED_FUNCTION_10_6()
{
  uint64_t v2 = 1684631382;
  unint64_t v3 = 0xE400000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return OUTLINED_FUNCTION_48();
}

void OUTLINED_FUNCTION_12_6(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, GameServicesProtocols::TypeRef a5@<0:X4, 8:X5, 16:X6>, Swift::Bool a6@<W7>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  a5.name._object = (void *)(a1 & 1);
  a5.name._unint64_t countAndFlagsBits = (uint64_t)&a15;
  uint64_t v17 = 0x6E69676E6F6C6562;
  unint64_t v18 = 0xEB000000006F5467;
  uint64_t v19 = 0x726579616C70;
  unint64_t v20 = 0xE600000000000000;
  ParameterDeclaration.init(_:secondName:_:optional:)(v15, *(Swift::String *)&v17, *(Swift::String_optional *)&v19, a5, a6);
}

unint64_t OUTLINED_FUNCTION_13_4()
{
  uint64_t v2 = 0x6C616E6F6974704FLL;
  unint64_t v3 = 0xE800000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_14_4()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_15_5()
{
  uint64_t v2 = 0x6F6272656461654CLL;
  unint64_t v3 = 0xEE00666552647261;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return 0x7961727241;
}

void OUTLINED_FUNCTION_17_1(uint64_t a1@<X0>, GameServicesProtocols::TypeRef a2@<0:X4, 8:X5, 16:X6>, Swift::Bool a3@<W7>, GameServicesProtocols::ParameterDeclaration *a4@<X8>)
{
  uint64_t v6 = 0x73726579616C70;
  unint64_t v7 = 0xE700000000000000;
  ParameterDeclaration.init(_:secondName:_:optional:)(a4, *(Swift::String *)&a1, *(Swift::String_optional *)&v6, a2, a3);
}

uint64_t OUTLINED_FUNCTION_18_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  *(_OWORD *)(a1 + 16) = a21;
  return 0x6F6272656461654CLL;
}

unint64_t OUTLINED_FUNCTION_19_2(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  uint64_t v22 = 0x6C616E6F6974704FLL;
  unint64_t v23 = 0xE800000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v22, v20);
}

__n128 *OUTLINED_FUNCTION_20_2(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return swift_allocObject();
}

unint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_23_2()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

void OUTLINED_FUNCTION_24_2(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, GameServicesProtocols::TypeRef a5@<0:X4, 8:X5, 16:X6>, Swift::Bool a6@<W7>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  a5.name._object = (void *)(a1 & 1);
  a5.name._unint64_t countAndFlagsBits = (uint64_t)&a15;
  uint64_t v17 = 0x794274726F73;
  unint64_t v18 = 0xE600000000000000;
  uint64_t v19 = 0x6373654474726F73;
  unint64_t v20 = 0xEE00726F74706972;
  ParameterDeclaration.init(_:secondName:_:optional:)(v15, *(Swift::String *)&v17, *(Swift::String_optional *)&v19, a5, a6);
}

void OUTLINED_FUNCTION_25_1(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, GameServicesProtocols::TypeRef a4@<0:X3, 8:X4, 16:X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, long long a12, uint64_t a13, long long a14)
{
  a11 = a13;
  a12 = a14;
  a4.name._unint64_t countAndFlagsBits = (uint64_t)&a11;
  uint64_t v17 = 0x75716552646E6573;
  unint64_t v18 = 0xEC00000073747365;
  MethodDeclaration.init(_:_:_:)(v14, *(Swift::String *)&v17, v15, a4);
}

double OUTLINED_FUNCTION_26_1(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19, double a20,double a21,double a22,double a23)
{
  return a23;
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_28_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15)
{
  *(_OWORD *)(a1 + 16) = a15;
  return 1701667143;
}

double OUTLINED_FUNCTION_29_4(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17)
{
  return a17;
}

__n128 OUTLINED_FUNCTION_30_2(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__n128 a21)
{
  __n128 result = a21;
  a1[1] = a21;
  return result;
}

unint64_t OUTLINED_FUNCTION_31_1()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

__n128 OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  return (__n128)a21;
}

__n128 OUTLINED_FUNCTION_33_1(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __n128 a15)
{
  __n128 result = a15;
  a1[1] = a15;
  return result;
}

void OUTLINED_FUNCTION_34_1(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, GameServicesProtocols::TypeRef a5@<0:X4, 8:X5, 16:X6>, Swift::Bool a6@<W7>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  a5.name._object = (void *)(a1 & 1);
  a5.name._unint64_t countAndFlagsBits = (uint64_t)&a15;
  uint64_t v17 = 1867804789;
  unint64_t v18 = 0xE400000000000000;
  uint64_t v19 = 0x74696D696CLL;
  unint64_t v20 = 0xE500000000000000;
  ParameterDeclaration.init(_:secondName:_:optional:)(v15, *(Swift::String *)&v17, *(Swift::String_optional *)&v19, a5, a6);
}

double OUTLINED_FUNCTION_35_2(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19, double a20,double a21)
{
  return a21;
}

unint64_t OUTLINED_FUNCTION_36_1()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_37_2()
{
  uint64_t v2 = 0x7961727241;
  unint64_t v3 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  return 0x6562697263736564;
}

void OUTLINED_FUNCTION_41_2(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, GameServicesProtocols::TypeRef a5@<0:X4, 8:X5, 16:X6>, Swift::Bool a6@<W7>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  a5.name._object = (void *)(a1 & 1);
  a5.name._unint64_t countAndFlagsBits = (uint64_t)&a15;
  uint64_t v18 = 0x7265746661;
  unint64_t v19 = 0xE500000000000000;
  uint64_t v20 = v16;
  unint64_t v21 = 0xE600000000000000;
  ParameterDeclaration.init(_:secondName:_:optional:)(v15, *(Swift::String *)&v18, *(Swift::String_optional *)&v20, a5, a6);
}

unint64_t OUTLINED_FUNCTION_42_3()
{
  uint64_t v2 = 0x676E656C6C616843;
  unint64_t v3 = 0xEC00000066655265;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_43_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  uint64_t v22 = 0x6552726579616C50;
  unint64_t v23 = 0xE900000000000066;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v22, v20);
}

unint64_t OUTLINED_FUNCTION_44_2(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  uint64_t v4 = 0x666552656D6147;
  unint64_t v5 = 0xE700000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v4, v2);
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return 1953720684;
}

uint64_t OUTLINED_FUNCTION_46_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15)
{
  *(_OWORD *)(a1 + 16) = a15;
  return 0x726F73727543;
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return 25970;
}

void OUTLINED_FUNCTION_48_2(GameServicesProtocols::TypeRef a1@<0:X4, 8:X5, 16:X6>, Swift::Bool a2@<W7>, GameServicesProtocols::ParameterDeclaration *a3@<X8>)
{
  uint64_t v4 = 31074;
  unint64_t v5 = 0xE200000000000000;
  uint64_t v6 = 0x737265746C6966;
  unint64_t v7 = 0xE700000000000000;
  ParameterDeclaration.init(_:secondName:_:optional:)(a3, *(Swift::String *)&v4, *(Swift::String_optional *)&v6, a1, a2);
}

__n128 OUTLINED_FUNCTION_49_1(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __n128 a15)
{
  __n128 result = a15;
  a1[1] = a15;
  return result;
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return 1701273936;
}

unint64_t OUTLINED_FUNCTION_53_2()
{
  uint64_t v2 = 0x6C616E6F6974704FLL;
  unint64_t v3 = 0xE800000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_54_2()
{
  uint64_t v2 = 0x6C616E6F6974704FLL;
  unint64_t v3 = 0xE800000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

double OUTLINED_FUNCTION_55_2(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19, double a20,double a21)
{
  return a21;
}

unint64_t OUTLINED_FUNCTION_56_1(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  uint64_t v22 = 0x7961727241;
  unint64_t v23 = 0xE500000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v22, v20);
}

void OUTLINED_FUNCTION_57_1(uint64_t a1@<X0>, GameServicesProtocols::TypeRef a2@<0:X3, 8:X4, 16:X5>, GameServicesProtocols::MethodDeclaration *a3@<X8>)
{
  uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL | 0x6552000000000000;
  unint64_t v6 = 0xEE00737473657571;
  MethodDeclaration.init(_:_:_:)(a3, *(Swift::String *)&v5, v3, a2);
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  return 0x6552726579616C50;
}

__n128 OUTLINED_FUNCTION_59_1()
{
  return *(__n128 *)(v0 - 104);
}

void OUTLINED_FUNCTION_60_1(GameServicesProtocols::TypeRef a1@<0:X4, 8:X5, 16:X6>, Swift::Bool a2@<W7>, GameServicesProtocols::ParameterDeclaration *a3@<X8>)
{
  uint64_t v5 = 0x7265746661;
  unint64_t v6 = 0xE500000000000000;
  uint64_t v7 = v3;
  unint64_t v8 = 0xE600000000000000;
  ParameterDeclaration.init(_:secondName:_:optional:)(a3, *(Swift::String *)&v5, *(Swift::String_optional *)&v7, a1, a2);
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return 0x6C616E6F6974704FLL;
}

unint64_t OUTLINED_FUNCTION_62_1(unsigned int a1)
{
  uint64_t v3 = a1 | 0x746C694600000000;
  unint64_t v4 = 0xEA00000000007265;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v3, v1);
}

unint64_t OUTLINED_FUNCTION_63_1(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  uint64_t v22 = 1701273936;
  unint64_t v23 = 0xE400000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v22, v20);
}

uint64_t OUTLINED_FUNCTION_64_1(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return 0x646E65697246;
}

void OUTLINED_FUNCTION_65_1(GameServicesProtocols::TypeRef a1@<0:X3, 8:X4, 16:X5>, GameServicesProtocols::MethodDeclaration *a2@<X8>)
{
  uint64_t v4 = 0x74696D627573;
  unint64_t v5 = 0xE600000000000000;
  MethodDeclaration.init(_:_:_:)(a2, *(Swift::String *)&v4, v2, a1);
}

uint64_t OUTLINED_FUNCTION_66_3()
{
  return v0 | 0x20;
}

unint64_t OUTLINED_FUNCTION_67_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21)
{
  *(_OWORD *)(a1 + 16) = a21;
  return 0xD000000000000010;
}

unint64_t OUTLINED_FUNCTION_68_2()
{
  return 0xD000000000000010;
}

__n128 OUTLINED_FUNCTION_69_2()
{
  return *(__n128 *)(v0 - 104);
}

uint64_t OUTLINED_FUNCTION_71_2(unsigned int a1)
{
  return a1 | 0x6569724600000000;
}

uint64_t OUTLINED_FUNCTION_72_2()
{
  return 0x656C61636F4CLL;
}

unint64_t OUTLINED_FUNCTION_73_2()
{
  unint64_t v3 = 0xD000000000000012;
  uint64_t v4 = v1;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v3, v0);
}

__n128 *OUTLINED_FUNCTION_75_1(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

unint64_t OUTLINED_FUNCTION_76_2(unsigned int a1)
{
  uint64_t v3 = a1 | 0x66655200000000;
  unint64_t v4 = 0xE700000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v3, v1);
}

unint64_t OUTLINED_FUNCTION_77_2()
{
  uint64_t v2 = 7630409;
  unint64_t v3 = 0xE300000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

__n128 OUTLINED_FUNCTION_78_2(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  __n128 result = a9;
  a1[1] = a9;
  return result;
}

uint64_t OUTLINED_FUNCTION_79_2()
{
  return 0x6552726579616C50;
}

unint64_t OUTLINED_FUNCTION_80_1()
{
  uint64_t v2 = 1953384789;
  unint64_t v3 = 0xE400000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

unint64_t OUTLINED_FUNCTION_81_1()
{
  uint64_t v2 = 1701273936;
  unint64_t v3 = 0xE400000000000000;
  return (unint64_t)TypeRef.init(_:arguments:)(*(Swift::String *)&v2, v0);
}

__n128 OUTLINED_FUNCTION_82_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15)
{
  return (__n128)a15;
}

uint64_t OUTLINED_FUNCTION_83_1()
{
  return OUTLINED_FUNCTION_48();
}

uint64_t getEnumTagSinglePayload for ServiceError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

ValueMetadata *type metadata accessor for ServiceError()
{
  return &type metadata for ServiceError;
}

uint64_t AchievementServiceProtocol.listAchievements(game:after:)(uint64_t a1, void *a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 48) = a5;
  *(void *)(v6 + 56) = v5;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a4;
  uint64_t v7 = a2[1];
  *(void *)(v6 + 64) = *a2;
  *(void *)(v6 + 72) = v7;
  *(_OWORD *)(v6 + 80) = *a3;
  return MEMORY[0x270FA2498](sub_24F976DFC, 0, 0);
}

uint64_t sub_24F976DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  uint64_t v11 = v9[10];
  uint64_t v10 = v9[11];
  uint64_t v13 = v9[8];
  uint64_t v12 = v9[9];
  uint64_t v26 = v9[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AB0);
  uint64_t v14 = swift_allocObject();
  v9[12] = v14;
  *(_OWORD *)(v14 + 16) = xmmword_24F990910;
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = v12;
  v9[2] = v11;
  v9[3] = v10;
  uint64_t v25 = *(void *)(v26 + 24) + **(int **)(v26 + 24);
  swift_bridgeObjectRetain();
  Swift::OpaquePointer v15 = (void *)swift_task_alloc();
  v9[13] = v15;
  void *v15 = v9;
  v15[1] = sub_24F976F44;
  OUTLINED_FUNCTION_40_2();
  return v21(v16, v17, v18, v19, v20, v21, v22, v23, a9, v25);
}

uint64_t sub_24F976F44()
{
  OUTLINED_FUNCTION_44();
  *(void *)(v2 + 112) = v1;
  *(void *)(v2 + 120) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    unsigned int v3 = sub_24F977164;
  }
  else {
    unsigned int v3 = sub_24F977044;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24F977044()
{
  Swift::OpaquePointer v15 = v0;
  uint64_t v1 = (void *)v0[14];
  if (v1[2])
  {
    uint64_t v2 = (void *)v0[4];
    uint64_t v3 = v1[4];
    uint64_t v4 = v1[5];
    uint64_t v5 = v1[6];
    uint64_t v6 = v1[7];
    uint64_t v7 = v1[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v2 = v3;
    v2[1] = v4;
    v2[2] = v5;
    v2[3] = v6;
    v2[4] = v7;
  }
  else
  {
    uint64_t v10 = v0[8];
    uint64_t v9 = v0[9];
    swift_bridgeObjectRelease();
    v14[0] = v10;
    v14[1] = v9;
    sub_24F962328();
    swift_allocError();
    uint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35760);
    static GameServicesError.invalidReference<A>(ref:)(v14, v12);
    swift_willThrow();
  }
  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24F977164()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AchievementDescription.game.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

uint64_t AchievementDescription.game.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*AchievementDescription.game.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.identifier.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t AchievementDescription.identifier.setter()
{
  OUTLINED_FUNCTION_20_3();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*AchievementDescription.identifier.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.groupIdentifier.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t AchievementDescription.groupIdentifier.setter()
{
  OUTLINED_FUNCTION_20_3();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*AchievementDescription.groupIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.title.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t AchievementDescription.title.setter()
{
  OUTLINED_FUNCTION_20_3();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*AchievementDescription.title.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.unachievedDescription.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t AchievementDescription.unachievedDescription.setter()
{
  OUTLINED_FUNCTION_20_3();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return result;
}

uint64_t (*AchievementDescription.unachievedDescription.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.achievedDescription.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t AchievementDescription.achievedDescription.setter()
{
  OUTLINED_FUNCTION_20_3();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*AchievementDescription.achievedDescription.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.maximumPoints.getter()
{
  return *(void *)(v0 + 96);
}

uint64_t AchievementDescription.maximumPoints.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 96) = result;
  *(unsigned char *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*AchievementDescription.maximumPoints.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.isHidden.getter()
{
  return *(unsigned __int8 *)(v0 + 105);
}

uint64_t AchievementDescription.isHidden.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 105) = result;
  return result;
}

uint64_t (*AchievementDescription.isHidden.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.isReplayable.getter()
{
  return *(unsigned __int8 *)(v0 + 106);
}

uint64_t AchievementDescription.isReplayable.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 106) = result;
  return result;
}

uint64_t (*AchievementDescription.isReplayable.modify())()
{
  return nullsub_1;
}

uint64_t AchievementDescription.rarityPercent.getter()
{
  return *(void *)(v0 + 112);
}

uint64_t AchievementDescription.rarityPercent.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 112) = result;
  *(unsigned char *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*AchievementDescription.rarityPercent.modify())()
{
  return nullsub_1;
}

__n128 AchievementDescription.init(game:identifier:groupIdentifier:title:unachievedDescription:achievedDescription:maximumPoints:isHidden:isReplayable:rarityPercent:)@<Q0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10, uint64_t a11, uint64_t a12, char a13, char a14, char a15, uint64_t a16, char a17)
{
  __n128 result = a10;
  uint64_t v18 = a1[1];
  *(void *)a9 = *a1;
  *(void *)(a9 + 8) = v18;
  *(void *)(a9 + 16) = a2;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(void *)(a9 + 64) = a8;
  *(__n128 *)(a9 + 72) = a10;
  *(void *)(a9 + 88) = a11;
  *(void *)(a9 + 96) = a12;
  *(unsigned char *)(a9 + 104) = a13 & 1;
  *(unsigned char *)(a9 + 105) = a14;
  *(unsigned char *)(a9 + 106) = a15;
  *(void *)(a9 + 112) = a16;
  *(unsigned char *)(a9 + 120) = a17 & 1;
  return result;
}

uint64_t sub_24F97759C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667175 && a2 == 0xE400000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x65644970756F7267 && a2 == 0xEF7265696669746ELL;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
        if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000015 && a2 == 0x800000024F998EC0 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000013 && a2 == 0x800000024F998EE0 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          BOOL v9 = a1 == 0x506D756D6978616DLL && a2 == 0xED000073746E696FLL;
          if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x6E65646469487369 && a2 == 0xE800000000000000;
            if (v10 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              BOOL v11 = a1 == 0x79616C7065527369 && a2 == 0xEC000000656C6261;
              if (v11 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else if (a1 == 0x6550797469726172 && a2 == 0xED0000746E656372)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else
              {
                char v13 = OUTLINED_FUNCTION_5_1();
                swift_bridgeObjectRelease();
                if (v13) {
                  return 9;
                }
                else {
                  return 10;
                }
              }
            }
          }
        }
      }
    }
  }
}

unint64_t sub_24F977988(char a1)
{
  unint64_t result = 1701667175;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x696669746E656469;
      break;
    case 2:
      unint64_t result = 0x65644970756F7267;
      break;
    case 3:
      unint64_t result = 0x656C746974;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0x506D756D6978616DLL;
      break;
    case 7:
      unint64_t result = 0x6E65646469487369;
      break;
    case 8:
      unint64_t result = 0x79616C7065527369;
      break;
    case 9:
      unint64_t result = 0x6550797469726172;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F977AF4()
{
  return sub_24F977988(*v0);
}

uint64_t sub_24F977AFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97759C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F977B24(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_24F977B30()
{
  sub_24F977E74();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F977B68()
{
  sub_24F977E74();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t AchievementDescription.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AB8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F977E74();
  sub_24F98E738();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
  sub_24F949E34(&qword_269A35418, &qword_269A35410);
  sub_24F98E628();
  if (!v8)
  {
    OUTLINED_FUNCTION_16_4(1);
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_16_4(2);
    OUTLINED_FUNCTION_25_2();
    sub_24F98E578();
    OUTLINED_FUNCTION_16_4(3);
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_16_4(4);
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_16_4(5);
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_16_4(6);
    OUTLINED_FUNCTION_25_2();
    sub_24F98E5A8();
    sub_24F98E5E8();
    sub_24F98E5E8();
    OUTLINED_FUNCTION_16_4(9);
    OUTLINED_FUNCTION_25_2();
    sub_24F98E598();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

unint64_t sub_24F977E74()
{
  unint64_t result = qword_269A3ED50;
  if (!qword_269A3ED50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3ED50);
  }
  return result;
}

uint64_t AchievementDescription.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AC0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_24_0();
  char v65 = 1;
  char v62 = 1;
  uint64_t v6 = a1[3];
  Swift::String v66 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v6);
  sub_24F977E74();
  sub_24F98E728();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    return swift_bridgeObjectRelease();
  }
  else
  {
    GameServicesProtocols::TypeRef v36 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F949E34(&qword_269A35470, &qword_269A35410);
    sub_24F98E538();
    uint64_t v7 = v41;
    swift_bridgeObjectRetain();
    uint64_t v34 = OUTLINED_FUNCTION_8_7();
    uint64_t v35 = v42;
    LOBYTE(v41) = 2;
    uint64_t v9 = v8;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_3();
    uint64_t v10 = sub_24F98E488();
    uint64_t v12 = v11;
    uint64_t v33 = v10;
    OUTLINED_FUNCTION_39_3(v11, 3);
    swift_bridgeObjectRetain();
    uint64_t v32 = OUTLINED_FUNCTION_8_7();
    OUTLINED_FUNCTION_39_3(v13, 4);
    uint64_t v39 = v14;
    swift_bridgeObjectRetain();
    uint64_t v31 = OUTLINED_FUNCTION_8_7();
    OUTLINED_FUNCTION_39_3(v15, 5);
    uint64_t v38 = v16;
    swift_bridgeObjectRetain();
    uint64_t v30 = OUTLINED_FUNCTION_8_7();
    OUTLINED_FUNCTION_39_3(v17, 6);
    uint64_t v37 = v18;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_3();
    uint64_t v29 = sub_24F98E4B8();
    char v28 = v19;
    char v65 = v19 & 1;
    char v27 = OUTLINED_FUNCTION_26_2(7);
    char v26 = OUTLINED_FUNCTION_26_2(8);
    char v61 = 9;
    OUTLINED_FUNCTION_24_3();
    uint64_t v20 = sub_24F98E4A8();
    char v22 = v21;
    uint64_t v23 = OUTLINED_FUNCTION_22_2();
    v24(v23);
    char v62 = v22 & 1;
    v40[0] = v7;
    v40[1] = v42;
    v40[2] = v34;
    v40[3] = v9;
    v40[4] = v33;
    v40[5] = v12;
    v40[6] = v32;
    v40[7] = v39;
    v40[8] = v31;
    v40[9] = v38;
    v40[10] = v30;
    v40[11] = v37;
    v40[12] = v29;
    LOBYTE(v40[13]) = v28 & 1;
    BYTE1(v40[13]) = v27 & 1;
    BYTE2(v40[13]) = v26 & 1;
    v40[14] = v20;
    LOBYTE(v40[15]) = v22 & 1;
    sub_24F9784B0((uint64_t)v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v36, v40, 0x79uLL);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    uint64_t v41 = v7;
    uint64_t v42 = v35;
    uint64_t v43 = v34;
    uint64_t v44 = v9;
    uint64_t v45 = v33;
    uint64_t v46 = v12;
    uint64_t v47 = v32;
    uint64_t v48 = v39;
    uint64_t v49 = v31;
    uint64_t v50 = v38;
    uint64_t v51 = v30;
    uint64_t v52 = v37;
    uint64_t v53 = v29;
    char v54 = v65;
    char v55 = v27 & 1;
    char v56 = v26 & 1;
    char v58 = v64;
    int v57 = v63;
    uint64_t v59 = v20;
    char v60 = v62;
    return sub_24F978528((uint64_t)&v41);
  }
}

uint64_t sub_24F9784B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F978528(uint64_t a1)
{
  return a1;
}

uint64_t sub_24F9785A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AchievementDescription.init(from:)(a1, a2);
}

uint64_t sub_24F9785B8(void *a1)
{
  return AchievementDescription.encode(to:)(a1);
}

uint64_t AchievementProgress.player.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

uint64_t AchievementProgress.player.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*AchievementProgress.player.modify())()
{
  return nullsub_1;
}

uint64_t AchievementProgress.achievement.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 24), a1);
}

uint64_t AchievementProgress.achievement.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  return result;
}

uint64_t (*AchievementProgress.achievement.modify())()
{
  return nullsub_1;
}

double AchievementProgress.percentComplete.getter()
{
  return *(double *)(v0 + 32);
}

void AchievementProgress.percentComplete.setter(double a1)
{
  *(double *)(v1 + 32) = a1;
}

uint64_t (*AchievementProgress.percentComplete.modify())()
{
  return nullsub_1;
}

uint64_t AchievementProgress.isCompleted.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t AchievementProgress.isCompleted.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*AchievementProgress.isCompleted.modify())()
{
  return nullsub_1;
}

uint64_t sub_24F9786E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24F98DFB8();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t AchievementProgress.lastReportedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AchievementProgress() + 32);
  return sub_24F95511C(v3, a1);
}

uint64_t type metadata accessor for AchievementProgress()
{
  uint64_t result = qword_269A3EF60;
  if (!qword_269A3EF60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AchievementProgress.lastReportedDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AchievementProgress() + 32);
  return sub_24F978800(a1, v3);
}

uint64_t sub_24F978800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*AchievementProgress.lastReportedDate.modify())()
{
  return nullsub_1;
}

uint64_t AchievementProgress.init(player:achievement:percentComplete:isCompleted:lastReportedDate:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v12 = *a2;
  uint64_t v13 = a2[1];
  uint64_t v14 = a5 + *(int *)(type metadata accessor for AchievementProgress() + 32);
  uint64_t v15 = sub_24F98DFB8();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v11;
  *(void *)(a5 + 16) = v12;
  *(void *)(a5 + 24) = v13;
  *(double *)(a5 + 32) = a6;
  *(unsigned char *)(a5 + 40) = a3;
  return sub_24F978800(a4, v14);
}

uint64_t sub_24F978958(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726579616C70 && a2 == 0xE600000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D65766569686361 && a2 == 0xEB00000000746E65;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x43746E6563726570 && a2 == 0xEF6574656C706D6FLL;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656C706D6F437369 && a2 == 0xEB00000000646574;
        if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000010 && a2 == 0x800000024F998F00)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v9 = OUTLINED_FUNCTION_5_1();
          swift_bridgeObjectRelease();
          if (v9) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

unint64_t sub_24F978B78(char a1)
{
  unint64_t result = 0x726579616C70;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6D65766569686361;
      break;
    case 2:
      unint64_t result = 0x43746E6563726570;
      break;
    case 3:
      unint64_t result = 0x656C706D6F437369;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F978C44()
{
  return sub_24F978B78(*v0);
}

uint64_t sub_24F978C4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F978958(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F978C74(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24F978C80()
{
  sub_24F978F2C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F978CB8()
{
  sub_24F978F2C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t AchievementProgress.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AC8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F978F2C();
  sub_24F98E738();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A35390, &qword_269A35388);
  OUTLINED_FUNCTION_4_1();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35948);
    sub_24F949E34(&qword_269A35AD0, &qword_269A35948);
    OUTLINED_FUNCTION_4_1();
    sub_24F98E5F8();
    sub_24F98E5E8();
    type metadata accessor for AchievementProgress();
    sub_24F98DFB8();
    sub_24F94CD40(&qword_269A353A8);
    sub_24F98E5B8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_24F978F2C()
{
  unint64_t result = qword_269A3ED58[0];
  if (!qword_269A3ED58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3ED58);
  }
  return result;
}

uint64_t AchievementProgress.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v5 = OUTLINED_FUNCTION_15_0(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35AD8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v30 = v9;
  uint64_t v31 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_24_0();
  uint64_t v10 = type metadata accessor for AchievementProgress();
  uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 40)];
  uint64_t v16 = sub_24F98DFB8();
  uint64_t v32 = v15;
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F978F2C();
  sub_24F98E728();
  if (v2)
  {
    uint64_t v17 = v32;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_24F97930C(v17);
  }
  else
  {
    char v27 = v7;
    char v28 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    char v35 = 0;
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    OUTLINED_FUNCTION_37_3();
    OUTLINED_FUNCTION_42_4();
    uint64_t v18 = v34;
    char v19 = v28;
    *char v28 = v33;
    v19[1] = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35948);
    char v35 = 1;
    sub_24F949E34(&qword_269A35AE0, &qword_269A35948);
    OUTLINED_FUNCTION_37_3();
    OUTLINED_FUNCTION_42_4();
    uint64_t v20 = v34;
    v19[2] = v33;
    v19[3] = v20;
    OUTLINED_FUNCTION_36_2(2);
    sub_24F98E508();
    v19[4] = v21;
    OUTLINED_FUNCTION_36_2(3);
    *((unsigned char *)v19 + 40) = sub_24F98E4F8() & 1;
    LOBYTE(v33) = 4;
    sub_24F94CD40(&qword_269A353C8);
    uint64_t v22 = (uint64_t)v27;
    sub_24F98E4C8();
    uint64_t v23 = OUTLINED_FUNCTION_29_5();
    v24(v23);
    sub_24F978800(v22, v32);
    uint64_t v25 = v28;
    sub_24F97936C((uint64_t)v28, v29);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_24F9793D0((uint64_t)v25);
  }
}

uint64_t sub_24F97930C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F97936C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AchievementProgress();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F9793D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AchievementProgress();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24F97942C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AchievementProgress.init(from:)(a1, a2);
}

uint64_t sub_24F979444(void *a1)
{
  return AchievementProgress.encode(to:)(a1);
}

uint64_t dispatch thunk of AchievementServiceProtocol.describe(achievements:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of AchievementServiceProtocol.listAchievements(games:after:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 24) + **(int **)(v9 + 24);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A328;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of AchievementServiceProtocol.getProgress(achievements:belongingTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 32) + **(int **)(v9 + 32);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F955E9C;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of AchievementServiceProtocol.listFriends(having:after:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 40) + **(int **)(v9 + 40);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A328;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of AchievementServiceProtocol.resetProgress(achievements:belongingTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 48) + **(int **)(v9 + 48);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of AchievementServiceProtocol.reveal(achievements:belongingTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 56) + **(int **)(v9 + 56);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of AchievementServiceProtocol.submit(progress:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A308;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of AchievementServiceProtocol.clearCache()()
{
  OUTLINED_FUNCTION_20_3();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 72) + **(int **)(v2 + 72));
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_34(v3);
  *uint64_t v4 = v5;
  v4[1] = sub_24F955C0C;
  return v7(v1, v0);
}

uint64_t destroy for AchievementDescription()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AchievementDescription(uint64_t a1, uint64_t a2)
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
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(_WORD *)(a1 + 105) = *(_WORD *)(a2 + 105);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AchievementDescription(void *a1, uint64_t a2)
{
  *(void *)(v2 + 8) = OUTLINED_FUNCTION_44_3(a1, (void *)a2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = *(void *)(a2 + 16);
  *(void *)(v2 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = *(void *)(a2 + 32);
  *(void *)(v2 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = *(void *)(a2 + 48);
  *(void *)(v2 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = *(void *)(a2 + 64);
  *(void *)(v2 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 80) = *(void *)(a2 + 80);
  *(void *)(v2 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 96);
  *(unsigned char *)(v2 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(v2 + 96) = v4;
  OUTLINED_FUNCTION_27_3();
  *(unsigned char *)(v2 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(v2 + 112) = v5;
  return v2;
}

void *__swift_memcpy121_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x79uLL);
}

uint64_t assignWithTake for AchievementDescription(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_80(a1, (void *)a2);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(v2 + 16) = *(void *)(a2 + 16);
  *(void *)(v2 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(v2 + 32) = *(void *)(a2 + 32);
  *(void *)(v2 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(v2 + 48) = *(void *)(a2 + 48);
  *(void *)(v2 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(v2 + 64) = *(void *)(a2 + 64);
  *(void *)(v2 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(v2 + 80) = *(void *)(a2 + 80);
  *(void *)(v2 + 88) = v8;
  swift_bridgeObjectRelease();
  *(void *)(v2 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(v2 + 104) = *(unsigned char *)(a2 + 104);
  OUTLINED_FUNCTION_27_3();
  *(void *)(v2 + 112) = v9;
  *(unsigned char *)(v2 + 120) = *(unsigned char *)(a2 + 120);
  return v2;
}

uint64_t getEnumTagSinglePayload for AchievementDescription(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 121))
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

uint64_t storeEnumTagSinglePayload for AchievementDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 120) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 121) = 1;
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
    *(unsigned char *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AchievementDescription()
{
}

uint64_t initializeBufferWithCopyOfBuffer for AchievementProgress(uint64_t a1)
{
  OUTLINED_FUNCTION_3_2();
  int v4 = *(_DWORD *)(v3 + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *v2;
    *(void *)a1 = *v2;
    a1 = v11 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = v2[1];
    *(void *)a1 = *v2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = v2[3];
    *(void *)(a1 + 16) = v2[2];
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)v2 + 40);
    sub_24F98DFB8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (OUTLINED_FUNCTION_49())
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v8 = OUTLINED_FUNCTION_15_0(v7);
      OUTLINED_FUNCTION_115(v8, v10, *(void *)(v9 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_11_7();
      uint64_t v12 = OUTLINED_FUNCTION_12_7();
      v13(v12);
      OUTLINED_FUNCTION_33();
    }
  }
  return a1;
}

uint64_t destroy for AchievementProgress(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_24F98DFB8();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = OUTLINED_FUNCTION_8_0();
    return v8(v7);
  }
  return result;
}

uint64_t initializeWithCopy for AchievementProgress(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  sub_24F98DFB8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (OUTLINED_FUNCTION_49())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v6 = OUTLINED_FUNCTION_15_0(v5);
    OUTLINED_FUNCTION_115(v6, v8, *(void *)(v7 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_11_7();
    uint64_t v9 = OUTLINED_FUNCTION_12_7();
    v10(v9);
    OUTLINED_FUNCTION_33();
  }
  return a1;
}

void *assignWithCopy for AchievementProgress(void *a1, void *a2, uint64_t a3)
{
  v3[1] = OUTLINED_FUNCTION_44_3(a1, a2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[2] = a2[2];
  v3[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = OUTLINED_FUNCTION_15_6();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a3, 1, v6);
  int v8 = OUTLINED_FUNCTION_49();
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v11)
    {
      uint64_t v19 = OUTLINED_FUNCTION_138();
      v20(v19);
      return v3;
    }
    uint64_t v12 = OUTLINED_FUNCTION_135();
    v13(v12);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v15 = OUTLINED_FUNCTION_15_0(v14);
    OUTLINED_FUNCTION_115(v15, v17, *(void *)(v16 + 64));
    return v3;
  }
  OUTLINED_FUNCTION_11_7();
  uint64_t v9 = OUTLINED_FUNCTION_12_7();
  v10(v9);
  OUTLINED_FUNCTION_33();
  return v3;
}

uint64_t initializeWithTake for AchievementProgress(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  sub_24F98DFB8();
  if (OUTLINED_FUNCTION_49())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v5 = OUTLINED_FUNCTION_15_0(v4);
    OUTLINED_FUNCTION_115(v5, v7, *(void *)(v6 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_11_7();
    uint64_t v8 = OUTLINED_FUNCTION_31_2();
    v9(v8);
    OUTLINED_FUNCTION_33();
  }
  return a1;
}

uint64_t assignWithTake for AchievementProgress(void *a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_80(a1, a2);
  uint64_t v6 = a2[3];
  *(void *)(v3 + 16) = a2[2];
  *(void *)(v3 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = OUTLINED_FUNCTION_15_6();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a3, 1, v7);
  int v9 = OUTLINED_FUNCTION_49();
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v12)
    {
      uint64_t v20 = OUTLINED_FUNCTION_138();
      v21(v20);
      return v3;
    }
    uint64_t v13 = OUTLINED_FUNCTION_135();
    v14(v13);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v16 = OUTLINED_FUNCTION_15_0(v15);
    OUTLINED_FUNCTION_115(v16, v18, *(void *)(v17 + 64));
    return v3;
  }
  OUTLINED_FUNCTION_11_7();
  uint64_t v10 = OUTLINED_FUNCTION_31_2();
  v11(v10);
  OUTLINED_FUNCTION_33();
  return v3;
}

uint64_t getEnumTagSinglePayload for AchievementProgress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F97A3B8);
}

uint64_t sub_24F97A3B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AchievementProgress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F97A458);
}

uint64_t sub_24F97A458(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v8 = v5 + *(int *)(a4 + 32);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_24F97A4DC()
{
  sub_24F957484();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_24F97A58C(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_24F97A614(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24F97A6E0);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for AchievementProgress.CodingKeys()
{
}

uint64_t sub_24F97A714(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 9) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_24F97A79C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x24F97A868);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

void type metadata accessor for AchievementDescription.CodingKeys()
{
}

unint64_t sub_24F97A8A0()
{
  unint64_t result = qword_269A3F070[0];
  if (!qword_269A3F070[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3F070);
  }
  return result;
}

unint64_t sub_24F97A8F0()
{
  unint64_t result = qword_269A3F280[0];
  if (!qword_269A3F280[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3F280);
  }
  return result;
}

unint64_t sub_24F97A940()
{
  unint64_t result = qword_269A3F390;
  if (!qword_269A3F390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3F390);
  }
  return result;
}

unint64_t sub_24F97A990()
{
  unint64_t result = qword_269A3F398[0];
  if (!qword_269A3F398[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3F398);
  }
  return result;
}

unint64_t sub_24F97A9E0()
{
  unint64_t result = qword_269A3F420;
  if (!qword_269A3F420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3F420);
  }
  return result;
}

unint64_t sub_24F97AA30()
{
  unint64_t result = qword_269A3F428[0];
  if (!qword_269A3F428[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3F428);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return sub_24F98E4E8();
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  *(void *)(v0 + 32) = *(void *)(v1 + 32);
  *(unsigned char *)(v0 + 40) = *(unsigned char *)(v1 + 40);
  return sub_24F98DFB8();
}

void OUTLINED_FUNCTION_16_4(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_24F98E5D8();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_2@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 232) = a1;
  return sub_24F98E4F8();
}

void OUTLINED_FUNCTION_27_3()
{
  *(unsigned char *)(v0 + 105) = *(unsigned char *)(v1 + 105);
  *(unsigned char *)(v0 + 106) = *(unsigned char *)(v1 + 106);
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36_2@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_39_3@<X0>(uint64_t a1@<X1>, char a2@<W8>)
{
  *(unsigned char *)(v2 - 232) = a2;
  return a1;
}

uint64_t OUTLINED_FUNCTION_42_4()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_44_3(void *a1, void *a2)
{
  *a1 = *a2;
  return a2[1];
}

void ContextualPromptStates.ageCategory.getter(unsigned char *a1@<X8>)
{
}

void ContextualPromptStates.profilePrivacy.getter(unsigned char *a1@<X8>)
{
}

void ContextualPromptStates.contactsIntegration.getter(unsigned char *a1@<X8>)
{
}

GameServicesProtocols::ContextualPromptStates __swiftcall ContextualPromptStates.init(ageCategory:profilePrivacy:contactsIntegration:)(GameServicesProtocols::AgeCategory ageCategory, GameServicesProtocols::ProfilePrivacy profilePrivacy, GameServicesProtocols::ContactsIntegrationConsent contactsIntegration)
{
  char v4 = *(unsigned char *)profilePrivacy;
  char v5 = *(unsigned char *)contactsIntegration;
  *int v3 = *(unsigned char *)ageCategory;
  v3[1] = v4;
  v3[2] = v5;
  result.ageCategory = ageCategory;
  return result;
}

uint64_t sub_24F97ACAC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6765746143656761 && a2 == 0xEB0000000079726FLL;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x50656C69666F7270 && a2 == 0xEE00796361766972;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x800000024F998F70)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = OUTLINED_FUNCTION_5_1();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_24F97AE14(char a1)
{
  if (!a1) {
    return 0x6765746143656761;
  }
  if (a1 == 1) {
    return 0x50656C69666F7270;
  }
  return 0xD000000000000013;
}

uint64_t sub_24F97AE84()
{
  return sub_24F97AE14(*v0);
}

uint64_t sub_24F97AE8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97ACAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F97AEB4(uint64_t a1)
{
  unint64_t v2 = sub_24F97B0BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F97AEF0(uint64_t a1)
{
  unint64_t v2 = sub_24F97B0BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContextualPromptStates.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35B28);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = *v1;
  int v11 = v1[1];
  int v15 = v1[2];
  int v16 = v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F97B0BC();
  sub_24F98E738();
  char v22 = v10;
  char v21 = 0;
  sub_24F97B108();
  OUTLINED_FUNCTION_8_8();
  if (!v2)
  {
    char v12 = v15;
    char v20 = v16;
    char v19 = 1;
    sub_24F97B154();
    OUTLINED_FUNCTION_8_8();
    char v18 = v12;
    char v17 = 2;
    sub_24F97B1A0();
    OUTLINED_FUNCTION_8_8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

unint64_t sub_24F97B0BC()
{
  unint64_t result = qword_269A3F4B0[0];
  if (!qword_269A3F4B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3F4B0);
  }
  return result;
}

unint64_t sub_24F97B108()
{
  unint64_t result = qword_269A35B30;
  if (!qword_269A35B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B30);
  }
  return result;
}

unint64_t sub_24F97B154()
{
  unint64_t result = qword_269A35B38;
  if (!qword_269A35B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B38);
  }
  return result;
}

unint64_t sub_24F97B1A0()
{
  unint64_t result = qword_269A35B40;
  if (!qword_269A35B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B40);
  }
  return result;
}

uint64_t ContextualPromptStates.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35B48);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F97B0BC();
  sub_24F98E728();
  if (!v2)
  {
    sub_24F97B390();
    OUTLINED_FUNCTION_6_8();
    sub_24F97B3DC();
    OUTLINED_FUNCTION_6_8();
    sub_24F97B428();
    OUTLINED_FUNCTION_6_8();
    uint64_t v7 = OUTLINED_FUNCTION_14_5();
    v8(v7);
    *a2 = v11;
    a2[1] = v10;
    a2[2] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24F97B390()
{
  unint64_t result = qword_269A35B50;
  if (!qword_269A35B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B50);
  }
  return result;
}

unint64_t sub_24F97B3DC()
{
  unint64_t result = qword_269A35B58;
  if (!qword_269A35B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B58);
  }
  return result;
}

unint64_t sub_24F97B428()
{
  unint64_t result = qword_269A35B60;
  if (!qword_269A35B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B60);
  }
  return result;
}

uint64_t sub_24F97B474@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ContextualPromptStates.init(from:)(a1, a2);
}

uint64_t sub_24F97B48C(void *a1)
{
  return ContextualPromptStates.encode(to:)(a1);
}

GameServicesProtocols::AgeCategory_optional __swiftcall AgeCategory.init(rawValue:)(Swift::String rawValue)
{
  return (GameServicesProtocols::AgeCategory_optional)sub_24F97BF10(v1);
}

uint64_t AgeCategory.rawValue.getter()
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x746C756461;
      break;
    case 2:
      uint64_t result = 0x656373656C6F6461;
      break;
    case 3:
      uint64_t result = 0x646C696863;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F97B53C(unsigned __int8 *a1, char *a2)
{
  return sub_24F97B7B8(*a1, *a2);
}

uint64_t sub_24F97B548(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x746553746F6ELL;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x746553746F6ELL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x74754F74706FLL;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6E4974706FLL;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x64696C61766E69;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      uint64_t v2 = 0x74754F74706FLL;
      break;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x6E4974706FLL;
      break;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x64696C61766E69;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F97B6A4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x656E6F7972657665;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 0x4F73646E65697266;
    }
    else {
      uint64_t v4 = 0x796C6E4F656DLL;
    }
    if (v3 == 1) {
      unint64_t v5 = 0xEB00000000796C6ELL;
    }
    else {
      unint64_t v5 = 0xE600000000000000;
    }
  }
  else
  {
    unint64_t v5 = 0xE800000000000000;
    uint64_t v4 = 0x656E6F7972657665;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v2 = 0x4F73646E65697266;
    }
    else {
      uint64_t v2 = 0x796C6E4F656DLL;
    }
    if (a2 == 1) {
      unint64_t v6 = 0xEB00000000796C6ELL;
    }
    else {
      unint64_t v6 = 0xE600000000000000;
    }
  }
  else
  {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v4 == v2 && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F97B7B8(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E776F6E6B6E75;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x746C756461;
      break;
    case 2:
      uint64_t v5 = 0x656373656C6F6461;
      unint64_t v3 = 0xEA0000000000746ELL;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x646C696863;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x746C756461;
      break;
    case 2:
      uint64_t v2 = 0x656373656C6F6461;
      unint64_t v6 = 0xEA0000000000746ELL;
      break;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x646C696863;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24F98E678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24F97B92C()
{
  return sub_24F97B968(*v0, (void (*)(unsigned char *, uint64_t))sub_24F97BB08);
}

uint64_t sub_24F97B95C()
{
  return sub_24F97BBFC();
}

uint64_t sub_24F97B968(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  sub_24F98E6F8();
  a2(v5, a1);
  return sub_24F98E718();
}

uint64_t sub_24F97B9B8()
{
  return sub_24F97BB08();
}

uint64_t sub_24F97B9C0()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F97BA78()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F97BB08()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F97BBCC(uint64_t a1)
{
  return sub_24F97BCA0(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_24F97BB08);
}

uint64_t sub_24F97BBFC()
{
  return sub_24F98E718();
}

uint64_t sub_24F97BCA0(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_24F98E6F8();
  a3(v6, a2);
  return sub_24F98E718();
}

GameServicesProtocols::AgeCategory_optional sub_24F97BCEC(Swift::String *a1)
{
  return AgeCategory.init(rawValue:)(*a1);
}

uint64_t sub_24F97BCF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AgeCategory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F97BD20()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F97BD58()
{
  return OUTLINED_FUNCTION_98();
}

GameServicesProtocols::ProfilePrivacy_optional __swiftcall ProfilePrivacy.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24F98E458();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t ProfilePrivacy.rawValue.getter()
{
  uint64_t v1 = 0x4F73646E65697266;
  if (*v0 != 1) {
    uint64_t v1 = 0x796C6E4F656DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656E6F7972657665;
  }
}

uint64_t sub_24F97BE44(unsigned __int8 *a1, char *a2)
{
  return sub_24F97B6A4(*a1, *a2);
}

uint64_t sub_24F97BE50()
{
  return sub_24F97B95C();
}

uint64_t sub_24F97BE58()
{
  return sub_24F97BA78();
}

uint64_t sub_24F97BE60()
{
  return sub_24F97BBFC();
}

GameServicesProtocols::ProfilePrivacy_optional sub_24F97BE68(Swift::String *a1)
{
  return ProfilePrivacy.init(rawValue:)(*a1);
}

uint64_t sub_24F97BE74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ProfilePrivacy.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F97BE9C()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F97BED4()
{
  return OUTLINED_FUNCTION_98();
}

GameServicesProtocols::ContactsIntegrationConsent_optional __swiftcall ContactsIntegrationConsent.init(rawValue:)(Swift::String rawValue)
{
  return (GameServicesProtocols::ContactsIntegrationConsent_optional)sub_24F97BF10(v1);
}

uint64_t sub_24F97BF10@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_24F98E458();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 4;
  if (v2 < 4) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t ContactsIntegrationConsent.rawValue.getter()
{
  uint64_t result = 0x746553746F6ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x74754F74706FLL;
      break;
    case 2:
      uint64_t result = 0x6E4974706FLL;
      break;
    case 3:
      uint64_t result = 0x64696C61766E69;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F97BFEC()
{
  unint64_t result = qword_269A35B68;
  if (!qword_269A35B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B68);
  }
  return result;
}

unint64_t sub_24F97C03C()
{
  unint64_t result = qword_269A35B70;
  if (!qword_269A35B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B70);
  }
  return result;
}

uint64_t sub_24F97C088(unsigned __int8 *a1, char *a2)
{
  return sub_24F97B548(*a1, *a2);
}

unint64_t sub_24F97C098()
{
  unint64_t result = qword_269A35B78;
  if (!qword_269A35B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B78);
  }
  return result;
}

uint64_t sub_24F97C0E4()
{
  return sub_24F97B968(*v0, (void (*)(unsigned char *, uint64_t))sub_24F97B9C0);
}

uint64_t sub_24F97C114()
{
  return sub_24F97B9C0();
}

uint64_t sub_24F97C11C(uint64_t a1)
{
  return sub_24F97BCA0(a1, *v1, (void (*)(unsigned char *, uint64_t))sub_24F97B9C0);
}

GameServicesProtocols::ContactsIntegrationConsent_optional sub_24F97C14C(Swift::String *a1)
{
  return ContactsIntegrationConsent.init(rawValue:)(*a1);
}

uint64_t sub_24F97C158@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ContactsIntegrationConsent.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F97C180()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F97C1B8()
{
  return OUTLINED_FUNCTION_98();
}

uint64_t dispatch thunk of OnboardingServiceProtocol.isGdprRequired(for:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F955E9C;
  uint64_t v2 = OUTLINED_FUNCTION_99();
  return v3(v2);
}

uint64_t dispatch thunk of OnboardingServiceProtocol.isPersonalizationRequired(for:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24F95A328;
  uint64_t v2 = OUTLINED_FUNCTION_99();
  return v3(v2);
}

uint64_t dispatch thunk of OnboardingServiceProtocol.getContextualPromptStates(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  char v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_24F955C0C;
  return v11(a1, a2, a3, a4);
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContextualPromptStates(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 >= 0xFE)
  {
    if ((a2 + 33554178) >> 24)
    {
      int v2 = a1[3];
      if (a1[3]) {
        return OUTLINED_FUNCTION_11_0((*(unsigned __int16 *)a1 | (a1[2] << 16) | (v2 << 24)) - 16776963);
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)(a1 + 3);
      if (*(_WORD *)(a1 + 3)) {
        return OUTLINED_FUNCTION_11_0((*(unsigned __int16 *)a1 | (a1[2] << 16) | (v2 << 24)) - 16776963);
      }
    }
  }
  unsigned int v4 = a1[1];
  BOOL v5 = v4 >= 3;
  int v6 = v4 - 3;
  if (!v5) {
    int v6 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v6);
}

uint64_t storeEnumTagSinglePayload for ContextualPromptStates(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554178) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFD) {
    int v3 = 0;
  }
  if (a2 > 0xFD)
  {
    *(_WORD *)uint64_t result = a2 - 254;
    *(unsigned char *)(result + 2) = (a2 - 254) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 254) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_67(result, a2 + 2);
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_67(result, a2 + 2);
    }
  }
  return result;
}

void type metadata accessor for ContextualPromptStates()
{
}

void type metadata accessor for AgeCategory()
{
}

void type metadata accessor for ProfilePrivacy()
{
}

uint64_t _s21GameServicesProtocols11AgeCategoryOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *(unsigned char *)uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = OUTLINED_FUNCTION_67(result, v6);
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F97C6BCLL);
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
        *(unsigned char *)(result + 1) = 0;
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
          *(unsigned char *)uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContactsIntegrationConsent()
{
}

uint64_t _s21GameServicesProtocols14ProfilePrivacyOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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
    *(unsigned char *)uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        uint64_t result = OUTLINED_FUNCTION_67(result, v6);
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F97C7B8);
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
        *(unsigned char *)(result + 1) = 0;
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
          *(unsigned char *)uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContextualPromptStates.CodingKeys()
{
}

unint64_t sub_24F97C7F0()
{
  unint64_t result = qword_269A3FE40[0];
  if (!qword_269A3FE40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3FE40);
  }
  return result;
}

unint64_t sub_24F97C840()
{
  unint64_t result = qword_269A3FF50;
  if (!qword_269A3FF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3FF50);
  }
  return result;
}

unint64_t sub_24F97C890()
{
  unint64_t result = qword_269A3FF58[0];
  if (!qword_269A3FF58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3FF58);
  }
  return result;
}

unint64_t sub_24F97C8DC()
{
  unint64_t result = qword_269A35B98;
  if (!qword_269A35B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35B98);
  }
  return result;
}

unint64_t sub_24F97C928()
{
  unint64_t result = qword_269A35BA0;
  if (!qword_269A35BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35BA0);
  }
  return result;
}

unint64_t sub_24F97C974()
{
  unint64_t result = qword_269A35BA8;
  if (!qword_269A35BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35BA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return v0;
}

double Artwork.Size.width.getter()
{
  return *(double *)v0;
}

double Artwork.Size.height.getter()
{
  return *(double *)(v0 + 8);
}

GameServicesProtocols::Artwork::Size __swiftcall Artwork.Size.init(width:height:)(Swift::Double width, Swift::Double height)
{
  *int v2 = width;
  v2[1] = height;
  result.height = height;
  result.width = width;
  return result;
}

uint64_t sub_24F97CA28(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746867696568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = OUTLINED_FUNCTION_5_1();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F97CAF0(char a1)
{
  if (a1) {
    return 0x746867696568;
  }
  else {
    return 0x6874646977;
  }
}

uint64_t sub_24F97CB20()
{
  return sub_24F97CAF0(*v0);
}

uint64_t sub_24F97CB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97CA28(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F97CB50(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F97CB5C()
{
  sub_24F97CCFC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97CB94()
{
  sub_24F97CCFC();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t Artwork.Size.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BB0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F97CCFC();
  sub_24F98E738();
  sub_24F98E5F8();
  if (!v1) {
    sub_24F98E5F8();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

unint64_t sub_24F97CCFC()
{
  unint64_t result = qword_269A3FFE0;
  if (!qword_269A3FFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A3FFE0);
  }
  return result;
}

void Artwork.Size.init(from:)()
{
  OUTLINED_FUNCTION_7_7();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BB8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F97CCFC();
  sub_24F98E728();
  if (!v0)
  {
    sub_24F98E508();
    uint64_t v7 = v6;
    sub_24F98E508();
    uint64_t v9 = v8;
    uint64_t v10 = OUTLINED_FUNCTION_12_8();
    v11(v10);
    *uint64_t v4 = v7;
    v4[1] = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_11_8();
}

void sub_24F97CE8C()
{
}

uint64_t sub_24F97CEA4(void *a1)
{
  return Artwork.Size.encode(to:)(a1);
}

uint64_t Artwork.ref.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

__n128 Artwork.sourceImageSize.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

uint64_t Artwork.backgroundColor.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t Artwork.textColor1.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t Artwork.textColor2.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t Artwork.textColor3.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t Artwork.textColor4.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

__n128 Artwork.init(ref:sourceImageSize:backgroundColor:textColor1:textColor2:textColor3:textColor4:)@<Q0>(void *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10, uint64_t a11, uint64_t a12)
{
  __n128 result = a10;
  uint64_t v13 = a1[1];
  *(void *)a9 = *a1;
  *(void *)(a9 + 8) = v13;
  *(_OWORD *)(a9 + 16) = *a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  *(void *)(a9 + 72) = a8;
  *(__n128 *)(a9 + 80) = a10;
  *(void *)(a9 + 96) = a11;
  *(void *)(a9 + 104) = a12;
  return result;
}

uint64_t sub_24F97CFE0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6710642 && a2 == 0xE300000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D49656372756F73 && a2 == 0xEF657A6953656761;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x756F72676B636162 && a2 == 0xEF726F6C6F43646ELL;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6F6C6F4374786574 && a2 == 0xEA00000000003172;
        if (v8 || (OUTLINED_FUNCTION_15_7(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6F6C6F4374786574 && a2 == 0xEA00000000003272;
          if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6F6C6F4374786574 && a2 == 0xEA00000000003372;
            if (v10 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0x6F6C6F4374786574 && a2 == 0xEA00000000003472)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              char v12 = OUTLINED_FUNCTION_5_1();
              swift_bridgeObjectRelease();
              if (v12) {
                return 6;
              }
              else {
                return 7;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_24F97D258(char a1)
{
  uint64_t result = 6710642;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6D49656372756F73;
      break;
    case 2:
      uint64_t result = 0x756F72676B636162;
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_15_7();
      break;
    case 4:
    case 5:
    case 6:
      uint64_t result = OUTLINED_FUNCTION_6_9();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F97D33C()
{
  return sub_24F97D258(*v0);
}

uint64_t sub_24F97D344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97CFE0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F97D36C(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_24F97D378()
{
  sub_24F97D624();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97D3B0()
{
  sub_24F97D624();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void Artwork.encode(to:)()
{
  OUTLINED_FUNCTION_7_7();
  int v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BC0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F97D624();
  sub_24F98E738();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
  sub_24F97DAE4(&qword_269A353A0);
  sub_24F98E628();
  if (!v0)
  {
    sub_24F97D670();
    sub_24F98E628();
    OUTLINED_FUNCTION_10_7(2);
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_10_7(3);
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_10_7(4);
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_10_7(5);
    OUTLINED_FUNCTION_4_9();
    OUTLINED_FUNCTION_10_7(6);
    OUTLINED_FUNCTION_4_9();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_11_8();
}

unint64_t sub_24F97D624()
{
  unint64_t result = qword_269A3FFE8[0];
  if (!qword_269A3FFE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A3FFE8);
  }
  return result;
}

unint64_t sub_24F97D670()
{
  unint64_t result = qword_269A35BC8;
  if (!qword_269A35BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35BC8);
  }
  return result;
}

void Artwork.init(from:)()
{
  OUTLINED_FUNCTION_7_7();
  BOOL v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BD0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  BOOL v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F97D624();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35398);
    sub_24F97DAE4(&qword_269A353C0);
    sub_24F98E538();
    uint64_t v12 = v38;
    uint64_t v11 = v39;
    sub_24F97DB2C();
    swift_bridgeObjectRetain();
    sub_24F98E538();
    uint64_t v13 = v38;
    uint64_t v14 = v39;
    LOBYTE(v38) = 2;
    uint64_t v33 = OUTLINED_FUNCTION_3_7();
    uint64_t v34 = v12;
    LOBYTE(v38) = 3;
    uint64_t v37 = v15;
    swift_bridgeObjectRetain();
    uint64_t v16 = OUTLINED_FUNCTION_3_7();
    uint64_t v36 = v17;
    uint64_t v32 = v16;
    LOBYTE(v38) = 4;
    swift_bridgeObjectRetain();
    uint64_t v31 = OUTLINED_FUNCTION_3_7();
    LOBYTE(v38) = 5;
    uint64_t v35 = v18;
    swift_bridgeObjectRetain();
    uint64_t v29 = OUTLINED_FUNCTION_3_7();
    uint64_t v30 = v19;
    LOBYTE(v38) = 6;
    swift_bridgeObjectRetain();
    uint64_t v20 = OUTLINED_FUNCTION_3_7();
    uint64_t v22 = v21;
    uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v28 = v20;
    v23(v10, v5);
    swift_bridgeObjectRetain();
    uint64_t v24 = v35;
    *uint64_t v4 = v34;
    v4[1] = v11;
    v4[2] = v13;
    v4[3] = v14;
    uint64_t v26 = v36;
    uint64_t v25 = v37;
    v4[4] = v33;
    v4[5] = v25;
    v4[6] = v32;
    v4[7] = v26;
    uint64_t v27 = v30;
    v4[8] = v31;
    v4[9] = v24;
    v4[10] = v29;
    v4[11] = v27;
    v4[12] = v28;
    v4[13] = v22;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_11_8();
}

uint64_t sub_24F97DAE4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35398);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24F97DB2C()
{
  unint64_t result = qword_269A35BD8;
  if (!qword_269A35BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35BD8);
  }
  return result;
}

void sub_24F97DB78()
{
}

void sub_24F97DB90()
{
}

uint64_t destroy for Artwork()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Artwork(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Artwork(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for Artwork(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Artwork(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
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

uint64_t storeEnumTagSinglePayload for Artwork(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for Artwork()
{
}

uint64_t getEnumTagSinglePayload for Artwork.Size(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return OUTLINED_FUNCTION_11_0(*(_DWORD *)a1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Artwork.Size(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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

void type metadata accessor for Artwork.Size()
{
}

unsigned char *sub_24F97DF2C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x24F97DFF4);
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
          unint64_t result = OUTLINED_FUNCTION_62(result, a2 + 6);
        break;
    }
  }
  return result;
}

void type metadata accessor for Artwork.CodingKeys()
{
}

unsigned char *sub_24F97E028(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x24F97E0F0);
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
          unint64_t result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for Artwork.Size.CodingKeys()
{
}

unint64_t sub_24F97E128()
{
  unint64_t result = qword_269A402F0[0];
  if (!qword_269A402F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A402F0);
  }
  return result;
}

unint64_t sub_24F97E178()
{
  unint64_t result = qword_269A40500[0];
  if (!qword_269A40500[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A40500);
  }
  return result;
}

unint64_t sub_24F97E1C8()
{
  unint64_t result = qword_269A40610;
  if (!qword_269A40610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40610);
  }
  return result;
}

unint64_t sub_24F97E218()
{
  unint64_t result = qword_269A40618[0];
  if (!qword_269A40618[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A40618);
  }
  return result;
}

unint64_t sub_24F97E268()
{
  unint64_t result = qword_269A406A0;
  if (!qword_269A406A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A406A0);
  }
  return result;
}

unint64_t sub_24F97E2B8()
{
  unint64_t result = qword_269A406A8[0];
  if (!qword_269A406A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A406A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_24F98E488();
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return sub_24F98E578();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return 0x6F6C6F4374786574;
}

void OUTLINED_FUNCTION_10_7(char a1@<W8>)
{
  *(unsigned char *)(v1 - 112) = a1;
}

uint64_t OUTLINED_FUNCTION_12_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_7()
{
  return 0x6F6C6F4374786574;
}

uint64_t AuthenticationState.ref.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AuthenticationState.isAuthenticated.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

void *AuthenticationState.init(ref:isAuthenticated:)@<X0>(void *result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3 = result[1];
  *(void *)a3 = *result;
  *(void *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 16) = a2;
  return result;
}

uint64_t sub_24F97E410(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6710642 && a2 == 0xE300000000000000;
  if (v2 || (sub_24F98E678() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65687475417369 && a2 == 0xEF64657461636974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_24F98E678();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F97E514(char a1)
{
  if (a1) {
    return 0x6E65687475417369;
  }
  else {
    return 6710642;
  }
}

uint64_t sub_24F97E550()
{
  return sub_24F97E514(*v0);
}

uint64_t sub_24F97E558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97E410(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F97E580(uint64_t a1)
{
  unint64_t v2 = sub_24F97E77C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F97E5BC(uint64_t a1)
{
  unint64_t v2 = sub_24F97E77C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AuthenticationState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BE0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  int v16 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F97E77C();
  sub_24F98E738();
  uint64_t v14 = v10;
  uint64_t v15 = v9;
  char v17 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F97E994(&qword_269A35390);
  uint64_t v11 = v13[1];
  sub_24F98E628();
  if (!v11)
  {
    LOBYTE(v14) = 1;
    sub_24F98E5E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v3);
}

unint64_t sub_24F97E77C()
{
  unint64_t result = qword_269A40730[0];
  if (!qword_269A40730[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A40730);
  }
  return result;
}

uint64_t AuthenticationState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BE8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F97E77C();
  sub_24F98E728();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F97E994(&qword_269A353B8);
  sub_24F98E538();
  swift_bridgeObjectRetain();
  char v6 = sub_24F98E4F8();
  uint64_t v7 = OUTLINED_FUNCTION_74_0();
  v8(v7);
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F97E994(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35388);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F97E9DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AuthenticationState.init(from:)(a1, a2);
}

uint64_t sub_24F97E9F4(void *a1)
{
  return AuthenticationState.encode(to:)(a1);
}

uint64_t sub_24F97EA10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AuthenticationState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AuthenticationState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthenticationState(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 17))
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

uint64_t storeEnumTagSinglePayload for AuthenticationState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationState()
{
  return &type metadata for AuthenticationState;
}

uint64_t dispatch thunk of AuthenticationServiceProtocol.getAuthenticationState(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_24F95B094;
  return v11(a1, a2, a3, a4);
}

uint64_t getEnumTagSinglePayload for AuthenticationState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AuthenticationState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24F97EDD4);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24F97EDFC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationState.CodingKeys()
{
  return &type metadata for AuthenticationState.CodingKeys;
}

unint64_t sub_24F97EE1C()
{
  unint64_t result = qword_269A40940[0];
  if (!qword_269A40940[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A40940);
  }
  return result;
}

unint64_t sub_24F97EE6C()
{
  unint64_t result = qword_269A40A50;
  if (!qword_269A40A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40A50);
  }
  return result;
}

unint64_t sub_24F97EEBC()
{
  unint64_t result = qword_269A40A58[0];
  if (!qword_269A40A58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A40A58);
  }
  return result;
}

uint64_t GameFilters.installedOnly.getter()
{
  return *v0;
}

uint64_t GameFilters.arcadeOnly.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t GameFilters.controllerSupportedOnly.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t GameFilters.leaderboardChallengesSupportedOnly.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t GameFilters.achievementsSupportedOnly.getter()
{
  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t GameFilters.recentlyPlayed.getter()
{
  return *(void *)(v0 + 8);
}

GameServicesProtocols::GameFilters __swiftcall GameFilters.init(installedOnly:arcadeOnly:controllerSupportedOnly:leaderboardChallengesSupportedOnly:achievementsSupportedOnly:recentlyPlayed:)(Swift::Bool installedOnly, Swift::Bool arcadeOnly, Swift::Bool controllerSupportedOnly, Swift::Bool leaderboardChallengesSupportedOnly, Swift::Bool achievementsSupportedOnly, Swift::Double_optional recentlyPlayed)
{
  *(unsigned char *)uint64_t v7 = installedOnly;
  *(unsigned char *)(v7 + 1) = arcadeOnly;
  *(unsigned char *)(v7 + 2) = controllerSupportedOnly;
  *(unsigned char *)(v7 + 3) = leaderboardChallengesSupportedOnly;
  *(unsigned char *)(v7 + 4) = achievementsSupportedOnly;
  *(void *)(v7 + 8) = *(void *)&recentlyPlayed.is_nil;
  *(unsigned char *)(v7 + 16) = v6 & 1;
  result.recentlyPlayed.value = recentlyPlayed.value;
  result.recentlyPlayed.is_nil = arcadeOnly;
  result.installedOnly = installedOnly;
  return result;
}

Swift::Bool __swiftcall GameFilters.evaluate(isInstalled:isArcade:controllerSupported:leaderboardChallengesSupported:achievementsSupported:)(Swift::Bool isInstalled, Swift::Bool isArcade, Swift::Bool controllerSupported, Swift::Bool leaderboardChallengesSupported, Swift::Bool achievementsSupported)
{
  return (*v5 ^ 1 | isInstalled) & (v5[1] ^ 1 | isArcade) & (controllerSupported | ~v5[2]) & (leaderboardChallengesSupported | ~v5[3]) & (achievementsSupported | ~v5[4]) & 1;
}

uint64_t sub_24F97EFA8(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x656C6C6174736E69 && a2 == 0xED0000796C6E4F64;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x6E4F656461637261 && v2 == 0xEA0000000000796CLL;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v3 == 0xD000000000000017 && v2 == 0x800000024F998F90 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (v3 == 0xD000000000000022 && v2 == 0x800000024F998FB0 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (v3 == 0xD000000000000019 && v2 == 0x800000024F998FE0 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      OUTLINED_FUNCTION_41_3();
      if (v4 && v2 == v7)
      {
        OUTLINED_FUNCTION_96_1();
        return 5;
      }
      else
      {
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_42();
        if (v3) {
          return 5;
        }
        else {
          return 6;
        }
      }
    }
  }
}

uint64_t sub_24F97F1DC(char a1)
{
  uint64_t result = 0x656C6C6174736E69;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E4F656461637261;
      break;
    case 2:
      uint64_t result = 0xD000000000000017;
      break;
    case 3:
      uint64_t result = 0xD000000000000022;
      break;
    case 4:
      uint64_t result = 0xD000000000000019;
      break;
    case 5:
      uint64_t result = OUTLINED_FUNCTION_97_1();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F97F2BC()
{
  return sub_24F97F1DC(*v0);
}

uint64_t sub_24F97F2C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97EFA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F97F2EC()
{
  sub_24F97F518();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97F324()
{
  sub_24F97F518();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameFilters.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35BF8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F97F518();
  sub_24F98E738();
  sub_24F98E5E8();
  if (!v0)
  {
    OUTLINED_FUNCTION_89_1();
    OUTLINED_FUNCTION_51_3();
    OUTLINED_FUNCTION_72_3();
    OUTLINED_FUNCTION_51_3();
    OUTLINED_FUNCTION_51_3();
    OUTLINED_FUNCTION_51_3();
    sub_24F98E598();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F97F518()
{
  unint64_t result = qword_269A40AE0;
  if (!qword_269A40AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40AE0);
  }
  return result;
}

void GameFilters.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C00);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F97F518();
  OUTLINED_FUNCTION_113_1();
  sub_24F98E728();
  if (!v0)
  {
    char v6 = OUTLINED_FUNCTION_44_4();
    OUTLINED_FUNCTION_89_1();
    char v7 = OUTLINED_FUNCTION_44_4();
    char v14 = OUTLINED_FUNCTION_44_4();
    char v13 = OUTLINED_FUNCTION_44_4();
    char v12 = OUTLINED_FUNCTION_44_4();
    uint64_t v8 = sub_24F98E4A8();
    char v10 = v9;
    OUTLINED_FUNCTION_83_2();
    v11();
    *(unsigned char *)uint64_t v4 = v6 & 1;
    *(unsigned char *)(v4 + 1) = v7 & 1;
    *(unsigned char *)(v4 + 2) = v14 & 1;
    *(unsigned char *)(v4 + 3) = v13 & 1;
    *(unsigned char *)(v4 + 4) = v12 & 1;
    *(void *)(v4 + 8) = v8;
    *(unsigned char *)(v4 + 16) = v10 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_16();
}

void sub_24F97F760()
{
}

void sub_24F97F778()
{
}

BOOL static GameSortDescriptor.Compared.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GameSortDescriptor.Compared.hash(into:)()
{
  return sub_24F98E708();
}

uint64_t sub_24F97F7D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    OUTLINED_FUNCTION_49_2();
    BOOL v7 = v2 && a2 == v6;
    if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v8 = a1 == 0x616470557473616CLL && a2 == 0xEF65746144646574;
      if (v8 || (OUTLINED_FUNCTION_65_2(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        OUTLINED_FUNCTION_41_3();
        if (v2 && a2 == v9)
        {
          OUTLINED_FUNCTION_96_1();
          return 3;
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_42();
          if (a1) {
            return 3;
          }
          else {
            return 4;
          }
        }
      }
    }
  }
}

uint64_t sub_24F97F940(char a1)
{
  uint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_42_5();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_65_2();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_97_1();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F97F9AC()
{
  return sub_24F97F940(*v0);
}

uint64_t sub_24F97F9B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F97F7D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F97F9DC()
{
  sub_24F97FEF0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97FA14()
{
  sub_24F97FEF0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F97FA4C()
{
  sub_24F97FF88();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97FA84()
{
  sub_24F97FF88();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F97FABC()
{
  sub_24F980020();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97FAF4()
{
  sub_24F980020();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F97FB2C()
{
  sub_24F97FFD4();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97FB64()
{
  sub_24F97FFD4();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F97FB9C()
{
  sub_24F97FF3C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F97FBD4()
{
  sub_24F97FF3C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameSortDescriptor.Compared.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C08);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C10);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_63_2(v6, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C18);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C20);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_28();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C28);
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_29();
  uint64_t v13 = *v0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F97FEF0();
  OUTLINED_FUNCTION_113_1();
  sub_24F98E738();
  switch(v13)
  {
    case 1:
      sub_24F97FFD4();
      OUTLINED_FUNCTION_58_3();
      break;
    case 2:
      sub_24F97FF88();
      OUTLINED_FUNCTION_58_3();
      break;
    case 3:
      sub_24F97FF3C();
      OUTLINED_FUNCTION_58_3();
      break;
    default:
      sub_24F980020();
      sub_24F98E568();
      break;
  }
  OUTLINED_FUNCTION_2_2();
  v15(v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F97FEF0()
{
  unint64_t result = qword_269A40AE8;
  if (!qword_269A40AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40AE8);
  }
  return result;
}

unint64_t sub_24F97FF3C()
{
  unint64_t result = qword_269A40AF0;
  if (!qword_269A40AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40AF0);
  }
  return result;
}

unint64_t sub_24F97FF88()
{
  unint64_t result = qword_269A40AF8;
  if (!qword_269A40AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40AF8);
  }
  return result;
}

unint64_t sub_24F97FFD4()
{
  unint64_t result = qword_269A40B00;
  if (!qword_269A40B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B00);
  }
  return result;
}

unint64_t sub_24F980020()
{
  unint64_t result = qword_269A40B08;
  if (!qword_269A40B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B08);
  }
  return result;
}

uint64_t GameSortDescriptor.Compared.hashValue.getter()
{
  return sub_24F98E718();
}

void GameSortDescriptor.Compared.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  char v55 = v0;
  uint64_t v4 = v3;
  uint64_t v50 = v5;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C30);
  OUTLINED_FUNCTION_0_1();
  uint64_t v51 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_22();
  uint64_t v53 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C38);
  OUTLINED_FUNCTION_0_1();
  uint64_t v48 = v10;
  uint64_t v49 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_63_2(v11, v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C40);
  OUTLINED_FUNCTION_0_1();
  uint64_t v46 = v13;
  uint64_t v47 = v12;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_48_0();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C48);
  OUTLINED_FUNCTION_0_1();
  uint64_t v45 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_28();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C50);
  OUTLINED_FUNCTION_0_1();
  uint64_t v52 = v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F97FEF0();
  uint64_t v22 = v55;
  sub_24F98E728();
  if (v22) {
    goto LABEL_7;
  }
  uint64_t v43 = v2;
  uint64_t v44 = v1;
  uint64_t v41 = v14;
  char v55 = v4;
  uint64_t v23 = sub_24F98E548();
  uint64_t v24 = *(void *)(v23 + 16);
  if (!v24
    || (uint64_t v42 = *(unsigned __int8 *)(v23 + 32),
        sub_24F95548C(1, v24, v23, v23 + 32, 0, (2 * v24) | 1),
        uint64_t v26 = v25,
        unint64_t v28 = v27,
        swift_bridgeObjectRelease(),
        v26 != v28 >> 1))
  {
    sub_24F98E378();
    swift_allocError();
    uint64_t v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
    *uint64_t v30 = &type metadata for GameSortDescriptor.Compared;
    sub_24F98E478();
    sub_24F98E368();
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(void *))(v31 + 104))(v30);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v21, v17);
    uint64_t v4 = v55;
LABEL_7:
    uint64_t v32 = (uint64_t)v4;
    goto LABEL_8;
  }
  switch(v42)
  {
    case 1:
      sub_24F97FFD4();
      OUTLINED_FUNCTION_54_3();
      goto LABEL_12;
    case 2:
      sub_24F97FF88();
      OUTLINED_FUNCTION_54_3();
      goto LABEL_12;
    case 3:
      sub_24F97FF3C();
      sub_24F98E468();
      uint64_t v36 = OUTLINED_FUNCTION_111_1();
      v37(v36);
      swift_unknownObjectRelease();
      uint64_t v38 = OUTLINED_FUNCTION_22_3();
      v39(v38);
      uint64_t v32 = (uint64_t)v55;
      uint64_t v40 = v50;
      goto LABEL_13;
    default:
      sub_24F980020();
      OUTLINED_FUNCTION_54_3();
LABEL_12:
      OUTLINED_FUNCTION_2_2();
      v33();
      swift_unknownObjectRelease();
      uint64_t v34 = OUTLINED_FUNCTION_22_3();
      v35(v34);
      uint64_t v32 = (uint64_t)v55;
      uint64_t v40 = v50;
LABEL_13:
      *uint64_t v40 = v42;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v32);
  OUTLINED_FUNCTION_16();
}

void sub_24F9805A0()
{
}

void sub_24F9805B8()
{
}

void GameSortDescriptor.compared.getter(unsigned char *a1@<X8>)
{
}

uint64_t GameSortDescriptor.order.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

unsigned char *GameSortDescriptor.init(compared:order:)@<X0>(unsigned char *result@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  *a3 = *result;
  a3[1] = a2 & 1;
  return result;
}

uint64_t sub_24F9805F4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x64657261706D6F63 && a2 == 0xE800000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v3 == 0x726564726FLL && v2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_42();
    if (v3) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F9806B8()
{
  return sub_24F98E718();
}

uint64_t sub_24F9806F8(char a1)
{
  if (a1) {
    return 0x726564726FLL;
  }
  else {
    return 0x64657261706D6F63;
  }
}

uint64_t sub_24F98072C()
{
  return sub_24F9806B8();
}

uint64_t sub_24F980734()
{
  return sub_24F9806F8(*v0);
}

uint64_t sub_24F98073C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F9805F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F980764()
{
  sub_24F984300();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F98079C()
{
  sub_24F984300();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameSortDescriptor.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C58);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F984300();
  OUTLINED_FUNCTION_79();
  sub_24F98434C();
  sub_24F98E628();
  if (!v0)
  {
    sub_24F984398();
    sub_24F98E628();
  }
  OUTLINED_FUNCTION_75_2();
  v4();
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_16();
}

void GameSortDescriptor.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14)
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35C70);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v19);
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_24F984300();
  OUTLINED_FUNCTION_113_1();
  sub_24F98E728();
  if (!v14)
  {
    sub_24F9843E4();
    OUTLINED_FUNCTION_6_8();
    sub_24F984430();
    OUTLINED_FUNCTION_6_8();
    OUTLINED_FUNCTION_83_2();
    v20();
    *uint64_t v18 = a14;
    v18[1] = a12;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_16();
}

void sub_24F980A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  GameSortDescriptor.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SBYTE4(vars8), SBYTE5(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_24F980A88()
{
}

uint64_t sub_24F980AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  OUTLINED_FUNCTION_82_2();
  uint64_t v49 = v25;
  *(void *)(v24 + 128) = a23;
  *(void *)(v24 + 136) = v23;
  *(void *)(v24 + 112) = v26;
  *(void *)(v24 + 120) = v27;
  char v29 = *(unsigned char *)(v28 + 16);
  __int16 v31 = *v30;
  uint64_t v33 = *v32;
  uint64_t v34 = v32[1];
  *(_OWORD *)(v24 + 56) = *(_OWORD *)v28;
  *(unsigned char *)(v24 + 72) = v29;
  *(_WORD *)(v24 + 74) = v31;
  *(_OWORD *)(v24 + 80) = *v35;
  *(void *)(v24 + 96) = v33;
  *(void *)(v24 + 104) = v34;
  uint64_t v48 = *(void *)(a23 + 32) + **(int **)(a23 + 32);
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v24 + 144) = v36;
  *uint64_t v36 = v24;
  v36[1] = sub_24F980C04;
  OUTLINED_FUNCTION_80_2();
  return v45(v37, v38, v39, v40, v41, v42, v43, v44, v48, a23 + 32, v49, a12, a13, a14, a15);
}

uint64_t sub_24F980C04()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_44();
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v3 = v2;
  *(void *)(v4 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_24F980FC4;
  }
  else {
    uint64_t v5 = sub_24F980CE8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24F980CE8()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 16);
  *(void *)(v0 + 160) = v2;
  *(_OWORD *)(v0 + 168) = *(_OWORD *)(v0 + 32);
  *(void *)(v0 + 184) = *(void *)(v0 + 48);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 16) + **(int **)(v1 + 16));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24F980DF0;
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 120);
  return v7(v2, v5, v4);
}

uint64_t sub_24F980DF0(uint64_t a1)
{
  OUTLINED_FUNCTION_44();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v7 = v6;
  *(void *)(v5 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = sub_24F980FDC;
  }
  else
  {
    *(void *)(v5 + 208) = a1;
    uint64_t v8 = sub_24F980EEC;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_24F980EEC()
{
  uint64_t v7 = v0;
  uint64_t v1 = v0[26];
  unint64_t v2 = v0[23];
  uint64_t v3 = v0[14];
  v6.n128_u64[0] = v0[22];
  v6.n128_u64[1] = v2;
  sub_24F98447C();
  sub_24F9844C8();
  swift_bridgeObjectRetain();
  Page.init(_:next:)(v1, &v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24F980FC4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24F980FDC()
{
  OUTLINED_FUNCTION_4_6();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t GameHistory.PlayHistory.lastPlayed.getter()
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  uint64_t v0 = OUTLINED_FUNCTION_8_0();
  return v1(v0);
}

uint64_t GameHistory.PlayHistory.init(lastPlayed:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  __n128 v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  return v6(a2, a1, v4);
}

uint64_t sub_24F981118(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x79616C507473616CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_98_1();
    sub_24F98E678();
    OUTLINED_FUNCTION_42();
    char v4 = v2 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F981190()
{
  return sub_24F981650();
}

uint64_t sub_24F9811A8()
{
  return OUTLINED_FUNCTION_98_1();
}

uint64_t sub_24F9811B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_24F981118(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_24F9811E8()
{
  sub_24F984514();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F981220()
{
  sub_24F984514();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t GameHistory.PlayHistory.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CA0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_50_0();
  sub_24F984514();
  sub_24F98E738();
  sub_24F98DFB8();
  sub_24F984580(&qword_269A353A8, MEMORY[0x263F07490]);
  sub_24F98E628();
  OUTLINED_FUNCTION_75_2();
  return v1();
}

void GameHistory.PlayHistory.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  uint64_t v12 = v4;
  sub_24F98DFB8();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CA8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = OUTLINED_FUNCTION_62_2();
  uint64_t v8 = type metadata accessor for GameHistory.PlayHistory(v7);
  uint64_t v9 = OUTLINED_FUNCTION_15_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_46();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F984514();
  sub_24F98E728();
  if (!v0)
  {
    sub_24F984580(&qword_269A353C8, MEMORY[0x263F07490]);
    sub_24F98E538();
    OUTLINED_FUNCTION_2_2();
    v10();
    OUTLINED_FUNCTION_59();
    v11();
    sub_24F98483C(v1, v12, (void (*)(void))type metadata accessor for GameHistory.PlayHistory);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  OUTLINED_FUNCTION_16();
}

void sub_24F981574()
{
}

uint64_t sub_24F98158C()
{
  return GameHistory.PlayHistory.encode(to:)();
}

uint64_t GameHistory.InstallHistory.Source.hash(into:)()
{
  return sub_24F98E708();
}

uint64_t sub_24F9815D0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65726F7453707061 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    sub_24F98E678();
    OUTLINED_FUNCTION_42();
    char v4 = v2 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F981650()
{
  return sub_24F98E718();
}

uint64_t sub_24F98168C()
{
  sub_24F984614();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9816C4()
{
  sub_24F984614();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F9816FC()
{
  return 0x65726F7453707061;
}

uint64_t sub_24F981714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_24F9815D0(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_24F981744()
{
  sub_24F9845C8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F98177C()
{
  sub_24F9845C8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameHistory.InstallHistory.Source.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  char v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CB0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_48_0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CB8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_29();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F9845C8();
  OUTLINED_FUNCTION_113_1();
  sub_24F98E738();
  sub_24F984614();
  sub_24F98E568();
  OUTLINED_FUNCTION_83_2();
  v8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
  OUTLINED_FUNCTION_16();
}

uint64_t GameHistory.InstallHistory.Source.hashValue.getter()
{
  return sub_24F98E718();
}

void GameHistory.InstallHistory.Source.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CC0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_103();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CC8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_46();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F9845C8();
  sub_24F98E728();
  if (v0) {
    goto LABEL_6;
  }
  uint64_t v20 = v1;
  uint64_t v8 = sub_24F98E548();
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9
    || (sub_24F95548C(1, v9, v8, v8 + 32, 0, (2 * v9) | 1),
        uint64_t v11 = v10,
        unint64_t v13 = v12,
        swift_bridgeObjectRelease(),
        v11 != v13 >> 1))
  {
    sub_24F98E378();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
    void *v15 = &type metadata for GameHistory.InstallHistory.Source;
    sub_24F98E478();
    sub_24F98E368();
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(void *))(v16 + 104))(v15);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v5);
LABEL_6:
    uint64_t v19 = (uint64_t)v3;
    goto LABEL_7;
  }
  sub_24F984614();
  sub_24F98E468();
  OUTLINED_FUNCTION_2_2();
  v17();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_2_2();
  v18();
  uint64_t v19 = (uint64_t)v3;
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1(v19);
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_16();
}

uint64_t sub_24F981C14()
{
  return GameHistory.InstallHistory.Source.hashValue.getter();
}

uint64_t sub_24F981C2C()
{
  return GameHistory.InstallHistory.Source.hash(into:)();
}

void sub_24F981C44()
{
}

void sub_24F981C5C()
{
}

uint64_t GameHistory.InstallHistory.lastUpdated.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F984764(v1, a1, &qword_269A354F8);
}

uint64_t GameHistory.InstallHistory.purchaseDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GameHistory.InstallHistory(0);
  return sub_24F984764(v1 + *(int *)(v3 + 24), a1, &qword_269A354F8);
}

uint64_t GameHistory.InstallHistory.isInstalled.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GameHistory.InstallHistory(0) + 28));
}

uint64_t GameHistory.InstallHistory.init(source:lastUpdated:purchaseDate:isInstalled:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  sub_24F9847E0(a1, a4, &qword_269A354F8);
  uint64_t v7 = type metadata accessor for GameHistory.InstallHistory(0);
  uint64_t result = sub_24F9847E0(a2, a4 + *(int *)(v7 + 24), &qword_269A354F8);
  *(unsigned char *)(a4 + *(int *)(v7 + 28)) = a3;
  return result;
}

uint64_t sub_24F981D7C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x616470557473616CLL && v2 == 0xEB00000000646574;
    if (v6 || (OUTLINED_FUNCTION_65_2(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      OUTLINED_FUNCTION_49_2();
      BOOL v8 = v4 && v2 == v7;
      if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (v3 == 0x6C6174736E497369 && v2 == 0xEB0000000064656CLL)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        OUTLINED_FUNCTION_79_3();
        OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_42();
        if (v3) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_24F981EDC(char a1)
{
  uint64_t result = 0x656372756F73;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_65_2();
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_42_5();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_79_3();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F981F4C()
{
  return sub_24F981EDC(*v0);
}

uint64_t sub_24F981F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F981D7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F981F7C()
{
  sub_24F984680();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F981FB4()
{
  sub_24F984680();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameHistory.InstallHistory.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CD0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_50_0();
  sub_24F984680();
  OUTLINED_FUNCTION_79();
  sub_24F9846CC();
  sub_24F98E628();
  if (!v0)
  {
    OUTLINED_FUNCTION_89_1();
    sub_24F98DFB8();
    sub_24F984580(&qword_269A353A8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_74_3();
    type metadata accessor for GameHistory.InstallHistory(0);
    OUTLINED_FUNCTION_72_3();
    OUTLINED_FUNCTION_74_3();
    sub_24F98E5E8();
  }
  OUTLINED_FUNCTION_83_2();
  v2();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_16();
}

void GameHistory.InstallHistory.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  uint64_t v22 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v5 = OUTLINED_FUNCTION_15_0(v4);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  BOOL v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v21 - v9;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CE0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = OUTLINED_FUNCTION_62_2();
  uint64_t v24 = type metadata accessor for GameHistory.InstallHistory(v12);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_22();
  uint64_t v25 = v14;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F984680();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  }
  else
  {
    sub_24F984718();
    sub_24F98E538();
    sub_24F98DFB8();
    OUTLINED_FUNCTION_89_1();
    v21[1] = sub_24F984580(&qword_269A353C8, MEMORY[0x263F07490]);
    sub_24F98E4C8();
    uint64_t v15 = (uint64_t)v10;
    uint64_t v16 = v25;
    sub_24F9847E0(v15, v25, &qword_269A354F8);
    OUTLINED_FUNCTION_72_3();
    sub_24F98E4C8();
    uint64_t v17 = v24;
    sub_24F9847E0((uint64_t)v8, v16 + *(int *)(v24 + 24), &qword_269A354F8);
    char v18 = sub_24F98E4F8();
    uint64_t v19 = OUTLINED_FUNCTION_40_3();
    v20(v19);
    *(unsigned char *)(v16 + *(int *)(v17 + 28)) = v18 & 1;
    sub_24F984930(v16, v22, (void (*)(void))type metadata accessor for GameHistory.InstallHistory);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    sub_24F984990(v16, (void (*)(void))type metadata accessor for GameHistory.InstallHistory);
  }
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_16();
}

void sub_24F982504()
{
}

void sub_24F98251C()
{
}

uint64_t GameHistory.playHistory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24F984764(v1, a1, &qword_269A35CF0);
}

uint64_t GameHistory.installHistory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GameHistory(0);
  return sub_24F984930(v1 + *(int *)(v3 + 20), a1, (void (*)(void))type metadata accessor for GameHistory.InstallHistory);
}

uint64_t GameHistory.ref.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for GameHistory(0) + 24));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t GameHistory.init(ref:playHistory:installHistory:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = type metadata accessor for GameHistory(0);
  uint64_t v10 = (void *)(a4 + *(int *)(v9 + 24));
  *uint64_t v10 = v7;
  v10[1] = v8;
  sub_24F9847E0(a2, a4, &qword_269A35CF0);
  return sub_24F98483C(a3, a4 + *(int *)(v9 + 20), (void (*)(void))type metadata accessor for GameHistory.InstallHistory);
}

uint64_t sub_24F98267C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x7473694879616C70 && a2 == 0xEB0000000079726FLL;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x486C6C6174736E69 && v2 == 0xEE0079726F747369;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v3 == 6710642 && v2 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v3) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_24F9827C8(char a1)
{
  if (!a1) {
    return 0x7473694879616C70;
  }
  if (a1 == 1) {
    return 0x486C6C6174736E69;
  }
  return 6710642;
}

uint64_t sub_24F98282C()
{
  return sub_24F9827C8(*v0);
}

uint64_t sub_24F982834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F98267C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F98285C()
{
  sub_24F98489C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F982894()
{
  sub_24F98489C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t GameHistory.encode(to:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_50_0();
  sub_24F98489C();
  OUTLINED_FUNCTION_79();
  type metadata accessor for GameHistory.PlayHistory(0);
  sub_24F984580(&qword_269A35D00, (void (*)(uint64_t))type metadata accessor for GameHistory.PlayHistory);
  OUTLINED_FUNCTION_91_1();
  sub_24F98E5B8();
  if (!v0)
  {
    type metadata accessor for GameHistory(0);
    type metadata accessor for GameHistory.InstallHistory(0);
    sub_24F984580(&qword_269A35D08, (void (*)(uint64_t))type metadata accessor for GameHistory.InstallHistory);
    sub_24F98E628();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F9848E8(&qword_269A35418);
    OUTLINED_FUNCTION_91_1();
    sub_24F98E628();
  }
  OUTLINED_FUNCTION_75_2();
  return v2();
}

void GameHistory.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v4 = v3;
  uint64_t v16 = v5;
  type metadata accessor for GameHistory.InstallHistory(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_103();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
  uint64_t v8 = OUTLINED_FUNCTION_15_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_22();
  uint64_t v17 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35D10);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_46();
  uint64_t v11 = type metadata accessor for GameHistory(0);
  OUTLINED_FUNCTION_4_2();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F98489C();
  sub_24F98E728();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    type metadata accessor for GameHistory.PlayHistory(0);
    sub_24F984580(&qword_269A35D18, (void (*)(uint64_t))type metadata accessor for GameHistory.PlayHistory);
    sub_24F98E4C8();
    sub_24F9847E0(v17, v2, &qword_269A35CF0);
    LOBYTE(v18) = 1;
    sub_24F984580(&qword_269A35D20, (void (*)(uint64_t))type metadata accessor for GameHistory.InstallHistory);
    sub_24F98E538();
    sub_24F98483C(v0, v2 + *(int *)(v11 + 20), (void (*)(void))type metadata accessor for GameHistory.InstallHistory);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F9848E8(&qword_269A35470);
    sub_24F98E538();
    uint64_t v13 = OUTLINED_FUNCTION_85_0();
    v14(v13);
    uint64_t v15 = (void *)(v2 + *(int *)(v11 + 24));
    void *v15 = v18;
    v15[1] = v19;
    sub_24F984930(v2, v16, (void (*)(void))type metadata accessor for GameHistory);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    sub_24F984990(v2, (void (*)(void))type metadata accessor for GameHistory);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F982EA8()
{
}

uint64_t sub_24F982EC0()
{
  return GameHistory.encode(to:)();
}

uint64_t GameDescription.CompatiblePlatforms.rawValue.getter()
{
  return *(void *)v0;
}

void *sub_24F982EE0()
{
  return &unk_24F9956B0;
}

void *sub_24F982EEC()
{
  return &unk_24F9956B8;
}

void *sub_24F982EF8()
{
  return &unk_24F9956C0;
}

void *sub_24F982F04()
{
  return &unk_24F9956C8;
}

void *sub_24F982F10()
{
  return &unk_24F9956D0;
}

uint64_t sub_24F982F1C()
{
  return OUTLINED_FUNCTION_64_2();
}

uint64_t sub_24F982F54()
{
  return OUTLINED_FUNCTION_81_2();
}

void sub_24F982F84(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  if ((*v2 & a2) != 0) {
    *v2 &= ~a2;
  }
  OUTLINED_FUNCTION_100_1(a1);
}

void sub_24F982FA4(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  *v2 |= a2;
  OUTLINED_FUNCTION_100_1(a1);
}

uint64_t sub_24F982FC0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24F97055C(a1, a2);
}

uint64_t GameDescription.Capabilities.rawValue.getter()
{
  return *(void *)v0;
}

GameServicesProtocols::GameDescription::Capabilities __swiftcall GameDescription.Capabilities.init(rawValue:)(GameServicesProtocols::GameDescription::Capabilities rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void *sub_24F982FE8()
{
  return &unk_24F9956D8;
}

void static GameDescription.Capabilities.leaderboards.getter(void *a1@<X8>)
{
}

void *sub_24F982FFC()
{
  return &unk_24F9956E0;
}

void static GameDescription.Capabilities.leaderboardSets.getter(void *a1@<X8>)
{
}

void *sub_24F983010()
{
  return &unk_24F9956E8;
}

void static GameDescription.Capabilities.achievements.getter(void *a1@<X8>)
{
}

void *sub_24F983024()
{
  return &unk_24F9956F0;
}

void static GameDescription.Capabilities.challenges.getter(void *a1@<X8>)
{
}

void *sub_24F983038()
{
  return &unk_24F9956F8;
}

void static GameDescription.Capabilities.leaderboardChallenges.getter(void *a1@<X8>)
{
}

void *sub_24F98304C()
{
  return &unk_24F995700;
}

void static GameDescription.Capabilities.controller.getter(void *a1@<X8>)
{
}

GameServicesProtocols::GameDescription::Capabilities sub_24F983060(Swift::Int *a1)
{
  return GameDescription.Capabilities.init(rawValue:)(*a1);
}

uint64_t sub_24F983068()
{
  return OUTLINED_FUNCTION_64_2();
}

uint64_t sub_24F9830A0()
{
  return OUTLINED_FUNCTION_81_2();
}

void sub_24F9830D0(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_24F9830EC(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
}

GameServicesProtocols::GameDescription::Capabilities sub_24F983108@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = GameDescription.Capabilities.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_24F983134@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GameDescription.Capabilities.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t GameDescription.name.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t GameDescription.shortName.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t GameDescription.ref.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  *a1 = *(void *)(v1 + 32);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void GameDescription.subscriptions.getter(void *a1@<X8>)
{
}

void GameDescription.capabilities.getter(void *a1@<X8>)
{
}

void GameDescription.compatiblePlatforms.getter(void *a1@<X8>)
{
}

uint64_t GameDescription.artwork.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  uint64_t v4 = v1[11];
  uint64_t v5 = v1[12];
  uint64_t v6 = v1[13];
  uint64_t v7 = v1[14];
  uint64_t v8 = v1[15];
  uint64_t v9 = v1[16];
  uint64_t v10 = v1[17];
  uint64_t v11 = v1[18];
  uint64_t v12 = v1[19];
  uint64_t v13 = v1[20];
  uint64_t v14 = v1[21];
  uint64_t v15 = v1[22];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  a1[7] = v9;
  a1[8] = v10;
  a1[9] = v11;
  a1[10] = v12;
  a1[11] = v13;
  a1[12] = v14;
  a1[13] = v15;
  return sub_24F9849E8(v2, v3);
}

uint64_t GameDescription.categoryName.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

__n128 GameDescription.init(name:shortName:ref:subscriptions:capabilities:compatiblePlatforms:categoryName:artwork:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  long long v12 = *(_OWORD *)(a12 + 16);
  *(_OWORD *)(a9 + 72) = *(_OWORD *)a12;
  *(_OWORD *)(a9 + 88) = v12;
  long long v13 = *(_OWORD *)(a12 + 48);
  *(_OWORD *)(a9 + 104) = *(_OWORD *)(a12 + 32);
  *(_OWORD *)(a9 + 120) = v13;
  long long v14 = *(_OWORD *)(a12 + 80);
  *(_OWORD *)(a9 + 136) = *(_OWORD *)(a12 + 64);
  uint64_t v15 = *a5;
  uint64_t v16 = a5[1];
  uint64_t v17 = *a6;
  uint64_t v18 = *a7;
  uint64_t v19 = *a8;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = v15;
  *(void *)(a9 + 40) = v16;
  *(void *)(a9 + 48) = v17;
  *(void *)(a9 + 56) = v18;
  *(void *)(a9 + 64) = v19;
  *(_OWORD *)(a9 + 152) = v14;
  __n128 result = *(__n128 *)(a12 + 96);
  *(__n128 *)(a9 + 168) = result;
  *(void *)(a9 + 184) = a10;
  *(void *)(a9 + 192) = a11;
  return result;
}

uint64_t sub_24F9832C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D614E74726F6873 && a2 == 0xE900000000000065;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 6710642 && a2 == 0xE300000000000000;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x7069726373627573 && a2 == 0xED0000736E6F6974;
        if (v8 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x696C696261706163 && a2 == 0xEC00000073656974;
          if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000013 && a2 == 0x800000024F999000 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
            if (v10 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x79726F6765746163 && a2 == 0xEC000000656D614ELL)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              OUTLINED_FUNCTION_5_1();
              OUTLINED_FUNCTION_42();
              if (a1) {
                return 7;
              }
              else {
                return 8;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_24F9835CC()
{
  return sub_24F98E718();
}

unint64_t sub_24F98360C(char a1)
{
  unint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6D614E74726F6873;
      break;
    case 2:
      unint64_t result = 6710642;
      break;
    case 3:
      unint64_t result = 0x7069726373627573;
      break;
    case 4:
      unint64_t result = 0x696C696261706163;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0x6B726F77747261;
      break;
    case 7:
      unint64_t result = 0x79726F6765746163;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24F983724()
{
  return sub_24F9835CC();
}

unint64_t sub_24F983740()
{
  return sub_24F98360C(*v0);
}

uint64_t sub_24F983748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F9832C8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F983770()
{
  sub_24F984A6C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9837A8()
{
  sub_24F984A6C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void GameDescription.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35D28);
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_48_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F984A6C();
  sub_24F98E738();
  sub_24F98E5D8();
  if (!v0)
  {
    sub_24F98E578();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F9848E8(&qword_269A35418);
    sub_24F98E628();
    sub_24F970D0C();
    OUTLINED_FUNCTION_59_2();
    sub_24F984AB8();
    OUTLINED_FUNCTION_59_2();
    sub_24F984B04();
    OUTLINED_FUNCTION_59_2();
    sub_24F984B50();
    sub_24F98E5B8();
    sub_24F98E578();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_16();
}

void GameDescription.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  BOOL v2 = v1;
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35D48);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F984A6C();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    OUTLINED_FUNCTION_92_1();
  }
  else
  {
    uint64_t v26 = sub_24F98E4E8();
    LOBYTE(v41) = 1;
    uint64_t v7 = v6;
    swift_bridgeObjectRetain();
    uint64_t v31 = v7;
    uint64_t v25 = sub_24F98E488();
    uint64_t v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35410);
    sub_24F9848E8(&qword_269A35470);
    swift_bridgeObjectRetain();
    sub_24F98E538();
    uint64_t v30 = v9;
    sub_24F971198();
    swift_bridgeObjectRetain();
    sub_24F98E538();
    uint64_t v29 = v42;
    uint64_t v23 = v41;
    sub_24F984C20();
    OUTLINED_FUNCTION_61_2();
    uint64_t v22 = v41;
    sub_24F984C6C();
    OUTLINED_FUNCTION_61_2();
    uint64_t v21 = v41;
    uint64_t v10 = v41;
    LOBYTE(v40[0]) = 6;
    sub_24F984CB8();
    sub_24F98E4C8();
    uint64_t v11 = v45;
    uint64_t v32 = v54;
    uint64_t v33 = v53;
    uint64_t v34 = v52;
    uint64_t v35 = v51;
    uint64_t v18 = v50;
    uint64_t v19 = v49;
    uint64_t v37 = v43;
    uint64_t v38 = v41;
    uint64_t v36 = v42;
    uint64_t v39 = v44;
    uint64_t v20 = v46;
    uint64_t v24 = v47;
    uint64_t v28 = v48;
    sub_24F9849E8(v41, v42);
    uint64_t v12 = sub_24F98E488();
    uint64_t v27 = v45;
    uint64_t v16 = v13;
    uint64_t v17 = v12;
    uint64_t v14 = OUTLINED_FUNCTION_21_4();
    v15(v14);
    v40[0] = v26;
    v40[1] = v31;
    v40[2] = v25;
    v40[3] = v30;
    v40[4] = v23;
    v40[5] = v29;
    v40[6] = v22;
    v40[7] = v21;
    v40[8] = v10;
    v40[9] = v38;
    v40[10] = v36;
    v40[11] = v37;
    v40[12] = v39;
    v40[13] = v11;
    v40[14] = v20;
    v40[15] = v24;
    void v40[16] = v28;
    v40[17] = v19;
    v40[18] = v18;
    v40[19] = v35;
    v40[20] = v34;
    v40[21] = v33;
    v40[22] = v32;
    v40[23] = v17;
    v40[24] = v16;
    sub_24F984D04((uint64_t)v40);
    sub_24F984B9C(v38, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v4, v40, 0xC8uLL);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    uint64_t v41 = v26;
    uint64_t v42 = v31;
    uint64_t v43 = v25;
    uint64_t v44 = v30;
    uint64_t v45 = v23;
    uint64_t v46 = v29;
    uint64_t v47 = v22;
    uint64_t v48 = v21;
    uint64_t v49 = v10;
    uint64_t v50 = v38;
    uint64_t v51 = v36;
    uint64_t v52 = v37;
    uint64_t v53 = v39;
    uint64_t v54 = v27;
    uint64_t v55 = v20;
    uint64_t v56 = v24;
    uint64_t v57 = v28;
    uint64_t v58 = v19;
    uint64_t v59 = v18;
    uint64_t v60 = v35;
    uint64_t v61 = v34;
    uint64_t v62 = v33;
    uint64_t v63 = v32;
    uint64_t v64 = v17;
    uint64_t v65 = v16;
    sub_24F984DDC((uint64_t)&v41);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F9842D0()
{
}

void sub_24F9842E8()
{
}

unint64_t sub_24F984300()
{
  unint64_t result = qword_269A40B10;
  if (!qword_269A40B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B10);
  }
  return result;
}

unint64_t sub_24F98434C()
{
  unint64_t result = qword_269A35C60;
  if (!qword_269A35C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35C60);
  }
  return result;
}

unint64_t sub_24F984398()
{
  unint64_t result = qword_269A35C68;
  if (!qword_269A35C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35C68);
  }
  return result;
}

unint64_t sub_24F9843E4()
{
  unint64_t result = qword_269A35C78;
  if (!qword_269A35C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35C78);
  }
  return result;
}

unint64_t sub_24F984430()
{
  unint64_t result = qword_269A35C80;
  if (!qword_269A35C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35C80);
  }
  return result;
}

unint64_t sub_24F98447C()
{
  unint64_t result = qword_269A35C90;
  if (!qword_269A35C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35C90);
  }
  return result;
}

unint64_t sub_24F9844C8()
{
  unint64_t result = qword_269A35C98;
  if (!qword_269A35C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35C98);
  }
  return result;
}

unint64_t sub_24F984514()
{
  unint64_t result = qword_269A40B18;
  if (!qword_269A40B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B18);
  }
  return result;
}

uint64_t type metadata accessor for GameHistory.PlayHistory(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A41C60);
}

uint64_t sub_24F984580(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24F9845C8()
{
  unint64_t result = qword_269A40B20;
  if (!qword_269A40B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B20);
  }
  return result;
}

unint64_t sub_24F984614()
{
  unint64_t result = qword_269A40B28;
  if (!qword_269A40B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B28);
  }
  return result;
}

uint64_t type metadata accessor for GameHistory.InstallHistory(uint64_t a1)
{
  return sub_24F95558C(a1, qword_269A41C70);
}

unint64_t sub_24F984680()
{
  unint64_t result = qword_269A40B30;
  if (!qword_269A40B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B30);
  }
  return result;
}

unint64_t sub_24F9846CC()
{
  unint64_t result = qword_269A35CD8;
  if (!qword_269A35CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35CD8);
  }
  return result;
}

unint64_t sub_24F984718()
{
  unint64_t result = qword_269A35CE8;
  if (!qword_269A35CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35CE8);
  }
  return result;
}

uint64_t sub_24F984764(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_40();
  v4();
  return a2;
}

uint64_t type metadata accessor for GameHistory(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A41C50);
}

uint64_t sub_24F9847E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v4();
  return a2;
}

uint64_t sub_24F98483C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v4();
  return a2;
}

unint64_t sub_24F98489C()
{
  unint64_t result = qword_269A40B38;
  if (!qword_269A40B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A40B38);
  }
  return result;
}

uint64_t sub_24F9848E8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35410);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F984930(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_40();
  v4();
  return a2;
}

uint64_t sub_24F984990(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_2_2();
  v3();
  return a1;
}

uint64_t sub_24F9849E8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24F984A6C()
{
  unint64_t result = qword_269A40B40[0];
  if (!qword_269A40B40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A40B40);
  }
  return result;
}

unint64_t sub_24F984AB8()
{
  unint64_t result = qword_269A35D30;
  if (!qword_269A35D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D30);
  }
  return result;
}

unint64_t sub_24F984B04()
{
  unint64_t result = qword_269A35D38;
  if (!qword_269A35D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D38);
  }
  return result;
}

unint64_t sub_24F984B50()
{
  unint64_t result = qword_269A35D40;
  if (!qword_269A35D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D40);
  }
  return result;
}

uint64_t sub_24F984B9C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24F984C20()
{
  unint64_t result = qword_269A35D50;
  if (!qword_269A35D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D50);
  }
  return result;
}

unint64_t sub_24F984C6C()
{
  unint64_t result = qword_269A35D58;
  if (!qword_269A35D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D58);
  }
  return result;
}

unint64_t sub_24F984CB8()
{
  unint64_t result = qword_269A35D60;
  if (!qword_269A35D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D60);
  }
  return result;
}

uint64_t sub_24F984D04(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24F9849E8(v4, v3);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24F984DDC(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24F984B9C(v4, v3);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_24F984EB8()
{
  unint64_t result = qword_269A35D68;
  if (!qword_269A35D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D68);
  }
  return result;
}

unint64_t sub_24F984F08()
{
  unint64_t result = qword_269A35D70;
  if (!qword_269A35D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D70);
  }
  return result;
}

unint64_t sub_24F984F58()
{
  unint64_t result = qword_269A35D78;
  if (!qword_269A35D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D78);
  }
  return result;
}

unint64_t sub_24F984FA8()
{
  unint64_t result = qword_269A35D80;
  if (!qword_269A35D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D80);
  }
  return result;
}

unint64_t sub_24F984FF8()
{
  unint64_t result = qword_269A35D88;
  if (!qword_269A35D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D88);
  }
  return result;
}

unint64_t sub_24F985048()
{
  unint64_t result = qword_269A35D90;
  if (!qword_269A35D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D90);
  }
  return result;
}

unint64_t sub_24F985098()
{
  unint64_t result = qword_269A35D98;
  if (!qword_269A35D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35D98);
  }
  return result;
}

unint64_t sub_24F9850E8()
{
  unint64_t result = qword_269A35DA0;
  if (!qword_269A35DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35DA0);
  }
  return result;
}

unint64_t sub_24F985138()
{
  unint64_t result = qword_269A35DA8;
  if (!qword_269A35DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35DA8);
  }
  return result;
}

unint64_t sub_24F985188()
{
  unint64_t result = qword_269A35DB0;
  if (!qword_269A35DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35DB0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GameFilters(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[17]) {
      return OUTLINED_FUNCTION_11_0(*(_DWORD *)a1 + 254);
    }
    unsigned int v3 = *a1;
    BOOL v4 = v3 >= 2;
    int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
    if (!v4) {
      return OUTLINED_FUNCTION_11_0(-1);
    }
  }
  else
  {
    int v5 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v5);
}

unsigned char *storeEnumTagSinglePayload for GameFilters(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    result[16] = 0;
    *(void *)unint64_t result = a2 - 255;
    *((void *)result + 1) = 0;
    if (a3 >= 0xFF) {
      result[17] = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      result[17] = 0;
    }
    if (a2) {
      return OUTLINED_FUNCTION_62(result, a2 + 1);
    }
  }
  return result;
}

void type metadata accessor for GameFilters()
{
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GameSortDescriptor(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_11_0(-1);
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 16)) - 65282);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 16)) - 65282);
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return OUTLINED_FUNCTION_11_0((*a1 | (v4 << 16)) - 65282);
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_11_0(v8);
}

uint64_t storeEnumTagSinglePayload for GameSortDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F9853C4);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          unint64_t result = OUTLINED_FUNCTION_67(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameSortDescriptor()
{
}

void type metadata accessor for GameSortDescriptor.Compared()
{
}

uint64_t dispatch thunk of GameLibraryServiceProtocol.describe(games:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_24F98550C;
  return v9(a1, a2, a3);
}

uint64_t sub_24F98550C()
{
  OUTLINED_FUNCTION_4_6();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_44();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_2_5();
  *unsigned int v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t dispatch thunk of GameLibraryServiceProtocol.listGameHistories(by:sortBy:upTo:after:belongingTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_82_2();
  OUTLINED_FUNCTION_35_3();
  uint64_t v28 = *(void *)(v15 + 24) + **(int **)(v15 + 24);
  uint64_t v29 = v15 + 24;
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v16;
  *uint64_t v16 = v14;
  v16[1] = sub_24F9856C0;
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_80_2();
  return v25(v17, v18, v19, v20, v21, v22, v23, v24, v28, v29, a11, a12, a13, a14);
}

uint64_t sub_24F9856C0()
{
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_44();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_2_5();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t dispatch thunk of GameLibraryServiceProtocol.listGames(by:sortBy:upTo:after:belongingTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  OUTLINED_FUNCTION_82_2();
  OUTLINED_FUNCTION_35_3();
  uint64_t v28 = *(void *)(v15 + 32) + **(int **)(v15 + 32);
  uint64_t v29 = v15 + 32;
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v16;
  *uint64_t v16 = v14;
  v16[1] = sub_24F988930;
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_80_2();
  return v25(v17, v18, v19, v20, v21, v22, v23, v24, v28, v29, a11, a12, a13, a14);
}

void initializeBufferWithCopyOfBuffer for GameHistory()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    uint64_t v5 = type metadata accessor for GameHistory.PlayHistory(0);
    if (OUTLINED_FUNCTION_13_5())
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
      uint64_t v7 = OUTLINED_FUNCTION_15_0(v6);
      OUTLINED_FUNCTION_32_2(v7, v9, *(void *)(v8 + 64));
    }
    else
    {
      sub_24F98DFB8();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v10();
      OUTLINED_FUNCTION_4_10(v3);
    }
    OUTLINED_FUNCTION_23_3();
    if (OUTLINED_FUNCTION_27_4(v0))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v12 = OUTLINED_FUNCTION_15_0(v11);
      OUTLINED_FUNCTION_52_0(v12, v14, *(void *)(v13 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v15();
      OUTLINED_FUNCTION_55(v5);
    }
    if (OUTLINED_FUNCTION_19_3())
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v17 = OUTLINED_FUNCTION_15_0(v16);
      OUTLINED_FUNCTION_84_1(v17, v19, *(void *)(v18 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v20();
      OUTLINED_FUNCTION_55(v1);
    }
    OUTLINED_FUNCTION_50_3();
  }
  OUTLINED_FUNCTION_35_0();
}

uint64_t destroy for GameHistory(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GameHistory.PlayHistory(0);
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
  {
    sub_24F98DFB8();
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(uint64_t))(v5 + 8))(a1);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_24F98DFB8();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = v6 + *(int *)(type metadata accessor for GameHistory.InstallHistory(0) + 24);
  if (!__swift_getEnumTagSinglePayload(v9, 1, v7))
  {
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v7);
  }
  return swift_bridgeObjectRelease();
}

void initializeWithCopy for GameHistory()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for GameHistory.PlayHistory(0);
  if (OUTLINED_FUNCTION_13_5())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
    uint64_t v6 = OUTLINED_FUNCTION_15_0(v5);
    OUTLINED_FUNCTION_32_2(v6, v8, *(void *)(v7 + 64));
  }
  else
  {
    sub_24F98DFB8();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_40();
    v9();
    OUTLINED_FUNCTION_4_10(v3);
  }
  OUTLINED_FUNCTION_23_3();
  if (OUTLINED_FUNCTION_27_4(v0))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
    OUTLINED_FUNCTION_52_0(v11, v13, *(void *)(v12 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_40();
    v14();
    OUTLINED_FUNCTION_55(v4);
  }
  if (OUTLINED_FUNCTION_19_3())
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v16 = OUTLINED_FUNCTION_15_0(v15);
    OUTLINED_FUNCTION_84_1(v16, v18, *(void *)(v17 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_40();
    v19();
    OUTLINED_FUNCTION_55(v1);
  }
  OUTLINED_FUNCTION_50_3();
  OUTLINED_FUNCTION_35_0();
}

void assignWithCopy for GameHistory()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for GameHistory.PlayHistory(0);
  int v9 = OUTLINED_FUNCTION_11_9(v8);
  if (v1)
  {
    if (!v9)
    {
      sub_24F98DFB8();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v10();
      OUTLINED_FUNCTION_4_10(v7);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v9)
  {
    sub_24F984990(v7, (void (*)(void))type metadata accessor for GameHistory.PlayHistory);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
    uint64_t v12 = OUTLINED_FUNCTION_15_0(v11);
    OUTLINED_FUNCTION_32_2(v12, v14, *(void *)(v13 + 64));
    goto LABEL_7;
  }
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v35 + 24))(v7, v5);
LABEL_7:
  uint64_t v15 = OUTLINED_FUNCTION_23_3();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0, 1, v15);
  int v17 = OUTLINED_FUNCTION_27_4(v1);
  if (EnumTagSinglePayload)
  {
    if (!v17)
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v18();
      OUTLINED_FUNCTION_55(v0);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_3_2();
  if (v19)
  {
    OUTLINED_FUNCTION_102_1();
    v20();
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v22 = OUTLINED_FUNCTION_15_0(v21);
    OUTLINED_FUNCTION_52_0(v22, v24, *(void *)(v23 + 64));
    goto LABEL_13;
  }
  uint64_t v36 = OUTLINED_FUNCTION_114_0();
  v37(v36);
LABEL_13:
  int v25 = OUTLINED_FUNCTION_24_4();
  if (!v3)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v27)
    {
      uint64_t v38 = OUTLINED_FUNCTION_110_1();
      v39(v38);
      goto LABEL_19;
    }
    OUTLINED_FUNCTION_102_1();
    v28();
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v30 = OUTLINED_FUNCTION_15_0(v29);
    OUTLINED_FUNCTION_84_1(v30, v32, *(void *)(v31 + 64));
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_40();
  v26();
  OUTLINED_FUNCTION_55(v2);
LABEL_19:
  OUTLINED_FUNCTION_71_3();
  *uint64_t v34 = *v33;
  v34[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_0();
}

void initializeWithTake for GameHistory()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for GameHistory.PlayHistory(0);
  if (OUTLINED_FUNCTION_13_5())
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
    uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
    OUTLINED_FUNCTION_32_2(v11, v13, *(void *)(v12 + 64));
  }
  else
  {
    sub_24F98DFB8();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_59();
    v14();
    OUTLINED_FUNCTION_4_10(v8);
  }
  OUTLINED_FUNCTION_23_3();
  if (OUTLINED_FUNCTION_27_4(v0))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v16 = OUTLINED_FUNCTION_15_0(v15);
    OUTLINED_FUNCTION_52_0(v16, v18, *(void *)(v17 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_59();
    v19();
    OUTLINED_FUNCTION_55(v9);
  }
  if (OUTLINED_FUNCTION_19_3())
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v21 = OUTLINED_FUNCTION_15_0(v20);
    OUTLINED_FUNCTION_84_1(v21, v23, *(void *)(v22 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_59();
    v24();
    OUTLINED_FUNCTION_55(v2);
  }
  *(unsigned char *)(v9 + *(int *)(v1 + 28)) = *(unsigned char *)(v0 + *(int *)(v1 + 28));
  *(_OWORD *)(v8 + *(int *)(v4 + 24)) = *(_OWORD *)(v6 + *(int *)(v4 + 24));
  OUTLINED_FUNCTION_35_0();
}

void assignWithTake for GameHistory()
{
  OUTLINED_FUNCTION_36_0();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for GameHistory.PlayHistory(0);
  int v9 = OUTLINED_FUNCTION_11_9(v8);
  if (v1)
  {
    if (!v9)
    {
      sub_24F98DFB8();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_59();
      v10();
      OUTLINED_FUNCTION_4_10(v7);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v9)
  {
    sub_24F984990(v7, (void (*)(void))type metadata accessor for GameHistory.PlayHistory);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
    uint64_t v12 = OUTLINED_FUNCTION_15_0(v11);
    OUTLINED_FUNCTION_32_2(v12, v14, *(void *)(v13 + 64));
    goto LABEL_7;
  }
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v37 + 40))(v7, v5);
LABEL_7:
  uint64_t v15 = OUTLINED_FUNCTION_23_3();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0, 1, v15);
  int v17 = OUTLINED_FUNCTION_27_4(v1);
  if (EnumTagSinglePayload)
  {
    if (!v17)
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_59();
      v18();
      OUTLINED_FUNCTION_55(v0);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_3_2();
  if (v19)
  {
    OUTLINED_FUNCTION_102_1();
    v20();
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v22 = OUTLINED_FUNCTION_15_0(v21);
    OUTLINED_FUNCTION_52_0(v22, v24, *(void *)(v23 + 64));
    goto LABEL_13;
  }
  uint64_t v38 = OUTLINED_FUNCTION_114_0();
  v39(v38);
LABEL_13:
  int v25 = OUTLINED_FUNCTION_24_4();
  if (!v3)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v27)
    {
      uint64_t v40 = OUTLINED_FUNCTION_110_1();
      v41(v40);
      goto LABEL_19;
    }
    OUTLINED_FUNCTION_102_1();
    v28();
    goto LABEL_18;
  }
  if (v25)
  {
LABEL_18:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v30 = OUTLINED_FUNCTION_15_0(v29);
    OUTLINED_FUNCTION_84_1(v30, v32, *(void *)(v31 + 64));
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v26();
  OUTLINED_FUNCTION_55(v2);
LABEL_19:
  OUTLINED_FUNCTION_71_3();
  uint64_t v34 = *v33;
  uint64_t v35 = v33[1];
  *uint64_t v36 = v34;
  v36[1] = v35;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_0();
}

uint64_t getEnumTagSinglePayload for GameHistory(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F986368);
}

uint64_t sub_24F986368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  type metadata accessor for GameHistory.InstallHistory(0);
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for GameHistory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F986440);
}

void sub_24F986440()
{
  OUTLINED_FUNCTION_109_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35CF0);
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    type metadata accessor for GameHistory.InstallHistory(0);
    OUTLINED_FUNCTION_3_2();
    if (*(_DWORD *)(v9 + 84) != v3)
    {
      *(void *)(v1 + *(int *)(v2 + 24) + 8) = (v0 - 1);
      return;
    }
    uint64_t v6 = v8;
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }
  __swift_storeEnumTagSinglePayload(v7, v0, v0, v6);
}

void sub_24F9864F4()
{
  sub_24F98721C(319, &qword_269A35DD0, (void (*)(uint64_t))type metadata accessor for GameHistory.PlayHistory);
  if (v0 <= 0x3F)
  {
    uint64_t v1 = type metadata accessor for GameHistory.InstallHistory(319);
    if (v2 <= 0x3F)
    {
      OUTLINED_FUNCTION_5_3(v1);
      swift_initStructMetadata();
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for GameHistory.PlayHistory()
{
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_4_2();
  uint64_t v4 = *v3;
  return v4(v1, v0, v2);
}

uint64_t destroy for GameHistory.PlayHistory()
{
  sub_24F98DFB8();
  OUTLINED_FUNCTION_4_2();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return v1(v0);
}

uint64_t initializeWithCopy for GameHistory.PlayHistory()
{
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_40();
  v1();
  return v0;
}

uint64_t assignWithCopy for GameHistory.PlayHistory()
{
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = OUTLINED_FUNCTION_45_2();
  v2(v1);
  return v0;
}

uint64_t initializeWithTake for GameHistory.PlayHistory()
{
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v1();
  return v0;
}

uint64_t assignWithTake for GameHistory.PlayHistory()
{
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_4_2();
  uint64_t v1 = OUTLINED_FUNCTION_45_2();
  v2(v1);
  return v0;
}

uint64_t getEnumTagSinglePayload for GameHistory.PlayHistory(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F9867C0);
}

uint64_t sub_24F9867C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F98DFB8();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for GameHistory.PlayHistory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F98681C);
}

uint64_t sub_24F98681C()
{
  sub_24F98DFB8();
  uint64_t v0 = OUTLINED_FUNCTION_94_1();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_24F98685C()
{
  uint64_t result = sub_24F98DFB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GameHistory.InstallHistory(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_15_1();
  }
  else
  {
    uint64_t v6 = v4;
    sub_24F98DFB8();
    if (OUTLINED_FUNCTION_13_5())
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v8 = OUTLINED_FUNCTION_15_0(v7);
      OUTLINED_FUNCTION_32_2(v8, v10, *(void *)(v9 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v11();
      OUTLINED_FUNCTION_4_10(a1);
    }
    uint64_t v12 = *(int *)(v6 + 24);
    uint64_t v13 = a1 + v12;
    if (OUTLINED_FUNCTION_18_4(a2 + v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v15 = OUTLINED_FUNCTION_15_0(v14);
      OUTLINED_FUNCTION_73_3(v15, v17, *(void *)(v16 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v18();
      OUTLINED_FUNCTION_4_10(v13);
    }
    *(unsigned char *)(a1 + *(int *)(v6 + 28)) = *(unsigned char *)(a2 + *(int *)(v6 + 28));
  }
  return a1;
}

uint64_t destroy for GameHistory.InstallHistory(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F98DFB8();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v5 = OUTLINED_FUNCTION_45_2();
    v6(v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t result = __swift_getEnumTagSinglePayload(v7, 1, v4);
  if (!result)
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v10(v7, v4);
  }
  return result;
}

uint64_t initializeWithCopy for GameHistory.InstallHistory()
{
  OUTLINED_FUNCTION_26_3();
  if (OUTLINED_FUNCTION_13_5())
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v4 = OUTLINED_FUNCTION_15_0(v3);
    OUTLINED_FUNCTION_32_2(v4, v6, *(void *)(v5 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_40();
    v7();
    OUTLINED_FUNCTION_4_10(v0);
  }
  uint64_t v8 = *(int *)(v2 + 24);
  uint64_t v9 = v0 + v8;
  if (OUTLINED_FUNCTION_18_4(v1 + v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
    OUTLINED_FUNCTION_73_3(v11, v13, *(void *)(v12 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_40();
    v14();
    OUTLINED_FUNCTION_4_10(v9);
  }
  return OUTLINED_FUNCTION_31_3();
}

uint64_t assignWithCopy for GameHistory.InstallHistory()
{
  uint64_t v5 = OUTLINED_FUNCTION_26_3();
  int v6 = OUTLINED_FUNCTION_11_9(v5);
  if (v4)
  {
    if (!v6)
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_40();
      v7();
      OUTLINED_FUNCTION_4_10(v0);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_3_2();
  if (v8)
  {
    OUTLINED_FUNCTION_112_1();
    v9();
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
    OUTLINED_FUNCTION_32_2(v11, v13, *(void *)(v12 + 64));
    goto LABEL_7;
  }
  uint64_t v27 = OUTLINED_FUNCTION_107_1();
  v28(v27);
LABEL_7:
  uint64_t v14 = *(int *)(v2 + 24);
  uint64_t v15 = v0 + v14;
  uint64_t v16 = v1 + v14;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0 + v14, 1, v3);
  int v18 = OUTLINED_FUNCTION_18_4(v16);
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v20)
    {
      uint64_t v29 = OUTLINED_FUNCTION_88_0();
      v30(v29);
      return OUTLINED_FUNCTION_31_3();
    }
    OUTLINED_FUNCTION_112_1();
    v21();
    goto LABEL_12;
  }
  if (v18)
  {
LABEL_12:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v23 = OUTLINED_FUNCTION_15_0(v22);
    OUTLINED_FUNCTION_73_3(v23, v25, *(void *)(v24 + 64));
    return OUTLINED_FUNCTION_31_3();
  }
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_40();
  v19();
  OUTLINED_FUNCTION_4_10(v15);
  return OUTLINED_FUNCTION_31_3();
}

uint64_t initializeWithTake for GameHistory.InstallHistory()
{
  OUTLINED_FUNCTION_26_3();
  if (OUTLINED_FUNCTION_13_5())
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v4 = OUTLINED_FUNCTION_15_0(v3);
    OUTLINED_FUNCTION_32_2(v4, v6, *(void *)(v5 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_59();
    v7();
    OUTLINED_FUNCTION_4_10(v0);
  }
  uint64_t v8 = *(int *)(v2 + 24);
  uint64_t v9 = v0 + v8;
  if (OUTLINED_FUNCTION_18_4(v1 + v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
    OUTLINED_FUNCTION_73_3(v11, v13, *(void *)(v12 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_59();
    v14();
    OUTLINED_FUNCTION_4_10(v9);
  }
  return OUTLINED_FUNCTION_31_3();
}

uint64_t assignWithTake for GameHistory.InstallHistory()
{
  uint64_t v5 = OUTLINED_FUNCTION_26_3();
  int v6 = OUTLINED_FUNCTION_11_9(v5);
  if (v4)
  {
    if (!v6)
    {
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_59();
      v7();
      OUTLINED_FUNCTION_4_10(v0);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_3_2();
  if (v8)
  {
    OUTLINED_FUNCTION_112_1();
    v9();
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v11 = OUTLINED_FUNCTION_15_0(v10);
    OUTLINED_FUNCTION_32_2(v11, v13, *(void *)(v12 + 64));
    goto LABEL_7;
  }
  uint64_t v27 = OUTLINED_FUNCTION_107_1();
  v28(v27);
LABEL_7:
  uint64_t v14 = *(int *)(v2 + 24);
  uint64_t v15 = v0 + v14;
  uint64_t v16 = v1 + v14;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0 + v14, 1, v3);
  int v18 = OUTLINED_FUNCTION_18_4(v16);
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v20)
    {
      uint64_t v29 = OUTLINED_FUNCTION_88_0();
      v30(v29);
      return OUTLINED_FUNCTION_31_3();
    }
    OUTLINED_FUNCTION_112_1();
    v21();
    goto LABEL_12;
  }
  if (v18)
  {
LABEL_12:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v23 = OUTLINED_FUNCTION_15_0(v22);
    OUTLINED_FUNCTION_73_3(v23, v25, *(void *)(v24 + 64));
    return OUTLINED_FUNCTION_31_3();
  }
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_59();
  v19();
  OUTLINED_FUNCTION_4_10(v15);
  return OUTLINED_FUNCTION_31_3();
}

uint64_t getEnumTagSinglePayload for GameHistory.InstallHistory(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F98704C);
}

uint64_t sub_24F98704C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
    if (v9 >= 2) {
      return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for GameHistory.InstallHistory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F987104);
}

void sub_24F987104()
{
  OUTLINED_FUNCTION_109_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  OUTLINED_FUNCTION_3_2();
  if (*(_DWORD *)(v4 + 84) == v3)
  {
    uint64_t v5 = OUTLINED_FUNCTION_94_1();
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  else
  {
    *(unsigned char *)(v1 + *(int *)(v2 + 28)) = v0 + 1;
  }
}

void sub_24F98717C()
{
  sub_24F98721C(319, (unint64_t *)&qword_269A35618, MEMORY[0x263F07490]);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_5_3(v0);
    swift_initStructMetadata();
  }
}

void sub_24F98721C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24F98E2C8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void type metadata accessor for GameHistory.InstallHistory.Source()
{
}

uint64_t destroy for GameDescription(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GameDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 80) = v7;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    uint64_t v8 = *(void *)(a2 + 112);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(void *)(a1 + 112) = v8;
    uint64_t v9 = *(void *)(a2 + 128);
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a1 + 128) = v9;
    uint64_t v10 = *(void *)(a2 + 144);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = v10;
    uint64_t v11 = *(void *)(a2 + 160);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(void *)(a1 + 160) = v11;
    uint64_t v12 = *(void *)(a2 + 176);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 72), (const void *)(a2 + 72), 0x70uLL);
  }
  uint64_t v13 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GameDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  OUTLINED_FUNCTION_105_1();
  uint64_t v6 = *(void *)(a2 + 80);
  if (!*(void *)(a1 + 80))
  {
    if (v6)
    {
      OUTLINED_FUNCTION_103_1();
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(void *)(a1 + 120) = *(void *)(a2 + 120);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
LABEL_7:
    memcpy(v5, v2, 0x70uLL);
    goto LABEL_8;
  }
  if (!v6)
  {
    sub_24F98765C((uint64_t)v5);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_103_1();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24F98765C(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy200_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

uint64_t assignWithTake for GameDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  OUTLINED_FUNCTION_105_1();
  if (!*(void *)(a1 + 80)) {
    goto LABEL_5;
  }
  uint64_t v9 = *(void *)(a2 + 80);
  if (!v9)
  {
    sub_24F98765C((uint64_t)v2);
LABEL_5:
    memcpy(v2, v3, 0x70uLL);
    goto LABEL_6;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v14;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v15 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GameDescription(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 200))
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

uint64_t storeEnumTagSinglePayload for GameDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for GameDescription()
{
}

void type metadata accessor for GameDescription.CompatiblePlatforms()
{
}

void type metadata accessor for GameDescription.Capabilities()
{
}

unsigned char *sub_24F987898(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F987954);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 7);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameDescription.CodingKeys()
{
}

unsigned char *sub_24F987988(unsigned char *result, unsigned int a2, unsigned int a3)
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
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F987A44);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 2);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameHistory.CodingKeys()
{
}

void type metadata accessor for GameHistory.InstallHistory.CodingKeys()
{
}

void type metadata accessor for GameHistory.InstallHistory.Source.CodingKeys()
{
}

void type metadata accessor for GameHistory.InstallHistory.Source.AppStoreCodingKeys()
{
}

unsigned char *_s21GameServicesProtocols11GameHistoryV14InstallHistoryV6SourceOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F987B38);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for GameHistory.PlayHistory.CodingKeys()
{
}

unsigned char *sub_24F987B6C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F987C28);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameSortDescriptor.CodingKeys()
{
}

unsigned char *_s21GameServicesProtocols18GameSortDescriptorV8ComparedOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F987D18);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 3);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameSortDescriptor.Compared.CodingKeys()
{
}

void type metadata accessor for GameSortDescriptor.Compared.NameCodingKeys()
{
}

void type metadata accessor for GameSortDescriptor.Compared.PurchaseDateCodingKeys()
{
}

void type metadata accessor for GameSortDescriptor.Compared.LastUpdatedDateCodingKeys()
{
}

void type metadata accessor for GameSortDescriptor.Compared.RecentlyPlayedCodingKeys()
{
}

unsigned char *sub_24F987D7C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F987E38);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 5);
        break;
    }
  }
  return result;
}

void type metadata accessor for GameFilters.CodingKeys()
{
}

unint64_t sub_24F987E70()
{
  unint64_t result = qword_269A41D80[0];
  if (!qword_269A41D80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A41D80);
  }
  return result;
}

unint64_t sub_24F987EC0()
{
  unint64_t result = qword_269A42390[0];
  if (!qword_269A42390[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A42390);
  }
  return result;
}

unint64_t sub_24F987F10()
{
  unint64_t result = qword_269A425A0[0];
  if (!qword_269A425A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A425A0);
  }
  return result;
}

unint64_t sub_24F987F60()
{
  unint64_t result = qword_269A427B0[0];
  if (!qword_269A427B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A427B0);
  }
  return result;
}

unint64_t sub_24F987FB0()
{
  unint64_t result = qword_269A42AC0[0];
  if (!qword_269A42AC0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A42AC0);
  }
  return result;
}

unint64_t sub_24F988000()
{
  unint64_t result = qword_269A42CD0[0];
  if (!qword_269A42CD0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A42CD0);
  }
  return result;
}

unint64_t sub_24F988050()
{
  unint64_t result = qword_269A42EE0[0];
  if (!qword_269A42EE0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A42EE0);
  }
  return result;
}

unint64_t sub_24F9880A0()
{
  unint64_t result = qword_269A430F0;
  if (!qword_269A430F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A430F0);
  }
  return result;
}

unint64_t sub_24F9880F0()
{
  unint64_t result = qword_269A43200;
  if (!qword_269A43200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43200);
  }
  return result;
}

unint64_t sub_24F988140()
{
  unint64_t result = qword_269A43208[0];
  if (!qword_269A43208[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43208);
  }
  return result;
}

unint64_t sub_24F988190()
{
  unint64_t result = qword_269A43290;
  if (!qword_269A43290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43290);
  }
  return result;
}

unint64_t sub_24F9881E0()
{
  unint64_t result = qword_269A43298[0];
  if (!qword_269A43298[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43298);
  }
  return result;
}

unint64_t sub_24F988230()
{
  unint64_t result = qword_269A43320;
  if (!qword_269A43320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43320);
  }
  return result;
}

unint64_t sub_24F988280()
{
  unint64_t result = qword_269A43328[0];
  if (!qword_269A43328[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43328);
  }
  return result;
}

unint64_t sub_24F9882D0()
{
  unint64_t result = qword_269A433B0;
  if (!qword_269A433B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A433B0);
  }
  return result;
}

unint64_t sub_24F988320()
{
  unint64_t result = qword_269A433B8[0];
  if (!qword_269A433B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A433B8);
  }
  return result;
}

unint64_t sub_24F988370()
{
  unint64_t result = qword_269A43440;
  if (!qword_269A43440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43440);
  }
  return result;
}

unint64_t sub_24F9883C0()
{
  unint64_t result = qword_269A43448[0];
  if (!qword_269A43448[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43448);
  }
  return result;
}

unint64_t sub_24F988410()
{
  unint64_t result = qword_269A434D0;
  if (!qword_269A434D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A434D0);
  }
  return result;
}

unint64_t sub_24F988460()
{
  unint64_t result = qword_269A434D8[0];
  if (!qword_269A434D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A434D8);
  }
  return result;
}

unint64_t sub_24F9884B0()
{
  unint64_t result = qword_269A43560;
  if (!qword_269A43560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43560);
  }
  return result;
}

unint64_t sub_24F988500()
{
  unint64_t result = qword_269A43568[0];
  if (!qword_269A43568[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43568);
  }
  return result;
}

unint64_t sub_24F988550()
{
  unint64_t result = qword_269A435F0;
  if (!qword_269A435F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A435F0);
  }
  return result;
}

unint64_t sub_24F9885A0()
{
  unint64_t result = qword_269A435F8[0];
  if (!qword_269A435F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A435F8);
  }
  return result;
}

unint64_t sub_24F9885F0()
{
  unint64_t result = qword_269A43680;
  if (!qword_269A43680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43680);
  }
  return result;
}

unint64_t sub_24F988640()
{
  unint64_t result = qword_269A43688[0];
  if (!qword_269A43688[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43688);
  }
  return result;
}

unint64_t sub_24F988690()
{
  unint64_t result = qword_269A43710;
  if (!qword_269A43710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43710);
  }
  return result;
}

unint64_t sub_24F9886E0()
{
  unint64_t result = qword_269A43718[0];
  if (!qword_269A43718[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43718);
  }
  return result;
}

unint64_t sub_24F988730()
{
  unint64_t result = qword_269A437A0;
  if (!qword_269A437A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A437A0);
  }
  return result;
}

unint64_t sub_24F988780()
{
  unint64_t result = qword_269A437A8[0];
  if (!qword_269A437A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A437A8);
  }
  return result;
}

unint64_t sub_24F9887D0()
{
  unint64_t result = qword_269A43830;
  if (!qword_269A43830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43830);
  }
  return result;
}

unint64_t sub_24F988820()
{
  unint64_t result = qword_269A43838[0];
  if (!qword_269A43838[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43838);
  }
  return result;
}

unint64_t sub_24F988870()
{
  unint64_t result = qword_269A438C0;
  if (!qword_269A438C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A438C0);
  }
  return result;
}

unint64_t sub_24F9888C0()
{
  unint64_t result = qword_269A438C8[0];
  if (!qword_269A438C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A438C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_10(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_11_9(uint64_t a1)
{
  __swift_getEnumTagSinglePayload(v1, 1, a1);
  return __swift_getEnumTagSinglePayload(v2, 1, a1);
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_18_4(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  uint64_t v2 = *(int *)(type metadata accessor for GameHistory.InstallHistory(0) + 24);
  return __swift_getEnumTagSinglePayload(v0 + v2, 1, v1);
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  uint64_t v3 = *(int *)(type metadata accessor for GameHistory.InstallHistory(0) + 24);
  uint64_t v4 = v1 + v3;
  __swift_getEnumTagSinglePayload(v0 + v3, 1, v2);
  return __swift_getEnumTagSinglePayload(v4, 1, v2);
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  *(void *)(v2 + 16) = v0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_27_4(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_31_3()
{
  *(unsigned char *)(v0 + *(int *)(v2 + 28)) = *(unsigned char *)(v1 + *(int *)(v2 + 28));
  return v0;
}

void *OUTLINED_FUNCTION_32_2(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_42_5()
{
  return 0x6573616863727570;
}

uint64_t OUTLINED_FUNCTION_44_4()
{
  return sub_24F98E4F8();
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_3()
{
  *(unsigned char *)(v3 + *(int *)(v5 + 28)) = *(unsigned char *)(v4 + *(int *)(v5 + 28));
  uint64_t v7 = *(int *)(v2 + 24);
  uint64_t v8 = (void *)(v0 + v7);
  uint64_t v9 = (void *)(v1 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_51_3()
{
  return sub_24F98E5E8();
}

uint64_t OUTLINED_FUNCTION_54_3()
{
  return sub_24F98E468();
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  return sub_24F98E568();
}

uint64_t OUTLINED_FUNCTION_59_2()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_61_2()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return 0;
}

void OUTLINED_FUNCTION_63_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_64_2()
{
  return sub_24F98E118();
}

uint64_t OUTLINED_FUNCTION_65_2()
{
  return 0x616470557473616CLL;
}

void OUTLINED_FUNCTION_71_3()
{
  *(unsigned char *)(v0 + *(int *)(v2 + 28)) = *(unsigned char *)(v1 + *(int *)(v2 + 28));
}

void OUTLINED_FUNCTION_72_3()
{
  *(unsigned char *)(v0 - 67) = 2;
}

void *OUTLINED_FUNCTION_73_3(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_74_3()
{
  return sub_24F98E5B8();
}

uint64_t OUTLINED_FUNCTION_76_3()
{
  return sub_24F98E6F8();
}

uint64_t OUTLINED_FUNCTION_79_3()
{
  return 0x6C6174736E497369;
}

uint64_t OUTLINED_FUNCTION_81_2()
{
  return sub_24F98E0C8();
}

void *OUTLINED_FUNCTION_84_1(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_85_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_88_0()
{
  return v0;
}

void OUTLINED_FUNCTION_89_1()
{
  *(unsigned char *)(v0 - 66) = 1;
}

uint64_t OUTLINED_FUNCTION_92_1()
{
  return *(void *)(v0 + 192);
}

uint64_t OUTLINED_FUNCTION_94_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_96_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_97_1()
{
  return 0x796C746E65636572;
}

uint64_t OUTLINED_FUNCTION_98_1()
{
  return 0x79616C507473616CLL;
}

void OUTLINED_FUNCTION_100_1(uint64_t a1@<X8>)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t OUTLINED_FUNCTION_103_1()
{
  *(void *)(v0 + 72) = *(void *)(v1 + 72);
  uint64_t result = *(void *)(v1 + 80);
  *(void *)(v0 + 80) = result;
  return result;
}

void OUTLINED_FUNCTION_105_1()
{
  *(void *)(v0 + 64) = *(void *)(v1 + 64);
}

uint64_t OUTLINED_FUNCTION_107_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_110_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_111_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_114_0()
{
  return v0;
}

uint64_t sub_24F98907C()
{
  OUTLINED_FUNCTION_77_3();
  BOOL v5 = v3 == v4 && v2 == 0xE700000000000000;
  if (v5 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v1 == 0x726579616C70 && v0 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_42();
    if (v1) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24F989134(char a1)
{
  if (a1) {
    return 0x726579616C70;
  }
  else {
    return 0x746361746E6F63;
  }
}

uint64_t sub_24F989168()
{
  return sub_24F989134(*v0);
}

uint64_t sub_24F989170@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F98907C();
  *a1 = result;
  return result;
}

uint64_t sub_24F989198()
{
  sub_24F98959C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9891D0()
{
  sub_24F98959C();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F989208()
{
  sub_24F989634();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F989240()
{
  sub_24F989634();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t sub_24F989278()
{
  sub_24F9895E8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F9892B0()
{
  sub_24F9895E8();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

void PersonHandle.encode(to:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35DD8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_3_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35DE0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35DE8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_48_0();
  uint64_t v9 = *(unsigned __int8 *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F98959C();
  sub_24F98E738();
  if (v9)
  {
    sub_24F9895E8();
    OUTLINED_FUNCTION_69();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
  }
  else
  {
    sub_24F989634();
    OUTLINED_FUNCTION_69();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    sub_24F949E34(&qword_269A359F0, &qword_269A35750);
  }
  sub_24F98E628();
  OUTLINED_FUNCTION_2_2();
  v10();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v9);
  OUTLINED_FUNCTION_16();
}

unint64_t sub_24F98959C()
{
  unint64_t result = qword_269A43950;
  if (!qword_269A43950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43950);
  }
  return result;
}

unint64_t sub_24F9895E8()
{
  unint64_t result = qword_269A43958;
  if (!qword_269A43958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43958);
  }
  return result;
}

unint64_t sub_24F989634()
{
  unint64_t result = qword_269A43960;
  if (!qword_269A43960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43960);
  }
  return result;
}

void PersonHandle.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v2 = v1;
  uint64_t v26 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35DF0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_48_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35DF8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_3_1();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E00);
  OUTLINED_FUNCTION_0_1();
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_1();
  uint64_t v11 = v10 - v9;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_24F98959C();
  sub_24F98E728();
  if (v0) {
    goto LABEL_6;
  }
  uint64_t v12 = sub_24F98E548();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13
    || (char v14 = *(unsigned char *)(v12 + 32),
        sub_24F95548C(1, v13, v12, v12 + 32, 0, (2 * v13) | 1),
        uint64_t v16 = v15,
        unint64_t v18 = v17,
        swift_bridgeObjectRelease(),
        v16 != v18 >> 1))
  {
    sub_24F98E378();
    swift_allocError();
    int v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35468);
    *int v20 = &type metadata for PersonHandle;
    sub_24F98E478();
    sub_24F98E368();
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(void *))(v21 + 104))(v20);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v11, v6);
LABEL_6:
    uint64_t v25 = (uint64_t)v2;
    goto LABEL_7;
  }
  LOBYTE(v28) = 1;
  sub_24F9895E8();
  OUTLINED_FUNCTION_41_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
  sub_24F949E34(&qword_269A353B8, &qword_269A35388);
  sub_24F98E538();
  OUTLINED_FUNCTION_2_2();
  v22();
  swift_unknownObjectRelease();
  uint64_t v23 = OUTLINED_FUNCTION_6_5();
  v24(v23);
  *(void *)uint64_t v26 = v28;
  *(void *)(v26 + 8) = v29;
  *(unsigned char *)(v26 + 16) = v14;
  uint64_t v25 = (uint64_t)v2;
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1(v25);
  OUTLINED_FUNCTION_16();
}

void sub_24F989B74()
{
}

void sub_24F989B8C()
{
}

uint64_t FriendRequest.senderHandles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FriendRequest.recipient.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 16), a1);
}

uint64_t FriendRequest.addressedToContact.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t FriendRequest.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FriendRequest(0) + 28);
  return sub_24F95511C(v3, a1);
}

uint64_t FriendRequest.init(senderHandles:recipient:addressedToContact:date:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = v7;
  *(void *)(a5 + 16) = v8;
  *(unsigned char *)(a5 + 24) = a3;
  uint64_t v9 = a5 + *(int *)(type metadata accessor for FriendRequest(0) + 28);
  return sub_24F955184(a4, v9);
}

uint64_t sub_24F989C58(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 0x61487265646E6573 && a2 == 0xED000073656C646ELL;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x6E65697069636572 && v2 == 0xE900000000000074;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v3 == 0xD000000000000012 && v2 == 0x800000024F999040 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (v3 == 1702125924 && v2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_42();
      if (v3) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_24F989DE8(char a1)
{
  unint64_t result = 0x61487265646E6573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E65697069636572;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 1702125924;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F989E88()
{
  return sub_24F989DE8(*v0);
}

uint64_t sub_24F989E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F989C58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F989EB8()
{
  sub_24F98B5B0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F989EF0()
{
  sub_24F98B5B0();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t FriendRequest.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E08);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F98B5B0();
  OUTLINED_FUNCTION_79();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E10);
  sub_24F98B648(&qword_269A35E18, (void (*)(void))sub_24F98B5FC);
  OUTLINED_FUNCTION_73_4();
  OUTLINED_FUNCTION_28_4();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A35390, &qword_269A35388);
    OUTLINED_FUNCTION_73_4();
    OUTLINED_FUNCTION_28_4();
    sub_24F98E588();
    type metadata accessor for FriendRequest(0);
    sub_24F98DFB8();
    sub_24F98B8A0(&qword_269A353A8, MEMORY[0x263F07490]);
    sub_24F98E5B8();
  }
  uint64_t v4 = OUTLINED_FUNCTION_21_0();
  return v5(v4);
}

void FriendRequest.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v6 = OUTLINED_FUNCTION_15_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_48_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E28);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_24_0();
  uint64_t v8 = type metadata accessor for FriendRequest(0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_24F98B5B0();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E10);
    sub_24F98B648(&qword_269A35E30, (void (*)(void))sub_24F98B6B8);
    OUTLINED_FUNCTION_24_5();
    OUTLINED_FUNCTION_63_3();
    sub_24F98E538();
    *(void *)uint64_t v1 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35388);
    sub_24F949E34(&qword_269A353B8, &qword_269A35388);
    sub_24F98E538();
    *(void *)(v1 + 8) = v12;
    *(void *)(v1 + 16) = v13;
    *(unsigned char *)(v1 + 24) = sub_24F98E498();
    sub_24F98DFB8();
    sub_24F98B8A0(&qword_269A353C8, MEMORY[0x263F07490]);
    OUTLINED_FUNCTION_63_3();
    sub_24F98E4C8();
    uint64_t v10 = OUTLINED_FUNCTION_33_2();
    v11(v10);
    sub_24F955184(v2, *(int *)(v8 + 28));
    sub_24F98B8E8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    sub_24F98B940(0, (void (*)(void))type metadata accessor for FriendRequest);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F98A4BC()
{
}

uint64_t sub_24F98A4D4(void *a1)
{
  return FriendRequest.encode(to:)(a1);
}

uint64_t FriendSuggestion.Source.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_24F98E458();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t FriendSuggestion.Source.rawValue.getter()
{
  return 0x7553656C706F6570;
}

uint64_t sub_24F98A568(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 12918;
  }
  else {
    uint64_t v2 = 12662;
  }
  if (a2) {
    uint64_t v3 = 12918;
  }
  else {
    uint64_t v3 = 12662;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_24F98E678();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_24F98A5D4()
{
  return sub_24F98E718();
}

uint64_t sub_24F98A634()
{
  return sub_24F98A6AC();
}

uint64_t sub_24F98A644()
{
  return sub_24F98E038();
}

uint64_t sub_24F98A668()
{
  sub_24F98E038();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F98A6AC()
{
  return sub_24F98E718();
}

uint64_t sub_24F98A708()
{
  return sub_24F98E718();
}

uint64_t sub_24F98A764@<X0>(BOOL *a1@<X8>)
{
  return FriendSuggestion.Source.init(rawValue:)(a1);
}

void sub_24F98A770(void *a1@<X8>)
{
  *a1 = 0x7553656C706F6570;
  a1[1] = 0xEF72657473656767;
}

uint64_t sub_24F98A798()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F98A7D0()
{
  return OUTLINED_FUNCTION_98();
}

GameServicesProtocols::FriendSuggestion::FriendingProtocolVersion_optional __swiftcall FriendSuggestion.FriendingProtocolVersion.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_24F98E458();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t FriendSuggestion.FriendingProtocolVersion.rawValue.getter()
{
  if (*v0) {
    return 12918;
  }
  else {
    return 12662;
  }
}

uint64_t sub_24F98A880(char *a1, char *a2)
{
  return sub_24F98A568(*a1, *a2);
}

uint64_t sub_24F98A88C()
{
  return sub_24F98A634();
}

uint64_t sub_24F98A894()
{
  return sub_24F98A668();
}

uint64_t sub_24F98A89C()
{
  return sub_24F98A6AC();
}

GameServicesProtocols::FriendSuggestion::FriendingProtocolVersion_optional sub_24F98A8A4(Swift::String *a1)
{
  return FriendSuggestion.FriendingProtocolVersion.init(rawValue:)(*a1);
}

uint64_t sub_24F98A8B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FriendSuggestion.FriendingProtocolVersion.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE200000000000000;
  return result;
}

uint64_t sub_24F98A8DC()
{
  return OUTLINED_FUNCTION_83();
}

uint64_t sub_24F98A914()
{
  return OUTLINED_FUNCTION_98();
}

uint64_t FriendSuggestion.ref.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_1(*(void *)(v1 + 8), a1);
}

void FriendSuggestion.supportedProtocolVersion.getter(unsigned char *a1@<X8>)
{
}

uint64_t FriendSuggestion.avatar.getter()
{
  type metadata accessor for FriendSuggestion(0);
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v0 = OUTLINED_FUNCTION_8_0();
  return v1(v0);
}

uint64_t FriendSuggestion.contact.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for FriendSuggestion(0) + 32));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t FriendSuggestion.handle.getter()
{
  return OUTLINED_FUNCTION_8_0();
}

uint64_t FriendSuggestion.init(ref:source:supportedProtocolVersion:avatar:contact:handle:)@<X0>(void *a1@<X0>, char *a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v11 = a1[1];
  char v12 = *a2;
  uint64_t v13 = *a4;
  uint64_t v14 = a4[1];
  *(void *)a7 = *a1;
  *(void *)(a7 + 8) = v11;
  *(unsigned char *)(a7 + 16) = v12;
  uint64_t v15 = (int *)type metadata accessor for FriendSuggestion(0);
  uint64_t v16 = a7 + v15[7];
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 32))(v16, a3);
  int v19 = (void *)(a7 + v15[9]);
  *int v19 = a5;
  v19[1] = a6;
  int v20 = (void *)(a7 + v15[8]);
  *int v20 = v13;
  v20[1] = v14;
  return result;
}

uint64_t sub_24F98AB00(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 6710642 && a2 == 0xE300000000000000;
  if (v4 || (OUTLINED_FUNCTION_113(), (OUTLINED_FUNCTION_5_1() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = v3 == 0x656372756F73 && v2 == 0xE600000000000000;
    if (v6 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (v3 == 0xD000000000000018 && v2 == 0x800000024F999060 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = v3 == 0x726174617661 && v2 == 0xE600000000000000;
      if (v7 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        OUTLINED_FUNCTION_77_3();
        BOOL v9 = v3 == v8 && v2 == 0xE700000000000000;
        if (v9 || (OUTLINED_FUNCTION_5_1() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (v3 == 0x656C646E6168 && v2 == 0xE600000000000000)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          OUTLINED_FUNCTION_5_1();
          OUTLINED_FUNCTION_42();
          if (v3) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

unint64_t sub_24F98ACE4(char a1)
{
  unint64_t result = 6710642;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656372756F73;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0x726174617661;
      break;
    case 4:
      unint64_t result = 0x746361746E6F63;
      break;
    case 5:
      unint64_t result = 0x656C646E6168;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24F98ADA0()
{
  return sub_24F98ACE4(*v0);
}

uint64_t sub_24F98ADA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F98AB00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F98ADD0()
{
  sub_24F98B724();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B0](v0, v1);
}

uint64_t sub_24F98AE08()
{
  sub_24F98B724();
  uint64_t v0 = OUTLINED_FUNCTION_5_2();
  return MEMORY[0x270FA00B8](v0, v1);
}

uint64_t FriendSuggestion.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E40);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F98B724();
  OUTLINED_FUNCTION_79();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35958);
  sub_24F949E34(&qword_269A35E48, &qword_269A35958);
  OUTLINED_FUNCTION_49_3();
  OUTLINED_FUNCTION_28_4();
  if (!v1)
  {
    sub_24F98B770();
    OUTLINED_FUNCTION_28_4();
    sub_24F98B7BC();
    OUTLINED_FUNCTION_49_3();
    OUTLINED_FUNCTION_28_4();
    type metadata accessor for FriendSuggestion(0);
    sub_24F98DFA8();
    sub_24F98B8A0(&qword_269A35E60, MEMORY[0x263F06EA8]);
    OUTLINED_FUNCTION_28_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    sub_24F949E34(&qword_269A359F0, &qword_269A35750);
    OUTLINED_FUNCTION_49_3();
    sub_24F98E5B8();
    sub_24F98E578();
  }
  uint64_t v4 = OUTLINED_FUNCTION_21_0();
  return v5(v4);
}

void FriendSuggestion.init(from:)()
{
  OUTLINED_FUNCTION_14_0();
  uint64_t v3 = v2;
  sub_24F98DFA8();
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v5;
  uint64_t v17 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A35E68);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_1();
  unint64_t v18 = (int *)type metadata accessor for FriendSuggestion(0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_3_1();
  uint64_t v19 = v9 - v8;
  uint64_t v20 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_24F98B724();
  sub_24F98E728();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35958);
    sub_24F949E34(&qword_269A35E70, &qword_269A35958);
    OUTLINED_FUNCTION_24_5();
    sub_24F98E538();
    *(_OWORD *)uint64_t v19 = v21;
    sub_24F98B808();
    OUTLINED_FUNCTION_59_3();
    sub_24F98B854();
    OUTLINED_FUNCTION_59_3();
    *(unsigned char *)(v19 + 16) = 1;
    LOBYTE(v21) = 3;
    sub_24F98B8A0(&qword_269A35E88, MEMORY[0x263F06EA8]);
    sub_24F98E538();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v18[7], v1, v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A35750);
    sub_24F949E34(&qword_269A35A08, &qword_269A35750);
    OUTLINED_FUNCTION_24_5();
    sub_24F98E4C8();
    *(_OWORD *)(v19 + v18[8]) = v21;
    uint64_t v10 = sub_24F98E488();
    uint64_t v12 = v11;
    uint64_t v13 = OUTLINED_FUNCTION_7_8();
    v14(v13);
    uint64_t v15 = (uint64_t *)(v19 + v18[9]);
    uint64_t *v15 = v10;
    v15[1] = v12;
    sub_24F98B8E8();
    __swift_destroy_boxed_opaque_existential_1(v20);
    sub_24F98B940(v19, (void (*)(void))type metadata accessor for FriendSuggestion);
  }
  OUTLINED_FUNCTION_16();
}

void sub_24F98B560()
{
}

uint64_t sub_24F98B578(void *a1)
{
  return FriendSuggestion.encode(to:)(a1);
}

uint64_t type metadata accessor for FriendRequest(uint64_t a1)
{
  return sub_24F95558C(a1, (uint64_t *)&unk_269A44180);
}

unint64_t sub_24F98B5B0()
{
  unint64_t result = qword_269A43968;
  if (!qword_269A43968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A43968);
  }
  return result;
}

unint64_t sub_24F98B5FC()
{
  unint64_t result = qword_269A35E20;
  if (!qword_269A35E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E20);
  }
  return result;
}

uint64_t sub_24F98B648(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A35E10);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24F98B6B8()
{
  unint64_t result = qword_269A35E38;
  if (!qword_269A35E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E38);
  }
  return result;
}

uint64_t type metadata accessor for FriendSuggestion(uint64_t a1)
{
  return sub_24F95558C(a1, qword_269A44190);
}

unint64_t sub_24F98B724()
{
  unint64_t result = qword_269A43970[0];
  if (!qword_269A43970[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A43970);
  }
  return result;
}

unint64_t sub_24F98B770()
{
  unint64_t result = qword_269A35E50;
  if (!qword_269A35E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E50);
  }
  return result;
}

unint64_t sub_24F98B7BC()
{
  unint64_t result = qword_269A35E58;
  if (!qword_269A35E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E58);
  }
  return result;
}

unint64_t sub_24F98B808()
{
  unint64_t result = qword_269A35E78;
  if (!qword_269A35E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E78);
  }
  return result;
}

unint64_t sub_24F98B854()
{
  unint64_t result = qword_269A35E80;
  if (!qword_269A35E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E80);
  }
  return result;
}

uint64_t sub_24F98B8A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24F98B8E8()
{
  OUTLINED_FUNCTION_113();
  v1(0);
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = OUTLINED_FUNCTION_8_0();
  v3(v2);
  return v0;
}

uint64_t sub_24F98B940(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2();
  v3();
  return a1;
}

unint64_t sub_24F98B998()
{
  unint64_t result = qword_269A35E90;
  if (!qword_269A35E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E90);
  }
  return result;
}

unint64_t sub_24F98B9E8()
{
  unint64_t result = qword_269A35E98;
  if (!qword_269A35E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35E98);
  }
  return result;
}

uint64_t dispatch thunk of FriendServiceProtocol.listFriends(player:after:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_92();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F955C0C;
  uint64_t v3 = OUTLINED_FUNCTION_23_4();
  return v4(v3);
}

uint64_t dispatch thunk of FriendServiceProtocol.remove(friends:of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 24) + **(int **)(v9 + 24);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of FriendServiceProtocol.listFriendSuggestions(player:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F955E9C;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of FriendServiceProtocol.describeFriendSuggestions(friendSuggestions:)()
{
  OUTLINED_FUNCTION_128();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A328;
  uint64_t v3 = OUTLINED_FUNCTION_99();
  return v4(v3);
}

uint64_t dispatch thunk of FriendServiceProtocol.denyRequests(player:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 48) + **(int **)(v9 + 48);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of FriendServiceProtocol.sendRequests(player:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 56) + **(int **)(v9 + 56);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of FriendServiceProtocol.listRequests(player:after:)()
{
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_92();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_34(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_24F95A308;
  uint64_t v3 = OUTLINED_FUNCTION_23_4();
  return v4(v3);
}

uint64_t dispatch thunk of FriendServiceProtocol.acceptRequests(player:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 72) + **(int **)(v9 + 72);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of FriendServiceProtocol.ignoreRequests(player:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 80) + **(int **)(v9 + 80);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

uint64_t dispatch thunk of FriendServiceProtocol.cancelRequests(player:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_46_2();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_20();
  uint64_t v22 = *(void *)(v9 + 88) + **(int **)(v9 + 88);
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)OUTLINED_FUNCTION_34(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_24F95A308;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_40_2();
  return v18(v13, v14, v15, v16, v17, v18, v19, v20, a9, v22);
}

void type metadata accessor for PersonHandle()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for FriendRequest()
{
  OUTLINED_FUNCTION_3_2();
  int v3 = *(_DWORD *)(v2 + 80);
  uint64_t v4 = *v1;
  *uint64_t v0 = *v1;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = v0;
    uint64_t v6 = v1[2];
    v0[1] = v1[1];
    v0[2] = v6;
    OUTLINED_FUNCTION_10_8((uint64_t)v0, (uint64_t)v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (OUTLINED_FUNCTION_49())
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
      uint64_t v8 = OUTLINED_FUNCTION_15_0(v7);
      OUTLINED_FUNCTION_115(v8, v10, *(void *)(v9 + 64));
    }
    else
    {
      OUTLINED_FUNCTION_4_2();
      uint64_t v11 = OUTLINED_FUNCTION_12_7();
      v12(v11);
      OUTLINED_FUNCTION_33();
    }
  }
  return v5;
}

uint64_t destroy for FriendRequest()
{
  OUTLINED_FUNCTION_113();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = v1 + *(int *)(v0 + 28);
  uint64_t v3 = sub_24F98DFB8();
  uint64_t result = __swift_getEnumTagSinglePayload(v2, 1, v3);
  if (!result)
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v5 = OUTLINED_FUNCTION_8_0();
    return v6(v5);
  }
  return result;
}

void *initializeWithCopy for FriendRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  OUTLINED_FUNCTION_10_8((uint64_t)a1, (uint64_t)a2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (OUTLINED_FUNCTION_49())
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v5 = OUTLINED_FUNCTION_15_0(v4);
    OUTLINED_FUNCTION_115(v5, v7, *(void *)(v6 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v8 = OUTLINED_FUNCTION_12_7();
    v9(v8);
    OUTLINED_FUNCTION_33();
  }
  return a1;
}

void *assignWithCopy for FriendRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = OUTLINED_FUNCTION_30_3();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a3, 1, v6);
  int v8 = OUTLINED_FUNCTION_49();
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v11)
    {
      uint64_t v19 = OUTLINED_FUNCTION_138();
      v20(v19);
      return a1;
    }
    uint64_t v12 = OUTLINED_FUNCTION_135();
    v13(v12);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v15 = OUTLINED_FUNCTION_15_0(v14);
    OUTLINED_FUNCTION_115(v15, v17, *(void *)(v16 + 64));
    return a1;
  }
  OUTLINED_FUNCTION_4_2();
  uint64_t v9 = OUTLINED_FUNCTION_12_7();
  v10(v9);
  OUTLINED_FUNCTION_33();
  return a1;
}

uint64_t initializeWithTake for FriendRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  OUTLINED_FUNCTION_10_8(a1, a2);
  if (OUTLINED_FUNCTION_49())
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v4 = OUTLINED_FUNCTION_15_0(v3);
    OUTLINED_FUNCTION_115(v4, v6, *(void *)(v5 + 64));
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
    uint64_t v7 = OUTLINED_FUNCTION_31_2();
    v8(v7);
    OUTLINED_FUNCTION_33();
  }
  return a1;
}

void *assignWithTake for FriendRequest()
{
  OUTLINED_FUNCTION_57_2();
  *uint64_t v0 = v3;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + 16);
  v0[1] = *(void *)(v2 + 8);
  v0[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = OUTLINED_FUNCTION_30_3();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v5);
  int v7 = OUTLINED_FUNCTION_49();
  if (!EnumTagSinglePayload)
  {
    OUTLINED_FUNCTION_3_2();
    if (!v10)
    {
      uint64_t v18 = OUTLINED_FUNCTION_138();
      v19(v18);
      return v0;
    }
    uint64_t v11 = OUTLINED_FUNCTION_135();
    v12(v11);
    goto LABEL_6;
  }
  if (v7)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v14 = OUTLINED_FUNCTION_15_0(v13);
    OUTLINED_FUNCTION_115(v14, v16, *(void *)(v15 + 64));
    return v0;
  }
  OUTLINED_FUNCTION_4_2();
  uint64_t v8 = OUTLINED_FUNCTION_31_2();
  v9(v8);
  OUTLINED_FUNCTION_33();
  return v0;
}

uint64_t getEnumTagSinglePayload for FriendRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F98C7B8);
}

uint64_t sub_24F98C7B8(unint64_t *a1, int a2)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_72_0(*a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
  uint64_t v3 = OUTLINED_FUNCTION_58_4();
  return __swift_getEnumTagSinglePayload(v3, v4, v5);
}

uint64_t storeEnumTagSinglePayload for FriendRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F98C840);
}

void sub_24F98C840()
{
  OUTLINED_FUNCTION_81();
  if (v2)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A354F8);
    uint64_t v3 = OUTLINED_FUNCTION_46_3();
    __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
  }
}

void sub_24F98C8A8()
{
  sub_24F957484();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for FriendSuggestion(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_3_2();
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *(void *)a1 = *a2;
    a1 = v20 + ((v6 + 16) & ~(unint64_t)v6);
    swift_retain();
  }
  else
  {
    uint64_t v7 = v4;
    uint64_t v8 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    sub_24F98DFA8();
    OUTLINED_FUNCTION_1_1();
    int v10 = *(void (**)(uint64_t))(v9 + 16);
    swift_bridgeObjectRetain();
    uint64_t v11 = OUTLINED_FUNCTION_40_4();
    v10(v11);
    uint64_t v12 = *(int *)(v7 + 32);
    uint64_t v13 = *(int *)(v7 + 36);
    uint64_t v14 = (void *)(a1 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = (void *)(a1 + v13);
    uint64_t v18 = (uint64_t *)((char *)a2 + v13);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FriendSuggestion()
{
  OUTLINED_FUNCTION_113();
  swift_bridgeObjectRelease();
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2();
  v0();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FriendSuggestion()
{
  OUTLINED_FUNCTION_44_5();
  uint64_t v4 = *(void *)(v3 + 8);
  *(void *)uint64_t v5 = *(void *)v3;
  *(void *)(v5 + 8) = v4;
  *(unsigned char *)(v5 + 16) = *(unsigned char *)(v3 + 16);
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v7 = *(void (**)(uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  uint64_t v8 = OUTLINED_FUNCTION_40_4();
  v7(v8);
  uint64_t v9 = *(int *)(v0 + 32);
  uint64_t v10 = *(int *)(v0 + 36);
  uint64_t v11 = (void *)(v2 + v9);
  uint64_t v12 = (void *)(v1 + v9);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = (void *)(v2 + v10);
  uint64_t v15 = (void *)(v1 + v10);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t assignWithCopy for FriendSuggestion()
{
  OUTLINED_FUNCTION_57_2();
  *uint64_t v3 = v4;
  *(void *)(v0 + 8) = *(void *)(v5 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v2 + 16);
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v6 = OUTLINED_FUNCTION_53_0();
  v7(v6);
  uint64_t v8 = OUTLINED_FUNCTION_50_4(*(int *)(v1 + 32));
  *(void *)(v9 + 8) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = OUTLINED_FUNCTION_50_4(*(int *)(v1 + 36));
  *(void *)(v11 + 8) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t initializeWithTake for FriendSuggestion()
{
  OUTLINED_FUNCTION_44_5();
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
  *(unsigned char *)(v4 + 16) = *(unsigned char *)(v3 + 16);
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = OUTLINED_FUNCTION_53_0();
  v6(v5);
  uint64_t v7 = *(int *)(v0 + 36);
  *(_OWORD *)(v2 + *(int *)(v0 + 32)) = *(_OWORD *)(v1 + *(int *)(v0 + 32));
  *(_OWORD *)(v2 + v7) = *(_OWORD *)(v1 + v7);
  return v2;
}

uint64_t assignWithTake for FriendSuggestion()
{
  OUTLINED_FUNCTION_44_5();
  uint64_t v4 = v3[1];
  *(void *)uint64_t v2 = *v3;
  *(void *)(v2 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v2 + 16) = *(unsigned char *)(v1 + 16);
  sub_24F98DFA8();
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = OUTLINED_FUNCTION_53_0();
  v6(v5);
  OUTLINED_FUNCTION_29_3(*(int *)(v0 + 32));
  OUTLINED_FUNCTION_29_3(*(int *)(v0 + 36));
  return v2;
}

uint64_t getEnumTagSinglePayload for FriendSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F98CDA0);
}

uint64_t sub_24F98CDA0(uint64_t a1, int a2)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_72_0(*(void *)(a1 + 8));
  }
  sub_24F98DFA8();
  uint64_t v3 = OUTLINED_FUNCTION_58_4();
  return __swift_getEnumTagSinglePayload(v3, v4, v5);
}

uint64_t storeEnumTagSinglePayload for FriendSuggestion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F98CE24);
}

void sub_24F98CE24()
{
  OUTLINED_FUNCTION_81();
  if (v2)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    sub_24F98DFA8();
    uint64_t v3 = OUTLINED_FUNCTION_46_3();
    __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
  }
}

uint64_t sub_24F98CE88()
{
  uint64_t result = sub_24F98DFA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for FriendSuggestion.Source()
{
}

void type metadata accessor for FriendSuggestion.FriendingProtocolVersion()
{
}

unsigned char *sub_24F98CF64(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F98D020);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 5);
        break;
    }
  }
  return result;
}

void type metadata accessor for FriendSuggestion.CodingKeys()
{
}

unsigned char *sub_24F98D054(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F98D110);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 3);
        break;
    }
  }
  return result;
}

void type metadata accessor for FriendRequest.CodingKeys()
{
}

unsigned char *_s21GameServicesProtocols16FriendSuggestionV24FriendingProtocolVersionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_67((uint64_t)result, v6);
        break;
      case 2:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_65((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F98D200);
      case 4:
        uint64_t result = (unsigned char *)OUTLINED_FUNCTION_66_0((uint64_t)result, v6);
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
          uint64_t result = OUTLINED_FUNCTION_62(result, a2 + 1);
        break;
    }
  }
  return result;
}

void type metadata accessor for PersonHandle.CodingKeys()
{
}

void type metadata accessor for PersonHandle.ContactCodingKeys()
{
}

unsigned char *_s21GameServicesProtocols16FriendSuggestionV6SourceOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24F98D2DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for PersonHandle.PlayerCodingKeys()
{
}

unint64_t sub_24F98D314()
{
  unint64_t result = qword_269A442A0[0];
  if (!qword_269A442A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A442A0);
  }
  return result;
}

unint64_t sub_24F98D364()
{
  unint64_t result = qword_269A444B0[0];
  if (!qword_269A444B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A444B0);
  }
  return result;
}

unint64_t sub_24F98D3B4()
{
  unint64_t result = qword_269A446C0[0];
  if (!qword_269A446C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A446C0);
  }
  return result;
}

unint64_t sub_24F98D404()
{
  unint64_t result = qword_269A448D0[0];
  if (!qword_269A448D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A448D0);
  }
  return result;
}

unint64_t sub_24F98D454()
{
  unint64_t result = qword_269A44AE0[0];
  if (!qword_269A44AE0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A44AE0);
  }
  return result;
}

unint64_t sub_24F98D4A4()
{
  unint64_t result = qword_269A44BF0;
  if (!qword_269A44BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A44BF0);
  }
  return result;
}

unint64_t sub_24F98D4F4()
{
  unint64_t result = qword_269A44BF8[0];
  if (!qword_269A44BF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A44BF8);
  }
  return result;
}

unint64_t sub_24F98D544()
{
  unint64_t result = qword_269A44C80;
  if (!qword_269A44C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A44C80);
  }
  return result;
}

unint64_t sub_24F98D594()
{
  unint64_t result = qword_269A44C88[0];
  if (!qword_269A44C88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A44C88);
  }
  return result;
}

unint64_t sub_24F98D5E4()
{
  unint64_t result = qword_269A44D10;
  if (!qword_269A44D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A44D10);
  }
  return result;
}

unint64_t sub_24F98D634()
{
  unint64_t result = qword_269A44D18[0];
  if (!qword_269A44D18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A44D18);
  }
  return result;
}

unint64_t sub_24F98D684()
{
  unint64_t result = qword_269A44DA0;
  if (!qword_269A44DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A44DA0);
  }
  return result;
}

unint64_t sub_24F98D6D4()
{
  unint64_t result = qword_269A44DA8[0];
  if (!qword_269A44DA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A44DA8);
  }
  return result;
}

unint64_t sub_24F98D724()
{
  unint64_t result = qword_269A44E30;
  if (!qword_269A44E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A44E30);
  }
  return result;
}

unint64_t sub_24F98D774()
{
  unint64_t result = qword_269A44E38[0];
  if (!qword_269A44E38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269A44E38);
  }
  return result;
}

unint64_t sub_24F98D7C0()
{
  unint64_t result = qword_269A35EF0;
  if (!qword_269A35EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35EF0);
  }
  return result;
}

unint64_t sub_24F98D80C()
{
  unint64_t result = qword_269A35EF8;
  if (!qword_269A35EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A35EF8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return sub_24F98E628();
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  *(unsigned char *)(v0 + 24) = *(unsigned char *)(v1 + 24);
  return sub_24F98DFB8();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_40_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_3()
{
  return v0 + *(int *)(v1 + 28);
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return v0 - 80;
}

uint64_t OUTLINED_FUNCTION_50_4@<X0>(uint64_t a1@<X8>)
{
  int v3 = (void *)(v1 + a1);
  unsigned int v4 = (void *)(v2 + a1);
  *int v3 = *v4;
  return v4[1];
}

uint64_t OUTLINED_FUNCTION_55_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_56_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_58_4()
{
  return v0 + *(int *)(v1 + 28);
}

uint64_t OUTLINED_FUNCTION_59_3()
{
  return sub_24F98E538();
}

uint64_t OUTLINED_FUNCTION_73_4()
{
  return v0 - 88;
}

uint64_t Ref.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Ref.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Ref.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t Ref.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t Ref.init(stringLiteral:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_24F98DAD0()
{
  return sub_24F98E108();
}

uint64_t sub_24F98DB2C()
{
  return sub_24F98E0B8();
}

uint64_t sub_24F98DB78()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F98DB94()
{
  return MEMORY[0x263F8D388];
}

uint64_t sub_24F98DBA0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return Ref.init(stringLiteral:)(*a1, a1[1], a2);
}

uint64_t sub_24F98DBAC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F98DBC8(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_24F98DC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24F98DCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24F98DD14@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = Ref.init(rawValue:)(*a1, a1[1], v5);
  uint64_t v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

uint64_t sub_24F98DD54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Ref.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24F98DD7C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24F98DD98()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_24F98DDA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];
  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24F98DE18()
{
  return MEMORY[0x263F8D390];
}

uint64_t sub_24F98DE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for Ref()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24F98DE48()
{
  return MEMORY[0x270EEE0C8]();
}

uint64_t sub_24F98DE58()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24F98DE68()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_24F98DE78()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_24F98DE88()
{
  return MEMORY[0x270EEE3F8]();
}

uint64_t sub_24F98DE98()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_24F98DEA8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_24F98DEB8()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_24F98DEC8()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_24F98DED8()
{
  return MEMORY[0x270EEE530]();
}

uint64_t sub_24F98DEE8()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_24F98DEF8()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_24F98DF08()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_24F98DF18()
{
  return MEMORY[0x270EEE5A0]();
}

uint64_t sub_24F98DF28()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_24F98DF38()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_24F98DF48()
{
  return MEMORY[0x270EEE5D0]();
}

uint64_t sub_24F98DF58()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_24F98DF68()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_24F98DF78()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_24F98DF88()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24F98DF98()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24F98DFA8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24F98DFB8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24F98DFC8()
{
  return MEMORY[0x270F59A30]();
}

uint64_t sub_24F98DFD8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24F98DFE8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24F98DFF8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24F98E008()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24F98E018()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24F98E028()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24F98E038()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F98E048()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24F98E058()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24F98E068()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24F98E078()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_24F98E088()
{
  return MEMORY[0x270F9D958]();
}

uint64_t sub_24F98E098()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_24F98E0A8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24F98E0B8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24F98E0C8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24F98E108()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24F98E118()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24F98E128()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24F98E138()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_24F98E148()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24F98E158()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_24F98E178()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24F98E188()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_24F98E198()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24F98E1A8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24F98E1B8()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_24F98E1C8()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_24F98E1D8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24F98E1E8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F98E1F8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24F98E208()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24F98E228()
{
  return MEMORY[0x270FA20B8]();
}

uint64_t sub_24F98E238()
{
  return MEMORY[0x270FA20C8]();
}

uint64_t sub_24F98E248()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_24F98E258()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_24F98E268()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_24F98E278()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_24F98E288()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_24F98E298()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_24F98E2A8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24F98E2B8()
{
  return MEMORY[0x270FA2BC8]();
}

uint64_t sub_24F98E2C8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24F98E2D8()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_24F98E2E8()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_24F98E308()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24F98E318()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24F98E328()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24F98E338()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_24F98E348()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24F98E358()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24F98E368()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F98E378()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F98E388()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24F98E398()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24F98E3A8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24F98E3B8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24F98E3C8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24F98E3D8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24F98E3E8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_24F98E3F8()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_24F98E408()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_24F98E418()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24F98E428()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24F98E438()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24F98E448()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24F98E458()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24F98E468()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F98E478()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F98E488()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24F98E498()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_24F98E4A8()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_24F98E4B8()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_24F98E4C8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24F98E4D8()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_24F98E4E8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F98E4F8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24F98E508()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24F98E518()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24F98E528()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_24F98E538()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F98E548()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F98E558()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24F98E568()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F98E578()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24F98E588()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_24F98E598()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_24F98E5A8()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_24F98E5B8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24F98E5C8()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_24F98E5D8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F98E5E8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24F98E5F8()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24F98E608()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24F98E618()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_24F98E628()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F98E638()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24F98E648()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24F98E658()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_24F98E668()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24F98E678()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F98E698()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24F98E6A8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24F98E6B8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24F98E6C8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24F98E6D8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24F98E6E8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24F98E6F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F98E708()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F98E718()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F98E728()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F98E738()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24F98E768()
{
  return MEMORY[0x270FA0128]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}