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

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24A3BC168(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v2 + 112) = a1;
  return v2;
}

uint64_t sub_24A3BC1A8()
{
  *(void *)(v1 + 40) = v0;
  return MEMORY[0x270FA2498](sub_24A3BC1C8, v0, 0);
}

uint64_t sub_24A3BC1C8()
{
  uint64_t v1 = *(void *)(v0[5] + 112);
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  v0[6] = v3;
  if (v3)
  {
    swift_retain();
    xpc_object_t v4 = XPCDictionary.init()();
    uint64_t v5 = XPCMessage.init(ty:payload:)(2u, (uint64_t)v4);
    char v7 = v6;
    v0[7] = v5;
    v8 = (void *)swift_task_alloc();
    v0[8] = v8;
    void *v8 = v0;
    v8[1] = sub_24A3BC2B8;
    return XPCConnection.sendWithReply(_:)(v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3BC2B8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  swift_release();
  if (v0) {

  }
  else {
    swift_unknownObjectRelease();
  }
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return v3();
}

uint64_t sub_24A3BC408()
{
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_24A3BC440()
{
  return v0;
}

uint64_t sub_24A3BC44C()
{
  xpc_object_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 104) + **(int **)(*(void *)v0 + 104));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24A3BC540;
  return v4();
}

uint64_t sub_24A3BC540()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A3BC634()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A3BC678()
{
  uint64_t v0 = *(void *)PostInstallActivityConfig.identifier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_24A3BC6AC(uint64_t a1)
{
  unint64_t result = sub_24A3BC6D4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A3BC6D4()
{
  unint64_t result = qword_26B177280;
  if (!qword_26B177280)
  {
    type metadata accessor for PostInstallActivity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B177280);
  }
  return result;
}

uint64_t type metadata accessor for PostInstallActivity()
{
  return self;
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

uint64_t type metadata accessor for EventValue()
{
  uint64_t result = qword_26B1774E0;
  if (!qword_26B1774E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A3BC7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t EventValue.init(integerLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t EventValue.init(floatLiteral:)@<X0>(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t _s14CloudTelemetry10EventValueO13stringLiteralACSS_tcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t _s14CloudTelemetry10EventValueO14BOOLeanLiteralACSb_tcfC_0@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24A3BC990@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24A3BC9A8@<X0>(unsigned char *a1@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24A3BC9BC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24A3BC9D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_storeEnumTagMultiPayload();
}

xpc_object_t sub_24A3BC9E8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v44 = type metadata accessor for EventValue();
  uint64_t v42 = *(void *)(v44 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v44);
  char v7 = (uint64_t *)((char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v38 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176B08);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  v13 = (uint64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v38 - v14;
  xpc_object_t v16 = XPCDictionary.init()();
  uint64_t v17 = *(void *)(a1 + 64);
  uint64_t v40 = a1 + 64;
  xpc_object_t v45 = v16;
  uint64_t v18 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  int64_t v41 = (unint64_t)(v18 + 63) >> 6;
  int64_t v39 = v41 - 1;
  uint64_t v43 = a1;
  swift_bridgeObjectRetain();
  int64_t v21 = 0;
  while (1)
  {
    if (v20)
    {
      unint64_t v24 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      unint64_t v25 = v24 | (v21 << 6);
LABEL_8:
      uint64_t v26 = *(void *)(v43 + 56);
      v27 = (void *)(*(void *)(v43 + 48) + 16 * v25);
      uint64_t v28 = v27[1];
      void *v13 = *v27;
      v13[1] = v28;
      uint64_t v29 = v26 + *(void *)(v42 + 72) * v25;
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B00);
      sub_24A3BC7FC(v29, (uint64_t)v13 + *(int *)(v30 + 48));
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 0, 1, v30);
      swift_bridgeObjectRetain();
      goto LABEL_27;
    }
    int64_t v31 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
LABEL_34:
      __break(1u);
      JUMPOUT(0x24A3BCFB8);
    }
    if (v31 < v41)
    {
      unint64_t v32 = *(void *)(v40 + 8 * v31);
      if (v32) {
        goto LABEL_12;
      }
      int64_t v33 = v21 + 2;
      ++v21;
      if (v31 + 1 < v41)
      {
        unint64_t v32 = *(void *)(v40 + 8 * v33);
        if (v32) {
          goto LABEL_15;
        }
        int64_t v21 = v31 + 1;
        if (v31 + 2 < v41)
        {
          unint64_t v32 = *(void *)(v40 + 8 * (v31 + 2));
          if (v32)
          {
            v31 += 2;
            goto LABEL_12;
          }
          int64_t v33 = v31 + 3;
          int64_t v21 = v31 + 2;
          if (v31 + 3 < v41)
          {
            unint64_t v32 = *(void *)(v40 + 8 * v33);
            if (v32)
            {
LABEL_15:
              int64_t v31 = v33;
LABEL_12:
              unint64_t v20 = (v32 - 1) & v32;
              unint64_t v25 = __clz(__rbit64(v32)) + (v31 << 6);
              int64_t v21 = v31;
              goto LABEL_8;
            }
            while (1)
            {
              int64_t v31 = v33 + 1;
              if (__OFADD__(v33, 1)) {
                goto LABEL_34;
              }
              if (v31 >= v41) {
                break;
              }
              unint64_t v32 = *(void *)(v40 + 8 * v31);
              ++v33;
              if (v32) {
                goto LABEL_12;
              }
            }
            int64_t v21 = v39;
          }
        }
      }
    }
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B00);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v13, 1, 1, v34);
    unint64_t v20 = 0;
LABEL_27:
    sub_24A3BDDB4((uint64_t)v13, (uint64_t)v15);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B00);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v15, 1, v35) == 1) {
      break;
    }
    sub_24A3BD0FC((uint64_t)&v15[*(int *)(v35 + 48)], (uint64_t)v9);
    sub_24A3BC7FC((uint64_t)v9, (uint64_t)v7);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
      case 3u:
        *uint64_t v4 = *v7;
        uint64_t v23 = type metadata accessor for XPCObject();
        break;
      case 4u:
        *(unsigned char *)uint64_t v4 = *(unsigned char *)v7;
        uint64_t v23 = type metadata accessor for XPCObject();
        break;
      case 5u:
        uint64_t v22 = sub_24A3D4298();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 32))(v4, v7, v22);
        uint64_t v23 = type metadata accessor for XPCObject();
        break;
      default:
        uint64_t v36 = v7[1];
        *uint64_t v4 = *v7;
        v4[1] = v36;
        uint64_t v23 = type metadata accessor for XPCObject();
        break;
    }
    swift_storeEnumTagMultiPayload();
    type metadata accessor for XPCObject();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v4, 0, 1, v23);
    XPCDictionary.subscript.setter((uint64_t)v4);
    sub_24A3BD160((uint64_t)v9);
  }
  swift_release();
  return v45;
}

uint64_t sub_24A3BCFD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697924B0);
    uint64_t v3 = sub_24A3D4648();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  uint64_t v6 = v3;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_24A3BD2A0(v4, 1, &v6);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v6;
  return result;
}

unint64_t sub_24A3BD084(uint64_t a1, uint64_t a2)
{
  sub_24A3D4728();
  sub_24A3D43D8();
  uint64_t v4 = sub_24A3D4758();
  return sub_24A3BD1BC(a1, a2, v4);
}

uint64_t sub_24A3BD0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A3BD160(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24A3BD1BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A3D4678() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24A3D4678() & 1) == 0);
    }
  }
  return v6;
}

void sub_24A3BD2A0(uint64_t a1, char a2, void *a3)
{
  uint64_t v7 = type metadata accessor for EventValue();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697922B0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v15 = (uint64_t *)((char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v59 = a1;
  uint64_t v60 = v8;
  char v17 = a2;
  uint64_t v57 = v3;
  uint64_t v58 = v16;
  uint64_t v18 = (uint64_t)v15 + *(int *)(v12 + 48);
  unint64_t v56 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v19 = a1 + v56;
  uint64_t v62 = *(void *)(v13 + 72);
  swift_bridgeObjectRetain();
  sub_24A3BE8E0(v19, (uint64_t)v15, (uint64_t *)&unk_2697922B0);
  uint64_t v20 = v15[1];
  uint64_t v65 = *v15;
  uint64_t v21 = v65;
  uint64_t v66 = v20;
  uint64_t v61 = v18;
  sub_24A3BD0FC(v18, (uint64_t)v10);
  uint64_t v22 = (void *)*a3;
  unint64_t v24 = sub_24A3BD084(v21, v20);
  uint64_t v25 = v22[2];
  BOOL v26 = (v23 & 1) == 0;
  uint64_t v27 = v25 + v26;
  if (__OFADD__(v25, v26)) {
    goto LABEL_23;
  }
  char v28 = v23;
  if (v22[3] >= v27)
  {
    if (v17)
    {
      if (v23) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_24A3BD7A4();
      if (v28) {
        goto LABEL_10;
      }
    }
LABEL_13:
    int64_t v33 = (void *)*a3;
    *(void *)(*a3 + 8 * (v24 >> 6) + 64) |= 1 << v24;
    uint64_t v34 = (uint64_t *)(v33[6] + 16 * v24);
    *uint64_t v34 = v21;
    v34[1] = v20;
    uint64_t v35 = v33[7];
    uint64_t v60 = *(void *)(v60 + 72);
    sub_24A3BD0FC((uint64_t)v10, v35 + v60 * v24);
    uint64_t v36 = v33[2];
    BOOL v37 = __OFADD__(v36, 1);
    uint64_t v38 = v36 + 1;
    if (v37)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v33[2] = v38;
    uint64_t v39 = v58 - 1;
    if (v58 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v40 = v59 + v62 + v56;
    while (1)
    {
      sub_24A3BE8E0(v40, (uint64_t)v15, (uint64_t *)&unk_2697922B0);
      uint64_t v42 = v15[1];
      uint64_t v65 = *v15;
      uint64_t v41 = v65;
      uint64_t v66 = v42;
      sub_24A3BD0FC(v61, (uint64_t)v10);
      uint64_t v43 = (void *)*a3;
      unint64_t v44 = sub_24A3BD084(v41, v42);
      uint64_t v46 = v43[2];
      BOOL v47 = (v45 & 1) == 0;
      BOOL v37 = __OFADD__(v46, v47);
      uint64_t v48 = v46 + v47;
      if (v37) {
        break;
      }
      char v49 = v45;
      if (v43[3] < v48)
      {
        sub_24A3BDA10(v48, 1);
        unint64_t v44 = sub_24A3BD084(v41, v42);
        if ((v49 & 1) != (v50 & 1)) {
          goto LABEL_25;
        }
      }
      if (v49) {
        goto LABEL_10;
      }
      v51 = (void *)*a3;
      *(void *)(*a3 + 8 * (v44 >> 6) + 64) |= 1 << v44;
      v52 = (uint64_t *)(v51[6] + 16 * v44);
      uint64_t *v52 = v41;
      v52[1] = v42;
      sub_24A3BD0FC((uint64_t)v10, v51[7] + v60 * v44);
      uint64_t v53 = v51[2];
      BOOL v37 = __OFADD__(v53, 1);
      uint64_t v54 = v53 + 1;
      if (v37) {
        goto LABEL_24;
      }
      v51[2] = v54;
      v40 += v62;
      if (!--v39) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_24A3BDA10(v27, v17 & 1);
  unint64_t v29 = sub_24A3BD084(v21, v20);
  if ((v28 & 1) == (v30 & 1))
  {
    unint64_t v24 = v29;
    if ((v28 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    int64_t v31 = (void *)swift_allocError();
    swift_willThrow();
    id v67 = v31;
    id v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_24A3BD160((uint64_t)v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_24A3D4698();
  __break(1u);
LABEL_26:
  uint64_t v63 = 0;
  unint64_t v64 = 0xE000000000000000;
  sub_24A3D45A8();
  sub_24A3D43E8();
  sub_24A3D45E8();
  sub_24A3D43E8();
  sub_24A3D4608();
  __break(1u);
}

void *sub_24A3BD7A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for EventValue();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697924B0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24A3D4628();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_24A3BC7FC(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    uint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *uint64_t v22 = v19;
    v22[1] = v20;
    sub_24A3BD0FC((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24A3BDA10(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for EventValue();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697924B0);
  int v43 = a2;
  uint64_t v9 = sub_24A3D4638();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    int64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_24A3BD0FC(v30, (uint64_t)v7);
    }
    else
    {
      sub_24A3BC7FC(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_24A3D4728();
    sub_24A3D43D8();
    uint64_t result = sub_24A3D4758();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *uint64_t v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_24A3BD0FC((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_24A3BDDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A3BDE1C()
{
  return MEMORY[0x263F8D5B0];
}

uint64_t sub_24A3BDE28()
{
  return sub_24A3BDEB4(&qword_2697922A0);
}

uint64_t sub_24A3BDE5C()
{
  return MEMORY[0x263F8D388];
}

uint64_t sub_24A3BDE68()
{
  return MEMORY[0x263F8D528];
}

uint64_t sub_24A3BDE74()
{
  return MEMORY[0x263F8E618];
}

uint64_t sub_24A3BDE80()
{
  return sub_24A3BDEB4(&qword_2697922A8);
}

uint64_t sub_24A3BDEB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for EventValue();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A3BDEF8()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_24A3BDF04()
{
  return MEMORY[0x263F8D390];
}

uint64_t initializeBufferWithCopyOfBuffer for LegacyConfig(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LegacyConfig()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LegacyConfig(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LegacyConfig(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v4 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v4;
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for LegacyConfig(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyConfig(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 73)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 73) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 73) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyConfig()
{
  return &type metadata for LegacyConfig;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 5)
    {
      uint64_t v10 = sub_24A3D4298();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for EventValue(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 5)
  {
    uint64_t v3 = sub_24A3D4298();
    int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (!result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for EventValue(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 5)
  {
    uint64_t v8 = sub_24A3D4298();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for EventValue(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24A3BD160((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 5)
    {
      uint64_t v7 = sub_24A3D4298();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    uint64_t v6 = sub_24A3D4298();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24A3BD160((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      uint64_t v6 = sub_24A3D4298();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for EventValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for EventValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24A3BE79C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24A3BE7AC()
{
  uint64_t result = sub_24A3D4298();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

ValueMetadata *type metadata accessor for Event.Keys()
{
  return &type metadata for Event.Keys;
}

uint64_t sub_24A3BE87C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A3BE8E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A3BE944()
{
  *(void *)(v1 + 40) = v0;
  return MEMORY[0x270FA2498](sub_24A3BE964, v0, 0);
}

uint64_t sub_24A3BE964()
{
  uint64_t v1 = *(void *)(v0[5] + 112);
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  v0[6] = v3;
  if (v3)
  {
    swift_retain();
    xpc_object_t v4 = XPCDictionary.init()();
    uint64_t v5 = XPCMessage.init(ty:payload:)(1u, (uint64_t)v4);
    char v7 = v6;
    v0[7] = v5;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[8] = v8;
    void *v8 = v0;
    v8[1] = sub_24A3BC2B8;
    return XPCConnection.sendWithReply(_:)(v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3BEA54()
{
  xpc_object_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 104) + **(int **)(*(void *)v0 + 104));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24A3BC540;
  return v4();
}

uint64_t sub_24A3BEB48()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A3BEB8C()
{
  uint64_t v0 = *(void *)SubmitEventsActivityConfig.identifier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_24A3BEBC0(uint64_t a1)
{
  unint64_t result = sub_24A3BEBE8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A3BEBE8()
{
  unint64_t result = qword_26B1772A8;
  if (!qword_26B1772A8)
  {
    type metadata accessor for SubmitEventsActivity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1772A8);
  }
  return result;
}

uint64_t type metadata accessor for SubmitEventsActivity()
{
  return self;
}

uint64_t sub_24A3BEC60(char a1)
{
  char v2 = a1 & 1;
  swift_allocObject();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A3BED08;
  return sub_24A3BEE08(v2);
}

uint64_t sub_24A3BED08(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_24A3BEE08(char a1)
{
  *(void *)(v2 + 96) = v1;
  *(unsigned char *)(v2 + 208) = a1;
  uint64_t v3 = sub_24A3D4318();
  *(void *)(v2 + 104) = v3;
  *(void *)(v2 + 112) = *(void *)(v3 - 8);
  *(void *)(v2 + 120) = swift_task_alloc();
  uint64_t v4 = sub_24A3D4548();
  *(void *)(v2 + 128) = v4;
  *(void *)(v2 + 136) = *(void *)(v4 - 8);
  *(void *)(v2 + 144) = swift_task_alloc();
  *(void *)(v2 + 152) = sub_24A3D4538();
  *(void *)(v2 + 160) = swift_task_alloc();
  sub_24A3D4338();
  *(void *)(v2 + 168) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A3BEF84, 0, 0);
}

uint64_t sub_24A3BEF84()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v22 = *(void *)(v0 + 144);
  uint64_t v23 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v24 = *(void *)(v0 + 104);
  int v25 = *(unsigned char *)(v0 + 208) & 1;
  sub_24A3BF630();
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  sub_24A3D4328();
  *(void *)(v0 + 88) = MEMORY[0x263F8EE78];
  sub_24A3BF670();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1772B0);
  sub_24A3BF6C8();
  sub_24A3D4598();
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 104))(v22, *MEMORY[0x263F8F138], v23);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v3, *MEMORY[0x263F8F040], v24);
  sub_24A3D4568();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v24);
  uint64_t v5 = (void *)sub_24A3D4558();
  *(void *)(v0 + 176) = v5;
  *(void *)(v4 + 16) = v5;
  *(unsigned char *)(v4 + 24) = v25;
  if (v25)
  {
    uint64_t v13 = *(void *)(v0 + 96);
    type metadata accessor for XPCConnection();
    swift_allocObject();
    id v14 = v5;
    swift_retain();
    XPCConnection.init(serviceName:targetQ:listen:delegate:)(0xD000000000000023, 0x800000024A3D6180, v14, 0, v13, (uint64_t)&off_26FE11E28);
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)(v0 + 96);
    swift_beginAccess();
    *(void *)(v17 + 40) = v16;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v19 = *(void *)(v0 + 96);
    return v18(v19);
  }
  else
  {
    uint64_t v6 = self;
    id v7 = v5;
    id v8 = objc_msgSend(v6, sel_mainBundle);
    id v9 = objc_msgSend(v8, sel_bundleIdentifier);

    if (v9)
    {
      uint64_t v10 = sub_24A3D43A8();
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v12 = 0;
    }
    sub_24A3D42D8();
    swift_allocObject();
    unint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v21;
    *unint64_t v21 = v0;
    v21[1] = sub_24A3BF318;
    return MEMORY[0x270F16E60](0, v10, v12);
  }
}

uint64_t sub_24A3BF318(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24A3BF584;
  }
  else
  {
    *(void *)(v4 + 200) = a1;
    uint64_t v5 = sub_24A3BF440;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24A3BF440()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[12];
  swift_beginAccess();
  *(void *)(v2 + 32) = v1;
  uint64_t result = swift_release();
  if (*(void *)(v2 + 32))
  {
    uint64_t v4 = (void *)v0[22];
    swift_retain();
    swift_retain();
    uint64_t v5 = sub_24A3D42B8();
    swift_release();
    swift_release();

    uint64_t v6 = v0[12];
    swift_beginAccess();
    *(void *)(v6 + 40) = v5;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v8 = v0[12];
    return v7(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3BF584()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_24A3BF630()
{
  unint64_t result = qword_26B1772D0;
  if (!qword_26B1772D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1772D0);
  }
  return result;
}

unint64_t sub_24A3BF670()
{
  unint64_t result = qword_26B1772C8;
  if (!qword_26B1772C8)
  {
    sub_24A3D4538();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1772C8);
  }
  return result;
}

unint64_t sub_24A3BF6C8()
{
  unint64_t result = qword_26B1772B8;
  if (!qword_26B1772B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1772B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1772B8);
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

uint64_t sub_24A3BF76C()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConnectionManager()
{
  return self;
}

uint64_t sub_24A3BF7D8()
{
  *(void *)(v1 + 40) = v0;
  return MEMORY[0x270FA2498](sub_24A3BF7F8, v0, 0);
}

uint64_t sub_24A3BF7F8()
{
  uint64_t v1 = *(void *)(v0[5] + 112);
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 40);
  v0[6] = v3;
  if (v3)
  {
    swift_retain();
    xpc_object_t v4 = XPCDictionary.init()();
    uint64_t v5 = XPCMessage.init(ty:payload:)(3u, (uint64_t)v4);
    char v7 = v6;
    v0[7] = v5;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[8] = v8;
    void *v8 = v0;
    v8[1] = sub_24A3BC2B8;
    return XPCConnection.sendWithReply(_:)(v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3BF8E8()
{
  xpc_object_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 104) + **(int **)(*(void *)v0 + 104));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24A3BC540;
  return v4();
}

uint64_t sub_24A3BF9DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A3BFA20()
{
  uint64_t v0 = *(void *)CacheCleanupActivityConfig.identifier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_24A3BFA54(uint64_t a1)
{
  unint64_t result = sub_24A3BFA7C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A3BFA7C()
{
  unint64_t result = qword_26B177298;
  if (!qword_26B177298)
  {
    type metadata accessor for CacheCleanupActivity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B177298);
  }
  return result;
}

uint64_t type metadata accessor for CacheCleanupActivity()
{
  return self;
}

unint64_t sub_24A3BFAF4()
{
  return 0xD000000000000016;
}

unint64_t sub_24A3BFB74()
{
  return sub_24A3BFAF4();
}

uint64_t sub_24A3BFB98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A3D4298();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A3BFF70((uint64_t)a1, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    id v8 = v22[1];
    *(id *)a2 = v22[0];
    *(void *)(a2 + 8) = v8;
  }
  else
  {
    sub_24A3BFFCC(0, &qword_26B176AD0);
    if (!swift_dynamicCast()) {
      goto LABEL_29;
    }
    id v9 = v22[0];
    if (*MEMORY[0x263EFFB40]) {
      BOOL v10 = v22[0] == (id)*MEMORY[0x263EFFB40];
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {

      *(unsigned char *)a2 = 1;
      goto LABEL_15;
    }
    id v11 = (id)*MEMORY[0x263EFFB38];

    if (!v11 || v9 != v11)
    {
LABEL_29:
      if (swift_dynamicCast() || swift_dynamicCast() || swift_dynamicCast())
      {
        *(id *)a2 = v22[0];
        type metadata accessor for EventValue();
        goto LABEL_16;
      }
      if (swift_dynamicCast())
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
        type metadata accessor for EventValue();
        goto LABEL_16;
      }
      sub_24A3BFFCC(0, &qword_26B176AC8);
      if (swift_dynamicCast())
      {
        id v13 = v22[0];
        if (objc_msgSend(v22[0], sel_respondsToSelector_, sel_description))
        {
          id v14 = objc_msgSend(v13, sel_description);
          uint64_t v15 = sub_24A3D43A8();
          uint64_t v17 = v16;

          *(void *)a2 = v15;
          *(void *)(a2 + 8) = v17;
          goto LABEL_15;
        }
      }
      __swift_project_boxed_opaque_existential_0(a1, a1[3]);
      v22[0] = (id)swift_getDynamicType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697922F0);
      uint64_t v18 = sub_24A3D43B8();
      uint64_t v20 = v19;
      sub_24A3C004C();
      swift_allocError();
      *unint64_t v21 = v18;
      v21[1] = v20;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
    }
    *(unsigned char *)a2 = 0;
  }
LABEL_15:
  type metadata accessor for EventValue();
LABEL_16:
  swift_storeEnumTagMultiPayload();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
}

uint64_t sub_24A3BFF70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A3BFFCC(uint64_t a1, unint64_t *a2)
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

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24A3C004C()
{
  unint64_t result = qword_2697922F8;
  if (!qword_2697922F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697922F8);
  }
  return result;
}

uint64_t sub_24A3C00A0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EventValue();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v46 - v8;
  BOOL v10 = (void *)sub_24A3D4368();
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v48 = a1 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v49 = (unint64_t)(v12 + 63) >> 6;
  char v50 = v57;
  uint64_t v53 = &v60;
  int64_t v47 = v49 - 1;
  uint64_t v51 = a1;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v55)
  {
    if (v14)
    {
      unint64_t v17 = __clz(__rbit64(v14));
      uint64_t v18 = (v14 - 1) & v14;
      unint64_t v19 = v17 | (i << 6);
LABEL_8:
      uint64_t v20 = *(void *)(v51 + 56);
      unint64_t v21 = (void *)(*(void *)(v51 + 48) + 16 * v19);
      uint64_t v22 = v21[1];
      *(void *)&long long v56 = *v21;
      *((void *)&v56 + 1) = v22;
      sub_24A3BFF70(v20 + 32 * v19, (uint64_t)v50);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
    int64_t v23 = i + 1;
    if (__OFADD__(i, 1)) {
      goto LABEL_47;
    }
    if (v23 < v49)
    {
      unint64_t v24 = *(void *)(v48 + 8 * v23);
      if (v24) {
        goto LABEL_12;
      }
      i += 2;
      if (v23 + 1 >= v49)
      {
        int64_t i = v23;
      }
      else
      {
        unint64_t v24 = *(void *)(v48 + 8 * i);
        if (v24)
        {
          ++v23;
LABEL_12:
          uint64_t v18 = (v24 - 1) & v24;
          unint64_t v19 = __clz(__rbit64(v24)) + (v23 << 6);
          int64_t i = v23;
          goto LABEL_8;
        }
        if (v23 + 2 < v49)
        {
          unint64_t v24 = *(void *)(v48 + 8 * (v23 + 2));
          if (v24)
          {
            v23 += 2;
            goto LABEL_12;
          }
          int64_t v44 = v23 + 3;
          if (v23 + 3 < v49)
          {
            unint64_t v24 = *(void *)(v48 + 8 * v44);
            if (!v24)
            {
              while (1)
              {
                int64_t v23 = v44 + 1;
                if (__OFADD__(v44, 1)) {
                  goto LABEL_48;
                }
                if (v23 >= v49)
                {
                  int64_t i = v47;
                  goto LABEL_17;
                }
                unint64_t v24 = *(void *)(v48 + 8 * v23);
                ++v44;
                if (v24) {
                  goto LABEL_12;
                }
              }
            }
            v23 += 3;
            goto LABEL_12;
          }
          int64_t i = v23 + 2;
        }
      }
    }
LABEL_17:
    uint64_t v18 = 0;
    memset(v57, 0, sizeof(v57));
    long long v56 = 0u;
LABEL_18:
    sub_24A3C054C((uint64_t)&v56, (uint64_t)&v58);
    uint64_t v25 = v59;
    if (!v59) {
      goto LABEL_44;
    }
    uint64_t v26 = v58;
    sub_24A3C05B4(v53, &v56);
    sub_24A3BFB98(&v56, (uint64_t)v9);
    if (v2)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v56);
      swift_bridgeObjectRelease();
LABEL_44:
      swift_release();
      return (uint64_t)v10;
    }
    unint64_t v54 = v18;
    int64_t v55 = i;
    uint64_t v27 = v9;
    uint64_t v28 = (uint64_t)v9;
    uint64_t v29 = (uint64_t)v7;
    sub_24A3C79D4(v28, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for EventValue);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v61 = v10;
    unint64_t v32 = sub_24A3BD084(v26, v25);
    uint64_t v33 = v10[2];
    BOOL v34 = (v31 & 1) == 0;
    uint64_t v35 = v33 + v34;
    if (__OFADD__(v33, v34)) {
      break;
    }
    char v36 = v31;
    if (v10[3] >= v35)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        BOOL v10 = v61;
        if (v31) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_24A3BD7A4();
        BOOL v10 = v61;
        if (v36) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24A3BDA10(v35, isUniquelyReferenced_nonNull_native);
      unint64_t v37 = sub_24A3BD084(v26, v25);
      if ((v36 & 1) != (v38 & 1)) {
        goto LABEL_49;
      }
      unint64_t v32 = v37;
      BOOL v10 = v61;
      if (v36)
      {
LABEL_4:
        uint64_t v16 = v10[7] + *(void *)(v52 + 72) * v32;
        char v7 = (char *)v29;
        sub_24A3BE87C(v29, v16);
        goto LABEL_5;
      }
    }
    v10[(v32 >> 6) + 8] |= 1 << v32;
    uint64_t v39 = (uint64_t *)(v10[6] + 16 * v32);
    *uint64_t v39 = v26;
    v39[1] = v25;
    uint64_t v40 = v10[7] + *(void *)(v52 + 72) * v32;
    char v7 = (char *)v29;
    sub_24A3C79D4(v29, v40, (uint64_t (*)(void))type metadata accessor for EventValue);
    uint64_t v41 = v10[2];
    BOOL v42 = __OFADD__(v41, 1);
    uint64_t v43 = v41 + 1;
    if (v42) {
      goto LABEL_46;
    }
    v10[2] = v43;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v56);
    id v9 = v27;
    uint64_t v2 = 0;
    unint64_t v14 = v54;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t result = sub_24A3D4698();
  __break(1u);
  return result;
}

uint64_t sub_24A3C054C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24A3C05B4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

BOOL sub_24A3C05C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24A3C05DC()
{
  return sub_24A3D4758();
}

uint64_t sub_24A3C0624()
{
  return sub_24A3D4738();
}

uint64_t sub_24A3C0650()
{
  return sub_24A3D4758();
}

xpc_object_t sub_24A3C0694()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v4 = *v0;
  int v5 = v0[1];
  uint64_t v7 = *((void *)v0 + 1);
  uint64_t v6 = *((void *)v0 + 2);
  xpc_object_t v20 = XPCDictionary.init()();
  MessageKeys.tcAllowsCellularAccess.unsafeMutableAddressor();
  if (v4 == 2) {
    *uint64_t v3 = 0;
  }
  else {
    *uint64_t v3 = v4 & 1;
  }
  uint64_t v8 = type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
  swift_bridgeObjectRetain();
  XPCDictionary.subscript.setter((uint64_t)v3);
  MessageKeys.tcAllowsExpensiveAccess.unsafeMutableAddressor();
  if (v5 == 2) {
    *uint64_t v3 = 0;
  }
  else {
    *uint64_t v3 = v5 & 1;
  }
  uint64_t v9 = type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v3, 0, 1, v9);
  swift_bridgeObjectRetain();
  XPCDictionary.subscript.setter((uint64_t)v3);
  if (v6)
  {
    swift_bridgeObjectRetain();
    MessageKeys.tcBundleID.unsafeMutableAddressor();
    *(void *)uint64_t v3 = v7;
    *((void *)v3 + 1) = v6;
    uint64_t v10 = type metadata accessor for XPCObject();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 0, 1, v10);
    swift_bridgeObjectRetain();
    uint64_t v11 = (uint64_t)v3;
LABEL_11:
    XPCDictionary.subscript.setter(v11);
    return v20;
  }
  id v12 = objc_msgSend(self, sel_mainBundle);
  id v13 = objc_msgSend(v12, sel_bundleIdentifier);

  if (v13)
  {
    uint64_t v14 = sub_24A3D43A8();
    uint64_t v16 = v15;

    MessageKeys.tcBundleID.unsafeMutableAddressor();
    *(void *)uint64_t v3 = v14;
    *((void *)v3 + 1) = v16;
    uint64_t v17 = type metadata accessor for XPCObject();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 0, 1, v17);
    swift_bridgeObjectRetain();
    uint64_t v11 = (uint64_t)v3;
    goto LABEL_11;
  }
  return v20;
}

CloudTelemetry::TransportConfiguration __swiftcall TransportConfiguration.init(allowCellularAccess:allowExpensiveAccess:bundleID:)(Swift::Bool_optional allowCellularAccess, Swift::Bool_optional allowExpensiveAccess, Swift::String_optional bundleID)
{
  *(Swift::Bool_optional *)uint64_t v3 = allowCellularAccess;
  *(Swift::Bool_optional *)(v3 + 1) = allowExpensiveAccess;
  *(Swift::String_optional *)(v3 + 8) = bundleID;
  result.bundleID.value._object = (void *)bundleID.value._countAndFlagsBits;
  LOBYTE(result.bundleID.value._countAndFlagsBits) = allowExpensiveAccess;
  result.allowCellularAccess = allowCellularAccess;
  return result;
}

uint64_t static CloudTelemetry.setupXpcServiceActivities()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A3D4498();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_24A3C825C((uint64_t)v3, &qword_26B176C20);
  }
  else
  {
    sub_24A3D4488();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v7 = sub_24A3D4458();
      uint64_t v9 = v8;
      swift_unknownObjectRelease();
      if (v9 | v7)
      {
        v11[0] = 0;
        v11[1] = 0;
        v11[2] = v7;
        v11[3] = v9;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

{
  return MEMORY[0x270FA2498](sub_24A3C1048, 0, 0);
}

uint64_t sub_24A3C0BF0()
{
  return MEMORY[0x270FA2498](sub_24A3C0C0C, 0, 0);
}

uint64_t sub_24A3C0C0C()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  uint64_t v3 = type metadata accessor for Reporter();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *uint64_t v2 = v0;
  v2[1] = sub_24A3C0D10;
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 16, v1, v3, v4, v5);
}

uint64_t sub_24A3C0D10()
{
  uint64_t v2 = (void *)*v1;
  v2[4] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24A3C0FB0;
  }
  else
  {
    uint64_t v4 = v2[2];
    v2[5] = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    v2[6] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_24A3C0E74;
    v5[5] = v4;
    uint64_t v3 = sub_24A3C3F54;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A3C0E74()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3C0FC8, 0, 0);
  }
  else
  {

    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24A3C0FB0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A3C0FC8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A3C1048()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  uint64_t v3 = type metadata accessor for Reporter();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *uint64_t v2 = v0;
  v2[1] = sub_24A3C114C;
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 16, v1, v3, v4, v5);
}

uint64_t sub_24A3C114C()
{
  uint64_t v2 = (void *)*v1;
  v2[4] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24A3CAC24;
  }
  else
  {
    uint64_t v4 = v2[2];
    v2[5] = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    v2[6] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_24A3C12B0;
    v5[5] = v4;
    uint64_t v3 = sub_24A3C3F54;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A3C12B0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3CAC38, 0, 0);
  }
  else
  {

    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24A3C13EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24A3D4498();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24A3D4488();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24A3C825C(a1, &qword_26B176C20);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A3D4458();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t static Reporter.setupXpcServiceActivities()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_24A3C15D0, 0, 0);
}

uint64_t sub_24A3C15D0()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *uint64_t v2 = v0;
  v2[1] = sub_24A3C16CC;
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 16, v1, v4, v3, v5);
}

uint64_t sub_24A3C16CC()
{
  uint64_t v2 = (void *)*v1;
  v2[5] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24A3C196C;
  }
  else
  {
    uint64_t v4 = v2[2];
    v2[6] = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    v2[7] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_24A3C1830;
    v5[5] = v4;
    uint64_t v3 = sub_24A3C3F54;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A3C1830()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3C1984, 0, 0);
  }
  else
  {

    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24A3C196C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A3C1984()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static CloudTelemetry.report(teamID:eventName:event:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24A3C1C1C(a1, a2, a3, a4, a5, (uint64_t)&unk_26FE11EA0, (uint64_t)&unk_269792398);
}

uint64_t sub_24A3C1A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2697923A8 + dword_2697923A8);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_24A3BC540;
  return v16(a4, a5, a6, a7, a8);
}

uint64_t static CloudTelemetry.report(teamID:eventType:event:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2697923A8 + dword_2697923A8);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24A3CAC1C;
  return v13(a1, a2, a3, a4, a5);
}

{
  return sub_24A3C1C1C(a1, a2, a3, a4, a5, (uint64_t)&unk_26FE11EC8, (uint64_t)&unk_2697923B8);
}

uint64_t sub_24A3C1C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = a7;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_24A3C00A0(a5);
  if (!v8)
  {
    uint64_t v18 = result;
    uint64_t v19 = sub_24A3D4498();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
    xpc_object_t v20 = (void *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = a1;
    v20[5] = a2;
    v20[6] = a3;
    v20[7] = a4;
    v20[8] = v18;
    v20[9] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24A3C13EC((uint64_t)v16, v22, (uint64_t)v20);
    return swift_release();
  }
  return result;
}

uint64_t sub_24A3C1D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2697923A8 + dword_2697923A8);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *uint64_t v14 = v8;
  v14[1] = sub_24A3CAC1C;
  return v16(a4, a5, a6, a7, a8);
}

uint64_t sub_24A3C1E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = sub_24A3D43A8();
  uint64_t v10 = v9;
  uint64_t v11 = sub_24A3D43A8();
  uint64_t v13 = v12;
  uint64_t v14 = sub_24A3D4348();
  swift_getObjCClassMetadata();
  a7(v8, v10, v11, v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_24A3C1F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(void *)(v8 + 656) = v7;
  *(unsigned char *)(v8 + 745) = a7;
  *(void *)(v8 + 648) = a5;
  *(void *)(v8 + 640) = a4;
  *(void *)(v8 + 632) = a3;
  *(void *)(v8 + 624) = a2;
  *(void *)(v8 + 616) = a1;
  *(void *)(v8 + 664) = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  *(void *)(v8 + 672) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  *(void *)(v8 + 680) = swift_task_alloc();
  *(_WORD *)(v8 + 746) = *(_WORD *)a6;
  *(_OWORD *)(v8 + 688) = *(_OWORD *)(a6 + 8);
  return MEMORY[0x270FA2498](sub_24A3C2070, 0, 0);
}

uint64_t sub_24A3C2070()
{
  v76 = (_OWORD *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 640);
  uint64_t v2 = *(void *)(v0 + 632);
  uint64_t v3 = *(void *)(v0 + 624);
  uint64_t v4 = *(void *)(v0 + 616);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A3D54D0;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000024A3D6260;
  uint64_t v6 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_24A3C3848(inited);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_24A3D54D0;
  *(void *)(v8 + 32) = 0x7954746E6576655FLL;
  *(void *)(v8 + 40) = 0xEA00000000006570;
  *(void *)(v8 + 48) = v2;
  *(void *)(v8 + 72) = v6;
  *(void *)(v8 + 56) = v1;
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_24A3C3848(v8);
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_24A3BD084(0x7954746E6576655FLL, 0xEA00000000006570), (v11 & 1) != 0))
  {
    sub_24A3BFF70(*(void *)(v9 + 56) + 32 * v10, v0 + 176);
  }
  else
  {
    *(_OWORD *)(v0 + 176) = 0u;
    *(_OWORD *)(v0 + 192) = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24A3BE8E0(v0 + 176, (uint64_t)v76, &qword_26B176B40);
  if (*(void *)(v0 + 232))
  {
    sub_24A3C05B4(v76, (_OWORD *)(v0 + 528));
    sub_24A3BFF70(v0 + 528, v0 + 496);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *(void *)(v0 + 592) = 0;
      *(void *)(v0 + 600) = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 528);
    uint64_t v12 = *(void *)(v0 + 592);
    uint64_t v13 = *(void *)(v0 + 600);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
  }
  sub_24A3C825C(v0 + 176, &qword_26B176B40);
  if (*(void *)(v7 + 16) && (unint64_t v14 = sub_24A3BD084(0xD000000000000013, 0x800000024A3D6260), (v15 & 1) != 0))
  {
    sub_24A3BFF70(*(void *)(v7 + 56) + 32 * v14, v0 + 240);
  }
  else
  {
    *(_OWORD *)(v0 + 240) = 0u;
    *(_OWORD *)(v0 + 256) = 0u;
  }
  sub_24A3BE8E0(v0 + 240, v0 + 272, &qword_26B176B40);
  if (*(void *)(v0 + 296))
  {
    sub_24A3C05B4((_OWORD *)(v0 + 272), (_OWORD *)(v0 + 432));
    sub_24A3BFF70(v0 + 432, v0 + 464);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *(void *)(v0 + 576) = 0;
      *(void *)(v0 + 584) = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 432);
    uint64_t v16 = *(void *)(v0 + 576);
    uint64_t v17 = *(void *)(v0 + 584);
    sub_24A3C825C(v0 + 240, &qword_26B176B40);
    if (v13)
    {
      if (v17)
      {
        v72 = (_OWORD *)(v0 + 336);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B30);
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B18);
        unint64_t v75 = v7;
        uint64_t v19 = *(void *)(*(void *)(v18 - 8) + 72);
        uint64_t v20 = *(unsigned __int8 *)(*(void *)(v18 - 8) + 80);
        uint64_t v21 = (v20 + 32) & ~v20;
        uint64_t v73 = swift_allocObject();
        *(_OWORD *)(v73 + 16) = xmmword_24A3D54E0;
        uint64_t v74 = v21;
        uint64_t v22 = (void *)(v73 + v21);
        int64_t v23 = (void *)(v73 + v21 + *(int *)(v18 + 48));
        unint64_t v24 = MessageKeys.eventType.unsafeMutableAddressor();
        uint64_t v25 = *((void *)v24 + 1);
        *uint64_t v22 = *(void *)v24;
        v22[1] = v25;
        *int64_t v23 = v12;
        v23[1] = v13;
        uint64_t v26 = type metadata accessor for XPCObject();
        swift_storeEnumTagMultiPayload();
        uint64_t v27 = (void *)((char *)v22 + v19);
        uint64_t v28 = (void *)((char *)v22 + v19 + *(int *)(v18 + 48));
        swift_bridgeObjectRetain();
        uint64_t v29 = MessageKeys.clientType.unsafeMutableAddressor();
        uint64_t v30 = v29[1];
        void *v27 = *v29;
        v27[1] = v30;
        uint64_t v31 = v18;
        *uint64_t v28 = v16;
        v28[1] = v17;
        swift_storeEnumTagMultiPayload();
        unint64_t v32 = (void *)((char *)v22 + 2 * v19);
        uint64_t v33 = (char *)v32 + *(int *)(v18 + 48);
        swift_bridgeObjectRetain();
        BOOL v34 = MessageKeys.legacyClient.unsafeMutableAddressor();
        uint64_t v35 = v34[1];
        *unint64_t v32 = *v34;
        v32[1] = v35;
        *uint64_t v33 = 1;
        swift_storeEnumTagMultiPayload();
        uint64_t v77 = v19;
        char v36 = (void *)((char *)v22 + 3 * v19);
        unint64_t v37 = (xpc_object_t *)((char *)v36 + *(int *)(v18 + 48));
        swift_bridgeObjectRetain();
        char v38 = (uint64_t *)MessageKeys.transportConfiguration.unsafeMutableAddressor();
        uint64_t v40 = *v38;
        uint64_t v39 = v38[1];
        *char v36 = v40;
        v36[1] = v39;
        swift_bridgeObjectRetain();
        *unint64_t v37 = sub_24A3C0694();
        swift_storeEnumTagMultiPayload();
        xpc_object_t v41 = XPCDictionary.init(dictionaryLiteral:)(v73);
        *(void *)(v0 + 608) = v41;
        if (*(void *)(v75 + 16))
        {
          BOOL v42 = (_OWORD *)(v0 + 304);
          unint64_t v43 = sub_24A3BD084(0x676E696C706D6153, 0xEC00000044495555);
          if (v44)
          {
            sub_24A3BFF70(*(void *)(v75 + 56) + 32 * v43, v0 + 304);
LABEL_38:
            swift_bridgeObjectRelease();
            sub_24A3BE8E0((uint64_t)v42, (uint64_t)v72, &qword_26B176B40);
            if (*(void *)(v0 + 360))
            {
              sub_24A3C05B4(v72, (_OWORD *)(v0 + 368));
              sub_24A3BFF70(v0 + 368, v0 + 400);
              if ((swift_dynamicCast() & 1) == 0)
              {
                *(void *)(v0 + 560) = 0;
                *(void *)(v0 + 568) = 0;
              }
              __swift_destroy_boxed_opaque_existential_0Tm(v0 + 368);
              uint64_t v55 = *(void *)(v0 + 560);
              uint64_t v56 = *(void *)(v0 + 568);
              sub_24A3C825C((uint64_t)v42, &qword_26B176B40);
              if (v56)
              {
                uint64_t v57 = *(void **)(v0 + 680);
                MessageKeys.samplingUUID.unsafeMutableAddressor();
                *uint64_t v57 = v55;
                v57[1] = v56;
                swift_storeEnumTagMultiPayload();
                (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v57, 0, 1, v26);
                swift_bridgeObjectRetain();
                XPCDictionary.subscript.setter((uint64_t)v57);
                xpc_object_t v41 = *(xpc_object_t *)(v0 + 608);
              }
            }
            else
            {
              sub_24A3C825C((uint64_t)v42, &qword_26B176B40);
            }
            uint64_t v58 = swift_bridgeObjectRetain();
            uint64_t v59 = nullsub_1(v58);
            uint64_t v60 = swift_allocObject();
            *(_OWORD *)(v60 + 16) = xmmword_24A3D54F0;
            uint64_t v61 = (void *)(v60 + v74);
            uint64_t v62 = (void *)(v60 + v74 + *(int *)(v31 + 48));
            uint64_t v63 = MessageKeys.sendOneMessageSessionInfo.unsafeMutableAddressor();
            uint64_t v64 = v63[1];
            *uint64_t v61 = *v63;
            v61[1] = v64;
            *uint64_t v62 = v41;
            swift_storeEnumTagMultiPayload();
            uint64_t v65 = (void *)(v60 + v74 + v77);
            uint64_t v66 = (void *)((char *)v65 + *(int *)(v31 + 48));
            swift_bridgeObjectRetain();
            swift_unknownObjectRetain();
            id v67 = (uint64_t *)MessageKeys.sendOneMessageEvent.unsafeMutableAddressor();
            uint64_t v69 = *v67;
            uint64_t v68 = v67[1];
            *uint64_t v65 = v69;
            v65[1] = v68;
            swift_bridgeObjectRetain();
            xpc_object_t v70 = sub_24A3BC9E8(v59);
            swift_bridgeObjectRelease();
            *uint64_t v66 = v70;
            swift_storeEnumTagMultiPayload();
            *(void *)(v0 + 704) = XPCDictionary.init(dictionaryLiteral:)(v60);
            v71 = (void *)swift_task_alloc();
            *(void *)(v0 + 712) = v71;
            void *v71 = v0;
            v71[1] = sub_24A3C2A08;
            v71[5] = *(void *)(v0 + 656);
            return MEMORY[0x270FA2498](sub_24A3C3F54, 0, 0);
          }
          long long v54 = 0uLL;
        }
        else
        {
          long long v54 = 0uLL;
          BOOL v42 = (_OWORD *)(v0 + 304);
        }
        *BOOL v42 = v54;
        v42[1] = v54;
        goto LABEL_38;
      }
      goto LABEL_23;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B1773A0 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_24A3D4308();
    __swift_project_value_buffer(v50, (uint64_t)qword_26B177388);
    uint64_t v46 = sub_24A3D42E8();
    os_log_type_t v47 = sub_24A3D4518();
    if (!os_log_type_enabled(v46, v47)) {
      goto LABEL_32;
    }
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v48 = 0;
    int64_t v49 = "invalid or missing eventType";
    goto LABEL_31;
  }
  sub_24A3C825C(v0 + 240, &qword_26B176B40);
  if (!v13) {
    goto LABEL_27;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B1773A0 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_24A3D4308();
  __swift_project_value_buffer(v45, (uint64_t)qword_26B177388);
  uint64_t v46 = sub_24A3D42E8();
  os_log_type_t v47 = sub_24A3D4518();
  if (!os_log_type_enabled(v46, v47)) {
    goto LABEL_32;
  }
  uint64_t v48 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v48 = 0;
  int64_t v49 = "invalid or missing clientType";
LABEL_31:
  _os_log_impl(&dword_24A3BA000, v46, v47, v49, v48, 2u);
  MEMORY[0x24C5C3D30](v48, -1, -1);
LABEL_32:

  sub_24A3C82B8();
  swift_allocError();
  unsigned char *v51 = 1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v52 = *(uint64_t (**)(void))(v0 + 8);
  return v52();
}

uint64_t sub_24A3C2A08()
{
  *(void *)(*(void *)v1 + 720) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24A3C2F28;
  }
  else {
    uint64_t v2 = sub_24A3C2B1C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24A3C2B1C()
{
  uint64_t v23 = v0;
  uint64_t v1 = *(void *)(v0 + 720);
  uint64_t v2 = OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount;
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v0 + 656) + v2);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 656);
  uint64_t v5 = (uint64_t *)&v4[4];
  uint64_t v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_24A3C830C(v5, v22);
  os_unfair_lock_unlock(v6);
  if (v1) {
    return;
  }
  char v7 = v22[0];
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v0 + 704);
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = *(void *)(v0 + 672);
    uint64_t v10 = *(void *)(v0 + 664);
    char v11 = *(void **)(v0 + 656);
    int v12 = *(unsigned __int8 *)(v0 + 745);
    uint64_t v13 = sub_24A3D4498();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
    unint64_t v14 = (void *)swift_allocObject();
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = v11;
    v14[5] = v8;
    v14[6] = v10;
    id v15 = v11;
    swift_unknownObjectRetain();
    uint64_t v16 = sub_24A3C5934(v9, (uint64_t)&unk_2697923E0, (uint64_t)v14);
    *(void *)(v0 + 728) = v16;
    if (v12 == 1)
    {
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 736) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_24A3C2DA0;
      uint64_t v18 = MEMORY[0x263F8EE60] + 8;
      uint64_t v19 = MEMORY[0x263F8E628];
      uint64_t v20 = MEMORY[0x263F8E658];
      MEMORY[0x270FA1FB8](v0 + 744, v16, v18, v19, v20);
      return;
    }
    swift_release();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(void (**)(void))(v0 + 8);
  v21();
}

uint64_t sub_24A3C2DA0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24A3C2E9C, 0, 0);
}

uint64_t sub_24A3C2E9C()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A3C2F28()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id CloudTelemetry.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t sub_24A3C3024()
{
  return 1;
}

uint64_t sub_24A3C302C()
{
  return sub_24A3D4758();
}

uint64_t sub_24A3C3070()
{
  return sub_24A3D4738();
}

uint64_t sub_24A3C3098()
{
  return sub_24A3D4758();
}

const char *sub_24A3C30D8()
{
  return "CloudTelemetry";
}

const char *sub_24A3C30EC()
{
  return "CloudTelemetryInProcess";
}

uint64_t sub_24A3C3100()
{
  uint64_t v0 = sub_24A3D4308();
  __swift_allocate_value_buffer(v0, qword_26B177388);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B177388);
  return sub_24A3D42F8();
}

uint64_t sub_24A3C3180()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  MEMORY[0x270FA5388](v0 - 8);
  objc_super v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A3D4498();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_24A3C825C((uint64_t)v2, &qword_26B176C20);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    sub_24A3D4488();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(void *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v6 = sub_24A3D4458();
      uint64_t v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
  type metadata accessor for Reporter();
  if (v7 | v6)
  {
    v10[0] = 0;
    v10[1] = 0;
    v10[2] = v6;
    v10[3] = v7;
  }
  uint64_t result = swift_task_create();
  qword_26B1778E8 = result;
  return result;
}

uint64_t sub_24A3C3384(uint64_t a1)
{
  *(void *)(v1 + 56) = a1;
  return MEMORY[0x270FA2498](sub_24A3C33A4, 0, 0);
}

uint64_t sub_24A3C33A4()
{
  v0[5] = &type metadata for Reporter.CloudTelemetryFeatureFlags;
  v0[6] = sub_24A3CAAEC();
  char v1 = sub_24A3D42A8();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  type metadata accessor for ConnectionManager();
  objc_super v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *objc_super v2 = v0;
  v2[1] = sub_24A3C3478;
  return sub_24A3BEC60((v1 & 1) == 0);
}

uint64_t sub_24A3C3478(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    return MEMORY[0x270FA2498](sub_24A3C35C4, 0, 0);
  }
}

uint64_t sub_24A3C35C4()
{
  uint64_t v1 = v0[9];
  objc_super v2 = (id *)v0[7];
  id v3 = objc_allocWithZone((Class)type metadata accessor for Reporter());
  *objc_super v2 = sub_24A3C36C8(v1, 20);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_24A3C3648(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_24A3C36C8(a1, a2);
}

uint64_t sub_24A3C368C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B48);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = 0;
  qword_26B1778E0 = result;
  return result;
}

id sub_24A3C36C8(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B48);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 24) = 0;
  *(void *)(v7 + 16) = 0;
  *(void *)&v2[v6] = v7;
  uint64_t v8 = OBJC_IVAR___CloudTelemetryReporter_xpcServiceXpcActivityStarted;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B50);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(unsigned char *)(v9 + 16) = 0;
  *(void *)&v2[v8] = v9;
  *(void *)&v2[OBJC_IVAR___CloudTelemetryReporter_connectionManager] = a1;
  *(void *)&v2[OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageLimit] = a2;
  v11.receiver = v2;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t sub_24A3C3794(char a1)
{
  if (a1) {
    unint64_t v1 = 0xD000000000000011;
  }
  else {
    unint64_t v1 = 0xD000000000000016;
  }
  if (a1) {
    unint64_t v2 = 0x800000024A3D62C0;
  }
  else {
    unint64_t v2 = 0x800000024A3D62E0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A3D54D0;
  *(void *)(inited + 32) = sub_24A3D43A8();
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = v2;
  return sub_24A3C3848(inited);
}

unint64_t sub_24A3C3848(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B28);
  uint64_t v2 = sub_24A3D4648();
  id v3 = (void *)v2;
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
    sub_24A3BE8E0(v6, (uint64_t)&v15, &qword_26B176B20);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24A3BD084(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    objc_super v11 = (uint64_t *)(v3[6] + 16 * result);
    *objc_super v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24A3C05B4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_24A3C3980()
{
  return sub_24A3D4758();
}

uint64_t sub_24A3C39C8()
{
  return sub_24A3D4748();
}

uint64_t sub_24A3C39F4()
{
  return sub_24A3D4758();
}

void *sub_24A3C3A38@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_24A3C3A58(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_24A3C3A64()
{
  return 0xD000000000000018;
}

uint64_t sub_24A3C3A80(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_24A3CA52C();
  unint64_t v5 = sub_24A3CA580();
  return MEMORY[0x270EEE458](a1, a2, v4, v5);
}

unint64_t sub_24A3C3AD8()
{
  return sub_24A3C3794(*v0);
}

uint64_t sub_24A3C3AE0(uint64_t a1)
{
  unint64_t v2 = sub_24A3CA4D8();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_24A3C3B1C(uint64_t a1)
{
  unint64_t v2 = sub_24A3CA4D8();
  unint64_t v3 = sub_24A3CA52C();
  unint64_t v4 = sub_24A3CA580();
  return MEMORY[0x270EF2658](a1, v2, v3, v4);
}

uint64_t static Reporter.start()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_24A3C3B98, 0, 0);
}

uint64_t sub_24A3C3B98()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *unint64_t v2 = v0;
  v2[1] = sub_24A3C3C94;
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 16, v1, v4, v3, v5);
}

uint64_t sub_24A3C3C94()
{
  unint64_t v2 = (void *)*v1;
  v2[5] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24A3CAC18;
  }
  else
  {
    uint64_t v4 = v2[2];
    v2[6] = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    v2[7] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_24A3C3DF8;
    v5[5] = v4;
    uint64_t v3 = sub_24A3C3F54;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A3C3DF8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3CAC2C, 0, 0);
  }
  else
  {

    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24A3C3F34()
{
  *(void *)(v1 + 40) = v0;
  return MEMORY[0x270FA2498](sub_24A3C3F54, 0, 0);
}

uint64_t sub_24A3C3F54()
{
  uint64_t v25 = v0;
  uint64_t v1 = v0[5];
  if (*(unsigned char *)(*(void *)(v1 + OBJC_IVAR___CloudTelemetryReporter_connectionManager) + 24) == 1)
  {
    uint64_t v2 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR___CloudTelemetryReporter_xpcServiceXpcActivityStarted);
    uint64_t v3 = v2 + 4;
    uint64_t v4 = v2 + 5;
    os_unfair_lock_lock(v2 + 5);
    sub_24A3C43E8(v3, v24);
    os_unfair_lock_unlock(v4);
    if (v24[0])
    {
      if (qword_26B1773A0 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_24A3D4308();
      __swift_project_value_buffer(v5, (uint64_t)qword_26B177388);
      uint64_t v6 = sub_24A3D42E8();
      os_log_type_t v7 = sub_24A3D44F8();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_24A3BA000, v6, v7, "XPCService registration for CloudTelemetry", v8, 2u);
        MEMORY[0x24C5C3D30](v8, -1, -1);
      }
      uint64_t v9 = (void *)v0[5];

      char v10 = XPCActivity.makeHandler.unsafeMutableAddressor();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v9;
      swift_beginAccess();
      uint64_t v12 = *v10;
      *char v10 = (uint64_t)&unk_269792410;
      v10[1] = v11;
      id v13 = v9;
      sub_24A3C8878(v12);
      if (qword_26B177828 != -1) {
        swift_once();
      }
      unint64_t v14 = qword_26B177900;
      v0[6] = qword_26B177900;
      if (v14 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_24A3D4618();
        uint64_t v15 = v16;
        v0[7] = v16;
        if (v16) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v16 = swift_bridgeObjectRetain();
        v0[7] = v15;
        if (v15)
        {
LABEL_11:
          if (v15 < 1)
          {
            __break(1u);
          }
          else
          {
            v0[8] = 0;
            uint64_t v19 = v0[6];
            if ((v19 & 0xC000000000000001) != 0)
            {
              uint64_t v20 = MEMORY[0x24C5C36A0](0);
            }
            else
            {
              uint64_t v20 = *(void *)(v19 + 32);
              swift_retain();
            }
            v0[9] = v20;
            unint64_t v21 = (*(void *)v20 + 160) & 0xFFFFFFFFFFFFLL | 0xD283000000000000;
            v0[10] = *(void *)(*(void *)v20 + 160);
            v0[11] = v21;
            uint64_t v16 = (uint64_t)sub_24A3C4270;
            uint64_t v17 = v20;
            uint64_t v18 = 0;
          }
          return MEMORY[0x270FA2498](v16, v17, v18);
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_24A3C4270()
{
  (*(void (**)(void))(v0 + 80))(0);
  return MEMORY[0x270FA2498](sub_24A3C42E0, 0, 0);
}

uint64_t sub_24A3C42E0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[7];
  swift_release();
  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v0[8] + 1;
    v0[8] = v5;
    uint64_t v6 = v0[6];
    if ((v6 & 0xC000000000000001) != 0)
    {
      uint64_t v7 = MEMORY[0x24C5C36A0]();
    }
    else
    {
      uint64_t v7 = *(void *)(v6 + 8 * v5 + 32);
      swift_retain();
    }
    v0[9] = v7;
    unint64_t v8 = (*(void *)v7 + 160) & 0xFFFFFFFFFFFFLL | 0xD283000000000000;
    v0[10] = *(void *)(*(void *)v7 + 160);
    v0[11] = v8;
    return MEMORY[0x270FA2498](sub_24A3C4270, v7, 0);
  }
}

unsigned char *sub_24A3C43E8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  if (*result)
  {
    *a2 = 0;
  }
  else
  {
    *unint64_t result = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t sub_24A3C4408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24A3C4428, 0, 0);
}

uint64_t sub_24A3C4428()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (type metadata accessor for SubmitEventsActivity() == v1)
  {
    uint64_t v3 = swift_retain();
    uint64_t v4 = sub_24A3BC168(v3);
    uint64_t v5 = &qword_26B1772A0;
    uint64_t v6 = type metadata accessor for SubmitEventsActivity;
  }
  else if (type metadata accessor for CacheCleanupActivity() == v1)
  {
    uint64_t v7 = swift_retain();
    uint64_t v4 = sub_24A3BC168(v7);
    uint64_t v5 = &qword_26B177290;
    uint64_t v6 = type metadata accessor for CacheCleanupActivity;
  }
  else
  {
    if (type metadata accessor for PostInstallActivity() != v1) {
      return sub_24A3D4608();
    }
    uint64_t v8 = swift_retain();
    uint64_t v4 = sub_24A3BC168(v8);
    uint64_t v5 = &qword_26B177278;
    uint64_t v6 = type metadata accessor for PostInstallActivity;
  }
  uint64_t v9 = sub_24A3CA760(v5, (void (*)(uint64_t))v6);
  char v10 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v10(v4, v9);
}

void static Reporter.report(teamID:eventType:event:allowCellularAccess:allowExpensiveAccess:bundleID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, char a7, uint64_t a8, uint64_t a9)
{
  uint64_t v43 = a8;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_24A3C00A0(a5);
  if (!v9)
  {
    int v45 = a6;
    uint64_t v40 = v19;
    uint64_t v41 = v20;
    uint64_t v21 = v44;
    uint64_t v38 = a2;
    uint64_t v39 = a4;
    uint64_t v22 = qword_26B177380;
    uint64_t v42 = a9;
    uint64_t v23 = swift_bridgeObjectRetain();
    if (v22 != -1) {
      uint64_t v23 = swift_once();
    }
    MEMORY[0x270FA5388](v23);
    *(&v37 - 2) = v21;
    uint64_t v25 = (uint64_t *)&v24[4];
    uint64_t v26 = v24 + 6;
    os_unfair_lock_lock(v24 + 6);
    sub_24A3C8888(v25, &v46);
    os_unfair_lock_unlock(v26);
    uint64_t v27 = (uint64_t)v40;
    if (v46)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26B1773A0 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_24A3D4308();
      __swift_project_value_buffer(v28, (uint64_t)qword_26B177388);
      uint64_t v29 = sub_24A3D42E8();
      os_log_type_t v30 = sub_24A3D4528();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_24A3BA000, v29, v30, "Over legacy task count limit.", v31, 2u);
        MEMORY[0x24C5C3D30](v31, -1, -1);
      }
    }
    else
    {
      char v32 = v45 & 1;
      uint64_t v33 = sub_24A3D4498();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v27, 1, 1, v33);
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = 0;
      *(void *)(v34 + 24) = 0;
      *(void *)(v34 + 32) = v21;
      *(void *)(v34 + 40) = a1;
      *(void *)(v34 + 48) = v38;
      *(void *)(v34 + 56) = a3;
      uint64_t v35 = v41;
      *(void *)(v34 + 64) = v39;
      *(void *)(v34 + 72) = v35;
      *(unsigned char *)(v34 + 80) = v32;
      *(unsigned char *)(v34 + 81) = a7 & 1;
      uint64_t v36 = v42;
      *(void *)(v34 + 88) = v43;
      *(void *)(v34 + 96) = v36;
      *(void *)(v34 + 104) = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24A3C5934(v27, (uint64_t)&unk_269792420, v34);
      swift_release();
    }
  }
}

uint64_t sub_24A3C4910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 136) = v14;
  *(void *)(v8 + 144) = v15;
  *(_WORD *)(v8 + 192) = v12;
  *(void *)(v8 + 120) = v11;
  *(void *)(v8 + 128) = v13;
  *(void *)(v8 + 104) = a7;
  *(void *)(v8 + 112) = a8;
  *(void *)(v8 + 88) = a5;
  *(void *)(v8 + 96) = a6;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_24A3C49A0, 0, 0);
}

uint64_t sub_24A3C49A0()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *uint64_t v2 = v0;
  v2[1] = sub_24A3C4A9C;
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 64, v1, v4, v3, v5);
}

uint64_t sub_24A3C4A9C()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24A3C4BB0;
  }
  else {
    uint64_t v2 = sub_24A3C4E74;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24A3C4BB0()
{
  uint64_t v16 = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[20];
  if (qword_26B1773A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A3D4308();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B177388);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24A3D42E8();
  os_log_type_t v6 = sub_24A3D4508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_24A3D46C8();
    v0[10] = sub_24A3C7170(v9, v10, &v15);
    sub_24A3D4578();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24A3BA000, v5, v6, "Report, failed with error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C3D30](v8, -1, -1);
    MEMORY[0x24C5C3D30](v7, -1, -1);
  }
  else
  {
  }
  if (qword_26B177380 != -1) {
    swift_once();
  }
  uint64_t v11 = v0[18];
  uint64_t v12 = qword_26B1778E0;
  *(void *)(swift_task_alloc() + 16) = v11;
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 24));
  sub_24A3CA634((void *)(v12 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 24));
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24A3C4E74()
{
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  __int16 v3 = *(_WORD *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 64);
  *(unsigned char *)(v0 + 40) = v3;
  *(void *)(v0 + 168) = v4;
  *(unsigned char *)(v0 + 41) = HIBYTE(v3);
  *(void *)(v0 + 48) = v2;
  *(void *)(v0 + 56) = v1;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24A3C4F4C;
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v0 + 120);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 88);
  return sub_24A3C1F74(v10, v8, v9, v6, v7, v0 + 40, 0);
}

uint64_t sub_24A3C4F4C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();

  if (v0)
  {
    swift_bridgeObjectRelease();
    __int16 v3 = sub_24A3C5188;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    __int16 v3 = sub_24A3C508C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

void sub_24A3C508C()
{
  uint64_t v1 = v0[23];
  if (qword_26B177380 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[18];
  __int16 v3 = (os_unfair_lock_s *)qword_26B1778E0;
  *(void *)(swift_task_alloc() + 16) = v2;
  uint64_t v4 = v3 + 4;
  v3 += 6;
  os_unfair_lock_lock(v3);
  sub_24A3CA634(v4);
  os_unfair_lock_unlock(v3);
  if (!v1)
  {
    swift_task_dealloc();
    uint64_t v5 = (void (*)(void))v0[1];
    v5();
  }
}

uint64_t sub_24A3C5188()
{
  uint64_t v16 = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[23];
  if (qword_26B1773A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A3D4308();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B177388);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24A3D42E8();
  os_log_type_t v6 = sub_24A3D4508();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_24A3D46C8();
    v0[10] = sub_24A3C7170(v9, v10, &v15);
    sub_24A3D4578();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24A3BA000, v5, v6, "Report, failed with error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C3D30](v8, -1, -1);
    MEMORY[0x24C5C3D30](v7, -1, -1);
  }
  else
  {
  }
  if (qword_26B177380 != -1) {
    swift_once();
  }
  uint64_t v11 = v0[18];
  uint64_t v12 = qword_26B1778E0;
  *(void *)(swift_task_alloc() + 16) = v11;
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 24));
  sub_24A3CA634((void *)(v12 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 24));
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t static Reporter.report(teamID:eventType:event:transportConfiguration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 80) = a5;
  *(void *)(v7 + 88) = v6;
  *(void *)(v7 + 64) = a3;
  *(void *)(v7 + 72) = a4;
  *(void *)(v7 + 48) = a1;
  *(void *)(v7 + 56) = a2;
  *(_OWORD *)(v7 + 96) = *(_OWORD *)a6;
  *(void *)(v7 + 112) = *(void *)(a6 + 16);
  return MEMORY[0x270FA2498](sub_24A3C5484, 0, 0);
}

uint64_t sub_24A3C5484()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *uint64_t v2 = v0;
  v2[1] = sub_24A3C5580;
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 40, v1, v4, v3, v5);
}

uint64_t sub_24A3C5580()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24A3C5904;
  }
  else {
    uint64_t v2 = sub_24A3C5694;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24A3C5694()
{
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 136) = *(void *)(v0 + 40);
  if (v1 == 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 104);
    char v6 = 2;
    LOBYTE(v7) = 2;
  }
  else
  {
    unint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 104);
    unint64_t v7 = v4 >> 8;
    char v6 = v4;
    uint64_t v2 = v5;
    uint64_t v3 = v1;
  }
  *(void *)(v0 + 144) = v3;
  *(unsigned char *)(v0 + 16) = v6;
  *(unsigned char *)(v0 + 17) = v7;
  *(void *)(v0 + 24) = v2;
  *(void *)(v0 + 32) = v3;
  sub_24A3C8B2C(v4, v5, v1);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v8;
  void *v8 = v0;
  v8[1] = sub_24A3C5790;
  uint64_t v9 = *(void *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 80);
  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v12 = *(void *)(v0 + 64);
  uint64_t v13 = *(void *)(v0 + 48);
  return sub_24A3C1F74(v13, v11, v12, v9, v10, v0 + 16, 0);
}

uint64_t sub_24A3C5790()
{
  uint64_t v2 = *(void **)(*v1 + 136);
  uint64_t v3 = *v1;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3C591C, 0, 0);
  }
  else
  {
    unint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_24A3C5904()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A3C591C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A3C5934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A3D4498();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A3D4488();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24A3C825C(a1, &qword_26B176C20);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A3D4458();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24A3C5C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  return MEMORY[0x270FA2498](sub_24A3C5C50, 0, 0);
}

uint64_t sub_24A3C5C50()
{
  if (qword_26B1773A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24A3D4308();
  v0[13] = __swift_project_value_buffer(v1, (uint64_t)qword_26B177388);
  uint64_t v2 = sub_24A3D42E8();
  os_log_type_t v3 = sub_24A3D44F8();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_24A3BA000, v2, v3, "SendOneMessage, sending to service", v4, 2u);
    MEMORY[0x24C5C3D30](v4, -1, -1);
  }
  uint64_t v5 = v0[10];

  uint64_t v6 = *(void *)(v5 + OBJC_IVAR___CloudTelemetryReporter_connectionManager);
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(v6 + 40);
  v0[14] = v8;
  if (v8)
  {
    uint64_t v9 = v0[11];
    swift_retain();
    swift_unknownObjectRetain();
    uint64_t v10 = XPCMessage.init(ty:payload:)(0, v9);
    char v12 = v11;
    v0[15] = v10;
    uint64_t v13 = (void *)swift_task_alloc();
    v0[16] = v13;
    void *v13 = v0;
    v13[1] = sub_24A3C5E0C;
    return XPCConnection.sendWithReply(_:)(v10, v12);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3C5E0C()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24A3C608C;
  }
  else
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
    uint64_t v2 = sub_24A3C5F48;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24A3C5F48()
{
  uint64_t v1 = sub_24A3D42E8();
  os_log_type_t v2 = sub_24A3D44F8();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_24A3BA000, v1, v2, "SendOneMessage, sent to service", v3, 2u);
    MEMORY[0x24C5C3D30](v3, -1, -1);
  }

  uint64_t v4 = v0[17];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[10];
  uint64_t v7 = *(void *)(v6 + OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = v6;
  *(void *)(v8 + 24) = v5;
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  sub_24A3CA898((void *)(v7 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  if (!v4)
  {
    swift_task_dealloc();
    uint64_t v9 = (void (*)(void))v0[1];
    v9();
  }
}

uint64_t sub_24A3C608C()
{
  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[17];
  swift_unknownObjectRelease();
  swift_release();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24A3D42E8();
  os_log_type_t v5 = sub_24A3D4508();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[17];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v19 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_24A3D46C8();
    v0[9] = sub_24A3C7170(v9, v10, &v19);
    sub_24A3D4578();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24A3BA000, v4, v5, "SendOneMessage, failed with error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C3D30](v8, -1, -1);
    MEMORY[0x24C5C3D30](v7, -1, -1);
  }
  else
  {
    char v11 = (void *)v0[17];
  }
  uint64_t v12 = v0[12];
  uint64_t v13 = v0[10];
  uint64_t v14 = *(os_unfair_lock_s **)(v13 + OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount);
  uint64_t v15 = swift_task_alloc();
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = v12;
  uint64_t v16 = v14 + 4;
  v14 += 6;
  os_unfair_lock_lock(v14);
  sub_24A3CA898(v16);
  os_unfair_lock_unlock(v14);
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t static Reporter._privacyLogs()()
{
  return sub_24A3C8D8C();
}

uint64_t sub_24A3C6308(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_24A3C6DF8(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(sub_24A3D4258() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24A3D4658();
  __break(1u);
  return result;
}

id Reporter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Reporter.init()()
{
}

id _s14CloudTelemetryAACfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A3C6688()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1772D8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24A3D5500;
  type metadata accessor for XPCActivity();
  uint64_t v1 = type metadata accessor for SubmitEventsActivity();
  uint64_t v2 = sub_24A3CA760(&qword_26B1772A0, (void (*)(uint64_t))type metadata accessor for SubmitEventsActivity);
  *(void *)(v0 + 32) = XPCActivity.__allocating_init(handlerType:)(v1, v2);
  uint64_t v3 = type metadata accessor for PostInstallActivity();
  uint64_t v4 = sub_24A3CA760(&qword_26B177278, (void (*)(uint64_t))type metadata accessor for PostInstallActivity);
  *(void *)(v0 + 40) = XPCActivity.__allocating_init(handlerType:)(v3, v4);
  uint64_t v5 = type metadata accessor for CacheCleanupActivity();
  uint64_t v6 = sub_24A3CA760(&qword_26B177290, (void (*)(uint64_t))type metadata accessor for CacheCleanupActivity);
  *(void *)(v0 + 48) = XPCActivity.__allocating_init(handlerType:)(v5, v6);
  uint64_t result = sub_24A3D4448();
  qword_26B177900 = v0;
  return result;
}

uint64_t sub_24A3C67F0(uint64_t a1, uint64_t a2)
{
  return sub_24A3C68E8(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24A3C6808()
{
  sub_24A3D43A8();
  sub_24A3D43D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A3C685C()
{
  sub_24A3D43A8();
  sub_24A3D4728();
  sub_24A3D43D8();
  uint64_t v0 = sub_24A3D4758();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24A3C68D0(uint64_t a1, uint64_t a2)
{
  return sub_24A3C68E8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24A3C68E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24A3D43A8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24A3C692C(uint64_t a1, id *a2)
{
  uint64_t result = sub_24A3D4388();
  *a2 = 0;
  return result;
}

uint64_t sub_24A3C69A4(uint64_t a1, id *a2)
{
  char v3 = sub_24A3D4398();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24A3C6A24@<X0>(uint64_t *a1@<X8>)
{
  sub_24A3D43A8();
  uint64_t v2 = sub_24A3D4378();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A3C6A68()
{
  uint64_t v0 = sub_24A3D43A8();
  uint64_t v2 = v1;
  if (v0 == sub_24A3D43A8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24A3D4678();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24A3C6AF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24A3D4378();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A3C6B3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A3D43A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A3C6B68(uint64_t a1)
{
  uint64_t v2 = sub_24A3CA760(&qword_269792478, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_24A3CA760(&qword_2697924D8, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24A3C6C24(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A3C6D00;
  return v6(a1);
}

uint64_t sub_24A3C6D00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A3C6DF8(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269792480);
  uint64_t v10 = *(void *)(sub_24A3D4258() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24A3D45F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24A3D4258() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24A3C8C34(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_24A3C7060(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269792540);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24A3C8B40(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A3C7170(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A3C7244(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A3BFF70((uint64_t)v12, *a3);
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
      sub_24A3BFF70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24A3C7244(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A3D4588();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A3C7400(a5, a6);
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
  uint64_t v8 = sub_24A3D45D8();
  if (!v8)
  {
    sub_24A3D45F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A3D4658();
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

uint64_t sub_24A3C7400(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A3C7498(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A3C7678(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A3C7678(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A3C7498(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A3C7610(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A3D45B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A3D45F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A3D4408();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A3D4658();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A3D45F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A3C7610(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A3C7678(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772F0);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24A3D4658();
  __break(1u);
  return result;
}

unint64_t sub_24A3C77C8(uint64_t a1)
{
  sub_24A3D43A8();
  sub_24A3D4728();
  sub_24A3D43D8();
  uint64_t v2 = sub_24A3D4758();
  swift_bridgeObjectRelease();
  return sub_24A3C785C(a1, v2);
}

unint64_t sub_24A3C785C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24A3D43A8();
    uint64_t v8 = v7;
    if (v6 == sub_24A3D43A8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24A3D4678();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_24A3D43A8();
          uint64_t v15 = v14;
          if (v13 == sub_24A3D43A8() && v15 == v16) {
            break;
          }
          char v18 = sub_24A3D4678();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_24A3C79D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A3C7A3C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A3C7A98()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A3C7AD0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24A3CAC1C;
  return MEMORY[0x270FA2498](sub_24A3C0C0C, 0, 0);
}

uint64_t type metadata accessor for Reporter()
{
  return self;
}

uint64_t sub_24A3C7B9C()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24A3CAC1C;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2697923A8 + dword_2697923A8);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[2] = v8;
  void *v8 = v7;
  v8[1] = sub_24A3BC540;
  return v10(v2, v3, v4, v5, v6);
}

uint64_t sub_24A3C7CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  return MEMORY[0x270FA2498](sub_24A3C7CDC, 0, 0);
}

uint64_t sub_24A3C7CDC()
{
  if (qword_26B1773A8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B1778E8;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v2;
  uint64_t v3 = type metadata accessor for Reporter();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
  *uint64_t v2 = v0;
  v2[1] = sub_24A3C7DE0;
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 40, v1, v3, v4, v5);
}

uint64_t sub_24A3C7DE0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3C80C0, 0, 0);
  }
  else
  {
    *(_WORD *)(v2 + 16) = 514;
    *(void *)(v2 + 104) = *(void *)(v2 + 40);
    *(void *)(v2 + 24) = 0;
    *(void *)(v2 + 32) = 0;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v2 + 112) = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_24A3C7F74;
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = *(void *)(v2 + 80);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v7 = *(void *)(v2 + 64);
    uint64_t v8 = *(void *)(v2 + 48);
    return sub_24A3C1F74(v8, v6, v7, v4, v5, v2 + 16, 0);
  }
}

uint64_t sub_24A3C7F74()
{
  uint64_t v2 = *(void **)(*v1 + 104);
  uint64_t v3 = *v1;
  *(void *)(v3 + 120) = v0;
  swift_task_dealloc();

  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24A3C80D8, 0, 0);
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_24A3C80C0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24A3C80D8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24A3C8144()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24A3CAC1C;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2697923A8 + dword_2697923A8);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[2] = v8;
  void *v8 = v7;
  v8[1] = sub_24A3CAC1C;
  return v10(v2, v3, v4, v5, v6);
}

uint64_t sub_24A3C825C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A3C82B8()
{
  unint64_t result = qword_2697923C8;
  if (!qword_2697923C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697923C8);
  }
  return result;
}

void sub_24A3C830C(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = *a1 + 1;
  if (__OFADD__(*a1, 1))
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v3 = *(char **)(v2 + 16);
  if (*(void *)&v3[OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageLimit] < v5)
  {
    if (qword_26B1773A0 == -1)
    {
LABEL_4:
      uint64_t v6 = sub_24A3D4308();
      __swift_project_value_buffer(v6, (uint64_t)qword_26B177388);
      uint64_t v7 = v3;
      uint64_t v8 = sub_24A3D42E8();
      os_log_type_t v9 = sub_24A3D4508();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 134349056;
        sub_24A3D4578();

        _os_log_impl(&dword_24A3BA000, v8, v9, "CloudTelemetry sendOneMessage limit (%{public}ld) exceeded", v10, 0xCu);
        MEMORY[0x24C5C3D30](v10, -1, -1);
      }
      else
      {
      }
      char v16 = 1;
      goto LABEL_14;
    }
LABEL_16:
    swift_once();
    goto LABEL_4;
  }
  *a1 = v5;
  if (qword_26B1773A0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24A3D4308();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B177388);
  uint64_t v12 = v3;
  uint64_t v13 = sub_24A3D42E8();
  os_log_type_t v14 = sub_24A3D44F8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 134349312;
    sub_24A3D4578();
    *(_WORD *)(v15 + 12) = 2050;
    sub_24A3D4578();

    _os_log_impl(&dword_24A3BA000, v13, v14, "active sendOneMessage count now %{public}ld/%{public}ld", (uint8_t *)v15, 0x16u);
    MEMORY[0x24C5C3D30](v15, -1, -1);
  }
  else
  {
  }
  char v16 = 0;
LABEL_14:
  *a2 = v16;
}

uint64_t sub_24A3C8590()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24A3C85D8()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24A3CAC1C;
  *(void *)(v3 + 96) = v2;
  *(_OWORD *)(v3 + 80) = v4;
  return MEMORY[0x270FA2498](sub_24A3C5C50, 0, 0);
}

uint64_t sub_24A3C868C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A3C86C4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_24A3C8774;
  return MEMORY[0x270FA2498](sub_24A3C4428, 0, 0);
}

uint64_t sub_24A3C8774(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_24A3C8878(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_24A3C8888(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = *a1 + 1;
  if (__OFADD__(*a1, 1))
  {
    __break(1u);
LABEL_10:
    swift_once();
    goto LABEL_4;
  }
  if (v3 > 4)
  {
    char v8 = 1;
    goto LABEL_8;
  }
  *a1 = v3;
  if (qword_26B1773A0 != -1) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v4 = sub_24A3D4308();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B177388);
  uint64_t v5 = sub_24A3D42E8();
  os_log_type_t v6 = sub_24A3D44E8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    sub_24A3D4578();
    _os_log_impl(&dword_24A3BA000, v5, v6, "Legacy task count incremented, now %ld.", v7, 0xCu);
    MEMORY[0x24C5C3D30](v7, -1, -1);
  }

  char v8 = 0;
LABEL_8:
  *a2 = v8;
}

uint64_t sub_24A3C89D0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_24A3C8A28()
{
  long long v10 = *(_OWORD *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  __int16 v5 = *(_WORD *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + 8) = sub_24A3BC540;
  *(void *)(v7 + 136) = v3;
  *(void *)(v7 + 144) = v6;
  *(void *)(v7 + 128) = v4;
  *(_WORD *)(v7 + 192) = v5;
  *(_OWORD *)(v7 + 112) = v8;
  *(void *)(v7 + 104) = v2;
  *(_OWORD *)(v7 + 88) = v10;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_24A3C49A0, 0, 0);
}

uint64_t sub_24A3C8B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24A3C8B40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24A3D4658();
  __break(1u);
  return result;
}

uint64_t sub_24A3C8C34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24A3D4258() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_24A3D4658();
  __break(1u);
  return result;
}

uint64_t sub_24A3C8D8C()
{
  uint64_t v1 = v0;
  uint64_t v139 = *MEMORY[0x263EF8340];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269792470);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v104 = (char *)v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v102 - v6;
  MEMORY[0x270FA5388](v5);
  v116 = (char *)v102 - v8;
  uint64_t v122 = sub_24A3D4258();
  uint64_t v9 = *(void *)(v122 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v122);
  v103 = (char *)v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v113 = (char *)v102 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v115 = (char *)v102 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v124 = (char *)v102 - v17;
  MEMORY[0x270FA5388](v16);
  v118 = (char *)v102 - v18;
  uint64_t v19 = (void *)MEMORY[0x263F8EE78];
  v136 = (void *)MEMORY[0x263F8EE78];
  BOOL v20 = NSHomeDirectory();
  uint64_t v21 = sub_24A3D43A8();
  unint64_t v23 = v22;

  uint64_t v24 = sub_24A3C7060(0, 1, 1, v19);
  int64_t v26 = v24[2];
  unint64_t v25 = v24[3];
  int64_t v27 = v26 + 1;
  if (v26 >= v25 >> 1) {
LABEL_90:
  }
    uint64_t v24 = sub_24A3C7060((void *)(v25 > 1), v27, 1, v24);
  v108 = v24;
  v24[2] = v27;
  v107 = v24 + 4;
  uint64_t v28 = &v24[2 * v26 + 4];
  *uint64_t v28 = v21;
  v28[1] = v23;
  id v29 = objc_msgSend(self, sel_defaultManager);
  os_log_type_t v30 = v108;
  id v134 = v29;
  uint64_t v106 = v108[2];
  if (v106)
  {
    int64_t v27 = v9 + 8;
    v133 = (void (*)(char *, uint64_t, int64_t))(v9 + 56);
    v130 = (void (**)(char *, int64_t))(v9 + 48);
    v131 = (unsigned int (**)(char *, uint64_t, int64_t))(v9 + 16);
    v127 = (char **)(v9 + 32);
    swift_bridgeObjectRetain();
    unint64_t v31 = 0;
    unint64_t v105 = 0x800000024A3D6410;
    int64_t v26 = v122;
    int64_t v123 = v9 + 8;
    uint64_t v114 = v9;
    while (1)
    {
      unint64_t v25 = v30[2];
      if (v31 >= v25)
      {
LABEL_89:
        __break(1u);
        goto LABEL_90;
      }
      unint64_t v117 = v31;
      swift_bridgeObjectRetain();
      unint64_t v23 = (unint64_t)v124;
      sub_24A3D4208();
      swift_bridgeObjectRelease();
      int64_t v32 = v26;
      uint64_t v33 = v118;
      sub_24A3D4228();
      v125 = *(void (**)(unint64_t, int64_t))v27;
      v125(v23, v32);
      uint64_t v21 = (uint64_t)v33;
      char v34 = sub_24A3D4238();
      if (v1) {
        break;
      }
      if ((v34 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v35 = (void *)sub_24A3D4218();
      *(void *)&long long v137 = 0;
      unint64_t v23 = (unint64_t)objc_msgSend(v134, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v35, 0, 0, &v137);

      uint64_t v36 = (void *)v137;
      int64_t v26 = v122;
      if (!v23)
      {
        id v99 = (id)v137;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        sub_24A3D41F8();

        uint64_t v100 = v122;
        swift_willThrow();

        v125((unint64_t)v118, v100);
        return v128;
      }
      uint64_t v37 = sub_24A3D4438();
      id v38 = v36;

      v111 = *(void **)(v37 + 16);
      if (v111)
      {
        v102[1] = (unint64_t)v133 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        unint64_t v23 = 0;
        unint64_t v120 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
        unint64_t v112 = v37 + v120;
        uint64_t v39 = v115;
        uint64_t v21 = (uint64_t)v116;
        uint64_t v110 = v37;
        while (1)
        {
          unint64_t v25 = *(void *)(v37 + 16);
          if (v23 >= v25) {
            break;
          }
          uint64_t v43 = *(void *)(v9 + 72);
          v129 = *(void (**)(uint64_t, unint64_t, int64_t))(v9 + 16);
          v129(v21, v112 + v43 * v23, v26);
          v132 = *(void (**)(uint64_t, uint64_t, uint64_t, int64_t))(v9 + 56);
          v132(v21, 0, 1, v26);
          unint64_t v128 = *(void *)(v9 + 48);
          if (((unsigned int (*)(uint64_t, uint64_t, int64_t))v128)(v21, 1, v26) == 1) {
            goto LABEL_53;
          }
          unint64_t v119 = v23;
          v126 = (void (*)(char *, uint64_t, int64_t))*v127;
          v126(v39, v21, v26);
          sub_24A3D4248();
          char v44 = sub_24A3D4418();
          swift_bridgeObjectRelease();
          if (v44)
          {
            int v45 = (void *)sub_24A3D4218();
            *(void *)&long long v137 = 0;
            id v46 = objc_msgSend(v134, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v45, 0, 0, &v137);

            os_log_type_t v47 = (void *)v137;
            if (!v46)
            {
              id v96 = (id)v137;
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_24A3D41F8();

              uint64_t v97 = v122;
              swift_willThrow();

              v98 = (void (*)(char *, uint64_t))v125;
              v125((unint64_t)v115, v97);
              v98(v118, v97);
              return v128;
            }
            v121 = v1;
            uint64_t v48 = sub_24A3D4438();
            id v49 = v47;

            uint64_t v9 = *(void *)(v48 + 16);
            uint64_t v109 = v48;
            if (v9)
            {
              unint64_t v23 = v48 + v120;
              uint64_t v50 = (void (*)(char *, int64_t))v125;
              while (1)
              {
                v129((uint64_t)v7, v23, v26);
                v132((uint64_t)v7, 0, 1, v26);
                if (((unsigned int (*)(char *, uint64_t, int64_t))v128)(v7, 1, v26) == 1) {
                  break;
                }
                uint64_t v51 = v124;
                v126(v124, (uint64_t)v7, v26);
                uint64_t v52 = (void *)sub_24A3D4218();
                v50(v51, v26);
                *(void *)&long long v137 = 0;
                id v53 = objc_msgSend(v134, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v52, 0, 0, &v137);

                id v54 = (id)v137;
                if (v53)
                {
                  uint64_t v55 = v7;
                  uint64_t v21 = sub_24A3D4438();

                  int64_t v27 = *(void *)(v21 + 16);
                  uint64_t v1 = v136;
                  uint64_t v7 = (char *)v136[2];
                  int64_t v26 = (int64_t)&v7[v27];
                  if (__OFADD__(v7, v27))
                  {
                    __break(1u);
LABEL_85:
                    __break(1u);
LABEL_86:
                    __break(1u);
LABEL_87:
                    __break(1u);
                    goto LABEL_88;
                  }
                  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  if (!isUniquelyReferenced_nonNull_native || (unint64_t v25 = v1[3] >> 1, (uint64_t)v25 < v26))
                  {
                    if ((uint64_t)v7 <= v26) {
                      int64_t v57 = (int64_t)&v7[v27];
                    }
                    else {
                      int64_t v57 = (int64_t)v7;
                    }
                    uint64_t v1 = (void *)sub_24A3C6DF8(isUniquelyReferenced_nonNull_native, v57, 1, (unint64_t)v1);
                    unint64_t v25 = v1[3] >> 1;
                  }
                  uint64_t v7 = v55;
                  int64_t v26 = v122;
                  if (*(void *)(v21 + 16))
                  {
                    uint64_t v58 = v1[2];
                    v25 -= v58;
                    if ((uint64_t)v25 < v27) {
                      goto LABEL_86;
                    }
                    uint64_t v59 = (char *)v1 + v120 + v58 * v43;
                    if (v21 + v120 < (unint64_t)&v59[v27 * v43]
                      && (unint64_t)v59 < v21 + v120 + v27 * v43)
                    {
                      uint64_t result = sub_24A3D4658();
                      __break(1u);
                      return result;
                    }
                    swift_arrayInitWithCopy();
                    if (v27)
                    {
                      uint64_t v61 = v1[2];
                      BOOL v62 = __OFADD__(v61, v27);
                      unint64_t v25 = v61 + v27;
                      if (v62) {
                        goto LABEL_87;
                      }
                      v1[2] = v25;
                    }
                  }
                  else if (v27)
                  {
                    goto LABEL_85;
                  }
                  swift_bridgeObjectRelease();
                  v136 = v1;
                  uint64_t v50 = (void (*)(char *, int64_t))v125;
                }
                else
                {
                  uint64_t v63 = v54;
                  uint64_t v64 = (void *)sub_24A3D41F8();

                  swift_willThrow();
                  v121 = 0;
                }
                v23 += v43;
                --v9;
                int64_t v27 = v123;
                if (!v9) {
                  goto LABEL_46;
                }
              }
            }
            else
            {
LABEL_46:
              v132((uint64_t)v7, 1, 1, v26);
            }
            swift_bridgeObjectRelease();
            uint64_t v1 = v121;
            uint64_t v9 = v114;
            uint64_t v39 = v115;
            uint64_t v21 = (uint64_t)v116;
            uint64_t v37 = v110;
          }
          else
          {
            sub_24A3D4248();
            sub_24A3D4418();
            swift_bridgeObjectRelease();
            uint64_t v65 = (void *)sub_24A3D4218();
            *(void *)&long long v137 = 0;
            id v66 = objc_msgSend(v134, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v65, 0, 0, &v137);

            id v67 = (void *)v137;
            uint64_t v37 = v110;
            if (v66)
            {
              uint64_t v40 = sub_24A3D4438();
              id v41 = v67;

              uint64_t v42 = v40;
              int64_t v27 = v123;
              sub_24A3C6308(v42);
            }
            else
            {
              id v68 = (id)v137;
              uint64_t v69 = (void *)sub_24A3D41F8();

              swift_willThrow();
              uint64_t v1 = 0;
            }
            uint64_t v39 = v115;
            uint64_t v21 = (uint64_t)v116;
          }
          unint64_t v23 = v119 + 1;
          v125((unint64_t)v39, v26);
          if ((void *)v23 == v111)
          {
            v132(v21, 1, 1, v26);
            goto LABEL_53;
          }
        }
LABEL_88:
        __break(1u);
        goto LABEL_89;
      }
      uint64_t v21 = (uint64_t)v116;
      (*(void (**)(char *, uint64_t, uint64_t, int64_t))v133)(v116, 1, 1, v26);
LABEL_53:
      swift_bridgeObjectRelease();
LABEL_6:
      unint64_t v31 = v117 + 1;
      v125((unint64_t)v118, v26);
      os_log_type_t v30 = v108;
      if (v31 == v106)
      {
        swift_bridgeObjectRelease_n();
        xpc_object_t v70 = (void (*)(unint64_t, int64_t))v136;
        goto LABEL_56;
      }
    }

    uint64_t v1 = 0;
LABEL_5:
    int64_t v26 = v122;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  xpc_object_t v70 = (void (*)(unint64_t, int64_t))MEMORY[0x263F8EE78];
  int64_t v26 = v122;
LABEL_56:
  uint64_t v71 = *((void *)v70 + 2);
  v121 = v1;
  if (v71)
  {
    uint64_t v73 = *(void (**)(char *, uint64_t, int64_t))(v9 + 16);
    uint64_t v72 = v9 + 16;
    unint64_t v74 = (*(unsigned __int8 *)(v72 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 64);
    v125 = v70;
    v126 = (void (*)(char *, uint64_t, int64_t))v74;
    uint64_t v75 = (uint64_t)v70 + v74;
    v132 = *(void (**)(uint64_t, uint64_t, uint64_t, int64_t))(v72 + 56);
    v133 = v73;
    v131 = (unsigned int (**)(char *, uint64_t, int64_t))(v72 + 32);
    v76 = (void (**)(char *, char *, int64_t))(v72 + 16);
    v127 = (char **)*MEMORY[0x263F080B8];
    uint64_t v114 = v72;
    v130 = (void (**)(char *, int64_t))(v72 - 8);
    unint64_t v128 = MEMORY[0x263F8EE78];
    uint64_t v77 = (void (**)(char *, uint64_t, uint64_t, int64_t))(v72 + 40);
    v124 = (char *)((v72 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000);
    v129 = (void (*)(uint64_t, unint64_t, int64_t))(MEMORY[0x263F8EE58] + 8);
    while (1)
    {
      v80 = v104;
      v133(v104, v75, v26);
      v81 = *v77;
      (*v77)(v80, 0, 1, v26);
      if ((*v131)(v80, 1, v26) == 1) {
        break;
      }
      v82 = *v76;
      (*v76)(v113, v80, v26);
      sub_24A3D4248();
      v83 = (void *)sub_24A3D4378();
      swift_bridgeObjectRelease();
      *(void *)&long long v137 = 0;
      id v84 = objc_msgSend(v134, sel_attributesOfItemAtPath_error_, v83, &v137);

      v85 = (void *)v137;
      if (v84)
      {
        type metadata accessor for FileAttributeKey(0);
        sub_24A3CA760(&qword_269792478, type metadata accessor for FileAttributeKey);
        uint64_t v86 = sub_24A3D4348();
        id v87 = v85;

        if (*(void *)(v86 + 16))
        {
          v88 = v127;
          unint64_t v89 = sub_24A3C77C8((uint64_t)v88);
          if (v90)
          {
            sub_24A3BFF70(*(void *)(v86 + 56) + 32 * v89, (uint64_t)&v137);
          }
          else
          {
            long long v137 = 0u;
            long long v138 = 0u;
          }
        }
        else
        {
          long long v137 = 0u;
          long long v138 = 0u;
        }
        swift_bridgeObjectRelease();
        int64_t v26 = v122;
        if (*((void *)&v138 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0 && v135 >= 1)
          {
            v133(v103, (uint64_t)v113, v26);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v128 = sub_24A3C6DF8(0, *(void *)(v128 + 16) + 1, 1, v128);
            }
            unint64_t v92 = *(void *)(v128 + 16);
            unint64_t v91 = *(void *)(v128 + 24);
            if (v92 >= v91 >> 1) {
              unint64_t v128 = sub_24A3C6DF8(v91 > 1, v92 + 1, 1, v128);
            }
            unint64_t v93 = v128;
            *(void *)(v128 + 16) = v92 + 1;
            v94 = (char *)v126 + v93 + v92 * (void)v132;
            int64_t v26 = v122;
            v82(v94, v103, v122);
          }
        }
        else
        {
          sub_24A3C825C((uint64_t)&v137, &qword_26B176B40);
        }
      }
      else
      {
        id v78 = (id)v137;
        v79 = (void *)sub_24A3D41F8();

        swift_willThrow();
        v121 = 0;
        int64_t v26 = v122;
      }
      (*v130)(v113, v26);
      v75 += (uint64_t)v132;
      if (!--v71)
      {
        v81(v104, 1, 1, v26);
        break;
      }
    }
  }
  else
  {
    v95 = *(void (**)(char *, uint64_t, uint64_t, int64_t))(v9 + 56);
    unint64_t v128 = MEMORY[0x263F8EE78];
    v95(v104, 1, 1, v26);
  }

  swift_bridgeObjectRelease();
  return v128;
}

unint64_t sub_24A3C9D88()
{
  unint64_t result = qword_269792438;
  if (!qword_269792438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792438);
  }
  return result;
}

unint64_t sub_24A3C9DE0()
{
  unint64_t result = qword_269792440;
  if (!qword_269792440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792440);
  }
  return result;
}

unint64_t sub_24A3C9E38()
{
  unint64_t result = qword_269792448;
  if (!qword_269792448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792448);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for LegacyClientError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LegacyClientError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LegacyClientError(void *a1, void *a2)
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

void *assignWithTake for LegacyClientError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyClientError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyClientError(uint64_t result, int a2, int a3)
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

uint64_t sub_24A3C9FD0()
{
  return 0;
}

ValueMetadata *type metadata accessor for LegacyClientError()
{
  return &type metadata for LegacyClientError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t sub_24A3CA000(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24A3CA008(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Mode()
{
  return &type metadata for Mode;
}

uint64_t destroy for TransportConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14CloudTelemetry22TransportConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TransportConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TransportConfiguration(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransportConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TransportConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TransportConfiguration()
{
  return &type metadata for TransportConfiguration;
}

uint64_t type metadata accessor for CloudTelemetry()
{
  return self;
}

uint64_t method lookup function for Reporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Reporter);
}

uint64_t getEnumTagSinglePayload for Reporter.CloudTelemetryFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Reporter.CloudTelemetryFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24A3CA2F8);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Reporter.CloudTelemetryFeatureFlags()
{
  return &type metadata for Reporter.CloudTelemetryFeatureFlags;
}

uint64_t _s14CloudTelemetry4ModeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14CloudTelemetry4ModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24A3CA48CLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Reporter.Error()
{
  return &type metadata for Reporter.Error;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

unint64_t sub_24A3CA4D8()
{
  unint64_t result = qword_269792458;
  if (!qword_269792458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792458);
  }
  return result;
}

unint64_t sub_24A3CA52C()
{
  unint64_t result = qword_269792460;
  if (!qword_269792460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792460);
  }
  return result;
}

unint64_t sub_24A3CA580()
{
  unint64_t result = qword_269792468;
  if (!qword_269792468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792468);
  }
  return result;
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_24A3CA5E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_24A3CA634(void *a1)
{
  if (__OFSUB__(*a1, 1))
  {
    __break(1u);
  }
  else
  {
    --*a1;
    if (qword_26B1773A0 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v1 = sub_24A3D4308();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B177388);
  int v2 = sub_24A3D42E8();
  os_log_type_t v3 = sub_24A3D44E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    sub_24A3D4578();
    _os_log_impl(&dword_24A3BA000, v2, v3, "Legacy task count decremented, now %ld.", v4, 0xCu);
    MEMORY[0x24C5C3D30](v4, -1, -1);
  }
}

uint64_t sub_24A3CA760(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A3CA7A8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A3CA7E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24A3CAC1C;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269792570 + dword_269792570);
  return v6(a1, v4);
}

void sub_24A3CA898(void *a1)
{
  if (__OFSUB__(*a1, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(void **)(v1 + 16);
    --*a1;
    if (qword_26B1773A0 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v3 = sub_24A3D4308();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B177388);
  id v4 = v2;
  uint64_t v5 = sub_24A3D42E8();
  os_log_type_t v6 = sub_24A3D44F8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134349312;
    sub_24A3D4578();
    *(_WORD *)(v7 + 12) = 2050;
    sub_24A3D4578();

    _os_log_impl(&dword_24A3BA000, v5, v6, "active sendOneMessage count now %{public}ld/%{public}ld", (uint8_t *)v7, 0x16u);
    MEMORY[0x24C5C3D30](v7, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_24A3CAA08()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A3CAA40(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A3BC540;
  v3[7] = a1;
  return MEMORY[0x270FA2498](sub_24A3C33A4, 0, 0);
}

unint64_t sub_24A3CAAEC()
{
  unint64_t result = qword_26B176B58;
  if (!qword_26B176B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B176B58);
  }
  return result;
}

uint64_t sub_24A3CAB40()
{
  return sub_24A3CA760(&qword_2697924C0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_24A3CAB88()
{
  return sub_24A3CA760(&qword_2697924C8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_24A3CABD0()
{
  return sub_24A3CA760(&qword_2697924D0, type metadata accessor for FileAttributeKey);
}

uint64_t XPCTypeConnection.getter()
{
  return MEMORY[0x263EF86F0];
}

uint64_t XPCTypeEndpoint.getter()
{
  return MEMORY[0x263EF8718];
}

uint64_t XPCTypeNull.getter()
{
  return MEMORY[0x263EF8758];
}

uint64_t XPCTypeBool.getter()
{
  return MEMORY[0x263EF86E0];
}

uint64_t XPCTypeInt64.getter()
{
  return MEMORY[0x263EF8738];
}

uint64_t XPCTypeUInt64.getter()
{
  return MEMORY[0x263EF87A0];
}

uint64_t XPCTypeDouble.getter()
{
  return MEMORY[0x263EF8710];
}

uint64_t XPCTypeData.getter()
{
  return MEMORY[0x263EF86F8];
}

uint64_t XPCTypeDate.getter()
{
  return MEMORY[0x263EF8700];
}

uint64_t XPCTypeString.getter()
{
  return MEMORY[0x263EF8798];
}

uint64_t XPCTypeUUID.getter()
{
  return MEMORY[0x263EF87A8];
}

uint64_t XPCTypeShmem.getter()
{
  return MEMORY[0x263EF8790];
}

uint64_t XPCTypeArray.getter()
{
  return MEMORY[0x263EF86D8];
}

uint64_t XPCTypeDictionary.getter()
{
  return MEMORY[0x263EF8708];
}

uint64_t XPCTypeError.getter()
{
  return MEMORY[0x263EF8720];
}

uint64_t XPCTypeActivity.getter()
{
  return MEMORY[0x263EF86D0];
}

const char *SubmitEventsActivityConfig.identifier.unsafeMutableAddressor()
{
  return "submit";
}

uint64_t static SubmitEventsActivityConfig.identifier.getter()
{
  return 0x74696D627573;
}

uint64_t sub_24A3CAD1C()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26B176C30);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C08);
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24A3D5A40;
  id v4 = (void *)(v3 + v2);
  uint64_t v5 = (char *)v4 + *(int *)(v0 + 48);
  *id v4 = *MEMORY[0x263EF82A0];
  *uint64_t v5 = 1;
  type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  os_log_type_t v6 = (void *)((char *)v4 + v1 + *(int *)(v0 + 48));
  *(void *)((char *)v4 + v1) = *MEMORY[0x263EF81A0];
  *os_log_type_t v6 = 86400;
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (void *)((char *)v4 + 2 * v1);
  uint64_t v8 = (void *)((char *)v7 + *(int *)(v0 + 48));
  *uint64_t v7 = *MEMORY[0x263EF81C0];
  void *v8 = 43200;
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (void *)((char *)v4 + 3 * v1);
  uint64_t v10 = (void *)((char *)v9 + *(int *)(v0 + 48));
  *uint64_t v9 = *MEMORY[0x263EF8280];
  *uint64_t v10 = sub_24A3D43F8();
  v10[1] = v11;
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (void *)((char *)v4 + 4 * v1);
  uint64_t v13 = (char *)v12 + *(int *)(v0 + 48);
  *uint64_t v12 = *MEMORY[0x263EF8180];
  unsigned char *v13 = 0;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF8270])
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v15 = (void *)((char *)v4 + 5 * v1);
  uint64_t v16 = (char *)v15 + *(int *)(v0 + 48);
  void *v15 = *MEMORY[0x263EF8270];
  *uint64_t v16 = 1;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF8298])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v17 = (void *)((char *)v4 + 6 * v1);
  uint64_t v18 = (void *)((char *)v17 + *(int *)(v0 + 48));
  *uint64_t v17 = *MEMORY[0x263EF8298];
  *uint64_t v18 = 43200;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF82D0])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v19 = (void *)((char *)&v4[v1] - v1);
  BOOL v20 = (char *)v19 + *(int *)(v0 + 48);
  *uint64_t v19 = *MEMORY[0x263EF82D0];
  *BOOL v20 = 1;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF82C8])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v21 = &v4[v1];
  unint64_t v22 = (char *)v21 + *(int *)(v0 + 48);
  *uint64_t v21 = *MEMORY[0x263EF82C8];
  *unint64_t v22 = 1;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF8260])
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v23 = (void *)((char *)v4 + 9 * v1);
  uint64_t v24 = (void *)((char *)v23 + *(int *)(v0 + 48));
  *unint64_t v23 = *MEMORY[0x263EF8260];
  *uint64_t v24 = 5242880;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF81B8])
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v25 = (void *)((char *)v4 + 10 * v1);
  int64_t v26 = (void *)((char *)v25 + *(int *)(v0 + 48));
  *unint64_t v25 = *MEMORY[0x263EF81B8];
  *int64_t v26 = *MEMORY[0x263EF8210];
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF81D0])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int64_t v27 = (void *)((char *)v4 + 11 * v1);
  uint64_t v28 = (void *)((char *)v27 + *(int *)(v0 + 48));
  void *v27 = *MEMORY[0x263EF81D0];
  *uint64_t v28 = 0xD000000000000025;
  v28[1] = 0x800000024A3D6750;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (*MEMORY[0x263EF81C8])
  {
    id v29 = (void *)((char *)v4 + 12 * v1);
    os_log_type_t v30 = (void *)((char *)v29 + *(int *)(v0 + 48));
    *id v29 = *MEMORY[0x263EF81C8];
    *os_log_type_t v30 = 1;
    swift_storeEnumTagMultiPayload();
    unint64_t v31 = sub_24A3CB474(v3);
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t result = swift_deallocClassInstance();
    static SubmitEventsActivityConfig.activityFlags = v31;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t *SubmitEventsActivityConfig.activityFlags.unsafeMutableAddressor()
{
  if (qword_26B177500 != -1) {
    swift_once();
  }
  return &static SubmitEventsActivityConfig.activityFlags;
}

uint64_t static SubmitEventsActivityConfig.activityFlags.getter()
{
  if (qword_26B177500 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static SubmitEventsActivityConfig.activityFlags.setter(uint64_t a1)
{
  if (qword_26B177500 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static SubmitEventsActivityConfig.activityFlags = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SubmitEventsActivityConfig.activityFlags.modify())()
{
  if (qword_26B177500 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24A3CB2F8()
{
  if (qword_26B177500 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A3CB370()
{
  return 0x74696D627573;
}

ValueMetadata *type metadata accessor for SubmitEventsActivityConfig()
{
  return &type metadata for SubmitEventsActivityConfig;
}

unint64_t sub_24A3CB394(uint64_t a1)
{
  uint64_t v2 = sub_24A3D4718();
  return sub_24A3CB3D8(a1, v2);
}

unint64_t sub_24A3CB3D8(uint64_t a1, uint64_t a2)
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

unint64_t sub_24A3CB474(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C08);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C28);
    uint64_t v7 = (void *)sub_24A3D4648();
    uint64_t v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_24A3CB61C(v9, (uint64_t)v5);
      uint64_t v11 = *v5;
      unint64_t result = sub_24A3CB394(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for XPCObject();
      unint64_t result = sub_24A3CB684(v8, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_24A3CB61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A3CB684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned char *XPCObject.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (uint64_t *)((char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (uint64_t *)((char *)&v33 - v9);
  MEMORY[0x270FA5388](v8);
  char v13 = (uint64_t *)((char *)&v33 - v12);
  if (a1)
  {
    uint64_t v34 = v11;
    uint64_t v14 = swift_unknownObjectRetain();
    uint64_t v15 = MEMORY[0x24C5C4070](v14);
    if (XPCTypeNull.getter() == v15)
    {
      swift_unknownObjectRelease_n();
    }
    else
    {
      if (XPCTypeConnection.getter() == v15 || XPCTypeEndpoint.getter() == v15)
      {
LABEL_37:
        swift_unknownObjectRelease();
        void *v13 = a1;
        goto LABEL_28;
      }
      if (XPCTypeBool.getter() == v15)
      {
        BOOL value = xpc_BOOL_get_value(a1);
        swift_unknownObjectRelease_n();
        *(unsigned char *)char v13 = value;
      }
      else if (XPCTypeInt64.getter() == v15)
      {
        int64_t v20 = xpc_int64_get_value(a1);
        swift_unknownObjectRelease_n();
        void *v13 = v20;
      }
      else if (XPCTypeUInt64.getter() == v15)
      {
        uint64_t v21 = xpc_uint64_get_value(a1);
        swift_unknownObjectRelease_n();
        void *v13 = v21;
      }
      else if (XPCTypeDouble.getter() == v15)
      {
        double v22 = xpc_double_get_value(a1);
        swift_unknownObjectRelease_n();
        *(double *)char v13 = v22;
      }
      else
      {
        if (XPCTypeDate.getter() != v15)
        {
          if (XPCTypeData.getter() == v15)
          {
            unint64_t result = xpc_data_get_bytes_ptr(a1);
            if (result)
            {
              uint64_t v24 = result;
              size_t length = xpc_data_get_length(a1);
              uint64_t v26 = sub_24A3CCB1C(v24, length);
              uint64_t v28 = v27;
              swift_unknownObjectRelease_n();
              *uint64_t v10 = v26;
              v10[1] = v28;
              swift_storeEnumTagMultiPayload();
              uint64_t v29 = (uint64_t)v10;
LABEL_34:
              sub_24A3CB684(v29, (uint64_t)v13);
              goto LABEL_29;
            }
            __break(1u);
          }
          else
          {
            if (XPCTypeString.getter() != v15)
            {
              if (XPCTypeUUID.getter() != v15)
              {
                if (XPCTypeShmem.getter() != v15 && XPCTypeArray.getter() != v15)
                {
                  uint64_t v16 = XPCTypeDictionary.getter();
                  swift_unknownObjectRelease();
                  if (v16 != v15)
                  {
                    swift_unknownObjectRelease();
                    uint64_t v11 = v34;
                    goto LABEL_17;
                  }
                  void *v13 = a1;
                  goto LABEL_28;
                }
                goto LABEL_37;
              }
              unint64_t result = xpc_uuid_get_bytes(a1);
              if (result)
              {
                sub_24A3D4278();
                swift_unknownObjectRelease_n();
                goto LABEL_28;
              }
LABEL_41:
              __break(1u);
              return result;
            }
            unint64_t result = xpc_string_get_string_ptr(a1);
            if (result)
            {
              uint64_t v30 = sub_24A3D43F8();
              uint64_t v32 = v31;
              swift_unknownObjectRelease_n();
              *uint64_t v7 = v30;
              v7[1] = v32;
              swift_storeEnumTagMultiPayload();
              uint64_t v29 = (uint64_t)v7;
              goto LABEL_34;
            }
          }
          __break(1u);
          goto LABEL_41;
        }
        int64_t v23 = xpc_date_get_value(a1);
        swift_unknownObjectRelease_n();
        void *v13 = v23;
      }
    }
LABEL_28:
    swift_storeEnumTagMultiPayload();
LABEL_29:
    sub_24A3CB684((uint64_t)v13, a2);
    return (unsigned char *)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(a2, 0, 1, v4);
  }
LABEL_17:
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
  return (unsigned char *)v17(a2, 1, 1, v4);
}

uint64_t type metadata accessor for XPCObject()
{
  uint64_t result = qword_26B177510;
  if (!qword_26B177510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

xpc_object_t XPCObject.obj.getter()
{
  uint64_t v1 = v0;
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_24A3D4298();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &uuid[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v6 = type metadata accessor for XPCObject();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &uuid[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_24A3CCBD0(v1, (uint64_t)v8);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      return xpc_BOOL_create(*v8);
    case 3u:
      return xpc_int64_create(*(void *)v8);
    case 4u:
      return xpc_uint64_create(*(void *)v8);
    case 5u:
      return xpc_double_create(*(double *)v8);
    case 6u:
      return xpc_date_create(*(void *)v8);
    case 7u:
      uint64_t v12 = *(void *)v8;
      unint64_t v11 = *((void *)v8 + 1);
      switch(v11 >> 62)
      {
        case 1uLL:
          if (v12 >> 32 < (int)v12)
          {
            __break(1u);
LABEL_40:
            __break(1u);
            goto LABEL_41;
          }
          sub_24A3CCC8C(v12, v11);
          double v22 = (char *)sub_24A3D4178();
          if (!v22) {
            goto LABEL_18;
          }
          uint64_t v23 = sub_24A3D4198();
          if (__OFSUB__((int)v12, v23))
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
          }
          v22 += (int)v12 - v23;
LABEL_18:
          uint64_t v24 = sub_24A3D4188();
          if (v24 >= (v12 >> 32) - (int)v12) {
            uint64_t v25 = (v12 >> 32) - (int)v12;
          }
          else {
            uint64_t v25 = v24;
          }
          if (v22) {
            size_t v26 = v25;
          }
          else {
            size_t v26 = 0;
          }
          xpc_object_t v9 = xpc_data_create(v22, v26);
          sub_24A3CCC34(v12, v11);
LABEL_38:
          sub_24A3CCC34(v12, v11);
          return v9;
        case 2uLL:
          uint64_t v27 = *(void *)(v12 + 16);
          uint64_t v28 = *(void *)(v12 + 24);
          swift_retain();
          swift_retain();
          uint64_t v29 = (char *)sub_24A3D4178();
          if (!v29) {
            goto LABEL_28;
          }
          uint64_t v30 = sub_24A3D4198();
          if (__OFSUB__(v27, v30)) {
            goto LABEL_42;
          }
          v29 += v27 - v30;
LABEL_28:
          BOOL v31 = __OFSUB__(v28, v27);
          uint64_t v32 = v28 - v27;
          if (v31) {
            goto LABEL_40;
          }
          uint64_t v33 = sub_24A3D4188();
          if (v33 >= v32) {
            size_t v34 = v32;
          }
          else {
            size_t v34 = v33;
          }
          if (v29) {
            size_t v35 = v34;
          }
          else {
            size_t v35 = 0;
          }
          xpc_object_t v9 = xpc_data_create(v29, v35);
          swift_release();
          swift_release();
          goto LABEL_38;
        case 3uLL:
          memset(uuid, 0, 14);
          size_t v13 = 0;
          goto LABEL_37;
        default:
          *(void *)uuid = *(void *)v8;
          *(_WORD *)&uuid[8] = v11;
          uuid[10] = BYTE2(v11);
          uuid[11] = BYTE3(v11);
          uuid[12] = BYTE4(v11);
          size_t v13 = BYTE6(v11);
          uuid[13] = BYTE5(v11);
LABEL_37:
          xpc_object_t v9 = xpc_data_create(uuid, v13);
          goto LABEL_38;
      }
    case 8u:
      uint64_t v14 = sub_24A3D43C8();
      swift_bridgeObjectRelease();
      xpc_object_t v9 = xpc_string_create((const char *)(v14 + 32));
      swift_release();
      return v9;
    case 9u:
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v3 + 32))(v5, v8, v2);
      *(void *)uuid = sub_24A3D4288();
      *(_WORD *)&uuid[8] = v15;
      uuid[10] = v16;
      uuid[11] = v17;
      uuid[12] = v18;
      uuid[13] = v19;
      uuid[14] = v20;
      uuid[15] = v21;
      xpc_object_t v9 = xpc_uuid_create(uuid);
      (*(void (**)(unsigned __int8 *, uint64_t))(v3 + 8))(v5, v2);
      return v9;
    case 0xDu:
      return xpc_null_create();
    default:
      return *(xpc_object_t *)v8;
  }
}

BOOL static XPCObject.== infix(_:_:)()
{
  xpc_object_t v0 = XPCObject.obj.getter();
  xpc_object_t v1 = XPCObject.obj.getter();
  BOOL v2 = xpc_equal(v0, v1);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v2;
}

BOOL sub_24A3CC130()
{
  xpc_object_t v0 = XPCObject.obj.getter();
  xpc_object_t v1 = XPCObject.obj.getter();
  BOOL v2 = xpc_equal(v0, v1);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v2;
}

xpc_object_t XPCDictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  xpc_object_t v1 = sub_24A3CCCE4(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v1;
  sub_24A3BE8E0(a1, (uint64_t)v5, &qword_26B176BF0);
  uint64_t v7 = type metadata accessor for XPCObject();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) == 1)
  {
    sub_24A3C825C((uint64_t)v5, &qword_26B176BF0);
    xpc_object_t v8 = 0;
  }
  else
  {
    xpc_object_t v8 = XPCObject.obj.getter();
    sub_24A3C7A3C((uint64_t)v5);
  }
  uint64_t v9 = sub_24A3D43C8();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(v6, (const char *)(v9 + 32), v8);
  swift_unknownObjectRelease();
  sub_24A3C825C(a1, &qword_26B176BF0);
  return swift_release();
}

uint64_t XPCDictionary.keys.getter(void *a1)
{
  int64_t count = xpc_dictionary_get_count(a1);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || count > v3[3] >> 1)
  {
    if (v3[2] <= count) {
      int64_t v5 = count;
    }
    else {
      int64_t v5 = v3[2];
    }
    uint64_t v3 = sub_24A3C7060(isUniquelyReferenced_nonNull_native, v5, 0, v3);
  }
  size_t v13 = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &v13;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_24A3CD094;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_24A3CD15C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A3CC4C8;
  aBlock[3] = &block_descriptor;
  xpc_object_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = v13;
    swift_release();
    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_24A3CC4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

unsigned char *XPCDictionary.subscript.getter@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A3D43C8();
  xpc_object_t v5 = xpc_dictionary_get_value(a1, (const char *)(v4 + 32));
  swift_release();
  return XPCObject.init(_:)(v5, a2);
}

void (*XPCDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *uint64_t v7 = a2;
  size_t v8 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0) - 8) + 64);
  v7[3] = malloc(v8);
  v7[4] = malloc(v8);
  v7[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v7[6] = v9;
  uint64_t v10 = *v3;
  uint64_t v11 = sub_24A3D43C8();
  xpc_object_t v12 = xpc_dictionary_get_value(v10, (const char *)(v11 + 32));
  swift_release();
  XPCObject.init(_:)(v12, (uint64_t)v9);
  return sub_24A3CC68C;
}

void sub_24A3CC68C(uint64_t a1, char a2)
{
  BOOL v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 48);
  if (a2)
  {
    uint64_t v5 = v2[3];
    uint64_t v4 = v2[4];
    char v6 = (void **)v2[2];
    sub_24A3BE8E0(v3, v4, &qword_26B176BF0);
    uint64_t v7 = *v6;
    sub_24A3BE8E0(v4, v5, &qword_26B176BF0);
    uint64_t v8 = type metadata accessor for XPCObject();
    LODWORD(v5) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8);
    swift_bridgeObjectRetain();
    uint64_t v9 = v2[3];
    if (v5 == 1)
    {
      sub_24A3C825C(v2[3], &qword_26B176BF0);
      xpc_object_t v10 = 0;
    }
    else
    {
      xpc_object_t v10 = XPCObject.obj.getter();
      sub_24A3C7A3C(v9);
    }
    unsigned __int8 v18 = (void *)v2[5];
    unsigned __int8 v17 = (void *)v2[6];
    unsigned __int8 v20 = (void *)v2[3];
    unsigned __int8 v19 = (void *)v2[4];
    uint64_t v21 = sub_24A3D43C8();
    swift_bridgeObjectRelease();
    xpc_dictionary_set_value(v7, (const char *)(v21 + 32), v10);
    swift_unknownObjectRelease();
    sub_24A3C825C((uint64_t)v19, &qword_26B176BF0);
    swift_release();
    sub_24A3C825C((uint64_t)v17, &qword_26B176BF0);
  }
  else
  {
    uint64_t v11 = v2[5];
    xpc_object_t v12 = *(void **)v2[2];
    sub_24A3BE8E0(v3, v11, &qword_26B176BF0);
    uint64_t v13 = type metadata accessor for XPCObject();
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v11, 1, v13);
    swift_bridgeObjectRetain();
    uint64_t v15 = v2[5];
    if (v14 == 1)
    {
      sub_24A3C825C(v2[5], &qword_26B176BF0);
      xpc_object_t v16 = 0;
    }
    else
    {
      xpc_object_t v16 = XPCObject.obj.getter();
      sub_24A3C7A3C(v15);
    }
    unsigned __int8 v18 = (void *)v2[5];
    unsigned __int8 v17 = (void *)v2[6];
    unsigned __int8 v20 = (void *)v2[3];
    unsigned __int8 v19 = (void *)v2[4];
    uint64_t v22 = sub_24A3D43C8();
    swift_bridgeObjectRelease();
    xpc_dictionary_set_value(v12, (const char *)(v22 + 32), v16);
    swift_unknownObjectRelease();
    sub_24A3C825C((uint64_t)v17, &qword_26B176BF0);
    swift_release();
  }
  free(v17);
  free(v18);
  free(v19);
  free(v20);
  free(v2);
}

Swift::Bool __swiftcall XPCDictionary.contains(key:)(Swift::String key)
{
  BOOL v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A3D43C8();
  xpc_object_t v7 = xpc_dictionary_get_value(v2, (const char *)(v6 + 32));
  swift_release();
  XPCObject.init(_:)(v7, (uint64_t)v5);
  uint64_t v8 = type metadata accessor for XPCObject();
  LOBYTE(v7) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v5, 1, v8) != 1;
  sub_24A3C825C((uint64_t)v5, &qword_26B176BF0);
  return (char)v7;
}

uint64_t sub_24A3CCA18@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t v3 = sub_24A3CCCE4(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_24A3CCA58(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
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

uint64_t sub_24A3CCB1C(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24A3CCA58(__src, &__src[a2]);
  }
  sub_24A3D41A8();
  swift_allocObject();
  sub_24A3D4168();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24A3D4268();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_24A3CCBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A3CCC34(uint64_t a1, unint64_t a2)
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

uint64_t sub_24A3CCC8C(uint64_t a1, unint64_t a2)
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

xpc_object_t sub_24A3CCCE4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  char v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  xpc_object_t v7 = (char *)&v37 - v6;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176B18);
  uint64_t v8 = *(void *)(v44 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v44);
  uint64_t v42 = (uint64_t *)((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  id v41 = (uint64_t *)((char *)&v37 - v12);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v43 = (uint64_t *)((char *)&v37 - v16);
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v17 = *(void *)(a1 + 16);
  if (v17)
  {
    uint64_t v40 = (uint64_t)v43 + *(int *)(v44 + 48);
    uint64_t v18 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v19 = *(void *)(v8 + 72);
    uint64_t v38 = v15;
    uint64_t v39 = v19;
    do
    {
      uint64_t v22 = v43;
      sub_24A3BE8E0(v18, (uint64_t)v43, &qword_26B176B18);
      uint64_t v23 = v44;
      uint64_t v24 = (uint64_t)&v15[*(int *)(v44 + 48)];
      uint64_t v25 = (uint64_t *)v15;
      uint64_t v26 = *v22;
      uint64_t v27 = v22[1];
      *uint64_t v25 = *v22;
      v25[1] = v27;
      sub_24A3CB684(v40, v24);
      uint64_t v28 = *(int *)(v23 + 48);
      uint64_t v29 = v41;
      uint64_t v30 = (uint64_t)v41 + v28;
      *id v41 = v26;
      v29[1] = v27;
      uint64_t v46 = (uint64_t)v29 + v28;
      sub_24A3CCBD0(v24, v30);
      uint64_t v31 = *(int *)(v23 + 48);
      uint64_t v32 = v42;
      uint64_t v33 = (uint64_t)v42 + v31;
      *uint64_t v42 = v26;
      v32[1] = v27;
      sub_24A3CCBD0(v24, (uint64_t)v32 + v31);
      sub_24A3CB684(v33, (uint64_t)v7);
      uint64_t v34 = type metadata accessor for XPCObject();
      uint64_t v35 = *(void *)(v34 - 8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v7, 0, 1, v34);
      sub_24A3BE8E0((uint64_t)v7, (uint64_t)v5, &qword_26B176BF0);
      LODWORD(v34) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v5, 1, v34);
      swift_bridgeObjectRetain();
      if (v34 == 1)
      {
        sub_24A3C825C((uint64_t)v5, &qword_26B176BF0);
        xpc_object_t v20 = 0;
      }
      else
      {
        xpc_object_t v20 = XPCObject.obj.getter();
        sub_24A3C7A3C((uint64_t)v5);
      }
      uint64_t v21 = sub_24A3D43C8();
      swift_bridgeObjectRelease();
      xpc_dictionary_set_value(empty, (const char *)(v21 + 32), v20);
      swift_unknownObjectRelease();
      sub_24A3C825C((uint64_t)v7, &qword_26B176BF0);
      swift_release();
      uint64_t v15 = v38;
      sub_24A3C825C((uint64_t)v38, &qword_26B176B18);
      sub_24A3C7A3C(v46);
      v18 += v39;
      --v17;
    }
    while (v17);
  }
  return empty;
}

uint64_t sub_24A3CD084()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A3CD094()
{
  xpc_object_t v1 = *(void ***)(v0 + 16);
  uint64_t v2 = sub_24A3D43F8();
  uint64_t v4 = v3;
  char v5 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *xpc_object_t v1 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    char v5 = sub_24A3C7060(0, v5[2] + 1, 1, v5);
    *xpc_object_t v1 = v5;
  }
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    char v5 = sub_24A3C7060((void *)(v7 > 1), v8 + 1, 1, v5);
    *xpc_object_t v1 = v5;
  }
  v5[2] = v8 + 1;
  uint64_t v9 = &v5[2 * v8];
  v9[4] = v2;
  v9[5] = v4;
  return 1;
}

uint64_t sub_24A3CD14C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A3CD15C()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v10 = *a2;
        unint64_t v9 = a2[1];
        sub_24A3CCC8C(v10, v9);
        *a1 = v10;
        a1[1] = v9;
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        uint64_t v12 = sub_24A3D4298();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for XPCObject(uint64_t *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 10:
    case 11:
    case 12:
      uint64_t result = swift_unknownObjectRelease();
      break;
    case 7:
      uint64_t v3 = *a1;
      unint64_t v4 = a1[1];
      uint64_t result = sub_24A3CCC34(v3, v4);
      break;
    case 8:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 9:
      uint64_t v5 = sub_24A3D4298();
      uint64_t v6 = *(uint64_t (**)(uint64_t *, uint64_t))(*(void *)(v5 - 8) + 8);
      uint64_t result = v6(a1, v5);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *initializeWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_7;
    case 7u:
      uint64_t v7 = *a2;
      unint64_t v6 = a2[1];
      sub_24A3CCC8C(v7, v6);
      *a1 = v7;
      a1[1] = v6;
      goto LABEL_7;
    case 8u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 9u:
      uint64_t v9 = sub_24A3D4298();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *assignWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24A3C7A3C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_8;
      case 7u:
        uint64_t v7 = *a2;
        unint64_t v6 = a2[1];
        sub_24A3CCC8C(v7, v6);
        *a1 = v7;
        a1[1] = v6;
        goto LABEL_8;
      case 8u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 9u:
        uint64_t v8 = sub_24A3D4298();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 9)
  {
    uint64_t v6 = sub_24A3D4298();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24A3C7A3C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 9)
    {
      uint64_t v6 = sub_24A3D4298();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24A3CDA48()
{
  uint64_t result = sub_24A3D4298();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCDictionary()
{
  return &type metadata for XPCDictionary;
}

uint64_t sub_24A3CDB24(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_24A3CDB58()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24A3CDB90()
{
  uint64_t v0 = sub_24A3D4308();
  __swift_allocate_value_buffer(v0, qword_26B177838);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B177838);
  return sub_24A3D42F8();
}

uint64_t variable initialization expression of XPCActivity.currentTask()
{
  return 0;
}

uint64_t sub_24A3CDC10()
{
  return swift_retain();
}

uint64_t sub_24A3CDC48(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 128) = a1;
  return swift_release();
}

uint64_t (*sub_24A3CDC90())()
{
  return j__swift_endAccess;
}

uint64_t variable initialization expression of XPCActivity.disabled()
{
  return 0;
}

uint64_t sub_24A3CDCEC()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 136);
}

uint64_t sub_24A3CDD20(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 136) = a1;
  return result;
}

uint64_t (*sub_24A3CDD60())()
{
  return j_j__swift_endAccess;
}

uint64_t *XPCActivity.makeHandler.unsafeMutableAddressor()
{
  return &static XPCActivity.makeHandler;
}

uint64_t static XPCActivity.makeHandler.getter()
{
  swift_beginAccess();
  uint64_t v0 = static XPCActivity.makeHandler;
  sub_24A3CDE18(static XPCActivity.makeHandler);
  return v0;
}

uint64_t sub_24A3CDE18(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t static XPCActivity.makeHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = static XPCActivity.makeHandler;
  static XPCActivity.makeHandler = a1;
  qword_26B177910 = a2;
  sub_24A3CDE18(a1);
  sub_24A3C8878(v4);
  return sub_24A3C8878(a1);
}

uint64_t (*static XPCActivity.makeHandler.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall XPCActivity.register(disabled:)(Swift::Bool_optional disabled)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(self, sel_mainBundle);
  id v5 = objc_msgSend(v4, sel_bundleIdentifier);

  if (v5)
  {
    sub_24A3D43A8();

    if (disabled.value != 2) {
      (*(void (**)(Swift::Bool))(*v2 + 144))(disabled.value);
    }
    sub_24A3D45A8();
    swift_bridgeObjectRelease();
    uint64_t aBlock = 0x6C655464756F6C43;
    unint64_t v22 = 0xEF2E797274656D65;
    sub_24A3D43E8();
    swift_bridgeObjectRelease();
    sub_24A3D43E8();
    (*(void (**)(void))(v2[15] + 32))();
    sub_24A3D43E8();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)*MEMORY[0x263EF8188];
    uint64_t v25 = sub_24A3CFD04;
    uint64_t v26 = v2;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v22 = 1107296256;
    uint64_t v23 = sub_24A3CE430;
    uint64_t v24 = &block_descriptor_0;
    uint64_t v7 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v8 = sub_24A3D43C8();
    xpc_activity_register((const char *)(v8 + 32), v6, v7);
    swift_release();
    _Block_release(v7);
    if (qword_26B1774F0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24A3D4308();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B177838);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24A3D42E8();
    os_log_type_t v11 = sub_24A3D44F8();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t aBlock = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_24A3C7170(0x6C655464756F6C43, 0xEF2E797274656D65, &aBlock);
      sub_24A3D4578();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A3BA000, v10, v11, "registered: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C3D30](v13, -1, -1);
      MEMORY[0x24C5C3D30](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_26B1774F0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_24A3D4308();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B177838);
    swift_retain_n();
    oslog = sub_24A3D42E8();
    os_log_type_t v15 = sub_24A3D44F8();
    if (os_log_type_enabled(oslog, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t aBlock = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v18 = (*(uint64_t (**)(void))(v2[15] + 32))();
      uint64_t v27 = sub_24A3C7170(v18, v19, &aBlock);
      sub_24A3D4578();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24A3BA000, oslog, v15, "unable to register: %s, nil bundleIdentifier", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C3D30](v17, -1, -1);
      MEMORY[0x24C5C3D30](v16, -1, -1);
    }
    else
    {
      swift_release_n();
    }
  }
}

uint64_t sub_24A3CE430(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24A3CE490()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for XPCObject();
  uint64_t v4 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C00);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (int64_t *)((char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = *(void *)(v0 + 112);
  uint64_t v14 = *(void *)(v0 + 120);
  os_log_type_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 24);
  uint64_t v16 = *(void *)(v15(v13, v14) + 16);
  swift_bridgeObjectRelease();
  if (!v16) {
    return 0;
  }
  xpc_object_t v40 = XPCDictionary.init()();
  uint64_t result = v15(v13, v14);
  int64_t v39 = 0;
  uint64_t v18 = *(void *)(result + 64);
  uint64_t v34 = result + 64;
  uint64_t v19 = 1 << *(unsigned char *)(result + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v18;
  unint64_t v22 = (void (**)(char *, void, uint64_t, uint64_t))(v4 + 56);
  int64_t v35 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v36 = result;
  int64_t v33 = v35 - 1;
  uint64_t v37 = v4;
  if ((v20 & v18) == 0) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v23 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v24 = v23 | (v39 << 6);
  while (2)
  {
    uint64_t v25 = *(void *)(v36 + 56);
    *uint64_t v10 = *(void *)(*(void *)(v36 + 48) + 8 * v24);
    uint64_t v26 = v25 + *(void *)(v4 + 72) * v24;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF8);
    sub_24A3CCBD0(v26, (uint64_t)v10 + *(int *)(v27 + 48));
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v10, 0, 1, v27);
    while (1)
    {
      sub_24A3D0260((uint64_t)v10, (uint64_t)v12);
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v12, 1, v32) == 1)
      {
        swift_release();
        return (uint64_t)v40;
      }
      sub_24A3CB684((uint64_t)&v12[*(int *)(v32 + 48)], (uint64_t)v6);
      sub_24A3D43F8();
      sub_24A3CCBD0((uint64_t)v6, (uint64_t)v3);
      (*v22)(v3, 0, 1, v38);
      XPCDictionary.subscript.setter((uint64_t)v3);
      uint64_t result = sub_24A3C7A3C((uint64_t)v6);
      uint64_t v4 = v37;
      if (v21) {
        goto LABEL_7;
      }
LABEL_9:
      int64_t v28 = v39 + 1;
      if (__OFADD__(v39, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v28 < v35)
      {
        unint64_t v29 = *(void *)(v34 + 8 * v28);
        if (v29) {
          goto LABEL_12;
        }
        int64_t v30 = v39 + 2;
        ++v39;
        if (v28 + 1 < v35)
        {
          unint64_t v29 = *(void *)(v34 + 8 * v30);
          if (v29) {
            goto LABEL_15;
          }
          int64_t v39 = v28 + 1;
          if (v28 + 2 < v35)
          {
            unint64_t v29 = *(void *)(v34 + 8 * (v28 + 2));
            if (v29)
            {
              v28 += 2;
              goto LABEL_12;
            }
            int64_t v30 = v28 + 3;
            int64_t v39 = v28 + 2;
            if (v28 + 3 < v35) {
              break;
            }
          }
        }
      }
LABEL_26:
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF8);
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 1, 1, v31);
      unint64_t v21 = 0;
    }
    unint64_t v29 = *(void *)(v34 + 8 * v30);
    if (v29)
    {
LABEL_15:
      int64_t v28 = v30;
LABEL_12:
      unint64_t v21 = (v29 - 1) & v29;
      unint64_t v24 = __clz(__rbit64(v29)) + (v28 << 6);
      int64_t v39 = v28;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v28 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v28 >= v35)
    {
      int64_t v39 = v33;
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v34 + 8 * v28);
    ++v30;
    if (v29) {
      goto LABEL_12;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_24A3CE938(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for XPCActivityHandle();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  uint64_t v8 = (_xpc_activity_s *)swift_unknownObjectRetain();
  xpc_activity_state_t state = xpc_activity_get_state(v8);
  if (state == 2)
  {
    if (qword_26B1774F0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24A3D4308();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B177838);
    swift_retain_n();
    uint64_t v18 = sub_24A3D42E8();
    os_log_type_t v19 = sub_24A3D4528();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v41 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v22 = (*(uint64_t (**)(void))(*(void *)(v2 + 120) + 32))();
      uint64_t v40 = sub_24A3C7170(v22, v23, &v41);
      sub_24A3D4578();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24A3BA000, v18, v19, "run: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C3D30](v21, -1, -1);
      MEMORY[0x24C5C3D30](v20, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v34 = *(_xpc_activity_s **)(v7 + 16);
    if (xpc_activity_should_defer(v34))
    {
      xpc_activity_set_state(v34, 3);
    }
    else
    {
      xpc_activity_set_state(v34, 4);
      uint64_t v36 = sub_24A3D4498();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v6, 1, 1, v36);
      uint64_t v37 = (void *)swift_allocObject();
      v37[2] = 0;
      v37[3] = 0;
      v37[4] = v2;
      v37[5] = v7;
      swift_retain();
      sub_24A3C5934((uint64_t)v6, (uint64_t)&unk_269792580, (uint64_t)v37);
    }
    goto LABEL_28;
  }
  if (!state)
  {
    if (qword_26B1774F0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24A3D4308();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B177838);
    swift_retain_n();
    uint64_t v11 = sub_24A3D42E8();
    os_log_type_t v12 = sub_24A3D44F8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v41 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(v2 + 120) + 32))();
      uint64_t v40 = sub_24A3C7170(v15, v16, &v41);
      sub_24A3D4578();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24A3BA000, v11, v12, "checkin: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C3D30](v14, -1, -1);
      MEMORY[0x24C5C3D30](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v31 = sub_24A3CE490();
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      xpc_object_t v33 = xpc_activity_copy_criteria(*(xpc_activity_t *)(v7 + 16));
      swift_unknownObjectRelease();
      if (!v33) {
        xpc_activity_set_criteria(*(xpc_activity_t *)(v7 + 16), v32);
      }
      swift_unknownObjectRelease();
    }
    goto LABEL_28;
  }
  if (qword_26B1774F0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_24A3D4308();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B177838);
  swift_retain_n();
  swift_retain_n();
  int64_t v39 = sub_24A3D42E8();
  os_log_type_t v25 = sub_24A3D4508();
  if (os_log_type_enabled(v39, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v41 = v27;
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v28 = (*(uint64_t (**)(void))(*(void *)(v2 + 120) + 32))();
    uint64_t v40 = sub_24A3C7170(v28, v29, &v41);
    sub_24A3D4578();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v26 + 12) = 2048;
    xpc_activity_state_t v30 = xpc_activity_get_state(*(xpc_activity_t *)(v7 + 16));
    swift_release();
    uint64_t v40 = v30;
    sub_24A3D4578();
    swift_release();
    _os_log_impl(&dword_24A3BA000, v39, v25, "activity: %s, encountered unrecognized XPC activity state: %ld", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5C3D30](v27, -1, -1);
    MEMORY[0x24C5C3D30](v26, -1, -1);

LABEL_28:
    swift_release();
    return;
  }
  swift_release_n();
  swift_release_n();
  int64_t v35 = v39;
}

uint64_t sub_24A3CEFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A3CF000, a4, 0);
}

uint64_t sub_24A3CF000()
{
  sub_24A3CF060(*(void *)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24A3CF060(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(uint64_t (**)(uint64_t))(v4 + 136))(v6))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 16), 5);
    if (qword_26B1774F0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24A3D4308();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B177838);
    swift_retain_n();
    v22[0] = (id)sub_24A3D42E8();
    os_log_type_t v10 = sub_24A3D4508();
    if (os_log_type_enabled((os_log_t)v22[0], v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      aBlock[0] = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = (*(uint64_t (**)(void))(v1[15] + 32))();
      v22[1] = (id)sub_24A3C7170(v13, v14, aBlock);
      sub_24A3D4578();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24A3BA000, (os_log_t)v22[0], v10, "disabled: skipping %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5C3D30](v12, -1, -1);
      MEMORY[0x24C5C3D30](v11, -1, -1);
    }
    else
    {
      swift_release_n();
      id v21 = v22[0];
    }
  }
  else
  {
    aBlock[4] = (uint64_t)sub_24A3CFD50;
    aBlock[5] = (uint64_t)v1;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24A3CE430;
    aBlock[3] = (uint64_t)&block_descriptor_8;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v16 = xpc_activity_add_eligibility_changed_handler();
    _Block_release(v15);
    uint64_t v17 = sub_24A3D4498();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
    unint64_t v18 = sub_24A3CFD58();
    os_log_type_t v19 = (void *)swift_allocObject();
    v19[2] = v2;
    v19[3] = v18;
    v19[4] = v16;
    v19[5] = a1;
    v19[6] = v2;
    v19[7] = v4;
    swift_retain_n();
    swift_retain();
    uint64_t v20 = sub_24A3C13EC((uint64_t)v8, (uint64_t)&unk_269792558, (uint64_t)v19);
    (*(void (**)(uint64_t))(*v2 + 120))(v20);
  }
}

uint64_t sub_24A3CF440(_xpc_activity_s *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C20);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = xpc_activity_should_defer(a1);
  if (result)
  {
    uint64_t v8 = sub_24A3D4498();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = a2;
    swift_retain();
    sub_24A3C5934((uint64_t)v6, (uint64_t)&unk_269792568, (uint64_t)v9);
    return swift_release();
  }
  return result;
}

uint64_t sub_24A3CF550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24A3CF570, a4, 0);
}

uint64_t sub_24A3CF570()
{
  if ((*(uint64_t (**)(void))(**(void **)(v0 + 16) + 112))())
  {
    uint64_t v1 = *(void *)(v0 + 16);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1772E0);
    sub_24A3D44B8();
    (*(void (**)(void))(*(void *)v1 + 120))(0);
    swift_release();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24A3CF658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  return MEMORY[0x270FA2498](sub_24A3CF67C, a6, 0);
}

uint64_t sub_24A3CF67C()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = (int *)static XPCActivity.makeHandler;
  v0[11] = static XPCActivity.makeHandler;
  if (v2)
  {
    uint64_t v3 = v0[10];
    v0[12] = qword_26B177910;
    uint64_t v4 = *(void *)(v3 + 112);
    uint64_t v5 = *(void *)(v3 + 120);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[13] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24A3CF7A4;
    uint64_t v7 = v0[10];
    return v8(v4, v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A3CF7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[5] = v2;
  v4[6] = a1;
  v4[7] = a2;
  uint64_t v5 = v3[11];
  uint64_t v6 = v3[10];
  v4[14] = a1;
  swift_task_dealloc();
  sub_24A3C8878(v5);
  return MEMORY[0x270FA2498](sub_24A3CF900, v6, 0);
}

uint64_t sub_24A3CF900()
{
  sub_24A3D44D8();
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v1 + 16) + **(int **)(v1 + 16));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24A3CFA6C;
  return v5(ObjectType, v1);
}

uint64_t sub_24A3CFA6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24A3CFB7C, v1, 0);
}

uint64_t sub_24A3CFB7C()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  swift_unknownObjectRelease();
  sub_24A3CFEB0(v3, v1, v2);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t XPCActivity.__allocating_init(handlerType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v4 + 120) = a2;
  *(void *)(v4 + 128) = 0;
  *(unsigned char *)(v4 + 136) = 0;
  *(void *)(v4 + 112) = a1;
  return v4;
}

uint64_t XPCActivity.init(handlerType:)(uint64_t a1, uint64_t a2)
{
  swift_defaultActor_initialize();
  *(void *)(v2 + 120) = a2;
  *(void *)(v2 + 128) = 0;
  *(unsigned char *)(v2 + 136) = 0;
  *(void *)(v2 + 112) = a1;
  return v2;
}

uint64_t XPCActivity.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCActivity.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t XPCActivity.unownedExecutor.getter()
{
  return v0;
}

uint64_t type metadata accessor for XPCActivityHandle()
{
  return self;
}

uint64_t type metadata accessor for XPCActivity()
{
  return self;
}

uint64_t sub_24A3CFD50(_xpc_activity_s *a1)
{
  return sub_24A3CF440(a1, v1);
}

unint64_t sub_24A3CFD58()
{
  unint64_t result = qword_26B176B60;
  if (!qword_26B176B60)
  {
    type metadata accessor for XPCActivity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B176B60);
  }
  return result;
}

uint64_t sub_24A3CFDAC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24A3CFDF4()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24A3BC540;
  v5[9] = v3;
  v5[10] = v4;
  v5[8] = v2;
  return MEMORY[0x270FA2498](sub_24A3CF67C, v4, 0);
}

void sub_24A3CFEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    xpc_activity_remove_eligibility_changed_handler();
  }
  xpc_activity_set_state(*(xpc_activity_t *)(a2 + 16), 5);
  if (qword_26B1774F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24A3D4308();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B177838);
  swift_retain_n();
  uint64_t v6 = sub_24A3D42E8();
  os_log_type_t v7 = sub_24A3D4528();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a3 + 120) + 32))();
    sub_24A3C7170(v10, v11, &v12);
    sub_24A3D4578();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24A3BA000, v6, v7, "done: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5C3D30](v9, -1, -1);
    MEMORY[0x24C5C3D30](v8, -1, -1);
  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_24A3D0084()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A3D00C4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24A3CAC1C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24A3CF570, v2, 0);
}

uint64_t sub_24A3D016C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A3D01B4()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24A3BC540;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x270FA2498](sub_24A3CF000, v3, 0);
}

uint64_t sub_24A3D0260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

const char *MessageKeys.eventType.unsafeMutableAddressor()
{
  return "et";
}

uint64_t static MessageKeys.eventType.getter()
{
  return 29797;
}

void *MessageKeys.clientType.unsafeMutableAddressor()
{
  return &static MessageKeys.clientType;
}

uint64_t static MessageKeys.clientType.getter()
{
  return 29795;
}

void *MessageKeys.legacyClient.unsafeMutableAddressor()
{
  return &static MessageKeys.legacyClient;
}

uint64_t static MessageKeys.legacyClient.getter()
{
  return 31084;
}

void *MessageKeys.payload.unsafeMutableAddressor()
{
  return &static MessageKeys.payload;
}

uint64_t static MessageKeys.payload.getter()
{
  return 27760;
}

void *MessageKeys.sessionID.unsafeMutableAddressor()
{
  return &static MessageKeys.sessionID;
}

uint64_t static MessageKeys.sessionID.getter()
{
  return 25705;
}

const char *MessageKeys.hierarchyLevel.unsafeMutableAddressor()
{
  return "hlvl";
}

uint64_t static MessageKeys.hierarchyLevel.getter()
{
  return 1819700328;
}

const char *MessageKeys.hierarchyToken.unsafeMutableAddressor()
{
  return "hktn";
}

uint64_t static MessageKeys.hierarchyToken.getter()
{
  return 1853123432;
}

const char *MessageKeys.samplingUUID.unsafeMutableAddressor()
{
  return "suuid";
}

uint64_t static MessageKeys.samplingUUID.getter()
{
  return 0x6469757573;
}

void *MessageKeys.transportConfiguration.unsafeMutableAddressor()
{
  return &static MessageKeys.transportConfiguration;
}

uint64_t static MessageKeys.transportConfiguration.getter()
{
  return 25460;
}

const char *MessageKeys.allowed.unsafeMutableAddressor()
{
  return "allowed";
}

uint64_t static MessageKeys.allowed.getter()
{
  return 0x6465776F6C6C61;
}

const char *MessageKeys.denied.unsafeMutableAddressor()
{
  return "denied";
}

uint64_t static MessageKeys.denied.getter()
{
  return 0x6465696E6564;
}

const char *MessageKeys.overrideSampling.unsafeMutableAddressor()
{
  return "orsf";
}

uint64_t static MessageKeys.overrideSampling.getter()
{
  return 1718841967;
}

void *MessageKeys.sendOneMessageSessionInfo.unsafeMutableAddressor()
{
  return &static MessageKeys.sendOneMessageSessionInfo;
}

uint64_t static MessageKeys.sendOneMessageSessionInfo.getter()
{
  return 7549299;
}

void *MessageKeys.sendOneMessageEvent.unsafeMutableAddressor()
{
  return &static MessageKeys.sendOneMessageEvent;
}

uint64_t static MessageKeys.sendOneMessageEvent.getter()
{
  return 6631795;
}

void *MessageKeys.tcAllowsCellularAccess.unsafeMutableAddressor()
{
  return &static MessageKeys.tcAllowsCellularAccess;
}

uint64_t static MessageKeys.tcAllowsCellularAccess.getter()
{
  return 97;
}

void *MessageKeys.tcAllowsExpensiveAccess.unsafeMutableAddressor()
{
  return &static MessageKeys.tcAllowsExpensiveAccess;
}

uint64_t static MessageKeys.tcAllowsExpensiveAccess.getter()
{
  return 101;
}

void *MessageKeys.tcBundleID.unsafeMutableAddressor()
{
  return &static MessageKeys.tcBundleID;
}

uint64_t static MessageKeys.tcBundleID.getter()
{
  return 98;
}

ValueMetadata *type metadata accessor for MessageKeys()
{
  return &type metadata for MessageKeys;
}

uint64_t XPCError.description.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription")) {
    return sub_24A3D43F8();
  }
  else {
    return 0x64696C61766E693CLL;
  }
}

uint64_t XPCError.errorDescription.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription")) {
    return sub_24A3D43F8();
  }
  else {
    return 0x64696C61766E693CLL;
  }
}

uint64_t sub_24A3D053C()
{
  return XPCError.errorDescription.getter(*v0);
}

uint64_t sub_24A3D0544()
{
  return XPCError.description.getter(*v0);
}

uint64_t XPCIncomingConnection.auditToken.getter()
{
  return 0;
}

unsigned char *XPCIncomingConnection.entitlementValue(forKey:)@<X0>(uint64_t a1@<X8>)
{
  sub_24A3D43C8();
  uint64_t v2 = (void *)xpc_connection_copy_entitlement_value();
  swift_release();
  return XPCObject.init(_:)(v2, a1);
}

void *XPCIncomingConnection.makeConnection(targetQ:delegate:)(void *a1, uint64_t a2, uint64_t a3, _xpc_connection_s *a4)
{
  type metadata accessor for XPCConnection();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = a1;
  uint64_t v9 = sub_24A3D2104(a4, v8, a2, a3);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v9;
}

void *XPCConnection.__allocating_init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  id v8 = sub_24A3D2104(a1, a2, a3, a4);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v8;
}

uint64_t type metadata accessor for XPCConnection()
{
  return self;
}

uint64_t variable initialization expression of XPCConnection.conn()
{
  return 0;
}

uint64_t XPCConnection.conn.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t XPCConnection.conn.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*XPCConnection.conn.modify())()
{
  return j__swift_endAccess;
}

uint64_t variable initialization expression of XPCConnection.delegate()
{
  return 0;
}

uint64_t XPCConnection.delegate.getter()
{
  swift_beginAccess();
  return MEMORY[0x24C5C3E00](v0 + 24);
}

uint64_t XPCConnection.delegate.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*XPCConnection.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  long long v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x24C5C3E00](v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24A3D096C;
}

void sub_24A3D096C(uint64_t a1, char a2)
{
  long long v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 32) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id XPCConnection.targetQ.getter()
{
  return *(id *)(v0 + 40);
}

uint64_t sub_24A3D09F8()
{
  uint64_t v0 = sub_24A3D4308();
  __swift_allocate_value_buffer(v0, qword_26B177438);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B177438);
  return sub_24A3D42F8();
}

uint64_t XPCConnection.__allocating_init(targetQ:delegate:)(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  XPCConnection.init(targetQ:delegate:)(a1, a2, a3);
  return v6;
}

void *XPCConnection.init(targetQ:delegate:)(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v4[2] = 0;
  v4[4] = 0;
  swift_unknownObjectWeakInit();
  os_log_type_t v7 = xpc_connection_create(0, a1);
  swift_beginAccess();
  v4[4] = a3;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  v4[2] = v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4[5] = a1;
  uint64_t v8 = qword_26B177450;
  uint64_t v9 = a1;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24A3D4308();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B177438);
  unint64_t v11 = sub_24A3D42E8();
  os_log_type_t v12 = sub_24A3D4528();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_24A3BA000, v11, v12, "A.", v13, 2u);
    MEMORY[0x24C5C3D30](v13, -1, -1);
  }

  xpc_connection_set_target_queue(v7, v9);
  v16[4] = sub_24A3D2324;
  v16[5] = v4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_24A3CE430;
  v16[3] = &block_descriptor_1;
  unint64_t v14 = _Block_copy(v16);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(v7, v14);
  _Block_release(v14);
  xpc_connection_activate(v7);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v4;
}

uint64_t XPCConnection.eventHandler(obj:)(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C5C3E00](v1 + 24);
  if (result)
  {
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v5 = MEMORY[0x24C5C4070](a1);
    uint64_t v6 = XPCTypeError.getter();
    uint64_t ObjectType = swift_getObjectType();
    if (v5 == v6) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    }
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, ObjectType, v4);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCConnection.__allocating_init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, _xpc_connection_s *a6)
{
  uint64_t v12 = swift_allocObject();
  XPCConnection.init(machService:targetQ:listen:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t XPCConnection.init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, _xpc_connection_s *a6)
{
  uint64_t v7 = v6;
  *(void *)(v6 + 16) = 0;
  unint64_t v11 = (_xpc_connection_s **)(v6 + 16);
  v11[2] = 0;
  swift_unknownObjectWeakInit();
  if (a4) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  uint64_t v13 = sub_24A3D43C8();
  unint64_t v14 = a3;
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v13 + 32), v14, v12);

  swift_release();
  swift_beginAccess();
  v11[2] = a6;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  *unint64_t v11 = mach_service;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v11[3] = (_xpc_connection_s *)v14;
  uint64_t v16 = qword_26B177450;
  uint64_t v17 = v14;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24A3D4308();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B177438);
  os_log_type_t v19 = sub_24A3D42E8();
  os_log_type_t v20 = sub_24A3D4528();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v21 = 0;
    _os_log_impl(&dword_24A3BA000, v19, v20, "B.", v21, 2u);
    MEMORY[0x24C5C3D30](v21, -1, -1);
  }

  xpc_connection_set_target_queue(mach_service, v17);
  v24[4] = sub_24A3D2324;
  v24[5] = v7;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 1107296256;
  v24[2] = sub_24A3CE430;
  v24[3] = &block_descriptor_3;
  uint64_t v22 = _Block_copy(v24);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(mach_service, v22);
  _Block_release(v22);
  xpc_connection_activate(mach_service);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v7;
}

uint64_t XPCConnection.__allocating_init(serviceName:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  XPCConnection.init(serviceName:targetQ:listen:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

void XPCConnection.init(serviceName:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  v7[2] = 0;
  unint64_t v11 = (xpc_connection_t *)(v7 + 2);
  v7[4] = 0;
  swift_unknownObjectWeakInit();
  if (a4)
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v7[4] = a6;
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    swift_beginAccess();
    v7[2] = 0;
    swift_unknownObjectRelease();
    v7[5] = a3;
    return;
  }
  uint64_t v12 = sub_24A3D43C8();
  uint64_t v13 = a3;
  swift_bridgeObjectRelease();
  xpc_connection_t v14 = xpc_connection_create((const char *)(v12 + 32), v13);

  swift_release();
  swift_beginAccess();
  v7[4] = a6;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  v7[2] = v14;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v7[5] = v13;
  uint64_t v15 = qword_26B177450;
  uint64_t v16 = v13;
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_24A3D4308();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B177438);
  uint64_t v18 = sub_24A3D42E8();
  os_log_type_t v19 = sub_24A3D4528();
  if (os_log_type_enabled(v18, v19))
  {
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v20 = 0;
    _os_log_impl(&dword_24A3BA000, v18, v19, "C.", v20, 2u);
    MEMORY[0x24C5C3D30](v20, -1, -1);
  }

  if (!*v11)
  {
    __break(1u);
    goto LABEL_12;
  }
  xpc_connection_set_target_queue(*v11, v16);
  id v21 = *v11;
  if (!*v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v24[4] = sub_24A3D2324;
  v24[5] = v7;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 1107296256;
  v24[2] = sub_24A3CE430;
  v24[3] = &block_descriptor_6;
  uint64_t v22 = _Block_copy(v24);
  swift_retain();
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_set_event_handler(v21, v22);
  _Block_release(v22);
  swift_unknownObjectRelease();
  if (v7[2])
  {
    unint64_t v23 = (_xpc_connection_s *)swift_unknownObjectRetain();
    xpc_connection_activate(v23);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    return;
  }
LABEL_13:
  __break(1u);
}

void *XPCConnection.init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_24A3D2104(a1, a2, a3, a4);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v5;
}

uint64_t XPCConnection.__allocating_init(listener:targetQ:delegate:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  XPCConnection.init(listener:targetQ:delegate:)(a1, a2, a3, a4);
  return v8;
}

_xpc_connection_s *XPCConnection.init(listener:targetQ:delegate:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v5[2] = 0;
  v5[4] = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  uint64_t result = *(_xpc_connection_s **)(a1 + 16);
  if (result)
  {
    uint64_t v10 = xpc_endpoint_create(result);
    unint64_t v11 = xpc_connection_create_from_endpoint(v10);
    swift_beginAccess();
    v5[2] = v11;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    swift_beginAccess();
    v5[4] = a4;
    swift_unknownObjectWeakAssign();
    v5[5] = a2;
    uint64_t v12 = qword_26B177450;
    uint64_t v13 = a2;
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_24A3D4308();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B177438);
    uint64_t v15 = sub_24A3D42E8();
    os_log_type_t v16 = sub_24A3D4528();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_24A3BA000, v15, v16, "E.", v17, 2u);
      MEMORY[0x24C5C3D30](v17, -1, -1);
    }

    xpc_connection_set_target_queue(v11, v13);
    aBlock[4] = sub_24A3D2324;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24A3CE430;
    aBlock[3] = &block_descriptor_9;
    uint64_t v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    xpc_connection_set_event_handler(v11, v18);
    _Block_release(v18);
    xpc_connection_activate(v11);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();

    swift_unknownObjectRelease();
    return (_xpc_connection_s *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_xpc_connection_s *XPCConnection.endpoint()()
{
  swift_beginAccess();
  uint64_t result = *(_xpc_connection_s **)(v0 + 16);
  if (result) {
    return xpc_endpoint_create(result);
  }
  __break(1u);
  return result;
}

uint64_t XPCConnection.send(_:)()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(_xpc_connection_s **)(v0 + 16);
  if (v2)
  {
    swift_unknownObjectRetain();
    long long v3 = (void *)j__swift_unknownObjectRetain();
    xpc_connection_send_message(v2, v3);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t XPCConnection.sendWithReply(_:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 96) = a2;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = v2;
  return MEMORY[0x270FA2498](sub_24A3D18B0, 0, 0);
}

uint64_t sub_24A3D18B0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = swift_beginAccess();
  uint64_t v10 = *(void *)(v1 + 16);
  *(void *)(v0 + 64) = v10;
  if (v10)
  {
    char v11 = *(unsigned char *)(v0 + 96);
    uint64_t v12 = *(void *)(v0 + 48);
    uint64_t v13 = *(void *)(*(void *)(v0 + 56) + 40);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 72) = v14;
    *(void *)(v14 + 16) = v10;
    *(void *)(v14 + 24) = v12;
    *(unsigned char *)(v14 + 32) = v11;
    *(void *)(v14 + 40) = v13;
    swift_unknownObjectRetain();
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v15;
    void *v15 = v0;
    v15[1] = sub_24A3D19F8;
    unint64_t v6 = 0x800000024A3D6880;
    uint64_t v9 = &type metadata for XPCDictionary;
    uint64_t v7 = sub_24A3D2328;
    uint64_t v2 = v0 + 40;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 0xD000000000000011;
    uint64_t v8 = v14;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2360](v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_24A3D19F8()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24A3D1B7C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24A3D1B14;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24A3D1B14()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24A3D1B7C()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A3D1BE8(uint64_t a1, _xpc_connection_s *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176C10);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (void *)j__swift_unknownObjectRetain();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_24A3D2468;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A3CE430;
  aBlock[3] = &block_descriptor_16;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  xpc_connection_send_message_with_reply(a2, v10, a4, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

Swift::Bool __swiftcall OS_xpc_object.isError()()
{
  uint64_t v0 = MEMORY[0x24C5C4070]();
  return v0 == XPCTypeError.getter();
}

uint64_t XPCConnection.auditToken.getter()
{
  swift_beginAccess();
  if (!*(void *)(v0 + 16)) {
    __break(1u);
  }
  xpc_connection_get_audit_token();
  return 0;
}

_xpc_connection_s *XPCConnection.remoteUID.getter()
{
  swift_beginAccess();
  uint64_t result = *(_xpc_connection_s **)(v0 + 16);
  if (result) {
    return (_xpc_connection_s *)xpc_connection_get_euid(result);
  }
  __break(1u);
  return result;
}

uint64_t XPCConnection.deinit()
{
  uint64_t v1 = v0;
  if (qword_26B177450 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A3D4308();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B177438);
  uint64_t v3 = sub_24A3D42E8();
  os_log_type_t v4 = sub_24A3D4508();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_24A3BA000, v3, v4, "connection released", v5, 2u);
    MEMORY[0x24C5C3D30](v5, -1, -1);
  }

  swift_beginAccess();
  unint64_t v6 = *(_xpc_connection_s **)(v1 + 16);
  if (v6) {
    xpc_connection_cancel(v6);
  }
  swift_unknownObjectRelease();
  sub_24A3D2334(v1 + 24);

  return v1;
}

uint64_t XPCConnection.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_26B177450 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A3D4308();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B177438);
  uint64_t v3 = sub_24A3D42E8();
  os_log_type_t v4 = sub_24A3D4508();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_24A3BA000, v3, v4, "connection released", v5, 2u);
    MEMORY[0x24C5C3D30](v5, -1, -1);
  }

  swift_beginAccess();
  unint64_t v6 = *(_xpc_connection_s **)(v1 + 16);
  if (v6) {
    xpc_connection_cancel(v6);
  }
  swift_unknownObjectRelease();
  sub_24A3D2334(v1 + 24);

  return swift_deallocClassInstance();
}

Swift::OpaquePointer __swiftcall OS_xpc_object.type()()
{
}

void *sub_24A3D2104(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = v4;
  v5[2] = 0;
  v5[4] = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v5[2] = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  swift_beginAccess();
  v5[4] = a4;
  swift_unknownObjectWeakAssign();
  v5[5] = a2;
  uint64_t v9 = qword_26B177450;
  uint64_t v10 = a2;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24A3D4308();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B177438);
  uint64_t v12 = sub_24A3D42E8();
  os_log_type_t v13 = sub_24A3D4528();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_24A3BA000, v12, v13, "D.", v14, 2u);
    MEMORY[0x24C5C3D30](v14, -1, -1);
  }

  xpc_connection_set_target_queue(a1, v10);
  v17[4] = sub_24A3D2324;
  v17[5] = v5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_24A3CE430;
  v17[3] = &block_descriptor_19;
  uint64_t v15 = _Block_copy(v17);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(a1, v15);
  _Block_release(v15);
  xpc_connection_activate(a1);
  return v5;
}

uint64_t sub_24A3D2328(uint64_t a1)
{
  return sub_24A3D1BE8(a1, *(_xpc_connection_s **)(v1 + 16), *(void *)(v1 + 24), *(NSObject **)(v1 + 40));
}

uint64_t sub_24A3D2334(uint64_t a1)
{
  return a1;
}

unint64_t sub_24A3D2360()
{
  unint64_t result = qword_26B176BE8;
  if (!qword_26B176BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B176BE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

ValueMetadata *type metadata accessor for XPCIncomingConnection()
{
  return &type metadata for XPCIncomingConnection;
}

uint64_t sub_24A3D23D4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176C10);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24A3D2468(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176C10);
  uint64_t v2 = MEMORY[0x24C5C4070](a1);
  if (v2 == XPCTypeError.getter())
  {
    sub_24A3D2360();
    swift_allocError();
    *uint64_t v5 = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176C10);
    return sub_24A3D4468();
  }
  else
  {
    uint64_t v3 = swift_unknownObjectRetain();
    XPCDictionary.init(_:)(v3);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B176C10);
    return sub_24A3D4478();
  }
}

uint64_t sub_24A3D2560(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = MEMORY[0x24C5C3E00](v1 + 24);
  if (result)
  {
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v5 = MEMORY[0x24C5C4070](a1);
    uint64_t v6 = XPCTypeError.getter();
    uint64_t ObjectType = swift_getObjectType();
    if (v5 == v6) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    }
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, ObjectType, v4);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

const char *PostInstallActivityConfig.identifier.unsafeMutableAddressor()
{
  return "postinstall";
}

uint64_t static PostInstallActivityConfig.identifier.getter()
{
  return 0x74736E6974736F70;
}

uint64_t sub_24A3D2680()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26B176C30);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C08);
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24A3D5ED0;
  uint64_t v4 = (void *)(v3 + v2);
  uint64_t v5 = (void *)((char *)v4 + *(int *)(v0 + 48));
  *uint64_t v4 = *MEMORY[0x263EF8280];
  *uint64_t v5 = sub_24A3D43F8();
  v5[1] = v6;
  type metadata accessor for XPCObject();
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (*MEMORY[0x263EF8270])
  {
    uint64_t v8 = (char *)v4 + v1 + *(int *)(v0 + 48);
    *(void *)((char *)v4 + v1) = *MEMORY[0x263EF8270];
    unsigned char *v8 = 1;
    uint64_t result = swift_storeEnumTagMultiPayload();
    if (*MEMORY[0x263EF8268])
    {
      uint64_t v9 = (void *)((char *)v4 + 2 * v1);
      uint64_t v10 = (char *)v9 + *(int *)(v0 + 48);
      *uint64_t v9 = *MEMORY[0x263EF8268];
      *uint64_t v10 = 1;
      swift_storeEnumTagMultiPayload();
      unint64_t v11 = sub_24A3CB474(v3);
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t result = swift_deallocClassInstance();
      static PostInstallActivityConfig.activityFlags = v11;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t *PostInstallActivityConfig.activityFlags.unsafeMutableAddressor()
{
  if (qword_26B1774F8 != -1) {
    swift_once();
  }
  return &static PostInstallActivityConfig.activityFlags;
}

uint64_t static PostInstallActivityConfig.activityFlags.getter()
{
  if (qword_26B1774F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static PostInstallActivityConfig.activityFlags.setter(uint64_t a1)
{
  if (qword_26B1774F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static PostInstallActivityConfig.activityFlags = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PostInstallActivityConfig.activityFlags.modify())()
{
  if (qword_26B1774F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24A3D2A00()
{
  if (qword_26B1774F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A3D2A78()
{
  return 0x74736E6974736F70;
}

ValueMetadata *type metadata accessor for PostInstallActivityConfig()
{
  return &type metadata for PostInstallActivityConfig;
}

const char *CacheCleanupActivityConfig.identifier.unsafeMutableAddressor()
{
  return "db-cleanup";
}

uint64_t static CacheCleanupActivityConfig.identifier.getter()
{
  return 0x6E61656C632D6264;
}

uint64_t sub_24A3D2AD0()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_26B176C30);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176C08);
  uint64_t v1 = *(void *)(*(void *)(v0 - 8) + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v0 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 - 8) + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_24A3D5F20;
  uint64_t v4 = (void *)(v3 + v2);
  uint64_t v5 = (char *)v4 + *(int *)(v0 + 48);
  *uint64_t v4 = *MEMORY[0x263EF82A0];
  *uint64_t v5 = 1;
  type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = (void *)((char *)v4 + v1 + *(int *)(v0 + 48));
  *(void *)((char *)v4 + v1) = *MEMORY[0x263EF81A0];
  *uint64_t v6 = 86400;
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (void *)((char *)v4 + 2 * v1);
  uint64_t v8 = (void *)((char *)v7 + *(int *)(v0 + 48));
  *uint64_t v7 = *MEMORY[0x263EF81C0];
  void *v8 = 43200;
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (void *)((char *)v4 + 3 * v1);
  uint64_t v10 = (void *)((char *)v9 + *(int *)(v0 + 48));
  *uint64_t v9 = *MEMORY[0x263EF8280];
  *uint64_t v10 = sub_24A3D43F8();
  v10[1] = v11;
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (void *)((char *)v4 + 4 * v1);
  os_log_type_t v13 = (char *)v12 + *(int *)(v0 + 48);
  *uint64_t v12 = *MEMORY[0x263EF8180];
  unsigned char *v13 = 0;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF8270])
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v15 = (void *)((char *)v4 + 5 * v1);
  os_log_type_t v16 = (char *)v15 + *(int *)(v0 + 48);
  void *v15 = *MEMORY[0x263EF8270];
  *os_log_type_t v16 = 1;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF8298])
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v17 = (void *)((char *)v4 + 6 * v1);
  uint64_t v18 = (void *)((char *)v17 + *(int *)(v0 + 48));
  *uint64_t v17 = *MEMORY[0x263EF8298];
  *uint64_t v18 = 43200;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF81B8])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  os_log_type_t v19 = (void *)((char *)&v4[v1] - v1);
  os_log_type_t v20 = (void *)((char *)v19 + *(int *)(v0 + 48));
  *os_log_type_t v19 = *MEMORY[0x263EF81B8];
  *os_log_type_t v20 = *MEMORY[0x263EF81F8];
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF81D0])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v21 = &v4[v1];
  uint64_t v22 = (void *)((char *)v21 + *(int *)(v0 + 48));
  *id v21 = *MEMORY[0x263EF81D0];
  *uint64_t v22 = 0xD000000000000025;
  v22[1] = 0x800000024A3D6750;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x263EF81C8])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v23 = (void *)((char *)v4 + 9 * v1);
  uint64_t v24 = (void *)((char *)v23 + *(int *)(v0 + 48));
  *unint64_t v23 = *MEMORY[0x263EF81C8];
  *uint64_t v24 = 1;
  uint64_t result = swift_storeEnumTagMultiPayload();
  if (*MEMORY[0x263EF81A8])
  {
    os_log_type_t v25 = (void *)((char *)v4 + 10 * v1);
    uint64_t v26 = (char *)v25 + *(int *)(v0 + 48);
    *os_log_type_t v25 = *MEMORY[0x263EF81A8];
    *uint64_t v26 = 1;
    swift_storeEnumTagMultiPayload();
    unint64_t v27 = sub_24A3CB474(v3);
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t result = swift_deallocClassInstance();
    static CacheCleanupActivityConfig.activityFlags = v27;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t *CacheCleanupActivityConfig.activityFlags.unsafeMutableAddressor()
{
  if (qword_26B177850 != -1) {
    swift_once();
  }
  return &static CacheCleanupActivityConfig.activityFlags;
}

uint64_t static CacheCleanupActivityConfig.activityFlags.getter()
{
  if (qword_26B177850 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static CacheCleanupActivityConfig.activityFlags.setter(uint64_t a1)
{
  if (qword_26B177850 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static CacheCleanupActivityConfig.activityFlags = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CacheCleanupActivityConfig.activityFlags.modify())()
{
  if (qword_26B177850 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24A3D3030()
{
  if (qword_26B177850 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A3D30A8()
{
  return 0x6E61656C632D6264;
}

ValueMetadata *type metadata accessor for CacheCleanupActivityConfig()
{
  return &type metadata for CacheCleanupActivityConfig;
}

uint64_t XPCMessage.MessageType.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_24A3D30E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24A3D30F4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s20CloudTelemetryShared10XPCMessageV11MessageTypeO8rawValueAESgs5Int64V_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t XPCMessage.ty.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t XPCMessage.init(ty:payload:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2;
  swift_unknownObjectRetain();
  xpc_object_t v7 = xpc_int64_create(a1);
  XPCObject.init(_:)(v7, (uint64_t)v6);
  XPCDictionary.subscript.setter((uint64_t)v6);
  swift_unknownObjectRelease();
  return v10;
}

void XPCMessage.init(fromXPC:)()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v0 - 8);
  swift_getObjectType();
  OS_xpc_object.type()();
}

void *sub_24A3D3260(uint64_t a1)
{
  if (a1 != XPCTypeDictionary.getter()) {
    goto LABEL_2;
  }
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = (void *)XPCDictionary.init(_:)(v2);
  XPCDictionary.subscript.getter(v3, (uint64_t)v1);
  swift_unknownObjectRelease();
  uint64_t v4 = type metadata accessor for XPCObject();
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v1, 1, v4) == 1)
  {
    swift_unknownObjectRelease();
    sub_24A3D3D20((uint64_t)v1);
    return 0;
  }
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    swift_unknownObjectRelease();
    sub_24A3C7A3C((uint64_t)v1);
    return 0;
  }
  if (*v1 >= 4uLL)
  {
LABEL_2:
    swift_unknownObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t XPCMessage.description.getter(void *a1, char a2)
{
  uint64_t v36 = type metadata accessor for XPCObject();
  uint64_t v4 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  LOBYTE(v37) = a2;
  sub_24A3D45E8();
  sub_24A3D43E8();
  int64_t v35 = a1;
  uint64_t v10 = XPCDictionary.keys.getter(a1);
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v32 = v10;
  if (!v11)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_24A3D4358();
    swift_bridgeObjectRelease();
    sub_24A3D43E8();
    swift_bridgeObjectRelease();
    sub_24A3D43E8();
    return v38;
  }
  uint64_t v34 = (unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
  uint64_t v12 = (uint64_t *)(v10 + 40);
  os_log_type_t v13 = (void *)MEMORY[0x263F8EE80];
  xpc_object_t v33 = v9;
  while (1)
  {
    uint64_t v15 = *(v12 - 1);
    uint64_t v14 = *v12;
    swift_bridgeObjectRetain();
    XPCDictionary.subscript.getter(v35, (uint64_t)v9);
    if ((*v34)(v9, 1, v36) == 1) {
      break;
    }
    uint64_t v16 = (uint64_t)v9;
    uint64_t v17 = (uint64_t)v6;
    sub_24A3CB684(v16, (uint64_t)v6);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v37 = v13;
    unint64_t v20 = sub_24A3BD084(v15, v14);
    uint64_t v21 = v13[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22))
    {
      __break(1u);
LABEL_19:
      __break(1u);
      break;
    }
    char v24 = v19;
    if (v13[3] >= v23)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        os_log_type_t v13 = v37;
        if (v19) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_24A3D3AA4();
        os_log_type_t v13 = v37;
        if (v24) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_24A3D3700(v23, isUniquelyReferenced_nonNull_native);
      unint64_t v25 = sub_24A3BD084(v15, v14);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_21;
      }
      unint64_t v20 = v25;
      os_log_type_t v13 = v37;
      if (v24)
      {
LABEL_3:
        uint64_t v6 = (char *)v17;
        sub_24A3D3D80(v17, v13[7] + *(void *)(v4 + 72) * v20);
        goto LABEL_4;
      }
    }
    v13[(v20 >> 6) + 8] |= 1 << v20;
    unint64_t v27 = (uint64_t *)(v13[6] + 16 * v20);
    uint64_t *v27 = v15;
    v27[1] = v14;
    uint64_t v6 = (char *)v17;
    sub_24A3CB684(v17, v13[7] + *(void *)(v4 + 72) * v20);
    uint64_t v28 = v13[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_19;
    }
    v13[2] = v30;
    swift_bridgeObjectRetain();
LABEL_4:
    v12 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    --v11;
    uint64_t v9 = v33;
    if (!v11) {
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_21:
  uint64_t result = sub_24A3D4698();
  __break(1u);
  return result;
}

uint64_t sub_24A3D36F4()
{
  return XPCMessage.description.getter(*(void **)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_24A3D3700(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for XPCObject();
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697925A0);
  int v43 = a2;
  uint64_t v9 = sub_24A3D4638();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  unint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    char v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_24A3CB684(v30, (uint64_t)v7);
    }
    else
    {
      sub_24A3CCBD0(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_24A3D4728();
    sub_24A3D43D8();
    uint64_t result = sub_24A3D4758();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    char v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *char v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_24A3CB684((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

void *sub_24A3D3AA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for XPCObject();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697925A0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24A3D4628();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_24A3CCBD0(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    int64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *int64_t v22 = v19;
    v22[1] = v20;
    sub_24A3CB684((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

unint64_t _s20CloudTelemetryShared10XPCMessageV11MessageTypeO8rawValueAESgs5Int64V_tcfC_0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_24A3D3D20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B176BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A3D3D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_24A3D3DE8()
{
  unint64_t result = qword_269792598;
  if (!qword_269792598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269792598);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for XPCMessage()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCMessage(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCMessage()
{
  return &type metadata for XPCMessage;
}

uint64_t getEnumTagSinglePayload for XPCMessage.MessageType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for XPCMessage.MessageType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24A3D4114);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_24A3D413C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCMessage.MessageType()
{
  return &type metadata for XPCMessage.MessageType;
}

uint64_t sub_24A3D4168()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24A3D4178()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24A3D4188()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24A3D4198()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24A3D41A8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24A3D41B8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24A3D41C8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_24A3D41D8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24A3D41E8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24A3D41F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24A3D4208()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_24A3D4218()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24A3D4228()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_24A3D4238()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_24A3D4248()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_24A3D4258()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24A3D4268()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24A3D4278()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_24A3D4288()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_24A3D4298()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24A3D42A8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24A3D42B8()
{
  return MEMORY[0x270F16E58]();
}

uint64_t sub_24A3D42D8()
{
  return MEMORY[0x270F16E68]();
}

uint64_t sub_24A3D42E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A3D42F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A3D4308()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A3D4318()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24A3D4328()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_24A3D4338()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24A3D4348()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24A3D4358()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24A3D4368()
{
  return MEMORY[0x270F9D088]();
}

uint64_t sub_24A3D4378()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A3D4388()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24A3D4398()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24A3D43A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A3D43B8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24A3D43C8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24A3D43D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A3D43E8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A3D43F8()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24A3D4408()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A3D4418()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_24A3D4428()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24A3D4438()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24A3D4448()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A3D4458()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24A3D4468()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24A3D4478()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24A3D4488()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24A3D4498()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24A3D44B8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24A3D44D8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24A3D44E8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24A3D44F8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24A3D4508()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A3D4518()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24A3D4528()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A3D4538()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24A3D4548()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24A3D4558()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24A3D4568()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24A3D4578()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A3D4588()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A3D4598()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24A3D45A8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A3D45B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A3D45C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24A3D45D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A3D45E8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24A3D45F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A3D4608()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24A3D4618()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24A3D4628()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A3D4638()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A3D4648()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A3D4658()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A3D4678()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A3D4698()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A3D46C8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24A3D46D8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24A3D46E8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24A3D46F8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24A3D4708()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24A3D4718()
{
  return MEMORY[0x270F9FC38]();
}

uint64_t sub_24A3D4728()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A3D4738()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A3D4748()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24A3D4758()
{
  return MEMORY[0x270F9FC90]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x270EDBCA0]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return MEMORY[0x270EDBCC8]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x270EDBE30]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBE88](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x270EDBFC8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x270EDBFD8](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x270EDC168](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x270EDC458](uuid);
}