void sub_2151BC5F4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_2151BC680(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

uint64_t (*sub_2151BCED8())()
{
  return j__swift_endAccess;
}

void *sub_2151BCF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a5;
  uint64_t v10 = sub_2151FA098();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v14 = MEMORY[0x263F8EE80];
  v5[14] = MEMORY[0x263F8EE80];
  v5[15] = v14;
  uint64_t v15 = OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_geoCoder;
  sub_2151F9C48();
  *(void *)((char *)v5 + v15) = sub_2151F9C38();
  *(void *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper) = 0;
  *(void *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationCollectionTask) = 0;
  *(void *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationHelperContinuations) = 0;
  v5[16] = a1;
  v5[17] = a2;
  uint64_t v21 = sub_2151F9558();
  uint64_t v22 = MEMORY[0x263F36AB0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
  swift_bridgeObjectRetain();
  sub_2151F9528();
  sub_2151CE5D0(&v20, (uint64_t)(v5 + 18));
  *(void *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundle) = a3;
  v16 = (void *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundleIdentifier);
  uint64_t v17 = v19;
  void *v16 = a4;
  v16[1] = v17;
  sub_2151FA088();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))((uint64_t)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate, v13, v10);
  return v5;
}

uint64_t (*sub_2151BD0F0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2151BD14C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v5 = (char *)&v27[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v27[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27[-1] - v11;
  if (*(void *)(a2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper))
  {
    v27[0] = *(void *)(a2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper);
    swift_retain();
    return sub_2151F9EF8();
  }
  else
  {
    uint64_t v14 = (void *)(a2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationHelperContinuations);
    swift_beginAccess();
    if (*v14)
    {
      v16 = sub_2151BD0F0();
      if (*v15)
      {
        uint64_t v17 = (void **)v15;
        (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, a1, v6);
        v18 = *v17;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v17 = v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v18 = (void *)sub_2151C6DF4(0, v18[2] + 1, 1, v18);
          *uint64_t v17 = v18;
        }
        unint64_t v21 = v18[2];
        unint64_t v20 = v18[3];
        if (v21 >= v20 >> 1)
        {
          v18 = (void *)sub_2151C6DF4(v20 > 1, v21 + 1, 1, v18);
          *uint64_t v17 = v18;
        }
        v18[2] = v21 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v18+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v21, v12, v6);
        return ((uint64_t (*)(void *, void))v16)(v27, 0);
      }
      else
      {
        return ((uint64_t (*)(void *, void))v16)(v27, 0);
      }
    }
    else
    {
      *uint64_t v14 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_2151F9F18();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 1, 1, v22);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
      uint64_t v23 = sub_2151C6900(&qword_2678652B8, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
      unint64_t v24 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v25 = (char *)swift_allocObject();
      *((void *)v25 + 2) = a2;
      *((void *)v25 + 3) = v23;
      *((void *)v25 + 4) = a2;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v25[v24], v10, v6);
      swift_retain_n();
      sub_2151D16EC((uint64_t)v5, (uint64_t)&unk_2678652C0, (uint64_t)v25);
      return swift_release();
    }
  }
}

uint64_t sub_2151BD504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A8);
  v5[14] = v7;
  v5[15] = *(void *)(v7 - 8);
  v5[16] = swift_task_alloc();
  uint64_t v8 = sub_2151F9D58();
  v5[17] = v8;
  v5[18] = *(void *)(v8 - 8);
  v5[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151BD628, a4, 0);
}

uint64_t sub_2151BD628()
{
  uint64_t v1 = v0[12];
  v2 = *(void **)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundle);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundleIdentifier);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundleIdentifier + 8);
  sub_2151F9A78();
  uint64_t v5 = sub_2151F9558();
  uint64_t v6 = MEMORY[0x263F36AB0];
  v0[5] = v5;
  v0[6] = v6;
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  id v7 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2151F9528();
  sub_2151F9C08();
  swift_allocObject();
  uint64_t v8 = sub_2151F9BF8();
  sub_2151F9B58();
  swift_allocObject();
  uint64_t v9 = sub_2151F9B48();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v10;
  *uint64_t v10 = v0;
  v10[1] = sub_2151BD7A8;
  return MEMORY[0x270F1B370](v2, v3, v4, v8, v9);
}

uint64_t sub_2151BD7A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151BD8C0, v2, 0);
}

uint64_t sub_2151BD8C0()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[12];
  *(void *)(v2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper) = v1;
  swift_retain_n();
  swift_release();
  v0[10] = v1;
  sub_2151F9EF8();
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationHelperContinuations);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3)
  {
    uint64_t v5 = *(void *)(v4 + 16);
    if (v5)
    {
      unint64_t v20 = v3;
      uint64_t v6 = v0[15];
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      uint64_t v8 = v6 + 16;
      id v7 = v9;
      uint64_t v10 = v4 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
      uint64_t v11 = *(void *)(v8 + 56);
      swift_bridgeObjectRetain();
      do
      {
        uint64_t v12 = v0[21];
        uint64_t v13 = v0[16];
        uint64_t v14 = v0[14];
        v7(v13, v10, v14);
        v0[11] = v12;
        swift_retain();
        sub_2151F9EF8();
        (*(void (**)(uint64_t, uint64_t))(v8 - 8))(v13, v14);
        v10 += v11;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      uint64_t v3 = v20;
    }
    swift_release();
    *uint64_t v3 = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = v0[18];
    uint64_t v15 = v0[19];
    uint64_t v17 = v0[17];
    __swift_project_boxed_opaque_existential_1((void *)(v0[12] + 144), *(void *)(v0[12] + 168));
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, *MEMORY[0x263F36D30], v17);
    sub_2151F9C88();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_2151BDB10(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_2151F9D58();
  uint64_t v11 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2151FA098();
  uint64_t v45 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_2151F9E28();
  uint64_t v47 = v17;
  sub_2151BE250(a1, a2, v54);
  char v18 = sub_2151BE4D8((uint64_t)a2, a3);
  v46 = v10;
  if ((v18 & 1) == 0) {
    goto LABEL_9;
  }
  swift_beginAccess();
  uint64_t v19 = v4[14];
  if (!*(void *)(v19 + 16))
  {
    uint64_t v52 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
LABEL_10:
    sub_2151CEA98((uint64_t)&v50, &qword_2678653B8);
    goto LABEL_11;
  }
  uint64_t v20 = v47;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_2151C73E8(v49, v20);
  if (v22)
  {
    sub_2151CC6F4(*(void *)(v19 + 56) + 40 * v21, (uint64_t)&v50);
  }
  else
  {
    uint64_t v52 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v51 + 1)) {
    goto LABEL_10;
  }
  sub_2151CE5D0(&v50, (uint64_t)v53);
  sub_2151F9678();
  char v23 = MEMORY[0x2166B44D0](v54, v53);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  if ((v23 & 1) == 0)
  {
LABEL_11:
    sub_2151FA088();
    v30 = (char *)v4 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v45 + 40))(v30, v16, v14);
    swift_endAccess();
    __swift_project_boxed_opaque_existential_1(v4 + 18, v4[21]);
    *(void *)&v53[0] = 0;
    *((void *)&v53[0] + 1) = 0xE000000000000000;
    sub_2151FA038();
    swift_bridgeObjectRelease();
    *(void *)&v53[0] = 0xD000000000000012;
    *((void *)&v53[0] + 1) = 0x80000002151FCE00;
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    sub_2151F9E68();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
    sub_2151F9DB8();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v31 = *MEMORY[0x263F36CF8];
    v32 = *(void (**)(void))(v11 + 104);
    unint64_t v43 = (v11 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    LODWORD(v45) = v31;
    uint64_t v33 = v48;
    v44 = (void (*)(char *, void, uint64_t))v32;
    v32(v13);
    sub_2151F9C68();
    swift_bridgeObjectRelease();
    v27 = *(void (**)(char *, uint64_t))(v11 + 8);
    v28 = v13;
    uint64_t v29 = v33;
    goto LABEL_12;
  }
LABEL_9:
  __swift_project_boxed_opaque_existential_1(v4 + 18, v4[21]);
  int v24 = *MEMORY[0x263F36CF8];
  v25 = *(void (**)(void))(v11 + 104);
  unint64_t v43 = (v11 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  LODWORD(v45) = v24;
  uint64_t v26 = v48;
  v44 = (void (*)(char *, void, uint64_t))v25;
  v25(v13);
  sub_2151F9C68();
  v27 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28 = v13;
  uint64_t v29 = v26;
LABEL_12:
  v42 = v27;
  v27(v28, v29);
  sub_2151CC6F4((uint64_t)v54, (uint64_t)v53);
  swift_beginAccess();
  uint64_t v34 = v47;
  swift_bridgeObjectRetain();
  sub_2151BE6A0((uint64_t)v53, v49, v34);
  swift_endAccess();
  __swift_project_boxed_opaque_existential_1(v4 + 18, v4[21]);
  *(void *)&v53[0] = 0;
  *((void *)&v53[0] + 1) = 0xE000000000000000;
  sub_2151FA038();
  swift_bridgeObjectRelease();
  *(void *)&v53[0] = 0xD000000000000010;
  *((void *)&v53[0] + 1) = 0x80000002151FCDE0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
  sub_2151F9D98();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v35 = v48;
  v44(v13, v45, v48);
  sub_2151F9CB8();
  swift_bridgeObjectRelease();
  v42(v13, v35);
  uint64_t v36 = sub_2151F9F18();
  uint64_t v37 = (uint64_t)v46;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v46, 1, 1, v36);
  sub_2151CC6F4((uint64_t)v54, (uint64_t)v53);
  uint64_t v38 = sub_2151C6900(&qword_2678652B8, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
  v39 = (void *)swift_allocObject();
  v39[2] = v4;
  v39[3] = v38;
  uint64_t v40 = v49;
  v39[4] = v4;
  v39[5] = v40;
  v39[6] = v34;
  sub_2151CE5D0(v53, (uint64_t)(v39 + 7));
  swift_retain_n();
  sub_2151D16EC(v37, (uint64_t)&unk_2678653B0, (uint64_t)v39);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
}

void sub_2151BE250(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v28 = a2;
  sub_2151CC6F4(a1, (uint64_t)v29);
  id v6 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
  if (!swift_dynamicCast()) {
    goto LABEL_20;
  }
  uint64_t v7 = sub_2151F9E28();
  uint64_t v9 = v8;
  if (v7 == sub_2151F9E28() && v9 == v10) {
    goto LABEL_15;
  }
  char v12 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_16:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);

    uint64_t v23 = MEMORY[0x2166B4610]();
    swift_bridgeObjectRelease();
    uint64_t v24 = MEMORY[0x263F8D6D8];
    a3[3] = MEMORY[0x263F8D6C8];
    a3[4] = v24;
    *a3 = v23;
    return;
  }
  uint64_t v13 = sub_2151F9E28();
  uint64_t v15 = v14;
  if (v13 == sub_2151F9E28() && v15 == v16)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v18 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_16;
  }
  uint64_t v19 = sub_2151F9E28();
  uint64_t v21 = v20;
  if (v19 == sub_2151F9E28() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
LABEL_18:
    uint64_t v26 = MEMORY[0x2166B4620]();
    swift_bridgeObjectRelease();
    uint64_t v27 = MEMORY[0x263F8D6D8];
    a3[3] = MEMORY[0x263F8D6C8];
    a3[4] = v27;
    *a3 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);

    return;
  }
  char v25 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
LABEL_20:
  sub_2151CC6F4(a1, (uint64_t)a3);
  sub_2151CEA98((uint64_t)&v28, &qword_267865410);
}

uint64_t sub_2151BE4D8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_2151F9E28();
    sub_2151FA198();
    sub_2151F9E58();
    uint64_t v3 = sub_2151FA1B8();
    swift_bridgeObjectRelease();
    uint64_t v4 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v5 = v3 & ~v4;
    uint64_t v6 = a2 + 56;
    if ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
    {
      uint64_t v7 = sub_2151F9E28();
      uint64_t v9 = v8;
      if (v7 == sub_2151F9E28() && v9 == v10)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      char v12 = sub_2151FA148();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_18:
        char v20 = 1;
        return v20 & 1;
      }
      uint64_t v13 = ~v4;
      unint64_t v14 = (v5 + 1) & v13;
      if ((*(void *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
      {
        while (1)
        {
          uint64_t v15 = sub_2151F9E28();
          uint64_t v17 = v16;
          if (v15 == sub_2151F9E28() && v17 == v18) {
            break;
          }
          char v20 = sub_2151FA148();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            unint64_t v14 = (v14 + 1) & v13;
            if ((*(void *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14)) {
              continue;
            }
          }
          return v20 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  char v20 = 0;
  return v20 & 1;
}

uint64_t sub_2151BE6A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_2151CE5D0((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2151C9434(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2151CEA98(a1, &qword_2678653B8);
    sub_2151ECB20(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_2151CEA98((uint64_t)v9, &qword_2678653B8);
  }
}

uint64_t sub_2151BE778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_2151BE7A0, a4, 0);
}

uint64_t sub_2151BE7A0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = sub_2151C6900(&qword_2678652B8, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  long long v5 = *(_OWORD *)(v0 + 40);
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v2;
  *(_OWORD *)(v4 + 32) = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2151BE8C8;
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = MEMORY[0x263F8EE60] + 8;
  uint64_t v9 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2320](v7, v8, v1, v3, &unk_2678653C8, v4, v9);
}

uint64_t sub_2151BE8C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151BE9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[20] = a5;
  v6[21] = a6;
  v6[18] = a3;
  v6[19] = a4;
  v6[17] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151BEA88, a3, 0);
}

uint64_t sub_2151BEA88()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 120);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = *(void *)(v0 + 152);
    uint64_t v3 = *(void *)(v0 + 160);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_2151C73E8(v4, v3);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(v2 + 56) + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    v30 = (long long *)(v0 + 16);
    uint64_t v9 = (_OWORD *)(v7 + 32);
    do
    {
      uint64_t v32 = v8;
      uint64_t v11 = *(void *)(v0 + 176);
      uint64_t v10 = *(void *)(v0 + 184);
      uint64_t v13 = *(void *)(v0 + 160);
      uint64_t v12 = *(void *)(v0 + 168);
      uint64_t v15 = *(void *)(v0 + 144);
      uint64_t v14 = *(void *)(v0 + 152);
      uint64_t v16 = swift_allocObject();
      int v31 = v9;
      *(_OWORD *)(v16 + 16) = *v9;
      sub_2151CC6F4(v12, (uint64_t)v30);
      uint64_t v17 = (void *)swift_allocObject();
      v17[2] = 0;
      uint64_t v18 = v17 + 2;
      v17[3] = 0;
      v17[4] = &unk_2678653E8;
      v17[5] = v16;
      sub_2151CE5D0(v30, (uint64_t)(v17 + 6));
      v17[11] = v15;
      v17[12] = v14;
      v17[13] = v13;
      uint64_t v19 = sub_2151F9F18();
      uint64_t v20 = *(void *)(v19 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v10, 1, 1, v19);
      sub_2151CEAF4(v10, v11, &qword_2678652A0);
      LODWORD(v10) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v11, 1, v19);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v21 = *(void *)(v0 + 176);
      if (v10 == 1)
      {
        sub_2151CEA98(*(void *)(v0 + 176), &qword_2678652A0);
        if (!*v18) {
          goto LABEL_14;
        }
      }
      else
      {
        sub_2151F9F08();
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v19);
        if (!*v18)
        {
LABEL_14:
          uint64_t v22 = 0;
          uint64_t v24 = 0;
          goto LABEL_15;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v22 = sub_2151F9EE8();
      uint64_t v24 = v23;
      swift_unknownObjectRelease();
LABEL_15:
      uint64_t v25 = **(void **)(v0 + 136);
      uint64_t v26 = swift_allocObject();
      *(void *)(v26 + 16) = &unk_2678653F0;
      *(void *)(v26 + 24) = v17;
      uint64_t v27 = v24 | v22;
      if (v24 | v22)
      {
        uint64_t v27 = v0 + 56;
        *(void *)(v0 + 56) = 0;
        *(void *)(v0 + 64) = 0;
        *(void *)(v0 + 72) = v22;
        *(void *)(v0 + 80) = v24;
      }
      *(void *)(v0 + 112) = 1;
      *(void *)(v0 + 120) = v27;
      *(void *)(v0 + 128) = v25;
      swift_task_create();
      swift_release();
      swift_release();
      uint64_t v9 = v31 + 1;
      uint64_t v8 = v32 - 1;
    }
    while (v32 != 1);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  id v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_2151BEE64(uint64_t a1, int *a2)
{
  unint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2151CEB5C;
  return v5();
}

uint64_t sub_2151BEF3C(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  v8[7] = a8;
  v8[5] = a6;
  uint64_t v11 = sub_2151F9D58();
  v8[8] = v11;
  v8[9] = *(void *)(v11 - 8);
  v8[10] = swift_task_alloc();
  uint64_t v14 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v12 = (void *)swift_task_alloc();
  v8[11] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_2151BF080;
  return v14(a5);
}

uint64_t sub_2151BF080()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2151BF1BC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2151BF1BC()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[8];
  __swift_project_boxed_opaque_existential_1((void *)(v0[5] + 144), *(void *)(v0[5] + 168));
  sub_2151FA038();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  sub_2151F9E68();
  sub_2151F9E68();
  sub_2151F9E68();
  v0[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
  sub_2151FA0B8();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F36CF8], v4);
  sub_2151F9C78();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2151BF364(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_2151BF51C(v2);
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v22 = v3;
    uint64_t v23 = (void *)MEMORY[0x263F8EE78];
    sub_2151CBED0(0, v5, 0);
    uint64_t v6 = v23;
    uint64_t result = sub_2151CE20C(a1);
    int64_t v8 = result;
    int v10 = v9;
    char v12 = v11 & 1;
    while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(a1 + 56 + (((unint64_t)v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_13;
      }
      if (*(_DWORD *)(a1 + 36) != v10) {
        goto LABEL_14;
      }
      uint64_t v13 = sub_2151F9E28();
      uint64_t v15 = v14;
      unint64_t v17 = v23[2];
      unint64_t v16 = v23[3];
      if (v17 >= v16 >> 1) {
        sub_2151CBED0((char *)(v16 > 1), v17 + 1, 1);
      }
      v23[2] = v17 + 1;
      uint64_t v18 = &v23[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      uint64_t result = sub_2151CE2AC(v8, v10, v12 & 1, a1);
      int64_t v8 = result;
      int v10 = v19;
      char v12 = v20 & 1;
      if (!--v5)
      {
        sub_2151CE618(result, v19, v20 & 1);
        uint64_t v4 = v22;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    BOOL v21 = sub_2151CE390(v6, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v21;
  }
  return result;
}

uint64_t sub_2151BF51C(uint64_t a1)
{
  uint64_t result = sub_2151F9FB8();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    char v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_2151CA844(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_2151BF6B4(uint64_t a1)
{
  type metadata accessor for ODIAttributeKey(0);
  sub_2151C6900((unint64_t *)&qword_267865260, type metadata accessor for ODIAttributeKey);
  int64_t v2 = 0;
  v13[1] = (id)sub_2151F9FB8();
  uint64_t v3 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_2151CA9F4(v13, *(id *)(*(void *)(a1 + 48) + 8 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    int64_t v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v2 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v2 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v2);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_2151BF874()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  uint64_t v1 = v0 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate;
  uint64_t v2 = sub_2151FA098();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_2151BF964()
{
  sub_2151BF874();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_2151BF990()
{
  return type metadata accessor for ODIBindingsFiller();
}

uint64_t type metadata accessor for ODIBindingsFiller()
{
  uint64_t result = qword_2678651B0;
  if (!qword_2678651B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2151BF9E4()
{
  uint64_t result = sub_2151FA098();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2151BFACC(uint64_t a1, uint64_t a2)
{
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2151CEB5C;
  return v7(a1, a2);
}

uint64_t sub_2151BFBBC()
{
  return v0;
}

uint64_t sub_2151BFBC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(v3 + 112);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_2151C73E8(a1, a2);
    if (v10)
    {
      sub_2151CC6F4(*(void *)(v8 + 56) + 40 * v9, a3);
    }
    else
    {
      *(void *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2151BFC84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = (void *)(v4 + 120);
  swift_beginAccess();
  uint64_t v10 = *(void *)(*(void *)(v4 + 120) + 16);
  swift_bridgeObjectRetain();
  if (v10)
  {
    swift_bridgeObjectRetain();
    sub_2151C73E8(a1, a2);
    if (v11)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v24[0] = *v9;
  *unint64_t v9 = 0x8000000000000000;
  sub_2151C958C(MEMORY[0x263F8EE78], a1, a2, isUniquelyReferenced_nonNull_native);
  *unint64_t v9 = v24[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_6:
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2151BCED8();
  unint64_t v15 = sub_2151BFEFC(v24, a1, a2);
  if (*v14)
  {
    int64_t v16 = (void **)v14;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a3;
    *(void *)(v17 + 24) = a4;
    uint64_t v18 = *v16;
    swift_retain();
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    char *v16 = v18;
    if ((v19 & 1) == 0)
    {
      uint64_t v18 = sub_2151C6FD0(0, v18[2] + 1, 1, v18);
      char *v16 = v18;
    }
    unint64_t v21 = v18[2];
    unint64_t v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      uint64_t v18 = sub_2151C6FD0((void *)(v20 > 1), v21 + 1, 1, v18);
      char *v16 = v18;
    }
    v18[2] = v21 + 1;
    uint64_t v22 = &v18[2 * v21];
    v22[4] = &unk_267865240;
    v22[5] = v17;
    ((void (*)(void *, void))v15)(v24, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(unsigned char *, void))v13)(v25, 0);
  }
  else
  {
    ((void (*)(void *, void))v15)(v24, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(unsigned char *, void))v13)(v25, 0);
  }
}

void (*sub_2151BFEFC(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_2151CC328(v6, a2, a3);
  return sub_2151BFF7C;
}

void sub_2151BFF7C(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_2151BFFD0(uint64_t a1, uint64_t a2, int *a3)
{
  int64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  void *v5 = v3;
  v5[1] = sub_2151CEB5C;
  return v7(a2);
}

uint64_t sub_2151C00A8()
{
  uint64_t v2 = *v0;
  *(void *)(v1 + 40) = *v0;
  return MEMORY[0x270FA2498](sub_2151C00C8, v2, 0);
}

uint64_t sub_2151C00C8()
{
  swift_beginAccess();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v1 = swift_bridgeObjectRetain();
  return v3(v1);
}

uint64_t sub_2151C0148()
{
  uint64_t v2 = *(void *)(*v0 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_geoCoder);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 8);
  swift_retain();
  return sub_2151CC758(v3, v1, v2);
}

uint64_t sub_2151C01E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_2151C0204, v5, 0);
}

uint64_t sub_2151C0204()
{
  sub_2151BFBC8(v0[3], v0[4], v0[2]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2151C0268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  uint64_t v6 = *v4;
  v5[6] = *v4;
  return MEMORY[0x270FA2498](sub_2151C0290, v6, 0);
}

uint64_t sub_2151C0290()
{
  sub_2151BFC84(v0[2], v0[3], v0[4], v0[5]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2151C02F8()
{
  uint64_t v1 = sub_2151F9D58();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_WORD *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = MEMORY[0x263F8EE80];
  uint64_t v8 = sub_2151F9558();
  uint64_t v9 = MEMORY[0x263F36AB0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v7);
  sub_2151F9528();
  sub_2151CE5D0(&v7, v0 + 128);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 128), *(void *)(v0 + 152));
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F36CF8], v1);
  sub_2151F9C68();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v0;
}

uint64_t sub_2151C048C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2151F9638();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2151F9D58();
  uint64_t v30 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_2151BF51C(v11);
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_2151CCD04(v13, v12);
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v14 + 16);
  swift_release();
  if (v15)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F36B40], v4);
    sub_2151F9D38();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    char v16 = v5 + 8;
    v17(v7, v4);
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
    char v18 = sub_2151F9DA8();
    swift_bridgeObjectRelease();
    uint64_t v19 = v8;
    uint64_t v20 = v30;
    if ((v18 & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1((void *)(v2 + 128), *(void *)(v2 + 152));
      (*(void (**)(char *, void, uint64_t))(v20 + 104))(v10, *MEMORY[0x263F36D20], v19);
      sub_2151F9C68();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
      *(unsigned char *)(v2 + 113) = 1;
    }
    if ((*(unsigned char *)(v2 + 112) & 1) != 0 || *(unsigned char *)(v2 + 113) != 1)
    {
      uint64_t v23 = *(void *)(v2 + 160);
      uint64_t v28 = *(void *)(v2 + 152);
      uint64_t v29 = v23;
      uint64_t v27 = (void (*)(char *))__swift_project_boxed_opaque_existential_1((void *)(v2 + 128), v28);
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
      sub_2151FA038();
      sub_2151F9E68();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      sub_2151F9E68();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t))(v20 + 104))(v10, *MEMORY[0x263F36CF8], v19);
      sub_2151F9C68();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
      char v16 = 0;
    }
    else
    {
      char v16 = 1;
      *(unsigned char *)(v2 + 112) = 1;
      uint64_t v21 = *(void *)(v2 + 152);
      uint64_t v26 = *(void (**)(char *, uint64_t))(v2 + 160);
      uint64_t v25 = __swift_project_boxed_opaque_existential_1((void *)(v2 + 128), v21);
      LODWORD(v28) = *MEMORY[0x263F36D20];
      uint64_t v27 = *(void (**)(char *))(v20 + 104);
      uint64_t v29 = v20 + 104;
      v27(v10);
      sub_2151F9C68();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v20 + 8);
      v26(v10, v19);
      *(unsigned char *)(v2 + 113) = 0;
      *(void *)(v2 + 120) = a1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void *)(v2 + 152);
      uint64_t v30 = *(void *)(v2 + 160);
      __swift_project_boxed_opaque_existential_1((void *)(v2 + 128), v22);
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
      sub_2151FA038();
      sub_2151F9E68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
      sub_2151F9D98();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      ((void (*)(char *, void, uint64_t))v27)(v10, v28, v19);
      sub_2151F9CB8();
      swift_bridgeObjectRelease();
      v26(v10, v19);
    }
  }
  return v16 & 1;
}

uint64_t sub_2151C0A84()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2151F9D58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0[20];
  uint64_t v15 = v0[19];
  uint64_t v16 = v6;
  v14[0] = v0 + 16;
  v14[1] = __swift_project_boxed_opaque_existential_1(v0 + 16, v15);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_2151FA038();
  sub_2151F9E68();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  uint64_t v7 = *MEMORY[0x263F36D20];
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v8(v5, v7, v2);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v10 = v2;
  v9(v5, v2);
  *((unsigned char *)v1 + 112) = 0;
  uint64_t v11 = *((unsigned __int8 *)v1 + 113);
  if (v11 == 1)
  {
    *((unsigned char *)v1 + 113) = 0;
    uint64_t v12 = v1[19];
    uint64_t v16 = v1[20];
    __swift_project_boxed_opaque_existential_1(v14[0], v12);
    v8(v5, v7, v10);
    sub_2151F9C68();
    v9(v5, v10);
  }
  return v11;
}

uint64_t sub_2151C0D18()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_2151C0D58()
{
  v1[2] = v0;
  uint64_t v2 = sub_2151F97E8();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_2151F9808();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C0E74, 0, 0);
}

uint64_t sub_2151C0E74()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C0F14;
  uint64_t v2 = *(void *)(v0 + 64);
  return sub_2151F11A4(v2, 0);
}

uint64_t sub_2151C0F14(uint64_t a1)
{
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C1014, 0, 0);
}

uint64_t sub_2151C1014()
{
  uint64_t v1 = v0[10];
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = v0[10];
  if (v2)
  {
    uint64_t v4 = v0[4];
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_2151CBEF0(0, v2, 0);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v4 += 16;
    uint64_t v6 = v3 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    uint64_t v17 = *(void *)(v4 + 56);
    unint64_t v18 = v5;
    uint64_t v7 = (void (**)(uint64_t, uint64_t))(v4 - 8);
    uint64_t v8 = v19;
    do
    {
      uint64_t v9 = v0[5];
      uint64_t v10 = v0[3];
      v18(v9, v6, v10);
      sub_2151F97B8();
      uint64_t v11 = sub_2151F9DF8();
      swift_bridgeObjectRelease();
      (*v7)(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2151CBEF0(0, *(void *)(v8 + 16) + 1, 1);
        uint64_t v8 = v19;
      }
      unint64_t v13 = *(void *)(v8 + 16);
      unint64_t v12 = *(void *)(v8 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_2151CBEF0((void *)(v12 > 1), v13 + 1, 1);
        uint64_t v8 = v19;
      }
      *(void *)(v8 + 16) = v13 + 1;
      *(void *)(v8 + 8 * v13 + 32) = v11;
      v6 += v17;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  uint64_t v14 = sub_2151CE514(v8);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(uint64_t))v0[1];
  return v15(v14);
}

uint64_t sub_2151C1218(char a1)
{
  *(void *)(v2 + 48) = v1;
  *(unsigned char *)(v2 + 112) = a1;
  uint64_t v3 = sub_2151F9D58();
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = *(void *)(v3 - 8);
  *(void *)(v2 + 72) = swift_task_alloc();
  uint64_t v4 = sub_2151F9808();
  *(void *)(v2 + 80) = v4;
  *(void *)(v2 + 88) = *(void *)(v4 - 8);
  *(void *)(v2 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C1338, 0, 0);
}

uint64_t sub_2151C1338()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C13D8;
  uint64_t v2 = *(void *)(v0 + 96);
  return sub_2151F11A4(v2, 0);
}

uint64_t sub_2151C13D8(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v1;
  *(void *)(v2 + 40) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C14D8, 0, 0);
}

uint64_t sub_2151C14D8()
{
  if (*(unsigned char *)(v0 + 112) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v2 = *(void *)(v0 + 72);
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v5 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 64);
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 48) + 24), *(void *)(*(void *)(v0 + 48) + 48));
    sub_2151FA038();
    *(void *)(v0 + 16) = 0;
    *(void *)(v0 + 24) = 0xE000000000000000;
    sub_2151F9E68();
    sub_2151FA0B8();
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v2, *MEMORY[0x263F36CE8], v5);
    sub_2151F9C58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v5);
    (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v9, v3);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
  }
  uint64_t v6 = *(void *)(v0 + 40);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v7(v6);
}

uint64_t sub_2151C169C()
{
  v1[6] = v0;
  uint64_t v2 = sub_2151F9868();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_2151F97E8();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v4 = sub_2151F9808();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C184C, 0, 0);
}

uint64_t sub_2151C184C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C18EC;
  uint64_t v2 = *(void *)(v0 + 152);
  return sub_2151F11A4(v2, 0);
}

uint64_t sub_2151C18EC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C19EC, 0, 0);
}

uint64_t sub_2151C19EC()
{
  uint64_t v1 = v0[21];
  uint64_t result = (*(uint64_t (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v1 + 16);
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = v0[12];
    uint64_t v7 = v0[8];
    long long v51 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    unsigned int v46 = *MEMORY[0x263F36C38];
    v44 = (void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v45 = (void (**)(uint64_t, void, uint64_t))(v7 + 104);
    uint64_t v50 = v6;
    uint64_t v48 = v1;
    uint64_t v49 = (uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 32);
    uint64_t v47 = *(void *)(v1 + 16);
    do
    {
      if (v5 >= *(void *)(v1 + 16))
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = v3;
      uint64_t v11 = v0[15];
      unint64_t v10 = v0[16];
      uint64_t v12 = v0[11];
      unint64_t v53 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
      uint64_t v52 = *(void *)(v50 + 72);
      unint64_t v54 = v5;
      unint64_t v13 = *(void (**)(uint64_t, unint64_t, uint64_t))(v50 + 16);
      v13(v10, v0[21] + v53 + v52 * v5, v12);
      uint64_t v14 = sub_2151F97D8();
      v13(v11, v10, v12);
      if (v14 == 1)
      {
        uint64_t v15 = v0[9];
        uint64_t v16 = v0[7];
        sub_2151F97C8();
        (*v45)(v15, v46, v16);
        sub_2151C6900(&qword_267865370, MEMORY[0x263F36C48]);
        sub_2151F9EC8();
        sub_2151F9EC8();
        uint64_t v17 = v0[15];
        uint64_t v19 = v0[10];
        uint64_t v18 = v0[11];
        uint64_t v20 = v0[9];
        uint64_t v21 = v0[7];
        if (v0[2] == v0[4] && v0[3] == v0[5])
        {
          swift_bridgeObjectRelease_n();
          uint64_t v22 = *v44;
          (*v44)(v20, v21);
          v22(v19, v21);
          (*v51)(v17, v18);
LABEL_12:
          uint64_t v25 = *v49;
          (*v49)(v0[14], v0[16], v0[11]);
          uint64_t v3 = v9;
          uint64_t v4 = v47;
          uint64_t v1 = v48;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2151CBF10(0, *(void *)(v9 + 16) + 1, 1);
            uint64_t v3 = v56;
          }
          unint64_t v27 = *(void *)(v3 + 16);
          unint64_t v26 = *(void *)(v3 + 24);
          if (v27 >= v26 >> 1)
          {
            sub_2151CBF10(v26 > 1, v27 + 1, 1);
            uint64_t v3 = v56;
          }
          uint64_t v28 = v0[14];
          uint64_t v29 = v0[11];
          *(void *)(v3 + 16) = v27 + 1;
          uint64_t result = v25(v3 + v53 + v27 * v52, v28, v29);
          uint64_t v56 = v3;
          goto LABEL_5;
        }
        char v23 = sub_2151FA148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v24 = *v44;
        (*v44)(v20, v21);
        v24(v19, v21);
        uint64_t v8 = *v51;
        (*v51)(v17, v18);
        if (v23) {
          goto LABEL_12;
        }
        uint64_t v3 = v9;
        uint64_t v4 = v47;
        uint64_t v1 = v48;
      }
      else
      {
        uint64_t v8 = *v51;
        (*v51)(v0[15], v0[11]);
      }
      uint64_t result = ((uint64_t (*)(void, void))v8)(v0[16], v0[11]);
LABEL_5:
      unint64_t v5 = v54 + 1;
    }
    while (v4 != v54 + 1);
  }
  swift_bridgeObjectRelease();
  int64_t v30 = *(void *)(v3 + 16);
  if (v30)
  {
    uint64_t v31 = v0[12];
    uint64_t v57 = MEMORY[0x263F8EE78];
    sub_2151CBEF0(0, v30, 0);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
    uint64_t v32 = v31 + 16;
    v55 = v33;
    uint64_t v34 = v3 + ((*(unsigned __int8 *)(v32 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 64));
    uint64_t v35 = *(void *)(v32 + 56);
    do
    {
      uint64_t v36 = v0[13];
      uint64_t v37 = v0[11];
      v55(v36, v34, v37);
      sub_2151F97B8();
      uint64_t v38 = sub_2151F9DF8();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v32 - 8))(v36, v37);
      uint64_t v39 = v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2151CBEF0(0, *(void *)(v57 + 16) + 1, 1);
        uint64_t v39 = v57;
      }
      unint64_t v41 = *(void *)(v39 + 16);
      unint64_t v40 = *(void *)(v39 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_2151CBEF0((void *)(v40 > 1), v41 + 1, 1);
        uint64_t v39 = v57;
      }
      *(void *)(v39 + 16) = v41 + 1;
      *(void *)(v39 + 8 * v41 + 32) = v38;
      v34 += v35;
      --v30;
    }
    while (v30);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v39 = MEMORY[0x263F8EE78];
  }
  uint64_t v42 = sub_2151CE514(v39);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v43 = (uint64_t (*)(uint64_t))v0[1];
  return v43(v42);
}

uint64_t sub_2151C1FB8()
{
  v1[7] = v0;
  uint64_t v2 = sub_2151F9D58();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  sub_2151F95A8();
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_2151F95B8();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C2100, 0, 0);
}

uint64_t sub_2151C2100()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[7];
  sub_2151F9B08();
  sub_2151F95C8();
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 24), *(void *)(v4 + 48));
  sub_2151D1898(v1);
  sub_2151F9CD8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[15] = v5;
  void *v5 = v0;
  v5[1] = sub_2151C2238;
  return sub_2151F1C20(0);
}

uint64_t sub_2151C2238()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 128) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2151C237C;
  return sub_2151C1218(1);
}

uint64_t sub_2151C237C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 136) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C247C, 0, 0);
}

uint64_t sub_2151C247C()
{
  uint64_t v1 = *(void *)(v0[7] + 72);
  v0[5] = type metadata accessor for ODIBindingsFiller();
  uint64_t v2 = sub_2151C6900(&qword_267865328, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
  v0[2] = v1;
  v0[6] = v2;
  uint64_t v7 = (uint64_t (*)(uint64_t, void *, uint64_t, void *))((int)*MEMORY[0x263F36C20] + MEMORY[0x263F36C20]);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2151C25AC;
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[7];
  return v7(v4, &unk_267865320, v5, v0 + 2);
}

uint64_t sub_2151C25AC()
{
  uint64_t v1 = *v0 + 16;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return MEMORY[0x270FA2498](sub_2151C26D0, 0, 0);
}

uint64_t sub_2151C26D0()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  sub_2151F9598();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2151C2784(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_2151C27A4, 0, 0);
}

uint64_t sub_2151C27A4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) + 72);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_2151C27C8, v1, 0);
}

uint64_t sub_2151C27C8()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper);
  if (v2)
  {
    v0[7] = v2;
    swift_retain();
    return MEMORY[0x270FA2498](sub_2151C2A78, 0, 0);
  }
  else
  {
    uint64_t v3 = sub_2151C6900(&qword_2678652B8, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[6] = v4;
    uint64_t v5 = sub_2151F9A78();
    *uint64_t v4 = v0;
    v4[1] = sub_2151C2944;
    uint64_t v6 = v0[5];
    return MEMORY[0x270FA2318](v0 + 2, v1, v3, 0xD000000000000010, 0x80000002151FC9A0, sub_2151CCC08, v6, v5);
  }
}

uint64_t sub_2151C2944()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C2A54, v1, 0);
}

uint64_t sub_2151C2A54()
{
  *(void *)(v0 + 56) = *(void *)(v0 + 16);
  return MEMORY[0x270FA2498](sub_2151C2A78, 0, 0);
}

uint64_t sub_2151C2A78()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = sub_2151F9A78();
  uint64_t v4 = MEMORY[0x263F36C80];
  v2[3] = v3;
  v2[4] = v4;
  void *v2 = v1;
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2151C2AF0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_2151F9D58();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = sub_2151F98A8();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v5 = sub_2151F9808();
  v2[10] = v5;
  v2[11] = *(void *)(v5 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C2C78, 0, 0);
}

uint64_t sub_2151C2C78()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C2D18;
  uint64_t v2 = *(void *)(v0 + 104);
  return sub_2151F11A4(v2, 0);
}

uint64_t sub_2151C2D18(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C2E18, 0, 0);
}

uint64_t sub_2151C2E18()
{
  *(void *)(v0 + 128) = *(void *)(*(void *)(v0 + 24) + 80);
  sub_2151F9858();
  sub_2151C6900(&qword_2678652E0, MEMORY[0x263F36C28]);
  uint64_t v2 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151C2ED8, v2, v1);
}

uint64_t sub_2151C2ED8()
{
  sub_2151F9818();
  return MEMORY[0x270FA2498](sub_2151C2F44, 0, 0);
}

uint64_t sub_2151C2F44()
{
  uint64_t v1 = v0[11];
  uint64_t v12 = v0[12];
  uint64_t v13 = v0[13];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  uint64_t v9 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[3];
  uint64_t v10 = v0[4];
  uint64_t v11 = v0[10];
  sub_2151F9888();
  __swift_project_boxed_opaque_existential_1((void *)(v6 + 24), *(void *)(v6 + 48));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  sub_2151C6900(&qword_2678652E8, MEMORY[0x263F36C58]);
  sub_2151FA108();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F36CE8], v10);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v10);
  sub_2151F9898();
  sub_2151F9878();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v12, v13, v11);
  sub_2151F9A28();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v9);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v13, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2151C31A8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C3238;
  return sub_2151C332C();
}

uint64_t sub_2151C3238()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151C332C()
{
  v1[2] = v0;
  uint64_t v2 = sub_2151F9D58();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C33EC, 0, 0);
}

uint64_t sub_2151C33EC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + 24), *(void *)(*(void *)(v0 + 16) + 48));
  *(_DWORD *)(v0 + 96) = *MEMORY[0x263F36CF8];
  uint64_t v4 = *(void (**)(uint64_t))(v2 + 104);
  *(void *)(v0 + 48) = v4;
  *(void *)(v0 + 56) = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v4(v1);
  sub_2151F9C68();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 72) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2151C352C;
  return sub_2151C1FB8();
}

uint64_t sub_2151C352C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C3628, 0, 0);
}

uint64_t sub_2151C3628()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 64);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 48);
  uint64_t v3 = *(unsigned int *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + 24), *(void *)(*(void *)(v0 + 16) + 48));
  v2(v4, v3, v5);
  sub_2151F9C68();
  v1(v4, v5);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2151C3750;
  return sub_2151C4470();
}

uint64_t sub_2151C3750()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151C3860()
{
  v1[7] = v0;
  uint64_t v2 = sub_2151F9868();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_2151F97E8();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v4 = sub_2151F9808();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C3A04, 0, 0);
}

uint64_t sub_2151C3A04()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C3AA4;
  uint64_t v2 = *(void *)(v0 + 152);
  return sub_2151F11A4(v2, 0);
}

uint64_t sub_2151C3AA4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C3BA4, 0, 0);
}

uint64_t sub_2151C3BA4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = (uint64_t (*)())(*(uint64_t (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v49 = MEMORY[0x263F8EE78];
  uint64_t v43 = *(void *)(v1 + 16);
  uint64_t v44 = v1;
  if (v43)
  {
    unint64_t v6 = 0;
    uint64_t v7 = v0[13];
    uint64_t v8 = v0[9];
    unsigned int v41 = *MEMORY[0x263F36C40];
    uint64_t v39 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    unint64_t v40 = (void (**)(uint64_t, void, uint64_t))(v8 + 104);
    uint64_t v38 = (uint64_t (**)(void, void))(v7 + 8);
    uint64_t v42 = v7;
    uint64_t v45 = (uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32);
    while (1)
    {
      if (v6 >= *(void *)(v44 + 16))
      {
        __break(1u);
        return MEMORY[0x270FA2498](v2, v3, v4);
      }
      uint64_t v9 = v0[10];
      uint64_t v10 = v0[8];
      unint64_t v11 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
      uint64_t v47 = *(void *)(v42 + 72);
      (*(void (**)(void, unint64_t, void))(v42 + 16))(v0[16], v0[21] + v11 + v47 * v6, v0[12]);
      sub_2151F97C8();
      (*v40)(v9, v41, v10);
      sub_2151C6900(&qword_267865370, MEMORY[0x263F36C48]);
      sub_2151F9EC8();
      sub_2151F9EC8();
      uint64_t v13 = v0[10];
      uint64_t v12 = v0[11];
      uint64_t v14 = v0[8];
      if (v0[2] == v0[4] && v0[3] == v0[5]) {
        break;
      }
      char v16 = sub_2151FA148();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = *v39;
      (*v39)(v13, v14);
      v17(v12, v14);
      if (v16) {
        goto LABEL_10;
      }
      uint64_t v2 = (uint64_t (*)())(*v38)(v0[16], v0[12]);
LABEL_4:
      if (v43 == ++v6) {
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v15 = *v39;
    (*v39)(v13, v14);
    v15(v12, v14);
LABEL_10:
    uint64_t v18 = *v45;
    (*v45)(v0[15], v0[16], v0[12]);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2151CBF10(0, *(void *)(v5 + 16) + 1, 1);
      uint64_t v5 = v49;
    }
    unint64_t v20 = *(void *)(v5 + 16);
    unint64_t v19 = *(void *)(v5 + 24);
    if (v20 >= v19 >> 1)
    {
      sub_2151CBF10(v19 > 1, v20 + 1, 1);
      uint64_t v5 = v49;
    }
    uint64_t v21 = v0[15];
    uint64_t v22 = v0[12];
    *(void *)(v5 + 16) = v20 + 1;
    uint64_t v2 = (uint64_t (*)())v18(v5 + v11 + v20 * v47, v21, v22);
    uint64_t v49 = v5;
    goto LABEL_4;
  }
LABEL_15:
  swift_bridgeObjectRelease();
  int64_t v23 = *(void *)(v5 + 16);
  if (v23)
  {
    uint64_t v24 = v0[13];
    uint64_t v50 = MEMORY[0x263F8EE78];
    sub_2151CBEF0(0, v23, 0);
    unint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
    uint64_t v25 = v24 + 16;
    uint64_t v27 = v5 + ((*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64));
    uint64_t v46 = *(void *)(v25 + 56);
    uint64_t v48 = v26;
    do
    {
      uint64_t v28 = v0[14];
      uint64_t v29 = v0[12];
      v48(v28, v27, v29);
      sub_2151F97B8();
      uint64_t v30 = sub_2151F9DF8();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v25 - 8))(v28, v29);
      uint64_t v31 = v50;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2151CBEF0(0, *(void *)(v50 + 16) + 1, 1);
        uint64_t v31 = v50;
      }
      unint64_t v33 = *(void *)(v31 + 16);
      unint64_t v32 = *(void *)(v31 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_2151CBEF0((void *)(v32 > 1), v33 + 1, 1);
        uint64_t v31 = v50;
      }
      *(void *)(v31 + 16) = v33 + 1;
      *(void *)(v31 + 8 * v33 + 32) = v30;
      v27 += v46;
      --v23;
    }
    while (v23);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v31 = MEMORY[0x263F8EE78];
  }
  uint64_t v34 = sub_2151CE514(v31);
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void *)(v34 + 16);
  swift_bridgeObjectRelease();
  if (v35)
  {
    uint64_t v3 = *(void *)(v0[7] + 72);
    v0[22] = v3;
    uint64_t v2 = sub_2151C4104;
    uint64_t v4 = 0;
    return MEMORY[0x270FA2498](v2, v3, v4);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v36 = (uint64_t (*)(void))v0[1];
    return v36();
  }
}

uint64_t sub_2151C4104()
{
  uint64_t v1 = v0[22];
  if (*(void *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper))
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    uint64_t v4 = sub_2151C6900(&qword_2678652B8, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[23] = v5;
    uint64_t v6 = sub_2151F9A78();
    void *v5 = v0;
    v5[1] = sub_2151C42B4;
    uint64_t v7 = v0[22];
    return MEMORY[0x270FA2318](v0 + 6, v1, v4, 0xD000000000000010, 0x80000002151FC9A0, sub_2151CCC08, v7, v6);
  }
}

uint64_t sub_2151C42B4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C43C4, v1, 0);
}

uint64_t sub_2151C43C4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151C4470()
{
  v1[2] = v0;
  uint64_t v2 = sub_2151F9D58();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C4530, 0, 0);
}

uint64_t sub_2151C4530()
{
  v0[6] = *(void *)(v0[2] + 72);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[7] = v1;
  void *v1 = v0;
  v1[1] = sub_2151C45CC;
  return sub_2151C169C();
}

uint64_t sub_2151C45CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C46E4, v2, 0);
}

uint64_t sub_2151C46E4()
{
  char v1 = sub_2151BF364(*(void *)(v0 + 64));
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v2 = sub_2151C4774;
  }
  else {
    uint64_t v2 = sub_2151C4BE8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2151C4774()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  __swift_project_boxed_opaque_existential_1((void *)(v0[2] + 24), *(void *)(v0[2] + 48));
  uint64_t v4 = *MEMORY[0x263F36CF8];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  v0[9] = v5;
  v0[10] = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v5(v1, v4, v3);
  sub_2151F9C68();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[11] = v6;
  v0[12] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[13] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2151C48B0;
  return sub_2151C1FB8();
}

uint64_t sub_2151C48B0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C49AC, 0, 0);
}

uint64_t sub_2151C49AC()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[11];
  uint64_t v2 = (void (*)(uint64_t, void, uint64_t))v0[9];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[3];
  __swift_project_boxed_opaque_existential_1((void *)(v0[2] + 24), *(void *)(v0[2] + 48));
  v2(v3, *MEMORY[0x263F36D20], v4);
  sub_2151F9C58();
  v1(v3, v4);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  void *v5 = v0;
  v5[1] = sub_2151C4AD0;
  return sub_2151C5610(0);
}

uint64_t sub_2151C4AD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151C4BE8()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  __swift_project_boxed_opaque_existential_1((void *)(v0[2] + 24), *(void *)(v0[2] + 48));
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F36CF8], v3);
  sub_2151F9C68();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[15] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151C4D0C;
  return sub_2151C1FB8();
}

uint64_t sub_2151C4D0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151C4E20(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v2[21] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2151C4EB0;
  return sub_2151C0D58();
}

uint64_t sub_2151C4EB0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 176) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151C4FB0, 0, 0);
}

uint64_t sub_2151C4FB0()
{
  uint64_t v1 = *(void *)(v0 + 152);
  char v2 = *(unsigned char *)(v1 + 32);
  *(unsigned char *)(v0 + 224) = v2;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << v2;
  if (-(-1 << v2) < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  uint64_t v6 = (void *)swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = __clz(__rbit64(v5));
    uint64_t v9 = (v5 - 1) & v5;
LABEL_5:
    uint64_t v10 = *(void **)(v6[6] + 8 * v8);
    *(void *)(v0 + 64) = v10;
    sub_2151CC6F4(v6[7] + 40 * v8, v0 + 72);
    id v11 = v10;
    goto LABEL_12;
  }
  unint64_t v12 = 63 - v4;
  if ((unint64_t)(63 - v4) <= 0x7F)
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v13 = v6[9];
    if (v13)
    {
      uint64_t v7 = 1;
LABEL_9:
      uint64_t v9 = (v13 - 1) & v13;
      unint64_t v8 = __clz(__rbit64(v13)) + (v7 << 6);
      goto LABEL_5;
    }
    if (v12 < 0xC0)
    {
      uint64_t v7 = 1;
    }
    else
    {
      unint64_t v13 = v6[10];
      if (v13)
      {
        uint64_t v7 = 2;
        goto LABEL_9;
      }
      if (v12 < 0x100)
      {
        uint64_t v7 = 2;
      }
      else
      {
        unint64_t v13 = v6[11];
        if (v13)
        {
          uint64_t v7 = 3;
          goto LABEL_9;
        }
        if (v12 < 0x140)
        {
          uint64_t v7 = 3;
        }
        else
        {
          unint64_t v13 = v6[12];
          if (v13)
          {
            uint64_t v7 = 4;
            goto LABEL_9;
          }
          uint64_t v18 = 0;
          uint64_t v19 = v12 >> 6;
          uint64_t v20 = 5;
          if (v19 > 5) {
            uint64_t v20 = v19;
          }
          uint64_t v21 = v20 - 5;
          while (v21 != v18)
          {
            unint64_t v13 = v6[v18++ + 13];
            if (v13)
            {
              uint64_t v7 = v18 + 4;
              goto LABEL_9;
            }
          }
          uint64_t v7 = v19 - 1;
        }
      }
    }
  }
  uint64_t v9 = 0;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
LABEL_12:
  *(void *)(v0 + 184) = v7;
  *(void *)(v0 + 192) = v9;
  sub_2151CEAF4(v0 + 64, v0 + 16, &qword_267865428);
  uint64_t v14 = *(void *)(v0 + 16);
  *(void *)(v0 + 200) = v14;
  if (v14)
  {
    uint64_t v15 = *(void *)(v0 + 160);
    sub_2151CE5D0((long long *)(v0 + 24), v0 + 112);
    uint64_t v16 = *(void *)(v15 + 72);
    *(void *)(v0 + 208) = v16;
    return MEMORY[0x270FA2498](sub_2151C523C, v16, 0);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_2151C551C;
    return sub_2151C4470();
  }
}

uint64_t sub_2151C523C()
{
  sub_2151BDB10(v0 + 112, *(void **)(v0 + 200), *(void *)(v0 + 176));
  return MEMORY[0x270FA2498](sub_2151C52AC, 0, 0);
}

uint64_t sub_2151C52AC()
{
  uint64_t v1 = (uint64_t (*)())__swift_destroy_boxed_opaque_existential_1(v0 + 112);
  int64_t v5 = *(void *)(v0 + 184);
  unint64_t v4 = *(void *)(v0 + 192);
  if (v4)
  {
    uint64_t v6 = (v4 - 1) & v4;
    unint64_t v7 = __clz(__rbit64(v4)) | (v5 << 6);
    uint64_t v8 = *(void *)(v0 + 152);
LABEL_3:
    uint64_t v9 = *(void **)(*(void *)(v8 + 48) + 8 * v7);
    *(void *)(v0 + 64) = v9;
    sub_2151CC6F4(*(void *)(v8 + 56) + 40 * v7, v0 + 72);
    id v10 = v9;
    goto LABEL_22;
  }
  int64_t v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  int64_t v12 = (unint64_t)((1 << *(unsigned char *)(v0 + 224)) + 63) >> 6;
  if (v11 < v12)
  {
    uint64_t v8 = *(void *)(v0 + 152);
    uint64_t v13 = v8 + 64;
    unint64_t v14 = *(void *)(v8 + 64 + 8 * v11);
    if (v14)
    {
LABEL_7:
      uint64_t v6 = (v14 - 1) & v14;
      unint64_t v7 = __clz(__rbit64(v14)) + (v11 << 6);
      int64_t v5 = v11;
      goto LABEL_3;
    }
    int64_t v15 = v5 + 2;
    ++v5;
    if (v11 + 1 < v12)
    {
      unint64_t v14 = *(void *)(v13 + 8 * v15);
      if (v14)
      {
LABEL_10:
        int64_t v11 = v15;
        goto LABEL_7;
      }
      int64_t v5 = v11 + 1;
      if (v11 + 2 < v12)
      {
        unint64_t v14 = *(void *)(v13 + 8 * (v11 + 2));
        if (v14)
        {
          v11 += 2;
          goto LABEL_7;
        }
        int64_t v15 = v11 + 3;
        int64_t v5 = v11 + 2;
        if (v11 + 3 < v12)
        {
          unint64_t v14 = *(void *)(v13 + 8 * v15);
          if (v14) {
            goto LABEL_10;
          }
          while (1)
          {
            int64_t v11 = v15 + 1;
            if (__OFADD__(v15, 1)) {
              break;
            }
            if (v11 >= v12)
            {
              int64_t v5 = v12 - 1;
              goto LABEL_21;
            }
            unint64_t v14 = *(void *)(v13 + 8 * v11);
            ++v15;
            if (v14) {
              goto LABEL_7;
            }
          }
LABEL_30:
          __break(1u);
          return MEMORY[0x270FA2498](v1, v2, v3);
        }
      }
    }
  }
LABEL_21:
  uint64_t v6 = 0;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
LABEL_22:
  *(void *)(v0 + 184) = v5;
  *(void *)(v0 + 192) = v6;
  sub_2151CEAF4(v0 + 64, v0 + 16, &qword_267865428);
  uint64_t v16 = *(void *)(v0 + 16);
  *(void *)(v0 + 200) = v16;
  if (v16)
  {
    uint64_t v17 = *(void *)(v0 + 160);
    sub_2151CE5D0((long long *)(v0 + 24), v0 + 112);
    uint64_t v2 = *(void *)(v17 + 72);
    *(void *)(v0 + 208) = v2;
    uint64_t v1 = sub_2151C523C;
    uint64_t v3 = 0;
    return MEMORY[0x270FA2498](v1, v2, v3);
  }
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v18;
  void *v18 = v0;
  v18[1] = sub_2151C551C;
  return sub_2151C4470();
}

uint64_t sub_2151C551C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151C5610(char a1)
{
  *(void *)(v2 + 88) = v1;
  *(unsigned char *)(v2 + 81) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  *(void *)(v2 + 96) = swift_task_alloc();
  uint64_t v3 = sub_2151F9D58();
  *(void *)(v2 + 104) = v3;
  *(void *)(v2 + 112) = *(void *)(v3 - 8);
  *(void *)(v2 + 120) = swift_task_alloc();
  uint64_t v4 = sub_2151FA0A8();
  *(void *)(v2 + 128) = v4;
  *(void *)(v2 + 136) = *(void *)(v4 - 8);
  *(void *)(v2 + 144) = swift_task_alloc();
  uint64_t v5 = sub_2151FA098();
  *(void *)(v2 + 152) = v5;
  *(void *)(v2 + 160) = *(void *)(v5 - 8);
  *(void *)(v2 + 168) = swift_task_alloc();
  *(void *)(v2 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151C57CC, 0, 0);
}

uint64_t sub_2151C57CC()
{
  if (*(unsigned char *)(v0 + 81))
  {
    *(void *)(v0 + 224) = 0;
    *(void *)(v0 + 232) = *(void *)(*(void *)(v0 + 88) + 80);
    sub_2151F9858();
    sub_2151C6900(&qword_2678652E0, MEMORY[0x263F36C28]);
    uint64_t v1 = sub_2151F9EE8();
    uint64_t v3 = v2;
    uint64_t v4 = sub_2151C5CF8;
    uint64_t v5 = v1;
    uint64_t v6 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(v0 + 88) + 72);
    *(void *)(v0 + 184) = v5;
    uint64_t v4 = sub_2151C58BC;
    uint64_t v6 = 0;
  }
  return MEMORY[0x270FA2498](v4, v5, v6);
}

uint64_t sub_2151C58BC()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[23] + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  return MEMORY[0x270FA2498](sub_2151C596C, 0, 0);
}

uint64_t sub_2151C596C()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  sub_2151FA078();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 192) = v4;
  *(void *)(v0 + 200) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v1, v2);
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 64) = 0;
  *(unsigned char *)(v0 + 80) = 1;
  sub_2151FA178();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v5;
  uint64_t v6 = sub_2151C6900(&qword_267865338, MEMORY[0x263F8F740]);
  void *v5 = v0;
  v5[1] = sub_2151C5AB4;
  uint64_t v7 = *(void *)(v0 + 176);
  uint64_t v8 = *(void *)(v0 + 144);
  uint64_t v9 = *(void *)(v0 + 128);
  return MEMORY[0x270FA1FF8](v7, v0 + 64, v8, v9, v6);
}

uint64_t sub_2151C5AB4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[24];
  if (v0)
  {
    uint64_t v4 = v2[22];
    uint64_t v5 = v2[19];
    (*(void (**)(void, void))(v2[17] + 8))(v2[18], v2[16]);
    v3(v4, v5);
    uint64_t v6 = sub_2151C62E0;
  }
  else
  {
    uint64_t v7 = v2[22];
    uint64_t v8 = v2[19];
    (*(void (**)(void, void))(v2[17] + 8))(v2[18], v2[16]);
    v3(v7, v8);
    uint64_t v6 = sub_2151C5C30;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2151C5C30()
{
  v0[28] = v0[27];
  v0[29] = *(void *)(v0[11] + 80);
  sub_2151F9858();
  sub_2151C6900(&qword_2678652E0, MEMORY[0x263F36C28]);
  uint64_t v2 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151C5CF8, v2, v1);
}

uint64_t sub_2151C5CF8()
{
  *(unsigned char *)(v0 + 82) = sub_2151F9848() & 1;
  return MEMORY[0x270FA2498](sub_2151C5D68, 0, 0);
}

uint64_t sub_2151C5D68()
{
  if (*(unsigned char *)(v0 + 82) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 88);
    *(void *)(v0 + 240) = *(void *)(v1 + 64);
    uint64_t v2 = *(void *)(v1 + 72);
    *(void *)(v0 + 248) = v2;
    return MEMORY[0x270FA2498](sub_2151C5E58, v2, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_2151C5E58()
{
  uint64_t v2 = v0[30];
  uint64_t v1 = v0[31];
  swift_beginAccess();
  v0[32] = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151C5EE0, v2, 0);
}

uint64_t sub_2151C5EE0()
{
  uint64_t v1 = *(void *)(v0 + 224);
  *(unsigned char *)(v0 + 83) = sub_2151C048C(*(void *)(v0 + 256)) & 1;
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2151C5FE4, 0, 0);
  }
}

uint64_t sub_2151C5FE4()
{
  if (*(unsigned char *)(v0 + 83) == 1
    && (uint64_t v1 = MEMORY[0x2166B57A0](*(void *)(v0 + 88) + 96), (*(void *)(v0 + 264) = v1) != 0))
  {
    return MEMORY[0x270FA2498](sub_2151C60D8, v1, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_2151C60D8()
{
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F36D20], v5);
  sub_2151F9C68();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v5);
  uint64_t v6 = sub_2151F9F18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_2151C6900(&qword_267865340, (void (*)(uint64_t))type metadata accessor for ODISessionInternal);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v1;
  v8[3] = v7;
  v8[4] = v1;
  swift_retain_n();
  sub_2151D16EC(v4, (uint64_t)&unk_267865348, (uint64_t)v8);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_2151C62E0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151C6380()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2151CE5F0(v0 + 96);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2151C63E8()
{
  sub_2151C6380();
  return MEMORY[0x270FA0228](v0, 136, 7);
}

uint64_t type metadata accessor for ODIBindingsManager()
{
  return self;
}

uint64_t type metadata accessor for ODIBindingsManager.CallbackQueuer()
{
  return self;
}

void type metadata accessor for ODITypeOfID(uint64_t a1)
{
}

void type metadata accessor for ODIOutcomeType(uint64_t a1)
{
}

void type metadata accessor for ODIAttributeKey(uint64_t a1)
{
}

void type metadata accessor for ODIServiceProviderId(uint64_t a1)
{
}

void sub_2151C64B4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2151C64FC(uint64_t a1, uint64_t a2)
{
  return sub_2151C6A4C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2151C6520(uint64_t a1, id *a2)
{
  uint64_t result = sub_2151F9E08();
  *a2 = 0;
  return result;
}

uint64_t sub_2151C6598(uint64_t a1, id *a2)
{
  char v3 = sub_2151F9E18();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2151C6618@<X0>(uint64_t *a1@<X8>)
{
  sub_2151F9E28();
  uint64_t v2 = sub_2151F9DF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2151C665C(uint64_t a1, uint64_t a2)
{
  return sub_2151C6A4C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2151C6680()
{
  uint64_t v0 = sub_2151F9E28();
  uint64_t v2 = v1;
  if (v0 == sub_2151F9E28() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2151FA148();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_2151C670C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2151C6724@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2151F9E28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2151C6750@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2151F9DF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_2151C6798@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2151C67A8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2151C67B4(uint64_t a1)
{
  uint64_t v2 = sub_2151C6900(&qword_267865270, type metadata accessor for ODIServiceProviderId);
  uint64_t v3 = sub_2151C6900(&qword_267865278, type metadata accessor for ODIServiceProviderId);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2151C6870()
{
  return sub_2151C6900(&qword_2678651E8, type metadata accessor for ODIServiceProviderId);
}

uint64_t sub_2151C68B8()
{
  return sub_2151C6900(&qword_2678651F0, type metadata accessor for ODIServiceProviderId);
}

uint64_t sub_2151C6900(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2151C6948()
{
  return sub_2151C6900(&qword_2678651F8, type metadata accessor for ODIServiceProviderId);
}

uint64_t sub_2151C6990(uint64_t a1)
{
  uint64_t v2 = sub_2151C6900((unint64_t *)&qword_267865260, type metadata accessor for ODIAttributeKey);
  uint64_t v3 = sub_2151C6900(&qword_267865268, type metadata accessor for ODIAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2151C6A4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2151F9E28();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2151C6A90()
{
  sub_2151F9E28();
  sub_2151F9E58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2151C6AE4()
{
  sub_2151F9E28();
  sub_2151FA198();
  sub_2151F9E58();
  uint64_t v0 = sub_2151FA1B8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2151C6B58()
{
  return sub_2151C6900(&qword_267865200, type metadata accessor for ODIAttributeKey);
}

uint64_t sub_2151C6BA0()
{
  return sub_2151C6900(qword_267865208, type metadata accessor for ODIAttributeKey);
}

uint64_t sub_2151C6BE8()
{
  return sub_2151C6900(&qword_267865230, type metadata accessor for ODIAttributeKey);
}

uint64_t sub_2151C6C30(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_2151C6CFC;
  return v4();
}

uint64_t sub_2151C6CFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

size_t sub_2151C6DF4(size_t result, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652C8);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2678652A8) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2678652A8) - 8);
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

void *sub_2151C6FD0(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865248);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865250);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2151C70F4(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for ODIServiceProviderId(0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_2151C7214(size_t result, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865298);
  uint64_t v10 = *(void *)(sub_2151F96C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
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
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_2151F96C8() - 8);
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

unint64_t sub_2151C73E8(uint64_t a1, uint64_t a2)
{
  sub_2151FA198();
  sub_2151F9E58();
  uint64_t v4 = sub_2151FA1B8();
  return sub_2151C7658(a1, a2, v4);
}

unint64_t sub_2151C7460(unsigned __int8 *a1)
{
  sub_2151FA198();
  sub_2151FA1A8();
  type metadata accessor for ODIFieldsKey();
  sub_2151F9808();
  sub_2151C6900(&qword_267865300, MEMORY[0x263F36C10]);
  sub_2151F9DD8();
  uint64_t v2 = sub_2151FA1B8();
  return sub_2151C773C(a1, v2);
}

unint64_t sub_2151C752C(uint64_t a1)
{
  sub_2151F97E8();
  sub_2151C6900(&qword_267865288, MEMORY[0x263F36BD8]);
  uint64_t v2 = sub_2151F9DC8();
  return sub_2151C7898(a1, v2);
}

unint64_t sub_2151C75C4(uint64_t a1)
{
  sub_2151F9E28();
  sub_2151FA198();
  sub_2151F9E58();
  uint64_t v2 = sub_2151FA1B8();
  swift_bridgeObjectRelease();
  return sub_2151C7A58(a1, v2);
}

unint64_t sub_2151C7658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2151FA148() & 1) == 0)
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
      while (!v14 && (sub_2151FA148() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2151C773C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ODIFieldsKey();
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (unsigned __int8 *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_2151CC9E8(*(void *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if (*v8 == *a1 && (sub_2151F97F8() & 1) != 0) {
        break;
      }
      sub_2151CCAB0((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_2151CCAB0((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_2151C7898(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_2151F97E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_2151C6900(&qword_267865290, MEMORY[0x263F36BD8]);
      char v15 = sub_2151F9DE8();
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

unint64_t sub_2151C7A58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2151F9E28();
    uint64_t v8 = v7;
    if (v6 == sub_2151F9E28() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2151FA148();
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
          uint64_t v13 = sub_2151F9E28();
          uint64_t v15 = v14;
          if (v13 == sub_2151F9E28() && v15 == v16) {
            break;
          }
          char v18 = sub_2151FA148();
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

uint64_t sub_2151C7BD0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865408);
  char v37 = a2;
  uint64_t v6 = sub_2151FA0D8();
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
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_2151CE5D0(v25, (uint64_t)v38);
    }
    else
    {
      sub_2151CC6F4((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_2151FA198();
    sub_2151F9E58();
    uint64_t result = sub_2151FA1B8();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_2151CE5D0(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2151C7EF8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865258);
  char v36 = a2;
  uint64_t v6 = sub_2151FA0D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2151FA198();
    sub_2151F9E58();
    uint64_t result = sub_2151FA1B8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2151C8210(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ODIFieldsKey();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F8);
  int v42 = a2;
  uint64_t v9 = sub_2151FA0D8();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v39 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  char v37 = v2;
  int64_t v38 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v38) {
      break;
    }
    uint64_t v22 = v39;
    unint64_t v23 = v39[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v38) {
        goto LABEL_34;
      }
      unint64_t v23 = v39[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v38)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v37;
          if ((v42 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v39[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v38) {
              goto LABEL_34;
            }
            unint64_t v23 = v39[v17];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v40 + 72);
    uint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
    if (v42)
    {
      sub_2151CCA4C(v26, (uint64_t)v7);
      uint64_t v27 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
    }
    else
    {
      sub_2151CC9E8(v26, (uint64_t)v7);
      uint64_t v27 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
    }
    sub_2151FA198();
    sub_2151FA1A8();
    sub_2151F9808();
    sub_2151C6900(&qword_267865300, MEMORY[0x263F36C10]);
    sub_2151F9DD8();
    uint64_t result = sub_2151FA1B8();
    uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v29) & ~*(void *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v34 = *(void *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_2151CCA4C((uint64_t)v7, *(void *)(v10 + 48) + v25 * v18);
    *(void *)(*(void *)(v10 + 56) + 8 * v18) = v27;
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  uint64_t v22 = v39;
  if ((v42 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_2151C8610(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_2151F97E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865280);
  int v42 = a2;
  uint64_t v10 = sub_2151FA0D8();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    char v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      char v28 = *(unsigned char *)(*(void *)(v9 + 56) + v21);
      sub_2151C6900(&qword_267865288, MEMORY[0x263F36BD8]);
      uint64_t result = sub_2151F9DC8();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v25 * v19, v8, v44);
      *(unsigned char *)(*(void *)(v11 + 56) + v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_2151C8A34(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865430);
  char v35 = a2;
  uint64_t v6 = sub_2151FA0D8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    char v32 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    BOOL v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v16 = v15 | (v13 << 6);
      }
      else
      {
        int64_t v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v17 >= v33) {
          goto LABEL_34;
        }
        unint64_t v18 = v34[v17];
        ++v13;
        if (!v18)
        {
          int64_t v13 = v17 + 1;
          if (v17 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v18 = v34[v13];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v32;
              if (v35)
              {
                uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
                if (v31 >= 64) {
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *BOOL v34 = -1 << v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v18 = v34[v13];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v19;
          }
        }
LABEL_21:
        unint64_t v10 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      unint64_t v20 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
      unint64_t v21 = (long long *)(*(void *)(v5 + 56) + 40 * v16);
      if (v35)
      {
        sub_2151CE5D0(v21, (uint64_t)v36);
      }
      else
      {
        sub_2151CC6F4((uint64_t)v21, (uint64_t)v36);
        id v22 = v20;
      }
      sub_2151F9E28();
      sub_2151FA198();
      sub_2151F9E58();
      uint64_t v23 = sub_2151FA1B8();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = v23 & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(void *)(*(void *)(v7 + 48) + 8 * v14) = v20;
      uint64_t result = sub_2151CE5D0(v36, *(void *)(v7 + 56) + 40 * v14);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2151C8D60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652D0);
  char v38 = a2;
  uint64_t v6 = sub_2151FA0D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2151FA198();
    sub_2151F9E58();
    uint64_t result = sub_2151FA1B8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2151C9070(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2151F9FE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2151FA198();
        swift_bridgeObjectRetain();
        sub_2151F9E58();
        uint64_t v11 = sub_2151FA1B8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          unint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2151C925C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2151F9FE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2151FA198();
        swift_bridgeObjectRetain();
        sub_2151F9E58();
        uint64_t v9 = sub_2151FA1B8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2151C9434(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_2151C73E8(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2151C9C30();
      goto LABEL_7;
    }
    sub_2151C7BD0(v15, a4 & 1);
    unint64_t v21 = sub_2151C73E8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2151FA168();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    __swift_destroy_boxed_opaque_existential_1(v19);
    return sub_2151CE5D0(a1, v19);
  }
LABEL_13:
  sub_2151C9B20(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2151C958C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2151C73E8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2151C9E1C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2151C7EF8(v15, a4 & 1);
  unint64_t v21 = sub_2151C73E8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2151FA168();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v23 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2151C96FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2151C9734(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2151CEB5C;
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267865238 + dword_267865238);
  return v8(a1, a2, v6);
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

uint64_t sub_2151C9844(uint64_t a1, unsigned __int8 *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for ODIFieldsKey();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = (void *)*v3;
  unint64_t v13 = sub_2151C7460(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v20 + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_2151C9FD4();
    goto LABEL_7;
  }
  sub_2151C8210(v16, a3 & 1);
  unint64_t v22 = sub_2151C7460(a2);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    uint64_t result = sub_2151FA168();
    __break(1u);
    return result;
  }
  unint64_t v13 = v22;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2151CC9E8((uint64_t)a2, (uint64_t)v10);
  return sub_2151C9B90(v13, (uint64_t)v10, a1, v19);
}

void sub_2151C99B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2151C73E8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2151CA690();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2151C8D60(v15, a4 & 1);
  unint64_t v20 = sub_2151C73E8(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_2151FA168();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t sub_2151C9B20(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_2151CE5D0(a4, a5[7] + 40 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_2151C9B90(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for ODIFieldsKey();
  uint64_t result = sub_2151CCA4C(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
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

void *sub_2151C9C30()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865408);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2151FA0C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_2151CC6F4(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = v19;
    v21[1] = v18;
    sub_2151CE5D0(v26, *(void *)(v4 + 56) + v20);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2151C9E1C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865258);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2151FA0C8();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2151C9FD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ODIFieldsKey();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F8);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2151FA0C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  int64_t v24 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v25 + 72) * v17;
    sub_2151CC9E8(*(void *)(v5 + 48) + v18, (uint64_t)v4);
    uint64_t v19 = 8 * v17;
    uint64_t v20 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
    sub_2151CCA4C((uint64_t)v4, *(void *)(v7 + 48) + v18);
    *(void *)(*(void *)(v7 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2151CA234()
{
  uint64_t v1 = sub_2151F97E8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865280);
  unint64_t v22 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_2151FA0C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *unint64_t v22 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v23 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v26 = v2 + 16;
  int64_t v24 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v25 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    char v17 = *(unsigned char *)(*(void *)(v5 + 56) + v15);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(unsigned char *)(*(void *)(v7 + 56) + v15) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v24) {
    goto LABEL_23;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_2151CA4C4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865430);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2151FA0C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    char v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 40 * v15;
    sub_2151CC6F4(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_2151CE5D0(v22, *(void *)(v4 + 56) + v18);
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2151CA690()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2151FA0C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2151CA844(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2151FA198();
  swift_bridgeObjectRetain();
  sub_2151F9E58();
  uint64_t v8 = sub_2151FA1B8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2151FA148() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2151FA148() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2151CB214(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2151CA9F4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_2151F9E28();
  sub_2151FA198();
  swift_bridgeObjectRetain();
  sub_2151F9E58();
  uint64_t v7 = sub_2151FA1B8();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v24 = a2;
    sub_2151CB3B0((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = sub_2151F9E28();
  uint64_t v12 = v11;
  if (v10 == sub_2151F9E28() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_2151FA148();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = sub_2151F9E28();
        uint64_t v19 = v18;
        if (v17 == sub_2151F9E28() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = sub_2151FA148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

uint64_t sub_2151CAC20()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865398);
  uint64_t v3 = sub_2151FA018();
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2151FA198();
      sub_2151F9E58();
      uint64_t result = sub_2151FA1B8();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2151CAF00()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865378);
  uint64_t v3 = sub_2151FA018();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    BOOL v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      sub_2151F9E28();
      sub_2151FA198();
      sub_2151F9E58();
      uint64_t v18 = sub_2151FA1B8();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2151CB214(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2151CAC20();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2151CB5E0();
      goto LABEL_22;
    }
    sub_2151CB940();
  }
  uint64_t v11 = *v4;
  sub_2151FA198();
  sub_2151F9E58();
  uint64_t result = sub_2151FA1B8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2151FA148(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2151FA158();
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
          uint64_t result = sub_2151FA148();
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
  *unint64_t v21 = v8;
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

uint64_t sub_2151CB3B0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_2151CAF00();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_2151CB794();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_2151CBBF0();
  }
  uint64_t v9 = *v3;
  sub_2151F9E28();
  sub_2151FA198();
  sub_2151F9E58();
  uint64_t v10 = sub_2151FA1B8();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = sub_2151F9E28();
  uint64_t v14 = v13;
  if (v12 == sub_2151F9E28() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = sub_2151FA148();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = sub_2151F9E28();
      uint64_t v21 = v20;
      if (v19 == sub_2151F9E28() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = sub_2151FA148();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for ODIAttributeKey(0);
  uint64_t result = sub_2151FA158();
  __break(1u);
  return result;
}

void *sub_2151CB5E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865398);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2151FA008();
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
    char v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

id sub_2151CB794()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865378);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2151FA008();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    char v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2151CB940()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865398);
  uint64_t v3 = sub_2151FA018();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2151FA198();
    swift_bridgeObjectRetain();
    sub_2151F9E58();
    uint64_t result = sub_2151FA1B8();
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
    void *v13 = v20;
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

uint64_t sub_2151CBBF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865378);
  uint64_t v3 = sub_2151FA018();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  BOOL v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    sub_2151F9E28();
    sub_2151FA198();
    id v18 = v17;
    sub_2151F9E58();
    uint64_t v19 = sub_2151FA1B8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_2151CBED0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2151CBF30(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_2151CBEF0(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2151CC034(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_2151CBF10(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_2151CC154(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2151CBF30(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2678653A0);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
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

void *sub_2151CC034(void *result, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865380);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for ODIAttributeKey(0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_2151CC154(size_t result, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865388);
  uint64_t v10 = *(void *)(sub_2151F97E8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
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
  id v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_2151F97E8() - 8);
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

void (*sub_2151CC328(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_2151CC5E0(v6);
  v6[10] = sub_2151CC448(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_2151CC3D4;
}

void sub_2151CC3D4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_2151CC448(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  char v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_2151C73E8(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_2151CC590;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_2151C9E1C();
      goto LABEL_7;
    }
    sub_2151C7EF8(v16, a4 & 1);
    unint64_t v20 = sub_2151C73E8(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  size_t result = (void (*)(uint64_t **))sub_2151FA168();
  __break(1u);
  return result;
}

void sub_2151CC590(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_2151CC61C(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_2151CC5E0(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_2151CC610;
}

uint64_t sub_2151CC610(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_2151CC61C(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    uint64_t v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      uint64_t v10 = (void *)(v9[6] + 16 * a4);
      *uint64_t v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      long long v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_2151C925C(a4, *a3);
  }
  return (uint64_t *)swift_bridgeObjectRetain();
}

uint64_t sub_2151CC6F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2151CC758(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_2151CC768()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2151CC840(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2678652A8) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2151CEB5C;
  return sub_2151BD504(a1, v5, v6, v7, v8);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2151CC9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ODIFieldsKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2151CCA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ODIFieldsKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2151CCAB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ODIFieldsKey();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2151CCB0C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2151CEB5C;
  v4[3] = a1;
  v4[4] = v1;
  return MEMORY[0x270FA2498](sub_2151C27A4, 0, 0);
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

uint64_t sub_2151CCC08(uint64_t a1)
{
  return sub_2151BD14C(a1, v1);
}

uint64_t sub_2151CCC10()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2151CCC50(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2151CEB5C;
  return sub_2151E6258(a1, v4, v5, v6);
}

uint64_t sub_2151CCD04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v37 = a1 + 64;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_2151CE5E8();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_2151FA198();
      swift_bridgeObjectRetain();
      sub_2151F9E58();
      uint64_t v19 = sub_2151FA1B8();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    char v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_2151FA148() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_2151FA148() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_2151CD658((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_2151CE5E8();
    }
    else
    {
      id v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_2151CD658((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_2151CE5E8();
      MEMORY[0x2166B56D0](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_2151CD174(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v47[5] = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v44 = a1 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v42 = ~v4;
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & v3;
  int64_t v43 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = a2 + 56;
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v45 = v8;
  int64_t v46 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v46 << 6);
    }
    else
    {
      int64_t v11 = v46 + 1;
      if (__OFADD__(v46, 1))
      {
        __break(1u);
        goto LABEL_49;
      }
      if (v11 >= v43) {
        goto LABEL_47;
      }
      unint64_t v12 = *(void *)(v44 + 8 * v11);
      int64_t v13 = v46 + 1;
      if (!v12)
      {
        int64_t v13 = v46 + 2;
        if (v46 + 2 >= v43) {
          goto LABEL_47;
        }
        unint64_t v12 = *(void *)(v44 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v46 + 3;
          if (v46 + 3 >= v43) {
            goto LABEL_47;
          }
          unint64_t v12 = *(void *)(v44 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v46 + 4;
            if (v46 + 4 >= v43) {
              goto LABEL_47;
            }
            unint64_t v12 = *(void *)(v44 + 8 * v13);
            if (!v12)
            {
              int64_t v14 = v46 + 5;
              if (v46 + 5 >= v43)
              {
LABEL_47:
                sub_2151CE5E8();
                return v2;
              }
              unint64_t v12 = *(void *)(v44 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  int64_t v13 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    break;
                  }
                  if (v13 >= v43) {
                    goto LABEL_47;
                  }
                  unint64_t v12 = *(void *)(v44 + 8 * v13);
                  ++v14;
                  if (v12) {
                    goto LABEL_24;
                  }
                }
LABEL_49:
                __break(1u);
              }
              int64_t v13 = v46 + 5;
            }
          }
        }
      }
LABEL_24:
      unint64_t v6 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
      int64_t v46 = v13;
    }
    int64_t v15 = *(void **)(*(void *)(v8 + 48) + 8 * v10);
    sub_2151F9E28();
    sub_2151FA198();
    id v16 = v15;
    sub_2151F9E58();
    uint64_t v17 = sub_2151FA1B8();
    swift_bridgeObjectRelease();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = v17 & ~v18;
    if ((*(void *)(v7 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19)) {
      break;
    }
LABEL_6:

    uint64_t v8 = v45;
  }
  uint64_t v20 = sub_2151F9E28();
  uint64_t v22 = v21;
  if (v20 != sub_2151F9E28() || v22 != v23)
  {
    char v25 = sub_2151FA148();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_41;
    }
    uint64_t v26 = ~v18;
    while (1)
    {
      unint64_t v19 = (v19 + 1) & v26;
      if (((*(void *)(v7 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        goto LABEL_6;
      }
      uint64_t v27 = sub_2151F9E28();
      uint64_t v29 = v28;
      if (v27 == sub_2151F9E28() && v29 == v30) {
        break;
      }
      char v32 = sub_2151FA148();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v32) {
        goto LABEL_41;
      }
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_41:

  v47[0] = v45;
  v47[1] = v44;
  v47[2] = v42;
  v47[3] = v46;
  v47[4] = v6;
  char v34 = *(unsigned char *)(v2 + 32);
  unint64_t v35 = (unint64_t)((1 << v34) + 63) >> 6;
  size_t v36 = 8 * v35;
  if ((v34 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v42 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v36);
    sub_2151CD950((unint64_t *)((char *)&v42 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0)), v35, v2, v19, v47);
    uint64_t v38 = v37;
    swift_release();
    sub_2151CE5E8();
  }
  else
  {
    uint64_t v39 = (void *)swift_slowAlloc();
    memcpy(v39, (const void *)(v2 + 56), v36);
    sub_2151CD950((unint64_t *)v39, v35, v2, v19, v47);
    uint64_t v38 = v40;
    swift_release();
    sub_2151CE5E8();
    MEMORY[0x2166B56D0](v39, -1, -1);
  }
  return v38;
}

uint64_t sub_2151CD658(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_2151CDCD8(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        unint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_2151FA198();
        swift_bridgeObjectRetain();
        sub_2151F9E58();
        uint64_t v22 = sub_2151FA1B8();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        uint64_t v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_2151FA148() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          char v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_2151FA148() & 1) != 0)
          {
            size_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        size_t result = swift_bridgeObjectRelease();
      }
      size_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

void sub_2151CD950(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  uint64_t v44 = a3 + 56;
  while (2)
  {
    uint64_t v41 = v7;
    do
    {
      while (1)
      {
        int64_t v8 = a5[3];
        unint64_t v9 = a5[4];
        if (v9)
        {
          uint64_t v10 = (v9 - 1) & v9;
          unint64_t v11 = __clz(__rbit64(v9)) | (v8 << 6);
        }
        else
        {
          int64_t v12 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
            goto LABEL_47;
          }
          int64_t v13 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v14 = a5[3];
          if (v12 >= v13) {
            goto LABEL_45;
          }
          uint64_t v15 = a5[1];
          unint64_t v16 = *(void *)(v15 + 8 * v12);
          if (!v16)
          {
            int64_t v14 = v8 + 1;
            if (v8 + 2 >= v13) {
              goto LABEL_45;
            }
            unint64_t v16 = *(void *)(v15 + 8 * (v8 + 2));
            if (v16)
            {
              int64_t v12 = v8 + 2;
            }
            else
            {
              int64_t v14 = v8 + 2;
              if (v8 + 3 >= v13) {
                goto LABEL_45;
              }
              unint64_t v16 = *(void *)(v15 + 8 * (v8 + 3));
              if (v16)
              {
                int64_t v12 = v8 + 3;
              }
              else
              {
                int64_t v12 = v8 + 4;
                int64_t v14 = v8 + 3;
                if (v8 + 4 >= v13) {
                  goto LABEL_45;
                }
                unint64_t v16 = *(void *)(v15 + 8 * v12);
                if (!v16)
                {
                  int64_t v14 = v13 - 1;
                  int64_t v17 = v8 + 5;
                  while (v13 != v17)
                  {
                    unint64_t v16 = *(void *)(v15 + 8 * v17++);
                    if (v16)
                    {
                      int64_t v12 = v17 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_45:
                  a5[3] = v14;
                  a5[4] = 0;
                  swift_retain();
                  sub_2151CDF70(a1, a2, v41, a3);
                  return;
                }
              }
            }
          }
LABEL_21:
          uint64_t v10 = (v16 - 1) & v16;
          unint64_t v11 = __clz(__rbit64(v16)) + (v12 << 6);
          int64_t v8 = v12;
        }
        int64_t v18 = *(void **)(*(void *)(*a5 + 48) + 8 * v11);
        a5[3] = v8;
        a5[4] = v10;
        sub_2151F9E28();
        sub_2151FA198();
        id v43 = v18;
        sub_2151F9E58();
        uint64_t v19 = sub_2151FA1B8();
        swift_bridgeObjectRelease();
        uint64_t v20 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v21 = v19 & ~v20;
        unint64_t v22 = v21 >> 6;
        uint64_t v23 = 1 << v21;
        if (((1 << v21) & *(void *)(v44 + 8 * (v21 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v24 = sub_2151F9E28();
        uint64_t v26 = v25;
        if (v24 == sub_2151F9E28() && v26 == v27)
        {
          swift_bridgeObjectRelease_n();
          break;
        }
        char v29 = sub_2151FA148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v29) {
          break;
        }
        uint64_t v30 = ~v20;
        for (unint64_t i = v21 + 1; ; unint64_t i = v32 + 1)
        {
          unint64_t v32 = i & v30;
          if (((*(void *)(v44 + (((i & v30) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v30)) & 1) == 0) {
            break;
          }
          uint64_t v33 = sub_2151F9E28();
          uint64_t v35 = v34;
          if (v33 == sub_2151F9E28() && v35 == v36)
          {
            swift_bridgeObjectRelease_n();
LABEL_41:

            unint64_t v22 = v32 >> 6;
            uint64_t v23 = 1 << v32;
            goto LABEL_38;
          }
          char v38 = sub_2151FA148();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v38) {
            goto LABEL_41;
          }
        }
LABEL_3:
      }
LABEL_38:
      unint64_t v39 = a1[v22];
      a1[v22] = v39 & ~v23;
    }
    while ((v23 & v39) == 0);
    uint64_t v7 = v41 - 1;
    if (__OFSUB__(v41, 1))
    {
LABEL_47:
      __break(1u);
      return;
    }
    if (v41 != 1) {
      continue;
    }
    break;
  }
}

uint64_t sub_2151CDCD8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865398);
  uint64_t result = sub_2151FA028();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    int64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_2151FA198();
    swift_bridgeObjectRetain();
    sub_2151F9E58();
    uint64_t result = sub_2151FA1B8();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_2151CDF70(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865378);
  uint64_t result = sub_2151FA028();
  uint64_t v9 = result;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= v31) {
      goto LABEL_36;
    }
    unint64_t v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_36;
      }
      unint64_t v16 = v30[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_36;
        }
        unint64_t v16 = v30[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void **)(*(void *)(v4 + 48) + 8 * v14);
    sub_2151F9E28();
    sub_2151FA198();
    id v19 = v18;
    sub_2151F9E58();
    uint64_t v20 = sub_2151FA1B8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(void *)(*(void *)(v9 + 48) + 8 * v24) = v19;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= v31) {
    goto LABEL_36;
  }
  unint64_t v16 = v30[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_36;
    }
    unint64_t v16 = v30[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_2151CE20C(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_2151CE2AC(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

BOOL sub_2151CE390(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return 1;
  }
  if (*(void *)(a2 + 16))
  {
    unint64_t v4 = a1 + 4;
    unint64_t v5 = a1 + 5;
    uint64_t v6 = a2 + 56;
    uint64_t v7 = 1;
    unint64_t v22 = a1 + 4;
    while (1)
    {
      uint64_t v8 = *v5;
      uint64_t v9 = *v4;
      swift_bridgeObjectRetain();
      sub_2151FA198();
      sub_2151F9E58();
      uint64_t v10 = sub_2151FA1B8();
      uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v12 = v10 & ~v11;
      if (((*(void *)(v6 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        break;
      }
      uint64_t v13 = *(void *)(a2 + 48);
      unint64_t v14 = (void *)(v13 + 16 * v12);
      BOOL v15 = *v14 == v9 && v14[1] == v8;
      if (!v15 && (sub_2151FA148() & 1) == 0)
      {
        uint64_t v17 = ~v11;
        for (unint64_t i = v12 + 1; ; unint64_t i = v19 + 1)
        {
          uint64_t v19 = i & v17;
          if (((*(void *)(v6 + (((i & v17) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v17)) & 1) == 0) {
            break;
          }
          uint64_t v20 = (void *)(v13 + 16 * v19);
          BOOL v21 = *v20 == v9 && v20[1] == v8;
          if (v21 || (sub_2151FA148() & 1) != 0) {
            goto LABEL_10;
          }
        }
        break;
      }
LABEL_10:
      swift_bridgeObjectRelease();
      BOOL result = v7 == v2;
      if (v7 == v2 || !*(void *)(a2 + 16)) {
        return result;
      }
      unint64_t v4 = &v22[2 * v7++];
      unint64_t v5 = v4 + 1;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_2151CE514(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for ODIAttributeKey(0);
  sub_2151C6900((unint64_t *)&qword_267865260, type metadata accessor for ODIAttributeKey);
  uint64_t result = sub_2151F9FB8();
  uint64_t v7 = result;
  if (v2)
  {
    unint64_t v4 = (void **)(a1 + 32);
    do
    {
      unint64_t v5 = *v4++;
      sub_2151CA9F4(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_2151CE5D0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2151CE5E8()
{
  return swift_release();
}

uint64_t sub_2151CE5F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2151CE618(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2151CE624()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_2151CE674(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[5] = v6;
  v7[6] = v1 + 7;
  v7[3] = v4;
  v7[4] = v5;
  v7[1] = sub_2151C3238;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_2151BE7A0, v4, 0);
}

uint64_t sub_2151CE740(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_2151CEB5C;
  return sub_2151BE9D8(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_2151CE808(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2151CEB5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2678653D0 + dword_2678653D0);
  return v6(a1, v4);
}

uint64_t sub_2151CE8BC()
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_2151CE914()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = (uint64_t)(v0 + 6);
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[13];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_2151CEB5C;
  return sub_2151BEF3C(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_2151CE9EC()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2151C3238;
  uint64_t v4 = (uint64_t (*)(int *))((char *)&dword_2678653E0 + dword_2678653E0);
  return v4(v2);
}

uint64_t sub_2151CEA98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2151CEAF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2151CEB7C(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v32 = sub_2151F9D58();
  uint64_t v29 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2151F9558();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2151F9638();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2151F9428();
  swift_allocObject();
  sub_2151F9418();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865450);
  uint64_t v10 = sub_2151D02A8(0xD00000000000D366, 0x80000002151FCEF0);
  unint64_t v12 = v11;
  sub_2151D144C();
  sub_2151F9408();
  sub_2151D1594(v10, v12);
  swift_release();
  unint64_t v13 = v33;
  uint64_t v14 = sub_2151CFE30(v28);
  if (*(void *)(v13 + 16) && (unint64_t v16 = sub_2151C73E8(v14, v15), (v17 & 1) != 0))
  {
    uint64_t v18 = *(void *)(*(void *)(v13 + 56) + 8 * v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v33 = 0;
    unint64_t v34 = 0xE000000000000000;
    sub_2151FA038();
    uint64_t v19 = sub_2151F9E28();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    unint64_t v33 = v19;
    unint64_t v34 = v21;
    sub_2151F9E68();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F36B38], v6);
    unint64_t v22 = (void *)sub_2151F9D38();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_willThrow();
    uint64_t v24 = v31;
    uint64_t v23 = v32;
    uint64_t v25 = v30;
    uint64_t v26 = v29;
    sub_2151F9548();
    unint64_t v33 = 0;
    unint64_t v34 = 0xE000000000000000;
    sub_2151FA038();
    swift_bridgeObjectRelease();
    unint64_t v33 = 0xD000000000000023;
    unint64_t v34 = 0x800000021520A260;
    swift_getErrorValue();
    sub_2151FA188();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v26 + 104))(v2, *MEMORY[0x263F36D28], v23);
    sub_2151F9538();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v2, v23);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v24);
    return MEMORY[0x263F8EE78];
  }
  return v18;
}

Swift::String __swiftcall ODIServiceProviderId.toWorkflowID()()
{
  uint64_t v4 = sub_2151F9E28();
  uint64_t v5 = v0;
  swift_bridgeObjectRetain();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v1 = v4;
  uint64_t v2 = v5;
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t sub_2151CF0B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _sSo20ODIServiceProviderIda7CoreODIE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> static ODIServiceProviderId.workflowIdFromServiceProviderId(_:)()
{
}

uint64_t sub_2151CF13C()
{
  uint64_t result = sub_2151F9DF8();
  qword_267866968 = result;
  return result;
}

uint64_t sub_2151CF174(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865128, (uint64_t)&qword_267866988);
}

uint64_t sub_2151CF198(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865130, (uint64_t)&qword_267866990);
}

uint64_t sub_2151CF1BC(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865120, (uint64_t)&qword_267866980);
}

uint64_t sub_2151CF1E0(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865138, (uint64_t)&qword_267866998);
}

uint64_t sub_2151CF204(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865148, (uint64_t)&qword_2678669A8);
}

uint64_t sub_2151CF228(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865140, (uint64_t)&qword_2678669A0);
}

uint64_t sub_2151CF24C(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865158, (uint64_t)&qword_2678669B8);
}

uint64_t sub_2151CF270(uint64_t a1)
{
  return sub_2151CF294(a1, &qword_267865150, (uint64_t)&qword_2678669B0);
}

uint64_t sub_2151CF294(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)(*(void *)a3 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_2151F9E28();
  uint64_t v7 = v6;
  if (v5 == sub_2151F9E28() && v7 == v8) {
    goto LABEL_16;
  }
  char v10 = sub_2151FA148();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_9:
    uint64_t v11 = 1;
LABEL_17:
    swift_bridgeObjectRelease_n();
    return v11;
  }
  if (v4 == 1)
  {
LABEL_12:
    uint64_t v11 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = sub_2151F9E28();
  uint64_t v14 = v13;
  if (v12 == sub_2151F9E28() && v14 == v15)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
LABEL_16:
    uint64_t v11 = 1;
    goto LABEL_17;
  }
  char v17 = sub_2151FA148();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_9;
  }
  if (v4 == 2) {
    goto LABEL_12;
  }
  uint64_t v18 = 6;
  while (1)
  {
    uint64_t v19 = v18 - 3;
    if (__OFADD__(v18 - 4, 1)) {
      break;
    }
    uint64_t v20 = sub_2151F9E28();
    uint64_t v22 = v21;
    if (v20 == sub_2151F9E28() && v22 == v23) {
      goto LABEL_15;
    }
    char v25 = sub_2151FA148();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v25) {
      goto LABEL_9;
    }
    ++v18;
    if (v19 == v4) {
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2151CF484(uint64_t a1)
{
  uint64_t v2 = sub_2151F9D58();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = sub_2151F9558();
  MEMORY[0x270FA5388](v3);
  if (sub_2151CF294(a1, &qword_267865140, (uint64_t)&qword_2678669A0))
  {
    unint64_t v4 = 0xD000000000000775;
    uint64_t v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"icloud_dsid\",\n"
         "    \"fieldName\": \"aa_personID\",\n"
         "    \"source\": \"Accounts\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"itunes_dsid\",\n"
         "    \"fieldName\": \"normalizedDSID\",\n"
         "    \"source\": \"Accounts\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"software_version\",\n"
         "    \"fieldName\": \"BuildVersion\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"ECID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"os_version_baa_cert\",\n"
         "    \"fieldName\": \"osVersion\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_ecid\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"time_zone\",\n"
         "    \"fieldName\": \"identifier\",\n"
         "    \"source\": \"TimeZone\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  }\n"
         "]";
LABEL_9:
    unint64_t v11 = (unint64_t)(v5 - 32) | 0x8000000000000000;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2151FB1E0;
  *(void *)(inited + 32) = @"com.apple.bko.application_create";
  *(void *)(inited + 40) = @"com.apple.bko.application_submit";
  *(void *)(inited + 48) = @"com.apple.bko.id_update";
  uint64_t v7 = @"com.apple.bko.application_create";
  uint64_t v8 = @"com.apple.bko.application_submit";
  uint64_t v9 = @"com.apple.bko.id_update";
  char v10 = sub_2151D1B8C(a1, inited);
  swift_setDeallocating();
  type metadata accessor for ODIServiceProviderId(0);
  swift_arrayDestroy();
  if (v10)
  {
    unint64_t v4 = 0xD000000000000915;
    uint64_t v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"software_version\",\n"
         "    \"fieldName\": \"BuildVersion\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 3\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"os_version_baa_cert\",\n"
         "    \"fieldName\": \"osVersion\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 3,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_ecid\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"phone_number_device\",\n"
         "    \"fieldName\": \"number\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"pac_data_list\",\n"
         "    \"fieldName\": \"serverVerifiableEncoding\",\n"
         "    \"source\": \"IDS\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"iccid\",\n"
         "    \"fieldName\": \"SIMIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"imsi\",\n"
         "    \"fieldName\": \"MobileSubscriberIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location\",\n"
         "    \"fieldName\": \"location\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location_enabled\",\n"
         "    \"fieldName\": \"locationServicesEnabled\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"screen_share_status\",\n"
         "    \"fieldName\": \"isSharingScreen\",\n"
         "    \"source\": \"TelephonyUtilities\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"time_zone\",\n"
         "    \"fieldName\": \"identifier\",\n"
         "    \"source\": \"TimeZone\",\n"
         "    \"priority\": 2\n"
         "  }\n"
         "]";
    goto LABEL_9;
  }
  if (sub_2151CF294(a1, &qword_267865120, (uint64_t)&qword_267866980))
  {
    unint64_t v4 = 0xD00000000000080ELL;
    uint64_t v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"software_version\",\n"
         "    \"fieldName\": \"BuildVersion\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 3\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"os_version_baa_cert\",\n"
         "    \"fieldName\": \"osVersion\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 3,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_ecid\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"phone_number_device\",\n"
         "    \"fieldName\": \"number\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"pac_data_list\",\n"
         "    \"fieldName\": \"serverVerifiableEncoding\",\n"
         "    \"source\": \"IDS\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"iccid\",\n"
         "    \"fieldName\": \"SIMIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"imsi\",\n"
         "    \"fieldName\": \"MobileSubscriberIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"screen_share_status\",\n"
         "    \"fieldName\": \"isSharingScreen\",\n"
         "    \"source\": \"TelephonyUtilities\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"time_zone\",\n"
         "    \"fieldName\": \"identifier\",\n"
         "    \"source\": \"TimeZone\",\n"
         "    \"priority\": 2\n"
         "  }\n"
         "]";
    goto LABEL_9;
  }
  if (sub_2151CF294(a1, &qword_267865148, (uint64_t)&qword_2678669A8))
  {
    unint64_t v4 = 0xD000000000000628;
    uint64_t v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"ECID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"phone_number_device\",\n"
         "    \"fieldName\": \"number\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"iccid\",\n"
         "    \"fieldName\": \"SIMIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location\",\n"
         "    \"fieldName\": \"location\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location_enabled\",\n"
         "    \"fieldName\": \"locationServicesEnabled\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  }\n"
         "]";
    goto LABEL_9;
  }
  unint64_t v4 = 0xD0000000000003D0;
  uint64_t v16 = sub_2151F9E28();
  uint64_t v18 = v17;
  unint64_t v11 = 0x800000021520ADB0;
  if (v16 == sub_2151F9E28() && v18 == v19) {
    goto LABEL_14;
  }
  char v20 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_10;
  }
  uint64_t v21 = sub_2151F9E28();
  uint64_t v23 = v22;
  unint64_t v11 = 0x800000021520ADB0;
  if (v21 == sub_2151F9E28() && v23 == v24) {
    goto LABEL_14;
  }
  char v25 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_10;
  }
  uint64_t v26 = sub_2151F9E28();
  uint64_t v28 = v27;
  unint64_t v11 = 0x800000021520ADB0;
  if (v26 == sub_2151F9E28() && v28 == v29) {
    goto LABEL_14;
  }
  char v30 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_10;
  }
  uint64_t v31 = sub_2151F9E28();
  uint64_t v33 = v32;
  unint64_t v11 = 0x800000021520ADB0;
  if (v31 == sub_2151F9E28() && v33 == v34) {
    goto LABEL_14;
  }
  char v35 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_10;
  }
  uint64_t v36 = sub_2151F9E28();
  uint64_t v38 = v37;
  unint64_t v11 = 0x800000021520ADB0;
  if (v36 == sub_2151F9E28() && v38 == v39) {
    goto LABEL_14;
  }
  char v40 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v40) {
    goto LABEL_10;
  }
  uint64_t v41 = sub_2151F9E28();
  uint64_t v43 = v42;
  unint64_t v11 = 0x800000021520ADB0;
  if (v41 == sub_2151F9E28() && v43 == v44) {
    goto LABEL_14;
  }
  char v45 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v45) {
    goto LABEL_10;
  }
  uint64_t v46 = sub_2151F9E28();
  uint64_t v48 = v47;
  unint64_t v11 = 0x800000021520ADB0;
  if (v46 == sub_2151F9E28() && v48 == v49) {
    goto LABEL_14;
  }
  char v50 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v50) {
    goto LABEL_10;
  }
  uint64_t v51 = sub_2151F9E28();
  uint64_t v53 = v52;
  unint64_t v11 = 0x800000021520ADB0;
  if (v51 == sub_2151F9E28() && v53 == v54) {
    goto LABEL_14;
  }
  char v55 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v55) {
    goto LABEL_10;
  }
  uint64_t v56 = sub_2151F9E28();
  uint64_t v58 = v57;
  unint64_t v11 = 0x800000021520ADB0;
  if (v56 == sub_2151F9E28() && v58 == v59) {
    goto LABEL_14;
  }
  char v60 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v60) {
    goto LABEL_10;
  }
  uint64_t v61 = sub_2151F9E28();
  uint64_t v63 = v62;
  unint64_t v11 = 0x800000021520ADB0;
  if (v61 == sub_2151F9E28() && v63 == v64) {
    goto LABEL_14;
  }
  char v65 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v65) {
    goto LABEL_10;
  }
  uint64_t v66 = sub_2151F9E28();
  uint64_t v68 = v67;
  unint64_t v4 = 0xD00000000000072BLL;
  unint64_t v11 = 0x800000021520A680;
  if (v66 == sub_2151F9E28() && v68 == v69) {
    goto LABEL_14;
  }
  char v70 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v70) {
    goto LABEL_10;
  }
  uint64_t v71 = sub_2151F9E28();
  uint64_t v73 = v72;
  unint64_t v4 = 0xD0000000000002DBLL;
  unint64_t v11 = 0x800000021520A3A0;
  if (v71 == sub_2151F9E28() && v73 == v74)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v75 = sub_2151FA148();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v75 & 1) == 0) {
      return MEMORY[0x263F8EE78];
    }
  }
LABEL_10:
  sub_2151F9428();
  swift_allocObject();
  sub_2151F9418();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865468);
  uint64_t v12 = sub_2151D02A8(v4, v11);
  unint64_t v14 = v13;
  sub_2151D14C8();
  sub_2151F9408();
  sub_2151D1594(v12, v14);
  swift_release();
  return v76;
}

uint64_t sub_2151CFE30(uint64_t a1)
{
  unint64_t v2 = 0xD000000000000010;
  if (sub_2151CF294(a1, &qword_267865120, (uint64_t)&qword_267866980))
  {
    uint64_t v3 = sub_2151F9E28();
    uint64_t v5 = v4;
    if (v3 == sub_2151F9E28() && v5 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v8 = sub_2151FA148();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        return 0xD000000000000011;
      }
    }
  }
  if ((sub_2151CF294(a1, &qword_267865138, (uint64_t)&qword_267866998) & 1) == 0)
  {
    sub_2151CF294(a1, &qword_267865150, (uint64_t)&qword_2678669B0);
    return sub_2151F9E28();
  }
  return v2;
}

uint64_t sub_2151CFF9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (sub_2151CF294(a1, &qword_267865128, (uint64_t)&qword_267866988))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36BA0];
    goto LABEL_20;
  }
  if (sub_2151CF294(a1, &qword_267865130, (uint64_t)&qword_267866990))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36BB8];
    goto LABEL_20;
  }
  if (sub_2151CF294(a1, &qword_267865138, (uint64_t)&qword_267866998))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36BC0];
    goto LABEL_20;
  }
  if (sub_2151CF294(a1, &qword_267865140, (uint64_t)&qword_2678669A0))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36BD0];
    goto LABEL_20;
  }
  if (sub_2151CF294(a1, &qword_267865148, (uint64_t)&qword_2678669A8))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36BA8];
    goto LABEL_20;
  }
  if (sub_2151CF294(a1, &qword_267865150, (uint64_t)&qword_2678669B0))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36BB0];
    goto LABEL_20;
  }
  if (sub_2151CF294(a1, &qword_267865158, (uint64_t)&qword_2678669B8))
  {
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36B88];
    goto LABEL_20;
  }
  uint64_t v5 = sub_2151F9E28();
  uint64_t v7 = v6;
  if (v5 == sub_2151F9E28() && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
LABEL_19:
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36B98];
    goto LABEL_20;
  }
  char v9 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_19;
  }
  uint64_t v14 = sub_2151F9E28();
  uint64_t v16 = v15;
  if (v14 == sub_2151F9E28() && v16 == v17)
  {
    swift_bridgeObjectRelease_n();
LABEL_27:
    uint64_t v4 = (unsigned int *)MEMORY[0x263F36B90];
    goto LABEL_20;
  }
  char v18 = sub_2151FA148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_27;
  }
  uint64_t v4 = (unsigned int *)MEMORY[0x263F36BC8];
LABEL_20:
  uint64_t v10 = *v4;
  uint64_t v11 = sub_2151F9788();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104);
  return v12(a2, v10, v11);
}

uint64_t sub_2151D02A8(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865478);
  if (swift_dynamicCast())
  {
    sub_2151CE5D0(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_2151F94A8();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_2151D15EC((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_2151FA058();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_2151D0F3C(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_2151F9E78();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_2151D0FA0(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_2151D07D0((void *(*)(uint64_t *__return_ptr, char *, char *))sub_2151D164C);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_2151F94E8();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_2151D0C70(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_2151F9EA8();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_2151FA058();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_2151D0C70(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_2151F9E88();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_2151F94F8();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_2151F94F8();
    sub_2151D16B8(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_2151D16B8((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

char *sub_2151D07D0(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_2151FB1F0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_2151F9458() && __OFSUB__((int)v4, sub_2151F9488())) {
        goto LABEL_24;
      }
      sub_2151F9498();
      swift_allocObject();
      uint64_t v13 = sub_2151F9438();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_2151D0BBC((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_2151F94C8();
      uint64_t result = sub_2151D0BBC(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_2151D0AD4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_2151D0D78(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_2151D0E3C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_2151D0EB8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_2151D0B4C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_2151D0BBC(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_2151F9458();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_2151F9488();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_2151F9478();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_2151D0C70(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2151F9EB8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x2166B4D10](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2151D0CEC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2151FA048();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
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

uint64_t sub_2151D0D78(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_2151D0E3C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2151F9498();
  swift_allocObject();
  uint64_t result = sub_2151F9448();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2151F94D8();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2151D0EB8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2151F9498();
  swift_allocObject();
  uint64_t result = sub_2151F9448();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_2151D0F3C(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_2151D0D78(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_2151D0E3C((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_2151D0EB8((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_2151D0FA0(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_2151F9498();
      swift_allocObject();
      sub_2151F9468();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2151F94D8();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t _sSo20ODIServiceProviderIda7CoreODIE8allCasesSayABGvgZ_0()
{
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (qword_267865120 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v0);
  if (qword_267865128 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v1);
  if (qword_267865158 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v2);
  if (qword_267865130 != -1) {
    swift_once();
  }
  char v3 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v3);
  if (qword_267865138 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v4);
  if (qword_267865148 != -1) {
    swift_once();
  }
  char v5 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v5);
  if (qword_267865178 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v6);
  if (qword_267865170 != -1) {
    swift_once();
  }
  unint64_t v7 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v7);
  if (qword_267865150 != -1) {
    swift_once();
  }
  unint64_t v8 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v8);
  if (qword_267865140 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v9);
  if (qword_267865160 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v10);
  if (qword_267865168 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)swift_bridgeObjectRetain();
  sub_2151D1A94(v11);
  return v13;
}

unint64_t sub_2151D13A8()
{
  unint64_t result = qword_267865440;
  if (!qword_267865440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267865448);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865440);
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

unint64_t sub_2151D144C()
{
  unint64_t result = qword_267865458;
  if (!qword_267865458)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267865450);
    sub_2151D14C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865458);
  }
  return result;
}

unint64_t sub_2151D14C8()
{
  unint64_t result = qword_267865460;
  if (!qword_267865460)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267865468);
    sub_2151D153C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865460);
  }
  return result;
}

unint64_t sub_2151D153C()
{
  unint64_t result = qword_267865470;
  if (!qword_267865470)
  {
    sub_2151F97E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865470);
  }
  return result;
}

uint64_t sub_2151D1594(uint64_t a1, unint64_t a2)
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

uint64_t sub_2151D15EC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865480);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_2151D164C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_2151D0B4C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_2151D16CC, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_2151D16B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2151D1594(a1, a2);
  }
  return a1;
}

uint64_t sub_2151D16CC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2151D0CEC(a1, a2);
}

uint64_t sub_2151D16EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2151F9F18();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2151F9F08();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2151CEA98(a1, &qword_2678652A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2151F9EE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2151D1898@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F36D28];
  uint64_t v3 = sub_2151F9D58();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_2151D190C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2151F9F18();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2151F9F08();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2151CEA98(a1, &qword_2678652A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2151F9EE8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void *sub_2151D1A94(void *result)
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
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = sub_2151C70F4(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  type metadata accessor for ODIServiceProviderId(0);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_2151D1B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2151F9E28();
  uint64_t v5 = v4;
  if (v3 == sub_2151F9E28() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_2151FA148();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_2151F9E28();
    uint64_t v14 = v13;
    if (v12 == sub_2151F9E28() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_2151FA148();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2151D1CE4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

id sub_2151D1D48(uint64_t a1)
{
  return sub_2151D1F1C(a1, (void **)ODIServiceProviderIdApplicationCreate, (id *)ODIServiceProviderIdApplicationSubmit, &qword_267866970);
}

__CFString *sub_2151D1D64()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB240;
  *(void *)(v0 + 32) = @"com.apple.bko.ach_ingest";
  *(void *)(v0 + 40) = @"com.apple.bko.repayment";
  *(void *)(v0 + 48) = @"com.apple.bko.repayment_change";
  *(void *)(v0 + 56) = @"com.apple.bko.installment_repayment_change";
  *(void *)(v0 + 64) = @"com.apple.bko.installment_request_auth";
  *(void *)(v0 + 72) = @"com.apple.bko.id_update";
  qword_267866978 = v0;
  uint64_t v1 = @"com.apple.bko.ach_ingest";
  uint64_t v2 = @"com.apple.bko.repayment";
  uint64_t v3 = @"com.apple.bko.repayment_change";
  uint64_t v4 = @"com.apple.bko.installment_repayment_change";
  BOOL v5 = @"com.apple.bko.installment_request_auth";
  return @"com.apple.bko.id_update";
}

void *sub_2151D1E3C()
{
  if (qword_267865110 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_267866970;
  if (qword_267865118 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)swift_bridgeObjectRetain();
  uint64_t result = sub_2151D1A94(v1);
  qword_267866980 = v0;
  return result;
}

id sub_2151D1F00(uint64_t a1)
{
  return sub_2151D1F1C(a1, (void **)ODIServiceProviderIdEnhancedFraudProtection, (id *)ODIServiceProviderIdEnhancedFraudProtectionTopup, &qword_267866988);
}

id sub_2151D1F1C(uint64_t a1, void **a2, id *a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2151FB250;
  char v8 = *a2;
  id v12 = *a3;
  id v9 = *a3;
  *(void *)(v7 + 32) = *a2;
  *(void *)(v7 + 40) = v9;
  *a4 = v7;
  id v10 = v8;
  return v12;
}

__CFString *sub_2151D1FA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB260;
  *(void *)(v0 + 32) = @"com.apple.cash.topup";
  *(void *)(v0 + 40) = @"com.apple.cash.cip";
  *(void *)(v0 + 48) = @"com.apple.cash.ach";
  *(void *)(v0 + 56) = @"com.apple.cash.p2p";
  *(void *)(v0 + 64) = @"com.apple.cash.p2p.proximity";
  qword_267866990 = v0;
  uint64_t v1 = @"com.apple.cash.topup";
  uint64_t v2 = @"com.apple.cash.cip";
  uint64_t v3 = @"com.apple.cash.ach";
  uint64_t v4 = @"com.apple.cash.p2p";
  return @"com.apple.cash.p2p.proximity";
}

__CFString *sub_2151D206C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB270;
  *(void *)(v0 + 32) = @"com.apple.saving.add";
  *(void *)(v0 + 40) = @"com.apple.saving.others";
  *(void *)(v0 + 48) = @"com.apple.saving.fromcash";
  *(void *)(v0 + 56) = @"com.apple.saving.setting";
  *(void *)(v0 + 64) = @"com.apple.saving.onboard";
  *(void *)(v0 + 72) = @"com.apple.saving.firstaccess";
  *(void *)(v0 + 80) = @"com.apple.saving.frombank";
  *(void *)(v0 + 88) = @"com.apple.saving.fromsplit";
  *(void *)(v0 + 96) = @"com.apple.saving.tocash";
  *(void *)(v0 + 104) = @"com.apple.saving.tobank";
  qword_267866998 = v0;
  uint64_t v1 = @"com.apple.saving.add";
  uint64_t v2 = @"com.apple.saving.others";
  uint64_t v3 = @"com.apple.saving.fromcash";
  uint64_t v4 = @"com.apple.saving.setting";
  BOOL v5 = @"com.apple.saving.onboard";
  BOOL v6 = @"com.apple.saving.firstaccess";
  uint64_t v7 = @"com.apple.saving.frombank";
  char v8 = @"com.apple.saving.fromsplit";
  id v9 = @"com.apple.saving.tocash";
  return @"com.apple.saving.tobank";
}

uint64_t sub_2151D219C(uint64_t a1)
{
  return sub_2151D25F8(a1, ODIServiceProviderIdAppleCare, &qword_2678669A0);
}

__CFString *sub_2151D21B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB1E0;
  *(void *)(v0 + 32) = @"com.apple.bc.consent";
  *(void *)(v0 + 40) = @"com.apple.bc.validation";
  *(void *)(v0 + 48) = @"com.apple.bc.validation.bgRelinking";
  qword_2678669A8 = v0;
  uint64_t v1 = @"com.apple.bc.consent";
  uint64_t v2 = @"com.apple.bc.validation";
  return @"com.apple.bc.validation.bgRelinking";
}

__CFString *sub_2151D224C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB250;
  if (qword_267865108 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_267866968;
  *(void *)(v0 + 32) = qword_267866968;
  *(void *)(v0 + 40) = @"com.apple.amp.paidBuy";
  qword_2678669B0 = v0;
  id v2 = v1;
  return @"com.apple.amp.paidBuy";
}

__CFString *sub_2151D2304()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB280;
  *(void *)(v0 + 32) = @"com.apple.apc.provision.supereasy";
  *(void *)(v0 + 40) = @"com.apple.apc.provision.easy";
  *(void *)(v0 + 48) = @"com.apple.apc.provision.manual";
  *(void *)(v0 + 56) = @"com.apple.apc.provision.inapp";
  *(void *)(v0 + 64) = @"com.apple.apc.provision.transit";
  *(void *)(v0 + 72) = @"com.apple.apc.provision.access";
  *(void *)(v0 + 80) = @"com.apple.apc.provision.identity";
  *(void *)(v0 + 88) = @"com.apple.apc.provision.mdp";
  *(void *)(v0 + 96) = @"com.apple.apc.provision.cash";
  *(void *)(v0 + 104) = @"com.apple.apc.provision.bw";
  *(void *)(v0 + 112) = @"com.apple.apc.provision.tap";
  *(void *)(v0 + 120) = @"com.apple.apc.provision.other";
  qword_2678669B8 = v0;
  uint64_t v1 = @"com.apple.apc.provision.supereasy";
  id v2 = @"com.apple.apc.provision.easy";
  uint64_t v3 = @"com.apple.apc.provision.manual";
  uint64_t v4 = @"com.apple.apc.provision.inapp";
  BOOL v5 = @"com.apple.apc.provision.transit";
  BOOL v6 = @"com.apple.apc.provision.access";
  uint64_t v7 = @"com.apple.apc.provision.identity";
  char v8 = @"com.apple.apc.provision.mdp";
  id v9 = @"com.apple.apc.provision.cash";
  id v10 = @"com.apple.apc.provision.bw";
  uint64_t v11 = @"com.apple.apc.provision.tap";
  return @"com.apple.apc.provision.other";
}

uint64_t sub_2151D2460(uint64_t a1)
{
  return sub_2151D25F8(a1, ODIServiceProviderIdTDMTrustedInference, &qword_2678669C0);
}

__CFString *sub_2151D2474()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2151FB280;
  *(void *)(v0 + 32) = @"com.apple.authkit.sign_in";
  *(void *)(v0 + 40) = @"com.apple.authkit.trusted_phone_number_change";
  *(void *)(v0 + 48) = @"com.apple.authkit.trusted_device_change";
  *(void *)(v0 + 56) = @"com.apple.authkit.password_change";
  *(void *)(v0 + 64) = @"com.apple.authkit.apple_id_change";
  *(void *)(v0 + 72) = @"com.apple.authkit.liveness";
  *(void *)(v0 + 80) = @"com.apple.authkit.recovery";
  *(void *)(v0 + 88) = @"com.apple.authkit.security_key_change";
  *(void *)(v0 + 96) = @"com.apple.authkit.recovery_key_change";
  *(void *)(v0 + 104) = @"com.apple.authkit.adp_change";
  *(void *)(v0 + 112) = @"com.apple.authkit.account_creation";
  *(void *)(v0 + 120) = @"com.apple.authkit.hsa2upgrade";
  qword_2678669C8 = v0;
  uint64_t v1 = @"com.apple.authkit.sign_in";
  id v2 = @"com.apple.authkit.trusted_phone_number_change";
  uint64_t v3 = @"com.apple.authkit.trusted_device_change";
  uint64_t v4 = @"com.apple.authkit.password_change";
  BOOL v5 = @"com.apple.authkit.apple_id_change";
  BOOL v6 = @"com.apple.authkit.liveness";
  uint64_t v7 = @"com.apple.authkit.recovery";
  char v8 = @"com.apple.authkit.security_key_change";
  id v9 = @"com.apple.authkit.recovery_key_change";
  id v10 = @"com.apple.authkit.adp_change";
  uint64_t v11 = @"com.apple.authkit.account_creation";
  return @"com.apple.authkit.hsa2upgrade";
}

uint64_t sub_2151D25D0(uint64_t a1)
{
  return sub_2151D25F8(a1, ODIServiceProviderIdPaymentOffersAcquisition, &qword_2678669D0);
}

uint64_t sub_2151D25E4(uint64_t a1)
{
  return sub_2151D25F8(a1, ODIServiceProviderIdAccessTransfer, &qword_2678669D8);
}

uint64_t sub_2151D25F8(uint64_t a1, void *a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2151FB290;
  *(void *)(v5 + 32) = *a2;
  *a3 = v5;
  return MEMORY[0x270F9A8A0]();
}

uint64_t (*sub_2151D265C())()
{
  return j__swift_endAccess;
}

void *sub_2151D26B8()
{
  uint64_t v1 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager;
  if (*(void *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager))
  {
    id v2 = *(void **)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager);
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID);
    sub_2151CC6F4(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)v13);
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundle);
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundleIdentifier);
    uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundleIdentifier + 8);
    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier);
    uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier + 8);
    type metadata accessor for ODIBindingsManager();
    id v9 = (void *)swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    id v10 = v3;
    id v11 = v4;
    id v2 = sub_2151ED1B0(v10, (uint64_t)v13, v4, v5, v6, v7, v8, v0, v9);

    swift_release();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_2151D2800()
{
  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  v1[5] = swift_task_alloc();
  uint64_t v2 = sub_2151F9D58();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_2151F9808();
  v1[9] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[10] = v4;
  v1[11] = *(void *)(v4 + 64);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D2964, v0, 0);
}

uint64_t sub_2151D2964()
{
  v0[14] = *(void *)(v0[4] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = v1;
  void *v1 = v0;
  v1[1] = sub_2151D2A1C;
  uint64_t v2 = v0[13];
  return sub_2151F11A4(v2, 1);
}

uint64_t sub_2151D2A1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151D2B50, v2, 0);
}

uint64_t sub_2151D2B50()
{
  uint64_t v1 = v0[13];
  uint64_t v16 = v0[12];
  uint64_t v2 = v0[10];
  uint64_t v4 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v19 = v0[16];
  uint64_t v20 = v0[5];
  uint64_t v17 = v0[11];
  uint64_t v18 = v0[4];
  __swift_project_boxed_opaque_existential_1((void *)(v18 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v18 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  sub_2151FA038();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  sub_2151F9E68();
  sub_2151FA0B8();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F36CE8], v6);
  sub_2151F9C58();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v7 = sub_2151F9F18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v20, 1, 1, v7);
  uint64_t v8 = v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v16, v1, v3);
  uint64_t v9 = sub_2151EE4C4(&qword_267865340, (void (*)(uint64_t))type metadata accessor for ODISessionInternal);
  unint64_t v10 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v11 = (v17 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v18;
  *(void *)(v12 + 24) = v9;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v12 + v10, v16, v8);
  *(void *)(v12 + v11) = v18;
  *(void *)(v12 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8)) = v19;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_2151D16EC(v20, (uint64_t)&unk_267865758, v12);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v14 = v0[16];
  return v13(v14);
}

uint64_t sub_2151D2E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  uint64_t v8 = sub_2151F9D58();
  v6[5] = v8;
  v6[6] = *(void *)(v8 - 8);
  v6[7] = swift_task_alloc();
  uint64_t v9 = sub_2151F9808();
  v6[8] = v9;
  v6[9] = *(void *)(v9 - 8);
  v6[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D2F90, a5, 0);
}

uint64_t sub_2151D2F90()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[2], v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F36C00])
  {
    uint64_t v6 = v0[6];
    uint64_t v5 = v0[7];
    uint64_t v8 = v0[4];
    uint64_t v7 = v0[5];
    uint64_t v9 = v0[3];
    __swift_project_boxed_opaque_existential_1((void *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    sub_2151FA038();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_2151F97E8();
    MEMORY[0x2166B4D50](v8, v10);
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F36CE8], v7);
    sub_2151F9C58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v11 = *(void *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    v0[11] = v11;
    uint64_t v12 = sub_2151D33BC;
LABEL_5:
    return MEMORY[0x270FA2498](v12, v11, 0);
  }
  if (v4 == *MEMORY[0x263F36BF8])
  {
    uint64_t v14 = v0[6];
    uint64_t v13 = v0[7];
    uint64_t v16 = v0[4];
    uint64_t v15 = v0[5];
    uint64_t v17 = v0[3];
    __swift_project_boxed_opaque_existential_1((void *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    sub_2151FA038();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_2151F97E8();
    MEMORY[0x2166B4D50](v16, v18);
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, *MEMORY[0x263F36CE8], v15);
    sub_2151F9C58();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    uint64_t v11 = *(void *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    v0[12] = v11;
    uint64_t v12 = sub_2151D345C;
    goto LABEL_5;
  }
  if (v4 == *MEMORY[0x263F36C08])
  {
    uint64_t v20 = v0[6];
    uint64_t v19 = v0[7];
    uint64_t v21 = v0[5];
    __swift_project_boxed_opaque_existential_1((void *)(v0[3] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[3] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v19, *MEMORY[0x263F36CE8], v21);
    sub_2151F9C58();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = (uint64_t (*)(void))v0[1];
    return v22();
  }
  else
  {
    uint64_t v23 = v0[8];
    return MEMORY[0x270F9F7C8](v23, v23);
  }
}

uint64_t sub_2151D33BC()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 24);
  unsigned int v3 = *(unsigned __int8 *)(v1 + 112);
  if (v3 <= 2) {
    LOBYTE(v3) = 2;
  }
  *(unsigned char *)(v1 + 112) = v3;
  return MEMORY[0x270FA2498](sub_2151D33F0, v2, 0);
}

uint64_t sub_2151D33F0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151D345C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 24);
  unsigned int v3 = *(unsigned __int8 *)(v1 + 112);
  if (v3 <= 1) {
    LOBYTE(v3) = 1;
  }
  *(unsigned char *)(v1 + 112) = v3;
  return MEMORY[0x270FA2498](sub_2151EF8F4, v2, 0);
}

uint64_t sub_2151D3568()
{
  return 0;
}

uint64_t sub_2151D3610()
{
  v1[7] = v0;
  uint64_t v2 = sub_2151F9D58();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_2151F9C18();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  uint64_t v4 = sub_2151F9788();
  v1[14] = v4;
  v1[15] = *(void *)(v4 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D3798, v0, 0);
}

uint64_t sub_2151D3798()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  *(void *)(v0 + 144) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  if (*(void *)(v1 + v2))
  {
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v5 = *(void *)(v0 + 64);
    __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F36D10], v5);
    sub_2151F9C88();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 136);
    uint64_t v10 = *(void *)(v0 + 112);
    uint64_t v11 = *(void *)(v0 + 120);
    sub_2151CFF9C(*(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID), v8);
    uint64_t v12 = sub_2151F9E28();
    uint64_t v14 = v13;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v8, v10);
    unint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__dsidType);
    if (v15 > 3) {
      uint64_t v16 = (unsigned int *)MEMORY[0x263F36C98];
    }
    else {
      uint64_t v16 = (unsigned int *)qword_2642379B8[v15];
    }
    uint64_t v17 = *(void *)(v0 + 56);
    (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 104))(*(void *)(v0 + 104), *v16, *(void *)(v0 + 88));
    sub_2151F9678();
    uint64_t v18 = *(void *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier);
    uint64_t v19 = *(void *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier + 8);
    uint64_t v20 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
    *(void *)(v0 + 152) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
    sub_2151CC6F4(v17 + v20, v0 + 16);
    uint64_t v21 = swift_allocObject();
    sub_2151CE5D0((long long *)(v0 + 16), v21 + 16);
    *(void *)(v21 + 56) = v17;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_2151D3A88;
    uint64_t v23 = *(void *)(v0 + 128);
    uint64_t v24 = *(void *)(v0 + 104);
    return MEMORY[0x270F1B160](v12, v14, v23, v24, v18, v19, &unk_267865730, v21);
  }
}

uint64_t sub_2151D3A88(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151D3BA0, v2, 0);
}

uint64_t sub_2151D3BA0()
{
  uint64_t v18 = v0[18];
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = (void *)(v4 + v0[19]);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  uint64_t v6 = *MEMORY[0x263F36D28];
  uint64_t v7 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v1, v6, v7);
  sub_2151F9CD8();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v1, v3);
  uint64_t v9 = v0[17];
  uint64_t v10 = v0[14];
  uint64_t v11 = v0[15];
  if (*(void *)(v4 + v18))
  {
    uint64_t v12 = v0[9];
    uint64_t v13 = v0[10];
    uint64_t v14 = v0[8];
    uint64_t v17 = v0[14];
    uint64_t v19 = v0[17];
    __swift_project_boxed_opaque_existential_1((void *)(v0[7] + v0[19]), v5[3]);
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v13, *MEMORY[0x263F36D10], v14);
    sub_2151F9C88();
    swift_release();
    v8(v13, v14);
    uint64_t v10 = v17;
    uint64_t v9 = v19;
  }
  else
  {
    *(void *)(v0[7] + v0[18]) = v0[21];
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_2151D3DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_2151F9D58();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D3EB8, 0, 0);
}

uint64_t sub_2151D3EB8()
{
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
  *(_DWORD *)(v0 + 296) = *MEMORY[0x263F36CE8];
  uint64_t v4 = *(void (**)(uint64_t))(v2 + 104);
  *(void *)(v0 + 120) = v4;
  *(void *)(v0 + 128) = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v4(v1);
  sub_2151F9C68();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 136) = v5;
  *(void *)(v0 + 144) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  char v6 = sub_2151F99F8();
  if (v6 == 2 || (v6 & 1) != 0)
  {
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 88);
    uint64_t v9 = sub_2151F9F18();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v7;
    swift_retain();
    sub_2151D16EC(v8, (uint64_t)&unk_267865740, (uint64_t)v10);
    swift_release();
  }
  uint64_t v11 = sub_2151F99E8();
  *(void *)(v0 + 152) = v11;
  if (v11)
  {
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t v13 = sub_2151D42B8;
LABEL_6:
    uint64_t v14 = v13;
    goto LABEL_9;
  }
  uint64_t v15 = sub_2151F9A08();
  *(void *)(v0 + 192) = v15;
  uint64_t v16 = *(void *)(v0 + 112);
  uint64_t v17 = *(void *)(v0 + 96);
  if (!v15)
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
    uint64_t v21 = *MEMORY[0x263F36D28];
    uint64_t v22 = sub_2151F9D58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v16, v21, v22);
    sub_2151F9CC8();
    v20(v16, v17);
    uint64_t v23 = sub_2151F9A18();
    char v25 = v24;
    uint64_t v12 = *(void *)(v0 + 80);
    if (v25)
    {
      *(void *)(v0 + 240) = v12;
      uint64_t v12 = *(void *)(v12 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      *(void *)(v0 + 248) = v12;
      uint64_t v13 = sub_2151D4F1C;
    }
    else
    {
      *(void *)(v0 + 232) = v23;
      uint64_t v13 = sub_2151D4D4C;
    }
    goto LABEL_6;
  }
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  uint64_t v28 = *(void *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865468);
  sub_2151F9D98();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v18 = *MEMORY[0x263F36D28];
  uint64_t v19 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v16, v18, v19);
  sub_2151F9CC8();
  swift_bridgeObjectRelease();
  v27(v16, v17);
  uint64_t v14 = sub_2151D48A8;
  uint64_t v12 = v28;
LABEL_9:
  return MEMORY[0x270FA2498](v14, v12, 0);
}

uint64_t sub_2151D42B8()
{
  uint64_t v1 = v0[19];
  v0[20] = *(void *)(v0[10] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[21] = v2;
  void *v2 = v0;
  v2[1] = sub_2151D437C;
  return sub_2151F277C(1, v1);
}

uint64_t sub_2151D437C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 176) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2151D44FC;
  return sub_2151EA898();
}

uint64_t sub_2151D44FC()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2151D5400;
  }
  else {
    uint64_t v2 = sub_2151D4610;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2151D4610()
{
  uint64_t v1 = sub_2151F9A08();
  *(void *)(v0 + 192) = v1;
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);
  if (v1)
  {
    uint64_t v17 = *(void *)(v0 + 80);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
    sub_2151FA038();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865468);
    sub_2151F9D98();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    uint64_t v5 = v2;
    uint64_t v6 = *MEMORY[0x263F36D28];
    uint64_t v7 = sub_2151F9D58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v3, v6, v7);
    sub_2151F9CC8();
    swift_bridgeObjectRelease();
    v5(v3, v4);
    uint64_t v8 = sub_2151D48A8;
    uint64_t v9 = v17;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
    uint64_t v10 = *MEMORY[0x263F36D28];
    uint64_t v11 = sub_2151F9D58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v3, v10, v11);
    sub_2151F9CC8();
    v2(v3, v4);
    uint64_t v12 = sub_2151F9A18();
    char v14 = v13;
    uint64_t v9 = *(void *)(v0 + 80);
    if (v14)
    {
      *(void *)(v0 + 240) = v9;
      uint64_t v9 = *(void *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      *(void *)(v0 + 248) = v9;
      uint64_t v15 = sub_2151D4F1C;
    }
    else
    {
      *(void *)(v0 + 232) = v12;
      uint64_t v15 = sub_2151D4D4C;
    }
    uint64_t v8 = v15;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_2151D48A8()
{
  *(void *)(v0 + 200) = sub_2151D26B8();
  return MEMORY[0x270FA2498](sub_2151D4914, 0, 0);
}

uint64_t sub_2151D4914()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v2;
  void *v2 = v0;
  v2[1] = sub_2151D49B0;
  return sub_2151F277C(0, v1);
}

uint64_t sub_2151D49B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2151D4B00, v1, 0);
}

uint64_t sub_2151D4B00()
{
  *(void *)(v0 + 216) = sub_2151D26B8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v1;
  void *v1 = v0;
  v1[1] = sub_2151D4B9C;
  return sub_2151C1FB8();
}

uint64_t sub_2151D4B9C()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151D4CB4, 0, 0);
}

uint64_t sub_2151D4CB4()
{
  uint64_t v1 = sub_2151F9A18();
  char v3 = v2;
  uint64_t v4 = v0[10];
  if (v3)
  {
    v0[30] = v4;
    uint64_t v4 = *(void *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    v0[31] = v4;
    uint64_t v5 = sub_2151D4F1C;
  }
  else
  {
    v0[29] = v1;
    uint64_t v5 = sub_2151D4D4C;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_2151D4D4C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[17];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[10];
  *(double *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_profileSla) = (double)(uint64_t)v0[29] * 0.001;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  v0[5] = 0;
  v0[6] = 0xE000000000000000;
  sub_2151F9E68();
  sub_2151F9F98();
  uint64_t v5 = *MEMORY[0x263F36D28];
  uint64_t v6 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v2, v5, v6);
  sub_2151F9CD8();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  return MEMORY[0x270FA2498](sub_2151D4EEC, 0, 0);
}

uint64_t sub_2151D4EEC()
{
  uint64_t v1 = v0[10];
  v0[30] = v1;
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[31] = v2;
  return MEMORY[0x270FA2498](sub_2151D4F1C, v2, 0);
}

uint64_t sub_2151D4F1C()
{
  sub_2151F6A08();
  return MEMORY[0x270FA2498](sub_2151D4F84, 0, 0);
}

uint64_t sub_2151D4F84()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  uint64_t v2 = *(void (**)(uint64_t, void, uint64_t))(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
  v2(v3, *MEMORY[0x263F36D20], v4);
  sub_2151F9C58();
  v1(v3, v4);
  uint64_t v5 = *(void *)(v0 + 240);
  return MEMORY[0x270FA2498](sub_2151D5074, v5, 0);
}

uint64_t sub_2151D5074()
{
  *(void *)(v0 + 256) = sub_2151D26B8();
  return MEMORY[0x270FA2498](sub_2151D50E0, 0, 0);
}

uint64_t sub_2151D50E0()
{
  *(void *)(v0 + 264) = *(void *)(*(void *)(v0 + 256) + 80);
  sub_2151F9858();
  sub_2151EE4C4(&qword_2678652E0, MEMORY[0x263F36C28]);
  uint64_t v2 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151D51A0, v2, v1);
}

uint64_t sub_2151D51A0()
{
  sub_2151F9838();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 240);
  return MEMORY[0x270FA2498](sub_2151D5210, v1, 0);
}

uint64_t sub_2151D5210()
{
  *(void *)(v0 + 272) = sub_2151D26B8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v1;
  void *v1 = v0;
  v1[1] = sub_2151D52B0;
  return sub_2151C5610(1);
}

uint64_t sub_2151D52B0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2151D558C, 0, 0);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2151D5400()
{
  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  uint64_t v2 = *(unsigned int *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  v7(v3, v2, v4);
  sub_2151F9C78();
  swift_bridgeObjectRelease();

  v8(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2151D558C()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  uint64_t v2 = *(unsigned int *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  v7(v3, v2, v4);
  sub_2151F9C78();
  swift_bridgeObjectRelease();

  v8(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2151D5720()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151CEB5C;
  return sub_2151D74E4();
}

char *ODISessionInternal.__allocating_init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(void *a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return ODISessionInternal.init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(a1, a2, a3, a4, a5, a6);
}

char *ODISessionInternal.init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(void *a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v96 = a6;
  id v98 = a3;
  uint64_t v99 = a5;
  uint64_t v92 = a4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v10 - 8);
  v86 = (char *)v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2151F95A8();
  MEMORY[0x270FA5388](v12 - 8);
  v84 = (char *)v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2151F95B8();
  uint64_t v87 = *(void *)(v14 - 8);
  uint64_t v88 = v14;
  MEMORY[0x270FA5388](v14);
  v85 = (char *)v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2151F9618();
  uint64_t v90 = *(void *)(v16 - 8);
  uint64_t v91 = v16;
  MEMORY[0x270FA5388](v16);
  v89 = (char *)v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2151F9D58();
  uint64_t v81 = *(void *)(v18 - 8);
  uint64_t v82 = v18;
  MEMORY[0x270FA5388](v18);
  v80 = (char *)v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v20 = (uint64_t *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback];
  uint64_t v21 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  uint64_t v22 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v95 = v20;
  v22(v20, 1, 1, v21);
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator] = 0;
  uint64_t v23 = &v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId];
  *uint64_t v23 = 0;
  v23[1] = 0;
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager] = 0;
  v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut] = 0;
  id v94 = (id)OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask;
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask] = 0;
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_profileSla] = 0x400B333333333333;
  uint64_t v24 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_authorizedDsidTypes;
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_authorizedDsidTypes] = &unk_26C5DA798;
  uint64_t v25 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_authorizedServices;
  swift_retain();
  uint64_t v26 = _sSo20ODIServiceProviderIda7CoreODIE8allCasesSayABGvgZ_0();
  uint64_t v93 = v25;
  *(void *)&v7[v25] = v26;
  uint64_t v27 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID;
  uint64_t v28 = a1;
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID] = a1;
  uint64_t v29 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__dsidType;
  unint64_t v83 = a2;
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__dsidType] = a2;
  uint64_t v30 = v28;
  swift_bridgeObjectRetain();
  id v97 = (id)v30;
  LOBYTE(v30) = sub_2151D1B8C(v30, v26);
  swift_bridgeObjectRelease();
  if (v30 & 1) != 0 && (sub_2151D1CE4(*(void *)&v7[v29], *(void *)&v7[v24]))
  {
    id v31 = v98;
    uint64_t v32 = v99;
    *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundle] = v98;
    uint64_t v33 = v31;
    uint64_t v34 = &v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundleIdentifier];
    *uint64_t v34 = v92;
    v34[1] = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2678654E8);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_2151FB290;
    swift_bridgeObjectRetain();
    id v94 = v33;
    int v36 = sub_2151ECDE4(0xFFFFFFFFFFFFFFFELL);
    uint64_t v37 = MEMORY[0x263F8DA20];
    *(void *)(v35 + 56) = MEMORY[0x263F8D9D0];
    *(void *)(v35 + 64) = v37;
    *(void *)(v35 + 32) = (v36 + 1);
    uint64_t v38 = sub_2151F9E38();
    uint64_t v39 = (uint64_t *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier];
    v95 = (uint64_t *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier];
    uint64_t *v39 = v38;
    v39[1] = v40;
    uint64_t v104 = sub_2151F9558();
    uint64_t v105 = MEMORY[0x263F36AB0];
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v103);
    swift_bridgeObjectRetain();
    sub_2151F9528();
    uint64_t v41 = (uint64_t)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger];
    sub_2151CE5D0(&v103, (uint64_t)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger]);
    sub_2151CC6F4(v41, (uint64_t)&v103);
    uint64_t v93 = v105;
    v79[1] = __swift_project_boxed_opaque_existential_1(&v103, v104);
    unint64_t v101 = 0;
    unint64_t v102 = 0xE000000000000000;
    sub_2151FA038();
    swift_bridgeObjectRelease();
    unint64_t v101 = 0xD000000000000023;
    unint64_t v102 = 0x800000021520D070;
    sub_2151F9E28();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    uint64_t v43 = v80;
    uint64_t v42 = v81;
    uint64_t v44 = v82;
    (*(void (**)(char *, void, uint64_t))(v81 + 104))(v80, *MEMORY[0x263F36D10], v82);
    sub_2151F9C58();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v103);
    uint64_t v93 = v41;
    sub_2151CC6F4(v41, (uint64_t)&v103);
    __swift_project_boxed_opaque_existential_1(&v103, v104);
    (*(void (**)(char *, void, uint64_t))(v90 + 104))(v89, *MEMORY[0x263F36AE8], v91);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865500);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2151FB260;
    *(void *)(inited + 32) = 0x776F6C666B726F77;
    *(void *)(inited + 40) = 0xEA00000000004449;
    unint64_t v101 = sub_2151F9E28();
    unint64_t v102 = v46;
    swift_bridgeObjectRetain();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    unint64_t v47 = v102;
    *(void *)(inited + 48) = v101;
    *(void *)(inited + 56) = v47;
    strcpy((char *)(inited + 64), "odiSessionID");
    *(unsigned char *)(inited + 77) = 0;
    *(_WORD *)(inited + 78) = -5120;
    uint64_t v48 = v95[1];
    *(void *)(inited + 80) = *v95;
    *(void *)(inited + 88) = v48;
    *(void *)(inited + 96) = 0x6570795464697364;
    *(void *)(inited + 104) = 0xE800000000000000;
    unint64_t v101 = v83;
    swift_bridgeObjectRetain();
    *(void *)(inited + 112) = sub_2151FA108();
    *(void *)(inited + 120) = v49;
    *(void *)(inited + 128) = 0xD000000000000016;
    *(void *)(inited + 136) = 0x800000021520D0A0;
    if (v98)
    {
      id v50 = objc_msgSend(v94, sel_bundlePath);
      uint64_t v51 = sub_2151F9E28();
      uint64_t v53 = v52;
    }
    else
    {
      uint64_t v51 = 0;
      uint64_t v53 = 0;
    }
    *(void *)(inited + 144) = v51;
    *(void *)(inited + 152) = v53;
    *(void *)(inited + 160) = 0xD000000000000018;
    *(void *)(inited + 168) = 0x80000002151FC700;
    uint64_t v55 = v99;
    *(void *)(inited + 176) = v92;
    *(void *)(inited + 184) = v55;
    unint64_t v101 = sub_2151D67B0(inited);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865508);
    sub_2151ED0C8();
    uint64_t v56 = v89;
    sub_2151F9C98();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v90 + 8))(v56, v91);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v103);
    sub_2151F9858();
    uint64_t v57 = v95;
    id v58 = v97;
    *(void *)&long long v103 = sub_2151F9E28();
    *((void *)&v103 + 1) = v59;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller] = sub_2151F9828();
    sub_2151F9AD8();
    char v60 = v85;
    sub_2151F95C8();
    sub_2151CC6F4(v93, (uint64_t)&v103);
    type metadata accessor for ODISessionStateMachine(0);
    swift_allocObject();
    id v61 = v58;
    uint64_t v62 = v96;
    swift_unknownObjectRetain();
    uint64_t v63 = sub_2151F7D54((uint64_t)&v103, v61, v62);
    swift_unknownObjectRelease();

    *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState] = v63;
    uint64_t v64 = *v57;
    uint64_t v65 = v57[1];
    type metadata accessor for ODIFieldsManager();
    swift_allocObject();
    id v66 = v61;
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_2151F52F8(v64, v65, v66);

    *(void *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager] = v67;
    swift_release();
    uint64_t v68 = (objc_class *)type metadata accessor for ODISessionInternal(0);
    v100.receiver = v7;
    v100.super_class = v68;
    id v69 = objc_msgSendSuper2(&v100, sel_init);
    uint64_t v70 = sub_2151F9F18();
    uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56);
    uint64_t v72 = (uint64_t)v86;
    v71(v86, 1, 1, v70);
    uint64_t v73 = (void *)swift_allocObject();
    v73[2] = 0;
    v73[3] = 0;
    v73[4] = v69;
    uint64_t v74 = (char *)v69;
    *(void *)&v74[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask] = sub_2151D190C(v72, (uint64_t)&unk_267865548, (uint64_t)v73);
    swift_release();
    v71((char *)v72, 1, 1, v70);
    char v75 = (void *)swift_allocObject();
    v75[2] = 0;
    v75[3] = 0;
    v75[4] = v74;
    uint64_t v76 = v74;
    sub_2151D16EC(v72, (uint64_t)&unk_267865558, (uint64_t)v75);
    swift_release();
    v71((char *)v72, 1, 1, v70);
    v77 = (void *)swift_allocObject();
    v77[2] = 0;
    v77[3] = 0;
    v77[4] = v76;
    uint64_t v54 = v76;
    sub_2151D190C(v72, (uint64_t)&unk_267865568, (uint64_t)v77);
    swift_release();
    sub_2151F9598();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v60, v88);
  }
  else
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_2151CEA98((uint64_t)v95, &qword_2678654D0);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    type metadata accessor for ODISessionInternal(0);
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v54;
}

uint64_t type metadata accessor for ODISessionInternal.PendingFeedback(uint64_t a1)
{
  return sub_2151ED090(a1, (uint64_t *)&unk_267865648);
}

unint64_t sub_2151D647C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865790);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (unsigned __int8 *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652F8);
  uint64_t v6 = sub_2151FA0E8();
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
    sub_2151EF818(v12, (uint64_t)v5, &qword_267865790);
    unint64_t result = sub_2151C7460(v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for ODIFieldsKey();
    unint64_t result = sub_2151EF87C((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, (uint64_t (*)(void))type metadata accessor for ODIFieldsKey);
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

unint64_t sub_2151D666C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865408);
  uint64_t v2 = sub_2151FA0E8();
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
    sub_2151EF818(v6, (uint64_t)&v15, &qword_267865710);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2151C73E8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_2151CE5D0(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_2151D67B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865798);
  uint64_t v2 = (void *)sub_2151FA0E8();
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
    unint64_t result = sub_2151C73E8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

unint64_t sub_2151D68D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865430);
  uint64_t v2 = sub_2151FA0E8();
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
    sub_2151EF818(v6, (uint64_t)&v13, &qword_267865410);
    uint64_t v7 = v13;
    unint64_t result = sub_2151C75C4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = sub_2151CE5D0(&v14, v3[7] + 40 * result);
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
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

unint64_t sub_2151D6A08(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865698);
  uint64_t v2 = (void *)sub_2151FA0E8();
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
    unint64_t result = sub_2151C73E8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

unint64_t sub_2151D6B2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652D0);
  uint64_t v2 = (void *)sub_2151FA0E8();
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
    unint64_t result = sub_2151C73E8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
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

uint64_t sub_2151D6C48()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C6CFC;
  return sub_2151D3610();
}

uint64_t sub_2151D6CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2151D6CF8, 0, 0);
}

uint64_t sub_2151D6CF8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2151D6D24, v1, 0);
}

uint64_t sub_2151D6D24()
{
  sub_2151F69E8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151D6D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 96) = a4;
  return MEMORY[0x270FA2498](sub_2151D6DA4, a4, 0);
}

uint64_t sub_2151D6DA4()
{
  v0[13] = *(void *)(v0[12] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  void *v1 = v0;
  v1[1] = sub_2151D6E54;
  return sub_2151F1C20(1);
}

uint64_t sub_2151D6E54()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151D6F80, v1, 0);
}

uint64_t sub_2151D6F80()
{
  *(void *)(v0 + 120) = sub_2151D26B8();
  return MEMORY[0x270FA2498](sub_2151D6FEC, 0, 0);
}

uint64_t sub_2151D6FEC()
{
  uint64_t v1 = v0[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865780);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2151FB290;
  *(void *)(inited + 32) = @"debugSessionId";
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier + 8);
  uint64_t v5 = MEMORY[0x263F8D320];
  *(void *)(inited + 64) = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = v4;
  uint64_t v6 = @"debugSessionId";
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_2151D68D4(inited);
  v0[16] = v7;
  id v8 = (void *)swift_task_alloc();
  v0[17] = v8;
  *id v8 = v0;
  v8[1] = sub_2151D7100;
  return sub_2151C4E20(v7);
}

uint64_t sub_2151D7100()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2151D73E0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 96);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = sub_2151D7230;
    uint64_t v4 = v5;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_2151D7230()
{
  *(void *)(v0 + 152) = sub_2151D26B8();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_2151D72CC;
  return sub_2151C3860();
}

uint64_t sub_2151D72CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2151D73E0()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151D74E4()
{
  v1[6] = v0;
  uint64_t v2 = sub_2151F9AC8();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  uint64_t v3 = sub_2151F9BB8();
  v1[10] = v3;
  v1[11] = *(void *)(v3 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v4 = sub_2151F9D58();
  v1[13] = v4;
  v1[14] = *(void *)(v4 - 8);
  v1[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D765C, v0, 0);
}

uint64_t sub_2151D765C()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[6];
  uint64_t v5 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  v0[16] = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + v5), *(void *)(v4 + v5 + 24));
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F36D10], v3);
  sub_2151F9C68();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[17] = v6;
  v0[18] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  sub_2151F9AA8();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[19] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2151D77CC;
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[9];
  return sub_2151DD0AC(v8, v9, 0, 1);
}

uint64_t sub_2151D77CC()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 72);
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0)
  {
    uint64_t v6 = v2[6];
    uint64_t v7 = sub_2151D7A9C;
  }
  else
  {
    uint64_t v8 = v2[6];
    (*(void (**)(void, void))(v2[11] + 8))(v2[12], v2[10]);
    uint64_t v7 = sub_2151D7968;
    uint64_t v6 = v8;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_2151D7968()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[17];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = (void *)(v0[6] + v0[16]);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  uint64_t v5 = *MEMORY[0x263F36D28];
  uint64_t v6 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v2, v5, v6);
  sub_2151F9CD8();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2151D7A9C()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[17];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = (void *)(v0[6] + v0[16]);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2151FA038();
  sub_2151F9E68();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v5 = *MEMORY[0x263F36D28];
  uint64_t v6 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v2, v5, v6);
  sub_2151F9CE8();
  swift_bridgeObjectRelease();

  v9(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2151D7C60(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2151F9D58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v42 = v4;
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2151F95A8();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = sub_2151F95B8();
  uint64_t v41 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2151F9AE8();
  uint64_t v40 = v14;
  sub_2151F95C8();
  uint64_t v15 = sub_2151F9F18();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v10, 1, 1, v15);
  long long v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v2;
  swift_retain();
  sub_2151D16EC((uint64_t)v10, (uint64_t)&unk_267865578, (uint64_t)v17);
  swift_release();
  if (a1)
  {
    uint64_t v18 = sub_2151EF904((void *)(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger));
    if (v18)
    {
      uint64_t v19 = v18;
      if (*(void *)(v18 + 16))
      {
        v16(v10, 1, 1, v15);
        BOOL v20 = (void *)swift_allocObject();
        v20[2] = 0;
        v20[3] = 0;
        v20[4] = v2;
        v20[5] = v19;
        swift_retain();
        sub_2151D190C((uint64_t)v10, (uint64_t)&unk_267865588, (uint64_t)v20);
        swift_release();
        uint64_t v21 = v40;
        goto LABEL_14;
      }
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v35 = v12;
  uint64_t v22 = v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  sub_2151CC6F4(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)v46);
  uint64_t v23 = (void *)v48;
  __swift_project_boxed_opaque_existential_1(v46, v47);
  unint64_t v44 = 0;
  unint64_t v45 = 0xE000000000000000;
  sub_2151FA038();
  swift_bridgeObjectRelease();
  unint64_t v44 = 0xD00000000000002FLL;
  unint64_t v45 = 0x800000021520D0E0;
  uint64_t v39 = v22;
  int v36 = v23;
  if (a1)
  {
    id v24 = objc_msgSend(a1, sel_attributes);
    if (v24)
    {
      uint64_t v25 = v24;
      type metadata accessor for ODIAttributeKey(0);
      sub_2151EE4C4((unint64_t *)&qword_267865260, type metadata accessor for ODIAttributeKey);
      sub_2151F9D88();

      sub_2151F9DB8();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v26 = v42;
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v27 = v43;
  uint64_t v28 = *(void (**)(void))(v43 + 104);
  unsigned int v38 = *MEMORY[0x263F36D28];
  uint64_t v37 = (void (*)(char *, void, uint64_t))v28;
  v28(v7);
  sub_2151F9CF8();
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v43 = v27 + 8;
  v29(v7, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  sub_2151CC6F4(v39, (uint64_t)v46);
  uint64_t v30 = v48;
  id v31 = __swift_project_boxed_opaque_existential_1(v46, v47);
  unint64_t v44 = 0;
  unint64_t v45 = 0xE000000000000000;
  sub_2151FA038();
  swift_bridgeObjectRelease();
  unint64_t v44 = 0xD000000000000026;
  unint64_t v45 = 0x800000021520D110;
  uint64_t v39 = v30;
  int v36 = v31;
  if (a1 && (id v32 = objc_msgSend(a1, sel_attributes)) != 0)
  {
    uint64_t v33 = v32;
    type metadata accessor for ODIAttributeKey(0);
    sub_2151EE4C4((unint64_t *)&qword_267865260, type metadata accessor for ODIAttributeKey);
    sub_2151F9D88();

    sub_2151F9D98();
    uint64_t v26 = v42;
    swift_bridgeObjectRelease();
    uint64_t v12 = v35;
    uint64_t v21 = v40;
  }
  else
  {
    uint64_t v12 = v35;
    uint64_t v21 = v40;
  }
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  v37(v7, v38, v26);
  sub_2151F9D28();
  swift_bridgeObjectRelease();
  v29(v7, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
LABEL_14:
  sub_2151F9598();
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v21, v12);
}

uint64_t sub_2151D8324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v4[3] = swift_task_alloc();
  uint64_t v5 = sub_2151F99D8();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D8410, 0, 0);
}

uint64_t sub_2151D8410()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v0[2] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[7] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 5, v3);
  return MEMORY[0x270FA2498](sub_2151D84C8, v2, 0);
}

uint64_t sub_2151D84C8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[3];
  sub_2151F7448(v4, v1);
  sub_2151EE574(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return MEMORY[0x270FA2498](sub_2151D8584, 0, 0);
}

uint64_t sub_2151D8584()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151D85F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_2151D8610, a4, 0);
}

uint64_t sub_2151D8610()
{
  v0[4] = sub_2151D26B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_2151D86B4;
  uint64_t v2 = v0[3];
  return sub_2151C4E20(v2);
}

uint64_t sub_2151D86B4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2151D87F0, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2151D87F0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151D88B4(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a1;
  uint64_t v14 = sub_2151F9AC8();
  uint64_t v4 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2151F9D58();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F36D18], v7);
  sub_2151F9C58();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2151F9AA8();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v13;
  *(void *)(v11 + 24) = a2;
  swift_retain();
  sub_2151E309C((uint64_t)v6, (uint64_t)sub_2151ED844, v11);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v14);
}

void sub_2151D8D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = (void *)sub_2151F9DF8();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_2151F94B8();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

uint64_t sub_2151D8E0C(uint64_t a1)
{
  v20[0] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v23 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_2151F9618();
  uint64_t v5 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2151F9D58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger);
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24);
  v20[1] = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), v13);
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  sub_2151FA038();
  sub_2151F9E68();
  uint64_t v24 = a1;
  sub_2151FA108();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F36D28], v8);
  sub_2151F9CC8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  uint64_t v14 = v21;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F36AF0], v21);
  uint64_t v15 = v20[0];
  uint64_t v25 = v20[0];
  sub_2151FA108();
  sub_2151F9CA8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v14);
  uint64_t v16 = sub_2151F9F18();
  uint64_t v17 = (uint64_t)v23;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v23, 1, 1, v16);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v22;
  v18[5] = v15;
  swift_retain();
  sub_2151D16EC(v17, (uint64_t)&unk_267865598, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_2151D91DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_2151CEB5C;
  return sub_2151D95C4(a5);
}

uint64_t sub_2151D92BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2151F9F18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  long long v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2151D16EC((uint64_t)v7, (uint64_t)&unk_2678655A8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2151D93D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_2151D93F8, a4, 0);
}

uint64_t sub_2151D93F8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 40) = v1;
  return MEMORY[0x270FA2498](sub_2151D9424, v1, 0);
}

uint64_t sub_2151D9424()
{
  sub_2151F6CE8(v0[3], v0[4]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2151D95C4(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  v2[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678654D0);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  uint64_t v3 = sub_2151F9518();
  v2[33] = v3;
  v2[34] = *(void *)(v3 - 8);
  v2[35] = swift_task_alloc();
  uint64_t v4 = sub_2151F9A58();
  v2[36] = v4;
  v2[37] = *(void *)(v4 - 8);
  v2[38] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v2[39] = swift_task_alloc();
  uint64_t v5 = sub_2151F9D58();
  v2[40] = v5;
  v2[41] = *(void *)(v5 - 8);
  v2[42] = swift_task_alloc();
  uint64_t v6 = sub_2151F99D8();
  v2[43] = v6;
  v2[44] = *(void *)(v6 - 8);
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151D985C, v1, 0);
}

uint64_t sub_2151D985C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 392) = v1;
  return MEMORY[0x270FA2498](sub_2151D9888, v1, 0);
}

uint64_t sub_2151D9888()
{
  uint64_t v1 = v0[48];
  uint64_t v2 = v0[43];
  uint64_t v3 = v0[44];
  uint64_t v4 = v0[29];
  uint64_t v5 = v0[49] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[50] = v6;
  v0[51] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v5, v2);
  return MEMORY[0x270FA2498](sub_2151D9950, v4, 0);
}

uint64_t sub_2151D9950()
{
  char v1 = sub_2151F9938();
  uint64_t v2 = v0[48];
  if (v1)
  {
    uint64_t v3 = v0[43];
    uint64_t v4 = v0[44];
    uint64_t v6 = v0[41];
    uint64_t v5 = v0[42];
    uint64_t v7 = v0[40];
    __swift_project_boxed_opaque_existential_1((void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F36D00], v7);
    sub_2151F9C88();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  else
  {
    char v10 = sub_2151F99A8();
    uint64_t v11 = (unsigned int *)MEMORY[0x263F36D00];
    if ((v10 & 1) == 0)
    {
      uint64_t v13 = v0[41];
      uint64_t v12 = v0[42];
      uint64_t v14 = v0[40];
      __swift_project_boxed_opaque_existential_1((void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v12, *v11, v14);
      sub_2151F9C88();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
    char v15 = sub_2151F98B8();
    uint64_t v16 = v0[49];
    if (v15)
    {
      uint64_t v18 = v0[41];
      uint64_t v17 = v0[42];
      uint64_t v20 = v0[39];
      uint64_t v19 = v0[40];
      __swift_project_boxed_opaque_existential_1((void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v17, *v11, v19);
      sub_2151F9C58();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 5, 5, v21);
      uint64_t v22 = sub_2151DBBC0;
    }
    else
    {
      uint64_t v23 = v0[39];
      v0[52] = swift_allocBox();
      v0[53] = v24;
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v23, 5, 5, v25);
      uint64_t v22 = sub_2151D9D20;
    }
    return MEMORY[0x270FA2498](v22, v16, 0);
  }
}

uint64_t sub_2151D9D20()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = v0[29];
  sub_2151F7448(v1, v0[53]);
  sub_2151EE574(v1, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  return MEMORY[0x270FA2498](sub_2151D9DBC, v2, 0);
}

uint64_t sub_2151D9DBC()
{
  (*(void (**)(void, void, void))(v0 + 400))(*(void *)(v0 + 376), *(void *)(v0 + 424), *(void *)(v0 + 344));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v1;
  void *v1 = v0;
  v1[1] = sub_2151D9E68;
  uint64_t v2 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 224);
  return sub_2151E3634(v2, v3);
}

uint64_t sub_2151D9E68()
{
  uint64_t v1 = (void *)*v0;
  uint64_t v2 = *(void *)(*v0 + 376);
  uint64_t v3 = *(void *)(*v0 + 352);
  uint64_t v4 = *(void *)(*v0 + 344);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v1[55] = v6;
  v1[56] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v2, v4);
  uint64_t v7 = (void *)swift_task_alloc();
  v1[57] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_2151DA010;
  return sub_2151E4060();
}

uint64_t sub_2151DA010()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 232);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151DA120, v1, 0);
}

uint64_t sub_2151DA120()
{
  uint64_t v2 = v0[28];
  uint64_t v1 = v0[29];
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut) == 1 && v2 == 0)
  {
    uint64_t v8 = v0[41];
    uint64_t v7 = v0[42];
    uint64_t v9 = v0[40];
    __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, *MEMORY[0x263F36D00], v9);
    sub_2151F9C58();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
LABEL_10:
    sub_2151F9588();
    if (MEMORY[0x2166B43F0]())
    {
      v77 = (void (*)(uint64_t, uint64_t))v0[55];
      uint64_t v10 = v0[53];
      uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))v0[50];
      uint64_t v12 = v0[46];
      uint64_t v13 = v0[43];
      uint64_t v14 = v0[35];
      uint64_t v84 = v0[34];
      uint64_t v85 = v0[33];
      uint64_t v15 = sub_2151F9D48();
      sub_2151EE4C4(&qword_2678656D8, MEMORY[0x263F36CC8]);
      v79 = (void *)swift_allocError();
      uint64_t v17 = v16;
      v11(v12, v10, v13);
      uint64_t v18 = sub_2151F9978();
      char v20 = v19;
      v77(v12, v13);
      double v21 = *(double *)&v18;
      if (v20) {
        double v21 = 0.0;
      }
      *uint64_t v17 = v21;
      (*(void (**)(double *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F36CB8], v15);
      sub_2151F9E28();
      sub_2151F9508();
      sub_2151F9568();
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v14, v85);
    }
    uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[55];
    uint64_t v23 = v0[45];
    uint64_t v24 = v0[43];
    uint64_t v25 = v0[29];
    ((void (*)(uint64_t, void, uint64_t))v0[50])(v23, v0[53], v24);
    sub_2151F99B8();
    char v27 = v26;
    v22(v23, v24);
    __swift_project_boxed_opaque_existential_1((void *)(v25 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v25 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    uint64_t v28 = v0[41];
    uint64_t v29 = v0[42];
    uint64_t v30 = v0[40];
    if (v27)
    {
      uint64_t v37 = v0[32];
      uint64_t v81 = v0[29];
      sub_2151FA038();
      v0[24] = 0;
      v0[25] = 0xE000000000000000;
      sub_2151F9E68();
      sub_2151F9F98();
      sub_2151F9E68();
      (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))(v29, *MEMORY[0x263F36D00], v30);
      sub_2151F9C68();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
      uint64_t v38 = v81 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
      swift_beginAccess();
      sub_2151EF818(v38, v37, &qword_2678654D0);
      uint64_t v39 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
      uint64_t v40 = *(void *)(v39 - 8);
      uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 48);
      int v42 = v41(v37, 1, v39);
      uint64_t v43 = (void *)v0[32];
      if (v42 || !*v43)
      {
        sub_2151CEA98(v0[32], &qword_2678654D0);
      }
      else
      {
        swift_retain();
        sub_2151CEA98((uint64_t)v43, &qword_2678654D0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
        sub_2151F9F38();
        swift_release();
      }
      uint64_t v56 = (void *)v0[31];
      ((void (*)(char *, void, void))v0[50])((char *)v56 + *(int *)(v39 + 20), v0[53], v0[43]);
      *uint64_t v56 = 0;
      (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v56, 0, 1, v39);
      swift_beginAccess();
      sub_2151EE50C((uint64_t)v56, v38);
      swift_endAccess();
      uint64_t v57 = sub_2151D265C();
      uint64_t v59 = v58;
      int v60 = v41((uint64_t)v58, 1, v39);
      id v61 = (void (*)(uint64_t, uint64_t))v0[55];
      uint64_t v62 = v0[52];
      uint64_t v63 = v0[48];
      uint64_t v64 = v0[43];
      if (!v60)
      {
        uint64_t v65 = v0[30];
        uint64_t v82 = v65;
        uint64_t v66 = v0[29];
        uint64_t v67 = sub_2151F9F18();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v65, 1, 1, v67);
        uint64_t v68 = sub_2151EE4C4(&qword_267865340, (void (*)(uint64_t))type metadata accessor for ODISessionInternal);
        id v69 = (void *)swift_allocObject();
        v69[2] = v66;
        v69[3] = v68;
        v69[4] = v66;
        v69[5] = v62;
        swift_retain_n();
        swift_retain();
        *uint64_t v59 = sub_2151D190C(v82, (uint64_t)asc_267865720, (uint64_t)v69);
        swift_release();
      }
      ((void (*)(void *, void))v57)(v0 + 2, 0);
      v61(v63, v64);
      goto LABEL_37;
    }
    uint64_t v31 = v0[29];
    (*(void (**)(void, void, void))(v28 + 104))(v0[42], *MEMORY[0x263F36D00], v0[40]);
    sub_2151F9C68();
    id v32 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v0[66] = v32;
    v32(v29, v30);
    uint64_t v33 = *(void *)(v31 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
    v0[67] = v33;
    if (v33)
    {
      swift_retain();
      uint64_t v34 = (void *)swift_task_alloc();
      v0[68] = v34;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
      *uint64_t v34 = v0;
      int v36 = sub_2151DB514;
LABEL_21:
      v34[1] = v36;
      uint64_t v48 = MEMORY[0x263F8EE60] + 8;
      uint64_t v49 = MEMORY[0x263F8E4E0];
      return MEMORY[0x270FA1FA8](v35, v33, v48, v35, v49);
    }
    uint64_t v50 = *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    v0[70] = v50;
    if (!v50) {
      goto LABEL_36;
    }
    uint64_t v51 = v0[49];
    uint64_t v53 = v0[37];
    uint64_t v52 = v0[38];
    uint64_t v54 = v0[36];
    ((void (*)(void, void, void))v0[50])(v0[47], v0[53], v0[43]);
    (*(void (**)(uint64_t, void, uint64_t))(v53 + 104))(v52, *MEMORY[0x263F36C68], v54);
    uint64_t v55 = sub_2151DB7FC;
    goto LABEL_33;
  }
  if (v2)
  {
    if (v2 != 2)
    {
      if (v2 != 1)
      {
        unint64_t v83 = (void (*)(uint64_t, uint64_t))v0[55];
        uint64_t v4 = v0[42];
        uint64_t v78 = v0[43];
        uint64_t v80 = v0[48];
        uint64_t v6 = v0[40];
        uint64_t v5 = v0[41];
        __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
        sub_2151FA038();
        swift_bridgeObjectRelease();
        v0[26] = v2;
        sub_2151FA108();
        sub_2151F9E68();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F36D00], v6);
        sub_2151F9C88();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
        v83(v80, v78);
LABEL_37:
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        char v75 = (uint64_t (*)(void))v0[1];
        return v75();
      }
LABEL_36:
      ((void (*)(void, void))v0[55])(v0[48], v0[43]);
      goto LABEL_37;
    }
    goto LABEL_10;
  }
  uint64_t v45 = v0[41];
  uint64_t v44 = v0[42];
  uint64_t v46 = v0[40];
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v44, *MEMORY[0x263F36D00], v46);
  sub_2151F9C58();
  uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
  v0[58] = v47;
  v47(v44, v46);
  uint64_t v33 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  v0[59] = v33;
  if (v33)
  {
    swift_retain();
    uint64_t v34 = (void *)swift_task_alloc();
    v0[60] = v34;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    *uint64_t v34 = v0;
    int v36 = sub_2151DAD60;
    goto LABEL_21;
  }
  uint64_t v70 = *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  v0[62] = v70;
  if (!v70) {
    goto LABEL_36;
  }
  uint64_t v51 = v0[49];
  uint64_t v72 = v0[37];
  uint64_t v71 = v0[38];
  uint64_t v73 = v0[36];
  ((void (*)(void, void, void))v0[50])(v0[47], v0[53], v0[43]);
  (*(void (**)(uint64_t, void, uint64_t))(v72 + 104))(v71, *MEMORY[0x263F36C70], v73);
  uint64_t v55 = sub_2151DB048;
LABEL_33:
  uint64_t v74 = v55;
  swift_retain();
  return MEMORY[0x270FA2498](v74, v51, 0);
}

uint64_t sub_2151DAD60()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 488) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 232);
    swift_release();
    uint64_t v4 = sub_2151DBD94;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 232);
    uint64_t v4 = sub_2151DAE88;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151DAE88()
{
  swift_release();
  uint64_t v1 = *(void *)(*(void *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(void *)(v0 + 496) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 392);
    uint64_t v4 = *(void *)(v0 + 296);
    uint64_t v3 = *(void *)(v0 + 304);
    uint64_t v5 = *(void *)(v0 + 288);
    (*(void (**)(void, void, void))(v0 + 400))(*(void *)(v0 + 376), *(void *)(v0 + 424), *(void *)(v0 + 344));
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F36C70], v5);
    swift_retain();
    return MEMORY[0x270FA2498](sub_2151DB048, v2, 0);
  }
  else
  {
    (*(void (**)(void, void))(v0 + 440))(*(void *)(v0 + 384), *(void *)(v0 + 344));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_2151DB048()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = (void *)(v0[49] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  v0[63] = *v2;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151DB0E0, v1, 0);
}

uint64_t sub_2151DB0E0()
{
  uint64_t v1 = (uint64_t *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  v0[64] = v3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F36B68]
                                                                           + MEMORY[0x263F36B68]);
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[65] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151DB1CC;
  uint64_t v5 = v0[63];
  uint64_t v6 = v0[47];
  uint64_t v7 = v0[38];
  return v9(v6, v7, v5, v2, v3);
}

uint64_t sub_2151DB1CC()
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 440);
  uint64_t v1 = *(void *)(*(void *)v0 + 376);
  uint64_t v2 = *(void *)(*(void *)v0 + 344);
  uint64_t v3 = *(void *)(*(void *)v0 + 304);
  uint64_t v4 = *(void *)(*(void *)v0 + 296);
  uint64_t v5 = *(void *)(*(void *)v0 + 288);
  uint64_t v6 = *(void *)(*(void *)v0 + 232);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v8(v1, v2);
  return MEMORY[0x270FA2498](sub_2151DB40C, v6, 0);
}

uint64_t sub_2151DB40C()
{
  (*(void (**)(void, void))(v0 + 440))(*(void *)(v0 + 384), *(void *)(v0 + 344));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151DB514()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 552) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 232);
    swift_release();
    uint64_t v4 = sub_2151DBFEC;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 232);
    uint64_t v4 = sub_2151DB63C;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151DB63C()
{
  swift_release();
  uint64_t v1 = *(void *)(*(void *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(void *)(v0 + 560) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 392);
    uint64_t v4 = *(void *)(v0 + 296);
    uint64_t v3 = *(void *)(v0 + 304);
    uint64_t v5 = *(void *)(v0 + 288);
    (*(void (**)(void, void, void))(v0 + 400))(*(void *)(v0 + 376), *(void *)(v0 + 424), *(void *)(v0 + 344));
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F36C68], v5);
    swift_retain();
    return MEMORY[0x270FA2498](sub_2151DB7FC, v2, 0);
  }
  else
  {
    (*(void (**)(void, void))(v0 + 440))(*(void *)(v0 + 384), *(void *)(v0 + 344));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_2151DB7FC()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = (void *)(v0[49] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  v0[71] = *v2;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151DB894, v1, 0);
}

uint64_t sub_2151DB894()
{
  uint64_t v1 = (uint64_t *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  v0[72] = v3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F36B68]
                                                                           + MEMORY[0x263F36B68]);
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[73] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151DB980;
  uint64_t v5 = v0[71];
  uint64_t v6 = v0[47];
  uint64_t v7 = v0[38];
  return v9(v6, v7, v5, v2, v3);
}

uint64_t sub_2151DB980()
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 440);
  uint64_t v1 = *(void *)(*(void *)v0 + 376);
  uint64_t v2 = *(void *)(*(void *)v0 + 344);
  uint64_t v3 = *(void *)(*(void *)v0 + 304);
  uint64_t v4 = *(void *)(*(void *)v0 + 296);
  uint64_t v5 = *(void *)(*(void *)v0 + 288);
  uint64_t v6 = *(void *)(*(void *)v0 + 232);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v8(v1, v2);
  return MEMORY[0x270FA2498](sub_2151EF8E4, v6, 0);
}

uint64_t sub_2151DBBC0()
{
  uint64_t v1 = v0[47];
  uint64_t v2 = v0[43];
  uint64_t v3 = v0[44];
  uint64_t v4 = v0[39];
  uint64_t v5 = v0[29];
  sub_2151F7448(v4, v1);
  sub_2151EE574(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[74] = v6;
  v0[75] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  return MEMORY[0x270FA2498](sub_2151DBC94, v5, 0);
}

uint64_t sub_2151DBC94()
{
  (*(void (**)(void, void))(v0 + 592))(*(void *)(v0 + 384), *(void *)(v0 + 344));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151DBD94()
{
  uint64_t v1 = (void *)v0[61];
  uint64_t v2 = v0[40];
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[55];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[58];
  uint64_t v8 = v0[48];
  uint64_t v3 = v0[42];
  uint64_t v9 = v0[43];
  __swift_project_boxed_opaque_existential_1((void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v4 = *MEMORY[0x263F36D28];
  uint64_t v5 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  sub_2151F9D08();
  swift_bridgeObjectRelease();

  v11(v3, v2);
  v10(v8, v9);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2151DBFEC()
{
  uint64_t v1 = (void *)v0[69];
  uint64_t v2 = v0[40];
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[55];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[66];
  uint64_t v8 = v0[48];
  uint64_t v3 = v0[42];
  uint64_t v9 = v0[43];
  __swift_project_boxed_opaque_existential_1((void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v4 = *MEMORY[0x263F36D28];
  uint64_t v5 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  sub_2151F9D08();
  swift_bridgeObjectRelease();

  v11(v3, v2);
  v10(v8, v9);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2151DC244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[14] = a4;
  uint64_t v6 = sub_2151F9A58();
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  uint64_t v7 = sub_2151F99D8();
  v4[18] = v7;
  v4[19] = *(void *)(v7 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v8 = sub_2151F9D58();
  v4[21] = v8;
  v4[22] = *(void *)(v8 - 8);
  v4[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678654D0);
  v4[24] = swift_task_alloc();
  v4[25] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_2151DC400, a4, 0);
}

uint64_t sub_2151DC400()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v1;
  void *v1 = v0;
  v1[1] = sub_2151DC49C;
  return MEMORY[0x270FA1FF0](10000000000);
}

uint64_t sub_2151DC49C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 112);
    return MEMORY[0x270FA2498](sub_2151DC600, v6, 0);
  }
}

uint64_t sub_2151DC600()
{
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[14];
  uint64_t v6 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  uint64_t v7 = v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
  swift_beginAccess();
  sub_2151EE50C(v1, v7);
  swift_endAccess();
  __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F36D00], v4);
  sub_2151F9C68();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_beginAccess();
  sub_2151F9928();
  swift_endAccess();
  uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  v0[27] = v8;
  if (v8)
  {
    swift_retain();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[28] = v9;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    *uint64_t v9 = v0;
    v9[1] = sub_2151DC97C;
    uint64_t v11 = MEMORY[0x263F8EE60] + 8;
    uint64_t v12 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v10, v8, v11, v10, v12);
  }
  else
  {
    uint64_t v13 = v0[14];
    uint64_t v14 = *(void *)(v13 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    v0[30] = v14;
    uint64_t v15 = v0[20];
    if (v14)
    {
      uint64_t v16 = v0[25];
      uint64_t v17 = v0[18];
      uint64_t v18 = v0[19];
      uint64_t v20 = v0[16];
      uint64_t v19 = v0[17];
      uint64_t v21 = v0[15];
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v19, *MEMORY[0x263F36C68], v21);
      uint64_t v22 = *(void *)(v13 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      v0[31] = v22;
      swift_retain();
      return MEMORY[0x270FA2498](sub_2151DCC30, v22, 0);
    }
    else
    {
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v23 = (uint64_t (*)(void))v0[1];
      return v23();
    }
  }
}

uint64_t sub_2151DC97C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 112);
    swift_release();
    uint64_t v4 = sub_2151DD020;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 112);
    uint64_t v4 = sub_2151DCAA4;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151DCAA4()
{
  swift_release();
  uint64_t v1 = v0[14];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  v0[30] = v2;
  if (v2)
  {
    uint64_t v3 = v0[25];
    uint64_t v5 = v0[19];
    uint64_t v4 = v0[20];
    uint64_t v7 = v0[17];
    uint64_t v6 = v0[18];
    uint64_t v8 = v0[15];
    uint64_t v9 = v0[16];
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v7, *MEMORY[0x263F36C68], v8);
    uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    v0[31] = v10;
    swift_retain();
    return MEMORY[0x270FA2498](sub_2151DCC30, v10, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_2151DCC30()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = (void *)(v0[31] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  v0[32] = *v2;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151DCCC8, v1, 0);
}

uint64_t sub_2151DCCC8()
{
  uint64_t v1 = (uint64_t *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  v0[33] = v3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F36B68]
                                                                           + MEMORY[0x263F36B68]);
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[34] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151DCDB4;
  uint64_t v5 = v0[32];
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[17];
  return v9(v6, v7, v5, v2, v3);
}

uint64_t sub_2151DCDB4()
{
  uint64_t v8 = *(void *)(*v0 + 160);
  uint64_t v1 = *(void *)(*v0 + 152);
  uint64_t v7 = *(void *)(*v0 + 144);
  uint64_t v2 = *(void *)(*v0 + 136);
  uint64_t v3 = *(void *)(*v0 + 128);
  uint64_t v4 = *(void *)(*v0 + 120);
  uint64_t v9 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v8, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v9 + 8);
  return v5();
}

uint64_t sub_2151DD020()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151DD0AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 632) = a4;
  *(void *)(v5 + 104) = a3;
  *(void *)(v5 + 112) = v4;
  *(void *)(v5 + 88) = a1;
  *(void *)(v5 + 96) = a2;
  uint64_t v6 = sub_2151F9638();
  *(void *)(v5 + 120) = v6;
  *(void *)(v5 + 128) = *(void *)(v6 - 8);
  *(void *)(v5 + 136) = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  *(void *)(v5 + 144) = swift_task_alloc();
  uint64_t v7 = sub_2151F99D8();
  *(void *)(v5 + 152) = v7;
  *(void *)(v5 + 160) = *(void *)(v7 - 8);
  *(void *)(v5 + 168) = swift_task_alloc();
  uint64_t v8 = sub_2151F9808();
  *(void *)(v5 + 176) = v8;
  *(void *)(v5 + 184) = *(void *)(v8 - 8);
  *(void *)(v5 + 192) = swift_task_alloc();
  *(void *)(v5 + 200) = swift_task_alloc();
  uint64_t v9 = sub_2151F9AC8();
  *(void *)(v5 + 208) = v9;
  *(void *)(v5 + 216) = *(void *)(v9 - 8);
  *(void *)(v5 + 224) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656E0);
  *(void *)(v5 + 232) = swift_task_alloc();
  uint64_t v10 = sub_2151F9A98();
  *(void *)(v5 + 240) = v10;
  *(void *)(v5 + 248) = *(void *)(v10 - 8);
  *(void *)(v5 + 256) = swift_task_alloc();
  uint64_t v11 = sub_2151F9518();
  *(void *)(v5 + 264) = v11;
  *(void *)(v5 + 272) = *(void *)(v11 - 8);
  *(void *)(v5 + 280) = swift_task_alloc();
  uint64_t v12 = sub_2151F9A48();
  *(void *)(v5 + 288) = v12;
  *(void *)(v5 + 296) = *(void *)(v12 - 8);
  *(void *)(v5 + 304) = swift_task_alloc();
  uint64_t v13 = sub_2151F98A8();
  *(void *)(v5 + 312) = v13;
  *(void *)(v5 + 320) = *(void *)(v13 - 8);
  *(void *)(v5 + 328) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656E8);
  *(void *)(v5 + 336) = swift_task_alloc();
  *(void *)(v5 + 344) = swift_task_alloc();
  uint64_t v14 = sub_2151F9D58();
  *(void *)(v5 + 352) = v14;
  *(void *)(v5 + 360) = *(void *)(v14 - 8);
  *(void *)(v5 + 368) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151DD500, v4, 0);
}

uint64_t sub_2151DD500()
{
  uint64_t v1 = *(void *)(v0 + 112);
  char v2 = *(unsigned char *)(v0 + 632);
  uint64_t v3 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(void *)(v0 + 376) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  uint64_t v20 = (void *)(v1 + v3);
  sub_2151CC6F4(v1 + v3, v0 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_2151FA038();
  sub_2151F9E68();
  sub_2151F9AB8();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  if ((v2 & 1) == 0)
  {
    *(void *)(v0 + 80) = *(void *)(v0 + 104);
    sub_2151EED44();
    sub_2151F9FD8();
  }
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 368);
  uint64_t v6 = *(void *)(v0 + 352);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v21 = *(void *)(v0 + 344);
  uint64_t v22 = *(void *)(v0 + 120);
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v8 = *MEMORY[0x263F36CF8];
  *(_DWORD *)(v0 + 624) = v8;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104);
  *(void *)(v0 + 384) = v9;
  *(void *)(v0 + 392) = (v5 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v9(v4, v8, v6);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(void *)(v0 + 400) = v10;
  *(void *)(v0 + 408) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v4, v6);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  *(void *)(v0 + 416) = v11;
  *(void *)(v0 + 424) = (v7 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v11(v21, 1, 1, v22);
  if (sub_2151F9AB8())
  {
    uint64_t v12 = *(void *)(v0 + 368);
    uint64_t v13 = *(void *)(v0 + 352);
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    v9(v12, v8, v13);
    sub_2151F9C68();
    v10(v12, v13);
    *(void *)(v0 + 432) = sub_2151D26B8();
    return MEMORY[0x270FA2498](sub_2151DDA90, 0, 0);
  }
  else
  {
    sub_2151F9F58();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v14 = *(void (**)(uint64_t))(v0 + 384);
    uint64_t v15 = *(void *)(v0 + 368);
    uint64_t v16 = *(void *)(v0 + 352);
    uint64_t v17 = (void *)(*(void *)(v0 + 112) + *(void *)(v0 + 376));
    __swift_project_boxed_opaque_existential_1(v17, v17[3]);
    *(_DWORD *)(v0 + 628) = *MEMORY[0x263F36CE8];
    v14(v15);
    sub_2151F9C68();
    v23(v15, v16);
    swift_retain();
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 448) = v18;
    void *v18 = v0;
    v18[1] = sub_2151DDF98;
    return MEMORY[0x270F1B128]();
  }
}

uint64_t sub_2151DDA90()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  char v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  uint64_t v3 = *(unsigned int *)(v0 + 624);
  uint64_t v4 = *(void *)(v0 + 368);
  uint64_t v5 = *(void *)(v0 + 352);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 432) + 24), *(void *)(*(void *)(v0 + 432) + 48));
  v2(v4, v3, v5);
  sub_2151F9C68();
  v1(v4, v5);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 440) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2151DDBBC;
  return sub_2151C1FB8();
}

uint64_t sub_2151DDBBC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151DDCE8, v1, 0);
}

uint64_t sub_2151DDCE8()
{
  sub_2151F9F58();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 368);
  uint64_t v3 = *(void *)(v0 + 352);
  uint64_t v4 = (void *)(*(void *)(v0 + 112) + *(void *)(v0 + 376));
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  *(_DWORD *)(v0 + 628) = *MEMORY[0x263F36CE8];
  v1(v2);
  sub_2151F9C68();
  v7(v2, v3);
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v5;
  void *v5 = v0;
  v5[1] = sub_2151DDF98;
  return MEMORY[0x270F1B128]();
}

uint64_t sub_2151DDF98()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 456) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  if (v0)
  {
    uint64_t v4 = sub_2151E0108;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_2151DE0D0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2151DE0D0()
{
  v0[58] = v0[57];
  v0[59] = *(void *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_2151F9858();
  sub_2151EE4C4(&qword_2678652E0, MEMORY[0x263F36C28]);
  swift_retain();
  uint64_t v2 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151DE1B4, v2, v1);
}

uint64_t sub_2151DE1B4()
{
  sub_2151F9818();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 480) = v1;
  void *v1 = v0;
  v1[1] = sub_2151DE258;
  return sub_2151D2800();
}

uint64_t sub_2151DE258(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 112);
  *(void *)(*(void *)v1 + 488) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151DE370, v2, 0);
}

uint64_t sub_2151DE370()
{
  sub_2151F9888();
  if (sub_2151F9AB8())
  {
    uint64_t v1 = v0[58];
    sub_2151F9F58();
    v0[62] = v1;
    if (v1)
    {
      (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
LABEL_6:
      sub_2151CEA98(v0[43], &qword_2678656E8);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v5 = (uint64_t (*)(void))v0[1];
      return v5();
    }
    v0[63] = sub_2151D26B8();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[64] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_2151DE950;
    uint64_t v8 = v0[38];
    return sub_2151C2AF0(v8);
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
    unint64_t v3 = sub_2151D666C(MEMORY[0x263F8EE78]);
    uint64_t v4 = v0[58];
    v0[66] = v3;
    v0[65] = v2;
    sub_2151F9F58();
    if (v4)
    {
      (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    uint64_t v9 = v0[14];
    uint64_t v10 = *(void *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
    v0[67] = v10;
    if (v10)
    {
      swift_retain();
      uint64_t v11 = (void *)swift_task_alloc();
      v0[68] = v11;
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
      *uint64_t v11 = v0;
      v11[1] = sub_2151DF2E4;
      uint64_t v13 = MEMORY[0x263F8EE60] + 8;
      uint64_t v14 = MEMORY[0x263F8E4E0];
      return MEMORY[0x270FA1FA8](v12, v10, v13, v12, v14);
    }
    else
    {
      uint64_t v15 = *(void *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
      v0[70] = v15;
      if (!v15)
      {
        uint64_t v18 = v0[40];
        uint64_t v17 = v0[41];
        uint64_t v19 = v0[39];
        uint64_t v21 = v0[16];
        uint64_t v20 = v0[17];
        uint64_t v22 = v0[15];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v20, *MEMORY[0x263F36B28], v22);
        sub_2151F9D38();
        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
        swift_willThrow();
        (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
        goto LABEL_6;
      }
      swift_retain();
      if (sub_2151F9AB8())
      {
        uint64_t v16 = *(void *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
        v0[71] = v16;
        return MEMORY[0x270FA2498](sub_2151DF81C, v16, 0);
      }
      else
      {
        if ((sub_2151F9AB8() & 1) == 0)
        {
          uint64_t v23 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[52];
          uint64_t v24 = v0[43];
          uint64_t v25 = v0[15];
          uint64_t v26 = v0[16];
          sub_2151CEA98(v24, &qword_2678656E8);
          (*(void (**)(uint64_t, void, uint64_t))(v26 + 104))(v24, *MEMORY[0x263F36B48], v25);
          v23(v24, 0, 1, v25);
        }
        uint64_t v27 = v0[40];
        uint64_t v28 = v0[39];
        uint64_t v29 = v0[29];
        (*(void (**)(uint64_t, void, uint64_t))(v27 + 16))(v29, v0[41], v28);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v29, 0, 1, v28);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v30 = (void *)swift_task_alloc();
        v0[72] = v30;
        void *v30 = v0;
        v30[1] = sub_2151DF9CC;
        return sub_2151D2800();
      }
    }
  }
}

uint64_t sub_2151DE950()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151DEA7C, v1, 0);
}

uint64_t sub_2151DEA7C()
{
  int v42 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  uint64_t v1 = *(unsigned int *)(v0 + 624);
  unsigned int v40 = *(_DWORD *)(v0 + 624);
  uint64_t v2 = *(void *)(v0 + 368);
  uint64_t v41 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v6 = (void *)(*(void *)(v0 + 112) + *(void *)(v0 + 376));
  uint64_t v7 = sub_2151F9A38();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
  sub_2151F9D98();
  sub_2151F9E68();
  uint64_t v43 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44(v2, v1, v41);
  sub_2151F9CB8();
  swift_bridgeObjectRelease();
  v42(v2, v41);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_bridgeObjectRetain();
  MEMORY[0x2166B4D50](v8, MEMORY[0x263F8D310]);
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44(v2, v40, v41);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  v42(v2, v41);
  if (*(void *)(v8 + 16))
  {
    sub_2151F9588();
    if (MEMORY[0x2166B43F0]())
    {
      uint64_t v10 = *(void *)(v0 + 272);
      uint64_t v9 = *(void *)(v0 + 280);
      uint64_t v11 = *(void *)(v0 + 264);
      uint64_t v12 = sub_2151F9D48();
      sub_2151EE4C4(&qword_2678656D8, MEMORY[0x263F36CC8]);
      uint64_t v13 = (void *)swift_allocError();
      *uint64_t v14 = v8;
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F36CB0], v12);
      sub_2151F9E28();
      swift_bridgeObjectRetain();
      sub_2151F9508();
      sub_2151F9568();
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
  }
  uint64_t v15 = *(void *)(v0 + 496);
  *(void *)(v0 + 528) = v43;
  *(void *)(v0 + 520) = v8;
  sub_2151F9F58();
  if (v15)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 320) + 8))(*(void *)(v0 + 328), *(void *)(v0 + 312));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    sub_2151CEA98(*(void *)(v0 + 344), &qword_2678656E8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
  uint64_t v18 = *(void *)(v0 + 112);
  uint64_t v19 = *(void *)(v18 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(void *)(v0 + 536) = v19;
  if (v19)
  {
    swift_retain();
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v20;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    *uint64_t v20 = v0;
    v20[1] = sub_2151DF2E4;
    uint64_t v22 = MEMORY[0x263F8EE60] + 8;
    uint64_t v23 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v21, v19, v22, v21, v23);
  }
  else
  {
    uint64_t v24 = *(void *)(v18 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(void *)(v0 + 560) = v24;
    if (!v24)
    {
      uint64_t v27 = *(void *)(v0 + 320);
      uint64_t v26 = *(void *)(v0 + 328);
      uint64_t v28 = *(void *)(v0 + 312);
      uint64_t v30 = *(void *)(v0 + 128);
      uint64_t v29 = *(void *)(v0 + 136);
      uint64_t v31 = *(void *)(v0 + 120);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v29, *MEMORY[0x263F36B28], v31);
      sub_2151F9D38();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
      goto LABEL_6;
    }
    swift_retain();
    if (sub_2151F9AB8())
    {
      uint64_t v25 = *(void *)(*(void *)(v0 + 112) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      *(void *)(v0 + 568) = v25;
      return MEMORY[0x270FA2498](sub_2151DF81C, v25, 0);
    }
    else
    {
      if ((sub_2151F9AB8() & 1) == 0)
      {
        id v32 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 416);
        uint64_t v33 = *(void *)(v0 + 344);
        uint64_t v34 = *(void *)(v0 + 120);
        uint64_t v35 = *(void *)(v0 + 128);
        sub_2151CEA98(v33, &qword_2678656E8);
        (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v33, *MEMORY[0x263F36B48], v34);
        v32(v33, 0, 1, v34);
      }
      uint64_t v36 = *(void *)(v0 + 320);
      uint64_t v37 = *(void *)(v0 + 312);
      uint64_t v38 = *(void *)(v0 + 232);
      (*(void (**)(uint64_t, void, uint64_t))(v36 + 16))(v38, *(void *)(v0 + 328), v37);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v38, 0, 1, v37);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v39 = (void *)swift_task_alloc();
      *(void *)(v0 + 576) = v39;
      void *v39 = v0;
      v39[1] = sub_2151DF9CC;
      return sub_2151D2800();
    }
  }
}

uint64_t sub_2151DF2E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 552) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 112);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = sub_2151E0390;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 112);
    uint64_t v4 = sub_2151DF42C;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151DF42C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  v0[70] = v1;
  if (v1)
  {
    swift_retain();
    if (sub_2151F9AB8())
    {
      uint64_t v2 = *(void *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      v0[71] = v2;
      return MEMORY[0x270FA2498](sub_2151DF81C, v2, 0);
    }
    else
    {
      if ((sub_2151F9AB8() & 1) == 0)
      {
        uint64_t v10 = (void (*)(uint64_t, void, uint64_t, uint64_t))v0[52];
        uint64_t v11 = v0[43];
        uint64_t v12 = v0[15];
        uint64_t v13 = v0[16];
        sub_2151CEA98(v11, &qword_2678656E8);
        (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v11, *MEMORY[0x263F36B48], v12);
        v10(v11, 0, 1, v12);
      }
      uint64_t v14 = v0[40];
      uint64_t v15 = v0[39];
      uint64_t v16 = v0[29];
      (*(void (**)(uint64_t, void, uint64_t))(v14 + 16))(v16, v0[41], v15);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v16, 0, 1, v15);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)swift_task_alloc();
      v0[72] = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_2151DF9CC;
      return sub_2151D2800();
    }
  }
  else
  {
    uint64_t v4 = v0[40];
    uint64_t v3 = v0[41];
    uint64_t v5 = v0[39];
    uint64_t v7 = v0[16];
    uint64_t v6 = v0[17];
    uint64_t v8 = v0[15];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v6, *MEMORY[0x263F36B28], v8);
    sub_2151F9D38();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    sub_2151CEA98(v0[43], &qword_2678656E8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_2151DF81C()
{
  uint64_t v1 = *(void *)(v0 + 112);
  *(unsigned char *)(v0 + 633) = *(unsigned char *)(*(void *)(v0 + 568)
                                  + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTriggered);
  return MEMORY[0x270FA2498](sub_2151DF850, v1, 0);
}

uint64_t sub_2151DF850()
{
  if (*(unsigned char *)(v0 + 633) == 1)
  {
    if (sub_2151F9AB8()) {
      goto LABEL_6;
    }
    uint64_t v1 = (unsigned int *)MEMORY[0x263F36B48];
  }
  else
  {
    uint64_t v1 = (unsigned int *)MEMORY[0x263F36B50];
  }
  uint64_t v2 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 416);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 128);
  sub_2151CEA98(v3, &qword_2678656E8);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v3, *v1, v4);
  v2(v3, 0, 1, v4);
LABEL_6:
  uint64_t v6 = *(void *)(v0 + 320);
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v8, *(void *)(v0 + 328), v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 576) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2151DF9CC;
  return sub_2151D2800();
}

uint64_t sub_2151DF9CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 112);
  *(void *)(*(void *)v1 + 584) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151DFAE4, v2, 0);
}

uint64_t sub_2151DFAE4()
{
  uint64_t v2 = v0[42];
  uint64_t v1 = v0[43];
  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[23];
  (*(void (**)(void, void, void))(v0[27] + 16))(v0[28], v0[12], v0[26]);
  sub_2151EF818(v1, v2, &qword_2678656E8);
  uint64_t v7 = *MEMORY[0x263F36C08];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  v8(v3, v7, v5);
  v8(v4, v7, v5);
  sub_2151F9A88();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263F36B70] + MEMORY[0x263F36B70]);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[74] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2151DFC74;
  uint64_t v10 = v0[32];
  uint64_t v11 = v0[11];
  return v13(v11, v10);
}

uint64_t sub_2151DFC74()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 600) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 112);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_2151E04E4;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 112);
    uint64_t v4 = sub_2151DFDA8;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151DFDA8()
{
  uint64_t v1 = v0[66];
  uint64_t v2 = *(void *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[76] = v2;
  v0[77] = sub_2151ECCFC(v1);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2151DFE34, v2, 0);
}

uint64_t sub_2151DFE34()
{
  uint64_t v1 = v0[77];
  uint64_t v2 = v0[65];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[21];
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v10 = v0[14];
  uint64_t v7 = v0[11];
  sub_2151F9B88();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 5, v8);
  sub_2151F7448(v6, v4);
  sub_2151EE574(v6, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  sub_2151F5F74(*(void *)(v2 + 16), *(void *)(v1 + 16), 0, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2151DFF8C, v10, 0);
}

uint64_t sub_2151DFF8C()
{
  uint64_t v1 = v0[43];
  uint64_t v3 = v0[40];
  uint64_t v2 = v0[41];
  uint64_t v4 = v0[39];
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[30];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_2151CEA98(v1, &qword_2678656E8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2151E0108()
{
  uint64_t v1 = (void *)v0;
  uint64_t v2 = *(void **)(v0 + 456);
  uint64_t v3 = *(unsigned int *)(v0 + 628);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  uint64_t v5 = *(void *)(v0 + 376);
  uint64_t v6 = v1[46];
  uint64_t v7 = v1[44];
  uint64_t v8 = v1[14];
  swift_release();
  __swift_project_boxed_opaque_existential_1((void *)(v8 + v5), *(void *)(v8 + v5 + 24));
  sub_2151FA038();
  v1[7] = 0;
  v1[8] = 0xE000000000000000;
  sub_2151F9E68();
  v1[9] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
  sub_2151FA0B8();
  v4(v6, v3, v7);
  sub_2151F9C78();
  swift_bridgeObjectRelease();
  v12(v6, v7);
  __swift_project_boxed_opaque_existential_1((void *)(v8 + v5), *(void *)(v8 + v5 + 24));
  v4(v6, v3, v7);
  sub_2151F9C58();

  v12(v6, v7);
  v1[58] = 0;
  v1[59] = *(void *)(v1[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_2151F9858();
  sub_2151EE4C4(&qword_2678652E0, MEMORY[0x263F36C28]);
  swift_retain();
  uint64_t v10 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151DE1B4, v10, v9);
}

uint64_t sub_2151E0390()
{
  (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
  sub_2151CEA98(v0[43], &qword_2678656E8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2151E04E4()
{
  uint64_t v2 = v0[40];
  uint64_t v1 = v0[41];
  uint64_t v3 = v0[39];
  uint64_t v5 = v0[31];
  uint64_t v4 = v0[32];
  uint64_t v6 = v0[30];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_2151CEA98(v0[43], &qword_2678656E8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2151E0668()
{
  return sub_2151EED98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2151E069C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151CEB5C;
  return sub_2151EA898();
}

uint64_t sub_2151E072C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[19] = a4;
  v5[20] = v4;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  uint64_t v6 = sub_2151F9BE8();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  uint64_t v7 = sub_2151F9688();
  v5[24] = v7;
  v5[25] = *(void *)(v7 - 8);
  v5[26] = swift_task_alloc();
  uint64_t v8 = sub_2151F9518();
  v5[27] = v8;
  v5[28] = *(void *)(v8 - 8);
  v5[29] = swift_task_alloc();
  uint64_t v9 = sub_2151F9638();
  v5[30] = v9;
  v5[31] = *(void *)(v9 - 8);
  v5[32] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v5[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656B8);
  v5[34] = swift_task_alloc();
  uint64_t v10 = sub_2151F9A48();
  v5[35] = v10;
  v5[36] = *(void *)(v10 - 8);
  v5[37] = swift_task_alloc();
  uint64_t v11 = sub_2151F9618();
  v5[38] = v11;
  v5[39] = *(void *)(v11 - 8);
  v5[40] = swift_task_alloc();
  uint64_t v12 = sub_2151F9AC8();
  v5[41] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v5[42] = v13;
  v5[43] = *(void *)(v13 + 64);
  v5[44] = swift_task_alloc();
  uint64_t v14 = sub_2151F9BB8();
  v5[45] = v14;
  v5[46] = *(void *)(v14 - 8);
  v5[47] = swift_task_alloc();
  v5[48] = swift_task_alloc();
  v5[49] = swift_task_alloc();
  v5[50] = swift_task_alloc();
  uint64_t v15 = sub_2151F9D58();
  v5[51] = v15;
  v5[52] = *(void *)(v15 - 8);
  v5[53] = swift_task_alloc();
  uint64_t v16 = sub_2151F99D8();
  v5[54] = v16;
  v5[55] = *(void *)(v16 - 8);
  v5[56] = swift_task_alloc();
  v5[57] = swift_task_alloc();
  v5[58] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E0BD8, v4, 0);
}

uint64_t sub_2151E0BD8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 472) = v1;
  return MEMORY[0x270FA2498](sub_2151E0C04, v1, 0);
}

uint64_t sub_2151E0C04()
{
  uint64_t v2 = v0[58];
  uint64_t v1 = v0[59];
  uint64_t v3 = v0[54];
  uint64_t v4 = v0[55];
  uint64_t v5 = v0[20];
  uint64_t v6 = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v0[60] = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  uint64_t v7 = v1 + v6;
  swift_beginAccess();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[61] = v8;
  v0[62] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v2, v7, v3);
  return MEMORY[0x270FA2498](sub_2151E0CD0, v5, 0);
}

uint64_t sub_2151E0CD0()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v3 = *(void *)(v0 + 464);
  uint64_t v4 = *(void *)(v0 + 432);
  char v5 = sub_2151F9998();
  v1(v2, v3, v4);
  uint64_t v6 = *(void *)(v0 + 456);
  uint64_t v7 = *(void *)(v0 + 432);
  uint64_t v8 = *(void *)(v0 + 440);
  if (v5)
  {
    char v9 = sub_2151F9938();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    if ((v9 & 1) == 0)
    {
      uint64_t v11 = *(void *)(v0 + 416);
      uint64_t v10 = *(void *)(v0 + 424);
      uint64_t v12 = *(void *)(v0 + 408);
      __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(*(void *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, void, uint64_t))(v11 + 104))(v10, *MEMORY[0x263F36CD8], v12);
      sub_2151F9C88();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
  }
  else
  {
    (*(void (**)(void, void))(v8 + 8))(*(void *)(v0 + 456), *(void *)(v0 + 432));
  }
  double v13 = *(double *)(*(void *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_profileSla);
  uint64_t v14 = sub_2151F9948();
  double v22 = v13 - v21;
  double v23 = v22 * 1000000000.0;
  BOOL v24 = v22 > 0.5;
  double v25 = 500000000.0;
  if (v24) {
    double v25 = v23;
  }
  if ((~*(void *)&v25 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v25 <= -1.0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v25 >= 1.84467441e19)
  {
LABEL_16:
    __break(1u);
    return MEMORY[0x270F1B128](v14, v15, v16, v17, v18, v19, v20);
  }
  uint64_t v27 = *(void *)(v0 + 416);
  uint64_t v26 = *(void *)(v0 + 424);
  uint64_t v28 = *(void *)(v0 + 408);
  uint64_t v29 = *(void *)(v0 + 336);
  uint64_t v43 = *(void *)(v0 + 352);
  uint64_t v44 = *(void *)(v0 + 344);
  uint64_t v45 = *(void *)(v0 + 160);
  unint64_t v40 = (unint64_t)v25;
  uint64_t v41 = *(void *)(v0 + 136);
  uint64_t v42 = *(void *)(v0 + 328);
  uint64_t v30 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(void *)(v0 + 504) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  uint64_t v31 = (void *)(v45 + v30);
  __swift_project_boxed_opaque_existential_1(v31, v31[3]);
  sub_2151FA038();
  sub_2151F9E68();
  sub_2151F9AB8();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  *(_DWORD *)(v0 + 656) = *MEMORY[0x263F36D18];
  id v32 = *(void (**)(uint64_t))(v27 + 104);
  *(void *)(v0 + 512) = v32;
  *(void *)(v0 + 520) = (v27 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v32(v26);
  sub_2151F9C58();
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(void *)(v0 + 528) = v33;
  *(void *)(v0 + 536) = (v27 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v33(v26, v28);
  __swift_project_boxed_opaque_existential_1(v31, v31[3]);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 104) = v40;
  sub_2151FA108();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v34 = *MEMORY[0x263F36D28];
  *(_DWORD *)(v0 + 660) = v34;
  uint64_t v35 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(v26, v34, v35);
  sub_2151F9CD8();
  swift_bridgeObjectRelease();
  v33(v26, v28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v43, v41, v42);
  unint64_t v36 = (*(unsigned __int8 *)(v29 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v37 = swift_allocObject();
  *(void *)(v0 + 544) = v37;
  *(void *)(v37 + 16) = v45;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v29 + 32))(v37 + v36, v43, v42);
  *(void *)(v37 + ((v44 + v36 + 7) & 0xFFFFFFFFFFFFFFF8)) = v40;
  swift_retain();
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 552) = v38;
  *uint64_t v38 = v0;
  v38[1] = sub_2151E1244;
  uint64_t v14 = *(void *)(v0 + 400);
  uint64_t v20 = *(void *)(v0 + 360);
  uint64_t v16 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 152);
  uint64_t v18 = &unk_2678656C8;
  unint64_t v15 = v40;
  uint64_t v19 = v37;
  return MEMORY[0x270F1B128](v14, v15, v16, v17, v18, v19, v20);
}

uint64_t sub_2151E1244()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 560) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_2151E16D0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 160);
    swift_release();
    uint64_t v4 = sub_2151E136C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2151E136C()
{
  uint64_t v1 = (void (*)(uint64_t, void, uint64_t))v0[64];
  uint64_t v16 = v0[58];
  uint64_t v13 = v0[55];
  uint64_t v2 = v0[53];
  uint64_t v15 = v0[54];
  uint64_t v3 = v0[51];
  uint64_t v11 = v0[50];
  uint64_t v14 = v0[46];
  uint64_t v17 = v0[45];
  uint64_t v9 = v0[40];
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[66];
  uint64_t v4 = v0[38];
  uint64_t v8 = v0[39];
  uint64_t v12 = v0[16];
  uint64_t v5 = (void *)(v0[20] + v0[63]);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v1(v2, *MEMORY[0x263F36D08], v3);
  sub_2151F9C58();
  v10(v2, v3);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v9, *MEMORY[0x263F36AF8], v4);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  sub_2151F9E28();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  sub_2151F9B78();
  sub_2151F9CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v12, v11, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2151E16D0()
{
  uint64_t v1 = v0[70];
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[66];
  uint64_t v2 = v0[63];
  uint64_t v9 = (void (*)(uint64_t, void, uint64_t))v0[64];
  uint64_t v3 = v0[53];
  uint64_t v4 = v0[51];
  uint64_t v5 = v0[20];
  swift_release();
  __swift_project_boxed_opaque_existential_1((void *)(v5 + v2), *(void *)(v5 + v2 + 24));
  sub_2151FA038();
  v0[8] = 0;
  v0[9] = 0xE000000000000000;
  sub_2151F9E68();
  v0[12] = v1;
  v0[71] = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
  sub_2151FA0B8();
  v9(v3, *MEMORY[0x263F36D08], v4);
  sub_2151F9C78();
  swift_bridgeObjectRelease();
  v10(v3, v4);
  v0[72] = sub_2151D26B8();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[73] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2151E18A8;
  uint64_t v7 = v0[37];
  return sub_2151C2AF0(v7);
}

uint64_t sub_2151E18A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E19D4, v1, 0);
}

uint64_t sub_2151E19D4()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  v0[74] = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  uint64_t v3 = *(void *)(v1 + v2);
  v0[75] = v3;
  if (v3)
  {
    sub_2151F9678();
    sub_2151EE4C4(&qword_2678656D0, MEMORY[0x263F36B78]);
    swift_retain();
    uint64_t v4 = sub_2151F9EE8();
    uint64_t v6 = v5;
    uint64_t v7 = sub_2151E1B08;
    uint64_t v8 = v4;
    uint64_t v9 = v6;
  }
  else
  {
    uint64_t v10 = v0[34];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[46] + 56))(v10, 1, 1, v0[45]);
    sub_2151CEA98(v10, &qword_2678656B8);
    uint64_t v8 = v0[59];
    uint64_t v7 = sub_2151E1ED4;
    uint64_t v9 = 0;
  }
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_2151E1B08()
{
  sub_2151F9668();
  uint64_t v1 = *(void *)(v0 + 160);
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E1BB8, v1, 0);
}

uint64_t sub_2151E1BB8()
{
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v2 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 272);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v5(v1, v4, v2);
  if (sub_2151F9B68())
  {
    uint64_t v6 = *(unsigned int *)(v0 + 660);
    id v18 = *(id *)(v0 + 560);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    uint64_t v7 = *(void *)(v0 + 440);
    uint64_t v21 = *(void *)(v0 + 432);
    uint64_t v22 = *(void *)(v0 + 464);
    uint64_t v8 = *(void *)(v0 + 424);
    uint64_t v23 = *(void *)(v0 + 360);
    uint64_t v24 = *(void *)(v0 + 392);
    uint64_t v9 = *(void *)(v0 + 288);
    uint64_t v17 = *(void *)(v0 + 296);
    uint64_t v15 = *(void *)(v0 + 408);
    uint64_t v16 = *(void *)(v0 + 280);
    uint64_t v20 = *(void *)(v0 + 128);
    uint64_t v10 = (void *)(*(void *)(v0 + 160) + *(void *)(v0 + 504));
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    uint64_t v11 = sub_2151F9D58();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v8, v6, v11);
    sub_2151F9CD8();

    v19(v8, v15);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v22, v21);
    v5(v20, v24, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 368) + 8))(*(void *)(v0 + 392), *(void *)(v0 + 360));
    uint64_t v14 = *(void *)(v0 + 472);
    return MEMORY[0x270FA2498](sub_2151E1ED4, v14, 0);
  }
}

uint64_t sub_2151E1ED4()
{
  uint64_t v1 = v0[59];
  if (*(unsigned char *)(v1 + 136)) {
    goto LABEL_4;
  }
  uint64_t v3 = v0[46];
  uint64_t v2 = v0[47];
  uint64_t v4 = v0[45];
  uint64_t v5 = v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  swift_beginAccess();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v5, v4);
  char v7 = sub_2151F9B68();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if ((v7 & 1) == 0)
  {
LABEL_4:
    uint64_t v10 = v0[20];
    uint64_t v9 = sub_2151E23FC;
  }
  else
  {
    uint64_t v8 = v0[20];
    v6(v0[48], v5, v0[45]);
    uint64_t v9 = sub_2151E1FF8;
    uint64_t v10 = v8;
  }
  return MEMORY[0x270FA2498](v9, v10, 0);
}

uint64_t sub_2151E1FF8()
{
  uint64_t v1 = *(unsigned int *)(v0 + 660);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  uint64_t v10 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = (void *)(*(void *)(v0 + 160) + *(void *)(v0 + 504));
  (*(void (**)(void, void, void))(*(void *)(v0 + 368) + 32))(*(void *)(v0 + 128), *(void *)(v0 + 384), *(void *)(v0 + 360));
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  uint64_t v7 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v3, v1, v7);
  sub_2151F9CD8();
  v2(v3, v4);
  sub_2151F9B88();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 5, v8);
  return MEMORY[0x270FA2498](sub_2151E21A0, v10, 0);
}

uint64_t sub_2151E21A0()
{
  uint64_t v2 = v0[55];
  uint64_t v1 = v0[56];
  uint64_t v3 = v0[54];
  uint64_t v4 = v0[33];
  uint64_t v5 = v0[20];
  sub_2151F7448(v4, v1);
  sub_2151EE574(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[76] = v6;
  v0[77] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  return MEMORY[0x270FA2498](sub_2151E2274, v5, 0);
}

uint64_t sub_2151E2274()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 608);
  uint64_t v2 = *(void *)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v6 = *(void *)(v0 + 280);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2151E23FC()
{
  uint64_t v58 = *(void *)(v0 + 592);
  uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  uint64_t v1 = *(unsigned int *)(v0 + 656);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 512);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 160);
  __swift_project_boxed_opaque_existential_1((void *)(v5 + *(void *)(v0 + 504)), *(void *)(v5 + *(void *)(v0 + 504) + 24));
  v2(v3, v1, v4);
  sub_2151F9C68();
  v51(v3, v4);
  if (!*(void *)(v5 + v58))
  {
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    uint64_t v18 = *(unsigned int *)(v0 + 656);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 512);
    uint64_t v20 = *(void *)(v0 + 424);
    uint64_t v21 = *(void *)(v0 + 408);
    uint64_t v22 = (void *)(*(void *)(v0 + 160) + *(void *)(v0 + 504));
    __swift_project_boxed_opaque_existential_1(v22, v22[3]);
    v19(v20, v18, v21);
    sub_2151F9C88();
    v17(v20, v21);
    sub_2151F9588();
    if (MEMORY[0x2166B43F0]())
    {
      uint64_t v24 = *(void *)(v0 + 224);
      uint64_t v23 = *(void *)(v0 + 232);
      uint64_t v25 = *(void *)(v0 + 216);
      uint64_t v26 = sub_2151F9D48();
      sub_2151EE4C4(&qword_2678656D8, MEMORY[0x263F36CC8]);
      uint64_t v27 = (void *)swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F36CC0], v26);
      sub_2151F9E28();
      sub_2151F9508();
      sub_2151F9568();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    }
    (*(void (**)(void, void, void))(*(void *)(v0 + 248) + 104))(*(void *)(v0 + 256), *MEMORY[0x263F36B08], *(void *)(v0 + 240));
    goto LABEL_11;
  }
  uint64_t v6 = *(void **)(v0 + 560);
  *(void *)(v0 + 120) = v6;
  id v7 = v6;
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v29 = *(void *)(v0 + 560);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    unsigned int v45 = *(_DWORD *)(v0 + 656);
    uint64_t v46 = *(void (**)(uint64_t, void, uint64_t))(v0 + 512);
    uint64_t v30 = *(void *)(v0 + 424);
    uint64_t v31 = *(void *)(v0 + 408);
    uint64_t v32 = *(void *)(v0 + 248);
    uint64_t v49 = *(void *)(v0 + 240);
    uint64_t v53 = *(void *)(v0 + 256);
    uint64_t v33 = (void *)(*(void *)(v0 + 160) + *(void *)(v0 + 504));
    __swift_project_boxed_opaque_existential_1(v33, v33[3]);
    sub_2151FA038();
    *(void *)(v0 + 80) = 0;
    *(void *)(v0 + 88) = 0xE000000000000000;
    sub_2151F9E68();
    *(void *)(v0 + 112) = v29;
    sub_2151FA0B8();
    sub_2151F9E68();
    v46(v30, v45, v31);
    sub_2151F9C78();
    swift_bridgeObjectRelease();
    v56(v30, v31);
    (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v53, *MEMORY[0x263F36B10], v49);
LABEL_11:
    char v34 = 0;
    goto LABEL_12;
  }
  uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  uint64_t v8 = *(unsigned int *)(v0 + 656);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 512);
  uint64_t v10 = *(void *)(v0 + 424);
  uint64_t v11 = *(void *)(v0 + 408);
  uint64_t v12 = *(void *)(v0 + 248);
  uint64_t v48 = *(void *)(v0 + 240);
  uint64_t v52 = *(void *)(v0 + 256);
  uint64_t v13 = (void *)(*(void *)(v0 + 160) + *(void *)(v0 + 504));
  (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  v9(v10, v8, v11);
  sub_2151F9C78();
  v55(v10, v11);
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v52, *MEMORY[0x263F36B00], v48);
  sub_2151F9588();
  uint64_t v14 = MEMORY[0x2166B43F0]();
  *(void *)(v0 + 624) = v14;
  if (v14)
  {
    uint64_t v15 = *(void *)(v0 + 472);
    *(void *)(v0 + 632) = sub_2151F9D48();
    sub_2151EE4C4(&qword_2678656D8, MEMORY[0x263F36CC8]);
    *(void *)(v0 + 640) = swift_allocError();
    *(void *)(v0 + 648) = v16;
    return MEMORY[0x270FA2498](sub_2151E2BAC, v15, 0);
  }
  char v34 = 1;
LABEL_12:
  uint64_t v35 = *(void **)(v0 + 560);
  uint64_t v36 = *(void *)(v0 + 440);
  uint64_t v57 = *(void *)(v0 + 432);
  uint64_t v59 = *(void *)(v0 + 464);
  uint64_t v37 = *(void *)(v0 + 288);
  uint64_t v50 = *(void *)(v0 + 280);
  uint64_t v54 = *(void *)(v0 + 296);
  uint64_t v38 = *(void *)(v0 + 248);
  uint64_t v39 = *(void *)(v0 + 256);
  uint64_t v47 = *(void *)(v0 + 240);
  uint64_t v41 = *(void *)(v0 + 176);
  uint64_t v40 = *(void *)(v0 + 184);
  uint64_t v42 = *(void *)(v0 + 168);
  *(unsigned char *)(*(void *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut) = v34;
  sub_2151F9E28();
  sub_2151F9BC8();
  sub_2151F9BD8();

  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v47);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v54, v50);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v59, v57);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

uint64_t sub_2151E2BAC()
{
  uint64_t v1 = *(void *)(v0 + 160);
  (*(void (**)(void, void, void))(v0 + 488))(*(void *)(v0 + 448), *(void *)(v0 + 472) + *(void *)(v0 + 480), *(void *)(v0 + 432));
  return MEMORY[0x270FA2498](sub_2151E2C28, v1, 0);
}

uint64_t sub_2151E2C28()
{
  uint64_t v1 = (void *)v0[81];
  uint64_t v2 = v0[79];
  uint64_t v4 = v0[55];
  uint64_t v3 = v0[56];
  uint64_t v5 = v0[54];
  uint64_t v7 = v0[28];
  uint64_t v6 = v0[29];
  uint64_t v23 = (void *)v0[80];
  uint64_t v25 = v0[27];
  sub_2151F9948();
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  void *v1 = v9;
  (*(void (**)(void *, void, uint64_t))(*(void *)(v2 - 8) + 104))(v1, *MEMORY[0x263F36CB8], v2);
  sub_2151F9E28();
  sub_2151F9508();
  sub_2151F9568();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v25);

  uint64_t v10 = (void *)v0[70];
  uint64_t v11 = v0[55];
  uint64_t v24 = v0[54];
  uint64_t v26 = v0[58];
  uint64_t v12 = v0[36];
  uint64_t v21 = v0[35];
  uint64_t v22 = v0[37];
  uint64_t v13 = v0[31];
  uint64_t v14 = v0[32];
  uint64_t v20 = v0[30];
  uint64_t v16 = v0[22];
  uint64_t v15 = v0[23];
  uint64_t v17 = v0[21];
  *(unsigned char *)(v0[20] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut) = 1;
  sub_2151F9E28();
  sub_2151F9BC8();
  sub_2151F9BD8();

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v20);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v22, v21);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v26, v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_2151E2F4C()
{
  uint64_t v1 = v0[34];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[46] + 56))(v1, 1, 1, v0[45]);
  sub_2151CEA98(v1, &qword_2678656B8);
  uint64_t v2 = v0[59];
  return MEMORY[0x270FA2498](sub_2151E1ED4, v2, 0);
}

uint64_t sub_2151E2FE0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = a4 >> 1;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2151C3238;
  return sub_2151DD0AC(a1, a3, v7, 0);
}

uint64_t sub_2151E309C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v27 = a1;
  uint64_t v31 = sub_2151F9AC8();
  uint64_t v3 = *(void *)(v31 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v31);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = v7;
  uint64_t v8 = sub_2151F95A8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_2151F95B8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - v14;
  sub_2151F9AF8();
  sub_2151F95C8();
  uint64_t v16 = sub_2151F9F18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v31);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v18 = (v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (*(unsigned __int8 *)(v3 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v20 + v17, v13, v9);
  *(void *)(v20 + v18) = v28;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v20 + v19, v25, v31);
  uint64_t v21 = (void *)(v20 + ((v4 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v22 = v30;
  *uint64_t v21 = v29;
  v21[1] = v22;
  swift_retain();
  swift_retain();
  sub_2151D16EC((uint64_t)v26, (uint64_t)&unk_267865778, v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_2151E3414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 16) = a4;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v8 + 24) = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_2151E34CC;
  return sub_2151E5640(a6, a7, a8);
}

uint64_t sub_2151E34CC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151E35C8, 0, 0);
}

uint64_t sub_2151E35C8()
{
  sub_2151F9598();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151E3634(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = sub_2151F99D8();
  v3[11] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[12] = v5;
  v3[13] = *(void *)(v5 + 64);
  v3[14] = swift_task_alloc();
  uint64_t v6 = sub_2151F9758();
  v3[15] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[16] = v7;
  v3[17] = *(void *)(v7 + 64);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E3774, v2, 0);
}

uint64_t sub_2151E3774()
{
  uint64_t v1 = sub_2151D26B8()[9];
  swift_retain();
  swift_release();
  *(void *)(v0 + 160) = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_geoCoder);
  swift_retain();
  swift_release();
  sub_2151F9C48();
  sub_2151EE4C4(&qword_2678656B0, MEMORY[0x263F36CA0]);
  uint64_t v3 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151E386C, v3, v2);
}

uint64_t sub_2151E386C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  sub_2151F9C28();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E38E0, v1, 0);
}

uint64_t sub_2151E38E0()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v25 = v1;
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[15];
  uint64_t v6 = v0[12];
  uint64_t v22 = v0[17];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[8];
  uint64_t v23 = v0[9];
  uint64_t v9 = sub_2151F9E28();
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  uint64_t v24 = (void *)sub_2151F9DF8();
  uint64_t v11 = v1;
  uint64_t v12 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v11, v5);
  uint64_t v13 = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v8, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v15 = (v22 + *(unsigned __int8 *)(v6 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = (char *)swift_allocObject();
  *((void *)v16 + 2) = v21;
  *((void *)v16 + 3) = v20;
  *((void *)v16 + 4) = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v16[v14], v2, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(&v16[v15], v13, v7);
  v0[6] = sub_2151EE9E4;
  v0[7] = v16;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_2151E3FD4;
  v0[5] = &block_descriptor_91;
  unint64_t v17 = _Block_copy(v0 + 2);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v17);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v25, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

unint64_t sub_2151E3B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2151FB270;
  *(void *)(inited + 32) = 0x4965636976726573;
  *(void *)(inited + 40) = 0xE900000000000064;
  *(void *)(inited + 48) = sub_2151F9DF8();
  *(void *)(inited + 56) = 0x54656D6F6374756FLL;
  *(void *)(inited + 64) = 0xEB00000000657079;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, a3);
  *(void *)(inited + 80) = 0xD000000000000018;
  *(void *)(inited + 88) = 0x800000021520D980;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F96F8());
  strcpy((char *)(inited + 104), "geocodeErrors");
  *(_WORD *)(inited + 118) = -4864;
  *(void *)(inited + 120) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F96E8());
  *(void *)(inited + 128) = 0xD000000000000018;
  *(void *)(inited + 136) = 0x800000021520D9A0;
  *(void *)(inited + 144) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F9728());
  *(void *)(inited + 152) = 0xD00000000000001FLL;
  *(void *)(inited + 160) = 0x800000021520D9C0;
  *(void *)(inited + 168) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F9748());
  *(void *)(inited + 176) = 0xD00000000000001DLL;
  *(void *)(inited + 184) = 0x800000021520D9E0;
  *(void *)(inited + 192) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F9718());
  *(void *)(inited + 200) = 0xD000000000000011;
  *(void *)(inited + 208) = 0x800000021520DA00;
  *(void *)(inited + 216) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F9708());
  *(void *)(inited + 224) = 0xD000000000000021;
  *(void *)(inited + 232) = 0x800000021520DA20;
  *(void *)(inited + 240) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F9738());
  *(void *)(inited + 248) = 0xD000000000000021;
  *(void *)(inited + 256) = 0x800000021520DA50;
  *(void *)(inited + 264) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, sub_2151F96D8());
  unint64_t v5 = sub_2151D6B2C(inited);
  unint64_t v20 = v5;
  uint64_t v6 = sub_2151F9988();
  if (v7)
  {
  }
  else
  {
    id v8 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)&v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2151C99B0((uint64_t)v8, 0xD000000000000018, 0x800000021520DA80, isUniquelyReferenced_nonNull_native);
    unint64_t v20 = v5;
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = sub_2151F99B8();
  if (v11)
  {
  }
  else
  {
    id v12 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)&v10);
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_2151C99B0((uint64_t)v12, 0xD000000000000021, 0x800000021520DAA0, v13);
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = sub_2151F98C8();
  if (v15)
  {

    return v20;
  }
  else
  {
    id v16 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, *(double *)&v14);
    char v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_2151C99B0((uint64_t)v16, 0xD000000000000016, 0x800000021520DAD0, v17);
    unint64_t v18 = v20;
    swift_bridgeObjectRelease();
  }
  return v18;
}

id sub_2151E3FD4(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_2151EE84C();
    uint64_t v4 = (void *)sub_2151F9D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_2151E4060()
{
  v1[11] = v0;
  uint64_t v2 = sub_2151F99D8();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E4120, v0, 0);
}

uint64_t sub_2151E4120()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 88) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 120) = v1;
  return MEMORY[0x270FA2498](sub_2151E414C, v1, 0);
}

uint64_t sub_2151E414C()
{
  uint64_t v1 = *(void *)(v0 + 120);
  *(unsigned char *)(v0 + 128) = *(unsigned char *)(v1 + 112);
  return MEMORY[0x270FA2498](sub_2151E4170, v1, 0);
}

uint64_t sub_2151E4170()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[15] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  return MEMORY[0x270FA2498](sub_2151E422C, v4, 0);
}

uint64_t sub_2151E422C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  double v6 = COERCE_DOUBLE(sub_2151F9968());
  char v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v5);
  if (v8) {
    double v9 = -1.0;
  }
  else {
    double v9 = v6;
  }
  uint64_t v10 = (void *)sub_2151F9DF8();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = v1;
  *(double *)(v11 + 32) = v9;
  *(void *)(v0 + 48) = sub_2151EE828;
  *(void *)(v0 + 56) = v11;
  *(void *)(v0 + 16) = MEMORY[0x263EF8330];
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_2151E3FD4;
  *(void *)(v0 + 40) = &block_descriptor;
  id v12 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);

  swift_task_dealloc();
  char v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

unint64_t sub_2151E43B8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = sub_2151F9D58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2151FB1E0;
  *(void *)(inited + 32) = 0x4965636976726573;
  *(void *)(inited + 40) = 0xE900000000000064;
  sub_2151F9E28();
  uint64_t v11 = sub_2151F9DF8();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v11;
  *(void *)(inited + 56) = 0x7954656372756F73;
  *(void *)(inited + 64) = 0xEA00000000006570;
  *(void *)(inited + 72) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a2);
  *(void *)(inited + 80) = 0xD000000000000013;
  *(void *)(inited + 88) = 0x800000021520D910;
  *(void *)(inited + 96) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a3);
  unint64_t v12 = sub_2151D6B2C(inited);
  __swift_project_boxed_opaque_existential_1((void *)(a1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(a1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  unint64_t v15 = 0;
  unint64_t v16 = 0xE000000000000000;
  sub_2151FA038();
  swift_bridgeObjectRelease();
  unint64_t v15 = 0xD00000000000001CLL;
  unint64_t v16 = 0x800000021520D930;
  sub_2151EE84C();
  sub_2151F9D98();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F36D28], v6);
  sub_2151F9CC8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

uint64_t sub_2151E4660(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 64) = a2;
  *(void *)(v4 + 72) = v3;
  *(unsigned char *)(v4 + 257) = a3;
  *(void *)(v4 + 56) = a1;
  uint64_t v5 = sub_2151F9B38();
  *(void *)(v4 + 80) = v5;
  *(void *)(v4 + 88) = *(void *)(v5 - 8);
  *(void *)(v4 + 96) = swift_task_alloc();
  uint64_t v6 = sub_2151F9D58();
  *(void *)(v4 + 104) = v6;
  *(void *)(v4 + 112) = *(void *)(v6 - 8);
  *(void *)(v4 + 120) = swift_task_alloc();
  uint64_t v7 = sub_2151F9778();
  *(void *)(v4 + 128) = v7;
  *(void *)(v4 + 136) = *(void *)(v7 - 8);
  *(void *)(v4 + 144) = swift_task_alloc();
  *(void *)(v4 + 152) = swift_task_alloc();
  uint64_t v8 = sub_2151F9BB8();
  *(void *)(v4 + 160) = v8;
  *(void *)(v4 + 168) = *(void *)(v8 - 8);
  *(void *)(v4 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E484C, v3, 0);
}

uint64_t sub_2151E484C()
{
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 160);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, *(void *)(v0 + 64), v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x263F36C90])
  {
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v6 = *(void *)(v0 + 152);
    uint64_t v7 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 136);
    int v9 = *(unsigned __int8 *)(v0 + 257);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 168) + 96))(v5, *(void *)(v0 + 160));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    uint64_t v54 = *(void *)(v0 + 176);
    if (v9 == 1)
    {
      uint64_t v10 = *(void *)(v0 + 136);
      uint64_t v12 = *(void *)(v0 + 112);
      uint64_t v11 = *(void *)(v0 + 120);
      uint64_t v13 = *(void *)(v0 + 104);
      uint64_t v49 = *(void *)(v0 + 72);
      uint64_t v52 = *(void *)(v0 + 128);
      uint64_t v48 = *(void *)(v0 + 152);
      __swift_project_boxed_opaque_existential_1((void *)(v49 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v49 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      sub_2151FA038();
      sub_2151F9E68();
      sub_2151F9768();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, *MEMORY[0x263F36D18], v13);
      sub_2151F9C68();
      unint64_t v14 = 0x267865000;
      swift_bridgeObjectRelease();
      unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      uint64_t v16 = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v15(v11, v13);
      uint64_t v17 = sub_2151F9768();
      unint64_t v18 = (uint64_t *)(v49 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
      uint64_t *v18 = v17;
      v18[1] = v19;
      swift_bridgeObjectRelease();
      unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v20(v48, v52);
      v20(v54, v52);
    }
    else
    {
      uint64_t v31 = *(void *)(v0 + 136);
      uint64_t v32 = *(void *)(v0 + 144);
      uint64_t v34 = *(void *)(v0 + 120);
      uint64_t v33 = *(void *)(v0 + 128);
      uint64_t v35 = *(void *)(v0 + 112);
      uint64_t v36 = *(void *)(v0 + 72);
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      uint64_t v51 = *(void *)(v0 + 104);
      v37(*(void *)(v0 + 152), v33);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v32, v54, v33);
      __swift_project_boxed_opaque_existential_1((void *)(v36 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v36 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      sub_2151FA038();
      sub_2151F9E68();
      sub_2151F9768();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))(v34, *MEMORY[0x263F36D18], v51);
      sub_2151F9C68();
      swift_bridgeObjectRelease();
      unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      uint64_t v16 = (v35 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v15(v34, v51);
      unint64_t v14 = 0x267865000;
      v37(v32, v33);
    }
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 168);
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 160);
    uint64_t v25 = *(void *)(v0 + 112);
    uint64_t v24 = *(void *)(v0 + 120);
    uint64_t v55 = *(void *)(v0 + 104);
    if (v4 == *MEMORY[0x263F36C88])
    {
      uint64_t v27 = *(void *)(v0 + 88);
      uint64_t v26 = *(void *)(v0 + 96);
      uint64_t v28 = *(void *)(v0 + 72);
      uint64_t v29 = *(void *)(v0 + 80);
      uint64_t v50 = v29;
      uint64_t v53 = v27;
      (*(void (**)(uint64_t, uint64_t))(v21 + 96))(v22, v23);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v22, v29);
      unint64_t v14 = 0x267865000uLL;
      __swift_project_boxed_opaque_existential_1((void *)(v28 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v28 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      sub_2151FA038();
      sub_2151F9E68();
      *(void *)(v0 + 48) = sub_2151F9B28();
      sub_2151FA108();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v24, *MEMORY[0x263F36D18], v55);
      sub_2151F9C78();
      swift_bridgeObjectRelease();
      unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      uint64_t v16 = (v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v15(v24, v55);
      uint64_t v30 = (void *)(v28 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
      void *v30 = 0;
      v30[1] = 0;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v26, v50);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(*(void *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      uint64_t v38 = *MEMORY[0x263F36D28];
      uint64_t v39 = sub_2151F9D58();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v24, v38, v39);
      sub_2151F9CE8();
      unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      uint64_t v16 = (v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v15(v24, v55);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v23);
      unint64_t v14 = 0x267865000uLL;
    }
  }
  uint64_t v41 = *(void *)(v0 + 112);
  uint64_t v40 = *(void *)(v0 + 120);
  uint64_t v42 = *(void *)(v0 + 104);
  uint64_t v43 = *(void *)(v0 + 72);
  uint64_t v44 = *(void *)(v14 + 1272);
  *(void *)(v0 + 184) = v15;
  *(void *)(v0 + 192) = v44;
  __swift_project_boxed_opaque_existential_1((void *)(v43 + v44), *(void *)(v43 + v44 + 24));
  (*(void (**)(uint64_t, void, uint64_t))(v41 + 104))(v40, *MEMORY[0x263F36D20], v42);
  sub_2151F9C68();
  *(void *)(v0 + 200) = v16;
  v15(v40, v42);
  unsigned int v45 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v45;
  *unsigned int v45 = v0;
  v45[1] = sub_2151E4F94;
  uint64_t v46 = *(void *)(v0 + 56);
  return sub_2151E8600(v46);
}

uint64_t sub_2151E4F94()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0) {
    int v4 = sub_2151E5478;
  }
  else {
    int v4 = sub_2151E50C0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2151E50C0()
{
  *(void *)(v0 + 224) = *(void *)(*(void *)(v0 + 72)
                                    + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  return MEMORY[0x270FA2498](sub_2151E513C, 0, 0);
}

uint64_t sub_2151E513C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 224) + 64);
  *(void *)(v0 + 232) = v1;
  return MEMORY[0x270FA2498](sub_2151E5160, v1, 0);
}

uint64_t sub_2151E5160()
{
  uint64_t v1 = *(void *)(v0[29] + 120);
  v0[30] = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[31] = v2;
    void *v2 = v0;
    v2[1] = sub_2151E52B0;
    uint64_t v3 = MEMORY[0x263F8EE60] + 8;
    uint64_t v4 = MEMORY[0x263F8E628];
    uint64_t v5 = MEMORY[0x263F8E658];
    return MEMORY[0x270FA1FB8](v0 + 32, v1, v3, v4, v5);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2151E52B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 232);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E53DC, v1, 0);
}

uint64_t sub_2151E53DC()
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

uint64_t sub_2151E5478()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[23];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = (void *)(v0[9] + v0[24]);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2151FA038();
  sub_2151F9E68();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v5 = *MEMORY[0x263F36D28];
  uint64_t v6 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v2, v5, v6);
  sub_2151F9D08();
  swift_bridgeObjectRelease();

  v8(v2, v3);
  v0[28] = *(void *)(v0[9] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  return MEMORY[0x270FA2498](sub_2151E513C, 0, 0);
}

uint64_t sub_2151E5640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[22] = a3;
  v4[23] = v3;
  v4[20] = a1;
  v4[21] = a2;
  uint64_t v5 = sub_2151F9618();
  v4[24] = v5;
  v4[25] = *(void *)(v5 - 8);
  v4[26] = swift_task_alloc();
  uint64_t v6 = sub_2151F9BB8();
  v4[27] = v6;
  v4[28] = *(void *)(v6 - 8);
  v4[29] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v4[30] = swift_task_alloc();
  uint64_t v7 = sub_2151F99D8();
  v4[31] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[32] = v8;
  v4[33] = *(void *)(v8 + 64);
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E5800, v3, 0);
}

uint64_t sub_2151E5800()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = *(void *)(v0[23] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[36] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 3, 5, v3);
  return MEMORY[0x270FA2498](sub_2151E58BC, v2, 0);
}

uint64_t sub_2151E58BC()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[23];
  sub_2151F7448(v1, v0[35]);
  sub_2151EE574(v1, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  return MEMORY[0x270FA2498](sub_2151E5954, v2, 0);
}

uint64_t sub_2151E5954()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[23];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[35], v3);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  v0[37] = v6;
  *(void *)(v6 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[38] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2151E5A98;
  uint64_t v8 = v0[29];
  uint64_t v9 = v0[20];
  return sub_2151E072C(v8, v9, (uint64_t)&unk_267865678, v6);
}

uint64_t sub_2151E5A98()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E5BC4, v1, 0);
}

uint64_t sub_2151E5BC4()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  unint64_t v15 = (void (*)(uint64_t))v0[21];
  sub_2151CC6F4(v0[23] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)(v0 + 14));
  __swift_project_boxed_opaque_existential_1(v0 + 14, v0[17]);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F36AD8], v3);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  sub_2151F9E28();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865680);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2151FB250;
  *(void *)(inited + 32) = 0x64616F6C796170;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = sub_2151F9BA8();
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 64) = 1684632436;
  *(void *)(inited + 72) = 0xE400000000000000;
  uint64_t v6 = sub_2151F9B78();
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  *(void *)(inited + 80) = v8;
  *(void *)(inited + 88) = v9;
  v0[19] = sub_2151D6A08(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865688);
  sub_2151EE784();
  sub_2151F9C98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 14));
  uint64_t v10 = sub_2151F9BA8();
  v15(v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[39] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_2151E5E70;
  uint64_t v12 = v0[35];
  uint64_t v13 = v0[29];
  return sub_2151E4660(v12, v13, 1);
}

uint64_t sub_2151E5E70()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151E5F80, v1, 0);
}

uint64_t sub_2151E5F80()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[31];
  uint64_t v3 = v0[32];
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2151E6058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_2151F9D58();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E611C, 0, 0);
}

uint64_t sub_2151E611C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  __swift_project_boxed_opaque_existential_1((void *)(v0[3] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[3] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F36D18], v3);
  sub_2151F9C68();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151BE8C8;
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[2];
  return sub_2151E4660(v5, v6, 0);
}

uint64_t sub_2151E6258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  v4[10] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656B8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_2151F9BB8();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_2151F9808();
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656E8);
  v4[20] = swift_task_alloc();
  sub_2151F9AC8();
  v4[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678656E0);
  v4[22] = swift_task_alloc();
  uint64_t v8 = sub_2151F9A98();
  v4[23] = v8;
  v4[24] = *(void *)(v8 - 8);
  v4[25] = swift_task_alloc();
  uint64_t v9 = sub_2151F99D8();
  v4[26] = v9;
  v4[27] = *(void *)(v9 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  uint64_t v10 = sub_2151F9D58();
  v4[30] = v10;
  v4[31] = *(void *)(v10 - 8);
  v4[32] = swift_task_alloc();
  uint64_t v11 = sub_2151F9A48();
  v4[33] = v11;
  v4[34] = *(void *)(v11 - 8);
  v4[35] = swift_task_alloc();
  uint64_t v12 = sub_2151F98A8();
  v4[36] = v12;
  v4[37] = *(void *)(v12 - 8);
  v4[38] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E667C, a4, 0);
}

uint64_t sub_2151E667C()
{
  *(void *)(v0 + 312) = *(void *)(*(void *)(v0 + 72)
                                    + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_2151F9858();
  sub_2151EE4C4(&qword_2678652E0, MEMORY[0x263F36C28]);
  swift_retain();
  uint64_t v2 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151E6758, v2, v1);
}

uint64_t sub_2151E6758()
{
  sub_2151F9818();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v1;
  void *v1 = v0;
  v1[1] = sub_2151E67F8;
  return sub_2151D2800();
}

uint64_t sub_2151E67F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 328) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151E6910, v2, 0);
}

uint64_t sub_2151E6910()
{
  sub_2151F9888();
  v0[42] = sub_2151D26B8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[43] = v1;
  void *v1 = v0;
  v1[1] = sub_2151E69C4;
  uint64_t v2 = v0[35];
  return sub_2151C2AF0(v2);
}

uint64_t sub_2151E69C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E6AF0, v1, 0);
}

uint64_t sub_2151E6AF0()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v22 = *(void *)(v0 + 240);
  uint64_t v7 = sub_2151F9A38();
  uint64_t v21 = v8;
  *(void *)(v0 + 352) = v7;
  *(void *)(v0 + 360) = v8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  uint64_t v9 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(void *)(v0 + 368) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  uint64_t v10 = (void *)(v6 + v9);
  __swift_project_boxed_opaque_existential_1((void *)(v6 + v9), *(void *)(v6 + v9 + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
  sub_2151F9D98();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v11 = *MEMORY[0x263F36D20];
  *(_DWORD *)(v0 + 528) = v11;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104);
  *(void *)(v0 + 376) = v12;
  *(void *)(v0 + 384) = (v5 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v12(v3, v11, v22);
  sub_2151F9CB8();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(void *)(v0 + 392) = v13;
  *(void *)(v0 + 400) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v3, v22);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_2151FA038();
  sub_2151F9E68();
  MEMORY[0x2166B4D50](v21, MEMORY[0x263F8D310]);
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  v12(v3, v11, v22);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  v13(v3, v22);
  uint64_t v14 = *(void *)(v6 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(void *)(v0 + 408) = v14;
  if (v14)
  {
    swift_retain();
    unint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 416) = v15;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    *unint64_t v15 = v0;
    v15[1] = sub_2151E6E74;
    uint64_t v17 = MEMORY[0x263F8EE60] + 8;
    uint64_t v18 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v16, v14, v17, v16, v18);
  }
  else
  {
    uint64_t v19 = *(void *)(*(void *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    *(void *)(v0 + 432) = v19;
    return MEMORY[0x270FA2498](sub_2151E7030, v19, 0);
  }
}

uint64_t sub_2151E6E74()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 424) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 72);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = sub_2151E817C;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 72);
    uint64_t v4 = sub_2151E6FB8;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151E6FB8()
{
  swift_release();
  uint64_t v1 = *(void *)(*(void *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 432) = v1;
  return MEMORY[0x270FA2498](sub_2151E7030, v1, 0);
}

uint64_t sub_2151E7030()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[54] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  return MEMORY[0x270FA2498](sub_2151E70F0, v4, 0);
}

uint64_t sub_2151E70F0()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[22];
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 16))(v3, v0[38], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v3, 0, 1, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[55] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151E71F0;
  return sub_2151D2800();
}

uint64_t sub_2151E71F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 448) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151E7308, v2, 0);
}

uint64_t sub_2151E7308()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[16];
  uint64_t v15 = v0[9];
  sub_2151F9AA8();
  uint64_t v6 = sub_2151F9638();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  uint64_t v7 = *MEMORY[0x263F36C08];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 104);
  v8(v2, v7, v5);
  v8(v4, v7, v5);
  sub_2151F9A88();
  uint64_t v9 = *(void *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  v0[57] = v9;
  if (v9)
  {
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x263F36B70] + MEMORY[0x263F36B70]);
    swift_retain();
    uint64_t v10 = (void *)swift_task_alloc();
    v0[58] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_2151E7578;
    uint64_t v11 = v0[25];
    uint64_t v12 = v0[12];
    return v16(v12, v11);
  }
  else
  {
    uint64_t v14 = v0[12];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[14] + 56))(v14, 1, 1, v0[13]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2151CEA98(v14, &qword_2678656B8);
    v0[60] = sub_2151D26B8();
    return MEMORY[0x270FA2498](sub_2151E7988, 0, 0);
  }
}

uint64_t sub_2151E7578()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0)
  {

    swift_release();
    uint64_t v4 = sub_2151E8340;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_2151E76D4;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2151E76D4()
{
  uint64_t v1 = v0[54];
  uint64_t v2 = v0[44];
  uint64_t v4 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v6 = v0[12];
  uint64_t v5 = v0[13];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v3, v6, v5);
  v0[59] = sub_2151ECCFC(v2);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2151E77A8, v1, 0);
}

uint64_t sub_2151E77A8()
{
  uint64_t v1 = v0[59];
  uint64_t v2 = v0[45];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[28];
  uint64_t v5 = v0[26];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[11];
  uint64_t v10 = v0[9];
  sub_2151F9B88();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 5, v8);
  sub_2151F7448(v7, v4);
  sub_2151EE574(v7, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  sub_2151F5F74(*(void *)(v2 + 16), *(void *)(v1 + 16), 0, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2151E7904, v10, 0);
}

uint64_t sub_2151E7904()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  v0[60] = sub_2151D26B8();
  return MEMORY[0x270FA2498](sub_2151E7988, 0, 0);
}

uint64_t sub_2151E7988()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 480) + 64);
  *(void *)(v0 + 488) = v1;
  return MEMORY[0x270FA2498](sub_2151E79AC, v1, 0);
}

uint64_t sub_2151E79AC()
{
  *(unsigned char *)(v0 + 532) = sub_2151C0A84() & 1;
  return MEMORY[0x270FA2498](sub_2151E7A1C, 0, 0);
}

uint64_t sub_2151E7A1C()
{
  if (*(unsigned char *)(v0 + 532) == 1
    && (uint64_t v1 = MEMORY[0x2166B57A0](*(void *)(v0 + 480) + 96), (*(void *)(v0 + 496) = v1) != 0))
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_2151E7AB8;
  }
  else
  {
    swift_release();
    uint64_t v2 = *(void *)(v0 + 72);
    uint64_t v3 = sub_2151E7D0C;
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

uint64_t sub_2151E7AB8()
{
  uint64_t v1 = *(void *)(v0 + 496);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
  uint64_t v3 = *(unsigned int *)(v0 + 528);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v11 = *(void *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  v2(v4, v3, v5);
  sub_2151F9C68();
  v10(v4, v5);
  uint64_t v6 = sub_2151F9F18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v11, 1, 1, v6);
  uint64_t v7 = sub_2151EE4C4(&qword_267865340, (void (*)(uint64_t))type metadata accessor for ODISessionInternal);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v1;
  v8[3] = v7;
  v8[4] = v1;
  swift_retain_n();
  sub_2151D16EC(v11, (uint64_t)&unk_267865348, (uint64_t)v8);
  swift_release();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151E7CA4, 0, 0);
}

uint64_t sub_2151E7CA4()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 72);
  return MEMORY[0x270FA2498](sub_2151E7D0C, v1, 0);
}

uint64_t sub_2151E7D0C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 392);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 376);
  uint64_t v3 = *(unsigned int *)(v0 + 528);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = (void *)(*(void *)(v0 + 72) + *(void *)(v0 + 368));
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v2(v4, v3, v5);
  sub_2151F9C68();
  v1(v4, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 504) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2151E7E44;
  uint64_t v8 = *(void *)(v0 + 232);
  return sub_2151E8600(v8);
}

uint64_t sub_2151E7E44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 512) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v4 = sub_2151E83FC;
  }
  else {
    uint64_t v4 = sub_2151E7F70;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2151E7F70()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  uint64_t v5 = v0[9];
  (*(void (**)(void, void))(v1 + 8))(v0[38], v0[36]);
  uint64_t v6 = *(void *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[65] = v6;
  return MEMORY[0x270FA2498](sub_2151E803C, v6, 0);
}

uint64_t sub_2151E803C()
{
  *(unsigned char *)(*(void *)(v0 + 520) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTriggered) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2151E817C()
{
  (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
  uint64_t v1 = *(void **)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v3 = (void *)(*(void *)(v0 + 72) + *(void *)(v0 + 368));
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v4 = *MEMORY[0x263F36D28];
  uint64_t v5 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v2, v4, v5);
  sub_2151F9D08();
  swift_bridgeObjectRelease();

  uint64_t v6 = *(void *)(v0 + 72);
  (*(void (**)(void, void))(v0 + 392))(*(void *)(v0 + 256), *(void *)(v0 + 240));
  uint64_t v7 = *(void *)(v6 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 520) = v7;
  return MEMORY[0x270FA2498](sub_2151E803C, v7, 0);
}

uint64_t sub_2151E8340()
{
  uint64_t v1 = v0[12];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[14] + 56))(v1, 1, 1, v0[13]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2151CEA98(v1, &qword_2678656B8);
  v0[60] = sub_2151D26B8();
  return MEMORY[0x270FA2498](sub_2151E7988, 0, 0);
}

uint64_t sub_2151E83FC()
{
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 216);
  (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = *(void **)(v0 + 512);
  uint64_t v8 = *(void *)(v0 + 256);
  uint64_t v9 = (void *)(*(void *)(v0 + 72) + *(void *)(v0 + 368));
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v10 = *MEMORY[0x263F36D28];
  uint64_t v11 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(v8, v10, v11);
  sub_2151F9D08();
  swift_bridgeObjectRelease();

  uint64_t v12 = *(void *)(v0 + 72);
  (*(void (**)(void, void))(v0 + 392))(*(void *)(v0 + 256), *(void *)(v0 + 240));
  uint64_t v13 = *(void *)(v12 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 520) = v13;
  return MEMORY[0x270FA2498](sub_2151E803C, v13, 0);
}

uint64_t sub_2151E8600(uint64_t a1)
{
  v2[23] = a1;
  v2[24] = v1;
  uint64_t v3 = sub_2151F9A58();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678654D0);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  v2[30] = v4;
  v2[31] = *(void *)(v4 - 8);
  v2[32] = swift_task_alloc();
  uint64_t v5 = sub_2151F9D58();
  v2[33] = v5;
  v2[34] = *(void *)(v5 - 8);
  v2[35] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v2[36] = swift_task_alloc();
  uint64_t v6 = sub_2151F99D8();
  v2[37] = v6;
  v2[38] = *(void *)(v6 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151E8868, v1, 0);
}

uint64_t sub_2151E8868()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[38];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[24];
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[43] = v7;
  v0[44] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v5, v3);
  sub_2151F9928();
  v7(v1, v2, v3);
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[45] = v8;
  return MEMORY[0x270FA2498](sub_2151E8930, v8, 0);
}

uint64_t sub_2151E8930()
{
  uint64_t v1 = v0[45];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[43];
  uint64_t v3 = v0[40];
  uint64_t v4 = v0[37];
  uint64_t v5 = v0[24];
  uint64_t v6 = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v0[46] = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  uint64_t v7 = v1 + v6;
  swift_beginAccess();
  v2(v3, v7, v4);
  return MEMORY[0x270FA2498](sub_2151E89EC, v5, 0);
}

uint64_t sub_2151E89EC()
{
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 328);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 304);
  char v5 = sub_2151F9958();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(void *)(v0 + 376) = v6;
  *(void *)(v0 + 384) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v3);
  v6(v2, v3);
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 360);
    uint64_t v8 = *(void *)(v0 + 288);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 4, 5, v9);
    uint64_t v10 = sub_2151E908C;
    uint64_t v11 = v7;
LABEL_3:
    return MEMORY[0x270FA2498](v10, v11, 0);
  }
  uint64_t v12 = *(void *)(v0 + 192);
  sub_2151F9948();
  sub_2151F9978();
  char v14 = v13;
  uint64_t v15 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(void *)(v0 + 392) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  uint64_t v16 = (void *)(v12 + v15);
  sub_2151CC6F4((uint64_t)v16, v0 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_2151FA038();
  sub_2151F9E68();
  uint64_t v49 = v16;
  if ((v14 & 1) == 0) {
    sub_2151F9F88();
  }
  uint64_t v18 = *(void *)(v0 + 272);
  uint64_t v17 = *(void *)(v0 + 280);
  uint64_t v19 = *(void *)(v0 + 264);
  uint64_t v45 = *(void *)(v0 + 248);
  uint64_t v47 = *(void *)(v0 + 240);
  uint64_t v43 = *(void *)(v0 + 192);
  uint64_t v44 = *(void *)(v0 + 232);
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  unsigned int v42 = *MEMORY[0x263F36CF0];
  unint64_t v20 = *(void (**)(uint64_t))(v18 + 104);
  v20(v17);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  *(void *)(v0 + 400) = v21;
  *(void *)(v0 + 408) = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v17, v19);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_2151FA038();
  sub_2151F9E68();
  sub_2151F9F88();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  uint64_t v22 = v20;
  ((void (*)(uint64_t, void, uint64_t))v20)(v17, v42, v19);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  v21(v17, v19);
  uint64_t v23 = v43 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
  swift_beginAccess();
  sub_2151EF818(v23, v44, &qword_2678654D0);
  int v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v44, 1, v47);
  uint64_t v25 = *(void *)(v0 + 232);
  if (v24 == 1)
  {
    (*(void (**)(void, void))(v0 + 376))(*(void *)(v0 + 336), *(void *)(v0 + 296));
    sub_2151CEA98(v25, &qword_2678654D0);
  }
  else
  {
    uint64_t v48 = v21;
    uint64_t v26 = *(void *)(v0 + 256);
    uint64_t v27 = *(void *)(v0 + 240);
    sub_2151EF87C(v25, v26, type metadata accessor for ODISessionInternal.PendingFeedback);
    uint64_t v28 = *(int *)(v27 + 20);
    *(_DWORD *)(v0 + 472) = v28;
    uint64_t v29 = v26 + v28;
    if (sub_2151F9958())
    {
      uint64_t v30 = *(void *)(v0 + 280);
      uint64_t v31 = *(void *)(v0 + 264);
      uint64_t v46 = *(void **)(v0 + 256);
      __swift_project_boxed_opaque_existential_1(v49, v49[3]);
      ((void (*)(uint64_t, void, uint64_t))v22)(v30, *MEMORY[0x263F36D20], v31);
      sub_2151F9C68();
      v48(v30, v31);
      if (*v46)
      {
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
        sub_2151F9F38();
        swift_release();
      }
      uint64_t v32 = *(void *)(v0 + 360);
      uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 344);
      uint64_t v34 = *(void *)(v0 + 328);
      uint64_t v35 = *(void *)(v0 + 296);
      uint64_t v36 = *(void *)(v0 + 224);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 248) + 56))(v36, 1, 1, *(void *)(v0 + 240));
      swift_beginAccess();
      sub_2151EE50C(v36, v23);
      swift_endAccess();
      v33(v34, v29, v35);
      uint64_t v10 = sub_2151E9720;
      uint64_t v11 = v32;
      goto LABEL_3;
    }
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    uint64_t v38 = *(void *)(v0 + 336);
    uint64_t v39 = *(void *)(v0 + 296);
    sub_2151EE574(*(void *)(v0 + 256), type metadata accessor for ODISessionInternal.PendingFeedback);
    v37(v38, v39);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v40 = *(uint64_t (**)(void))(v0 + 8);
  return v40();
}

uint64_t sub_2151E908C()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[47];
  uint64_t v2 = v0[41];
  uint64_t v4 = v0[36];
  uint64_t v3 = v0[37];
  uint64_t v5 = v0[24];
  sub_2151F7448(v4, v2);
  sub_2151EE574(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  v1(v2, v3);
  return MEMORY[0x270FA2498](sub_2151E914C, v5, 0);
}

uint64_t sub_2151E914C()
{
  uint64_t v1 = *(void *)(v0 + 192);
  sub_2151F9948();
  sub_2151F9978();
  char v3 = v2;
  uint64_t v4 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(void *)(v0 + 392) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  uint64_t v5 = v1 + v4;
  sub_2151CC6F4(v5, v0 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_2151FA038();
  sub_2151F9E68();
  uint64_t v37 = (void *)v5;
  if ((v3 & 1) == 0) {
    sub_2151F9F88();
  }
  uint64_t v6 = *(void *)(v0 + 272);
  uint64_t v7 = *(void *)(v0 + 280);
  uint64_t v8 = *(void *)(v0 + 264);
  uint64_t v34 = *(void *)(v0 + 248);
  uint64_t v35 = *(void *)(v0 + 240);
  uint64_t v32 = *(void *)(v0 + 192);
  uint64_t v33 = *(void *)(v0 + 232);
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  unsigned int v31 = *MEMORY[0x263F36CF0];
  uint64_t v9 = *(void (**)(uint64_t))(v6 + 104);
  v9(v7);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v0 + 400) = v10;
  *(void *)(v0 + 408) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v7, v8);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  sub_2151FA038();
  sub_2151F9E68();
  sub_2151F9F88();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  ((void (*)(uint64_t, void, uint64_t))v9)(v7, v31, v8);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v11 = v7;
  uint64_t v12 = v10;
  v10(v11, v8);
  uint64_t v13 = v32 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
  swift_beginAccess();
  sub_2151EF818(v13, v33, &qword_2678654D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v33, 1, v35) == 1)
  {
    uint64_t v14 = *(void *)(v0 + 232);
    (*(void (**)(void, void))(v0 + 376))(*(void *)(v0 + 336), *(void *)(v0 + 296));
    sub_2151CEA98(v14, &qword_2678654D0);
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  uint64_t v15 = *(void *)(v0 + 256);
  uint64_t v16 = *(void *)(v0 + 240);
  sub_2151EF87C(*(void *)(v0 + 232), v15, type metadata accessor for ODISessionInternal.PendingFeedback);
  uint64_t v17 = *(int *)(v16 + 20);
  *(_DWORD *)(v0 + 472) = v17;
  uint64_t v18 = v15 + v17;
  if ((sub_2151F9958() & 1) == 0)
  {
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    uint64_t v27 = *(void *)(v0 + 336);
    uint64_t v28 = *(void *)(v0 + 296);
    sub_2151EE574(*(void *)(v0 + 256), type metadata accessor for ODISessionInternal.PendingFeedback);
    v26(v27, v28);
    goto LABEL_12;
  }
  uint64_t v19 = *(void *)(v0 + 280);
  uint64_t v20 = *(void *)(v0 + 264);
  uint64_t v36 = *(void **)(v0 + 256);
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  ((void (*)(uint64_t, void, uint64_t))v9)(v19, *MEMORY[0x263F36D20], v20);
  sub_2151F9C68();
  v12(v19, v20);
  if (*v36)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    sub_2151F9F38();
    swift_release();
  }
  uint64_t v21 = *(void *)(v0 + 360);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 344);
  uint64_t v23 = *(void *)(v0 + 328);
  uint64_t v24 = *(void *)(v0 + 296);
  uint64_t v25 = *(void *)(v0 + 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 248) + 56))(v25, 1, 1, *(void *)(v0 + 240));
  swift_beginAccess();
  sub_2151EE50C(v25, v13);
  swift_endAccess();
  v22(v23, v18, v24);
  return MEMORY[0x270FA2498](sub_2151E9720, v21, 0);
}

uint64_t sub_2151E9720()
{
  uint64_t v1 = *(void *)(v0 + 192);
  (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 320), *(void *)(v0 + 360) + *(void *)(v0 + 368), *(void *)(v0 + 296));
  return MEMORY[0x270FA2498](sub_2151E979C, v1, 0);
}

uint64_t sub_2151E979C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v4 = *(void *)(v0 + 296);
  char v5 = sub_2151F9958();
  v1(v2, v4);
  v1(v3, v4);
  if (v5)
  {
    uint64_t v6 = *(void *)(v0 + 360);
    uint64_t v7 = *(void *)(v0 + 288);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 4, 5, v8);
    uint64_t v9 = sub_2151E9AF4;
    uint64_t v10 = v6;
LABEL_3:
    return MEMORY[0x270FA2498](v9, v10, 0);
  }
  (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 312), *(void *)(v0 + 256) + *(int *)(v0 + 472), *(void *)(v0 + 296));
  sub_2151F9928();
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(void *)(v0 + 416) = v12;
  if (v12)
  {
    swift_retain();
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 424) = v13;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    void *v13 = v0;
    v13[1] = sub_2151E9E28;
    uint64_t v15 = MEMORY[0x263F8EE60] + 8;
    uint64_t v16 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v14, v12, v15, v14, v16);
  }
  else
  {
    uint64_t v17 = *(void *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(void *)(v0 + 440) = v17;
    if (v17)
    {
      uint64_t v18 = *(void *)(v0 + 360);
      uint64_t v20 = *(void *)(v0 + 208);
      uint64_t v19 = *(void *)(v0 + 216);
      uint64_t v21 = *(void *)(v0 + 200);
      (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 328), *(void *)(v0 + 312), *(void *)(v0 + 296));
      (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v19, *MEMORY[0x263F36C68], v21);
      swift_retain();
      uint64_t v9 = sub_2151EA12C;
      uint64_t v10 = v18;
      goto LABEL_3;
    }
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    uint64_t v23 = *(void *)(v0 + 336);
    uint64_t v24 = *(void *)(v0 + 296);
    uint64_t v25 = *(void *)(v0 + 256);
    v22(*(void *)(v0 + 312), v24);
    sub_2151EE574(v25, type metadata accessor for ODISessionInternal.PendingFeedback);
    v22(v23, v24);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
}

uint64_t sub_2151E9AF4()
{
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[24];
  sub_2151F7448(v1, v0[39]);
  sub_2151EE574(v1, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  return MEMORY[0x270FA2498](sub_2151E9B90, v2, 0);
}

uint64_t sub_2151E9B90()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(void *)(v0 + 416) = v2;
  if (v2)
  {
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 424) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    *uint64_t v3 = v0;
    v3[1] = sub_2151E9E28;
    uint64_t v5 = MEMORY[0x263F8EE60] + 8;
    uint64_t v6 = MEMORY[0x263F8E4E0];
    return MEMORY[0x270FA1FA8](v4, v2, v5, v4, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(void *)(v0 + 440) = v7;
    if (v7)
    {
      uint64_t v8 = *(void *)(v0 + 360);
      uint64_t v10 = *(void *)(v0 + 208);
      uint64_t v9 = *(void *)(v0 + 216);
      uint64_t v11 = *(void *)(v0 + 200);
      (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 328), *(void *)(v0 + 312), *(void *)(v0 + 296));
      (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v9, *MEMORY[0x263F36C68], v11);
      swift_retain();
      return MEMORY[0x270FA2498](sub_2151EA12C, v8, 0);
    }
    else
    {
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
      uint64_t v13 = *(void *)(v0 + 336);
      uint64_t v14 = *(void *)(v0 + 296);
      uint64_t v15 = *(void *)(v0 + 256);
      v12(*(void *)(v0 + 312), v14);
      sub_2151EE574(v15, type metadata accessor for ODISessionInternal.PendingFeedback);
      v12(v13, v14);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
      return v16();
    }
  }
}

uint64_t sub_2151E9E28()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 432) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 192);
    swift_release();
    uint64_t v4 = sub_2151EA614;
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 192);
    uint64_t v4 = sub_2151E9F50;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_2151E9F50()
{
  swift_release();
  uint64_t v1 = *(void *)(*(void *)(v0 + 192) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(void *)(v0 + 440) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 360);
    uint64_t v4 = *(void *)(v0 + 208);
    uint64_t v3 = *(void *)(v0 + 216);
    uint64_t v5 = *(void *)(v0 + 200);
    (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 328), *(void *)(v0 + 312), *(void *)(v0 + 296));
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F36C68], v5);
    swift_retain();
    return MEMORY[0x270FA2498](sub_2151EA12C, v2, 0);
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
    uint64_t v7 = *(void *)(v0 + 336);
    uint64_t v8 = *(void *)(v0 + 296);
    uint64_t v9 = *(void *)(v0 + 256);
    v6(*(void *)(v0 + 312), v8);
    sub_2151EE574(v9, type metadata accessor for ODISessionInternal.PendingFeedback);
    v6(v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_2151EA12C()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = (void *)(v0[45] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  v0[56] = *v2;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151EA1C4, v1, 0);
}

uint64_t sub_2151EA1C4()
{
  uint64_t v1 = (uint64_t *)(v0[24] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  v0[57] = v3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F36B68]
                                                                           + MEMORY[0x263F36B68]);
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[58] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2151EA2B0;
  uint64_t v5 = v0[56];
  uint64_t v6 = v0[41];
  uint64_t v7 = v0[27];
  return v9(v6, v7, v5, v2, v3);
}

uint64_t sub_2151EA2B0()
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 376);
  uint64_t v1 = *(void *)(*(void *)v0 + 328);
  uint64_t v2 = *(void *)(*(void *)v0 + 296);
  uint64_t v3 = *(void *)(*(void *)v0 + 216);
  uint64_t v4 = *(void *)(*(void *)v0 + 208);
  uint64_t v5 = *(void *)(*(void *)v0 + 200);
  uint64_t v6 = *(void *)(*(void *)v0 + 192);
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v8(v1, v2);
  return MEMORY[0x270FA2498](sub_2151EA4F0, v6, 0);
}

uint64_t sub_2151EA4F0()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[47];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[32];
  v1(v0[39], v3);
  sub_2151EE574(v4, type metadata accessor for ODISessionInternal.PendingFeedback);
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2151EA614()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[47];
  uint64_t v13 = v0[42];
  uint64_t v11 = v0[39];
  uint64_t v2 = v0[37];
  uint64_t v3 = v0[35];
  uint64_t v9 = v0[33];
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[50];
  uint64_t v12 = v0[32];
  uint64_t v4 = (void *)(v0[24] + v0[49]);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2151FA038();
  sub_2151F9E68();
  swift_getErrorValue();
  sub_2151FA188();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v5 = *MEMORY[0x263F36D28];
  uint64_t v6 = sub_2151F9D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v3, v5, v6);
  sub_2151F9D08();
  swift_bridgeObjectRelease();
  v10(v3, v9);
  swift_willThrow();
  v1(v11, v2);
  sub_2151EE574(v12, type metadata accessor for ODISessionInternal.PendingFeedback);
  v1(v13, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2151EA898()
{
  v1[22] = v0;
  uint64_t v2 = sub_2151F98A8();
  v1[23] = v2;
  v1[24] = *(void *)(v2 - 8);
  v1[25] = swift_task_alloc();
  uint64_t v3 = sub_2151F9D58();
  v1[26] = v3;
  v1[27] = *(void *)(v3 - 8);
  v1[28] = swift_task_alloc();
  sub_2151F95A8();
  v1[29] = swift_task_alloc();
  uint64_t v4 = sub_2151F95B8();
  v1[30] = v4;
  v1[31] = *(void *)(v4 - 8);
  v1[32] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151EAA3C, v0, 0);
}

uint64_t sub_2151EAA3C()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 176);
  sub_2151F9B18();
  sub_2151F95C8();
  uint64_t v5 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(void *)(v0 + 264) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + v5), *(void *)(v4 + v5 + 24));
  sub_2151FA038();
  swift_bridgeObjectRelease();
  sub_2151F9E28();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v0 + 416) = *MEMORY[0x263F36CE8];
  uint64_t v6 = *(void (**)(uint64_t))(v3 + 104);
  *(void *)(v0 + 272) = v6;
  *(void *)(v0 + 280) = (v3 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v6(v1);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 288) = v7;
  *(void *)(v0 + 296) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v1, v2);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2151EAC10;
  return sub_2151D2800();
}

uint64_t sub_2151EAC10(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 176);
  *(void *)(*(void *)v1 + 312) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151EAD28, v2, 0);
}

uint64_t sub_2151EAD28()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  uint64_t v2 = *(unsigned int *)(v0 + 416);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  if (*(void *)(v1 + 16))
  {
    uint64_t v5 = *(void *)(v0 + 224);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 176);
    __swift_project_boxed_opaque_existential_1((void *)(v7 + v3), *(void *)(v7 + v3 + 24));
    sub_2151FA038();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_2151F97E8();
    *(void *)(v0 + 320) = v8;
    MEMORY[0x2166B4D50](v1, v8);
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    v4(v5, v2, v6);
    sub_2151F9C68();
    swift_bridgeObjectRelease();
    v15(v5, v6);
    uint64_t v9 = *(void *)(v7 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    *(void *)(v0 + 328) = v9;
    return MEMORY[0x270FA2498](sub_2151EAFB4, v9, 0);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 208);
    uint64_t v12 = *(void *)(v0 + 176);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1((void *)(v12 + v3), *(void *)(v12 + v3 + 24));
    v4(v10, v2, v11);
    sub_2151F9C68();
    v15(v10, v11);
    sub_2151F9598();
    (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_2151EAFB4()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0[40] - 8);
    uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = v0[41] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    uint64_t v6 = *(void *)(v3 + 72);
    while (1)
    {
      uint64_t v7 = *(void *)v5;
      if (!*(void *)(*(void *)v5 + 16)) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_2151C752C(v4);
      if ((v9 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        break;
      }
      char v10 = *(unsigned char *)(*(void *)(v7 + 56) + v8);
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0) {
        break;
      }
      v4 += v6;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v11 = v0[22];
    uint64_t v12 = sub_2151EB124;
  }
  else
  {
LABEL_8:
    uint64_t v11 = v0[22];
    uint64_t v12 = sub_2151EB524;
  }
  return MEMORY[0x270FA2498](v12, v11, 0);
}

uint64_t sub_2151EB124()
{
  v0[42] = *(void *)(v0[22] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  swift_retain();
  uint64_t v1 = sub_2151D26B8()[9];
  swift_retain();
  swift_release();
  v0[5] = type metadata accessor for ODIBindingsFiller();
  uint64_t v2 = sub_2151EE4C4(&qword_267865328, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
  v0[2] = v1;
  v0[6] = v2;
  uint64_t v7 = (uint64_t (*)(uint64_t, void *, uint64_t, void *))((int)*MEMORY[0x263F36C20] + MEMORY[0x263F36C20]);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[43] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2151EB278;
  uint64_t v4 = v0[39];
  uint64_t v5 = v0[22];
  return v7(v4, &unk_267865660, v5, v0 + 2);
}

uint64_t sub_2151EB278(char a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  uint64_t v3 = *(void *)(*(void *)v1 + 328);
  *(unsigned char *)(*(void *)v1 + 420) = a1;
  swift_task_dealloc();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v2);
  return MEMORY[0x270FA2498](sub_2151EB3C0, v3, 0);
}

uint64_t sub_2151EB3C0()
{
  uint64_t v1 = *(void *)(v0 + 176);
  sub_2151F71A4(*(void *)(v0 + 312), *(unsigned char *)(v0 + 420));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2151EB448, v1, 0);
}

uint64_t sub_2151EB448()
{
  uint64_t v1 = *(void *)(v0 + 328);
  sub_2151CC6F4(*(void *)(v0 + 176) + *(void *)(v0 + 264), v0 + 56);
  long long v2 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 352) = v2;
  *(void *)(v0 + 368) = __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v2);
  sub_2151FA038();
  *(void *)(v0 + 144) = 0;
  *(void *)(v0 + 152) = 0xE000000000000000;
  sub_2151F9E68();
  return MEMORY[0x270FA2498](sub_2151EB608, v1, 0);
}

uint64_t sub_2151EB524()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 328);
  sub_2151CC6F4(*(void *)(v0 + 176) + *(void *)(v0 + 264), v0 + 56);
  long long v2 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 352) = v2;
  *(void *)(v0 + 368) = __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v2);
  sub_2151FA038();
  *(void *)(v0 + 144) = 0;
  *(void *)(v0 + 152) = 0xE000000000000000;
  sub_2151F9E68();
  return MEMORY[0x270FA2498](sub_2151EB608, v1, 0);
}

uint64_t sub_2151EB608()
{
  uint64_t v1 = v0[22];
  long long v2 = (void *)(v0[41] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized);
  swift_beginAccess();
  v0[47] = *v2;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151EB6A4, v1, 0);
}

uint64_t sub_2151EB6A4()
{
  char v10 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  uint64_t v1 = *(unsigned int *)(v0 + 416);
  long long v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v4 = (void *)(v11 + *(void *)(v0 + 264));
  uint64_t v5 = *(void *)(v0 + 208);
  sub_2151EE4C4(&qword_267865288, MEMORY[0x263F36BD8]);
  sub_2151F9D98();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2(v3, v1, v5);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  v10(v3, v5);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  uint64_t v6 = v4[3];
  *(void *)(v0 + 384) = v6;
  *(void *)(v0 + 392) = v4[4];
  *(void *)(v0 + 400) = __swift_project_boxed_opaque_existential_1(v4, v6);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 160) = 0xD000000000000014;
  *(void *)(v0 + 168) = 0x800000021520D510;
  *(void *)(v0 + 408) = *(void *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_2151F9858();
  sub_2151EE4C4(&qword_2678652E0, MEMORY[0x263F36C28]);
  swift_retain();
  uint64_t v8 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151EB8E8, v8, v7);
}

uint64_t sub_2151EB8E8()
{
  uint64_t v1 = *(void *)(v0 + 176);
  sub_2151F9818();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151EB960, v1, 0);
}

uint64_t sub_2151EB960()
{
  char v10 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  char v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  uint64_t v1 = *(unsigned int *)(v0 + 416);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 192);
  sub_2151EE4C4(&qword_2678652E8, MEMORY[0x263F36C58]);
  sub_2151FA108();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  v9(v2, v1, v4);
  sub_2151F9CB8();
  swift_bridgeObjectRelease();
  v10(v2, v4);
  sub_2151F9598();
  (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2151EBB3C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_2151EBB58, a2, 0);
}

uint64_t sub_2151EBB58()
{
  *(void *)(v0 + 40) = sub_2151D26B8();
  return MEMORY[0x270FA2498](sub_2151EBBC4, 0, 0);
}

uint64_t sub_2151EBBC4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + 72);
  *(void *)(v0 + 48) = v1;
  return MEMORY[0x270FA2498](sub_2151EBBE8, v1, 0);
}

uint64_t sub_2151EBBE8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper);
  if (v2)
  {
    v0[8] = v2;
    swift_retain();
    swift_release();
    return MEMORY[0x270FA2498](sub_2151EBEEC, 0, 0);
  }
  else
  {
    uint64_t v3 = sub_2151EE4C4(&qword_2678652B8, (void (*)(uint64_t))type metadata accessor for ODIBindingsFiller);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[7] = v4;
    uint64_t v5 = sub_2151F9A78();
    *uint64_t v4 = v0;
    v4[1] = sub_2151EBD6C;
    uint64_t v6 = v0[6];
    return MEMORY[0x270FA2318](v0 + 2, v1, v3, 0xD000000000000010, 0x80000002151FC9A0, sub_2151CCC08, v6, v5);
  }
}

uint64_t sub_2151EBD6C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151EBE7C, v1, 0);
}

uint64_t sub_2151EBE7C()
{
  *(void *)(v0 + 64) = *(void *)(v0 + 16);
  swift_release();
  return MEMORY[0x270FA2498](sub_2151EBEEC, 0, 0);
}

uint64_t sub_2151EBEEC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = sub_2151F9A78();
  uint64_t v4 = MEMORY[0x263F36C80];
  v2[3] = v3;
  v2[4] = v4;
  void *v2 = v1;
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2151EBF64()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2151F9F18();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_2151CEA98((uint64_t)v4, &qword_2678652A0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_2151F9F08();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_2151F9EE8();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_2678655B8;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2151EC1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_2151F9D58();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v6 = sub_2151F99D8();
  v4[9] = v6;
  v4[10] = *(void *)(v6 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151EC2D4, 0, 0);
}

uint64_t sub_2151EC2D4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 40) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  *(void *)(v0 + 104) = v1;
  return MEMORY[0x270FA2498](sub_2151EC300, v1, 0);
}

uint64_t sub_2151EC300()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[13] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v0[15] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  return MEMORY[0x270FA2498](sub_2151EC3BC, 0, 0);
}

uint64_t sub_2151EC3BC()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[14];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[9];
  char v5 = sub_2151F9998();
  v1(v2, v3, v4);
  uint64_t v7 = v0[10];
  uint64_t v6 = v0[11];
  uint64_t v8 = v0[9];
  if (v5)
  {
    char v9 = sub_2151F9938();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v10(v6, v8);
    if ((v9 & 1) == 0)
    {
      uint64_t v12 = v0[7];
      uint64_t v11 = v0[8];
      uint64_t v13 = v0[6];
      __swift_project_boxed_opaque_existential_1((void *)(v0[5] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)(v0[5] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, *MEMORY[0x263F36CD8], v13);
      sub_2151F9C88();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v10(v0[11], v0[9]);
  }
  v10(v0[12], v0[9]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t ODISessionInternal.deinit()
{
  uint64_t v13 = sub_2151F9D58();
  uint64_t v1 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2151F9618();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger);
  sub_2151CC6F4(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)v16);
  v11[2] = v16[4];
  v11[1] = __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F36AE0], v4);
  unint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_2151FA038();
  swift_bridgeObjectRelease();
  unint64_t v14 = 0xD00000000000001ELL;
  unint64_t v15 = 0x800000021520D200;
  uint64_t v12 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID;
  sub_2151F9E28();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9D18();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v9 = v13;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F36CD8], v13);
  sub_2151F9C58();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v9);
  sub_2151CEA98(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback, &qword_2678654D0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ODISessionInternal.__deallocating_deinit()
{
  ODISessionInternal.deinit();
  return MEMORY[0x270FA2418](v0);
}

void ODISessionInternal.__allocating_init()()
{
}

void ODISessionInternal.init()()
{
}

uint64_t ODISessionInternal.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2151ECA44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2151EF900;
  return v6(a1);
}

double sub_2151ECB20@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2151C73E8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2151C9C30();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_2151CE5D0((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_2151C9070(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2151ECC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2151C73E8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2151CA690();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_2151C925C(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2151ECCFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678653A0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2151ECE70((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2151CE5E8();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

unint64_t sub_2151ECDE4(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x2166B56F0](&v3, 8);
    double result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x2166B56F0](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2151ECE70(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    double result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ODISessionInternal(uint64_t a1)
{
  return sub_2151ED090(a1, (uint64_t *)&unk_2678655D0);
}

uint64_t sub_2151ED090(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2151ED0C8()
{
  unint64_t result = qword_267865510;
  if (!qword_267865510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267865508);
    sub_2151ED144();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865510);
  }
  return result;
}

unint64_t sub_2151ED144()
{
  unint64_t result = qword_267865518;
  if (!qword_267865518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267865520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865518);
  }
  return result;
}

void *sub_2151ED1B0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v29 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  a9[13] = 0;
  swift_unknownObjectWeakInit();
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  a9[15] = 0;
  a9[16] = 0;
  a9[2] = a1;
  a9[13] = &off_26C5DA8B0;
  a9[14] = v18;
  swift_unknownObjectWeakAssign();
  sub_2151CC6F4(a2, (uint64_t)(a9 + 3));
  type metadata accessor for ODIBindingsFiller();
  swift_allocObject();
  id v19 = a3;
  id v20 = a1;
  swift_bridgeObjectRetain();
  a9[9] = sub_2151BCF30(a6, a7, (uint64_t)a3, a4, a5);
  type metadata accessor for ODIBindingsManager.CallbackQueuer();
  swift_allocObject();
  swift_bridgeObjectRetain();
  a9[8] = sub_2151C02F8();
  sub_2151F9858();
  uint64_t v30 = sub_2151F9E28();
  uint64_t v31 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  a9[10] = sub_2151F9828();
  type metadata accessor for ODIFieldsManager();
  swift_allocObject();
  id v22 = v20;
  uint64_t v23 = sub_2151F52F8(a6, a7, v22);

  a9[11] = v23;
  uint64_t v24 = sub_2151F9F18();
  uint64_t v25 = (uint64_t)v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v29, 1, 1, v24);
  uint64_t v26 = (void *)swift_allocObject();
  long long v26[2] = 0;
  v26[3] = 0;
  v26[4] = a9;
  swift_retain();
  sub_2151D190C(v25, (uint64_t)&unk_267865760, (uint64_t)v26);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a2);
  return a9;
}

uint64_t sub_2151ED484()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151ED48C()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151CEB5C;
  unint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_2151C6CFC;
  return sub_2151D3610();
}

uint64_t sub_2151ED560()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151ED568()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_2151CEB5C;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2151D6CF8, 0, 0);
}

uint64_t sub_2151ED610()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151ED618()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_2151CEB5C;
  v3[12] = v2;
  return MEMORY[0x270FA2498](sub_2151D6DA4, v2, 0);
}

uint64_t sub_2151ED6C4()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151ED6CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2151CEB5C;
  return sub_2151D8324(a1, v4, v5, v6);
}

uint64_t sub_2151ED780()
{
  return objectdestroy_15Tm(MEMORY[0x263F8EEA0]);
}

uint64_t sub_2151ED798()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2151CEB5C;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x270FA2498](sub_2151D8610, v3, 0);
}

uint64_t sub_2151ED848()
{
  return objectdestroyTm(48);
}

uint64_t sub_2151ED850()
{
  uint64_t v2 = *(void *)(v0 + 40);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_2151CEB5C;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2151CEB5C;
  return sub_2151D95C4(v2);
}

uint64_t sub_2151ED938()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[3] = v3;
  v5[4] = v4;
  v5[1] = sub_2151CEB5C;
  v5[2] = v2;
  return MEMORY[0x270FA2498](sub_2151D93F8, v2, 0);
}

uint64_t sub_2151ED9F0()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151ED9F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2151CEB5C;
  return sub_2151EC1A8(a1, v4, v5, v6);
}

uint64_t sub_2151EDAAC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2151CEB5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2678655C0 + dword_2678655C0);
  return v6(a1, v4);
}

uint64_t sub_2151EDB64()
{
  return type metadata accessor for ODISessionInternal(0);
}

void sub_2151EDB6C()
{
  sub_2151EDE0C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ODISessionInternal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ODISessionInternal);
}

uint64_t dispatch thunk of ODISessionInternal.description.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ODISessionInternal.__allocating_init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)()
{
  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of ODISessionInternal.update(additionalAttributes:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of ODISessionInternal.getAssessment(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of ODISessionInternal.provideFeedbackOnPayloadOutcome(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ODISessionInternal.provideFeedbackOn(partialAssessmentID:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of ODISessionInternal.validateForDeinit()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

void sub_2151EDE0C()
{
  if (!qword_267865640)
  {
    type metadata accessor for ODISessionInternal.PendingFeedback(255);
    unint64_t v0 = sub_2151F9FC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267865640);
    }
  }
}

uint64_t *sub_2151EDE64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_2151F99D8();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_2151EDF48(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2151F99D8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_2151EDFC0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2151F99D8();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_2151EE058(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2151F99D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_2151EE0EC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2151F99D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_2151EE168(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2151F99D8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_2151EE1F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2151EE208);
}

uint64_t sub_2151EE208(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_2151F99D8();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    int64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_2151EE2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2151EE2D8);
}

void *sub_2151EE2D8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_2151F99D8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2151EE380()
{
  uint64_t result = sub_2151F99D8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2151EE418(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2151CEB5C;
  v4[3] = a1;
  v4[4] = v1;
  return MEMORY[0x270FA2498](sub_2151EBB58, v1, 0);
}

uint64_t sub_2151EE4C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2151EE50C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678654D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2151EE574(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2151EE5D4()
{
  uint64_t v1 = sub_2151F99D8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2151EE6A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2151F99D8() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2151CEB5C;
  return sub_2151E6058(a1, v5, v6);
}

unint64_t sub_2151EE784()
{
  unint64_t result = qword_267865690;
  if (!qword_267865690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267865688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865690);
  }
  return result;
}

uint64_t sub_2151EE7F0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

unint64_t sub_2151EE828()
{
  return sub_2151E43B8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(double *)(v0 + 32));
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

unint64_t sub_2151EE84C()
{
  unint64_t result = qword_2678656A0;
  if (!qword_2678656A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2678656A0);
  }
  return result;
}

uint64_t sub_2151EE88C()
{
  uint64_t v1 = sub_2151F9758();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_2151F99D8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

unint64_t sub_2151EE9E4()
{
  sub_2151F9758();
  sub_2151F99D8();
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  return sub_2151E3B48(v1, v2, v3);
}

uint64_t sub_2151EEAB8()
{
  uint64_t v1 = sub_2151F9AC8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2151EEB90(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2151F9AC8() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = v1 + v5;
  unint64_t v8 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2151CEB5C;
  return sub_2151E2FE0(a1, v6, v7, v8);
}

uint64_t sub_2151EECA8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151CEB5C;
  return sub_2151E069C();
}

unint64_t sub_2151EED44()
{
  unint64_t result = qword_267865708;
  if (!qword_267865708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865708);
  }
  return result;
}

uint64_t sub_2151EED98(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2151EEDA0()
{
  return objectdestroy_15Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_15Tm(void (*a1)(void))
{
  swift_unknownObjectRelease();
  swift_release();
  a1(*(void *)(v1 + 40));
  return MEMORY[0x270FA0238](v1, 48, 7);
}

uint64_t sub_2151EEE10(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2151CEB5C;
  return sub_2151DC244(a1, v4, v5, v6);
}

uint64_t sub_2151EEED0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2151EEF10(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_2151C3238;
  return sub_2151D3DC4(a1, v4, v5);
}

uint64_t sub_2151EEFBC()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151EEFC4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151CEB5C;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = sub_2151CEB5C;
  return sub_2151D74E4();
}

uint64_t sub_2151EF098()
{
  return objectdestroyTm(40);
}

uint64_t sub_2151EF0A0()
{
  uint64_t v1 = sub_2151F9808();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_2151EF198(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2151F9808() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  int64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *int64_t v12 = v2;
  v12[1] = sub_2151CEB5C;
  return sub_2151D2E6C(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_2151EF2CC()
{
  return objectdestroyTm(40);
}

uint64_t objectdestroyTm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2151EF320()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2151C3238;
  return sub_2151C31A8();
}

uint64_t objectdestroy_26Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2151EF420()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2151EF458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2151D8D7C(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_2151EF460()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2151EF498()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2151EF4C0()
{
  uint64_t v1 = sub_2151F95B8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_2151F9AC8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v12 = v3 | v8 | 7;
  unint64_t v10 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();
  return MEMORY[0x270FA0238](v0, v10, v12);
}

uint64_t sub_2151EF650()
{
  uint64_t v2 = *(void *)(sub_2151F95B8() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(sub_2151F9AC8() - 8);
  unint64_t v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = (uint64_t *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v12;
  *uint64_t v12 = v1;
  v12[1] = sub_2151CEB5C;
  v12[2] = v7;
  uint64_t v13 = (void *)swift_task_alloc();
  v12[3] = v13;
  void *v13 = v12;
  v13[1] = sub_2151E34CC;
  return sub_2151E5640(v8, v10, v11);
}

uint64_t sub_2151EF818(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2151EF87C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2151EF904(void *a1)
{
  uint64_t v3 = sub_2151F9D58();
  unint64_t v4 = *(void (**)(char *, uint64_t))(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(v1, sel_attributes);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  type metadata accessor for ODIAttributeKey(0);
  uint64_t v10 = v9;
  unint64_t v11 = sub_2151F0294();
  uint64_t v12 = sub_2151F9D88();

  sub_2151F02EC(v12);
  swift_bridgeObjectRelease();
  id v13 = objc_allocWithZone(NSDictionary);
  uint64_t v14 = (void *)sub_2151F9D68();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithDictionary_copyItems_, v14, 1);

  unint64_t v79 = 0;
  unint64_t v71 = v11;
  sub_2151F9D78();

  uint64_t v16 = v79;
  if (!v79) {
    return 0;
  }
  if (!*(void *)(v79 + 16))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v62[1] = v10;
  uint64_t v65 = a1;
  uint64_t v66 = v6;
  uint64_t v67 = v4;
  uint64_t v68 = v3;
  uint64_t v17 = (void *)sub_2151D68D4(MEMORY[0x263F8EE78]);
  id v18 = (void (*)(char *))(v16 + 64);
  uint64_t v19 = 1 << *(unsigned char *)(v16 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & *(void *)(v16 + 64);
  int64_t v22 = (unint64_t)(v19 + 63) >> 6;
  v62[0] = v22 - 1;
  swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v64 = v22 - 5;
  uint64_t v63 = (void *)(v16 + 104);
  if (!v21) {
    goto LABEL_9;
  }
LABEL_7:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v23 << 6);
LABEL_8:
  uint64_t v26 = *(void *)(v16 + 56);
  *(void *)&v77[0] = *(void *)(*(void *)(v16 + 48) + 8 * v25);
  uint64_t v27 = *(void **)&v77[0];
  sub_2151F06B4(v26 + 32 * v25, (uint64_t)v77 + 8);
  id v28 = v27;
  while (1)
  {
    sub_2151F0710((uint64_t)v77, (uint64_t)&v79);
    uint64_t v32 = (void *)v79;
    if (!v79)
    {
      swift_release();
      uint64_t v50 = v65;
      uint64_t v51 = v65[3];
      uint64_t v64 = v65[4];
      uint64_t v63 = __swift_project_boxed_opaque_existential_1(v65, v51);
      unint64_t v79 = 0;
      *(void *)&long long v80 = 0xE000000000000000;
      uint64_t v72 = v17;
      sub_2151FA038();
      swift_bridgeObjectRelease();
      unint64_t v79 = 0xD00000000000001ALL;
      *(void *)&long long v80 = 0x800000021520E880;
      *(void *)&v77[0] = v72[2];
      sub_2151FA108();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      LODWORD(v70) = *MEMORY[0x263F36CF8];
      uint64_t v52 = v67;
      uint64_t v53 = (char *)v67 + 104;
      id v69 = (void (*)(char *))*((void *)v67 + 13);
      uint64_t v54 = v66;
      uint64_t v55 = v68;
      v69(v66);
      sub_2151F9CB8();
      swift_bridgeObjectRelease();
      uint64_t v56 = (void (*)(char *, uint64_t))*((void *)v52 + 1);
      v56(v54, v55);
      uint64_t v64 = v50[3];
      uint64_t v67 = (void (*)(char *, uint64_t))v50[4];
      uint64_t v63 = __swift_project_boxed_opaque_existential_1(v50, v64);
      unint64_t v79 = 0;
      *(void *)&long long v80 = 0xE000000000000000;
      sub_2151FA038();
      sub_2151F9E68();
      *(void *)&v77[0] = v72[2];
      sub_2151FA108();
      sub_2151F9E68();
      swift_bridgeObjectRelease();
      sub_2151F9E68();
      v62[0] = v53;
      ((void (*)(char *, void, uint64_t))v69)(v54, v70, v55);
      sub_2151F9C58();
      uint64_t v57 = (uint64_t)v72;
      swift_bridgeObjectRelease();
      uint64_t v67 = v56;
      v56(v54, v55);
      if (*(void *)(v57 + 16) == *(void *)(v16 + 16))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2151BF6B4(v16);
        uint64_t v60 = v59;
        uint64_t v61 = swift_bridgeObjectRetain();
        sub_2151CD174(v61, v60);
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(v50, v50[3]);
        unint64_t v79 = 0;
        *(void *)&long long v80 = 0xE000000000000000;
        sub_2151FA038();
        swift_bridgeObjectRelease();
        unint64_t v79 = 0xD000000000000013;
        *(void *)&long long v80 = 0x800000021520E8F0;
        sub_2151F9FA8();
        sub_2151F9E68();
        swift_release();
        swift_bridgeObjectRelease();
        ((void (*)(char *, void, uint64_t))v69)(v54, v70, v55);
        sub_2151F9C88();
        uint64_t v57 = (uint64_t)v72;
        swift_bridgeObjectRelease();
        v67(v54, v55);
      }
      return v57;
    }
    sub_2151F0778(&v80, v76);
    sub_2151F06B4((uint64_t)v76, (uint64_t)v74);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2678657A8);
    if (swift_dynamicCast())
    {
      int64_t v70 = v22;
      id v69 = v18;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
      sub_2151F06B4((uint64_t)v76, (uint64_t)v75);
      uint64_t v33 = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267865390);
      swift_dynamicCast();
      sub_2151CE5D0(v77, (uint64_t)v74);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v73 = v17;
      uint64_t v72 = v33;
      unint64_t v36 = sub_2151C75C4((uint64_t)v33);
      uint64_t v37 = v17[2];
      BOOL v38 = (v35 & 1) == 0;
      uint64_t v39 = v37 + v38;
      if (__OFADD__(v37, v38)) {
        goto LABEL_50;
      }
      char v40 = v35;
      if (v17[3] >= v39)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_2151CA4C4();
        }
      }
      else
      {
        sub_2151C8A34(v39, isUniquelyReferenced_nonNull_native);
        unint64_t v41 = sub_2151C75C4((uint64_t)v72);
        if ((v40 & 1) != (v42 & 1)) {
          goto LABEL_52;
        }
        unint64_t v36 = v41;
      }
      int64_t v22 = v70;
      uint64_t v17 = v73;
      if (v40)
      {
        uint64_t v43 = v73[7] + 40 * v36;
        __swift_destroy_boxed_opaque_existential_1(v43);
        sub_2151CE5D0(v74, v43);
        id v18 = v69;
        uint64_t v44 = v72;
      }
      else
      {
        v73[(v36 >> 6) + 8] |= 1 << v36;
        uint64_t v45 = v72;
        *(void *)(v17[6] + 8 * v36) = v72;
        sub_2151CE5D0(v74, v17[7] + 40 * v36);
        uint64_t v46 = v17[2];
        BOOL v47 = __OFADD__(v46, 1);
        uint64_t v48 = v46 + 1;
        if (v47) {
          goto LABEL_51;
        }
        v17[2] = v48;
        id v49 = v45;
        uint64_t v44 = v45;
        id v18 = v69;
      }

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
    if (v21) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v29 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v29 >= v22)
    {
      int64_t v31 = v23;
    }
    else
    {
      unint64_t v30 = *((void *)v18 + v29);
      if (v30) {
        goto LABEL_12;
      }
      int64_t v31 = v23 + 1;
      if (v23 + 2 < v22)
      {
        unint64_t v30 = *((void *)v18 + v23 + 2);
        if (v30)
        {
          int64_t v29 = v23 + 2;
LABEL_12:
          unint64_t v21 = (v30 - 1) & v30;
          unint64_t v25 = __clz(__rbit64(v30)) + (v29 << 6);
          int64_t v23 = v29;
          goto LABEL_8;
        }
        int64_t v31 = v23 + 2;
        if (v23 + 3 < v22)
        {
          unint64_t v30 = *((void *)v18 + v23 + 3);
          if (v30)
          {
            int64_t v29 = v23 + 3;
            goto LABEL_12;
          }
          int64_t v29 = v23 + 4;
          int64_t v31 = v23 + 3;
          if (v23 + 4 < v22)
          {
            unint64_t v30 = *((void *)v18 + v29);
            if (v30) {
              goto LABEL_12;
            }
            while (v64 != v23)
            {
              unint64_t v30 = v63[v23++];
              if (v30)
              {
                int64_t v29 = v23 + 4;
                goto LABEL_12;
              }
            }
            int64_t v31 = v62[0];
          }
        }
      }
    }
    unint64_t v21 = 0;
    uint64_t v78 = 0;
    int64_t v23 = v31;
    memset(v77, 0, sizeof(v77));
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  uint64_t result = sub_2151FA168();
  __break(1u);
  return result;
}

unint64_t sub_2151F0294()
{
  unint64_t result = qword_267865260;
  if (!qword_267865260)
  {
    type metadata accessor for ODIAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865260);
  }
  return result;
}

uint64_t sub_2151F02EC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2678657B0);
    uint64_t v2 = sub_2151FA0E8();
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    uint64_t v17 = *(void **)(*(void *)(a1 + 48) + 8 * v12);
    sub_2151F06B4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v39 + 8);
    *(void *)&v39[0] = v17;
    v37[0] = v39[0];
    v37[1] = v39[1];
    uint64_t v38 = v40;
    *(void *)&v36[0] = v17;
    type metadata accessor for ODIAttributeKey(0);
    id v18 = v17;
    swift_dynamicCast();
    sub_2151F0778((_OWORD *)((char *)v37 + 8), v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_2151F0778(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_2151F0778(v35, v36);
    sub_2151F0778(v36, &v32);
    uint64_t result = sub_2151F9FF8();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_2151F0778(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2151CE5E8();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2151F06B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2151F0710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2151F0778(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id ODIPartialAssessmentInitiator.__allocating_init(providerID:)(void *a1)
{
  uint64_t v3 = sub_2151F9BE8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (char *)objc_allocWithZone(v1);
  *(void *)&v7[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID] = a1;
  sub_2151F9E28();
  int64_t v8 = v7;
  id v9 = a1;
  sub_2151F9BC8();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v8[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter], v6, v3);

  v12.receiver = v8;
  v12.super_class = v1;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id ODIPartialAssessmentInitiator.init(providerID:)(void *a1)
{
  uint64_t v3 = sub_2151F9BE8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID] = a1;
  sub_2151F9E28();
  id v7 = v1;
  id v8 = a1;
  sub_2151F9BC8();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v7[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter], v6, v3);

  id v9 = (objc_class *)type metadata accessor for ODIPartialAssessmentInitiator();
  v12.receiver = v7;
  v12.super_class = v9;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t type metadata accessor for ODIPartialAssessmentInitiator()
{
  uint64_t result = qword_2678657C8;
  if (!qword_2678657C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2151F0BAC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
  MEMORY[0x270FA5388](v0 - 8);
  long long v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2151F9638();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2151F9BB8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)&v18 - v12;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F36B30], v3);
  sub_2151F9BD8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_2151F9BA8();
  uint64_t v14 = sub_2151FA068();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v2, 1, 1, v14);
  sub_2151F9B98();
  int64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  uint64_t v16 = sub_2151F9BA8();
  v15(v13, v7);
  return v16;
}

unint64_t sub_2151F0EC4()
{
  return 0xD000000000000024;
}

id ODIPartialAssessmentInitiator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ODIPartialAssessmentInitiator.init()()
{
}

id ODIPartialAssessmentInitiator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ODIPartialAssessmentInitiator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2151F106C()
{
  return type metadata accessor for ODIPartialAssessmentInitiator();
}

uint64_t sub_2151F1074()
{
  uint64_t result = sub_2151F9BE8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ODIPartialAssessmentInitiator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ODIPartialAssessmentInitiator);
}

uint64_t dispatch thunk of ODIPartialAssessmentInitiator.__allocating_init(providerID:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ODIPartialAssessmentInitiator.makeInitialPartialAssessmentPayload()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ODIPartialAssessmentInitiator.makeInitialPartialAssessmentID()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t sub_2151F11A4(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 215) = a2;
  *(void *)(v3 + 88) = a1;
  *(void *)(v3 + 96) = v2;
  uint64_t v4 = sub_2151F9D58();
  *(void *)(v3 + 104) = v4;
  *(void *)(v3 + 112) = *(void *)(v4 - 8);
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = type metadata accessor for ODIFieldsKey();
  *(void *)(v3 + 136) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151F1298, 0, 0);
}

uint64_t sub_2151F1298()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(unsigned char **)(v0 + 136);
  char v3 = *(unsigned char *)(v0 + 215) & 1;
  uint64_t v4 = *(void *)(*(void *)(v0 + 96) + 64);
  *(void *)(v0 + 144) = v4;
  uint64_t v5 = &v2[*(int *)(v1 + 20)];
  uint64_t v6 = *MEMORY[0x263F36C00];
  *(_DWORD *)(v0 + 208) = v6;
  uint64_t v7 = sub_2151F9808();
  *(void *)(v0 + 152) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 104);
  *(void *)(v0 + 160) = v9;
  *(void *)(v0 + 168) = (v8 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v9(v5, v6, v7);
  unsigned char *v2 = v3;
  return MEMORY[0x270FA2498](sub_2151F1388, v4, 0);
}

uint64_t sub_2151F1388()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_beginAccess();
  *(void *)(v0 + 176) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151F1410, 0, 0);
}

uint64_t sub_2151F1410()
{
  if (*(void *)(*(void *)(v0 + 176) + 16) && (unint64_t v1 = sub_2151C7460(*(unsigned __int8 **)(v0 + 136)), (v2 & 1) != 0))
  {
    uint64_t v18 = *(void (**)(uint64_t, void, uint64_t))(v0 + 160);
    uint64_t v17 = *(void *)(v0 + 152);
    unsigned int v16 = *(_DWORD *)(v0 + 208);
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v5 = *(void *)(v0 + 112);
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v6 = *(void *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v15 = *(void *)(v0 + 88);
    char v8 = *(unsigned char *)(v0 + 215) & 1;
    uint64_t v9 = *(void *)(*(void *)(*(void *)(v0 + 176) + 56) + 8 * v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2151CCAB0(v3);
    __swift_project_boxed_opaque_existential_1((void *)(v6 + 24), *(void *)(v6 + 48));
    sub_2151FA038();
    *(void *)(v0 + 72) = 0;
    *(void *)(v0 + 80) = 0xE000000000000000;
    *(unsigned char *)(v0 + 214) = v8;
    sub_2151FA0B8();
    sub_2151F9E68();
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F36CE8], v7);
    sub_2151F9C68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
    v18(v15, v16, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v10(v9);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 136);
    char v13 = *(unsigned char *)(v0 + 215);
    swift_bridgeObjectRelease();
    sub_2151CCAB0(v12);
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_2151F16A8;
    return sub_2151F3340(v13 & 1);
  }
}

uint64_t sub_2151F16A8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 192) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151F17A8, 0, 0);
}

uint64_t sub_2151F17A8()
{
  uint64_t v1 = *(void *)(v0 + 192);
  char v13 = *(void (**)(uint64_t, void, uint64_t))(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 152);
  char v6 = *(unsigned char *)(v0 + 215) & 1;
  uint64_t v7 = (void *)(v4 + 24);
  if (v1)
  {
    __swift_project_boxed_opaque_existential_1(v7, *(void *)(v4 + 48));
    sub_2151FA038();
    *(void *)(v0 + 56) = 0;
    *(void *)(v0 + 64) = 0xE000000000000000;
    *(unsigned char *)(v0 + 213) = v6;
    sub_2151FA0B8();
    sub_2151F9E68();
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v3, *MEMORY[0x263F36CE8], v5);
    sub_2151F9C68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v5);
    v13(v11, *MEMORY[0x263F36BF8], v12);
    swift_task_dealloc();
    swift_task_dealloc();
    char v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v8(v1);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v7, *(void *)(v4 + 48));
    sub_2151FA038();
    *(void *)(v0 + 40) = 0;
    *(void *)(v0 + 48) = 0xE000000000000000;
    *(unsigned char *)(v0 + 212) = v6;
    sub_2151FA0B8();
    sub_2151F9E68();
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v3, *MEMORY[0x263F36CE8], v5);
    sub_2151F9C68();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v5);
    v13(v11, *MEMORY[0x263F36C08], v12);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_2151F1AE4;
    return sub_2151F35F0(v6);
  }
}

uint64_t sub_2151F1AE4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_2151F1C20(char a1)
{
  *(void *)(v2 + 64) = v1;
  *(unsigned char *)(v2 + 224) = a1;
  char v3 = a1 & 1;
  uint64_t v4 = sub_2151F9D58();
  *(void *)(v2 + 72) = v4;
  *(void *)(v2 + 80) = *(void *)(v4 - 8);
  *(void *)(v2 + 88) = swift_task_alloc();
  uint64_t v5 = sub_2151F9638();
  *(void *)(v2 + 96) = v5;
  *(void *)(v2 + 104) = *(void *)(v5 - 8);
  *(void *)(v2 + 112) = swift_task_alloc();
  *(void *)(v2 + 120) = type metadata accessor for ODIFieldsKey();
  *(void *)(v2 + 128) = swift_task_alloc();
  *(void *)(v2 + 136) = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 144) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_2151F1DBC;
  return sub_2151F3340(v3);
}

uint64_t sub_2151F1DBC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2151F1EBC, 0, 0);
}

uint64_t sub_2151F1EBC()
{
  uint64_t v1 = v0[19];
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    uint64_t v7 = sub_2151F9E28();
    uint64_t v8 = v4;
    swift_bridgeObjectRetain();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    v0[20] = v7;
    v0[21] = v8;
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    sub_2151F9E68();
    sub_2151F9E68();
    v0[22] = 0xE000000000000000;
    sub_2151F9608();
    v0[23] = sub_2151F95E8();
    uint64_t v6 = (uint64_t (*)(void, unint64_t))((int)*MEMORY[0x263F36AC0] + MEMORY[0x263F36AC0]);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[24] = v5;
    void *v5 = v0;
    v5[1] = sub_2151F20E4;
    return v6(0, 0xE000000000000000);
  }
}

uint64_t sub_2151F20E4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2151F2430;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(void *)(v4 + 208) = a1;
    uint64_t v5 = sub_2151F2228;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2151F2228()
{
  uint64_t v1 = *(unsigned char **)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 120);
  char v3 = *(unsigned char *)(v0 + 224) & 1;
  uint64_t v4 = *(void *)(*(void *)(v0 + 64) + 64);
  *(void *)(v0 + 216) = v4;
  uint64_t v5 = &v1[*(int *)(v2 + 20)];
  uint64_t v6 = *MEMORY[0x263F36BF8];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  unsigned char *v1 = v3;
  return MEMORY[0x270FA2498](sub_2151F2308, v4, 0);
}

uint64_t sub_2151F2308()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v4 = (unsigned __int8 *)v0[16];
  uint64_t v3 = v0[17];
  sub_2151CC9E8(v3, (uint64_t)v4);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = 0x8000000000000000;
  sub_2151C9844(v1, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 112) = v8;
  swift_bridgeObjectRelease();
  sub_2151CCAB0((uint64_t)v4);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_2151CCAB0(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2151F2430()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_2151F94B8();
  id v5 = objc_msgSend(v4, sel_code);

  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F36B58], v3);
  uint64_t v6 = sub_2151F9628();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v8 = v0[10];
  uint64_t v7 = v0[11];
  uint64_t v10 = v0[8];
  uint64_t v9 = v0[9];
  uint64_t v11 = (void *)v0[25];
  if (v5 == (id)v6)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v10 + 24), *(void *)(v10 + 48));
    sub_2151FA038();
    sub_2151F9E68();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    sub_2151F9E68();
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, *MEMORY[0x263F36CE8], v9);
    sub_2151F9C68();
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1((void *)(v10 + 24), *(void *)(v10 + 48));
    sub_2151FA038();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_2151F9E68();
    v0[7] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267865400);
    sub_2151FA0B8();
    sub_2151F9E68();
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, *MEMORY[0x263F36CE8], v9);
    sub_2151F9C88();
  }

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_2151F277C(char a1, uint64_t a2)
{
  *(void *)(v3 + 80) = a2;
  *(void *)(v3 + 88) = v2;
  *(unsigned char *)(v3 + 176) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  *(void *)(v3 + 96) = swift_task_alloc();
  *(void *)(v3 + 104) = type metadata accessor for ODIFieldsKey();
  *(void *)(v3 + 112) = swift_task_alloc();
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151F2860, 0, 0);
}

uint64_t sub_2151F2860()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v17 = sub_2151F9E28();
  uint64_t v18 = v2;
  swift_bridgeObjectRetain();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16) && (unint64_t v3 = sub_2151C73E8(v17, v18), (v4 & 1) != 0))
  {
    uint64_t v5 = *(unsigned char **)(v0 + 128);
    uint64_t v6 = *(void *)(v0 + 104);
    uint64_t v7 = *(void *)(v0 + 88);
    char v8 = *(unsigned char *)(v0 + 176) & 1;
    *(void *)(v0 + 136) = *(void *)(*(void *)(*(void *)(v0 + 80) + 56) + 8 * v3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v9 = &v5[*(int *)(v6 + 20)];
    uint64_t v10 = *MEMORY[0x263F36C00];
    uint64_t v11 = sub_2151F9808();
    *(void *)(v0 + 144) = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    char v13 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 104);
    *(void *)(v0 + 152) = v13;
    *(void *)(v0 + 160) = (v12 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v13(v9, v10, v11);
    unsigned char *v5 = v8;
    uint64_t v14 = *(void *)(v7 + 64);
    *(void *)(v0 + 168) = v14;
    return MEMORY[0x270FA2498](sub_2151F2A38, v14, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
}

uint64_t sub_2151F2A38()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[17];
  unint64_t v3 = (unsigned __int8 *)v0[15];
  sub_2151CC9E8(v0[16], (uint64_t)v3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_2151C9844(v2, v3, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v6;
  swift_bridgeObjectRelease();
  sub_2151CCAB0((uint64_t)v3);
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_2151F2B28, 0, 0);
}

uint64_t sub_2151F2B28()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_retain();
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151F2BA8, v1, 0);
}

uint64_t sub_2151F2BA8()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(unsigned char **)(v0 + 112);
  char v3 = *(unsigned char *)(v0 + 176) & 1;
  (*(void (**)(unsigned char *, void, void))(v0 + 152))(&v2[*(int *)(*(void *)(v0 + 104) + 20)], *MEMORY[0x263F36BF8], *(void *)(v0 + 144));
  unsigned char *v2 = v3;
  uint64_t v4 = *(void *)(v1 + 112);
  if (*(void *)(v4 + 16))
  {
    uint64_t v5 = *(unsigned __int8 **)(v0 + 112);
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_2151C7460(v5);
    if (v7)
    {
      uint64_t v8 = *(void *)(*(void *)(v4 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v8 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void *)(v0 + 168);
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 96);
  uint64_t v13 = *(void *)(v0 + 80);
  char v14 = *(unsigned char *)(v0 + 176) & 1;
  sub_2151CCAB0(*(void *)(v0 + 112));
  uint64_t v15 = sub_2151F9F18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  sub_2151CC6F4(v12 + 24, v0 + 16);
  uint64_t v16 = swift_allocObject();
  sub_2151CE5D0((long long *)(v0 + 16), v16 + 16);
  *(void *)(v16 + 56) = v8;
  *(void *)(v16 + 64) = v10;
  *(void *)(v16 + 72) = v13;
  *(unsigned char *)(v16 + 80) = v14;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_267865820;
  v17[5] = v16;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_267865830;
  v18[5] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(v9 + 120) = sub_2151D16EC(v11, (uint64_t)&unk_267865840, (uint64_t)v18);
  swift_release();
  return MEMORY[0x270FA2498](sub_2151F2DDC, 0, 0);
}

uint64_t sub_2151F2DDC()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2151CCAB0(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

BOOL sub_2151F2E88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2151F2EA0()
{
  return sub_2151FA1B8();
}

uint64_t sub_2151F2EE8()
{
  return sub_2151FA1A8();
}

uint64_t sub_2151F2F14()
{
  return sub_2151FA1B8();
}

uint64_t sub_2151F2F58()
{
  return sub_2151FA1B8();
}

uint64_t sub_2151F3004()
{
  return sub_2151F9DD8();
}

uint64_t sub_2151F3098()
{
  return sub_2151FA1B8();
}

uint64_t sub_2151F3140(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2) {
    return sub_2151F97F8();
  }
  else {
    return 0;
  }
}

uint64_t sub_2151F3168(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2151CEB5C;
  return v6();
}

uint64_t sub_2151F3234(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_2151CEB5C;
  return v7();
}

uint64_t sub_2151F3300()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_2151F3340(char a1)
{
  *(void *)(v2 + 40) = v1;
  *(unsigned char *)(v2 + 80) = a1;
  *(void *)(v2 + 48) = type metadata accessor for ODIFieldsKey();
  *(void *)(v2 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151F33D8, 0, 0);
}

uint64_t sub_2151F33D8()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(unsigned char **)(v0 + 56);
  char v3 = *(unsigned char *)(v0 + 80) & 1;
  uint64_t v4 = *(void *)(*(void *)(v0 + 40) + 64);
  *(void *)(v0 + 64) = v4;
  uint64_t v5 = &v2[*(int *)(v1 + 20)];
  uint64_t v6 = *MEMORY[0x263F36BF8];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  unsigned char *v2 = v3;
  return MEMORY[0x270FA2498](sub_2151F34B4, v4, 0);
}

uint64_t sub_2151F34B4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_beginAccess();
  *(void *)(v0 + 72) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151F353C, 0, 0);
}

uint64_t sub_2151F353C()
{
  if (*(void *)(*(void *)(v0 + 72) + 16) && (unint64_t v1 = sub_2151C7460(*(unsigned __int8 **)(v0 + 56)), (v2 & 1) != 0))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(v0 + 72) + 56) + 8 * v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(v0 + 56);
  swift_bridgeObjectRelease();
  sub_2151CCAB0(v4);
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v3);
}

uint64_t sub_2151F35F0(char a1)
{
  *(void *)(v2 + 64) = v1;
  *(unsigned char *)(v2 + 128) = a1;
  *(void *)(v2 + 72) = type metadata accessor for ODIFieldsKey();
  *(void *)(v2 + 80) = swift_task_alloc();
  *(void *)(v2 + 88) = swift_task_alloc();
  *(void *)(v2 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151F36A4, 0, 0);
}

uint64_t sub_2151F36A4()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(unsigned char **)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 64);
  char v4 = *(unsigned char *)(v0 + 128) & 1;
  uint64_t v5 = &v2[*(int *)(*(void *)(v0 + 72) + 20)];
  uint64_t v6 = *MEMORY[0x263F36C08];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  unsigned char *v2 = v4;
  uint64_t v8 = *(void *)(v3 + 64);
  *(void *)(v0 + 104) = v8;
  sub_2151CC9E8((uint64_t)v2, v1);
  return MEMORY[0x270FA2498](sub_2151F378C, v8, 0);
}

uint64_t sub_2151F378C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_beginAccess();
  *(void *)(v0 + 112) = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2151F3814, 0, 0);
}

uint64_t sub_2151F3814()
{
  if (*(void *)(*(void *)(v0 + 112) + 16) && (unint64_t v1 = sub_2151C7460(*(unsigned __int8 **)(v0 + 88)), (v2 & 1) != 0))
  {
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(v0 + 112) + 56) + 8 * v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_2151CCAB0(v3);
    sub_2151CCAB0(*(void *)(v0 + 96));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v5(v4);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 64);
    char v9 = *(unsigned char *)(v0 + 128);
    swift_bridgeObjectRelease();
    sub_2151CCAB0(v7);
    uint64_t v10 = *(void *)(v8 + 16);
    if (v9) {
      uint64_t v11 = sub_2151CF484(v10);
    }
    else {
      uint64_t v11 = sub_2151CEB7C(v10);
    }
    *(void *)(v0 + 120) = v11;
    uint64_t v12 = *(void *)(v0 + 104);
    return MEMORY[0x270FA2498](sub_2151F3950, v12, 0);
  }
}

uint64_t sub_2151F3950()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = (unsigned __int8 *)v0[10];
  sub_2151CC9E8(v0[12], (uint64_t)v3);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = 0x8000000000000000;
  sub_2151C9844(v1, v3, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 112) = v6;
  swift_bridgeObjectRelease();
  sub_2151CCAB0((uint64_t)v3);
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_2151F3A44, 0, 0);
}

uint64_t sub_2151F3A44()
{
  uint64_t v1 = v0[15];
  sub_2151CCAB0(v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_2151F3AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 212) = a5;
  *(void *)(v5 + 56) = a3;
  *(void *)(v5 + 64) = a4;
  *(void *)(v5 + 40) = a1;
  *(void *)(v5 + 48) = a2;
  uint64_t v6 = sub_2151F9D58();
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = *(void *)(v6 - 8);
  *(void *)(v5 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2151F3B9C, 0, 0);
}

uint64_t sub_2151F3B9C()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void **)(v0 + 40);
  uint64_t v44 = *(void *)(v0 + 48);
  uint64_t v5 = v4[3];
  *(void *)(v0 + 96) = v5;
  *(void *)(v0 + 104) = v4[4];
  *(void *)(v0 + 112) = __swift_project_boxed_opaque_existential_1(v4, v5);
  uint64_t v6 = *MEMORY[0x263F36CE8];
  *(_DWORD *)(v0 + 208) = v6;
  unsigned int v45 = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  *(void *)(v0 + 120) = v7;
  *(void *)(v0 + 128) = (v2 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v7(v1, v6, v3);
  sub_2151F9C58();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 136) = v8;
  *(void *)(v0 + 144) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v1, v3);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 32) = v44;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865848);
  sub_2151F9E48();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  v7(v1, v45, v3);
  sub_2151F9C58();
  swift_bridgeObjectRelease();
  char v9 = v8;
  v8(v1, v3);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  sub_2151F97E8();
  swift_bridgeObjectRetain();
  MEMORY[0x2166B4D50]();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  uint64_t v43 = v7;
  v7(v1, v45, v3);
  sub_2151F9C58();
  swift_bridgeObjectRelease();
  v8(v1, v3);
  if (v44 && (sub_2151F4758(*(void *)(v0 + 56), v44) & 1) != 0)
  {
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v11 = *(void *)(v0 + 72);
    v7(v10, v45, v11);
    sub_2151F9C58();
    v9(v10, v11);
LABEL_37:
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    uint64_t v39 = *(void *)(v0 + 88);
    uint64_t v40 = *(void *)(v0 + 72);
    (*(void (**)(uint64_t, void, uint64_t))(v0 + 120))(v39, *(unsigned int *)(v0 + 208), v40);
    sub_2151F9C58();
    v38(v39, v40);
    swift_task_dealloc();
    unint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
  uint64_t v12 = *(void *)(v0 + 88);
  uint64_t v13 = *(void *)(v0 + 64);
  uint64_t v14 = *(void *)(v0 + 72);
  sub_2151FA038();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  swift_bridgeObjectRelease();
  sub_2151F9E68();
  v43(v12, v45, v14);
  sub_2151F9C58();
  swift_bridgeObjectRelease();
  v9(v12, v14);
  char v15 = *(unsigned char *)(v13 + 32);
  *(unsigned char *)(v0 + 213) = v15;
  uint64_t v16 = -1;
  uint64_t v17 = -1 << v15;
  if (-(-1 << v15) < 64) {
    uint64_t v16 = ~(-1 << -(char)v17);
  }
  unint64_t v18 = v16 & *(void *)(v13 + 64);
  swift_bridgeObjectRetain();
  if (!v18)
  {
    unint64_t v28 = 63 - v17;
    char v22 = *(void **)(v0 + 64);
    if ((unint64_t)(63 - v17) > 0x7F)
    {
      unint64_t v29 = v22[9];
      if (v29)
      {
        uint64_t v19 = 1;
LABEL_20:
        uint64_t v21 = (v29 - 1) & v29;
        unint64_t v20 = __clz(__rbit64(v29)) + (v19 << 6);
        goto LABEL_8;
      }
      if (v28 >= 0xC0)
      {
        unint64_t v29 = v22[10];
        if (v29)
        {
          uint64_t v19 = 2;
          goto LABEL_20;
        }
        if (v28 >= 0x100)
        {
          unint64_t v29 = v22[11];
          if (v29)
          {
            uint64_t v19 = 3;
            goto LABEL_20;
          }
          if (v28 >= 0x140)
          {
            unint64_t v29 = v22[12];
            if (v29)
            {
              uint64_t v19 = 4;
              goto LABEL_20;
            }
            uint64_t v30 = 0;
            uint64_t v31 = v28 >> 6;
            if (v31 <= 5) {
              uint64_t v31 = 5;
            }
            uint64_t v32 = v31 - 5;
            while (v32 != v30)
            {
              unint64_t v29 = v22[v30++ + 13];
              if (v29)
              {
                uint64_t v19 = v30 + 4;
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
    long long v33 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
    uint64_t v35 = *(unsigned int *)(v0 + 208);
    uint64_t v36 = *(void *)(v0 + 88);
    uint64_t v37 = *(void *)(v0 + 72);
    swift_release();
    v34(v36, v35, v37);
    sub_2151F9C58();
    v33(v36, v37);
    goto LABEL_37;
  }
  uint64_t v19 = 0;
  unint64_t v20 = __clz(__rbit64(v18));
  uint64_t v21 = (v18 - 1) & v18;
  char v22 = *(void **)(v0 + 64);
LABEL_8:
  *(void *)(v0 + 152) = v19;
  *(void *)(v0 + 160) = v21;
  if (*(unsigned char *)(v0 + 212)) {
    unint64_t v23 = 0xED000073646C6569;
  }
  else {
    unint64_t v23 = 0xEE0073646C656946;
  }
  if (*(unsigned char *)(v0 + 212)) {
    uint64_t v24 = 0x4661746144776172;
  }
  else {
    uint64_t v24 = 0x73676E69646E6962;
  }
  *(void *)(v0 + 168) = *(void *)(v22[6] + 16 * v20 + 8);
  *(void *)(v0 + 176) = *(void *)(v22[7] + 8 * v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(void *)(v0 + 16) = v24;
  *(void *)(v0 + 24) = v23;
  swift_bridgeObjectRetain();
  sub_2151F9E68();
  sub_2151F9E68();
  uint64_t v25 = *(void *)(v0 + 24);
  *(void *)(v0 + 184) = *(void *)(v0 + 16);
  *(void *)(v0 + 192) = v25;
  sub_2151F9608();
  *(void *)(v0 + 200) = sub_2151F95E8();
  sub_2151F52B0(&qword_267865850, MEMORY[0x263F36AC8]);
  uint64_t v27 = sub_2151F9EE8();
  return MEMORY[0x270FA2498](sub_2151F4338, v27, v26);
}

uint64_t sub_2151F4338()
{
  sub_2151F95F8();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](sub_2151F43B8, 0, 0);
}

uint64_t sub_2151F43B8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = (uint64_t (*)())swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v0 + 152);
  unint64_t v5 = *(void *)(v0 + 160);
  if (v5)
  {
    uint64_t v6 = (v5 - 1) & v5;
    unint64_t v7 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v1 = *(uint64_t (**)())(v0 + 64);
LABEL_3:
    *(void *)(v0 + 152) = v4;
    *(void *)(v0 + 160) = v6;
    if (*(unsigned char *)(v0 + 212)) {
      unint64_t v8 = 0xED000073646C6569;
    }
    else {
      unint64_t v8 = 0xEE0073646C656946;
    }
    if (*(unsigned char *)(v0 + 212)) {
      uint64_t v9 = 0x4661746144776172;
    }
    else {
      uint64_t v9 = 0x73676E69646E6962;
    }
    *(void *)(v0 + 168) = *(void *)(*((void *)v1 + 6) + 16 * v7 + 8);
    *(void *)(v0 + 176) = *(void *)(*((void *)v1 + 7) + 8 * v7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = v9;
    *(void *)(v0 + 24) = v8;
    swift_bridgeObjectRetain();
    sub_2151F9E68();
    sub_2151F9E68();
    uint64_t v10 = *(void *)(v0 + 24);
    *(void *)(v0 + 184) = *(void *)(v0 + 16);
    *(void *)(v0 + 192) = v10;
    sub_2151F9608();
    *(void *)(v0 + 200) = sub_2151F95E8();
    sub_2151F52B0(&qword_267865850, MEMORY[0x263F36AC8]);
    uint64_t v11 = sub_2151F9EE8();
    uint64_t v13 = v12;
    uint64_t v1 = sub_2151F4338;
    uint64_t v2 = v11;
    uint64_t v3 = v13;
    return MEMORY[0x270FA2498](v1, v2, v3);
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  int64_t v15 = (unint64_t)((1 << *(unsigned char *)(v0 + 213)) + 63) >> 6;
  uint64_t v1 = *(uint64_t (**)())(v0 + 64);
  if (v14 < v15)
  {
    uint64_t v16 = (char *)v1 + 64;
    unint64_t v17 = *((void *)v1 + v14 + 8);
    ++v4;
    if (v17)
    {
LABEL_15:
      uint64_t v6 = (v17 - 1) & v17;
      unint64_t v7 = __clz(__rbit64(v17)) + (v4 << 6);
      goto LABEL_3;
    }
    int64_t v4 = v14 + 1;
    if (v14 + 1 < v15)
    {
      unint64_t v17 = *(void *)&v16[8 * v4];
      if (v17) {
        goto LABEL_15;
      }
      int64_t v4 = v14 + 2;
      if (v14 + 2 < v15)
      {
        unint64_t v17 = *(void *)&v16[8 * v4];
        if (v17) {
          goto LABEL_15;
        }
        int64_t v18 = v14 + 3;
        if (v18 < v15)
        {
          unint64_t v17 = *(void *)&v16[8 * v18];
          if (v17)
          {
            int64_t v4 = v18;
            goto LABEL_15;
          }
          while (1)
          {
            int64_t v4 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              break;
            }
            if (v4 >= v15) {
              goto LABEL_26;
            }
            unint64_t v17 = *(void *)&v16[8 * v4];
            ++v18;
            if (v17) {
              goto LABEL_15;
            }
          }
LABEL_30:
          __break(1u);
          return MEMORY[0x270FA2498](v1, v2, v3);
        }
      }
    }
  }
LABEL_26:
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  unint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
  uint64_t v21 = *(unsigned int *)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 88);
  uint64_t v23 = *(void *)(v0 + 72);
  swift_release();
  v20(v22, v21, v23);
  sub_2151F9C58();
  v19(v22, v23);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  uint64_t v25 = *(void *)(v0 + 88);
  uint64_t v26 = *(void *)(v0 + 72);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 120))(v25, *(unsigned int *)(v0 + 208), v26);
  sub_2151F9C58();
  v24(v25, v26);
  swift_task_dealloc();
  uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

uint64_t sub_2151F4758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2151F97E8();
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
      uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      uint64_t v31 = v7;
      uint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      uint64_t v30 = (void (**)(char *, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      unint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        uint64_t v19 = v9;
        unint64_t v20 = v9;
        uint64_t v21 = v32;
        v32(v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        uint64_t v9 = v20;
        sub_2151F52B0(&qword_267865290, MEMORY[0x263F36BD8]);
        char v23 = sub_2151F9DE8();
        uint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24(v20, v4);
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

uint64_t sub_2151F4978()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t type metadata accessor for ODIFieldsManager()
{
  return self;
}

uint64_t type metadata accessor for ODIFieldsManager.FieldsKeeper()
{
  return self;
}

uint64_t *sub_2151F4A08(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    unint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_2151F9808();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_2151F4AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_2151F9808();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

unsigned char *sub_2151F4B3C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_2151F4BB8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_2151F4C34(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_2151F4CB0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_2151F9808();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_2151F4D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2151F4D40);
}

uint64_t sub_2151F4D40(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    if (v4 >= 2) {
      return v4 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_2151F9808();
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2151F4DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2151F4DFC);
}

unsigned char *sub_2151F4DFC(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_2151F9808();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ODIFieldsKey()
{
  uint64_t result = qword_2678657D8;
  if (!qword_2678657D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2151F4EEC()
{
  uint64_t result = sub_2151F9808();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2151F4F84()
{
  return sub_2151F52B0(&qword_2678657E8, (void (*)(uint64_t))type metadata accessor for ODIFieldsKey);
}

uint64_t sub_2151F4FCC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 81, 7);
}

uint64_t sub_2151F501C()
{
  uint64_t v2 = v0 + 16;
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  char v6 = *(unsigned char *)(v0 + 80);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_2151C3238;
  return sub_2151F3AD4(v2, v3, v4, v5, v6);
}

uint64_t sub_2151F50E0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_2151CEB5C;
  char v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267865828 + dword_267865828);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2151F51E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  char v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2151CEB5C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267865838 + dword_267865838);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2151F52B0(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_2151F52F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = sub_2151F9D58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2151F9558();
  uint64_t v16 = MEMORY[0x263F36AB0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
  sub_2151F9528();
  sub_2151CE5D0(&v14, (uint64_t)(v3 + 3));
  __swift_project_boxed_opaque_existential_1(v4 + 3, v4[6]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F36CF8], v6);
  sub_2151F9C68();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v3[2] = a3;
  type metadata accessor for ODIFieldsManager.FieldsKeeper();
  uint64_t v10 = swift_allocObject();
  id v11 = a3;
  swift_defaultActor_initialize();
  *(void *)(v10 + 112) = sub_2151D647C(MEMORY[0x263F8EE78]);
  *(void *)(v10 + 120) = 0;
  v4[8] = v10;
  return v4;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ODIFieldsCategory(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ODIFieldsCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2151F5620);
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

uint64_t sub_2151F5648(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2151F5654(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ODIFieldsCategory()
{
  return &type metadata for ODIFieldsCategory;
}

unint64_t sub_2151F5674()
{
  unint64_t result = qword_267865858;
  if (!qword_267865858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865858);
  }
  return result;
}

BOOL sub_2151F56C8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  if (*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16))
    {
      unint64_t v5 = 3;
      return v2 < v5;
    }
LABEL_6:
    uint64_t v6 = v3 | v4;
    if (v3 ^ 1 | v4) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
    if (!v6) {
      unint64_t v5 = 0;
    }
    return v2 < v5;
  }
  if (*(unsigned char *)(a2 + 16))
  {
    unint64_t v2 = 3;
    goto LABEL_6;
  }
  BOOL v8 = *(void *)(a1 + 8) < v4;
  if (v2 == v3) {
    return v8;
  }
  else {
    return v3 < (uint64_t)v2;
  }
}

BOOL sub_2151F5740(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)a2;
  if (*(unsigned char *)(a2 + 16))
  {
    if (!*(unsigned char *)(a1 + 16))
    {
      unint64_t v5 = 3;
      return v4 >= v5;
    }
LABEL_6:
    uint64_t v6 = v2 | v3;
    if (v2 ^ 1 | v3) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
    if (!v6) {
      unint64_t v5 = 0;
    }
    return v4 >= v5;
  }
  if (*(unsigned char *)(a1 + 16))
  {
    unint64_t v4 = 3;
    goto LABEL_6;
  }
  BOOL v8 = *(void *)(a2 + 8) < v3;
  if (v4 == v2) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = v2 < (uint64_t)v4;
  }
  return !v9;
}

BOOL sub_2151F57C0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  if (*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16))
    {
      unint64_t v5 = 3;
      return v2 >= v5;
    }
LABEL_6:
    uint64_t v6 = v3 | v4;
    if (v3 ^ 1 | v4) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
    if (!v6) {
      unint64_t v5 = 0;
    }
    return v2 >= v5;
  }
  if (*(unsigned char *)(a2 + 16))
  {
    unint64_t v2 = 3;
    goto LABEL_6;
  }
  BOOL v8 = *(void *)(a1 + 8) < v4;
  if (v2 == v3) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = v3 < (uint64_t)v2;
  }
  return !v9;
}

BOOL sub_2151F5840(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)a2;
  if (*(unsigned char *)(a2 + 16))
  {
    if (!*(unsigned char *)(a1 + 16))
    {
      unint64_t v5 = 3;
      return v4 < v5;
    }
LABEL_6:
    uint64_t v6 = v2 | v3;
    if (v2 ^ 1 | v3) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
    if (!v6) {
      unint64_t v5 = 0;
    }
    return v4 < v5;
  }
  if (*(unsigned char *)(a1 + 16))
  {
    unint64_t v4 = 3;
    goto LABEL_6;
  }
  BOOL v8 = *(void *)(a2 + 8) < v3;
  if (v4 == v2) {
    return v8;
  }
  else {
    return v2 < (uint64_t)v4;
  }
}

uint64_t *sub_2151F58B8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  if (*result == 1)
  {
    long long v3 = 1uLL;
    goto LABEL_9;
  }
  if (v2 == 2)
  {
    long long v3 = 2uLL;
LABEL_8:
    LOBYTE(v2) = 1;
    goto LABEL_9;
  }
  if (v2 != 3)
  {
    long long v3 = 0uLL;
    goto LABEL_8;
  }
  LOBYTE(v2) = 0;
  long long v3 = *(_OWORD *)(result + 1);
LABEL_9:
  *(_OWORD *)a2 = v3;
  *(unsigned char *)(a2 + 16) = v2;
  *(unsigned char *)(a2 + 17) = 0;
  return result;
}

void sub_2151F5910(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = 3;
  if (*(unsigned char *)(v1 + 16))
  {
    uint64_t v4 = *(void *)v1;
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  *a1 = v4;
  a1[1] = v2;
  a1[2] = v3;
}

BOOL sub_2151F5938(uint64_t *a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v5 = *a2;
  unint64_t v4 = a2[1];
  if (*((unsigned char *)a1 + 16) == 1)
  {
    if (v3 | v2)
    {
      if (v3 ^ 1 | v2)
      {
        if (*((unsigned char *)a2 + 16) && __PAIR128__(v4, v5) >= 2) {
          return 1;
        }
      }
      else if (*((unsigned char *)a2 + 16) && !(v5 ^ 1 | v4))
      {
        return 1;
      }
    }
    else
    {
      uint64_t v8 = v5 | v4;
      if (*((unsigned char *)a2 + 16)) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9) {
        return 1;
      }
    }
    return 0;
  }
  if (a2[2]) {
    return 0;
  }
  return v3 == v5 && v2 == v4;
}

BOOL sub_2151F59C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t *sub_2151F59D4@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_2151F59EC(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2151F59F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_2151F5A0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_2151F5A20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_2151F5A34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_2151F5A48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2151F9D58();
  uint64_t v40 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2151F9BB8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v39 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = sub_2151F9778();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v38 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  swift_beginAccess();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v41 = v14;
  uint64_t v16 = v14;
  unint64_t v17 = v15;
  v15(v10, v16, v5);
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v10, v5) == *MEMORY[0x263F36C90])
  {
    uint64_t v36 = v4;
    uint64_t v37 = v2;
    (*(void (**)(char *, uint64_t))(v6 + 96))(v10, v5);
    uint64_t v34 = v12;
    uint64_t v35 = v11;
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    uint64_t v19 = v38;
    v18(v38, v10, v11);
    uint64_t v20 = MEMORY[0x2166B57A0](v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_delegate);
    uint64_t v21 = v17;
    uint64_t v22 = v39;
    if (v20)
    {
      char v23 = (void *)v20;
      v21(v39, v41, v5);
      sub_2151F9BA8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v22, v5);
      uint64_t v24 = sub_2151F9DF8();
      uint64_t v33 = v21;
      uint64_t v25 = (void *)v24;
      swift_bridgeObjectRelease();
      sub_2151F9768();
      BOOL v26 = (void *)sub_2151F9DF8();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_didChangeStateWith_assessmentID_, v25, v26);

      uint64_t v21 = v33;
      swift_unknownObjectRelease();
    }
    uint64_t v27 = *(void *)(v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24);
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v1
                                                          + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger
                                                          + 32);
    uint64_t v32 = __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), v27);
    unint64_t v42 = 0;
    unint64_t v43 = 0xE000000000000000;
    sub_2151FA038();
    swift_bridgeObjectRelease();
    unint64_t v42 = 0xD000000000000029;
    unint64_t v43 = 0x800000021520EF00;
    sub_2151F9768();
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    sub_2151F9E68();
    v21(v22, v41, v5);
    sub_2151F9BA8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v22, v5);
    sub_2151F9E68();
    swift_bridgeObjectRelease();
    sub_2151F9E68();
    uint64_t v28 = v40;
    uint64_t v30 = v36;
    uint64_t v29 = v37;
    (*(void (**)(char *, void, uint64_t))(v40 + 104))(v36, *MEMORY[0x263F36CE0], v37);
    sub_2151F9C68();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v19, v35);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  if (*(unsigned char *)(v1 + 136) == 1 && *(_OWORD *)(v1 + 120) >= 2uLL)
  {
    swift_beginAccess();
    sub_2151F98D8();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_2151F5F74(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v9 = a3 & 1;
  uint64_t v10 = sub_2151F9D58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void *)(v5 + 120);
  if (*(unsigned char *)(v5 + 136))
  {
    if (!v9) {
      goto LABEL_14;
    }
    if (!(a1 | a2)) {
      goto LABEL_9;
    }
  }
  else
  {
    if (!v9)
    {
      if (v14 == a1)
      {
        if (*(void *)(v5 + 128) >= a2) {
          goto LABEL_9;
        }
      }
      else if ((uint64_t)v14 <= a1)
      {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
    unint64_t v14 = 3;
    if (!(a1 | a2))
    {
LABEL_9:
      __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), *(void *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24));
      uint64_t v23 = 0;
      unint64_t v24 = 0xE000000000000000;
      sub_2151FA038();
      uint64_t v26 = v23;
      unint64_t v27 = v24;
      sub_2151F9E68();
      uint64_t v23 = a1;
      unint64_t v24 = a2;
      BOOL v25 = v9 != 0;
      sub_2151FA0B8();
      (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F36CE0], v10);
      sub_2151F9C58();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
  if (a1 ^ 1 | a2)
  {
    if (v14 >= 2) {
      goto LABEL_9;
    }
  }
  else if (v14)
  {
    goto LABEL_9;
  }
LABEL_14:
  BOOL v21 = v9 != 0;
  uint64_t v16 = *(void *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24);
  void v20[2] = *(void *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 32);
  v20[1] = __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), v16);
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  uint64_t v22 = a4;
  sub_2151FA038();
  uint64_t v26 = v23;
  unint64_t v27 = v24;
  sub_2151F9E68();
  uint64_t v23 = a1;
  unint64_t v24 = a2;
  BOOL v25 = v9 != 0;
  sub_2151FA0B8();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F36CE0], v10);
  sub_2151F9C58();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v17 = v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  swift_beginAccess();
  uint64_t v18 = sub_2151F9BB8();
  uint64_t v19 = v22;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v17, v22, v18);
  swift_endAccess();
  *(void *)(v5 + 120) = a1;
  *(void *)(v5 + 128) = a2;
  *(unsigned char *)(v5 + 136) = v21;
  sub_2151F5A48();
  return sub_2151F6338(v19, a1, a2);
}

uint64_t sub_2151F6338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = a3;
  uint64_t v41 = a2;
  uint64_t v4 = sub_2151F9B38();
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_2151F96C8();
  uint64_t v6 = *(void *)(v44 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v44);
  uint64_t v37 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = sub_2151F9778();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2151F9BB8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v18, v15);
  if (v19 == *MEMORY[0x263F36C90])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v18, v15);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v18, v11);
    sub_2151F9768();
    sub_2151F96A8();
    uint64_t v26 = (void **)(v43 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
    swift_beginAccess();
    unint64_t v27 = *v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v26 = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v27 = (void *)sub_2151C7214(0, v27[2] + 1, 1, v27);
      *uint64_t v26 = v27;
    }
    unint64_t v30 = v27[2];
    unint64_t v29 = v27[3];
    if (v30 >= v29 >> 1)
    {
      unint64_t v27 = (void *)sub_2151C7214(v29 > 1, v30 + 1, 1, v27);
      *uint64_t v26 = v27;
    }
    v27[2] = v30 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))((unint64_t)v27+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v30, v10, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else if (v19 == *MEMORY[0x263F36C88])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v18, v15);
    BOOL v21 = v38;
    uint64_t v20 = v39;
    uint64_t v22 = v18;
    uint64_t v23 = v40;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v38, v22, v40);
    unint64_t v24 = v37;
    sub_2151F9B28();
    sub_2151F96A8();
    uint64_t v31 = (void **)(v43 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
    swift_beginAccess();
    uint64_t v32 = *v31;
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v31 = v32;
    if ((v33 & 1) == 0)
    {
      uint64_t v32 = (void *)sub_2151C7214(0, v32[2] + 1, 1, v32);
      *uint64_t v31 = v32;
    }
    unint64_t v35 = v32[2];
    unint64_t v34 = v32[3];
    if (v35 >= v34 >> 1)
    {
      uint64_t v32 = (void *)sub_2151C7214(v34 > 1, v35 + 1, 1, v32);
      *uint64_t v31 = v32;
    }
    v32[2] = v35 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))((unint64_t)v32+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v35, v24, v44);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v21, v23);
  }
  else
  {
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t sub_2151F69E8()
{
  return sub_2151F6A28(MEMORY[0x263F36B18], 0x800000021520EE50, 1);
}

uint64_t sub_2151F6A08()
{
  return sub_2151F6A28(MEMORY[0x263F36B20], 0x800000021520EE20, 2);
}

uint64_t sub_2151F6A28(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  BOOL v21 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2151F9638();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2151F9BB8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *v21, v6);
  sub_2151F9BD8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_2151F9BA8();
  uint64_t v17 = sub_2151FA068();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
  sub_2151F9B98();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  sub_2151F5F74(v23, 0, 1, (uint64_t)v16);
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v10);
}

uint64_t sub_2151F6CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = sub_2151F96C8();
  uint64_t v42 = *(void *)(v36 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v36);
  unint64_t v34 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v35 = (char *)&v33 - v7;
  uint64_t v8 = sub_2151F9D58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger);
  uint64_t v13 = *(void *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24);
  uint64_t v43 = *(void *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), v13);
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  sub_2151FA038();
  sub_2151F9E68();
  sub_2151F9E68();
  unint64_t v14 = *(void (**)(void))(v9 + 104);
  unsigned int v38 = *MEMORY[0x263F36CE0];
  uint64_t v39 = v9 + 104;
  uint64_t v37 = (void (*)(char *, void, uint64_t))v14;
  v14(v11);
  sub_2151F9C68();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v40 = v11;
  uint64_t v41 = v9 + 8;
  uint64_t v43 = v8;
  v15(v11, v8);
  uint64_t v16 = (char **)((char *)v44 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  uint64_t v17 = *v16;
  uint64_t v18 = *((void *)*v16 + 2);
  if (!v18)
  {
LABEL_10:
    __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    unint64_t v45 = 0;
    unint64_t v46 = 0xE000000000000000;
    sub_2151FA038();
    swift_bridgeObjectRelease();
    unint64_t v45 = 0xD000000000000027;
    unint64_t v46 = 0x800000021520EDF0;
    sub_2151F9E68();
    BOOL v25 = v40;
    uint64_t v26 = v43;
    v37(v40, v38, v43);
    sub_2151F9C88();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v15)(v25, v26);
  }
  uint64_t v44 = (uint64_t *)v16;
  char v33 = v15;
  unint64_t v19 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v20 = *(void *)(v42 + 72);
  swift_bridgeObjectRetain();
  unint64_t v21 = 0;
  while (1)
  {
    uint64_t v23 = sub_2151F9698();
    if (!v24) {
      goto LABEL_4;
    }
    if (v23 == a1 && v24 == a2) {
      break;
    }
    char v22 = sub_2151FA148();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_11;
    }
LABEL_4:
    ++v21;
    v19 += v20;
    if (v18 == v21)
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = v33;
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRelease();
  uint64_t v28 = v42;
  unint64_t v29 = v44;
  uint64_t v31 = v35;
  uint64_t v30 = v36;
  if (v21 >= *(void *)(*v44 + 16))
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v32 = v34;
  (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v34, *v44 + v19, v36);
  sub_2151F96B8();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v30);
  swift_beginAccess();
  uint64_t v17 = (char *)*v29;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v29 = (uint64_t)v17;
  if ((result & 1) == 0)
  {
LABEL_17:
    uint64_t result = sub_2151F7D40(v17);
    uint64_t v17 = (char *)result;
    *unint64_t v29 = result;
  }
  if (v21 >= *((void *)v17 + 2))
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 40))(&v17[v19], v31, v30);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_2151F71A4(uint64_t a1, char a2)
{
  uint64_t v5 = sub_2151F97E8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v11 = (void *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v12 = v6 + 16;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v12 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 64));
    uint64_t v33 = *(void *)(v12 + 56);
    unint64_t v34 = v13;
    int v32 = a2 & 1;
    v30[1] = a1;
    uint64_t v31 = (void (**)(char *, uint64_t))(v12 - 8);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v15 = v12;
      v34(v9, v14, v5);
      swift_beginAccess();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v35 = (void *)*v11;
      uint64_t v17 = v35;
      *uint64_t v11 = 0x8000000000000000;
      unint64_t v19 = sub_2151C752C((uint64_t)v9);
      uint64_t v20 = v17[2];
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        break;
      }
      char v23 = v18;
      if (v17[3] >= v22)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_2151CA234();
        }
      }
      else
      {
        sub_2151C8610(v22, isUniquelyReferenced_nonNull_native);
        unint64_t v24 = sub_2151C752C((uint64_t)v9);
        if ((v23 & 1) != (v25 & 1)) {
          goto LABEL_18;
        }
        unint64_t v19 = v24;
      }
      uint64_t v12 = v15;
      uint64_t v26 = v35;
      if (v23)
      {
        *(unsigned char *)(v35[7] + v19) = v32;
      }
      else
      {
        v35[(v19 >> 6) + 8] |= 1 << v19;
        v34((char *)(v26[6] + v19 * v33), (uint64_t)v9, v5);
        *(unsigned char *)(v26[7] + v19) = v32;
        uint64_t v27 = v26[2];
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_17;
        }
        long long v26[2] = v29;
      }
      *uint64_t v11 = v26;
      swift_bridgeObjectRelease();
      (*v31)(v9, v5);
      swift_endAccess();
      v14 += v33;
      if (!--v10) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    uint64_t result = sub_2151FA168();
    __break(1u);
  }
  return result;
}

uint64_t sub_2151F7448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2151F7C74(a1, (uint64_t)v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 5, v12))
  {
    case 1u:
      swift_beginAccess();
      sub_2151F9908();
      goto LABEL_8;
    case 2u:
      swift_beginAccess();
      sub_2151F98D8();
      goto LABEL_8;
    case 3u:
      swift_beginAccess();
      sub_2151F9918();
      goto LABEL_8;
    case 4u:
      swift_beginAccess();
      sub_2151F9928();
      goto LABEL_8;
    case 5u:
      swift_beginAccess();
      sub_2151F98F8();
LABEL_8:
      swift_endAccess();
      break;
    default:
      sub_2151F7CD8((uint64_t)v11, (uint64_t)v8);
      swift_beginAccess();
      sub_2151F98E8();
      swift_endAccess();
      sub_2151CEA98((uint64_t)v8, &qword_2678657C0);
      break;
  }
  uint64_t v13 = v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  uint64_t v14 = sub_2151F99D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, v13, v14);
}

uint64_t sub_2151F76FC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  uint64_t v2 = sub_2151F9BB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  uint64_t v4 = sub_2151F99D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger);

  swift_bridgeObjectRelease();
  sub_2151CE5F0(v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_delegate);
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_2151F780C()
{
  return type metadata accessor for ODISessionStateMachine(0);
}

uint64_t type metadata accessor for ODISessionStateMachine(uint64_t a1)
{
  return sub_2151ED090(a1, (uint64_t *)&unk_267865888);
}

uint64_t sub_2151F7834()
{
  uint64_t result = sub_2151F9BB8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2151F99D8();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for State(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for State(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_2151F79BC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2151F79D8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for State()
{
  return &type metadata for State;
}

uint64_t getEnumTagSinglePayload for DeviceDataOrigin(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeviceDataOrigin(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x2151F7B64);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_2151F7B8C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DeviceDataOrigin()
{
  return &type metadata for DeviceDataOrigin;
}

unint64_t sub_2151F7BA8()
{
  unint64_t result = qword_267865898;
  if (!qword_267865898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267865898);
  }
  return result;
}

unint64_t sub_2151F7C00()
{
  unint64_t result = qword_2678658A0;
  if (!qword_2678658A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2678658A0);
  }
  return result;
}

uint64_t type metadata accessor for ODISessionStateMachine.ApplyTimingCase(uint64_t a1)
{
  return sub_2151ED090(a1, (uint64_t *)&unk_2678658A8);
}

uint64_t sub_2151F7C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2151F7CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

size_t sub_2151F7D40(void *a1)
{
  return sub_2151C7214(0, a1[2], 0, a1);
}

uint64_t sub_2151F7D54(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v40 = a3;
  unint64_t v35 = a2;
  uint64_t v46 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v43 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2151F9BB8();
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v41 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v31 - v10;
  uint64_t v11 = sub_2151F9BE8();
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v37 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2151F9638();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(unsigned char *)(v3 + 112) = 0;
  *(void *)(v3 + 120) = 0;
  *(void *)(v3 + 128) = 0;
  *(unsigned char *)(v3 + 136) = 1;
  *(void *)(v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTriggered) = 0;
  sub_2151F99C8();
  uint64_t v17 = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267865298);
  sub_2151F96C8();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2151FB290;
  unsigned int v34 = *MEMORY[0x263F36B30];
  uint64_t v33 = *(void (**)(char *))(v14 + 104);
  v33(v16);
  sub_2151F9628();
  int v32 = *(void (**)(char *, uint64_t))(v14 + 8);
  v32(v16, v13);
  unint64_t v36 = 0x800000021520E910;
  sub_2151F96A8();
  *(void *)(v3 + v17) = v18;
  swift_unknownObjectWeakInit();
  sub_2151CC6F4(v46, v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger);
  swift_unknownObjectWeakAssign();
  unint64_t v19 = (objc_class *)type metadata accessor for ODIPartialAssessmentInitiator();
  uint64_t v20 = (char *)objc_allocWithZone(v19);
  BOOL v21 = v35;
  *(void *)&v20[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID] = v35;
  sub_2151F9E28();
  id v22 = v21;
  char v23 = v20;
  unint64_t v24 = v37;
  sub_2151F9BC8();
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v23[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter], v24, v39);

  v47.receiver = v23;
  v47.super_class = v19;
  *(void *)(v4 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_initiator) = objc_msgSendSuper2(&v47, sel_init);
  ((void (*)(char *, void, uint64_t))v33)(v16, v34, v13);
  char v25 = v41;
  sub_2151F9BD8();
  v32(v16, v13);
  sub_2151F9BA8();
  uint64_t v26 = sub_2151FA068();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v43, 1, 1, v26);
  uint64_t v27 = v42;
  sub_2151F9B98();
  uint64_t v29 = v44;
  uint64_t v28 = v45;
  (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v45);
  __swift_destroy_boxed_opaque_existential_1(v46);
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v4 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment, v27, v28);
  return v4;
}

uint64_t *sub_2151F82F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 5, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_2151FA068();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v10);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 5, v7);
    }
  }
  return a1;
}

uint64_t sub_2151F8504(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 5, v2);
  if (!result)
  {
    uint64_t v4 = sub_2151FA068();
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v4);
    if (!result)
    {
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
      return v5(a1, v4);
    }
  }
  return result;
}

void *sub_2151F8618(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 5, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_2151FA068();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  }
  return a1;
}

void *sub_2151F87EC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 5, v6);
  int v10 = v8(a2, 5, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v15 = sub_2151FA068();
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
      int v18 = v17(a1, 1, v15);
      int v19 = v17(a2, 1, v15);
      if (v18)
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 16))(a1, a2, v15);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
          return a1;
        }
      }
      else
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 24))(a1, a2, v15);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v16 + 8))(a1, v15);
      }
      size_t v14 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0) - 8) + 64);
      goto LABEL_8;
    }
    sub_2151CEA98((uint64_t)a1, &qword_267865668);
LABEL_7:
    size_t v14 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v14);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = sub_2151FA068();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v12 + 16))(a1, a2, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  return a1;
}

void *sub_2151F8B30(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 5, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_2151FA068();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  }
  return a1;
}

void *sub_2151F8D04(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 5, v6);
  int v10 = v8(a2, 5, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v15 = sub_2151FA068();
      uint64_t v16 = *(void *)(v15 - 8);
      uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
      int v18 = v17(a1, 1, v15);
      int v19 = v17(a2, 1, v15);
      if (v18)
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 32))(a1, a2, v15);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
          return a1;
        }
      }
      else
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 40))(a1, a2, v15);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v16 + 8))(a1, v15);
      }
      size_t v14 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0) - 8) + 64);
      goto LABEL_8;
    }
    sub_2151CEA98((uint64_t)a1, &qword_267865668);
LABEL_7:
    size_t v14 = *(void *)(*(void *)(a3 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v14);
    return a1;
  }
  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = sub_2151FA068();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678657C0);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v12 + 32))(a1, a2, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  return a1;
}

uint64_t sub_2151F9048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2151F905C);
}

uint64_t sub_2151F905C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 6) {
    return v5 - 5;
  }
  else {
    return 0;
  }
}

uint64_t sub_2151F90CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2151F90E0);
}

uint64_t sub_2151F90E0(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 5);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_2151F9168(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 5, v2);
}

uint64_t sub_2151F91D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267865668);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 5, v4);
}

void sub_2151F9248()
{
  sub_2151F92C0();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataSinglePayload();
  }
}

void sub_2151F92C0()
{
  if (!qword_2678658B8)
  {
    sub_2151FA068();
    unint64_t v0 = sub_2151F9FC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2678658B8);
    }
  }
}

uint64_t sub_2151F9408()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2151F9418()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2151F9428()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2151F9438()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2151F9448()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2151F9458()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2151F9468()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2151F9478()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2151F9488()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2151F9498()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2151F94A8()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2151F94B8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2151F94C8()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2151F94D8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2151F94E8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2151F94F8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2151F9508()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2151F9518()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2151F9528()
{
  return MEMORY[0x270F1B0D0]();
}

uint64_t sub_2151F9538()
{
  return MEMORY[0x270F1B0D8]();
}

uint64_t sub_2151F9548()
{
  return MEMORY[0x270F1B0E0]();
}

uint64_t sub_2151F9558()
{
  return MEMORY[0x270F1B0E8]();
}

uint64_t sub_2151F9568()
{
  return MEMORY[0x270F1B0F0]();
}

uint64_t sub_2151F9578()
{
  return MEMORY[0x270F1B0F8]();
}

uint64_t sub_2151F9588()
{
  return MEMORY[0x270F1B100]();
}

uint64_t sub_2151F9598()
{
  return MEMORY[0x270F1B108]();
}

uint64_t sub_2151F95A8()
{
  return MEMORY[0x270F1B110]();
}

uint64_t sub_2151F95B8()
{
  return MEMORY[0x270F1B118]();
}

uint64_t sub_2151F95C8()
{
  return MEMORY[0x270F1B120]();
}

uint64_t sub_2151F95E8()
{
  return MEMORY[0x270F1B130]();
}

uint64_t sub_2151F95F8()
{
  return MEMORY[0x270F1B138]();
}

uint64_t sub_2151F9608()
{
  return MEMORY[0x270F1B140]();
}

uint64_t sub_2151F9618()
{
  return MEMORY[0x270F1B148]();
}

uint64_t sub_2151F9628()
{
  return MEMORY[0x270F1B150]();
}

uint64_t sub_2151F9638()
{
  return MEMORY[0x270F1B158]();
}

uint64_t sub_2151F9658()
{
  return MEMORY[0x270F1B168]();
}

uint64_t sub_2151F9668()
{
  return MEMORY[0x270F1B170]();
}

uint64_t sub_2151F9678()
{
  return MEMORY[0x270F1B178]();
}

uint64_t sub_2151F9688()
{
  return MEMORY[0x270F1B180]();
}

uint64_t sub_2151F9698()
{
  return MEMORY[0x270F1B188]();
}

uint64_t sub_2151F96A8()
{
  return MEMORY[0x270F1B190]();
}

uint64_t sub_2151F96B8()
{
  return MEMORY[0x270F1B198]();
}

uint64_t sub_2151F96C8()
{
  return MEMORY[0x270F1B1A0]();
}

uint64_t sub_2151F96D8()
{
  return MEMORY[0x270F1B1A8]();
}

uint64_t sub_2151F96E8()
{
  return MEMORY[0x270F1B1B0]();
}

uint64_t sub_2151F96F8()
{
  return MEMORY[0x270F1B1B8]();
}

uint64_t sub_2151F9708()
{
  return MEMORY[0x270F1B1C0]();
}

uint64_t sub_2151F9718()
{
  return MEMORY[0x270F1B1C8]();
}

uint64_t sub_2151F9728()
{
  return MEMORY[0x270F1B1D0]();
}

uint64_t sub_2151F9738()
{
  return MEMORY[0x270F1B1D8]();
}

uint64_t sub_2151F9748()
{
  return MEMORY[0x270F1B1E0]();
}

uint64_t sub_2151F9758()
{
  return MEMORY[0x270F1B1E8]();
}

uint64_t sub_2151F9768()
{
  return MEMORY[0x270F1B1F0]();
}

uint64_t sub_2151F9778()
{
  return MEMORY[0x270F1B1F8]();
}

uint64_t sub_2151F9788()
{
  return MEMORY[0x270F1B200]();
}

uint64_t sub_2151F9798()
{
  return MEMORY[0x270F1B208]();
}

uint64_t sub_2151F97A8()
{
  return MEMORY[0x270F1B210]();
}

uint64_t sub_2151F97B8()
{
  return MEMORY[0x270F1B218]();
}

uint64_t sub_2151F97C8()
{
  return MEMORY[0x270F1B220]();
}

uint64_t sub_2151F97D8()
{
  return MEMORY[0x270F1B228]();
}

uint64_t sub_2151F97E8()
{
  return MEMORY[0x270F1B230]();
}

uint64_t sub_2151F97F8()
{
  return MEMORY[0x270F1B238]();
}

uint64_t sub_2151F9808()
{
  return MEMORY[0x270F1B240]();
}

uint64_t sub_2151F9818()
{
  return MEMORY[0x270F1B248]();
}

uint64_t sub_2151F9828()
{
  return MEMORY[0x270F1B250]();
}

uint64_t sub_2151F9838()
{
  return MEMORY[0x270F1B258]();
}

uint64_t sub_2151F9848()
{
  return MEMORY[0x270F1B260]();
}

uint64_t sub_2151F9858()
{
  return MEMORY[0x270F1B268]();
}

uint64_t sub_2151F9868()
{
  return MEMORY[0x270F1B270]();
}

uint64_t sub_2151F9878()
{
  return MEMORY[0x270F1B278]();
}

uint64_t sub_2151F9888()
{
  return MEMORY[0x270F1B280]();
}

uint64_t sub_2151F9898()
{
  return MEMORY[0x270F1B288]();
}

uint64_t sub_2151F98A8()
{
  return MEMORY[0x270F1B290]();
}

uint64_t sub_2151F98B8()
{
  return MEMORY[0x270F1B298]();
}

uint64_t sub_2151F98C8()
{
  return MEMORY[0x270F1B2A0]();
}

uint64_t sub_2151F98D8()
{
  return MEMORY[0x270F1B2A8]();
}

uint64_t sub_2151F98E8()
{
  return MEMORY[0x270F1B2B0]();
}

uint64_t sub_2151F98F8()
{
  return MEMORY[0x270F1B2B8]();
}

uint64_t sub_2151F9908()
{
  return MEMORY[0x270F1B2C0]();
}

uint64_t sub_2151F9918()
{
  return MEMORY[0x270F1B2C8]();
}

uint64_t sub_2151F9928()
{
  return MEMORY[0x270F1B2D0]();
}

uint64_t sub_2151F9938()
{
  return MEMORY[0x270F1B2D8]();
}

uint64_t sub_2151F9948()
{
  return MEMORY[0x270F1B2E0]();
}

uint64_t sub_2151F9958()
{
  return MEMORY[0x270F1B2E8]();
}

uint64_t sub_2151F9968()
{
  return MEMORY[0x270F1B2F0]();
}

uint64_t sub_2151F9978()
{
  return MEMORY[0x270F1B2F8]();
}

uint64_t sub_2151F9988()
{
  return MEMORY[0x270F1B300]();
}

uint64_t sub_2151F9998()
{
  return MEMORY[0x270F1B308]();
}

uint64_t sub_2151F99A8()
{
  return MEMORY[0x270F1B310]();
}

uint64_t sub_2151F99B8()
{
  return MEMORY[0x270F1B318]();
}

uint64_t sub_2151F99C8()
{
  return MEMORY[0x270F1B320]();
}

uint64_t sub_2151F99D8()
{
  return MEMORY[0x270F1B328]();
}

uint64_t sub_2151F99E8()
{
  return MEMORY[0x270F1B330]();
}

uint64_t sub_2151F99F8()
{
  return MEMORY[0x270F1B338]();
}

uint64_t sub_2151F9A08()
{
  return MEMORY[0x270F1B340]();
}

uint64_t sub_2151F9A18()
{
  return MEMORY[0x270F1B348]();
}

uint64_t sub_2151F9A28()
{
  return MEMORY[0x270F1B350]();
}

uint64_t sub_2151F9A38()
{
  return MEMORY[0x270F1B358]();
}

uint64_t sub_2151F9A48()
{
  return MEMORY[0x270F1B360]();
}

uint64_t sub_2151F9A58()
{
  return MEMORY[0x270F1B368]();
}

uint64_t sub_2151F9A78()
{
  return MEMORY[0x270F1B378]();
}

uint64_t sub_2151F9A88()
{
  return MEMORY[0x270F1B380]();
}

uint64_t sub_2151F9A98()
{
  return MEMORY[0x270F1B388]();
}

uint64_t sub_2151F9AA8()
{
  return MEMORY[0x270F1B390]();
}

uint64_t sub_2151F9AB8()
{
  return MEMORY[0x270F1B398]();
}

uint64_t sub_2151F9AC8()
{
  return MEMORY[0x270F1B3A0]();
}

uint64_t sub_2151F9AD8()
{
  return MEMORY[0x270F1B3A8]();
}

uint64_t sub_2151F9AE8()
{
  return MEMORY[0x270F1B3B0]();
}

uint64_t sub_2151F9AF8()
{
  return MEMORY[0x270F1B3B8]();
}

uint64_t sub_2151F9B08()
{
  return MEMORY[0x270F1B3C0]();
}

uint64_t sub_2151F9B18()
{
  return MEMORY[0x270F1B3C8]();
}

uint64_t sub_2151F9B28()
{
  return MEMORY[0x270F1B3D0]();
}

uint64_t sub_2151F9B38()
{
  return MEMORY[0x270F1B3D8]();
}

uint64_t sub_2151F9B48()
{
  return MEMORY[0x270F1B3E0]();
}

uint64_t sub_2151F9B58()
{
  return MEMORY[0x270F1B3E8]();
}

uint64_t sub_2151F9B68()
{
  return MEMORY[0x270F1B3F0]();
}

uint64_t sub_2151F9B78()
{
  return MEMORY[0x270F1B3F8]();
}

uint64_t sub_2151F9B88()
{
  return MEMORY[0x270F1B400]();
}

uint64_t sub_2151F9B98()
{
  return MEMORY[0x270F1B408]();
}

uint64_t sub_2151F9BA8()
{
  return MEMORY[0x270F1B410]();
}

uint64_t sub_2151F9BB8()
{
  return MEMORY[0x270F1B418]();
}

uint64_t sub_2151F9BC8()
{
  return MEMORY[0x270F1B420]();
}

uint64_t sub_2151F9BD8()
{
  return MEMORY[0x270F1B428]();
}

uint64_t sub_2151F9BE8()
{
  return MEMORY[0x270F1B430]();
}

uint64_t sub_2151F9BF8()
{
  return MEMORY[0x270F1B438]();
}

uint64_t sub_2151F9C08()
{
  return MEMORY[0x270F1B440]();
}

uint64_t sub_2151F9C18()
{
  return MEMORY[0x270F1B448]();
}

uint64_t sub_2151F9C28()
{
  return MEMORY[0x270F1B450]();
}

uint64_t sub_2151F9C38()
{
  return MEMORY[0x270F1B458]();
}

uint64_t sub_2151F9C48()
{
  return MEMORY[0x270F1B460]();
}

uint64_t sub_2151F9C58()
{
  return MEMORY[0x270F1B468]();
}

uint64_t sub_2151F9C68()
{
  return MEMORY[0x270F1B470]();
}

uint64_t sub_2151F9C78()
{
  return MEMORY[0x270F1B478]();
}

uint64_t sub_2151F9C88()
{
  return MEMORY[0x270F1B480]();
}

uint64_t sub_2151F9C98()
{
  return MEMORY[0x270F1B488]();
}

uint64_t sub_2151F9CA8()
{
  return MEMORY[0x270F1B490]();
}

uint64_t sub_2151F9CB8()
{
  return MEMORY[0x270F1B498]();
}

uint64_t sub_2151F9CC8()
{
  return MEMORY[0x270F1B4A0]();
}

uint64_t sub_2151F9CD8()
{
  return MEMORY[0x270F1B4A8]();
}

uint64_t sub_2151F9CE8()
{
  return MEMORY[0x270F1B4B0]();
}

uint64_t sub_2151F9CF8()
{
  return MEMORY[0x270F1B4B8]();
}

uint64_t sub_2151F9D08()
{
  return MEMORY[0x270F1B4C0]();
}

uint64_t sub_2151F9D18()
{
  return MEMORY[0x270F1B4C8]();
}

uint64_t sub_2151F9D28()
{
  return MEMORY[0x270F1B4D0]();
}

uint64_t sub_2151F9D38()
{
  return MEMORY[0x270F1B4D8]();
}

uint64_t sub_2151F9D48()
{
  return MEMORY[0x270F1B4E0]();
}

uint64_t sub_2151F9D58()
{
  return MEMORY[0x270F1B4E8]();
}

uint64_t sub_2151F9D68()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2151F9D78()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_2151F9D88()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2151F9D98()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2151F9DA8()
{
  return MEMORY[0x270F1B4F0]();
}

uint64_t sub_2151F9DB8()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_2151F9DC8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2151F9DD8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2151F9DE8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2151F9DF8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2151F9E08()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2151F9E18()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2151F9E28()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2151F9E38()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2151F9E48()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2151F9E58()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2151F9E68()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2151F9E78()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2151F9E88()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2151F9E98()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2151F9EA8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2151F9EB8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2151F9EC8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2151F9ED8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2151F9EE8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2151F9EF8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2151F9F08()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2151F9F18()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2151F9F38()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2151F9F58()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2151F9F88()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_2151F9F98()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2151F9FA8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2151F9FB8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2151F9FC8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2151F9FD8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2151F9FE8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2151F9FF8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2151FA008()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2151FA018()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2151FA028()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2151FA038()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2151FA048()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2151FA058()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2151FA068()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2151FA078()
{
  return MEMORY[0x270FA21D0]();
}

uint64_t sub_2151FA088()
{
  return MEMORY[0x270FA21E0]();
}

uint64_t sub_2151FA098()
{
  return MEMORY[0x270FA21F8]();
}

uint64_t sub_2151FA0A8()
{
  return MEMORY[0x270FA2208]();
}

uint64_t sub_2151FA0B8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2151FA0C8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2151FA0D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2151FA0E8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2151FA108()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2151FA148()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2151FA158()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2151FA168()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2151FA178()
{
  return MEMORY[0x270FA23A0]();
}

uint64_t sub_2151FA188()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2151FA198()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2151FA1A8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2151FA1B8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}